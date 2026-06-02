#import "../_theme.typ": *

== Xưởng C — Biến Chỉ Báo: Cách Cắt Một Đối Tượng Toàn Cục Thành Nhiều Đèn Bật Tắt

#why-box[
  Trong nhiều bài toán xác suất tổ hợp, điều khó nhất không phải là công thức mà là đại lượng đang cần đếm quá toàn cục. Nó phụ thuộc vào cả một cấu hình lớn, nên nhìn trực tiếp rất mù.

  Biến chỉ báo cho ta một chiến lược khác: tách hiện tượng lớn thành rất nhiều sự kiện cục bộ, mỗi sự kiện chỉ bật hoặc tắt. Rồi dùng tính tuyến tính của kỳ vọng để ráp lại.
]

#history-box("Từ xác suất cổ điển đến xác suất tổ hợp hiện đại")[
  Các biến chỉ báo ở dạng tinh thần đã có mặt từ lâu trong xác suất cổ điển. Nhưng chúng trở thành một ngôn ngữ trung tâm khi xác suất tổ hợp phát triển mạnh ở thế kỷ hai mươi, đặc biệt qua trường phái Erdos và sau đó là các tác giả như Renyi, Alon, Spencer.

  Họ cho thấy một chân lý rất mạnh: nhiều bài toán tồn tại, trung bình, ngẫu nhiên và đồ thị có thể được tháo rời thành các biến $0$-$1$ rồi cộng lại. Sự đơn giản cục bộ ấy thường thắng độ phức tạp toàn cục.
]

=== C1. Ví Dụ Dài — Một Hoán Vị Ngẫu Nhiên Có Trung Bình Bao Nhiêu Điểm Bất Động?

#workshop-box("Bài toán dài: kỳ vọng số fixed point bằng $1$")[
  Xét một hoán vị ngẫu nhiên của $1,2,dots,n$. Một *điểm bất động* là một vị trí $i$ sao cho phần tử $i$ vẫn nằm đúng chỗ của nó.

  Nếu nhìn trực tiếp, số điểm bất động là một đại lượng toàn cục khá rối. Nhưng ta có thể đặt, với mỗi vị trí $i$,

  - $X_i = 1$ nếu $i$ là điểm bất động,
  - $X_i = 0$ nếu không.

  Khi đó tổng số điểm bất động là
  $ X = X_1 + X_2 + dots + X_n $

  Bây giờ, xác suất để vị trí $i$ là điểm bất động bằng $1/n$. Vì thế
  $ E[X_i] = 1/n $

  Theo tính tuyến tính của kỳ vọng:
  $ E[X] = E[X_1] + E[X_2] + dots + E[X_n] = n dot frac(1, n) = 1 $

  Điều kỳ diệu là ta không cần biết phân phối đầy đủ của $X$. Ta chỉ cần các mảnh vi mô của nó.
]

#essay-box("Điều gì làm ví dụ này đẹp?")[
  Nó đẹp vì nó không yêu cầu độc lập. Nhiều học sinh lần đầu tưởng rằng muốn cộng kỳ vọng thì các biến phải độc lập. Không. Tính tuyến tính của kỳ vọng là một quyền lực hiếm có: nó làm việc cả khi các biến phụ thuộc chằng chịt.

  Đây là một cánh cửa lớn. Một khi đã hiểu điều này, em bắt đầu thấy hàng loạt bài toán đếm ngẫu nhiên mềm đi rõ rệt.
]

=== C2. Từ Đỉnh, Cạnh, Đến Màu Sắc

#vd-box("22", "Một tô màu ngẫu nhiên của đồ thị có trung bình bao nhiêu cạnh đơn sắc?")[
  Cho một đồ thị có $m$ cạnh. Tô mỗi đỉnh bằng đỏ hoặc xanh, độc lập và xác suất bằng nhau.

  Với mỗi cạnh $e$, đặt
  - $X_e = 1$ nếu hai đầu mút của $e$ cùng màu,
  - $X_e = 0$ nếu chúng khác màu.

  Khi đó số cạnh đơn sắc là
  $ X = sum X_e $

  Với một cạnh cố định, xác suất hai đầu mút cùng màu là $1/2$. Nên
  $ E[X_e] = 1/2 $

  Do đó
  $ E[X] = m/2 $

  Kết luận này lập tức kéo theo một phát biểu tồn tại: luôn có ít nhất một cách tô màu làm số cạnh đơn sắc không vượt quá $m/2$.
]

#bridge-box("Từ biến chỉ báo tới probabilistic method")[
  Đây chính là lối đi sang Phần VI và rồi sang Phần VIII. Một đại lượng trung bình không chỉ mô tả cái ngẫu nhiên; nó còn ép tồn tại một cấu hình tất định đủ tốt.

  Nói cách khác, biến chỉ báo không chỉ giúp *đếm*. Nó còn giúp *chứng minh tồn tại*.
]

=== C3. Ví Dụ Gần Với Bài Toán Ghế

#vd-box("23", "Số cặp ngồi kề nhau cùng lớp trung bình là bao nhiêu?")[
  Giả sử ta xếp ngẫu nhiên một dãy học sinh, trong đó có nhiều bạn cùng lớp A, cùng lớp B, dots Ta muốn biết trung bình có bao nhiêu cặp ghế kề nhau chứa hai bạn cùng lớp.

  Với mỗi cặp ghế kề nhau, đặt một biến chỉ báo bằng $1$ nếu cặp ấy là một vi phạm, và bằng $0$ nếu không. Tổng số vi phạm chính là tổng của tất cả các biến chỉ báo cục bộ này.

  Cách nhìn ấy cực quan trọng vì nó biến một cấu hình lớn thành một tổng địa phương. Từ đây, ta có thể dùng đối xứng, xác suất của một cặp cố định, hoặc đếm tổ hợp để tìm kỳ vọng.

  Đây cũng là nơi chuyên đề ghế ngồi và xác suất tổ hợp thật sự gặp nhau: bài toán cấm kề có thể được soi bằng đúng thứ ánh sáng mà biến chỉ báo tạo ra.
]

=== C4. Bài Toán Bản Lề — Cặp Trùng Sinh Nhật

#pivot-box("Trung bình có bao nhiêu cặp cùng ngày sinh trong một nhóm?")[
  Xét $n$ người, giả sử mỗi người có ngày sinh độc lập và phân bố đều trên $365$ ngày.

  Với mỗi cặp người $(i,j)$, đặt
  - $X_(i,j) = 1$ nếu họ cùng ngày sinh,
  - $X_(i,j) = 0$ nếu không.

  Khi đó tổng số cặp trùng ngày sinh là
  $ X = sum X_(i,j) $

  Mỗi cặp có xác suất trùng ngày sinh bằng $1/365$, nên
  $ E[X] = C_n^2 / 365 $

  Công thức này không trực tiếp cho xác suất có ít nhất một cặp trùng, nhưng nó cho trực giác rất mạnh về ngưỡng nơi hiện tượng bắt đầu xuất hiện thường xuyên. Đây là một chiếc cầu đẹp sang birthday paradox ở xưởng kế tiếp.
]

#open-q[
  Khi một đại lượng trông quá toàn cục để sờ vào, em có thử cắt nó thành tổng của những bóng đèn $0$-$1$ chưa?
]
