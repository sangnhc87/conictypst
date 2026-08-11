// Canonical interchange helpers for the question bank.
//
// `bank.json` is intentionally not written here: it is the taxonomy/catalogue
// of stable IDs. Question content is a separate, versioned payload so an
// import can be reviewed and rolled back without changing the catalogue.

export const QUESTION_BANK_SCHEMA = 'conictypst.question-bank/v1'
export const SANG_MATH_VERSION = '1.0.4'

const TYPE_VALUES = new Set(['tn', 'ds', 'tln', 'tl'])
const STATUS_VALUES = new Set(['draft', 'review', 'ready', 'archived'])
const DIFFICULTY_TO_TYPST = {
  'nhan-biet': 'NB',
  'thong-hieu': 'TH',
  'van-dung': 'VD',
  'van-dung-cao': 'VDC',
}

const asText = value => String(value ?? '').trim()

const typstString = value => JSON.stringify(asText(value))

// PDF/OCR imports often preserve compact geometry labels such as `ABCD` or
// `AA'`. Typst parses those as one identifier, while the sang-math convention
// is `A B C D` / `A A'`. Keep the standard number-set aliases intact and make
// the generated 1.0.4 source compile without forcing every importer to know
// this small Typst grammar detail.
const typstMathAliases = new Set(['RR', 'ZZ', 'NN', 'QQ'])
const typstMathWords = new Set([
  'abs', 'approx', 'arrow', 'backslash', 'cos', 'degree', 'dif', 'dot',
  'exp', 'frac', 'forall', 'in', 'integral', 'ln', 'log', 'max', 'min',
  'minus', 'oo', 'pi', 'plus', 'quad', 'sin', 'sqrt', 'tan', 'vec',
])

