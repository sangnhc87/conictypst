// Kiểm tra mẫu rời: dựng stampDocument từng mẫu, typst compile --root, xuất PNG (và lưới ảnh để xem nhanh).
// Dùng: node tests/check-stamps.mjs [tiền-tố-id ...]   → ảnh ở .cache/stamp-check/<id>.png, lưới sheet-N.png
import { readFileSync, writeFileSync, mkdirSync, rmSync } from 'node:fs'
import { execFileSync } from 'node:child_process'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { STAMPS, stampDocument } from '../src/draw/stamps.mjs'
import { PREAMBLE } from '../draw-build.mjs'

const here = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const work = path.join(here, '.cache/draw-work')
const out = path.join(here, '.cache/stamp-check')
mkdirSync(path.join(work, 'sang-math'), { recursive: true })
mkdirSync(out, { recursive: true })
writeFileSync(path.join(work, 'sm-draw.typ'), readFileSync(path.join(here, 'src/draw/sm-draw.typ')))
for (const f of ['bbt', 'geometry']) writeFileSync(path.join(work, `sang-math/${f}.typ`), readFileSync(path.join(here, `../../typst-pkg-sang-math/${f}.typ`)))
const want = process.argv.slice(2)
const list = STAMPS.filter(s => !want.length || want.some(w => s.id.startsWith(w)))
let bad = 0
const ok = []
for (const st of list) {
  const src = path.join(work, `chk-${st.id}.typ`)
  const png = path.join(out, `${st.id}.png`)
  writeFileSync(src, PREAMBLE + stampDocument(st, {}))
  try {
    execFileSync('typst', ['compile', '--root', work, '--format', 'png', '--ppi', '110', src, png], { stdio: 'pipe' })
    ok.push(st)
  } catch (e) {
    bad++
    console.error(`✗ ${st.id}: ${String(e.stderr || e.message).split('\n').slice(0, 5).join('\n   ')}`)
  }
}
console.log(`${ok.length}/${list.length} mẫu dịch được, ${bad} lỗi`)
if (want.length && ok.length) {
  const per = 12
  for (let i = 0; i * per < ok.length; i++) {
    const files = ok.slice(i * per, (i + 1) * per).map(s => path.join(out, `${s.id}.png`))
    try {
      execFileSync('montage', [...files.flatMap(f => ['-label', path.basename(f, '.png'), f]), '-tile', '4x', '-geometry', '420x320+6+6', '-background', 'white', '-pointsize', '14', path.join(out, `sheet-${i}.png`)], { stdio: 'pipe' })
    } catch {}
  }
}
process.exit(bad ? 1 : 0)
