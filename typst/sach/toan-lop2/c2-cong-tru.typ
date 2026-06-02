// ══════════════════════════════════════════════════════════════════════════
// c2-cong-tru.typ — CHƯƠNG 2: CỘNG VÀ TRỪ  /  Addition & Subtraction
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme.typ": *

#chuong-header(so: 2, ten: "Cộng và Trừ  /  Addition & Subtraction", icon: "➕", so-bai: "5", so-trang: "20")

#muc-tieu((
  [Cộng không nhớ và có nhớ trong phạm vi 1 000 — Add with and without carrying],
  [Trừ không mượn và có mượn trong phạm vi 1 000 — Subtract with and without borrowing],
  [Tìm số hạng, số bị trừ, số trừ chưa biết — Find unknown addend/subtrahend],
  [Dùng mô hình thanh để giải toán đố — Solve word problems using bar models],
  [Cộng và trừ liên tiếp nhiều phép tính — Multi-step calculations],
))

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "5", ten-vi: "Cộng Không Nhớ", ten-en: "Addition without Carrying", icon: "➕", c: C-CH.at(1))
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("phép cộng", "addition"),
  ("số hạng", "addend"),
  ("tổng", "sum"),
  ("kết quả", "result"),
  ("cộng thẳng cột", "column addition"),
))

#ly-thuyet(title: "CỘNG THẲNG CỘT — COLUMN ADDITION")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (auto, 1fr),
    gutter: 14pt,
    [
      #canvas(length: 1cm, {
        import draw: *
        // Column addition diagram 324 + 153
        let cols = (("T", "C", "ĐV"), ("3", "2", "4"), ("1", "5", "3"))
        for (ci, col) in cols.enumerate() {
          for (ri, cell) in col.enumerate() {
            let x = ci * 2.5
            let y = (2 - ri) * 1.4
            rect(
              (x, y),
              (x + 2.2, y + 1.2),
              fill: if ri == 0 { C-CH.at(1).lighten(80%) } else { white },
              stroke: 0.8pt + C-LIGHT,
            )
            content((x + 1.1, y + 0.6), text(
              size: if ri == 0 { 8.5pt } else { 13pt },
              weight: if ri == 0 { "bold" } else { "regular" },
              fill: if ri == 0 { C-CH.at(1) } else { C-DARK },
            )[#cell])
          }
        }
        line((0, 0), (6.7, 0), stroke: 2pt + C-CH.at(1))
        content((3.35, -0.7), text(size: 13pt, weight: "bold", fill: C-GREEN)[477])
        content((3.35, -1.3), text(size: 9pt, fill: C-MID)[324 + 153 = 477])
      })
    ],
    align(horizon)[
      *Cách thực hiện (Steps):*
      #v(0.3em)
      ① Đặt cột thẳng hàng / Align columns
      #v(0.1em)
      ② Cộng từ phải sang trái / Add right to left:
      #v(0.15em)
      - ĐV: 4 + 3 = *7*
      - Chục: 2 + 5 = *7*
      - Trăm: 3 + 1 = *4*
      #v(0.3em)
      Vậy: 324 + 153 = *477*
    ],
  )
]

#vi-du(title: "Mẫu tự học nhanh")[
  *243 + 326:* em nhìn từ phải sang trái.
  - Đơn vị: 3 + 6 = 9
  - Chục: 4 + 2 = 6
  - Trăm: 2 + 3 = 5

  Nếu mọi cột đều nhỏ hơn 10, em biết đây là bài *không nhớ*.

  #v(0.35em)
  *Thử thêm: 412 + 367*
  - Đơn vị: 2 + 7 = 9
  - Chục: 1 + 6 = 7
  - Trăm: 4 + 3 = 7

  Vậy *412 + 367 = 779*.
]

#bt-label(so: "10", title: "Đặt tính rồi tính — Set up and calculate")

#dat-tinh-grid((
  ("a)", "243", "326"),
  ("b)", "512", "475"),
  ("c)", "361", "214"),
  ("d)", "120", "879"),
  ("e)", "431", "258"),
  ("f)", "702", "197"),
))

