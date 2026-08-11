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

// Quét cân bằng ngoặc từ vị trí mở, trả về vị trí ngoặc đóng khớp (hoặc -1).
// Coi các vùng sau là ĐÓNG KÍN (bỏ qua nội dung bên trong): chuỗi "…",
// comment dòng //, comment khối /* */, và math span $…$. Nhờ math span đóng
// kín nên các khoảng như $(0;3)$, $[a;b)$, $k in ZZ$ không làm lệch bộ đếm.
function scanBalancedDelimiter(text, openIndex) {
  const opener = text[openIndex]
  const closer = opener === '(' ? ')' : opener === '[' ? ']' : opener === '{' ? '}' : null
  if (!closer) return -1

  let depth = 0
  let inString = false
  let inLineComment = false
  let inBlockComment = false
  let inMath = false

  for (let index = openIndex; index < text.length; index += 1) {
    const char = text[index]
    const next = text[index + 1]
    const prev = text[index - 1]

    if (inLineComment) {
      if (char === '\n') inLineComment = false
      continue
    }
    if (inBlockComment) {
      if (char === '*' && next === '/') { inBlockComment = false; index += 1 }
      continue
    }
    if (inString) {
      if (char === '"' && prev !== '\\') inString = false
      continue
    }
    if (inMath) {
      if (char === '$' && prev !== '\\') inMath = false
      continue
    }

    if (char === '"') { inString = true; continue }
    if (char === '$') { inMath = true; continue }
    if (char === '/' && next === '/') { inLineComment = true; index += 1; continue }
    if (char === '/' && next === '*') { inBlockComment = true; index += 1; continue }

    if (char === opener) {
      depth += 1
    } else if (char === closer) {
      depth -= 1
      if (depth === 0) return index
    }
  }
  return -1
}

// Định vị thân của factory `#let make-questions(...) = [ … ]` hoặc `= { … }`.
// Trả { open, close, delim } (chỉ số ngoặc mở/đóng, ký tự mở) hoặc null.
export function findFactoryBodyRange(source) {
  const text = String(source || '')
  const declIndex = text.indexOf('#let make-questions')
  if (declIndex < 0) return null

  const parenOpen = text.indexOf('(', declIndex)
  if (parenOpen < 0) return null
  const parenClose = scanBalancedDelimiter(text, parenOpen)
  if (parenClose < 0) return null

  let open = -1
  for (let index = parenClose + 1; index < text.length; index += 1) {
    const char = text[index]
    if (char === '[' || char === '{') { open = index; break }
    // Giữa `)` và mốc mở thân chỉ được có ` = ` và khoảng trắng; gặp ký tự lạ
    // thì coi như không phải factory chuẩn để tránh cắt nhầm.
    if (char !== '=' && char !== ' ' && char !== '\t' && char !== '\r' && char !== '\n') return null
  }
  if (open < 0) return null

  const close = scanBalancedDelimiter(text, open)
  if (close < 0) return null
  return { open, close, delim: text[open] }
}

// Trích thân factory make-questions và chuẩn hóa để đưa sang Pandoc: mọi lời
// gọi câu hỏi ở đầu dòng đều có tiền tố `#`. Idempotent với thân `[ … ]` (calls
// đã có `#`) lẫn `{ … }` (calls trần). KHÔNG dedent để giữ nguyên byte cho bước
// thay ảnh cetz phía sau (strippedContent.replace(block.text, …)) vẫn khớp.
export function extractFactoryQuestionBody(source) {
  const text = String(source || '')
  const range = findFactoryBodyRange(text)
  if (!range) throw new Error('Không tìm thấy khối make-questions hợp lệ.')
  return text.slice(range.open + 1, range.close).trim().replace(QUESTION_CALL, '$1#$2(')
}

// Rút gọn tài liệu cho bước xuất DOCX, KHÔNG bao giờ ném lỗi:
//  1) có marker CONICTYPST:QUESTIONS  → lấy đúng vùng đánh dấu
//  2) có factory make-questions ([ ] hoặc { }) → trích thân, chuẩn hóa `#`
//  3) còn lại (tài liệu tự do)         → giữ nguyên
// Lời gọi make-questions() (kể cả dưới guard #if sys.inputs…) nằm ngoài thân
// factory nên tự bị loại.
export function reduceForDocxExport(source) {
  const text = String(source || '')
  try {
    return extractMarkedQuestionBody(text)
  } catch {
    // Không có marker → thử factory.
  }
  if (findFactoryBodyRange(text)) {
    try {
      return extractFactoryQuestionBody(text)
    } catch {
      // Thân factory bất thường → rơi về giữ nguyên.
    }
  }
  return text
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
