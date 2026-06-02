// ══════════════════════════════════════════════════════════════════════════
// nc1-tu-duy.typ — Chương 1: Tư Duy Số Học / Number Logic & Patterns
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

#chuong-header-nc(
  so: 1,
  ten-vi: "Tư Duy Số Học",
  ten-en: "Number Logic & Patterns",
  icon: "🧠",
  so-bai: "5",
  so-trang: "16",
)

#muc-tieu((
  [Tìm quy luật và điền số còn thiếu trong dãy số — Find patterns in number sequences],
  [Hoàn thành ô vuông ma thuật — Complete magic squares],
  [Giải bài toán số bí ẩn bằng lập luận — Solve mystery number puzzles by reasoning],
  [Hiểu tổng chữ số và tính chất số — Understand digit sums and number properties],
  [So sánh biểu thức số phức hợp — Compare complex number expressions],
))

// ══════════════════════════════════════════════════════════════════════════
// BÀI 1: DÃY SỐ VÀ QUY LUẬT / SEQUENCES & PATTERNS
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "1",
  ten-vi: "Dãy Số và Quy Luật",
  ten-en: "Sequences & Patterns",
  icon: "🔢",
  kho: 2,
  c: C-CH-NC.at(0),
)

#ly-thuyet(title: "QUY LUẬT DÃY SỐ — SEQUENCE RULES")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    block(fill: white, stroke: 1pt + C-TEAL, inset: 10pt, radius: 8pt)[
      #text(fill: C-TEAL, weight: "bold")[Dãy cộng đều / Arithmetic Sequence]
      #v(0.3em)
      Mỗi số hơn số trước *một lượng như nhau*. \
      _Each term increases by the same amount._
      #v(0.3em)
      *Ví dụ:* 3, 7, 11, 15, … (cộng 4 / add 4)
    ],
    block(fill: white, stroke: 1pt + C-ORANGE, inset: 10pt, radius: 8pt)[
      #text(fill: C-ORANGE, weight: "bold")[Dãy nhân đều / Geometric Sequence]
      #v(0.3em)
      Mỗi số *gấp đôi* (hoặc gấp ba) số trước. \
      _Each term is multiplied by the same factor._
      #v(0.3em)
      *Ví dụ:* 2, 4, 8, 16, … (nhân 2 / ×2)
    ],
  )
]

#bt-label(so: "1", title: "⭐ Tìm quy luật và điền số — Find the rule and fill in")

#chien-luoc(ten: "Tìm quy luật")[
  Tính hiệu (hoặc thương) giữa hai số liên tiếp để tìm quy luật. \
  _Find the difference (or ratio) between consecutive terms._
]

*a)* 5, 8, 11, #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[], #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[], #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[]
#h(1em) _Quy luật: cộng \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

*b)* 100, 95, 90, #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[], #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[], #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[]
#h(1em) _Quy luật: trừ \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

*c)* 1, 2, 4, 8, #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[], #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[]
#h(1em) _Quy luật: nhân \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

*d)* 3, 6, 9, #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[], #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[], #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[]
#h(1em) _Quy luật: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

#bt-label(so: "2", title: "⭐⭐ Dãy số đặc biệt — Special sequences")

*a)* Dãy Fibonacci nhỏ: 1, 1, 2, 3, 5, #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[], #box(width: 1.5cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[]

#kham-pha[
  Trong dãy này, mỗi số bằng *tổng hai số trước* nó! \
  _Each number equals the sum of the two numbers before it!_ \
  1+1=2, 1+2=3, 2+3=5, 3+5=?
]

*b)* Điền số còn thiếu — Fill in the missing numbers:

#table(
  columns: (7 * (1.4cm,)),
  align: center + horizon,
  inset: (x: 6pt, y: 10pt),
  stroke: 1pt + C-CH-NC.at(0).lighten(60%),
  fill: (x, y) => if calc.even(x) { C-CH-NC.at(0).lighten(92%) } else { white },
  [*2*], [*5*], [?], [*11*], [?], [*17*], [*20*],
)

#v(0.5em)
_Quy luật: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

#bt-label(so: "3", title: "⭐⭐⭐ Dãy hai chiều — Two-direction sequence")

#block(fill: C-CH-NC.at(0).lighten(92%), inset: 14pt, radius: 8pt)[
  Bảng số dưới đây có quy luật theo *hàng ngang* và *hàng dọc*. \
  _The table below has a pattern going across AND down._

  #v(0.7em)
  #table(
    columns: (4 * (1.5cm,)),
    align: center + horizon,
    inset: (x: 8pt, y: 10pt),
    stroke: 1.5pt + C-CH-NC.at(0).lighten(50%),
    fill: (x, y) => if x == 0 or y == 0 { C-CH-NC.at(0).lighten(75%) } else { white },
    [*+*], [*1*], [*2*], [*3*],
    [*10*], [11], [12], [13],
    [*20*], [21], [?], [23],
    [*30*], [?], [32], [?],
  )
]

