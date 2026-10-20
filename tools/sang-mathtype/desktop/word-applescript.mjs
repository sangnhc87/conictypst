// Điều khiển Word Mac bằng AppleScript: chèn hình công thức kèm mã nguồn (alt text), đọc / thay hình trong tài liệu.
// Mỗi Apple event gửi tới Word mất vài chục ms và chạy trên luồng giao diện của Word, nên mọi thao tác đều gom
// vào MỘT lần gọi osascript và dùng ít lệnh nhất có thể.
import { execFile, execFileSync, spawn } from 'node:child_process'
import { mkdirSync, writeFileSync, rmSync } from 'node:fs'
import { crc32 } from 'node:zlib'
import { homedir, tmpdir } from 'node:os'
import { readScript, parseRead, buildApply, finishApply } from './word-tools.mjs'
import path from 'node:path'

// Word chạy trong sandbox: chỉ đọc được file nằm trong container của nó mà không hỏi quyền.
const SHARE = path.join(homedir(), 'Library/Containers/com.microsoft.Word/Data/Documents/SangMath')

// Thay hình tại vị trí pos (1 ký tự) bằng hình mới; hình có kích thước tự nhiên đúng (PNG có pHYs 576 PPI, SVG theo pt)
// nên không cần đặt width/height. argv: [file, alt, pos, descent*100] lặp lại; mode đầu: "insert" | "replace" | "many".
const SCRIPT = `
on run argv
  set mode to item 1 of argv
  tell application "Microsoft Word"
    set d to active document
    if mode is "many" then
      repeat with k from 0 to ((count of argv) - 1) div 4 - 1
        set b to 2 + k * 4
        my putPicture(d, item b of argv, item (b + 1) of argv, (item (b + 2) of argv) as integer, ((item (b + 3) of argv) as integer) / 100, true)
      end repeat
    else
      set p to start of content of (text object of selection)
      my putPicture(d, item 2 of argv, item 3 of argv, p, ((item 5 of argv) as integer) / 100, (mode is "replace"))
      if mode is "replace" then
        select (create range d start p end (p + 1))
      else
        select (create range d start (p + 1) end (p + 1))
      end if
      activate
    end if
  end tell
end run

on putPicture(d, f, altText, p, dn, replacing)
  tell application "Microsoft Word"
    if replacing then
      try
        delete inline shape 1 of (create range d start p end (p + 1))
      end try
    end if
    make new inline picture at (create range d start p end p) with properties {file name:f}
    set rg to create range d start p end (p + 1)
    set alternative text of inline shape 1 of rg to altText
    set font position of font object of rg to (0 - dn)
  end tell
end putPicture`

const READ = `
tell application "Microsoft Word"
  try
    set sel to selection
    if (count of inline shapes of sel) is 0 then return ""
    return alternative text of inline shape 1 of sel
  on error
    return ""
  end try
end tell`

// Như READ, nhưng nếu chưa chọn hình mà con trỏ đứng sát một công thức (trước/sau) thì chọn luôn công thức đó.
const READ_NEAR = `
tell application "Microsoft Word"
  try
    set sel to selection
    if (count of inline shapes of sel) > 0 then return alternative text of inline shape 1 of sel
    set d to active document
    set p to start of content of (text object of sel)
    repeat with spanRange in {{p - 1, p}, {p, p + 1}}
      if (item 1 of spanRange) >= 0 then
        try
          set rg to create range d start (item 1 of spanRange) end (item 2 of spanRange)
          set a to alternative text of inline shape 1 of rg
          if a starts with "SMATH1:" then
            select inline shape 1 of rg
            return a
          end if
        end try
      end if
    end repeat
    return ""
  on error
    return ""
  end try
end tell`

const LIST = `
on run argv
  tell application "Microsoft Word"
    if (count of documents) is 0 then return ""
    if (item 1 of argv) is "sel" then
      set shapesList to inline shapes of selection
    else
      set shapesList to inline shapes of active document
    end if
    set out to ""
    repeat with s in shapesList
      set a to alternative text of s
      if a starts with "SMATH1:" then set out to out & (start of content of (text object of s)) & tab & a & linefeed
    end repeat
    return out
  end tell
end run`

