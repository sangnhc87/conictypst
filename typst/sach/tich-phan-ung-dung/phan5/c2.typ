#import "../_config.typ": *

#chapter([Khối tròn xoay có phần rỗng], theme-color: c-p5)

#phuongphap(theme-color: c-p5)[
  *Phương pháp vòng rỗng (Washer Method):*
  Khi quay một hình phẳng giới hạn bởi hai đường cong $y = f(x)$ (biên ngoài) và $y = g(x)$ (biên trong) với $f(x) >= g(x) >= 0$ quanh trục hoành $O x$ trên khoảng $[a, b]$:
  - Thiết diện cắt vuông góc với trục $O x$ tại hoành độ $x$ là một hình vành khăn (hình vòng rỗng) có bán kính ngoài $R(x) = f(x)$ và bán kính trong $r(x) = g(x)$.
  - Diện tích thiết diện ngang là: $A(x) = pi [R^2(x) - r^2(x)] = pi [f^2(x) - g^2(x)]$.
  - Thể tích của khối tròn xoay rỗng tạo thành là:
    $
      V = pi integral_a^b [f^2(x) - g^2(x)] d x
    
    $

  *Ứng dụng kỹ thuật:*
  Phương pháp này được dùng để tính toán lượng vật liệu cần thiết để đúc các đường ống dẫn có độ dày thành ống biến thiên, chế tạo các loại bình thủy tinh giữ nhiệt hai lớp (lớp vỏ chân không), hoặc tiện các chi tiết rỗng đầu như đai ốc, vòng đệm.
]

#topic([Đường ống và Ống bọc cách nhiệt], prefix: "Bài", theme-color: c-p5)

#dang([Thể tích kim loại của đường ống tròn xoay], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  Khi tính thể tích vật liệu đúc ống nước hoặc ống dẫn có bán kính ngoài $r_{"ngoài"}(x)$ và bán kính trong $r_{"trong"}(x)$ thay đổi dọc theo chiều dài của ống $x in [0; L]$:
  $
    V = pi integral_0^L ([r_{"ngoài"}(x)]^2 - [r_{"trong"}(x)]^2) d x
  
  $
]

#vd(
  [Một đoạn ống nước bằng nhựa PVC dài 1 m ($100$ cm) có bán kính lỗ rỗng bên trong không đổi là $r_{"trong"}(x) = 2$ cm, còn bán kính ngoài của ống tăng dần theo chiều dài được mô tả bởi hàm số $r_{"ngoài"}(x) = 2 + 0.1x$ (cm), với $x$ (cm) là khoảng cách đo từ đầu nhỏ đến đầu lớn của ống ($x in [0; 100]$). Tính thể tích nguyên liệu nhựa PVC cần dùng để đúc đoạn ống nước đó (lấy kết quả chính xác theo $pi$).],
  loigiai: [
    Thể tích nguyên liệu nhựa PVC cần dùng bằng thể tích khối tròn xoay rỗng tạo thành khi quay vùng phẳng kẹp giữa hai đường bán kính ngoài và trong quanh trục $O x$ trên khoảng từ $x = 0$ đến $x = 100$ cm:
    $
      V = pi integral_0^(100) lr( [r_{"ngoài"}(x)]^2 - [r_{"trong"}(x)]^2 ) d x
    
    $
    Thế các biểu thức bán kính vào tích phân:
    $
      V = pi integral_0^(100) lr( (2 + 0.1x)^2 - 2^2 ) d x \
      V = pi integral_0^(100) lr( 4 + 0.4x + 0.01x^2 - 4 ) d x \
      V = pi integral_0^(100) lr( 0.4x + 0.01x^2 ) d x
    
    $
    Tìm nguyên hàm của đa thức đơn giản:
    $
      V = pi lr[ 0.2 x^2 + frac(0.01, 3) x^3 ]_0^(100)
    
    $
    Thế các cận $0$ và $100$ vào biểu thức:
    $
      V = pi lr[ lr( 0.2 dot (100)^2 + frac(0.01, 3) dot (100)^3 ) - 0 ] \
      V = pi lr[ 0.2 dot 10000 + frac(0.01, 3) dot 1000000 ] \
      V = pi lr[ 2000 + frac(10000, 3) ] = frac(16000 pi, 3) " (cm"^3")"
    
    $
    Vậy thể tích vật liệu nhựa PVC cần dùng để đúc đoạn ống là $frac(16000pi, 3)$ $"cm"^3$ (xấp xỉ $16755.16$ $"cm"^3$).
  ],
  theme-color: c-p5,
)

