#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("d97706") // Amber cho Đề 7C

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BA ĐƯỜNG CONIC & ỨNG DỤNG",
  exam-title: "BÀI 1: BA ĐƯỜNG CONIC VÀ ĐỊNH NGHĨA TỔNG QUÁT (ĐỀ C - NÂNG CAO & VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "321",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Khi dùng một mặt phẳng không đi qua đỉnh của một hình nón tròn xoay và cắt tất cả các đường sinh của hình nón đó, thiết diện thu được là một đường conic nào?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Double cone outline
    line((-1.5, -1.8), (0, 0), stroke: 1pt + rgb("94a3b8"))
    line((1.5, -1.8), (0, 0), stroke: 1pt + rgb("94a3b8"))
    line((0, 0), (-1.5, 1.8), stroke: 1pt + rgb("94a3b8"))
    line((0, 0), (1.5, 1.8), stroke: 1pt + rgb("94a3b8"))
    // Base ellipse top and bottom
    circle((0, 1.8), radius: (1.5, 0.3), stroke: 0.8pt + rgb("94a3b8"))
    circle((0, -1.8), radius: (1.5, 0.3), stroke: 0.8pt + rgb("94a3b8"))
    // Cutting plane creating Ellipse
    rotate(z: 25deg)
    circle((0, 0.9), radius: (0.9, 0.35), fill: rgb("fef3c7"), stroke: 1.5pt + rgb("d97706"))
    content((0, 0.9), text(size: 8pt, weight: "bold", fill: rgb("d97706"))[Elip])
  })
]
],
    (
        True([Đường Elip]),
        [Đường Parabol],
        [Đường Hypebol],
        [Đường thẳng]
    ),
    loigiai: [
        #step([Thiết diện nón của Apollonius])
        Mặt phẳng cắt mọi đường sinh của một hình nón tròn xoay (không đi qua đỉnh nón) tạo ra thiết diện là một đường Elip.
    ]
)

// TN 2
#tn([Nếu một mặt phẳng cắt một hình nón tròn xoay và song song với đúng một đường sinh của hình nón đó, thì thiết diện thu được là],
    (
        True([Đường Parabol]),
        [Đường Elip],
        [Đường Hypebol],
        [Đoạn thẳng]
    ),
    loigiai: [
        #step([Thiết diện Parabol])
        Khi mặt phẳng song song với đúng một đường sinh của mặt nón, góc nghiêng của mặt phẳng bằng góc nghiêng của đường sinh, thiết diện tạo thành là một đường Parabol (tâm sai $e = 1$).
    ]
)

// TN 3
#tn([Khi mặt phẳng song song với trục của hình nón tròn xoay và cắt cả hai nhánh của mặt nón (không đi qua đỉnh), thiết diện thu được là],
    (
        True([Đường Hypebol gồm hai nhánh]),
        [Đường Elip khép kín],
        [Đường Parabol vươn ra vô tận],
        [Hai đường tròn đồng tâm]
    ),
    loigiai: [
        #step([Thiết diện Hypebol])
        Khi mặt phẳng cắt cả hai nhánh của mặt nón hai đáy, thiết diện thu được là một đường Hypebol gồm hai nhánh đối xứng nhau qua tâm sai $e > 1$.
    ]
)

// TN 4
#tn([Một đường conic có tâm sai $e = 0.8$, khoảng cách từ tiêu điểm $F$ đến đường chuẩn $Delta$ bằng $9$. Gọi $A$ là đỉnh của conic nằm giữa tiêu điểm $F$ và đường chuẩn $Delta$. Khoảng cách từ đỉnh $A$ đến tiêu điểm $F$ bằng],
    (
        True([$4$]),
        [$5$],
        [$3.6$],
        [$7.2$]
    ),
    loigiai: [
        #step([Áp dụng định nghĩa tỉ số khoảng cách])
        Vì $A$ thuộc conic nên $(A F) / (d(A, Delta)) = e = 0.8$.
        Đỉnh $A$ nằm giữa $F$ và $Delta$, do đó $A F + d(A, Delta) = d(F, Delta) = 9$.
        Đặt $A F = x$, suy ra $d(A, Delta) = 9 - x$.
        $ x / (9 - x) = 0.8 <=> x = 0.8(9 - x) <=> 1.8 x = 7.2 <=> x = 4 $
    ]
)

