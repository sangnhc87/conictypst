#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "../../../public/hdsd/typst/sang-math-geom.typ": *

#show: lecture-theme.with(
  title: [Đường Tròn — Chuyên Sâu],
  subtitle: [TOÁN 10 — BÀI TOÁN TIẾP XÚC & CẮT TUYẾN],
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
// PHẦN I: LÝ THUYẾT NỀN TẢNG
// ════════════════════════════════════════════════
#lt-section-link("sec-ly-thuyet", "📚", [I. Lý Thuyết Nền Tảng])

#lt-slide-back(title: "📚 Nhắc Lại: Hai Dạng Phương Trình")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "1. Dạng chuẩn (Chính tắc)")[
        Đường tròn tâm $I(a; b)$, bán kính $R$:
        $ (x - a)^2 + (y - b)^2 = R^2 $
        *Đặc điểm:* Tâm và bán kính được thể hiện trực tiếp. Thường dùng khi biết sẵn tọa độ tâm.
      ]
    ],
    [
      #lt-definition(title: "2. Dạng khai triển (Tổng quát)")[
        $ x^2 + y^2 - 2a x - 2b y + c = 0 $
        *Điều kiện:* $a^2 + b^2 - c > 0$.
        *Suy ra:* Tâm $I(a; b)$, bán kính $R = sqrt{a^2 + b^2 - c}$.
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: BÀI TOÁN TIẾP XÚC
// ════════════════════════════════════════════════
#lt-section-link("sec-tiep-xuc", "⚡", [II. Bài Toán Tiếp Xúc (Nâng Cao)])

#lt-slide-back(title: "⚡ Dạng 1: Tiếp xúc với trục toạ độ")[
  #lt-two-col(
    ratio: (40%, 60%),
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Hệ trục
          line((-1, 0), (5, 0), stroke: 0.6pt, mark: (end: "stealth"))
          content((4.8, -0.3), [$x$])
          line((0, -1), (0, 5), stroke: 0.6pt, mark: (end: "stealth"))
          content((-0.3, 4.8), [$y$])
          content((-0.3, -0.3), [$O$])
          
          // Tròn
          circle((2.5, 1.5), radius: 1.5, fill: rgb(59, 130, 246, 50%), stroke: 1pt + rgb("#2563eb"))
          circle((2.5, 1.5), radius: 2.2pt, fill: black)
          content((2.5, 1.8), [$I(a; b)$])
          
          // Hình chiếu
          line((2.5, 1.5), (2.5, 0), stroke: (paint: gray, dash: "dashed"))
          content((3, 0.75), text(blue)[$R = |b|$])
        })
      ]
    ],
    [
      #lt-theorem(title: "Đường tròn tâm I(a; b)")[
        1. Tiếp xúc $O x <=> R = d(I, O x) = |y_I| = |b|$
        2. Tiếp xúc $O y <=> R = d(I, O y) = |x_I| = |a|$
        3. Tiếp xúc cả hai trục $<=> |a| = |b| = R$
      ]
      
      #lt-example(title: "Ví dụ 1")[
        Viết phương trình đường tròn tâm $I(2; -3)$ tiếp xúc với trục hoành $O x$.
      ]
      #lt-solution[
        Tiếp xúc trục $O x$ nên $R = |y_I| = |-3| = 3$.
        Vậy phương trình là: $(x - 2)^2 + (y + 3)^2 = 9$.
      ]
    ]
  )
]

#lt-slide-back(title: "⚡ Dạng 2: Tiếp xúc với đường thẳng bất kỳ")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Tiếp tuyến tổng quát")[
        Đường tròn tâm $I(x_0; y_0)$ tiếp xúc với $Delta: A x + B y + C = 0$ khi và chỉ khi khoảng cách từ $I$ đến $Delta$ bằng bán kính $R$:
        $ d(I, Delta) = (|A x_0 + B y_0 + C|) / sqrt(A^2 + B^2) = R $
      ]
      
      #lt-important(title: "Độ dài tiếp tuyến")[
        Độ dài đoạn tiếp tuyến từ $M(x_M; y_M)$ đến đường tròn tâm $I$, bán kính $R$ là:
        $ l = sqrt(I M^2 - R^2) $
      ]
    ],
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((0, 0), (6, 3), stroke: 1.5pt + red)
          content((5.5, 3.2), text(red)[$Delta$])
          circle((2, 4), radius: 2.236, fill: rgb(34, 197, 94, 50%), stroke: 1pt + rgb("#16a34a"))
          circle((2, 4), radius: 2.2pt, fill: black)
          content((2, 4.3), [$I$])
          line((2, 4), (3, 1.5), stroke: (paint: black, dash: "dashed"))
          content((2.7, 2.7), [$R$])
        })
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [III. Luyện tập Trắc Nghiệm])

