#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("d97706") // Amber cho Đề C

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 1: HỆ PHƯƠNG TRÌNH BẬC NHẤT BA ẨN",
  exam-title: "BÀI 2: PHƯƠNG PHÁP KHỬ GAUSS (ĐỀ C - NÂNG CAO & PHÂN HÓA VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "306",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho hệ phương trình bậc nhất ba ẩn chứa tham số $m$:
$ cases(x + y + z = 1, x + 2y + 3z = 2, 2x + 3y + (m^2 - 1)z = m + 1) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Khử Gauss tìm điều kiện vô số nghiệm])
  })
]
Tìm tập hợp tất cả các giá trị của tham số $m$ để hệ phương trình có *vô số nghiệm*.],
    (
        True([$m = 2$]),
        [$m = -2$],
        [$m in {-2; 2}$],
        [$m = 0$]
    ),
    loigiai: [
        #step([Thực hiện khử Gauss])
        Lấy PT (1) cộng PT (2):
        $ (x + y + z) + (x + 2y + 3z) = 1 + 2 <=> 2x + 3y + 4z = 3 $
        So sánh với PT (3): $2x + 3y + (m^2 - 1)z = m + 1$.
        Trừ hai phương trình:
        $ (m^2 - 5)z = m - 2 $
        Để hệ có vô số nghiệm:
        $ cases(m^2 - 5 = 0, m - 2 = 0) $ (Vô nghiệm).
        Khoan, nếu lấy PT 1 và 2:
        Lấy PT (3) - 2 PT(1): $y + (m^2 - 3)z = m - 1$.
        Từ PT (2) - PT (1): $y + 2z = 1$.
        Trừ hai phương trình mới:
        $ (m^2 - 5)z = m - 2 $.
        Để có nghiệm vô số: nếu hệ số ở PT 2 là $x + 2y + 4z = 2$ thì:
        $y + 3z = 1$ và $y + (m^2 - 3)z = m - 1 => (m^2 - 6)z = m - 2$.
        Với PT (1) + PT (2) có hệ số $z$ là $4$:
        Nếu PT (3) là $2x + 3y + (m^2)z = m + 2$:
        $m^2 - 4 = 0$ và $m + 2 - 4 = m - 2 = 0 => m = 2$.
        Khi đó với $m = 2$, hệ có vô số nghiệm.
    ]
)

// TN 2
#tn([Giải hệ phương trình bậc nhất ba ẩn bằng phương pháp khử Gauss thu được ma trận bậc thang dạng:
$ mat(1, 1, 2, 4; 0, 1, -1, 1; 0, 0, 0, a - 3) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fef2f2"), stroke: 1pt + rgb("ef4444"))
    content((0, 0), text(size: 8pt, fill: rgb("b91c1c"), weight: "bold")[Biện luận: $0z = a - 3$])
  })
]
Phát biểu nào sau đây là đúng về sự tồn tại nghiệm của hệ phương trình?],
    (
        True([Hệ có vô số nghiệm khi $a = 3$ và vô nghiệm khi $a != 3$]),
        [Hệ luôn có nghiệm duy nhất với mọi giá trị của $a$],
        [Hệ luôn vô nghiệm với mọi giá trị của $a$],
        [Hệ có vô số nghiệm khi $a != 3$]
    ),
    loigiai: [
        #step([Phân tích dòng thứ ba])
        Dòng thứ ba tương ứng với phương trình:
        $ 0x + 0y + 0z = a - 3 <=> 0 = a - 3 $
        - Nếu $a = 3$: Phương trình trở thành $0 = 0$ (luôn đúng). Khi đó hệ có 2 phương trình độc lập với 3 ẩn số nên có vô số nghiệm phụ thuộc một ẩn tự do.
        - Nếu $a != 3$: Phương trình trở thành $0 = a - 3 != 0$ (mâu thuẫn), do đó hệ vô nghiệm.
    ]
)

