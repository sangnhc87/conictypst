import { readFile } from 'node:fs/promises'

const runtimeFiles = [
  {
    path: 'public/hdsd/typst/bbt.typ',
    minBytes: 10_000,
    required: ['#let bbtv2(', '#let bxd-tich('],
  },
  {
    path: 'public/hdsd/typst/sang-exam.typ',
    minBytes: 30_000,
    required: ['#let sang-setup(', '#let tn = mcq', '#let tln = short'],
  },
  {
    path: 'public/hdsd/typst/math-sym.typ',
    minBytes: 5_000,
    required: ['#let dfrac(', '#let vec('],
  },
]

const failures = []

for (const runtimeFile of runtimeFiles) {
  let source
  try {
    source = await readFile(runtimeFile.path, 'utf8')
  } catch (error) {
    failures.push(`${runtimeFile.path}: không đọc được (${error.message})`)
    continue
  }

  const byteLength = Buffer.byteLength(source)
  if (byteLength < runtimeFile.minBytes) {
    failures.push(
      `${runtimeFile.path}: chỉ có ${byteLength} byte, cần tối thiểu ${runtimeFile.minBytes}`,
    )
  }

  if (/^\s*\/\/\s*mock\b/im.test(source)) {
    failures.push(`${runtimeFile.path}: phát hiện nội dung mock`)
  }

  for (const marker of runtimeFile.required) {
    if (!source.includes(marker)) {
      failures.push(`${runtimeFile.path}: thiếu API bắt buộc ${marker}`)
    }
  }
}

if (failures.length > 0) {
  console.error('HDSD runtime không an toàn để deploy:')
  for (const failure of failures) console.error(`- ${failure}`)
  process.exit(1)
}

console.log('HDSD runtime hợp lệ: bbt.typ, sang-exam.typ, math-sym.typ')
