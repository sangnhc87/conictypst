import { mkdir, readFile, stat, writeFile } from 'node:fs/promises'
import { fileURLToPath } from 'node:url'

const outputDir = fileURLToPath(new URL('../typst-conic-hub/public/runtime/', import.meta.url))
const studioDir = fileURLToPath(new URL('../typst-conic-hub/src/studio/', import.meta.url))
await mkdir(outputDir, { recursive: true })

async function writePartIfChanged(target, part) {
  const current = await stat(target).catch(() => null)
  if (current?.size === part.length) return
  await writeFile(target, part)
}

// --- Typst compiler (giữ nguyên hành vi cũ: chẻ đôi) ---------------------
{
  const version = '0.8.0-rc3'
  const source = fileURLToPath(new URL(`../node_modules/@myriaddreamin/typst-ts-web-compiler/pkg/typst_ts_web_compiler_bg.wasm`, import.meta.url))
  const bytes = await readFile(source)
  const splitAt = Math.ceil(bytes.length / 2)
  const parts = [bytes.subarray(0, splitAt), bytes.subarray(splitAt)]
  await Promise.all(parts.map((part, index) =>
    writePartIfChanged(`${outputDir}typst-compiler-${version}.part${index}.bin`, part),
  ))
  console.log(`Typst runtime: ${parts.length} phần · ${bytes.length} bytes`)
}

// --- Pandoc WASM (mới: chẻ để né giới hạn 25 MiB/file của Cloudflare) ----
// pandoc.wasm ~58 MiB. Trước đây worker tải trực tiếp từ unpkg mỗi lần xuất
// (service worker không cache unpkg → tải lại 58 MiB và dễ quá 120s timeout).
// Nay chẻ nhỏ vào /runtime/ để service worker cache và ghép lại cục bộ.
{
  const PART_LIMIT = 24 * 1024 * 1024 // an toàn dưới 25 MiB
  const pkg = JSON.parse(await readFile(
    fileURLToPath(new URL('../node_modules/pandoc-wasm/package.json', import.meta.url)),
    'utf8',
  ))
  const version = pkg.version
  const wasmSource = fileURLToPath(new URL('../node_modules/pandoc-wasm/src/pandoc.wasm', import.meta.url))
  const bytes = await readFile(wasmSource)

  const partCount = Math.ceil(bytes.length / PART_LIMIT)
  const chunkSize = Math.ceil(bytes.length / partCount)
  const parts = []
  for (let index = 0; index < partCount; index += 1) {
    parts.push(bytes.subarray(index * chunkSize, Math.min((index + 1) * chunkSize, bytes.length)))
  }
  await Promise.all(parts.map((part, index) =>
    writePartIfChanged(`${outputDir}pandoc-${version}.part${index}.bin`, part),
  ))

  // Vendored core.js: package chặn deep-import qua trường "exports", nên phải
  // copy ra chỗ Vite bundle được (bare import @bjorn3/browser_wasi_shim sẽ
  // được Vite phân giải từ node_modules). File này gitignore, sinh lúc build.
  const core = await readFile(
    fileURLToPath(new URL('../node_modules/pandoc-wasm/src/core.js', import.meta.url)),
    'utf8',
  )
  const coreBanner = `/* AUTO-GENERATED từ pandoc-wasm@${version}/src/core.js — KHÔNG sửa tay. Chạy scripts/prepare-hub-runtime.mjs để tạo lại. */\n`
  await writeFile(`${studioDir}pandocCore.generated.js`, coreBanner + core)

  // Manifest cho worker: version + danh sách đường dẫn part cục bộ.
  const partPaths = parts.map((_, index) => `/runtime/pandoc-${version}.part${index}.bin`)
  const manifest = `${coreBanner}export const PANDOC_VERSION = ${JSON.stringify(version)}\n`
    + `export const PANDOC_WASM_PARTS = ${JSON.stringify(partPaths, null, 2)}\n`
  await writeFile(`${studioDir}pandocRuntime.generated.js`, manifest)

  console.log(`Pandoc runtime: ${parts.length} phần · ${bytes.length} bytes · v${version}`)
}

// --- Copy essential files ---
import { copyFile } from 'node:fs/promises';
await copyFile(fileURLToPath(new URL('../scripts/tabs.lua', import.meta.url)), `${outputDir}tabs.lua`);
await copyFile(fileURLToPath(new URL('../scripts/template.docx', import.meta.url)), `${outputDir}template.docx`);
console.log("Copied tabs.lua and template.docx to public/runtime");
