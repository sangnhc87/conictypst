// ══════════════════════════════════════════════════════════════════════════
// front.typ — Bìa, lời mở đầu, hướng dẫn, mục lục (Bilingual V2)
// ══════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme.typ": *

// ─── TRANG BÌA ────────────────────────────────────────────────────────────
#page(margin: (x: 0pt, top: 0pt, bottom: 0pt), fill: gradient.linear(
  rgb("#0F172A"),
  rgb("#1E3A5F"),
  rgb("#0D5A5A"),
  angle: 150deg,
))[
  #set par(first-line-indent: 0em)
  #v(2.2cm)
  #align(center)[
    #block(
      fill: white.transparentize(78%),
      inset: (x: 16pt, y: 7pt),
      radius: 20pt,
      stroke: 1pt + white.transparentize(60%),
    )[
      #text(fill: white.transparentize(10%), size: 10pt, weight: "bold", tracking: 4pt)[
        BÉ TƯ DUY TOÁN  •  SMART MATH FOR KIDS
      ]
    ]
    #v(1cm)
    #text(fill: white, size: 38pt, weight: "black")[TOÁN TƯ DUY]
    #v(0.1em)
    #text(fill: rgb("#FDE68A"), size: 17pt, weight: "bold", tracking: 2pt)[MATHEMATICAL THINKING]
    #v(0.4em)
    #text(fill: rgb("#FDE68A"), size: 58pt, weight: "black")[LỚP 2]
    #text(fill: rgb(255, 255, 255, 75%), size: 18pt, weight: "bold")[ \/ Grade 2]
    #v(0.5em)
    #canvas(length: 1cm, {
      import draw: *
      circle((2.5, 2.0), radius: 0.6, fill: rgb("#FDE68A").transparentize(20%), stroke: none)
      content((2.5, 2.0), text(fill: rgb("#1E3A5F"), weight: "black", size: 12pt)[100])
      line((2.1, 1.5), (1.2, 0.7), stroke: 1.5pt + rgb(255, 255, 255, 65%))
      line((2.9, 1.5), (3.8, 0.7), stroke: 1.5pt + rgb(255, 255, 255, 65%))
      circle((1.0, 0.45), radius: 0.5, fill: white.transparentize(72%), stroke: 1.2pt + white.transparentize(40%))
      content((1.0, 0.45), text(fill: white, weight: "bold", size: 11pt)[63])
      circle((4.0, 0.45), radius: 0.5, fill: white.transparentize(72%), stroke: 1.2pt + white.transparentize(40%))
      content((4.0, 0.45), text(fill: white, weight: "bold", size: 11pt)[37])
      rect(
        (6.0, 0.2),
        (10.5, 4.2),
        fill: white.transparentize(85%),
        stroke: 1pt + white.transparentize(55%),
        radius: 0.3,
      )
      content((8.25, 2.5), text(fill: white, size: 9pt)[Singapore Bar Model])
      rect((6.3, 0.6), (10.2, 1.4), fill: white.transparentize(65%), stroke: 0.8pt + white.transparentize(40%))
      rect(
        (6.3, 1.8),
        (8.5, 2.6),
        fill: rgb("#FDE68A").transparentize(50%),
        stroke: 0.8pt + rgb("#FDE68A").transparentize(30%),
      )
      rect((8.5, 1.8), (10.2, 2.6), fill: white.transparentize(75%), stroke: (
        paint: rgb("#FDE68A"),
        dash: "dashed",
        thickness: 0.8pt,
      ))
      content((9.35, 2.2), text(fill: rgb("#FDE68A"), weight: "bold", size: 10pt)[?])
    })
    #v(0.4em)
    #block(fill: rgb("#FDE68A"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
      #text(fill: rgb("#1E3A5F"), weight: "black", size: 13pt)[📚 QUYỂN I — VOLUME I]
    ]
    #v(0.8cm)
    #block(
      width: 68%,
      fill: white.transparentize(82%),
      stroke: 1.5pt + white.transparentize(55%),
      inset: (x: 20pt, y: 14pt),
      radius: 12pt,
    )[
      #grid(
        columns: (auto, 1fr),
        row-gutter: 10pt,
        column-gutter: 8pt,
        align(horizon, text(fill: white, size: 10pt)[👤 Tên / Name:]),
        rect(height: 1.4em, fill: white.transparentize(88%), stroke: (bottom: 1.5pt + white.transparentize(30%)))[],

        align(horizon, text(fill: white, size: 10pt)[🏫 Lớp / Class:]),
        rect(height: 1.4em, fill: white.transparentize(88%), stroke: (bottom: 1.5pt + white.transparentize(30%)))[],
      )
    ]
  ]
  #v(1.5cm)
]

