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
  exam-title: "BÀI 21: ĐƯỜNG TRÒN TRONG MẶT PHẲNG TỌA ĐỘ (ĐỀ SỐ 23A - CƠ BẢN ĐẾN VẬN DỤNG)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "161",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Tọa độ tâm $I$ và bán kính $R$ của đường tròn $(C): (x - 2)^2 + (y + 3)^2 = 25$ là],
    (
        True([$I(2; -3)$ và $R = 5$]),
        [$I(-2; 3)$ và $R = 5$],
        [$I(2; -3)$ và $R = 25$],
        [$I(-2; 3)$ và $R = 25$]
    ),
    loigiai: [
        Từ phương trình chính tắc $(x - a)^2 + (y - b)^2 = R^2$, ta có:
        $ a = 2; quad b = -3; quad R = sqrt(25) = 5 $
        Vậy tâm là $I(2; -3)$ và bán kính $R = 5$.
    ]
)

// TN 2
#tn([Phương trình của đường tròn có tâm $I(-1; 2)$ và bán kính $R = 3$ là],
    (
        True([$(x + 1)^2 + (y - 2)^2 = 9$]),
        [$(x - 1)^2 + (y + 2)^2 = 9$],
        [$(x + 1)^2 + (y - 2)^2 = 3$],
        [$(x - 1)^2 + (y + 2)^2 = 3$]
    ),
    loigiai: [
        Áp dụng công thức phương trình đường tròn tâm $I(a; b)$, bán kính $R$:
        $ (x - a)^2 + (y - b)^2 = R^2 <=> (x - (-1))^2 + (y - 2)^2 = 3^2 <=> (x + 1)^2 + (y - 2)^2 = 9 $
    ]
)

// TN 3
#tn([Tọa độ tâm $I$ và bán kính $R$ của đường tròn $(C): x^2 + y^2 - 4x + 6y - 12 = 0$ là],
    (
        True([$I(2; -3)$ và $R = 5$]),
        [$I(-2; 3)$ và $R = 5$],
        [$I(2; -3)$ và $R = 25$],
        [$I(-4; 6)$ và $R = sqrt(12)$]
    ),
    loigiai: [
        Ta có $a = 2, b = -3, c = -12$.
        $ R = sqrt(a^2 + b^2 - c) = sqrt(2^2 + (-3)^2 - (-12)) = sqrt(4 + 9 + 12) = sqrt(25) = 5 $
        Tâm $I(2; -3)$ và bán kính $R = 5$.
    ]
)

// TN 4
#tn([Tìm tất cả các giá trị của tham số $m$ để phương trình $x^2 + y^2 - 2x + 4y + m = 0$ là phương trình của một đường tròn.],
    (
        True([$m < 5$]),
        [$m <= 5$],
        [$m > 5$],
        [$m >= 5$]
    ),
    loigiai: [
        Ta có $a = 1, b = -2, c = m$.
        Phương trình là phương trình đường tròn khi và chỉ khi:
        $ a^2 + b^2 - c > 0 <=> 1^2 + (-2)^2 - m > 0 <=> 5 - m > 0 <=> m < 5 $
    ]
)

// TN 5
#tn([Phương trình đường tròn có đường kính $A B$ với $A(1; 3)$ và $B(5; -1)$ là],
    (
        True([$(x - 3)^2 + (y - 1)^2 = 8$]),
        [$(x - 3)^2 + (y - 1)^2 = 32$],
        [$(x + 3)^2 + (y + 1)^2 = 8$],
        [$(x - 3)^2 + (y - 1)^2 = sqrt(8)$]
    ),
    loigiai: [
        Tâm $I$ là trung điểm của $A B$:
        $ x_I = (1 + 5) / 2 = 3; quad y_I = (3 + (-1)) / 2 = 1 => I(3; 1) $
        Bán kính $R^2 = I A^2 = (3 - 1)^2 + (1 - 3)^2 = 4 + 4 = 8$.
        Phương trình: $(x - 3)^2 + (y - 1)^2 = 8$.
    ]
)

