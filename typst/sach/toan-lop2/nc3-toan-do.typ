// ══════════════════════════════════════════════════════════════════════════
// nc3-toan-do.typ — Chương 3: Chiến Lược Giải Toán / Problem-Solving Strategies
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

#chuong-header-nc(
  so: 3,
  ten-vi: "Chiến Lược Giải Toán",
  ten-en: "Problem-Solving Strategies",
  icon: "🎯",
  so-bai: "5",
  so-trang: "18",
)

#muc-tieu((
  [Vẽ hình để giải toán đố phức hợp — Use drawings to solve complex word problems],
  [Lập bảng để tìm quy luật và giải toán — Use tables to find patterns and solve problems],
  [Làm ngược từ kết quả về dữ kiện — Work backwards from result to find initial value],
  [Áp dụng chiến lược thử-sai có hệ thống — Use systematic guess-and-check],
  [Tìm quy luật trong dãy số và bài toán — Find patterns to solve problems],
))

// ══════════════════════════════════════════════════════════════════════════
// BÀI 11: VẼ HÌNH ĐỂ GIẢI / DRAW-A-PICTURE STRATEGY
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "11",
  ten-vi: "Chiến Lược Vẽ Hình",
  ten-en: "Draw-a-Picture Strategy",
  icon: "✏️",
  kho: 2,
  c: C-CH-NC.at(2),
)

#ly-thuyet(title: "CHIẾN LƯỢC VẼ HÌNH — DRAW A PICTURE")[
  Vẽ hình (hay sơ đồ đoạn thẳng theo phương pháp Singapore) giúp ta *nhìn thấy* mối quan hệ giữa các đại lượng. \
  _Drawing a picture (Singapore model method) makes relationships visible._

  #v(0.5em)
  #grid(
    columns: (auto, 1fr),
    gutter: 14pt,
    align(horizon)[
      #bar-model(
        label-total: "45 bông hoa",
        parts: (
          (label: "Đỏ: 18", w: 4.0),
          (label: "Vàng: ?", w: 2.5),
          (label: "Tím: ?", w: 4.5),
        ),
        show-total: true,
      )
    ],
    align(horizon)[
      #block[
        #set text(size: 10pt)
        *Bài toán:* An cắm 45 bông hoa gồm hoa đỏ, vàng và tím. Hoa đỏ = 18 bông. Hoa vàng = hoa đỏ ÷ 2. Tìm hoa tím. \
        #v(0.4em)
        *Giải:* Hoa vàng = 18÷2 = 9 \
        Hoa tím = 45 − 18 − 9 = *18*
      ]
    ],
  )
]

#bt-label(so: "21", title: "⭐⭐ Vẽ sơ đồ và giải — Draw model then solve")

*Bài toán:* Thư viện có 200 cuốn sách. Số sách tiếng Việt gấp 3 lần số sách tiếng Anh. Tìm số sách mỗi loại.

#chien-luoc[
  Gọi số sách tiếng Anh = 1 phần. Số sách tiếng Việt = 3 phần. \
  Tổng = 4 phần = 200. Vậy 1 phần = ?
]

*Vẽ sơ đồ đoạn thẳng:*

#block(
  width: 100%,
  height: 3.5cm,
  stroke: (paint: C-LIGHT, dash: "dashed"),
  fill: white,
  radius: 8pt,
  inset: 10pt,
)[
  #align(center)[#text(fill: C-MID, style: "italic")[Em vẽ sơ đồ vào đây — Draw your bar model here]]
]

*Lời giải:*
#dong-viet(n: 3)

#bt-label(so: "22", title: "⭐⭐⭐ Bài toán phức hợp — Multi-step problem")

Một cửa hàng có 3 ngăn kệ sách. Ngăn trên có 48 cuốn. Ngăn giữa ít hơn ngăn trên 15 cuốn. Ngăn dưới *bằng tổng* ngăn trên và ngăn giữa. Hỏi cả ba ngăn có bao nhiêu cuốn sách?

#bar-model(
  label-total: "? cuốn sách",
  parts: (
    (label: "Trên: 48", w: 3.5),
    (label: "Giữa: ?", w: 2.5),
    (label: "Dưới: ?", w: 5.0),
  ),
  show-total: true,
)

#o-tra-loi(h: 2.2cm, label: "Lời giải từng bước / Step-by-step solution:")

