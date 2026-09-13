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
  exam-title: "BÀI 20: VỊ TRÍ TƯƠNG ĐỐI GIỮA HAI ĐƯỜNG THẲNG. GÓC VÀ KHOẢNG CÁCH (ĐỀ SỐ 22A - CƠ BẢN ĐẾN VẬN DỤNG)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "158",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Vị trí tương đối của hai đường thẳng $d_1: 2x - 3y + 5 = 0$ và $d_2: 4x - 6y + 10 = 0$ là],
    (
        True([Trùng nhau]),
        [Song song với nhau],
        [Cắt nhau nhưng không vuông góc],
        [Vuông góc với nhau]
    ),
    loigiai: [
        Xét tỉ số các hệ số của hai đường thẳng:
        $ 2 / 4 = (-3) / (-6) = 5 / 10 = 1 / 2 $
        Vì các tỉ số đều bằng nhau nên hai đường thẳng $d_1$ và $d_2$ trùng nhau.
    ]
)

// TN 2
#tn([Vị trí tương đối của hai đường thẳng $Delta_1: x - 2y + 3 = 0$ và $Delta_2: 2x - 4y + 7 = 0$ là],
    (
        True([Song song với nhau]),
        [Trùng nhau],
        [Cắt nhau],
        [Vuông góc với nhau]
    ),
    loigiai: [
        Xét tỉ số:
        $ 1 / 2 = (-2) / (-4) != 3 / 7 $
        Do đó hai đường thẳng $Delta_1$ và $Delta_2$ song song với nhau.
    ]
)

// TN 3
#tn([Hai đường thẳng $d_1: 3x - y + 2 = 0$ và $d_2: x + 3y - 5 = 0$ có vị trí tương đối là],
    (
        True([Vuông góc với nhau]),
        [Song song với nhau],
        [Trùng nhau],
        [Cắt nhau một góc $45^circ$]
    ),
    loigiai: [
        Vectơ pháp tuyến của hai đường thẳng lần lượt là $vec(n_1) = (3; -1)$ và $vec(n_2) = (1; 3)$.
        Tích vô hướng:
        $ vec(n_1) cdot vec(n_2) = 3(1) + (-1)(3) = 3 - 3 = 0 $
        Vậy hai đường thẳng vuông góc với nhau.
    ]
)

// TN 4
#tn([Khoảng cách từ điểm $M(1; 2)$ đến đường thẳng $Delta: 3x + 4y + 4 = 0$ bằng],
    (
        True([$3$]),
        [$15$],
        [$5$],
        [$2.5$]
    ),
    loigiai: [
        Áp dụng công thức khoảng cách từ một điểm đến đường thẳng:
        $ d(M, Delta) = (|3(1) + 4(2) + 4|) / sqrt(3^2 + 4^2) = (|3 + 8 + 4|) / sqrt(25) = 15 / 5 = 3 $
    ]
)

// TN 5
#tn([Khoảng cách từ gốc tọa độ $O(0; 0)$ đến đường thẳng $d: 5x - 12y + 26 = 0$ bằng],
    (
        True([$2$]),
        [$26$],
        [$13$],
        [$1$]
    ),
    loigiai: [
        $ d(O, d) = (|5(0) - 12(0) + 26|) / sqrt(5^2 + (-12)^2) = 26 / sqrt(169) = 26 / 13 = 2 $
    ]
)

// TN 6
#tn([Cosin của góc giữa hai đường thẳng $d_1: x + 2y - 1 = 0$ và $d_2: 2x - y + 3 = 0$ bằng],
    (
        True([$0$]),
        [$1$],
        [$1 / 2$],
        [$sqrt(2) / 2$]
    ),
    loigiai: [
        Vectơ pháp tuyến: $vec(n_1) = (1; 2)$, $vec(n_2) = (2; -1)$.
        $ cos(d_1, d_2) = (|vec(n_1) cdot vec(n_2)|) / (|vec(n_1)| |vec(n_2)|) = (|1(2) + 2(-1)|) / (sqrt(5) sqrt(5)) = 0 / 5 = 0 $
        (Hai đường thẳng vuông góc với nhau, góc bằng $90^circ$).
    ]
)

