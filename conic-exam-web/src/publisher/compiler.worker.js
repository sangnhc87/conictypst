import { createTypstCompiler, FetchPackageRegistry, loadFonts } from '@myriaddreamin/typst.ts/dist/esm/main.mjs'
import { MemoryAccessModel } from '@myriaddreamin/typst.ts/dist/esm/fs/memory.mjs'
import { withAccessModel, withPackageRegistry } from '@myriaddreamin/typst.ts/dist/esm/options.init.mjs'
import lib from '../../../typst-pkg-sang-math/lib.typ?raw'
import bbt from '../../../typst-pkg-sang-math/bbt.typ?raw'
import sangExam from '../../../typst-pkg-sang-math/sang-exam.typ?raw'
import examTemplates from '../../../typst-pkg-sang-math/exam-templates.typ?raw'
import bookTemplates from '../../../typst-pkg-sang-math/book-templates.typ?raw'
import mathSym from '../../../typst-pkg-sang-math/math-sym.typ?raw'
import geometry from '../../../typst-pkg-sang-math/geometry.typ?raw'
import colors from '../../../typst-pkg-sang-math/core/colors.typ?raw'
import mathUtils from '../../../typst-pkg-sang-math/core/math-utils.typ?raw'
import conics from '../../../typst-pkg-sang-math/geometry-2d/conics.typ?raw'
import revolution from '../../../typst-pkg-sang-math/geometry-3d/revolution.typ?raw'
import curves3d from '../../../typst-pkg-sang-math/geometry-3d/curves-3d.typ?raw'
import printLayouts from '../../../typst-pkg-sang-math/print-layouts.typ?raw'
import packageManifest from '../../../typst-pkg-sang-math/typst.toml?raw'
import legacyTemplate from '../../../typst/template.typ?raw'
import legacySangExam from '../../../typst/sang-exam.typ?raw'
import legacyBbt from '../../../typst/bbt.typ?raw'
import legacyMathSym from '../../../typst/math-sym.typ?raw'
import legacySharedConfig from '../../../typst/modules/_shared-config.typ?raw'
import legacyBank from '../../../typst/modules/bank.typ?raw'
import legacyBook from '../../../typst/modules/book.typ?raw'
import legacyExamSet from '../../../typst/modules/exam-set.typ?raw'
import legacyExam from '../../../typst/modules/exam.typ?raw'
import legacyFractals from '../../../typst/modules/fractals.typ?raw'
import legacyQuestionBank from '../../../typst/modules/question-bank.typ?raw'
import legacyResearch from '../../../typst/modules/research.typ?raw'
import { createCollectorSource, prepareEntrySource, rewriteBundledRuntimeImports } from './collector.js'

const VERSION = '0.7.0'
const PACKAGE_VERSION = '1.0.3'
const PACKAGE_ROOT = `/@memory/conic-exam/packages/preview/sang-math/${PACKAGE_VERSION}`
const LEGACY_PACKAGE_VERSION = '1.0.0'
const LEGACY_PACKAGE_ROOT = `/@memory/conic-exam/packages/preview/conic-runtime/${LEGACY_PACKAGE_VERSION}`
const WRAPPER_PATH = '/publisher.typ'
const PACKAGE_FILES = {
  'typst.toml': packageManifest,
  'lib.typ': lib,
  'bbt.typ': bbt,
  'sang-exam.typ': sangExam,
  'exam-templates.typ': examTemplates,
  'book-templates.typ': bookTemplates,
  'print-layouts.typ': printLayouts,
  'math-sym.typ': mathSym,
  'geometry.typ': geometry,
  'core/colors.typ': colors,
  'core/math-utils.typ': mathUtils,
  'geometry-2d/conics.typ': conics,
  'geometry-3d/revolution.typ': revolution,
  'geometry-3d/curves-3d.typ': curves3d,
}
const LEGACY_PACKAGE_FILES = {
  'typst.toml': `[package]\nname = "conic-runtime"\nversion = "${LEGACY_PACKAGE_VERSION}"\nentrypoint = "lib.typ"\n`,
  'lib.typ': legacyTemplate,
  'sang-exam.typ': legacySangExam,
  'bbt.typ': legacyBbt,
  'math-sym.typ': legacyMathSym,
  'modules/_shared-config.typ': legacySharedConfig,
  'modules/bank.typ': legacyBank,
  'modules/book.typ': legacyBook,
  'modules/exam-set.typ': legacyExamSet,
  'modules/exam.typ': legacyExam,
  'modules/fractals.typ': legacyFractals,
  'modules/question-bank.typ': legacyQuestionBank,
  'modules/research.typ': legacyResearch,
}
const FONT_BASE = 'https://cdn.jsdelivr.net/gh/typst/typst-assets@v0.13.1/files/fonts/'
const FONT_FILES = [
  'DejaVuSansMono-Bold.ttf', 'DejaVuSansMono-BoldOblique.ttf', 'DejaVuSansMono-Oblique.ttf', 'DejaVuSansMono.ttf',
  'LibertinusSerif-Bold.otf', 'LibertinusSerif-BoldItalic.otf', 'LibertinusSerif-Italic.otf',
  'LibertinusSerif-Regular.otf', 'LibertinusSerif-Semibold.otf', 'LibertinusSerif-SemiboldItalic.otf',
  'NewCM10-Bold.otf', 'NewCM10-BoldItalic.otf', 'NewCM10-Italic.otf', 'NewCM10-Regular.otf',
  'NewCMMath-Bold.otf', 'NewCMMath-Book.otf', 'NewCMMath-Regular.otf',
]

