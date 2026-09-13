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
  school: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP",
  exam-title: "ÔN TẬP CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP (ĐỀ SỐ 29C - NÂNG CAO & VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "184",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Đa giác đều 24 đỉnh - Tam giác đều)
#tn([Cho đa giác đều có $24$ đỉnh nội tiếp trong đường tròn tâm $O$. Có bao nhiêu tam giác đều có $3$ đỉnh là các đỉnh của đa giác đều đã cho?],
    (
        True([$8$]),
        [$24$],
        [$12$],
        [$6$]
    ),
    loigiai: [
        *Phương pháp giải:* Một tam giác đều nội tiếp chia đường tròn thành 3 cung bằng nhau, mỗi cung có số đo $360^circle / 3 = 120^circle$. Đa giác đều có 24 đỉnh thì mỗi cung nhỏ giữa 2 đỉnh liên tiếp là $360^circle / 24 = 15^circle$. Do đó mỗi cạnh của tam giác đều chắn đúng $120 / 15 = 8$ cạnh của đa giác.
        - Mỗi tam giác đều được xác định bởi đỉnh đầu tiên trong nhóm 8 đỉnh liên tiếp ${A_1, A_2, ..., A_8}$.
        - Các đỉnh còn lại tự động là $A_(i + 8)$ và $A_(i + 16)$.
        Do đó số tam giác đều là:
        $ 24 / 3 = 8 text(" tam giác đều") $
    ]
)

// TN 2 (Derangement D5)
#tn([Có $5$ lá thư gửi cho $5$ người bạn khác nhau được người đưa thư bỏ ngẫu nhiên vào $5$ phong bì có dán sẵn địa chỉ của $5$ người đó (mỗi phong bì đúng một lá thư). Hỏi có bao nhiêu cách bỏ thư sao cho không có bất kỳ lá thư nào đến đúng người nhận?],
    (
        True([$44$]),
        [$120$],
        [$45$],
        [$60$]
    ),
    loigiai: [
        *Phương pháp giải:* Đây là bài toán hoán vị không điểm cố định (Derangement $D_n$) với $n = 5$.
        Áp dụng công thức Euler - Bernoulli:
        $ D_n = n! sum_(k = 0)^n ((-1)^k) / (k!) $
        Với $n = 5$:
        $ D_5 = 5! (1 - 1 / (1!) + 1 / (2!) - 1 / (3!) + 1 / (4!) - 1 / (5!)) $
        $ = 120 (1 - 1 + 1 / 2 - 1 / 6 + 1 / 24 - 1 / 120) $
        $ = 120 (60 / 120 - 20 / 120 + 5 / 120 - 1 / 120) = 60 - 20 + 5 - 1 = 44 text(" cách") $
    ]
)

// TN 3 (Tổng hệ số bậc chẵn của tam thức)
#tn([Khai triển đa thức $P(x) = (1 + x - x^2)^5 = a_10 x^10 + a_9 x^9 + ... + a_1 x + a_0$. Tổng các hệ số của các lũy thừa bậc chẵn $S = a_0 + a_2 + a_4 + a_6 + a_8 + a_10$ bằng],
    (
        True([$0$]),
        [$1$],
        [$-1$],
        [$16$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp gán giá trị đặc biệt $x = 1$ và $x = -1$.
        Ta có:
        - Tại $x = 1$: $P(1) = (1 + 1 - 1)^5 = 1^5 = 1 = a_0 + a_1 + a_2 + ... + a_10$.
        - Tại $x = -1$: $P(-1) = (1 + (-1) - (-1)^2)^5 = (1 - 1 - 1)^5 = (-1)^5 = -1 = a_0 - a_1 + a_2 - ... + a_10$.
        Cộng hai đẳng thức trên vế theo vế:
        $ P(1) + P(-1) = 2(a_0 + a_2 + a_4 + a_6 + a_8 + a_10) = 2 S $
        $ => S = (1 + (-1)) / 2 = 0 $
    ]
)

