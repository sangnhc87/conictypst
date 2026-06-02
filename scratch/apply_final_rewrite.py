with open("scratch/generate_deep_2_circles_3D.py", "r", encoding="utf-8") as f:
    content = f.read()

# 1. Update A. LÝ THUYẾT NỀN TẢNG & PHƯƠNG PHÁP TƯ DUY with direction choice explanation
old_theory_part = """- Do đó, khoảng cách ngắn nhất từ điểm $M$ đến đường tròn $(C_2)$ được xác định bởi công thức Pytago phân rã chính xác:
     $ d(M, (C_2)) = sqrt(d(M, P_2)^2 + (M_p J_2 - R_2)^2) $
   - *Kỹ thuật quy giản thi cử về tâm (Đánh giá chặn dưới):* Trong thực tế làm bài thi trắc nghiệm, do biểu thức Pytago chính xác có dạng vô tỷ kép rất phức tạp để giải bằng tay, ta sử dụng đánh giá xấp xỉ hình học thông qua tâm đường tròn:
     $ M N >= M J_2 - R_2 $
     Độ dài đoạn $M N$ ngắn nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2$ là nhỏ nhất. Điều này đưa bài toán khó về dạng cơ bản hơn là tìm cực trị khoảng cách từ một điểm trên đường tròn $(C_1)$ đến một điểm cố định $J_2$."""

new_theory_part = """- Do đó, khoảng cách ngắn nhất từ điểm $M$ đến đường tròn $(C_2)$ được xác định bởi công thức Pytago phân rã chính xác:
     $ d(M, (C_2)) = sqrt(d(M, P_2)^2 + (M_p J_2 - R_2)^2) $
   - *Kỹ thuật quy giản thi cử về tâm (Đánh giá chặn dưới):* Trong thực tế làm bài thi trắc nghiệm, do biểu thức Pytago chính xác có dạng vô tỷ kép rất phức tạp để giải bằng tay, ta sử dụng đánh giá xấp xỉ hình học thông qua tâm đường tròn:
     $ M N >= M J_2 - R_2 $
     Độ dài đoạn $M N$ ngắn nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2$ là nhỏ nhất. Điều này đưa bài toán khó về dạng cơ bản hơn là tìm cực trị khoảng cách từ một điểm trên đường tròn $(C_1)$ đến một điểm cố định $J_2$.

   - *Lưu ý sư phạm quan trọng - Lựa chọn hướng chiếu:*
     *Câu hỏi:* Tại sao ta chiếu điểm $M in (C_1)$ lên mặt phẳng $(P_2)$ chứa $(C_2)$ mà không làm ngược lại (chiếu $N in (C_2)$ lên mặt phẳng $(P_1)$)?
     *Trả lời:*
     - **Tính đối xứng:** Về mặt toán học, hai hướng chiếu là hoàn toàn đối xứng và luôn cho cùng một kết quả khoảng cách ngắn nhất $M N$ vì vai trò của $M, N$ trong không gian là tương đương nhau.
     - **Tiêu chí lựa chọn hướng chiếu tối ưu (để tính toán đơn giản nhất):** Ta nên chọn chiếu từ điểm trên mặt phẳng/đường tròn có cấu trúc phức tạp hơn sang mặt phẳng chứa đường tròn có cấu trúc đơn giản hơn theo hai tiêu chí:
       1. *Mặt phẳng đơn giản hơn:* Ưu tiên chiếu về các mặt phẳng tọa độ ($O x y: z=0$, $O y z: x=0$, $O x z: y=0$) hoặc mặt phẳng song song với mặt tọa độ. Phương trình của các mặt phẳng này cực kỳ đơn giản, giúp cho tọa độ hình chiếu $M_p$ có nhiều thành phần bằng $0$, làm giảm số lượng biến số và phép tính căn thức.
       2. *Bán kính và tham số hóa:* Nên chọn chiếu điểm từ đường tròn có bán kính lớn hơn (hoặc dễ tham số hóa hơn) sang mặt phẳng chứa đường tròn nhỏ hơn, giúp việc lấy hiệu hai bán kính $|M_p J_2 - R_2|$ trong Pytago không bị vấp phải dấu trị tuyệt đối phức tạp khi biến đổi đạo hàm."""

content = content.replace(old_theory_part, new_theory_part)

# 2. Add note on direction choice inside generate_mod3_1()
old_mod3_1_note = """#note[
  *Lưu ý sư phạm:* Đây là cấu hình hai đường tròn nằm trên hai mặt phẳng vuông góc đối xứng. Ta sẽ áp dụng chính xác phương pháp chiếu Pytago không gian để phân rã khoảng cách và khảo sát hàm một biến số để tìm cực tiểu.
]"""

