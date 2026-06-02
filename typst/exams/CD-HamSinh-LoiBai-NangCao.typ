#import "../sang-exam.typ": *
#import "../template.typ": *

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("001F3F"), rgb("003366"), rgb("004E89"), rgb("1A936F"), angle: 135deg),
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
  stroke: (left: 4pt + rgb("004E89")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("004E89"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("1A936F"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Màu chủ đề ──────────────────────────────────────────────
#let col-navy = rgb("003366")
#let col-ocean = rgb("004E89")
#let col-teal = rgb("1A936F")
#let col-amber = rgb("E65100")
#let col-green = rgb("2E7D32")
#let col-red = rgb("C62828")
#let col-violet = rgb("6A1B9A")
#let col-pink = rgb("880E4F")
#let col-purple = rgb("4A148C")
#let col-blue = rgb("1565C0")

// ─── Hộp Lý Thuyết ───────────────────────────────────────────
#let rev-box(title: none, body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-ocean, rest: 0.8pt + rgb("90CAF9")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-ocean, size: 11pt, weight: "bold")[#title]
    #v(0.4em)
  ]
  #body
]

#let eg-box(title: "🎯 Ví Dụ Trực Quan", body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: col-green, weight: "bold")[#title] #v(0.3em) #body]

#let note-box(title: "📌 Nhận Xét", body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFCC80")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: col-amber, weight: "bold")[#title] #v(0.3em) #body]

#let ans-box(body) = block(
  fill: rgb("F1F8E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: col-green, weight: "bold")[✅ Kết Luận] #v(0.3em) #body]

#let warn-box(body) = block(
  fill: rgb("FFEBEE"),
  stroke: (left: 4pt + col-red, rest: 0.6pt + rgb("EF9A9A")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: col-red, weight: "bold")[⚠️ Chú Ý — Bẫy Thường Gặp] #v(0.3em) #body]

#let cach1-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[#text(fill: col-blue, weight: "bold", size: 10.5pt)[🔵 Cách 1 — Tổ Hợp / Đại Số Thuần Túy] #v(0.3em) #body]

#let cach2-box(body) = block(
  fill: rgb("F3E5F5"),
  stroke: (left: 4pt + col-violet, rest: 0.5pt + rgb("CE93D8")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[#text(fill: col-violet, weight: "bold", size: 10.5pt)[🟣 Cách 2 — Hàm Sinh (Generating Function)] #v(0.3em) #body]

#let method-box(body) = block(
  fill: rgb("E0F7FA"),
  stroke: (left: 4pt + col-teal, rest: 0.5pt + rgb("80DEEA")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: col-teal, weight: "bold")[⚙️ Quy Trình Dựng Hàm Sinh] #v(0.3em) #body]

#let thm-box(title: "📐 Định Lý / Công Thức Cốt Lõi", body) = block(
  fill: rgb("FCE4EC"),
  stroke: (left: 5pt + col-pink, rest: 0.8pt + rgb("F48FB1")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 13pt),
  width: 100%,
)[
  #text(fill: col-pink, size: 11pt, weight: "bold")[#title]
  #v(0.4em)
  #body
]

// ════════════════════════════════════════════════════════════════════
// BÌA SÁCH / BÌA CHUYÊN ĐỀ
// ════════════════════════════════════════════════════════════════════
#{
  let c-book = rgb("#0a192f") // Navy đậm sang trọng
  let c-p1 = rgb("#004E89")
  let c-p2 = rgb("#1A936F")
  let c-p3 = rgb("#E65100")
  let c-p4 = rgb("#6A1B9A")
  let c-p5 = rgb("#C62828")

  // Nền toàn trang - offset lề y: 1.8cm, x: 1.4cm
  place(top + left, dx: -1.4cm, dy: -1.8cm, rect(width: 210mm, height: 297mm, fill: c-book, radius: 0pt))
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
        ◆ CHUYÊN ĐỀ TOÁN 12  ·  2025 – 2026
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
        text(size: 26pt, weight: "bold", fill: c-book)[HÀM SINH]
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
        Tổ Toán – Bộ tài liệu Thực chiến HSG & ĐGNL
      ]
    ]
  })
  pagebreak()
}

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