// TN 7
#tn([Góc tạo bởi hai đường thẳng $d_1: x - sqrt(3) y + 2 = 0$ và $d_2: sqrt(3) x - y - 1 = 0$ bằng],
    (
        True([$30^circ$]),
        [$60^circ$],
        [$45^circ$],
        [$90^circ$]
    ),
    loigiai: [
        Vectơ pháp tuyến: $vec(n_1) = (1; -sqrt(3))$, $vec(n_2) = (sqrt(3); -1)$.
        $ cos phi = (|1(sqrt(3)) + (-sqrt(3))(-1)|) / (sqrt(1 + 3) sqrt(3 + 1)) = (2 sqrt(3)) / (2 cdot 2) = sqrt(3) / 2 $
        Do đó góc giữa hai đường thẳng là $phi = 30^circ$.
    ]
)

// TN 8
#tn([Khoảng cách giữa hai đường thẳng song song $d_1: 3x - 4y + 1 = 0$ và $d_2: 3x - 4y - 9 = 0$ bằng],
    (
        True([$2$]),
        [$10$],
        [$8$],
        [$1.6$]
    ),
    loigiai: [
        Khoảng cách giữa hai đường thẳng song song:
        $ d(d_1, d_2) = (|c_1 - c_2|) / sqrt(a^2 + b^2) = (|1 - (-9)|) / sqrt(3^2 + (-4)^2) = 10 / 5 = 2 $
    ]
)

// TN 9
#tn([Tìm tất cả các giá trị của tham số $m$ để hai đường thẳng $d_1: (m - 1)x + 2y - 3 = 0$ và $d_2: 2x + y + 1 = 0$ song song với nhau.],
    (
        True([$m = 5$]),
        [$m = 3$],
        [$m = -3$],
        [$m = 1$]
    ),
    loigiai: [
        Hai đường thẳng song song khi:
        $ (m - 1) / 2 = 2 / 1 != (-3) / 1 <=> m - 1 = 4 <=> m = 5 $
    ]
)

// TN 10
#tn([Trong mặt phẳng $O x y$, cho tam giác $A B C$ có $A(1; 1)$ và đường thẳng chứa cạnh $B C$ có phương trình $3x - 4y + 11 = 0$. Độ dài đường cao $A H$ kẻ từ đỉnh $A$ bằng],
    (
        True([$2$]),
        [$10$],
        [$2.5$],
        [$4$]
    ),
    loigiai: [
        Độ dài đường cao $A H$ chính là khoảng cách từ $A$ đến đường thẳng $B C$:
        $ A H = d(A, B C) = (|3(1) - 4(1) + 11|) / sqrt(3^2 + (-4)^2) = (|10|) / 5 = 2 $
    ]
)

// TN 11
#tn([Một trạm phát sóng viễn thông đặt tại điểm $A(2; 3)$. Một tuyến đường quốc lộ thẳng được mô tả bởi đường thẳng $d: 4x + 3y + 8 = 0$ (đơn vị tọa độ là km).
Khoảng cách ngắn nhất từ tuyến đường quốc lộ đến trạm phát sóng là],
    (
        True([$5 text(" km")$]),
        [$25 text(" km")$],
        [$4 text(" km")$],
        [$3 text(" km")$]
    ),
    loigiai: [
        Khoảng cách ngắn nhất từ trạm phát sóng $A$ đến quốc lộ là khoảng cách vuông góc:
        $ d(A, d) = (|4(2) + 3(3) + 8|) / sqrt(4^2 + 3^2) = (|8 + 9 + 8|) / 5 = 25 / 5 = 5 text(" km") $
    ]
)

// TN 12
#tn([Một con tàu hàng hải di chuyển trên biển theo đường thẳng $d: x - 2y + 10 = 0$.
Một ngọn hải đăng đặt tại điểm $O(0; 0)$ trên hòn đảo.
Khi con tàu di chuyển đến vị trí gần ngọn hải đăng nhất thì khoảng cách giữa tàu và ngọn hải đăng bằng],
    (
        True([$2 sqrt(5) text(" hải lý")$]),
        [$5 text(" hải lý")$],
        [$10 text(" hải lý")$],
        [$sqrt(5) text(" hải lý")$]
    ),
    loigiai: [
        Khoảng cách ngắn nhất từ ngọn hải đăng $O$ đến đường đi của con tàu:
        $ d(O, d) = (|0 - 2(0) + 10|) / sqrt(1^2 + (-2)^2) = 10 / sqrt(5) = 2 sqrt(5) text(" hải lý") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Khoảng cách và góc hai đường thẳng vuông góc có CeTZ)
