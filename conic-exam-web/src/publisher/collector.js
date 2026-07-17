export const QUESTIONS_START = '// === CONICTYPST:QUESTIONS:START ==='
export const QUESTIONS_END = '// === CONICTYPST:QUESTIONS:END ==='

const BUNDLED_MODULE_PATTERN = String.raw`(?:sang-exam|bbt|math-sym|lib)\.typ`

// Các đề cũ thường import ba file runtime nằm ở thư mục cha. Khi giáo viên
// chọn riêng file đề, trình duyệt không có quyền tự đọc các file anh em đó.
// Chúng đã có đầy đủ trong sang-math nhúng sẵn, nên gom wildcard imports về
// một package import để thao tác "chọn một file .typ" vẫn hoạt động.
export function rewriteBundledRuntimeImports(source, packageVersion = '1.0.1') {
  let text = String(source || '')
  const wildcard = new RegExp(
    String.raw`^(\s*)#import\s+"(?:\.\.?\/)+${BUNDLED_MODULE_PATTERN}"\s*:\s*\*\s*(?://.*)?$`,
    'gmu',
  )
  const packageWildcard = /#import\s+"@(?:preview|local)\/sang-math:\d+\.\d+\.\d+"\s*:\s*\*/u.test(text)
  let inserted = packageWildcard
  text = text.replace(wildcard, (line, indent) => {
    if (inserted) return `${indent}// Runtime cục bộ đã được sang-math nhúng thay thế.`
    inserted = true
    return `${indent}#import "@preview/sang-math:${packageVersion}": *`
  })

  // Giữ nguyên danh sách tên khi nguồn chỉ import chọn lọc từ một module cũ.
  const selective = new RegExp(
    String.raw`(^\s*#import\s+)"(?:\.\.?\/)+${BUNDLED_MODULE_PATTERN}"(\s*:\s*(?!\*)[^\r\n]+)$`,
    'gmu',
  )
  return text.replace(selective, `$1"@preview/sang-math:${packageVersion}"$2`)
}

function skipQuoted(source, start) {
  const quote = source[start]
  if (quote === '"') {
    for (let index = start + 1; index < source.length; index += 1) {
      if (source[index] === '\\') index += 1
      else if (source[index] === '"') return index + 1
    }
    return source.length
  }
  if (quote === '`') {
    let size = 1
    while (source[start + size] === '`') size += 1
    const delimiter = '`'.repeat(size)
    const end = source.indexOf(delimiter, start + size)
    return end < 0 ? source.length : end + size
  }
  return start + 1
}

function skipComment(source, start) {
  if (source.startsWith('//', start)) {
    const end = source.indexOf('\n', start + 2)
    return end < 0 ? source.length : end + 1
  }
  if (!source.startsWith('/*', start)) return start
  let depth = 1
  let index = start + 2
  while (index < source.length && depth > 0) {
    if (source.startsWith('/*', index)) { depth += 1; index += 2 }
    else if (source.startsWith('*/', index)) { depth -= 1; index += 2 }
    else index += 1
  }
  return index
}

function skipMath(source, start) {
  for (let index = start + 1; index < source.length; index += 1) {
    if (source[index] === '\\') index += 1
    else if (source[index] === '$') return index + 1
  }
  return source.length
}

function structuralSquare(source, index) {
  let before = index - 1
  while (before >= 0 && /\s/u.test(source[before])) before -= 1
  if (before < 0 || '(:,=[{)'.includes(source[before])) return true
  const prefix = source.slice(Math.max(0, before - 80), index)
  return /#[\p{L}\p{N}_-]+$/u.test(prefix)
}

function skipContainer(source, start) {
  const pairs = { '[': ']', '{': '}' }
  const stack = [pairs[source[start]]]
  for (let index = start + 1; index < source.length;) {
    if (source[index] === '"' || source[index] === '`') { index = skipQuoted(source, index); continue }
    if (source.startsWith('//', index) || source.startsWith('/*', index)) { index = skipComment(source, index); continue }
    if (source[index] === '$') { index = skipMath(source, index); continue }
    if (source[index] === '{' || (source[index] === '[' && structuralSquare(source, index))) stack.push(pairs[source[index]])
    else if (source[index] === stack.at(-1)) {
      stack.pop()
      if (!stack.length) return index + 1
    }
    index += 1
  }
  return source.length
}

