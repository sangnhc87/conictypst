// ══════════════════════════════════════════════════════════════════════════
// c5-do-luong.typ — CHƯƠNG 5: ĐO LƯỜNG  /  Measurement
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme.typ": *

#chuong-header(so: 5, ten: "Đo Lường  /  Measurement", icon: "📏", so-bai: "3", so-trang: "12")

#muc-tieu((
  [Đo độ dài bằng dm và m — Measure length in dm and m],
  [Đọc giờ chính xác và giờ rưỡi — Read time: exact hour and half hour],
  [Cân nặng (kg) và dung tích (lít) — Mass (kg) and capacity (liter)],
  [Giải toán đố đo lường — Solve measurement word problems],
))

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "19", ten-vi: "Độ Dài: dm và m", ten-en: "Length: dm and m", icon: "📏", c: C-CH.at(4))
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("độ dài", "length"),
  ("đề-xi-mét", "decimetre (dm)"),
  ("mét", "metre (m)"),
  ("xăng-ti-mét", "centimetre (cm)"),
  ("ngắn hơn", "shorter"),
  ("dài hơn", "longer"),
))

#ly-thuyet(title: "ĐƠN VỊ ĐO ĐỘ DÀI — UNITS OF LENGTH")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (auto, 1fr),
    gutter: 14pt,
    [
      #canvas(length: 1cm, {
        import draw: *
        // Ruler showing cm, dm, m relationship
        // 1 m ruler
        rect((0, 2.5), (10, 3.5), fill: C-CH.at(4).lighten(80%), stroke: 1.5pt + C-CH.at(4))
        content((5, 3.0), text(size: 11pt, weight: "bold", fill: C-CH.at(4))[1 m = 10 dm = 100 cm])

        // 1 dm segment
        rect((0, 1), (1.0, 2), fill: C-TEAL.lighten(80%), stroke: 1.5pt + C-TEAL)
        content((0.5, 1.5), text(size: 9pt, weight: "bold", fill: C-TEAL)[1 dm])
        for i in range(1, 10) {
          rect((i, 1), (i + 1.0, 2), fill: C-TEAL.lighten(88%), stroke: 0.8pt + C-LIGHT)
        }
        content((5.5, 0.5), text(size: 9pt, fill: C-MID)[1 dm = 10 cm])

        // cm scale
        for i in range(11) {
          line((i, 1), (i, 0.6), stroke: 0.8pt + C-MID)
          content((i, 0.3), text(size: 7pt)[#str(i)])
        }
      })
    ],
    align(horizon)[
      *Đổi đơn vị (Unit conversion):*
      #v(0.3em)
      - 1 m = *10 dm*
      - 1 dm = *10 cm*
      - 1 m = *100 cm*
      #v(0.3em)
      *Ví dụ:*
      - 3 m = 3 × 10 = *30 dm*
      - 50 cm = 50 ÷ 10 = *5 dm*
      - 2 dm 5 cm = *25 cm*
    ],
  )
]

#vi-du(title: "Mẫu tự học: đổi về cùng đơn vị trước")[
  *2 m = 20 dm* vì 1 m = 10 dm.

  *36 cm = 3 dm 6 cm* vì 30 cm = 3 dm và còn 6 cm.

  *1 m 4 dm = 14 dm*.
]

#chu-y[
  Khi so sánh độ dài, em phải đổi về *cùng đơn vị* trước.
  Ví dụ: *2 m* và *25 dm* không được nhìn số 2 với 25 rồi so ngay.
]

