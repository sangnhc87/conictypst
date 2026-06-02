#import "../_config.typ": *

#chapter([Ứng dụng hình học phẳng và không gian thuần túy], theme-color: c-p0)

#phuongphap(theme-color: c-p0)[
  *1. Tính diện tích hình phẳng (2D Area):*
  - *Dạng giới hạn bởi 1 đường cong và trục hoành:* Diện tích hình phẳng giới hạn bởi đồ thị $y = f(x)$, trục hoành $y = 0$ và hai đường thẳng $x = a$, $x = b$ ($a < b$) là:
    $
      S = integral_a^b |f(x)| d x
    $
  - *Dạng giới hạn bởi 2 đường cong:* Diện tích hình phẳng giới hạn bởi đồ thị của hai hàm số $y = f(x)$, $y = g(x)$ và hai đường thẳng $x = a$, $x = b$ ($a < b$) là:
    $
      S = integral_a^b |f(x) - g(x)| d x
    $
    *Lưu ý:* Nếu đề bài không cho sẵn các cận $a, b$, ta tìm chúng bằng cách giải phương trình hoành độ giao điểm $f(x) = g(x)$. Các nghiệm bé nhất và lớn nhất của phương trình này lần lượt đóng vai trò là cận dưới $a$ và cận trên $b$.

  *2. Tính thể tích vật thể (Volume of Solids):*
  - Thể tích của vật thể giới hạn bởi hai mặt phẳng vuông góc với trục $O x$ tại $x = a$ và $x = b$, biết diện tích của thiết diện cắt vuông góc với trục $O x$ tại hoành độ $x$ là $S(x)$ ($S(x)$ liên tục trên $[a, b]$):
    $
      V = integral_a^b S(x) d x
    $

  *3. Tính thể tích khối tròn xoay (Volume of Solids of Revolution):*
  - Khối tròn xoay tạo thành khi quay hình phẳng giới hạn bởi đồ thị $y = f(x)$ ($f(x)$ liên tục), trục hoành $y = 0$, hai đường thẳng $x = a$ và $x = b$ quanh trục hoành $O x$ là:
    $
      V = pi integral_a^b f^2(x) d x
    $
]

#topic([Tính diện tích hình phẳng đại số], prefix: "Chủ đề", theme-color: c-p0)

#dang([Tính diện tích giới hạn bởi một đường cong và trục hoành], theme-color: c-p0)

#vd(
  [Tính diện tích $S$ của hình phẳng giới hạn bởi parabol $y = 3x^2 - 6x$ và trục hoành $y = 0$.],
  loigiai: [
    Trước hết, ta tìm các giao điểm của parabol với trục hoành bằng cách giải phương trình hoành độ giao điểm:
    $
      3x^2 - 6x = 0  <=>  3x(x - 2) = 0  <=>  x = 0  " hoặc " x = 2
    $
    Vậy hình phẳng được giới hạn trong đoạn $[0, 2]$. Diện tích hình phẳng là:
    $
      S = integral_0^2 |3x^2 - 6x| d x
    $
    Xét dấu của biểu thức $3x^2 - 6x$ trên khoảng $(0, 2)$:
    Với $x in (0, 2)$, ta có $3x^2 - 6x < 0$, do đó $|3x^2 - 6x| = -(3x^2 - 6x) = 6x - 3x^2$.
    Tính tích phân:
    $
      S = integral_0^2 (6x - 3x^2) d x = lr[ 3x^2 - x^3 ]_0^2 = lr( 3(2^2) - 2^3 ) - 0 = lr( 12 - 8 ) = 4
    $
    Vậy diện tích hình phẳng bằng $4$ (đơn vị diện tích).
  ],
  theme-color: c-p0,
)

