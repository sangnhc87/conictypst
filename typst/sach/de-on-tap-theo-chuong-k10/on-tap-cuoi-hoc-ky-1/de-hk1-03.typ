#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("d97706") // Amber

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "ĐỀ ÔN TẬP KIỂM TRA CUỐI HỌC KỲ I",
  exam-title: "ĐỀ KIỂM TRA ĐÁNH GIÁ CUỐI HỌC KỲ I - TOÁN 10 (ĐỀ SỐ 03)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "103",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong các mệnh đề sau đây, mệnh đề nào là mệnh đề ĐÚNG?],
    (
        True([Tam giác $A B C$ đều khi và chỉ khi tam giác $A B C$ có ba cạnh bằng nhau]),
        [Tứ giác $A B C D$ là hình thoi khi và chỉ khi $A B C D$ có hai đường chéo bằng nhau],
        [Một số tự nhiên $n$ chia hết cho $3$ khi và chỉ khi chữ số tận cùng của $n$ chia hết cho $3$],
        [Tam giác $A B C$ vuông tại $A$ khi và chỉ khi $A B^2 + B C^2 = A C^2$]
    ),
    loigiai: [
        Theo định nghĩa hình học, tam giác đều là tam giác có 3 cạnh bằng nhau, do đó mệnh đề tương đương hai chiều ở phương án thứ nhất là hoàn toàn chính xác.
    ]
)

// TN 2
#tn([Cho hai tập hợp $A = (-infinity; m]$ và $B = (3; +infinity)$. Tìm tất cả các giá trị của tham số $m$ để $A inter B = emptyset$.],
    (
        True([$m <= 3$]),
        [$m < 3$],
        [$m >= 3$],
        [$m > 3$]
    ),
    loigiai: [
        Để $(-infinity; m] inter (3; +infinity) = emptyset$ thì phần tử lớn nhất của $A$ không được vượt quá $3$, tức là $m <= 3$.
    ]
)

// TN 3
#tn([Điểm $M(x_0; y_0)$ nào sau đây thuộc miền nghiệm của bất phương trình $x / 2 + y / 3 - 1 < 0$?],
    (
        True([$M(1; 1)$]),
        [$M(2; 1)$],
        [$M(1; 2)$],
        [$M(2; 2)$]
    ),
    loigiai: [
        Quy đồng bất phương trình: $3x + 2y - 6 < 0$.
        - Với $M(1; 1)$: $3(1) + 2(1) - 6 = -1 < 0$ (Thỏa mãn).
        - Với $M(2; 1)$: $3(2) + 2(1) - 6 = 2 > 0$ (Loại).
        - Với $M(1; 2)$: $3(1) + 2(2) - 6 = 1 > 0$ (Loại).
        - Với $M(2; 2)$: $3(2) + 2(2) - 6 = 4 > 0$ (Loại).
    ]
)

// TN 4
#tn([Số cặp số nguyên $(x; y)$ thỏa mãn hệ bất phương trình $cases(0 <= x <= 2, 0 <= y <= 2, x + y <= 2)$ là],
    (
        True([$6$ cặp]),
        [$4$ cặp],
        [$5$ cặp],
        [$9$ cặp]
    ),
    loigiai: [
        Các cặp số nguyên $(x; y)$ thỏa mãn $x, y in {0, 1, 2}$ và $x + y <= 2$:
        - Với $x = 0$: $y in {0, 1, 2}$ ($3$ cặp: $(0; 0), (0; 1), (0; 2)$).
        - Với $x = 1$: $y in {0, 1}$ ($2$ cặp: $(1; 0), (1; 1)$).
        - Với $x = 2$: $y in {0}$ ($1$ cặp: $(2; 0)$).
        Tổng cộng có: $3 + 2 + 1 = 6$ cặp số nguyên.
    ]
)

// TN 5
#tn([Rút gọn biểu thức $M = sin(90^degree - alpha) + cos(180^degree - alpha)$ với $0^degree < alpha < 90^degree$, ta được kết quả bằng],
    (
        True([$0$]),
        [$2 cos alpha$],
        [$-2 cos alpha$],
        [$2 sin alpha$]
    ),
    loigiai: [
        Vì hai góc phụ nhau nên $sin(90^degree - alpha) = cos alpha$.
        Vì hai góc bù nhau nên $cos(180^degree - alpha) = -cos alpha$.
        Do đó: $M = cos alpha + (-cos alpha) = 0$.
    ]
)

