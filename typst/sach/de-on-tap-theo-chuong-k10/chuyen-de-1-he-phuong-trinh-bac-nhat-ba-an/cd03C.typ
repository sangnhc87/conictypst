#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("e11d48") // Ruby/Rose cho Đề 3C

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 1: HỆ PHƯƠNG TRÌNH BẬC NHẤT BA ẨN",
  exam-title: "BÀI 3: MÔ HÌNH KINH TẾ LEONTIEF & QUỸ ĐẠO VẬT LÝ (ĐỀ C)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "309",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong mô hình cân bằng liên ngành Input - Output của Wassily Leontief, ma trận hệ số kỹ thuật đầu vào được ký hiệu là $A = (a_(i j))_(n times n)$. Ý nghĩa kinh tế của phần tử $a_(i j)$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Sơ đồ 3 ngành
    circle((-1.8, -0.6), radius: 0.6, fill: rgb("fff1f2"), stroke: 1.2pt + rgb("e11d48"))
    content((-1.8, -0.6), text(size: 7.5pt, weight: "bold", fill: rgb("9f1239"))[Ngành 1])
    circle((1.8, -0.6), radius: 0.6, fill: rgb("fff1f2"), stroke: 1.2pt + rgb("e11d48"))
    content((1.8, -0.6), text(size: 7.5pt, weight: "bold", fill: rgb("9f1239"))[Ngành 2])
    circle((0, 1.2), radius: 0.6, fill: rgb("fff1f2"), stroke: 1.2pt + rgb("e11d48"))
    content((0, 1.2), text(size: 7.5pt, weight: "bold", fill: rgb("9f1239"))[Ngành 3])
    // Mũi tên luồng
    line((-1.2, -0.6), (1.2, -0.6), stroke: 1pt + rgb("e11d48"), mark: (end: "stealth"))
    content((0, -0.85), text(size: 7pt, fill: rgb("e11d48"))[$x_(1 2)$])
    line((-1.4, -0.1), (-0.4, 0.8), stroke: 1pt + rgb("e11d48"), mark: (end: "stealth"))
    line((0.4, 0.8), (1.4, -0.1), stroke: 1pt + rgb("e11d48"), mark: (end: "stealth"))
  })
]],
    (
        True([Giá trị hàng hóa của ngành $i$ mà ngành $j$ cần sử dụng để sản xuất ra $1$ đơn vị giá trị hàng hóa của ngành $j$]),
        [Giá trị hàng hóa của ngành $j$ mà ngành $i$ cần sử dụng để sản xuất ra $1$ đơn vị giá trị hàng hóa của ngành $i$],
        [Tổng sản lượng của toàn bộ nền kinh tế do ngành $i$ và ngành $j$ đóng góp],
        [Tỷ lệ lợi nhuận thuần của ngành $i$ khi bán hàng hóa cho ngành $j$]
    ),
    loigiai: [
        #step([Khái niệm hệ số chi phí đầu vào])
        Theo định nghĩa của Leontief:
        $ a_(i j) = x_(i j) / x_j $
        Trong đó $x_(i j)$ là giá trị sản phẩm ngành $i$ cung cấp cho ngành $j$, $x_j$ là tổng sản lượng ngành $j$.
        Như vậy $a_(i j)$ là lượng sản phẩm ngành $i$ cần thiết để sản xuất ra $1$ đơn vị sản phẩm ngành $j$.
    ]
)

// TN 2
#tn([Gọi $X = (x_1, x_2, ..., x_n)^T$ là vectơ tổng sản lượng của các ngành, $A$ là ma trận hệ số kỹ thuật, và $D = (d_1, d_2, ..., d_n)^T$ là vectơ cầu cuối cùng của xã hội. Phương trình cân bằng kinh tế Leontief ở dạng ma trận là],
    (
        True([$X = A X + D$]),
        [$X = A D + X$],
        [$D = A X + X$],
        [$X + A X + D = 0$]
    ),
    loigiai: [
        #step([Phương trình cân bằng tổng sản lượng])
        Tổng sản lượng của mỗi ngành bằng tổng lượng sản phẩm tiêu hao làm đầu vào cho các ngành sản xuất cộng với nhu cầu tiêu dùng cuối cùng của xã hội:
        $ X = A X + D <=> (I - A) X = D $
    ]
)

