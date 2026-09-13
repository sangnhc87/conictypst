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
  exam-title: "BÀI 21: ĐƯỜNG TRÒN TRONG MẶT PHẲNG TỌA ĐỘ (ĐỀ SỐ 23B - VẬN DỤNG & THỰC TIỄN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "162",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Đường kính của đường tròn $(C): x^2 + y^2 - 6x + 2y - 15 = 0$ bằng],
    (
        True([$10$]),
        [$5$],
        [$25$],
        [$20$]
    ),
    loigiai: [
        Hệ số: $a = 3, b = -1, c = -15$.
        Bán kính: $R = sqrt(a^2 + b^2 - c) = sqrt(3^2 + (-1)^2 - (-15)) = sqrt(9 + 1 + 15) = sqrt(25) = 5$.
        Đường kính: $d = 2R = 2(5) = 10$.
    ]
)

// TN 2
#tn([Phương trình đường tròn có tâm $I(2; -1)$ và đi qua điểm $A(5; 3)$ là],
    (
        True([$(x - 2)^2 + (y + 1)^2 = 25$]),
        [$(x + 2)^2 + (y - 1)^2 = 25$],
        [$(x - 2)^2 + (y + 1)^2 = 5$],
        [$(x - 5)^2 + (y - 3)^2 = 25$]
    ),
    loigiai: [
        Bán kính $R$ là khoảng cách $I A$:
        $ R^2 = I A^2 = (5 - 2)^2 + (3 - (-1))^2 = 3^2 + 4^2 = 25 $
        Phương trình: $(x - 2)^2 + (y + 1)^2 = 25$.
    ]
)

// TN 3
#tn([Phương trình đường tròn ngoại tiếp tam giác $A B C$ với $A(1; 2)$, $B(5; 2)$ và $C(1; -2)$ là],
    (
        True([$(x - 3)^2 + y^2 = 8$]),
        [$(x - 3)^2 + y^2 = 16$],
        [$(x + 3)^2 + y^2 = 8$],
        [$(x - 3)^2 + (y - 1)^2 = 8$]
    ),
    loigiai: [
        Ta có: $vec(A B) = (4; 0)$ và $vec(A C) = (0; -4)$.
        Vì $vec(A B) cdot vec(A C) = 4(0) + 0(-4) = 0$ nên tam giác $A B C$ vuông tại $A$.
        Tâm $I$ là trung điểm cạnh huyền $B C$:
        $ x_I = (5 + 1) / 2 = 3; quad y_I = (2 + (-2)) / 2 = 0 => I(3; 0) $
        Bán kính bình phương: $R^2 = I B^2 = (5 - 3)^2 + (2 - 0)^2 = 4 + 4 = 8$.
        Phương trình: $(x - 3)^2 + y^2 = 8$.
    ]
)

// TN 4
#tn([Phương trình tiếp tuyến của đường tròn $(C): (x - 2)^2 + (y + 1)^2 = 13$ tại điểm $M(4; 2) in (C)$ là],
    (
        True([$2x + 3y - 14 = 0$]),
        [$2x + 3y + 14 = 0$],
        [$3x + 2y - 16 = 0$],
        [$2x - 3y + 2 = 0$]
    ),
    loigiai: [
        Tâm đường tròn là $I(2; -1)$.
        Vectơ pháp tuyến của tiếp tuyến: $vec(I M) = (4 - 2; 2 - (-1)) = (2; 3)$.
        Phương trình tiếp tuyến đi qua $M(4; 2)$:
        $ 2(x - 4) + 3(y - 2) = 0 <=> 2x - 8 + 3y - 6 = 0 <=> 2x + 3y - 14 = 0 $
    ]
)

// TN 5
#tn([Số tiếp tuyến của đường tròn $(C): (x - 1)^2 + (y - 2)^2 = 9$ song song với đường thẳng $d: 3x - 4y + 1 = 0$ là],
    (
        True([$2$]),
        [$1$],
        [$0$],
        [Vô số]
    ),
    loigiai: [
        Với mọi đường thẳng $d$ trong mặt phẳng, luôn có đúng hai tiếp tuyến của đường tròn song song với $d$ (nằm ở hai phía đối xứng qua tâm của đường tròn).
    ]
)

