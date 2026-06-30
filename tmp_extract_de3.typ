#import "../preamble.typ": *
#show math.frac: math.display

#muc([Đề Luyện Tập Số 03])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: auto)

// ─── CÂU 1 ───
#tn(
  [Bảng biến thiên sau là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-10$, $-4$, $2$, $+oo$),
        d-signs: ("-", "0", "+", "||", "+", "0", "-"),
        v-vals: ($+oo$, $24$, ($+oo$, $-oo$), $0$, $-oo$),
        // ranks: (1, 0, (1, -3), -2, -3)
      )
    ]
  ],
  (
    [$y = (x^2 - 3x + 4)/(-x - 4)$],
    True([$y = (x^2 - 4x + 4)/(-x - 4)$]),
    [$y = (x^2 - 5x + 4)/(x + 4)$],
    [$y = (x^2 - 4x + 4)/(x + 4)$]
  ),
  loigiai: []
)


// ─── CÂU 2 ───
#tn(
  [Bảng biến thiên sau là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $1$, $3$, $5$, $+oo$),
        d-signs: ("-", "0", "+", "||", "+", "0", "-"),
        v-vals: ($+oo$, $-1$, ($+oo$, $-oo$), $-9$, $-oo$),
        // ranks: (1, 0, (1, -3), -2, -3)
      )
    ]
  ],
  (
    [$y = (x^2 - 4x + 3)/(x - 3)$],
    [$y = (-x^2 - x + 2)/(x - 3)$],
    True([$y = (-x^2 + x + 2)/(x - 3)$]),
    [$y = (x^2 - 4x + 4)/(-x + 3)$]
  ),
  loigiai: []
)


// ─── CÂU 3 ───
#tn(
  [Bảng biến thiên sau là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-9$, $-4$, $1$, $+oo$),
        d-signs: ("+", "0", "-", "||", "-", "0", "+"),
        v-vals: ($-oo$, $-20$, ($-oo$, $+oo$), $0$, $+oo$),
        // ranks: (-3, -2, (-3, 1), 0, 1)
      )
    ]
  ],
  (
    True([$y = (x^2 - 2x + 1)/(x + 4)$]),
    [$y = (x^2 - 4x + 2)/(x + 4)$],
    [$y = (x^2 - x + 2)/(-x - 4)$],
    [$y = (x^2 - 3x + 4)/(-x - 4)$]
  ),
  loigiai: []
)


// ─── CÂU 4 ───
#tn(
  [Bảng biến thiên sau là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $2$, $+oo$),
        d-signs: ("+", "||", "+"),
        v-vals: ($-oo$, ($+oo$, $-oo$), $+oo$),
        ranks: (-2, (2, -2), 2)
      )
    ]
  ],
  (
    [$y = (x^2 - 3)/(x - 2)$],
    True([$y = (x^2 - 4x + 2)/(x - 2)$]),
    [$y = (x^2 - x)/(x - 2)$],
    [$y = (x^2 - 4x + 5)/(x - 2)$]
  ),
  loigiai: []
)


