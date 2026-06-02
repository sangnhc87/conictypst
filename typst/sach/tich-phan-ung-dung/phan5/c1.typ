#import "../_config.typ": *

#chapter([Cơ khí và Gốm sứ — Khối tròn xoay đặc], theme-color: c-p5)

#phuongphap(theme-color: c-p5)[
  *Nguyên lý tạo khối tròn xoay:*
  Cho hình phẳng $D$ giới hạn bởi đường cong $y = f(x)$ liên tục, trục hoành $y = 0$, hai đường thẳng đứng $x = a$ và $x = b$ ($a < b$). Khi quay hình phẳng $D$ quanh trục hoành $O x$, ta thu được một khối tròn xoay đặc có thể tích $V$ được tính bằng:
  $
    V = pi integral_a^b [f(x)]^2 d x
  
  $
  
  *Ứng dụng tiện cơ khí CNC:*
  Trong gia công tiện cơ khí, trục phôi quay quanh trục chính của máy tiện. Mũi dao cắt di chuyển theo đường biên dạng $y = f(x)$ để tạo ra chi tiết có tiết diện tròn xoay.
  - Biên dạng $y = f(x)$ chính là hàm bán kính ngoài của chi tiết tại vị trí $x$.
  - Tính thể tích chi tiết giúp lập kế hoạch nguyên liệu, tính khối lượng thành phẩm (bằng công thức $M = rho dot V$ với $rho$ là khối lượng riêng của vật liệu).
]

#topic([Tiện CNC — Bình lọ — Đầu đạn], prefix: "Bài", theme-color: c-p5)

#dang([Tính thể tích sản phẩm tiện từ biên dạng $y = f(x)$], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  Khi tính thể tích khối tròn xoay đặc xoay quanh trục $O x$:
  1. Xác định giới hạn hành trình tiện từ $x = a$ đến $x = b$.
  2. Xác định phương trình bán kính biên dạng $r(x) = f(x)$.
  3. Khai triển bình phương $[f(x)]^2$ (thường là đa thức bậc cao hoặc căn thức).
  4. Lập và tính tích phân: $V = pi integral_a^b [f(x)]^2 d x$.
]

#vd(
  [Một chi tiết máy làm bằng hợp kim đồng được gia công tiện CNC có hình dạng giống một chiếc cốc. Biên dạng ngoài của chi tiết được mô tả bởi hàm bán kính $r(x) = 0.5 x^2 - 2x + 5$ (đơn vị: cm), với $x in [0; 4]$ (cm) là khoảng cách đo từ đáy chi tiết dọc theo trục quay $O x$. Tính thể tích của chi tiết máy này (lấy kết quả chính xác theo $pi$).],
  loigiai: [
    Thể tích của chi tiết máy là thể tích của khối tròn xoay được tạo thành khi quay hình phẳng giới hạn bởi đường cong $y = 0.5 x^2 - 2x + 5$, trục hoành $O x$ và hai đường thẳng đứng $x = 0$, $x = 4$ quanh trục hoành $O x$:
    $
      V = pi integral_0^4 [r(x)]^2 d x = pi integral_0^4 (0.5 x^2 - 2x + 5)^2 d x
    
    $
    *Bước 1:* Khai triển biểu thức dưới dấu tích phân:
    $
      (0.5 x^2 - 2x + 5)^2 = (0.5 x^2)^2 + (-2x)^2 + 5^2 + 2(0.5 x^2)(-2x) + 2(-2x)(5) + 2(5)(0.5 x^2) \
      = 0.25 x^4 + 4x^2 + 25 - 2x^3 - 20x + 5x^2 \
      = 0.25 x^4 - 2x^3 + 9x^2 - 20x + 25
    
    $
    *Bước 2:* Lập tích phân và tìm nguyên hàm:
    $
      V = pi integral_0^4 (0.25 x^4 - 2x^3 + 9x^2 - 20x + 25) d x \
      V = pi [ 0.05 x^5 - 0.5 x^4 + 3 x^3 - 10 x^2 + 25x ]_0^4
    
    $
    *Bước 3:* Thế các cận vào nguyên hàm:
    $
      V = pi lr[ 0.05 dot 4^5 - 0.5 dot 4^4 + 3 dot 4^3 - 10 dot 4^2 + 25 dot 4 - 0 ] \
      V = pi lr[ 0.05 dot 1024 - 0.5 dot 256 + 3 dot 64 - 10 dot 16 + 100 ] \
      V = pi lr[ 51.2 - 128 + 192 - 160 + 100 ] \
      V = 55.2 pi " (cm"^3")"
    
    $
    Vậy thể tích của chi tiết máy là $55.2 pi$ $"cm"^3$ (xấp xỉ $173.42$ $"cm"^3$).
  ],
  theme-color: c-p5,
)

