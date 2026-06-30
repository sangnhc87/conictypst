#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 02])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: auto)

// ─── CÂU 1 ───
#tn(
  dir: "doc",lines: 0,
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
    loigiai: [
    #step[Dựa vào bảng biến thiên, đồ thị hàm số có tiệm cận đứng $x = 2$ và tiệm cận ngang $y = 2$.]
    #step[Kiểm tra các phương án, chỉ có hàm số $y = (2x+1)/(x-2)$ thỏa mãn cả hai điều kiện trên.]
  ]
)


// ─── CÂU 2 ───
#tn(
  dir: "doc",lines: 2,
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
    loigiai: [
    #step[Từ đồ thị ta thấy tiệm cận ngang $y = a/c = 1 => a = c$.]
    #step[Tiệm cận đứng $x = -d/c = -1 => c = d$. Do đó $a = c = d$.]
    #step[Đồ thị cắt trục tung tại $(0; 2) => b/d = 2 => b = 2d = 2a$.]
    #step[Vì $a, b, c, d$ cùng dấu (do $a=c=d$, $b=2a$), giả sử $a>0$ ta có $b = 2a > a > 0$, suy ra $0 < a < b$.]
  ]
)


// ─── CÂU 3 ───
#tn(
  dir: "doc",lines:0,
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
    loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = 1$ và tiệm cận ngang $y = 1$.]
    #step[Đồ thị đi qua gốc tọa độ $O(0; 0)$.]
    #step[Trong các phương án, chỉ có hàm số $y = x/(x - 1)$ thỏa mãn tất cả các tính chất trên.]
  ]
)


// ─── CÂU 4 ───
#tn(
  dir: "doc",lines:0,
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
    loigiai: [
    #step[Đồ thị có tiệm cận ngang $y = -1 => a/1 = -1 => a = -1$.]
    #step[Đồ thị cắt trục tung tại điểm có tung độ $y = -2 => (-b)/(-1) = -2 => b = -2$.]
    #step[Vậy $b = -2 < a = -1 < 0$.]
  ]
)


// ─── CÂU 5 ───
#tn(
  dir: "doc",lines:0,
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
    loigiai: [
    #step[Bảng biến thiên cho thấy hàm số có tiệm cận đứng $x = -1$, tiệm cận ngang $y = 2$.]
    #step[Đạo hàm $y' > 0$ nên hàm số đồng biến trên từng khoảng xác định. Kiểm tra hàm $y = (2x-1)/(x+1)$ có $y' = 3/(x+1)^2 > 0$, thỏa mãn điều kiện đồng biến.]
  ]
)


// ─── CÂU 6 ───
#tn(
  dir: "doc",lines:0,
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
    loigiai: [
    #step[Đồ thị có tiệm cận ngang $y = -1 => a/1 = -1 => a = -1$.]
    #step[Đồ thị cắt trục tung tại $(0; -2) => (-b)/(-1) = -2 => b = -2$.]
    #step[Vậy tích $a b = (-1) . (-2) = 2$.]
  ]
)


// ─── CÂU 7 ───
#tn(
  dir: "doc",lines:0,
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
    loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = 1$ và tiệm cận ngang $y = 1/2$.]
    #step[Đồ thị cắt $O y$ tại điểm có tung độ âm (nằm dưới trục hoành). Kiểm tra hàm số $y = (x+1)/(2x-2)$, ta thấy tiệm cận đứng $x = 1$, tiệm cận ngang $y = 1/2$ và giao $O y$ tại $y = -1/2 < 0$.]
  ]
)


// ─── CÂU 8 ───
#tn(
  dir: "doc",lines: 0,
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
    loigiai: [
    #step[Tiệm cận đứng $x = -c = 1 => c = -1$.]
    #step[Tiệm cận ngang $y = a/1 = -1 => a = -1$.]
    #step[Giao với trục tung tại $(0; -2) => b/c = -2 => b/(-1) = -2 => b = 2$.]
    #step[Vậy $a + 2b + 3c = (-1) + 2(2) + 3(-1) = 0$.]
  ]
)