#bt-label(so: "11", title: "Tính nhẩm — Mental math")
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 6pt,
  [300 + 400 = #o-so()], [500 + 200 = #o-so()], [230 + 50 = #o-so()], [600 + 350 = #o-so()],
  [400 + 150 = #o-so()], [710 + 80 = #o-so()], [250 + 740 = #o-so()], [130 + 860 = #o-so()],
)

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "6", ten-vi: "Cộng Có Nhớ", ten-en: "Addition with Carrying", icon: "⬆️", c: C-CH.at(1))
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("nhớ", "carry / regroup"),
  ("vượt 10", "exceeds 10"),
  ("hàng kế tiếp", "next column"),
))

#ly-thuyet(title: "CỘNG CÓ NHỚ — ADDITION WITH CARRYING")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (auto, 1fr),
    gutter: 14pt,
    [
      #canvas(length: 1cm, {
        import draw: *
        // 256 + 178 with carry
        let data = (
          ("T", "C", "ĐV"),
          ("nhớ 1", "nhớ 1", ""),
          ("2", "5", "6"),
          ("1", "7", "8"),
        )
        for (ri, row) in data.enumerate() {
          for (ci, cell) in row.enumerate() {
            let x = ci * 2.2
            let y = (3 - ri) * 1.3
            let is-carry = ri == 1
            let is-header = ri == 0
            rect(
              (x, y),
              (x + 2.0, y + 1.1),
              fill: if is-header { C-CH.at(1).lighten(80%) } else if is-carry { C-PINK.lighten(80%) } else { white },
              stroke: 0.8pt + C-LIGHT,
            )
            content((x + 1.0, y + 0.55), text(
              size: if is-header or is-carry { 8pt } else { 13pt },
              weight: if is-header { "bold" } else { "regular" },
              fill: if is-carry { C-PINK } else if is-header { C-CH.at(1) } else { C-DARK },
            )[#cell])
          }
        }
        line((0, 0), (6.5, 0), stroke: 2pt + C-CH.at(1))
        content((3.25, -0.65), text(size: 13pt, weight: "bold", fill: C-GREEN)[434])
      })
    ],
    align(horizon)[
      *Khi tổng ≥ 10 → nhớ 1 sang cột bên trái!*
      #text(fill: C-MID, size: 9.5pt)[When sum ≥ 10 → carry 1 to the left!]
      #v(0.4em)
      - ĐV: 6 + 8 = 14 → viết *4*, nhớ *1*
      - Chục: 5 + 7 + 1(nhớ) = 13 → viết *3*, nhớ *1*
      - Trăm: 2 + 1 + 1(nhớ) = *4*
      #v(0.3em)
      *256 + 178 = 434*
    ],
  )
]

#vi-du(title: "Mẫu tự học: viết số nhớ nhỏ")[
  *365 + 278:*
  - 5 + 8 = 13 → viết 3, nhớ 1
  - 6 + 7 + 1 = 14 → viết 4, nhớ 1
  - 3 + 2 + 1 = 6

  Mẹo: luôn viết số nhớ nhỏ ở phía trên cột bên trái rồi mới làm tiếp.

  #v(0.35em)
  *Ví dụ thêm: 487 + 156*
  - 7 + 6 = 13 → viết 3, nhớ 1
  - 8 + 5 + 1 = 14 → viết 4, nhớ 1
  - 4 + 1 + 1 = 6

  Vậy *487 + 156 = 643*.
]

#bt-label(so: "12", title: "Đặt tính — Set up and calculate (with carrying)")

#dat-tinh-grid((
  ("a)", "365", "278"),
  ("b)", "458", "367"),
  ("c)", "549", "376"),
  ("d)", "186", "728"),
  ("e)", "273", "459"),
  ("f)", "647", "185"),
))

#bt-label(so: "13", title: "Tìm x (Find x)")

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [*a)* x + 285 = 543 #v(0.15em) x = #o-so(w: 3cm) #dong-viet(n: 1)],
  [*b)* 346 + x = 700 #v(0.15em) x = #o-so(w: 3cm) #dong-viet(n: 1)],

  [*c)* x + 163 = 425 #v(0.15em) x = #o-so(w: 3cm) #dong-viet(n: 1)],
  [*d)* 508 + x = 941 #v(0.15em) x = #o-so(w: 3cm) #dong-viet(n: 1)],
)

