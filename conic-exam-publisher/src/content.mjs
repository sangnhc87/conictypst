const SIMPLE_CONTENT_FUNCS = new Set(['text', 'symbol', 'sequence', 'equation', 'space', 'linebreak', 'styled'])

function textFromNode(value, { simple = false } = {}) {
  if (value === null || value === undefined) return ''
  if (typeof value === 'string' || typeof value === 'number') return String(value)
  if (typeof value === 'boolean') return value ? 'true' : 'false'
  if (Array.isArray(value)) return value.map(child => textFromNode(child, { simple })).join(' ')
  if (typeof value !== 'object') return ''

  const func = value.func
  if (simple && func && !SIMPLE_CONTENT_FUNCS.has(func)) {
    throw new TypeError(`Đáp án TLN chứa cấu trúc Typst không thể suy ra an toàn: ${func}.`)
  }
  if (func === 'text' || func === 'symbol') {
    return typeof value.text === 'string' ? value.text : textFromNode(value.text, { simple })
  }
  if (func === 'space') return ' '
  if (func === 'linebreak') return '\n'
  if (func === 'h') return ''
  if (func === 'v') return '\n'
  if (func === 'sequence') return (value.children || []).map(child => textFromNode(child, { simple })).join('')
  if (func === 'equation') return textFromNode(value.body, { simple })
  if (func === 'styled') return textFromNode(value.child, { simple })
  if (func === 'frac') {
    if (simple) throw new TypeError('Đáp án phân số cần answer-value rõ ràng.')
    return `${textFromNode(value.num)}/${textFromNode(value.denom)}`
  }
  if (func === 'attach') {
    if (simple) throw new TypeError('Đáp án có chỉ số/mũ cần answer-value rõ ràng.')
    return `${textFromNode(value.base)}${value.t === undefined ? '' : `^${textFromNode(value.t)}`}${value.b === undefined ? '' : `_${textFromNode(value.b)}`}`
  }
  if (func === 'lr') return textFromNode(value.body, { simple })
  if (func === 'op') return textFromNode(value.text, { simple })
  if (typeof value.text === 'string') return value.text
  return Object.entries(value)
    .filter(([key]) => !['func', 'styles'].includes(key))
    .map(([, child]) => textFromNode(child, { simple }))
    .join(' ')
}

function cleanText(value) {
  return value
    .replace(/\u2212/gu, '-')
    .replace(/\u00a0/gu, ' ')
    .replace(/[ \t]+/gu, ' ')
    .replace(/ *\n */gu, '\n')
    .trim()
}

export function contentToPlainText(value, maxLength = 5000) {
  return cleanText(textFromNode(value)).slice(0, maxLength)
}

export function deriveSimpleAnswer(value) {
  const answer = cleanText(textFromNode(value, { simple: true })).replace(/\s+/gu, '')
  if (!answer) throw new TypeError('Không thể suy ra đáp án TLN rỗng.')
  return answer
}

export function finiteAnswer(value, field) {
  if (typeof value === 'number') {
    if (!Number.isFinite(value)) throw new TypeError(`${field} phải là số hữu hạn.`)
    return value
  }
  if (typeof value !== 'string' || !value.trim()) throw new TypeError(`${field} phải là chuỗi hoặc số không rỗng.`)
  return value.trim().replace(/\u2212/gu, '-')
}
