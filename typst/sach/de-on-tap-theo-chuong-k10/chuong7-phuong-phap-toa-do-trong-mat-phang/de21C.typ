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
  exam-title: "BÀI 19: PHƯƠNG TRÌNH ĐƯỜNG THẲNG (ĐỀ SỐ 21C - NÂNG CAO & VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "157",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong mặt phẳng $O x y$, đường thẳng đi qua điểm $M(2; -1)$ và tạo với hai trục tọa độ một tam giác cân có phương trình là],
    (
        True([$x + y - 1 = 0$]),
        [$x + y + 1 = 0$],
        [$2x + y - 3 = 0$],
        [$x - 2y - 4 = 0$]
    ),
    loigiai: [
        Đường thẳng tạo với hai trục tọa độ tam giác cân khi hệ số góc $k = plus.minus 1$.
        - Với $k = -1$: phương trình có dạng $x + y + c = 0$.
        Đi qua $M(2; -1) => 2 + (-1) + c = 0 <=> c = -1 => x + y - 1 = 0$.
        - Với $k = 1$: phương trình có dạng $x - y + c' = 0 => 2 - (-1) + c' = 0 <=> c' = -3 => x - y - 3 = 0$.
        Đối chiếu các phương án, chọn $x + y - 1 = 0$.
    ]
)

// TN 2
#tn([Cho tam giác $A B C$ có các đường thẳng chứa hai cạnh $A B$ và $A C$ lần lượt là $2x - y + 1 = 0$ và $x + 2y - 7 = 0$. Tọa độ của đỉnh $A$ là],
    (
        True([$A(1; 3)$]),
        [$A(2; 5)$],
        [$A(-1; -1)$],
        [$A(3; 2)$]
    ),
    loigiai: [
        Đỉnh $A$ là giao điểm của hai cạnh $A B$ và $A C$. Tọa độ của $A$ thỏa mãn hệ:
        $ cases(2x - y = -1, x + 2y = 7) <=> cases(4x - 2y = -2, x + 2y = 7) <=> cases(5x = 5 => x = 1, y = 2x + 1 = 3) $
        Vậy tọa độ đỉnh $A$ là $A(1; 3)$.
    ]
)

// TN 3
#tn([Điểm $M$ thuộc đường thẳng $d: x - y + 1 = 0$ sao cho khoảng cách từ gốc tọa độ $O$ đến $M$ đạt giá trị nhỏ nhất có tọa độ là],
    (
        True([$M(- 1 / 2; 1 / 2)$]),
        [$M(0; 1)$],
        [$M(-1; 0)$],
        [$M(1 / 2; 3 / 2)$]
    ),
    loigiai: [
        Khoảng cách $O M$ nhỏ nhất khi $M$ là hình chiếu vuông góc của $O$ lên $d$, tức là $O M perp d$.
        Đường thẳng $O M$ đi qua $O(0; 0)$ và nhận VTCP của $d$ là $vec(u) = (1; 1)$ làm VTPT, nên có phương trình: $x + y = 0$.
        Tọa độ điểm $M$ là nghiệm của hệ:
        $ cases(x - y = -1, x + y = 0) <=> cases(2x = -1 => x = - 1 / 2, y = 1 / 2) $
    ]
)

// TN 4
#tn([Cho tam giác $A B C$ có đỉnh $A(1; 2)$ và cạnh $B C$ nằm trên đường thẳng $d: x - 2y + 8 = 0$. Phương trình đường cao $A H$ kẻ từ đỉnh $A$ là],
    (
        True([$2x + y - 4 = 0$]),
        [$2x + y + 4 = 0$],
        [$x - 2y + 3 = 0$],
        [$2x - y = 0$]
    ),
    loigiai: [
        Đường cao $A H perp B C$ nên nhận VTCP của đường thẳng $d$ là $vec(u) = (2; 1)$ làm VTPT.
        Phương trình đường cao $A H$ đi qua $A(1; 2)$:
        $ 2(x - 1) + 1(y - 2) = 0 <=> 2x - 2 + y - 2 = 0 <=> 2x + y - 4 = 0 $
    ]
)

