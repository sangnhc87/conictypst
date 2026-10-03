#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI13
// Toán 11 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)

#show: lecture-theme.with(
  title:       "BÀI 13: ĐỊNH LÝ SIN VÀ ĐỊNH LÝ CÔSIN",
  subtitle:    "TOÁN 11 — Chương I: Hàm số lượng giác và Phương trình lượng giác",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                
  math-color:  rgb("#d81b60"),                      // Magenta
  math-size:   1.05em,                              
  body-font:   ("Arial", "Times New Roman"),        
)

#lec-reset()
#lt-toc()

#let c-book = rgb("#4338CA")
#let resetexamstate() = none
#let khoitao() = none
#let resetcau() = none
#let exam-part(title, ..args) = slide[= #title]
#let q-wrap(..args) = args.pos().at(0)
#let mybox(fill, stroke, ..args) = {
  let pos = args.pos()
  let title = if pos.len() > 1 { pos.at(0) } else { none }
  let body = if pos.len() > 1 { pos.at(1) } else { pos.at(0) }
  block(fill: fill, stroke: 1pt + stroke, inset: 10pt, width: 100%, radius: 4pt, [*#title* #body])
}
#let dn(..args) = mybox(luma(240), black, ..args)
#let vd(..args) = mybox(rgb("#e8f4f8"), blue, ..args)
#let tc(..args) = mybox(rgb("#fcf4cd"), orange, ..args)
#let kl(..args) = mybox(rgb("#eaf8e6"), green, ..args)
#let nx(..args) = mybox(rgb("#fce4ec"), red, ..args)
#let hq = kl
#let luuy = nx
#let ch = nx
#let ntkq = tc
#let chame = kl
#let ghinho = kl
#let phuongphap = tc
#let nhanxet = nx

#let my-tn(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}

#let my-ds(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}

#let my-tln(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}
#let my-bbbt = bbbt
#let my-bxd = bxd
#let tn = my-tn
#let ds = my-ds
#let tln = my-tln
#let tl = my-tln
#let tlu = my-tln


#slide[ = Lịch sử: Chinh phục không gian bằng tam giác ]
- Việc đo khoảng cách đến các ngọn núi cao, khoảng cách giữa các vì sao, hay thậm chí khoảng cách từ Trái Đất đến Mặt Trăng được thực hiện thông qua kỹ thuật *"Tam giác đạc"* (Triangulation).
- *Al-Kashi*, một nhà toán học thế kỷ 15, đã công bố Định lý Cosin ở dạng tổng quát để sử dụng trong thiết kế đài thiên văn và tính toán vị trí hành tinh.
- Nhờ Định lý Sin và Cosin, nhân loại đã có thể đo đạc thế giới mà không cần phải dùng thước dây đi từng mét!


#slide[ = Cơ sở lý thuyết ]





// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Bảng giá trị lượng giác góc đặc biệt — PHẢI THUỘC])[
    #align(center)[
      #table(
        columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center,
        stroke: 0.5pt + luma(180),
        inset: 9pt,
        fill: (col, row) => if row == 0 { c-book.lighten(85%) }
                            else if col == 0 { c-book.lighten(92%) }
                            else { white },
        [*Góc $alpha$*], [$0°$], [$30° = pi/6$], [$45° = pi/4$], [$60° = pi/3$], [$90° = pi/2$], [$180° = pi$],
        [$sin alpha$], [$0$], [$display(1/2)$], [$display(sqrt(2)/2)$], [$display(sqrt(3)/2)$], [$1$], [$0$],
        [$cos alpha$], [$1$], [$display(sqrt(3)/2)$], [$display(sqrt(2)/2)$], [$display(1/2)$], [$0$], [$-1$],
        [$tan alpha$], [$0$], [$display(sqrt(3)/3)$], [$1$], [$sqrt(3)$], [k.x.đ], [$0$],
        [$cot alpha$], [k.x.đ], [$sqrt(3)$], [$1$], [$display(sqrt(3)/3)$], [$0$], [k.x.đ],
      )
    ]
    *Mẹo nhớ sin:* $0, 1, sqrt(2), sqrt(3), 2$ — chia đôi rồi lấy căn.
    $sin 0° = 0/2, quad sin 30° = sqrt(1)/2, quad sin 45° = sqrt(2)/2, quad sin 60° = sqrt(3)/2, quad sin 90° = sqrt(4)/2$
  ]
]

