#import "../_config.typ": *

#chapter([Tích phân cơ bản và các tính chất], theme-color: c-p0)

#phuongphap(theme-color: c-p0)[
  *1. Định nghĩa Tích phân (Công thức Newton-Leibniz):*
  Cho hàm số $f(x)$ liên tục trên đoạn $[a, b]$. Giả sử $F(x)$ là một nguyên hàm của $f(x)$ trên $[a, b]$. Hiệu số $F(b) - F(a)$ được gọi là *tích phân* của hàm số $f(x)$ từ $a$ đến $b$.
  Kí hiệu:
  $
    integral_a^b f(x) d x = [ F(x) ]_a^b = F(b) - F(a)
  $
  *Ý nghĩa hình học:* Nếu hàm số $f(x)$ liên tục và không âm trên đoạn $[a, b]$, thì tích phân $integral_a^b f(x) d x$ biểu thị diện tích $S$ của hình thang cong giới hạn bởi đồ thị $y = f(x)$, trục hoành $y = 0$, và hai đường thẳng $x = a, x = b$.

  *2. Các tính chất cốt lõi của Tích phân:*
  - Cận trùng nhau: $integral_a^a f(x) d x = 0$.
  - Đổi cận: $integral_a^b f(x) d x = - integral_b^a f(x) d x$.
  - Tính chất tuyến tính:
    $
      integral_a^b k f(x) d x = k integral_a^b f(x) d x  wide  (k " là hằng số")
    $
    $
      integral_a^b [f(x) +- g(x)] d x = integral_a^b f(x) d x +- integral_a^b g(x) d x
    $
  - Cộng khoảng (hệ thức Chasles): Với mọi $c$ thuộc đoạn $[a, b]$, ta có:
    $
      integral_a^b f(x) d x = integral_a^c f(x) d x + integral_c^b f(x) d x
    $
]

#topic([Các dạng toán tích phân thuần túy], prefix: "Chủ đề", theme-color: c-p0)

#dang([Tính tích phân bằng công thức trực tiếp], theme-color: c-p0)

#vd(
  [Tính tích phân $I = integral_1^2 (3x^2 - 2x + 4) d x$.],
  loigiai: [
    Tìm một nguyên hàm của hàm số $f(x) = 3x^2 - 2x + 4$ là $F(x) = x^3 - x^2 + 4x$.
    Áp dụng công thức Newton-Leibniz:
    $
      I = [ x^3 - x^2 + 4x ]_1^2 = lr( 2^3 - 2^2 + 4.2 ) - lr( 1^3 - 1^2 + 4.1 )
    $
    Tính các biểu thức trị số cận trên và cận dưới:
    - Tại cận trên $x = 2$: $2^3 - 2^2 + 8 = 8 - 4 + 8 = 12$.
    - Tại cận dưới $x = 1$: $1^3 - 1^2 + 4 = 1 - 1 + 4 = 4$.
    Do đó:
    $
      I = 12 - 4 = 8
    $
    Vậy tích phân cần tìm bằng $8$.
  ],
  theme-color: c-p0,
)

#vd(
  [Tính tích phân $J = integral_0^1 (e^(2x) - e^x) d x$.],
  loigiai: [
    Ta tìm họ nguyên hàm của $f(x) = e^(2x) - e^x$ là $F(x) = frac(1, 2) e^(2x) - e^x$.
    Áp dụng công thức Newton-Leibniz thế cận từ $0$ đến $1$:
    $
      J = lr[ frac(1, 2) e^(2x) - e^x ]_0^1 = lr( frac(1, 2) e^2 - e ) - lr( frac(1, 2) e^0 - e^0 )
    $
    $
      J = frac(e^2, 2) - e - lr( frac(1, 2) - 1 ) = frac(e^2, 2) - e + frac(1, 2) = frac(e^2 - 2e + 1, 2) = frac((e-1)^2, 2)
    $
    Vậy $J = frac((e-1)^2, 2)$.
  ],
  theme-color: c-p0,
)

#dang([Áp dụng tính chất tích phân để giải toán hàm ẩn], theme-color: c-p0)

#vd(
  [Cho biết $integral_1^3 f(x) d x = 5$ và $integral_3^4 f(x) d x = -2$. Tính tích phân $K = integral_1^4 [2 f(x) + 3x^2] d x$.],
  loigiai: [
    Áp dụng tính chất tuyến tính của tích phân:
    $
      K = integral_1^4 2 f(x) d x + integral_1^4 3x^2 d x = 2 integral_1^4 f(x) d x + integral_1^4 3x^2 d x
    $
    Áp dụng tính chất cộng khoảng của tích phân để tính $integral_1^4 f(x) d x$:
    $
      integral_1^4 f(x) d x = integral_1^3 f(x) d x + integral_3^4 f(x) d x = 5 + (-2) = 3
    $
    Tính tích phân của hàm lũy thừa:
    $
      integral_1^4 3x^2 d x = [ x^3 ]_1^4 = 4^3 - 1^3 = 64 - 1 = 63
    $
    Thay các kết quả vừa tính vào biểu thức $K$:
    $
      K = 2 dot 3 + 63 = 6 + 63 = 69
    $
    Vậy tích phân $K = 69$.
  ],
  theme-color: c-p0,
)

#dang([Tích phân của hàm số chứa dấu giá trị tuyệt đối], theme-color: c-p0)

#vd(
  [Tính tích phân $L = integral_0^3 |x - 2| d x$.],
  loigiai: [
    Để tính tích phân chứa dấu giá trị tuyệt đối, ta cần khử dấu giá trị tuyệt đối bằng cách chia đoạn tích phân $[0, 3]$ dựa trên điểm làm biểu thức đổi dấu, đó là $x = 2$.
    - Trên đoạn $[0, 2]$, ta có $x - 2 <= 0$ nên $|x - 2| = -(x - 2) = 2 - x$.
    - Trên đoạn $[2, 3]$, ta có $x - 2 >= 0$ nên $|x - 2| = x - 2$.
    Áp dụng tính chất cộng khoảng của tích phân:
    $
      L = integral_0^2 |x - 2| d x + integral_2^3 |x - 2| d x = integral_0^2 (2 - x) d x + integral_2^3 (x - 2) d x
    $
    Tính từng tích phân đơn lẻ:
    $
      integral_0^2 (2 - x) d x = lr[ 2x - frac(x^2, 2) ]_0^2 = lr( 2(2) - frac(2^2, 2) ) - 0 = 4 - 2 = 2
    $
    $
      integral_2^3 (x - 2) d x = lr[ frac(x^2, 2) - 2x ]_2^3 = lr( frac(3^2, 2) - 2(3) ) - lr( frac(2^2, 2) - 2(2) )
    $
    $
      = lr( frac(9, 2) - 6 ) - lr( 2 - 4 ) = -frac(3, 2) - (-2) = -1.5 + 2 = 0.5
    $
    Cộng hai kết quả lại:
    $
      L = 2 + 0.5 = 2.5 = frac(5, 2)
    $
    Vậy tích phân $L = 2.5$.
  ],
  theme-color: c-p0,
)

#dang([Tính tích phân dựa vào hình vẽ và đồ thị], theme-color: c-p0)

