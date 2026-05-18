const HEADER_FIELDS = [
  ['department', 'department'],
  ['school', 'school'],
  ['exam-title', 'examTitle'],
  ['subject', 'subject'],
  ['duration', 'duration'],
  ['footer-left', 'footerLeft'],
  ['code', 'code'],
]

export const QUESTION_TYPE_ORDER = ['tn', 'ds', 'tln', 'tl']

const QUESTION_TYPES = new Set(QUESTION_TYPE_ORDER)

export const SHUFFLE_MODE_OPTIONS = [
  { value: 'structure-and-options', label: 'Trộn câu và phương án' },
  { value: 'questions', label: 'Chỉ trộn thứ tự câu' },
  { value: 'options', label: 'Chỉ trộn phương án / phát biểu' },
  { value: 'keep', label: 'Giữ nguyên đề' },
]

export function createDefaultSectionModes() {
  return {
    tn: 'structure-and-options',
    ds: 'structure-and-options',
    tln: 'questions',
    tl: 'keep',
  }
}

export function normalizeSectionModes(sectionModes = {}, fallbackMode = null) {
  const defaults = createDefaultSectionModes()
  const validModes = new Set(SHUFFLE_MODE_OPTIONS.map(option => option.value))

  return QUESTION_TYPE_ORDER.reduce((modes, type) => {
    const candidate = sectionModes?.[type] ?? fallbackMode ?? defaults[type]
    modes[type] = validModes.has(candidate) ? candidate : defaults[type]
    return modes
  }, {})
}

export function shuffleArray(items) {
  const next = [...items]
  for (let index = next.length - 1; index > 0; index -= 1) {
    const swapIndex = Math.floor(Math.random() * (index + 1))
    ;[next[index], next[swapIndex]] = [next[swapIndex], next[index]]
  }
  return next
}

export function stripExtension(name) {
  return String(name || '').replace(/\.[^.]+$/, '')
}

export function sanitizeFileSegment(value) {
  return String(value || '')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-zA-Z0-9_-]+/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '')
}

export function parseCodeList(value) {
  return String(value || '')
    .split(',')
    .map(item => item.trim())
    .filter(Boolean)
}

export function buildSequentialCodes(seed, count) {
  const safeCount = Math.max(1, Number(count) || 1)
  const seedText = String(seed || '101').trim()

  if (/^\d+$/.test(seedText)) {
    const start = Number(seedText)
    return Array.from({ length: safeCount }, (_, index) => String(start + index))
  }

  const base = sanitizeFileSegment(seedText) || 'made'
  return Array.from({ length: safeCount }, (_, index) => `${base}-${index + 1}`)
}

export function normalizeCodeList(value, count) {
  const safeCount = Math.max(1, Number(count) || 1)
  const codes = parseCodeList(value)

  if (codes.length === 0) {
    return buildSequentialCodes('101', safeCount)
  }

  if (codes.length >= safeCount) {
    return codes.slice(0, safeCount)
  }

  const extended = [...codes]
  const lastCode = extended[extended.length - 1]

  if (/^\d+$/.test(lastCode)) {
    let nextCode = Number(lastCode) + 1
    while (extended.length < safeCount) {
      extended.push(String(nextCode))
      nextCode += 1
    }
    return extended
  }

  const base = sanitizeFileSegment(extended[0]) || 'made'
  let suffix = extended.length + 1
  while (extended.length < safeCount) {
    extended.push(`${base}-${suffix}`)
    suffix += 1
  }
  return extended
}

