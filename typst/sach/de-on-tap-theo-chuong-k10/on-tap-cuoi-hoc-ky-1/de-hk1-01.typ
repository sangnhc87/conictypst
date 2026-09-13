#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1e40af") // Classic Blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "ĐỀ ÔN TẬP KIỂM TRA CUỐI HỌC KỲ I",
  exam-title: "ĐỀ KIỂM TRA ĐÁNH GIÁ CUỐI HỌC KỲ I - TOÁN 10 (ĐỀ SỐ 01)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho mệnh đề chứa biến $P: forall x in RR, x^2 + 2x + 3 > 0$. Mệnh đề phủ định $overline(P)$ của mệnh đề $P$ là],
    (
        True([$exists x in RR, x^2 + 2x + 3 <= 0$]),
        [$forall x in RR, x^2 + 2x + 3 <= 0$],
        [$exists x in RR, x^2 + 2x + 3 < 0$],
        [$exists x in RR, x^2 + 2x + 3 > 0$]
    ),
    loigiai: [
        Phủ định của $forall$ là $exists$, phủ định của dấu $>$ là dấu $<=$:
        $ overline(P): exists x in RR, x^2 + 2x + 3 <= 0 $
    ]
)

// TN 2
#tn([Cho hai tập hợp $A = (-3; 4]$ và $B = [1; 6)$. Tập hợp giao $A inter B$ là],
    (
        True([$[1; 4]$]),
        [$(-3; 6)$],
        [$[1; 4)$],
        [$(-3; 1]$]
    ),
    loigiai: [
        $ A inter B = (-3; 4] inter [1; 6) = [max(-3, 1); min(4, 6)] = [1; 4] $
    ]
)

// TN 3
#tn([Điểm nào sau đây thuộc miền nghiệm của bất phương trình bậc nhất hai ẩn $2x - 3y + 6 > 0$?],
    (
        True([$M(1; 1)$]),
        [$N(-4; 0)$],
        [$P(0; 3)$],
        [$Q(-2; 1)$]
    ),
    loigiai: [
        Thay tọa độ từng điểm vào biểu thức $2x - 3y + 6$:
        - Với $M(1; 1)$: $2(1) - 3(1) + 6 = 5 > 0$ (Thỏa mãn).
        - Với $N(-4; 0)$: $2(-4) - 3(0) + 6 = -2 < 0$ (Loại).
        - Với $P(0; 3)$: $2(0) - 3(3) + 6 = -3 < 0$ (Loại).
        - Với $Q(-2; 1)$: $2(-2) - 3(1) + 6 = -1 < 0$ (Loại).
    ]
)

// TN 4
#tn([Cặp số $(x; y) = (2; 1)$ là nghiệm của hệ bất phương trình nào sau đây?],
    (
        True([$cases(x + y - 1 >= 0, 2x - y + 3 > 0)$]),
        [$cases(x - y + 3 < 0, 2x + y - 5 > 0)$],
        [$cases(2x + y <= 0, x - 3y + 4 < 0)$],
        [$cases(x + 2y - 5 > 0, 3x - y < 0)$]
    ),
    loigiai: [
        Thay $(x; y) = (2; 1)$ vào phương án thứ nhất:
        - $2 + 1 - 1 = 2 >= 0$ (Đúng).
        - $2(2) - 1 + 3 = 6 > 0$ (Đúng).
        Do đó cặp số thỏa mãn hệ BPT ở phương án thứ nhất.
    ]
)

// TN 5
#tn([Với góc $alpha in (0^degree; 180^degree)$ bất kỳ, khẳng định nào sau đây là ĐÚNG?],
    (
        True([$sin(180^degree - alpha) = sin alpha$]),
        [$cos(180^degree - alpha) = cos alpha$],
        [$tan(180^degree - alpha) = tan alpha$],
        [$cot(180^degree - alpha) = cot alpha$]
    ),
    loigiai: [
        Theo tính chất giá trị lượng giác của hai góc bù nhau:
        $sin(180^degree - alpha) = sin alpha$; còn $cos, tan, cot$ của góc bù mang dấu đối nghịch.
    ]
)

