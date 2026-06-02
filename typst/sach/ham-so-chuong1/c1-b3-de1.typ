#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#let sample(f, a, b, n: 60) = {
  let step = (b - a) / n
  range(n + 1).map(i => {
    let x = a + i * step
    (x, f(x))
  })
}

#let f-graph = cetz.canvas(length: 0.6cm, {
  import cetz.draw: *
  line((-1.2, 0), (3.5, 0), mark: (end: "stealth", scale: 0.4))
  line((0, -0.8), (0, 3.8), mark: (end: "stealth", scale: 0.4))
  content((3.3, -0.3), $x$)
  content((0.3, 3.6), $y$)
  content((-0.25, -0.25), $O$)

  for v in (1, 2) {
    line((v, 0.07), (v, -0.07))
    content((v, -0.35), text(size: 8pt)[$#v$])
  }
  for v in (1, 3) {
    line((0.07, v), (-0.07, v))
    content((-0.35, v), text(size: 8pt)[$#v$])
  }

  line((1, 0), (1, 1), stroke: (paint: gray, dash: "dashed"))
  line((0, 1), (1, 1), stroke: (paint: gray, dash: "dashed"))
  line((2, 0), (2, 3), stroke: (paint: gray, dash: "dashed"))
  line((0, 3), (2, 3), stroke: (paint: gray, dash: "dashed"))

  // Custom curve: local min at (1,1), local max at (2,3)
  // We can sample a cubic curve: h(x) = (x-1)^2 * (a*x + b) + 1
  // If h(1)=1, h'(1)=0, which is guaranteed.
  // We want h(2)=3, h'(2)=0.
  // h'(x) = 2(x-1)(ax+b) + a(x-1)^2 = (x-1)[2ax + 2b + ax - a] = (x-1)(3ax + 2b - a).
  // We need h'(2) = 0 => 6a + 2b - a = 0 => 5a + 2b = 0 => b = -2.5a.
  // h(2) = 1*(2a + b) + 1 = 3 => 2a + b = 2.
  // Substitute b: 2a - 2.5a = 2 => -0.5a = 2 => a = -4.
  // Then b = 10.
  // So h(x) = (x-1)^2 * (-4x + 10) + 1.
  let pts = sample(x => (x - 1) * (x - 1) * (-4 * x + 10) + 1, 0.2, 2.4)
  hobby(..pts, stroke: blue + 1.2pt, fill: none)
  content((2.4, 2.2), $y = f(x)$)
})

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 01]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = -x^2 + 4x + 3$ trên đoạn $[0; 3]$.],
  ([$M = 3$], [$M = 6$], True([$M = 7$]), [$M = 8$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = -2x + 4$.]
    #step[Giải $y' = 0 <=> x = 2 in [0; 3]$.]
    #step[Tính giá trị tại các điểm đầu mút và điểm tới hạn:
      $y(0) = 3$, $y(3) = 6$, $y(2) = 7$.]
    #step[So sánh các giá trị, ta được giá trị lớn nhất của hàm số là $M = 7$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = x^3 - 3x^2 + 1$ trên đoạn $[1; 3]$.],
  ([$m = -1$], True([$m = -3$]), [$m = 1$], [$m = 0$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = 3x^2 - 6x = 3x(x - 2)$.]
    #step[Giải $y' = 0 <=> x = 0$ hoặc $x = 2$. Trong đó chỉ có $x = 2 in [1; 3]$.]
    #step[Tính các giá trị: $y(1) = -1$, $y(3) = 1$, $y(2) = -3$.]
    #step[Vậy giá trị nhỏ nhất của hàm số trên đoạn đã cho là $m = -3$ (đạt được tại $x = 2$).]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = (x + 1)/(x - 1)$ trên đoạn $[2; 3]$.],
  (True([$M = 3$]), [$M = 2$], [$M = 4$], [$M = 1$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR backslash {1}$, chứa đoạn $[2; 3]$.]
    #step[Đạo hàm: $y' = -2/(x - 1)^2 < 0, forall x in [2; 3]$.]
    #step[Do đạo hàm luôn âm, hàm số nghịch biến trên đoạn $[2; 3]$.]
    #step[Vậy giá trị lớn nhất đạt tại đầu mút trái: $M = y(2) = (2 + 1)/(2 - 1) = 3$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = sqrt(4 - x^2)$ trên tập xác định của nó.],
  ([$m = -2$], True([$m = 0$]), [$m = 2$], [$m = -4$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $4 - x^2 >= 0 <=> x in [-2; 2]$.]
    #step[Vì $4 - x^2 >= 0, forall x in [-2; 2]$ nên $y = sqrt(4 - x^2) >= 0$.]
    #step[Dấu đẳng thức xảy ra khi $x = 2$ hoặc $x = -2$.]
    #step[Vậy giá trị nhỏ nhất của hàm số là $m = 0$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = x + 4/x$ trên khoảng $(0; +oo)$.],
  ([$m = 2$], True([$m = 4$]), [$m = 5$], [$m = 8$]),
  accent: c-book,
  loigiai: [
    #step[Xét hàm số $y = x + 4/x$ trên khoảng $(0; +oo)$. Đạo hàm: $y' = 1 - 4/x^2 = (x^2 - 4)/x^2$.]
    #step[Giải $y' = 0 <=> x^2 = 4 <=> x = 2$ (vì $x > 0$).]
    #step[Lập bảng biến thiên trên khoảng $(0; +oo)$, ta thấy hàm số đạt cực tiểu (cũng là giá trị nhỏ nhất) tại $x = 2$ với $y(2) = 2 + 4/2 = 4$.]
    #step[Vậy giá trị nhỏ nhất của hàm số là $m = 4$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = sin x + cos x$ trên $RR$.],
  ([$M = 1$], [$M = 2$], True([$M = sqrt(2)$]), [$M = 2sqrt(2)$]),
  accent: c-book,
  loigiai: [
    #step[Biến đổi công thức lượng giác: $y = sqrt(2) sin(x + pi/4)$.]
    #step[Vì $-1 <= sin(x + pi/4) <= 1, forall x in RR$ nên $-sqrt(2) <= y <= sqrt(2)$.]
    #step[Dấu đẳng thức đạt được khi $x + pi/4 = pi/2 + k 2pi <=> x = pi/4 + k 2pi$.]
    #step[Vậy giá trị lớn nhất của hàm số là $M = sqrt(2)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = x - ln x$ trên đoạn $[1; e]$.],
  (True([$m = 1$]), [$m = e - 1$], [$m = e$], [$m = 0$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = 1 - 1/x$.]
    #step[Giải $y' = 0 <=> x = 1 in [1; e]$.]
    #step[Tính các giá trị: $y(1) = 1 - ln 1 = 1$, $y(e) = e - ln e = e - 1$.]
    #step[Vì $e - 1 approx 1.72 > 1$, ta kết luận giá trị nhỏ nhất của hàm số trên đoạn đã cho là $m = 1$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ liên tục trên đoạn $[-2; 5]$ và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($-2$, $0$, $3$, $5$),
        d-signs: ($-$, $0$, $+$, $0$, $-$),
        v-vals: ($1$, $5$, $-3$, $2$),
      )
    ]
    Tìm giá trị nhỏ nhất $m$ của hàm số trên đoạn $[-2; 5]$.
  ],
  ([$m = 1$], [$m = 2$], True([$m = -3$]), [$m = 5$]),
  accent: c-book,
  loigiai: [
    #step[Nhìn vào hàng giá trị của $f(x)$ trên bảng biến thiên, các giá trị tại các điểm cực trị và biên là:
      $f(-2) = 1$, $f(0) = 5$, $f(3) = -3$, $f(5) = 2$.]
    #step[Giá trị nhỏ nhất trong các số này là $-3$ tại $x = 3$.]
    #step[Vậy giá trị nhỏ nhất của hàm số trên đoạn $[-2; 5]$ là $m = -3$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đồ thị như hình vẽ dưới đây:
    #align(center)[#f-graph]
    Tìm giá trị lớn nhất của hàm số $g(x) = f(x^2 - 2x + 2)$ trên đoạn $[0; 2]$.
  ],
  ([$1$], [$2$], True([$3$]), [$4$]),
  accent: c-book,
  loigiai: [
    #step[Đặt $t = x^2 - 2x + 2 = (x - 1)^2 + 1$.]
    #step[Với $x in [0; 2]$, ta có $0 <= (x - 1)^2 <= 1 => 1 <= t <= 2$.]
    #step[Do đó, bài toán quy về tìm giá trị lớn nhất của hàm số $y = f(t)$ trên đoạn $[1; 2]$.]
    #step[Quan sát đồ thị hàm số $y = f(x)$, trên đoạn $[1; 2]$, đồ thị đi lên từ điểm $(1; 1)$ đến điểm $(2; 3)$.]
    #step[Do đó, giá trị lớn nhất của hàm số trên đoạn $[1; 2]$ đạt tại $t = 2$ với giá trị $f(2) = 3$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = (x^2 + 3)/(x - 1)$ trên đoạn $[2; 4]$.],
  ([$m = 7$], True([$m = 6$]), [$m = 19/3$], [$m = 5$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = (2x(x - 1) - (x^2 + 3))/(x - 1)^2 = (x^2 - 2x - 3)/(x - 1)^2$.]
    #step[Giải $y' = 0 <=> x^2 - 2x - 3 = 0 <=> x = -1$ hoặc $x = 3$. Chỉ có $x = 3 in [2; 4]$.]
    #step[Tính các giá trị: $y(2) = 7$, $y(4) = 19/3$, $y(3) = 6$.]
    #step[So sánh các giá trị, ta thu được giá trị nhỏ nhất là $m = 6$ tại $x = 3$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị thực của tham số $m$ để giá trị lớn nhất của hàm số $y = (x + m)/(x + 1)$ trên đoạn $[0; 1]$ bằng $2$.],
  ([$m = 1$], True([$m = 2$]), [$m = 3$], [$m = 4$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = (1 - m)/(x + 1)^2$.]
    #step[Nếu $m < 1$, đạo hàm $y' > 0$, hàm số đồng biến trên $[0; 1]$, suy ra giá trị lớn nhất đạt tại $x = 1$:
      $max_([0; 1]) y = y(1) = (1 + m)/2 = 2 <=> m = 3$ (loại vì đang xét $m < 1$).]
    #step[Nếu $m > 1$, đạo hàm $y' < 0$, hàm số nghịch biến trên $[0; 1]$, suy ra giá trị lớn nhất đạt tại $x = 0$:
      $max_([0; 1]) y = y(0) = m = 2$ (thỏa mãn $m > 1$).]
    #step[Nếu $m = 1$, hàm số trở thành hằng số $y = 1$, giá trị lớn nhất bằng $1 != 2$.]
    #step[Vậy $m = 2$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất của hàm số $y = x^4 - 2x^2 + 3$ trên đoạn $[-1; 2]$.],
  ([$3$], True([$2$]), [$11$], [$0$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 4x^3 - 4x = 4x(x^2 - 1) = 0 <=> x = 0$ hoặc $x = +-1$.]
    #step[Tất cả các điểm này đều thuộc đoạn $[-1; 2]$.]
    #step[Tính các giá trị: $y(-1) = 2$, $y(0) = 3$, $y(1) = 2$, $y(2) = 11$.]
    #step[So sánh các giá trị, giá trị nhỏ nhất là $2$ đạt được tại $x = +-1$.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = sqrt(2x - x^2)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = [0; 2]$.]),
    True([Đạo hàm của hàm số là $y' = (1 - x)/sqrt(2x - x^2)$.]),
    [Giá trị lớn nhất của hàm số là $2$.],
    True([Giá trị nhỏ nhất của hàm số là $0$.]),
  ),
  accent: c-book,
  loigiai: [
    - Điều kiện xác định: $2x - x^2 >= 0 <=> x in [0; 2]$. Do đó a) Đúng.
    - Đạo hàm: $y' = (2 - 2x)/(2sqrt(2x - x^2)) = (1 - x)/sqrt(2x - x^2)$. Do đó b) Đúng.
    - Giải $y' = 0 <=> x = 1$. Tính các giá trị: $y(0) = 0$, $y(2) = 0$, $y(1) = 1$.
    - Vậy giá trị lớn nhất là $1$, c) Sai; giá trị nhỏ nhất là $0$, d) Đúng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = (x + m^2)/(x + 1)$ với $m$ là tham số thực. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Khi $m = 2$, hàm số nghịch biến trên đoạn $[0; 1]$.]),
    True([Khi $m = 0$, giá trị nhỏ nhất của hàm số trên đoạn $[0; 1]$ bằng $0$.]),
    True([Với mọi $m != 1$ và $m != -1$, hàm số luôn đơn điệu trên đoạn $[0; 1]$.]),
    [Giá trị lớn nhất của hàm số trên đoạn $[0; 1]$ không vượt quá $2$ với mọi $m$.],
  ),
  accent: c-book,
  loigiai: [
    - Đạo hàm $y' = (1 - m^2)/(x + 1)^2$.
    
    - Khi $m = 2$, $y' = -3/(x + 1)^2 < 0$ nên hàm số nghịch biến trên $[0; 1]$, a) Đúng.
    - Khi $m = 0$, $y' = 1/(x + 1)^2 > 0$ nên hàm số đồng biến, giá trị nhỏ nhất đạt tại $x = 0$ với $y(0) = 0$, b) Đúng.
    - Với mọi $m != +-1$, đạo hàm khác không và không đổi dấu trên $[0; 1]$, do đó hàm số luôn đơn điệu, c) Đúng.
    - Khi $m = 3$ (thỏa mãn $m > 1$), hàm số nghịch biến nên giá trị lớn nhất đạt tại $x = 0$ là $y(0) = m^2 = 9 > 2$. Do đó d) Sai.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $f(x) = x^3 - 3x + m$ và $g(x) = |f(x)|$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Giá trị lớn nhất của hàm số $f(x)$ trên đoạn $[0; 2]$ là $m + 2$.]),
    True([Giá trị nhỏ nhất của hàm số $f(x)$ trên đoạn $[0; 2]$ là $m - 2$.]),
    True([Khi $m = 3$, giá trị lớn nhất của hàm số $g(x)$ trên đoạn $[0; 2]$ bằng $5$.]),
    [Khi $m = 0$, giá trị nhỏ nhất của hàm số $g(x)$ trên đoạn $[0; 2]$ bằng $2$.],
  ),
  accent: c-book,
  loigiai: [
    - Đạo hàm $f'(x) = 3x^2 - 3 = 0 <=> x = 1$ trên $[0; 2]$.
    - Tính các giá trị: $f(0) = m$, $f(1) = m - 2$, $f(2) = m + 2$.
    - Do đó, giá trị lớn nhất của $f(x)$ là $m + 2$, a) Đúng; giá trị nhỏ nhất của $f(x)$ là $m - 2$, b) Đúng.
    - Khi $m = 3$, tập giá trị của $f(x)$ là $[1; 5]$ nên tập giá trị của $g(x) = |f(x)|$ là $[1; 5]$, giá trị lớn nhất bằng $5$, c) Đúng.
    - Khi $m = 0$, tập giá trị của $f(x)$ là $[-2; 2]$ nên tập giá trị của $g(x) = |f(x)|$ là $[0; 2]$, giá trị nhỏ nhất bằng $0$, d) Sai.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = f(x)$ liên tục và có bảng biến thiên trên đoạn $[-1; 3]$ như sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($-1$, $1$, $3$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($4$, $1$, $5$),
      )
    ]
    Xét hàm số $h(x) = 2f(x) - 1$. Xét tính đúng sai của các mệnh đề sau:
  ],
  (
    True([Hàm số $f(x)$ đạt cực tiểu tại $x = 1$.]),
    True([Giá trị lớn nhất của hàm số $f(x)$ trên đoạn $[-1; 3]$ bằng $5$.]),
    True([Giá trị lớn nhất của hàm số $h(x)$ trên đoạn $[-1; 3]$ bằng $9$.]),
    True([Giá trị nhỏ nhất của hàm số $h(x)$ trên đoạn $[-1; 3]$ bằng $1$.]),
  ),
  accent: c-book,
  loigiai: [
    - Từ bảng biến thiên của $f(x)$ trên $[-1; 3]$, cực tiểu đạt tại $x = 1$, a) Đúng.
    - Giá trị lớn nhất của $f(x)$ là $5$ tại $x = 3$, b) Đúng.
    - Vì $1 <= f(x) <= 5, forall x in [-1; 3]$ nên $2(1) - 1 <= 2f(x) - 1 <= 2(5) - 1 <=> 1 <= h(x) <= 9$.
    - Do đó, giá trị lớn nhất của $h(x)$ là $9$ và giá trị nhỏ nhất của $h(x)$ là $1$. Vậy c) Đúng, d) Đúng.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "ngang", tln(
  [Tìm tổng giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = x^3 - 3x$ trên đoạn $[0; 2]$.],
  [$0$],
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm $y' = 3x^2 - 3 = 0 <=> x = 1$ (do $x in [0; 2]$).]
    #step[Tính các giá trị: $y(0) = 0$, $y(1) = -2$, $y(2) = 2$.]
    #step[Suy ra giá trị lớn nhất là $2$, giá trị nhỏ nhất là $-2$.]
    #step[Tổng của chúng là $2 + (-2) = 0$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị lớn nhất của hàm số $y = cos x + sqrt(3) sin x$ trên đoạn $[0; pi]$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Biến đổi hàm số: $y = 2 sin(x + pi/6)$.]
    #step[Với $x in [0; pi] => x + pi/6 in [pi/6; 7pi/6]$.]
    #step[Trên đoạn $[pi/6; 7pi/6]$, giá trị lớn nhất của $sin(x + pi/6)$ đạt được khi $x + pi/6 = pi/2 <=> x = pi/3$ (thỏa mãn).]
    #step[Khi đó, giá trị lớn nhất là $2 dot.c 1 = 2$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị thực dương của tham số $m$ để giá trị lớn nhất của hàm số $y = |x^2 - 2x + m|$ trên đoạn $[0; 3]$ bằng $5$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Đặt $f(x) = x^2 - 2x + m$. Trên đoạn $[0; 3]$, $f'(x) = 2x - 2 = 0 <=> x = 1$.]
    #step[Tính các giá trị: $f(0) = m$, $f(1) = m - 1$, $f(3) = m + 3$.]
    #step[Với $m > 0$, ta có $m + 3 > m - 1$ và $m + 3 > 0$. Tập giá trị của $f(x)$ là $[m - 1; m + 3]$.]
    #step[Suy ra giá trị lớn nhất của $|f(x)|$ là $max({|m - 1|; m + 3}) = m + 3$ (vì $m + 3 > |m - 1|$ với mọi $m > 0$).]
    #step[Cho $m + 3 = 5 <=> m = 2$ (thỏa mãn $m > 0$).]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị nhỏ nhất của hàm số $y = 2x + 8/x$ trên khoảng $(0; +oo)$.],
  [$8$],
  accent: c-book,
  loigiai: [
    #step[Xét hàm số $y = 2x + 8/x$ trên khoảng $(0; +oo)$. Đạo hàm: $y' = 2 - 8/x^2 = (2(x^2 - 4))/x^2$.]
    #step[Giải $y' = 0 <=> x^2 = 4 <=> x = 2$ (vì $x > 0$).]
    #step[Lập bảng biến thiên trên $(0; +oo)$, ta thấy hàm số đạt cực tiểu (cũng là giá trị nhỏ nhất) tại $x = 2$.]
    #step[Giá trị nhỏ nhất là $y(2) = 2(2) + 8/2 = 8$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $1$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $3$, $+oo$),
      )
    ]
    Tìm giá trị nhỏ nhất của hàm số $g(x) = f(x^2 - 2x + 2)$.
  ],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Đặt $t = x^2 - 2x + 2 = (x - 1)^2 + 1 >= 1$.]
    #step[Do đó, bài toán quy về tìm giá trị nhỏ nhất của hàm số $y = f(t)$ với $t >= 1$.]
    #step[Dựa vào bảng biến thiên của $f(x)$, trên nửa khoảng $[1; +oo)$, hàm số luôn đồng biến đi từ $f(1) = 3$ lên $+oo$.]
    #step[Do đó, giá trị nhỏ nhất của $f(t)$ trên $[1; +oo)$ đạt tại $t = 1$ với giá trị bằng $3$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một tấm bìa hình vuông cạnh $12$ cm. Người ta cắt bỏ đi bốn hình vuông nhỏ bằng nhau có cạnh bằng $x$ (cm) ở bốn góc rồi gập các mép bìa lên để được một chiếc hộp không nắp. Tìm giá trị của $x$ (cm) để chiếc hộp thu được có thể tích lớn nhất.
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        let s = 4.0
        let c = 0.8
        // Border lines
        line((c, 0), (s - c, 0), stroke: 1pt + black)
        line((s, c), (s, s - c), stroke: 1pt + black)
        line((s - c, s), (c, s), stroke: 1pt + black)
        line((0, s - c), (0, c), stroke: 1pt + black)
        // Cuts
        line((0, c), (c, c), stroke: 1.2pt + red)
        line((c, c), (c, 0), stroke: 1.2pt + red)
        line((s - c, 0), (s - c, c), stroke: 1.2pt + red)
        line((s - c, c), (s, c), stroke: 1.2pt + red)
        line((s, s - c), (s - c, s - c), stroke: 1.2pt + red)
        line((s - c, s - c), (s - c, s), stroke: 1.2pt + red)
        line((c, s), (c, s - c), stroke: 1.2pt + red)
        line((c, s - c), (0, s - c), stroke: 1.2pt + red)
        // Folds
        line((c, c), (s - c, c), stroke: (paint: gray, dash: "dashed"))
        line((s - c, c), (s - c, s - c), stroke: (paint: gray, dash: "dashed"))
        line((s - c, s - c), (c, s - c), stroke: (paint: gray, dash: "dashed"))
        line((c, s - c), (c, c), stroke: (paint: gray, dash: "dashed"))
        // Labels
        line((0, -0.3), (s, -0.3), mark: (start: "stealth", end: "stealth", scale: 0.4))
        content((s/2, -0.6), text(size: 9pt)[$12$ cm])
        content((c/2, c + 0.25), text(size: 8pt, fill: red)[$x$])
        content((c + 0.25, c/2), text(size: 8pt, fill: red)[$x$])
      })
    ]
  ],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Khi cắt bỏ bốn góc và gấp lên, đáy hộp là hình vuông cạnh $12 - 2x$ (cm), chiều cao hộp là $x$ (cm).]
    #step[Điều kiện xác định: $x > 0$ và $12 - 2x > 0 <=> 0 < x < 6$.]
    #step[Thể tích hộp: $V(x) = x(12 - 2x)^2 = 4x(6 - x)^2 = 4x^3 - 48x^2 + 144x$ (cm³).]
    #step[Xét đạo hàm: $V'(x) = 12x^2 - 96x + 144 = 0 <=> x = 2$ hoặc $x = 6$ (loại).]
    #step[Lập bảng biến thiên trên khoảng $(0; 6)$, thể tích $V(x)$ đạt cực đại (cũng là giá trị lớn nhất) tại $x = 2$.]
    #step[Vậy thể tích hộp lớn nhất khi $x = 2$ cm.]
  ],
))
