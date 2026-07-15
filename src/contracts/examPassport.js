export const EXAM_PASSPORT_SCHEMA = 'conic.exam-passport'
export const EXAM_PASSPORT_VERSION = 1
export const EXAM_PASSPORT_CHECKSUM = 'SHA-256'

const QUESTION_TYPES = new Set(['tn', 'ds', 'tln', 'tl'])

function isRecord(value) {
  return value !== null && typeof value === 'object' && !Array.isArray(value)
}

function stableJson(value) {
  if (Array.isArray(value)) {
    return `[${value.map(item => item === undefined ? 'null' : stableJson(item)).join(',')}]`
  }
  if (isRecord(value)) {
    return `{${Object.keys(value).filter(key => value[key] !== undefined).sort().map(key => `${JSON.stringify(key)}:${stableJson(value[key])}`).join(',')}}`
  }
  return JSON.stringify(value)
}

function passportPayload(passport) {
  const { checksum: _checksum, ...payload } = passport
  return payload
}

function push(errors, condition, path, message) {
  if (!condition) errors.push({ path, message })
}

function validateQuestion(question, path, errors) {
  push(errors, isRecord(question), path, 'Câu hỏi phải là object.')
  if (!isRecord(question)) return

  push(errors, Number.isInteger(question.position) && question.position > 0, `${path}.position`, 'Vị trí phải là số nguyên dương.')
  push(errors, typeof question.sourceId === 'string' && question.sourceId.trim().length > 0, `${path}.sourceId`, 'Thiếu mã câu nguồn ổn định.')
  push(errors, QUESTION_TYPES.has(question.type), `${path}.type`, 'Loại câu chỉ nhận tn, ds, tln hoặc tl.')

  if (question.type === 'tn') {
    const order = question.optionOrder
    push(errors, Array.isArray(order) && order.length >= 2, `${path}.optionOrder`, 'TN phải có thứ tự phương án.')
    if (Array.isArray(order)) {
      push(errors, order.every(item => Number.isInteger(item) && item > 0), `${path}.optionOrder`, 'Mỗi chỉ số phương án phải là số nguyên dương.')
      push(errors, new Set(order).size === order.length, `${path}.optionOrder`, 'Thứ tự phương án không được trùng.')
      push(errors, Number.isInteger(question.answer) && question.answer >= 1 && question.answer <= order.length, `${path}.answer`, 'Đáp án TN phải là vị trí phương án sau khi trộn.')
    }
  }

  if (question.type === 'ds') {
    push(errors, Array.isArray(question.statementOrder) && question.statementOrder.length > 0, `${path}.statementOrder`, 'Đ/S phải có thứ tự phát biểu.')
    push(errors, Array.isArray(question.answer) && question.answer.length === question.statementOrder?.length && question.answer.every(item => typeof item === 'boolean'), `${path}.answer`, 'Đáp án Đ/S phải là mảng boolean cùng số phát biểu.')
  }

  if (question.type === 'tln') {
    push(errors, typeof question.answer === 'string' && question.answer.length > 0, `${path}.answer`, 'Đáp án TLN phải là chuỗi để giữ nguyên dấu phẩy và số 0.')
  }
}

