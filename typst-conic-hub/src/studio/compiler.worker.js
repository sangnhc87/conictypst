import {
  createTypstCompiler,
  loadFonts,
} from '@myriaddreamin/typst.ts/dist/esm/main.mjs'
import { MemoryAccessModel } from '@myriaddreamin/typst.ts/dist/esm/fs/memory.mjs'
import {
  withAccessModel,
  withPackageRegistry,
} from '@myriaddreamin/typst.ts/dist/esm/options.init.mjs'
import {
  SANG_MATH_FILES,
  SANG_MATH_PACKAGE_FILES,
  SANG_MATH_VERSION,
} from './packageFiles.js'
import { StudioPackageRegistry } from './packageRegistry.js'

const TYPST_TS_VERSION = '0.7.0-rc2'
const COMPILER_WASM_PARTS = [
  `/runtime/typst-compiler-${TYPST_TS_VERSION}.part0.bin`,
  `/runtime/typst-compiler-${TYPST_TS_VERSION}.part1.bin`,
]
const FONT_BASE_URL = 'https://cdn.jsdelivr.net/gh/typst/typst-assets@v0.13.1/files/fonts/'
const TEXT_FONT_FILES = [
  'DejaVuSansMono-Bold.ttf',
  'DejaVuSansMono-BoldOblique.ttf',
  'DejaVuSansMono-Oblique.ttf',
  'DejaVuSansMono.ttf',
  'LibertinusSerif-Bold.otf',
  'LibertinusSerif-BoldItalic.otf',
  'LibertinusSerif-Italic.otf',
  'LibertinusSerif-Regular.otf',
  'LibertinusSerif-Semibold.otf',
  'LibertinusSerif-SemiboldItalic.otf',
  'NewCM10-Bold.otf',
  'NewCM10-BoldItalic.otf',
  'NewCM10-Italic.otf',
  'NewCM10-Regular.otf',
  'NewCMMath-Bold.otf',
  'NewCMMath-Book.otf',
  'NewCMMath-Regular.otf',
]

let compilerPromise = null
let compiler = null
let packageRegistry = null
let currentFiles = new Map()

function normalizeDiagnostics(diagnostics = []) {
  return diagnostics.map(item => ({
    severity: item?.severity || 'error',
    message: item?.message || 'Lỗi Typst không xác định',
    hints: Array.isArray(item?.hints) ? item.hints.map(String) : [],
    file: item?.span?.file || item?.file || '',
    start: item?.span?.start || item?.start || null,
    end: item?.span?.end || item?.end || null,
  }))
}

function serializeError(error) {
  return {
    message: error?.message || String(error),
    stack: error?.stack || '',
  }
}

function addBuiltInPackage(targetCompiler) {
  for (const [path, content] of Object.entries(SANG_MATH_FILES)) {
    targetCompiler.addSource(path, content)
  }
}

async function fetchTextFonts() {
  // typst.ts mặc định tải tuần tự. Tải song song giúp lần mở Studio đầu tiên
  // không phải chờ từng font một, còn trình duyệt vẫn tự cache cho lần sau.
  return Promise.all(TEXT_FONT_FILES.map(async fileName => {
    const response = await fetch(`${FONT_BASE_URL}${fileName}`)
    if (!response.ok) throw new Error(`Không tải được font ${fileName}: HTTP ${response.status}`)
    return new Uint8Array(await response.arrayBuffer())
  }))
}

async function fetchCompilerModule() {
  const parts = await Promise.all(COMPILER_WASM_PARTS.map(async url => {
    const response = await fetch(url)
    if (!response.ok) throw new Error(`Không tải được trình biên dịch Typst: HTTP ${response.status}`)
    return new Uint8Array(await response.arrayBuffer())
  }))
  const module = new Uint8Array(parts.reduce((total, part) => total + part.length, 0))
  let offset = 0
  for (const part of parts) {
    module.set(part, offset)
    offset += part.length
  }
  return module.buffer
}