#vd(
  [
    #grid(
      columns: (1.3fr, 1fr),
      column-gutter: 12pt,
      [
        Cho hàm số $y = f(x)$ liên tục trên đoạn $[-2; 3]$ và có đồ thị gồm một cung parabol và một đoạn thẳng như hình vẽ bên. Gọi $S_1$ và $S_2$ là diện tích của các phần hình phẳng giới hạn bởi đồ thị và trục hoành trên các đoạn $[-2; 1]$ và $[1; 3]$.
        - a) Biết parabol có đỉnh $I(-1; 4)$ và đi qua các điểm $(-2; 3)$, $(1; 0)$. Tìm công thức của hàm số $y = f(x)$ trên đoạn $[-2; 1]$.
        - b) Tính diện tích $S_1$ và tích phân $K = integral_(-2)^3 f(x) d x$.
      ],
      canvas(length: 0.7cm, {
        import draw: *
        // Draw coordinate system
        line((-3.0, 0.0), (4.0, 0.0), mark: (end: ">"), stroke: 0.5pt)
        line((0.0, -2.5), (0.0, 5.0), mark: (end: ">"), stroke: 0.5pt)
        content((3.8, -0.3), $x$)
        content((-0.3, 4.8), $y$)
        
        // Parabola from x = -2 to x = 1 (vertex at -1, 4; passing through -2, 3 and 1, 0)
        // y = -(x+1)^2 + 4 = -x^2 - 2x + 3
        bezier((-2.0, 3.0), (-1.0, 4.0), (-1.8, 3.8), (-1.2, 4.0), stroke: 1.2pt + rgb("#0284c7"))
        bezier((-1.0, 4.0), (1.0, 0.0), (-0.5, 4.0), (0.5, 1.0), stroke: 1.2pt + rgb("#0284c7"))
        
        // Line segment from (1, 0) to (3, -2)
        line((1.0, 0.0), (3.0, -2.0), stroke: 1.2pt + rgb("#0284c7"))
        
        // Dashed lines for vertex I(-1, 4)
        line((-1.0, 0.0), (-1.0, 4.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        line((0.0, 4.0), (-1.0, 4.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        
        // Dashed lines for point (3, -2)
        line((3.0, 0.0), (3.0, -2.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        line((0.0, -2.0), (3.0, -2.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        
        // Labels
        content((-1.0, -0.3), $-1$)
        content((1.0, 0.3), $1$)
        content((3.0, 0.3), $3$)
        content((-0.3, 4.0), $4$)
        content((-0.4, -2.0), $-2$)
        content((-0.2, -0.2), $O$)
        content((-1.0, 2.0), $S_1$)
        content((2.0, -0.6), $S_2$)
      })
    )
  ],
  loigiai: [
    *a) Tìm công thức hàm số trên đoạn $[-2; 1]$:*
    - Giả sử parabol có công thức $y = a(x + 1)^2 + 4$ (do có đỉnh là $I(-1; 4)$).
    - Vì parabol đi qua điểm $(1; 0)$ nên:
      $ a(1 + 1)^2 + 4 = 0  <=>  4a = -4  =>  a = -1 $
    - Vậy công thức của hàm số trên $[-2; 1]$ là:
      $ f(x) = -(x + 1)^2 + 4 = -x^2 - 2x + 3 $

    *b) Tính diện tích $S_1$ và tích phân $K$:*
    - Vì đồ thị $y = f(x)$ nằm phía trên trục hoành trên đoạn $[-2; 1]$ nên diện tích $S_1$ được tính bằng tích phân:
      $ S_1 = integral_(-2)^1 f(x) d x = integral_(-2)^1 (-x^2 - 2x + 3) d x $
      $ S_1 = lr[ -frac(x^3, 3) - x^2 + 3x ]_(-2)^1 $
      - Thế cận trên $x = 1$: $F(1) = -frac(1, 3) - 1 + 3 = frac(5, 3)$.
      - Thế cận dưới $x = -2$: $F(-2) = -frac((-2)^3, 3) - (-2)^2 + 3(-2) = frac(8, 3) - 4 - 6 = -frac(22, 3)$.
      - Suy ra $S_1 = F(1) - F(-2) = frac(5, 3) - lr( -frac(22, 3) ) = 9$.
    - Trên đoạn $[1; 3]$, đồ thị là đoạn thẳng nối từ $(1; 0)$ đến $(3; -2)$. Đoạn thẳng này nằm phía dưới trục hoành, tạo thành một tam giác vuông có hai cạnh góc vuông có độ dài là $3 - 1 = 2$ và $|-2| = 2$.
    - Diện tích tam giác vuông này là:
      $ S_2 = frac(1, 2) dot 2 dot 2 = 2 $
    - Do đồ thị nằm phía dưới trục hoành trên $[1; 3]$ nên tích phân trên đoạn này có giá trị âm:
      $ integral_1^3 f(x) d x = -S_2 = -2 $
    - Áp dụng tính chất cộng khoảng của tích phân, ta có:
      $ K = integral_(-2)^3 f(x) d x = integral_(-2)^1 f(x) d x + integral_1^3 f(x) d x = S_1 + (-S_2) = 9 - 2 = 7 $
    Vậy diện tích $S_1 = 9$ và tích phân $K = 7$.
  ],
  theme-color: c-p0,
)

#vd(
  [
    #grid(
      columns: (1.3fr, 1.5fr),
      column-gutter: 12pt,
      [
        Cho hàm số $y = f(x)$ liên tục trên đoạn $[-2; 4]$ có đồ thị gồm một nửa đường tròn bán kính $R = 2$ nằm phía trên trục hoành (trên đoạn $[-2; 2]$) và một đoạn thẳng nối từ $(2; 0)$ đến $(4; -2)$ như hình vẽ bên.
        Tính tích phân $J = integral_(-2)^4 f(x) d x$.
      ],
      canvas(length: 0.7cm, {
        import draw: *
        // Draw coordinate system
        line((-3.5, 0.0), (5.5, 0.0), mark: (end: ">"), stroke: 0.5pt)
        line((0.0, -3.0), (0.0, 3.0), mark: (end: ">"), stroke: 0.5pt)
        content((5.3, -0.3), $x$)
        content((-0.3, 2.8), $y$)
        
        // Semicircle above x-axis on [-2, 2]
        arc((0.0, 0.0), start: 180deg, stop: 0deg, radius: 2.0, stroke: 1.2pt + rgb("#0284c7"))
        
        // Line segment from (2, 0) to (4,-2)
        line((2.0, 0.0), (4.0, -2.0), stroke: 1.2pt + rgb("#0284c7"))
        
        // Dashed lines for point (4, -2)
        line((4.0, 0.0), (4.0, -2.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        line((0.0, -2.0), (4.0, -2.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        
        // Labels
        content((-2.0, -0.3), $-2$)
        content((2.0, 0.3), $2$)
        content((4.0, 0.3), $4$)
        content((-0.3, -2.0), $-2$)
        content((-0.2, -0.2), $O$)
        content((0.0, 1.0), $S_1$)
        content((3.0, -0.6), $S_2$)
      })
    )
  ],
  loigiai: [
    - Ta chia tích phân $J$ thành hai tích phân thành phần tương ứng với các đoạn $[-2; 2]$ và $[2; 4]$:
      $ J = integral_(-2)^4 f(x) d x = integral_(-2)^2 f(x) d x + integral_2^4 f(x) d x $
    - Trên đoạn $[-2; 2]$, đồ thị hàm số là một nửa đường tròn bán kính $R = 2$ nằm hoàn toàn phía trên trục hoành.
      Diện tích của nửa hình tròn này là:
      $ S_1 = frac(1, 2) pi R^2 = frac(1, 2) pi dot 2^2 = 2pi $
      Do đồ thị nằm trên trục hoành nên:
      $ integral_(-2)^2 f(x) d x = S_1 = 2pi $
    - Trên đoạn $[2; 4]$, đồ thị hàm số là đoạn thẳng nằm hoàn toàn phía dưới trục hoành.
      Phần hình phẳng được giới hạn bởi đồ thị này, trục hoành và đường thẳng $x = 4$ tạo thành một tam giác vuông cân có hai cạnh góc vuông dài $4 - 2 = 2$ và $|-2| = 2$.
      Diện tích tam giác này là:
      $ S_2 = frac(1, 2) dot 2 dot 2 = 2 $
      Do đồ thị nằm phía dưới trục hoành nên:
      $ integral_2^4 f(x) d x = -S_2 = -2 $
    - Vậy tích phân cần tính là:
      $ J = 2pi - 2 $
  ],
  theme-color: c-p0,
)

#dang([Tích phân của hàm số cho bởi nhiều công thức (phân nhánh)], theme-color: c-p0)

#vd(
  [Cho hàm số $f(x)$ liên tục trên $RR$ và có công thức phân nhánh như sau:
  $ f(x) = {
    3x^2 - 2x + 1 wide "nếu " x >= 1 \
    2^x + a       wide "nếu " x < 1
  } $
  - a) Tìm giá trị của hằng số $a$ để hàm số liên tục trên $RR$.
  - b) Với giá trị $a$ vừa tìm được, hãy tính tích phân $I = integral_0^2 f(x) d x$.],
  loigiai: [
    *a) Tìm hằng số $a$:*
    - Hàm số liên tục trên các khoảng $(-infinity; 1)$ và $(1; +infinity)$.
    - Để hàm số liên tục trên $RR$, nó phải liên tục tại điểm phân nhánh $x = 1$. Điều kiện là:
      $ lim_(x -> 1^+) f(x) = lim_(x -> 1^-) f(x) = f(1) $
    - Ta có:
      - $lim_(x -> 1^+) f(x) = lim_(x -> 1^+) (3x^2 - 2x + 1) = 3(1)^2 - 2(1) + 1 = 2$.
      - $lim_(x -> 1^-) f(x) = lim_(x -> 1^-) (2^x + a) = 2^1 + a = 2 + a$.
      - $f(1) = 2$.
    - Do đó:
      $ 2 + a = 2  =>  a = 0 $
    - Vậy giá trị cần tìm là $a = 0$.

    *b) Tính tích phân $I = integral_0^2 f(x) d x$:*
    - Với $a = 0$, ta có:
      $ f(x) = {
        3x^2 - 2x + 1 wide "nếu " x >= 1 \
        2^x           wide "nếu " x < 1
      } $
    - Chia đoạn tích phân $[0; 2]$ tại điểm phân nhánh $x = 1$:
      $ I = integral_0^1 f(x) d x + integral_1^2 f(x) d x = integral_0^1 2^x d x + integral_1^2 (3x^2 - 2x + 1) d x $
    - Tính từng tích phân thành phần:
      - Tích phân thứ nhất:
        $ I_1 = integral_0^1 2^x d x = lr[ frac(2^x, ln 2) ]_0^1 = frac(2^1, ln 2) - frac(2^0, ln 2) = frac(1, ln 2) $
      - Tích phân thứ hai:
        $ I_2 = integral_1^2 (3x^2 - 2x + 1) d x = lr[ x^3 - x^2 + x ]_1^2 $
        $ = (2^3 - 2^2 + 2) - (1^3 - 1^2 + 1) = (8 - 4 + 2) - 1 = 6 - 1 = 5 $
    - Cộng hai kết quả lại:
      $ I = I_1 + I_2 = frac(1, ln 2) + 5 $
    Vậy $I = frac(1, ln 2) + 5$.
  ],
  theme-color: c-p0,
)