// TN 4 (Phân hoạch thặng dư mod 3 có CeTZ)
#tn([Cho tập hợp $A = {1, 2, 3, ..., 20}$. Có bao nhiêu tập hợp con gồm đúng $3$ phần tử của $A$ sao cho tổng của $3$ phần tử đó là một số chia hết cho $3$?],
    (
        True([$384$]),
        [$340$],
        [$420$],
        [$360$]
    ),
    loigiai: [
        *Phương pháp giải:* Phân hoạch tập hợp $A$ thành 3 lớp thặng dư theo số dư khi chia cho 3:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (2.2, 0.7), fill: rgb("fef3c7"), stroke: 1pt + accent)
          content((1.1, 0.35), [$A_0$: mod 3 = 0 (6 số)])
          
          rect((2.5, 0), (4.7, 0.7), fill: rgb("dbeafe"), stroke: 1pt + blue)
          content((3.6, 0.35), [$A_1$: mod 3 = 1 (7 số)])
          
          rect((5.0, 0), (7.2, 0.7), fill: rgb("fee2e2"), stroke: 1pt + red)
          content((6.1, 0.35), [$A_2$: mod 3 = 2 (7 số)])
        })
        ]
        - $A_0 = {3, 6, 9, 12, 15, 18}$: gồm $6$ phần tử.
        - $A_1 = {1, 4, 7, 10, 13, 16, 19}$: gồm $7$ phần tử.
        - $A_2 = {2, 5, 8, 11, 14, 17, 20}$: gồm $7$ phần tử.
        Tổng của 3 số chia hết cho 3 xảy ra trong hai trường hợp:
        - #step([Trường hợp 1: Cả 3 số cùng thuộc một lớp])
          $ C_6^3 + C_7^3 + C_7^3 = 20 + 35 + 35 = 90 text(" tập con") $
        - #step([Trường hợp 2: Mỗi số thuộc một lớp khác nhau])
          $ 6 times 7 times 7 = 294 text(" tập con") $
        Theo quy tắc cộng:
        $ 90 + 294 = 384 text(" tập con") $
    ]
)

// TN 5 (Hệ số đa thức bậc 4)
#tn([Tìm hệ số của số hạng chứa $x^3$ trong khai triển của đa thức $P(x) = (1 + 2x + 3x^2)^4$.],
    (
        True([$104$]),
        [$96$],
        [$120$],
        [$80$]
    ),
    loigiai: [
        *Phương pháp giải:* Nhóm $P(x) = [1 + x(2 + 3x)]^4$ và khai triển nhị thức Newton theo biến phụ $u = x(2 + 3x)$.
        $ P(x) = C_4^0 + C_4^1 x(2 + 3x) + C_4^2 x^2 (2 + 3x)^2 + C_4^3 x^3 (2 + 3x)^3 + C_4^4 x^4 (2 + 3x)^4 $
        Các số hạng có khả năng sinh ra $x^3$:
        - Từ $C_4^2 x^2 (2 + 3x)^2 = 6 x^2 (4 + 12x + 9x^2)$:
          Hệ số của $x^3$ là $6 times 12 = 72$.
        - Từ $C_4^3 x^3 (2 + 3x)^3 = 4 x^3 (8 + 36x + ...)$:
          Hệ số của $x^3$ là $4 times 8 = 32$.
        Tổng hệ số của $x^3$ là:
        $ 72 + 32 = 104 $
    ]
)

// TN 6 (Stars and Bars có cận trên có CeTZ)
#tn([Phương trình $x_1 + x_2 + x_3 = 11$ có bao nhiêu bộ nghiệm nguyên thỏa mãn điều kiện $1 <= x_1, x_2, x_3 <= 5$?],
    (
        True([$15$]),
        [$45$],
        [$30$],
        [$21$]
    ),
    loigiai: [
        *Phương pháp giải:* Đổi biến $y_i = x_i - 1$ ($0 <= y_i <= 4$) đưa về bài toán $y_1 + y_2 + y_3 = 8$. Sử dụng nguyên lý bù trừ PIE loại bỏ các trường hợp vi phạm cận trên ($y_i >= 5$).
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (6, 1.2), stroke: 1pt + gray, fill: rgb("f9fafb"))
          content((3, 0.9), [Toàn bộ nghiệm không âm: $C_10^2 = 45$])
          rect((0.5, 0.1), (5.5, 0.6), fill: rgb("fee2e2"), stroke: 1pt + red)
          content((3, 0.35), [Vi phạm $y_i >= 5$: $3 times C_5^2 = 30$])
        })
        ]
        - Tổng số nghiệm không âm của $y_1 + y_2 + y_3 = 8$:
          $ C_(8 + 3 - 1)^(3 - 1) = C_10^2 = (10 times 9) / 2 = 45 text(" nghiệm") $
        - Số nghiệm vi phạm cận trên ($y_i >= 5$):
          Có 3 cách chọn biến vi phạm (giả sử $y_1 >= 5$).
          Đặt $z_1 = y_1 - 5 >= 0$, phương trình thành $z_1 + y_2 + y_3 = 3$.
          Số nghiệm: $C_(3 + 3 - 1)^2 = C_5^2 = 10$.
          Số nghiệm vi phạm: $3 times 10 = 30$ nghiệm (không thể có 2 biến cùng $>= 5$ vì $5 + 5 = 10 > 8$).
        - Số nghiệm thỏa mãn:
          $ 45 - 30 = 15 text(" nghiệm") $
    ]
)