#bt-label(so: "33", title: "Đổi đơn vị — Unit conversion")

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 8pt,
  [5 m = #o-so() dm], [4 dm = #o-so() cm], [3 m = #o-so() cm], [70 cm = #o-so() dm],
  [2 dm 3 cm = #o-so() cm], [45 cm = #o-so() dm #o-so() cm], [120 cm = #o-so() m #o-so() dm], [6 m 5 dm = #o-so() dm],
  [7 dm = #o-so() cm], [9 m = #o-so() dm], [160 cm = #o-so() m #o-so() dm], [8 dm 4 cm = #o-so() cm],
)

#bt-label(so: "34", title: "So sánh và sắp xếp — Compare and order")

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [*a)* Điền >, < hoặc = vào #_blank:
    #v(0.3em)
    25 dm #_blank 3 m #h(2em) 100 cm #_blank 1 m
    #v(0.15em)
    4 dm 5 cm #_blank 50 cm #h(2em) 2 m #_blank 21 dm
  ],
  [*b)* Sắp xếp từ ngắn đến dài:
    5 dm, 48 cm, 1 m 2 dm, 3 dm 7 cm
    #dong-viet(n: 2)
  ],

  [*c)* Điền >, < hoặc = vào #_blank:
    #v(0.3em)
    8 dm #_blank 80 cm #h(2em) 1 m 5 dm #_blank 14 dm
    #v(0.15em)
    95 cm #_blank 9 dm #h(2em) 4 m #_blank 39 dm
  ],
  [*d)* Sắp xếp từ dài đến ngắn:
    2 m, 18 dm, 175 cm, 1 m 9 dm
    #dong-viet(n: 2)
  ],
)

#bt-label(so: "35", title: "Toán đố đo độ dài — Length word problems")

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  block(fill: C-MINT, stroke: 1.5pt + C-GREEN, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    📐 Tấm vải dài *8 m*. May áo hết *3 m 5 dm*, may quần hết *2 m 5 dm*. Còn lại bao nhiêu?
    #bar-model(
      label-total: "8 m",
      parts: (
        (label: "3 m 5 dm", w: 4.4),
        (label: "2 m 5 dm", w: 3.1),
        (label: "?", w: 2.5),
      ),
      bw: 10.0,
    )
    #o-tra-loi(h: 3cm, label: "Bài giải:")
  ],
  block(fill: C-PEACH, stroke: 1.5pt + C-ORANGE, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    🏃 Bạn An cao *135 cm*, bạn Bình cao *1 m 28 cm*. Bạn nào cao hơn? Cao hơn bao nhiêu?
    #o-tra-loi(h: 4cm, label: "Bài giải:")
  ],
)

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "20", ten-vi: "Đọc Giờ và Thời Gian", ten-en: "Telling Time", icon: "🕐", c: C-CH.at(4))
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("đồng hồ", "clock"),
  ("giờ", "hour / o'clock"),
  ("phút", "minute"),
  ("giờ rưỡi", "half past"),
  ("kim ngắn", "hour hand"),
  ("kim dài", "minute hand"),
))

#ly-thuyet(title: "ĐỌC GIỜ — READING TIME")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (auto, auto, auto, 1fr),
    gutter: 14pt,
    [
      #dong-ho(gio: 10, phut: 0)
      #align(center)[*10 giờ*\ 10 o'clock]
    ],
    [
      #dong-ho(gio: 3, phut: 30)
      #align(center)[*3 giờ 30*\ Half past 3]
    ],
    [
      #dong-ho(gio: 7, phut: 15)
      #align(center)[*7 giờ 15*\ 7:15]
    ],
    align(horizon)[
      *Kim ngắn* = giờ (*hour hand*)
      *Kim dài* = phút (*minute hand*)
      #v(0.5em)
      - Kim dài ở *12* → đúng giờ
      - Kim dài ở *6* → rưỡi (30 phút)
      - 1 vòng kim dài = *60 phút* = 1 giờ
    ],
  )
]

#vi-du(title: "Mẫu tự học: nhìn kim dài trước")[
  *4 giờ 30 phút:*
  - Kim dài chỉ số *6* nên là *30 phút*.
  - Kim ngắn nằm giữa *4* và *5* nên là *4 giờ 30*.

  *8 giờ đúng:* kim dài ở *12*, kim ngắn ở *8*.
]

#chu-y[
  Kim *dài* chỉ *phút*, kim *ngắn* chỉ *giờ*.
  Nhiều bạn thấy kim dài ở số 6 rồi đọc thành *6 giờ*, đó là sai.
]

