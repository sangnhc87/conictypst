import crypto from 'node:crypto'
import { contentToPlainText, deriveSimpleAnswer, finiteAnswer } from './content.mjs'

export function sha256(value) {
  return crypto.createHash('sha256').update(value).digest('hex')
}

function stable(value) {
  if (Array.isArray(value)) return value.map(stable)
  if (value && typeof value === 'object') {
    return Object.keys(value).sort().reduce((result, key) => {
      result[key] = stable(value[key])
      return result
    }, {})
  }
  return value
}

export function stableHash(value) {
  return sha256(JSON.stringify(stable(value)))
}

function numeric(value, field, { min = 0, max = 100 } = {}) {
  if (typeof value !== 'number' || !Number.isFinite(value) || value < min || value > max) {
    throw new TypeError(`${field} phải là số hữu hạn từ ${min} đến ${max}.`)
  }
  return value
}

function generatedSourceId(type, position) {
  return `generated:${type}:${String(position).padStart(3, '0')}`
}

function releaseItemId(sourceHash, sourceId, type, position) {
  return `${type}-${String(position).padStart(3, '0')}-${sha256(`${sourceHash}\0${sourceId}`).slice(0, 12)}`
}

function normalizeAcceptedAnswers(node, strict, warnings) {
  const explicitAccepted = node['accepted-answers']
  const explicitValue = node['answer-value']
  let values
  if (explicitAccepted !== null && explicitAccepted !== undefined) {
    values = Array.isArray(explicitAccepted) ? explicitAccepted : [explicitAccepted]
  } else if (explicitValue !== null && explicitValue !== undefined) {
    values = [explicitValue]
  } else {
    if (strict) throw new TypeError(`Câu TLN vị trí ${node.position} thiếu answer-value hoặc accepted-answers.`)
    values = [deriveSimpleAnswer(node['answer-display'])]
    warnings.push(`TLN ${node.position}: suy ra đáp án "${values[0]}" từ nội dung hiển thị; cần giáo viên xác nhận.`)
  }
  if (!values.length || values.length > 20) throw new TypeError(`TLN ${node.position}: accepted-answers phải có 1-20 giá trị.`)
  return values.map((value, index) => finiteAnswer(value, `TLN ${node.position} acceptedAnswers[${index}]`))
}

function structureCounts(questions) {
  return questions.reduce((counts, question) => {
    counts[question.type] = (counts[question.type] || 0) + 1
    return counts
  }, { tn: 0, ds: 0, tln: 0, tl: 0 })
}

export function normalizeMetadata(nodes, {
  sourceHash,
  strict,
  profile,
}) {
  const warnings = []
  const parts = new Map()
  for (const node of nodes) {
    if (node?.kind === 'part') {
      parts.set(node['part-index'], {
        index: node['part-index'],
        title: contentToPlainText(node.title, 500),
      })
    }
  }
  const rawQuestions = nodes.filter(node => node?.kind === 'question')
  if (!rawQuestions.length) throw new TypeError('Typst không xuất được câu hỏi nào.')
  const seenSourceIds = new Set()

  const questions = rawQuestions.map((node, index) => {
    const position = index + 1
    if (node.position !== position) throw new TypeError(`Vị trí câu không liên tục tại ${position}.`)
    if (!['tn', 'ds', 'tln', 'tl'].includes(node.type)) throw new TypeError(`Loại câu không hỗ trợ: ${node.type}`)
    let sourceId = typeof node['source-id'] === 'string' ? node['source-id'].trim() : ''
    if (!sourceId) {
      if (strict) throw new TypeError(`Câu ${position} (${node.type}) thiếu id ổn định.`)
      sourceId = generatedSourceId(node.type, position)
      warnings.push(`Câu ${position}: sinh ID tạm ${sourceId}; ID này không bền khi đổi thứ tự câu.`)
    }
    if (sourceId.length > 256) throw new TypeError(`ID nguồn quá dài tại câu ${position}.`)
    if (seenSourceIds.has(sourceId)) throw new TypeError(`ID nguồn bị trùng: ${sourceId}`)
    seenSourceIds.add(sourceId)
    const points = numeric(node.points, `points câu ${position}`, { min: 0.01, max: 100 })
    const itemId = releaseItemId(sourceHash, sourceId, node.type, position)
    const section = parts.get(node['part-index']) || null
    const base = {
      position,
      sourceId,
      itemId,
      type: node.type,
      points,
      stemText: contentToPlainText(node.stem),
      section,
      hasSolution: Boolean(node['has-solution']),
    }

    if (node.type === 'tn') {
      if (!Array.isArray(node.options) || node.options.length < 2 || node.options.length > 6) {
        throw new TypeError(`TN ${position} phải có 2-6 phương án.`)
      }
      const correct = node.options.filter(option => option['is-correct'] === true)
      if (correct.length !== 1) throw new TypeError(`TN ${position} phải có đúng một phương án đúng; nhận ${correct.length}.`)
      const options = node.options.map((option, optionIndex) => ({
        id: `o${optionIndex + 1}`,
        label: String.fromCharCode(65 + optionIndex),
        sourceIndex: option['source-index'],
      }))
      return { ...base, options, answer: options[node.options.indexOf(correct[0])].id }
    }
    if (node.type === 'ds') {
      if (!Array.isArray(node.statements) || node.statements.length !== 4) {
        throw new TypeError(`Đ/S ${position} phải có đúng 4 phát biểu.`)
      }
      const statements = node.statements.map((statement, statementIndex) => ({
        id: `s${statementIndex + 1}`,
        label: String.fromCharCode(97 + statementIndex),
        sourceIndex: statement['source-index'],
      }))
      return { ...base, statements, answer: node.statements.map(statement => statement['is-correct'] === true) }
    }
    if (node.type === 'tln') {
      const acceptedAnswers = normalizeAcceptedAnswers(node, strict, warnings)
      const tolerance = numeric(node.tolerance ?? 0, `tolerance TLN ${position}`, { min: 0, max: 1000000 })
      return { ...base, acceptedAnswers, tolerance }
    }
    return { ...base, rubric: node.rubric || [] }
  })

  const counts = structureCounts(questions)
  const maximumScore = Math.round(questions.reduce((sum, item) => sum + item.points, 0) * 10000) / 10000
  if (profile === 'thpt-2025') {
    const expected = { tn: 12, ds: 4, tln: 6, tl: 0 }
    for (const [type, count] of Object.entries(expected)) {
      if (counts[type] !== count) throw new TypeError(`Profile thpt-2025 cần ${count} câu ${type.toUpperCase()}, nhận ${counts[type]}.`)
    }
    if (maximumScore !== 10) throw new TypeError(`Profile thpt-2025 phải có tổng 10 điểm, nhận ${maximumScore}.`)
  }
  return { questions, counts, maximumScore, warnings }
}

