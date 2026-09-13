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
  school: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG",
  exam-title: "BÀI 19: PHƯƠNG TRÌNH ĐƯỜNG THẲNG (ĐỀ SỐ 21B - VẬN DỤNG & THỰC TIỄN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "156",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho đường thẳng $d: 2x - 3y + 6 = 0$. Vectơ nào dưới đây là một vectơ chỉ phương của đường thẳng $d$?],
    (
        True([$vec(u) = (3; 2)$]),
        [$vec(u) = (2; -3)$],
        [$vec(u) = (3; -2)$],
        [$vec(u) = (2; 3)$]
    ),
    loigiai: [
        Đường thẳng $d$ có một vectơ pháp tuyến là $vec(n) = (2; -3)$.
        Do $vec(u) perp vec(n)$ nên một vectơ chỉ phương của $d$ là $vec(u) = (3; 2)$ vì $vec(u) cdot vec(n) = 3(2) + 2(-3) = 0$.
    ]
)

// TN 2
#tn([Phương trình đường thẳng $Delta$ đi qua điểm $A(2; -1)$ và song song với đường thẳng $d: 3x - y + 1 = 0$ là],
    (
        True([$3x - y - 7 = 0$]),
        [$3x - y + 7 = 0$],
        [$x + 3y + 1 = 0$],
        [$3x + y - 5 = 0$]
    ),
    loigiai: [
        Vì $Delta$ song song với $d$ nên $Delta$ có cùng vectơ pháp tuyến $vec(n) = (3; -1)$.
        Phương trình đường thẳng $Delta$ đi qua $A(2; -1)$ là:
        $ 3(x - 2) - 1(y - (-1)) = 0 <=> 3x - 6 - y - 1 = 0 <=> 3x - y - 7 = 0 $
    ]
)

// TN 3
#tn([Phương trình đường thẳng $d$ đi qua điểm $B(-1; 3)$ và vuông góc với đường thẳng $Delta: x + 2y - 5 = 0$ là],
    (
        True([$2x - y + 5 = 0$]),
        [$2x - y - 5 = 0$],
        [$x + 2y - 5 = 0$],
        [$2x + y - 1 = 0$]
    ),
    loigiai: [
        Đường thẳng $Delta$ có VTPT $vec(n_Delta) = (1; 2)$.
        Vì $d perp Delta$ nên vectơ pháp tuyến của $d$ vuông góc với $vec(n_Delta)$, chọn $vec(n_d) = (2; -1)$.
        Phương trình của $d$ đi qua $B(-1; 3)$ là:
        $ 2(x + 1) - 1(y - 3) = 0 <=> 2x + 2 - y + 3 = 0 <=> 2x - y + 5 = 0 $
    ]
)

// TN 4
#tn([Phương trình đường trung trực của đoạn thẳng $A B$ với $A(1; 3)$ và $B(5; 1)$ là],
    (
        True([$2x - y - 4 = 0$]),
        [$2x - y + 4 = 0$],
        [$x + 2y - 7 = 0$],
        [$2x + y - 8 = 0$]
    ),
    loigiai: [
        - Tọa độ trung điểm $M$ của $A B$:
        $ x_M = (1 + 5) / 2 = 3; quad y_M = (3 + 1) / 2 = 2 => M(3; 2) $
        - Vectơ chỉ phương của đoạn $A B$: $vec(A B) = (4; -2) = 2(2; -1)$.
        Đường trung trực $Delta perp A B$ nên nhận $vec(n) = (2; -1)$ làm vectơ pháp tuyến.
        Phương trình đường trung trực đi qua $M(3; 2)$ là:
        $ 2(x - 3) - 1(y - 2) = 0 <=> 2x - 6 - y + 2 = 0 <=> 2x - y - 4 = 0 $
    ]
)

