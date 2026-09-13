#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1e40af") // Classic Blue cho Đề 8A

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BA ĐƯỜNG CONIC & ỨNG DỤNG",
  exam-title: "BÀI 2: BÁN KÍNH QUA TIÊU VÀ TÍNH CHẤT HÌNH HỌC (ĐỀ A - BÁN KÍNH QUA TIÊU)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "322",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho elip $(E): x^2 / a^2 + y^2 / b^2 = 1$ ($a > b > 0$) với tâm sai $e = c / a$. Điểm $M(x_0, y_0)$ thuộc $(E)$. Bán kính qua tiêu $M F_1$ (ứng với tiêu điểm bên trái $F_1(-c, 0)$) và $M F_2$ (ứng với tiêu điểm bên phải $F_2(c, 0)$) được xác định bởi công thức nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Axes
    line((-3.2, 0), (3.2, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -1.6), (0, 1.6), mark: (end: "stealth"), stroke: 0.8pt)
    content((3.4, 0), [$x$], anchor: "west")
    content((0, 1.8), [$y$], anchor: "south")
    // Ellipse
    circle((0, 0), radius: (2.2, 1.3), stroke: 1.5pt + rgb("1e40af"))
    // Foci
    circle((-1.4, 0), radius: 0.08, fill: rgb("1e40af"))
    content((-1.4, -0.3), text(size: 7.5pt)[$F_1$])
    circle((1.4, 0), radius: 0.08, fill: rgb("1e40af"))
    content((1.4, -0.3), text(size: 7.5pt)[$F_2$])
    // Point M
    circle((0.8, 1.1), radius: 0.08, fill: rgb("dc2626"))
    content((0.8, 1.35), text(size: 7.5pt, weight: "bold")[$M(x_0, y_0)$])
    // Radii
    line((0.8, 1.1), (-1.4, 0), stroke: 1.2pt + rgb("dc2626"))
    content((-0.4, 0.7), text(size: 7.5pt, fill: rgb("dc2626"))[$r_1$])
    line((0.8, 1.1), (1.4, 0), stroke: 1.2pt + rgb("16a34a"))
    content((1.3, 0.7), text(size: 7.5pt, fill: rgb("16a34a"))[$r_2$])
  })
]
],
    (
        True([$M F_1 = a + e x_0$ và $M F_2 = a - e x_0$]),
        [$M F_1 = a - e x_0$ và $M F_2 = a + e x_0$],
        [$M F_1 = a + (x_0) / e$ và $M F_2 = a - (x_0) / e$],
        [$M F_1 = c + e x_0$ và $M F_2 = c - e x_0$]
    ),
    loigiai: [
        #step([Công thức bán kính qua tiêu của Elip])
        Với điểm $M(x_0, y_0)$ thuộc elip:
        - $M F_1 = a + e x_0 = a + (c / a) x_0$.
        - $M F_2 = a - e x_0 = a - (c / a) x_0$.
    ]
)

// TN 2
#tn([Với mọi điểm $M$ thuộc elip $(E): x^2 / a^2 + y^2 / b^2 = 1$, tổng hai bán kính qua tiêu $M F_1 + M F_2$ luôn bằng],
    (
        True([$2 a$]),
        [$2 b$],
        [$2 c$],
        [$a + c$]
    ),
    loigiai: [
        #step([Tổng hai bán kính qua tiêu])
        $ M F_1 + M F_2 = (a + e x_0) + (a - e x_0) = 2 a $
        Tổng này không đổi và bằng độ dài trục lớn của elip.
    ]
)

// TN 3
#tn([Cho parabol $(P): y^2 = 2 p x$ ($p > 0$). Bán kính qua tiêu của điểm $M(x_0, y_0)$ thuộc $(P)$ được tính bằng công thức nào sau đây?],
    (
        True([$M F = x_0 + p / 2$]),
        [$M F = x_0 - p / 2$],
        [$M F = y_0 + p / 2$],
        [$M F = 2 x_0 + p$]
    ),
    loigiai: [
        #step([Bán kính qua tiêu của parabol])
        Với điểm $M(x_0, y_0)$ trên parabol $y^2 = 2 p x$:
        $ M F = d(M, Delta) = x_0 - (-p / 2) = x_0 + p / 2 $
    ]
)