new_mod3_1_note = """#note[
  *Lưu ý sư phạm:* Đây là cấu hình hai đường tròn nằm trên hai mặt phẳng vuông góc đối xứng. Ta sẽ áp dụng chính xác phương pháp chiếu Pytago không gian để phân rã khoảng cách và khảo sát hàm một biến số để tìm cực tiểu.
]
#note[
  *Giải thích về hướng chiếu:*
  Trong bài này, ta có $(C_1)$ nằm trên mặt phẳng tọa độ $z=0$ và $(C_2)$ nằm trên mặt phẳng tọa độ $x=0$.
  - Nếu chiếu $M(3 cos t, 3 sin t, 0) in (C_1)$ lên mặt phẳng $x=0$, hình chiếu là $M_p(0, 3 sin t, 0)$ (cực kỳ đơn giản).
  - Nếu làm ngược lại, chiếu $N(0, 4 cos u + 6, 4 sin u + 8) in (C_2)$ lên mặt phẳng $z=0$, hình chiếu là $N_p(0, 4 cos u + 6, 0)$ (phức tạp hơn vì tọa độ vẫn phụ thuộc vào ẩn $u$).
  Do đó, việc chọn chiếu $M$ lên mặt phẳng của $(C_2)$ giúp triệt tiêu biến số nhanh hơn và phép tính đơn giản hơn nhiều so với chiều ngược lại!
]"""

content = content.replace(old_mod3_1_note, new_mod3_1_note)