#dang([Bề mặt xuyến (torus) — Nhẫn kim loại], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  Khối xuyến (Torus) tạo thành khi quay một hình tròn bán kính $r$ quanh một trục nằm ngoài hình tròn đó ở khoảng cách $R$ ($R > r$). Thể tích của khối xuyến bằng tích phân hoặc tính bằng công thức:
  $
    V = 2 pi^2 R r^2
  
  $
]

#topic([Cốc hai lớp và Bình hút chân không], prefix: "Bài", theme-color: c-p5)

#dang([Quay vùng giữa hai đường cong, bán kính phụ thuộc vào $x$], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  Khi tính thể tích lớp vỏ kính của bình hút chân không hoặc cốc thủy tinh hai lớp:
  - Xác định phương trình đường biên ngoài $f(x)$ và đường biên trong $g(x)$.
  - Tính tích phân hiệu bình phương: $V = pi integral_a^b [f^2(x) - g^2(x)] d x$.
]

#vd(
  [Một chiếc ly thủy tinh hai lớp (lớp giữa là chân không để cách nhiệt) được chế tạo bằng cách quay vùng phẳng giới hạn bởi hai đường cong biên dạng quanh trục quay $O x$:
    - Đường biên ngoài: $y = sqrt{x}$ (cm).
    - Đường biên trong: $y = 0.8sqrt{x}$ (cm).
    Giới hạn từ đáy ly $x = 0$ đến miệng ly $x = 9$ cm. Tính thể tích lớp thủy tinh dùng để làm chiếc ly đó (làm tròn kết quả đến hàng phần trăm).],
  loigiai: [
    Thể tích phần thủy tinh làm ly bằng thể tích khối tròn xoay rỗng tạo thành khi quay hình phẳng giới hạn bởi đường biên ngoài $y = sqrt{x}$, đường biên trong $y = 0.8sqrt{x}$ và đường thẳng đứng $x = 9$ quanh trục $O x$.

    Áp dụng công thức tính thể tích vòng rỗng:
    $
      V = pi integral_0^9 lr( [y_{"ngoài"}(x)]^2 - [y_{"trong"}(x)]^2 ) d x \
      V = pi integral_0^9 lr( (sqrt{x})^2 - (0.8sqrt{x})^2 ) d x \
      V = pi integral_0^9 lr( x - 0.64x ) d x \
      V = pi integral_0^9 0.36x d x
    
    $
    Tìm nguyên hàm và thế cận:
    $
      V = pi lr[ 0.18 x^2 ]_0^9 = pi lr[ 0.18 dot 9^2 - 0 ] = 14.58 pi " (cm"^3")"
    
    $
    Tính giá trị xấp xỉ:
    $
      V = 14.58 pi approx 14.58 dot 3.1416 approx 45.80 " (cm"^3")"
    
    $
    Vậy thể tích lớp thủy tinh làm chiếc ly cách nhiệt này khoảng $45.80$ $"cm"^3$.
  ],
  theme-color: c-p5,
)

#dang([Bài toán tổng hợp — Quay quanh trục $y = k$ (không phải $O x$)], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  Khi quay hình phẳng giới hạn bởi $y = f(x)$ quanh trục nằm ngang $y = c$ (không trùng với trục $O x$):
  - Bán kính quay tại hoành độ $x$ là khoảng cách từ điểm trên đồ thị đến trục quay $y = c$, tức là $R(x) = |f(x) - c|$.
  - Công thức thể tích tương ứng:
    $
      V = pi integral_a^b [f(x) - c]^2 d x
    
    $
]