// TN 4
#tn([Cho hypebol $(H): x^2 / a^2 - y^2 / b^2 = 1$. Với điểm $M(x_0, y_0)$ nằm trên nhánh bên phải ($x_0 >= a$), các bán kính qua tiêu là],
    (
        True([$M F_1 = e x_0 + a$ và $M F_2 = e x_0 - a$]),
        [$M F_1 = e x_0 - a$ và $M F_2 = e x_0 + a$],
        [$M F_1 = a - e x_0$ và $M F_2 = a + e x_0$],
        [$M F_1 = e x_0$ và $M F_2 = a$]
    ),
    loigiai: [
        #step([Bán kính qua tiêu của Hypebol])
        Trên nhánh phải ($x_0 >= a$), khoảng cách từ $M$ đến tiêu điểm bên trái lớn hơn:
        - $M F_1 = e x_0 + a$.
        - $M F_2 = e x_0 - a$.
        Hiệu $M F_1 - M F_2 = 2 a$.
    ]
)

// TN 5
#tn([Cho elip $(E): x^2 / 25 + y^2 / 9 = 1$. Điểm $M$ thuộc $(E)$ có hoành độ $x_M = 2$. Bán kính qua tiêu $M F_1$ bằng],
    (
        True([$6.6$]),
        [$3.4$],
        [$5.0$],
        [$7.0$]
    ),
    loigiai: [
        #step([Tính các thông số và MF1])
        $a = 5, b = 3 => c = sqrt(25 - 9) = 4$.
        Tâm sai $e = c / a = 4 / 5 = 0.8$.
        $ M F_1 = a + e x_M = 5 + 0.8 times 2 = 5 + 1.6 = 6.6 $
    ]
)

// TN 6
#tn([Cho elip $(E): x^2 / 16 + y^2 / 12 = 1$. Điểm $M$ thuộc $(E)$ có bán kính qua tiêu $M F_1 = 3$. Bán kính qua tiêu $M F_2$ bằng],
    (
        True([$5$]),
        [$4$],
        [$3$],
        [$8$]
    ),
    loigiai: [
        #step([Sử dụng tổng hai bán kính qua tiêu])
        $a^2 = 16 => a = 4 => 2 a = 8$.
        Vì $M F_1 + M F_2 = 2 a$:
        $ M F_2 = 2 a - M F_1 = 8 - 3 = 5 $
    ]
)

// TN 7
#tn([Cho parabol $(P): y^2 = 8 x$. Điểm $M$ thuộc $(P)$ có tung độ $y_M = 4$. Bán kính qua tiêu của điểm $M$ bằng],
    (
        True([$4$]),
        [$2$],
        [$6$],
        [$8$]
    ),
    loigiai: [
        #step([Tìm hoành độ và tính MF])
        $4^2 = 8 x_M <=> 16 = 8 x_M <=> x_M = 2$.
        Tham số tiêu: $2 p = 8 => p = 4 => p / 2 = 2$.
        Bán kính qua tiêu:
        $ M F = x_M + p / 2 = 2 + 2 = 4 $
    ]
)

// TN 8
#tn([Cho hypebol $(H): x^2 / 9 - y^2 / 16 = 1$. Điểm $M$ thuộc nhánh phải có hoành độ $x_M = 6$. Bán kính qua tiêu $M F_2$ bằng],
    (
        True([$7$]),
        [$13$],
        [$10$],
        [$3$]
    ),
    loigiai: [
        #step([Tính tâm sai và MF2])
        $a = 3, b = 4 => c = 5$. Tâm sai $e = 5 / 3$.
        $ M F_2 = e x_M - a = (5 / 3) times 6 - 3 = 10 - 3 = 7 $
    ]
)

