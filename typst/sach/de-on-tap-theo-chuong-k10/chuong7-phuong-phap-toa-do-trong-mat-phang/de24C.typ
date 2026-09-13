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
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG",
  exam-title: "BÀI 22: BA ĐƯỜNG CONIC (ĐỀ SỐ 24C - NÂNG CAO & VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "166",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho Elip $(E): x^2 / 25 + y^2 / 9 = 1$. Điểm $M$ thuộc $(E)$ có hoành độ dương thỏa mãn $M F_1 = 2 M F_2$ (với $F_1, F_2$ là hai tiêu điểm). Hoành độ của điểm $M$ bằng],
    (
        True([$25 / 12$]),
        [$5 / 2$],
        [$20 / 9$],
        [$15 / 8$]
    ),
    loigiai: [
        Ta có $a = 5, b = 3 => c = sqrt(25 - 9) = 4$. Tâm sai $e = c / a = 4 / 5$.
        
        Theo định nghĩa Elip: $M F_1 + M F_2 = 2a = 10$.
        
        Vì $M F_1 = 2 M F_2$ nên:
        $ 3 M F_2 = 10 <=> M F_2 = 10 / 3 $
        
        Mặt khác, theo công thức bán kính qua tiêu:
        $ M F_2 = a - e x_M <=> 5 - 4 / 5 x_M = 10 / 3 <=> 4 / 5 x_M = 5 / 3 <=> x_M = 25 / 12 $
    ]
)

// TN 2
#tn([Cho Hypebol $(H): x^2 / 16 - y^2 / 9 = 1$ có hai tiêu điểm $F_1, F_2$. Điểm $M$ thuộc nhánh phải của $(H)$ nhìn hai tiêu điểm dưới một góc vuông ($hat(F_1 M F_2) = 90^circ$). Khi đó giá trị của $M F_1^2 + M F_2^2$ bằng],
    (
        True([$100$]),
        [$50$],
        [$64$],
        [$25$]
    ),
    loigiai: [
        Ta có $a^2 = 16, b^2 = 9 => c^2 = a^2 + b^2 = 25 => c = 5$.
        Tiêu cự $F_1 F_2 = 2c = 10$.
        Tam giác $F_1 M F_2$ vuông tại $M$ nên theo định lý Pythagore:
        $ M F_1^2 + M F_2^2 = F_1 F_2^2 = (10)^2 = 100 $
    ]
)

// TN 3
#tn([Tích các khoảng cách từ một điểm $M$ bất kỳ trên Hypebol $(H): x^2 / 16 - y^2 / 9 = 1$ đến hai đường tiệm cận của nó bằng],
    (
        True([$5.76$]),
        [$2.88$],
        [$12$],
        [$7.2$]
    ),
    loigiai: [
        Hai đường tiệm cận của $(H)$ là $d_1: 3x - 4y = 0$ và $d_2: 3x + 4y = 0$.
        Với $M(x_0; y_0) in (H)$ ta có $x_0^2 / 16 - y_0^2 / 9 = 1 <=> 9x_0^2 - 16y_0^2 = 144$.
        Tích khoảng cách:
        $ d(M, d_1) cdot d(M, d_2) = (|3x_0 - 4y_0|) / 5 cdot (|3x_0 + 4y_0|) / 5 = (|9x_0^2 - 16y_0^2|) / 25 = 144 / 25 = 5.76 $
    ]
)

// TN 4
#tn([Tìm tất cả các giá trị của tham số $m$ để đường thẳng $d: 2x - y + m = 0$ tiếp xúc với Parabol $(P): y^2 = 4x$.],
    (
        True([$m = 1 / 2$]),
        [$m = - 1 / 2$],
        [$m = 1$],
        [$m = 2$]
    ),
    loigiai: [
        Từ phương trình đường thẳng: $y = 2x + m$.
        Thay vào Parabol:
        $ (2x + m)^2 = 4x <=> 4x^2 + 4(m - 1)x + m^2 = 0 $
        Đường thẳng tiếp xúc với Parabol khi và chỉ khi phương trình có nghiệm kép:
        $ Delta' = 4(m - 1)^2 - 4m^2 = 4(1 - 2m) = 0 <=> 1 - 2m = 0 <=> m = 1 / 2 $
    ]
)

