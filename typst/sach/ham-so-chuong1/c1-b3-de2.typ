#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 02]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = -x^3 + 3x + 4$ trên đoạn $[0; 2]$.],
  ([$M = 4$], True([$M = 6$]), [$M = 2$], [$M = 8$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = -3x^2 + 3$.]
    #step[Giải $y' = 0 <=> x^2 = 1 <=> x = 1$ hoặc $x = -1$. Chỉ có $x = 1 in [0; 2]$.]
    #step[Tính các giá trị: $y(0) = 4$, $y(2) = 2$, $y(1) = 6$.]
    #step[Vậy giá trị lớn nhất của hàm số là $M = 6$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = (x^2 + 4)/x$ trên đoạn $[1; 3]$.],
  ([$m = 5$], True([$m = 4$]), [$m = 13/3$], [$m = 2$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = 1 - 4/x^2$.]
    #step[Giải $y' = 0 <=> x^2 = 4 <=> x = 2$ (do $x in [1; 3]$).]
    #step[Tính các giá trị: $y(1) = 5$, $y(3) = 13/3$, $y(2) = 4$.]
    #step[So sánh, ta có giá trị nhỏ nhất là $m = 4$ tại $x = 2$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = x + sqrt(4 - x^2)$ trên đoạn $[-2; 2]$.],
  ([$M = 2$], [$M = 2sqrt(3)$], True([$M = 2sqrt(2)$]), [$M = 4$]),
  accent: c-book,
  loigiai: [
    #step[Hàm số liên tục trên $[-2; 2]$. Đạo hàm: $y' = 1 - x/sqrt(4 - x^2)$ với $x in (-2; 2)$.]
    #step[Giải $y' = 0 <=> sqrt(4 - x^2) = x <=> x >= 0$ và $4 - x^2 = x^2 <=> x = sqrt(2)$.]
    #step[Tính các giá trị: $y(-2) = -2$, $y(2) = 2$, $y(sqrt(2)) = sqrt(2) + sqrt(2) = 2sqrt(2)$.]
    #step[Vậy giá trị lớn nhất của hàm số là $M = 2sqrt(2)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = sin^4 x + cos^4 x$ trên $RR$.],
  ([$m = 0$], True([$m = 1/2$]), [$m = 1/4$], [$m = 1$]),
  accent: c-book,
  loigiai: [
    #step[Biến đổi: $y = (sin^2 x + cos^2 x)^2 - 2 sin^2 x cos^2 x = 1 - 1/2 sin^2 2x$.]
    #step[Vì $0 <= sin^2 2x <= 1$ nên $1 - 1/2 dot.c 1 <= y <= 1 - 1/2 dot.c 0 <=> 1/2 <= y <= 1$.]
    #step[Vậy giá trị nhỏ nhất của hàm số là $m = 1/2$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất của hàm số $y = x^2 e^(-x)$ trên đoạn $[1; 3]$.],
  ([$e^(-1)$], True([$4e^(-2)$]), [$9e^(-3)$], [$e^(-2)$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 2x e^(-x) - x^2 e^(-x) = x(2 - x)e^(-x)$.]
    #step[Giải $y' = 0 <=> x = 2$ (do $x in [1; 3]$).]
    #step[Tính các giá trị: $y(1) = 1/e$, $y(3) = 9/e^3$, $y(2) = 4/e^2$.]
    #step[So sánh các giá trị, giá trị lớn nhất là $4/e^2 = 4e^(-2)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị của tham số $m$ để giá trị nhỏ nhất của hàm số $y = (x + m)/(x - 1)$ trên đoạn $[2; 3]$ bằng $-2$.],
  ([$m = -7$], True([$m = -4$]), [$m = 2$], [$m = -2$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = (-1 - m)/(x - 1)^2$.]
    #step[Trường hợp 1: $-1 - m > 0 <=> m < -1$. Đạo hàm $y' > 0$, hàm số đồng biến trên $[2; 3]$.
      Khi đó giá trị nhỏ nhất là $y(2) = 2 + m = -2 <=> m = -4$ (thỏa mãn $m < -1$).]
    #step[Trường hợp 2: $-1 - m < 0 <=> m > -1$. Đạo hàm $y' < 0$, hàm số nghịch biến trên $[2; 3]$.
      Khi đó giá trị nhỏ nhất là $y(3) = (3 + m)/2 = -2 <=> m = -7$ (loại vì $m > -1$).]
    #step[Vậy $m = -4$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = ln(x^2 + 1) - x$ trên đoạn $[0; 1]$.],
  (True([$M = 0$]), [$M = ln 2 - 1$], [$M = 1$], [$M = -1$]),
  accent: c-book,
  loigiai: [
    #step[Hàm số liên tục trên $[0; 1]$. Đạo hàm: $y' = 2x/(x^2 + 1) - 1 = -(x - 1)^2/(x^2 + 1) <= 0, forall x in [0; 1]$.]
    #step[Hàm số nghịch biến trên $[0; 1]$.]
    #step[Vậy giá trị lớn nhất của hàm số là $M = y(0) = ln 1 - 0 = 0$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ liên tục trên đoạn $[-2; 2]$ có đạo hàm $f'(x)$ thỏa mãn $f'(x) = 0 <=> x = -1$ hoặc $x = 1$. Biết rằng $f'(x) > 0$ với $x in (-2; -1) union (1; 2)$ và $f'(x) < 0$ với $x in (-1; 1)$. Hỏi giá trị lớn nhất của hàm số $f(x)$ trên đoạn $[-2; 1]$ đạt được tại điểm nào?],
  (True([$x = -1$]), [$x = -2$], [$x = 1$], [$x = 0$]),
  accent: c-book,
  loigiai: [
    #step[Trên đoạn $[-2; 1]$, đạo hàm $f'(x)$ đổi dấu từ dương sang âm khi đi qua $x = -1$.]
    #step[Do đó, hàm số đồng biến trên $[-2; -1]$ và nghịch biến trên $[-1; 1]$.]
    #step[Suy ra giá trị lớn nhất của hàm số trên đoạn $[-2; 1]$ đạt tại $x = -1$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $f(x)$ liên tục trên $RR$ và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($1$, $3$, $5$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($10$, $2$, $8$),
      )
    ]
    Tìm giá trị lớn nhất của hàm số $g(x) = f(3 - 2 sin x)$.
  ],
  (True([$10$]), [$2$], [$8$], [$5$]),
  accent: c-book,
  loigiai: [
    #step[Đặt $t = 3 - 2 sin x$. Vì $-1 <= sin x <= 1$ nên $-2 <= -2 sin x <= 2 <=> 1 <= 3 - 2 sin x <= 5$.]
    #step[Do đó, bài toán quy về tìm giá trị lớn nhất của hàm số $y = f(t)$ trên đoạn $[1; 5]$.]
    #step[Dựa vào bảng biến thiên của $f(x)$, trên đoạn $[1; 5]$, giá trị lớn nhất của hàm số là $10$ (đạt được tại $t = 1$).]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = x^5 - 5x^4 + 5x^3 - 1$ trên đoạn $[-1; 2]$.],
  (True([$M = 0$]), [$M = -1$], [$M = -9$], [$M = -12$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 5x^4 - 20x^3 + 15x^2 = 5x^2(x^2 - 4x + 3)$.]
    #step[Giải $y' = 0 <=> x = 0$ (nghiệm kép), $x = 1$, $x = 3$ (loại vì $3 not in [-1; 2]$).]
    #step[Tính các giá trị: $y(-1) = -12$, $y(0) = -1$, $y(1) = 0$, $y(2) = -9$.]
    #step[So sánh các giá trị, ta có giá trị lớn nhất là $M = 0$ tại $x = 1$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = x + sqrt(2 - x^2)$ trên tập xác định của nó.],
  (True([$m = -sqrt(2)$]), [$m = -2$], [$m = sqrt(2)$], [$m = 2$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $2 - x^2 >= 0 <=> x in [-sqrt(2); sqrt(2)]$.]
    #step[Tính đạo hàm: $y' = 1 - x/sqrt(2 - x^2) = 0 <=> x = 1$ (do $x in [-sqrt(2); sqrt(2)]$).]
    #step[Tính các giá trị: $y(-sqrt(2)) = -sqrt(2)$, $y(sqrt(2)) = sqrt(2)$, $y(1) = 2$.]
    #step[So sánh các giá trị, giá trị nhỏ nhất là $m = -sqrt(2)$ tại $x = -sqrt(2)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = (2x^2 + 3x + 3)/(x + 1)$ trên đoạn $[0; 2]$.],
  ([$M = 3$], [$M = 5$], True([$M = 17/3$]), [$M = 6$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = ((4x + 3)(x + 1) - (2x^2 + 3x + 3))/(x + 1)^2 = (2x^2 + 4x)/(x + 1)^2$.]
    #step[Với $x in [0; 2]$, ta thấy $y' >= 0$ (đẳng thức tại $x = 0$). Hàm số đồng biến trên $[0; 2]$.]
    #step[Do đó, giá trị lớn nhất đạt được tại $x = 2$: $M = y(2) = (2(4) + 3(2) + 3)/(2 + 1) = 17/3$.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = x - sqrt(4 - x^2)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = [-2; 2]$.]),
    True([Giá trị lớn nhất của hàm số trên đoạn $[-2; 2]$ bằng $2$.]),
    [Giá trị nhỏ nhất của hàm số trên đoạn $[-2; 2]$ bằng $-2$.],
    True([Đạo hàm của hàm số trên khoảng $(-2; 2)$ là $y' = 1 + x/sqrt(4 - x^2)$.]),
  ),
  accent: c-book,
  loigiai: [
    - Điều kiện xác định: $4 - x^2 >= 0 <=> x in [-2; 2]$, a) Đúng.
    
    - Đạo hàm: $y' = 1 - (-2x)/(2sqrt(4 - x^2)) = 1 + x/sqrt(4 - x^2)$, d) Đúng.
    - Giải $y' = 0 <=> sqrt(4 - x^2) = -x <=> x <= 0$ và $4 - x^2 = x^2 <=> x = -sqrt(2)$.
    - Tính các giá trị: $y(-2) = -2$, $y(2) = 2$, $y(-sqrt(2)) = -2sqrt(2)$.
    - Vậy giá trị lớn nhất là $2$ (tại $x=2$), b) Đúng; giá trị nhỏ nhất là $-2sqrt(2)$, c) Sai.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $f(x) = x^3 - 3x^2 + m$ với $m$ là tham số thực. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Giá trị lớn nhất của hàm số trên đoạn $[0; 3]$ bằng $m$.]),
    True([Giá trị nhỏ nhất của hàm số trên đoạn $[0; 3]$ bằng $m - 4$.]),
    True([Nếu $m = 5$, giá trị lớn nhất của hàm số trên đoạn $[0; 3]$ bằng $5$.]),
    [Không tồn tại giá trị nào của $m$ để giá trị nhỏ nhất của hàm số trên đoạn $[0; 3]$ bằng $0$.],
  ),
  accent: c-book,
  loigiai: [
    - Đạo hàm $f'(x) = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$ trên $[0; 3]$.
    - Tính các giá trị: $f(0) = m$, $f(2) = m - 4$, $f(3) = m$.
    - Do đó, giá trị lớn nhất là $m$, a) Đúng; giá trị nhỏ nhất là $m - 4$, b) Đúng.
    - Nếu $m = 5$, giá trị lớn nhất là $5$, c) Đúng.
    - Giá trị nhỏ nhất bằng $0 <=> m - 4 = 0 <=> m = 4$, do đó d) Sai.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = cos^2 x + 2 sin x + 2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Đặt $t = sin x$, ta có $t in [-1; 1]$.]),
    True([Hàm số có giá trị lớn nhất bằng $4$.]),
    [Hàm số có giá trị nhỏ nhất bằng $3$.],
    True([Tập giá trị của hàm số là $[0; 4]$.]),
  ),
  accent: c-book,
  loigiai: [
    - Đặt $t = sin x$, do $x in RR$ nên $t in [-1; 1]$, a) Đúng.
    - Biến đổi hàm số theo $t$: $f(t) = 1 - t^2 + 2t + 2 = -t^2 + 2t + 3$.
    - Khảo sát $f(t)$ trên $[-1; 1]$: $f'(t) = -2t + 2 = 0 <=> t = 1 in [-1; 1]$.
    - Tính các giá trị: $f(-1) = 0$, $f(1) = 4$.
    - Do đó giá trị lớn nhất là $4$, b) Đúng; giá trị nhỏ nhất là $0$, c) Sai.
    - Tập giá trị của hàm số là $[0; 4]$, d) Đúng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = (m x - 1)/(x + m)$ với $m$ là tham số thực dương. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Với mọi $m > 0$, hàm số luôn đồng biến trên đoạn $[0; 1]$.]),
    True([Với mọi $m > 0$, giá trị nhỏ nhất của hàm số trên đoạn $[0; 1]$ là $-1/m$.]),
    True([Với mọi $m > 0$, giá trị lớn nhất của hàm số trên đoạn $[0; 1]$ là $(m - 1)/(m + 1)$.]),
    True([Nếu giá trị lớn nhất của hàm số trên đoạn $[0; 1]$ bằng $1/3$ thì $m = 2$.]),
  ),
  accent: c-book,
  loigiai: [
    - Đạo hàm: $y' = (m^2 + 1)/(x + m)^2 > 0, forall x in [0; 1]$ (vì $m > 0$). Do đó hàm số luôn đồng biến trên $[0; 1]$, a) Đúng.
    - Giá trị nhỏ nhất là $y(0) = -1/m$, b) Đúng.
    - Giá trị lớn nhất là $y(1) = (m - 1)/(m + 1)$, c) Đúng.
    - Giá trị lớn nhất bằng $1/3 <=> (m - 1)/(m + 1) = 1/3 <=> 3m - 3 = m + 1 <=> 2m = 4 <=> m = 2$ (thỏa mãn $m > 0$). Do đó d) Đúng.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "ngang", tln(
  [Tìm tổng giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = (2x + 1)/(x - 1)$ trên đoạn $[2; 4]$.],
  [$8$],
  accent: c-book,
  loigiai: [
    #step[Hàm số liên tục trên $[2; 4]$. Đạo hàm: $y' = -3/(x - 1)^2 < 0, forall x in [2; 4]$.]
    #step[Do đó, hàm số nghịch biến trên $[2; 4]$.]
    #step[Giá trị lớn nhất: $M = y(2) = 5$.]
    #step[Giá trị nhỏ nhất: $m = y(4) = 3$.]
    #step[Tổng giá trị lớn nhất và nhỏ nhất là $5 + 3 = 8$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $g(x) = |x^3 - 3x + 5|$. Tìm giá trị nhỏ nhất của hàm số $g(x)$ trên đoạn $[0; 2]$.],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Xét hàm số $f(x) = x^3 - 3x + 5$ trên $[0; 2]$. Đạo hàm $f'(x) = 3x^2 - 3 = 0 <=> x = 1$.]
    #step[Tính các giá trị: $f(0) = 5$, $f(1) = 3$, $f(2) = 7$.]
    #step[Tập giá trị của $f(x)$ trên $[0; 2]$ là $[3; 7]$.]
    #step[Do đó, giá trị nhỏ nhất của $g(x) = |f(x)|$ trên $[0; 2]$ là $3$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị thực của tham số $m$ để giá trị nhỏ nhất của hàm số $y = x^3 - 3x^2 + m$ trên đoạn $[0; 3]$ bằng $2$.],
  [$6$],
  accent: c-book,
  loigiai: [
    #step[Đạo hàm $y' = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$ trên $[0; 3]$.]
    #step[Tính các giá trị: $y(0) = m$, $y(2) = m - 4$, $y(3) = m$.]
    #step[Giá trị nhỏ nhất của hàm số trên đoạn $[0; 3]$ là $m - 4$.]
    #step[Cho $m - 4 = 2 <=> m = 6$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một người nông dân muốn rào một khu vườn hình chữ nhật sát một bức tường gạch thẳng có sẵn. Người đó có $40$ mét lưới thép và chỉ cần rào ba bên (bên sát tường gạch không phải rào). Tìm diện tích lớn nhất (theo $m^2$) của khu vườn hình chữ nhật thu được.],
  [$200$],
  accent: c-book,
  loigiai: [
    #step[Gọi chiều rộng của khu vườn (cạnh vuông góc với bức tường) là $x$ (mét), điều kiện $0 < x < 20$.]
    #step[Khi đó, chiều dài khu vườn (cạnh song song với bức tường) là $40 - 2x$ (mét).]
    #step[Diện tích khu vườn là: $S(x) = x(40 - 2x) = 40x - 2x^2$ ($m^2$).]
    #step[Xét đạo hàm: $S'(x) = 40 - 4x = 0 <=> x = 10$ (thỏa mãn).]
    #step[Lập bảng biến thiên trên $(0; 20)$, diện tích $S(x)$ đạt giá trị lớn nhất tại $x = 10$ với $S(10) = 200$ $m^2$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị nhỏ nhất của hàm số $y = sqrt(x^2 - 4x + 5)$ trên đoạn $[0; 3]$.],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Đặt $f(x) = x^2 - 4x + 5 = (x - 2)^2 + 1 >= 1$.]
    #step[Hàm số $y = sqrt(f(x))$ đạt giá trị nhỏ nhất khi $f(x)$ nhỏ nhất.]
    #step[Trên đoạn $[0; 3]$, điểm $x = 2$ thuộc đoạn, nên giá trị nhỏ nhất của $f(x)$ là $f(2) = 1$.]
    #step[Vậy giá trị nhỏ nhất của hàm số là $sqrt(1) = 1$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một công ty cần sản xuất một bể chứa nước hình trụ có thể tích chứa được $16 pi$ $m^3$. Tìm bán kính đáy $r$ (mét) của hình trụ để diện tích toàn phần của bể chứa là nhỏ nhất.
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        circle((0, 0), radius: (1.2, 0.4), stroke: 1pt + black)
        circle((0, 2), radius: (1.2, 0.4), stroke: 1pt + black)
        line((-1.2, 0), (-1.2, 2), stroke: 1pt + black)
        line((1.2, 0), (1.2, 2), stroke: 1pt + black)
        line((0, 0), (1.2, 0), stroke: (paint: gray, dash: "dashed"))
        content((0.6, 0.25), text(size: 8pt)[$r$])
        line((0, 0), (0, 2), stroke: (paint: gray, dash: "dashed"))
        content((-0.25, 1), text(size: 8pt)[$h$])
      })
    ]
  ],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Thể tích bể chứa: $V = pi r^2 h = 16 pi => h = 16/r^2$ (mét), với $r > 0$.]
    #step[Diện tích toàn phần của bể trụ (gồm cả nắp): $S_"tp" = 2 pi r^2 + 2 pi r h = 2 pi r^2 + 2 pi r (16/r^2) = 2 pi (r^2 + 16/r)$ ($m^2$).]
    #step[Khảo sát hàm số $f(r) = r^2 + 16/r$ trên khoảng $(0; +oo)$: $f'(r) = 2r - 16/r^2 = 2(r^3 - 8)/r^2 = 0 <=> r = 2$.]
    #step[Lập bảng biến thiên trên $(0; +oo)$, ta thấy $f(r)$ đạt cực tiểu (cũng là nhỏ nhất) tại $r = 2$.]
    #step[Vậy để diện tích toàn phần nhỏ nhất thì bán kính đáy của hình trụ bằng $2$ mét.]
  ],
))
