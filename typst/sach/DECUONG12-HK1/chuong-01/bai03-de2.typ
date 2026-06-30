#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 02 — Tiệm Cận Của Đồ Thị Hàm Số])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (10 câu)], count: 10)

#tn(
  dir: "ngang",
  [Cho hàm số $y = (2x^2 - 3x - 1)/(x - 2)$. Tiệm cận xiên của đồ thị hàm số là đường thẳng:],
  (
    [$y = 2x - 1$.],
    True([$y = 2x + 1$.]),
    [$y = 2x - 3$.],
    [$y = 2x + 3$.]
  ),
  loigiai: [
    #step[Thực hiện phép chia đa thức tử cho mẫu, ta có:]
    #step[$2x^2 - 3x - 1 = 2x(x - 2) + x - 1 = 2x(x - 2) + (x - 2) + 1 = (2x + 1)(x - 2) + 1$.]
    #step[Do đó, $y = (2x^2 - 3x - 1)/(x - 2) = 2x + 1 + 1/(x - 2)$.]
    #step[Vì $limits(lim)_(x -> oo) 1/(x - 2) = 0$ nên đường thẳng $y = 2x + 1$ là tiệm cận xiên của đồ thị hàm số.]
  ]
)

#tn(
  dir: "ngang",
  [Biết đồ thị hàm số $y = (x^2 - 2x + 2)/(x - 3)$ có tiệm cận xiên là đường thẳng $y = a x + b$. Tính giá trị của $a^2 + 2b$.],
  (
    [$4$.],
    [$2$.],
    [$5$.],
    True([$3$.])
  ),
  loigiai: [
    #step[Chia tử cho mẫu: $x^2 - 2x + 2 = x(x - 3) + x + 2 = x(x - 3) + (x - 3) + 5 = (x + 1)(x - 3) + 5$.]
    #step[Hàm số được viết lại thành: $y = x + 1 + 5/(x - 3)$.]
    #step[Vậy đường tiệm cận xiên có phương trình là $y = x + 1$.]
    #step[Từ đó suy ra $a = 1$ và $b = 1$.]
    #step[Giá trị biểu thức cần tính là: $a^2 + 2b = 1^2 + 2(1) = 3$.]
  ]
)

#tn(
  dir: "ngang",
  [Tiệm cận xiên của đồ thị hàm số $y = (x^3 + 2)/(x^2 - 2x)$ cắt hai trục tọa độ tại hai điểm $A$ và $B$. Diện tích tam giác $O A B$ bằng:],
  (
    True([$2$.]),
    [$4$.],
    [$8$.],
    [$3$.]
  ),
  loigiai: [
    #step[Thực hiện phép chia đa thức: $x^3 + 2 = x(x^2 - 2x) + 2x^2 + 2 = x(x^2 - 2x) + 2(x^2 - 2x) + 4x + 2 = (x + 2)(x^2 - 2x) + 4x + 2$.]
    #step[Khi đó $y = x + 2 + (4x + 2)/(x^2 - 2x)$.]
    #step[Vì $limits(lim)_(x -> oo) (4x + 2)/(x^2 - 2x) = 0$, nên đường tiệm cận xiên là $y = x + 2$.]
    #step[Giao điểm của tiệm cận xiên với trục $O x$ (cho $y = 0$): $x + 2 = 0 <=> x = -2 => A(-2; 0)$.]
    #step[Giao điểm của tiệm cận xiên với trục $O y$ (cho $x = 0$): $y = 2 => B(0; 2)$.]
    #step[Diện tích tam giác vuông $O A B$ là $S = 1/2 O A dot O B = 1/2 |-2| dot |2| = 2$.]
  ]
)