// TN 7 (Ba người không có 2 người nào kề nhau)
#tn([Có $8$ học sinh xếp thành một hàng dọc, trong đó có ba bạn An, Bình, Cường. Có bao nhiêu cách xếp sao cho trong ba bạn An, Bình, Cường không có bất kỳ hai bạn nào đứng cạnh nhau?],
    (
        True([$14400$]),
        [$40320$],
        [$28800$],
        [$7200$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp vách ngăn. Xếp $5$ bạn còn lại trước để tạo ra $6$ khoảng trống, sau đó xếp có thứ tự $3$ bạn An, Bình, Cường vào các khoảng trống đó.
        - Xếp 5 bạn còn lại vào hàng dọc: có $5! = 120$ cách.
        - Năm bạn tạo ra $5 + 1 = 6$ khoảng trống (ở hai đầu và giữa các bạn).
        - Chọn và xếp 3 bạn An, Bình, Cường vào 6 vị trí trống này:
          $ A_6^3 = 6 times 5 times 4 = 120 text(" cách") $
        Theo quy tắc nhân:
        $ 120 times 120 = 14400 text(" cách") $
    ]
)

// TN 8 (Tứ giác không chứa cạnh đa giác)
#tn([Cho đa giác đều có $12$ đỉnh. Có bao nhiêu tứ giác lồi có $4$ đỉnh là đỉnh của đa giác mà không có bất kỳ cạnh nào là cạnh của đa giác đều đã cho?],
    (
        True([$105$]),
        [$70$],
        [$495$],
        [$140$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức chọn $k$ đỉnh từ đa giác đều $n$ đỉnh sao cho không có 2 đỉnh nào kề nhau:
        $ N = n / (n - k) C_(n - k)^k $
        Với $n = 12$ và $k = 4$:
        $ N = 12 / (12 - 4) C_(12 - 4)^4 = 12 / 8 C_8^4 = 3 / 2 times 70 = 105 text(" tứ giác") $
    ]
)

// TN 9 (Số hạng hữu tỉ trong khai triển căn thức)
#tn([Trong khai triển của biểu thức $(root(3, 2) + sqrt(3))^5$, giá trị của số hạng hữu tỉ duy nhất bằng],
    (
        True([$60$]),
        [$30$],
        [$120$],
        [$10$]
    ),
    loigiai: [
        *Phương pháp giải:* Số hạng tổng quát $T_(k + 1) = C_5^k (2^(1/3))^(5 - k) (3^(1/2))^k$. Số hạng là số hữu tỉ khi và chỉ khi các số mũ $(5 - k) / 3$ và $k / 2$ đồng thời là các số nguyên.
        Với $k in {0, 1, 2, 3, 4, 5}$:
        - $k$ chẵn $=> k in {0, 2, 4}$.
        - $5 - k$ chia hết cho 3:
          + $k = 0 => 5$ không chia hết cho 3.
          + $k = 2 => 5 - 2 = 3$ chia hết cho 3 (thỏa mãn).
          + $k = 4 => 1$ không chia hết cho 3.
        Vậy chỉ có duy nhất $k = 2$.
        Giá trị của số hạng hữu tỉ là:
        $ T_3 = C_5^2 (2^(1/3))^3 (3^(1/2))^2 = 10 times 2 times 3 = 60 $
    ]
)

// TN 10 (Phương trình tổ hợp C_(n+1)^3 - C_n^3 = 15)
#tn([Tìm số nguyên dương $n$ thỏa mãn phương trình: $C_(n + 1)^3 - C_n^3 = 15$.],
    (
        True([$n = 6$]),
        [$n = 5$],
        [$n = 7$],
        [$n = 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức tam giác Pascal $C_(n + 1)^3 = C_n^3 + C_n^2 <=> C_(n + 1)^3 - C_n^3 = C_n^2$.
        Phương trình trở thành:
        $ C_n^2 = 15 <=> (n(n - 1)) / 2 = 15 <=> n^2 - n - 30 = 0 $
        $ <=> (n - 6)(n + 5) = 0 => n = 6 quad (text("do ") n in NN^*) $
    ]
)