#bt-label(so: "36", title: "Đọc giờ trên đồng hồ — Read the time")

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 12pt,
  [#dong-ho(gio: 9, phut: 0) #align(center)[*\_\_\_ giờ*]],
  [#dong-ho(gio: 6, phut: 30) #align(center)[*\_\_\_ giờ \_\_\_*]],
  [#dong-ho(gio: 2, phut: 0) #align(center)[*\_\_\_ giờ*]],
  [#dong-ho(gio: 11, phut: 30) #align(center)[*\_\_\_ giờ \_\_\_*]],

  [#dong-ho(gio: 4, phut: 0) #align(center)[*\_\_\_ giờ*]],
  [#dong-ho(gio: 1, phut: 30) #align(center)[*\_\_\_ giờ \_\_\_*]],
  [#dong-ho(gio: 7, phut: 0) #align(center)[*\_\_\_ giờ*]],
  [#dong-ho(gio: 5, phut: 30) #align(center)[*\_\_\_ giờ \_\_\_*]],
)

#bt-label(so: "37", title: "Tính khoảng thời gian — Calculate elapsed time")

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [*a)* Bắt đầu lúc 8 giờ, kết thúc lúc 10 giờ 30 phút.\ Kéo dài bao lâu? #o-so(w: 3cm)],
  [*b)* Phim bắt đầu lúc *7 giờ*, kéo dài *2 giờ 30 phút*. Phim kết thúc lúc mấy giờ? #o-so(w: 3cm)],

  [*c)* Nam đến trường lúc *7 giờ 30*, ra về lúc *11 giờ 30*. Ở trường mấy tiếng? #o-so(w: 3cm)],
  [*d)* Hiện tại 3 giờ. Sau *2 giờ 30 phút* là mấy giờ? #o-so(w: 3cm)],

  [*e)* Bắt đầu lúc 1 giờ 30, kết thúc lúc 4 giờ 30. Kéo dài bao lâu? #o-so(w: 3cm)],
  [*f)* Hiện tại 9 giờ. Sau 1 giờ 30 phút là mấy giờ? #o-so(w: 3cm)],

  [*g)* Xe rời bến lúc 6 giờ, đến nơi lúc 8 giờ 30. Đi hết bao lâu? #o-so(w: 3cm)],
  [*h)* Học bài từ 7 giờ 30 đến 9 giờ. Em học trong bao lâu? #o-so(w: 3cm)],
)

#sai-o-dau()[
  Bạn Minh đọc đồng hồ có kim dài ở số *6*, kim ngắn giữa *3* và *4* là *6 giờ 3 phút*.
  Em hãy chỉ ra chỗ sai và đọc lại đúng.
  #dong-viet(n: 2)
]

#bt-label(so: "38", title: "Lịch học trong tuần — Weekly schedule")

Nhìn vào thời khóa biểu, điền câu trả lời:
#table(
  columns: (auto, auto, auto, auto, auto, auto),
  inset: 8pt,
  align: center,
  stroke: 0.8pt + C-LIGHT,
  fill: (x, y) => if y == 0 { C-CH.at(4).lighten(80%) } else if calc.even(y) { C-CREAM } else { white },
  [Tiết], [Thứ 2], [Thứ 3], [Thứ 4], [Thứ 5], [Thứ 6],
  [1: 7:30], [Toán], [Tiếng Việt], [Toán], [Tiếng Việt], [Toán],
  [2: 8:15], [T. Việt], [Toán], [T. Việt], [Toán], [T. Việt],
  [3: 9:15], [TNXH], [Đạo đức], [MT], [TNXH], [TD],
)

#v(0.3em)
*a)* Toán dạy vào những ngày nào? \_\_\_\_\_\_\_\_\_\_\_\_\_\_

*b)* Tiết 1 bắt đầu lúc 7:30, kéo dài 45 phút. Nghỉ giải lao đến 8:15 thì bắt đầu tiết 2. Giải lao kéo dài bao lâu? #o-so()

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "21", ten-vi: "Khối Lượng và Dung Tích", ten-en: "Mass & Capacity", icon: "⚖️", c: C-CH.at(4))
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("khối lượng", "mass / weight"),
  ("ki-lô-gam", "kilogram (kg)"),
  ("gam", "gram (g)"),
  ("dung tích", "capacity"),
  ("lít", "litre (L)"),
))

