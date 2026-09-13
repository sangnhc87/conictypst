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
  school: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG",
  exam-title: "BÀI 17: DẤU CỦA TAM THỨC BẬC HAI (ĐỀ SỐ 18A - CƠ BẢN ĐẾN VẬN DỤNG)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "143",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Biểu thức nào sau đây là một tam thức bậc hai đối với ẩn số $x$?],
    (
        True([$f(x) = 2x^2 - 3x + 1$]),
        [$g(x) = 3x - 5$],
        [$h(x) = x^3 - 2x + 1$],
        [$k(x) = 2 / x^2 - 3x + 4$]
    ),
    loigiai: [
        Tam thức bậc hai đối với $x$ là biểu thức có dạng $a x^2 + b x + c$ với $a != 0$.
        Biểu thức $f(x) = 2x^2 - 3x + 1$ có bậc hai với $a = 2 != 0$ nên là tam thức bậc hai.
    ]
)

// TN 2
#tn([Tam thức bậc hai $f(x) = x^2 - 4x + 3$ nhận giá trị ÂM ($f(x) < 0$) khi và chỉ khi $x$ thuộc khoảng nào sau đây?],
    (
        True([$(1; 3)$]),
        [$(-infinity; 1)$],
        [$(3; +infinity)$],
        [$(-infinity; 1) union (3; +infinity)$]
    ),
    loigiai: [
        Tam thức $f(x)$ có hai nghiệm là $x_1 = 1$ và $x_2 = 3$, hệ số $a = 1 > 0$.
        Theo quy tắc "trong trái, ngoài cùng", $f(x)$ trái dấu với $a$ (tức $f(x) < 0$) khi $x$ nằm trong khoảng hai nghiệm: $x in (1; 3)$.
    ]
)

// TN 3
#tn([Tập nghiệm của bất phương trình bậc hai $x^2 - 5x + 6 <= 0$ là],
    (
        True([$[2; 3]$]),
        [$(2; 3)$],
        [$( -infinity; 2] union [3; +infinity)$],
        [$[-3; -2]$]
    ),
    loigiai: [
        Phương trình $x^2 - 5x + 6 = 0 <=> (x - 2)(x - 3) = 0 <=> cases(x = 2, x = 3)$.
        Hệ số $a = 1 > 0$. Do đó $x^2 - 5x + 6 <= 0 <=> 2 <= x <= 3$.
        Tập nghiệm là đoạn $S = [2; 3]$.
    ]
)

// TN 4
#tn([Tập nghiệm của bất phương trình $-x^2 + 4x - 3 > 0$ là],
    (
        True([$(1; 3)$]),
        [$[1; 3]$],
        [$(-infinity; 1) union (3; +infinity)$],
        [$(-3; -1)$]
    ),
    loigiai: [
        Tam thức có hai nghiệm $x = 1$ và $x = 3$, hệ số $a = -1 < 0$.
        Để $-x^2 + 4x - 3 > 0$ (trái dấu với hệ số $a$), biến số $x$ phải nằm trong khoảng hai nghiệm: $x in (1; 3)$.
    ]
)

// TN 5
#tn([Tập nghiệm của bất phương trình bậc hai $x^2 - 6x + 9 > 0$ là],
    (
        True([$RR setminus {3}$]),
        [$RR$],
        [$(3; +infinity)$],
        [$emptyset$]
    ),
    loigiai: [
        Ta có $x^2 - 6x + 9 = (x - 3)^2$.
        Vì $(x - 3)^2 >= 0$ với mọi $x in RR$ và $(x - 3)^2 = 0 <=> x = 3$,
        nên bất phương trình $(x - 3)^2 > 0$ nghiệm đúng với mọi $x != 3$.
        Tập nghiệm là $S = RR setminus {3}$.
    ]
)

// TN 6
#tn([Tập nghiệm của bất phương trình bậc hai $x^2 + 2x + 5 <= 0$ là],
    (
        True([$emptyset$]),
        [$RR$],
        [$[-5; -2]$],
        [${-1}$]
    ),
    loigiai: [
        Biến đổi: $x^2 + 2x + 5 = (x + 1)^2 + 4 >= 4 > 0$ với mọi $x in RR$.
        Do đó không tồn tại giá trị nào của $x$ để biểu thức nhỏ hơn hoặc bằng $0$.
        Tập nghiệm là $S = emptyset$.
    ]
)