#ds([Cho hai đường thẳng $d_1: 3x - 4y + 5 = 0$ và $d_2: 4x + 3y - 10 = 0$ cùng điểm $A(1; 2)$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-2, 0), (4, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -1), (0, 4.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((3.8, -0.3), [$x$])
  content((-0.3, 4.2), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Đường thẳng d1: 3x - 4y + 5 = 0 -> y = 3/4 x + 5/4
  line((-2, -0.25), (3.6, 3.95), stroke: 1.2pt + rgb("1e40af"))
  content((3.5, 4.3), [$d_1$])
  
  // Đường thẳng d2: 4x + 3y - 10 = 0 -> y = -4/3 x + 10/3
  line((-0.5, 4), (3.2, -0.93), stroke: 1.2pt + red)
  content((3.5, -0.7), [$d_2$])
  
  // Điểm giao cắt A(1; 2)
  circle((1, 2), radius: 2.5pt, fill: rgb("1e40af"))
  content((1.6, 2.2), [$A(1; 2)$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai đường thẳng $d_1$ và $d_2$ vuông góc với nhau.]),
    True([Điểm $A(1; 2)$ nằm trên đường thẳng $d_1$.]),
    True([Điểm $A(1; 2)$ là giao điểm duy nhất của hai đường thẳng $d_1$ và $d_2$.]),
    [Khoảng cách từ điểm $A$ đến đường thẳng $d_2$ bằng $2$.]
  ),
  loigiai: [
    #step([Tính vuông góc])
    $vec(n_1) = (3; -4)$, $vec(n_2) = (4; 3)$.
    $vec(n_1) cdot vec(n_2) = 3(4) + (-4)(3) = 12 - 12 = 0$.
    Do đó hai đường thẳng vuông góc với nhau. Mệnh đề a ĐÚNG.

    #step([Kiểm tra điểm A trên d1])
    Thay $A(1; 2)$ vào phương trình $d_1$:
    $ 3(1) - 4(2) + 5 = 3 - 8 + 5 = 0 $
    Điểm $A$ thuộc đường thẳng $d_1$. Mệnh đề b ĐÚNG.

    #step([Kiểm tra điểm A trên d2])
    Thay $A(1; 2)$ vào phương trình $d_2$:
    $ 4(1) + 3(2) - 10 = 4 + 6 - 10 = 0 $
    Điểm $A$ cũng thuộc đường thẳng $d_2$.
    Vì hai đường thẳng vuông góc nên chúng cắt nhau tại điểm duy nhất là $A(1; 2)$. Mệnh đề c ĐÚNG.

    #step([Khoảng cách từ A đến d2])
    Vì $A in d_2$ nên khoảng cách từ $A$ đến $d_2$ bằng $0$ (chứ không phải bằng $2$).
    Khẳng định khoảng cách bằng $2$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Đường cao, diện tích tam giác)
#ds([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có tọa độ ba đỉnh là $A(3; 5)$, $B(-1; 1)$ và $C(3; -2)$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Độ dài của cạnh $B C$ bằng $5$.]),
    True([Phương trình tổng quát của đường thẳng chứa cạnh $B C$ là $3x + 4y - 1 = 0$.]),
    True([Độ dài đường cao $A H$ kẻ từ đỉnh $A$ của tam giác $A B C$ bằng $5.6$.]),
    [Diện tích của tam giác $A B C$ bằng $28$.]
  ),
  loigiai: [
    #step([Độ dài cạnh BC])
    $vec(B C) = (3 - (-1); -2 - 1) = (4; -3)$.
    $B C = sqrt(4^2 + (-3)^2) = sqrt(16 + 9) = 5$. Mệnh đề a ĐÚNG.

    #step([Phương trình đường thẳng BC])
    Vectơ pháp tuyến $vec(n) = (3; 4)$.
    Phương trình đi qua $B(-1; 1)$:
    $ 3(x + 1) + 4(y - 1) = 0 <=> 3x + 4y - 1 = 0 $. Mệnh đề b ĐÚNG.

    #step([Độ dài đường cao AH])
    $A H = d(A, B C) = (|3(3) + 4(5) - 1|) / sqrt(3^2 + 4^2) = (|9 + 20 - 1|) / 5 = 28 / 5 = 5.6$. Mệnh đề c ĐÚNG.

    #step([Diện tích tam giác ABC])
    $S_(A B C) = 1 / 2 B C cdot A H = 1 / 2 cdot 5 cdot 5.6 = 14$ (chứ không phải $28$).
    Khẳng định diện tích bằng $28$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Hành lang an toàn lưới điện 500kV)
