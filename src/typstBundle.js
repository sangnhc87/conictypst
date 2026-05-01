export {
  createTypstCompiler,
  createTypstRenderer,
  loadFonts,
} from '@myriaddreamin/typst.ts/dist/esm/main.mjs'
import compilerWasmUrl from '@myriaddreamin/typst-ts-web-compiler/pkg/typst_ts_web_compiler_bg.wasm?url'
import rendererWasmUrl from '@myriaddreamin/typst-ts-renderer/pkg/typst_ts_renderer_bg.wasm?url'

export { compilerWasmUrl, rendererWasmUrl }