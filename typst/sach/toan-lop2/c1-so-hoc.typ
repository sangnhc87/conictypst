// ══════════════════════════════════════════════════════════════════════════
// c1-so-hoc.typ — CHƯƠNG 1: SỐ ĐẾN 1 000  /  Numbers to 1 000
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme.typ": *

#chuong-header(so: 1, ten: "Số Đến 1 000  /  Numbers to 1 000", icon: "🔢", so-bai: "4", so-trang: "18")

#muc-tieu((
  [Đọc, viết các số đến 1 000 — Read & write numbers to 1 000],
  [Phân tích số theo hàng trăm, chục, đơn vị — Place value: hundreds, tens, ones],
  [So sánh và sắp xếp số — Compare and order numbers],
  [Nhận biết số chẵn/lẻ và quy luật số — Even/odd numbers & patterns],
  [Ước lượng số lượng — Estimate quantities],
))

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "1", ten-vi: "Đọc và Viết Số", ten-en: "Reading & Writing Numbers", icon: "✏️", c: C-CH.at(0))
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("trăm", "hundred"),
  ("chục", "ten"),
  ("đơn vị", "one"),
  ("hàng trăm", "hundreds place"),
  ("hàng chục", "tens place"),
  ("hàng đơn vị", "ones place"),
))

#ly-thuyet(title: "PHÂN TÍCH SỐ THEO HÀNG (Place Value)")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (auto, 1fr),
    gutter: 14pt,
    [
      #canvas(length: 1cm, {
        import draw: *
        // Three place value boxes
        let boxes = (
          ("Trăm
Hundreds", "3", C-CH.at(0)),
          ("Chục
Tens", "4", C-CH.at(1)),
          ("Đơn vị
Ones", "7", C-CH.at(2)),
        )
        for (i, b) in boxes.enumerate() {
          let x = i * 3.5
          rect((x, 0.0), (x + 3.0, 4.2), fill: b.at(2).lighten(88%), stroke: 2pt + b.at(2), radius: 0.4)
          content((x + 1.5, 3.2), text(size: 8.5pt, fill: b.at(2), weight: "bold")[#b.at(0)])
          content((x + 1.5, 1.5), text(size: 30pt, fill: b.at(2), weight: "black")[#b.at(1)])
        }
        // Arrow pointing to full number
        content((5.25, -0.65), text(size: 14pt, weight: "black", fill: C-DARK)[= 347])
      })
    ],
    align(horizon)[
      #set text(size: 11pt)
      *Số 347:*
      - 3 trăm (*3* hundreds) → 300
      - 4 chục (*4* tens) → 40
      - 7 đơn vị (*7* ones) → 7
      #v(0.3em)
      *347 = 300 + 40 + 7*
      #v(0.3em)
      Đọc: "ba trăm bốn mươi bảy"
      #v(0.15em)
      #text(fill: C-MID, style: "italic", size: 10pt)[Say: "three hundred forty-seven"]
    ],
  )
]

#vi-du()[
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    [
      *Viết số 508:*
      #v(0.2em)
      #table(
        columns: (3cm, 2cm, 2cm, 2cm),
        inset: 8pt,
        align: center,
        stroke: 0.8pt + C-LIGHT,
        fill: (x, y) => if y == 0 { C-CH.at(0).lighten(82%) } else { white },
        table.header([Số], [Trăm], [Chục], [ĐV]),
        [*508*], [*5*], [*0*], [*8*],
      )
      #v(0.3em)
      508 = 500 + 0 + 8
    ],
    [
      *Viết số 820:*
      #v(0.2em)
      #table(
        columns: (3cm, 2cm, 2cm, 2cm),
        inset: 8pt,
        align: center,
        stroke: 0.8pt + C-LIGHT,
        fill: (x, y) => if y == 0 { C-CH.at(0).lighten(82%) } else { white },
        table.header([Số], [Trăm], [Chục], [ĐV]),
        [*820*], [*8*], [*2*], [*0*],
      )
      #v(0.3em)
      820 = 800 + 20 + 0
    ],

    [
      *Viết số 306:*
      #v(0.2em)
      #table(
        columns: (3cm, 2cm, 2cm, 2cm),
        inset: 8pt,
        align: center,
        stroke: 0.8pt + C-LIGHT,
        fill: (x, y) => if y == 0 { C-CH.at(0).lighten(82%) } else { white },
        table.header([Số], [Trăm], [Chục], [ĐV]),
        [*306*], [*3*], [*0*], [*6*],
      )
      #v(0.3em)
      306 = 300 + 0 + 6
    ],
    [
      *Viết số 971:*
      #v(0.2em)
      #table(
        columns: (3cm, 2cm, 2cm, 2cm),
        inset: 8pt,
        align: center,
        stroke: 0.8pt + C-LIGHT,
        fill: (x, y) => if y == 0 { C-CH.at(0).lighten(82%) } else { white },
        table.header([Số], [Trăm], [Chục], [ĐV]),
        [*971*], [*9*], [*7*], [*1*],
      )
      #v(0.3em)
      971 = 900 + 70 + 1
    ],
  )
]

