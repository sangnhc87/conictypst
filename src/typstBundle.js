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

export const compilerWasmUrl =
  'https://cdn.jsdelivr.net/npm/@myriaddreamin/typst-ts-web-compiler@0.7.0-rc2/pkg/typst_ts_web_compiler_bg.wasm'

export const rendererWasmUrl =
  'https://cdn.jsdelivr.net/npm/@myriaddreamin/typst-ts-renderer@0.7.0-rc2/pkg/typst_ts_renderer_bg.wasm'