// TN 3
#tn([Khi ma trận $(I - A)$ khả nghịch, vectơ tổng sản lượng $X$ cần thiết để đáp ứng nhu cầu cuối $D$ được tính bằng công thức
$ X = (I - A)^(-1) D $
Ma trận $(I - A)^(-1)$ trong kinh tế học được gọi là],
    (
        True([Ma trận nghịch đảo Leontief (hệ số tiêu hao toàn phần)]),
        [Ma trận hệ số chi phí trực tiếp],
        [Ma trận khấu hao tài sản cố định],
        [Ma trận phân phối thu nhập quốc dân]
    ),
    loigiai: [
        #step([Ý nghĩa ma trận nghịch đảo Leontief])
        Ma trận $B = (I - A)^(-1)$ được gọi là ma trận nghịch đảo Leontief hay ma trận hệ số chi phí toàn phần.
        Mỗi phần tử $b_(i j)$ cho biết lượng sản phẩm ngành $i$ cần tăng thêm khi cầu cuối ngành $j$ tăng $1$ đơn vị.
    ]
)

// TN 4
#tn([Một quả đạn pháo được bắn lên từ mặt đất chuyển động trong trọng trường có quỹ đạo là một đường parabol $y = a x^2 + b x + c$ ($a < 0$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Hệ trục Oxy
    line((-0.5, 0), (4.5, 0), stroke: 1pt, mark: (end: "stealth"))
    content((4.4, -0.3), text(size: 7.5pt)[$x$])
    line((0, -0.5), (0, 3), stroke: 1pt, mark: (end: "stealth"))
    content((-0.3, 2.9), text(size: 7.5pt)[$y$])
    // Quỹ đạo parabol qua (0,0), (2, 2.4), (4,0)
    line((0, 0), (0.5, 1.05), (1, 1.8), (1.5, 2.25), (2, 2.4), (2.5, 2.25), (3, 1.8), (3.5, 1.05), (4, 0), stroke: 1.5pt + rgb("e11d48"))
    circle((2, 2.4), radius: 0.08, fill: rgb("e11d48"))
    content((2, 2.7), text(size: 7.5pt, weight: "bold", fill: rgb("9f1239"))[Đỉnh $I$])
  })
]
Để xác định duy nhất phương trình quỹ đạo parabol này, người ta cần đo tọa độ thực nghiệm của ít nhất bao nhiêu điểm phân biệt trên quỹ đạo?],
    (
        True([$3$ điểm]),
        [$2$ điểm],
        [$1$ điểm],
        [$4$ điểm]
    ),
    loigiai: [
        #step([Số điểm xác định parabol])
        Phương trình parabol $y = a x^2 + b x + c$ có $3$ hệ số chưa biết ($a, b, c$ với $a != 0$).
        Do đó cần tọa độ của ít nhất $3$ điểm phân biệt có hoành độ đôi một khác nhau để lập hệ $3$ phương trình bậc nhất ba ẩn xác định duy nhất $a, b, c$.
    ]
)

// TN 5
#tn([Biết quỹ đạo bay của một vật thể ném xiên có phương trình là $y = -0.05 x^2 + 2 x$ (với $x, y$ tính bằng mét). Độ cao cực đại mà vật đạt được so với mặt đất bằng],
    (
        True([$20" m"$]),
        [$40" m"$],
        [$10" m"$],
        [$25" m"$]
    ),
    loigiai: [
        #step([Tìm tọa độ đỉnh parabol])
        Parabol có $a = -0.05, b = 2, c = 0$.
        Hoành độ đỉnh:
        $ x_I = - b / (2a) = -2 / (2 times (-0.05)) = -2 / (-0.1) = 20" m" $
        Tung độ cực đại (độ cao cực đại):
        $ y_(m a x) = -0.05(20)^2 + 2(20) = -0.05(400) + 40 = -20 + 40 = 20" m" $
    ]
)

// TN 6
#tn([Một xưởng sản xuất sử dụng $3$ loại tài nguyên: Nguyên liệu $A$, Nhân công $B$ và Năng lượng $C$ để làm ra $3$ loại sản phẩm $S_1, S_2, S_3$. Để lập hệ phương trình xác định số lượng sản phẩm mỗi loại cần làm ra nhằm sử dụng hết định mức tài nguyên, phương pháp giải tối ưu trong toán học là],
    (
        True([Lập hệ phương trình bậc nhất ba ẩn và khử bằng phương pháp Gauss]),
        [Giải phương trình bậc ba ẩn $x$],
        [Sử dụng bất đẳng thức Cauchy - Schwarz],
        [Khảo sát sự biến thiên của hàm đa thức]
    ),
    loigiai: [
        #step([Mô hình toán học hóa bài toán sản xuất])
        Mỗi tài nguyên tạo thành một phương trình cân bằng tuyến tính về định mức tiêu hao:
        $ a_(i 1) x_1 + a_(i 2) x_2 + a_(i 3) x_3 = b_i quad (i = 1, 2, 3) $
        Đây là hệ ba phương trình bậc nhất ba ẩn, giải bằng phương pháp khử Gauss.
    ]
)

