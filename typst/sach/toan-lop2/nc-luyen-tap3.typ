// ══════════════════════════════════════════════════════════════════════════
// nc-luyen-tap3.typ — Advanced Explorer & Final Challenge
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

// ══════════════════════════════════════════════════════════════════════════
// KHÁM PHÁ TOÁN HỌC — MATH EXPLORER ACTIVITIES
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#0C4A6E"), rgb("#0369A1"), angle: 90deg),
  inset: (x: 20pt, y: 16pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 20pt, weight: "black")[🔭 Khám Phá Toán Học — Math Explorer]
    #v(0.3em)
    #text(fill: rgb("#FDE68A"), size: 13pt)[Activities & Investigations for Curious Minds]
  ]
]

#v(0.8em)

// ─── Activity 1: Pascal's Triangle ───────────────────────────────────────
#block(fill: C-TEAL.lighten(88%), stroke: 1.5pt + C-TEAL, inset: 14pt, radius: 10pt)[
  #set par(first-line-indent: 0em)
  #text(fill: C-TEAL, weight: "bold", size: 12pt)[🔺 Khám Phá 1: Tam Giác Pascal — Pascal's Triangle]
  #v(0.6em)
  #set text(size: 10pt)
  Mỗi số trong tam giác = *tổng của hai số ngay trên nó*. Điền vào các ô còn trống:

  #align(center)[
    #block(fill: white, inset: 12pt, radius: 8pt)[
      #set text(size: 11pt, weight: "bold")
      #table(
        columns: (auto,),
        align: center,
        stroke: none,
        [1],
        [1  #h(1.5em) 1],
        [1  #h(1.5em) 2  #h(1.5em) 1],
        [1  #h(1.5em) 3  #h(1.5em) 3  #h(1.5em) 1],
        [1  #h(1.5em) \_\_  #h(1.5em) \_\_  #h(1.5em) \_\_  #h(1.5em) 1],
        [1  #h(1.5em) \_\_  #h(1.5em) \_\_  #h(1.5em) \_\_  #h(1.5em) \_\_  #h(1.5em) 1],
        [1  #h(1.5em) \_\_  #h(1.5em) \_\_  #h(1.5em) \_\_  #h(1.5em) \_\_  #h(1.5em) \_\_  #h(1.5em) 1],
      )
    ]
  ]

  *Khám phá các điều kỳ diệu trong tam giác Pascal:*
  - Tổng mỗi hàng: 1, 2, 4, 8, 16, \_\_\_\_, \_\_\_\_ *(quy luật gì?)*
  - Hàng thứ 3 (0,1,2): 1, 2, 1 → là số mũ của (a+b)²: a²+2ab+b²
  - Tìm dãy Fibonacci ẩn trong tam giác Pascal *(gợi ý: cộng theo đường chéo)*
  #dong-viet(n: 2)
]

#v(0.8em)

// ─── Activity 2: Prime Sieve ──────────────────────────────────────────────
#block(fill: C-PURPLE.lighten(88%), stroke: 1.5pt + C-PURPLE, inset: 14pt, radius: 10pt)[
  #set par(first-line-indent: 0em)
  #text(fill: C-PURPLE, weight: "bold", size: 12pt)[🔢 Khám Phá 2: Sàng Số Nguyên Tố — Sieve of Eratosthenes]
  #v(0.6em)
  #set text(size: 10pt)
  Cách tìm tất cả số nguyên tố từ 1 đến 50: \
  *Bước 1:* Gạch bỏ 1 (không phải số nguyên tố). \
  *Bước 2:* Giữ 2, gạch bỏ tất cả bội số của 2 (4,6,8,...). \
  *Bước 3:* Giữ 3 (chưa bị gạch), gạch bội số của 3 (9,15,21,...). \
  *Bước 4:* Tiếp tục với 5, 7, ...

  Thực hành — khoanh tròn số nguyên tố, gạch chéo số hợp số:

  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    inset: (x: 6pt, y: 7pt),
    stroke: 0.8pt + C-LIGHT,
    fill: (x, y) => {
      let n = y * 10 + x + 1
      if n == 1 { rgb("#E5E7EB") } else if (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47).contains(n) {
        C-PURPLE.lighten(80%)
      } else { white }
    },
    ..range(1, 51).map(n => {
      if (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47).contains(n) {
        [*#str(n)*]
      } else {
        [#str(n)]
      }
    }),
  )

  Tô màu ô các số nguyên tố! Có \_\_\_\_ số nguyên tố từ 1 đến 50.
]

#v(0.8em)

// ─── Activity 3: Modular patterns ────────────────────────────────────────
#block(fill: C-ORANGE.lighten(88%), stroke: 1.5pt + C-ORANGE, inset: 14pt, radius: 10pt)[
  #set par(first-line-indent: 0em)
  #text(fill: C-ORANGE, weight: "bold", size: 12pt)[♻️ Khám Phá 3: Quy Luật Tuần Hoàn — Cyclic Patterns]
  #v(0.5em)
  #set text(size: 10pt)
  Nhân 9 với các số và nhìn vào các chữ số:

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 14pt,
    [
      *Chữ số hàng đơn vị của 9ⁿ:*
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        inset: (x: 6pt, y: 5pt),
        stroke: 0.7pt + C-LIGHT,
        fill: (x, y) => if y == 0 { C-ORANGE.lighten(70%) } else { white },
        [n], [9ⁿ], [CS đơn vị],
        [1], [9], [9],
        [2], [81], [1],
        [3], [729], [9],
        [4], [6561], [1],
        [5], [], [\_\_],
        [6], [], [\_\_],
      )
      Quy luật: \_\_\_\_\_\_\_\_\_\_\_
    ],
    [
      *Tổng chữ số của bội 9:*
      9: T=9, 18: T=9, 27: T=9, \
      36: T=9, 45: T=\_\_, 54: T=\_\_ \
      63: T=\_\_, 72: T=\_\_, 81: T=\_\_ \
      90: T=\_\_, 99: T=\_\_, 108: T=\_\_ \
      #v(0.4em)
      *Nhận xét:* \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
      #v(0.4em)
      Dùng để kiểm tra: 189 có chia hết 9 không? \
      T = 1+8+9 = \_\_\_\_ → chia hết 9? \_\_\_
    ],
    [
      *Quy luật phép nhân ×9:*
      Nhìn thật kỹ hai cột:
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        inset: (x: 6pt, y: 5pt),
        stroke: 0.7pt + C-LIGHT,
        fill: (x, y) => if y == 0 { C-ORANGE.lighten(70%) } else { white },
        [×], [×9=], [T-K-P],
        [1], [09], [0 — 9],
        [2], [18], [1 — 8],
        [3], [27], [2 — 7],
        [4], [36], [3 — 6],
        [5], [45], [4 — 5],
        [6], [54], [],
        [7], [63], [],
        [8], [72], [],
        [9], [81], [],
      )
      Chữ số hàng chục *tăng* 1, hàng đơn vị *giảm* 1!
    ],
  )
]