// TN 9
#tn([Trên elip $(E): x^2 / a^2 + y^2 / b^2 = 1$, điểm có khoảng cách đến tiêu điểm $F_1(-c, 0)$ nhỏ nhất là],
    (
        True([Đỉnh $A_1(-a, 0)$]),
        [Đỉnh $A_2(a, 0)$],
        [Đỉnh $B_1(0, -b)$],
        [Gốc tọa độ $O(0, 0)$]
    ),
    loigiai: [
        #step([Tìm cực trị bán kính qua tiêu])
        Ta có $M F_1 = a + e x_0$. Vì $-a <= x_0 <= a$, $M F_1$ nhỏ nhất khi $x_0 = -a$, tức tại đỉnh $A_1(-a, 0)$. Khi đó $M F_1 = a - e a = a - c$.
    ]
)

// TN 10
#tn([Trên parabol $(P): y^2 = 2 p x$, điểm có bán kính qua tiêu nhỏ nhất là],
    (
        True([Đỉnh $O(0, 0)$]),
        [Tiêu điểm $F(p / 2, 0)$],
        [Điểm có tung độ $y = p$],
        [Điểm trên đường chuẩn]
    ),
    loigiai: [
        #step([Tìm điểm gần tiêu điểm nhất trên Parabol])
        $M F = x_0 + p / 2$. Vì $x_0 >= 0$ với mọi điểm trên parabol, $M F$ nhỏ nhất khi $x_0 = 0$, tương ứng với đỉnh $O(0, 0)$. Giá trị nhỏ nhất là $p / 2$.
    ]
)

// TN 11
#tn([Cho elip $(E): x^2 / 25 + y^2 / 16 = 1$. Chu vi của tam giác tiêu điểm $M F_1 F_2$ với $M$ là một điểm bất kỳ trên elip bằng],
    (
        True([$16$]),
        [$10$],
        [$6$],
        [$20$]
    ),
    loigiai: [
        #step([Tính chu vi tam giác tiêu điểm])
        $a = 5, b = 4 => c = 3$.
        Tiêu cự $F_1 F_2 = 2 c = 6$.
        Tổng hai bán kính qua tiêu $M F_1 + M F_2 = 2 a = 10$.
        Chu vi tam giác $M F_1 F_2$ là:
        $ P = M F_1 + M F_2 + F_1 F_2 = 2 a + 2 c = 10 + 6 = 16 $
    ]
)

