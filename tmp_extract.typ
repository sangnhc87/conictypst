#import "../preamble.typ": *
#show math.frac: math.display

#muc([Đề Luyện Tập Số 02])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: auto)

// ─── CÂU 1 ───
#tn(
  [Hàm số nào sau đây có bảng biến thiên như hình dưới đây?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $2$, $+oo$),
        d-signs: ("-", "||", "-"),
        v-vals: ($2$, ($-oo$, $+oo$), $2$),
        ranks: (1, (-2, 2), 1)
      )
    ]
  ],
  (
    [$y = (2x - 7)/(x - 2)$.],
    [$y = (2x + 1)/(x + 2)$.],
    True([$y = (2x + 1)/(x - 2)$.]),
    [$y = (1 - 2x)/(x - 2)$.]
  ),
  loigiai: []
)


// ─── CÂU 2 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-4.0, 0), (3.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.0), (0, 5.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.0), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = -1
    line((-1, -3.0), (-1, 5.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-1, 0.35), $-1$, anchor: "east")
    
    // Tiệm cận ngang y = 1
    line((-4.0, 1), (3.0, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0.2, 1.2), $1$)
    
    // Đồ thị y = (x + 2)/(x + 1)
    // Nhánh trái: x thuộc [-4.0, -1.15]
    let pts_left = ()
    for i in range(-40, -12) {
      let x = i / 10
      let y = (x + 2) / (x + 1)
      if y >= -3.0 and y <= 5.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    // Nhánh phải: x thuộc [-0.85, 3.0]
    let pts_right = ()
    for i in range(-8, 30) {
      let x = i / 10
      let y = (x + 2) / (x + 1)
      if y >= -3.0 and y <= 5.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x + b)/(c x + d)$ có đồ thị hàm số như hình vẽ dưới đây. Tìm khẳng định đúng trong các khẳng định sau:],
  (
    [$0 < b < a$.],
    True([$0 < a < b$.]),
    [$b < 0 < a$.],
    [$a < b < 0$.]
  ),
  loigiai: []
)


// ─── CÂU 3 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-4.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -4.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1, -0.4), $x = 1$, anchor: "north")
    
    // Tiệm cận ngang y = 1
    line((-4.0, 1), (4.0, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-2.0, 1.2), $y = 1$)
    
    // Đồ thị y = x/(x - 1)
    // Nhánh trái: x thuộc [-4.0, 0.85]
    let pts_left = ()
    for i in range(-40, 8) {
      let x = i / 10
      let y = x / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    // Nhánh phải: x thuộc [1.15, 4.0]
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = x / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Hàm số nào sau đây mà đồ thị có dạng như hình vẽ bên dưới?],
  (
    [$y = x/(1 - x)$.],
    [$y = (x + 1)/(1 - x)$.],
    [$y = (x + 1)/(x - 1)$.],
    True([$y = x/(x - 1)$.])
  ),
  loigiai: []
)


// ─── CÂU 4 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, 0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -4.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.3, -3.5), $x = 1$)
    
    // Tiệm cận ngang y = -1
    line((-3.0, -1), (4.0, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((2.5, -1.3), $y = -1$)
    
    // Đồ thị y = (-x + 2)/(x - 1)
    // Nhánh trái: x thuộc [-3.0, 0.8]
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    // Nhánh phải: x thuộc [1.2, 4.0]
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x - b)/(x - 1)$ có đồ thị như hình vẽ. Khẳng định nào dưới đây là đúng?],
  (
    [$b < 0 < a$.],
    [$0 < b < a$.],
    True([$b < a < 0$.]),
    [$0 < a < b$.]
  ),
  loigiai: []
)