// TN 6
#tn([Cho tam giác $A B C$ có $b = 5, c = 8$ và góc $hat(A) = 60^degree$. Độ dài cạnh $a$ bằng],
    (
        True([$7$]),
        [$sqrt(129)$],
        [$sqrt(39)$],
        [$8$]
    ),
    loigiai: [
        Áp dụng định lý côsin trong tam giác $A B C$:
        $ a^2 = b^2 + c^2 - 2 b c cos A = 5^2 + 8^2 - 2(5)(8) cos 60^degree = 25 + 64 - 80(0.5) = 49 $
        Suy ra $a = sqrt(49) = 7$.
    ]
)

// TN 7
#tn([Cho hình chữ nhật $A B C D$ tâm $O$. Khẳng định nào sau đây là ĐÚNG?],
    (
        True([$vec(A B) = vec(D C)$]),
        [$vec(A B) = vec(C D)$],
        [$vec(A D) = vec(C B)$],
        [$vec(O A) = vec(O C)$]
    ),
    loigiai: [
        Trong hình chữ nhật $A B C D$, hai vectơ $vec(A B)$ và $vec(D C)$ có cùng hướng và cùng độ dài bằng chiều dài hình chữ nhật, do đó $vec(A B) = vec(D C)$.
    ]
)

// TN 8
#tn([Trong mặt phẳng tọa độ $O x y$, cho vectơ $vec(u) = 3vec(i) - 4vec(j)$ (với $vec(i), vec(j)$ là các vectơ đơn vị của các trục). Tọa độ của vectơ $vec(u)$ là],
    (
        True([$(3; -4)$]),
        [$(-3; 4)$],
        [$(3; 4)$],
        [$(-4; 3)$]
    ),
    loigiai: [
        Theo định nghĩa tọa độ vectơ: $vec(u) = x vec(i) + y vec(j) => vec(u) = (x; y) = (3; -4)$.
    ]
)

// TN 9
#tn([Trong mặt phẳng $O x y$, cho hai vectơ $vec(a) = (2; -1)$ và $vec(b) = (3; 6)$. Tích vô hướng $vec(a) cdot vec(b)$ bằng],
    (
        True([$0$]),
        [$12$],
        [$-12$],
        [$6$]
    ),
    loigiai: [
        $ vec(a) cdot vec(b) = a_1 b_1 + a_2 b_2 = 2(3) + (-1)(6) = 6 - 6 = 0 $
        (Hai vectơ $vec(a)$ và $vec(b)$ vuông góc với nhau).
    ]
)

// TN 10
#tn([Kết quả đo chiều dài của một cây cầu được ghi là $L = 152 text(" m") plus.minus 0.2 text(" m")$. Sai số tuyệt đối của phép đo trên không vượt quá],
    (
        True([$0.2 text(" m")$]),
        [$152 text(" m")$],
        [$0.4 text(" m")$],
        [$0.1 text(" m")$]
    ),
    loigiai: [
        Theo quy ước ghi số gần đúng $a plus.minus d$, độ chính xác $d = 0.2 text(" m")$ là chặn trên của sai số tuyệt đối: $Delta_a <= 0.2 text(" m")$.
    ]
)

// TN 11
#tn([Điểm số môn Toán của một học sinh trong $5$ bài kiểm tra lần lượt là: $7; 8; 8; 9; 10$. Điểm số trung bình của học sinh đó là],
    (
        True([$8.4$]),
        [$8.2$],
        [$8.5$],
        [$8.0$]
    ),
    loigiai: [
        $ overline(x) = (7 + 8 + 8 + 9 + 10) / 5 = 42 / 5 = 8.4 $
    ]
)

// TN 12
#tn([Thời gian chạy cự ly $100 text(" m")$ (tính bằng giây) của $6$ vận động viên được ghi lại như sau:
$ 11.2; 11.5; 11.8; 12.0; 12.4; 12.8 $
Khoảng biến thiên của mẫu số liệu trên là],
    (
        True([$1.6 text(" giây")$]),
        [$1.2 text(" giây")$],
        [$1.8 text(" giây")$],
        [$12.8 text(" giây")$]
    ),
    loigiai: [
        Khoảng biến thiên $R = x_max - x_min = 12.8 - 11.2 = 1.6 text(" giây")$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Hệ bất phương trình & Bài toán kinh tế tối ưu lợi nhuận)
