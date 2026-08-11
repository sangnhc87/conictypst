import {
  createTypstCompiler,
  loadFonts,
} from '@myriaddreamin/typst.ts/dist/esm/main.mjs'
import { MemoryAccessModel } from '@myriaddreamin/typst.ts/dist/esm/fs/memory.mjs'
import {
  withAccessModel,
  withPackageRegistry,
} from '@myriaddreamin/typst.ts/dist/esm/options.init.mjs'
import { FetchPackageRegistry } from '@myriaddreamin/typst.ts/dist/esm/main.mjs'
import compilerPart0 from '../../typst-conic-hub/public/runtime/typst-compiler-0.8.0-rc3.part0.bin?url'
import compilerPart1 from '../../typst-conic-hub/public/runtime/typst-compiler-0.8.0-rc3.part1.bin?url'
import { SANG_MATH_GRAPHICS_FILES, SANG_MATH_GRAPHICS_VERSION } from './packageFiles.js'

const TYPST_TS_VERSION = '0.8.0-rc3'
const PACKAGE_ROOT = `/@memory/bundled/packages/preview/sang-math-graphics/${SANG_MATH_GRAPHICS_VERSION}`
const FONT_BASE_URL = 'https://cdn.jsdelivr.net/gh/typst/typst-assets@v0.13.1/files/fonts/'
const FONT_FILES = [
  'DejaVuSansMono-Bold.ttf', 'DejaVuSansMono-BoldOblique.ttf', 'DejaVuSansMono-Oblique.ttf', 'DejaVuSansMono.ttf',
  'LibertinusSerif-Bold.otf', 'LibertinusSerif-BoldItalic.otf', 'LibertinusSerif-Italic.otf', 'LibertinusSerif-Regular.otf',
  'LibertinusSerif-Semibold.otf', 'LibertinusSerif-SemiboldItalic.otf', 'NewCM10-Bold.otf', 'NewCM10-BoldItalic.otf',
  'NewCM10-Italic.otf', 'NewCM10-Regular.otf', 'NewCMMath-Bold.otf', 'NewCMMath-Book.otf', 'NewCMMath-Regular.otf',
]

class GraphicsPackageRegistry {
  constructor(accessModel) {
    this.accessModel = accessModel
    this.fallback = new FetchPackageRegistry(accessModel)
    this.install()
  }

  install() {
    const modifiedAt = new Date(0)
    for (const [path, content] of Object.entries(SANG_MATH_GRAPHICS_FILES)) {
      this.accessModel.insertFile(`${PACKAGE_ROOT}/${path}`, new TextEncoder().encode(String(content)), modifiedAt)
    }
  }

  resolve(spec, context) {
    if (spec?.namespace === 'preview' && spec?.name === 'sang-math-graphics' && String(spec?.version || '') === SANG_MATH_GRAPHICS_VERSION) {
      this.install()
      return PACKAGE_ROOT
    }
    return this.fallback.resolve(spec, context)
  }
}

let compilerPromise
let compiler
let packageRegistry

function normalizeDiagnostics(diagnostics = []) {
  return diagnostics.map(item => ({
    severity: item?.severity || 'error',
    message: item?.message || 'Typst không xác định được lỗi.',
    hints: Array.isArray(item?.hints) ? item.hints.map(String) : [],
  }))
}

async function fetchBytes(url) {
  const response = await fetch(url)
  if (!response.ok) throw new Error(`Không tải được tài nguyên WASM/font: HTTP ${response.status}`)
  return new Uint8Array(await response.arrayBuffer())
}

async function fetchCompilerModule() {
  const parts = await Promise.all([fetchBytes(compilerPart0), fetchBytes(compilerPart1)])
  const module = new Uint8Array(parts[0].length + parts[1].length)
  module.set(parts[0], 0)
  module.set(parts[1], parts[0].length)
  return module.buffer
}

async function getCompiler() {
  if (compilerPromise) return compilerPromise
  compilerPromise = (async () => {
    const accessModel = new MemoryAccessModel()
    const instance = createTypstCompiler()
    self.postMessage({ type: 'progress', message: 'Đang tải compiler Typst WASM…' })
    const fontsPromise = Promise.all(FONT_FILES.map(file => fetchBytes(`${FONT_BASE_URL}${file}`)))
    const modulePromise = fetchCompilerModule()
    const fonts = await fontsPromise
    self.postMessage({ type: 'progress', message: 'Đã tải font · đang khởi tạo compiler…' })
    packageRegistry = new GraphicsPackageRegistry(accessModel)
    await instance.init({
      getModule: () => modulePromise,
      beforeBuild: [
        withAccessModel(accessModel),
        withPackageRegistry(packageRegistry),
        loadFonts(fonts, { assets: false }),
      ],
    })
    compiler = instance
    return instance
  })()
  return compilerPromise
}

self.onmessage = async event => {
  const message = event.data || {}
  try {
    const instance = await getCompiler()
    if (message.type === 'init') {
      self.postMessage({ type: 'ready', runtime: `typst.ts ${TYPST_TS_VERSION}`, packageVersion: SANG_MATH_GRAPHICS_VERSION })
      return
    }
    if (message.type !== 'compile') return
    instance.addSource('/main.typ', String(message.source || ''))
    const result = await instance.compile({
      mainFilePath: '/main.typ',
      inputs: { 'sang-math-canvas-compat': '1' },
      format: 0,
      diagnostics: 'full',
    })
    const artifact = result?.result
    if (!artifact) {
      self.postMessage({ type: 'compile-result', requestId: message.requestId, diagnostics: normalizeDiagnostics(result?.diagnostics) })
      return
    }
    const bytes = artifact instanceof Uint8Array ? artifact : new Uint8Array(artifact)
    self.postMessage({
      type: 'compile-result',
      requestId: message.requestId,
      artifact: bytes,
      diagnostics: normalizeDiagnostics(result?.diagnostics),
    }, [bytes.buffer])
  } catch (error) {
    self.postMessage({ type: 'worker-error', requestId: message.requestId, error: { message: error?.message || String(error) } })
  }
}
