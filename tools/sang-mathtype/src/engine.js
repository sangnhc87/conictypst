// Lõi render công thức: Typst hoặc LaTeX (qua mitex) -> PNG trong suốt + đo baseline.
// Chạy hoàn toàn trong trình duyệt (WASM của typst.ts), không cần server.
import { spaceCases, pairBars, unicodeCompat } from './latex-prep.js'
import {
  createTypstCompiler,
  createTypstRenderer,
  loadFonts,
} from '@myriaddreamin/typst.ts/dist/esm/main.mjs'

const FONT_FILES = [
  'NewCM10-Regular.otf', 'NewCM10-Italic.otf', 'NewCM10-Bold.otf',
  'NewCMMath-Regular.otf', 'NewCMMath-Bold.otf',
]
const MITEX_FILES = [
  'lib.typ', 'mitex.typ', 'typst.toml', 'mitex.wasm',
  'specs/mod.typ', 'specs/prelude.typ', 'specs/latex/standard.typ',
]
const MARKER = '#ff00fe'
const HIT_ALPHA = 0.02 // độ đục của nền vùng bấm
let SCALE = 8 // px trên mỗi pt -> 576 PPI, đủ nét cho in ấn
const DEFAULT_SCALE = 8
/** Add-in trên Word Online/Windows: ảnh nhỏ hơn (360 PPI, vẫn nét) để chèn nhanh hơn. */
export function setScale(n) { SCALE = n }
const currentScale = () => SCALE
/** PNG dự phòng nhỏ (1/3 độ phân giải) cho chế độ SVG: Word 2016+ dùng SVG nên PNG chỉ phòng khi mở bằng bản cũ; file nhẹ hơn rõ rệt. */
function liteCanvas(c, f = 3) {
  const o = document.createElement('canvas')
  o.width = Math.max(1, Math.round(c.width / f)); o.height = Math.max(1, Math.round(c.height / f))
  const x = o.getContext('2d'); x.imageSmoothingQuality = 'high'; x.drawImage(c, 0, 0, o.width, o.height)
  return o.toDataURL('image/png').split(',')[1]
}

let ready = null

async function fetchBytes(url) {
  const res = await fetch(url)
  if (!res.ok) throw new Error(`Không tải được ${url} (${res.status})`)
  return new Uint8Array(await res.arrayBuffer())
}

export function initEngine(base = './') {
  if (ready) return ready
  ready = (async () => {
    const [compilerParts, rendererWasm, ...fonts] = await Promise.all([
      Promise.all([fetchBytes(`${base}wasm/compiler.part0.wasm`), fetchBytes(`${base}wasm/compiler.part1.wasm`)]),
      fetchBytes(`${base}wasm/renderer.wasm`),
      ...FONT_FILES.map(name => fetchBytes(`${base}fonts/${name}`)),
    ])
    const compilerWasm = new Uint8Array(compilerParts[0].length + compilerParts[1].length)
    compilerWasm.set(compilerParts[0])
    compilerWasm.set(compilerParts[1], compilerParts[0].length)
    const compiler = createTypstCompiler()
    await compiler.init({
      getModule: () => compilerWasm,
      beforeBuild: [loadFonts(fonts, { assets: false })],
    })
    const renderer = createTypstRenderer()
    await renderer.init({ getModule: () => rendererWasm })
    for (const file of MITEX_FILES) {
      const bytes = await fetchBytes(`${base}mitex/${file}`)
      if (file.endsWith('.wasm')) compiler.mapShadow(`/mitex/${file}`, bytes)
      else compiler.addSource(`/mitex/${file}`, new TextDecoder().decode(bytes))
    }
    return { compiler, renderer }
  })()
  ready.catch(() => { ready = null })
  return ready
}