// ─── Activity 4: Magic number tricks ─────────────────────────────────────
#pagebreak(weak: true)

#block(fill: C-GOLD.lighten(80%), stroke: 1.5pt + C-GOLD, inset: 14pt, radius: 10pt)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#92400E"), weight: "bold", size: 12pt)[🎩 Khám Phá 4: Ảo Thuật Số Học — Number Magic Tricks]
  #v(0.6em)
  #set text(size: 10pt)

  *Trò ảo thuật 1: Đoán số của bạn*

  #block(fill: white, inset: 12pt, radius: 8pt, stroke: 1pt + C-GOLD)[
    1. Nghĩ một số bất kỳ từ 1–10 \
    2. Nhân với 2 \
    3. Cộng thêm 10 \
    4. Chia cho 2 \
    5. Trừ đi số bạn vừa nghĩ ban đầu \
    *Kết quả luôn bằng:* \_\_\_\_
  ]

  *Giải thích:* Gọi số bạn nghĩ là x: \
  → x×2 = 2x → 2x+10 → (2x+10)÷2 = x+5 → x+5-x = *5* \
  Bạn có thể tự tạo trò ảo thuật tương tự! Thử đổi số 10 thành 20:

  #dong-viet(n: 2)

  *Trò ảo thuật 2: Số Kaprekar*

  Chọn số 4 chữ số bất kỳ (không phải toàn cùng một chữ số), ví dụ: 3524 \
  - Xếp giảm dần: 5432 \
  - Xếp tăng dần: 2345 \
  - Trừ: 5432 − 2345 = 3087 \
  - Lặp lại với 3087: 8730 − 0378 = \_\_\_\_ \
  - Lặp lại mãi cho đến khi đến số *6174* (số Kaprekar!)

  Thử với số 2019: \_\_\_\_ → \_\_\_\_ → \_\_\_\_ → 6174 (tối đa 7 bước!)
]