#vd(
  [Tính diện tích $S$ của hình phẳng giới hạn bởi đồ thị hàm số $y = x^2 - 4x + 3$, trục hoành và hai đường thẳng $x = 0$, $x = 4$.],
  loigiai: [
    - Phương trình hoành độ giao điểm của đồ thị hàm số với trục hoành:
      $ x^2 - 4x + 3 = 0  <=>  [ x = 1 ; x = 3 ] $
      Cả hai giao điểm này đều thuộc đoạn $[0; 4]$.
    - Diện tích hình phẳng được tính bởi công thức:
      $ S = integral_0^4 |x^2 - 4x + 3| d x $
    - Xét dấu của tam thức bậc hai $x^2 - 4x + 3$ trên $[0; 4]$:
      - Trên $[0; 1]$: $x^2 - 4x + 3 >= 0$.
      - Trên $[1; 3]$: $x^2 - 4x + 3 <= 0$.
      - Trên $[3; 4]$: $x^2 - 4x + 3 >= 0$.
    - Tách tích phân thành ba phần:
      $ S = integral_0^1 (x^2 - 4x + 3) d x - integral_1^3 (x^2 - 4x + 3) d x + integral_3^4 (x^2 - 4x + 3) d x $
    - Tìm một nguyên hàm $F(x) = frac(x^3, 3) - 2x^2 + 3x$.
      - $F(0) = 0$.
      - $F(1) = frac(1, 3) - 2 + 3 = frac(4, 3)$.
      - $F(3) = 9 - 18 + 9 = 0$.
      - $F(4) = frac(64, 3) - 32 + 12 = frac(4, 3)$.
    - Tính từng tích phân thành phần:
      - $S_1 = F(1) - F(0) = frac(4, 3)$.
      - $S_2 = F(3) - F(1) = 0 - frac(4, 3) = -frac(4, 3)$.
      - $S_3 = F(4) - F(3) = frac(4, 3) - 0 = frac(4, 3)$.
    - Vậy diện tích cần tìm là:
      $ S = S_1 - S_2 + S_3 = frac(4, 3) - lr( -frac(4, 3) ) + frac(4, 3) = 4 $
  ],
  theme-color: c-p0,
)

#dang([Tính diện tích giới hạn bởi hai đường cong], theme-color: c-p0)

#vd(
  [Tính diện tích $S$ của hình phẳng giới hạn bởi đồ thị hai hàm số $y = x^2$ và $y = 2 - x^2$.],
  loigiai: [
    Giải phương trình hoành độ giao điểm của hai đường cong:
    $
      x^2 = 2 - x^2  <=>  2x^2 = 2  <=>  x^2 = 1  <=>  x = -1  " hoặc " x = 1
    $
    Hai giao điểm có hoành độ lần lượt là $x = -1$ và $x = 1$, đây chính là hai cận của tích phân.
    Diện tích hình phẳng là:
    $
      S = integral_(-1)^1 |x^2 - (2 - x^2)| d x = integral_(-1)^1 |2x^2 - 2| d x
    $
    Trên khoảng $(-1, 1)$, ta có $2x^2 - 2 < 0$ nên $|2x^2 - 2| = 2 - 2x^2$.
    Tính tích phân:
    $
      S = integral_(-1)^1 (2 - 2x^2) d x = lr[ 2x - frac(2x^3, 3) ]_(-1)^1
    $
    Thế cận vào biểu thức:
    $
      S = lr( 2(1) - frac(2(1)^3, 3) ) - lr( 2(-1) - frac(2(-1)^3, 3) ) = lr( 2 - frac(2, 3) ) - lr( -2 + frac(2, 3) )
    $
    $
      S = frac(4, 3) - lr( -frac(4, 3) ) = frac(8, 3)
    $
    Vậy diện tích hình phẳng bằng $frac(8, 3)$ (đơn vị diện tích).
  ],
  theme-color: c-p0,
)

#vd(
  [Tính diện tích $S$ của hình phẳng giới hạn bởi đồ thị của hai parabol $y = x^2 - 2x$ và $y = -x^2 + 4$.],
  loigiai: [
    - Giải phương trình hoành độ giao điểm của hai parabol:
      $ x^2 - 2x = -x^2 + 4  <=>  2x^2 - 2x - 4 = 0  <=>  x^2 - x - 2 = 0  <=>  [ x = -1 ; x = 2 ] $
    - Vậy hai parabol giao nhau tại hai điểm có hoành độ $x = -1$ và $x = 2$.
    - Diện tích hình phẳng giới hạn bởi hai parabol là:
      $ S = integral_(-1)^2 |(x^2 - 2x) - (-x^2 + 4)| d x = integral_(-1)^2 |2x^2 - 2x - 4| d x $
    - Trên khoảng $(-1; 2)$, ta thấy biểu thức $2x^2 - 2x - 4 < 0$. Do đó:
      $ |2x^2 - 2x - 4| = -2x^2 + 2x + 4 $
    - Tính tích phân:
      $ S = integral_(-1)^2 (-2x^2 + 2x + 4) d x = lr[ -frac(2x^3, 3) + x^2 + 4x ]_(-1)^2 $
      - Thế cận trên $x = 2$: $F(2) = -frac(16, 3) + 4 + 8 = frac(20, 3)$.
      - Thế cận dưới $x = -1$: $F(-1) = frac(2, 3) + 1 - 4 = -frac(7, 3)$.
      - Suy ra $S = F(2) - F(-1) = frac(20, 3) - lr( -frac(7, 3) ) = 9$.
    - Vậy diện tích hình phẳng bằng $9$ (đơn vị diện tích).
  ],
  theme-color: c-p0,
)

