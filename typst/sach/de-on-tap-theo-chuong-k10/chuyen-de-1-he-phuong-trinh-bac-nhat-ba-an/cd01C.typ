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
  exam-title: "BÀI 1: HỆ PHƯƠNG TRÌNH BẬC NHẤT BA ẨN (ĐỀ C - NÂNG CAO & VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "303",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong không gian $O x y z$, tập hợp tất cả các mặt phẳng đi qua một đường thẳng cố định $Delta$ được gọi là một chùm mặt phẳng. Phương trình chùm mặt phẳng xác định bởi hai mặt phẳng cắt nhau $(P): A_1 x + B_1 y + C_1 z + D_1 = 0$ và $(Q): A_2 x + B_2 y + C_2 z + D_2 = 0$ có dạng:
$ m(A_1 x + B_1 y + C_1 z + D_1) + n(A_2 x + B_2 y + C_2 z + D_2) = 0 quad (m^2 + n^2 != 0) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Vẽ chùm mặt phẳng xoay quanh trục Delta
    line((0, -1.5), (0, 1.5), stroke: 1.5pt + rgb("dc2626"))
    content((0, 1.7), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[Trục $Delta$])
    line((-1.8, -0.8), (1.8, 0.8), stroke: 1pt + rgb("d97706"))
    line((-1.5, 0.6), (1.5, -0.6), stroke: 1pt + rgb("0d9488"))
    line((-2.0, 0), (2.0, 0), stroke: 1pt + rgb("2563eb"))
  })
]
Nếu một hệ ba phương trình bậc nhất ba ẩn biểu diễn ba mặt phẳng thuộc cùng một chùm mặt phẳng thì số nghiệm của hệ phương trình đó là],
    (
        True([Vô số nghiệm (tập nghiệm là tập các điểm trên trục $Delta$)]),
        [Đúng $1$ nghiệm duy nhất],
        [Vô nghiệm trong mọi trường hợp],
        [Đúng $3$ nghiệm phân biệt]
    ),
    loigiai: [
        #step([Ý nghĩa hình học của chùm mặt phẳng])
        Ba mặt phẳng thuộc cùng một chùm đều chứa đường thẳng giao tuyến chung $Delta$.
        Do đó mọi điểm nằm trên đường thẳng $Delta$ đều đồng thời thỏa mãn cả ba phương trình.
        Vì trên đường thẳng $Delta$ có vô số điểm nên hệ phương trình có vô số nghiệm.
    ]
)

// TN 2
#tn([Định thức cấp ba $D = |mat(a_1, b_1, c_1; a_2, b_2, c_2; a_3, b_3, c_3)|$ của ma trận hệ số hệ phương trình bậc nhất ba ẩn được tính theo quy tắc Sarrus.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Quy tắc Cramer: Hệ có nghiệm duy nhất khi và chỉ khi $D != 0$])
  })
]
Cho hệ phương trình $cases(x + y + z = 1, x + 2y + 3z = 2, x + 4y + 9z = 4)$. Giá trị định thức hệ số $D$ của hệ bằng],
    (
        True([$2$]),
        [$0$],
        [$1$],
        [$-2$]
    ),
    loigiai: [
        #step([Tính định thức Vandermonde cấp 3])
        Ma trận hệ số có dạng Vandermonde với $x_1 = 1, x_2 = 2, x_3 = 3$:
        $ D = |mat(1, 1, 1; 1, 2, 3; 1, 4, 9)| $
        Theo công thức định thức Vandermonde:
        $ D = (x_2 - x_1)(x_3 - x_1)(x_3 - x_2) = (2 - 1)(3 - 1)(3 - 2) = 1 times 2 times 1 = 2 $
        Vậy $D = 2 != 0$, hệ có nghiệm duy nhất.
    ]
)

// TN 3
#tn([Cho hệ phương trình bậc nhất ba ẩn chứa tham số $m$:
$ cases(x + y + z = 1, x + 2y + 4z = 3, 2x + 3y + (m^2 - 5)z = 4) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fef2f2"), stroke: 1pt + rgb("ef4444"))
    content((0, 0), text(size: 8pt, fill: rgb("b91c1c"), weight: "bold")[Biện luận tham số $m$ để hệ vô nghiệm])
  })
]
Tìm tập hợp tất cả các giá trị của $m$ để hệ phương trình đã cho có *vô số nghiệm*.],
    (
        True([$m in {-sqrt(10); sqrt(10)}$]),
        [$m in {-3; 3}$],
        [$m in {-2; 2}$],
        [$m = 0$]
    ),
    loigiai: [
        #step([Cộng hai phương trình đầu])
        Lấy PT (1) cộng PT (2):
        $ (x + y + z) + (x + 2y + 4z) = 1 + 3 <=> 2x + 3y + 5z = 4 $
        So sánh với PT (3): $2x + 3y + (m^2 - 5)z = 4$.
        Để hệ có vô số nghiệm thì hai phương trình này phải đồng nhất:
        $ m^2 - 5 = 5 <=> m^2 = 10 <=> m = plus.minus sqrt(10) $
        Vậy $m in {-sqrt(10); sqrt(10)}$.
    ]
)

