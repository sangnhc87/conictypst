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
  exam-title: "BÀI 25: NHỊ THỨC NEWTON (ĐỀ SỐ 28C - NÂNG CAO & PHÂN HÓA VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "181",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Khai triển (1 + x + x^2)^4)
#tn([Tìm hệ số của số hạng chứa $x^4$ trong khai triển của đa thức $P(x) = (1 + x + x^2)^4$.],
    (
        True([$19$]),
        [$16$],
        [$24$],
        [$31$]
    ),
    loigiai: [
        Viết $P(x) = [1 + x(1 + x)]^4$. Khai triển theo nhị thức Newton:
        $ P(x) = C_4^0 + C_4^1 x(1 + x) + C_4^2 x^2 (1 + x)^2 + C_4^3 x^3 (1 + x)^3 + C_4^4 x^4 (1 + x)^4 $
        Ta tìm hệ số của $x^4$ từ từng số hạng:
        - Từ $C_4^2 x^2 (1 + x)^2 = 6 x^2 (1 + 2x + x^2)$: số hạng chứa $x^4$ là $6 x^2 cdot x^2 = 6 x^4$ (hệ số $6$).
        - Từ $C_4^3 x^3 (1 + x)^3 = 4 x^3 (1 + 3x + 3x^2 + x^3)$: số hạng chứa $x^4$ là $4 x^3 cdot (3x) = 12 x^4$ (hệ số $12$).
        - Từ $C_4^4 x^4 (1 + x)^4 = 1 x^4 (1 + 4x + ...)$: số hạng chứa $x^4$ là $1 x^4 cdot 1 = 1 x^4$ (hệ số $1$).
        Cộng các hệ số tương ứng:
        $ 6 + 12 + 1 = 19 $
        Vậy hệ số của $x^4$ trong khai triển là $19$.
    ]
)

// TN 2 (Tổng có trọng số S = sum k C_n^k)
#tn([Giá trị của tổng $S = 1 cdot C_5^1 + 2 cdot C_5^2 + 3 cdot C_5^3 + 4 cdot C_5^4 + 5 cdot C_5^5$ bằng],
    (
        True([$80$]),
        [$160$],
        [$32$],
        [$64$]
    ),
    loigiai: [
        Ta áp dụng đẳng thức tổ hợp quen thuộc:
        $ k cdot C_n^k = n cdot C_(n - 1)^(k - 1) quad (1 <= k <= n) $
        Với $n = 5$, ta có:
        $ k cdot C_5^k = 5 cdot C_4^(k - 1) $
        Do đó tổng $S$ trở thành:
        $ S = sum_(k=1)^5 5 cdot C_4^(k - 1) = 5 sum_(j=0)^4 C_4^j = 5 cdot 2^4 = 5 times 16 = 80 $
    ]
)

// TN 3 (Hệ số lớn nhất trong khai triển (1/3 + 2/3 x)^5)
#tn([Khai triển $(1 / 3 + 2 / 3 x)^5 = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + a_4 x^4 + a_5 x^5$. Giá trị lớn nhất trong các hệ số $a_k$ ($k in {0, 1, ..., 5}$) bằng],
    (
        True([$80 / 243$]),
        [$40 / 243$],
        [$32 / 243$],
        [$10 / 81$]
    ),
    loigiai: [
        Ta có:
        $ a_k = C_5^k (1 / 3)^(5 - k) (2 / 3)^k = (C_5^k cdot 2^k) / (3^5) = (C_5^k cdot 2^k) / 243 $
        Tử số $C_5^k cdot 2^k$ nhận các giá trị:
        - $k = 0$: $1$
        - $k = 1$: $5 times 2 = 10$
        - $k = 2$: $10 times 4 = 40$
        - $k = 3$: $10 times 8 = 80$
        - $k = 4$: $5 times 16 = 80$
        - $k = 5$: $1 times 32 = 32$
        Tử số lớn nhất bằng $80$ (tại $k = 3$ và $k = 4$).
        Vậy hệ số lớn nhất bằng $80 / 243$.
    ]
)

// TN 4 (Khai triển có phân thức)
#tn([Trong khai triển của biểu thức $(x^2 + 1 / x)^5$ với $x != 0$, số hạng chứa $x$ (bậc nhất) có hệ số bằng],
    (
        True([$10$]),
        [$5$],
        [$1$],
        [$20$]
    ),
    loigiai: [
        Số hạng tổng quát thứ $k + 1$ ($k in {0, 1, 2, 3, 4, 5}$) trong khai triển là:
        $ T_(k + 1) = C_5^k (x^2)^(5 - k) (1 / x)^k = C_5^k x^(10 - 2k - k) = C_5^k x^(10 - 3k) $
        Yêu cầu số mũ của $x$ bằng $1$:
        $ 10 - 3k = 1 <=> 3k = 9 <=> k = 3 $
        Hệ số tương ứng là:
        $ C_5^3 = 10 $
    ]
)

