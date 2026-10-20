// Kiểm thử đường Office.js của thẻ Công cụ soạn bằng mô hình Word giả (đoạn, tìm kiếm, bảng, bookmark…).
// Chạy: node tools/sang-mathtype/tests/tools-office.test.mjs
import { execFileSync } from 'node:child_process'
import { writeFileSync, mkdtempSync } from 'node:fs'
import { tmpdir } from 'node:os'
import path from 'node:path'

let failures = 0
const check = (name, ok, extra = '') => { console.log(`${ok ? 'OK  ' : 'FAIL'} ${name} ${ok ? '' : extra}`); if (!ok) failures++ }
const J = JSON.stringify
const wellFormed = xml => { const f = path.join(mkdtempSync(path.join(tmpdir(), 'smt-')), 'x.xml'); writeFileSync(f, xml); try { execFileSync('xmllint', ['--noout', f], { stdio: 'pipe' }); return true } catch { return false } }

// ---------- Word giả ----------
const doc = { items: [], bookmarks: new Map(), sel: null, ooxml: [], pics: [] }
const newFont = () => ({ name: 'Calibri', size: 11, bold: false, italic: false, underline: 'None', color: '#000000', hidden: false })
function makePara(text) {
  const p = { kind: 'p', text, font: newFont(), alignment: 'Left', lineSpacing: 12, spaceBefore: 0, spaceAfter: 0 }
  p.load = () => p
  p.search = (needle, opts) => {
    const hits = []
    let i = p.text.indexOf(needle)
    while (i >= 0) { const at = i; hits.push({ load() {}, font: newFont(), insertText(t, mode) { if (mode !== 'Replace') throw new Error('mode'); p.text = p.text.slice(0, at) + t + p.text.slice(at + needle.length) }, _p: p }); i = p.text.indexOf(needle, i + 1) }
    return { load() {}, items: hits }
  }
  p.insertParagraph = (t, where) => addAfter(p, makePara(t), where)
  p.insertTable = (r, c, where, values) => addAfter(p, makeTable(r, c, values), where)
  p.insertInlinePictureFromBase64 = (b64, where) => { const pic = { b64, where }; doc.pics.push(pic); p.text = '[ảnh]'; return pic }
  p.insertOoxml = (xml, mode) => { doc.ooxml.push({ xml, mode }); p.text = '───' }
  p.getRange = w => ({ _el: p, _where: w, expandTo(o) { return { _from: p, _to: o._el, insertBookmark(n) { doc.bookmarks.set(n, [p, o._el]) } } } })
  return p
}
function makeTable(r, c, values) {
  const t = { kind: 't', nrows: r, cols: c, values, borders: [], headerRowCount: 0 }
  t.load = () => t
  t.getBorder = loc => { const b = { loc }; t.borders.push(b); return b }
  t.rows = { getFirst: () => ({ font: newFont() }) }
  t.insertParagraph = (txt, where) => addAfter(t, makePara(txt), where)
  t.insertTable = (rr, cc, where, v) => addAfter(t, makeTable(rr, cc, v), where)
  t.getRange = w => ({ _el: t, expandTo(o) { return { insertBookmark(n) { doc.bookmarks.set(n, [t, o._el]) } } } })
  return t
}
function addAfter(anchor, el, where) {
  if (where !== 'After') throw new Error('chỉ hỗ trợ After')
  doc.items.splice(doc.items.indexOf(anchor) + 1, 0, el)
  return el
}
const paraList = (items) => ({ load() {}, get items() { return items() }, getLast: () => items().at(-1) })
const ctx = {
  document: {
    body: { paragraphs: paraList(() => doc.items.filter(i => i.kind === 'p')), tables: { load() {}, get items() { return doc.items.filter(i => i.kind === 't').map(t => ({ values: t.values })) } } },
    getSelection: () => ({ paragraphs: paraList(() => (doc.sel ? doc.items.slice(doc.sel[0], doc.sel[1] + 1).filter(i => i.kind === 'p') : [])), tables: { load() {}, items: [] } }),
    getBookmarkRangeOrNullObject: name => { const b = doc.bookmarks.get(name); return { load() {}, isNullObject: !b, delete() { const [a, z] = b; const i = doc.items.indexOf(a), j = doc.items.indexOf(z); doc.items.splice(i, j - i + 1) } } },
    deleteBookmark: name => doc.bookmarks.delete(name),
  },
  sync: async () => {},
}
globalThis.Word = { run: async cb => cb(ctx) }
const setDoc = lines => { doc.items = lines.map(makePara); doc.bookmarks.clear(); doc.ooxml = []; doc.pics = []; doc.sel = null }
const texts = () => doc.items.map(i => (i.kind === 'p' ? i.text : `<bảng ${i.nrows}x${i.cols}>`))

const { createOfficeHost } = await import('../src/tools/host-office.js')
const { createRunner } = await import('../src/tools/runner.js')
const { parseExam, planRenumber, planMark, planHide, resolveAnswers } = await import('../src/tools/parse.js')
const { planFormat, planAnswerTable, planQr, planScoreBox, planImportTable, TEMPLATES } = await import('../src/tools/plans.js')

const BASE = ['PHẦN I. Trắc nghiệm', 'Câu 5. Tính', 'A. 1', 'C. 2', 'D. 3', 'B. 4', 'Lời giải. Ta có', 'Câu 7: Cho', 'A. a\tB. b\tD. d', 'PHẦN II. Đúng sai', 'Câu 9. x', 'a) s1', 'b) s2', 'c) s3', 'd) s4']
const host = createOfficeHost()

