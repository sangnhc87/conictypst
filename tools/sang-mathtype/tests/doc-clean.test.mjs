import test from 'node:test'
import assert from 'node:assert/strict'
import { planRenumber, detectLabel, isBulletString } from '../src/tools/doc-clean.js'

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