#ds([Một đường dây truyền tải điện cao thế chạy thẳng được quy hoạch theo đường thẳng $Delta: 5x - 12y + 60 = 0$ (mỗi đơn vị trên hệ trục tọa độ tương ứng với $10 text(" m")$).
Quy chuẩn an toàn hành lang lưới điện yêu cầu khoảng cách an toàn từ công trình xây dựng đến đường dây không được nhỏ hơn $20 text(" m")$ (tức $2$ đơn vị tọa độ).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Một vectơ pháp tuyến của đường dây tải điện là $vec(n) = (5; -12)$.]),
    True([Một ngôi nhà dân sinh nằm tại vị trí $M(0; 5)$ nằm trực tiếp dưới đường dây điện ($d(M, Delta) = 0$).]),
    True([Khoảng cách từ một trường tiểu học tại vị trí $T(4; 10)$ đến đường dây điện xấp xỉ bằng $30.8 text(" m")$.]),
    [Ngôi nhà dân sinh tại vị trí $M(0; 5)$ đáp ứng đầy đủ tiêu chuẩn khoảng cách an toàn lưới điện.]
  ),
  loigiai: [
    #step([Vectơ pháp tuyến])
    Từ phương trình $5x - 12y + 60 = 0$, VTPT là $vec(n) = (5; -12)$. Mệnh đề a ĐÚNG.

    #step([Kiểm tra vị trí ngôi nhà M(0; 5)])
    Thay $M(0; 5)$ vào phương trình đường dây điện:
    $ 5(0) - 12(5) + 60 = 0 - 60 + 60 = 0 $
    Khoảng cách $d(M, Delta) = 0 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Khoảng cách từ trường học T(4; 10)])
    $d(T, Delta) = (|5(4) - 12(10) + 60|) / sqrt(5^2 + (-12)^2) = (|20 - 120 + 60|) / 13 = 40 / 13 approx 3.077 text(" đơn vị")$.
    Đổi ra mét: $3.077 times 10 text(" m") approx 30.77 text(" m") approx 30.8 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Đánh giá an toàn])
    Ngôi nhà $M(0; 5)$ có khoảng cách $0 text(" m")$ (nằm ngay dưới đường dây điện), vi phạm nghiêm trọng quy chuẩn hành lang an toàn $>= 20 text(" m")$.
    Khẳng định ngôi nhà đáp ứng an toàn là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Họ đường thẳng phụ thuộc tham số m)
#ds([Cho họ đường thẳng $d_m: (m + 1)x + (m - 1)y - 2m = 0$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khi $m = 1$, đường thẳng có phương trình là $x = 1$.]),
    True([Khi $m = -1$, đường thẳng có phương trình là $y = 1$.]),
    True([Họ đường thẳng $d_m$ luôn đi qua điểm cố định $I(1; 1)$ với mọi giá trị của tham số $m$.]),
    [Khoảng cách từ gốc tọa độ $O(0; 0)$ đến đường thẳng $d_m$ luôn không đổi với mọi giá trị của tham số $m$.]
  ),
  loigiai: [
    #step([Khi m = 1])
    $(1 + 1)x + (1 - 1)y - 2(1) = 0 <=> 2x - 2 = 0 <=> x = 1$. Mệnh đề a ĐÚNG.

    #step([Khi m = -1])
    $(-1 + 1)x + (-1 - 1)y - 2(-1) = 0 <=> -2y + 2 = 0 <=> y = 1$. Mệnh đề b ĐÚNG.

    #step([Điểm cố định])
    Khai triển: $m(x + y - 2) + (x - y) = 0$.
    Điểm cố định thỏa mãn:
    $ cases(x + y - 2 = 0, x - y = 0) <=> cases(x = 1, y = 1) => I(1; 1) $. Mệnh đề c ĐÚNG.

    #step([Khoảng cách từ gốc tọa độ])
    $d(O, d_m) = (|-2m|) / sqrt((m + 1)^2 + (m - 1)^2) = (2|m|) / sqrt(2m^2 + 2) = sqrt((2m^2) / (m^2 + 1))$.
    Khoảng cách này biến thiên theo $m$ (chẳng hạn khi $m = 0$ thì $d = 0$, khi $m = 1$ thì $d = 1$).
    Khẳng định khoảng cách luôn không đổi là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Khoảng cách từ điểm đến đường thẳng)
