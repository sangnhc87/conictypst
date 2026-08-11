#!/usr/bin/env node
// Safe utilities for the canonical question-bank payload.
//
// The catalogue (`bank.json`) is read-only here. This tool validates question
// content and writes a new output file only when the caller explicitly asks
// for one.

import { readFile, writeFile } from 'node:fs/promises'
import { resolve } from 'node:path'
import {
  QUESTION_BANK_SCHEMA,
  recordsFromQuestionBankPayload,
  typstRegistryForRecords,
  typstForRecords,
  validateQuestionRecord,
} from '../src/questionBankFormat.js'

const repoRoot = resolve(new URL('..', import.meta.url).pathname)

function parseArgs(argv) {
  const args = {
    command: argv[0] && !argv[0].startsWith('-') ? argv[0] : 'validate',
    file: '',
    out: '',
    catalog: resolve(repoRoot, 'bank.json'),
    title: 'NGÂN HÀNG CÂU HỎI TOÁN THPT',
    figurePrefix: '',
  }
  const rest = args.command === argv[0] ? argv.slice(1) : argv
  for (let index = 0; index < rest.length; index += 1) {
    const key = rest[index]
    const value = rest[index + 1]
    if (key === '--file' || key === '-f') { args.file = resolve(value); index += 1 }
    else if (key === '--out' || key === '-o') { args.out = resolve(value); index += 1 }
    else if (key === '--catalog') { args.catalog = resolve(value); index += 1 }
    else if (key === '--title') { args.title = value || args.title; index += 1 }
    else if (key === '--figure-prefix') { args.figurePrefix = value || ''; index += 1 }
    else if (key === '--help' || key === '-h') args.command = 'help'
  }
  return args
}

async function readJson(path) {
  return JSON.parse(await readFile(path, 'utf8'))
}

async function loadRecords(file) {
  if (!file) throw new Error('Thiếu --file INPUT.json')
  const payload = await readJson(file)
  return recordsFromQuestionBankPayload(payload)
}

async function validate(args) {
  const [records, catalog] = await Promise.all([
    loadRecords(args.file),
    readJson(args.catalog),
  ])
  const catalogById = new Map(Object.keys(catalog).map(id => [id, catalog[id]]))
  const errors = Object.values(records).flatMap(record => validateQuestionRecord(record, catalogById).map(message => ({ id: record?.id || '', message })))
  const ids = Object.keys(records)
  const duplicateIds = ids.filter((id, index) => ids.indexOf(id) !== index)
  const report = {
    valid: errors.length === 0 && duplicateIds.length === 0,
    schema: (await readJson(args.file))?.schemaVersion || 'legacy',
    recordCount: ids.length,
    errors,
    duplicateIds,
  }
  console.log(JSON.stringify(report, null, 2))
  if (!report.valid) process.exitCode = 1
  return { records, report }
}

async function main() {
  const args = parseArgs(process.argv.slice(2))
  if (args.command === 'help') {
    console.log(`Usage:\n  node scripts/question-bank.mjs validate --file bank-content.json\n  node scripts/question-bank.mjs export-typst --file bank-content.json --out bank.typ\n  node scripts/question-bank.mjs export-registry --file bank-content.json --out typst/questions/imported-bank.typ\n\nThe catalogue bank.json is read-only. Imports should use schema ${QUESTION_BANK_SCHEMA}.`)
    return
  }

  if (args.command !== 'validate' && args.command !== 'export-typst' && args.command !== 'export-registry') {
    throw new Error(`Lệnh không hỗ trợ: ${args.command}`)
  }

  const { records, report } = await validate(args)
  if (!report.valid) throw new Error('Dữ liệu chưa qua kiểm tra; chưa xuất file Typst.')
  if (args.command === 'export-typst' || args.command === 'export-registry') {
    if (!args.out) throw new Error('Thiếu --out OUTPUT.typ')
    const output = args.command === 'export-registry'
      ? typstRegistryForRecords(records, { figurePrefix: args.figurePrefix })
      : typstForRecords(records, { title: args.title, figurePrefix: args.figurePrefix })
    await writeFile(args.out, output, 'utf8')
    console.log(`Đã xuất ${Object.keys(records).length} câu sang ${args.out}`)
  }
}

main().catch(error => {
  console.error(`question-bank: ${error.message}`)
  process.exitCode = 1
})
