#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("4f46e5") // Indigo cho Đề 7A

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BA ĐƯỜNG CONIC & ỨNG DỤNG",
  exam-title: "BÀI 1: BA ĐƯỜNG CONIC VÀ ĐỊNH NGHĨA TỔNG QUÁT (ĐỀ A - YẾU TỐ CONIC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "319",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho tiêu điểm $F$, đường chuẩn $Delta$ ($F in.not Delta$) và số thực dương $e$. Tập hợp tất cả các điểm $M$ thỏa mãn tỉ số $(M F) / (d(M, Delta)) = e$ được gọi là một đường conic có tâm sai $e$. Khi $0 < e < 1$, đường conic đó là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Directrix Delta
    line((-2.5, -1.8), (-2.5, 1.8), stroke: 1.5pt + rgb("4f46e5"))
    content((-2.5, 2.0), text(size: 7.5pt, fill: rgb("4f46e5"), weight: "bold")[$Delta$])
    // Focus F
    circle((0.8, 0), radius: 0.08, fill: rgb("4f46e5"))
    content((0.8, -0.3), text(size: 7.5pt, weight: "bold")[$F$])
    // Point M on ellipse
    circle((-0.5, 1.1), radius: 0.08, fill: rgb("dc2626"))
    content((-0.5, 1.35), text(size: 7.5pt, weight: "bold")[$M$])
    // MF and MH
    line((-0.5, 1.1), (0.8, 0), stroke: 1pt + rgb("dc2626"))
    line((-0.5, 1.1), (-2.5, 1.1), stroke: (paint: rgb("dc2626"), dash: "dashed"))
    circle((-2.5, 1.1), radius: 0.06, fill: rgb("4f46e5"))
    content((-2.8, 1.1), text(size: 7.5pt)[$H$])
    // Right angle mark at H
    line((-2.5, 0.95), (-2.35, 0.95), stroke: 0.6pt)
    line((-2.35, 0.95), (-2.35, 1.1), stroke: 0.6pt)
    // Ellipse arc
    arc((0, 0), start: 40deg, stop: 200deg, radius: 1.5, stroke: 1.2pt + rgb("4f46e5"))
  })
]
],
    (
        True([Đường Elip]),
        [Đường Parabol],
        [Đường Hypebol],
        [Đường tròn]
    ),
    loigiai: [
        #step([Định nghĩa tổng quát đường Conic])
        Tập hợp điểm $M$ thỏa mãn $(M F) / (d(M, Delta)) = e$:
        - $0 < e < 1$: Đường Elip.
        - $e = 1$: Đường Parabol.
        - $e > 1$: Đường Hypebol.
    ]
)

// TN 2
#tn([Khi tâm sai $e = 1$, đường conic tương ứng trong định nghĩa tổng quát là],
    (
        True([Đường Parabol]),
        [Đường Elip],
        [Đường Hypebol],
        [Đường thẳng]
    ),
    loigiai: [
        #step([Nhận dạng đường Parabol])
        Khi $e = 1$, ta có $M F = d(M, Delta)$, đây chính là định nghĩa hình học của đường parabol: tập hợp các điểm cách đều tiêu điểm $F$ và đường chuẩn $Delta$.
    ]
)

// TN 3
#tn([Khi tâm sai $e > 1$, đường conic tương ứng trong định nghĩa tổng quát là],
    (
        True([Đường Hypebol]),
        [Đường Elip],
        [Đường Parabol],
        [Hình tròn]
    ),
    loigiai: [
        #step([Nhận dạng đường Hypebol])
        Khi $e > 1$, tỉ số khoảng cách từ $M$ đến tiêu điểm lớn hơn khoảng cách đến đường chuẩn, đường conic là đường Hypebol.
    ]
)