#tn(
  dir: "ngang",
  [Biết đồ thị hàm số $y = (x^3 + x + 1)/(x^2 - 1)$ có tiệm cận xiên là đường thẳng $d: y = a x + b$. Điểm nào dưới đây thuộc đường thẳng $d$?],
  (
    [$M(-1; 2)$.],
    True([$N(2; 2)$.]),
    [$P(2; -2)$.],
    [$Q(2; -1)$.]
  ),
  loigiai: [
    #step[Thực hiện phép chia đa thức: $x^3 + x + 1 = x(x^2 - 1) + 2x + 1$.]
    #step[Do đó $y = x + (2x + 1)/(x^2 - 1)$.]
    #step[Tiệm cận xiên của đồ thị là đường thẳng $d: y = x$.]
    #step[Thử tọa độ các điểm vào phương trình $y = x$, ta thấy chỉ có điểm $N(2; 2)$ thỏa mãn.]
  ]
)

#tn(
  dir: "ngang",
  [Đường thẳng $y = x + 1$ là tiệm cận xiên của đồ thị hàm số nào dưới đây?],
  (
    [$y = (x - 1)/(x^2 + 1)$.],
    True([$y = (x^2 + 2x + 3)/(x + 1)$.]),
    [$y = (x^2 + 1)/(x - 2)$.],
    [$y = (2x^2 + x + 1)/(2x + 1)$.]
  ),
  loigiai: [
    #step[Kiểm tra từng phương án:]
    #step[- Hàm $y = (x - 1)/(x^2 + 1)$ có TCN là $y = 0$, không có TCX.]
    #step[- Hàm $y = (x^2 + 2x + 3)/(x + 1) = ((x+1)^2 + 2)/(x+1) = x + 1 + 2/(x+1)$. Tiệm cận xiên là $y = x + 1$. Thỏa mãn!]
    #step[- Hàm $y = (x^2 + 1)/(x - 2) = x + 2 + 5/(x - 2)$. TCX là $y = x + 2$.]
    #step[- Hàm $y = (2x^2 + x + 1)/(2x + 1) = x + 1/(2x + 1)$. TCX là $y = x$.]
  ]
)

#tn(
  dir: "ngang",
  [Đường tiệm cận xiên của đồ thị hàm số $f(x) = 2x - 1 - 1/(x + 1)$ có phương trình là:],
  (
    [$y = x + 1$.],
    True([$y = 2x - 1$.]),
    [$y = x - 1$.],
    [$y = 2x + 1$.]
  ),
  loigiai: [
    #step[Hàm số đã cho được viết dưới dạng $y = a x + b + R(x)$ với $R(x) = -1/(x + 1)$.]
    #step[Vì $limits(lim)_(x -> oo) R(x) = limits(lim)_(x -> oo) -1/(x + 1) = 0$ nên đường thẳng $y = 2x - 1$ chính là tiệm cận xiên của đồ thị hàm số.]
  ]
)

#tn(
  dir: "ngang",
  [Giao điểm của hai đường tiệm cận của đồ thị hàm số $y = (x^2 + 2x - 3)/(x + 1)$ nằm trên đường thẳng nào sau đây?],
  (
    True([$y = x + 1$.]),
    [$y = x - 1$.],
    [$y = 2x + 1$.],
    [$y = -x - 1$.]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {-1}$.]
    #step[Tiệm cận đứng: $x = -1$ (vì $x = -1$ là nghiệm của mẫu nhưng không là nghiệm của tử).]
    #step[Chia đa thức: $x^2 + 2x - 3 = x(x + 1) + x - 3 = x(x + 1) + 1(x + 1) - 4 = (x + 1)^2 - 4$.]
    #step[Suy ra $y = x + 1 - 4/(x + 1)$. Tiệm cận xiên là đường thẳng $y = x + 1$.]
    #step[Giao điểm của TCĐ $x = -1$ và TCX $y = x + 1$ là $I(-1; 0)$.]
    #step[Kiểm tra các đáp án: điểm $I(-1; 0)$ thỏa mãn phương trình $y = x + 1$ vì $0 = -1 + 1$. Vậy $I$ nằm trên đường thẳng $y = x + 1$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm khoảng cách $d$ từ gốc tọa độ $O$ đến tiệm cận xiên của đồ thị hàm số $y = (2x^2 - x + 1)/(x - 1)$.],
  (
    [$d = 1/sqrt(2)$.],
    True([$d = 1/sqrt(5)$.]),
    [$d = 2/sqrt(5)$.],
    [$d = 3/sqrt(5)$.]
  ),
  loigiai: [
    #step[Thực hiện phép chia: $y = (2x^2 - x + 1)/(x - 1) = (2x(x - 1) + x + 1)/(x - 1) = (2x(x - 1) + (x - 1) + 2)/(x - 1) = 2x + 1 + 2/(x - 1)$.]
    #step[Tiệm cận xiên là $d: y = 2x + 1 <=> 2x - y + 1 = 0$.]
    #step[Khoảng cách từ gốc $O(0; 0)$ đến $d$ là $d(O, d) = |2(0) - 0 + 1| / sqrt(2^2 + (-1)^2) = 1/sqrt(5)$.]
  ]
)

