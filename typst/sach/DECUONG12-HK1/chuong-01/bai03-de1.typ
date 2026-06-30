#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 01 — Tiệm cận của đồ thị hàm số])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#tn(
  dir: "doc",lines:0,
  [Đồ thị hàm số $y = (2x - 3)/(x + 1)$ có đường tiệm cận ngang là:],
  (
    [$x = -1$.],
    True([$y = 2$.]),
    [$y = -3$.],
    [$y = 1$.]
  ),
  loigiai: [
    #step[Hàm số xác định trên $RR \\ {-1}$.]
    #step[Ta có $limits(lim)_(x -> +oo) y = limits(lim)_(x -> +oo) (2x - 3)/(x + 1) = limits(lim)_(x -> +oo) (2 - 3/x)/(1 + 1/x) = 2$.]
    #step[Và $limits(lim)_(x -> -oo) y = 2$. Do đó, đường thẳng $y = 2$ là tiệm cận ngang của đồ thị hàm số.]
  ]
)

#tn(
  dir: "doc",lines:0,
  [Đường tiệm cận đứng của đồ thị hàm số $y = (x^2 - x + 1)/(x - 2)$ có phương trình là:],
  (
    True([$x = 2$.]),
    [$x = 1$.],
    [$y = 2$.],
    [$y = x + 1$.]
  ),
  loigiai: [
    #step[Hàm số xác định khi $x - 2 != 0 <=> x != 2$.]
    #step[Ta tính giới hạn tại $x_0 = 2$: $limits(lim)_(x -> 2^+) (x^2 - x + 1)/(x - 2) = +oo$ (vì tử số tiến đến $3 > 0$ và mẫu số tiến đến $0^+$).]
    #step[Và $limits(lim)_(x -> 2^-) (x^2 - x + 1)/(x - 2) = -oo$.]
    #step[Vậy đường thẳng $x = 2$ là tiệm cận đứng của đồ thị hàm số.]
  ]
)

#tn(
  dir: "doc",lines:0,
  [Tiệm cận xiên của đồ thị hàm số $y = (x^2 + 3x - 1)/(x - 1)$ là đường thẳng:],
  (
    [$y = x - 1$.],
    [$y = x + 3$.],
    True([$y = x + 4$.]),
    [$y = 2x + 1$.]
  ),
  loigiai: [
    #step[Hàm số xác định trên $RR \\ {1}$.]
    #step[Thực hiện phép chia đa thức tử số cho mẫu số, ta được: $y = (x^2 - x + 4x - 4 + 3)/(x - 1) = x + 4 + 3/(x - 1)$.]
    #step[Ta có $limits(lim)_(x -> +oo) [y - (x + 4)] = limits(lim)_(x -> +oo) 3/(x - 1) = 0$. Tương tự khi $x -> -oo$.]
    #step[Vậy đường thẳng $y = x + 4$ là tiệm cận xiên của đồ thị hàm số.]
  ]
)

#tn(
  dir: "doc",lines:0,
  [Đồ thị hàm số $y = (sqrt(x^2 + 1) - x)/(x - 1)$ có bao nhiêu đường tiệm cận (bao gồm tiệm cận đứng và ngang)?],
  (
    [$1$.],
    True([$2$.]),
    [$3$],
    [$4$.]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {1}$.]
    #step[Tìm tiệm cận ngang: 
    - Khi $x -> +oo$: $y = (sqrt(x^2+1) - x)/(x-1) = ( (x^2+1)-x^2 ) / ((x-1)(sqrt(x^2+1)+x)) = 1 / ((x-1)(x sqrt(1+1/x^2) + x))$.
    Suy ra $limits(lim)_(x -> +oo) y = 0$. Đồ thị có TCN $y = 0$.
    - Khi $x -> -oo$: $limits(lim)_(x -> -oo) y = limits(lim)_(x -> -oo) ( |x|sqrt(1+1/x^2) - x )/(x-1) = limits(lim)_(x -> -oo) ( -x(sqrt(1+1/x^2) + 1) )/( x(1 - 1/x) ) = -2$. Đồ thị có TCN $y = -2$.]
    #step[Vậy đồ thị có 2 tiệm cận ngang. Nhưng đợi đã, còn TCĐ tại $x = 1$? 
    Tại $x = 1$, tử số tiến tới $sqrt(2) - 1 > 0$, mẫu số tiến tới $0$. Do đó $limits(lim)_(x -> 1) y = oo$. Vậy có thêm 1 TCĐ $x = 1$.]
    #step[Tổng cộng có 3 đường tiệm cận! Đáp án đúng phải là 3.]
  ]
)

