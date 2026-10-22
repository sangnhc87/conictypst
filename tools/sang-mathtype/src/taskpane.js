import { initEngine, renderFormula, renderIcon, setScale } from './engine.js'
import { decodeMeta } from './word.js'
import * as office from './word.js'
import * as desktop from './desktop.js'
import * as gdocs from './gdocs.js'
import { initLatex } from './latex.js'
import { initExam } from './exam.js'
import { initExamWeb, call as examCall } from './examWeb.js'
import { initTools } from './tools/ui.js'
import { createOfficeHost } from './tools/host-office.js'
import { createDesktopHost } from './tools/host-desktop.js'
import { showView } from './tabs.js'
import { initUpdater } from './updater.js'
import { initFigure, openMeta, leaveEditing } from './figure.js'
import { CATEGORIES, GROUPS, QUICK, normalize, WIDE } from './palette.js'

const $ = id => document.getElementById(id)
const el = {
  code: $('code'), size: $('size'), color: $('color'), display: $('display'), numbered: $('numbered'),
  preview: $('preview'), error: $('error'), insert: $('insert'), update: $('update'), copy: $('copy'), grab: $('grab'),
  mode: $('mode'), history: $('history'), search: $('search'), groups: $('groups'), cats: $('cats'), grid: $('grid'), quick: $('quick'),
  langTypst: $('langTypst'), langLatex: $('langLatex'),
}

const PLACE_OPEN = '⟦'
const PLACE_CLOSE = '⟧'
const IN_GDOCS = new URLSearchParams(location.search).get('host') === 'gdocs'
const SETTINGS_KEY = IN_GDOCS ? 'sangmath.settings.gdocs' : 'sangmath.settings'

let lang = 'typst'
let editing = false
let last = null // kết quả render gần nhất khớp với nội dung hiện tại
let seq = 0
let timer = 0
let bridge = null
let lastSelection = null
const state = { group: 'Toán', cat: 'rel', query: '' }

const safe = op => { try { return op() } catch { return null } }

// ---------- cài đặt nhớ giữa các lần mở ----------
function loadSettings() {
  const s = safe(() => JSON.parse(localStorage.getItem(SETTINGS_KEY) || '{}')) || {}
  if (s.size) el.size.value = s.size
  if (s.color) el.color.value = s.color
  if (typeof s.display === 'boolean') el.display.checked = s.display
  if (s.fmt) { const r = document.querySelector(`input[name=fmt][value=${s.fmt}]`); if (r) r.checked = true }
  if (s.lang) lang = s.lang
  $('bulkSize').value = el.size.value
  $('bulkColor').value = el.color.value
}
function saveSettings() {
  safe(() => localStorage.setItem(SETTINGS_KEY, JSON.stringify({
    size: el.size.value, color: el.color.value, display: el.display.checked, fmt: format(), lang,
  })))
}

// ---------- bảng ký hiệu ----------
const allItems = CATEGORIES.flatMap(c => c.items.map(it => ({ ...it, cat: c.id, haystack: normalize(`${it.name} ${it.kw || ''} ${c.name}`) })))
const itemOf = (cat, name) => allItems.find(it => it.cat === cat && it.name === name)
const clean = s => s.replaceAll(PLACE_OPEN, '').replaceAll(PLACE_CLOSE, '')

let iconToken = 0
async function fillIcons(cells) {
  const token = ++iconToken
  for (const cell of cells) {
    if (token !== iconToken) return // lưới đã đổi: bỏ phần còn lại
    const code = cell.dataset.code
    try {
      const url = await renderIcon(code)
      if (token !== iconToken) return
      const img = document.createElement('img')
      img.alt = ''
      img.src = url
      const face = cell.querySelector('.face')
      face.replaceChildren(img)
      // công thức dài: cho ô trải 2-4 cột để không bị tràn/chồng lên ô bên cạnh
      try {
        await img.decode()
        const ratio = img.naturalWidth / Math.max(1, img.naturalHeight)
        const span = ratio > 10 ? 4 : ratio > 6.5 ? 3 : ratio > 3.4 ? 2 : 1
        if (span > 1) cell.style.gridColumn = `span ${span}`
      } catch { /* bỏ qua */ }
    } catch { /* giữ nhãn chữ */ }
    await new Promise(r => setTimeout(r)) // nhường luồng giao diện giữa các biểu tượng
  }
}