// TN 11 (Tổng có trọng số)
#tn([Giá trị của tổng $S = 1 C_4^1 (2) + 2 C_4^2 (2^2) + 3 C_4^3 (2^3) + 4 C_4^4 (2^4)$ bằng],
    (
        True([$216$]),
        [$108$],
        [$324$],
        [$162$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng đồng nhất thức tổ hợp $k C_n^k = n C_(n - 1)^(k - 1)$ kết hợp nhị thức Newton $(1 + x)^(n - 1)$.
        Ta có:
        $ k C_4^k 2^k = 4 C_3^(k - 1) 2^k = 4 times 2 times C_3^(k - 1) 2^(k - 1) = 8 C_3^(k - 1) 2^(k - 1) $
        Lấy tổng từ $k = 1$ đến $4$:
        $ S = 8 sum_(j = 0)^3 C_3^j 2^j = 8 (1 + 2)^3 = 8 times 27 = 216 $
    ]
)

// TN 12 (Bất phương trình tổ hợp)
#tn([Số nghiệm nguyên dương của bất phương trình $A_n^2 - C_(n + 1)^2 <= 5$ là],
    (
        True([$4$]),
        [$5$],
        [$3$],
        [$6$]
    ),
    loigiai: [
        *Phương pháp giải:* Đặt điều kiện $n >= 2, n in NN^*$, khai triển công thức đại số và giải bất phương trình bậc hai.
        Khai triển:
        $ n(n - 1) - ((n + 1)n) / 2 <= 5 <=> 2(n^2 - n) - (n^2 + n) <= 10 $
        $ <=> n^2 - 3n - 10 <= 0 <=> (n - 5)(n + 2) <= 0 <=> -2 <= n <= 5 $
        Kết hợp điều kiện $n >= 2$ và $n in NN^*$, ta có $n in {2, 3, 4, 5}$.
        Vậy có đúng $4$ nghiệm nguyên dương.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân hoạch thặng dư)
#ds([Cho tập hợp $A = {1, 2, 3, ..., 20}$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của $A$ chia hết cho $3$ là $6$ phần tử.]),
    True([Số tập con gồm $3$ phần tử của $A$ mà cả $3$ phần tử có cùng số dư khi chia cho $3$ bằng $90$.]),
    True([Số tập con gồm $3$ phần tử của $A$ có tổng chia hết cho $3$ bằng $384$.]),
    [Số tập con gồm $3$ phần tử của $A$ có tổng không chia hết cho $3$ bằng $800$.]
  ),
  loigiai: [
    #step([Xét ý a: Số phần tử chia hết cho 3])
    $|A_0| = floor(20 / 3) = 6$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Cùng số dư])
    $C_6^3 + C_7^3 + C_7^3 = 20 + 35 + 35 = 90$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Tổng chia hết cho 3])
    $90 + 6 times 7 times 7 = 90 + 294 = 384$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng không chia hết cho 3])
    Tổng số tập con 3 phần tử: $C_20^3 = (20 times 19 times 18) / 6 = 1140$.
    Số tập có tổng không chia hết cho 3: $1140 - 384 = 756$ (chứ không phải $800$). Mệnh đề d SAI.
  ]
)

// DS 2 (Phương trình vách ngăn có cận trên)
#ds([Xét phương trình $x_1 + x_2 + x_3 = 11$ với các biến nguyên $x_1, x_2, x_3$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số nghiệm nguyên dương $(x_i >= 1)$ của phương trình bằng $45$.]),
    True([Số nghiệm nguyên dương có ít nhất một biến vi phạm điều kiện $x_i >= 6$ bằng $30$.]),
    True([Số nghiệm thỏa mãn $1 <= x_1, x_2, x_3 <= 5$ bằng $15$.]),
    [Số nghiệm thỏa mãn $1 <= x_1, x_2, x_3 <= 5$ bằng $20$.]
  ),
  loigiai: [
    #step([Xét ý a: Nghiệm nguyên dương])
    $C_(11 - 1)^(3 - 1) = C_10^2 = 45$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Có biến xi >= 6])
    $3 times C_5^2 = 30$. Mệnh đề b ĐÚNG.

    #step([Xét ý c và d: Thỏa mãn 1 <= xi <= 5])
    $45 - 30 = 15$.
    Mệnh đề c ĐÚNG. Mệnh đề d khẳng định bằng $20$ là SAI.
  ]
)