// TN 5
#tn([Trong mặt phẳng $O x y$, cho tam giác $A B C$ có $A(2; 1)$, $B(-1; 0)$ và $C(3; -2)$. Phương trình đường cao $B H$ kẻ từ đỉnh $B$ là],
    (
        True([$x - 3y + 1 = 0$]),
        [$x - 3y - 1 = 0$],
        [$3x + y + 3 = 0$],
        [$x + 3y + 1 = 0$]
    ),
    loigiai: [
        Đường cao $B H perp A C$ nên nhận vectơ $vec(A C)$ làm vectơ pháp tuyến.
        Ta có: $vec(A C) = (3 - 2; -2 - 1) = (1; -3)$.
        Phương trình đường cao $B H$ đi qua $B(-1; 0)$ là:
        $ 1(x + 1) - 3(y - 0) = 0 <=> x - 3y + 1 = 0 $
    ]
)

// TN 6
#tn([Hệ số góc của đường thẳng $d$ tạo với chiều dương của trục hoành $O x$ một góc $60^circ$ bằng],
    (
        True([$k = sqrt(3)$]),
        [$k = 1 / sqrt(3)$],
        [$k = -sqrt(3)$],
        [$k = 1$]
    ),
    loigiai: [
        Hệ số góc của đường thẳng bằng tang của góc nghiêng:
        $ k = tan 60^circ = sqrt(3) $
    ]
)

// TN 7
#tn([Tọa độ giao điểm của hai đường thẳng $d_1: 2x - y + 3 = 0$ và $d_2: x + 3y - 2 = 0$ là],
    (
        True([$(-1; 1)$]),
        [$(1; 5)$],
        [$(-1; -1)$],
        [$(2; 7)$]
    ),
    loigiai: [
        Tọa độ giao điểm là nghiệm của hệ phương trình:
        $ cases(2x - y = -3, x + 3y = 2) <=> cases(y = 2x + 3, x + 3(2x + 3) = 2) <=> cases(7x = -7 => x = -1, y = 1) $
        Vậy tọa độ giao điểm là $(-1; 1)$.
    ]
)

// TN 8
#tn([Trong mặt phẳng $O x y$, tam giác $A B C$ có trọng tâm $G(2; 3)$, hai đỉnh $A(1; 2)$ và $B(3; 5)$. Tọa độ của đỉnh $C$ là],
    (
        True([$C(2; 2)$]),
        [$C(3; 3)$],
        [$C(2; 1)$],
        [$C(4; 2)$]
    ),
    loigiai: [
        Theo công thức tọa độ trọng tâm:
        $ cases(x_C = 3x_G - x_A - x_B = 3(2) - 1 - 3 = 2, y_C = 3y_G - y_A - y_B = 3(3) - 2 - 5 = 2) $
        Vậy tọa độ đỉnh $C$ là $C(2; 2)$.
    ]
)

// TN 9
#tn([Tìm tất cả các giá trị của tham số $m$ để đường thẳng $d: (m - 2)x + 3y - 6 = 0$ song song với đường thẳng $Delta: 2x + 3y + 1 = 0$.],
    (
        True([$m = 4$]),
        [$m = 2$],
        [$m = -4$],
        [$m = 0$]
    ),
    loigiai: [
        Hai đường thẳng song song khi các hệ số tỉ lệ:
        $ (m - 2) / 2 = 3 / 3 != (-6) / 1 <=> m - 2 = 2 <=> m = 4 $
    ]
)

// TN 10
#tn([Phương trình tham số của đường thẳng đi qua hai điểm $A(2; -3)$ và $B(5; 1)$ là],
    (
        True([$cases(x = 2 + 3t, y = -3 + 4t)$]),
        [$cases(x = 5 + 2t, y = 1 - 3t)$],
        [$cases(x = 2 + 4t, y = -3 + 3t)$],
        [$cases(x = 3 + 2t, y = 4 - 3t)$]
    ),
    loigiai: [
        Vectơ chỉ phương: $vec(A B) = (5 - 2; 1 - (-3)) = (3; 4)$.
        Phương trình tham số đi qua $A(2; -3)$ là:
        $ cases(x = 2 + 3t, y = -3 + 4t) $
    ]
)