#vd(
  [Tính tích phân $K = integral_0^3 |x^2 - 3x + 2| d x$.],
  loigiai: [
    - Xét tam thức bậc hai $g(x) = x^2 - 3x + 2$. Ta giải phương trình:
      $ x^2 - 3x + 2 = 0  <=>  [ x = 1 ; x = 2 ] $
      Cả hai nghiệm này đều thuộc đoạn lấy tích phân $[0; 3]$.
    - Ta xét dấu của $g(x)$ trên đoạn $[0; 3]$:
      - Với $x in [0; 1]$: $g(x) >= 0$ nên $|x^2 - 3x + 2| = x^2 - 3x + 2$.
      - Với $x in [1; 2]$: $g(x) <= 0$ nên $|x^2 - 3x + 2| = -(x^2 - 3x + 2)$.
      - Với $x in [2; 3]$: $g(x) >= 0$ nên $|x^2 - 3x + 2| = x^2 - 3x + 2$.
    - Do đó, ta tách tích phân $K$ thành ba tích phân thành phần:
      $ K = integral_0^1 (x^2 - 3x + 2) d x - integral_1^2 (x^2 - 3x + 2) d x + integral_2^3 (x^2 - 3x + 2) d x $
    - Tìm một nguyên hàm của hàm số $y = x^2 - 3x + 2$:
      $ F(x) = frac(x^3, 3) - frac(3x^2, 2) + 2x $
    - Tính giá trị của $F(x)$ tại các điểm cận:
      - $F(0) = 0$.
      - $F(1) = frac(1, 3) - frac(3, 2) + 2 = frac(5, 6)$.
      - $F(2) = frac(8, 3) - 6 + 4 = frac(2, 3)$.
      - $F(3) = 9 - frac(27, 2) + 6 = frac(3, 2)$.
    - Tính từng tích phân thành phần:
      - $K_1 = integral_0^1 (x^2 - 3x + 2) d x = F(1) - F(0) = frac(5, 6)$.
      - $K_2 = integral_1^2 (x^2 - 3x + 2) d x = F(2) - F(1) = frac(2, 3) - frac(5, 6) = -frac(1, 6)$.
      - $K_3 = integral_2^3 (x^2 - 3x + 2) d x = F(3) - F(2) = frac(3, 2) - frac(2, 3) = frac(5, 6)$.
    - Vậy tích phân $K$ bằng:
      $ K = K_1 - K_2 + K_3 = frac(5, 6) - lr( -frac(1, 6) ) + frac(5, 6) = frac(11, 6) $
  ],
  theme-color: c-p0,
)

#dang([Bài toán tìm tham số tối ưu hoặc liên hệ tham số của tích phân], theme-color: c-p0)

#vd(
  [Cho tích phân $I(a) = integral_1^a (frac(3, x^3) - frac(2, x^2)) d x$ với $a > 1$ là tham số thực.
  - a) Tính tích phân $I(a)$ theo biến $a$.
  - b) Tìm giá trị của $a$ để tích phân $I(a)$ đạt giá trị lớn nhất.],
  loigiai: [
    *a) Tính tích phân $I(a)$:*
    - Ta viết lại các biểu thức dưới dạng lũy thừa:
      $ frac(3, x^3) - frac(2, x^2) = 3 x^(-3) - 2 x^(-2) $
    - Một nguyên hàm của hàm số này là:
      $ F(x) = 3 dot frac(x^(-2), -2) - 2 dot frac(x^(-1), -1) = -frac(3, 2x^2) + frac(2, x) $
    - Áp dụng công thức Newton-Leibniz:
      $ I(a) = F(a) - F(1) = lr( -frac(3, 2a^2) + frac(2, a) ) - lr( -frac(3, 2) + 2 ) $
      $ I(a) = -frac(3, 2a^2) + frac(2, a) - frac(1, 2) $

    *b) Tìm giá trị của $a > 1$ để $I(a)$ lớn nhất:*
    - Xét hàm số $f(a) = -frac(3, 2a^2) + frac(2, a) - frac(1, 2)$ trên khoảng $(1; +infinity)$.
    - Đạo hàm của hàm số theo $a$:
      $ f'(a) = -frac(3, 2) dot lr( -frac(2, a^3) ) - frac(2, a^2) = frac(3, a^3) - frac(2, a^2) = frac(3 - 2a, a^3) $
    - Giải phương trình $f'(a) = 0$:
      $ 3 - 2a = 0  <=>  a = frac(3, 2) = 1.5   wide " (nhận vì " 1.5 > 1) $
    - Xét dấu của $f'(a)$ trên khoảng $(1; +infinity)$:
      - Với $1 < a < frac(3, 2)$: $f'(a) > 0$ nên hàm số đồng biến.
      - Với $a > frac(3, 2)$: $f'(a) < 0$ nên hàm số nghịch biến.
    - Do đó, bảng biến thiên của hàm số $f(a)$ đạt điểm cực đại tại $a = 1.5$.
    - Vậy tích phân $I(a)$ đạt giá trị lớn nhất khi $a = 1.5$.
  ],
  theme-color: c-p0,
)

#bt-header(c-p0)

#q-label("PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn", c-p0)

#resetexamstate()

#tn(
  [Cho hàm số $f(x)$ liên tục trên đoạn $[a, b]$ và có một nguyên hàm là $F(x)$. Công thức nào sau đây đúng?],
  (
    [$integral_a^b f(x) d x = F(a) - F(b)$],
    True([$integral_a^b f(x) d x = F(b) - F(a)$]),
    [$integral_a^b f(x) d x = F'(b) - F'(a)$],
    [$integral_a^b f(x) d x = F(b) + F(a)$],
  ),
  loigiai: [
    Chọn *B*.
    Theo định nghĩa tích phân (Công thức Newton-Leibniz), ta có $integral_a^b f(x) d x = F(b) - F(a)$.
  ],
)