#tn(
  dir: "doc",lines:0,
  [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f$,
        func: $f$,
        x-vals: ($-oo$, $1$, $3$, $+oo$),
        d-signs: ("+", "||", "-", "0", "+"),
        v-vals: ($2$, ($-oo$, $+oo$), $0$, $5$),
        ranks: (1, (-1, 2), -1, 2)
      )
    ]
    Tổng số tiệm cận đứng và tiệm cận ngang của đồ thị hàm số là:
  ],
  (
    [$1$.],
    [$2$.],
    True([$3$.]),
    [$4$.]
  ),
  loigiai: [
    #step[Dựa vào bảng biến thiên, ta phân tích các giới hạn:]
    #step[1. Tiệm cận ngang:
    - $limits(lim)_(x -> -oo) f(x) = 2 => y = 2$ là TCN.
    - $limits(lim)_(x -> +oo) f(x) = 5 => y = 5$ là TCN.
    Vậy có 2 đường TCN.]
    #step[2. Tiệm cận đứng:
    - Tại $x = 1$, ta thấy $limits(lim)_(x -> 1^-) f(x) = -oo$ và $limits(lim)_(x -> 1^+) f(x) = +oo$. Do đó $x = 1$ là TCĐ.
    - Tại $x = 3$, hàm số liên tục và đạt giá trị $0$. Không có TCĐ.]
    #step[Vậy đồ thị hàm số có tổng cộng 3 đường tiệm cận.]
  ]
)