// TN 5
#tn([Tìm tất cả các giá trị của tham số $m$ để đường thẳng $d: 3x + 4y + m = 0$ tiếp xúc với Elip $(E): x^2 / 16 + y^2 / 9 = 1$.],
    (
        True([$m = plus.minus 12 sqrt(2)$]),
        [$m = plus.minus 12$],
        [$m = plus.minus 24$],
        [$m = plus.minus 6 sqrt(2)$]
    ),
    loigiai: [
        Đường thẳng $A x + B y + C = 0$ tiếp xúc với Elip $x^2 / a^2 + y^2 / b^2 = 1$ khi:
        $ A^2 a^2 + B^2 b^2 = C^2 $
        Ở đây: $A = 3, B = 4, C = m, a^2 = 16, b^2 = 9$.
        $ m^2 = 3^2(16) + 4^2(9) = 144 + 144 = 288 => m = plus.minus sqrt(288) = plus.minus 12 sqrt(2) $
    ]
)

// TN 6
#tn([Cho Parabol $(P): y^2 = 8x$. Một dây cung $A B$ đi qua tiêu điểm $F$ của Parabol có hai đầu mút là $A(x_1; y_1)$ và $B(x_2; y_2)$. Tích các tung độ $y_1 y_2$ bằng],
    (
        True([$-16$]),
        [$16$],
        [$-8$],
        [$8$]
    ),
    loigiai: [
        Tiêu điểm của $(P)$ là $F(2; 0)$ ($p = 4$).
        Đường thẳng đi qua $F$ có phương trình dạng $x = k y + 2$.
        Thay vào phương trình Parabol:
        $ y^2 = 8(k y + 2) <=> y^2 - 8k y - 16 = 0 $
        Theo định lý Viète, tích hai tung độ giao điểm là:
        $ y_1 y_2 = -16 = -p^2 $
    ]
)

// TN 7
#tn([Cho Elip $(E): x^2 / 25 + y^2 / 16 = 1$ có hai tiêu điểm $F_1, F_2$. Diện tích tam giác $M F_1 F_2$ với $M in (E)$ có giá trị lớn nhất bằng],
    (
        True([$12$]),
        [$15$],
        [$20$],
        [$24$]
    ),
    loigiai: [
        Ta có $a = 5, b = 4 => c = sqrt(25 - 16) = 3$.
        Cạnh đáy $F_1 F_2 = 2c = 6$.
        Diện tích tam giác: $S = 1 / 2 F_1 F_2 |y_M| = 3 |y_M|$.
        Vì $M in (E)$ nên $|y_M| <= b = 4$.
        Do đó $S_text("max") = 3(4) = 12$ đạt được tại các đỉnh $B_1(0; -4)$ hoặc $B_2(0; 4)$.
    ]
)

// TN 8
#tn([Cho Hypebol $(H): x^2 / 9 - y^2 / 16 = 1$. Côsin của góc tạo bởi hai đường tiệm cận của $(H)$ bằng],
    (
        True([$7 / 25$]),
        [$24 / 25$],
        [$3 / 5$],
        [$4 / 5$]
    ),
    loigiai: [
        Hai đường tiệm cận là $y = plus.minus 4 / 3 x$.
        Vectơ pháp tuyến tương ứng: $vec(n_1) = (4; -3)$ và $vec(n_2) = (4; 3)$.
        $ cos alpha = (|vec(n_1) cdot vec(n_2)|) / (|vec(n_1)| |vec(n_2)|) = (|4(4) + (-3)(3)|) / (sqrt(4^2 + (-3)^2) sqrt(4^2 + 3^2)) = (|16 - 9|) / (5 times 5) = 7 / 25 $
    ]
)