#suy-luan[
  Mỗi ô = (số đầu hàng) + (số đầu cột). Em tìm các ô "?" nhé! \
  _Each cell = (row start) + (column start). Find the "?" cells!_
]

#phong-thi-nghiem[
  *Nhiệm vụ mở:* Hãy tạo 3 dãy khác nhau nhưng đều có số thứ 5 bằng 25.
  - 1 dãy cộng đều.
  - 1 dãy nhân đều.
  - 1 dãy do em tự nghĩ quy luật.

  Sau đó, em giải thích dãy nào tăng nhanh nhất và vì sao.
  #o-tra-loi(h: 2.8cm, label: "Các dãy của em:")
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI 2: Ô VUÔNG MA THUẬT / MAGIC SQUARES
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "2",
  ten-vi: "Ô Vuông Ma Thuật",
  ten-en: "Magic Squares",
  icon: "✨",
  kho: 3,
  c: C-CH-NC.at(0),
)

#ly-thuyet(title: "Ô VUÔNG MA THUẬT — MAGIC SQUARE")[
  Trong ô vuông ma thuật 3×3, *mỗi hàng, mỗi cột và 2 đường chéo* đều có *tổng bằng nhau* (gọi là tổng ma thuật — _magic sum_).

  #v(0.5em)
  #grid(
    columns: (auto, 1fr),
    gutter: 16pt,
    o-ma-thuat(
      vals: ("2", "7", "6", "9", "5", "1", "4", "3", "8"),
      c: C-CH-NC.at(0),
    ),
    block[
      #set text(size: 10pt)
      Kiểm tra: \
      • Hàng 1: 2+7+6 = *15* ✓ \
      • Hàng 2: 9+5+1 = *15* ✓ \
      • Hàng 3: 4+3+8 = *15* ✓ \
      • Cột 1: 2+9+4 = *15* ✓ \
      • Đường chéo: 2+5+8 = *15* ✓ \
      → Tổng ma thuật = *15*
    ],
  )
]

#bt-label(so: "4", title: "⭐⭐ Hoàn thành ô vuông ma thuật — Complete the magic squares")

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  block[
    *a)* Tổng ma thuật = 15 / _Magic sum = 15_
    #v(0.5em)
    #o-ma-thuat(
      vals: ("", "9", "", "3", "5", "7", "", "1", ""),
      c: C-CH-NC.at(0),
    )
  ],
  block[
    *b)* Tổng ma thuật = 18 / _Magic sum = 18_
    #v(0.5em)
    #o-ma-thuat(
      vals: ("3", "", "9", "", "6", "", "7", "", "5"),
      c: C-CH-NC.at(0),
    )
  ],
)

#v(0.8em)

#bt-label(so: "5", title: "⭐⭐⭐ Tạo ô vuông ma thuật — Create your magic square")

#chien-luoc(ten: "Mẹo tạo ô vuông 3×3")[
  Đặt số *5* vào ô giữa. Tổng ma thuật = 5 × 3 = *15*. \
  Sau đó đặt 1–9 sao cho mỗi hàng, cột, chéo đều = 15. \
  _Put 5 in the center. Magic sum = 5 × 3 = 15._
]

Dùng các số 1, 2, 3, 4, 5, 6, 7, 8, 9 — mỗi số dùng đúng 1 lần: \
_Use each number 1–9 exactly once:_

#align(center)[
  #o-ma-thuat(
    vals: ("", "", "", "", "5", "", "", "", ""),
    c: C-PURPLE,
  )
]

#nang-cao[
  *Thách thức:* Tạo ô vuông ma thuật 3×3 dùng các số *chẵn* 2, 4, 6, 8, 10, 12, 14, 16, 18. Tổng ma thuật = ? \
  _Challenge: Make a magic square using even numbers 2, 4, 6, 8, 10, 12, 14, 16, 18. Magic sum = ?_
  #dong-viet(n: 2)
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI 3: SỐ BÍ ẨN / MYSTERY NUMBERS
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "3",
  ten-vi: "Số Bí Ẩn",
  ten-en: "Mystery Numbers",
  icon: "🔮",
  kho: 2,
  c: C-CH-NC.at(0),
)

#ly-thuyet(title: "CÁCH TÌM SỐ BÍ ẨN — HOW TO FIND MYSTERY NUMBERS")[
  Đọc kỹ từng gợi ý. *Loại dần* những số không thỏa điều kiện. \
  _Read each clue carefully. Eliminate numbers that don't fit each condition._

  #v(0.4em)
  #grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    text(size: 20pt)[🔮],
    block[
      *Ví dụ:* Tôi là số có 2 chữ số. Tôi là số chẵn. Tôi lớn hơn 30 nhưng nhỏ hơn 40. Chữ số hàng đơn vị của tôi là 6. Tôi là số *36*!
    ],
  )
]

