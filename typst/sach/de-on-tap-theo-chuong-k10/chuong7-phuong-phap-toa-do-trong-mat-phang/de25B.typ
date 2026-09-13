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
  exam-title: "ÔN TẬP TỔNG HỢP CHƯƠNG VII (ĐỀ SỐ 25B - MÃ ĐỀ 168)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "168",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Phương trình tham số của đường thẳng đi qua điểm $A(2; -3)$ và có vectơ chỉ phương $vec(u) = (1; -4)$ là],
    (
        True([$cases(x = 2 + t, y = -3 - 4t)$]),
        [$cases(x = 1 + 2t, y = -4 - 3t)$],
        [$cases(x = 2 - t, y = -3 - 4t)$],
        [$cases(x = 2 + 4t, y = -3 + t)$]
    ),
    loigiai: [
        Phương trình tham số đi qua $A(x_0; y_0)$ với VTCP $vec(u) = (u_1; u_2)$ là:
        $ cases(x = x_0 + u_1 t, y = y_0 + u_2 t) <=> cases(x = 2 + t, y = -3 - 4t) quad (t in RR) $
    ]
)

// TN 2
#tn([Vị trí tương đối của hai đường thẳng $d_1: 3x - 4y + 1 = 0$ và $d_2: 4x + 3y - 5 = 0$ là],
    (
        True([Vuông góc với nhau]),
        [Song song với nhau],
        [Trùng nhau],
        [Cắt nhau nhưng không vuông góc]
    ),
    loigiai: [
        Vectơ pháp tuyến: $vec(n_1) = (3; -4)$ và $vec(n_2) = (4; 3)$.
        Ta có: $vec(n_1) cdot vec(n_2) = 3(4) + (-4)(3) = 12 - 12 = 0$.
        Do đó hai đường thẳng vuông góc với nhau.
    ]
)

// TN 3
#tn([Khoảng cách giữa hai đường thẳng song song $d_1: 5x - 12y + 1 = 0$ và $d_2: 5x - 12y + 27 = 0$ bằng],
    (
        True([$2$]),
        [$26$],
        [$1$],
        [$4$]
    ),
    loigiai: [
        Áp dụng công thức khoảng cách giữa hai đường thẳng song song:
        $ d(d_1, d_2) = (|27 - 1|) / sqrt(5^2 + (-12)^2) = 26 / 13 = 2 $
    ]
)

// TN 4
#tn([Bán kính $R$ của đường tròn $(C): x^2 + y^2 - 6x - 8y = 0$ bằng],
    (
        True([$5$]),
        [$25$],
        [$10$],
        [$sqrt(7)$]
    ),
    loigiai: [
        Hệ số: $a = 3, b = 4, c = 0$.
        Bán kính: $R = sqrt(a^2 + b^2 - c) = sqrt(3^2 + 4^2 - 0) = sqrt(25) = 5$.
    ]
)

// TN 5
#tn([Số tiếp tuyến kẻ từ điểm $A(0; 5)$ đến đường tròn $(C): x^2 + y^2 = 25$ là],
    (
        True([$1$]),
        [$2$],
        [$0$],
        [Vô số]
    ),
    loigiai: [
        Thay tọa độ điểm $A(0; 5)$ vào phương trình $(C)$: $0^2 + 5^2 = 25$.
        Điểm $A$ nằm trên đường tròn $(C)$.
        Tại một điểm nằm trên đường tròn luôn có đúng $1$ tiếp tuyến duy nhất.
    ]
)

// TN 6
#tn([Độ dài trục nhỏ của Elip $(E): x^2 / 100 + y^2 / 64 = 1$ bằng],
    (
        True([$16$]),
        [$8$],
        [$20$],
        [$12$]
    ),
    loigiai: [
        Ta có $b^2 = 64 => b = 8$.
        Độ dài trục nhỏ là $2b = 2(8) = 16$.
    ]
)

// TN 7
#tn([Tiêu cự của Hypebol $(H): x^2 / 36 - y^2 / 64 = 1$ bằng],
    (
        True([$20$]),
        [$10$],
        [$16$],
        [$12$]
    ),
    loigiai: [
        Ta có $a^2 = 36$ và $b^2 = 64$.
        $ c = sqrt(a^2 + b^2) = sqrt(36 + 64) = sqrt(100) = 10 $
        Tiêu cự là $2c = 2(10) = 20$.
    ]
)

// TN 8
#tn([Phương trình đường chuẩn của Parabol $(P): y^2 = 16x$ là],
    (
        True([$x + 4 = 0$]),
        [$x - 4 = 0$],
        [$x + 8 = 0$],
        [$y + 4 = 0$]
    ),
    loigiai: [
        $2p = 16 => p = 8$.
        Phương trình đường chuẩn: $x = - p / 2 = - 4 <=> x + 4 = 0$.
    ]
)