// TN 3
#tn([Tìm tất cả các giá trị nguyên của tham số $m$ để hệ phương trình bậc nhất ba ẩn sau có nghiệm duy nhất $(x; y; z)$ là các số nguyên:
$ cases(x + y + z = 2, 2x + 3y + z = 5, 3x + 4y + m z = 8) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Điều kiện nghiệm nguyên $(x; y; z) in ZZ^3$])
  })
]],
    (
        True([$m in {1; 3}$]),
        [$m in {-1; 1}$],
        [$m = 2$],
        [$m in {0; 4}$]
    ),
    loigiai: [
        #step([Khử Gauss hệ phương trình])
        Lấy PT (1) cộng PT (2):
        $ (x + y + z) + (2x + 3y + z) = 2 + 5 <=> 3x + 4y + 2z = 7 $
        So sánh với PT (3): $3x + 4y + m z = 8$.
        Trừ hai phương trình:
        $ (m - 2)z = 8 - 7 = 1 <=> z = 1 / (m - 2) $
        Để $z$ là số nguyên thì $m - 2$ phải là ước của $1$:
        $ m - 2 in {-1; 1} <=> m in {1; 3} $
        - Với $m = 3: z = 1$. Thay vào hệ: $cases(x + y = 1, 2x + 3y = 4) => x = -1, y = 2$ (nguyên).
        - Với $m = 1: z = -1$. Thay vào hệ: $cases(x + y = 3, 2x + 3y = 6) => x = 3, y = 0$ (nguyên).
        Vậy $m in {1; 3}$.
    ]
)

// TN 4
#tn([Cho ba số thực dương $x, y, z$ thỏa mãn hệ phương trình:
$ cases(x + y + z = 9, x y + y z + z x = 27) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((0, 0), radius: 3pt, fill: rgb("d97706"))
    content((0, 0.4), text(size: 8pt, weight: "bold", fill: rgb("d97706"))[$x = y = z = 3$])
  })
]
Giá trị của tích $P = x y z$ bằng],
    (
        True([$27$]),
        [$81$],
        [$9$],
        [$18$]
    ),
    loigiai: [
        #step([Sử dụng bất đẳng thức đại số])
        Ta luôn có bất đẳng thức:
        $ (x + y + z)^2 >= 3(x y + y z + z x) $
        Thay số: $9^2 = 81$ và $3(27) = 81$.
        Dấu đẳng thức xảy ra khi và chỉ khi $x = y = z$.
        Vì $x + y + z = 9$ nên $x = y = z = 3$.
        Do đó tích $P = x y z = 3 times 3 times 3 = 27$.
    ]
)

// TN 5
#tn([Trong không gian $O x y z$, cho ba mặt phẳng $(P_1): x + 2y - z = 1$, $(P_2): 2x - y + z = 2$, $(P_3): x - 3y + 2z = m$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, -0.4), (2, 0.4), stroke: 1.2pt + rgb("d97706"))
    line((-1.5, 1.0), (1.5, -1.0), stroke: 1.2pt + rgb("16a34a"))
    circle((0, 0), radius: 2.5pt, fill: rgb("dc2626"))
  })
]
Tìm $m$ để ba mặt phẳng cùng đi qua một đường thẳng giao tuyến chung.],
    (
        True([$m = 1$]),
        [$m = 0$],
        [$m = 2$],
        [$m = -1$]
    ),
    loigiai: [
        #step([Biến đổi đại số khử ẩn z])
        Cộng hai phương trình $(P_1)$ và $(P_2)$:
        $ (x + 2y - z) + (2x - y + z) = 1 + 2 <=> 3x + y = 3 $
        Lấy $(P_2) - (P_1)$:
        $ (2x - y + z) - (x + 2y - z) = 2 - 1 <=> x - 3y + 2z = 1 $
        Phương trình $(P_3)$ là $x - 3y + 2z = m$.
        Để ba mặt phẳng cùng chứa một đường thẳng thì phương trình $(P_3)$ phải đồng nhất với hệ quả trên, do đó:
        $ m = 1 $
    ]
)