// TN 7
#tn([Khẳng định nào sau đây là ĐÚNG về dấu của tam thức bậc hai $f(x) = x^2 - 2x + 3$?],
    (
        True([$f(x) > 0$ với mọi $x in RR$]),
        [$f(x) < 0$ với mọi $x in RR$],
        [$f(x) >= 0$ chỉ khi $x >= 1$],
        [$f(x)$ đổi dấu khi qua $x = 1$]
    ),
    loigiai: [
        Tam thức có $a = 1 > 0$ và biệt thức thu gọn $Delta' = (-1)^2 - 1(3) = 1 - 3 = -2 < 0$.
        Vì $Delta' < 0$ nên tam thức luôn cùng dấu với hệ số $a$, nghĩa là $f(x) > 0$ với mọi $x in RR$.
    ]
)

// TN 8
#tn([Bảng xét dấu dưới đây là của tam thức bậc hai nào?
#align(center)[
#table(
  columns: (auto, auto, auto, auto, auto, auto),
  inset: 7pt,
  align: center,
  [$x$], [$-infinity$], [$-1$], [], [$2$], [$+infinity$],
  [$f(x)$], [], [$-$], [$0$], [$+$], [$0$], [$-$]
)
]
],
    (
        True([$f(x) = -x^2 + x + 2$]),
        [$f(x) = x^2 - x - 2$],
        [$f(x) = -x^2 - x + 2$],
        [$f(x) = x^2 + x - 2$]
    ),
    loigiai: [
        Từ bảng xét dấu:
        - $f(x) = 0$ tại hai nghiệm $x = -1$ và $x = 2$.
        - Trong khoảng $(-1; 2)$, $f(x) > 0$; ngoài khoảng hai nghiệm, $f(x) < 0$.
        Suy ra hệ số $a < 0$.
        Xét hàm số $f(x) = -x^2 + x + 2 = -(x + 1)(x - 2)$ có $a = -1 < 0$ và hai nghiệm $-1, 2$, hoàn toàn phù hợp.
    ]
)

// TN 9
#tn([Tìm tất cả các giá trị của tham số $m$ để tam thức bậc hai $f(x) = x^2 - 2x + m > 0$ với mọi $x in RR$.],
    (
        True([$m > 1$]),
        [$m >= 1$],
        [$m < 1$],
        [$m <= 1$]
    ),
    loigiai: [
        Tam thức $f(x) = x^2 - 2x + m$ có $a = 1 > 0$.
        Để $f(x) > 0$ với mọi $x in RR$ thì biệt thức phải âm:
        $ Delta' = (-1)^2 - 1 cdot m = 1 - m < 0 <=> m > 1 $
    ]
)

// TN 10
#tn([Số nghiệm nguyên của bất phương trình $x^2 - 3x - 10 <= 0$ là],
    (
        True([$8$]),
        [$7$],
        [$6$],
        [$9$]
    ),
    loigiai: [
        $x^2 - 3x - 10 = 0 <=> (x + 2)(x - 5) = 0 <=> cases(x = -2, x = 5)$.
        Vì $a = 1 > 0$ nên nghiệm của bất phương trình là $-2 <= x <= 5$.
        Các số nguyên là: $-2, -1, 0, 1, 2, 3, 4, 5$.
        Số nghiệm nguyên là: $5 - (-2) + 1 = 8$ nghiệm.
    ]
)

