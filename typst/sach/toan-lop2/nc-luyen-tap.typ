// ══════════════════════════════════════════════════════════════════════════
// nc-luyen-tap.typ — Extra Practice & Review / Luyện Tập Mở Rộng
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

// ══════════════════════════════════════════════════════════════════════════
// ÔN TẬP GIỮA KỲ — MID-TERM COMPREHENSIVE REVIEW
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#B45309"), rgb("#92400E"), angle: 90deg),
  inset: (x: 20pt, y: 16pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 20pt, weight: "black")[🌟 Ôn Tập Giữa Kỳ]
    #v(0.3em)
    #text(fill: rgb("#FDE68A"), size: 14pt)[Mid-Term Comprehensive Review]
    #v(0.2em)
    #text(fill: white.transparentize(20%), size: 10pt)[Chương 1 + Chương 2 / Chapters 1 + 2]
  ]
]

#v(0.8em)

#block(fill: rgb("#FFF7ED"), stroke: 1.5pt + C-GOLD, inset: 14pt, radius: 10pt)[
  #set text(size: 10pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 10pt,
    [*⏱ Thời gian:* 30 phút], [*📝 Điểm tối đa:* 20 điểm], [*🎯 Cấp độ:* ⭐⭐⭐],
  )
]

#v(0.8em)

== Phần A: Điền vào chỗ trống (6 điểm)

*Bài 1.* Điền số thích hợp vào ô trống (mỗi câu 0.5đ):

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    *a)* Dãy số: 5, 10, 20, 40, \_\_\_\_, \_\_\_\_ \
    Quy luật: nhân với \_\_\_\_ \
    #v(0.6em)
    *b)* Dãy số: 100, 95, 90, \_\_\_\_, \_\_\_\_  \
    Quy luật: trừ đi \_\_\_\_ \
    #v(0.6em)
    *c)* 1, 1, 2, 3, 5, \_\_\_\_, \_\_\_\_ \
    Đây là dãy số \_\_\_\_\_\_\_\_\_\_\_ \
  ],
  [
    *d)* Điền vào ô vuông ma thuật (tổng = 18): \
    #block(fill: white, inset: 10pt)[
      #table(
        columns: (2cm, 2cm, 2cm),
        rows: (1.2cm, 1.2cm, 1.2cm),
        align: center + horizon,
        inset: 6pt,
        stroke: 1.5pt + C-DARK,
        fill: (x, y) => {
          if (x == 0 and y == 1) or (x == 1 and y == 0) or (x == 2 and y == 1) or (x == 1 and y == 2) {
            C-GOLD.lighten(70%)
          } else { white }
        },
        [3], [], [9],
        [], [6], [],
        [7], [], [5],
      )
    ]
  ],
)

#v(0.5em)
*Bài 2.* Tính nhẩm thật nhanh (mỗi câu 0.5đ):

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 10pt,
  [*a)* 456 + 99 = \_\_\_\_], [*b)* 700 − 198 = \_\_\_\_], [*c)* 7 × 9 = \_\_\_\_], [*d)* 48 ÷ 6 = \_\_\_\_],
  [*e)* 25 × 4 = \_\_\_\_], [*f)* 11 × 8 = \_\_\_\_], [*g)* 300 − 145 = \_\_\_\_], [*h)* 9 × 9 = \_\_\_\_],
)

#v(0.8em)

== Phần B: Bài toán ngắn (8 điểm)

*Bài 3.* (2đ) Cửa hàng có 240 quyển vở. Buổi sáng bán được 75 quyển. Buổi chiều bán được *gấp đôi* buổi sáng. Hỏi cuối ngày còn lại bao nhiêu quyển?

#dong-viet(n: 3)

*Bài 4.* (2đ) Một số chia cho 7 được 8 dư 3. Tìm số đó.

#dong-viet(n: 2)

*Bài 5.* (2đ) Trong hộp có một số viên bi. Nếu xếp thành hàng 4, dư 2. Nếu xếp thành hàng 5, dư 3. Hỏi có thể có bao nhiêu viên bi? (Tìm số nhỏ nhất)

#dong-viet(n: 3)

*Bài 6.* (2đ) Tổng chữ số của một số bằng 12. Số đó là số có 3 chữ số, chữ số hàng trăm là 5. Tìm TẤT CẢ các số thỏa mãn điều kiện này.

#dong-viet(n: 3)

#v(0.5em)

== Phần C: Thử Thách ⭐⭐⭐⭐ (6 điểm)

*Bài 7.* (3đ) Lan có một số tiền. Nếu mua 3 quyển sách thì thiếu 6.000đ. Nếu mua 2 quyển sách thì thừa 5.000đ. Tính giá một quyển sách và số tiền Lan có.

#dong-viet(n: 4)

*Bài 8.* (3đ) Viết tất cả các số tự nhiên có tổng chữ số bằng 5 và có đúng 3 chữ số (chữ số đầu ≠ 0). Đếm xem có tất cả bao nhiêu số.

#dong-viet(n: 4)

// ══════════════════════════════════════════════════════════════════════════
// LUYỆN TẬP MỞ RỘNG — CHƯƠNG 1: TƯ DUY SỐ HỌC
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(C-CH-NC.at(0), rgb("#1E3A8A"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[🧠 Luyện Tập Mở Rộng — Chương 1]
    #v(0.3em)
    #text(fill: rgb("#FCD34D"), size: 12pt)[Extended Practice — Number Logic (Ch. 1)]
  ]
]

#v(0.8em)

