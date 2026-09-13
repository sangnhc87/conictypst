#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0d9488") // Teal

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG",
  exam-title: "BÀI 17: DẤU CỦA TAM THỨC BẬC HAI (ĐỀ SỐ 18B - VẬN DỤNG & THỰC TIỄN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "144",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Tập xác định của hàm số $y = sqrt(x^2 - 4)$ là],
    (
        True([$(-infinity; -2] union [2; +infinity)$]),
        [$[-2; 2]$],
        [$( -infinity; -2) union (2; +infinity)$],
        [$[2; +infinity)$]
    ),
    loigiai: [
        Hàm số xác định khi và chỉ khi biểu thức dưới dấu căn không âm:
        $ x^2 - 4 >= 0 <=> (x - 2)(x + 2) >= 0 <=> cases(x <= -2, x >= 2) $
        Vậy tập xác định là $D = (-infinity; -2] union [2; +infinity)$.
    ]
)

// TN 2
#tn([Tập xác định của hàm số $y = 1 / sqrt(x^2 - 3x - 4)$ là],
    (
        True([$(-infinity; -1) union (4; +infinity)$]),
        [$[-1; 4]$],
        [$(-1; 4)$],
        [$( -infinity; -1] union [4; +infinity)$]
    ),
    loigiai: [
        Vì căn thức nằm ở mẫu số nên biểu thức dưới căn phải thực sự dương:
        $ x^2 - 3x - 4 > 0 <=> (x + 1)(x - 4) > 0 <=> cases(x < -1, x > 4) $
        Vậy tập xác định là $D = (-infinity; -1) union (4; +infinity)$.
    ]
)

// TN 3
#tn([Tập nghiệm của bất phương trình $(x - 1)(2 - x) >= 0$ là],
    (
        True([$[1; 2]$]),
        [$(-infinity; 1] union [2; +infinity)$],
        [$(1; 2)$],
        [$[-2; -1]$]
    ),
    loigiai: [
        Khai triển: $-x^2 + 3x - 2 >= 0 <=> x^2 - 3x + 2 <= 0 <=> (x - 1)(x - 2) <= 0 <=> 1 <= x <= 2$.
        Tập nghiệm là đoạn $[1; 2]$.
    ]
)

// TN 4
#tn([Tập nghiệm của bất phương trình bậc hai $x^2 - 4x + 4 <= 0$ là],
    (
        True([${2}$]),
        [$emptyset$],
        [$RR$],
        [$RR setminus {2}$]
    ),
    loigiai: [
        Ta có $x^2 - 4x + 4 = (x - 2)^2$.
        Vì $(x - 2)^2 >= 0$ với mọi $x in RR$, nên $(x - 2)^2 <= 0 <=> (x - 2)^2 = 0 <=> x = 2$.
        Vậy tập nghiệm chỉ gồm một phần tử duy nhất: $S = {2}$.
    ]
)

// TN 5
#tn([Tập nghiệm của bất phương trình bậc hai $x^2 + 4x + 5 > 0$ là],
    (
        True([$RR$]),
        [$emptyset$],
        [$(-infinity; -2) union (-2; +infinity)$],
        [$[-5; -1]$]
    ),
    loigiai: [
        Biến đổi: $x^2 + 4x + 5 = (x + 2)^2 + 1 >= 1 > 0$ với mọi $x in RR$.
        Do đó bất phương trình nghiệm đúng với mọi $x in RR$, tập nghiệm $S = RR$.
    ]
)

// TN 6
#tn([Tập nghiệm của bất phương trình $2x^2 - 5x + 2 < 0$ là],
    (
        True([$(1/2; 2)$]),
        [$(-infinity; 1/2) union (2; +infinity)$],
        [$[1/2; 2]$],
        [$(-2; -1/2)$]
    ),
    loigiai: [
        Phương trình $2x^2 - 5x + 2 = 0 <=> (2x - 1)(x - 2) = 0 <=> cases(x = 1/2, x = 2)$.
        Vì $a = 2 > 0$, theo quy tắc "trong trái, ngoài cùng" ta có $1/2 < x < 2$.
        Tập nghiệm là khoảng $(1/2; 2)$.
    ]
)