#bt-label(so: "1", title: "Phân tích số theo hàng (Analyze place value)")

#table(
  columns: (2.8cm, 2.5cm, 2.5cm, 2.5cm, 4.8cm),
  inset: 9pt,
  align: center,
  stroke: 0.8pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH.at(0).lighten(82%) } else if calc.odd(y) { white } else { C-LIGHT.lighten(30%) },
  table.header(
    text(weight: "bold")[Số],
    text(weight: "bold")[Trăm],
    text(weight: "bold")[Chục],
    text(weight: "bold")[ĐV],
    text(weight: "bold")[Phân tích (Expanded Form)],
  ),
  [264], [], [], [], [],
  [509], [], [], [], [],
  [730], [], [], [], [],
  [900 + 60 + 1], [], [], [], [961],
  [400 + 0 + 5], [], [], [], [],
)

#bt-label(so: "2", title: "Viết số thành lời — Write numbers in words")

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [*a)* 435 → #dong-viet(n: 1)], [*b)* 807 → #dong-viet(n: 1)],
  [*c)* "sáu trăm hai mươi" → #o-so(w: 3cm)], [*d)* "nine hundred three" → #o-so(w: 3cm)],
)

#so-do-thanh-goi-y[
  *Nhìn một số như một “thanh tổng”:*
  #align(center)[
    #bar-model(
      label-total: "347",
      parts: (
        (label: "300", w: 6.0),
        (label: "40", w: 1.4),
        (label: "7", w: 0.7),
      ),
      bw: 8.1,
    )
  ]

  Em đọc sơ đồ từ trái sang phải: *3 trăm*, *4 chục*, *7 đơn vị*.
]

#cau-hoi-mo[
  Em hãy tự tạo *2 số có 3 chữ số* rồi viết mỗi số theo *2 cách*:
  - viết bằng lời;
  - phân tích thành trăm, chục, đơn vị.

  #o-tra-loi(h: 2.8cm, label: "Số của em:")
]

#hai-cach[
  *Hai cách nghĩ về số 820:*
  - Cách 1: 820 = 800 + 20 + 0.
  - Cách 2: 820 = 82 chục = 8 trăm 2 chục.

  Cách 1 giúp em tách số để tính. Cách 2 giúp em đếm theo chục và so sánh số nhanh hơn.
]

#suy-nghi()[
  #set par(first-line-indent: 0em)
  Số *nào* có hàng chục bằng 0 và hàng trăm bằng 7?
  Có thể tìm được bao nhiêu số như vậy? / *Which numbers* have 0 tens and 7 hundreds? How many can you find?

  #dong-viet(n: 1)
]

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(
  so: "2",
  ten-vi: "Tia Số và So Sánh Số",
  ten-en: "Number Line & Comparing Numbers",
  icon: "↔️",
  c: C-CH.at(0),
)
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("lớn hơn", "greater than  >"),
  ("nhỏ hơn", "less than  <"),
  ("bằng nhau", "equal to  ="),
  ("tia số", "number line"),
  ("liền trước", "one less"),
  ("liền sau", "one more"),
))

#ly-thuyet(title: "SO SÁNH SỐ — COMPARING NUMBERS")[
  #set par(first-line-indent: 0em)
  #align(center)[
    #tia-so(from: 0, to: 10, buoc: 1, scl: 1.1)
  ]
  #v(0.4em)
  *Quy tắc so sánh / Comparison rule:*
  #v(0.2em)
  So sánh từ *hàng cao nhất* (trăm) trước, rồi đến chục, rồi đến đơn vị.
  #text(
    fill: C-MID,
    style: "italic",
    size: 10pt,
  )[Compare from the *highest place* (hundreds) first, then tens, then ones.]

  #v(0.5em)
  *Ví dụ:* So sánh 564 và 572:
  - Hàng trăm: *5* = *5* → xem tiếp
  - Hàng chục: *6* < *7* → vậy *564 < 572*
]

