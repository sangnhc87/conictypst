#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

== XƯỞNG C — DỰ ÁN NHỎ: TỪ HÌNH PHẲNG TỚI MÔ HÌNH THỰC TẾ

Toán học không chỉ nằm trong các bài thi thử hay những dòng chứng minh khô khan. Khi bước ra đời sống, hình học phẳng là ngôn ngữ cốt lõi để các kỹ sư thiết kế thiết bị, định vị tàu thuyền giữa đại dương, và lập trình các thuật toán mô phỏng đồ họa.

Trong xưởng dự án này, chúng ta sẽ trực tiếp thực hành hai dự án công nghệ lớn và một xưởng lập trình Python để trực quan hóa toán học 2D.

=== Dự Án 1: Hệ Thống Định Vị Hàng Hải LORAN (Long Range Navigation)

Trước khi hệ thống định vị toàn cầu GPS (bằng vệ tinh vệ tinh 3D) ra đời, các thủy thủ và phi công thời Chiến tranh Thế giới thứ hai định vị tàu thuyền bằng hệ thống vô tuyến mặt đất gọi là *LORAN*. Hệ thống này hoạt động hoàn toàn dựa trên tính chất hình học của đường *Hypebol*.

#tech-box[
  *Cơ sở toán học của định vị LORAN:*
  
  Giả sử trên bờ biển có hai trạm phát sóng vô tuyến cố định:
  - Trạm $S_1$ (trạm chính - Master station).
  - Trạm $S_2$ (trạm phụ - Secondary station).
  
  Hai trạm phát sóng vô tuyến phát ra các tín hiệu đồng bộ với nhau. Tàu thủy di động trên biển nhận được hai tín hiệu này ở hai thời điểm khác nhau. Bộ vi xử lý trên tàu đo độ lệch thời gian nhận sóng là $Delta t$.
  Vì vận tốc sóng vô tuyến truyền trong không khí là hằng số $v_s = 300,000$ km/s, độ lệch khoảng cách từ tàu (điểm $M$) đến hai trạm phát là:
  $ |M S_1 - M S_2| = v_s dot Delta t = 2a = "const" $
  
  Theo định nghĩa hình học, điểm $M$ (tàu) bắt buộc phải nằm trên một nhánh của *đường Hypebol* nhận hai trạm phát $S_1$ và $S_2$ làm hai tiêu điểm!
  Để tìm vị trí chính xác của tàu, người ta dùng thêm một cặp trạm phát khác ($S_1$ và $S_3$) để vẽ ra đường Hypebol thứ hai. Giao điểm của hai đường Hypebol này chính là vị trí chính xác của tàu trên bản đồ!
]

=== Dự Án 2: Thiết Kế Chảo Parabol Gom Năng Lượng Mặt Trời (Solar Collector)

Trong bối cảnh năng lượng tái tạo phát triển, các kỹ sư thiết kế những chảo phản xạ parabol khổng lồ để hội tụ ánh sáng mặt trời nhằm đun sôi nước tạo hơi quay tuabin phát điện, hoặc làm bếp nấu ăn năng lượng mặt trời.

Để năng lượng hội tụ mạnh nhất, đầu thu nhiệt (hoặc nồi nấu) phải được đặt chính xác tại tiêu điểm $F(p, 0)$ của parabol. Nhiệm vụ của bạn là viết phương trình thiết kế và xác định vị trí tiêu điểm của chảo từ các kích thước thực tế (đường kính miệng chảo và độ sâu lòng chảo).

=== Xưởng Thực Hành Số: Vẽ Đường Cong Phẳng Bằng Code Python

Để giúp học sinh trực quan hóa đường elip, hypebol và quỹ đạo giao điểm định vị LORAN, đây là đoạn mã nguồn Python hoàn chỉnh sử dụng thư viện đồ họa *Matplotlib*. Bạn chỉ cần cài đặt thư viện (`pip install matplotlib numpy`) và chạy script này để hiển thị mô hình định vị 2D tuyệt đẹp.