// TN 5 (Phương trình tham số bậc 5)
#tn([Trong khai triển $(x + 2 / x)^5$ với $x != 0$, tỉ số giữa hệ số của số hạng chứa $x^3$ và hệ số của số hạng chứa $x$ bằng],
    (
        True([$1 / 4$]),
        [$4$],
        [$1 / 2$],
        [$2$]
    ),
    loigiai: [
        Số hạng tổng quát:
        $ T_(k + 1) = C_5^k x^(5 - k) (2 / x)^k = C_5^k cdot 2^k cdot x^(5 - 2k) $
        - Số hạng chứa $x^3$: $5 - 2k = 3 <=> 2k = 2 <=> k = 1$.
          Hệ số là: $C_5^1 cdot 2^1 = 5 times 2 = 10$.
        - Số hạng chứa $x$: $5 - 2k = 1 <=> 2k = 4 <=> k = 2$.
          Hệ số là: $C_5^2 cdot 2^2 = 10 times 4 = 40$.
        Tỉ số cần tìm là:
        $ 10 / 40 = 1 / 4 $
    ]
)

// TN 6 (Di truyền học Mendel và Nhị thức Newton)
#tn([Theo quy luật di truyền Mendel, khi lai hai cá thể dị hợp tử mang gen quy định màu hoa $A a times A a$, xác suất để một cây con có hoa đỏ (mang kiểu hình trội) là $p = 3 / 4$, hoa trắng là $q = 1 / 4$. Xét một lứa gồm $4$ cây con độc lập. Xác suất để trong lứa đó có đúng $3$ cây hoa đỏ và $1$ cây hoa trắng bằng],
    (
        True([$27 / 64$]),
        [$81 / 256$],
        [$27 / 128$],
        [$9 / 64$]
    ),
    loigiai: [
        Số cây con hoa đỏ tuân theo phân bố nhị thức với tham số $n = 4, p = 3 / 4$:
        $ P(X = 3) = C_4^3 p^3 q^1 = C_4^3 (3 / 4)^3 (1 / 4)^1 $
        $ = 4 times 27 / 64 times 1 / 4 = 27 / 64 $
    ]
)

// TN 7 (Đồng nhất thức tổng bình phương các hệ số Pascal)
#tn([Giá trị của tổng bình phương các hệ số trong khai triển nhị thức bậc 4: $S = (C_4^0)^2 + (C_4^1)^2 + (C_4^2)^2 + (C_4^3)^2 + (C_4^4)^2$ bằng],
    (
        True([$70$]),
        [$256$],
        [$64$],
        [$36$]
    ),
    loigiai: [
        Tính trực tiếp từng số hạng:
        - $C_4^0 = 1 => 1^2 = 1$
        - $C_4^1 = 4 => 4^2 = 16$
        - $C_4^2 = 6 => 6^2 = 36$
        - $C_4^3 = 4 => 4^2 = 16$
        - $C_4^4 = 1 => 1^2 = 1$
        Cộng lại:
        $ S = 1 + 16 + 36 + 16 + 1 = 70 $
        (Lưu ý: Theo đồng nhất thức Vandermonde, $sum_(k=0)^n (C_n^k)^2 = C_(2n)^n = C_8^4 = (8 times 7 times 6 times 5) / 24 = 70$).
    ]
)

// TN 8 (Tổng các giá trị tuyệt đối)
#tn([Tổng các giá trị tuyệt đối của tất cả các hệ số trong khai triển đa thức $P(x) = (x^2 - 2)^4$ bằng],
    (
        True([$81$]),
        [$41$],
        [$1$],
        [$40$]
    ),
    loigiai: [
        Khai triển nhị thức $(x^2 - 2)^4$:
        $ (x^2 - 2)^4 = C_4^0 x^8 - C_4^1 x^6 cdot 2 + C_4^2 x^4 cdot 4 - C_4^3 x^2 cdot 8 + C_4^4 cdot 16 $
        Tổng các giá trị tuyệt đối của các hệ số là:
        $ C_4^0 + C_4^1 cdot 2 + C_4^2 cdot 4 + C_4^3 cdot 8 + C_4^4 cdot 16 $
        Đây chính là giá trị của khai triển $(1 + y)^4$ khi thay $y = 2$:
        $ (1 + 2)^4 = 3^4 = 81 $
    ]
)

