// Kiểm thử logic thẻ "Công cụ soạn": phân tích đề, các kế hoạch thao tác, hoàn tác, giải bằng API (giả lập).
// Chạy: node tools/sang-mathtype/tests/tools.test.mjs
import { createFakeDoc } from './fake-doc.mjs'
import { parseExam, planRenumber, parseKey, resolveAnswers, planMark, planHide, countByPart } from '../src/tools/parse.js'
import { planFormat, planAnswerTable, planScoreBox, planAnswerSheet, planQr, answerPayload, exportRows, planExportTable, planImportTable, parseTsv, toTsv, planSolution, TEMPLATES } from '../src/tools/plans.js'
import { createRunner, spaceTables } from '../src/tools/runner.js'
import { solveQuestion, loadConfig, saveConfig, clearConfig } from '../src/tools/solve.js'

let failures = 0
const check = (name, ok, extra = '') => { console.log(`${ok ? 'OK  ' : 'FAIL'} ${name} ${ok ? '' : extra}`); if (!ok) failures++ }
const J = JSON.stringify

const MESSY = [
  'SỞ GD&ĐT', 'PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn',
  'Câu 5. Tính $x$', 'A. 1', 'C. 2', 'D. 3', 'B. 4', 'Lời giải. Ta có…', 'Chọn A.',
  'Câu 7: Cho hàm', 'A. a\tB. b\tD. d\tE. e',
  'Câu 9. Giá trị', 'A. 1', 'B. 2', 'C. 3', 'D. 4',
  'PHẦN II. Câu trắc nghiệm đúng sai',
  'Câu 11. Cho hàm số', 'a) s1', 'b) s2', 'd) s3', 'c) s4',
  'PHẦN III. Câu trả lời ngắn',
  'Câu 14. Tính', 'Đáp án: 2,5',
  'BẢNG ĐÁP ÁN', '1. A',
]

// ---------- phân tích ----------
const ex = parseExam(MESSY)
check('nhận 5 câu', ex.questions.length === 5, ex.questions.length)
check('nhận 3 phần', ex.parts.length === 3 && ex.parts[1].part === 2)
check('câu 1 có 4 phương án, lời giải 2 đoạn', ex.questions[0].options.length === 4 && ex.questions[0].sol.length === 2, J(ex.questions[0].sol))
check('phương án nội dòng nhận 3 nhãn A-D (E. không phải nhãn)', ex.questions[1].options[0].tokens.length === 3)
check('Phần II nhận ý a) b) c) d)', ex.questions[3].subs.length === 4)
check('bảng đáp án cuối đề nhận là key', ex.keyStart === 25 && ex.items[26].kind === 'key' && ex.items[24].kind === 'sol')
check('đếm theo phần', J(countByPart(ex)) === J({ 1: 3, 2: 1, 3: 1 }), J(countByPart(ex)))