// ─── CÂU 5 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.7cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-4.0, 0), (6.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((6.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.5), (0, 5.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.5), $y$, anchor: "west", padding: 2pt)
    content((-0.25, -0.25), $O$)
    
    // Tiệm cận đứng x = 2
    line((2, -4.5), (2, 5.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((2.2, 5.0), $x = 2$, anchor: "west")
    content((2.25, -0.35), $2$)
    
    // Tiệm cận xiên y = x - 2
    line((-2.0, -4.0), (6.0, 4.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0.35, -2.25), $-2$)
    
    // Điểm cực trị và nét đứt
    // Cực tiểu (3, 2)
    line((3, 0), (3, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 2), (3, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((3, -0.35), $3$)
    content((-0.3, 2), $2$)
    circle((3, 2), radius: 1.5pt, fill: black)
    
    // Cực đại (1, -2)
    line((1, 0), (1, -2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, -2), (1, -2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1, 0.35), $1$)
    circle((1, -2), radius: 1.5pt, fill: black)
    
    // Một số giá trị trên trục
    content((-0.35, 5), $5$)
    content((-0.35, 4), $4$)
    content((-0.35, 3), $3$)
    content((-0.35, 1), $1$)
    content((-0.3, -1), $-1$)
    content((-0.3, -2), $-2$)
    content((-0.3, -3), $-3$)
    content((-2.1, 0.3), $-2$)
    content((-3.1, 0.3), $-3$)
    content((4, -0.35), $4$)
    
    // Vẽ đồ thị
    let pts_left = ()
    for i in range(-35, 19) {
      let x = i / 10
      let y = (x * x - 4 * x + 5) / (x - 2)
      if y >= -4.5 and y <= 5.5 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(22, 55) {
      let x = i / 10
      let y = (x * x - 4 * x + 5) / (x - 2)
      if y >= -4.5 and y <= 5.5 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị dưới đây là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?],
  (
    [$y = (x^2 - 3)/(x - 2)$],
    [$y = (x^2 - 4x + 2)/(x - 2)$],
    [$y = (x^2 - x)/(x - 2)$],
    True([$y = (x^2 - 4x + 5)/(x - 2)$])
  ),
  loigiai: []
)


// ─── CÂU 6 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.7cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-5.0, 0), (3.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.0), (0, 5.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.0), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.25), $O$)
    
    // Tiệm cận đứng x = -1
    line((-1, -3.0), (-1, 5.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-1.25, 4.5), $x = -1$, anchor: "east")
    content((-1.25, -0.35), $-1$)
    
    // Điểm cực đại (-2, 4) và nét đứt
    line((-2, 0), (-2, 4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 4), (-2, 4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((-2, 0.35), $-2$)
    content((0.25, 4), $4$)
    circle((-2, 4), radius: 1.5pt, fill: black)
    
    // Một số giá trị trên trục
    content((0.25, 2), $2$)
    content((0.25, -2), $-2$)
    content((2, -0.35), $2$)
    
    // Vẽ đồ thị y = -x^2/(x+1)
    let pts_left = ()
    for i in range(-50, -12) {
      let x = i / 10
      let y = (-x * x) / (x + 1)
      if y >= -3.0 and y <= 5.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(-8, 30) {
      let x = i / 10
      let y = (-x * x) / (x + 1)
      if y >= -3.0 and y <= 5.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị dưới đây là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?],
  (
    [$y = (x^2 - x)/(x + 1)$],
    [$y = (x^2 - 3x)/(x + 1)$],
    [$y = (x^2 + x + 2)/(x + 1)$],
    True([$y = (-x^2)/(x + 1)$])
  ),
  loigiai: []
)


// ─── CÂU 7 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.7cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-5.0, 0), (5.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((5.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -6.0), (0, 6.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 6.0), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.25), $O$)
    
    // Tiệm cận đứng x = -1
    line((-1, -6.0), (-1, 6.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Điểm giao Oy (0, 2)
    content((-0.3, 2.2), $2$)
    circle((0, 2), radius: 1.5pt, fill: black)
    
    // Giao điểm Ox
    content((1, 0.35), $1$)
    circle((1, 0), radius: 1.5pt, fill: black)
    content((-2, 0.35), $-2$)
    circle((-2, 0), radius: 1.5pt, fill: black)
    
    // Nét đứt cho (3, -2.5)
    line((3, 0), (3, -2.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, -2.5), (3, -2.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((3, 0.35), $3$)
    content((-0.45, -2.5), $-5/2$)
    circle((3, -2.5), radius: 1.5pt, fill: black)
    
    // Vẽ đồ thị y = (-x^2 - x + 2)/(x+1)
    let pts_left = ()
    for i in range(-50, -12) {
      let x = i / 10
      let y = (-x * x - x + 2) / (x + 1)
      if y >= -6.0 and y <= 6.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(-8, 50) {
      let x = i / 10
      let y = (-x * x - x + 2) / (x + 1)
      if y >= -6.0 and y <= 6.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị dưới đây là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?],
  (
    [$y = (x^2 - x + 4)/(x + 1)$],
    [$y = (x^2 - 2x + 3)/(x + 1)$],
    True([$y = (-x^2 - x + 2)/(x + 1)$]),
    [$y = (x^2 + x - 1)/(x + 1)$]
  ),
  loigiai: []
)


// ─── CÂU 8 ───
#tn(
  dir: "doc",
  fig: canvas(length: 0.7cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-5.0, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -6.0), (0, 5.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.0), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.25), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -6.0), (1, 5.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.2, 4.5), $x = 1$, anchor: "west")
    content((1.2, -0.35), $1$)
    
    // Tiệm cận xiên y = x + 2
    line((-5.0, -3.0), (3.0, 5.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((2.5, 4.8), $y = x + 2$, anchor: "south-east")
    
    // Giao điểm tiệm cận xiên với các trục
    content((-2.2, -0.35), $-2$)
    content((-0.25, 2.2), $2$)
    
    // Vẽ đồ thị y = (x^2 + x - 3)/(x - 1)
    let pts_left = ()
    for i in range(-50, 8) {
      let x = i / 10
      let y = (x * x + x - 3) / (x - 1)
      if y >= -6.0 and y <= 5.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 40) {
      let x = i / 10
      let y = (x * x + x - 3) / (x - 1)
      if y >= -6.0 and y <= 5.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị dưới đây là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?],
  (
    [$y = (x^2 + 3)/(x - 1)$],
    True([$y = (x^2 + x - 3)/(x - 1)$]),
    [$y = (x^2 - 2x + 3)/(-x + 1)$],
    [$y = (x^2 + 3)/(-x + 1)$]
  ),
  loigiai: []
)


// ─── CÂU 9 ───
#tn(
  [Hàm số nào dưới đây có bảng biến thiên với hai điểm cực trị?],
  (
    [$y = x^4 - 4x^2 + 1$],
    True([$y = (x^2 - 2x + 2)/(x - 1)$]),
    [$y = x^3 - 3x + 1$],
    [$y = 2x^4 + 2x^2 - 3$]
  ),
  loigiai: []
)


// ─── CÂU 10 ───
#tn(
  [Cho hàm số $y = (x^2 + m x + 1)/(x - 1)$ ($m$ là tham số thực). Để đồ thị hàm số có hai điểm cực trị, điều kiện của $m$ là:],
  (
    [$m > -4$],
    [$m < 4$],
    True([$m < -2$ hoặc $m > 2$]),
    [$m != plus.minus 2$]
  ),
  loigiai: []
)


#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: auto)

// ─── CÂU 1 ───
#ds(
  [Cho hàm số $y = (x^2 + 4x + 5)/(x + 2)$ có đồ thị $(C)$. Khi đó:],
  (
    [Hàm số có tập xác định $D = RR$],
    True([Đồ thị hàm số $(C)$ có tiệm cận xiên là đường thẳng $y = x + 2$]),
    True([Đồ thị hàm số $(C)$ có tiệm cận đứng là đường thẳng $x = -2$]),
    True([Đồ thị hàm số $(C)$ nhận điểm $I(-2; 0)$ làm tâm đối xứng])
  ),
  loigiai: []
)


// ─── CÂU 2 ───
#ds(
  [Cho hàm số $y = (2x^2 - 2x + 2)/(-x + 1)$ có đồ thị $(C)$.],
  (
    [Hàm số nghịch biến trên khoảng $(-oo, 0) union (2, +oo)$],
    [Hàm số đạt cực tiểu tại $x = 2$],
    [Giá trị nhỏ nhất của hàm số trên đoạn $[3/2; 5/2]$ bằng $-19/3$],
    True([Đồ thị hàm số $(C)$ có tiệm cận xiên là đường thẳng $2x + y = 0$])
  ),
  loigiai: []
)


// ─── CÂU 3 ───
#ds(
  [Cho hàm số $y = (-x^2 + x + 1)/(x + 1)$ có đồ thị $(C)$.],
  (
    True([Hàm số đồng biến trên mỗi khoảng $(-2, -1)$ và $(-1, 0)$]),
    True([Hàm số có hai điểm cực trị]),
    [Đồ thị $(C)$ không cắt trục $O x$],
    [Đồ thị $(C)$ có tiệm cận xiên đi qua điểm $A(1; 2)$]
  ),
  loigiai: []
)


// ─── CÂU 4 ───
#ds(
  [Cho hàm số $y = (-x^2 - 3x + 4)/(x - 3)$ có đồ thị là $(C)$.],
  (
    True([Đồ thị $(C)$ có tiệm cận xiên là $y = -x - 6$]),
    True([Đồ thị $(C)$ nhận giao điểm $I(3; -9)$ làm tâm đối xứng]),
    True([Đồ thị $(C)$ có hai điểm cực trị nằm $2$ phía đối với $O y$]),
    [Đồ thị không cắt trục $O x$]
  ),
  loigiai: []
)


#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: auto)

// ─── CÂU 1 ───
#tln(
  [Trên đồ thị $(C): y = (x^2 - 3x + 6)/(x - 2)$ có bao nhiêu cặp điểm đối xứng nhau qua điểm $I(1/2; 1)$?],
  [$1$],
  loigiai: []
)


// ─── CÂU 2 ───
#tln(
  [Tìm được trên đồ thị $(C): y = (x^2 + 4x + 5)/(x + 2)$ hai điểm $M(a; b)$ và $N(c; d)$ có khoảng cách đến đường thẳng $3x + y + 6 = 0$ nhỏ nhất. Khi đó tính giá trị biểu thức $T = a + b + c + d$.],
  [$-4$],
  loigiai: []
)