#bt-label(so: "C1-1", title: "⭐⭐ Dãy số nâng cao — Advanced sequences")

*A. Tìm quy luật và điền tiếp:*

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    *1)* 3, 6, 12, 24, \_\_\_\_, \_\_\_\_, \_\_\_\_ \
    *2)* 100, 50, 25, \_\_\_\_, \_\_\_\_ \
    *3)* 1, 4, 9, 16, 25, \_\_\_\_, \_\_\_\_ \
    _(Đây là dãy số bình phương!)_ \
    *4)* 2, 3, 5, 7, 11, \_\_\_\_, \_\_\_\_ \
    _(Đây là dãy số nguyên tố!)_
  ],
  [
    *5)* Dãy có hai quy luật xen kẽ: \
    #h(1em) 2, 5, 4, 7, 6, 9, \_\_\_\_, \_\_\_\_ \
    Hàng lẻ: \_\_\_\_\_\_ ; Hàng chẵn: \_\_\_\_\_\_ \
    *6)* Điền số vào tam giác số: \
    #canvas(length: 0.85cm, {
      import draw: *
      for (r, row-vals) in (
        (0, ("", "1")),
        (1, ("1", "2", "1")),
        (2, ("1", "3", "3", "1")),
        (3, ("1", "", "", "", "1")),
      ) {
        for (c, v) in row-vals.enumerate() {
          let x = c * 1.0 - r * 0.5
          let y = -r * 1.2
          circle(
            (x, y),
            radius: 0.38,
            fill: if v == "" { white } else { C-CH-NC.at(0).lighten(80%) },
            stroke: 1.5pt + C-CH-NC.at(0),
          )
          content((x, y), text(size: 8pt, weight: "bold")[#v])
        }
      }
    })
  ],
)

#v(0.6em)
*B. Câu đố dãy số:* Dãy sau đây tăng theo kiểu đặc biệt. Hãy tìm quy luật:

#align(center)[
  #block(fill: C-LAVENDER, inset: 12pt, radius: 8pt)[
    #text(size: 13pt, weight: "bold")[1, 11, 21, 1211, 111221, 312211, \_\_\_\_\_\_\_\_\_\_\_\_]
  ]
]
#text(size: 9.5pt, style: "italic")[_(Gợi ý: Đọc to các chữ số của số trước để tạo ra số tiếp theo!)_]

#v(0.8em)

#bt-label(so: "C1-2", title: "⭐⭐⭐ Ô vuông ma thuật đặc biệt — Special magic squares")

*A. Ô vuông ma thuật bậc 3 (Magic Sum = 15):*

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 20pt,
  [
    *Điền hàng và cột:* \
    #table(
      columns: (1.8cm, 1.8cm, 1.8cm),
      rows: (1.2cm, 1.2cm, 1.2cm),
      align: center + horizon,
      inset: 6pt,
      stroke: 1.5pt + C-DARK,
      [], [6], [],
      [5], [], [],
      [], [], [4],
    )
    Tổng mỗi hàng/cột = ?
  ],
  [
    *Biến thể — dùng số lẻ:* \
    _(Dùng 1,3,5,7,9,11,13,15,17)_ \
    Tổng ma thuật = \_\_\_\_ \
    #table(
      columns: (1.8cm, 1.8cm, 1.8cm),
      rows: (1.2cm, 1.2cm, 1.2cm),
      align: center + horizon,
      inset: 6pt,
      stroke: 1.5pt + C-DARK,
      [], [11], [],
      [13], [], [9],
      [], [], [],
    )
  ],
  [
    *Thử thách — điền tự do:* \
    Tạo ô vuông ma thuật 3×3 với tổng ma thuật = *21*. \
    _(Gợi ý: dùng bộ 3 số: 5,7,9,...)_ \
    #table(
      columns: (1.8cm, 1.8cm, 1.8cm),
      rows: (1.2cm, 1.2cm, 1.2cm),
      align: center + horizon,
      inset: 6pt,
      stroke: 1.5pt + C-DARK,
      [], [], [],
      [], [], [],
      [], [], [],
    )
  ],
)

#v(0.6em)
*B.* Trong ô vuông ma thuật 3×3, tổng ma thuật liên quan đến số trung tâm như thế nào? Quan sát và điền:

#block(fill: C-LAVENDER, inset: 12pt, radius: 8pt)[
  Nếu số ở ô trung tâm = n, thì tổng ma thuật = \_\_\_\_\_ × n. \
  Kiểm tra: n=5 → tổng = 15 ✓ ; n=6 → tổng = \_\_\_\_ ; n=7 → tổng = \_\_\_\_
]

#v(0.8em)

#bt-label(so: "C1-3", title: "⭐⭐⭐ Khám phá số học — Number exploration")

*A. Số hoàn hảo (Perfect Numbers):* Số hoàn hảo là số bằng tổng các ước số thực của nó.

#block(fill: C-TEAL.lighten(88%), stroke: 1.5pt + C-TEAL, inset: 12pt, radius: 8pt)[
  Ví dụ: 6 = 1 + 2 + 3 (các ước của 6 là 1, 2, 3, 6; ước thực = 1, 2, 3; 1+2+3=6) ✓ \
  → 6 là số *hoàn hảo*!
]

Tìm tất cả ước thực của 28 và kiểm tra xem 28 có phải số hoàn hảo không:

#dong-viet(n: 3)

*B. Số thân thiện (Friendly Numbers):* 220 và 284 là cặp số thân thiện vì: tổng các ước thực của 220 = 284 và tổng các ước thực của 284 = 220.