#sai-o-dau()[
  #set par(first-line-indent: 0em)
  Bạn Nam tính: 347 + 285 = *5112* (năm ngàn một trăm mười hai)
  Tại sao sai? Tính lại đúng rồi giải thích:
  #dong-viet(n: 2)
]

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "7", ten-vi: "Trừ Không Mượn", ten-en: "Subtraction without Borrowing", icon: "➖", c: C-CH.at(1))
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("phép trừ", "subtraction"),
  ("số bị trừ", "minuend"),
  ("số trừ", "subtrahend"),
  ("hiệu", "difference"),
))

#ly-thuyet(title: "TRỪ THẲNG CỘT — COLUMN SUBTRACTION")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (auto, 1fr),
    gutter: 14pt,
    [
      #canvas(length: 1cm, {
        import draw: *
        let data = (("T", "C", "ĐV"), ("7", "8", "9"), ("3", "4", "5"))
        for (ri, row) in data.enumerate() {
          for (ci, cell) in row.enumerate() {
            let x = ci * 2.2
            let y = (2 - ri) * 1.4
            rect(
              (x, y),
              (x + 2.0, y + 1.2),
              fill: if ri == 0 { C-CH.at(1).lighten(80%) } else { white },
              stroke: 0.8pt + C-LIGHT,
            )
            content((x + 1.0, y + 0.6), text(
              size: if ri == 0 { 8.5pt } else { 13pt },
              weight: if ri == 0 { "bold" } else { "regular" },
              fill: if ri == 0 { C-CH.at(1) } else { C-DARK },
            )[#cell])
          }
        }
        line((0, 0), (6.5, 0), stroke: 2pt + C-CH.at(1))
        content((3.25, -0.65), text(size: 13pt, weight: "bold", fill: C-GREEN)[444])
        content((3.25, -1.3), text(size: 9pt, fill: C-MID)[789 - 345 = 444])
      })
    ],
    align(horizon)[
      - ĐV: 9 - 5 = *4*
      - Chục: 8 - 4 = *4*
      - Trăm: 7 - 3 = *4*
      #v(0.3em)
      *789 - 345 = 444*
      #v(0.3em)
      *Kiểm tra:* 444 + 345 = 789 ✓
      #text(fill: C-MID, size: 9pt)[Check: addition and subtraction are inverse operations!]
    ],
  )
]

#vi-du(title: "Mẫu tự học: kiểm tra ngược")[
  *876 - 453:* trừ từng cột được *423*.

  Sau đó kiểm tra ngay: *423 + 453 = 876*.
  Nếu cộng ngược không ra số ban đầu, em phải xem lại phép trừ.

  #v(0.35em)
  *Thử thêm: 965 - 322*
  - Đơn vị: 5 - 2 = 3
  - Chục: 6 - 2 = 4
  - Trăm: 9 - 3 = 6

  Vậy *965 - 322 = 643* và kiểm tra lại: *643 + 322 = 965*.
]

#bt-label(so: "14", title: "Đặt tính rồi tính — Subtract")

#dat-tinh-grid(
  (
    ("a)", "876", "453"),
    ("b)", "998", "561"),
    ("c)", "750", "230"),
    ("d)", "487", "204"),
    ("e)", "564", "231"),
    ("f)", "839", "406"),
  ),
  op: "-",
)

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "8", ten-vi: "Trừ Có Mượn", ten-en: "Subtraction with Borrowing", icon: "⬇️", c: C-CH.at(1))
// ══════════════════════════════════════════════════════════════════════════

