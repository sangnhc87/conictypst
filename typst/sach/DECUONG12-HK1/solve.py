import os
import re

file_path = "/Users/admin/conictypst/typst/sach/DECUONG12-HK1/chuong-01/bai05-de1.typ"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

solutions = {
    1: r"""    #step[Vận tốc tức thời của vật là đạo hàm của phương trình chuyển động $s(t)$ theo thời gian $t$.]
    #step[Ta có $v(t) = s'(t) = 3t^2 - 12t + 9$.]
    #step[Tại thời điểm $t = 2$, vận tốc của vật là $v(2) = 3(2)^2 - 12(2) + 9 = 12 - 24 + 9 = -3$ (m/s).]
    #step[Kết luận: Chọn đáp án B.]""",
    
    2: r"""    #step[Vận tốc của vật là $v(t) = s'(t) = 6t^2 - 6t$.]
    #step[Gia tốc của vật là đạo hàm của vận tốc $a(t) = v'(t) = 12t - 6$.]
    #step[Tại thời điểm $t = 1$, gia tốc của vật là $a(1) = 12(1) - 6 = 6$ (m/s²).]
    #step[Kết luận: Chọn đáp án C.]""",
    
    4: r"""    #step[Chi phí cận biên là đạo hàm của hàm tổng chi phí $C(x)$ theo sản lượng $x$.]
    #step[Ta có $C'(x) = 3x^2 - 30x + 80$.]
    #step[Tại sản lượng $x = 5$, chi phí cận biên là $C'(5) = 3(5)^2 - 30(5) + 80 = 75 - 150 + 80 = 5$ (nghìn đồng).]
    #step[Kết luận: Chọn đáp án C.]""",
    
    5: r"""    #step[Độ cao của quả bóng là $h(t) = -4.9t^2 + 20t + 1.5$. Quả bóng đạt độ cao lớn nhất khi $h'(t) = 0$.]
    #step[Ta có $h'(t) = -9.8t + 20 = 0 <=> t = 20/9.8 approx 2.04$ (giây).]
    #step[Tại $t approx 2.04$, $h''(t) = -9.8 < 0$ nên $h(t)$ đạt cực đại.]
    #step[Kết luận: Chọn đáp án B.]""",
    
    8: r"""    #step[Hàm nồng độ thuốc là $C(t) = (4t)/(t^2 + 4)$. Ta cần tìm $t > 0$ sao cho $C(t)$ đạt lớn nhất.]
    #step[Đạo hàm $C'(t) = (4(t^2 + 4) - 4t(2t))/(t^2 + 4)^2 = (16 - 4t^2)/(t^2 + 4)^2$.]
    #step[Cho $C'(t) = 0 <=> 16 - 4t^2 = 0 <=> t = 2$ (vì $t > 0$). Lập bảng biến thiên ta thấy $C(t)$ đạt cực đại tại $t = 2$.]
    #step[Kết luận: Chọn đáp án B.]""",
    
    9: r"""    #step[Vị trí của tàu là $x(t) = t^3 - 4.5t^2 + 3t$. Vận tốc tàu là $v(t) = x'(t) = 3t^2 - 9t + 3$.]
    #step[Tàu dừng lại khi vận tốc bằng $0$, tức là $3t^2 - 9t + 3 = 0 <=> t^2 - 3t + 1 = 0$.]
    #step[Giải phương trình bậc hai ta được $t = (3 +- sqrt(5))/2$. Thời điểm đầu tiên tàu dừng lại là $t = (3 - sqrt(5))/2 approx 0.38$ (giờ).]
    #step[Kết luận: Chọn đáp án A.]""",
    
    10: r"""    #step[Sản lượng lúa $Y(x) = -0.1x^2 + 8x + 500$ đạt lớn nhất khi $Y'(x) = 0$.]
    #step[Ta có $Y'(x) = -0.2x + 8 = 0 <=> x = 8 / 0.2 = 40$ (kg/sào).]
    #step[Kết luận: Lượng phân bón tối ưu là $40$ kg/sào. Chọn đáp án B.]""",
    
    11: r"""    #step[Độ cao viên đạn lớn hơn $60$ m khi $h(t) > 60 <=> 40t - 5t^2 > 60$.]
    #step[Bất phương trình tương đương: $-5t^2 + 40t - 60 > 0 <=> t^2 - 8t + 12 < 0$.]
    #step[Nghiệm của bất phương trình là $2 < t < 6$.]
    #step[Khoảng thời gian viên đạn ở độ cao trên $60$ m là $6 - 2 = 4$ (giây). Chọn đáp án B.]""",
    
    12: r"""    #step[Chi phí trung bình cho mỗi sản phẩm là $overline(C)(x) = C(x)/x = 0.5x + 40 + 5000/x$.]
    #step[Đạo hàm $overline(C)'(x) = 0.5 - 5000/x^2$. Cho $overline(C)'(x) = 0 <=> x^2 = 10000 <=> x = 100$ (vì $x > 0$).]
    #step[Vậy chi phí trung bình nhỏ nhất khi sản xuất $100$ sản phẩm. Chọn đáp án B.]""",
    
    13: r"""    #step[Tốc độ thay đổi doanh thu (doanh thu cận biên) là $v(t) = R'(t) = -3t^2 + 18t$.]
    #step[Doanh thu tăng nhanh nhất khi $v(t)$ đạt cực đại. Đạo hàm $v'(t) = -6t + 18 = 0 <=> t = 3$.]
    #step[Kết luận: Vào lúc $t = 3$ giờ, tốc độ tăng doanh thu là lớn nhất. Chọn đáp án A.]""",
    
    14: r"""    #step[Đạo hàm của nhiệt độ lò là $T'(t) = -3t^2 + 18t$. Cho $T'(t) = 0 <=> t = 0$ hoặc $t = 6$.]
    #step[Tính các giá trị tại $t = 0, t = 6, t = 8$:]
    #step[+$T(0) = 60$]
    #step[+$T(6) = -(6)^3 + 9(6)^2 + 60 = 168$]
    #step[+$T(8) = -(8)^3 + 9(8)^2 + 60 = 124$]
    #step[Nhiệt độ lớn nhất là $168$ °C. Chọn đáp án C.]""",
    
    15: r"""    #step[Tốc độ sản xuất là đạo hàm của hàm lượng hàng hóa: $v(t) = Q'(t) = 6 - t$.]
    #step[Đạo hàm của tốc độ sản xuất là $v'(t) = Q''(t) = -1 < 0$ với mọi $t$.]
    #step[Do $Q''(t) < 0$, tốc độ sản xuất đang giảm dần theo thời gian. Chọn đáp án B.]""",
    
    17: r"""    #step[Độ cao tên lửa $h(t) = 100t^2 - 10t^3$. Đạo hàm $h'(t) = 200t - 30t^2$.]
    #step[Cho $h'(t) = 0 <=> 10t(20 - 3t) = 0 <=> t = 0$ hoặc $t = 20/3$.]
    #step[Lập bảng biến thiên trên đoạn $[0; 10]$, ta thấy hàm số đạt cực đại và giá trị lớn nhất tại $t = 20/3$ giây. Chọn đáp án B.]""",
    
    18: r"""    #step[Tốc độ tăng trưởng tức thời của vi khuẩn là đạo hàm $M'(t)$.]
    #step[Ta có $M'(t) = 5(2^t) ln 2$. Tại $t = 3$, $M'(3) = 5(2^3) ln 2 = 40 ln 2$.]
    #step[Với $ln 2 approx 0.693$, ta có $M'(3) approx 40(0.693) = 27.72 approx 27.7$ (mg/giờ). Chọn đáp án C.]""",
    
    19: r"""    #step[Tốc độ tích nước là $v(t) = V'(t) = 6t - t^2$.]
    #step[Tốc độ lớn nhất khi hàm $v(t)$ đạt lớn nhất. Đạo hàm $v'(t) = 6 - 2t = 0 <=> t = 3$.]
    #step[Do đây là parabol quay bề lõm xuống dưới, nó đạt cực đại tại $t = 3$. Chọn đáp án B.]""",
    
    20: r"""    #step[Vận tốc của vật dao động là $v(t) = x'(t) = -10 sin(2t)$.]
    #step[Tại thời điểm $t = pi/4$, ta có $v(pi/4) = -10 sin(2(pi/4)) = -10 sin(pi/2) = -10$ (cm/s).]
    #step[Kết luận: Chọn đáp án B.]""",
    
    21: r"""    #step[a) Vận tốc của vật là $v(t) = s'(t) = 3t^2 - 18t + 24$. (Đúng)]
    #step[b) Vật dừng lại khi $v(t) = 0 <=> 3t^2 - 18t + 24 = 0 <=> t^2 - 6t + 8 = 0 <=> t = 2$ hoặc $t = 4$. (Đúng)]
    #step[c) Trong khoảng $(2; 4)$, $v(t) < 0$ nên vật chuyển động ngược chiều dương. (Đúng)]
    #step[d) Gia tốc của vật là $a(t) = v'(t) = 6t - 18$. Tại $t = 3$, $a(3) = 18 - 18 = 0$ (m/s²). (Đúng)]""",
    
    22: r"""    #step[a) Tốc độ thay đổi lợi nhuận $P'(t) = 3t^2 - 12t + 9 = 0 <=> t = 1$ và $t = 3$. Đây là hai điểm cực trị. (Đúng)]
    #step[b) Trên $[0; 8]$, ta có $P(0)=2, P(1)=6, P(3)=2, P(8)=202$. Lợi nhuận lớn nhất đạt tại $t = 8$. (Sai)]
    #step[c) Trên khoảng $(1; 3)$, $P'(t) = 3t^2 - 12t + 9 < 0$ nên lợi nhuận đang giảm. (Đúng)]
    #step[d) Lợi nhuận lớn nhất tại $t=8$ là $P(8) = 8^3 - 6(8^2) + 9(8) + 2 = 202$ (triệu đồng). (Đúng)]""",
    
    23: r"""    #step[a) Xét hàm số $C(t) = (4t)/(t^2 + 4)$. Ta có $C'(t) = (16 - 4t^2)/(t^2 + 4)^2$. Cho $C'(t) = 0 <=> t = 2$ (vì $t>0$). Bảng biến thiên cho thấy nồng độ đạt cực đại tại $t=2$. (Đúng)]
    #step[b) Nồng độ cực đại là $C(2) = (4(2))/(2^2 + 4) = 8/8 = 1$ (mg/L). (Đúng)]
    #step[c) Khi $t arrow.r +oo$, $C(t) = (4/t)/(1 + 4/t^2)$ tiến về $0$ mg/L. (Đúng)]
    #step[d) Nồng độ thuốc tăng trên $(0; 2)$ và giảm trên $(2; +oo)$ nên không liên tục tăng. (Sai)]""",
    
    24: r"""    #step[a) Đạo hàm $A'(t) = 500(0.8^t) ln(0.8)$. Vì $ln(0.8) < 0$ nên $A'(t) < 0$, tài sản luôn giảm giá. (Đúng)]
    #step[b) Tại $t = 0$, tốc độ giảm là $A'(0) = 500 ln(0.8) approx 500(-0.223) = -111.5$ triệu đồng/năm. (Đúng)]
    #step[c) Sau $5$ năm, $A(5) = 500(0.8^5) = 500(0.32768) = 163.84$ triệu đồng $!= 200$. (Sai)]
    #step[d) Với $t arrow.r +oo$, $0.8^t arrow.r 0$ nên $A(t)$ tiến về $0$ nhưng $A(t) > 0$ với mọi $t$. (Đúng)]""",
    
    25: r"""    #step[a) Hàm năng suất $P(n) = 100n - n^2$. Đạo hàm $P'(n) = 100 - 2n = 0 <=> n = 50$. (Đúng)]
    #step[b) Năng suất cực đại là $P(50) = 50(100 - 50) = 2500$ đơn vị/ngày. (Đúng)]
    #step[c) Với $n = 60$, $P'(60) = 100 - 120 = -20 < 0$. Do đó nếu thêm công nhân vào nhóm $60$ người sẽ làm giảm năng suất. (Sai)]
    #step[d) Tốc độ thay đổi năng suất khi thêm công nhân là đạo hàm $P'(n) = 100 - 2n$. (Đúng)]""",
    
    26: r"""    #step[a) Vận tốc $v(t) = h'(t) = 200t - 30t^2$. Tại $t = 5$, $v(5) = 200(5) - 30(25) = 1000 - 750 = 250$ (m/s). (Sai)]
    #step[b) Tên lửa đạt độ cao lớn nhất khi $v(t) = 0 <=> 200t - 30t^2 = 0 <=> t = 20/3$ (giây). (Sai)]
    #step[c) Gia tốc $a(t) = v'(t) = 200 - 60t$. Gia tốc bằng $0$ khi $t = 200/60 = 10/3$ giây. (Đúng)]
    #step[d) Trong khoảng $(20/3; 10)$, ta có $v(t) < 0$ nên tên lửa đang chuyển động đi xuống. (Đúng)]""",
    
    27: r"""    #step[a) Tốc độ sản xuất là $Q'(t) = 6 - t$. Tại tháng thứ $3$, tốc độ là $Q'(3) = 6 - 3 = 3$ (nghìn sản phẩm/tháng). (Đúng)]
    #step[b) Tổng sản lượng trong 6 tháng là $Q(6) = 6(6) - 6^2/2 = 36 - 18 = 18$ (nghìn sản phẩm). (Đúng)]
    #step[c) $Q''(t) = -1 < 0$ nên tốc độ sản xuất đang giảm dần theo thời gian. (Sai)]
    #step[d) Tháng thứ 6, tốc độ là $Q'(6) = 6 - 6 = 0$. (Đúng)]""",
    
    28: r"""    #step[a) Đạo hàm sản lượng $Q'(t) = 100(e^(-0.1t) - 0.1t e^(-0.1t)) = 100 e^(-0.1t)(1 - 0.1t)$. $Q'(t) = 0 <=> 1 - 0.1t = 0 <=> t = 10$. (Đúng)]
    #step[b) Với $t < 10$, ta có $1 - 0.1t > 0 => Q'(t) > 0$, sản lượng mỗi ngày đang tăng. (Đúng)]
    #step[c) Khi $t arrow.r +oo$, $Q(t) = (100t) / e^(0.1t)$ tiến về $0$. (Đúng)]
    #step[d) Theo phân tích ở trên, sản lượng tăng đến ngày thứ 10 rồi giảm dần. (Sai)]""",
    
    29: r"""    #step[a) Hàm lợi nhuận $P(x) = 27x - C(x) = 27x - (x^3 - 6x^2 + 15x + 10) = -x^3 + 6x^2 + 12x - 10$. (Đúng)]
    #step[b) Tốc độ thay đổi lợi nhuận (lợi nhuận cận biên) là $P'(x) = -3x^2 + 12x + 12$. (Đúng)]
    #step[c) Cho $P'(x) = 0 <=> x^2 - 4x - 4 = 0 <=> x = 2 + 2 sqrt(2) approx 4.83$ (do $x>0$). Do $P''(x) = -6x+12 < 0$ tại $x approx 4.83$, lợi nhuận đạt cực đại. (Đúng)]
    #step[d) Nếu bán 10 sản phẩm, lợi nhuận là $P(10) = -10^3 + 6(10^2) + 12(10) - 10 = -1000 + 600 + 120 - 10 = -290$ (lỗ 290 triệu). (Sai)]""",
    
    30: r"""    #step[a) Vì $-1 <= sin(...) <= 1$, độ cao lớn nhất là $h_("max") = 4 + 2(1) = 6$ m. (Đúng)]
    #step[b) Độ cao thấp nhất là $h_("min") = 4 + 2(-1) = 2$ m. (Đúng)]
    #step[c) Tốc độ thay đổi là đạo hàm của hàm hợp: $h'(t) = 2(pi/6) cos(pi t / 6 - pi/3) = pi/3 cos(pi t / 6 - pi/3)$. (Đúng)]
    #step[d) Tại $t = 4$, $h'(4) = pi/3 cos(4 pi / 6 - pi/3) = pi/3 cos(pi/3) = (pi/3)(1/2) = pi/6 > 0$, suy ra sóng đang tăng. (Sai)]""",
    
    31: r"""    #step[Vận tốc của vật là $v(t) = s'(t) = 6t^2 - 18t + 12$.]
    #step[Vật đổi chiều khi $v(t) = 0 <=> 6t^2 - 18t + 12 = 0 <=> t^2 - 3t + 2 = 0 <=> t = 1$ hoặc $t = 2$.]
    #step[Ta tính vị trí của vật tại các thời điểm quan trọng $t=0, t=1, t=2, t=3$:]
    #step[+$s(0) = 0$]
    #step[+$s(1) = 2(1)^3 - 9(1)^2 + 12(1) = 5$ (m)]
    #step[+$s(2) = 2(2)^3 - 9(2)^2 + 12(2) = 16 - 36 + 24 = 4$ (m)]
    #step[+$s(3) = 2(3)^3 - 9(3)^2 + 12(3) = 54 - 81 + 36 = 9$ (m)]
    #step[Tổng quãng đường vật đi được: $S = |s(1) - s(0)| + |s(2) - s(1)| + |s(3) - s(2)| = |5 - 0| + |4 - 5| + |9 - 4| = 5 + 1 + 5 = 11$ (m).]""",
    
    32: r"""    #step[Doanh thu cận biên (tốc độ thay đổi doanh thu) là đạo hàm $R'(x)$.]
    #step[Ta có $R'(x) = 200 - 2x$.]
    #step[Theo bài ra, doanh thu cận biên bằng $80$ nên $200 - 2x = 80 <=> 2x = 120 <=> x = 60$.]
    #step[Kết luận: Cần bán ra $60$ sản phẩm.]"""
}

# The questions in the file have the structure:
# // ─── CÂU X ───
# ...
#   loigiai: [
#     #step[Đang cập nhật...]
#   ]

for q_num, solution in solutions.items():
    # Regex to find the block for the specific question
    pattern = r'(// ─── CÂU ' + str(q_num) + r' ───.*?)loigiai:\s*\[\s*#step\[Đang cập nhật\.\.\.\]\s*\]'
    
    # We replace it with the new loigiai block
    replacement = r'\1loigiai: [\n' + solution + r'\n  ]'
    
    content = re.sub(pattern, replacement, content, flags=re.DOTALL)

with open(file_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Done replacing 28 solutions!")