Tìm các ước thực của 284: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Tổng = \_\_\_\_ (kiểm tra: có bằng 220 không?)

// ══════════════════════════════════════════════════════════════════════════
// LUYỆN TẬP MỞ RỘNG — CHƯƠNG 2: TÍNH NHẨM
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(C-CH-NC.at(1), rgb("#1E3A8A"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[⚡ Luyện Tập Mở Rộng — Chương 2]
    #v(0.3em)
    #text(fill: rgb("#FCD34D"), size: 12pt)[Extended Practice — Mental Math (Ch. 2)]
  ]
]

#v(0.8em)

#bt-label(so: "C2-1", title: "⭐⭐ Bảng cộng trừ tốc độ — Speed addition & subtraction")

*A. Điền vào bảng:* (Ghi kết quả, tính nhẩm không dùng bút)

#table(
  columns: (2.5cm, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  inset: (x: 6pt, y: 8pt),
  stroke: 0.8pt + C-LIGHT,
  fill: (x, y) => if x == 0 or y == 0 { C-CH-NC.at(1).lighten(80%) } else { white },
  [+ \/ −], [53], [78], [124], [275], [389], [507],
  [+ 47], [], [], [], [], [], [],
  [+ 99], [], [], [], [], [], [],
  [− 28], [], [], [], [], [], [],
  [− 198], [], [], [], [], [], [],
)

#v(0.6em)
*B. Điền số còn thiếu:*

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 16pt,
  [*1)* \_\_\_\_ + 145 = 300], [*2)* 500 − \_\_\_\_ = 237], [*3)* \_\_\_\_ − 88 = 312],
  [*4)* 75 + \_\_\_\_ = 123], [*5)* \_\_\_\_ + 256 = 400], [*6)* 1000 − \_\_\_\_ = 643],
)

#v(0.8em)

#bt-label(so: "C2-2", title: "⭐⭐⭐ Bảng nhân tốc độ — Multiplication speed drill")

*A. Thi đua nhân nhanh:* Điền kết quả vào ô trống

#table(
  columns: (2.5cm, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  inset: (x: 5pt, y: 7pt),
  stroke: 0.8pt + C-LIGHT,
  fill: (x, y) => if x == 0 or y == 0 { C-CH-NC.at(1).lighten(80%) } else if x == y { C-GOLD.lighten(70%) } else {
    white
  },
  [×], [2], [3], [4], [5], [6], [7], [8], [9], [11],
  [3], [], [], [], [], [], [], [], [], [],
  [4], [], [], [], [], [], [], [], [], [],
  [6], [], [], [], [], [], [], [], [], [],
  [7], [], [], [], [], [], [], [], [], [],
  [8], [], [], [], [], [], [], [], [], [],
  [9], [], [], [], [], [], [], [], [], [],
)

#v(0.6em)
*B. Dùng các mẹo nhân:*

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,
  [
    *×9 trick:* (n×10) − n \
    Điền nhanh: \
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 8pt,
      [13×9=\_\_\_\_], [15×9=\_\_\_\_], [12×9=\_\_\_\_],
      [14×9=\_\_\_\_], [18×9=\_\_\_\_], [16×9=\_\_\_\_],
    )
  ],
  [
    *×11 trick:* (n×10) + n \
    Điền nhanh: \
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 8pt,
      [13×11=\_\_\_\_], [15×11=\_\_\_\_], [12×11=\_\_\_\_],
      [14×11=\_\_\_\_], [18×11=\_\_\_\_], [16×11=\_\_\_\_],
    )
  ],
)

#v(0.8em)

#bt-label(so: "C2-3", title: "⭐⭐ Chia có dư — Division with remainder worksheet")

*A.* Chia và ghi kết quả (thương + số dư):

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 12pt,
  [*1)* 47 ÷ 5 = \_\_\_ dư \_\_\_], [*2)* 83 ÷ 9 = \_\_\_ dư \_\_\_], [*3)* 100 ÷ 7 = \_\_\_ dư \_\_\_],
  [*4)* 65 ÷ 8 = \_\_\_ dư \_\_\_], [*5)* 91 ÷ 6 = \_\_\_ dư \_\_\_], [*6)* 74 ÷ 3 = \_\_\_ dư \_\_\_],
  [*7)* 57 ÷ 4 = \_\_\_ dư \_\_\_], [*8)* 78 ÷ 11 = \_\_\_ dư \_\_\_], [*9)* 123 ÷ 5 = \_\_\_ dư \_\_\_],
)

#v(0.5em)
*B. Bài toán có lời:*

*1)* Giáo viên có 95 cái kẹo. Chia đều cho 8 học sinh. Mỗi học sinh được bao nhiêu cái? Còn thừa bao nhiêu cái?
#dong-viet(n: 2)

*2)* Một lớp có 37 học sinh. Chia thành các nhóm mỗi nhóm 4 người. Được bao nhiêu nhóm đầy đủ? Nhóm cuối cùng có bao nhiêu người?
#dong-viet(n: 2)

*C. Điền số vào ô trống:*

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 12pt,
  [\_\_\_\_ ÷ 6 = 7 dư 4], [\_\_\_\_ ÷ 8 = 9 dư 3], [\_\_\_\_ ÷ 7 = 12 dư 1],
)

