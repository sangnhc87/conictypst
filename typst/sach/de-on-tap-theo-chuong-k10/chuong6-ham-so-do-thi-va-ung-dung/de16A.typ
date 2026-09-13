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
  exam-title: "BÀI 15: HÀM SỐ VÀ ĐỒ THỊ (ĐỀ SỐ 16A - CƠ BẢN ĐẾN VẬN DỤNG)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "137",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Tập xác định của hàm số $y = sqrt(2x - 6)$ là],
    (
        True([$[3; +infinity)$]),
        [$(3; +infinity)$],
        [$( -infinity; 3]$],
        [$( -infinity; 3)$]
    ),
    loigiai: [
        Hàm số xác định khi và chỉ khi biểu thức dưới dấu căn không âm:
        $ 2x - 6 >= 0 <=> 2x >= 6 <=> x >= 3 $
        Vậy tập xác định của hàm số là $D = [3; +infinity)$.
    ]
)

// TN 2
#tn([Tập xác định của hàm số phân thức $y = (x + 2) / (x - 4)$ là],
    (
        True([$RR setminus {4}$]),
        [$RR setminus {-2}$],
        [$RR setminus {-2; 4}$],
        [$(4; +infinity)$]
    ),
    loigiai: [
        Hàm số xác định khi và chỉ khi mẫu thức khác $0$:
        $ x - 4 != 0 <=> x != 4 $
        Vậy tập xác định của hàm số là $D = RR setminus {4}$.
    ]
)

// TN 3
#tn([Tập xác định của hàm số $y = sqrt(x + 5) / (x - 1)$ là],
    (
        True([$[-5; +infinity) setminus {1}$]),
        [$(-5; +infinity) setminus {1}$],
        [$[-5; 1)$],
        [$(1; +infinity)$]
    ),
    loigiai: [
        Điều kiện xác định của hàm số là:
        $ cases(x + 5 >= 0, x - 1 != 0) <=> cases(x >= -5, x != 1) $
        Vậy tập xác định là $D = [-5; +infinity) setminus {1}$.
    ]
)

// TN 4
#tn([Cho hàm số xác định theo hai công thức:
$ f(x) = cases(
  2x + 1 &text("khi") x >= 1,
  x^2 - 3 &text("khi") x < 1
) $
Giá trị của biểu thức $P = f(2) + f(-1)$ bằng],
    (
        True([$3$]),
        [$7$],
        [$-1$],
        [$5$]
    ),
    loigiai: [
        - Với $x = 2 >= 1$, áp dụng nhánh trên: $f(2) = 2(2) + 1 = 5$.
        - Với $x = -1 < 1$, áp dụng nhánh dưới: $f(-1) = (-1)^2 - 3 = 1 - 3 = -2$.
        Suy ra $P = f(2) + f(-1) = 5 + (-2) = 3$.
    ]
)

// TN 5
#tn([Điểm nào sau đây THUỘC đồ thị của hàm số $y = 2x^2 - 3x + 1$?],
    (
        True([$M(2; 3)$]),
        [$N(1; 1)$],
        [$P(0; 2)$],
        [$Q(-1; 4)$]
    ),
    loigiai: [
        Thay tọa độ từng điểm vào phương trình hàm số:
        - Với $M(2; 3)$: $y = 2(2)^2 - 3(2) + 1 = 8 - 6 + 1 = 3$ (Thỏa mãn).
        - Với $N(1; 1)$: $y = 2(1)^2 - 3(1) + 1 = 0 != 1$ (Loại).
        - Với $P(0; 2)$: $y = 1 != 2$ (Loại).
        - Với $Q(-1; 4)$: $y = 2(-1)^2 - 3(-1) + 1 = 2 + 3 + 1 = 6 != 4$ (Loại).
    ]
)