// TN 4
#tn([Cho elip $(E)$ có phương trình chính tắc $x^2 / a^2 + y^2 / b^2 = 1$ ($a > b > 0$). Đặt $c = sqrt(a^2 - b^2)$ và tâm sai $e = c / a$. Phương trình đường chuẩn $Delta_2$ tương ứng với tiêu điểm bên phải $F_2(c, 0)$ là],
    (
        True([$x = a^2 / c$]),
        [$x = c^2 / a$],
        [$x = a / c$],
        [$x = c / a$]
    ),
    loigiai: [
        #step([Phương trình đường chuẩn của Elip])
        Với elip $x^2 / a^2 + y^2 / b^2 = 1$, hai đường chuẩn có phương trình:
        - $Delta_1: x = -a / e = -a^2 / c$ (ứng với tiêu điểm $F_1(-c, 0)$).
        - $Delta_2: x = a / e = a^2 / c$ (ứng với tiêu điểm $F_2(c, 0)$).
    ]
)

// TN 5
#tn([Cho parabol $(P)$ có phương trình chính tắc $y^2 = 2 p x$ ($p > 0$). Phương trình đường chuẩn của parabol là],
    (
        True([$x = -p / 2$]),
        [$x = p / 2$],
        [$y = -p / 2$],
        [$y = p / 2$]
    ),
    loigiai: [
        #step([Đường chuẩn của parabol])
        Parabol $y^2 = 2 p x$ có tiêu điểm $F(p / 2, 0)$ và đường chuẩn $Delta: x = -p / 2$.
    ]
)

// TN 6
#tn([Tâm sai $e$ của elip $(E): x^2 / 25 + y^2 / 9 = 1$ bằng],
    (
        True([$4 / 5$]),
        [$3 / 5$],
        [$5 / 4$],
        [$4 / 3$]
    ),
    loigiai: [
        #step([Tính tâm sai e])
        Ta có $a^2 = 25 => a = 5$, $b^2 = 9 => b = 3$.
        $ c = sqrt(a^2 - b^2) = sqrt(25 - 9) = sqrt(16) = 4 $
        Tâm sai của elip: $e = c / a = 4 / 5 = 0.8$.
    ]
)

// TN 7
#tn([Khoảng cách giữa hai đường chuẩn của elip $(E): x^2 / 16 + y^2 / 7 = 1$ bằng],
    (
        True([$32 / 3$]),
        [$16 / 3$],
        [$8 / 3$],
        [$64 / 3$]
    ),
    loigiai: [
        #step([Tính khoảng cách giữa hai đường chuẩn])
        Ta có $a^2 = 16 => a = 4$, $b^2 = 7 => c = sqrt(16 - 7) = sqrt(9) = 3$.
        Hai đường chuẩn là $x = -a^2 / c$ và $x = a^2 / c$.
        Khoảng cách giữa hai đường chuẩn là:
        $ d(Delta_1, Delta_2) = (2 a^2) / c = (2 times 16) / 3 = 32 / 3 $
    ]
)

// TN 8
#tn([Cho parabol $(P): y^2 = 8 x$. Tọa độ tiêu điểm $F$ và phương trình đường chuẩn $Delta$ của $(P)$ là],
    (
        True([$F(2, 0)$ và $Delta: x = -2$]),
        [$F(4, 0)$ và $Delta: x = -4$],
        [$F(2, 0)$ và $Delta: x = 2$],
        [$F(0, 2)$ và $Delta: y = -2$]
    ),
    loigiai: [
        #step([Xác định F và đường chuẩn])
        Phương trình $y^2 = 2 p x = 8 x => 2 p = 8 => p = 4$.
        - Tiêu điểm: $F(p / 2, 0) = F(2, 0)$.
        - Đường chuẩn: $Delta: x = -p / 2 = -2$.
    ]
)

// TN 9
#tn([Cho hypebol $(H): x^2 / 16 - y^2 / 9 = 1$. Tâm sai $e$ của hypebol bằng],
    (
        True([$5 / 4$]),
        [$4 / 5$],
        [$3 / 4$],
        [$5 / 3$]
    ),
    loigiai: [
        #step([Tính tâm sai của Hypebol])
        $a^2 = 16 => a = 4$, $b^2 = 9 => b = 3$.
        $ c = sqrt(a^2 + b^2) = sqrt(16 + 9) = sqrt(25) = 5 $
        Tâm sai $e = c / a = 5 / 4 = 1.25 > 1$.
    ]
)