// TN 6
#tn([Cho tam giác $A B C$ có diện tích $S = 24$ và nửa chu vi $p = 12$. Bán kính đường tròn nội tiếp $r$ của tam giác $A B C$ bằng],
    (
        True([$2$]),
        [$4$],
        [$1/2$],
        [$6$]
    ),
    loigiai: [
        Áp dụng công thức tính diện tích theo bán kính đường tròn nội tiếp:
        $ S = p r <=> r = S / p = 24 / 12 = 2 $
    ]
)

// TN 7
#tn([Cho đoạn thẳng $A B$ có trung điểm $I$. Với điểm $M$ bất kỳ, khẳng định nào sau đây là ĐÚNG?],
    (
        True([$vec(M A) + vec(M B) = 2 vec(M I)$]),
        [$vec(M A) + vec(M B) = vec(M I)$],
        [$vec(M A) + vec(M B) = -2 vec(M I)$],
        [$vec(M A) - vec(M B) = 2 vec(M I)$]
    ),
    loigiai: [
        Theo tính chất trung điểm đoạn thẳng của vectơ: với mọi điểm $M$, ta luôn có $vec(M A) + vec(M B) = 2 vec(M I)$.
    ]
)

// TN 8
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(a) = (2; -3)$ và $vec(b) = (m; 6)$. Tìm tham số $m$ để hai vectơ $vec(a)$ và $vec(b)$ cùng phương.],
    (
        True([$m = -4$]),
        [$m = 4$],
        [$m = -9$],
        [$m = 9$]
    ),
    loigiai: [
        Hai vectơ cùng phương khi và chỉ khi:
        $ m / 2 = 6 / (-3) <=> m / 2 = -2 <=> m = -4 $
    ]
)

// TN 9
#tn([Trong mặt phẳng $O x y$, hình chiếu vuông góc của điểm $A(-3; 5)$ lên trục hoành $O x$ là điểm có tọa độ],
    (
        True([$(-3; 0)$]),
        [$(0; 5)$],
        [$(3; 0)$],
        [$(0; -5)$]
    ),
    loigiai: [
        Hình chiếu vuông góc của điểm $M(x_0; y_0)$ lên trục hoành $O x$ có tọa độ là $(x_0; 0)$. Do đó điểm chiếu của $A(-3; 5)$ là $(-3; 0)$.
    ]
)

// TN 10
#tn([Kết quả đo độ dài một quãng đường cho số gần đúng $a = 125.6 text(" km")$ với sai số tuyệt đối $Delta_a <= 0.2 text(" km")$. Sai số tương đối $delta_a$ của phép đo trên không vượt quá],
    (
        True([$0.16%$]),
        [$0.2%$],
        [$1.6%$],
        [$0.016%$]
    ),
    loigiai: [
        Sai số tương đối:
        $ delta_a <= (Delta_a) / (|a|) <= (0.2) / (125.6) approx 0.00159 = 0.159% approx 0.16% $
    ]
)

// TN 11
#tn([Mức lương tháng (triệu đồng) của $6$ nhân viên và $1$ giám đốc tại một công ty khởi nghiệp là:
$ 8; 8.5; 9; 9.5; 10; 11; 95 $
Số đặc trưng nào sau đây phản ánh sát thực tế và đại diện tốt nhất cho mức thu nhập tiêu biểu của người lao động trong công ty trên?],
    (
        True([Số trung vị $M_e = 9.5$ triệu đồng]),
        [Số trung bình $overline(x) approx 21.57$ triệu đồng],
        [Khoảng biến thiên $R = 87$ triệu đồng],
        [Mốt $M_o = 8$ triệu đồng]
    ),
    loigiai: [
        Do mẫu số liệu xuất hiện giá trị bất thường quá lớn ($95$ triệu đồng của giám đốc) làm cho số trung bình ($21.57$ triệu) bị kéo lệch rất cao. Khi đó số trung vị $M_e = 9.5$ triệu đồng phản ánh chính xác nhất mức thu nhập tiêu biểu của người lao động.
    ]
)

// TN 12
#tn([Một mẫu số liệu có phương sai $s^2 = 16$. Độ lệch chuẩn $s$ của mẫu số liệu đó bằng],
    (
        True([$4$]),
        [$256$],
        [$8$],
        [$2$]
    ),
    loigiai: [
        Độ lệch chuẩn là căn bậc hai của phương sai: $s = sqrt(s^2) = sqrt(16) = 4$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Khảo sát dịch vụ số trực tuyến Venn 3 tập hợp)
