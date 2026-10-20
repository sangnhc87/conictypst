// Đổi các Equation (OMML) trong một gói OOXML phẳng (kết quả của Word getOoxml) thành hình Sang Math.
import { ommlToLatex } from './omml2latex.js'
import { drawingRun, b64 } from './word.js'

const M = 'http://schemas.openxmlformats.org/officeDocument/2006/math'
const W = 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'
const PKG = 'http://schemas.microsoft.com/office/2006/xmlPackage'
const RELNS = 'http://schemas.openxmlformats.org/package/2006/relationships'
const REL_IMAGE = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image'
const NS_DECL = 'xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"'

let nextId = 4000 + Math.floor(Math.random() * 100000)

const partByName = (doc, name) => [...doc.getElementsByTagNameNS(PKG, 'part')].find(p => p.getAttributeNS(PKG, 'name') === name)

/** Số Equation (ngoài cùng) trong gói. */
export function countEquations(xml) {
  return (xml.match(/<m:oMath[\s>]/g) || []).length
}

/**
 * xml: chuỗi flat OPC. makeImage(latex) -> Promise<{ image, meta, format }>.
 * Trả về { xml, converted, failed }. Equation nào dựng lỗi thì giữ nguyên.
 */
export async function convertPackage(xml, makeImage) {
  const doc = new DOMParser().parseFromString(xml, 'application/xml')
  const docPart = partByName(doc, '/word/document.xml')
  const relPart = partByName(doc, '/word/_rels/document.xml.rels')
  if (!docPart || !relPart) return { xml, converted: 0, failed: 0 }
  const root = doc.documentElement
  const relRoot = relPart.getElementsByTagNameNS(RELNS, 'Relationships')[0]
  let relCounter = 0
  const usedRel = new Set([...relRoot.getElementsByTagNameNS(RELNS, 'Relationship')].map(r => r.getAttribute('Id')))
  const newRel = () => { let id; do { id = `rIdSm${++relCounter}` } while (usedRel.has(id)); usedRel.add(id); return id }

  // chỉ lấy Equation ngoài cùng (không lồng trong Equation khác)
  const all = [...docPart.getElementsByTagNameNS(M, 'oMath')].filter(el => {
    for (let p = el.parentNode; p && p !== docPart; p = p.parentNode) if (p.namespaceURI === M && p.localName === 'oMath') return false
    return true
  })
  let converted = 0, failed = 0
  const wrap = new DOMParser()
  const toNodes = runXml => wrap.parseFromString(`<w:p ${NS_DECL}>${runXml}</w:p>`, 'application/xml').documentElement.childNodes

  for (const el of all) {
    let made
    try { made = await makeImage(ommlToLatex(el)) } catch { failed++; continue }
    const { image, meta, format } = made
    const id = nextId++
    const rPng = newRel()
    const rSvg = format === 'svg' ? newRel() : null
    const runXml = drawingRun(image, meta, id, rPng, rSvg, format)
    const addRel = (rid, target) => { const r = doc.createElementNS(RELNS, 'Relationship'); r.setAttribute('Id', rid); r.setAttribute('Type', REL_IMAGE); r.setAttribute('Target', target); relRoot.appendChild(r) }
    const addPart = (name, type, data) => {
      const p = doc.createElementNS(PKG, 'pkg:part'); p.setAttributeNS(PKG, 'pkg:name', name); p.setAttributeNS(PKG, 'pkg:contentType', type); p.setAttributeNS(PKG, 'pkg:compression', 'store')
      const d = doc.createElementNS(PKG, 'pkg:binaryData'); d.textContent = data; p.appendChild(d); root.appendChild(p)
    }
    addRel(rPng, `media/smath${id}.png`); addPart(`/word/media/smath${id}.png`, 'image/png', image.png)
    if (rSvg) { addRel(rSvg, `media/smath${id}.svg`); addPart(`/word/media/smath${id}.svg`, 'image/svg+xml', b64(image.svg)) }

    const replacement = [...toNodes(runXml)].map(n => doc.importNode(n, true))
    const para = el.parentNode.localName === 'oMathPara' && el.parentNode.namespaceURI === M ? el.parentNode : el
    const target = para
    // Equation đứng riêng một dòng (oMathPara) -> hình căn giữa như cũ
    if (para !== el) {
      const p = para.parentNode
      let pPr = [...p.childNodes].find(c => c.localName === 'pPr' && c.namespaceURI === W)
      if (!pPr) { pPr = doc.createElementNS(W, 'w:pPr'); p.insertBefore(pPr, p.firstChild) }
      if (![...pPr.childNodes].some(c => c.localName === 'jc')) {
        const jc = doc.createElementNS(W, 'w:jc'); jc.setAttributeNS(W, 'w:val', 'center')
        // đúng thứ tự lược đồ: jc đứng trước rPr/sectPr/pPrChange nếu có
        const after = [...pPr.childNodes].find(c => ['rPr', 'sectPr', 'pPrChange'].includes(c.localName))
        pPr.insertBefore(jc, after || null)
      }
    }
    const parent = target.parentNode
    for (const n of replacement) parent.insertBefore(n, target)
    // oMathPara có nhiều Equation: các Equation còn lại sẽ được thay ở vòng sau (vẫn nằm trong oMathPara); chỉ gỡ khi hết
    if (para !== el) { el.parentNode.removeChild(el); if (![...para.childNodes].some(c => c.localName === 'oMath')) parent.removeChild(para) } else parent.removeChild(target)
    converted++
  }
  return { xml: new XMLSerializer().serializeToString(doc), converted, failed }
}