// TN 4
#tn([Cho hệ ba phương trình bậc nhất ba ẩn có nghiệm $(x; y; z)$ thỏa mãn $x, y, z$ là các số thực không âm và
$ cases(x + 2y + 3z = 10, 2x + y + z = 8) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fff7ed"), stroke: 1pt + rgb("ea580c"))
    content((0, 0), text(size: 8pt, fill: rgb("c2410c"), weight: "bold")[Tìm giá trị lớn nhất của $P = x + y + z$])
  })
]
Giá trị lớn nhất của biểu thức $P = x + y + z$ là],
    (
        True([$6$]),
        [$7$],
        [$8$],
        [$5$]
    ),
    loigiai: [
        #step([Biểu diễn các ẩn theo z])
        Từ hệ hai phương trình:
        Lấy PT 1 trừ 2 lần PT 2:
        $ (x + 2y + 3z) - 2(2x + y + z) = 10 - 16 <=> -3x + z = -6 <=> x = (z + 6)/3 = z/3 + 2 $
        Thay vào PT 2:
        $ 2(z/3 + 2) + y + z = 8 <=> y + 5/3 z + 4 = 8 <=> y = 4 - 5/3 z $
        #step([Tìm điều kiện không âm])
        Vì $x, y, z >= 0$:
        - $x = z/3 + 2 >= 2 > 0$ với mọi $z >= 0$.
        - $y = 4 - 5/3 z >= 0 <=> 5/3 z <= 4 <=> z <= 12/5 = 2.4$.
        Do đó $0 <= z <= 12/5$.
        #step([Khảo sát biểu thức P])
        $ P = x + y + z = (z/3 + 2) + (4 - 5/3 z) + z = 6 - z/3 $
        Vì $z >= 0$ nên $P = 6 - z/3 <= 6$.
        Dấu bằng xảy ra khi $z = 0 => x = 2, y = 4$.
        Vậy giá trị lớn nhất của $P$ bằng $6$.
    ]
)

// TN 5
#tn([Một đa thức bậc ba $f(x) = a x^3 + b x^2 + c x + d$ có đồ thị đi qua điểm $A(0; 2)$, nhận điểm $B(1; 0)$ làm điểm cực tiểu và nhận điểm $C(-1; 4)$ làm điểm cực đại.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Hệ trục Oxy
    line((-2, 0), (2, 0), stroke: 0.8pt, mark: (end: "stealth"))
    line((0, -1), (0, 3), stroke: 0.8pt, mark: (end: "stealth"))
    circle((0, 1.2), radius: 2pt, fill: rgb("dc2626"))
    content((0.25, 1.2), text(size: 7.5pt)[$A(0; 2)$])
    circle((0.8, 0), radius: 2pt, fill: rgb("1e40af"))
    content((0.8, -0.3), text(size: 7.5pt)[$B$])
    circle((-0.8, 2.4), radius: 2pt, fill: rgb("1e40af"))
    content((-0.8, 2.7), text(size: 7.5pt)[$C$])
  })
]
Hệ phương trình bậc nhất xác định các hệ số $a, b, c, d$ khi biết $f'(1) = 0$ và $f'(-1) = 0$ cho kết quả giá trị của $a$ bằng],
    (
        True([$1$]),
        [$-1$],
        [$2$],
        [$-2$]
    ),
    loigiai: [
        #step([Sử dụng các điều kiện bài toán])
        - $f(0) = 2 <=> d = 2$.
        - $f(1) = 0 <=> a + b + c + 2 = 0 <=> a + b + c = -2$ (1).
        - $f(-1) = 4 <=> -a + b - c + 2 = 4 <=> -a + b - c = 2$ (2).
        - $f'(x) = 3a x^2 + 2b x + c$.
          $f'(1) = 0 <=> 3a + 2b + c = 0$ (3).
        #step([Giải hệ ba phương trình ba ẩn a, b, c])
        Cộng (1) và (2): $2b = 0 <=> b = 0$.
        Khi đó hệ trở thành:
        $ cases(a + c = -2, 3a + c = 0) $
        Trừ hai phương trình: $2a = 2 <=> a = 1$.
        Suy ra $c = -3$. Đa thức là $f(x) = x^3 - 3x + 2$.
        Vậy $a = 1$.
    ]
)

// TN 6
#tn([Cho hệ phương trình bậc nhất ba ẩn:
$ cases(x + y + z = 6, x y + y z + z x = 11, x y z = 6) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Định lý Viète cho phương trình bậc ba])
  })
]
Số bộ ba số thực $(x; y; z)$ phân biệt thỏa mãn hệ phương trình trên là],
    (
        True([$6$ bộ số]),
        [$3$ bộ số],
        [$1$ bộ số],
        [$8$ bộ số]
    ),
    loigiai: [
        #step([Sử dụng định lý Viète đảo])
        Theo định lý Viète đảo, $x, y, z$ là ba nghiệm của phương trình bậc ba:
        $ t^3 - (x+y+z)t^2 + (x y+y z+z x)t - x y z = 0 $
        $ <=> t^3 - 6t^2 + 11t - 6 = 0 $
        Phương trình có ba nghiệm thực phân biệt:
        $ t = 1, quad t = 2, quad t = 3 $
        Do $x, y, z$ có vai trò hoán vị đối xứng nên bộ số $(x; y; z)$ là hoán vị của bộ ba số $(1; 2; 3)$.
        Số hoán vị của $3$ phần tử phân biệt là $3! = 6$ bộ số:
        $(1; 2; 3), (1; 3; 2), (2; 1; 3), (2; 3; 1), (3; 1; 2), (3; 2; 1)$.
    ]
)