// TN 6
#tn([Phương trình tiếp tuyến của đường tròn $(C): (x - 1)^2 + (y - 2)^2 = 25$ tại điểm $M(4; 6) in (C)$ là],
    (
        True([$3x + 4y - 36 = 0$]),
        [$3x + 4y + 36 = 0$],
        [$4x + 3y - 34 = 0$],
        [$3x - 4y + 12 = 0$]
    ),
    loigiai: [
        Đường tròn có tâm $I(1; 2)$.
        Vectơ pháp tuyến của tiếp tuyến tại $M(4; 6)$ là $vec(I M) = (4 - 1; 6 - 2) = (3; 4)$.
        Phương trình tiếp tuyến đi qua $M(4; 6)$:
        $ 3(x - 4) + 4(y - 6) = 0 <=> 3x - 12 + 4y - 24 = 0 <=> 3x + 4y - 36 = 0 $
    ]
)

// TN 7
#tn([Vị trí tương đối của điểm $M(3; 4)$ đối với đường tròn $(C): x^2 + y^2 = 25$ là],
    (
        True([Điểm $M$ nằm trên đường tròn]),
        [Điểm $M$ nằm bên trong đường tròn],
        [Điểm $M$ nằm bên ngoài đường tròn],
        [Điểm $M$ trùng với tâm đường tròn]
    ),
    loigiai: [
        Khoảng cách từ gốc tọa độ $O(0; 0)$ đến $M(3; 4)$:
        $ O M = sqrt(3^2 + 4^2) = sqrt(25) = 5 = R $
        Do đó điểm $M$ nằm trên đường tròn $(C)$.
    ]
)

// TN 8
#tn([Vị trí tương đối giữa đường thẳng $d: 3x - 4y + 4 = 0$ và đường tròn $(C): (x - 1)^2 + (y + 2)^2 = 16$ là],
    (
        True([Đường thẳng cắt đường tròn tại hai điểm phân biệt]),
        [Đường thẳng tiếp xúc với đường tròn],
        [Đường thẳng và đường tròn không có điểm chung],
        [Đường thẳng đi qua tâm của đường tròn]
    ),
    loigiai: [
        Đường tròn $(C)$ có tâm $I(1; -2)$ và bán kính $R = 4$.
        Khoảng cách từ tâm $I$ đến đường thẳng $d$:
        $ d(I, d) = (|3(1) - 4(-2) + 4|) / sqrt(3^2 + (-4)^2) = (|3 + 8 + 4|) / 5 = 15 / 5 = 3 $
        Vì $d(I, d) = 3 < R = 4$ nên đường thẳng cắt đường tròn tại hai điểm phân biệt.
    ]
)

// TN 9
#tn([Phương trình đường tròn có tâm là gốc tọa độ $O(0; 0)$ và tiếp xúc với đường thẳng $Delta: 3x + 4y - 10 = 0$ là],
    (
        True([$x^2 + y^2 = 4$]),
        [$x^2 + y^2 = 2$],
        [$x^2 + y^2 = 16$],
        [$x^2 + y^2 = 10$]
    ),
    loigiai: [
        Vì đường tròn tiếp xúc với $Delta$ nên bán kính $R = d(O, Delta)$:
        $ R = (|3(0) + 4(0) - 10|) / sqrt(3^2 + 4^2) = 10 / 5 = 2 $
        Phương trình đường tròn: $x^2 + y^2 = 2^2 <=> x^2 + y^2 = 4$.
    ]
)

// TN 10
#tn([Trong mặt phẳng $O x y$, tam giác $A B C$ vuông tại $A$ có hai đỉnh $B(1; 2)$ và $C(5; 6)$. Tọa độ tâm đường tròn ngoại tiếp tam giác $A B C$ là],
    (
        True([$I(3; 4)$]),
        [$I(2; 3)$],
        [$I(4; 5)$],
        [$I(6; 8)$]
    ),
    loigiai: [
        Vì tam giác $A B C$ vuông tại $A$ nên tâm đường tròn ngoại tiếp là trung điểm cạnh huyền $B C$:
        $ x_I = (1 + 5) / 2 = 3; quad y_I = (2 + 6) / 2 = 4 => I(3; 4) $
    ]
)

// TN 11
#tn([Một tháp phát sóng truyền hình đặt tại gốc tọa độ $O(0; 0)$ có bán kính phủ sóng hiệu quả là $R = 50 text(" km")$.
Một trạm thu tín hiệu đặt tại vị trí $A(30; 40)$ (đơn vị: kilômét).
Vị trí của trạm $A$ đối với vùng phủ sóng của tháp là],
    (
        True([Nằm ngay trên ranh giới vùng phủ sóng]),
        [Nằm hoàn toàn bên trong vùng phủ sóng],
        [Nằm bên ngoài vùng phủ sóng],
        [Trùng với vị trí tháp phát sóng]
    ),
    loigiai: [
        Khoảng cách từ tháp $O$ đến trạm thu $A$:
        $ O A = sqrt(30^2 + 40^2) = sqrt(900 + 1600) = sqrt(2500) = 50 text(" km") = R $
        Vậy trạm $A$ nằm ngay trên ranh giới vùng phủ sóng.
    ]
)