async function getCompiler() {
  if (compilerPromise) return compilerPromise
  compilerPromise = (async () => {
    const accessModel = new MemoryAccessModel()
    const instance = createTypstCompiler()
    // Khởi động hai lượt tải nặng cùng lúc thay vì chờ WASM xong mới tải font.
    const fontsPromise = fetchTextFonts()
    const modulePromise = fetchCompilerModule()
    const fonts = await fontsPromise
    packageRegistry = new StudioPackageRegistry(accessModel, SANG_MATH_PACKAGE_FILES)
    await instance.init({
      getModule: () => modulePromise,
      beforeBuild: [
        withAccessModel(accessModel),
        withPackageRegistry(packageRegistry),
        loadFonts(fonts, { assets: false }),
      ],
    })
    compiler = instance
    addBuiltInPackage(instance)
    return instance
  })()
  return compilerPromise
}

function fileSignature(file) {
  if (file.kind === 'binary') {
    const bytes = file.content instanceof Uint8Array ? file.content : new Uint8Array(file.content || [])
    let sample = 0
    const stride = Math.max(1, Math.floor(bytes.length / 64))
    for (let index = 0; index < bytes.length; index += stride) sample = (sample * 31 + bytes[index]) >>> 0
    return `binary:${bytes.length}:${sample}`
  }
  return `text:${file.content}`
}

async function resetCompiler(instance) {
  await instance.reset()
  packageRegistry?.installBundledPackage()
  addBuiltInPackage(instance)
  currentFiles = new Map()
}

async function syncProjectFiles(instance, files, forceReset = false) {
  const nextPaths = new Set(Object.keys(files))
  const removedPaths = [...currentFiles.keys()].filter(path => !nextPaths.has(path))
  if (forceReset || removedPaths.length > 0) await resetCompiler(instance)

  for (const [path, rawFile] of Object.entries(files)) {
    const file = rawFile?.kind ? rawFile : { kind: 'text', content: String(rawFile ?? '') }
    const signature = fileSignature(file)
    if (currentFiles.get(path) === signature) continue

    if (file.kind === 'binary') {
      const bytes = file.content instanceof Uint8Array ? file.content : new Uint8Array(file.content || [])
      instance.mapShadow(path, bytes)
    } else {
      instance.addSource(path, String(file.content ?? ''))
    }
    currentFiles.set(path, signature)
  }
}

async function handleCompile(message) {
  const startedAt = performance.now()
  const instance = await getCompiler()
  await syncProjectFiles(instance, message.files || {}, Boolean(message.forceReset))

  const result = await instance.compile({
    mainFilePath: message.entryPath,
    inputs: message.format !== 'pdf'
      ? { 'sang-math-canvas-compat': '1' }
      : undefined,
    format: message.format === 'pdf' ? 1 : 0,
    diagnostics: 'full',
  })

  const artifact = result?.result
  if (!artifact) {
    self.postMessage({
      type: 'compile-result',
      requestId: message.requestId,
      format: message.format,
      diagnostics: normalizeDiagnostics(result?.diagnostics),
      elapsedMs: Math.round(performance.now() - startedAt),
    })
    return
  }

  const bytes = artifact instanceof Uint8Array ? artifact : new Uint8Array(artifact)
  self.postMessage({
    type: 'compile-result',
    requestId: message.requestId,
    format: message.format,
    artifact: bytes,
    diagnostics: normalizeDiagnostics(result?.diagnostics),
    elapsedMs: Math.round(performance.now() - startedAt),
  }, [bytes.buffer])
}

self.onmessage = async event => {
  const message = event.data || {}
  try {
    if (message.type === 'init') {
      const startedAt = performance.now()
      await getCompiler()
      self.postMessage({
        type: 'ready',
        runtime: `typst.ts ${TYPST_TS_VERSION}`,
        packageVersion: SANG_MATH_VERSION,
        elapsedMs: Math.round(performance.now() - startedAt),
      })
      return
    }

    if (message.type === 'compile') await handleCompile(message)
    if (message.type === 'reset' && compiler) await resetCompiler(compiler)
  } catch (error) {
    self.postMessage({
      type: 'worker-error',
      requestId: message.requestId,
      error: serializeError(error),
    })
  }
}
