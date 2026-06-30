#import "_config.typ": *

#lesson([Nhận Dạng Tam Giác Cơ Bản và Công Thức Liên Hệ], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

// ─────────────────────────────────────────────────
#muc([Giá Trị Lượng Giác Các Góc Đặc Biệt])
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
#muc([Tam Giác Đặc Biệt — Nhận Dạng Nhanh])
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
#muc([Định Lý Sin — Công Cụ Tìm Cạnh và Góc])
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
#muc([Định Lý Cos — Tổng Quát Hóa Pythagoras])
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
#muc([Công Thức Diện Tích và Bán Kính Nội/Ngoại Tiếp])
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
#muc([Các Trường Hợp Đồng Nhất Tam Giác — Nhận Dạng Nhanh])
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

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b13-de1.typ"