#tn(
  dir: "ngang",
  [Số đường tiệm cận của đồ thị hàm số $y = (sqrt(x + 9) - 3)/(x^2 - 2x)$ là:],
  (
    [$1$.],
    True([$2$.]),
    [$3$.],
    [$4$.]
  ),
  loigiai: [
    #step[Tập xác định: $x + 9 >= 0 <=> x >= -9$. Mẫu số khác $0 => x != 0$ và $x != 2$.]
    #step[Tiệm cận ngang: $limits(lim)_(x -> +oo) (sqrt(x + 9) - 3)/(x^2 - 2x) = 0$. Có 1 TCN là $y = 0$.]
    #step[Tiệm cận đứng:]
    #step[- Tại $x = 2$: $limits(lim)_(x -> 2) y = (sqrt(11) - 3)/0 = oo$. Vậy $x = 2$ là 1 TCĐ.]
    #step[- Tại $x = 0$: $limits(lim)_(x -> 0) (sqrt(x + 9) - 3)/(x(x - 2)) = limits(lim)_(x -> 0) (x + 9 - 9)/(x(x - 2)(sqrt(x + 9) + 3)) = limits(lim)_(x -> 0) 1/((x - 2)(sqrt(x + 9) + 3)) = 1/(-2(3 + 3)) = -1/12$. Giới hạn hữu hạn nên $x = 0$ không là TCĐ.]
    #step[Vậy đồ thị có tổng cộng 2 đường tiệm cận ($x=2$ và $y=0$).]
  ]
)

