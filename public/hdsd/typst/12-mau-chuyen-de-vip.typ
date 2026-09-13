#import "sang-exam.typ": *
#import "book-templates.typ": *

#import "@preview/cetz:0.5.2"

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
  fill: gradient.linear(rgb("4A148C"), rgb("6A1B9A"), rgb("880E4F"), angle: 135deg),
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
  stroke: (left: 4pt + rgb("6A1B9A")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("6A1B9A"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("1565C0"), size: 11pt, weight: "bold", "⬧ " + it.body),
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
  let c-bg    = rgb("#090710") // Deep dark purple-navy
  let c-p1    = rgb("#4A148C") // Purple
  let c-p2    = rgb("#6A1B9A") // Violet
  let c-p3    = rgb("#880E4F") // Pink
  let c-p4    = rgb("#E65100") // Amber
  let c-p5    = rgb("#1565C0") // Blue

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
        ◆ TÀI LIỆU CHUYÊN SÂU THPT — TỔ HỢP & XÁC SUẤT · 2025 – 2026
      ]
    ]
    v(1.4em)
    // Công thức trang trí
    text(fill: white.transparentize(45%), size: 12pt)[
      $upright(C)_(n+k-1)^(k-1) quad | quad upright(P)(n;n_1,dots,n_k)=frac(n!,n_1! dots n_k!) quad | quad upright(C)_n = frac(1,n+1) upright(C)_(2n)^n$
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
        #text(size: 28pt, weight: "bold", fill: c-bg)[MẪU CHUYÊN ĐỀ VIP]
        #linebreak()
        #text(size: 14pt, weight: "bold", fill: c-p2)[TÀI LIỆU TOÁN HỌC CHUYÊN SÂU]
        #linebreak()
        #v(0.4em)
        #text(size: 15pt, weight: "bold", fill: c-p3)[18 CHỦ ĐỀ TOÀN DIỆN · KIẾN THỨC CỐT LÕI]
        #v(0.7em)
        #line(length: 100%, stroke: 1.5pt + c-p2.lighten(55%))
        #v(0.6em)
        #text(size: 9.5pt, style: "italic", fill: rgb("#475569"))[
          Cộng nhân · Gộp khoảng · Vách ngăn · Chia kẹo · Phân tập · Hình học · Truy hồi · Nhị thức
        ]
        #v(1.2em)
        #grid(
          columns: (1fr, 1fr, 1fr, 1fr),
          column-gutter: 4pt,
          block(fill: c-p1, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[18 CHỦ ĐỀ]]
          ],
          block(fill: c-p2, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[200+ BÀI TẬP]]
          ],
          block(fill: c-p3, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[LỜI GIẢI CHI TIẾT]]
          ],
          block(fill: c-p4, inset:(x:1pt,y:5pt), radius:4pt, width:100%)[
            #align(center)[#text(fill:white, size:8pt, weight:"bold")[BẢNG CÔNG THỨC]]
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
        #text(fill: white, weight: "bold", size: 18pt)[18]
        #linebreak()
        #text(fill: white.transparentize(25%), size: 9pt)[CHỦ ĐỀ]
      ],
      box(
        fill: white.transparentize(85%),
        stroke: 1pt + c-p2.transparentize(50%),
        inset: (x: 20pt, y: 12pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 18pt)[200+]
        #linebreak()
        #text(fill: white.transparentize(25%), size: 9pt)[BÀI TẬP]
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
      #text(fill: white, weight: "bold", size: 13pt)[★ Giáo Viên Biên Soạn]
      #linebreak()
      #text(fill: white.transparentize(30%), size: 10pt)[
        Tổ Toán – Bộ tài liệu Thực chiến THPT & ĐGNL
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
  title: [Mục Lục MẪU CHUYÊN ĐỀ VIP],
  depth: 2,
  indent: 1.5em,
)
#pagebreak()

// ==========================================
// CẤU HÌNH HEADER/FOOTER (Có thể tùy chỉnh)
// ==========================================
#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("1565C0"))
    grid(
      columns: (1fr, auto),
      [TÀI LIỆU CHUYÊN ĐỀ — SƯ PHẠM TOÀN DIỆN],
      [Giáo Viên Toán · Năm học 2026],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("1565C0"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("1565C0"))
    grid(
      columns: (1fr, auto),
      [Conic Typst · Tài liệu chia sẻ nội bộ],
      [Trang #counter(page).display()],
    )
  },
)