#bt-label(so: "6", title: "⭐⭐ Giải đố số bí ẩn — Solve the mystery number")

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  so-bi-an[
    *Số bí ẩn 1:*
    #v(0.4em)
    • Tôi có 2 chữ số
    • Tôi là bội số của 5
    • Tôi lớn hơn 40
    • Tôi nhỏ hơn 60
    • Hàng chục của tôi là 5
    #v(0.4em)
    Tôi là số: #box(width: 2cm, height: 1.4em, stroke: 1.5pt + C-ORANGE, radius: 4pt)[]
  ],
  so-bi-an[
    *Số bí ẩn 2:*
    #v(0.4em)
    • Tôi có 2 chữ số
    • Tôi là số lẻ
    • Tổng các chữ số của tôi = 9
    • Tôi nhỏ hơn 50
    • Hàng đơn vị lớn hơn hàng chục
    #v(0.4em)
    Tôi là số: #box(width: 2cm, height: 1.4em, stroke: 1.5pt + C-ORANGE, radius: 4pt)[]
  ],
)

#v(0.6em)

#bt-label(so: "7", title: "⭐⭐⭐ Viết gợi ý cho số — Write clues for a number")

Chọn một số từ 10 đến 99. Viết *4 gợi ý* để bạn cùng lớp đoán số đó. \
_Choose a number from 10 to 99. Write 4 clues for a classmate to guess._

Số em chọn (giữ bí mật!): #rect(width: 1.5cm, height: 1.3cm, stroke: 1.5pt + C-DARK, fill: C-DARK)[]

#grid(
  columns: (auto, 1fr),
  gutter: 8pt,
  [Gợi ý 1:], rect(width: 100%, height: 1.2cm, stroke: (bottom: 1pt + C-LIGHT), fill: C-CREAM.lighten(50%))[],
  [Gợi ý 2:], rect(width: 100%, height: 1.2cm, stroke: (bottom: 1pt + C-LIGHT), fill: C-CREAM.lighten(50%))[],
  [Gợi ý 3:], rect(width: 100%, height: 1.2cm, stroke: (bottom: 1pt + C-LIGHT), fill: C-CREAM.lighten(50%))[],
  [Gợi ý 4:], rect(width: 100%, height: 1.2cm, stroke: (bottom: 1pt + C-LIGHT), fill: C-CREAM.lighten(50%))[],
)

// ══════════════════════════════════════════════════════════════════════════
// BÀI 4: TỔNG CHỮ SỐ / DIGIT SUMS
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "4",
  ten-vi: "Tổng Chữ Số",
  ten-en: "Digit Sums & Number Properties",
  icon: "🔢",
  kho: 3,
  c: C-CH-NC.at(0),
)

#ly-thuyet(title: "TỔNG CHỮ SỐ — DIGIT SUM")[
  *Tổng chữ số* là tổng của tất cả các chữ số trong một số. \
  _The *digit sum* is the sum of all digits in a number._

  #v(0.4em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    block(fill: white, stroke: 1pt + C-TEAL, inset: 10pt, radius: 6pt)[
      Số *36*: 3 + 6 = *9* \
      Số *145*: 1 + 4 + 5 = *10* \
      Số *999*: 9 + 9 + 9 = *27*
    ],
    block(fill: white, stroke: 1pt + C-ORANGE, inset: 10pt, radius: 6pt)[
      *Tính chất thú vị:* \
      Số chia hết cho 9 → tổng chữ số chia hết cho 9 \
      Số chia hết cho 3 → tổng chữ số chia hết cho 3
    ],
  )
]

#bt-label(so: "8", title: "⭐ Tính tổng chữ số — Find digit sums")

#table(
  columns: (3 * (1fr,)),
  align: center + horizon,
  inset: (x: 10pt, y: 12pt),
  stroke: 1pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH-NC.at(0).lighten(80%) } else { white },
  [*Số / Number*], [*Tổng chữ số*], [*Chia hết cho 3?*],
  [45], [], [],
  [72], [], [],
  [138], [], [],
  [256], [], [],
  [999], [], [],
)

#bt-label(so: "9", title: "⭐⭐⭐ Tìm tất cả số có 2 chữ số — Find all 2-digit numbers")

Tìm *tất cả* các số có 2 chữ số mà tổng các chữ số = *10*. \
_Find ALL 2-digit numbers whose digit sum equals 10._

#chien-luoc[
  Bắt đầu từ hàng chục = 1: chữ số hàng đơn vị = 10 − 1 = 9 → số 19. \
  Tiếp tục với hàng chục = 2, 3, ... \
  _Start: tens digit = 1, units digit = 10−1 = 9 → number 19. Continue..._
]

