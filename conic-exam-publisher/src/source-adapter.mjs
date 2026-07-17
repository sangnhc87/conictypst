import fs from 'node:fs/promises'
import os from 'node:os'
import path from 'node:path'

export const QUESTIONS_START = '// === CONICTYPST:QUESTIONS:START ==='
export const QUESTIONS_END = '// === CONICTYPST:QUESTIONS:END ==='

function normalizeRelative(root, file) {
  const relative = path.relative(root, file)
  if (!relative || relative.startsWith('..') || path.isAbsolute(relative)) {
    throw new TypeError('Tệp nguồn phải nằm bên trong --root.')
  }
  return relative
}

function countOccurrences(text, needle) {
  let count = 0
  let offset = 0
  while ((offset = text.indexOf(needle, offset)) >= 0) {
    count += 1
    offset += needle.length
  }
  return count
}

export function extractHubQuestionBody(source) {
  const startCount = countOccurrences(source, QUESTIONS_START)
  const endCount = countOccurrences(source, QUESTIONS_END)
  if (startCount !== 1 || endCount !== 1) {
    throw new TypeError(`Nguồn Hub phải có đúng một cặp marker câu hỏi; nhận ${startCount} marker đầu và ${endCount} marker cuối.`)
  }
  const start = source.indexOf(QUESTIONS_START)
  const end = source.indexOf(QUESTIONS_END)
  if (end <= start) throw new TypeError('Marker kết thúc câu hỏi đứng trước marker bắt đầu.')
  const afterStart = start + QUESTIONS_START.length
  const startLineEnd = source.indexOf('\n', afterStart)
  if (startLineEnd >= 0 && source.slice(afterStart, startLineEnd).trim()) {
    throw new TypeError('Không được đặt mã Typst cùng dòng với marker QUESTIONS:START.')
  }
  const endLineStart = source.lastIndexOf('\n', end)
  if (endLineStart >= 0 && source.slice(endLineStart + 1, end).trim()) {
    throw new TypeError('Marker QUESTIONS:END phải nằm trên dòng riêng.')
  }
  return {
    start,
    end: end + QUESTIONS_END.length,
    body: source.slice(afterStart, end).trim(),
  }
}

export function transformHubSource(source) {
  const region = extractHubQuestionBody(source)
  if (source.includes('conic-publisher-questions')) {
    throw new TypeError('Nguồn đã chứa tên dành riêng conic-publisher-questions.')
  }
  const replacement = `#let conic-publisher-questions(
  tn: tn,
  ds: ds,
  tln: tln,
  tl: tl,
  exam-part: exam-part,
) = [
${region.body}
]

#if sys.inputs.at("conic-publisher", default: "0") != "1" {
  conic-publisher-questions()
}`
  return `${source.slice(0, region.start)}${replacement}${source.slice(region.end)}`
}

const SKIP_NAMES = new Set(['.git', 'node_modules', 'dist', 'dist-hub', '.sample-build', 'conic-exam-build'])

async function copyTree(sourceRoot, targetRoot, state) {
  const entries = await fs.readdir(sourceRoot, { withFileTypes: true })
  await fs.mkdir(targetRoot, { recursive: true })
  for (const entry of entries) {
    if (SKIP_NAMES.has(entry.name)) continue
    const from = path.join(sourceRoot, entry.name)
    const to = path.join(targetRoot, entry.name)
    if (entry.isSymbolicLink()) throw new TypeError(`Không nhận symlink trong project Hub: ${from}`)
    if (entry.isDirectory()) {
      await copyTree(from, to, state)
      continue
    }
    if (!entry.isFile()) continue
    const stat = await fs.stat(from)
    state.files += 1
    state.bytes += stat.size
    if (state.files > 5000) throw new TypeError('Project Hub vượt quá 5.000 tệp.')
    if (state.bytes > 100 * 1024 * 1024) throw new TypeError('Project Hub vượt quá 100 MiB.')
    await fs.copyFile(from, to)
  }
}

function typstRootPath(relative) {
  return `/${relative.split(path.sep).join('/')}`
}

function resolveRendererSpec(spec, sourceText, sourcePath, root) {
  const explicit = Boolean(spec)
  let value = spec
  if (!value) {
    const packageMatch = sourceText.match(/#import\s+"(@(?:preview|local)\/sang-math:[^"]+)"/u)
    const fileMatch = sourceText.match(/#import\s+"([^"]*(?:sang-exam|lib)\.typ)"/u)
    value = packageMatch?.[1] || fileMatch?.[1] || null
  }
  if (!value) throw new TypeError('Không tìm thấy renderer Sang-Math; hãy truyền --renderer.')
  if (value.startsWith('@')) return value
  const absolute = path.isAbsolute(value)
    ? path.resolve(root, `.${value}`)
    : path.resolve(explicit ? root : path.dirname(sourcePath), value)
  return typstRootPath(normalizeRelative(root, absolute))
}

export async function prepareSource({ sourcePath, root, mode = 'auto', renderer = null }) {
  const sourceText = await fs.readFile(sourcePath, 'utf8')
  const hasMarkers = sourceText.includes(QUESTIONS_START) || sourceText.includes(QUESTIONS_END)
  const selectedMode = mode === 'auto' ? (hasMarkers ? 'hub' : 'legacy') : mode
  if (selectedMode === 'legacy') {
    const relative = normalizeRelative(root, sourcePath)
    return {
      mode: selectedMode,
      compileRoot: root,
      sourceImport: typstRootPath(relative),
      questionFactory: 'make-questions',
      rendererImport: resolveRendererSpec(renderer, sourceText, sourcePath, root),
      sourceText,
      cleanup: async () => {},
    }
  }

  const transformed = transformHubSource(sourceText)
  const temporaryRoot = await fs.mkdtemp(path.join(os.tmpdir(), 'conic-exam-source-'))
  try {
    await copyTree(root, temporaryRoot, { files: 0, bytes: 0 })
    const relative = normalizeRelative(root, sourcePath)
    const mirroredSource = path.join(temporaryRoot, relative)
    await fs.writeFile(mirroredSource, transformed, 'utf8')
    return {
      mode: selectedMode,
      compileRoot: temporaryRoot,
      sourceImport: typstRootPath(relative),
      questionFactory: 'conic-publisher-questions',
      rendererImport: resolveRendererSpec(renderer, sourceText, sourcePath, root),
      sourceText,
      cleanup: async () => fs.rm(temporaryRoot, { recursive: true, force: true }),
    }
  } catch (error) {
    await fs.rm(temporaryRoot, { recursive: true, force: true })
    throw error
  }
}