// ---------- 1. đánh số lại ----------
{
  const { host, texts } = createFakeDoc(MESSY)
  const runner = createRunner(host)
  const r = await runner.run('Đánh số lại', 'doc', paras => planRenumber(paras))
  const t = texts()
  check('Câu 1..5 liên tục', [2, 9, 11, 17, 23].every((p, i) => t[p].startsWith(`Câu ${i + 1}`)), J([2, 9, 11, 17, 23].map(p => t[p])))
  check('phương án A,B,C,D đúng thứ tự', t[3] === 'A. 1' && t[4] === 'B. 2' && t[5] === 'C. 3' && t[6] === 'D. 4', J(t.slice(3, 7)))
  check('phương án nội dòng sửa D→C', t[10] === 'A. a\tB. b\tC. d\tE. e', J(t[10]))
  check('Phần II a b c d', t[18] === 'a) s1' && t[19] === 'b) s2' && t[20] === 'c) s3' && t[21] === 'd) s4', J(t.slice(18, 22)))
  check('giữ nguyên chữ không phải nhãn', t[7] === 'Lời giải. Ta có…' && t[8] === 'Chọn A.')
  const again = planRenumber(t)
  check('chạy lần hai không còn gì để sửa', again.length === 0, J(again))
  await runner.undo()
  check('hoàn tác khôi phục đúng nguyên văn', J(texts()) === J(MESSY))
  check('không còn gì để hoàn tác thì báo lỗi', await runner.undo().then(() => false, () => true))
}
{
  const t0 = ['PHẦN I', 'Câu 3. a', 'Câu 4. b', 'PHẦN II', 'Câu 9. c']
  const ops = planRenumber(t0, { start: 1, opts: false, restart: true })
  check('đánh lại từ đầu mỗi phần', ops.length === 3 && ops.find(o => o.p === 4).to === 'Câu 1' && ops.find(o => o.p === 1).to === 'Câu 1', J(ops.map(o => o.to)))
  const ops2 = planRenumber(['Bài 2: x', 'Bài 3: y'], { start: 10 })
  check('bắt đầu từ số tùy chọn, giữ chữ "Bài"', ops2[0].to === 'Bài 10' && ops2[1].to === 'Bài 11')
}
{
  // số câu đổi độ dài (9 → 10): chỉ sửa đúng nhãn, không đụng số khác trong đoạn
  const t0 = ['Câu 9. Tính 9 + 9', 'A. 9', 'B. 8', 'Câu 9. Tính 1']
  const { host, texts } = createFakeDoc(t0)
  await createRunner(host).run('x', 'doc', p => planRenumber(p, { start: 9 }))
  check('chỉ đổi nhãn Câu, không đổi số 9 khác', J(texts()) === J(['Câu 9. Tính 9 + 9', 'A. 9', 'B. 8', 'Câu 10. Tính 1']), J(texts()))
}

// ---------- đáp án ----------
check('khóa "1A 2B 3C"', J(parseKey('1A 2B 3C').byNumber) === J({ 1: 'A', 2: 'B', 3: 'C' }))
check('khóa "Câu 1: A, Câu 2: C"', J(parseKey('Câu 1: A, Câu 2: C').byNumber) === J({ 1: 'A', 2: 'C' }))
check('khóa chuỗi "ABCD"', J(parseKey('ABCD').seq) === J(['A', 'B', 'C', 'D']))
const ordered = (() => { const { host, texts } = createFakeDoc(MESSY); return createRunner(host).run('x', 'doc', p => planRenumber(p)).then(() => texts()) })()
const T = await ordered
const ex2 = parseExam(T)
const ans = resolveAnswers(ex2, { engine: { mc: ['B', 'D', 'A'], tf: ['ĐSĐS'], sa: ['2,5'] } })
check('gộp đáp án engine: 3 MC, 1 ĐS, 1 ngắn', J(ans.mc) === J(['B', 'D', 'A']) && ans.tf[0] === 'ĐSĐS' && ans.sa[0] === '2,5', J(ans))
check('gộp đáp án gõ tay theo số câu', J(resolveAnswers(ex2, { key: '1C 3D' }).mc) === J(['C', '', 'D']))
{
  const { host, doc } = createFakeDoc(T)
  const runner = createRunner(host)
  const r = await runner.run('Tô', 'doc', paras => { const e = parseExam(paras); return planMark(e, resolveAnswers(e, { engine: { mc: ['B', 'C', 'A'], tf: ['ĐSĐS'] } }), { bold: true, color: '#c00000' }, true) })
  check('tô đúng phương án B của câu 1', doc.paras[4].props.bold === true && doc.paras[4].props.color === '#c00000' && !doc.paras[3].props.bold, J(doc.paras[4]))
  check('phương án nội dòng chỉ tô nhãn C.', doc.paras[10].spans.length === 1 && doc.paras[10].spans[0].len === 2 && doc.paras[10].spans[0].off === 10 && doc.paras[10].spans[0].props.bold, J(doc.paras[10]))
  check('Phần II tô ý đúng (a, c)', doc.paras[18].props.bold && !doc.paras[19].props.bold && doc.paras[20].props.bold && !doc.paras[21].props.bold)
  await runner.undo()
  check('hoàn tác tô màu', doc.paras.every(p => !p.props.bold && p.spans.every(s => !s.props.bold)))
  const un = await runner.run('Bỏ tô', 'doc', paras => { const e = parseExam(paras); return planMark(e, resolveAnswers(e, { engine: { mc: ['B', 'D', 'A'] } }), {}, false) })
  check('bỏ tô sinh thao tác đặt lại đậm/màu', un.ops.every(o => o.props.bold === false && o.props.color === 'auto'))
}
{
  const { host, doc } = createFakeDoc(T)
  const runner = createRunner(host)
  const r = await runner.run('Ẩn', 'doc', paras => planHide(parseExam(paras), true))
  const hidden = doc.paras.map((p, i) => p.props.hidden ? i : -1).filter(i => i >= 0)
  check('ẩn lời giải + bảng đáp án cuối đề', hidden.includes(7) && hidden.includes(8) && hidden.includes(24) && hidden.includes(25) && hidden.includes(26) && !hidden.includes(3), J(hidden))
  await runner.undo()
  check('hoàn tác ẩn', doc.paras.every(p => !p.props.hidden))
  const show = await runner.run('Hiện', 'doc', paras => planHide(parseExam(paras), false))
  check('hiện lại đặt hidden=false', show.ops.every(o => o.props.hidden === false))
}

