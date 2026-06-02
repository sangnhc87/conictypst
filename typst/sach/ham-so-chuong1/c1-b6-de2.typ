#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 02 - CHUYÊN ĐỀ ĐIỂM ĐẶC BIỆT]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Tìm tọa độ điểm cố định $M$ của họ đường thẳng $y = m(x - 2) + x + 3$ với mọi giá trị của tham số $m$.],
  (
    [$M(2; 3)$],
    True([$M(2; 5)$]),
    [$M(-2; 1)$],
    [$M(0; 3)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Phương trình viết lại dưới dạng: $m(x - 2) + (x - y + 3) = 0$.]
    #step[Điểm cố định không phụ thuộc vào $m$ khi và chỉ khi:]
    #step[${ x - 2 = 0 \ x - y + 3 = 0 } <=> { x = 2 \ y = 5 }$.]
    #step[Vậy tọa độ điểm cố định của họ đường thẳng là $M(2; 5)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tọa độ giao điểm $I$ của hai đường tiệm cận của đồ thị hàm số $y = (x^2 - x + 2)/(x - 1)$.],
  (
    [$I(1; 0)$],
    [$I(1; -1)$],
    [$I(-1; -1)$],
    True([$I(1; 1)$]),
  ),
  accent: c-book,
  loigiai: [
    #step[Tiệm cận đứng của đồ thị hàm số là đường thẳng $x = 1$.]
    #step[Thực hiện phép chia tử cho mẫu ta được: $y = x + frac(2, x - 1)$.]
    #step[Đường tiệm cận xiên của đồ thị là $y = x$.]
    #step[Giao điểm của hai tiệm cận có hoành độ $x_I = 1$ và tung độ $y_I = x_I = 1$.]
    #step[Vậy giao điểm của hai tiệm cận là $I(1; 1)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đường thẳng đi qua hai điểm cực trị của đồ thị hàm số $y = x^3 - 3x^2 + 2$ có phương trình là:],
  (
    [$y = 2x - 2$],
    True([$y = -2x + 2$]),
    [$y = -2x$],
    [$y = 2x + 2$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = 3x^2 - 6x = 0 <=> x_1 = 0$ hoặc $x_2 = 2$.]
    #step[Hai điểm cực trị của đồ thị là $A(0; 2)$ và $B(2; -2)$.]
    #step[Đường thẳng đi qua hai điểm cực trị có dạng $y = a x + b$. Thay tọa độ $A$ và $B$ vào ta được:]
    #step[${ b = 2 \ 2a + b = -2 } <=> { a = -2 \ b = 2 }$.]
    #step[Vậy phương trình đường thẳng là $y = -2x + 2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tâm đối xứng $I$ của đồ thị hàm số $y = -x^3 + 3x^2 + 3x - 1$ có tọa độ là:],
  (
    [$I(1; 2)$],
    [$I(1; 0)$],
    True([$I(1; 4)$]),
    [$I(-1; 0)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm cấp một: $y' = -3x^2 + 6x + 3$.]
    #step[Đạo hàm cấp hai: $y'' = -6x + 6 = 0 <=> x_0 = 1$.]
    #step[Tung độ tâm đối xứng: $y_0 = y(1) = -1^3 + 3(1)^2 + 3(1) - 1 = 4$.]
    #step[Tâm đối xứng chính là điểm uốn $I(1; 4)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm khoảng cách nhỏ nhất giữa hai điểm bất kỳ thuộc hai nhánh khác nhau của đồ thị hàm số $y = (x + 1)/(x - 1)$.],
  (
    [$2$],
    [$2 sqrt(2)$],
    True([$4$]),
    [$4 sqrt(2)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Viết lại hàm số: $y = 1 + frac(2, x - 1)$ (với $x != 1$).]
    #step[Lấy điểm $M(1 - a; 1 - frac(2, a))$ thuộc nhánh trái ($a > 0$) và $N(1 + b; 1 + frac(2, b))$ thuộc nhánh phải ($b > 0$).]
    #step[Bình phương khoảng cách $M N$: $M N^2 = (a + b)^2 + (frac(2, a) + frac(2, b))^2 = (a + b)^2 [ 1 + frac(4, a^2 b^2) ]$.]
    #step[Theo bất đẳng thức Cô-si: $a + b >= 2 sqrt(a b)$ và $1 + frac(4, a^2 b^2) >= 2 sqrt(frac(4, a^2 b^2)) = frac(4, a b)$.]
    #step[Sử dụng tính chất đối xứng, giá trị nhỏ nhất đạt được khi $a = b = sqrt(2)$.]
    #step[Khi đó $M N^2 = (2 sqrt(2))^2 . [1 + frac(4, 4)] = 8 . 2 = 16 => M N = 4$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tọa độ điểm cố định duy nhất của họ đường cong $(C_m): y = m(x - 1)^2 + x^3 - 3x$.],
  (
    [$M(1; 0)$],
    True([$M(1; -2)$]),
    [$M(-1; 2)$],
    [$M(0; 0)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Phương trình viết về dạng: $m(x - 1)^2 + (x^3 - 3x - y) = 0$.]
    #step[Điểm cố định thỏa mãn với mọi $m$ khi và chỉ khi:]
    #step[${ (x - 1)^2 = 0 \ x^3 - 3x - y = 0 } <=> { x = 1 \ y = -2 }$.]
    #step[Vậy điểm cố định duy nhất là $M(1; -2)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho đồ thị $(C): y = (x + 2)/(x - 1)$. Khoảng cách ngắn nhất từ giao điểm $I$ của hai đường tiệm cận đến một điểm $M$ bất kỳ trên $(C)$ bằng bao nhiêu?],
  (
    [$3$],
    [$2$],
    True([$sqrt(6)$]),
    [$sqrt(3)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Giao điểm hai đường tiệm cận của đồ thị là $I(1; 1)$.]
    #step[Viết lại phương trình đồ thị: $y = 1 + frac(3, x - 1)$.]
    #step[Lấy điểm $M(x_0; y_0) in (C)$ ($x_0 != 1$). Ta có $y_0 - 1 = frac(3, x_0 - 1)$.]
    #step[Bình phương khoảng cách $I M$: $I M^2 = (x_0 - 1)^2 + (y_0 - 1)^2 = (x_0 - 1)^2 + frac(9, (x_0 - 1)^2)$.]
    #step[Áp dụng bất đẳng thức Cô-si: $I M^2 >= 2 sqrt((x_0 - 1)^2 . frac(9, (x_0 - 1)^2)) = 6$.]
    #step[Suy ra $I M >= sqrt(6)$. Khoảng cách ngắn nhất bằng $sqrt(6)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị hàm số $y = x^3 - 3x$ cắt trục Ox tại bao nhiêu điểm đối xứng nhau qua gốc tọa độ $O$?],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Phương trình hoành độ giao điểm với Ox: $x^3 - 3x = 0 <=> x(x^2 - 3) = 0 <=> x = 0$ hoặc $x = +- sqrt(3)$.]
    #step[Đồ thị cắt trục hoành tại 3 điểm: $A(-sqrt(3); 0)$, $O(0; 0)$ và $B(sqrt(3); 0)$.]
    #step[Dễ thấy 3 điểm này đối xứng nhau qua gốc tọa độ $O$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tâm đối xứng của đồ thị hàm số $y = (2x^2 - 3x + 2)/(x - 1)$ có tọa độ là:],
  (
    [$I(1; 2)$],
    True([$I(1; 1)$]),
    [$I(1; 3)$],
    [$I(-1; -3)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Thực hiện chia tử cho mẫu: $y = 2x - 1 + frac(1, x - 1)$.]
    #step[Đồ thị có tiệm cận đứng là $x = 1$, tiệm cận xiên là $y = 2x - 1$.]
    #step[Tâm đối xứng $I$ là giao điểm của hai tiệm cận, hoành độ $x_I = 1$.]
    #step[Tung độ tương ứng: $y_I = 2(1) - 1 = 1$. Vậy tọa độ là $I(1; 1)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho đồ thị $(C): y = (x + 2)/(x - 1)$. Tìm tọa độ điểm $M in (C)$ sao cho $M$ đối xứng với điểm $N(0; -2)$ qua giao điểm của hai tiệm cận.],
  (
    [$M(2; 2)$],
    True([$M(2; 4)$]),
    [$M(1; 4)$],
    [$M(3; 3.5)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Giao điểm hai tiệm cận của đồ thị $(C)$ là $I(1; 1)$.]
    #step[Gọi $M(x_M; y_M)$. Vì $M$ và $N(0; -2)$ đối xứng nhau qua $I(1; 1)$ nên:
      $x_M + x_N = 2x_I => x_M + 0 = 2 => x_M = 2$.]
    #step[Tung độ của điểm $M$: $y_M = y(2) = frac(2 + 2, 2 - 1) = 4$.]
    #step[Thử lại: $y_M + y_N = 4 + (-2) = 2 = 2y_I$ (thỏa mãn). Vậy $M(2; 4)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tham số $m$ để họ đồ thị $(C_m): y = x^3 - 3x^2 + m x + m - 1$ đi qua điểm $A(1; 2)$.],
  (
    [$m = 2$],
    [$m = 3$],
    True([$m = 2.5$]),
    [$m = 1.5$],
  ),
  accent: c-book,
  loigiai: [
    #step[Thay tọa độ $A(1; 2)$ vào phương trình đồ thị $(C_m)$ ta được:]
    #step[$2 = 1^3 - 3(1)^2 + m(1) + m - 1 <=> 2 = 1 - 3 + 2m - 1 <=> 2 = 2m - 3$.]
    #step[$<=> 2m = 5 <=> m = 2.5$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Hoành độ các điểm cực trị của đồ thị hàm số $y = x^3 - 3x^2 + 1$ đối xứng nhau qua đường thẳng nào?],
  (
    [$x = 0$],
    True([$x = 1$]),
    [$x = 2$],
    [$y = 0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Hai điểm cực trị của đồ thị hàm số bậc ba luôn đối xứng nhau qua điểm uốn.]
    #step[Đạo hàm cấp hai: $y'' = 6x - 6 = 0 <=> x = 1$. Hoành độ điểm uốn là $x_0 = 1$.]
    #step[Do đó hoành độ hai cực trị đối xứng nhau qua đường thẳng đứng $x = 1$.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng - Sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x) = (x^2 - x + 1)/(x - 1)$ có đồ thị là $(C)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Giao điểm của tiệm cận đứng và tiệm cận xiên của $(C)$ có tọa độ là $I(1; 1)$.]),
    True([Đồ thị $(C)$ nhận điểm $I(1; 1)$ làm tâm đối xứng.]),
    True([Hai điểm cực trị của đồ thị đối xứng nhau qua giao điểm hai tiệm cận.]),
    [Đồ thị $(C)$ nhận trục Oy làm trục đối xứng.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Tiệm cận đứng $x = 1$. Hàm số viết lại $y = x + 1/(x-1)$, tiệm cận xiên $y = x$. Giao điểm là $I(1; 1)$.
    - b) Đúng. Hàm phân thức bậc hai trên bậc nhất luôn nhận giao điểm hai tiệm cận làm tâm đối xứng.
    - c) Đúng. Hai điểm cực trị có hoành độ thỏa mãn $y' = 1 - 1/(x-1)^2 = 0 <=> x = 0$ hoặc $x = 2$. Cực đại là $(0; -1)$, cực tiểu là $(2; 3)$. Trung điểm của đoạn cực trị chính là $I(1; 1)$.
    - d) Sai. Đồ thị hàm số này không nhận Oy làm trục đối xứng.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho họ đường cong $(C_m): y = (m-1)x^3 - 3m x^2 + (m+2)x + 1$ (với $m$ là tham số thực). Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Khi $m = 1$, đồ thị hàm số trở thành một parabol có đỉnh là cực đại.]),
    True([Với mọi giá trị của $m$, họ đường cong luôn đi qua điểm $A(0; 1)$.]),
    [Họ đường cong $(C_m)$ nhận gốc tọa độ $O(0; 0)$ làm tâm đối xứng với $m = 0$.],
    True([Có đúng 3 điểm cố định của họ đường cong $(C_m)$ mà tại đó tọa độ của chúng độc lập với tham số $m$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Khi $m = 1$ ta được $y = -3x^2 + 3x + 1$ là một parabol có bề lõm quay xuống dưới, nên đỉnh của nó là điểm cực đại.
    - b) Đúng. Cho $x = 0 => y = 1$ với mọi $m$.
    - c) Sai. Họ đường cong luôn đi qua $(0; 1)$ nên không nhận $O(0; 0)$ làm tâm đối xứng.
    - d) Đúng. Biến đổi phương trình: $m(x^3 - 3x^2 + x) - x^3 + 2x + 1 - y = 0$. Các điểm cố định thỏa mãn $x^3 - 3x^2 + x = 0$ (có 3 nghiệm phân biệt thực). Tương ứng có 3 điểm cố định.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = (x + 2)/(x - 1)$ có đồ thị $(C)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Giao điểm của hai đường tiệm cận của đồ thị $(C)$ là $I(1; 1)$.]),
    True([Khoảng cách từ giao điểm hai tiệm cận $I$ đến điểm $M$ bất kỳ thuộc $(C)$ nhỏ nhất bằng $sqrt(6)$.]),
    True([Điểm $M(2; 4)$ và $N(0; -2)$ trên đồ thị đối xứng với nhau qua giao điểm hai tiệm cận $I$.]),
    [Đồ thị $(C)$ có hai điểm cực trị nằm hai phía đối với trục hoành.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Tiệm cận đứng $x = 1$, tiệm cận ngang $y = 1$.
    - b) Đúng. Bình phương khoảng cách $I M^2 = (x-1)^2 + 9/(x-1)^2 >= 6 => I M >= sqrt(6)$.
    - c) Đúng. Trung điểm của $M(2; 4)$ và $N(0; -2)$ có tọa độ $((2+0)/2; (4-2)/2) = (1; 1)$, chính là điểm $I$.
    - d) Sai. Hàm phân thức 1/1 không có điểm cực trị nào.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = x^3 - 3x^2 + 2$ có đồ thị $(C)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Hoành độ của hai điểm cực trị là nghiệm của phương trình đạo hàm $y' = 0$.]),
    True([Đường thẳng đi qua hai điểm cực trị của đồ thị có phương trình là $y = -2x + 2$.]),
    True([Điểm uốn của đồ thị cũng nằm trên đường thẳng đi qua hai điểm cực trị.]),
    True([Giao điểm của đường thẳng đi qua hai cực trị với trục hoành có hoành độ bằng $1$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Cực trị của đồ thị là $A(0; 2)$ và $B(2; -2)$. Hoành độ thỏa mãn $3x^2 - 6x = 0$.
    - b) Đúng. Đường thẳng đi qua hai cực trị là $y = -2x + 2$.
    - c) Đúng. Điểm uốn $I(1; 0)$ thỏa mãn: $0 = -2(1) + 2$.
    - d) Đúng. Giao điểm với Ox: $-2x + 2 = 0 <=> x = 1$.
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Tìm hoành độ điểm cố định duy nhất của họ đường cong $y = m(x - 2)^3 + x^2 - 3x + 1$ mà tại đó tọa độ của nó không phụ thuộc vào tham số $m$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Biến đổi phương trình về dạng gom tham số $m$:]
    #step[$m(x - 2)^3 + (x^2 - 3x + 1 - y) = 0$.]
    #step[Tọa độ điểm không phụ thuộc vào $m$ khi và chỉ khi $(x - 2)^3 = 0 <=> x = 2$.]
    #step[Vậy hoành độ điểm cố định là $2$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm khoảng cách nhỏ nhất giữa hai điểm bất kỳ thuộc hai nhánh khác nhau của đồ thị hàm số $y = (x + 1)/(x - 1)$.],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Như đã chứng minh ở câu trắc nghiệm khách quan Phần I, bình phương khoảng cách giữa hai điểm thuộc hai nhánh khác nhau của hyperbole đạt giá trị nhỏ nhất bằng $16$.]
    #step[Do đó, khoảng cách nhỏ nhất bằng $4$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm hoành độ tâm đối xứng của đồ thị hàm số $y = 2x^3 - 6x^2 + 5x - 3$.],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Đạo hàm cấp một: $y' = 6x^2 - 12x + 5$.]
    #step[Đạo hàm cấp hai: $y'' = 12x - 12$.]
    #step[Hoành độ tâm đối xứng chính là hoành độ điểm uốn, nghiệm của $y'' = 0 <=> 12x - 12 = 0 <=> x = 1$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho đồ thị $(C): y = (2x - 1)/(x - 1)$ có tâm đối xứng $I$. Gọi $M in (C)$ là điểm có hoành độ $x_M > 1$ sao cho khoảng cách $I M$ là ngắn nhất. Tính hoành độ của điểm $M$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Tâm đối xứng $I$ chính là giao điểm hai tiệm cận, tọa độ $I(1; 2)$.]
    #step[Với $M(x; y) in (C)$ ($x > 1$). Viết lại hàm số: $y = 2 + frac(1, x - 1)$.]
    #step[Bình phương khoảng cách $I M^2 = (x - 1)^2 + (y - 2)^2 = (x - 1)^2 + frac(1, (x - 1)^2)$.]
    #step[Áp dụng Cô-si: $I M^2 >= 2$. Đẳng thức xảy ra khi $(x - 1)^2 = frac(1, (x - 1)^2) <=> (x - 1)^4 = 1$.]
    #step[Vì $x > 1$ nên $x - 1 = 1 <=> x = 2$.]
    #step[Vậy hoành độ điểm $M$ thỏa mãn là $2$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho họ đồ thị $(C_m): y = x^3 - 3m x^2 + 3(m^2 - 1)x - m^3$. Tìm giá trị thực của tham số $m$ để tâm đối xứng của đồ thị thuộc trục hoành Ox.],
  [$0$],
  accent: c-book,
  loigiai: [
    #step[Đạo hàm cấp hai: $y'' = 6x - 6m = 0 <=> x = m$.]
    #step[Tọa độ tâm đối xứng $I(m; y_I)$, với tung độ:
      $y_I = m^3 - 3m(m^2) + 3(m^2 - 1)m - m^3 = -3m$.]
    #step[Tâm đối xứng thuộc trục hoành Ox khi và chỉ khi tung độ của nó bằng $0 <=> -3m = 0 <=> m = 0$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tính bình phương khoảng cách từ gốc tọa độ $O(0; 0)$ đến giao điểm của hai tiệm cận của đồ thị hàm số $y = (2x^2 + 5x - 3)/(x + 2)$.],
  [$13$],
  accent: c-book,
  loigiai: [
    #step[Chia tử số cho mẫu số ta được: $y = 2x + 1 - frac(5, x + 2)$.]
    #step[Đồ thị có tiệm cận đứng là $x = -2$, tiệm cận xiên là $y = 2x + 1$.]
    #step[Giao điểm của hai đường tiệm cận là $I(-2; y_I)$, với $y_I = 2(-2) + 1 = -3 => I(-2; -3)$.]
    #step[Bình phương khoảng cách $O I^2 = (-2)^2 + (-3)^2 = 4 + 9 = 13$.]
  ],
))