#ly-thuyet(title: "ĐƠN VỊ ĐO — UNITS: kg, g, lít")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    block(fill: C-BLUE.lighten(88%), stroke: 2pt + C-BLUE, inset: 12pt, radius: 8pt)[
      #align(center)[#canvas(length: 1cm, {
        import draw: *
        // Simple balance scale
        line((2, 0.5), (4, 0.5), stroke: 3pt + C-BLUE)
        line((3, 0.5), (3, 2.5), stroke: 2.5pt + C-BLUE)
        circle((3, 2.5), radius: 0.18, fill: C-BLUE, stroke: none)
        // Left pan
        bezier((1, 0.5), (2, 0.1), (0.5, 0.3), stroke: 1.5pt + C-BLUE)
        rect((0.3, -0.4), (2.0, 0.1), fill: C-BLUE.lighten(70%), stroke: 1pt + C-BLUE, radius: 0.15)
        content((1.15, -0.15), text(size: 9pt)[1 kg])
        // Right pan
        bezier((5, 0.5), (4, 0.1), (5.5, 0.3), stroke: 1.5pt + C-BLUE)
        rect((4.0, -0.4), (5.7, 0.1), fill: C-BLUE.lighten(70%), stroke: 1pt + C-BLUE, radius: 0.15)
        content((4.85, -0.15), text(size: 9pt)[1 000 g])
      })]
      #set par(first-line-indent: 0em)
      *Khối lượng / Mass:*
      - 1 kg = *1 000 g*
      - Cân nặng của: gạo, thịt, trái cây
      - Dùng cân để đo
    ],
    block(fill: C-TEAL.lighten(88%), stroke: 2pt + C-TEAL, inset: 12pt, radius: 8pt)[
      #align(center)[#canvas(length: 1cm, {
        import draw: *
        // Bottle shape
        rect((1.2, 0), (4.8, 0.6), fill: C-TEAL.lighten(70%), stroke: 1.5pt + C-TEAL, radius: 0.2)
        rect((1.5, 0.6), (4.5, 3.5), fill: C-TEAL.lighten(80%), stroke: 1.5pt + C-TEAL, radius: 0.15)
        rect((2.2, 3.5), (3.8, 4.2), fill: C-TEAL.lighten(80%), stroke: 1.5pt + C-TEAL, radius: 0.1)
        content((3, 2.0), text(size: 12pt, weight: "bold", fill: C-TEAL)[1 L])
        // Water level line
        line((1.55, 1.8), (4.45, 1.8), stroke: (paint: C-TEAL, dash: "dashed"))
        content((5.2, 1.8), text(size: 8pt, fill: C-TEAL)[0.5 L])
      })]
      #set par(first-line-indent: 0em)
      *Dung tích / Capacity:*
      - Lít (*L*): nước, dầu, sữa
      - Chai 1 lít = *1 L*
      - Dùng ca đo lít để đo
    ],
  )
]

#vi-du(title: "Mẫu tự học: kg, g và lít")[
  *2 kg 300 g = 2300 g*.

  *1 kg 700 g + 2 kg 300 g = 4 kg*.

  *6 L - 2 L = 4 L*.
]

#chu-y[
  Khi cộng hoặc so sánh, em nên đổi về *cùng đơn vị* trước.
  Đặc biệt nhớ: *1 kg = 1000 g*.
]

#bt-label(so: "39", title: "Đổi đơn vị — Convert units")

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 8pt,
  [3 kg = #o-so() g], [5 000 g = #o-so() kg], [2 kg 500 g = #o-so() g], [1 500 g = #o-so() kg #o-so() g],
  [4 kg = #o-so() g], [2 000 g = #o-so() kg], [3 kg 250 g = #o-so() g], [2 750 g = #o-so() kg #o-so() g],
)

#bt-label(so: "40", title: "So sánh — Compare")

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [*a)* 3 kg #_blank 2 500 g #h(2em) 4 500 g #_blank 5 kg], [*b)* 6 L + 3 L = #o-so() L #h(2em) 10 L - 4 L = #o-so() L],
  [*c)* 1 kg 200 g #_blank 1200 g #h(2em) 2 kg 50 g #_blank 2500 g],
  [*d)* 8 L - 3 L = #o-so() L #h(2em) 4 L + 5 L = #o-so() L],
)

