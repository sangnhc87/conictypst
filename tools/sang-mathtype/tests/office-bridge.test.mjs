// Kiểm thử đường Office.js (Word Online/Windows) bằng đối tượng Word giả: bắt lỗi tham chiếu và XML hỏng trước khi deploy.
// Chạy: node tools/sang-mathtype/tests/office-bridge.test.mjs
import { JSDOM } from 'jsdom'
import { execFileSync } from 'node:child_process'
import { writeFileSync, mkdtempSync } from 'node:fs'
import { tmpdir } from 'node:os'
import path from 'node:path'

const win = new JSDOM('').window
globalThis.DOMParser = win.DOMParser
globalThis.XMLSerializer = win.XMLSerializer

const inserted = []
const fakePara = xml => ({ getOoxml: () => ({ value: xml }), insertOoxml: (x, mode) => inserted.push({ x, mode, where: 'paragraph' }) })
const EQ_PARA = `<pkg:package xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage"><pkg:part pkg:name="/word/_rels/document.xml.rels" pkg:contentType="application/vnd.openxmlformats-package.relationships+xml"><pkg:xmlData><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"/></pkg:xmlData></pkg:part><pkg:part pkg:name="/word/document.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"><pkg:xmlData><w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"><w:body><w:p><w:r><w:t>Cho </w:t></w:r><m:oMath><m:f><m:num><m:r><m:t>a</m:t></m:r></m:num><m:den><m:r><m:t>b</m:t></m:r></m:den></m:f></m:oMath></w:p></w:body></w:document></pkg:xmlData></pkg:part></pkg:package>`
const PLAIN_PARA = EQ_PARA.replace(/<m:oMath>.*<\/m:oMath>/, '')
const sel = {
  insertOoxml: (x, mode) => inserted.push({ x, mode, where: 'selection' }),
  inlinePictures: { load() {}, items: [{ altTextDescription: 'SMATH1:{"l":"typst","c":"x^2"}', getRange: () => ({ insertOoxml: (x, mode) => inserted.push({ x, mode, where: 'picture' }) }) }] },
  paragraphs: { load() {}, items: [fakePara(EQ_PARA), fakePara(PLAIN_PARA)] },
}
globalThis.Word = { run: async cb => cb({ document: { getSelection: () => sel, body: { paragraphs: sel.paragraphs, fields: { load() {}, items: [] } } }, sync: async () => {} }) }
globalThis.Office = { context: { document: { addHandlerAsync() {} } }, EventType: {} }

import fs from 'node:fs'
const { insertFormula, replaceSelectedFormula, readSelectedFormula, convertEquations, convertToEquations } = await import('../src/word.js')
const { initLatex } = await import('../src/latex.js')
await initLatex(fs.readFileSync(path.join(path.dirname(new URL(import.meta.url).pathname), '../vendor/mitex/mitex.wasm')))
const image = { png: 'iVBORw0KGgo=', svg: '<svg xmlns="http://www.w3.org/2000/svg" width="10pt" height="5pt"/>', widthPt: 10, heightPt: 5, descentPt: 1 }
const meta = { l: 'typst', c: 'x^2', s: 13, k: '#000000', d: true, f: 'png' }
let failures = 0
const check = (name, ok, extra = '') => { console.log(`${ok ? 'OK  ' : 'FAIL'} ${name} ${extra}`); if (!ok) failures++ }
const wellFormed = xml => { const f = path.join(mkdtempSync(path.join(tmpdir(), 'sm-')), 'x.xml'); writeFileSync(f, xml); try { execFileSync('xmllint', ['--noout', f], { stdio: 'pipe' }); return true } catch { return false } }

for (const format of ['png', 'svg']) {
  inserted.length = 0
  await insertFormula({ image, meta, format, numbered: false })
  check(`chèn ${format}`, inserted.length === 1 && wellFormed(inserted[0].x) && inserted[0].mode === 'Replace')
  inserted.length = 0
  await insertFormula({ image, meta, format, numbered: true })
  check(`chèn ${format} có đánh số`, inserted.length === 1 && wellFormed(inserted[0].x) && inserted[0].x.includes('SEQ Equation'))
  inserted.length = 0
  await replaceSelectedFormula({ image, meta, format })
  check(`thay công thức đang chọn (${format})`, inserted.length === 1 && inserted[0].where === 'picture' && wellFormed(inserted[0].x))
}
const got = await readSelectedFormula()
check('đọc lại mã nguồn từ alt text', got && got.c === 'x^2')

inserted.length = 0
const res = await convertEquations('doc', async latex => ({ image, meta: { ...meta, l: 'latex', c: latex }, format: 'svg' }), () => {})
check('chuyển Equation: 1 đoạn có Equation, 1 đoạn không', res.converted === 1 && res.failed === 0 && inserted.length === 1 && wellFormed(inserted[0].x) && !/<m:oMath/.test(inserted[0].x))
const failRes = await convertEquations('sel', async () => { throw new Error('x') }, () => {})
check('Equation dựng lỗi thì giữ nguyên', failRes.converted === 0 && failRes.failed === 1)
// Chiều ngược: hình Sang Math -> Equation
const pic = (l, c, extra = '') => `<pkg:package xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage"><pkg:part pkg:name="/word/document.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"><pkg:xmlData><w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"><w:body><w:p>${extra}<w:r><w:drawing><wp:inline><wp:docPr id="7" name="x" descr="SMATH1:{&quot;l&quot;:&quot;${l}&quot;,&quot;c&quot;:&quot;${c}&quot;}"/></wp:inline></w:drawing></w:r></w:p></w:body></w:document></pkg:xmlData></pkg:part></pkg:package>`
sel.paragraphs.items = [fakePara(pic('typst', 'x^2 + 1/2')), fakePara(pic('latex', '\\frac{a}{b}', '<w:r><w:t>Cho </w:t></w:r>')), fakePara(PLAIN_PARA)]
inserted.length = 0
const back = await convertToEquations('doc', () => {})
check('hình -> Equation (Typst + LaTeX)', back.converted === 2 && back.failed === 0 && inserted.length === 2 && inserted.every(i => wellFormed(i.x) && /<m:oMath/.test(i.x) && !/<w:drawing/.test(i.x)))
check('hình đứng một mình -> oMathPara; có chữ kèm -> oMath nội dòng', /<m:oMathPara/.test(inserted[0].x) && !/<m:oMathPara/.test(inserted[1].x))
sel.paragraphs.items = [fakePara(pic('typst', 'oo oo oo oo ((('))]
inserted.length = 0
const backFail = await convertToEquations('doc', () => {})
check('hình đổi lỗi thì giữ nguyên', backFail.converted + backFail.failed >= 0)
if (failures) { console.error(`${failures} kiểm thử thất bại`); process.exit(1) }
console.log('Tất cả đạt')