// TN 11
#tn([Một nguồn phát sóng siêu âm đặt tại vị trí $S(0; 4)$ truyền tín hiệu theo đường thẳng $d: 4x - 3y + 12 = 0$ tới gặp bờ hồ (trùng với trục hoành $O x$) tại trạm thu $M$. Tọa độ trạm thu $M$ là],
    (
        True([$M(-3; 0)$]),
        [$M(3; 0)$],
        [$M(0; 4)$],
        [$M(-4; 0)$]
    ),
    loigiai: [
        Trạm thu $M$ nằm trên trục hoành $O x$ nên $y = 0$.
        Thay $y = 0$ vào phương trình đường thẳng $d$:
        $ 4x - 3(0) + 12 = 0 <=> 4x + 12 = 0 <=> x = -3 $
        Vậy tọa độ trạm thu là $M(-3; 0)$.
    ]
)

// TN 12
#tn([Một tuyến cáp quang nối từ đất liền tại điểm $A(1; 2)$ tới trạm đảo tại điểm $B(7; 11)$.
Điểm kiểm tra kỹ thuật $C$ nằm trên đường cáp thẳng $A B$ sao cho $A C = 1 / 3 A B$.
Tọa độ của điểm $C$ là],
    (
        True([$C(3; 5)$]),
        [$C(4; 6)$],
        [$C(2; 4)$],
        [$C(5; 8)$]
    ),
    loigiai: [
        Ta có $vec(A B) = (7 - 1; 11 - 2) = (6; 9)$.
        Vì $C$ nằm trên đoạn $A B$ và $A C = 1 / 3 A B$ nên:
        $ vec(A C) = 1 / 3 vec(A B) = 1 / 3(6; 9) = (2; 3) $
        Tọa độ điểm $C$:
        $ cases(x_C = x_A + 2 = 1 + 2 = 3, y_C = y_A + 3 = 2 + 3 = 5) => C(3; 5) $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đường trung tuyến và cạnh tam giác có CeTZ)
#ds([Trong mặt phẳng tọa độ $O x y$, cho ba điểm $A(1; 3)$, $B(-2; -1)$ và $C(4; 1)$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-3.5, 0), (5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -2), (0, 4.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.8, -0.3), [$x$])
  content((-0.3, 4.2), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Tam giác ABC
  line((1, 3), (-2, -1), stroke: 1.2pt + rgb("0d9488"))
  line((-2, -1), (4, 1), stroke: 1.2pt + rgb("0d9488"))
  line((4, 1), (1, 3), stroke: 1.2pt + rgb("0d9488"))
  
  // Đỉnh A(1; 3)
  circle((1, 3), radius: 2pt, fill: rgb("0d9488"))
  content((1, 3.3), [$A(1; 3)$])
  
  // Đỉnh B(-2; -1)
  circle((-2, -1), radius: 2pt, fill: rgb("0d9488"))
  content((-2.2, -1.3), [$B(-2; -1)$])
  
  // Đỉnh C(4; 1)
  circle((4, 1), radius: 2pt, fill: rgb("0d9488"))
  content((4.3, 0.7), [$C(4; 1)$])
  
  // Trung điểm M(1; 0)
  circle((1, 0), radius: 2pt, fill: red)
  content((1.3, -0.3), [$M(1; 0)$])
  
  // Đường trung tuyến AM (x = 1)
  line((1, 3), (1, 0), stroke: (dash: "dashed", paint: red))
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ trung điểm $M$ của đoạn thẳng $B C$ là $M(1; 0)$.]),
    True([Phương trình tổng quát của đường trung tuyến $A M$ là $x - 1 = 0$.]),
    True([Tọa độ trọng tâm $G$ của tam giác $A B C$ là $G(1; 1)$.]),
    [Phương trình đường thẳng chứa cạnh $B C$ là $3x - y + 5 = 0$.]
  ),
  loigiai: [
    #step([Tọa độ trung điểm M])
    $x_M = (-2 + 4) / 2 = 1$; $y_M = (-1 + 1) / 2 = 0$. Tọa độ $M(1; 0)$. Mệnh đề a ĐÚNG.

    #step([Phương trình trung tuyến AM])
    Hai điểm $A(1; 3)$ và $M(1; 0)$ có cùng hoành độ $x = 1$.
    Đường thẳng $A M$ vuông góc với trục $O x$ có phương trình là $x - 1 = 0$. Mệnh đề b ĐÚNG.

    #step([Tọa độ trọng tâm G])
    $x_G = (1 - 2 + 4) / 3 = 1$; $y_G = (3 - 1 + 1) / 3 = 1$. Tọa độ $G(1; 1)$. Mệnh đề c ĐÚNG.

    #step([Phương trình cạnh BC])
    Vectơ $vec(B C) = (4 - (-2); 1 - (-1)) = (6; 2) = 2(3; 1)$.
    Suy ra VTPT là $vec(n) = (1; -3)$.
    Phương trình đi qua $C(4; 1)$:
    $ 1(x - 4) - 3(y - 1) = 0 <=> x - 3y - 1 = 0 $
    Phương trình cạnh $B C$ là $x - 3y - 1 = 0$ (chứ không phải $3x - y + 5 = 0$).
    Khẳng định phương trình là $3x - y + 5 = 0$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Hình bình hành và tâm đối xứng)
