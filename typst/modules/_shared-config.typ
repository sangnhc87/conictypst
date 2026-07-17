// ╔══════════════════════════════════════════════════════════════════════════╗
// ║  _shared-config.typ — Cấu hình dùng CHUNG cho toàn bộ thư mục sach/   ║
// ║  Import vào _config.typ của từng thư mục:                               ║
// ║    #import "../../modules/_shared-config.typ": *                         ║
// ╚══════════════════════════════════════════════════════════════════════════╝

// ─── tfrac: Phân số nhỏ kiểu LaTeX \tfrac{}{} ────────────────────────────
// Dùng khi cần phân số nhỏ trong số mũ, cận tích phân, hoặc trong chuỗi text.
//
// VÍ DỤ:
//   $3^(tfrac(5,3))$           → mũ có phân số nhỏ
//   $integral_0^tfrac(pi,2)$   → cận tích phân gọn
//   $tfrac(2+y, 3^(tfrac(5,3)))$ → phân số lồng nhau
//
// LƯU Ý: cần đặt #show: doc-setup ở đầu file để hiệu lực.

#let tfrac(num, den) = {
  show math.frac: f => f
  scale(x: 72%, y: 72%, origin: center + horizon, reflow: true, math.inline(math.frac(num, den)))
}

// ─── doc-setup: Cấu hình hiển thị toán thay cho 10 dòng show rules ────────
// Thay vì viết ở đầu mỗi file:
//   #show math.equation: set text(fill: ...)
//   #show math.equation.where(block: false): math.display
//   ...
//
// Chỉ cần 1 dòng:
//   #show: doc-setup
//
// Để đổi màu chữ toán học:
//   #show: doc-setup.with(math-color: rgb("#0f4c81"))

#let doc-setup(body, math-color: rgb("#000000")) = {
  // Màu chữ công thức toán
  show math.equation: set text(fill: math-color)

  // Công thức inline vẫn dùng display style. Typst tự thu nhỏ phân số trong
  // số mũ/cận; chỉ dòng có phân số mới nhận thêm khoảng thoáng theo baseline.
  show math.equation.where(block: false): it => {
    if repr(it).contains("frac") {
      box(inset: (y: 0.16em))[#math.display(it)]
    } else {
      math.display(it)
    }
  }

  body
}

// ─── Alias tiện dùng ────────────────────────────────────────────────────────
// Dùng hoac(...) thay cho cases với dấu ngoặc vuông [ thay vì {
#let hoac(..args) = math.cases(
  delim: "[",
  ..args.named(),
  ..args.pos().map(math.display)
)
