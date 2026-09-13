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
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG",
  exam-title: "BÀI 22: BA ĐƯỜNG CONIC (ĐỀ SỐ 24A - CƠ BẢN ĐẾN VẬN DỤNG)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "164",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Tọa độ các tiêu điểm của Elip $(E): x^2 / 25 + y^2 / 9 = 1$ là],
    (
        True([$F_1(-4; 0)$ và $F_2(4; 0)$]),
        [$F_1(-5; 0)$ và $F_2(5; 0)$],
        [$F_1(0; -4)$ và $F_2(0; 4)$],
        [$F_1(-3; 0)$ và $F_2(3; 0)$]
    ),
    loigiai: [
        Ta có $a^2 = 25$ và $b^2 = 9$.
        $ c = sqrt(a^2 - b^2) = sqrt(25 - 9) = sqrt(16) = 4 $
        Vì $a > b$ nên hai tiêu điểm nằm trên trục hoành: $F_1(-4; 0)$ và $F_2(4; 0)$.
    ]
)

// TN 2
#tn([Độ dài trục lớn và độ dài trục nhỏ của Elip $(E): x^2 / 16 + y^2 / 4 = 1$ lần lượt là],
    (
        True([$8$ và $4$]),
        [$4$ và $2$],
        [$16$ và $4$],
        [$8$ và $2$]
    ),
    loigiai: [
        Ta có $a^2 = 16 => a = 4$ và $b^2 = 4 => b = 2$.
        Độ dài trục lớn: $2a = 2(4) = 8$.
        Độ dài trục nhỏ: $2b = 2(2) = 4$.
    ]
)

// TN 3
#tn([Phương trình chính tắc của Elip có độ dài trục lớn bằng $10$ và tiêu cự bằng $6$ là],
    (
        True([$x^2 / 25 + y^2 / 16 = 1$]),
        [$x^2 / 100 + y^2 / 36 = 1$],
        [$x^2 / 25 + y^2 / 9 = 1$],
        [$x^2 / 16 + y^2 / 9 = 1$]
    ),
    loigiai: [
        Trục lớn $2a = 10 => a = 5 => a^2 = 25$.
        Tiêu cự $2c = 6 => c = 3$.
        $ b^2 = a^2 - c^2 = 25 - 9 = 16 $
        Phương trình chính tắc: $x^2 / 25 + y^2 / 16 = 1$.
    ]
)

// TN 4
#tn([Tiêu cự của Hypebol $(H): x^2 / 16 - y^2 / 9 = 1$ bằng],
    (
        True([$10$]),
        [$5$],
        [$8$],
        [$6$]
    ),
    loigiai: [
        Hypebol có $a^2 = 16$ và $b^2 = 9$.
        $ c^2 = a^2 + b^2 = 16 + 9 = 25 => c = 5 $
        Tiêu cự: $2c = 2(5) = 10$.
    ]
)

// TN 5
#tn([Phương trình các đường tiệm cận của Hypebol $(H): x^2 / 9 - y^2 / 16 = 1$ là],
    (
        True([$y = plus.minus 4 / 3 x$]),
        [$y = plus.minus 3 / 4 x$],
        [$y = plus.minus 16 / 9 x$],
        [$y = plus.minus 9 / 16 x$]
    ),
    loigiai: [
        Ta có $a = 3$ và $b = 4$.
        Phương trình hai đường tiệm cận của Hypebol:
        $ y = plus.minus b / a x = plus.minus 4 / 3 x $
    ]
)

// TN 6
#tn([Tọa độ tiêu điểm $F$ của Parabol $(P): y^2 = 8x$ là],
    (
        True([$F(2; 0)$]),
        [$F(4; 0)$],
        [$F(-2; 0)$],
        [$F(0; 2)$]
    ),
    loigiai: [
        Phương trình có dạng $y^2 = 2p x => 2p = 8 => p = 4$.
        Tiêu điểm của Parabol là $F(p / 2; 0) = F(2; 0)$.
    ]
)

// TN 7
#tn([Phương trình đường chuẩn của Parabol $(P): y^2 = 12x$ là],
    (
        True([$x + 3 = 0$]),
        [$x - 3 = 0$],
        [$x + 6 = 0$],
        [$y + 3 = 0$]
    ),
    loigiai: [
        $2p = 12 => p = 6$.
        Phương trình đường chuẩn là:
        $ x = - p / 2 <=> x = - 3 <=> x + 3 = 0 $
    ]
)

