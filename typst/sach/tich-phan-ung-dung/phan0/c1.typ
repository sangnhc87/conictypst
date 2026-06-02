#import "../_config.typ": *

#chapter([Nguyên hàm cơ bản và các tính chất], theme-color: c-p0)

#phuongphap(theme-color: c-p0)[
  *1. Định nghĩa Nguyên hàm:*
  Cho hàm số $f(x)$ xác định trên khoảng $K$. Hàm số $F(x)$ được gọi là một *nguyên hàm* của hàm số $f(x)$ trên $K$ nếu:
  $
    F'(x) = f(x)  wide  "với mọi " x in K
  $
  Nếu $F(x)$ là một nguyên hàm của $f(x)$ trên $K$ thì mọi nguyên hàm của $f(x)$ trên $K$ đều có dạng $F(x) + C$, với $C$ là hằng số thực. Ký hiệu họ tất cả các nguyên hàm của $f(x)$ là:
  $
    integral f(x) d x = F(x) + C
  $

  *2. Các tính chất cơ bản:*
  - Tích của hằng số: $integral k f(x) d x = k integral f(x) d x$ (với hằng số $k != 0$).
  - Tổng hiệu: $integral [f(x) +- g(x)] d x = integral f(x) d x +- integral g(x) d x$.
  - Đạo hàm của nguyên hàm: lr(( integral f(x) d x ))' = f(x)  và  $integral f'(x) d x = f(x) + C$.
]

#topic([Bảng nguyên hàm sơ cấp thường gặp], prefix: "Chủ đề", theme-color: c-p0)

#ghinho(theme-color: c-p0)[
  Dưới đây là bảng nguyên hàm của các hàm số sơ cấp và hàm hợp tuyến tính $f(a x + b)$ với $a != 0$:

  #align(center)[
    #table(
      columns: (1.2fr, 2.2fr, 2.6fr),
      align: (center, left, left),
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else { none },
      [*Hàm số $f(x)$*], [*Nguyên hàm cơ bản $integral f(x) d x$*], [*Nguyên hàm hợp tuyến tính $integral f(a x + b) d x$*],
      [$0$], [$integral 0 d x = C$], [---],
      [$1$], [$integral 1 d x = x + C$], [$integral 1 d x = x + C$],
      [$x^alpha$ \ ($alpha != -1$)], [$integral x^alpha d x = frac(x^(alpha + 1), alpha + 1) + C$], [$integral (a x + b)^alpha d x = frac(1, a) dot frac((a x + b)^(alpha + 1), alpha + 1) + C$],
      [$frac(1, x)$], [$integral frac(1, x) d x = ln|x| + C$], [$integral frac(1, a x + b) d x = frac(1, a) ln|a x + b| + C$],
      [$e^x$], [$integral e^x d x = e^x + C$], [$integral e^(a x + b) d x = frac(1, a) e^(a x + b) + C$],
      [$k^x$ \ ($k > 0, k != 1$)], [$integral k^x d x = frac(k^x, ln k) + C$], [$integral k^(a x + b) d x = frac(1, a) dot frac(k^(a x + b), ln k) + C$],
      [$cos x$], [$integral cos x d x = sin x + C$], [$integral cos(a x + b) d x = frac(1, a) sin(a x + b) + C$],
      [$sin x$], [$integral sin x d x = -cos x + C$], [$integral sin(a x + b) d x = -frac(1, a) cos(a x + b) + C$],
      [$frac(1, cos^2 x)$], [$integral frac(1, cos^2 x) d x = tan x + C$], [$integral frac(1, cos^2(a x + b)) d x = frac(1, a) tan(a x + b) + C$],
      [$frac(1, sin^2 x)$], [$integral frac(1, sin^2 x) d x = -cot x + C$], [$integral frac(1, sin^2(a x + b)) d x = -frac(1, a) cot(a x + b) + C$],
    )
  ]
]

#topic([Các dạng toán thuần túy cơ bản], prefix: "Chủ đề", theme-color: c-p0)

#dang([Tìm họ nguyên hàm bằng biến đổi đại số cơ bản], theme-color: c-p0)

#vd(
  [Tìm họ nguyên hàm của hàm số $f(x) = 3x^2 - 4x + 5$ trên $RR$.],
  loigiai: [
    Áp dụng tính chất tuyến tính của nguyên hàm và công thức nguyên hàm hàm lũy thừa:
    $
      integral f(x) d x = integral (3x^2 - 4x + 5) d x = 3 integral x^2 d x - 4 integral x d x + 5 integral 1 d x
    $
    Áp dụng công thức $integral x^alpha d x = frac(x^(alpha+1), alpha+1) + C$:
    $
      integral f(x) d x = 3 dot frac(x^3, 3) - 4 dot frac(x^2, 2) + 5x + C = x^3 - 2x^2 + 5x + C
    $
    Vậy họ nguyên hàm của hàm số đã cho là $x^3 - 2x^2 + 5x + C$.
  ],
  theme-color: c-p0,
)

#vd(
  [Tìm họ nguyên hàm của hàm số $g(x) = (2x - 3)^4$ trên $RR$.],
  loigiai: [
    Hàm số có dạng hợp tuyến tính $f(a x + b) = (a x + b)^alpha$ với $a = 2$, $b = -3$, $alpha = 4$.
    Áp dụng công thức nguyên hàm hợp tuyến tính:
    $
      integral (2x - 3)^4 d x = frac(1, 2) dot frac((2x - 3)^(4 + 1), 4 + 1) + C = frac(1, 10) (2x - 3)^5 + C
    $
    Vậy họ nguyên hàm là $frac(1, 10) (2x - 3)^5 + C$.
  ],
  theme-color: c-p0,
)

#vd(
  [Tìm họ nguyên hàm của hàm số $h(x) = frac(2x^2 - x + 1, x)$ trên khoảng $(0, +infinity)$.],
  loigiai: [
    Ta thực hiện phép chia đa thức ở tử số cho mẫu số để đưa hàm số về dạng tổng các hàm đơn giản:
    $
      h(x) = frac(2x^2, x) - frac(x, x) + frac(1, x) = 2x - 1 + frac(1, x)
    $
    Tính nguyên hàm từng số hạng trên khoảng $(0, +infinity)$:
    $
      integral h(x) d x = integral lr( 2x - 1 + frac(1, x) ) d x = 2 integral x d x - integral 1 d x + integral frac(1, x) d x
    $
    $
      integral h(x) d x = 2 dot frac(x^2, 2) - x + ln|x| + C = x^2 - x + ln x + C  wide  " (vì " x > 0 " nên " |x| = x ")"
    $
    Vậy họ nguyên hàm của hàm số đã cho là $x^2 - x + ln x + C$.
  ],
  theme-color: c-p0,
)

#dang([Tìm một nguyên hàm thỏa mãn điều kiện cho trước (Tìm hằng số $C$)], theme-color: c-p0)