// TN 12
#tn([Một hệ thống tưới nước tự động xoay tròn (Center Pivot) có tâm vòi phun đặt tại vị trí $I(2; 3)$ và bán kính tưới đạt $R = 10 text(" m")$.
Phương trình đường biên giới hạn vùng đất được tưới nước là],
    (
        True([$(x - 2)^2 + (y - 3)^2 = 100$]),
        [$(x + 2)^2 + (y + 3)^2 = 100$],
        [$(x - 2)^2 + (y - 3)^2 = 10$],
        [$(x - 3)^2 + (y - 2)^2 = 100$]
    ),
    loigiai: [
        Đường biên là đường tròn tâm $I(2; 3)$, bán kính $R = 10$:
        $ (x - 2)^2 + (y - 3)^2 = 10^2 <=> (x - 2)^2 + (y - 3)^2 = 100 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đường tròn và tiếp tuyến có CeTZ)
#ds([Trong mặt phẳng tọa độ $O x y$, cho đường tròn $(C): x^2 + y^2 - 2x - 4y - 20 = 0$ và điểm $M(4; 6)$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-4, 0), (6, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -3), (0, 7.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((5.8, -0.3), [$x$])
  content((-0.3, 7.2), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Tâm I(1; 2), R = 5
  circle((1, 2), radius: 2.5, stroke: 1.2pt + rgb("1e40af"))
  circle((1, 2), radius: 2pt, fill: rgb("1e40af"))
  content((1, 1.6), [$I(1; 2)$])
  
  // Điểm M(4; 6) -> (4-1)^2 + (6-2)^2 = 9 + 16 = 25 = R^2
  circle((2.5, 4), radius: 2pt, fill: red)
  content((2.8, 4.3), [$M(4; 6)$])
  
  // Tiếp tuyến tại M: 3(x-4) + 4(y-6) = 0
  line((0, 5.875), (4, 2.875), stroke: 1.2pt + red)
  content((3.8, 2.5), [$Delta$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đường tròn $(C)$ có tâm là $I(1; 2)$ và bán kính $R = 5$.]),
    True([Điểm $M(4; 6)$ thuộc đường tròn $(C)$.]),
    True([Phương trình tiếp tuyến của $(C)$ tại điểm $M(4; 6)$ là $3x + 4y - 36 = 0$.]),
    [Đường tròn $(C)$ đi qua gốc tọa độ $O(0; 0)$.]
  ),
  loigiai: [
    #step([Tâm và bán kính])
    $a = 1, b = 2, c = -20$. Tâm $I(1; 2)$.
    $R = sqrt(1^2 + 2^2 - (-20)) = sqrt(1 + 4 + 20) = sqrt(25) = 5$. Mệnh đề a ĐÚNG.

    #step([Kiểm tra điểm M])
    Thay $M(4; 6)$ vào phương trình $(C)$:
    $ 4^2 + 6^2 - 2(4) - 4(6) - 20 = 16 + 36 - 8 - 24 - 20 = 0 $
    Điểm $M$ thuộc đường tròn $(C)$. Mệnh đề b ĐÚNG.

    #step([Tiếp tuyến tại M])
    Vectơ pháp tuyến $vec(I M) = (4 - 1; 6 - 2) = (3; 4)$.
    Phương trình tiếp tuyến:
    $ 3(x - 4) + 4(y - 6) = 0 <=> 3x + 4y - 36 = 0 $. Mệnh đề c ĐÚNG.

    #step([Kiểm tra gốc tọa độ])
    Thay $O(0; 0)$ vào phương trình:
    $ 0^2 + 0^2 - 2(0) - 4(0) - 20 = -20 != 0 $
    Đường tròn không đi qua gốc tọa độ.
    Khẳng định đi qua $O$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Đường tròn ngoại tiếp tam giác vuông)
