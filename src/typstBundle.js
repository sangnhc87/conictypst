export {
  createTypstCompiler,
  createTypstRenderer,
  FetchPackageRegistry,
  loadFonts,
} from '@myriaddreamin/typst.ts/dist/esm/main.mjs'

export { MemoryAccessModel } from '@myriaddreamin/typst.ts/dist/esm/fs/index.mjs'

export {
  withAccessModel,
  withPackageRegistry,
} from '@myriaddreamin/typst.ts/dist/esm/options.init.mjs'

// Load WASM từ jsDelivr CDN thay vì bundle local (tránh lỗi 25MB Cloudflare)
const TYPST_VERSION = '0.7.0-rc2'
const CDN = `https://cdn.jsdelivr.net/npm/@myriaddreamin`

export const compilerWasmUrl = `${CDN}/typst-ts-web-compiler@${TYPST_VERSION}/pkg/typst_ts_web_compiler_bg.wasm`
export const rendererWasmUrl = `${CDN}/typst-ts-renderer@${TYPST_VERSION}/pkg/typst_ts_renderer_bg.wasm`
