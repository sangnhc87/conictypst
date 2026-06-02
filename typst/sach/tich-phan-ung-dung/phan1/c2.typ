#import "../_config.typ": *

#chapter([Ứng dụng Kinh tế cơ bản], theme-color: c-p1)

#phuongphap(theme-color: c-p1)[
  *Tam giác Kinh tế học vi mô:*
  Chi phí biên $C'(x)$ và tổng chi phí $C(x)$ liên hệ bởi:
  $
    C(x) = C(0) + integral_0^x C'(t) d t
  $
  Doanh thu biên $R'(x)$ và tổng doanh thu $R(x)$ liên hệ bởi (với $R(0) = 0$):
  $
    R(x) = integral_0^x R'(t) d t
  $
  Lợi nhuận $P(x) = R(x) - C(x)$ đạt tối đa tại sản lượng tối ưu $x^*$ thỏa mãn lợi nhuận biên bằng 0:
  $
    P'(x^*) = 0  wide  <=>  wide  R'(x^*) = C'(x^*)
  $
  Tổng lợi nhuận tối đa khi sản xuất đến mức tối ưu $x^*$ là:
  $
    P(x^*) = integral_0^(x^*) (R'(t) - C'(t)) d t - C(0)
  $
]

#topic([Chi phí biên $C'(x)$ và Tổng chi phí $C(x)$], prefix: "Bài", theme-color: c-p1)

#dang([Tìm $C(x)$ từ $C'(x)$ và chi phí cố định], theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  Chi phí cố định (Fixed Cost) $C(0) = C_0$ là chi phí không đổi khi chưa sản xuất sản phẩm nào. Tổng chi phí sản xuất $x$ sản phẩm được xác định bằng cách lấy nguyên hàm của hàm chi phí biên và xác định hằng số tích phân từ chi phí cố định:
  $
    C(x) = integral C'(x) d x = F(x) + C_0  wide  ("với " F(0) = 0)
  $
]

#vd(
  [Chi phí biên để sản xuất ghế gỗ của một cơ sở thủ công mỹ nghệ được mô tả bởi hàm số $C'(x) = 0.3 x^2 - 12x + 200$ (nghìn đồng/chiếc), với $x$ là số ghế sản xuất. Biết chi phí cố định ban đầu của xưởng khi chưa sản xuất sản phẩm nào là $5000$ nghìn đồng. Tính tổng chi phí để cơ sở sản xuất được 20 chiếc ghế gỗ.],
  loigiai: [
    Tổng chi phí $C(x)$ sản xuất $x$ chiếc ghế là một nguyên hàm của chi phí biên:
    $
      C(x) = integral C'(x) d x = integral (0.3 x^2 - 12x + 200) d x
    $
    Áp dụng các công thức nguyên hàm cơ bản đối với hàm đa thức:
    $
      C(x) = 0.3 dot frac(x^3, 3) - 12 dot frac(x^2, 2) + 200x + K = 0.1 x^3 - 6x^2 + 200x + K
    $
    Trong đó $K$ là hằng số tích phân. Theo giả thiết, chi phí cố định ban đầu là:
    $
      C(0) = 5000 " (nghìn đồng)"  wide  =>  wide  K = 5000
    $
    Do đó, công thức xác định tổng chi phí là:
    $
      C(x) = 0.1 x^3 - 6x^2 + 200x + 5000
    $
    Tổng chi phí để sản xuất 20 chiếc ghế là:
    $
      C(20) = 0.1 dot (20)^3 - 6 dot (20)^2 + 200 dot 20 + 5000 \
      C(20) = 0.1 dot 8000 - 6 dot 400 + 4000 + 5000 \
      C(20) = 800 - 2400 + 9000 = 7400 " (nghìn đồng)"
    $
    Vậy tổng chi phí để cơ sở sản xuất được 20 chiếc ghế gỗ là $7400$ nghìn đồng (tức là $7.4$ triệu đồng).
  ],
  theme-color: c-p1,
)

#dang([Tìm sản lượng tối ưu — Cân bằng $R'(x) = C'(x)$], theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  Để tìm sản lượng tối ưu $x^*$ giúp tối đa hóa lợi nhuận, ta giải phương trình $R'(x) = C'(x)$.
  Tổng lợi nhuận thay đổi khi sản lượng tăng từ $x_1$ đến $x_2$ là tích phân của lợi nhuận biên:
  $
    Delta P = integral_(x_1)^(x_2) (R'(x) - C'(x)) d x
  $
]

#topic([Doanh thu biên $R'(x)$ và Thặng dư Sản xuất], prefix: "Bài", theme-color: c-p1)

#dang([Tính thặng dư sản xuất tại mức giá thị trường], theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  Thặng dư sản xuất (Producer Surplus - PS) biểu diễn lợi ích của nhà sản xuất khi bán sản phẩm ở giá cân bằng thị trường $p^*$ thay vì giá họ sẵn sàng bán theo đường cung $p = S(x)$:
  $
    "PS" = integral_0^(x^*) (p^* - S(x)) d x
  
  $
  Với $x^*$ là lượng cung ứng tại mức giá $p^*$ (thỏa mãn $S(x^*) = p^*$).
]

#vd(
  [Doanh thu biên của một cửa hàng bán lẻ quần áo thời trang được xác định bởi $R'(x) = 150 - 2x$ (nghìn đồng/sản phẩm) và chi phí biên để nhập và bày bán sản phẩm là $C'(x) = 50 + x$ (nghìn đồng/sản phẩm), với $x$ là số sản phẩm bán ra. Giả sử chi phí cố định ban đầu bằng 0.
  a) Xác định sản lượng tối ưu $x^*$ để lợi nhuận đạt tối đa.
  b) Tính tổng lợi nhuận tối đa thu được của cửa hàng.],
  loigiai: [
    a) Để lợi nhuận đạt tối đa, lợi nhuận biên phải bằng 0:
    $
      P'(x) = R'(x) - C'(x) = 0  wide  <=>  wide  R'(x) = C'(x) \
      <=> 150 - 2x = 50 + x \
      <=> 3x = 100 \
      <=> x = frac(100, 3) " (sản phẩm)"
    $
    Vậy sản lượng tối ưu là $x^* = 100/3$ (xấp xỉ $33$ sản phẩm).

    b) Vì chi phí cố định bằng 0 ($P(0) = 0$), tổng lợi nhuận tối đa thu được khi sản xuất ở sản lượng tối ưu $x^* = 100/3$ là:
    $
      P(x^*) = integral_0^(100/3) P'(x) d x = integral_0^(100/3) (150 - 2x - (50 + x)) d x \
      P(x^*) = integral_0^(100/3) (100 - 3x) d x
    $
    Tính tích phân:
    $
      P(x^*) = [ 100x - frac(3, 2) x^2 ]_0^(100/3) = 100 dot frac(100, 3) - frac(3, 2) dot (frac(100, 3))^2 - 0 \
      P(x^*) = frac(10000, 3) - frac(3, 2) dot frac(10000, 9) = frac(10000, 3) - frac(10000, 6) = frac(10000, 6) = frac(5000, 3) approx 1667 " (nghìn đồng)"
    $
    Vậy cửa hàng đạt lợi nhuận tối đa xấp xỉ $1667$ nghìn đồng (khoảng $1.67$ triệu đồng).
  ],
  theme-color: c-p1,
)
