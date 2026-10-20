// Bảng vẽ kéo thả: kéo dụng cụ/ký hiệu/hình từ kho vào bảng, di chuyển, xoay, đổi cỡ, sửa thuộc tính, rồi chèn vào Word.
import { renderStamp, renderFigure } from './engine.js'
import { STAMPS, STAMP_MAP, GROUPS, defaults, itemDocument, sceneDocument } from './draw/stamps.mjs'

const $ = id => document.getElementById(id)
const PT_PER_CM = 28.3465
const norm = s => s.toLowerCase().normalize('NFD').replace(/[̀-ͯ]/g, '').replace(/đ/g, 'd')

const scene = { W: 22, H: 13, items: [] }
let selected = null
let group = GROUPS[0]
let query = ''
let ppc = 36 // px trên mỗi cm
let snap = true
let zoom = 1
let clip = null
let showGrid = true
const closed = new Set() // nhóm con đang thu gọn
const LS = (k, d) => { try { return JSON.parse(localStorage.getItem(k) || 'null') ?? d } catch { return d } }
const favs = new Set(LS('sangmath.editor.favs', []))
let recent = LS('sangmath.editor.recent', [])
const saveLS = () => { try { localStorage.setItem('sangmath.editor.favs', JSON.stringify([...favs])); localStorage.setItem('sangmath.editor.recent', JSON.stringify(recent)) } catch { /* bỏ qua */ } }
let bridge = null
let getB = null
let editingInWord = false
let undo = []
let redo = []
let uid = 1
const imgs = new Map() // id mục -> { img, ox, oy, w, h }
let host = null // gọi từ figure.js: { showError }

const newId = () => `i${uid++}`
const clone = o => JSON.parse(JSON.stringify(o))
const rnd = v => Math.round(v * 100) / 100

// ---------- lịch sử ----------
function pushUndo() { undo.push(JSON.stringify(scene)); if (undo.length > 80) undo.shift(); redo = [] }
function restore(json) {
  const s = JSON.parse(json)
  scene.W = s.W; scene.H = s.H; scene.items = s.items
  if (selected && !scene.items.some(i => i.id === selected)) selected = null
  $('edW').value = scene.W; $('edH').value = scene.H
  layoutStage(); refreshAll()
}
function doUndo() { if (!undo.length) return; redo.push(JSON.stringify(scene)); restore(undo.pop()) }
function doRedo() { if (!redo.length) return; undo.push(JSON.stringify(scene)); restore(redo.pop()) }

// ---------- hình của từng mục ----------
function keyOf(it) { return `${it.k}|${JSON.stringify(it.p)}|${it.r || 0}|${it.s || 1}|${it.f ? 1 : 0}` }

async function loadImage(it) {
  const full = { ...it, p: { ...defaults(STAMP_MAP.get(it.k)), ...it.p } }
  return renderStamp(keyOf(it), itemDocument(full, true), itemDocument(full, false))
}

async function ensureImage(it) {
  try {
    const r = await loadImage(it)
    imgs.set(it.id, { ...r, key: keyOf(it) })
    paintItem(it)
    return true
  } catch (err) {
    imgs.set(it.id, { error: String(err.message || err), key: keyOf(it) })
    paintItem(it)
    if (host) host.showError(`Mẫu "${STAMP_MAP.get(it.k).n}": ${String(err.message || err).split('\n')[0]}`)
    return false
  }
}

// ---------- vẽ bảng ----------
function layoutStage() {
  const wrap = $('edStageWrap')
  const avail = Math.max(260, wrap.clientWidth - 6)
  ppc = Math.max(8, Math.min(120, Math.min(56, avail / scene.W) * zoom))
  const zl = $('edZoomLbl'); if (zl) zl.textContent = `${Math.round(zoom * 100)}%`
  const st = $('edStage')
  st.classList.toggle('nogrid', !showGrid)
  st.style.width = `${scene.W * ppc}px`
  st.style.height = `${scene.H * ppc}px`
  st.style.setProperty('--cell', `${ppc}px`)
}

function itemEl(it) { return $('edStage').querySelector(`[data-id="${it.id}"]`) }

