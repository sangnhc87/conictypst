// Đóng gói add-in vào dist/: bundle JS bằng esbuild + sao chép WASM, font, mitex, manifest.
import { build } from 'esbuild'
import { cpSync, mkdirSync, rmSync, copyFileSync, readFileSync, writeFileSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import path from 'node:path'
import { buildDraw } from './draw-build.mjs'

const here = path.dirname(fileURLToPath(import.meta.url))
const root = path.resolve(here, '../..')
const outArg = process.argv.find(a => a.startsWith('--out='))
const out = outArg ? path.resolve(outArg.slice(6)) : path.join(here, 'dist')
rmSync(out, { recursive: true, force: true })
mkdirSync(path.join(out, 'wasm'), { recursive: true })

const BUILD_ID = new Date().toISOString().replace(/\D/g, '').slice(0, 14)
await build({
  define: { __BUILD_ID__: JSON.stringify(BUILD_ID) },
  entryPoints: [path.join(here, 'src/taskpane.js')],
  bundle: true, format: 'esm', target: 'es2020', minify: true,
  outfile: path.join(out, 'taskpane.js'), logLevel: 'info',
  nodePaths: [path.join(root, 'node_modules')],
})
for (const f of ['index.html', 'taskpane.html', 'taskpane.css', 'commands.html', 'hdsd.html', 'qr-donate.png', '_headers']) copyFileSync(path.join(here, 'src', f), path.join(out, f))
// compiler.wasm ~29 MiB vượt giới hạn 25 MiB/tệp của Cloudflare Pages: tách đôi, engine nối lại khi tải.
const compiler = readFileSync(path.join(root, 'node_modules/@myriaddreamin/typst-ts-web-compiler/pkg/typst_ts_web_compiler_bg.wasm'))
const half = Math.ceil(compiler.length / 2)
writeFileSync(path.join(out, 'wasm/compiler.part0.wasm'), compiler.subarray(0, half))
writeFileSync(path.join(out, 'wasm/compiler.part1.wasm'), compiler.subarray(half))
copyFileSync(path.join(root, 'node_modules/@myriaddreamin/typst-ts-renderer/pkg/typst_ts_renderer_bg.wasm'), path.join(out, 'wasm/renderer.wasm'))
cpSync(path.join(here, 'fonts'), path.join(out, 'fonts'), { recursive: true })
cpSync(path.join(here, 'vendor/mitex'), path.join(out, 'mitex'), { recursive: true })
cpSync(path.join(here, 'icons'), path.join(out, 'icons'), { recursive: true })
// Địa chỉ phát hành: SM_BASE_URL=https://ten-mien.pages.dev node build.mjs  -> manifest trỏ về đó thay vì localhost
const base = (process.env.SM_BASE_URL || '').replace(/\/$/, '')
let manifest = readFileSync(path.join(here, 'manifest.xml'), 'utf8')
if (!base) {
  // Bản chạy trên máy: Id và tên riêng để cùng tồn tại với bản online trong Word Mac.
  manifest = manifest.replace('1392035f-25bf-4817-81b9-523377b1695e', 'a3f1c7e0-5b7d-4c2e-9d11-5f4a2b6c8e90')
    .replace('<DisplayName DefaultValue="Sang Math"/>', '<DisplayName DefaultValue="Sang Math (app Mac)"/>')
    .replace('<bt:String id="Title" DefaultValue="Sang Math"/>', '<bt:String id="Title" DefaultValue="Sang Math (app)"/>')
}
if (base) {
  manifest = manifest.replaceAll('https://localhost:3155', base)
  // Cloudflare Pages bỏ đuôi .html bằng redirect 308: trỏ thẳng vào địa chỉ không đuôi để Word khỏi bị chuyển hướng.
  manifest = manifest.replaceAll(`${base}/taskpane.html`, `${base}/taskpane`).replaceAll(`${base}/commands.html`, `${base}/commands`)
  // Bản phát hành: nút trên Home mở khung Sang Math trong Word (bản local mới gọi app Mac qua cổng 3155).
  manifest = manifest.replace(/<Action xsi:type="ExecuteFunction">\s*<FunctionName>showSangMath<\/FunctionName>\s*<\/Action>/,
    '<Action xsi:type="ShowTaskpane"><TaskpaneId>SangPane</TaskpaneId><SourceLocation resid="Url"/></Action>')
}
writeFileSync(path.join(out, 'manifest.xml'), manifest)
writeFileSync(path.join(out, 'version.json'), JSON.stringify({ v: BUILD_ID }))
copyFileSync(path.join(here, 'src/app.webmanifest'), path.join(out, 'app.webmanifest'))
await buildDraw(here, out)
// Bộ máy trộn đề chạy bằng Pyodide trong add-in: worker + các tệp Python dùng chung với app Mac
copyFileSync(path.join(here, 'src/exam.worker.js'), path.join(out, 'exam.worker.js'))
mkdirSync(path.join(out, 'python'), { recursive: true })
for (const f of ['docx_shuffler.py', 'sm_analyze.py']) copyFileSync(path.join(here, 'exam/engine', f), path.join(out, 'python', f))

// Bộ cài một lệnh cho Mac và Windows (tệp văn bản để curl / iwr tải về chạy)
for (const f of ['install-mac.sh', 'install-windows.ps1']) copyFileSync(path.join(here, 'installers', f), path.join(out, f))
// Service worker: danh sách mọi tệp (trừ chính nó, version.json, trình cài, nhật ký) để chạy ngoại tuyến sau lần đầu có mạng
{
  const { readdirSync, statSync } = await import('node:fs')
  const walk = (d, b = d) => readdirSync(d).flatMap(n => { const p = path.join(d, n); return statSync(p).isDirectory() ? walk(p, b) : [path.relative(b, p)] })
  const skip = new Set(['sw.js', 'version.json', '_headers', 'install-mac.sh', 'install-windows.ps1'])
  const files = walk(out).filter(f => !skip.has(f) && !f.startsWith('draw/t/')).sort()
  files.push('taskpane', './')
  writeFileSync(path.join(out, 'sw.js'), readFileSync(path.join(here, 'src/sw.template.js'), 'utf8').replace('__BUILD_ID__', BUILD_ID).replace('__FILES__', JSON.stringify(files)))
  console.log(`  sw: ${files.length} tệp lưu ngoại tuyến`)
}
console.log('Đã dựng xong:', out)
