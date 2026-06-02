#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 03 - CHUYÊN ĐỀ HÀM PHÂN THỨC 2/1]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Tìm phương trình tiệm cận đứng của đồ thị hàm số $y = (x^2 - 3x + 2)/(x - 3)$.],
  (
    [$x = 1$],
    [$x = 2$],
    True([$x = 3$]),
    [$y = 3$],
  ),
  accent: c-book,
  loigiai: [
    #step[Tập xác định của hàm số: $D = RR without \\{3\\}$.]
    #step[Tại $x = 3$, mẫu số bằng $0$ nhưng tử số bằng $3^2 - 3(3) + 2 = 2 != 0$.]
    #step[Do đó, đường thẳng $x = 3$ là tiệm cận đứng của đồ thị hàm số.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm phương trình tiệm cận xiên của đồ thị hàm số $y = (2x^2 + 3x - 1)/(x + 1)$.],
  (
    [$y = 2x + 3$],
    [$y = 2x - 1$],
    [$y = 2x$],
    True([$y = 2x + 1$]),
  ),
  accent: c-book,
  loigiai: [
    #step[Thực hiện phép chia tử số cho mẫu số:]
    #step[$(2x^2 + 3x - 1) : (x + 1) = 2x + 1$ dư $-2$.]
    #step[Do đó, ta viết hàm số dưới dạng: $y = 2x + 1 - 2/(x + 1)$.]
    #step[Vì $lim_(x -> +- oo) (-2)/(x + 1) = 0$ nên đường thẳng $y = 2x + 1$ là tiệm cận xiên của đồ thị.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm hoành độ giao điểm của hai đường tiệm cận của đồ thị hàm số $y = (x^2 - x + 1)/(x - 2)$.],
  (
    [$x = 1$],
    True([$x = 2$]),
    [$x = -2$],
    [$x = 0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Giao điểm của hai đường tiệm cận chính là tâm đối xứng $I$ của đồ thị hàm số.]
    #step[Hoành độ của giao điểm này chính là nghiệm của mẫu số: $x - 2 = 0 <=> x = 2$.]
    #step[Do đó, hoành độ giao điểm của hai tiệm cận là $2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = (x^2 + a x + b)/(x + c)$ có đồ thị như hình vẽ bên dưới. 
   #v(0.3em)
   #align(center)[
     #cetz.canvas(length: 0.7cm, {
       import cetz.draw: *
       line((-3.2, 0), (4.2, 0), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       line((0, -4.2), (0, 4.2), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       content((4.0, -0.3), $x$)
       content((0.3, 3.9), $y$)
       content((-0.25, -0.25), $O$)
       
       // TCĐ x = 1 (dashed)
       line((1, -4.0), (1, 3.8), stroke: (paint: rgb("#b91c1c"), thickness: 0.5pt, dash: "dashed"))
       // TCX y = x (dashed)
       line((-3.0, -3.0), (3.5, 3.5), stroke: (paint: rgb("#b91c1c"), thickness: 0.5pt, dash: "dashed"))
       
       let f(x) = { x + 1 / (x - 1) }
       let pts_left = ()
       for i in range(25) {
         let x = -2.8 + i * 3.55 / 25
         pts_left.push((x, f(x)))
       }
       line(..pts_left, stroke: rgb("#0f4c81") + 1.2pt)
       
       let pts_right = ()
       for i in range(25) {
         let x = 1.25 + i * 2.55 / 25
         pts_right.push((x, f(x)))
       }
       line(..pts_right, stroke: rgb("#0f4c81") + 1.2pt)
     })
   ]
   Tính giá trị của biểu thức $P = a + b + c$, biết đồ thị hàm số đi qua điểm $A(2; 3)$.],
  (
    [$P = 1$],
    True([$P = -1$]),
    [$P = -3$],
    [$P = 0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đường tiệm cận đứng là $x = -c$. Từ đồ thị ta thấy tiệm cận đứng là $x = 1$, suy ra $-c = 1 => c = -1$.]
    #step[Thực hiện chia tử số cho mẫu số ta được: $y = frac(x^2 + a x + b, x + c) = x + (a - c) + frac(c(c - a) + b, x + c)$.]
    #step[Đường tiệm cận xiên của đồ thị hàm số là $y = x + (a - c)$. Từ đồ thị ta thấy tiệm cận xiên là $y = x$, suy ra $a - c = 0 => a = c = -1$.]
    #step[Khi đó hàm số trở thành $y = x + frac(b, x - 1)$. Đồ thị đi qua điểm $A(2; 3)$, thay tọa độ vào ta được: $3 = 2 + frac(b, 2 - 1) => b = 1$.]
    #step[Tính giá trị biểu thức: $P = a + b + c = -1 + 1 + (-1) = -1$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm số điểm cực trị của đồ thị hàm số $y = (x^2 + x + 1)/(x + 1)$.],
  (
    [$1$],
    True([$2$]),
    [$0$],
    [$3$],
  ),
  accent: c-book,
  loigiai: [
    #step[Ta có $y = x + 1/(x + 1)$.]
    #step[Tính đạo hàm: $y' = 1 - 1/(x + 1)^2$.]
    #step[Giải phương trình $y' = 0 <=> (x + 1)^2 = 1 <=> x = 0$ hoặc $x = -2$.]
    #step[Cả hai nghiệm này đều thuộc tập xác định $D = RR without \\{-1\\}$.]
    #step[Vì đạo hàm đổi dấu khi đi qua hai nghiệm này, hàm số có đúng $2$ điểm cực trị.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị hàm số $y = (x^2 - 2x)/(x - 1)$ cắt trục hoành tại các điểm nào?],
  (
    [$A(0; 0)$],
    [$B(2; 0)$],
    True([$A(0; 0)$ và $B(2; 0)$]),
    [Không cắt trục hoành],
  ),
  accent: c-book,
  loigiai: [
    #step[Phương trình hoành độ giao điểm với trục hoành: $(x^2 - 2x)/(x - 1) = 0 <=> x^2 - 2x = 0$ (với điều kiện $x != 1$).]
    #step[$<=> x = 0$ hoặc $x = 2$ (cả hai nghiệm đều thỏa mãn điều kiện $x != 1$).]
    #step[Vậy giao điểm của đồ thị với trục hoành là hai điểm $A(0; 0)$ và $B(2; 0)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm giao điểm của đường tiệm cận xiên của đồ thị hàm số $y = (x^2 - x + 2)/(x - 1)$ với trục tung $O y$.],
  (
    [$M(0; 1)$],
    True([$O(0; 0)$]),
    [$N(0; -1)$],
    [$P(0; 2)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Chia tử cho mẫu: $y = (x(x - 1) + 2)/(x - 1) = x + 2/(x - 1)$.]
    #step[Suy ra tiệm cận xiên là đường thẳng $d: y = x$.]
    #step[Giao điểm của tiệm cận xiên với trục tung $O y$ (cho $x = 0$): $y = 0$.]
    #step[Tọa độ giao điểm là gốc tọa độ $O(0; 0)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = (x^2 + m x - 1)/(x - 1)$. Tìm giá trị của tham số $m$ để đường tiệm cận xiên của đồ thị đi qua điểm $A(2; 5)$.],
  (
    [$m = 1$],
    True([$m = 2$]),
    [$m = -1$],
    [$m = 0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Ta chia đa thức tử số cho mẫu số: $x^2 + m x - 1 = x(x - 1) + (m + 1)x - 1 = x(x - 1) + (m + 1)(x - 1) + m$.]
    #step[Do đó, hàm số được viết dưới dạng: $y = x + m + 1 + m/(x - 1)$.]
    #step[Tiệm cận xiên là đường thẳng $d: y = x + m + 1$.]
    #step[Để đường tiệm cận xiên đi qua điểm $A(2; 5)$, ta thay tọa độ điểm $A$ vào phương trình tiệm cận xiên:]
    #step[$5 = 2 + m + 1 <=> 5 = m + 3 <=> m = 2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tọa độ tâm đối xứng $I$ của đồ thị hàm số $y = (x^2 + 2x - 3)/(x + 1)$.],
  (
    [$I(-1; 1)$],
    [$I(1; 0)$],
    True([$I(-1; 0)$]),
    [$I(-1; -2)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Chia tử cho mẫu: $x^2 + 2x - 3 = x(x + 1) + x - 3 = x(x + 1) + (x + 1) - 4$.]
    #step[Hàm số viết thành: $y = x + 1 - 4/(x + 1)$.]
    #step[Tiệm cận đứng: $x = -1$. Tiệm cận xiên: $y = x + 1$.]
    #step[Tâm đối xứng $I$ là giao điểm hai tiệm cận: thay $x = -1$ vào phương trình tiệm cận xiên ta được $y = -1 + 1 = 0$.]
    #step[Vậy tọa độ tâm đối xứng là $I(-1; 0)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm các khoảng nghịch biến của hàm số $y = (x^2 - 3x + 3)/(x - 2)$.],
  (
    [$(1; 3)$],
    True([$(1; 2)$ và $(2; 3)$]),
    [$(-oo; 1)$ và $(3; +oo)$],
    [Nghịch biến trên toàn bộ tập xác định],
  ),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = ((2x - 3)(x - 2) - (x^2 - 3x + 3))/(x - 2)^2 = (x^2 - 4x + 3)/(x - 2)^2$.]
    #step[Giải phương trình $y' = 0 <=> x^2 - 4x + 3 = 0 <=> x = 1$ hoặc $x = 3$.]
    #step[Bảng xét dấu đạo hàm cho thấy $y' < 0$ khi $x in (1; 3) without \\{2\\}$.]
    #step[Do đó, hàm số nghịch biến trên các khoảng $(1; 2)$ và $(2; 3)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị hàm số $y = (x^2 + 2x)/(x + 1)$ có bao nhiêu đường tiệm cận đứng và tiệm cận xiên?],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Hàm số xác định trên $D = RR without \\{-1\\}$.]
    #step[Tiệm cận đứng: $x = -1$ (do mẫu số bằng $0$ tại $x = -1$ nhưng tử số bằng $-1 != 0$).]
    #step[Tiệm cận xiên: Vì bậc tử lớn hơn bậc mẫu đúng 1 bậc, chia tử cho mẫu ta được $y = x + 1 - 1/(x + 1)$, suy ra tiệm cận xiên là $y = x + 1$.]
    #step[Tổng số tiệm cận đứng và tiệm cận xiên là $2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $f(x) = (x^2 - x + 1)/(x - 1)$. Tìm tất cả các giá trị thực của tham số $m$ để phương trình $f(|x|) = m$ có đúng $4$ nghiệm thực phân biệt.],
  (
    [$m > 1$],
    True([$m > 3$]),
    [$m < -1$],
    [$-1 < m < 3$],
  ),
  accent: c-book,
  loigiai: [
    #step[Xét hàm số $f(x) = x + frac(1, x - 1)$ trên $D = RR without \\{1\\}$.]
    #step[Đồ thị hàm số $y = f(|x|)$ được dựng bằng cách giữ nguyên phần đồ thị $y = f(x)$ nằm bên phải trục tung (ứng với $x >= 0, x != 1$) và lấy đối xứng phần đồ thị này qua trục tung.]
    #step[Xét tính biến thiên của $f(x)$ với $x >= 0$ ($x != 1$):
      - Tại $x = 0$ ta có $f(0) = -1$.
      - Trên khoảng $[0; 1)$, đạo hàm $f'(x) = 1 - frac(1, (x-1)^2) = frac(x(x-2), (x-1)^2) <= 0$ với mọi $x in [0; 1)$. Hàm số nghịch biến đi xuống từ $-1$ đến $-oo$.
      - Trên khoảng $(1; +oo)$, ta có $f'(x) = 0 <=> x = 2$. Hàm số đạt cực tiểu tại $x = 2$ với giá trị cực tiểu $f(2) = 3$.]
    #step[Khi lấy đối xứng qua trục tung ta được đồ thị hàm số $y = f(|x|)$ gồm:
      - Một phần hình chữ U ngược giới hạn trong khoảng $x in (-1; 1)$, đạt giá trị cực đại bằng $-1$ tại $x = 0$ và tiến về $-oo$ khi $x -> +-1$.
      - Hai nhánh hình chữ U xuôi nằm bên ngoài khoảng $[-1; 1]$, mỗi nhánh có một điểm cực tiểu là $(-2; 3)$ và $(2; 3)$, hai đầu tiến về $+oo$.]
    #step[Số nghiệm của phương trình $f(|x|) = m$ chính là số giao điểm của đồ thị $y = f(|x|)$ và đường thẳng nằm ngang $y = m$.]
    #step[Để phương trình có đúng 4 nghiệm thực phân biệt, đường thẳng $y = m$ phải cắt hai nhánh ngoài và nằm hoàn toàn phía trên hai điểm cực tiểu, tức là $m > 3$.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng - Sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x) = (x^2 - 2x + 2)/(x - 1)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Hàm số có tập xác định $D = RR without \\{1\\}$.]),
    True([Đồ thị hàm số có tiệm cận xiên là đường thẳng $y = x - 1$.]),
    True([Đồ thị hàm số có hai điểm cực trị.]),
    [Khoảng cách từ gốc tọa độ $O$ đến tiệm cận đứng của đồ thị bằng $2$.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Mẫu số khác $0 <=> x != 1$.
    - b) Đúng. Thực hiện chia tử cho mẫu: $y = (x(x - 1) - x + 2)/(x - 1) = x - 1 + 1/(x - 1)$. Suy ra tiệm cận xiên là $y = x - 1$.
    - c) Đúng. Ta có đạo hàm $y' = 1 - 1/(x-1)^2 = 0 <=> (x-1)^2 = 1 <=> x = 0$ hoặc $x = 2$ (thỏa mãn). Hàm số có 2 điểm cực trị.
    - d) Sai. Tiệm cận đứng là $x = 1$. Khoảng cách từ gốc tọa độ $O(0; 0)$ đến đường thẳng $x = 1$ bằng $|1| = 1$, không phải bằng $2$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = (x^2 + m x - 2)/(x + 1)$ (với $m$ là tham số thực). Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Với mọi giá trị $m != 3$, đồ thị hàm số luôn có tiệm cận đứng là đường thẳng $x = -1$.]),
    True([Khi $m = 3$, tiệm cận xiên của đồ thị hàm số có phương trình là $y = x + 2$.]),
    [Tung độ giao điểm của tiệm cận xiên với trục tung độc lập với tham số $m$.],
    [Đường tiệm cận xiên của đồ thị hàm số song song với đường thẳng $y = 2x$.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Nghiệm mẫu số là $x = -1$. Với $m != 3$, tử số tại $x = -1$ là $(-1)^2 + m(-1) - 2 = -1 - m != 0$, nên đường thẳng $x = -1$ là tiệm cận đứng.
    - b) Đúng. Khi $m = 3$, hàm số là $y = (x^2 + 3x - 2)/(x + 1) = x + 2 - 4/(x + 1)$. Tiệm cận xiên là $y = x + 2$.
    - c) Sai. Chia tử cho mẫu tổng quát: $y = x + m - 1 + (1 - m)/(x + 1)$. Tiệm cận xiên là $y = x + m - 1$. Giao điểm của tiệm cận xiên với trục tung (cho $x=0$) là $y = m - 1$, giá trị này thay đổi phụ thuộc vào $m$, nên không độc lập với $m$.
    - d) Sai. Hệ số góc của tiệm cận xiên là $1$, do đó tiệm cận xiên song song với đường thẳng $y = x$, không song song với $y = 2x$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho đồ thị hàm số $y = (x^2 - x + 1)/(x - 1)$ có hai tiệm cận cắt nhau tại điểm $I$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Tọa độ điểm $I$ là $I(1; 1)$.]),
    True([Độ dài đoạn thẳng $O I$ bằng $sqrt(2)$.]),
    True([Hàm số đạt cực tiểu tại điểm $B(2; 3)$.]),
    [Giá trị cực đại của hàm số lớn hơn giá trị cực tiểu của nó.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Chia tử cho mẫu: $y = x + 1/(x - 1)$. Tiệm cận đứng $x = 1$, tiệm cận xiên $y = x$. Giao điểm hai tiệm cận là $I(1; 1)$.
    - b) Đúng. Khoảng cách $O I = sqrt(1^2 + 1^2) = sqrt(2)$.
    - c) Đúng. Ta có đạo hàm $y' = 1 - 1/(x-1)^2 = 0 <=> x = 0$ (cực đại) hoặc $x = 2$ (cực tiểu). Với $x = 2$, tung độ tương ứng $y(2) = (4 - 2 + 1)/(2 - 1) = 3$. Điểm cực tiểu là $B(2; 3)$.
    - d) Sai. Cực đại đạt tại $x = 0$, giá trị cực đại $y_"CĐ" = y(0) = -1$. Cực tiểu đạt tại $x = 2$, giá trị cực tiểu $y_"CT" = y(2) = 3$. Ta thấy $y_"CĐ" = -1 < y_"CT" = 3$, do đó giá trị cực đại nhỏ hơn giá trị cực tiểu.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x) = (-x^2 + 3x - 3)/(x - 2)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    [Hàm số luôn nghịch biến trên từng khoảng xác định của nó.],
    True([Đường thẳng $y = -x + 1$ là tiệm cận xiên của đồ thị hàm số.]),
    [Hàm số có hai điểm cực trị nằm về hai phía đối với trục tung $O y$.],
    [Tâm đối xứng của đồ thị hàm số nằm ở góc phần tư thứ hai.],
  ),
  accent: c-book,
  loigiai: [
    - a) Sai. Ta viết lại hàm số: $y = -x + 1 - 1/(x - 2)$. Đạo hàm: $y' = -1 + 1/(x - 2)^2 = -(x^2 - 4x + 3)/(x - 2)^2$. Nghiệm của đạo hàm là $x = 1$ và $x = 3$. Vì đạo hàm đổi dấu qua hai nghiệm này, hàm số đồng biến trên $(1; 2)$ và $(2; 3)$ và nghịch biến trên $(-oo; 1)$, $(3; +oo)$.
    - b) Đúng. Theo phép chia, tiệm cận xiên là $y = -x + 1$.
    - c) Sai. Hoành độ hai cực trị là $x = 1 > 0$ và $x = 3 > 0$ nên chúng nằm cùng phía bên phải đối với trục tung $O y$.
    - d) Sai. Tâm đối xứng $I$ là giao điểm tiệm cận đứng $x = 2$ và tiệm cận xiên $y = -x + 1$. Ta có $y = -2 + 1 = -1$, suy ra $I(2; -1)$. Điểm này nằm ở góc phần tư thứ tư, không phải góc phần tư thứ hai.
  ],
))