#v(0.8em)

// ─── Activity 5: Area Explorer ────────────────────────────────────────────
#block(fill: C-MINT.darken(5%), stroke: 1.5pt + C-TEAL, inset: 14pt, radius: 10pt)[
  #set par(first-line-indent: 0em)
  #text(fill: C-TEAL, weight: "bold", size: 12pt)[📐 Khám Phá 5: Chu Vi Cố Định — Fixed Perimeter]
  #v(0.6em)
  #set text(size: 10pt)
  Dùng một sợi dây dài 24cm, có thể tạo nhiều hình chữ nhật khác nhau:

  #table(
    columns: (auto, auto, auto, auto),
    align: center + horizon,
    inset: (x: 10pt, y: 8pt),
    stroke: 0.8pt + C-LIGHT,
    fill: (x, y) => if y == 0 { C-TEAL.lighten(70%) } else if calc.even(y) { C-MINT.lighten(20%) } else { white },
    [Dài (cm)], [Rộng (cm)], [Diện tích (cm²)], [Hình dạng],
    [11], [1], [11], [Rất dẹt],
    [10], [2], [20], [Dẹt],
    [9], [3], [], [],
    [8], [4], [], [],
    [7], [5], [], [],
    [6], [6], [], [Hình vuông!],
  )

  *Nhận xét:* Trong tất cả hình chữ nhật có cùng chu vi, *hình vuông* có diện tích \_\_\_\_\_\_ nhất! \
  Diện tích lớn nhất = \_\_\_\_ cm² (khi cạnh = \_\_\_\_ cm)

  *Thực hành:* Dùng giấy ô ly, vẽ 3 hình chữ nhật có chu vi = 20 ô nhưng diện tích khác nhau:
  #rect(width: 100%, height: 5cm, stroke: 1pt + C-LIGHT, fill: white, radius: 4pt)[]
]

// ══════════════════════════════════════════════════════════════════════════
// HÀNH TRÌNH TÀI NĂNG — TALENT JOURNEY CHALLENGES
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#1E1B4B"), rgb("#312E81"), angle: 90deg),
  inset: (x: 20pt, y: 16pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 18pt, weight: "black")[🌠 Hành Trình Tài Năng — Talent Journey]
    #v(0.3em)
    #text(fill: rgb("#FCD34D"), size: 12pt)[8 Super Challenges — from Advanced to Competition Level]
    #v(0.3em)
    #text(
      fill: white.transparentize(30%),
      size: 9.5pt,
    )[Dành cho học sinh đặc biệt xuất sắc / For exceptionally gifted students]
  ]
]

#v(0.8em)

#block(fill: C-LAVENDER, inset: 12pt, radius: 8pt)[
  #set text(size: 9.5pt)
  #text(fill: C-PURPLE, weight: "bold")[📌 Hướng dẫn:] Mỗi bài giải đúng, tô màu 1 ngôi sao 🌟. Tám bài đúng = "Nhà Toán Học Tài Năng"!
]

