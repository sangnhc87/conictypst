import test from 'node:test'
import assert from 'node:assert/strict'
import {
  planRenumber, detectLabel, isBulletString,
  planPunctGaps, planBracketSpaces, planCapFirst,
  planBoldOptions, planAlignOptions, planKeepWithNext,
  tcvn3ToUnicode, hasTcvn3, planSplitOptions,
  planMathSymbols, cleanMathText, planHighlightSolutions, planRemoveSolutions
} from '../src/tools/doc-clean.js'

const P = t => ({ text: t })
test('đánh số lại Câu/số/chữ cái, cấp nhỏ khởi lại', () => {
  const f = planRenumber(['Câu 1. A', 'a) x', 'c) y', 'Câu 3. B', 'a) z', 'b) w'].map(P))
  assert.deepEqual(f.map(x => [x.p, x.to]), [[2, 'b)'], [3, 'Câu 2.']])
})
test('khởi lại sau tiêu đề IN HOA', () => {
  const f = planRenumber(['1. a', '2. b', 'PHẦN HAI', '1. c', '3. d'].map(P))
  assert.deepEqual(f.map(x => [x.p, x.to]), [[4, '2.']])
})
test('nhãn kiểu La Mã và Ví dụ', () => {
  assert.equal(detectLabel('Ví dụ 12: abc').build(3), 'Ví dụ 3:')
  assert.equal(planRenumber(['I. a', 'III. b'].map(P))[0].to, 'II.')
})
test('nhận dạng ký tự gạch đầu dòng', () => {
  assert.ok(isBulletString('')); assert.ok(isBulletString('•')); assert.ok(!isBulletString('1.')); assert.ok(!isBulletString('a)'))
})
test('sửa lỗi dính chữ sau dấu câu (giữ nguyên số thập phân)', () => {
  const f = planPunctGaps(['Toán,Lý,Hóa.Cho số 1,5 và 3.14 là số', 'Hỏi:Ai vậy?Tôi đây!Đúng'].map(P))
  assert.deepEqual(f.map(x => [x.p, x.from, x.to]), [
    [0, ',L', ', L'],
    [0, ',H', ', H'],
    [0, 'a.C', 'a. C'],
    [1, ':A', ': A'],
    [1, '?T', '? T'],
    [1, '!Đ', '! Đ']
  ])
})
test('dọn khoảng trắng thừa trong ngoặc', () => {
  const f = planBracketSpaces(['Phương trình ( x + 1 ) trên [ a; b ].'].map(P))
  assert.deepEqual(f.map(x => [x.from, x.to]), [
    ['( x', '(x'],
    ['[ a', '[a'],
    ['1 )', '1)'],
    ['b ]', 'b]']
  ])
})
test('viết hoa chữ đầu câu sau dấu kết câu', () => {
  const f = planCapFirst(['Đã xong. tiếp tục? trả lời! đúng rồi.'].map(P))
  assert.deepEqual(f.map(x => [x.from, x.to]), [
    ['. t', '. T'],
    ['? t', '? T'],
    ['! đ', '! Đ']
  ])
})
test('canh tab phương án A B C D cách nhau bằng nhiều dấu cách', () => {
  const f = planAlignOptions(['A. 1      B. 2      C. 3      D. 4', 'a) Đúng    b) Sai'].map(P))
  assert.deepEqual(f.map(x => [x.p, x.to]), [
    [0, '\tB.'],
    [0, '\tC.'],
    [0, '\tD.'],
    [1, '\tb)']
  ])
})
test('tìm nhãn phương án để in đậm', () => {
  const targets = planBoldOptions(['A. Đúng\tB. Sai\tC. Không rõ\tD. Cả hai', 'a) Nhỏ\tb) Lớn'].map(P))
  assert.deepEqual(targets.map(t => [t.p, t.label]), [
    [0, 'A.'],
    [0, 'B.'],
    [0, 'C.'],
    [0, 'D.'],
    [1, 'a)'],
    [1, 'b)']
  ])
})
test('chống mồ côi: nhận diện câu hỏi và tiêu đề', () => {
  const hits = planKeepWithNext([
    { text: 'Câu 1. Cho hàm số', heading: false },
    { text: 'Đoạn văn bình thường giải thích', heading: false },
    { text: 'CHUYÊN ĐỀ HÀM SỐ', heading: false },
    { text: 'Ví dụ 2: Tìm x', heading: false }
  ])
  assert.deepEqual(hits, [0, 2, 3])
})
test('chuyển mã TCVN3 (.VnTime) sang Unicode chuẩn', () => {
  const raw = 'To\xb5n h\xe4c v\xb5 Gi\xb8o vi\xaan'
  assert.ok(hasTcvn3(raw))
  assert.equal(tcvn3ToUnicode(raw), 'Toàn học và Giáo viên')
})
test('tách 4 phương án trắc nghiệm trên 1 dòng thành 4 dòng', () => {
  const f = planSplitOptions(['A. 1\tB. 2\tC. 3\tD. 4', 'A. Đúng      B. Sai'].map(P))
  assert.deepEqual(f.map(x => [x.p, x.to]), [
    [0, '\rB.'],
    [0, '\rC.'],
    [0, '\rD.'],
    [1, '\rB.']
  ])
})

test('chuẩn hóa ký hiệu Toán thô (mũi tên, số mũ, nhiệt độ, phép nhân, dấu đồng dạng ∽, quan hệ toán)', () => {
  const raw = 'x <= 0 => x + 1 >= 1 <=> f(x) != 0. Khi a +- b, diện tích 20cm2, thể tích 5m3, 37 oC, 2 * 3 = 10^3, ΔABC ~ ΔA\'B\'C\'.'
  const res = cleanMathText(raw)
  assert.equal(res, 'x ≤ 0 ⇒ x + 1 ≥ 1 ⇔ f(x) ≠ 0. Khi a ± b, diện tích 20cm², thể tích 5m³, 37°C, 2 × 3 = 10³, ΔABC ∽ ΔA\'B\'C\'.')
  const fixes = planMathSymbols([{ text: 'x <= 2 => x < 5, tam giác ABC ~ DEF' }])
  assert.equal(fixes.length, 3)
  assert.equal(fixes[0].to, '≤')
  assert.equal(fixes[1].to, '⇒')
  assert.ok(fixes[2].to.includes('∽'))
})

test('quản lý lời giải: nhận diện và tách lời giải', () => {
  const paras = [
    { text: 'Câu 1. Cho hàm số f(x)' },
    { text: 'A. 1\tB. 2' },
    { text: 'Lời giải:' },
    { text: 'Ta có f(x) = x' },
    { text: 'Câu 2. Tính đạo hàm' },
    { text: 'Hướng dẫn giải:' },
    { text: 'Ta có f\'(x) = 1' }
  ]
  const hl = planHighlightSolutions(paras)
  assert.deepEqual(hl, [2, 5])
  const del = planRemoveSolutions(paras)
  assert.deepEqual(del, [2, 3, 5, 6])
})