// TN 12
#tn([Cho elip $(E): x^2 / 25 + y^2 / 16 = 1$. Điểm $M$ thuộc elip nhìn hai tiêu điểm dưới góc vuông ($hat(F_1 M F_2) = 90 degree$). Diện tích của tam giác $M F_1 F_2$ bằng],
    (
        True([$16$]),
        [$9$],
        [$12$],
        [$18$]
    ),
    loigiai: [
        #step([Tính diện tích tam giác vuông MF1F2])
        $a = 5, b = 4 => c = 3 => 2 c = 6$.
        Vì tam giác $M F_1 F_2$ vuông tại $M$:
        $ M F_1^2 + M F_2^2 = F_1 F_2^2 = (2 c)^2 = 36 $
        Mặt khác:
        $ (M F_1 + M F_2)^2 = (2 a)^2 = 100 $
        $ <=> M F_1^2 + M F_2^2 + 2 M F_1 M F_2 = 100 $
        $ <=> 36 + 2 M F_1 M F_2 = 100 <=> 2 M F_1 M F_2 = 64 <=> M F_1 M F_2 = 32 $
        Diện tích tam giác là:
        $ S = 1 / 2 M F_1 M F_2 = 1 / 2 times 32 = 16 $
        (Lưu ý: Công thức tổng quát $S = b^2 cot(alpha / 2) = 4^2 cot 45^circ = 16$).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Cho elip $(E): x^2 / 25 + y^2 / 9 = 1$. Điểm $M(x_0, y_0)$ di động trên $(E)$.],
  (
    True([Tâm sai của elip là $e = 0.8$.]),
    True([Bán kính qua tiêu $M F_1$ đạt giá trị lớn nhất bằng $9$.]),
    True([Bán kính qua tiêu $M F_2$ đạt giá trị nhỏ nhất bằng $1$.]),
    [Tích hai bán kính qua tiêu $M F_1 times M F_2$ đạt giá trị lớn nhất khi $M$ trùng với một trong hai đỉnh trên trục hoành.]
  ),
  loigiai: [
    #step([Xét ý a])
    $a = 5, b = 3 => c = 4 => e = c / a = 4 / 5 = 0.8$ (Ý a ĐÚNG).

    #step([Xét ý b và c])
    $M F_1 = 5 + 0.8 x_0$. Vì $-5 <= x_0 <= 5$:
    - Giá trị lớn nhất: $5 + 0.8(5) = 9$ (Ý b ĐÚNG).
    - $M F_2 = 5 - 0.8 x_0$, giá trị nhỏ nhất: $5 - 0.8(5) = 1$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Tích $M F_1 times M F_2 = (a + e x_0)(a - e x_0) = a^2 - e^2 x_0^2$.
    Biểu thức này đạt giá trị lớn nhất khi $x_0 = 0$ (tại các đỉnh trên trục tung $B_1, B_2$), không phải trên trục hoành. Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Cho parabol $(P): y^2 = 12 x$ có tiêu điểm $F$. Điểm $M(x_0, y_0)$ nằm trên parabol $(P)$.],
  (
    True([Tham số tiêu của parabol là $p = 6$.]),
    True([Bán kính qua tiêu của điểm $M$ là $M F = x_0 + 3$.]),
    True([Khoảng cách nhỏ nhất từ một điểm trên parabol đến tiêu điểm $F$ là $3$.]),
    [Nếu điểm $M$ có $M F = 7$ thì hoành độ của $M$ là $x_0 = 5$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    $2 p = 12 => p = 6 => p / 2 = 3$ (Ý a ĐÚNG).
    $M F = x_0 + p / 2 = x_0 + 3$ (Ý b ĐÚNG).
    Khoảng cách nhỏ nhất khi $x_0 = 0$ là $M F = 3$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Nếu $M F = 7$:
    $ x_0 + 3 = 7 <=> x_0 = 4 != 5 $.
    Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Cho hypebol $(H): x^2 / 16 - y^2 / 9 = 1$. Một điểm $M(x_0, y_0)$ nằm trên nhánh bên phải của $(H)$ ($x_0 >= 4$).],
  (
    True([Tâm sai của hypebol là $e = 1.25$.]),
    True([Hiệu hai bán kính qua tiêu $M F_1 - M F_2 = 8$.]),
    True([Với điểm có hoành độ $x_0 = 8$, bán kính qua tiêu $M F_2 = 6$.]),
    [Bán kính qua tiêu $M F_1$ có thể nhận giá trị bằng $3$.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    $a = 4, b = 3 => c = 5 => e = 5 / 4 = 1.25$ (Ý a ĐÚNG).
    $M F_1 - M F_2 = 2 a = 8$ (Ý b ĐÚNG).

    #step([Xét ý c])
    Với $x_0 = 8$: $M F_2 = e x_0 - a = 1.25 times 8 - 4 = 10 - 4 = 6$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Vì $x_0 >= 4$, ta có $M F_1 = e x_0 + a >= 1.25 times 4 + 4 = 9$.
    Do đó $M F_1$ luôn lớn hơn hoặc bằng $9$, không thể bằng $3$. Ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Cho elip $(E): x^2 / 100 + y^2 / 64 = 1$. Gọi $B_1(0, 8)$ là đỉnh trên trục nhỏ và $F_1, F_2$ là hai tiêu điểm của $(E)$.],
  (
    True([Tiêu cự của elip là $F_1 F_2 = 12$.]),
    True([Đoạn thẳng $B_1 F_1 = B_1 F_2 = 10$.]),
    True([Tam giác $B_1 F_1 F_2$ là tam giác cân tại $B_1$.]),
    [Diện tích của tam giác $B_1 F_1 F_2$ bằng $96$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    $a = 10, b = 8 => c = sqrt(100 - 64) = 6$.
    - Tiêu cự: $F_1 F_2 = 2 c = 12$ (Ý a ĐÚNG).
    - Bán kính qua tiêu tại $B_1(0, 8)$: $B_1 F_1 = a + e(0) = a = 10$, $B_1 F_2 = a - e(0) = 10$ (Ý b ĐÚNG).
    - Tam giác có hai cạnh $B_1 F_1 = B_1 F_2 = 10$ nên cân tại $B_1$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Chiều cao tam giác hạ từ $B_1$ xuống $F_1 F_2$ là $O B_1 = b = 8$.
    Diện tích tam giác:
    $ S = 1 / 2 times F_1 F_2 times O B_1 = 1 / 2 times 12 times 8 = 48 != 96 $.
    Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho elip $(E): x^2 / 25 + y^2 / 9 = 1$. Điểm $M$ thuộc $(E)$ có hoành độ $x = 3$. Tính độ dài bán kính qua tiêu $M F_1$ (viết kết quả dưới dạng số thập phân).],
    [7.4],
    loigiai: [
        #step([Tính tâm sai e])
        $a = 5, b = 3 => c = 4 => e = 4 / 5 = 0.8$.
        #step([Tính bán kính qua tiêu MF1])
        $ M F_1 = a + e x = 5 + 0.8 times 3 = 5 + 2.4 = 7.4 $
    ]
)

// TLN 2 (Câu 18)
#tln([Cho parabol $(P): y^2 = 8 x$. Một điểm $M$ thuộc parabol có bán kính qua tiêu $M F = 10$. Tìm hoành độ của điểm $M$.],
    [8],
    loigiai: [
        #step([Áp dụng công thức bán kính qua tiêu])
        $2 p = 8 => p = 4 => p / 2 = 2$.
        $ M F = x_M + p / 2 <=> 10 = x_M + 2 <=> x_M = 8 $
    ]
)

// TLN 3 (Câu 19)
#tln([Cho hypebol $(H): x^2 / 25 - y^2 / 11 = 1$. Điểm $M$ thuộc nhánh phải có hoành độ $x = 10$. Tính bán kính qua tiêu $M F_1$.],
    [17],
    loigiai: [
        #step([Tính tâm sai e])
        $a^2 = 25 => a = 5$, $b^2 = 11 => c = sqrt(25 + 11) = 6$.
        Tâm sai $e = c / a = 6 / 5 = 1.2$.
        #step([Tính MF1])
        $ M F_1 = e x_M + a = 1.2 times 10 + 5 = 12 + 5 = 17 $
    ]
)