function cellFor(it) {
  const b = document.createElement('button')
  b.type = 'button'
  b.className = 'cell'
  b.title = it.name
  b.dataset.code = clean(it.typst)
  const unavailable = lang === 'latex' && !it.latex
  b.disabled = unavailable
  if (unavailable) b.title = `${it.name} (chỉ có ở Typst)`
  const face = document.createElement('span'); face.className = 'face'
  const fb = document.createElement('span'); fb.className = 'fb'; fb.textContent = '…'
  face.append(fb)
  const nm = document.createElement('span'); nm.className = 'nm'; nm.textContent = it.name
  b.append(face, nm)
  b.addEventListener('click', () => pick(it))
  return b
}

function renderGroups() {
  el.groups.replaceChildren(...GROUPS.map(g => {
    const b = document.createElement('button')
    b.type = 'button'; b.textContent = g
    b.style.setProperty('--h', GROUP_HUE[g] ?? 215)
    b.classList.toggle('on', g === state.group && !state.query)
    b.addEventListener('click', () => {
      state.group = g
      state.cat = CATEGORIES.find(c => c.group === g).id
      state.query = ''; el.search.value = ''
      renderPalette()
    })
    return b
  }))
}

const GROUP_HUE = { 'Toán': 215, 'Lý': 25, 'Hóa': 150 }
function renderCats() {
  el.cats.replaceChildren(...CATEGORIES.filter(c => c.group === state.group).map((c, i) => {
    const b = document.createElement('button')
    const hue = ((GROUP_HUE[state.group] ?? 215) + i * 23) % 360
    b.style.setProperty('--h', hue)
    if (c.id === state.cat) el.grid.style.setProperty('--h', hue)
    b.type = 'button'
    b.classList.toggle('on', c.id === state.cat && !state.query)
    const ic = document.createElement('span'); ic.className = 'ic'; ic.textContent = c.icon
    b.append(ic, document.createTextNode(c.name))
    b.addEventListener('click', () => { state.cat = c.id; state.query = ''; el.search.value = ''; renderPalette() })
    return b
  }))
}

function renderGrid() {
  el.grid.classList.toggle('wide', WIDE.has(state.cat) && !state.query)
  el.grid.classList.toggle('named', !!state.query)
  let items
  if (state.query) {
    const q = normalize(state.query)
    items = allItems.filter(it => it.haystack.includes(q)).slice(0, 80)
  } else {
    items = CATEGORIES.find(c => c.id === state.cat).items
  }
  if (!items.length) {
    const none = document.createElement('div'); none.className = 'none'; none.textContent = 'Không thấy ký hiệu nào khớp.'
    el.grid.replaceChildren(none); iconToken++
    return
  }
  const cells = items.map(cellFor)
  el.grid.replaceChildren(...cells)
  el.grid.scrollTop = 0
  engineReady.then(() => fillIcons(cells))
}

function renderPalette() { renderGroups(); renderCats(); renderGrid() }

function renderQuick() {
  const items = QUICK.map(([cat, name]) => itemOf(cat, name)).filter(Boolean)
  const buttons = items.map(it => {
    const b = document.createElement('button')
    b.type = 'button'; b.title = it.name; b.dataset.code = clean(it.typst)
    b.disabled = lang === 'latex' && !it.latex
    b.textContent = '·'
    b.addEventListener('click', () => pick(it))
    return b
  })
  el.quick.replaceChildren(...buttons)
  engineReady.then(async () => {
    for (const b of buttons) {
      try {
        const img = document.createElement('img'); img.alt = b.title; img.src = await renderIcon(b.dataset.code)
        b.replaceChildren(img)
      } catch { b.textContent = b.title.slice(0, 2) }
      await new Promise(r => setTimeout(r))
    }
  })
}

