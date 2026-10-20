// Thẻ "Vẽ hình": thư viện hình Hóa/Lý dựng bằng Typst + CeTZ, tham số hóa, chèn vào Word như ảnh SVG/PNG và sửa lại được.
import { initDraw, renderFigure } from './engine.js'
import { initEditor, loadScene, onShow as editorShown, setEditingInWord } from './editor.js'

const $ = id => document.getElementById(id)
const PARAM_RE = /^#let (p-[\w-]+) = (.+?)\s*\/\/\s*(.+)$/

let bridge = null
let manifest = null
let current = null // { id, ten }
let last = null
let seq = 0
let timer = 0
let editing = false
let group = 'Tất cả'
let query = ''
const codeCache = new Map()

const fmt = () => (document.querySelector('input[name=figfmt]:checked') || {}).value || 'svgn'
const norm = s => s.toLowerCase().normalize('NFD').replace(/[̀-ͯ]/g, '').replace(/đ/g, 'd')

function showError(msg) { const e = $('figError'); e.textContent = msg || ''; e.hidden = !msg }

function setMode(mode) {
  const ed = mode === 'ed'
  $('edMode').hidden = !ed
  $('tplMode').hidden = ed
  $('modeEd').classList.toggle('on', ed)
  $('modeTpl').classList.toggle('on', !ed)
  if (ed) editorShown()
}
export const showFigureView = () => { if (!$('edMode').hidden) editorShown() }

// ---------- danh sách mẫu ----------
function renderGroups() {
  const names = ['Tất cả', ...new Set(manifest.templates.map(t => t.nhom))]
  $('figGroups').replaceChildren(...names.map(n => {
    const b = document.createElement('button'); b.type = 'button'; b.textContent = n
    b.classList.toggle('on', n === group)
    b.addEventListener('click', () => { group = n; renderGroups(); renderList() })
    return b
  }))
}

function renderList() {
  const q = norm(query)
  const items = manifest.templates.filter(t => (group === 'Tất cả' || t.nhom === group) && (!q || norm(`${t.ten} ${t.muc} ${t.mota} ${t.nhom} ${t.tu}`).includes(q)))
  const box = $('figList')
  box.replaceChildren()
  if (!items.length) { const n = document.createElement('div'); n.className = 'none'; n.textContent = 'Không thấy hình nào khớp.'; box.append(n); return }
  let muc = null
  for (const t of items) {
    if (!q && t.muc !== muc) {
      muc = t.muc
      const h = document.createElement('h4'); h.textContent = `${group === 'Tất cả' ? t.nhom + ' · ' : ''}${t.muc}`; box.append(h)
    }
    const card = document.createElement('button'); card.type = 'button'; card.className = 'fig-card'
    card.classList.toggle('on', !!current && current.id === t.id)
    const img = document.createElement('img'); img.loading = 'lazy'; img.alt = ''; img.src = `draw/thumbs/${t.id}.svg`
    const name = document.createElement('span'); name.textContent = t.ten
    card.append(img, name); card.title = t.mota || t.ten
    card.addEventListener('click', () => pick(t))
    box.append(card)
  }
}

async function pick(t) {
  let code = codeCache.get(t.id)
  if (!code) { code = await (await fetch(`draw/t/${t.id}.typ`)).text(); codeCache.set(t.id, code) }
  current = { id: t.id, ten: t.ten }
  editing = false
  setButtons()
  $('figTitle').textContent = t.ten
  $('figDesc').textContent = t.mota || ''
  $('figCode').value = code
  renderParams()
  renderList()
  schedule()
}

// ---------- tham số ----------
function parseParams(code) {
  return code.split('\n').map((line, index) => {
    const m = PARAM_RE.exec(line)
    return m ? { index, key: m[1], raw: m[2].trim(), label: m[3].trim() } : null
  }).filter(Boolean)
}

function setLine(index, key, raw, label) {
  const lines = $('figCode').value.split('\n')
  lines[index] = `#let ${key} = ${raw} // ${label}`
  $('figCode').value = lines.join('\n')
  schedule()
}

function renderParams() {
  const box = $('figParams')
  box.replaceChildren()
  for (const p of parseParams($('figCode').value)) {
    const label = document.createElement('label'); label.textContent = `${p.label} `
    let input
    const str = /^"(.*)"$/.exec(p.raw)
    const color = /^rgb\("(#[0-9a-fA-F]{6})"\)$/.exec(p.raw)
    if (p.raw === 'true' || p.raw === 'false') {
      input = Object.assign(document.createElement('input'), { type: 'checkbox', checked: p.raw === 'true' })
      input.addEventListener('change', () => setLine(p.index, p.key, String(input.checked), p.label))
    } else if (color) {
      input = Object.assign(document.createElement('input'), { type: 'color', value: color[1] })
      input.addEventListener('input', () => setLine(p.index, p.key, `rgb("${input.value}")`, p.label))
    } else if (str) {
      input = Object.assign(document.createElement('input'), { type: 'text', value: str[1] })
      input.addEventListener('input', () => setLine(p.index, p.key, `"${input.value.replace(/"/g, '\\"')}"`, p.label))
    } else {
      const unit = (/(deg|pt|cm|mm)$/.exec(p.raw) || [''])[0]
      input = Object.assign(document.createElement('input'), { type: 'number', value: p.raw.replace(/(deg|pt|cm|mm)$/, ''), step: 'any' })
      input.addEventListener('input', () => { if (input.value !== '') setLine(p.index, p.key, input.value + unit, p.label) })
    }
    label.append(input)
    box.append(label)
  }
}