function paintItem(it) {
  let el = itemEl(it)
  const im = imgs.get(it.id)
  if (!el) {
    el = document.createElement('div')
    el.className = 'sitem'
    el.dataset.id = it.id
    $('edStage').append(el)
  }
  if (!im) { el.replaceChildren(); return }
  const tmp = it._tmp || { dr: 0, ds: 1 }
  const k = ppc / PT_PER_CM
  if (im.error) {
    el.className = 'sitem err'
    el.textContent = '⚠ lỗi mẫu'
    el.style.left = `${it.x * ppc}px`; el.style.top = `${(scene.H - it.y) * ppc}px`; el.style.width = 'auto'; el.style.height = 'auto'
    return
  }
  const w = im.wPt * k
  const h = im.hPt * k
  const ox = im.ox * k
  const oy = im.oy * k
  el.className = `sitem${selected === it.id ? ' sel' : ''}`
  el.style.left = `${it.x * ppc - ox}px`
  el.style.top = `${(scene.H - it.y) * ppc - oy}px`
  el.style.width = `${w}px`
  el.style.height = `${h}px`
  el.style.transformOrigin = `${ox}px ${oy}px`
  el.style.transform = `rotate(${-tmp.dr}deg) scale(${tmp.ds})`
  el.style.zIndex = String(it.z ?? 0)
  let img = el.querySelector('img')
  if (!img || img.dataset.key !== im.key) {
    el.replaceChildren()
    img = document.createElement('img')
    img.draggable = false
    img.dataset.key = im.key
    img.src = `data:image/svg+xml;charset=utf-8,${encodeURIComponent(im.svg)}`
    el.append(img)
  }
  img.style.width = `${w}px`
  img.style.height = `${h}px`
  // tay nắm chỉ có ở mục đang chọn
  el.querySelectorAll('.h-rot, .h-scl, .h-org').forEach(n => n.remove())
  if (selected === it.id) {
    const rot = document.createElement('div'); rot.className = 'h-rot'; rot.title = 'Kéo để xoay (giữ Shift: nhảy 15°)'
    rot.style.left = `${ox}px`; rot.style.top = `${-26}px`
    rot.addEventListener('pointerdown', e => startRotate(e, it))
    const scl = document.createElement('div'); scl.className = 'h-scl'; scl.title = 'Kéo để đổi cỡ'
    scl.addEventListener('pointerdown', e => startScale(e, it))
    const org = document.createElement('div'); org.className = 'h-org'
    org.style.left = `${ox}px`; org.style.top = `${oy}px`
    el.append(rot, scl, org)
  }
}

function paintAll() {
  const stage = $('edStage')
  const ids = new Set(scene.items.map(i => i.id))
  for (const n of [...stage.querySelectorAll('.sitem')]) if (!ids.has(n.dataset.id)) n.remove()
  scene.items.forEach(paintItem)
}

function refreshAll() {
  for (const it of scene.items) {
    const im = imgs.get(it.id)
    if (!im || im.key !== keyOf(it)) ensureImage(it)
  }
  paintAll()
  renderInspector()
  updateCode()
  saveDraft()
}

// ---------- chọn / kéo ----------
function select(id) {
  selected = id
  paintAll()
  renderInspector()
}

function stagePoint(e) {
  const r = $('edStage').getBoundingClientRect()
  return { x: (e.clientX - r.left) / ppc, y: scene.H - (e.clientY - r.top) / ppc }
}

function snapv(v, step = 0.1) { return snap ? Math.round(v / step) * step : v }

function startDrag(e, it) {
  if (e.button !== 0) return
  e.preventDefault()
  select(it.id)
  pushUndo()
  const p0 = stagePoint(e)
  const x0 = it.x, y0 = it.y
  const move = ev => {
    const p = stagePoint(ev)
    it.x = rnd(snapv(x0 + p.x - p0.x))
    it.y = rnd(snapv(y0 + p.y - p0.y))
    paintItem(it)
    syncInspectorPos()
  }
  const up = () => { window.removeEventListener('pointermove', move); window.removeEventListener('pointerup', up); updateCode(); saveDraft() }
  window.addEventListener('pointermove', move)
  window.addEventListener('pointerup', up)
}

function startRotate(e, it) {
  e.preventDefault(); e.stopPropagation()
  pushUndo()
  const r0 = it.r || 0
  const a0 = (() => { const p = stagePoint(e); return Math.atan2(p.y - it.y, p.x - it.x) * 180 / Math.PI })()
  let delta = 0
  const move = ev => {
    const p = stagePoint(ev)
    let a = Math.atan2(p.y - it.y, p.x - it.x) * 180 / Math.PI
    delta = a - a0
    let r = ((Math.round(r0 + delta) % 360) + 360) % 360
    if (ev.shiftKey || snap) r = ((Math.round((r0 + delta) / 15) * 15) % 360 + 360) % 360
    delta = r - r0
    it._tmp = { dr: delta, ds: 1 }
    paintItem(it)
    const n = $('edR'); if (n && document.activeElement !== n) n.value = String(r)
    it._pendingR = r
  }
  const up = async () => {
    window.removeEventListener('pointermove', move); window.removeEventListener('pointerup', up)
    if (it._pendingR != null) { it.r = it._pendingR; delete it._pendingR }
    await ensureImage(it); delete it._tmp; paintItem(it); syncInspectorPos(); updateCode(); saveDraft()
  }
  window.addEventListener('pointermove', move)
  window.addEventListener('pointerup', up)
}

