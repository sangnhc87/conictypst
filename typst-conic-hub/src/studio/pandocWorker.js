// Pandoc WASM chạy hoàn toàn cục bộ. Trước đây worker tải core.js từ jsDelivr
// và binary 58 MiB từ unpkg mỗi lần xuất — service worker không cache unpkg nên
// tải lại toàn bộ, dễ vượt timeout 120s. Nay core.js được vendor (Vite bundle,
// tự phân giải @bjorn3/browser_wasi_shim) và binary được chẻ nhỏ trong /runtime/
// để service worker cache và ghép lại tại đây. Cả hai file .generated.js do
// scripts/prepare-hub-runtime.mjs sinh ra trước khi build.
import { createPandocInstance } from './pandocCore.generated.js'
import { PANDOC_WASM_PARTS } from './pandocRuntime.generated.js'

let convertPromise = null

async function fetchWasmBinary() {
  const parts = await Promise.all(PANDOC_WASM_PARTS.map(async url => {
    const response = await fetch(url)
    if (!response.ok) throw new Error(`Không tải được Pandoc WASM: HTTP ${response.status} (${url})`)
    return new Uint8Array(await response.arrayBuffer())
  }))
  const total = parts.reduce((sum, part) => sum + part.length, 0)
  const binary = new Uint8Array(total)
  let offset = 0
  for (const part of parts) {
    binary.set(part, offset)
    offset += part.length
  }
  return binary
}

async function getPandocConvert() {
  if (!convertPromise) {
    convertPromise = (async () => {
      const pandoc = await createPandocInstance(await fetchWasmBinary())
      return pandoc.convert
    })()
  }
  return convertPromise
}

// We receive message from the main thread
self.onmessage = async event => {
  const requestId = event.data?.requestId || null
  try {
    if (event.data?.type === 'prewarm') {
      await getPandocConvert()
      self.postMessage({ type: 'prewarm', requestId, success: true })
      return
    }
    const { typstCode, images = {} } = event.data
    const convert = await getPandocConvert()

    const options = {
      from: 'typst',
      to: 'docx',
      'output-file': 'output.docx',
      'reference-doc': 'template.docx',
      filters: ['tabs.lua'],
    }

    const [templateRes, luaRes] = await Promise.all([
      fetch(`/runtime/template.docx?v=${Date.now()}`),
      fetch(`/runtime/tabs.lua?v=${Date.now()}`),
    ])
    if (!templateRes.ok) throw new Error(`Không tải được mẫu Word: HTTP ${templateRes.status}`)
    if (!luaRes.ok) throw new Error(`Không tải được bộ lọc Word: HTTP ${luaRes.status}`)

    const files = {
      'template.docx': await templateRes.blob(),
      'tabs.lua': await luaRes.text(),
      ...images
    }

    const result = await convert(options, typstCode, files)
    const docxBlob = result.files['output.docx']
    if (!docxBlob) throw new Error('Pandoc WASM không tạo được tệp DOCX')
    if (result.stderr) console.warn(result.stderr)

    // DOMParser không tồn tại ổn định trong DedicatedWorker. Việc làm đẹp XML
    // được thực hiện ở main thread sau khi Blob quay về.
    self.postMessage({ type: 'convert', requestId, success: true, blob: docxBlob, warnings: result.warnings || [] })
  } catch (error) {
    self.postMessage({ type: event.data?.type || 'convert', requestId, success: false, error: error?.message || String(error) })
  }
}
