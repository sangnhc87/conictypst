#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 02])

#resetexamstate()
#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (15 câu)], count: 15)

#tn(
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = sqrt(x) + sqrt(4-x)$ trên đoạn $[0; 4]$.],
  (
    [$2$],
    [$4$],
    True([$2sqrt(2)$]),
    [$sqrt(2)$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [0; 4]$.]
    #step[*Bước 2:* Đạo hàm $y' = 1 / (2 sqrt(x)) - 1 / (2 sqrt(4-x))$.]
    #step[*Bước 3:* Giải $y' = 0 <=> sqrt(x) = sqrt(4-x) <=> x = 4-x <=> x = 2$.]
    #step[*Bước 4:* Tính các giá trị: $y(0) = 2$, $y(4) = 2$, $y(2) = sqrt(2) + sqrt(2) = 2 sqrt(2)$.]
    #step[*Bước 5:* So sánh các giá trị, ta thấy giá trị lớn nhất là $2 sqrt(2)$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = cos x + sqrt(3) sin x$ trên đoạn $[0; pi]$.],
  (
    [$-2$],
    True([$-1$]),
    [$1$],
    [$0$]
  ),
  loigiai: [
    #step[*Bước 1:* Biến đổi hàm số: $y = cos x + sqrt(3) sin x = 2 (1 / 2 cos x + (sqrt(3)) / 2 sin x) = 2 sin(x + pi / 6)$.]
    #step[*Bước 2:* Xét $x in [0; pi]$, ta có $x + pi / 6 in [pi / 6; (7pi) / 6]$.]
    #step[*Bước 3:* Trên đoạn này, $sin(x + pi / 6)$ đạt giá trị nhỏ nhất tại $(7pi) / 6$ với $sin((7pi) / 6) = -1/2$.]
    #step[*Bước 4:* Vậy giá trị nhỏ nhất của hàm số là $2 dot (-1/2) = -1$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x^2 - 8 ln x$ trên khoảng $(0; +oo)$.],
  (
    True([$4 - 8 ln 2$]),
    [$4 - 4 ln 2$],
    [$4$],
    [$2 - 8 ln 2$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = (0; +oo)$.]
    #step[*Bước 2:* Đạo hàm $y' = 2x - 8 / x = (2x^2 - 8) / x$.]
    #step[*Bước 3:* Giải $y' = 0 <=> 2x^2 - 8 = 0 <=> x = 2$ (do $x > 0$).]
    #step[*Bước 4:* Lập bảng biến thiên, ta thấy hàm số đạt cực tiểu tại $x = 2$, đồng thời là giá trị nhỏ nhất trên $(0; +oo)$.]
    #step[*Bước 5:* Tính $y(2) = 2^2 - 8 ln 2 = 4 - 8 ln 2$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $ f(x) = cases(x^2 - 2x + 3 &"khi" x <= 1, 4 - x &"khi" x > 1) $ trên đoạn $[-1; 3]$.],
  (
    [$3$],
    [$2$],
    True([$6$]),
    [$4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số trên $[-1; 1]$: $y = x^2 - 2x + 3$. Đạo hàm $y' = 2x - 2$, $y' = 0 <=> x = 1$. Giá trị $f(-1) = 6$, $f(1) = 2$.]
    #step[*Bước 2:* Xét hàm số trên $(1; 3]$: $y = 4 - x$. Đạo hàm $y' = -1 < 0$. Hàm số nghịch biến. $f(1^+) = 3$, $f(3) = 1$.]
    #step[*Bước 3:* So sánh các giá trị trên tập xác định $[-1; 3]$, ta thấy giá trị lớn nhất là $6$ (đạt tại $x = -1$).]
  ]
)

#tn(
  dir: "ngang",
  fig: canvas(length: 0.6cm, {
    import draw: *
    line((-3, 0), (4, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2), (0, 3), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.35), $O$)
    
    // Labels
    content((-2, -0.4), $-2$)
    content((1, 0.4), $1$)
    content((3, -0.4), $3$)
    
    // Curve
    bezier((-2, -1.5), (1, 0), (-1.2, -1.8), (0.2, -1.8), stroke: 1.2pt + blue)
    bezier((1, 0), (3, 2), (1.8, 1.8), (2.5, 2), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ liên tục trên $[-2; 3]$ và có đồ thị đạo hàm $y = f'(x)$ như hình vẽ bên. Giá trị nhỏ nhất của hàm số $f(x)$ trên $[-2; 3]$ đạt được tại điểm nào?],
  (
    [$x = -2$],
    True([$x = 1$]),
    [$x = 3$],
    [$x = 0$]
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào đồ thị $f'(x)$, ta thấy $f'(x) = 0$ tại $x = -2, 1, 3$.]
    #step[*Bước 2:* Trên khoảng $(-2; 1)$, phần đồ thị $f'(x)$ nằm dưới trục hoành nên $f'(x) < 0$, hàm số nghịch biến.]
    #step[*Bước 3:* Trên khoảng $(1; 3)$, phần đồ thị $f'(x)$ nằm trên trục hoành nên $f'(x) > 0$, hàm số đồng biến.]
    #step[*Bước 4:* Hàm số giảm trên $(-2; 1)$ và tăng trên $(1; 3)$, do đó đạt giá trị nhỏ nhất tại $x = 1$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x - sqrt(x)$ trên khoảng $(0; 1)$.],
  (
    True([$-1/4$]),
    [$-1/2$],
    [$0$],
    [$-1/8$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [0; +oo)$. Xét trên khoảng $(0; 1)$.]
    #step[*Bước 2:* Đạo hàm $y' = 1 - 1 / (2 sqrt(x))$.]
    #step[*Bước 3:* Giải $y' = 0 <=> 2 sqrt(x) = 1 <=> sqrt(x) = 1 / 2 <=> x = 1 / 4$.]
    #step[*Bước 4:* Lập bảng biến thiên, $y'$ đổi dấu từ âm sang dương tại $x = 1 / 4$.]
    #step[*Bước 5:* Giá trị nhỏ nhất là $y(1 / 4) = 1 / 4 - 1 / 2 = -1 / 4$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = 3 sqrt(x - 1) + 4 sqrt(5 - x)$ trên tập xác định của nó.],
  (
    [$5$],
    True([$10$]),
    [$2sqrt(5)$],
    [$5sqrt(2)$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [1; 5]$.]
    #step[*Bước 2:* Áp dụng bất đẳng thức Cauchy-Bunyakovsky: $y^2 = (3 sqrt(x-1) + 4 sqrt(5-x))^2 <= (3^2 + 4^2)(x - 1 + 5 - x)$.]
    #step[*Bước 3:* Suy ra $y^2 <= 25 dot 4 = 100 => y <= 10$.]
    #step[*Bước 4:* Dấu bằng xảy ra khi $(sqrt(x-1)) / 3 = (sqrt(5-x)) / 4 <=> x = 61 / 25 in [1; 5]$. Vậy $max y = 10$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = (sin x + 1)/(sin x + 2)$.],
  (
    [$0$],
    [$1$],
    True([$2/3$]),
    [$1/2$]
  ),
  loigiai: [
    #step[*Bước 1:* Đặt $t = sin x$, điều kiện $t in [-1; 1]$.]
    #step[*Bước 2:* Hàm số trở thành $g(t) = (t+1) / (t+2)$ trên $[-1; 1]$.]
    #step[*Bước 3:* Đạo hàm $g'(t) = 1 / (t+2)^2 > 0, forall t in [-1; 1]$.]
    #step[*Bước 4:* Hàm số đồng biến nên đạt giá trị lớn nhất tại $t = 1$.]
    #step[*Bước 5:* Giá trị lớn nhất là $g(1) = (1+1) / (1+2) = 2 / 3$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = x sqrt(4 - x^2)$ trên đoạn $[-2; 2]$.],
  (
    True([$2$]),
    [$4$],
    [$sqrt(2)$],
    [$1$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [-2; 2]$.]
    #step[*Bước 2:* Đạo hàm $y' = sqrt(4-x^2) + x dot (-x) / (sqrt(4-x^2)) = (4-2x^2) / (sqrt(4-x^2))$.]
    #step[*Bước 3:* Giải $y' = 0 <=> 4 - 2x^2 = 0 <=> x = +-sqrt(2)$.]
    #step[*Bước 4:* Tính $y(-2) = 0$, $y(2) = 0$, $y(-sqrt(2)) = -2$, $y(sqrt(2)) = 2$.]
    #step[*Bước 5:* Giá trị lớn nhất là $2$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = (x-2)e^x$ trên đoạn $[0; 3]$.],
  (
    True([$e^3$]),
    [$-e$],
    [$-2$],
    [$2e^3$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số trên đoạn $[0; 3]$. Đạo hàm $y' = e^x + (x-2)e^x = (x-1)e^x$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x = 1$ (do $e^x > 0$).]
    #step[*Bước 3:* Tính các giá trị: $y(0) = -2$, $y(1) = -e$, $y(3) = e^3$.]
    #step[*Bước 4:* So sánh, ta thấy giá trị lớn nhất là $e^3$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  [Cho hàm số $y = f(x)$ liên tục trên nửa khoảng $[-3; 2)$ và có bảng biến thiên như hình vẽ dưới:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($-3$, $0$, $2$),
        d-signs: ("+", "0", "-"),
        v-vals: ($3$, $-1$, $4$),
        // ranks: (2, 0, 3)
        w1: 1.25,
        w2: 6,
      )
    ]
    Mệnh đề nào sau đây đúng?],
  (
    True([$limits(min)_([-3;2)) y = -1$ và không tồn tại giá trị lớn nhất của hàm số.]),
    [$limits(min)_([-3;2)) y = -1$ và $limits(max)_([-3;2)) y = 4$.],
    [Hàm số không có giá trị lớn nhất và không có giá trị nhỏ nhất.],
    [$limits(max)_([-3;2)) y = 3$.]
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào bảng biến thiên trên nửa khoảng $[-3; 2)$.]
    #step[*Bước 2:* Hàm số đạt cực tiểu và giá trị nhỏ nhất tại $x = 0$ với $y = -1$.]
    #step[*Bước 3:* Hàm số tăng lên đến $4$ khi $x -> 2$, nhưng do tập xác định không chứa $2$ nên hàm số không có giá trị lớn nhất.]
    #step[*Bước 4:* Vậy mệnh đề đúng là $min y = -1$ và không tồn tại giá trị lớn nhất.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x^2 - x - ln x$ trên khoảng $(0; +oo)$.],
  (
    True([$0$]),
    [$1$],
    [$-1$],
    [$e$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = (0; +oo)$.]
    #step[*Bước 2:* Đạo hàm $y' = 2x - 1 - 1 / x = (2x^2 - x - 1) / x$.]
    #step[*Bước 3:* Giải $y' = 0 <=> 2x^2 - x - 1 = 0 <=> x = 1$ (nhận) hoặc $x = -1 / 2$ (loại).]
    #step[*Bước 4:* Lập bảng biến thiên, thấy hàm số đạt cực tiểu và nhỏ nhất tại $x = 1$.]
    #step[*Bước 5:* Giá trị nhỏ nhất là $y(1) = 1^2 - 1 - ln 1 = 0$.]
  ]
)
#tn(
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $ f(x) = cases(2 - x^2 &"khi" x <= 0, cos x + 1 &"khi" x > 0) $ trên đoạn $[-1; pi]$.],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$0$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = 2 - x^2$ trên $[-1; 0]$. Đạo hàm $y' = -2x >= 0$. Giá trị lớn nhất trên đoạn này là $f(0) = 2$.]
    #step[*Bước 2:* Xét hàm số $y = cos x + 1$ trên $(0; pi]$. Giá trị lớn nhất là cận $lim_(x -> 0^+) (cos x + 1) = 2$, và các giá trị thực tế đều nhỏ hơn $2$.]
    #step[*Bước 3:* So sánh, giá trị lớn nhất của hàm số trên toàn đoạn là $2$ (đạt tại $x = 0$).]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x - 2 sqrt(x - 1)$ trên nửa khoảng $[1; +oo)$.],
  (
    [$1$],
    True([$0$]),
    [$-1$],
    [$2$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [1; +oo)$.]
    #step[*Bước 2:* Đạo hàm $y' = 1 - 1 / (sqrt(x-1))$.]
    #step[*Bước 3:* Giải $y' = 0 <=> sqrt(x-1) = 1 <=> x - 1 = 1 <=> x = 2$.]
    #step[*Bước 4:* Lập bảng biến thiên, $y'$ đổi dấu từ âm sang dương tại $x = 2$, đây là cực tiểu.]
    #step[*Bước 5:* Tính $y(2) = 2 - 2 sqrt(1) = 0$. Giá trị nhỏ nhất là $0$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = (x - 3) e^x$ trên đoạn $[0; 4]$.],
  (
    [$-e^2$],
    True([$e^4$]),
    [$-3$],
    [$e^2$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số trên đoạn $[0; 4]$. Đạo hàm $y' = e^x + (x-3)e^x = (x-2)e^x$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x = 2$.]
    #step[*Bước 3:* Tính các giá trị: $y(0) = -3$, $y(2) = -e^2$, $y(4) = e^4$.]
    #step[*Bước 4:* So sánh, ta thấy giá trị lớn nhất là $e^4$.]
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",
  [Cho hàm số $f(x) = sqrt(3 + cos x)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = RR$.]),
    True([Giá trị lớn nhất của hàm số là $2$.]),
    True([Giá trị nhỏ nhất của hàm số là $sqrt(2)$.]),
    [Hàm số đạt giá trị nhỏ nhất tại các điểm $x = k 2pi$ ($k in ZZ$).]
  ),
  loigiai: [
    #step[*Bước 1:* Vì $-1 <= cos x <= 1, forall x in RR$, nên $3 + cos x >= 2 > 0$. Vậy TXĐ $D = RR$. (Mệnh đề a đúng)]
    #step[*Bước 2:* Giá trị lớn nhất đạt được khi $cos x = 1 => f(x) = sqrt(4) = 2$. (Mệnh đề b đúng)]
    #step[*Bước 3:* Giá trị nhỏ nhất đạt được khi $cos x = -1 => f(x) = sqrt(2)$. (Mệnh đề c đúng)]
    #step[*Bước 4:* Hàm số đạt GTNN khi $cos x = -1 <=> x = pi + k 2pi$. (Mệnh đề d sai vì $x = k 2pi$ thì $cos x = 1$ cho GTLN)]
  ]
)

#ds(
  dir: "doc",lines: 0,
  fig: canvas(length: 0.6cm, {
    import draw: *
    line((-2, 0), (5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2), (0, 3), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.35), $O$)
    
    // Labels
    content((-1, -0.4), $-1$)
    content((2, -0.4), $2$)
    content((4, -0.4), $4$)
    
    // Curve
    bezier((-1, 1.5), (0, 2), (-0.5, 2), stroke: 1.2pt + blue)
    bezier((0, 2), (2, -1.2), (0.8, -1.2), (1.5, -1.2), stroke: 1.2pt + blue)
    bezier((2, -1.2), (4, 1.8), (2.8, 1.8), (3.5, 1.8), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ liên tục trên đoạn $[-1; 4]$ và có đồ thị đạo hàm $y = f'(x)$ như hình vẽ bên. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số nghịch biến trên khoảng $(0; 2)$.]),
    [Điểm cực đại của hàm số là $x = 2$.],
    True([Giá trị nhỏ nhất của hàm số trên đoạn $[-1; 4]$ có thể đạt được tại $x = 2$.]),
    True([Giá trị lớn nhất của hàm số trên đoạn $[-1; 4]$ có thể đạt được tại $x = 0$.])
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị $f'(x)$, ta thấy đồ thị cắt trục hoành tại điểm $x_1 in (0; 2)$ và $x_2 in (2; 4)$. Hàm số đồng biến rồi nghịch biến trên $(0; 2)$. (Mệnh đề a sai)]
    #step[*Bước 2:* $f'(x)$ đổi dấu từ dương sang âm tại $x_1 in (0; 2)$ nên $x_1$ là cực đại. Tại $x=2$ đạo hàm âm. (Mệnh đề b sai)]
    #step[*Bước 3:* GTNN trên $[-1; 4]$ có thể đạt tại $x = -1, x_2$, không thể tại $x=2$ vì hàm số đang nghịch biến tại đó. (Mệnh đề c sai)]
    #step[*Bước 4:* GTLN có thể đạt tại cực đại $x_1$ hoặc điểm biên $x=4$, không thể tại $x=0$. (Mệnh đề d sai)]
  ]
)

#ds(
  dir: "doc",
  [Cho hàm số $f(x) = 2 sin x - 4/3 sin^3 x$ trên đoạn $[0; pi]$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Bằng cách đặt $t = sin x$, ta tìm giá trị lớn nhất và nhỏ nhất của hàm số $g(t) = 2t - 4/3 t^3$ trên đoạn $[0; 1]$.]),
    True([Hàm số $g(t) = 2t - 4/3 t^3$ đồng biến trên khoảng $(0; 1/2)$.]),
    True([Giá trị lớn nhất của hàm số $f(x)$ trên đoạn $[0; pi]$ bằng $(2sqrt(2))/3$.]),
    [Giá trị nhỏ nhất của hàm số $f(x)$ trên đoạn $[0; pi]$ bằng $2/3$.]
  ),
  loigiai: [
    #step[*Bước 1:* Đặt $t = sin x$. Vì $x in [0; pi]$ nên $t in [0; 1]$. Hàm số trở thành $g(t) = 2t - (4)/3 t^3$. (Mệnh đề a đúng)]
    #step[*Bước 2:* Đạo hàm $g'(t) = 2 - 4t^2$. Xét $g'(t) > 0 <=> t^2 < 1 / 2 <=> t in [0; sqrt(2)/2)$. Khoảng $(0; 1/2)$ nằm trong khoảng này nên hàm số đồng biến. (Mệnh đề b đúng)]
    #step[*Bước 3:* Hàm số đạt GTLN tại $t = sqrt(2)/2$. Thay vào ta được $g(sqrt(2)/2) = (2 sqrt(2)) / 3$. (Mệnh đề c đúng)]
    #step[*Bước 4:* GTNN trên $[0; 1]$ đạt tại $t = 0$ với $g(0) = 0$. (Mệnh đề d sai vì tính ra $2/3$ là $g(1)$)]
  ]
)

#ds(
  dir: "doc",
  [Cho hàm số $f(x) = x - ln(x+1)$ trên đoạn $[0; 2]$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đồng biến trên đoạn $[0; 2]$.]),
    True([Giá trị nhỏ nhất của hàm số trên đoạn $[0; 2]$ là $0$.]),
    True([Giá trị lớn nhất của hàm số trên đoạn $[0; 2]$ là $2 - ln 3$.]),
    [Hàm số đạt giá trị nhỏ nhất tại $x = 1$.]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định của $f(x)$ trên $[0; 2]$. Đạo hàm $f'(x) = 1 - 1 / (x+1) = x / (x+1)$.]
    #step[*Bước 2:* Với $x in [0; 2]$, $f'(x) >= 0$, hàm số đồng biến. (Mệnh đề a đúng)]
    #step[*Bước 3:* GTNN đạt tại biên $x = 0$, $f(0) = 0$. (Mệnh đề b đúng)]
    #step[*Bước 4:* GTLN đạt tại biên $x = 2$, $f(2) = 2 - ln 3$. (Mệnh đề c đúng)]
    #step[*Bước 5:* Hàm số đồng biến nên đạt GTNN tại $x = 0$. (Mệnh đề d sai)]
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = root(3, (x-1)^2)$ trên đoạn $[0; 9]$.],
  [$4$],
  loigiai: [
    #step[*Bước 1:* Hàm số $y = root(3, (x-1)^2)$ xác định trên $[0; 9]$.]
    #step[*Bước 2:* Đạo hàm $y' = 2 / 3 (x-1)^(-1 / 3) = 2 / (3 root(3, x-1))$. Đạo hàm không xác định tại $x = 1$.]
    #step[*Bước 3:* Tính $y(0) = 1$, $y(1) = 0$, $y(9) = root(3, 8^2) = 4$.]
    #step[*Bước 4:* Giá trị lớn nhất là $4$.]
  ]
)