// TN 9 (Hệ số trong khai triển kép)
#tn([Tìm hệ số của số hạng chứa $x^2 y^3$ trong khai triển của biểu thức $(2x - 3y)^5$.],
    (
        True([$-1080$]),
        [$1080$],
        [$-720$],
        [$720$]
    ),
    loigiai: [
        Số hạng chứa $x^2 y^3$ trong khai triển nhị thức Newton $(2x - 3y)^5$ có dạng:
        $ C_5^3 (2x)^2 (-3y)^3 = 10 cdot (4 x^2) cdot (-27 y^3) = -1080 x^2 y^3 $
        Vậy hệ số cần tìm là $-1080$.
    ]
)

// TN 10 (Ứng dụng giải tích xấp xỉ bậc 2)
#tn([Một quả cầu kim loại có bán kính ban đầu $R_0 = 10 text(" cm")$. Do nhiệt độ tăng, bán kính quả cầu giãn nở thêm $Delta R = 0.02 text(" cm")$. Sử dụng khai triển $(1 + alpha)^3 approx 1 + 3 alpha$ (hoặc bậc 4 cho bài toán lớp 10), diện tích mặt ngoài hoặc thể tích...
Để phù hợp chuẩn bậc 4: Xét một đại lượng vật lý $V = V_0 (1 + alpha)^4$ với $alpha = 0.005$. Giá trị xấp xỉ bậc nhất của $V / V_0$ bằng],
    (
        True([$1.02$]),
        [$1.01$],
        [$1.025$],
        [$1.05$]
    ),
    loigiai: [
        Áp dụng xấp xỉ tuyến tính $(1 + alpha)^4 approx 1 + 4 alpha$:
        $ (1 + 0.005)^4 approx 1 + 4(0.005) = 1 + 0.02 = 1.02 $
    ]
)

// TN 11 (Số hạng nguyên trong căn bậc 3)
#tn([Trong khai triển của nhị thức $(root(3, 3) + 1)^5$, số hạng vô tỉ có giá trị lớn nhất là],
    (
        True([$15 root(3, 3)$]),
        [$10 root(3, 9)$],
        [$3 root(3, 9)$],
        [$5 root(3, 3)$]
    ),
    loigiai: [
        Khai triển $(root(3, 3) + 1)^5$:
        $ = C_5^0 (root(3, 3))^5 + C_5^1 (root(3, 3))^4 + C_5^2 (root(3, 3))^3 + C_5^3 (root(3, 3))^2 + C_5^4 (root(3, 3)) + C_5^5 $
        - Số hạng 1: $1 cdot 3 root(3, 9) = 3 root(3, 9) approx 3 times 2.08 = 6.24$.
        - Số hạng 2: $5 cdot 3 root(3, 3) = 15 root(3, 3) approx 15 times 1.442 = 21.63$.
        - Số hạng 3: $10 cdot 3 = 30$ (số hữu tỉ).
        - Số hạng 4: $10 root(3, 9) approx 10 times 2.08 = 20.8$.
        - Số hạng 5: $5 root(3, 3) approx 5 times 1.442 = 7.21$.
        - Số hạng 6: $1$ (số hữu tỉ).
        So sánh các số hạng vô tỉ: $15 root(3, 3) approx 21.63$ lớn hơn $10 root(3, 9) approx 20.8$.
        Vậy số hạng vô tỉ lớn nhất là $15 root(3, 3)$.
    ]
)

// TN 12 (Tổng hệ số chẵn lẻ triệt tiêu)
#tn([Giá trị của biểu thức $T = C_5^0 - C_5^1 + C_5^2 - C_5^3 + C_5^4 - C_5^5$ bằng],
    (
        True([$0$]),
        [$1$],
        [$32$],
        [$-1$]
    ),
    loigiai: [
        Theo công thức nhị thức Newton cho $(1 - 1)^5$:
        $ 0 = (1 - 1)^5 = C_5^0 - C_5^1 + C_5^2 - C_5^3 + C_5^4 - C_5^5 $
        Vậy giá trị của biểu thức bằng $0$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân bố xác suất nhị thức có CeTZ)
