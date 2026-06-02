// ══════════════════════════════════════════════════════════════════════════
// nc2-phep-tinh.typ — Chương 2: Tính Nhẩm Thần Tốc / Lightning Mental Math
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

#chuong-header-nc(
  so: 2,
  ten-vi: "Tính Nhẩm Thần Tốc",
  ten-en: "Lightning Mental Math",
  icon: "⚡",
  so-bai: "5",
  so-trang: "16",
)

#muc-tieu((
  [Cộng nhẩm đến 1000 bằng chiến lược làm tròn — Use rounding to add mentally to 1000],
  [Trừ nhẩm bằng phương pháp bù số — Subtract mentally using complements],
  [Áp dụng mẹo nhân ×9, ×11 — Apply ×9 and ×11 multiplication tricks],
  [Hiểu phép chia có dư — Understand division with remainder],
  [Tính biểu thức có dấu ngoặc — Evaluate expressions with brackets],
))

// ══════════════════════════════════════════════════════════════════════════
// BÀI 6: CỘNG NHẨM TỚI 1000
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "6",
  ten-vi: "Cộng Nhẩm Tới 1000",
  ten-en: "Mental Addition to 1000",
  icon: "➕",
  kho: 2,
  c: C-CH-NC.at(1),
)

#ly-thuyet(title: "3 CHIẾN LƯỢC CỘNG NHẨM — 3 MENTAL ADDITION STRATEGIES")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 10pt,
    block(fill: white, stroke: 2pt + C-TEAL, inset: 10pt, radius: 8pt)[
      #text(fill: C-TEAL, weight: "bold", size: 10pt)[① Làm tròn (Round & Adjust)]
      #v(0.3em)
      #set text(size: 9.5pt)
      *48 + 37* \
      → 50 + 37 = 87 \
      → 87 − 2 = *85* ✓
    ],
    block(fill: white, stroke: 2pt + C-BLUE, inset: 10pt, radius: 8pt)[
      #text(fill: C-BLUE, weight: "bold", size: 10pt)[② Cộng từng phần (Partial Sums)]
      #v(0.3em)
      #set text(size: 9.5pt)
      *245 + 138* \
      → 200+100 = 300 \
      → 40+30 = 70 \
      → 5+8 = 13 \
      → 300+70+13 = *383* ✓
    ],
    block(fill: white, stroke: 2pt + C-ORANGE, inset: 10pt, radius: 8pt)[
      #text(fill: C-ORANGE, weight: "bold", size: 10pt)[③ Gộp nhóm (Grouping)]
      #v(0.3em)
      #set text(size: 9.5pt)
      *25 + 37 + 75* \
      → (25+75) + 37 \
      → 100 + 37 = *137* ✓ \
      _(look for pairs that make 100!)_
    ],
  )
]

#bt-label(so: "12", title: "⭐ Tính nhẩm nhanh — Calculate mentally")

#grid(
  columns: (2 * (1fr,)),
  gutter: 10pt,
  block[
    *a)* 59 + 38 = \_\_\_\_  *(gợi ý: làm tròn 59→60)* \
    *b)* 148 + 97 = \_\_\_\_ \
    *c)* 303 + 499 = \_\_\_\_ \
    *d)* 76 + 25 = \_\_\_\_
  ],
  block[
    *e)* 36 + 44 + 64 = \_\_\_\_ \
    *f)* 125 + 75 + 50 = \_\_\_\_ \
    *g)* 13 + 27 + 13 + 27 = \_\_\_\_ \
    *h)* 50 + 50 + 50 + 50 = \_\_\_\_
  ],
)

#bt-label(so: "13", title: "⭐⭐⭐ Đường tính tổng — Sum path")