#tn(
  [Nếu $integral_1^2 f(x) d x = -3$ và $integral_1^2 g(x) d x = 5$ thì tích phân $integral_1^2 [3f(x) - 2g(x)] d x$ bằng:],
  (
    [$1$],
    True([$-19$]),
    [$-1$],
    [$19$],
  ),
  loigiai: [
    Chọn *B*.
    Áp dụng tính chất tuyến tính của tích phân:
    $
      integral_1^2 [3f(x) - 2g(x)] d x = 3 integral_1^2 f(x) d x - 2 integral_1^2 g(x) d x = 3(-3) - 2(5) = -9 - 10 = -19
    $
  ],
)

#tn(
  [Tích phân $I = integral_1^e frac(1, x) d x$ bằng:],
  (
    True([$1$]),
    [$e - 1$],
    [$0$],
    [$ln e$],
  ),
  loigiai: [
    Chọn *A*.
    Ta có:
    $
      I = [ ln|x| ]_1^e = ln e - ln 1 = 1 - 0 = 1
    $
  ],
)

#tn(
  [Cho $integral_0^6 f(x) d x = 12$. Tính tích phân $I = integral_0^2 f(3x) d x$ :],
  (
    True([$4$]),
    [$36$],
    [$6$],
    [$2$],
  ),
  loigiai: [
    Chọn *A*.
    Với hàm hợp tuyến tính $f(a x + b)$ có hệ số $a = 3$, ta có tính chất đổi biến số tuyến tính:
    $
      integral_c^d f(a x + b) d x = frac(1, a) integral_(a c + b)^(a d + b) f(u) d u
    $
    Ở đây $a = 3, b = 0$, cận chạy từ $x = 0$ đến $x = 2$, suy ra $u = 3x$ chạy từ $0$ đến $6$. Do đó:
    $
      I = integral_0^2 f(3x) d x = frac(1, 3) integral_0^6 f(u) d u = frac(1, 3) dot 12 = 4
    $
  ],
)

#tn(
  [Tích phân $I = integral_0^(pi/2) sin x d x$ bằng:],
  (
    True([$1$]),
    [$-1$],
    [$0$],
    [$frac(pi, 2)$],
  ),
  loigiai: [
    Chọn *A*.
    Ta có:
    $
      I = [ -cos x ]_0^(pi/2) = -cos(frac(pi, 2)) - (-cos(0)) = 0 - (-1) = 1
    $
  ],
)

#tn(
  [
    #grid(
      columns: (1.3fr, 1fr),
      column-gutter: 12pt,
      [
        Cho hàm số $y = f(x)$ liên tục trên đoạn $[0; 4]$ có đồ thị gồm hai đoạn thẳng cắt nhau tại điểm cực đại có tọa độ $(2; 4)$ như hình vẽ bên. Tính giá trị của tích phân $I = integral_0^4 f(x) d x$.
        
        - A. $4$
        - B. $6$
        - C. $8$
        - D. $16$
      ],
      canvas(length: 0.8cm, {
        import draw: *
        line((-0.5, 0.0), (5.0, 0.0), mark: (end: ">"), stroke: 0.5pt)
        line((0.0, -0.5), (0.0, 5.0), mark: (end: ">"), stroke: 0.5pt)
        content((4.8, -0.3), $x$)
        content((-0.3, 4.8), $y$)
        line((0.0, 0.0), (2.0, 4.0), stroke: 1.2pt + rgb("#ef4444"))
        line((2.0, 4.0), (4.0, 0.0), stroke: 1.2pt + rgb("#ef4444"))
        line((2.0, 0.0), (2.0, 4.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        line((0.0, 4.0), (2.0, 4.0), stroke: (dash: "dashed", paint: rgb("#94a3b8"), thickness: 0.5pt))
        circle((2.0, 4.0), radius: 1.5pt, fill: rgb("#ef4444"), stroke: none)
        content((-0.3, 4.0), $4$)
        content((2.0, -0.3), $2$)
        content((4.0, -0.3), $4$)
        content((-0.2, -0.2), $O$)
      })
    )
  ],
  (
    [$4$],
    [$6$],
    True([$8$]),
    [$16$],
  ),
  loigiai: [
    Chọn *C*.
    Ý nghĩa hình học của tích phân: Vì đồ thị hàm số $y = f(x)$ không âm trên đoạn $[0; 4]$ nên tích phân $I = integral_0^4 f(x) d x$ chính là diện tích phần hình phẳng giới hạn bởi đồ thị và trục hoành trên đoạn này.
    Hình phẳng này là một tam giác có đỉnh là $(2; 4)$, đường cao bằng $4$ và độ dài cạnh đáy nằm trên trục hoành từ $0$ đến $4$ là $4 - 0 = 4$.
    Diện tích tam giác đó là:
    $
      S = frac(1, 2) dot "độ dài đáy" dot "chiều cao" = frac(1, 2) dot 4 dot 4 = 8
    $
    Vậy $I = 8$.
  ],
)

#tn(
  [Cho tích phân $I = integral_1^2 (2x - m) d x = 5$ (với $m$ là tham số thực). Tìm giá trị của $m$ (họ tích phân có chứa tham số):],
  (
    [$m = 2$],
    True([$m = -2$]),
    [$m = 3$],
    [$m = -3$],
  ),
  loigiai: [
    Chọn *B*.
    Ta tính trực tiếp tích phân theo công thức Newton-Leibniz:
    $
      I = lr[ x^2 - m x ]_1^2 = lr( 2^2 - 2m ) - lr( 1^2 - m ) = lr( 4 - 2m ) - lr( 1 - m ) = 3 - m
    $
    Theo giả thiết, $I = 5 <=> 3 - m = 5 <=> m = -2$.
    Vậy $m = -2$.
  ],
)

#tn(
  [
    #grid(
      columns: (1.3fr, 1fr),
      column-gutter: 12pt,
      [
        Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đồ thị cắt trục hoành tại các điểm $-2, 0, 3$ như hình bên. Biết diện tích các phần hình phẳng giới hạn bởi đồ thị $y = f(x)$ và trục hoành trên các đoạn $[-2; 0]$ và $[0; 3]$ lần lượt là $S_1 = 4$ và $S_2 = 7$. Tính giá trị của tích phân $I = integral_(-2)^3 f(x) d x$.
        
        - A. $11$
        - B. $3$
        - C. $-11$
        - D. $-3$
      ],
      canvas(length: 0.7cm, {
        import draw: *
        line((-3.0, 0.0), (4.0, 0.0), mark: (end: ">"), stroke: 0.5pt)
        line((0.0, -2.5), (0.0, 2.0), mark: (end: ">"), stroke: 0.5pt)
        content((3.8, -0.3), $x$)
        content((-0.3, 1.8), $y$)
        bezier((-2.0, 0.0), (0.0, 0.0), (-1.5, 2.0), (-0.5, 0.0), stroke: 1.2pt + rgb("#8b5cf6"))
        bezier((0.0, 0.0), (3.0, 0.0), (1.0, -4.0), (2.0, 0.0), stroke: 1.2pt + rgb("#8b5cf6"))
        content((-1.0, 0.6), $S_1$)
        content((1.3, -0.8), $S_2$)
        content((-2.2, -0.3), $-2$)
        content((3.2, 0.3), $3$)
        content((-0.2, -0.2), $O$)
      })
    )
  ],
  (
    [$11$],
    [$3$],
    [$-11$],
    True([$-3$]),
  ),
  loigiai: [
    Chọn *D*.
    - Trên đoạn $[-2; 0]$, đồ thị nằm phía trên trục hoành nên tích phân $integral_(-2)^0 f(x) d x = S_1 = 4$.
    - Trên đoạn $[0; 3]$, đồ thị nằm hoàn toàn phía dưới trục hoành nên tích phân $integral_0^3 f(x) d x = -S_2 = -7$.
    Áp dụng tính chất cộng khoảng của tích phân:
    $
      I = integral_(-2)^3 f(x) d x = integral_(-2)^0 f(x) d x + integral_0^3 f(x) d x = 4 + (-7) = -3.
    $
  ],
)