// TN 6
#tn([Một tiếp tuyến của đường tròn $(C): x^2 + y^2 = 4$ song song với đường thẳng $d: 3x - 4y + 1 = 0$ có phương trình là],
    (
        True([$3x - 4y + 10 = 0$]),
        [$3x - 4y + 5 = 0$],
        [$4x + 3y + 10 = 0$],
        [$3x - 4y + 2 = 0$]
    ),
    loigiai: [
        Tiếp tuyến song song với $d$ có dạng: $3x - 4y + c = 0$ ($c != 1$).
        Đường tròn có tâm $O(0; 0)$ và bán kính $R = 2$.
        $ d(O, Delta) = (|c|) / sqrt(3^2 + (-4)^2) = (|c|) / 5 = 2 <=> |c| = 10 <=> c = plus.minus 10 $
        Hai tiếp tuyến là $3x - 4y + 10 = 0$ và $3x - 4y - 10 = 0$.
    ]
)

// TN 7
#tn([Độ dài dây cung mà đường thẳng $d: 3x - 4y - 15 = 0$ cắt đường tròn $(C): x^2 + y^2 = 25$ bằng],
    (
        True([$8$]),
        [$4$],
        [$6$],
        [$10$]
    ),
    loigiai: [
        Tâm $O(0; 0)$, bán kính $R = 5$.
        Khoảng cách từ tâm $O$ đến đường thẳng $d$:
        $ h = d(O, d) = (|-15|) / sqrt(3^2 + (-4)^2) = 15 / 5 = 3 $
        Nửa độ dài dây cung: $sqrt(R^2 - h^2) = sqrt(5^2 - 3^2) = sqrt(16) = 4$.
        Độ dài dây cung là $2 times 4 = 8$.
    ]
)

// TN 8
#tn([Vị trí tương đối của hai đường tròn $(C_1): (x - 1)^2 + (y - 2)^2 = 4$ và $(C_2): (x - 4)^2 + (y - 6)^2 = 9$ là],
    (
        True([Tiếp xúc ngoài]),
        [Cắt nhau tại hai điểm],
        [Ở ngoài nhau],
        [Tiếp xúc trong]
    ),
    loigiai: [
        - $(C_1)$ có tâm $I_1(1; 2)$, bán kính $R_1 = 2$.
        - $(C_2)$ có tâm $I_2(4; 6)$, bán kính $R_2 = 3$.
        Khoảng cách nối tâm:
        $ I_1 I_2 = sqrt((4 - 1)^2 + (6 - 2)^2) = sqrt(3^2 + 4^2) = 5 $
        Vì $I_1 I_2 = 5 = R_1 + R_2 = 2 + 3$ nên hai đường tròn tiếp xúc ngoài nhau.
    ]
)

// TN 9
#tn([Tìm tất cả các giá trị của tham số $m$ để đường thẳng $d: x + y + m = 0$ tiếp xúc với đường tròn $(C): x^2 + y^2 = 2$.],
    (
        True([$m = plus.minus 2$]),
        [$m = plus.minus 4$],
        [$m = 2$],
        [$m = plus.minus sqrt(2)$]
    ),
    loigiai: [
        Đường tròn có tâm $O(0; 0)$ và bán kính $R = sqrt(2)$.
        Đường thẳng tiếp xúc với đường tròn khi và chỉ khi $d(O, d) = R$:
        $ (|m|) / sqrt(1^2 + 1^2) = sqrt(2) <=> (|m|) / sqrt(2) = sqrt(2) <=> |m| = 2 <=> m = plus.minus 2 $
    ]
)

// TN 10
#tn([Cho tam giác đều $A B C$ nội tiếp đường tròn $(C): x^2 + y^2 = 16$. Độ dài cạnh của tam giác đều bằng],
    (
        True([$4 sqrt(3)$]),
        [$4$],
        [$8$],
        [$2 sqrt(3)$]
    ),
    loigiai: [
        Bán kính đường tròn ngoại tiếp tam giác đều cạnh $a$ là $R = a / sqrt(3)$.
        Ta có $R = sqrt(16) = 4$.
        Suy ra $a = R sqrt(3) = 4 sqrt(3)$.
    ]
)

