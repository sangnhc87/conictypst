#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG CHUNG
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

// Định dạng mục lục
#show outline.entry.where(level: 1): it => {
  v(12pt, weak: true)
  strong(it)
}

// ═══════════════════════════════════════════════
// BÌA SÁCH CHÍNH (PHẦN I)
// ═══════════════════════════════════════════════
#{
  let c-bg = rgb("#110022") // Tím cực đậm huyền bí sang trọng
  let c-p1 = rgb("#4A148C") // Tím đậm
  let c-p2 = rgb("#7B1FA2") // Tím violet
  let c-p3 = rgb("#E65100") // Cam hổ phách
  let c-p4 = rgb("#004E89") // Xanh Navy/Ocean
  let c-p5 = rgb("#1A936F") // Xanh ngọc lục bảo

  // Nền toàn trang - offset lề y: 1.8cm, x: 1.4cm
  place(top + left, dx: -1.4cm, dy: -1.8cm, rect(width: 210mm, height: 297mm, fill: c-bg, radius: 0pt))
  // Dải màu trái
  place(top + left, dx: -1.4cm, dy: -1.8cm, rect(width: 7mm, height: 297mm, fill: c-p2, radius: 0pt))
  // Dải 5 màu dưới
  place(bottom + left, dx: -1.4cm, dy: 1.8cm, block(width: 210mm, height: 20mm)[
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      rows: 20mm,
      rect(fill: c-p1, stroke: none),
      rect(fill: c-p2, stroke: none),
      rect(fill: c-p3, stroke: none),
      rect(fill: c-p4, stroke: none),
      rect(fill: c-p5, stroke: none),
    )
  ])

  v(26mm)
  align(center, {
    // Nhãn chuyên đề
    box(
      stroke: 1pt + white.transparentize(50%),
      fill: white.transparentize(85%),
      inset: (x: 18pt, y: 7pt),
      radius: 20pt,
    )[
      #text(fill: white, weight: "bold", size: 10pt, tracking: 0.07em)[
        ◆ BỘ TÀI LIỆU CHUYÊN SÂU HSG & ĐGNL  ·  2025 – 2026
      ]
    ]
    v(1.5em)
    // Công thức trang trí đại diện cho Hàm sinh
    text(fill: white.transparentize(50%), size: 12pt)[
      $G(x) = sum_(n=0)^oo a_n x^n quad "và" quad E(x) = sum_(n=0)^oo frac(a_n, n!) x^n$
    ]
    v(1.4em)
    // Khung tiêu đề chính
    block(
      width: 88%,
      fill: white,
      inset: (top: 0pt, bottom: 22pt, x: 24pt),
      radius: 12pt,
      {
        block(
          width: 100%,
          height: 6pt,
          fill: c-p2,
          radius: (top-left: 12pt, top-right: 12pt, bottom-left: 0pt, bottom-right: 0pt),
        )
        v(1.2em)
        text(size: 26pt, weight: "bold", fill: c-bg)[HÀM SINH]
        linebreak()
        text(size: 14pt, weight: "bold", fill: c-p2)[GENERATING FUNCTIONS]
        linebreak()
        v(0.4em)
        text(size: 16pt, weight: "bold", fill: c-p3)[TỔNG HỢP TRỌN BỘ 2 PHẦN TO LỚN]
        v(0.7em)
        line(length: 100%, stroke: 1.5pt + c-p2.lighten(55%))
        v(0.6em)
        text(size: 10.5pt, style: "italic", fill: rgb("#475569"))[
          Phần I: Lý Thuyết & Bài Toán Cơ Bản | Phần II: 12 Lớp Bài Tập Đại Bác Nâng Cao
        ]
        v(1.2em)
        // Nhãn phần
        grid(
          columns: (1fr, 1fr),
          column-gutter: 15pt,
          block(fill: c-p2, inset: (x: 4pt, y: 7pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 9pt, weight: "bold")[PHẦN I: LÝ THUYẾT & CƠ BẢN]]
          ],
          block(fill: c-p4, inset: (x: 4pt, y: 7pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 9pt, weight: "bold")[PHẦN II: 12 LỚP BÀI NÂNG CAO]]
          ],
        )
      },
    )
    v(2em)
    // Tác giả
    box(stroke: 1pt + white.transparentize(45%), inset: (x: 22pt, y: 13pt), radius: 8pt)[
      #text(fill: white, weight: "bold", size: 13pt)[★ GV Nguyễn Văn Sang]
      #linebreak()
      #text(fill: white.transparentize(30%), size: 10pt)[
        SĐT: 0389.821.115 · Tổ Toán – Thực chiến HSG & ĐGNL
      ]
    ]
  })
}
#pagebreak()

