#import "_config.typ": *

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 01]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "ngang", tn(
  [Tìm điểm cực tiểu của hàm số $y = x^3 - 3x^2 + 2$.],
  ([$x = 0$], True([$x = 2$]), [$x = -2$], [$y = -2$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 3x^2 - 6x$.]
    #step[Giải phương trình đạo hàm: $y' = 0 <=> 3x(x - 2) = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Đạo hàm $y'$ đổi dấu từ âm sang dương khi đi qua $x = 2$.]
    #step[Do đó, điểm cực tiểu của hàm số là $x = 2$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = -x^4 + 2x^2 + 3$ có bao nhiêu điểm cực trị?],
  ([$1$], [$2$], True([$3$]), [$0$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = -4x^3 + 4x = -4x(x^2 - 1)$.]
    #step[Giải phương trình đạo hàm: $y' = 0 <=> x = 0$ hoặc $x = +-1$.]
    #step[Phương trình đạo hàm có $3$ nghiệm đơn phân biệt, do đó đạo hàm đổi dấu qua cả $3$ điểm này.]
    #step[Vậy hàm số có $3$ điểm cực trị.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = (x + 1)/(x - 1)$ có bao nhiêu cực trị?],
  ([$1$], [$2$], [$3$], True([Không có cực trị])),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR backslash {1}$.]
    #step[Tính đạo hàm: $y' = -2/(x - 1)^2 < 0, forall x != 1$.]
    #step[Đạo hàm luôn âm và không đổi dấu trên từng khoảng xác định.]
    #step[Do đó, hàm số không có cực trị.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x^2 (x - 1) (x + 2)^3$. Số điểm cực trị của hàm số là bao nhiêu?],
  ([$1$], True([$2$]), [$3$], [$4$]),
  accent: c-book,
  loigiai: [
    #step[Nghiệm của đạo hàm $f'(x) = 0$ gồm: $x = 0$ (bội 2), $x = 1$ (bội 1), $x = -2$ (bội 3).]
    #step[Đạo hàm $f'(x)$ chỉ đổi dấu khi đi qua các nghiệm bội lẻ là $x = 1$ và $x = -2$.]
    #step[Vậy hàm số có $2$ điểm cực trị.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm tọa độ điểm cực đại của đồ thị hàm số $y = x - e^x$.],
  ([$(0; 1)$], True([$(0; -1)$]), [$(1; 0)$], [$(0; 0)$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Tính đạo hàm: $y' = 1 - e^x = 0 <=> e^x = 1 <=> x = 0$.]
    #step[Tính đạo hàm cấp hai: $y'' = -e^x$. Ta có $y''(0) = -1 < 0$, nên hàm số đạt cực đại tại $x = 0$.]
    #step[Với $x = 0$, ta có $y(0) = 0 - e^0 = -1$. Tọa độ điểm cực đại là $(0; -1)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm điểm cực tiểu của hàm số $y = x^2 - 4 ln x$.],
  ([$x = -sqrt(2)$], [$x = 2$], True([$x = sqrt(2)$]), [$x = 4$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = (0; +oo)$.]
    #step[Tính đạo hàm: $y' = 2x - 4/x = (2x^2 - 4)/x$.]
    #step[Giải $y' = 0 <=> 2x^2 - 4 = 0 <=> x = sqrt(2)$ (do $x > 0$).]
    #step[Qua $x = sqrt(2)$, đạo hàm $y'$ đổi dấu từ âm sang dương.]
    #step[Vậy điểm cực tiểu của hàm số là $x = sqrt(2)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị cực đại của hàm số $y = sqrt(4x - x^2)$.],
  ([$2$], True([$2$]), [$0$], [$4$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $4x - x^2 >= 0 <=> x in [0; 4]$.]
    #step[Đạo hàm: $y' = (4 - 2x)/(2 sqrt(4x - x^2)) = (2 - x)/sqrt(4x - x^2) = 0 <=> x = 2$ (thỏa mãn).]
    #step[Đạo hàm đổi dấu từ dương sang âm khi đi qua $x = 2$, hàm số đạt cực đại tại $x = 2$.]
    #step[Giá trị cực đại của hàm số là $y(2) = sqrt(4(2) - 2^2) = 2$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm điểm cực tiểu của hàm số $y = x^2 e^x$.],
  ([$x = -2$], True([$x = 0$]), [$x = 2$], [$x = -1$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Tính đạo hàm: $y' = 2x e^x + x^2 e^x = (x^2 + 2x)e^x$.]
    #step[Giải $y' = 0 <=> x^2 + 2x = 0 <=> x = 0$ hoặc $x = -2$.]
    #step[Đạo hàm $y'$ đổi dấu từ âm sang dương khi qua $x = 0$, đạt cực tiểu tại $x = 0$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ liên tục trên các khoảng xác định và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'$,
        func: $f$,
        x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
        d-signs: ($+$, $0$, $-$, "||", $-$, $0$, $+$),
        v-vals: ($-oo$, $3$, ($-1$, $+oo$), $2$, $+oo$),
      )
    ]
    Xét các mệnh đề sau:
    (I) Hàm số đồng biến trên các khoảng $(-oo; -1)$ và $(1; +oo)$.
    (II) Hàm số có đúng 2 điểm cực trị.
    (III) Hàm số nghịch biến trên khoảng $(-1; 1)$.
    (IV) Điểm cực đại của đồ thị hàm số là $M(-1; 3)$.
    Số mệnh đề đúng là bao nhiêu?
  ],
  ([$1$], [$2$], True([$3$]), [$4$]),
  accent: c-book,
  loigiai: [
    #step[Quan sát bảng biến thiên:]
    #step[Mệnh đề (I) đúng: $f'(x) > 0$ trên các khoảng $(-oo; -1)$ và $(1; +oo)$.]
    #step[Mệnh đề (II) đúng: đạo hàm đổi dấu khi qua $x = -1$ (từ dương sang âm) và qua $x = 1$ (từ âm sang dương). Điểm $x = 0$ là điểm gián đoạn của hàm số (giới hạn hai bên khác nhau) nhưng không phải cực trị.]
    #step[Mệnh đề (III) sai: hàm số bị gián đoạn vô cực tại $x = 0$, do đó hàm số không nghịch biến trên khoảng $(-1; 1)$ mà chỉ nghịch biến trên từng khoảng $(-1; 0)$ và $(0; 1)$.]
    #step[Mệnh đề (IV) đúng: hàm số đạt cực đại tại $x = -1$ với $f(-1) = 3$. Điểm cực đại của đồ thị là $M(-1; 3)$.]
    #step[Vậy có 3 mệnh đề đúng (I, II, IV).]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = x - sin x$ có bao nhiêu điểm cực trị trên $[0;2 pi]$?],
  ([$1$], [$2$], [$3$], True([Không có cực trị])),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm: $y' = 1 - cos x$.]
    #step[Vì $-1 <= cos x <= 1, forall x in RR$, nên $y' = 1 - cos x >= 0, forall x in RR$.]
    #step[Đạo hàm $y'$ triệt tiêu tại các điểm $x = k 2 pi$ ($k in ZZ$) nhưng không đổi dấu khi đi qua các điểm này.]
    #step[Do đó, hàm số không có cực trị.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị cực tiểu của hàm số $y = (x^2 + 3)/(x - 1)$.],
  ([$6$], True([$6$]), [$-2$], [$3$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR backslash {1}$.]
    #step[Tính đạo hàm: $y' = (2x(x - 1) - (x^2 + 3))/(x - 1)^2 = (x^2 - 2x - 3)/(x - 1)^2$.]
    #step[Giải $y' = 0 <=> x^2 - 2x - 3 = 0 <=> x = -1$ hoặc $x = 3$.]
    #step[Đạo hàm đổi dấu từ âm sang dương khi đi qua $x = 3$, do đó cực tiểu đạt tại $x = 3$ với giá trị cực tiểu là $y(3) = (3^2 + 3)/(3 - 1) = 6$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $y = f(x)$ có đạo hàm liên tục trên $RR$ và có $3$ điểm cực trị $x = -1$, $x = 1$, $x = 3$. Hỏi hàm số $g(x) = f(x^2 - 2x)$ có bao nhiêu điểm cực trị?],
  ([$3$], True([$5$]), [$7$], [$9$]),
  accent: c-book,
  loigiai: [
    #step[Ta có $g'(x) = (2x - 2) f'(x^2 - 2x)$.]
    #step[Cho $g'(x) = 0 <=> 2x - 2 = 0$ hoặc $f'(x^2 - 2x) = 0$.]
    #step[Tương đương: $x = 1$ hoặc $x^2 - 2x = -1$ (1), $x^2 - 2x = 1$ (2), $x^2 - 2x = 3$ (3).]
    #step[Phương trình (1) <=> $(x - 1)^2 = 0$ (nghiệm kép $x = 1$). Kết hợp nghiệm $x = 1$ trước đó ta được nghiệm bội lẻ $x = 1$.]
    #step[Phương trình (2) có $2$ nghiệm đơn là $x = 1 +- sqrt(2)$.]
    #step[Phương trình (3) <=> $x^2 - 2x - 3 = 0$ có $2$ nghiệm đơn là $x = -1$ và $x = 3$.]
    #step[Tổng cộng có $5$ nghiệm bội lẻ phân biệt, qua đó đạo hàm $g'(x)$ đổi dấu. Vậy $g(x)$ có $5$ điểm cực trị.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = x^3 - 3x^2 - 9x + 2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = RR$.]),
    True([Đạo hàm của hàm số là $y' = 3x^2 - 6x - 9$.]),
    [Điểm cực đại của hàm số là $x = 3$.],
    True([Giá trị cực tiểu của hàm số là $-25$.]),
  ),
  accent: c-book,
  loigiai: [
    - Hàm đa thức có tập xác định $D = RR$, a) Đúng.
    - Đạo hàm $y' = 3x^2 - 6x - 9$, b) Đúng.
    - Giải $y' = 0 <=> x = -1$ hoặc $x = 3$. Lập BBT ta thấy điểm cực đại là $x = -1$, cực tiểu là $x = 3$. Do đó c) Sai.
    - Giá trị cực tiểu là $y(3) = 3^3 - 3(3^2) - 9(3) + 2 = -25$, d) Đúng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $f(x) = (x^2 - x + 1)/(x - 1)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đạt cực đại tại $x = 0$ và đạt cực tiểu tại $x = 2$.]),
    True([Hàm số đồng biến trên các khoảng $(-oo; 0)$ và $(2; +oo)$.]),
    True([Giá trị cực tiểu của hàm số lớn hơn giá trị cực đại của hàm số.]),
    True([Hàm số $g(x) = f(x - 2)$ đồng biến trên khoảng $(4; +oo)$.]),
  ),
  accent: c-book,
  loigiai: [
    - Đạo hàm của hàm số: $f'(x) = (x^2 - 2x)/(x - 1)^2$. Nghiệm là $x = 0$ và $x = 2$. Lập BBT, ta thấy hàm số đạt cực đại tại $x = 0$, cực tiểu tại $x = 2$. Mệnh đề a) Đúng.
    - Đạo hàm $f'(x) > 0 <=> x < 0$ hoặc $x > 2$. Do đó hàm số đồng biến trên các khoảng $(-oo; 0)$ và $(2; +oo)$. Mệnh đề b) Đúng.
    - Giá trị cực đại là $f(0) = -1$, giá trị cực tiểu là $f(2) = 3$. Ta có $3 > -1$ nên cực tiểu lớn hơn cực đại. Mệnh đề c) Đúng.
    - Hàm số $g(x) = f(x-2)$ đồng biến khi $x-2 in (-oo; 0) union (2; +oo) <=> x in (-oo; 2) union (4; +oo)$. Do đó hàm số đồng biến trên khoảng $(4; +oo)$. Mệnh đề d) Đúng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = sqrt(x^2 - 4x + 3)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = (-oo; 1] union [3; +oo)$.]),
    True([Đạo hàm của hàm số là $y' = (x - 2)/sqrt(x^2 - 4x + 3)$ trên $(-oo; 1) union (3; +oo)$.]),
    [Hàm số đạt cực tiểu tại điểm $x = 2$.],
    True([Hàm số đã cho không có điểm cực trị nào.]),
  ),
  accent: c-book,
  loigiai: [
    - Điều kiện xác định $x^2 - 4x + 3 >= 0 <=> x <= 1$ hoặc $x >= 3$. Tập xác định là $D$, a) Đúng.
    - Đạo hàm đúng theo công thức $u'/ (2sqrt(u))$, b) Đúng.
    - Đạo hàm $y' = 0 <=> x = 2$. Tuy nhiên $x = 2$ không thuộc tập xác định của hàm số, c) Sai.
    - Đạo hàm $y'$ không đổi dấu trên các khoảng xác định trong miền mở rộng của tập xác định. Do đó d) Đúng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = x - 2 ln x$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = (0; +oo)$.]),
    True([Đạo hàm của hàm số là $y' = 1 - 2/x$.]),
    True([Hàm số đạt cực tiểu tại $x = 2$.]),
    True([Giá trị cực tiểu của hàm số là $2 - 2 ln 2$.]),
  ),
  accent: c-book,
  loigiai: [
    - Điều kiện xác định là $x > 0$, a) Đúng.
    - Đạo hàm $y' = 1 - 2/x$, b) Đúng.
    - Nghiệm của đạo hàm: $y' = 0 <=> x = 2$. Đạo hàm đổi dấu từ âm sang dương khi đi qua $x = 2$ nên đạt cực tiểu tại $x = 2$, c) Đúng.
    - Giá trị cực tiểu $y(2) = 2 - 2 ln 2$, d) Đúng.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x - 1)^2 (x - 2)^3$. Số điểm cực trị của hàm số là bao nhiêu?],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Nghiệm của đạo hàm là $x = 0$ (bội lẻ), $x = 1$ (bội chẵn), $x = 2$ (bội lẻ).]
    #step[Đạo hàm đổi dấu khi đi qua các nghiệm bội lẻ là $x = 0$ và $x = 2$.]
    #step[Số điểm cực trị của hàm số là $2$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị cực đại của hàm số $y = x^3 - 12x + 1$.],
  [$17$],
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = 3x^2 - 12 = 0 <=> x = +-2$.]
    #step[Tính đạo hàm cấp hai: $y'' = 6x$.]
    #step[Ta có $y''(-2) = -12 < 0$ nên hàm số đạt cực đại tại $x = -2$.]
    #step[Giá trị cực đại tương ứng là $y(-2) = (-2)^3 - 12(-2) + 1 = 17$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm số điểm cực trị của hàm số $g(x) = |x^3 - 3x^2 + 2|$.],
  [$5$],
  accent: c-book,
  loigiai: [
    #step[Xét hàm số bên trong $f(x) = x^3 - 3x^2 + 2$.]
    #step[Ta có $f'(x) = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$. Vậy $f(x)$ có 2 điểm cực trị.]
    #step[Tính các giá trị cực trị: cực đại $f(0) = 2 > 0$, cực tiểu $f(2) = -2 < 0$.]
    #step[Do giá trị cực đại và cực tiểu trái dấu ($2 dot.c (-2) < 0$), phương trình $f(x) = 0$ có đúng 3 nghiệm phân biệt (cắt trục hoành tại 3 điểm).]
    #step[Số điểm cực trị của hàm số $g(x) = |f(x)|$ bằng số điểm cực trị của $f(x)$ cộng với số nghiệm đơn của phương trình $f(x) = 0$.]
    #step[Vậy số điểm cực trị của $g(x)$ là $2 + 3 = 5$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = (x^2 - 1)/(x^2 + 1)$. Hàm số có bao nhiêu điểm cực đại?],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Đạo hàm $f'(x) = 0 <=> x^2 - 1 = 0 <=> x = +-1$.]
    #step[Vì mẫu số $x^2 + 1 > 0$ với mọi $x$, dấu của $f'(x)$ trùng với dấu của tử số $x^2 - 1$.]
    #step[Khi đi qua $x = -1$ (từ trái sang phải), $f'(x)$ đổi dấu từ dương sang âm, do đó $x = -1$ là điểm cực đại.]
    #step[Khi đi qua $x = 1$, $f'(x)$ đổi dấu từ âm sang dương, do đó $x = 1$ là điểm cực tiểu.]
    #step[Số điểm cực đại của hàm số là $1$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị cực đại của hàm số $y = (x^2 + 1)/x$.],
  [$-2$],
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR backslash {0}$.]
    #step[Tính đạo hàm: $y' = 1 - 1/x^2 = (x^2 - 1)/x^2 = 0 <=> x = +-1$.]
    #step[Đạo hàm đổi dấu từ dương sang âm khi đi qua $x = -1$.]
    #step[Do đó cực đại đạt tại $x = -1$ với giá trị cực đại là $y(-1) = ((-1)^2 + 1)/(-1) = -2$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đạo hàm $f'(x) = (x + 1)^2 (x - 1) (x - 2)$. Tìm số điểm cực tiểu của hàm số $y = f(x)$.],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Nghiệm của đạo hàm gồm $x = -1$ (bội 2), $x = 1$ (bội 1), $x = 2$ (bội 1).]
    #step[Xét dấu của đạo hàm $f'(x)$: trên khoảng $(1; 2)$, đạo hàm âm; trên $(2; +oo)$, đạo hàm dương.]
    #step[Do đạo hàm đổi dấu từ âm sang dương khi đi qua $x = 2$, hàm số đạt cực tiểu tại $x = 2$.]
    #step[Tại $x = 1$, đạo hàm đổi dấu từ dương sang âm (cực đại). Tại $x = -1$ đạo hàm không đổi dấu.]
    #step[Vậy số điểm cực tiểu của hàm số là $1$.]
  ],
))