function closingParen(source, open) {
  let depth = 1
  for (let index = open + 1; index < source.length;) {
    if (source[index] === '"' || source[index] === '`') { index = skipQuoted(source, index); continue }
    if (source.startsWith('//', index) || source.startsWith('/*', index)) { index = skipComment(source, index); continue }
    if (source[index] === '[' || source[index] === '{') { index = skipContainer(source, index); continue }
    if (source[index] === '$') { index = skipMath(source, index); continue }
    if (source[index] === '(') depth += 1
    else if (source[index] === ')') {
      depth -= 1
      if (depth === 0) return index + 1
    }
    index += 1
  }
  throw new Error('Có lệnh câu hỏi chưa đóng đủ dấu ngoặc `)`.')
}

export function extractQuestionCalls(source) {
  const text = String(source || '')
  const names = ['exam-part', 'tln', 'tn', 'ds', 'tl']
  const calls = []
  for (let index = 0; index < text.length;) {
    if (text[index] === '"' || text[index] === '`') { index = skipQuoted(text, index); continue }
    if (text.startsWith('//', index) || text.startsWith('/*', index)) { index = skipComment(text, index); continue }
    if (text[index] !== '#') { index += 1; continue }
    const name = names.find(candidate => text.startsWith(candidate, index + 1))
    if (!name) { index += 1; continue }
    let open = index + name.length + 1
    while (/\s/u.test(text[open] || '')) open += 1
    if (text[open] !== '(') { index += 1; continue }
    const end = closingParen(text, open)
    calls.push({ name, source: text.slice(index, end) })
    index = end
  }
  return calls
}

function splitArguments(source) {
  const parts = []
  let start = 0
  for (let index = 0; index < source.length;) {
    if (source[index] === '"' || source[index] === '`') { index = skipQuoted(source, index); continue }
    if (source.startsWith('//', index) || source.startsWith('/*', index)) { index = skipComment(source, index); continue }
    if (source[index] === '$') { index = skipMath(source, index); continue }
    if (source[index] === '[' || source[index] === '{') { index = skipContainer(source, index); continue }
    if (source[index] === '(') { index = closingParen(source, index); continue }
    if (source[index] === ',') {
      const part = cleanArgument(source.slice(start, index))
      if (part) parts.push(part)
      start = index + 1
    }
    index += 1
  }
  const tail = cleanArgument(source.slice(start))
  if (tail) parts.push(tail)
  return parts
}

function cleanArgument(value) {
  return String(value || '').trim().replace(/^(?:\s*(?:(?:\/\/[^\r\n]*(?:\r?\n|$))|(?:\/\*[\s\S]*?\*\/)))+\s*/gu, '')
}

function callArguments(callSource) {
  const open = callSource.indexOf('(')
  return open < 0 ? [] : splitArguments(callSource.slice(open + 1, -1))
}

function parsedArguments(callSource) {
  const named = {}
  const positional = []
  for (const argument of callArguments(callSource)) {
    const match = argument.match(/^([\p{L}\p{N}_-]+)\s*:\s*([\s\S]*)$/u)
    if (match) named[match[1]] = match[2].trim()
    else positional.push(argument)
  }
  return { named, positional }
}

