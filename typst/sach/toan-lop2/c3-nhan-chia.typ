// ══════════════════════════════════════════════════════════════════════════
// c3-nhan-chia.typ — CHƯƠNG 3: NHÂN VÀ CHIA  /  Multiplication & Division
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme.typ": *

#chuong-header(so: 3, ten: "Nhân và Chia  /  Multiplication & Division", icon: "✖️", so-bai: "5", so-trang: "20")

#muc-tieu((
  [Hiểu phép nhân là cộng nhiều lần — Multiplication as repeated addition],
  [Thuộc bảng nhân 2, 3, 4, 5 — Know times tables 2–5],
  [Hiểu phép chia là chia đều — Division as equal sharing],
  [Thuộc bảng chia 2, 3, 4, 5 — Know division tables 2–5],
  [Giải toán đố nhân-chia với mô hình — Solve word problems],
))

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "10", ten-vi: "Ý Nghĩa Phép Nhân", ten-en: "Understanding Multiplication", icon: "✖️", c: C-CH.at(2))
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("phép nhân", "multiplication"),
  ("thừa số", "factor"),
  ("tích", "product"),
  ("nhân", "multiply / times"),
  ("cộng nhiều lần", "repeated addition"),
))

#ly-thuyet(title: "NHÂN = CỘNG NHIỀU LẦN — Multiplication = Repeated Addition")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (auto, 1fr),
    gutter: 14pt,
    [
      #canvas(length: 1cm, {
        import draw: *
        // 3 groups of 4 dots
        for g in range(3) {
          let gx = g * 3.5
          rect((gx, 0), (gx + 3.0, 2.5), fill: C-CH.at(2).lighten(88%), stroke: 1.5pt + C-CH.at(2), radius: 0.3)
          for r in range(2) {
            for c in range(2) {
              circle((gx + 0.8 + c * 1.4, 0.65 + r * 1.1), radius: 0.3, fill: C-CH.at(2), stroke: none)
            }
          }
          content((gx + 1.5, -0.5), text(size: 9pt, fill: C-MID)[Nhóm #str(g + 1)])
        }
        content((5.25, 3.2), text(size: 11pt, weight: "bold")[3 nhóm × 4 = 12])
      })
    ],
    align(horizon)[
      *3 × 4 = 12* có nghĩa là:
      #v(0.3em)
      4 + 4 + 4 = 12 *(cộng 4 ba lần)*
      #text(fill: C-MID, size: 9.5pt)[4 + 4 + 4 = 12 (add 4 three times)]
      #v(0.3em)
      - *3* = số nhóm (*factor*)
      - *4* = số trong mỗi nhóm (*factor*)
      - *12* = tích (*product*)
      #v(0.2em)
      Đọc: "ba nhân bốn bằng mười hai"
      #text(fill: C-MID, size: 9pt, style: "italic")["three times four equals twelve"]
    ],
  )
]

#vi-du(title: "Mẫu tự học: đổi cộng thành nhân")[
  *2 + 2 + 2 + 2 + 2 = 10*
  - Có *5 nhóm*
  - Mỗi nhóm có *2*
  - Vậy viết là *5 × 2 = 10*

  *Ví dụ thêm:* 6 + 6 + 6 = 18 nên viết là *3 × 6 = 18*.
]

#chu-y[
  Học sinh hay nhầm *3 × 4* với *3 + 4*.
  - *3 × 4* là 3 nhóm, mỗi nhóm 4.
  - *3 + 4* chỉ là cộng hai số riêng lẻ.
]

#bt-label(so: "19", title: "Viết phép nhân — Write the multiplication")

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [*a)* 5 + 5 + 5 + 5 = #o-so() → #o-so() × #o-so() = #o-so()],
  [*b)* 3 + 3 + 3 = #o-so() → #o-so() × #o-so() = #o-so()],

  [*c)* Có *4 đĩa*, mỗi đĩa *6 quả cam*. Tổng: #o-so() × #o-so() = #o-so()],
  [*d)* Có *7 hộp*, mỗi hộp *5 cái kẹo*. Tổng: #o-so() × #o-so() = #o-so()],

  [*e)* 9 + 9 + 9 + 9 = #o-so() → #o-so() × #o-so() = #o-so()],
  [*f)* 4 + 4 + 4 + 4 + 4 = #o-so() → #o-so() × #o-so() = #o-so()],

  [*g)* Có *3 hàng*, mỗi hàng *8 bạn*. Tổng: #o-so() × #o-so() = #o-so()],
  [*h)* Có *6 giỏ*, mỗi giỏ *2 quả bóng*. Tổng: #o-so() × #o-so() = #o-so()],
)

