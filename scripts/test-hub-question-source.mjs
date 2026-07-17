import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import test from 'node:test'
import {
  QUESTIONS_END,
  QUESTIONS_START,
  contextualSnippetText,
  extractMarkedQuestionBody,
  isLegacyQuestionFactoryContext,
  markQuestionBody,
  toDirectQuestionBody,
} from '../typst-conic-hub/src/studio/questionSource.js'

const legacySource = await readFile(new URL('../public/hdsd/downloads/examples/05_data_de_thi_mau.typ', import.meta.url), 'utf8')

test('chuyển bộ 05 sang lệnh câu hỏi trực tiếp', () => {
  const direct = toDirectQuestionBody(legacySource)
  assert.match(direct, /^#exam-part\(/m)
  assert.match(direct, /^#tn\(/m)
  assert.match(direct, /^#ds\(/m)
  assert.match(direct, /^#tln\(/m)
  assert.match(direct, /^#tl\(/m)
  assert.doesNotMatch(direct, /make-questions/)
  assert.equal((direct.match(/^#tn\(/gm) || []).length, 12)
  assert.equal((direct.match(/^#ds\(/gm) || []).length, 4)
  assert.equal((direct.match(/^#tln\(/gm) || []).length, 6)
  assert.equal((direct.match(/^#tl\(/gm) || []).length, 4)
})

test('đánh dấu và lấy lại nguyên vẹn vùng câu hỏi', () => {
  const body = '#tn([Câu hỏi], ([$A$], True([$B$]), [$C$], [$D$]))'
  const marked = markQuestionBody(body)
  assert.ok(marked.startsWith(QUESTIONS_START))
  assert.ok(marked.endsWith(QUESTIONS_END))
  assert.equal(extractMarkedQuestionBody(marked), body)
})

test('snippet chỉ bỏ dấu # trong dự án make-questions cũ', () => {
  const legacy = '#let make-questions(tn: none) = {\n  tn([Cũ], ())\n}'
  const inside = legacy.indexOf('tn([Cũ]')
  const item = { id: 'tn', snippet: '#tn(\n  [Mới],\n)\n' }
  assert.equal(isLegacyQuestionFactoryContext(legacy, inside), true)
  assert.equal(contextualSnippetText(item, legacy, inside).startsWith('tn('), true)
  assert.equal(contextualSnippetText(item, '= Tài liệu\n', 10).startsWith('#tn('), true)
})