#ds([Một xạ thủ bắn $5$ viên đạn độc lập vào bia. Xác suất bắn trúng bia ở mỗi lần bắn là $p = 0.6$, xác suất bắn trượt là $q = 0.4$.
Số lần bắn trúng $k$ tuân theo khai triển nhị thức $(0.4 + 0.6)^5 = sum_(k=0)^5 C_5^k (0.6)^k (0.4)^(5 - k)$.
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  // Trục hoành
  line((-0.5, 0), (6, 0), stroke: 1pt + black, mark: (end: "stealth"))
  content((6.3, 0), [$k$])
  // Trục tung
  line((0, 0), (0, 3.5), stroke: 1pt + black, mark: (end: "stealth"))
  content((0, 3.8), [$P(k)$])
  
  // Vẽ các cột xác suất
  // k = 0: 0.01024
  rect((0.2, 0), (0.6, 0.1), fill: rgb("fde68a"), stroke: 0.5pt + accent)
  content((0.4, -0.3), [0])
  // k = 1: 0.0768
  rect((1.2, 0), (1.6, 0.77), fill: rgb("fde68a"), stroke: 0.5pt + accent)
  content((1.4, -0.3), [1])
  // k = 2: 0.2304
  rect((2.2, 0), (2.6, 2.3), fill: rgb("fde68a"), stroke: 0.5pt + accent)
  content((2.4, -0.3), [2])
  // k = 3: 0.3456 (đỉnh)
  rect((3.2, 0), (3.6, 3.46), fill: accent, stroke: 0.8pt + black)
  content((3.4, -0.3), [3])
  // k = 4: 0.2592
  rect((4.2, 0), (4.6, 2.59), fill: rgb("fde68a"), stroke: 0.5pt + accent)
  content((4.4, -0.3), [4])
  // k = 5: 0.07776
  rect((5.2, 0), (5.6, 0.78), fill: rgb("fde68a"), stroke: 0.5pt + accent)
  content((5.4, -0.3), [5])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất để xạ thủ bắn trúng cả $5$ viên đạn là $0.6^5 = 0.07776$.]),
    True([Xác suất để xạ thủ bắn trượt cả $5$ viên đạn là $0.4^5 = 0.01024$.]),
    True([Số lần bắn trúng có khả năng xảy ra cao nhất là $k = 3$ với xác suất $P(3) = 0.3456$.]),
    [Xác suất để xạ thủ bắn trúng ít nhất $1$ viên đạn nhỏ hơn $0.98$.]
  ),
  loigiai: [
    #step([Xét ý a: Trúng cả 5 viên])
    $P(5) = C_5^5 (0.6)^5 = 0.07776$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Trượt cả 5 viên])
    $P(0) = C_5^0 (0.4)^5 = 0.01024$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Xác suất cao nhất])
    $P(3) = C_5^3 (0.6)^3 (0.4)^2 = 10 times 0.216 times 0.16 = 0.3456$. Đây là giá trị lớn nhất. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Trúng ít nhất 1 viên])
    $1 - P(0) = 1 - 0.01024 = 0.98976 > 0.98$ (chứ không nhỏ hơn $0.98$).
    Khẳng định nhỏ hơn $0.98$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Khai triển (1 + x + x^2)^4 toàn diện)
#ds([Cho đa thức $P(x) = (1 + x + x^2)^4 = a_8 x^8 + a_7 x^7 + ... + a_1 x + a_0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Bậc của đa thức $P(x)$ bằng $8$.]),
    True([Hệ số tự do của đa thức bằng $a_0 = 1$.]),
    True([Hệ số của số hạng chứa $x^4$ bằng $a_4 = 19$.]),
    [Tổng tất cả các hệ số của đa thức $P(x)$ bằng $256$.]
  ),
  loigiai: [
    #step([Xét ý a và b: Bậc và hệ số tự do])
    Bậc $2 times 4 = 8$, hệ số tự do $P(0) = 1^4 = 1$. Mệnh đề a và b ĐÚNG.

    #step([Xét ý c: Hệ số của x^4])
    Đã tính ở TN 1: $a_4 = 19$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng tất cả hệ số])
    $P(1) = (1 + 1 + 1)^4 = 3^4 = 81$ (chứ không phải $256$).
    Khẳng định bằng $256$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Đồng nhất thức nhị thức Newton)