#ds([Trong mặt phẳng $O x y$, cho tam giác $O A B$ có ba đỉnh là $O(0; 0)$, $A(6; 0)$ và $B(0; 8)$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tam giác $O A B$ là tam giác vuông tại đỉnh $O$.]),
    True([Độ dài cạnh huyền $A B$ bằng $10$.]),
    True([Tâm của đường tròn ngoại tiếp tam giác $O A B$ là điểm $I(3; 4)$.]),
    [Phương trình đường tròn ngoại tiếp tam giác $O A B$ là $(x - 3)^2 + (y - 4)^2 = 100$.]
  ),
  loigiai: [
    #step([Tam giác vuông])
    Vì $A in O x$ và $B in O y$ nên tam giác $O A B$ vuông tại $O$. Mệnh đề a ĐÚNG.

    #step([Độ dài cạnh huyền])
    $A B = sqrt(O A^2 + O B^2) = sqrt(6^2 + 8^2) = sqrt(36 + 64) = 10$. Mệnh đề b ĐÚNG.

    #step([Tâm đường tròn ngoại tiếp])
    Tâm $I$ là trung điểm của $A B$:
    $ x_I = (6 + 0) / 2 = 3; quad y_I = (0 + 8) / 2 = 4 => I(3; 4) $. Mệnh đề c ĐÚNG.

    #step([Phương trình đường tròn ngoại tiếp])
    Bán kính $R = A B / 2 = 10 / 2 = 5 => R^2 = 25$.
    Phương trình đúng là: $(x - 3)^2 + (y - 4)^2 = 25$ (chứ không phải bằng $100$).
    Khẳng định vế phải bằng $100$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Mô hình địa chấn động đất)
#ds([Một trận động đất xảy ra với tâm chấn tại vị trí có tọa độ $I(5; 12)$ (đơn vị trên bản đồ là kilômét).
Vùng ảnh hưởng chấn động mạnh được mô hình bởi hình tròn có tâm $I$ và bán kính $R = 15 text(" km")$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình đường biên của vùng ảnh hưởng địa chấn là $(x - 5)^2 + (y - 12)^2 = 225$.]),
    True([Khoảng cách từ tâm chấn $I$ đến trạm quan sát địa chấn quốc gia tại gốc tọa độ $O(0; 0)$ bằng $13 text(" km")$.]),
    True([Trạm quan sát quốc gia tại $O(0; 0)$ nằm trong vùng chịu ảnh hưởng chấn động mạnh của trận động đất.]),
    [Một thị trấn ven biển nằm tại tọa độ $M(20; 12)$ nằm hoàn toàn bên ngoài vùng ảnh hưởng của trận động đất.]
  ),
  loigiai: [
    #step([Phương trình đường biên])
    Tâm $I(5; 12)$, $R = 15 => R^2 = 225$.
    Phương trình: $(x - 5)^2 + (y - 12)^2 = 225$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách đến trạm quan sát O])
    $O I = sqrt(5^2 + 12^2) = sqrt(25 + 144) = sqrt(169) = 13 text(" km")$. Mệnh đề b ĐÚNG.

    #step([Đánh giá trạm quan sát O])
    Vì $O I = 13 < R = 15$ nên trạm $O$ nằm bên trong vùng chấn động. Mệnh đề c ĐÚNG.

    #step([Đánh giá thị trấn M(20; 12)])
    $I M = sqrt((20 - 5)^2 + (12 - 12)^2) = sqrt(15^2) = 15 text(" km") = R$.
    Thị trấn $M$ nằm ngay trên đường biên chịu chấn động, chứ không nằm bên ngoài.
    Khẳng định nằm hoàn toàn bên ngoài là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số m trong phương trình đường tròn)
#ds([Cho phương trình $(C_m): x^2 + y^2 - 4m x + 2(m + 1)y + 5m^2 - 1 = 0$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Các hệ số của phương trình là $a = 2m$, $b = -(m + 1)$ và $c = 5m^2 - 1$.]),
    True([Biểu thức $a^2 + b^2 - c = 2m + 2$.]),
    True([Phương trình $(C_m)$ là phương trình đường tròn khi và chỉ khi $m > -1$.]),
    [Khi $m = 0$, bán kính của đường tròn tương ứng $(C_0)$ bằng $2$.]
  ),
  loigiai: [
    #step([Xác định hệ số])
    $a = 2m$, $b = -(m + 1)$, $c = 5m^2 - 1$. Mệnh đề a ĐÚNG.

    #step([Rút gọn biểu thức])
    $ a^2 + b^2 - c = (2m)^2 + (-(m + 1))^2 - (5m^2 - 1) = 4m^2 + m^2 + 2m + 1 - 5m^2 + 1 = 2m + 2 $. Mệnh đề b ĐÚNG.

    #step([Điều kiện là đường tròn])
    $a^2 + b^2 - c > 0 <=> 2m + 2 > 0 <=> 2m > -2 <=> m > -1$. Mệnh đề c ĐÚNG.

    #step([Khi m = 0])
    $R = sqrt(2(0) + 2) = sqrt(2)$ (chứ không phải bằng $2$).
    Khẳng định bán kính bằng $2$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Bán kính đường tròn)
