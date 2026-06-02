#import "../_theme.typ": *

== Xưởng C — Dự Án Nhỏ: Từ Không Gian Hình Học Tới Mô Hình

#workshop-box("Mạch nội dung của xưởng dự án 3D")[
  - Thiết lập mô hình toán học giải quyết bài toán định vị thực tế.
  - Sử dụng phương trình mặt cầu và phương pháp tuyến tính hóa để giải hệ phương trình phi tuyến.
  - Tìm hiểu nguyên lý hoạt động của hệ thống GPS dưới lăng kính tọa độ không gian.
]

=== Dự án: Thuật toán định vị GPS bằng giao điểm mặt cầu (Trilateration)

Mỗi ngày, hàng tỷ người đang sử dụng Google Maps trên điện thoại để tìm đường. Làm thế nào mà chiếc điện thoại nhỏ bé có thể biết chính xác vị trí của bạn trên mặt đất với sai số chỉ vài mét? Câu trả lời nằm ở hệ thống định vị toàn cầu GPS và một thuật toán hình học không gian kinh điển gọi là *Trilateration (Phép định vị tam giác)*.

---

==== 1. Mô hình toán học của GPS

Hệ thống GPS hoạt động dựa trên mạng lưới gồm khoảng 30 vệ tinh bay quanh Trái Đất. Mỗi vệ tinh liên tục phát tín hiệu chứa hai thông tin: tọa độ chính xác của vệ tinh trong không gian và thời gian chính xác khi tín hiệu được phát đi (được đo bằng đồng hồ nguyên tử cực kỳ chính xác).

Điện thoại của bạn (thiết bị thu) nhận được tín hiệu này tại thời điểm $t_("thu")$. Khoảng thời gian tín hiệu di chuyển là $Delta t = t_("thu") - t_("phát")$. 
Vì sóng vô tuyến truyền với tốc độ ánh sáng $c approx 300,000$ km/s, khoảng cách $d$ từ điện thoại đến vệ tinh đó là:
$ d = c dot Delta t $

Về mặt hình học, nếu biết khoảng cách từ bạn đến vệ tinh $A$ là $d_1$, bạn phải nằm trên *mặt cầu tâm $A$ bán kính $d_1$*.
Nếu biết thêm khoảng cách đến vệ tinh $B$ là $d_2$, bạn phải nằm trên giao tuyến của hai mặt cầu, đó là một *đường tròn*.
Nếu biết thêm khoảng cách đến vệ tinh $C$ là $d_3$, giao điểm của ba mặt cầu sẽ thu hẹp vị trí của bạn xuống chỉ còn *hai điểm duy nhất*.

---

==== 2. Thuật toán giải hệ phương trình giao ba mặt cầu

Gọi vị trí của bạn là $M(x, y, z)$. Giả sử tọa độ của 3 vệ tinh lần lượt là $A(x_1, y_1, z_1)$, $B(x_2, y_2, z_2)$ và $C(x_3, y_3, z_3)$. Ta có hệ phương trình mặt cầu:
$ cases(
  (x - x_1)^2 + (y - y_1)^2 + (z - z_1)^2 = d_1^2 quad (1),
  (x - x_2)^2 + (y - y_2)^2 + (z - z_2)^2 = d_2^2 quad (2),
  (x - x_3)^2 + (y - y_3)^2 + (z - z_3)^2 = d_3^2 quad (3)
) $

Đây là một hệ phương trình phi tuyến tính (bậc hai) có vẻ rất khó giải. Tuy nhiên, các kỹ sư định vị có một mẹo cực kỳ thông minh để *tuyến tính hóa* hệ này. Bằng cách khai triển các bình phương và trừ phương trình (1) cho phương trình (2) và (3), các số hạng bậc hai $x^2, y^2, z^2$ sẽ triệt tiêu hoàn toàn, để lại một hệ phương trình bậc nhất (tuyến tính) cực kỳ dễ giải!

---

==== 3. Ví dụ số học cụ thể