// TN 5
#tn([Cho elip $(E): x^2 / 25 + y^2 / 9 = 1$. Gọi $M$ là một điểm bất kỳ thuộc $(E)$. Giá trị nhỏ nhất của khoảng cách từ $M$ đến đường chuẩn $Delta_2: x = 25 / 4$ là],
    (
        True([$1.25$]),
        [$2.25$],
        [$5$],
        [$6.25$]
    ),
    loigiai: [
        #step([Tìm khoảng cách nhỏ nhất đến đường chuẩn])
        Phương trình đường chuẩn $Delta_2: x = 25 / 4 = 6.25$.
        Điểm $M(x_0, y_0) in (E)$ có $-a <= x_0 <= a$, tức $-5 <= x_0 <= 5$.
        Khoảng cách từ $M$ đến $Delta_2$ là:
        $ d(M, Delta_2) = |6.25 - x_0| = 6.25 - x_0 $
        Giá trị này nhỏ nhất khi $x_0$ lớn nhất ($x_0 = 5$):
        $ d_(min) = 6.25 - 5 = 1.25 $
    ]
)

// TN 6
#tn([Cho hypebol $(H): x^2 / 16 - y^2 / 9 = 1$. Một điểm $M$ thuộc $(H)$ có hoành độ $x_M = 8$. Khoảng cách từ $M$ đến đường chuẩn bên phải $Delta_2$ bằng],
    (
        True([$4.8$]),
        [$3.2$],
        [$8$],
        [$6.4$]
    ),
    loigiai: [
        #step([Xác định đường chuẩn và tính khoảng cách])
        $a^2 = 16 => a = 4$, $b^2 = 9 => c = sqrt(16 + 9) = 5$.
        Đường chuẩn bên phải là $Delta_2: x = a^2 / c = 16 / 5 = 3.2$.
        Khoảng cách từ $M(8, y_M)$ đến $Delta_2$ là:
        $ d(M, Delta_2) = 8 - 3.2 = 4.8 $
    ]
)

// TN 7
#tn([Cho elip $(E): x^2 / 16 + y^2 / 12 = 1$ có tâm sai $e = 1 / 2$. Với mọi điểm $M$ thuộc $(E)$, tỉ số giữa khoảng cách từ $M$ đến tiêu điểm $F_1$ và khoảng cách từ $M$ đến đường chuẩn $Delta_1$ luôn bằng],
    (
        True([$1 / 2$]),
        [$1$],
        [$2$],
        [$1 / 4$]
    ),
    loigiai: [
        #step([Định nghĩa tổng quát của Elip])
        Theo định nghĩa đường conic, với mọi điểm $M$ thuộc elip, tỉ số giữa khoảng cách đến tiêu điểm và đường chuẩn tương ứng luôn không đổi và bằng chính tâm sai $e = 1 / 2$.
    ]
)

// TN 8
#tn([Một đường conic có tâm sai $e = sqrt(3)$, tiêu điểm $F(0, 0)$ và đường chuẩn $Delta: x = 2$. Conic này là],
    (
        True([Đường Hypebol]),
        [Đường Elip],
        [Đường Parabol],
        [Đường tròn]
    ),
    loigiai: [
        #step([Nhận diện conic])
        Vì tâm sai $e = sqrt(3) approx 1.732 > 1$, nên conic này chắc chắn là một đường Hypebol.
    ]
)