#ds([Một khảo sát về việc sử dụng ba nền tảng giải trí trực tuyến gồm Netflix ($N$), Spotify ($S$) và YouTube Premium ($Y$) trên $120$ bạn trẻ cho kết quả:
- Có $70$ người dùng Netflix; $60$ người dùng Spotify; $50$ người dùng YouTube Premium.
- Có $30$ người dùng cả Netflix và Spotify; $25$ người dùng cả Netflix và YouTube; $20$ người dùng cả Spotify và YouTube.
- Có $10$ người đăng ký sử dụng đồng thời cả ba nền tảng trên.
Xét tính đúng sai của các nhận định thống kê sau:],
  (
    True([Tổng số người trẻ sử dụng ít nhất một trong ba nền tảng giải trí trên là $105$ người.]),
    True([Số người hoàn toàn không sử dụng bất kỳ nền tảng trả phí nào trong ba nền tảng trên là $15$ người.]),
    True([Số người chỉ sử dụng duy nhất nền tảng Netflix là $25$ người.]),
    [Số người sử dụng đúng hai trong ba nền tảng bất kỳ là $65$ người.]
  ),
  loigiai: [
    #step([Lực lượng hợp 3 tập hợp])
    $n(N union S union Y) = 70 + 60 + 50 - (30 + 25 + 20) + 10 = 180 - 75 + 10 = 105$ người. Mệnh đề a ĐÚNG.

    #step([Số người không dùng nền tảng nào])
    $120 - 105 = 15$ người. Mệnh đề b ĐÚNG.

    #step([Số người chỉ dùng Netflix])
    - Dùng N và S (không Y): $30 - 10 = 20$.
    - Dùng N và Y (không S): $25 - 10 = 15$.
    - Dùng cả ba: $10$.
    Số chỉ dùng Netflix: $70 - (20 + 15 + 10) = 70 - 45 = 25$ người. Mệnh đề c ĐÚNG.

    #step([Số người dùng đúng hai nền tảng])
    $20 + 15 + (20 - 10) = 20 + 15 + 10 = 45$ người.
    Khẳng định $65$ người là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Quy hoạch tuyến tính tối ưu hóa phân bổ đầu tư)
#ds([Một quỹ đầu tư mạo hiểm phân bổ vốn vào hai dự án năng lượng sạch: Điện gió ($x$ tỷ đồng) và Điện mặt trời ($y$ tỷ đồng).
Các điều kiện về an toàn vốn và chính sách cấp tín dụng dẫn đến hệ ràng buộc:
$ cases(
  x >= 10,
  y >= 10,
  x + y <= 60,
  x - y <= 20
) $
Lợi nhuận kỳ vọng hàng năm của quỹ đầu tư được tính bởi hàm số:
$ P(x, y) = 0.12x + 0.10y text(" (tỷ đồng)") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương án đầu tư $x = 30$ tỷ đồng cho Điện gió và $y = 20$ tỷ đồng cho Điện mặt trời là một phương án hợp lệ.]),
    True([Miền nghiệm của hệ bất phương trình là một miền tứ giác có $4$ đỉnh tọa độ là: $A(10; 10), B(30; 10), C(40; 20), D(10; 50)$.]),
    True([Để lợi nhuận kỳ vọng đạt cao nhất, quỹ cần đầu tư $40$ tỷ đồng cho Điện gió và $20$ tỷ đồng cho Điện mặt trời.]),
    [Lợi nhuận kỳ vọng lớn nhất mà quỹ đầu tư có thể đạt được là $7.5$ tỷ đồng/năm.]
  ),
  loigiai: [
    #step([Kiểm tra phương án (30; 20)])
    $30 >= 10, 20 >= 10, 30 + 20 = 50 <= 60, 30 - 20 = 10 <= 20$. Thỏa mãn toàn bộ hệ ràng buộc. Mệnh đề a ĐÚNG.

    #step([Xác định tọa độ 4 đỉnh])
    - Giao của $x = 10$ và $y = 10$: $A(10; 10)$.
    - Giao của $y = 10$ và $x - y = 20$: $x = 30 => B(30; 10)$.
    - Giao của $x - y = 20$ và $x + y = 60$: cộng hai pt được $2x = 80 <=> x = 40 => y = 20 => C(40; 20)$.
    - Giao của $x = 10$ và $x + y = 60$: $y = 50 => D(10; 50)$. Mệnh đề b ĐÚNG.

    #step([Tính lợi nhuận tại các đỉnh])
    - $P(A) = 0.12(10) + 0.10(10) = 1.2 + 1.0 = 2.2$ tỷ đồng.
    - $P(B) = 0.12(30) + 0.10(10) = 3.6 + 1.0 = 4.6$ tỷ đồng.
    - $P(C) = 0.12(40) + 0.10(20) = 4.8 + 2.0 = 6.8$ tỷ đồng.
    - $P(D) = 0.12(10) + 0.10(50) = 1.2 + 5.0 = 6.2$ tỷ đồng.
    Lợi nhuận cao nhất đạt tại đỉnh $C(40; 20)$ ($40$ tỷ điện gió và $20$ tỷ điện mặt trời). Mệnh đề c ĐÚNG.

    #step([Lợi nhuận tối đa])
    $P_max = 6.8$ tỷ đồng/năm. Khẳng định $7.5$ tỷ đồng/năm là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Hệ thức lượng và hải trình hàng hải)