#tln(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = 2(sin^4 x + cos^4 x)$.],
  [$1$],
  loigiai: [
    #step[*Bước 1:* Biến đổi $y = 2(sin^4 x + cos^4 x) = 2( (sin^2 x + cos^2 x)^2 - 2 sin^2 x cos^2 x )$.]
    #step[*Bước 2:* Suy ra $y = 2(1 - 1 / 2 sin^2 2x) = 2 - sin^2 2x$.]
    #step[*Bước 3:* Vì $0 <= sin^2 2x <= 1$, nên $2 - 1 <= y <= 2 - 0$.]
    #step[*Bước 4:* Giá trị nhỏ nhất là $1$.]
  ]
)

#tln(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x^2 - 2x + 2 ln x$ trên đoạn $[1; 3]$.],
  [$-1$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số trên đoạn $[1; 3]$. Đạo hàm $y' = 2x - 2 + 2 / x = (2x^2 - 2x + 2) / x$.]
    #step[*Bước 2:* Tam thức $2x^2 - 2x + 2$ có $Delta' = 1 - 4 = -3 < 0$ nên $2x^2 - 2x + 2 > 0$. Suy ra $y' > 0, forall x in [1; 3]$.]
    #step[*Bước 3:* Hàm số đồng biến trên $[1; 3]$, do đó giá trị nhỏ nhất đạt tại $x = 1$.]
    #step[*Bước 4:* $y(1) = 1^2 - 2(1) + 2 ln 1 = -1$.]
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $y = x^2 e^(-x)$ trên đoạn $[1; 4]$. Biết giá trị lớn nhất của hàm số đạt được tại điểm $x_0$. Tìm giá trị của $x_0$.],
  [$2$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số trên $[1; 4]$. Đạo hàm $y' = 2x e^(-x) - x^2 e^(-x) = x(2-x)e^(-x)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x = 2$ (do $x in [1; 4]$).]
    #step[*Bước 3:* Tính $y(1) = 1 / e$, $y(2) = 4 / e^2$, $y(4) = 16 / e^4$.]
    #step[*Bước 4:* So sánh thấy $4 / e^2$ là giá trị lớn nhất, đạt được tại $x_0 = 2$.]
  ]
)

