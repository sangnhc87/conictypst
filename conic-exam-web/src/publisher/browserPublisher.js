import { createTypstRenderer } from '@myriaddreamin/typst.ts/dist/esm/main.mjs'
import { contentToPlainText, deriveSimpleAnswer, finiteAnswer } from '../../../conic-exam-publisher/src/content.mjs'
import { encodeStructuredContent } from '../lib/structuredContent.js'

const VERSION = '0.7.0'
let rendererPromise

function getRenderer() {
  if (!rendererPromise) {
    rendererPromise = (async () => {
      const renderer = createTypstRenderer()
      await renderer.init({ getModule: () => `/runtime/typst-renderer-${VERSION}.wasm` })
      return renderer
    })()
  }
  return rendererPromise
}

function bytesToHex(bytes) {
  return [...bytes].map(value => value.toString(16).padStart(2, '0')).join('')
}

async function sha256(value) {
  const bytes = typeof value === 'string' ? new TextEncoder().encode(value) : value
  return bytesToHex(new Uint8Array(await crypto.subtle.digest('SHA-256', bytes)))
}

function base64(bytes) {
  let output = ''
  for (let offset = 0; offset < bytes.length; offset += 0x8000) {
    output += String.fromCharCode(...bytes.subarray(offset, offset + 0x8000))
  }
  return btoa(output)
}

async function gzip(bytes) {
  if (typeof CompressionStream !== 'function') throw new Error('Trình duyệt chưa hỗ trợ nén gói đề. Hãy dùng Chrome hoặc Edge mới.')
  const stream = new Blob([bytes]).stream().pipeThrough(new CompressionStream('gzip'))
  return new Uint8Array(await new Response(stream).arrayBuffer())
}

function structureCounts(questions) {
  return questions.reduce((counts, item) => {
    counts[item.type] = (counts[item.type] || 0) + 1
    return counts
  }, { tn: 0, ds: 0, tln: 0, tl: 0 })
}