#workshop-box("Lập trình mô phỏng giao điểm định vị LORAN bằng Python", [
  ```python
  import numpy as np
  import matplotlib.pyplot as plt

  # Bước 1: Khởi tạo lưới tọa độ phẳng
  x = np.linspace(-10, 10, 400)
  y = np.linspace(-10, 10, 400)
  x, y = np.meshgrid(x, y)

  # Bước 2: Thiết lập phương trình hai đường Hypebol định vị
  # Hypebol 1 nhận hai trạm phát trên trục hoành làm tiêu điểm
  # Phương trình chính tắc: x^2 / a1^2 - y^2 / b1^2 = 1
  a1, b1 = 3.0, 4.0
  hypebol1 = (x*2 / a1*2) - (y*2 / b1*2) - 1

  # Hypebol 2 nhận hai trạm phát xoay nghiêng hoặc trên trục tung làm tiêu điểm
  # Phương trình chính tắc xoay dọc: y^2 / a2^2 - x^2 / b2^2 = 1
  a2, b2 = 2.0, 3.0
  hypebol2 = (y*2 / a2*2) - (x*2 / b2*2) - 1

  # Bước 3: Vẽ các đường cong bằng kỹ thuật contour lines
  plt.figure(figsize=(8, 8))
  
  # Vẽ các nhánh hypebol
  plt.contour(x, y, hypebol1, [0], colors='blue', linewidths=2.0)
  plt.contour(x, y, hypebol2, [0], colors='green', linewidths=2.0)

  # Đánh dấu tiêu điểm (các trạm phát sóng vô tuyến)
  c1 = np.sqrt(a1*2 + b1*2)
  c2 = np.sqrt(a2*2 + b2*2)
  plt.plot([-c1, c1], [0, 0], 'ro', label="Tram phat Hypebol 1")
  plt.plot([0, 0], [-c2, c2], 'go', label="Tram phat Hypebol 2")

  # Cài đặt giao diện
  plt.title("Mo phong Giao diem dinh vi LORAN bang 2 Hypebol")
  plt.xlabel("Truc X (km)")
  plt.ylabel("Truc Y (km)")
  plt.grid(True, linestyle='--', alpha=0.6)
  plt.axhline(0, color='black', linewidth=0.8)
  plt.axvline(0, color='black', linewidth=0.8)
  plt.legend()
  plt.show()
  ```
])

=== Các Ví Dụ Giải Chi Tiết Dự Án Thực Tế

#vd-box("Ví dụ 1", "Định vị vị trí tàu bằng hệ thống LORAN")[
  Một tàu thủy nhận tín hiệu vô tuyến từ hai trạm phát LORAN $S_1(-100, 0)$ và $S_2(100, 0)$ (đơn vị khoảng cách: km). Độ lệch thời gian nhận tín hiệu đo được trên tàu là $Delta t = 0.0004$ giây. Biết vận tốc truyền sóng vô tuyến là $v_s = 300,000$ km/s.
  1. Viết phương trình quỹ đạo hypebol chứa vị trí của tàu.
  2. Biết rằng tàu cũng nằm trên đường thẳng đi qua trạm $S_2$ vuông góc với trục $O x$. Xác định tọa độ của tàu (giả sử tàu ở phía trên trục hoành).
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Câu 1:*
    - Tính độ lệch khoảng cách từ tàu (điểm $M$) đến hai trạm phát:
      $ 2a = v_s dot Delta t = 300000 " km/s" dot 0.0004 " s" = 120 " km" $
      Suy ra bán trục lớn $a = 60$ km.
    - Tiêu cự $c = 100$ km (tọa độ trạm phát là $S_2(100,0)$).
    - Áp dụng hệ thức Hypebol:
      $ b^2 = c^2 - a^2 = 100^2 - 60^2 = 10000 - 3600 = 6400 $
      Bán trục ảo $b = 80$ km.
    Phương trình quỹ đạo Hypebol chứa vị trí tàu là:
    $ x^2 / 3600 - y^2 / 6400 = 1 $
    Vì tàu nằm gần trạm nào hơn? Nếu tàu nhận tín hiệu từ $S_2$ muộn hơn $S_1$, tàu nằm trên nhánh trái ($x < 0$). Giả sử đề bài xác định tàu nhận từ $S_2$ sớm hơn nên nằm trên nhánh phải ($x > 0$):
    $ x^2 / 3600 - y^2 / 6400 = 1 quad (x >= 60) $
  
  - *Câu 2:*
    - Tàu nằm trên đường thẳng vuông góc với $O x$ tại trạm $S_2(100, 0)$ nên hoành độ của tàu là $x_0 = 100$.
    - Thế $x_0 = 100$ vào phương trình Hypebol:
      $ 100^2 / 3600 - y_0^2 / 6400 = 1 $
      $ 10000 / 3600 - y_0^2 / 6400 = 1 $
      $ 25/9 - y_0^2 / 6400 = 1 $
      $ y_0^2 / 6400 = 25/9 - 1 = 16/9 $
      $ y_0^2 = 6400 dot 16/9 = 102400 / 9 $
      $ y_0 = +- sqrt(102400)/3 = +- 320/3 approx 106.67 " km" $
    - Vì tàu ở phía trên trục hoành ($y_0 > 0$), tọa độ của tàu là $M(100, 106.67)$.
]