// TN 11
#tn([Một vòng đu quay khổng lồ (Sun Wheel) có tâm trục quay ở độ cao $64 text(" m")$ so với mặt đất và bán kính vòng quay bằng $50 text(" m")$.
Chọn hệ trục tọa độ $O x y$ sao cho mặt đất trùng trục hoành $O x$, trục tung đi qua tâm trục quay.
Phương trình quỹ đạo quay của các cabin là],
    (
        True([$x^2 + (y - 64)^2 = 2500$]),
        [$(x - 64)^2 + y^2 = 2500$],
        [$x^2 + (y - 64)^2 = 50$],
        [$x^2 + (y + 64)^2 = 2500$]
    ),
    loigiai: [
        Tâm trục quay có tọa độ $I(0; 64)$, bán kính $R = 50 text(" m")$.
        Phương trình quỹ đạo: $x^2 + (y - 64)^2 = 50^2 = 2500$.
    ]
)

// TN 12
#tn([Một trạm định vị bờ biển phát tín hiệu định vị trong phạm vi hình tròn có tâm $I(10; 20)$ và bán kính phủ sóng $R = 15 text(" hải lý")$.
Một tàu buôn đang di chuyển tại vị trí $B(22; 29)$ (đơn vị: hải lý).
Khoảng cách từ tàu buôn $B$ đến trạm định vị $I$ là],
    (
        True([$15 text(" hải lý")$]),
        [$20 text(" hải lý")$],
        [$12 text(" hải lý")$],
        [$18 text(" hải lý")$]
    ),
    loigiai: [
        Khoảng cách $I B$:
        $ I B = sqrt((22 - 10)^2 + (29 - 20)^2) = sqrt(12^2 + 9^2) = sqrt(144 + 81) = sqrt(225) = 15 text(" hải lý") $
        Tàu buôn $B$ nằm ngay trên ranh giới tầm phủ sóng của trạm.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đường tròn và dây cung có CeTZ)
#ds([Trong mặt phẳng tọa độ $O x y$, cho đường tròn $(C): x^2 + y^2 = 25$ và đường thẳng $d: 3x - 4y - 15 = 0$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-6, 0), (6, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -6), (0, 6), stroke: 0.8pt, mark: (end: "stealth"))
  content((5.8, -0.3), [$x$])
  content((-0.3, 5.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Đường tròn tâm O, R = 5
  circle((0, 0), radius: 3, stroke: 1.2pt + rgb("0d9488"))
  content((2.5, 2.5), [$(C)$])
  
  // Đường thẳng d: 3x - 4y - 15 = 0 -> cắt tại A(5, 0) và B(-0.6, -4.2)
  line((-2, -5.25), (6, 0.75), stroke: 1.2pt + red)
  content((5.5, 1.1), [$d$])
  
  // Minh họa khoảng cách OH = 3
  line((0, 0), (1.08, -1.44), stroke: (dash: "dashed", paint: blue))
  content((1.2, -0.7), [$h = 3$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đường tròn $(C)$ có tâm là gốc tọa độ $O(0; 0)$ và bán kính $R = 5$.]),
    True([Khoảng cách từ tâm $O$ đến đường thẳng $d$ bằng $3$.]),
    True([Đường thẳng $d$ cắt đường tròn $(C)$ tại hai điểm phân biệt $A$ và $B$.]),
    [Độ dài dây cung $A B$ bằng $10$.]
  ),
  loigiai: [
    #step([Tâm và bán kính])
    Phương trình chính tắc $x^2 + y^2 = 25$ có tâm $O(0; 0)$, bán kính $R = 5$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách từ tâm])
    $h = d(O, d) = (|-15|) / sqrt(3^2 + (-4)^2) = 15 / 5 = 3$. Mệnh đề b ĐÚNG.

    #step([Số giao điểm])
    Vì $h = 3 < R = 5$ nên đường thẳng cắt đường tròn tại hai điểm phân biệt. Mệnh đề c ĐÚNG.

    #step([Độ dài dây cung])
    $A B = 2 sqrt(R^2 - h^2) = 2 sqrt(5^2 - 3^2) = 2 sqrt(16) = 2(4) = 8$ (chứ không phải $10$).
    Khẳng định dây cung bằng $10$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Hai tiếp tuyến kẻ từ một điểm ngoài đường tròn)