#tn(
  dir: "ngang",
  [Tìm tất cả các giá trị của tham số $m$ để đồ thị hàm số $y = (x^2 - m x + 1)/(x - 1)$ có tiệm cận xiên tạo với hai trục tọa độ một tam giác có diện tích bằng $2$.],
  (
    True([$m = -1$ hoặc $m = 3$.]),
    [$m = -1$ hoặc $m = 5$.],
    [$m = 3$ hoặc $m = -5$.],
    [$m = 1$ hoặc $m = 5$.]
  ),
  loigiai: [
    #step[Chia tử cho mẫu: $x^2 - m x + 1 = x(x - 1) + (1-m)x + 1 = x(x - 1) + (1-m)(x - 1) + 2 - m$.]
    #step[Suy ra $y = x + 1 - m + (2 - m)/(x - 1)$.]
    #step[Điều kiện để có tiệm cận xiên là phần dư khác $0 <=> 2 - m != 0 <=> m != 2$.]
    #step[Khi đó TCX là $d: y = x + 1 - m$.]
    #step[Giao của $d$ với $O x$: Cho $y = 0 => x = m - 1 => A(m - 1; 0)$.]
    #step[Giao của $d$ với $O y$: Cho $x = 0 => y = 1 - m => B(0; 1 - m)$.]
    #step[Diện tích tam giác $O A B$ là $S = 1/2 O A dot O B = 1/2 |m - 1| dot |1 - m| = 1/2 (m - 1)^2$.]
    #step[Đề bài cho $S = 2 <=> 1/2 (m - 1)^2 = 2 <=> (m - 1)^2 = 4 <=> m - 1 = 2$ hoặc $m - 1 = -2$.]
    #step[Suy ra $m = 3$ hoặc $m = -1$.]
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",
  [Cho hàm số $y = (2x^2 + x - 3)/(x - 1)$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    [Đồ thị hàm số có đường tiệm cận đứng là $x = 1$.],
    True([Đồ thị hàm số là một đường thẳng bị khuyết một điểm.]),
    [Hàm số có đường tiệm cận xiên là $y = 2x + 3$.],
    True([Giới hạn $limits(lim)_(x -> 1) y = 5$.])
  ),
  loigiai: [
    #step[a) Ta có tử số $2x^2 + x - 3 = (x - 1)(2x + 3)$. Rút gọn $y = ((x - 1)(2x + 3))/(x - 1) = 2x + 3$ (với điều kiện $x != 1$). Giới hạn tại $x = 1$ là hữu hạn nên $x = 1$ không phải là TCĐ. (Sai)]
    #step[b) Đồ thị hàm số là phần của đường thẳng $y = 2x + 3$ nhưng bỏ đi điểm $(1; 5)$ do tập xác định $x != 1$. (Đúng)]
    #step[c) Vì hàm số thực chất là đường thẳng $y = 2x + 3$ (bị thủng một lỗ), nên nó không có tiệm cận xiên. Các khái niệm tiệm cận chỉ áp dụng cho hàm số tiến ra vô cực hoặc có điểm kỳ dị mà tại đó giới hạn là vô cực. (Sai)]
    #step[d) $limits(lim)_(x -> 1) (2x^2 + x - 3)/(x - 1) = limits(lim)_(x -> 1) (2x + 3) = 5$. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  [Cho hàm số $y = (x^2 - x + 2)/(x + 1)$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Đồ thị hàm số có một đường tiệm cận đứng là $x = -1$.]),
    True([Đường tiệm cận xiên của đồ thị hàm số đi qua điểm $A(2; 0)$.]),
    [Tâm đối xứng của đồ thị là điểm $I(-1; 3)$.],
    True([Khoảng cách từ điểm $M(0; 2)$ trên đồ thị đến đường tiệm cận đứng bằng $1$.])
  ),
  loigiai: [
    #step[a) Tại $x = -1$, tử số bằng $4 != 0$, mẫu số bằng $0$. Vậy $x = -1$ là tiệm cận đứng. (Đúng)]
    #step[b) Chia đa thức: $x^2 - x + 2 = x(x + 1) - 2x + 2 = x(x + 1) - 2(x + 1) + 4 = (x - 2)(x + 1) + 4$.
    Suy ra $y = x - 2 + 4/(x + 1)$. Tiệm cận xiên là $y = x - 2$. 
    Thay $x = 2$ vào TCX: $y = 2 - 2 = 0$. Vậy TCX đi qua $A(2; 0)$. (Đúng)]
    #step[c) Tâm đối xứng là giao điểm của TCĐ và TCX. Thay $x = -1$ vào TCX: $y = -1 - 2 = -3$. Tâm đối xứng là $I(-1; -3)$. (Sai)]
    #step[d) Khoảng cách từ điểm $M(0; 2)$ đến đường thẳng $x = -1$ (hay $x + 1 = 0$) là $d = |0 + 1|/1 = 1$. (Đúng)]
  ]
)