// 1. đánh số lại
setDoc(BASE)
let runner = createRunner(host)
let r = await runner.run('Đánh số lại', 'doc', p => planRenumber(p))
check('Office: đánh số lại câu và phương án', texts()[1] === 'Câu 1. Tính' && texts().slice(2, 6).join('|') === 'A. 1|B. 2|C. 3|D. 4' && texts()[7] === 'Câu 2: Cho' && texts()[8] === 'A. a\tB. b\tC. d' && texts()[10] === 'Câu 3. x', J(texts()))
await runner.undo()
check('Office: hoàn tác đánh số lại', J(texts()) === J(BASE), J(texts()))

// 2. tô đáp án (cả đoạn và nhãn nội dòng) + hoàn tác trả đúng giá trị cũ
setDoc(BASE)
runner = createRunner(host)
const first = doc.items[3]; first.font.color = '#112233'
r = await runner.run('Tô', 'doc', paras => { const e = parseExam(paras); return planMark(e, resolveAnswers(e, { key: '5A 7C' }), { bold: true, color: '#c00000' }) })
check('Office: tô đậm + màu đáp án A câu 5', r.ops.length === 2 && doc.items[2].font.bold === true && doc.items[2].font.color === '#c00000', J(doc.items[2].font))
await runner.undo()
check('Office: hoàn tác tô khôi phục màu cũ', doc.items[2].font.bold === false && doc.items[2].font.color === '#000000' && first.font.color === '#112233')

// 3. ẩn lời giải
setDoc(BASE)
runner = createRunner(host)
await runner.run('Ẩn', 'doc', p => planHide(parseExam(p), true))
check('Office: ẩn đoạn Lời giải', doc.items[6].font.hidden === true && doc.items[5].font.hidden === false)
await runner.undo()
check('Office: hoàn tác ẩn', doc.items[6].font.hidden === false)

// 4. định dạng + dòng kẻ (OOXML) + hoàn tác không lệch chỉ số
setDoc(BASE)
runner = createRunner(host)
await runner.run('Định dạng', 'doc', p => planFormat(p, { ...TEMPLATES.chuan, boldLabel: true }))
const q1 = doc.items.find(i => i.kind === 'p' && i.text.startsWith('Câu 5.'))
check('Office: đặt phông / cỡ / giãn dòng / canh lề', q1.font.name === 'Times New Roman' && q1.font.size === 12 && q1.lineSpacing === 13.8 && q1.alignment === 'Justified' && q1.spaceAfter === 3, J(q1.font))
check('Office: 2 dòng kẻ là OOXML hợp lệ có pBdr', doc.ooxml.length === 2 && doc.ooxml.every(o => o.mode === 'Replace' && /<w:pBdr>/.test(o.xml) && wellFormed(o.xml)))
const secondPart = doc.items.find(i => i.kind === 'p' && i.text.startsWith('PHẦN II'))
check('Office: tiêu đề PHẦN đậm + giữa', secondPart.font.bold && secondPart.alignment === 'Centered')
await runner.undo()
check('Office: hoàn tác chuẩn hóa bỏ dòng kẻ và trả phông cũ đúng đoạn', doc.items.length === BASE.length && q1.font.name === 'Calibri' && q1.lineSpacing === 12 && secondPart.font.bold === false, J(texts()))

// 5. chèn bảng đáp án tại con trỏ và ở cuối, hoàn tác
setDoc(BASE)
doc.sel = [3, 4]
runner = createRunner(host)
await runner.run('Bảng đáp án', 'doc', p => planAnswerTable(p, { key: '5A 7B', where: 'selEnd' }))
const idx = doc.items.findIndex(i => i.kind === 't')
check('Office: bảng đáp án chèn ngay sau vùng chọn, có khoảng đệm giữa các bảng', idx === 7 && doc.items[idx].values[1].slice(0, 3).join(',') === 'Đáp án,A,B', J(texts()))
check('Office: bảng có viền và hàng đầu in đậm', doc.items[idx].borders.length === 6 && doc.items[idx].headerRowCount === 1)
await runner.undo()
check('Office: hoàn tác gỡ bảng đáp án', J(texts()) === J(BASE), J(texts()))
await runner.run('Khung điểm', 'doc', p => planScoreBox(p, { where: 'end' }))
check('Office: khung điểm chèn cuối tài liệu', doc.items.at(-1).kind === 't' && doc.items.length > BASE.length)
await runner.undo()
check('Office: hoàn tác khung điểm', doc.items.length === BASE.length)

// 6. QR (ảnh) và nhập bảng
setDoc(BASE)
runner = createRunner(host)
await runner.run('QR', 'doc', p => planQr(p, { key: '5A 7B', ma: '101', where: 'end' }).ops)
check('Office: QR chèn ảnh GIF đúng cỡ', doc.pics.length === 1 && Buffer.from(doc.pics[0].b64, 'base64').subarray(0, 3).toString() === 'GIF' && doc.items.at(-1).text === '[ảnh]')
await runner.undo()
check('Office: hoàn tác QR', doc.items.length === BASE.length)
await runner.run('Nhập', 'doc', () => planImportTable([['1', '1', 'Tính', '1', '2', '3', '4', 'B', 'Vì']], { where: 'end' }), { read: false })
check('Office: nhập bảng thành đoạn đề', texts().some(t => t === 'Câu 1. Tính') && texts().some(t => t === 'B. 2'))

// 7. đọc bảng
const tb = await host.readTables('doc')
check('Office: đọc bảng trong tài liệu', Array.isArray(tb))

if (failures) { console.error(`${failures} kiểm thử thất bại`); process.exit(1) }
console.log('Tất cả đạt')