#tln(
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = sqrt(x - 2) + sqrt(10 - x)$.],
  [$4$],
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [2; 10]$.]
    #step[*Bước 2:* Áp dụng Cauchy-Bunyakovsky: $y^2 = (sqrt(x-2) + sqrt(10-x))^2 <= (1^2 + 1^2)(x-2 + 10-x) = 2 dot 8 = 16$.]
    #step[*Bước 3:* Suy ra $y <= 4$.]
    #step[*Bước 4:* Dấu bằng xảy ra khi $sqrt(x-2) = sqrt(10-x) <=> x = 6 in [2; 10]$. Vậy giá trị lớn nhất là $4$.]
  ]
)

#tln(
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = sin^2 x - 4 sin x + 5$.],
  [$10$],
  loigiai: [
    #step[*Bước 1:* Đặt $t = sin x, t in [-1; 1]$.]
    #step[*Bước 2:* Hàm số thành $y = t^2 - 4t + 5 = (t-2)^2 + 1$.]
    #step[*Bước 3:* Vì $t in [-1; 1]$ nên $t - 2 in [-3; -1]$, suy ra $(t-2)^2 in [1; 9]$.]
    #step[*Bước 4:* Do đó $y = (t-2)^2 + 1 <= 9 + 1 = 10$.]
    #step[*Bước 5:* Dấu bằng xảy ra khi $t = -1 <=> sin x = -1 <=> x = -pi / 2 + k 2pi$. Giá trị lớn nhất là $10$.]
  ]
)