#pagebreak()

#exam-part([PHẦN IV. Bài toán thực tế bổ sung - Mức vận dụng (2 câu)], count: 2)

#q-wrap(dir: "ngang", ds(
  [Một khu nghỉ dưỡng có $120$ phòng. Nếu giá niêm yết là $1.5$ triệu đồng/phòng/đêm thì kín phòng. Cứ mỗi lần tăng thêm $0.1$ triệu đồng thì có $4$ phòng bị bỏ trống. Chi phí vận hành cho mỗi phòng có khách là $0.4$ triệu đồng/đêm, còn chi phí bảo trì cho mỗi phòng trống là $0.1$ triệu đồng/đêm. Gọi $x$ là số lần tăng giá. Xét các phát biểu sau:],
  (
    True([Số phòng được thuê là $120 - 4 x$.]),
    True([Hàm lợi nhuận là $L(x) = 132 + 7.2 x - 0.4 x^2$ (triệu đồng/đêm).]),
    [Lợi nhuận lớn nhất đạt được khi $x = 8$.],
    True([Giá niêm yết tối ưu là $2.4$ triệu đồng/phòng/đêm.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Mỗi lần tăng giá thì có $4$ phòng trống thêm, nên số phòng được thuê là $120 - 4 x$.
    - b) Đúng. Doanh thu: $R(x) = (1.5 + 0.1 x)(120 - 4 x) = 180 + 6 x - 0.4 x^2$. Chi phí: $C(x) = 0.4(120 - 4 x) + 0.1(4 x) = 48 - 1.2 x$. Do đó $L(x) = R(x) - C(x) = 132 + 7.2 x - 0.4 x^2$.
    - c) Sai. $L'(x) = 7.2 - 0.8 x = 0 <=> x = 9$.
    - d) Đúng. Với $x = 9$, giá tối ưu là $1.5 + 0.1 dot 9 = 2.4$ triệu đồng/phòng/đêm.
  ],
))