function startScale(e, it) {
  e.preventDefault(); e.stopPropagation()
  pushUndo()
  const p0 = stagePoint(e)
  const d0 = Math.max(0.2, Math.hypot(p0.x - it.x, p0.y - it.y))
  const s0 = it.s
  let s1 = s0
  const move = ev => {
    const p = stagePoint(ev)
    s1 = Math.max(0.15, Math.min(8, rnd(s0 * Math.hypot(p.x - it.x, p.y - it.y) / d0)))
    it._tmp = { dr: 0, ds: s1 / s0 }
    paintItem(it)
    const n = $('edS'); if (n && document.activeElement !== n) n.value = String(s1)
  }
  const up = async () => {
    window.removeEventListener('pointermove', move); window.removeEventListener('pointerup', up)
    it.s = s1
    await ensureImage(it); delete it._tmp; paintItem(it); syncInspectorPos(); updateCode(); saveDraft()
  }
  window.addEventListener('pointermove', move)
  window.addEventListener('pointerup', up)
}

// ---------- thêm / xoá / sửa ----------
function addItem(stampId, x, y) {
  const st = STAMP_MAP.get(stampId)
  if (!st) return null
  recent = [stampId, ...recent.filter(x => x !== stampId)].slice(0, 24); saveLS()
  pushUndo()
  const n = scene.items.length
  const it = { id: newId(), k: stampId, x: rnd(x ?? scene.W / 2 + (n % 5) * 0.4), y: rnd(y ?? scene.H / 2 - (n % 5) * 0.4), s: 1, r: 0, f: false, z: n, p: defaults(st) }
  scene.items.push(it)
  selected = it.id
  refreshAll()
  return it
}

function removeSelected() {
  if (!selected) return
  pushUndo()
  scene.items = scene.items.filter(i => i.id !== selected)
  imgs.delete(selected)
  selected = null
  refreshAll()
}

function duplicateSelected() {
  const it = scene.items.find(i => i.id === selected)
  if (!it) return
  pushUndo()
  const c = clone(it)
  c.id = newId(); c.x = rnd(it.x + 0.5); c.y = rnd(it.y - 0.5); c.z = scene.items.length
  scene.items.push(c)
  selected = c.id
  refreshAll()
}

function reorder(dir) {
  const it = scene.items.find(i => i.id === selected)
  if (!it) return
  pushUndo()
  const i = scene.items.indexOf(it)
  const j = Math.max(0, Math.min(scene.items.length - 1, i + dir))
  scene.items.splice(i, 1); scene.items.splice(j, 0, it)
  scene.items.forEach((x, k) => { x.z = k })
  paintAll(); updateCode(); saveDraft()
}

// ---------- bảng thuộc tính ----------
function syncInspectorPos() {
  const it = scene.items.find(i => i.id === selected)
  if (!it) return
  for (const [id, v] of [['edX', it.x], ['edY', it.y], ['edR', it.r], ['edS', it.s]]) { const n = $(id); if (n && document.activeElement !== n) n.value = String(v) }
}

