#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 02 - CHUYÊN ĐỀ HÀM PHÂN THỨC 1/1]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = (2x - 1)/(x + 1)$. Đường thẳng nào sau đây là tiệm cận đứng của đồ thị hàm số?],
  (
    [$x = 1$],
    True([$x = -1$]),
    [$y = 2$],
    [$y = -1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Hàm số xác định trên $D = RR without \\{-1\\}$.]
    #step[Tại $x = -1$, mẫu số bằng $0$ nhưng tử số bằng $-3 != 0$.]
    #step[Do đó, đường thẳng $x = -1$ là tiệm cận đứng của đồ thị hàm số.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tiệm cận ngang của đồ thị hàm số $y = (3 - 2x)/(x - 1)$.],
  (
    [$y = 3$],
    [$y = -1$],
    True([$y = -2$]),
    [$x = 1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Ta tính giới hạn của hàm số khi $x -> +- oo$:]
    #step[$lim_(x -> +- oo) (3 - 2x)/(x - 1) = lim_(x -> +- oo) (3/x - 2)/(1 - 1/x) = -2$.]
    #step[Do đó, đường thẳng $y = -2$ là tiệm cận ngang của đồ thị hàm số.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tọa độ tâm đối xứng $I$ của đồ thị hàm số $y = (x + 2)/(x - 1)$.],
  (
    [$I(-1; 1)$],
    [$I(1; -1)$],
    True([$I(1; 1)$]),
    [$I(2; 1)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đồ thị hàm phân thức bậc nhất trên bậc nhất nhận giao điểm $I$ của hai đường tiệm cận làm tâm đối xứng.]
    #step[Tiệm cận đứng: $x = 1$. Tiệm cận ngang: $y = 1$.]
    #step[Vậy giao điểm của hai tiệm cận có tọa độ là $I(1; 1)$. Đây chính là tâm đối xứng của đồ thị.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = (a x + b)/(x + c)$ có đồ thị như hình vẽ bên dưới. 
   #v(0.3em)
   #align(center)[
     #cetz.canvas(length: 0.7cm, {
       import cetz.draw: *
       line((-3.2, 0), (3.2, 0), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       line((0, -2.2), (0, 4.2), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       content((3.0, -0.3), $x$)
       content((0.3, 3.9), $y$)
       content((-0.25, -0.25), $O$)
       
       // TCĐ x = 1 (dashed)
       line((1, -2.0), (1, 3.8), stroke: (paint: rgb("#b91c1c"), thickness: 0.5pt, dash: "dashed"))
       // TCN y = 2 (dashed)
       line((-3.0, 2), (3.0, 2), stroke: (paint: rgb("#b91c1c"), thickness: 0.5pt, dash: "dashed"))
       
       let f(x) = { 2 - 1 / (x - 1) }
       let pts_left = ()
       for i in range(25) {
         let x = -2.8 + i * 3.3 / 25
         pts_left.push((x, f(x)))
       }
       line(..pts_left, stroke: rgb("#0f4c81") + 1.2pt)
       
       let pts_right = ()
       for i in range(25) {
         let x = 1.35 + i * 1.55 / 25
         pts_right.push((x, f(x)))
       }
       line(..pts_right, stroke: rgb("#0f4c81") + 1.2pt)
     })
   ]
   Tính giá trị của biểu thức $P = a + b + c$, biết đồ thị hàm số đi qua điểm $A(0; 3)$.],
  (
    [$P = 2$],
    True([$P = -2$]),
    [$P = 0$],
    [$P = -4$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đường tiệm cận đứng của đồ thị hàm số là $x = -c$. Từ đồ thị ta thấy tiệm cận đứng là $x = 1$, suy ra $-c = 1 => c = -1$.]
    #step[Đường tiệm cận ngang của đồ thị hàm số là $y = a$. Từ đồ thị ta thấy tiệm cận ngang là $y = 2$, suy ra $a = 2$.]
    #step[Đồ thị đi qua điểm $A(0; 3)$, thay tọa độ vào công thức hàm số ta được: $y(0) = frac(b, c) = 3$.]
    #step[Với $c = -1$, suy ra $frac(b, -1) = 3 => b = -3$.]
    #step[Tính giá trị biểu thức: $P = a + b + c = 2 + (-3) + (-1) = -2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = (a x + b)/(c x + d)$ ($c != 0$) có bảng biến thiên như sau:
   #v(0.3em)
   #align(center)[
     #my-bbbt(
       x-vals: ($-oo$, $2$, $+oo$),
       d-signs: ($-$, $||$, $-$,),
       v-vals: ($1$, ($-oo$, $+oo$), $1$,),
     )
   ]
   Nhận xét nào sau đây là đúng về tính đơn điệu của hàm số?],
  (
    [Hàm số đồng biến trên từng khoảng xác định],
    True([Hàm số nghịch biến trên từng khoảng xác định]),
    [Hàm số đồng biến trên $RR without \\{2\\}$],
    [Hàm số nghịch biến trên $RR without \\{2\\}$],
  ),
  accent: c-book,
  loigiai: [
    #step[Theo bảng biến thiên, đạo hàm của hàm số mang dấu âm trên hai khoảng xác định.]
    #step[Do đó, hàm số nghịch biến trên các khoảng $(-oo; 2)$ và $(2; +oo)$.]
    #step[Chú ý: Không dùng ký hiệu hiệu $RR without \\{2\\}$ để kết luận khoảng biến thiên của hàm số.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị hàm số $y = (2x - 4)/(x + 1)$ cắt trục hoành tại điểm nào?],
  (
    [$M(0; -4)$],
    True([$A(2; 0)$]),
    [$B(-1; 0)$],
    [$N(0; 2)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Giao điểm của đồ thị với trục hoành là điểm có tung độ $y = 0$.]
    #step[Ta giải phương trình: $(2x - 4)/(x + 1) = 0 <=> 2x - 4 = 0 <=> x = 2$.]
    #step[Vậy giao điểm của đồ thị với trục hoành là điểm $A(2; 0)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị hàm số $y = (x + 1)/(x - 2)$ cắt trục tung tại điểm nào?],
  (
    [$M(0; 1)$],
    [$N(2; 0)$],
    True([$P(0; -1/2)$]),
    [$Q(-1; 0)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Giao điểm của đồ thị với trục tung là điểm có hoành độ $x = 0$.]
    #step[Thay $x = 0$ vào công thức hàm số: $y = (0 + 1)/(0 - 2) = -1/2$.]
    #step[Vậy giao điểm là điểm $P(0; -1/2)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tất cả các giá trị của tham số $m$ để tiệm cận đứng của đồ thị hàm số $y = (2x + 1)/(x - m)$ đi qua điểm $A(3; 5)$.],
  (
    [$m = -3$],
    [$m = 5$],
    [$m = 2$],
    True([$m = 3$]),
  ),
  accent: c-book,
  loigiai: [
    #step[Tiệm cận đứng của đồ thị hàm số là đường thẳng $x = m$ (với điều kiện $2m + 1 != 0 <=> m != -1/2$).]
    #step[Đường thẳng này đi qua điểm $A(3; 5)$ khi và chỉ khi hoành độ của điểm $A$ thỏa mãn phương trình tiệm cận đứng.]
    #step[Do đó, $3 = m => m = 3$ (thỏa mãn điều kiện $m != -1/2$).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = (2x - 1)/(x - 1)$ có đồ thị $(C)$. Khẳng định nào sau đây là đúng?],
  (
    [Đồ thị $(C)$ có cực trị],
    [Đồ thị $(C)$ có tiệm cận đứng là $x = 2$],
    True([Đồ thị $(C)$ luôn đi qua điểm $A(0; 1)$]),
    [Đồ thị $(C)$ có tiệm cận ngang là $y = 1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Xét điểm $A(0; 1)$: Thay $x = 0$ vào hàm số ta được $y = (2(0) - 1)/(0 - 1) = 1$. Vậy điểm $A(0; 1)$ thuộc đồ thị $(C)$.]
    #step[Các khẳng định khác là sai vì: Hàm phân thức 1/1 không có cực trị; tiệm cận đứng là $x = 1$; tiệm cận ngang là $y = 2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm góc giữa hai đường tiệm cận của đồ thị hàm số $y = (x + 3)/(2x - 2)$.],
  (
    [$45^degree$],
    [$60^degree$],
    True([$90^degree$]),
    [$30^degree$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đồ thị hàm phân thức 1/1 luôn có một tiệm cận đứng là đường thẳng song song hoặc trùng với trục tung (ở đây là $x = 1$).]
    #step[Và một tiệm cận ngang là đường thẳng song song hoặc trùng với trục hoành (ở đây là $y = 1/2$).]
    #step[Hai đường thẳng này luôn vuông góc với nhau, do đó góc giữa chúng bằng $90^degree$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $f(x) = (2x - 1)/(x - 1)$. Có bao nhiêu giá trị thực của tham số $m$ để phương trình $|f(x)| = m$ có duy nhất một nghiệm thực?],
  (
    [$1$],
    True([$2$]),
    [$0$],
    [Vô số],
  ),
  accent: c-book,
  loigiai: [
    #step[Xét phương trình $|f(x)| = m$. Vì $|f(x)| >= 0$ với mọi $x != 1$ nên phương trình có nghiệm khi $m >= 0$.]
    #step[Trường hợp 1: $m = 0$. Khi đó $|f(x)| = 0 <=> f(x) = 0 <=> 2x - 1 = 0 <=> x = 1/2$. Do đó, với $m = 0$ phương trình có đúng 1 nghiệm thực duy nhất. Thỏa mãn.]
    #step[Trường hợp 2: $m > 0$. Khi đó $|f(x)| = m <=> f(x) = m$ hoặc $f(x) = -m$.]
    #step[Nhận xét đồ thị hàm số $y = f(x) = (2x - 1)/(x - 1)$ có tiệm cận đứng $x = 1$, tiệm cận ngang $y = 2$. Với mỗi giá trị $k != 2$, phương trình $f(x) = k$ luôn có đúng 1 nghiệm thực. Với $k = 2$, phương trình $f(x) = 2$ vô nghiệm.]
    #step[Vì $m > 0$ nên $-m < 0 < 2$. Do đó phương trình $f(x) = -m$ luôn có đúng 1 nghiệm thực.]
    #step[Để phương trình ban đầu $|f(x)| = m$ có đúng 1 nghiệm thực thì phương trình $f(x) = m$ bắt buộc phải vô nghiệm, tương ứng với $m = 2$ (đúng bằng giá trị tiệm cận ngang).]
    #step[Khi $m = 2$, phương trình $f(x) = -2$ cho nghiệm duy nhất $x = 3/4$, phương trình $f(x) = 2$ vô nghiệm. Thỏa mãn.]
    #step[Vậy có đúng 2 giá trị thực của $m$ thỏa mãn yêu cầu đề bài là $m = 0$ và $m = 2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị hàm số $y = (2x + 1)/(x - 1)$ có bao nhiêu đường tiệm cận?],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đồ thị hàm số phân thức bậc nhất trên bậc nhất có đúng 2 đường tiệm cận.]
    #step[Gồm một tiệm cận đứng (ở đây là $x = 1$) và một tiệm cận ngang (ở đây là $y = 2$).]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng - Sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x) = (2x + 1)/(x - 1)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Tập xác định của hàm số là $D = RR without \\{1\\}$.]),
    [Hàm số luôn đồng biến trên từng khoảng xác định của nó.],
    True([Đồ thị hàm số nhận giao điểm $I(1; 2)$ của hai đường tiệm cận làm tâm đối xứng.]),
    True([Đồ thị cắt trục hoành tại điểm $A(-1/2; 0)$ và cắt trục tung tại điểm $B(0; -1)$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Mẫu số $x - 1 != 0 <=> x != 1$.
    - b) Sai. Ta có đạo hàm $y' = (2(-1) - 1(1))/(x - 1)^2 = -3/(x - 1)^2 < 0$ với mọi $x != 1$. Nên hàm số luôn nghịch biến trên các khoảng xác định.
    - c) Đúng. Tiệm cận đứng $x = 1$, tiệm cận ngang $y = 2$ giao nhau tại tâm đối xứng $I(1; 2)$.
    - d) Đúng. Cho $y = 0 => x = -1/2$, giao điểm với trục hoành là $(-1/2; 0)$. Cho $x = 0 => y = -1$, giao điểm với trục tung là $(0; -1)$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = (x - m)/(x + 1)$ (với $m$ là tham số thực). Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Với mọi giá trị của $m$, đồ thị hàm số luôn có tiệm cận ngang là đường thẳng $y = 1$.]),
    True([Với $m = -1$, đồ thị hàm số là một đường thẳng bị thủng một điểm.]),
    [Khi $m = 2$, hàm số nghịch biến trên từng khoảng xác định.],
    True([Nếu đồ thị hàm số đi qua điểm $M(1; 0)$ thì $m = 1$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Vì $lim_(x -> +- oo) (x - m)/(x + 1) = 1$ với mọi $m$.
    - b) Đúng. Với $m = -1$, ta có $y = (x + 1)/(x + 1) = 1$ (với điều kiện $x != -1$). Đồ thị là đường thẳng nằm ngang $y = 1$ bị khuyết tại điểm $(-1; 1)$.
    - c) Sai. Khi $m = 2$, ta có $y = (x - 2)/(x + 1)$. Đạo hàm $y' = 3/(x + 1)^2 > 0$ với mọi $x != -1$ nên hàm số đồng biến trên các khoảng xác định. Phát biểu c ghi "nghịch biến" nên là Sai.
    - d) Đúng. Đồ thị đi qua điểm $M(1; 0) => 0 = (1 - m)/(1 + 1) => m = 1$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = (a x + b)/(x + d)$ có đồ thị như hình vẽ bên dưới.
   #v(0.3em)
   #align(center)[
     #cetz.canvas(length: 0.7cm, {
       import cetz.draw: *
       line((-3.2, 0), (3.2, 0), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       line((0, -3.2), (0, 3.2), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       content((3.0, -0.3), $x$)
       content((0.3, 2.9), $y$)
       content((-0.25, -0.25), $O$)
       
       // TCĐ x = -1 (dashed)
       line((-1, -3.0), (-1, 3.0), stroke: (paint: rgb("#b91c1c"), thickness: 0.5pt, dash: "dashed"))
       // TCN y = 1 (dashed)
       line((-3.0, 1), (3.0, 1), stroke: (paint: rgb("#b91c1c"), thickness: 0.5pt, dash: "dashed"))
       
       let f(x) = { 1 + 1 / (x + 1) }
       let pts_left = ()
       for i in range(25) {
         let x = -2.8 + i * 1.55 / 25
         pts_left.push((x, f(x)))
       }
       line(..pts_left, stroke: rgb("#0f4c81") + 1.2pt)
       
       let pts_right = ()
       for i in range(25) {
         let x = -0.65 + i * 3.45 / 25
         pts_right.push((x, f(x)))
       }
       line(..pts_right, stroke: rgb("#0f4c81") + 1.2pt)
     })
   ]
   Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Hệ số dẫn đầu $a$ mang dấu dương.]),
    True([Hệ số tự do ở mẫu $d = 1$.]),
    [Tử số có nghiệm dương.],
    True([Biểu thức liên hệ đạo hàm $a d - b$ mang dấu âm.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Tiệm cận ngang là $y = a$. Từ hình vẽ ta thấy tiệm cận ngang nằm phía trên trục hoành nên $a > 0$.
    - b) Đúng. Tiệm cận đứng là $x = -d$. Theo đồ thị, tiệm cận đứng là $x = -1$ nên $-d = -1 => d = 1$.
    - c) Sai. Nghiệm của tử số là giao điểm của đồ thị với trục hoành. Nhìn hình vẽ ta thấy đồ thị cắt trục hoành tại điểm nằm bên trái trục tung (hoành độ âm, cụ thể là $x = -2$). Do đó tử số có nghiệm âm.
    - d) Đúng. Đồ thị hàm số có các nhánh nằm trong góc phần tư thứ II và IV của hệ trục tiệm cận, nghĩa là hàm số nghịch biến. Đạo hàm $y' = (a d - b)/(x + d)^2 < 0 <=> a d - b < 0$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = (2x - 1)/(x + 1)$ có đồ thị $(C)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Độ dài đoạn thẳng nối tâm đối xứng $I$ của $(C)$ đến gốc tọa độ $O$ bằng $sqrt(5)$.]),
    True([Phương trình tiếp tuyến của đồ thị $(C)$ tại giao điểm của nó với trục tung có hệ số góc bằng $3$.]),
    [Đồ thị $(C)$ không cắt đường thẳng $y = 3$.],
    [Giao điểm của $(C)$ với đường thẳng $y = x - 1$ có hoành độ thỏa mãn phương trình bậc hai $x^2 - 4x = 0$.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Tâm đối xứng $I$ là giao hai tiệm cận $x = -1$ và $y = 2$, nên $I(-1; 2)$. Khoảng cách $O I = sqrt((-1)^2 + 2^2) = sqrt(5)$.
    - b) Đúng. Giao điểm với trục tung là $B(0; -1)$. Đạo hàm $y' = 3/(x + 1)^2$. Hệ số góc tiếp tuyến tại $x = 0$ là $k = y'(0) = 3$.
    - c) Sai. Vì tiệm cận ngang là $y = 2 != 3$ nên đường thẳng $y = 3$ luôn cắt đồ thị tại đúng 1 điểm.
    - d) Sai. Phương trình hoành độ giao điểm: $(2x - 1)/(x + 1) = x - 1 <=> 2x - 1 = x^2 - 1 <=> x^2 - 2x = 0$. Do đó hoành độ giao điểm thỏa mãn phương trình $x^2 - 2x = 0$, không phải $x^2 - 4x = 0$.
  ],
))