// TN 9
#tn([Tọa độ giao điểm của hai đường thẳng $d_1: 2x - y - 3 = 0$ và $d_2: x + 2y - 4 = 0$ là],
    (
        True([$(2; 1)$]),
        [$(1; 2)$],
        [$(-2; 1)$],
        [$(2; -1)$]
    ),
    loigiai: [
        Tọa độ giao điểm là nghiệm của hệ phương trình:
        $ cases(2x - y = 3, x + 2y = 4) <=> cases(4x - 2y = 6, x + 2y = 4) <=> cases(5x = 10 => x = 2, y = 1) $
        Giao điểm là $(2; 1)$.
    ]
)

// TN 10
#tn([Điểm nào sau đây nằm bên trong đường tròn $(C): (x - 1)^2 + (y - 2)^2 = 25$?],
    (
        True([$M(2; 3)$]),
        [$N(5; 5)$],
        [$P(1; 7)$],
        [$Q(6; 2)$]
    ),
    loigiai: [
        Thay tọa độ các điểm vào vế trái $(x - 1)^2 + (y - 2)^2$:
        - Với $M(2; 3)$: $(2 - 1)^2 + (3 - 2)^2 = 1 + 1 = 2 < 25$, điểm $M$ nằm bên trong đường tròn.
    ]
)

// TN 11
#tn([Một ngọn hải đăng đặt tại điểm $H(0; 0)$ có tầm quét ánh sáng tròn bán kính $R = 20 text(" hải lý")$.
Một tàu hàng đang di chuyển trên đường thẳng $d: 3x + 4y - 60 = 0$ (đơn vị: hải lý).
Khoảng cách ngắn nhất từ ngọn hải đăng đến tàu hàng bằng],
    (
        True([$12 text(" hải lý")$]),
        [$15 text(" hải lý")$],
        [$20 text(" hải lý")$],
        [$10 text(" hải lý")$]
    ),
    loigiai: [
        Khoảng cách ngắn nhất chính là khoảng cách từ $H(0; 0)$ đến đường thẳng $d$:
        $ d(H, d) = (|3(0) + 4(0) - 60|) / sqrt(3^2 + 4^2) = 60 / 5 = 12 text(" hải lý") $
    ]
)

// TN 12
#tn([Một bếp đun năng lượng mặt trời dùng gương phản xạ parabol có mặt cắt $y^2 = 80x$ (đơn vị: centimét).
Để đun sôi nước nhanh nhất, đáy nồi phải đặt đúng tại tiêu điểm $F$ của gương.
Khoảng cách từ đỉnh gương đến đáy nồi bằng],
    (
        True([$20 text(" cm")$]),
        [$40 text(" cm")$],
        [$80 text(" cm")$],
        [$10 text(" cm")$]
    ),
    loigiai: [
        Phương trình có dạng $y^2 = 2p x => 2p = 80 => p = 40 text(" cm")$.
        Khoảng cách từ đỉnh gương $O$ đến tiêu điểm $F$ là:
        $ O F = p / 2 = 40 / 2 = 20 text(" cm") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đường tròn tiếp xúc hai trục tọa độ có CeTZ)
#ds([Trong góc phần tư thứ nhất, cho đường tròn $(C)$ tiếp xúc với cả hai trục tọa độ $O x, O y$ và có bán kính $R = 3$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-1, 0), (6.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -1), (0, 6.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((6.3, -0.3), [$x$])
  content((-0.3, 6.2), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Đường tròn tâm I(3, 3), R = 3
  circle((3, 3), radius: 3, stroke: 1.2pt + rgb("0d9488"))
  circle((3, 3), radius: 2pt, fill: rgb("0d9488"))
  content((3.3, 3.4), [$I(3; 3)$])
  
  // Nối OI
  line((0, 0), (3, 3), stroke: (dash: "dashed", paint: blue))
  
  // Tiếp điểm trên Ox, Oy
  circle((3, 0), radius: 2pt, fill: red)
  content((3, -0.3), [$3$])
  circle((0, 3), radius: 2pt, fill: red)
  content((-0.3, 3), [$3$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tâm của đường tròn $(C)$ có tọa độ là $I(3; 3)$.]),
    True([Phương trình chính tắc của đường tròn là $(x - 3)^2 + (y - 3)^2 = 9$.]),
    True([Khoảng cách từ gốc tọa độ $O$ đến tâm $I$ của đường tròn bằng $3 sqrt(2)$.]),
    [Đường tròn $(C)$ đi qua gốc tọa độ $O(0; 0)$.]
  ),
  loigiai: [
    #step([Tọa độ tâm])
    Vì $(C)$ nằm ở góc phần tư thứ nhất và tiếp xúc với hai trục nên $a = b = R = 3 => I(3; 3)$. Mệnh đề a ĐÚNG.

    #step([Phương trình đường tròn])
    $(x - 3)^2 + (y - 3)^2 = 3^2 = 9$. Mệnh đề b ĐÚNG.

    #step([Khoảng cách OI])
    $O I = sqrt(3^2 + 3^2) = 3 sqrt(2)$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra gốc tọa độ])
    Thay $O(0; 0)$ vào phương trình: $(0 - 3)^2 + (0 - 3)^2 = 9 + 9 = 18 != 9$.
    Đường tròn không đi qua gốc tọa độ.
    Khẳng định đi qua $O$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Khoảng cách và tiếp tuyến)