#ds([Một xưởng mộc sản xuất hai loại sản phẩm: Bàn ($x$ chiếc) và Ghế ($y$ chiếc).
Điều kiện về nguyên liệu gỗ và thời gian gia công dẫn đến hệ bất phương trình ràng buộc:
$ cases(
  x >= 0,
  y >= 0,
  x + y <= 50,
  2x + y <= 80
) $
Biết rằng mỗi chiếc bàn mang lại lợi nhuận $400$ nghìn đồng và mỗi chiếc ghế mang lại lợi nhuận $300$ nghìn đồng. Lợi nhuận toàn bộ của xưởng được biểu diễn bởi hàm số:
$ F(x, y) = 400x + 300y text(" (nghìn đồng)") $
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Nếu xưởng mộc sản xuất $20$ chiếc bàn và $20$ chiếc ghế thì phương án này hoàn toàn khả thi (thỏa mãn hệ ràng buộc).]),
    True([Miền nghiệm của hệ bất phương trình trên là một miền tứ giác gồm cả biên có $4$ đỉnh tọa độ là: $O(0; 0), A(40; 0), B(30; 20), C(0; 50)$.]),
    True([Để đạt lợi nhuận cao nhất, xưởng mộc cần sản xuất $30$ chiếc bàn và $20$ chiếc ghế.]),
    [Lợi nhuận lớn nhất mà xưởng mộc có thể thu được là $19$ triệu đồng.]
  ),
  loigiai: [
    #step([Kiểm tra phương án (20; 20)])
    $20 >= 0, 20 >= 0, 20 + 20 = 40 <= 50, 2(20) + 20 = 60 <= 80$. Thỏa mãn tất cả các điều kiện. Mệnh đề a ĐÚNG.

    #step([Xác định tọa độ các đỉnh miền nghiệm])
    - Gốc tọa độ $O(0; 0)$.
    - Giao điểm của $2x + y = 80$ với trục $O x$ (cho $y = 0$): $A(40; 0)$.
    - Giao điểm của hai đường thẳng $x + y = 50$ và $2x + y = 80$: trừ hai phương trình ta được $x = 30 => y = 20 => B(30; 20)$.
    - Giao điểm của $x + y = 50$ với trục $O y$ (cho $x = 0$): $C(0; 50)$.
    Miền nghiệm là miền tứ giác $O A B C$. Mệnh đề b ĐÚNG.

    #step([Tính giá trị hàm mục tiêu tại các đỉnh])
    - $F(O) = 0$.
    - $F(A) = 400(40) + 300(0) = 16000$ nghìn đồng.
    - $F(B) = 400(30) + 300(20) = 12000 + 6000 = 18000$ nghìn đồng.
    - $F(C) = 400(0) + 300(50) = 15000$ nghìn đồng.
    Lợi nhuận lớn nhất đạt tại đỉnh $B(30; 20)$ (sản xuất $30$ bàn và $20$ ghế). Mệnh đề c ĐÚNG.

    #step([Lợi nhuận lớn nhất])
    $F_max = 18000$ nghìn đồng $= 18$ triệu đồng.
    Khẳng định lợi nhuận lớn nhất $19$ triệu đồng là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Hệ thức lượng trong tam giác & Bài toán thực tế đo đạc khoảng cách)