function renderInspector() {
  const box = $('edInspector')
  const it = scene.items.find(i => i.id === selected)
  if (!it) { box.innerHTML = '<p class="muted">Kéo một mẫu từ kho vào bảng, hoặc bấm vào mẫu để thêm. Bấm vào hình trên bảng để chọn rồi kéo, xoay, đổi cỡ.</p>'; return }
  const st = STAMP_MAP.get(it.k)
  box.replaceChildren()
  const h = document.createElement('h4'); h.textContent = st.n; box.append(h)
  let tm = 0
  const later = () => { clearTimeout(tm); tm = setTimeout(() => refreshAll(), 280) }
  const grid = document.createElement('div'); grid.className = 'ed-pos'
  const mkNum = (id, label, val, onChange, step = 0.1) => {
    const l = document.createElement('label'); l.textContent = label
    const i = Object.assign(document.createElement('input'), { type: 'number', id, value: String(val), step: String(step) })
    i.addEventListener('input', () => { const v = Number(i.value); if (Number.isFinite(v)) { onChange(v); paintItem(it); updateCode(); saveDraft() } })
    i.addEventListener('focus', () => pushUndo())
    l.append(i); grid.append(l)
  }
  mkNum('edX', 'X (cm)', it.x, v => { it.x = v })
  mkNum('edY', 'Y (cm)', it.y, v => { it.y = v })
  mkNum('edR', 'Xoay (°)', it.r, v => { it.r = v; later() }, 5)
  mkNum('edS', 'Tỉ lệ', it.s, v => { it.s = Math.max(0.1, v); later() }, 0.1)
  box.append(grid)
  const row = document.createElement('div'); row.className = 'ed-btns'
  const btn = (t, f, title) => { const b = Object.assign(document.createElement('button'), { type: 'button', textContent: t, title: title || t }); b.addEventListener('click', f); row.append(b) }
  btn('↻ 15°', () => { pushUndo(); it.r = ((it.r || 0) + 15) % 360; refreshAll() }, 'Xoay thêm 15°')
  btn('↺ 15°', () => { pushUndo(); it.r = ((it.r || 0) - 15 + 360) % 360; refreshAll() }, 'Xoay ngược 15°')
  btn('⇋ Lật', () => { pushUndo(); it.f = !it.f; refreshAll() }, 'Lật ngang')
  btn('⧉ Nhân đôi', duplicateSelected)
  btn('▲ Lên trên', () => reorder(1))
  btn('▼ Xuống dưới', () => reorder(-1))
  btn('🗑 Xóa', removeSelected)
  box.append(row)
  const al = document.createElement('div'); al.className = 'ed-btns ed-align'
  const ext = () => { const im = imgs.get(it.id); if (!im || im.error) return null; const k = 1 / PT_PER_CM; return { l: it.x - im.ox * k * (it.s || 1), w: im.wPt * k * (it.s || 1), t: it.y + im.oy * k * (it.s || 1), h: im.hPt * k * (it.s || 1) } }
  const abtn = (t, title, f) => { const b = Object.assign(document.createElement('button'), { type: 'button', textContent: t, title }); b.addEventListener('click', () => { const e = ext(); if (!e) return; pushUndo(); f(e); refreshAll() }); al.append(b) }
  abtn('⇤', 'Căn sát trái bảng', e => { it.x = rnd(it.x - e.l + 0.2) })
  abtn('↔', 'Căn giữa ngang', e => { it.x = rnd(it.x + (scene.W / 2 - (e.l + e.w / 2))) })
  abtn('⇥', 'Căn sát phải bảng', e => { it.x = rnd(it.x + (scene.W - 0.2 - (e.l + e.w))) })
  abtn('⤒', 'Căn sát trên bảng', e => { it.y = rnd(it.y + (scene.H - 0.2 - e.t)) })
  abtn('↕', 'Căn giữa dọc', e => { it.y = rnd(it.y + (scene.H / 2 - (e.t - e.h / 2))) })
  abtn('⤓', 'Căn sát dưới bảng', e => { it.y = rnd(it.y - (e.t - e.h - 0.2)) })
  box.append(al)
  if (st.props.length) {
    const p = document.createElement('div'); p.className = 'ed-props'
    let timer = 0
    const changed = () => { clearTimeout(timer); timer = setTimeout(() => { refreshAll() }, 320) }
    for (const pr of st.props) {
      const label = document.createElement('label'); label.textContent = pr.l
      let input
      const cur = it.p[pr.k] ?? pr.def
      if (pr.t === 'bool') { input = Object.assign(document.createElement('input'), { type: 'checkbox', checked: !!cur }); input.addEventListener('change', () => { pushUndo(); it.p[pr.k] = input.checked; changed() }) }
      else if (pr.t === 'sel') {
        input = document.createElement('select')
        for (const o of pr.opts) { const [v, t] = Array.isArray(o) ? o : [o, o]; input.append(Object.assign(document.createElement('option'), { value: v, textContent: t })) }
        input.value = String(cur)
        input.addEventListener('change', () => { pushUndo(); it.p[pr.k] = input.value; changed() })
      } else if (pr.t === 'col') { input = Object.assign(document.createElement('input'), { type: 'color', value: `#${String(cur).replace('#', '')}` }); input.addEventListener('input', () => { it.p[pr.k] = input.value.replace('#', ''); changed() }); input.addEventListener('focus', () => pushUndo()) }
      else if (pr.t === 'num') { input = Object.assign(document.createElement('input'), { type: 'number', value: String(cur), step: String(pr.step ?? 'any'), min: pr.min ?? '', max: pr.max ?? '' }); input.addEventListener('input', () => { if (input.value !== '') { it.p[pr.k] = Number(input.value); changed() } }); input.addEventListener('focus', () => pushUndo()) }
      else { input = Object.assign(document.createElement('input'), { type: 'text', value: String(cur) }); input.addEventListener('input', () => { it.p[pr.k] = input.value; changed() }); input.addEventListener('focus', () => pushUndo()) }
      label.append(input); p.append(label)
    }
    box.append(p)
  }
}

