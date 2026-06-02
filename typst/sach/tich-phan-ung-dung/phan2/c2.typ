#import "../_config.typ": *

#chapter([Đọc hiểu đồ thị Động học thực nghiệm], theme-color: c-p2)

#phuongphap(theme-color: c-p2)[
  *Nguyên lý hình học:* Diện tích phần nằm dưới đường biểu diễn vận tốc $v(t) >= 0$ trên hệ trục $O t v$ chính bằng quãng đường đi được:
  $
    s = integral_(t_1)^(t_2) v(t) d t = "Diện tích hình thang / tam giác giới hạn dưới đồ thị " v(t)
  
  $
  Nếu đồ thị $v(t)$ là đường gấp khúc gồm các đoạn thẳng ghép lại, ta có thể tính tích phân này một cách nhanh chóng bằng hình học thuần túy (không cần lập biểu thức toán học của hàm số).

  *Quy tắc hình thang (Trapezoidal Rule) cho dữ liệu thực nghiệm:*
  Khi không biết hàm vận tốc liên tục $v(t)$ mà chỉ có các giá trị vận tốc đo được tại các mốc thời gian cách đều nhau $t_0, t_1, dots, t_n$ với khoảng cách $Delta t = h$:
  $
    s = integral_a^b v(t) d t approx frac(h, 2) (v_0 + 2v_1 + 2v_2 + dots + 2v_(n-1) + v_n)
  
  $
]

#topic([Diện tích dưới đường $v(t)$ — Đồ thị cho sẵn], prefix: "Bài", theme-color: c-p2)

#dang([Đồ thị $v(t)$ gồm các đoạn thẳng — Tính bằng hình học], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  Khi đồ thị vận tốc là đường gấp khúc trên khoảng $[0, T]$:
  1. Phân chia hình phẳng dưới đồ thị thành các hình học cơ bản (tam giác vuông, hình chữ nhật, hình thang).
  2. Tính diện tích từng phần bằng công thức hình học phẳng thông thường.
  3. Cộng tổng diện tích các phần để suy ra quãng đường đi được.
]

#vd(
  [Đồ thị vận tốc $v(t)$ (m/s) của một vật chuyển động thẳng trên khoảng thời gian $[0, 7]$ giây được mô tả bởi đường gấp khúc đi qua các điểm $O(0,0)$, $A(2,4)$, $B(5,4)$, $C(7,0)$. Tính tổng quãng đường vật đi được trong 7 giây đầu tiên.],
  loigiai: [
    Tổng quãng đường vật đi được trong 7 giây ($t in [0, 7]$) bằng diện tích phần hình phẳng nằm dưới đồ thị và trên trục hoành.
    Quan sát tọa độ các đỉnh, hình phẳng này là hình thang cân $O A B C$ có:
    - Đáy lớn là đoạn $O C$ nằm trên trục $O t$ có độ dài $a = 7 - 0 = 7$.
    - Đáy nhỏ là đoạn $A B$ song song với trục $O t$ ở độ cao $v = 4$, độ dài $b = 5 - 2 = 3$.
    - Chiều cao là khoảng cách từ $A B$ đến trục hoành: $h = 4$.

    Áp dụng công thức tính diện tích hình thang, ta có:
    $
      s = S_(O A B C) = frac((a + b) dot h, 2) = frac((7 + 3) dot 4, 2) = frac(10 dot 4, 2) = 20 " (m)"
    $
    Vậy quãng đường vật đi được trong 7 giây đầu tiên là $20$ mét.
  ],
  theme-color: c-p2,
)

#dang([Đồ thị $v(t)$ có đường cong — Ước lượng và tích phân], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  Nếu đồ thị chứa các đường cong Parabol hoặc hàm lượng giác:
  1. Dựa trên các điểm đặc biệt để viết công thức tường minh của hàm số $v(t)$ (ví dụ: tìm hệ số của parabol $y = a t^2 + b t + c$).
  2. Tính tích phân xác định của hàm $v(t)$ vừa tìm được trên khoảng thời gian yêu cầu để suy ra quãng đường chính xác.
]

#topic([Bài toán từ bảng dữ liệu thực nghiệm], prefix: "Bài", theme-color: c-p2)

#dang([Xấp xỉ quãng đường từ bảng $v$ đo được], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  Khi nhận bảng dữ liệu đo đạc rời rạc, ta ước lượng quãng đường bằng quy tắc hình thang:
  $
    s approx frac(h, 2) [v_0 + 2(v_1 + v_2 + dots + v_(n-1)) + v_n]
  
  $
  Trong đó $h = t_(i+1) - t_i$ là chu kỳ lấy mẫu (bước thời gian đều).
]

#vd(
  [Thiết bị định vị GPS gắn trên một xe đạp ghi lại vận tốc tức thời của xe đạp tại mỗi mốc thời gian cách nhau 10 giây và cho bảng số liệu thực nghiệm sau:
    #align(center)[
      #table(
        columns: 9,
        inset: 6pt,
        stroke: 0.4pt,
        [$t$ (s)], [0], [10], [20], [30], [40], [50], [60], [70],
        [$v$ (m/s)], [0], [3], [5], [6], [5], [4], [2], [0],
      )
    ]
    Sử dụng quy tắc hình thang, hãy ước lượng tổng quãng đường xe đạp đã đi được trong khoảng thời gian 70 giây này.],
  loigiai: [
    Để ước lượng tổng quãng đường xe đạp đã đi được, ta áp dụng quy tắc hình thang với:
    - Bước thời gian (độ rộng khoảng chia): $h = 10$ giây.
    - Số khoảng chia: $n = 7$.
    - Các giá trị vận tốc tại các mốc thời gian là:
      $v_0 = 0$, $v_1 = 3$, $v_2 = 5$, $v_3 = 6$, $v_4 = 5$, $v_5 = 4$, $v_6 = 2$, $v_7 = 0$ (m/s).

    Công thức xấp xỉ hình thang:
    $
      s = integral_0^(70) v(t) d t approx frac(h, 2) [v_0 + 2(v_1 + v_2 + v_3 + v_4 + v_5 + v_6) + v_7]
    $
    Thế các giá trị đo được vào biểu thức:
    $
      s approx frac(10, 2) [0 + 2(3 + 5 + 6 + 5 + 4 + 2) + 0] \
      s approx 5 [2 dot 25] = 5 dot 50 = 250 " (m)"
    $
    Vậy quãng đường xe đạp đi được trong 70 giây xấp xỉ $250$ mét.
  ],
  theme-color: c-p2,
)