#dang([Lọ hoa và Bình gốm — Đường cong bậc cao], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  Biên dạng lọ hoa phức tạp có thể được thiết lập bởi các hàm số chứa căn như $y = sqrt{a x + b}$ hoặc các đường cong ghép từ nhiều hàm số khác nhau. Ta tính thể tích bằng cách chia đoạn tích phân thành các khoảng nhỏ tương ứng với từng biên dạng.
]

#topic([Mũi tên lửa và Hình nón tổng quát], prefix: "Bài", theme-color: c-p5)

#dang([Hình nón tổng quát — Biên dạng tuyến tính $y = k x$], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  Khi quay đường thẳng $y = a x$ quanh trục $O x$ trên $[0, H]$, ta tạo được một hình nón có bán kính đáy $R = a H$. Tích phân cho phép chứng minh nhanh chóng công thức thể tích hình nón:
  $
    V = pi integral_0^H (a x)^2 d x = frac(pi a^2 H^3, 3) = frac(pi R^2 H, 3)
  
  $
]

#vd(
  [Phần đầu (mũi) của một tên lửa đẩy nghiên cứu thời tiết có hình dạng khối đặc hình nón có bán kính đường tròn đáy là 3 cm và chiều dài dọc trục đối xứng là 12 cm. Sử dụng phương pháp tích phân, hãy tính thể tích của mũi tên lửa này (lấy kết quả chính xác theo $pi$).],
  loigiai: [
    Thiết lập hệ trục tọa độ $O x y$ sao cho trục quay $O x$ nằm trùng với trục đối xứng của mũi tên lửa đẩy.
    - Đỉnh nón nằm trùng với gốc tọa độ $O(0; 0)$.
    - Chiều dài nón dọc theo trục quay chạy từ $x = 0$ đến $x = 12$ cm.
    - Đường sinh của hình nón là một đường thẳng đi qua gốc tọa độ $O(0; 0)$ và điểm có tọa độ $(12; 3)$ (với bán kính đáy bằng 3 cm ở độ cao $12$ cm).

    Phương trình đường thẳng đó có dạng:
    $
      y = a x  wide  =>  wide  3 = a dot 12  wide  <=>  wide  a = frac(3, 12) = frac(1, 4)
    
    $
    Vậy đường biên dạng là đường thẳng $y = frac(1, 4) x$ với $x in [0; 12]$.

    Khi quay đường thẳng này quanh trục $O x$ từ $0$ đến $12$, thể tích khối nón tròn xoay được tạo thành là:
    $
      V = pi integral_0^(12) [y(x)]^2 d x = pi integral_0^(12) lr( frac(1, 4) x )^2 d x = pi integral_0^(12) frac(1, 16) x^2 d x
    
    $
    Tìm nguyên hàm và thế cận:
    $
      V = pi lr[ frac(x^3, 48) ]_0^(12) = pi lr[ frac(12^3, 48) - 0 ] = pi dot frac(1728, 48) = 36 pi " (cm"^3")"
    
    $
    Vậy thể tích của mũi tên lửa là $36 pi$ $"cm"^3$ (khoảng $113.1$ $"cm"^3$).
  ],
  theme-color: c-p5,
)

#dang([Nửa cầu và Phần cầu cắt bởi hai mặt phẳng], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  Đường tròn $x^2 + y^2 = R^2 => y = sqrt{R^2 - x^2}$ xoay quanh trục $O x$ trên khoảng $[-R; R]$ tạo thành hình cầu thể tích $V = frac(4, 3) pi R^3$. Nếu quay trên khoảng cắt $[a; b]$ (với $-R <= a < b <= R$), ta thu được hình chỏm cầu hoặc viên phân cầu có thể tích:
  $
    V = pi integral_a^b (R^2 - x^2) d x
  
  $
]
