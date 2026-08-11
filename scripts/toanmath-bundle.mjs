#!/usr/bin/env node
// Build a reviewable, source-traceable scaffold from the Ngô Đức Tài PDF.
// It deliberately does not claim that OCR text is a final solution: records
// with uncertain figures/formulas stay in `review` until independently solved.

import { readFile, writeFile } from 'node:fs/promises'
import { resolve } from 'node:path'

const ROOT = resolve(new URL('..', import.meta.url).pathname)
const SOURCE_URL = 'https://toanmath.com/2026/08/bo-de-on-tap-kiem-tra-dinh-ki-hoc-ki-1-mon-toan-12-ngo-duc-tai.html'
const PDF_URL = 'https://toanmath.com/toanmath-pdf/bo-de-on-tap-kiem-tra-dinh-ki-hoc-ki-1-mon-toan-12-ngo-duc-tai.pdf'

function args(argv) {
  const out = { command: argv[0] || 'manifest', text: '', out: '' }
  for (let i = 1; i < argv.length; i += 1) {
    if (argv[i] === '--text') out.text = resolve(argv[++i])
    else if (argv[i] === '--out') out.out = resolve(argv[++i])
    else if (argv[i] === '--help' || argv[i] === '-h') out.command = 'help'
  }
  return out
}

function cleanPage(page) {
  return page
    .replace(/\r/g, '')
    .replace(/^\s*Bộ Đề Ôn Định Kì[^\n]*\n/gm, '')
    .replace(/^\s*GV:\s*NGÔ ĐỨC TÀI[^\n]*$/gim, '')
    .replace(/^\s*\/ Trang \d+\/\d+\s*$/gm, '')
}