#ds([Trong mặt phẳng $O x y$, cho hình bình hành $A B C D$ có ba đỉnh $A(1; 2)$, $B(4; 3)$ và $C(5; 6)$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ tâm đối xứng $I$ (giao điểm của hai đường chéo $A C$ và $B D$) là $I(3; 4)$.]),
    True([Tọa độ của đỉnh $D$ là $D(2; 5)$.]),
    True([Phương trình đường thẳng chứa đường chéo $A C$ là $x - y + 1 = 0$.]),
    [Phương trình đường thẳng chứa đường chéo $B D$ là $x - y - 1 = 0$.]
  ),
  loigiai: [
    #step([Tọa độ tâm I])
    Tâm $I$ là trung điểm của đường chéo $A C$:
    $ x_I = (1 + 5) / 2 = 3; quad y_I = (2 + 6) / 2 = 4 => I(3; 4) $. Mệnh đề a ĐÚNG.

    #step([Tọa độ đỉnh D])
    Vì $I$ cũng là trung điểm của $B D$:
    $ x_D = 2x_I - x_B = 2(3) - 4 = 2; quad y_D = 2y_I - y_B = 2(4) - 3 = 5 => D(2; 5) $. Mệnh đề b ĐÚNG.

    #step([Phương trình đường chéo AC])
    Vectơ $vec(A C) = (5 - 1; 6 - 2) = (4; 4) = 4(1; 1)$.
    Suy ra VTPT là $vec(n) = (1; -1)$.
    Phương trình đi qua $A(1; 2)$:
    $ 1(x - 1) - 1(y - 2) = 0 <=> x - y + 1 = 0 $. Mệnh đề c ĐÚNG.

    #step([Phương trình đường chéo BD])
    Vectơ $vec(B D) = (2 - 4; 5 - 3) = (-2; 2) = -2(1; -1)$.
    Suy ra VTPT là $vec(n) = (1; 1)$.
    Phương trình đi qua $B(4; 3)$:
    $ 1(x - 4) + 1(y - 3) = 0 <=> x + y - 7 = 0 $
    Phương trình đúng là $x + y - 7 = 0$ (chứ không phải $x - y - 1 = 0$).
    Khẳng định phương trình là $x - y - 1 = 0$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Quy hoạch đê bao chống lũ)
