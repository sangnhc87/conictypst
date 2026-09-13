#import "sang-exam.typ": *
#import "book-templates.typ": *

#import "@preview/cetz:0.4.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(
  paper: "a4",
  margin: (x: 1.4cm, y: 1.8cm),
  header: none,
  footer: none,
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("#01579B"), rgb("#0277BD"), rgb("#0288D1"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("#0277BD")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("#0277BD"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("#0288D1"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

// Mục lục
#show outline.entry.where(level: 1): it => {
  v(10pt, weak: true)
  strong(it)
}

// ═══════════════════════════════════════════════
// BÌA SÁCH
// ═══════════════════════════════════════════════
#{
  show math.equation: set text(fill: white.transparentize(15%))
  let c-bg    = rgb("#04101d") // Deep dark blue-navy
  let c-p1    = rgb("#01579B") // Deep Blue
  let c-p2    = rgb("#0277BD") // Blue
  let c-p3    = rgb("#0288D1") // Light Blue
  let c-p4    = rgb("#E65100") // Amber
  let c-p5    = rgb("#00897B") // Teal

  // Nền toàn trang
  place(top + left, dx: -1.4cm, dy: -1.8cm,
    rect(width: 210mm, height: 297mm, fill: c-bg, radius: 0pt))
  // Dải màu trái
  place(top + left, dx: -1.4cm, dy: -1.8cm,
    rect(width: 7mm, height: 297mm, fill: c-p2, radius: 0pt))
  // Dải 5 màu dưới
  place(top + left, dx: -1.4cm + 7mm, dy: 26.1cm,
    block(width: 203mm, height: 18mm)[
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr), rows: 18mm,
        rect(width: 100%, height: 100%, fill: c-p1, stroke: none),
        rect(width: 100%, height: 100%, fill: c-p2, stroke: none),
        rect(width: 100%, height: 100%, fill: c-p3, stroke: none),
        rect(width: 100%, height: 100%, fill: c-p4, stroke: none),
        rect(width: 100%, height: 100%, fill: c-p5, stroke: none),
      )
    ])

  v(22mm)
  align(center, {
    // Nhãn
    box(
      stroke: 1pt + white.transparentize(50%),
      fill: white.transparentize(88%),
      inset: (x: 18pt, y: 7pt),
      radius: 20pt,
    )[
      #text(fill: white, weight: "bold", size: 10pt, tracking: 0.06em)[
        ◆ TÀI LIỆU CHUYÊN SÂU THPT — HÌNH HỌC KHÔNG GIAN 12 · 2025 – 2026
      ]
    ]
    v(1.4em)
    // Công thức trang trí
    text(fill: white.transparentize(45%), size: 12pt)[
      $V = 1/3 S h quad | quad d(M, (alpha)) = frac(|a x_0 + b y_0 + c z_0 + d|, sqrt(a^2+b^2+c^2)) quad | quad vec(n) = [vec(u), vec(v)] quad | quad S_(x q) = 2 pi r l$
    ]
    v(1.3em)
    // Khung tiêu đề
    block(
      width: 90%,
      fill: white,
      inset: 0pt,
      radius: 12pt,
      clip: true,
    )[
      #block(
        width: 100%, height: 8pt,
        fill: c-p2,
      )
      #v(0.6em)
      #block(
        width: 100%,
        inset: (bottom: 22pt, x: 26pt),
      )[
        #text(size: 28pt, weight: "bold", fill: c-bg)[MẪU HÌNH HỌC KHÔNG GIAN]
        #linebreak()
        #text(size: 14pt, weight: "bold", fill: c-p2)[TƯ DUY HÌNH HỌC TRỰC QUAN & PHƯƠNG PHÁP TỌA ĐỘ]
        #linebreak()
        #v(0.4em)
        #text(size: 15pt, weight: "bold", fill: c-p3)[10 CHỦ ĐỀ TOÀN DIỆN · KHOẢNG CÁCH & THỂ TÍCH]
        #v(0.7em)
        #line(length: 100%, stroke: 1.5pt + c-p2.lighten(55%))
        #v(0.6em)
        #text(size: 9.5pt, style: "italic", fill: rgb("#475569"))[
          Khối chóp · Lăng trụ · Góc & Khoảng cách · Tròn xoay · Nón - Trụ - Cầu · Phương pháp tọa độ Oxyz
        ]
        #v(1.2em)
        #grid(
          columns: (1fr, 1fr, 1fr, 1fr),
          column-gutter: 4pt,
          block(fill: c-p1, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[10 CHỦ ĐỀ]]
          ],
          block(fill: c-p2, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[180+ BÀI TẬP]]
          ],
          block(fill: c-p3, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[LỜI GIẢI CHI TIẾT]]
          ],
          block(fill: c-p4, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[HÌNH VẼ CETZ 3D]]
          ],
        )
      ]
    ]
    v(2em)
    // Thống kê
    grid(
      columns: (auto, auto, auto),
      column-gutter: 12pt,
      align: center,
      box(
        fill: white.transparentize(85%),
        stroke: 1pt + c-p2.transparentize(50%),
        inset: (x: 20pt, y: 12pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 18pt)[10]
        #linebreak()
        #text(fill: white.transparentize(25%), size: 9pt)[CHỦ ĐỀ]
      ],
      box(
        fill: white.transparentize(85%),
        stroke: 1pt + c-p2.transparentize(50%),
        inset: (x: 20pt, y: 12pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 18pt)[180+]
        #linebreak()
        #text(fill: white.transparentize(25%), size: 9pt)[BÀI TOÁN]
      ],
      box(
        fill: white.transparentize(85%),
        stroke: 1pt + c-p2.transparentize(50%),
        inset: (x: 20pt, y: 12pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 18pt)[4]
        #linebreak()
        #text(fill: white.transparentize(25%), size: 9pt)[MỨC ĐỘ]
      ],
    )
    v(2em)
    // Tác giả
    box(stroke: 1pt + c-p2.transparentize(40%), inset:(x:22pt,y:13pt), radius:8pt)[
      #text(fill: white, weight: "bold", size: 13pt)[★ Tổ Toán THPT]
      #linebreak()
      #text(fill: white.transparentize(30%), size: 10pt)[
        Bộ Tài Liệu Hình Học Không Gian Chuẩn Chương Trình GDPT 2018
      ]
    ]
  })
}
#pagebreak()

