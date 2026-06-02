#import "../_config.typ": *

#chapter([Quy hoạch Đất đai và Bài toán Chia lô], theme-color: c-p3)

#phuongphap(theme-color: c-p3)[
  *Mô hình hóa mảnh đất:*
  Trong thực tế quy hoạch trắc địa, một khu đất thường được bao quanh bởi các ranh giới tự nhiên (đường cong bờ sông, bờ hồ) và các ranh giới nhân tạo (đường quốc lộ, bờ rào thẳng).
  - Chọn hệ trục tọa độ phù hợp sao cho đường ranh giới thẳng trùng với một trong hai trục tọa độ.
  - Diện tích ranh giới giới hạn bởi đường cong $y = f(x)$ và đường thẳng $y = d$ trên đoạn $[a, b]$ là:
    $
      S = integral_a^b |f(x) - d| d x
    
    $

  *Bài toán phân chia diện tích (chia lô đất):*
  Yêu cầu tìm đường phân chia (đường thẳng đứng $x = c$ hoặc đường nằm ngang $y = k$) chia một khu đất thành hai phần có diện tích bằng nhau (hoặc theo một tỷ lệ $k$ cho trước).
  - *Phương pháp tích phân theo trục $O x$:* Giải phương trình tìm cận $c$:
    $
      integral_a^c f(x) d x = frac(1, 2) integral_a^b f(x) d x
    
    $
  - *Phương pháp tích phân theo trục $O y$ (đối với đường nằm ngang $y = k$):* Đổi vai trò của biến số từ $x$ sang $y$. Tìm ranh giới bên trái $x_1(y)$ và bên phải $x_2(y)$ theo biến $y$:
    $
      S = integral_c^d (x_2(y) - x_1(y)) d y
    
    $
    Khi đó, đường $y = k$ chia đôi diện tích thỏa mãn phương trình:
    $
      integral_c^k (x_2(y) - x_1(y)) d y = frac(S, 2)
    
    $
]

#topic([Mảnh vườn bờ sông và Quốc lộ], prefix: "Bài", theme-color: c-p3)

#dang([Tính diện tích mảnh đất giới hạn bởi bờ sông và đường thẳng], theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  Khi tính diện tích mảnh đất giới hạn bởi bờ sông cong $y = f(x)$ và con đường thẳng $y = d$:
  1. Xác định khoảng khảo sát $[a, b]$ theo trục hoành $O x$.
  2. Xét dấu của $f(x) - d$ trên đoạn $[a, b]$ để phá dấu trị tuyệt đối (đường nào nằm trên thì viết trước).
  3. Tính tích phân xác định để tìm diện tích.
]

#vd(
  [Một mảnh đất xen kẹt giữa bờ một con sông (được mô tả bởi đường cong $y = 0.2 x^2 - 2x + 8$) và một con đường quốc lộ chạy thẳng (được mô tả bởi đường thẳng $y = 2$), giới hạn bởi hai cột mốc $x = 1$ và $x = 5$ (đơn vị trên các trục tọa độ tính bằng kilômét). Tính diện tích mảnh đất đó (đơn vị: $"km"^2$).],
  loigiai: [
    Diện tích mảnh đất giới hạn bởi bờ sông cong $y = 0.2 x^2 - 2x + 8$, đường thẳng $y = 2$ và hai đường thẳng đứng $x = 1$, $x = 5$ là:
    $
      S = integral_1^5 |(0.2 x^2 - 2x + 8) - 2| d x = integral_1^5 |0.2 x^2 - 2x + 6| d x
    
    $
    Ta xét vị trí tương đối của đường cong bờ sông và con đường trên đoạn $[1; 5]$:
    Khảo sát hàm số $g(x) = 0.2 x^2 - 2x + 6$ trên $[1; 5]$.
    Tọa độ đỉnh của parabol $g(x)$ là $x_I = -frac(-2, 2 dot 0.2) = 5$.
    Giá trị của $g(x)$ tại các điểm mốc:
    - Tại $x = 1 => g(1) = 0.2 - 2 + 6 = 4.2 > 0$.
    - Tại $x = 5 => g(5) = 0.2 dot 25 - 10 + 6 = 1 > 0$.
    Vì thế, $g(x) > 0$ với mọi $x in [1; 5]$ (đường cong luôn nằm phía trên con đường quốc lộ).

    Phá dấu trị tuyệt đối của tích phân, ta có:
    $
      S = integral_1^5 (0.2 x^2 - 2x + 6) d x
    
    $
    Tìm nguyên hàm của đa thức:
    $
      S = [ frac(0.2, 3) x^3 - x^2 + 6x ]_1^5 = [ frac(1, 15) x^3 - x^2 + 6x ]_1^5
    
    $
    Thế cận vào biểu thức:
    $
      S = (frac(5^3, 15) - 5^2 + 6 dot 5) - (frac(1^3, 15) - 1^2 + 6 dot 1) \
      S = (frac(125, 15) - 25 + 30) - (frac(1, 15) - 1 + 6) \
      S = (frac(25, 3) + 5) - (frac(1, 15) + 5) = frac(25, 3) - frac(1, 15) = frac(124, 15) approx 8.27 " (km"^2")"
    
    $
    Vậy diện tích mảnh đất đó là $frac(124, 15) approx 8.27$ $"km"^2$.
  ],
  theme-color: c-p3,
)

