#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 03])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: auto)

// ─── CÂU 1 ───
#tn(
  dir: "doc",lines: 0,
  [Bảng biến thiên sau là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-10$, $-4$, $2$, $+oo$),
        d-signs: ("-", "0", "+", "||", "+", "0", "-"),
        v-vals: ($+oo$, $24$, ($+oo$, $-oo$), $0$, $-oo$),
        w2:10,
        w1:1.25
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
    loigiai: [
    #step[Dựa vào bảng biến thiên, đồ thị có tiệm cận đứng $x = -4$.]
    #step[Tại $x = 2$, $y = 0$ và tại $x = -10$, $y = 24$.]
    #step[Thử với hàm số $y = (x^2 - 4x + 4)/(-x - 4)$, ta thấy thỏa mãn tiệm cận đứng và tọa độ cực đại cực tiểu.]
  ]
)


// ─── CÂU 2 ───
#tn(
  dir: "doc",lines: 0,
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
        w2:10,
        w1:1.25
      )
    ]
  ],
  (
    [$y = (x^2 - 4x + 3)/(x - 3)$],
    [$y = (-x^2 - x + 2)/(x - 3)$],
    True([$y = (-x^2 + x + 2)/(x - 3)$]),
    [$y = (x^2 - 4x + 4)/(-x + 3)$]
  ),
    loigiai: [
    #step[Dựa vào bảng biến thiên, đồ thị có tiệm cận đứng $x = 3$.]
    #step[Tại $x = 1$, $y = -1$ và tại $x = 5$, $y = -9$.]
    #step[Thử với hàm số $y = (-x^2 + x + 2)/(x - 3)$, ta thấy thỏa mãn các điều kiện trên.]
  ]
)


// ─── CÂU 3 ───
#tn(
  dir: "doc",lines:0,
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
        w2:10,
        w1:1.25
      )
    ]
  ],
  (
    True([$y = (x^2 - 2x + 1)/(x + 4)$]),
    [$y = (x^2 - 4x + 2)/(x + 4)$],
    [$y = (x^2 - x + 2)/(-x - 4)$],
    [$y = (x^2 - 3x + 4)/(-x - 4)$]
  ),
    loigiai: [
    #step[Dựa vào bảng biến thiên, đồ thị có tiệm cận đứng $x = -4$.]
    #step[Đồ thị có điểm cực tiểu tại $x = 1, y = 0$ và cực đại tại $x = -9, y = -20$.]
    #step[Hàm số $y = (x^2 - 2x + 1)/(x + 4)$ thỏa mãn các tính chất trên.]
  ]
)


// ─── CÂU 4 ───
#tn(
  dir: "doc",lines:0,
  [Bảng biến thiên sau là của một trong bốn hàm số sau. Hỏi hàm số đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $2$, $+oo$),
        d-signs: ("+", "||", "+"),
        v-vals: ($-oo$, ($+oo$, $-oo$), $+oo$),
        // ranks: (-2, (2, -2), 2)
        w2:10,
        w1:1.25
      )
    ]
  ],
  (
    [$y = (x^2 - 3)/(x - 2)$],
    True([$y = (x^2 - 4x + 2)/(x - 2)$]),
    [$y = (x^2 - x)/(x - 2)$],
    [$y = (x^2 - 4x + 5)/(x - 2)$]
  ),
    loigiai: [
    #step[Bảng biến thiên cho thấy hàm số luôn đồng biến trên các khoảng xác định và có tiệm cận đứng $x = 2$.]
    #step[Hàm số $y = (x^2 - 4x + 2)/(x - 2)$ có $y' = (x^2 - 4x + 6)/(x - 2)^2 > 0, forall x != 2$, thỏa mãn điều kiện.]
  ]
)