// ─── CÂU 9 ───
#tn(
  dir: "doc",lines: 0,
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
    loigiai: [
    #step[Tiệm cận ngang $y = 1/b = 1 => b = 1$.]
    #step[Tiệm cận đứng $x = -c/b = 1 => c = -b = -1$.]
    #step[Giao với trục hoành tại $(2; 0) => x + a = 0 => 2 + a = 0 => a = -2$.]
    #step[Vậy $T = a - 3b - 2c = -2 - 3(1) - 2(-1) = -3$.]
  ]
)


// ─── CÂU 10 ───
#tn(
  dir: "doc",lines: 0,
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
    loigiai: [
    #step[Đồ thị có tiệm cận ngang $y = -1 => a/1 = -1 => a = -1$.]
    #step[Đồ thị cắt trục tung tại $(0; -2) => (-b)/(-1) = -2 => b = -2$.]
    #step[Vậy $b = -2 < a = -1 < 0$.]
  ]
)


#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: auto)

// ─── CÂU 1 ───
#ds(
  dir: "doc",lines: 2,
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
    loigiai: [
    #step[Từ đồ thị, ta có tiệm cận ngang $y = 1/b = 1 => b = 1$.]
    #step[Tiệm cận đứng $x = -c/b = 1 => c = -b = -1$.]
    #step[Giao với trục hoành tại $(2; 0) => 2 + a = 0 => a = -2$. Vậy hàm số là $y = (x - 2)/(x - 1)$.]
    #step[a) Đồ thị có tiệm cận đứng $x = 1$. (Đúng)]
    #step[b) Đồ thị có tiệm cận ngang $y = 1$. Phát biểu TCN $y=0$ là sai. (Sai)]
    #step[c) Hàm số có tập xác định $D = RR \ {1}$ và $y' = 1/(x-1)^2 > 0$ nên đồng biến trên từng khoảng xác định. Không thể kết luận đồng biến trên $RR$. (Sai)]
    #step[d) $T = a - 3b - 2c = -2 - 3(1) - 2(-1) = -3$. (Đúng)]
  ]
)


// ─── CÂU 2 ───
#ds(
  dir: "doc",lines:2,
  [Cho hàm số $f(x) = (a x - 1)/(b x + c)$ với $a, b, c in RR$ có bảng biến thiên như hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($-oo$, $3$, $+oo$),
        d-signs: ("-", "||", "-"),
        v-vals: ($1/2$, ($-oo$, $+oo$), $1/2$),
        w1: 1.5, // Tăng độ rộng cột đầu tiên
        w2: 10, // Tăng độ rộng chiều ngang của BBT
        // ranks: (1, (-2, 2), 0)
      )
    ]
  ],
  (
    True([Hàm số nghịch biến trên khoảng $(-oo; 1/2)$]),
    [Đồ thị hàm số có tiệm cận đứng $x = 1/2$],
    True([Đồ thị giao với trục hoành tại điểm có hoành độ nhỏ hơn 3]),
    True([$hoac(b > 2/3, b < 0)$])
  ),
    loigiai: [
    #step[Bảng biến thiên cho thấy hàm số có tiệm cận đứng $x = 3 => -c/b = 3 => c = -3b$.]
    #step[Tiệm cận ngang $y = a/b = 1/2 => a = b/2$.]
    #step[Hàm số nghịch biến $=> f'(x) < 0 => (a c - (-b))/(b x+c)^2 < 0 => a c + b < 0 => (b/2)(-3b) + b < 0 => -3/2 b^2 + b < 0 => b < 0$ hoặc $b > 2/3$.]
    #step[a) Do $1/2 < 3$ nên khoảng $(-oo; 1/2)$ nằm hoàn toàn trong khoảng $(-oo; 3)$, hàm số nghịch biến trên khoảng này. (Đúng)]
    #step[b) Tiệm cận đứng của đồ thị là $x = 3$. (Sai)]
    #step[c) Đồ thị giao $O x$ tại $x = 1/a = 2/b$. Nếu $b < 0$ thì $2/b < 0 < 3$. Nếu $b > 2/3$ thì $2/b < 3$. Vậy hoành độ giao điểm luôn nhỏ hơn 3. (Đúng)]
    #step[d) Điều kiện nghịch biến cho ta $b < 0$ hoặc $b > 2/3$. (Đúng)]
  ]
)