// TN 10
#tn([Cho hypebol $(H): x^2 / 9 - y^2 / 16 = 1$. Phương trình đường chuẩn tương ứng với tiêu điểm $F_1(-5, 0)$ là],
    (
        True([$x = -9 / 5$]),
        [$x = 9 / 5$],
        [$x = -5 / 9$],
        [$x = -16 / 5$]
    ),
    loigiai: [
        #step([Xác định đường chuẩn])
        $a^2 = 9, b^2 = 16 => c = sqrt(9 + 16) = 5$.
        Đường chuẩn tương ứng với tiêu điểm bên trái $F_1(-c, 0)$ là:
        $ Delta_1: x = -a^2 / c = -9 / 5 = -1.8 $
    ]
)

// TN 11
#tn([Tập hợp các điểm $M(x, y)$ trên mặt phẳng tọa độ thỏa mãn khoảng cách từ $M$ đến điểm $F(1, 0)$ bằng khoảng cách từ $M$ đến đường thẳng $Delta: x = -1$ là đường nào sau đây?],
    (
        True([Đường parabol có phương trình $y^2 = 4 x$]),
        [Đường elip có phương trình $x^2 + y^2 = 1$],
        [Đường hypebol có phương trình $x^2 - y^2 = 1$],
        [Đường parabol có phương trình $y^2 = 2 x$]
    ),
    loigiai: [
        #step([Thiết lập phương trình])
        Theo định nghĩa parabol, $M F = d(M, Delta)$:
        $ sqrt((x - 1)^2 + y^2) = |x + 1| $
        Bình phương hai vế:
        $ (x - 1)^2 + y^2 = (x + 1)^2 <=> x^2 - 2 x + 1 + y^2 = x^2 + 2 x + 1 <=> y^2 = 4 x $
    ]
)