#ly-thuyet(title: "TRỪ CÓ MƯỢN — SUBTRACTION WITH BORROWING")[
  #set par(first-line-indent: 0em)
  Khi chữ số hàng dưới *lớn hơn* hàng trên → mượn 1 từ cột bên trái!
  #text(fill: C-MID, size: 9.5pt)[When the bottom digit is LARGER → borrow 1 from the left column!]
  #v(0.5em)
  *Ví dụ: 523 - 168*
  #v(0.3em)
  #grid(
    columns: (auto, 1fr),
    gutter: 14pt,
    [
      #canvas(length: 1cm, {
        import draw: *
        // With "mượn" notation
        let data = (
          ("T", "C", "ĐV"),
          ("4", "11→", "13"),
          ("5", "2", "3"),
          ("1", "6", "8"),
        )
        for (ri, row) in data.enumerate() {
          for (ci, cell) in row.enumerate() {
            let x = ci * 2.2
            let y = (3 - ri) * 1.3
            let is-borrow = ri == 1
            rect(
              (x, y),
              (x + 2.0, y + 1.1),
              fill: if ri == 0 { C-CH.at(1).lighten(80%) } else if is-borrow { C-PINK.lighten(80%) } else { white },
              stroke: 0.8pt + C-LIGHT,
            )
            content((x + 1.0, y + 0.55), text(
              size: if ri == 0 or is-borrow { 8pt } else { 13pt },
              weight: "regular",
              fill: if ri == 0 { C-CH.at(1) } else if is-borrow { C-PINK } else { C-DARK },
            )[#cell])
          }
        }
        line((0, 0), (6.5, 0), stroke: 2pt + C-CH.at(1))
        content((3.25, -0.65), text(size: 13pt, weight: "bold", fill: C-GREEN)[355])
      })
    ],
    align(horizon)[
      #set text(size: 10.5pt)
      - ĐV: 3 < 8 → *mượn* 1 chục: 13 - 8 = *5*
      - Chục: (2-1) < 6 → *mượn* 1 trăm: 11 - 6 = *5*
      - Trăm: (5-1) - 1 = *4*
      #v(0.3em)
      *523 - 168 = 355*
      #v(0.2em)
      *Kiểm tra:* 355 + 168 = 523 ✓
    ],
  )
]

#vi-du(title: "Mẫu tự học: mượn rồi mới trừ")[
  *634 - 257:*
  - Vì 4 < 7 nên mượn 1 chục: 14 - 7 = 7
  - Cột chục còn 2, lại nhỏ hơn 5 nên mượn 1 trăm: 12 - 5 = 7
  - Trăm còn 5, nên 5 - 2 = 3

  Khi bí, em cứ đọc: *so sánh trước, mượn sau, rồi mới trừ*.

  #v(0.35em)
  *Ví dụ thêm: 721 - 458*
  - 1 < 8 nên mượn 1 chục: 11 - 8 = 3
  - Cột chục còn 1, lại nhỏ hơn 5 nên mượn 1 trăm: 11 - 5 = 6
  - Trăm còn 6, nên 6 - 4 = 2

  Vậy *721 - 458 = 263*.
]

#bt-label(so: "15", title: "Đặt tính — Subtract with borrowing")

#dat-tinh-grid(
  (
    ("a)", "634", "257"),
    ("b)", "811", "473"),
    ("c)", "1000", "386"),
    ("d)", "500", "147"),
    ("e)", "703", "285"),
    ("f)", "921", "647"),
  ),
  op: "-",
)

#bt-label(so: "16", title: "Tìm x — Find x")

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [*a)* 750 - x = 284 #v(0.15em) x = #o-so() #dong-viet(n: 1)],
  [*b)* x - 263 = 471 #v(0.15em) x = #o-so() #dong-viet(n: 1)],

  [*c)* 900 - x = 437 #v(0.15em) x = #o-so() #dong-viet(n: 1)],
  [*d)* x - 185 = 306 #v(0.15em) x = #o-so() #dong-viet(n: 1)],
)

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(
  so: "9",
  ten-vi: "Toán Đố — Mô Hình Thanh",
  ten-en: "Word Problems with Bar Models",
  icon: "📊",
  c: C-CH.at(1),
)
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("mô hình thanh", "bar model"),
  ("phần chưa biết", "unknown part"),
  ("tổng", "total / whole"),
  ("hiệu", "difference"),
))