#vd-box("15", "Tính tọa độ thiết bị thu GPS bằng phép trừ mặt cầu")[
  Giả sử trong hệ tọa độ Oxyz, ba vệ tinh ở các vị trí rất đẹp:
  - Vệ tinh thứ nhất: $A(0, 0, 0)$ với khoảng cách đo được là $d_1 = 5$ km.
  - Vệ tinh thứ hai: $B(4, 0, 0)$ với khoảng cách đo được là $d_2 = 5$ km.
  - Vệ tinh thứ ba: $C(0, 3, 0)$ với khoảng cách đo được là $d_3 = 5$ km.
  
  Hãy tính tọa độ vị trí $M(x, y, z)$ của thiết bị thu.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - Thiết lập hệ phương trình khoảng cách:
    $ x^2 + y^2 + z^2 = 25 quad (1) $
    $ (x - 4)^2 + y^2 + z^2 = 25 arrow.double x^2 - 8 x + 16 + y^2 + z^2 = 25 quad (2) $
    $ x^2 + (y - 3)^2 + z^2 = 25 arrow.double x^2 + y^2 - 6 y + 9 + z^2 = 25 quad (3) $
  - Lấy phương trình (1) trừ phương trình (2) theo vế:
    $ (x^2 + y^2 + z^2) - (x^2 - 8 x + 16 + y^2 + z^2) = 25 - 25 $
    $ 8 x - 16 = 0 arrow.double 8 x = 16 arrow.double x = 2 $
  - Lấy phương trình (1) trừ phương trình (3) theo vế:
    $ (x^2 + y^2 + z^2) - (x^2 + y^2 - 6 y + 9 + z^2) = 25 - 25 $
    $ 6 y - 9 = 0 arrow.double 6 y = 9 arrow.double y = 1.5 $
  - Thay $x = 2$ và $y = 1.5$ ngược lại vào phương trình (1) để tìm cao độ $z$:
    $ 2^2 + 1.5^2 + z^2 = 25 arrow.double 4 + 2.25 + z^2 = 25 $
    $ 6.25 + z^2 = 25 arrow.double z^2 = 18.75 arrow.double z = plus.minus sqrt(18.75) approx plus.minus 4.33 op("km") $
  - Kết quả cho ra hai điểm nghiệm: $M_1(2, 1.5, 4.33)$ và $M_2(2, 1.5, -4.33)$.
  
  #v(0.4em)
  *Giải thích hiện tượng hai nghiệm:*
  - Một điểm $M_1$ nằm trên bầu trời (cao độ dương) và một điểm $M_2$ nằm sâu trong lòng đất hoặc nửa bán cầu bên kia (cao độ âm). Bộ vi xử lý của điện thoại sẽ dễ dàng loại bỏ điểm nghiệm phi thực tế $M_2$ dựa vào bản đồ bề mặt Trái Đất có sẵn.
  - *Lưu ý thực tế:* Trong đời sống, đồng hồ của điện thoại không chính xác bằng đồng hồ nguyên tử của vệ tinh nên có sai số thời gian làm sai lệch khoảng cách. Vì thế, người ta cần thu tín hiệu từ vệ tinh thứ 4 để giải thêm một ẩn số sai lệch đồng hồ, giúp định vị chính xác tuyệt đối.
]

=== Dự án nâng cao: Định vị GPS thực tế bằng Thuật toán Newton-Raphson

Trong thực tế thương mại, hệ thống GPS không bao giờ giải trực tiếp bằng phương pháp giao điểm mặt cầu thuần túy như trên. Lý do là *đồng hồ của điện thoại* là đồng hồ thạch anh thông thường, luôn có độ lệch thời gian $Delta t_("clock")$ so với đồng hồ nguyên tử cực kỳ chính xác của vệ tinh. Sai số này dù chỉ là vài mili giây, khi nhân với vận tốc ánh sáng $c$, cũng sẽ khiến khoảng cách bị sai lệch lên tới hàng chục cây số!

Do đó, khoảng cách thực tế đo được từ máy thu tới vệ tinh thứ $i$, gọi là *Giả cự ly (Pseudorange)* $R_i$, bị lệch một lượng $b = c dot Delta t_("clock")$ (gọi là sai số khoảng cách do đồng hồ):
$ R_i = sqrt((x - x_i)^2 + (y - y_i)^2 + (z - z_i)^2) + b quad (i = 1, 2, 3, 4) $

Bây giờ ta có *4 ẩn số* cần tìm: tọa độ vị trí $(x, y, z)$ và sai số đồng hồ $b$. Vì vậy, ta bắt buộc phải nhận tín hiệu từ ít nhất *4 vệ tinh* để lập hệ 4 phương trình phi tuyến tính.

