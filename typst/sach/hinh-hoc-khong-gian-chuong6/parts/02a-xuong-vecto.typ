#import "../_theme.typ": *

== Xưởng A — Vectơ Và Hệ Tọa Độ 3D

#workshop-box("Mạch nội dung của xưởng vectơ")[
  - Phân tích và biểu diễn vectơ theo hệ cơ sở trong không gian.
  - Sử dụng tích vô hướng để chứng minh tính vuông góc phi tọa độ.
  - Các bài toán mẫu chuẩn hóa kỹ thuật giúp làm chủ công cụ đại số vectơ.
]

=== 1. Kỹ thuật Phân tích (Phân rã) Vectơ trong Không gian

Để phân tích một vectơ $vec(u)$ theo ba vectơ không đồng phẳng $vec(a), vec(b), vec(c)$ (được gọi là hệ cơ sở), ta sử dụng quy tắc xen điểm (quy tắc ba điểm) và quy tắc hình bình hành để đưa tất cả các vectơ về các cạnh xuất phát từ cùng một đỉnh.

#vd-box("12", "Phân tích vectơ trong hình chóp đáy hình bình hành")[
  Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M$ là trung điểm của cạnh $S C$, và $N$ là điểm trên cạnh $S D$ sao cho $S N = 2 N D$. 
  
  Hãy phân tích hai vectơ $vec(A M)$ và $vec(A N)$ theo ba vectơ cạnh bên và cạnh đáy xuất phát từ đỉnh $A$: $vec(a) = vec(A B)$, $vec(b) = vec(A D)$, và $vec(c) = vec(A S)$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  + *Phân tích vectơ $vec(A M)$:*
    - Ta xen điểm $S$ vào vectơ $vec(A M)$:
      $ vec(A M) = vec(A S) + vec(S M) $
    - Vì $M$ là trung điểm của $S C$, ta có $vec(S M) = 1/2 vec(S C)$:
      $ vec(A M) = vec(c) + 1/2 vec(S C) $
    - Biểu diễn $vec(S C)$ qua điểm $A$: $vec(S C) = vec(A C) - vec(A S) = vec(A C) - vec(c)$.
    - Vì đáy $A B C D$ là hình bình hành, ta có $vec(A C) = vec(A B) + vec(A D) = vec(a) + vec(b)$.
    - Thay tất cả vào biểu thức ban đầu:
      $ vec(A M) = vec(c) + 1/2 (vec(a) + vec(b) - vec(c)) = 1/2 vec(a) + 1/2 vec(b) + 1/2 vec(c) $

  + *Phân tích vectơ $vec(A N)$:*
    - Xen điểm $S$ vào vectơ $vec(A N)$:
      $ vec(A N) = vec(A S) + vec(S N) $
    - Vì $S N = 2 N D$, suy ra $N$ chia đoạn $S D$ thành 3 phần, trong đó $S N$ chiếm 2 phần. Do đó $vec(S N) = 2/3 vec(S D)$:
      $ vec(A N) = vec(c) + 2/3 vec(S D) $
    - Biểu diễn $vec(S D)$ qua điểm $A$: $vec(S D) = vec(A D) - vec(A S) = vec(b) - vec(c)$.
    - Thay vào biểu thức ta được:
      $ vec(A N) = vec(c) + 2/3 (vec(b) - vec(c)) = 2/3 vec(b) + 1/3 vec(c) $
]

=== 2. Kỹ thuật Sử dụng Tích vô hướng để Chứng minh Vuông góc

Một trong những sức mạnh lớn nhất của vectơ là khả năng chứng minh hai đường thẳng vuông góc trong không gian mà không cần phải dựng mặt phẳng vuông góc trung gian. Ta chỉ cần chứng minh tích vô hướng của hai vectơ chỉ phương của chúng bằng $0$.