#bt-label(so: "3", title: "Điền dấu <, >, = vào chỗ trống — Fill in <, >, or =")

#set par(first-line-indent: 0em)
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  [*a)* 345 #_blank 354], [*b)* 700 #_blank 699], [*c)* 508 #_blank 580],
  [*d)* 620 #_blank 6 trăm 2 chục], [*e)* 409 #_blank 490], [*f)* 1000 #_blank 999],
)

#bt-label(so: "4", title: "Sắp xếp — Order the numbers")

*a)* Tăng dần (ascending): 534, 453, 345, 543, 435, 354
#dong-viet(n: 1)

*b)* Giảm dần (descending): 621, 261, 612, 162, 216, 126
#dong-viet(n: 1)

*c)* Tăng dần (ascending): 817, 187, 781, 718, 178, 871
#dong-viet(n: 1)

*d)* Giảm dần (descending): 426, 264, 642, 246, 624, 462
#dong-viet(n: 1)

#bt-label(so: "5", title: "Số liền trước và liền sau — One less / One more")

#table(
  columns: (3cm, 3cm, 3cm),
  inset: 10pt,
  align: center,
  stroke: 0.8pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH.at(0).lighten(82%) } else if x == 1 { rgb("#FEF3C7") } else { white },
  table.header(
    text(weight: "bold")[Liền trước\ (One less)],
    text(weight: "bold")[Số\ (Number)],
    text(weight: "bold")[Liền sau\ (One more)],
  ),
  [], [450], [],
  [], [699], [],
  [], [799], [],
  [], [1000], [],
  [299], [], [],
  [], [375], [],
  [], [500], [],
  [749], [], [],
)

#sai-o-dau()[
  #set par(first-line-indent: 0em)
  Bạn Minh viết: *"450 > 540 vì 4 > 5"*.
  Em hãy giải thích bạn Minh sai ở đâu và sửa lại đúng.

  Bạn Minh made an error. Find it and correct it!

  #dong-viet(n: 2)
]

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(
  so: "3",
  ten-vi: "Số Chẵn, Số Lẻ và Quy Luật Số",
  ten-en: "Even, Odd Numbers & Number Patterns",
  icon: "🎭",
  c: C-CH.at(0),
)
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("số chẵn", "even number"),
  ("số lẻ", "odd number"),
  ("quy luật", "pattern"),
  ("tiếp theo", "next"),
))

#ly-thuyet(title: "SỐ CHẴN VÀ SỐ LẺ — EVEN & ODD")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    block(fill: C-BLUE.lighten(88%), stroke: 1.5pt + C-BLUE, inset: 12pt, radius: 8pt)[
      #align(center)[#text(fill: C-BLUE, weight: "black", size: 12pt)[Số Chẵn / Even Numbers]]
      #v(0.4em)
      #set text(size: 11pt)
      Số *chẵn* tận cùng bằng: *0, 2, 4, 6, 8*
      #text(fill: C-MID, size: 9.5pt)[Even numbers end in: 0, 2, 4, 6, 8]
      #v(0.3em)
      Ví dụ: 2, 4, 6, 8, *..., 100, 102, 104 ...*
      #v(0.2em)
      Chia đôi được đúng / Can be split equally: ● ● | ● ●
    ],
    block(fill: C-ORANGE.lighten(88%), stroke: 1.5pt + C-ORANGE, inset: 12pt, radius: 8pt)[
      #align(center)[#text(fill: C-ORANGE, weight: "black", size: 12pt)[Số Lẻ / Odd Numbers]]
      #v(0.4em)
      #set text(size: 11pt)
      Số *lẻ* tận cùng bằng: *1, 3, 5, 7, 9*
      #text(fill: C-MID, size: 9.5pt)[Odd numbers end in: 1, 3, 5, 7, 9]
      #v(0.3em)
      Ví dụ: 1, 3, 5, 7, *..., 101, 103, 105 ...*
      #v(0.2em)
      Chia đôi thừa 1 / One is left over: ● ● | ● ● | ●
    ],
  )
]

#bt-label(so: "6", title: "Khoanh tròn — Circle the correct answers")

*a)* Khoanh tròn các số chẵn / Circle the even numbers:
#block(fill: C-LIGHT.lighten(20%), inset: 10pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (8 * (1fr,)),
    gutter: 6pt,
    [143], [256], [387], [500], [691], [742], [835], [908],
  )
]