#ds([Để đo khoảng cách giữa hai vị trí $A$ và $B$ bị ngăn cách bởi một hồ nước sâu, một kỹ sư đo đạc đứng tại vị trí $C$ trên bờ có thể nhìn thấy đồng thời cả hai điểm $A$ và $B$.
Kỹ sư dùng máy đo chuyên dụng và ghi nhận:
- Khoảng cách $C A = 60 text(" m")$.
- Khoảng cách $C B = 100 text(" m")$.
- Góc ngắm $hat(A C B) = 120^degree$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Diện tích của tam giác $A B C$ tạo bởi ba vị trí đo đạc là $1500sqrt(3) text(" m")^2$.]),
    True([Khoảng cách giữa hai điểm $A$ và $B$ là $140 text(" m")$.]),
    True([Bán kính đường tròn ngoại tiếp tam giác $A B C$ bằng $(140sqrt(3)) / 3 text(" m")$.]),
    [Độ dài đường cao kẻ từ đỉnh $C$ của tam giác $A B C$ lớn hơn $40 text(" m")$.]
  ),
  loigiai: [
    #step([Tính diện tích tam giác ABC])
    $S = 1/2 a b sin C = 1/2 (60)(100) sin 120^degree = 3000 ((sqrt(3)) / 2) = 1500sqrt(3) text(" m")^2$. Mệnh đề a ĐÚNG.

    #step([Tính độ dài cạnh AB])
    Áp dụng định lý côsin trong tam giác $A B C$:
    $A B^2 = C A^2 + C B^2 - 2 C A cdot C B cos 120^degree$
    $= 60^2 + 100^2 - 2(60)(100)(-0.5) = 3600 + 10000 + 6000 = 19600$
    Suy ra $A B = sqrt(19600) = 140 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Tính bán kính đường tròn ngoại tiếp R])
    Theo định lý sin: $R = (A B) / (2 sin C) = 140 / (2 sin 120^degree) = 140 / (sqrt(3)) = (140sqrt(3)) / 3 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Tính độ dài đường cao kẻ từ C])
    $h_c = (2 S) / (A B) = (2 times 1500sqrt(3)) / 140 = (3000sqrt(3)) / 140 = (150sqrt(3)) / 7 approx 37.12 text(" m") < 40 text(" m")$.
    Khẳng định lớn hơn $40 text(" m")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Vectơ và tọa độ trong mặt phẳng Oxy)
#ds([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có tọa độ các đỉnh:
$ A(1; 3), B(-2; -1), C(4; 1) $
Xét tính đúng sai của các nhận định hình học sau:],
  (
    True([Tọa độ của vectơ $vec(A B)$ là $(-3; -4)$ và độ dài đoạn thẳng $A B$ bằng $5$.]),
    True([Tọa độ trọng tâm $G$ của tam giác $A B C$ là $G(1; 1)$.]),
    [Tam giác $A B C$ là tam giác vuông tại đỉnh $A$.],
    True([Tọa độ điểm $D$ để tứ giác $A B C D$ là hình bình hành là $D(7; 5)$.])
  ),
  loigiai: [
    #step([Tính vectơ AB và độ dài AB])
    $vec(A B) = (x_B - x_A; y_B - y_A) = (-2 - 1; -1 - 3) = (-3; -4)$.
    Độ dài $A B = sqrt((-3)^2 + (-4)^2) = sqrt(25) = 5$. Mệnh đề a ĐÚNG.

    #step([Tọa độ trọng tâm G])
    $x_G = (1 - 2 + 4) / 3 = 1$; $y_G = (3 - 1 + 1) / 3 = 1 => G(1; 1)$. Mệnh đề b ĐÚNG.

    #step([Kiểm tra tam giác vuông tại A])
    $vec(A B) = (-3; -4), vec(A C) = (4 - 1; 1 - 3) = (3; -2)$.
    Tích vô hướng: $vec(A B) cdot vec(A C) = (-3)(3) + (-4)(-2) = -9 + 8 = -1 != 0$.
    Do đó tam giác $A B C$ không vuông tại $A$. Mệnh đề c SAI.

    #step([Tìm tọa độ điểm D để ABCD là hình bình hành])
    Tứ giác $A B C D$ là hình bình hành $<=> vec(A D) = vec(B C)$.
    $vec(B C) = (4 - (-2); 1 - (-1)) = (6; 2)$.
    $vec(A D) = (x_D - 1; y_D - 3) => cases(x_D - 1 = 6, y_D - 3 = 2) <=> cases(x_D = 7, y_D = 5) => D(7; 5)$. Mệnh đề d ĐÚNG.
  ]
)