// TN 7
#tn([Tam thức bậc hai $f(x) = -2x^2 + 5x - 3$ nhận giá trị DƯƠNG ($f(x) > 0$) khi và chỉ khi $x$ thuộc khoảng nào?],
    (
        True([$(1; 3/2)$]),
        [$(-infinity; 1)$],
        [$(3/2; +infinity)$],
        [$(-infinity; 1) union (3/2; +infinity)$]
    ),
    loigiai: [
        Tam thức có hai nghiệm $x = 1$ và $x = 3/2$, hệ số $a = -2 < 0$.
        Để $f(x) > 0$ (trái dấu với $a$), $x$ phải nằm trong khoảng hai nghiệm: $x in (1; 3/2)$.
    ]
)

// TN 8
#tn([Số nghiệm nguyên của bất phương trình $-x^2 + 6x - 5 >= 0$ là],
    (
        True([$5$]),
        [$4$],
        [$6$],
        [$3$]
    ),
    loigiai: [
        Nhân hai vế với $-1$:
        $ x^2 - 6x + 5 <= 0 <=> (x - 1)(x - 5) <= 0 <=> 1 <= x <= 5 $
        Các nghiệm nguyên là $1, 2, 3, 4, 5$ (tổng cộng có đúng $5$ số).
    ]
)

// TN 9
#tn([Tìm tất cả các giá trị của tham số $m$ để phương trình bậc hai $x^2 - 2(m - 1)x + m^2 - 4 = 0$ có hai nghiệm phân biệt.],
    (
        True([$m < 5/2$]),
        [$m > 5/2$],
        [$m <= 5/2$],
        [$m < -5/2$]
    ),
    loigiai: [
        Phương trình có hai nghiệm phân biệt khi và chỉ khi:
        $ Delta' = (-(m - 1))^2 - 1 cdot (m^2 - 4) > 0 $
        $ <=> (m^2 - 2m + 1) - m^2 + 4 > 0 <=> 5 - 2m > 0 <=> 2m < 5 <=> m < 5/2 $
    ]
)

// TN 10
#tn([Một ô tô đang di chuyển với vận tốc $v text(" (m/s)")$. Quãng đường hãm phanh cho đến khi dừng hẳn được tính bởi công thức:
$ s(v) = 0.05 v^2 + 0.2 v text(" (m)") $
Khi phát hiện chướng ngại vật ở khoảng cách $36 text(" m")$, vận tốc tối đa của xe để có thể dừng lại an toàn trước chướng ngại vật là],
    (
        True([$24 text(" m/s")$]),
        [$20 text(" m/s")$],
        [$25 text(" m/s")$],
        [$30 text(" m/s")$]
    ),
    loigiai: [
        Xe dừng lại an toàn khi quãng đường hãm phanh không vượt quá $36 text(" m")$:
        $ 0.05 v^2 + 0.2 v <= 36 <=> 5 v^2 + 20 v - 3600 <= 0 <=> v^2 + 4v - 720 <= 0 $
        Phương trình $v^2 + 4v - 720 = 0 <=> (v - 24)(v + 30) = 0 <=> cases(v = 24, v = -30)$.
        Vì vận tốc $v > 0$ nên ta có $0 < v <= 24 text(" m/s")$.
        Vận tốc tối đa là $24 text(" m/s")$.
    ]
)

// TN 11
#tn([Tìm tất cả các giá trị của tham số $m$ để tam thức $f(x) = (m - 1)x^2 + 2(m - 1)x + 2m - 3 > 0$ với mọi $x in RR$.],
    (
        True([$m > 2$]),
        [$m > 1$],
        [$1 < m < 2$],
        [$m >= 2$]
    ),
    loigiai: [
        - Trường hợp 1: $m - 1 = 0 <=> m = 1$. Khi đó $f(x) = 2(0)x + 2(1) - 3 = -1 > 0$ (vô lý). Do đó $m = 1$ không thỏa mãn.
        - Trường hợp 2: $m - 1 != 0 <=> m != 1$. Để $f(x) > 0$ với mọi $x in RR$ thì:
        $ cases(a = m - 1 > 0, Delta' = (m - 1)^2 - (m - 1)(2m - 3) < 0) <=> cases(m > 1, (m - 1)(m - 1 - 2m + 3) < 0) $
        $ <=> cases(m > 1, (m - 1)(2 - m) < 0) $
        Vì $m > 1$ nên $m - 1 > 0$, do đó bất phương trình tương đương:
        $ 2 - m < 0 <=> m > 2 $
        Vậy điều kiện là $m > 2$.
    ]
)