// TLN 4 (Câu 20)
#tln([Cho elip $(E): x^2 / 25 + y^2 / 16 = 1$. Chu vi của tam giác tiêu điểm $M F_1 F_2$ (với $M$ là một điểm bất kỳ trên elip) bằng bao nhiêu?],
    [16],
    loigiai: [
        #step([Tính chu vi])
        $a = 5, b = 4 => c = 3$.
        Chu vi tam giác là:
        $ P = (M F_1 + M F_2) + F_1 F_2 = 2 a + 2 c = 2 times 5 + 2 times 3 = 10 + 6 = 16 $
    ]
)

// TLN 5 (Câu 21)
#tln([Cho elip $(E): x^2 / 25 + y^2 / 16 = 1$. Điểm $M$ thuộc elip sao cho $M F_1 = 2 M F_2$. Tính giá trị của biểu thức $T = 3 times M F_1$.],
    [20],
    loigiai: [
        #step([Thiết lập hệ phương trình])
        Ta có tổng hai bán kính qua tiêu:
        $ M F_1 + M F_2 = 2 a = 10 $
        Mặt khác $M F_1 = 2 M F_2 <=> M F_2 = (M F_1) / 2$.
        Thay vào:
        $ M F_1 + (M F_1) / 2 = 10 <=> 3 / 2 M F_1 = 10 <=> 3 times M F_1 = 20 $
    ]
)

// TLN 6 (Câu 22)
#tln([Cho parabol $(P): y^2 = 4 x$. Điểm $M$ thuộc parabol $(P)$ có bán kính qua tiêu $M F = 5$. Tính tung độ dương của điểm $M$.],
    [4],
    loigiai: [
        #step([Tìm hoành độ xM])
        $2 p = 4 => p = 2 => p / 2 = 1$.
        $ M F = x_M + 1 = 5 <=> x_M = 4 $
        #step([Tìm tung độ dương yM])
        Thay $x_M = 4$ vào phương trình parabol:
        $ y_M^2 = 4 times 4 = 16 => y_M = 4 $ (do lấy tung độ dương).
    ]
)

] // end make-questions

#make-questions()