// TN 11
#tn([Một cơ sở sản xuất bánh xà phòng thảo dược bán lẻ với giá $15$ nghìn đồng/bánh.
Chi phí sản xuất $x$ nghìn bánh xà phòng được tính bởi hàm số:
$ C(x) = x^2 + 5x + 16 text(" (triệu đồng)") $
Doanh thu bán được là $R(x) = 15x text(" (triệu đồng)")$.
Hỏi cơ sở đó có lãi ($R(x) > C(x)$) khi số lượng bánh xà phòng sản xuất thuộc khoảng nào?],
    (
        True([Từ trên $2$ nghìn bánh đến dưới $8$ nghìn bánh]),
        [Dưới $2$ nghìn bánh],
        [Trên $8$ nghìn bánh],
        [Từ trên $4$ nghìn bánh đến dưới $6$ nghìn bánh]
    ),
    loigiai: [
        Cơ sở có lãi khi và chỉ khi:
        $ R(x) > C(x) <=> 15x > x^2 + 5x + 16 <=> -x^2 + 10x - 16 > 0 <=> x^2 - 10x + 16 < 0 $
        Phương trình $x^2 - 10x + 16 = 0 <=> (x - 2)(x - 8) = 0 <=> cases(x = 2, x = 8)$.
        Bất phương trình có nghiệm là $2 < x < 8$.
        Vậy cơ sở sinh lời khi sản xuất từ trên $2$ nghìn bánh đến dưới $8$ nghìn bánh.
    ]
)

// TN 12
#tn([Điều kiện cần và đủ để tam thức bậc hai $f(x) = a x^2 + b x + c$ luôn ÂM với mọi $x in RR$ là],
    (
        True([$a < 0$ và $Delta < 0$]),
        [$a < 0$ và $Delta <= 0$],
        [$a > 0$ và $Delta < 0$],
        [$a < 0$ và $Delta > 0$]
    ),
    loigiai: [
        Theo định lý về dấu của tam thức bậc hai:
        $f(x) < 0$ với mọi $x in RR$ khi và chỉ khi hệ số $a < 0$ và biệt thức $Delta < 0$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đồ thị và dấu tam thức có CeTZ)
#ds([Cho tam thức bậc hai $f(x) = x^2 - 4x + 3$ có đồ thị parabol $(P)$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-1, 0), (5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -2), (0, 4.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.8, -0.3), [$x$])
  content((-0.3, 4.2), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Parabol y = x^2 - 4x + 3
  line(..range(-3, 43).map(t => {
    let x = t / 10;
    (x, calc.pow(x, 2) - 4 * x + 3)
  }), stroke: 1.5pt + rgb("1e40af"))
  
  // Hai nghiệm (1; 0) và (3; 0)
  circle((1, 0), radius: 2pt, fill: rgb("1e40af"))
  circle((3, 0), radius: 2pt, fill: rgb("1e40af"))
  content((1, 0.3), [$1$])
  content((3, 0.3), [$3$])
  
  // Đỉnh (2; -1)
  circle((2, -1), radius: 2pt, fill: rgb("1e40af"))
  content((2, -1.4), [$I(2; -1)$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Biệt thức của tam thức bậc hai $f(x)$ là $Delta = 4 > 0$.]),
    True([Tam thức nhận giá trị âm ($f(x) < 0$) khi và chỉ khi $x in (1; 3)$.]),
    True([Bất phương trình $f(x) >= 0$ có tập nghiệm là $(-infinity; 1] union [3; +infinity)$.]),
    [Bất phương trình $f(x) <= -2$ có vô số nghiệm thực.]
  ),
  loigiai: [
    #step([Tính biệt thức])
    $Delta = (-4)^2 - 4(1)(3) = 16 - 12 = 4 > 0$. Mệnh đề a ĐÚNG.

    #step([Khoảng nhận giá trị âm])
    Phần đồ thị nằm phía dưới trục hoành ứng với các giá trị $x in (1; 3)$. Mệnh đề b ĐÚNG.

    #step([Giải f(x) >= 0])
    Phần đồ thị nằm phía trên hoặc trên trục hoành ứng với $x <= 1$ hoặc $x >= 3$.
    Tập nghiệm là $(-infinity; 1] union [3; +infinity)$. Mệnh đề c ĐÚNG.

    #step([Bất phương trình f(x) <= -2])
    Tung độ đỉnh của parabol là $y_I = -1$.
    Vì $a = 1 > 0$ nên $f(x) >= -1$ với mọi $x in RR$.
    Do đó bất phương trình $f(x) <= -2$ là vô nghiệm, không thể có vô số nghiệm.
    Khẳng định có vô số nghiệm là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Tham số m để tam thức luôn không âm)