// TN 6
#tn([Cho hàm số bậc hai $y = x^2 - 2$ có đồ thị trên mặt phẳng tọa độ $O x y$.
Tập giá trị $T$ của hàm số đã cho là],
    (
        True([$[-2; +infinity)$]),
        [$(-infinity; -2]$],
        [$RR$],
        [$[0; +infinity)$]
    ),
    loigiai: [
        Vì $x^2 >= 0$ với mọi $x in RR$ nên $y = x^2 - 2 >= -2$.
        Đẳng thức xảy ra khi $x = 0$.
        Do đó tập giá trị của hàm số là $T = [-2; +infinity)$.
    ]
)

// TN 7
#tn([Hàm số nào sau đây ĐỒNG BIẾN trên toàn trục số thực $RR$?],
    (
        True([$y = 3x - 5$]),
        [$y = -2x + 1$],
        [$y = 4$],
        [$y = x^2$]
    ),
    loigiai: [
        Hàm số bậc nhất $y = a x + b$ đồng biến trên $RR$ khi và chỉ khi hệ số góc $a > 0$.
        Hàm số $y = 3x - 5$ có $a = 3 > 0$ nên luôn đồng biến trên $RR$.
    ]
)

// TN 8
#tn([Cho hàm số $y = f(x)$ có bảng biến thiên trên đoạn $[-2; 3]$ như sau:
#align(center)[
#table(
  columns: (auto, auto, auto, auto),
  inset: 7pt,
  align: center,
  [$x$], [$-2$], [$1$], [$3$],
  [$f(x)$], [$4$], [$-1$], [$5$]
)
]
Hàm số $y = f(x)$ NGHỊCH BIẾN trên khoảng nào sau đây?],
    (
        True([$(-2; 1)$]),
        [$(1; 3)$],
        [$(-2; 3)$],
        [$(-1; 5)$]
    ),
    loigiai: [
        Từ bảng biến thiên, khi $x$ tăng từ $-2$ đến $1$ thì giá trị $f(x)$ giảm từ $4$ xuống $-1$.
        Do đó hàm số nghịch biến trên khoảng $(-2; 1)$.
    ]
)

// TN 9
#tn([Giao điểm của đồ thị hàm số $y = -2x + 4$ với trục hoành $O x$ là điểm có tọa độ],
    (
        True([$A(2; 0)$]),
        [$B(0; 4)$],
        [$C(-2; 0)$],
        [$D(0; -2)$]
    ),
    loigiai: [
        Giao điểm với trục hoành $O x$ có tung độ $y = 0$:
        $ -2x + 4 = 0 <=> 2x = 4 <=> x = 2 $
        Vậy giao điểm là $A(2; 0)$.
    ]
)

// TN 10
#tn([Cho hình vuông có độ dài cạnh là $x text(" (cm)")$ với $x > 0$. Hàm số $S(x)$ biểu thị diện tích của hình vuông theo độ dài cạnh $x$ là],
    (
        True([$S(x) = x^2$]),
        [$S(x) = 4x$],
        [$S(x) = 2x$],
        [$S(x) = x^3$]
    ),
    loigiai: [
        Diện tích của hình vuông cạnh $x$ được tính theo công thức $S = x^2$.
        Vậy hàm số cần tìm là $S(x) = x^2$.
    ]
)

// TN 11
#tn([Tập xác định của hàm số $y = 1 / sqrt(3 - x)$ là],
    (
        True([$(-infinity; 3)$]),
        [$( -infinity; 3]$],
        [$(3; +infinity)$],
        [$[3; +infinity)$]
    ),
    loigiai: [
        Vì căn thức nằm ở mẫu số nên biểu thức dưới căn phải thực sự dương:
        $ 3 - x > 0 <=> x < 3 $
        Vậy tập xác định là $D = (-infinity; 3)$.
    ]
)

// TN 12
#tn([Hàm số $y = f(x)$ được gọi là nghịch biến trên khoảng $(a; b)$ nếu với mọi $x_1, x_2 in (a; b)$ mà $x_1 < x_2$ thì],
    (
        True([$f(x_1) > f(x_2)$]),
        [$f(x_1) < f(x_2)$],
        [$f(x_1) >= f(x_2)$],
        [$f(x_1) = f(x_2)$]
    ),
    loigiai: [
        Theo định nghĩa sự biến thiên của hàm số: Hàm số nghịch biến khi biến số tăng thì giá trị hàm số giảm ($x_1 < x_2 => f(x_1) > f(x_2)$).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đồ thị hàm số)
