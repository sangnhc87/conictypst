#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 01 - CHUYÊN ĐỀ HÀM SỐ BẬC BA]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Cho hàm số bậc ba $y = a x^3 + b x^2 + c x + d$ có đồ thị như hình vẽ bên dưới. 
   #v(0.3em)
   #align(center)[
     #cetz.canvas(length: 0.7cm, {
       import cetz.draw: *
       line((-2.5, 0), (2.5, 0), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       line((0, -2.5), (0, 2.5), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       content((2.3, -0.3), $x$)
       content((0.3, 2.3), $y$)
       content((-0.25, -0.25), $O$)
       
       let f(x) = { x * x * x - 3 * x }
       let pts = ()
       for i in range(40) {
         let x = -1.9 + i * 3.8 / 40
         pts.push((x, f(x)))
       }
       line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
     })
   ]
   Mệnh đề nào sau đây là đúng về dấu của hệ số dẫn đầu $a$?],
  (
    True([$a > 0$]),
    [$a < 0$],
    [$a = 0$],
    [Không xác định được dấu của $a$],
  ),
  accent: c-book,
  loigiai: [
    #step[Quan sát đồ thị hàm số khi $x -> +oo$:]
    #step[Nhánh cuối cùng bên phải của đồ thị đi lên phía trên, tức là $lim_(x -> +oo) y = +oo$.]
    #step[Do đó, hệ số dẫn đầu $a$ phải mang dấu dương ($a > 0$).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = x^3 - 3x^2 + 2$. Điểm nào sau đây là điểm uốn (tâm đối xứng) của đồ thị hàm số?],
  (
    [$I(0; 2)$],
    True([$I(1; 0)$]),
    [$I(2; -2)$],
    [$I(-1; -2)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Ta tính đạo hàm cấp một: $y' = 3x^2 - 6x$.]
    #step[Tính đạo hàm cấp hai: $y'' = 6x - 6$.]
    #step[Tìm nghiệm của $y'' = 0$: $6x - 6 = 0 <=> x = 1$.]
    #step[Với $x = 1$, ta tính tung độ điểm uốn: $y(1) = 1^3 - 3(1)^2 + 2 = 0$.]
    #step[Vậy điểm uốn của đồ thị là $I(1; 0)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số bậc ba $y = a x^3 + b x^2 + c x + d$ ($a != 0$) có bảng biến thiên dưới đây:
   #v(0.3em)
   #align(center)[
     #my-bbbt(
       x-vals: ($-oo$, $0$, $2$, $+oo$),
       d-signs: ($+$, $0$, $-$, $0$, $+$),
       v-vals: ($-oo$, $3$, $-1$, $+oo$),
     )
   ]
   Tìm giá trị của $d$ (giao điểm của đồ thị với trục tung $O y$).],
  (
    [$d = -1$],
    [$d = 1$],
    True([$d = 3$]),
    [$d = 0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Giao điểm của đồ thị với trục tung là điểm có hoành độ $x = 0$.]
    #step[Theo bảng biến thiên, tại $x = 0$, ta có $y = 3$.]
    #step[Mặt khác, thay $x = 0$ vào công thức hàm số, ta được $y(0) = d$.]
    #step[Do đó, $d = 3$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị hàm số nào dưới đây có dạng như đường cong trong hình vẽ sau?
   #v(0.3em)
   #align(center)[
     #cetz.canvas(length: 0.7cm, {
       import cetz.draw: *
       line((-2.5, 0), (2.5, 0), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       line((0, -3.2), (0, 1.2), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       content((2.3, -0.3), $x$)
       content((0.3, 1.0), $y$)
       content((-0.25, 0.25), $O$)
       
       let f(x) = { -x * x * x + 3 * x - 2 }
       let pts = ()
       for i in range(40) {
         let x = -2.2 + i * 3.8 / 40
         pts.push((x, f(x)))
       }
       line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
     })
   ]
  ],
  (
    [$y = x^3 - 3x - 2$],
    True([$y = -x^3 + 3x - 2$]),
    [$y = -x^3 - 3x - 2$],
    [$y = x^3 + 3x - 2$],
  ),
  accent: c-book,
  loigiai: [
    #step[Nhánh cuối cùng bên phải của đồ thị đi xuống, nên hệ số dẫn đầu $a < 0$. Loại đáp án A và D.]
    #step[Đồ thị hàm số có 2 điểm cực trị (1 cực tiểu, 1 cực đại), nên phương trình đạo hàm $y' = 0$ phải có 2 nghiệm phân biệt.]
    #step[Xét phương trình đạo hàm của hàm số ở phương án B: $y' = -3x^2 + 3 = 0 <=> x = +- 1$ (thỏa mãn có 2 cực trị).]
    #step[Xét phương án C: $y' = -3x^2 - 3 = 0$ vô nghiệm (hàm số nghịch biến trên $RR$, không có cực trị).]
    #step[Vậy đồ thị thuộc về hàm số $y = -x^3 + 3x - 2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm số điểm cực trị của đồ thị hàm số $y = x^3 + 3x^2 + 3x + 1$.],
  (
    [$2$],
    [$1$],
    True([$0$]),
    [$3$],
  ),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm: $y' = 3x^2 + 6x + 3 = 3(x + 1)^2$.]
    #step[Phương trình $y' = 0 <=> x = -1$ (nghiệm kép).]
    #step[Vì đạo hàm $y' >= 0$ với mọi $x in RR$ và chỉ bằng $0$ tại điểm đơn lẻ $x = -1$, nên hàm số luôn đồng biến trên $RR$.]
    #step[Do đó, hàm số không có điểm cực trị nào.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = a x^3 + b x^2 + c x + d$ có đồ thị như hình vẽ dưới đây:
   #v(0.3em)
   #align(center)[
     #cetz.canvas(length: 0.7cm, {
       import cetz.draw: *
       line((-2.5, 0), (2.5, 0), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       line((0, -2.2), (0, 2.2), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       content((2.3, -0.3), $x$)
       content((0.3, 2.0), $y$)
       content((-0.25, -0.25), $O$)
       
       let f(x) = { x * x * x - 2 * x * x + 0.5 }
       let pts = ()
       for i in range(40) {
         let x = -1.1 + i * 2.8 / 40
         pts.push((x, f(x)))
       }
       line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
     })
   ]
   Khẳng định nào sau đây về các hệ số $a$ và $d$ là đúng?],
  (
    [$a < 0, d > 0$],
    [$a < 0, d < 0$],
    True([$a > 0, d > 0$]),
    [$a > 0, d < 0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Nhánh bên phải cùng đi lên, do đó $a > 0$.]
    #step[Đồ thị cắt trục tung tại điểm nằm trên trục hoành, tung độ giao điểm này bằng $d$. Nhìn hình vẽ ta thấy $d > 0$.]
    #step[Vậy $a > 0, d > 0$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = x^3 - 3x^2 + 4$ có đồ thị $(C)$. Đường thẳng nào sau đây cắt $(C)$ tại đúng $3$ điểm phân biệt?],
  (
    [$y = -1$],
    [$y = 5$],
    True([$y = 2$]),
    [$y = 4$],
  ),
  accent: c-book,
  loigiai: [
    #step[Khảo sát cực trị hàm số: $y' = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Giá trị cực đại: $y_"CĐ" = y(0) = 4$.]
    #step[Giá trị cực tiểu: $y_"CT" = y(2) = 0$.]
    #step[Đường thẳng nằm ngang $y = m$ cắt đồ thị tại 3 điểm phân biệt khi và chỉ khi: $y_"CT" < m < y_"CĐ" <=> 0 < m < 4$.]
    #step[Trong các phương án, chỉ có $y = 2$ thỏa mãn điều kiện $0 < 2 < 4$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số bậc ba $y = f(x)$ có đồ thị $(C)$ nhận điểm $I(2; 1)$ làm tâm đối xứng. Khẳng định nào sau đây đúng?],
  (
    [$f'(2) = 0$],
    True([$f''(2) = 0$]),
    [$f(1) = 2$],
    [Đồ thị luôn đi qua gốc tọa độ $O$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đối với đồ thị hàm số bậc ba, tâm đối xứng chính là điểm uốn của đồ thị.]
    #step[Hoành độ điểm uốn $x_0$ luôn là nghiệm của phương trình đạo hàm cấp hai $y'' = 0$.]
    #step[Do đó, với tâm đối xứng $I(2; 1)$ thì $f''(2) = 0$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm phương trình tiếp tuyến của đồ thị hàm số $y = x^3 - 3x^2 + 2x$ tại điểm uốn.],
  (
    [$y = -x - 1$],
    [$y = -x$],
    True([$y = -x + 1$]),
    [$y = x - 1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = 3x^2 - 6x + 2$, $y'' = 6x - 6 = 0 <=> x = 1$.]
    #step[Tọa độ điểm uốn: $x_0 = 1, y_0 = 1^3 - 3(1)^2 + 2(1) = 0$, điểm uốn là $I(1; 0)$.]
    #step[Hệ số góc của tiếp tuyến tại điểm uốn: $k = y'(1) = 3(1)^2 - 6(1) + 2 = -1$.]
    #step[Phương trình tiếp tuyến: $y - 0 = -1(x - 1) <=> y = -x + 1$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị của hàm số $y = -x^3 + 3x^2 - 2$ cắt trục hoành tại bao nhiêu điểm?],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Số giao điểm của đồ thị với trục hoành là số nghiệm của phương trình: $-x^3 + 3x^2 - 2 = 0$.]
    #step[Nhận xét phương trình có nghiệm $x = 1$ (do $-1 + 3 - 2 = 0$).]
    #step[Phân tích thành nhân tử: $-(x - 1)(x^2 - 2x - 2) = 0$.]
    #step[Phương trình $x^2 - 2x - 2 = 0$ có hai nghiệm phân biệt khác $1$ (vì $Delta' = 3 > 0$).]
    #step[Vậy phương trình có 3 nghiệm thực phân biệt, đồ thị cắt trục hoành tại 3 điểm phân biệt.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số bậc ba $y = a x^3 + b x^2 + c x + d$ ($a != 0$) có đồ thị như hình vẽ bên dưới.
   #v(0.3em)
   #align(center)[
     #cetz.canvas(length: 0.7cm, {
       import cetz.draw: *
       line((-1.5, 0), (4.5, 0), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       line((0, -1.0), (0, 2.5), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       content((4.3, -0.3), $x$)
       content((0.3, 2.3), $y$)
       content((-0.25, -0.25), $O$)
       
       let f(x) = { 0.2 * x * x * x - 1.2 * x * x + 1.8 * x + 0.5 }
       let pts = ()
       for i in range(40) {
         let x = -0.5 + i * 4.7 / 40
         pts.push((x, f(x)))
       }
       line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
     })
   ]
   Mệnh đề nào sau đây đúng về dấu của các hệ số $a, b, c, d$?],
  (
    [$a > 0, b > 0, c < 0, d > 0$],
    True([$a > 0, b < 0, c > 0, d > 0$]),
    [$a < 0, b > 0, c < 0, d < 0$],
    [$a > 0, b < 0, c < 0, d > 0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Nhánh cuối cùng bên phải đi lên, suy ra hệ số dẫn đầu $a > 0$.]
    #step[Đồ thị cắt trục tung tại điểm nằm phía trên trục hoành (tung độ dương), do đó $d = y(0) > 0$.]
    #step[Hàm số có hai điểm cực trị $x_1, x_2$ là nghiệm của phương trình $y' = 3a x^2 + 2b x + c = 0$.]
    #step[Nhìn hình vẽ ta thấy hai điểm cực trị đều nằm bên phải trục tung, tức là $x_1 > 0$ và $x_2 > 0$.]
    #step[Áp dụng định lý Vi-ét cho phương trình $y' = 0$:
      - Tổng hai nghiệm: $x_1 + x_2 = -frac(2b, 3a) > 0$. Vì $a > 0 => b < 0$.
      - Tích hai nghiệm: $x_1 . x_2 = frac(c, 3a) > 0$. Vì $a > 0 => c > 0$.]
    #step[Vậy dấu các hệ số là: $a > 0, b < 0, c > 0, d > 0$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số bậc ba $y = f(x)$ có đồ thị như hình vẽ.
   #v(0.3em)
   #align(center)[
     #cetz.canvas(length: 0.7cm, {
       import cetz.draw: *
       line((-2.5, 0), (2.5, 0), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       line((0, -1.5), (0, 3.2), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       content((2.3, -0.3), $x$)
       content((0.3, 3.0), $y$)
       content((-0.25, -0.25), $O$)
       
       let f(x) = { x * x * x - 3 * x + 1 }
       let pts = ()
       for i in range(40) {
         let x = -2.0 + i * 4.0 / 40
         pts.push((x, f(x)))
       }
       line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
       
       // Cực đại y = 3, Cực tiểu y = -1
       line((-1, 3), (0, 3), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
       line((1, -1), (0, -1), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
       content((-0.3, 3), $3$)
       content((-0.4, -1), $-1$)
     })
   ]
   Tìm số nghiệm thực phân biệt của phương trình $f(|f(x)| - 1) = 0$.],
  (
    [$4$],
    [$6$],
    True([$8$]),
    [$10$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đặt $t = |f(x)| - 1$. Phương trình trở thành $f(t) = 0$.]
    #step[Nhận xét hàm số $f(t) = t^3 - 3t + 1$ có cực đại là $3$ (tại $t=-1$) và cực tiểu là $-1$ (tại $t=1$). Vì tích hai cực trị trái dấu nên phương trình $f(t) = 0$ có đúng 3 nghiệm thực phân biệt $t_1, t_2, t_3$.]
    #step[Xác định các khoảng chứa nghiệm bằng cách thử giá trị đầu mút:
      - $f(-2) = -1 < 0$ và $f(-1) = 3 > 0 => t_1 in (-2; -1)$.
      - $f(0) = 1 > 0$ và $f(1) = -1 < 0 => t_2 in (0; 1)$.
      - $f(1) = -1 < 0$ và $f(2) = 3 > 0 => t_3 in (1; 2)$.]
    #step[Ta giải các phương trình tương ứng $|f(x)| = t_k + 1$:
      - Với $t_1 in (-2; -1) => t_1 + 1 < 0$: phương trình $|f(x)| = t_1 + 1$ vô nghiệm (vế trái không âm).
      - Với $t_2 in (0; 1) => 1 < t_2 + 1 < 2$.
      - Với $t_3 in (1; 2) => 2 < t_3 + 1 < 3$.]
    #step[Xét đồ thị hàm số $y = |f(x)|$. Nhận xét đồ thị có các đỉnh lồi tại $(-1; 3)$, $(1; 1)$ và điểm giao trục tung $(0; 1)$.]
    #step[Đường thẳng nằm ngang $y = u$ cắt đồ thị $y = |f(x)|$ tại đúng 4 điểm phân biệt khi $1 < u < 3$.]
    #step[Do cả $t_2 + 1$ và $t_3 + 1$ đều thuộc khoảng $(1; 3)$ nên mỗi phương trình tương ứng có đúng 4 nghiệm thực phân biệt.]
    #step[Vậy tổng số nghiệm thực phân biệt của phương trình là $0 + 4 + 4 = 8$ nghiệm.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng - Sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Cho hàm số bậc ba $y = f(x) = x^3 - 3x^2 + 1$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Hoành độ các điểm cực trị của đồ thị hàm số đều không âm.]),
    [Tọa độ tâm đối xứng của đồ thị hàm số là $I(1; -2)$.],
    True([Đồ thị cắt trục hoành tại $3$ điểm phân biệt.]),
    True([Đường thẳng $y = -3$ tiếp xúc với đồ thị hàm số tại điểm cực tiểu.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Đạo hàm $y' = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$. Cả hai hoành độ cực trị này đều không âm ($0 >= 0, 2 >= 0$).
    - b) Sai. Đạo hàm cấp hai $y'' = 6x - 6 = 0 <=> x_0 = 1$. Khi đó $y_0 = y(1) = 1 - 3 + 1 = -1$. Tọa độ tâm đối xứng là $I(1; -1)$, không phải $I(1; -2)$.
    - c) Đúng. Cực đại $y(0) = 1 > 0$, cực tiểu $y(2) = -3 < 0$. Do tích cực đại và cực tiểu $y_"CĐ" . y_"CT" = 1 . (-3) = -3 < 0$, đồ thị hàm số cắt trục hoành tại 3 điểm phân biệt.
    - d) Đúng. Giá trị cực tiểu bằng $-3$ đạt tại $x = 2$. Tiếp tuyến tại điểm cực tiểu là đường thẳng nằm ngang $y = -3$, nó tiếp xúc với đồ thị tại điểm cực tiểu của hàm số.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số bậc ba $y = f(x) = a x^3 + b x^2 + c x + d$ ($a != 0$) có đồ thị như hình vẽ bên dưới. 
   #v(0.3em)
   #align(center)[
     #cetz.canvas(length: 0.7cm, {
       import cetz.draw: *
       line((-2.5, 0), (2.5, 0), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       line((0, -2.5), (0, 2.5), mark: (end: "stealth", scale: 0.3), stroke: 0.5pt)
       content((2.3, -0.3), $x$)
       content((0.3, 2.3), $y$)
       content((-0.25, -0.25), $O$)
       
       let f(x) = { -x * x * x + 3 * x + 1 }
       let pts = ()
       for i in range(40) {
         let x = -1.9 + i * 3.8 / 40
         pts.push((x, f(x)))
       }
       line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
     })
   ]
   Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Tích hai hệ số $a . c < 0$.]),
    [Hàm số $g(x) = f(|x|)$ có đúng 5 điểm cực trị.],
    True([Phương trình $|f(x)| = 2$ có đúng 4 nghiệm thực phân biệt.]),
    True([Tổng các hệ số $a + b + c + d = 3$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Nhánh cuối cùng đi xuống suy ra $a < 0$. Đồ thị có 2 điểm cực trị nằm về hai phía trục tung nên $x_1 . x_2 < 0 <=> c / (3a) < 0$. Vì $a < 0 => c > 0$. Do đó $a . c < 0$. (Cụ thể hàm số là $f(x) = -x^3 + 3x + 1$ có $a = -1, c = 3$).
    - b) Sai. Hàm số $g(x) = f(|x|)$ có số cực trị bằng $2k + 1$, với $k$ là số cực trị dương của $f(x)$. Vì $f(x)$ chỉ có 1 cực trị dương (tại $x = 1$) nên $g(x)$ có đúng $2(1) + 1 = 3$ cực trị.
    - c) Đúng. Ta có $|f(x)| = 2 <=> f(x) = 2$ hoặc $f(x) = -2$.
      - Với cực đại là $y(1) = 3$ và cực tiểu là $y(-1) = -1$.
      - Phương trình $f(x) = 2$ có 3 nghiệm phân biệt vì $-1 < 2 < 3$.
      - Phương trình $f(x) = -2$ có 1 nghiệm duy nhất vì $-2 < -1$.
      - Cả 4 nghiệm này đều phân biệt, do đó phương trình $|f(x)| = 2$ có đúng 4 nghiệm.
    - d) Đúng. Tổng các hệ số là $a + b + c + d = f(1)$. Theo đồ thị tại điểm cực đại $x = 1$ ta có $f(1) = 3$. Vậy $a + b + c + d = 3$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x) = a x^3 + b x^2 + c x + d$ đạt cực trị tại $x = 0$ và $x = 2$, có đồ thị đi qua điểm $M(1; 2)$ và $N(0; 4)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Hệ số tự do $d = 4$.]),
    [Đạo hàm $f'(x) = 3x^2 - 6x$.],
    True([Hệ số dẫn đầu $a = 1$.]),
    True([Tung độ của điểm uốn của đồ thị hàm số bằng $2$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Đồ thị đi qua điểm $N(0; 4)$ nên $f(0) = d = 4$.
    - b) Sai. Ta có $f'(x) = 3a x^2 + 2b x + c$. Vì hàm số đạt cực trị tại $x = 0$ và $x = 2$ nên $f'(0) = 0 => c = 0$, và $f'(2) = 0 => 12a + 4b = 0 <=> b = -3a$. Do đó, $f'(x) = 3a x^2 - 6a x$.
    - c) Đúng. Với $b = -3a, c = 0, d = 4$, ta có $f(x) = a x^3 - 3a x^2 + 4$. Vì đồ thị đi qua điểm $M(1; 2)$ nên $f(1) = a - 3a + 4 = 2 <=> -2a = -2 <=> a = 1$.
    - d) Đúng. Điểm uốn có hoành độ là trung điểm của hoành độ hai cực trị: $x_0 = (0 + 2)/2 = 1$. Tung độ điểm uốn là $y(1) = 2$ (chính là tọa độ điểm $M(1; 2)$ nằm trên đồ thị).
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = -x^3 + 3x^2 - 4x + 2$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Hàm số luôn nghịch biến trên tập xác định $RR$.]),
    [Đồ thị hàm số có hai điểm cực trị phân biệt.],
    True([Đồ thị hàm số nhận điểm $I(1; 0)$ làm tâm đối xứng.]),
    True([Tiếp tuyến của đồ thị hàm số tại điểm uốn có hệ số góc lớn nhất.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Đạo hàm $y' = -3x^2 + 6x - 4$. Ta có biệt thức $Delta' = 9 - 12 = -3 < 0$. Vì $a = -3 < 0$ và $Delta' < 0$ nên $y' < 0$ với mọi $x in RR$. Hàm số luôn nghịch biến trên $RR$.
    - b) Sai. Phương trình $y' = 0$ vô nghiệm nên hàm số không có cực trị.
    - c) Đúng. Đạo hàm cấp hai $y'' = -6x + 6 = 0 <=> x_0 = 1$. Tung độ tương ứng $y(1) = -1 + 3 - 4 + 2 = 0$. Tâm đối xứng là $I(1; 0)$.
    - d) Đúng. Hệ số góc của tiếp tuyến tại điểm có hoành độ $x$ là $k(x) = y'(x) = -3x^2 + 6x - 4 = -3(x - 1)^2 - 1 <= -1$. Hệ số góc đạt giá trị lớn nhất bằng $-1$ tại $x = 1$ (chính là hoành độ điểm uốn).
  ],
))