#ds(
  dir: "doc",lines: 2,
  [Cho hàm số $y = f(x)$ xác định trên $D = RR \\ {-1; 1}$ và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'$,
        func: $f$,
        x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
        d-signs: ("-", "||", "-", "0", "+", "||", "+"),
        v-vals: ($2$, ($-oo$, $+oo$), $3$, ($+oo$, $-oo$), $2$),
        // ranks: (1, (-1, 2), 1, (2, -1), 1)
      )
    ]
  Xét tính đúng/sai:],
  (
    [Đồ thị hàm số không có tiệm cận ngang.],
    True([Đồ thị hàm số có đúng hai đường tiệm cận đứng là $x = -1$ và $x = 1$.]),
    True([Tổng số đường tiệm cận của đồ thị hàm số là $3$.]),
    [Giá trị cực tiểu của hàm số lớn hơn giá trị của tiệm cận ngang.]
  ),
  loigiai: [
    #step[a) Từ bảng biến thiên: $limits(lim)_(x -> -oo) f(x) = 2$ và $limits(lim)_(x -> +oo) f(x) = 2$. Đồ thị có tiệm cận ngang $y = 2$. (Sai)]
    #step[b) Giới hạn tại $x = -1$: $limits(lim)_(x -> -1^-) f(x) = -oo$ và $limits(lim)_(x -> -1^+) f(x) = +oo$ nên $x = -1$ là TCĐ.
    Giới hạn tại $x = 1$: $limits(lim)_(x -> 1^-) f(x) = +oo$ và $limits(lim)_(x -> 1^+) f(x) = -oo$ nên $x = 1$ là TCĐ. (Đúng)]
    #step[c) Tổng số tiệm cận là 1 (ngang) + 2 (đứng) = 3 đường. (Đúng)]
    #step[d) Hàm số đạt cực tiểu tại $x = 0$, $y_("CT") = 3$. Giá trị tiệm cận ngang là $y = 2$. $3 > 2$. (Đúng)]
  ]
)