#ly-thuyet(title: "DÙNG MÔ HÌNH THANH — USING BAR MODELS")[
  #set par(first-line-indent: 0em)
  Mô hình thanh (Bar Model) giúp ta *vẽ* bài toán trước khi tính.
  #text(fill: C-MID, size: 9.5pt)[Bar models help us draw the problem before calculating.]

  #v(0.4em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    block(fill: C-BLUE.lighten(88%), inset: 12pt, radius: 8pt, stroke: 1pt + C-BLUE)[
      #set par(first-line-indent: 0em)
      *Bài toán Phần–Tổng*
      #text(fill: C-MID, style: "italic", size: 9.5pt)[Part–Whole Model]
      #v(0.3em)
      Lớp A có *358 học sinh*, lớp B có *274 học sinh*. Cả hai lớp có bao nhiêu?
      #v(0.5em)
      #bar-model(
        label-total: "?",
        parts: (
          (label: "358", w: 5.5),
          (label: "274", w: 4.2),
        ),
        bw: 9.7,
      )
      #v(0.3em)
      *358 + 274 = 632 học sinh*
    ],
    block(fill: C-GREEN.lighten(88%), inset: 12pt, radius: 8pt, stroke: 1pt + C-GREEN)[
      #set par(first-line-indent: 0em)
      *Bài toán Phần–Hiệu*
      #text(fill: C-MID, style: "italic", size: 9.5pt)[Comparison Model]
      #v(0.3em)
      Kho có *750 kg gạo*, bán *268 kg*. Còn lại bao nhiêu?
      #v(0.5em)
      #bar-model(
        label-total: "750 kg",
        parts: (
          (label: "268 kg", w: 4.0),
          (label: "?", w: 5.7),
        ),
        bw: 9.7,
      )
      #v(0.3em)
      *750 - 268 = 482 kg*
    ],
  )
]

#bt-label(so: "17", title: "Vẽ mô hình thanh rồi giải — Draw bar model, then solve")

#block(fill: C-PEACH, stroke: 1.5pt + C-ORANGE, inset: 14pt, radius: 8pt, width: 100%)[
  #set par(first-line-indent: 0em)
  🛍️ Sáng cửa hàng bán được *437 sản phẩm*, chiều bán được *285 sản phẩm*. Tổng cả ngày bán bao nhiêu? Biết kho có *850 sản phẩm*, hỏi còn lại bao nhiêu?
]
#o-tra-loi(h: 4cm, label: "Mô hình thanh / Bar model:")
#o-tra-loi(h: 3.5cm, label: "Bài giải / Solution:")

#bt-label(so: "18", title: "Bài toán nhiều bước — Multi-step problems")

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  block(fill: C-MINT, stroke: 1.5pt + C-GREEN, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    🏫 Trường có *573 học sinh*. Nghỉ *47 bạn*. Buổi chiều thêm *125 bạn* đến. Cuối ngày có bao nhiêu?
    #o-tra-loi(h: 3.5cm, label: "Bài giải:")
  ],
  block(fill: C-LAVENDER, stroke: 1.5pt + C-PURPLE, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    💰 Mẹ có *500 000 đồng*. Mua đồ dùng hết *238 000 đồng*, mua quần áo hết *175 000 đồng*. Mẹ còn lại bao nhiêu?
    #o-tra-loi(h: 3.5cm, label: "Bài giải:")
  ],
)

#so-do-thanh-goi-y[
  *Chọn sơ đồ trước khi tính:*
  - Gộp hai lượng → sơ đồ *phần–tổng*.
  - Biết cả kho, biết đã bán → sơ đồ *phần còn lại*.
  - Hơn/kém nhau → sơ đồ *so sánh*.

  #align(center)[
    #bar-model(
      label-total: "923",
      parts: (
        (label: "648", w: 5.8),
        (label: "275", w: 2.5),
      ),
      bw: 8.3,
    )
  ]

  Từ sơ đồ này, em nhìn ngay được: *648 + 275 = 923*.
]

#hai-cach[
  *Hai cách tính 298 + 147:*
  - Cách 1: làm tròn thành 300 + 145 = 445.
  - Cách 2: tách phần thành 200 + 100 + 90 + 40 + 8 + 7 = 445.

  Khi số gần tròn chục hoặc tròn trăm, cách 1 nhanh hơn. Khi cần giải thích rõ từng phần, cách 2 sáng sủa hơn.
]