// TN 5
#tn([Tọa độ hình chiếu vuông góc $H$ của điểm $P(4; 1)$ lên đường thẳng $Delta: x - y + 1 = 0$ là],
    (
        True([$H(2; 3)$]),
        [$H(1; 2)$],
        [$H(3; 4)$],
        [$H(0; 1)$]
    ),
    loigiai: [
        Đường thẳng đi qua $P(4; 1)$ và vuông góc với $Delta$ có phương trình:
        $ 1(x - 4) + 1(y - 1) = 0 <=> x + y - 5 = 0 $
        Hình chiếu $H$ là giao điểm của đường thẳng vuông góc này và $Delta$:
        $ cases(x - y = -1, x + y = 5) <=> cases(2x = 4 => x = 2, y = 3) $
        Vậy tọa độ hình chiếu là $H(2; 3)$.
    ]
)

// TN 6
#tn([Tọa độ điểm $A'$ đối xứng với điểm $A(1; 5)$ qua đường phân giác của góc phần tư thứ nhất $d: x - y = 0$ là],
    (
        True([$A'(5; 1)$]),
        [$A'(-1; -5)$],
        [$A'(-5; -1)$],
        [$A'(1; -5)$]
    ),
    loigiai: [
        Điểm đối xứng của $M(x_0; y_0)$ qua đường phân giác $y = x$ có tọa độ là $(y_0; x_0)$.
        Do đó đối xứng của $A(1; 5)$ là $A'(5; 1)$.
    ]
)

// TN 7
#tn([Cho hai điểm $A(1; 2)$ và $B(3; 4)$. Điểm $M(x_0; 0)$ nằm trên trục hoành $O x$ sao cho tổng khoảng cách $M A + M B$ đạt giá trị nhỏ nhất. Giá trị của hoành độ $x_0$ là],
    (
        True([$x_0 = 5 / 3$]),
        [$x_0 = 2$],
        [$x_0 = 7 / 3$],
        [$x_0 = 1$]
    ),
    loigiai: [
        Vì $y_A = 2 > 0$ và $y_B = 4 > 0$ nên $A, B$ cùng phía so với trục hoành $O x$.
        Lấy điểm $A'$ đối xứng với $A$ qua $O x => A'(1; -2)$.
        Khi đó $M A + M B = M A' + M B >= A' B$.
        Dấu bằng xảy ra khi $M$ là giao điểm của đường thẳng $A' B$ và trục hoành $O x$.
        Ta có $vec(A' B) = (3 - 1; 4 - (-2)) = (2; 6) = 2(1; 3) =>$ VTPT $vec(n) = (3; -1)$.
        Phương trình đường thẳng $A' B$:
        $ 3(x - 3) - 1(y - 4) = 0 <=> 3x - y - 5 = 0 $
        Giao điểm với $O x$ ($y = 0$): $3x_0 - 5 = 0 <=> x_0 = 5 / 3$.
    ]
)

// TN 8
#tn([Tìm giá trị của tham số $m$ để ba đường thẳng sau cùng đi qua một điểm:
$d_1: 2x - y + 1 = 0$; quad $d_2: x + y - 4 = 0$; quad $d_3: 3x - 2y + m = 0$.],
    (
        True([$m = 3$]),
        [$m = -3$],
        [$m = 6$],
        [$m = -6$]
    ),
    loigiai: [
        Giao điểm của $d_1$ và $d_2$ là nghiệm của hệ:
        $ cases(2x - y = -1, x + y = 4) <=> cases(3x = 3 => x = 1, y = 3) => I(1; 3) $
        Để ba đường thẳng đồng quy thì $I(1; 3) in d_3$:
        $ 3(1) - 2(3) + m = 0 <=> 3 - 6 + m = 0 <=> m = 3 $
    ]
)

// TN 9
#tn([Đường thẳng $d$ đi qua điểm $M(1; 4)$ cắt các tia $O x, O y$ lần lượt tại $A(a; 0)$ và $B(0; b)$ ($a, b > 0$) sao cho diện tích tam giác $O A B$ đạt giá trị nhỏ nhất. Phương trình của đường thẳng $d$ là],
    (
        True([$4x + y - 8 = 0$]),
        [$x + 4y - 17 = 0$],
        [$2x + y - 6 = 0$],
        [$x + y - 5 = 0$]
    ),
    loigiai: [
        Phương trình đoạn chắn: $x / a + y / b = 1$.
        Vì $M(1; 4) in d$ nên: $1 / a + 4 / b = 1$.
        Áp dụng bất đẳng thức Cauchy cho hai số dương $1/a$ và $4/b$:
        $ 1 = 1 / a + 4 / b >= 2 sqrt(1 / a cdot 4 / b) = 4 / sqrt(a b) => sqrt(a b) >= 4 => a b >= 16 $
        Diện tích tam giác $O A B$: $S = 1 / 2 a b >= 1 / 2(16) = 8$.
        Dấu bằng xảy ra khi:
        $ 1 / a = 4 / b = 1 / 2 => cases(a = 2, b = 8) $
        Phương trình đường thẳng $d$: $x / 2 + y / 8 = 1 <=> 4x + y - 8 = 0$.
    ]
)

// TN 10
#tn([Cho hình vuông $A B C D$ có đỉnh $A(1; 1)$ và phương trình cạnh $B C$ là $x + 2y - 8 = 0$. Phương trình của cạnh $A D$ là],
    (
        True([$x + 2y - 3 = 0$]),
        [$x + 2y + 3 = 0$],
        [$2x - y - 1 = 0$],
        [$x - 2y + 1 = 0$]
    ),
    loigiai: [
        Vì $A B C D$ là hình vuông nên cạnh $A D$ song song với cạnh $B C$.
        Do đó cạnh $A D$ có cùng vectơ pháp tuyến $vec(n) = (1; 2)$.
        Phương trình cạnh $A D$ đi qua đỉnh $A(1; 1)$ là:
        $ 1(x - 1) + 2(y - 1) = 0 <=> x + 2y - 3 = 0 $
    ]
)