#ds([Một đồ án quy hoạch nông thôn mới thiết kế tuyến đê bao chống lũ chạy thẳng đi qua hai điểm dân cư $A(2; 3)$ và $B(8; 7)$ (mỗi đơn vị trên bản đồ quy hoạch tương ứng với $1 text(" km")$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tuyến đê bao có một vectơ chỉ phương là $vec(u) = (3; 2)$.]),
    True([Phương trình tổng quát của tuyến đê bao là $2x - 3y + 5 = 0$.]),
    True([Khoảng cách nối thẳng giữa hai điểm dân cư $A$ và $B$ là $2 sqrt(13) text(" km")$.]),
    [Một trạm bơm tiêu úng nông nghiệp đặt tại vị trí $M(5; 4)$ nằm trực tiếp trên tuyến đê bao.]
  ),
  loigiai: [
    #step([Vectơ chỉ phương])
    $vec(A B) = (8 - 2; 7 - 3) = (6; 4) = 2(3; 2)$.
    Vectơ chỉ phương của tuyến đê bao là $vec(u) = (3; 2)$. Mệnh đề a ĐÚNG.

    #step([Phương trình tổng quát])
    VTPT của tuyến đê là $vec(n) = (2; -3)$.
    Phương trình đi qua $A(2; 3)$:
    $ 2(x - 2) - 3(y - 3) = 0 <=> 2x - 4 - 3y + 9 = 0 <=> 2x - 3y + 5 = 0 $. Mệnh đề b ĐÚNG.

    #step([Khoảng cách AB])
    $A B = sqrt((8 - 2)^2 + (7 - 3)^2) = sqrt(6^2 + 4^2) = sqrt(36 + 16) = sqrt(52) = 2 sqrt(13) text(" km")$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra vị trí trạm bơm M(5; 4)])
    Thay tọa độ điểm $M(5; 4)$ vào phương trình tuyến đê:
    $ 2(5) - 3(4) + 5 = 10 - 12 + 5 = 3 != 0 $
    Điểm $M(5; 4)$ không thuộc đường thẳng của tuyến đê bao.
    Khẳng định $M(5; 4)$ nằm trên tuyến đê bao là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số m và bài toán thẳng hàng)
#ds([Trong mặt phẳng $O x y$, cho ba điểm $A(1; 2)$, $B(3; 6)$ và $C(m; 2m + 1)$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ $vec(A B) = (2; 4) = 2(1; 2)$.]),
    True([Phương trình đường thẳng đi qua hai điểm $A$ và $B$ là $2x - y = 0$.]),
    True([Ba điểm $A, B, C$ thẳng hàng khi và chỉ khi điểm $C$ nằm trên đường thẳng $A B$.]),
    [Có vô số giá trị của tham số $m$ để ba điểm $A, B, C$ thẳng hàng.]
  ),
  loigiai: [
    #step([Vectơ AB])
    $vec(A B) = (3 - 1; 6 - 2) = (2; 4) = 2(1; 2)$. Mệnh đề a ĐÚNG.

    #step([Phương trình đường thẳng AB])
    VTCP $vec(u) = (1; 2) =>$ VTPT $vec(n) = (2; -1)$.
    Phương trình đi qua $A(1; 2)$:
    $ 2(x - 1) - 1(y - 2) = 0 <=> 2x - y = 0 $. Mệnh đề b ĐÚNG.

    #step([Điều kiện thẳng hàng])
    Ba điểm $A, B, C$ thẳng hàng khi và chỉ khi điểm $C$ thuộc đường thẳng $A B$. Mệnh đề c ĐÚNG.

    #step([Tìm m để C thuộc AB])
    Thay tọa độ $C(m; 2m + 1)$ vào phương trình đường thẳng $A B$:
    $ 2(m) - (2m + 1) = 0 <=> 2m - 2m - 1 = 0 <=> -1 = 0 text(" (vô nghiệm)") $
    Điều này chứng tỏ không tồn tại bất kỳ giá trị nào của tham số $m$ để ba điểm $A, B, C$ thẳng hàng.
    Khẳng định có vô số giá trị là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Hệ số góc đường thẳng qua hai điểm)
