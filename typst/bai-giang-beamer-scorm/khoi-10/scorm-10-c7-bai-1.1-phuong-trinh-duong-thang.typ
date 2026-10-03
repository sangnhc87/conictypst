#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "../../../public/hdsd/typst/sang-math-geom.typ": *

#show: lecture-theme.with(
  title: [Đường Thẳng Trong Mặt Phẳng],
  subtitle: [TOÁN 10 — CHUYÊN SÂU PHƯƠNG TRÌNH & ỨNG DỤNG],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG CHUYÊN SÂU])

// ════════════════════════════════════════════════
// PHẦN I: VECTƠ VÀ PHƯƠNG TRÌNH
// ════════════════════════════════════════════════
#lt-section-link("sec-ly-thuyet", "📚", [I. Lý Thuyết: Hai Loại Vectơ Cơ Bản])

#lt-slide-back(title: "📚 Vectơ Chỉ Phương & Vectơ Pháp Tuyến")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "1. Vectơ Chỉ Phương (VTCP)")[
        Vectơ $vec(u) != vec(0)$ được gọi là *VTCP* của $Delta$ nếu giá của nó song song hoặc trùng với $Delta$.
      ]
      
      #lt-definition(title: "2. Vectơ Pháp Tuyến (VTPT)")[
        Vectơ $vec(n) != vec(0)$ được gọi là *VTPT* của $Delta$ nếu giá của nó vuông góc với $Delta$.
      ]
      
      #lt-important(title: "Mối liên hệ")[
        $vec(u) = (a; b) <=> vec(n) = (-b; a)$ hoặc $vec(n) = (b; -a)$
      ]
    ],
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Đường thẳng Delta
          line((0, 1), (5, 3), stroke: 1.5pt + red)
          content((5.2, 3.2), text(red)[$Delta$])
          
          // VTCP
          line((1, 2), (3, 2.8), stroke: 1pt + blue, mark: (end: "stealth"))
          content((2, 2.1), text(blue)[$vec(u)$])
          
          // VTPT
          line((3, 1.5), (2.2, 3.5), stroke: 1pt + rgb(34, 197, 94), mark: (end: "stealth"))
          content((2.5, 3.2), text(rgb(34, 197, 94))[$vec(n)$])
          
          // Góc vuông giả lập
          line((2.7, 2.25), (2.45, 2.35), stroke: 0.5pt)
        })
      ]
    ]
  )
]

#lt-slide-back(title: "⚡ Các Dạng Phương Trình Đường Thẳng")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Phương trình Tổng Quát")[
        Đi qua $M_0(x_0; y_0)$ và có VTPT $vec(n) = (A; B)$:
        $ A(x - x_0) + B(y - y_0) = 0 $
        Hay $A x + B y + C = 0$.
      ]
    ],
    [
      #lt-theorem(title: "Phương trình Tham Số")[
        Đi qua $M_0(x_0; y_0)$ và có VTCP $vec(u) = (u_1; u_2)$:
        $ cases(
          x = x_0 + u_1 t,
          y = y_0 + u_2 t
        ) $
        *(với $t$ là tham số)*
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: KỸ THUẬT VÀ BÀI TOÁN
// ════════════════════════════════════════════════
#lt-section-link("sec-ky-thuat", "🚀", [II. Kỹ Thuật Lập Phương Trình])

#lt-slide-back(title: "🚀 Dạng 1: Viết phương trình qua 2 điểm")[
  #lt-example(title: "Ví dụ 1")[
    Viết phương trình tham số và tổng quát của đường thẳng $A B$ với $A(1; 2)$ và $B(-3; 4)$.
  ]
  #lt-solution[
    *Bước 1:* Tính VTCP $vec(u) = vec(A B) = (-3 - 1; 4 - 2) = (-4; 2)$.
    Ta có thể chọn VTCP đơn giản hơn: $vec(u_1) = (-2; 1)$.
    
    *Bước 2:* Viết PT tham số qua $A(1; 2)$ với VTCP $(-2; 1)$:
    $ cases(x = 1 - 2t, y = 2 + t) $
    
    *Bước 3:* Chuyển VTCP $vec(u_1) = (-2; 1)$ sang VTPT $vec(n) = (1; 2)$.
    PT tổng quát qua $A$: $1(x - 1) + 2(y - 2) = 0 <=> x + 2y - 5 = 0$.
  ]
]