// TN 12
#tn([Tập nghiệm của bất phương trình $(x^2 - x - 2) / (x^2 + 1) <= 0$ là],
    (
        True([$[-1; 2]$]),
        [$(-1; 2)$],
        [$(-infinity; -1] union [2; +infinity)$],
        [$[-2; 1]$]
    ),
    loigiai: [
        Vì mẫu số $x^2 + 1 >= 1 > 0$ với mọi $x in RR$ nên bất phương trình tương đương:
        $ x^2 - x - 2 <= 0 <=> (x + 1)(x - 2) <= 0 <=> -1 <= x <= 2 $
        Tập nghiệm là đoạn $[-1; 2]$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đồ thị parabol và dấu tam thức)
#ds([Cho tam thức bậc hai $f(x) = -x^2 + 4x - 3$ có đồ thị parabol $(P)$ như sau:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-1, 0), (5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -4), (0, 2.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.8, -0.3), [$x$])
  content((-0.3, 2.3), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Parabol y = -x^2 + 4x - 3
  line(..range(-3, 43).map(t => {
    let x = t / 10;
    (x, -calc.pow(x, 2) + 4 * x - 3)
  }), stroke: 1.5pt + rgb("0d9488"))
  
  // Đỉnh I(2; 1)
  circle((2, 1), radius: 2.5pt, fill: rgb("0d9488"))
  line((2, 0), (2, 1), stroke: (dash: "dashed", paint: gray))
  line((0, 1), (2, 1), stroke: (dash: "dashed", paint: gray))
  content((2, -0.3), [$2$])
  content((-0.3, 1), [$1$])
  content((2.4, 1.3), [$I(2; 1)$])
  
  // Nghiệm (1; 0) và (3; 0)
  circle((1, 0), radius: 2pt, fill: rgb("0d9488"))
  circle((3, 0), radius: 2pt, fill: rgb("0d9488"))
  content((1, -0.3), [$1$])
  content((3, -0.3), [$3$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ đỉnh của parabol là $I(2; 1)$.]),
    True([Tam thức nhận giá trị dương ($f(x) > 0$) khi và chỉ khi $x in (1; 3)$.]),
    True([Tập nghiệm của bất phương trình $f(x) <= 0$ là $(-infinity; 1] union [3; +infinity)$.]),
    [Giá trị lớn nhất của tam thức $f(x)$ trên toàn trục số thực $RR$ bằng $2$.]
  ),
  loigiai: [
    #step([Tọa độ đỉnh])
    $x_I = - 4 / (2(-1)) = 2$; $y_I = -(2)^2 + 4(2) - 3 = 1$. Đỉnh $I(2; 1)$. Mệnh đề a ĐÚNG.

    #step([Khoảng nhận giá trị dương])
    Phần đồ thị nằm phía trên trục hoành tương ứng với các giá trị $x in (1; 3)$. Mệnh đề b ĐÚNG.

    #step([Tập nghiệm của f(x) <= 0])
    Phần đồ thị nằm phía dưới hoặc cắt trục hoành tương ứng với $x <= 1$ hoặc $x >= 3$.
    Tập nghiệm là $(-infinity; 1] union [3; +infinity)$. Mệnh đề c ĐÚNG.

    #step([Giá trị lớn nhất])
    Vì $a = -1 < 0$ nên đỉnh $I(2; 1)$ là điểm cao nhất của đồ thị.
    Do đó giá trị lớn nhất của $f(x)$ trên $RR$ là $1$ (chứ không phải bằng $2$). Mệnh đề d SAI.
  ]
)