#ds([Một tàu đánh cá xuất phát từ vị trí $A$ đi thẳng đến đảo $B$ cách $A$ một khoảng $30 text(" hải lý")$. Do thời tiết xấu xuất hiện áp thấp nhiệt đới trên đường đi, tàu phải chuyển hướng đi về vị trí $C$ cách $A$ một khoảng $20 text(" hải lý")$, sau đó từ $C$ đi tiếp đến đảo $B$. Biết góc chuyển hướng $hat(B A C) = 60^degree$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khoảng cách từ vị trí chuyển hướng $C$ đến đảo $B$ là $10sqrt(7) text(" hải lý") approx 26.46 text(" hải lý")$.]),
    True([Diện tích tam giác $A B C$ giới hạn bởi hải trình là $150sqrt(3) text(" (hải lý)")^2$.]),
    True([Góc ngắm $hat(A C B)$ thỏa mãn $cos hat(A C B) = sqrt(7) / 14$.]),
    [Tổng quãng đường tàu đi theo lộ trình $A -> C -> B$ ngắn hơn quãng đường đi thẳng $A -> B$.]
  ),
  loigiai: [
    #step([Tính độ dài đoạn BC])
    Áp dụng định lý côsin trong tam giác $A B C$:
    $B C^2 = A B^2 + A C^2 - 2 A B cdot A C cos 60^degree$
    $= 30^2 + 20^2 - 2(30)(20)(0.5) = 900 + 400 - 600 = 700$
    Suy ra $B C = sqrt(700) = 10sqrt(7) text(" hải lý") approx 26.46 text(" hải lý")$. Mệnh đề a ĐÚNG.

    #step([Diện tích tam giác ABC])
    $S = 1/2 A B cdot A C sin 60^degree = 1/2 (30)(20) ((sqrt(3)) / 2) = 150sqrt(3) text(" (hải lý)")^2$. Mệnh đề b ĐÚNG.

    #step([Tính cos góc ACB])
    $cos hat(A C B) = (A C^2 + B C^2 - A B^2) / (2 A C cdot B C) = (20^2 + 700 - 30^2) / (2(20)(10sqrt(7))) = (400 + 700 - 900) / (400sqrt(7)) = 200 / (400sqrt(7)) = 1 / (2sqrt(7)) = sqrt(7) / 14$. Mệnh đề c ĐÚNG.

    #step([So sánh quãng đường])
    Tổng quãng đường $A -> C -> B$: $20 + 26.46 = 46.46 text(" hải lý") > 30 text(" hải lý")$ (theo bất đẳng thức tam giác). Khẳng định ngắn hơn là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Vectơ vận tốc máy bay và ảnh hưởng gió ngang)