#vd(
  [Cho hàm số $f(x) = e^(3x - 1)$. Tìm nguyên hàm $F(x)$ của $f(x)$ biết $F lr( frac(1, 3) ) = 2$.],
  loigiai: [
    Trước hết, tìm họ nguyên hàm của $f(x) = e^(3x - 1)$. Đây là hàm số hợp tuyến tính với $a = 3$, $b = -1$:
    $
      F(x) = integral e^(3x - 1) d x = frac(1, 3) e^(3x - 1) + C
    $
    Sử dụng điều kiện ban đầu $F lr( frac(1, 3) ) = 2$, ta thế $x = frac(1, 3)$ vào biểu thức của $F(x)$:
    $
      F lr( frac(1, 3) ) = frac(1, 3) e^(3 dot frac(1, 3) - 1) + C = 2 \
      <=> frac(1, 3) e^0 + C = 2  <=>  frac(1, 3) + C = 2  <=>  C = frac(5, 3)
    $
    Vậy nguyên hàm cần tìm là $F(x) = frac(1, 3) e^(3x - 1) + frac(5, 3)$.
  ],
  theme-color: c-p0,
)

#dang([Xác định hằng số tích phân $C$ từ đồ thị / hình vẽ], theme-color: c-p0)

#vd(
  [Cho hàm số $y = f(x)$ xác định trên $RR$. Biết rằng đồ thị của một nguyên hàm $F(x)$ của hàm số $f(x)$ là một đường parabol có đỉnh là $I(1; 3)$ và cắt trục tung tại điểm có tung độ bằng $4$. Biết rằng $f(x)$ là hàm số bậc nhất. Hãy xác định công thức của nguyên hàm $F(x)$ và hàm số $f(x)$.],
  loigiai: [
    - Vì $F(x)$ là một nguyên hàm của hàm số bậc nhất $f(x)$ nên $F(x)$ là một hàm số bậc hai (parabol). Do đó, ta có dạng:
      $ F(x) = a x^2 + b x + c quad ("với"  a != 0) $
    - Vì đồ thị $y = F(x)$ cắt trục tung tại điểm có tung độ bằng $4$ nên:
      $ F(0) = 4  =>  c = 4 $
    - Đồ thị có đỉnh là $I(1; 3)$ nên ta có hệ điều kiện sau:
      - Hoành độ đỉnh: $-frac(b, 2a) = 1  =>  b = -2a$.
      - Tung độ đỉnh: $F(1) = 3  =>  a(1)^2 + b(1) + 4 = 3  =>  a + b = -1$.
    - Thế $b = -2a$ vào phương trình $a + b = -1$, ta được:
      $ a - 2a = -1  =>  -a = -1  =>  a = 1 $
      $ => b = -2(1) = -2 $
    - Vậy nguyên hàm cần tìm là:
      $ F(x) = x^2 - 2x + 4 $
    - Từ đó, hàm số ban đầu là:
      $ f(x) = F'(x) = 2x - 2 $
  ],
  theme-color: c-p0,
)

#vd(
  [
    #grid(
      columns: (1.3fr, 1fr),
      column-gutter: 12pt,
      [
        Cho hàm số $y = f(x)$ có đồ thị là một đường thẳng như hình vẽ bên. Biết $F(x)$ là một nguyên hàm của $f(x)$ thỏa mãn $F(2) = 5$. Hãy tìm giá trị của $F(0)$.
      ],
      canvas(length: 0.8cm, {
        import draw: *
        line((-1.0, 0.0), (3.0, 0.0), mark: (end: ">"), stroke: 0.5pt)
        line((0.0, -1.0), (0.0, 4.0), mark: (end: ">"), stroke: 0.5pt)
        content((2.8, -0.3), $x$)
        content((-0.3, 3.8), $y$)
        line((-1.0, 0.0), (2.5, 3.5), stroke: 1.2pt + rgb("#ef4444"))
        circle((0.0, 1.0), radius: 1.5pt, fill: rgb("#3b82f6"))
        circle((2.0, 3.0), radius: 1.5pt, fill: rgb("#3b82f6"))
        line((2.0, 0.0), (2.0, 3.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        line((0.0, 3.0), (2.0, 3.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        content((-0.3, 1.0), $1$)
        content((-0.3, 3.0), $3$)
        content((2.0, -0.3), $2$)
        content((-0.2, -0.2), $O$)
        content((1.2, 2.5), $y = f(x)$)
      })
    )
  ],
  loigiai: [
    - Đường thẳng $y = f(x)$ đi qua hai điểm $(0; 1)$ and $(2; 3)$. Do đó, phương trình của đường thẳng này là:
      $ f(x) = x + 1 $
    - Nguyên hàm của hàm số $f(x) = x + 1$ là:
      $ F(x) = integral (x + 1) d x = frac(x^2, 2) + x + C $
    - Sử dụng điều kiện $F(2) = 5$, ta thế $x = 2$ vào biểu thức:
      $ F(2) = frac(2^2, 2) + 2 + C = 5  <=>  2 + 2 + C = 5  <=>  C = 1 $
    - Vậy $F(x) = frac(x^2, 2) + x + 1$.
    - Từ đó ta có: $F(0) = 1$.
  ],
  theme-color: c-p0,
)

#dang([Nguyên hàm đa trị (hằng số tích phân rời rạc trên các khoảng)], theme-color: c-p0)

#vd(
  [Cho hàm số $f(x) = frac(1, x)$ với mọi $x != 0$. Tìm một nguyên hàm $F(x)$ của $f(x)$ thỏa mãn $F(-1) = 2$ và $F(e) = 5$. Tính giá trị của biểu thức $T = F(-e) + F(1)$.],
  loigiai: [
    - Tập xác định của hàm số là $RR setminus \{0\}$.
    - Trên các khoảng xác định $( -infinity; 0 )$ và $( 0; +infinity )$, họ nguyên hàm của $f(x)$ là:
      $ F(x) = {
        ln x + C_1 wide "nếu " x > 0 \
        ln(-x) + C_2 wide "nếu " x < 0
      } $
    - Với $x = e > 0$, ta có:
      $ F(e) = ln e + C_1 = 5  =>  1 + C_1 = 5  =>  C_1 = 4 $
    - Với $x = -1 < 0$, ta có:
      $ F(-1) = ln(1) + C_2 = 2  =>  C_2 = 2 $
    - Do đó, công thức của nguyên hàm $F(x)$ là:
      $ F(x) = {
        ln x + 4 wide "nếu " x > 0 \
        ln(-x) + 2 wide "nếu " x < 0
      } $
    - Tính các giá trị tại $x = -e$ và $x = 1$:
      - $F(-e) = ln(|-e|) + 2 = ln e + 2 = 3$.
      - $F(1) = ln 1 + 4 = 4$.
    - Vậy giá trị biểu thức $T = F(-e) + F(1) = 3 + 4 = 7$.
  ],
  theme-color: c-p0,
)

#dang([Nguyên hàm liên tục của hàm số phân nhánh], theme-color: c-p0)

#vd(
  [Cho hàm số $f(x) = {
    2x + 3 wide "nếu " x >= 1 \
    5 wide "nếu " x < 1
  }$. Tìm một nguyên hàm $F(x)$ của $f(x)$ liên tục trên $RR$ và thỏa mãn $F(0) = 2$. Tính giá trị của $F(2)$.],
  loigiai: [
    - Họ nguyên hàm của $f(x)$ trên từng khoảng xác định là:
      - Với $x > 1$: $F(x) = integral (2x + 3) d x = x^2 + 3x + C_1$.
      - Với $x < 1$: $F(x) = integral 5 d x = 5x + C_2$.
    - Vì $F(0) = 2$ và $0 < 1$ nên ta thế $x = 0$ vào công thức dưới:
      $ F(0) = 5(0) + C_2 = 2  =>  C_2 = 2 $
    - Để hàm số $F(x)$ liên tục tại $x = 1$, giới hạn hai bên tại $x = 1$ phải bằng nhau:
      $ lim_(x -> 1^+) F(x) = lim_(x -> 1^-) F(x) $
      $ <=> lim_(x -> 1^+) (x^2 + 3x + C_1) = lim_(x -> 1^-) (5x + C_2) $
      $ <=> 1^2 + 3(1) + C_1 = 5(1) + 2 $
      $ <=> 4 + C_1 = 7  <=>  C_1 = 3 $
    - Do đó, nguyên hàm liên tục $F(x)$ trên $RR$ là:
      $ F(x) = {
        x^2 + 3x + 3 wide "nếu " x >= 1 \
        5x + 2 wide "nếu " x < 1
      } $
    - Tại $x = 2 > 1$, ta có:
      $ F(2) = 2^2 + 3(2) + 3 = 4 + 6 + 3 = 13 $
  ],
  theme-color: c-p0,
)