// ══════════════════════════════════════════════════════════════════════════
// LUYỆN TẬP MỞ RỘNG — CHƯƠNG 3: CHIẾN LƯỢC
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(C-CH-NC.at(2), rgb("#065F46"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[🎯 Luyện Tập Mở Rộng — Chương 3]
    #v(0.3em)
    #text(fill: rgb("#FCD34D"), size: 12pt)[Extended Practice — Problem-Solving (Ch. 3)]
  ]
]

#v(0.8em)

#bt-label(so: "C3-1", title: "⭐⭐ Vẽ sơ đồ thanh Singapore — Singapore model")

Vẽ sơ đồ thanh và giải từng bài toán:

*Bài 1:* Trường Minh có 450 học sinh. Số học sinh nữ nhiều hơn số học sinh nam là 30. Tìm số học sinh nam và nữ.

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  [
    *Sơ đồ:* \
    #rect(width: 100%, height: 4cm, stroke: 1pt + C-LIGHT, fill: white, radius: 4pt)[]
  ],
  [
    *Bài giải:* \
    #dong-viet(n: 5)
  ],
)

*Bài 2:* Ba bạn An, Bình, Châu có tổng cộng 120 viên bi. Bình có gấp đôi An. Châu có gấp 3 lần An. Tìm số bi của mỗi bạn.

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  [
    *Sơ đồ thanh:* \
    #rect(width: 100%, height: 4.5cm, stroke: 1pt + C-LIGHT, fill: white, radius: 4pt)[]
  ],
  [
    *Bài giải:* \
    #dong-viet(n: 5)
  ],
)

#v(0.8em)

#bt-label(so: "C3-2", title: "⭐⭐⭐ Lập bảng thử — Make a table & guess-check")

*Bài 3 — Bài toán gà và thỏ:* Trong chuồng có 12 con gà và thỏ. Đếm được 36 chân. Hỏi có bao nhiêu con mỗi loại?

Điền bảng thử:

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center + horizon,
  inset: (x: 10pt, y: 8pt),
  stroke: 0.8pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH-NC.at(2).lighten(80%) } else { white },
  [Gà], [Thỏ], [Tổng con], [Số chân gà], [Tổng chân],
  [12], [0], [12], [24], [24],
  [10], [2], [12], [20], [28],
  [], [], [], [], [],
  [], [], [], [], [],
  [], [], [], [], [],
  [], [], [], [], [],
)

Đáp án: \_\_\_\_ con gà, \_\_\_\_ con thỏ

*Bài 4 — Bài toán vé:* Vé người lớn giá 15.000đ, vé trẻ em giá 8.000đ. Một gia đình mua 6 vé tốn 72.000đ. Hỏi có bao nhiêu vé người lớn?

#dong-viet(n: 3)

#v(0.8em)

#bt-label(so: "C3-3", title: "⭐⭐⭐ Làm ngược — Work backwards")

*Bài 5:* Một số được cộng thêm 15, rồi nhân 3, rồi trừ 12 thì được 54. Tìm số ban đầu.

Sơ đồ làm ngược:
#block(fill: C-LAVENDER, inset: 10pt, radius: 8pt)[
  #grid(
    columns: (auto, auto, auto, auto, auto, auto, auto),
    gutter: 6pt,
    align: center + horizon,
    [?], [→ +15 →], [\_\_\_], [→ ×3 →], [\_\_\_], [→ −12 →], [54],
  )
  #v(0.4em)
  Làm ngược: 54 → \_\_\_ → \_\_\_ → số ban đầu = \_\_\_\_
]

*Bài 6:* Mẹ mua hoa quả. Sau khi mua táo thì số tiền giảm còn một nửa. Sau khi mua cam thì còn lại 20.000đ ít hơn số đó. Cuối cùng mẹ có 5.000đ. Hỏi mẹ có bao nhiêu tiền ban đầu?

#dong-viet(n: 4)

// ══════════════════════════════════════════════════════════════════════════
// LUYỆN TẬP MỞ RỘNG — CHƯƠNG 4: HÌNH HỌC
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(C-CH-NC.at(3), rgb("#6B21A8"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[📐 Luyện Tập Mở Rộng — Chương 4]
    #v(0.3em)
    #text(fill: rgb("#FCD34D"), size: 12pt)[Extended Practice — Geometry (Ch. 4)]
  ]
]

#v(0.8em)

#bt-label(so: "C4-1", title: "⭐⭐ Đếm hình trong hình — Count shapes within shapes")

*Bài 1.* Trong hình dưới đây, hãy đếm số hình tam giác:

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    *a) Tam giác được chia đôi:*
    #canvas(length: 1cm, {
      import draw: *
      // Large triangle divided into 4 smaller ones
      line((0, 0), (4, 0), (2, 3.46), close: true, stroke: 2pt + C-CH-NC.at(3))
      line((1, 1.73), (3, 1.73), stroke: 2pt + C-CH-NC.at(3))
      line((0, 0), (2, 1.73), stroke: 2pt + C-CH-NC.at(3))
      line((4, 0), (2, 1.73), stroke: 2pt + C-CH-NC.at(3))
    })
    Số tam giác nhỏ: \_\_\_\_ \
    Số tam giác vừa: \_\_\_\_ \
    Số tam giác lớn: \_\_\_\_ \
    *Tổng: \_\_\_\_*
  ],
  [
    *b) Hình chữ nhật 4×2:*
    #canvas(length: 1cm, {
      import draw: *
      for x in range(5) {
        line((x * 1.0, 0), (x * 1.0, 2), stroke: 1.5pt + C-CH-NC.at(3))
      }
      for y in range(3) {
        line((0, y * 1.0), (4, y * 1.0), stroke: 1.5pt + C-CH-NC.at(3))
      }
    })
    Hình 1×1: \_\_\_\_ \
    Hình 1×2: \_\_\_\_ \
    Hình 2×1: \_\_\_\_ \
    Hình 2×2: \_\_\_\_ \
    Hình khác: \_\_\_\_ \
    *Tổng: \_\_\_\_*
  ],
)