// TN 11
#tn([Một doanh nghiệp có ngân sách $120 text(" triệu đồng")$ để mua nguyên liệu $X$ (giá $10 text(" triệu đồng/tấn")$) và nguyên liệu $Y$ (giá $15 text(" triệu đồng/tấn")$).
Phương trình đường ngân sách trong mặt phẳng tọa độ $O x y$ (với $x, y$ là số tấn $X$ và $Y$) là:
$ 10x + 15y = 120 <=> 2x + 3y - 24 = 0 $
Nếu doanh nghiệp quyết định mua $6 text(" tấn")$ nguyên liệu $X$ thì số tấn nguyên liệu $Y$ mua được là],
    (
        True([$4 text(" tấn")$]),
        [$3 text(" tấn")$],
        [$5 text(" tấn")$],
        [$6 text(" tấn")$]
    ),
    loigiai: [
        Thay $x = 6$ vào phương trình đường ngân sách:
        $ 2(6) + 3y - 24 = 0 <=> 12 + 3y - 24 = 0 <=> 3y = 12 <=> y = 4 text(" tấn") $
    ]
)

// TN 12
#tn([Một máy bay hạ cánh theo đường thẳng từ độ cao $3000 text(" m")$ xuống đường băng.
Trong hệ tọa độ $O x y$ (đơn vị: mét), máy bay bắt đầu hạ cánh từ vị trí $A(0; 3000)$ và tiếp đất tại điểm $B(15000; 0)$.
Hệ số góc của quỹ đạo hạ cánh là],
    (
        True([$k = - 0.2$]),
        [$k = 0.2$],
        [$k = - 5$],
        [$k = 5$]
    ),
    loigiai: [
        Hệ số góc của đường thẳng $A B$:
        $ k = (y_B - y_A) / (x_B - x_A) = (0 - 3000) / (15000 - 0) = - 3000 / 15000 = - 0.2 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Hình chiếu và đối xứng có CeTZ)