= CHỦ ĐỀ 1: BÀI TOÁN CHIA KẸO EULER & PHƯƠNG PHÁP VÁCH NGĂN

== 1. Tóm tắt lý thuyết & Định lý cốt lõi
#theorem-box(title: "Bài toán chia kẹo Euler (Stars and Bars)")[
  - *Bài toán 1 (Nghiệm nguyên dương):* Số cách chia $n$ chiếc kẹo giống nhau cho $k$ đứa trẻ sao cho mỗi đứa có ít nhất 1 chiếc kẹo (tương đương tìm số nghiệm nguyên dương của $x_1 + x_2 + dots + x_k = n$) bằng:
    $ N_1 = upright(C)_(n-1)^(k-1) $
  - *Bài toán 2 (Nghiệm nguyên không âm):* Số cách chia $n$ chiếc kẹo giống nhau cho $k$ đứa trẻ tùy ý (tương đương tìm số nghiệm nguyên không âm của $x_1 + x_2 + dots + x_k = n$) bằng:
    $ N_2 = upright(C)_(n+k-1)^(k-1) $
]

#method-box(title: "Phương pháp vách ngăn đổi biến")[
  Khi bài toán yêu cầu mỗi biến $x_i >= c_i$ (với $c_i in NN$):
  + Đặt ẩn phụ $y_i = x_i - c_i >= 0$.
  + Phương trình trở thành $y_1 + y_2 + dots + y_k = n - sum_(i=1)^k c_i = n'$.
  + Số nghiệm của bài toán bằng $upright(C)_(n' + k - 1)^(k - 1)$.
]

== 2. Các ví dụ minh họa điển hình
#example-box(title: "Ví dụ 1 (Phân phối phần thưởng & Tìm số nghiệm)")[
  Một thầy giáo có $12$ quyển sách Toán giống nhau cần phát thưởng cho $4$ học sinh giỏi $A, B, C, D$.
  + a) Có bao nhiêu cách chia sao cho học sinh nào cũng nhận được ít nhất 1 quyển sách?
  + b) Có bao nhiêu cách chia sao cho học sinh $A$ nhận ít nhất 2 quyển, học sinh $B$ nhận ít nhất 3 quyển?

  *Lời giải:*
  + a) Gọi số sách chia cho $A, B, C, D$ lần lượt là $x_1, x_2, x_3, x_4 in NN^*$.
    Ta có phương trình: $x_1 + x_2 + x_3 + x_4 = 12$.
    Áp dụng công thức chia kẹo Euler bài toán 1 với $n = 12, k = 4$:
    $ N_1 = upright(C)_(12 - 1)^(4 - 1) = upright(C)_(11)^3 = frac(11 dot 10 dot 9, 6) = 165 text(" (cách)") $

  + b) Với điều kiện $x_1 >= 2, x_2 >= 3, x_3 >= 1, x_4 >= 1$:
    Đặt $y_1 = x_1 - 2 >= 0$, $y_2 = x_2 - 3 >= 0$, $y_3 = x_3 - 1 >= 0$, $y_4 = x_4 - 1 >= 0$.
    Phương trình trở thành:
    $ (y_1 + 2) + (y_2 + 3) + (y_3 + 1) + (y_4 + 1) = 12 <=> y_1 + y_2 + y_3 + y_4 = 5 $
    với $y_i in NN$. Số nghiệm nguyên không âm bằng:
    $ N_2 = upright(C)_(5 + 4 - 1)^(4 - 1) = upright(C)_8^3 = frac(8 dot 7 dot 6, 6) = 56 text(" (cách)") $
]

#practice-box(title: "Bài tập tự luyện")[
  1. Có bao nhiêu số tự nhiên có 4 chữ số $overline(a b c d)$ thỏa mãn điều kiện $a + b + c + d = 9$ và $a >= 1$?
  2. Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 + x_4 = 20$ thỏa mãn $x_1 >= 2, x_2 >= 4, x_3 >= 1, x_4 >= 0$.
]

#summary-box(title: "Đúc kết chuyên đề VIP")[
  - Bài toán vách ngăn là công cụ mạnh nhất để giải các bài toán chia đồ vật giống nhau cho các đối tượng phân biệt.
  - Luôn đưa về ẩn phụ $y_i >= 0$ để áp dụng công thức $upright(C)_(n+k-1)^(k-1)$ nhanh và chính xác.
]