#tln([Cho đường tròn $(C): x^2 + y^2 - 6x + 8y - 11 = 0$. Bán kính $R$ của đường tròn bằng bao nhiêu?],
    [6],
    loigiai: [
        #step([Xác định hệ số])
        $a = 3, b = -4, c = -11$.
        
        #step([Tính bán kính])
        $ R = sqrt(a^2 + b^2 - c) = sqrt(3^2 + (-4)^2 - (-11)) = sqrt(9 + 16 + 11) = sqrt(36) = 6 $
    ]
)

// TLN 2 (Khoảng cách từ tâm chấn đến trạm quan sát)
#tln([Trong bài toán tâm chấn động đất tại $I(5; 12)$, khoảng cách từ tâm chấn đến trạm quan sát tại gốc tọa độ $O(0; 0)$ bằng bao nhiêu kilômét?],
    [13],
    loigiai: [
        #step([Tính độ dài đoạn OI])
        $ O I = sqrt(5^2 + 12^2) = sqrt(25 + 144) = sqrt(169) = 13 text(" km") $
    ]
)

// TLN 3 (Bán kính đường tròn ngoại tiếp tam giác vuông)
#tln([Trong tam giác vuông $O A B$ có hai cạnh góc vuông $O A = 6$ và $O B = 8$, bán kính của đường tròn ngoại tiếp tam giác bằng bao nhiêu?],
    [5],
    loigiai: [
        #step([Tính cạnh huyền])
        $ A B = sqrt(6^2 + 8^2) = sqrt(100) = 10 $
        
        #step([Tính bán kính ngoại tiếp])
        $ R = A B / 2 = 10 / 2 = 5 $
    ]
)

// TLN 4 (Giá trị nhỏ nhất của m để không là đường tròn)
#tln([Tìm giá trị nguyên nhỏ nhất của tham số $m$ để phương trình $x^2 + y^2 - 2x + 4y + m = 0$ không phải là phương trình đường tròn.],
    [5],
    loigiai: [
        #step([Điều kiện không phải đường tròn])
        $a = 1, b = -2, c = m$.
        Phương trình không là đường tròn khi:
        $ a^2 + b^2 - c <= 0 <=> 1^2 + (-2)^2 - m <= 0 <=> 5 - m <= 0 <=> m >= 5 $
        Giá trị nguyên nhỏ nhất là $m = 5$.
    ]
)

// TLN 5 (Hệ số tự do tiếp tuyến)
#tln([Tiếp tuyến của đường tròn $x^2 + y^2 = 25$ tại điểm $M(3; 4)$ có phương trình tổng quát dạng $3x + 4y + c = 0$. Tìm giá trị của hệ số tự do $c$.],
    [-25],
    loigiai: [
        #step([Lập phương trình tiếp tuyến])
        Đường tròn tâm $O(0; 0)$. Tiếp tuyến tại $M(3; 4)$ có VTPT $vec(O M) = (3; 4)$:
        $ 3(x - 3) + 4(y - 4) = 0 <=> 3x + 4y - 25 = 0 $
        Đối chiếu với dạng $3x + 4y + c = 0$, ta được $c = -25$.
    ]
)

// TLN 6 (Diện tích tưới cỏ theo pi)
#tln([Một vòi phun xoay tròn tưới cỏ có bán kính phun xa nhất là $R = 8 text(" m")$. Diện tích lớn nhất của bãi cỏ được tưới nước bằng bao nhiêu $pi text(" m"^2)$?],
    [64],
    loigiai: [
        #step([Tính diện tích hình tròn])
        $ S = pi R^2 = pi (8^2) = 64 pi text(" m"^2) $
        Hệ số của $pi$ là $64$.
    ]
)

] // end make-questions

#make-questions()