*b)* Viết 5 số lẻ lớn hơn 300 và nhỏ hơn 320 / Write 5 odd numbers between 300 and 320:
#dong-viet(n: 1)

#bt-label(so: "7", title: "Tìm quy luật — Find the Pattern")

#quy-luat()[
  #set par(first-line-indent: 0em)
  *a)* 10, 20, 30, \_\_\_, \_\_\_, \_\_\_, 70 #h(2em) Quy luật: cộng thêm *\_\_\_* mỗi lần
  #v(0.5em)
  *b)* 500, 510, 520, \_\_\_, \_\_\_, \_\_\_, 560 #h(2em) Pattern: add *\_\_\_* each time
  #v(0.5em)
  *c)* 100, 200, 300, \_\_\_, \_\_\_, \_\_\_, 700 #h(2em) Quy luật: cộng thêm *\_\_\_* mỗi lần
  #v(0.5em)
  *d)* 999, 990, 981, \_\_\_, \_\_\_, \_\_\_ #h(2em) Pattern: subtract *\_\_\_* each time
  #v(0.5em)
  *e)* 3, 6, 9, \_\_\_, \_\_\_, \_\_\_, 21 #h(2em) Quy luật: \_\_\_
]

#nang-cao()[
  #set par(first-line-indent: 0em)
  *Bài 1:* Tổng của 3 số chẵn liên tiếp là *78*. Tìm 3 số đó.
  #text(fill: C-MID, size: 10pt, style: "italic")[The sum of 3 consecutive even numbers is 78. Find them.]
  #dong-viet(n: 2)

  *Bài 2:* Dùng 3 chữ số *2, 5, 8* (mỗi chữ số dùng một lần) để viết:
  #v(0.2em)
  - Số lớn nhất có thể: #o-so()
  - Số nhỏ nhất có thể: #o-so()
  - Tất cả các số có thể viết được: #dong-viet(n: 1)
]

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(
  so: "4",
  ten-vi: "Ước Lượng và Làm Tròn Số",
  ten-en: "Estimating & Rounding Numbers",
  icon: "🎯",
  c: C-CH.at(0),
)
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("ước lượng", "estimate"),
  ("làm tròn", "round"),
  ("xấp xỉ", "approximately"),
  ("hàng chục gần nhất", "nearest ten"),
))

#ly-thuyet(title: "LÀM TRÒN SỐ — ROUNDING NUMBERS")[
  #set par(first-line-indent: 0em)
  *Làm tròn đến hàng chục:*

  Nhìn vào chữ số *hàng đơn vị*:
  - Nếu ≥ 5 → làm tròn *lên* (round up)
  - Nếu < 5 → làm tròn *xuống* (round down)

  #v(0.4em)
  #align(center)[
    #canvas(length: 1cm, {
      import draw: *
      // Number line showing 240-250
      line((0, 1.5), (11, 1.5), mark: (end: ">"), stroke: 2pt + C-CH.at(0))
      for i in range(11) {
        line((i, 1.2), (i, 1.8), stroke: 1.5pt + C-DARK)
        if calc.rem(i, 5) == 0 {
          let num = 240 + i
          content((i, 0.75), text(size: 9pt, weight: "bold")[#num])
        }
      }
      // Show 243 → 240
      circle((3, 1.5), radius: 0.18, fill: C-BLUE)
      content((3, 2.3), text(size: 9pt, fill: C-BLUE)[243])
      line((3, 2.0), (0, 2.0), stroke: (paint: C-BLUE, dash: "dotted"), mark: (end: ">"))
      content((1.5, 2.55), text(size: 8.5pt, fill: C-BLUE)[→ 240])
      // Show 247 → 250
      circle((7, 1.5), radius: 0.18, fill: C-RED)
      content((7, 2.3), text(size: 9pt, fill: C-RED)[247])
      line((7, 2.0), (10, 2.0), stroke: (paint: C-RED, dash: "dotted"), mark: (end: ">"))
      content((8.5, 2.55), text(size: 8.5pt, fill: C-RED)[→ 250])
    })
  ]
]