#v(0.8em)

#bt-label(so: "C4-2", title: "⭐⭐⭐ Diện tích và chu vi — Area and perimeter")

*Bài 2.* Hình dưới đây gồm các ô vuông đơn vị. Tính diện tích và chu vi:

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 20pt,
  [
    *a) Hình chữ thập:*
    #luoi-ke(
      cols: 5,
      rows: 5,
      fills: (
        white,
        white,
        C-TEAL.lighten(70%),
        white,
        white,
        white,
        C-TEAL.lighten(70%),
        C-TEAL.lighten(70%),
        C-TEAL.lighten(70%),
        white,
        C-TEAL.lighten(70%),
        C-TEAL.lighten(70%),
        C-TEAL.lighten(70%),
        C-TEAL.lighten(70%),
        C-TEAL.lighten(70%),
        white,
        C-TEAL.lighten(70%),
        C-TEAL.lighten(70%),
        C-TEAL.lighten(70%),
        white,
        white,
        white,
        C-TEAL.lighten(70%),
        white,
        white,
      ),
    )
    DT = \_\_\_\_ ô² \
    CV = \_\_\_\_ ô
  ],
  [
    *b) Hình bậc thang:*
    #luoi-ke(
      cols: 5,
      rows: 4,
      fills: (
        C-PURPLE.lighten(70%),
        C-PURPLE.lighten(70%),
        C-PURPLE.lighten(70%),
        C-PURPLE.lighten(70%),
        C-PURPLE.lighten(70%),
        C-PURPLE.lighten(70%),
        C-PURPLE.lighten(70%),
        C-PURPLE.lighten(70%),
        C-PURPLE.lighten(70%),
        white,
        C-PURPLE.lighten(70%),
        C-PURPLE.lighten(70%),
        C-PURPLE.lighten(70%),
        white,
        white,
        C-PURPLE.lighten(70%),
        C-PURPLE.lighten(70%),
        white,
        white,
        white,
      ),
    )
    DT = \_\_\_\_ ô² \
    CV = \_\_\_\_ ô
  ],
  [
    *c) Hình móc:*
    #luoi-ke(
      cols: 4,
      rows: 5,
      fills: (
        C-ORANGE.lighten(70%),
        white,
        white,
        C-ORANGE.lighten(70%),
        C-ORANGE.lighten(70%),
        white,
        white,
        C-ORANGE.lighten(70%),
        C-ORANGE.lighten(70%),
        C-ORANGE.lighten(70%),
        C-ORANGE.lighten(70%),
        C-ORANGE.lighten(70%),
        white,
        white,
        white,
        C-ORANGE.lighten(70%),
        white,
        white,
        white,
        C-ORANGE.lighten(70%),
      ),
    )
    DT = \_\_\_\_ ô² \
    CV = \_\_\_\_ ô
  ],
)

#v(0.6em)
*Bài 3. Bài toán diện tích:* Một phòng hình chữ nhật dài 8 m, rộng 5 m. Ở góc phòng có một bể nước hình vuông cạnh 2 m.

*a)* Diện tích phòng (không có bể) = \_\_\_\_ m² \
*b)* Diện tích phần sàn (không kể bể) = \_\_\_\_ m² \
*c)* Chu vi phần sàn (đường viền ngoài bể) phức tạp hơn — thử vẽ hình và tính!

#dong-viet(n: 3)

// ══════════════════════════════════════════════════════════════════════════
// LUYỆN TẬP MỞ RỘNG — CHƯƠNG 5: THỬ THÁCH
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(C-CH-NC.at(4), rgb("#7F1D1D"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[🏆 Luyện Tập Mở Rộng — Chương 5]
    #v(0.3em)
    #text(fill: rgb("#FCD34D"), size: 12pt)[Extended Practice — Thinking Challenges (Ch. 5)]
  ]
]

#v(0.8em)

#bt-label(so: "C5-1", title: "⭐⭐ Toán mật mã nâng cao — Advanced cryptarithmetic")

Trong các bài toán sau, mỗi chữ cái đại diện một chữ số khác nhau:

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    *a)* #h(3em) S E N D \
    #h(3em) + M O R E \
    #h(2.5em) #line(length: 5cm, stroke: 1.5pt + C-DARK) \
    #h(3em) M O N E Y \
    _(Bài toán này nổi tiếng thế giới!)_ \
    Gợi ý: M = 1, S = 9 \
    #dong-viet(n: 2)
  ],
  [
    *b)* Điền chữ số cho A, B, C: \
    #block(fill: C-CH-NC.at(4).lighten(90%), stroke: 1.5pt + C-CH-NC.at(4), inset: 12pt, radius: 8pt)[
      #align(center)[
        #text(weight: "bold", size: 14pt)[
          A B \
          × A \
          #line(length: 3cm, stroke: 1.5pt + C-DARK) \
          C A B
        ]
      ]
    ]
    Tìm A, B, C: \_\_\_\_ , \_\_\_\_ , \_\_\_\_ \
    Kiểm tra: \_\_\_\_ × \_\_\_\_ = \_\_\_\_ ✓?
  ],
)

#v(0.8em)

