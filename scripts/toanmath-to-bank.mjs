#!/usr/bin/env node
// Flatten the bundle manifest into the canonical question-bank interchange
// payload. Source records intentionally remain review until independent
// solutions and figure assets have been checked.

import { readFile, writeFile } from 'node:fs/promises'
import { resolve } from 'node:path'

const [input, output] = process.argv.slice(2)
if (!input || !output) {
  console.error('Usage: node scripts/toanmath-to-bank.mjs bundle.json bank-content.json')
  process.exit(1)
}

const bundle = JSON.parse(await readFile(resolve(input), 'utf8'))
const records = Object.fromEntries(bundle.exams.flatMap(exam => exam.questions).map(record => [record.id, record]))
const payload = {
  schemaVersion: 'conictypst.question-bank/v1',
  sangMath: '1.0.4',
  catalog: 'bank.json',
  exportedAt: new Date().toISOString(),
  source: bundle.source,
  sourcePdf: bundle.pdf,
  bundle: {
    name: bundle.sourceFile,
    examCount: bundle.examCount,
    pageCount: bundle.pageCount,
  },
  recordCount: Object.keys(records).length,
  records,
}

await writeFile(resolve(output), JSON.stringify(payload, null, 2) + '\n', 'utf8')
console.log(JSON.stringify({ recordCount: payload.recordCount, output: resolve(output) }, null, 2))