#ds(
  dir: "doc",lines: 4,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-3.5, 0), (2.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
    line((0, -2.5), (0, 2.5), stroke: 0.8pt, mark: (end: "stealth"))
    content((2.3, -0.3), $x$)
    content((-0.3, 2.3), $y$)
    content((-0.3, -0.3), $O$)
    
    // TCD x = -1
    line((-1, -2.5), (-1, 2.5), stroke: (dash: "dashed", paint: red))
    // TCX y = x + 1
    line((-3.5, -2.5), (1.5, 2.5), stroke: (dash: "dashed", paint: red))
    
    // Curves (Hàm phân thức bậc 2 / bậc 1 chuẩn: y = x + 1 + 1/(x + 1))
    // Right branch
    line(..range(0, 41).map(i => {
      let x = -0.7 + i * (2.5 - (-0.7)) / 40
      let y = x + 1 + 1.0 / (x + 1)
      (x, y)
    }).filter(p => p.at(1) <= 2.5 and p.at(1) >= -2.5), stroke: 1.2pt + blue)
    
    // Left branch
    line(..range(0, 41).map(i => {
      let x = -3.5 + i * (-1.3 - (-3.5)) / 40
      let y = x + 1 + 1.0 / (x + 1)
      (x, y)
    }).filter(p => p.at(1) <= 2.5 and p.at(1) >= -2.5), stroke: 1.2pt + blue)
    
    content((-1.6, -2.2), text(fill: red)[$x=-1$])
    content((1.2, 2.5), text(fill: red)[$y=x+1$])
    // Mark intersection (0, 2)
    circle((0, 2), radius: 0.05, fill: black)
    content((-0.3, 1.8), $2$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Cho hàm số $f(x) = (a x^2 + b x + c)/(x + n)$ (với $a, b, c, n in RR$, $a != 0$) có đồ thị như hình vẽ. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Đường tiệm cận đứng của đồ thị hàm số là $x = -1$.]),
    True([Giá trị của biểu thức $a + b + c$ bằng $5$.]),
    [Điểm cực đại của đồ thị hàm số là $M(0; 2)$.],
    True([Có đúng $3$ giá trị nguyên của tham số $m$ để phương trình $f(x) = m$ vô nghiệm.])
  ),
  loigiai: [
    #step[a) Quan sát đồ thị, ta thấy đường thẳng $x = -1$ là đường tiệm cận đứng. (Đúng)]
    #step[b) Từ TCĐ $x = -1 => n = 1$. Đồ thị có tiệm cận xiên đi qua $(-1; 0)$ và $(0; 1)$ nên phương trình TCX là $y = x + 1$. 
    Mặt khác, $f(x) = (a x^2 + b x + c)/(x + 1) = a x + b - a + (c - b + a)/(x + 1)$.
    Suy ra TCX là $y = a x + b - a$. Đồng nhất hệ số ta được $a = 1$ và $b - a = 1 => b = 2$.
    Đồ thị cắt trục tung tại điểm $(0; 2)$ nên $f(0) = 2 <=> c/1 = 2 => c = 2$.
    Vậy $a + b + c = 1 + 2 + 2 = 5$. (Đúng)]
    #step[c) Hàm số là $y = (x^2 + 2x + 2)/(x + 1) = x + 1 + 1/(x + 1)$. 
    Đạo hàm $y' = 1 - 1/(x + 1)^2$. $y' = 0 <=> (x + 1)^2 = 1 <=> x = 0$ hoặc $x = -2$.
    Quan sát đồ thị hoặc lập BBT, ta thấy $x = 0$ là điểm cực tiểu, $x = -2$ là điểm cực đại. Do đó $M(0; 2)$ là điểm cực tiểu. (Sai)]
    #step[d) Dựa vào đồ thị, giá trị cực đại là $y_("CĐ") = f(-2) = -2$, giá trị cực tiểu là $y_("CT") = f(0) = 2$.
    Phương trình $f(x) = m$ vô nghiệm khi đường thẳng $y = m$ không cắt đồ thị, tức là nằm giữa hai cực trị: $-2 < m < 2$.
    Vì $m in ZZ$ nên $m in {-1; 0; 1}$. Có đúng $3$ giá trị nguyên thỏa mãn. (Đúng)]
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Tìm tọa độ tung độ $y_0$ của tâm đối xứng của đồ thị hàm số $y = (x^2 + 3x + 3)/(x + 1)$.],
  [$1$],
  loigiai: [
    #step[Tiệm cận đứng của đồ thị là $x = -1$.]
    #step[Phép chia: $x^2 + 3x + 3 = x(x + 1) + 2x + 3 = x(x + 1) + 2(x + 1) + 1 = (x + 2)(x + 1) + 1$.]
    #step[Tiệm cận xiên là đường thẳng $y = x + 2$.]
    #step[Tâm đối xứng là giao của hai tiệm cận. Thay $x = -1$ vào TCX: $y = -1 + 2 = 1$.]
    #step[Tung độ tâm đối xứng $y_0 = 1$.]
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $y = (a x^2 + b x + c)/(x + n)$ có đồ thị $(C)$ nhận đường thẳng $x = 2$ làm tiệm cận đứng và đường thẳng $y = x - 3$ làm tiệm cận xiên. Tính giá trị $b + n$.],
  [$-7$],
  loigiai: [
    #step[Vì $x = 2$ là tiệm cận đứng nên nghiệm của mẫu là $2 => 2 + n = 0 <=> n = -2$.]
    #step[Hàm số có dạng $y = (a x^2 + b x + c)/(x - 2)$.]
    #step[Chia đa thức: $a x^2 + b x + c = a x(x - 2) + (2a + b)x + c = a x(x - 2) + (2a + b)(x - 2) + 2(2a + b) + c$.]
    #step[Thương là $y = a x + 2a + b$. Đây chính là phương trình tiệm cận xiên.]
    #step[Đồng nhất hệ số với tiệm cận xiên $y = x - 3$, ta có hệ:
    $cases(
      a = 1,
      2a + b = -3
    ) => cases(
      a = 1,
      2(1) + b = -3 => b = -5
    )$]
    #step[Vậy $b + n = -5 + (-2) = -7$.]
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $y = (2x + 1)/(x - 1)$. Khoảng cách ngắn nhất giữa hai điểm bất kỳ thuộc hai nhánh của đồ thị hàm số bằng $sqrt(a)$. Tìm số nguyên $a$.],
  [$24$],
  loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = 1$ và tiệm cận ngang $y = 2$. Tâm đối xứng là $I(1; 2)$.]
    #step[Khoảng cách từ điểm $M(x; (2x + 1)/(x - 1))$ đến $I(1; 2)$ bình phương là:
    $I M^2 = (x - 1)^2 + ((2x + 1)/(x - 1) - 2)^2 = (x - 1)^2 + (3/(x - 1))^2$.]
    #step[Áp dụng bất đẳng thức AM-GM: $(x - 1)^2 + 9/(x - 1)^2 >= 2sqrt(9) = 6$.]
    #step[Suy ra $I M >= sqrt(6)$.]
    #step[Khoảng cách ngắn nhất giữa hai điểm trên hai nhánh là $2 I M_("min") = 2sqrt(6) = sqrt(24)$.]
    #step[Vậy $a = 24$.]
  ]
)

