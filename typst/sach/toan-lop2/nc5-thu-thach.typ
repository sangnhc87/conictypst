// ══════════════════════════════════════════════════════════════════════════
// nc5-thu-thach.typ — Chương 5: Thử Thách Tư Duy / Thinking Challenges
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

#chuong-header-nc(
  so: 5,
  ten-vi: "Thử Thách Tư Duy",
  ten-en: "Thinking Challenges",
  icon: "🏆",
  so-bai: "4",
  so-trang: "18",
)

#muc-tieu((
  [Giải toán mật mã (mỗi chữ cái là một chữ số) — Solve cryptarithmetic puzzles],
  [Hoàn thành lưới logic 4×4 — Complete 4×4 logic grids],
  [Đếm số cách sắp xếp và tổ hợp đơn giản — Count arrangements and simple combinations],
  [Giải các bài toán Olympic cấp độ lớp 2 — Solve Grade 2 Olympiad-level problems],
))

// ══════════════════════════════════════════════════════════════════════════
// BÀI 20: TOÁN MẬT MÃ / CRYPTARITHMETIC
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "20",
  ten-vi: "Toán Mật Mã",
  ten-en: "Cryptarithmetic Puzzles",
  icon: "🔐",
  kho: 4,
  c: C-CH-NC.at(4),
)

#ly-thuyet(title: "TOÁN MẬT MÃ — CRYPTARITHMETIC")[
  Mỗi *chữ cái* đại diện cho một *chữ số* từ 0–9. Các chữ cái *khác nhau* đại diện cho *chữ số khác nhau*. \
  _Each letter represents a different digit 0–9. Same letter = same digit, different letters = different digits._

  #v(0.5em)
  #block(fill: C-CH-NC.at(4).lighten(88%), stroke: 2pt + C-CH-NC.at(4), inset: 14pt, radius: 8pt)[
    #set text(size: 11pt)
    #align(center)[
      #text(weight: "black")[
        #grid(
          columns: (auto,),
          align: right,
          [S E N D],
          [+ M O R E],
          line(length: 100%, stroke: 2pt + C-CH-NC.at(4)),
          [M O N E Y],
        )
      ]
    ]
    #v(0.3em)
    #text(size: 9.5pt)[_Đây là bài toán mật mã nổi tiếng nhất thế giới! (Lớp 2 làm phiên bản đơn giản hơn.)_]
  ]
]

#bt-label(so: "37", title: "⭐⭐⭐ Giải mật mã — Crack the code")

*Phiên bản dễ:*

Biết A, B, C là các chữ số khác nhau. Tìm A, B, C:

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  block[
    *a)*
    #block(fill: C-CH-NC.at(4).lighten(90%), stroke: 1.5pt + C-CH-NC.at(4), inset: 12pt, radius: 8pt)[
      #align(center)[
        #text(weight: "bold", size: 14pt)[
          A B \
          + A B \
          #line(length: 100%, stroke: 1.5pt + C-DARK) \
          B A
        ]
      ]
    ]
    #v(0.5em)
    _Gợi ý: A+A = ? và B+B = ?_
    #dong-viet(n: 2)
    A = \_\_\_\_, B = \_\_\_\_
  ],
  block[
    *b)*
    #block(fill: C-CH-NC.at(4).lighten(90%), stroke: 1.5pt + C-CH-NC.at(4), inset: 12pt, radius: 8pt)[
      #align(center)[
        #text(weight: "bold", size: 14pt)[
          A A A \
          + A A A \
          #line(length: 100%, stroke: 1.5pt + C-DARK) \
          B B B
        ]
      ]
    ]
    #v(0.5em)
    _Gợi ý: AAA × 2 = BBB_
    #dong-viet(n: 2)
    A = \_\_\_\_, B = \_\_\_\_
  ],
)

#v(0.8em)
*Phiên bản nâng cao:*

#block(fill: C-CH-NC.at(4).lighten(90%), stroke: 1.5pt + C-CH-NC.at(4), inset: 14pt, radius: 8pt)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    block[
      *c)* Tìm chữ số A, B, C khác nhau:
      #align(center)[
        #text(weight: "bold", size: 13pt)[
          A B C \
          + C B A \
          #line(length: 100%, stroke: 1.5pt + C-DARK) \
          9 9 9
        ]
      ]
      #dong-viet(n: 2)
    ],
    block[
      *d)* Biết A×B = C×D = 12, mỗi chữ khác nhau:
      #align(center)[
        #text(weight: "bold", size: 13pt)[
          A × B = 12 \
          C × D = 12 \
          A + B + C + D = ?
        ]
      ]
      _Liệt kê các cách phân tích 12:_
      #dong-viet(n: 2)
    ],
  )
]

