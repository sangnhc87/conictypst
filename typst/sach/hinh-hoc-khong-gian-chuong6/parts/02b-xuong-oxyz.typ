#import "../_theme.typ": *

== Xưởng B — Oxyz Ứng Dụng, Mặt Cầu, Chuyển Động Và Giao Tuyến

#workshop-box("Mạch nội dung của xưởng Oxyz")[
  - Kỹ thuật đặt hệ trục tọa độ (Tọa độ hóa) trên các khối đa diện tiêu chuẩn.
  - Ứng dụng Oxyz giải quyết các bài toán chuyển động, khoảng cách và quét không gian.
  - Phân tích và mô hình hóa bài toán thực tế bằng phương trình đường thẳng và mặt cầu.
]

=== 1. Chiến thuật Đặt Hệ trục Tọa độ (Tọa độ hóa)

Tọa độ hóa là một nghệ thuật chọn gốc tọa độ $O$ và các hướng của ba trục $O x, O y, O z$ sao cho số lượng đỉnh có tọa độ chứa số $0$ hoặc các hằng số đơn giản là lớn nhất.

*Ba mô hình đặt hệ trục tiêu chuẩn:*
- *Mô hình 1: Khối hộp chữ nhật / Khối lập phương $A B C D.A' B' C' D'$*
  - *Gốc $O$:* Đặt tại một đỉnh góc đáy, ví dụ đỉnh $A$.
  - *Các trục:* Trục $O x$ trùng với đường thẳng $A B$; trục $O y$ trùng với $A D$; trục $O z$ trùng với $A A'$.
  - *Kết quả:* Toàn bộ các đỉnh đều có tọa độ là các cạnh hoặc $0$.
- *Mô hình 2: Hình chóp đều (ví dụ hình chóp tứ giác đều $S.A B C D$)*
  - *Gốc $O$:* Đặt tại tâm đáy $H$ (giao điểm của $A C$ và $B D$).
  - *Các trục:* Trục $O z$ trùng với chiều cao $H S$; trục $O x$ song song hoặc trùng với đường trung trực của đáy; trục $O y$ vuông góc với $O x$ tại $H$.
  - *Kết quả:* Tọa độ các đỉnh đối xứng nhau qua gốc tọa độ, giúp triệt tiêu rất nhiều số hạng khi cộng trừ.
- *Mô hình 3: Hình chóp có một cạnh bên vuông góc với đáy (ví dụ $S.A B C$ có $S A perp (A B C)$ và đáy $A B C$ vuông tại $A$)*
  - *Gốc $O$:* Đặt tại đỉnh góc vuông ở đáy: đỉnh $A$.
  - *Các trục:* Trục $O x$ trùng với $A B$; trục $O y$ trùng với $A C$; trục $O z$ trùng với $A S$.

---

=== 2. Ví dụ mô hình hóa chuyển động và quét Radar trong Oxyz