#ds([Cho đồ thị hàm số $y = f(x)$ xác định liên tục trên đoạn $[-3; 4]$ có dạng đường gấp khúc đi qua các điểm $A(-3; -1)$, $B(-1; 3)$, $C(2; 0)$ và $D(4; 2)$ như sau:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  // Trục tọa độ
  line((-4, 0), (5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -2), (0, 4), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.8, -0.3), [$x$])
  content((-0.3, 3.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Đoạn gấp khúc đồ thị
  line((-3, -1), (-1, 3), stroke: 1.5pt + rgb("1e40af"))
  line((-1, 3), (2, 0), stroke: 1.5pt + rgb("1e40af"))
  line((2, 0), (4, 2), stroke: 1.5pt + rgb("1e40af"))
  
  // Điểm mốc
  circle((-3, -1), radius: 2.5pt, fill: rgb("1e40af"))
  circle((-1, 3), radius: 2.5pt, fill: rgb("1e40af"))
  circle((2, 0), radius: 2.5pt, fill: rgb("1e40af"))
  circle((4, 2), radius: 2.5pt, fill: rgb("1e40af"))
  
  content((-3, -1.4), [$A(-3; -1)$])
  content((-1, 3.4), [$B(-1; 3)$])
  content((2, -0.4), [$C(2; 0)$])
  content((4.2, 2.3), [$D(4; 2)$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tập xác định của hàm số là đoạn $[-3; 4]$ và tập giá trị là đoạn $[-1; 3]$.]),
    True([Hàm số đồng biến trên khoảng $(-3; -1)$ và trên khoảng $(2; 4)$.]),
    True([Hàm số nghịch biến trên khoảng $(-1; 2)$.]),
    [Đồ thị hàm số cắt trục hoành $O x$ tại duy nhất một điểm.]
  ),
  loigiai: [
    #step([Xác định tập xác định và tập giá trị])
    Hoành độ các điểm trên đồ thị trải dài từ $-3$ đến $4$, do đó $D = [-3; 4]$.
    Tung độ thấp nhất là $-1$ (tại $A$) và cao nhất là $3$ (tại $B$), do đó $T = [-1; 3]$. Mệnh đề a ĐÚNG.

    #step([Xét khoảng đồng biến])
    Trên đoạn $[-3; -1]$ và $[2; 4]$, đồ thị đi lên từ trái sang phải, nên hàm số đồng biến trên các khoảng $(-3; -1)$ và $(2; 4)$. Mệnh đề b ĐÚNG.

    #step([Xét khoảng nghịch biến])
    Trên đoạn $[-1; 2]$, đồ thị đi xuống từ trái sang phải, do đó hàm số nghịch biến trên khoảng $(-1; 2)$. Mệnh đề c ĐÚNG.

    #step([Số giao điểm với trục hoành])
    Đoạn thẳng nối $A(-3; -1)$ với $B(-1; 3)$ cắt trục hoành tại một điểm có hoành độ âm.
    Điểm $C(2; 0)$ cũng nằm trên trục hoành.
    Như vậy đồ thị cắt trục hoành tại $2$ điểm phân biệt.
    Khẳng định duy nhất một điểm là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Tập xác định chứa tham số m)
#ds([Cho hàm số $y = f(x) = sqrt(x - 2m + 4) + 1 / sqrt(6 - x)$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khi $m = 1$, tập xác định của hàm số là nửa khoảng $[-2; 6)$.]),
    True([Để hàm số xác định tại điểm $x = 4$ thì giá trị của tham số $m$ phải thỏa mãn $m <= 4$.]),
    True([Tập xác định của hàm số là một nửa khoảng có độ dài hữu hạn khi và chỉ khi $m < 5$.]),
    [Hàm số xác định trên toàn bộ đoạn $[2; 5]$ khi và chỉ khi $m >= 3$.]
  ),
  loigiai: [
    #step([Điều kiện xác định tổng quát])
    Hàm số xác định khi và chỉ khi:
    $ cases(x - 2m + 4 >= 0, 6 - x > 0) <=> cases(x >= 2m - 4, x < 6) $
    Tập xác định là $D = [2m - 4; 6)$.

    #step([Khi m = 1])
    $2m - 4 = 2(1) - 4 = -2$. Tập xác định là $D = [-2; 6)$. Mệnh đề a ĐÚNG.

    #step([Xác định tại x = 4])
    Thay $x = 4$ vào điều kiện: $4 >= 2m - 4 <=> 2m <= 8 <=> m <= 4$ (điều kiện $4 < 6$ luôn đúng). Mệnh đề b ĐÚNG.

    #step([Tập xác định là nửa khoảng hữu hạn])
    Để $D = [2m - 4; 6) != emptyset$ thì $2m - 4 < 6 <=> 2m < 10 <=> m < 5$. Mệnh đề c ĐÚNG.

    #step([Xác định trên đoạn [2; 5]])
    Để hàm số xác định trên toàn bộ đoạn $[2; 5]$ thì $[2; 5] subset D = [2m - 4; 6)$.
    Điều này tương đương với:
    $ 2m - 4 <= 2 <=> 2m <= 6 <=> m <= 3 $
    Do đó điều kiện đúng phải là $m <= 3$ chứ không phải $m >= 3$. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế mô hình hàm số cước phí xe công nghệ)