// DS 3 (Đa giác đều 12 đỉnh và tứ giác không kề)
#ds([Cho đa giác đều có $12$ đỉnh nội tiếp trong đường tròn.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số tứ giác lồi có $4$ đỉnh là đỉnh của đa giác bằng $495$.]),
    True([Số tứ giác lồi không chứa bất kỳ cạnh nào của đa giác đều bằng $105$.]),
    True([Số tứ giác lồi có đúng $1$ cạnh là cạnh của đa giác đều bằng $240$.]),
    [Số tam giác đều có $3$ đỉnh là đỉnh của đa giác bằng $6$.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng số tứ giác lồi])
    $C_12^4 = (12 times 11 times 10 times 9) / 24 = 495$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Tứ giác không chứa cạnh đa giác])
    $12 / 8 C_8^4 = 105$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Có đúng 1 cạnh đa giác])
    Chọn 1 cạnh (12 cách). Hai đỉnh còn lại không kề cạnh đó và không kề nhau: $12 times 20 = 240$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Số tam giác đều])
    Số tam giác đều bằng $12 / 3 = 4$ (chứ không phải $6$). Khẳng định bằng $6$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Bất phương trình và phương trình tổ hợp)
#ds([Xét bất phương trình $A_n^2 - C_(n + 1)^2 <= 5$ với $n in NN, n >= 2$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Bất phương trình tương đương với $n^2 - 3n - 10 <= 0$.]),
    True([Tập nghiệm nguyên dương của bất phương trình là $S = {2, 3, 4, 5}$.]),
    True([Tổng các nghiệm nguyên dương của bất phương trình bằng $14$.]),
    [Nghiệm nguyên dương lớn nhất của bất phương trình là $n = 6$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Giải bất phương trình])
    - Bất phương trình tương đương $n^2 - 3n - 10 <= 0$.
    - Nghiệm nguyên: $n in {2, 3, 4, 5}$.
    - Tổng nghiệm: $2 + 3 + 4 + 5 = 14$.
    Các mệnh đề a, b, c ĐÚNG.

    #step([Xét ý d: Nghiệm lớn nhất])
    Nghiệm lớn nhất là $n = 5$ (chứ không phải $n = 6$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Cho đa giác đều có $24$ đỉnh. Có bao nhiêu tam giác đều có $3$ đỉnh là các đỉnh của đa giác đều đó?],
    [8],
    loigiai: [
        #step([Tính số tam giác đều])
        $ 24 / 3 = 8 text(" tam giác đều") $
    ]
)

// TLN 2
#tln([Có bao nhiêu cách bỏ $5$ lá thư vào $5$ phong bì dán sẵn địa chỉ sao cho không có lá thư nào đến đúng người nhận?],
    [44],
    loigiai: [
        #step([Derangement D5])
        $ D_5 = 44 text(" cách") $
    ]
)

// TLN 3
#tln([Tìm hệ số của số hạng chứa $x^3$ trong khai triển của đa thức $P(x) = (1 + 2x + 3x^2)^4$.],
    [104],
    loigiai: [
        #step([Hệ số x^3])
        $ 6 times 12 + 4 times 8 = 72 + 32 = 104 $
    ]
)

// TLN 4
#tln([Phương trình $x_1 + x_2 + x_3 = 11$ có bao nhiêu bộ nghiệm nguyên thỏa mãn $1 <= x_1, x_2, x_3 <= 5$?],
    [15],
    loigiai: [
        #step([Bù trừ cận trên])
        $ 45 - 30 = 15 text(" bộ nghiệm") $
    ]
)

// TLN 5
#tln([Trong khai triển $(root(3, 2) + sqrt(3))^5$, tìm giá trị của số hạng hữu tỉ duy nhất.],
    [60],
    loigiai: [
        #step([Số hạng hữu tỉ k = 2])
        $ C_5^2 (2) (3) = 10 times 6 = 60 $
    ]
)

// TLN 6
#tln([Tìm số nguyên dương $n$ thỏa mãn phương trình: $C_(n + 1)^3 - C_n^3 = 15$.],
    [6],
    loigiai: [
        #step([Tam giác Pascal])
        $ C_n^2 = 15 => n = 6 $
    ]
)

] // end make-questions

#make-questions()
