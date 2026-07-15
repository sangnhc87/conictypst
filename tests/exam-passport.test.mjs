import assert from 'node:assert/strict'
import test from 'node:test'
import {
  createExamPassport,
  parseExamPassport,
  validateExamPassport,
  verifyExamPassport,
} from '../src/contracts/examPassport.js'

function input() {
  return {
    createdAt: '2026-07-15T00:00:00.000Z',
    producer: { app: 'conic-mixer', version: '1.0.0' },
    exam: { id: 'thi-thu-2026-01', title: 'Thi thử THPT', subject: 'Toán', school: undefined },
    sheet: { profile: 'thptqg-toan-2025', schemaVersion: 1 },
    variants: [{
      code: '101',
      questions: [
        { position: 1, sourceId: 'tn-001', type: 'tn', optionOrder: [3, 1, 4, 2], answer: 2 },
        { position: 2, sourceId: 'ds-001', type: 'ds', statementOrder: [2, 1, 4, 3], answer: [false, true, true, false] },
        { position: 3, sourceId: 'tln-001', type: 'tln', answer: '0,25' },
        { position: 4, sourceId: 'tl-001', type: 'tl' },
      ],
    }],
  }
}

test('tạo và xác minh Conic Exam Passport v1', async () => {
  const passport = await createExamPassport(input())
  assert.equal(passport.checksum.algorithm, 'SHA-256')
  assert.match(passport.checksum.value, /^[a-f0-9]{64}$/)
  assert.deepEqual(await verifyExamPassport(passport), { ok: true, errors: [] })
  assert.deepEqual(await verifyExamPassport(JSON.parse(JSON.stringify(passport))), { ok: true, errors: [] })
})

test('checksum phát hiện đáp án bị sửa', async () => {
  const passport = await createExamPassport(input())
  passport.variants[0].questions[0].answer = 4
  const result = await verifyExamPassport(passport)
  assert.equal(result.ok, false)
  assert.equal(result.errors[0].path, '$.checksum.value')
})

test('validator chặn schema mới và mapping không đầy đủ', () => {
  const invalid = { ...input(), schema: 'conic.exam-passport', schemaVersion: 2 }
  const result = validateExamPassport(invalid, { requireChecksum: false })
  assert.equal(result.ok, false)
  assert.ok(result.errors.some(error => error.path === '$.schemaVersion'))
})

test('parser báo lỗi JSON bằng tiếng Việt', async () => {
  const result = await parseExamPassport('{khong-hop-le')
  assert.equal(result.ok, false)
  assert.match(result.errors[0].message, /JSON/)
})