// DS 4 (Thống kê và so sánh độ phân tán kết quả học tập)
#ds([Kết quả điểm bài kiểm tra cuối học kỳ I môn Toán của hai lớp $10 A_1$ và $10 A_2$ (mỗi lớp gồm $10$ học sinh được chọn ngẫu nhiên) được ghi lại như sau:
- Lớp $10 A_1$: $6; 7; 7; 8; 8; 8; 9; 9; 9; 9$.
- Lớp $10 A_2$: $5; 6; 7; 8; 8; 8; 8; 9; 10; 10$.
Xét tính đúng sai của các nhận định thống kê sau:],
  (
    True([Điểm số trung bình của lớp $10 A_1$ bằng $8.0$ điểm.]),
    True([Trung vị điểm kiểm tra của cả hai lớp đều bằng $8.0$ điểm.]),
    True([Khoảng biến thiên của lớp $10 A_1$ ($R_1 = 3$) nhỏ hơn khoảng biến thiên của lớp $10 A_2$ ($R_2 = 5$).]),
    [Điểm số của học sinh lớp $10 A_2$ đồng đều và ổn định hơn so với lớp $10 A_1$.]
  ),
  loigiai: [
    #step([Điểm trung bình lớp 10A1])
    $overline(x)_1 = (6 + 7 times 2 + 8 times 3 + 9 times 4) / 10 = (6 + 14 + 24 + 36) / 10 = 80 / 10 = 8.0$. Mệnh đề a ĐÚNG.

    #step([Trung vị])
    Cả hai dãy đều có $n = 10$ phần tử đã sắp xếp.
    - Lớp $10 A_1$: $M_e(1) = (x_5 + x_6) / 2 = (8 + 8) / 2 = 8.0$.
    - Lớp $10 A_2$: $M_e(2) = (x_5 + x_6) / 2 = (8 + 8) / 2 = 8.0$. Mệnh đề b ĐÚNG.

    #step([Khoảng biến thiên])
    - Lớp $10 A_1$: $R_1 = 9 - 6 = 3$.
    - Lớp $10 A_2$: $R_2 = 10 - 5 = 5$.
    Rõ ràng $R_1 < R_2$. Mệnh đề c ĐÚNG.

    #step([Độ phân tán và tính đồng đều])
    Vì $R_1 < R_2$ và độ lệch chuẩn của lớp $10 A_1$ nhỏ hơn lớp $10 A_2$ nên điểm số của lớp $10 A_1$ đồng đều hơn lớp $10 A_2$.
    Khẳng định lớp $10 A_2$ đồng đều hơn là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tập hợp các nghiệm nguyên)
#tln([Cho hai tập hợp $A = [-4; 5)$ và $B = (0; 8]$.
Hỏi có bao nhiêu số nguyên $x$ thuộc tập hợp giao $A inter B$?],
    [4],
    loigiai: [
        #step([Tìm tập hợp giao])
        $ A inter B = [-4; 5) inter (0; 8] = (0; 5) $
        
        #step([Đếm số nguyên])
        Các số nguyên $x in (0; 5)$ là: $1; 2; 3; 4$.
        Vậy có tất cả $4$ số nguyên.
    ]
)

// TLN 2 (Quy hoạch tuyến tính tìm giá trị lớn nhất)
#tln([Cho hệ bất phương trình ràng buộc:
$ cases(
  x >= 0,
  y >= 0,
  x + y <= 4,
  x + 2y <= 6
) $
Tìm giá trị lớn nhất của biểu thức $F(x, y) = 3x + 2y$ trên miền nghiệm của hệ trên.],
    [12],
    loigiai: [
        #step([Xác định các đỉnh của miền nghiệm])
        Miền nghiệm là tứ giác có các đỉnh:
        - $O(0; 0)$
        - $A(4; 0)$ (giao với trục $O x$)
        - $B(2; 2)$ (giao của hai đường thẳng $x + y = 4$ và $x + 2y = 6$)
        - $C(0; 3)$ (giao với trục $O y$)
        
        #step([Tính giá trị tại các đỉnh])
        - $F(O) = 0$
        - $F(A) = 3(4) + 2(0) = 12$
        - $F(B) = 3(2) + 2(2) = 10$
        - $F(C) = 3(0) + 2(3) = 6$
        
        Vậy giá trị lớn nhất của $F(x, y)$ là $12$ (đạt tại $A(4; 0)$).
    ]
)