#nang-cao()[
  #set par(first-line-indent: 0em)
  🧠 *Number Bond Challenge:*

  Tổng của hai số là *847*. Số lớn hơn số nhỏ *253*. Tìm hai số đó.

  #text(
    fill: C-MID,
    size: 10pt,
  )[The sum of two numbers is 847. The larger is 253 more than the smaller. Find both numbers.]

  #grid(
    columns: (auto, 1fr),
    gutter: 14pt,
    number-bond(total: 847, a: none, b: none, c: C-CH.at(1)),
    [
      #set par(first-line-indent: 0em)
      Gọi số nhỏ là x, số lớn là: \_\_\_
      #dong-viet(n: 2)
      Số nhỏ: #o-so() #h(2em) Số lớn: #o-so()
    ],
  )
]

#cau-hoi-mo[
  Từ ba số *275, 348, 623*, em hãy tự viết:
  - *1 bài toán cộng*;
  - *1 bài toán trừ*.

  Cả hai bài đều phải có lời văn rõ ràng, đọc lên là hiểu ngay phải làm gì.

  #o-tra-loi(h: 3.0cm, label: "Bài toán do em tạo:")
]

#hai-cach[
  *Hai cách kiểm tra phép trừ 900 - 347:*
  - Cách 1: đặt tính và trừ trực tiếp.
  - Cách 2: kiểm tra ngược bằng phép cộng: 553 + 347 = 900.

  Một bài toán tốt không chỉ cần ra đáp án, mà còn nên có cách kiểm tra lại.
]

// ═══ ÔN TẬP CHƯƠNG 2 ════════════════════════════════════════════

= Ôn Tập Chương 2 — Review: Addition & Subtraction

#set par(first-line-indent: 0em)

*1.* Tính (Calculate):
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 10pt,
  [457 + 386 = #o-so()], [529 + 371 = #o-so()], [814 - 356 = #o-so()], [1000 - 487 = #o-so()],
)

*2.* Tính và kiểm tra (Calculate and check):
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [*a)* 648 + 275 = \_\_\_ ; kiểm tra: \_\_\_ + \_\_\_ = \_\_\_],
  [*b)* 903 - 456 = \_\_\_ ; kiểm tra: \_\_\_ + \_\_\_ = \_\_\_],
)

*3.* Tìm x:
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 8pt,
  [x + 347 = 800 → x = #o-so()], [600 - x = 253 → x = #o-so()], [x - 185 = 436 → x = #o-so()],
)

*4.* Bài toán đố: Vườn có *425 cây*. Trồng thêm *238 cây*, sau đó chặt bỏ *150 cây*. Vườn còn bao nhiêu cây?
#o-tra-loi(h: 4cm, label: "Bài giải:")

#kiem-tra-header(chuong: "2", so-cau: "8", tg: "20 phút")

*Câu 1.* 486 + 375 = ?
#trac-nghiem-4(
  [751],
  [761],
  [861],
  [771],
)

*Câu 2.* 702 - 358 = ?
#trac-nghiem-4(
  [344],
  [354],
  [454],
  [444],
)

*Câu 3.* x + 275 = 614 → x = ?
#trac-nghiem-4(
  [889],
  [339],
  [349],
  [329],
)

*Câu 4.* (2 điểm) Đặt tính rồi tính:
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [567 + 384 = #o-tra-loi(h: 3.0cm)], [801 - 459 = #o-tra-loi(h: 3.0cm)],
)

*Câu 5.* (3 điểm) 🗓️ Thư viện có *648 quyển sách tiếng Việt* và *275 quyển tiếng Anh*. Thứ Hai mua thêm *180 quyển*. Tổng cộng thư viện có bao nhiêu quyển?
#v(0.2em)
Vẽ mô hình thanh / Draw bar model:
#o-tra-loi(h: 3cm)
Bài giải / Solution:
#o-tra-loi(h: 3cm)

*Câu 6.* (3 điểm) 🧠 Tư duy: Tổng của hai số là *900*. Hiệu của chúng là *150*. Tìm hai số đó.
#o-tra-loi(h: 3.5cm)

#sao-danh-gia