#exam-part([PHẦN III. Câu hỏi trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Tìm hệ số góc của đường tiệm cận xiên của đồ thị hàm số $y = (3x^2 - x + 4)/(x - 2)$.],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Chia tử số cho mẫu số:]
    #step[$(3x^2 - x + 4) : (x - 2) = 3x + 5$ dư $14$.]
    #step[Hàm số viết thành: $y = 3x + 5 + 14/(x - 2)$.]
    #step[Tiệm cận xiên là đường thẳng $y = 3x + 5$, có hệ số góc bằng $3$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm tung độ giao điểm của tiệm cận xiên của đồ thị hàm số $y = (2x^2 + x - 1)/(x - 1)$ với trục tung $O y$.],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Chia tử số cho mẫu số:]
    #step[$(2x^2 + x - 1) : (x - 1) = 2x + 3$ dư $2$.]
    #step[Đồ thị hàm số có đường tiệm cận xiên là $y = 2x + 3$.]
    #step[Giao điểm của đường tiệm cận xiên với trục tung $O y$ (cho $x = 0$) là điểm có tung độ bằng $3$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm khoảng cách từ gốc tọa độ $O(0; 0)$ đến tiệm cận đứng của đồ thị hàm số $y = (x^2 - 4x + 5)/(x - 3)$.],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Đường tiệm cận đứng của đồ thị hàm số là đường thẳng $x = 3$.]
    #step[Khoảng cách từ gốc tọa độ $O(0; 0)$ đến đường thẳng thẳng đứng $x = 3$ bằng $3$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm độ dài đoạn thẳng nối hai điểm cực trị của đồ thị hàm số $y = (x^2 - 2x + 2)/(x - 1)$ (làm tròn kết quả đến hàng phần mười).],
  [$4.5$],
  accent: c-book,
  loigiai: [
    #step[Hàm số viết thành: $y = x - 1 + 1/(x - 1)$.]
    #step[Đạo hàm: $y' = 1 - 1/(x - 1)^2 = 0 <=> (x - 1)^2 = 1 <=> x = 2$ hoặc $x = 0$.]
    #step[Tọa độ hai điểm cực trị của đồ thị: $A(0; -2)$ và $B(2; 2)$.]
    #step[Độ dài đoạn thẳng nối hai cực trị: $A B = sqrt((2 - 0)^2 + (2 - (-2))^2) = sqrt(4 + 16) = sqrt(20) approx 4.47$.]
    #step[Làm tròn đến hàng phần mười, ta được $4.5$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm hoành độ giao điểm của đường tiệm cận xiên của đồ thị hàm số $y = (x^2 + x + 2)/(x + 2)$ với trục hoành.],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Chia tử số cho mẫu số: $x^2 + x + 2 = (x - 1)(x + 2) + 4$.]
    #step[Hàm số viết thành: $y = x - 1 + 4/(x + 2)$.]
    #step[Đồ thị có tiệm cận xiên là đường thẳng $y = x - 1$.]
    #step[Giao điểm của tiệm cận xiên với trục hoành (cho $y = 0$): $x - 1 = 0 <=> x = 1$.]
    #step[Vậy hoành độ giao điểm cần tìm là $1$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Có bao nhiêu điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (x^2 + 2x - 1)/(x - 1)$?],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Điều kiện xác định: $x != 1$.]
    #step[Thực hiện phép chia đa thức ở tử số cho mẫu số:]
    #step[$x^2 + 2x - 1 = (x + 3)(x - 1) + 2$.]
    #step[Viết lại hàm số dưới dạng: $y = x + 3 + frac(2, x - 1)$ (với $x in ZZ, x != 1$).]
    #step[Để điểm $M(x; y)$ thuộc đồ thị có tọa độ nguyên thì $x$ và $y$ phải là các số nguyên.]
    #step[Vì $x$ nguyên nên $x + 3$ nguyên, do đó $y$ nguyên khi và chỉ khi $frac(2, x - 1)$ là số nguyên.]
    #step[Điều này tương đương với $x - 1$ là ước nguyên của $2$.]
    #step[Tập các ước nguyên của $2$ là $U(2) = \{+-1; +-2\}$. Ta tìm được các giá trị tương ứng của $x$ và $y$:
      - $x - 1 = -2 => x = -1 => y = 1$ (thỏa mãn).
      - $x - 1 = -1 => x = 0 => y = 1$ (thỏa mãn).
      - $x - 1 = 1 => x = 2 => y = 7$ (thỏa mãn).
      - $x - 1 = 2 => x = 3 => y = 7$ (thỏa mãn).]
    #step[Có tất cả 4 bộ số nguyên $(x; y)$ thỏa mãn, tương ứng có đúng 4 điểm có tọa độ nguyên thuộc đồ thị hàm số đã cho.]
  ],
))
