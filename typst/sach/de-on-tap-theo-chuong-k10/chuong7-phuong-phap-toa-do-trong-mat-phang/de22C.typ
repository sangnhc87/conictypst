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
  exam-title: "BÀI 20: VỊ TRÍ TƯƠNG ĐỐI GIỮA HAI ĐƯỜNG THẲNG. GÓC VÀ KHOẢNG CÁCH (ĐỀ SỐ 22C - NÂNG CAO & VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "160",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cosin của góc giữa hai đường thẳng $d_1: 2x - y + 3 = 0$ và $d_2: x + 3y - 1 = 0$ bằng],
    (
        True([$sqrt(2) / 10$]),
        [$sqrt(2) / 5$],
        [$1 / 2$],
        [$sqrt(3) / 2$]
    ),
    loigiai: [
        Vectơ pháp tuyến: $vec(n_1) = (2; -1)$ và $vec(n_2) = (1; 3)$.
        $ cos(d_1, d_2) = (|2(1) + (-1)(3)|) / (sqrt(2^2 + (-1)^2) sqrt(1^2 + 3^2)) = (|-1|) / (sqrt(5) sqrt(10)) = 1 / (5 sqrt(2)) = sqrt(2) / 10 $
    ]
)

// TN 2
#tn([Cho tam giác $A B C$ có ba cạnh lần lượt nằm trên các đường thẳng $d_1: 3x - 4y + 1 = 0$, $d_2: 4x + 3y - 5 = 0$ và $d_3: x + 2y - 3 = 0$. Tam giác $A B C$ là],
    (
        True([Tam giác vuông]),
        [Tam giác đều],
        [Tam giác cân nhưng không vuông],
        [Tam giác vuông cân]
    ),
    loigiai: [
        Xét hai đường thẳng $d_1$ và $d_2$:
        $vec(n_1) = (3; -4)$, $vec(n_2) = (4; 3)$.
        Ta có: $vec(n_1) cdot vec(n_2) = 3(4) + (-4)(3) = 12 - 12 = 0$.
        Suy ra $d_1 perp d_2$, do đó tam giác $A B C$ là tam giác vuông.
    ]
)

// TN 3
#tn([Tìm giá trị của tham số $m$ để khoảng cách từ điểm $M(2; 1)$ đến đường thẳng $d: 3x + 4y + m = 0$ bằng khoảng cách từ điểm $N(0; 3)$ đến đường thẳng đó (với $M$ và $N$ nằm về hai phía khác nhau so với đường thẳng $d$).],
    (
        True([$m = -11$]),
        [$m = 11$],
        [$m = -10$],
        [$m = 10$]
    ),
    loigiai: [
        Khoảng cách:
        $ d(M, d) = (|3(2) + 4(1) + m|) / 5 = (|m + 10|) / 5 $
        $ d(N, d) = (|3(0) + 4(3) + m|) / 5 = (|m + 12|) / 5 $
        Vì $d(M, d) = d(N, d)$ và hai điểm nằm về hai phía khác nhau nên:
        $ m + 10 = -(m + 12) <=> 2m = -22 <=> m = -11 $
    ]
)

// TN 4
#tn([Cho hai đường thẳng song song $d_1: 5x - 12y + 1 = 0$ và $d_2: 5x - 12y - 25 = 0$. Đường thẳng song song và cách đều $d_1, d_2$ có phương trình là],
    (
        True([$5x - 12y - 12 = 0$]),
        [$5x - 12y + 12 = 0$],
        [$5x - 12y - 13 = 0$],
        [$5x - 12y = 0$]
    ),
    loigiai: [
        Đường thẳng cách đều hai đường song song $a x + b y + c_1 = 0$ và $a x + b y + c_2 = 0$ có phương trình:
        $ a x + b y + (c_1 + c_2) / 2 = 0 $
        Thay số: $c = (1 + (-25)) / 2 = -12$.
        Phương trình là: $5x - 12y - 12 = 0$.
    ]
)