#tn(
  [Cho hàm số phân nhánh $f(x) = { cos x wide "nếu " x >= 0 ; 1 wide "nếu " x < 0 }$. Tính tích phân $I = integral_(-pi/2)^(pi/2) f(x) d x$.],
  (
    True([$frac(pi, 2) + 1$]),
    [$frac(pi, 2) - 1$],
    [$1 - frac(pi, 2)$],
    [$frac(pi, 2)$],
  ),
  loigiai: [
    Chọn *A*.
    Ta tách tích phân tại điểm phân nhánh $x = 0$:
    $
      I = integral_(-pi/2)^0 f(x) d x + integral_0^(pi/2) f(x) d x = integral_(-pi/2)^0 1 d x + integral_0^(pi/2) cos x d x
    $
    Tính các tích phân thành phần:
    $
      integral_(-pi/2)^0 1 d x = [ x ]_(-pi/2)^0 = 0 - lr( -frac(pi, 2) ) = frac(pi, 2)
    $
    $
      integral_0^(pi/2) cos x d x = [ sin x ]_0^(pi/2) = sin(frac(pi, 2)) - sin(0) = 1 - 0 = 1
    $
    Vậy $I = frac(pi, 2) + 1$.
  ],
)

#tn(
  [Tìm giá trị dương của tham số $a$ để tích phân $I(a) = integral_0^a (3x^2 - 4x + 1) d x$ đạt giá trị nhỏ nhất (bài toán tối ưu cực trị liên quan tích phân):],
  (
    [$a = frac(1, 3)$],
    True([$a = 1$]),
    [$a = 2$],
    [Không tồn tại $a$],
  ),
  loigiai: [
    Chọn *B*.
    Tính tích phân $I(a)$ theo biến $a$:
    $
      I(a) = lr[ x^3 - 2x^2 + x ]_0^a = a^3 - 2a^2 + a
    $
    Xét hàm số $g(a) = a^3 - 2a^2 + a$ trên khoảng $(0; +infinity)$.
    Đạo hàm:
    $
      g'(a) = 3a^2 - 4a + 1 = 0  <=>  [ a = 1 ; a = 1/3 ]
    $
    Bảng biến thiên của $g(a)$ trên $(0; +infinity)$:
    - $g'(a) > 0$ trên $(0; 1/3) cup (1; +infinity)$.
    - $g'(a) < 0$ trên $(1/3; 1)$.
    Các giá trị đặc biệt:
    - $g(1/3) = lr( frac(1, 3) )^3 - 2 lr( frac(1, 3) )^2 + frac(1, 3) = frac(1, 27) - frac(2, 9) + frac(1, 3) = frac(4, 27) > 0$.
    - $g(1) = 1^3 - 2(1)^2 + 1 = 0$.
    Từ bảng biến thiên, ta thấy hàm số đạt giá trị nhỏ nhất trên $(0; +infinity)$ bằng $0$ tại điểm cực tiểu $a = 1$.
    Vậy $a = 1$.
  ],
)

#tn(
  [Cho hàm số $f(x) = { 2x + 1 wide "nếu " x >= 1 \ x^2 + 2 wide "nếu " x < 1 }$. Tính tích phân $I = integral_0^2 f(x) d x$ :],
  (
    [$frac(16, 3)$],
    [$frac(17, 3)$],
    [$6$],
    True([$frac(19, 3)$]),
  ),
  loigiai: [
    Chọn *D*.
    - Ta tách tích phân tại điểm phân nhánh $x = 1$:
      $ I = integral_0^1 f(x) d x + integral_1^2 f(x) d x = integral_0^1 (x^2 + 2) d x + integral_1^2 (2x + 1) d x $
    - Tính tích phân thứ nhất:
      $ I_1 = integral_0^1 (x^2 + 2) d x = lr[ frac(x^3, 3) + 2x ]_0^1 = frac(1, 3) + 2 = frac(7, 3) $
    - Tính tích phân thứ hai:
      $ I_2 = integral_1^2 (2x + 1) d x = lr[ x^2 + x ]_1^2 = (4 + 2) - (1 + 1) = 6 - 2 = 4 $
    - Cộng hai kết quả lại:
      $ I = I_1 + I_2 = frac(7, 3) + 4 = frac(19, 3) $
  ],
)

#tn(
  [Tính tích phân $I = integral_0^2 |x^2 - 1| d x$ :],
  (
    [$frac(2, 3)$],
    [$frac(4, 3)$],
    [$1$],
    True([$2$]),
  ),
  loigiai: [
    Chọn *D*.
    - Trên đoạn $[0; 2]$, ta xét dấu của biểu thức $x^2 - 1$:
      - Với $x in [0; 1]$, ta có $x^2 - 1 <= 0$ nên $|x^2 - 1| = 1 - x^2$.
      - Với $x in [1; 2]$, ta có $x^2 - 1 >= 0$ nên $|x^2 - 1| = x^2 - 1$.
    - Chia đoạn tích phân tại điểm $x = 1$:
      $ I = integral_0^1 (1 - x^2) d x + integral_1^2 (x^2 - 1) d x $
    - Tính từng tích phân thành phần:
      $ I_1 = integral_0^1 (1 - x^2) d x = lr[ x - frac(x^3, 3) ]_0^1 = 1 - frac(1, 3) = frac(2, 3) $
      $ I_2 = integral_1^2 (x^2 - 1) d x = lr[ frac(x^3, 3) - x ]_1^2 = lr( frac(8, 3) - 2 ) - lr( frac(1, 3) - 1 ) = frac(2, 3) - lr( -frac(2, 3) ) = frac(4, 3) $
    - Cộng hai kết quả: $I = I_1 + I_2 = frac(2, 3) + frac(4, 3) = 2$.
  ],
)

#tn(
  [
    #grid(
      columns: (1.3fr, 1fr),
      column-gutter: 12pt,
      [
        Cho hàm số $y = f(x)$ liên tục trên $[-1; 4]$ có đồ thị như hình vẽ bên. Gọi $S_1, S_2$ lần lượt là diện tích các hình phẳng giới hạn bởi đồ thị $y = f(x)$ và trục hoành trên các đoạn $[-1; 1]$ và $[1; 4]$. Biết $S_1 = 3$, $S_2 = 5$. Tính tích phân $I = integral_(-1)^4 f(x) d x$.
        
        - A. $8$
        - B. $-2$
        - C. $2$
        - D. $-8$
      ],
      canvas(length: 0.8cm, {
        import draw: *
        line((-1.8, 0.0), (4.8, 0.0), mark: (end: ">"), stroke: 0.5pt)
        line((0.0, -2.5), (0.0, 2.0), mark: (end: ">"), stroke: 0.5pt)
        content((4.6, -0.3), $x$)
        content((-0.3, 1.8), $y$)
        bezier((-1.0, 0.0), (1.0, 0.0), (-0.5, 1.8), (0.5, 1.8), stroke: 1.2pt + rgb("#10b981"))
        bezier((1.0, 0.0), (4.0, 0.0), (2.0, -2.5), (3.0, -2.5), stroke: 1.2pt + rgb("#10b981"))
        content((0.0, 0.7), $S_1$)
        content((2.5, -1.0), $S_2$)
        content((-1.0, -0.3), $-1$)
        content((1.0, 0.3), $1$)
        content((4.0, 0.3), $4$)
        content((-0.2, -0.2), $O$)
      })
    )
  ],
  (
    [$8$],
    True([$-2$]),
    [$2$],
    [$-8$],
  ),
  loigiai: [
    Chọn *B*.
    - Trên đoạn $[-1; 1]$, đồ thị nằm phía trên trục hoành nên $integral_(-1)^1 f(x) d x = S_1 = 3$.
    - Trên đoạn $[1; 4]$, đồ thị nằm phía dưới trục hoành nên $integral_1^4 f(x) d x = -S_2 = -5$.
    - Cộng cận ta được: $I = integral_(-1)^4 f(x) d x = integral_(-1)^1 f(x) d x + integral_1^4 f(x) d x = 3 - 5 = -2$.
  ],
)