#vd-box("14", "Giám sát không phận bằng trạm Radar")[
  Một trạm radar kiểm soát không phận được lắp đặt tại gốc tọa độ $O(0,0,0)$ (đơn vị đo trên các trục là km). Radar này phát tín hiệu quét và phát hiện các vật thể bay trong phạm vi một khối cầu có bán kính tối đa $R = 10$ km. 
  
  Một chiếc drone khảo sát thời tiết chuyển động thẳng đều dọc theo đường bay $d$. Tại một thời điểm quan trắc, drone đi qua điểm $P(2, -4, 5)$ với vectơ vận tốc chuyển động là $vec(v) = (1, 2, -2)$ (đơn vị vận tốc là km/giờ).
  
  #v(0.4em)
  1. Hãy lập phương trình tham số đường bay $d$ của drone.
  2. Xác định khoảng cách ngắn nhất từ trạm radar $O$ đến đường bay của drone. Drone có đi vào vùng quét của radar không?
  3. Nếu có, hãy tính khoảng thời gian drone nằm trong vùng phủ sóng quét của trạm radar.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  + *Lập phương trình đường bay $d$:*
    - Đường thẳng $d$ đi qua điểm $P(2, -4, 5)$ và nhận vectơ vận tốc $vec(v) = (1, 2, -2)$ làm vectơ chỉ phương.
    - Phương trình tham số của $d$ biểu thị vị trí của drone theo thời gian $t$ (giờ) là:
      $ cases(x = 2 + t, y = -4 + 2 t, z = 5 - 2 t) quad (t in RR) $
    - Như vậy tại thời điểm $t$, tọa độ của drone là $M(2+t, -4+2t, 5-2t)$.

  + *Tìm khoảng cách ngắn nhất và kiểm tra va chạm vùng quét:*
    - Bình phương khoảng cách từ trạm radar $O(0,0,0)$ đến drone tại thời điểm $t$ là:
      $ O M^2 = x_M^2 + y_M^2 + z_M^2 = (2+t)^2 + (-4+2t)^2 + (5-2t)^2 $
    - Khai triển biểu thức:
      $ O M^2 = (t^2 + 4t + 4) + (4t^2 - 16t + 16) + (4t^2 - 20t + 25) = 9t^2 - 32t + 45 $
    - Đây là một hàm số bậc hai $f(t) = 9t^2 - 32t + 45$. Khoảng cách ngắn nhất đạt được tại đỉnh của parabol:
      $ t_0 = - (-32) / (2 dot 9) = 16/9 approx 1.78 " (giờ)" $
    - Giá trị cực tiểu của bình phương khoảng cách:
      $ O M^2_("min") = f(16/9) = 9(16/9)^2 - 32(16/9) + 45 = 149/9 approx 16.56 " (km)"^2 $
    - Khoảng cách ngắn nhất từ trạm radar $O$ đến đường bay là:
      $ d(O, d) = sqrt(149/9) = sqrt(149)/3 approx 4.07 " (km)" $
    - So sánh với bán kính quét $R = 10$ km: vì $d(O, d) approx 4.07 " km" < 10 " km"$, chiếc drone chắc chắn sẽ đi vào vùng phủ sóng quét của trạm radar.

  + *Tính thời gian drone nằm trong vùng phủ sóng:*
    - Drone nằm trong vùng quét khi và chỉ khi khoảng cách từ $O$ đến nó nhỏ hơn hoặc bằng bán kính quét:
      $ O M^2 <= R^2 => 9t^2 - 32t + 45 <= 100 => 9t^2 - 32t - 55 <= 0 $
    - Giải phương trình bậc hai $9t^2 - 32t - 55 = 0$:
      - Biệt thức $Delta' = (-16)^2 - 9 dot (-55) = 256 + 495 = 751$.
      - Hai nghiệm tương ứng là:
        $ t_1 = (16 - sqrt(751))/9 approx -1.27 " (giờ)" $
        $ t_2 = (16 + sqrt(751))/9 approx 4.82 " (giờ)" $
    - Khoảng thời gian drone nằm trong tầm quét là:
      $ Delta t = t_2 - t_1 = (2 sqrt(751))/9 approx 6.09 " (giờ)" approx 6 " giờ " 5 " phút" $
]

=== 3. Vector Optics & Ray Tracing: Lập trình phản xạ ánh sáng 3D

Trong các công cụ dựng hình 3D (như Unreal Engine hay các chương trình xử lý đồ họa máy tính), thuật toán *Ray Tracing (Dò tia)* hoạt động liên tục để tính toán đường đi của hàng triệu tia sáng khi va chạm với các vật thể. Bản chất của sự va chạm phản xạ này được mô tả cực kỳ ngắn gọn bằng phương trình vectơ Oxyz.

#tech-box[
  *Phương trình phản xạ vectơ:*
  
  Cho tia sáng tới có vectơ chỉ hướng $vec(I)$ bắn vào một mặt gương phẳng có vectơ pháp tuyến đơn vị là $vec(N)$ (hướng ra ngoài bề mặt gương). 
  - Vectơ chỉ hướng của tia phản xạ $vec(R)$ được tính bằng công thức:
    $ vec(R) = vec(I) - 2 (vec(I) dot vec(N)) vec(N) $
  - *Ý nghĩa hình học:* Đoạn $- (vec(I) dot vec(N)) vec(N)$ biểu thị hình chiếu vuông góc của tia tới lên pháp tuyến của gương. Phép trừ hai lần hình chiếu này giúp bẻ hướng của vectơ tới đối xứng hoàn hảo qua gương theo đúng Luật phản xạ ánh sáng (góc tới bằng góc phản xạ).
]