// TN 8
#tn([Điểm nào sau đây là một đỉnh của Elip $(E): x^2 / 9 + y^2 / 4 = 1$?],
    (
        True([$A(3; 0)$]),
        [$B(0; 3)$],
        [$C(2; 0)$],
        [$D(0; 4)$]
    ),
    loigiai: [
        Ta có $a = 3$ và $b = 2$.
        Bốn đỉnh của Elip là: $A_1(-3; 0), A_2(3; 0), B_1(0; -2), B_2(0; 2)$.
        Đối chiếu các phương án, chọn $A(3; 0)$.
    ]
)

// TN 9
#tn([Tâm sai $e$ của Hypebol $(H): x^2 / 9 - y^2 / 16 = 1$ bằng],
    (
        True([$e = 5 / 3$]),
        [$e = 3 / 5$],
        [$e = 4 / 3$],
        [$e = 5 / 4$]
    ),
    loigiai: [
        $a = 3, b = 4 => c = sqrt(a^2 + b^2) = sqrt(9 + 16) = 5$.
        Tâm sai của Hypebol:
        $ e = c / a = 5 / 3 $
    ]
)

// TN 10
#tn([Cho Parabol $(P): y^2 = 4x$. Khoảng cách từ điểm $M(1; 2) in (P)$ đến tiêu điểm $F$ của $(P)$ bằng],
    (
        True([$2$]),
        [$1$],
        [$3$],
        [$4$]
    ),
    loigiai: [
        $2p = 4 => p = 2$.
        Khoảng cách từ điểm $M(x_M; y_M)$ đến tiêu điểm $F$ là bán kính qua tiêu:
        $ M F = x_M + p / 2 = 1 + 2 / 2 = 1 + 1 = 2 $
    ]
)

// TN 11
#tn([Một ăng-ten chảo vệ tinh có mặt cắt là đường Parabol $y^2 = 40x$ (đơn vị: centimét).
Bộ thu sóng tín hiệu vệ tinh được đặt tại tiêu điểm $F$ của Parabol.
Khoảng cách từ đỉnh chảo đến bộ thu sóng bằng],
    (
        True([$10 text(" cm")$]),
        [$20 text(" cm")$],
        [$40 text(" cm")$],
        [$5 text(" cm")$]
    ),
    loigiai: [
        Phương trình có dạng $y^2 = 2p x => 2p = 40 => p = 20 text(" cm")$.
        Khoảng cách từ đỉnh chảo (gốc tọa độ $O$) đến tiêu điểm $F$ là:
        $ O F = p / 2 = 20 / 2 = 10 text(" cm") $
    ]
)

// TN 12
#tn([Quỹ đạo chuyển động của Trái Đất quanh Mặt Trời là một đường Elip có Mặt Trời nằm tại một tiêu điểm.
Biết khoảng cách gần nhất từ Trái Đất đến Mặt Trời là $147 text(" triệu km")$ và khoảng cách xa nhất là $153 text(" triệu km")$.
Độ dài bán trục lớn $a$ của quỹ đạo Elip này bằng],
    (
        True([$150 text(" triệu km")$]),
        [$300 text(" triệu km")$],
        [$6 text(" triệu km")$],
        [$153 text(" triệu km")$]
    ),
    loigiai: [
        Khoảng cách gần nhất (điểm cận nhật) là $r_1 = a - c = 147$.
        Khoảng cách xa nhất (điểm viễn nhật) là $r_2 = a + c = 153$.
        Cộng hai vế:
        $ 2a = r_1 + r_2 = 147 + 153 = 300 => a = 150 text(" triệu km") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Elip và các yếu tố hình học có CeTZ)
#ds([Cho Elip $(E): x^2 / 25 + y^2 / 16 = 1$ có hình biểu diễn trên mặt phẳng tọa độ $O x y$:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-6, 0), (6, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -4.5), (0, 4.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((5.8, -0.3), [$x$])
  content((-0.3, 4.2), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Elip a = 4, b = 3.2 (scale cho vừa mắt)
  circle((0, 0), radius: (4, 2.5), stroke: 1.2pt + rgb("1e40af"))
  content((3.5, 2.3), [$(E)$])
  
  // Đỉnh A1, A2
  circle((-4, 0), radius: 2pt, fill: rgb("1e40af"))
  content((-4, -0.4), [$A_1(-5)$])
  circle((4, 0), radius: 2pt, fill: rgb("1e40af"))
  content((4, -0.4), [$A_2(5)$])
  
  // Đỉnh B1, B2
  circle((0, -2.5), radius: 2pt, fill: rgb("1e40af"))
  content((-0.6, -2.5), [$B_1(-4)$])
  circle((0, 2.5), radius: 2pt, fill: rgb("1e40af"))
  content((-0.5, 2.5), [$B_2(4)$])
  
  // Tiêu điểm F1(-3), F2(3)
  circle((-2.4, 0), radius: 2pt, fill: red)
  content((-2.4, 0.3), [$F_1$])
  circle((2.4, 0), radius: 2pt, fill: red)
  content((2.4, 0.3), [$F_2$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Độ dài trục lớn của Elip bằng $10$.]),
    True([Tiêu cự của Elip bằng $6$.]),
    True([Tọa độ các đỉnh của $(E)$ là $A_1(-5; 0), A_2(5; 0), B_1(0; -4), B_2(0; 4)$.]),
    [Tâm sai của Elip là $e = 4 / 5$.]
  ),
  loigiai: [
    #step([Độ dài các trục])
    $a^2 = 25 => a = 5$, độ dài trục lớn là $2a = 10$. Mệnh đề a ĐÚNG.
    $b^2 = 16 => b = 4$, độ dài trục nhỏ là $2b = 8$.

    #step([Tiêu cự])
    $c = sqrt(a^2 - b^2) = sqrt(25 - 16) = 3$.
    Tiêu cự: $2c = 6$. Mệnh đề b ĐÚNG.

    #step([Tọa độ các đỉnh])
    Bốn đỉnh là $A_1(-5; 0), A_2(5; 0), B_1(0; -4), B_2(0; 4)$. Mệnh đề c ĐÚNG.

    #step([Tâm sai])
    Tâm sai $e = c / a = 3 / 5$ (chứ không phải $4 / 5$).
    Khẳng định $e = 4/5$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Hypebol và tiệm cận)
