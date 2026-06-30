// ─────────────────────────────────────────────────────────────────
//  BÀI 03 — Toạ độ của các phép toán vectơ
//  Chương 2 · Đề cương Toán 12 HK1
// ─────────────────────────────────────────────────────────────────
#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display


#bai("Toạ độ của các phép toán vectơ", mau: C2)

// // ── I. LÝ THUYẾT ─────────────────────────────────────────────────
// #muc[I. Lý thuyết]

// #ly-thuyet(tieu-de: "1. Phép toán vectơ theo tọa độ", mau: C2)[
//   *[Nội dung lý thuyết — GV điền vào đây]*
// ]

// #ly-thuyet(tieu-de: "2. Tích có hướng (tích vectơ)", mau: C2)[
//   *[Nội dung lý thuyết — GV điền vào đây]*

//   // Gợi ý: Cho $arrow(a) = (x_1; y_1; z_1)$ và $arrow(b) = (x_2; y_2; z_2)$:
//   // $[arrow(a), arrow(b)] = (y_1 z_2 - z_1 y_2; z_1 x_2 - x_1 z_2; x_1 y_2 - y_1 x_2)$
//   // Tính chất: $[arrow(a), arrow(b)]$ vuông góc với cả $arrow(a)$ và $arrow(b)$
// ]

// #cong-thuc(mau: C2)[
//   *[Công thức trọng tâm — GV điền vào đây]*

//   // Gợi ý:
//   // Cho $arrow(a) = (x_1; y_1; z_1)$, $arrow(b) = (x_2; y_2; z_2)$:
//   // - Tổng: $arrow(a) + arrow(b) = (x_1+x_2; y_1+y_2; z_1+z_2)$
//   // - Tích với số: $k arrow(a) = (k x_1; k y_1; k z_1)$
//   // - Tích vô hướng: $arrow(a) dot arrow(b) = x_1 x_2 + y_1 y_2 + z_1 z_2$
//   // - Điều kiện song song: $arrow(a) parallel arrow(b) arrow.l.r.double (x_1/x_2 = y_1/y_2 = z_1/z_2)$
//   // - Điều kiện vuông góc: $arrow(a) perp arrow(b) arrow.l.r.double arrow(a) dot arrow(b) = 0$
// ]

// #luu-y[
//   *[Lưu ý — GV điền vào đây]*
//   // Gợi ý: Tích có hướng không giao hoán: $[arrow(a), arrow(b)] = -[arrow(b), arrow(a)]$
// ]

// // ── II. CÁC DẠNG BÀI ─────────────────────────────────────────────
// #muc[II. Các dạng bài toán]

// #dang("Biểu diễn vectơ theo cơ sở không gian", mau: C2)

// #phuong-phap(mau: C2)[
//   *[Phương pháp — GV điền vào đây]*
// ]

// #vi-du(
//   [*[Đề bài ví dụ 1 — GV điền vào đây]*],
//   loi-giai: [*[Lời giải — GV điền vào đây]*],
//   mau: C2
// )

// #dang("Chứng minh song song, vuông góc bằng tọa độ", mau: C2)

// #phuong-phap(mau: C2)[
//   *[Phương pháp — GV điền vào đây]*
// ]

// #vi-du(
//   [*[Đề bài ví dụ 2 — GV điền vào đây]*],
//   loi-giai: [*[Lời giải — GV điền vào đây]*],
//   mau: C2
// )

// #dang("Tính diện tích hình học không gian bằng tích có hướng", mau: C2)

// #phuong-phap(mau: C2)[
//   *[Phương pháp — GV điền vào đây]*

//   // Gợi ý: Diện tích hình bình hành $A B C D = |[arrow(A B), arrow(A D)]|$
//   //         Diện tích tam giác $= 1/2 |[arrow(A B), arrow(A C)]|$
// ]

// #vi-du(
//   [*[Đề bài ví dụ 3 — GV điền vào đây]*],
//   loi-giai: [*[Lời giải — GV điền vào đây]*],
//   mau: C2
// )

// ── III. BÀI TẬP TỰ LUYỆN ────────────────────────────────────────
#include "bai03-de1.typ"
#include "bai03-de2.typ"