// TN 9
#tn([Phương trình chính tắc của Parabol biết khoảng cách từ tiêu điểm $F$ đến đường chuẩn $Delta$ bằng $6$ là],
    (
        True([$y^2 = 12x$]),
        [$y^2 = 6x$],
        [$y^2 = 24x$],
        [$y^2 = 3x$]
    ),
    loigiai: [
        Tiêu điểm $F(p / 2; 0)$ và đường chuẩn $Delta: x = -p / 2$.
        Khoảng cách giữa tiêu điểm và đường chuẩn chính bằng tham số tiêu:
        $ d(F, Delta) = p / 2 - (-p / 2) = p = 6 $
        Phương trình chính tắc của Parabol: $y^2 = 2p x = 2(6)x = 12x$.
    ]
)

// TN 10
#tn([Cho Elip $(E): x^2 / 25 + y^2 / 9 = 1$ có hai tiêu điểm $F_1, F_2$. Điểm $M in (E)$ nhìn hai tiêu điểm dưới một góc $60^circ$ ($hat(F_1 M F_2) = 60^circ$). Tích khoảng cách $M F_1 cdot M F_2$ bằng],
    (
        True([$12$]),
        [$16$],
        [$9$],
        [$15$]
    ),
    loigiai: [
        Ta có $2a = 10$ và $2c = 2 sqrt(25 - 9) = 8$.
        Áp dụng định lý côsin trong tam giác $F_1 M F_2$:
        $ F_1 F_2^2 = M F_1^2 + M F_2^2 - 2 M F_1 M F_2 cos 60^circ $
        $ <=> (2c)^2 = (M F_1 + M F_2)^2 - 2 M F_1 M F_2 - 2 M F_1 M F_2 (1 / 2) $
        $ <=> 8^2 = 10^2 - 3 M F_1 M F_2 <=> 64 = 100 - 3 M F_1 M F_2 <=> 3 M F_1 M F_2 = 36 <=> M F_1 M F_2 = 12 $
    ]
)

// TN 11
#tn([Một bàn bi-a có mặt bàn hình Elip với trục lớn dài $200 text(" cm")$ ($2a = 200$) và tiêu cự dài $160 text(" cm")$ ($2c = 160$).
Một bi đặt tại tiêu điểm $F_1$ được cơ thủ đánh đập vào băng bàn tại điểm $M$ rồi phản xạ đi thẳng qua tiêu điểm $F_2$.
Tổng quãng đường bi lăn từ $F_1$ đến $M$ rồi tới $F_2$ bằng],
    (
        True([$200 text(" cm")$]),
        [$160 text(" cm")$],
        [$180 text(" cm")$],
        [$240 text(" cm")$]
    ),
    loigiai: [
        Theo tính chất quang học của đường Elip, tia phản xạ của chùm tia xuất phát từ tiêu điểm $F_1$ khi đập vào Elip luôn đi qua tiêu điểm $F_2$.
        Tổng quãng đường bi lăn là:
        $ M F_1 + M F_2 = 2a = 200 text(" cm") $
    ]
)

// TN 12
#tn([Gương phản xạ sơ cấp của một kính thiên văn có dạng Parabol với đường kính miệng gương $2.4 text(" m")$ ($y = plus.minus 1.2 text(" m")$) và tiêu cự từ đỉnh gương đến tiêu điểm là $f = 4.8 text(" m")$.
Độ sâu $h$ của lòng gương tại tâm bằng],
    (
        True([$7.5 text(" cm")$]),
        [$15 text(" cm")$],
        [$3.75 text(" cm")$],
        [$5 text(" cm")$]
    ),
    loigiai: [
        Ta có $f = p / 2 = 4.8 text(" m") => p = 9.6 text(" m")$.
        Phương trình Parabol: $y^2 = 2p x = 19.2 x$.
        Tại mép ngoài của gương ($y = 1.2 text(" m")$):
        $ 1.2^2 = 19.2 h <=> 1.44 = 19.2 h <=> h = 1.44 / 19.2 = 0.075 text(" m") = 7.5 text(" cm") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Tính chất góc nhìn và diện tích tiêu điểm Elip có CeTZ)
