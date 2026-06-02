import re

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

# Mod 4.2 (Ví dụ 16)
mod4_2_sol_old = """*Cách 1 (Quy giản hình học về tâm):*
  Ta dùng bất đẳng thức: $ M N >= M J_2 - R_2 $.
  - $M in (C_1) => M(5 cos t, 5 sin t, 0)$.
  - $M J_2^2 = (5 cos t - 0)^2 + (5 sin t - 4)^2 + (0 - 4)^2 $
    $ = 25 cos^2 t + 25 sin^2 t - 40 sin t + 16 + 16 = 57 - 40 sin t. $
  - Hàm số nhỏ nhất khi $sin t = 1$, khi đó:
    $ M J_(2, min) = sqrt(57 - 40) = sqrt(17). $
  - Khoảng cách ngắn nhất là:
    $ M N_(min) = sqrt(17) - 2. $
  
  *Cách 2 (Phương pháp Vạn năng & Bấm máy):*"""

mod4_2_sol_new = """*Phương pháp Vạn năng (Chính xác tuyệt đối)*
  Cảnh báo: Cách dùng quy giản hình học về tâm sẽ cho ra kết quả $\sqrt{17}-2 \approx 2.12$ là **SAI** do $M$ không hề nằm trên mặt phẳng nghiêng, dấu bằng không xảy ra. Ta bắt buộc phải quét hàm thực tế:"""

code = code.replace(mod4_2_sol_old, mod4_2_sol_new)

mod4_2_casio_old = """- Bước 3: Hàm khoảng cách thực tế:
    $ F(t) = 61 - 40 sin t - 4sqrt(57 - 40 sin t - 12.5 sin^2 t) $
  Sử dụng Casio quét hàm $F(t)$ với $t in [0; 2 pi]$, ta tìm được cực tiểu khi $sin t = 1$.
  $ F(pi/2) = 61 - 40 - 4sqrt(57 - 40 - 12.5) = 21 - 4sqrt(4.5) = (sqrt(17) - 2)^2. $"""
mod4_2_casio_new = """- Bước 3: Tính lượng trong căn:
    $ M J_2^2 - d(M, P_2)^2 = 57 - 40 sin t - 12.5 sin^2 t $
  - Bước 4: Hàm khoảng cách thực tế:
    $ F(t) = 61 - 40 sin t - 4sqrt(57 - 40 sin t - 12.5 sin^2 t) $
  Sử dụng Casio quét hàm $F(t)$ với $t in [0; 2 pi]$ (Start: 0, End: 2pi, Step: 2pi/40).
  Ta tìm được cực tiểu $F(t) approx 11.79$ tại $t approx 0.84$.
  $ => M N_(min) = sqrt(11.79) approx 3.434. $
  (Rõ ràng lớn hơn rất nhiều so với kết quả sai lầm $\sqrt{17}-2 \approx 2.12$)."""

code = code.replace(mod4_2_casio_old, mod4_2_casio_new)
code = code.replace("[$sqrt(17) - 2$]", "[$approx 3.434$]")

# Mod 4.3 (Ví dụ 13)
mod4_3_note_old = """*Lưu ý sư phạm (Trực quan hóa cấu hình):*
  
  Khi quan sát hình chiếu vuông góc từ trên xuống dọc theo trục tung (như hình minh họa bên), ta dễ dàng nhận thấy mặt phẳng $(C_1)$ nằm ngang ngang và mặt phẳng chứa $(C_2)$ tạo với nó một góc $30^o$. Góc này có thể tính trực tiếp qua cosin góc giữa hai pháp vectơ $arrow(n)_1 = (0;0;1)$ và $arrow(n)_2 = (0;1;-sqrt(3))$:
  $ cos alpha = (|arrow(n)_1 dot arrow(n)_2|) / (|arrow(n)_1| dot |arrow(n)_2|) = sqrt(3)/2 => alpha = 30^o $.
  
  Do bài toán tìm khoảng cách ngắn nhất từ một điểm trên $(C_1)$ tới đường tròn $(C_2)$, việc thiết lập trực tiếp sẽ rất phức tạp vì $C_2$ nằm nghiêng. Giải pháp vạn năng là *Quy giản hình học về tâm $J_2$*:
  Thay vì xét $N in (C_2)$, ta đánh giá khoảng cách từ $M in (C_1)$ tới tâm cố định $J_2$:
  $ M N >= M J_2 - R_2 => M N_(min) = M J_(2, min) - R_2 $."""