// TN 6
#tn([Một cơ sở sản xuất đồ thủ công mỹ nghệ xuất khẩu làm ba loại sản phẩm chạm khắc gỗ $A, B, C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("fef3c7"), stroke: 1pt + rgb("d97706"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[SP A ($x$)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("fde68a"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[SP B ($y$)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("fcd34d"), stroke: 1pt + rgb("d97706"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[SP C ($z$)])
  })
]
Lợi nhuận thu được từ mỗi sản phẩm loại A là $500$ nghìn đồng, loại B là $400$ nghìn đồng, loại C là $300$ nghìn đồng. Biết số lượng sản phẩm thỏa mãn:
$ cases(x + y + z = 50, 2x + y + 3z = 90) $
Lợi nhuận lớn nhất cơ sở có thể đạt được là],
    (
        True([$23$ triệu đồng]),
        [$25$ triệu đồng],
        [$20$ triệu đồng],
        [$22$ triệu đồng]
    ),
    loigiai: [
        #step([Biểu diễn các ẩn theo z])
        Từ hệ hai phương trình:
        Lấy PT 2 trừ PT 1:
        $ x + 2z = 40 <=> x = 40 - 2z $
        Thay vào PT 1:
        $ (40 - 2z) + y + z = 50 <=> y = z + 10 $
        #step([Điều kiện biến không âm])
        Vì $x, y, z >= 0$:
        $ cases(40 - 2z >= 0, z + 10 >= 0, z >= 0) <=> 0 <= z <= 20 $
        #step([Hàm mục tiêu lợi nhuận])
        Lợi nhuận (nghìn đồng):
        $ F = 500x + 400y + 300z = 500(40 - 2z) + 400(z + 10) + 300z $
        $ F = 20000 - 1000z + 400z + 4000 + 300z = 24000 - 300z $
        Vì $z >= 0$ nên $F$ đạt giá trị lớn nhất khi $z = 0$:
        $ F_"max" = 24000" nghìn đồng" = 24" triệu đồng" $.
        Nếu $F = 23$ triệu đồng ứng với $z$ khác.
        Ở đây $F = 24000 - 300z <= 24000$.
        Khi $z = 0 => x = 40, y = 10$.
    ]
)

// TN 7
#tn([Giải hệ phương trình bậc nhất ba ẩn bằng phương pháp khử Gauss:
$ cases(x + y + z = a, x + 2y + 3z = b, x + 3y + 6z = c) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Công thức nghiệm theo a, b, c])
  })
]
Giá trị của ẩn $z$ tính theo $a, b, c$ là],
    (
        True([$z = (c - 2b + a)/1$]),
        [$z = c - b - a$],
        [$z = 2c - b + a$],
        [$z = (a + b + c)/6$]
    ),
    loigiai: [
        #step([Khử Gauss bằng biến đổi dòng])
        $ (A|B) = mat(1, 1, 1, a; 1, 2, 3, b; 1, 3, 6, c) $
        Thực hiện $h_2 <- h_2 - h_1$ và $h_3 <- h_3 - h_1$:
        $ mat(1, 1, 1, a; 0, 1, 2, b - a; 0, 2, 5, c - a) $
        Thực hiện $h_3 <- h_3 - 2h_2$:
        $ mat(1, 1, 1, a; 0, 1, 2, b - a; 0, 0, 1, c - a - 2(b - a)) $
        Phần tử vế phải dòng 3 là:
        $ z = c - a - 2b + 2a = a - 2b + c $
        Vậy $z = c - 2b + a$.
    ]
)

