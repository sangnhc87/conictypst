import { createRequire } from 'node:module'
import fs from 'node:fs/promises'
import os from 'node:os'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { gzipSync } from 'node:zlib'
import { assemblePackage, normalizeMetadata, sha256 } from './package-builder.mjs'
import { runProcess } from './process.mjs'
import { prepareSource } from './source-adapter.mjs'
import { createCollectorWrapper } from './typst-wrapper.mjs'

const require = createRequire(import.meta.url)
const OUTPUT_MARKER = '.conic-exam-publisher-output'

async function ensureOutputDirectory(outputDirectory) {
  try {
    const entries = await fs.readdir(outputDirectory)
    if (entries.length && !entries.includes(OUTPUT_MARKER)) {
      throw new TypeError(`Thư mục output đã có dữ liệu và không thuộc Publisher: ${outputDirectory}`)
    }
  } catch (error) {
    if (error.code !== 'ENOENT') throw error
  }
  await fs.mkdir(outputDirectory, { recursive: true })
  await fs.writeFile(path.join(outputDirectory, OUTPUT_MARKER), 'conic-exam-publisher/v1\n', 'utf8')
  await fs.rm(path.join(outputDirectory, 'assets'), { recursive: true, force: true })
  await fs.mkdir(path.join(outputDirectory, 'assets', 'questions'), { recursive: true })
  await fs.mkdir(path.join(outputDirectory, 'assets', 'solutions'), { recursive: true })
}

function typstCommonArgs(options, root) {
  const args = ['--root', root, '--creation-timestamp', String(options.creationTimestamp)]
  for (const fontPath of options.fontPaths) args.push('--font-path', fontPath)
  if (options.packagePath) args.push('--package-path', options.packagePath)
  return args
}

async function queryMetadata(options, prepared, wrapper) {
  const args = [
    'query',
    ...typstCommonArgs(options, prepared.compileRoot),
    '--input', 'conic-output=metadata',
    '--input', 'conic-publisher=1',
    '--input', 'beamer=1',
    '-',
    '<conic-export-node>',
    '--field', 'value',
  ]
  const result = await runProcess(options.typstCommand, args, {
    cwd: prepared.compileRoot,
    input: wrapper,
    timeoutMs: options.timeoutMs,
  })
  try {
    return JSON.parse(result.stdout)
  } catch (error) {
    throw new TypeError(`typst query không trả JSON hợp lệ: ${error.message}`)
  }
}

async function compilePages(options, prepared, wrapper, workDirectory, mode) {
  const pattern = path.join(workDirectory, `${mode}-{p}.svg`)
  const args = [
    'compile',
    ...typstCommonArgs(options, prepared.compileRoot),
    '--input', `conic-output=${mode}`,
    '--input', 'conic-publisher=1',
    '--input', 'beamer=1',
    '-',
    pattern,
  ]
  await runProcess(options.typstCommand, args, {
    cwd: prepared.compileRoot,
    input: wrapper,
    timeoutMs: options.timeoutMs,
    maxOutputBytes: 8 * 1024 * 1024,
  })
  const entries = await fs.readdir(workDirectory)
  return entries
    .map(name => ({ name, match: name.match(new RegExp(`^${mode}-(\\d+)\\.svg$`, 'u')) }))
    .filter(entry => entry.match)
    .sort((left, right) => Number(left.match[1]) - Number(right.match[1]))
    .map(entry => path.join(workDirectory, entry.name))
}