// TN 9
#tn([Cho parabol $(P): y^2 = 8 x$. Tam giác đều $O A B$ có đỉnh $O$ là gốc tọa độ, hai đỉnh $A$ và $B$ nằm trên parabol đối xứng nhau qua trục hoành. Độ dài cạnh của tam giác đều $O A B$ bằng],
    (
        True([$16 sqrt(3)$]),
        [$8 sqrt(3)$],
        [$24$],
        [$12 sqrt(3)$]
    ),
    loigiai: [
        #step([Tìm tọa độ đỉnh A])
        Tam giác đều $O A B$ đối xứng qua $O x$ nên tia $O A$ tạo với $O x$ góc $30^circ$.
        Phương trình đường thẳng $O A$: $y = x tan 30^circ = x / sqrt(3) <=> x = y sqrt(3)$.
        Thay vào phương trình parabol $y^2 = 8 x$:
        $ y^2 = 8(y sqrt(3)) <=> y(y - 8 sqrt(3)) = 0 => y_A = 8 sqrt(3) $
        $ x_A = (8 sqrt(3)) sqrt(3) = 24 $.
        #step([Tính độ dài cạnh OA])
        $ O A = sqrt(x_A^2 + y_A^2) = sqrt(24^2 + (8 sqrt(3))^2) = sqrt(576 + 192) = sqrt(768) = 16 sqrt(3) $
    ]
)

// TN 10
#tn([Khi tâm sai $e$ của một elip tiến dần tới $0$ ($e -> 0$), hình dạng của elip biến đổi dần thành hình nào sau đây?],
    (
        True([Đường tròn]),
        [Đường parabol],
        [Đường thẳng],
        [Đoạn thẳng]
    ),
    loigiai: [
        #step([Ý nghĩa hình học của tâm sai elip])
        Ta có $e = c / a = sqrt(1 - b^2 / a^2)$.
        Khi $e -> 0$, ta có $c -> 0$ và $b -> a$, hai tiêu điểm chập lại tại tâm đối xứng $O$, elip dần tròn đều và trở thành đường tròn bán kính $a$.
    ]
)

// TN 11
#tn([Cho parabol $(P): y^2 = 4 x$. Dây cung $A B$ đi qua tiêu điểm $F$ và vuông góc với trục hoành có độ dài bằng],
    (
        True([$4$]),
        [$2$],
        [$8$],
        [$1$]
    ),
    loigiai: [
        #step([Tính độ dài dây cung vuông góc qua tiêu])
        Phương trình $y^2 = 2 p x = 4 x => 2 p = 4 => p = 2$.
        Dây cung qua tiêu vuông góc trục hoành có độ dài đúng bằng $2 p = 4$.
    ]
)