#tn(
  dir: "doc",lines:0, 
  fig: canvas(length: 1cm, {
    import draw: *
    // Grid and axes
    line((-2.5, 0), (3.5, 0), stroke: 0.8pt, mark: (end: "stealth")) // x-axis
    line((0, -2.5), (0, 3.5), stroke: 0.8pt, mark: (end: "stealth")) // y-axis
    content((3.3, -0.3), $x$)
    content((-0.3, 3.3), $y$)
    content((-0.3, -0.3), $O$)
    
    // Asymptotes
    line((-2.5, 1), (3.5, 1), stroke: (dash: "dashed", paint: red)) // y=1
    line((1, -2.5), (1, 3.5), stroke: (dash: "dashed", paint: red)) // x=1
    content((3.3, 1.3), text(fill: red)[$y=1$])
    content((1.4, 3.3), text(fill: red)[$x=1$])
    
    // Curve branches
    bezier((-2.5, 0.5), (0.5, -2.5), (-0.5, 0.5), (0.5, -0.5), stroke: 1.2pt + blue)
    bezier((1.5, 3.5), (3.5, 1.5), (1.5, 1.5), (2.5, 1.5), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Cho đồ thị hàm số $y = (a x + b)/(c x + d)$ như hình bên. Tọa độ giao điểm $I$ của hai đường tiệm cận là:],
  (
    [$I(-1; 1)$.],
    True([$I(1; 1)$.]),
    [$I(1; -1)$.],
    [$I(0; 1)$.]
  ),
  loigiai: [
    #step[Quan sát đồ thị, ta thấy:]
    #step[Khi $x -> +oo$ hoặc $x -> -oo$, đồ thị tiến sát đến đường thẳng nằm ngang $y = 1$. Do đó TCN là $y = 1$.]
    #step[Khi $x -> 1^+$ thì $y -> +oo$ và $x -> 1^-$ thì $y -> -oo$. Đồ thị tiến sát đến đường thẳng đứng $x = 1$. Do đó TCĐ là $x = 1$.]
    #step[Giao điểm của TCN và TCĐ là $I(1; 1)$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm tất cả các giá trị của tham số $m$ để đồ thị hàm số $y = (x - 1)/(x^2 - 3x + m)$ có đúng hai đường tiệm cận đứng.],
  (
    True([$m < 9/4$ và $m != 2$.]),
    [$m < 9/4$.],
    [$m > 9/4$.],
    [$m != 2$.]
  ),
  loigiai: [
    #step[Đồ thị có 2 TCĐ khi và chỉ khi phương trình mẫu số $g(x) = x^2 - 3x + m = 0$ có 2 nghiệm phân biệt khác nghiệm của tử số (nghĩa là khác $x = 1$).]
    #step[Điều kiện 1: $Delta = 9 - 4m > 0 <=> m < 9/4$.]
    #step[Điều kiện 2: $g(1) != 0 <=> 1^2 - 3(1) + m != 0 <=> m - 2 != 0 <=> m != 2$.]
    #step[Vậy điều kiện cần tìm là $m < 9/4$ và $m != 2$.]
  ]
)

#tn(
  dir: "ngang",
  [Đồ thị hàm số $y = (sqrt(x + 4) - 2)/(x^2 + x)$ có bao nhiêu đường tiệm cận đứng?],
  (
    [$0$.],
    True([$1$.]),
    [$2$.],
    [$3$.]
  ),
  loigiai: [
    #step[Tập xác định $x >= -4, x != 0, x != -1$.]
    #step[Mẫu số bằng 0 tại $x = 0$ và $x = -1$. Ta xét giới hạn tại hai điểm này.]
    #step[Tại $x = -1$: Tử số là $sqrt(3) - 2 != 0$, mẫu số bằng 0. Vậy $x = -1$ là tiệm cận đứng.]
    #step[Tại $x = 0$: Tử số tiến về $0$. Ta nhân lượng liên hợp:
    $limits(lim)_(x -> 0) (sqrt(x + 4) - 2)/(x(x + 1)) = limits(lim)_(x -> 0) (x + 4 - 4)/(x(x + 1)(sqrt(x + 4) + 2)) = limits(lim)_(x -> 0) 1/((x + 1)(sqrt(x + 4) + 2)) = 1/4 != oo$.]
    #step[Vì giới hạn hữu hạn nên $x = 0$ KHÔNG phải là tiệm cận đứng.]
    #step[Vậy đồ thị chỉ có 1 đường TCĐ là $x = -1$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm $m$ để đồ thị hàm số $y = (m x^2 + 2x - 1)/(x - 2)$ có tiệm cận xiên đi qua điểm $A(1; 5)$.],
  (
    True([$m = 1$.]),
    [$m = 2$.],
    [$m = -1$.],
    [$m = 3$.]
  ),
  loigiai: [
    #step[Điều kiện để hàm số có tiệm cận xiên là tử số có bậc 2 và $m != 0$, đồng thời $x = 2$ không phải là nghiệm của tử số (nghĩa là $4m + 4 - 1 != 0 <=> m != -3/4$).]
    #step[Chia đa thức: $y = m x + (2 + 2m) + (4m + 3)/(x - 2)$.]
    #step[Vậy phương trình tiệm cận xiên là: $y = m x + 2m + 2$.]
    #step[TCX đi qua $A(1; 5) => 5 = m(1) + 2m + 2 <=> 3m = 3 <=> m = 1$.]
  ]
)

#tn(
  dir: "ngang",
  [Đồ thị hàm số $y = (2x^2 + x + 1)/(x + 1)$ có hai đường tiệm cận tạo với hai trục tọa độ một tứ giác. Diện tích tứ giác đó bằng:],
  (
    [$1$.],
    True([$2$.]),
    [$3$.],
    [$4$.]
  ),
  loigiai: [
    #step[Tiệm cận đứng: $x = -1$.]
    #step[Thực hiện phép chia: $y = (2x^2 + x + 1)/(x + 1) = 2x - 1 + 2/(x + 1)$.]
    #step[Tiệm cận xiên: $y = 2x - 1$.]
    #step[Tứ giác được tạo bởi $x = 0, y = 0, x = -1, y = 2x - 1$. Các đỉnh của tứ giác là giao điểm của các đường này.]
    #step[- Giao TCĐ $x = -1$ và trục hoành $y = 0$: $A(-1; 0)$.
    - Giao TCX $y = 2x - 1$ và trục tung $x = 0$: $B(0; -1)$.
    - Giao của TCĐ và TCX: $I(-1; -3)$.
    - Gốc tọa độ $O(0; 0)$.]
    #step[Tứ giác tạo thành là hình thang vuông với hai cạnh đáy nằm trên TCĐ và trục tung. Diện tích tứ giác giới hạn bởi $x=0, x=-1, y=0$ và $y=2x-1$ là $S = integral_(-1)^0 |2x - 1| d x = integral_(-1)^0 (1 - 2x) d x = (x - x^2)|_(-1)^0 = 2$.]
  ]
)