// ─── CÂU 3 ───
#ds(
  dir: "doc",lines: 4,
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
    loigiai: [
    #step[Đạo hàm $f'(x) = (a d - b c)/(c x + d)^2$. Từ đồ thị $f'(x) = 3/(x+1)^2$, suy ra $c = 1, d = 1$ và $a d - b c = a - b = 3$.]
    #step[Suy ra $f(x) = (a x + b)/(x + 1)$. Do $f'(x) > 0$ nên $f(x)$ đồng biến trên từng khoảng xác định.]
    #step[Trên đoạn $[-3; -2]$, hàm số đồng biến nên đạt GTLN tại $x = -2$. Suy ra $f(-2) = 8 => (-2a + b)/(-1) = 8 => 2a - b = 8$. Giải hệ tìm được $a = 5, b = 2$.]
    #step[Vậy $f(x) = (5x + 2)/(x + 1)$.]
    #step[a) $f'(0) = 3/(0+1)^2 = 3$. (Đúng)]
    #step[b) Hàm số $y = f(x)$ đồng biến (do $f'(x) > 0$). (Sai)]
    #step[c) $f(-3) = (5(-3)+2)/(-3+1) = (-13)/(-2) = 13/2 = 6.5$. (Sai)]
    #step[d) $f(2) = (10+2)/(2+1) = 4$. (Đúng)]
  ]
)


// ─── CÂU 4 ───
#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = (m x - 1)/(2x + m)$ có đồ thị là $(C_m)$ với $m$ là tham số.],
  (
    True([Khi $m = 2$ thì đồ thị hàm số có đường tiệm cận ngang $y = 1$]),
    [Khi $m = 2$ thì giao điểm của các đường tiệm cận có tọa độ $I(1; -1)$],
    True([Đường tiệm cận đứng của đồ thị hàm số đi qua điểm $A(-1; sqrt(2))$ thì $m = 2$]),
    True([Với mọi giá trị của tham số $m$ thì hàm số luôn đồng biến trên mỗi khoảng xác định của nó])
  ),
    loigiai: [
    #step[a) Khi $m = 2$, hàm số là $y = (2x - 1)/(2x + 2)$. Tiệm cận ngang là $y = 2/2 = 1$. (Đúng)]
    #step[b) Khi $m = 2$, TCĐ $x = -1$, TCN $y = 1$ nên tâm đối xứng $I(-1; 1)$. (Sai)]
    #step[c) TCĐ $x = -m/2$. Đi qua điểm $A(-1; sqrt(2))$ nghĩa là hoành độ $x = -1 => -m/2 = -1 => m = 2$. (Đúng)]
    #step[d) Đạo hàm $y' = (m^2 + 2)/(2x + m)^2 > 0, forall x != -m/2$. Nên hàm số luôn đồng biến trên mỗi khoảng xác định. (Đúng)]
  ]
)

#resetcau()


#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: auto)