// TN 5
#tn([Điểm $P(0; y_0)$ nằm trên trục tung $O y$ cách đều hai đường thẳng $d_1: 3x - 4y + 1 = 0$ và $d_2: 4x + 3y - 2 = 0$. Giá trị âm của tung độ $y_0$ là],
    (
        True([$y_0 = -1$]),
        [$y_0 = - 3 / 7$],
        [$y_0 = -2$],
        [$y_0 = - 1 / 2$]
    ),
    loigiai: [
        Khoảng cách:
        $ d(P, d_1) = (|-4y_0 + 1|) / 5; quad d(P, d_2) = (|3y_0 - 2|) / 5 $
        Cho hai khoảng cách bằng nhau:
        $ |-4y_0 + 1| = |3y_0 - 2| <=> cases(-4y_0 + 1 = 3y_0 - 2 <=> 7y_0 = 3 <=> y_0 = 3 / 7, -4y_0 + 1 = -(3y_0 - 2) <=> -y_0 = 1 <=> y_0 = -1) $
        Giá trị âm là $y_0 = -1$.
    ]
)

// TN 6
#tn([Cho tam giác đều $A B C$ có độ dài cạnh bằng $6$. Khoảng cách từ trọng tâm $G$ của tam giác đến một cạnh bất kỳ bằng],
    (
        True([$sqrt(3)$]),
        [$2 sqrt(3)$],
        [$3 sqrt(3)$],
        [$3$]
    ),
    loigiai: [
        Chiều cao tam giác đều: $h = (6 sqrt(3)) / 2 = 3 sqrt(3)$.
        Trọng tâm $G$ cách đều ba cạnh một khoảng bằng bán kính đường tròn nội tiếp:
        $ r = h / 3 = (3 sqrt(3)) / 3 = sqrt(3) $
    ]
)

// TN 7
#tn([Tập hợp các điểm $M(x; y)$ cách đường thẳng $d: 3x - 4y + 2 = 0$ một khoảng bằng $2$ là hai đường thẳng có phương trình là],
    (
        True([$3x - 4y + 12 = 0$ và $3x - 4y - 8 = 0$]),
        [$3x - 4y + 10 = 0$ và $3x - 4y - 10 = 0$],
        [$4x + 3y + 12 = 0$ và $4x + 3y - 8 = 0$],
        [$3x - 4y + 8 = 0$ và $3x - 4y - 12 = 0$]
    ),
    loigiai: [
        $ d(M, d) = (|3x - 4y + 2|) / 5 = 2 <=> |3x - 4y + 2| = 10 $
        $ <=> cases(3x - 4y + 2 = 10 <=> 3x - 4y - 8 = 0, 3x - 4y + 2 = -10 <=> 3x - 4y + 12 = 0) $
    ]
)

// TN 8
#tn([Một hình vuông có hai cạnh nằm trên hai đường thẳng song song $d_1: 4x - 3y + 3 = 0$ và $d_2: 4x - 3y - 17 = 0$. Diện tích của hình vuông đó bằng],
    (
        True([$16$]),
        [$20$],
        [$25$],
        [$9$]
    ),
    loigiai: [
        Độ dài cạnh hình vuông bằng khoảng cách giữa hai đường thẳng song song:
        $ a = d(d_1, d_2) = (|3 - (-17)|) / sqrt(4^2 + (-3)^2) = 20 / 5 = 4 $
        Diện tích hình vuông: $S = a^2 = 4^2 = 16$.
    ]
)

// TN 9
#tn([Điểm $M(x_0; 0)$ nằm trên trục hoành $O x$ cách đường thẳng $Delta: 3x + 4y - 6 = 0$ một khoảng bằng $3$. Giá trị dương của hoành độ $x_0$ bằng],
    (
        True([$x_0 = 7$]),
        [$x_0 = 5$],
        [$x_0 = 3$],
        [$x_0 = 9$]
    ),
    loigiai: [
        $ d(M, Delta) = (|3x_0 + 4(0) - 6|) / 5 = (|3x_0 - 6|) / 5 = 3 $
        $ <=> |3x_0 - 6| = 15 <=> cases(3x_0 - 6 = 15 <=> 3x_0 = 21 <=> x_0 = 7, 3x_0 - 6 = -15 <=> 3x_0 = -9 <=> x_0 = -3) $
        Giá trị dương là $x_0 = 7$.
    ]
)

// TN 10
#tn([Cho tam giác $A B C$ có diện tích bằng $15$, cạnh đáy $B C$ có độ dài bằng $6$ và nằm trên đường thẳng $d: 3x - 4y + 5 = 0$. Chiều cao $A H$ kẻ từ đỉnh $A$ của tam giác bằng],
    (
        True([$5$]),
        [$2.5$],
        [$10$],
        [$4$]
    ),
    loigiai: [
        Công thức diện tích tam giác:
        $ S = 1 / 2 B C cdot A H <=> 15 = 1 / 2 cdot 6 cdot A H <=> 3 A H = 15 <=> A H = 5 $
    ]
)