#exam-part([PHẦN III. Câu hỏi trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Tìm hoành độ tâm đối xứng của đồ thị hàm số $y = (4x - 5)/(2x + 6)$.],
  [$-3$],
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR without \\{-3\\}$.]
    #step[Đường tiệm cận đứng của đồ thị hàm số là đường thẳng $x = -3$.]
    #step[Hoành độ tâm đối xứng của đồ thị hàm phân thức 1/1 chính là vị trí của tiệm cận đứng.]
    #step[Do đó, hoành độ tâm đối xứng cần tìm là $-3$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho đồ thị hàm số $y = (3x - 2)/(x - 1)$. Gọi $I$ là giao điểm của hai đường tiệm cận và $A$ là giao điểm của đồ thị với trục tung. Tính diện tích của tam giác $O I A$ (với $O$ là gốc tọa độ).],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Tìm tọa độ tâm đối xứng $I$: Tiệm cận đứng $x = 1$, tiệm cận ngang $y = 3 => I(1; 3)$.]
    #step[Tìm tọa độ điểm $A$: Cho $x = 0 => y = 2 => A(0; 2)$.]
    #step[Ta có 3 điểm $O(0; 0)$, $A(0; 2)$, và $I(1; 3)$.]
    #step[Tam giác $O I A$ có cạnh $O A$ nằm trên trục tung với độ dài $O A = 2$.]
    #step[Đường cao hạ từ đỉnh $I(1; 3)$ đến trục tung chính là trị tuyệt đối hoành độ của $I$: $h = |x_I| = 1$.]
    #step[Diện tích tam giác: $S = 1/2 . O A . h = 1/2 . 2 . 1 = 1$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm số các giá trị nguyên của tham số $m$ để đồ thị hàm số $y = (m x - 2)/(x - m + 1)$ không có tiệm cận đứng.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Đồ thị hàm số không có tiệm cận đứng khi và chỉ khi nghiệm của mẫu số cũng là nghiệm của tử số (tức là phân thức bị triệt tiêu hoàn toàn).]
    #step[Mẫu số bằng $0$ khi $x = m - 1$.]
    #step[Thay $x = m - 1$ vào tử số ta được: $m(m - 1) - 2 = 0 <=> m^2 - m - 2 = 0$.]
    #step[Giải phương trình bậc hai trên ta được: $m = -1$ hoặc $m = 2$.]
    #step[Cả hai giá trị này đều nguyên, nên có đúng $2$ giá trị nguyên của $m$ thỏa mãn.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Gọi $M, N$ lần lượt là các giao điểm của đồ thị hàm số $y = (2x - 3)/(x - 2)$ với hai trục tọa độ. Tính độ dài đoạn thẳng $M N$ (làm tròn kết quả đến hàng phần mười).],
  [$2.1$],
  accent: c-book,
  loigiai: [
    #step[Giao điểm với trục hoành (cho $y = 0$): $2x - 3 = 0 <=> x = 3/2 = 1.5 => M(1.5; 0)$.]
    #step[Giao điểm với trục tung (cho $x = 0$): $y = (2(0) - 3)/(0 - 2) = 1.5 => N(0; 1.5)$.]
    #step[Độ dài đoạn thẳng $M N$: $M N = sqrt((1.5 - 0)^2 + (0 - 1.5)^2) = sqrt(2.25 + 2.25) = sqrt(4.5) = 3/2 sqrt(2) approx 2.12$.]
    #step[Làm tròn kết quả đến hàng phần mười ta được $2.1$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm giá trị của tham số $m$ để đồ thị hàm số $y = (m x + 1)/(x - 2)$ đi qua điểm $A(1; -3)$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Thay tọa độ điểm $A(1; -3)$ vào phương trình đồ thị hàm số ta được:]
    #step[$-3 = (m(1) + 1)/(1 - 2) <=> -3 = (m + 1)/(-1) <=> m + 1 = 3 <=> m = 2$.]
    #step[Vậy giá trị của tham số $m$ cần tìm là $2$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho đồ thị $(C)$ của hàm số $y = (2x - 1)/(x - 1)$. Gọi $M$ là một điểm bất kỳ thuộc $(C)$. Gọi $d_1, d_2$ lần lượt là khoảng cách từ $M$ đến hai đường tiệm cận của $(C)$. Tính tích $d_1 . d_2$.],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Xác định các đường tiệm cận của đồ thị $(C)$:]
    #step[Tiệm cận đứng là đường thẳng $Delta_1: x - 1 = 0$.]
    #step[Tiệm cận ngang là đường thẳng $Delta_2: y - 2 = 0$.]
    #step[Lấy điểm $M(x_0; y_0)$ bất kỳ thuộc $(C)$ ($x_0 != 1$). Ta viết lại biểu thức hàm số: $y_0 = frac(2x_0 - 1, x_0 - 1) = 2 + frac(1, x_0 - 1)$.]
    #step[Khoảng cách từ $M$ đến tiệm cận đứng $Delta_1$ là: $d_1 = |x_0 - 1|$.]
    #step[Khoảng cách từ $M$ đến tiệm cận ngang $Delta_2$ là: $d_2 = |y_0 - 2| = |(2 + frac(1, x_0 - 1)) - 2| = frac(1, |x_0 - 1|)$.]
    #step[Tính tích khoảng cách: $d_1 . d_2 = |x_0 - 1| . frac(1, |x_0 - 1|) = 1$.]
    #step[Vậy tích khoảng cách từ điểm $M$ bất kỳ trên đồ thị đến hai đường tiệm cận luôn là hằng số và bằng $1$.]
  ],
))