// TN 12
#tn([Cho elip $(E): x^2 / 100 + y^2 / 64 = 1$. Khoảng cách lớn nhất từ một điểm $M$ trên elip đến đường chuẩn bên phải $Delta_2: x = 50 / 3$ bằng],
    (
        True([$80 / 3$]),
        [$50 / 3$],
        [$20$],
        [$70 / 3$]
    ),
    loigiai: [
        #step([Tìm khoảng cách lớn nhất])
        $a = 10, b = 8 => c = 6$. Đường chuẩn $Delta_2: x = 100 / 6 = 50 / 3$.
        Với $M(x, y) in (E)$, $-10 <= x <= 10$.
        Khoảng cách từ $M$ đến $Delta_2$ là $d(M, Delta_2) = 50 / 3 - x$.
        Khoảng cách lớn nhất khi $x$ nhỏ nhất ($x = -10$):
        $ d_(max) = 50 / 3 - (-10) = 50 / 3 + 10 = 80 / 3 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Xét các thiết diện của một mặt nón tròn xoay có góc tạo bởi đường sinh và trục nón là $beta$ ($0^circ < beta < 90^circ$), bị cắt bởi một mặt phẳng $(P)$ không đi qua đỉnh nón và nghiêng với trục nón một góc $alpha$ ($0^circ <= alpha <= 90^circ$).],
  (
    True([Khi $alpha = 90^circ$ (mặt phẳng vuông góc với trục nón), thiết diện là một đường tròn.]),
    True([Khi $beta < alpha < 90^circ$, thiết diện là một đường Elip.]),
    True([Khi $alpha = beta$ (mặt phẳng song song với một đường sinh), thiết diện là một đường Parabol.]),
    [Khi $0^circ <= alpha < beta$, thiết diện là một đường tròn có bán kính vô cùng lớn.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    - Khi $alpha = 90^circ$, mặt phẳng vuông góc trục, thiết diện tròn (Ý a ĐÚNG).
    - Khi $beta < alpha < 90^circ$, mặt phẳng cắt hết đường sinh một nhánh nón, thiết diện là elip (Ý b ĐÚNG).

    #step([Xét ý c])
    Khi $alpha = beta$, mặt phẳng song song đúng một đường sinh, thiết diện parabol (Ý c ĐÚNG).

    #step([Xét ý d])
    Khi $0^circ <= alpha < beta$, mặt phẳng cắt cả hai nhánh của mặt nón, thiết diện thu được là một đường Hypebol gồm hai nhánh, không phải đường tròn. Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Cho elip $(E): x^2 / 16 + y^2 / 7 = 1$. Gọi $F_1, F_2$ là hai tiêu điểm và $Delta_1, Delta_2$ là hai đường chuẩn tương ứng của $(E)$. Một điểm $M(x_0, y_0)$ di động trên $(E)$.],
  (
    True([Tâm sai của elip là $e = 3 / 4$.]),
    True([Khoảng cách giữa hai đường chuẩn $Delta_1$ và $Delta_2$ là $32 / 3$.]),
    True([Bán kính qua tiêu của điểm $M$ thỏa mãn $M F_1 = 4 + (3 / 4) x_0$.]),
    [Tổng các khoảng cách $d(M, Delta_1) + d(M, Delta_2)$ thay đổi tùy thuộc vào vị trí của điểm $M$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    $a = 4, b = sqrt(7) => c = sqrt(16 - 7) = 3$.
    - Tâm sai $e = c / a = 3 / 4$ (Ý a ĐÚNG).
    - Khoảng cách hai đường chuẩn: $2 a^2 / c = (2 times 16) / 3 = 32 / 3$ (Ý b ĐÚNG).
    - Bán kính qua tiêu: $M F_1 = a + e x_0 = 4 + (3 / 4) x_0$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Vì $-4 <= x_0 <= 4$, điểm $M$ luôn nằm giữa hai đường chuẩn $x = -16 / 3$ và $x = 16 / 3$.
    Do đó tổng khoảng cách từ $M$ đến hai đường chuẩn luôn bằng khoảng cách giữa hai đường chuẩn:
    $ d(M, Delta_1) + d(M, Delta_2) = (x_0 - (-16 / 3)) + (16 / 3 - x_0) = 32 / 3 = "hằng số" $.
    Tổng này không đổi. Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Cho parabol $(P): y^2 = 4 x$ và đường thẳng $d: x - y - 3 = 0$.],
  (
    True([Tiêu điểm của parabol là $F(1, 0)$ và đường chuẩn là $x + 1 = 0$.]),
    True([Đường thẳng $d$ cắt parabol $(P)$ tại hai điểm phân biệt $A$ và $B$.]),
    True([Trung điểm $I$ của đoạn thẳng $A B$ có tọa độ là $(5, 2)$.]),
    [Độ dài đoạn thẳng $A B$ bằng $8 sqrt(2)$.]
  ),
  loigiai: [
    #step([Xét ý a])
    $2 p = 4 => p = 2 => F(1, 0)$ và đường chuẩn $x = -1 <=> x + 1 = 0$ (Ý a ĐÚNG).

    #step([Xét ý b và c])
    Từ $d: x = y + 3$, thay vào parabol:
    $ y^2 = 4(y + 3) <=> y^2 - 4 y - 12 = 0 <=> (y - 6)(y + 2) = 0 $
    Phương trình có hai nghiệm phân biệt $y_1 = 6 => x_1 = 9$ và $y_2 = -2 => x_2 = 1$.
    Hai giao điểm $A(9, 6)$ và $B(1, -2)$ (Ý b ĐÚNG).
    Tọa độ trung điểm $I$: $x_I = (9 + 1) / 2 = 5, y_I = (6 - 2) / 2 = 2 => I(5, 2)$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Độ dài đoạn $A B$:
    $ A B = sqrt((9 - 1)^2 + (6 - (-2))^2) = sqrt(8^2 + 8^2) = 8 sqrt(2) $.
    Khẳng định $A B = 8 sqrt(2)$ là ĐÚNG.
  ]
)

// DS 4 (Câu 16)
#ds([Cho hypebol $(H): x^2 / 16 - y^2 / 20 = 1$. Một điểm $M(x_0, y_0)$ thuộc nhánh bên phải của $(H)$ ($x_0 >= 4$).],
  (
    True([Bán trục thực $a = 4$ và tiêu cự $2 c = 12$.]),
    True([Tâm sai của hypebol là $e = 1.5$.]),
    True([Đường chuẩn bên phải có phương trình là $x = 8 / 3$.]),
    [Khoảng cách từ $M$ đến tiêu điểm $F_2(6, 0)$ bằng $M F_2 = 1.5 x_0 + 4$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    $a^2 = 16 => a = 4$, $b^2 = 20 => c = sqrt(16 + 20) = 6 => 2 c = 12$ (Ý a ĐÚNG).
    Tâm sai $e = c / a = 6 / 4 = 1.5$ (Ý b ĐÚNG).
    Đường chuẩn bên phải: $x = a^2 / c = 16 / 6 = 8 / 3$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Với điểm $M$ thuộc nhánh phải ($x_0 >= a$), bán kính qua tiêu $M F_2$ là:
    $ M F_2 = e x_0 - a = 1.5 x_0 - 4 $.
    Công thức $1.5 x_0 + 4$ là bán kính qua tiêu $M F_1$ (hoặc với dấu cộng là sai cho $M F_2$).
    Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho elip $(E): x^2 / 25 + y^2 / 16 = 1$. Tính giá trị nhỏ nhất của khoảng cách từ một điểm trên elip đến đường chuẩn bên phải $Delta_2: x = 25 / 3$ (kết quả làm tròn đến hàng phần mười, ví dụ: 3.3).],
    [3.3],
    loigiai: [
        #step([Tính khoảng cách nhỏ nhất])
        Điểm $M(x, y) in (E)$ có $-5 <= x <= 5$.
        Đường chuẩn là $x = 25 / 3$.
        Khoảng cách từ $M$ đến $Delta_2$ là:
        $ d(M, Delta_2) = 25 / 3 - x $
        Đạt giá trị nhỏ nhất khi $x = 5$:
        $ d_(min) = 25 / 3 - 5 = 10 / 3 approx 3.33 $
        Làm tròn đến hàng phần mười là $3.3$.
    ]
)

// TLN 2 (Câu 18)
#tln([Cho parabol $(P): y^2 = 8 x$. Một dây cung $A B$ đi qua tiêu điểm $F$ của parabol và có hệ số góc $k = 1$. Tính độ dài đoạn thẳng $A B$.],
    [16],
    loigiai: [
        #step([Viết phương trình đường thẳng qua tiêu])
        $2 p = 8 => p = 4 => F(2, 0)$.
        Đường thẳng qua $F(2, 0)$ có hệ số góc $k = 1$ là: $y = x - 2 <=> x = y + 2$.
        #step([Tìm tọa độ giao điểm và độ dài])
        Thay vào parabol:
        $ y^2 = 8(y + 2) <=> y^2 - 8 y - 16 = 0 $
        Gọi hai nghiệm là $y_1, y_2$. Ta có $y_1 + y_2 = 8, y_1 y_2 = -16$.
        $ (y_1 - y_2)^2 = (y_1 + y_2)^2 - 4 y_1 y_2 = 64 - 4(-16) = 128 $.
        Vì $x = y + 2$, ta có $x_1 - x_2 = y_1 - y_2$.
        Độ dài $A B$:
        $ A B = sqrt((x_1 - x_2)^2 + (y_1 - y_2)^2) = sqrt(2(y_1 - y_2)^2) = sqrt(2 times 128) = sqrt(256) = 16 $
    ]
)