// ─── CÂU 5 ───
#tn(
  [Bảng biến thiên sau đây của hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-1$, $+oo$),
        d-signs: ("+", "||", "+"),
        v-vals: ($2$, ($+oo$, $-oo$), $2$),
        ranks: (0, (2, -1), 0)
      )
    ]
  ],
  (
    [$y = (2x + 3)/(x + 1)$.],
    [$y = (2x - 1)/(x - 1)$.],
    True([$y = (2x - 1)/(x + 1)$.]),
    [$y = (x + 1)/(2x - 1)$.]
  ),
  loigiai: []
)


// ─── CÂU 6 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, 0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -4.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.3, -3.5), $x = 1$)
    
    // Tiệm cận ngang y = -1
    line((-3.0, -1), (4.0, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((2.5, -1.3), $y = -1$)
    
    // Điểm cắt trục tung (0, -2)
    content((-0.3, -2), $-2$)
    circle((0, -2), radius: 1.5pt, fill: black)
    
    // Điểm cắt trục hoành (2, 0)
    content((2, 0.3), $2$)
    circle((2, 0), radius: 1.5pt, fill: black)
    
    // Đồ thị y = (-x + 2)/(x - 1)
    // Nhánh trái: x thuộc [-3.0, 0.8]
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    // Nhánh phải: x thuộc [1.2, 4.0]
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x - b)/(x - 1)$ có đồ thị như hình vẽ bên. Tích $a . b$ bằng],
  (
    True([$2$.]),
    [$-3$.],
    [$-2$.],
    [$3$.]
  ),
  loigiai: []
)


// ─── CÂU 7 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -3.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.3, -2.5), $x = 1$)
    
    // Tiệm cận ngang y = 1/2
    line((-3.0, 0.5), (4.0, 0.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-2.0, 0.8), $y = 1/2$)
    
    // Đồ thị y = (x + 1)/(2x - 2)
    // Nhánh trái: x thuộc [-3.0, 0.8]
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (x + 1) / (2 * x - 2)
      if y >= -3.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    // Nhánh phải: x thuộc [1.2, 4.0]
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (x + 1) / (2 * x - 2)
      if y >= -3.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đường cong trong hình dưới đây là đồ thị của hàm số nào trong các hàm số sau?],
  (
    [$y = (x + 1)/(x - 1)$.],
    [$y = (2x - 4)/(x - 1)$.],
    True([$y = (x + 1)/(2x - 2)$.]),
    [$y = (2x)/(3x - 3)$.]
  ),
  loigiai: []
)


// ─── CÂU 8 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, 0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -4.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1, 0.25), $1$)
    
    // Tiệm cận ngang y = -1
    line((-3.0, -1), (4.0, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0.25, -1.25), $-1$)
    
    // Giao điểm với các trục
    content((2, 0.25), $2$)
    circle((2, 0), radius: 1.5pt, fill: black)
    content((-0.3, -2), $-2$)
    circle((0, -2), radius: 1.5pt, fill: black)
    
    // Đồ thị y = (-x + 2)/(x - 1)
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x + b)/(x + c)$ với $a, b, c in RR$ có đồ thị như hình vẽ bên. Giá trị của $a + 2b + 3c$ bằng],
  (
    [$2$.],
    True([$0$.]),
    [$6$.],
    [$-8$.]
  ),
  loigiai: []
)


// ─── CÂU 9 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -3.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1, -0.25), $1$)
    
    // Tiệm cận ngang y = 1
    line((-3.0, 1), (4.0, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-0.25, 1), $1$)
    
    // Giao điểm
    content((2, 0.25), $2$)
    circle((2, 0), radius: 1.5pt, fill: black)
    content((-0.25, 2), $2$)
    circle((0, 2), radius: 1.5pt, fill: black)
    
    // Đồ thị y = (x - 2)/(x - 1)
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (x - 2) / (x - 1)
      if y >= -3.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (x - 2) / (x - 1)
      if y >= -3.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đường cong ở hình dưới đây là đồ thị của hàm số $y = (x + a)/(b x + c)$, ($a, b, c in ZZ$). Khi đó giá trị biểu thức $T = a - 3b - 2c$ bằng],
  (
    [$3$.],
    [$2$.],
    [$0$.],
    True([$-3$.])
  ),
  loigiai: []
)


