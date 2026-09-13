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
  school: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP",
  exam-title: "BÀI 25: NHỊ THỨC NEWTON (ĐỀ SỐ 28A - MỨC ĐỘ KHÁ - GIỎI)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "179",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Hệ số trong tích hai nhị thức)
#tn([Tìm hệ số của số hạng chứa $x^3$ trong khai triển của đa thức $P(x) = (1 + 2x)^4 (1 - x)$.],
    (
        True([$8$]),
        [$16$],
        [$24$],
        [$32$]
    ),
    loigiai: [
        Ta có khai triển nhị thức bậc 4:
        $ (1 + 2x)^4 = C_4^0 + C_4^1 (2x) + C_4^2 (2x)^2 + C_4^3 (2x)^3 + C_4^4 (2x)^4 $
        $ = 1 + 8x + 24x^2 + 32x^3 + 16x^4 $
        Nhân với $(1 - x)$:
        $ P(x) = (1 + 8x + 24x^2 + 32x^3 + 16x^4)(1 - x) $
        Số hạng chứa $x^3$ được tạo bởi:
        $ 32x^3 cdot 1 + 24x^2 cdot (-x) = 32x^3 - 24x^3 = 8x^3 $
        Vậy hệ số cần tìm là $8$.
    ]
)

// TN 2 (Khai triển tam thức bậc 4)
#tn([Tìm hệ số của số hạng chứa $x^2$ trong khai triển của đa thức $Q(x) = (1 + x - 2x^2)^4$.],
    (
        True([$-2$]),
        [$6$],
        [$-8$],
        [$10$]
    ),
    loigiai: [
        Viết $Q(x) = [1 + (x - 2x^2)]^4$. Theo nhị thức Newton:
        $ Q(x) = C_4^0 + C_4^1 (x - 2x^2) + C_4^2 (x - 2x^2)^2 + C_4^3 (x - 2x^2)^3 + C_4^4 (x - 2x^2)^4 $
        Vì ta chỉ tìm số hạng chứa $x^2$, ta chỉ cần quan tâm đến các số hạng có bậc không vượt quá 2:
        - Từ $C_4^1 (x - 2x^2) = 4(x - 2x^2)$, số hạng chứa $x^2$ là: $-8x^2$.
        - Từ $C_4^2 (x - 2x^2)^2 = 6(x^2 - 4x^3 + 4x^4)$, số hạng chứa $x^2$ là: $6x^2$.
        - Các số hạng còn lại đều có bậc từ 3 trở lên nên không chứa $x^2$.
        Cộng các hệ số tương ứng:
        $ -8 + 6 = -2 $
        Vậy hệ số của $x^2$ trong khai triển bằng $-2$.
    ]
)

// TN 3 (Hệ số lớn nhất trong khai triển bậc 5)
#tn([Khai triển $(1 + 2x)^5 = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + a_4 x^4 + a_5 x^5$. Giá trị lớn nhất trong các hệ số $a_k$ ($k in {0, 1, 2, 3, 4, 5}$) bằng],
    (
        True([$80$]),
        [$40$],
        [$32$],
        [$160$]
    ),
    loigiai: [
        Hệ số của $x^k$ trong khai triển là:
        $ a_k = C_5^k cdot 2^k quad (k = 0, 1, 2, 3, 4, 5) $
        Ta tính cụ thể từng hệ số:
        - $a_0 = C_5^0 cdot 2^0 = 1$
        - $a_1 = C_5^1 cdot 2^1 = 5 times 2 = 10$
        - $a_2 = C_5^2 cdot 2^2 = 10 times 4 = 40$
        - $a_3 = C_5^3 cdot 2^3 = 10 times 8 = 80$
        - $a_4 = C_5^4 cdot 2^4 = 5 times 16 = 80$
        - $a_5 = C_5^5 cdot 2^5 = 1 times 32 = 32$
        So sánh các giá trị, hệ số lớn nhất đạt được là $a_3 = a_4 = 80$.
    ]
)