#topic([Tính thể tích hình khối thuần túy], prefix: "Chủ đề", theme-color: c-p0)

#dang([Tính thể tích vật thể bằng phương pháp thiết diện cắt], theme-color: c-p0)

#vd(
  [Tính thể tích vật thể giới hạn bởi hai mặt phẳng $x = 0$ và $x = 3$, biết rằng thiết diện của vật thể cắt bởi mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ $x$ ($0 <= x <= 3$) là một hình chữ nhật có kích thước tương ứng là $x$ và $sqrt(9 - x^2)$.],
  loigiai: [
    Diện tích thiết diện tại vị trí hoành độ $x$ là diện tích hình chữ nhật:
    $
      S(x) = x dot sqrt(9 - x^2)
    $
    Thể tích vật thể được tính theo công thức tích phân:
    $
      V = integral_0^3 S(x) d x = integral_0^3 x sqrt(9 - x^2) d x
    $
    Để tính tích phân này bằng nguyên hàm (không đổi biến số phức tạp), ta nhận thấy:
    $
      (9 - x^2)^(3/2) " có đạo hàm là " 3/2 (9 - x^2)^(1/2) dot (-2x) = -3x sqrt(9 - x^2)
    $
    Từ đó suy ra nguyên hàm của $x sqrt(9 - x^2)$ là $-frac(1, 3) (9 - x^2)^(3/2) = -frac(1, 3) sqrt((9 - x^2)^3)$.
    Áp dụng công thức Newton-Leibniz:
    $
      V = lr[ -frac(1, 3) (9 - x^2)^(3/2) ]_0^3 = lr( -frac(1, 3) (9 - 3^2)^(3/2) ) - lr( -frac(1, 3) (9 - 0^2)^(3/2) )
    $
    $
      V = 0 - lr( -frac(1, 3) dot 9^(3/2) ) = frac(1, 3) dot 27 = 9
    $
    Vậy thể tích vật thể bằng $9$.
  ],
  theme-color: c-p0,
)

#vd(
  [Một vật thể có đáy là hình tròn giới hạn bởi đường tròn $x^2 + y^2 = 4$. Thiết diện của vật thể cắt bởi mặt phẳng vuông góc với trục $O x$ tại hoành độ $x$ (với $-2 <= x <= 2$) là một hình vuông. Tính thể tích $V$ của vật thể đó.],
  loigiai: [
    - Với mỗi hoành độ $x in [-2; 2]$, thiết diện cắt vật thể vuông góc với trục $O x$ cắt đáy hình tròn tạo thành một đoạn thẳng có độ dài bằng khoảng cách giữa hai nửa đường tròn trên và dưới:
      $ y = sqrt(4 - x^2)  wide "và" wide y = -sqrt(4 - x^2) $
    - Độ dài đoạn thiết diện đáy này là:
      $ d = sqrt(4 - x^2) - lr( -sqrt(4 - x^2) ) = 2sqrt(4 - x^2) $
    - Vì thiết diện cắt là một hình vuông nên cạnh của hình vuông thiết diện đúng bằng độ dài đoạn đáy này. Do đó, diện tích thiết diện tại điểm có hoành độ $x$ là:
      $ S(x) = d^2 = lr( 2sqrt(4 - x^2) )^2 = 4(4 - x^2) = 16 - 4x^2 $
    - Thể tích của vật thể được tính bằng tích phân:
      $ V = integral_(-2)^2 S(x) d x = integral_(-2)^2 (16 - 4x^2) d x $
    - Tính tích phân:
      $ V = lr[ 16x - frac(4x^3, 3) ]_(-2)^2 $
      - Thế cận trên $x = 2$: $F(2) = 32 - frac(32, 3) = frac(64, 3)$.
      - Thế cận dưới $x = -2$: $F(-2) = -32 - lr( -frac(32, 3) ) = -frac(64, 3)$.
      - Suy ra $V = F(2) - F(-2) = frac(64, 3) - lr( -frac(64, 3) ) = frac(128, 3)$.
    - Vậy thể tích vật thể bằng $frac(128, 3)$.
  ],
  theme-color: c-p0,
)