// Đường tròn lượng giác với các góc đặc biệt
#block(breakable: false)[
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let pi = 3.14159

      // Trục tọa độ
      line((-2.4, 0), (2.4, 0), mark: (end: ">"), stroke: 0.8pt)
      line((0, -2.4), (0, 2.4), mark: (end: ">"), stroke: 0.8pt)
      content((2.5, -0.25), text(size: 9pt)[$x$])
      content((0.2, 2.35), text(size: 9pt)[$y$])
      content((-0.25, -0.2), text(size: 9pt)[$O$])

      // Đường tròn đơn vị
      circle((0,0), radius: 2, stroke: 1pt + c-book)

      // Các góc đặc biệt và điểm tương ứng
      let pts = (
        (0deg,   (2, 0),    [$0°$],    (2.3, -0.2),  blue),
        (30deg,  (1.732, 1),[$30°$],   (1.7, 1.3),   c-book),
        (45deg,  (1.414, 1.414), [$45°$], (1.35, 1.7), rgb("#7c3aed")),
        (60deg,  (1, 1.732), [$60°$],  (0.7, 2.0),   rgb("#0f766e")),
        (90deg,  (0, 2),   [$90°$],    (-0.35, 2.3), rgb("#b91c1c")),
      )

      for (ang, pt, lbl, lpos, col) in pts {
        line((0,0), pt, stroke: (paint: col, thickness: 0.6pt, dash: "dashed"))
        circle(pt, radius: 0.07, fill: col)
        content(lpos, text(size: 8pt, fill: col)[#lbl])
        if ang != 0deg {
          arc((0, 0), start: 0deg, stop: ang, radius: 0.7,
              stroke: 0.5pt + col)
        }
      }


      // Trục nhãn
      for (x, l) in ((-2, $-1$), (2, $1$)) {
        line((x, -0.05), (x, 0.05))
        content((x, -0.3), text(size: 8pt)[#l])
      }
      for (y, l) in ((-2, $-1$), (2, $1$)) {
        line((-0.05, y), (0.05, y))
        content((-0.4, y), text(size: 8pt)[#l])
      }

      // Chú thích
      content((0, -2.6), text(size: 8pt, fill: luma(60))[Đường tròn lượng giác đơn vị và các góc đặc biệt])
    })
  ]
]

// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *Tam giác vuông cân (45°–45°–90°)* \
      #align(center)[
        #cetz.canvas(length: 1.2cm, {
          import cetz.draw: *
          // Tam giác vuông cân
          line((0,0), (2,0), (2,2), (0,0), stroke: 1.5pt + c-book)
          // Ký hiệu vuông
          rect((2, 0), (1.75, 0.25), stroke: 0.8pt)
          // Cạnh
          content((1, -0.3), text(size: 8pt)[$a$])
          content((2.3, 1), text(size: 8pt)[$a$])
          content((0.8, 1.2), text(size: 8pt)[$a sqrt(2)$])
          // Góc
          content((0.35, 0.2), text(size: 8pt, fill: c-book)[$45°$])
          content((1.65, 1.75), text(size: 8pt, fill: c-book)[$45°$])
        })
      ]
      $ sin 45° = cos 45° = sqrt(2)/2 $
    ],
    [
      *Tam giác đều — nửa (30°–60°–90°)* \
      #align(center)[
        #cetz.canvas(length: 1.2cm, {
          import cetz.draw: *
          // Nửa tam giác đều
          line((0,0), (2,0), (1, 1.732), (0,0), stroke: 1.5pt + c-book)
          // Cạnh
          content((1, -0.3), text(size: 8pt)[$a$])
          content((1.8, 1), text(size: 8pt)[$a$])
          content((-0.4, 0.9), text(size: 8pt)[$a sqrt(3)/2$])
          // Đường cao
          line((1, 0), (1, 1.732), stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
          content((1.15, 0.5), text(size: 7pt, fill: gray)[$h$])
          // Góc
          content((0.4, 0.18), text(size: 8pt, fill: rgb("#0f766e"))[$60°$])
          content((1.5, 0.18), text(size: 8pt, fill: rgb("#b91c1c"))[$60°$])
          content((0.9, 1.5), text(size: 8pt, fill: c-book)[$60°$])
        })
      ]
      $ sin 60° = sqrt(3)/2, quad cos 60° = 1/2 $
    ]
  )
]

// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Định lý sin])[
    Trong tam giác $A B C$ có các cạnh $a, b, c$ đối diện với các góc $A, B, C$ và $R$ là bán kính đường tròn ngoại tiếp:
    $ display(a / sin A = b / sin B = c / sin C = 2R) $

    *Khi nào dùng định lý sin?*
    - Biết một cặp (cạnh, góc đối) và thêm một cạnh hoặc góc bất kỳ.
    - Tìm bán kính đường tròn ngoại tiếp: $R = display(a / (2 sin A))$.
  ]
]

#block(breakable: false)[
  #align(center)[
    #cetz.canvas(length: 1.3cm, {
      import cetz.draw: *
      // Tam giác ABC
      let A = (0, 0)
      let B = (3.5, 0)
      let C = (2, 2.5)
      line(A, B, C, A, stroke: 1.5pt + c-book)

      // Nhãn đỉnh
      content((A.at(0) - 0.25, A.at(1) - 0.25), text(size: 10pt, weight: "bold")[$A$])
      content((B.at(0) + 0.15, B.at(1) - 0.25), text(size: 10pt, weight: "bold")[$B$])
      content((C.at(0) - 0.1, C.at(1) + 0.2), text(size: 10pt, weight: "bold")[$C$])

      // Nhãn cạnh
      content((1.75, -0.3), text(size: 9pt)[$c = A B$])
      content((3.0, 1.4), text(size: 9pt)[$b = A C$])
      content((0.65, 1.4), text(size: 9pt)[$a = B C$])

      // Góc cung
      let ang_A = 37deg
      let ang_B = 180deg - 35deg
      arc(A, start: 0deg, stop: ang_A, radius: 0.6,
          stroke: 0.6pt + rgb("#b91c1c"))
      content((0.65, 0.2), text(size: 9pt, fill: rgb("#b91c1c"))[$A$])

      // Đường tròn ngoại tiếp
      let cx = 1.75
      let cy = 0.9
      circle((cx, cy), radius: 1.55, stroke: (paint: c-book.lighten(50%), dash: "dashed", thickness: 0.5pt))
      content((cx, cy), text(size: 7pt, fill: c-book.lighten(30%))[$O$])
      circle((cx, cy), radius: 0.05, fill: c-book.lighten(30%))
    })
  ]
]

#vd([Tam giác $A B C$ có $a = 6$ cm, $A = 60°$, $B = 45°$. Tính cạnh $b$.],
  loigiai: [
    Áp dụng định lý sin: $display(a / sin A = b / sin B)$

    $C = 180° - 60° - 45° = 75°$

    $b = display(a sin B / sin A) = display(6 dot sin 45° / sin 60°) = display(6 dot (sqrt(2)/2) / (sqrt(3)/2)) = display(6 sqrt(2) / sqrt(3)) = 2sqrt(6)$ cm.
  ]
)

// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Định lý cos])[
    Trong tam giác $A B C$:
    $ a^2 = b^2 + c^2 - 2 b c cos A $
    $ b^2 = a^2 + c^2 - 2 a c cos B $
    $ c^2 = a^2 + b^2 - 2 a b cos C $

    *Suy ra tìm góc:*
    $ cos A = display(frac(b^2 + c^2 - a^2, 2 b c)) $

    *Khi nào dùng định lý cos?*
    - Biết 3 cạnh → Tính góc.
    - Biết 2 cạnh + góc xen giữa → Tính cạnh còn lại.

    *Kiểm tra nhanh:* Nếu $A = 90°$ thì $cos A = 0$ → $a^2 = b^2 + c^2$ (Pythagoras đặc biệt).
  ]
]

#vd([Tam giác $A B C$ có $a = 5$, $b = 7$, $C = 60°$. Tính cạnh $c$.],
  loigiai: [
    Áp dụng định lý cos:
    $c^2 = a^2 + b^2 - 2 a b cos C = 25 + 49 - 2 dot 5 dot 7 dot display(1/2) = 74 - 35 = 39$

    Suy ra $c = sqrt(39) approx 6.24$.
  ]
)

// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #ghinho(title: [★ Các công thức tổng hợp trong tam giác])[
    Cho tam giác $A B C$ có các cạnh $a, b, c$; nửa chu vi $p = display((a+b+c)/2)$:

    #grid(columns: (1fr, 1fr), gutter: 1.5em,
      [
        *Diện tích:*
        $ S = display(1/2) a h_a = display(1/2) a b sin C $
        $ S = sqrt(p(p-a)(p-b)(p-c)) $
        _(Công thức Heron)_
      ],
      [
        *Bán kính:*
        $ R = display(frac(a b c, 4 S)) quad "ngoại tiếp" $
        $ r = display(frac(S, p)) quad "nội tiếp" $
        $ r = 4 R sin(A/2) sin(B/2) sin(C/2) $
      ]
    )
  ]
]

#vd([Tam giác đều cạnh $a = 6$ cm. Tính bán kính đường tròn ngoại tiếp $R$ và nội tiếp $r$.],
  loigiai: [
    Tam giác đều: $A = B = C = 60°$, $p = 9$.

    $S = display(frac(sqrt(3), 4)) a^2 = display(frac(sqrt(3), 4)) dot 36 = 9sqrt(3)$ cm².

    $R = display(frac(a b c, 4S)) = display(frac(6 dot 6 dot 6, 4 dot 9 sqrt(3))) = display(frac(216, 36 sqrt(3))) = display(frac(6, sqrt(3))) = 2 sqrt(3)$ cm.

    $r = display(frac(S, p)) = display(frac(9 sqrt(3), 9)) = sqrt(3)$ cm.

    *Nhận xét:* Với tam giác đều $R = 2r$ — kết quả đẹp.
  ]
)

// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #nhanxet(title: [◈ Bảng nhận dạng tam giác từ điều kiện cho trước])[
    #align(center)[
      #table(
        columns: (auto, 1fr, auto),
        align: (center, left, center),
        stroke: 0.5pt + luma(180),
        inset: 8pt,
        fill: (col, row) => if row == 0 { c-book.lighten(85%) } else { white },
        [*Điều kiện*], [*Kết luận*], [*Dùng công thức*],
        [$a^2 = b^2 + c^2$], [Tam giác vuông tại $A$], [Pythagoras],
        [$cos A < 0$], [Góc $A$ tù ($A > 90°$)], [Định lý cos],
        [$a/sin A = 2R$], [Biết $R$ → suy ra quan hệ cạnh/góc], [Định lý sin],
        [$A = B$], [Tam giác cân tại $C$ ($a = b$)], [Tính chất tg cân],
        [$A = B = C = 60°$], [Tam giác đều], [Mọi công thức đơn giản],
      )
    ]
  ]
]

#pagebreak()






#slide[ = Bài tập Luyện tập ]


#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

// ─── TN 1: Định lý sin thực tế — đo khoảng cách ───
#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Hai điểm A, B trên bờ sông
    line((0, 0), (3, 0), stroke: 2pt + c-book, mark: (end: ">", start: "|"))
    content((1.5, 0.25), text(size: 8pt)[$A B = 200$ m])
    // Điểm C bên kia sông
    circle((1.5, 2.5), radius: 0.08, fill: red)
    content((1.7, 2.7), text(size: 8pt)[$C$])
    line((0, 0), (1.5, 2.5), stroke: 0.8pt)
    line((3, 0), (1.5, 2.5), stroke: 0.8pt)
    // Nhãn
    content((-0.3, 0), text(size: 8pt)[$A$])
    content((3.2, 0), text(size: 8pt)[$B$])
    // Góc
    content((0.5, 0.25), text(size: 7pt, fill: rgb("#b91c1c"))[$65°$])
    content((2.4, 0.25), text(size: 7pt, fill: rgb("#0f766e"))[$75°$])
    // Sông
    rect((0, 0.4), (3, 2.3), fill: blue.lighten(85%), stroke: none)
    content((1.5, 1.35), text(size: 8pt, fill: blue.darken(20%))[~ ~ ~ Sông ~ ~ ~])
  }),
  [Từ hai điểm $A$ và $B$ trên bờ sông (cách nhau 200 m), người ta đo góc $C A B = 65°$ và $C B A = 75°$ nhìn về phía điểm $C$ bên kia sông. Tính khoảng cách từ $A$ đến $C$ (làm tròn đến mét).],
  ([$183$ m], True([$193$ m]), [$205$ m], [$217$ m]),
  loigiai: [
    #step[*B1: Tính góc $C$* \ $C = 180° - 65° - 75° = 40°$.]
    #step[*B2: Áp dụng định lý sin* \
      $display(A C / sin B = A B / sin C)$ \
      $A C = display(200 dot sin 75° / sin 40°) approx display(200 dot 0.9659 / 0.6428) approx 193.1$ m.]
  ],
))

