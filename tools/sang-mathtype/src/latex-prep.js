// Tiền xử lý mã LaTeX trước khi đưa cho mitex (dùng cho cả dựng hình và đổi sang Equation).

// Typst `cases` không chừa khoảng giữa hai ô khi có '&', còn LaTeX thì có: thêm \quad cho giống LaTeX.
export function spaceCases(latex) {
  return latex.replace(/\\begin\{cases\}([\s\S]*?)\\end\{cases\}/g, (_, inner) => `\\begin{cases}${inner.replace(/&/g, '\\quad&')}\\end{cases}`)
}

// mitex 0.2.6 sinh tên ký hiệu của Typst cũ (sect, diff, plus.circle...) mà Typst mới không còn: đổi các lệnh đó
// sang ký tự Unicode tương ứng, mitex để nguyên rồi Typst vẽ như ký hiệu thường.
const LATEX_UNICODE = {
  cap: '∩', bigcap: '⋂', partial: '∂', oplus: '⊕', otimes: '⊗', odot: '⊙', hbar: 'ħ', langle: '⟨', rangle: '⟩', euro: '€',
  backsim: '∽', dongdang: '∽',
}
export const unicodeCompat = latex => latex.replace(/\\([A-Za-z]+)/g, (m, name) => LATEX_UNICODE[name] ?? m)

// LaTeX `|x|` là ngoặc ôm sát, còn mitex coi `|` là toán tử nên hở: ghép cặp tuần tự thành \left| \right|.
// Bỏ qua khi số dấu lẻ (như tập hợp {x | x>0}) hoặc `|` đã nằm trong \left/\right, \|, \mid.
export function pairBars(latex) {
  const re = /(\\left|\\right|\\)?\|/g
  const hits = [...latex.matchAll(re)]
  if (hits.some(m => m[1]) || hits.length % 2) return latex
  let n = 0
  return latex.replace(re, () => (n++ % 2 ? '\\right|' : '\\left|'))
}