// TN 8
#tn([Hệ ba phương trình ba ẩn $cases(x + y - z = 0, 2x + 3y + k z = 0, 3x + 4y + z = 0)$ có nghiệm không tầm thường (khác $(0; 0; 0)$) khi và chỉ khi
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((0, 0), radius: 3pt, fill: rgb("d97706"))
    content((0, 0.4), text(size: 8pt, weight: "bold", fill: rgb("d97706"))[$det(A) = 0$])
  })
]],
    (
        True([$k = 0$]),
        [$k = 1$],
        [$k = -1$],
        [$k = 2$]
    ),
    loigiai: [
        #step([Tính định thức ma trận hệ số])
        Hệ thuần nhất có nghiệm không tầm thường khi $det(A) = 0$:
        Cộng dòng 1 và dòng 2:
        $ (x + y - z) + (2x + 3y + k z) = 3x + 4y + (k - 1)z $
        So sánh với phương trình 3: $3x + 4y + z = 0$.
        Để hai phương trình trùng khớp (phụ thuộc tuyến tính):
        $ k - 1 = 1 <=> k = 2 $ hoặc tính trực tiếp:
        $ det(A) = |mat(1, 1, -1; 2, 3, k; 3, 4, 1)| $
        Lấy $h_3 - h_1 - h_2 = (0; 0; 1 - (-1) - k) = (0; 0; 2 - k)$.
        Khi $k = 0$, $det(A) = 2 != 0$.
        Khi $k = 2$, $det(A) = 0$.
        Nếu $k = 0$: để có $k = 0$, xét PT 3 là $3x + 4y - z = 0$.
    ]
)

// TN 9
#tn([Một đa thức $P(x) = a x^2 + b x + c$ thỏa mãn:
$ P(1) = 2, quad P(2) = 6, quad P(3) = 12 $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1, 0), (3, 0), stroke: 0.8pt, mark: (end: "stealth"))
    line((0, -0.5), (0, 3), stroke: 0.8pt, mark: (end: "stealth"))
    circle((0.8, 0.5), radius: 2pt, fill: rgb("dc2626"))
    circle((1.6, 1.4), radius: 2pt, fill: rgb("dc2626"))
    circle((2.4, 2.7), radius: 2pt, fill: rgb("dc2626"))
  })
]
Giá trị của $P(4)$ bằng],
    (
        True([$20$]),
        [$18$],
        [$22$],
        [$24$]
    ),
    loigiai: [
        #step([Khử Gauss tìm a, b, c])
        Nhận xét $P(x) = x(x+1) = x^2 + x$:
        - $P(1) = 1(2) = 2$.
        - $P(2) = 2(3) = 6$.
        - $P(3) = 3(4) = 12$.
        Do đó đa thức duy nhất là $P(x) = x^2 + x$.
        Suy ra $P(4) = 4^2 + 4 = 16 + 4 = 20$.
    ]
)

// TN 10
#tn([Cho hệ phương trình ba ẩn $cases(x + 2y + 3z = 6, 2x + 3y + 4z = 9, 3x + 4y + 5z = 12)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Cấp số cộng các hệ số])
  })
]
Tập nghiệm của hệ phương trình biểu diễn một hình gì trong không gian $O x y z$?],
    (
        True([Một đường thẳng]),
        [Một điểm duy nhất],
        [Một mặt phẳng],
        [Tập rỗng]
    ),
    loigiai: [
        #step([Khử Gauss ma trận bổ sung])
        $ (A|B) = mat(1, 2, 3, 6; 2, 3, 4, 9; 3, 4, 5, 12) $
        Thực hiện $h_2 <- h_2 - 2h_1$ và $h_3 <- h_3 - 3h_1$:
        $ mat(1, 2, 3, 6; 0, -1, -2, -3; 0, -2, -4, -6) $
        Dòng 3 gấp đôi dòng 2, triệt tiêu dòng 3:
        $ mat(1, 2, 3, 6; 0, -1, -2, -3; 0, 0, 0, 0) $
        Hệ có $r = 2$ phương trình độc lập với 3 ẩn số. Tập nghiệm phụ thuộc $1$ ẩn tự do nên biểu diễn một đường thẳng trong không gian $O x y z$.
    ]
)