#bt-label(so: "41", title: "Toán đố đo lường — Measurement word problems")

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  block(fill: C-MINT, stroke: 1.5pt + C-GREEN, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    🛒 Mẹ mua *3 kg táo* và *2 kg lê*. Tổng nặng bao nhiêu? Trả *150 000 đồng*, mỗi kg trái cây giá *25 000 đồng*. Mẹ mua dư không?
    #bar-model(
      label-total: "? kg",
      parts: (
        (label: "3 kg táo", w: 6.0),
        (label: "2 kg lê", w: 4.0),
      ),
      bw: 10.0,
    )
    #o-tra-loi(h: 3cm, label: "Bài giải:")
  ],
  block(fill: C-LAVENDER, stroke: 1.5pt + C-PURPLE, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    🥤 Bình nước chứa *8 lít*. Buổi sáng uống *2 L*, buổi chiều uống *1 L 500 ml* (= 1,5 L). Buổi tối còn lại bao nhiêu lít?
    #o-tra-loi(h: 4cm, label: "Bài giải:")
  ],
)

#so-do-thanh-goi-y[
  *Bài đo lường thường dễ hơn nếu đổi về cùng đơn vị rồi mới vẽ sơ đồ.*

  Ví dụ: *3 kg 400 g = 3400 g* và *2 kg 800 g = 2800 g*.

  #align(center)[
    #bar-model(
      label-total: "?",
      parts: (
        (label: "3400 g", w: 5.4),
        (label: "2800 g", w: 4.6),
      ),
      bw: 10.0,
    )
  ]

  Khi các số đã cùng đơn vị, em sẽ cộng hoặc so sánh dễ hơn nhiều.
]

#hai-cach[
  *Hai cách cộng 3 kg 400 g và 2 kg 800 g:*
  - Cách 1: đổi hết ra gam: 3400 + 2800 = 6200 g = 6 kg 200 g.
  - Cách 2: cộng riêng từng phần: 3 kg + 2 kg = 5 kg, còn 400 g + 800 g = 1200 g = 1 kg 200 g.

  Cả hai cách đều đúng. Cách 2 giúp em thấy vì sao phải đổi 1200 g thành 1 kg 200 g.
]

#sai-o-dau[
  Bạn Lan đổi *1 m 8 dm = 18 cm*. Em hãy sửa lại cho đúng và giải thích vì sao bạn Lan nhầm.
]

#nang-cao()[
  #set par(first-line-indent: 0em)
  🧠 *Bài toán cân bằng / Balance puzzle:*

  #canvas(length: 1cm, {
    import draw: *
    // Balance: left side has 2 apples, right side has 1 watermelon
    line((0, 2), (12, 2), stroke: 2.5pt + C-CH.at(4))
    line((6, 2), (6, 4), stroke: 2pt + C-CH.at(4))
    circle((6, 4), radius: 0.15, fill: C-CH.at(4), stroke: none)

    // Left pan
    line((0, 2), (1, 0.5), stroke: 1.5pt + C-CH.at(4))
    line((1, 0.5), (3.5, 0.5), stroke: 1.5pt + C-CH.at(4))
    line((3.5, 0.5), (4.5, 2), stroke: 1.5pt + C-CH.at(4))
    circle((1.8, 1.5), radius: 0.5, fill: C-RED.lighten(60%), stroke: 1pt + C-RED)
    content((1.8, 1.5), text(size: 8pt)[TÁO])
    circle((3.0, 1.5), radius: 0.5, fill: C-RED.lighten(60%), stroke: 1pt + C-RED)
    content((3.0, 1.5), text(size: 8pt)[TÁO])

    // Right pan
    line((7.5, 2), (8.5, 0.5), stroke: 1.5pt + C-CH.at(4))
    line((8.5, 0.5), (11, 0.5), stroke: 1.5pt + C-CH.at(4))
    line((11, 0.5), (12, 2), stroke: 1.5pt + C-CH.at(4))
    circle((9.75, 1.2), radius: (1.6, 0.7), fill: C-GREEN.lighten(60%), stroke: 1pt + C-GREEN)
    content((9.75, 1.2), text(size: 8pt)[DƯA HẤU])

    // Balance indicator
    content((3, -0.4), text(size: 10pt, fill: C-GOLD)[2 táo = 1 dưa hấu])
    content((9.75, -0.4), text(size: 10pt, fill: C-GOLD)[Dưa = ? táo])
  })
  #v(0.3em)

  *Tình huống 1:* 2 quả táo = 1 quả dưa hấu. Quả dưa nặng 2 kg. Một quả táo nặng bao nhiêu?
  #dong-viet(n: 1)

  *Tình huống 2:* Thêm 1 quả táo vào bên trái. Cần thêm bao nhiêu gam vào bên phải để cân bằng?
  #dong-viet(n: 1)
]