// ─── TRANG 2: LỜI NÓI ĐẦU ────────────────────────────────────────────────
#page(fill: C-CREAM)[
  #set par(first-line-indent: 0em)
  #align(center)[
    #text(fill: C-SKY, size: 16pt, weight: "black")[💌 Lời Nói Đầu — Preface]
    #v(0.3em)
    #line(length: 40%, stroke: 1.5pt + C-LIGHT)
  ]
  #v(0.8em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 16pt,
    block(fill: rgb("#EFF6FF"), stroke: (left: 4pt + C-BLUE), inset: 14pt, radius: (right: 8pt))[
      #text(fill: C-BLUE, weight: "bold", size: 11pt)[🇻🇳 Gửi bé yêu]
      #v(0.5em)
      #set text(size: 10.5pt)
      Quyển sách này được thiết kế theo phương pháp *Singapore* và *Nhật Bản* — hai nền giáo dục toán hàng đầu thế giới.

      *Ba lớp học:*
      #v(0.2em)
      ➀ *Hiểu* — học qua hình ảnh \
      ➁ *Luyện* — thực hành qua bài tập \
      ➂ *Tư duy* — thách thức trí tuệ

      Tiếng Anh được tích hợp *tự nhiên* — con tiếp xúc dần mà không hay biết!
    ],
    block(fill: rgb("#F0FDF4"), stroke: (left: 4pt + C-GREEN), inset: 14pt, radius: (right: 8pt))[
      #text(fill: C-GREEN, weight: "bold", size: 11pt)[🌏 Dear Young Learner]
      #v(0.5em)
      #set text(size: 10.5pt)
      This book uses *Singapore Math* and *Japanese Math* methods — two of the world's best systems.

      *Three learning layers:*
      #v(0.2em)
      ➀ *Understand* — learn with pictures \
      ➁ *Practice* — solve exercises \
      ➂ *Think Deep* — brain challenges

      Vietnamese is primary. English words appear naturally so you get used to them!
    ],
  )
  #v(0.8em)
  #grid(
    columns: (4 * (1fr,)),
    gutter: 8pt,
    block(fill: C-CH.at(0).lighten(88%), inset: 10pt, radius: 8pt, stroke: 1pt + C-CH.at(0))[
      #align(center)[#text(size: 22pt)[🔢] #v(0.2em) #text(
          fill: C-CH.at(0),
          weight: "bold",
          size: 9pt,
        )[Số đến 1 000\ Numbers to 1000]]
    ],
    block(fill: C-CH.at(1).lighten(88%), inset: 10pt, radius: 8pt, stroke: 1pt + C-CH.at(1))[
      #align(center)[#text(size: 22pt)[➕] #v(0.2em) #text(
          fill: C-CH.at(1),
          weight: "bold",
          size: 9pt,
        )[Cộng & Trừ\ Addition & Sub.]]
    ],
    block(fill: C-CH.at(2).lighten(88%), inset: 10pt, radius: 8pt, stroke: 1pt + C-CH.at(2))[
      #align(center)[#text(size: 22pt)[✖️] #v(0.2em) #text(
          fill: C-CH.at(2),
          weight: "bold",
          size: 9pt,
        )[Nhân & Chia\ Mul. & Division]]
    ],
    block(fill: C-CH.at(3).lighten(88%), inset: 10pt, radius: 8pt, stroke: 1pt + C-CH.at(3))[
      #align(center)[#text(size: 22pt)[📐] #v(0.2em) #text(
          fill: C-CH.at(3),
          weight: "bold",
          size: 9pt,
        )[Hình & Đo\ Geo & Measure]]
    ],
  )
  #v(0.8em)
  #block(fill: rgb("#FFFDE7"), stroke: (left: 4pt + C-GOLD), inset: 14pt, radius: (right: 8pt), width: 100%)[
    #text(fill: C-GOLD, weight: "bold", size: 11pt)[⭐ Hướng dẫn — How to Use]
    #v(0.4em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 10pt,
      [
        #set text(size: 9.5pt)
        - 📘 *LÝ THUYẾT*: Đọc và hiểu / Read & learn
        - 🟢 *VÍ DỤ*: Xem ví dụ mẫu / Study examples
        - 🟠 *BÀI TẬP*: Tự làm bài / Do it yourself
      ],
      [
        #set text(size: 9.5pt)
        - 🧠 *NÂNG CAO*: Thách thức tư duy / Think deeper
        - 💭 *SUY NGHĨ*: Câu hỏi mở / Open questions
        - 🔍 *TÌM LỖI*: Tìm lỗi sai / Find mistakes
      ],
    )
  ]
]