#tln(
  dir: "ngang",
  [Tìm số đường tiệm cận của đồ thị hàm số $y = (x - 1)/(x^2 - 1) + sqrt(x^2 - 4)/x$.],
  [$2$],
  loigiai: [
    #step[Tập xác định: $x^2 - 4 >= 0 <=> x <= -2$ hoặc $x >= 2$. 
    Hàm phân thức $x^2 - 1 != 0 <=> x != +-1$, luôn đúng trên miền xác định.
    Vậy $D = (-oo; -2] union [2; +oo)$.]
    #step[Tiệm cận ngang: 
    - Khi $x -> +oo$: $y = (x - 1)/(x^2 - 1) + (x sqrt(1 - 4/x^2))/x = 1/(x + 1) + sqrt(1 - 4/x^2) -> 0 + 1 = 1$. TCN $y = 1$.
    - Khi $x -> -oo$: $y = (x - 1)/(x^2 - 1) + (-x sqrt(1 - 4/x^2))/x = 1/(x + 1) - sqrt(1 - 4/x^2) -> 0 - 1 = -1$. TCN $y = -1$.]
    #step[Tiệm cận đứng: Hàm số chỉ có mẫu số là $x^2 - 1$ và $x$. Các điểm làm mẫu bằng 0 ($x=1, x=-1, x=0$) đều không thuộc tập xác định và không nằm ở lân cận của tập xác định. Do đó không có tiệm cận đứng.]
    #step[Tổng số đường tiệm cận là 2.]
  ]
)

#tln(
  dir: "ngang",
  [Biết đồ thị hàm số $y = (m x^2 + 3x - 1)/(x + 2)$ có đường tiệm cận xiên $d$. Tìm $m$ để đường thẳng $d$ song song với đường thẳng $y = 2x + 1$.],
  [$2$],
  loigiai: [
    #step[Điều kiện để có TCX là tử có bậc 2 ($m != 0$) và $x = -2$ không là nghiệm tử.]
    #step[Chia đa thức: $m x^2 + 3x - 1 = m x(x + 2) + (3 - 2m)x - 1 = m x(x + 2) + (3 - 2m)(x + 2) - 2(3 - 2m) - 1$.]
    #step[Thương là $y = m x + 3 - 2m$. Đây chính là TCX $d$.]
    #step[Để $d$ song song với $y = 2x + 1$ thì hệ số góc phải bằng nhau và tung độ gốc khác nhau.]
    #step[$cases(m = 2, 3 - 2m != 1) <=> cases(m = 2, 3 - 4 != 1 " (luôn đúng)")$.]
    #step[Vậy $m = 2$.]
  ]
)

#tln(
  dir: "ngang",
  [Một công ty sản xuất một loại chip điện tử. Chi phí trung bình để sản xuất $x$ con chip (đơn vị: nghìn con) được tính bởi hàm số $C(x) = 2x + 15 + 30/x$ (triệu đồng). Khi số lượng chip sản xuất ra ngày càng lớn ($x -> +oo$) thì chi phí trung bình sản xuất mỗi con chip tiệm cận tới mức biểu diễn bởi đường thẳng $y = a x + b$. Tính $a + b$.],
  [$17$],
  loigiai: [
    #step[Đường tiệm cận mà hàm chi phí hướng tới khi $x -> +oo$ chính là tiệm cận xiên của đồ thị hàm số $C(x)$.]
    #step[Ta có $C(x) = 2x + 15 + 30/x$.]
    #step[Vì $limits(lim)_(x -> +oo) 30/x = 0$, nên tiệm cận xiên của đồ thị là đường thẳng $y = 2x + 15$.]
    #step[Đồng nhất hệ số, ta có $a = 2$ và $b = 15$.]
    #step[Tổng $a + b = 2 + 15 = 17$.]
  ]
)