#vd-box("13", "Chứng minh định lý Tứ diện trực tâm")[
  Chứng minh rằng trong một tứ diện $A B C D$, nếu hai cặp cạnh đối diện vuông góc với nhau (ví dụ $A B perp C D$ và $A C perp B D$), thì cặp cạnh đối diện thứ ba cũng vuông góc với nhau ($A D perp B C$).
  
  #v(0.4em)
  *Giải chi tiết bằng phương pháp vectơ:*
  
  - Giả thiết $A B perp C D$ và $A C perp B D$ được dịch sang ngôn ngữ vectơ thành:
    $ vec(A B) dot vec(C D) = 0 quad (1) $
    $ vec(A C) dot vec(B D) = 0 quad (2) $
  - Ta cần chứng minh $vec(A D) dot vec(B C) = 0$.
  - Biểu diễn các vectơ $vec(C D)$, $vec(B D)$ và $vec(B C)$ qua các vectơ xuất phát từ đỉnh $A$ ($vec(A B), vec(A C), vec(A D)$):
    - $vec(C D) = vec(A D) - vec(A C)$
    - $vec(B D) = vec(A D) - vec(A B)$
    - $vec(B C) = vec(A C) - vec(A B)$
  - Thay vào các biểu thức giả thiết:
    - Từ (1): $vec(A B) dot (vec(A D) - vec(A C)) = 0 => vec(A B) dot vec(A D) - vec(A B) dot vec(A C) = 0 => vec(A B) dot vec(A D) = vec(A B) dot vec(A C) quad (3)$
    - Từ (2): $vec(A C) dot (vec(A D) - vec(A B)) = 0 => vec(A C) dot vec(A D) - vec(A C) dot vec(A B) = 0 => vec(A C) dot vec(A D) = vec(A C) dot vec(A B) quad (4)$
  - Từ (3) và (4), theo tính chất bắc cầu, ta suy ra:
    $ vec(A B) dot vec(A D) = vec(A C) dot vec(A D) => vec(A D) dot vec(A B) - vec(A D) dot vec(A C) = 0 $
  - Rút nhân tử chung $vec(A D)$:
    $ vec(A D) dot (vec(A B) - vec(A C)) = 0 $
  - Mà ta biết $vec(A B) - vec(A C) = vec(C B) = -vec(B C)$. Do đó:
    $ vec(A D) dot (-vec(B C)) = 0 => vec(A D) dot vec(B C) = 0 $
  - Vậy $A D perp B C$. Định lý được chứng minh hoàn toàn chỉ trong 3 dòng biến đổi đại số sơ cấp!
]

#meta-box[
  Hãy so sánh cách giải trên với cách giải hình học cổ điển (phải dựng mặt phẳng chứa $A B$ vuông góc với $C D$, tìm giao tuyến...). Ta thấy phương pháp vectơ đã gánh toàn bộ tải trọng của việc dựng hình sang tính toán đại số tuyến tính, giúp lời giải trở nên rõ ràng và an toàn tuyệt đối.
]

=== 3. Tích Có Hướng và Phép Đo Khoảng Cách Hai Đường Thẳng Chéo Nhau

Trong không gian 3D, khi hai đường thẳng $d_1$ và $d_2$ chéo nhau, khoảng cách giữa chúng là độ dài của đoạn vuông góc chung. Việc dựng đoạn vuông góc chung bằng hình học cổ điển cực kỳ phức tạp. Tuy nhiên, phép nhân vectơ đặc biệt gọi là *Tích có hướng (Cross Product)* cung cấp một công thức giải quyết cơ học bài toán này.

#tech-box[
  *Định nghĩa tích có hướng và ý nghĩa hình học:*
  
  Cho hai vectơ $vec(u) = (x_1, y_1, z_1)$ và $vec(v) = (x_2, y_2, z_2)$. 
  - *Tích có hướng* của hai vectơ, kí hiệu là $vec(u) times vec(v)$, là một vectơ vuông góc với cả $vec(u)$ và $vec(v)$, được xác định bằng công thức tọa độ:
    $ vec(u) times vec(v) = (y_1 z_2 - z_1 y_2, z_1 x_2 - x_1 z_2, x_1 y_2 - y_1 x_2) $
  - *Ý nghĩa hình học:* Độ lớn $|vec(u) times vec(v)|$ bằng diện tích của hình bình hành dựng từ hai vectơ $vec(u)$ và $vec(v)$. Hướng của $vec(u) times vec(v)$ tuân theo *Quy tắc bàn tay phải* (khum các ngón tay từ $vec(u)$ sang $vec(v)$, ngón cái chỉ hướng của tích có hướng).
]

