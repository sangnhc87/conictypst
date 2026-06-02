import re

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

# Fix Mod 3.2 (Vuông góc, có đoạn vuông chung)
mod3_2_sol_old = """*Bước 1 (Quy giản hình học về tâm):*
  Do $(C_2)$ nằm trên mặt phẳng $y=6$ (vuông góc với trục tung), khoảng cách từ điểm $M$ bất kỳ tới $(C_2)$ luôn bị chặn dưới bởi khoảng cách tới tâm $J_2(0;6;4)$:
  $ M N >= M J_2 - R_2 => M N_(min) = M J_(2, min) - R_2 $
  *Bước 2 (Thiết lập hàm số khoảng cách):*
  Điểm $M$ thuộc $(C_1)$ (tâm $J_1(0;0;4)$, $R_1=2.5$ trên mặt $x=0$) có tọa độ dạng:
  $ M(0, 2.5 cos t, 4 + 2.5 sin t) $
  Khoảng cách $M J_2^2$ được tính bằng:
  $ M J_2^2 = (0 - 0)^2 + (2.5 cos t - 6)^2 + (4 + 2.5 sin t - 4)^2 $
  $ = 6.25 cos^2 t - 30 cos t + 36 + 6.25 sin^2 t $
  $ = 42.25 - 30 cos t $
  *Bước 3 (Tìm cực tiểu):*
  Để $M J_2$ đạt giá trị nhỏ nhất, $cos t$ phải đạt giá trị lớn nhất là $1$.
  Khi đó, $M J_(2, min) = sqrt(42.25 - 30) = sqrt(12.25) = 3.5$.
  *Bước 4 (Kết luận):*
  Khoảng cách ngắn nhất giữa hai đường tròn là:
  $ M N_(min) = 3.5 - 3 = 0.5. $"""

mod3_2_sol_new = """*Lưu ý sư phạm:* Với hai mặt phẳng vuông góc, việc dùng $M N >= M J_2 - R_2$ là **SAI LẦM CHẾT NGƯỜI** vì dấu bằng không bao giờ xảy ra (điểm $M$ không nằm trên mặt phẳng chứa $C_2$). Ta bắt buộc phải dùng **Phương pháp Vạn năng**.
  
  *Bước 1 (Tham số hóa và tính các thành phần)*
  - Điểm $M in (C_1)$ trên mặt phẳng $x=0$, tâm $J_1(0;0;4)$, $R_1=2.5$: 
    $ M(0, 2.5 cos t, 4 + 2.5 sin t) $
  - Đường tròn $(C_2)$ nằm trên mặt phẳng $(P_2): y=6$, tâm $J_2(0;6;4)$, $R_2=3$.
  - Bình phương khoảng cách đến tâm $J_2$:
    $ M J_2^2 = (0-0)^2 + (2.5 cos t - 6)^2 + (2.5 sin t)^2 = 42.25 - 30 cos t $
  - Bình phương khoảng cách từ $M$ đến mặt phẳng $(P_2)$:
    $ d(M, P_2)^2 = (|2.5 cos t - 6|)^2 = 36 - 30 cos t + 6.25 cos^2 t $
  
  *Bước 2 (Thiết lập hàm số Vạn năng)*
  Theo công thức khoảng cách 3D:
  $ d(M, (C_2))^2 = M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
  Ta tính lượng trong căn:
  $ M J_2^2 - d(M, P_2)^2 = 42.25 - 36 - 6.25 cos^2 t = 6.25 sin^2 t $
  Thay vào công thức với $R_2 = 3$:
  $ F(t) = 42.25 - 30 cos t + 9 - 6 sqrt(6.25 sin^2 t) = 51.25 - 30 cos t - 15|sin t| $
  
  *Bước 3 (Tìm cực tiểu bằng Cauchy-Schwarz)*
  Để $F(t)$ nhỏ nhất, biểu thức $A = 30 cos t + 15|sin t|$ phải lớn nhất.
  $ A <= sqrt((30^2 + 15^2)(cos^2 t + sin^2 t)) = sqrt(1125) = 15 sqrt(5) $
  Vậy $F_(min) = 51.25 - 15 sqrt(5) = (205 - 60 sqrt(5))/4$.
  $ => M N_(min) = sqrt(F_(min)) = sqrt(51.25 - 15 sqrt(5)) approx 4.208. $"""

code = code.replace(mod3_2_sol_old, mod3_2_sol_new)
code = code.replace("0.5", "$sqrt(51.25 - 15 sqrt(5))$", 1) # Fix answer in mod3_2