#sai-o-dau[
  Bạn Nam nói: *"Trong bài AB + AB = BA, chỉ cần xét A + A = B nên cứ chọn A=1, B=2 là xong."*

  Em hãy chỉ ra bạn Nam đã quên điều gì. Gợi ý: phải xem cả cột đơn vị, cả cột chục, và chuyện nhớ 1 nếu có.
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI 21: LƯỚI LOGIC / LOGIC GRIDS
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "21",
  ten-vi: "Lưới Logic",
  ten-en: "Logic Grids (Mini Sudoku)",
  icon: "🧩",
  kho: 3,
  c: C-CH-NC.at(4),
)

#ly-thuyet(title: "LƯỚI LOGIC 4×4 — 4×4 LOGIC GRID")[
  Điền các số *1, 2, 3, 4* vào lưới 4×4 sao cho: \
  • Mỗi *hàng ngang* có đúng 1, 2, 3, 4 (mỗi số xuất hiện 1 lần) \
  • Mỗi *cột dọc* có đúng 1, 2, 3, 4 \
  • Mỗi *ô 2×2 đậm* có đúng 1, 2, 3, 4 \
  _Fill 1, 2, 3, 4 in each row, column, and bold 2×2 box exactly once._
]

#bt-label(so: "38", title: "⭐⭐ Lưới logic đơn giản — Easy logic grid")

*a)* Điền 1, 2, 3, 4 vào ô trống:

#align(center)[
  #table(
    columns: (4 * (1.2cm,)),
    rows: (4 * (1.2cm,)),
    align: center + horizon,
    inset: 0pt,
    stroke: (x, y) => {
      let thick = 2.5pt
      let thin = 1pt
      (
        left: if calc.rem(x, 2) == 0 and x > 0 { thick + C-DARK } else if x > 0 { thin + C-MID } else {
          thick + C-DARK
        },
        right: if x == 3 { thick + C-DARK } else { none },
        top: if calc.rem(y, 2) == 0 and y > 0 { thick + C-DARK } else if y > 0 { thin + C-MID } else { thick + C-DARK },
        bottom: if y == 3 { thick + C-DARK } else { none },
      )
    },
    fill: (x, y) => if (x < 2 and y < 2) or (x >= 2 and y >= 2) { rgb("#F0FDF4") } else { rgb("#F0F9FF") },
    [*1*], [], [], [*3*],
    [], [*4*], [*1*], [],
    [], [*1*], [*4*], [],
    [*4*], [], [], [*2*],
  )
]

*b)* Lưới khó hơn:

#align(center)[
  #table(
    columns: (4 * (1.2cm,)),
    rows: (4 * (1.2cm,)),
    align: center + horizon,
    inset: 0pt,
    stroke: (x, y) => (
      left: if calc.rem(x, 2) == 0 and x > 0 { 2.5pt + C-DARK } else if x > 0 { 1pt + C-MID } else { 2.5pt + C-DARK },
      right: if x == 3 { 2.5pt + C-DARK } else { none },
      top: if calc.rem(y, 2) == 0 and y > 0 { 2.5pt + C-DARK } else if y > 0 { 1pt + C-MID } else { 2.5pt + C-DARK },
      bottom: if y == 3 { 2.5pt + C-DARK } else { none },
    ),
    fill: (x, y) => if (x < 2 and y < 2) or (x >= 2 and y >= 2) { rgb("#FFF7ED") } else { rgb("#FEF3C7") },
    [], [*2*], [], [],
    [*4*], [], [], [*1*],
    [*1*], [], [], [*4*],
    [], [], [*3*], [],
  )
]

#bt-label(so: "39", title: "⭐⭐⭐ Lưới với điều kiện thêm — Grid with extra rules")

Điền 1–4 vào lưới. *Thêm quy tắc:* Đường chéo từ trên trái → dưới phải cũng phải có 1, 2, 3, 4!