# 3. Add generate_mod3_3 and generate_mod4_2 definitions before generate_all()
new_mods_2 = """
def generate_mod3_3():
    stmt = \"\"\"(Ví dụ 15: Cấu hình 3.3 - Vuông góc, lệch trục bất đối xứng) Trong hệ trục tọa độ $O x y z$, hai đĩa xoay của thiết bị tự động được lắp đặt trên hai mặt đứng vuông góc là $(P_1): x=2$ và $(P_2): y=3$. Đĩa thứ nhất là đường tròn $(C_1)$ trên mặt phẳng $x=2$ có tâm $J_1(2;0;0)$ và bán kính $R_1=3$. Đĩa thứ hai là đường tròn $(C_2)$ trên mặt phẳng $y=3$ có tâm $J_2(0;3;5)$ và bán kính $R_2=2$. Hãy tìm khoảng cách ngắn nhất giữa một điểm $M$ trên viền đĩa $(C_1)$ và một điểm $N$ trên viền đĩa $(C_2)$ bằng phương pháp quy giản về tâm?\"\"\"
    sol = \"\"\"#ppgiai[
  - Đĩa $(C_1)$ nằm trên mặt phẳng $x=2$, tâm $J_1(2; 0; 0)$, bán kính $R_1 = 3$.
  - Đĩa $(C_2)$ nằm trên mặt phẳng $y=3$, tâm $J_2(0; 3; 5)$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm:* Đây là bài toán cực trị khoảng cách giữa hai đường tròn nằm trên hai mặt đứng vuông góc và chéo nhau trong không gian. Ta áp dụng phương pháp quy giản hình học về tâm $J_2$ để tính toán nhanh gọn và chính xác.
]
*Bước 1 (Quy giản hình học về tâm):*
Theo bất đẳng thức tam giác trong không gian, ta luôn có đánh giá khoảng cách chặn dưới:
$ M N >= M J_2 - R_2 $
Do đó, khoảng cách ngắn nhất nối hai đường tròn đạt được khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2(0; 3; 5)$ đạt giá trị nhỏ nhất:
$ M N_(min) = M J_(2, min) - R_2 $

*Bước 2 (Tham số hóa lượng giác):*
Do điểm $M$ nằm trên đường tròn $(C_1)$ trong mặt phẳng đứng $x=2$, có tâm $J_1(2;0;0)$ và bán kính $R_1 = 3$. Ta tham số hóa tọa độ của $M$ theo góc $t in [0; 2 pi)$:
$ M(2, 3 cos t, 3 sin t) $

*Bước 3 (Thiết lập hàm số khoảng cách):*
Tính bình phương khoảng cách từ $M$ đến tâm $J_2(0;3;5)$:
$ M J_2^2 = (2 - 0)^2 + (3 cos t - 3)^2 + (3 sin t - 5)^2 $
$ = 4 + (9 cos^2 t - 18 cos t + 9) + (9 sin^2 t - 30 sin t + 25) $
$ = 4 + 9(cos^2 t + sin^2 t) - 18 cos t - 30 sin t + 34 $
$ = 47 - 6(3 cos t + 5 sin t). $

*Bước 4 (Áp dụng bất đẳng thức để tìm cực tiểu):*
Để $M J_2^2$ nhỏ nhất thì biểu thức lượng giác $A = 3 cos t + 5 sin t$ phải đạt giá trị lớn nhất.
Theo bất đẳng thức Cauchy-Schwarz:
$ A = 3 cos t + 5 sin t <= sqrt((3^2 + 5^2)(cos^2 t + sin^2 t)) = sqrt(34) $
Giá trị lớn nhất của $A$ là $sqrt(34)$. Thế vào ta được:
$ M J_(2, min) = sqrt(47 - 6 sqrt(34)} $

*Bước 5 (Kết luận):*
Khoảng cách ngắn nhất giữa hai đĩa xoay là:
$ M N_(min) = M J_(2, min) - R_2 = sqrt(47 - 6 sqrt(34)} - 2 $
(Khoảng cách này xấp xỉ $1.47$ dm).\"\"\"
    # Calculate M and N for drawing
    M_y = 3 * 3 / math.sqrt(34)
    M_z = 3 * 5 / math.sqrt(34)
    fig = draw_2_circles_cetz((2,0,0), 3, (1,0,0,-2), (0,3,5), 2, (0,1,0,-3), (2, M_y, M_z), (0,3,5-2), scale=0.33)
    return stmt, \"[$sqrt(47 - 6 sqrt(34)) - 2$]\", sol, fig

def generate_mod4_2():
    stmt = \"\"\"(Ví dụ 16: Cấu hình 4.2 - Hai mặt phẳng nghiêng góc $45°$) Trong một hệ thống dẫn nhiên liệu tự động, hai vành đệm tròn $(C_1)$ và $(C_2)$ được đặt trên hai mặt phẳng nghiêng nhau một góc $45°$. Vành thứ nhất $(C_1)$ nằm trên mặt nằm ngang $z=0$, có tâm $J_1(0;0;0)$ và bán kính $R_1=5$. Vành thứ hai $(C_2)$ nằm trên mặt nghiêng $(P): y-z=0$, có tâm $J_2(0;4;4)$ và bán kính $R_2=2$. Hãy xác định khoảng cách ngắn nhất giữa hai vành đệm bằng phương pháp quy giản về tâm?\"\"\"
    sol = \"\"\"#ppgiai[
  - Vành thứ nhất $(C_1)$ trên mặt phẳng $z=0$, tâm $J_1(0; 0; 0)$, bán kính $R_1 = 5$.
  - Vành thứ hai $(C_2)$ trên mặt phẳng nghiêng $y-z=0$, tâm $J_2(0; 4; 4)$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm:* Hai mặt phẳng $z=0$ (pháp vectơ $\\\\vec{n}_1 = (0;0;1)$) và $y-z=0$ (pháp vectơ $\\\\vec{n}_2 = (0;1;-1)$) có góc giữa hai mặt phẳng được tính bởi $cos alpha = |\\\\vec{n}_1 dot \\\\vec{n}_2| / (1 dot sqrt(2)) = 1/sqrt(2) \\\\Rightarrow alpha = 45^o$. Ta áp dụng phương pháp quy giản khoảng cách về tâm $J_2$ của đường tròn $(C_2)$.
]
*Bước 1 (Quy giản hình học về tâm):*
Ta áp dụng đánh giá khoảng cách chặn dưới: $M N >= M J_2 - R_2$. Khoảng cách giữa hai đường tròn nhỏ nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2(0; 4; 4)$ đạt giá trị nhỏ nhất:
$ M N_(min) = M J_(2, min) - R_2 $

*Bước 2 (Tham số hóa lượng giác):*
Do điểm $M$ nằm trên đường tròn $(C_1)$ có tâm $J_1(0;0;0)$ và bán kính $R_1=5$ trên mặt phẳng $z=0$, ta tham số hóa tọa độ của $M$ theo góc $t in [0; 2 pi)$:
$ M(5 cos t, 5 sin t, 0) $

*Bước 3 (Thiết lập hàm số khoảng cách):*
Tính bình phương khoảng cách từ $M$ đến tâm $J_2(0;4;4)$:
$ M J_2^2 = (5 cos t - 0)^2 + (5 sin t - 4)^2 + (0 - 4)^2 $
$ = 25 cos^2 t + (25 sin^2 t - 40 sin t + 16) + 16 $
$ = 25(cos^2 t + sin^2 t) - 40 sin t + 32 $
$ = 25 + 32 - 40 sin t = 57 - 40 sin t. $

*Bước 4 (Tìm giá trị cực tiểu):*
Để khoảng cách $M J_2$ nhỏ nhất thì $57 - 40 sin t$ phải nhỏ nhất, tương đương với $sin t$ phải đạt giá trị lớn nhất.
Ta biết giá trị lớn nhất của $sin t$ là $1$ (xảy ra khi $t = pi/2$, ứng với điểm $M(0; 5; 0)$).
Khi đó:
$ M J_(2, min) = sqrt(57 - 40(1)} = sqrt(17) $

*Bước 5 (Kết luận):*
Độ dài ngắn nhất nối hai vành đệm chéo nhau nghiêng $45^o$ là:
$ M N_(min) = M J_(2, min) - R_2 = sqrt(17) - 2 $
(Khoảng cách này xấp xỉ $2.12$ dm).\"\"\"
    fig = draw_2_circles_cetz((0,0,0), 5, (0,0,1,0), (0,4,4), 2, (0,1,-1,0), (0,5,0), (0,4, 4-2), scale=0.33)
    return stmt, \"[$sqrt(17) - 2$]\", sol, fig
"""