// ─── CÂU 5 ───
#tn(
  dir: "doc",lines:0,
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
    loigiai: [
    #step[Từ đồ thị, hàm số có tiệm cận đứng là $x = 2$.]
    #step[Nhánh đồ thị cho thấy hàm số có đường tiệm cận xiên đi lên.]
    #step[Kiểm tra các hàm số, chỉ có $y = (x^2 - 4x + 5)/(x - 2)$ phù hợp với hình dáng đồ thị.]
  ]
)


// ─── CÂU 6 ───
#tn(
  dir: "doc",lines:0,
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
    loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = -1$.]
    #step[Giao với hệ trục tại gốc tọa độ $O(0; 0)$.]
    #step[Hàm số $y = -x^2/(x + 1)$ thỏa mãn điều kiện này.]
  ]
)


// ─── CÂU 7 ───
#tn(
  dir: "doc",lines:0,
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
    loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = -1$.]
    #step[Giao với trục tung tại điểm có tung độ bằng $2$.]
    #step[Hàm số $y = (-x^2 - x + 2)/(x + 1)$ cho giá trị $y(0) = 2$ và tiệm cận đứng $x = -1$, thỏa mãn.]
  ]
)


// ─── CÂU 8 ───
#tn(
  dir: "doc",lines:0,
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
    loigiai: [
    #step[Đồ thị hàm số có tiệm cận đứng $x = 1$.]
    #step[Kiểm tra tọa độ một số điểm và đường tiệm cận xiên.]
    #step[Hàm số $y = (x^2 + x - 3)/(x - 1)$ phù hợp với hình dạng đồ thị.]
  ]
)


// ─── CÂU 9 ───
#tn(
  dir: "doc",
  [Hàm số nào dưới đây có bảng biến thiên với hai điểm cực trị?],
  (
    [$y = x^4 - 4x^2 + 1$],
    True([$y = (x^2 - 2x + 2)/(x - 1)$]),
    [$y = x^3 - 3x + 1$],
    [$y = 2x^4 + 2x^2 - 3$]
  ),
    loigiai: [
    #step[Kiểm tra các đường tiệm cận và điểm cực trị trên đồ thị.]
    #step[Hàm số thỏa mãn tất cả các tính chất của đồ thị là hàm đúng.]
  ]
)


// ─── CÂU 10 ───
#tn(
  dir: "doc",
  [Cho hàm số $y = (x^2 + m x + 1)/(x - 1)$ ($m$ là tham số thực). Để đồ thị hàm số có hai điểm cực trị, điều kiện của $m$ là:],
  (
    [$m > -4$],
    [$m < 4$],
    True([$m < -2$ hoặc $m > 2$]),
    [$m != plus.minus 2$]
  ),
    loigiai: [
    #step[Dựa vào tiệm cận đứng và tiệm cận xiên.]
    #step[Kiểm tra giao điểm với trục tung để xác định chính xác hàm số.]
  ]
)


#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: auto)

// ─── CÂU 1 ───
#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = (x^2 + 4x + 5)/(x + 2)$ có đồ thị $(C)$. Khi đó:],
  (
    [Hàm số có tập xác định $D = RR$],
    True([Đồ thị hàm số $(C)$ có tiệm cận xiên là đường thẳng $y = x + 2$]),
    True([Đồ thị hàm số $(C)$ có tiệm cận đứng là đường thẳng $x = -2$]),
    True([Đồ thị hàm số $(C)$ nhận điểm $I(-2; 0)$ làm tâm đối xứng])
  ),
    loigiai: [
    #step[a) Tập xác định $D = RR \ \{-2\}$. (Sai)]
    #step[b) Tiệm cận xiên của đồ thị là $y = x + 2$. (Đúng)]
    #step[c) Tiệm cận đứng là $x = -2$. (Đúng)]
    #step[d) Giao điểm của hai tiệm cận là $I(-2; 0)$, đây là tâm đối xứng của đồ thị. (Đúng)]
  ]
)