#dang([Tính thể tích khối tròn xoay khi quay quanh trục hoành], theme-color: c-p0)

#vd(
  [Tính thể tích $V$ của khối tròn xoay tạo thành khi quay hình phẳng giới hạn bởi đường cong $y = sqrt(x) e^x$, trục hoành $y = 0$, và hai đường thẳng $x = 0, x = 1$ quanh trục hoành $O x$.],
  loigiai: [
    Áp dụng công thức tính thể tích khối tròn xoay quay quanh trục hoành $O x$:
    $
      V = pi integral_0^1 f^2(x) d x = pi integral_0^1 lr( sqrt(x) e^x )^2 d x = pi integral_0^1 x e^(2x) d x
    $
    Ta cần tính nguyên hàm của hàm số $g(x) = x e^(2x)$. Ta dự đoán nguyên hàm có dạng $G(x) = (A x + B) e^(2x)$.
    Đạo hàm thử để tìm hệ số $A, B$:
    $
      G'(x) = A e^(2x) + (A x + B) dot 2 e^(2x) = (2A x + A + 2B) e^(2x)
    $
    Đồng nhất hệ số với biểu thức $x e^(2x)$, ta thu được:
    $
      2A = 1  =>  A = frac(1, 2) \
      A + 2B = 0  =>  2B = -frac(1, 2)  =>  B = -frac(1, 4)
    $
    Vậy một nguyên hàm là $G(x) = lr( frac(1, 2) x - frac(1, 4) ) e^(2x)$.
    Tính tích phân:
    $
      V = pi lr[ lr( frac(x, 2) - frac(1, 4) ) e^(2x) ]_0^1 = pi lr( lr( frac(1, 2) - frac(1, 4) ) e^2 - lr( 0 - frac(1, 4) ) e^0 )
    $
    $
      V = pi lr( frac(1, 4) e^2 + frac(1, 4) ) = frac(pi, 4) (e^2 + 1)
    $
    Vậy thể tích khối tròn xoay bằng $frac(pi(e^2 + 1), 4)$.
  ],
  theme-color: c-p0,
)

#vd(
  [Cho hình phẳng $(H)$ giới hạn bởi đường cong $y = sqrt(x)$, parabol $y = x^2$ và hai đường thẳng $x = 0, x = 1$. Tính thể tích $V$ của khối tròn xoay sinh ra khi quay hình phẳng $(H)$ quanh trục hoành $O x$.],
  loigiai: [
    - Ta thấy trên đoạn $[0; 1]$, hai hàm số $y = sqrt(x)$ và $y = x^2$ đều liên tục, không âm và thỏa mãn $sqrt(x) >= x^2$.
    - Khi quay hình phẳng $(H)$ giới hạn bởi hai đường cong này quanh trục hoành $O x$, thể tích khối tròn xoay được tính theo công thức:
      $ V = pi integral_0^1 |f^2(x) - g^2(x)| d x = pi integral_0^1 lr( lr(sqrt(x))^2 - (x^2)^2 ) d x = pi integral_0^1 (x - x^4) d x $
    - Tính tích phân:
      $ V = pi lr[ frac(x^2, 2) - frac(x^5, 5) ]_0^1 = pi lr( frac(1, 2) - frac(1, 5) ) = frac(3pi, 10) $
    - Vậy thể tích khối tròn xoay bằng $frac(3pi, 10)$.
  ],
  theme-color: c-p0,
)

#bt-header(c-p0)

#q-label("PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn", c-p0)

#resetexamstate()

#tn(
  [Diện tích hình phẳng giới hạn bởi đồ thị hàm số $y = x^2 - x$, trục hoành $y = 0$, hai đường thẳng $x = 0$ và $x = 2$ được tính theo công thức nào dưới đây?],
  (
    [$integral_0^2 (x^2 - x) d x$],
    [$integral_0^1 (x^2 - x) d x + integral_1^2 (x - x^2) d x$],
    True([$integral_0^1 (x - x^2) d x + integral_1^2 (x^2 - x) d x$]),
    [$integral_0^2 (x - x^2) d x$],
  ),
  loigiai: [
    Chọn *C*.
    Xét dấu $f(x) = x^2 - x$: phương trình $x^2 - x = 0$ có nghiệm $x = 0$ và $x = 1$.
    - Trên khoảng $(0, 1)$, ta có $x^2 - x < 0$ nên $|x^2 - x| = x - x^2$.
    - Trên khoảng $(1, 2)$, ta có $x^2 - x > 0$ nên $|x^2 - x| = x^2 - x$.
    Do đó:
    $
      S = integral_0^2 |x^2 - x| d x = integral_0^1 (x - x^2) d x + integral_1^2 (x^2 - x) d x
    $
  ],
)