#lt-tn(
  [Đường tròn tâm $I(1; -2)$ tiếp xúc với trục $O x$ có bán kính $R$ bằng:],
  (
    [$1$],
    [$2$],
    [$3$],
    [$4$]
  ),
  correct: 1,
  num: 1,
  de: "Khoảng cách đến trục tọa độ",
  loigiai: [
    Tiếp xúc với trục $O x => R = d(I, O x) = |y_I| = |-2| = 2$.
  ]
)

#lt-tn(
  [Đường tròn tâm $I(-3; 4)$ đi qua gốc tọa độ $O(0;0)$ có phương trình là:],
  (
    [$(x+3)^2 + (y-4)^2 = 25$],
    [$(x-3)^2 + (y+4)^2 = 25$],
    [$(x+3)^2 + (y-4)^2 = 5$],
    [$(x-3)^2 + (y+4)^2 = 5$]
  ),
  correct: 0,
  num: 2,
  de: "Viết phương trình đường tròn",
  loigiai: [
    Bán kính $R = I O = sqrt{(-3)^2 + 4^2} = 5$.
    Phương trình: $(x+3)^2 + (y-4)^2 = 25$.
  ]
)

#lt-tn(
  [Cho đường tròn $(C): x^2 + y^2 - 2x + 4y - 4 = 0$. Tọa độ tâm $I$ và bán kính $R$ là:],
  (
    [$I(1; -2), R=3$],
    [$I(-1; 2), R=3$],
    [$I(1; -2), R=9$],
    [$I(-1; 2), R=9$]
  ),
  correct: 0,
  num: 3,
  de: "Xác định tâm và bán kính",
  loigiai: [
    $a = 1, b = -2, c = -4$.
    Tâm $I(1; -2)$.
    Bán kính $R = sqrt{a^2 + b^2 - c} = sqrt{1 + 4 - (-4)} = sqrt(9) = 3$.
  ]
)

#lt-tn(
  [Đường tròn tiếp xúc với đường thẳng $Delta: 3x - 4y + 5 = 0$ tại điểm $M(1; 2)$ và có bán kính $R=5$ có thể có tâm $I$ là:],
  (
    [$I(4; -2)$],
    [$I(4; 2)$],
    [$I(-4; -2)$],
    [$I(-2; 4)$]
  ),
  correct: 0,
  num: 4,
  de: "Bài toán tiếp xúc",
  loigiai: [
    $I$ thuộc đường thẳng vuông góc với $Delta$ tại $M$: $4x + 3y - 10 = 0$.
    Suy ra $I(x; (10-4x)/3)$.
    $I M^2 = 25 <=> (x-1)^2 + ((10-4x)/3 - 2)^2 = 25$.
    Giải ra $x = 4$ hoặc $x = -2$.
    Với $x=4 => I(4; -2)$.
  ]
)

#lt-tn(
  [Số tiếp tuyến kẻ từ điểm $A(0; 5)$ đến đường tròn $(C): x^2 + y^2 = 9$ là:],
  (
    [0],
    [1],
    [2],
    [Vô số]
  ),
  correct: 2,
  num: 5,
  de: "Tiếp tuyến từ điểm ngoài",
  loigiai: [
    Đường tròn $(C)$ có tâm $O(0;0), R=3$.
    Khoảng cách $O A = 5 > 3 = R => A$ nằm ngoài đường tròn.
    Do đó, từ $A$ kẻ được 2 tiếp tuyến đến $(C)$.
  ]
)
