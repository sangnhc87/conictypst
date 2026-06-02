import re

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

# 1. Update the get_typst_header to replace the #grid with a linear layout and larger explanations.
old_grid_pattern = r"=== Minh họa trực quan 8 cấu hình hình học mẫu \(Có dùng Hình lập phương làm khung tham chiếu\):.*?#chapter\(\[Hệ thống bài tập phân loại 12 Cấu hình\]\)"
new_layout = """=== 8 Cấu Hình Hình Học Mẫu Khái Quát Đi Kèm Hướng Giải Quyết Trực Quan:
#v(1em)

==== 1. Cấu hình 1.1: Đồng phẳng, đồng tâm
#align(center)[#{f11}]
*Idea giải:* Hai đường tròn cùng nằm trên một mặt phẳng và có chung tâm. Khoảng cách ngắn nhất chính là hiệu số giữa hai bán kính $|R_1 - R_2|$. Khoảng cách lớn nhất là tổng hai bán kính $R_1 + R_2$. Điểm cực trị nằm trên đường thẳng xuyên tâm.
#v(1.5em)

==== 2. Cấu hình 1.2: Đồng phẳng, lệch tâm
#align(center)[#{f12}]
*Idea giải:* Hai đường tròn nằm trên cùng mặt phẳng nhưng khác tâm. Khoảng cách cực trị đạt được khi hai điểm tiếp xúc đi qua trục nối hai tâm $J_1, J_2$. Khoảng cách min có thể tính nhanh bằng $d_{min} = |J_1 J_2 - R_1 - R_2|$ (nếu rời nhau).
#v(1.5em)

==== 3. Cấu hình 2.1: Song song, đồng trục
#align(center)[#{f21}]
*Idea giải:* Hai đường tròn nằm trên hai mặt phẳng song song cách nhau một khoảng $h$, và hình chiếu của tâm $J_1$ trùng với $J_2$. Bài toán quy về việc giải trên mặt phẳng cắt dọc. Dùng định lý Pytago: $d_{min} = \sqrt{h^2 + (R_1 - R_2)^2}$.
#v(1.5em)

==== 4. Cấu hình 2.2: Song song, lệch tâm
#align(center)[#{f22}]
*Idea giải:* Hai mặt phẳng song song nhưng tâm bị lệch. Ta chiếu đường tròn $(C_1)$ xuống mặt phẳng chứa $(C_2)$ để được đường tròn hình chiếu $(C_1')$. Tìm khoảng cách min giữa $(C_1')$ và $(C_2)$ trên cùng mặt phẳng phẳng (2D), sau đó ráp vào Pytago 3D: $d_{min} = \sqrt{h^2 + d_{flat}^2}$.
#v(1.5em)

==== 5. Cấu hình 3.1: Hai mặt phẳng vuông góc (Lệch tâm)
#align(center)[#{f31}]
*Idea giải:* Hai mặt phẳng chứa đường tròn vuông góc nhau (minh hoạ bằng 2 mặt liền kề của hình lập phương). Phương pháp tối ưu là chiếu điểm $M \in (C_1)$ xuống mặt phẳng chứa $(C_2)$ lấy hình chiếu $M_p$. Sau đó áp dụng Pytago không gian: $MN = \sqrt{MM_p^2 + M_pN^2}$. Dùng kỹ thuật đánh giá $M_p N \ge |M_p J_2 - R_2|$ để đưa về khảo sát hàm 1 biến.
#v(1.5em)

==== 6. Cấu hình 3.2: Đoạn vuông góc chung (Trực tâm giao tuyến)
#align(center)[#{f32}]
*Idea giải:* Tương tự cấu hình 3.1 nhưng tâm của hai đường tròn cùng nằm trên một đoạn thẳng tạo thành đoạn vuông góc chung. Tọa độ hình chiếu rơi vào vị trí đặc biệt giúp khử rất nhiều biến số, tính toán cực kỳ tinh gọn và có thể nhẩm nhanh chóng.
#v(1.5em)

==== 7. Cấu hình 4.1: Mặt phẳng nghiêng (Đồng trục cắt nhau)
#align(center)[#{f41}]
*Idea giải:* Hai mặt phẳng tạo với nhau một góc nghiêng $\alpha$ (minh hoạ bằng mặt cắt xéo 45 độ trong hình lập phương). Việc dùng hình chiếu $M_p$ sẽ gặp khó khăn về biểu thức dấu căn. Giải pháp tối ưu nhất là tham số hoá $M(t)$ và áp dụng **Công thức vạn năng**: $d = \sqrt{MJ_2^2 + R_2^2 - 2R_2\sqrt{MJ_2^2 - d(M, P_2)^2}}$.
#v(1.5em)

==== 8. Cấu hình 4.2: Mặt phẳng nghiêng (Lệch tâm hoàn toàn)
#align(center)[#{f42}]
*Idea giải:* Cấu hình tổng quát và phức tạp nhất, khi hai mặt phẳng nghiêng nhau và hai tâm lệch nhau hoàn toàn. Không cần dựng hình phụ phức tạp, ta chỉ cần tham số hoá tọa độ 1 biến $t$ và nhập **Công thức vạn năng** vào chức năng Table (Casio) để quét tìm cực trị trong nháy mắt.
#v(2em)

#chapter([Hệ thống bài tập phân loại 12 Cấu hình])"""

# The re.sub uses DOTALL to match across newlines
code = re.sub(old_grid_pattern, lambda _: new_layout, code, flags=re.DOTALL)

# 2. Update generate_all calls to pass scale=0.65
old_calls = """    f11 = draw_theory_cetz("1.1")
    f12 = draw_theory_cetz("1.2")
    f21 = draw_theory_cetz("2.1")
    f22 = draw_theory_cetz("2.2")
    f31 = draw_theory_cetz("3.1")
    f32 = draw_theory_cetz("3.2")
    f41 = draw_theory_cetz("4.1")
    f42 = draw_theory_cetz("4.2")"""

new_calls = """    f11 = draw_theory_cetz("1.1", scale=0.6)
    f12 = draw_theory_cetz("1.2", scale=0.6)
    f21 = draw_theory_cetz("2.1", scale=0.6)
    f22 = draw_theory_cetz("2.2", scale=0.6)
    f31 = draw_theory_cetz("3.1", scale=0.6)
    f32 = draw_theory_cetz("3.2", scale=0.6)
    f41 = draw_theory_cetz("4.1", scale=0.6)
    f42 = draw_theory_cetz("4.2", scale=0.6)"""

code = code.replace(old_calls, new_calls)

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