#tn(
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.5, 0), (2.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
    line((0, -2.5), (0, 2.5), stroke: 0.8pt, mark: (end: "stealth"))
    content((2.3, -0.3), $x$)
    content((-0.3, 2.3), $y$)
    
    // TCD x = 1
    line((1, -2.5), (1, 2.5), stroke: (dash: "dashed", paint: red))
    // TCX y = x - 1
    line((-1.5, -2.5), (2.5, 1.5), stroke: (dash: "dashed", paint: red))
    
    // Right branch
    line(..range(0, 31).map(i => {
      let x = 1.1 + i * (2.5 - 1.1) / 30
      let y = x - 1 + 0.5 / (x - 1)
      (x, y)
    }).filter(p => p.at(1) <= 2.5 and p.at(1) >= -2.5), stroke: 1.2pt + blue)
    
    // Left branch
    line(..range(0, 31).map(i => {
      let x = -2.5 + i * (0.9 - (-2.5)) / 30
      let y = x - 1 + 0.5 / (x - 1)
      (x, y)
    }).filter(p => p.at(1) <= 2.5 and p.at(1) >= -2.5), stroke: 1.2pt + blue)
    
    content((1.3, -1.5), text(fill: red)[$x=1$])
    content((1.8, 0.4), text(fill: red)[$y=x-1$])
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Cho hàm số phân thức $y = (a x^2 + b x + c)/(x + d)$ có đồ thị như hình bên. Tọa độ giao điểm của hai tiệm cận là:],
  (
    [$I(1; 1)$.],
    [$I(-1; 0)$.],
    True([$I(1; 0)$.]),
    [$I(0; -1)$.]
  ),
  loigiai: [
    #step[Quan sát đồ thị, ta thấy:]
    #step[Đường tiệm cận đứng là $x = 1$.]
    #step[Đường tiệm cận xiên là một đường thẳng đi qua các điểm $(1; 0)$ và $(0; -1)$, có phương trình $y = x - 1$.]
    #step[Giao điểm của TCĐ $x = 1$ và TCX $y = x - 1$ là điểm $I(1; 0)$.]
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = (sqrt(x^2 - 4x + 3))/(x - 2)$. Đồ thị hàm số có bao nhiêu đường tiệm cận ngang?],
  (
    [$0$.],
    [$1$.],
    True([$2$.]),
    [$3$.]
  ),
  loigiai: [
    #step[Tập xác định: $x^2 - 4x + 3 >= 0 <=> x <= 1$ hoặc $x >= 3$.]
    #step[Xét giới hạn khi $x -> +oo$: 
    $limits(lim)_(x -> +oo) (sqrt(x^2(1 - 4/x + 3/x^2)))/(x - 2) = limits(lim)_(x -> +oo) (|x|sqrt(1 - 4/x + 3/x^2))/(x - 2) = limits(lim)_(x -> +oo) (x sqrt(...))/(x(1 - 2/x)) = 1$.
    Vậy $y = 1$ là một tiệm cận ngang.]
    #step[Xét giới hạn khi $x -> -oo$:
    $limits(lim)_(x -> -oo) (|x|sqrt(1 - 4/x + 3/x^2))/(x - 2) = limits(lim)_(x -> -oo) (-x sqrt(...))/(x(1 - 2/x)) = -1$.
    Vậy $y = -1$ là một tiệm cận ngang thứ hai.]
    #step[Do đó, đồ thị hàm số có 2 đường tiệm cận ngang.]
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",
  [Cho hàm số $y = (x^2 - 4)/(x^2 - 3x + 2)$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = RR \\ {1; 2}$.]),
    [Đồ thị hàm số có hai đường tiệm cận đứng là $x = 1$ và $x = 2$.],
    True([Đồ thị hàm số có một đường tiệm cận ngang là $y = 1$.]),
    [Tổng số đường tiệm cận (đứng và ngang) của đồ thị hàm số là $3$.]
  ),
  loigiai: [
    #step[a) Mẫu số $x^2 - 3x + 2 = 0 <=> x = 1$ hoặc $x = 2$. Tập xác định $D = RR \\ {1; 2}$. (Đúng)]
    #step[b) Tử số $x^2 - 4 = (x - 2)(x + 2)$. Rút gọn hàm số với $x != 2$: $y = ((x - 2)(x + 2))/((x - 1)(x - 2)) = (x + 2)/(x - 1)$. 
    Ta thấy $limits(lim)_(x -> 2) y = 4 != oo$ nên $x = 2$ KHÔNG là TCĐ. Chỉ có $x = 1$ là TCĐ. (Sai)]
    #step[c) $limits(lim)_(x -> oo) (x^2 - 4)/(x^2 - 3x + 2) = 1$. Tiệm cận ngang là $y = 1$. (Đúng)]
    #step[d) Đồ thị có 1 TCN ($y = 1$) và 1 TCĐ ($x = 1$). Tổng là 2 đường tiệm cận. (Sai)]
  ]
)