// ─── CÂU 10 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, 0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -4.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.2, 0.25), $1$)
    
    // Tiệm cận ngang y = -1
    line((-3.0, -1), (4.0, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0.25, -1.25), $-1$)
    
    // Giao điểm với các trục
    content((2, 0.25), $2$)
    circle((2, 0), radius: 1.5pt, fill: black)
    content((-0.3, -2), $-2$)
    circle((0, -2), radius: 1.5pt, fill: black)
    
    // Đồ thị y = (-x + 2)/(x - 1)
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (-x + 2) / (x - 1)
      if y >= -4.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x - b)/(x - 1)$ có đồ thị như hình vẽ. Khẳng định nào dưới đây là đúng?],
  (
    True([$b < a < 0$.]),
    [$0 < b < a$.],
    [$b < 0 < a$.],
    [$0 < a < b$.]
  ),
  loigiai: []
)


#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: auto)

// ─── CÂU 1 ───
#ds(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.0), (0, 4.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.0), $y$, anchor: "west", padding: 2pt)
    content((-0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -3.0), (1, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1, -0.25), $1$)
    
    // Tiệm cận ngang y = 1
    line((-3.0, 1), (4.0, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-0.25, 1), $1$)
    
    // Giao điểm
    content((2, 0.25), $2$)
    circle((2, 0), radius: 1.5pt, fill: black)
    content((-0.25, 2), $2$)
    circle((0, 2), radius: 1.5pt, fill: black)
    
    // Đồ thị y = (x - 2)/(x - 1)
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = (x - 2) / (x - 1)
      if y >= -3.0 and y <= 4.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (x - 2) / (x - 1)
      if y >= -3.0 and y <= 4.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (x + a)/(b x + c)$ với $a, b, c in ZZ$ có đồ thị như hình vẽ dưới đây:],
  (
    True([Đường tiệm cận đứng $x = 1$]),
    [Đường tiệm cận ngang $y = 0$],
    [Hàm số đồng biến trên $RR$],
    True([$T = a - 3b - 2c = -3$])
  ),
  loigiai: []
)


// ─── CÂU 2 ───
#ds(
  [Cho hàm số $f(x) = (a x - 1)/(b x + c)$ với $a, b, c in RR$ có bảng biến thiên như hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($-oo$, $3$, $+oo$),
        d-signs: ("-", "||", "-"),
        v-vals: ($1/2$, ($-oo$, $+oo$), $1/2$),
        ranks: (1, (-2, 2), 0)
      )
    ]
  ],
  (
    True([Hàm số nghịch biến trên khoảng $(-oo; 1/2)$]),
    [Đồ thị hàm số có tiệm cận đứng $x = 1/2$],
    True([Đồ thị giao với trục hoành tại điểm có hoành độ nhỏ hơn 3]),
    True([$hoac(b > 2/3, b < 0)$])
  ),
  loigiai: []
)