// TN 4 (Tổng hệ số bậc chẵn)
#tn([Cho khai triển $(2x - 1)^5 = a_5 x^5 + a_4 x^4 + a_3 x^3 + a_2 x^2 + a_1 x + a_0$. Tổng các hệ số bậc chẵn $S = a_0 + a_2 + a_4$ bằng],
    (
        True([$-121$]),
        [$-122$],
        [$122$],
        [$1$]
    ),
    loigiai: [
        Đặt $P(x) = (2x - 1)^5 = a_5 x^5 + a_4 x^4 + a_3 x^3 + a_2 x^2 + a_1 x + a_0$.
        - Khi thay $x = 1$:
          $ P(1) = (2 cdot 1 - 1)^5 = 1^5 = 1 = a_5 + a_4 + a_3 + a_2 + a_1 + a_0 $
        - Khi thay $x = -1$:
          $ P(-1) = [2(-1) - 1]^5 = (-3)^5 = -243 = -a_5 + a_4 - a_3 + a_2 - a_1 + a_0 $
        Cộng hai phương trình vế theo vế:
        $ P(1) + P(-1) = 2(a_0 + a_2 + a_4) $
        $ <=> 1 + (-243) = 2 S <=> -242 = 2 S <=> S = -121 $
    ]
)

// TN 5 (Số hạng không chứa x)
#tn([Tìm số hạng không chứa $x$ trong khai triển của nhị thức $P(x) = (2x^2 - 1 / x^3)^5$ với $x != 0$.],
    (
        True([$80$]),
        [$-80$],
        [$40$],
        [$-40$]
    ),
    loigiai: [
        Số hạng tổng quát thứ $k + 1$ ($k in {0, 1, 2, 3, 4, 5}$) trong khai triển là:
        $ T_(k + 1) = C_5^k (2x^2)^(5 - k) (-1 / x^3)^k = C_5^k cdot 2^(5 - k) cdot (-1)^k cdot x^(10 - 2k - 3k) = C_5^k cdot 2^(5 - k) cdot (-1)^k cdot x^(10 - 5k) $
        Số hạng không chứa $x$ tương ứng với số mũ của $x$ bằng 0:
        $ 10 - 5k = 0 <=> 5k = 10 <=> k = 2 $
        Thay $k = 2$ vào công thức số hạng:
        $ T_3 = C_5^2 cdot 2^3 cdot (-1)^2 = 10 times 8 times 1 = 80 $
        Vậy số hạng không chứa $x$ bằng $80$.
    ]
)

// TN 6 (Tìm tham số a)
#tn([Trong khai triển của nhị thức $(x + a)^5$, hệ số của số hạng chứa $x^3$ bằng $90$. Biết $a > 0$, giá trị của $a$ bằng],
    (
        True([$3$]),
        [$9$],
        [$sqrt(3)$],
        [$2$]
    ),
    loigiai: [
        Số hạng chứa $x^3$ trong khai triển $(x + a)^5$ là:
        $ C_5^2 x^3 a^2 = 10 a^2 x^3 $
        Theo giả thiết, hệ số của $x^3$ bằng $90$:
        $ 10 a^2 = 90 <=> a^2 = 9 $
        Vì $a > 0$ nên $a = 3$.
    ]
)

// TN 7 (Khai triển có căn thức - Số hạng nguyên)
#tn([Trong khai triển của nhị thức $(sqrt{2} + 1)^5$, có bao nhiêu số hạng là số nguyên hữu tỉ?],
    (
        True([$3$]),
        [$2$],
        [$4$],
        [$1$]
    ),
    loigiai: [
        Khai triển theo công thức nhị thức Newton:
        $ (sqrt{2} + 1)^5 = C_5^0 (sqrt{2})^5 + C_5^1 (sqrt{2})^4 + C_5^2 (sqrt{2})^3 + C_5^3 (sqrt{2})^2 + C_5^4 (sqrt{2})^1 + C_5^5 $
        Một số hạng là số hữu tỉ khi và chỉ khi số mũ của $sqrt{2}$ là số chẵn:
        - $k = 1$: $C_5^1 (sqrt{2})^4 = 5 times 4 = 20$ (số nguyên).
        - $k = 3$: $C_5^3 (sqrt{2})^2 = 10 times 2 = 20$ (số nguyên).
        - $k = 5$: $C_5^5 (sqrt{2})^0 = 1 times 1 = 1$ (số nguyên).
        Như vậy có đúng $3$ số hạng là số nguyên hữu tỉ.
    ]
)