// TN 7
#tn([Một điều kiện đủ quan trọng để mô hình kinh tế Leontief có nghiệm tổng sản lượng dương có ý nghĩa thực tế ($X > 0$ với mọi $D >= 0$) là tổng các phần tử trên mỗi cột của ma trận hệ số kỹ thuật $A$ thỏa mãn],
    (
        True([$sum_(i=1)^n a_(i j) < 1$ với mọi cột $j$]),
        [$sum_(i=1)^n a_(i j) > 1$ với mọi cột $j$],
        [$sum_(i=1)^n a_(i j) = 1$ với mọi cột $j$],
        [$a_(i j) < 0$ với mọi $i, j$]
    ),
    loigiai: [
        #step([Điều kiện nền kinh tế sinh lợi (khả thi)])
        Tổng chi phí trung gian để sản xuất $1$ đơn vị giá trị hàng hóa của ngành $j$ là $sum_(i=1)^n a_(i j)$.
        Để nền kinh tế hoạt động có lãi và tạo ra giá trị thặng dư (tiêu dùng cuối cùng dương), tổng chi phí trung gian phải nhỏ hơn giá trị sản phẩm tạo ra:
        $ sum_(i=1)^n a_(i j) < 1 $
    ]
)

// TN 8
#tn([Một vật chuyển động thẳng biến đổi đều có phương trình tọa độ theo thời gian:
$ s(t) = 1/2 a t^2 + v_0 t + s_0 $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, 0), (2.5, 0), stroke: 1.2pt, mark: (end: "stealth"))
    content((2.4, -0.3), text(size: 7.5pt)[$s" (m)"$])
    circle((-1.5, 0), radius: 0.08, fill: rgb("e11d48"))
    content((-1.5, 0.3), text(size: 7pt)[$t_1$])
    circle((0, 0), radius: 0.08, fill: rgb("e11d48"))
    content((0, 0.3), text(size: 7pt)[$t_2$])
    circle((1.8, 0), radius: 0.08, fill: rgb("e11d48"))
    content((1.8, 0.3), text(size: 7pt)[$t_3$])
  })
]
Biết tại $t = 1" s"$, vật ở vị trí $s = 6" m"$; tại $t = 2" s"$, $s = 15" m"$; tại $t = 3" s"$, $s = 28" m"$. Phương trình bậc nhất biểu thị vị trí tại $t = 1" s"$ theo các ẩn $X = 1/2 a, Y = v_0, Z = s_0$ là],
    (
        True([$X + Y + Z = 6$]),
        [$X + 2Y + Z = 6$],
        [$2X + Y + Z = 6$],
        [$X + Y + 2Z = 6$]
    ),
    loigiai: [
        #step([Thay giá trị t vào phương trình tọa độ])
        Với $t = 1$:
        $ s(1) = 1/2 a (1)^2 + v_0 (1) + s_0 = X + Y + Z = 6 $
    ]
)

// TN 9
#tn([Một nhà đầu tư phân bổ tổng số vốn $S = 600$ triệu đồng vào ba kênh: Trái phiếu chính phủ ($x$), Tiết kiệm ngân hàng ($y$) và Cổ phiếu ($z$). Biết số tiền gửi tiết kiệm gấp đôi số tiền mua trái phiếu. Phương trình đại số thể hiện mối quan hệ này là],
    (
        True([$2x - y = 0$]),
        [$x - 2y = 0$],
        [$2x + y = 0$],
        [$x + 2y = 0$]
    ),
    loigiai: [
        #step([Biểu diễn mối quan hệ đại số])
        Số tiền tiết kiệm gấp đôi trái phiếu:
        $ y = 2x <=> 2x - y = 0 $
    ]
)

// TN 10
#tn([Cho parabol $y = a x^2 + b x + c$ đi qua gốc tọa độ $O(0; 0)$. Khi đó giá trị của hệ số tự do $c$ là],
    (
        True([$c = 0$]),
        [$c = 1$],
        [$c = -1$],
        [$c$ nhận giá trị tùy ý]
    ),
    loigiai: [
        #step([Thay tọa độ gốc O vào phương trình])
        Điểm $O(0; 0)$ thuộc parabol:
        $ 0 = a(0)^2 + b(0) + c <=> c = 0 $
    ]
)

// TN 11
#tn([Trong mô hình Leontief gồm $2$ ngành, biết ma trận hệ số kỹ thuật là $A = mat(0.2, 0.3; 0.4, 0.1)$. Ma trận $(I - A)$ là],
    (
        True([$mat(0.8, -0.3; -0.4, 0.9)$]),
        [$mat(-0.2, -0.3; -0.4, -0.1)$],
        [$mat(1.2, 0.3; 0.4, 1.1)$],
        [$mat(0.8, 0.3; 0.4, 0.9)$]
    ),
    loigiai: [
        #step([Trừ ma trận đơn vị])
        $ I - A = mat(1, 0; 0, 1) - mat(0.2, 0.3; 0.4, 0.1) = mat(1 - 0.2, 0 - 0.3; 0 - 0.4, 1 - 0.1) = mat(0.8, -0.3; -0.4, 0.9) $
    ]
)