mod4_3_note_new = """*Lưu ý sư phạm:*
  
  Góc giữa hai mặt phẳng có thể tính trực tiếp qua cosin góc giữa hai pháp vectơ $arrow(n)_1 = (0;0;1)$ và $arrow(n)_2 = (0;1;-sqrt(3))$:
  $ cos alpha = (|arrow(n)_1 dot arrow(n)_2|) / (|arrow(n)_1| dot |arrow(n)_2|) = sqrt(3)/2 => alpha = 30^o $.
  
  Cảnh báo: Nếu đánh giá $M N >= M J_2 - R_2$ thì kết quả sẽ **hoàn toàn sai** (đạt $1.11$) do $M$ không nằm trên mặt phẳng nghiêng. Bắt buộc phải sử dụng Công thức Vạn năng và Casio!"""

code = code.replace(mod4_3_note_old, mod4_3_note_new)

mod4_3_steps_old = """*Bước 1 (Tham số hóa điểm $M$):*
Do điểm $M$ thuộc đường tròn $(C_1)$ có tâm gốc tọa độ $O(0;0;0)$ và bán kính $R_1=6$ trên mặt phẳng ngang $z=0$, tọa độ $M$ hoàn toàn được xác định bởi một góc quay $t in [0; 2 pi)$:
$ M(6 cos t, 6 sin t, 0) $

*Bước 2 (Thiết lập hàm khoảng cách $M J_2$):*
Bình phương khoảng cách từ điểm di động $M$ đến tâm cố định $J_2(0; 3sqrt(3); 3)$ được thiết lập qua Pytago 3D:
$ M J_2^2 = (6 cos t - 0)^2 + (6 sin t - 3sqrt(3))^2 + (0 - 3)^2 $
$ = 36 cos^2 t + (36 sin^2 t - 36 sqrt(3) sin t + 27) + 9 $
Gộp $cos^2 t + sin^2 t = 1$, ta thu gọn được biểu thức cực kỳ đẹp:
$ = 36(1) - 36 sqrt(3) sin t + 36 = 72 - 36 sqrt(3) sin t. $

*Bước 3 (Tìm giá trị cực tiểu):*
Để đoạn thẳng $M J_2$ ngắn nhất, lượng bị trừ $36 sqrt(3) sin t$ phải đạt giá trị lớn nhất.
Nghĩa là $sin t$ phải lớn nhất: $sin t = 1$ (khi $t = pi/2$, ứng với điểm $M(0; 6; 0)$ hướng thẳng về $J_2$).
Khi đó:
$ M J_(2, min) = sqrt(72 - 36 sqrt(3)) = sqrt(36(2 - sqrt(3))) = 6sqrt(2-sqrt(3)) $
Sử dụng hằng đẳng thức $2 - sqrt(3) = (sqrt(3)-1)^2/2$, ta có:
$ M J_(2, min) = 6 dot (sqrt(3)-1)/sqrt(2) = 3 sqrt(2)(sqrt(3)-1) = 3 sqrt(6) - 3 sqrt(2) $

*Bước 4 (Kết luận):*
Độ dài đoạn cáp nối ngắn nhất giữa hai viền đường tròn là:
$ M N_(min) = M J_(2, min) - R_2 = 3 sqrt(6) - 3 sqrt(2) - 2 $
(Khoảng cách này xấp xỉ $1.11$ dm).

*Cách 2 (Giải siêu tốc bằng công thức Vạn năng & Máy tính Casio):*"""

mod4_3_steps_new = """*Phương pháp Vạn năng (Chính xác)*"""

code = code.replace(mod4_3_steps_old, mod4_3_steps_new)

mod4_3_casio_old = """Dùng chức năng TABLE trên Casio quét $F(t)$ với $t in [0; 2 pi]$, hàm số đạt MIN khi $sin t = 1$ ($t = pi/2$):
$ F(pi/2) = 76 - 36 sqrt(3) - 4sqrt(72 - 36 sqrt(3) - 9) = (3 sqrt(6) - 3 sqrt(2) - 2)^2 $
$ => M N_(min) = sqrt(F(pi/2)) = 3 sqrt(6) - 3 sqrt(2) - 2. $"""

mod4_3_casio_new = """Dùng chức năng TABLE trên Casio quét $F(t)$ với $t in [0; 2 pi]$ (Start: 0, End: 2pi, Step: 2pi/40).
Ta tìm được giá trị cực tiểu của $F(t)$ xấp xỉ $8.028$ tại góc $t approx 1.18$ rad.
$ => M N_(min) = sqrt(F_(min)) = sqrt(8.028) approx 2.833 $ dm."""

