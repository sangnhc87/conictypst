#import "../_config.typ": *

#chapter([Tích lũy trong Y-Sinh học và Môi trường], theme-color: c-p1)

#phuongphap(theme-color: c-p1)[
  *Bản chất:* Biết hàm tốc độ thay đổi $f'(t)$, lượng tích lũy của đại lượng $f(t)$ từ thời điểm $t = a$ đến $t = b$ là:
  $
    Delta f = f(b) - f(a) = integral_a^b f'(t) d t
  $
  Giá trị này có *ý nghĩa thực tế rõ ràng*: số vi khuẩn phát sinh thêm, số ca lây nhiễm mới trong một dịch bệnh, lượng nước rò rỉ thất thoát...

  *Các bước giải chuẩn:*
  + Đọc kỹ đề bài, xác định *đại lượng cần tính tích lũy* và *tốc độ thay đổi* tương ứng của nó (đạo hàm $f'(t)$).
  + Xác định các mốc thời gian giới hạn cận dưới $a$ và cận trên $b$.
  + Thiết lập tích phân và áp dụng bảng nguyên hàm cơ bản để tính toán.
  + Giải thích ý nghĩa kết quả kết hợp với đơn vị đo lường tương ứng.
]

#topic([Sinh trưởng Vi khuẩn và Quần thể], prefix: "Bài", theme-color: c-p1)

#dang([Tính số lượng tăng thêm trong khoảng thời gian $[a, b]$], theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  Khi biết tốc độ sinh trưởng của một quần thể vi khuẩn hoặc tốc độ gia tăng ca nhiễm bệnh $N'(t)$ (đơn vị: cá thể/giờ hoặc ca/ngày), số lượng cá thể tăng thêm từ thời điểm $t = a$ đến $t = b$ ($a < b$) được tính theo công thức:
  $
    Delta N = integral_a^b N'(t) d t
  $
  Nếu biết số lượng ban đầu tại thời điểm $a$ là $N(a)$, ta tính số lượng quần thể tại thời điểm $b$ bằng công thức:
  $
    N(b) = N(a) + integral_a^b N'(t) d t
  $
]

#vd(
  [Tốc độ sinh trưởng của một quần thể vi khuẩn trong điều kiện phòng thí nghiệm được xác định bởi công thức tốc độ $N'(t) = 500 e^(0.3 t)$ (cá thể/giờ), với $t$ tính bằng giờ kể từ khi bắt đầu nuôi cấy. Tính số lượng vi khuẩn tăng thêm trong 4 giờ đầu tiên (làm tròn kết quả đến hàng đơn vị).],
  loigiai: [
    Số lượng vi khuẩn tăng thêm trong 4 giờ đầu tiên ($t$ chạy từ $0$ đến $4$) là tích lũy của tốc độ sinh trưởng:
    $
      Delta N = integral_0^4 N'(t) d t = integral_0^4 500 e^(0.3 t) d t
    $
    Áp dụng công thức nguyên hàm hàm hợp tuyến tính $integral e^{k t} d t = frac(1, k) e^{k t} + C$:
    $
      Delta N = [ 500 dot frac(1, 0.3) e^(0.3 t) ]_0^4 = [ frac(5000, 3) e^(0.3 t) ]_0^4
    $
    Thế các cận vào biểu thức, ta có:
    $
      Delta N = frac(5000, 3) e^(0.3 dot 4) - frac(5000, 3) e^0 = frac(5000, 3) (e^(1.2) - 1)
    $
    Tính giá trị xấp xỉ bằng máy tính cầm tay:
    $
      Delta N approx frac(5000, 3) (3.3201 - 1) approx 3867 " (cá thể)"
    $
    Vậy trong 4 giờ đầu tiên, số lượng vi khuẩn của quần thể đã tăng thêm khoảng $3867$ cá thể.
  ],
  theme-color: c-p1,
)

