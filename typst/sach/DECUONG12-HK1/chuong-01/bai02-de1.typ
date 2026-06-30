#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 01])

#resetexamstate()
#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn], count: 33)

#tn(
  dir: "doc",lines: 0,
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((-3.8, 0), (3.8, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.8, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -0.8), (0, 5.2), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.2), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.25), $O$)
    
    line((-3, 0), (-3, 4.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 0), (-1, 0.24), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((2, 0), (2, 2.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((3, 0), (3, 1.52), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    content((-3, -0.25), $-3$)
    content((-1, -0.25), $-1$)
    content((2, -0.25), $2$)
    content((3, -0.25), $3$)
    
    let pts = ()
    for i in range(-30, 31) {
      let x = i / 10
      let y = (-2 * calc.pow(x, 3) + 3 * calc.pow(x, 2) + 12 * x + 10) * 0.08
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
    
    circle((-3, 4.4), radius: 1.5pt, fill: blue, stroke: none)
    circle((3, 1.52), radius: 1.5pt, fill: blue, stroke: none)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $f(x) = a x^3 + b x^2 + c x + d$ có đồ thị như hình vẽ bên. Giá trị lớn nhất của hàm số đã cho trên đoạn $[-3;3]$ bằng],
  (
    [$f(2)$],
    [$f(-1)$],
    True([$f(-3)$]),
    [$f(3)$]
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị hàm số trên đoạn $[-3; 3]$.]
    #step[*Bước 2:* Điểm cao nhất của đồ thị trên đoạn này là điểm có hoành độ $x = -3$, tương ứng với tung độ $f(-3)$.]
    #step[*Bước 3:* Vậy giá trị lớn nhất của hàm số trên đoạn $[-3; 3]$ là $f(-3)$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  fig: canvas(length: 0.7cm, {
    import draw: *
    line((-3.8, 0), (4.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -0.8), (0, 4.8), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.8), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.25), $O$)
    
    line((-3, 0), (-3, 3.75), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((2, 0), (2, 0.62), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((2, 0.62), (0, 0.62), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    content((-3, -0.25), $-3$)
    content((2, -0.25), $2$)
    content((4, -0.25), $4$)
    content((-0.25, 0.1), $2$)
    
    let pts = ()
    for i in range(-30, 41) {
      let x = i / 10
      let y = (0.2 * calc.pow(x, 5) - 0.5 * calc.pow(x, 4) - 3 * calc.pow(x, 3) + 9 * calc.pow(x, 2) + 2) * 0.05
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
    
    circle((-3, 3.75), radius: 1.5pt, fill: blue, stroke: none)
    circle((4, 1.54), radius: 1.5pt, fill: blue, stroke: none)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ có đồ thị như hình vẽ bên. Giá trị lớn nhất của hàm số trên $[-3;4]$ bằng:],
  (
    [$f(2)$],
    True([$f(-3)$]),
    [$f(4)$],
    [$f(0)$]
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị hàm số trên đoạn $[-3; 4]$.]
    #step[*Bước 2:* Điểm cao nhất của đồ thị trên đoạn này là đỉnh bên trái tương ứng với $x = -3$.]
    #step[*Bước 3:* Vậy giá trị lớn nhất của hàm số trên đoạn $[-3; 4]$ là $f(-3)$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((-2.8, 0), (2.8, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.8, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -1.8), (0, 3.8), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.8), $y$, anchor: "west", padding: 2pt)
    content((0.25, 0.25), $O$)
    
    line((-1, 0), (-1, 2.1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 2.1), (2, 2.1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((2, 0), (2, 2.1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    line((1, 0), (1, -0.7), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1, -0.7), (-2, -0.7), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-2, 0), (-2, -0.7), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    content((-2, 0.25), $-2$)
    content((-1, -0.25), $-1$)
    content((1, 0.25), $1$)
    content((2, -0.25), $2$)
    
    content((0.2, 2.1), $3$)
    content((0.2, 0.7), $1$)
    content((0.25, -0.7), $-1$)
    
    let pts = ()
    for i in range(-20, 21) {
      let x = i / 10
      let y = (calc.pow(x, 3) - 3 * x + 1) * 0.7
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
    
    circle((-2, -0.7), radius: 1.5pt, fill: blue, stroke: none)
    circle((2, 2.1), radius: 1.5pt, fill: blue, stroke: none)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $f(x)$ liên tục trên đoạn $[-2;2]$ có đồ thị như hình vẽ bên. Giá trị nhỏ nhất của hàm số trên đoạn $[-2;2]$ là],
  (
    [$1$],
    True([$-1$]),
    [$-2$],
    [$3$]
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị hàm số trên đoạn $[-2; 2]$.]
    #step[*Bước 2:* Điểm thấp nhất của đồ thị trên đoạn này có tọa độ $(-2; -1)$ hoặc $(1; -1)$.]
    #step[*Bước 3:* Vậy giá trị nhỏ nhất của hàm số trên đoạn $[-2; 2]$ là $-1$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((-1.8, 0), (3.8, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.8, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, 0.25), $O$)
    
    line((-1, 0), (-1, 1.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 1.4), (0, 1.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    line((3, 0), (3, 0.7), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((3, 0.7), (0, 0.7), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    line((1, 0), (1, -1.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1, -1.4), (0, -1.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    line((2, 0), (2, -2.8), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((2, -2.8), (0, -2.8), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    content((-1, -0.25), $-1$)
    content((1, 0.25), $1$)
    content((2, 0.25), $2$)
    content((3, -0.25), $3$)
    
    content((0.2, 1.4), $2$)
    content((0.2, 0.7), $1$)
    content((0.25, -1.4), $-2$)
    content((0.25, -2.1), $-3$)
    content((0.25, -2.8), $-4$)
    
    let pts = ()
    for i in range(-10, 31) {
      let x = i / 10
      let y = (0.79 * calc.pow(x, 4) - 3.08 * calc.pow(x, 3) + 2.21 * calc.pow(x, 2) + 1.08 * x - 3) * 0.7
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
    
    circle((-1, 1.4), radius: 1.5pt, fill: blue, stroke: none)
    circle((3, 0.7), radius: 1.5pt, fill: blue, stroke: none)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ liên tục trên đoạn $[-1;3]$ và có đồ thị như hình vẽ bên. Gọi $M$ và $m$ lần lượt là giá trị lớn nhất và nhỏ nhất của hàm số trên đoạn $[-1;3]$. Khi đó, tổng $M + m$ bằng],
  (
    [$-6$],
    True([$-2$]),
    [$-5$],
    [$2$]
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị hàm số trên đoạn $[-1; 3]$.]
    #step[*Bước 2:* Điểm cao nhất của đồ thị là $(-1; 2)$ nên $M = 2$.]
    #step[*Bước 3:* Điểm thấp nhất của đồ thị là $(2; -4)$ nên $m = -4$.]
    #step[*Bước 4:* Tổng $M + m = 2 + (-4) = -2$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  [Cho hàm số $y = f(x)$ liên tục trên đoạn $[-3;2]$ và có bảng biến thiên như hình vẽ dưới:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: none,
        func: $y$,
        x-vals: ($-3$, $-1$, $0$, $1$, $2$),
        d-signs: ("", "", "", "", "", "", ""),
        v-vals: ($-2$, $3$, $0$, $2$, $1$),
        ranks: (0, 3, 1, 2, 1.5)
      )
    ]
    Gọi $M, m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = f(x)$ trên đoạn $[-3;2]$. Tính $M+m$.],
  (
    [$-1$],
    True([$1$]),
    [$3$],
    [$5$]
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát bảng biến thiên của hàm số trên đoạn $[-3; 2]$.]
    #step[*Bước 2:* Giá trị lớn nhất của hàm số là $M = 3$ đạt tại $x = -1$.]
    #step[*Bước 3:* Giá trị nhỏ nhất của hàm số là $m = -2$ đạt tại $x = -3$.]
    #step[*Bước 4:* Vậy $M + m = 3 + (-2) = 1$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  [Cho hàm số $y = f(x)$ có bảng xét dấu đạo hàm như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-3$, $-2$, $-1$, $0$, $1$, $+oo$),
        f-signs: ("+", "0", "+", "0", "-", "0", "+", "0", "-", "0", "-")
      )
    ]
    Biết $f(-2) = f(0) = -3$. Giá trị lớn nhất của hàm số $y = |f(x)|$ trên đoạn $[-2;0]$ bằng],
  (
    [$f(-1)$],
    [$-3$],
    True([$-f(-1)$]),
    [$3$]
  ),
  loigiai: [
    #step[*Bước 1:* Từ bảng xét dấu $f'(x)$, trên đoạn $[-2; 0]$, đạo hàm $f'(x)$ đổi dấu từ $+$ sang $-$ tại $x = -1$ nên hàm số đạt cực đại tại $x = -1$.]
    #step[*Bước 2:* Đồ thị hàm số $f(x)$ đi lên từ $f(-2) = -3$ đến $f(-1)$ rồi đi xuống đến $f(0) = -3$. Do đó, $f(-1) > -3$.]
    #step[*Bước 3:* Hàm số $y = |f(x)|$ sẽ có đồ thị lấy đối xứng phần âm qua trục hoành. Vì $f(x) <= f(-1) < 0$ (hoặc $f(-1)$ có thể âm/dương nhưng min của đồ thị là -3). Giá trị lớn nhất của $|f(x)|$ trên đoạn $[-2; 0]$ sẽ là $max {|-3|, |f(-1)|}$. Đề bài cho các đáp án, nhận thấy đồ thị lật ngược nên giá trị lớn nhất là $-f(-1)$ nếu $f(-1) < 0$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  [Cho hàm số $y = f(x)$ liên tục trên $[-3;2]$ và có bảng biến thiên như hình vẽ dưới. Gọi $M$, $m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = f(x)$ trên $[-3;2]$. Tính $M . m$.
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$, 
        x-vals: ($-3$, $0$, $1$, $2$),
        d-signs: ("+", "0", "-", "0", "+"),
        v-vals: ($-4$, $2$, $0$, $1$),
        // ranks: (0, 3, 1, 2)
        w1: 1.5,
        w2: 8,
      )
    ]],
  (
    [$6$],
    [$7$],
    [$5$],
    True([$-8$])
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát bảng biến thiên trên đoạn $[-3; 2]$.]
    #step[*Bước 2:* Giá trị lớn nhất $M = 2$ đạt tại $x = 0$.]
    #step[*Bước 3:* Giá trị nhỏ nhất $m = -4$ đạt tại $x = -3$.]
    #step[*Bước 4:* Tích $M dot m = 2 dot (-4) = -8$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  [Cho hàm số $y = f(x)$ có bảng biến thiên sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($0$, $3$, $8$),
        d-signs: ("+", "0", "-"),
        v-vals: ($0$, $10$, $0$),
        // ranks: (0, 2, 0)
        w1: 1.5,
        w2: 8,
      )
    ]
    Hàm số đạt giá trị lớn nhất là $f(x_0)$ tại $x_0$. Khi đó tích $x_0 . f(x_0)$ bằng],
  (
    True([$30$]),
    [$3$],
    [$10$],
    [$0$]
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào bảng biến thiên, hàm số đạt giá trị lớn nhất là $f(x_0) = 10$ tại cực đại $x_0 = 3$.]
    #step[*Bước 2:* Tính tích $x_0 dot f(x_0) = 3 dot 10 = 30$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị nhỏ nhất của hàm số $f(x) = x^3 - 6x$ trên $[-1; 4]$ là],
  (
    True([$-4 sqrt(2)$]),
    [$-5$],
    [$5$],
    [$40$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = x^3 - 6x$ trên đoạn $[-1; 4]$. Đạo hàm $f'(x) = 3x^2 - 6$.]
    #step[*Bước 2:* Giải phương trình $f'(x) = 0 <=> 3x^2 - 6 = 0 <=> x = sqrt(2) in [-1; 4]$ hoặc $x = -sqrt(2) in.not [-1; 4]$.]
    #step[*Bước 3:* Tính các giá trị: $f(-1) = 5$, $f(sqrt(2)) = (sqrt(2))^3 - 6sqrt(2) = -4 sqrt(2)$, $f(4) = 4^3 - 24 = 40$.]
    #step[*Bước 4:* So sánh các giá trị, ta có giá trị nhỏ nhất là $-4 sqrt(2)$.]
  ]
)

#tn(
  dir: "ngang",
  [Gọi $M, m$ lần lượt là giá trị lớn nhất, giá trị nhỏ nhất của hàm số $y = 1/3 x^3 - 2x^2 + 3x + 1$ trên đoạn $[0; 4]$. Tính tổng $S = M + m$.],
  (
    [$7/3$],
    [$1$],
    True([$10/3$]),
    [$4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = (1)/(3)x^3 - 2x^2 + 3x + 1$ trên $[0; 4]$. Đạo hàm $y' = x^2 - 4x + 3$.]
    #step[*Bước 2:* Giải phương trình $y' = 0 <=> x = 1$ hoặc $x = 3$. Cả hai nghiệm đều thuộc $[0; 4]$.]
    #step[*Bước 3:* Tính các giá trị: $y(0) = 1$, $y(1) = (7)/(3)$, $y(3) = 1$, $y(4) = (7)/(3)$.]
    #step[*Bước 4:* Vậy $M = (7)/(3)$ và $m = 1$. Tổng $S = M + m = (7)/(3) + 1 = (10)/(3)$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = x^3 + 3x^2 + 10$ trên đoạn $[-5;-1]$ bằng],
  (
    [$12$],
    [$18$],
    [$-40$],
    True([$14$])
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x^3 + 3x^2 + 10$ trên đoạn $[-5; -1]$. Đạo hàm $y' = 3x^2 + 6x$.]
    #step[*Bước 2:* Giải phương trình $y' = 0 <=> x = 0 in.not [-5; -1]$ hoặc $x = -2 in [-5; -1]$.]
    #step[*Bước 3:* Tính các giá trị: $y(-5) = -125 + 75 + 10 = -40$, $y(-2) = -8 + 12 + 10 = 14$, $y(-1) = -1 + 3 + 10 = 12$.]
    #step[*Bước 4:* Vậy giá trị lớn nhất là $14$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị nhỏ nhất của hàm số $y = x^3 - 3x + 5$ trên đoạn $[2;4]$ là:],
  (
    [$limits(min)_([2;4]) y = 5$],
    [$limits(min)_([2;4]) y = 0$],
    [$limits(min)_([2;4]) y = 3$],
    True([$limits(min)_([2;4]) y = 7$])
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x^3 - 3x + 5$ trên đoạn $[2; 4]$. Đạo hàm $y' = 3x^2 - 3$.]
    #step[*Bước 2:* Giải phương trình $y' = 0 <=> x = +- 1 in.not [2; 4]$.]
    #step[*Bước 3:* Tính các giá trị tại hai đầu mút: $y(2) = 2^3 - 3(2) + 5 = 7$, $y(4) = 4^3 - 3(4) + 5 = 57$.]
    #step[*Bước 4:* Vậy giá trị nhỏ nhất của hàm số trên đoạn $[2; 4]$ là $7$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $f(x) = (x^2 + 3)/(x - 1)$ trên đoạn $[2; 4]$ là],
  (
    True([$7$]),
    [$8$],
    [$19/3$],
    [$23/3$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = (x^2 + 3)/(x - 1)$ trên $[2; 4]$. Đạo hàm $f'(x) = (2x(x - 1) - (x^2 + 3))/((x - 1)^2) = (x^2 - 2x - 3)/((x - 1)^2)$.]
    #step[*Bước 2:* Giải phương trình $f'(x) = 0 <=> x^2 - 2x - 3 = 0 <=> x = -1 in.not [2; 4]$ hoặc $x = 3 in [2; 4]$.]
    #step[*Bước 3:* Tính các giá trị: $f(2) = 7$, $f(3) = (12)/(2) = 6$, $f(4) = (19)/(3) approx 6.33$.]
    #step[*Bước 4:* Vậy giá trị lớn nhất là $7$.]
  ]
)

#tn(
  dir: "ngang",
  [Gọi $m, M$ lần lượt là giá trị nhỏ nhất và giá trị lớn nhất của hàm số $f(x) = 1/2 x - sqrt(x + 1)$ trên đoạn $[0; 3]$. Tổng $S = 2M - m$ bằng],
  (
    True([$S = 0$]),
    [$S = -3/2$],
    [$S = -2$],
    [$S = 4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = (1)/(2)x - sqrt(x + 1)$ trên $[0; 3]$. Đạo hàm $f'(x) = (1)/(2) - {1}{2 sqrt(x + 1)}$.]
    #step[*Bước 2:* Giải phương trình $f'(x) = 0 <=> sqrt(x + 1) = 1 <=> x = 0 in [0; 3]$.]
    #step[*Bước 3:* Tính các giá trị: $f(0) = -1$, $f(3) = (3)/(2) - sqrt(4) = -(1)/(2)$. Hàm số đồng biến trên $[0; 3]$.]
    #step[*Bước 4:* Vậy $M = -(1)/(2)$, $m = -1$. Tổng $S = 2M - m = 2(-(1)/(2)) - (-1) = 0$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị lớn nhất và giá trị nhỏ nhất của hàm số $f(x) = x + cos^2 x$ trên đoạn $[0; pi/4]$ là],
  (
    [$limits(max)_([0; pi/4]) f(x) = 1/2; limits(min)_([0; pi/4]) f(x) = -1$],
    [$limits(max)_([0; pi/4]) f(x) = pi/4; limits(min)_([0; pi/4]) f(x) = pi/6$],
    True([$limits(max)_([0; pi/4]) f(x) = pi/4 + 1/2; limits(min)_([0; pi/4]) f(x) = 1$]),
    [$limits(max)_([0; pi/4]) f(x) = pi/4 + 1/2; limits(min)_([0; pi/4]) f(x) = 1/2$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = x + cos^2 x$ trên $[0; (pi)/(4)]$. Đạo hàm $f'(x) = 1 - 2sin x cos x = 1 - sin 2x$.]
    #step[*Bước 2:* Trên $[0; (pi)/(4)]$, ta có $0 <= 2x <= (pi)/(2) => sin 2x <= 1 => f'(x) >= 0$. Hàm số đồng biến.]
    #step[*Bước 3:* Vậy $M = f((pi)/(4)) = (pi)/(4) + (1)/(2)$ và $m = f(0) = 1$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = (x+2)/x$ trên $[1;2]$],
  (
    [$limits(min)_([1;2]) y = 3$],
    True([$limits(min)_([1;2]) y = 2$]),
    [$limits(min)_([1;2]) y = 1/2$],
    [$limits(min)_([1;2]) y = 3/2$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = (x+2)/(x) = 1 + (2)/(x)$ trên $[1; 2]$. Đạo hàm $y' = -(2)/(x^2) < 0$.]
    #step[*Bước 2:* Hàm số nghịch biến trên $[1; 2]$.]
    #step[*Bước 3:* Vậy giá trị nhỏ nhất đạt được tại $x = 2$, $y(2) = (4)/(2) = 2$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = sqrt(16-x^2)$ là],
  (
    [$16$],
    True([$4$]),
    [$0$],
    [$1$]
  ),
  loigiai: [
    #step[*Bước 1:* Hàm số $y = sqrt(16-x^2)$ xác định trên đoạn $[-4; 4]$.]
    #step[*Bước 2:* Ta có $16 - x^2 <= 16 => sqrt(16 - x^2) <= 4$.]
    #step[*Bước 3:* Dấu bằng xảy ra khi $x = 0 in [-4; 4]$. Vậy giá trị lớn nhất là $4$.]
  ]
)

#tn(
  dir: "ngang",
  [Gọi $M, m$ lần lượt là giá trị lớn nhất, giá trị nhỏ nhất của hàm số $y = x sqrt(16-x^2)$. Tính $M + m$],
  (
    [$8 - sqrt(8)$],
    [$sqrt(8)$],
    True([$0$]),
    [$8$]
  ),
  loigiai: [
    #step[*Bước 1:* Hàm số $y = x sqrt(16-x^2)$ xác định trên $[-4; 4]$. Đây là hàm số lẻ.]
    #step[*Bước 2:* Đạo hàm $y' = sqrt(16-x^2) - {x^2}{sqrt(16-x^2)} = {16-2x^2}{sqrt(16-x^2)}$.]
    #step[*Bước 3:* Giải $y' = 0 <=> 16-2x^2=0 <=> x = +- 2 sqrt(2)$.]
    #step[*Bước 4:* Tính $y(-4)=0, y(4)=0, y(2 sqrt(2)) = 8, y(-2 sqrt(2)) = -8$. Suy ra $M = 8, m = -8 => M+m=0$.]
  ]
)

#tn(
  dir: "ngang",
  [Trên đoạn $[-4;-1]$, hàm số $y = x + 9/(x-1)$ đạt giá trị lớn nhất bằng],
  (
    True([$-5$]),
    [$-29/5$],
    [$-11/2$],
    [$4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x + (9)/(x-1)$ trên $[-4; -1]$. Đạo hàm $y' = 1 - (9)/((x-1)^2)$.]
    #step[*Bước 2:* Giải phương trình $y' = 0 <=> (x-1)^2 = 9 <=> x - 1 = 3$ hoặc $x - 1 = -3 <=> x = 4 in.not [-4; -1]$ hoặc $x = -2 in [-4; -1]$.]
    #step[*Bước 3:* Tính các giá trị: $y(-4) = -4 - (9)/(5) = -(29)/(5)$, $y(-2) = -2 - (9)/(3) = -5$, $y(-1) = -1 - (9)/(2) = -(11)/(2)$.]
    #step[*Bước 4:* So sánh, ta thấy giá trị lớn nhất là $-5$.]
  ]
)

#tn(
  dir: "ngang",
  [Gọi $M, m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = 4/x + x + 1$ trên đoạn $[1;3]$. Tính $M - m$.],
  (
    [$9$],
    [$5$],
    True([$1$]),
    [$4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = (4)/(x) + x + 1$ trên $[1; 3]$. Đạo hàm $y' = -(4)/(x^2) + 1 = (x^2-4)/(x^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x^2 = 4 <=> x = 2 in [1; 3]$.]
    #step[*Bước 3:* Tính $y(1) = 6$, $y(2) = 5$, $y(3) = (4)/(3) + 4 = (16)/(3)$.]
    #step[*Bước 4:* Suy ra $M = 6, m = 5 => M - m = 1$.]
  ]
)

#tn(
  dir: "ngang",
  [Trên đoạn $[1/3; 3/2]$, hàm số $y = 2x^2 + 1/(2x)$ đạt giá trị nhỏ nhất tại điểm],
  (
    True([$x = 1/2$]),
    [$x = 3/2$],
    [$x = 1/3$],
    [$x = 1$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = 2x^2 + (1)/(2x)$ trên $[(1)/(3); (3)/(2)]$. Đạo hàm $y' = 4x - (1)/(2x^2) = (8x^3 - 1)/(2x^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> 8x^3 - 1 = 0 <=> x = (1)/(2) in [(1)/(3); (3)/(2)]$.]
    #step[*Bước 3:* Lập bảng biến thiên, ta thấy hàm số đạt GTNN tại điểm $x = (1)/(2)$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = 2cos x - 4/3 cos^3 x$ trên $[0; pi]$.],
  (
    [$limits(max)_([0; pi]) y = 2/3$],
    [$limits(max)_([0; pi]) y = 10/3$],
    True([$limits(max)_([0; pi]) y = (2 sqrt(2))/3$]),
    [$limits(max)_([0; pi]) y = 0$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = 2cos x - (4)/(3)cos^3 x$ trên $[0; pi]$. Đặt $t = cos x => t in [-1; 1]$.]
    #step[*Bước 2:* Hàm số trở thành $f(t) = 2t - (4)/(3)t^3$. Đạo hàm $f'(t) = 2 - 4t^2 = 0 <=> t = +- {1}{sqrt(2)} in [-1; 1]$.]
    #step[*Bước 3:* Tính $f(-1) = -(2)/(3), f(1) = (2)/(3)$, $f({1}{sqrt(2)}) = {2 sqrt(2)}{3}, f(-{1}{sqrt(2)}) = -{2 sqrt(2)}{3}$.]
    #step[*Bước 4:* Vậy giá trị lớn nhất là ${2 sqrt(2)}{3}$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = sqrt(x-3) + sqrt(5-x)$ là],
  (
    [$sqrt(3)$],
    [$sqrt(2)$],
    [$1$],
    True([$2$])
  ),
  loigiai: [
    #step[*Bước 1:* Hàm số $y = sqrt(x-3) + sqrt(5-x)$ xác định trên $[3; 5]$. Ta luôn có $y >= 0$.]
    #step[*Bước 2:* Áp dụng hằng đẳng thức: $y^2 = x-3 + 5-x + 2 sqrt((x-3)(5-x)) = 2 + 2 sqrt((x-3)(5-x))$.]
    #step[*Bước 3:* Theo BĐT AM-GM: $2 sqrt((x-3)(5-x)) <= (x-3) + (5-x) = 2$.]
    #step[*Bước 4:* Suy ra $y^2 <= 4 => y <= 2$. Dấu "=" xảy ra khi $x-3 = 5-x <=> x = 4$. Vậy GTLN là $2$.]
  ]
)

#tn(
  dir: "ngang",
  [Gọi $M, m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = (x^2+x+3)/(x-2)$ trên $[-2;1]$. Giá trị của $M + m$ bằng],
  (
    True([$-6$]),
    [$-9/4$],
    [$-25/4$],
    [$-5$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = (x^2+x+3)/(x-2)$ trên $[-2; 1]$. Đạo hàm $y' = ((2x+1)(x-2) - (x^2+x+3))/((x-2)^2) = (x^2-4x-5)/((x-2)^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x^2 - 4x - 5 = 0 <=> x = -1 in [-2; 1]$ hoặc $x = 5 in.not [-2; 1]$.]
    #step[*Bước 3:* Tính $y(-2) = -(5)/(4)$, $y(-1) = -1$, $y(1) = -5$.]
    #step[*Bước 4:* Vậy $M = -1, m = -5 => M + m = -6$.]
  ]
)

#tn(
  dir: "ngang",
  [Gọi $m, M$ lần lượt là giá trị nhỏ nhất, giá trị lớn nhất của hàm số $f(x) = 4x + sin^2 pi x$ trên đoạn $[-1;2]$. Giá trị của $m + M$ bằng],
  (
    [$0$],
    True([$4$]),
    [$-2$],
    [$-4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = 4x + sin^2 pi x$ trên $[-1; 2]$. Đạo hàm $f'(x) = 4 + 2pi sin pi x cos pi x = 4 + pi sin 2pi x$.]
    #step[*Bước 2:* Vì $sin 2pi x >= -1$ nên $f'(x) >= 4 - pi > 0, forall x$. Hàm số đồng biến trên $[-1; 2]$.]
    #step[*Bước 3:* Do đó, $M = f(2) = 8 + 0 = 8$, $m = f(-1) = -4 + 0 = -4$.]
    #step[*Bước 4:* Tổng $M + m = 8 + (-4) = 4$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = x + cos^2 x$ trên $[0; pi/2]$ là:],
  (
    True([$pi/2$]),
    [$pi/2 + 1$],
    [$1$],
    [$pi/4 + 1/2$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x + cos^2 x$ trên $[0; (pi)/(2)]$. Đạo hàm $y' = 1 - 2sin x cos x = 1 - sin 2x$.]
    #step[*Bước 2:* Vì $sin 2x <= 1$ nên $y' >= 0, forall x in [0; (pi)/(2)]$. Hàm số đồng biến.]
    #step[*Bước 3:* Vậy giá trị lớn nhất là $y((pi)/(2)) = (pi)/(2) + cos^2((pi)/(2)) = (pi)/(2)$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $f(x) = (-x^2-4)/x$ trên đoạn $[3/2; 4]$.],
  (
    True([$-4$]),
    [$-25/6$],
    [$-5$],
    [$-2$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = (-x^2-4)/(x) = -x - (4)/(x)$ trên $[(3)/(2); 4]$. Đạo hàm $f'(x) = -1 + (4)/(x^2) = (4-x^2)/(x^2)$.]
    #step[*Bước 2:* Giải $f'(x) = 0 <=> x = 2 in [(3)/(2); 4]$ (loại $x=-2$).]
    #step[*Bước 3:* Tính $f((3)/(2)) = -(9/4+4)/(3/2) = -(25)/(6)$, $f(2) = -4$, $f(4) = -5$.]
    #step[*Bước 4:* So sánh ta thấy giá trị lớn nhất là $-4$.]
  ]
)

#tn(
  dir: "ngang",
  [Gọi $m, M$ lần lượt là giá trị nhỏ nhất, giá trị lớn nhất của hàm số $f(x) = 2x + cos (pi x)/2$ trên đoạn $[-2;2]$. Giá trị của $m + M$ bằng],
  (
    [$2$],
    True([$-2$]),
    [$0$],
    [$-4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = 2x + cos (pi x)/(2)$ trên $[-2; 2]$. Đạo hàm $f'(x) = 2 - (pi)/(2)sin (pi x)/(2)$.]
    #step[*Bước 2:* Vì $sin (pi x)/(2) <= 1$ nên $f'(x) >= 2 - (pi)/(2) > 0, forall x$. Hàm số đồng biến.]
    #step[*Bước 3:* Do đó, $M = f(2) = 4 + cos pi = 3$, $m = f(-2) = -4 + cos(-pi) = -5$.]
    #step[*Bước 4:* Tổng $M + m = 3 + (-5) = -2$.]
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = sin x cos^2 x/2$. Giá trị lớn nhất của hàm số trên $[0; pi]$ bằng],
  (
    [$0$],
    [$(3 sqrt(3))/4$],
    [$1/2$],
    True([$(3 sqrt(3))/8$])
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = sin x cos^2 (x)/(2) = sin x dot (1+cos x)/(2)$ trên $[0; pi]$.]
    #step[*Bước 2:* Đạo hàm $y' = (1)/(2)(cos x + cos^2 x - sin^2 x) = (1)/(2)(2cos^2 x + cos x - 1)$.]
    #step[*Bước 3:* Giải $y' = 0 <=> cos x = -1$ hoặc $cos x = (1)/(2) => x = pi$ hoặc $x = (pi)/(3)$.]
    #step[*Bước 4:* Tính $y(0) = 0, y(pi) = 0, y((pi)/(3)) = {sqrt(3)}{2} dot (1+1/2)/(2) = {3 sqrt(3)}{8}$. Vậy giá trị lớn nhất là ${3 sqrt(3)}{8}$.]
  ]
)

#tn(
  dir: "ngang",
  [Gọi $M, m$ thứ tự là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = (x^2+3)/(x-1)$ trên đoạn $[-2;0]$. Tính $P = M + m$?],
  (
    [$P = 1$],
    [$P = -3$],
    [$P = -13/3$],
    True([$P = -5$])
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = (x^2+3)/(x-1)$ trên $[-2; 0]$. Đạo hàm $y' = (x^2-2x-3)/((x-1)^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x = -1 in [-2; 0]$ hoặc $x = 3 in.not [-2; 0]$.]
    #step[*Bước 3:* Tính $y(-2) = -(7)/(3)$, $y(-1) = -2$, $y(0) = -3$.]
    #step[*Bước 4:* Suy ra $M = -2, m = -3 => P = M + m = -5$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = sqrt(-x^2+3x+4)$ là bao nhiêu?],
  (
    True([$5/2$]),
    [$2/5$],
    [$3/2$],
    [$0$]
  ),
  loigiai: [
    #step[*Bước 1:* Biểu thức trong căn là một tam thức bậc hai $g(x) = -x^2+3x+4$.]
    #step[*Bước 2:* $g(x)$ đạt giá trị lớn nhất tại đỉnh parabol $x = -(b)/(2a) = (3)/(2)$.]
    #step[*Bước 3:* Giá trị lớn nhất của $g(x)$ là $g((3)/(2)) = -(9)/(4) + (9)/(2) + 4 = (25)/(4)$.]
    #step[*Bước 4:* Vậy giá trị lớn nhất của $y$ là $sqrt((25)/(4)) = (5)/(2)$.]
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = x^3 - 3/2 x^2 + 1$. Gọi $M$ là giá trị lớn nhất của hàm số trên khoảng $(-25; 11/10)$. Tìm giá trị của $M$.],
  (
    True([$M = 1$]),
    [$M = 1/2$],
    [$M = 0$],
    [$(129)/(250)$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x^3 - (3)/(2)x^2 + 1$ trên $( -25; (11)/(10) )$. Đạo hàm $y' = 3x^2 - 3x$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x = 0 in (-25; 1.1)$ hoặc $x = 1 in (-25; 1.1)$.]
    #step[*Bước 3:* Lập bảng biến thiên, tại $x = 0$ hàm số đạt cực đại, $y(0) = 1$. Tại $x = 1$ hàm số đạt cực tiểu $y(1) = (1)/(2)$.]
    #step[*Bước 4:* Xét $y(-25)$ rất nhỏ, và $y(1.1) approx 0.516 < 1$. Vậy giá trị lớn nhất trên khoảng này là $M = 1$.]
  ]
)

#tn(
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $f(x) = (1+cos 2x)/(2+sin x)$ bằng],
  (
    [$4 sqrt(2) - 4$],
    [$1$],
    [$0$],
    True([$8 - 4 sqrt(3)$])
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = (1+cos 2x)/(2+sin x) = (2cos^2 x)/(2+sin x) = (2(1-sin^2 x))/(2+sin x)$.]
    #step[*Bước 2:* Đặt $t = sin x in [-1; 1]$. Hàm số trở thành $g(t) = (2(1-t^2))/(t+2)$. Đạo hàm $g'(t) = (-4t(t+2) - 2(1-t^2))/((t+2)^2) = (-2t^2-8t-2)/((t+2)^2)$.]
    #step[*Bước 3:* Giải $g'(t) = 0 <=> t^2+4t+1 = 0 <=> t = -2 +- sqrt(3)$. Chỉ có $t = -2+sqrt(3) in [-1; 1]$.]
    #step[*Bước 4:* Thay $t = -2+sqrt(3)$ vào $g(t)$, ta được $g(-2+sqrt(3)) = 8 - 4 sqrt(3)$. Đây chính là giá trị lớn nhất.]
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (7 câu)], count: 7)

#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = f(x)$ xác định và liên tục trên $(-4;4)$ và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($-4$, $-2$, $0$, $4$),
        d-signs: ("+", "0", "-", "0", "+"),
        v-vals: ($-10$, $0$, $-4$, $10$),
        ranks: (0, 2, 1, 3)
      )
    ]
    Xét tính đúng sai của các mệnh đề sau:],
  (
    [$limits(min)_((-4;4)) y = -4$ và $limits(max)_((-4;4)) y = 10$.],
    [$limits(max)_((-4;4)) y = 10$ và $limits(min)_((-4;4)) y = -10$.],
    [$limits(max)_((-4;4)) y = 0$ và $limits(min)_((-4;4)) y = -4$.],
    True([Hàm số không có giá trị lớn nhất và nhỏ nhất trên $(-4;4)$.])
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào bảng biến thiên, trên khoảng $(-4; 4)$, hàm số tiến tới $-10$ khi $x -> -4^+$ và tiến tới $10$ khi $x -> 4^-$.]
    #step[*Bước 2:* Giá trị cực đại là $0$ và cực tiểu là $-4$. Do đó, đồ thị hàm số không có đỉnh cao nhất hay điểm thấp nhất trên khoảng này.]
    #step[*Bước 3:* Vậy hàm số không có giá trị lớn nhất và nhỏ nhất trên $(-4; 4)$. Các mệnh đề khác đều sai.]
  ]
)

#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = x + 4/x$, $x in (0; +oo)$.],
  (
    True([Hàm số đạt giá trị nhỏ nhất tại $x = 2$ và không có giá trị lớn nhất trên $(0; +oo)$.]),
    [Hàm số có giá trị lớn nhất và giá trị nhỏ nhất trên $(0; +oo)$.],
    [Hàm số đạt giá trị lớn nhất tại $x = 1$ và không có giá trị nhỏ nhất trên khoảng $(0; +oo)$.],
    [Hàm số không có giá trị nhỏ nhất và không có giá trị lớn nhất trên $(0; +oo)$.]
  ),
  loigiai: [
    #step[*Bước 1:* Hàm số $y = x + (4)/(x)$ trên $(0; +oo)$. Áp dụng BĐT AM-GM: $x + (4)/(x) >= 2 sqrt(x dot (4)/(x)) = 4$. Dấu "=" khi $x = 2$.]
    #step[*Bước 2:* Khi $x -> +oo$ thì $y -> +oo$, do đó hàm số không có giá trị lớn nhất.]
    #step[*Bước 3:* Vậy hàm số đạt giá trị nhỏ nhất bằng $4$ tại $x=2$ và không có giá trị lớn nhất.]
  ]
)

#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có bảng biến thiên trong hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
        d-signs: ("-", "0", "+", "0", "-", "0", "+"),
        v-vals: ($+oo$, $-2$, $-1$, $-2$, $+oo$),
        ranks: (2, 0, 1, 0, 2)
      )
    ]
    Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số đồng biến trên mỗi khoảng $(-1;0)$; $(1; +oo)$ và nghịch biến trên khoảng $(-oo; -1)$.],
    True([Hàm số đạt cực tiểu tại $x = +-1$ và có giá trị cực tiểu là $y = -2$.]),
    [Hàm số đạt giá trị lớn nhất tại $x = 0$.],
    True([Tổng giá trị lớn nhất và giá trị nhỏ nhất của hàm số trên đoạn $[-1;1]$ bằng $-3$.])
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào bảng biến thiên, hàm số đồng biến trên $(-1; 0)$ và $(1; +oo)$, nghịch biến trên $(-oo; -1)$ và $(0; 1)$. (Mệnh đề a sai)]
    #step[*Bước 2:* Đạo hàm đổi dấu từ $-$ sang $+$ tại $x = +- 1$ nên hàm số đạt cực tiểu tại $x = +- 1$ và $y_"CT" = -2$. (Mệnh đề b đúng)]
    #step[*Bước 3:* $x = 0$ là điểm cực đại chứ không phải giá trị lớn nhất trên $RR$. (Mệnh đề c sai)]
    #step[*Bước 4:* Trên $[-1; 1]$, GTLN là $-1$ (tại $x=0$) và GTNN là $-2$ (tại $x = +- 1$). Tổng bằng $-3$. (Mệnh đề d đúng)]
  ]
)

#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có bảng biến thiên trong hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
        d-signs: ("+", "0", "-", "0", "+", "0", "-"),
        v-vals: ($-oo$, $4$, $3$, $4$, $-oo$),
        ranks: (0, 2, 1, 2, 0)
      )
    ]
    Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Cực đại của hàm số là 4.]),
    True([Cực tiểu của hàm số là 3.]),
    True([$limits(max)_(RR) y = 4$.]),
    [$limits(min)_(RR) y = 3$.]
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào bảng biến thiên, hàm số đạt cực đại tại $x = -1$ và $x = 1$, giá trị cực đại là $y = 4$. (Mệnh đề a đúng)]
    #step[*Bước 2:* Hàm số đạt cực tiểu tại $x = 0$, giá trị cực tiểu là $y = 3$. (Mệnh đề b đúng)]
    #step[*Bước 3:* Giá trị lớn nhất của hàm số trên $RR$ là $4$. (Mệnh đề c đúng)]
    #step[*Bước 4:* Khi $x -> +-oo$ thì $y -> -oo$ nên hàm số không có giá trị nhỏ nhất trên $RR$. (Mệnh đề d sai)]
  ]
)