// Chèn mẫu vào ô mã tại con trỏ; chỗ trống ⟦…⟧ được bôi đen, có chữ đang chọn thì đưa vào chỗ trống.
function pick(it) {
  const raw = lang === 'latex' ? it.latex : it.typst
  if (!raw) return
  const { value } = el.code
  const s = el.code.selectionStart
  const e = el.code.selectionEnd
  const selected = value.slice(s, e)
  const open = raw.indexOf(PLACE_OPEN)
  const close = open >= 0 ? raw.indexOf(PLACE_CLOSE, open) : -1
  let snippet = clean(raw)
  let holeStart = -1, holeEnd = -1
  if (open >= 0 && close > open) {
    const holeText = selected || raw.slice(open + 1, close)
    snippet = clean(raw.slice(0, open)) + holeText + clean(raw.slice(close + 1))
    holeStart = clean(raw.slice(0, open)).length
    holeEnd = holeStart + holeText.length
  }
  const before = value.slice(0, s)
  const after = value.slice(e)
  // tách bằng khoảng trắng để hai tên liền nhau không dính thành một định danh
  const glueBefore = lang === 'typst' && /[A-Za-z0-9.]$/.test(before) && /^[A-Za-z0-9"(]/.test(snippet) ? ' ' : ''
  const glueAfter = /[A-Za-z0-9]$/.test(snippet) && /^[A-Za-z0-9]/.test(after) ? ' ' : ''
  el.code.value = before + glueBefore + snippet + glueAfter + after
  const base = before.length + glueBefore.length
  el.code.focus()
  if (holeStart >= 0) el.code.setSelectionRange(base + holeStart, base + holeEnd)
  else { const p = base + snippet.length; el.code.setSelectionRange(p, p) }
  schedule()
}

// ---------- ô mã, xem trước ----------
function setLang(next) {
  lang = next
  el.langTypst.classList.toggle('on', lang === 'typst')
  el.langLatex.classList.toggle('on', lang === 'latex')
  renderGrid()
  renderQuick()
  saveSettings()
  schedule()
}

// Google Docs đặt đáy ảnh lên đường chữ và không hạ xuống được: phần công thức nằm dưới đường chữ làm nó lệch lên.
// Công thức lệch quá 3pt thì tự chọn "riêng một dòng, căn giữa" (người dùng chỉnh tay thì giữ lựa chọn của họ).
let blockTouched = false
function updateBlockHint(image) {
  const hint = $('blockHint')
  if (bridge !== gdocs || !hint) return
  const drop = image.descentPt
  if (!blockTouched && !editing) el.numbered.checked = drop > 3
  hint.hidden = !(drop > 3)
  hint.textContent = el.numbered.checked
    ? `Công thức này có phần nằm dưới đường chữ (${drop.toFixed(1)}pt) nên được đặt riêng một dòng để không bị lệch.`
    : `Cảnh báo: công thức này có phần nằm dưới đường chữ (${drop.toFixed(1)}pt), chèn giữa dòng chữ sẽ bị lệch lên.`
}

function format() {
  const r = document.querySelector('input[name=fmt]:checked')
  return r ? r.value : 'svgn'
}

function options() {
  return {
    lang, code: el.code.value, display: el.display.checked,
    size: Math.min(72, Math.max(8, parseFloat(el.size.value) || 13)), color: el.color.value,
  }
}

const metaOf = o => ({ l: o.lang, c: o.code, s: o.size, k: o.color, d: o.display, f: format() })

function showError(message) {
  el.error.hidden = !message
  el.error.textContent = message || ''
}

function schedule() {
  clearTimeout(timer)
  timer = setTimeout(refresh, 250)
}

async function refresh() {
  const opts = options()
  const mine = ++seq
  if (!opts.code.trim()) {
    last = null
    el.preview.innerHTML = '<span class="hint">Xem trước sẽ hiện ở đây</span>'
    showError('')
    return
  }
  try {
    const image = await renderFormula(opts)
    if (mine !== seq) return
    last = { image, opts }
    updateBlockHint(image)
    const img = document.createElement('img')
    img.alt = 'Xem trước công thức'
    img.src = `data:image/png;base64,${image.png}`
    img.style.width = `${image.widthPt * 96 / 72 * 1.5}px` // phóng 1,5 lần để nhìn rõ
    el.preview.replaceChildren(img)
    showError('')
  } catch (err) {
    if (mine !== seq) return
    last = null
    showError(String(err.message || err))
  }
}

async function act(fn) {
  await refresh()
  if (!last) return
  const { image, opts } = last
  try {
    // đang sửa công thức đã chèn thì giữ nguyên đoạn, không lồng thêm dòng đánh số
    const numbered = el.numbered.checked && !editing
    await fn({ image, meta: metaOf(opts), format: format(), numbered })
    remember(opts)
  } catch (err) {
    showError(`Word báo lỗi: ${err.message || err}`)
  }
}

function setEditing(on) {
  editing = on
  el.mode.textContent = on ? 'Đang sửa' : 'Thêm mới'
  el.mode.classList.toggle('edit', on)
  el.update.hidden = !on || !bridge
  el.insert.hidden = on || !bridge
}

function load(meta) {
  if (meta.l === 'latex' || meta.l === 'typst') lang = meta.l
  el.langTypst.classList.toggle('on', lang === 'typst')
  el.langLatex.classList.toggle('on', lang === 'latex')
  el.code.value = meta.c || ''
  el.size.value = meta.s || 13
  el.color.value = meta.k || '#000000'
  el.display.checked = !!meta.d
  renderGrid(); renderQuick()
  refresh()
}

function remember(opts) {
  const key = 'sangmath.history'
  const list = safe(() => JSON.parse(localStorage.getItem(key) || '[]')) || []
  const next = [metaOf(opts), ...list.filter(m => !(m.l === opts.lang && m.c === opts.code))].slice(0, 12)
  safe(() => localStorage.setItem(key, JSON.stringify(next)))
  renderHistory(next)
}

function renderHistory(list) {
  el.history.replaceChildren(...list.map(meta => {
    const li = document.createElement('li')
    const b = document.createElement('button')
    b.type = 'button'
    b.textContent = `${meta.l === 'latex' ? 'LaTeX' : 'Typst'} · ${meta.c.replace(/\s+/g, ' ')}`
    b.title = meta.c
    b.addEventListener('click', () => { setEditing(false); load(meta) })
    li.append(b)
    return li
  }))
}

// ---------- nối với Word ----------
// Vùng chọn trong Word đổi: meta = công thức Sang Math đang chọn, hoặc null.
function onWordSelection(meta) {
  const key = meta ? JSON.stringify(meta) : null
  if (key === lastSelection) return // không đổi thì giữ nguyên, tránh ghi đè chữ đang gõ
  lastSelection = key
  if (meta && meta.l === 'draw') { openMeta(meta, () => showView('figure')); return } // hình vẽ: sửa ở thẻ Vẽ hình
  leaveEditing()
  if (meta) { setEditing(true); load(meta) } else if (editing) { setEditing(false) }
}

async function syncSelection() {
  try { onWordSelection(await bridge.readSelectedFormula()) } catch { /* chưa có vùng chọn hợp lệ */ }
}

function useBridge(b) {
  bridge = b
  window.dispatchEvent(new Event('sm-bridge'))
  if (b === office || b === gdocs) setScale(5) // ảnh nhẹ hơn khi chèn qua Office.js / Apps Script
  // Add-in Office: mặc định "SVG nhẹ" (SVG + PNG dự phòng cực nhỏ, Office 2016+) cho file docx nhẹ; chọn PNG nếu cần tương thích tối đa.
  if ((b === office || b === gdocs) && !(safe(() => JSON.parse(localStorage.getItem(SETTINGS_KEY) || '{}')) || {}).fmt) document.querySelector('input[name=fmt][value=svgn]').checked = true
  el.insert.textContent = b === gdocs ? 'Chèn vào tài liệu' : 'Chèn vào Word'
  el.grab.textContent = b === gdocs ? 'Lấy công thức đang chọn' : 'Lấy công thức trong Word'
  $('fmtBox').hidden = b === gdocs // Google Docs chỉ nhận PNG; kiểu chèn chỉ có nghĩa khi nối được với Word
  el.copy.classList.remove('primary')
  if (b.supportsNumbering === false) $('numLabel').hidden = true
  if (b.numberingLabel) $('numLabel').lastChild.textContent = ` ${b.numberingLabel}`
  // Google Docs không hạ ảnh theo đường chữ: mặc định kiểu nhỏ gọn (ít phần dưới đường chữ) để đỡ lệch dòng
  if (b === gdocs && !(safe(() => JSON.parse(localStorage.getItem(SETTINGS_KEY) || '{}')) || {}).display) el.display.checked = false
  if (b.supportsBulk) $('bulkBox').hidden = false
  if (b.supportsConvert) $('convBox').hidden = false
  if (b.supportsGrab) el.grab.hidden = false
  setEditing(editing)
  b.onSelectionChanged(onWordSelection)
  if (b.onSelected) b.onSelected(alt => { // phím tắt ⌘⇧E: nạp công thức đang chọn
    const meta = decodeMeta(alt)
    if (meta) { lastSelection = JSON.stringify(meta); setEditing(true); load(meta) } else showError('Chưa chọn công thức Sang Math nào trong Word.')
  })
  syncSelection()
  if (b === desktop && window.examBridge) initExam() // thẻ Đề thi đầy đủ (thư viện, Excel) trong app Mac
  if (b === office) initExamWeb() // bản trộn đề chạy bằng Pyodide trong add-in
  // Công cụ soạn: sửa đề thẳng trong tài liệu Word đang mở; đáp án đọc bằng bộ máy exam/engine
  if (b === office) {
    const host = createOfficeHost()
    initTools(host, async () => (await examCall('analyze', { bytes: (await host.docBytes()).slice() })).answers)
  } else if (b === desktop) {
    const host = createDesktopHost()
    initTools(host, window.examBridge ? async () => {
      const p = await host.docPath()
      if (!p) throw new Error('Tài liệu chưa được lưu. Hãy lưu thành .docx hoặc chọn "Gõ đáp án".')
      if (!/\.docx$/i.test(p)) throw new Error('Chỉ đọc được đáp án từ tệp .docx đã lưu. Hãy lưu thành .docx hoặc chọn "Gõ đáp án".')
      return (await window.examBridge.analyze(p)).answers // đọc bản đã lưu trên đĩa
    } : null)
  }
}

async function bulkApply() {
  const msg = $('bulkMsg')
  const doSize = $('bulkDoSize').checked
  const doColor = $('bulkDoColor').checked
  if (!doSize && !doColor) { msg.textContent = 'Hãy tick cỡ chữ hoặc màu.'; return }
  const size = Math.min(72, Math.max(8, parseFloat($('bulkSize').value) || 13))
  const color = $('bulkColor').value
  $('bulkGo').disabled = true
  try {
    msg.textContent = 'Đang đọc các công thức trong Word…'
    const found = await bridge.listFormulas($('bulkScope').value)
    if (!found.length) { msg.textContent = 'Không có công thức Sang Math nào.'; return }
    const out = []
    for (let i = 0; i < found.length; i++) {
      const meta = decodeMeta(found[i].alt)
      if (!meta) continue
      const next = { ...meta, s: doSize ? size : meta.s, k: doColor ? color : meta.k }
      msg.textContent = `Đang dựng lại ${i + 1}/${found.length}…`
      const image = await renderFormula({ lang: meta.l, code: meta.c, display: !!meta.d, size: next.s, color: next.k })
      out.push({ pos: found[i].pos, ...bridge.serialize({ image, meta: next, format: meta.f || format() }) })
    }
    msg.textContent = `Đang ghi ${out.length} công thức vào Word…`
    await bridge.replaceMany(out)
    msg.textContent = `Đã cập nhật ${out.length} công thức.`
  } catch (err) {
    msg.textContent = `Lỗi: ${err.message || err}`
  } finally {
    $('bulkGo').disabled = false
  }
}

// Chuyển các Equation của Word thành hình Sang Math (đi qua LaTeX, dựng lại bằng chính bộ dựng này).
async function convertEquations(scope) {
  const msg = $('convMsg')
  const size = Math.min(72, Math.max(8, parseFloat(el.size.value) || 13))
  const color = el.color.value
  const fmt = format()
  $('convSel').disabled = $('convDoc').disabled = true
  try {
    msg.textContent = 'Đang đọc tài liệu…'
    const res = await bridge.convertEquations(scope, async latex => {
      const image = await renderFormula({ lang: 'latex', code: latex, display: true, size, color })
      return { image, meta: { l: 'latex', c: latex, s: size, k: color, d: true, f: fmt }, format: fmt }
    }, (done, total) => { msg.textContent = `Đã xử lý ${done}/${total} đoạn có Equation…` })
    msg.textContent = res.converted
      ? `Đã chuyển ${res.converted} Equation${res.failed ? `; ${res.failed} cái không dựng được nên giữ nguyên` : ''}.`
      : (res.failed ? `Không dựng được ${res.failed} Equation nên giữ nguyên.` : 'Không thấy Equation nào để chuyển.')
  } catch (err) {
    msg.textContent = `Lỗi: ${err.message || err}`
  } finally {
    $('convSel').disabled = $('convDoc').disabled = false
  }
}

// Chiều ngược: công thức Sang Math (hình) -> Equation của Word.
async function convertBack(scope) {
  const msg = $('convMsg')
  const buttons = ['convSel', 'convDoc', 'backSel', 'backDoc'].map($)
  buttons.forEach(b => { b.disabled = true })
  try {
    msg.textContent = 'Đang đọc tài liệu…'
    await initLatex()
    const res = await bridge.convertToEquations(scope, (done, total) => { msg.textContent = `Đã xử lý ${done}/${total} đoạn có công thức…` })
    msg.textContent = res.converted
      ? `Đã chuyển ${res.converted} công thức thành Equation${res.failed ? `; ${res.failed} cái chưa đổi được nên giữ nguyên hình` : ''}.`
      : (res.failed ? `${res.failed} công thức chưa đổi được nên giữ nguyên hình.` : 'Không thấy công thức Sang Math nào để chuyển.')
  } catch (err) {
    msg.textContent = `Lỗi: ${err.message || err}`
  } finally {
    buttons.forEach(b => { b.disabled = false })
  }
}

// ---------- sự kiện ----------
for (const node of [el.code, el.size, el.color, el.display]) node.addEventListener('input', () => { saveSettings(); schedule() })
el.numbered.addEventListener('change', () => { blockTouched = true; if (last) updateBlockHint(last.image) })
for (const r of document.querySelectorAll('input[name=fmt]')) r.addEventListener('change', saveSettings)
el.langTypst.addEventListener('click', () => setLang('typst'))
el.langLatex.addEventListener('click', () => setLang('latex'))
el.search.addEventListener('input', () => { state.query = el.search.value.trim(); renderPalette() })
$('clear').addEventListener('click', () => { el.code.value = ''; el.code.focus(); schedule() })
$('copycode').addEventListener('click', async () => {
  try { await navigator.clipboard.writeText(el.code.value) } catch { el.code.select(); document.execCommand('copy') }
})
el.insert.addEventListener('click', () => act(p => bridge.insertFormula(p)))
el.update.addEventListener('click', () => act(p => bridge.replaceSelectedFormula(p)))
el.grab.addEventListener('click', async () => {
  const meta = decodeMeta(await bridge.readSelection())
  if (meta) { lastSelection = JSON.stringify(meta); setEditing(true); load(meta) } else showError('Chưa chọn công thức Sang Math nào trong Word.')
})
$('bulkGo').addEventListener('click', bulkApply)
$('convSel').addEventListener('click', () => convertEquations('sel'))
$('convDoc').addEventListener('click', () => convertEquations('doc'))
$('backSel').addEventListener('click', () => convertBack('sel'))
$('backDoc').addEventListener('click', () => convertBack('doc'))

// Dùng không cần Word: chép PNG vào clipboard rồi dán vào Word, Pages, Google Docs...
el.copy.addEventListener('click', async () => {
  await refresh()
  if (!last) return
  try {
    const bytes = Uint8Array.from(atob(last.image.png), c => c.charCodeAt(0))
    await navigator.clipboard.write([new ClipboardItem({ 'image/png': new Blob([bytes], { type: 'image/png' }) })])
    remember(last.opts)
    el.copy.textContent = 'Đã chép. Bấm vào Word rồi nhấn Cmd+V'
    setTimeout(() => { el.copy.textContent = 'Sao chép ảnh (rồi Cmd+V)' }, 3000)
  } catch (err) {
    showError(`Không chép được vào clipboard: ${err.message || err}`)
  }
})
el.code.addEventListener('keydown', e => {
  if ((e.metaKey || e.ctrlKey) && e.key === 'Enter') {
    e.preventDefault()
    if (bridge) act(p => (editing ? bridge.replaceSelectedFormula(p) : bridge.insertFormula(p)))
  }
})

// ---------- thẻ Công thức / Vẽ hình ----------
$('tabFormula').addEventListener('click', () => showView('formula'))
$('tabFigure').addEventListener('click', () => showView('figure'))
$('coffeeBtn').addEventListener('click', () => { const d = $('coffeeDlg'); if (d.showModal) d.showModal(); else d.setAttribute('open', '') })
$('coffeeDlg').addEventListener('click', e => { if (e.target === $('coffeeDlg')) $('coffeeDlg').close() }) // bấm ra ngoài để đóng
$('coffeeCopy').addEventListener('click', async () => { const b = $('coffeeCopy'); try { await navigator.clipboard.writeText($('coffeeAcc').textContent.trim()); b.textContent = 'Đã chép' } catch { b.textContent = 'Chép tay nhé' } setTimeout(() => { b.textContent = 'Chép số' }, 1800) })

// ---------- khởi động ----------
const engineReady = initEngine()
engineReady.then(() => schedule()).catch(err => showError(`Không khởi tạo được bộ dựng: ${err.message || err}`))
loadSettings()
renderHistory(safe(() => JSON.parse(localStorage.getItem('sangmath.history') || '[]')) || [])
el.langTypst.classList.toggle('on', lang === 'typst')
el.langLatex.classList.toggle('on', lang === 'latex')
renderPalette()
renderQuick()

if (window.wordBridge) {
  useBridge(desktop) // app desktop: điều khiển Word Mac bằng AppleScript
} else if (new URLSearchParams(location.search).get('host') === 'gdocs' && window.parent !== window) {
  useBridge(gdocs) // chạy trong khung bên phải của Google Docs
} else {
  const attachOffice = () => {
    if (typeof Office !== 'undefined') {
      Office.onReady(info => {
        // Trong Word (Desktop Windows/Mac hoặc Word Online)
        if (info && (info.host === Office.HostType.Word || info.host === 'Word' || window.Word)) {
          useBridge(office)
        }
      })
    }
  }
  if (typeof Office !== 'undefined') {
    attachOffice()
  } else {
    const script = document.createElement('script')
    script.src = 'https://appsforoffice.microsoft.com/lib/1/hosted/office.js'
    script.onload = attachOffice
    document.head.append(script)
  }
}

// Chỉ để kiểm thử tự động: mở taskpane.html?debug
if (location.search.includes('debug')) window.__sm = { renderFormula, renderIcon, CATEGORIES }
initFigure(() => bridge)
initUpdater()
if ('serviceWorker' in navigator && window.isSecureContext) window.addEventListener('load', () => navigator.serviceWorker.register('sw.js').catch(() => { /* webview không hỗ trợ: bỏ qua */ }))