#block(fill: C-CH-NC.at(1).lighten(90%), inset: 14pt, radius: 8pt)[
  Đi từ START đến END, mỗi bước cộng thêm số trong ô. Tìm đường đi có *tổng nhỏ nhất* và *tổng lớn nhất*:

  #v(0.8em)
  #canvas(length: 1cm, {
    import draw: *
    // Grid of boxes with numbers
    let nums = ((25, 40, 15), (30, 20, 35), (45, 10, 50))
    for r in range(3) {
      for c in range(3) {
        let x = c * 2.5
        let y = (2 - r) * 1.8
        rect((x, y), (x + 2.0, y + 1.5), fill: white, stroke: 1.5pt + C-CH-NC.at(1).lighten(50%))
        content((x + 1.0, y + 0.75), text(weight: "bold", size: 12pt)[#nums.at(r).at(c)])
      }
    }
    // START / END labels
    content((-1.5, 4.05), text(fill: C-TEAL, weight: "bold", size: 10pt)[START])
    content((8.2, 0.75), text(fill: C-RED, weight: "bold", size: 10pt)[END])
    // Arrow hints
    line((-0.8, 4.05), (0, 4.05), mark: (end: ">"), stroke: 1.5pt + C-TEAL)
    line((7.5, 0.75), (6.5, 0.75), mark: (start: ">"), stroke: 1.5pt + C-RED)
  })
]

Tổng nhỏ nhất (qua 3 ô): \_\_\_\_\_\_\_ = \_\_\_\_ #h(1em) • #h(1em) Tổng lớn nhất: \_\_\_\_\_\_\_ = \_\_\_\_

#hai-cach[
  *Hai cách tính 198 + 207:*
  - Cách 1: làm tròn thành 200 + 205 = 405.
  - Cách 2: tách phần thành 100 + 200 + 90 + 0 + 8 + 7 = 405.

  Bài nào gần số tròn thì cách 1 rất mạnh. Bài nào cần giải thích từng phần thì cách 2 sáng sủa hơn.
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI 7: TRỪ NHẨM THẦN TỐC
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "7",
  ten-vi: "Trừ Nhẩm Thần Tốc",
  ten-en: "Mental Subtraction Tricks",
  icon: "➖",
  kho: 2,
  c: C-CH-NC.at(1),
)

#ly-thuyet(title: "PHƯƠNG PHÁP BÙ SỐ — COMPLEMENT METHOD")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    block(fill: white, stroke: 2pt + C-BLUE, inset: 12pt, radius: 8pt)[
      #text(fill: C-BLUE, weight: "bold")[Bù đến 10 — Complement to 10]
      #v(0.3em)
      #set text(size: 9.5pt)
      *43 − 8 = ?* \
      8 cần thêm *2* để thành 10 \
      → trừ 10 rồi cộng lại 2 \
      43 − 10 + 2 = *35* ✓
    ],
    block(fill: white, stroke: 2pt + C-PURPLE, inset: 12pt, radius: 8pt)[
      #text(fill: C-PURPLE, weight: "bold")[Bù đến 100 — Complement to 100]
      #v(0.3em)
      #set text(size: 9.5pt)
      *700 − 438 = ?* \
      438 + *562* = 1000 \
      → 700 − 438 = 262 \
      _(Count up from 438 to 700)_
    ],
  )
  #v(0.5em)
  #meo[*Đếm lên thay vì trừ:* Từ 438 → 440 (+2) → 500 (+60) → 700 (+200) = cộng 262 tổng cộng! \
    _Count up instead of subtracting: 438→440→500→700, total added = 262_]
]

#bt-label(so: "14", title: "⭐⭐ Tính nhẩm bằng phương pháp bù — Use complement method")

*a)* 100 − 36 = \_\_\_\_ &h(1em) *b)* 200 − 87 = \_\_\_\_ #h(1em) *c)* 500 − 264 = \_\_\_\_

*d)* 1000 − 375 = \_\_\_\_ #h(1em) *e)* 84 − 29 = \_\_\_\_ #h(1em) *f)* 93 − 47 = \_\_\_\_

#suy-luan[
  Bài d: 375 cần thêm bao nhiêu để thành 1000? \
  375 + \_\_\_\_ = 1000 → _Đếm lên: 375 → 400 (thêm \_\_\_\_) → 1000 (thêm \_\_\_\_) → tổng thêm: \_\_\_\__
]

#bt-label(so: "15", title: "⭐⭐⭐ Điền vào bảng trừ — Fill in the subtraction table")