#tn(
  [Tìm hằng số thực $k > 0$ để tích phân $I = integral_0^k (3x^2 - 6x) d x$ đạt giá trị nhỏ nhất:],
  (
    [$k = 1$],
    True([$k = 2$]),
    [$k = 3$],
    [$k = 4$],
  ),
  loigiai: [
    Chọn *B*.
    - Tính tích phân theo biến $k$:
      $ I(k) = lr[ x^3 - 3x^2 ]_0^k = k^3 - 3k^2 $
    - Xét hàm số $g(k) = k^3 - 3k^2$ trên khoảng $(0; +infinity)$:
      $ g'(k) = 3k^2 - 6k = 3k(k - 2) = 0  <=>  k = 2  wide " (do " k > 0) $
    - Lập bảng biến thiên trên $(0; +infinity)$, ta có:
      - Với $0 < k < 2$: $g'(k) < 0$ nên hàm số nghịch biến.
      - Với $k > 2$: $g'(k) > 0$ nên hàm số đồng biến.
    - Do đó, giá trị nhỏ nhất của hàm số đạt được tại điểm cực tiểu $k = 2$.
  ],
)

#q-label("PHẦN II. Câu trắc nghiệm đúng sai", c-p0)

#ds(
  [Cho hàm số $f(x)$ liên tục trên đoạn $[-1, 3]$ và thỏa mãn $integral_(-1)^1 f(x) d x = 4$, $integral_1^3 f(x) d x = 6$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Tích phân $integral_(-1)^3 f(x) d x$ có giá trị bằng $10$.]),
    [Tích phân $integral_3^1 f(x) d x$ có giá trị bằng $6$.],
    True([Tích phân $integral_(-1)^1 3 f(x) d x$ có giá trị bằng $12$.]),
    True([Tích phân $integral_(-1)^3 [f(x) - 2x] d x$ có giá trị bằng $2$.]),
  ),
  loigiai: [
    - a) *Đúng*. Theo tính chất cộng khoảng: $integral_(-1)^3 f(x) d x = integral_(-1)^1 f(x) d x + integral_1^3 f(x) d x = 4 + 6 = 10$.
    - b) *Sai*. Theo tính chất đổi cận: $integral_3^1 f(x) d x = -integral_1^3 f(x) d x = -6$.
    - c) *Đúng*. Theo tính chất hằng số: $integral_(-1)^1 3 f(x) d x = 3 integral_(-1)^1 f(x) d x = 3(4) = 12$.
    - d) *Đúng*.
      Ta có:
      $
        integral_(-1)^3 [f(x) - 2x] d x = integral_(-1)^3 f(x) d x - integral_(-1)^3 2x d x
      $
      Đã biết tích phân thứ nhất bằng $10$. Tính tích phân thứ hai:
      $
        integral_(-1)^3 2x d x = [ x^2 ]_(-1)^3 = 3^2 - (-1)^2 = 9 - 1 = 8
      $
      Vậy tích phân cần tìm là $10 - 8 = 2$. Mệnh đề d) Đúng.
  ],
)

#ds(
  [Cho hàm số phân nhánh $f(x)$ xác định trên $[-1, 2]$ như sau:
  $
    f(x) = {
      2x + 1  wide  "nếu " -1 <= x <= 0 \
      e^x     wide  "nếu " 0 < x <= 2
    }
  $
  Xét tính đúng sai của các khẳng định sau:],
  (
    True([Hàm số $f(x)$ liên tục tại điểm $x = 0$.]),
    True([Tích phân $integral_(-1)^0 f(x) d x = 0$.]),
    True([Tích phân $integral_0^2 f(x) d x = e^2 - 1$.]),
    [Tích phân $I = integral_(-1)^2 f(x) d x$ có giá trị bằng $e^2$.],
  ),
  loigiai: [
    - a) *Đúng*. Kiểm tra giới hạn hai bên tại $x = 0$:
      - Giới hạn bên trái: $lim_(x -> 0^-) f(x) = lim_(x -> 0^-) (2x + 1) = 1$.
      - Giới hạn bên phải: $lim_(x -> 0^+) f(x) = lim_(x -> 0^+) e^x = e^0 = 1$.
      - Giá trị hàm số: $f(0) = 2(0) + 1 = 1$.
      Vì giới hạn hai bên bằng nhau và bằng giá trị hàm số nên hàm số liên tục tại $x = 0$.
    - b) *Đúng*.
      $
        integral_(-1)^0 f(x) d x = integral_(-1)^0 (2x + 1) d x = [ x^2 + x ]_(-1)^0 = 0 - lr( (-1)^2 + (-1) ) = 0 - 0 = 0.
      $
    - c) *Đúng*.
      $
        integral_0^2 f(x) d x = integral_0^2 e^x d x = [ e^x ]_0^2 = e^2 - e^0 = e^2 - 1.
      $
    - d) *Sai*. Áp dụng cộng khoảng tại $x=0$:
      $
        integral_(-1)^2 f(x) d x = integral_(-1)^0 f(x) d x + integral_0^2 f(x) d x = 0 + (e^2 - 1) = e^2 - 1 != e^2.
      $
  ],
)

#ds(
  [
    #grid(
      columns: (1.3fr, 1.1fr),
      column-gutter: 12pt,
      [
        Cho hàm số $y = f(x)$ liên tục trên đoạn $[0; 4]$ có đồ thị như hình bên. Gọi $S_1$ là diện tích hình phẳng giới hạn bởi đồ thị và trục hoành trên đoạn $[0; 2]$ và $S_2$ là trên đoạn $[2; 4]$. Biết $S_1 = 5$ và $S_2 = 3$. Xét tính đúng sai của các khẳng định sau:
        
        - a) Tích phân $integral_0^2 f(x) d x = -5$.
        - b) Tích phân $integral_2^4 f(x) d x = 3$.
        - c) Tích phân $integral_0^4 f(x) d x = -2$.
        - d) Tích phân $integral_0^4 |f(x)| d x = 8$.
      ],
      canvas(length: 0.65cm, {
        import draw: *
        line((-0.5, 0.0), (5.0, 0.0), mark: (end: ">"), stroke: 0.5pt)
        line((0.0, -3.0), (0.0, 2.5), mark: (end: ">"), stroke: 0.5pt)
        content((4.8, -0.3), $x$)
        content((-0.3, 2.3), $y$)
        bezier((0.0, 0.0), (2.0, 0.0), (0.5, -3.0), (1.5, -1.0), stroke: 1.2pt + rgb("#2563eb"))
        bezier((2.0, 0.0), (4.0, 0.0), (2.5, 2.0), (3.5, 1.0), stroke: 1.2pt + rgb("#2563eb"))
        content((1.0, -1.2), $S_1$)
        content((3.0, 0.8), $S_2$)
        content((2.0, 0.3), $2$)
        content((4.0, -0.3), $4$)
        content((-0.2, -0.2), $O$)
      })
    )
  ],
  (
    True([Tích phân $integral_0^2 f(x) d x = -5$.]),
    True([Tích phân $integral_2^4 f(x) d x = 3$.]),
    True([Tích phân $integral_0^4 f(x) d x = -2$.]),
    True([Tích phân $integral_0^4 |f(x)| d x = 8$.]),
  ),
  loigiai: [
    - a) *Đúng*. Do đồ thị hàm số $y=f(x)$ nằm hoàn toàn phía dưới trục hoành trên đoạn $[0; 2]$ nên tích phân có giá trị âm, $integral_0^2 f(x) d x = -S_1 = -5$.
    - b) *Đúng*. Do đồ thị hàm số $y=f(x)$ nằm phía trên trục hoành trên đoạn $[2; 4]$ nên tích phân bằng diện tích, $integral_2^4 f(x) d x = S_2 = 3$.
    - c) *Đúng*. Áp dụng hệ thức Chasles cộng cận:
      $
        integral_0^4 f(x) d x = integral_0^2 f(x) d x + integral_2^4 f(x) d x = -5 + 3 = -2.
      $
    - d) *Đúng*. Tích phân giá trị tuyệt đối thể hiện tổng diện tích của toàn bộ các phần:
      $
        integral_0^4 |f(x)| d x = S_1 + S_2 = 5 + 3 = 8.
      $
  ],
)