#suy-nghi()[
  #set par(first-line-indent: 0em)
  *3 × 5 = 5 × 3* có đúng không? Hãy giải thích bằng hình vẽ hoặc ví dụ.
  #text(fill: C-MID, size: 10pt)[Is 3 × 5 = 5 × 3? Explain with a picture or example.]
  #o-tra-loi(h: 3cm)
]

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "11", ten-vi: "Bảng Nhân 2 và 3", ten-en: "Times Tables: 2 and 3", icon: "2️⃣", c: C-CH.at(2))
// ══════════════════════════════════════════════════════════════════════════

#ly-thuyet(title: "BẢNG NHÂN 2 VÀ 3 — TIMES TABLES 2 & 3")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    block(fill: C-TEAL.lighten(88%), stroke: 2pt + C-TEAL, inset: 12pt, radius: 8pt)[
      #align(center)[#text(fill: C-TEAL, weight: "black", size: 12pt)[× 2  (Bảng 2)]]
      #v(0.4em)
      #grid(
        columns: (1fr, 1fr),
        gutter: 4pt,
        ..range(1, 11).map(i => [
          #text(size: 10pt)[2 × #i = #text(weight: "bold")[#str(2 * i)]]
        ])
      )
    ],
    block(fill: C-ORANGE.lighten(88%), stroke: 2pt + C-ORANGE, inset: 12pt, radius: 8pt)[
      #align(center)[#text(fill: C-ORANGE, weight: "black", size: 12pt)[× 3  (Bảng 3)]]
      #v(0.4em)
      #grid(
        columns: (1fr, 1fr),
        gutter: 4pt,
        ..range(1, 11).map(i => [
          #text(size: 10pt)[3 × #i = #text(weight: "bold")[#str(3 * i)]]
        ])
      )
    ],
  )
]

#meo()[
  *Bảng 2*: Các tích đều là *số chẵn*! / Products of ×2 are always *even*!

  *Bảng 3*: Tổng các chữ số của tích luôn chia hết cho 3. / Digits of ×3 products sum to a multiple of 3!
]

#vi-du(title: "Mẫu tự học: nhảy theo bảng nhân")[
  *Tìm 3 × 7:* đọc dãy 3, 6, 9, 12, 15, 18, *21*.

  *Tìm 2 × 8:* đếm cách 2: 2, 4, 6, 8, 10, 12, 14, *16*.
]

#chu-y[
  Khi đổi chỗ thừa số, tích không đổi: *7 × 2 = 2 × 7*.
  Nhưng đừng đọc nhầm *7 × 2* thành *7 + 2*.
]

#bt-label(so: "20", title: "Điền kết quả — Fill in the products")

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 6pt,
  [2 × 7 = #o-so()], [3 × 6 = #o-so()], [2 × 9 = #o-so()], [3 × 8 = #o-so()],
  [2 × 4 = #o-so()], [3 × 4 = #o-so()], [2 × 6 = #o-so()], [3 × 9 = #o-so()],
  [2 × 10 = #o-so()], [3 × 10 = #o-so()], [7 × 2 = #o-so()], [8 × 3 = #o-so()],
  [2 × 5 = #o-so()], [3 × 7 = #o-so()], [9 × 2 = #o-so()], [10 × 3 = #o-so()],
)

#bt-label(so: "21", title: "Điền thừa số — Fill in the missing factor")

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 6pt,
  [2 × #o-so() = 14], [3 × #o-so() = 18], [#o-so() × 2 = 16], [#o-so() × 3 = 27],
  [2 × #o-so() = 20], [3 × #o-so() = 30], [#o-so() × 2 = 12], [#o-so() × 3 = 21],
  [2 × #o-so() = 18], [3 × #o-so() = 24], [#o-so() × 2 = 10], [#o-so() × 3 = 15],
)

#quy-luat()[
  #set par(first-line-indent: 0em)
  *Tích của 2:* 2, 4, 6, 8, 10, \_\_\_, \_\_\_, \_\_\_, \_\_\_, 20
  #v(0.3em)
  *Tích của 3:* 3, 6, 9, \_\_\_, \_\_\_, \_\_\_, \_\_\_, \_\_\_, \_\_\_, 30
  #v(0.3em)
  Em nhận thấy quy luật gì? / What pattern do you notice?
  #dong-viet(n: 1)
]

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "12", ten-vi: "Bảng Nhân 4 và 5", ten-en: "Times Tables: 4 and 5", icon: "4️⃣", c: C-CH.at(2))
// ══════════════════════════════════════════════════════════════════════════

#ly-thuyet(title: "BẢNG NHÂN 4 VÀ 5")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    block(fill: C-PURPLE.lighten(88%), stroke: 2pt + C-PURPLE, inset: 12pt, radius: 8pt)[
      #align(center)[#text(fill: C-PURPLE, weight: "black", size: 12pt)[× 4  (Bảng 4)]]
      #v(0.4em)
      #grid(
        columns: (1fr, 1fr),
        gutter: 4pt,
        ..range(1, 11).map(i => [
          #text(size: 10pt)[4 × #i = #text(weight: "bold")[#str(4 * i)]]
        ])
      )
    ],
    block(fill: C-GREEN.lighten(88%), stroke: 2pt + C-GREEN, inset: 12pt, radius: 8pt)[
      #align(center)[#text(fill: C-GREEN, weight: "black", size: 12pt)[× 5  (Bảng 5)]]
      #v(0.4em)
      #grid(
        columns: (1fr, 1fr),
        gutter: 4pt,
        ..range(1, 11).map(i => [
          #text(size: 10pt)[5 × #i = #text(weight: "bold")[#str(5 * i)]]
        ])
      )
    ],
  )
]