#show: sang-setup

// ═══════════════════════════════════════════════
// MỤC LỤC
// ═══════════════════════════════════════════════
#outline(
  title: [Mục Lục Chuyên Đề Hình Học Không Gian],
  depth: 2,
  indent: 1.5em,
)
#pagebreak()

// ==========================================
// CẤU HÌNH HEADER/FOOTER (Có thể tùy chỉnh)
// ==========================================
#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("#0277BD"))
    grid(
      columns: (1fr, auto),
      [HÌNH HỌC KHÔNG GIAN 12 — THỂ TÍCH & KHOẢNG CÁCH],
      [Năm học 2025 – 2026],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("#0277BD"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("#0277BD"))
    grid(
      columns: (1fr, auto),
      [ConicTypst · Tài liệu chia sẻ học tập],
      [Trang #counter(page).display()],
    )
  },
)

= CHỦ ĐỀ 1: THỂ TÍCH KHỐI CHÓP VÀ KHOẢNG CÁCH TỪ ĐIỂM ĐẾN MẶT PHẲNG

== 1. Tóm tắt lý thuyết & Phương pháp giải
#theorem-box(title: "Công thức thể tích khối đa diện")[
  - *Thể tích khối chóp:* $V = 1/3 S_("đáy") dot h$ (với $S_("đáy")$ là diện tích đáy, $h$ là chiều cao hạ từ đỉnh xuống đáy).
  - *Thể tích khối lăng trụ:* $V = S_("đáy") dot h$.
  - *Công thức tỉ số thể tích Simson (cho khối chóp tam giác):*
    $ frac(V_(S.A' B' C'), V_(S.A B C)) = frac(S A', S A) dot frac(S B', S B) dot frac(S C', S C) $
]