#bt-header(c-p0)

#q-label("PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn", c-p0)

#resetexamstate()

#tn(
  [Họ nguyên hàm của hàm số $f(x) = 5^x + cos x$ là:],
  (
    [$frac(5^x, ln 5) - sin x + C$],
    [$5^x ln 5 + sin x + C$],
    True([$frac(5^x, ln 5) + sin x + C$]),
    [$5^x + sin x + C$],
  ),
  loigiai: [
    Chọn *C*.
    Theo bảng nguyên hàm sơ cấp, ta có:
    $integral 5^x d x = frac(5^x, ln 5) + C$ và $integral cos x d x = sin x + C$.
    Do đó, $integral (5^x + cos x) d x = frac(5^x, ln 5) + sin x + C$.
  ],
)

#tn(
  [Họ nguyên hàm của hàm số $f(x) = frac(3, 3x - 2)$ trên khoảng lr( frac(2, 3), +infinity ) là:],
  (
    True([$ln|3x - 2| + C$]),
    [$3 ln|3x - 2| + C$],
    [$frac(1, 3) ln|3x - 2| + C$],
    [$9 ln|3x - 2| + C$],
  ),
  loigiai: [
    Chọn *A*.
    Áp dụng công thức nguyên hàm của hàm hợp tuyến tính $integral frac(1, a x + b) d x = frac(1, a) ln|a x + b| + C$:
    $
      integral frac(3, 3x - 2) d x = 3 integral frac(1, 3x - 2) d x = 3 dot frac(1, 3) ln|3x - 2| + C = ln|3x - 2| + C
    $
  ],
)

#tn(
  [Cho $F(x)$ là một nguyên hàm của hàm số $f(x) = 2x + 1$ thỏa mãn $F(1) = 5$. Giá trị của $F(2)$ bằng:],
  (
    [$8$],
    True([$9$]),
    [$7$],
    [$10$],
  ),
  loigiai: [
    Chọn *B*.
    Họ nguyên hàm của $f(x) = 2x + 1$ là:
    $
      F(x) = integral (2x + 1) d x = x^2 + x + C
    $
    Vì $F(1) = 5$ nên ta có $1^2 + 1 + C = 5 => C = 3$.
    Vậy $F(x) = x^2 + x + 3$.
    Từ đó, $F(2) = 2^2 + 2 + 3 = 9$.
  ],
)

#tn(
  [Tìm họ nguyên hàm của hàm số $f(x) = sin(2x - 3)$:],
  (
    [$-cos(2x - 3) + C$],
    True([$-frac(1, 2) cos(2x - 3) + C$]),
    [$frac(1, 2) cos(2x - 3) + C$],
    [$-2 cos(2x - 3) + C$],
  ),
  loigiai: [
    Chọn *B*.
    Áp dụng công thức nguyên hàm hàm hợp tuyến tính:
    $
      integral sin(2x - 3) d x = -frac(1, 2) cos(2x - 3) + C
    $
  ],
)

#tn(
  [Cho hàm số $f(x)$ thỏa mãn $f'(x) = 3 - 5 sin x$ và $f(0) = 10$. Mệnh đề nào dưới đây đúng?],
  (
    [$f(x) = 3x - 5 cos x + 15$],
    True([$f(x) = 3x + 5 cos x + 5$]),
    [$f(x) = 3x - 5 cos x + 10$],
    [$f(x) = 3x + 5 cos x + 10$],
  ),
  loigiai: [
    Chọn *B*.
    Ta có:
    $
      f(x) = integral f'(x) d x = integral (3 - 5 sin x) d x = 3x + 5 cos x + C
    $
    Vì $f(0) = 10$ nên $3(0) + 5 cos(0) + C = 10 => 5 + C = 10 => C = 5$.
    Vậy $f(x) = 3x + 5 cos x + 5$.
  ],
)

