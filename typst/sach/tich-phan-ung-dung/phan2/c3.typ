#import "../_config.typ": *

#chapter([Công cơ học — Lực thay đổi theo vị trí], theme-color: c-p2)

#phuongphap(theme-color: c-p2)[
  *Định nghĩa vật lý:* Khi lực tác dụng $F(x)$ (N) biến thiên liên tục phụ thuộc vào vị trí $x$ (m) của vật trên một trục tọa độ, công cơ học $W$ (Joule - J) sinh ra khi vật dịch chuyển từ vị trí $x = a$ đến $x = b$ được tính bằng tích phân:
  $
    W = integral_a^b F(x) d x  wide  ("đơn vị: " "J" = "N" dot "m")
  
  $
  
  *Trường hợp 1: Định luật Hooke (Lực đàn hồi của lò xo)*
  Lực đàn hồi của lò xo tỷ lệ thuận với độ dãn hoặc nén $x$ (m) của nó so với trạng thái tự nhiên: $F(x) = k x$, với $k$ (N/m) là hệ số đàn hồi (độ cứng của lò xo).
  Công để kéo lò xo dãn từ độ dãn $x_1$ đến $x_2$ là:
  $
    W = integral_(x_1)^(x_2) k x d x = [ frac(k x^2, 2) ]_(x_1)^(x_2)
  
  $

  *Trường hợp 2: Bài toán bơm chất lỏng ra khỏi bồn chứa*
  Để tính công cần thiết để bơm chất lỏng lên miệng bồn chứa, ta chia chất lỏng thành các lát mỏng nằm ngang có độ dày $d x$ ở độ cao $x$ (so với đáy bồn):
  - Tính thể tích lát mỏng: $d V = S(x) d x$ (với $S(x)$ là diện tích thiết diện ngang ở độ cao $x$).
  - Tính khối lượng lát mỏng: $d m = rho dot d V$ (với $rho$ là khối lượng riêng của chất lỏng).
  - Tính lực cần thiết để nâng lát mỏng: $d F = g dot d m = rho g S(x) d x$ (với $g$ là gia tốc trọng trường).
  - Xác định quãng đường di chuyển $d$ của lát mỏng lên miệng bồn: $d = H - x$ (với $H$ là chiều cao của miệng bồn so với đáy bồn).
  - Tổng công cần thiết:
    $
      W = integral_0^h rho g S(x) (H - x) d x  wide  (h " là chiều cao ban đầu của mực nước")
    
    $
]

#topic([Công của lực đàn hồi — Lò xo], prefix: "Bài", theme-color: c-p2)

#dang([Kéo giãn / nén lò xo — Tính công dựa trên định luật Hooke], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  Khi giải bài toán lò xo:
  1. Xác định độ cứng $k$ của lò xo từ điều kiện ban đầu (lực $F$ ứng với độ dãn $x$): $k = frac(F, x)$. Chú ý đổi đơn vị từ cm sang mét.
  2. Xác định giới hạn dưới $x_1$ và giới hạn trên $x_2$ (là độ dãn của lò xo so với chiều dài tự nhiên).
  3. Lập tích phân và tính công: $W = integral_(x_1)^(x_2) k x d x$.
]

#vd(
  [Một lò xo có chiều dài tự nhiên là 20 cm. Biết rằng cần một lực $30$ N để giữ lò xo dãn đến chiều dài 25 cm. Tính công cần thiết để kéo dãn lò xo từ chiều dài 25 cm đến chiều dài 30 cm.],
  loigiai: [
    *Bước 1:* Xác định độ dãn $x$ của lò xo tại vị trí chiều dài 25 cm so với chiều dài tự nhiên:
    $
      x = 25 " cm" - 20 " cm" = 5 " cm" = 0.05 " m"
    
    $
    *Bước 2:* Tính độ cứng $k$ của lò xo theo Định luật Hooke ($F = k x$):
    $
      30 = k dot 0.05  wide  <=>  wide  k = frac(30, 0.05) = 600 " (N/m)"
    
    $
    *Bước 3:* Xác định các giới hạn tích phân (độ dãn ở các trạng thái):
    - Trạng thái 1 (chiều dài 25 cm): độ dãn $x_1 = 25 - 20 = 5 " cm" = 0.05 " m"$.
    - Trạng thái 2 (chiều dài 30 cm): độ dãn $x_2 = 30 - 20 = 10 " cm" = 0.1 " m"$.

    *Bước 4:* Tính công cần thiết để kéo dãn lò xo từ 25 cm đến 30 cm:
    $
      W = integral_(0.05)^(0.1) F(x) d x = integral_(0.05)^(0.1) 600x d x
    
    $
    Tính nguyên hàm và thế cận:
    $
      W = [ 300 x^2 ]_(0.05)^(0.1) = 300 dot (0.1^2 - 0.05^2) \
      W = 300 dot (0.01 - 0.0025) = 300 dot 0.0075 = 2.25 " (J)"
    
    $
    Vậy công cần thiết để kéo dãn lò xo từ 25 cm đến 30 cm là $2.25$ Joule.
  ],
  theme-color: c-p2,
)