// ─── CÂU 3 ───
#ds(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-4.0, 0), (3.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.0), (0, 5.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.0), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = -1
    line((-1, -2.0), (-1, 5.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-1, -0.35), $-1$)
    
    // Điểm giao Oy (0, 3)
    content((0.25, 3), $3$)
    circle((0, 3), radius: 1.5pt, fill: black)
    
    // Đồ thị y = 3 / (x + 1)^2
    let pts_left = ()
    for i in range(-40, -12) {
      let x = i / 10
      let y = 3 / calc.pow(x + 1, 2)
      if y >= -2.0 and y <= 5.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(-8, 30) {
      let x = i / 10
      let y = 3 / calc.pow(x + 1, 2)
      if y >= -2.0 and y <= 5.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $f(x) = (a x + b)/(c x + d)$ với $a, b, c, d in RR$ có đồ thị hàm số $y = f'(x)$ nhận $x = -1$ làm tiệm cận đứng như hình vẽ bên. Biết rằng giá trị lớn nhất của hàm số $y = f(x)$ trên đoạn $[-3; -2]$ bằng 8.],
  (
    True([$f'(0) = 3$]),
    [Hàm số $y = f(x)$ nghịch biến trên khoảng $(-1; +oo)$],
    [Giá trị của $f(-3)$ bằng 8],
    True([Giá trị của $f(2)$ bằng 4])
  ),
  loigiai: []
)


// ─── CÂU 4 ───
#ds(
  [Cho hàm số $y = (m x - 1)/(2x + m)$ có đồ thị là $(C_m)$ với $m$ là tham số.],
  (
    True([Khi $m = 2$ thì đồ thị hàm số có đường tiệm cận ngang $y = 1$]),
    [Khi $m = 2$ thì giao điểm của các đường tiệm cận có tọa độ $I(1; -1)$],
    True([Đường tiệm cận đứng của đồ thị hàm số đi qua điểm $A(-1; sqrt(2))$ thì $m = 2$]),
    True([Với mọi giá trị của tham số $m$ thì hàm số luôn đồng biến trên mỗi khoảng xác định của nó])
  ),
  loigiai: []
)

#resetcau()


#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: auto)

// ─── CÂU 1 ───
#tln(
  [Cho hàm số $y = ((2m - 1)x - m)/(x + m)$ ($m != 0$) có đồ thị $(C_m)$. Biết rằng tồn tại duy nhất một đường thẳng $(d)$ có phương trình $y = a x + b$ sao cho $(C_m)$ luôn tiếp xúc với $(d)$. Tính giá trị của $a + b$.],
  [$1$],
  loigiai: []
)


// ─── CÂU 2 ───
#tln(
  [Tập tất cả các giá trị thực của tham số $m$ để đường thẳng $d: y = x - 2m$ cắt đồ thị hàm số $y = (x - 3)/(x + 1)$ $(C)$ tại hai điểm phân biệt có hoành độ dương là $(a; b)$. Tính giá trị biểu thức $a + b$.],
  [$2.5$],
  loigiai: []
)


// ─── CÂU 3 ───
#tln(
  [Cho hàm số $y = (x + m)/(x - 1)$ có đồ thị là đường cong $(H)$ và đường thẳng $Delta$ có phương trình $y = x + 1$. Số giá trị nguyên của tham số $m$ nhỏ hơn 10 để đường thẳng $Delta$ cắt đường cong $(H)$ tại hai điểm phân biệt nằm về hai nhánh của đồ thị.],
  [$10$],
  loigiai: []
)


// ─── CÂU 4 ───
#tln(
  [Có bao nhiêu giá trị nguyên dương của $m$ sao cho đường thẳng $y = x + m$ cắt đồ thị hàm số $y = (2x - 1)/(x + 1)$ tại hai điểm phân biệt $A, B$ và $A B <= 4$.],
  [$1$],
  loigiai: []
)


// ─── CÂU 5 ───
#tln(
  [Cho hàm số $y = (x + 2)/(x + 1)$ $(C)$ và đường thẳng $(d): y = x + m$. Có bao nhiêu giá trị nguyên $m$ thuộc khoảng $(-10; 10)$ để đường thẳng $(d)$ cắt đồ thị $(C)$ tại hai điểm về hai phía của trục hoành?],
  [$11$],
  loigiai: []
)


// ─── CÂU 6 ───
#tln(
  [Cho hàm số $y = (x^2 + m x - 1)/(x - 1)$ có đồ thị là $(C)$ ($m$ là tham số thực). Tổng bình phương các giá trị của $m$ để đường thẳng $d: y = m$ cắt đồ thị $(C)$ tại hai điểm $A, B$ sao cho $O A$ vuông góc với $O B$ bằng bao nhiêu?],
  [$3$],
  loigiai: []
)


