import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import test from 'node:test'
import { validateSangMath } from '../public/hdsd/ai-sang-math-contract.js'

const goldenCases = [
  ['01-de-15-phut.typ', { tn: 4, ds: 0, tln: 2, tl: 0 }],
  ['02-de-giua-ky-hon-hop.typ', { tn: 4, ds: 1, tln: 2, tl: 1 }],
  ['03-de-thpt-12-4-6.typ', { tn: 12, ds: 4, tln: 6, tl: 0 }],
  ['04-de-tu-luan-co-nhap.typ', { tn: 0, ds: 0, tln: 0, tl: 3 }],
  ['06-de-co-bbt-va-hinh-cetz.typ', { tn: 2, ds: 0, tln: 0, tl: 0 }],
]

test('validator chấp nhận các file mẫu sang-math 1.0.1 đã biên dịch', async () => {
  for (const [name, expected] of goldenCases) {
    const url = new URL(`../typst-pkg-sang-math/examples/copy-ready/${name}`, import.meta.url)
    const code = await readFile(url, 'utf8')
    const result = validateSangMath(code, expected)
    assert.equal(result.valid, true, `${name}: ${result.errors.map(error => error.message).join('; ')}`)
    assert.deepEqual(result.stats, expected)
  }
})

test('validator chặn chữ ký cũ mà trang AI trước đây từng sinh', () => {
  const code = `#import "@preview/sang-math:1.0.1": *
#let preset = exam-preset(theme: "teal-pro", profile: "dethi")
#let (tn, ds, tln, tl) = exam-mode(..preset.question)
#show: exam-theme.with(theme: preset.theme, ..preset.template)
#tn[Nội dung][A][#True[B]][C][D][#ppgiai[Lời giải]]
#het`
  const result = validateSangMath(code, { tn: 1, ds: 0, tln: 0, tl: 0 })
  assert.equal(result.valid, false)
  assert.ok(result.errors.some(error => error.code === 'OLD_CALL'))
  assert.ok(result.errors.some(error => error.code === 'PPGIAI'))
})

test('validator chặn TN sai số phương án, thiếu True và trùng ID', () => {
  const code = `#import "@preview/sang-math:1.0.1": *
#let preset = exam-preset(theme: "teal-pro", profile: "dethi")
#let (tn, ds, tln, tl) = exam-mode(..preset.question)
#show: exam-theme.with(theme: preset.theme, ..preset.template)
#tn([Câu 1], ([A], [B], [C]), id: "TN01", tags: ("mau", "NB"), loigiai: [Giải.])
#tn([Câu 2], ([A], True([B]), [C], [D]), id: "TN01", tags: ("mau", "NB"), loigiai: [Giải.])
#het`
  const result = validateSangMath(code, { tn: 2, ds: 0, tln: 0, tl: 0 })
  assert.equal(result.valid, false)
  assert.ok(result.errors.some(error => error.code === 'FOUR_ITEMS'))
  assert.ok(result.errors.some(error => error.code === 'ONE_TRUE'))
  assert.ok(result.errors.some(error => error.code === 'ID_DUPLICATE'))
})