# Fix Mod 3.3 (Ví dụ 11)
mod3_3_sol_old = """*Bước 1 (Quy giản hình học về tâm):*
  Sử dụng chặn dưới quen thuộc cho khoảng cách từ điểm tới đường tròn trong không gian:
  $ M N >= M J_2 - R_2 => M N_(min) = M J_(2, min) - R_2 $
  *Bước 2 (Tham số hóa điểm $M$):*
  Do $M$ thuộc đường tròn $(C_1)$ nằm trên mặt $x=0$, tâm $J_1(0;0;4)$, bán kính $R_1=3$:
  $ M(0, 3 cos t, 4 + 3 sin t) $
  *Bước 3 (Thiết lập hàm khoảng cách $M J_2$):*
  $ M J_2^2 = (0 - 5)^2 + (3 cos t - 6)^2 + (4 + 3 sin t - 4)^2 $
  $ = 25 + 9 cos^2 t - 36 cos t + 36 + 9 sin^2 t $
  $ = 70 - 36 cos t $
  *Bước 4 (Kết luận):*
  Hàm số đạt giá trị nhỏ nhất khi $cos t = 1$, tức là:
  $ M J_(2, min) = sqrt(70 - 36) = sqrt(34) $
  Vậy khoảng cách cực tiểu giữa hai đường ống là:
  $ M N_(min) = M J_(2, min) - R_2 = sqrt(34) - 2. $"""

mod3_3_sol_new = """*Lưu ý:* Tuyệt đối không dùng $M N >= M J_2 - R_2$ vì đây là hai mặt phẳng vuông góc, dấu bằng không thể xảy ra!
  
  *Bước 1 (Tham số hóa)*
  - $M in (C_1)$ (tâm $J_1(0;0;4)$, $R_1=3$ trên mặt $x=0$): $ M(0, 3 cos t, 4 + 3 sin t) $
  - $(C_2)$ nằm trên mặt phẳng $(P_2): y=6$, tâm $J_2(5;6;4)$, $R_2=2$.
  
  *Bước 2 (Áp dụng công thức vạn năng)*
  - $M J_2^2 = (0 - 5)^2 + (3 cos t - 6)^2 + (3 sin t)^2 = 70 - 36 cos t$
  - $d(M, P_2)^2 = (|3 cos t - 6|)^2 = 36 - 36 cos t + 9 cos^2 t$
  - $M J_2^2 - d(M, P_2)^2 = 34 - 9 cos^2 t = 25 + 9 sin^2 t$
  Thay vào công thức $d(M, (C_2))^2 = M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2)$:
  $ F(t) = 70 - 36 cos t + 4 - 4 sqrt(25 + 9 sin^2 t) = 74 - (36 cos t + 4 sqrt(25 + 9 sin^2 t)) $
  
  *Bước 3 (Đánh giá cực trị)*
  Để $F(t)$ đạt cực tiểu, biểu thức $g(t) = 36 cos t + 4 sqrt(25 + 9 sin^2 t)$ phải đạt cực đại.
  Nhận thấy $g(t)$ lớn nhất khi $cos t$ lớn nhất ($cos t = 1$, suy ra $sin t = 0$).
  Khi đó $g(0) = 36(1) + 4 sqrt(25 + 0) = 36 + 20 = 56$.
  $ F_(min) = 74 - 56 = 18. $
  Vậy khoảng cách cực tiểu là $M N_(min) = sqrt(18) = 3 sqrt(2).$"""

code = code.replace(mod3_3_sol_old, mod3_3_sol_new)
code = code.replace("$sqrt(34) - 2$", "$3 sqrt(2)$", 1)

# Mod 3.4 (Ví dụ 12)
mod3_4_sol_old = """*Bước 1 (Đánh giá hạ giới khoảng cách):*
  Khoảng cách từ một điểm tới một đường tròn luôn lớn hơn hoặc bằng khoảng cách từ điểm đó tới tâm trừ đi bán kính:
  $ M N >= M J_2 - R_2 $
  *Bước 2 (Tham số hóa tọa độ):*
  Điểm $M$ thuộc $(C_1)$ (tâm $O(0;0;0)$, $R_1=5$ trên mặt phẳng $z=0$) có tọa độ dạng lượng giác:
  $ M(5 cos t, 5 sin t, 0) $
  *Bước 3 (Thiết lập hàm khoảng cách):*
  Bình phương khoảng cách từ $M$ tới tâm $J_2(8;4;6)$:
  $ M J_2^2 = (5 cos t - 8)^2 + (5 sin t - 4)^2 + (0 - 6)^2 $
  $ = 25 cos^2 t - 80 cos t + 64 + 25 sin^2 t - 40 sin t + 16 + 36 $
  $ = 141 - 40(2 cos t + sin t) $
  *Bước 4 (Sử dụng Bất đẳng thức Bunyakovsky):*
  Để $M J_2$ nhỏ nhất thì biểu thức $T = 2 cos t + sin t$ phải lớn nhất.
  Áp dụng Bunyakovsky: $T^2 = (2 cos t + 1 sin t)^2 <= (2^2 + 1^2)(cos^2 t + sin^2 t) = 5(1) = 5$.
  Do đó $T_(max) = sqrt(5)$.
  Khi đó $M J_(2, min) = sqrt(141 - 40 sqrt(5))$.
  *Bước 5 (Kết luận):*
  Khoảng cách ngắn nhất cần tìm là:
  $ M N_(min) = sqrt(141 - 40 sqrt(5)) - 4. $"""