// ═══════════════════════════════════════════════
// MỤC LỤC TRỌN BỘ
// ═══════════════════════════════════════════════
#outline(title: [Mục Lục Trọn Bộ Chuyên Đề], depth: 2, indent: 1.5em)
#pagebreak()

// ═══════════════════════════════════════════════
// NỘI DUNG PHẦN I
// ═══════════════════════════════════════════════
#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("6A1B9A"))
    grid(
      columns: (1fr, auto),
      [Chuyên Đề Hàm Sinh — Phần I: Lý thuyết & Dạng toán cơ bản],
      [GV Nguyễn Văn Sang · 0389.821.115],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("CE93D8"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("6A1B9A"))
    grid(
      columns: (1fr, auto),
      [],
      [Trang #counter(page).display()],
    )
  }
)

#include "CD-HamSinh-GeneratingFunction-content.typ"

// ═══════════════════════════════════════════════
// BÌA NGĂN CÁCH PHẦN II
// ═══════════════════════════════════════════════
#set page(header: none, footer: none)
#pagebreak()

#{
  let c-bg = rgb("#0a192f") // Navy đậm sang trọng
  let c-p1 = rgb("#004E89")
  let c-p2 = rgb("#1A936F")
  let c-p3 = rgb("#E65100")
  let c-p4 = rgb("#6A1B9A")
  let c-p5 = rgb("#C62828")

  // Nền toàn trang - offset lề y: 1.8cm, x: 1.4cm
  place(top + left, dx: -1.4cm, dy: -1.8cm, rect(width: 210mm, height: 297mm, fill: c-bg, radius: 0pt))
  // Dải màu trái
  place(top + left, dx: -1.4cm, dy: -1.8cm, rect(width: 7mm, height: 297mm, fill: c-p2, radius: 0pt))
  // Dải 5 màu dưới
  place(bottom + left, dx: -1.4cm, dy: 1.8cm, block(width: 210mm, height: 20mm)[
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      rows: 20mm,
      rect(fill: c-p1, stroke: none),
      rect(fill: c-p2, stroke: none),
      rect(fill: c-p3, stroke: none),
      rect(fill: c-p4, stroke: none),
      rect(fill: c-p5, stroke: none),
    )
  ])

  v(26mm)
  align(center, {
    // Nhãn chuyên đề
    box(
      stroke: 1pt + white.transparentize(50%),
      fill: white.transparentize(85%),
      inset: (x: 18pt, y: 7pt),
      radius: 20pt,
    )[
      #text(fill: white, weight: "bold", size: 10pt, tracking: 0.07em)[
        ◆ PHẦN II: CHUYÊN ĐỀ TÀI LIỆU NÂNG CAO HSG
      ]
    ]
    v(1.5em)
    // Công thức trang trí đại diện cho Hàm sinh
    text(fill: white.transparentize(50%), size: 12pt)[
      $G(x) = sum_(n=0)^oo a_n x^n quad "và" quad Phi(x_1, dots, x_k) = frac(1, 1 - sum frac(x_i, 1+x_i))$
    ]
    v(1.4em)
    // Khung tiêu đề chính
    block(
      width: 88%,
      fill: white,
      inset: (top: 0pt, bottom: 22pt, x: 24pt),
      radius: 12pt,
      {
        block(
          width: 100%,
          height: 6pt,
          fill: c-p2,
          radius: (top-left: 12pt, top-right: 12pt, bottom-left: 0pt, bottom-right: 0pt),
        )
        v(1.2em)
        text(size: 26pt, weight: "bold", fill: c-bg)[HÀM SINH]
        linebreak()
        text(size: 14pt, weight: "bold", fill: c-p2)[GENERATING FUNCTION]
        linebreak()
        v(0.4em)
        text(size: 16pt, weight: "bold", fill: c-p3)[12 LỚP BÀI TẬP ĐẠI BÁC VẠN NĂNG]
        v(0.7em)
        line(length: 100%, stroke: 1.5pt + c-p2.lighten(55%))
        v(0.6em)
        text(size: 10.5pt, style: "italic", fill: rgb("#475569"))[
          Kỹ thuật chia kẹo Euler · Số Catalan & Stirling · Hàm ẩn Lagrange · Hàm Smirnov
        ]
        v(1.2em)
        // Nhãn phần
        grid(
          columns: (1fr, 1fr, 1fr, 1fr),
          column-gutter: 5pt,
          block(fill: c-p1, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[P.1 - 3]]
          ],
          block(fill: c-p2, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[P.4 - 6]]
          ],
          block(fill: c-p3, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[P.7 - 9]]
          ],
          block(fill: c-p4, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[P.10 - 12]]
          ],
        )
      },
    )
    v(1.8em)
    // Số liệu thống kê
    grid(
      columns: (auto, auto, auto),
      column-gutter: 12pt,
      align: center,
      box(
        fill: white.transparentize(82%),
        stroke: 1pt + white.transparentize(55%),
        inset: (x: 18pt, y: 10pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 17pt)[12]
        #linebreak()
        #text(fill: white.transparentize(30%), size: 9pt, tracking: 0.04em)[DẠNG TOÁN]
      ],
      box(
        fill: white.transparentize(82%),
        stroke: 1pt + white.transparentize(55%),
        inset: (x: 18pt, y: 10pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 17pt)[33]
        #linebreak()
        #text(fill: white.transparentize(30%), size: 9pt, tracking: 0.04em)[BÀI TẬP]
      ],
      box(
        fill: white.transparentize(82%),
        stroke: 1pt + white.transparentize(55%),
        inset: (x: 18pt, y: 10pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 17pt)[12]
        #linebreak()
        #text(fill: white.transparentize(30%), size: 9pt, tracking: 0.04em)[LỚP]
      ],
    )
    v(2.2em)
    // Tác giả
    box(stroke: 1pt + white.transparentize(45%), inset: (x: 22pt, y: 13pt), radius: 8pt)[
      #text(fill: white, weight: "bold", size: 13pt)[★ GV Nguyễn Văn Sang]
      #linebreak()
      #text(fill: white.transparentize(40%), size: 9.5pt)[
        SĐT: 0389.821.115 · Tổ Toán – Bộ tài liệu Thực chiến HSG & ĐGNL
      ]
    ]
  })
}
#pagebreak()

// ═══════════════════════════════════════════════
// NỘI DUNG PHẦN II
// ═══════════════════════════════════════════════
#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("004E89"))
    grid(
      columns: (1fr, auto),
      [Chuyên Đề Hàm Sinh — Phần II: 12 Lớp Bài Tập Nâng Cao & HSG],
      [GV Nguyễn Văn Sang · 0389.821.115],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("004E89"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("004E89"))
    grid(
      columns: (1fr, auto),
      [],
      [Trang #counter(page).display()],
    )
  }
)

#include "CD-HamSinh-LoiBai-NangCao-content.typ"