#ds([Cho Elip $(E): x^2 / 25 + y^2 / 16 = 1$ và hai tiêu điểm $F_1, F_2$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-6, 0), (6, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -4.5), (0, 4.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((5.8, -0.3), [$x$])
  content((-0.3, 4.2), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Elip
  circle((0, 0), radius: (4, 2.5), stroke: 1.2pt + rgb("d97706"))
  content((3.5, 2.3), [$(E)$])
  
  // Tiêu điểm F1(-2.4, 0), F2(2.4, 0)
  circle((-2.4, 0), radius: 2pt, fill: red)
  content((-2.4, -0.3), [$F_1$])
  circle((2.4, 0), radius: 2pt, fill: red)
  content((2.4, -0.3), [$F_2$])
  
  // Đỉnh B2(0, 2.5) -> tam giác MF1F2 có Smax
  circle((0, 2.5), radius: 2pt, fill: blue)
  content((0.4, 2.7), [$B_2$])
  line((-2.4, 0), (0, 2.5), stroke: 1pt + blue)
  line((2.4, 0), (0, 2.5), stroke: 1pt + blue)
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tiêu cự của Elip bằng $F_1 F_2 = 6$.]),
    True([Với mọi điểm $M in (E)$, ta luôn có $M F_1 + M F_2 = 10$.]),
    True([Diện tích tam giác $M F_1 F_2$ đạt giá trị lớn nhất bằng $12$ khi điểm $M$ trùng với đỉnh $B_1(0; -4)$ hoặc $B_2(0; 4)$.]),
    [Có đúng hai điểm $M in (E)$ nhìn hai tiêu điểm dưới một góc vuông ($hat(F_1 M F_2) = 90^circ$).]
  ),
  loigiai: [
    #step([Tiêu cự và bán trục])
    $a = 5, b = 4 => c = sqrt(25 - 16) = 3$. Tiêu cự $F_1 F_2 = 2c = 6$. Mệnh đề a ĐÚNG.

    #step([Tổng bán kính qua tiêu])
    $M F_1 + M F_2 = 2a = 10$. Mệnh đề b ĐÚNG.

    #step([Diện tích lớn nhất])
    $S = 1 / 2 F_1 F_2 |y_M| = 3 |y_M| <= 3(4) = 12$. Đạt được tại các đỉnh trên trục nhỏ. Mệnh đề c ĐÚNG.

    #step([Góc nhìn vuông])
    Nếu $hat(F_1 M F_2) = 90^circ$ thì điểm $M$ thuộc đường tròn đường kính $F_1 F_2$ có bán kính $R = c = 3$.
    Vì khoảng cách từ tâm đến các điểm trên Elip luôn thỏa mãn $r_M >= b = 4 > 3 = R$ nên đường tròn đường kính $F_1 F_2$ nằm lọt hoàn toàn bên trong Elip $(E)$, không có điểm chung nào với $(E)$.
    Do đó không tồn tại điểm nào trên $(E)$ nhìn hai tiêu điểm dưới góc vuông.
    Khẳng định có đúng hai điểm là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Bàn bi-a Elip)