#ds([Trong mặt phẳng tọa độ $O x y$, cho điểm $A(1; 4)$ và đường thẳng $d: x - y + 1 = 0$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-1.5, 0), (4.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -0.5), (0, 5), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.3, -0.3), [$x$])
  content((-0.3, 4.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Đường thẳng d: x - y + 1 = 0 -> y = x + 1
  line((-1, 0), (3.5, 4.5), stroke: 1.2pt + rgb("d97706"))
  content((3.6, 4.7), [$d$])
  
  // Điểm A(1; 4)
  circle((1, 4), radius: 2pt, fill: rgb("d97706"))
  content((0.6, 4.2), [$A(1; 4)$])
  
  // Hình chiếu H(2; 3)
  circle((2, 3), radius: 2pt, fill: blue)
  content((1.6, 2.7), [$H(2; 3)$])
  
  // Điểm đối xứng A'(3; 2)
  circle((3, 2), radius: 2pt, fill: red)
  content((3.5, 1.8), [$A'(3; 2)$])
  
  // Đoạn vuông góc A H A'
  line((1, 4), (3, 2), stroke: (dash: "dashed", paint: gray))
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điểm $A(1; 4)$ không nằm trên đường thẳng $d$.]),
    True([Hình chiếu vuông góc của điểm $A$ lên đường thẳng $d$ là điểm $H(2; 3)$.]),
    True([Điểm $A'$ đối xứng với điểm $A$ qua đường thẳng $d$ có tọa độ là $A'(3; 2)$.]),
    [Khoảng cách từ điểm $A$ đến đường thẳng $d$ bằng $2$.]
  ),
  loigiai: [
    #step([Kiểm tra điểm A])
    Thay $A(1; 4)$ vào phương trình $d$: $1 - 4 + 1 = -2 != 0$.
    Điểm $A$ không nằm trên đường thẳng $d$. Mệnh đề a ĐÚNG.

    #step([Tìm hình chiếu H])
    Đường thẳng $Delta$ đi qua $A(1; 4)$ và vuông góc với $d$ có phương trình:
    $ 1(x - 1) + 1(y - 4) = 0 <=> x + y - 5 = 0 $
    Hình chiếu $H$ là giao điểm của $Delta$ và $d$:
    $ cases(x - y = -1, x + y = 5) <=> cases(2x = 4 => x = 2, y = 3) => H(2; 3) $. Mệnh đề b ĐÚNG.

    #step([Tìm điểm đối xứng A'])
    Vì $H$ là trung điểm của đoạn $A A'$ nên:
    $ cases(x_(A') = 2x_H - x_A = 2(2) - 1 = 3, y_(A') = 2y_H - y_A = 2(3) - 4 = 2) => A'(3; 2) $. Mệnh đề c ĐÚNG.

    #step([Tính khoảng cách])
    Khoảng cách từ $A$ đến $d$ chính là độ dài đoạn $A H$:
    $ A H = sqrt((2 - 1)^2 + (3 - 4)^2) = sqrt(1^2 + (-1)^2) = sqrt(2) $
    Độ dài đúng bằng $sqrt(2)$ (chứ không phải bằng $2$).
    Khẳng định khoảng cách bằng $2$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Diện tích nhỏ nhất tam giác đoạn chắn)
#ds([Một đường thẳng $Delta$ đi qua điểm $M(2; 1)$ cắt hai tia $O x, O y$ lần lượt tại $A(a; 0)$ và $B(0; b)$ với $a > 0, b > 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình của đường thẳng $Delta$ theo đoạn chắn có dạng $x / a + y / b = 1$.]),
    True([Vì điểm $M(2; 1)$ thuộc $Delta$ nên ta có đẳng thức $2 / a + 1 / b = 1$.]),
    True([Diện tích của tam giác $O A B$ đạt giá trị nhỏ nhất bằng $4$ (đơn vị diện tích).]),
    [Khi diện tích tam giác $O A B$ đạt giá trị nhỏ nhất, phương trình của đường thẳng $Delta$ là $2x + y - 5 = 0$.]
  ),
  loigiai: [
    #step([Phương trình đoạn chắn])
    Đường thẳng cắt hai trục tại $A(a; 0), B(0; b)$ có phương trình: $x / a + y / b = 1$. Mệnh đề a ĐÚNG.

    #step([Đẳng thức từ điểm M])
    Thay $M(2; 1)$ vào: $2 / a + 1 / b = 1$. Mệnh đề b ĐÚNG.

    #step([Diện tích nhỏ nhất])
    Theo bất đẳng thức Cauchy: $1 = 2 / a + 1 / b >= 2 sqrt(2 / (a b)) => a b >= 8$.
    Diện tích tam giác vuông $O A B$: $S = 1 / 2 a b >= 1 / 2(8) = 4$. Mệnh đề c ĐÚNG.

    #step([Phương trình khi diện tích nhỏ nhất])
    Dấu bằng xảy ra khi $2 / a = 1 / b = 1 / 2 => a = 4, b = 2$.
    Phương trình đường thẳng: $x / 4 + y / 2 = 1 <=> x + 2y - 4 = 0$ (chứ không phải $2x + y - 5 = 0$).
    Khẳng định phương trình là $2x + y - 5 = 0$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Hệ thống hai đường băng vuông góc)