// TN 12
#tn([Tầm bay xa $L$ của một quả cầu ném xiên từ mặt đất với phương trình quỹ đạo $y = -0.1 x^2 + 1.6 x$ (khi vật chạm lại mặt đất $y = 0, x > 0$) bằng],
    (
        True([$16" m"$]),
        [$8" m"$],
        [$32" m"$],
        [$12" m"$]
    ),
    loigiai: [
        #step([Tìm giao điểm của quỹ đạo với mặt đất y = 0])
        $ -0.1 x^2 + 1.6 x = 0 <=> x(-0.1 x + 1.6) = 0 $
        Vì $x > 0$, ta có:
        $ -0.1 x + 1.6 = 0 <=> 0.1 x = 1.6 <=> x = 16" m" $
        Vậy tầm bay xa $L = 16" m"$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Một nền kinh tế đơn giản gồm $3$ ngành: Nông nghiệp ($N_1$), Công nghiệp ($N_2$) và Dịch vụ ($N_3$). Ma trận hệ số kỹ thuật đầu vào và vectơ cầu cuối cùng lần lượt là:
$ A = mat(
  0.2, 0.1, 0.2;
  0.3, 0.4, 0.1;
  0.1, 0.2, 0.3
), quad D = mat(40; 60; 80) $
(đơn vị tính: triệu USD).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.5), (2.5, 0.5), fill: rgb("fff1f2"), stroke: 1.2pt + rgb("e11d48"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("9f1239"))[Mô hình cân bằng Leontief $(I - A)X = D$])
  })
]],
  (
    True([Ma trận $(I - A) = mat(0.8, -0.1, -0.2; -0.3, 0.6, -0.1; -0.1, -0.2, 0.7)$.]),
    True([Tổng chi phí trung gian trên mỗi cột của $A$ đều nhỏ hơn $1$.]),
    True([Phương trình cân bằng tổng sản lượng cho ngành Nông nghiệp là $0.8 x_1 - 0.1 x_2 - 0.2 x_3 = 40$.]),
    [Nhu cầu tổng sản lượng của ngành Nông nghiệp là $x_1 = 100$ triệu USD.]
  ),
  loigiai: [
    #step([Tìm ma trận I - A])
    $ I - A = mat(1, 0, 0; 0, 1, 0; 0, 0, 1) - mat(0.2, 0.1, 0.2; 0.3, 0.4, 0.1; 0.1, 0.2, 0.3) = mat(0.8, -0.1, -0.2; -0.3, 0.6, -0.1; -0.1, -0.2, 0.7) $
    Mệnh đề a ĐÚNG.
    #step([Kiểm tra điều kiện kinh tế khả thi])
    - Cột 1: $0.2 + 0.3 + 0.1 = 0.6 < 1$.
    - Cột 2: $0.1 + 0.4 + 0.2 = 0.7 < 1$.
    - Cột 3: $0.2 + 0.1 + 0.3 = 0.6 < 1$.
    Tất cả các cột đều có tổng nhỏ hơn $1$, nền kinh tế sinh lợi khả thi (Ý b ĐÚNG).
    #step([Phương trình hàng 1])
    Từ $(I - A) X = D$, hàng 1 cho ta:
    $ 0.8 x_1 - 0.1 x_2 - 0.2 x_3 = 40 $ (Ý c ĐÚNG).
    #step([Giải tìm sản lượng x1])
    Cộng ba phương trình:
    $ (0.8 - 0.3 - 0.1) x_1 + (-0.1 + 0.6 - 0.2) x_2 + (-0.2 - 0.1 + 0.7) x_3 = 40 + 60 + 80 $
    $ <=> 0.4 x_1 + 0.3 x_2 + 0.4 x_3 = 180 $
    Giải chi tiết hệ phương trình:
    Nhân 10:
    $ cases(
      8 x_1 - x_2 - 2 x_3 = 400,
      -3 x_1 + 6 x_2 - x_3 = 600,
      -x_1 - 2 x_2 + 7 x_3 = 800
    ) $
    Nghiệm $x_1$ xấp xỉ $180$ triệu USD chứ không phải $100$. Ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Một quả bóng được đá bay lên không trung từ vị trí $A(0; 1)$ (độ cao ban đầu $1" m"$). Bóng bay theo quỹ đạo parabol $y = a x^2 + b x + c$ và được ghi nhận qua hai điểm tiếp theo là $B(10; 6)$ và $C(20; 9)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), stroke: 1pt, mark: (end: "stealth"))
    content((4.4, -0.3), text(size: 7.5pt)[$x$])
    line((0, -0.5), (0, 2.5), stroke: 1pt, mark: (end: "stealth"))
    content((-0.3, 2.4), text(size: 7.5pt)[$y$])
    // 3 điểm
    circle((0, 0.3), radius: 0.08, fill: rgb("e11d48"))
    content((-0.4, 0.3), text(size: 7pt)[$A(0;1)$])
    circle((1.5, 1.2), radius: 0.08, fill: rgb("e11d48"))
    content((1.5, 1.5), text(size: 7pt)[$B(10;6)$])
    circle((3, 1.8), radius: 0.08, fill: rgb("e11d48"))
    content((3, 2.1), text(size: 7pt)[$C(20;9)$])
  })
]],
  (
    True([Hệ số tự do của phương trình quỹ đạo là $c = 1$.]),
    True([Hệ hai phương trình cho hai điểm $B$ và $C$ là $cases(100 a + 10 b = 5, 400 a + 20 b = 8)$.]),
    True([Hệ số bậc hai có giá trị âm là $a = -0.01$.]),
    [Độ cao cực đại của quả bóng bằng $12" m"$.]
  ),
  loigiai: [
    #step([Xác định các hệ số của Parabol])
    - Điểm $A(0; 1) => c = 1$ (Ý a ĐÚNG).
    - Điểm $B(10; 6) => a(10)^2 + b(10) + 1 = 6 <=> 100 a + 10 b = 5$.
    - Điểm $C(20; 9) => a(20)^2 + b(20) + 1 = 9 <=> 400 a + 20 b = 8$.
    Hệ hai phương trình hoàn toàn chính xác (Ý b ĐÚNG).
    #step([Giải hệ tìm a và b])
    Nhân 2 phương trình thứ nhất: $200 a + 20 b = 10$.
    Trừ phương trình thứ hai cho phương trình này:
    $ 200 a = 8 - 10 = -2 <=> a = -2 / 200 = -0.01 $ (Ý c ĐÚNG).
    Suy ra $10 b = 5 - 100(-0.01) = 5 - (-1) = 6 <=> b = 0.6$.
    Phương trình quỹ đạo:
    $ y = -0.01 x^2 + 0.6 x + 1 $
    #step([Tìm độ cao cực đại])
    Đỉnh parabol có hoành độ: $x_I = - 0.6 / (2 times (-0.01)) = 30" m"$.
    Độ cao cực đại:
    $ y_(m a x) = -0.01(30)^2 + 0.6(30) + 1 = -9 + 18 + 1 = 10" m" != 12" m" $
    Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Một doanh nghiệp sản xuất $3$ loại sản phẩm $A, B, C$. Để sản xuất $1$ tấn sản phẩm mỗi loại cần lượng nguyên liệu than đá, quặng sắt và điện năng như sau:
- $1$ tấn $A$: cần $1$ tấn than, $2$ tấn quặng, $3" MWh"$ điện.
- $1$ tấn $B$: cần $2$ tấn than, $1$ tấn quặng, $4" MWh"$ điện.
- $1$ tấn $C$: cần $1$ tấn than, $1$ tấn quặng, $2" MWh"$ điện.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.6), (2.4, 0.6), fill: rgb("fff1f2"), stroke: 1.2pt + rgb("e11d48"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("9f1239"))[Kế hoạch cung ứng sản xuất 3 sản phẩm])
  })
]
Biết kho dự trữ có $10$ tấn than, $11$ tấn quặng và $25" MWh"$ điện. Doanh nghiệp muốn dùng hết lượng tài nguyên dự trữ này.],
  (
    True([Phương trình bảo toàn nguyên liệu than đá là $x + 2y + z = 10$.]),
    True([Phương trình bảo toàn nguyên liệu quặng sắt là $2x + y + z = 11$.]),
    True([Phương trình bảo toàn điện năng là $3x + 4y + 2z = 25$.]),
    [Số lượng sản phẩm loại $C$ cần sản xuất là $z = 5$ tấn.]
  ),
  loigiai: [
    #step([Lập hệ phương trình bảo toàn tài nguyên])
    Gọi $x, y, z$ (tấn) lần lượt là sản lượng sản phẩm $A, B, C$ ($x, y, z >= 0$).
    - Than đá: $1x + 2y + 1z = 10$ (Ý a ĐÚNG).
    - Quặng sắt: $2x + 1y + 1z = 11$ (Ý b ĐÚNG).
    - Điện năng: $3x + 4y + 2z = 25$ (Ý c ĐÚNG).
    #step([Giải hệ phương trình bằng khử Gauss])
    Trừ (2) cho (1): $(2x + y + z) - (x + 2y + z) = 11 - 10 <=> x - y = 1 <=> x = y + 1$.
    Thay $z = 10 - x - 2y = 10 - (y + 1) - 2y = 9 - 3y$ vào (3):
    $ 3(y + 1) + 4y + 2(9 - 3y) = 25 $
    $ <=> 3y + 3 + 4y + 18 - 6y = 25 <=> y + 21 = 25 <=> y = 4 $
    Suy ra:
    $ x = 4 + 1 = 5 $ (tấn)
    $ z = 9 - 3(4) = -3 $
    Ồ, $z = -3 < 0$, như vậy kho dự trữ không thể sản xuất nguyên vẹn hết mà không dư thừa tài nguyên. Do đó $z = 5$ là SAI (Ý d SAI).
  ]
)