// TLN 3 (Câu 19)
#tln([Một elip có tâm sai $e = 0.6$ và khoảng cách giữa hai đường chuẩn bằng $50 / 3$. Tính tiêu cự $2 c$ của elip.],
    [6],
    loigiai: [
        #step([Lập phương trình tìm c])
        Khoảng cách giữa hai đường chuẩn là:
        $ (2 a) / e = 50 / 3 <=> (2 a) / (0.6) = 50 / 3 <=> 2 a = (50 / 3) times 0.6 = 10 => a = 5 $
        Tiêu cự của elip là:
        $ 2 c = 2(a e) = 2(5 times 0.6) = 6 $
    ]
)

// TLN 4 (Câu 20)
#tln([Cho hypebol $(H): x^2 / 9 - y^2 / 16 = 1$. Điểm $M$ thuộc $(H)$ có hoành độ $x = 5$. Tính giá trị của biểu thức $T = 3 times M F_2$, trong đó $F_2$ là tiêu điểm bên phải của $(H)$.],
    [16],
    loigiai: [
        #step([Tính bán kính qua tiêu MF2])
        $a = 3, b = 4 => c = 5$. Tâm sai $e = c / a = 5 / 3$.
        Vì $x_M = 5 > 0$, điểm $M$ thuộc nhánh phải của hypebol.
        Bán kính qua tiêu là:
        $ M F_2 = e x_M - a = (5 / 3) times 5 - 3 = 25 / 3 - 3 = 16 / 3 $
        Vậy $T = 3 times (16 / 3) = 16$.
    ]
)