// Chọn hàng rào backtick dài hơn mọi dãy backtick trong mã nguồn.
function raw(code) {
  const longest = Math.max(0, ...(code.match(/`+/g) || []).map(s => s.length))
  const fence = '`'.repeat(Math.max(3, longest + 1))
  // khoảng trắng sau hàng rào để Typst không coi đoạn đầu là tên ngôn ngữ của khối raw
  return `${fence} ${code} ${fence}`
}

function body({ lang, code, display }) {
  if (lang === 'latex') {
    code = unicodeCompat(pairBars(spaceCases(code)))
    const macro = display ? 'mitex' : 'mi'
    return `#let f = ${macro}(${raw(code)})`
  }
  return `#let f = $${code}$`
}

function source(opts, withMarker) {
  const size = opts.size
  const margin = Math.round(size * 1.6 * 10) / 10
  const marker = withMarker
    ? `#box(width: 1pt, height: 0.5pt, fill: rgb("${MARKER}"))`
    : '#h(1pt)'
  return [
    '#import "/mitex/lib.typ": mi, mitex',
    `#set page(width: auto, height: auto, margin: ${margin}pt, fill: none)`,
    `#set text(size: ${size}pt, fill: rgb("${opts.color}"), font: ("New Computer Modern", "NewCM10"), lang: "vi")`,
    '#set par(leading: 0pt)',
    body(opts),
    // display: dùng cỡ chữ của công thức đứng riêng (phân số to, cận tích phân ở trên/dưới)
    `${marker}#box(${opts.display ? '$display(#f)$' : 'f'})`,
  ].join('\n')
}

let compileChain = Promise.resolve()

// Mọi lần dịch dùng chung tệp /main.typ nên phải xếp hàng, tránh hai việc ghi đè nhau.
function compileSvg(engine, src) {
  const run = compileChain.then(() => compileOnce(engine, src))
  compileChain = run.catch(() => {})
  return run
}

async function compileOnce(engine, src) {
  const { compiler, renderer } = engine
  compiler.addSource('/main.typ', src)
  const out = await compiler.compile({ mainFilePath: '/main.typ', format: 'vector', diagnostics: 'full' })
  const errors = (out.diagnostics || []).filter(d => (d.severity || 'error') === 'error')
  if (errors.length || !out.result) {
    const msg = errors.map(d => d.message).join('\n') || 'Không biên dịch được công thức.'
    throw new Error(msg)
  }
  return renderer.runWithSession(async session => {
    renderer.manipulateData({ renderSession: session, action: 'reset', data: out.result })
    return renderer.renderSvg({ renderSession: session })
  })
}

function rasterize(svg, scale) {
  const SCALE = scale ?? currentScale()
  return new Promise((resolve, reject) => {
    const vb = svg.match(/viewBox="0 0 ([\d.]+) ([\d.]+)"/)
    if (!vb) return reject(new Error('SVG không có viewBox.'))
    const wPt = parseFloat(vb[1])
    const hPt = parseFloat(vb[2])
    const w = Math.ceil(wPt * SCALE)
    const h = Math.ceil(hPt * SCALE)
    const clean = svg.replace(/<script[\s\S]*?<\/script>/g, '')
    const sized = clean.replace(/<svg ([^>]*?)width="[^"]*" height="[^"]*"/, `<svg $1width="${w}" height="${h}"`)
    const img = new Image()
    img.onload = () => {
      const canvas = document.createElement('canvas')
      canvas.width = w
      canvas.height = h
      const ctx = canvas.getContext('2d', { willReadFrequently: true })
      ctx.drawImage(img, 0, 0, w, h)
      resolve({ canvas, ctx, w, h })
    }
    img.onerror = () => { globalThis.__lastSvg = sized; reject(new Error('Không dựng được ảnh từ SVG.')) }
    img.src = `data:image/svg+xml;charset=utf-8,${encodeURIComponent(sized)}`
  })
}

// SVG của typst.ts mang theo CSS, script, foreignObject và <use>; Word chỉ ổn với path thuần nên làm phẳng.
function flattenSvg(svgText, viewBox, hitBox = false) {
  const doc = new DOMParser().parseFromString(svgText.replace(/<script[\s\S]*?<\/script>/g, ''), 'image/svg+xml')
  const svg = doc.documentElement
  if (svg.nodeName !== 'svg') throw new Error('SVG không hợp lệ.')
  const glyphs = new Map()
  for (const p of doc.querySelectorAll('defs.glyph > path')) glyphs.set(p.getAttribute('id'), p.getAttribute('d'))
  for (const n of doc.querySelectorAll('style, foreignObject, title, desc')) n.remove()
  // giữ lại gradient/clip/mask (mô hình quả cầu dùng tô chuyển màu); chỉ bỏ kho glyph vì đã đổi thành path
  for (const n of doc.querySelectorAll('defs')) { if (n.classList.contains('glyph') || !n.querySelector('linearGradient, radialGradient, clipPath, mask, pattern')) n.remove() }
  for (const u of [...doc.querySelectorAll('use')]) {
    const id = (u.getAttribute('href') || u.getAttribute('xlink:href') || '').replace(/^#/, '')
    const d = glyphs.get(id)
    if (!d) { u.remove(); continue }
    const path = doc.createElementNS('http://www.w3.org/2000/svg', 'path')
    path.setAttribute('d', d)
    const x = u.getAttribute('x'), y = u.getAttribute('y')
    if ((x && x !== '0') || (y && y !== '0')) path.setAttribute('transform', `translate(${x || 0} ${y || 0})`)
    u.replaceWith(path)
  }
  for (const n of doc.querySelectorAll('*')) {
    for (const a of [...n.attributes]) if (a.name.startsWith('data-') || a.name === 'class') n.removeAttribute(a.name)
  }
  svg.removeAttribute('style')
  svg.removeAttribute('xmlns:h5')
  const [x, y, w, h] = viewBox
  svg.setAttribute('viewBox', `${x.toFixed(3)} ${y.toFixed(3)} ${w.toFixed(3)} ${h.toFixed(3)}`)
  svg.setAttribute('width', `${w.toFixed(3)}pt`)
  svg.setAttribute('height', `${h.toFixed(3)}pt`)
  if (hitBox) {
    const rect = doc.createElementNS('http://www.w3.org/2000/svg', 'rect')
    rect.setAttribute('x', x.toFixed(3)); rect.setAttribute('y', y.toFixed(3))
    rect.setAttribute('width', w.toFixed(3)); rect.setAttribute('height', h.toFixed(3))
    rect.setAttribute('fill', '#ffffff'); rect.setAttribute('fill-opacity', String(HIT_ALPHA))
    svg.insertBefore(rect, svg.firstChild)
  }
  return new XMLSerializer().serializeToString(svg)
}

function inkBounds(ctx, w, h) {
  const { data } = ctx.getImageData(0, 0, w, h)
  let x0 = w, y0 = h, x1 = -1, y1 = -1
  for (let y = 0; y < h; y++) {
    for (let x = 0; x < w; x++) {
      if (data[(y * w + x) * 4 + 3] > 8) {
        if (x < x0) x0 = x
        if (x > x1) x1 = x
        if (y < y0) y0 = y
        if (y > y1) y1 = y
      }
    }
  }
  return x1 < 0 ? null : { x0, y0, x1, y1 }
}

function markerBaseline(ctx, w, h) {
  const { data } = ctx.getImageData(0, 0, w, h)
  let bottom = -1
  for (let y = 0; y < h; y++) {
    for (let x = 0; x < w; x++) {
      const i = (y * w + x) * 4
      if (data[i] > 230 && data[i + 1] < 40 && data[i + 2] > 220 && data[i + 3] > 200) bottom = Math.max(bottom, y)
    }
  }
  return bottom < 0 ? null : bottom + 1 // cạnh dưới của marker = baseline
}

/**
 * opts: { lang: 'typst'|'latex', code, size (pt), color '#rrggbb', display (bool) }
 * trả về { png (base64), widthPt, heightPt, descentPt, pxW, pxH }
 */
export async function renderFormula(opts) {
  const engine = await initEngine()
  const code = opts.code.trim()
  if (!code) throw new Error('Chưa nhập công thức.')
  const o = { ...opts, code }

  // Lượt 1 (có marker) chỉ để đo baseline; lượt 2 là ảnh thật, bố cục giống hệt.
  const [svgMark, svgReal] = [
    await compileSvg(engine, source(o, true)),
    await compileSvg(engine, source(o, false)),
  ]
  const mark = await rasterize(svgMark)
  const baseline = markerBaseline(mark.ctx, mark.w, mark.h)
  const real = await rasterize(svgReal)
  const box = inkBounds(real.ctx, real.w, real.h)
  if (!box) throw new Error('Công thức không có nội dung hiển thị.')

  // Chừa lề nhỏ quanh nét (1,5pt ngang, 1pt dọc) và phủ nền gần như trong suốt (2%) để Word nhận bấm chuột
  // trên TOÀN BỘ vùng công thức, không chỉ ở đúng nét chữ.
  const padX = Math.round(1.5 * SCALE)
  const padY = Math.round(1 * SCALE)
  const sx = Math.max(0, box.x0 - padX)
  const sy = Math.max(0, box.y0 - padY)
  const sw = Math.min(real.w - sx, box.x1 - box.x0 + 1 + padX * 2)
  const sh = Math.min(real.h - sy, box.y1 - box.y0 + 1 + padY * 2)
  const out = document.createElement('canvas')
  out.width = sw
  out.height = sh
  const octx = out.getContext('2d')
  octx.fillStyle = `rgba(255,255,255,${HIT_ALPHA})`
  octx.fillRect(0, 0, sw, sh)
  octx.drawImage(real.canvas, sx, sy, sw, sh, 0, 0, sw, sh)

  const base = baseline ?? box.y1 + 1
  const svg = flattenSvg(svgReal, [sx / SCALE, sy / SCALE, sw / SCALE, sh / SCALE], true)
  return {
    svg,
    png: out.toDataURL('image/png').split(',')[1],
    pngLite: liteCanvas(out),
    pngTiny: liteCanvas(out, 8),
    pxW: sw,
    pxH: sh,
    widthPt: sw / SCALE,
    heightPt: sh / SCALE,
    // phần ảnh nằm dưới baseline (pt): dùng để hạ ảnh xuống cho thẳng hàng chữ
    descentPt: Math.max(0, (sy + sh - base) / SCALE),
  }
}

const iconCache = new Map()

/** Biểu tượng nhỏ (data URL SVG) cho nút trong bảng ký hiệu; mã Typst chỉ là phần công thức (không có ⟦⟧). */
export async function renderIcon(typst) {
  if (iconCache.has(typst)) return iconCache.get(typst)
  const engine = await initEngine()
  const src = [
    '#import "/mitex/lib.typ": mi, mitex',
    '#set page(width: auto, height: auto, margin: 3pt, fill: none)',
    '#set text(size: 15pt, font: ("New Computer Modern", "NewCM10"), lang: "vi")',
    `$ ${typst} $`,
  ].join('\n')
  const svg = await compileSvg(engine, src)
  const vb = svg.match(/viewBox="0 0 ([\d.]+) ([\d.]+)"/)
  const flat = flattenSvg(svg, [0, 0, parseFloat(vb[1]), parseFloat(vb[2])])
  const url = `data:image/svg+xml;charset=utf-8,${encodeURIComponent(flat)}`
  iconCache.set(typst, url)
  return url
}

// ---------- HÌNH VẼ (CeTZ) ----------
const FIG_PREAMBLE = '#set page(width: auto, height: auto, margin: 4pt, fill: none)\n#set text(size: 10pt, font: ("New Computer Modern", "NewCM10"), lang: "vi")\n'
let drawReady = null

/** Nạp CeTZ + sm-draw.typ vào bộ dịch (một lần). Trả về danh sách mẫu. */
export function initDraw(base = './') {
  if (drawReady) return drawReady
  drawReady = (async () => {
    const engine = await initEngine(base)
    const manifest = await (await fetch(`${base}draw/manifest.json`)).json()
    await Promise.all(manifest.files.map(async f => {
      const res = await fetch(`${base}draw${f}`)
      if (!res.ok) throw new Error(`Không tải được ${f}`)
      if (f.endsWith('.wasm')) engine.compiler.mapShadow(f, new Uint8Array(await res.arrayBuffer()))
      else engine.compiler.addSource(f, await res.text())
    }))
    return manifest
  })()
  drawReady.catch(() => { drawReady = null })
  return drawReady
}

/** Dựng hình từ mã Typst/CeTZ. Trả về cùng dạng như renderFormula (descentPt = 0). */
export async function renderFigure(code, scale = 4) {
  const engine = await initEngine()
  await initDraw()
  const svgReal = await compileSvg(engine, FIG_PREAMBLE + code)
  const real = await rasterize(svgReal, scale)
  const box = inkBounds(real.ctx, real.w, real.h)
  if (!box) throw new Error('Hình không có nội dung hiển thị.')
  const pad = Math.round(2 * scale)
  const sx = Math.max(0, box.x0 - pad), sy = Math.max(0, box.y0 - pad)
  const sw = Math.min(real.w - sx, box.x1 - box.x0 + 1 + pad * 2)
  const sh = Math.min(real.h - sy, box.y1 - box.y0 + 1 + pad * 2)
  const outC = document.createElement('canvas')
  outC.width = sw; outC.height = sh
  const octx = outC.getContext('2d')
  octx.fillStyle = `rgba(255,255,255,${HIT_ALPHA})`
  octx.fillRect(0, 0, sw, sh)
  octx.drawImage(real.canvas, sx, sy, sw, sh, 0, 0, sw, sh)
  return {
    svg: flattenSvg(svgReal, [sx / scale, sy / scale, sw / scale, sh / scale], true),
    png: outC.toDataURL('image/png').split(',')[1],
    pngLite: liteCanvas(outC),
    pngTiny: liteCanvas(outC, 8),
    pxW: sw, pxH: sh, widthPt: sw / scale, heightPt: sh / scale, descentPt: 0,
  }
}

function markerCenter(ctx, w, h) {
  const { data } = ctx.getImageData(0, 0, w, h)
  let sx = 0, sy = 0, n = 0
  for (let y = 0; y < h; y++) {
    for (let x = 0; x < w; x++) {
      const i = (y * w + x) * 4
      if (data[i] > 200 && data[i + 1] < 90 && data[i + 2] > 190 && data[i + 3] > 120) { sx += x; sy += y; n++ }
    }
  }
  return n ? { x: sx / n + 0.5, y: sy / n + 0.5 } : null
}

const stampCache = new Map()

/**
 * Dựng một mẫu rời cho bảng vẽ: hai tài liệu cùng khung (một có chấm đánh dấu gốc, một sạch).
 * Trả về { svg, wPt, hPt, ox, oy } với (ox, oy) là vị trí gốc (pt) tính từ góc trên trái của ảnh.
 */
export async function renderStamp(key, docMarked, docClean) {
  if (stampCache.has(key)) return stampCache.get(key)
  const job = (async () => {
    const engine = await initEngine()
    await initDraw()
    const scale = 4
    const svgMark = await compileSvg(engine, FIG_PREAMBLE + docMarked)
    const mark = await rasterize(svgMark, scale)
    const c = markerCenter(mark.ctx, mark.w, mark.h)
    const svgClean = await compileSvg(engine, FIG_PREAMBLE + docClean)
    const vb = svgClean.match(/viewBox="0 0 ([\d.]+) ([\d.]+)"/)
    const wPt = parseFloat(vb[1])
    const hPt = parseFloat(vb[2])
    return { svg: flattenSvg(svgClean, [0, 0, wPt, hPt], false), wPt, hPt, ox: c ? c.x / scale : wPt / 2, oy: c ? c.y / scale : hPt / 2 }
  })()
  stampCache.set(key, job)
  job.catch(() => stampCache.delete(key))
  return job
}