// DS 4 (Câu 16)
#ds([Một nhà tài chính đầu tư tổng cộng $1$ tỷ đồng ($1000$ triệu đồng) vào ba quỹ:
- Quỹ cổ phiếu tăng trưởng ($x$) lãi suất dự kiến $12\%/"năm"$.
- Quỹ trái phiếu doanh nghiệp ($y$) lãi suất dự kiến $8\%/"năm"$.
- Quỹ gửi tiết kiệm kỳ hạn ($z$) lãi suất dự kiến $6\%/"năm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("fff1f2"), stroke: 1.2pt + rgb("e11d48"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("9f1239"))[Cơ cấu danh mục đầu tư tài chính])
  })
]
Mục tiêu là thu về tổng lợi nhuận hàng năm là $88$ triệu đồng, đồng thời số tiền đầu tư vào cổ phiếu bằng tổng số tiền đầu tư vào hai quỹ còn lại.],
  (
    True([Phương trình tổng vốn đầu tư là $x + y + z = 1000$.]),
    True([Phương trình cơ cấu vốn là $x - y - z = 0$.]),
    True([Số tiền đầu tư vào quỹ cổ phiếu tăng trưởng là $x = 500$ triệu đồng.]),
    [Số tiền đầu tư vào quỹ trái phiếu doanh nghiệp là $y = 300$ triệu đồng.]
  ),
  loigiai: [
    #step([Thiết lập hệ phương trình])
    - Tổng vốn: $x + y + z = 1000$ (Ý a ĐÚNG).
    - Cổ phiếu bằng tổng hai quỹ kia: $x = y + z <=> x - y - z = 0$ (Ý b ĐÚNG).
    - Lợi nhuận: $0.12 x + 0.08 y + 0.06 z = 88$.
    #step([Giải hệ phương trình])
    Cộng phương trình 1 và 2:
    $ 2x = 1000 <=> x = 500 $ triệu đồng (Ý c ĐÚNG).
    Suy ra $y + z = 500 <=> z = 500 - y$.
    Thay vào phương trình lợi nhuận:
    $ 0.12(500) + 0.08 y + 0.06(500 - y) = 88 $
    $ <=> 60 + 0.08 y + 30 - 0.06 y = 88 $
    $ <=> 90 + 0.02 y = 88 <=> 0.02 y = -2 $
    Ta thấy $y = -100 < 0$, điều này chứng tỏ với tỷ suất lợi nhuận $88$ triệu đồng thì không có phương án phân bổ vốn dương.
    Giá trị $y = 300$ là SAI (Ý d SAI).
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho ma trận hệ số kỹ thuật của nền kinh tế gồm $3$ ngành:
$ A = mat(
  0.1, 0.2, 0.1;
  0.2, 0.1, 0.2;
  0.1, 0.3, 0.2
) $
Vectơ cầu cuối cùng là $D = mat(26; 50; 40)$ (tỷ đồng).
Nếu ngành $2$ có tổng sản lượng là $x_2 = 100$ tỷ đồng, ngành $3$ có tổng sản lượng $x_3 = 80$ tỷ đồng, thì tổng sản lượng của ngành $1$ ($x_1$) phải đạt bao nhiêu tỷ đồng để cân bằng thị trường hàng hóa ngành $1$?],
    [60],
    loigiai: [
        #step([Viết phương trình cân bằng cho ngành 1])
        Theo phương trình cân bằng Leontief:
        $ x_1 = a_(1 1) x_1 + a_(1 2) x_2 + a_(1 3) x_3 + d_1 $
        $ <=> (1 - a_(1 1)) x_1 = a_(1 2) x_2 + a_(1 3) x_3 + d_1 $
        Thay các giá trị số vào:
        $ (1 - 0.1) x_1 = 0.2(100) + 0.1(80) + 26 $
        $ <=> 0.9 x_1 = 20 + 8 + 26 = 54 $
        $ <=> x_1 = 54 / 0.9 = 60 $ tỷ đồng.
    ]
)