#lt-slide-back(title: "🚀 Dạng 2: Khoảng cách từ một điểm")[
  #lt-theorem(title: "Công thức Khoảng cách")[
    Khoảng cách từ $M(x_0; y_0)$ đến $Delta: A x + B y + C = 0$ là:
    $ d(M, Delta) = (|A x_0 + B y_0 + C|) / sqrt(A^2 + B^2) $
  ]
  #lt-example(title: "Ví dụ 2")[
    Tính khoảng cách từ $M(2; -1)$ đến $Delta: 3x - 4y + 5 = 0$.
  ]
  #lt-solution[
    $ d(M, Delta) = (|3(2) - 4(-1) + 5|) / sqrt(3^2 + (-4)^2) = (|6 + 4 + 5|) / sqrt(25) = 15 / 5 = 3 $
  ]
]

// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [III. Luyện tập Trắc Nghiệm])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — ĐƯỜNG THẲNG],
  questions: (
    (num: 1, type: "TN", desc: [Xác định VTPT/VTCP]),
    (num: 2, type: "TN", desc: [Viết PT đường thẳng]),
    (num: 3, type: "TN", desc: [Tính khoảng cách]),
    (num: 4, type: "TN", desc: [Đường thẳng song song]),
    (num: 5, type: "TN", desc: [Góc giữa 2 đường thẳng]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Đường thẳng $d: x - 3y + 2 = 0$ có một vectơ pháp tuyến là:],
  (
    [$vec(n) = (1; -3)$],
    [$vec(n) = (1; 3)$],
    [$vec(n) = (-3; 1)$],
    [$vec(n) = (3; 1)$]
  ),
  correct: 0,
  num: 1,
  de: "Xác định VTPT",
  loigiai: [
    Phương trình tổng quát $A x + B y + C = 0$ có VTPT là $vec(n) = (A; B)$.
    Với $d: 1x - 3y + 2 = 0$, ta có $A = 1, B = -3 => vec(n) = (1; -3)$.
  ]
)

#lt-tn(
  [Một vectơ chỉ phương của $d: 2x - 5y + 1 = 0$ là:],
  (
    [$vec(u) = (2; -5)$],
    [$vec(u) = (5; 2)$],
    [$vec(u) = (-5; -2)$],
    [$vec(u) = (-2; 5)$]
  ),
  correct: 1,
  num: 2,
  de: "Chuyển đổi VTPT sang VTCP",
  loigiai: [
    VTPT của $d$ là $vec(n) = (2; -5)$.
    VTCP là $vec(u) = (5; 2)$ hoặc $(-5; -2)$. Do đó chọn (5; 2).
  ]
)

#lt-tn(
  [Khoảng cách từ $A(1; 1)$ đến đường thẳng $d: 3x + 4y - 12 = 0$ là:],
  (
    [$1$],
    [$2$],
    [$3$],
    [$4$]
  ),
  correct: 0,
  num: 3,
  de: "Tính khoảng cách",
  loigiai: [
    $d(A, d) = (|3(1) + 4(1) - 12|) / sqrt(3^2 + 4^2) = (|-5|) / 5 = 1$.
  ]
)

#lt-tn(
  [Đường thẳng đi qua $M(1; -2)$ và song song với $Delta: 2x - 3y + 1 = 0$ có phương trình là:],
  (
    [$2x - 3y - 8 = 0$],
    [$2x - 3y + 8 = 0$],
    [$3x + 2y + 1 = 0$],
    [$2x - 3y = 0$]
  ),
  correct: 0,
  num: 4,
  de: "Đường thẳng song song",
  loigiai: [
    Đường thẳng song song với $Delta$ có phương trình dạng $2x - 3y + C = 0$ ($C != 1$).
    Đi qua $M(1; -2) => 2(1) - 3(-2) + C = 0 <=> 2 + 6 + C = 0 <=> C = -8$.
    Phương trình: $2x - 3y - 8 = 0$.
  ]
)

#lt-tn(
  [Góc giữa hai đường thẳng $d_1: x + 2y - 1 = 0$ và $d_2: x - 3y + 4 = 0$ là:],
  (
    [$30^degree$],
    [$45^degree$],
    [$60^degree$],
    [$90^degree$]
  ),
  correct: 1,
  num: 5,
  de: "Góc giữa 2 đường thẳng",
  loigiai: [
    $vec(n_1) = (1; 2)$, $vec(n_2) = (1; -3)$.
    $cos alpha = (|vec(n_1) dot vec(n_2)|) / (|vec(n_1)| |vec(n_2)|) = (|1(1) + 2(-3)|) / (sqrt(1+4) sqrt(1+9)) = (|-5|) / (sqrt(5) sqrt(10)) = 5 / (5 sqrt(2)) = 1 / sqrt(2)$.
    Do đó $alpha = 45^degree$.
  ]
)