#ds([Một hãng xe công nghệ quy định biểu cước dịch vụ di chuyển bốn chỗ như sau:
- Giá mở cửa cho $1 text(" km")$ đầu tiên: $12.000$ đồng.
- Từ trên $1 text(" km")$ đến $10 text(" km")$: Giá mỗi ki-lô-mét tiếp theo là $15.000$ đồng/km.
- Từ trên $10 text(" km")$ trở đi: Giá mỗi ki-lô-mét phụ trội tính từ ki-lô-mét thứ $10$ là $11.000$ đồng/km.
Gọi $T(x)$ (đồng) là số tiền cước khách hàng phải trả khi đi quãng đường $x text(" (km)")$ với $x > 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu hành khách đi quãng đường $0.8 text(" km")$ thì số tiền cước phải trả là $12.000$ đồng.]),
    True([Nếu hành khách đi quãng đường $6 text(" km")$ thì số tiền cước phải trả là $87.000$ đồng.]),
    True([Công thức tính cước khi đi quãng đường $x > 10 text(" km")$ là $T(x) = 11.000x + 37.000 text(" (đồng)")$.]),
    [Nếu hành khách thanh toán số tiền cước là $200.000$ đồng thì quãng đường xe đã di chuyển là $16 text(" km")$.]
  ),
  loigiai: [
    #step([Tính cước trong 1 km đầu])
    Với $0 < x <= 1$: $T(x) = 12.000$ đồng.
    Với $x = 0.8 text(" km") <= 1 text(" km")$, cước là $12.000$ đồng. Mệnh đề a ĐÚNG.

    #step([Tính cước khi x = 6 km])
    Với $1 < x <= 10$: $T(x) = 12.000 + 15.000(x - 1) = 15.000x - 3.000$ đồng.
    Khi $x = 6$: $T(6) = 12.000 + 15.000(5) = 12.000 + 75.000 = 87.000$ đồng. Mệnh đề b ĐÚNG.

    #step([Lập công thức khi x > 10 km])
    Số tiền cước khi đi hết $10 text(" km")$ đầu: $T(10) = 12.000 + 15.000(9) = 147.000$ đồng.
    Khi $x > 10$:
    $T(x) = 147.000 + 11.000(x - 10) = 11.000x + 147.000 - 110.000 = 11.000x + 37.000$ đồng. Mệnh đề c ĐÚNG.

    #step([Tìm quãng đường khi cước là 200.000 đồng])
    Vì $200.000 > 147.000$ nên $x > 10$:
    $ 11.000x + 37.000 = 200.000 <=> 11.000x = 163.000 <=> x = 163 / 11 approx 14.82 text(" km") != 16 text(" km") $
    Khẳng định $16 text(" km")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Khảo sát tính đơn điệu bằng định nghĩa)