function normalizeTypstMath(text) {
  return text
    .replace(/\basqrt\b/g, 'a sqrt')
    .replace(/(?<=[a-z0-9])([A-Z])(?=[A-Za-z]*\()/g, ' $1')
    .replace(/\b[a-z]{2,}\b/g, match => (
      typstMathWords.has(match) ? match : match.split('').join(' ')
    ))
    .replace(/(?<![A-Za-z])((?:[A-Z]'?){2,})(?![A-Za-z])/g, match => {
      if (typstMathAliases.has(match)) return match
      return match.match(/[A-Z]'?/g).join(' ')
    })
}

function escapeTypstText(text) {
  const protectedTokens = []
  const protectedText = text.replace(/#(?:image|cetz\.[\w-]+)\([^\n]*\)/g, token => {
    const marker = `\uE000${protectedTokens.length}\uE001`
    protectedTokens.push(token)
    return marker
  })
  const withMath = protectedText.replace(/\$([^$]*)\$/g, (_, math) => (
    `\uE010${normalizeTypstMath(math)}\uE011`
  ))
  const escaped = withMath
    .replace(/\/{2,}/g, match => match.split('').map(() => '\\/').join(''))
    .replace(/(?<!\\)\[/g, '\\[')
    .replace(/(?<!\\)\]/g, '\\]')
    .replace(/#(?!\s*(?:image|cetz\.[\w-]+)\b)/g, '\\#')
    .replace(/\uE010([^\uE011]*)\uE011/g, (_, math) => `$${math}$`)
  return escaped.replace(/\uE000(\d+)\uE001/g, (_, index) => protectedTokens[Number(index)])
}

// Bank content is intentionally stored as Typst-ready snippets. Keep `$...$`
// math and trusted figure commands such as `#image(...)` / `#cetz.canvas(...)`
// intact; plain OCR punctuation is escaped so intervals and source notation
// cannot accidentally open/close Typst markup delimiters.
export function typstContent(value) {
  const text = asText(value)
  if (!text) return '[]'
  return `[${escapeTypstText(text)}]`
}

function typstTags(tags) {
  const values = Array.isArray(tags) ? tags.map(asText).filter(Boolean) : []
  return values.length ? `(${values.map(typstString).join(', ')},)` : '()'
}

function typstMeta(record) {
  const difficulty = DIFFICULTY_TO_TYPST[record.difficulty] || asText(record.difficulty)
  const tags = [...(Array.isArray(record.tags) ? record.tags : [])]
  if (record.bankId && !tags.includes(`bank:${record.bankId}`)) tags.push(`bank:${record.bankId}`)
  if (difficulty && !tags.includes(difficulty)) tags.push(difficulty)
  return `tags: ${typstTags(tags)}`
}

function resolveFigurePath(value, options = {}) {
  const figure = asText(value)
  if (!figure || !options.figurePrefix) return figure
  const relative = figure.startsWith('question-bank/')
    ? figure.slice('question-bank/'.length)
    : figure
  return `${asText(options.figurePrefix)}${relative}`
}

function renderFigure(record, options = {}) {
  const figure = asText(record.figure)
  if (!figure) return ''
  if (figure.startsWith('#') || figure.includes('cetz.')) return figure
  return `#image(${typstString(resolveFigurePath(figure, options))}, width: 58%)`
}

function renderStem(record, options = {}) {
  const figure = renderFigure(record, options)
  return typstContent([asText(record.stem), figure].filter(Boolean).join('\n'))
}

function renderSolution(record) {
  const solution = asText(record.solution)
  return solution ? `,\n  loigiai: ${typstContent(solution)}` : ''
}

function renderQuestionBody(record, options = {}) {
  const stem = renderStem(record, options)
  const type = record.type

  if (type === 'tn') {
    const options = Array.isArray(record.options) ? record.options : []
    const correct = new Set((Array.isArray(record.correctAnswers) ? record.correctAnswers : [1]).map(Number))
    const rendered = options.map((option, index) => (
      correct.has(index + 1) ? `True(${typstContent(option)})` : typstContent(option)
    ))
    return `#tn(\n  ${stem},\n  (${rendered.join(', ')}),\n  id: ${typstString(record.id)},\n  ${typstMeta(record)}${renderSolution(record)}\n)`
  }

  if (type === 'ds') {
    const statements = Array.isArray(record.statements) ? record.statements : []
    const rendered = statements.map(statement => (
      statement?.correct ? `True(${typstContent(statement.text)})` : typstContent(statement?.text)
    ))
    return `#ds(\n  ${stem},\n  (${rendered.join(', ')}),\n  id: ${typstString(record.id)},\n  ${typstMeta(record)}${renderSolution(record)}\n)`
  }

  if (type === 'tln') {
    return `#tln(\n  ${stem},\n  ${typstContent(record.shortAnswer)},\n  id: ${typstString(record.id)},\n  ${typstMeta(record)}${renderSolution(record)}\n)`
  }

  return `#tl(\n  ${stem},\n  id: ${typstString(record.id)}${renderSolution(record)}\n)`
}

function renderRegistryRecord(record, options = {}) {
  const difficulty = DIFFICULTY_TO_TYPST[record.difficulty] || asText(record.difficulty)
  const common = [
    `tags: ${typstTags([...(Array.isArray(record.tags) ? record.tags : []), record.bankId ? `bank:${record.bankId}` : ''])}`,
    `difficulty: ${typstString(difficulty)}`,
    `status: ${typstString(record.status || 'draft')}`,
    `source: ${typstString(record.source)}`,
    `id: ${typstString(record.id)}`,
    record.note ? `note: ${typstString(record.note)}` : null,
  ].filter(Boolean)

  if (record.type === 'tn') {
    const questionOptions = Array.isArray(record.options) ? record.options : []
    const correct = Array.isArray(record.correctAnswers) ? record.correctAnswers : [1]
    const correctValue = correct.length === 1 ? String(correct[0]) : `(${correct.join(', ')})`
    return `${typstString(record.id)}: question-tn(\n  ${renderStem(record, options)},\n  (${questionOptions.map(typstContent).join(', ')}),\n  correct: ${correctValue},\n  solution: ${typstContent(record.solution)},\n  ${common.join(',\n  ')},\n),`
  }
  if (record.type === 'ds') {
    const statements = Array.isArray(record.statements) ? record.statements : []
    const body = statements.map(item => `ds-item(${typstContent(item?.text)}, correct: ${item?.correct ? 'true' : 'false'})`).join(',\n    ')
    return `${typstString(record.id)}: question-ds(\n  ${renderStem(record, options)},\n  (\n    ${body}\n  ),\n  solution: ${typstContent(record.solution)},\n  ${common.join(',\n  ')},\n),`
  }
  if (record.type === 'tln') {
    return `${typstString(record.id)}: question-tln(\n  ${renderStem(record, options)},\n  ${typstContent(record.shortAnswer)},\n  solution: ${typstContent(record.solution)},\n  ${common.join(',\n  ')},\n),`
  }
  return `${typstString(record.id)}: question-tl(\n  ${renderStem(record, options)},\n  solution: ${typstContent(record.solution)},\n  ${common.join(',\n  ')},\n),`
}

export function typstQuestionForRecord(record, options = {}) {
  return `// content-id: ${asText(record.id)}\n// bank-id: ${asText(record.bankId || record.id)}\n${renderQuestionBody(record, options)}`
}

// Registry output is for the existing `typst/questions.typ` query API. It is
// deliberately separate from the printable 1.0.4 exam output above: one is a
// dictionary that can be queried by ID, the other is a compilable exam.
export function typstRegistryForRecords(records, options = {}) {
  const list = Array.isArray(records) ? records : Object.values(records || {})
  const selected = list.filter(item => item && asText(item.id))
  const importPath = asText(options.importPath) || '../modules/question-bank.typ'
  const lines = [
    '// Generated registry; import this file from typst/questions.typ.',
    `#import ${JSON.stringify(importPath)}: ds-item, question-tn, question-ds, question-tln, question-tl`,
    '',
    '#let imported-question-bank = (:',
  ]
  selected.forEach(record => lines.push(`  ${renderRegistryRecord(record, options)}`, ''))
  lines.push(')', '')
  return lines.join('\n')
}

export function typstForRecords(records, options = {}) {
  const list = Array.isArray(records)
    ? records
    : Object.values(records || {})
  const selected = list.filter(item => item && asText(item.id))
  const title = asText(options.title) || 'NGÂN HÀNG CÂU HỎI TOÁN THPT'
  const theme = asText(options.theme) || 'teal-pro'
  const profile = asText(options.profile) || 'loigiai'
  const parts = options.parts !== false
  const groups = parts
    ? [
      ['tn', 'PHẦN I. CÂU TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN'],
      ['ds', 'PHẦN II. CÂU TRẮC NGHIỆM ĐÚNG - SAI'],
      ['tln', 'PHẦN III. CÂU TRẢ LỜI NGẮN'],
      ['tl', 'PHẦN IV. TỰ LUẬN'],
    ]
    : [['all', 'NGÂN HÀNG CÂU HỎI']]

  const lines = [
    `// Generated from ${QUESTION_BANK_SCHEMA}; package API: sang-math:${SANG_MATH_VERSION}`,
    `// Mỗi câu giữ nguyên bank ID để truy xuất và đối soát sau khi trộn đề.`,
    `#import "@preview/sang-math:${SANG_MATH_VERSION}": *`,
    '',
    '#let preset = exam-preset(',
    `  theme: ${typstString(theme)},`,
    `  profile: ${typstString(profile)},`,
    '  two-columns: false,',
    '  answer-key: false,',
    ')',
    '#let (tn, ds, tln, tl) = exam-mode(..preset.question, show-hyperlink: true)',
    '#show: sang-setup.with(math-color: preset.accent)',
    '#show: exam-theme.with(',
    `  exam-title: ${typstString(title)},`,
    '  subject: "TOÁN THPT",',
    '  code: "BANK",',
    '  ..preset.template,',
    ')',
    '',
  ]

  for (const [type, heading] of groups) {
    const items = type === 'all' ? selected : selected.filter(item => item.type === type)
    if (!items.length) continue
    lines.push(`#exam-part([${heading}], count: ${items.length})`, '')
    items.forEach(item => lines.push(typstQuestionForRecord(item, options), ''))
  }

  return `${lines.join('\n').trim()}\n`
}

export function validateQuestionRecord(record, catalogById = null) {
  const errors = []
  const id = asText(record?.id)
  if (!id) errors.push('Thiếu bank ID.')
  const bankId = asText(record?.bankId) || id
  if (catalogById && bankId && !catalogById.has(bankId)) errors.push(`Bank ID ${bankId} không tồn tại trong bank.json.`)
  if (!TYPE_VALUES.has(record?.type)) errors.push(`${id || 'Câu hỏi'}: type không hợp lệ.`)
  if (!STATUS_VALUES.has(record?.status)) errors.push(`${id || 'Câu hỏi'}: status không hợp lệ.`)
  if (!asText(record?.stem)) errors.push(`${id || 'Câu hỏi'}: thiếu nội dung câu hỏi.`)

  if (record?.type === 'tn') {
    const options = Array.isArray(record.options) ? record.options : []
    const correct = Array.isArray(record.correctAnswers) ? record.correctAnswers : []
    if (options.length < 2) errors.push(`${id}: cần ít nhất 2 phương án.`)
    if (!correct.length || correct.some(item => !Number.isInteger(Number(item)) || Number(item) < 1 || Number(item) > options.length)) {
      errors.push(`${id}: đáp án TN không hợp lệ.`)
    }
  }
  if (record?.type === 'ds') {
    const statements = Array.isArray(record.statements) ? record.statements : []
    if (statements.length < 2) errors.push(`${id}: cần các phát biểu đúng/sai.`)
    if (statements.some(item => !asText(item?.text))) errors.push(`${id}: có phát biểu rỗng.`)
  }
  if (record?.type === 'tln' && !asText(record.shortAnswer)) errors.push(`${id}: thiếu đáp án ngắn.`)
  return errors
}

export function buildQuestionBankPayload(records, options = {}) {
  const source = Array.isArray(records)
    ? Object.fromEntries(records.map(record => [record.id, record]))
    : { ...(records || {}) }
  return {
    schemaVersion: QUESTION_BANK_SCHEMA,
    sangMath: SANG_MATH_VERSION,
    catalog: 'bank.json',
    exportedAt: new Date().toISOString(),
    source: asText(options.source) || 'ConicTypst question bank',
    recordCount: Object.keys(source).length,
    records: source,
  }
}

export function recordsFromQuestionBankPayload(payload) {
  if (Array.isArray(payload)) return Object.fromEntries(payload.filter(item => item?.id).map(item => [item.id, item]))
  if (payload?.records && typeof payload.records === 'object') return payload.records
  if (payload && typeof payload === 'object') return payload
  return {}
}
