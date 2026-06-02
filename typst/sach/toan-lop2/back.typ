// ══════════════════════════════════════════════════════════════════════════
// back.typ — PHỤ LỤC  /  Appendix & Back Matter
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme.typ": *

= Phụ Lục — Appendix

// ══════════════════════════════════════════════════════════════════════════
// A. TỪ ĐIỂN TOÁN HỌC / MATH DICTIONARY
// ══════════════════════════════════════════════════════════════════════════

#block(
  width: 100%,
  fill: C-DARK,
  inset: (x: 16pt, y: 12pt),
  radius: 10pt,
)[
  #set text(fill: white)
  #align(center)[
    #text(size: 16pt, weight: "black")[📖 Từ Điển Toán Học]
    #h(1em)
    #text(size: 14pt, fill: C-GOLD)[Mathematics Dictionary]
  ]
]

#v(0.5em)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  // Column 1
  table(
    columns: (auto, 1fr),
    inset: (x: 10pt, y: 7pt),
    stroke: 0.8pt + C-LIGHT,
    fill: (x, y) => if y == 0 { C-DARK } else if calc.even(y) { C-CREAM } else { white },
    [#text(fill: white, weight: "bold")[Tiếng Việt]], [#text(fill: white, weight: "bold")[English]],
    [số], [number],
    [chữ số], [digit],
    [số lẻ / số chẵn], [odd / even number],
    [tổng], [sum],
    [hiệu], [difference],
    [tích], [product],
    [thương], [quotient],
    [phép cộng], [addition],
    [phép trừ], [subtraction],
    [phép nhân], [multiplication],
    [phép chia], [division],
    [thừa số], [factor],
    [số hạng], [addend],
    [số bị trừ], [minuend],
    [số trừ], [subtrahend],
    [số bị chia], [dividend],
    [số chia], [divisor],
    [số dư], [remainder],
    [bằng], [equal (=)],
    [lớn hơn], [greater than (>)],
  ),
  // Column 2
  table(
    columns: (auto, 1fr),
    inset: (x: 10pt, y: 7pt),
    stroke: 0.8pt + C-LIGHT,
    fill: (x, y) => if y == 0 { C-DARK } else if calc.even(y) { C-CREAM } else { white },
    [#text(fill: white, weight: "bold")[Tiếng Việt]], [#text(fill: white, weight: "bold")[English]],
    [nhỏ hơn], [less than (<)],
    [điểm], [point],
    [đoạn thẳng], [line segment],
    [đường thẳng], [line],
    [tam giác], [triangle],
    [tứ giác], [quadrilateral],
    [hình chữ nhật], [rectangle],
    [hình vuông], [square],
    [cạnh], [side],
    [đỉnh], [vertex],
    [góc vuông], [right angle],
    [chu vi], [perimeter],
    [độ dài], [length],
    [mét (m)], [metre],
    [ki-lô-gam (kg)], [kilogram],
    [gam (g)], [gram],
    [lít (L)], [litre],
    [giờ], [hour],
    [phút], [minute],
    [ước lượng], [estimate],
  ),
)

#pagebreak()

// ══════════════════════════════════════════════════════════════════════════
// B. BẢNG CỬU CHƯƠNG / TIMES TABLES POSTER
// ══════════════════════════════════════════════════════════════════════════

#block(
  width: 100%,
  fill: gradient.linear(C-TEAL, C-BLUE, angle: 45deg),
  inset: (x: 16pt, y: 12pt),
  radius: 10pt,
)[
  #align(center)[#text(size: 16pt, weight: "black", fill: white)[🔢 Bảng Cửu Chương  /  Times Tables (×2 to ×5)]]
]