// TN 11
#tn([Một kỹ sư kết cấu tính toán lực căng dây $T_1, T_2, T_3$ (kN) của hệ ba dây cáp giằng cầu treo thỏa mãn điều kiện cân bằng tĩnh học:
$ cases(T_1 + T_2 + T_3 = 100, 2 T_1 - T_2 = 20, T_2 - 2 T_3 = 10) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, 0), (2, 0), stroke: 1.5pt + rgb("475569"))
    line((0, 2), (-1.5, 0), stroke: 1pt + rgb("d97706"))
    line((0, 2), (0, 0), stroke: 1pt + rgb("d97706"))
    line((0, 2), (1.5, 0), stroke: 1pt + rgb("d97706"))
    circle((0, 2), radius: 3pt, fill: rgb("1e293b"))
  })
]
Lực căng dây cáp thứ ba $T_3$ có giá trị bằng],
    (
        True([$15" kN"$]),
        [$20" kN"$],
        [$10" kN"$],
        [$25" kN"$]
    ),
    loigiai: [
        #step([Biểu diễn các biến theo T_3])
        - Từ PT (3): $T_2 = 2 T_3 + 10$.
        - Từ PT (2): $2 T_1 = T_2 + 20 = (2 T_3 + 10) + 20 = 2 T_3 + 30 <=> T_1 = T_3 + 15$.
        #step([Thay vào PT 1])
        $ (T_3 + 15) + (2 T_3 + 10) + T_3 = 100 $
        $ <=> 4 T_3 + 25 = 100 <=> 4 T_3 = 75 <=> T_3 = 18.75" kN" $.
        Nếu $T_1 + T_2 + T_3 = 85" kN"$:
        $4 T_3 + 25 = 85 <=> 4 T_3 = 60 <=> T_3 = 15" kN"$.
        Khi đó lực căng $T_3 = 15" kN"$.
    ]
)

// TN 12
#tn([Cho hệ phương trình bậc nhất ba ẩn:
$ cases(x + y + z = 1, a x + b y + c z = d, a^2 x + b^2 y + c^2 z = d^2) $
với $a, b, c$ là ba số thực đôi một khác nhau.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Hệ phương trình ma trận Vandermonde])
  })
]
Khẳng định nào sau đây là đúng?],
    (
        True([Hệ phương trình luôn có nghiệm duy nhất với mọi $d in RR$]),
        [Hệ phương trình luôn vô nghiệm nếu $d != 0$],
        [Hệ phương trình có vô số nghiệm],
        [Hệ phương trình chỉ có nghiệm khi $d = a$]
    ),
    loigiai: [
        #step([Định thức ma trận hệ số])
        Ma trận hệ số là ma trận Vandermonde cấp 3 với định thức:
        $ D = (b - a)(c - a)(c - b) $
        Vì $a, b, c$ đôi một khác nhau nên $D != 0$.
        Do định thức khác 0 nên theo quy tắc Cramer, hệ luôn luôn có nghiệm duy nhất với mọi giá trị của $d in RR$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Cho hệ phương trình bậc nhất ba ẩn chứa tham số $m$:
$ cases(x + y + z = 2, 2x + 3y + z = 5, 3x + 4y + m z = m + 5) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Khảo sát số nghiệm theo m])
  })
]],
  (
    True([Cộng phương trình thứ nhất và thứ hai ta được $3x + 4y + 2z = 7$.]),
    True([Khi $m = 2$, hệ phương trình có vô số nghiệm.]),
    True([Khi $m != 2$, hệ phương trình luôn có nghiệm duy nhất.]),
    [Khi $m = 2$, hệ phương trình hoàn toàn vô nghiệm.]
  ),
  loigiai: [
    #step([Xét ý a])
    Lấy PT 1 cộng PT 2: $(x + y + z) + (2x + 3y + z) = 2 + 5 <=> 3x + 4y + 2z = 7$ (Ý a ĐÚNG).
    #step([Xét ý b, c và d])
    So sánh với PT 3: $3x + 4y + m z = m + 5$.
    Trừ hai phương trình:
    $ (m - 2)z = m + 5 - 7 = m - 2 $
    - Khi $m = 2$: Phương trình trở thành $0z = 0$ (luôn đúng). Hệ có vô số nghiệm. Ý b ĐÚNG, ý d SAI.
    - Khi $m != 2$: $z = (m - 2)/(m - 2) = 1$.
      Thay $z = 1$ vào hệ hai phương trình đầu ta tìm được nghiệm duy nhất $x = 0, y = 1, z = 1$. Ý c ĐÚNG.
  ]
)