// TN 8 (Tính xấp xỉ tài chính)
#tn([Sử dụng khai triển nhị thức Newton đến số hạng bậc hai $(1 + alpha)^4 approx 1 + 4 alpha + 6 alpha^2$ để ước lượng giá trị của $1.01^4$. Kết quả nhận được là],
    (
        True([$1.0406$]),
        [$1.04$],
        [$1.0408$],
        [$1.0412$]
    ),
    loigiai: [
        Viết $1.01 = 1 + 0.01$ với $alpha = 0.01$:
        $ 1.01^4 = (1 + 0.01)^4 approx 1 + 4(0.01) + 6(0.01)^2 $
        $ = 1 + 0.04 + 6(0.0001) = 1 + 0.04 + 0.0006 = 1.0406 $
    ]
)

// TN 9 (Tổng đồng nhất thức nhị thức Newton)
#tn([Giá trị của tổng $S = C_5^0 - 2 C_5^1 + 4 C_5^2 - 8 C_5^3 + 16 C_5^4 - 32 C_5^5$ bằng],
    (
        True([$-1$]),
        [$1$],
        [$-243$],
        [$243$]
    ),
    loigiai: [
        Nhận xét các số hạng trong tổng có dạng $C_5^k (-2)^k$:
        $ S = C_5^0 (-2)^0 + C_5^1 (-2)^1 + C_5^2 (-2)^2 + C_5^3 (-2)^3 + C_5^4 (-2)^4 + C_5^5 (-2)^5 $
        Theo công thức khai triển nhị thức Newton cho $(1 + x)^5$ tại $x = -2$:
        $ S = (1 + (-2))^5 = (-1)^5 = -1 $
    ]
)

// TN 10 (Hệ số của x^4 trong (x^2 + 1/x)^5)
#tn([Trong khai triển của nhị thức $P(x) = (x^2 + 2 / x)^5$ với $x != 0$, hệ số của số hạng chứa $x^4$ bằng],
    (
        True([$40$]),
        [$80$],
        [$10$],
        [$20$]
    ),
    loigiai: [
        Số hạng tổng quát thứ $k + 1$ là:
        $ T_(k + 1) = C_5^k (x^2)^(5 - k) (2 / x)^k = C_5^k cdot 2^k cdot x^(10 - 2k - k) = C_5^k cdot 2^k cdot x^(10 - 3k) $
        Yêu cầu số mũ của $x$ bằng 4:
        $ 10 - 3k = 4 <=> 3k = 6 <=> k = 2 $
        Hệ số tương ứng là:
        $ C_5^2 cdot 2^2 = 10 times 4 = 40 $
    ]
)

// TN 11 (Phương trình nhị thức Newton)
#tn([Cho biết tổng tất cả các hệ số trong khai triển của nhị thức $(3x - 1)^n$ bằng $16$. Khai triển $(x + 2)^n$ có hệ số của số hạng chứa $x^2$ bằng],
    (
        True([$24$]),
        [$32$],
        [$16$],
        [$48$]
    ),
    loigiai: [
        - #step([Tìm n])
          Tổng tất cả các hệ số nhận được khi thay $x = 1$:
          $ (3 cdot 1 - 1)^n = 2^n $
          Theo giả thiết: $2^n = 16 = 2^4 => n = 4$.
        - #step([Tìm hệ số của x^2 trong khai triển (x + 2)^4])
          Số hạng chứa $x^2$ trong khai triển $(x + 2)^4$ là:
          $ C_4^2 x^2 cdot 2^2 = 6 times 4 x^2 = 24 x^2 $
          Vậy hệ số của $x^2$ bằng $24$.
    ]
)

// TN 12 (Tổng hệ số đan dấu trong đa thức)
#tn([Cho đa thức $P(x) = (2x - 3)^4 = a_4 x^4 + a_3 x^3 + a_2 x^2 + a_1 x + a_0$. Giá trị của biểu thức $a_4 - a_3 + a_2 - a_1 + a_0$ bằng],
    (
        True([$625$]),
        [$1$],
        [$81$],
        [$-625$]
    ),
    loigiai: [
        Biểu thức cần tính chính là giá trị của đa thức khi thay $x = -1$:
        $ P(-1) = a_4 (-1)^4 + a_3 (-1)^3 + a_2 (-1)^2 + a_1 (-1) + a_0 = a_4 - a_3 + a_2 - a_1 + a_0 $
        Mặt khác, thay $x = -1$ vào công thức ban đầu:
        $ P(-1) = [2(-1) - 3]^4 = (-5)^4 = 625 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích chi tiết khai triển (1 + 2x)^5)