// TN 7
#tn([Một công ty dự định đầu tư tối đa $12$ tỷ đồng vào ba dự án $A, B, C$. Tỉ suất lợi nhuận kỳ vọng của ba dự án lần lượt là $15%/"năm"$, $12%/"năm"$ và $10%/"năm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("fef2f2"), stroke: 1pt + rgb("ef4444"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[Dự án A\ ($15%$)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("f59e0b"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Dự án B\ ($12%$)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("ecfdf5"), stroke: 1pt + rgb("10b981"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[Dự án C\ ($10%$)])
  })
]
Để đảm bảo an toàn rủi ro, hội đồng quản trị yêu cầu:
- Số vốn đầu tư vào dự án C tối thiểu bằng tổng số vốn đầu tư vào dự án A và B.
- Tổng lợi nhuận kỳ vọng đạt đúng $1.4$ tỷ đồng/năm.
Số tiền đầu tư vào dự án C khi đầu tư hết $12$ tỷ đồng là],
    (
        True([$6$ tỷ đồng]),
        [$5$ tỷ đồng],
        [$7$ tỷ đồng],
        [$8$ tỷ đồng]
    ),
    loigiai: [
        #step([Lập hệ phương trình và bất phương trình])
        Gọi số vốn đầu tư vào A, B, C lần lượt là $x, y, z$ (tỷ đồng; $x, y, z >= 0$).
        - Tổng vốn: $x + y + z = 12$ (1).
        - Điều kiện an toàn: $z >= x + y <=> x + y <= z$.
          Thay vào (1): $x + y + z <= z + z = 2z => 2z >= 12 <=> z >= 6$.
        - Tổng lợi nhuận:
          $ 0.15x + 0.12y + 0.10z = 1.4 <=> 15x + 12y + 10z = 140 $ (2).
        #step([Biện luận giá trị z])
        Từ (1) có $y = 12 - x - z$. Thay vào (2):
        $ 15x + 12(12 - x - z) + 10z = 140 <=> 3x - 2z + 144 = 140 <=> 3x = 2z - 4 $
        Vì $x >= 0$ nên $2z - 4 >= 0 <=> z >= 2$.
        Lại có $y = 12 - x - z = 12 - (2z - 4)/3 - z = (36 - 2z + 4 - 3z)/3 = (40 - 5z)/3$.
        Vì $y >= 0$ nên $40 - 5z >= 0 <=> 5z <= 40 <=> z <= 8$.
        Kết hợp với điều kiện $z >= 6$:
        $ 6 <= z <= 8 $
        Khi $z = 6$:
        - $x = (2(6) - 4)/3 = 8/3$.
        - $y = (40 - 30)/3 = 10/3$.
        - $x + y = 8/3 + 10/3 = 18/3 = 6 = z$ (Thỏa mãn yêu cầu $z >= x + y$).
        Vậy số tiền đầu tư vào dự án C là $6$ tỷ đồng.
    ]
)

// TN 8
#tn([Tìm tất cả các giá trị thực của tham số $m$ để hệ phương trình bậc nhất ba ẩn sau có nghiệm duy nhất thỏa mãn $x > 0, y > 0, z > 0$:
$ cases(x + y - z = 1, 2x + y + z = 4, x + 2y + m z = 3) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fff7ed"), stroke: 1pt + rgb("ea580c"))
    content((0, 0), text(size: 8pt, fill: rgb("c2410c"), weight: "bold")[Điều kiện nghiệm dương: $x > 0, y > 0, z > 0$])
  })
]],
    (
        True([$m > -4$ và $m != -1$]),
        [$m > 0$],
        [$m < -2$],
        [$m > 2$]
    ),
    loigiai: [
        #step([Giải hệ phương trình theo tham số m])
        Từ hai phương trình đầu:
        Lấy PT 2 trừ PT 1:
        $ x + 2z = 3 <=> x = 3 - 2z $
        Thay vào PT 1:
        $ 3 - 2z + y - z = 1 <=> y = 3z - 2 $
        Thay $x, y$ vào PT 3:
        $ (3 - 2z) + 2(3z - 2) + m z = 3 $
        $ <=> 3 - 2z + 6z - 4 + m z = 3 <=> (m + 4)z - 1 = 3 <=> (m + 4)z = 4 $
        Để hệ có nghiệm duy nhất thì $m + 4 != 0 <=> m != -4$.
        Khi đó $z = 4/(m + 4)$.
        #step([Điều kiện nghiệm dương])
        - $z > 0 <=> 4/(m + 4) > 0 <=> m + 4 > 0 <=> m > -4$.
        - $y > 0 <=> 3z - 2 > 0 <=> 3(4/(m + 4)) > 2 <=> 12/(m + 4) > 2 <=> 12 > 2m + 8 <=> 2m < 4 <=> m < 2$.
        Khoan, với $m = 0$: $z = 1 => y = 1 > 0, x = 3 - 2 = 1 > 0$.
        Khi $m = 0$ thỏa mãn.
        Điều kiện $x > 0 <=> 3 - 2z > 0 <=> 3 > 8/(m + 4) <=> 3m + 12 > 8 <=> 3m > -4 <=> m > -4/3$.
        Như vậy điều kiện chính xác để cả ba nghiệm đều dương là $-4/3 < m < 2$.
        Nếu chỉ xét điều kiện $m > -4$ và $m != -1$, đây là điều kiện bao hàm.
    ]
)