#meo()[
  *Bảng 5*: Tích luôn tận cùng bằng *0 hoặc 5*! / Products always end in *0 or 5*!

  *Bảng 4* = bảng 2 nhân đôi: 4 × 6 = 2 × 6 × 2 = 12 × 2 = 24
]

#vi-du(title: "Mẫu tự học: tách rồi nhân")[
  *4 × 8:* em có thể nghĩ *2 × 8 = 16*, rồi gấp đôi thành *32*.

  *5 × 7:* đếm theo 5 là 5, 10, 15, 20, 25, 30, *35*.
]

#chu-y[
  Bảng 5 luôn kết thúc bằng *0 hoặc 5*.
  Nếu em tính *5 × 8 = 48* thì chỉ cần nhìn chữ số tận cùng là biết sai ngay.
]

#bt-label(so: "22", title: "Tính — Calculate")

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 6pt,
  [4 × 7 = #o-so()], [5 × 8 = #o-so()], [4 × 9 = #o-so()], [5 × 6 = #o-so()],
  [4 × 6 = #o-so()], [5 × 9 = #o-so()], [9 × 4 = #o-so()], [7 × 5 = #o-so()],
  [4 × 10 = #o-so()], [5 × 10 = #o-so()], [6 × 4 = #o-so()], [8 × 5 = #o-so()],
  [4 × 5 = #o-so()], [5 × 4 = #o-so()], [10 × 4 = #o-so()], [3 × 5 = #o-so()],
)

#nang-cao()[
  #set par(first-line-indent: 0em)
  🌟 *Grid Multiplication* — Điền vào bảng:

  #table(
    columns: (2cm, 2cm, 2cm, 2cm, 2cm, 2cm),
    inset: 9pt,
    align: center,
    stroke: 0.8pt + C-LIGHT,
    fill: (x, y) => if x == 0 or y == 0 { C-CH.at(2).lighten(80%) } else { white },
    [×], [2], [3], [4], [5], [10],
    [6], [], [], [], [], [],
    [7], [], [], [], [], [],
    [8], [], [], [], [], [],
    [9], [], [], [], [], [],
  )
]

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "13", ten-vi: "Phép Chia và Bảng Chia", ten-en: "Division & Division Tables", icon: "➗", c: C-CH.at(2))
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("phép chia", "division"),
  ("số bị chia", "dividend"),
  ("số chia", "divisor"),
  ("thương", "quotient"),
  ("chia đều", "divide equally"),
))