#vd-box("14b", "Giải bài toán dò tia Laser va chạm gương phẳng")[
  Một tia laser phát ra từ bóng đèn đặt tại điểm $S(1, 2, 3)$, truyền thẳng theo hướng $vec(u) = (2, -1, -2)$ đi qua môi trường không khí và va chạm với một mặt gương phẳng $(P): x + 2y - z - 6 = 0$.
  
  #v(0.4em)
  1. Tìm tọa độ điểm va chạm $H$ của tia laser trên mặt gương.
  2. Viết phương trình tham số của tia laser phản xạ sau khi chạm gương.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  + *Tìm tọa độ điểm va chạm $H$:*
    - Phương trình tham số của tia sáng tới (đường thẳng đi qua $S(1,2,3)$ có chỉ phương $vec(u) = (2, -1, -2)$):
      $ cases(x = 1 + 2t, y = 2 - t, z = 3 - 2t) quad (t > 0) $
    - Điểm va chạm $H$ thuộc gương phẳng $(P)$ nên tọa độ của nó thỏa mãn phương trình mặt phẳng $(P)$:
      $ (1 + 2t) + 2(2 - t) - (3 - 2t) - 6 = 0 $
      $ 1 + 2t + 4 - 2t - 3 + 2t - 6 = 0 => 2t - 4 = 0 => t = 2 $ (thỏa mãn $t > 0$)
    - Thế $t = 2$ vào phương trình đường thẳng ta được tọa độ điểm va chạm: $H(5, 0, -1)$.

  + *Viết phương trình tia phản xạ:*
    - Vectơ chỉ hướng của tia sáng tới là $vec(I) = vec(u) = (2, -1, -2)$.
    - Mặt phẳng gương $(P)$ có vectơ pháp tuyến là $vec(n)_P = (1, 2, -1)$. Độ dài của nó là $|vec(n)_P| = sqrt(1^2 + 2^2 + (-1)^2) = sqrt(6)$.
    - Vectơ pháp tuyến đơn vị hướng lên của gương là:
      $ vec(N) = vec(n)_P / (|vec(n)_P|) = 1 / sqrt(6) (1, 2, -1) $
    - Tính tích vô hướng của tia tới và pháp tuyến đơn vị:
      $ vec(I) dot vec(N) = (2 dot 1 + (-1) dot 2 + (-2) dot (-1)) / sqrt(6) = (2 - 2 + 2) / sqrt(6) = 2 / sqrt(6) $
    - Áp dụng công thức phản xạ vectơ:
      $ vec(R) = vec(I) - 2 (vec(I) dot vec(N)) vec(N) = (2, -1, -2) - 2 (2 / sqrt(6)) (1 / sqrt(6) (1, 2, -1)) $
      $ vec(R) = (2, -1, -2) - 4/6 (1, 2, -1) = (2, -1, -2) - 2/3 (1, 2, -1) $
      $ vec(R) = (2 - 2/3, -1 - 4/3, -2 + 2/3) = (4/3, -7/3, -4/3) $
    - Chọn vectơ chỉ phương cùng phương đơn giản hơn cho tia phản xạ bằng cách nhân 3: $vec(u)_R = (4, -7, -4)$.
    - Tia phản xạ xuất phát từ điểm va chạm $H(5, 0, -1)$ và đi theo hướng $vec(u)_R = (4, -7, -4)$ nên có phương trình tham số:
      $ cases(x = 5 + 4k, y = -7k, z = -1 - 4k) quad (k > 0) $
]

=== 4. Ma trận phản xạ Householder: Từ Quang học đến Đại số Tuyến tính Cao cấp

Trong lập trình đồ họa và vật lý 3D, việc tính toán các phản xạ tia sáng bằng phương trình vectơ rời rạc $vec(R) = vec(I) - 2(vec(I) dot vec(N)) vec(N)$ là rất tốt, nhưng trong thực tế, các bộ xử lý đồ họa (GPU) được tối ưu hóa cực mạnh cho phép nhân ma trận. Vì thế, người ta biến đổi phép phản xạ quang học này thành một phép nhân ma trận duy nhất.