#hai-cach[
  *Hai cách nhìn bài toán này:*
  - Cách 1: tính ngăn giữa, rồi tính ngăn dưới, cuối cùng cộng cả ba ngăn.
  - Cách 2: nhận ra ngăn dưới = ngăn trên + ngăn giữa, nên cả ba ngăn = 2 × (ngăn trên + ngăn giữa).

  Cách 2 gọn hơn, nhưng chỉ nhìn ra được khi em thật sự hiểu mối quan hệ giữa các ngăn.
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI 12: LẬP BẢNG / MAKE-A-TABLE STRATEGY
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "12",
  ten-vi: "Chiến Lược Lập Bảng",
  ten-en: "Make-a-Table Strategy",
  icon: "📊",
  kho: 2,
  c: C-CH-NC.at(2),
)

#ly-thuyet(title: "KHI NÀO DÙNG BẢNG — WHEN TO USE A TABLE")[
  Dùng bảng khi bài toán có *nhiều trường hợp* có thể xảy ra, hoặc khi cần tổ chức *thông tin từ nhiều điều kiện*. \
  _Use a table when there are many possible cases, or when organizing multiple conditions._
]

#vi-du()[
  Một con nhện có 8 chân. Một con bướm có 6 chân. Tổng cộng 2 con vật có 54 chân. Có bao nhiêu con nhện?

  #table(
    columns: (1fr, 1fr, 1fr, auto),
    align: center + horizon,
    inset: (x: 8pt, y: 8pt),
    stroke: 1pt + C-LIGHT,
    fill: (x, y) => if y == 0 { C-GREEN.lighten(75%) } else if calc.even(y) { C-CREAM } else { white },
    [*Nhện*], [*Bướm*], [*Tổng chân*], [*Đúng?*],
    [1], [?], [8×1 + 6×? = 54 → 6×?=46 → không chia hết], [✗],
    [2], [?], [8×2 = 16 → 6×?=38 → không chia hết], [✗],
    [3], [?], [8×3 = 24 → 6×?=30 → ?=5], [✓],
  )
  Đáp án: 3 con nhện và 5 con bướm.
]

#bt-label(so: "23", title: "⭐⭐ Lập bảng để giải — Make a table to solve")

Mỗi chiếc xe đạp có 2 bánh, xe xích lô có 3 bánh. Đếm được tổng cộng 30 bánh xe và 12 phương tiện. Có bao nhiêu xe đạp và bao nhiêu xích lô?

#table(
  columns: (1fr, 1fr, 1fr, auto),
  align: center + horizon,
  inset: (x: 8pt, y: 10pt),
  stroke: 1pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH-NC.at(2).lighten(75%) } else { white },
  [*Xe đạp*], [*Xích lô*], [*Tổng bánh*], [*Đúng?*],
  [], [], [], [],
  [], [], [], [],
  [], [], [], [],
  [], [], [], [],
)

_Đáp án:_ \_\_\_\_ xe đạp và \_\_\_\_ xích lô.

// ══════════════════════════════════════════════════════════════════════════
// BÀI 13: LÀM NGƯỢC / WORK-BACKWARDS STRATEGY
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "13",
  ten-vi: "Chiến Lược Làm Ngược",
  ten-en: "Work-Backwards Strategy",
  icon: "↩️",
  kho: 3,
  c: C-CH-NC.at(2),
)

#ly-thuyet(title: "LÀM NGƯỢC — WORK BACKWARDS")[
  Bắt đầu từ *kết quả cuối*, thực hiện các phép tính *ngược lại* để tìm giá trị ban đầu. \
  _Start from the final result and apply inverse operations to find the starting value._

  #v(0.4em)
  #grid(
    columns: (auto, auto),
    gutter: 0pt,
    block(fill: C-TEAL.lighten(85%), stroke: 1pt + C-TEAL, inset: 10pt, radius: (left: 8pt))[
      #set text(size: 9.5pt)
      *Xuôi:* x → +5 → ×2 → −3 → *17* \
      _Forward: x → +5 → ×2 → −3 → 17_
    ],
    block(fill: C-ORANGE.lighten(85%), stroke: 1pt + C-ORANGE, inset: 10pt, radius: (right: 8pt))[
      #set text(size: 9.5pt)
      *Ngược:* x ← −5 ← ÷2 ← +3 ← *17* \
      17+3=20 → 20÷2=10 → 10−5 = *5*
    ],
  )
]

#bt-label(so: "24", title: "⭐⭐ Tìm số ban đầu — Find the starting number")