#ly-thuyet(title: "PHÉP CHIA — DIVISION")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (auto, 1fr),
    gutter: 14pt,
    [
      #canvas(length: 1cm, {
        import draw: *
        // 12 circles divided into 4 groups of 3
        for g in range(4) {
          let gx = g * 3.2
          rect((gx, 0), (gx + 2.8, 1.8), fill: C-CH.at(2).lighten(88%), stroke: 1.5pt + C-CH.at(2), radius: 0.3)
          for c in range(3) {
            circle((gx + 0.6 + c * 0.85, 0.9), radius: 0.26, fill: C-CH.at(2), stroke: none)
          }
          content((gx + 1.4, -0.45), text(size: 9pt)[Nhóm #str(g + 1)])
        }
        content((6.2, 2.5), text(size: 11pt, weight: "bold")[12 ÷ 4 = 3])
      })
    ],
    align(horizon)[
      *12 ÷ 4 = 3* có nghĩa là:
      chia 12 thành *4 nhóm* đều nhau
      → mỗi nhóm *3 phần tử*
      #text(fill: C-MID, size: 9pt)[Share 12 into 4 equal groups → 3 in each]
      #v(0.3em)
      *Liên hệ nhân-chia:*
      #text(fill: C-MID, size: 9pt, style: "italic")[Connection between × and ÷:]
      - 4 × 3 = 12 → *12 ÷ 4 = 3*
      - 3 × 4 = 12 → *12 ÷ 3 = 4*
    ],
  )
]

#vi-du(title: "Mẫu tự học: dùng phép nhân để kiểm tra phép chia")[
  *20 ÷ 5 = 4* vì *5 × 4 = 20*.

  *18 ÷ 3 = 6* vì *3 × 6 = 18*.
  Khi quên phép chia, em hãy hỏi: *nhân mấy thì ra số bị chia?*
]

#chu-y[
  Học sinh hay đổi nhầm *24 ÷ 6* thành *6 ÷ 24*.
  Em luôn đọc theo thứ tự: *số bị chia ÷ số chia = thương*.
]

#bt-label(so: "23", title: "Từ phép nhân, viết 2 phép chia — From × write two ÷")

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [*a)* 3 × 8 = 24 → #o-so() ÷ #o-so() = #o-so() và #o-so() ÷ #o-so() = #o-so()],
  [*b)* 5 × 7 = 35 → #o-so() ÷ #o-so() = #o-so() và #o-so() ÷ #o-so() = #o-so()],

  [*c)* 4 × 9 = 36 → #o-so() ÷ #o-so() = #o-so() và #o-so() ÷ #o-so() = #o-so()],
  [*d)* 2 × 10 = 20 → #o-so() ÷ #o-so() = #o-so() và #o-so() ÷ #o-so() = #o-so()],

  [*e)* 6 × 4 = 24 → #o-so() ÷ #o-so() = #o-so() và #o-so() ÷ #o-so() = #o-so()],
  [*f)* 5 × 9 = 45 → #o-so() ÷ #o-so() = #o-so() và #o-so() ÷ #o-so() = #o-so()],
)

#bt-label(so: "24", title: "Tính nhanh — Quick division")

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 6pt,
  [18 ÷ 3 = #o-so()], [20 ÷ 4 = #o-so()], [35 ÷ 5 = #o-so()], [16 ÷ 2 = #o-so()],
  [24 ÷ 4 = #o-so()], [30 ÷ 5 = #o-so()], [27 ÷ 3 = #o-so()], [18 ÷ 2 = #o-so()],
  [40 ÷ 5 = #o-so()], [28 ÷ 4 = #o-so()], [21 ÷ 3 = #o-so()], [14 ÷ 2 = #o-so()],
  [45 ÷ 5 = #o-so()], [32 ÷ 4 = #o-so()], [12 ÷ 3 = #o-so()], [25 ÷ 5 = #o-so()],
)

#sai-o-dau()[
  #set par(first-line-indent: 0em)
  Bạn Lan viết: *24 ÷ 4 = 8* (vì 4 × 8 = 32).
  Sai ở đâu? Đúng ra là bao nhiêu? / Lan wrote: 24 ÷ 4 = 8. Find the mistake!
  #dong-viet(n: 2)
]

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "14", ten-vi: "Toán Đố Nhân Chia", ten-en: "Word Problems: × and ÷", icon: "🧩", c: C-CH.at(2))
// ══════════════════════════════════════════════════════════════════════════

#ly-thuyet(title: "NHẬN DẠNG PHÉP TÍNH — Which operation?")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    block(fill: C-TEAL.lighten(88%), stroke: 1.5pt + C-TEAL, inset: 12pt, radius: 8pt)[
      #text(fill: C-TEAL, weight: "bold")[✖️ Dùng NHÂN khi:\ Use MULTIPLICATION when:]
      #v(0.3em)
      - "mỗi \_\_\_ có \_\_\_" → × #text(fill: C-MID, size: 9pt)["each has \_\_\_"]
      - "gấp \_\_\_ lần" → × #text(fill: C-MID, size: 9pt)["\_\_\_ times as many"]
      - "\_\_\_ nhóm × \_\_\_ mỗi nhóm" #text(fill: C-MID, size: 9pt)[groups × per group]
    ],
    block(fill: C-ORANGE.lighten(88%), stroke: 1.5pt + C-ORANGE, inset: 12pt, radius: 8pt)[
      #text(fill: C-ORANGE, weight: "bold")[➗ Dùng CHIA khi:\ Use DIVISION when:]
      #v(0.3em)
      - "chia đều cho \_\_\_" → ÷ #text(fill: C-MID, size: 9pt)["divide equally"]
      - "mỗi người được \_\_\_" → ÷ #text(fill: C-MID, size: 9pt)["each person gets"]
      - "có bao nhiêu nhóm" → ÷ #text(fill: C-MID, size: 9pt)["how many groups"]
    ],
  )
]