#v(0.6em)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 10pt,
  // × 2
  block(fill: C-TEAL.lighten(85%), stroke: 2pt + C-TEAL, inset: 12pt, radius: 8pt)[
    #align(center)[#text(fill: C-TEAL, weight: "black", size: 13pt)[× 2]]
    #v(0.4em)
    #for i in range(1, 11) [
      #text(size: 10.5pt)[2 × #i = #text(weight: "bold")[#str(2 * i)]] \
    ]
  ],
  // × 3
  block(fill: C-ORANGE.lighten(85%), stroke: 2pt + C-ORANGE, inset: 12pt, radius: 8pt)[
    #align(center)[#text(fill: C-ORANGE, weight: "black", size: 13pt)[× 3]]
    #v(0.4em)
    #for i in range(1, 11) [
      #text(size: 10.5pt)[3 × #i = #text(weight: "bold")[#str(3 * i)]] \
    ]
  ],
  // × 4
  block(fill: C-PURPLE.lighten(85%), stroke: 2pt + C-PURPLE, inset: 12pt, radius: 8pt)[
    #align(center)[#text(fill: C-PURPLE, weight: "black", size: 13pt)[× 4]]
    #v(0.4em)
    #for i in range(1, 11) [
      #text(size: 10.5pt)[4 × #i = #text(weight: "bold")[#str(4 * i)]] \
    ]
  ],
  // × 5
  block(fill: C-GREEN.lighten(85%), stroke: 2pt + C-GREEN, inset: 12pt, radius: 8pt)[
    #align(center)[#text(fill: C-GREEN, weight: "black", size: 13pt)[× 5]]
    #v(0.4em)
    #for i in range(1, 11) [
      #text(size: 10.5pt)[5 × #i = #text(weight: "bold")[#str(5 * i)]] \
    ]
  ],
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════════════════
// C. ÔN TẬP TỔNG HỢP / COMPREHENSIVE REVIEW
// ══════════════════════════════════════════════════════════════════════════

#block(
  width: 100%,
  fill: gradient.linear(C-CH.at(0), C-CH.at(2), angle: 45deg),
  inset: (x: 16pt, y: 12pt),
  radius: 10pt,
)[
  #align(center)[#text(size: 15pt, weight: "black", fill: white)[🎯 Ôn Tập Tổng Hợp  /  Comprehensive Review]]
]

#v(0.5em)

#block(fill: C-CREAM, stroke: 1.5pt + C-GOLD, inset: 14pt, radius: 8pt, width: 100%)[
  #set par(first-line-indent: 0em)
  *Phần A — Tính (Calculate):* #text(fill: C-MID, size: 9.5pt)[(1 điểm mỗi câu)]

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 8pt,
    [1. 487 + 356 = #o-so()], [2. 900 - 348 = #o-so()], [3. 7 × 8 = #o-so()], [4. 63 ÷ 9 = #o-so()],
    [5. 5 × 6 + 8 = #o-so()], [6. 100 - 5 × 9 = #o-so()], [7. 4 × (5 + 3) = #o-so()], [8. 72 ÷ 8 - 4 = #o-so()],
  )
]

#v(0.5em)

#block(fill: C-MINT, stroke: 1.5pt + C-GREEN, inset: 14pt, radius: 8pt, width: 100%)[
  #set par(first-line-indent: 0em)
  *Phần B — Điền vào chỗ trống (Fill in blanks):* #text(fill: C-MID, size: 9.5pt)[(1 điểm mỗi câu)]

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    [9. x + 275 = 600 → x = #o-so()], [10. 5 × y = 45 → y = #o-so()], [11. 500 - z = 187 → z = #o-so()],
  )

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 8pt,
    [12. 5 m = #o-so() dm], [13. 3 kg = #o-so() g], [14. #o-so() dm = 80 cm], [15. 4 500 g = #o-so() kg #o-so() g],
  )
]

#v(0.5em)

#block(fill: C-LAVENDER, stroke: 1.5pt + C-PURPLE, inset: 14pt, radius: 8pt, width: 100%)[
  #set par(first-line-indent: 0em)
  *Phần C — So sánh (Compare) #_blank means >, < or =:* #text(fill: C-MID, size: 9.5pt)[(1 điểm mỗi câu)]

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 8pt,
    [16. 456 #_blank 465], [17. 3 m #_blank 29 dm], [18. 2 kg #_blank 1 999 g], [19. 5 × 4 #_blank 4 × 6],
  )
]

#v(0.5em)

