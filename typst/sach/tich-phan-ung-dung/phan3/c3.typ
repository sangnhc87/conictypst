#import "../_config.typ": *

#chapter([Dữ liệu rời rạc — Bổ trợ ĐGNL], theme-color: c-p3)

#phuongphap(theme-color: c-p3)[
  *Xấp xỉ tích phân từ dữ liệu rời rạc:*
  Trong nghiên cứu thực địa và các đề thi ĐGNL, ta thường gặp các bài toán tính diện tích mặt đất, mặt hồ khi không có công thức hàm số cụ thể mà chỉ có số liệu đo đạc thực tế tại một số vị trí cố định.
  - *Quy tắc hình thang:* Nếu chia khoảng đo $[a, b]$ thành $n$ khoảng nhỏ đều nhau có độ rộng $h = frac(b-a, n)$ và đo được chiều rộng tại các lát cắt tương ứng là $y_0, y_1, dots, y_n$, diện tích được ước lượng bởi công thức:
    $
      S approx frac(h, 2) (y_0 + 2y_1 + 2y_2 + dots + 2y_(n-1) + y_n)
    
    $

  *Ý nghĩa giới hạn Riemann:*
  Tích phân xác định $integral_a^b f(x) d x$ được định nghĩa chính xác là giới hạn của tổng Riemann khi số khoảng chia $n$ tiến ra vô cùng:
  $
    integral_a^b f(x) d x = lim_(n -> +infinity) sum_(i=1)^n f(x_i) Delta x  wide  ("với " Delta x = frac(b-a, n), \ x_i = a + i Delta x)
  
  $
  Kỹ thuật này giúp giải quyết các bài toán tính giới hạn của các dãy số tổng vô hạn bằng cách chuyển chúng về bài toán tính tích phân xác định cơ bản.
]

#topic([Ước lượng diện tích từ bảng khảo sát], prefix: "Bài", theme-color: c-p3)

#dang([Tính diện tích mặt hồ / mặt ruộng từ dữ liệu đo đạc], theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  Đối với bài toán trắc địa đo chiều rộng mặt hồ:
  1. Xác định bước chia đều $h$ (khoảng cách giữa các lần đo).
  2. Xác định các giá trị đo được $y_0, y_1, dots, y_n$. Lưu ý tại hai đầu biên thì chiều rộng bằng 0 ($y_0 = 0$, $y_n = 0$).
  3. Thay số liệu vào công thức quy tắc hình thang để ước lượng diện tích.
]

#vd(
  [Một nhóm khảo sát đo đạc chiều rộng của một hồ nước tự nhiên theo chiều từ Tây sang Đông. Cứ cách 20 m dọc theo chiều dài của hồ, họ đo chiều rộng của hồ theo chiều Bắc - Nam và thu được bảng số liệu thực nghiệm sau:
    #align(center)[
      #table(
        columns: 8,
        inset: 6pt,
        stroke: 0.4pt,
        [$x$ (m)], [0], [20], [40], [60], [80], [100], [120],
        [$y$ (m)], [0], [8], [14], [18], [15], [9], [0],
      )
    ]
    Ước lượng diện tích bề mặt của hồ nước bằng cách sử dụng quy tắc hình thang.],
  loigiai: [
    Để ước lượng diện tích bề mặt của hồ nước, ta áp dụng quy tắc hình thang với:
    - Bước chia đều (khoảng cách dọc giữa các lần đo): $h = 20$ m.
    - Số đoạn chia: $n = 6$.
    - Chiều rộng mặt hồ tại các điểm mốc tương ứng là:
      $y_0 = 0$, $y_1 = 8$, $y_2 = 14$, $y_3 = 18$, $y_4 = 15$, $y_5 = 9$, $y_6 = 0$ (m).

    Áp dụng công thức quy tắc hình thang:
    $
      S approx frac(h, 2) [y_0 + 2(y_1 + y_2 + y_3 + y_4 + y_5) + y_6]
    
    $
    Thế các giá trị từ bảng số liệu vào công thức:
    $
      S approx frac(20, 2) [0 + 2(8 + 14 + 18 + 15 + 9) + 0] \
      S approx 10 [2 dot 64] = 10 dot 128 = 1280 " (m"^2")"
    
    $
    Vậy diện tích bề mặt của hồ nước ước lượng khoảng $1280$ $"m"^2$.
  ],
  theme-color: c-p3,
)

#dang([So sánh quy tắc hình thang với tính chính xác (khi có công thức)], theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  Dạng toán này yêu cầu so sánh kết quả xấp xỉ bằng quy tắc hình thang với kết quả tính tích phân chính xác khi biết biểu thức của hàm số $f(x)$. Qua đó, học sinh đánh giá được sai số và hiểu rõ hơn về ý nghĩa của phép tính tích phân.
]

#topic([Diện tích hình chữ nhật rời rạc — Riemann Sum], prefix: "Bài", theme-color: c-p3)

#dang([Tổng Riemann trái / phải / điểm giữa — Nhận dạng đề ĐGNL], theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  Để chuyển một giới hạn dãy số $L = lim_(n -> +infinity) S_n$ thành một tích phân xác định $integral_a^b f(x) d x$:
  1. Tách nhân tử chung $frac(1, n)$ ra ngoài để đóng vai trò là độ rộng đoạn chia $Delta x = frac(1, n)$ trên đoạn $[0; 1]$.
  2. Biểu diễn phần còn lại của số hạng tổng quát dưới dạng hàm số của đại lượng $frac(i, n)$ (đóng vai trò là điểm chia $x_i = frac(i, n)$).
  3. Thay thế $frac(i, n)$ bằng biến $x$, $frac(1, n)$ bằng $d x$ và chuyển tổng thành tích phân từ $0$ đến $1$.
]

#vd(
  [Cho giới hạn của tổng sau:
    $
      L = lim_(n -> +infinity) frac(1, n) [ (frac(1, n))^2 + (frac(2, n))^2 + dots + (frac(n, n))^2 ]
    
    $
    Hãy biểu diễn giới hạn trên dưới dạng một tích phân xác định và tính giá trị của giới hạn đó.],
  loigiai: [
    Ta biểu diễn tổng đã cho dưới ký hiệu tổng thu gọn:
    $
      L = lim_(n -> +infinity) sum_(i=1)^n frac(1, n) dot (frac(i, n))^2
    
    $
    Nhận xét cấu trúc của biểu thức trong giới hạn:
    - Nhân tử chung ở ngoài là $Delta x = frac(1, n)$, tương ứng với độ rộng các đoạn chia đều của đoạn $[0; 1]$ thành $n$ phần bằng nhau.
    - Các điểm chia là $x_i = frac(i, n)$ với $i = 1, 2, dots, n$ chạy từ cận trái đến cận phải.
    - Hàm số tương ứng có dạng $f(x_i) = x_i^2 => f(x) = x^2$.

    Do đó, theo định nghĩa tổng Riemann, giới hạn của tổng này chính là tích phân xác định của hàm số $f(x) = x^2$ trên đoạn $[0; 1]$:
    $
      L = integral_0^1 x^2 d x
    
    $
    Tính tích phân:
    $
      L = [ frac(x^3, 3) ]_0^1 = frac(1^3, 3) - frac(0^3, 3) = frac(1, 3)
    
    $
    Vậy giới hạn của tổng đã cho bằng $frac(1, 3)$.
  ],
  theme-color: c-p3,
)