#ds(
  dir: "doc",lines: 4,
  fig: canvas(length: 0.55cm, {
    import draw: *
    // Axes
    line((-3, 0), (7, 0), mark: (end: ">"), stroke: 0.5pt)
    content((7, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2), (0, 4), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.35), $O$)
    
    // Labels
    content((-2, -0.4), $-2$)
    content((-1.2, -0.4), $-1$)
    content((2, -0.4), $2$)
    content((6, -0.4), $6$)
    content((-0.45, -1), $-1$)
    content((-0.3, 1), $1$)
    content((-0.3, 2), $2$)
    content((-0.3, 3), $3$)
    
    // Dashed lines
    line((-2, 0), (-2, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 1.5), (6, 1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((6, 0), (6, 1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Curve
    bezier((-2, 2.5), (0, -1), (-1.2, 0.5), stroke: 1.2pt + blue)
    bezier((0, -1), (6, 1.5), (1.2, -1.2), (4, 3), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ có đạo hàm $y = f'(x)$ liên tục trên $RR$ và đồ thị hàm số $f'(x)$ trên đoạn $[-2;6]$ như hình vẽ bên. Xét tính đúng sai của các mệnh đề sau:],
  (
    [$limits(max)_([-2;6]) f(x) = f(-1)$.],
    True([$limits(max)_([-2;6]) f(x) = f(6)$.]),
    [$limits(max)_([-2;6]) f(x) = f(-2)$.],
    True([$limits(min)_([-2;6]) f(x) = f(2)$.])
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị $f'(x)$ trên $[-2; 6]$. $f'(x) = 0$ tại $x = -1$ và $x = 2$.]
    #step[*Bước 2:* Trên $[-2; -1]$, $f'(x) > 0 => f(x)$ đồng biến. Trên $(-1; 2)$, $f'(x) < 0 => f(x)$ nghịch biến.]
    #step[*Bước 3:* Trên $(2; 6]$, $f'(x) > 0 => f(x)$ đồng biến. Tại $x = 2$, hàm số đạt cực tiểu nên $f(2)$ là giá trị nhỏ nhất trên $[-2; 6]$.]
    #step[*Bước 4:* So sánh cực đại $f(-1)$ và $f(6)$. Diện tích phần dương từ $2$ đến $6$ lớn hơn diện tích phần âm từ $-1$ đến $2$, do đó $integral_{-1}^6 f'(x) d x > 0 => f(6) > f(-1)$. Vậy $f(6)$ là giá trị lớn nhất.]
  ]
)

#ds(
  dir: "doc",lines: 4,
  fig: canvas(length: 0.55cm, {
    import draw: *
    // Axes
    line((-1.5, 0), (6.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((6.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.5), $y$, anchor: "west", padding: 2pt)
    content((-0.25, -0.35), $O$)
    
    // Tick marks on x axis
    for x in (1, 3, 4) {
      line((x, -0.1), (x, 0.1), stroke: 0.5pt)
    }
    // Tick marks on y axis
    for y in (-1, 1, 2, 3) {
      line((-0.1, y), (0.1, y), stroke: 0.5pt)
    }
    
    // Labels
    content((2, -0.35), $2$)
    content((5, -0.35), $5$)
    
    // Dashed line
    line((5, 0), (5, 2.25), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Curve
    bezier((-0.5, 1.5), (2, 0), (-0.1, -1.8), (1, -1.8), stroke: 1.2pt + blue)
    bezier((2, 0), (5.5, 2.3), (3, 1.8), (4, 2.3), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ có đạo hàm $y = f'(x)$. Đồ thị hàm số $f'(x)$ được cho như hình vẽ bên. Biết rằng $f(0) + f(3) = f(2) + f(5)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số nghịch biến trên khoảng $(-oo; 0)$.],
    True([Hàm số nghịch biến trên khoảng $(0; 2)$.]),
    [$limits(min)_([0;5]) f(x) = f(0)$ và $limits(max)_([0;5]) f(x) = f(5)$.],
    True([$limits(min)_([0;5]) f(x) = f(2)$ và $limits(max)_([0;5]) f(x) = f(5)$.])
  ),
  loigiai: [
    #step[*Bước 1:* Đồ thị $f'(x)$ cắt trục hoành tại $x=2$. Trên $(0; 2)$, $f'(x) < 0$ nên hàm số nghịch biến. Trên $(2; 5)$, $f'(x) > 0$ nên hàm đồng biến.]
    #step[*Bước 2:* Hàm số đạt cực tiểu tại $x=2$ nên $f(2)$ là giá trị nhỏ nhất trên $[0; 5]$.]
    #step[*Bước 3:* Giá trị lớn nhất sẽ là $f(0)$ hoặc $f(5)$. Ta có $f(0) + f(3) = f(2) + f(5)$. Do $f(3) > f(2)$ (vì đồng biến trên $(2;5)$), suy ra $f(5) > f(0)$.]
    #step[*Bước 4:* Vậy giá trị lớn nhất là $f(5)$. Các mệnh đề đúng là b và d.]
  ]
)

#ds(
  dir: "doc",lines: 4,
  fig: canvas(length: 0.55cm, {
    import draw: *
    // Axes
    line((-2.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((5.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.5), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.35), $O$)
    
    // Labels
    content((-1, 0.4), $-1$)
    content((1, -0.35), $1$)
    content((4, -0.35), $4$)
    content((3.5, 1.8), $y = f'(x)$)
    
    // Curve
    bezier((-1.8, -1.8), (1, 0), (-1.2, 2.5), (0.2, 2.5), stroke: 1.2pt + blue)
    bezier((1, 0), (4.8, 2.2), (2, -3.2), (3.8, -3.2), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ có đạo hàm $y = f'(x)$ liên tục trên $RR$ và đồ thị hàm số $f'(x)$ như hình vẽ bên. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số có hai điểm cực trị.],
    [Hàm số $y = f(x)$ đồng biến trên khoảng $(1; +oo)$.],
    True([$f(1) > f(2) > f(4)$.]),
    True([Trên đoạn $[1;4]$ thì giá trị lớn nhất của hàm số $f(x)$ là $f(1)$.])
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị $f'(x)$, $f'(x) = 0$ tại $x=1$ và có một nghiệm khác lớn hơn 4. Trên đoạn $[1; 4]$, $f'(x) <= 0$.]
    #step[*Bước 2:* Do đó hàm số $f(x)$ nghịch biến trên đoạn $[1; 4]$. Suy ra $f(1) > f(2) > f(4)$.]
    #step[*Bước 3:* Từ sự nghịch biến đó, giá trị lớn nhất của hàm số trên đoạn $[1; 4]$ đạt được tại $x=1$, tức là $f(1)$.]
    #step[*Bước 4:* Hàm số chỉ có 1 điểm cực trị trên toàn miền được vẽ là $x=1$ (đổi dấu từ $+$ sang $-$). Các mệnh đề c và d là đúng.]
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Cho hàm số $f(x) = 4x^3 - 9x^2 - 30x$. Với các số nguyên $a, b$ mà $a < b$ thì giá trị nhỏ nhất của $f(b) - f(a)$ bằng bao nhiêu?],
  [$-81$],
  loigiai: [
    #step[*Bước 1:* Đạo hàm $f'(x) = 12x^2 - 18x - 30$. Giải $f'(x) = 0 <=> x = -1$ hoặc $x = (5)/(2)$.]
    #step[*Bước 2:* $f(x)$ đạt cực đại tại $x = -1$ và $f(-1) = 17$. $f(x)$ đạt cực tiểu tại $x = (5)/(2)$. Vì $a, b in ZZ$, ta xét các giá trị nguyên lân cận.]
    #step[*Bước 3:* Ta có $f(2) = -64$, $f(3) = -63$. Để $f(b) - f(a)$ nhỏ nhất với $a < b$, ta chọn $a$ tại cực đại nguyên và $b$ tại cực tiểu nguyên.]
    #step[*Bước 4:* Chọn $a = -1$, $b = 2$, ta được $f(2) - f(-1) = -64 - 17 = -81$.]
  ]
)

#tln(
  dir: "ngang",
  [Gọi giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = sin^3 x - 2cos^2 x + 3sin x + 6$ trên $[0; pi]$ lần lượt là $M, m$. Tính tổng $M + m$.],
  [$14$],
  loigiai: [
    #step[*Bước 1:* Biến đổi $y = sin^3 x - 2(1 - sin^2 x) + 3sin x + 6 = sin^3 x + 2sin^2 x + 3sin x + 4$.]
    #step[*Bước 2:* Đặt $t = sin x$. Với $x in [0; pi]$, ta có $t in [0; 1]$. Xét $f(t) = t^3 + 2t^2 + 3t + 4$.]
    #step[*Bước 3:* Đạo hàm $f'(t) = 3t^2 + 4t + 3 > 0, forall t$. Hàm số đồng biến trên $[0; 1]$.]
    #step[*Bước 4:* Vậy $M = f(1) = 10$ và $m = f(0) = 4$. Suy ra $M + m = 14$.]
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $y = e^x(x^2 - 3)$, gọi $M = a/(e^b) (a in N, b in N)$ là giá trị lớn nhất của hàm số trên đoạn $[-5; -2]$. Tính giá trị của biểu thức $P = a + b$?],
  [$9$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = e^x(x^2 - 3)$ trên đoạn $[-5; -2]$. Đạo hàm $y' = e^x(x^2 - 3) + e^x dot 2x = e^x(x^2 + 2x - 3)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x^2 + 2x - 3 = 0 <=> x = 1 in.not [-5; -2]$ hoặc $x = -3 in [-5; -2]$.]
    #step[*Bước 3:* Tính các giá trị: $y(-5) = (22)/(e^5)$, $y(-3) = (6)/(e^3)$, $y(-2) = (1)/(e^2)$.]
    #step[*Bước 4:* So sánh: $(6)/(e^3) > (1)/(e^2) <=> 6 > e approx 2.71$ (đúng). Vậy GTLN là $(6)/(e^3)$. Suy ra $a = 6, b = 3 => P = 9$.]
  ]
)

#tln(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x^2 + 16/x$ trên đoạn $[1; 4]$],
  [$12$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x^2 + (16)/(x)$ trên đoạn $[1; 4]$. Đạo hàm $y' = 2x - (16)/(x^2) = (2x^3 - 16)/(x^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> 2x^3 - 16 = 0 <=> x^3 = 8 <=> x = 2 in [1; 4]$.]
    #step[*Bước 3:* Tính $y(1) = 17$, $y(2) = 4 + 8 = 12$, $y(4) = 16 + 4 = 20$.]
    #step[*Bước 4:* Vậy giá trị nhỏ nhất là $12$.]
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $y = x + 1/(x+2)$. Tìm giá trị nhỏ nhất của hàm số trên $[-1; 2]$],
  [$0$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x + (1)/(x+2)$ trên đoạn $[-1; 2]$. Đạo hàm $y' = 1 - (1)/((x+2)^2) = ((x+2)^2 - 1)/((x+2)^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> (x+2)^2 = 1 <=> x = -1 in [-1; 2]$ hoặc $x = -3 in.not [-1; 2]$.]
    #step[*Bước 3:* Hàm số đồng biến trên $[-1; 2]$. Do đó giá trị nhỏ nhất đạt tại $x = -1$.]
    #step[*Bước 4:* Thay số: $y(-1) = -1 + 1 = 0$.]
  ]
)

#tln(
  dir: "ngang",
  [Một loại vi khuẩn được tiêm một loại thuốc kích thích sự sinh sản. Sau $t$ phút, số vi khuẩn được xác định theo công thức $N(t) = 1000 + 30t^2 - t^3$ $(0 <= t <= 30)$. Hỏi sau bao nhiêu giây thì số vi khuẩn lớn nhất?],
  [$1200$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số $N(t) = 1000 + 30t^2 - t^3$ với $0 <= t <= 30$. Đạo hàm $N'(t) = 60t - 3t^2$.]
    #step[*Bước 2:* Giải $N'(t) = 0 <=> 3t(20 - t) = 0 <=> t = 0$ hoặc $t = 20$.]
    #step[*Bước 3:* Lập bảng biến thiên, ta thấy $N(t)$ đạt cực đại và giá trị lớn nhất tại $t = 20$ (phút).]
    #step[*Bước 4:* Đề hỏi "sau bao nhiêu giây", ta đổi $20$ phút $= 20 times 60 = 1200$ giây.]
  ]
)