#block(fill: C-PEACH, stroke: 1.5pt + C-ORANGE, inset: 14pt, radius: 8pt, width: 100%)[
  #set par(first-line-indent: 0em)
  *Phần D — Toán đố (Word problems):* #text(fill: C-MID, size: 9.5pt)[(3 điểm mỗi câu)]

  *Câu 20:* 🏫 Sân trường hình chữ nhật dài *45 m*, rộng *30 m*. Tính chu vi sân? Nếu rào xung quanh, cần bao nhiêu mét dây rào?
  #o-tra-loi(h: 3.5cm, label: "Bài giải:")

  *Câu 21:* 🛍️ Mẹ có *500 000 đồng*. Mua 3 kg thịt, mỗi kg *85 000 đồng*. Còn lại bao nhiêu tiền?
  #o-tra-loi(h: 3.5cm, label: "Bài giải:")

  *Câu 22:* 🧩 Số học sinh lớp A gấp *3 lần* lớp B. Tổng hai lớp *48 em*. Mỗi lớp có bao nhiêu em?
  #o-tra-loi(h: 3.5cm, label: "Bài giải:")
]

#pagebreak()

// ══════════════════════════════════════════════════════════════════════════
// D. BẢNG THEO DÕI KỸ NĂNG / SKILLS TRACKER
// ══════════════════════════════════════════════════════════════════════════

#block(
  width: 100%,
  fill: gradient.linear(C-TEAL, C-GREEN, angle: 45deg),
  inset: (x: 16pt, y: 12pt),
  radius: 10pt,
)[
  #align(center)[#text(size: 15pt, weight: "black", fill: white)[✅ Theo Dõi Kỹ Năng  /  Skills Tracker]]
]

#v(0.6em)
#text(
  fill: C-MID,
  size: 10pt,
)[Tô màu hoặc đánh dấu ✓ khi em đã thành thạo kỹ năng! / Color or tick ✓ when you have mastered the skill!]
#v(0.4em)

