export const QUESTIONS_START = '// === CONICTYPST:QUESTIONS:START ==='
export const QUESTIONS_END = '// === CONICTYPST:QUESTIONS:END ==='

const QUESTION_CALL = /^(\s*)(exam-part|tn|ds|tln|tl)\s*\(/gm

export function extractLegacyQuestionBody(source) {
  const text = String(source || '')
  const declaration = text.indexOf('#let make-questions')
  if (declaration < 0) throw new Error('Không tìm thấy khối make-questions trong mẫu nguồn.')

  const openingBrace = text.indexOf('{', declaration)
  const closingBrace = text.lastIndexOf('}')
  if (openingBrace < 0 || closingBrace <= openingBrace) {
    throw new Error('Khối make-questions chưa đóng đúng dấu ngoặc nhọn.')
  }

  return text
    .slice(openingBrace + 1, closingBrace)
    .replace(/^\n+|\s+$/g, '')
    .split('\n')
    .map(line => line.startsWith('  ') ? line.slice(2) : line)
    .join('\n')
}

export function toDirectQuestionBody(source) {
  return extractLegacyQuestionBody(source).replace(QUESTION_CALL, '$1#$2(')
}

export function markQuestionBody(body) {
  return `${QUESTIONS_START}\n${String(body || '').trim()}\n${QUESTIONS_END}`
}

export function extractMarkedQuestionBody(source) {
  const text = String(source || '')
  const start = text.indexOf(QUESTIONS_START)
  const end = text.indexOf(QUESTIONS_END)
  if (start < 0 || end <= start) {
    throw new Error('Tệp chưa có vùng câu hỏi trực tiếp của ConicTypst.')
  }
  return text.slice(start + QUESTIONS_START.length, end).trim()
}

export function isLegacyQuestionFactoryContext(source, offset = source?.length || 0) {
  const beforeCursor = String(source || '').slice(0, Math.max(0, offset))
  const declaration = beforeCursor.lastIndexOf('#let make-questions')
  if (declaration < 0) return false

  const block = beforeCursor.slice(declaration)
  let depth = 0
  let inString = false
  let inLineComment = false
  for (let index = 0; index < block.length; index += 1) {
    const char = block[index]
    const next = block[index + 1]
    if (inLineComment) {
      if (char === '\n') inLineComment = false
      continue
    }
    if (!inString && char === '/' && next === '/') {
      inLineComment = true
      index += 1
      continue
    }
    if (char === '"' && block[index - 1] !== '\\') inString = !inString
    if (inString) continue
    if (char === '{') depth += 1
    if (char === '}') depth -= 1
  }
  return depth > 0
}

export function contextualSnippetText(item, source = '', offset = source.length) {
  const text = item?.text ?? item?.snippet ?? ''
  if (!text || !isLegacyQuestionFactoryContext(source, offset)) return text
  if (!['exam-part', 'tn', 'ds', 'tln', 'tl'].includes(item?.id)) return text
  return text.replace(/^#/, '')
}