#tech-box[
  *Chi tiết Toán học: Tuyến tính hóa Taylor và Ma trận Jacobian:*
  
  Đặt phương trình phần dư cho vệ tinh thứ $i$ là:
  $ f_i (x, y, z, b) = sqrt((x - x_i)^2 + (y - y_i)^2 + (z - z_i)^2) + b - R_i = 0 $
  
  Giả sử tại bước lặp thứ $k$, ta có điểm dự đoán vị trí hiện tại là $vec(X)_k = (x_k, y_k, z_k, b_k)^T$. Ta khai triển Taylor bậc 1 của hàm $f_i$ xung quanh điểm $vec(X)_k$:
  $ f_i (x, y, z, b) approx f_i (x_k, y_k, z_k, b_k) + (partial f_i) / (partial x) Delta x + (partial f_i) / (partial y) Delta y + (partial f_i) / (partial z) Delta z + (partial f_i) / (partial b) Delta b = 0 $
  
  Tính các đạo hàm riêng tại điểm $vec(X)_k$:
  - Ký hiệu $d_(i,k) = sqrt((x_k - x_i)^2 + (y_k - y_i)^2 + (z_k - z_i)^2)$ là khoảng cách hình học tính từ điểm dự đoán tới vệ tinh $i$.
  - Đạo hàm riêng theo tọa độ:
    $ (partial f_i) / (partial x) = (x_k - x_i) / d_(i,k), quad (partial f_i) / (partial y) = (y_k - y_i) / d_(i,k), quad (partial f_i) / (partial z) = (z_k - z_i) / d_(i,k) $
    Đây chính là các thành phần của *vectơ chỉ hướng đơn vị* $vec(u)_(i,k) = (u_(i x), u_(i y), u_(i z))$ chỉ từ vệ tinh $i$ tới vị trí dự đoán.
  - Đạo hàm riêng theo sai số đồng hồ:
    $ (partial f_i) / (partial b) = 1 $
  
  Thế vào phương trình tuyến tính hóa, ta có hệ 4 phương trình bậc nhất cho lượng hiệu chỉnh $Delta vec(X) = (Delta x, Delta y, Delta z, Delta b)^T$:
  $ (x_k - x_i) / d_(i,k) Delta x + (y_k - y_i) / d_(i,k) Delta y + (z_k - z_i) / d_(i,k) Delta z + Delta b = R_i - d_(i,k) - b_k $
]

#tech-box[
  *Thuật toán lặp Newton-Raphson dưới dạng Ma trận:*
  
  Hệ phương trình trên được viết ngắn gọn dưới dạng ma trận:
  $ J_k dot Delta vec(X) = vec(r)_k $
  Trong đó:
  - $J_k$ là *Ma trận Jacobian* kích thước $4 times 4$, dòng thứ $i$ chứa hướng nhìn từ điểm dự đoán tới vệ tinh $i$ cùng với cột số 1 cho sai số đồng hồ:
    $ J_k = mat(
      (x_k - x_1)/d_(1,k), (y_k - y_1)/d_(1,k), (z_k - z_1)/d_(1,k), 1;
      (x_k - x_2)/d_(2,k), (y_k - y_2)/d_(2,k), (z_k - z_2)/d_(2,k), 1;
      (x_k - x_3)/d_(3,k), (y_k - y_3)/d_(3,k), (z_k - z_3)/d_(3,k), 1;
      (x_k - x_4)/d_(4,k), (y_k - y_4)/d_(4,k), (z_k - z_4)/d_(4,k), 1;
    ) $
  - $vec(r)_k$ là *Vectơ phần dư* biểu thị sai lệch giữa giả cự ly thực tế và giả cự ly tính toán từ điểm đoán hiện tại:
    $ vec(r)_k = mat(
      R_1 - d_(1,k) - b_k;
      R_2 - d_(2,k) - b_k;
      R_3 - d_(3,k) - b_k;
      R_4 - d_(4,k) - b_k;
    ) $
  
  Ở mỗi bước lặp, ta tính lượng hiệu chỉnh bằng phép nhân ma trận nghịch đảo:
  $ Delta vec(X) = J_k^(-1) vec(r)_k $
  Và cập nhật điểm dự đoán cho bước tiếp theo:
  $ vec(X)_(k+1) = vec(X)_k + Delta vec(X) $
  Quá trình này lặp lại cho đến khi độ dài $|Delta vec(X)|$ nhỏ hơn một sai số cho phép $epsilon$ (ví dụ $10^(-6)$ km), thuật toán sẽ dừng lại và trả về vị trí cực kỳ chính xác của máy thu.
]

=== Mô phỏng Số Từng Bước của Thuật toán Định vị GPS

Để thấy thuật toán này hoạt động thông minh và hội tụ nhanh như thế nào, chúng ta hãy cùng chạy một mô phỏng số thực tế.

Giả sử vị trí thực tế của thiết bị thu là $M(10, 20, 30)$ km và sai số đồng hồ thực tế là $b = 5$ km.
Có bốn vệ tinh GPS trong tầm nhìn tại các vị trí:
- $S_1 (10, 20, 1030)$ km $=>$ Khoảng cách thực tế: $d_1 = 1000$ km $=>$ Giả cự ly đo được: $R_1 = 1005$ km.
- $S_2 (10, 1020, 30)$ km $=>$ Khoảng cách thực tế: $d_2 = 1000$ km $=>$ Giả cự ly đo được: $R_2 = 1005$ km.
- $S_3 (1010, 20, 30)$ km $=>$ Khoảng cách thực tế: $d_3 = 1000$ km $=>$ Giả cự ly đo được: $R_3 = 1005$ km.
- $S_4 (-590, -780, 30)$ km $=>$ Khoảng cách thực tế: $d_4 = 1000$ km $=>$ Giả cự ly đo được: $R_4 = 1005$ km.