function escapeQuotedValue(value) {
  return String(value || '').replace(/\\/g, '\\\\').replace(/"/g, '\\"')
}

function readBalanced(text, openIndex, openChar, closeChar) {
  let depth = 0
  let inString = false
  let inLineComment = false
  let inMath = false

  for (let index = openIndex; index < text.length; index += 1) {
    const char = text[index]
    const next = text[index + 1]

    if (inLineComment) {
      if (char === '\n') {
        inLineComment = false
      }
      continue
    }

    if (inString) {
      if (char === '\\') {
        index += 1
        continue
      }
      if (char === '"') {
        inString = false
      }
      continue
    }

    // Inside Typst math mode $...$, skip parens (they are math grouping, not call delimiters)
    if (inMath) {
      if (char === '$') {
        inMath = false
      }
      continue
    }

    if (char === '/' && next === '/') {
      inLineComment = true
      index += 1
      continue
    }

    if (char === '"') {
      inString = true
      continue
    }

    // Enter Typst math mode
    if (char === '$') {
      inMath = true
      continue
    }

    if (char === openChar) {
      depth += 1
      continue
    }

    if (char === closeChar) {
      depth -= 1
      if (depth === 0) {
        return index
      }
    }
  }

  return -1
}

function splitTopLevelArgs(text) {
  const segments = []
  let start = 0
  let parenDepth = 0
  let bracketDepth = 0
  let braceDepth = 0
  let inString = false
  let inLineComment = false

  for (let index = 0; index < text.length; index += 1) {
    const char = text[index]
    const next = text[index + 1]

    if (inLineComment) {
      if (char === '\n') {
        inLineComment = false
      }
      continue
    }

    if (inString) {
      if (char === '\\') {
        index += 1
        continue
      }
      if (char === '"') {
        inString = false
      }
      continue
    }

    if (char === '/' && next === '/') {
      inLineComment = true
      index += 1
      continue
    }

    if (char === '"') {
      inString = true
      continue
    }

    if (char === '(') {
      parenDepth += 1
      continue
    }
    if (char === ')' && parenDepth > 0) {
      parenDepth -= 1
      continue
    }
    if (char === '[') {
      bracketDepth += 1
      continue
    }
    if (char === ']' && bracketDepth > 0) {
      bracketDepth -= 1
      continue
    }
    if (char === '{') {
      braceDepth += 1
      continue
    }
    if (char === '}' && braceDepth > 0) {
      braceDepth -= 1
      continue
    }

    if (char === ',' && parenDepth === 0 && bracketDepth === 0 && braceDepth === 0) {
      segments.push({ start, end: index, text: text.slice(start, index) })
      start = index + 1
    }
  }

  segments.push({ start, end: text.length, text: text.slice(start) })
  return segments
}

function replaceSegmentText(source, segments, replaceIndex, nextText) {
  let cursor = 0
  let output = ''

  segments.forEach((segment, index) => {
    output += source.slice(cursor, segment.start)
    output += index === replaceIndex ? nextText : segment.text
    cursor = segment.end
  })

  output += source.slice(cursor)
  return output
}

function getCallParts(block) {
  const openIndex = block.indexOf('(')
  if (openIndex === -1) return null
  const closeIndex = readBalanced(block, openIndex, '(', ')')
  if (closeIndex === -1) return null

  return {
    openIndex,
    closeIndex,
    inner: block.slice(openIndex + 1, closeIndex),
  }
}

function isNamedArg(segmentText) {
  return /^\s*[a-zA-Z_][\w-]*\s*:/.test(segmentText)
}

function detectIndent(text, fallback = '  ') {
  const line = text.split('\n').find(item => item.trim())
  if (!line) return fallback
  const match = line.match(/^\s*/)
  return match ? match[0] : fallback
}

function hasTrueWrapper(tupleItems) {
  return tupleItems.some(item => /\bTrue\s*\(/.test(item.text))
}

function parseCorrectIndexes(segmentText) {
  const match = segmentText.match(/^\s*correct\s*:\s*([\s\S]*)$/)
  if (!match) return []

  const value = match[1].trim()
  const numbers = [...value.matchAll(/\d+/g)].map(item => Number(item[0]))
  return numbers.filter(number => Number.isFinite(number) && number > 0)
}

function formatCorrectSegment(segmentText, indexes) {
  const trimmed = segmentText.trim()
  const value = indexes.length <= 1
    ? String(indexes[0] || 1)
    : `(${indexes.join(', ')})`

  if (/^correct\s*:\s*\(/.test(trimmed)) {
    if (indexes.length === 1) {
      return `correct: (${indexes[0]},)`
    }
    return `correct: (${indexes.join(', ')})`
  }

  return `correct: ${value}`
}

function shuffleTupleSegment(tupleText, type, correctSegmentText) {
  const leading = tupleText.match(/^\s*/)?.[0] || ''
  const trailing = tupleText.match(/\s*$/)?.[0] || ''
  const trimmed = tupleText.trim()

  if (!trimmed.startsWith('(') || !trimmed.endsWith(')')) {
    return { tupleText, correctSegmentText }
  }

  const inner = trimmed.slice(1, -1)
  const segments = splitTopLevelArgs(inner).filter(segment => segment.text.trim())
  if (segments.length < 2) {
    return { tupleText, correctSegmentText }
  }

  const shuffled = shuffleArray(segments.map((segment, index) => ({ ...segment, originalIndex: index })))
  const multiline = trimmed.includes('\n')
  const itemIndent = detectIndent(inner, '    ')
  const closingIndent = multiline ? (trimmed.split('\n').pop()?.match(/^\s*/)?.[0] || '') : ''
  const itemsText = shuffled.map(segment => segment.text.trim())
  const tupleCore = multiline
    ? `(${itemsText.map(item => `\n${itemIndent}${item}`).join(',')}\n${closingIndent})`
    : `(${itemsText.join(', ')})`

  let nextCorrectSegment = correctSegmentText
  if (type === 'tn' && !hasTrueWrapper(segments) && correctSegmentText) {
    const currentIndexes = parseCorrectIndexes(correctSegmentText)
    if (currentIndexes.length > 0) {
      const remapped = currentIndexes
        .map(index => shuffled.findIndex(item => item.originalIndex === index - 1) + 1)
        .filter(index => index > 0)
      if (remapped.length > 0) {
        nextCorrectSegment = formatCorrectSegment(correctSegmentText, remapped)
      }
    }
  }

  return {
    tupleText: `${leading}${tupleCore}${trailing}`,
    correctSegmentText: nextCorrectSegment,
  }
}

function shuffleQuestionOptions(block, type) {
  if (!['tn', 'ds'].includes(type)) {
    return block
  }

  const parts = getCallParts(block)
  if (!parts) return block

  const segments = splitTopLevelArgs(parts.inner)
  const positionalIndexes = []
  let correctIndex = -1

  segments.forEach((segment, index) => {
    if (isNamedArg(segment.text)) {
      if (/^\s*correct\s*:/.test(segment.text)) {
        correctIndex = index
      }
      return
    }
    if (segment.text.trim()) {
      positionalIndexes.push(index)
    }
  })

  if (positionalIndexes.length < 2) {
    return block
  }

  const tupleIndex = positionalIndexes[1]
  const correctSegmentText = correctIndex >= 0 ? segments[correctIndex].text : ''
  const shuffled = shuffleTupleSegment(segments[tupleIndex].text, type, correctSegmentText)
  let nextInner = replaceSegmentText(parts.inner, segments, tupleIndex, shuffled.tupleText)

  if (correctIndex >= 0 && shuffled.correctSegmentText !== correctSegmentText) {
    const nextSegments = splitTopLevelArgs(nextInner)
    nextInner = replaceSegmentText(nextInner, nextSegments, correctIndex, shuffled.correctSegmentText)
  }

  return `${block.slice(0, parts.openIndex + 1)}${nextInner}${block.slice(parts.closeIndex)}`
}

function findNextMarker(text, startIndex) {
  let inString = false
  let inLineComment = false

  for (let index = startIndex; index < text.length; index += 1) {
    const char = text[index]
    const next = text[index + 1]

    if (inLineComment) {
      if (char === '\n') {
        inLineComment = false
      }
      continue
    }

    if (inString) {
      if (char === '\\') {
        index += 1
        continue
      }
      if (char === '"') {
        inString = false
      }
      continue
    }

    if (char === '/' && next === '/') {
      inLineComment = true
      index += 1
      continue
    }

    if (char === '"') {
      inString = true
      continue
    }

    if (char === '#') {
      const match = text.slice(index).match(/^#\s*(exam-part|tn|ds|tln|tl)\s*\(/)
      if (match) {
        return { index, token: match[1] }
      }
    }
  }

  return null
}

function extractPartTitle(block) {
  const parts = getCallParts(block)
  if (!parts) return 'Mặc định'
  const segment = splitTopLevelArgs(parts.inner).find(item => item.text.trim() && !isNamedArg(item.text))
  if (!segment) return 'Mặc định'

  const trimmed = segment.text.trim()
  if (trimmed.startsWith('[') && trimmed.endsWith(']')) {
    return trimmed.slice(1, -1).replace(/\s+/g, ' ').trim() || 'Mặc định'
  }

  return trimmed.replace(/\s+/g, ' ').trim() || 'Mặc định'
}

function extractHeaderBlock(text) {
  const marker = '#show: thpt-school-exam.with'
  const start = text.indexOf(marker)
  if (start === -1) return null

  const openIndex = text.indexOf('(', start)
  if (openIndex === -1) return null
  const closeIndex = readBalanced(text, openIndex, '(', ')')
  if (closeIndex === -1) return null

  return {
    start,
    openIndex,
    closeIndex,
    inner: text.slice(openIndex + 1, closeIndex),
  }
}

export function extractHeaderMetadata(text) {
  const block = extractHeaderBlock(text)
  const metadata = {
    department: '',
    school: '',
    examTitle: '',
    subject: '',
    duration: '',
    footerLeft: '',
    code: '',
  }

  if (!block) {
    return metadata
  }

  const segments = splitTopLevelArgs(block.inner)
  segments.forEach(segment => {
    const match = segment.text.match(/^\s*([a-zA-Z_][\w-]*)\s*:\s*([\s\S]*)$/)
    if (!match) return

    const [, key, rawValue] = match
    const mappedKey = HEADER_FIELDS.find(entry => entry[0] === key)?.[1]
    if (!mappedKey) return

    const value = rawValue.trim()
    if (value.startsWith('"') && value.endsWith('"')) {
      metadata[mappedKey] = value.slice(1, -1)
      return
    }

    if (value.startsWith('[') && value.endsWith(']')) {
      metadata[mappedKey] = value.slice(1, -1).trim()
      return
    }

    metadata[mappedKey] = value
  })

  return metadata
}

function updateHeaderMetadata(text, formState, code) {
  const block = extractHeaderBlock(text)
  if (!block) return text

  const indent = detectIndent(block.inner, '  ')
  const segments = splitTopLevelArgs(block.inner)
  const seen = new Set()
  const replacements = new Map([
    ['department', `department: "${escapeQuotedValue(formState.department)}"`],
    ['school', `school: "${escapeQuotedValue(formState.school)}"`],
    ['exam-title', `exam-title: "${escapeQuotedValue(formState.examTitle)}"`],
    ['subject', `subject: "${escapeQuotedValue(formState.subject)}"`],
    ['duration', `duration: "${escapeQuotedValue(formState.duration)}"`],
    ['footer-left', `footer-left: [${String(formState.footerLeft || '').trim()}]`],
    ['code', `code: "${escapeQuotedValue(code)}"`],
  ])

  const rebuilt = segments
    .map(segment => {
      const match = segment.text.match(/^\s*([a-zA-Z_][\w-]*)\s*:/)
      if (!match) {
        return segment.text.trim()
      }

      const key = match[1]
      if (!replacements.has(key)) {
        return segment.text.trim()
      }

      seen.add(key)
      return replacements.get(key)
    })
    .filter(Boolean)

  replacements.forEach((replacement, key) => {
    if (!seen.has(key)) {
      rebuilt.push(replacement)
    }
  })

  const nextInner = `\n${rebuilt.map(item => `${indent}${item},`).join('\n')}\n`
  return `${text.slice(0, block.openIndex + 1)}${nextInner}${text.slice(block.closeIndex)}`
}

function findMakeQuestionsRegion(text) {
  const start = text.indexOf('#let make-questions')
  if (start === -1) return null

  const equalsIndex = text.indexOf('=', start)
  if (equalsIndex === -1) return null
  const bodyOpen = text.indexOf('[', equalsIndex)
  if (bodyOpen === -1) return null
  const bodyClose = readBalanced(text, bodyOpen, '[', ']')
  if (bodyClose === -1) return null

  return {
    prefix: text.slice(0, bodyOpen + 1),
    body: text.slice(bodyOpen + 1, bodyClose),
    suffix: text.slice(bodyClose),
    hasMakeQuestions: true,
  }
}

function findFallbackBodyRegion(text) {
  const firstMarker = findNextMarker(text, 0)
  if (!firstMarker) {
    return {
      prefix: text,
      body: '',
      suffix: '',
      hasMakeQuestions: false,
    }
  }

  let cursor = firstMarker.index
  let lastEnd = firstMarker.index
  let marker = firstMarker

  while (marker) {
    const openIndex = text.indexOf('(', marker.index)
    const closeIndex = readBalanced(text, openIndex, '(', ')')
    if (closeIndex === -1) {
      marker = findNextMarker(text, marker.index + 1)
      continue
    }

    lastEnd = closeIndex + 1
    cursor = closeIndex + 1
    marker = findNextMarker(text, cursor)
  }

  return {
    prefix: text.slice(0, firstMarker.index),
    body: text.slice(firstMarker.index, lastEnd),
    suffix: text.slice(lastEnd),
    hasMakeQuestions: false,
  }
}

export function parseTypstMixerSource(text) {
  const sourceText = String(text || '')
  const region = findMakeQuestionsRegion(sourceText) || findFallbackBodyRegion(sourceText)
  const groups = []
  let currentGroup = null
  let marker = findNextMarker(region.body, 0)
  let nextQuestionId = 1

  while (marker) {
    const openIndex = region.body.indexOf('(', marker.index)
    const closeIndex = readBalanced(region.body, openIndex, '(', ')')
    if (closeIndex === -1) {
      marker = findNextMarker(region.body, marker.index + 1)
      continue
    }

    const block = region.body.slice(marker.index, closeIndex + 1)

    if (marker.token === 'exam-part') {
      if (currentGroup && (currentGroup.partBlock || currentGroup.questions.length > 0)) {
        groups.push(currentGroup)
      }
      currentGroup = {
        id: groups.length + 1,
        title: extractPartTitle(block),
        partBlock: block,
        questions: [],
      }
    } else if (QUESTION_TYPES.has(marker.token)) {
      if (!currentGroup) {
        currentGroup = {
          id: 1,
          title: 'Mặc định',
          partBlock: '',
          questions: [],
        }
      }
      currentGroup.questions.push({
        id: nextQuestionId,
        type: marker.token,
        block,
        locked: false,
      })
      nextQuestionId += 1
    }

    marker = findNextMarker(region.body, closeIndex + 1)
  }

  if (currentGroup && (currentGroup.partBlock || currentGroup.questions.length > 0)) {
    groups.push(currentGroup)
  }

  return {
    ...region,
    groups,
    headerMeta: extractHeaderMetadata(sourceText),
  }
}

function shuffleQuestionsWithLocks(questions) {
  const movable = shuffleArray(questions.filter(question => !question.locked))
  let movableIndex = 0

  return questions.map(question => {
    if (question.locked) {
      return question
    }
    const nextQuestion = movable[movableIndex]
    movableIndex += 1
    return nextQuestion
  })
}

function shouldShuffleQuestions(mode) {
  return mode === 'structure-and-options' || mode === 'questions'
}

function shouldShuffleOptions(mode) {
  return mode === 'structure-and-options' || mode === 'options'
}

function splitQuestionRunsByType(questions) {
  const runs = []

  questions.forEach(question => {
    const lastRun = runs[runs.length - 1]
    if (!lastRun || lastRun.type !== question.type) {
      runs.push({ type: question.type, questions: [question] })
      return
    }

    lastRun.questions.push(question)
  })

  return runs
}

function buildBodyFromGroups(groups, sectionModes, fallbackMode = null) {
  const normalizedModes = normalizeSectionModes(sectionModes, fallbackMode)
  const chunks = []

  groups.forEach(group => {
    if (group.partBlock) {
      chunks.push(group.partBlock.trim())
    }

    splitQuestionRunsByType(group.questions).forEach(run => {
      const mode = normalizedModes[run.type] || 'keep'
      const orderedQuestions = shouldShuffleQuestions(mode)
        ? shuffleQuestionsWithLocks(run.questions)
        : [...run.questions]

      orderedQuestions.forEach(question => {
        const nextBlock = shouldShuffleOptions(mode) && !question.locked
          ? shuffleQuestionOptions(question.block, question.type)
          : question.block
        chunks.push(nextBlock.trim())
      })
    })
  })

  return chunks.join('\n\n')
}

export function createDefaultFormState(headerMeta = {}) {
  const baseCode = headerMeta.code || '101'

  return {
    department: headerMeta.department || '',
    school: headerMeta.school || '',
    examTitle: headerMeta.examTitle || 'Đề thi mới',
    subject: headerMeta.subject || 'TOÁN',
    duration: headerMeta.duration || '90 phút',
    footerLeft: headerMeta.footerLeft || '',
    numVersions: 4,
    codesInput: buildSequentialCodes(baseCode, 4).join(', '),
    sectionModes: createDefaultSectionModes(),
  }
}

export function countQuestionTypes(groups) {
  return groups.reduce(
    (totals, group) => {
      group.questions.forEach(question => {
        totals.total += 1
        totals[question.type] += 1
      })
      return totals
    },
    { total: 0, tn: 0, ds: 0, tln: 0, tl: 0 },
  )
}

export function formatVariantFileName(baseName, code, index) {
  const safeBase = sanitizeFileSegment(stripExtension(baseName)) || 'typst-mixer'
  const safeCode = sanitizeFileSegment(code) || String(index + 1)
  return `${safeBase}-${safeCode}.typ`
}

export function generateTypstVersions(parsedSource, groups, formState, baseName) {
  const totalVersions = Math.max(1, Number(formState.numVersions) || 1)
  const codes = normalizeCodeList(formState.codesInput, totalVersions)
  const sectionModes = normalizeSectionModes(formState.sectionModes, formState.shuffleMode)

  return Array.from({ length: totalVersions }, (_, index) => {
    const code = codes[index]
    const body = buildBodyFromGroups(groups, sectionModes, formState.shuffleMode)
    const withBody = `${parsedSource.prefix}${body}${parsedSource.suffix}`
    const content = updateHeaderMetadata(withBody, formState, code)

    return {
      index,
      code,
      fileName: formatVariantFileName(baseName, code, index),
      content,
    }
  })
}