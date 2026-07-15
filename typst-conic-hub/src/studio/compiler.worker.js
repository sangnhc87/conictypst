import {
  createTypstCompiler,
  FetchPackageRegistry,
  loadFonts,
} from '@myriaddreamin/typst.ts/dist/esm/main.mjs'
import { MemoryAccessModel } from '@myriaddreamin/typst.ts/dist/esm/fs/memory.mjs'
import {
  withAccessModel,
  withPackageRegistry,
} from '@myriaddreamin/typst.ts/dist/esm/options.init.mjs'
import { SANG_MATH_FILES, SANG_MATH_VERSION } from './packageFiles.js'

const TYPST_TS_VERSION = '0.7.0-rc2'
const COMPILER_WASM_URL = `https://cdn.jsdelivr.net/npm/@myriaddreamin/typst-ts-web-compiler@${TYPST_TS_VERSION}/pkg/typst_ts_web_compiler_bg.wasm`

let compilerPromise = null
let compiler = null
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

async function getCompiler() {
  if (compilerPromise) return compilerPromise
  compilerPromise = (async () => {
    const accessModel = new MemoryAccessModel()
    const instance = createTypstCompiler()
    await instance.init({
      getModule: () => COMPILER_WASM_URL,
      beforeBuild: [
        withAccessModel(accessModel),
        withPackageRegistry(new FetchPackageRegistry(accessModel)),
        loadFonts([], { assets: ['text'] }),
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