#tn(
  [
    #grid(
      columns: (1.3fr, 1fr),
      column-gutter: 12pt,
      [
        Cho hàm số $f(x) = 2x - 4$. Biết đồ thị của một nguyên hàm $F(x)$ của $f(x)$ đi qua điểm cực tiểu có tọa độ hiển thị trên hình vẽ bên. Công thức của nguyên hàm $F(x)$ là:
        
        - A. $F(x) = x^2 - 4x + 3$
        - B. $F(x) = x^2 - 4x - 3$
        - C. $F(x) = x^2 - 4x + 1$
        - D. $F(x) = x^2 - 4x$
      ],
      canvas(length: 0.8cm, {
        import draw: *
        line((-1.0, 0.0), (5.0, 0.0), mark: (end: ">"), stroke: 0.5pt)
        line((0.0, -4.0), (0.0, 2.5), mark: (end: ">"), stroke: 0.5pt)
        content((4.8, -0.3), $x$)
        content((-0.3, 2.3), $y$)
        bezier((0.0, 1.0), (2.0, -3.0), (0.7, -1.5), (1.5, -3.0), stroke: 1.2pt + rgb("#3b82f6"))
        bezier((2.0, -3.0), (4.0, 1.0), (2.5, -3.0), (3.3, -1.5), stroke: 1.2pt + rgb("#3b82f6"))
        line((2.0, 0.0), (2.0, -3.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        line((0.0, -3.0), (2.0, -3.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        circle((2.0, -3.0), radius: 1.5pt, fill: rgb("#ef4444"), stroke: none)
        content((2.5, -3.4), $I(2; -3)$)
        content((-0.4, -3.0), $-3$)
        content((2.0, 0.3), $2$)
        content((-0.3, 1.0), $1$)
        content((-0.2, -0.2), $O$)
      })
    )
  ],
  (
    [$F(x) = x^2 - 4x + 3$],
    [$F(x) = x^2 - 4x - 3$],
    True([$F(x) = x^2 - 4x + 1$]),
    [$F(x) = x^2 - 4x$],
  ),
  loigiai: [
    Chọn *C*.
    Ta có $F(x) = integral (2x - 4) d x = x^2 - 4x + C$.
    Đồ thị hàm số $F(x)$ có điểm cực tiểu là đỉnh của parabol $I(2; -3)$.
    Điểm này thuộc đồ thị nên $F(2) = -3 => 2^2 - 4(2) + C = -3 => -4 + C = -3 => C = 1$.
    Vậy nguyên hàm cần tìm là $F(x) = x^2 - 4x + 1$.
  ],
)

#tn(
  [Cho hàm số $f(x) = 1/x$ với mọi $x != 0$. Biết $F(x)$ là một nguyên hàm của $f(x)$ thỏa mãn $F(1) = 2$ và $F(-1) = 3$. Tính giá trị của biểu thức $T = F(e) + F(-e)$ (bài toán hằng số tích phân đa trị trên các khoảng xác định):],
  (
    [$5$],
    [$6$],
    True([$7$]),
    [$8$],
  ),
  loigiai: [
    Chọn *C*.
    Họ nguyên hàm của $f(x) = 1/x$ trên $RR setminus \{0\}$ là:
    $
      F(x) = {
        ln x + C_1   wide  "nếu " x > 0 \
        ln(-x) + C_2  wide  "nếu " x < 0
      }
    $
    Với $x = 1 > 0$, ta có $F(1) = ln 1 + C_1 = 2 => C_1 = 2$.
    Với $x = -1 < 0$, ta có $F(-1) = ln(1) + C_2 = 3 => C_2 = 3$.
    Do đó:
    $F(e) = ln e + C_1 = 1 + 2 = 3$.
    $F(-e) = ln(e) + C_2 = 1 + 3 = 4$.
    Từ đó, $T = F(e) + F(-e) = 3 + 4 = 7$.
  ],
)

#tn(
  [Tìm tất cả các giá trị thực của tham số $m$ để hàm số $F(x) = (m - 1) x^3 + (m^2 - 3) x^2 + 3x$ là một nguyên hàm của hàm số $f(x) = 3x^2 + 2x + 3$ trên $RR$ (họ nguyên hàm chứa tham số):],
  (
    [$m = -2$],
    True([$m = 2$]),
    [$m = +-2$],
    [Không tồn tại $m$],
  ),
  loigiai: [
    Chọn *B*.
    Vì $F(x)$ là nguyên hàm của $f(x)$ nên $F'(x) = f(x)$ với mọi $x in RR$.
    Ta có:
    $
      F'(x) = 3(m - 1) x^2 + 2(m^2 - 3) x + 3
    $
    Đồng nhất hệ số với $f(x) = 3x^2 + 2x + 3$, ta có hệ phương trình:
    $
      {
        3(m - 1) = 3 \
        2(m^2 - 3) = 2
      }  <=>  {
        m - 1 = 1 \
        m^2 - 3 = 1
      }  <=>  {
        m = 2 \
        m^2 = 4
      }  =>  m = 2
    $
    Vậy giá trị cần tìm là $m = 2$.
  ],
)

#tn(
  [
    #grid(
      columns: (1.3fr, 1fr),
      column-gutter: 12pt,
      [
        Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đồ thị cắt trục hoành tại ba điểm phân biệt như hình bên. Gọi $F(x)$ là một nguyên hàm của $f(x)$ trên $RR$. Hỏi hàm số $y = F(x)$ có bao nhiêu điểm cực trị?
        
        - A. $1$
        - B. $2$
        - C. $3$
        - D. $4$
      ],
      canvas(length: 0.8cm, {
        import draw: *
        line((-2.0, 0.0), (3.0, 0.0), mark: (end: ">"), stroke: 0.5pt)
        line((0.0, -1.2), (0.0, 1.8), mark: (end: ">"), stroke: 0.5pt)
        content((2.8, -0.3), $x$)
        content((-0.3, 1.6), $y$)
        bezier((-1.5, -0.8), (0.0, 0.8), (-1.2, -0.2), (-0.6, 0.8), stroke: 1.2pt + rgb("#10b981"))
        bezier((0.0, 0.8), (1.5, -0.4), (0.5, 0.8), (1.1, -0.4), stroke: 1.2pt + rgb("#10b981"))
        bezier((1.5, -0.4), (2.3, 0.8), (1.8, -0.4), (2.1, 0.4), stroke: 1.2pt + rgb("#10b981"))
        content((-1.0, 0.3), $-1$)
        content((0.8, -0.3), $1$)
        content((2.0, 0.3), $2$)
        content((-0.2, -0.2), $O$)
      })
    )
  ],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$4$],
  ),
  loigiai: [
    Chọn *C*.
    Ta có $F'(x) = f(x)$. Do đó, các điểm cực trị của hàm số $y = F(x)$ là nghiệm của phương trình $F'(x) = 0 <=> f(x) = 0$ mà tại đó $f(x)$ đổi dấu.
    Quan sát đồ thị $y = f(x)$, ta thấy đồ thị cắt trục hoành tại 3 điểm phân biệt $x = -1$, $x = 1$, $x = 2$ và đổi dấu khi đi qua các điểm này.
    Do đó, hàm số $y = F(x)$ có đúng 3 điểm cực trị.
  ],
)

#tn(
  [Cho hàm số $f(x)$ liên tục trên $RR$ thỏa mãn $f(x) + x f'(x) = 4x^3 + 2x$ với mọi $x in RR$ và $f(1) = 2$. Họ nguyên hàm của hàm số $f(x)$ là:],
  (
    [$x^3 + x + C$],
    [$x^4 + x^2 + C$],
    True([$frac(x^4, 4) + frac(x^2, 2) + C$]),
    [$frac(x^3, 3) + frac(x^2, 2) + C$],
  ),
  loigiai: [
    Chọn *C*.
    Ta thấy vế trái: $f(x) + x f'(x) = [x f(x)]'$.
    Do đó, phương trình viết lại thành:
    $
      [x f(x)]' = 4x^3 + 2x  =>  x f(x) = integral (4x^3 + 2x) d x = x^4 + x^2 + C_0
    $
    Với $x = 1$, ta có $1 dot f(1) = 1^4 + 1^2 + C_0 => 2 = 2 + C_0 => C_0 = 0$.
    Do đó, $x f(x) = x^4 + x^2 => f(x) = x^3 + x$ với mọi $x != 0$.
    Vì $f(x)$ liên tục tại $x = 0$ nên ta cũng có $f(0) = 0$, nghĩa là $f(x) = x^3 + x$ với mọi $x in RR$.
    Họ nguyên hàm của $f(x)$ là:
    $
      integral f(x) d x = integral (x^3 + x) d x = frac(x^4, 4) + frac(x^2, 2) + C
    $
  ],
)