#dang([Bài toán nghịch: Tìm thời điểm quần thể đạt ngưỡng $N_0$], theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  Đây là dạng bài toán tìm cận trên $T$ của tích phân khi biết trước lượng tích lũy mục tiêu hoặc ngưỡng giới hạn $N_{"ngưỡng"}$.
  Ta lập phương trình tích phân:
  $
    N(0) + integral_0^T N'(t) d t = N_{"ngưỡng"}  wide  <=>  wide  integral_0^T N'(t) d t = N_{"ngưỡng"} - N(0)
  
  $
  Bằng cách tính nguyên hàm và thế cận theo ẩn $T$, ta thu được một phương trình đại số (thường là phương trình mũ hoặc logarit). Giải phương trình để tìm $T$.
]

#vd(
  [Một quần thể côn trùng dịch hại nông nghiệp có số lượng ban đầu là $1000$ cá thể. Tốc độ sinh trưởng của quần thể sau $t$ ngày được mô tả bởi $N'(t) = 150 e^(0.1 t)$ (cá thể/ngày). Theo khuyến cáo, người nông dân cần tiến hành phun thuốc bảo vệ thực vật sinh học khi quần thể đạt đến ngưỡng nguy hiểm là $4000$ cá thể. Hỏi sau bao nhiêu ngày thì cần tiến hành phun thuốc (làm tròn đến hàng phần mười)?],
  loigiai: [
    Gọi $T$ (ngày, $T > 0$) là thời điểm quần thể côn trùng đạt ngưỡng $4000$ cá thể.
    Số lượng côn trùng tại thời điểm $T$ được xác định bởi công thức:
    $
      N(T) = N(0) + integral_0^T N'(t) d t
    $
    Theo giả thiết, ta có phương trình:
    $
      1000 + integral_0^T 150 e^(0.1 t) d t = 4000 \
      <=> integral_0^T 150 e^(0.1 t) d t = 3000
    $
    Thực hiện tìm nguyên hàm và thế cận:
    $
      [ 150 dot frac(1, 0.1) e^(0.1 t) ]_0^T = 3000 \
      <=> [ 1500 e^(0.1 t) ]_0^T = 3000 \
      <=> 1500 (e^(0.1 T) - 1) = 3000 \
      <=> e^(0.1 T) - 1 = 2 \
      <=> e^(0.1 T) = 3
    $
    Lấy logarit tự nhiên hai vế ta được:
    $
      0.1 T = ln 3 \
      <=> T = 10 ln 3 approx 11.0 " (ngày)"
    $
    Vậy sau khoảng $11.0$ ngày thì quần thể côn trùng đạt đến ngưỡng nguy hiểm và người nông dân cần tiến hành phun thuốc.
  ],
  theme-color: c-p1,
)

#topic([Rò rỉ Đường ống và Bơm xả Chất lỏng], prefix: "Bài", theme-color: c-p1)

#dang([Tính lượng nước thất thoát khi tốc độ rò rỉ thay đổi], theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  Khi chất lỏng rò rỉ từ đường ống hoặc bồn chứa, do áp suất giảm dần nên tốc độ rò rỉ $V'(t)$ (lít/phút hoặc $"m"^3/"giờ"$) thường giảm theo thời gian.
  Tổng thể tích nước thất thoát trong khoảng thời gian $[0, T]$ được tính bởi:
  $
    Delta V = integral_0^T V'(t) d t
  
  $
]

#vd(
  [Một đường ống cấp nước sạch đô thị bị rò rỉ do nứt vỡ. Tốc độ rò rỉ tại thời điểm $t$ phút kể từ khi sự cố xảy ra được xác định bởi công thức $V'(t) = 2t + 3$ (lít/phút). Tính tổng lượng nước sạch bị thất thoát ra ngoài môi trường trong 10 phút đầu tiên.],
  loigiai: [
    Tổng lượng nước sạch bị thất thoát trong 10 phút đầu tiên ($t$ từ $0$ đến $10$ phút) là:
    $
      Delta V = integral_0^(10) V'(t) d t = integral_0^(10) (2t + 3) d t
    $
    Tìm nguyên hàm của hàm đa thức cơ bản:
    $
      Delta V = [ t^2 + 3t ]_0^(10)
    $
    Thế các cận vào biểu thức, ta được:
    $
      Delta V = (10^2 + 3 dot 10) - (0^2 + 3 dot 0) = 100 + 30 = 130 " (lít)"
    $
    Vậy tổng lượng nước bị thất thoát trong 10 phút đầu tiên là $130$ lít.
  ],
  theme-color: c-p1,
)