export function validateExamPassport(passport, { requireChecksum = true } = {}) {
  const errors = []
  push(errors, isRecord(passport), '$', 'Passport phải là object JSON.')
  if (!isRecord(passport)) return { ok: false, errors }

  push(errors, passport.schema === EXAM_PASSPORT_SCHEMA, '$.schema', `Schema phải là ${EXAM_PASSPORT_SCHEMA}.`)
  push(errors, passport.schemaVersion === EXAM_PASSPORT_VERSION, '$.schemaVersion', `Chỉ hỗ trợ schemaVersion ${EXAM_PASSPORT_VERSION}.`)
  push(errors, typeof passport.createdAt === 'string' && Number.isFinite(Date.parse(passport.createdAt)), '$.createdAt', 'createdAt phải là thời gian ISO hợp lệ.')
  push(errors, isRecord(passport.producer) && typeof passport.producer.app === 'string' && typeof passport.producer.version === 'string', '$.producer', 'Thiếu ứng dụng và phiên bản tạo passport.')
  push(errors, isRecord(passport.exam), '$.exam', 'Thiếu metadata kỳ thi.')
  if (isRecord(passport.exam)) {
    push(errors, typeof passport.exam.id === 'string' && passport.exam.id.trim().length > 0, '$.exam.id', 'Kỳ thi cần một ID ổn định.')
    push(errors, typeof passport.exam.title === 'string' && passport.exam.title.trim().length > 0, '$.exam.title', 'Thiếu tên kỳ thi.')
    push(errors, typeof passport.exam.subject === 'string' && passport.exam.subject.trim().length > 0, '$.exam.subject', 'Thiếu môn thi.')
  }
  push(errors, isRecord(passport.sheet) && typeof passport.sheet.profile === 'string' && Number.isInteger(passport.sheet.schemaVersion), '$.sheet', 'Thiếu loại phiếu hoặc phiên bản phiếu.')
  push(errors, Array.isArray(passport.variants) && passport.variants.length > 0, '$.variants', 'Passport phải có ít nhất một mã đề.')

  if (Array.isArray(passport.variants)) {
    const codes = new Set()
    passport.variants.forEach((variant, variantIndex) => {
      const path = `$.variants[${variantIndex}]`
      push(errors, isRecord(variant), path, 'Mã đề phải là object.')
      if (!isRecord(variant)) return
      push(errors, typeof variant.code === 'string' && variant.code.trim().length > 0, `${path}.code`, 'Thiếu mã đề.')
      push(errors, !codes.has(variant.code), `${path}.code`, 'Mã đề bị trùng.')
      codes.add(variant.code)
      push(errors, Array.isArray(variant.questions) && variant.questions.length > 0, `${path}.questions`, 'Mã đề phải chứa mapping câu hỏi.')
      if (Array.isArray(variant.questions)) {
        variant.questions.forEach((question, questionIndex) => validateQuestion(question, `${path}.questions[${questionIndex}]`, errors))
        const positions = variant.questions.map(question => question?.position)
        push(errors, positions.every((position, index) => position === index + 1), `${path}.questions`, 'Vị trí câu phải liên tục từ 1.')
      }
    })
  }

  if (requireChecksum) {
    push(errors, isRecord(passport.checksum), '$.checksum', 'Thiếu checksum.')
    if (isRecord(passport.checksum)) {
      push(errors, passport.checksum.algorithm === EXAM_PASSPORT_CHECKSUM, '$.checksum.algorithm', `Checksum phải dùng ${EXAM_PASSPORT_CHECKSUM}.`)
      push(errors, /^[a-f0-9]{64}$/.test(passport.checksum.value || ''), '$.checksum.value', 'Checksum SHA-256 không hợp lệ.')
    }
  }

  return { ok: errors.length === 0, errors }
}

export async function computeExamPassportChecksum(passport) {
  const canonical = stableJson(passportPayload(passport))
  const digest = await globalThis.crypto.subtle.digest('SHA-256', new TextEncoder().encode(canonical))
  return Array.from(new Uint8Array(digest), byte => byte.toString(16).padStart(2, '0')).join('')
}

export async function createExamPassport(input) {
  const passport = {
    schema: EXAM_PASSPORT_SCHEMA,
    schemaVersion: EXAM_PASSPORT_VERSION,
    createdAt: input.createdAt || new Date().toISOString(),
    producer: input.producer,
    exam: input.exam,
    sheet: input.sheet,
    variants: input.variants,
  }
  const validation = validateExamPassport(passport, { requireChecksum: false })
  if (!validation.ok) {
    throw new TypeError(`Exam Passport không hợp lệ: ${validation.errors.map(error => `${error.path} ${error.message}`).join('; ')}`)
  }
  passport.checksum = {
    algorithm: EXAM_PASSPORT_CHECKSUM,
    value: await computeExamPassportChecksum(passport),
  }
  return passport
}

export async function verifyExamPassport(passport) {
  const validation = validateExamPassport(passport)
  if (!validation.ok) return validation
  const actual = await computeExamPassportChecksum(passport)
  if (actual !== passport.checksum.value) {
    return { ok: false, errors: [{ path: '$.checksum.value', message: 'Nội dung đã thay đổi hoặc file bị hỏng.' }] }
  }
  return { ok: true, errors: [] }
}

export async function parseExamPassport(json) {
  let passport
  try {
    passport = JSON.parse(json)
  } catch {
    return { ok: false, errors: [{ path: '$', message: 'File không phải JSON hợp lệ.' }] }
  }
  const verification = await verifyExamPassport(passport)
  return verification.ok ? { ok: true, passport, errors: [] } : verification
}