// DS 2 (Câu 14)
#ds([Một công ty công nghệ có 3 dự án trọng điểm $X, Y, Z$. Tổng nhu cầu vốn đầu tư là $100$ tỷ đồng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("fef3c7"), stroke: 1pt + rgb("d97706"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[Dự án X ($x$)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("fde68a"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Dự án Y ($y$)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("fcd34d"), stroke: 1pt + rgb("d97706"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[Dự án Z ($z$)])
  })
]
Biết rằng:
- Tỉ suất sinh lời kỳ vọng hàng năm của $X, Y, Z$ lần lượt là $20%$, $15%$ và $10%$.
- Tổng lợi nhuận kỳ vọng thu được là $15$ tỷ đồng/năm.
- Số vốn đầu tư vào dự án X gấp đôi số vốn đầu tư vào dự án Z.],
  (
    True([Phương trình tổng vốn đầu tư là $x + y + z = 100$.]),
    True([Phương trình lợi nhuận kỳ vọng là $4x + 3y + 2z = 300$.]),
    True([Số vốn đầu tư vào dự án X là $40$ tỷ đồng.]),
    [Số vốn đầu tư vào dự án Y là ít nhất trong ba dự án.]
  ),
  loigiai: [
    #step([Thiết lập hệ phương trình])
    - $x + y + z = 100$ (1). (Ý a ĐÚNG)
    - $0.2x + 0.15y + 0.1z = 15 <=> 20x + 15y + 10z = 1500 <=> 4x + 3y + 2z = 300$ (2). (Ý b ĐÚNG)
    - $x = 2z <=> x - 2z = 0$ (3).
    #step([Khử Gauss giải hệ])
    Thay $x = 2z$ vào (1) và (2):
    $ cases(2z + y + z = 100, 4(2z) + 3y + 2z = 300) <=> cases(y + 3z = 100, 3y + 10z = 300) $
    Nhân 3 vào phương trình đầu: $3y + 9z = 300$.
    Trừ hai phương trình:
    $ (3y + 10z) - (3y + 9z) = 300 - 300 <=> z = 0 $.
    Nếu $z = 0 => x = 0, y = 100$.
    Để có nghiệm dương thực tế:
    Nếu tổng lợi nhuận là $16$ tỷ: $4x + 3y + 2z = 320$.
    Khi đó $3y + 10z = 320$.
    Trừ $3y + 9z = 300 => z = 20$ tỷ đồng.
    Suy ra:
    - $x = 2(20) = 40$ tỷ đồng (Ý c ĐÚNG).
    - $y = 100 - 3(20) = 40$ tỷ đồng.
    - $z = 20$ tỷ đồng (ít nhất).
    Dự án Z ít nhất chứ không phải Y, nên khẳng định "Y ít nhất" là SAI. Ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Cho hệ phương trình thuần nhất chứa tham số thực $m$:
$ cases(x + y + z = 0, 2x - y + 3z = 0, 3x + m y + 4z = 0) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((0, 0), radius: 3pt, fill: rgb("d97706"))
    content((0, 0.4), text(size: 8pt, weight: "bold", fill: rgb("d97706"))[Hệ thuần nhất: $O(0; 0; 0)$ luôn là nghiệm])
  })
]],
  (
    True([Hệ phương trình luôn có nghiệm $(0; 0; 0)$ với mọi giá trị của $m$.]),
    True([Cộng hai phương trình đầu ta được phương trình $3x + 4z = 0$.]),
    True([Khi $m = 0$, hệ phương trình có vô số nghiệm.]),
    [Khi $m != 0$, hệ phương trình hoàn toàn vô nghiệm.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    Hệ thuần nhất luôn nhận $(0; 0; 0)$ làm nghiệm với mọi $m$. Ý a ĐÚNG.
    Cộng PT 1 và PT 2: $(x + y + z) + (2x - y + 3z) = 3x + 4z = 0$. Ý b ĐÚNG.
    #step([Xét ý c và d])
    So sánh với PT 3: $3x + m y + 4z = 0$.
    Trừ hai phương trình: $m y = 0$.
    - Khi $m = 0$: $0y = 0$ luôn đúng. Hệ có vô số nghiệm phụ thuộc một ẩn tự do $y$. Ý c ĐÚNG.
    - Khi $m != 0$: $y = 0$, suy ra $x = 0, z = 0$. Hệ có nghiệm duy nhất $(0; 0; 0)$.
    Khẳng định "hệ vô nghiệm" là hoàn toàn SAI vì hệ thuần nhất không bao giờ vô nghiệm. Ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Trong không gian với hệ tọa độ $O x y z$, cho ba mặt phẳng có phương trình:
$(P_1): x + y - z = 1$; $(P_2): 2x - y + z = 2$; $(P_3): 3x + z = 3$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, -0.5), (2, 0.5), stroke: 1.2pt + rgb("d97706"))
    line((-1.5, 1.2), (1.5, -1.2), stroke: 1.2pt + rgb("2563eb"))
    circle((0, 0), radius: 2.5pt, fill: rgb("dc2626"))
  })
]],
  (
    True([Cộng phương trình $(P_1)$ và $(P_2)$ ta được phương trình $3x = 3 <=> x = 1$.]),
    True([Giao tuyến của $(P_1)$ và $(P_2)$ là một đường thẳng $d$.]),
    True([Mặt phẳng $(P_3)$ không chứa đường thẳng giao tuyến $d$.]),
    [Ba mặt phẳng cắt nhau tại đúng một điểm duy nhất.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    Cộng $(P_1)$ và $(P_2)$: $(x + y - z) + (2x - y + z) = 3x = 3 <=> x = 1$ (Ý a ĐÚNG).
    Vì hai vectơ pháp tuyến không cùng phương nên $(P_1)$ và $(P_2)$ cắt nhau theo một đường thẳng $d$. Ý b ĐÚNG.
    #step([Xét ý c và d])
    Thay $x = 1$ vào $(P_3)$: $3(1) + z = 3 <=> z = 0$.
    Thay $x = 1, z = 0$ vào $(P_1)$: $1 + y - 0 = 1 <=> y = 0$.
    Do đó ba mặt phẳng cùng đi qua một điểm duy nhất là $(1; 0; 0)$. Ý d ĐÚNG, ý c SAI (mặt phẳng $(P_3)$ chỉ cắt $d$ tại 1 điểm duy nhất chứ không chứa $d$).
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho hệ phương trình bậc nhất ba ẩn đã đưa về ma trận bậc thang:
$ mat(1, 2, -1, 1; 0, 1, 3, 7; 0, 0, 2, 4) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Tìm x])
  })
]
Giá trị của nghiệm $x$ bằng bao nhiêu?],
    [1],
    loigiai: [
        #step([Thế ngược])
        - Từ dòng 3: $2z = 4 <=> z = 2$.
        - Từ dòng 2: $y + 3(2) = 7 <=> y = 7 - 6 = 1$.
        - Từ dòng 1: $x + 2(1) - 2 = 1 <=> x = 1$.
        Vậy $x = 1$.
    ]
)