content = content.replace("def generate_all():", new_mods_2 + "\ndef generate_all():")

# 4. Update the models array in generate_all()
old_models_2 = """    models = [
        generate_mod1_1, generate_mod1_2, generate_mod1_3,
        generate_mod2_1, generate_mod2_2, generate_mod2_3,
        generate_mod3_1, generate_mod3_2, generate_mod4_1,
        generate_mod5_1, generate_mod6_1, generate_mod6_2,
        generate_mod6_3, generate_mod6_4
    ]"""

new_models_2 = """    models = [
        generate_mod1_1, generate_mod1_2, generate_mod1_3,
        generate_mod2_1, generate_mod2_2, generate_mod2_3,
        generate_mod3_1, generate_mod3_2, generate_mod3_3,
        generate_mod4_1, generate_mod4_2, generate_mod5_1,
        generate_mod6_1, generate_mod6_2, generate_mod6_3,
        generate_mod6_4
    ]"""

content = content.replace(old_models_2, new_models_2)

# 5. Overwrite the practice problems section with detailed solutions
old_practice_section = """    # 8 Practice Problems
    output += \"\"\"
#v(1.5em)
== B. BÀI TẬP TỰ LUYỆN PHÂN LOẠI (CÓ ĐÁP SỐ CHỮ/SỐ)

Dưới đây là các bài tập phân loại giúp học sinh rèn luyện tư duy thực tế và củng cố phương pháp giải theo từng cấu hình:

#tln(
  [*Bài 1 (Cấu hình 1.2 - Đồng phẳng, lồng nhau):* Cho hai đường tròn $(C_1)$ và $(C_2)$ đồng phẳng trên mặt đất $z=0$. Vòng chạy ngoài $(C_1)$ có tâm $J_1(1;1;0)$, bán kính $R_1=8$. Vòng chạy trong $(C_2)$ có tâm $J_2(2;3;0)$, bán kính $R_2=3$. Tìm khoảng cách lớn nhất và nhỏ nhất giữa hai điểm $M in (C_1)$ và $N in (C_2)$?],
  [$M N_(min) = 5 - sqrt(5), M N_(max) = 11 + sqrt(5)$]
)

#tln(
  [*Bài 2 (Cấu hình 1.2 - Đồng phẳng, tiếp xúc ngoài):* Hai vòng tròn nhựa được đặt tiếp xúc ngoài với nhau trên bàn phẳng $z=0$. Vòng $(C_1)$ tâm $J_1(0;0;0)$, bán kính $R_1=5$. Vòng $(C_2)$ tâm $J_2(x_0; 0; 0)$ với $x_0 > 0$, bán kính $R_2=3$. Do hai vòng tiếp xúc ngoài nên $J_1 J_2 = R_1 + R_2 = 8$. Tìm khoảng cách lớn nhất giữa một điểm $M in (C_1)$ và một điểm $N in (C_2)$?],
  [$16$]
)

#tln(
  [*Bài 3 (Cấu hình 2.1 - Song song, đồng trục):* Hai vành thép chịu lực tròn nằm trên hai mặt phẳng song song $z=2$ và $z=10$. Vành dưới $(C_1)$ có tâm $J_1(1;2;2)$, bán kính $R_1=6$. Vành trên $(C_2)$ có tâm $J_2(1;2;10)$, bán kính $R_2=2$. Một thanh nối thẳng kết nối điểm $M in (C_1)$ và $N in (C_2)$. Tìm độ dài ngắn nhất và dài nhất của thanh nối này?],
  [$M N_(min) = 4 sqrt(5), M N_(max) = 8 sqrt(2)$]
)

#tln(
  [*Bài 4 (Cấu hình 2.3 - Song song, lệch trục chiếu cắt nhau):* Hai đường băng tập bay của flycam nằm trên hai tầng sân thượng song song. Đường băng 1 ở tầng $z=0$ có tâm $J_1(0;0;0)$, bán kính $R_1=4$. Đường băng 2 ở tầng $z=3$ có tâm $J_2(2;0;3)$, bán kính $R_2=3$. Hai hình chiếu vuông góc của hai đường băng này xuống mặt đất cắt nhau. Tìm khoảng cách ngắn nhất giữa hai flycam khi chúng bay trên hai quỹ đạo này?],
  [$3$]
)

#tln(
  [*Bài 5 (Cấu hình 2.2 - Song song, lệch trục chiếu rời nhau):* Hai vòng tròn đèn LED trang trí được lắp song song. Vòng dưới $(C_1)$ nằm trên $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=3$. Vòng trên $(C_2)$ nằm trên $z=5$, tâm $J_2(6;8;5)$, bán kính $R_2=5$. Tính khoảng cách ngắn nhất giữa hai điểm bất kỳ trên hai vòng tròn đèn LED này?],
  [$sqrt(29)$]
)

#tln(
  [*Bài 6 (Cấu hình 3.1 - Vuông góc, trục cắt nhau):* Hai đường vành của bộ lọc ly tâm nằm trên hai mặt phẳng vuông góc. Vành 1 nằm trên $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=5$. Vành 2 nằm trên $y=0$, tâm $J_2(8;0;6)$, bán kính $R_2=4$. Xác định khoảng cách ngắn nhất giữa hai vành tròn này?],
  [$3 sqrt(5) - 4$]
)

#tln(
  [*Bài 7 (Cấu hình 3.2 - Vuông góc, lệch trục):* Trong không gian $O x y z$, đường tròn $(C_1)$ nằm trên mặt phẳng $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=3$. Đường tròn $(C_2)$ nằm trên mặt phẳng $y=3$, tâm $J_2(5;3;12)$, bán kính $R_2=4$. Tìm khoảng cách ngắn nhất giữa hai đường tròn?],
  [$sqrt(178 - 6 sqrt(34)) - 4$]
)

#tln(
  [*Bài 8 (Ứng dụng thực tế - Tránh va chạm vệ tinh):* Hai vệ tinh dự báo thời tiết chuyển động tròn đều trong không gian. Quỹ đạo vệ tinh 1 là đường tròn $(C_1)$ trên mặt phẳng $(P_1): 2x - 2y + z - 4 = 0$ có tâm $J_1(1;0;2)$, bán kính $R_1=2$. Quỹ đạo vệ tinh 2 là đường tròn $(C_2)$ trên mặt phẳng song song $(P_2): 2x - 2y + z - 13 = 0$ có tâm $J_2(3;-1;5)$, bán kính $R_2=1$. Xác định khoảng cách gần nhau nhất giữa hai vệ tinh trong quá trình vận hành?],
  [$3$]
)
\"\"\""""