// TLN 5 (Câu 21)
#tln([Cho parabol $(P): y^2 = 4 x$ và điểm $A(3, 0)$ trên trục hoành. Tìm giá trị nhỏ nhất của bình phương khoảng cách từ một điểm $M$ thuộc $(P)$ đến điểm $A$ (tức $min M A^2$).],
    [8],
    loigiai: [
        #step([Thiết lập hàm khoảng cách])
        Điểm $M(x, y) in (P) => y^2 = 4 x$ với $x >= 0$.
        Bình phương khoảng cách $M A^2$:
        $ M A^2 = (x - 3)^2 + y^2 = (x - 3)^2 + 4 x = x^2 - 6 x + 9 + 4 x = x^2 - 2 x + 9 $
        #step([Tìm giá trị nhỏ nhất])
        $ M A^2 = (x - 1)^2 + 8 $
        Với $x >= 0$, biểu thức đạt giá trị nhỏ nhất khi $x = 1$.
        Khi đó $M A^2 = 8$.
    ]
)

// TLN 6 (Câu 22)
#tln([Cho điểm $F(1, 0)$ và đường thẳng $Delta: x = 4$. Một điểm $M(x, y)$ thuộc đường conic có tiêu điểm $F$, đường chuẩn $Delta$ và tâm sai $e = 1 / 2$. Biết tung độ của điểm $M$ là $y = sqrt(3)$, tìm hoành độ $x$ của điểm $M$.],
    [0],
    loigiai: [
        #step([Thiết lập phương trình theo định nghĩa])
        Theo định nghĩa conic: $(M F)^2 = e^2 [d(M, Delta)]^2$.
        Thay $F(1, 0), y = sqrt(3), e = 1 / 2$ và $d(M, Delta) = |x - 4|$:
        $ (x - 1)^2 + (sqrt(3))^2 = (1 / 2)^2 (x - 4)^2 $
        $ <=> (x - 1)^2 + 3 = 1 / 4 (x - 4)^2 $
        $ <=> 4(x^2 - 2 x + 1 + 3) = x^2 - 8 x + 16 $
        $ <=> 4 x^2 - 8 x + 16 = x^2 - 8 x + 16 $
        $ <=> 3 x^2 = 0 <=> x = 0 $
        Vậy hoành độ của điểm $M$ là $x = 0$.
    ]
)

] // end make-questions

#make-questions()
