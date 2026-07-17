import { mkdir, readFile, stat, writeFile } from 'node:fs/promises'
import { fileURLToPath } from 'node:url'

const version = '0.7.0-rc2'
const source = fileURLToPath(new URL(`../node_modules/@myriaddreamin/typst-ts-web-compiler/pkg/typst_ts_web_compiler_bg.wasm`, import.meta.url))
const outputDir = fileURLToPath(new URL('../typst-conic-hub/public/runtime/', import.meta.url))
const bytes = await readFile(source)
const splitAt = Math.ceil(bytes.length / 2)
const parts = [bytes.subarray(0, splitAt), bytes.subarray(splitAt)]

await mkdir(outputDir, { recursive: true })
await Promise.all(parts.map(async (part, index) => {
  const target = `${outputDir}typst-compiler-${version}.part${index}.bin`
  const current = await stat(target).catch(() => null)
  if (current?.size === part.length) return
  await writeFile(target, part)
}))

console.log(`Typst runtime: ${parts.length} phần · ${bytes.length} bytes`)
