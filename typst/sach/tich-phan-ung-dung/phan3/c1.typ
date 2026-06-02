#import "../_config.typ": *

#chapter([Diện tích công trình Kiến trúc lai], theme-color: c-p3)

#phuongphap(theme-color: c-p3)[
  *Ý tưởng chủ đạo:* Nhiều kết cấu kiến trúc hiện đại kết hợp giữa các khối đa giác cơ bản (hình chữ nhật, hình thang, hình tam giác) và các biên dạng cong tự nhiên (đường Parabol, cung tròn, elip).
  Để tính diện tích mặt cắt của những cấu trúc này, ta thực hiện:
  1. Phân chia mặt phẳng thành các phần đơn giản hơn.
  2. Thiết lập hệ trục tọa độ thích hợp sao cho các đường cong có phương trình đơn giản nhất (thường chọn trục đối xứng trùng với trục tung $O y$, mặt đất hoặc dầm ngang làm trục hoành $O x$).
  3. Lập công thức tích phân xác định tính diện tích các phần cong:
     $
       S = integral_a^b (y_{"trên"} - y_{"dưới"}) d x
     
     $
  4. Cộng hoặc trừ các phần diện tích tương ứng để ra diện tích tổng thể hoặc tính toán chi phí vật liệu.
]

#topic([Cổng vòm Parabol và cửa sổ Norman], prefix: "Bài", theme-color: c-p3)

#dang([Tính diện tích cổng vòm — Đường biên dưới là trục $O x$], theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  Khi thiết lập hệ trục tọa độ cho cổng vòm hình Parabol:
  - Chọn đỉnh của cổng nằm trên trục $O y => I(0, h)$ với $h$ là chiều cao tối đa của cổng.
  - Chân cổng nằm đối xứng qua gốc tọa độ trên trục $O x => A(-w, 0)$ và $B(w, 0)$ với $2w$ là chiều rộng chân cổng.
  - Phương trình Parabol có dạng: $y = a x^2 + h$. Đi qua $B(w, 0) => a = - frac(h, w^2)$.
  - Diện tích cổng vòm:
    $
      S = integral_(-w)^w (-frac(h, w^2) x^2 + h) d x = frac(4, 3) h w
    
    $
]

#vd(
  [Một cổng chào trường học có dạng một hình Parabol có chiều rộng chân cổng là 4 m và chiều cao tối đa là $2.5$ m. Để gia cố kết cấu và tạo mỹ quan, người ta xây một bức tường gạch đặc ở phần dưới của cổng với chiều cao cố định $1.5$ m tính từ mặt đất, phần trên để trống để lắp đặt hệ thống đèn LED trang trí. Tính diện tích phần không gian trống hình parabol phía trên (làm tròn kết quả đến hàng phần trăm).],
  loigiai: [
    *Bước 1:* Thiết lập hệ trục tọa độ $O x y$:
    - Trục $O x$ nằm trùng với mặt đất, gốc tọa độ $O$ là trung điểm của chân cổng.
    - Trục $O y$ đi qua đỉnh cao nhất của cổng.
    - Đỉnh Parabol nằm trên trục tung nên có tọa độ $I(0; 2.5)$.
    - Hai chân cổng đối xứng nhau qua $O$, do chiều rộng là 4 m nên có tọa độ $A(-2; 0)$ và $B(2; 0)$.

    *Bước 2:* Xác định phương trình Parabol:
    Giả sử Parabol có phương trình: $y = a x^2 + c$.
    - Vì đỉnh có tung độ $2.5$ nên $c = 2.5$.
    - Parabol đi qua điểm $B(2; 0) => a dot 2^2 + 2.5 = 0 <=> 4a = -2.5 <=> a = -0.625 = -frac(5, 8)$.
    Vậy phương trình Parabol mô tả cổng vòm là: $y = - frac(5, 8) x^2 + 2.5$ (với $x in [-2; 2]$).

    *Bước 3:* Xác định diện tích phần trống phía trên:
    Phần tường xây cao $1.5$ m, tương ứng với đường thẳng nằm ngang $y = 1.5$.
    Phần trống phía trên được giới hạn bởi Parabol $y = - frac(5, 8) x^2 + 2.5$ và đường thẳng $y = 1.5$.
    Hoành độ giao điểm của Parabol và đường thẳng $y = 1.5$ là nghiệm của phương trình:
    $
      - frac(5, 8) x^2 + 2.5 = 1.5  wide  <=>  wide  - frac(5, 8) x^2 = -1  wide  <=>  wide  x^2 = frac(8, 5) = 1.6  wide  <=>  wide  x = +- sqrt{1.6} approx +- 1.265 " (m)"
    $
    Diện tích phần trống phía trên là:
    $
      S = integral_(-sqrt(1.6))^(sqrt(1.6)) [ (-frac(5, 8) x^2 + 2.5) - 1.5 ] d x = integral_(-sqrt(1.6))^(sqrt(1.6)) (1 - frac(5, 8) x^2) d x
    $
    Tính nguyên hàm và thế cận:
    $
      S = [ x - frac(5, 24) x^3 ]_(-sqrt(1.6))^(sqrt(1.6)) = 2 dot [ sqrt{1.6} - frac(5, 24) dot (sqrt{1.6})^3 ] \
      S = 2 dot [ sqrt{1.6} - frac(5, 24) dot 1.6 sqrt{1.6} ] = 2 dot [ sqrt{1.6} - frac(1, 3) sqrt{1.6} ] = frac(4, 3) sqrt{1.6} approx 1.69 " (m"^2")"
    
    $
    Vậy diện tích không gian trống phía trên lắp đèn LED trang trí khoảng $1.69$ $"m"^2$.
  ],
  theme-color: c-p3,
)

