import assert from 'node:assert/strict'
import test from 'node:test'
import { normalizeMetadata } from '../src/package-builder.mjs'

const text = value => ({ func: 'text', text: value })

function metadata({ withIds = true, withAnswerValue = true } = {}) {
  return [
    { kind: 'part', 'part-index': 1, title: text('Phần I') },
    {
      kind: 'question', position: 1, 'part-index': 1, type: 'tn',
      'source-id': withIds ? 'TN01' : null, points: 0.25, stem: text('TN'), 'has-solution': true,
      options: [
        { id: 'o1', 'source-index': 1, 'is-correct': false },
        { id: 'o2', 'source-index': 2, 'is-correct': true },
      ],
    },
    {
      kind: 'question', position: 2, 'part-index': 1, type: 'ds',
      'source-id': withIds ? 'DS01' : null, points: 1, stem: text('DS'),
      statements: [true, false, true, false].map((correct, index) => ({
        id: `s${index + 1}`, 'source-index': index + 1, 'is-correct': correct,
      })),
    },
    {
      kind: 'question', position: 3, 'part-index': 1, type: 'tln',
      'source-id': withIds ? 'TLN01' : null, points: 0.5, stem: text('TLN'),
      'answer-display': { func: 'equation', body: text('0,25') },
      'answer-value': withAnswerValue ? '0,25' : null,
      'accepted-answers': null,
      tolerance: 0,
    },
    {
      kind: 'question', position: 4, 'part-index': 1, type: 'tl',
      'source-id': withIds ? 'TL01' : null, points: 2, stem: text('TL'), rubric: [],
    },
  ]
}

test('chuẩn hóa đủ bốn loại câu và giữ key ngoài public model', () => {
  const result = normalizeMetadata(metadata(), {
    sourceHash: 'a'.repeat(64), strict: true, profile: 'custom',
  })
  assert.deepEqual(result.counts, { tn: 1, ds: 1, tln: 1, tl: 1 })
  assert.equal(result.maximumScore, 3.75)
  assert.equal(result.questions[0].answer, 'o2')
  assert.deepEqual(result.questions[1].answer, [true, false, true, false])
  assert.deepEqual(result.questions[2].acceptedAnswers, ['0,25'])
})

test('strict chặn ID và answer-value thiếu; non-strict sinh cảnh báo', () => {
  assert.throws(
    () => normalizeMetadata(metadata({ withIds: false }), {
      sourceHash: 'b'.repeat(64), strict: true, profile: 'custom',
    }),
    /thiếu id/u,
  )
  assert.throws(
    () => normalizeMetadata(metadata({ withAnswerValue: false }), {
      sourceHash: 'b'.repeat(64), strict: true, profile: 'custom',
    }),
    /thiếu answer-value/u,
  )
  const draft = normalizeMetadata(metadata({ withIds: false, withAnswerValue: false }), {
    sourceHash: 'b'.repeat(64), strict: false, profile: 'custom',
  })
  assert.equal(draft.questions[2].acceptedAnswers[0], '0,25')
  assert.ok(draft.warnings.length >= 5)
})

test('chặn TN nhiều đáp án đúng và Đ/S không đủ bốn ý', () => {
  const invalidTn = metadata()
  invalidTn[1].options[0]['is-correct'] = true
  assert.throws(
    () => normalizeMetadata(invalidTn, { sourceHash: 'c'.repeat(64), strict: true, profile: 'custom' }),
    /đúng một phương án/u,
  )
  const invalidDs = metadata()
  invalidDs[2].statements.pop()
  assert.throws(
    () => normalizeMetadata(invalidDs, { sourceHash: 'c'.repeat(64), strict: true, profile: 'custom' }),
    /đúng 4 phát biểu/u,
  )
})