#vd-box("13b", "Chứng minh công thức khoảng cách giữa hai đường thẳng chéo nhau")[
  Cho đường thẳng $d_1$ đi qua điểm $M_1$ và có vectơ chỉ phương $vec(u)_1$, đường thẳng $d_2$ đi qua điểm $M_2$ và có vectơ chỉ phương $vec(u)_2$. Giả sử $d_1$ và $d_2$ chéo nhau.
  
  Chứng minh công thức tính khoảng cách giữa $d_1$ và $d_2$:
  $ d(d_1, d_2) = |(vec(u)_1 times vec(u)_2) dot vec(M_1 M_2)| / (|vec(u)_1 times vec(u)_2|) $
  
  #v(0.4em)
  *Chứng minh dưới góc nhìn thể tích:*
  
  - Dựng một hình hộp song song có một đỉnh là $M_1$, các cạnh lần lượt song song với $vec(u)_1$, $vec(u)_2$ và $vec(M_1 M_2)$.
  - Thể tích của hình hộp song song này được tính bằng trị tuyệt đối của tích hỗn tạp ba vectơ:
    $ V = |(vec(u)_1 times vec(u)_2) dot vec(M_1 M_2)| $
  - Mặt khác, mặt đáy của hình hộp là hình bình hành dựng từ hai vectơ chỉ phương $vec(u)_1$ và $vec(u)_2$. Diện tích mặt đáy này là:
    $ S_("đáy") = |vec(u)_1 times vec(u)_2| $
  - Khoảng cách giữa hai đường thẳng chéo nhau $d(d_1, d_2)$ chính là khoảng cách giữa hai mặt đáy chứa $d_1$ và $d_2$ của hình hộp, tức là đường cao $h$ hạ từ mặt này xuống mặt kia.
  - Do đó:
    $ h = V / S_("đáy") => d(d_1, d_2) = |(vec(u)_1 times vec(u)_2) dot vec(M_1 M_2)| / (|vec(u)_1 times vec(u)_2|) $
  - Công thức được chứng minh hoàn toàn! Một ý tưởng hình học không gian phức tạp đã được thu gọn lại thành một tỉ số giữa thể tích và diện tích.
]

=== 4. Tọa độ tỉ cự (Barycentric Coordinates) trong Tứ diện và Ứng dụng Kỹ thuật

Trong hình học phẳng 2D, ta có thể dùng tọa độ tỉ cự để biểu diễn vị trí tương đối của một điểm đối với ba đỉnh của một tam giác. Khi nâng cấp lên không gian 3D, tọa độ tỉ cự trở thành một công cụ cực mạnh để mô tả vị trí của một điểm bất kỳ đối với bốn đỉnh của một tứ diện.

#tech-box[
  *Định nghĩa toán học của Tọa độ tỉ cự:*
  
  Cho tứ diện $A B C D$. Một điểm $P$ bất kỳ trong không gian luôn được biểu diễn duy nhất dưới dạng một tổ hợp tuyến tính trọng số của bốn đỉnh:
  $ P = w_A A + w_B B + w_C C + w_D D $
  Trong đó, các hệ số trọng số (hay tọa độ tỉ cự) thỏa mãn điều kiện ràng buộc:
  $ w_A + w_B + w_C + w_D = 1 $
  
  Biểu diễn dưới dạng vectơ liên hệ qua gốc tọa độ $O$ bất kỳ:
  $ vec(O P) = w_A vec(O A) + w_B vec(O B) + w_C vec(O C) + w_D vec(O D) $
  
  Nếu chọn đỉnh $D$ làm gốc tọa độ cục bộ ($O equiv D$), ta có công thức xác định hệ phương trình vectơ gọn nhẹ:
  $ vec(D P) = w_A vec(D A) + w_B vec(D B) + w_C vec(D C) $
  với hệ số còn lại là $w_D = 1 - (w_A + w_B + w_C)$.
]