#method-box(title: "Phương pháp kẻ khoảng cách từ chân đường cao đến mặt bên")[
  Cho khối chóp $S.A B C D$ có $S A perp ("đáy")$ (chân đường cao là $A$). Để tính khoảng cách từ $A$ đến mặt bên $(S B C)$:
  + *Bước 1 (Kẻ vuông góc xuống đáy):* Kẻ $A K perp B C$ tại $K$ ($K in B C$).
  + *Bước 2 (Nối đường sinh):* Nối $S K$, kẻ $A H perp S K$ tại $H$ ($H in S K$).
  + *Bước 3 (Chứng minh):* Ta có $B C perp (S A K) => B C perp A H$. Mà $A H perp S K$ nên $A H perp (S B C) => d(A, (S B C)) = A H$.
  + *Bước 4 (Tính toán):* Áp dụng hệ thức lượng trong tam giác vuông $S A K$:
    $ frac(1, A H^2) = frac(1, S A^2) + frac(1, A K^2) $
]

== 2. Ví dụ minh họa
#example-box(title: "Ví dụ 1 (Khối chóp có cạnh bên vuông góc với đáy)")[
  Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình vuông cạnh $a$. Cạnh bên $S A$ vuông góc với mặt phẳng đáy và $S A = a sqrt(3)$. Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$.
  + a) Tính thể tích của khối chóp $S.A B C D$.
  + b) Tính khoảng cách từ điểm $A$ đến mặt phẳng $(S B D)$.

  *Lời giải:*
  + a) Diện tích hình vuông đáy $A B C D$ là:
    $ S_(A B C D) = a^2 $
    Chiều cao hình chóp là $h = S A = a sqrt(3)$.
    Thể tích khối chóp $S.A B C D$ là:
    $ V_(S.A B C D) = frac(1, 3) S_(A B C D) dot S A = frac(1, 3) a^2 dot a sqrt(3) = frac(a^3 sqrt(3), 3) $

  + b) Tính khoảng cách $d(A, (S B D))$:
    - Vì đáy $A B C D$ là hình vuông nên hai đường chéo vuông góc nhau: $A C perp B D => A O perp B D$ tại $O$.
    - Lại có $S A perp (A B C D) => S A perp B D$.
    - Do đó $B D perp (S A O)$. Kẻ $A H perp S O$ tại $H$ ($H in S O$).
    - Khi đó $A H perp B D$ và $A H perp S O$, suy ra $A H perp (S B D)$, hay $d(A, (S B D)) = A H$.
    - Trong hình vuông cạnh $a$, $A C = a sqrt(2) => A O = frac(a sqrt(2), 2)$.
    - Xét tam giác $S A O$ vuông tại $A$, có đường cao $A H$:
      $ frac(1, A H^2) = frac(1, S A^2) + frac(1, A O^2) = frac(1, (a sqrt(3))^2) + frac(1, (frac(a sqrt(2), 2))^2) = frac(1, 3 a^2) + frac(2, a^2) = frac(7, 3 a^2) $
      $ => A H^2 = frac(3 a^2, 7) => A H = frac(a sqrt(21), 7) $
  
  *Kết luận:* Khoảng cách từ $A$ đến $(S B D)$ bằng $frac(a sqrt(21), 7)$.
]

#practice-box(title: "Bài tập rèn luyện")[
  1. Cho hình chóp tam giác đều $S.A B C$ có cạnh đáy bằng $a$, góc giữa cạnh bên và mặt đáy bằng $60 degree$. Tính thể tích khối chóp $S.A B C$ và tính bán kính mặt cầu ngoại tiếp hình chóp.
  
  2. Cho hình lăng trụ đứng $A B C.A' B' C'$ có đáy $A B C$ là tam giác vuông cân tại $A$, $A B = a$, chiều cao $A A' = a sqrt(2)$. Gọi $M$ là trung điểm cạnh $B C$. Tính khoảng cách giữa hai đường thẳng chéo nhau $A' B$ và $C C'$.
]

#summary-box(title: "Quy tắc vàng tính khoảng cách trong hình không gian")[
  - Khoảng cách từ một điểm bất kỳ đến mặt phẳng luôn quy về *khoảng cách từ chân đường cao* thông qua tỉ số khoảng cách.
  - Luôn dựng mô hình tam giác vuông chứa chân đường cao và đường vuông góc phụ để tính theo hệ thức nghịch đảo bình phương.
]