#exam-part([PHẦN III. Câu hỏi trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Tìm hoành độ điểm uốn của đồ thị hàm số $y = x^3 - 6x^2 + 9x - 1$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm cấp một: $y' = 3x^2 - 12x + 9$.]
    #step[Tính đạo hàm cấp hai: $y'' = 6x - 12$.]
    #step[Phương trình $y'' = 0 <=> 6x - 12 = 0 <=> x = 2$.]
    #step[Hoành độ điểm uốn của đồ thị hàm số là $2$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = x^3 - 3x^2 + 4$. Đường thẳng $y = m$ cắt đồ thị hàm số tại đúng $2$ điểm phân biệt. Tìm tổng các giá trị thực của $m$ thỏa mãn điều kiện trên.],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Ta tìm các điểm cực trị: $y' = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Giá trị cực đại: $y_"CĐ" = y(0) = 4$.]
    #step[Giá trị cực tiểu: $y_"CT" = y(2) = 0$.]
    #step[Đường thẳng $y = m$ cắt đồ thị tại đúng 2 điểm phân biệt khi và chỉ khi nó đi qua cực đại hoặc cực tiểu của đồ thị.]
    #step[Do đó, $m = 4$ hoặc $m = 0$.]
    #step[Tổng các giá trị của $m$ là $4 + 0 = 4$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm giá trị của tham số $m$ để đồ thị hàm số $y = x^3 - 3x + m$ tiếp xúc với trục hoành, biết $m$ là số thực dương.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Đồ thị hàm số $y = x^3 - 3x + m$ tiếp xúc với trục hoành khi và chỉ khi một trong hai điểm cực trị của đồ thị nằm trên trục hoành (tức là giá trị cực trị bằng $0$).]
    #step[Ta có $y' = 3x^2 - 3 = 0 <=> x = +- 1$.]
    #step[Giá trị cực trị 1: $y(1) = 1^3 - 3(1) + m = m - 2$.]
    #step[Giá trị cực trị 2: $y(-1) = (-1)^3 - 3(-1) + m = m + 2$.]
    #step[Để đồ thị tiếp xúc với trục hoành, ta có hai trường hợp:]
    #step[Trường hợp 1: $m - 2 = 0 <=> m = 2$ (thỏa mãn $m > 0$).]
    #step[Trường hợp 2: $m + 2 = 0 <=> m = -2$ (không thỏa mãn vì $m > 0$).]
    #step[Vậy giá trị dương của $m$ cần tìm là $2$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $f(x) = x^3 - 3x^2 + 2$. Phương trình $f(f(x)) = 2$ có bao nhiêu nghiệm thực phân biệt?],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Đặt $t = f(x)$. Phương trình trở thành $f(t) = 2 <=> t^3 - 3t^2 + 2 = 2$.]
    #step[Biến đổi phương trình: $t^3 - 3t^2 = 0 <=> t^2(t - 3) = 0 <=> t = 0$ hoặc $t = 3$.]
    #step[Ta giải hai phương trình tương ứng:]
    #step[Trường hợp 1: $f(x) = 0 <=> x^3 - 3x^2 + 2 = 0$.
      - Khảo sát cực trị hàm số $y = f(x)$: $f'(x) = 3x^2 - 6x = 0 <=> x = 0$ (cực đại $y = 2$) hoặc $x = 2$ (cực tiểu $y = -2$).
      - Do cực đại và cực tiểu trái dấu ($y_"CĐ" . y_"CT" = 2 . (-2) = -4 < 0$), phương trình $f(x) = 0$ có đúng 3 nghiệm thực phân biệt.]
    #step[Trường hợp 2: $f(x) = 3 <=> x^3 - 3x^2 + 2 = 3$.
      - Vì $3 > y_"CĐ" = 2$ nên đường thẳng $y = 3$ cắt đồ thị $y = f(x)$ tại đúng 1 điểm duy nhất (nhánh đi lên từ cực tiểu sang phải).]
    #step[Các nghiệm ở hai trường hợp trên là hoàn toàn phân biệt vì các giá trị $f(x)$ tương ứng là khác nhau ($0 != 3$).]
    #step[Vậy phương trình ban đầu có tổng cộng $3 + 1 = 4$ nghiệm thực phân biệt.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số bậc ba $y = a x^3 + b x^2 + c x + d$ đạt cực trị tại $x_1 = 0$, $x_2 = 4$ và có đồ thị đi qua gốc tọa độ $O$. Điểm cực đại của đồ thị có tọa độ là $A(0; 0)$ và điểm cực tiểu là $B(4; -32)$. Tính giá trị của biểu thức $P = a - b + c - d$.],
  [$7$],
  accent: c-book,
  loigiai: [
    #step[Đồ thị đi qua gốc tọa độ $O(0; 0) => d = 0$.]
    #step[Hàm số đạt cực trị tại $x = 0$ và $x = 4$ nên $y' = 3a x^2 + 2b x + c$ có hai nghiệm là $0$ và $4$.]
    #step[Do đó, $c = 0$ và $y' = 3a x(x - 4) = 3a x^2 - 12a x$. Từ đây suy ra $2b = -12a <=> b = -6a$.]
    #step[Hàm số có dạng: $y = a x^3 - 6a x^2$.]
    #step[Điểm cực tiểu là $B(4; -32) => y(4) = a(4)^3 - 6a(4)^2 = -32 <=> 64a - 96a = -32 <=> -32a = -32 <=> a = 1$.]
    #step[Từ đó: $b = -6a = -6$, $c = 0$, $d = 0$.]
    #step[Ta tính giá trị $P = a - b + c - d = 1 - (-6) + 0 - 0 = 7$.]
    #step[Vậy giá trị $P$ cần tìm là $7$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một vật chuyển động theo quy luật $s(t) = -t^3 + 9t^2 + 12t$, với $t$ (giây) là khoảng thời gian tính từ lúc vật bắt đầu chuyển động và $s$ (mét) là quãng đường vật đi được trong khoảng thời gian đó. Hỏi trong khoảng thời gian $10$ giây kể từ lúc bắt đầu chuyển động, vận tốc lớn nhất của vật đạt được bằng bao nhiêu mét trên giây?],
  [$39$],
  accent: c-book,
  loigiai: [
    #step[Vận tốc của vật là đạo hàm của quãng đường theo thời gian: $v(t) = s'(t) = -3t^2 + 18t + 12$.]
    #step[Đây là một parabol quay bề lõm xuống dưới, đạt giá trị lớn nhất tại đỉnh parabol.]
    #step[Hoành độ đỉnh: $t = -18 / (2 . (-3)) = 3$ (giây). Điểm này thuộc khoảng $[0; 10]$.]
    #step[Vận tốc lớn nhất đạt được là: $v(3) = -3(3)^2 + 18(3) + 12 = -27 + 54 + 12 = 39$ (m/s).]
    #step[Vậy vận tốc lớn nhất của vật đạt được trong 10 giây đầu là $39$ m/s.]
  ],
))