#bt-label(so: "C5-2", title: "⭐⭐⭐ Lưới logic Sudoku 4×4 — 4×4 Sudoku grids")

Điền các số 1, 2, 3, 4 vào mỗi hàng, cột, và ô 2×2 sao cho không có số lặp lại:

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 24pt,
  [
    *Lưới 1 (dễ):*
    #table(
      columns: (1.6cm, 1.6cm, 1.6cm, 1.6cm),
      rows: (1.4cm, 1.4cm, 1.4cm, 1.4cm),
      align: center + horizon,
      stroke: (x, y) => {
        let thick = 2.5pt + C-DARK
        let thin = 0.8pt + C-LIGHT
        (
          left: if calc.rem(x, 2) == 0 and x > 0 { thick } else if x > 0 { thin } else { thick },
          top: if calc.rem(y, 2) == 0 and y > 0 { thick } else if y > 0 { thin } else { thick },
          right: if x == 3 { thick } else { none },
          bottom: if y == 3 { thick } else { none },
        )
      },
      fill: (x, y) => if (x < 2 and y < 2) or (x >= 2 and y >= 2) { C-LAVENDER } else { white },
      [1], [], [3], [],
      [], [4], [], [2],
      [], [], [4], [],
      [3], [], [], [1],
    )
  ],
  [
    *Lưới 2 (trung bình):*
    #table(
      columns: (1.6cm, 1.6cm, 1.6cm, 1.6cm),
      rows: (1.4cm, 1.4cm, 1.4cm, 1.4cm),
      align: center + horizon,
      stroke: (x, y) => {
        let thick = 2.5pt + C-DARK
        let thin = 0.8pt + C-LIGHT
        (
          left: if calc.rem(x, 2) == 0 and x > 0 { thick } else if x > 0 { thin } else { thick },
          top: if calc.rem(y, 2) == 0 and y > 0 { thick } else if y > 0 { thin } else { thick },
          right: if x == 3 { thick } else { none },
          bottom: if y == 3 { thick } else { none },
        )
      },
      fill: (x, y) => if (x < 2 and y < 2) or (x >= 2 and y >= 2) { C-LAVENDER } else { white },
      [], [2], [], [4],
      [4], [], [], [],
      [], [], [2], [],
      [3], [], [4], [],
    )
  ],
  [
    *Lưới 3 (khó):*
    #table(
      columns: (1.6cm, 1.6cm, 1.6cm, 1.6cm),
      rows: (1.4cm, 1.4cm, 1.4cm, 1.4cm),
      align: center + horizon,
      stroke: (x, y) => {
        let thick = 2.5pt + C-DARK
        let thin = 0.8pt + C-LIGHT
        (
          left: if calc.rem(x, 2) == 0 and x > 0 { thick } else if x > 0 { thin } else { thick },
          top: if calc.rem(y, 2) == 0 and y > 0 { thick } else if y > 0 { thin } else { thick },
          right: if x == 3 { thick } else { none },
          bottom: if y == 3 { thick } else { none },
        )
      },
      fill: (x, y) => if (x < 2 and y < 2) or (x >= 2 and y >= 2) { C-LAVENDER } else { white },
      [], [], [1], [],
      [], [3], [], [],
      [], [], [3], [],
      [], [1], [], [],
    )
  ],
)

#v(0.8em)

#bt-label(so: "C5-3", title: "⭐⭐⭐⭐ Tư duy tổ hợp nâng cao — Advanced combinatorics")

*Bài 1.* Số đường từ A đến B (chỉ đi sang phải hoặc lên): Điền vào các ô số đường đi qua điểm đó.

#canvas(length: 1cm, {
  import draw: *
  // Grid 4x3 with numbers at intersections (Pascal's triangle rotated)
  let vals = (
    (1, 1, 1, 1),
    (1, 2, 3, 4),
    (1, 3, 6, 10),
  )
  for y in range(3) {
    for x in range(4) {
      let px = x * 2.0
      let py = y * 1.5
      line((px, py), (px + 2.0, py), stroke: 0.8pt + C-MID)
      if y < 2 {
        line((px, py), (px, py + 1.5), stroke: 0.8pt + C-MID)
      }
      let v = vals.at(y).at(x)
      circle(
        (px, py),
        radius: 0.4,
        fill: if x == 0 and y == 0 { C-TEAL } else if x == 3 and y == 2 { C-ORANGE } else { white },
        stroke: 1.5pt + C-CH-NC.at(4),
      )
      content((px, py), text(size: 8pt, weight: "bold", fill: if (x == 0 and y == 0) or (x == 3 and y == 2) {
        white
      } else { C-CH-NC.at(4) })[#str(v)])
    }
  }
  content((-0.3, 0), text(size: 9pt, weight: "bold")[A])
  content((6.3, 3.0), text(size: 9pt, weight: "bold")[B])
})

*Bài 2. Bắt tay:* Nếu có 8 người mỗi người bắt tay với tất cả người còn lại, có tất cả bao nhiêu cái bắt tay? \
Dùng công thức: n × (n−1) ÷ 2 = \_\_\_\_ × \_\_\_\_ ÷ 2 = \_\_\_\_

*Bài 3. Tô màu:* Có bao nhiêu cách tô màu bản đồ 3 tỉnh liền nhau dùng 3 màu khác nhau, sao cho 2 tỉnh liền nhau không trùng màu?

#dong-viet(n: 2)