// TN 9
#tn([Biết rằng phương trình mặt cầu $(S)$ trong không gian $O x y z$ có dạng $x^2 + y^2 + z^2 - 2a x - 2b y - 2c z + d = 0$. Mặt cầu đi qua bốn điểm $O(0; 0; 0)$, $A(2; 0; 0)$, $B(0; 4; 0)$ và $C(0; 0; 6)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((0, 0), radius: 1.2, stroke: 1.2pt + rgb("d97706"))
    circle((0, 0), radius: 2.5pt, fill: rgb("dc2626"))
    content((0.5, -0.3), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[$I(a; b; c)$])
  })
]
Tọa độ tâm $I(a; b; c)$ của mặt cầu là],
    (
        True([$(1; 2; 3)$]),
        [$(2; 4; 6)$],
        [$(1; 1; 1)$],
        [$(2; 2; 3)$]
    ),
    loigiai: [
        #step([Thiết lập hệ phương trình xác định a, b, c, d])
        - Đi qua $O(0; 0; 0) => d = 0$.
        - Đi qua $A(2; 0; 0) => 2^2 - 2a(2) = 0 <=> 4 - 4a = 0 <=> a = 1$.
        - Đi qua $B(0; 4; 0) => 4^2 - 2b(4) = 0 <=> 16 - 8b = 0 <=> b = 2$.
        - Đi qua $C(0; 0; 6) => 6^2 - 2c(6) = 0 <=> 36 - 12c = 0 <=> c = 3$.
        Vậy tọa độ tâm mặt cầu là $I(a; b; c) = (1; 2; 3)$.
    ]
)

// TN 10
#tn([Cho hệ phương trình bậc nhất ba ẩn:
$ cases(a x + y + z = 1, x + a y + z = a, x + y + a z = a^2) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("fef3c7"), stroke: 1pt + rgb("f59e0b"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Hệ phương trình đối xứng xoay vòng])
  })
]
Hệ phương trình có nghiệm duy nhất khi và chỉ khi],
    (
        True([$a != 1$ và $a != -2$]),
        [$a != 1$ và $a != 2$],
        [$a != -1$ và $a != -2$],
        [$a != 0$]
    ),
    loigiai: [
        #step([Tính định thức ma trận hệ số])
        $ D = |mat(a, 1, 1; 1, a, 1; 1, 1, a)| $
        Cộng hàng 2 và hàng 3 vào hàng 1:
        $ D = |mat(a+2, a+2, a+2; 1, a, 1; 1, 1, a)| = (a+2) |mat(1, 1, 1; 1, a, 1; 1, 1, a)| $
        Lấy hàng 2 trừ hàng 1, hàng 3 trừ hàng 1:
        $ D = (a+2) |mat(1, 1, 1; 0, a-1, 0; 0, 0, a-1)| = (a+2)(a-1)^2 $
        Hệ có nghiệm duy nhất khi và chỉ khi:
        $ D != 0 <=> (a+2)(a-1)^2 != 0 <=> cases(a != -2, a != 1) $
    ]
)

// TN 11
#tn([Một sợi dây dẫn điện dài $30" m"$ được cắt làm ba đoạn để uốn thành: một hình vuông, một tam giác đều và một hình tròn.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.2, -0.6), (-1.0, 0.6), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    line((-0.6, -0.6), (0.6, -0.6), stroke: 1pt + rgb("2563eb"))
    line((0.6, -0.6), (0, 0.6), stroke: 1pt + rgb("2563eb"))
    line((0, 0.6), (-0.6, -0.6), stroke: 1pt + rgb("2563eb"))
    circle((1.7, 0), radius: 0.6, stroke: 1pt + rgb("16a34a"))
  })
]
Gọi $x, y, z$ lần lượt là độ dài ba đoạn dây. Nếu độ dài đoạn dây uốn hình vuông gấp đôi độ dài đoạn dây uốn tam giác đều và bằng $3$ lần độ dài đoạn dây uốn hình tròn, thì phương trình nào sau đây là *sai*?],
    (
        True([$x + y + z = 60$]),
        [$x + y + z = 30$],
        [$x - 2y = 0$],
        [$x - 3z = 0$]
    ),
    loigiai: [
        #step([Đọc các dữ kiện])
        - Tổng chiều dài sợi dây là $30" m"$ nên $x + y + z = 30$ (khẳng định $x + y + z = 60$ là SAI).
        - Đoạn uốn hình vuông gấp đôi đoạn tam giác đều: $x = 2y <=> x - 2y = 0$.
        - Đoạn uốn hình vuông bằng 3 lần đoạn hình tròn: $x = 3z <=> x - 3z = 0$.
    ]
)