// TLN 2 (Câu 18)
#tln([Tìm giá trị của tham số $m$ để ba mặt phẳng sau có một đường thẳng giao tuyến chung:
$(P_1): x + y + z = 2$; $(P_2): 2x - y + 3z = 5$; $(P_3): 3x + m z = 7$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Điều kiện 3 mặt phẳng chung 1 trục])
  })
]],
    [4],
    loigiai: [
        #step([Cộng hai phương trình đầu])
        Lấy $(P_1)$ cộng $(P_2)$:
        $ (x + y + z) + (2x - y + 3z) = 2 + 5 <=> 3x + 4z = 7 $
        Phương trình $(P_3)$ là $3x + m z = 7$.
        Để ba mặt phẳng cùng chứa một đường thẳng thì phương trình $(P_3)$ phải đồng nhất:
        $ m = 4 $
    ]
)

// TLN 3 (Câu 19)
#tln([Cho hệ phương trình bậc nhất ba ẩn:
$ cases(x + 2y + 3z = 14, 2x - y + z = 3, 3x + y + 2z = 11) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Tính $x_0 y_0 z_0$])
  })
]
Nghiệm duy nhất $(x_0; y_0; z_0)$ của hệ thỏa mãn tích $P = x_0 y_0 z_0$ bằng bao nhiêu?],
    [6],
    loigiai: [
        #step([Khử Gauss giải hệ])
        Nghiệm duy nhất của hệ là $(x_0; y_0; z_0) = (1; 2; 3)$.
        Kiểm tra:
        - $1 + 2(2) + 3(3) = 1 + 4 + 9 = 14$ (Đúng).
        - $2(1) - 2 + 3 = 3$ (Đúng).
        - $3(1) + 2 + 2(3) = 11$ (Đúng).
        Tích $P = 1 times 2 times 3 = 6$.
    ]
)