#ds(
  dir: "doc",
  [Cho hàm số $y = (2x^2 - x + 1)/(x - 1)$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Đồ thị hàm số có tiệm cận đứng là đường thẳng $x = 1$.]),
    [Đồ thị hàm số có tiệm cận ngang là đường thẳng $y = 2$.],
    True([Đồ thị hàm số có tiệm cận xiên là đường thẳng $y = 2x + 1$.]),
    True([Giao điểm của hai đường tiệm cận có tọa độ là $I(1; 3)$.])
  ),
  loigiai: [
    #step[a) $limits(lim)_(x -> 1^+) (2x^2 - x + 1)/(x - 1) = +oo$ nên $x = 1$ là tiệm cận đứng. (Đúng)]
    #step[b) Bậc của tử (2) lớn hơn bậc của mẫu (1) nên hàm số không có tiệm cận ngang. $limits(lim)_(x -> oo) y = oo$. (Sai)]
    #step[c) Chia đa thức: $2x^2 - x + 1 = (x - 1)(2x + 1) + 2$. Suy ra $y = 2x + 1 + 2/(x - 1)$. Vậy TCX là $y = 2x + 1$. (Đúng)]
    #step[d) Giao điểm của TCĐ $x = 1$ và TCX $y = 2x + 1$. Thay $x = 1$ vào TCX ta được $y = 3$. Vậy tọa độ giao điểm là $I(1; 3)$. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  [Cho đồ thị hàm số $y = f(x)$ có dạng $y = (a x + b)/(c x + d)$ ($c != 0$) và biết rằng đồ thị đi qua điểm $M(0; 1)$, nhận đường thẳng $x = -1$ làm tiệm cận đứng và $y = 2$ làm tiệm cận ngang. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Từ tiệm cận ngang ta suy ra được $a/c = 2$.]),
    [Từ tiệm cận đứng ta suy ra được $d/c = -1$.],
    True([Hàm số có dạng $y = (2x + 1)/(x + 1)$.]),
    True([Tâm đối xứng của đồ thị là $I(-1; 2)$.])
  ),
  loigiai: [
    #step[a) Tiệm cận ngang của hàm phân thức bậc 1/bậc 1 là $y = a/c$. Vậy $a/c = 2$. (Đúng)]
    #step[b) Tiệm cận đứng là $x = -d/c$. Giả thiết cho $x = -1$, suy ra $-d/c = -1 <=> d/c = 1$. (Sai)]
    #step[c) Ta có $a = 2c$ và $d = c$. Hàm số trở thành $y = (2c x + b)/(c x + c) = (2x + b/c)/(x + 1)$.
    Đồ thị đi qua $M(0; 1) => 1 = (0 + b/c)/(0 + 1) <=> b/c = 1$.
    Vậy $y = (2x + 1)/(x + 1)$. (Đúng)]
    #step[d) Tâm đối xứng của đồ thị hàm phân thức bậc 1/bậc 1 là giao điểm của TCĐ và TCN. TCĐ: $x = -1$, TCN: $y = 2$. Tâm đối xứng $I(-1; 2)$. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  [Cho hàm số $y = (sqrt(x^2 - 1) + x)/(x^2 - x)$. Xét tính đúng/sai:],
  (
    [Tập xác định của hàm số là $D = (-oo; -1] union [1; +oo)$.],
    True([Đồ thị hàm số có đúng một tiệm cận ngang $y = 0$.]),
    True([Đường thẳng $x = 0$ không phải là tiệm cận đứng.]),
    True([Đồ thị hàm số có đúng một đường tiệm cận đứng là $x = 1$.])
  ),
  loigiai: [
    #step[a) Điều kiện: $x^2 - 1 >= 0 <=> x <= -1$ hoặc $x >= 1$. 
    Đồng thời mẫu số $x^2 - x != 0 <=> x != 0$ và $x != 1$. 
    Kết hợp lại: $D = (-oo; -1] union (1; +oo)$. Mệnh đề a dùng dấu ngoặc vuông $[1; +oo)$ là Sai. (Sai)]
    #step[b) Xét TCN: 
    - Khi $x -> +oo$: $y = (x sqrt(1 - 1/x^2) + x)/(x^2(1 - 1/x)) = (x(1 + 1))/x^2 = 2/x -> 0$. TCN $y = 0$.
    - Khi $x -> -oo$: $y = (-x sqrt(1 - 1/x^2) + x)/(x^2(1 - 1/x)) = (x(-1 + 1))/x^2 = 0$. TCN $y = 0$.
    Vậy có đúng 1 TCN $y = 0$. (Đúng).]
    #step[c) Đường thẳng $x = 0$ không nằm trong các mút của tập xác định và hàm số không được định nghĩa lân cận $x = 0$ (vì từ $-1$ đến $1$ hàm số không xác định). Do đó không có giới hạn khi $x -> 0$. Vậy $x = 0$ không là TCĐ. (Đúng)]
    #step[d) Tại $x = 1$: Do tập xác định là $(1; +oo)$ (bên phải số 1), ta tính $limits(lim)_(x -> 1^+) (sqrt(x^2 - 1) + x)/(x(x - 1))$.
    Tử số tiến đến $1$. Mẫu số tiến đến $0^+$. Vậy giới hạn là $+oo$.
    Do đó $x = 1$ là TCĐ duy nhất. (Đúng)]
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (4 câu)], count: 4)