#ds([Tại một sân bay quốc tế, hai đường băng cất cánh thẳng được thiết kế trên bản đồ tọa độ $O x y$ (đơn vị: kilômét):
- Đường băng $1$ nằm trên đường thẳng $d_1: 3x - 4y + 12 = 0$.
- Đường băng $2$ nằm trên đường thẳng $d_2: 4x + 3y - 9 = 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai đường băng $d_1$ và $d_2$ vuông góc với nhau.]),
    True([Tọa độ giao điểm $K$ của hai đường băng là $K(0; 3)$.]),
    True([Khoảng cách từ trạm chỉ huy tại gốc tọa độ $O(0; 0)$ đến điểm giao cắt $K$ bằng $3 text(" km")$.]),
    [Một trực thăng tuần tra đang ở vị trí $P(4; 5)$ nằm trực tiếp trên đường băng $1$.]
  ),
  loigiai: [
    #step([Tính vuông góc])
    $vec(n_1) = (3; -4)$, $vec(n_2) = (4; 3)$.
    Tích vô hướng: $vec(n_1) cdot vec(n_2) = 3(4) + (-4)(3) = 12 - 12 = 0$.
    Do đó hai đường băng vuông góc. Mệnh đề a ĐÚNG.

    #step([Tìm giao điểm K])
    Giải hệ phương trình:
    $ cases(3x - 4y = -12, 4x + 3y = 9) <=> cases(9x - 12y = -36, 16x + 12y = 36) <=> cases(25x = 0 => x = 0, y = 3) => K(0; 3) $. Mệnh đề b ĐÚNG.

    #step([Khoảng cách OK])
    $O K = sqrt(0^2 + 3^2) = 3 text(" km")$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra vị trí trực thăng P(4; 5)])
    Thay $P(4; 5)$ vào phương trình $d_1$:
    $ 3(4) - 4(5) + 12 = 12 - 20 + 12 = 4 != 0 $
    Điểm $P(4; 5)$ không thuộc đường băng $1$.
    Khẳng định $P(4; 5)$ nằm trên đường băng $1$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tối ưu hóa vị trí trạm xử lý nước thải)