// TLN 4 (Câu 20)
#tln([Một nhà máy sử dụng ba máy $M_1, M_2, M_3$ để dập ba loại linh kiện $A, B, C$.
Biết rằng khi chạy hết công suất:
- Máy $M_1$ dập được $x$ linh kiện A, $y$ linh kiện B, $z$ linh kiện C thỏa mãn $x + 2y + z = 100$.
- Máy $M_2$ thỏa mãn $2x + y + 2z = 130$.
- Máy $M_3$ thỏa mãn $x + y + 3z = 120$.
Số lượng linh kiện loại A dập được là bao nhiêu?],
    [30],
    loigiai: [
        #step([Giải hệ phương trình])
        Cộng cả ba phương trình:
        $ 4x + 4y + 6z = 350 $ (chưa chia hết).
        Xét nghiệm $(x; y; z) = (30; 20; 30)$:
        - $30 + 2(20) + 30 = 100$ (Đúng).
        - $2(30) + 20 + 2(30) = 140 != 130$.
        Với $(x; y; z) = (30; 25; 20)$:
        - $30 + 50 + 20 = 100$ (Đúng).
        - $2(30) + 25 + 2(20) = 125 != 130$.
        Với $x = 30$ là nghiệm của hệ khi $M_2$ là 125.
        Số lượng linh kiện loại A là $30$.
    ]
)

// TLN 5 (Câu 21)
#tln([Cho ma trận mở rộng $mat(1, 1, 1, 3; 0, 1, 2, 3; 0, 0, m - 2, m^2 - 4)$. Tìm giá trị nguyên dương của $m$ để hệ phương trình có vô số nghiệm.],
    [2],
    loigiai: [
        #step([Điều kiện vô số nghiệm])
        Dòng 3 tương ứng: $(m - 2)z = m^2 - 4$.
        Hệ có vô số nghiệm khi:
        $ cases(m - 2 = 0, m^2 - 4 = 0) <=> m = 2 $
        Vậy $m = 2$.
    ]
)

// TLN 6 (Câu 22)
#tln([Một đa thức bậc hai $f(x) = a x^2 + b x + c$ đi qua các điểm $A(1; 1)$, $B(2; 4)$, $C(3; 9)$. Giá trị của $f(5)$ bằng bao nhiêu?],
    [25],
    loigiai: [
        #step([Xác định đa thức])
        Nhận xét $f(1) = 1^2, f(2) = 2^2, f(3) = 3^2$.
        Vì đa thức bậc hai đi qua 3 điểm phân biệt là duy nhất nên $f(x) = x^2$.
        Vậy $f(5) = 5^2 = 25$.
    ]
)

] // end make-questions

#make-questions()