#meta-box[
  *Ứng dụng trong Đồ họa máy tính và Mô phỏng kỹ thuật:*
  
  - *Đồ họa máy tính:* Khi hiển thị một mô hình 3D (ví dụ một nhân vật game), máy tính biểu diễn bề mặt bằng hàng triệu tam giác hoặc khối tứ diện. Để tô màu mịn màng (Gouraud shading), nội suy ánh sáng hoặc dán vân bề mặt (texture mapping), card đồ họa (GPU) tính tọa độ tỉ cự của các điểm ảnh bên trong tam giác/tứ diện để pha trộn màu sắc từ các đỉnh.
  - *Phương pháp phần tử hữu hạn (FEM):* Khi mô phỏng ứng suất cơ học của một cánh máy bay hay độ phân bố nhiệt độ trên thân động cơ phản lực, các kỹ sư chia vật thể thành hàng triệu phần tử tứ diện (tetrahedral mesh). Tọa độ tỉ cự được dùng làm hàm cơ sở (shape function) để giải phương trình vi phân mô tả ứng suất hoặc nhiệt độ trên toàn bộ thể tích vật thể.
]

#vd-box("13c", "Xác định điểm nằm trong hay ngoài tứ diện bằng tọa độ tỉ cự")[
  Trong hệ tọa độ Oxyz, cho tứ diện $A B C D$ có các đỉnh là:
  $ A(1, 0, 0), quad B(0, 2, 0), quad C(0, 0, 3), quad D(0, 0, 0) $
  Một hạt bụi chuyển động lơ lửng trong không khí đến vị trí $P(0.2, 0.4, 0.6)$. Hãy xác định tọa độ tỉ cự của điểm $P$ đối với tứ diện $A B C D$ và cho biết hạt bụi nằm trong hay ngoài tứ diện.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - Xác định các vectơ từ gốc $D(0,0,0)$:
    - $vec(D A) = (1, 0, 0)$
    - $vec(D B) = (0, 2, 0)$
    - $vec(D C) = (0, 0, 3)$
    - $vec(D P) = (0.2, 0.4, 0.6)$
  - Thiết lập phương trình vectơ xác định tọa độ tỉ cự $w_A, w_B, w_C$:
    $ w_A vec(D A) + w_B vec(D B) + w_C vec(D C) = vec(D P) $
    $ w_A (1, 0, 0) + w_B (0, 2, 0) + w_C (0, 0, 3) = (0.2, 0.4, 0.6) $
  - Đồng nhất các tọa độ trên ba trục tọa độ, ta thu được hệ ba phương trình tuyến tính độc lập:
    $ cases(
      w_A dot 1 = 0.2,
      w_B dot 2 = 0.4,
      w_C dot 3 = 0.6
    ) => cases(
      w_A = 0.2,
      w_B = 0.2,
      w_C = 0.2
    ) $
  - Tính hệ số trọng số còn lại $w_D$:
    $ w_D = 1 - (w_A + w_B + w_C) = 1 - (0.2 + 0.2 + 0.2) = 0.4 $
  - *Kiểm tra vị trí:*
    - Ta thấy cả bốn tọa độ tỉ cự đều dương:
      $ w_A = 0.2 > 0, quad w_B = 0.2 > 0, quad w_C = 0.2 > 0, quad w_D = 0.4 > 0 $
    - Theo định lý về vị trí tương đối, vì tất cả các trọng số đều dương lớn hơn $0$, điểm $P$ nằm hoàn toàn phía *trong* khối tứ diện $A B C D$.
]