#v(0.6em)

// Challenge 1
#olympiad(the-loai: "Số Học")[
  *Thử Thách 1 ⭐*: Tổng các số tự nhiên từ 1 đến n bằng n(n+1)÷2. \
  Dùng công thức này tính: 1+2+3+...+50 = \_\_\_\_ và 51+52+...+100 = \_\_\_\_
  #dong-viet(n: 2)
]

#v(0.6em)

// Challenge 2
#olympiad(the-loai: "Chia Hết")[
  *Thử Thách 2 ⭐⭐*: Tìm số tự nhiên n nhỏ nhất sao cho: \
  - n chia 3 dư 2 \
  - n chia 5 dư 3 \
  - n chia 7 dư 4
  #dong-viet(n: 3)
]

#v(0.6em)

// Challenge 3
#olympiad(the-loai: "Hình Học")[
  *Thử Thách 3 ⭐⭐*: Một hình chữ nhật bị cắt bởi một đường thẳng song song với cạnh dài thành 2 hình chữ nhật. Biết chu vi hình nhỏ = 18cm và chu vi hình lớn = 26cm. Tính diện tích hình ban đầu.
  #dong-viet(n: 4)
]

#v(0.6em)

// Challenge 4
#olympiad(the-loai: "Tổ Hợp")[
  *Thử Thách 4 ⭐⭐⭐*: Có bao nhiêu cách đặt 2 quân cờ không cùng hàng và không cùng cột trên bàn cờ 4×4?
  #dong-viet(n: 3)
]

#v(0.6em)

// Challenge 5
#olympiad(the-loai: "Logic")[
  *Thử Thách 5 ⭐⭐⭐*: Ba người A, B, C mỗi người đội một trong 3 màu mũ (đỏ/xanh/vàng). \
  - A nói: "Tôi thấy B đội mũ đỏ" \
  - B nói: "Tôi không đội mũ đỏ" \
  - C nói: "B và tôi đội mũ khác màu nhau" \
  Biết mỗi người hoặc nói thật hoặc nói dối. Tìm màu mũ của từng người.
  #dong-viet(n: 4)
]

#v(0.6em)

// Challenge 6
#olympiad(the-loai: "Số Học Cao")[
  *Thử Thách 6 ⭐⭐⭐*: Tìm tất cả cặp số nguyên dương (a, b) với a ≤ b sao cho: \
  a + b = 36 và a × b = 320.
  #dong-viet(n: 3)
]

#v(0.6em)

// Challenge 7
#olympiad(the-loai: "Đếm & Liệt Kê")[
  *Thử Thách 7 ⭐⭐⭐⭐*: Có bao nhiêu số tự nhiên có 3 chữ số (từ 100 đến 999) mà tổng chữ số chia hết cho 9?
  #dong-viet(n: 4)
]

#v(0.6em)

// Challenge 8
#olympiad(the-loai: "Olympiad Cấp Quận")[
  *Thử Thách 8 ⭐⭐⭐⭐⭐*: \
  Điền các số nguyên dương khác nhau vào 12 ô trên đường tròn (mỗi ô 1 số) sao cho tổng của 3 số trên mỗi cạnh của tam giác đều (4 cạnh) bằng nhau. Tìm cách điền với các số từ 1 đến 12.

  #canvas(length: 1cm, {
    import draw: *
    // Equilateral triangle with 4 nodes per side (including vertices)
    let pts = ((0, 3.46), (4, 3.46), (2, 0)) // vertices
    line(..pts, close: true, stroke: 2pt + C-CH-NC.at(4))
    // 12 nodes
    let nodes = (
      (-0.5, 3.46),
      (0, 3.46),
      (2, 3.46),
      (4, 3.46),
      (4.5, 3.46),
      (3.5, 1.73),
      (3.0, 0.87),
      (2.5, 0),
      (1.5, 0),
      (1.0, 0.87),
      (0.5, 1.73),
      (0.0, 2.6),
    )
    for p in nodes {
      circle(p, radius: 0.38, fill: white, stroke: 2pt + C-CH-NC.at(4))
    }
  })

  *Gợi ý:* Tổng 1+2+...+12 = 78. Mỗi số ở góc được tính 2 lần trong 4 tổng.
  #dong-viet(n: 3)
]