// ─── CÂU 3 ───
#tln(
  [Biết rằng đường thẳng $y = 2x + 2m$ luôn cắt đồ thị hàm số $y = (x^2 + 3)/(x + 1)$ tại hai điểm phân biệt $A, B$ với mọi giá trị của tham số $m$. Tìm hoành độ trung điểm của $A B$.],
  [$-m - 1$],
  loigiai: []
)


// ─── CÂU 4 ───
#tln(
  dir: "doc",
  fig: canvas(length: 0.7cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.0, 0), (5.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((5.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.0), (0, 7.0), mark: (end: ">"), stroke: 0.5pt)
    content((0, 7.0), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    // Tiệm cận đứng x = 1
    line((1, -2.0), (1, 7.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.2, 6.5), $x = 1$, anchor: "west")
    
    // Tiệm cận xiên y = x + 1
    line((-3.0, -2.0), (5.0, 6.0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Các điểm đặc biệt
    content((0.2, 1.2), $1$)
    content((-0.2, 2.0), $2$)
    
    // Vẽ đồ thị y = x + 1 + 1/(x-1)
    let pts_left = ()
    for i in range(-30, 8) {
      let x = i / 10
      let y = x + 1 + 1 / (x - 1)
      if y >= -2.0 and y <= 7.0 {
        pts_left.push((x, y))
      }
    }
    line(..pts_left, stroke: 1.2pt + blue)
    
    let pts_right = ()
    for i in range(12, 50) {
      let x = i / 10
      let y = x + 1 + 1 / (x - 1)
      if y >= -2.0 and y <= 7.0 {
        pts_right.push((x, y))
      }
    }
    line(..pts_right, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị trong hình bên dưới là của hàm số $y = a x + b + 1/(x + c)$. Khi đó tổng $a + b + c$ bằng bao nhiêu?],
  [$1$],
  loigiai: []
)


// ─── CÂU 5 ───
#tln(
  [Cho hàm số $y = (x^2 + m x + m^2 - 2m - 4)/(x - 2)$ (1). Tìm $m$ để đồ thị hàm số đã cho có hai điểm cực trị và hai điểm cực trị cách đều đường thẳng $Delta: 2x + y + 1 = 0$.],
  [$-9$],
  loigiai: []
)


// ─── CÂU 6 ───
#tln(
  [Tìm $m$ để đường thẳng $y = -2x + m$ cắt đồ thị hàm số $y = (x^2 + x - 1)/x$ tại hai điểm $A, B$ sao cho trung điểm đoạn $A B$ thuộc $O y$.],
  [$1$],
  loigiai: []
)