// ---------- kho mẫu ----------
const VIRT = ['★ Yêu thích', '🕘 Gần đây']
function renderPalette() {
  const tabs = $('edGroups')
  tabs.replaceChildren(...[...GROUPS, ...VIRT].map(g => {
    const b = Object.assign(document.createElement('button'), { type: 'button', textContent: g })
    b.classList.toggle('on', g === group && !query)
    b.addEventListener('click', () => { group = g; $('edSearch').value = ''; query = ''; renderPalette() })
    return b
  }))
  const q = norm(query)
  const list = $('edPalette')
  list.replaceChildren()
  let items
  if (q) { const words = q.split(/\s+/).filter(Boolean); items = STAMPS.filter(s => { const h = norm(`${s.n} ${s.s} ${s.g} ${s.id}`); return words.every(w => h.includes(w)) }) }
  else if (group === VIRT[0]) items = STAMPS.filter(s => favs.has(s.id))
  else if (group === VIRT[1]) items = recent.map(id => STAMP_MAP.get(id)).filter(Boolean)
  else {
    items = STAMPS.filter(s => s.g === group)
    const order = [...new Set(items.map(s => s.s))]
    items.sort((a, b) => order.indexOf(a.s) - order.indexOf(b.s))
  }
  if (q) { const n = document.createElement('div'); n.className = 'count'; n.textContent = `${items.length} mẫu khớp "${query}"`; list.append(n) }
  const real = !q && !VIRT.includes(group)
  const counts = {}
  if (real) for (const s of items) counts[s.s] = (counts[s.s] || 0) + 1
  let sub = null
  for (const s of items) {
    if (real && s.s !== sub) {
      sub = s.s
      const h = document.createElement('h4'); h.className = closed.has(group + sub) ? 'shut' : ''
      const key = group + sub
      h.innerHTML = `<span class="car">▾</span> ${s.s} <em>${counts[s.s]}</em>`
      h.addEventListener('click', () => { closed.has(key) ? closed.delete(key) : closed.add(key); renderPalette() })
      list.append(h)
    }
    if (real && closed.has(group + s.s)) continue
    const card = document.createElement('div'); card.className = 'stamp'; card.draggable = true; card.title = `${s.n}\n(${s.g} › ${s.s}) — kéo vào bảng hoặc bấm để thêm`; card.dataset.id = s.id
    const img = document.createElement('img'); img.loading = 'lazy'; img.alt = ''; img.src = `draw/stamps/${s.id}.svg`; img.draggable = false
    const n = document.createElement('span'); n.textContent = s.n
    const star = document.createElement('button'); star.type = 'button'; star.className = `star${favs.has(s.id) ? ' on' : ''}`; star.textContent = favs.has(s.id) ? '★' : '☆'; star.title = 'Thêm/bỏ khỏi Yêu thích'
    star.addEventListener('click', e => { e.stopPropagation(); favs.has(s.id) ? favs.delete(s.id) : favs.add(s.id); saveLS(); renderPalette() })
    card.append(img, n, star)
    card.addEventListener('click', () => { addItem(s.id); if (group === VIRT[1]) renderPalette() })
    card.addEventListener('dragstart', e => { e.dataTransfer.setData('text/sm-stamp', s.id); e.dataTransfer.effectAllowed = 'copy' })
    list.append(card)
  }
  if (!items.length) { const n = document.createElement('div'); n.className = 'none'; n.textContent = q ? 'Không thấy mẫu nào. Thử từ khóa ngắn hơn (vd. "elip", "kiềng", "chóp").' : group === VIRT[0] ? 'Chưa có mẫu yêu thích: bấm ☆ trên thẻ mẫu để ghim.' : 'Chưa dùng mẫu nào.'; list.append(n) }
}

