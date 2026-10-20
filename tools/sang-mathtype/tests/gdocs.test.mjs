// Kiểm thử add-on Google Docs bằng đối tượng giả: mã Apps Script (Code.gs) và cầu nối phía trang (gdocs.js).
// Chạy: node tools/sang-mathtype/tests/gdocs.test.mjs
import fs from 'node:fs'
import vm from 'node:vm'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const here = path.dirname(fileURLToPath(import.meta.url))
let failures = 0
const check = (name, ok, extra = '') => { console.log(`${ok ? 'OK  ' : 'FAIL'} ${name} ${extra}`); if (!ok) failures++ }

// ---------- Code.gs ----------
const TYPE = { INLINE_IMAGE: 'IMG', PARAGRAPH: 'PARA' }
const makeImage = (alt = '') => {
  const img = { alt, title: '', w: 0, h: 0, removed: false, parent: null,
    getType: () => TYPE.INLINE_IMAGE, asInlineImage: () => img, getAltDescription: () => img.alt,
    setAltDescription: v => { img.alt = v; return img }, setAltTitle: v => { img.title = v; return img },
    setWidth: v => { img.w = v; return img }, setHeight: v => { img.h = v; return img },
    getParent: () => img.parent, removeFromParent: () => { img.removed = true; img.parent.children.splice(img.parent.children.indexOf(img), 1) } }
  return img
}
const para = () => { const p = { children: [], insertParagraph: undefined, alignment: null, setAlignment(a) { p.alignment = a; }, getChildIndex: c => p.children.indexOf(c), getType: () => TYPE.PARAGRAPH, asParagraph: () => p,
  insertInlineImage: (i, blob) => { const im = makeImage(); im.blob = blob; im.parent = p; p.children.splice(i, 0, im); return im },
  appendInlineImage: blob => p.insertInlineImage(p.children.length, blob) }; return p }
const container = { children: [], getChildIndex: c => container.children.indexOf(c), insertParagraph: (i, t) => { const np = para(); np.parent = container; container.children.splice(i, 0, np); return np } }
const paragraph = para()
paragraph.parent = container; paragraph.getParent = () => container; container.children.push(paragraph)
const existing = makeImage('SMATH1:{"l":"typst","c":"x^2"}'); existing.parent = paragraph; paragraph.children.push(existing)
const plain = makeImage('ảnh thường'); plain.parent = paragraph; paragraph.children.push(plain)
let selection = null, cursor = null, lastSelection = null
const doc = {
  getSelection: () => selection, getCursor: () => cursor,
  setSelection: r => { lastSelection = r },
  newRange: () => ({ els: [], addElement(e) { this.els.push(e); return this }, build() { return this } }),
}
cursor = { insertInlineImage: blob => { const im = paragraph.insertInlineImage(1, blob); return im }, getElement: () => paragraph }
const sandbox = {
  DocumentApp: { HorizontalAlignment: { CENTER: 'CENTER' }, ElementType: { ...TYPE, LIST_ITEM: 'LI' }, getActiveDocument: () => doc, getUi: () => ({ createMenu: () => ({ addItem() { return this }, addToUi() {} }), showSidebar() {} }) },
  HtmlService: { createHtmlOutputFromFile: () => ({ setTitle() { return this } }) },
  Utilities: { base64Decode: s => Buffer.from(s, 'base64'), newBlob: (bytes, type, name) => ({ bytes, type, name }) },
}
vm.createContext(sandbox)
vm.runInContext(fs.readFileSync(path.join(here, '../gdocs/Code.gs'), 'utf8') + '\nthis.__api = { getSelectedFormula, insertFormula, onOpen, showSidebar }', sandbox)
const api = sandbox.__api

selection = { getRangeElements: () => [{ getElement: () => plain }] }
check('không chọn công thức Sang Math -> rỗng', api.getSelectedFormula() === '')
selection = { getRangeElements: () => [{ getElement: () => existing }] }
check('đọc mã nguồn từ alt text', api.getSelectedFormula().startsWith('SMATH1:'))
api.insertFormula('iVBORw0KGgo=', 'SMATH1:{"c":"y"}', 60.4, 20.6, false)
const added = paragraph.children.find(c => c.alt === 'SMATH1:{"c":"y"}')
check('chèn tại con trỏ, đặt alt text và kích thước', added && added.w === 60 && added.h === 21 && added.title.includes('Sang Math') && added.blob.type === 'image/png')
check('công thức vừa chèn được chọn lại', lastSelection && lastSelection.els[0] === added)
const before = paragraph.children.indexOf(existing)
api.insertFormula('iVBORw0KGgo=', 'SMATH1:{"c":"z"}', 30, 10, true)
const replaced = paragraph.children[before]
check('thay công thức đang chọn đúng vị trí', existing.removed && replaced.alt === 'SMATH1:{"c":"z"}')
api.insertFormula('iVBORw0KGgo=', 'SMATH1:{"c":"blk"}', 40, 20, false, true)
const blockPara = container.children[1]
check('công thức riêng một dòng: đoạn mới, căn giữa', blockPara && blockPara !== paragraph && blockPara.alignment === 'CENTER' && blockPara.children[0] && blockPara.children[0].alt === 'SMATH1:{"c":"blk"}')
selection = null
let threw = false
try { api.insertFormula('iVBORw0KGgo=', 'SMATH1:{}', 5, 5, true) } catch (e) { threw = /Chưa chọn/.test(e.message) }
check('thay mà chưa chọn -> báo lỗi rõ', threw)

// ---------- gdocs.js (phía trang) ----------
const listeners = []
const posted = []
const parent = { postMessage: (m) => posted.push(m) }
globalThis.window = { parent, addEventListener: (t, f) => listeners.push(f) }
const gd = await import('../src/gdocs.js')
const emit = (m, source = parent) => listeners.forEach(f => f({ source, data: m }))
const image = { png: 'AAAA', widthPt: 50.5, heightPt: 20, descentPt: 2 }
const meta = { l: 'typst', c: 'x', s: 13, k: '#000000', d: true, f: 'png' }
const p1 = gd.insertFormula({ image, meta })
const sent = posted.find(m => m.type === 'sm:insert')
check('gửi lệnh chèn qua postMessage', sent && sent.png === 'AAAA' && sent.alt.startsWith('SMATH1:') && sent.widthPt === 50.5)
emit({ type: 'sm:ack', id: sent.id, ok: true })
check('nhận xác nhận thì hoàn tất', (await p1, true))
const p2 = gd.replaceSelectedFormula({ image, meta })
const sent2 = posted.find(m => m.type === 'sm:replace')
emit({ type: 'sm:ack', id: sent2.id, ok: false, error: 'hỏng' })
let msg = ''
try { await p2 } catch (e) { msg = e.message }
check('báo lỗi từ Docs về giao diện', msg === 'hỏng')
let got = 'chưa'
gd.onSelectionChanged(m => { got = m })
check('báo sẵn sàng cho khung ngoài', posted.some(m => m.type === 'sm:ready'))
emit({ type: 'sm:selection', alt: 'SMATH1:{"l":"latex","c":"\\\\frac{a}{b}"}' })
check('nhận vùng chọn từ Docs', got && got.l === 'latex')
emit({ type: 'sm:selection', alt: 'SMATH1:{"l":"typst","c":"bad"}' }, { other: true })
check('bỏ qua tin không phải từ khung cha', got.c !== 'bad')
if (failures) { console.error(`${failures} kiểm thử thất bại`); process.exit(1) }
console.log('Tất cả đạt')