#ds([Một bàn bi-a đặc biệt có mặt bàn giới hạn bởi đường Elip $(E): x^2 / 10000 + y^2 / 3600 = 1$ (đơn vị: cm).
Hai lỗ bi được đặt tại hai tiêu điểm $F_1, F_2$ của Elip.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Bán trục lớn của mặt bàn bằng $a = 100 text(" cm")$ và bán trục nhỏ bằng $b = 60 text(" cm")$.]),
    True([Khoảng cách giữa hai lỗ bi $F_1 F_2$ bằng $160 text(" cm")$.]),
    True([Một viên bi xuất phát từ lỗ $F_1$ đánh vào bất kỳ điểm nào trên băng bàn sẽ phản xạ đi thẳng vào lỗ $F_2$.]),
    [Quãng đường viên bi lăn từ $F_1$ đập vào băng bàn rồi tới $F_2$ phụ thuộc vào góc đánh của cơ thủ.]
  ),
  loigiai: [
    #step([Bán trục])
    $a = sqrt(10000) = 100 text(" cm")$ và $b = sqrt(3600) = 60 text(" cm")$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách giữa hai lỗ])
    $c = sqrt(100^2 - 60^2) = 80 => F_1 F_2 = 2c = 160 text(" cm")$. Mệnh đề b ĐÚNG.

    #step([Tính chất phản xạ quang học])
    Theo tính chất của Elip, pháp tuyến tại mỗi điểm trên Elip là đường phân giác của góc tạo bởi hai bán kính qua tiêu. Do đó tia tới từ $F_1$ sẽ phản xạ đi qua $F_2$. Mệnh đề c ĐÚNG.

    #step([Tổng quãng đường])
    $M F_1 + M F_2 = 2a = 200 text(" cm")$ luôn là một hằng số cố định, không phụ thuộc vào vị trí va chạm hay góc đánh.
    Khẳng định phụ thuộc vào góc đánh là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Kính thiên văn Parabol)
#ds([Gương phản xạ của một kính thiên văn quang học có mặt cắt là Parabol $y^2 = 19.2 x$ (đơn vị: mét).
Đường kính miệng gương là $2.4 text(" m")$ ($y = plus.minus 1.2 text(" m")$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tham số tiêu của Parabol bằng $p = 9.6 text(" m")$.]),
    True([Tiêu cự của gương (khoảng cách từ đỉnh gương đến bộ thu sáng tại tiêu điểm $F$) bằng $4.8 text(" m")$.]),
    True([Độ sâu của lòng gương Parabol tại tâm bằng $0.075 text(" m")$ ($7.5 text(" cm")$).]),
    [Khi chùm tia sáng từ một ngôi sao ở xa chiếu song song với trục của gương, tất cả các tia phản xạ sẽ hội tụ tại điểm $(9.6; 0)$.]
  ),
  loigiai: [
    #step([Tham số tiêu])
    $2p = 19.2 => p = 9.6 text(" m")$. Mệnh đề a ĐÚNG.

    #step([Tiêu cự])
    $f = p / 2 = 4.8 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Độ sâu])
    Tại $y = 1.2$, $h = 1.2^2 / 19.2 = 0.075 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Vị trí hội tụ])
    Chùm tia sáng song song trục gương phản xạ hội tụ tại tiêu điểm $F(p / 2; 0) = F(4.8; 0)$ (chứ không phải $(9.6; 0)$).
    Khẳng định hội tụ tại $(9.6; 0)$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tích khoảng cách đến hai tiệm cận Hypebol)
#ds([Cho Hypebol $(H): x^2 / 16 - y^2 / 9 = 1$ và điểm $M(x_0; y_0)$ bất kỳ thuộc $(H)$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình hai đường tiệm cận của $(H)$ là $Delta_1: 3x - 4y = 0$ và $Delta_2: 3x + 4y = 0$.]),
    True([Khoảng cách từ điểm $M$ đến $Delta_1$ là $d_1 = (|3x_0 - 4y_0|) / 5$.]),
    True([Khoảng cách từ điểm $M$ đến $Delta_2$ là $d_2 = (|3x_0 + 4y_0|) / 5$.]),
    [Tích hai khoảng cách $d_1 cdot d_2$ phụ thuộc vào vị trí của điểm $M$ trên đường Hypebol.]
  ),
  loigiai: [
    #step([Phương trình hai tiệm cận])
    $y = plus.minus 3 / 4 x <=> 3x plus.minus 4y = 0$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách d1 và d2])
    $d_1 = (|3x_0 - 4y_0|) / 5$ và $d_2 = (|3x_0 + 4y_0|) / 5$. Mệnh đề b, c ĐÚNG.

    #step([Tích khoảng cách])
    $ d_1 cdot d_2 = (|9x_0^2 - 16y_0^2|) / 25 = 144 / 25 = 5.76 $
    Đây là một hằng số cố định, không phụ thuộc vào vị trí của điểm $M$.
    Khẳng định tích khoảng cách phụ thuộc vị trí $M$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Diện tích lớn nhất tam giác MF1F2)