#tn(
  [Cho hàm số $f(x)$ xác định trên $RR$ bởi $f(x) = e^x$ khi $x >= 0$ và $f(x) = cos x$ khi $x < 0$. Biết $F(x)$ là một nguyên hàm liên tục của $f(x)$ trên $RR$ và $F(0) = 2$. Tính giá trị của biểu thức $T = F(1) + F(-pi/2)$:],
  (
    [$e + 1$],
    True([$e + 2$]),
    [$e + 3$],
    [$e + 4$],
  ),
  loigiai: [
    Chọn *B*.
    - Trên khoảng $(0; +infinity)$, ta có $F(x) = integral e^x d x = e^x + C_1$.
    - Trên khoảng $(-infinity; 0)$, ta có $F(x) = integral cos x d x = sin x + C_2$.
    - Vì $F(x)$ liên tục tại $x = 0$ và $F(0) = 2$ nên ta phải có:
      $ lim_(x -> 0^+) F(x) = lim_(x -> 0^-) F(x) = F(0) $
      $ <=> lim_(x -> 0^+) (e^x + C_1) = lim_(x -> 0^-) (sin x + C_2) = 2 $
      $ <=> e^0 + C_1 = 0 + C_2 = 2  <=>  1 + C_1 = C_2 = 2  =>  C_1 = 1, C_2 = 2 $
    - Do đó:
      $ F(x) = {
        e^x + 1 wide "nếu " x >= 0 \
        sin x + 2 wide "nếu " x < 0
      } $
    - Tính các giá trị:
      - $F(1) = e^1 + 1 = e + 1$.
      - $F(-pi/2) = sin(-pi/2) + 2 = -1 + 2 = 1$.
    - Vậy $T = F(1) + F(-pi/2) = e + 1 + 1 = e + 2$.
  ],
)

#tn(
  [Cho hàm số $f(x) = frac(1, x - 2)$ xác định trên $RR setminus \{2\}$. Biết $F(x)$ là một nguyên hàm của $f(x)$ trên $RR setminus \{2\}$ thỏa mãn $F(1) = 3$ và $F(3) = 1$. Tính giá trị của biểu thức $P = F(0) + F(4)$:],
  (
    [$4 - ln 2$],
    [$4$],
    [$4 + ln 2$],
    True([$4 + 2 ln 2$]),
  ),
  loigiai: [
    Chọn *D*.
    - Trên các khoảng xác định, nguyên hàm $F(x)$ có dạng:
      $ F(x) = {
        ln|x - 2| + C_1 wide "nếu " x > 2 \
        ln|x - 2| + C_2 wide "nếu " x < 2
      } $
    - Với $x = 3 > 2$, ta có $F(3) = ln(1) + C_1 = 1 => C_1 = 1$.
    - Với $x = 1 < 2$, ta có $F(1) = ln(1) + C_2 = 3 => C_2 = 3$.
    - Do đó:
      $ F(x) = {
        ln|x - 2| + 1 wide "nếu " x > 2 \
        ln|x - 2| + 3 wide "nếu " x < 2
      } $
    - Tính các giá trị:
      - $F(0) = ln|0 - 2| + 3 = ln 2 + 3$.
      - $F(4) = ln|4 - 2| + 1 = ln 2 + 1$.
    - Vậy $P = F(0) + F(4) = ln 2 + 3 + ln 2 + 1 = 4 + 2 ln 2$.
  ],
)

#tn(
  [
    #grid(
      columns: (1.3fr, 1fr),
      column-gutter: 12pt,
      [
        Cho hàm số $y = f(x)$ có đạo hàm liên tục trên $RR$. Đồ thị của hàm số đạo hàm $y = f'(x)$ là một đường parabol đi qua các điểm như hình vẽ bên. Hỏi hàm số $y = f(x)$ có bao nhiêu điểm cực trị?
        
        - A. $1$
        - B. $2$
        - C. $3$
        - D. $0$
      ],
      canvas(length: 0.8cm, {
        import draw: *
        line((-2.0, 0.0), (4.5, 0.0), mark: (end: ">"), stroke: 0.5pt)
        line((0.0, -3.5), (0.0, 2.0), mark: (end: ">"), stroke: 0.5pt)
        content((4.3, -0.3), $x$)
        content((-0.3, 1.8), $y$)
        bezier((-2.0, 2.25), (1.0, -3.0), (-1.5, 0.5), (0.0, -2.5), stroke: 1.2pt + rgb("#d97706"))
        bezier((1.0, -3.0), (4.0, 2.25), (2.0, -3.0), (3.5, 0.5), stroke: 1.2pt + rgb("#d97706"))
        line((1.0, 0.0), (1.0, -3.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        line((0.0, -3.0), (1.0, -3.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        content((-1.0, 0.3), $-1$)
        content((3.0, 0.3), $3$)
        content((1.0, 0.3), $1$)
        content((-0.4, -3.0), $-3$)
        content((-0.2, -0.2), $O$)
        content((3.5, 1.8), $y = f'(x)$)
      })
    )
  ],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$0$],
  ),
  loigiai: [
    Chọn *B*.
    - Số điểm cực trị của hàm số $y = f(x)$ tương ứng với số nghiệm đơn hoặc nghiệm bội lẻ của phương trình $f'(x) = 0$.
    - Quan sát đồ thị $y = f'(x)$, ta thấy đồ thị cắt trục hoành tại hai điểm phân biệt là $x = -1$ và $x = 3$. Tại cả hai điểm này, đồ thị đều đi xuyên qua trục hoành (đổi dấu từ dương sang âm và ngược lại).
    - Do đó, phương trình $f'(x) = 0$ có 2 nghiệm đơn, dẫn tới hàm số $y = f(x)$ có đúng 2 điểm cực trị.
  ],
)

#tn(
  [Cho hàm số $f(x)$ liên tục và nhận giá trị dương trên đoạn $[0; 1]$ thỏa mãn $f'(x) = 2 f(x)$ với mọi $x in [0; 1]$ và $f(0) = 1$. Gọi $F(x)$ là một nguyên hàm của $f(x)$ trên $RR$. Họ tất cả các nguyên hàm của hàm số $f(x)$ là:],
  (
    [$e^(2x) + C$],
    True([$frac(1, 2) e^(2x) + C$]),
    [$2 e^(2x) + C$],
    [$frac(1, 2) e^(2x) - frac(1, 2) + C$],
  ),
  loigiai: [
    Chọn *B*.
    - Từ phương trình $f'(x) = 2 f(x) => frac(f'(x), f(x)) = 2$ (vì $f(x) > 0$).
    - Lấy nguyên hàm hai vế theo $x$:
      $ integral frac(f'(x), f(x)) d x = integral 2 d x  =>  ln f(x) = 2x + C_0 $
    - Sử dụng điều kiện $f(0) = 1$:
      $ ln f(0) = 2(0) + C_0  =>  ln 1 = C_0  =>  C_0 = 0 $
    - Vậy $ln f(x) = 2x => f(x) = e^(2x)$.
    - Họ tất cả các nguyên hàm của $f(x) = e^(2x)$ là:
      $ integral f(x) d x = integral e^(2x) d x = frac(1, 2) e^(2x) + C $
  ],
)

#q-label("PHẦN II. Câu trắc nghiệm đúng sai", c-p0)

#ds(
  [Cho hàm số $f(x) = frac(4x^3 - 2x + 1, x^2)$ xác định trên khoảng $(0, +infinity)$. Gọi $F(x)$ là một nguyên hàm của $f(x)$ trên khoảng đó. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Hàm số $f(x)$ có thể viết dưới dạng $f(x) = 4x - frac(2, x) + x^(-2)$.]),
    True([Một nguyên hàm của hàm số $y = frac(1, x^2)$ là $y = frac(-1, x)$.]),
    True([Họ nguyên hàm của $f(x)$ là $F(x) = 2x^2 - 2 ln x - frac(1, x) + C$.]),
    True([Nếu $F(1) = 3$ thì hằng số $C = 2$.]),
  ),
  loigiai: [
    - a) *Đúng*. Thực hiện chia tử số cho mẫu số: $f(x) = frac(4x^3, x^2) - frac(2x, x^2) + frac(1, x^2) = 4x - frac(2, x) + x^(-2)$.
    - b) *Đúng*. Áp dụng lũy thừa với số mũ âm: $integral x^(-2) d x = frac(x^(-1), -1) + C = -frac(1, x) + C$.
    - c) *Đúng*.
      $
        integral f(x) d x = integral lr( 4x - frac(2, x) + frac(1, x^2) ) d x = 2x^2 - 2 ln|x| - frac(1, x) + C
      $
      Vì xét trên khoảng $(0, +infinity)$ nên $|x| = x$, do đó $F(x) = 2x^2 - 2 ln x - frac(1, x) + C$.
    - d) *Đúng*. Thế $x = 1$ vào $F(x)$:
      $
        F(1) = 2(1)^2 - 2 ln(1) - frac(1, 1) + C = 3 => 2 - 0 - 1 + C = 3 => 1 + C = 3 => C = 2.
      $
  ],
)