// TN 12
#tn([Một đường conic có tâm sai $e = 0.5$, tiêu điểm $F(3, 0)$ và đường chuẩn $Delta: x = 12$. Conic này là],
    (
        True([Đường Elip]),
        [Đường Parabol],
        [Đường Hypebol],
        [Đường tròn]
    ),
    loigiai: [
        #step([Nhận diện theo tâm sai])
        Vì tâm sai $e = 0.5$ thỏa mãn $0 < e < 1$, nên conic này chắc chắn là một đường Elip.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Cho elip $(E)$ có phương trình chính tắc $x^2 / 25 + y^2 / 16 = 1$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Directrices
    line((-2.8, -1.5), (-2.8, 1.5), stroke: (paint: rgb("4f46e5"), dash: "dashed"))
    line((2.8, -1.5), (2.8, 1.5), stroke: (paint: rgb("4f46e5"), dash: "dashed"))
    content((-2.8, 1.7), text(size: 7.5pt, fill: rgb("4f46e5"))[$x = -25/3$])
    content((2.8, 1.7), text(size: 7.5pt, fill: rgb("4f46e5"))[$x = 25/3$])
    // Axes
    line((-3.2, 0), (3.2, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -1.5), (0, 1.5), mark: (end: "stealth"), stroke: 0.8pt)
    // Ellipse
    circle((0, 0), radius: (2.0, 1.28), stroke: 1.5pt + rgb("4f46e5"))
    // Foci
    circle((-1.2, 0), radius: 0.08, fill: rgb("4f46e5"))
    content((-1.2, -0.3), text(size: 7.5pt)[$F_1$])
    circle((1.2, 0), radius: 0.08, fill: rgb("4f46e5"))
    content((1.2, -0.3), text(size: 7.5pt)[$F_2$])
  })
]
],
  (
    True([Độ dài trục lớn của elip là $2 a = 10$, độ dài trục nhỏ là $2 b = 8$.]),
    True([Tiêu cự của elip là $2 c = 6$.]),
    True([Tâm sai của elip là $e = 3 / 5 = 0.6$.]),
    [Khoảng cách giữa hai đường chuẩn của elip bằng $15$.]
  ),
  loigiai: [
    #step([Xét ý a])
    $a^2 = 25 => a = 5 => 2a = 10$; $b^2 = 16 => b = 4 => 2b = 8$ (Ý a ĐÚNG).

    #step([Xét ý b])
    $c = sqrt(a^2 - b^2) = sqrt(25 - 16) = 3 => 2c = 6$ (Ý b ĐÚNG).

    #step([Xét ý c])
    $e = c / a = 3 / 5 = 0.6$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Khoảng cách giữa hai đường chuẩn:
    $ d(Delta_1, Delta_2) = (2 a^2) / c = (2 times 25) / 3 = 50 / 3 approx 16.67 != 15 $.
    Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Cho parabol $(P)$ có phương trình $y^2 = 12 x$.],
  (
    True([Tham số tiêu của parabol là $p = 6$.]),
    True([Tọa độ tiêu điểm của parabol là $F(3, 0)$.]),
    True([Phương trình đường chuẩn của parabol là $Delta: x + 3 = 0$.]),
    [Tâm sai của parabol là $e = 0.5$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    Phương trình $y^2 = 2 p x = 12 x => 2 p = 12 => p = 6$ (Ý a ĐÚNG).
    - Tiêu điểm: $F(p / 2, 0) = F(3, 0)$ (Ý b ĐÚNG).
    - Đường chuẩn: $x = -p / 2 = -3 <=> x + 3 = 0$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Theo định nghĩa tổng quát của conic, mọi đường parabol đều có tâm sai cố định $e = 1$, không thể bằng $0.5$. Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Cho hypebol $(H)$ có phương trình chính tắc $x^2 / 9 - y^2 / 16 = 1$.],
  (
    True([Độ dài trục thực là $2 a = 6$, độ dài trục ảo là $2 b = 8$.]),
    True([Tiêu cự của hypebol là $2 c = 10$.]),
    True([Tâm sai của hypebol là $e = 5 / 3 > 1$.]),
    [Hai đường chuẩn của hypebol có phương trình là $x = plus.minus 5 / 3$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    $a^2 = 9 => a = 3$, $b^2 = 16 => b = 4$.
    - Trục thực: $2 a = 6$, trục ảo: $2 b = 8$ (Ý a ĐÚNG).
    - $c = sqrt(a^2 + b^2) = sqrt(9 + 16) = 5 => 2 c = 10$ (Ý b ĐÚNG).
    - Tâm sai: $e = c / a = 5 / 3$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Phương trình hai đường chuẩn là:
    $ x = plus.minus a^2 / c = plus.minus 9 / 5 = plus.minus 1.8 $.
    Phương trình $x = plus.minus 5 / 3$ là SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Trong mặt phẳng tọa độ $O x y$, cho điểm $F(2, 0)$ và đường thẳng $Delta: x - 8 = 0$. Xét tập hợp tất cả các điểm $M(x, y)$ thỏa mãn tỉ số $(M F) / (d(M, Delta)) = 1 / 2$.],
  (
    True([Tập hợp điểm $M$ là một đường Elip.]),
    True([Tâm sai của đường conic này là $e = 1 / 2$.]),
    True([Gốc tọa độ $O(0, 0)$ không thuộc đường conic này.]),
    [Phương trình của conic là $x^2 / 16 + y^2 / 12 = 1$.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    Vì tỉ số $e = 1 / 2$ thỏa mãn $0 < e < 1$, nên tập hợp các điểm $M$ là một đường Elip (Ý a và b ĐÚNG).

    #step([Xét ý c])
    Thử với gốc tọa độ $O(0, 0)$:
    $ O F = sqrt((0 - 2)^2 + 0^2) = 2 $
    $ d(O, Delta) = |0 - 8| = 8 $
    Tỉ số $(O F) / (d(O, Delta)) = 2 / 8 = 1 / 4 != 1 / 2$.
    Do đó $O$ không thuộc conic (Ý c ĐÚNG).

    #step([Xét ý d])
    Phương trình tập hợp điểm $M$:
    $ sqrt((x - 2)^2 + y^2) = 1 / 2 |x - 8| $
    Bình phương hai vế:
    $ (x - 2)^2 + y^2 = 1 / 4 (x - 8)^2 $
    $ <=> 4(x^2 - 4 x + 4 + y^2) = x^2 - 16 x + 64 $
    $ <=> 4 x^2 - 16 x + 16 + 4 y^2 = x^2 - 16 x + 64 $
    $ <=> 3 x^2 + 4 y^2 = 48 <=> x^2 / 16 + y^2 / 12 = 1 $
    Phương trình đúng là $x^2 / 16 + y^2 / 12 = 1$. Do đó ý d ĐÚNG.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Tính tâm sai $e$ của elip có phương trình $x^2 / 100 + y^2 / 64 = 1$ (viết kết quả dưới dạng số thập phân).],
    [0.6],
    loigiai: [
        #step([Tính tâm sai e])
        $a^2 = 100 => a = 10$, $b^2 = 64 => b = 8$.
        $ c = sqrt(100 - 64) = sqrt(36) = 6 $
        $ e = c / a = 6 / 10 = 0.6 $
    ]
)

// TLN 2 (Câu 18)
#tln([Tính tham số tiêu $p$ của parabol $(P): y^2 = 14 x$.],
    [7],
    loigiai: [
        #step([Tìm tham số tiêu p])
        Phương trình chính tắc $y^2 = 2 p x = 14 x => 2 p = 14 => p = 7$.
    ]
)

// TLN 3 (Câu 19)
#tln([Cho hypebol $(H): x^2 / 144 - y^2 / 25 = 1$. Tính tiêu cự $2 c$ của hypebol này.],
    [26],
    loigiai: [
        #step([Tính c và tiêu cự])
        $a^2 = 144, b^2 = 25$.
        $ c = sqrt(a^2 + b^2) = sqrt(144 + 25) = sqrt(169) = 13 $
        Tiêu cự $2 c = 2 times 13 = 26$.
    ]
)