#tln([Tính khoảng cách từ điểm $A(2; -3)$ đến đường thẳng $d: 3x - 4y + 2 = 0$.],
    [4],
    loigiai: [
        #step([Áp dụng công thức khoảng cách])
        $ d(A, d) = (|3(2) - 4(-3) + 2|) / sqrt(3^2 + (-4)^2) = (|6 + 12 + 2|) / 5 = 20 / 5 = 4 $
    ]
)

// TLN 2 (Khoảng cách giữa hai đường thẳng song song)
#tln([Tính khoảng cách giữa hai đường thẳng song song $d_1: 5x - 12y + 7 = 0$ và $d_2: 5x - 12y - 19 = 0$.],
    [2],
    loigiai: [
        #step([Áp dụng công thức khoảng cách giữa hai đường song song])
        $ d = (|c_1 - c_2|) / sqrt(a^2 + b^2) = (|7 - (-19)|) / sqrt(5^2 + (-12)^2) = 26 / 13 = 2 $
    ]
)

// TLN 3 (Diện tích tam giác)
#tln([Trong bài toán tam giác $A B C$ có độ dài đáy $B C = 5$ và chiều cao $A H = 5.6$, diện tích tam giác $A B C$ bằng bao nhiêu?],
    [14],
    loigiai: [
        #step([Tính diện tích tam giác])
        $ S = 1 / 2 B C cdot A H = 1 / 2 cdot 5 cdot 5.6 = 14 $
    ]
)

// TLN 4 (Khoảng cách từ trạm phát sóng đến quốc lộ)
#tln([Trong bài toán trạm phát sóng viễn thông $A(2; 3)$ và quốc lộ $4x + 3y + 8 = 0$, khoảng cách ngắn nhất từ trạm đến quốc lộ bằng bao nhiêu kilômét?],
    [5],
    loigiai: [
        #step([Tính khoảng cách ngắn nhất])
        $ d(A, d) = (|4(2) + 3(3) + 8|) / sqrt(4^2 + 3^2) = 25 / 5 = 5 text(" km") $
    ]
)

// TLN 5 (Tham số m để hai đường thẳng vuông góc)
#tln([Tìm giá trị của tham số $m$ để hai đường thẳng $d_1: 2x - y + 1 = 0$ và $d_2: x + m y + 2 = 0$ vuông góc với nhau.],
    [2],
    loigiai: [
        #step([Điều kiện hai đường thẳng vuông góc])
        $d_1 perp d_2 <=> a_1 a_2 + b_1 b_2 = 0$:
        $ 2(1) + (-1)(m) = 0 <=> 2 - m = 0 <=> m = 2 $
    ]
)

// TLN 6 (Bình phương khoảng cách từ hải đăng đến tàu)
#tln([Trong bài toán con tàu hải quân di chuyển theo đường thẳng $x - 2y + 10 = 0$, khoảng cách ngắn nhất từ ngọn hải đăng tại gốc tọa độ $O(0; 0)$ đến tàu có bình phương bằng bao nhiêu?],
    [20],
    loigiai: [
        #step([Tính bình phương khoảng cách])
        $ d(O, d) = (|10|) / sqrt(1^2 + (-2)^2) = 10 / sqrt(5) $
        $ d^2 = (10 / sqrt(5))^2 = 100 / 5 = 20 $
    ]
)

] // end make-questions

#make-questions()