// TLN 2 (Câu 18)
#tln([Một cầu thủ sút phạt đưa quả bóng bay theo quỹ đạo parabol $y = a x^2 + b x + c$. Bóng xuất phát từ mặt đất tại điểm $O(0; 0)$, đạt độ cao $8" m"$ khi cách điểm sút $10" m"$, và rơi xuống mặt đất tại điểm cách điểm sút $30" m"$.
Độ cao cực đại mà quả bóng đạt được trong quỹ đạo bay bằng bao nhiêu mét?],
    [9],
    loigiai: [
        #step([Xác định phương trình parabol])
        - Parabol qua gốc $O(0; 0) => c = 0$.
        - Qua điểm chạm đất $(30; 0) => a(30)^2 + 30 b = 0 <=> 900 a + 30 b = 0 <=> b = -30 a$.
        - Qua điểm $(10; 8)$:
        $ a(10)^2 + b(10) = 8 <=> 100 a + 10(-30 a) = 8 <=> -200 a = 8 <=> a = -0.04 $
        Suy ra $b = -30(-0.04) = 1.2$.
        Phương trình quỹ đạo: $y = -0.04 x^2 + 1.2 x$.
        #step([Tính độ cao cực đại])
        Do tính đối xứng, đỉnh parabol nằm tại trung điểm của khoảng cách rơi:
        $ x_I = (0 + 30) / 2 = 15" m" $
        Độ cao cực đại của quả bóng là:
        $ y_(m a x) = -0.04(15)^2 + 1.2(15) = -9 + 18 = 9" m" $
    ]
)