#ds(
  [Cho hai hàm số $f(x) = e^(2x + 1)$ và $g(x) = cos(3x - frac(pi, 2))$. Xét tính đúng sai của các khẳng định sau:],
  (
    [Nguyên hàm của $f(x)$ là $F(x) = e^(2x + 1) + C$.],
    True([Hàm số $g(x)$ có thể viết gọn lại thành $g(x) = sin(3x)$.]),
    True([Họ nguyên hàm của hàm số $y = f(x) + g(x)$ là $frac(1, 2) e^(2x + 1) - frac(1, 3) cos(3x) + C$.]),
    True([Hàm số $H(x) = frac(1, 2) e^(2x + 1) + frac(1, 3) sin lr( 3x - frac(pi, 2) ) + 5$ là một nguyên hàm của $f(x) + g(x)$.]),
  ),
  loigiai: [
    - a) *Sai*. Vì $integral e^(2x + 1) d x = frac(1, 2) e^(2x + 1) + C$.
    - b) *Đúng*. Theo công thức lượng giác: $cos(3x - frac(pi, 2)) = sin(3x)$.
    - c) *Đúng*. Ta có $integral g(x) d x = integral sin(3x) d x = -frac(1, 3) cos(3x) + C$. Do đó họ nguyên hàm của $f(x) + g(x)$ là $frac(1, 2) e^(2x + 1) - frac(1, 3) cos(3x) + C$.
    - d) *Đúng*. Ta có:
      $
        H'(x) = lr( frac(1, 2) e^(2x + 1) + frac(1, 3) sin(3x - frac(pi, 2)) + 5 )' = e^(2x + 1) + cos(3x - frac(pi, 2)) = f(x) + g(x).
      $
  ],
)

#ds(
  [Cho hàm số $f(x) = 3x^2 - m x + 2$ ($m$ là tham số thực). Gọi $F(x)$ là một nguyên hàm của $f(x)$ trên $RR$ thỏa mãn $F(0) = 1$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Với $m = 2$, họ nguyên hàm của $f(x)$ là $x^3 - x^2 + 2x + C$.]),
    True([Với $m = 6$, đồ thị hàm số $y = F(x)$ đi qua điểm $A(1; 1)$.]),
    True([Không tồn tại giá trị nào của $m$ để đồ thị hàm số $y = F(x)$ nhận điểm $I(1; 2)$ làm điểm cực tiểu.]),
    True([Đồ thị hàm số $y = F(x)$ cắt trục hoành tại ít nhất một điểm với mọi giá trị của $m$.]),
  ),
  loigiai: [
    - a) *Đúng*. Với $m = 2$, $f(x) = 3x^2 - 2x + 2$. Họ nguyên hàm của nó là $x^3 - x^2 + 2x + C$.
    - b) *Đúng*. Ta tìm công thức của $F(x)$:
      $
        F(x) = integral (3x^2 - m x + 2) d x = x^3 - frac(m, 2) x^2 + 2x + C_0
      $
      Vì $F(0) = 1$ nên $C_0 = 1$, do đó $F(x) = x^3 - frac(m, 2) x^2 + 2x + 1$.
      Với $m = 6$, $F(x) = x^3 - 3x^2 + 2x + 1$. Thế $x = 1$ ta được $F(1) = 1^3 - 3(1^2) + 2(1) + 1 = 1$, nên đồ thị đi qua $A(1; 1)$.
    - c) *Đúng*. Để điểm $I(1; 2)$ là điểm cực tiểu của đồ thị $y = F(x)$, trước hết hoành độ $x = 1$ phải là điểm cực trị, tức là:
      $
        F'(1) = 0  <=>  f(1) = 0  <=>  3(1^2) - m(1) + 2 = 0  <=>  5 - m = 0  <=>  m = 5
      $
      Đồng thời tọa độ cực tiểu phải thỏa mãn: $F(1) = 2$.
      Thế $m = 5, x = 1$ vào công thức $F(x) = x^3 - frac(5, 2) x^2 + 2x + 1$, ta được:
      $
        F(1) = 1 - 2.5 + 2 + 1 = 1.5 != 2
      $
      Do đó, không tồn tại giá trị $m$ nào thỏa mãn yêu cầu đề bài.
    - d) *Đúng*. Hàm số $F(x)$ là một đa thức bậc 3 có hệ số bậc cao nhất dương ($a = 1 > 0$), do đó:
      $
        lim_(x -> -infinity) F(x) = -infinity  wide  "và"  wide  lim_(x -> +infinity) F(x) = +infinity
      $
      Vì hàm số liên tục trên $RR$ và đổi dấu trên $( -infinity ; +infinity )$, nên phương trình $F(x) = 0$ luôn có ít nhất một nghiệm thực với mọi $m$, tương ứng đồ thị luôn cắt trục hoành tại ít nhất một điểm.
  ],
)