code = code.replace(mod4_3_casio_old, mod4_3_casio_new)
code = code.replace("[$3 sqrt(6) - 3 sqrt(2) - 2$]", "[$approx 2.833$]")

# Bài 7 (Vuông góc lệch trục)
b7_old = """*Bước 1 (Quy giản hình học về tâm):*
    Áp dụng đánh giá khoảng cách dưới về tâm đường tròn $J_2(5;3;12)$ của đường tròn thứ hai:
    $ M N >= M J_2 - R_2 => M N_(min) = M J_(2, min) - R_2 $
    *Bước 2 (Tham số hóa điểm $M$):*
    Điểm $M$ thuộc đường tròn $(C_1)$ trên mặt phẳng $z=0$ có bán kính $R_1 = 3$ có dạng:
    $ M(3 cos t, 3 sin t, 0) $ với $t in [0; 2 pi)$.
    *Bước 3 (Thiết lập hàm số khoảng cách):*
    Tính bình phương khoảng cách từ $M$ đến tâm $J_2(5;3;12)$:
    $ M J_2^2 = (3 cos t - 5)^2 + (3 sin t - 3)^2 + (0 - 12)^2 $
    $ = 9 cos^2 t - 30 cos t + 25 + 9 sin^2 t - 18 sin t + 9 + 144 $
    $ = 9(cos^2 t + sin^2 t) - 30 cos t - 18 sin t + 178 $
    $ = 187 - 6(5 cos t + 3 sin t). $
    *Bước 4 (Tìm cực tiểu bằng Cauchy-Schwarz):*
    Để $M J_2^2$ nhỏ nhất thì biểu thức lượng giác $A = 5 cos t + 3 sin t$ phải lớn nhất.
    Áp dụng Cauchy-Schwarz:
    $ A = 5 cos t + 3 sin t <= sqrt((5^2 + 3^2)(cos^2 t + sin^2 t)) = sqrt(34) $
    Giá trị lớn nhất của $A$ là $sqrt(34)$. Thay vào ta được:
    $ M J_(2, min) = sqrt(187 - 6 sqrt(34)) $
    *Bước 5 (Kết luận):*
    Khoảng cách cực tiểu giữa hai đường tròn là:
    $ M N_(min) = M J_(2, min) - R_2 = sqrt(187 - 6 sqrt(34)) - 4. $"""

b7_new = """*Phân tích:* Do hai mặt phẳng $z=0$ và $y=3$ vuông góc nhau, ta không thể dùng bất đẳng thức $M N >= M J_2 - R_2$ (dấu bằng không xảy ra). Ta phải dùng Phương pháp Vạn năng.
    
    *Bước 1 (Thiết lập)*
    - Điểm $M in (C_1)$ trên $z=0$, $J_1(0;0;0)$, $R_1=3$: $M(3 cos t, 3 sin t, 0)$.
    - Đường tròn $(C_2)$ trên $y=3$, $J_2(5;3;12)$, $R_2=4$.
    - Khoảng cách đến tâm: $M J_2^2 = (3 cos t - 5)^2 + (3 sin t - 3)^2 + 144 = 187 - 6(5 cos t + 3 sin t)$.
    - Khoảng cách đến mặt phẳng: $d(M, P_2)^2 = (|3 sin t - 3|)^2 = 9 - 18 sin t + 9 sin^2 t$.
    
    *Bước 2 (Hàm Vạn năng & Bấm máy)*
    $ F(t) = M J_2^2 + 16 - 8 sqrt(M J_2^2 - d(M, P_2)^2) $
    Sử dụng chức năng TABLE của máy tính Casio để quét hàm số trên đoạn $t in [0; 2 pi]$.
    Tìm được giá trị cực tiểu của $F(t) approx 69.967$ tại $t approx 0.62$ rad.
    $ => M N_(min) = sqrt(F_(min)) approx 8.364. $
    (Nếu dùng cách quy giản sai lầm ta sẽ ra đáp án $sqrt(187 - 6 sqrt(34)) - 4 approx 7.22$, một cái bẫy điển hình trong đề thi!)"""

code = code.replace(b7_old, b7_new)
code = code.replace("[$sqrt(187 - 6 sqrt(34)) - 4$]", "[$approx 8.364$]")


with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