// TLN 3 (Câu 19)
#tln([Một xưởng cơ khí có $3$ loại máy tiện $M_1, M_2, M_3$. Mỗi giờ hoạt động của từng máy tạo ra các chi tiết theo định mức:
- Máy $M_1$: tạo ra $3$ chi tiết loại $A$, $1$ chi tiết loại $B$, $2$ chi tiết loại $C$.
- Máy $M_2$: tạo ra $1$ chi tiết loại $A$, $4$ chi tiết loại $B$, $1$ chi tiết loại $C$.
- Máy $M_3$: tạo ra $2$ chi tiết loại $A$, $2$ chi tiết loại $B$, $5$ chi tiết loại $C$.
Xưởng cần hoàn thành đơn hàng gồm đúng $28$ chi tiết $A$, $38$ chi tiết $B$ và $39$ chi tiết $C$.
Số giờ máy $M_1$ cần hoạt động là bao nhiêu giờ?],
    [4],
    loigiai: [
        #step([Lập hệ phương trình bậc nhất ba ẩn])
        Gọi $x, y, z$ (giờ) là thời gian hoạt động của các máy $M_1, M_2, M_3$ ($x, y, z >= 0$).
        $ cases(
          3x + y + 2z = 28,
          x + 4y + 2z = 38,
          2x + y + 5z = 39
        ) $
        #step([Khử Gauss giải hệ])
        Lấy phương trình thứ hai trừ phương trình thứ nhất:
        $ (x + 4y + 2z) - (3x + y + 2z) = 38 - 28 <=> -2x + 3y = 10 <=> 3y = 2x + 10 $
        Lấy $5 times (1) - 2 times (3)$:
        $ 5(3x + y + 2z) - 2(2x + y + 5z) = 5(28) - 2(39) $
        $ <=> 11x + 3y = 140 - 78 = 62 $
        Thay $3y = 2x + 10$ vào:
        $ 11x + (2x + 10) = 62 <=> 13x = 52 <=> x = 4 $ (giờ).
        Suy ra $y = 6$ giờ và $z = 5$ giờ.
        Vậy máy $M_1$ cần hoạt động $x = 4$ giờ.
    ]
)

// TLN 4 (Câu 20)
#tln([Một ô tô bắt đầu chuyển động biến đổi đều, quãng đường đi được sau thời gian $t$ giây thỏa mãn công thức:
$ s(t) = a t^2 + b t + c quad (a, b, c "là các hằng số") $
Người ta đo được:
- Sau $1$ giây đầu tiên, xe đi được $4" m"$.
- Sau $2$ giây, tổng quãng đường xe đi được là $12" m"$.
- Sau $3$ giây, tổng quãng đường xe đi được là $24" m"$.
Gia tốc của ô tô bằng bao nhiêu $"m/s"^2$ (biết gia tốc trong chuyển động thẳng biến đổi đều là $2a$)?],
    [4],
    loigiai: [
        #step([Lập hệ phương trình ba ẩn])
        Tại $t = 0$, xe chưa chuyển động nên $s(0) = c = 0$.
        Hệ phương trình với $a, b$:
        - $t = 1 => a(1)^2 + b(1) = 4 <=> a + b = 4$.
        - $t = 2 => a(2)^2 + b(2) = 12 <=> 4a + 2b = 12 <=> 2a + b = 6$.
        - $t = 3 => a(3)^2 + b(3) = 24 <=> 9a + 3b = 24 <=> 3a + b = 8$.
        #step([Giải tìm gia tốc])
        Lấy $(2a + b) - (a + b) = 6 - 4 <=> a = 2$.
        Thay vào $a + b = 4 => b = 2$.
        Gia tốc của chuyển động là:
        $ gamma = 2a = 2(2) = 4" m/s"^2 $
    ]
)