#ds([Cho đường tròn $(C): x^2 + y^2 = 16$ và điểm $A(0; 5)$ nằm trên trục tung $O y$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điểm $A(0; 5)$ nằm ngoài đường tròn $(C)$.]),
    True([Từ điểm $A$ kẻ được đúng hai tiếp tuyến phân biệt đến đường tròn $(C)$.]),
    True([Độ dài các đoạn tiếp tuyến kẻ từ $A$ đến các tiếp điểm bằng $3$.]),
    [Đường thẳng nối hai tiếp điểm có phương trình là $x = 16 / 5$.]
  ),
  loigiai: [
    #step([Vị trí điểm A])
    $O A = 5 > R = 4$, điểm $A$ nằm ngoài đường tròn. Mệnh đề a ĐÚNG.

    #step([Số tiếp tuyến])
    Từ điểm ngoài đường tròn luôn kẻ được đúng hai tiếp tuyến. Mệnh đề b ĐÚNG.

    #step([Độ dài tiếp tuyến])
    Gọi $T$ là tiếp điểm: $A T = sqrt(O A^2 - R^2) = sqrt(5^2 - 4^2) = 3$. Mệnh đề c ĐÚNG.

    #step([Đường nối hai tiếp điểm])
    Phương trình đường thẳng nối hai tiếp điểm có dạng:
    $ x_A x + y_A y = R^2 <=> 0x + 5y = 16 <=> y = 16 / 5 $
    Phương trình đúng là $y = 16 / 5$ (chứ không phải $x = 16 / 5$).
    Khẳng định $x = 16/5$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Hải đăng và tàu cá)
#ds([Một ngọn hải đăng đặt tại vị trí $H(0; 0)$ phát ánh sáng báo hiệu trong phạm vi hình tròn bán kính $R = 20 text(" hải lý")$.
Một tàu cá hành trình theo đường thẳng $d: 3x + 4y - 60 = 0$ (đơn vị: hải lý).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khoảng cách ngắn nhất từ hải đăng $H$ đến đường đi của tàu cá bằng $12 text(" hải lý")$.]),
    True([Tàu cá đi qua vùng nhận được ánh sáng của ngọn hải đăng.]),
    True([Chiều dài quãng đường tàu cá di chuyển trong vùng nhận được ánh sáng hải đăng là $32 text(" hải lý")$.]),
    [Nếu tàu cá chạy với tốc độ không đổi $16 text(" hải lý/h")$ thì thời gian tàu nhận được ánh sáng hải đăng là $1.5 text(" giờ")$.]
  ),
  loigiai: [
    #step([Khoảng cách ngắn nhất])
    $h = d(H, d) = (|-60|) / sqrt(3^2 + 4^2) = 60 / 5 = 12 text(" hải lý")$. Mệnh đề a ĐÚNG.

    #step([Vào vùng phát sáng])
    Vì $h = 12 < R = 20$ nên đường thẳng cắt đường tròn tại hai điểm phân biệt. Mệnh đề b ĐÚNG.

    #step([Chiều dài quãng đường])
    $L = 2 sqrt(R^2 - h^2) = 2 sqrt(20^2 - 12^2) = 2 sqrt(400 - 144) = 2 sqrt(256) = 2(16) = 32 text(" hải lý")$. Mệnh đề c ĐÚNG.

    #step([Thời gian nhận ánh sáng])
    $t = L / v = 32 / 16 = 2 text(" giờ")$ (chứ không phải $1.5 text(" giờ")$).
    Khẳng định thời gian bằng $1.5 text(" giờ")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tập hợp điểm và ba đường conic)