// ---------- mã Typst, lưu nháp ----------
function code() { return sceneDocument(scene.items, scene.W, scene.H) }

function updateCode() {
  const c = $('edCount'); if (c) c.textContent = `${scene.items.length} mẫu`
  const t = $('edCode'); if (t && !t.matches(':focus')) t.value = code() }

const DRAFT = 'sangmath.editor.draft'
function saveDraft() { try { localStorage.setItem(DRAFT, JSON.stringify({ ...scene, uid })) } catch { /* bỏ qua */ } }
function loadDraft() {
  try {
    const d = JSON.parse(localStorage.getItem(DRAFT) || 'null')
    if (d && Array.isArray(d.items)) { scene.W = d.W; scene.H = d.H; scene.items = d.items.filter(i => STAMP_MAP.has(i.k)); uid = d.uid || (scene.items.length + 100) }
  } catch { /* bỏ qua */ }
}

// ---------- xuất ----------
async function finalImage() {
  if (!scene.items.length) throw new Error('Bảng vẽ đang trống.')
  const image = await renderFigure(code())
  return image
}

function sized(image) {
  const target = Number($('edWidth').value) * PT_PER_CM
  const w = Math.min(image.widthPt, target > 0 ? target : image.widthPt)
  const k = w / image.widthPt
  return { ...image, widthPt: image.widthPt * k, heightPt: image.heightPt * k }
}

const fmt = () => (document.querySelector('input[name=edfmt]:checked') || {}).value || 'svgn'

async function act(fn) {
  try {
    host.showError('')
    const image = await finalImage()
    if (!bridge) { host.showError('Chưa kết nối Word: dùng "Sao chép ảnh" hoặc "Lưu SVG".'); return }
    await fn({ image: sized(image), meta: { l: 'draw', sc: sceneForMeta() }, format: fmt(), numbered: false })
  } catch (err) { host.showError(String(err.message || err).split('\n')[0]) }
}

function sceneForMeta() {
  return { W: scene.W, H: scene.H, items: scene.items.map(({ id, ...r }) => r) }
}

function setBridgeButtons() {
  if (getB) bridge = getB() // cầu nối Word được gán sau khi Office sẵn sàng: luôn đọc lại
  $('edInsert').hidden = editingInWord || !bridge
  $('edUpdate').hidden = !editingInWord || !bridge
}

// ---------- khởi tạo ----------
export function loadScene(sc, fromWord = false) {
  scene.W = sc.W || 22; scene.H = sc.H || 13
  scene.items = (sc.items || []).filter(i => STAMP_MAP.has(i.k)).map((i, k) => ({ ...i, id: newId(), z: i.z ?? k }))
  selected = null; imgs.clear(); undo = []; redo = []
  editingInWord = fromWord
  $('edW').value = scene.W; $('edH').value = scene.H
  layoutStage(); refreshAll(); setBridgeButtons()
}

export function setEditingInWord(on) { editingInWord = on; setBridgeButtons() }