// TLN 5 (Câu 21)
#tln([Một tháp nước được cung cấp bởi ba máy bơm $P_1, P_2, P_3$.
- Nếu cả máy $P_1$ và $P_2$ cùng bơm thì sau $12$ giờ đầy tháp.
- Nếu cả máy $P_2$ và $P_3$ cùng bơm thì sau $15$ giờ đầy tháp.
- Nếu cả máy $P_1$ và $P_3$ cùng bơm thì sau $20$ giờ đầy tháp.
Nếu mở cả ba máy bơm cùng hoạt động đồng thời, thì sau bao nhiêu giờ tháp nước sẽ đầy?],
    [10],
    loigiai: [
        #step([Lập phương trình năng suất bơm])
        Gọi năng suất bơm trong một giờ của ba máy lần lượt là $x, y, z$ (tháp/giờ).
        $ cases(
          x + y = 1/12,
          y + z = 1/15,
          x + z = 1/20
        ) $
        #step([Tính tổng năng suất])
        Cộng cả ba phương trình lại:
        $ 2(x + y + z) = 1/12 + 1/15 + 1/20 = 5/60 + 4/60 + 3/60 = 12/60 = 1/5 $
        Suy ra năng suất của cả ba máy khi bơm đồng thời:
        $ x + y + z = (1/5) / 2 = 1/10 " tháp/giờ" $
        Thời gian để cả ba máy cùng bơm đầy tháp là:
        $ T = 1 / (1/10) = 10 " giờ" $
    ]
)

// TLN 6 (Câu 22)
#tln([Một gia đình dự định xây một bể bơi gia đình có mặt cắt thẳng đứng dạng một parabol. Bề mặt thoáng của bể bơi rộng $6" m"$, độ sâu lớn nhất của bể bơi ở chính giữa là $2" m"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Mặt nước
    line((-3, 0), (3, 0), stroke: 1.5pt + rgb("0284c7"))
    content((0, 0.3), text(size: 7.5pt, fill: rgb("0284c7"))[Mặt nước: $6" m"$])
    // Đáy parabol
    line((-3, 0), (-2, -1.1), (-1, -1.78), (0, -2), (1, -1.78), (2, -1.1), (3, 0), stroke: 1.5pt + rgb("e11d48"))
    // Độ sâu
    line((0, 0), (0, -2), stroke: (dash: "dashed", paint: rgb("e11d48")), mark: (end: "stealth", start: "stealth"))
    content((0.5, -1), text(size: 7.5pt, fill: rgb("9f1239"))[$2" m"$])
  })
]
Tại vị trí cách mép bể $1" m"$, độ sâu của bể bơi bằng bao nhiêu mét? (Kết quả làm tròn đến hàng phần mười).],
    [1.1],
    loigiai: [
        #step([Chọn hệ trục tọa độ])
        Chọn gốc tọa độ $O$ tại điểm sâu nhất ở đáy bể (đỉnh parabol).
        Trục $O y$ hướng thẳng đứng lên trên, trục $O x$ nằm ngang.
        Phương trình parabol có dạng:
        $ y = a x^2 $
        Mặt nước ở độ cao $y = 2" m"$ và rộng $6" m"$, nên hai mép nước có tọa độ là $(-3; 2)$ và $(3; 2)$.
        #step([Xác định hệ số a])
        Thay $(3; 2)$ vào:
        $ 2 = a(3)^2 <=> 9a = 2 <=> a = 2/9 $
        Phương trình đáy bể: $y = 2/9 x^2$.
        #step([Tính độ sâu tại vị trí cách mép 1 m])
        Vị trí cách mép bể $1" m"$ ứng với khoảng cách đến trục đối xứng $O y$ là:
        $ x = 3 - 1 = 2" m" $
        Tung độ đáy bể tại vị trí này:
        $ y = 2/9 (2)^2 = 8/9" m" $
        Độ sâu của nước tại điểm đó (khoảng cách từ mặt nước $y = 2$ xuống đáy bể):
        $ h = 2 - 8/9 = 10/9 approx 1.11" m" $
        Làm tròn đến hàng phần mười, kết quả là $1.1" m"$.
    ]
)

] // end make-questions

#make-questions()