function optionSources(tupleSource) {
  const value = String(tupleSource || '').trim()
  const inner = value.startsWith('(') && value.endsWith(')') ? value.slice(1, -1) : value
  return splitArguments(inner).map(option => {
    const match = option.match(/^(?:True|False)\s*\(/u)
    if (!match) return { contentSource: option, correct: false }
    const open = option.indexOf('(', match.index)
    return {
      contentSource: option.slice(open + 1, closingParen(option, open) - 1).trim(),
      correct: /^True/u.test(option),
    }
  })
}

export function parseQuestionSources(source) {
  return extractQuestionCalls(source)
    .filter(call => call.name !== 'exam-part')
    .map(call => {
      const { named, positional } = parsedArguments(call.source)
      const common = {
        sourceType: call.name,
        stemSource: positional[0] || '[]',
        solutionSource: named.loigiai || named.solution || '',
        figureSource: named.fig || '',
      }
      if (call.name === 'tn' || call.name === 'ds') {
        return { ...common, choices: optionSources(positional[1] || '()') }
      }
      return { ...common, answerSource: positional[1] || '' }
    })
}

const COMPLEX_MACRO = /^(?:(?:cetz|draw)\.)?(?:canvas|table|bbbt|bbtv2|bbt-opt|bxd|bbt|my-bbbt|my-bxd|image|draw-parabola|draw-ellipse|draw-hyperbola|draw-cylinder|draw-cone|draw-sphere|draw-helix|draw-spring)$/u
const ASSET_WRAPPER = /^(?:align|figure|block|box|pad|place|scale|rotate)$/u
const COMPLEX_SOURCE = /#(?:[\p{L}\p{N}_-]+\.)?(?:canvas|table|bbbt|bbtv2|bbt-opt|bxd|bbt|my-bbbt|my-bxd|image|draw-parabola|draw-ellipse|draw-hyperbola|draw-cylinder|draw-cone|draw-sphere|draw-helix|draw-spring)\b/u

// Các gói riêng thường đổi tên macro bảng biến thiên. Bộ tham số đặc trưng
// giúp nhận đúng cả tên chưa biết thay vì để Typst in dictionary thành chữ.
function looksLikeVariationTable(source) {
  const text = String(source || '')
  return /\bx-vals\s*:/u.test(text)
    && /\b(?:d-signs|f-signs|v-vals)\s*:/u.test(text)
}

function macroSpan(source, start) {
  const nameMatch = source.slice(start + 1).match(/^([\p{L}\p{N}_.-]+)/u)
  if (!nameMatch) return null
  const name = nameMatch[1]
  let end = start + 1 + name.length
  while (/\s/u.test(source[end] || '')) end += 1
  if (source[end] === '(') end = closingParen(source, end)
  while (/\s/u.test(source[end] || '')) end += 1
  if (source[end] === '[' || source[end] === '{') end = skipContainer(source, end)
  return { name, end, source: source.slice(start, end) }
}

function extractAssetsFromContent(contentSource, assets) {
  const source = String(contentSource || '')
  let output = ''
  for (let index = 0; index < source.length;) {
    if (source[index] === '"' || source[index] === '`') {
      const end = skipQuoted(source, index); output += source.slice(index, end); index = end; continue
    }
    if (source.startsWith('//', index) || source.startsWith('/*', index)) {
      const end = skipComment(source, index); output += source.slice(index, end); index = end; continue
    }
    if (source[index] !== '#') { output += source[index]; index += 1; continue }
    const macro = macroSpan(source, index)
    if (!macro) { output += source[index]; index += 1; continue }
    const isAsset = COMPLEX_MACRO.test(macro.name)
      || looksLikeVariationTable(macro.source)
      || (ASSET_WRAPPER.test(macro.name)
        && (COMPLEX_SOURCE.test(macro.source) || looksLikeVariationTable(macro.source)))
    if (!isAsset) { output += source[index]; index += 1; continue }
    const assetIndex = assets.length
    assets.push(macro.source)
    output += `\n@@CONIC_ASSET_${assetIndex}@@\n`
    index = macro.end
  }
  return output
}

function extractExplicitFigure(figureSource, assets) {
  const source = String(figureSource || '').trim()
  if (!source) return ''
  const assetIndex = assets.length
  // Giá trị `fig:` nằm trong code mode nên thường viết `cetz.canvas(...)`
  // không có dấu #. Khi đưa lại vào content block dành riêng cho asset phải
  // thêm # để Typst thực thi thay vì in nguyên mã nguồn ra màn hình.
  assets.push(source.startsWith('#') || source.startsWith('[') ? source : `#${source}`)
  return `@@CONIC_ASSET_${assetIndex}@@`
}

function webQuestionPayload(source) {
  const assets = []
  const questions = parseQuestionSources(source).map(question => ({
    ...question,
    stemSource: extractAssetsFromContent(question.stemSource, assets),
    solutionSource: extractAssetsFromContent(question.solutionSource, assets),
    figureSource: extractExplicitFigure(question.figureSource, assets),
    choices: question.choices?.map(choice => ({
      ...choice,
      contentSource: extractAssetsFromContent(choice.contentSource, assets),
    })),
  }))
  return { questions, assets }
}

function attachWebPayload(result, originalSource) {
  const web = webQuestionPayload(originalSource)
  const assetDefinition = `
#let conic-publisher-assets = (
${web.assets.map(asset => `  [${asset}],`).join('\n')}
)
`
  return { ...result, source: `${result.source}\n${assetDefinition}`, webQuestions: web.questions, assets: web.assets }
}

function appendAutomaticQuestionFactory(source) {
  const calls = extractQuestionCalls(source)
  const questions = calls.filter(call => call.name !== 'exam-part')
  if (!questions.length) throw new Error('Không tìm thấy lệnh #tn, #ds, #tln hoặc #tl trong file đã chọn.')
  const body = calls.map(call => call.source).join('\n\n')
  return `${source}

// Bộ tách câu tự sinh: main của trang thi chỉ gọi vùng này.
#let conic-auto-questions(
  tn: tn,
  ds: ds,
  tln: tln,
  tl: tl,
  exam-part: exam-part,
) = [
${body}
]
`
}

export function prepareEntrySource(source) {
  const text = String(source || '')
  const hasStart = text.includes(QUESTIONS_START)
  const hasEnd = text.includes(QUESTIONS_END)
  if (!hasStart && !hasEnd) {
    if (/#let\s+make-questions\s*\(/u.test(text)) return attachWebPayload({ source: text, factory: 'make-questions', mode: 'legacy' }, text)
    return attachWebPayload({ source: appendAutomaticQuestionFactory(text), factory: 'conic-auto-questions', mode: 'automatic' }, text)
  }
  if (!hasStart || !hasEnd) throw new Error('Nguồn có marker câu hỏi chưa đầy đủ.')
  const start = text.indexOf(QUESTIONS_START)
  const end = text.indexOf(QUESTIONS_END)
  if (start < 0 || end <= start || text.indexOf(QUESTIONS_START, start + 1) >= 0 || text.indexOf(QUESTIONS_END, end + 1) >= 0) {
    throw new Error('Nguồn phải có đúng một vùng CONICTYPST:QUESTIONS.')
  }
  const body = text.slice(start + QUESTIONS_START.length, end).trim()
  const replacement = `#let conic-publisher-questions(
  tn: tn,
  ds: ds,
  tln: tln,
  tl: tl,
  exam-part: exam-part,
) = [
${body}
]

#if sys.inputs.at("conic-publisher", default: "0") != "1" {
  conic-publisher-questions()
}`
  return attachWebPayload({
    source: `${text.slice(0, start)}${replacement}${text.slice(end + QUESTIONS_END.length)}`,
    factory: 'conic-publisher-questions',
    mode: 'hub',
  }, text)
}

export function createCollectorSource({ sourceImport, questionFactory, rendererImport }) {
  return `#let conic-output = sys.inputs.at("conic-output", default: "metadata")
#let conic-question-index = int(sys.inputs.at("conic-question-index", default: "0"))
#set page(width: if conic-output == "asset" { auto } else { 18cm }, height: auto, margin: if conic-output == "asset" { 3mm } else { 6mm })

#import ${JSON.stringify(rendererImport)}: tn, ds, tln, tl
#let base-tn = tn
#let base-ds = ds
#let base-tln = tln
#let base-tl = tl
#import ${JSON.stringify(sourceImport)}: ${questionFactory}, conic-publisher-assets

#let conic-nodes = state("conic-browser-publisher-nodes", ())
#let add-node(node) = conic-nodes.update(nodes => nodes + (node,))
#let as-array(value) = if value == none { () } else if type(value) == array { value } else { (value,) }

#let collect-tn(stem, options, mode: "dethi", ..args) = add-node((
  kind: "question", type: "tn", stem: stem, payload: options, args: args,
))
#let collect-ds(stem, statements, mode: "dethi", ..args) = add-node((
  kind: "question", type: "ds", stem: stem, payload: statements, args: args,
))
#let collect-tln(stem, answer, mode: "dethi", ..args) = add-node((
  kind: "question", type: "tln", stem: stem, payload: answer, args: args,
))
#let collect-tl(stem, mode: "dethi", ..args) = add-node((
  kind: "question", type: "tl", stem: stem, payload: none, args: args,
))
#let collect-part(title, ..args) = add-node((kind: "part", title: title, args: args))

#place(hide(${questionFactory}(
  tn: collect-tn,
  ds: collect-ds,
  tln: collect-tln,
  tl: collect-tl,
  exam-part: collect-part,
)))

#let emit(value) = [#metadata(value) <conic-export-node>]
#let normalized-options(options, named) = {
  let explicit = as-array(named.at("correct", default: ()))
  options.enumerate().map(((index, option)) => {
    let dictionary = type(option) == dictionary
    (
      id: if dictionary { option.at("id", default: "o" + str(index + 1)) } else { "o" + str(index + 1) },
      source-index: index + 1,
      is-correct: if dictionary { option.at("correct", default: false) } else { explicit.contains(index + 1) },
    )
  })
}
#let normalized-statements(statements) = statements.enumerate().map(((index, statement)) => (
  id: if type(statement) == dictionary { statement.at("id", default: "s" + str(index + 1)) } else { "s" + str(index + 1) },
  source-index: index + 1,
  is-correct: type(statement) == dictionary and statement.at("correct", default: false),
))

#let metadata-node(node, position, part-index) = {
  let named = node.args.named()
  let points = named.at("points", default: if node.type == "tn" { 0.25 } else if node.type == "ds" { 1 } else if node.type == "tln" { 0.5 } else { 1 })
  let solution = named.at("loigiai", default: named.at("solution", default: none))
  let common = (
    kind: "question",
    position: position,
    part-index: part-index,
    type: node.type,
    source-id: named.at("id", default: none),
    points: points,
    stem: node.stem,
    has-solution: solution != none,
  )
  if node.type == "tn" {
    (..common, options: normalized-options(node.payload, named))
  } else if node.type == "ds" {
    (..common, statements: normalized-statements(node.payload))
  } else if node.type == "tln" {
    (..common,
      answer-display: node.payload,
      answer-value: named.at("answer-value", default: none),
      accepted-answers: named.at("accepted-answers", default: none),
      tolerance: named.at("tolerance", default: 0),
    )
  } else {
    (..common, rubric: named.at("rubric", default: ()))
  }
}

#let render-question(node, mode) = {
  if node.type == "tn" {
    base-tn(node.stem, node.payload, mode: mode, ..node.args)
  } else if node.type == "ds" {
    base-ds(node.stem, node.payload, mode: mode, ..node.args)
  } else if node.type == "tln" {
    base-tln(node.stem, node.payload, mode: mode, ..node.args)
  } else {
    base-tl(node.stem, mode: mode, ..node.args)
  }
}

#context {
  let nodes = conic-nodes.get()
  if conic-output == "metadata" {
    let position = 0
    let part-index = 0
    for node in nodes {
      if node.kind == "part" {
        part-index += 1
        emit((kind: "part", part-index: part-index, title: node.title))
      } else {
        position += 1
        emit(metadata-node(node, position, part-index))
      }
    }
  } else {
    if conic-output == "asset" {
      if conic-question-index < 0 or conic-question-index >= conic-publisher-assets.len() {
        panic("Chỉ số hình minh họa không hợp lệ")
      }
      conic-publisher-assets.at(conic-question-index)
    } else {
      let questions = nodes.filter(node => node.kind == "question")
      if conic-question-index < 0 or conic-question-index >= questions.len() {
        panic("Chỉ số câu hỏi không hợp lệ")
      }
      render-question(questions.at(conic-question-index), if conic-output == "review" { "loigiai" } else { "dethi" })
    }
  }
}`
}