*a)* Một số, cộng thêm 15, rồi nhân 2, rồi trừ 8 = 42. Số ban đầu là?

#grid(
  columns: (5 * (1fr,)),
  gutter: 0pt,
  block(fill: C-CH-NC.at(2).lighten(90%), stroke: 1pt + C-CH-NC.at(2), inset: 8pt, width: 100%)[
    #align(center)[*?*]
  ],
  align(center + horizon)[→ +15 →],
  block(fill: white, stroke: 1pt + C-CH-NC.at(2), inset: 8pt, width: 100%)[
    #align(center)[\_\_\_]
  ],
  align(center + horizon)[→ ×2 →],
  block(fill: C-TEAL.lighten(85%), stroke: 1.5pt + C-TEAL, inset: 8pt, width: 100%)[
    #align(center)[*42*]
  ],
)

_Làm ngược:_ 42 → \_\_\_\_\_\_\_\_\_\_ → \_\_\_\_\_\_\_\_\_\_ → Số ban đầu = \_\_\_\_

*b)* Mai có một số kẹo. Mai cho Lan *một nửa* số kẹo. Lan cho Hoa *5 cái*. Hoa cho lại Mai *3 cái*. Cuối cùng Mai có *12 cái*. Hỏi ban đầu Mai có bao nhiêu kẹo?

#suy-luan[
  Ngược lại bước cuối: Mai có 12 → trước đó Hoa cho 3 → Mai có 12−3=9 → ... \
  Tiếp tục làm ngược từng bước!
]

#dong-viet(n: 4)

// ══════════════════════════════════════════════════════════════════════════
// BÀI 14: THỬ VÀ ĐIỀU CHỈNH / GUESS AND CHECK
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "14",
  ten-vi: "Thử và Điều Chỉnh",
  ten-en: "Guess and Check Strategy",
  icon: "🎲",
  kho: 2,
  c: C-CH-NC.at(2),
)

#ly-thuyet(title: "CHIẾN LƯỢC THỬ VÀ ĐIỀU CHỈNH — GUESS AND CHECK")[
  *Đoán* một số hợp lý. *Kiểm tra* xem có thỏa mãn điều kiện không. Nếu chưa, *điều chỉnh* và thử lại có hệ thống. \
  _Guess a reasonable number. Check if it satisfies conditions. Adjust and try again systematically._
]

#bt-label(so: "25", title: "⭐⭐ Tìm hai số — Find two numbers")

Tìm hai số biết: tổng của chúng = 50, và tích của chúng = 600.

#table(
  columns: (1fr, 1fr, 1fr, 1fr, auto),
  align: center + horizon,
  inset: (x: 8pt, y: 10pt),
  stroke: 1pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH-NC.at(2).lighten(75%) } else { white },
  [*Số 1*], [*Số 2*], [*Tổng*], [*Tích*], [*Đúng?*],
  [20], [30], [50], [600], [✗ (20×30=600? Kiểm tra!)],
  [25], [25], [50], [], [],
  [], [], [], [], [],
)

_Đáp án:_ Hai số là \_\_\_\_ và \_\_\_\_

#bt-label(so: "26", title: "⭐⭐⭐ Bài toán tuổi — Age puzzle")

Tuổi của anh và em cộng lại = 24. Tuổi anh gấp đôi tuổi em cộng thêm 3. Tìm tuổi mỗi người.

#table(
  columns: (1fr, 1fr, 1fr, auto),
  align: center + horizon,
  inset: (x: 8pt, y: 10pt),
  stroke: 1pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH-NC.at(2).lighten(75%) } else { white },
  [*Tuổi em*], [*Tuổi anh (=2×em+3)*], [*Tổng*], [*Đúng?*],
  [5], [13], [18], [],
  [7], [], [], [],
  [], [], [], [],
)

// ══════════════════════════════════════════════════════════════════════════
// BÀI 15: TÌM QUY LUẬT / FIND-A-PATTERN STRATEGY
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "15",
  ten-vi: "Chiến Lược Tìm Quy Luật",
  ten-en: "Find-a-Pattern Strategy",
  icon: "🔍",
  kho: 3,
  c: C-CH-NC.at(2),
)

#ly-thuyet(title: "TÌM QUY LUẬT ĐỂ GIẢI TOÁN — USING PATTERNS TO SOLVE")[
  Khi bài toán khó, hãy thử *trường hợp nhỏ* trước, ghi lại kết quả, và tìm quy luật để áp dụng cho trường hợp lớn hơn. \
  _When a problem is hard, try small cases first, record results, find the pattern, then apply it to the larger case._
]