#ds(
  [Cho hàm số $f(x)$ xác định trên $RR setminus \{1\}$ thỏa mãn $f(x) = 2x$ khi $x > 1$ và $f(x) = 3x^2$ khi $x < 1$. Gọi $F(x)$ là một nguyên hàm của $f(x)$ trên $RR setminus \{1\}$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Trên khoảng $(1; +infinity)$, họ nguyên hàm của $f(x)$ là $x^2 + C_1$.]),
    True([Trên khoảng $(-infinity; 1)$, họ nguyên hàm của $f(x)$ là $x^3 + C_2$.]),
    True([Nếu $F(2) = 5$ và $F(0) = 2$ thì $C_1 = 1$ và $C_2 = 2$.]),
    True([Để $F(x)$ liên tục tại $x = 1$ (tạo thành một nguyên hàm liên tục trên toàn bộ $RR$), ta phải có $C_1 = C_2$.]),
  ),
  loigiai: [
    - a) *Đúng*. Trên $(1; +infinity)$, ta có $f(x) = 2x$, do đó nguyên hàm là $x^2 + C_1$.
    - b) *Đúng*. Trên $(-infinity; 1)$, ta có $f(x) = 3x^2$, do đó nguyên hàm là $x^3 + C_2$.
    - c) *Đúng*.
      Với $x = 2 > 1$: $F(2) = 2^2 + C_1 = 5 => C_1 = 1$.
      Với $x = 0 < 1$: $F(0) = 0^3 + C_2 = 2 => C_2 = 2$.
    - d) *Đúng*. Để $F(x)$ liên tục tại $x = 1$, giới hạn trái và giới hạn phải tại $x = 1$ phải bằng nhau:
      $
        lim_(x -> 1^+) F(x) = lim_(x -> 1^+) (x^2 + C_1) = 1 + C_1 \
        lim_(x -> 1^-) F(x) = lim_(x -> 1^-) (x^3 + C_2) = 1 + C_2
      $
      Để chúng bằng nhau ta cần: $1 + C_1 = 1 + C_2 <=> C_1 = C_2$.
  ],
)

#ds(
  [Cho hàm số $f(x) = frac(1, x^2 - 1)$ xác định trên tập xác định $D$. Gọi $F(x)$ là một nguyên hàm của $f(x)$ trên $D$ thỏa mãn $F(0) = 1$ và $F(2) = ln(sqrt(3))$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Tập xác định của hàm số $f(x)$ là $D = RR setminus \{+-1\}$.]),
    True([Họ nguyên hàm của $f(x)$ trên từng khoảng xác định có dạng $F(x) = frac(1, 2) ln |frac(x - 1, x + 1)| + C$.]),
    True([Từ điều kiện $F(0) = 1$, ta có hằng số tích phân trên khoảng $(-1; 1)$ là $C_1 = 1$.]),
    True([Từ điều kiện $F(2) = ln(sqrt(3))$, ta có hằng số tích phân trên khoảng $(1; +infinity)$ là $C_2 = ln 3$.]),
  ),
  loigiai: [
    - a) *Đúng*. Hàm số xác định khi mẫu số khác 0: $x^2 - 1 != 0 <=> x != +-1$. Vậy $D = RR setminus \{+-1\}$.
    - b) *Đúng*. Áp dụng phân tích phân thức:
      $
        f(x) = frac(1, (x-1)(x+1)) = frac(1, 2) lr( frac(1, x-1) - frac(1, x+1) )
      $
      Do đó:
      $
        integral f(x) d x = frac(1, 2) ( ln|x - 1| - ln|x + 1| ) + C = frac(1, 2) ln |frac(x - 1, x + 1)| + C
      $
    - c) *Đúng*. Trên khoảng $(-1; 1)$, ta có:
      $
        F(x) = frac(1, 2) ln |frac(x - 1, x + 1)| + C_1
      $
      Tại $x = 0$ (thuộc khoảng $(-1; 1)$):
      $
        F(0) = frac(1, 2) ln |frac(0-1, 0+1)| + C_1 = frac(1, 2) ln(1) + C_1 = C_1
      $
      Vì $F(0) = 1$ nên $C_1 = 1$.
    - d) *Đúng*. Trên khoảng $(1; +infinity)$, ta có:
      $
        F(x) = frac(1, 2) ln |frac(x - 1, x + 1)| + C_2 = frac(1, 2) ln lr( frac(x - 1, x + 1) ) + C_2
      $
      Tại $x = 2$ (thuộc khoảng $(1; +infinity)$):
      $
        F(2) = frac(1, 2) ln lr( frac(2 - 1, 2 + 1) ) + C_2 = frac(1, 2) ln lr( frac(1, 3) ) + C_2 = -frac(1, 2) ln 3 + C_2
      $
      Vì $F(2) = ln(sqrt(3)) = frac(1, 2) ln 3$, nên ta có phương trình:
      $
        -frac(1, 2) ln 3 + C_2 = frac(1, 2) ln 3  =>  C_2 = ln 3
      $
  ],
)

#q-label("PHẦN III. Câu trắc nghiệm trả lời ngắn", c-p0)

#tln(
  [Cho hàm số $f(x)$ thỏa mãn $f'(x) = frac(x^2 - 1, x^2)$ trên khoảng $(0, +infinity)$ và $f(1) = 2$. Tìm giá trị của $f(2)$ (làm tròn kết quả đến hàng phần mười).],
  [2.5],
  loigiai: [
    Ta có:
    $
      f'(x) = 1 - frac(1, x^2) = 1 - x^(-2)
    $
    Nguyên hàm của $f'(x)$ trên khoảng $(0, +infinity)$ là:
    $
      f(x) = integral lr( 1 - frac(1, x^2) ) d x = x + frac(1, x) + C
    $
    Vì $f(1) = 2$ nên:
    $
      1 + frac(1, 1) + C = 2  =>  2 + C = 2  =>  C = 0
    $
    Vậy $f(x) = x + frac(1, x)$.
    Tại $x = 2$, ta có:
    $
      f(2) = 2 + frac(1, 2) = 2.5
    $
  ],
)

#tln(
  [Biết rằng hàm số $F(x) = a x^3 + b x^2 + c x$ là một nguyên hàm của hàm số $f(x) = 6x^2 - 4x + 3$ trên $RR$. Tính tổng $S = a + b + c$.],
  [3],
  loigiai: [
    Vì $F(x)$ là nguyên hàm của $f(x)$ nên $F'(x) = f(x)$.
    Ta tính đạo hàm của $F(x)$:
    $
      F'(x) = 3a x^2 + 2b x + c
    $
    Đồng nhất hệ số với $f(x) = 6x^2 - 4x + 3$, ta có:
    $
      3a = 6  =>  a = 2 \
      2b = -4  =>  b = -2 \
      c = 3
    $
    Tổng $S = a + b + c = 2 + (-2) + 3 = 3$.
  ],
)

#tln(
  [Tìm hằng số dương $a$ sao cho hàm số $F(x) = frac(1, a) e^(a x)$ là một nguyên hàm của hàm số $f(x) = e^(2x)$ trên $RR$.],
  [2],
  loigiai: [
    Vì $F(x)$ là một nguyên hàm của $f(x) = e^(2x)$ nên ta có:
    $
      F'(x) = f(x)  <=>  lr( frac(1, a) e^(a x) )' = e^(2x)  <=>  e^(a x) = e^(2x)
    $
    Đồng nhất số mũ ta thu được $a = 2$.
  ],
)