#ds([Cho đa thức $P(x) = (1 + 2x)^5 = a_5 x^5 + a_4 x^4 + a_3 x^3 + a_2 x^2 + a_1 x + a_0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng tất cả các hệ số của đa thức là $P(1) = 243$.]),
    True([Hệ số $a_3 = 80$ và $a_4 = 80$.]),
    True([Giá trị lớn nhất trong các hệ số của khai triển bằng $80$.]),
    [Tổng các hệ số của các số hạng chứa lũy thừa bậc lẻ $a_1 + a_3 + a_5$ bằng $121$.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng tất cả các hệ số])
    $P(1) = (1 + 2)^5 = 3^5 = 243$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Tính a3 và a4])
    $a_3 = C_5^3 2^3 = 10 times 8 = 80$. $a_4 = C_5^4 2^4 = 5 times 16 = 80$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Hệ số lớn nhất])
    Các hệ số là $1, 10, 40, 80, 80, 32$. Giá trị lớn nhất là 80. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng hệ số bậc lẻ])
    Ta có $P(-1) = (1 - 2)^5 = (-1)^5 = -1$.
    Tổng các hệ số bậc lẻ là:
    $ (P(1) - P(-1)) / 2 = (243 - (-1)) / 2 = 244 / 2 = 122 $ (chứ không phải $121$).
    Khẳng định bằng $121$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Khai triển phân thức (x^2 + 2/x)^5)
#ds([Xét biểu thức $Q(x) = (x^2 + 2 / x)^5$ với $x != 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số hạng tổng quát thứ $k + 1$ trong khai triển có dạng $T_(k + 1) = C_5^k cdot 2^k cdot x^(10 - 3k)$ với $k in {0, 1, 2, 3, 4, 5}$.]),
    True([Trong khai triển không tồn tại số hạng không chứa biến $x$.]),
    True([Hệ số của số hạng chứa $x^4$ bằng $40$.]),
    [Số hạng chứa $1 / x^5$ trong khai triển có hệ số bằng $16$.]
  ),
  loigiai: [
    #step([Xét ý a: Số hạng tổng quát])
    $T_(k + 1) = C_5^k (x^2)^(5 - k) (2 / x)^k = C_5^k 2^k x^(10 - 3k)$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Số hạng không chứa x])
    Số mũ $10 - 3k = 0 <=> k = 10 / 3 notin ZZ$. Do đó không có số hạng không chứa $x$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Số hạng chứa x^4])
    $10 - 3k = 4 <=> k = 2$. Hệ số: $C_5^2 2^2 = 10 times 4 = 40$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Số hạng chứa 1/x^5 = x^(-5)])
    $10 - 3k = -5 <=> 3k = 15 <=> k = 5$.
    Hệ số là: $C_5^5 2^5 = 1 times 32 = 32$ (chứ không phải $16$).
    Khẳng định bằng $16$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Tam giác Pascal bậc 4 và bậc 5 có CeTZ)
#ds([Tam giác Pascal là một công cụ trực quan để xác định các hệ số nhị thức Newton:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  // Hàng 0
  content((0, 2.5), [Hàng 0: $1$])
  // Hàng 1
  content((0, 2.0), [Hàng 1: $1 quad 1$])
  // Hàng 2
  content((0, 1.5), [Hàng 2: $1 quad 2 quad 1$])
  // Hàng 3
  content((0, 1.0), [Hàng 3: $1 quad 3 quad 3 quad 1$])
  // Hàng 4
  content((0, 0.5), [Hàng 4: $1 quad 4 quad 6 quad 4 quad 1$])
  // Hàng 5
  content((0, 0.0), [Hàng 5: $1 quad 5 quad 10 quad 10 quad 5 quad 1$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng các phần tử trên hàng thứ $n$ của tam giác Pascal luôn bằng $2^n$.]),
    True([Các hệ số trong khai triển của $(a + b)^4$ tương ứng là các số trên hàng 4: $1, 4, 6, 4, 1$.]),
    True([Mỗi số hạng bên trong tam giác Pascal bằng tổng của hai số hạng ngay phía trên nó: $C_n^k = C_(n - 1)^(k - 1) + C_(n - 1)^k$.]),
    [Tổng các hệ số trên hàng 5 của tam giác Pascal bằng $64$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Tính chất tam giác Pascal])
    Các tính chất cơ bản của tam giác Pascal đều chính xác. Mệnh đề a, b, c ĐÚNG.

    #step([Xét ý d: Tổng hàng 5])
    Tổng các số trên hàng 5 là: $2^5 = 32$ (chứ không phải $64$).
    Khẳng định bằng $64$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tích hai đa thức và hệ số)