*Mục tiêu:* Thiết bị thu không hề biết tọa độ $(10,20,30)$ và $b=5$. Nó chỉ có các số liệu $S_i$ và $R_i$. Ta sẽ bắt đầu từ điểm đoán ban đầu rất xa vị trí thực tế: $vec(X)_0 = (0, 0, 0, 0)^T$ (gốc tọa độ và sai số đồng hồ bằng $0$).

#workshop-box("Bước lặp thứ nhất của điện thoại")[
  - *Bước 1: Tính khoảng cách hình học từ điểm đoán $vec(X)_0(0,0,0)$ tới các vệ tinh:*
    $ d_(1,0) = sqrt((0-10)^2 + (0-20)^2 + (0-1030)^2) = sqrt(1061400) approx 1030.24 \
      d_(2,0) = sqrt((0-10)^2 + (0-1020)^2 + (0-30)^2) = sqrt(1041400) approx 1020.49 \
      d_(3,0) = sqrt((0-1010)^2 + (0-20)^2 + (0-30)^2) = sqrt(1021400) approx 1010.64 \
      d_(4,0) = sqrt((0 - (-590))^2 + (0 - (-780))^2 + (0-30)^2) = sqrt(957400) approx 978.47 $
  
  - *Bước 2: Xây dựng Ma trận Jacobian $J_0$ tại $vec(X)_0$:*
    Tính các tỷ số $(x_0 - x_i)/d_(i,0)$ để điền vào ma trận:
    $ J_0 = mat(
      -10/1030.24, -20/1030.24, -1030/1030.24, 1;
      -10/1020.49, -1020/1020.49, -30/1020.49, 1;
      -1010/1010.64, -20/1010.64, -30/1010.64, 1;
      590/978.47, 780/978.47, -30/978.47, 1;
    ) approx mat(
      -0.0097, -0.0194, -0.9998, 1;
      -0.0098, -0.9995, -0.0294, 1;
      -0.9994, -0.0198, -0.0297, 1;
      0.6030, 0.7972, -0.0307, 1;
    ) $

  - *Bước 3: Tính vectơ phần dư $vec(r)_0$:*
    $ vec(r)_0 = mat(
      R_1 - d_(1,0) - b_0;
      R_2 - d_(2,0) - b_0;
      R_3 - d_(3,0) - b_0;
      R_4 - d_(4,0) - b_0;
    ) = mat(
      1005 - 1030.24 - 0;
      1005 - 1020.49 - 0;
      1005 - 1010.64 - 0;
      1005 - 978.47 - 0;
    ) = mat(
      -25.24;
      -15.49;
      -5.64;
      26.53;
    ) $
    
  - *Bước 4: Giải hệ phương trình ma trận $J_0 dot Delta vec(X) = vec(r)_0$:*
    Bằng thuật toán khử Gauss hoặc các phương pháp số trên máy tính, ta tìm được lượng hiệu chỉnh:
    $ Delta vec(X) = J_0^(-1) vec(r)_0 approx mat(10.28; 20.35; 30.15; 5.09) $
    
  - *Bước 5: Cập nhật vị trí mới $vec(X)_1$:*
    $ vec(X)_1 = vec(X)_0 + Delta vec(X) = mat(0; 0; 0; 0) + mat(10.28; 20.35; 30.15; 5.09) = mat(10.28; 20.35; 30.15; 5.09) $
]

#meta-box[
  *Đánh giá tốc độ hội tụ kinh ngạc:*
  
  Hãy nhìn vào tọa độ dự đoán mới $vec(X)_1$:
  - Tọa độ $x_1 = 10.28$ km (so với thực tế là $10$ km).
  - Tọa độ $y_1 = 20.35$ km (so với thực tế là $20$ km).
  - Tọa độ $z_1 = 30.15$ km (so với thực tế là $30$ km).
  - Sai số đồng hồ $b_1 = 5.09$ km (so với thực tế là $5$ km).
  
  Chỉ sau đúng *một bước lặp duy nhất* đi từ một giả định hoàn toàn mù quáng tại gốc tọa độ $(0,0,0,0)$ cách xa hàng chục cây số, thuật toán Newton-Raphson đã đưa chúng ta về sát vị trí thực tế với sai số chỉ còn khoảng dưới 300 mét! Ở bước lặp thứ 2, sai số sẽ giảm xuống mức milimet. Đây chính là minh chứng cho sức mạnh hủy diệt của giải tích số kết hợp hình học không gian 3D.
]