#table(
  columns: (auto, 1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  inset: (x: 8pt, y: 10pt),
  stroke: 1pt + C-LIGHT,
  fill: (x, y) => if y == 0 or x == 0 { C-CH-NC.at(1).lighten(80%) } else { white },
  [*− (trừ)*], [*23*], [*47*], [*68*], [*99*],
  [*100*], [], [], [], [],
  [*200*], [], [], [], [],
  [*500*], [], [], [], [],
)

// ══════════════════════════════════════════════════════════════════════════
// BÀI 8: NHÂN SIÊU NHANH
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "8",
  ten-vi: "Nhân Siêu Nhanh",
  ten-en: "Multiplication Speed Tricks",
  icon: "✖️",
  kho: 3,
  c: C-CH-NC.at(1),
)

#ly-thuyet(title: "MẸO NHÂN × 9 VÀ × 11 — TRICKS FOR ×9 AND ×11")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    block(fill: white, stroke: 2pt + C-TEAL, inset: 12pt, radius: 8pt)[
      #text(fill: C-TEAL, weight: "bold")[Nhân với 9 — Multiply by 9]
      #v(0.4em)
      #set text(size: 9.5pt)
      *n × 9 = n × 10 − n*
      #v(0.3em)
      *7 × 9* = 7×10 − 7 = 70 − 7 = *63* \
      *8 × 9* = 8×10 − 8 = 80 − 8 = *72* \
      *6 × 9* = 60 − 6 = *54* \
      #v(0.3em)
      _Mẹo ngón tay: giữ ngón thứ n, đếm trái = chục, phải = đơn vị!_
    ],
    block(fill: white, stroke: 2pt + C-ORANGE, inset: 12pt, radius: 8pt)[
      #text(fill: C-ORANGE, weight: "bold")[Nhân với 11 — Multiply by 11]
      #v(0.4em)
      #set text(size: 9.5pt)
      *n × 11 = n × 10 + n*
      #v(0.3em)
      *7 × 11* = 70 + 7 = *77* \
      *8 × 11* = 80 + 8 = *88* \
      *5 × 11* = 50 + 5 = *55* \
      #v(0.3em)
      _Kết quả của n × 11 (n < 10) có chữ số hàng trăm = n, hàng chục = n!_
    ],
  )
]

#bt-label(so: "16", title: "⭐⭐ Áp dụng mẹo nhân — Apply multiplication tricks")

*Nhân với 9:*

#grid(
  columns: (4 * (1fr,)),
  gutter: 8pt,
  ..for i in (3, 4, 6, 7, 8, 9, 5, 2) {
    (
      block(
        fill: C-TEAL.lighten(88%),
        stroke: 1pt + C-TEAL.lighten(50%),
        inset: (x: 8pt, y: 8pt),
        radius: 6pt,
        width: 100%,
      )[
        #align(center)[
          #text(weight: "bold")[#str(i) × 9 =]
          #v(0.3em)
          #rect(width: 2cm, height: 1.2cm, stroke: 1pt + C-TEAL, fill: white, radius: 4pt)[]
        ]
      ],
    )
  },
)

#v(0.6em)
*Nhân với 11:*

#grid(
  columns: (4 * (1fr,)),
  gutter: 8pt,
  ..for i in (2, 3, 4, 5, 6, 7, 8, 9) {
    (
      block(
        fill: C-ORANGE.lighten(88%),
        stroke: 1pt + C-ORANGE.lighten(50%),
        inset: (x: 8pt, y: 8pt),
        radius: 6pt,
        width: 100%,
      )[
        #align(center)[
          #text(weight: "bold")[#str(i) × 11 =]
          #v(0.3em)
          #rect(width: 2cm, height: 1.2cm, stroke: 1pt + C-ORANGE, fill: white, radius: 4pt)[]
        ]
      ],
    )
  },
)

// ══════════════════════════════════════════════════════════════════════════
// BÀI 9: CHIA CÓ DƯ / DIVISION WITH REMAINDER
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "9",
  ten-vi: "Chia Có Dư",
  ten-en: "Division with Remainder",
  icon: "➗",
  kho: 3,
  c: C-CH-NC.at(1),
)