new_practice_section = """    # 8 Practice Problems with detailed solutions
    output += \"\"\"
#v(1.5em)
== B. BÀI TẬP TỰ LUYỆN PHÂN LOẠI CÓ HƯỚNG DẪN CHI TIẾT

Dưới đây là hệ thống bài tập tự luyện có lời giải chi tiết giúp học sinh tự củng cố tư duy và phương pháp:

#tln(
  [*Bài 1 (Đồng phẳng, lồng nhau):* Cho hai đường tròn $(C_1)$ và $(C_2)$ đồng phẳng trên mặt đất $z=0$. Vòng chạy ngoài $(C_1)$ có tâm $J_1(1;1;0)$, bán kính $R_1=8$. Vòng chạy trong $(C_2)$ có tâm $J_2(2;3;0)$, bán kính $R_2=3$. Tìm khoảng cách lớn nhất và nhỏ nhất giữa hai điểm $M in (C_1)$ và $N in (C_2)$?],
  [$M N_(min) = 5 - sqrt(5), M N_(max) = 11 + sqrt(5)$],
  loigiai: [
    *Bước 1 (Tính khoảng cách nối tâm):*
    Hai đường tròn nằm trên cùng mặt phẳng $z=0$. Tâm $J_1(1;1;0)$ và $J_2(2;3;0)$.
    $ J_1 J_2 = sqrt((2-1)^2 + (3-1)^2) = sqrt(1 + 4) = sqrt(5) $
    *Bước 2 (Xác định vị trí tương đối):*
    Hiệu hai bán kính là: $|R_1 - R_2| = |8 - 3| = 5$.
    Vì $J_1 J_2 = sqrt(5) approx 2.24 < |R_1 - R_2| = 5$, nên đường tròn $(C_2)$ nằm hoàn toàn phía trong đường tròn $(C_1)$ (hai đường tròn lồng nhau).
    *Bước 3 (Tìm cực trị khoảng cách):*
    - Khoảng cách ngắn nhất đạt được khi hai điểm $M, N$ nằm trên đoạn thẳng nối hai tâm và cùng phía:
      $ M N_(min) = R_1 - R_2 - J_1 J_2 = 8 - 3 - sqrt(5) = 5 - sqrt(5). $
    - Khoảng cách lớn nhất đạt được khi $M, N$ nằm ở hai đầu xa nhất đối diện trên đường nối hai tâm:
      $ M N_(max) = R_1 + R_2 - J_1 J_2 $ ? Không, vì lồng nhau nên điểm xa nhất trên đường nối tâm được tính bằng:
      $ M N_(max) = R_1 + R_2 + J_1 J_2 = 8 + 3 + sqrt(5) = 11 + sqrt(5). $
  ]
)

#tln(
  [*Bài 2 (Đồng phẳng, tiếp xúc ngoài):* Hai vòng tròn nhựa được đặt tiếp xúc ngoài với nhau trên bàn phẳng $z=0$. Vòng $(C_1)$ tâm $J_1(0;0;0)$, bán kính $R_1=5$. Vòng $(C_2)$ tâm $J_2(x_0; 0; 0)$ với $x_0 > 0$, bán kính $R_2=3$. Do hai vòng tiếp xúc ngoài nên $J_1 J_2 = R_1 + R_2 = 8$. Tìm khoảng cách lớn nhất giữa một điểm $M in (C_1)$ và một điểm $N in (C_2)$?],
  [$16$],
  loigiai: [
    *Bước 1:* Hai đường tròn đồng phẳng trên $z=0$, tiếp xúc ngoài nhau nên khoảng cách nối tâm đúng bằng tổng hai bán kính:
    $ J_1 J_2 = R_1 + R_2 = 5 + 3 = 8. $
    *Bước 2:* Với cấu hình đồng phẳng chéo nhau hoặc rời nhau (tiếp xúc ngoài), khoảng cách cực đại giữa hai điểm đạt được khi hai điểm nằm thẳng hàng với hai tâm và ở phía đối diện xa nhất ngoài cùng:
    $ M N_(max) = J_1 J_2 + R_1 + R_2 = 8 + 5 + 3 = 16. $
  ]
)

#tln(
  [*Bài 3 (Song song, đồng trục):* Hai vành thép chịu lực tròn nằm trên hai mặt phẳng song song $z=2$ và $z=10$. Vành dưới $(C_1)$ có tâm $J_1(1;2;2)$, bán kính $R_1=6$. Vành trên $(C_2)$ có tâm $J_2(1;2;10)$, bán kính $R_2=2$. Một thanh nối thẳng kết nối điểm $M in (C_1)$ và $N in (C_2)$. Tìm độ dài ngắn nhất và dài nhất của thanh nối này?],
  [$M N_(min) = 4 sqrt(5), M N_(max) = 8 sqrt(2)$],
  loigiai: [
    *Bước 1 (Tính chiều cao thẳng đứng):*
    Hai mặt phẳng $z=2$ và $z=10$ song song và cách nhau một khoảng $h = 10 - 2 = 8$.
    *Bước 2 (Chiếu phẳng):*
    Do hai tâm có cùng hoành độ và tung độ $J_1(1;2)$ và $J_2(1;2)$, đây là cấu hình song song đồng trục.
    Hình chiếu của $(C_2)$ xuống mặt phẳng chứa $(C_1)$ là đường tròn chiếu $(C_2')$ đồng tâm với $(C_1)$.
    *Bước 3 (Tìm cực trị khoảng cách):*
    - Khoảng cách ngang nhỏ nhất là:
      $ d_(\\"ngang\\", min) = |R_1 - R_2| = |6 - 2| = 4. $
    - Khoảng cách ngang lớn nhất là:
      $ d_(\\"ngang\\", max) = R_1 + R_2 = 6 + 2 = 8. $
    *Bước 4 (Tính khoảng cách không gian):*
    - Độ dài ngắn nhất của thanh nối:
      $ M N_(min) = sqrt(h^2 + d_(\\"ngang\\", min)^2) = sqrt(8^2 + 4^2) = sqrt(80) = 4 sqrt(5). $
    - Độ dài dài nhất của thanh nối:
      $ M N_(max) = sqrt(h^2 + d_(\\"ngang\\", max)^2) = sqrt(8^2 + 8^2) = sqrt(128) = 8 sqrt(2). $
  ]
)

#tln(
  [*Bài 4 (Song song, lệch trục chiếu cắt nhau):* Hai đường băng tập bay của flycam nằm trên hai tầng sân thượng song song. Đường băng 1 ở tầng $z=0$ có tâm $J_1(0;0;0)$, bán kính $R_1=4$. Đường băng 2 ở tầng $z=3$ có tâm $J_2(2;0;3)$, bán kính $R_2=3$. Hai hình chiếu vuông góc của hai đường băng này xuống mặt đất cắt nhau. Tìm khoảng cách ngắn nhất giữa hai flycam khi chúng bay trên hai quỹ đạo này?],
  [$3$],
  loigiai: [
    *Bước 1 (Xác định chiều cao đứng):*
    Khoảng cách thẳng đứng giữa hai tầng sân thượng chứa hai đường băng là $h = 3$.
    *Bước 2 (Xét hình chiếu phẳng):*
    Chiếu quỹ đạo $(C_2)$ xuống mặt đáy $z=0$ ta được đường tròn hình chiếu $(C_2')$ có tâm $J_2'(2;0;0)$ và bán kính $R_2=3$.
    *Bước 3 (Xét vị trí tương đối của hình chiếu):*
    Khoảng cách giữa hai tâm chiếu là $d = J_1 J_2' = 2$.
    Hiệu hai bán kính là $|R_1 - R_2| = 1$. Tổng hai bán kính là $R_1 + R_2 = 7$.
    Vì $|R_1 - R_2| = 1 < d = 2 < R_1 + R_2 = 7$, nên hai đường tròn chiếu cắt nhau tại hai điểm.
    *Bước 4 (Kết luận):*
    Tại giao điểm của hai quỹ đạo chiếu, khoảng cách ngang bằng $0$.
    Khi đó, khoảng cách ngắn nhất không gian chính bằng khoảng cách đứng đứng giữa hai mặt phẳng:
    $ M N_(min) = h = 3. $
  ]
)

#tln(
  [*Bài 5 (Song song, lệch trục chiếu rời nhau):* Hai vòng tròn đèn LED trang trí được lắp song song. Vòng dưới $(C_1)$ nằm trên $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=3$. Vòng trên $(C_2)$ nằm trên $z=5$, tâm $J_2(6;8;5)$, bán kính $R_2=5$. Tính khoảng cách ngắn nhất giữa hai điểm bất kỳ trên hai vòng tròn đèn LED này?],
  [$sqrt(29)$],
  loigiai: [
    *Bước 1 (Xác định chiều cao đứng):*
    Khoảng cách giữa hai mặt phẳng chứa đèn LED song song là $h = 5$.
    *Bước 2 (Chiếu phẳng):*
    Chiếu vòng trên $(C_2)$ xuống mặt phẳng đáy $z=0$ ta được đường tròn hình chiếu $(C_2')$ có tâm $J_2'(6;8;0)$ và bán kính $R_2=5$.
    *Bước 3 (Tìm khoảng cách ngang ngắn nhất):*
    Khoảng cách nối hai tâm trên mặt phẳng chiếu:
    $ J_1 J_2' = sqrt(6^2 + 8^2) = 10. $
    Vì $J_1 J_2' = 10 > R_1 + R_2 = 3 + 5 = 8$, nên hai hình chiếu hoàn toàn rời ngoài nhau.
    Khoảng cách ngang ngắn nhất giữa hai viền tròn chiếu là:
    $ d_(\\"ngang\\", min) = J_1 J_2' - R_1 - R_2 = 10 - 3 - 5 = 2. $
    *Bước 4 (Tính khoảng cách không gian ngắn nhất):*
    $ M N_(min) = sqrt(h^2 + d_(\\"ngang\\", min)^2) = sqrt(5^2 + 2^2) = sqrt(29). $
  ]
)

#tln(
  [*Bài 6 (Vuông góc, trục cắt nhau):* Hai đường vành của bộ lọc ly tâm nằm trên hai mặt phẳng vuông góc. Vành 1 nằm trên $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=5$. Vành 2 nằm trên $y=0$, tâm $J_2(8;0;6)$, bán kính $R_2=4$. Xác định khoảng cách ngắn nhất giữa hai vành tròn này?],
  [$3 sqrt(5) - 4$],
  loigiai: [
    *Bước 1 (Quy giản hình học về tâm):*
    Áp dụng đánh giá khoảng cách dưới về tâm đường tròn $J_2(8;0;6)$ của vành thứ hai:
    $ M N >= M J_2 - R_2 \\\\Rightarrow M N_(min) = M J_(2, min) - R_2 $
    *Bước 2 (Tham số hóa điểm $M$):*
    Điểm $M$ thuộc đường tròn $(C_1)$ trong mặt phẳng $z=0$, tâm $J_1(0;0;0)$ và bán kính $R_1=5$ có dạng lượng giác:
    $ M(5 cos t, 5 sin t, 0) $ với $t in [0; 2 pi)$.
    *Bước 3 (Thiết lập khoảng cách và tìm cực tiểu):*
    Bình phương khoảng cách từ $M$ đến tâm cố định $J_2(8;0;6)$ là:
    $ M J_2^2 = (5 cos t - 8)^2 + (5 sin t - 0)^2 + (0 - 6)^2 $
    $ = 25 cos^2 t - 80 cos t + 64 + 25 sin^2 t + 36 $
    $ = 25(cos^2 t + sin^2 t) + 100 - 80 cos t = 125 - 80 cos t. $
    Để $M J_2$ nhỏ nhất thì $cos t$ phải lớn nhất bằng $1$ (khi $t = 0$, điểm $M(5;0;0)$).
    $ M J_(2, min) = sqrt(125 - 80(1)} = sqrt(45) = 3 sqrt(5). $
    *Bước 4 (Kết luận):*
    Khoảng cách cực tiểu giữa hai đường vành là:
    $ M N_(min) = M J_(2, min) - R_2 = 3 sqrt(5) - 4. $
  ]
)

#tln(
  [*Bài 7 (Vuông góc, lệch trục):* Trong không gian $O x y z$, đường tròn $(C_1)$ nằm trên mặt phẳng $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=3$. Đường tròn $(C_2)$ nằm trên mặt phẳng $y=3$, tâm $J_2(5;3;12)$, bán kính $R_2=4$. Tìm khoảng cách ngắn nhất giữa hai đường tròn?],
  [$sqrt(187 - 6 sqrt(34)) - 4$],
  loigiai: [
    *Bước 1 (Quy giản hình học về tâm):*
    Áp dụng đánh giá khoảng cách dưới về tâm đường tròn $J_2(5;3;12)$ của đường tròn thứ hai:
    $ M N >= M J_2 - R_2 \\\\Rightarrow M N_(min) = M J_(2, min) - R_2 $
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
    $ M J_(2, min) = sqrt(187 - 6 sqrt(34)} $
    *Bước 5 (Kết luận):*
    Khoảng cách cực tiểu giữa hai đường tròn là:
    $ M N_(min) = M J_(2, min) - R_2 = sqrt(187 - 6 sqrt(34)} - 4. $
  ]
)

#tln(
  [*Bài 8 (Ứng dụng thực tế - Tránh va chạm vệ tinh):* Hai vệ tinh dự báo thời tiết chuyển động tròn đều trong không gian. Quỹ đạo vệ tinh 1 là đường tròn $(C_1)$ trên mặt phẳng $(P_1): 2x - 2y + z - 4 = 0$ có tâm $J_1(1;0;2)$, bán kính $R_1=2$. Quỹ đạo vệ tinh 2 là đường tròn $(C_2)$ trên mặt phẳng song song $(P_2): 2x - 2y + z - 13 = 0$ có tâm $J_2(3;-1;5)$, bán kính $R_2=1$. Xác định khoảng cách gần nhau nhất giữa hai vệ tinh trong quá trình vận hành?],
  [$3$],
  loigiai: [
    *Bước 1 (Tính chiều cao đứng giữa hai mặt phẳng song song):*
    $ h = d((P_1), (P_2)) = (|4 - 13|)/sqrt(2^2 + (-2)^2 + 1^2) = 9/3 = 3. $
    *Bước 2 (Chiếu vuông góc tìm tâm chiếu):*
    Đường thẳng qua tâm $J_2(3;-1;5)$ vuông góc với $(P_1)$ có dạng: $x = 3+2t, y = -1-2t, z = 5+t$.
    Giao điểm với mặt phẳng $(P_1)$ là:
    $ 2(3+2t) - 2(-1-2t) + (5+t) - 4 = 0 \\\\Rightarrow 9t + 9 = 0 \\\\Rightarrow t = -1. $
    Tọa độ tâm hình chiếu là $J_2'(1; 1; 4)$.
    *Bước 3 (Xét vị trí tương đối trên mặt phẳng chiếu):*
    Khoảng cách nối hai tâm trên mặt phẳng chiếu là:
    $ J_1 J_2' = sqrt((1-1)^2 + (1-0)^2 + (4-2)^2) = sqrt(5) approx 2.24. $
    Xét hai đường tròn chiếu: $(C_1)$ tâm $J_1(1;0;2)$ bán kính $R_1 = 2$, và đường tròn chiếu của $(C_2)$ có tâm $J_2'(1;1;4)$ bán kính $R_2 = 1$.
    Vì $|R_1 - R_2| = 1 < J_1 J_2' = sqrt(5) < R_1 + R_2 = 3$, nên hai quỹ đạo chiếu cắt nhau.
    *Bước 4 (Kết luận):*
    Vì hình chiếu của hai quỹ đạo cắt nhau, tồn tại thời điểm khoảng cách ngang bằng $0$.
    Khi đó, khoảng cách ngắn nhất giữa hai vệ tinh bằng khoảng cách đứng:
    $ M N_(min) = h = 3. $
  ]
)
\"\"\""""

content = content.replace(old_practice_section, new_practice_section)

# Replace all } with ) in the newly added parts to make sure there are no typos
content = content.replace("sqrt(47 - 6 sqrt(34)}", "sqrt(47 - 6 sqrt(34))")
content = content.replace("sqrt(57 - 40(1)}", "sqrt(57 - 40(1))")
content = content.replace("sqrt(187 - 6 sqrt(34)}", "sqrt(187 - 6 sqrt(34))")
content = content.replace("sqrt(125 - 80(1)}", "sqrt(125 - 80(1))")

with open("scratch/generate_deep_2_circles_3D.py", "w", encoding="utf-8") as f:
    f.write(content)

print("Final rewrite applied successfully!")
