// Gói thư viện vẽ hình (CeTZ + sm-draw.typ + mẫu) vào dist/draw/ để engine nạp vào bộ dịch Typst chạy trong trình duyệt.
// Ảnh xem trước của từng mẫu được dựng sẵn bằng typst bản dòng lệnh (có cache), không phải dựng lúc người dùng mở.
import { readFileSync, writeFileSync, mkdirSync, readdirSync, existsSync, statSync, copyFileSync } from 'node:fs'
import { execFileSync } from 'node:child_process'
import { createHash } from 'node:crypto'
import path from 'node:path'
import os from 'node:os'

const CETZ = 'cetz/0.5.2'
const OXIFMT = 'oxifmt/1.0.0'
export const PREAMBLE = '#set page(width: auto, height: auto, margin: 4pt, fill: none)\n#set text(size: 10pt, font: ("New Computer Modern", "NewCM10"), lang: "vi")\n'

function walk(dir, base = dir) {
  return readdirSync(dir).flatMap(n => {
    const p = path.join(dir, n)
    return statSync(p).isDirectory() ? walk(p, base) : [path.relative(base, p)]
  })
}

function packageRoot(name) {
  const candidates = [
    path.join(os.homedir(), 'Library/Caches/typst/packages/preview', name),
    path.join(os.homedir(), '.cache/typst/packages/preview', name),
  ]
  const found = candidates.find(existsSync)
  if (!found) throw new Error(`Thiếu gói Typst ${name}; chạy thử typst compile với gói này một lần để tải về.`)
  return found
}