// ---------- dựng hình ----------
function schedule() { clearTimeout(timer); timer = setTimeout(refresh, 350) }

async function refresh() {
  const code = $('figCode').value
  if (!code.trim()) return null
  const mine = ++seq
  const preview = $('figPreview')
  try {
    const image = await renderFigure(code)
    if (mine !== seq) return null
    last = { image, code }
    showError('')
    const img = document.createElement('img')
    img.alt = 'Xem trước hình'
    img.src = `data:image/svg+xml;charset=utf-8,${encodeURIComponent(image.svg)}`
    preview.replaceChildren(img)
    return last
  } catch (err) {
    if (mine !== seq) return null
    last = null
    showError(String(err.message || err))
    return null
  }
}

function sized(image) {
  const target = Number($('figWidth').value) * 28.3465 // cm -> pt
  const w = Math.min(image.widthPt, target > 0 ? target : image.widthPt)
  const k = w / image.widthPt
  return { ...image, widthPt: image.widthPt * k, heightPt: image.heightPt * k }
}

const metaOf = code => ({ l: 'draw', c: code, t: current ? current.id : '' })

async function act(fn) {
  const r = await refresh()
  if (!r || !bridge) return
  try { await fn({ image: sized(r.image), meta: metaOf(r.code), format: fmt(), numbered: false }) } catch (err) { showError(`Word báo lỗi: ${err.message || err}`) }
}

function setButtons() {
  $('figInsert').hidden = editing || !bridge
  $('figUpdate').hidden = !editing || !bridge
}

/** Hình vẽ đã chèn được chọn trong Word: nạp lại mã để sửa. */
export function openMeta(m, show) {
  show()
  if (m.sc) { setMode('ed'); loadScene(m.sc, true); return }
  setMode('tpl')
  current = { id: m.t || '', ten: 'Hình đang chọn' }
  editing = true
  setButtons()
  $('figTitle').textContent = 'Đang sửa hình đã chèn'
  $('figDesc').textContent = ''
  $('figCode').value = m.c
  renderParams()
  if (manifest) renderList()
  schedule()
}
export function leaveEditing() { if (editing) { editing = false; setButtons() }; setEditingInWord(false) }

export async function initFigure(getBridge) {
  const sync = () => { bridge = getBridge(); setButtons() }
  sync()
  $('modeEd').addEventListener('click', () => setMode('ed'))
  $('modeTpl').addEventListener('click', () => setMode('tpl'))
  initEditor(getBridge, {
    showError,
    openInCodeMode: code => { setMode('tpl'); current = null; editing = false; setButtons(); $('figTitle').textContent = 'Mã vẽ từ bảng kéo thả'; $('figDesc').textContent = 'Sửa tay mã Typst; hình này không còn là bảng kéo thả.'; $('figCode').value = code; renderParams(); renderList && manifest && renderList(); schedule() },
  })
  $('figSearch').addEventListener('input', () => { query = $('figSearch').value; if (manifest) renderList() })
  $('figCode').addEventListener('input', () => { renderParams(); schedule() })
  $('figInsert').addEventListener('click', () => { sync(); act(p => bridge.insertFormula(p)) })
  $('figUpdate').addEventListener('click', () => { sync(); act(p => bridge.replaceSelectedFormula(p)) })
  $('figCopy').addEventListener('click', async () => {
    const r = await refresh(); if (!r) return
    try {
      const bytes = Uint8Array.from(atob(r.image.png), c => c.charCodeAt(0))
      await navigator.clipboard.write([new ClipboardItem({ 'image/png': new Blob([bytes], { type: 'image/png' }) })])
      $('figCopy').textContent = 'Đã chép'; setTimeout(() => { $('figCopy').textContent = 'Sao chép ảnh' }, 2500)
    } catch (err) { showError(`Không chép được: ${err.message || err}`) }
  })
  $('figSave').addEventListener('click', async () => {
    const r = await refresh(); if (!r) return
    const a = Object.assign(document.createElement('a'), { href: URL.createObjectURL(new Blob([r.image.svg], { type: 'image/svg+xml' })), download: `${(current && current.id) || 'hinh'}.svg` })
    document.body.append(a); a.click(); a.remove()
  })
  try {
    manifest = await initDraw()
    renderGroups(); renderList()
  } catch (err) { showError(`Không nạp được thư viện hình: ${err.message || err}`) }
  if (location.search.includes('debug')) window.__fig = { pick: id => pick(manifest.templates.find(t => t.id === id)), refresh, manifest }
}