const wordRunning = () => {
  try { execFileSync('pgrep', ['-x', 'Microsoft Word']); return true } catch { return false }
}

function osascript(script, args = [], timeout = 30000) {
  return new Promise((resolve, reject) => {
    execFile('osascript', ['-e', script, ...args], { timeout, maxBuffer: 16 * 1024 * 1024 }, (err, stdout, stderr) => {
      if (err) reject(new Error((stderr || err.message).replace(/^.*execution error: /s, '').trim()))
      else resolve(stdout.replace(/\n$/, ''))
    })
  })
}

// Chèn khối pHYs 576 PPI vào PNG để Word hiểu kích thước thật (px / 8 = pt) thay vì coi là 72 PPI.
function withDpi(png, ppi = 576) {
  const ppm = Math.round(ppi / 0.0254)
  const data = Buffer.alloc(9)
  data.writeUInt32BE(ppm, 0); data.writeUInt32BE(ppm, 4); data[8] = 1
  const type = Buffer.from('pHYs')
  const chunk = Buffer.alloc(21)
  chunk.writeUInt32BE(9, 0); type.copy(chunk, 4); data.copy(chunk, 8)
  chunk.writeUInt32BE(crc32(Buffer.concat([type, data])), 17)
  const at = 8 + 25 // chữ ký PNG + khối IHDR
  return Buffer.concat([png.subarray(0, at), chunk, png.subarray(at)])
}

function writeImage(payload, i = 0) {
  mkdirSync(SHARE, { recursive: true })
  const svg = payload.format === 'svg' || payload.format === 'svgn'
  const file = path.join(SHARE, `f${Date.now()}_${i}.${svg ? 'svg' : 'png'}`)
  writeFileSync(file, svg ? payload.svg : withDpi(Buffer.from(payload.png, 'base64')))
  return file
}

const x100 = n => String(Math.round(n * 100))
const need = () => { if (!wordRunning()) throw new Error('Word chưa mở. Hãy mở Word và một tài liệu rồi thử lại.') }

/** payload: { png (base64), svg, descentPt, alt, format: 'svg'|'png' } */
export async function insertFormula(payload, replace = false) {
  need()
  const file = writeImage(payload)
  try {
    await osascript(SCRIPT, [replace ? 'replace' : 'insert', file, payload.alt, '0', x100(Math.round(payload.descentPt * 2) / 2)])
  } finally {
    rmSync(file, { force: true })
  }
}

/** Alt text của hình đang chọn trong Word ('' nếu không có). */
export async function readSelectionAlt(near = false) {
  if (!wordRunning()) return ''
  try { return await osascript(near ? READ_NEAR : READ, [], 8000) } catch { return '' }
}

/** Danh sách công thức Sang Math: [{ pos, alt }], scope: 'doc' | 'sel'. */
export async function listFormulas(scope = 'doc') {
  need()
  const out = await osascript(LIST, [scope])
  return out.split('\n').filter(Boolean).map(line => {
    const tab = line.indexOf('\t')
    return { pos: Number(line.slice(0, tab)), alt: line.slice(tab + 1) }
  })
}

/** Thay nhiều công thức một lượt: items [{ pos, payload }]. */
export async function replaceMany(items) {
  need()
  const files = items.map((it, i) => writeImage(it.payload, i))
  try {
    const args = ['many']
    items.forEach((it, i) => args.push(files[i], it.payload.alt, String(it.pos), x100(Math.round(it.payload.descentPt * 2) / 2)))
    await osascript(SCRIPT, args, 300000)
  } finally {
    for (const f of files) rmSync(f, { force: true })
  }
  return items.length
}

// Theo dõi vùng chọn trong Word bằng MỘT tiến trình osascript chạy nền, không tốn thời gian khởi động mỗi lần.
// Mỗi vòng chỉ hỏi Word 1 câu rất nhẹ (~12 ms: có hình nào đang chọn không); chỉ khi có hình mới đọc alt text.
// Báo qua onChange(alt) khi vùng chọn đổi ('' = không chọn công thức). Trả về hàm dừng.
const WATCH = `
set lastAlt to "~"
repeat
  set cur to ""
  try
    if application "Microsoft Word" is running then
      tell application "Microsoft Word"
        if (count of documents) > 0 then
          if (count of inline shapes of selection) > 0 then set cur to alternative text of inline shape 1 of selection
        end if
      end tell
    end if
  end try
  if cur is not lastAlt then
    set lastAlt to cur
    log "SEL" & tab & cur
  end if
  delay 0.3
end repeat`