#tln(
  dir: "ngang",
  [Tìm số tiệm cận đứng của đồ thị hàm số $y = (x - 2)/(x^2 - 5x + 6)$.],
  [$1$],
  loigiai: [
    #step[Mẫu số $x^2 - 5x + 6 = 0 <=> x = 2$ hoặc $x = 3$.]
    #step[Tử số bằng $0$ tại $x = 2$. Ta phân tích hàm số:
    $y = (x - 2)/((x - 2)(x - 3))$.]
    #step[Với $x != 2$, hàm số trở thành $y = 1/(x - 3)$.]
    #step[Ta tính giới hạn: $limits(lim)_(x -> 2) y = -1 != oo$, nên $x = 2$ không là tiệm cận đứng.]
    #step[$limits(lim)_(x -> 3) y = oo$, nên $x = 3$ là tiệm cận đứng.]
    #step[Vậy đồ thị chỉ có $1$ tiệm cận đứng.]
  ]
)

#tln(
  dir: "ngang",
  [Hàm số $y = (x^2 + 2x + 3)/(x + 1)$ có một tiệm cận xiên là $y = a x + b$. Tính giá trị biểu thức $S = 2a - b$.],
  [$1$],
  loigiai: [
    #step[Chia đa thức: $x^2 + 2x + 3 = x(x + 1) + (x + 1) + 2 = (x + 1)^2 + 2$.]
    #step[Hàm số được viết lại: $y = (x + 1) + 2/(x + 1)$.]
    #step[Khi $x -> oo$, $2/(x + 1) -> 0$. Suy ra phương trình tiệm cận xiên là $y = x + 1$.]
    #step[Đồng nhất hệ số, ta có $a = 1$ và $b = 1$.]
    #step[Giá trị biểu thức $S = 2(1) - 1 = 1$.]
  ]
)