#ds([Cho đường tròn $(C): x^2 + y^2 = 9$ và điểm $A(5; 0)$ nằm trên trục hoành $O x$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điểm $A(5; 0)$ nằm ngoài đường tròn $(C)$.]),
    True([Từ điểm $A$ kẻ được đúng hai tiếp tuyến phân biệt đến đường tròn $(C)$.]),
    True([Độ dài các đoạn tiếp tuyến kẻ từ $A$ đến các tiếp điểm bằng $4$.]),
    [Đường thẳng nối hai tiếp điểm đi qua gốc tọa độ $O(0; 0)$.]
  ),
  loigiai: [
    #step([Vị trí điểm A])
    Đường tròn $(C)$ có tâm $O(0; 0)$, bán kính $R = 3$.
    $O A = 5 > R = 3$, điểm $A$ nằm ngoài đường tròn. Mệnh đề a ĐÚNG.

    #step([Số tiếp tuyến])
    Từ một điểm nằm ngoài đường tròn luôn kẻ được đúng hai tiếp tuyến đến đường tròn. Mệnh đề b ĐÚNG.

    #step([Độ dài đoạn tiếp tuyến])
    Gọi $T$ là tiếp điểm. Tam giác $O A T$ vuông tại $T$:
    $ A T = sqrt(O A^2 - O T^2) = sqrt(5^2 - 3^2) = sqrt(16) = 4 $. Mệnh đề c ĐÚNG.

    #step([Đường nối hai tiếp điểm])
    Phương trình đường thẳng nối hai tiếp điểm (dây cung tiếp xúc) của điểm $A(x_0; y_0)$ là:
    $ x_0 x + y_0 y = R^2 <=> 5x + 0y = 9 <=> x = 9 / 5 $
    Đường thẳng $x = 9/5$ không đi qua gốc tọa độ $O(0; 0)$.
    Khẳng định đi qua $O$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Vòng quay Sun Wheel)
#ds([Một vòng đu quay khổng lồ có tâm trục quay đặt tại vị trí $I(0; 60)$ và bán kính vòng quay $R = 50 text(" m")$ (mặt đất là trục $O x$, đơn vị tính bằng mét).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình đường vành ngoài của vòng đu quay là $x^2 + (y - 60)^2 = 2500$.]),
    True([Điểm cao nhất của vòng đu quay so với mặt đất đạt độ cao $110 text(" m")$.]),
    True([Điểm thấp nhất của vòng đu quay cách mặt đất một khoảng bằng $10 text(" m")$.]),
    [Khi một cabin ở vị trí có hoành độ $x = 30 text(" m")$, độ cao của nó so với mặt đất bằng $120 text(" m")$.]
  ),
  loigiai: [
    #step([Phương trình vành ngoài])
    Tâm $I(0; 60)$, bán kính $R = 50$:
    $ x^2 + (y - 60)^2 = 50^2 = 2500 $. Mệnh đề a ĐÚNG.

    #step([Độ cao lớn nhất])
    $y_text("max") = y_I + R = 60 + 50 = 110 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Độ cao nhỏ nhất])
    $y_text("min") = y_I - R = 60 - 50 = 10 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Độ cao khi x = 30m])
    Thay $x = 30$ vào phương trình:
    $ 30^2 + (y - 60)^2 = 2500 <=> (y - 60)^2 = 2500 - 900 = 1600 $
    $ <=> y - 60 = plus.minus 40 <=> cases(y = 100 text(" m"), y = 20 text(" m")) $
    Độ cao là $100 text(" m")$ hoặc $20 text(" m")$ (chứ không thể là $120 text(" m")$).
    Khẳng định độ cao bằng $120 text(" m")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số m và điều kiện tiếp xúc)
#ds([Cho đường tròn $(C): (x - 1)^2 + (y + 2)^2 = 25$ và đường thẳng $d_m: 3x - 4y + m = 0$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đường tròn $(C)$ có tâm là $I(1; -2)$ và bán kính $R = 5$.]),
    True([Khoảng cách từ tâm $I$ đến đường thẳng $d_m$ là $d(I, d_m) = (|m + 11|) / 5$.]),
    True([Đường thẳng $d_m$ tiếp xúc với đường tròn $(C)$ khi và chỉ khi $m = 14$ hoặc $m = -36$.]),
    [Có vô số giá trị nguyên của tham số $m$ để đường thẳng $d_m$ cắt đường tròn $(C)$ tại hai điểm phân biệt.]
  ),
  loigiai: [
    #step([Tâm và bán kính])
    Tâm $I(1; -2)$, bán kính $R = 5$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách từ I đến dm])
    $d(I, d_m) = (|3(1) - 4(-2) + m|) / sqrt(3^2 + (-4)^2) = (|3 + 8 + m|) / 5 = (|m + 11|) / 5$. Mệnh đề b ĐÚNG.

    #step([Điều kiện tiếp xúc])
    $d(I, d_m) = R <=> (|m + 11|) / 5 = 5 <=> |m + 11| = 25 <=> cases(m + 11 = 25 => m = 14, m + 11 = -25 => m = -36)$. Mệnh đề c ĐÚNG.

    #step([Điều kiện cắt nhau])
    $d(I, d_m) < R <=> |m + 11| < 25 <=> -25 < m + 11 < 25 <=> -36 < m < 14$.
    Số giá trị nguyên của $m$ là hữu hạn: từ $-35$ đến $13$ gồm $13 - (-35) + 1 = 49$ giá trị nguyên (chứ không phải vô số).
    Khẳng định có vô số giá trị nguyên là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Đường kính đường tròn)
