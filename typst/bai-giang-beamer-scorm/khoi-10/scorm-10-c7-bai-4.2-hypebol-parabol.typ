#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"

#show: lecture-theme.with(
  title: [Hypebol & Parabol],
  subtitle: [TOÁN 10 — BA ĐƯỜNG CONIC],
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
// PHẦN I: HYPEBOL
// ════════════════════════════════════════════════
#lt-section-link("sec-hypebol", "📚", [I. Đường Hypebol (H)])

#lt-slide-back(title: "📚 Định nghĩa và Phương trình chính tắc Hypebol")[
  #lt-definition(title: "1. Định nghĩa")[
    Cho hai điểm cố định $F_1, F_2$ với $F_1 F_2 = 2c > 0$. Hypebol là tập hợp các điểm $M$ sao cho:
    $ |M F_1 - M F_2| = 2a $
    (với $a$ là hằng số dương và $a < c$).
  ]
  #lt-definition(title: "2. Phương trình chính tắc")[
    Phương trình chính tắc của Hypebol có dạng:
    $ x^2/a^2 - y^2/b^2 = 1 quad (a > 0, b > 0) $
    Trong đó: $b^2 = c^2 - a^2$.
  ]
]

#lt-slide-back(title: "⚡ Các yếu tố của Hypebol")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-important(title: "Các thông số")[
        - Tiêu điểm: $F_1(-c; 0), F_2(c; 0)$.
        - Tiêu cự: $F_1 F_2 = 2c$.
        - Các đỉnh: $A_1(-a; 0), A_2(a; 0)$.
        - Trục thực: độ dài $2a$.
        - Trục ảo: độ dài $2b$.
      ]
    ],
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Hệ trục
          line((-4, 0), (4, 0), mark: (end: "stealth"))
          content((3.8, -0.3), [$x$])
          line((0, -3), (0, 3), mark: (end: "stealth"))
          content((-0.3, 2.8), [$y$])
          
          // Hypebol nhánh phải
          bezier((1.5, 0), (3.5, 2.5), (2.5, 0), stroke: 1.5pt + blue)
          bezier((1.5, 0), (3.5, -2.5), (2.5, 0), stroke: 1.5pt + blue)
          
          // Hypebol nhánh trái
          bezier((-1.5, 0), (-3.5, 2.5), (-2.5, 0), stroke: 1.5pt + blue)
          bezier((-1.5, 0), (-3.5, -2.5), (-2.5, 0), stroke: 1.5pt + blue)
          
          content((1.5, -0.3), [$a$])
          content((-1.5, -0.3), [$-a$])
          
          circle((2.5, 0), radius: 2pt, fill: black)
          content((2.5, -0.4), text(red)[$F_2$])
          
          circle((-2.5, 0), radius: 2pt, fill: black)
          content((-2.5, -0.4), text(red)[$F_1$])
        })
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: PARABOL
// ════════════════════════════════════════════════
#lt-section-link("sec-parabol", "🚀", [II. Đường Parabol (P)])

#lt-slide-back(title: "🚀 Định nghĩa và PT chính tắc Parabol")[
  #lt-definition(title: "1. Định nghĩa")[
    Cho điểm cố định $F$ và đường thẳng cố định $Delta$ không đi qua $F$.
    Parabol là tập hợp các điểm $M$ cách đều $F$ và $Delta$:
    $ M F = d(M, Delta) $
  ]
  #lt-definition(title: "2. Phương trình chính tắc")[
    Phương trình chính tắc của Parabol (P) có dạng:
    $ y^2 = 2 p x quad (p > 0) $
    - $p$ là tham số tiêu.
    - Tiêu điểm: $F(p/2; 0)$.
    - Đường chuẩn: $Delta: x = -p/2$.
  ]
]

// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [III. Luyện tập Trắc Nghiệm])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — HYPEBOL & PARABOL],
  questions: (
    (num: 1, type: "TN", desc: [Xác định tiêu điểm Hypebol]),
    (num: 2, type: "TN", desc: [Độ dài trục ảo Hypebol]),
    (num: 3, type: "TN", desc: [Xác định tiêu điểm Parabol]),
    (num: 4, type: "TN", desc: [PT đường chuẩn Parabol]),
    (num: 5, type: "TN", desc: [Viết PT chính tắc Parabol]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho Hypebol $(H): x^2/9 - y^2/16 = 1$. Tiêu cự của $(H)$ là:],
  (
    [$5$],
    [$10$],
    [$8$],
    [$25$]
  ),
  correct: 1,
  num: 1,
  de: "Tính tiêu cự Hypebol",
  loigiai: [
    Ta có $a^2 = 9 => a = 3$ và $b^2 = 16 => b = 4$.
    Mặt khác $c^2 = a^2 + b^2 = 9 + 16 = 25 => c = 5$.
    Tiêu cự là $2c = 10$.
  ]
)

#lt-tn(
  [Cho Hypebol $(H): x^2/16 - y^2/9 = 1$. Độ dài trục ảo là:],
  (
    [$4$],
    [$6$],
    [$8$],
    [$3$]
  ),
  correct: 1,
  num: 2,
  de: "Trục ảo Hypebol",
  loigiai: [
    Ta có $a^2 = 16, b^2 = 9 => b = 3$.
    Độ dài trục ảo là $2b = 2 dot 3 = 6$.
  ]
)

#lt-tn(
  [Cho Parabol $(P): y^2 = 12x$. Tọa độ tiêu điểm $F$ là:],
  (
    [$F(6; 0)$],
    [$F(3; 0)$],
    [$F(-3; 0)$],
    [$F(12; 0)$]
  ),
  correct: 1,
  num: 3,
  de: "Tọa độ tiêu điểm Parabol",
  loigiai: [
    Phương trình $(P)$ có dạng $y^2 = 2 p x$, suy ra $2p = 12 => p = 6$.
    Tiêu điểm $F(p/2; 0) => F(3; 0)$.
  ]
)

#lt-tn(
  [Đường chuẩn của Parabol $(P): y^2 = 8x$ có phương trình là:],
  (
    [$x = -2$],
    [$x = 2$],
    [$x = -4$],
    [$y = -2$]
  ),
  correct: 0,
  num: 4,
  de: "PT đường chuẩn Parabol",
  loigiai: [
    Ta có $2p = 8 => p = 4$.
    Đường chuẩn có phương trình $x = -p/2 <=> x = -2$.
  ]
)

#lt-tn(
  [Parabol $(P)$ có tiêu điểm $F(5; 0)$ và đỉnh tại gốc tọa độ $O$ có phương trình chính tắc là:],
  (
    [$y^2 = 5x$],
    [$y^2 = 10x$],
    [$y^2 = 20x$],
    [$x^2 = 20y$]
  ),
  correct: 2,
  num: 5,
  de: "Lập PT chính tắc Parabol",
  loigiai: [
    Tiêu điểm $F(5; 0) => p/2 = 5 => p = 10$.
    Phương trình chính tắc là $y^2 = 2 p x => y^2 = 20x$.
  ]
)