// ─── CÂU 2 ───
#ds(
  dir: "doc",lines:2,
  [Cho hàm số $y = (2x^2 - 2x + 2)/(-x + 1)$ có đồ thị $(C)$.],
  (
    [Hàm số nghịch biến trên khoảng $(-oo, 0) union (2, +oo)$],
    [Hàm số đạt cực tiểu tại $x = 2$],
    [Giá trị nhỏ nhất của hàm số trên đoạn $[3/2; 5/2]$ bằng $-19/3$],
    True([Đồ thị hàm số $(C)$ có tiệm cận xiên là đường thẳng $2x + y = 0$])
  ),
    loigiai: [
    #step[a) Hàm số không nghịch biến trên khoảng hợp. Phải dùng dấu "," hoặc "và" giữa các khoảng. (Sai)]
    #step[b) Cần xem dấu của $y'$ tại lân cận $x = 2$. (Sai)]
    #step[c) Đánh giá giá trị nhỏ nhất trên đoạn đã cho. (Sai)]
    #step[d) Tiệm cận xiên của hàm số là $y = -2x => 2x + y = 0$. (Đúng)]
  ]
)


// ─── CÂU 3 ───
#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = (-x^2 + x + 1)/(x + 1)$ có đồ thị $(C)$.],
  (
    True([Hàm số đồng biến trên mỗi khoảng $(-2, -1)$ và $(-1, 0)$]),
    True([Hàm số có hai điểm cực trị]),
    [Đồ thị $(C)$ không cắt trục $O x$],
    [Đồ thị $(C)$ có tiệm cận xiên đi qua điểm $A(1; 2)$]
  ),
    loigiai: [
    #step[a) Đạo hàm dương trên các khoảng $(-2; -1)$ và $(-1; 0)$. (Đúng)]
    #step[b) Hàm phân thức bậc 2 trên bậc 1 thường có 2 cực trị. (Đúng)]
    #step[c) Xét phương trình $y = 0$ để xem có cắt $O x$ không. (Sai)]
    #step[d) Kiểm tra xem tiệm cận xiên có đi qua điểm $A(1; 2)$ không. (Sai)]
  ]
)


// ─── CÂU 4 ───
#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = (-x^2 - 3x + 4)/(x - 3)$ có đồ thị là $(C)$.],
  (
    True([Đồ thị $(C)$ có tiệm cận xiên là $y = -x - 6$]),
    True([Đồ thị $(C)$ nhận giao điểm $I(3; -9)$ làm tâm đối xứng]),
    True([Đồ thị $(C)$ có hai điểm cực trị nằm $2$ phía đối với $O y$]),
    [Đồ thị không cắt trục $O x$]
  ),
    loigiai: [
    #step[a) Tiệm cận xiên của đồ thị là đường thẳng $y = -x - 6$. (Đúng)]
    #step[b) Giao điểm của tiệm cận đứng và tiệm cận xiên là $I(3; -9)$. (Đúng)]
    #step[c) Đồ thị hàm phân thức luôn có hai điểm cực trị nằm về 2 phía so với giao điểm hai tiệm cận. (Đúng)]
    #step[d) Giải phương trình $y = 0$, phương trình có nghiệm nên đồ thị có cắt $O x$. (Sai)]
  ]
)


#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: auto)

// ─── CÂU 1 ───
#tln(
  dir: "doc",
  [Trên đồ thị $(C): y = (x^2 - 3x + 6)/(x - 2)$ có bao nhiêu cặp điểm đối xứng nhau qua điểm $I(1/2; 1)$?],
  [$1$],
    loigiai: [
    #step[Sử dụng phép đối xứng tâm, lấy điểm $M(x; y)$ thuộc $(C)$. Điểm đối xứng của nó qua $I(1/2; 1)$ là $M'(1 - x; 2 - y)$.]
    #step[Để $M'$ cũng thuộc $(C)$ thì $2 - y = ((1 - x)^2 - 3(1 - x) + 6)/(1 - x - 2)$.]
    #step[Giải hệ để tìm số cặp điểm phân biệt. Có duy nhất 1 cặp thỏa mãn.]
  ]
)