export function watchSelection(onChange) {
  let child = null
  let stopped = false
  const start = () => {
    child = spawn('osascript', ['-e', WATCH])
    let buf = ''
    child.stderr.on('data', chunk => {
      buf += chunk.toString()
      let i
      while ((i = buf.indexOf('\n')) >= 0) {
        const line = buf.slice(0, i)
        buf = buf.slice(i + 1)
        if (line.startsWith('SEL\t')) onChange(line.slice(4))
      }
    })
    child.on('exit', () => { if (!stopped) setTimeout(start, 3000) })
  }
  start()
  return () => { stopped = true; child?.kill() }
}

// ---------- Công cụ soạn: đọc đoạn văn, áp thao tác, đọc bảng, đường dẫn tài liệu ----------

// Kịch bản lớn chạy từ tệp (tránh giới hạn độ dài đối số dòng lệnh)
async function runScriptFile(script, timeout = 300000) {
  const f = path.join(tmpdir(), `sm-tools-${Date.now()}-${Math.random().toString(36).slice(2)}.applescript`)
  writeFileSync(f, script, 'utf8')
  try {
    return await new Promise((resolve, reject) => {
      execFile('osascript', [f], { timeout, maxBuffer: 64 * 1024 * 1024 }, (err, stdout, stderr) => {
        if (err) reject(new Error((stderr || err.message).replace(/^.*(execution error|script error): /s, '').trim()))
        else resolve(stdout)
      })
    })
  } finally { rmSync(f, { force: true }) }
}

/** Đọc các đoạn văn: { paras: [chữ], layout: {starts, ends} } (layout dùng lại khi áp thao tác). */
export async function toolsRead(scope = 'doc') {
  need()
  return parseRead(await runScriptFile(readScript(scope), 120000))
}

/** Áp thao tác (cùng định dạng với src/tools/plans.js); trả về { inverse } để hoàn tác. */
export async function toolsApply(ops, layout) {
  need()
  const { script, files, plan } = buildApply(ops, layout, SHARE)
  mkdirSync(SHARE, { recursive: true })
  for (const f of files) writeFileSync(f.file, Buffer.from(f.b64, 'base64'))
  try {
    const out = await runScriptFile(script)
    const { inverse, missing } = finishApply(out, plan)
    return { inverse, missing }
  } finally {
    for (const f of files) rmSync(f.file, { force: true })
  }
}

const TABLES = scope => `
tell application "Microsoft Word"
  if (count of documents) is 0 then error "Chưa mở tài liệu nào trong Word."
  set d to active document
  ${scope === 'sel' ? 'set tl to tables of text object of selection' : 'set tl to tables of d'}
  set sepC to character id 31
  set sepR to character id 30
  set sepT to character id 29
  set out to ""
  repeat with t in tl
    repeat with r from 1 to (count of rows of t)
      repeat with c from 1 to (count of cells of row r of t)
        set v to content of text object of cell c of row r of t
        set out to out & v & sepC
      end repeat
      set out to out & sepR
    end repeat
    set out to out & sepT
  end repeat
  return out
end tell`

/** Các bảng trong tài liệu / vùng chọn: [[hàng[ô]]] */
export async function toolsTables(scope = 'doc') {
  need()
  const raw = await runScriptFile(TABLES(scope), 120000)
  const clean = v => v.replace(/[\r\n\u0007]+$/g, '').replace(/[\r\n]+/g, ' ')
  return raw.split('\x1d').filter(t => t.trim()).map(t => t.split('\x1e').filter(r => r.replace(/[\s\n]/g, '')).map(r => r.split('\x1f').slice(0, -1).map(clean)))
}

/** Đường dẫn tệp của tài liệu đang mở ('' nếu chưa lưu). */
export async function activeDocPath() {
  if (!wordRunning()) return ''
  try { return await osascript('tell application "Microsoft Word" to return full name of active document', [], 8000) } catch { return '' }
}
