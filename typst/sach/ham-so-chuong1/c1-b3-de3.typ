#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 03]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = x^4 - 4x^2 + 5$ trên đoạn $[-1; 2]$.],
  ([$M = 1$], [$M = 2$], True([$M = 5$]), [$M = 6$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 4x^3 - 8x = 4x(x^2 - 2)$.]
    #step[Giải $y' = 0 <=> x = 0$ hoặc $x = +-sqrt(2)$.
      Trong đó, $0$ và $sqrt(2)$ thuộc đoạn $[-1; 2]$; còn $-sqrt(2) approx -1.41 not in [-1; 2]$.]
    #step[Tính các giá trị: $y(-1) = 2$, $y(0) = 5$, $y(sqrt(2)) = 1$, $y(2) = 5$.]
    #step[So sánh các giá trị, ta có giá trị lớn nhất của hàm số là $M = 5$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = x + 9/x$ trên khoảng $(0; +oo)$.],
  ([$m = 3$], True([$m = 6$]), [$m = 9$], [$m = 5$]),
  accent: c-book,
  loigiai: [
    #step[Xét hàm số $y = x + 9/x$ trên khoảng $(0; +oo)$. Đạo hàm: $y' = 1 - 9/x^2 = (x^2 - 9)/x^2$.]
    #step[Giải $y' = 0 <=> x^2 = 9 <=> x = 3$ (vì $x > 0$).]
    #step[Lập bảng biến thiên trên khoảng $(0; +oo)$, ta thấy hàm số đạt cực tiểu (cũng là giá trị nhỏ nhất) tại $x = 3$.]
    #step[Giá trị nhỏ nhất là $y(3) = 3 + 9/3 = 6$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = x + sqrt(9 - x^2)$ trên đoạn $[-3; 3]$.],
  ([$M = 3$], [$M = 3sqrt(3)$], True([$M = 3sqrt(2)$]), [$M = 6$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = 1 - x/sqrt(9 - x^2)$ với $x in (-3; 3)$.]
    #step[Giải $y' = 0 <=> sqrt(9 - x^2) = x <=> x >= 0$ và $9 - x^2 = x^2 <=> x = 3/sqrt(2)$.]
    #step[Tính các giá trị: $y(-3) = -3$, $y(3) = 3$, $y(3/sqrt(2)) = 3/sqrt(2) + 3/sqrt(2) = 3sqrt(2)$.]
    #step[Vậy giá trị lớn nhất của hàm số là $M = 3sqrt(2)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = x^2 - 4 ln(1 - x)$ trên đoạn $[-1; 0]$.],
  (True([$m = 1 - 4 ln 2$]), [$m = 0$], [$m = 2 - 4 ln 2$], [$m = 1$]),
  accent: c-book,
  loigiai: [
    #step[Hàm số liên tục trên $[-1; 0]$. Đạo hàm:
      $y' = 2x + 4/(1 - x) = (-2x^2 + 2x + 4)/(1 - x) = (-2(x + 1)(x - 2))/(1 - x)$.]
    #step[Với mọi $x in [-1; 0]$, ta có $x + 1 >= 0$, $x - 2 < 0$, $1 - x > 0$ nên $y' >= 0$.]
    #step[Hàm số đồng biến trên $[-1; 0]$.]
    #step[Giá trị nhỏ nhất đạt tại $x = -1$: $m = y(-1) = 1 - 4 ln 2$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = 3 sin x - 4 sin^3 x$ trên đoạn $[0; pi]$.],
  (True([$M = 1$]), [$M = 3$], [$M = 0$], [$M = 2$]),
  accent: c-book,
  loigiai: [
    #step[Nhận xét: $y = 3 sin x - 4 sin^3 x = sin 3x$.]
    #step[Với $x in [0; pi] => 3x in [0; 3pi]$.]
    #step[Trên đoạn $[0; 3pi]$, giá trị lớn nhất của hàm số lượng giác $sin 3x$ bằng $1$ (ví dụ tại $3x = pi/2 <=> x = pi/6$).]
    #step[Vậy giá trị lớn nhất của hàm số là $M = 1$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm tất cả các giá trị thực của tham số $m$ để giá trị lớn nhất của hàm số $y = (x - m^2)/(x + 8)$ trên đoạn $[0; 3]$ bằng $-2$.],
  ([$m = +-sqrt(5)$], True([$m = +-5$]), [$m = +-2$], [$m = +-3$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = (8 + m^2)/(x + 8)^2 > 0$ với mọi $x in [0; 3]$.]
    #step[Do đó hàm số luôn đồng biến trên đoạn $[0; 3]$.]
    #step[Giá trị lớn nhất đạt tại đầu mút $x = 3$: $y(3) = (3 - m^2)/11$.]
    #step[Cho $(3 - m^2)/11 = -2 <=> 3 - m^2 = -22 <=> m^2 = 25 <=> m = +-5$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = sqrt(x^2 + 2x + 5)$ trên đoạn $[-2; 1]$.],
  (True([$m = 2$]), [$m = sqrt(5)$], [$m = sqrt(8)$], [$m = 0$]),
  accent: c-book,
  loigiai: [
    #step[Biến đổi biểu thức trong căn: $x^2 + 2x + 5 = (x + 1)^2 + 4 >= 4$.]
    #step[Do đó $y = sqrt((x + 1)^2 + 4) >= sqrt(4) = 2$.]
    #step[Đẳng thức xảy ra khi $x = -1$. Do $-1 in [-2; 1]$ nên giá trị nhỏ nhất của hàm số là $m = 2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ liên tục trên đoạn $[1; 5]$ có đạo hàm $f'(x)$ thỏa mãn $f'(x) = 0 <=> x = 3$. Biết rằng $f'(x) < 0$ với $x in (1; 3)$ và $f'(x) > 0$ với $x in (3; 5)$. Hỏi giá trị nhỏ nhất của hàm số $f(x)$ trên đoạn $[1; 5]$ đạt được tại điểm nào?],
  ([$x = 1$], [$x = 5$], True([$x = 3$]), [$x = 2$]),
  accent: c-book,
  loigiai: [
    #step[Từ giả thiết, đạo hàm $f'(x)$ mang dấu âm trên $(1; 3)$ và dấu dương trên $(3; 5)$.]
    #step[Suy ra hàm số nghịch biến trên $[1; 3]$ và đồng biến trên $[3; 5]$.]
    #step[Do đó, trên đoạn $[1; 5]$, giá trị nhỏ nhất của hàm số đạt được tại điểm cực tiểu $x = 3$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $f(x)$ liên tục trên $RR$ và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($-1$, $0$, $3$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($1$, $4$, $2$),
      )
    ]
    Tìm giá trị lớn nhất của hàm số $g(x) = f(2 sin 2x + 1)$.
  ],
  ([$1$], True([$4$]), [$2$], [$3$]),
  accent: c-book,
  loigiai: [
    #step[Đặt $t = 2 sin 2x + 1$. Vì $-1 <= sin 2x <= 1$ nên $-2 <= 2 sin 2x <= 2 <=> -1 <= 2 sin 2x + 1 <= 3$.]
    #step[Do đó, bài toán quy về tìm giá trị lớn nhất của hàm số $y = f(t)$ trên đoạn $[-1; 3]$.]
    #step[Dựa vào bảng biến thiên của $f(x)$, trên đoạn $[-1; 3]$, giá trị lớn nhất của hàm số là $4$ (đạt được tại $t = 0$).]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = x^3 - 3x^2 - 9x + 5$ trên đoạn $[-2; 2]$.],
  ([$m = 3$], [$m = 10$], True([$m = -17$]), [$m = -22$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 3x^2 - 6x - 9$.]
    #step[Giải $y' = 0 <=> x = -1$ hoặc $x = 3$. Chỉ có $x = -1 in [-2; 2]$.]
    #step[Tính các giá trị: $y(-2) = 3$, $y(-1) = 10$, $y(2) = -17$.]
    #step[So sánh các giá trị, giá trị nhỏ nhất của hàm số trên đoạn đã cho là $m = -17$ tại $x = 2$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị lớn nhất $M$ của hàm số $y = ln x + 2/x$ trên đoạn $[1; e]$.],
  (True([$M = 2$]), [$M = ln 2 + 1$], [$M = 1 + 2/e$], [$M = 3$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 1/x - 2/x^2 = (x - 2)/x^2$.]
    #step[Giải $y' = 0 <=> x = 2 in [1; e]$.]
    #step[Tính các giá trị: $y(1) = 2$, $y(2) = ln 2 + 1 approx 1.69$, $y(e) = 1 + 2/e approx 1.73$.]
    #step[So sánh các giá trị, giá trị lớn nhất của hàm số trên đoạn đã cho là $M = 2$ tại $x = 1$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị nhỏ nhất $m$ của hàm số $y = (x^2 + 5)/(x - 2)$ trên đoạn $[3; 5]$.],
  ([$m = 14$], True([$m = 10$]), [$m = 15/2$], [$m = 8$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = (2x(x - 2) - (x^2 + 5))/(x - 2)^2 = (x^2 - 4x - 5)/(x - 2)^2$.]
    #step[Giải $y' = 0 <=> x^2 - 4x - 5 = 0 <=> x = 5$ hoặc $x = -1$. Chỉ có $x = 5 in [3; 5]$.]
    #step[Hàm số nghịch biến trên khoảng $(3; 5)$ và đạt cực tiểu tại $x = 5$.]
    #step[Tính giá trị tại hai biên: $y(3) = 14$, $y(5) = 10$.]
    #step[Vậy giá trị nhỏ nhất là $m = 10$ tại $x = 5$.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = x^2 - ln(1 - 2x)$ trên đoạn $[-1; 0]$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Đạo hàm của hàm số trên khoảng $(-1; 0)$ là $y' = 2x + 2/(1 - 2x)$.]),
    True([Hàm số nghịch biến trên khoảng $(-1; -1/2)$ và đồng biến trên khoảng $(-1/2; 0)$.]),
    True([Giá trị lớn nhất của hàm số trên đoạn $[-1; 0]$ bằng $0$.]),
    [Giá trị nhỏ nhất của hàm số trên đoạn $[-1; 0]$ bằng $1 - ln 3$.],
  ),
  accent: c-book,
  loigiai: [
    - Đạo hàm: $y' = 2x - (-2)/(1 - 2x) = 2x + 2/(1 - 2x)$, a) Đúng.
    
    - Quy đồng đạo hàm: $y' = (-4x^2 + 2x + 2)/(1 - 2x) = (-2(2x + 1)(x - 1))/(1 - 2x)$.
    - Trên $[-1; 0]$, $y' = 0 <=> x = -1/2$. Ta có $y' < 0$ trên $(-1; -1/2)$ và $y' > 0$ trên $(-1/2; 0)$. Do đó b) Đúng.
    - Tính các giá trị: $y(-1) = 1 - ln 3 approx -0.1$, $y(-1/2) = 1/4 - ln 2 approx -0.44$, $y(0) = 0$.
    - Vậy giá trị lớn nhất là $0$ (tại $x=0$), c) Đúng; giá trị nhỏ nhất là $1/4 - ln 2$, d) Sai.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = (x - m^2)/(x + 1)$ với $m$ là tham số thực. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số luôn đồng biến trên đoạn $[0; 2]$ với mọi giá trị của $m$.]),
    True([Giá trị nhỏ nhất của hàm số trên đoạn $[0; 2]$ là $-m^2$.]),
    True([Giá trị lớn nhất của hàm số trên đoạn $[0; 2]$ bằng $0$ khi $m = +-sqrt(2)$.]),
    True([Nếu giá trị lớn nhất của hàm số trên đoạn $[0; 2]$ bằng $-1$ thì $m = +-sqrt(5)$.]),
  ),
  accent: c-book,
  loigiai: [
    - Đạo hàm: $y' = (1 + m^2)/(x + 1)^2 > 0$ với mọi $m$ và mọi $x != -1$. Do đó hàm số luôn đồng biến trên $[0; 2]$, a) Đúng.
    - Do hàm số đồng biến, giá trị nhỏ nhất là $y(0) = -m^2$, b) Đúng.
    - Giá trị lớn nhất là $y(2) = (2 - m^2)/3$.
    - Giá trị lớn nhất bằng $0 <=> 2 - m^2 = 0 <=> m = +-sqrt(2)$, c) Đúng.
    - Giá trị lớn nhất bằng $-1 <=> (2 - m^2)/3 = -1 <=> 2 - m^2 = -3 <=> m^2 = 5 <=> m = +-sqrt(5)$, d) Đúng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = sin x + cos 2x$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số có thể đưa về khảo sát hàm số bậc hai với biến $t = sin x$, $t in [-1; 1]$.]),
    True([Giá trị lớn nhất của hàm số bằng $9/8$.]),
    True([Giá trị nhỏ nhất của hàm số bằng $-2$.]),
    True([Tập giá trị của hàm số là $[-2; 9/8]$.]),
  ),
  accent: c-book,
  loigiai: [
    - Biến đổi: $y = sin x + 1 - 2 sin^2 x = -2 sin^2 x + sin x + 1$.
    - Đặt $t = sin x$, $t in [-1; 1]$, ta khảo sát $f(t) = -2t^2 + t + 1$. Do đó a) Đúng.
    - Đạo hàm $f'(t) = -4t + 1 = 0 <=> t = 1/4 in [-1; 1]$.
    - Tính các giá trị: $f(-1) = -2$, $f(1) = 0$, $f(1/4) = 9/8$.
    - Do đó, giá trị lớn nhất là $9/8$, b) Đúng; giá trị nhỏ nhất là $-2$, c) Đúng.

    - Tập giá trị của hàm số là $[-2; 9/8]$, d) Đúng.
  ],
))
 
