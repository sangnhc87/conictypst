// Trộn đề trong add-in (Word Online / Windows / Mac): lấy tài liệu đang mở, chạy bộ máy Python trong Pyodide, mở từng mã đề thành tài liệu mới.
import { showView, registerExam } from './tabs.js'
import { getDocxBytes, openDocx } from './word.js'
import { mountStyleOptions } from './examStyle.js'

const $ = id => document.getElementById(id)
const FIELDS = ['so_giao_duc', 'truong', 'ten_ky_thi', 'mon_thi', 'thoi_gian']
const STORE = 'sangmath.exam.web'
const PART = [['mc', 'Phần I (trắc nghiệm)'], ['tf', 'Phần II (đúng/sai)'], ['sa', 'Phần III (trả lời ngắn)']]

let worker = null
let nextId = 1
const waiting = new Map()
let current = null // { bytes, analysis }
let busy = false
let styleCtl = null

const safe = op => { try { return op() } catch { return null } }

// ---------- worker ----------
export function call(type, payload = {}, transfer = []) {
  if (!worker) {
    worker = new Worker(new URL('exam.worker.js', document.baseURI))
    worker.onmessage = e => {
      const w = waiting.get(e.data.id)
      if (!w) return
      waiting.delete(e.data.id)
      e.data.ok ? w.resolve(e.data.result) : w.reject(new Error(e.data.error))
    }
    worker.onerror = e => { for (const w of waiting.values()) w.reject(new Error(e.message || 'Worker lỗi')); waiting.clear(); worker = null }
  }
  return new Promise((resolve, reject) => {
    const id = nextId++
    waiting.set(id, { resolve, reject })
    worker.postMessage({ id, type, base: new URL('./', document.baseURI).href, ...payload }, transfer)
  })
}

// ---------- giao diện ----------
function status(text, error = false) { const el = $('ewStatus'); el.textContent = text || ''; el.classList.toggle('err', error) }

function setBusy(on) {
  busy = on
  $('ewLoad').disabled = on
  $('ewShuffle').disabled = on || !current
  $('ewBeautify').disabled = on || !current
}

function readForm() {
  const o = { ...(styleCtl ? styleCtl.read() : {}), madelist: $('ewMadelist').value.trim(), keep_original: $('ewKeep').checked }
  for (const f of FIELDS) o[f] = $('ew_' + f).value.trim()
  return o
}

function saveForm() { safe(() => localStorage.setItem(STORE, JSON.stringify(readForm()))) }

function loadForm() {
  const saved = safe(() => JSON.parse(localStorage.getItem(STORE) || '{}')) || {}
  const defaults = { so_giao_duc: 'Sở GD&ĐT TP. Hồ Chí Minh', truong: 'THPT Nguyễn Hữu Cảnh', mon_thi: 'Toán', thoi_gian: '90 phút', madelist: '101,102,103,104' }
  for (const f of FIELDS) $('ew_' + f).value = saved[f] ?? defaults[f] ?? ''
  $('ewMadelist').value = saved.madelist ?? defaults.madelist
  $('ewKeep').checked = !!saved.keep_original
  styleCtl = mountStyleOptions($('ewStyleMount'), saveForm)
  styleCtl.write(saved)
}

function renderAnalysis(a) {
  const info = $('ewInfo')
  info.replaceChildren()
  const c = a.count || {}
  if (c.error) { info.textContent = c.error; return }
  const counts = document.createElement('div')
  counts.className = 'counts-line'
  counts.textContent = `Phần I: ${c.num_questions_part1 || 0} câu · Phần II: ${c.num_questions_part2 || 0} câu · Phần III: ${c.num_questions_part3 || 0} câu`
  info.append(counts)
  if (a.answers) {
    for (const [key, label] of PART) {
      const list = a.answers[key] || []
      if (!list.length) continue
      const got = list.filter(x => String(x).trim()).length
      const row = document.createElement('div'); row.className = 'ans-row'
      const b = document.createElement('b'); b.textContent = label
      const span = document.createElement('span'); span.textContent = `${got}/${list.length} đáp án: ${list.map(x => String(x).trim() || '?').join(' ')}`
      if (got < list.length) {
        span.classList.add('miss')
        const missing = list.map((x, i) => (String(x).trim() ? 0 : i + 1)).filter(Boolean)
        span.textContent += `  — thiếu đáp án ở câu ${missing.join(', ')}`
      }
      row.append(b, span); info.append(row)
    }
  } else if (a.answer_error) {
    const p = document.createElement('div'); p.className = 'miss'; p.textContent = `Chưa đọc được đáp án: ${a.answer_error}`; info.append(p)
  }
}

async function load() {
  if (busy) return
  setBusy(true)
  try {
    status('Đang đọc tài liệu đang mở…')
    const bytes = await getDocxBytes()
    status('Đang nạp bộ máy trộn đề (lần đầu mất vài chục giây, các lần sau nhanh)…')
    const analysis = await call('analyze', { bytes: bytes.slice() })
    current = { bytes, analysis }
    renderAnalysis(analysis)
    status('Đã phân tích. Nhập mã đề rồi bấm Trộn đề.')
  } catch (err) {
    current = null
    status(`Không phân tích được: ${err.message || err}`, true)
  } finally { setBusy(false) }
}

const MIME = { docx: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', xlsx: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' }