// ══════════════════════════════════════════════════════════════════════════
// ĐỀ THI MÔ PHỎNG — MOCK EXAM 1
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#1E3A8A"), rgb("#1E1B4B"), angle: 90deg),
  inset: (x: 20pt, y: 18pt),
  radius: 14pt,
)[
  #align(center)[
    #text(fill: white, size: 20pt, weight: "black")[📋 Đề Thi Mô Phỏng — Số 1]
    #v(0.3em)
    #text(fill: rgb("#FDE68A"), size: 14pt)[Mock Exam 1 — Comprehensive Assessment]
    #v(0.4em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 10pt,
      [#text(fill: white.transparentize(20%), size: 10pt)[⏱ Thời gian: 45 phút]],
      [#text(fill: white.transparentize(20%), size: 10pt)[📝 Tổng: 30 điểm]],
      [#text(fill: white.transparentize(20%), size: 10pt)[🎯 Toán Nâng Cao Lớp 2]],
    )
  ]
]

#v(1em)

== Phần I: Trắc Nghiệm (10 điểm — 1đ/câu)

*Khoanh tròn đáp án đúng:*

*1.* Dãy số 3, 7, 15, 31, 63, \_\_\_\_ có quy luật:
#h(1em) A. Cộng 4 hh B. Nhân 2 rồi cộng 1 hh C. Cộng 28 hh D. Nhân 3

*2.* Tổng chữ số của số 279 là:
#h(1em) A. 16 hh B. 18 hh C. 20 hh D. 279

*3.* 7 × 9 − 4 × 8 = ?
#h(1em) A. 30 hh B. 31 hh C. 248 hh D. 63

*4.* Số chia cho 6 được 9 dư 4, đó là số:
#h(1em) A. 54 hh B. 58 hh C. 56 hh D. 48

*5.* Một hình chữ nhật có chu vi 28 cm, chiều dài 8 cm. Diện tích là:
#h(1em) A. 40 cm² hh B. 48 cm² hh C. 20 cm² hh D. 56 cm²

*6.* Từ tập {2, 3, 5} có thể tạo bao nhiêu số có hai chữ số khác nhau?
#h(1em) A. 3 hh B. 6 hh C. 9 hh D. 12

*7.* Trong ô vuông ma thuật 3×3 dùng số 1–9, tổng ma thuật là:
#h(1em) A. 12 hh B. 13 hh C. 15 hh D. 18

*8.* Nếu 5 bạn cùng bắt tay nhau, có bao nhiêu cái bắt tay?
#h(1em) A. 5 hh B. 8 hh C. 10 hh D. 15

*9.* Hình chữ thập gồm 5 ô vuông đơn vị (1 ô giữa + 4 ô quanh). Chu vi của hình chữ thập là:
#h(1em) A. 12 đơn vị hh B. 14 đơn vị hh C. 16 đơn vị hh D. 20 đơn vị

*10.* Số nào chia hết cho cả 2 và 3?
#h(1em) A. 14 hh B. 21 hh C. 24 hh D. 25

== Phần II: Tự Luận (20 điểm)

*Bài 1 (4đ):* Hoàn thành ô vuông ma thuật 3×3 với tổng = 15 và tính tổng các đường chéo:

#grid(
  columns: (auto, 1fr),
  gutter: 20pt,
  block[
    #table(
      columns: (2cm, 2cm, 2cm),
      rows: (1.4cm, 1.4cm, 1.4cm),
      align: center + horizon,
      inset: 8pt,
      stroke: 2pt + C-DARK,
      [2], [], [6],
      [], [5], [],
      [4], [], [8],
    )
  ],
  [
    Điền vào bảng và kiểm tra: \
    Hàng 1: \_\_\_ + \_\_\_ + \_\_\_ = \_\_\_\_ ✓? \
    Hàng 2: \_\_\_ + \_\_\_ + \_\_\_ = \_\_\_\_ ✓? \
    Đường chéo ↘: \_\_\_ + \_\_\_ + \_\_\_ = \_\_\_\_ ✓?
  ],
)

*Bài 2 (4đ):* Nhà máy ngày 1 làm 80 sản phẩm. Mỗi ngày sau làm nhiều hơn ngày trước 15 sản phẩm. Hỏi ngày thứ 5 làm bao nhiêu? Tổng 5 ngày đầu là bao nhiêu?

#dong-viet(n: 4)

*Bài 3 (4đ):* Trong hộp có bi đỏ và bi xanh. Số bi đỏ bằng 3 lần số bi xanh. Nếu thêm 12 bi xanh thì số hai loại bằng nhau. Tìm số bi mỗi loại ban đầu.

#dong-viet(n: 4)

*Bài 4 (4đ):* Một lưới ô vuông 5×5. Hỏi có bao nhiêu hình vuông trong lưới đó? (Tính cả hình vuông 1×1, 2×2, 3×3, 4×4, 5×5)

_Gợi ý: Hình vuông k×k trong lưới n×n: có (n−k+1)² hình_

#dong-viet(n: 5)

*Bài 5 (4đ)* ⭐⭐⭐⭐ *Bài Olympiad:* Viết số 100 là tổng của các số tự nhiên liên tiếp theo hai cách khác nhau.

#dong-viet(n: 5)