// TLN 3 (Hệ thức lượng trong tam giác)
#tln([Hai chiếc tàu thủy $X$ và $Y$ xuất phát cùng một lúc từ một cảng biển $O$, di chuyển thẳng đều theo hai hướng tạo với nhau một góc $60^degree$.
Tàu $X$ chạy với vận tốc $20 text(" hải lý/giờ")$, tàu $Y$ chạy với vận tốc $15 text(" hải lý/giờ")$.
Hỏi sau đúng $2$ giờ hành trình, khoảng cách giữa hai tàu thủy bằng bao nhiêu hải lý? (Làm tròn kết quả đến hàng đơn vị).],
    [36],
    loigiai: [
        #step([Tính quãng đường mỗi tàu đi được])
        - Quãng đường tàu X: $O X = 20 times 2 = 40 text(" hải lý")$.
        - Quãng đường tàu Y: $O Y = 15 times 2 = 30 text(" hải lý")$.
        - Góc tạo bởi hai hướng: $hat(X O Y) = 60^degree$.
        
        #step([Áp dụng định lý côsin])
        $ X Y^2 = O X^2 + O Y^2 - 2 O X cdot O Y cos 60^degree $
        $ = 40^2 + 30^2 - 2(40)(30)(0.5) = 1600 + 900 - 1200 = 1300 $
        Khoảng cách: $X Y = sqrt(1300) approx 36.055 text(" hải lý")$.
        Làm tròn đến hàng đơn vị ta được $36$.
    ]
)

// TLN 4 (Tọa độ đỉnh hình bình hành)
#tln([Trong mặt phẳng tọa độ $O x y$, cho ba điểm $A(1; 2), B(3; 5), C(7; 1)$.
Tìm tung độ $y_D$ của điểm $D$ sao cho tứ giác $A B C D$ là một hình bình hành.],
    [-2],
    loigiai: [
        #step([Điều kiện hình bình hành])
        Tứ giác $A B C D$ là hình bình hành khi và chỉ khi $vec(A D) = vec(B C)$.
        
        #step([Tìm tọa độ điểm D])
        - $vec(B C) = (7 - 3; 1 - 5) = (4; -4)$.
        - $vec(A D) = (x_D - 1; y_D - 2)$.
        Suy ra:
        $ cases(x_D - 1 = 4, y_D - 2 = -4) <=> cases(x_D = 5, y_D = -2) $
        Vậy tung độ của điểm $D$ là $y_D = -2$.
    ]
)

// TLN 5 (Công của lực cơ học)
#tln([Một lực không đổi $vec(F)$ có độ lớn $50 text(" N")$ tác dụng vào một vật thể, kéo vật dịch chuyển trên mặt sàn nằm ngang một quãng đường $s = 10 text(" m")$.
Biết rằng vectơ lực $vec(F)$ tạo với hướng chuyển động một góc $alpha = 60^degree$.
Tính công cơ học $A$ do lực $vec(F)$ sinh ra (đơn vị: Jun - $text("J")$).],
    [250],
    loigiai: [
        #step([Công thức tính công cơ học])
        $ A = vec(F) cdot vec(d) = |vec(F)| cdot s cdot cos alpha $
        
        #step([Tính giá trị công])
        $ A = 50 times 10 times cos 60^degree = 500 times 0.5 = 250 text(" J") $
    ]
)

// TLN 6 (Khoảng tứ phân vị của mẫu số liệu)
#tln([Mẫu số liệu về sản lượng tiêu thụ điện hàng tháng (kWh) của một hộ gia đình trong $8$ tháng liên tiếp được xếp theo thứ tự không giảm:
$ 150; 165; 180; 200; 220; 240; 270; 310 $
Tìm khoảng tứ phân vị $Delta_Q = Q_3 - Q_1$ của mẫu số liệu trên.],
    [82.5],
    loigiai: [
        #step([Xác định trung vị Q2])
        Mẫu số liệu có $n = 8$ phần tử.
        $Q_2 = (200 + 220) / 2 = 210$.
        
        #step([Tìm tứ phân vị thứ nhất Q1 và thứ ba Q3])
        - Nửa dưới: $150; 165; 180; 200 => Q_1 = (165 + 180) / 2 = 172.5$.
        - Nửa trên: $220; 240; 270; 310 => Q_3 = (240 + 270) / 2 = 255.0$.
        
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 255.0 - 172.5 = 82.5 $
    ]
)

] // end make-questions

#make-questions()