#ds([Cho tam thức bậc hai $f(x) = x^2 - 2(m - 1)x + m + 5$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Biệt thức thu gọn của tam thức là $Delta' = m^2 - 3m - 4$.]),
    True([Khi $m = 2$, tam thức luôn nhận giá trị dương với mọi số thực $x$.]),
    True([Tam thức $f(x) >= 0$ với mọi $x in RR$ khi và chỉ khi $-1 <= m <= 4$.]),
    [Có đúng $7$ giá trị nguyên của tham số $m$ để tam thức $f(x) >= 0$ với mọi $x in RR$.]
  ),
  loigiai: [
    #step([Tính biệt thức thu gọn])
    $Delta' = (-(m - 1))^2 - 1 cdot (m + 5) = (m^2 - 2m + 1) - m - 5 = m^2 - 3m - 4$. Mệnh đề a ĐÚNG.

    #step([Khi m = 2])
    Khi $m = 2$: $Delta' = 2^2 - 3(2) - 4 = 4 - 6 - 4 = -6 < 0$.
    Vì $a = 1 > 0$ và $Delta' < 0$ nên $f(x) > 0$ với mọi $x in RR$. Mệnh đề b ĐÚNG.

    #step([Điều kiện f(x) >= 0 với mọi x])
    Hệ số $a = 1 > 0$. Do đó $f(x) >= 0$ với mọi $x in RR$ khi và chỉ khi:
    $ Delta' <= 0 <=> m^2 - 3m - 4 <= 0 <=> (m + 1)(m - 4) <= 0 <=> -1 <= m <= 4 $
    Mệnh đề c ĐÚNG.

    #step([Đếm số giá trị nguyên])
    Các giá trị nguyên của $m in [-1; 4]$ là: $-1, 0, 1, 2, 3, 4$.
    Tổng cộng có $4 - (-1) + 1 = 6$ giá trị nguyên (chứ không phải $7$).
    Khẳng định có đúng $7$ giá trị nguyên là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế kinh doanh hòa vốn)
#ds([Một xưởng may gia công sản xuất áo thun đồng phục. Mỗi ngày xưởng xuất xưởng $x$ chiếc áo ($x > 0$).
Doanh thu mỗi ngày là $R(x) = 200x$ (nghìn đồng).
Chi phí sản xuất mỗi ngày là $C(x) = x^2 + 40x + 6400$ (nghìn đồng).
Lợi nhuận mỗi ngày của xưởng được biểu diễn bởi:
$ L(x) = R(x) - C(x) = -x^2 + 160x - 6400 text(" (nghìn đồng)") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu mỗi ngày xưởng sản xuất và bán $50$ chiếc áo thì xưởng bị lỗ $900$ nghìn đồng.]),
    True([Điểm hòa vốn ($L(x) = 0$) của xưởng đạt được khi xưởng sản xuất đúng $80$ chiếc áo mỗi ngày.]),
    True([Mức lỗ nhỏ nhất của xưởng trong một ngày là $0$ đồng (tức đạt trạng thái hòa vốn).]),
    [Xưởng có thể thu được lợi nhuận dương ($L(x) > 0$) nếu tăng sản lượng lên trên $100$ chiếc áo mỗi ngày.]
  ),
  loigiai: [
    #step([Tính khi x = 50])
    $L(50) = -(50)^2 + 160(50) - 6400 = -2500 + 8000 - 6400 = -900$ nghìn đồng. Xưởng bị lỗ $900$ nghìn đồng. Mệnh đề a ĐÚNG.

    #step([Tìm điểm hòa vốn])
    $L(x) = 0 <=> -x^2 + 160x - 6400 = 0 <=> x^2 - 160x + 6400 = 0 <=> (x - 80)^2 = 0 <=> x = 80$.
    Vậy điểm hòa vốn duy nhất là $x = 80$ chiếc áo. Mệnh đề b ĐÚNG.

    #step([Xét dấu của hàm lợi nhuận])
    Biến đổi: $L(x) = -(x - 80)^2 <= 0$ với mọi $x > 0$.
    Như vậy $L(x)$ luôn mang giá trị không dương (luôn lỗ hoặc hòa vốn).
    Mức lỗ nhỏ nhất là $0$ đồng (khi hòa vốn tại $x = 80$). Mệnh đề c ĐÚNG.

    #step([Khả năng sinh lãi dương])
    Vì $L(x) = -(x - 80)^2 <= 0$ với mọi $x$, nên xưởng không bao giờ có thể thu được lợi nhuận dương ($L(x) > 0$) với bất kỳ sản lượng nào.
    Khẳng định xưởng có thể thu lợi nhuận dương khi $x > 100$ là hoàn toàn SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Bất phương trình tích bậc hai)
