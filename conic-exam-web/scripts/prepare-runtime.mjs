import { copyFile, mkdir, readFile, rm, writeFile } from 'node:fs/promises'
import { fileURLToPath } from 'node:url'

const version = '0.7.0'
// Lấy WASM đúng từ node_modules của chính ứng dụng. Dùng ../../ ở đây sẽ
// vô tình lấy package hoisted ở repo cha, có thể khác ABI với JS mà Vite nạp.
const compilerSource = fileURLToPath(new URL(`../node_modules/@myriaddreamin/typst-ts-web-compiler/pkg/typst_ts_web_compiler_bg.wasm`, import.meta.url))
const rendererSource = fileURLToPath(new URL(`../node_modules/@myriaddreamin/typst-ts-renderer/pkg/typst_ts_renderer_bg.wasm`, import.meta.url))
const output = fileURLToPath(new URL('../public/runtime/', import.meta.url))
const bytes = await readFile(compilerSource)
const splitAt = Math.ceil(bytes.length / 2)

await mkdir(output, { recursive: true })
await Promise.all([
  'typst-compiler-0.7.0-rc2.part0.bin',
  'typst-compiler-0.7.0-rc2.part1.bin',
  'typst-renderer-0.7.0-rc2.wasm',
].map(file => rm(`${output}${file}`, { force: true })))
await Promise.all([bytes.subarray(0, splitAt), bytes.subarray(splitAt)].map(async (part, index) => {
  const target = `${output}typst-compiler-${version}.part${index}.bin`
  // Các bản WASM có thể cùng kích thước nhưng khác ABI. Luôn ghi lại để JS
  // và WASM chắc chắn đến từ đúng cùng phiên bản package đang cài.
  await writeFile(target, part)
}))
await copyFile(rendererSource, `${output}typst-renderer-${version}.wasm`)
console.log(`Conic Exam Typst runtime: compiler ${bytes.length} bytes + renderer`)