#ds([Xét khai triển nhị thức Newton bậc 5: $(1 + x)^5 = C_5^0 + C_5^1 x + C_5^2 x^2 + C_5^3 x^3 + C_5^4 x^4 + C_5^5 x^5$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng các hệ số $C_5^0 + C_5^1 + C_5^2 + C_5^3 + C_5^4 + C_5^5 = 32$.]),
    True([Tổng đan dấu $C_5^0 - C_5^1 + C_5^2 - C_5^3 + C_5^4 - C_5^5 = 0$.]),
    True([Tổng các hệ số ở vị trí lẻ bằng tổng các hệ số ở vị trí chẵn: $C_5^0 + C_5^2 + C_5^4 = C_5^1 + C_5^3 + C_5^5 = 16$.]),
    [Giá trị của tổng $C_5^0 + 2 C_5^1 + 4 C_5^2 + 8 C_5^3 + 16 C_5^4 + 32 C_5^5$ bằng $125$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Các đồng nhất thức chuẩn])
    - Tại $x = 1$: $(1 + 1)^5 = 2^5 = 32$.
    - Tại $x = -1$: $(1 - 1)^5 = 0$.
    - Lẻ = Chẵn = $32 / 2 = 16$.
    Các mệnh đề a, b, c ĐÚNG.

    #step([Xét ý d: Tại x = 2])
    Tổng chính là giá trị tại $x = 2$:
    $ (1 + 2)^5 = 3^5 = 243 $ (chứ không phải $125$).
    Khẳng định bằng $125$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tỉ số hai hệ số trong (x + 2/x)^5)
#ds([Cho biểu thức $Q(x) = (x + 2 / x)^5$ với $x != 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Trong khai triển không có số hạng không chứa biến $x$.]),
    True([Hệ số của số hạng chứa $x^3$ bằng $10$.]),
    True([Hệ số của số hạng chứa $x$ bằng $40$.]),
    [Hệ số của số hạng chứa $1 / x^5$ bằng $16$.]
  ),
  loigiai: [
    #step([Xét ý a: Không có số hạng độc lập với x])
    Số mũ $5 - 2k = 0 <=> k = 2.5 notin ZZ$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Hệ số của x^3])
    $5 - 2k = 3 <=> k = 1$. Hệ số: $C_5^1 cdot 2^1 = 10$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Hệ số của x])
    $5 - 2k = 1 <=> k = 2$. Hệ số: $C_5^2 cdot 2^2 = 40$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Hệ số của 1/x^5])
    $5 - 2k = -5 <=> 2k = 10 <=> k = 5$.
    Hệ số là: $C_5^5 cdot 2^5 = 1 times 32 = 32$ (chứ không phải $16$).
    Khẳng định bằng $16$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Tìm hệ số của số hạng chứa $x^4$ trong khai triển của đa thức $P(x) = (1 + x + x^2)^4$.],
    [19],
    loigiai: [
        #step([Khai triển nhị thức mở rộng])
        $6 + 12 + 1 = 19$.
    ]
)

// TLN 2
#tln([Tính giá trị của tổng $S = 1 cdot C_5^1 + 2 cdot C_5^2 + 3 cdot C_5^3 + 4 cdot C_5^4 + 5 cdot C_5^5$.],
    [80],
    loigiai: [
        #step([Công thức k C_n^k])
        $ 5 times 2^4 = 80 $
    ]
)

// TLN 3
#tln([Trong khai triển của biểu thức $(x^2 + 1 / x)^5$ với $x != 0$, tìm hệ số của số hạng chứa $x$.],
    [10],
    loigiai: [
        #step([Số mũ 10 - 3k = 1])
        $k = 3 => C_5^3 = 10$.
    ]
)

// TLN 4
#tln([Tính tổng bình phương các hệ số của khai triển nhị thức bậc 4: $S = (C_4^0)^2 + (C_4^1)^2 + (C_4^2)^2 + (C_4^3)^2 + (C_4^4)^2$.],
    [70],
    loigiai: [
        #step([Vandermonde])
        $ 1 + 16 + 36 + 16 + 1 = 70 $
    ]
)

// TLN 5
#tln([Tìm hệ số của số hạng chứa $x^2 y^3$ trong khai triển của biểu thức $(2x - 3y)^5$.],
    [-1080],
    loigiai: [
        #step([Khai triển kép])
        $ C_5^3 (2)^2 (-3)^3 = 10 times 4 times (-27) = -1080 $
    ]
)

// TLN 6
#tln([Tính tổng các giá trị tuyệt đối của tất cả các hệ số trong khai triển đa thức $(x^2 - 2)^4$.],
    [81],
    loigiai: [
        #step([Tổng tuyệt đối])
        $ (1 + 2)^4 = 3^4 = 81 $
    ]
)

] // end make-questions

#make-questions()