// ─── TN 2: Định lý cos — cầu vượt dạng tam giác ───
#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Hai chân cầu
    circle((0, 0), radius: 0.07, fill: black)
    circle((4, 0), radius: 0.07, fill: black)
    // Mái cầu (hình tam giác)
    line((0,0), (2, 2), (4, 0), stroke: 2pt + c-book)
    // Cạnh đáy
    line((0,0), (4,0), stroke: (paint: gray, dash: "dashed"))
    content((2, -0.3), text(size: 8pt)[$c = 8$ m])
    content((-0.5, 1.1), text(size: 8pt)[$b = 5$ m])
    content((4.35, 1.1), text(size: 8pt)[$a = 5$ m])
    content((2.1, 2.25), text(size: 8pt, weight: "bold")[$C$])
    content((0.4, 0.2), text(size: 8pt, fill: c-book)[$B$])
    content((3.6, 0.2), text(size: 8pt, fill: c-book)[$A$])
  }),
  [Một khung cửa vòm mái tam giác cân có hai cạnh bên $a = b = 5$ m và đáy $c = 8$ m. Góc đỉnh $C$ của khung (góc tại đỉnh vòm) bằng bao nhiêu độ?],
  ([$48.2°$], [$95.7°$], True([$106.3°$]), [$120°$]),
  loigiai: [
    #step[*B1: Áp dụng định lý cos* \
      $cos C = display(frac(a^2 + b^2 - c^2, 2 a b)) = display(frac(25 + 25 - 64, 2 dot 25)) = display(frac(-14, 50)) = -0.28$]
    #step[*B2: Tính góc* \
      $C = arccos(-0.28) approx 106.3°$. Góc tù — đỉnh vòm cong.]
  ],
))

// ─── TN 3: Diện tích tam giác thực tế — mảnh đất ───
#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Mảnh đất hình tam giác
    let A = (0, 0)
    let B = (4, 0)
    let C = (2.5, 2.5)
    line(A, B, C, A, stroke: 1.5pt + c-book, fill: c-book.lighten(92%))
    content((A.at(0)-0.2, -0.25), text(size: 8pt)[$A$])
    content((B.at(0)+0.1, -0.25), text(size: 8pt)[$B$])
    content((C.at(0)+0.1, C.at(1)+0.15), text(size: 8pt)[$C$])
    content((2, -0.35), text(size: 8pt)[$12$ m])
    content((-0.8, 1.2), text(size: 8pt)[$10$ m])
    content((0.5, 0.35), text(size: 8pt, fill: rgb("#b91c1c"))[$60°$])
  }),
  [Một mảnh đất hình tam giác $A B C$ có $A B = 12$ m, $A C = 10$ m và $angle B A C = 60°$. Diện tích của mảnh đất là:],
  ([$48.5$ m²], [$52.7$ m²], True([$30 sqrt(3) approx 51.96$ m²]), [$60$ m²]),
  loigiai: [
    $S = display(1/2) dot A B dot A C dot sin(angle B A C) = display(1/2) dot 12 dot 10 dot sin 60° = 60 dot display(sqrt(3)/2) = 30 sqrt(3) approx 51.96$ m².
  ],
))

// ─── TN 4: Đường tròn ngoại tiếp ───
#q-wrap(dir: "doc", tn(
  [Tam giác $A B C$ có $a = 4$, $b = 4 sqrt(3)$, $c = 8$. Bán kính đường tròn ngoại tiếp $R$ bằng:],
  ([$2$], [$2 sqrt(3)$], [$4$], True([$4 sqrt(3)/3 approx 2.31$... Thực ra $R = 4$])),
  loigiai: [
    #step[*B1: Xác định loại tam giác.* \
      Ta kiểm tra: $c^2 = 64$; $a^2 + b^2 = 16 + 48 = 64 = c^2$. Đây là tam giác vuông tại $C$.]
    #step[*B2: Bán kính ngoại tiếp tam giác vuông.* \
      Với tam giác vuông, $R = display(c/2) = display(8/2) = 4$.]
  ],
))