// DS 2 (Bất phương trình phân thức bậc hai)
#ds([Cho bất phương trình: $(x^2 - 3x + 2) / (x^2 - 5x + 6) <= 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện xác định của bất phương trình là $x != 2$ và $x != 3$.]),
    True([Với điều kiện $x != 2$, biểu thức vế trái được rút gọn thành $(x - 1) / (x - 3)$.]),
    True([Tập nghiệm của bất phương trình đã cho là nửa khoảng $[1; 3) setminus {2}$.]),
    [Có đúng $3$ số nguyên dương thuộc tập nghiệm của bất phương trình.]
  ),
  loigiai: [
    #step([Điều kiện xác định])
    Mẫu thức: $x^2 - 5x + 6 != 0 <=> (x - 2)(x - 3) != 0 <=> cases(x != 2, x != 3)$. Mệnh đề a ĐÚNG.

    #step([Rút gọn biểu thức])
    Tử thức: $x^2 - 3x + 2 = (x - 1)(x - 2)$.
    Với $x != 2$, ta có:
    $ (x^2 - 3x + 2) / (x^2 - 5x + 6) = ((x - 1)(x - 2)) / ((x - 2)(x - 3)) = (x - 1) / (x - 3) $
    Mệnh đề b ĐÚNG.

    #step([Giải bất phương trình])
    $(x - 1) / (x - 3) <= 0 <=> 1 <= x < 3$.
    Kết hợp điều kiện $x != 2$, tập nghiệm là $S = [1; 3) setminus {2} = [1; 2) union (2; 3)$. Mệnh đề c ĐÚNG.

    #step([Đếm số nguyên dương])
    Các số nguyên dương thuộc $S$ là: Trên đoạn $[1; 3)$, có các số nguyên $1, 2$. Nhưng $x = 2$ bị loại, còn $x = 3$ không thuộc khoảng.
    Do đó chỉ có duy nhất số nguyên dương $x = 1$.
    Khẳng định có đúng $3$ số nguyên dương là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế kinh doanh nông sản)
#ds([Một trang trại trồng dưa lưới hữu cơ. Mỗi vụ thu hoạch được $x$ tấn dưa lưới ($x > 0$).
Doanh thu từ việc bán dưa là $R(x) = 50x$ (triệu đồng).
Tổng chi phí sản xuất và phân phối của vụ mùa là $C(x) = x^2 + 10x + 300$ (triệu đồng).
Lợi nhuận thu được là $L(x) = R(x) - C(x) = -x^2 + 40x - 300$ (triệu đồng).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Trang trại hòa vốn ($L(x) = 0$) khi sản lượng thu hoạch là $10$ tấn hoặc $30$ tấn.]),
    True([Trang trại có lãi ($L(x) > 0$) khi và chỉ khi sản lượng thu hoạch trong vụ thuộc khoảng từ trên $10$ tấn đến dưới $30$ tấn.]),
    True([Lợi nhuận lớn nhất mà trang trại có thể đạt được trong một vụ là $100$ triệu đồng.]),
    [Để đạt mức lợi nhuận từ $75$ triệu đồng trở lên trong một vụ thì sản lượng dưa thu hoạch phải đạt trên $25$ tấn.]
  ),
  loigiai: [
    #step([Điểm hòa vốn])
    $L(x) = 0 <=> -x^2 + 40x - 300 = 0 <=> x^2 - 40x + 300 = 0 <=> (x - 10)(x - 30) = 0 <=> cases(x = 10, x = 30)$. Mệnh đề a ĐÚNG.

    #step([Khoảng sinh lời])
    $L(x) > 0 <=> -x^2 + 40x - 300 > 0 <=> 10 < x < 30$ (tấn). Mệnh đề b ĐÚNG.

    #step([Lợi nhuận lớn nhất])
    Hàm bậc hai có $a = -1 < 0$, đạt cực đại tại $x = - 40 / (2(-1)) = 20$ tấn.
    Lợi nhuận tối đa: $L(20) = -(20)^2 + 40(20) - 300 = -400 + 800 - 300 = 100$ triệu đồng. Mệnh đề c ĐÚNG.

    #step([Lợi nhuận từ 75 triệu đồng trở lên])
    $L(x) >= 75 <=> -x^2 + 40x - 300 >= 75 <=> x^2 - 40x + 375 <= 0 <=> (x - 15)(x - 25) <= 0 <=> 15 <= x <= 25$.
    Do đó sản lượng phải nằm trong đoạn $[15; 25]$ tấn (chứ không phải trên $25$ tấn, vì nếu trên $25$ tấn thì lợi nhuận giảm dần và dưới $75$ triệu).
    Khẳng định trên $25$ tấn là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số m trong tam thức bậc hai)