// ─── CÂU 1 ───
#tln(
  dir: "doc",
  [Cho hàm số $y = ((2m - 1)x - m)/(x + m)$ ($m != 0$) có đồ thị $(C_m)$. Biết rằng tồn tại duy nhất một đường thẳng $(d)$ có phương trình $y = a x + b$ sao cho $(C_m)$ luôn tiếp xúc với $(d)$. Tính giá trị của $a + b$.],
  [$1$],
    loigiai: [
    #step[Xét phương trình hoành độ giao điểm: $((2m - 1)x - m)/(x + m) = a x + b$.]
    #step[Quy đồng (với $x != -m$), ta được: $a x^2 + (a m + b - 2m + 1)x + b m + m = 0$.]
    #step[Để đồ thị luôn tiếp xúc đường thẳng $d$ với mọi $m != 0$, phương trình phải có nghiệm kép $forall m => Delta = 0 forall m$.]
    #step[$Delta = (m(a - 2) + b + 1)^2 - 4a m(b + 1) = 0 => m^2(a - 2)^2 + 2m(a - 2)(b + 1) + (b + 1)^2 - 4a m(b + 1) = 0$.]
    #step[Hệ số của $m^2$ phải bằng $0 => (a - 2)^2 = 0 => a = 2$. Thay $a=2$ vào ta được hệ số tự do $(b + 1)^2 = 0 => b = -1$. Lúc này hệ số của $m$ là $0$, thỏa mãn với mọi $m$.]
    #step[Vậy $a = 2, b = -1 => a + b = 1$.]
  ]
)


// ─── CÂU 2 ───
#tln(
  dir: "doc",
  [Tập tất cả các giá trị thực của tham số $m$ để đường thẳng $d: y = x - 2m$ cắt đồ thị hàm số $y = (x - 3)/(x + 1)$ $(C)$ tại hai điểm phân biệt có hoành độ dương là $(a; b)$. Tính giá trị biểu thức $a + b$.],
  [$2.5$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x - 3)/(x + 1) = x - 2m => x - 3 = x^2 + (1 - 2m)x - 2m => x^2 - 2m x - 2m + 3 = 0$.]
    #step[Để cắt tại 2 điểm phân biệt có hoành độ dương, phương trình phải có 2 nghiệm dương phân biệt.]
    #step[Điều kiện: $Delta' = m^2 - (-2m + 3) = m^2 + 2m - 3 > 0 => m > 1$ hoặc $m < -3$.]
    #step[Tổng $S = 2m > 0 => m > 0$. Tích $P = -2m + 3 > 0 => m < 3/2$.]
    #step[Kết hợp điều kiện, ta có $1 < m < 1.5$. Vậy khoảng $(a; b) = (1; 1.5) => a + b = 1 + 1.5 = 2.5$.]
  ]
)


// ─── CÂU 3 ───
#tln(
  dir: "doc",
  [Cho hàm số $y = (x + m)/(x - 1)$ có đồ thị là đường cong $(H)$ và đường thẳng $Delta$ có phương trình $y = x + 1$. Số giá trị nguyên của tham số $m$ nhỏ hơn 10 để đường thẳng $Delta$ cắt đường cong $(H)$ tại hai điểm phân biệt nằm về hai nhánh của đồ thị.],
  [$10$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x + m)/(x - 1) = x + 1 => x + m = x^2 - 1 => x^2 - x - (m + 1) = 0$.]
    #step[Để đường thẳng cắt đồ thị tại 2 điểm phân biệt nằm về hai nhánh, phương trình phải có 2 nghiệm $x_1, x_2$ thỏa mãn $x_1 < 1 < x_2$.]
    #step[Điều kiện là $1 dot f(1) < 0 => 1^2 - 1 - (m + 1) < 0 => -(m + 1) < 0 => m > -1$.]
    #step[Các giá trị nguyên $m < 10$ là $m \in \{0, 1, 2, ..., 9\}$. Có tất cả 10 giá trị.]
  ]
)


