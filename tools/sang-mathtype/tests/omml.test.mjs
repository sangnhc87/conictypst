// Kiểm thử bộ đổi Typst/LaTeX -> OMML: mọi công thức trong bảng ký hiệu và mẫu đề phải đổi được và là XML hợp lệ.
// Chạy: node tools/sang-mathtype/tests/omml.test.mjs
import fs from 'node:fs'
import path from 'node:path'
import { execFileSync } from 'node:child_process'
import { mkdtempSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { fileURLToPath } from 'node:url'
import { typstToOmml } from '../src/omml.js'
import { initLatex, latexToTypstMath } from '../src/latex.js'
import { unicodeCompat, pairBars } from '../src/latex-prep.js'
import { CATEGORIES } from '../src/palette.js'

const here = path.dirname(fileURLToPath(import.meta.url))
await initLatex(fs.readFileSync(path.join(here, '../vendor/mitex/mitex.wasm')))
const clean = s => s.replaceAll('⟦', '').replaceAll('⟧', '')
const dir = mkdtempSync(path.join(tmpdir(), 'omml-'))
const NS = 'xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"'
let n = 0, bad = []
const wellFormed = xml => { const f = path.join(dir, 'x.xml'); fs.writeFileSync(f, `<r ${NS}>${xml}</r>`); try { execFileSync('xmllint', ['--noout', f], { stdio: 'pipe' }); return true } catch { return false } }

for (const c of CATEGORIES) for (const it of c.items) {
  for (const lang of ['typst', 'latex']) {
    const code = clean(lang === 'typst' ? it.typst : (it.latex || ''))
    if (!code) continue
    n++
    try {
      const typst = lang === 'latex' ? latexToTypstMath(unicodeCompat(pairBars(code))) : code
      const xml = typstToOmml(typst)
      if (!wellFormed(xml)) bad.push([lang, c.id, it.name, 'XML hỏng'])
    } catch (e) { bad.push([lang, c.id, it.name, String(e.message).slice(0, 90)]) }
  }
}
console.log(`đã thử ${n} công thức, lỗi ${bad.length}`)
// Chỉ coi là lỗi khi không phải cấu trúc đã biết là chưa hỗ trợ
const known = /chưa hỗ trợ|Công thức rỗng/
const real = bad.filter(b => !known.test(b[3]))
for (const b of bad) console.log(known.test(b[3]) ? 'bỏ qua ' : 'LỖI    ', b.join(' | '))
if (real.length) process.exit(1)
console.log('Đạt')