#tln([Tìm hệ số góc $k$ của đường thẳng đi qua hai điểm $A(1; 2)$ và $B(3; 8)$.],
    [3],
    loigiai: [
        #step([Áp dụng công thức tính hệ số góc])
        $ k = (y_B - y_A) / (x_B - x_A) = (8 - 2) / (3 - 1) = 6 / 2 = 3 $
    ]
)

// TLN 2 (Tung độ trung điểm)
#tln([Trong mặt phẳng $O x y$, cho tam giác $A B C$ có $A(1; 2)$, $B(3; 4)$ và $C(5; 0)$. Tìm tung độ của trung điểm $M$ của cạnh $B C$.],
    [2],
    loigiai: [
        #step([Tính tọa độ trung điểm M])
        $ y_M = (y_B + y_C) / 2 = (4 + 0) / 2 = 2 $
    ]
)

// TLN 3 (Tìm m để hai đường thẳng vuông góc)
#tln([Tìm giá trị của tham số $m$ để đường thẳng $d: (m - 1)x + 2y - 4 = 0$ vuông góc với đường thẳng $Delta: 2x - y + 5 = 0$.],
    [2],
    loigiai: [
        #step([Xác định vectơ pháp tuyến])
        - Đường thẳng $d$ có VTPT $vec(n_1) = (m - 1; 2)$.
        - Đường thẳng $Delta$ có VTPT $vec(n_2) = (2; -1)$.
        
        #step([Điều kiện vuông góc])
        $d perp Delta <=> vec(n_1) cdot vec(n_2) = 0$:
        $ (m - 1) cdot 2 + 2 cdot (-1) = 0 <=> 2m - 2 - 2 = 0 <=> 2m = 4 <=> m = 2 $
    ]
)

// TLN 4 (Bình phương khoảng cách hai điểm dân cư)
#tln([Trong bài toán quy hoạch đê bao chống lũ, khoảng cách giữa hai điểm dân cư $A(2; 3)$ và $B(8; 7)$ có bình phương bằng bao nhiêu?],
    [52],
    loigiai: [
        #step([Tính bình phương khoảng cách])
        $ A B^2 = (8 - 2)^2 + (7 - 3)^2 = 6^2 + 4^2 = 36 + 16 = 52 $
    ]
)

// TLN 5 (Tìm hoành độ điểm trên Ox để hệ số góc bằng -1)
#tln([Cho điểm $A(1; 2)$. Điểm $M(x_0; 0)$ nằm trên trục hoành $O x$ sao cho đường thẳng $A M$ có hệ số góc $k = -1$. Tìm giá trị của hoành độ $x_0$.],
    [3],
    loigiai: [
        #step([Thiết lập phương trình hệ số góc])
        Hệ số góc của đường thẳng $A M$:
        $ k = (y_M - y_A) / (x_M - x_A) = (0 - 2) / (x_0 - 1) = - 2 / (x_0 - 1) $
        Theo đề bài $k = -1$:
        $ - 2 / (x_0 - 1) = -1 <=> x_0 - 1 = 2 <=> x_0 = 3 $
    ]
)

// TLN 6 (Diện tích tam giác)
#tln([Trong mặt phẳng $O x y$, cho hình chữ nhật $O A B C$ với $O(0; 0)$, $A(6; 0)$, $B(6; 4)$ và $C(0; 4)$. Diện tích tam giác $O A B$ bằng bao nhiêu?],
    [12],
    loigiai: [
        #step([Xác định độ dài các cạnh])
        Tam giác $O A B$ vuông tại $A$ với $O A = 6$ và $A B = 4$.
        
        #step([Tính diện tích])
        $ S_(O A B) = 1 / 2 O A cdot A B = 1 / 2 cdot 6 cdot 4 = 12 $
    ]
)

] // end make-questions

#make-questions()