#bt-label(so: "27", title: "⭐⭐ Bắt tay / Handshakes")

Trong một lớp, mỗi học sinh bắt tay đúng 1 lần với mỗi bạn khác. Với 2 bạn có 1 lần bắt tay. Với 3 bạn có 3 lần. Điền bảng và tìm quy luật:

#table(
  columns: (1fr, 1fr, 1fr),
  align: center + horizon,
  inset: (x: 8pt, y: 10pt),
  stroke: 1pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH-NC.at(2).lighten(75%) } else { white },
  [*Số bạn*], [*Số lần bắt tay*], [*Công thức*],
  [2], [1], [1],
  [3], [3], [1+2=3],
  [4], [], [],
  [5], [], [],
  [6], [], [],
  [*10*], [*?*], [],
)

#suy-luan[
  Quy luật: Với n bạn, số lần bắt tay = 1+2+3+…+(n−1) = ? \
  _Pattern: With n friends, handshakes = 1+2+3+…+(n-1) = ?_ \
  Với 10 bạn: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
]

#phong-thi-nghiem[
  *Thử trường hợp nhỏ để đoán trường hợp lớn:*
  Hãy hoàn thành bảng cho 2, 3, 4, 5, 6 bạn. Sau đó dự đoán:
  - 8 bạn bắt tay mấy lần?
  - 20 bạn bắt tay mấy lần?

  Em được quyền dự đoán trước, rồi mới kiểm tra lại bằng cộng dồn.
  #o-tra-loi(h: 2.6cm, label: "Dự đoán và kiểm tra:")
]

#bt-label(so: "28", title: "⭐⭐⭐⭐ Bài Olympiad — Olympic problem")

#olympiad(the-loai: "Chiến Lược Kết Hợp — Combined Strategy")[
  Một bể cá dài 60 cm. Người ta đặt các tấm kính ngăn bể thành *các ngăn đều nhau*, mỗi tấm kính dày 1 cm. Với *4 ngăn* cần *3 tấm kính* → bể bị chia thành 4 phần, tổng chiều dài phần nước = 60 − 3 = 57 cm.

  *Câu hỏi:* Muốn mỗi ngăn nước dài đúng *9 cm*, cần bao nhiêu ngăn và bao nhiêu tấm kính?

  #dong-viet(n: 4)
]

#kiem-tra-nc(
  chuong: "3",
  ten: "Chiến Lược Giải Toán",
  so-cau: "6",
  tg: "25 phút",
)

*Câu 1.* Vẽ sơ đồ đoạn thẳng rồi giải: Lớp A có 35 bạn. Lớp B ít hơn lớp A 8 bạn. Lớp C *bằng tổng* lớp A và lớp B. Hỏi cả ba lớp có bao nhiêu bạn?
#o-tra-loi(h: 3.5cm)

*Câu 2.* Lập bảng để giải: Gà và thỏ tổng cộng 10 con và 28 chân. Có mấy con gà?

#table(
  columns: (1fr, 1fr, 1fr, auto),
  align: center + horizon,
  inset: 8pt,
  stroke: 1pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH-NC.at(2).lighten(75%) } else { white },
  [*Gà*], [*Thỏ*], [*Tổng chân*], [*Đúng?*],
  [], [], [], [],
  [], [], [], [],
  [], [], [], [],
)

*Câu 3.* Làm ngược: Một số, nhân 3, cộng 10, chia 2 = 20. Số ban đầu là?
#o-tra-loi(h: 1.8cm)

*Câu 4.* Tìm quy luật: Số tam giác: 1, 3, 6, 10, \_\_\_\_, \_\_\_\_ (mỗi lần thêm bao nhiêu?)

*Câu 5.* Bài toán tuổi: Tổng tuổi bố và con = 46. Tuổi bố = tuổi con × 4 + 2. Tìm tuổi mỗi người.
#o-tra-loi(h: 2cm)

*Câu 6* ⭐⭐⭐⭐ Một cửa hàng bán cam và táo. Ngày đầu bán 5 cam và 3 táo được 54 nghìn đồng. Ngày hai bán 3 cam và 5 táo được 46 nghìn đồng. Giá một quả cam và một quả táo lần lượt là bao nhiêu?
#dong-viet(n: 4)