function cleanQuestion(text) {
  return cleanPage(text)
    .replace(/—Hết—[\s\S]*$/i, '')
    .replace(/__PDF_PAGE_\d+__/g, ' ')
    .replace(/PHẦN\s+[123]\./gi, ' ')
    .replace(/\s+/g, ' ')
    .replace(/#\s*»/g, '→')
    .replace(/#\s*«/g, '←')
    .replace(/\s+([,.;:!?])/g, '$1')
    .trim()
}

function findExamStarts(pages) {
  const starts = []
  pages.forEach((page, index) => {
    const match = page.match(/(?:^|\n)\s*(\d+)\.\s*ĐỀ SỐ\s*(\d+)/i)
    if (!match || !page.includes('PHẦN 1')) return
    const collection = index < 113 ? 'giua-ky-1' : 'cuoi-ky-1'
    starts.push({ index, number: Number(match[2]), collection })
  })
  return starts
}

function splitQuestionParts(raw, labels) {
  const positions = [...raw.matchAll(/(?<!\S)([A-D])\.\s+/g)]
    .map(match => ({ label: match[1], index: match.index }))
  const found = positions.filter((item, index) => item.label === labels[index])
  if (found.length !== labels.length || found.length !== positions.length) return null

  const stem = raw.slice(0, found[0].index).trim()
  const options = found.map((item, index) => {
    const start = item.index + 2
    const end = found[index + 1]?.index ?? raw.length
    return cleanQuestion(raw.slice(start, end))
  })
  return { stem: cleanQuestion(stem), options }
}

function splitStatements(raw) {
  const allPositions = [...raw.matchAll(/(?<!\S)([a-d])[).]\s+/g)]
    .map(match => ({ label: match[1], index: match.index }))
  const positions = []
  for (const item of allPositions) {
    if (item.label === 'abcd'[positions.length]) positions.push(item)
    if (positions.length === 4) break
  }
  if (positions.length !== 4 || positions.map(item => item.label).join('') !== 'abcd') return null
  const stem = raw.slice(0, positions[0].index).trim()
  const statements = positions.map((item, index) => cleanQuestion(raw.slice(item.index + 3, positions[index + 1]?.index ?? raw.length)))
  return { stem: cleanQuestion(stem), statements }
}

function parseQuestions(body) {
  const markers = [...body.matchAll(/(?:^|\n)\s*Câu\s+(\d+)\.\s*/g)]
  return markers.map((marker, index) => {
    const start = marker.index + marker[0].length
    const end = markers[index + 1]?.index ?? body.length
    const before = body.slice(0, marker.index)
    const sectionMatches = [...before.matchAll(/PHẦN\s+([123])\./gi)]
    const section = Number(sectionMatches.at(-1)?.[1] || 1)
    const raw = body.slice(start, end)
    const parts = section === 1 ? splitQuestionParts(raw, ['A', 'B', 'C', 'D']) : null
    const statements = section === 2 ? splitStatements(raw) : null
    const pageMatch = body.slice(Math.max(0, marker.index - 300), marker.index).match(/__PDF_PAGE_(\d+)__/)
    return {
      number: Number(marker[1]),
      section,
      sourcePdfPage: pageMatch ? Number(pageMatch[1]) : null,
      ...(parts ? { stem: parts.stem, options: parts.options } : { stem: cleanQuestion(raw) }),
      ...(statements ? { stem: statements.stem, statements: statements.statements.map(text => ({ text, correct: false })) } : {}),
    }
  })
}

function parseAnswerKey(keyText) {
  const result = { tn: {}, ds: {}, tlnRaw: '' }
  const partI = keyText.match(/ĐÁP ÁN PHẦN I([\s\S]*?)(?=ĐÁP ÁN PHẦN II|$)/i)?.[1] || ''
  for (const match of partI.matchAll(/(\d{1,2})\.\s*([ABCD])/g)) result.tn[Number(match[1])] = match[2].charCodeAt(0) - 64

  const partII = keyText.match(/ĐÁP ÁN PHẦN II([\s\S]*?)(?=ĐÁP ÁN PHẦN III|$)/i)?.[1] || ''
  for (const match of partII.matchAll(/Câu\s+(\d+)\.\s*a\s*([SĐ])\s*b\s*([SĐ])\s*c\s*([SĐ])\s*d\s*([SĐ])/gi)) {
    result.ds[Number(match[1])] = match.slice(2).map(value => value.toUpperCase() === 'Đ')
  }
  result.tlnRaw = keyText.match(/ĐÁP ÁN PHẦN III([\s\S]*?)(?=GV:|\/ Trang|$)/i)?.[1]?.replace(/\s+/g, ' ').trim() || ''
  return result
}

function taxonomyFamily(text) {
  if (/xác suất|biến cố|bayes|độc lập|có điều kiện/i.test(text)) return '2D6'
  if (/phương sai|độ lệch chuẩn|trung vị|tứ phân vị|mẫu số liệu|khoảng biến thiên/i.test(text)) return '2D3'
  if (/mặt phẳng|đường thẳng|mặt cầu|Oxyz|tọa độ|khoảng cách|góc giữa/i.test(text)) return '2H5'
  if (/vectơ|vector|hình hộp|hình chóp|tứ diện|lực|không gian|hình lập phương/i.test(text)) return '2H2'
  return '2D1'
}

function chooseBankId(text, section, catalog, usage) {
  const family = taxonomyFamily(text)
  const difficulty = section === 1 ? 'N' : section === 2 ? 'H' : 'V'
  const candidates = Object.keys(catalog).filter(id => id.startsWith(family) && id[3] === difficulty)
  const pool = candidates.length ? candidates : Object.keys(catalog).filter(id => id.startsWith(family))
  if (!pool.length) return ''
  const keywords = text.toLowerCase().split(/[^\p{L}\p{N}]+/u).filter(token => token.length > 3).slice(0, 40)
  const ranked = pool.map(id => {
    const label = String(catalog[id]).toLowerCase()
    const score = keywords.reduce((total, word) => total + (label.includes(word) ? 1 : 0), 0)
    return { id, score, use: usage.get(id) || 0 }
  }).sort((left, right) => right.score - left.score || left.use - right.use || left.id.localeCompare(right.id))
  const selected = ranked[0].id
  usage.set(selected, (usage.get(selected) || 0) + 1)
  return selected
}

function makeRecord(question, exam, answerKey, catalog, usage) {
  const contentId = `ngo-duc-tai-2026-${exam.collection}-${String(exam.number).padStart(2, '0')}-p${question.section}-c${String(question.number).padStart(2, '0')}`
  const sourceText = question.stem + ' ' + (question.options || []).join(' ')
  const bankId = chooseBankId(sourceText, question.section, catalog, usage)
  const figure = /hình vẽ|hình bên|đồ thị|bảng biến thiên|bảng xét dấu|hình lập phương|hình hộp|hình chóp|hình cầu/i.test(sourceText)
  const answer = question.section === 1 ? answerKey.tn[question.number] : null
  const statementAnswers = question.section === 2 ? answerKey.ds[question.number] : null
  const record = {
    id: contentId,
    bankId,
    type: question.section === 1 ? 'tn' : question.section === 2 ? 'ds' : 'tln',
    status: 'review',
    difficulty: question.section === 1 ? 'nhan-biet' : question.section === 2 ? 'thong-hieu' : 'van-dung',
    tags: ['lop12', 'hk1', exam.collection, `de-${String(exam.number).padStart(2, '0')}`, `phan-${question.section}`],
    collection: exam.collection,
    examId: `${exam.collection}-de-${String(exam.number).padStart(2, '0')}`,
    examTitle: `Ngô Đức Tài - ${exam.collection === 'giua-ky-1' ? 'Giữa kỳ 1' : 'Cuối kỳ 1'} - Đề ${exam.number}`,
    stem: question.stem,
    solution: answer ? `Đáp án đối chiếu từ PDF: phương án ${String.fromCharCode(64 + answer)}. Chưa hoàn tất lời giải độc lập.` : 'Chưa hoàn tất lời giải độc lập; cần đối chiếu dữ kiện và hình gốc.',
    note: `Bản scaffold tự động từ PDF; câu ${question.number}, phần ${question.section}.`,
    source: SOURCE_URL,
    sourcePdf: PDF_URL,
    sourcePage: `PDF trang ${question.sourcePdfPage || 'chưa xác định'} · Đề ${exam.number} · Câu ${question.number}`,
    confidence: question.sourcePdfPage ? 'vừa' : 'cần OCR lại',
    answerVerified: Boolean(answer || statementAnswers),
    solutionVerified: false,
    figure: '',
    figureAlt: figure ? 'Câu có hình/bảng/đồ thị trong PDF; cần dựng hoặc cắt hình Typst.' : '',
    reviewNotes: figure ? 'Bắt buộc đối chiếu hình gốc trước khi chuyển ready.' : 'Cần viết lời giải độc lập và kiểm tra công thức OCR.',
  }
  if (question.section === 1) {
    record.options = question.options || ['', '', '', '']
    record.correctAnswers = answer ? [answer] : [1]
  } else if (question.section === 2) {
    record.statements = (question.statements || []).map((statement, index) => ({
      ...statement,
      correct: statementAnswers?.[index] ?? false,
    }))
  } else {
    record.shortAnswer = ''
  }
  return record
}

function buildManifest(pages, catalog) {
  const starts = findExamStarts(pages)
  const exams = starts.map((exam, index) => {
    const end = starts[index + 1]?.index ?? pages.length - 1
    const keyIndex = pages.slice(exam.index, end).findIndex(page => /BẢNG ĐÁP ÁN/i.test(page))
    const absoluteKey = keyIndex >= 0 ? exam.index + keyIndex : null
    const parts = []
    const bodyEnd = absoluteKey == null ? end : absoluteKey + 1
    for (let pageIndex = exam.index; pageIndex < bodyEnd; pageIndex += 1) {
      const page = cleanPage(pages[pageIndex]).replace(/BẢNG ĐÁP ÁN[\s\S]*$/i, '')
      parts.push(`__PDF_PAGE_${pageIndex + 1}__\n${page}`)
    }
    const body = parts.join('\n')
    const answerKeyText = absoluteKey == null ? '' : pages.slice(absoluteKey, end).join('\n')
    const answerKey = parseAnswerKey(answerKeyText)
    const usage = new Map()
    const questions = parseQuestions(body).map(question => makeRecord(question, exam, answerKey, catalog, usage))
    return {
      id: `${exam.collection}-de-${String(exam.number).padStart(2, '0')}`,
      collection: exam.collection,
      number: exam.number,
      pdfStartPage: exam.index + 1,
      pdfEndPage: end,
      pdfAnswerPage: absoluteKey == null ? null : absoluteKey + 1,
      questionCount: questions.length,
      answerKey,
      questions,
    }
  })
  return {
    schemaVersion: 'conictypst.question-bank-bundle/v1',
    source: SOURCE_URL,
    pdf: PDF_URL,
    sourceFile: 'Bộ đề ôn định kì học kì 1 Toán 12 - Ngô Đức Tài',
    pageCount: pages.length - 1,
    examCount: exams.length,
    recordCount: exams.reduce((total, exam) => total + exam.questions.length, 0),
    generatedAt: new Date().toISOString(),
    exams,
  }
}

async function main() {
  const options = args(process.argv.slice(2))
  if (options.command === 'help') {
    console.log('node scripts/toanmath-bundle.mjs manifest --text extracted.txt --out manifest.json')
    return
  }
  if (!options.text || !options.out) throw new Error('Cần --text FILE.txt và --out OUTPUT.json')
  const [text, catalog] = await Promise.all([
    readFile(options.text, 'utf8'),
    readFile(resolve(ROOT, 'bank.json'), 'utf8').then(JSON.parse),
  ])
  const manifest = buildManifest(text.split('\f'), catalog)
  await writeFile(options.out, JSON.stringify(manifest, null, 2), 'utf8')
  console.log(JSON.stringify({ exams: manifest.examCount, records: manifest.recordCount, output: options.out }, null, 2))
}

main().catch(error => {
  console.error(`toanmath-bundle: ${error.message}`)
  process.exitCode = 1
})