#bt-label(so: "8", title: "Làm tròn đến hàng chục — Round to nearest ten")

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 8pt,
  [234 ≈ #o-so()], [387 ≈ #o-so()], [505 ≈ #o-so()], [799 ≈ #o-so()],
  [643 ≈ #o-so()], [451 ≈ #o-so()], [918 ≈ #o-so()], [265 ≈ #o-so()],
)

#bt-label(so: "9", title: "Làm tròn đến hàng trăm — Round to nearest hundred")

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 8pt,
  [350 ≈ #o-so()], [720 ≈ #o-so()], [450 ≈ #o-so()], [890 ≈ #o-so()],
)

#suy-nghi()[
  #set par(first-line-indent: 0em)
  Một số khi làm tròn đến hàng chục được *370*.
  Số đó có thể là những số nào? Kể hết! / A number rounds to 370. What could it be? List all!

  #dong-viet(n: 1)
]

// ═══ ÔN TẬP CHƯƠNG 1 + KIỂM TRA ══════════════════════════════════════════

= Ôn Tập Chương 1 — Review: Numbers to 1 000

#set par(first-line-indent: 0em)

*1.* Phân tích số (Place value analysis):
#table(
  columns: (2.8cm, 2.5cm, 2.5cm, 2.5cm, 4.8cm),
  inset: 9pt,
  align: center,
  stroke: 0.8pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH.at(0).lighten(82%) } else if calc.odd(y) { white } else { C-LIGHT.lighten(30%) },
  table.header([Số], [Trăm], [Chục], [ĐV], [Expanded Form]),
  [738], [], [], [], [],
  [605], [], [], [], [],
  [910], [], [], [], [],
  [400+70+2], [], [], [], [472],
)

*2.* So sánh (Compare):
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 8pt,
  [457 #_blank 475], [6 trăm lẻ 3 #_blank 630], [999 #_blank 1000],
  [500 #_blank 50 chục], [7 trăm #_blank 69 chục 10], [308 #_blank 380],
)

*3.* Sắp xếp tăng dần (Order ascending): 847, 748, 874, 478, 784, 487
#dong-viet(n: 1)

*4.* Quy luật (Pattern):
#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [*a)* 5, 10, 15, \_\_\_, \_\_\_, \_\_\_, 35], [*b)* 800, 700, 600, \_\_\_, \_\_\_, \_\_\_, 300],
)

*5.* Làm tròn (Round): 365 ≈ #o-so() (đến hàng chục) #h(2em) 365 ≈ #o-so() (đến hàng trăm)

#nang-cao()[
  #set par(first-line-indent: 0em)
  🌟 *Singapore Math — Bar Model:*

  Trong hộp A có *số chẵn* lớn nhất có 3 chữ số. Hộp B có ít hơn hộp A *9 chục*. Hỏi hộp B có bao nhiêu?

  #bar-model(
    label-total: "?",
    parts: (
      (label: "Hộp A = ?", w: 7.0),
      (label: "90", w: 2.5),
    ),
    bw: 9.5,
  )
  #dong-viet(n: 2)
]

#kiem-tra-header(chuong: "1", so-cau: "10", tg: "20 phút")

*Câu 1.* Số nào có 5 trăm, 0 chục, 3 đơn vị?
#trac-nghiem-4(
  [530],
  [503],
  ["053"],
  [350],
)

*Câu 2.* 700 + 30 + 8 = ?
#trac-nghiem-4(
  [738],
  [783],
  [7308],
  [708],
)

*Câu 3.* Điền dấu: 504 #_blank 540 #h(2em) 699 #_blank 700 #h(2em) 8 chục 5 #_blank 850

*Câu 4.* Số chẵn lớn nhất có 3 chữ số là:
#trac-nghiem-4(
  [900],
  [998],
  [988],
  [999],
)

*Câu 5.* 375 làm tròn đến hàng chục là:
#trac-nghiem-4(
  [370],
  [380],
  [400],
  [300],
)

*Câu 6.* (2 điểm) Phân tích số 829 và 508. Số nào lớn hơn? Giải thích.
#o-tra-loi(h: 3cm)

*Câu 7.* (2 điểm) Viết 4 số có 3 chữ số mà tổng của hàng trăm và hàng đơn vị bằng 10.
#o-tra-loi(h: 3cm)

*Câu 8.* (3 điểm) 🧠 Tư duy: Dùng 3 chữ số *1, 4, 7*:
- Số lớn nhất: #o-so() — Số nhỏ nhất: #o-so()
- Viết số gần 500 nhất: #o-so()
- Sắp xếp tất cả 6 số theo thứ tự tăng dần: #dong-viet(n: 1)

#sao-danh-gia