mod3_4_sol_new = """*Lưu ý:* Việc dùng Bunyakovsky cho $M J_2$ rồi trừ $R_2$ ở đây là **SAI LẦM**, vì khi đó điểm $M$ không hề nằm trên mặt phẳng $y=4$, dấu bằng không thể xảy ra. Ta phải dùng bảng Table Casio quét hàm Vạn năng.
  
  *Bước 1 (Thiết lập các thành phần)*
  - $M in (C_1)$ (mặt $z=0$, $J_1(0;0;0)$, $R_1=5$): $M(5 cos t, 5 sin t, 0)$
  - $(C_2)$ trên mặt phẳng $(P_2): y=4$, $J_2(8;4;6)$, $R_2=4$.
  - Khoảng cách đến tâm: $ M J_2^2 = (5 cos t - 8)^2 + (5 sin t - 4)^2 + 36 = 141 - 40(2 cos t + sin t) $
  - Khoảng cách đến mặt $(P_2)$: $ d(M, P_2)^2 = (|5 sin t - 4|)^2 $
  
  *Bước 2 (Hàm Vạn năng & Bấm máy Casio)*
  Thay vào công thức $d(M, (C_2))^2 = M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2)$, ta được:
  $ F(t) = 157 - 40(2 cos t + sin t) - 8 sqrt(141 - 40(2 cos t + sin t) - (5 sin t - 4)^2) $
  Sử dụng chức năng `TABLE` (Menu 8 trên Casio) quét hàm số $F(X)$ với:
  - Bắt đầu (Start): $0$
  - Kết thúc (End): $2 pi$ (xấp xỉ 6.28)
  - Bước nhảy (Step): $2 pi / 40$
  Ta thấy giá trị cực tiểu của $F(X)$ xấp xỉ $11.254$ tại $X approx 0.6$.
  $ => M N_(min) = sqrt(F_(min)) = sqrt(11.254) approx 3.354. $"""

code = code.replace(mod3_4_sol_old, mod3_4_sol_new)
code = code.replace("[$sqrt(141 - 40 sqrt(5)) - 4$]", "[$approx 3.354$]")

# Mod 4.1 (Ví dụ 15)
mod4_1_sol_old = """*Cách 1 (Quy giản hình học về tâm):*
  Ta sử dụng bất đẳng thức khoảng cách $M N >= M J_2 - R_2$.
  - $M(4 cos t, 4 sin t, 0)$ (do $M in (C_1)$)
  - Bình phương khoảng cách $M J_2$:
    $ M J_2^2 = (4 cos t)^2 + (4 sin t - 3)^2 + (0 - (-3))^2 $
    $ = 16 cos^2 t + 16 sin^2 t - 24 sin t + 9 + 9 = 34 - 24 sin t $
  - Giá trị nhỏ nhất của $M J_2$ đạt được khi $sin t = 1$:
    $ M J_(2, min) = sqrt(34 - 24) = sqrt(10) $
  - Khoảng cách ngắn nhất là:
    $ M N_(min) = sqrt(10) - 2. $
  
  *Cách 2 (Phương pháp Vạn năng & Bấm máy):*"""

mod4_1_sol_new = """*Phương pháp Vạn năng (Chính xác tuyệt đối)*
  Cảnh báo: Cách dùng $MN >= MJ_2 - R_2$ sẽ ra $\sqrt{10}-2$ là **SAI** do dấu bằng không xảy ra trên mặt phẳng nghiêng. Ta bắt buộc phải quét hàm thực tế:"""

code = code.replace(mod4_1_sol_old, mod4_1_sol_new)
code = code.replace("[$sqrt(10) - 2$]", "[$sqrt(14 - 8 sqrt(2))$]")

mod4_1_sol_casio_old = """- Bước 3: Hàm khoảng cách thực tế là:
    $ F(t) = 38 - 24 sin t - 4sqrt(34 - 24 sin t - (16 sin^2 t - 48 sin t + 36)/2) $
  Quét bằng Casio, ta thấy min đạt được tại $sin t = 1$, giá trị chính xác là $(sqrt(10) - 2)^2$!"""
mod4_1_sol_casio_new = """- Bước 3: Lượng trong căn:
    $ M J_2^2 - d(M, P_2)^2 = 34 - 24 sin t - (8 sin^2 t - 24 sin t + 18) = 16 - 8 sin^2 t $
  - Bước 4: Hàm khoảng cách thực tế là:
    $ F(t) = 38 - 24 sin t - 4sqrt(16 - 8 sin^2 t) $
  Hàm số đạt giá trị cực tiểu khi ta cực đại hóa phần bị trừ $g(t) = 24 sin t + 4sqrt(16 - 8 sin^2 t)$.
  $g(t)$ lớn nhất rõ ràng khi $sin t = 1$. Khi đó $g(pi/2) = 24 + 4sqrt(8) = 24 + 8sqrt(2)$.
  $ => F_(min) = 38 - (24 + 8sqrt(2)) = 14 - 8sqrt(2). $
  Khoảng cách tối ưu thực sự là: $M N_(min) = sqrt(14 - 8sqrt(2)) approx 1.639.$"""
code = code.replace(mod4_1_sol_casio_old, mod4_1_sol_casio_new)

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)