#dong-viet(n: 3)

Có tất cả *\_\_\_\_* số thỏa điều kiện. / _There are \_\_\_\_ numbers total._

#hai-cach[
  *Hai cách tìm tất cả số có 2 chữ số có tổng chữ số = 10:*
  - Cách 1: thử lần lượt hàng chục 1, 2, 3, ... , 9.
  - Cách 2: ghép các cặp bù 10: (1,9), (2,8), (3,7), ...

  Cách 2 giúp em không bỏ sót và thấy ngay quy luật: 19, 28, 37, 46, 55, 64, 73, 82, 91.
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI 5: SO SÁNH NÂNG CAO / ADVANCED COMPARISONS
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "5",
  ten-vi: "So Sánh Nâng Cao",
  ten-en: "Advanced Comparisons",
  icon: "⚖️",
  kho: 2,
  c: C-CH-NC.at(0),
)

#bt-label(so: "10", title: "⭐⭐ Điền >, <, = — Fill in >, <, =")

*a)* #h(1em) 5 × 8 #box(width: 1.2cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[] 6 × 7
#h(2em) *b)* 3 × 9 #box(width: 1.2cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[] 4 × 8
#h(2em) *c)* 2 × 15 #box(width: 1.2cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[] 5 × 6

*d)* #h(1em) 100 − 47 #box(width: 1.2cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[] 47 + 5
#h(2em) *e)* 200 + 8 × 3 #box(width: 1.2cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[] 250

*f)* #h(1em) (30 + 20) × 2 #box(width: 1.2cm, height: 1.3em, stroke: (bottom: 1.5pt + C-DARK))[] 30 × 2 + 20 × 2

#suy-luan[
  Câu f: Em hãy tính cả hai vế rồi so sánh. Em nhận thấy điều gì? \
  _For f: Calculate both sides. What do you notice?_ \
  #dong-viet(n: 1)
]

#bt-label(so: "11", title: "⭐⭐⭐ Bài toán suy luận — Reasoning puzzle")

Nam, Lan, và Hùng đang đoán số. Đọc các gợi ý và điền vào bảng: \
_Nam, Lan, and Hung are guessing numbers. Read the clues and fill in the table:_

#block(
  fill: C-CH-NC.at(0).lighten(90%),
  stroke: 1.5pt + C-CH-NC.at(0).lighten(50%),
  inset: 14pt,
  radius: 8pt,
)[
  • Nam nghĩ số 24. Số của Lan *gấp đôi* số của Nam. \
  • Số của Hùng *kém* số của Lan *8*. \
  • Số của Hùng *lớn hơn* số của Nam hay không?
]

#v(0.6em)

#table(
  columns: (1fr, 1fr, 1fr),
  align: center + horizon,
  inset: (x: 10pt, y: 14pt),
  stroke: 1pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH-NC.at(0).lighten(80%) } else { white },
  [*Nam*], [*Lan*], [*Hùng*],
  [24], [], [],
)

Nhận xét: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

#kiem-tra-nc(
  chuong: "1",
  ten: "Tư Duy Số Học",
  so-cau: "8",
  tg: "20 phút",
)

*Câu 1.* Điền số còn thiếu: 7, 12, 17, \_\_\_\_, \_\_\_\_, 32

*Câu 2.* Trong ô vuông ma thuật, tổng mỗi hàng = 15. Điền các ô trống:

#align(center)[
  #o-ma-thuat(
    vals: ("8", "", "6", "", "5", "", "4", "", "2"),
    c: C-CH-NC.at(0),
  )
]

*Câu 3.* Tôi là số có 2 chữ số, là bội của 4, lớn hơn 20 và nhỏ hơn 30. Tôi là số: \_\_\_\_\_

*Câu 4.* Tính tổng chữ số: a) 48 → \_\_\_\_  b) 237 → \_\_\_\_  c) 90 → \_\_\_\_

*Câu 5.* Dãy số: 1, 3, 9, \_\_\_\_, \_\_\_\_ (quy luật nhân)

*Câu 6.* Điền >, <, =: #h(6pt) 5 × 6 \_\_\_\_ 4 × 8 #h(2em) 3 × 10 \_\_\_\_ 4 × 8

*Câu 7.* Tìm tất cả số có 2 chữ số có tổng chữ số bằng 7 và lớn hơn 40:

#dong-viet(n: 2)

*Câu 8* ⭐⭐⭐⭐ Tạo ô vuông ma thuật 3×3 dùng các số *11, 12, 13, 14, 15, 16, 17, 18, 19*:

#align(center)[
  #o-ma-thuat(
    vals: ("", "", "", "", "", "", "", "", ""),
    c: C-PURPLE,
  )
]