#dang([Diện tích đất giữa hai đường cong tự nhiên], theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  Đối với mảnh đất kẹp giữa hai đường cong tự nhiên $y = f(x)$ và $y = g(x)$:
  - Tìm hoành độ giao điểm của hai đường bằng cách giải phương trình $f(x) = g(x)$.
  - Tích phân hiệu $|f(x) - g(x)|$ trên khoảng giữa hai giao điểm sẽ cho diện tích mảnh đất.
]

#topic([Chia lô đất — Tìm đường phân chia bằng diện tích], prefix: "Bài", theme-color: c-p3)

#dang([Tìm $k$ sao cho đường thẳng $y = k$ chia đôi vùng diện tích], theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  Đối với bài toán tìm đường nằm ngang $y = k$ chia đôi diện tích vùng $D$ giới hạn bởi $y = f(x)$, trục $O x$, $x=a$, $x=b$:
  - Tính tổng diện tích $S$ của vùng $D$.
  - Biểu diễn các đường ranh giới theo biến $y$ (tức là rút $x$ theo $y$).
  - Thiết lập tích phân theo biến $y$ từ $0$ đến $k$ và đặt bằng $frac(S, 2)$. Giải phương trình đối với ẩn $k$.
]

#vd(
  [Một khu đất công ích có dạng hình phẳng giới hạn bởi đường cong $y = sqrt{x}$, trục hoành $y = 0$ và đường ranh giới thẳng $x = 9$. Chính quyền địa phương muốn đào một mương dẫn nước thẳng nằm ngang có phương trình $y = k$ ($0 < k < 3$) chia khu đất này thành hai phần có diện tích bằng nhau để giao cho hai hộ dân canh tác. Hãy tìm giá trị của $k$ (làm tròn kết quả đến hàng phần trăm).],
  loigiai: [
    *Bước 1:* Tính tổng diện tích $S$ của cả khu đất.
    Khu đất giới hạn bởi $y = sqrt{x}$, $y = 0$, $x = 0$ và $x = 9$.
    $
      S = integral_0^9 sqrt{x} d x = integral_0^9 x^(1/2) d x = [ frac(2, 3) x^(3/2) ]_0^9 = frac(2, 3) dot 9^(3/2) = frac(2, 3) dot 27 = 18
    
    $

    *Bước 2:* Biểu diễn ranh giới theo trục tung $O y$ để tích phân theo $y$.
    - Đường cong $y = sqrt{x} <=> x = y^2$ (đây là ranh giới bên trái của khu đất).
    - Đường thẳng đứng $x = 9$ là ranh giới bên phải của khu đất.
    - Trục hoành $y = 0$ và giá trị lớn nhất của $y$ tại ranh giới phải là $y = sqrt{9} = 3$.
    Với mỗi cao độ $y$ bất kỳ ($0 <= y <= 3$), độ rộng ngang của khu đất là hiệu khoảng cách từ ranh giới phải đến ranh giới trái:
    $
      w(y) = 9 - y^2
    
    $
    Do đó, diện tích phần đất nằm phía dưới đường kênh $y = k$ là tích phân theo $y$ từ $0$ đến $k$:
    $
      S_{"dưới"} = integral_0^k (9 - y^2) d y = [ 9y - frac(y^3, 3) ]_0^k = 9k - frac(k^3, 3)
    
    $

    *Bước 3:* Thiết lập phương trình phân chia bằng diện tích:
    Để đường kênh $y = k$ chia đôi khu đất thì diện tích phần dưới phải bằng một nửa tổng diện tích:
    $
      S_{"dưới"} = frac(S, 2)  wide  <=>  wide  9k - frac(k^3, 3) = frac(18, 2) = 9 \
      <=>  wide  27k - k^3 = 27  wide  <=>  wide  k^3 - 27k + 27 = 0
    
    $
    Khảo sát hàm số $g(k) = k^3 - 27k + 27$ trên khoảng $(0; 3)$:
    - Giải phương trình bậc ba thu được một nghiệm duy nhất thuộc khoảng $(0; 3)$ là:
      $
        k approx 1.04 " (m)"
      
      $
    Vậy đường kênh nằm ngang ở cao độ $y approx 1.04$ m sẽ chia đôi khu đất thành hai phần bằng nhau.
  ],
  theme-color: c-p3,
)