#ly-thuyet(title: "PHÉP CHIA CÓ DƯ — DIVISION WITH REMAINDER")[
  #grid(
    columns: (auto, 1fr),
    gutter: 12pt,
    canvas(length: 1cm, {
      import draw: *
      // Division example: 17 ÷ 5 = 3 dư 2
      rect((0, 0), (5, 3), fill: C-TEAL.lighten(88%), stroke: 1.5pt + C-TEAL, radius: 0.3)
      content((2.5, 2.3), text(weight: "bold", size: 11pt)[17 ÷ 5 = 3 *dư* 2])
      content((2.5, 1.6), text(size: 9.5pt)[vì: 5 × 3 = 15])
      content((2.5, 1.0), text(size: 9.5pt)[và: 17 − 15 = 2])
      content((2.5, 0.4), text(size: 9pt, fill: C-TEAL)[Số dư < số chia])
    }),
    block[
      #set text(size: 10pt)
      *Công thức:* \
      Số bị chia = (Số chia × Thương) + Số dư \
      _Dividend = (Divisor × Quotient) + Remainder_
      #v(0.4em)
      *Ví dụ:* 23 ÷ 4 = 5 dư *3* \
      Kiểm tra: 4 × 5 + 3 = 20 + 3 = *23* ✓
      #v(0.4em)
      *Lưu ý:* Số dư luôn *nhỏ hơn* số chia! \
      _Remainder is always LESS than the divisor!_
    ],
  )
]

#bt-label(so: "17", title: "⭐⭐ Tính phép chia có dư — Divide with remainder")

#grid(
  columns: (2 * (1fr,)),
  gutter: 14pt,
  block[
    *a)* 13 ÷ 4 = \_\_\_\_ dư \_\_\_\_ \
    *b)* 17 ÷ 3 = \_\_\_\_ dư \_\_\_\_ \
    *c)* 25 ÷ 7 = \_\_\_\_ dư \_\_\_\_ \
    *d)* 19 ÷ 6 = \_\_\_\_ dư \_\_\_\_
  ],
  block[
    *e)* 30 ÷ 8 = \_\_\_\_ dư \_\_\_\_ \
    *f)* 47 ÷ 5 = \_\_\_\_ dư \_\_\_\_ \
    *g)* 50 ÷ 7 = \_\_\_\_ dư \_\_\_\_ \
    *h)* 100 ÷ 9 = \_\_\_\_ dư \_\_\_\_
  ],
)

#bt-label(so: "18", title: "⭐⭐⭐ Toán đố chia có dư — Word problem with remainder")

Mẹ có 35 cái kẹo muốn chia đều cho 4 bạn. Hỏi: \
*a)* Mỗi bạn được bao nhiêu cái kẹo? \
*b)* Còn dư lại bao nhiêu cái kẹo không chia được?

#bar-model(
  label-total: "35 cái kẹo",
  parts: (
    (label: "Bạn 1", w: 2.5),
    (label: "Bạn 2", w: 2.5),
    (label: "Bạn 3", w: 2.5),
    (label: "Bạn 4", w: 2.5),
    (label: "dư?", w: 1.0),
  ),
  show-total: true,
)

#o-tra-loi(h: 2cm, label: "Lời giải / Solution:")

#phong-thi-nghiem[
  *Thử nghiệm số dư:* Em chia lần lượt các số từ 1 đến 20 cho 4.

  - Số dư có thể là những số nào?
  - Có khi nào số dư bằng 4 không?
  - Các số chia hết cho 4 xuất hiện theo quy luật nào?

  #o-tra-loi(h: 2.8cm, label: "Quan sát của em:")
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI 10: BIỂU THỨC SỐ / NUMBER EXPRESSIONS
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "10",
  ten-vi: "Biểu Thức Số và Ngoặc",
  ten-en: "Number Expressions & Brackets",
  icon: "🔣",
  kho: 3,
  c: C-CH-NC.at(1),
)