#tech-box[
  *Thiết lập Ma trận Phản xạ:*
  
  Biểu diễn các vectơ $vec(I)$ và $vec(N)$ dưới dạng các ma trận cột kích thước $3 times 1$. Khi đó, tích vô hướng của chúng được viết bằng phép nhân ma trận:
  $ vec(I) dot vec(N) = vec(N)^T vec(I) $
  
  Thay thế vào công thức phản xạ ban đầu:
  $ vec(R) = vec(I) - 2 (vec(N)^T vec(I)) vec(N) = vec(I) - 2 vec(N) (vec(N)^T vec(I)) = (I_3 - 2 vec(N) vec(N)^T) vec(I) $
  Trong đó $I_3$ là ma trận đơn vị cấp 3, còn $vec(N) vec(N)^T$ là tích ngoài (outer product) tạo ra một ma trận kích thước $3 times 3$.
  
  Ta định nghĩa *Ma trận phản xạ Householder* $H$:
  $ H = I_3 - 2 vec(N) vec(N)^T $
  Công thức phản xạ ánh sáng lúc này chỉ đơn giản là phép nhân ma trận với vectơ tới:
  $ vec(R) = H vec(I) $
]

#vd-box("14c", "Tính toán ma trận phản xạ Householder cho gương phẳng")[
  Với gương phẳng $(P): x + 2y - z - 6 = 0$ và tia sáng tới có hướng $vec(I) = (2, -1, -2)^T$:
  
  1. Hãy lập ma trận phản xạ Householder $H$ của gương.
  2. Dùng phép nhân ma trận $H vec(I)$ để tìm lại tia phản xạ $vec(R)$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - Pháp tuyến đơn vị của gương là $vec(N) = 1/sqrt(6) mat(1; 2; -1)$.
  - Tích ngoài $vec(N) vec(N)^T$ là ma trận $3 times 3$:
    $ vec(N) vec(N)^T = 1/6 mat(1; 2; -1) mat(1, 2, -1) = 1/6 mat(1, 2, -1; 2, 4, -2; -1, -2, 1) $
  - Tính ma trận Householder $H$:
    $ H = mat(1, 0, 0; 0, 1, 0; 0, 0, 1) - 2/6 mat(1, 2, -1; 2, 4, -2; -1, -2, 1) = mat(1, 0, 0; 0, 1, 0; 0, 0, 1) - 1/3 mat(1, 2, -1; 2, 4, -2; -1, -2, 1) $
    $ H = 1/3 mat(3 - 1, -2, 1; -2, 3 - 4, 2; 1, 2, 3 - 1) = 1/3 mat(2, -2, 1; -2, -1, 2; 1, 2, 2) $
  - Thực hiện phép nhân ma trận để tìm $vec(R)$:
    $ vec(R) = H vec(I) = 1/3 mat(2, -2, 1; -2, -1, 2; 1, 2, 2) mat(2; -1; -2) $
    $ vec(R) = 1/3 mat(2(2) - 2(-1) + 1(-2); -2(2) - 1(-1) + 2(-2); 1(2) + 2(-1) + 2(-2)) = 1/3 mat(4; -7; -4) = mat(4/3; -7/3; -4/3) $
  - Kết quả hoàn toàn trùng khớp với cách giải hình học ở Ví dụ 14b!
]

#meta-box[
  *Liên hệ toán học cao cấp: Phép khử Householder và phân tích QR*
  
  Ma trận Householder có hai thuộc tính đại số vô cùng quan trọng:
  - *Tính đối xứng:* $H^T = H$.
  - *Tính trực giao:* $H^T H = I_3$ (có nghĩa là phép phản xạ bảo toàn hoàn toàn góc và khoảng cách).
  
  Trong đại số tuyến tính tính toán, phép biến đổi Householder là công cụ chính để triệt tiêu các phần tử bên dưới đường chéo chính của một ma trận bất kỳ, từ đó tạo ra *Phân tích QR* ($A = Q R$ với $Q$ trực giao và $R$ tam giác trên). Đây là thuật toán ổn định nhất để giải các bài toán bình phương cực tiểu trong thống kê và máy học ngày nay.
]