#tn(
  [Diện tích hình phẳng giới hạn bởi hai đường cong $y = x^3 - x$ và $y = x - x^2$ là:],
  (
    True([$frac(37, 12)$]),
    [$frac(9, 4)$],
    [$frac(8, 3)$],
    [$frac(5, 12)$],
  ),
  loigiai: [
    Chọn *A*.
    Giải phương trình hoành độ giao điểm:
    $
      x^3 - x = x - x^2  <=>  x^3 + x^2 - 2x = 0  <=>  x(x^2 + x - 2) = 0
    $
    Phương trình có 3 nghiệm phân biệt là $x = -2, x = 0, x = 1$.
    Diện tích phẳng là:
    $
      S = integral_(-2)^1 |x^3 + x^2 - 2x| d x = integral_(-2)^0 (x^3 + x^2 - 2x) d x + integral_0^1 (2x - x^2 - x^3) d x
    $
    Tính từng tích phân:
    - $integral_(-2)^0 (x^3 + x^2 - 2x) d x = lr[ frac(x^4, 4) + frac(x^3, 3) - x^2 ]_(-2)^0 = 0 - lr( 4 - frac(8, 3) - 4 ) = frac(8, 3)$.
    - $integral_0^1 (2x - x^2 - x^3) d x = lr[ x^2 - frac(x^3, 3) - frac(x^4, 4) ]_0^1 = 1 - frac(1, 3) - frac(1, 4) = frac(5, 12)$.
    Cộng lại:
    $
      S = frac(8, 3) + frac(5, 12) = frac(32 + 5, 12) = frac(37, 12)
    $
  ],
)

#tn(
  [Thể tích khối tròn xoay tạo thành khi quay hình phẳng giới hạn bởi $y = sin x$, trục hoành $y = 0$, $x = 0$ và $x = pi$ quanh trục hoành $O x$ là:],
  (
    [$2 pi$],
    True([$frac(pi^2, 2)$]),
    [$frac(pi, 2)$],
    [$pi^2$],
  ),
  loigiai: [
    Chọn *B*.
    Công thức tính thể tích khối tròn xoay:
    $
      V = pi integral_0^pi sin^2 x d x
    $
    Sử dụng công thức hạ bậc lượng giác: $sin^2 x = frac(1 - cos(2x), 2)$.
    $
      V = pi integral_0^pi frac(1 - cos(2x), 2) d x = frac(pi, 2) lr[ x - frac(1, 2) sin(2x) ]_0^pi = frac(pi, 2) (pi - 0) = frac(pi^2, 2)
    $
  ],
)

#tn(
  [Một vật thể nằm giữa hai mặt phẳng vuông góc trục $O x$ tại $x = 0$ và $x = 2$. Thiết diện của vật thể khi cắt bởi mặt phẳng vuông góc trục $O x$ tại điểm có hoành độ $x$ ($0 <= x <= 2$) là một tam giác đều có cạnh bằng $x sqrt(2)$. Thể tích vật thể đó là:],
  (
    True([$frac(4 sqrt(3), 3)$]),
    [$frac(8 sqrt(3), 3)$],
    [$frac(2 sqrt(3), 3)$],
    [$2 sqrt(3)$],
  ),
  loigiai: [
    Chọn *A*.
    Diện tích của tam giác đều cạnh $s = x sqrt(2)$ là:
    $
      S(x) = frac(sqrt(3), 4) s^2 = frac(sqrt(3), 4) (x sqrt(2))^2 = frac(sqrt(3), 4) (2x^2) = frac(x^2 sqrt(3), 2)
    $
    Thể tích vật thể là:
    $
      V = integral_0^2 S(x) d x = integral_0^2 frac(x^2 sqrt(3), 2) d x = frac(sqrt(3), 2) lr[ frac(x^3, 3) ]_0^2 = frac(sqrt(3), 2) dot frac(8, 3) = frac(4 sqrt(3), 3)
    $
  ],
)