#ds([Cho biểu thức $P(x) = (1 - 2x)^4 (1 + x)^5$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Bậc của đa thức $P(x)$ sau khi khai triển và thu gọn bằng $9$.]),
    True([Hệ số tự do của đa thức $P(x)$ bằng $1$.]),
    True([Hệ số của số hạng chứa $x$ trong khai triển bằng $-3$.]),
    [Hệ số của số hạng chứa $x^2$ trong khai triển bằng $10$.]
  ),
  loigiai: [
    #step([Khai triển từng nhân tử đến bậc 2])
    - $(1 - 2x)^4 = 1 + C_4^1 (-2x) + C_4^2 (-2x)^2 + ... = 1 - 8x + 24x^2 + ...$
    - $(1 + x)^5 = 1 + C_5^1 x + C_5^2 x^2 + ... = 1 + 5x + 10x^2 + ...$

    #step([Xét ý a: Bậc])
    $4 + 5 = 9$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Hệ số tự do])
    $P(0) = (1)^4 (1)^5 = 1$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Hệ số của x])
    $1 cdot 5x + (-8x) cdot 1 = -3x$. Hệ số là $-3$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Hệ số của x^2])
    Số hạng chứa $x^2$ được tạo bởi:
    $ 1 cdot (10x^2) + (-8x) cdot (5x) + (24x^2) cdot 1 = 10x^2 - 40x^2 + 24x^2 = -6x^2 $
    Hệ số là $-6$ (chứ không phải $10$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Tìm hệ số của số hạng chứa $x^3$ trong khai triển của biểu thức $P(x) = (1 + 2x)^4 (1 - x)$.],
    [8],
    loigiai: [
        #step([Tích đa thức])
        Hệ số của $x^3$ là: $32 - 24 = 8$.
    ]
)

// TLN 2
#tln([Tìm hệ số của số hạng chứa $x^2$ trong khai triển của đa thức $Q(x) = (1 + x - 2x^2)^4$.],
    [-2],
    loigiai: [
        #step([Tính toán])
        $-8 + 6 = -2$.
    ]
)

// TLN 3
#tln([Khai triển $(1 + 2x)^5 = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + a_4 x^4 + a_5 x^5$. Giá trị lớn nhất trong các hệ số $a_k$ bằng bao nhiêu?],
    [80],
    loigiai: [
        #step([So sánh])
        $a_3 = a_4 = 80$.
    ]
)

// TLN 4
#tln([Cho khai triển $(2x - 1)^5 = a_5 x^5 + a_4 x^4 + a_3 x^3 + a_2 x^2 + a_1 x + a_0$. Tính tổng các hệ số bậc chẵn $S = a_0 + a_2 + a_4$.],
    [-121],
    loigiai: [
        #step([Công thức])
        $ S = (P(1) + P(-1)) / 2 = (1 - 243) / 2 = -121 $
    ]
)

// TLN 5
#tln([Trong khai triển của nhị thức $(x + a)^5$ với $a > 0$, hệ số của số hạng chứa $x^3$ bằng $90$. Tìm giá trị của $a$.],
    [3],
    loigiai: [
        #step([Phương trình])
        $ 10 a^2 = 90 <=> a = 3 $
    ]
)

// TLN 6
#tln([Cho đa thức $P(x) = (2x - 3)^4 = a_4 x^4 + a_3 x^3 + a_2 x^2 + a_1 x + a_0$. Tính giá trị của biểu thức $a_4 - a_3 + a_2 - a_1 + a_0$.],
    [625],
    loigiai: [
        #step([Thay x = -1])
        $ P(-1) = (-5)^4 = 625 $
    ]
)

] // end make-questions

#make-questions()