// ═══ ÔN TẬP CHƯƠNG 5 ════════════════════════════════════════════

= Ôn Tập Chương 5 — Review: Measurement

#set par(first-line-indent: 0em)

*1.* Đổi đơn vị (Convert):
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 8pt,
  [4 m = #o-so() dm], [70 dm = #o-so() m], [3 kg 200 g = #o-so() g], [4 500 g = #o-so() kg #o-so() g],
)

*2.* So sánh (>, <, =):
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 8pt,
  [3 m #_blank 28 dm], [55 dm #_blank 6 m], [2 kg #_blank 1 800 g], [3 500 g #_blank 4 kg],
)

*3.* Đọc giờ:
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 10pt,
  [#dong-ho(gio: 8, phut: 0) #align(center)[*\_\_\_*]],
  [#dong-ho(gio: 4, phut: 30) #align(center)[*\_\_\_*]],
  [#dong-ho(gio: 12, phut: 0) #align(center)[*\_\_\_*]],
  [#dong-ho(gio: 1, phut: 30) #align(center)[*\_\_\_*]],
)

*4.* Toán đố tổng hợp: Buổi sáng An chạy *350 m*. Buổi chiều chạy *6 dm* ít hơn buổi sáng. Hỏi cả ngày An chạy tổng cộng bao nhiêu m?
#o-tra-loi(h: 4cm, label: "Bài giải:")

#cau-hoi-mo[
  Em hãy tìm *3 cách khác nhau* để tạo đúng *1 m* bằng *dm* và *cm*.

  Ví dụ: *5 dm + 50 cm = 1 m*.

  #o-tra-loi(h: 2.8cm, label: "Ba cách của em:")
]

#kiem-tra-header(chuong: "5", so-cau: "7", tg: "15 phút")

*Câu 1.* 3 dm = ? cm
#trac-nghiem-4(
  [3 cm],
  [30 cm],
  [300 cm],
  [0,3 cm],
)

*Câu 2.* Đồng hồ kim ngắn ở số 5, kim dài ở số 6. Mấy giờ?
#trac-nghiem-4(
  [5 giờ],
  [6 giờ 30],
  [5 giờ 30],
  [5 giờ 6 phút],
)

*Câu 3.* 2 kg 500 g = ? g
#trac-nghiem-4(
  [250 g],
  [2 500 g],
  [25 000 g],
  [20 500 g],
)

*Câu 4.* (2 điểm) Đổi và so sánh:
5 m 4 dm = \_\_\_ cm #h(2em) và #h(2em) 550 cm #_blank 5 m 4 dm

*Câu 5.* (2 điểm) Vẽ đồng hồ chỉ 9 giờ 30:
#o-tra-loi(h: 4cm)

*Câu 6.* (3 điểm) 🎒 Túi sách của An nặng *3 kg 400 g*, của Bình nặng *2 kg 800 g*. Bạn nào nặng hơn? Nặng hơn bao nhiêu gam? Tổng nặng cả hai túi là bao nhiêu kg?
#o-tra-loi(h: 4cm, label: "Bài giải:")

#sao-danh-gia