#tln([Cho đường tròn $(C): x^2 + y^2 - 6x + 2y - 15 = 0$. Đường kính của đường tròn bằng bao nhiêu?],
    [10],
    loigiai: [
        #step([Tính bán kính])
        $a = 3, b = -1, c = -15$.
        $ R = sqrt(3^2 + (-1)^2 - (-15)) = sqrt(9 + 1 + 15) = 5 $
        
        #step([Tính đường kính])
        $ d = 2R = 2(5) = 10 $
    ]
)

// TLN 2 (Độ cao lớn nhất của Sun Wheel)
#tln([Trong bài toán vòng đu quay khổng lồ tâm $I(0; 60)$ và bán kính $R = 50 text(" m")$, độ cao lớn nhất mà du khách có thể đạt tới so với mặt đất bằng bao nhiêu mét?],
    [110],
    loigiai: [
        #step([Tính độ cao cực đại])
        $ y_text("max") = y_I + R = 60 + 50 = 110 text(" m") $
    ]
)

// TLN 3 (Độ dài đoạn tiếp tuyến)
#tln([Từ điểm $A(5; 0)$ kẻ tiếp tuyến đến đường tròn $x^2 + y^2 = 9$. Độ dài đoạn tiếp tuyến từ điểm $A$ đến tiếp điểm bằng bao nhiêu?],
    [4],
    loigiai: [
        #step([Áp dụng định lý Pythagore])
        Tam giác vuông $O A T$ có cạnh huyền $O A = 5$ và cạnh góc vuông $R = 3$:
        $ A T = sqrt(O A^2 - R^2) = sqrt(5^2 - 3^2) = sqrt(16) = 4 $
    ]
)

// TLN 4 (Độ dài dây cung)
#tln([Đường thẳng $3x - 4y - 15 = 0$ cắt đường tròn $x^2 + y^2 = 25$ tạo thành một dây cung có độ dài bằng bao nhiêu?],
    [8],
    loigiai: [
        #step([Tính khoảng cách từ tâm])
        $ h = (|-15|) / sqrt(3^2 + (-4)^2) = 15 / 5 = 3 $
        
        #step([Tính độ dài dây cung])
        $ A B = 2 sqrt(R^2 - h^2) = 2 sqrt(5^2 - 3^2) = 2(4) = 8 $
    ]
)

// TLN 5 (Giá trị dương của m để tiếp xúc)
#tln([Tìm giá trị dương của tham số $m$ để đường thẳng $x + y + m = 0$ tiếp xúc với đường tròn $x^2 + y^2 = 2$.],
    [2],
    loigiai: [
        #step([Điều kiện tiếp xúc])
        $ d(O, d) = R <=> (|m|) / sqrt(1^2 + 1^2) = sqrt(2) <=> |m| = 2 $
        Vì $m > 0$ nên $m = 2$.
    ]
)

// TLN 6 (Bình phương độ dài cạnh tam giác đều)
#tln([Cho tam giác đều nội tiếp đường tròn bán kính $R = 6$. Bình phương độ dài cạnh của tam giác đều bằng bao nhiêu?],
    [108],
    loigiai: [
        #step([Tính độ dài cạnh tam giác đều])
        $ a = R sqrt(3) = 6 sqrt(3) $
        
        #step([Tính bình phương độ dài])
        $ a^2 = (6 sqrt(3))^2 = 36 times 3 = 108 $
    ]
)

] // end make-questions

#make-questions()