// TN 11
#tn([Một công trình đập thủy điện có thân đập chính chạy thẳng trên đường thẳng $Delta: 6x + 8y - 25 = 0$ (đơn vị: kilômét).
Khu nhà điều hành của nhà máy đặt tại điểm $A(2; 4)$.
Khoảng cách an toàn từ khu nhà điều hành đến thân đập bằng],
    (
        True([$1.9 text(" km")$]),
        [$2 text(" km")$],
        [$2.5 text(" km")$],
        [$1.5 text(" km")$]
    ),
    loigiai: [
        $ d(A, Delta) = (|6(2) + 8(4) - 25|) / sqrt(6^2 + 8^2) = (|12 + 32 - 25|) / 10 = 19 / 10 = 1.9 text(" km") $
    ]
)

// TN 12
#tn([Quỹ đạo bay trong không gian $O x y$ của hai vệ tinh viễn thông được mô hình bởi hai đường thẳng $d_1: x - 2y + 4 = 0$ và $d_2: 2x + y - 8 = 0$.
Góc cắt nhau giữa hai quỹ đạo bay bằng],
    (
        True([$90^circ$]),
        [$45^circ$],
        [$60^circ$],
        [$30^circ$]
    ),
    loigiai: [
        Vectơ pháp tuyến: $vec(n_1) = (1; -2)$ và $vec(n_2) = (2; 1)$.
        $vec(n_1) cdot vec(n_2) = 1(2) + (-2)(1) = 2 - 2 = 0$.
        Hai quỹ đạo bay vuông góc với nhau, góc cắt nhau bằng $90^circ$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Hình vuông và khoảng cách có CeTZ)
#ds([Cho hình vuông $A B C D$ có hai cạnh $A B$ và $C D$ lần lượt nằm trên hai đường thẳng $d_1: 3x - 4y + 6 = 0$ và $d_2: 3x - 4y - 14 = 0$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-3, 0), (4, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -4), (0, 3.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((3.8, -0.3), [$x$])
  content((-0.3, 3.2), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Đường thẳng d1: 3x - 4y + 6 = 0 -> y = 3/4 x + 1.5
  line((-3, -0.75), (2.5, 3.375), stroke: 1.2pt + rgb("d97706"))
  content((2.8, 3.5), [$d_1$])
  
  // Đường thẳng d2: 3x - 4y - 14 = 0 -> y = 3/4 x - 3.5
  line((-1, -4.25), (4, -0.5), stroke: 1.2pt + rgb("d97706"))
  content((3.8, -0.8), [$d_2$])
  
  // Minh họa khoảng cách giữa hai đường thẳng
  line((0, 1.5), (2.4, -1.7), stroke: (dash: "dashed", paint: red))
  content((1.5, 0.2), [$d = 4$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai đường thẳng $d_1$ và $d_2$ song song với nhau.]),
    True([Khoảng cách giữa hai đường thẳng $d_1$ và $d_2$ bằng $4$.]),
    True([Độ dài cạnh của hình vuông $A B C D$ bằng $4$.]),
    [Diện tích của hình vuông $A B C D$ bằng $32$.]
  ),
  loigiai: [
    #step([Vị trí tương đối])
    $3/3 = (-4)/(-4) != 6/(-14)$, do đó $d_1 parallel d_2$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách giữa hai đường thẳng])
    $d(d_1, d_2) = (|6 - (-14)|) / sqrt(3^2 + (-4)^2) = 20 / 5 = 4$. Mệnh đề b ĐÚNG.

    #step([Độ dài cạnh hình vuông])
    Vì $A B$ và $C D$ là hai cạnh đối song song nên khoảng cách giữa chúng chính bằng độ dài cạnh: $a = 4$. Mệnh đề c ĐÚNG.

    #step([Diện tích hình vuông])
    $S = a^2 = 4^2 = 16$ (chứ không phải $32$).
    Khẳng định diện tích bằng $32$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Phương trình đường phân giác)