#align(center)[
  #table(
    columns: (4 * (1.2cm,)),
    rows: (4 * (1.2cm,)),
    align: center + horizon,
    inset: 0pt,
    stroke: (x, y) => (
      left: if calc.rem(x, 2) == 0 and x > 0 { 2.5pt + C-DARK } else if x > 0 { 1pt + C-MID } else { 2.5pt + C-DARK },
      right: if x == 3 { 2.5pt + C-DARK } else { none },
      top: if calc.rem(y, 2) == 0 and y > 0 { 2.5pt + C-DARK } else if y > 0 { 1pt + C-MID } else { 2.5pt + C-DARK },
      bottom: if y == 3 { 2.5pt + C-DARK } else { none },
    ),
    fill: (x, y) => if x == y { C-GOLD.lighten(75%) } else if (x < 2 and y < 2) or (x >= 2 and y >= 2) {
      rgb("#EDE9FE")
    } else { white },
    [], [], [*2*], [],
    [], [*3*], [], [],
    [], [], [*1*], [],
    [*2*], [], [], [],
  )
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI 22: ĐẾM TỔ HỢP / COUNTING & COMBINATIONS
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "22",
  ten-vi: "Đếm Tổ Hợp",
  ten-en: "Counting Combinations",
  icon: "🎰",
  kho: 3,
  c: C-CH-NC.at(4),
)

#ly-thuyet(title: "NGUYÊN TẮC NHÂN — MULTIPLICATION PRINCIPLE")[
  Nếu việc A có *m cách* và việc B có *n cách*, thì làm cả A *rồi* B có *m × n cách*. \
  _If task A has m ways and task B has n ways, doing A then B has m × n ways total._

  #v(0.4em)
  *Ví dụ:* 3 áo sơ mi và 2 quần jeans → 3 × 2 = *6 bộ trang phục* khác nhau.
]

#bt-label(so: "40", title: "⭐⭐ Đếm các trường hợp — Count the cases")

*a)* Một đồng xu và một xúc xắc (1–6) được tung cùng lúc. Có bao nhiêu kết quả khả dĩ?

#chien-luoc[
  Vẽ sơ đồ cây: Đồng xu có 2 mặt (Sấp/Ngửa). Mỗi mặt đồng xu kết hợp với 6 mặt xúc xắc. \
  _Draw a tree diagram: Coin has 2 sides × dice has 6 faces = ?_
]

#block(fill: C-CH-NC.at(4).lighten(92%), inset: 14pt, radius: 8pt)[
  #canvas(length: 1cm, {
    import draw: *
    // Tree diagram
    content((0, 4.5), text(weight: "bold")[Tung])
    // Coin branches
    line((0.3, 4.2), (1.5, 3.5), stroke: 1.5pt + C-TEAL)
    line((0.3, 4.2), (1.5, 1.5), stroke: 1.5pt + C-TEAL)
    content((1.8, 3.5), text(fill: C-TEAL, weight: "bold")[Sấp])
    content((1.8, 1.5), text(fill: C-TEAL, weight: "bold")[Ngửa])
    // Dice from heads
    for i in range(6) {
      let y = 4.0 - i * 0.55
      line((2.4, 3.5), (3.5, y), stroke: 0.8pt + C-PURPLE)
      content((3.8, y), text(size: 8pt)[#str(i + 1)])
    }
    // Dice from tails (abbreviated)
    content((3.0, 0.8), text(size: 8pt, fill: C-MID)[... (6 kết quả)])
  })
]

_Tổng số kết quả: \_\_\_\_ × \_\_\_\_ = \_\_\_\_ kết quả_

*b)* Mật khẩu gồm 1 chữ cái (A/B/C) và 1 chữ số (1–5). Có bao nhiêu mật khẩu khác nhau?

_Số mật khẩu = \_\_\_\_ × \_\_\_\_ = \_\_\_\__

#bt-label(so: "41", title: "⭐⭐⭐ Sắp xếp và chọn — Arrangements and selections")

*a)* Có 3 bạn An, Bình, Châu xếp hàng. Có bao nhiêu cách xếp khác nhau?

#table(
  columns: (1fr, 1fr, 1fr),
  align: center + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: 1pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH-NC.at(4).lighten(75%) } else { white },
  [*1. Đầu hàng*], [*2. Giữa*], [*3. Cuối*],
  [An], [Bình], [Châu],
  [An], [Châu], [Bình],
  [], [], [],
  [], [], [],
  [], [], [],
  [], [], [],
)
_Tổng số cách: \_\_\_\__