#ds([Cho Hypebol $(H): x^2 / 16 - y^2 / 9 = 1$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Độ dài trục thực bằng $8$ và độ dài trục ảo bằng $6$.]),
    True([Tọa độ hai tiêu điểm của $(H)$ là $F_1(-5; 0)$ và $F_2(5; 0)$.]),
    True([Phương trình hai đường tiệm cận của $(H)$ là $y = plus.minus 3 / 4 x$.]),
    [Tâm sai của Hypebol bằng $e = 4 / 5$.]
  ),
  loigiai: [
    #step([Độ dài các trục])
    $a^2 = 16 => a = 4$, trục thực $2a = 8$.
    $b^2 = 9 => b = 3$, trục ảo $2b = 6$. Mệnh đề a ĐÚNG.

    #step([Tiêu cự và tiêu điểm])
    $c = sqrt(a^2 + b^2) = sqrt(16 + 9) = 5$.
    Hai tiêu điểm là $F_1(-5; 0)$ và $F_2(5; 0)$. Mệnh đề b ĐÚNG.

    #step([Đường tiệm cận])
    Phương trình tiệm cận: $y = plus.minus b / a x = plus.minus 3 / 4 x$. Mệnh đề c ĐÚNG.

    #step([Tâm sai])
    Tâm sai của Hypebol: $e = c / a = 5 / 4 > 1$ (chứ không phải $4 / 5$).
    Khẳng định $e = 4/5$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Gương đèn pha ô tô Parabol)
#ds([Chóa phản xạ của một đèn pha ô tô có mặt cắt là một đường Parabol $y^2 = 16x$ (đơn vị: centimét).
Đường kính miệng gương đèn bằng $24 text(" cm")$ (ứng với tung độ $y = plus.minus 12$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tham số tiêu của Parabol bằng $p = 8 text(" cm")$.]),
    True([Bóng đèn phát sáng đặt tại tiêu điểm $F(4; 0)$ để chùm tia phản xạ từ gương là chùm tia song song.]),
    True([Độ sâu của chóa đèn pha từ đỉnh đến mặt phẳng miệng gương bằng $9 text(" cm")$.]),
    [Phương trình đường chuẩn của Parabol là $x - 4 = 0$.]
  ),
  loigiai: [
    #step([Tham số tiêu])
    $2p = 16 => p = 8 text(" cm")$. Mệnh đề a ĐÚNG.

    #step([Vị trí tiêu điểm])
    $F(p / 2; 0) = F(4; 0)$. Theo tính chất quang học của Parabol, tia sáng phát ra từ tiêu điểm $F$ sau khi phản xạ trên bề mặt Parabol sẽ trở thành chùm tia song song với trục đối xứng. Mệnh đề b ĐÚNG.

    #step([Độ sâu của chóa đèn])
    Tại miệng gương, $y = plus.minus 12$. Thay vào phương trình Parabol:
    $ 12^2 = 16x <=> 144 = 16x <=> x = 9 text(" cm") $. Mệnh đề c ĐÚNG.

    #step([Phương trình đường chuẩn])
    Đường chuẩn: $x = - p / 2 = - 4 <=> x + 4 = 0$ (chứ không phải $x - 4 = 0$).
    Khẳng định $x - 4 = 0$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số m trong phương trình Elip)