#ds([Trong mặt phẳng $O x y$, cho hai đường thẳng cắt nhau $d_1: 2x - y + 1 = 0$ và $d_2: x + 2y - 3 = 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ pháp tuyến của hai đường thẳng vuông góc với nhau.]),
    True([Góc tạo bởi hai đường thẳng $d_1$ và $d_2$ bằng $90^circ$.]),
    True([Một đường phân giác của góc tạo bởi $d_1$ và $d_2$ có phương trình là $x - 3y + 4 = 0$.]),
    [Đường phân giác thứ hai có phương trình là $3x + y - 4 = 0$.]
  ),
  loigiai: [
    #step([Tính vuông góc])
    $vec(n_1) = (2; -1)$, $vec(n_2) = (1; 2)$.
    $vec(n_1) cdot vec(n_2) = 2(1) + (-1)(2) = 0$. Mệnh đề a ĐÚNG.
    Góc giữa hai đường thẳng bằng $90^circ$. Mệnh đề b ĐÚNG.

    #step([Lập phương trình đường phân giác])
    $ (|2x - y + 1|) / sqrt(2^2 + (-1)^2) = (|x + 2y - 3|) / sqrt(1^2 + 2^2) <=> |2x - y + 1| = |x + 2y - 3| $
    - Nhánh 1: $2x - y + 1 = x + 2y - 3 <=> x - 3y + 4 = 0$. Mệnh đề c ĐÚNG.
    - Nhánh 2: $2x - y + 1 = -(x + 2y - 3) <=> 3x + y - 2 = 0$.
    Phương trình đường phân giác thứ hai là $3x + y - 2 = 0$ (chứ không phải $3x + y - 4 = 0$).
    Khẳng định phương trình là $3x + y - 4 = 0$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Quy hoạch trạm radar cảnh giới)
#ds([Một trạm radar cảnh giới bờ biển đặt tại mỏm đá có tọa độ $R(1; 3)$.
Hai tuyến tuần tra hải quân trên biển chạy thẳng dọc theo các đường thẳng:
- Tuyến 1: $d_1: 4x + 3y + 15 = 0$.
- Tuyến 2: $d_2: 3x - 4y - 1 = 0$.
(Đơn vị khoảng cách trên bản đồ là hải lý).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai tuyến tuần tra $d_1$ và $d_2$ vuông góc với nhau.]),
    True([Khoảng cách từ trạm radar $R$ đến tuyến tuần tra 1 bằng $5.6$ hải lý.]),
    True([Khoảng cách từ trạm radar $R$ đến tuyến tuần tra 2 bằng $2$ hải lý.]),
    [Trạm radar $R$ ở gần tuyến tuần tra 1 hơn tuyến tuần tra 2.]
  ),
  loigiai: [
    #step([Tính vuông góc])
    $vec(n_1) = (4; 3)$, $vec(n_2) = (3; -4)$.
    $vec(n_1) cdot vec(n_2) = 4(3) + 3(-4) = 0$. Hai tuyến vuông góc. Mệnh đề a ĐÚNG.

    #step([Khoảng cách đến tuyến 1])
    $d(R, d_1) = (|4(1) + 3(3) + 15|) / sqrt(4^2 + 3^2) = (|4 + 9 + 15|) / 5 = 28 / 5 = 5.6$ hải lý. Mệnh đề b ĐÚNG.

    #step([Khoảng cách đến tuyến 2])
    $d(R, d_2) = (|3(1) - 4(3) - 1|) / sqrt(3^2 + (-4)^2) = (|3 - 12 - 1|) / 5 = 10 / 5 = 2$ hải lý. Mệnh đề c ĐÚNG.

    #step([So sánh khoảng cách])
    Vì $2 < 5.6$ nên trạm radar $R$ ở gần tuyến 2 hơn tuyến 1.
    Khẳng định ở gần tuyến 1 hơn là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số m và diện tích tam giác)
#ds([Trong mặt phẳng $O x y$, cho ba điểm $A(0; 3)$, $B(4; 0)$ và $C(m; 2)$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình tổng quát của đường thẳng $A B$ là $3x + 4y - 12 = 0$.]),
    True([Độ dài đoạn thẳng $A B$ bằng $5$.]),
    True([Khoảng cách từ điểm $C$ đến đường thẳng $A B$ là $d(C, A B) = (|3m - 4|) / 5$.]),
    [Diện tích của tam giác $A B C$ bằng $6$ khi và chỉ khi $m = 4$.]
  ),
  loigiai: [
    #step([Phương trình đường thẳng AB])
    Phương trình đoạn chắn: $x / 4 + y / 3 = 1 <=> 3x + 4y - 12 = 0$. Mệnh đề a ĐÚNG.

    #step([Độ dài AB])
    $A B = sqrt(4^2 + 3^2) = 5$. Mệnh đề b ĐÚNG.

    #step([Khoảng cách từ C đến AB])
    $d(C, A B) = (|3(m) + 4(2) - 12|) / sqrt(3^2 + 4^2) = (|3m - 4|) / 5$. Mệnh đề c ĐÚNG.

    #step([Tìm m để diện tích bằng 6])
    $S_(A B C) = 1 / 2 A B cdot d(C, A B) = 1 / 2 cdot 5 cdot (|3m - 4|) / 5 = 1 / 2 |3m - 4| = 6$
    $<=> |3m - 4| = 12 <=> cases(3m - 4 = 12 <=> 3m = 16 <=> m = 16 / 3, 3m - 4 = -12 <=> 3m = -8 <=> m = - 8 / 3)$
    Có hai giá trị là $m = 16/3$ hoặc $m = -8/3$ (chứ không phải $m = 4$).
    Khẳng định khi và chỉ khi $m = 4$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Diện tích hình vuông)