*b)* Từ 4 chữ số 1, 2, 3, 4 — mỗi chữ số dùng 1 lần, tạo bao nhiêu số có 2 chữ số?
#dong-viet(n: 2)

#hai-cach[
  *Hai cách đếm số mật khẩu hoặc cách chọn:*
  - Cách 1: vẽ sơ đồ cây để thấy hết từng trường hợp.
  - Cách 2: dùng nguyên tắc nhân như 3 × 5, 4 × 3, ...

  Khi số trường hợp ít, sơ đồ cây rất trực quan. Khi số trường hợp lớn, nguyên tắc nhân giúp đếm gọn hơn nhiều.
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI 23: TOÁN OLYMPIAD / OLYMPIAD PROBLEMS
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "23",
  ten-vi: "Toán Olympiad",
  ten-en: "Olympiad-Level Problems",
  icon: "🥇",
  kho: 4,
  c: C-CH-NC.at(4),
)

#olympiad(the-loai: "Tư Duy Số — Number Reasoning")[
  *Bài 1:* Tìm tất cả các số có 3 chữ số (100–999) thỏa mãn: tổng ba chữ số = 6, và chữ số hàng trăm bằng tổng hai chữ số còn lại.

  _Hint: Gọi các chữ số là a, b, c. Điều kiện: a = b + c và a + b + c = 6._
  #dong-viet(n: 3)
]

#v(0.6em)

#olympiad(the-loai: "Hình Học — Geometry")[
  *Bài 2:* Một hình chữ nhật có chu vi 48 cm. Nếu *tăng chiều dài 3 cm* và *giảm chiều rộng 2 cm*, chu vi *không đổi*. Tìm diện tích hình chữ nhật ban đầu.

  _Hint: Chu vi = 2(dài + rộng) = 48. Dài mới + Rộng mới = Dài cũ + Rộng cũ_
  #dong-viet(n: 4)
]

#v(0.6em)

#olympiad(the-loai: "Toán Đố — Logic Puzzle")[
  *Bài 3:* 5 học sinh được xếp hạng 1, 2, 3, 4, 5. Biết:
  • An xếp cao hơn Bình
  • Châu xếp thứ 3
  • Duy xếp thấp hơn Châu nhưng cao hơn Em
  • Bình xếp ngay sau An

  Xếp hạng của mỗi người là:
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    inset: (x: 8pt, y: 10pt),
    stroke: 1pt + C-LIGHT,
    fill: (x, y) => if y == 0 { rgb("#1E1B4B") } else { white },
    text(fill: white)[*An*],
    text(fill: white)[*Bình*],
    text(fill: white)[*Châu*],
    text(fill: white)[*Duy*],
    text(fill: white)[*Em*],

    [], [], [3], [], [],
  )
]

#v(0.6em)

#olympiad(the-loai: "Toán Đếm — Combinatorics")[
  *Bài 4:* Từ các chữ số 1, 2, 3 (mỗi chữ số có thể lặp), tạo ra bao nhiêu số có *đúng 3 chữ số* mà *tổng các chữ số = 6*?

  _List them systematically: bắt đầu từ 1, 1, 4 (không hợp lệ — 4 không có trong {1,2,3})..._
  #dong-viet(n: 4)
]

// ══════════════════════════════════════════════════════════════════════════
// ÔN TẬP CUỐI QUYỂN / FINAL REVIEW
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#0F0C29"), rgb("#302B63"), angle: 120deg),
  inset: (x: 24pt, y: 20pt),
  radius: 14pt,
)[
  #set text(fill: white)
  #align(center)[
    #text(size: 16pt, weight: "black")[🏆 BÀI THI ÔN TẬP TOÀN BỘ]
    #v(0.3em)
    #text(fill: rgb("#FCD34D"), size: 13pt)[COMPREHENSIVE FINAL CHALLENGE]
    #v(0.5em)
    #line(length: 60%, stroke: 0.8pt + rgb("#6366F1"))
    #v(0.4em)
    #text(fill: rgb("#C7D2FE"), size: 10pt)[20 câu  •  45 phút  •  ⭐⭐⭐⭐ Nâng Cao]
  ]
]