#ds([Một chiếc máy bay phản lực bay từ thành phố $A$ đến thành phố $B$ theo hướng Đông với vận tốc riêng của máy bay đối với không khí là $vec(v)_1$ có độ lớn $|vec(v)_1| = 600 text(" km/h")$.
Trong suốt chuyến bay, có một cơn gió bão thổi theo hướng Nam với vận tốc $vec(v)_2$ có độ lớn $|vec(v)_2| = 100 text(" km/h")$.
Vận tốc thực tế của máy bay đối với mặt đất là vectơ hợp $vec(v) = vec(v)_1 + vec(v)_2$.
Xét tính đúng sai của các nhận định vật lý - toán học sau:],
  (
    True([Hai vectơ vận tốc $vec(v)_1$ và $vec(v)_2$ có phương vuông góc với nhau.]),
    True([Tốc độ thực tế của máy bay đối với mặt đất là $|vec(v)| = 100sqrt(37) text(" km/h") approx 608.28 text(" km/h")$.]),
    True([Hướng bay thực tế của máy bay bị lệch về phía Nam một góc $alpha$ thỏa mãn $tan alpha = 1/6$.]),
    [Nếu máy bay bay liên tục trong $2$ giờ thì độ dạt về phía Nam của máy bay so với đường bay dự kiến là $300 text(" km")$.]
  ),
  loigiai: [
    #step([Phương của hai vectơ vận tốc])
    Hướng Đông và hướng Nam vuông góc với nhau, do đó $vec(v)_1 perp vec(v)_2$. Mệnh đề a ĐÚNG.

    #step([Tốc độ thực tế đối với mặt đất])
    Vì hai vectơ vuông góc: $|vec(v)| = sqrt(|vec(v)_1|^2 + |vec(v)_2|^2) = sqrt(600^2 + 100^2) = sqrt(360000 + 10000) = sqrt(370000) = 100sqrt(37) text(" km/h")$. Mệnh đề b ĐÚNG.

    #step([Góc lệch hướng bay])
    $tan alpha = (|vec(v)_2|) / (|vec(v)_1|) = 100 / 600 = 1/6$. Mệnh đề c ĐÚNG.

    #step([Độ dạt về phía Nam sau 2 giờ])
    Độ dạt về phía Nam hoàn toàn do vận tốc gió gây ra:
    $d = |vec(v)_2| times t = 100 times 2 = 200 text(" km")$.
    Khẳng định $300 text(" km")$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tìm m để hai khoảng giao nhau khác rỗng)
#tln([Cho hai tập hợp $A = (-infinity; 2m + 1)$ và $B = [5; +infinity)$.
Tìm giá trị nguyên nhỏ nhất của tham số $m$ để tập hợp giao $A inter B$ khác rỗng ($A inter B != emptyset$).],
    [3],
    loigiai: [
        #step([Điều kiện giao khác rỗng])
        Để $(-infinity; 2m + 1) inter [5; +infinity) != emptyset$, ta phải có:
        $ 2m + 1 > 5 <=> 2m > 4 <=> m > 2 $
        
        #step([Tìm m nguyên nhỏ nhất])
        Vì $m in ZZ$ và $m > 2$ nên giá trị nguyên nhỏ nhất của $m$ là $m = 3$.
    ]
)

// TLN 2 (Quy hoạch tuyến tính tối đa hóa lợi nhuận)
#tln([Cho hệ bất phương trình ràng buộc sản xuất:
$ cases(
  x >= 0,
  y >= 0,
  2x + y <= 8,
  x + 2y <= 8
) $
Tìm giá trị lớn nhất của hàm mục tiêu lợi nhuận $F(x, y) = 4x + 5y$ trên miền nghiệm của hệ trên.],
    [24],
    loigiai: [
        #step([Xác định các đỉnh của miền nghiệm])
        Miền nghiệm là tứ giác $O A B C$:
        - $O(0; 0)$
        - $A(4; 0)$ (giao điểm của $2x + y = 8$ với trục $O x$)
        - $B(8/3; 8/3)$ (giao điểm của $2x + y = 8$ và $x + 2y = 8$)
        - $C(0; 4)$ (giao điểm của $x + 2y = 8$ với trục $O y$)
        
        #step([Tính giá trị hàm F tại các đỉnh])
        - $F(O) = 0$
        - $F(A) = 4(4) + 5(0) = 16$
        - $F(B) = 4(8/3) + 5(8/3) = 9(8/3) = 24$
        - $F(C) = 4(0) + 5(4) = 20$
        
        Vậy giá trị lớn nhất của $F(x, y)$ là $24$ (đạt tại $B(8/3; 8/3)$).
    ]
)