#tln([Cho hình vuông có hai cạnh nằm trên hai đường thẳng song song $4x - 3y + 6 = 0$ và $4x - 3y - 14 = 0$. Diện tích của hình vuông đó bằng bao nhiêu?],
    [16],
    loigiai: [
        #step([Tính độ dài cạnh hình vuông])
        $ a = (|6 - (-14)|) / sqrt(4^2 + (-3)^2) = 20 / 5 = 4 $
        
        #step([Tính diện tích])
        $ S = a^2 = 4^2 = 16 $
    ]
)

// TLN 2 (Khoảng cách từ nhà điều hành đến đập tính theo mét)
#tln([Trong bài toán đập thủy điện $6x + 8y - 25 = 0$ và khu nhà điều hành $A(2; 4)$, khoảng cách từ nhà điều hành đến thân đập bằng bao nhiêu mét (biết $1$ đơn vị tọa độ ứng với $1000 text(" m")$)?],
    [1900],
    loigiai: [
        #step([Tính khoảng cách theo đơn vị tọa độ])
        $ d = (|6(2) + 8(4) - 25|) / sqrt(6^2 + 8^2) = 19 / 10 = 1.9 text(" đơn vị") $
        
        #step([Đổi ra mét])
        $ 1.9 times 1000 = 1900 text(" m") $
    ]
)

// TLN 3 (Tham số m để khoảng cách bằng nhau)
#tln([Tìm giá trị của tham số $m$ để khoảng cách từ điểm $M(2; 1)$ đến đường thẳng $d: 3x + 4y + m = 0$ bằng khoảng cách từ điểm $N(0; 3)$ đến đường thẳng đó (biết $M$ và $N$ nằm về hai phía khác nhau so với $d$).],
    [-11],
    loigiai: [
        #step([Thiết lập phương trình])
        $ (m + 10) / 5 = - (m + 12) / 5 <=> m + 10 = -m - 12 <=> 2m = -22 <=> m = -11 $
    ]
)

// TLN 4 (Khoảng cách radar đến tuyến tuần tra 2)
#tln([Trong bài toán trạm radar $R(1; 3)$, khoảng cách từ trạm radar đến tuyến tuần tra số hai $3x - 4y - 1 = 0$ bằng bao nhiêu hải lý?],
    [2],
    loigiai: [
        #step([Tính khoảng cách])
        $ d = (|3(1) - 4(3) - 1|) / sqrt(3^2 + (-4)^2) = 10 / 5 = 2 text(" hải lý") $
    ]
)

// TLN 5 (Chiều cao tam giác)
#tln([Một tam giác có diện tích bằng $15$ và cạnh đáy bằng $6$. Chiều cao tương ứng với cạnh đáy đó bằng bao nhiêu?],
    [5],
    loigiai: [
        #step([Áp dụng công thức tính chiều cao])
        $ h = (2S) / a = (2 times 15) / 6 = 30 / 6 = 5 $
    ]
)

// TLN 6 (Hoành độ dương điểm trên Ox)
#tln([Tìm hoành độ dương của điểm $M(x_0; 0)$ nằm trên trục hoành $O x$ sao cho khoảng cách từ $M$ đến đường thẳng $3x + 4y - 6 = 0$ bằng $3$.],
    [7],
    loigiai: [
        #step([Thiết lập phương trình khoảng cách])
        $ (|3x_0 - 6|) / 5 = 3 <=> |3x_0 - 6| = 15 <=> cases(3x_0 - 6 = 15 <=> x_0 = 7, 3x_0 - 6 = -15 <=> x_0 = -3) $
        Hoành độ dương là $x_0 = 7$.
    ]
)

] // end make-questions

#make-questions()