// Tải về: trình duyệt hỏi nơi lưu (Word Online/Chrome/Edge); tên tệp lấy từ ô "Tên tệp" nếu có
function download(bytes, name) {
  const url = URL.createObjectURL(new Blob([bytes], { type: MIME[name.split('.').pop()] || 'application/octet-stream' }))
  const a = document.createElement('a')
  a.href = url; a.download = name
  document.body.append(a); a.click(); a.remove()
  setTimeout(() => URL.revokeObjectURL(url), 10000)
}

const outName = name => name

const b64 = u8 => { let s = ''; for (let i = 0; i < u8.length; i += 0x8000) s += String.fromCharCode(...u8.subarray(i, i + 0x8000)); return btoa(s) }

function renderResult(out) {
  const box = $('ewResults')
  box.replaceChildren()
  const docs = Object.keys(out.files).filter(n => /\.docx$/i.test(n)).sort()
  const others = Object.keys(out.files).filter(n => !/\.docx$/i.test(n)).sort()
  for (const name of [...docs, ...others]) {
    const li = document.createElement('li')
    const span = document.createElement('span'); span.textContent = name; span.style.flex = '1'
    const save = document.createElement('button'); save.type = 'button'; save.className = 'link'; save.textContent = 'Tải về'
    save.addEventListener('click', () => download(out.files[name], outName(name)))
    if (!/\.docx$/i.test(name)) { li.append(span, save); box.append(li); continue }
    const open = document.createElement('button'); open.type = 'button'; open.className = 'link'; open.textContent = 'Mở'
    open.addEventListener('click', async () => { try { await openDocx(out.files[name]) } catch (e) { status(`Không mở được: ${e.message || e}`, true) } })
    li.append(span, save, open); box.append(li)
  }
  if (docs.length > 1) {
    const all = document.createElement('li')
    const openAll = document.createElement('button'); openAll.type = 'button'; openAll.className = 'link'; openAll.textContent = 'Mở tất cả các mã đề'
    openAll.addEventListener('click', async () => { for (const n of docs) { try { await openDocx(out.files[n]) } catch (e) { status(`Không mở được ${n}: ${e.message || e}`, true); break } } })
    const saveAll = document.createElement('button'); saveAll.type = 'button'; saveAll.className = 'link'; saveAll.textContent = 'Tải về tất cả'
    saveAll.addEventListener('click', () => { Object.keys(out.files).forEach((n, i) => setTimeout(() => download(out.files[n], outName(n)), i * 400)) })
    all.append(saveAll, openAll); box.append(all)
  }
  // bảng đáp án các mã đề
  const key = $('ewKey')
  key.replaceChildren()
  if (out.key && out.key.length) {
    const tsv = out.key.map(r => r.join('\t')).join('\n')
    const copy = document.createElement('button'); copy.type = 'button'; copy.className = 'link'; copy.textContent = 'Sao chép bảng đáp án (dán vào Excel)'
    copy.addEventListener('click', async () => { try { await navigator.clipboard.writeText(tsv); copy.textContent = 'Đã chép' } catch { copy.textContent = 'Không chép được' } })
    const table = document.createElement('table')
    for (const [i, row] of out.key.entries()) {
      const tr = document.createElement('tr')
      for (const cell of row) { const td = document.createElement(i === 0 ? 'th' : 'td'); td.textContent = cell; tr.append(td) }
      table.append(tr)
    }
    const wrap = document.createElement('div'); wrap.className = 'key-wrap'; wrap.append(table)
    key.append(copy, wrap)
  }
}

async function shuffle(beautify = false) {
  if (!current || busy) return
  const options = beautify ? { ...readForm(), keep_original: true, lam_dep: true, madelist: '1' } : readForm()
  if (!beautify && !options.madelist) { status('Hãy nhập danh sách mã đề (ví dụ 101,102,103).', true); return }
  setBusy(true)
  try {
    saveForm()
    status(beautify ? 'Đang làm đẹp đề…' : 'Đang trộn đề…')
    const t0 = performance.now()
    const out = await call('shuffle', { bytes: current.bytes.slice(), options })
    renderResult(out)
    status(`Xong trong ${((performance.now() - t0) / 1000).toFixed(1)} giây. Bấm Mở để mở từng mã đề thành tài liệu mới.`)
  } catch (err) {
    status(`Lỗi: ${err.message || err}`, true)
  } finally { setBusy(false) }
}

const showTab = name => showView(name)

export function initExamWeb() {
  registerExam('examWebView')
  $('tabExam').addEventListener('click', () => { showTab('exam'); call('init').catch(() => {}) }) // nạp trước bộ máy khi mở thẻ
  $('tabBeautify').addEventListener('click', () => { showTab('beautify'); call('init').catch(() => {}) })
  loadForm()
  for (const f of ['ewMadelist', 'ewKeep', ...FIELDS.map(x => 'ew_' + x)]) $(f).addEventListener('change', saveForm)
  $('ewLoad').addEventListener('click', load)
  $('ewShuffle').addEventListener('click', () => shuffle(false))
  $('ewBeautify').addEventListener('click', () => shuffle(true))
  setBusy(false)
}

// Chỉ để kiểm thử: mở với ?debug
if (location.search.includes('debug')) window.__examWeb = { analyze: bytes => call('analyze', { bytes }), shuffle: (bytes, options) => call('shuffle', { bytes, options }) }
