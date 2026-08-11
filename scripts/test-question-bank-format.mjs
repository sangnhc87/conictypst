#!/usr/bin/env node
import assert from 'node:assert/strict'
import test from 'node:test'
import { SAMPLE_RECORDS } from '../src/questionBankSeed.js'
import {
  QUESTION_BANK_SCHEMA,
  buildQuestionBankPayload,
  recordsFromQuestionBankPayload,
  typstForRecords,
  typstRegistryForRecords,
  typstQuestionForRecord,
  validateQuestionRecord,
} from '../src/questionBankFormat.js'

test('canonical payload preserves records separately from bank.json taxonomy', () => {
  const payload = buildQuestionBankPayload(SAMPLE_RECORDS)
  assert.equal(payload.schemaVersion, QUESTION_BANK_SCHEMA)
  assert.equal(payload.catalog, 'bank.json')
  assert.equal(Object.keys(recordsFromQuestionBankPayload(payload)).length, 4)
})

test('validates seeded records and emits sang-math 1.0.4 syntax', () => {
  const catalog = new Map(Object.keys(SAMPLE_RECORDS).map(id => [id, true]))
  for (const record of Object.values(SAMPLE_RECORDS)) {
    assert.deepEqual(validateQuestionRecord(record, catalog), [])
  }
  const source = typstForRecords(Object.values(SAMPLE_RECORDS))
  assert.match(source, /@preview\/sang-math:1\.0\.4/)
  assert.match(source, /id: "0D1N1-1"/)
  assert.match(source, /True\(\[2 là số nguyên tố\.\]\)/)
  assert.match(source, /#ds\(/)
  assert.match(source, /#tln\(/)
  assert.match(source, /#tl\(/)
  const registry = typstRegistryForRecords(Object.values(SAMPLE_RECORDS))
  assert.match(registry, /#let imported-question-bank = \(:/)
  assert.match(registry, /"0D1N1-1": question-tn\(/)
  assert.match(registry, /question-ds\(/)
})

test('single-question export keeps the stable bank id', () => {
  const output = typstQuestionForRecord(SAMPLE_RECORDS['0D1N1-3'])
  assert.match(output, /\/\/ bank-id: 0D1N1-3/)
  assert.match(output, /#tln\(/)
  assert.match(output, /id: "0D1N1-3"/)
})

test('variants keep a unique content id while retaining bank.json taxonomy', () => {
  const variant = {
    ...SAMPLE_RECORDS['0D1N1-3'],
    id: 'ngo-duc-tai-de-01-p3-c01',
    bankId: '0D1N1-3',
    figure: 'figures/de-01-cau-01.png',
  }
  assert.deepEqual(validateQuestionRecord(variant, new Map([['0D1N1-3', true]])), [])
  const output = typstQuestionForRecord(variant)
  assert.match(output, /content-id: ngo-duc-tai-de-01-p3-c01/)
  assert.match(output, /bank-id: 0D1N1-3/)
  assert.match(output, /#image\("figures\/de-01-cau-01\.png"/)
})