#dang([Diện tích biển quảng cáo và mặt tiền công trình], theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  Đối với hình phẳng giới hạn bởi hai đường cong $y = f(x)$ và $y = g(x)$ từ $x = a$ đến $x = b$, diện tích được tính bằng công thức:
  $
    S = integral_a^b |f(x) - g(x)| d x
  
  $
]

#topic([Hình phức tạp bằng Cộng-Trừ diện tích], prefix: "Bài", theme-color: c-p3)

#dang([Diện tích hình lọ hoa, cánh cung, mặt kính cong], theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  Khi tính diện tích mặt tiền công trình hoặc kết cấu kiến trúc ghép:
  - Chia diện tích tổng thể làm hai hay nhiều khối riêng biệt.
  - Sử dụng các công thức hình học thông thường cho khối đa giác cơ bản và tích phân xác định cho các đường biên cong.
]

#vd(
  [Mặt tiền một tòa nhà văn phòng gồm một phần bức tường hình chữ nhật có chiều rộng là 10 m, chiều cao 6 m. Phía trên bức tường chữ nhật được thiết kế một mặt kính cường lực hình cung Parabol có chiều cao cao nhất là 3 m và chân cung trùng khít với cạnh trên của hình chữ nhật. Tính tổng diện tích mặt tiền của tòa nhà đó.],
  loigiai: [
    Tổng diện tích mặt tiền tòa nhà $S_{"tổng"}$ bằng diện tích bức tường hình chữ nhật $S_1$ cộng với diện tích bức tường kính hình Parabol $S_2$ phía trên.

    - *Diện tích bức tường hình chữ nhật:*
      $
        S_1 = 10 dot 6 = 60 " (m"^2")"
      
      $

    - *Diện tích mặt kính hình cung Parabol:*
      Ta thiết lập hệ trục tọa độ $O x y$ sao cho gốc tọa độ $O$ là trung điểm cạnh trên của bức tường hình chữ nhật.
      - Trục hoành $O x$ nằm trùng với cạnh trên của hình chữ nhật, có độ dài bằng 10 m (tương ứng $x in [-5; 5]$).
      - Trục tung $O y$ đi qua đỉnh của Parabol. Đỉnh có tọa độ $I(0; 3)$ (do chiều cao tối đa của cung Parabol là 3 m).
      - Hai góc chân cung kính trùng khít với hai góc trên của hình chữ nhật có tọa độ là $A(-5; 0)$ và $B(5; 0)$.

      Giả sử Parabol có phương trình: $y = a x^2 + c$.
      - Vì đỉnh là $I(0; 3) => c = 3$.
      - Parabol đi qua $B(5; 0) => a dot 5^2 + 3 = 0 <=> 25a = -3 <=> a = -0.12 = -frac(3, 25)$.
      Vậy phương trình Parabol là: $y = -0.12 x^2 + 3$ (với $x in [-5; 5]$).

      Diện tích mặt kính hình cung Parabol là tích phân từ $-5$ đến $5$ của hàm số này:
      $
        S_2 = integral_(-5)^5 (-0.12 x^2 + 3) d x
      
      $
      Do hàm số chẵn và lấy đối xứng, ta có:
      $
        S_2 = 2 integral_0^5 (-0.12 x^2 + 3) d x = 2 [ -0.04 x^3 + 3x ]_0^5 \
        S_2 = 2 [ (-0.04 dot 5^3 + 3 dot 5) - 0 ] = 2 [ -5 + 15 ] = 2 dot 10 = 20 " (m"^2")"
      
      $
      (Hoặc tính nhanh theo công thức Archimedes: $S_2 = frac(2, 3) dot "rộng" dot "cao" = frac(2, 3) dot 10 dot 3 = 20 " m"^2$).

    - *Tổng diện tích mặt tiền tòa nhà:*
      $
        S_{"tổng"} = S_1 + S_2 = 60 + 20 = 80 " (m"^2")"
      
      $
      Vậy tổng diện tích mặt tiền của tòa nhà văn phòng đó là $80$ $"m"^2$.
  ],
  theme-color: c-p3,
)