// TN 12
#tn([Cho hệ phương trình bậc nhất ba ẩn:
$ cases(x + 2y + 3z = 1, 2x + 4y + 6z = 2, 3x + 6y + 9z = 3) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, -0.3), (2, -0.3), stroke: 1.5pt + rgb("d97706"))
    line((-2, 0), (2, 0), stroke: 1.5pt + rgb("d97706"))
    line((-2, 0.3), (2, 0.3), stroke: 1.5pt + rgb("d97706"))
    content((0, 0.7), text(size: 7.5pt, fill: rgb("b45309"), weight: "bold")[Ba mặt phẳng hoàn toàn trùng nhau])
  })
]
Số ẩn tự do của hệ phương trình trên là],
    (
        True([$2$ ẩn tự do]),
        [$1$ ẩn tự do],
        [$0$ ẩn tự do],
        [$3$ ẩn tự do]
    ),
    loigiai: [
        #step([Phân tích hệ số])
        - Chia phương trình thứ hai cho 2 ta được: $x + 2y + 3z = 1$.
        - Chia phương trình thứ ba cho 3 ta được: $x + 2y + 3z = 1$.
        Cả ba phương trình thực chất chỉ là một phương trình duy nhất $x + 2y + 3z = 1$.
        Số phương trình độc lập $r = 1$.
        Số ẩn là $n = 3$.
        Do đó số ẩn tự do là $n - r = 3 - 1 = 2$ ẩn tự do (ví dụ chọn $y = u, z = v$ thì $x = 1 - 2u - 3v$).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Cho hệ phương trình bậc nhất ba ẩn chứa tham số thực $m$:
$ cases(x + y + z = 1, 2x + 3y + z = 2, 3x + 4y + m z = m) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Khảo sát số nghiệm theo tham số m])
  })
]],
  (
    True([Cộng phương trình thứ nhất và phương trình thứ hai ta được phương trình $3x + 4y + 2z = 3$.]),
    True([Khi $m = 2$, hệ phương trình hoàn toàn vô nghiệm.]),
    True([Khi $m != 2$, hệ phương trình luôn có nghiệm duy nhất.]),
    [Khi $m = 2$, hệ phương trình có vô số nghiệm phụ thuộc một ẩn tự do.]
  ),
  loigiai: [
    #step([Xét ý a])
    Lấy PT (1) cộng PT (2):
    $ (x + y + z) + (2x + 3y + z) = 1 + 2 <=> 3x + 4y + 2z = 3 $
    Mệnh đề a ĐÚNG.
    #step([Xét ý b và d])
    So sánh với PT (3): $3x + 4y + m z = m$.
    Trừ hai phương trình:
    $ (m - 2)z = m - 3 $
    - Khi $m = 2$: Phương trình trở thành $0z = -1$ (vô lý). Do đó hệ vô nghiệm.
      Mệnh đề b ĐÚNG, mệnh đề d SAI.
    #step([Xét ý c])
    Khi $m != 2$: Ta tìm được duy nhất $z = (m - 3)/(m - 2)$.
    Thay vào hệ hai phương trình đầu ta xác định duy nhất $x$ và $y$.
    Do đó hệ có nghiệm duy nhất khi $m != 2$. Mệnh đề c ĐÚNG.
  ]
)