export function initEditor(getBridge, hostApi) {
  host = hostApi
  getB = getBridge
  const sync = () => { bridge = getBridge(); setBridgeButtons() }
  sync()
  loadDraft()
  $('edW').value = scene.W; $('edH').value = scene.H
  renderPalette()
  layoutStage()
  scene.items.forEach(it => ensureImage(it))
  renderInspector(); updateCode()

  $('edSearch').addEventListener('input', () => { query = $('edSearch').value.trim(); renderPalette() })
  for (const id of ['edW', 'edH']) $(id).addEventListener('change', () => {
    pushUndo()
    scene.W = Math.max(6, Math.min(40, Number($('edW').value) || 22)); scene.H = Math.max(4, Math.min(30, Number($('edH').value) || 13))
    layoutStage(); paintAll(); updateCode(); saveDraft()
  })
  $('edSnap').addEventListener('change', () => { snap = $('edSnap').checked })
  $('edGrid').addEventListener('change', () => { showGrid = $('edGrid').checked; layoutStage() })
  const setZoom = z => { zoom = Math.max(0.4, Math.min(3, Math.round(z * 100) / 100)); layoutStage(); paintAll() }
  $('edZoomIn').addEventListener('click', () => setZoom(zoom * 1.2))
  $('edZoomOut').addEventListener('click', () => setZoom(zoom / 1.2))
  $('edZoomFit').addEventListener('click', () => setZoom(1))
  $('edStageWrap').addEventListener('wheel', e => { if (e.ctrlKey || e.metaKey) { e.preventDefault(); setZoom(zoom * (e.deltaY < 0 ? 1.1 : 1 / 1.1)) } }, { passive: false })
  $('edPreset').addEventListener('change', () => {
    const v = $('edPreset').value; if (!v) return
    const [w, h] = v.split('x').map(Number); pushUndo(); scene.W = w; scene.H = h; $('edW').value = w; $('edH').value = h
    layoutStage(); paintAll(); updateCode(); saveDraft()
  })
  $('edStage').addEventListener('pointermove', e => { const p = stagePoint(e); const o = $('edPos'); if (o) o.textContent = `x: ${p.x.toFixed(1)} cm, y: ${p.y.toFixed(1)} cm` })
  $('edFit').addEventListener('click', () => {
    if (!scene.items.length) return
    let x0 = Infinity, x1 = -Infinity, y0 = Infinity, y1 = -Infinity
    for (const it of scene.items) {
      const im = imgs.get(it.id); if (!im || im.error) continue
      const k = 1 / PT_PER_CM, sc = it.s || 1, a = -(it.r || 0) * Math.PI / 180
      for (const [cx, cy] of [[0, 0], [im.wPt, 0], [im.wPt, im.hPt], [0, im.hPt]]) {
        const dx = (cx - im.ox) * k * sc * (it.f ? -1 : 1), dy = -(cy - im.oy) * k * sc // y lên trên
        const rx = dx * Math.cos(a) - dy * Math.sin(a), ry = dx * Math.sin(a) + dy * Math.cos(a)
        x0 = Math.min(x0, it.x + rx); x1 = Math.max(x1, it.x + rx); y0 = Math.min(y0, it.y + ry); y1 = Math.max(y1, it.y + ry)
      }
    }
    if (!Number.isFinite(x0)) return
    pushUndo()
    const m = 0.5
    const W = Math.max(6, Math.min(40, Math.ceil((x1 - x0 + 2 * m) * 2) / 2)), H = Math.max(4, Math.min(30, Math.ceil((y1 - y0 + 2 * m) * 2) / 2))
    const dx = m - x0 + (W - (x1 - x0 + 2 * m)) / 2, dy = m - y0 + (H - (y1 - y0 + 2 * m)) / 2
    for (const it of scene.items) { it.x = rnd(it.x + dx); it.y = rnd(it.y + dy) }
    scene.W = W; scene.H = H; $('edW').value = W; $('edH').value = H
    layoutStage(); refreshAll()
  })
  $('edUndo').addEventListener('click', doUndo)
  $('edRedo').addEventListener('click', doRedo)
  $('edClear').addEventListener('click', () => { if (!scene.items.length) return; pushUndo(); scene.items = []; imgs.clear(); selected = null; refreshAll() })

  const stage = $('edStage')
  stage.addEventListener('pointerdown', e => {
    const el = e.target.closest('.sitem')
    if (!el) { select(null); return }
    const it = scene.items.find(i => i.id === el.dataset.id)
    if (it && !e.target.closest('.h-rot, .h-scl')) startDrag(e, it)
  })
  stage.addEventListener('dragover', e => { if (e.dataTransfer.types.includes('text/sm-stamp')) { e.preventDefault(); e.dataTransfer.dropEffect = 'copy' } })
  stage.addEventListener('drop', e => {
    const id = e.dataTransfer.getData('text/sm-stamp')
    if (!id) return
    e.preventDefault()
    const p = stagePoint(e)
    addItem(id, snapv(p.x), snapv(p.y))
  })
  window.addEventListener('sm-bridge', () => setBridgeButtons())
  window.addEventListener('sm-view', e => { if (e.detail === 'figure' && !$('edMode').hidden) setTimeout(onShow, 0) })
  window.addEventListener('resize', () => { if (!$('edMode').hidden) { layoutStage(); paintAll() } })
  new ResizeObserver(() => { if (!$('edMode').hidden) { layoutStage(); paintAll() } }).observe($('edStageWrap'))

  window.addEventListener('keydown', e => {
    if ($('edMode').hidden || $('figureView').hidden) return
    if (e.target.matches('input, textarea, select')) return
    const it = scene.items.find(i => i.id === selected)
    const meta = e.metaKey || e.ctrlKey
    if (meta && e.key.toLowerCase() === 'z') { e.preventDefault(); e.shiftKey ? doRedo() : doUndo(); return }
    if (meta && e.key.toLowerCase() === 'c' && it) { clip = clone(it); return }
    if (meta && e.key.toLowerCase() === 'v' && clip) { e.preventDefault(); pushUndo(); const c = clone(clip); c.id = newId(); c.x = rnd(c.x + 0.6); c.y = rnd(c.y - 0.6); c.z = scene.items.length; clip = clone(c); scene.items.push(c); selected = c.id; refreshAll(); return }
    if (meta && (e.key === '=' || e.key === '+')) { e.preventDefault(); $('edZoomIn').click(); return }
    if (meta && e.key === '-') { e.preventDefault(); $('edZoomOut').click(); return }
    if (meta && e.key.toLowerCase() === 'd') { e.preventDefault(); duplicateSelected(); return }
    if (e.key === 'Escape') { select(null); return }
    if (!it) return
    if (e.key === '[') { pushUndo(); it.r = ((it.r || 0) + 15) % 360; refreshAll(); return }
    if (e.key === ']') { pushUndo(); it.r = ((it.r || 0) - 15 + 360) % 360; refreshAll(); return }
    if (e.key === 'Delete' || e.key === 'Backspace') { e.preventDefault(); removeSelected(); return }
    const step = e.shiftKey ? 0.5 : 0.1
    const mv = { ArrowLeft: [-step, 0], ArrowRight: [step, 0], ArrowUp: [0, step], ArrowDown: [0, -step] }[e.key]
    if (mv) { e.preventDefault(); pushUndo(); it.x = rnd(it.x + mv[0]); it.y = rnd(it.y + mv[1]); paintItem(it); syncInspectorPos(); updateCode(); saveDraft() }
  })

  $('edInsert').addEventListener('click', () => { sync(); act(p => bridge.insertFormula(p)) })
  $('edUpdate').addEventListener('click', () => { sync(); act(p => bridge.replaceSelectedFormula(p)) })
  $('edCopy').addEventListener('click', async () => {
    try {
      const image = await finalImage()
      const bytes = Uint8Array.from(atob(image.png), c => c.charCodeAt(0))
      await navigator.clipboard.write([new ClipboardItem({ 'image/png': new Blob([bytes], { type: 'image/png' }) })])
      $('edCopy').textContent = 'Đã chép'; setTimeout(() => { $('edCopy').textContent = 'Sao chép ảnh' }, 2200)
    } catch (err) { host.showError(String(err.message || err).split('\n')[0]) }
  })
  $('edSave').addEventListener('click', async () => {
    try {
      const image = await finalImage()
      const a = Object.assign(document.createElement('a'), { href: URL.createObjectURL(new Blob([image.svg], { type: 'image/svg+xml' })), download: 'hinh-ve.svg' })
      document.body.append(a); a.click(); a.remove()
    } catch (err) { host.showError(String(err.message || err).split('\n')[0]) }
  })
  $('edSavePng').addEventListener('click', async () => {
    try {
      const image = await finalImage()
      const bytes = Uint8Array.from(atob(image.png), c => c.charCodeAt(0))
      const a = Object.assign(document.createElement('a'), { href: URL.createObjectURL(new Blob([bytes], { type: 'image/png' })), download: 'hinh-ve.png' })
      document.body.append(a); a.click(); a.remove()
    } catch (err) { host.showError(String(err.message || err).split('\n')[0]) }
  })
  $('edSaveProj').addEventListener('click', () => {
    const data = JSON.stringify({ app: 'sangmath-editor', v: 1, W: scene.W, H: scene.H, items: scene.items.map(({ id, ...r }) => r) }, null, 1)
    const a = Object.assign(document.createElement('a'), { href: URL.createObjectURL(new Blob([data], { type: 'application/json' })), download: 'du-an-ve-hinh.json' })
    document.body.append(a); a.click(); a.remove()
  })
  $('edOpenProj').addEventListener('click', () => $('edProjFile').click())
  $('edProjFile').addEventListener('change', async () => {
    const f = $('edProjFile').files[0]; $('edProjFile').value = ''
    if (!f) return
    try {
      const d = JSON.parse(await f.text())
      if (d.app !== 'sangmath-editor' || !Array.isArray(d.items)) throw new Error('Đây không phải tệp dự án Sang Math.')
      pushUndo(); loadScene(d)
    } catch (err) { host.showError(String(err.message || err).split('\n')[0]) }
  })
  $('edToCode').addEventListener('click', () => host.openInCodeMode(code()))
  $('edCode').addEventListener('focus', () => { $('edCode').value = code() })
  if (location.search.includes('debug')) window.__ed = { scene, addItem, select, code, loadScene, finalImage }
}

export function onShow() { layoutStage(); paintAll(); setBridgeButtons() }