#ds([Cho tam thức bậc hai $f(x) = x^2 - 2m x + 3m - 2$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Biệt thức thu gọn của tam thức là $Delta' = m^2 - 3m + 2$.]),
    True([Tam thức $f(x) > 0$ với mọi $x in RR$ khi và chỉ khi $1 < m < 2$.]),
    True([Khi $m = 1$, phương trình $f(x) = 0$ có nghiệm kép là $x = 1$.]),
    [Có đúng $2$ giá trị nguyên của tham số $m$ để bất phương trình $f(x) <= 0$ có nghiệm thực.]
  ),
  loigiai: [
    #step([Tính biệt thức thu gọn])
    $Delta' = (-m)^2 - 1(3m - 2) = m^2 - 3m + 2$. Mệnh đề a ĐÚNG.

    #step([Điều kiện f(x) > 0 với mọi x])
    Vì $a = 1 > 0$ nên $f(x) > 0$ với mọi $x in RR$ khi và chỉ khi:
    $ Delta' < 0 <=> m^2 - 3m + 2 < 0 <=> (m - 1)(m - 2) < 0 <=> 1 < m < 2 $
    Mệnh đề b ĐÚNG.

    #step([Khi m = 1])
    $f(x) = x^2 - 2x + 1 = (x - 1)^2$. Phương trình $(x - 1)^2 = 0$ có nghiệm kép $x = 1$. Mệnh đề c ĐÚNG.

    #step([Bất phương trình f(x) <= 0 có nghiệm])
    Vì $a = 1 > 0$, bất phương trình $f(x) <= 0$ có nghiệm khi và chỉ khi parabol cắt hoặc tiếp xúc với trục hoành:
    $ Delta' >= 0 <=> m^2 - 3m + 2 >= 0 <=> cases(m <= 1, m >= 2) $
    Tập hợp các giá trị nguyên thỏa mãn là vô số ($m in {dots; -2; -1; 0; 1} union {2; 3; 4; dots}$).
    Khẳng định có đúng $2$ giá trị nguyên là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Số nghiệm nguyên của BPT)
#tln([Tìm số nghiệm nguyên của bất phương trình $-3x^2 + 10x - 3 >= 0$.],
    [3],
    loigiai: [
        #step([Giải bất phương trình])
        Nhân hai vế với $-1$:
        $ 3x^2 - 10x + 3 <= 0 <=> (3x - 1)(x - 3) <= 0 <=> 1/3 <= x <= 3 $
        
        #step([Đếm số nghiệm nguyên])
        Các số nguyên thỏa mãn là $x in {1; 2; 3}$.
        Vậy có đúng $3$ nghiệm nguyên.
    ]
)

// TLN 2 (Nghiệm nguyên lớn nhất)
#tln([Tìm giá trị nguyên lớn nhất của $x$ thỏa mãn bất phương trình $x^2 - 7x + 10 < 0$.],
    [4],
    loigiai: [
        #step([Giải bất phương trình])
        Phương trình $x^2 - 7x + 10 = 0 <=> (x - 2)(x - 5) = 0 <=> cases(x = 2, x = 5)$.
        Bất phương trình có nghiệm là $2 < x < 5$.
        
        #step([Tìm nghiệm nguyên lớn nhất])
        Các số nguyên thỏa mãn là $3, 4$.
        Nghiệm nguyên lớn nhất là $x = 4$.
    ]
)