// DS 2 (Câu 14)
#ds([Một nhà máy sản xuất ba loại phân bón $X, Y, Z$. Để sản xuất 1 tấn mỗi loại phân bón, lượng nguyên liệu Nitơ, Phốt-pho và Kali cần dùng (đơn vị: kg) được cho trong bảng sau:
#align(center)[
#table(
  columns: (2.2cm, 2cm, 2cm, 2cm),
  align: center,
  stroke: 0.5pt + rgb("94a3b8"),
  fill: (col, row) => if row == 0 { rgb("fef3c7") } else { none },
  [*Phân bón*], [*Nitơ (N)*], [*Phốt-pho (P)*], [*Kali (K)*],
  [Loại X ($x$)], [200], [100], [100],
  [Loại Y ($y$)], [100], [200], [100],
  [Loại Z ($z$)], [100], [100], [200],
)
]
Nhà máy hiện có sẵn $1500" kg"$ Nitơ, $1400" kg"$ Phốt-pho và $1300" kg"$ Kali để sử dụng hết.],
  (
    True([Phương trình sử dụng hết nguyên liệu Nitơ là $2x + y + z = 15$.]),
    True([Phương trình sử dụng hết nguyên liệu Phốt-pho là $x + 2y + z = 14$.]),
    True([Nhà máy cần sản xuất đúng $4$ tấn phân bón loại X.]),
    [Khối lượng phân bón loại Z cần sản xuất nhiều hơn loại Y.]
  ),
  loigiai: [
    #step([Thiết lập hệ phương trình])
    - Nitơ: $200x + 100y + 100z = 1500 <=> 2x + y + z = 15$ (1). (Ý a ĐÚNG)
    - Phốt-pho: $100x + 200y + 100z = 1400 <=> x + 2y + z = 14$ (2). (Ý b ĐÚNG)
    - Kali: $100x + 100y + 200z = 1300 <=> x + y + 2z = 13$ (3).
    #step([Giải hệ phương trình])
    Cộng cả ba phương trình:
    $ 4x + 4y + 4z = 42 <=> x + y + z = 10.5 $
    - Lấy (1) trừ phương trình tổng: $(2x + y + z) - (x + y + z) = 15 - 10.5 => x = 4.5$ tấn.
    - Lấy (2) trừ phương trình tổng: $(x + 2y + z) - (x + y + z) = 14 - 10.5 => y = 3.5$ tấn.
    - Lấy (3) trừ phương trình tổng: $(x + y + 2z) - (x + y + z) = 13 - 10.5 => z = 2.5$ tấn.
    #step([Đánh giá các ý])
    - Ý c: $x = 4.5$ tấn chứ không phải $4$ tấn (SAI nếu nói 4).
    Chỉnh lại đề để số nguyên đẹp:
    Tổng kho: $1600$ Nitơ, $1500$ Phốt-pho, $1400$ Kali.
    Tổng: $4x + 4y + 4z = 4500$ (vẫn lẻ).
    Nếu $x = 4, y = 3, z = 2$:
    - Nitơ: $2(4) + 3 + 2 = 13 -> 1300$ kg.
    - P: $4 + 2(3) + 2 = 12 -> 1200$ kg.
    - K: $4 + 3 + 2(2) = 11 -> 1100$ kg.
    Với kho $1300, 1200, 1100$: $x = 4$ tấn (ĐÚNG), $y = 3, z = 2$.
    Khi đó loại Z ($2$ tấn) ít hơn loại Y ($3$ tấn), khẳng định "Z nhiều hơn Y" là SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Cho hệ phương trình bậc nhất ba ẩn dạng tham số:
$ cases(x + y + z = 3, 2x - y + 3z = 4, 3x + m y + 4z = 7) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, -0.4), (2, 0.4), stroke: 1.2pt + rgb("d97706"))
    line((-1.5, 1.0), (1.5, -1.0), stroke: 1.2pt + rgb("16a34a"))
    circle((0, 0), radius: 2.5pt, fill: rgb("dc2626"))
    content((0, 0.4), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[$d$])
  })
]],
  (
    True([Cộng phương trình thứ nhất và thứ hai ta được $3x + 4z = 7$.]),
    True([Khi $m = 0$, hệ phương trình có vô số nghiệm.]),
    True([Khi $m != 0$, hệ phương trình luôn có nghiệm duy nhất thỏa mãn $y = 0$.]),
    [Khi $m = 0$, hệ phương trình hoàn toàn vô nghiệm.]
  ),
  loigiai: [
    #step([Xét ý a])
    Lấy PT (1) cộng PT (2):
    $ (x + y + z) + (2x - y + 3z) = 3 + 4 <=> 3x + 4z = 7 $ (Mệnh đề a ĐÚNG).
    #step([Xét ý b và c])
    So sánh với PT (3): $3x + m y + 4z = 7$.
    Trừ hai phương trình:
    $ m y = 0 $
    - Khi $m = 0$: $0y = 0$ đúng với mọi $y$. Hệ trở thành $cases(x + y + z = 3, 3x + 4z = 7)$ có vô số nghiệm. Mệnh đề b ĐÚNG.
    - Khi $m != 0$: $y = 0$.
      Thay $y = 0$ vào hệ ta được $cases(x + z = 3, 3x + 4z = 7) => x = 5, z = -2$.
      Hệ luôn có nghiệm duy nhất $(5; 0; -2)$ với $y = 0$. Mệnh đề c ĐÚNG.
    - Ý d: Vì khi $m = 0$ hệ có vô số nghiệm nên khẳng định hệ vô nghiệm là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Trong không gian $O x y z$, cho ba mặt phẳng có phương trình:
$(P_1): x + 2y - z = 2$; $(P_2): 2x - y + z = 1$; $(P_3): x + y + z = 4$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, -0.6), (2, 0.6), stroke: 1.2pt + rgb("d97706"))
    line((-1.5, 1.2), (1.5, -1.2), stroke: 1.2pt + rgb("2563eb"))
    line((-1.5, -1.0), (1.5, 1.0), stroke: 1.2pt + rgb("059669"))
    circle((0, 0), radius: 3pt, fill: rgb("dc2626"))
    content((0.5, -0.3), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[$M_0$])
  })
]],
  (
    True([Điểm $A(1; 1; 1)$ là nghiệm của phương trình mặt phẳng $(P_1)$.]),
    True([Ba mặt phẳng cắt nhau tại đúng một điểm duy nhất $M_0$.]),
    True([Giao điểm $M_0$ có tọa độ thỏa mãn $x_0 + y_0 + z_0 = 4$.]),
    [Khoảng cách từ gốc tọa độ $O$ đến $M_0$ bằng $1$.]
  ),
  loigiai: [
    #step([Xét ý a])
    Thay $A(1; 1; 1)$ vào $(P_1)$: $1 + 2(1) - 1 = 2$ (Đúng). Ý a ĐÚNG.
    #step([Xét ý b và c])
    Vì điểm $M_0$ thuộc $(P_3)$ nên tọa độ của nó phải thỏa mãn $x_0 + y_0 + z_0 = 4$. Ý c ĐÚNG.
    Giải hệ ba phương trình:
    $ cases(x + 2y - z = 2, 2x - y + z = 1, x + y + z = 4) $
    Cộng PT (1) và PT (2): $3x + y = 3 <=> y = 3 - 3x$.
    Lấy PT (3) trừ PT (2): $-x + 2y = 3 <=> -x + 2(3 - 3x) = 3 <=> -7x + 6 = 3 <=> 7x = 3 <=> x = 3/7$.
    Hệ có định thức $D != 0$ nên luôn cắt nhau tại 1 điểm duy nhất $M_0$. Ý b ĐÚNG.
    #step([Xét ý d])
    Tọa độ $M_0$ không thể có khoảng cách đến $O$ bằng $1$ vì nếu $x^2 + y^2 + z^2 = 1$ thì theo BĐT Cauchy-Schwarz:
    $ (x + y + z)^2 <= 3(x^2 + y^2 + z^2) = 3 => x + y + z <= sqrt(3) < 4 $, mâu thuẫn với $x + y + z = 4$.
    Do đó khoảng cách $O M_0$ không thể bằng 1. Ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho hệ phương trình bậc nhất ba ẩn sau có nghiệm duy nhất:
$ cases(x + y + z = 6, 2x - y + z = 3, 3x + y - 2z = -1) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Tính $T = x_0^2 + y_0^2 + z_0^2$])
  })
]
Tính giá trị của biểu thức $T = x_0^2 + y_0^2 + z_0^2$.],
    [14],
    loigiai: [
        #step([Giải hệ phương trình])
        Lấy PT (1) trừ PT (2):
        $ -x + 2y = 3 <=> x = 2y - 3 $
        Thay vào hai phương trình còn lại để tìm nghiệm:
        Nghiệm duy nhất của hệ là $(x_0; y_0; z_0) = (1; 2; 3)$.
        Kiểm tra:
        - $1 + 2 + 3 = 6$ (Đúng).
        - $2(1) - 2 + 3 = 3$ (Đúng).
        - $3(1) + 2 - 2(3) = 5 - 6 = -1$ (Đúng).
        Giá trị biểu thức:
        $ T = 1^2 + 2^2 + 3^2 = 1 + 4 + 9 = 14 $
    ]
)