function normalizeMetadata(nodes, sourceHash, sourceQuestions = []) {
  const warnings = []
  const parts = new Map(nodes
    .filter(node => node?.kind === 'part')
    .map(node => [Number(node['part-index'] || 0), contentToPlainText(node.title, 120)]))
  const rawQuestions = nodes.filter(node => node?.kind === 'question')
  const seen = new Set()
  const questions = rawQuestions.map((node, index) => {
    const position = index + 1
    const type = node.type
    if (!['tn', 'ds', 'tln', 'tl'].includes(type)) throw new Error(`Loại câu không hỗ trợ: ${type}`)
    let sourceId = typeof node['source-id'] === 'string' ? node['source-id'].trim() : ''
    if (!sourceId) {
      sourceId = `auto:${type}:${String(position).padStart(3, '0')}`
    }
    if (seen.has(sourceId)) throw new Error(`ID câu hỏi bị trùng: ${sourceId}`)
    seen.add(sourceId)
    const points = Number(node.points ?? ({ tn: 0.25, ds: 1, tln: 0.5, tl: 1 })[type])
    if (!Number.isFinite(points) || points <= 0 || points > 100) throw new Error(`Điểm câu ${position} không hợp lệ.`)
    const sourceQuestion = sourceQuestions[index] || {}
    const section = parts.get(Number(node['part-index'] || 0)) || ''
    const base = {
      position, type, sourceId, points,
      section,
      stemText: contentToPlainText(node.stem) || `Câu ${position}`,
      stemSource: sourceQuestion.stemSource || '',
      figureSource: sourceQuestion.figureSource || '',
      solutionSource: sourceQuestion.solutionSource || '',
      itemSeed: `${sourceHash}\0${sourceId}\0${type}\0${position}`,
    }
    if (type === 'tn') {
      if (!Array.isArray(node.options) || node.options.length < 2 || node.options.length > 10) {
        throw new Error(`Câu TN ${position} cần từ 2 đến 10 phương án.`)
      }
      const correct = node.options.filter(option => option['is-correct'] === true)
      if (correct.length !== 1) throw new Error(`Câu TN ${position} phải có đúng một đáp án đúng.`)
      const options = node.options.map((option, optionIndex) => ({
        id: `o${optionIndex + 1}`,
        label: String.fromCharCode(65 + optionIndex),
        contentSource: sourceQuestion.choices?.[optionIndex]?.contentSource || '',
      }))
      return { ...base, options, answer: options[node.options.indexOf(correct[0])].id }
    }
    if (type === 'ds') {
      if (!Array.isArray(node.statements) || node.statements.length !== 4) throw new Error(`Câu Đ/S ${position} phải có đúng 4 ý.`)
      const statements = node.statements.map((statement, statementIndex) => ({
        id: `s${statementIndex + 1}`,
        label: String.fromCharCode(97 + statementIndex),
        contentSource: sourceQuestion.choices?.[statementIndex]?.contentSource || '',
      }))
      return { ...base, statements, answer: node.statements.map(statement => statement['is-correct'] === true) }
    }
    if (type === 'tln') {
      let accepted = node['accepted-answers'] ?? node['answer-value']
      if (accepted === null || accepted === undefined) {
        try {
          accepted = deriveSimpleAnswer(node['answer-display'])
          if (!/^[+-]?(?:\d+(?:[.,]\d+)?|\d+\/\d+)$/u.test(String(accepted))) {
            throw new TypeError('Đáp án không phải một giá trị ngắn có thể chấm tự động.')
          }
        } catch {
          const plain = contentToPlainText(node['answer-display']).replace(/\s+/gu, '')
          if (/^[+-]?(?:\d+(?:[.,]\d+)?|\d+\/\d+)$/u.test(plain)) {
            accepted = plain
          } else {
            warnings.push(`Câu ${position}: đáp án có nhiều biểu thức hoặc lời giải tự do, đã chuyển sang tự luận để giáo viên chấm thay vì đoán sai đáp án.`)
            return { ...base, type: 'tl', rubric: [], sourceType: 'tln' }
          }
        }
      }
      const acceptedAnswers = (Array.isArray(accepted) ? accepted : [accepted])
        .map((value, answerIndex) => finiteAnswer(value, `Đáp án TLN ${position}.${answerIndex + 1}`))
      return { ...base, acceptedAnswers, tolerance: Number(node.tolerance || 0) }
    }
    return { ...base, rubric: Array.isArray(node.rubric) ? node.rubric : [] }
  })
  return { questions, warnings, counts: structureCounts(questions) }
}

