// Cầu nối với Word (Office.js): chèn công thức thành ảnh inline, đọc lại mã nguồn từ ảnh đang chọn.
const TAG = 'SMATH1:'

export function encodeMeta(meta) {
  return TAG + JSON.stringify(meta)
}

export function decodeMeta(descr) {
  if (!descr || !descr.startsWith(TAG)) return null
  try { return JSON.parse(descr.slice(TAG.length)) } catch { return null }
}

const esc = s => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;')

const NS = 'xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"'
const REL_NS = 'http://schemas.openxmlformats.org/package/2006/relationships'
const REL = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships'
export const b64 = text => {
  let bin = ''
  for (const byte of new TextEncoder().encode(text)) bin += String.fromCharCode(byte)
  return btoa(bin)
}

function part(name, type, body) {
  return `<pkg:part pkg:name="${name}" pkg:contentType="${type}">${body}</pkg:part>`
}

function wrapPackage(documentBody, rels, media) {
  return `<pkg:package xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage">
${part('/_rels/.rels', 'application/vnd.openxmlformats-package.relationships+xml', `<pkg:xmlData><Relationships xmlns="${REL_NS}"><Relationship Id="rId1" Type="${REL}/officeDocument" Target="word/document.xml"/></Relationships></pkg:xmlData>`)}
${part('/word/_rels/document.xml.rels', 'application/vnd.openxmlformats-package.relationships+xml', `<pkg:xmlData><Relationships xmlns="${REL_NS}">${rels}</Relationships></pkg:xmlData>`)}
${part('/word/document.xml', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml', `<pkg:xmlData><w:document ${NS}><w:body>${documentBody}</w:body></w:document></pkg:xmlData>`)}
${media}
</pkg:package>`
}

const PTAB = align => `<w:r><w:ptab w:relativeTo="margin" w:alignment="${align}" w:leader="none"/></w:r>`

/** Dòng đánh số: [căn giữa] công thức [căn phải] (n). n là trường SEQ tự tăng, cập nhật bằng F9 hoặc khi in. */
function numberedParagraph(contentXml) {
  const text = t => `<w:r><w:t>${t}</w:t></w:r>`
  const field = '<w:fldSimple w:instr=" SEQ Equation \\* ARABIC "><w:r><w:rPr><w:noProof/></w:rPr><w:t>1</w:t></w:r></w:fldSimple>'
  return `<w:p>${PTAB('center')}${contentXml}${PTAB('right')}${text('(')}${field}${text(')')}</w:p>`
}

const asParagraph = (contentXml, numbered) => numbered ? numberedParagraph(contentXml) : `<w:p>${contentXml}</w:p>`

/** Thẻ <w:r> chứa ảnh công thức (inline), hạ xuống đúng baseline, alt text mang mã nguồn. */
export function drawingRun(image, meta, id, rIdPng, rIdSvg, format) {
  const cx = Math.round(image.widthPt * 12700)
  const cy = Math.round(image.heightPt * 12700)
  const lower = -Math.round(image.descentPt * 2) // w:position tính theo nửa điểm, âm = hạ xuống
  const descr = esc(encodeMeta(meta))
  const blip = (format === 'svg' || format === 'svgn')
    ? `<a:blip r:embed="${rIdPng}"><a:extLst><a:ext uri="{96DAC541-7B7A-43D3-8B79-37D633B846F1}"><asvg:svgBlip xmlns:asvg="http://schemas.microsoft.com/office/drawing/2016/SVG/main" r:embed="${rIdSvg}"/></a:ext></a:extLst></a:blip>`
    : `<a:blip r:embed="${rIdPng}"/>`
  return `<w:r><w:rPr><w:noProof/><w:position w:val="${lower}"/></w:rPr><w:drawing><wp:inline distT="0" distB="0" distL="0" distR="0"><wp:extent cx="${cx}" cy="${cy}"/><wp:docPr id="${id}" name="Công thức ${id}" title="Công thức Sang Math" descr="${descr}"/><wp:cNvGraphicFramePr><a:graphicFrameLocks noChangeAspect="1"/></wp:cNvGraphicFramePr><a:graphic><a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture"><pic:pic><pic:nvPicPr><pic:cNvPr id="${id}" name="smath${id}.png" descr="${descr}"/><pic:cNvPicPr/></pic:nvPicPr><pic:blipFill>${blip}<a:stretch><a:fillRect/></a:stretch></pic:blipFill><pic:spPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="${cx}" cy="${cy}"/></a:xfrm><a:prstGeom prst="rect"><a:avLst/></a:prstGeom></pic:spPr></pic:pic></a:graphicData></a:graphic></wp:inline></w:drawing></w:r>`
}