#tln(
  dir: "ngang",
  [Đồ thị hàm số $y = (sqrt(x^2 - x) - x)/(x - 1)$ có tất cả bao nhiêu đường tiệm cận?],
  [$3$],
  loigiai: [
    #step[Tập xác định: $x^2 - x >= 0 <=> x <= 0$ hoặc $x >= 1$. Kết hợp mẫu số $x != 1$, ta có $D = (-oo; 0] union (1; +oo)$.]
    #step[Tìm tiệm cận ngang:
    - Khi $x -> +oo$: 
      $y = (sqrt(x^2 - x) - x)/(x - 1) = (x^2 - x - x^2)/((x - 1)(sqrt(x^2 - x) + x)) = -x/((x - 1)(x sqrt(1 - 1/x) + x)) = -1/((1 - 1/x)(sqrt(1 - 1/x) + 1))$.
      Giới hạn là $limits(lim)_(x -> +oo) y = -1/2$. Có TCN $y = -1/2$.
    - Khi $x -> -oo$:
      $y = (|x|sqrt(1 - 1/x) - x)/(x - 1) = (-x(sqrt(1 - 1/x) + 1))/(x(1 - 1/x)) = -(sqrt(1 - 1/x) + 1)/(1 - 1/x)$.
      Giới hạn là $limits(lim)_(x -> -oo) y = -2$. Có TCN $y = -2$.]
    #step[Tìm tiệm cận đứng:
    Mẫu số bằng 0 tại $x = 1$. Ta xét giới hạn một bên khi $x -> 1^+$ (do $x > 1$):
    Tại $x = 1$, tử số tiến tới $sqrt(0) - 1 = -1 < 0$. Mẫu số tiến tới $0^+$.
    Suy ra $limits(lim)_(x -> 1^+) y = -oo$. Vậy $x = 1$ là tiệm cận đứng.]
    #step[Tổng cộng đồ thị có 3 đường tiệm cận.]
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $y = f(x) = (2x + 1)/(x - 1)$ có đồ thị $(C)$. Gọi $M$ là một điểm tùy ý nằm trên $(C)$. Tích khoảng cách từ điểm $M$ đến hai đường tiệm cận của $(C)$ bằng bao nhiêu?],
  [$3$],
  loigiai: [
    #step[Đồ thị có tiệm cận đứng $d_1: x = 1 <=> x - 1 = 0$ và tiệm cận ngang $d_2: y = 2 <=> y - 2 = 0$.]
    #step[Lấy điểm $M(m; (2m + 1)/(m - 1))$ thuộc $(C)$ với $m != 1$.]
    #step[Khoảng cách từ $M$ đến tiệm cận đứng $d_1$ là $d(M, d_1) = |m - 1|$.]
    #step[Khoảng cách từ $M$ đến tiệm cận ngang $d_2$ là $d(M, d_2) = lr(|(2m + 1)/(m - 1) - 2|) = lr(|(2m + 1 - 2m + 2)/(m - 1)|) = lr(|3/(m - 1)|) = 3/(|m - 1|)$.]
    #step[Tích hai khoảng cách là: $d(M, d_1) times d(M, d_2) = |m - 1| times 3/(|m - 1|) = 3$.]
    #step[Đây là một kết quả hằng số, không phụ thuộc vào vị trí của điểm $M$.]
  ]
)