// ─── CÂU 4 ───
#tln(
  dir: "doc",
  [Có bao nhiêu giá trị nguyên dương của $m$ sao cho đường thẳng $y = x + m$ cắt đồ thị hàm số $y = (2x - 1)/(x + 1)$ tại hai điểm phân biệt $A, B$ và $A B <= 4$.],
  [$1$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(2x - 1)/(x + 1) = x + m => 2x - 1 = x^2 + (m + 1)x + m => x^2 + (m - 1)x + m + 1 = 0$.]
    #step[Điều kiện 2 điểm phân biệt: $Delta = (m - 1)^2 - 4(m + 1) = m^2 - 6m - 3 > 0$.]
    #step[Ta có $A B^2 = (x_2 - x_1)^2 + (y_2 - y_1)^2 = 2(x_2 - x_1)^2 \le 16 => (x_1 + x_2)^2 - 4x_1 x_2 \le 8$.]
    #step[$=> (m - 1)^2 - 4(m + 1) \le 8 => m^2 - 6m - 11 \le 0 => 3 - sqrt{20} \le m \le 3 + sqrt{20}$.]
    #step[Kết hợp $Delta > 0$, ta lấy được giá trị nguyên dương $m = 7$. Vậy có $1$ giá trị.]
  ]
)


// ─── CÂU 5 ───
#tln(
  dir: "doc",
  [Cho hàm số $y = (x + 2)/(x + 1)$ $(C)$ và đường thẳng $(d): y = x + m$. Có bao nhiêu giá trị nguyên $m$ thuộc khoảng $(-10; 10)$ để đường thẳng $(d)$ cắt đồ thị $(C)$ tại hai điểm về hai phía của trục hoành?],
  [$11$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x + 2)/(x + 1) = x + m => x + 2 = x^2 + (m + 1)x + m => x^2 + m x + m - 2 = 0$.]
    #step[Phương trình luôn có $Delta = m^2 - 4(m - 2) = m^2 - 4m + 8 > 0$ nên luôn cắt tại 2 điểm phân biệt.]
    #step[Tung độ $y_1 = x_1 + m, y_2 = x_2 + m$. Hai điểm nằm về 2 phía trục hoành $=> y_1 y_2 < 0 => (x_1 + m)(x_2 + m) < 0$.]
    #step[$=> x_1 x_2 + m(x_1 + x_2) + m^2 < 0 => (m - 2) + m(-m) + m^2 < 0 => m < 2$.]
    #step[Các giá trị nguyên $m \in (-10; 10)$ là $\{-9, -8, ..., 1\}$. Có tất cả 11 giá trị.]
  ]
)


// ─── CÂU 6 ───
#tln(
  dir: "doc",
  [Cho hàm số $y = (x^2 + m x - 1)/(x - 1)$ có đồ thị là $(C)$ ($m$ là tham số thực). Tổng bình phương các giá trị của $m$ để đường thẳng $d: y = m$ cắt đồ thị $(C)$ tại hai điểm $A, B$ sao cho $O A$ vuông góc với $O B$ bằng bao nhiêu?],
  [$3$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x^2 + m x - 1)/(x - 1) = m => x^2 + m x - 1 = m x - m => x^2 = 1 - m$.]
    #step[Để cắt tại 2 điểm phân biệt, phương trình phải có 2 nghiệm $x != 1 => 1 - m > 0$ và $1 - m != 1 => m < 1, m != 0$.]
    #step[Tọa độ $A(sqrt(1 - m); m)$ và $B(-sqrt(1 - m); m)$. Tam giác $O A B$ vuông tại $O => arrow(O A) dot arrow(O B) = 0$.]
    #step[$=> x_A x_B + y_A y_B = 0 => -(1 - m) + m^2 = 0 => m^2 + m - 1 = 0$.]
    #step[Cả hai nghiệm của phương trình đều thỏa điều kiện. Tổng bình phương $m_1^2 + m_2^2 = (m_1 + m_2)^2 - 2m_1 m_2 = (-1)^2 - 2(-1) = 3$.]
  ]
)