#v(0.5em)

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  block(stroke: (bottom: 1pt + C-LIGHT), inset: (bottom: 4pt), width: 100%)[#text(size: 10pt)[Học sinh: ]],
  block(stroke: (bottom: 1pt + C-LIGHT), inset: (bottom: 4pt), width: 100%)[#text(size: 10pt)[Ngày: ]],
)

#v(0.8em)

*PHẦN A — TRẮC NGHIỆM* (câu 1–8, 0.5 điểm mỗi câu)

*1.* Dãy số: 5, 8, 11, 14, \_\_\_\_

a) 16 #h(2em) b) 17 #h(2em) c) *17* #h(2em) d) 18

*2.* Ô vuông ma thuật 3×3 dùng số 1–9. Tổng ma thuật =

a) 12 #h(2em) b) 13 #h(2em) c) 14 #h(2em) d) *15*

*3.* 8 × 9 = ?

a) 63 #h(2em) b) 70 #h(2em) c) 72 #h(2em) d) *72*

*4.* 25 ÷ 4 = \_\_\_\_ dư \_\_\_\_

a) 5 dư 5 #h(2em) b) *6 dư 1* #h(2em) c) 7 dư 3 #h(2em) d) 6 dư 0

*5.* (5 + 3) × 4 = ?

a) 17 #h(2em) b) 22 #h(2em) c) 25 #h(2em) d) *32*

*6.* Số bí ẩn: "Tôi là số chẵn, 2 chữ số, tổng chữ số = 8, hàng chục > hàng đơn vị." Tôi là:

a) 62 #h(2em) b) *62* #h(2em) c) 44 #h(2em) d) 80

*7.* Hình vuông có bao nhiêu trục đối xứng?

a) 2 #h(2em) b) 3 #h(2em) c) *4* #h(2em) d) 8

*8.* Có 3 màu áo và 2 màu quần. Số bộ trang phục khác nhau:

a) 5 #h(2em) b) *6* #h(2em) c) 7 #h(2em) d) 8

*PHẦN B — TỰ LUẬN* (câu 9–14, 0.5–1 điểm mỗi câu)

*9.* Điền vào dãy số: 2, 6, 18, \_\_\_\_, \_\_\_\_ #h(2em) *(Quy luật: nhân \_\_\_\_)*

*10.* Tính nhẩm: a) 67 + 48 = \_\_\_\_ #h(2em) b) 200 − 85 = \_\_\_\_ #h(2em) c) 7×9 + 6×11 = \_\_\_\_

*11.* Hoàn thành ô vuông ma thuật (tổng = 21):

#align(center)[
  #o-ma-thuat(
    vals: ("", "11", "", "", "7", "", "9", "", ""),
    c: C-CH-NC.at(4),
  )
]

*12.* Toán đố: Có 50 con ong và hoa. Số hoa nhiều hơn số ong 10. Có bao nhiêu con ong?

#o-tra-loi(h: 2cm)

*13.* Hình chữ nhật có chu vi 30 cm và chiều rộng 6 cm. Tính diện tích:

#o-tra-loi(h: 1.8cm)

*14.* Lưới logic 4×4 (điền 1–4, mỗi hàng/cột/ô 2×2 có đúng 1, 2, 3, 4):

#align(center)[
  #table(
    columns: (4 * (1.1cm,)),
    rows: (4 * (1.1cm,)),
    align: center + horizon,
    inset: 0pt,
    stroke: (x, y) => (
      left: if calc.rem(x, 2) == 0 and x > 0 { 2.5pt + C-DARK } else if x > 0 { 1pt + C-MID } else { 2.5pt + C-DARK },
      right: if x == 3 { 2.5pt + C-DARK } else { none },
      top: if calc.rem(y, 2) == 0 and y > 0 { 2.5pt + C-DARK } else if y > 0 { 1pt + C-MID } else { 2.5pt + C-DARK },
      bottom: if y == 3 { 2.5pt + C-DARK } else { none },
    ),
    fill: (x, y) => if (x < 2 and y < 2) or (x >= 2 and y >= 2) { C-CH-NC.at(4).lighten(90%) } else { white },
    [*2*], [], [], [*4*],
    [], [*1*], [*3*], [],
    [], [*4*], [*2*], [],
    [*3*], [], [], [*1*],
  )
]

*PHẦN C — OLYMPIC* (câu 15, 2 điểm)

*15.* ⭐⭐⭐⭐ Tìm tất cả các số có 2 chữ số AB (hàng chục = A, hàng đơn vị = B) thỏa mãn: A × B = A + B. Có bao nhiêu số như vậy?

#dong-viet(n: 5)