// ══════════════════════════════════════════════════════════════════════════
// ĐỀ THI MÔ PHỎNG — MOCK EXAM 3 (SINGAPORE STYLE)
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#0C4A6E"), rgb("#0369A1"), angle: 90deg),
  inset: (x: 20pt, y: 18pt),
  radius: 14pt,
)[
  #align(center)[
    #text(fill: white, size: 20pt, weight: "black")[📋 Đề Thi Mô Phỏng — Số 3 (Singapore Style)]
    #v(0.3em)
    #text(fill: rgb("#FDE68A"), size: 13pt)[Mock Exam 3 — Singapore Primary Math Style]
    #v(0.3em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 8pt,
      [#text(fill: white.transparentize(20%), size: 9.5pt)[⏱ 40 phút / 40 min]],
      [#text(fill: white.transparentize(20%), size: 9.5pt)[📝 25 điểm]],
      [#text(fill: white.transparentize(20%), size: 9.5pt)[🎯 P2 Singapore Level]],
    )
  ]
]

#v(0.8em)

*Phần 1 — Điền số (10 điểm):*

*1.* 7 × 8 − \_\_\_\_ = 40 #h(2em) *2.* \_\_\_\_ ÷ 9 = 7 dư 5 #h(2em) *3.* 5 × \_\_\_\_ = 3 × 25

*4.* Dãy số: 3, 6, 11, 18, 27, \_\_\_\_ *(hiệu tăng dần)*

*5.* Số nào khi nhân với 7 rồi cộng 5 thì bằng 54? \_\_\_\_

*6.* Trong 3 giờ, máy bơm bơm được 150 lít. Cần bao nhiêu giờ để bơm 500 lít? \_\_\_\_ giờ

*7.* Hình chữ nhật có diện tích 48 cm². Nếu tăng chiều dài thêm 2 cm, giữ nguyên chiều rộng 6 cm, diện tích mới = \_\_\_\_ cm²

*8.* 1² + 2² + 3² + 4² = \_\_\_\_

*9.* Từ 5 chữ số {1,2,3,4,5} mỗi số dùng 1 lần, số lớn nhất có 3 chữ số chia hết cho 3 là: \_\_\_\_

*10.* Nếu hôm nay thứ 3, thì 100 ngày sau là thứ \_\_\_\_

#v(0.8em)

*Phần 2 — Bài tự luận (15 điểm):*

*Bài 11 (3đ):* Vẽ sơ đồ và giải: Cô giáo có 1 hộp kẹo. Sau khi chia cho 4 tổ mỗi tổ bằng nhau, còn dư 7 cái. Mỗi tổ nhận 12 cái. Hỏi hộp kẹo có bao nhiêu cái?

#dong-viet(n: 3)

*Bài 12 (3đ):* Hai con tàu khởi hành cùng lúc từ hai cảng cách nhau 360 km đi ngược chiều nhau. Tàu A chạy 70 km/giờ, tàu B chạy 50 km/giờ. Sau bao lâu hai tàu gặp nhau?

#dong-viet(n: 3)

*Bài 13 (3đ):* Điền vào lưới logic 4×4 (mỗi hàng, cột, ô 2×2 có số 1–4 không trùng):

#grid(
  columns: (auto, 1fr),
  gutter: 16pt,
  table(
    columns: (1.7cm, 1.7cm, 1.7cm, 1.7cm),
    rows: (1.5cm, 1.5cm, 1.5cm, 1.5cm),
    align: center + horizon,
    stroke: (x, y) => (
      left: if x == 0 or x == 2 { 2.5pt + C-DARK } else { 0.8pt + C-LIGHT },
      top: if y == 0 or y == 2 { 2.5pt + C-DARK } else { 0.8pt + C-LIGHT },
      right: if x == 3 { 2.5pt + C-DARK } else { none },
      bottom: if y == 3 { 2.5pt + C-DARK } else { none },
    ),
    fill: (x, y) => if (x < 2 and y < 2) or (x >= 2 and y >= 2) { rgb("#EDE9FE") } else { white },
    [2], [], [4], [],
    [], [3], [], [1],
    [], [], [2], [],
    [3], [], [], [4],
  ),
  [
    Ghi chú lý luận: \
    #dong-viet(n: 5)
  ],
)