// TLN 3 (Số giá trị nguyên của m để luôn dương)
#tln([Tìm số giá trị nguyên của tham số $m in [-10; 10]$ để tam thức bậc hai $f(x) = x^2 - 2(m - 2)x + 2m + 1$ luôn nhận giá trị dương với mọi số thực $x$.],
    [5],
    loigiai: [
        #step([Điều kiện để f(x) > 0 với mọi x])
        Hệ số $a = 1 > 0$. Điều kiện là:
        $ Delta' < 0 <=> (-(m - 2))^2 - 1 cdot (2m + 1) < 0 $
        $ <=> (m^2 - 4m + 4) - 2m - 1 < 0 <=> m^2 - 6m + 3 < 0 $
        
        #step([Giải bất phương trình])
        Nghiệm của $m^2 - 6m + 3 = 0$ là $m = 3 plus.minus sqrt(6)$.
        Do đó: $3 - sqrt(6) < m < 3 + sqrt(6)$.
        Vì $sqrt(6) approx 2.45$ nên $0.55 < m < 5.45$.
        
        #step([Đếm số giá trị nguyên])
        Các số nguyên thỏa mãn là $m in {1; 2; 3; 4; 5}$ (gồm đúng $5$ giá trị).
    ]
)

// TLN 4 (Vận tốc tối đa của đoàn tàu hãm phanh)
#tln([Một đoàn tàu hỏa đang di chuyển với vận tốc $v text(" (m/s)")$. Quãng đường hãm phanh của đoàn tàu cho tới khi dừng hẳn được tính bởi công thức:
$ s(v) = 0.05 v^2 + v text(" (m)") $
Để đảm bảo an toàn, khoảng cách hãm phanh không được vượt quá $300 text(" m")$.
Hỏi vận tốc tối đa của đoàn tàu khi bắt đầu hãm phanh là bao nhiêu m/s?],
    [60],
    loigiai: [
        #step([Lập bất phương trình])
        Khoảng cách hãm phanh không vượt quá $300 text(" m")$:
        $ 0.05 v^2 + v <= 300 <=> 5 v^2 + 100 v - 30000 <= 0 <=> v^2 + 20 v - 6000 <= 0 $
        
        #step([Giải phương trình tìm nghiệm])
        Phương trình $v^2 + 20v - 6000 = 0 <=> (v - 60)(v + 100) = 0 <=> cases(v = 60, v = -100)$.
        Vì vận tốc $v > 0$ nên nghiệm của bất phương trình là:
        $ 0 < v <= 60 text(" m/s") $
        Vậy vận tốc tối đa an toàn là $60 text(" m/s")$.
    ]
)

// TLN 5 (Giá trị nguyên nhỏ nhất của tham số m)
#tln([Tìm giá trị nguyên nhỏ nhất của tham số $m$ để bất phương trình $x^2 - 2m x + m + 6 > 0$ nghiệm đúng với mọi số thực $x$.],
    [-1],
    loigiai: [
        #step([Điều kiện nghiệm đúng với mọi x])
        Hệ số $a = 1 > 0$. Điều kiện là:
        $ Delta' < 0 <=> (-m)^2 - 1(m + 6) < 0 <=> m^2 - m - 6 < 0 $
        $ <=> (m + 2)(m - 3) < 0 <=> -2 < m < 3 $
        
        #step([Tìm giá trị nguyên nhỏ nhất])
        Các số nguyên trong khoảng $(-2; 3)$ là $-1, 0, 1, 2$.
        Số nguyên nhỏ nhất là $m = -1$.
    ]
)

// TLN 6 (Số phần tử nguyên thuộc tập xác định)
#tln([Hỏi có bao nhiêu số nguyên $x$ thuộc tập xác định của hàm số $y = sqrt(16 - x^2) + 1 / sqrt(x + 2)$?],
    [6],
    loigiai: [
        #step([Điều kiện xác định của hàm số])
        Hàm số xác định khi và chỉ khi:
        $ cases(16 - x^2 >= 0, x + 2 > 0) <=> cases(-4 <= x <= 4, x > -2) <=> -2 < x <= 4 $
        Tập xác định là nửa khoảng $D = (-2; 4]$.
        
        #step([Đếm số nguyên])
        Các số nguyên thuộc $D$ là: $x in {-1; 0; 1; 2; 3; 4}$.
        Tổng cộng có đúng $6$ số nguyên.
    ]
)

] // end make-questions

#make-questions()