function publicItem(question, asset) {
  const item = {
    id: question.itemId,
    type: question.type,
    position: question.position,
    points: question.points,
    // Keep the candidate package self-contained. The player can gunzip this
    // object locally and verify both the expanded byte count and SHA-256.
    questionSvg: {
      encoding: 'gzip-base64',
      data: asset.gzipBase64,
      sha256: asset.sha256,
      bytes: asset.bytes,
    },
    stemText: question.stemText,
  }
  if (question.type === 'tn') item.options = question.options.map(({ id, label }) => ({ id, label }))
  if (question.type === 'ds') item.statements = question.statements.map(({ id, label }) => ({ id, label }))
  return item
}

function privateKey(question, solutionAsset) {
  const key = {
    id: question.itemId,
    sourceId: question.sourceId,
    type: question.type,
    points: question.points,
  }
  if (question.type === 'tn') {
    key.answer = question.answer
    key.optionOrder = question.options.map(option => option.id)
  } else if (question.type === 'ds') {
    key.answer = question.answer
    key.statementOrder = question.statements.map(statement => statement.id)
  } else if (question.type === 'tln') {
    key.answer = question.acceptedAnswers[0]
    key.acceptedAnswers = question.acceptedAnswers
    key.tolerance = question.tolerance
  } else {
    key.rubric = question.rubric
  }
  if (solutionAsset) {
    key.solutionAsset = {
      assetId: solutionAsset.id,
      sha256: solutionAsset.sha256,
      bytes: solutionAsset.bytes,
    }
  }
  return key
}

export function assemblePackage({
  title,
  description,
  sourceId,
  sourceHash,
  version,
  questions,
  questionAssets,
  solutionAssets,
  compilerVersion,
  warnings,
}) {
  if (questionAssets.length !== questions.length) throw new TypeError('Số candidate SVG không khớp số câu hỏi.')
  if (solutionAssets.length && solutionAssets.length !== questions.length) throw new TypeError('Số review SVG không khớp số câu hỏi.')
  const publicItems = questions.map((question, index) => publicItem(question, questionAssets[index]))
  const answerKey = questions.map((question, index) => privateKey(question, solutionAssets[index] || null))
  const assets = {}
  // Candidate SVGs already live inside publicItems as gzip-base64. Only
  // optional private review assets remain in the top-level build artifact.
  for (const asset of solutionAssets) {
    assets[asset.id] = {
      id: asset.id,
      scope: asset.scope,
      mimeType: asset.mimeType,
      sha256: asset.sha256,
      bytes: asset.bytes,
      content: asset.content,
    }
  }
  const packageValue = {
    schemaVersion: 'conic-exam-package/v1',
    title,
    description,
    sourceId,
    sourceHash,
    version,
    publicItems,
    answerKey,
    assets,
    compiler: { name: 'typst', version: compilerVersion },
    warnings,
  }
  packageValue.buildHash = stableHash({
    schemaVersion: packageValue.schemaVersion,
    title,
    description,
    sourceId,
    sourceHash,
    version,
    publicItems,
    answerKey,
    assets: Object.fromEntries(Object.entries(assets).map(([id, asset]) => [id, asset.sha256])),
    compiler: packageValue.compiler,
  })
  return packageValue
}