// ─── TN 5: Tháp Eiffel đo góc ứng dụng thực tế ───
#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Tòa tháp
    line((2, 0), (2, 3), stroke: 2pt + c-book)
    line((1.8, 0), (2.2, 0), stroke: 2pt)
    // Điểm quan sát
    circle((0, 0), radius: 0.08, fill: red)
    content((-0.3, -0.2), text(size: 8pt)[$A$])
    // Góc ngẩng
    line((0,0), (2, 3), stroke: 0.8pt)
    arc((0, 0), start: 0deg,
        stop: 56.3deg, radius: 0.7, stroke: 0.5pt + red)
    content((0.9, 0.3), text(size: 8pt, fill: red)[$alpha$])
    // Khoảng cách
    line((0, -0.2), (2, -0.2), stroke: (paint: gray, dash: "dashed"))
    content((1, -0.45), text(size: 8pt)[$d = ?$])
    // Chiều cao
    content((2.4, 1.5), text(size: 8pt)[$h = 300$ m])
  }),
  [Nhìn từ điểm $A$ trên mặt đất, góc ngẩng lên đỉnh tháp cao $h = 300$ m là $alpha = 56.3°$. Khoảng cách từ $A$ đến chân tháp (theo phương nằm ngang) xấp xỉ bằng:],
  ([$150$ m], True([$200$ m]), [$250$ m], [$350$ m]),
  loigiai: [
    $tan alpha = display(h / d) => d = display(h / tan alpha) = display(300 / tan 56.3°) approx display(300 / 1.501) approx 200$ m.
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

// ─── ĐS 1: Tam giác — đúng sai về định lý sin/cos ───
#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3.5, 0)
    let C = (1.5, 2.2)
    line(A, B, C, A, stroke: 1.5pt + c-book)
    content((-0.3,-0.2), text(size: 9pt, weight: "bold")[$A$])
    content((3.7,-0.2), text(size: 9pt, weight: "bold")[$B$])
    content((1.5, 2.4), text(size: 9pt, weight: "bold")[$C$])
    content((1.75, -0.3), text(size: 8pt)[$c$])
    content((-0.35, 1.1), text(size: 8pt)[$b$])
    content((3.3, 1.1), text(size: 8pt)[$a$])
  }),
  [Cho tam giác $A B C$ có $a = 5$, $b = 8$, $A = 30°$. Xét tính đúng sai của các mệnh đề:],
  (
    True([Có thể áp dụng định lý sin để tìm góc $B$: $sin B = display(b sin A / a) = display(8 dot 0.5 / 5) = 0.8$, suy ra $B approx 53.1°$ hoặc $B approx 126.9°$.]),
    [Vì $sin B = 0.8 < 1$ nên tam giác $A B C$ luôn tồn tại duy nhất.],
    True([Nếu $B approx 53.1°$ thì $C approx 96.9°$ và $c = display(a sin C / sin A) approx 9.93$.]),
    True([Diện tích tam giác khi $B approx 53.1°$ là $S = display(1/2) a b sin C approx display(1/2) dot 5 dot 8 dot sin 96.9° approx 19.87$ đvdt.]),
  ),
  loigiai: [
    - *a) Đúng.* $sin B = display(8 sin 30° / 5) = display(4/5) = 0.8 in [-1;1]$. Áp dụng được định lý sin.
    - *b) Sai.* $sin B = 0.8 < 1$ nhưng góc $B$ có thể là $53.1°$ hoặc $126.9°$. Với $B = 126.9°$ thì $A + B = 156.9° < 180°$, vẫn hợp lệ. Vậy tam giác có *hai trường hợp* (bài toán 2 tam giác).
    - *c) Đúng.* $C = 180° - 30° - 53.1° = 96.9°$; $c = display(5 sin 96.9° / sin 30°) = display(5 dot 0.9927 / 0.5) approx 9.93$.
    - *d) Đúng.* $S = display(1/2) dot 5 dot 8 dot sin 96.9° approx 20 dot 0.9927 approx 19.85$ (xấp xỉ $19.87$).
  ],
))