#tln([Cho Elip $(E): x^2 / 25 + y^2 / 16 = 1$. Diện tích lớn nhất của tam giác $M F_1 F_2$ với điểm $M$ di động trên $(E)$ bằng bao nhiêu?],
    [12],
    loigiai: [
        #step([Tính c])
        $ c = sqrt(25 - 16) = 3 => F_1 F_2 = 6 $
        
        #step([Tính diện tích cực đại])
        $ S_text("max") = 1 / 2 (6) b = 3(4) = 12 $
    ]
)

// TLN 2 (Tổng quãng đường bàn bi-a Elip)
#tln([Trong bài toán bàn bi-a Elip trục lớn $2a = 200 text(" cm")$, tổng quãng đường viên bi lăn từ lỗ $F_1$ qua điểm chạm băng $M$ đến lỗ $F_2$ bằng bao nhiêu centimét?],
    [200],
    loigiai: [
        #step([Áp dụng định nghĩa Elip])
        $ M F_1 + M F_2 = 2a = 200 text(" cm") $
    ]
)

// TLN 3 (Tiêu cự gương Parabol)
#tln([Trong bài toán kính thiên văn có mặt cắt gương $y^2 = 19.2 x$, khoảng cách từ đỉnh gương đến tiêu điểm hội tụ $F$ bằng bao nhiêu mét?],
    [4.8],
    loigiai: [
        #step([Tính tiêu cự])
        $ f = p / 2 = 9.6 / 2 = 4.8 text(" m") $
    ]
)

// TLN 4 (Tích khoảng cách đến hai tiệm cận)
#tln([Trong bài toán Hypebol $(H): x^2 / 16 - y^2 / 9 = 1$, tích các khoảng cách từ một điểm trên $(H)$ đến hai đường tiệm cận bằng bao nhiêu? (Nhập kết quả dưới dạng số thập phân).],
    [5.76],
    loigiai: [
        #step([Tính tích khoảng cách])
        $ d_1 d_2 = 144 / 25 = 5.76 $
    ]
)

// TLN 5 (Tích tung độ dây cung qua tiêu)
#tln([Cho Parabol $(P): y^2 = 8x$. Một dây cung đi qua tiêu điểm $F$ có hai đầu mút $A(x_1; y_1)$ và $B(x_2; y_2)$. Tích các tung độ $y_1 y_2$ bằng bao nhiêu?],
    [-16],
    loigiai: [
        #step([Tính tích tung độ])
        Với Parabol $y^2 = 2p x$, mọi dây cung qua tiêu đều có $y_1 y_2 = -p^2 = -4^2 = -16$.
    ]
)

// TLN 6 (Tích bán kính qua tiêu)
#tln([Cho Elip $(E): x^2 / 25 + y^2 / 9 = 1$. Điểm $M in (E)$ nhìn hai tiêu điểm dưới một góc $60^circ$. Tích khoảng cách $M F_1 cdot M F_2$ bằng bao nhiêu?],
    [12],
    loigiai: [
        #step([Áp dụng định lý côsin])
        $ (2c)^2 = (2a)^2 - 3 M F_1 M F_2 <=> 64 = 100 - 3 M F_1 M F_2 <=> M F_1 M F_2 = 12 $
    ]
)

] // end make-questions

#make-questions()