#tn(
  [Tính thể tích $V$ của khối tròn xoay tạo thành khi quay hình phẳng giới hạn bởi đồ thị hàm số $y = frac(1, x)$, trục hoành $y = 0$, và hai đường thẳng $x = 1, x = 3$ quanh trục hoành $O x$.],
  (
    True([$frac(2 pi, 3)$]),
    [$pi ln 3$],
    [$frac(pi, 3)$],
    [$frac(3 pi, 4)$],
  ),
  loigiai: [
    Chọn *A*.
    Áp dụng công thức tính thể tích tròn xoay:
    $
      V = pi integral_1^3 lr( frac(1, x) )^2 d x = pi integral_1^3 frac(1, x^2) d x = pi lr[ -frac(1, x) ]_1^3 = pi lr( -frac(1, 3) - (-1) ) = frac(2 pi, 3)
    $
  ],
)

#q-label("PHẦN II. Câu trắc nghiệm đúng sai", c-p0)

#ds(
  [Cho hình phẳng $(H)$ giới hạn bởi đồ thị hàm số $y = x^2 - 2x$ và đường thẳng $y = 3$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Hoành độ giao điểm của hai đồ thị là nghiệm của phương trình $x^2 - 2x - 3 = 0$.]),
    True([Hai giao điểm có hoành độ lần lượt là $x = -1$ và $x = 3$.]),
    [Trên đoạn $[-1, 3]$, đồ thị đường thẳng nằm phía dưới đồ thị parabol.],
    True([Diện tích hình phẳng giới hạn bởi $(H)$ có giá trị bằng $frac(32, 3)$.]),
  ),
  loigiai: [
    - a) *Đúng*. Phương trình hoành độ giao điểm: $x^2 - 2x = 3 <=> x^2 - 2x - 3 = 0$.
    - b) *Đúng*. Nghiệm của phương trình $x^2 - 2x - 3 = 0$ là $x = -1$ và $x = 3$.
    - c) *Sai*. Trên khoảng $(-1, 3)$, với $x = 0$, ta có đường thẳng $y = 3$ và parabol $y = 0$, do đó đường thẳng nằm phía trên parabol.
    - d) *Đúng*. Diện tích hình phẳng:
      $
        S = integral_(-1)^3 |3 - (x^2 - 2x)| d x = integral_(-1)^3 (3 + 2x - x^2) d x
      $
      $
        S = lr[ 3x + x^2 - frac(x^3, 3) ]_(-1)^3 = lr( 9 + 9 - 9 ) - lr( -3 + 1 - (-frac(1, 3)) ) = 9 - lr( -2 + frac(1, 3) ) = 9 - lr( -frac(5, 3) ) = frac(32, 3).
      $
  ],
)

#ds(
  [Cho hình phẳng giới hạn bởi đường cong $y = x e^x$, trục hoành $y = 0$, đường thẳng $x = 0$ và đường thẳng $x = 1$. Gọi $V$ là thể tích của khối tròn xoay thu được khi quay hình phẳng đó quanh trục hoành. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Thể tích $V$ được tính bởi công thức $V = pi integral_0^1 x^2 e^(2x) d x$.]),
    True([Hàm số $F(x) = lr( frac(x^2, 2) - frac(x, 2) + frac(1, 4) ) e^(2x)$ có đạo hàm là $F'(x) = x^2 e^(2x)$.]),
    [Một nguyên hàm của $f(x) = x^2 e^(2x)$ là $F(x) = lr( frac(x^2 - x + 1, 2) ) e^(2x)$.],
    True([Giá trị thể tích $V = frac(pi(e^2 - 1), 4)$.]),
  ),
  loigiai: [
    - a) *Đúng*. Công thức thể tích: $V = pi integral_0^1 f^2(x) d x = pi integral_0^1 (x e^x)^2 d x = pi integral_0^1 x^2 e^(2x) d x$.
    - b) *Đúng*. Đạo hàm của $F(x)$ là:
      $
        F'(x) = lr( x - frac(1, 2) ) e^(2x) + lr( frac(x^2, 2) - frac(x, 2) + frac(1, 4) ) dot 2 e^(2x) = lr( x - frac(1, 2) + x^2 - x + frac(1, 2) ) e^(2x) = x^2 e^(2x).
      $
    - c) *Sai*. Quy đồng mẫu số của $F(x)$ ở câu b), ta có một nguyên hàm đúng là $frac(2x^2 - 2x + 1, 4) e^(2x)$, khác với biểu thức ở câu c).
    - d) *Đúng*. Thế cận từ $0$ đến $1$ vào nguyên hàm $F(x)$:
      $
        V = pi lr[ frac(2x^2 - 2x + 1, 4) e^(2x) ]_0^1 = pi lr( frac(2(1)^2 - 2(1) + 1, 4) e^2 - frac(2(0)^2 - 2(0) + 1, 4) e^0 )
      $
      $
        V = pi lr( frac(1, 4) e^2 - frac(1, 4) ) = frac(pi(e^2 - 1), 4).
      $
  ],
)