#ds(
  [Cho tích phân $I(m) = integral_0^1 (2x - m) e^x d x$ (với $m$ là tham số thực). Xét tính đúng sai của các khẳng định sau:],
  (
    True([Với $m = 2$, một nguyên hàm của hàm số $g(x) = (2x - 2) e^x$ là $G(x) = (2x - 4) e^x$.]),
    True([Với $m = 2$, giá trị của tích phân $I(2)$ bằng $4 - 2e$.]),
    [Để tích phân $I(m) = 1$ thì ta phải có $m = 0$.],
    [Đồ thị của hàm số $y = I(m)$ (theo biến $m$) đi qua điểm $M(1; -1)$.],
  ),
  loigiai: [
    - a) *Đúng*. Ta tìm nguyên hàm của $f(x) = (2x - m) e^x$ bằng cách phỏng đoán $F(x) = (A x + B) e^x$.
      Ta có $F'(x) = A e^x + (A x + B) e^x = [A x + (A + B)] e^x$.
      Đồng nhất với $(2x - m) e^x$, ta có $A = 2$ và $A + B = -m => B = -m - 2$.
      Vậy nguyên hàm tổng quát là $F(x) = (2x - m - 2) e^x$.
      Khi $m = 2$, nguyên hàm của $g(x) = (2x - 2) e^x$ là $G(x) = (2x - 4) e^x$.
    - b) *Đúng*. Với $m = 2$, tích phân $I(2) = G(1) - G(0) = (2(1) - 4) e^1 - (2(0) - 4) e^0 = -2e - (-4) = 4 - 2e$.
    - c) *Sai*. Tính tích phân theo tham số $m$:
      $
        I(m) = F(1) - F(0) = (2 - m - 2) e^1 - (0 - m - 2) e^0 = -m e - (-m - 2) = m(1 - e) + 2.
      $
      Để $I(m) = 1 <=> m(1 - e) + 2 = 1 <=> m = frac(1, e - 1) != 0$.
    - d) *Sai*. Phương trình biểu thị mối liên hệ là $y = (1 - e) m + 2$.
      Thế $m = 1$ ta được $y = 1 - e + 2 = 3 - e != -1$. Nên đồ thị không đi qua $M(1; -1)$.
  ],
)

#ds(
  [Cho tích phân $I = integral_(-1)^1 |x - m| d x$ (với $m$ là tham số thực thỏa mãn $-1 < m < 1$). Xét tính đúng sai của các khẳng định sau:],
  (
    True([Ta có thể tách tích phân đã cho thành $I = integral_(-1)^m (m - x) d x + integral_m^1 (x - m) d x$.]),
    True([Giá trị của tích phân $I$ tính theo tham số $m$ là $I = m^2 + 1$.]),
    [Giá trị của tích phân $I$ đạt giá trị nhỏ nhất tại $m = 1$.],
    True([Với $m = frac(1, 2)$, giá trị của tích phân $I$ bằng $frac(5, 4)$.]),
  ),
  loigiai: [
    - a) *Đúng*. Vì $-1 < m < 1$ nên điểm $x = m$ chia đoạn $[-1; 1]$ thành hai đoạn $[-1; m]$ và $[m; 1]$:
      - Trên $[-1; m]$: $x <= m => |x - m| = m - x$.
      - Trên $[m; 1]$: $x >= m => |x - m| = x - m$.
      Do đó: $I = integral_(-1)^m (m - x) d x + integral_m^1 (x - m) d x$.
    - b) *Đúng*. Tính các tích phân thành phần:
      $
        I_1 = integral_(-1)^m (m - x) d x = lr[ m x - frac(x^2, 2) ]_(-1)^m = lr( m^2 - frac(m^2, 2) ) - lr( -m - frac(1, 2) ) = frac(m^2, 2) + m + frac(1, 2) = frac((m + 1)^2, 2)
      $
      $
        I_2 = integral_m^1 (x - m) d x = lr[ frac(x^2, 2) - m x ]_m^1 = lr( frac(1, 2) - m ) - lr( frac(m^2, 2) - m^2 ) = frac(1, 2) - m + frac(m^2, 2) = frac((m - 1)^2, 2)
      $
      Cộng hai kết quả lại:
      $
        I = I_1 + I_2 = frac{(m + 1)^2 + (m - 1)^2, 2) = frac(2m^2 + 2, 2) = m^2 + 1.
      $
    - c) *Sai*. Biểu thức $I(m) = m^2 + 1$ là một parabol có đỉnh cực tiểu tại $m = 0$.
      Do đó trên khoảng $(-1; 1)$, tích phân đạt giá trị nhỏ nhất tại $m = 0$ (bằng $1$).
    - d) *Đúng*. Thế $m = frac(1, 2)$ vào công thức: $I = lr( frac(1, 2) )^2 + 1 = frac(1, 4) + 1 = frac(5, 4)$.
  ],
)

#q-label("PHẦN III. Câu trắc nghiệm trả lời ngắn", c-p0)

#tln(
  [Cho hàm số $f(x)$ liên tục trên $RR$ và thỏa mãn $integral_0^4 f(x) d x = 8$. Tính giá trị của tích phân $I = integral_0^2 f(2x) d x$.],
  [4],
  loigiai: [
    Áp dụng phép đổi biến số tuyến tính $u = 2x$ với hệ số $a = 2$:
    $
      I = integral_0^2 f(2x) d x = frac(1, 2) integral_0^4 f(u) d u = frac(1, 2) dot 8 = 4
    $
  ],
)

#tln(
  [Tính giá trị tích phân $I = integral_1^2 frac(2x - 1, x^2 - x + 1) d x$.],
  [1.1],
  loigiai: [
    Ta nhận thấy đạo hàm của mẫu số $u(x) = x^2 - x + 1$ chính là tử số $u'(x) = 2x - 1$.
    Do đó, một nguyên hàm của hàm số dưới dấu tích phân là $ln|x^2 - x + 1|$.
    Áp dụng công thức Newton-Leibniz thế cận:
    $
      I = [ ln(x^2 - x + 1) ]_1^2 = ln(2^2 - 2 + 1) - ln(1^2 - 1 + 1)
    $
    $
      I = ln(3) - ln(1) = ln 3 - 0 = ln 3 approx 1.0986
    $
    Làm tròn đến hàng phần mười, ta thu được kết quả bằng $1.1$.
  ],
)

#tln(
  [Cho tích phân $I = integral_0^1 (2x + 1) e^x d x$. Tìm số nguyên dương $k$ để tích phân này có giá trị bằng $e + k$.],
  [1],
  loigiai: [
    Mặc dù bài toán này có thể tính bằng phương pháp tích phân từng phần (nhưng chương trình phổ thông mới đã tinh giản phương pháp này), ta có thể tìm trực tiếp nguyên hàm của hàm số $f(x) = (2x + 1) e^x$.
    Ta phỏng đoán nguyên hàm có dạng $F(x) = (A x + B) e^x$. Đạo hàm thử:
    $
      F'(x) = A e^x + (A x + B) e^x = (A x + A + B) e^x
    $
    Đồng nhất hệ số với $(2x + 1) e^x$, ta có:
    $
      A = 2  wide  "và"  wide  A + B = 1  =>  B = -1
    $
    Vậy một nguyên hàm là $F(x) = (2x - 1) e^x$.
    Tính tích phân:
    $
      I = [ (2x - 1) e^x ]_0^1 = (2(1) - 1) e^1 - (2(0) - 1) e^0 = e - (-1) = e + 1
    $
    So sánh với $e + k$, ta có $k = 1$.
  ],
)

#tln(
  [Cho hàm số $f(x)$ có đạo hàm $f'(x)$ liên tục trên đoạn $[1; 3]$ thỏa mãn $f(1) = 2$ và $integral_1^3 f'(x) d x = 5$. Tìm giá trị của $f(3)$.],
  [7],
  loigiai: [
    Theo định nghĩa tích phân, ta có:
    $
      integral_1^3 f'(x) d x = [ f(x) ]_1^3 = f(3) - f(1)
    $
    Theo đề bài, tích phân này bằng $5$ và $f(1) = 2$, nên ta có:
    $
      f(3) - 2 = 5  =>  f(3) = 7.
    $
  ],
)

