#import "_config.typ": *

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 03]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $f(x)$ có đạo hàm $f'(x) = x(x - 1)^4 (x^2 - 1)$. Số điểm cực trị của hàm số là bao nhiêu?],
  ([$1$], [$2$], True([$3$]), [$4$]),
  accent: c-book,
  loigiai: [
    #step[Phân tích đạo hàm: $f'(x) = x(x - 1)^4 (x - 1)(x + 1) = x(x + 1)(x - 1)^5$.]
    #step[Nghiệm của đạo hàm gồm: $x = 0$ (bội 1), $x = -1$ (bội 1), $x = 1$ (bội 5).]
    #step[Tất cả các nghiệm đều có số mũ lẻ nên đạo hàm đổi dấu khi đi qua cả $3$ điểm này.]
    #step[Vậy số điểm cực trị của hàm số là $3$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm điểm cực đại của hàm số $y = -x^3 + 3x^2 - 1$.],
  ([$x = 0$], True([$x = 2$]), [$x = -2$], [$y = 3$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = -3x^2 + 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Qua $x = 2$, đạo hàm đổi dấu từ dương sang âm nên đạt cực đại tại $x = 2$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = x^4 - 8x^2 + 5$ đạt cực trị tại các điểm nào?],
  ([$x = 0$], [$x = +-2$], True([$x = 0$ và $x = +-2$]), [$x = +-4$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = 4x^3 - 16x = 4x(x^2 - 4)$.]
    #step[Giải $y' = 0 <=> x = 0$ hoặc $x = +-2$.]
    #step[Đạo hàm đổi dấu qua cả $3$ nghiệm đơn này, do đó hàm số đạt cực trị tại các điểm $x = 0$ và $x = +-2$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm số điểm cực trị của hàm số $y = (x^2 - 4x + 5)/(x - 2)$.],
  ([$0$], [$1$], True([$2$]), [$3$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR backslash {2}$.]
    #step[Đạo hàm: $y' = ((2x - 4)(x - 2) - (x^2 - 4x + 5))/(x - 2)^2 = (x^2 - 4x + 3)/(x - 2)^2$.]
    #step[Giải $y' = 0 <=> x^2 - 4x + 3 = 0 <=> x = 1$ hoặc $x = 3$ (đều thỏa mãn).]
    #step[Đạo hàm đổi dấu qua cả hai nghiệm đơn này. Vậy hàm số có $2$ điểm cực trị.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm điểm cực tiểu của hàm số $y = x^2 e^(-x)$.],
  (True([$x = 0$]), [$x = 2$], [$x = -2$], [$x = 1$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 2x e^(-x) - x^2 e^(-x) = (2x - x^2)e^(-x)$.]
    #step[Giải $y' = 0 <=> x(2 - x) = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Đạo hàm đổi dấu từ âm sang dương khi đi qua $x = 0$, do đó đạt cực tiểu tại $x = 0$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm số điểm cực trị của hàm số $y = x + cos 2x$ trên khoảng $(0; pi)$.],
  ([$0$], [$1$], True([$2$]), [$3$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = 1 - 2 sin 2x$.]
    #step[Giải $y' = 0 <=> sin 2x = 1/2 <=> 2x = pi/6 + k 2pi$ hoặc $2x = 5pi/6 + k 2pi$.]
    #step[Tương đương $x = pi/12 + k pi$ hoặc $x = 5pi/12 + k pi$.]
    #step[Trên khoảng $(0; pi)$, ta thu được $2$ nghiệm là $x = pi/12$ và $x = 5pi/12$.]
    #step[Đạo hàm đổi dấu qua hai nghiệm đơn này. Vậy hàm số có $2$ điểm cực trị trên khoảng đã cho.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm tọa độ điểm cực đại của đồ thị hàm số $y = sqrt(4x - x^2)$.],
  ([$(2; 0)$], True([$(2; 2)$]), [$(0; 0)$], [$(4; 0)$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = [0; 4]$.]
    #step[Đạo hàm: $y' = (2 - x)/sqrt(4x - x^2) = 0 <=> x = 2$.]
    #step[Đạo hàm đổi dấu từ dương sang âm khi đi qua $x = 2$, đạt cực đại tại $x = 2$.]
    #step[Giá trị cực đại: $y(2) = 2$. Tọa độ điểm cực đại của đồ thị là $(2; 2)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = ln(x^2 + 1) - x$ có bao nhiêu điểm cực trị trên $RR$?],
  ([$1$], [$2$], [$3$], True([Không có cực trị])),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = (2x)/(x^2 + 1) - 1 = -(x^2 - 2x + 1)/(x^2 + 1) = -(x - 1)^2 / (x^2 + 1)$.]
    #step[Ta thấy $y' <= 0, forall x in RR$. Đạo hàm triệt tiêu tại $x = 1$ nhưng đây là nghiệm kép và đạo hàm không đổi dấu qua điểm này.]
    #step[Do đó, hàm số không có cực trị.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có bảng xét dấu đạo hàm $f'(x)$ như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'$,
        x-vals: ($-oo$, $1$, $2$, $3$, $+oo$),
        f-signs: ($+$, $0$, $-$, $0$, $+$, $0$, $-$),
      )
    ]
    Hỏi hàm số $g(x) = f(x^2 - 4x)$ có bao nhiêu điểm cực trị?
  ],
  ([$3$], [$5$], True([$7$]), [$9$]),
  accent: c-book,
  loigiai: [
    #step[Từ bảng xét dấu, ta thấy $f'(x) = 0$ có 3 nghiệm đơn phân biệt là $1$, $2$ và $3$.]
    #step[Đạo hàm $g'(x) = (2x - 4) f'(x^2 - 4x) = 2(x - 2) f'(x^2 - 4x)$.]
    #step[Giải $g'(x) = 0 <=> x = 2$ hoặc $f'(x^2 - 4x) = 0$.]
    #step[Ta có $f'(x^2 - 4x) = 0 <=> x^2 - 4x = 1$ (1) hoặc $x^2 - 4x = 2$ (2) hoặc $x^2 - 4x = 3$ (3).]
    #step[Mỗi phương trình (1), (2), (3) là phương trình bậc hai có $Delta' > 0$ và không nhận $x = 2$ làm nghiệm, nên mỗi phương trình có 2 nghiệm đơn phân biệt, các nghiệm này đôi một khác nhau và khác 2.]
    #step[Vậy phương trình $g'(x) = 0$ có $1 + 2 dot.c 3 = 7$ nghiệm đơn phân biệt.]
    #step[Do đó, hàm số $g(x)$ có đúng $7$ điểm cực trị.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = x ln x$ đạt cực tiểu tại điểm nào?],
  ([$x = e$], [$x = 1$], True([$x = 1/e$]), [$x = e^2$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = (0; +oo)$.]
    #step[Tính đạo hàm: $y' = ln x + 1$.]
    #step[Giải $y' = 0 <=> ln x = -1 <=> x = 1/e$.]
    #step[Đạo hàm đổi dấu từ âm sang dương khi qua $x = 1/e$.]
    #step[Vậy điểm cực tiểu của hàm số là $x = 1/e$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị cực đại của hàm số $y = -x^3 + 3x + 2$.],
  ([$0$], True([$4$]), [$2$], [$1$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm $y' = -3x^2 + 3 = 0 <=> x = +-1$.]
    #step[Đạo hàm đổi dấu từ dương sang âm khi đi qua $x = 1$, đạt cực đại tại $x = 1$.]
    #step[Giá trị cực đại của hàm số là $y(1) = -(1^3) + 3(1) + 2 = 4$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị cực tiểu của hàm số $y = x + 1/x$ trên khoảng $(0; +oo)$.],
  ([$1$], True([$2$]), [$-2$], [$0$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = 1 - 1/x^2 = (x^2 - 1)/x^2 = 0 <=> x = 1$ (do $x > 0$).]
    #step[Đạo hàm đổi dấu từ âm sang dương khi đi qua $x = 1$.]
    #step[Giá trị cực tiểu tương ứng là $y(1) = 1 + 1/1 = 2$.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = -x^3 + 3x^2 - 4$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đạt cực tiểu tại điểm $x = 0$.]),
    [Giá trị cực đại của hàm số là $-4$.],
    True([Đồ thị hàm số đạt cực đại tại điểm có tọa độ $(2; 0)$.]),
    True([Đường thẳng đi qua hai điểm cực trị của đồ thị hàm số là $y = 2x - 4$.]),
  ),
  accent: c-book,
  loigiai: [
    - Ta có $y' = -3x^2 + 6x = 0 <=> x = 0$ hoặc $x = 2$.
    - Lập BBT, hàm số đạt cực tiểu tại $x = 0$, đạt cực đại tại $x = 2$. Do đó a) Đúng.
    - Giá trị cực tiểu $y(0) = -4$, giá trị cực đại $y(2) = 0$. Do đó b) Sai, c) Đúng.
    - Hai điểm cực trị đồ thị là $A(0; -4)$ và $B(2; 0)$. Đường thẳng đi qua $A, B$ có phương trình $y = 2x - 4$, d) Đúng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = x^4 - 4x^2 + 3$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số có đúng $3$ điểm cực trị.]),
    True([Hàm số đạt cực đại tại điểm $x = 0$.]),
    True([Giá trị cực tiểu của hàm số là $-1$.]),
    True([Giá trị cực đại của hàm số là $3$.]),
  ),
  accent: c-book,
  loigiai: [
    - Đạo hàm $y' = 4x^3 - 8x = 4x(x^2 - 2) = 0 <=> x = 0$ hoặc $x = +-sqrt(2)$.
    - Hàm số đổi dấu qua cả $3$ nghiệm đơn này nên có $3$ điểm cực trị, a) Đúng.
    - Qua $x = 0$, đạo hàm đổi dấu từ dương sang âm nên đạt cực đại tại $x = 0$, b) Đúng.
    - Cực tiểu đạt tại $x = +-sqrt(2)$ với giá trị cực tiểu $y(+-sqrt(2)) = -1$, c) Đúng.
    - Cực đại đạt tại $x = 0$ với giá trị cực đại $y(0) = 3$, d) Đúng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $f(x) = (x^2 - m x + 1)/(x - m)$ với $m$ là tham số thực. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Khi $m = 2$, hàm số đạt cực đại tại $x = 1$ và đạt cực tiểu tại $x = 3$.]),
    True([Với mọi $m$, hàm số luôn có $2$ điểm cực trị phân biệt.]),
    [Khi $m = 0$, hàm số không có cực trị.],
    True([Nếu $m > 1$, giá trị cực tiểu của hàm số là $m + 2$.]),
  ),
  accent: c-book,
  loigiai: [
    - Ta có tập xác định $D = RR backslash {m}$. Đạo hàm: $f'(x) = (x^2 - 2m x + m^2 - 1)/(x - m)^2$.
    - Cho $f'(x) = 0 <=> x^2 - 2m x + m^2 - 1 = 0 <=> (x - m)^2 = 1 <=> x = m - 1$ hoặc $x = m + 1$.
    - Mệnh đề a) Đúng: Khi $m = 2$, nghiệm cực đại là $2 - 1 = 1$, cực tiểu là $2 + 1 = 3$.
    - Mệnh đề b) Đúng: Với mọi $m$ thực, phương trình đạo hàm luôn có hai nghiệm phân biệt $x = m - 1$ và $x = m + 1$ khác $m$. Do đó hàm số luôn có 2 cực trị.
    - Mệnh đề c) Sai: Khi $m = 0$, nghiệm đạo hàm là $x = -1$ và $x = 1$, hàm số đạt cực trị tại $x = +-1$. Vậy khi $m = 0$ hàm số vẫn có cực trị.
    - Mệnh đề d) Đúng: Nghiệm cực tiểu là $x = m + 1$. Giá trị cực tiểu tương ứng là $f(m + 1) = ((m + 1)^2 - m(m + 1) + 1)/(m + 1 - m) = m + 2$.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = sqrt(4x - x^2)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = [0; 4]$.]),
    True([Đạo hàm của hàm số là $y' = (2 - x)/sqrt(4x - x^2)$.]),
    True([Hàm số đạt cực đại tại điểm $x = 2$.]),
    [Giá trị cực đại của hàm số là $4$.],
  ),
  accent: c-book,
  loigiai: [
    - Điều kiện: $4x - x^2 >= 0 <=> x in [0; 4]$, a) Đúng.
    - Đạo hàm: $y' = (4 - 2x)/(2sqrt(4x - x^2)) = (2 - x)/sqrt(4x - x^2)$, b) Đúng.
    - Đạo hàm đổi dấu từ dương sang âm qua $x = 2$ nên cực đại tại $x = 2$, c) Đúng.
    - Giá trị cực đại là $y(2) = 2$, d) Sai.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x^2 - 1) (x - 2)^3$. Số điểm cực trị của hàm số là bao nhiêu?],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Ta có $f'(x) = x(x - 1)(x + 1)(x - 2)^3$.]
    #step[Nghiệm của đạo hàm gồm $x = 0$, $x = 1$, $x = -1$ (đều bội 1) và $x = 2$ (bội 3).]
    #step[Tất cả $4$ nghiệm này đều là nghiệm bội lẻ nên đạo hàm đổi dấu khi đi qua chúng.]
    #step[Vậy số điểm cực trị của hàm số là $4$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị cực đại của hàm số $y = -x^3 + 3x^2 - 1$.],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = -3x^2 + 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Qua $x = 2$, đạo hàm đổi dấu từ dương sang âm nên đạt cực đại tại $x = 2$.]
    #step[Giá trị cực đại là $y(2) = -(2^3) + 3(2^2) - 1 = 3$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y=f(x)$ liên tục trên $RR$ và có bảng xét dấu đạo hàm như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'$,
        x-vals: ($-oo$, $-1$, $2$, $+oo$),
        f-signs: ($+$, $0$, $-$, $0$, $+$),
      )
    ]
    Tìm số điểm cực trị của hàm số $g(x) = f(x^3 - 3x)$.
  ],
  [$6$],
  accent: c-book,
  loigiai: [
    #step[Ta có $g'(x) = (3x^2 - 3) f'(x^3 - 3x) = 3(x - 1)(x + 1) f'(x^3 - 3x)$.]
    #step[Giải $g'(x) = 0 <=> x = 1$, $x = -1$ hoặc $f'(x^3 - 3x) = 0$.]
    #step[Từ bảng xét dấu, $f'(t) = 0 <=> t = -1$ hoặc $t = 2$.]
    #step[Do đó $f'(x^3 - 3x) = 0 <=> x^3 - 3x = -1$ (1) hoặc $x^3 - 3x = 2$ (2).]
    #step[Xét phương trình (1): $x^3 - 3x + 1 = 0$ có 3 nghiệm đơn phân biệt khác $+-1$.]
    #step[Xét phương trình (2): $x^3 - 3x - 2 = 0 <=> (x + 1)^2 (x - 2) = 0$ có nghiệm kép $x = -1$ và nghiệm đơn $x = 2$.]
    #step[Kết hợp lại: nghiệm $x = 1$ là đơn; nghiệm $x = -1$ xuất hiện 1 lần từ ngoài và 2 lần từ (2) nên là nghiệm bội lẻ (bội 3); nghiệm $x = 2$ là đơn; phương trình (1) cho 3 nghiệm đơn.]
    #step[Tổng cộng có $1 + 1 + 1 + 3 = 6$ nghiệm đơn và bội lẻ phân biệt. Vậy hàm số $g(x)$ có đúng $6$ điểm cực trị.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = (x^2 - 4) (x + 2)^2$. Số điểm cực đại của hàm số là bao nhiêu?],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Ta có $f'(x) = (x - 2)(x + 2)(x + 2)^2 = (x - 2)(x + 2)^3$.]
    #step[Nghiệm đạo hàm gồm $x = 2$ (bội 1) và $x = -2$ (bội 3).]
    #step[Xét dấu đạo hàm: $f'(x)$ dương trên $(-oo; -2)$ và $(2; +oo)$, âm trên $(-2; 2)$.]
    #step[Đạo hàm đổi dấu từ dương sang âm khi đi qua $x = -2$.]
    #step[Vậy số điểm cực đại của hàm số là $1$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị cực đại của hàm số $y = sqrt(6x - x^2)$.],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = [0; 6]$.]
    #step[Đạo hàm: $y' = (3 - x)/sqrt(6x - x^2) = 0 <=> x = 3$.]
    #step[Đạo hàm đổi dấu từ dương sang âm khi đi qua $x = 3$.]
    #step[Giá trị cực đại tương ứng là $y(3) = sqrt(6(3) - 3^2) = 3$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = (x - 1)^2 (x^2 - 2x)$. Tìm số điểm cực trị của hàm số.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Giải $f'(x) = 0 <=> (x - 1)^2 x (x - 2) = 0$.]
    #step[Các nghiệm gồm $x = 1$ (bội 2), $x = 0$ (bội 1), $x = 2$ (bội 1).]
    #step[Đạo hàm chỉ đổi dấu khi qua các nghiệm đơn là $x = 0$ và $x = 2$.]
    #step[Do đó số điểm cực trị của hàm số là $2$.]
  ],
))