export async function buildDraw(here, out) {
  const dir = path.join(out, 'draw')
  mkdirSync(dir, { recursive: true })
  const files = []
  const put = (virtual, text) => {
    const target = path.join(dir, virtual.replace(/^\//, ''))
    mkdirSync(path.dirname(target), { recursive: true })
    writeFileSync(target, text)
    files.push(virtual)
  }

  // CeTZ + oxifmt: chép nguyên bản, đổi import gói thành đường dẫn ảo trong bộ dịch
  const cetz = packageRoot(CETZ)
  for (const f of walk(path.join(cetz, 'src')).filter(f => f.endsWith('.typ'))) {
    let t = readFileSync(path.join(cetz, 'src', f), 'utf8')
    t = t.replaceAll('#import "@preview/oxifmt:1.0.0"', '#import "/pkg/oxifmt/lib.typ" as oxifmt').replace(/"\/src\//g, '"/pkg/cetz/src/').replaceAll('"/cetz-core/cetz_core.wasm"', '"/pkg/cetz/cetz-core/cetz_core.wasm"')
    put(`/pkg/cetz/src/${f}`, t)
  }
  put('/pkg/cetz/typst.toml', readFileSync(path.join(cetz, 'typst.toml'), 'utf8'))
  mkdirSync(path.join(dir, 'pkg/cetz/cetz-core'), { recursive: true })
  copyFileSync(path.join(cetz, 'cetz-core/cetz_core.wasm'), path.join(dir, 'pkg/cetz/cetz-core/cetz_core.wasm'))
  files.push('/pkg/cetz/cetz-core/cetz_core.wasm')
  const ox = packageRoot(OXIFMT)
  for (const f of readdirSync(ox).filter(f => f.endsWith('.typ'))) put(`/pkg/oxifmt/${f}`, readFileSync(path.join(ox, f), 'utf8'))

  const lib = readFileSync(path.join(here, 'src/draw/sm-draw.typ'), 'utf8').replace('@preview/cetz:0.5.2', '/pkg/cetz/src/lib.typ')
  put('/sm-draw.typ', lib)
  // Bảng biến thiên của gói sang-math (bbtv2, bxd, bbbt…): chỉ cần CeTZ
  const bbt = readFileSync(path.join(here, '../../typst-pkg-sang-math/bbt.typ'), 'utf8').replace('@preview/cetz:0.5.2', '/pkg/cetz/src/lib.typ')
  put('/sang-math/bbt.typ', bbt)
  put('/sang-math/geometry.typ', readFileSync(path.join(here, '../../typst-pkg-sang-math/geometry.typ'), 'utf8').replace(/^#import "@preview\/cetz:0\.5\.2"$/m, '#import "/pkg/cetz/src/lib.typ" as cetz'))

  // mẫu
  const tdir = path.join(here, 'src/draw/templates')
  const templates = []
  const cache = path.join(here, '.cache/draw-thumbs')
  mkdirSync(cache, { recursive: true })
  mkdirSync(path.join(dir, 'thumbs'), { recursive: true })
  const libHash = createHash('sha1').update(readFileSync(path.join(here, 'src/draw/sm-draw.typ'))).digest('hex').slice(0, 8)
  const work = path.join(here, '.cache/draw-work')
  mkdirSync(work, { recursive: true })
  writeFileSync(path.join(work, 'sm-draw.typ'), readFileSync(path.join(here, 'src/draw/sm-draw.typ')))
  mkdirSync(path.join(work, 'sang-math'), { recursive: true })
  writeFileSync(path.join(work, 'sang-math/bbt.typ'), readFileSync(path.join(here, '../../typst-pkg-sang-math/bbt.typ')))
  writeFileSync(path.join(work, 'sang-math/geometry.typ'), readFileSync(path.join(here, '../../typst-pkg-sang-math/geometry.typ')))
  let hasTypst = true
  try { execFileSync('typst', ['--version'], { stdio: 'pipe' }) } catch { hasTypst = false }
  for (const f of readdirSync(tdir).filter(f => f.endsWith('.typ')).sort()) {
    const code = readFileSync(path.join(tdir, f), 'utf8')
    const meta = {}
    for (const m of code.matchAll(/^\/\/ @(\w+)\s+(.+)$/gm)) meta[m[1]] = m[2].trim()
    const id = f.replace(/\.typ$/, '')
    const body = code.replace(/^\/\/ @\w+.*\n/gm, '')
    const thumb = path.join(cache, `${id}-${createHash('sha1').update(body + libHash).digest('hex').slice(0, 10)}.svg`)
    if (!existsSync(thumb) && hasTypst) {
      const src = path.join(work, `${id}.typ`)
      writeFileSync(src, PREAMBLE + body)
      try {
        execFileSync('typst', ['compile', '--root', work, '--format', 'svg', src, thumb], { stdio: 'pipe' })
      } catch (e) {
        console.error(`⚠ Mẫu ${id} không dịch được:\n${String(e.stderr || e.message).split('\n').slice(0, 6).join('\n')}`)
        continue
      }
    }
    if (existsSync(thumb)) writeFileSync(path.join(dir, 'thumbs', `${id}.svg`), readFileSync(thumb))
    put(`/t/${id}.typ`, body)
    templates.push({ id, nhom: meta.nhom || 'Khác', muc: meta.muc || '', ten: meta.ten || id, mota: meta.mota || '', tu: meta.tu || '' })
  }
  // ảnh xem trước các mẫu rời của bảng vẽ kéo thả
  const { STAMPS, stampDocument } = await import(path.join(here, 'src/draw/stamps.mjs'))
  mkdirSync(path.join(dir, 'stamps'), { recursive: true })
  const stampsCache = path.join(here, '.cache/stamp-thumbs')
  mkdirSync(stampsCache, { recursive: true })
  let built = 0
  for (const st of STAMPS) {
    const doc = PREAMBLE + stampDocument(st, {})
    const key = createHash('sha1').update(doc + libHash).digest('hex').slice(0, 10)
    const thumb = path.join(stampsCache, `${st.id}-${key}.svg`)
    if (!existsSync(thumb) && hasTypst) {
      const src = path.join(work, `stamp-${st.id}.typ`)
      writeFileSync(src, doc)
      try { execFileSync('typst', ['compile', '--root', work, '--format', 'svg', src, thumb], { stdio: 'pipe' }); built++ } catch (e) { console.error(`⚠ Mẫu rời ${st.id} không dịch được: ${String(e.stderr || e.message).split('\n')[0]}`); continue }
    }
    if (existsSync(thumb)) writeFileSync(path.join(dir, 'stamps', `${st.id}.svg`), readFileSync(thumb))
  }
  console.log(`  draw: ${STAMPS.length} mẫu rời (${built} mới)`)
  writeFileSync(path.join(dir, 'manifest.json'), JSON.stringify({ files: files.filter(f => !f.startsWith('/t/')), templates }, null, 0))
  console.log(`  draw: ${files.length} tệp, ${templates.length} mẫu`)
}