*Bài 14 (3đ):* Đếm hình chữ nhật trong lưới T-hình sau (bao gồm cả hình vuông):

#canvas(length: 1cm, {
  import draw: *
  // T-shape: 3-wide top + 1-wide bottom column
  // Top: 3×2, bottom: 1×2 centered
  for x in range(4) {
    line((x, 2), (x, 4), stroke: 1.5pt + C-CH-NC.at(3))
  }
  for y in range(2, 5) {
    line((0, y), (3, y), stroke: 1.5pt + C-CH-NC.at(3))
  }
  // bottom part (centered, col 1-2)
  for x in range(1, 3) {
    line((x, 0), (x, 2), stroke: 1.5pt + C-CH-NC.at(3))
  }
  for y in range(3) {
    line((1, y), (2, y), stroke: 1.5pt + C-CH-NC.at(3))
  }
})
Số hình chữ nhật: \_\_\_\_  #h(2em) Số hình vuông: \_\_\_\_

*Bài 15 (3đ)* ⭐⭐⭐⭐ *Olympiad:* Viết 100 dưới dạng tổng của các số nguyên dương liên tiếp theo *nhiều cách nhất* có thể. Mỗi cách ghi rõ.

#dong-viet(n: 6)

// ══════════════════════════════════════════════════════════════════════════
// TỰ ĐÁNH GIÁ — SELF ASSESSMENT RUBRIC
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#1E1B4B"), rgb("#312E81"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 16pt, weight: "black")[✍️ Tự Đánh Giá — Self-Assessment Journal]
    #v(0.2em)
    #text(fill: rgb("#FCD34D"), size: 11pt)[Reflect on your learning journey / Nhìn lại hành trình học tập]
  ]
]

#v(0.8em)

#for i in range(1, 5) {
  let (title, title-en) = if i == 1 {
    ("Điều tôi đã học được tốt nhất", "The skill I'm most proud of")
  } else if i == 2 {
    ("Điều tôi muốn luyện tập thêm", "The skill I want to practice more")
  } else if i == 3 {
    ("Bài toán yêu thích của tôi", "My favorite problem in this book")
  } else {
    ("Mục tiêu toán học của tôi", "My math goals for next year")
  }
  block(
    fill: C-CH-NC.at(i - 1).lighten(92%),
    stroke: (left: 3pt + C-CH-NC.at(i - 1)),
    inset: 14pt,
    radius: (right: 8pt),
    below: 12pt,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(i - 1), weight: "bold", size: 11pt)[#str(i). #title]
    #text(fill: C-MID, size: 9.5pt, style: "italic")[ — #title-en]
    #v(0.4em)
    #rect(width: 100%, height: 2.8cm, stroke: 0.7pt + C-LIGHT, fill: white, radius: 4pt)[]
  ]
}

#v(0.4em)
#block(
  fill: C-CH-NC.at(4).lighten(92%),
  stroke: (left: 3pt + C-CH-NC.at(4)),
  inset: 14pt,
  radius: (right: 8pt),
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-CH-NC.at(4), weight: "bold", size: 11pt)[5. Nhắn nhủ bản thân — Message to myself]
  #v(0.4em)
  #rect(width: 100%, height: 3.5cm, stroke: 0.7pt + C-LIGHT, fill: white, radius: 4pt)[]
]