#ds([Cho hàm số $f(x) = x^2 - 4x + 3$ xác định trên toàn trục số thực $RR$.
Lấy hai số thực phân biệt bất kỳ $x_1, x_2 in RR$ ($x_1 != x_2$).
Tỉ số biến thiên được định nghĩa bởi:
$ K = (f(x_2) - f(x_1)) / (x_2 - x_1) $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tỉ số biến thiên $K$ rút gọn được dưới dạng đại số là $K = x_1 + x_2 - 4$.]),
    True([Hàm số $f(x)$ nghịch biến trên khoảng $(-infinity; 2)$.]),
    True([Hàm số $f(x)$ đồng biến trên khoảng $(2; +infinity)$.]),
    [Giá trị nhỏ nhất của hàm số $f(x)$ trên toàn trục số thực $RR$ bằng $3$.]
  ),
  loigiai: [
    #step([Rút gọn tỉ số biến thiên K])
    $f(x_2) - f(x_1) = (x_2^2 - 4x_2 + 3) - (x_1^2 - 4x_1 + 3)$
    $= (x_2^2 - x_1^2) - 4(x_2 - x_1) = (x_2 - x_1)(x_1 + x_2 - 4)$.
    Suy ra $K = (f(x_2) - f(x_1)) / (x_2 - x_1) = x_1 + x_2 - 4$. Mệnh đề a ĐÚNG.

    #step([Xét trên khoảng (-infinity; 2)])
    Với mọi $x_1, x_2 in (-infinity; 2)$, ta có $x_1 < 2$ và $x_2 < 2$.
    Suy ra $x_1 + x_2 < 4 => K = x_1 + x_2 - 4 < 0$.
    Do đó hàm số nghịch biến trên khoảng $(-infinity; 2)$. Mệnh đề b ĐÚNG.

    #step([Xét trên khoảng (2; +infinity)])
    Với mọi $x_1, x_2 in (2; +infinity)$, ta có $x_1 > 2$ và $x_2 > 2$.
    Suy ra $x_1 + x_2 > 4 => K = x_1 + x_2 - 4 > 0$.
    Do đó hàm số đồng biến trên khoảng $(2; +infinity)$. Mệnh đề c ĐÚNG.

    #step([Giá trị nhỏ nhất của hàm số])
    Biến đổi: $f(x) = (x - 2)^2 - 1 >= -1$ với mọi $x in RR$.
    Đẳng thức xảy ra khi $x = 2$, suy ra $min f(x) = -1$ (chứ không phải bằng $3$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Số nguyên nhỏ nhất thuộc tập xác định)
#tln([Cho hàm số $y = sqrt(x - 5) + 1 / (12 - x)$.
Tìm số nguyên dương $x$ nhỏ nhất thuộc tập xác định của hàm số đã cho.],
    [5],
    loigiai: [
        #step([Tìm tập xác định])
        Hàm số xác định khi và chỉ khi:
        $ cases(x - 5 >= 0, 12 - x != 0) <=> cases(x >= 5, x != 12) $
        Tập xác định là $D = [5; +infinity) setminus {12}$.
        
        #step([Tìm số nguyên dương nhỏ nhất])
        Các số nguyên dương thuộc tập xác định là $5, 6, 7, dots$.
        Do đó số nguyên dương nhỏ nhất là $x = 5$.
    ]
)

// TLN 2 (Tính giá trị hàm số phân nhánh)
#tln([Cho hàm số:
$ f(x) = cases(
  x^2 + 2x - 1 &text("khi") x >= 2,
  3x + 5 &text("khi") x < 2
) $
Tính giá trị của biểu thức $P = f(3) - f(-2)$.],
    [15],
    loigiai: [
        #step([Tính f(3)])
        Vì $3 >= 2$ nên áp dụng nhánh trên:
        $ f(3) = 3^2 + 2(3) - 1 = 9 + 6 - 1 = 14 $
        
        #step([Tính f(-2)])
        Vì $-2 < 2$ nên áp dụng nhánh dưới:
        $ f(-2) = 3(-2) + 5 = -6 + 5 = -1 $
        
        #step([Tính giá trị P])
        $ P = f(3) - f(-2) = 14 - (-1) = 15 $
    ]
)