#table(
  columns: (auto, 1fr, 2cm, 2cm, 2cm),
  inset: (x: 10pt, y: 8pt),
  stroke: 0.8pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-DARK } else if x == 0 { C-LIGHT } else if calc.even(y) { C-CREAM } else { white },
  [#text(fill: white, weight: "bold")[Chương]],
  [#text(fill: white, weight: "bold")[Kỹ năng / Skill]],
  [#text(fill: white, weight: "bold")[Cần thêm 🔄]],
  [#text(fill: white, weight: "bold")[Gần được 📈]],
  [#text(fill: white, weight: "bold")[Xuất sắc ⭐]],

  [Ch. 1], [Đọc và viết số đến 1 000 / Read & write numbers to 1000], [], [], [],
  [Ch. 1], [So sánh và sắp xếp số / Compare & order numbers], [], [], [],
  [Ch. 2], [Cộng không nhớ / Add without carrying], [], [], [],
  [Ch. 2], [Cộng có nhớ / Add with carrying], [], [], [],
  [Ch. 2], [Trừ không mượn / Subtract without borrowing], [], [], [],
  [Ch. 2], [Trừ có mượn / Subtract with borrowing], [], [], [],
  [Ch. 3], [Bảng nhân 2, 3, 4, 5 / Times tables 2–5], [], [], [],
  [Ch. 3], [Bảng chia từ nhân / Division from multiplication], [], [], [],
  [Ch. 4], [Nhận biết hình tam giác, tứ giác / Identify shapes], [], [], [],
  [Ch. 4], [Tính chu vi / Calculate perimeter], [], [], [],
  [Ch. 5], [Đổi đơn vị độ dài / Convert length units], [], [], [],
  [Ch. 5], [Đọc đồng hồ / Tell time], [], [], [],
  [Ch. 5], [Đổi kg và g / Convert kg & g], [], [], [],
  [Tất cả], [Giải toán đố với mô hình thanh / Bar model word problems], [], [], [],
)

#v(1em)

*Nhận xét của phụ huynh / Parent Comments:*
#dong-viet(n: 3)

#pagebreak()

// ══════════════════════════════════════════════════════════════════════════
// E. HỌC KIỂU SINGAPORE–NHẬT TẠI NHÀ
// ══════════════════════════════════════════════════════════════════════════

#block(
  width: 100%,
  fill: gradient.linear(C-BLUE, C-TEAL, angle: 45deg),
  inset: (x: 16pt, y: 12pt),
  radius: 10pt,
)[
  #align(center)[#text(size: 15pt, weight: "black", fill: white)[🌏 Góc Học Kiểu Singapore–Nhật Tại Nhà]]
]

#v(0.6em)

#goc-dong-hanh[
  *5 thói quen nhỏ nhưng rất mạnh khi dạy con lớp 2:*
  #v(0.3em)
  #for item in (
    "Cho con *đoán trước* kết quả lớn hay nhỏ, đúng hay chưa hợp lý.",
    "Bảo con *nói lại đề bài bằng lời của mình* trước khi tính.",
    "Hỏi: *Có cần vẽ sơ đồ thanh, chấm tròn, hoặc nhóm đồ vật không?*",
    "Khi làm xong, hỏi thêm: *Con có cách thứ hai không?*",
    "Cuối cùng, yêu cầu con *giải thích vì sao đáp án đúng* bằng 1–2 câu ngắn.",
  ) {
    [• #item \ ]
  }
]

#v(0.5em)

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  so-do-thanh-goi-y[
    *Khi nào nên dùng mô hình?*
    #v(0.2em)
    - *Số nhỏ, tách-gộp nhanh* → dùng *number bond*.
    - *Bài toán có lời, có tổng hoặc phần chưa biết* → dùng *sơ đồ thanh*.
    - *Bài gấp 2, gấp 3* → dùng *nhiều phần bằng nhau*.

    #v(0.4em)
    *Mẫu 1 — Tách và gộp nhanh*
    #align(center)[#number-bond(total: "27", a: "12", b: "?")]

    #v(0.3em)
    *Mẫu 2 — Biết tổng, tìm phần còn thiếu*
    #align(center)[
      #bar-model(
        label-total: "35",
        parts: (
          (label: "14", w: 4.0),
          (label: "?", w: 5.7),
        ),
        bw: 9.7,
      )
    ]

    #v(0.3em)
    *Mẫu 3 — Gấp nhiều lần*
    #align(center)[
      #bar-model(
        label-total: "?",
        parts: (
          (label: "6", w: 2.3),
          (label: "6", w: 2.3),
          (label: "6", w: 2.3),
        ),
        bw: 6.9,
      )
    ]
  ],
  cau-hoi-mo[
    *1.* Tổng là *40*. Hãy tìm *3 cặp số khác nhau* có tổng bằng 40.
    #dong-viet(n: 1)

    *2.* Một số có *3 chữ số*, tổng các chữ số bằng *9*, hàng trăm lớn hơn hàng đơn vị. Em tìm được mấy số?
    #dong-viet(n: 1)

    *3.* Em hãy vẽ sơ đồ thanh cho bài toán:
    "Lan có *14* nhãn vở. Mai nhiều hơn Lan *6* nhãn vở. Hỏi Mai có bao nhiêu nhãn vở?"
    #o-tra-loi(h: 2.4cm, label: "Vẽ hoặc giải tại đây:")

    *4.* Em có thể tính *48 + 27* bằng *2 cách khác nhau* không?
    #o-tra-loi(h: 2.2cm, label: "Cách 1 và Cách 2:")
  ],
)

#v(0.6em)

#block(fill: rgb("#F8FAFC"), stroke: 1.2pt + C-LIGHT, inset: 14pt, radius: 10pt, width: 100%)[
  #set par(first-line-indent: 0em)
  #text(fill: C-BLUE, weight: "bold", size: 10.5pt)[🕒 Nhịp Học 15 Phút Mỗi Ngày / 15-minute Home Routine]
  #v(0.4em)
  #table(
    columns: (1.2fr, 1.8fr, 1.8fr),
    inset: (x: 8pt, y: 7pt),
    align: left + horizon,
    stroke: 0.7pt + C-LIGHT,
    fill: (x, y) => if y == 0 { C-BLUE.lighten(85%) } else if calc.even(y) { C-CREAM } else { white },
    [*Bước*], [*Người lớn hỏi gì?*], [*Con làm gì?*],
    [1. Nhìn], [Con đoán kết quả lớn hay nhỏ?], [Ước lượng nhanh bằng lời],
    [2. Vẽ], [Có nên vẽ sơ đồ hay number bond không?], [Chọn một hình để biểu diễn],
    [3. Giải], [Có cách nào ngắn hơn hoặc gọn hơn không?], [Làm bài và thử thêm một cách nếu được],
    [4. Nói], [Vì sao con tin đáp án đúng?], [Nói lại bằng câu đầy đủ],
  )
]