// ══════════════════════════════════════════════════════════════════════════
// ĐỀ THI MÔ PHỎNG — MOCK EXAM 2
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#064E3B"), rgb("#065F46"), angle: 90deg),
  inset: (x: 20pt, y: 18pt),
  radius: 14pt,
)[
  #align(center)[
    #text(fill: white, size: 20pt, weight: "black")[📋 Đề Thi Mô Phỏng — Số 2]
    #v(0.3em)
    #text(fill: rgb("#FDE68A"), size: 14pt)[Mock Exam 2 — Advanced Challenge]
    #v(0.4em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 10pt,
      [#text(fill: white.transparentize(20%), size: 10pt)[⏱ Thời gian: 45 phút]],
      [#text(fill: white.transparentize(20%), size: 10pt)[📝 Tổng: 30 điểm]],
      [#text(fill: white.transparentize(20%), size: 10pt)[🎯 Cấp độ Olympiad]],
    )
  ]
]

#v(1em)

== Phần I: Trắc Nghiệm (10 điểm)

*1.* Số tiếp theo của 1, 8, 27, 64, \_\_\_\_ là:
#h(1em) A. 100 hh B. 125 hh C. 128 hh D. 216

*2.* Tích 2 × 3 × 5 × 7 bằng:
#h(1em) A. 200 hh B. 210 hh C. 220 hh D. 230

*3.* Số lớn nhất có tổng chữ số = 10 và có 3 chữ số là:
#h(1em) A. 910 hh B. 901 hh C. 820 hh D. 991

*4.* A × B = 36, A + B = 13. Tìm A và B (A > B):
#h(1em) A. A=9, B=4 hh B. A=12, B=1 hh C. A=8, B=5 hh D. A=6, B=6

*5.* Chu vi hình chữ nhật 120 cm. Chiều dài gấp đôi chiều rộng. Diện tích là:
#h(1em) A. 800 cm² hh B. 1200 cm² hh C. 1600 cm² hh D. 2400 cm²

*6.* Trong 100 số tự nhiên từ 1 đến 100, có bao nhiêu số chia hết cho 5?
#h(1em) A. 15 hh B. 20 hh C. 25 hh D. 30

*7.* Mua 3 bút giá A đồng và 2 thước giá B đồng hết 55.000đ. Biết 1 bút đắt hơn 1 thước 3.000đ. Giá 1 bút:
#h(1em) A. 9.000đ hh B. 11.000đ hh C. 12.000đ hh D. 13.000đ

*8.* Lưới 3×3 ô vuông có tất cả bao nhiêu hình vuông?
#h(1em) A. 9 hh B. 13 hh C. 14 hh D. 16

*9.* Có 4 đội bóng thi đấu vòng tròn (mỗi cặp đấu 1 trận). Tổng số trận là:
#h(1em) A. 4 hh B. 6 hh C. 8 hh D. 12

*10.* Số hoàn hảo đầu tiên lớn hơn 10 là:
#h(1em) A. 12 hh B. 24 hh C. 28 hh D. 36

== Phần II: Tự Luận (20 điểm)

*Bài 1 (4đ):* Bộ 5 số a, b, c, d, e thỏa mãn: a+b=17, b+c=20, c+d=22, d+e=19. Biết a=8. Tìm b, c, d, e.

#dong-viet(n: 4)

*Bài 2 (4đ):* Trong một vườn hoa, cứ 3 cây hồng lại trồng xen 2 cây cúc. Có 48 cây hồng. Hỏi có bao nhiêu cây cúc? Tổng cộng bao nhiêu cây?

#dong-viet(n: 3)

*Bài 3 (4đ):* Tìm số có 3 chữ số biết: chữ số hàng chục bằng tổng chữ số hàng trăm và hàng đơn vị, chữ số hàng trăm là 3.

#dong-viet(n: 4)

*Bài 4 (4đ):* Hình bên là một đường khép kín gồm các đoạn thẳng nằm ngang và đứng. Mỗi đơn vị = 1 cm. Tính diện tích và chu vi.

#grid(
  columns: (auto, 1fr),
  gutter: 20pt,
  [
    #canvas(length: 1cm, {
      import draw: *
      let pts = ((0, 0), (5, 0), (5, 2), (3, 2), (3, 4), (0, 4))
      line(..pts, close: true, fill: C-TEAL.lighten(80%), stroke: 2pt + C-TEAL)
      // dimension labels
      content((2.5, -0.4), text(size: 8pt)[5 cm])
      content((-0.5, 2.0), text(size: 8pt)[4 cm])
      content((4.0, 3.0), text(size: 7pt)[2×2])
    })
  ],
  [
    Diện tích = \_\_\_\_ cm² \
    Chu vi = \_\_\_\_ cm \
    #dong-viet(n: 3)
  ],
)

*Bài 5 (4đ)* ⭐⭐⭐⭐ *Olympiad:* Điền các số 1, 2, 3, 4, 5, 6 vào 6 ô trên vòng tròn sao cho tổng 3 ô trên mỗi đường thẳng (có 3 đường thẳng) đều bằng nhau.

#canvas(length: 1cm, {
  import draw: *
  // Hexagon arrangement: 6 nodes at vertices
  for i in range(6) {
    let angle = i * 60deg + 90deg
    let x = 2.0 * calc.cos(angle)
    let y = 2.0 * calc.sin(angle)
    circle((x, y), radius: 0.45, fill: white, stroke: 2pt + C-CH-NC.at(4))
    content((x, y), text(size: 9pt, fill: C-MID)[\_\_])
  }
  // Lines connecting opposite pairs
  for i in range(3) {
    let a = (i * 60deg + 90deg)
    let b = (i * 60deg + 270deg)
    line(
      (2.0 * calc.cos(a), 2.0 * calc.sin(a)),
      (2.0 * calc.cos(b), 2.0 * calc.sin(b)),
      stroke: 1pt + C-LIGHT,
    )
  }
})

#dong-viet(n: 3)