#q-label("PHẦN III. Câu trắc nghiệm trả lời ngắn", c-p0)

#tln(
  [Tính diện tích hình phẳng giới hạn bởi đường cong $y = x^3 - 3x^2$ và đường thẳng $y = -4$.],
  [6.75],
  loigiai: [
    Giải phương trình hoành độ giao điểm:
    $
      x^3 - 3x^2 = -4  <=>  x^3 - 3x^2 + 4 = 0  <=>  (x + 1)(x - 2)^2 = 0
    $
    Nghiệm của phương trình là $x = -1$ và $x = 2$.
    Diện tích phẳng cần tính là:
    $
      S = integral_(-1)^2 |x^3 - 3x^2 + 4| d x
    $
    Trên khoảng $(-1, 2)$, ta có $x^3 - 3x^2 + 4 >= 0$, do đó:
    $
      S = integral_(-1)^2 (x^3 - 3x^2 + 4) d x = lr[ frac(x^4, 4) - x^3 + 4x ]_(-1)^2
    $
    Thế cận:
    - Cận trên $x = 2$: $frac(2^4, 4) - 2^3 + 4(2) = 4 - 8 + 8 = 4$.
    - Cận dưới $x = -1$: $frac{(-1)^4, 4) - (-1)^3 + 4(-1) = frac(1, 4) + 1 - 4 = -frac(11, 4) = -2.75$.
    $
      S = 4 - (-2.75) = 6.75
    $
  ],
)

#tln(
  [Tính thể tích $V$ của vật thể giới hạn bởi hai mặt phẳng $x = 1$ và $x = e$, biết rằng thiết diện của vật thể vuông góc với trục $O x$ tại hoành độ $x$ ($1 <= x <= e$) là một hình vuông có diện tích là $S(x) = x^2 ln x$. (Làm tròn kết quả đến hàng phần mười).],
  [4.6],
  loigiai: [
    Công thức tính thể tích vật thể:
    $
      V = integral_1^e S(x) d x = integral_1^e x^2 ln x d x
    $
    Để tìm nguyên hàm của $x^2 ln x$, ta phỏng đoán nguyên hàm có dạng $F(x) = x^3 (A ln x + B)$.
    Đạo hàm để đồng nhất hệ số:
    $
      F'(x) = 3x^2 (A ln x + B) + x^3 dot frac(A, x) = 3A x^2 ln x + (3B + A) x^2
    $
    Đồng nhất hệ số với $x^2 ln x$, ta có:
    $
      3A = 1  =>  A = frac(1, 3) \
      3B + A = 0  =>  3B = -frac(1, 3)  =>  B = -frac(1, 9)
    $
    Họ nguyên hàm là $F(x) = x^3 lr( frac(1, 3) ln x - frac(1, 9) )$.
    Tính tích phân thế cận:
    $
      V = lr[ x^3 lr( frac(1, 3) ln x - frac(1, 9) ) ]_1^e = e^3 lr( frac(1, 3) ln e - frac(1, 9) ) - 1^3 lr( 0 - frac(1, 9) )
    $
    $
      V = e^3 lr( frac(2, 9) ) + frac(1, 9) = frac(2e^3 + 1, 9) approx 4.57
    $
    Làm tròn đến hàng phần mười, ta thu được thể tích vật thể bằng *4.6*.
  ],
)

#tln(
  [Một quả dưa hấu có dạng khối tròn xoay được tạo thành khi quay elip có phương trình $frac(x^2, 16) + y^2 = 1$ quanh trục hoành $O x$. Tính thể tích $V$ của quả dưa hấu đó (làm tròn kết quả đến hàng phần mười).],
  [16.8],
  loigiai: [
    Phương trình elip: $frac(x^2, 16) + y^2 = 1 => y^2 = 1 - frac(x^2, 16)$.
    Hình phẳng giới hạn bởi elip quay quanh trục hoành có cận chạy từ đỉnh bên trái sang đỉnh bên phải của elip trên trục hoành, tức là từ $x = -4$ đến $x = 4$.
    Thể tích khối tròn xoay tạo thành là:
    $
      V = pi integral_(-4)^4 y^2 d x = pi integral_(-4)^4 lr( 1 - frac(x^2, 16) ) d x
    $
    Vì hàm số dưới dấu tích phân là hàm chẵn nên:
    $
      V = 2 pi integral_0^4 lr( 1 - frac(x^2, 16) ) d x = 2 pi lr[ x - frac(x^3, 48) ]_0^4 = 2 pi lr( 4 - frac(64, 48) )
    $
    $
      V = 2 pi lr( 4 - frac(4, 3) ) = 2 pi dot frac(8, 3) = frac(16 pi, 3) approx 16.755
    $
    Làm tròn đến hàng phần mười, ta thu được thể tích quả dưa hấu bằng *16.8*.
  ],
)