// ---------- 2. định dạng ----------
{
  const { host, doc } = createFakeDoc(T)
  const runner = createRunner(host)
  const f = { ...TEMPLATES.chuan, boldLabel: true }
  const r = await runner.run('Định dạng', 'doc', paras => planFormat(paras, f))
  const at = txt => doc.paras.find(p => p.text.startsWith(txt))
  const p0 = at('Câu 1.').props
  check('đặt phông, cỡ, giãn dòng 1,15 → 13,8pt', p0.font === 'Times New Roman' && p0.size === 12 && p0.lineSpacing === 13.8 && p0.align === 'justify', J(p0))
  check('phương án canh trái, tiêu đề PHẦN giữa + đậm', at('A. 1').props.align === 'left' && at('PHẦN I.').props.align === 'center' && at('PHẦN I.').props.bold)
  check('"Câu n." in đậm đúng span', at('Câu 1.').spans.length === 1 && at('Câu 1.').spans[0].len === 'Câu 1'.length && at('Câu 1.').spans[0].props.bold)
  check('chèn dòng kẻ dưới 3 tiêu đề PHẦN', doc.paras.filter(p => p.rule).length === 3)
  await runner.undo()
  check('hoàn tác chuẩn hóa: bỏ dòng kẻ, trả định dạng', doc.paras.length === T.length && !doc.paras.some(p => p.rule) && doc.paras[2].props.font === 'Calibri' && doc.paras[2].props.lineSpacing === 12 && !doc.paras[2].spans.some(x => x.props.bold), J(doc.paras[2]))
}