#q-wrap(dir: "doc", ds(
  [Cho hàm số $f(x) = x^4 - 2x^2 + m$ và $g(x) = |f(x)|$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số $f(x)$ đạt cực tiểu trên khoảng $(0; 2)$ tại $x = 1$.]),
    True([Giá trị lớn nhất của hàm số $f(x)$ trên đoạn $[0; 2]$ là $m + 8$.]),
    True([Nếu $m = 2$, giá trị lớn nhất của hàm số $g(x)$ trên đoạn $[0; 2]$ bằng $10$.]),
    [Nếu $m = -4$, giá trị nhỏ nhất của hàm số $g(x)$ trên đoạn $[0; 2]$ bằng $4$.],
  ),
  accent: c-book,
  loigiai: [
    - Đạo hàm $f'(x) = 4x^3 - 4x = 0 <=> x = 0, x = 1$ trên $[0; 2]$. Cực tiểu đạt tại $x = 1$, a) Đúng.
    - Tính các giá trị: $f(0) = m$, $f(1) = m - 1$, $f(2) = m + 8$.
    - Tập giá trị của $f(x)$ trên $[0; 2]$ là $[m - 1; m + 8]$. Giá trị lớn nhất là $m + 8$, b) Đúng.
    - Nếu $m = 2$, tập giá trị của $f(x)$ là $[1; 10]$ nên tập giá trị của $g(x)$ là $[1; 10]$, giá trị lớn nhất bằng $10$, c) Đúng.
    - Nếu $m = -4$, tập giá trị của $f(x)$ là $[-5; 4]$ chứa $0$. Do đó giá trị nhỏ nhất của $g(x) = |f(x)|$ phải bằng $0$, d) Sai.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "ngang", tln(
  [Tìm tổng giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = x + sqrt(2 - x)$ trên đoạn $[-2; 1]$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 1 - 1/(2sqrt(2 - x))$ với $x in [-2; 1)$.]
    #step[Giải $y' = 0 <=> 2sqrt(2 - x) = 1 <=> 8 - 4x = 1 <=> x = 7/4 not in [-2; 1]$.]
    #step[Tính các giá trị đầu mút: $y(-2) = 0$, $y(1) = 2$.]
    #step[Do đó, giá trị lớn nhất là $2$, giá trị nhỏ nhất là $0$.]
    #step[Tổng của chúng là $2 + 0 = 2$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị thực dương của tham số $m$ để giá trị lớn nhất của hàm số $y = |x^4 - 2x^2 + m|$ trên đoạn $[0; 2]$ bằng $10$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Đặt $f(x) = x^4 - 2x^2 + m$. Trên $[0; 2]$, tập giá trị của $f(x)$ là $[m - 1; m + 8]$.]
    #step[Với $m > 0$, ta có $m + 8 > 0$ và $m + 8 > |m - 1|$.]
    #step[Giá trị lớn nhất của $y = |f(x)|$ là $m + 8$.]
    #step[Cho $m + 8 = 10 <=> m = 2$ (thỏa mãn $m > 0$).]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị thực của tham số $m > 0$ để giá trị nhỏ nhất của hàm số $y = (x + m)/(x + 1)$ trên đoạn $[0; 2]$ bằng $2$.],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = (1 - m)/(x + 1)^2$.]
    #step[Trường hợp 1: $1 - m > 0 <=> m < 1$. Đạo hàm $y' > 0$, hàm số đồng biến.
      Giá trị nhỏ nhất là $y(0) = m = 2$ (loại vì đang xét $m < 1$).]
    #step[Trường hợp 2: $1 - m < 0 <=> m > 1$. Đạo hàm $y' < 0$, hàm số nghịch biến.
      Giá trị nhỏ nhất đạt tại $x = 2$: $y(2) = (2 + m)/3 = 2 <=> m = 4$ (thỏa mãn $m > 1$).]
    #step[Vậy $m = 4$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một khu đất hình chữ nhật có diện tích $50$ $m^2$ được rào bao quanh. Một mặt của khu đất đã có sẵn tường gạch làm rào chắn. Chi phí lưới rào cho ba mặt còn lại là $10$ USD mỗi mét. Hỏi chi phí rào thấp nhất là bao nhiêu USD?
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Brick wall (thick brown line)
        line((0, 2), (4, 2), stroke: 4pt + rgb("b87333"))
        content((2, 2.3), text(size: 8pt)[Tường gạch])
        // Fence (3 sides)
        line((0, 2), (0, 0), stroke: 1.2pt + black)
        line((0, 0), (4, 0), stroke: 1.2pt + black)
        line((4, 0), (4, 2), stroke: 1.2pt + black)
        // Labels
        content((-0.3, 1), text(size: 8pt)[$x$])
        content((4.3, 1), text(size: 8pt)[$x$])
        content((2, -0.3), text(size: 8pt)[$y = 50/x$])
      })
    ]
  ],
  [$200$],
  accent: c-book,
  loigiai: [
    #step[Gọi chiều rộng của khu đất (cạnh vuông góc với bức tường) là $x$ (mét), với $x > 0$.]
    #step[Chiều dài khu đất (cạnh song song với bức tường) là $50/x$ (mét).]
    #step[Tổng chiều dài lưới rào cho ba mặt là $2x + 50/x$ (mét).]
    #step[Tổng chi phí rào: $C(x) = 10 (2x + 50/x) = 20x + 500/x$ (USD).]
    #step[Xét hàm số $C(x)$ trên $(0; +oo)$. Đạo hàm: $C'(x) = 20 - 500/x^2 = (20(x^2 - 25))/x^2$.]
    #step[Giải $C'(x) = 0 <=> x^2 = 25 <=> x = 5$ (vì $x > 0$).]
    #step[Lập bảng biến thiên trên $(0; +oo)$, ta thấy chi phí rào thấp nhất tại $x = 5$ mét.]
    #step[Chi phí thấp nhất là $C(5) = 20(5) + 500/5 = 200$ USD.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho $M$ là giá trị lớn nhất của hàm số $y = sin x cos^2 x$ trên đoạn $[0; pi/2]$. Tính giá trị của biểu thức $27 M^2$.],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Biến đổi hàm số: $y = sin x (1 - sin^2 x) = sin x - sin^3 x$.]
    #step[Đặt $t = sin x$. Vì $x in [0; pi/2] => t in [0; 1]$. Ta khảo sát $f(t) = t - t^3$ trên $[0; 1]$.]
    #step[Đạo hàm: $f'(t) = 1 - 3t^2 = 0 <=> t = 1/sqrt(3) in [0; 1]$.]
    #step[Tính các giá trị: $f(0) = 0$, $f(1) = 0$, $f(1/sqrt(3)) = 2/(3sqrt(3))$.]
    #step[Giá trị lớn nhất là $M = 2/(3sqrt(3))$. Suy ra $M^2 = 4/27 => 27 M^2 = 4$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một chiếc hộp hình hộp chữ nhật không nắp có đáy là hình vuông cạnh $x$ (mét) và thể tích bằng $4$ $m^3$. Tìm cạnh đáy $x$ (mét) để diện tích phần vật liệu làm hộp (gồm đáy và bốn mặt bên) là nhỏ nhất.
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Bottom square (oblique projection)
        line((0, 0), (2, 0), stroke: 1pt + black)
        line((2, 0), (2.8, 0.6), stroke: 1pt + black)
        line((2.8, 0.6), (0.8, 0.6), stroke: (paint: gray, dash: "dashed"))
        line((0.8, 0.6), (0, 0), stroke: (paint: gray, dash: "dashed"))
        // Vertical edges
        line((0, 0), (0, 1.8), stroke: 1pt + black)
        line((2, 0), (2, 1.8), stroke: 1pt + black)
        line((2.8, 0.6), (2.8, 2.4), stroke: 1pt + black)
        line((0.8, 0.6), (0.8, 2.4), stroke: (paint: gray, dash: "dashed"))
        // Top square (open)
        line((0, 1.8), (2, 1.8), stroke: 1pt + black)
        line((2, 1.8), (2.8, 2.4), stroke: 1pt + black)
        line((2.8, 2.4), (0.8, 2.4), stroke: 1pt + black)
        line((0.8, 2.4), (0, 1.8), stroke: 1pt + black)
        // Labels
        content((1, -0.3), text(size: 8pt)[$x$])
        content((2.6, 0.2), text(size: 8pt)[$x$])
        content((-0.3, 0.9), text(size: 8pt)[$h$])
      })
    ]
  ],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Gọi chiều cao của hộp là $h$ (mét), điều kiện $x > 0, h > 0$.]
    #step[Thể tích hộp: $V = x^2 h = 4 => h = 4/x^2$ (mét).]
    #step[Diện tích toàn phần vật liệu làm hộp không nắp: $S = x^2 + 4x h = x^2 + 4x (4/x^2) = x^2 + 16/x$ ($m^2$).]
    #step[Xét hàm $S(x) = x^2 + 16/x$ trên $(0; +oo)$: $S'(x) = 2x - 16/x^2 = 2(x^3 - 8)/x^2 = 0 <=> x = 2$.]
    #step[Lập bảng biến thiên trên $(0; +oo)$, ta thấy diện tích nhỏ nhất đạt tại $x = 2$ mét.]
  ],
))