let compilerPromise

class ExamPackageRegistry {
  constructor(accessModel) {
    this.accessModel = accessModel
    this.fallback = new FetchPackageRegistry(accessModel)
    this.install()
  }

  install() {
    const modifiedAt = new Date(0)
    for (const [path, source] of Object.entries(PACKAGE_FILES)) {
      this.accessModel.insertFile(`${PACKAGE_ROOT}/${path}`, new TextEncoder().encode(source), modifiedAt)
    }
    for (const [path, source] of Object.entries(LEGACY_PACKAGE_FILES)) {
      this.accessModel.insertFile(`${LEGACY_PACKAGE_ROOT}/${path}`, new TextEncoder().encode(source), modifiedAt)
    }
  }

  resolve(spec, context) {
    if (spec?.namespace === 'preview' && spec?.name === 'sang-math' && String(spec?.version) === PACKAGE_VERSION) {
      this.install()
      return PACKAGE_ROOT
    }
    if (spec?.namespace === 'preview' && spec?.name === 'conic-runtime' && String(spec?.version) === LEGACY_PACKAGE_VERSION) {
      this.install()
      return LEGACY_PACKAGE_ROOT
    }
    return this.fallback.resolve(spec, context)
  }
}

async function fetchBytes(url) {
  const response = await fetch(url)
  if (!response.ok) throw new Error(`Không tải được runtime: HTTP ${response.status}`)
  return new Uint8Array(await response.arrayBuffer())
}

async function getCompiler() {
  if (compilerPromise) return compilerPromise
  compilerPromise = (async () => {
    const accessModel = new MemoryAccessModel()
    const registry = new ExamPackageRegistry(accessModel)
    const [part0, part1, fonts] = await Promise.all([
      fetchBytes(`/runtime/typst-compiler-${VERSION}.part0.bin`),
      fetchBytes(`/runtime/typst-compiler-${VERSION}.part1.bin`),
      Promise.all(FONT_FILES.map(file => fetchBytes(`${FONT_BASE}${file}`))),
    ])
    const module = new Uint8Array(part0.length + part1.length)
    module.set(part0)
    module.set(part1, part0.length)
    const instance = createTypstCompiler()
    await instance.init({
      getModule: () => module.buffer,
      beforeBuild: [
        withAccessModel(accessModel),
        withPackageRegistry(registry),
        loadFonts(fonts, { assets: false }),
      ],
    })
    return instance
  })()
  return compilerPromise
}

