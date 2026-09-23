import test from 'node:test'
import assert from 'node:assert/strict'

import { parseLatexToTypst, convertLatexMathToTypst } from '../typst-conic-hub/src/studio/converters/latexToTypst.js'
import { parseTypstToLatex, convertTypstMathToLatex } from '../typst-conic-hub/src/studio/converters/typstToLatex.js'
import { cleanAiOutputToTypst } from '../typst-conic-hub/src/studio/converters/aiCleaner.js'

test('Chuyển đổi công thức Toán từ LaTeX sang Typst', () => {
  assert.equal(convertLatexMathToTypst('\\frac{a}{b}'), '(a)/(b)')
  assert.equal(convertLatexMathToTypst('\\sqrt{x^2 + 1}'), 'sqrt(x^2 + 1)')
  assert.equal(convertLatexMathToTypst('\\sqrt[3]{8}'), 'root(3, 8)')
  assert.equal(convertLatexMathToTypst('\\int_{0}^{1} x \\mathrm{d}x'), 'integral_(0)^(1) x dif x')
  assert.equal(convertLatexMathToTypst('\\le \\ge \\ne \\in \\mathbb{R}'), '<= >= != in RR')
  assert.equal(convertLatexMathToTypst('\\vec{u} + \\overrightarrow{AB}'), 'arrow(u) + arrow(AB)')
})

test('Chuyển đổi đề thi LaTeX ex_test.sty sang Typst sang-math:1.0.5', () => {
  const latex = `
\\begin{ex}
  Cho hàm số $y=f(x)$. Mệnh đề nào đúng?
  \\choice
    {\\True $f'(x) > 0$}
    {$f'(x) < 0$}
    {$f(x) = 0$}
    {$f(x) > 0$}
  \\loigiai{Hàm số đồng biến nên đạo hàm dương.}
\\end{ex}

\\begin{ex}
  Xét tính đúng sai:
  \\choiceTF
    {\\True Mệnh đề A đúng}
    {Mệnh đề B sai}
    {\\True Mệnh đề C đúng}
    {Mệnh đề D sai}
  \\loigiai{Giải thích chi tiết 4 ý.}
\\end{ex}

\\begin{ex}
  Nghiệm của phương trình $x+1=2$ là:
  \\shortans{1}
  \\loigiai{Ta có $x=1$.}
\\end{ex}
`
  const typst = parseLatexToTypst(latex)
  assert.ok(typst.includes('@preview/sang-math:1.0.5'))
  assert.ok(typst.includes('#tn('))
  assert.ok(typst.includes('True([$f\'(x) > 0$])'))
  assert.ok(typst.includes('#ds('))
  assert.ok(typst.includes('#tln('))
  assert.ok(typst.includes('[1]'))
  assert.ok(typst.includes('loigiai: [Hàm số đồng biến nên đạo hàm dương.]'))
})

test('Chuyển ngược từ Typst sang-math:1.0.5 sang LaTeX ex_test.sty', () => {
  const typst = `
#tn(
  [Cho hàm số $y=f(x)$. Mệnh đề nào đúng?],
  (True([$f'(x) > 0$]), [$f'(x) < 0$], [$f(x) = 0$], [$f(x) > 0$]),
  id: "TN01",
  loigiai: [Lời giải TN.]
)
#ds(
  [Xét tính đúng sai:],
  (
    True([Ý 1]),
    [Ý 2],
    True([Ý 3]),
    [Ý 4]
  ),
  id: "DS01"
)
#tln([Nghiệm là], [42], id: "TLN01")
`
  const tex = parseTypstToLatex(typst)
  assert.ok(tex.includes('\\usepackage{ex_test}'))
  assert.ok(tex.includes('\\begin{ex}'))
  assert.ok(tex.includes('\\choice'))
  assert.ok(tex.includes('\\True'))
  assert.ok(tex.includes('\\choiceTF'))
  assert.ok(tex.includes('\\shortans{42}'))
  assert.ok(tex.includes('\\loigiai'))
})

test('Làm sạch văn bản AI sang định dạng Typst sang-math:1.0.5', () => {
  const rawAi = `
\`\`\`typst
Câu 1: Cho hình chóp $S.ABC$. Tính thể tích.
Câu 2: Tìm giá trị lớn nhất của hàm số $y=x^2$.
\`\`\`
`
  const cleaned = cleanAiOutputToTypst(rawAi)
  assert.ok(cleaned.includes('@preview/sang-math:1.0.5'))
  assert.ok(!cleaned.includes('```'))
  assert.ok(cleaned.includes('exam-theme'))
  assert.ok(cleaned.includes('#het'))
})

import { mergeTypstExamPages } from '../typst-conic-hub/src/studio/converters/geminiOcr.js'

test('Ghép nối nhiều trang PDF thành đề thi chuẩn sang-math:1.0.5 có watermark: none', () => {
  const page1 = {
    pageNum: 1,
    code: `#import "@preview/sang-math:1.0.5": *\n#show: exam-theme.with()\n#tn([Câu 1], ([$A$], True([$B$]), [$C$], [$D$]), id: "TN01")`
  }
  const page2 = {
    pageNum: 2,
    code: `#import "@preview/sang-math:1.0.5": *\n#show: exam-theme.with()\n#ds([Câu 2], (True([a]), [b], True([c]), [d]), id: "DS01")`
  }

  const merged = mergeTypstExamPages([page1, page2], { title: 'ĐỀ THI HỌC KỲ' })

  // Chỉ có đúng 1 khai báo #import và #show
  const importMatches = merged.match(/#import\s+["']@preview\/sang-math:1\.0\.5["']/g)
  assert.equal(importMatches.length, 1)

  const showMatches = merged.match(/#show:\s*exam-theme\.with/g)
  assert.equal(showMatches.length, 1)

  // Có watermark rõ ràng
  assert.ok(merged.includes('watermark: none'))
  assert.ok(merged.includes('watermark-opacity: 0.05'))

  // Giữ nguyên các câu hỏi từ trang 1 và trang 2
  assert.ok(merged.includes('#tn([Câu 1]'))
  assert.ok(merged.includes('#ds([Câu 2]'))
  assert.ok(merged.includes('NỘI DUNG TỪ TRANG 1'))
  assert.ok(merged.includes('NỘI DUNG TỪ TRANG 2'))
})

import { normalizeGeminiModel } from '../typst-conic-hub/src/studio/converters/geminiOcr.js'

test('Chuẩn hóa model Gemini, sửa lỗi gemini-3.1-pro thành gemini-3.1-pro-preview', () => {
  assert.equal(normalizeGeminiModel('gemini-3.1-pro'), 'gemini-3.1-pro-preview')
  assert.equal(normalizeGeminiModel('gemini-3.8-flash'), 'gemini-3.8-flash')
  assert.equal(normalizeGeminiModel('gemini-3.7-flash'), 'gemini-3.7-flash')
  assert.equal(normalizeGeminiModel(''), 'gemini-3.8-flash')
})