/** format: 'png' | 'svg' (SVG + PNG dự phòng nhỏ) | 'svgn' (SVG nhẹ cho Office 2016+: PNG dự phòng rất nhỏ) */
export function packageXml(image, meta, id, format = 'png', numbered = false) {
  const svg = format === 'svg' || format === 'svgn'
  const fallback = format === 'svgn' ? (image.pngTiny || image.pngLite || image.png) : svg ? (image.pngLite || image.png) : image.png
  const run = drawingRun(image, meta, id, 'rId1', 'rId2', format)
  const rels = `<Relationship Id="rId1" Type="${REL}/image" Target="media/smath${id}.png"/>` +
    (svg ? `<Relationship Id="rId2" Type="${REL}/image" Target="media/smath${id}.svg"/>` : '')
  const media = part(`/word/media/smath${id}.png`, 'image/png', `<pkg:binaryData>${fallback}</pkg:binaryData>`) +
    (svg ? part(`/word/media/smath${id}.svg`, 'image/svg+xml', `<pkg:binaryData>${b64(image.svg)}</pkg:binaryData>`) : '')
  return wrapPackage(asParagraph(run, numbered), rels, media)
}

const newId = () => 1000 + Math.floor(Math.random() * 900000)

/** Chèn tại con trỏ (hoặc thay vùng chọn). payload: { image, meta, format, numbered }. */
export function insertFormula(payload) {
  return Word.run(async ctx => {
    try {
      ctx.document.getSelection().insertOoxml(build(payload), 'Replace')
      await ctx.sync()
      if (payload.numbered) await refreshNumbers(ctx)
    } catch (ooxmlErr) {
      // Dự phòng cho Word Online / môi trường chặn OOXML: chèn ảnh Base64 trực tiếp
      try {
        const pngBase64 = payload.image.pngLite || payload.image.png
        if (pngBase64) {
          const pic = ctx.document.getSelection().insertInlinePictureFromBase64(pngBase64, 'Replace')
          pic.altTextDescription = encodeMeta(payload.meta)
          pic.altTextTitle = 'Hình Sang Math'
          await ctx.sync()
          return
        }
      } catch {}
      throw ooxmlErr
    }
  })
}

// Cập nhật các trường SEQ để số thứ tự đúng ngay (Word cũ không có API này thì để F9).
async function refreshNumbers(ctx) {
  try {
    const fields = ctx.document.body.fields
    fields.load('items/code')
    await ctx.sync()
    for (const f of fields.items) if (/SEQ\s+Equation/.test(f.code)) f.updateResult()
    await ctx.sync()
  } catch { /* API không có: người dùng bấm F9 */ }
}

/** Thay công thức hình đang chọn bằng bản đã sửa. */
export function replaceSelectedFormula(payload) {
  return Word.run(async ctx => {
    const pics = ctx.document.getSelection().inlinePictures
    pics.load('items')
    await ctx.sync()
    const target = pics.items.length ? pics.items[0].getRange() : ctx.document.getSelection()
    try {
      target.insertOoxml(build(payload), 'Replace')
      await ctx.sync()
    } catch (ooxmlErr) {
      try {
        const pngBase64 = payload.image.pngLite || payload.image.png
        if (pngBase64) {
          const pic = target.insertInlinePictureFromBase64(pngBase64, 'Replace')
          pic.altTextDescription = encodeMeta(payload.meta)
          pic.altTextTitle = 'Hình Sang Math'
          await ctx.sync()
          return
        }
      } catch {}
      throw ooxmlErr
    }
  })
}

function build(payload) {
  return packageXml(payload.image, payload.meta, newId(), payload.format, payload.numbered)
}