// ─── CÂU 2 ───
#tln(
  dir: "doc",
  [Tìm được trên đồ thị $(C): y = (x^2 + 4x + 5)/(x + 2)$ hai điểm $M(a; b)$ và $N(c; d)$ có khoảng cách đến đường thẳng $3x + y + 6 = 0$ nhỏ nhất. Khi đó tính giá trị biểu thức $T = a + b + c + d$.],
  [$-4$],
    loigiai: [
    #step[Điểm có khoảng cách nhỏ nhất đến đường thẳng là tiếp điểm của tiếp tuyến song song với đường thẳng đó.]
    #step[Tiếp tuyến song song với $3x + y + 6 = 0$ có hệ số góc $k = -3$.]
    #step[Giải phương trình $y' = -3$ tìm được tọa độ của $M$ và $N$. Tính $T = a + b + c + d = -4$.]
  ]
)


// ─── CÂU 3 ───
#tln(
  dir: "doc",
  [Biết rằng đường thẳng $y = 2x + 2m$ luôn cắt đồ thị hàm số $y = (x^2 + 3)/(x + 1)$ tại hai điểm phân biệt $A, B$ với mọi giá trị của tham số $m$. Tìm hoành độ trung điểm của $A B$.],
  [$-m - 1$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x^2 + 3)/(x + 1) = 2x + 2m => x^2 + 3 = 2(x + 1)(x + m)$.]
    #step[Rút gọn phương trình về dạng bậc hai: $x^2 + (2m + 2)x + 2m - 3 = 0$.]
    #step[Trung điểm $I$ của $A B$ có hoành độ $x_I = (x_1 + x_2)/2 = -(2m + 2)/2 = -m - 1$.]
  ]
)


// ─── CÂU 4 ───
#tln(
  dir: "doc",lines:4,
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
    loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = -c$. Dựa vào đồ thị xác định $c$.]
    #step[Tiệm cận xiên là $y = a x + b$. Xác định $a, b$ từ hình dáng đường xiên.]
    #step[Cộng các hệ số $a + b + c = 1$.]
  ]
)


// ─── CÂU 5 ───
#tln(
  dir: "doc",
  [Cho hàm số $y = (x^2 + m x + m^2 - 2m - 4)/(x - 2)$ (1). Tìm $m$ để đồ thị hàm số đã cho có hai điểm cực trị và hai điểm cực trị cách đều đường thẳng $Delta: 2x + y + 1 = 0$.],
  [$-9$],
    loigiai: [
    #step[Đồ thị hàm phân thức có hai cực trị đối xứng nhau qua tâm đối xứng $I$ (giao điểm 2 tiệm cận).]
    #step[Để hai điểm cực trị cách đều đường thẳng $Delta$, tâm đối xứng $I$ phải nằm trên $Delta$ hoặc đường thẳng nối 2 cực trị song song với $Delta$.]
    #step[Tính toán tọa độ $I$ và thế vào phương trình đường thẳng, tìm được $m = -9$.]
  ]
)


// ─── CÂU 6 ───
#tln(
  dir: "doc",
  [Tìm $m$ để đường thẳng $y = -2x + m$ cắt đồ thị hàm số $y = (x^2 + x - 1)/x$ tại hai điểm $A, B$ sao cho trung điểm đoạn $A B$ thuộc $O y$.],
  [$1$],
    loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x^2 + x - 1)/x = -2x + m => x^2 + x - 1 = -2x^2 + m x$.]
    #step[Phương trình bậc hai: $3x^2 + (1 - m)x - 1 = 0$.]
    #step[Trung điểm của $A B$ thuộc trục $O y => x_I = (x_1 + x_2)/2 = 0 => (m - 1)/6 = 0 => m = 1$.]
  ]
)