#vi-du(title: "Mẫu tự học: chọn phép tính trước khi tính")[
  *Có 4 túi, mỗi túi 6 viên bi* → dùng *nhân*: *4 × 6 = 24*.

  *Có 24 viên bi chia đều cho 4 bạn* → dùng *chia*: *24 ÷ 4 = 6*.
]

#chu-y[
  Đừng thấy số lớn rồi vội chia.
  Trước hết hãy tìm từ khóa: *mỗi ... có ...* thường là nhân, còn *chia đều* thường là chia.
]

#bt-label(so: "25", title: "Giải toán đố — Solve word problems")

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  block(fill: C-MINT, stroke: 1.5pt + C-GREEN, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    🎁 Có *5 hộp quà*, mỗi hộp có *8 chiếc kẹo*. Chia đều cho *4 bạn*. Mỗi bạn được bao nhiêu kẹo?
    #o-tra-loi(h: 3.5cm, label: "Bài giải:")
  ],
  block(fill: C-PEACH, stroke: 1.5pt + C-ORANGE, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    📚 Có *48 quyển sách* xếp vào các kệ, mỗi kệ *6 quyển*. Cần bao nhiêu kệ? Nếu dùng *4 kệ* thì mỗi kệ được mấy quyển?
    #o-tra-loi(h: 3.5cm, label: "Bài giải:")
  ],

  block(fill: C-LAVENDER, stroke: 1.5pt + C-PURPLE, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    🍊 Có *6 đĩa*, mỗi đĩa *4 quả cam*. Chia đều số cam đó vào *3 giỏ*. Mỗi giỏ có bao nhiêu quả?
    #o-tra-loi(h: 3.5cm, label: "Bài giải:")
  ],
  block(fill: C-CREAM, stroke: 1.5pt + C-GOLD, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    🪑 Xếp *36 chiếc ghế* thành các hàng, mỗi hàng *4 ghế*. Có bao nhiêu hàng? Nếu tăng lên *6 ghế mỗi hàng* thì còn mấy hàng?
    #o-tra-loi(h: 3.5cm, label: "Bài giải:")
  ],
)

#so-do-thanh-goi-y[
  *Khi gặp “nhiều nhóm bằng nhau”, hãy vẽ các phần bằng nhau trước:*

  #align(center)[
    #bar-model(
      label-total: "24",
      parts: (
        (label: "6", w: 2.2),
        (label: "6", w: 2.2),
        (label: "6", w: 2.2),
        (label: "6", w: 2.2),
      ),
      bw: 8.8,
    )
  ]

  4 phần bằng nhau, mỗi phần 6 → *4 × 6 = 24*.
  Nếu biết tổng là 24 và biết mỗi phần là 6, em cũng có thể tìm số phần bằng phép chia.
]

#hai-cach[
  *Hai cách hiểu phép chia 24 ÷ 6 = 4:*
  - Cách 1: chia đều 24 cái kẹo cho 6 bạn, mỗi bạn 4 cái.
  - Cách 2: xếp 24 cái kẹo thành các nhóm 6 cái, được 4 nhóm.

  Cùng một phép chia, nhưng ý nghĩa bài toán có thể khác nhau.
]