#ds([Cho bất phương trình: $(x^2 - 9)(x^2 - 4x + 3) <= 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình $(x^2 - 9)(x^2 - 4x + 3) = 0$ có đúng $3$ nghiệm thực phân biệt là $x = -3$, $x = 1$, $x = 3$.]),
    True([Tại giá trị $x = 3$, biểu thức ở vế trái nhận giá trị $0$ và là nghiệm bội chẵn.]),
    True([Tập nghiệm của bất phương trình đã cho là $[-3; 1] union {3}$.]),
    [Có đúng $4$ số nguyên không âm thuộc tập nghiệm của bất phương trình.]
  ),
  loigiai: [
    #step([Tìm nghiệm của vế trái])
    - $x^2 - 9 = 0 <=> x = plus.minus 3$.
    - $x^2 - 4x + 3 = 0 <=> x = 1$ hoặc $x = 3$.
    Tập nghiệm của phương trình là $\{-3; 1; 3\}$ (gồm đúng $3$ nghiệm phân biệt). Mệnh đề a ĐÚNG.

    #step([Xác định nghiệm bội])
    Khai triển: $(x - 3)(x + 3)(x - 1)(x - 3) = (x - 3)^2 (x + 3)(x - 1)$.
    Ta thấy nhân tử $(x - 3)$ xuất hiện với số mũ chẵn là $2$, do đó $x = 3$ là nghiệm bội chẵn và biểu thức không đổi dấu khi đi qua $x = 3$. Mệnh đề b ĐÚNG.

    #step([Xét dấu và tìm tập nghiệm])
    Vì $(x - 3)^2 >= 0$ với mọi $x$:
    - Nếu $x = 3$: Vế trái bằng $0 <= 0$ (thỏa mãn).
    - Nếu $x != 3$: Bất phương trình tương đương $(x + 3)(x - 1) <= 0 <=> -3 <= x <= 1$.
    Kết hợp lại, tập nghiệm là $S = [-3; 1] union {3}$. Mệnh đề c ĐÚNG.

    #step([Đếm số nguyên không âm])
    Các số nguyên không âm ($x in ZZ, x >= 0$) thuộc tập nghiệm $S$ là: $x in {0; 1; 3}$ (chỉ có đúng $3$ số).
    Khẳng định có đúng $4$ số là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Số nghiệm nguyên của bất phương trình)
#tln([Tìm số nghiệm nguyên của bất phương trình bậc hai $2x^2 - 7x + 3 <= 0$.],
    [3],
    loigiai: [
        #step([Tìm nghiệm của tam thức])
        Phương trình $2x^2 - 7x + 3 = 0 <=> (2x - 1)(x - 3) = 0 <=> cases(x = 1/2, x = 3)$.
        
        #step([Giải bất phương trình])
        Vì $a = 2 > 0$ nên bất phương trình có nghiệm là:
        $ 1/2 <= x <= 3 $
        
        #step([Đếm số nghiệm nguyên])
        Các nghiệm nguyên thỏa mãn là: $x in {1; 2; 3}$.
        Vậy có đúng $3$ nghiệm nguyên.
    ]
)

// TLN 2 (Nghiệm nguyên nhỏ nhất)
#tln([Tìm giá trị nguyên nhỏ nhất của $x$ thỏa mãn bất phương trình bậc hai $x^2 - 8x + 12 < 0$.],
    [3],
    loigiai: [
        #step([Giải bất phương trình])
        $x^2 - 8x + 12 = 0 <=> (x - 2)(x - 6) = 0 <=> cases(x = 2, x = 6)$.
        Do đó nghiệm là $2 < x < 6$.
        
        #step([Tìm nghiệm nguyên nhỏ nhất])
        Các số nguyên thỏa mãn là $3, 4, 5$.
        Số nguyên nhỏ nhất là $x = 3$.
    ]
)