// ─── TRANG 3-4: MỤC LỤC ──────────────────────────────────────────────────
#page(fill: C-CREAM)[
  #set par(first-line-indent: 0em)
  #align(center)[
    #text(fill: C-SKY, size: 16pt, weight: "black")[📋 Mục Lục — Table of Contents]
    #v(0.3em)
    #line(length: 40%, stroke: 1.5pt + C-LIGHT)
  ]
  #v(0.8em)

  #let toc-row(so-ch, ten-vi, ten-en, icon, c, bai-list, trang) = {
    v(0.35em)
    block(
      fill: c.lighten(92%),
      stroke: (left: 5pt + c),
      inset: (left: 14pt, right: 12pt, y: 10pt),
      radius: (right: 8pt),
      width: 100%,
    )[
      #grid(
        columns: (1fr, auto),
        [
          #text(fill: c, weight: "black", size: 12pt)[#icon Chương #so-ch: #ten-vi]
          #v(0.1em)
          #text(fill: C-MID, size: 9pt, style: "italic")[Chapter #so-ch: #ten-en]
          #v(0.3em)
          #text(size: 9pt, fill: C-MID)[#bai-list]
        ],
        align(horizon + right)[
          #block(fill: c, inset: (x: 10pt, y: 5pt), radius: 6pt)[
            #text(fill: white, weight: "bold", size: 11pt)[tr. #trang]
          ]
        ],
      )
    ]
  }

  #toc-row(
    1,
    "Số Đến 1 000",
    "Numbers to 1 000",
    "🔢",
    C-CH.at(0),
    "Bài 1: Đọc-viết số • Bài 2: Tia số, so sánh • Bài 3: Số chẵn/lẻ, quy luật • Bài 4: Ước lượng",
    5,
  )

  #toc-row(
    2,
    "Cộng và Trừ",
    "Addition & Subtraction",
    "➕",
    C-CH.at(1),
    "Bài 5–6: Cộng có/không nhớ • Bài 7–8: Trừ có/không mượn • Bài 9: Toán đố (Bar Model)",
    23,
  )

  #toc-row(
    3,
    "Nhân và Chia",
    "Multiplication & Division",
    "✖️",
    C-CH.at(2),
    "Bài 10: Ý nghĩa nhân • Bài 11–12: Bảng nhân 2–5 • Bài 13–14: Phép chia & toán đố",
    43,
  )

  #toc-row(
    4,
    "Hình Học",
    "Geometry",
    "📐",
    C-CH.at(3),
    "Bài 15: Điểm, đoạn thẳng • Bài 16: Tam giác, tứ giác • Bài 17–18: HCN, HV, chu vi",
    62,
  )

  #toc-row(5, "Đo Lường", "Measurement", "📏", C-CH.at(4), "Bài 19: dm & m • Bài 20: Giờ, phút • Bài 21: kg, lít", 79)

  #v(0.5em)
  #block(
    fill: C-PURPLE.lighten(90%),
    stroke: (left: 5pt + C-PURPLE),
    inset: (left: 14pt, right: 12pt, y: 10pt),
    radius: (right: 8pt),
    width: 100%,
  )[
    #grid(
      columns: (1fr, auto),
      [
        #text(fill: C-PURPLE, weight: "black", size: 12pt)[🎓 Ôn Tập & Phụ Lục — Review & Appendix]
        #v(0.3em)
        #text(
          size: 9pt,
          fill: C-MID,
        )[Ôn tập tổng hợp (40 câu) • Bảng cửu chương 2→5 • Góc học Singapore–Nhật • Từ vựng Anh–Việt • Chứng nhận]
      ],
      align(horizon + right)[
        #block(fill: C-PURPLE, inset: (x: 10pt, y: 5pt), radius: 6pt)[
          #text(fill: white, weight: "bold", size: 11pt)[tr. 90]
        ]
      ],
    )
  ]
]