// ---------- 4. bảng đáp án, khung điểm, phiếu, QR ----------
{
  const eng = { mc: ['B', 'D', 'A'], tf: ['ĐSĐS'], sa: ['2,5'] }
  const at = planAnswerTable(T, { engine: eng })
  const tbls = at[0].blocks.filter(b => b.type === 'table')
  check('bảng đáp án: Phần I 3 câu, Phần II, Phần III', tbls.length === 3 && J(tbls[0].rows) === J([['Câu', '1', '2', '3'], ['Đáp án', 'B', 'D', 'A']]) && tbls[1].rows[1][1] === 'Đ' && tbls[1].rows[1][2] === 'S' && tbls[2].rows[1][1] === '2,5', J(tbls.map(t => t.rows)))
  check('hai bảng liền nhau được ngăn bằng đoạn trống', spaceTables(at[0].blocks).every((b, i, a) => !(b.type === 'table' && a[i - 1]?.type === 'table')))
  const big = planAnswerTable(Array.from({ length: 25 }, (_, i) => [`Câu ${i + 1}.`, 'A. 1', 'B. 2']).flat(), { key: 'A'.repeat(25) })
  check('bảng đáp án chia hàng 10 câu', big[0].blocks.filter(b => b.type === 'table').length === 3 && big[0].blocks.filter(b => b.type === 'table')[2].rows[0].length === 6)
  const sc = planScoreBox(T, {})
  const st = sc[0].blocks.filter(b => b.type === 'table')[1].rows
  check('khung điểm tính điểm tối đa theo số câu', st[0][1] === 'Phần I' && st[1][1] === '0,75' && st[1][2] === '1' && st[1][3] === '0,5' && st[1][4] === '2,25', J(st))
  const sh = planAnswerSheet(T, {})
  check('phiếu trả lời có lưới ○ cho 3 câu', sh[0].blocks.some(b => b.type === 'table' && b.rows[1].includes('○') && b.rows.length === 11))
  const qr = planQr(T, { engine: eng, ma: '101' })
  check('mã QR chỉ chứa ASCII', /^[\x20-\x7e]+$/.test(qr.text))
  check('mã QR chứa đáp án', qr.text === 'SM1|101|1B,2D,3A|4DSDS|5=2,5', qr.text)
  const img = qr.ops[0].blocks.find(b => b.type === 'image')
  check('ảnh QR là GIF', img && img.ext === 'gif' && Buffer.from(img.b64, 'base64').subarray(0, 4).toString() === 'GIF8' && img.widthPt === 90)
  check('không có câu thì báo lỗi rõ', (() => { try { planQr(['xin chào'], {}); return false } catch (e) { return /câu hỏi/.test(e.message) } })())
}

// ---------- 5. xuất / nhập ----------
{
  const rows = exportRows(T, { engine: { mc: ['B', 'D', 'A'], tf: ['ĐSĐS'], sa: ['2,5'] } })
  check('xuất 5 hàng, đúng cột', rows.length === 5 && rows[0][0] === '1' && rows[0][2].startsWith('Tính') && rows[0][3] === '1' && rows[0][6] === '4' && rows[0][7] === 'B' && /Lời giải/.test(rows[0][8]), J(rows[0]))
  check('phương án nội dòng tách thành cột', rows[1][3] === 'a' && rows[1][4] === 'b' && rows[1][5].startsWith('d'), J(rows[1]))
  check('Phần II lấy a) b) c) d) vào cột và Đ/S', rows[3][3] === 's1' && rows[3][7] === 'ĐSĐS', J(rows[3]))
  check('TSV vòng tròn', J(parseTsv(toTsv(rows))) === J(rows.map(r => r.map(c => c.replace(/[\t\n]+/g, ' ')))))
  const { host, doc, texts } = createFakeDoc(['PHẦN I'])
  await createRunner(host).run('Nhập', 'doc', () => planImportTable([['Câu', 'Phần', 'Nội dung', 'A', 'B', 'C', 'D', 'Đáp án', 'Lời giải'], ['1', '1', 'Tính 1+1', '1', '2', '3', '4', 'B', 'Vì 1+1=2'], ['2', '2', 'Cho hàm', 's1', 's2', 's3', 's4', 'ĐSĐS', '']], { where: 'end' }), { read: false })
  const t = texts()
  const back = parseExam(t)
  check('nhập bảng thành đề: nhận lại 2 câu, 4 phương án, 4 ý', back.questions.length === 2 && back.questions[0].options.length === 4 && back.questions[1].subs.length === 4, J(t))
  check('nhập có tiêu đề PHẦN II và lời giải', t.includes('PHẦN II.') && t.some(l => l.startsWith('Lời giải. Vì')))
  check('nhập bảng rỗng báo lỗi', (() => { try { planImportTable([['Câu', 'Phần']]); return false } catch (e) { return /không có dòng/.test(e.message) } })())
}