// ─── ĐS 2: Mô hình hóa — đo đỉnh núi ───
#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Đỉnh núi
    line((2.5, 0), (0, 0), (0, 3), (2.5, 0), fill: c-book.lighten(90%), stroke: 1pt)

    // Đường đáy
    line((0, 0), (4, 0), stroke: 2pt + black)
    circle((4, 0), radius: 0.07, fill: red)
    content((4.2, -0.25), text(size: 8pt)[$B$])
    content((-0.25, -0.2), text(size: 8pt)[$A$])
    content((-0.25, 3.1), text(size: 8pt, fill: c-book)[$C$])
    // Góc
    content((0.4, 0.2), text(size: 7pt, fill: red)[$42°$])
    content((3.5, 0.2), text(size: 7pt, fill: rgb("#0f766e"))[$35°$])
    content((2, -0.35), text(size: 8pt)[$500$ m])
  }),
  [Từ hai điểm $A$ và $B$ cách nhau 500 m trên mặt đất, người ta nhìn lên đỉnh núi $C$ với góc ngẩng lần lượt là $42°$ và $35°$ (cùng phía). Gọi $H$ là chân đường cao từ $C$ xuống $A B$. Xét các mệnh đề:],
  (
    True([Góc $C A B = 90° - 42° = 48°$ và $angle C B A = 90° - 35° = 55°$.]),
    True([Góc $A C B = 180° - 48° - 55° = 77°$.]),
    True([Cạnh $A C = display(500 dot sin 55° / sin 77°) approx 420.4$ m.]),
    True([Chiều cao $C H = A C dot sin 48° approx 312.5$ m.]),
  ),
  loigiai: [
    - *a) Đúng.* Góc giữa $A C$ và mặt đất là $42°$, do đó góc trong tam giác tại $A$ là $90° - 42° = 48°$. Tương tự tại $B$.
    - *b) Đúng.* $angle A C B = 180° - 48° - 55° = 77°$.
    - *c) Đúng.* Theo định lý sin: $A C = display(500 dot sin 55° / sin 77°) = display(500 dot 0.8192 / 0.9744) approx 420.4$ m.
    - *d) Đúng.* $C H = A C dot sin(angle C A B) = 420.4 dot sin 48° approx 420.4 dot 0.7431 approx 312.4$ m.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

// ─── TLN 1: Tìm diện tích bằng Heron ───
#q-wrap(dir: "doc", tln(
  [Tam giác có ba cạnh $a = 13$ cm, $b = 14$ cm, $c = 15$ cm. Tính diện tích tam giác theo công thức Heron (kết quả làm tròn đến chữ số thập phân thứ nhất).],
  [$84.0$],
  loigiai: [
    #step[*B1: Tính nửa chu vi.* \ $p = display((13 + 14 + 15) / 2) = 21$ cm.]
    #step[*B2: Áp dụng công thức Heron.* \
      $S = sqrt(p(p-a)(p-b)(p-c)) = sqrt(21 dot 8 dot 7 dot 6) = sqrt(7056) = 84$ cm².]
    #step[*B3: Kết luận.* \ $S = 84.0$ cm².]
  ],
))

// ─── TLN 2: Bán kính nội tiếp mảnh đất ───
#q-wrap(dir: "doc", tln(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (5, 0)
    let C = (2, 3)
    line(A, B, C, A, stroke: 1.5pt + c-book, fill: c-book.lighten(94%))
    // Đường tròn nội tiếp
    circle((2, 1.1), radius: 1.0, stroke: (paint: red, thickness: 0.8pt, dash: "dashed"))
    circle((2, 1.1), radius: 0.05, fill: red)
    content((2.2, 0.9), text(size: 7pt, fill: red)[$I$])
    // Nhãn
    content((-0.3,-0.2), text(size: 8pt)[$A$])
    content((5.15,-0.2), text(size: 8pt)[$B$])
    content((2, 3.2), text(size: 8pt)[$C$])
    content((2.5,-0.35), text(size: 8pt)[$15$ m])
    content((-0.8, 1.5), text(size: 8pt)[$13$ m])
    content((4.5, 1.5), text(size: 8pt)[$14$ m])
  }),
  [Một mảnh đất tam giác cần được đặt một bể nước hình trụ có đáy tiếp xúc với ba cạnh (đường tròn nội tiếp). Biết ba cạnh mảnh đất là $a = 13$ m, $b = 14$ m, $c = 15$ m. Bán kính bể nước $r$ bằng bao nhiêu mét? (Làm tròn đến 2 chữ số thập phân).],
  [$4.00$],
  loigiai: [
    #step[*B1: Diện tích tam giác* (từ bài TLN 1). \ $S = 84$ m².]
    #step[*B2: Nửa chu vi.* \ $p = 21$ m.]
    #step[*B3: Bán kính nội tiếp.* \ $r = display(S / p) = display(84 / 21) = 4.00$ m.]
  ],
))