// TLN 3 (Số giá trị nguyên của tham số m để luôn dương)
#tln([Tìm số giá trị nguyên của tham số $m in [-10; 10]$ để bất phương trình $x^2 - 2(m + 1)x + 4 > 0$ nghiệm đúng với mọi số thực $x$.],
    [3],
    loigiai: [
        #step([Điều kiện bất phương trình nghiệm đúng với mọi x])
        Hệ số $a = 1 > 0$. Bất phương trình nghiệm đúng với mọi $x in RR$ khi và chỉ khi:
        $ Delta' < 0 <=> (m + 1)^2 - 4 < 0 <=> (m + 1)^2 < 4 $
        $ <=> -2 < m + 1 < 2 <=> -3 < m < 1 $
        
        #step([Đếm số giá trị nguyên])
        Các giá trị nguyên của $m$ thỏa mãn $-3 < m < 1$ là $m in {-2; -1; 0}$.
        Vậy có đúng $3$ giá trị nguyên.
    ]
)

// TLN 4 (Thời gian bóng bay ở độ cao trên 12m)
#tln([Một quả bóng được đá thẳng đứng lên cao từ mặt đất. Độ cao $h(t) text(" (m)")$ của quả bóng so với mặt đất sau $t text(" (giây)")$ được tính bởi công thức:
$ h(t) = 16t - 4t^2 $
Hỏi trong khoảng thời gian bao nhiêu giây thì quả bóng ở độ cao từ $12 text(" m")$ trở lên so với mặt đất?],
    [2],
    loigiai: [
        #step([Lập bất phương trình độ cao])
        Quả bóng ở độ cao từ $12 text(" m")$ trở lên khi:
        $ 16t - 4t^2 >= 12 <=> -4t^2 + 16t - 12 >= 0 <=> 4t^2 - 16t + 12 <= 0 <=> t^2 - 4t + 3 <= 0 $
        
        #step([Giải bất phương trình])
        Phương trình $t^2 - 4t + 3 = 0 <=> cases(t = 1, t = 3)$.
        Nghiệm của bất phương trình là $1 <= t <= 3$.
        
        #step([Tính khoảng thời gian])
        Khoảng thời gian quả bóng ở độ cao từ $12 text(" m")$ trở lên là:
        $ Delta t = 3 - 1 = 2 text(" giây") $
    ]
)

// TLN 5 (Nghiệm nguyên lớn nhất)
#tln([Tìm nghiệm nguyên lớn nhất của bất phương trình $-x^2 + 5x + 14 >= 0$.],
    [7],
    loigiai: [
        #step([Giải bất phương trình])
        Nhân cả hai vế với $-1$:
        $ x^2 - 5x - 14 <= 0 <=> (x + 2)(x - 7) <= 0 <=> -2 <= x <= 7 $
        
        #step([Tìm nghiệm nguyên lớn nhất])
        Nghiệm nguyên lớn nhất thuộc đoạn $[-2; 7]$ là $x = 7$.
    ]
)

// TLN 6 (Giá trị nhỏ nhất của m để tập xác định là R)
#tln([Tìm giá trị nhỏ nhất của tham số $m$ để hàm số $y = sqrt(x^2 - 6x + m)$ có tập xác định là toàn bộ trục số thực $RR$.],
    [9],
    loigiai: [
        #step([Điều kiện để tập xác định là R])
        Hàm số xác định trên $RR$ khi và chỉ khi biểu thức dưới dấu căn không âm với mọi $x in RR$:
        $ x^2 - 6x + m >= 0 text(" với mọi ") x in RR $
        
        #step([Áp dụng định lý về dấu tam thức])
        Vì $a = 1 > 0$, điều kiện tương đương:
        $ Delta' <= 0 <=> (-3)^2 - 1 cdot m <= 0 <=> 9 - m <= 0 <=> m >= 9 $
        
        #step([Tìm giá trị nhỏ nhất])
        Giá trị nhỏ nhất của $m$ là $m = 9$.
    ]
)

] // end make-questions

#make-questions()