#tln(
  [Cho hình phẳng giới hạn bởi đồ thị hai hàm số $y = x^2$ và $y = 2x - x^2$. Gọi diện tích hình phẳng này là $S$. Tính giá trị của biểu thức $K = 3S$.],
  [1],
  loigiai: [
    - Giải phương trình hoành độ giao điểm:
      $ x^2 = 2x - x^2  <=>  2x^2 - 2x = 0  <=>  2x(x - 1) = 0  <=>  [ x = 0 ; x = 1 ] $
    - Trên đoạn $[0; 1]$, ta có $2x - x^2 >= x^2$. Diện tích hình phẳng là:
      $ S = integral_0^1 lr( (2x - x^2) - x^2 ) d x = integral_0^1 (2x - 2x^2) d x $
    - Tính tích phân:
      $ S = lr[ x^2 - frac(2x^3, 3) ]_0^1 = 1 - frac(2, 3) = frac(1, 3) $
    - Vậy $K = 3S = 3 dot frac(1, 3) = 1$.
  ],
)

#tln(
  [Một vật thể có đáy là hình tròn giới hạn bởi đường tròn $x^2 + y^2 = 1$. Thiết diện của vật thể cắt bởi mặt phẳng vuông góc với trục $O x$ tại hoành độ $x$ (với $-1 <= x <= 1$) là một tam giác vuông cân có cạnh huyền nằm trên mặt đáy. Gọi $V$ là thể tích của vật thể đó. Tính giá trị của biểu thức $P = 3V$.],
  [4],
  loigiai: [
    - Với mỗi hoành độ $x in [-1; 1]$, đoạn thiết diện ở đáy có chiều dài bằng:
      $ d = 2sqrt(1 - x^2) $
    - Thiết diện cắt là một tam giác vuông cân nhận đoạn đáy này làm cạnh huyền. Chiều cao ứng với cạnh huyền là $h = frac(d, 2) = sqrt(1 - x^2)$.
    - Diện tích thiết diện tam giác vuông cân tại vị trí $x$ là:
      $ S(x) = frac(1, 2) dot d dot h = frac(1, 2) dot 2sqrt(1 - x^2) dot sqrt(1 - x^2) = 1 - x^2 $
    - Thể tích vật thể là:
      $ V = integral_(-1)^1 S(x) d x = integral_(-1)^1 (1 - x^2) d x = 2 integral_0^1 (1 - x^2) d x $
    - Tính tích phân:
      $ V = 2 lr[ x - frac(x^3, 3) ]_0^1 = 2 lr( 1 - frac(1, 3) ) = frac(4, 3) $
    - Vậy $P = 3V = 3 dot frac(4, 3) = 4$.
  ],
)

#tln(
  [Cho hình phẳng giới hạn bởi đường thẳng $y = x$ và parabol $y = x^2$. Tính thể tích $V$ của khối tròn xoay thu được khi quay hình phẳng đó quanh trục hoành. Tìm giá trị của biểu thức $Q = frac(15 V, pi)$.],
  [2],
  loigiai: [
    - Phương trình hoành độ giao điểm: $x^2 = x <=> [ x = 0 ; x = 1 ]$.
    - Trên đoạn $[0; 1]$, ta có $x >= x^2 >= 0$. Thể tích khối tròn xoay được tính theo công thức:
      $ V = pi integral_0^1 lr( x^2 - (x^2)^2 ) d x = pi integral_0^1 (x^2 - x^4) d x $
    - Tính tích phân:
      $ V = pi lr[ frac(x^3, 3) - frac(x^5, 5) ]_0^1 = pi lr( frac(1, 3) - frac(1, 5) ) = frac(2pi, 15) $
    - Vậy $Q = frac(15 V, pi) = frac(15, pi) dot frac(2pi, 15) = 2$.
  ],
)