#ds([Cho phương trình $(E_m): x^2 / (m + 2) + y^2 / (10 - m) = 1$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình $(E_m)$ là một Elip có các tiêu điểm nằm trên trục hoành khi $m + 2 > 10 - m > 0$.]),
    True([Điều kiện $10 - m > 0$ tương đương với $m < 10$.]),
    True([Điều kiện $m + 2 > 10 - m$ tương đương với $m > 4$.]),
    [Có đúng 3 giá trị nguyên của tham số $m$ để $(E_m)$ là một Elip có tiêu điểm nằm trên trục hoành.]
  ),
  loigiai: [
    #step([Điều kiện là Elip trục hoành])
    $(E_m)$ là Elip có tiêu điểm nằm trên trục hoành khi $a^2 > b^2 > 0$:
    $ m + 2 > 10 - m > 0 $. Mệnh đề a ĐÚNG.

    #step([Giải hệ bất phương trình])
    - $10 - m > 0 <=> m < 10$. Mệnh đề b ĐÚNG.
    - $m + 2 > 10 - m <=> 2m > 8 <=> m > 4$. Mệnh đề c ĐÚNG.
    Kết hợp lại: $4 < m < 10$.

    #step([Đếm số giá trị nguyên])
    Các giá trị nguyên của $m$ là: $5, 6, 7, 8, 9$ (gồm đúng 5 giá trị nguyên).
    Khẳng định có đúng 3 giá trị nguyên là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tiêu cự Elip)
#tln([Cho Elip $(E): x^2 / 25 + y^2 / 9 = 1$. Tiêu cự của Elip bằng bao nhiêu?],
    [8],
    loigiai: [
        #step([Tính c])
        $ c = sqrt(a^2 - b^2) = sqrt(25 - 9) = sqrt(16) = 4 $
        
        #step([Tính tiêu cự])
        $ 2c = 2(4) = 8 $
    ]
)

// TLN 2 (Độ dài trục thực Hypebol)
#tln([Cho Hypebol $(H): x^2 / 144 - y^2 / 25 = 1$. Độ dài trục thực của Hypebol bằng bao nhiêu?],
    [24],
    loigiai: [
        #step([Xác định bán trục thực a])
        $ a^2 = 144 => a = 12 $
        
        #step([Tính độ dài trục thực])
        $ 2a = 2(12) = 24 $
    ]
)

// TLN 3 (Khoảng cách từ đỉnh đến tiêu điểm Parabol)
#tln([Cho Parabol $(P): y^2 = 20x$. Khoảng cách từ đỉnh $O(0; 0)$ đến tiêu điểm $F$ của Parabol bằng bao nhiêu?],
    [5],
    loigiai: [
        #step([Tìm tham số tiêu p])
        $ 2p = 20 => p = 10 $
        
        #step([Tính khoảng cách OF])
        $ O F = p / 2 = 10 / 2 = 5 $
    ]
)

// TLN 4 (Tiêu cự quỹ đạo Trái Đất)
#tln([Trong bài toán chuyển động của Trái Đất quanh Mặt Trời, khoảng cách gần nhất là $147 text(" triệu km")$ và xa nhất là $153 text(" triệu km")$. Tiêu cự của quỹ đạo Elip này bằng bao nhiêu triệu kilômét?],
    [6],
    loigiai: [
        #step([Tính tiêu cự])
        Ta có $r_1 = a - c = 147$ và $r_2 = a + c = 153$.
        Tiêu cự:
        $ 2c = r_2 - r_1 = 153 - 147 = 6 text(" triệu km") $
    ]
)

// TLN 5 (Độ sâu chóa đèn pha)
#tln([Trong bài toán gương đèn pha ô tô $y^2 = 16x$ có miệng gương rộng $24 text(" cm")$, độ sâu của gương đèn bằng bao nhiêu centimét?],
    [9],
    loigiai: [
        #step([Tính hoành độ x tại miệng gương])
        Tại miệng gương, tung độ là $y = 24 / 2 = 12 text(" cm")$.
        Thay vào phương trình Parabol:
        $ 12^2 = 16x <=> 144 = 16x <=> x = 144 / 16 = 9 text(" cm") $
    ]
)

// TLN 6 (Số giá trị nguyên của m)
#tln([Có bao nhiêu giá trị nguyên của tham số $m$ để $(E_m): x^2 / (m + 2) + y^2 / (10 - m) = 1$ là một Elip có tiêu điểm nằm trên trục hoành?],
    [5],
    loigiai: [
        #step([Tìm tập giá trị của m])
        Điều kiện: $m + 2 > 10 - m > 0 <=> 4 < m < 10$.
        
        #step([Đếm số giá trị nguyên])
        Các giá trị nguyên thỏa mãn: $m in {5, 6, 7, 8, 9}$ (gồm 5 giá trị).
    ]
)

] // end make-questions

#make-questions()