/** Đọc mã nguồn công thức của ảnh đang chọn; null nếu không phải công thức Sang Math. */
export function readSelectedFormula() {
  return Word.run(async ctx => {
    const pics = ctx.document.getSelection().inlinePictures
    pics.load('items/altTextDescription')
    await ctx.sync()
    for (const pic of pics.items) {
      const meta = decodeMeta(pic.altTextDescription)
      if (meta) return meta
    }
    return null
  })
}

/**
 * Chuyển các Equation của Word thành hình Sang Math, từng đoạn một (đoạn không có Equation thì bỏ qua).
 * scope: 'sel' | 'doc'. makeImage(latex) -> { image, meta, format }. onProgress(done, total).
 */
export async function convertEquations(scope, makeImage, onProgress) {
  const { convertPackage, countEquations } = await import('./convert.js')
  let converted = 0, failed = 0
  await Word.run(async ctx => {
    const paras = (scope === 'sel' ? ctx.document.getSelection() : ctx.document.body).paragraphs
    paras.load('items')
    await ctx.sync()
    const oox = paras.items.map(p => p.getOoxml())
    await ctx.sync()
    const todo = paras.items.map((p, i) => ({ p, xml: oox[i].value })).filter(x => countEquations(x.xml) > 0)
    let done = 0
    for (const { p, xml } of todo) {
      const r = await convertPackage(xml, makeImage)
      if (r.converted) { p.insertOoxml(r.xml, 'Replace'); await ctx.sync() }
      converted += r.converted; failed += r.failed
      onProgress?.(++done, todo.length)
    }
  })
  return { converted, failed }
}

/** Chiều ngược: đổi công thức Sang Math (hình) thành Equation của Word, từng đoạn một. */
export async function convertToEquations(scope, onProgress) {
  const { convertPictures, countFormulas } = await import('./toequation.js')
  let converted = 0, failed = 0
  await Word.run(async ctx => {
    const paras = (scope === 'sel' ? ctx.document.getSelection() : ctx.document.body).paragraphs
    paras.load('items')
    await ctx.sync()
    const oox = paras.items.map(p => p.getOoxml())
    await ctx.sync()
    const todo = paras.items.map((p, i) => ({ p, xml: oox[i].value })).filter(x => countFormulas(x.xml) > 0)
    let done = 0
    for (const { p, xml } of todo) {
      const r = convertPictures(xml)
      if (r.converted) { p.insertOoxml(r.xml, 'Replace'); await ctx.sync() }
      converted += r.converted; failed += r.failed
      onProgress?.(++done, todo.length)
    }
  })
  return { converted, failed }
}

/** Toàn bộ tài liệu đang mở dưới dạng tệp .docx (Uint8Array). */
export function getDocxBytes() {
  return new Promise((resolve, reject) => {
    Office.context.document.getFileAsync(Office.FileType.Compressed, { sliceSize: 4194304 }, result => {
      if (result.status !== Office.AsyncResultStatus.Succeeded) { reject(new Error(result.error.message)); return }
      const file = result.value
      const parts = []
      let index = 0
      const next = () => file.getSliceAsync(index, slice => {
        if (slice.status !== Office.AsyncResultStatus.Succeeded) { file.closeAsync(); reject(new Error(slice.error.message)); return }
        parts.push(new Uint8Array(slice.value.data))
        index += 1
        if (index < file.sliceCount) { next(); return }
        file.closeAsync()
        const out = new Uint8Array(parts.reduce((n, p) => n + p.length, 0))
        let offset = 0
        for (const p of parts) { out.set(p, offset); offset += p.length }
        resolve(out)
      })
      next()
    })
  })
}

/** Mở một tệp .docx (Uint8Array) thành tài liệu Word mới. */
export function openDocx(bytes) {
  let bin = ''
  for (let i = 0; i < bytes.length; i += 0x8000) bin += String.fromCharCode(...bytes.subarray(i, i + 0x8000))
  return Word.run(async ctx => {
    const doc = ctx.application.createDocument(btoa(bin))
    await ctx.sync()
    doc.open()
    await ctx.sync()
  })
}

export const supportsConvert = true

export function onSelectionChanged(handler) {
  Office.context.document.addHandlerAsync(Office.EventType.DocumentSelectionChanged, async () => {
    try { handler(await readSelectedFormula()) } catch { /* chưa có vùng chọn hợp lệ */ }
  })
}