// TLN 3 (Điểm thuộc đồ thị và tìm tham số m)
#tln([Trong mặt phẳng tọa độ $O x y$, đồ thị của hàm số $y = (2m - 1)x + m - 4$ đi qua điểm $A(2; 6)$.
Tìm giá trị của tham số $m$.],
    [2.4],
    loigiai: [
        #step([Thay tọa độ điểm A vào hàm số])
        Vì đồ thị đi qua điểm $A(2; 6)$ nên:
        $ 6 = (2m - 1)(2) + m - 4 $
        $ <=> 6 = 4m - 2 + m - 4 $
        $ <=> 6 = 5m - 6 $
        $ <=> 5m = 12 <=> m = 12 / 5 = 2.4 $
    ]
)

// TLN 4 (Tham số m để hàm số xác định trên nửa khoảng)
#tln([Tìm số giá trị nguyên của tham số $m in [-5; 10]$ để hàm số $y = sqrt(x - m + 2)$ xác định với mọi $x in [3; +infinity)$.],
    [11],
    loigiai: [
        #step([Điều kiện xác định của hàm số])
        Hàm số xác định khi $x - m + 2 >= 0 <=> x >= m - 2$.
        Tập xác định của hàm số là $D = [m - 2; +infinity)$.
        
        #step([Điều kiện để xác định trên $[3; +infinity)$])
        Để hàm số xác định với mọi $x in [3; +infinity)$ thì:
        $ [3; +infinity) subset [m - 2; +infinity) <=> m - 2 <= 3 <=> m <= 5 $
        
        #step([Đếm số giá trị nguyên])
        Kết hợp với điều kiện $m in [-5; 10]$, ta được $-5 <= m <= 5$.
        Số giá trị nguyên của $m$ là: $5 - (-5) + 1 = 11$ giá trị.
    ]
)

// TLN 5 (Bài toán thực tế thời gian xả cạn bồn nước)
#tln([Một bồn chứa nước sạch sinh hoạt dung tích $240 text(" lít")$ đang đầy nước. Người ta mở một van xả đáy với tốc độ xả không đổi là $8 text(" lít/phút")$.
Hàm số biểu diễn thể tích nước còn lại trong bồn $V(t) text(" (lít)")$ sau $t text(" (phút)")$ là $V(t) = 240 - 8t$.
Hỏi sau bao nhiêu phút kể từ lúc mở van thì bồn nước được xả cạn hoàn toàn?],
    [30],
    loigiai: [
        #step([Điều kiện xả cạn hoàn toàn])
        Bồn nước xả cạn hoàn toàn khi thể tích nước trong bồn $V(t) = 0$:
        $ 240 - 8t = 0 <=> 8t = 240 <=> t = 30 text(" phút") $
        Vậy sau $30$ phút thì bồn nước được xả cạn hoàn toàn.
    ]
)

// TLN 6 (Khoảng cách giữa hai giao điểm với trục hoành)
#tln([Đồ thị của hàm số bậc hai $y = x^2 - 4x - 5$ cắt trục hoành $O x$ tại hai điểm phân biệt $A$ và $B$.
Tính độ dài đoạn thẳng $A B$.],
    [6],
    loigiai: [
        #step([Tìm tọa độ giao điểm với trục hoành])
        Phương trình hoành độ giao điểm:
        $ x^2 - 4x - 5 = 0 <=> (x + 1)(x - 5) = 0 <=> cases(x = -1, x = 5) $
        Tọa độ hai giao điểm là $A(-1; 0)$ và $B(5; 0)$.
        
        #step([Tính độ dài đoạn thẳng AB])
        $ A B = |x_B - x_A| = |5 - (-1)| = |6| = 6 $
    ]
)

] // end make-questions

#make-questions()
