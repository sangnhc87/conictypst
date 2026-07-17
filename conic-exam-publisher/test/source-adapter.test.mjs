import assert from 'node:assert/strict'
import test from 'node:test'
import {
  QUESTIONS_END,
  QUESTIONS_START,
  extractHubQuestionBody,
  transformHubSource,
} from '../src/source-adapter.mjs'

test('đóng vùng câu hỏi Hub thành factory mà không parse câu', () => {
  const source = `#import "renderer.typ": *
${QUESTIONS_START}
#tn([Câu hỏi], ([$A$], True([$B$])))
${QUESTIONS_END}
#het`
  const region = extractHubQuestionBody(source)
  assert.match(region.body, /#tn/u)
  const transformed = transformHubSource(source)
  assert.match(transformed, /#let conic-publisher-questions/u)
  assert.match(transformed, /conic-publisher-questions\(\)/u)
  assert.doesNotMatch(transformed, /CONICTYPST:QUESTIONS/u)
})

test('từ chối marker Hub trùng hoặc không đứng riêng dòng', () => {
  assert.throws(
    () => extractHubQuestionBody(`${QUESTIONS_START}\n${QUESTIONS_START}\n${QUESTIONS_END}`),
    /đúng một cặp/u,
  )
  assert.throws(
    () => extractHubQuestionBody(`${QUESTIONS_START} #tn([], ())\n${QUESTIONS_END}`),
    /cùng dòng/u,
  )
  assert.throws(
    () => extractHubQuestionBody(`${QUESTIONS_END}\n${QUESTIONS_START}`),
    /đứng trước/u,
  )
})