// TLN 4 (Câu 20)
#tln([Tìm hoành độ tiêu điểm $F$ của parabol $(P): y^2 = 20 x$.],
    [5],
    loigiai: [
        #step([Xác định hoành độ tiêu điểm])
        $2 p = 20 => p = 10$.
        Hoành độ tiêu điểm là $x_F = p / 2 = 10 / 2 = 5$.
    ]
)

// TLN 5 (Câu 21)
#tln([Một đường conic có tiêu điểm $F(4, 0)$, đường chuẩn $Delta: x = 1$ và tâm sai $e = 2$. Conic này cắt trục hoành tại hai đỉnh $A_1(x_1, 0)$ và $A_2(x_2, 0)$ ($x_1 < x_2$). Tính giá trị $x_2$.],
    [2],
    loigiai: [
        #step([Tìm giao điểm với trục hoành])
        Điểm $A(x, 0)$ thuộc conic thỏa mãn $(A F) / (d(A, Delta)) = e = 2$:
        $ |x - 4| = 2 |x - 1| $
        Bình phương hai vế:
        $ (x - 4)^2 = 4 (x - 1)^2 <=> x^2 - 8 x + 16 = 4(x^2 - 2 x + 1) $
        $ <=> 3 x^2 - 12 = 0 <=> x^2 = 4 <=> x = plus.minus 2 $
        Hai đỉnh có hoành độ là $x_1 = -2$ và $x_2 = 2$. Vậy $x_2 = 2$.
    ]
)

// TLN 6 (Câu 22)
#tln([Cho parabol $(P): y^2 = 8 x$. Một điểm $M$ thuộc $(P)$ có khoảng cách đến đường chuẩn $Delta$ bằng $6$. Tính khoảng cách từ điểm $M$ đến tiêu điểm $F$ của parabol.],
    [6],
    loigiai: [
        #step([Áp dụng định nghĩa parabol])
        Với parabol, tâm sai $e = 1$, nghĩa là tỉ số:
        $ (M F) / (d(M, Delta)) = 1 <=> M F = d(M, Delta) $
        Vì khoảng cách từ $M$ đến đường chuẩn bằng $6$, nên khoảng cách từ $M$ đến tiêu điểm $F$ cũng chính bằng $6$.
    ]
)

] // end make-questions

#make-questions()