#dang([Lực biến thiên phi tuyến — Công theo đồ thị $F(x)$], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  Khi lực tác dụng biến thiên phi tuyến $F(x) = a x^2 + b x + c$, công cơ học được tính trực tiếp bằng cách lấy tích phân đa thức cơ bản trên khoảng $[a, b]$ tương ứng với hành trình dịch chuyển của vật.
]

#topic([Bơm chất lỏng ra khỏi bình chứa], prefix: "Bài", theme-color: c-p2)

#dang([Bơm nước từ bồn hình trụ/hình nón], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  Đối với bồn hình trụ đứng có bán kính đáy $R$ và chiều cao bồn $H$:
  - Diện tích mặt cắt ngang tại mọi vị trí đều là hằng số: $S(x) = pi R^2$.
  - Một lớp nước mỏng có độ dày $d x$ ở độ cao $x$ sẽ phải nâng lên một quãng đường là $H - x$.
  - Công dịch chuyển lớp nước này là: $d W = rho g (pi R^2) (H - x) d x$.
]

#vd(
  [Một bồn nước dạng hình trụ đặt đứng có bán kính đáy $R = 2$ m và chiều cao $H = 5$ m, chứa đầy nước. Tính công tối thiểu cần thiết để bơm toàn bộ lượng nước sạch trong bồn ra ngoài qua miệng bồn (cho khối lượng riêng của nước là $rho = 1000$ kg/m³ và gia tốc trọng trường $g = 10$ m/s²).],
  loigiai: [
    Gọi $x$ (m, $0 <= x <= 5$) là độ cao của lớp nước mỏng bất kỳ so với đáy bồn. Lớp nước mỏng có độ dày $d x$.
    - Thiết diện ngang của bồn trụ là hình tròn bán kính $R = 2$ m có diện tích không đổi:
      $
        S(x) = pi R^2 = pi dot 2^2 = 4 pi " (m"^2")"
      
      $
    - Thể tích của lớp nước mỏng là: $d V = S(x) d x = 4 pi d x$ ($"m"^3$).
    - Khối lượng của lớp nước mỏng là: $d m = rho d V = 1000 dot 4 pi d x = 4000 pi d x$ (kg).
    - Lực cần để nâng lớp nước mỏng (chống lại trọng lực) là: $d F = d m dot g = 4000 pi d x dot 10 = 40000 pi d x$ (N).
    - Quãng đường cần dịch chuyển lớp nước ở độ cao $x$ lên tới miệng bồn ở độ cao $H = 5$ m là:
      $
        d = 5 - x " (m)"
      
      $
    - Công cần để nâng lớp nước mỏng này là:
      $
        d W = d F dot d = 40000 pi (5 - x) d x " (J)"
      
      $
    - Tổng công cần thiết để bơm toàn bộ bồn nước chứa đầy nước (từ đáy $x = 0$ đến miệng $x = 5$):
      $
        W = integral_0^5 40000 pi (5 - x) d x = 40000 pi integral_0^5 (5 - x) d x
      
      $
    Tính tích phân:
    $
      W = 40000 pi [ 5x - frac(x^2, 2) ]_0^5 = 40000 pi [ (5 dot 5 - frac(5^2, 2)) - 0 ] \
      W = 40000 pi [ 25 - 12.5 ] = 40000 pi dot 12.5 = 500000 pi " (J)"
    
    $
    Tính giá trị xấp xỉ:
    $
      W = 500000 pi approx 1.57 dot 10^6 " J" = 1.57 " MJ"
    
    $
    Vậy công tối thiểu cần thiết để bơm hết nước ra ngoài là khoảng $1.57$ Megajoule.
  ],
  theme-color: c-p2,
)