function normalizePackageImports(source) {
  return rewriteBundledRuntimeImports(String(source), PACKAGE_VERSION)
    .replace(
      /(^\s*#import\s+")@(?:preview|local)\/sang-math:\d+\.\d+\.\d+(".*$)/gmu,
      `$1@preview/sang-math:${PACKAGE_VERSION}$2`,
    )
    .replace(
      /(^\s*#import\s+")(?:\.\.?\/)*template\.typ(".*$)/gmu,
      `$1@preview/conic-runtime:${LEGACY_PACKAGE_VERSION}$2`,
    )
}

function diagnostics(items = []) {
  return items.map(item => ({
    severity: item?.severity || 'error',
    message: item?.message || 'Lỗi Typst không xác định',
    hints: Array.isArray(item?.hints) ? item.hints.map(String) : [],
    file: item?.span?.file || item?.file || item?.path || '',
  }))
}

async function loadProject(instance, files, entryPath) {
  await instance.reset()
  for (const [path, raw] of Object.entries(files || {})) {
    if (raw?.kind === 'binary') {
      const bytes = raw.content instanceof Uint8Array ? raw.content : new Uint8Array(raw.content || [])
      instance.mapShadow(path, bytes)
    } else {
      instance.addSource(path, normalizePackageImports(raw?.content || raw || ''))
    }
  }
  const entry = files?.[entryPath]
  if (!entry || entry.kind !== 'text') throw new Error('File chính không tồn tại hoặc không phải văn bản Typst.')
  const prepared = prepareEntrySource(normalizePackageImports(entry.content))
  instance.addSource(entryPath, prepared.source)
  instance.addSource(WRAPPER_PATH, createCollectorSource({
    sourceImport: entryPath,
    questionFactory: prepared.factory,
    rendererImport: `@preview/sang-math:${PACKAGE_VERSION}`,
  }))
  return prepared
}

async function publish(request) {
  const startedAt = performance.now()
  const instance = await getCompiler()
  const prepared = await loadProject(instance, request.files, request.entryPath)
  self.postMessage({ type: 'publisher-progress', requestId: request.requestId, phase: 'analyzing', completed: 0, total: 1 })
  const inputs = { 'conic-output': 'metadata', 'conic-publisher': '1', beamer: '1' }
  const metadata = await instance.runWithWorld(
    { mainFilePath: WRAPPER_PATH, inputs, root: '/' },
    async world => {
      const compiled = await world.compile({ diagnostics: 'full' })
      if (compiled?.diagnostics?.some(item => item?.severity === 'error')) {
        const detail = diagnostics(compiled.diagnostics)
        throw new Error(detail.map(item => `[${item.file}] ${item.message} (${item.hints.join(', ')})`).join('\n'))
      }
      return world.query({ selector: '<conic-export-node>', field: 'value' })
    },
  )
  const questions = metadata.filter(node => node?.kind === 'question')
  if (!questions.length) throw new Error('Không tìm thấy câu hỏi #tn, #ds, #tln hoặc #tl trong file đã chọn.')
  if (questions.length > 200) throw new Error('Một đề tối đa 200 câu hỏi.')

  if (prepared.webQuestions.length !== questions.length) {
    throw new Error(`Bộ tách web tìm thấy ${prepared.webQuestions.length} câu nhưng Typst biên dịch thành ${questions.length} câu.`)
  }

  const assetArtifacts = []
  for (let index = 0; index < prepared.assets.length; index += 1) {
    self.postMessage({
      type: 'publisher-progress', requestId: request.requestId, phase: 'rendering-assets',
      completed: index, total: prepared.assets.length,
    })
    try {
      const inputs = {
        'conic-output': 'asset',
        'conic-publisher': '1',
        'conic-question-index': String(index),
        beamer: '1',
      }
      const compiled = await instance.runWithWorld(
        { mainFilePath: WRAPPER_PATH, inputs, root: '/' },
        async world => world.compile({ diagnostics: 'full' })
      )
      if (!compiled?.result) {
        const detail = diagnostics(compiled?.diagnostics)
        throw new Error(detail.map(item => item.message).join('\n') || `Không render được hình minh họa ${index + 1}.`)
      }
      const bytes = compiled.result instanceof Uint8Array ? compiled.result : new Uint8Array(compiled.result)
      assetArtifacts.push(bytes)
    } catch (e) {
      throw new Error(`Asset ${index} failed: ${e.message}`)
    }
  }
  self.postMessage({
    type: 'publisher-compiled',
    requestId: request.requestId,
    metadata,
    webQuestions: prepared.webQuestions,
    assetArtifacts,
    adapter: prepared.mode,
    elapsedMs: Math.round(performance.now() - startedAt),
  }, assetArtifacts.map(item => item.buffer))
}

self.onmessage = event => {
  const request = event.data || {}
  if (request.type !== 'publish-typst') return
  publish(request).catch(error => {
    console.error('[Worker Error]', error)
    self.postMessage({
      type: 'publisher-error', requestId: request.requestId,
      error: { message: error?.message || String(error), stack: error?.stack || '' },
    })
  })
}
