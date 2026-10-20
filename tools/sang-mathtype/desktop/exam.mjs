// Mô-đun Đề thi (chạy trong tiến trình chính của app): gọi bộ máy Python trộn đề / làm đẹp, quản lý thư viện đề và cài đặt nhớ sẵn.
import { execFile, spawn } from 'node:child_process'
import { existsSync, mkdirSync, readdirSync, readFileSync, writeFileSync, copyFileSync, statSync } from 'node:fs'
import { homedir } from 'node:os'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const here = path.dirname(fileURLToPath(import.meta.url))
const EXAMD = path.resolve(here, '../exam/examd.py')
export const LIBRARY = process.env.SM_LIBRARY || path.join(homedir(), 'Documents', 'Sang Math', 'Đề thi')
const SETTINGS = path.join(LIBRARY, 'cai-dat.json')

const run = (cmd, args, opts = {}) => new Promise((resolve, reject) => {
  execFile(cmd, args, { timeout: 180000, maxBuffer: 32 * 1024 * 1024, ...opts }, (err, stdout, stderr) => {
    if (err && !stdout) reject(new Error((stderr || err.message).trim()))
    else resolve(stdout)
  })
})

// Python cần có openpyxl (xuất Excel đáp án). App mở từ Finder không có PATH của Terminal nên thử nhiều chỗ quen thuộc.
// Kiểm tra bằng find_spec (không import thật): import openpyxl mất khoảng 3 giây mỗi lần. Chỉ chạy một lần (single-flight).
let pythonPromise = null
export function findPython() {
  if (!pythonPromise) {
    pythonPromise = (async () => {
      const candidates = [
        process.env.SM_PYTHON,
        '/usr/local/bin/python3', '/opt/homebrew/bin/python3', '/Library/Frameworks/Python.framework/Versions/Current/bin/python3',
        path.join(homedir(), '.pyenv/shims/python3'), '/usr/bin/python3',
      ].filter(Boolean)
      const check = "import sys, importlib.util as u; assert sys.version_info >= (3, 9) and u.find_spec('openpyxl')"
      const problems = []
      const tryAll = async list => {
        for (const c of [...new Set(list)]) {
          if (!existsSync(c)) continue
          try { await run(c, ['-c', check], { timeout: 15000 }); return c } catch (e) { problems.push(`${c}: ${String(e.message).split('\n').pop()}`) }
        }
        return null
      }
      let found = await tryAll(candidates)
      if (!found) { // dự phòng: python3 theo shell đăng nhập (chậm hơn nên để sau cùng)
        try { const out = await run('/bin/zsh', ['-lc', 'command -v python3'], { timeout: 8000 }); if (out.trim()) found = await tryAll([out.trim()]) } catch { /* không có */ }
      }
      if (!found) throw new Error(`Không tìm thấy Python 3.9+ có sẵn openpyxl. Hãy chạy: pip3 install openpyxl\n${problems.join('\n')}`)
      return found
    })()
    pythonPromise.catch(() => { pythonPromise = null })
  }
  return pythonPromise
}

// Tiến trình Python chạy nền: nạp thư viện một lần, các lệnh sau trả lời gần như tức thì.
let worker = null
let workerReady = null
const waiting = new Map()
let nextId = 1

function ensureWorker() {
  if (workerReady) return workerReady
  workerReady = (async () => {
    const python = await findPython()
    const child = spawn(python, [EXAMD, 'serve'], { stdio: ['pipe', 'pipe', 'pipe'] })
    let buffer = ''
    child.stdout.on('data', chunk => {
      buffer += chunk.toString()
      let i
      while ((i = buffer.indexOf('\n')) >= 0) {
        const line = buffer.slice(0, i)
        buffer = buffer.slice(i + 1)
        try {
          const msg = JSON.parse(line)
          const w = waiting.get(msg.id)
          if (w) { waiting.delete(msg.id); msg.ok ? w.resolve(msg) : w.reject(new Error(msg.error || 'Bộ máy báo lỗi.')) }
        } catch { /* dòng không phải JSON: bỏ qua */ }
      }
    })
    child.stderr.on('data', () => {}) // không để đầy bộ đệm
    child.on('exit', () => {
      worker = null; workerReady = null
      for (const w of waiting.values()) w.reject(new Error('Tiến trình Python đã dừng, hãy thử lại.'))
      waiting.clear()
    })
    worker = child
    return child
  })()
  workerReady.catch(() => { workerReady = null })
  return workerReady
}

export function warm() { ensureWorker().catch(() => {}) }
export function stop() { try { worker?.kill() } catch { /* đã dừng */ } }

async function examd(args) {
  const child = await ensureWorker()
  return new Promise((resolve, reject) => {
    const id = nextId++
    const timer = setTimeout(() => { waiting.delete(id); reject(new Error('Xử lý quá lâu (hơn 3 phút).')) }, 180000)
    waiting.set(id, { resolve: v => { clearTimeout(timer); resolve(v) }, reject: e => { clearTimeout(timer); reject(e) } })
    child.stdin.write(JSON.stringify({ id, argv: args }) + '\n')
  })
}