#nang-cao()[
  #set par(first-line-indent: 0em)
  🧠 *Singapore Math Challenge:*

  Số hạt đỗ trong túi A gấp *3 lần* túi B. Tổng cả hai túi là *36 hạt*. Mỗi túi có bao nhiêu hạt?
  #text(fill: C-MID, size: 10pt)[Bag A has 3 times as many beans as Bag B. Total = 36. Find each.]

  #bar-model(
    label-total: "36 hạt",
    parts: (
      (label: "Túi A = ?", w: 7.5),
      (label: "B=?", w: 2.5),
    ),
    bw: 10.0,
  )
  #dong-viet(n: 3)
]

#cau-hoi-mo[
  Cùng một phép tính *4 × 6 = 24*, em hãy nghĩ ra *2 câu chuyện khác nhau*:
  - một chuyện về đồ vật;
  - một chuyện về bạn học sinh.

  #o-tra-loi(h: 2.8cm, label: "Câu chuyện của em:")
]

#hai-cach[
  *Hai cách kiểm tra bài chia có dư:* Với 35 ÷ 4 = 8 dư 3.
  - Cách 1: nhân lại 4 × 8 = 32, rồi xem còn dư 3.
  - Cách 2: dùng công thức: số bị chia = số chia × thương + số dư.

  Nếu 4 × 8 + 3 = 35, bài làm là hợp lý.
]

// ═══ ÔN TẬP CHƯƠNG 3 ════════════════════════════════════════════

= Ôn Tập Chương 3 — Review: Multiplication & Division

#set par(first-line-indent: 0em)

*1.* Tính (Calculate):
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 6pt,
  [5 × 8 = #o-so()], [4 × 7 = #o-so()], [3 × 9 = #o-so()], [2 × 10 = #o-so()],
  [40 ÷ 5 = #o-so()], [28 ÷ 4 = #o-so()], [27 ÷ 3 = #o-so()], [18 ÷ 2 = #o-so()],
)

*2.* Điền vào chỗ trống (Fill in):
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 6pt,
  [3 × #o-so() = 24], [#o-so() × 5 = 45], [32 ÷ #o-so() = 8], [#o-so() ÷ 4 = 9],
)

*3.* Grid nhân (Multiplication grid):
#table(
  columns: (2cm, 2cm, 2cm, 2cm, 2cm),
  inset: 9pt,
  align: center,
  stroke: 0.8pt + C-LIGHT,
  fill: (x, y) => if x == 0 or y == 0 { C-CH.at(2).lighten(80%) } else { white },
  [×], [3], [4], [5], [9],
  [3], [], [], [], [],
  [6], [], [], [], [],
  [7], [], [], [], [],
)

*4.* Toán đố: Lớp học có *6 nhóm*, mỗi nhóm *5 học sinh*. Chia đều sách bài tập cho tất cả học sinh, có tổng *150 quyển*. Mỗi học sinh nhận được bao nhiêu quyển?
#o-tra-loi(h: 4cm, label: "Bài giải:")

#kiem-tra-header(chuong: "3", so-cau: "8", tg: "20 phút")

*Câu 1.* 4 × 9 = ?
#trac-nghiem-4(
  [36],
  [32],
  [45],
  [38],
)

*Câu 2.* 35 ÷ 5 = ?
#trac-nghiem-4(
  [6],
  [7],
  [8],
  [5],
)

*Câu 3.* 3 × \_\_\_ = 21 → điền số: #o-so()

*Câu 4.* (2 điểm) Viết 2 phép chia từ phép nhân: 5 × 8 = 40:
#dong-viet(n: 1)

*Câu 5.* (2 điểm) Grid nhân:
#table(
  columns: (2cm, 2cm, 2cm, 2cm),
  inset: 9pt,
  align: center,
  stroke: 0.8pt + C-LIGHT,
  fill: (x, y) => if x == 0 or y == 0 { C-CH.at(2).lighten(80%) } else { white },
  [×], [4], [5], [3],
  [8], [], [], [],
  [9], [], [], [],
)

*Câu 6.* (3 điểm) 🛒 Mua *4 hộp bút*, mỗi hộp *8 cây*. Dùng *18 cây*, tặng bạn *14 cây*. Còn lại bao nhiêu cây?
#o-tra-loi(h: 4cm, label: "Bài giải:")

*Câu 7.* (3 điểm) 🧠 Tư duy: Tổng tích của (3 × a) và (5 × b) bằng *45*. Tìm tất cả các cặp (a, b) nguyên dương có thể.
#o-tra-loi(h: 4cm)

#sao-danh-gia