#q-wrap(dir: "doc", tln(
  [Một xe tải đi quãng đường $75$ km. Nếu chạy với vận tốc $30$ km/h thì chi phí nhiên liệu cho cả chuyến là $450$ nghìn đồng. Chi phí thời gian là $45$ nghìn đồng mỗi giờ. Hỏi vận tốc nào làm tổng chi phí nhỏ nhất và chi phí tối thiểu bằng bao nhiêu?],
  [$15$ km/h; $337.5$ nghìn đồng],
  accent: c-book,
  loigiai: [
    #step[Chi phí nhiên liệu cho cả chuyến có dạng $a v^2$. Từ $a dot 30^2 = 450$ suy ra $a = 0.5$.]
    #step[Chi phí thời gian có dạng $frac(b, v)$ với $b = 45 dot 75 = 3375$. Vậy $C(v) = 0.5 v^2 + frac(3375, v)$.]
    #step[$C'(v) = v - frac(3375, v^2) = 0 <=> v^3 = 3375 = 15^3$.]
    #step[Suy ra vận tốc tối ưu là $v = 15$ km/h.]
    #step[Chi phí tối thiểu là $C(15) = 0.5 dot 15^2 + frac(3375, 15) = 112.5 + 225 = 337.5$ nghìn đồng.]
  ],
))