async function assetFromFile(file, id, scope, outputFile) {
  const raw = await fs.readFile(file)
  const content = raw.toString('utf8')
  if (!Buffer.from(content, 'utf8').equals(raw)) throw new TypeError(`SVG không phải UTF-8 hợp lệ: ${file}`)
  if (!/^<svg[\s>]/u.test(content.trimStart())) throw new TypeError(`Typst không tạo SVG hợp lệ: ${file}`)
  if (/<script\b|<foreignObject\b|\b(?:href|src)=["']https?:/iu.test(content)) {
    throw new TypeError(`SVG chứa nội dung chủ động hoặc tham chiếu mạng: ${file}`)
  }
  await fs.writeFile(outputFile, content, 'utf8')
  const compressed = gzipSync(raw, { level: 9, mtime: 0 })
  return {
    id,
    scope,
    mimeType: 'image/svg+xml',
    sha256: sha256(raw),
    bytes: raw.length,
    gzipBase64: compressed.toString('base64'),
    compressedBytes: compressed.length,
    content,
  }
}

async function loadBackendValidator() {
  const here = path.dirname(fileURLToPath(import.meta.url))
  const validatorPath = path.resolve(here, '../../conictypst-platform/functions/lib/examValidation.js')
  try {
    await fs.access(validatorPath)
    return require(validatorPath).normalizePackage
  } catch (error) {
    if (error.code === 'ENOENT' || error.code === 'MODULE_NOT_FOUND') return null
    throw error
  }
}

function publicProjection(packageValue, normalized) {
  const assets = Object.fromEntries(Object.entries(packageValue.assets).filter(([, asset]) => asset.scope === 'public'))
  return {
    schemaVersion: 'conic-exam-public/v1',
    contentHash: packageValue.contentHash,
    buildHash: packageValue.buildHash,
    ...normalized.publicPackage,
    assets,
  }
}

function privateProjection(packageValue, normalized) {
  const assets = Object.fromEntries(Object.entries(packageValue.assets).filter(([, asset]) => asset.scope === 'private'))
  return {
    schemaVersion: 'conic-exam-private/v1',
    contentHash: packageValue.contentHash,
    buildHash: packageValue.buildHash,
    ...normalized.privatePackage,
    assets,
  }
}

export async function publishExam(options) {
  if (!Number.isFinite(options.timeoutMs) || options.timeoutMs < 1000 || options.timeoutMs > 600000) {
    throw new TypeError('timeoutMs phải từ 1000 đến 600000.')
  }
  const sourceBytes = await fs.readFile(options.sourcePath)
  const sourceHash = sha256(sourceBytes)
  const prepared = await prepareSource(options)
  const workDirectory = await fs.mkdtemp(path.join(os.tmpdir(), 'conic-exam-build-'))
  try {
    const wrapper = createCollectorWrapper(prepared)
    const metadata = await queryMetadata(options, prepared, wrapper)
    const normalizedMetadata = normalizeMetadata(metadata, {
      sourceHash,
      strict: options.strict,
      profile: options.profile,
    })
    const candidateFiles = await compilePages(options, prepared, wrapper, workDirectory, 'candidate')
    const reviewFiles = options.renderReview
      ? await compilePages(options, prepared, wrapper, workDirectory, 'review')
      : []
    if (candidateFiles.length !== normalizedMetadata.questions.length) {
      throw new TypeError(`Typst sinh ${candidateFiles.length} candidate SVG cho ${normalizedMetadata.questions.length} câu.`)
    }
    if (options.renderReview && reviewFiles.length !== normalizedMetadata.questions.length) {
      throw new TypeError(`Typst sinh ${reviewFiles.length} review SVG cho ${normalizedMetadata.questions.length} câu.`)
    }

    await ensureOutputDirectory(options.outputDirectory)
    const questionAssets = []
    const solutionAssets = []
    for (let index = 0; index < normalizedMetadata.questions.length; index += 1) {
      const question = normalizedMetadata.questions[index]
      const number = String(index + 1).padStart(3, '0')
      questionAssets.push(await assetFromFile(
        candidateFiles[index],
        `question-${question.itemId}`,
        'public',
        path.join(options.outputDirectory, 'assets', 'questions', `${number}.svg`),
      ))
      if (reviewFiles[index]) {
        solutionAssets.push(await assetFromFile(
          reviewFiles[index],
          `solution-${question.itemId}`,
          'private',
          path.join(options.outputDirectory, 'assets', 'solutions', `${number}.svg`),
        ))
      }
    }

    const versionResult = await runProcess(options.typstCommand, ['--version'], {
      cwd: prepared.compileRoot,
      timeoutMs: 10000,
      maxOutputBytes: 1024 * 1024,
    })
    const packageValue = assemblePackage({
      title: options.title,
      description: options.description,
      sourceId: options.sourceId,
      sourceHash,
      version: options.version,
      questions: normalizedMetadata.questions,
      questionAssets,
      solutionAssets,
      compilerVersion: versionResult.stdout.trim(),
      warnings: normalizedMetadata.warnings,
    })

    const normalizePackage = await loadBackendValidator()
    if (!normalizePackage) throw new TypeError('Không tìm thấy backend examValidation.normalizePackage để xác minh contract.')
    const backendNormalized = normalizePackage(packageValue)
    packageValue.contentHash = backendNormalized.contentHash
    packageValue.maximumScore = backendNormalized.maximumScore
    packageValue.questionCount = backendNormalized.questionCount
    packageValue.questionCounts = normalizedMetadata.counts

    const packageFile = path.join(options.outputDirectory, 'conic-exam-package.json')
    const publicFile = path.join(options.outputDirectory, 'public-package.json')
    const privateFile = path.join(options.outputDirectory, 'private-package.json')
    const backendPublicFile = path.join(options.outputDirectory, 'backend-public-package.json')
    const backendPrivateFile = path.join(options.outputDirectory, 'backend-private-package.json')
    const packageJson = `${JSON.stringify(packageValue, null, 2)}\n`
    await fs.writeFile(packageFile, packageJson, 'utf8')
    await fs.writeFile(publicFile, `${JSON.stringify(publicProjection(packageValue, backendNormalized), null, 2)}\n`, 'utf8')
    await fs.writeFile(privateFile, `${JSON.stringify(privateProjection(packageValue, backendNormalized), null, 2)}\n`, 'utf8')
    await fs.writeFile(backendPublicFile, `${JSON.stringify(backendNormalized.publicPackage, null, 2)}\n`, 'utf8')
    await fs.writeFile(backendPrivateFile, `${JSON.stringify(backendNormalized.privatePackage, null, 2)}\n`, 'utf8')
    await fs.writeFile(path.join(options.outputDirectory, 'diagnostics.json'), `${JSON.stringify({
      adapter: prepared.mode,
      strict: options.strict,
      profile: options.profile,
      sourceHash,
      buildHash: packageValue.buildHash,
      contentHash: packageValue.contentHash,
      questionCounts: normalizedMetadata.counts,
      maximumScore: backendNormalized.maximumScore,
      warnings: normalizedMetadata.warnings,
    }, null, 2)}\n`, 'utf8')

    return {
      outputDirectory: options.outputDirectory,
      packageFile,
      publicFile,
      privateFile,
      backendPublicFile,
      backendPrivateFile,
      questionCount: backendNormalized.questionCount,
      maximumScore: backendNormalized.maximumScore,
      embeddedBytes: Buffer.byteLength(packageJson, 'utf8'),
      backendPublicBytes: Buffer.byteLength(JSON.stringify(backendNormalized.publicPackage), 'utf8'),
      warnings: normalizedMetadata.warnings,
      packageValue,
    }
  } finally {
    await prepared.cleanup()
    await fs.rm(workDirectory, { recursive: true, force: true })
  }
}
