// =========================================================
// SANG-EXAM-BEAMER.TYP — Wrapper beamer cho sang-exam.typ
// =========================================================
// Cùng API với sang-exam.typ nhưng luôn ở beamer mode.
// Không cần --input beamer=1.
//
// Dùng cho exam file chỉ dành riêng cho Beamer.typ:
//   #import "../sang-exam-beamer.typ": *
//
// Các hàm được ghi đè:
//   exam-mode     → trả về hàm beamer (tn/ds/tln/tl từ sang-beamer)
//   exam-part     → tạo section slide thay vì in tiêu đề
//   thpt-school-exam → no-op (Beamer.typ đã setup layout)
//   het           → slide "HẾT" thay vì dòng in cuối đề
// =========================================================

#import "sang-exam.typ": *          // re-export tất cả
#import "sang-beamer.typ": (
  // ghi đè các hàm cần thiết
  exam-mode,
  exam-part,
  het,
)

// thpt-school-exam trong beamer chỉ cần pass-through body
// (sang-beamer-theme đã setup page layout 16:9)
#let thpt-school-exam(body, ..args) = body