async function packAsset(renderer, artifact, index) {
  const renderedSvg = await renderer.renderSvg({
    artifactContent: new Uint8Array(artifact),
    format: 'vector',
    data_selection: { body: true, defs: true, css: true, js: false },
  })
  const svg = renderedSvg.replace(/<foreignObject\b[^>]*>[\s\S]*?<\/foreignObject>/giu, '')
  const validSvg = /^\s*(?:<\?xml[^>]*>\s*)?<svg[\s>]/iu.test(svg)
  const unsafeMatch = svg.match(/<script\b|<foreignObject\b|\b(?:href|src)=["']https?:/iu)
  if (!validSvg || unsafeMatch) throw new Error(`SVG hình minh họa ${index + 1} không hợp lệ.`)
  const raw = new TextEncoder().encode(svg)
  const packed = await gzip(raw)
  return { encoding: 'gzip-base64', data: base64(packed), sha256: await sha256(raw), bytes: raw.length }
}

async function compileProject(project, onProgress) {
  const requestId = crypto.randomUUID()
  const worker = new Worker(new URL('./compiler.worker.js', import.meta.url), { type: 'module' })
  return await new Promise((resolve, reject) => {
    const cleanup = () => worker.terminate()
    worker.onmessage = event => {
      const message = event.data || {}
      if (message.requestId !== requestId) return
      if (message.type === 'publisher-progress') onProgress?.(message)
      if (message.type === 'publisher-error') {
        cleanup()
        const detail = message.error?.message || 'Không thể phân tích nguồn Typst.'
        if (/outside of project root|access denied/iu.test(detail)) {
          reject(new Error('File đề đang dùng ảnh, dữ liệu hoặc module nằm bên ngoài nguồn đã chọn. Hãy bấm “Đổi thư mục” và chọn thư mục cha chứa đầy đủ file đề cùng các file phụ.'))
        } else {
          reject(new Error(detail))
        }
      }
      if (message.type === 'publisher-compiled') {
        cleanup()
        resolve(message)
      }
    }
    worker.onerror = event => {
      cleanup()
      reject(new Error(event.message || 'Compiler Typst gặp lỗi.'))
    }
    worker.postMessage({ type: 'publish-typst', requestId, files: project.files, entryPath: project.entryPath })
  })
}

async function projectHash(project) {
  const chunks = []
  for (const path of Object.keys(project.files).sort()) {
    const file = project.files[path]
    chunks.push(path, '\0')
    if (file.kind === 'binary') chunks.push(bytesToHex(file.content instanceof Uint8Array ? file.content : new Uint8Array(file.content || [])))
    else chunks.push(String(file.content || ''))
    chunks.push('\0')
  }
  return sha256(chunks.join(''))
}

export async function publishTypstProject(project, { title, description = '', onProgress } = {}) {
  const sourceHash = await projectHash(project)
  const compiled = await compileProject(project, onProgress)
  const normalized = normalizeMetadata(compiled.metadata, sourceHash, compiled.webQuestions)
  const renderer = compiled.assetArtifacts.length ? await getRenderer() : null
  const assets = []
  for (let index = 0; index < compiled.assetArtifacts.length; index += 1) {
    onProgress?.({ phase: 'packing-assets', completed: index, total: compiled.assetArtifacts.length })
    assets.push(await packAsset(renderer, compiled.assetArtifacts[index], index))
  }
  const publicItems = []
  const answerKey = []

  for (let index = 0; index < normalized.questions.length; index += 1) {
    onProgress?.({ phase: 'structuring', completed: index, total: normalized.questions.length })
    const question = normalized.questions[index]
    const id = `${question.type}-${String(index + 1).padStart(3, '0')}-${(await sha256(question.itemSeed)).slice(0, 12)}`
    const publicItem = {
      id, type: question.type, position: index + 1, points: question.points,
      questionText: encodeStructuredContent([question.stemSource, question.figureSource], assets),
      stemText: question.stemText,
    }
    if (question.section) publicItem.section = question.section
    const key = { id, sourceId: question.sourceId, type: question.type, points: question.points }
    if (question.type === 'tn') {
      publicItem.options = question.options.map(option => ({
        id: option.id, label: option.label,
        content: encodeStructuredContent(option.contentSource, assets),
      }))
      key.answer = question.answer
      key.optionOrder = question.options.map(option => option.id)
    } else if (question.type === 'ds') {
      publicItem.statements = question.statements.map(statement => ({
        id: statement.id, label: statement.label,
        content: encodeStructuredContent(statement.contentSource, assets),
      }))
      key.answer = question.answer
      key.statementOrder = question.statements.map(statement => statement.id)
    } else if (question.type === 'tln') {
      key.answer = question.acceptedAnswers[0]
      key.acceptedAnswers = question.acceptedAnswers
      key.tolerance = question.tolerance
    } else {
      key.rubric = question.rubric
    }
    if (question.solutionSource) key.solution = encodeStructuredContent(question.solutionSource, assets)
    publicItems.push(publicItem)
    answerKey.push(key)
  }

  onProgress?.({ phase: 'done', completed: normalized.questions.length, total: normalized.questions.length })
  return {
    value: {
      schemaVersion: 'conic-exam-package/v1',
      title: String(title || project.name || 'Đề Typst').trim().slice(0, 200),
      description: String(description || '').trim().slice(0, 2000),
      sourceId: project.entryPath.replace(/^\/project\//, ''),
      sourceHash,
      version: '1',
      publicItems,
      answerKey,
      warnings: normalized.warnings,
      compiler: { name: 'typst.ts', version: VERSION },
    },
    counts: normalized.counts,
    warnings: normalized.warnings,
    adapter: compiled.adapter,
    elapsedMs: compiled.elapsedMs,
  }
}

// Test hook chỉ tồn tại trên localhost; production không phơi compiler ra global.
if (typeof window !== 'undefined' && ['127.0.0.1', 'localhost'].includes(window.location.hostname)) {
  window.__CONIC_PUBLISH_TYPST__ = publishTypstProject
}
