import assert from 'node:assert/strict'
import test from 'node:test'
import { parseCliArgs } from '../src/cli-args.mjs'

test('mặc định không render review và --review là opt-in', () => {
  assert.equal(parseCliArgs(['exam.typ']).renderReview, false)
  assert.equal(parseCliArgs(['exam.typ', '--review']).renderReview, true)
  assert.equal(parseCliArgs(['exam.typ', '--review', '--no-review']).renderReview, false)
})