#ds([Trong mặt phẳng $O x y$, cho hai điểm cố định $F_1(-4; 0)$, $F_2(4; 0)$ và điểm $M(x; y)$ thay đổi.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tập hợp các điểm $M$ thỏa mãn $M F_1 + M F_2 = 10$ là một đường Elip có phương trình $x^2 / 25 + y^2 / 9 = 1$.]),
    True([Tập hợp các điểm $M$ thỏa mãn $|M F_1 - M F_2| = 6$ là một đường Hypebol có phương trình $x^2 / 9 - y^2 / 7 = 1$.]),
    True([Tập hợp các điểm $M$ cách đều điểm $F(2; 0)$ và đường thẳng $x + 2 = 0$ là một đường Parabol có phương trình $y^2 = 8x$.]),
    [Tập hợp các điểm $M$ thỏa mãn $M F_1 + M F_2 = 8$ là một đường Elip.]
  ),
  loigiai: [
    #step([Elip])
    $2a = 10 > 2c = 8 => a = 5, c = 4 => b^2 = 25 - 16 = 9$. Phương trình: $x^2 / 25 + y^2 / 9 = 1$. Mệnh đề a ĐÚNG.

    #step([Hypebol])
    $2a = 6 < 2c = 8 => a = 3, c = 4 => b^2 = 16 - 9 = 7$. Phương trình: $x^2 / 9 - y^2 / 7 = 1$. Mệnh đề b ĐÚNG.

    #step([Parabol])
    Tiêu điểm $F(2; 0) => p / 2 = 2 => p = 4$. Đường chuẩn $x = -2$. Phương trình: $y^2 = 2p x = 8x$. Mệnh đề c ĐÚNG.

    #step([Trường hợp suy biến])
    Vì $F_1 F_2 = 8$, nên khi $M F_1 + M F_2 = 8 = F_1 F_2$, theo bất đẳng thức tam giác điểm $M$ phải nằm trên đoạn thẳng nối hai tiêu điểm $F_1 F_2$ chứ không phải đường Elip!
    Khẳng định là một đường Elip là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Bán kính đường tròn)
#tln([Cho đường tròn $(C): x^2 + y^2 - 6x - 8y = 0$. Bán kính của đường tròn bằng bao nhiêu?],
    [5],
    loigiai: [
        #step([Tính bán kính])
        $a = 3, b = 4, c = 0$.
        $ R = sqrt(3^2 + 4^2 - 0) = 5 $
    ]
)

// TLN 2 (Chiều dài quãng đường trong tầm hải đăng)
#tln([Trong bài toán ngọn hải đăng $R = 20 text(" hải lý")$, chiều dài quãng đường mà tàu cá di chuyển trong vùng nhận được ánh sáng hải đăng bằng bao nhiêu hải lý?],
    [32],
    loigiai: [
        #step([Tính độ dài dây cung])
        Khoảng cách $h = 12 text(" hải lý")$.
        $ L = 2 sqrt(R^2 - h^2) = 2 sqrt(20^2 - 12^2) = 2(16) = 32 text(" hải lý") $
    ]
)

// TLN 3 (Khoảng cách từ đỉnh gương đến nồi nước)
#tln([Trong bài toán gương bếp mặt trời Parabol $y^2 = 80x$, khoảng cách từ đỉnh gương đến đáy nồi đun tại tiêu điểm bằng bao nhiêu centimét?],
    [20],
    loigiai: [
        #step([Tính tiêu cự])
        $ 2p = 80 => p = 40 $
        $ O F = p / 2 = 40 / 2 = 20 text(" cm") $
    ]
)

// TLN 4 (Khoảng cách giữa hai đường song song)
#tln([Khoảng cách giữa hai đường thẳng song song $5x - 12y + 1 = 0$ và $5x - 12y + 27 = 0$ bằng bao nhiêu?],
    [2],
    loigiai: [
        #step([Áp dụng công thức khoảng cách])
        $ d = (|27 - 1|) / sqrt(5^2 + (-12)^2) = 26 / 13 = 2 $
    ]
)

// TLN 5 (Độ dài trục nhỏ Elip)
#tln([Cho Elip $(E): x^2 / 100 + y^2 / 64 = 1$. Độ dài trục nhỏ của Elip bằng bao nhiêu?],
    [16],
    loigiai: [
        #step([Xác định bán trục nhỏ b])
        $ b^2 = 64 => b = 8 $
        
        #step([Tính trục nhỏ])
        $ 2b = 2(8) = 16 $
    ]
)

// TLN 6 (Tiêu cự Hypebol)
#tln([Cho Hypebol $(H): x^2 / 36 - y^2 / 64 = 1$. Tiêu cự của Hypebol bằng bao nhiêu?],
    [20],
    loigiai: [
        #step([Tính c])
        $ c = sqrt(36 + 64) = 10 $
        
        #step([Tính tiêu cự])
        $ 2c = 2(10) = 20 $
    ]
)

] // end make-questions

#make-questions()
