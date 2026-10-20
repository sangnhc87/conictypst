// Thử với Word Mac thật (chỉ chạy khi SM_LIVE_WORD=1): tạo tài liệu nháp, chạy các công cụ, kiểm tra rồi đóng không lưu.
// Chạy: SM_LIVE_WORD=1 node tools/sang-mathtype/tests/live-word-tools.mjs
import { execFileSync } from 'node:child_process'
if (process.env.SM_LIVE_WORD !== '1') { console.log('Bỏ qua (đặt SM_LIVE_WORD=1 để thử với Word thật).'); process.exit(0) }
const w = await import('../desktop/word-applescript.mjs')
const { planRenumber, parseExam, planHide, planMark, resolveAnswers } = await import('../src/tools/parse.js')
const { planFormat, planAnswerTable, planScoreBox, planAnswerSheet, planQr, planExportTable, planImportTable, planSolution, TEMPLATES } = await import('../src/tools/plans.js')
const { prepare } = await import('../src/tools/runner.js')
const as = s => execFileSync('osascript', ['-e', s]).toString()
let failures = 0
const check = (name, ok, extra = '') => { console.log(`${ok ? 'OK  ' : 'FAIL'} ${name} ${ok ? '' : extra}`); if (!ok) failures++ }
const J = JSON.stringify
const LINES = ['PHẦN I. Trắc nghiệm', 'Câu 5. Tính x²', 'A. 1', 'C. 2', 'D. 3', 'B. 4', 'Lời giải: abc', 'Câu 7: Cho hàm', 'A. a\tB. b\tD. d', 'PHẦN II. Đúng sai', 'Câu 9. x', 'a) s1', 'b) s2']
as(`tell application "Microsoft Word"
 set d to make new document
 set content of text object of d to ${LINES.map(l => `"${l.replace(/\t/g, '" & tab & "')}"`).join(' & return & ')}
end tell`)
try {
  const trial = async (name, ops, expectGrow = null) => {
    const base = await w.toolsRead('doc')
    const r = await w.toolsApply(prepare(ops), base.layout)
    const mid = await w.toolsRead('doc')
    await w.toolsApply(r.inverse, mid.layout)
    const end = await w.toolsRead('doc')
    check(`${name}: hoàn tác trả đúng nguyên văn`, J(end.paras) === J(base.paras), J(end.paras))
    if (expectGrow != null) check(`${name}: thêm ${expectGrow} đoạn`, mid.paras.length - base.paras.length === expectGrow, `${mid.paras.length - base.paras.length}`)
    return mid
  }
  const R = await w.toolsRead('doc')
  check('đọc đúng số đoạn', R.paras.length === LINES.length && R.paras[8] === LINES[8], J(R.paras))
  // đổi nhãn thật + hoàn tác
  const res = await w.toolsApply(planRenumber(R.paras), R.layout)
  const R2 = await w.toolsRead('doc')
  check('đánh số lại trong Word', R2.paras[1] === 'Câu 1. Tính x²' && R2.paras[3] === 'B. 2' && R2.paras[8] === 'A. a\tB. b\tC. d' && R2.paras[10] === 'Câu 3. x', J(R2.paras))
  await w.toolsApply(res.inverse, R2.layout)
  check('hoàn tác đánh số lại', J((await w.toolsRead('doc')).paras) === J(LINES))
  await trial('chuẩn hóa định dạng', planFormat(R.paras, { ...TEMPLATES.chuan, boldLabel: true }), 2)
  await trial('bảng đáp án', planAnswerTable(R.paras, { key: '5A 7C', where: 'end' }))
  await trial('khung điểm', planScoreBox(R.paras, { where: 'selEnd' }))
  await trial('phiếu trả lời', planAnswerSheet(R.paras, { where: 'end' }))
  await trial('mã QR', planQr(R.paras, { key: '5A 7C', ma: '101', where: 'end' }).ops, 2)
  await trial('xuất bảng câu hỏi', planExportTable(R.paras, { key: '5A 7C', where: 'end' }).ops)
  await trial('nhập bảng', planImportTable([['1', '1', 'Tính 1+1', '1', '2', '3', '4', 'B', 'Vì 1+1=2']], { where: 'end' }))
  await trial('lời giải AI', planSolution('Ta có x=1.\nVậy x=1.', {}))
  const ex = parseExam(R.paras)
  await trial('tô đáp án', planMark(ex, resolveAnswers(ex, { key: '5A 7C' }), { bold: true, color: '#C00000' }))
  await trial('ẩn lời giải', planHide(ex, true))
  const tables = await w.toolsTables('doc')
  check('đọc bảng trong Word trả về mảng', Array.isArray(tables))
} finally {
  as('tell application "Microsoft Word" to close active document saving no')
}
if (failures) { console.error(`${failures} kiểm thử thất bại`); process.exit(1) }
console.log('Tất cả đạt')
