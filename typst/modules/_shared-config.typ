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

#let in-tfrac = state("in-tfrac", false)

#let tfrac(num, den) = {
  in-tfrac.update(true) + math.frac(num, den) + in-tfrac.update(false)
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

  // Phân số trong môi trường inline ($...$) sẽ hiện ở dạng display (to, rõ)
  show math.equation.where(block: false): math.display

  // show rule thông minh cho math.frac:
  //   - Nếu đang trong tfrac(...) → hiện dạng inline (nhỏ) — dùng cho số mũ, cận tích phân
  //   - Nếu không → hiện dạng display (to, chuẩn)
  show math.frac: it => context {
    if in-tfrac.get() {
      math.inline(it)
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