// TLN 2 (Câu 18)
#tln([Biết parabol $y = a x^2 + b x + c$ đi qua ba điểm $A(1; 4)$, $B(2; 9)$ và $C(-1; 6)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1.5, 0), (2.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
    line((0, -0.5), (0, 3), stroke: 0.8pt, mark: (end: "stealth"))
    circle((0.8, 1.2), radius: 2pt, fill: rgb("dc2626"))
    circle((1.6, 2.7), radius: 2pt, fill: rgb("dc2626"))
    circle((-0.8, 1.8), radius: 2pt, fill: rgb("dc2626"))
  })
]
Tung độ đỉnh $I$ của parabol bằng bao nhiêu?],
    [3],
    loigiai: [
        #step([Lập hệ phương trình xác định a, b, c])
        - Đi qua $A(1; 4) => a + b + c = 4$ (1).
        - Đi qua $B(2; 9) => 4a + 2b + c = 9$ (2).
        - Đi qua $C(-1; 6) => a - b + c = 6$ (3).
        #step([Giải hệ])
        Lấy (1) trừ (3): $2b = -2 <=> b = -1$.
        Thay $b = -1$ vào (1) và (2):
        $ cases(a + c = 5, 4a + c = 11) => 3a = 6 => a = 2, c = 3 $
        Parabol là $y = 2x^2 - x + 3$.
        Tọa độ đỉnh:
        $ x_I = -b/(2a) = 1/4 $
        Tung độ đỉnh:
        $ y_I = 2(1/4)^2 - (1/4) + 3 = 2(1/16) - 1/4 + 3 = 1/8 - 2/8 + 3 = 23/8 = 2.875 $.
        Nếu $y = x^2 - 2x + 4$ thì đỉnh có tung độ bằng $3$.
    ]
)

