// Chiều ngược: đổi hình công thức Sang Math (mã nguồn nằm trong alt text) thành Equation của Word (OMML).
import { typstToOmml } from './omml.js'
import { latexToTypstMath } from './latex.js'
import { decodeMeta } from './word.js'
import { unicodeCompat, pairBars } from './latex-prep.js'

const W = 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'
const WP = 'http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing'
const NS_DECL = 'xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"'

/** Số hình công thức Sang Math trong gói. */
export const countFormulas = xml => (xml.match(/descr="SMATH1:/g) || []).length

export function metaToOmml(meta, display = false) {
  const typst = meta.l === 'latex' ? latexToTypstMath(unicodeCompat(pairBars(meta.c))) : meta.c
  return typstToOmml(typst, { display })
}

/** xml: gói flat OPC (getOoxml). Trả về { xml, converted, failed }; công thức đổi lỗi thì giữ nguyên hình. */
export function convertPictures(xml) {
  const doc = new DOMParser().parseFromString(xml, 'application/xml')
  const wrap = new DOMParser()
  let converted = 0, failed = 0
  for (const docPr of [...doc.getElementsByTagNameNS(WP, 'docPr')]) {
    const meta = decodeMeta(docPr.getAttribute('descr'))
    if (!meta) continue
    let r = docPr.parentNode
    while (r && !(r.namespaceURI === W && r.localName === 'r')) r = r.parentNode
    if (!r) continue
    const p = r.parentNode
    // công thức đứng một mình trong đoạn -> Equation riêng một dòng (oMathPara), còn lại -> Equation nội dòng
    const others = [...p.childNodes].filter(c => c !== r && c.nodeType === 1 && !(c.namespaceURI === W && c.localName === 'pPr'))
    let omml
    try { omml = metaToOmml(meta, others.length === 0) } catch { failed++; continue }
    const nodes = [...wrap.parseFromString(`<w:p ${NS_DECL}>${omml}</w:p>`, 'application/xml').documentElement.childNodes]
    for (const n of nodes) p.insertBefore(doc.importNode(n, true), r)
    p.removeChild(r)
    converted++
  }
  return { xml: new XMLSerializer().serializeToString(doc), converted, failed }
}