#pagebreak()

// ══════════════════════════════════════════════════════════════════════════
// F. CERTIFICATE
// ══════════════════════════════════════════════════════════════════════════

#align(center)[
  #block(
    width: 90%,
    stroke: (paint: C-GOLD, thickness: 4pt),
    radius: 16pt,
    inset: 30pt,
    fill: gradient.radial(C-CREAM, white, radius: 85%),
  )[
    #canvas(length: 1cm, {
      import draw: *
      // Stars decoration
      let star-pts = (
        (-0.5, 0),
        (-0.15, 0.4),
        (0.5, 0.4),
        (0, 0.7),
        (0.15, 1.2),
        (-0.5, 0.9),
        (-1.15, 1.2),
        (-1.0, 0.7),
        (-1.5, 0.4),
        (-0.85, 0.4),
      )
      for sx in (1, 3, 5, 7, 9, 11, 13, 15) {
        content((sx, 0), text(size: 18pt, fill: C-GOLD)[★])
      }
    })

    #text(size: 10pt, fill: C-GOLD, tracking: 4pt)[CHỨNG NHẬN HOÀN THÀNH — CERTIFICATE OF COMPLETION]

    #v(0.5em)
    #text(size: 26pt, weight: "black", fill: C-DARK)[🏆 Bé Giỏi Toán 🏆]
    #v(0.2em)
    #text(size: 15pt, style: "italic", fill: C-MID)[*Young Mathematics Champion*]

    #v(0.8em)
    #text(size: 12pt)[Chứng nhận em:]
    #v(0.3em)
    #box(width: 8cm, stroke: (bottom: 2pt + C-DARK))[]
    #v(0.2em)
    #text(size: 10pt, fill: C-MID)[Họ và tên học sinh / Student Name]

    #v(0.6em)
    #text(size: 11pt)[đã hoàn thành xuất sắc]
    #v(0.2em)
    #text(size: 13pt, weight: "bold", fill: C-CH.at(0))[Toán Lớp 2 — Quyển I]
    #v(0.15em)
    #text(size: 11pt, fill: C-BLUE, style: "italic")[Grade 2 Mathematics — Volume I]

    #v(0.8em)
    #grid(
      columns: (1fr, auto, 1fr),
      gutter: 10pt,
      align(center)[
        #box(width: 5cm, stroke: (bottom: 1.5pt + C-MID))[]
        #v(0.15em)
        #text(size: 9pt, fill: C-MID)[Chữ ký phụ huynh / Parent Signature]
      ],
      [
        #canvas(length: 1cm, {
          import draw: *
          circle((1.5, 1.5), radius: 1.5, stroke: 2pt + C-GOLD, fill: none)
          content((1.5, 1.5), text(size: 10pt, weight: "bold", fill: C-GOLD)[CON DẤU\ SEAL])
        })
      ],
      align(center)[
        #box(width: 5cm, stroke: (bottom: 1.5pt + C-MID))[]
        #v(0.15em)
        #text(size: 9pt, fill: C-MID)[Ngày / Date: \_\_\_/\_\_\_/\_\_\_]
      ],
    )

    #v(0.6em)
    #canvas(length: 1cm, {
      import draw: *
      for sx in (1, 3, 5, 7, 9, 11, 13, 15) {
        content((sx, 0), text(size: 18pt, fill: C-GOLD)[★])
      }
    })
  ]
]

#v(1em)

#align(center)[
  #block(fill: C-DARK, inset: (x: 20pt, y: 12pt), radius: 8pt)[
    #text(fill: white, size: 10pt)[
      *Toán Lớp 2 — Quyển I* | Nhà xuất bản tự học | In 2025
      #h(1em) | #h(1em)
      *Grade 2 Maths — Volume I* | Self-Learning Press | 2025
    ]
  ]
]