#vd-box("Ví dụ 2", "Thiết kế tiêu điểm chảo năng lượng mặt trời")[
  Một kỹ sư thiết kế một chảo parabol mặt cắt tròn có đường kính miệng chảo $D = 120$ cm và chiều sâu của lòng chảo $h = 30$ cm. 
  1. Viết phương trình parabol biểu diễn mặt cắt của chảo (chọn gốc tọa độ tại đỉnh chảo, trục đối xứng trùng với trục tung $O y$).
  2. Xác định khoảng cách từ đỉnh chảo đến đầu thu nhiệt đặt tại tiêu điểm.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Câu 1:*
    Chọn hệ trục Oxy với gốc tọa độ $O$ là đỉnh chảo. Trục đối xứng là $O y$.
    Phương trình parabol có dạng:
    $ x^2 = 2p y $ (với $p > 0$ là tham số tiêu).
    - Miệng chảo có đường kính $D = 120$ cm, tương ứng với hoành độ từ $x = -60$ cm đến $x = 60$ cm.
    - Độ sâu lòng chảo $h = 30$ cm tương ứng với tung độ $y = 30$ cm tại miệng chảo.
    - Điểm ở mép miệng chảo có tọa độ là $A(60, 30)$. Thế tọa độ $A$ vào phương trình parabol:
      $ 60^2 = 2p (30) <=> 3,600 = 60p => p = 60 $
    Vậy phương trình parabol thiết kế là:
    $ x^2 = 120y $
  
  - *Câu 2:*
    - Đầu thu nhiệt cần đặt tại tiêu điểm $F$ của parabol.
    - Tiêu điểm của parabol $x^2 = 2p y$ là $F(0, p/2)$.
    - Khoảng cách từ đỉnh chảo $O$ đến tiêu điểm $F$ là:
      $ d = p / 2 = 60 / 2 = 30 " cm" $
    *Kết luận:* Đầu thu nhiệt cần đặt cách đỉnh chảo một khoảng bằng 30 cm (nằm ngay trên mặt phẳng miệng chảo vì độ sâu lòng chảo cũng bằng 30 cm).
]

#vd-box("Ví dụ 3", "Bài toán tối ưu thiết kế khu đất elip")[
  Một khu đất có dạng hình Elip với bán trục lớn $a = 20$ m và bán trục nhỏ $b = 15$ m. Người ta muốn rào một khu vườn trồng hoa hình chữ nhật nội tiếp trong khu đất này. Hãy tính kích thước của khu vườn hoa hình chữ nhật để diện tích trồng hoa đạt giá trị lớn nhất.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Thiết lập phương trình elip đại diện cho khu đất:
    $ x^2 / 400 + y^2 / 225 = 1 $
  - *Bước 2:* Theo kết quả chứng minh tổng quát ở Ví dụ 5 của Xưởng B:
    Diện tích cực đại của hình chữ nhật nội tiếp elip đạt được khi tọa độ đỉnh của hình chữ nhật ở góc phần tư thứ nhất thỏa mãn:
    $ x_0 = a / sqrt(2) = 20 / sqrt(2) = 10 sqrt(2) approx 14.14 " m" $
    $ y_0 = b / sqrt(2) = 15 / sqrt(2) = 7.5 sqrt(2) approx 10.61 " m" $
  - *Bước 3:* Tính kích thước hai cạnh của vườn hoa hình chữ nhật:
    - Chiều dài (cạnh song song $O x$): $L = 2 x_0 = 20 sqrt(2) approx 28.28$ m.
    - Chiều rộng (cạnh song song $O y$): $W = 2 y_0 = 15 sqrt(2) approx 21.21$ m.
  - *Bước 4:* Diện tích vườn hoa lớn nhất đạt được là:
    $ S_("max") = L dot W = 20 sqrt(2) dot 15 sqrt(2) = 600 " m"^2 $
  - *Kết luận:* Kích thước của khu vườn hoa hình chữ nhật để diện tích lớn nhất là $28.28$ m $times$ $21.21$ m, diện tích lớn nhất thu được là $600$ $m^2$.
]

#open-q[
  Đối với Dự án 1 (Hệ thống định vị LORAN), nếu ba trạm phát vô tuyến nằm thẳng hàng trên cùng một đường bờ biển, hãy thiết lập hệ thức tọa độ trực tiếp của giao điểm hai nhánh Hypebol. Sự đối xứng của hệ thống này có thể dẫn tới những bẫy định vị (giao điểm ảo) nào không?
]