// ---------- 6. giải bằng API ----------
{
  const calls = []
  const ok = body => async (url, init) => { calls.push({ url, init }); return { ok: true, status: 200, json: async () => body } }
  const a = await solveQuestion('Tính 1+1', { provider: 'anthropic', key: 'sk-test' }, ok({ content: [{ type: 'text', text: 'Ta có 1+1=2.\nĐáp án: 2' }] }))
  check('Anthropic: gọi đúng địa chỉ, gửi khóa trong header, không đưa khóa vào nội dung', a.includes('Đáp án: 2') && calls[0].url === 'https://api.anthropic.com/v1/messages' && calls[0].init.headers['x-api-key'] === 'sk-test' && !calls[0].init.body.includes('sk-test'))
  const b = await solveQuestion('Tính 1+1', { provider: 'openai', key: 'sk-o', url: 'https://example.org/v1/chat/completions', model: 'm' }, ok({ choices: [{ message: { content: 'Xong' } }] }))
  check('OpenAI tương thích: dùng địa chỉ tự nhập + Bearer', b === 'Xong' && calls[1].url === 'https://example.org/v1/chat/completions' && calls[1].init.headers.authorization === 'Bearer sk-o')
  check('thiếu khóa báo lỗi', await solveQuestion('x', { provider: 'anthropic' }, ok({})).then(() => false, e => /khóa API/.test(e.message)))
  check('thiếu câu hỏi báo lỗi', await solveQuestion('  ', { key: 'k' }, ok({})).then(() => false, e => /bôi đen/.test(e.message)))
  check('địa chỉ không https bị từ chối', await solveQuestion('x', { provider: 'openai', key: 'k', url: 'http://evil.test' }, ok({})).then(() => false, e => /https/.test(e.message)))
  check('401 báo khóa sai', await solveQuestion('x', { key: 'k' }, async () => ({ ok: false, status: 401, json: async () => ({}) })).then(() => false, e => /không đúng/.test(e.message)))
  const store = new Map()
  const ls = { getItem: k => store.get(k) ?? null, setItem: (k, v) => store.set(k, v), removeItem: k => store.delete(k) }
  saveConfig({ provider: 'anthropic', key: 'abc' }, ls)
  check('lưu / đọc / xóa khóa cục bộ', loadConfig(ls).key === 'abc' && (clearConfig(ls), loadConfig(ls).key === undefined))
  const sol = planSolution('Ta có x=1.\nVậy x=1.', {})
  check('lời giải AI chèn thành các đoạn sau vùng chọn', sol[0].where === 'selEnd' && sol[0].blocks[0].text.startsWith('Lời giải. Ta có') && sol[0].blocks.length === 2)
}

// ---------- phạm vi vùng chọn ----------
{
  const { host, doc, texts } = createFakeDoc(MESSY)
  doc.sel = [2, 6] // Câu 5 + 4 phương án
  const runner = createRunner(host)
  await runner.run('Đánh số lại', 'sel', paras => planRenumber(paras))
  const t = texts()
  check('vùng chọn: chỉ sửa trong vùng, ngoài vùng giữ nguyên', t[2] === 'Câu 1. Tính $x$' && t[4] === 'B. 2' && t[9] === 'Câu 7: Cho hàm' && t[11] === 'Câu 9. Giá trị', J(t.slice(0, 12)))
  await runner.undo()
  check('vùng chọn: hoàn tác', J(texts()) === J(MESSY))
}

if (failures) { console.error(`${failures} kiểm thử thất bại`); process.exit(1) }
console.log('Tất cả đạt')