export async function env() {
  mkdirSync(LIBRARY, { recursive: true })
  try { return { ok: true, python: await findPython(), library: LIBRARY } } catch (e) { return { ok: false, problem: e.message, library: LIBRARY } }
}

/** Phân tích đề: số câu từng phần và đáp án đã đánh dấu sẵn trong file (đọc bằng chính bộ trộn đề). */
export async function analyze(file) {
  const res = await examd(['analyze', file])
  return { file, name: path.basename(file), count: res.result.count, answers: res.result.answers, answerError: res.result.answer_error }
}

const safe = s => s.replace(/\.docx$/i, '').replace(/[\\/:*?"<>|]/g, '_').trim() || 'DeThi'
const stamp = () => {
  const d = new Date(), z = n => String(n).padStart(2, '0')
  return `${d.getFullYear()}-${z(d.getMonth() + 1)}-${z(d.getDate())}_${z(d.getHours())}h${z(d.getMinutes())}`
}

/** action: 'beautify' | 'shuffle'. Mỗi lần chạy có thư mục riêng trong thư viện, kèm meta.json để chạy lại. */
export async function runAction({ action, source, options = {}, label }) {
  const stem = safe(path.basename(source))
  const examDir = path.join(LIBRARY, stem)
  const gocDir = path.join(examDir, 'goc')
  mkdirSync(gocDir, { recursive: true })
  const copy = path.join(gocDir, path.basename(source))
  if (!existsSync(copy) || statSync(copy).mtimeMs < statSync(source).mtimeMs) copyFileSync(source, copy)
  const runDir = path.join(examDir, `${stamp()}_${label === 'beautify' ? 'lam-dep' : action === 'shuffle' ? 'tron-de' : 'lam-dep'}`)
  const outDir = path.join(runDir, 'ket-qua')
  mkdirSync(outDir, { recursive: true })
  const optionsFile = path.join(runDir, 'tuy-chon.json')
  writeFileSync(optionsFile, JSON.stringify({ source_name: path.basename(source), ...options }, null, 2))
  const t0 = Date.now()
  const result = await examd([action, source, outDir, optionsFile])
  // Người dùng chọn thư mục lưu riêng: chép kết quả sang đó (bản trong thư viện vẫn giữ để dùng lại)
  let finalDir = outDir
  const saveDir = options.save_dir && String(options.save_dir).trim()
  if (saveDir) {
    mkdirSync(saveDir, { recursive: true })
    for (const f of result.files) copyFileSync(path.join(outDir, f), path.join(saveDir, f))
    finalDir = saveDir
  }
  const meta = { action, source: copy, name: stem, createdAt: new Date().toISOString(), seconds: (Date.now() - t0) / 1000, options, files: result.files, dir: runDir }
  writeFileSync(path.join(runDir, 'meta.json'), JSON.stringify(meta, null, 2))
  return { ...meta, outDir: finalDir }
}

/** Danh sách đề trong thư viện kèm các lần chạy, mới nhất trước. */
export function history() {
  mkdirSync(LIBRARY, { recursive: true })
  const exams = []
  for (const name of readdirSync(LIBRARY)) {
    const dir = path.join(LIBRARY, name)
    if (!statSync(dir).isDirectory()) continue
    const runs = []
    for (const r of readdirSync(dir)) {
      const meta = path.join(dir, r, 'meta.json')
      if (existsSync(meta)) { try { runs.push(JSON.parse(readFileSync(meta, 'utf8'))) } catch { /* bỏ qua tệp hỏng */ } }
    }
    if (runs.length) exams.push({ name, dir, runs: runs.sort((a, b) => b.createdAt.localeCompare(a.createdAt)) })
  }
  return exams.sort((a, b) => b.runs[0].createdAt.localeCompare(a.runs[0].createdAt))
}

const DEFAULT_SETTINGS = {
  profiles: [{ ten: 'THPT Nguyễn Hữu Cảnh', so_giao_duc: 'Sở GD&ĐT TP. Hồ Chí Minh', truong: 'THPT Nguyễn Hữu Cảnh', ten_ky_thi: '', mon_thi: 'Toán', thoi_gian: '90 phút' }],
  last: { madelist: '101,102,103,104', keep_original: false, profile: 0, ten_ky_thi: '', mon_thi: 'Toán', thoi_gian: '90 phút' },
}
export function getSettings() {
  try { return { ...DEFAULT_SETTINGS, ...JSON.parse(readFileSync(SETTINGS, 'utf8')) } } catch { return DEFAULT_SETTINGS }
}
export function setSettings(next) {
  mkdirSync(LIBRARY, { recursive: true })
  writeFileSync(SETTINGS, JSON.stringify(next, null, 2))
  return next
}