#tln(
  [Cho $F(x)$ là một nguyên hàm của hàm số $f(x) = 4x^3 - 3x^2 + 2x$ trên $RR$. Biết đồ thị của $y = F(x)$ cắt trục tung tại điểm có tung độ bằng $3$ và đi qua điểm $A(1; a)$. Tính giá trị của $a$.],
  [4],
  loigiai: [
    Ta có $F(x) = integral (4x^3 - 3x^2 + 2x) d x = x^4 - x^3 + x^2 + C$.
    Vì đồ thị cắt trục tung tại điểm có tung độ bằng 3 nên $F(0) = 3 => C = 3$.
    Do đó $F(x) = x^4 - x^3 + x^2 + 3$.
    Đồ thị đi qua điểm $A(1; a)$ nên $F(1) = a => 1^4 - 1^3 + 1^2 + 3 = a => a = 4$.
  ],
)

#tln(
  [Cho hàm số $F(x) = a e^x + b x + c$ là một nguyên hàm của hàm số $f(x) = 2e^x - 3$ trên $RR$. Biết rằng đồ thị hàm số $y = F(x)$ đi qua gốc tọa độ $O(0; 0)$ và điểm cực trị của nó có hoành độ là $x_0 = ln(1.5)$. Tìm giá trị của hằng số $c$.],
  [-2],
  loigiai: [
    Ta có $F'(x) = a e^x + b$.
    Đồng nhất với $f(x) = 2e^x - 3$, ta có $a = 2, b = -3$.
    Do đó $F(x) = 2e^x - 3x + c$.
    Đồ thị đi qua gốc tọa độ $O(0; 0)$ nên $F(0) = 0 => 2e^0 - 3(0) + c = 0 => 2 + c = 0 => c = -2$.
  ],
)

#tln(
  [Cho hàm số $f(x) = 3x^2 + 2m x + 1$. Gọi $F(x)$ là một nguyên hàm của $f(x)$ trên $RR$ thỏa mãn $F(0) = 2$ và $F(2) = 16$. Tìm giá trị của tham số $m$.],
  [1],
  loigiai: [
    Họ nguyên hàm của $f(x)$ là $F(x) = x^3 + m x^2 + x + C$.
    Vì $F(0) = 2 => C = 2$.
    Do đó $F(x) = x^3 + m x^2 + x + 2$.
    Vì $F(2) = 16$ nên ta có:
    $
      2^3 + m(2^2) + 2 + 2 = 16  <=>  8 + 4m + 4 = 16  <=>  4m + 12 = 16  <=>  4m = 4  <=>  m = 1
    $
    Vậy $m = 1$.
  ],
)

#tln(
  [Cho hàm số $f(x) = { x - 1 wide "nếu " x >= 2 \ 2x - 3 wide "nếu " x < 2 }$. Gọi $F(x)$ là một nguyên hàm liên tục của $f(x)$ trên $RR$ thỏa mãn $F(1) = -1$. Tính giá trị của $F(3)$ (làm tròn kết quả đến hàng phần mười).],
  [0.5],
  loigiai: [
    - Họ nguyên hàm trên mỗi khoảng là:
      - Với $x > 2$: $F(x) = integral (x - 1) d x = frac(x^2, 2) - x + C_1$.
      - Với $x < 2$: $F(x) = integral (2x - 3) d x = x^2 - 3x + C_2$.
    - Vì $F(1) = -1$ và $1 < 2$, ta có:
      $ 1^2 - 3(1) + C_2 = -1  =>  -2 + C_2 = -1  =>  C_2 = 1 $
    - Để hàm số $F(x)$ liên tục tại $x = 2$, ta cần:
      $ lim_(x -> 2^+) F(x) = lim_(x -> 2^-) F(x) $
      $ <=> frac(2^2, 2) - 2 + C_1 = 2^2 - 3(2) + C_2 $
      $ <=> 0 + C_1 = -2 + 1  =>  C_1 = -1 $
    - Do đó, với $x >= 2$, ta có $F(x) = frac(x^2, 2) - x - 1$.
    - Tại $x = 3$, ta tính được:
      $ F(3) = frac(3^2, 2) - 3 - 1 = 4.5 - 4 = 0.5 $
  ],
)

#tln(
  [Cho hàm số $y = f(x)$ xác định trên $RR$. Đồ thị của một nguyên hàm $F(x)$ của $f(x)$ là một parabol đi qua gốc tọa độ $O(0; 0)$ và có đỉnh là $I(2; -4)$. Tính giá trị của $f(5)$.],
  [6],
  loigiai: [
    - Do đồ thị hàm số nguyên hàm $F(x)$ là parabol có đỉnh là $I(2; -4)$, ta có dạng:
      $ F(x) = a(x - 2)^2 - 4 $
    - Vì parabol đi qua gốc tọa độ $O(0; 0)$ nên:
      $ F(0) = 0  =>  a(0 - 2)^2 - 4 = 0  <=>  4a = 4  =>  a = 1 $
    - Do đó, ta có công thức của $F(x)$:
      $ F(x) = (x - 2)^2 - 4 = x^2 - 4x $
    - Đạo hàm của $F(x)$ chính là hàm số $f(x)$:
      $ f(x) = F'(x) = 2x - 4 $
    - Tại $x = 5$, ta có:
      $ f(5) = 2(5) - 4 = 6 $
  ],
)

#tln(
  [Cho hàm số $f(x) = frac(1, x^2 - 4)$ xác định trên tập $D = RR setminus \{+-2\}$. Gọi $F(x)$ là một nguyên hàm của $f(x)$ thỏa mãn $F(-3) = frac(1, 4) ln 5$, $F(0) = 0$, và $F(3) = 2 - frac(1, 4) ln 5$. Tính giá trị của biểu thức $K = 4 F(-1) + e^(4 F(3) - 8)$ (làm tròn kết quả đến hàng phần mười).],
  [1.3],
  loigiai: [
    - Phân tích phân thức dưới dấu nguyên hàm:
      $ f(x) = frac(1, (x-2)(x+2)) = frac(1, 4) lr( frac(1, x-2) - frac(1, x+2) ) $
    - Họ nguyên hàm trên từng khoảng xác định là:
      $ F(x) = frac(1, 4) ln | frac(x-2, x+2) | + C $
    - Với $x = -1$ (nằm trong khoảng $(-2; 2)$), ta sử dụng điều kiện $F(0) = 0$:
      $ F(0) = frac(1, 4) ln | frac(0-2, 0+2) | + C_2 = frac(1, 4) ln(1) + C_2 = C_2  =>  C_2 = 0 $
      $ F(-1) = frac(1, 4) ln | frac{-1-2, -1+2) | + 0 = frac(1, 4) ln 3 $
      $ => 4 F(-1) = ln 3 $
    - Với $x = 3$ (nằm trong khoảng $(2; +infinity)$), điều kiện đã cho là:
      $ F(3) = 2 - frac(1, 4) ln 5  =>  4 F(3) = 8 - ln 5  =>  4 F(3) - 8 = -ln 5 $
    - Thế các giá trị vào biểu thức $K$:
      $ K = ln 3 + e^(-ln 5) = ln 3 + frac(1, 5) = ln 3 + 0.2 approx 1.0986 + 0.2 = 1.2986 $
    - Làm tròn đến hàng phần mười, ta được $1.3$.
  ],
)