// TLN 3 (Đo chiều cao tòa tháp không tới được chân tháp)
#tln([Để đo chiều cao của một tháp truyền hình $C D$ dựng thẳng đứng trên mặt đất (với $D$ là chân tháp), người ta đặt giác kế tại hai vị trí $A$ và $B$ trên mặt đất cùng phía với chân tháp sao cho $A, B, D$ thẳng hàng.
Khoảng cách giữa hai điểm đặt giác kế là $A B = 50 text(" m")$.
Từ $A$ và $B$, người ta ngắm đỉnh tháp $C$ với các góc nâng lần lượt là $hat(C A D) = 30^degree$ và $hat(C B D) = 60^degree$.
Tính chiều cao $C D$ của tháp truyền hình (đơn vị: mét, làm tròn đến hàng phần mười).],
    [43.3],
    loigiai: [
        #step([Xét tam giác ABC])
        Ta có góc ngoài tại $B$ của tam giác $A B C$ là $hat(C B D) = 60^degree$.
        Do đó góc $hat(A C B) = hat(C B D) - hat(C A D) = 60^degree - 30^degree = 30^degree$.
        Vì $hat(C A B) = hat(A C B) = 30^degree$ nên tam giác $A B C$ cân tại $B$.
        Suy ra $B C = A B = 50 text(" m")$.
        
        #step([Tính chiều cao CD trong tam giác vuông BCD])
        Tam giác $B C D$ vuông tại $D$:
        $ C D = B C cdot sin(hat(C B D)) = 50 cdot sin 60^degree = 50 ((sqrt(3)) / 2) = 25sqrt(3) approx 43.301 text(" m") $
        Làm tròn đến hàng phần mười ta được $43.3 text(" m")$.
    ]
)

// TLN 4 (Tọa độ tâm đường tròn ngoại tiếp tam giác)
#tln([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ vuông tại đỉnh $A$ có $A(1; 1), B(5; 1), C(1; 4)$.
Gọi $I(x_0; y_0)$ là tâm đường tròn ngoại tiếp của tam giác $A B C$.
Tính giá trị biểu thức $P = 2 x_0 + 4 y_0$.],
    [16],
    loigiai: [
        #step([Tính chất tam giác vuông])
        Vì tam giác $A B C$ vuông tại $A$ nên tâm đường tròn ngoại tiếp $I$ là trung điểm của cạnh huyền $B C$.
        
        #step([Tìm tọa độ điểm I])
        $ x_0 = (x_B + x_C) / 2 = (5 + 1) / 2 = 3 $
        $ y_0 = (y_B + y_C) / 2 = (1 + 4) / 2 = 2.5 $
        
        #step([Tính giá trị biểu thức P])
        $ P = 2 x_0 + 4 y_0 = 2(3) + 4(2.5) = 6 + 10 = 16 $
    ]
)

// TLN 5 (Tích vô hướng và góc giữa hai vectơ)
#tln([Cho hai vectơ $vec(a)$ và $vec(b)$ thỏa mãn $|vec(a)| = 3, |vec(b)| = 4$ và góc giữa hai vectơ $(vec(a), vec(b)) = 120^degree$.
Tính độ dài của vectơ tổng $vec(u) = vec(a) + vec(b)$ (làm tròn kết quả đến hàng phần mười).],
    [3.6],
    loigiai: [
        #step([Bình phương vô hướng])
        $ |vec(u)|^2 = |vec(a) + vec(b)|^2 = |vec(a)|^2 + |vec(b)|^2 + 2 vec(a) cdot vec(b) $
        $ = |vec(a)|^2 + |vec(b)|^2 + 2 |vec(a)| |vec(b)| cos 120^degree $
        $ = 3^2 + 4^2 + 2(3)(4)(-0.5) = 9 + 16 - 12 = 13 $
        
        #step([Tính độ dài])
        $ |vec(u)| = sqrt(13) approx 3.605 $
        Làm tròn đến hàng phần mười ta được $3.6$.
    ]
)

// TLN 6 (Độ lệch chuẩn của mẫu số liệu)
#tln([Kết quả khảo sát thời gian sử dụng điện thoại thông minh hàng ngày (giờ) của một nhóm $5$ sinh viên:
$ 2; 3; 5; 7; 8 $
Tính độ lệch chuẩn $s$ của mẫu số liệu trên (làm tròn đến hàng phần mười).],
    [2.3],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = (2 + 3 + 5 + 7 + 8) / 5 = 25 / 5 = 5 text(" giờ") $
        
        #step([Tính phương sai])
        $ s^2 = 1/5 [(2 - 5)^2 + (3 - 5)^2 + (5 - 5)^2 + (7 - 5)^2 + (8 - 5)^2] $
        $ = 1/5 [(-3)^2 + (-2)^2 + 0^2 + 2^2 + 3^2] = 1/5 [9 + 4 + 0 + 4 + 9] = 26 / 5 = 5.2 $
        
        #step([Tính độ lệch chuẩn])
        $ s = sqrt(5.2) approx 2.28 $
        Làm tròn đến hàng phần mười ta được $2.3$.
    ]
)

] // end make-questions

#make-questions()
