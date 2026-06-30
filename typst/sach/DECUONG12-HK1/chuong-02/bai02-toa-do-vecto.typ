// ─────────────────────────────────────────────────────────────────
//  BÀI 02 — Toạ độ của vectơ trong không gian
//  Chương 2 · Đề cương Toán 12 HK1
// ─────────────────────────────────────────────────────────────────
#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display


#bai("Toạ độ của vectơ trong không gian", mau: C2)

// // ── I. LÝ THUYẾT ─────────────────────────────────────────────────
// #muc[I. Lý thuyết]

// #ly-thuyet(tieu-de: "1. Hệ trục tọa độ Oxyz", mau: C2)[
//   *[Nội dung lý thuyết — GV điền vào đây]*

//   // Gợi ý:
//   // - Hệ trục vuông góc $O x y z$: ba trục đôi một vuông góc
//   // - Vectơ đơn vị $arrow(i) = (1;0;0)$, $arrow(j) = (0;1;0)$, $arrow(k) = (0;0;1)$
//   // - Mọi vectơ đều phân tích được dưới dạng $arrow(a) = x arrow(i) + y arrow(j) + z arrow(k)$
// ]

// #ly-thuyet(tieu-de: "2. Tọa độ điểm và tọa độ vectơ", mau: C2)[
//   *[Nội dung lý thuyết — GV điền vào đây]*
// ]

// #cong-thuc(mau: C2)[
//   *[Công thức trọng tâm — GV điền vào đây]*

//   // Gợi ý:
//   // Cho $A(x_A; y_A; z_A)$, $B(x_B; y_B; z_B)$:
//   // - $arrow(A B) = (x_B - x_A; y_B - y_A; z_B - z_A)$
//   // - $|arrow(A B)| = sqrt((x_B-x_A)^2 + (y_B-y_A)^2 + (z_B-z_A)^2)$
//   // - Trung điểm $M$ của $A B$: $M = ((x_A+x_B)/2; (y_A+y_B)/2; (z_A+z_B)/2)$
//   // - Trọng tâm $G$ của tam giác $A B C$: $G = ((x_A+x_B+x_C)/3; ...)$
// ]

// // ── II. CÁC DẠNG BÀI ─────────────────────────────────────────────
// #muc[II. Các dạng bài toán]

// #dang("Tính tọa độ vectơ, độ dài, trung điểm, trọng tâm", mau: C2)

// #phuong-phap(mau: C2)[
//   *[Phương pháp — GV điền vào đây]*
// ]

// #vi-du(
//   [*[Đề bài ví dụ 1 — GV điền vào đây]*],
//   loi-giai: [*[Lời giải — GV điền vào đây]*],
//   mau: C2
// )

// #dang("Tích vô hướng — Góc giữa hai vectơ", mau: C2)

// #phuong-phap(mau: C2)[
//   *[Phương pháp — GV điền vào đây]*

//   // Gợi ý:
//   // $cos theta = (arrow(a) dot arrow(b)) / (|arrow(a)| dot |arrow(b)|)$
//   // $arrow(a) dot arrow(b) = x_1 x_2 + y_1 y_2 + z_1 z_2$
// ]

// #vi-du(
//   [*[Đề bài ví dụ 2 — GV điền vào đây]*],
//   loi-giai: [*[Lời giải — GV điền vào đây]*],
//   mau: C2
// )

// #dang("Tìm điểm thỏa điều kiện cho trước", mau: C2)

// #phuong-phap(mau: C2)[
//   *[Phương pháp — GV điền vào đây]*
// ]

// #vi-du(
//   [*[Đề bài ví dụ 3 — GV điền vào đây]*],
//   loi-giai: [*[Lời giải — GV điền vào đây]*],
//   mau: C2
// )

// // ── III. BÀI TẬP TỰ LUYỆN ────────────────────────────────────────
#include "bai02-de1.typ"