#tln(
  [
    #grid(
      columns: (1.3fr, 1fr),
      column-gutter: 12pt,
      [
        Cho hàm số $y = f(x)$ liên tục trên đoạn $[0; 3]$. Đồ thị $y = f(x)$ cắt trục hoành tại các điểm có hoành độ $1$ và $2$ như hình bên. Gọi $S_1, S_2, S_3$ lần lượt là diện tích các hình phẳng giới hạn bởi đồ thị $y = f(x)$ và trục hoành trên các khoảng $[0; 1]$, $[1; 2]$, $[2; 3]$. Biết $S_1 = 3, S_2 = 2, S_3 = 4$. Tính giá trị của tích phân $I = integral_0^3 f(x) d x$.
      ],
      canvas(length: 0.7cm, {
        import draw: *
        line((-0.5, 0.0), (3.5, 0.0), mark: (end: ">"), stroke: 0.5pt)
        line((0.0, -1.5), (0.0, 2.0), mark: (end: ">"), stroke: 0.5pt)
        content((3.3, -0.3), $x$)
        content((-0.3, 1.8), $y$)
        bezier((0.0, 1.5), (1.0, 0.0), (0.3, 1.5), (0.7, 0.0), stroke: 1.2pt + rgb("#f59e0b"))
        bezier((1.0, 0.0), (2.0, 0.0), (1.3, -1.5), (1.7, 0.0), stroke: 1.2pt + rgb("#f59e0b"))
        bezier((2.0, 0.0), (3.0, 1.8), (2.4, 0.0), (2.7, 1.8), stroke: 1.2pt + rgb("#f59e0b"))
        content((0.4, 0.6), $S_1$)
        content((1.5, -0.6), $S_2$)
        content((2.6, 0.8), $S_3$)
        content((1.0, 0.3), $1$)
        content((2.0, -0.3), $2$)
        content((3.0, -0.3), $3$)
        content((-0.2, -0.2), $O$)
      })
    )
  ],
  [5],
  loigiai: [
    Quan sát hình vẽ, trên các khoảng:
    - Khoảng $[0; 1]$: đồ thị $y = f(x)$ nằm phía trên trục hoành, nên $integral_0^1 f(x) d x = S_1 = 3$.
    - Khoảng $[1; 2]$: đồ thị $y = f(x)$ nằm phía dưới trục hoành, nên $integral_1^2 f(x) d x = -S_2 = -2$.
    - Khoảng $[2; 3]$: đồ thị $y = f(x)$ nằm phía trên trục hoành, nên $integral_2^3 f(x) d x = S_3 = 4$.
    Áp dụng tính chất cộng cận, ta có:
    $
      I = integral_0^3 f(x) d x = integral_0^1 f(x) d x + integral_1^2 f(x) d x + integral_2^3 f(x) d x = 3 + (-2) + 4 = 5.
    $
  ],
)

#tln(
  [Cho tham số thực $a$ thỏa mãn tích phân $I = integral_0^1 (e^x + a) d x = e + 2$. Tìm giá trị của $a$.],
  [3],
  loigiai: [
    Tính tích phân:
    $
      I = lr[ e^x + a x ]_0^1 = lr( e^1 + a(1) ) - lr( e^0 + a(0) ) = e + a - 1.
    $
    Theo đề bài: $I = e + 2 <=> e + a - 1 = e + 2 <=> a - 1 = 2 <=> a = 3$.
    Vậy $a = 3$.
  ],
)

#tln(
  [Cho hàm số $f(x)$ liên tục trên $RR$ và có công thức phân nhánh như sau: $f(x) = 3x^2$ khi $x >= 1$ và $f(x) = 2x + a$ khi $x < 1$. Tính tích phân $I = integral_(-1)^2 f(x) d x$.],
  [9],
  loigiai: [
    - Do hàm số liên tục trên $RR$ nên nó phải liên tục tại điểm phân nhánh $x = 1$:
      $ lim_(x -> 1^+) f(x) = lim_(x -> 1^-) f(x)  <=>  3(1)^2 = 2(1) + a  =>  a = 1 $
    - Do đó, ta có công thức của hàm số:
      $ f(x) = {
        3x^2 wide "nếu " x >= 1 \
        2x + 1 wide "nếu " x < 1
      } $
    - Tách tích phân đã cho tại điểm $x = 1$:
      $ I = integral_(-1)^1 (2x + 1) d x + integral_1^2 3x^2 d x = lr[ x^2 + x ]_(-1)^1 + lr[ x^3 ]_1^2 $
      $ I = lr( (1^2 + 1) - ((-1)^2 - 1) ) + (2^3 - 1^3) = (2 - 0) + (8 - 1) = 2 + 7 = 9. $
  ],
)

#tln(
  [Cho hàm số $y = f(x)$ liên tục trên $[-2; 3]$ có đồ thị gồm một đường parabol có đỉnh là $I(0; 2)$ và đi qua các điểm $(-2; 0)$, $(2; 0)$, kết hợp với một đoạn thẳng từ $(2; 0)$ đến $(3; -1)$ như hình vẽ. Gọi $I = integral_(-2)^3 f(x) d x$. Tính giá trị của biểu thức $P = 3 I$ (làm tròn kết quả đến hàng phần mười).],
  [14.5],
  loigiai: [
    - Tìm công thức parabol trên đoạn $[-2; 2]$:
      $ y = a x^2 + 2 $
      Parabol đi qua $(2; 0)$ nên $a(2^2) + 2 = 0 => 4a = -2 => a = -1/2$.
      Do đó $f(x) = -frac(1, 2) x^2 + 2$ trên đoạn $[-2; 2]$.
    - Tính tích phân trên $[-2; 2]$:
      $ I_1 = integral_(-2)^2 lr( -frac(1, 2) x^2 + 2 ) d x = lr[ -frac(x^3, 6) + 2x ]_(-2)^2 $
      $ I_1 = lr( -frac(8, 6) + 4 ) - lr( frac(8, 6) - 4 ) = lr( -frac(4, 3) + 4 ) - lr( frac(4, 3) - 4 ) = frac(8, 3) - lr( -frac(8, 3) ) = frac(16, 3) $
    - Trên đoạn $[2; 3]$, đồ thị là đoạn thẳng nằm dưới trục hoành, tạo thành một tam giác vuông với trục hoành có hai cạnh góc vuông dài $3 - 2 = 1$ và $|-1| = 1$.
      Diện tích tam giác này là $S = frac(1, 2) dot 1 dot 1 = 0.5$.
      Do đồ thị nằm dưới trục hoành nên:
      $ I_2 = integral_2^3 f(x) d x = -S = -0.5 = -frac(1, 2) $
    - Tính tổng tích phân $I$:
      $ I = I_1 + I_2 = frac(16, 3) - frac(1, 2) = frac(29, 6) $
    - Vậy $P = 3 I = 3 dot frac(29, 6) = frac(29, 2) = 14.5$.
  ],
)

#tln(
  [Cho tích phân $I = integral_0^2 |x^2 - x| d x$. Tính giá trị của biểu thức $K = 6 I$.],
  [6],
  loigiai: [
    - Biểu thức $x^2 - x = x(x - 1)$ đổi dấu tại điểm $x = 1$ trên đoạn $[0; 2]$:
      - Với $x in [0; 1]$: $x^2 - x <= 0$ nên $|x^2 - x| = x - x^2$.
      - Với $x in [1; 2]$: $x^2 - x >= 0$ nên $|x^2 - x| = x^2 - x$.
    - Chia khoảng tích phân:
      $ I = integral_0^1 (x - x^2) d x + integral_1^2 (x^2 - x) d x $
    - Tính từng tích phân thành phần:
      - $I_1 = integral_0^1 (x - x^2) d x = lr[ frac(x^2, 2) - frac(x^3, 3) ]_0^1 = frac(1, 2) - frac(1, 3) = frac(1, 6)$.
      - $I_2 = integral_1^2 (x^2 - x) d x = lr[ frac(x^3, 3) - frac(x^2, 2) ]_1^2 = lr( frac(8, 3) - 2 ) - lr( frac(1, 3) - frac(1, 2) ) = frac(2, 3) - lr( -frac(1, 6) ) = frac(5, 6)$.
    - Cộng lại: $I = I_1 + I_2 = frac(1, 6) + frac(5, 6) = 1$.
    - Vậy $K = 6 I = 6(1) = 6$.
  ],
)