#ds([Hai khu công nghiệp $A(1; 3)$ và $B(5; 5)$ nằm cùng phía đối với một dòng kênh thẳng được mô hình hóa bằng trục hoành $O x$.
Người ta cần chọn vị trí đặt một trạm xử lý nước thải chung $M(x_0; 0)$ trên bờ kênh ($O x$) sao cho tổng chiều dài đường ống dẫn $M A + M B$ là ngắn nhất.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điểm đối xứng với $A(1; 3)$ qua trục hoành $O x$ là $A'(1; -3)$.]),
    True([Phương trình đường thẳng $A' B$ là $2x - y - 5 = 0$.]),
    True([Tổng khoảng cách $M A + M B$ ngắn nhất khi ba điểm $A', M, B$ thẳng hàng.]),
    [Vị trí đặt trạm trên bờ kênh có hoành độ là $x_0 = 3$.]
  ),
  loigiai: [
    #step([Điểm đối xứng A'])
    Đối xứng qua trục $O x$ thì giữ nguyên hoành độ, đổi dấu tung độ: $A'(1; -3)$. Mệnh đề a ĐÚNG.

    #step([Phương trình đường thẳng A'B])
    $vec(A' B) = (5 - 1; 5 - (-3)) = (4; 8) = 4(1; 2) =>$ VTPT $vec(n) = (2; -1)$.
    Phương trình đi qua $B(5; 5)$:
    $ 2(x - 5) - 1(y - 5) = 0 <=> 2x - y - 5 = 0 $. Mệnh đề b ĐÚNG.

    #step([Điều kiện tổng khoảng cách nhỏ nhất])
    Vì $M in O x$ nên $M A = M A'$. Do đó $M A + M B = M A' + M B >= A' B$.
    Tổng khoảng cách đạt giá trị nhỏ nhất khi ba điểm $A', M, B$ thẳng hàng. Mệnh đề c ĐÚNG.

    #step([Tìm hoành độ x0])
    Trạm $M$ nằm trên $O x$ nên $y = 0$. Thay $y = 0$ vào phương trình $A' B$:
    $ 2x_0 - 0 - 5 = 0 <=> 2x_0 = 5 <=> x_0 = 5 / 2 = 2.5 $
    Hoành độ đúng là $x_0 = 2.5$ (chứ không phải $x_0 = 3$).
    Khẳng định $x_0 = 3$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tham số m để 3 đường thẳng đồng quy)
#tln([Cho ba đường thẳng $d_1: 2x - y + 1 = 0$, $d_2: x + y - 4 = 0$ và $d_3: 3x - 2y + m = 0$ cùng đi qua một điểm. Tìm giá trị của tham số $m$.],
    [3],
    loigiai: [
        #step([Tìm giao điểm của d1 và d2])
        $ cases(2x - y = -1, x + y = 4) <=> cases(3x = 3 => x = 1, y = 3) => I(1; 3) $
        
        #step([Thay vào d3 để tìm m])
        $ 3(1) - 2(3) + m = 0 <=> 3 - 6 + m = 0 <=> m = 3 $
    ]
)

// TLN 2 (Khoảng cách phương ngang khi máy bay hạ cánh)
#tln([Trong bài toán hạ cánh máy bay với hệ số góc $k = -0.2$, khi máy bay đang ở độ cao $1000 text(" m")$, khoảng cách theo phương ngang từ máy bay đến điểm tiếp đất bằng bao nhiêu mét?],
    [5000],
    loigiai: [
        #step([Tính khoảng cách theo phương ngang])
        Hệ số góc bằng tỉ số giữa độ biến thiên độ cao và khoảng cách ngang:
        $ |k| = (Delta y) / (Delta x) <=> 0.2 = 1000 / (Delta x) <=> Delta x = 1000 / 0.2 = 5000 text(" m") $
    ]
)

// TLN 3 (Số lượng tối đa mua hàng trong ngân sách)
#tln([Trong bài toán đường ngân sách tiêu dùng $2x + 3y - 24 = 0$, nếu doanh nghiệp dùng toàn bộ ngân sách để chỉ mua nguyên liệu $X$ ($y = 0$) thì số tấn nguyên liệu $X$ mua được bằng bao nhiêu?],
    [12],
    loigiai: [
        #step([Tính lượng nguyên liệu X khi y = 0])
        Thay $y = 0$ vào phương trình đường ngân sách:
        $ 2x + 3(0) - 24 = 0 <=> 2x = 24 <=> x = 12 text(" tấn") $
    ]
)

// TLN 4 (Diện tích nhỏ nhất tam giác đoạn chắn)
#tln([Tìm diện tích nhỏ nhất của tam giác tạo bởi hai tia $O x, O y$ và một đường thẳng đi qua điểm $M(2; 1)$.],
    [4],
    loigiai: [
        #step([Áp dụng bất đẳng thức Cauchy])
        Đường thẳng cắt hai tia tại $A(a; 0), B(0; b)$ có $2/a + 1/b = 1$.
        $ 1 >= 2 sqrt(2 / (a b)) => a b >= 8 $
        
        #step([Tính diện tích nhỏ nhất])
        $ S_text("min") = 1 / 2 (a b)_text("min") = 1 / 2 cdot 8 = 4 $
    ]
)

// TLN 5 (Hoành độ điểm đối xứng qua Oy)
#tln([Tìm hoành độ của điểm $A'$ đối xứng với điểm $A(3; 5)$ qua trục tung $O y$.],
    [-3],
    loigiai: [
        #step([Xác định tọa độ điểm đối xứng qua trục tung])
        Điểm đối xứng qua trục tung $O y$ có hoành độ đổi dấu và giữ nguyên tung độ:
        $ A(3; 5) => A'(-3; 5) $
        Hoành độ là $x = -3$.
    ]
)

// TLN 6 (Hệ số tự do cạnh tam giác qua trực tâm)
#tln([Trong mặt phẳng $O x y$, cho tam giác $A B C$ có đỉnh $A(1; 4)$ và trực tâm $H(2; 1)$.
Cạnh $B C$ đi qua điểm $M(3; 2)$ và có phương trình dạng $x - 3y + c = 0$.
Tìm giá trị của hệ số tự do $c$.],
    [3],
    loigiai: [
        #step([Tìm vectơ pháp tuyến của BC])
        Cạnh $B C perp A H$ nên nhận vectơ $vec(A H) = (2 - 1; 1 - 4) = (1; -3)$ làm VTPT.
        
        #step([Lập phương trình và xác định c])
        Đường thẳng $B C$ đi qua $M(3; 2)$:
        $ 1(x - 3) - 3(y - 2) = 0 <=> x - 3 - 3y + 6 = 0 <=> x - 3y + 3 = 0 $
        Đối chiếu với dạng $x - 3y + c = 0$, ta được $c = 3$.
    ]
)

] // end make-questions

#make-questions()