#ly-thuyet(title: "THỨ TỰ THỰC HIỆN PHÉP TÍNH — ORDER OF OPERATIONS")[
  #block(fill: C-LAVENDER, stroke: 2pt + C-PURPLE, inset: 14pt, radius: 8pt)[
    #set text(size: 10.5pt)
    *Quy tắc:* \
    *1.* Tính trong *ngoặc ( )* trước — _Calculate inside brackets first_ \
    *2.* Sau đó nhân (*×*) và chia (*÷*) từ trái sang phải \
    *3.* Cuối cùng cộng (*+*) và trừ (*−*) từ trái sang phải
  ]
  #v(0.6em)
  *Ví dụ:* (3 + 5) × 4 = *8* × 4 = *32* #h(2em) ≠ #h(2em) 3 + 5 × 4 = 3 + *20* = *23*

  #chu-y[Có ngoặc: tính trong ngoặc trước! _Brackets change the answer!_]
]

#bt-label(so: "19", title: "⭐⭐ Tính đúng thứ tự — Calculate in correct order")

*a)* (4 + 6) × 5 = \_\_\_\_ #h(2em) *b)* 4 + 6 × 5 = \_\_\_\_ #h(2em) *c)* (20 − 8) × 3 = \_\_\_\_

*d)* 24 ÷ (2 × 3) = \_\_\_\_ #h(2em) *e)* 100 − (30 + 25) = \_\_\_\_ #h(2em) *f)* (7 × 4) − (5 × 3) = \_\_\_\_

#bt-label(so: "20", title: "⭐⭐⭐ Thêm ngoặc để được kết quả — Add brackets to get the result")

Thêm dấu ngoặc *( )* vào đúng chỗ để được kết quả yêu cầu: \
_Add brackets ( ) to the correct place to get the required result:_

*a)* 5 + 3 × 4 = 32 #h(1em) → \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

*b)* 20 − 4 × 3 = 48 #h(1em) → \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

*c)* 6 + 2 × 5 − 1 = 39 #h(1em) → \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

#suy-luan[
  Bài c: Thử đặt ngoặc ở các vị trí khác nhau. Có bao nhiêu cách đặt ngoặc? Cách nào cho 39? \
  _Try different bracket positions. How many ways? Which gives 39?_
  #dong-viet(n: 2)
]

#nang-cao[
  *Bài siêu thách thức:* Dùng 4 số *2, 3, 4, 5* (mỗi số 1 lần) và các dấu +, −, ×, ÷, ( ), tạo ra tất cả các số từ 1 đến 10. \
  _Use 2, 3, 4, 5 (once each) and +, −, ×, ÷, ( ) to make every number from 1 to 10._
  #dong-viet(n: 3)
]

#kiem-tra-nc(
  chuong: "2",
  ten: "Tính Nhẩm Thần Tốc",
  so-cau: "8",
  tg: "20 phút",
)

*Câu 1.* Tính nhẩm: a) 67 + 38 = \_\_\_\_ #h(2em) b) 249 + 96 = \_\_\_\_ #h(2em) c) 45 + 55 + 25 = \_\_\_\_

*Câu 2.* Tính nhẩm bằng bù số: a) 100 − 57 = \_\_\_\_ #h(2em) b) 500 − 263 = \_\_\_\_

*Câu 3.* Dùng mẹo ×9: a) 7×9 = \_\_\_\_ #h(2em) b) 8×9 = \_\_\_\_ #h(2em) c) 9×9 = \_\_\_\_

*Câu 4.* Dùng mẹo ×11: a) 6×11 = \_\_\_\_ #h(2em) b) 9×11 = \_\_\_\_ #h(2em) c) 7×11 = \_\_\_\_

*Câu 5.* Tính chia có dư: a) 20÷3 = \_\_\_ dư \_\_\_ #h(2em) b) 33÷4 = \_\_\_ dư \_\_\_

*Câu 6.* Tính đúng thứ tự: a) (5+7)×3 = \_\_\_\_ #h(2em) b) 5+7×3 = \_\_\_\_

*Câu 7.* Viết phép tính đúng: "Có 17 cuốn sách, xếp vào 3 kệ đều nhau, còn dư lại mấy cuốn?"

#o-tra-loi(h: 1.8cm)

*Câu 8* ⭐⭐⭐⭐ Thêm ngoặc để được kết quả: 10 − 2 + 3 × 4 = 20

_Viết phép tính có ngoặc:_ \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