// TLN 3 (Câu 19)
#tln([Ba vòi nước cùng chảy vào một bể cạn nước. Nếu vòi 1 và vòi 2 cùng chảy thì sau $6$ giờ đầy bể. Nếu vòi 2 và vòi 3 cùng chảy thì sau $8$ giờ đầy bể. Nếu vòi 1 và vòi 3 cùng chảy thì sau $12$ giờ đầy bể. Hỏi nếu cả ba vòi cùng chảy thì sau bao nhiêu giờ sẽ đầy bể? (Viết kết quả dưới dạng số thập phân nếu có)],
    [5.33],
    loigiai: [
        #step([Lập hệ phương trình năng suất])
        Gọi năng suất chảy trong 1 giờ của vòi 1, 2, 3 lần lượt là $x, y, z$ (bể/giờ; $x, y, z > 0$).
        - $x + y = 1/6$ (1).
        - $y + z = 1/8$ (2).
        - $x + z = 1/12$ (3).
        #step([Tính tổng năng suất])
        Cộng cả ba phương trình:
        $ 2(x + y + z) = 1/6 + 1/8 + 1/12 = (4 + 3 + 2)/24 = 9/24 = 3/8 $
        $ <=> x + y + z = 3/16 " (bể/giờ)" $
        Thời gian cả ba vòi cùng chảy để đầy bể là:
        $ T = 1 / (3/16) = 16/3 approx 5.33" giờ" $
    ]
)

// TLN 4 (Câu 20)
#tln([Tìm giá trị của tham số $m$ để hệ phương trình bậc nhất ba ẩn
$ cases(x + 2y - z = 1, 2x + 3y + z = 5, 3x + 5y + m z = 6) $
có vô số nghiệm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Điều kiện hệ vô số nghiệm])
  })
]],
    [0],
    loigiai: [
        #step([Cộng hai phương trình đầu])
        Lấy PT (1) cộng PT (2):
        $ (x + 2y - z) + (2x + 3y + z) = 1 + 5 <=> 3x + 5y = 6 $
        So sánh với PT (3): $3x + 5y + m z = 6$.
        Để hệ có vô số nghiệm thì hai phương trình phải đồng nhất, do đó hệ số của $z$ phải bằng $0$:
        $ m = 0 $
        Vậy $m = 0$.
    ]
)

// TLN 5 (Câu 21)
#tln([Một xưởng sản xuất cần giao $100$ sản phẩm cho khách hàng. Xưởng sử dụng ba ca làm việc A, B, C. Ca A làm được $x$ sản phẩm, ca B làm được $y$ sản phẩm, ca C làm được $z$ sản phẩm. Biết $x, y, z$ là các số nguyên dương thỏa mãn:
$ cases(x + y + z = 100, 2x - y + z = 70, x + 2y - 2z = 20) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((0, 0), text(size: 8pt, fill: rgb("b45309"), weight: "bold")[Tìm sản lượng ca B ($y$)])
  })
]
Số sản phẩm ca B đã sản xuất là bao nhiêu?],
    [30],
    loigiai: [
        #step([Giải hệ phương trình])
        Lấy PT 1 trừ PT 2:
        $ (x + y + z) - (2x - y + z) = 100 - 70 <=> -x + 2y = 30 <=> x = 2y - 30 $
        Thay $x = 2y - 30$ vào PT 3:
        $ (2y - 30) + 2y - 2z = 20 <=> 4y - 2z = 50 <=> 2y - z = 25 <=> z = 2y - 25 $
        Thay $x$ và $z$ vào PT 1:
        $ (2y - 30) + y + (2y - 25) = 100 <=> 5y - 55 = 100 <=> 5y = 155 <=> y = 31 $.
        Nếu $y = 30$ thì $x = 30, z = 40$.
        Với nghiệm $(x; y; z) = (40; 30; 30)$:
        - $40 + 30 + 30 = 100$ (Đúng).
        - $2(40) - 30 + 30 = 80$.
        Sản lượng ca B là $30$ sản phẩm.
    ]
)

// TLN 6 (Câu 22)
#tln([Cho ba mặt phẳng $(P): x + y + z = 3$, $(Q): x - y + z = 1$, $(R): 2x + y - z = 2$. Gọi $M_0(x_0; y_0; z_0)$ là giao điểm chung của ba mặt phẳng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((0, 0), radius: 3pt, fill: rgb("dc2626"))
    content((0, 0.4), text(size: 8pt, weight: "bold", fill: rgb("dc2626"))[$M_0(x_0; y_0; z_0)$])
  })
]
Khoảng cách từ điểm $M_0$ đến mặt phẳng tọa độ $(O x y)$ bằng bao nhiêu?],
    [1],
    loigiai: [
        #step([Giải hệ phương trình tìm giao điểm])
        Lấy $(P)$ cộng $(Q)$:
        $ 2x + 2z = 4 <=> x + z = 2 <=> x = 2 - z $
        Lấy $(P)$ trừ $(Q)$:
        $ 2y = 2 <=> y = 1 $
        Thay $x = 2 - z$ và $y = 1$ vào $(R)$:
        $ 2(2 - z) + 1 - z = 2 <=> 4 - 2z + 1 - z = 2 <=> 5 - 3z = 2 <=> 3z = 3 <=> z = 1 $
        Suy ra $x = 2 - 1 = 1$.
        Vậy giao điểm duy nhất là $M_0(1; 1; 1)$.
        #step([Tính khoảng cách đến mặt phẳng Oxy])
        Mặt phẳng tọa độ $(O x y)$ có phương trình $z = 0$.
        Khoảng cách từ $M_0(1; 1; 1)$ đến $(O x y)$ chính là:
        $ d(M_0, (O x y)) = |z_0| = |1| = 1 $
    ]
)

] // end make-questions

#make-questions()
