#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("6d28d9") // Purple cho Đề 5B

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: QUY NẠP TOÁN HỌC & NHỊ THỨC NEWTON",
  exam-title: "BÀI 2: NHỊ THỨC NEWTON MỞ RỘNG (ĐỀ B - TỔNG HỆ SỐ & CỰC TRỊ)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "314",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho khai triển nhị thức Newton:
$ (1 + x)^n = C_n^0 + C_n^1 x + C_n^2 x^2 + ... + C_n^n x^n $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("faf5ff"), stroke: 1.2pt + rgb("6d28d9"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("6d28d9"))[Cho $x = 1$ ta được tổng: $sum_(k=0)^n C_n^k = 2^n$])
  })
]
Bằng cách thay $x = 1$ vào hai vế của khai triển, ta thu được tổng tất cả các hệ số tổ hợp bằng],
    (
        True([$2^n$]),
        [$2^(n-1)$],
        [$2^(n+1)$],
        [$n^2$]
    ),
    loigiai: [
        #step([Thay x = 1 vào đẳng thức nhị thức])
        $ (1 + 1)^n = C_n^0 + C_n^1 (1) + C_n^2 (1)^2 + ... + C_n^n (1)^n $
        $ <=> C_n^0 + C_n^1 + C_n^2 + ... + C_n^n = 2^n $
    ]
)

// TN 2
#tn([Bằng cách thay $x = -1$ vào khai triển $(1 + x)^n = sum_(k=0)^n C_n^k x^k$, ta thu được giá trị của tổng đan dấu:
$ S = C_n^0 - C_n^1 + C_n^2 - C_n^3 + ... + (-1)^n C_n^n $
bằng],
    (
        True([$0$]),
        [$1$],
        [$-1$],
        [$2^n$]
    ),
    loigiai: [
        #step([Thay x = -1 vào đẳng thức nhị thức])
        $ (1 + (-1))^n = C_n^0 - C_n^1 + C_n^2 - C_n^3 + ... + (-1)^n C_n^n $
        Vì $(1 - 1)^n = 0^n = 0$ (với $n >= 1$), nên tổng đan dấu luôn bằng $0$.
    ]
)

// TN 3
#tn([Từ hai kết quả $sum_(k=0)^n C_n^k = 2^n$ và $sum_(k=0)^n (-1)^k C_n^k = 0$, ta suy ra tổng các hệ số tổ hợp ở vị trí chẵn:
$ S_c = C_n^0 + C_n^2 + C_n^4 + ... $
có giá trị bằng],
    (
        True([$2^(n-1)$]),
        [$2^n$],
        [$2^(n-2)$],
        [$0$]
    ),
    loigiai: [
        #step([Cộng hai đẳng thức])
        Cộng vế với vế hai đẳng thức:
        $ 2(C_n^0 + C_n^2 + C_n^4 + ...) = 2^n + 0 = 2^n $
        Suy ra:
        $ S_c = 2^n / 2 = 2^(n-1) $
    ]
)

// TN 4
#tn([Tổng tất cả các hệ số trong khai triển đa thức của biểu thức $P(x) = (2 - 3x)^7$ bằng],
    (
        True([$-1$]),
        [$1$],
        [$5^7$],
        [$2^7$]
    ),
    loigiai: [
        #step([Phương pháp tính tổng hệ số])
        Tổng tất cả các hệ số của đa thức $P(x)$ bằng giá trị của đa thức tại $x = 1$:
        $ P(1) = (2 - 3(1))^7 = (2 - 3)^7 = (-1)^7 = -1 $
    ]
)

// TN 5
#tn([Tổng tất cả các hệ số trong khai triển đa thức của biểu thức $Q(x) = (3x - 1)^6$ bằng],
    (
        True([$64$]),
        [$32$],
        [$128$],
        [$1$]
    ),
    loigiai: [
        #step([Thay x = 1])
        $ Q(1) = (3(1) - 1)^6 = (3 - 1)^6 = 2^6 = 64 $
    ]
)

// TN 6
#tn([Hệ số lớn nhất trong khai triển nhị thức $(1 + x)^8$ là],
    (
        True([$C_8^4 = 70$]),
        [$C_8^3 = 56$],
        [$C_8^5 = 56$],
        [$C_8^8 = 1$]
    ),
    loigiai: [
        #step([Tìm hệ số lớn nhất của nhị thức đối xứng])
        Vì số mũ $n = 8$ là số chẵn, các hệ số tăng dần từ $C_8^0$ đến $C_8^4$ rồi giảm dần từ $C_8^4$ đến $C_8^8$.
        Hệ số lớn nhất nằm ở vị trí chính giữa $k = n/2 = 4$:
        $ C_8^4 = (8 times 7 times 6 times 5) / (4 times 3 times 2 times 1) = 70 $
    ]
)

// TN 7
#tn([Tính tổng các hệ số tổ hợp chẵn của $n = 8$:
$ S = C_8^0 + C_8^2 + C_8^4 + C_8^6 + C_8^8 $
Giá trị của $S$ bằng],
    (
        True([$128$]),
        [$256$],
        [$64$],
        [$512$]
    ),
    loigiai: [
        #step([Áp dụng công thức tổng hệ số chẵn])
        $ S = 2^(n-1) = 2^(8-1) = 2^7 = 128 $
    ]
)

// TN 8
#tn([Cho biết $C_n^0 + C_n^1 + C_n^2 + ... + C_n^n = 1024$. Giá trị của số tự nhiên $n$ là],
    (
        True([$n = 10$]),
        [$n = 8$],
        [$n = 9$],
        [$n = 11$]
    ),
    loigiai: [
        #step([Giải phương trình số mũ])
        Theo công thức tổng các hệ số nhị thức:
        $ 2^n = 1024 = 2^(10) <=> n = 10 $
    ]
)

// TN 9
#tn([Số tập hợp con của một tập hợp có $8$ phần tử bằng],
    (
        True([$256$]),
        [$128$],
        [$512$],
        [$64$]
    ),
    loigiai: [
        #step([Ý nghĩa tổ hợp])
        Số tập con có $k$ phần tử là $C_8^k$.
        Tổng số tập hợp con của tập hợp $8$ phần tử:
        $ sum_(k=0)^8 C_8^k = 2^8 = 256 $
    ]
)

// TN 10
#tn([Đạo hàm hai vế của khai triển $(1 + x)^n = C_n^0 + C_n^1 x + C_n^2 x^2 + ... + C_n^n x^n$ rồi cho $x = 1$, ta thu được đẳng thức nào sau đây?],
    (
        True([$C_n^1 + 2 C_n^2 + 3 C_n^3 + ... + n C_n^n = n 2^(n-1)$]),
        [$C_n^1 + 2 C_n^2 + 3 C_n^3 + ... + n C_n^n = 2^n$],
        [$C_n^1 + 2 C_n^2 + 3 C_n^3 + ... + n C_n^n = n 2^n$],
        [$C_n^1 + 2 C_n^2 + 3 C_n^3 + ... + n C_n^n = (n - 1) 2^n$]
    ),
    loigiai: [
        #step([Lấy đạo hàm theo x])
        $ [(1 + x)^n]' = n(1 + x)^(n-1) $
        Vế phải: $C_n^1 + 2 C_n^2 x + 3 C_n^3 x^2 + ... + n C_n^n x^(n-1)$.
        Thay $x = 1$:
        $ n(1 + 1)^(n-1) = C_n^1 + 2 C_n^2 + 3 C_n^3 + ... + n C_n^n $
        $ <=> C_n^1 + 2 C_n^2 + ... + n C_n^n = n 2^(n-1) $
    ]
)

// TN 11
#tn([Cho khai triển $(1 + 3x)^6 = a_0 + a_1 x + a_2 x^2 + ... + a_6 x^6$. Tỉ số giữa hai hệ số liên tiếp $a_(k+1) / a_k$ bằng],
    (
        True([$3 ((6 - k) / (k + 1))$]),
        [$((6 - k) / (k + 1))$],
        [$3 ((k + 1) / (6 - k))$],
        [$1/3 ((6 - k) / (k + 1))$]
    ),
    loigiai: [
        #step([Tính tỉ số hệ số liên tiếp])
        $ a_k = C_6^k 3^k $
        $ a_(k+1) = C_6^(k+1) 3^(k+1) $
        $ a_(k+1) / a_k = (C_6^(k+1) 3^(k+1)) / (C_6^k 3^k) = 3 times (6! / ((k+1)!(5-k)!)) / (6! / (k!(6-k)!)) = 3 ((6 - k) / (k + 1)) $
    ]
)

// TN 12
#tn([Khai triển nhị thức $(a + b)^7$ có bao nhiêu số hạng đạt hệ số nhị thức lớn nhất?],
    (
        True([$2$ số hạng ($C_7^3$ và $C_7^4$)]),
        [$1$ số hạng ($C_7^3$)],
        [$1$ số hạng ($C_7^4$)],
        [$3$ số hạng]
    ),
    loigiai: [
        #step([Số hạng lớn nhất với n lẻ])
        Vì $n = 7$ là số lẻ, có hai số hạng ở chính giữa có hệ số bằng nhau và lớn nhất:
        $ C_7^3 = C_7^4 = (7 times 6 times 5) / (3 times 2 times 1) = 35 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Xét khai triển đa thức $P(x) = (3 - 2x)^8 = a_0 + a_1 x + a_2 x^2 + ... + a_8 x^8$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("faf5ff"), stroke: 1.2pt + rgb("6d28d9"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("6d28d9"))[Khai triển $P(x) = (3 - 2x)^8$ và các giá trị đặc biệt])
  })
]],
  (
    True([Hệ số tự do của đa thức là $a_0 = 3^8 = 6561$.]),
    True([Tổng tất cả các hệ số của đa thức bằng $P(1) = 1$.]),
    True([Hệ số $a_1$ của số hạng chứa $x$ bằng $-34992$.]),
    [Giá trị của tổng đan dấu $a_0 - a_1 + a_2 - ... + a_8$ bằng $1$.]
  ),
  loigiai: [
    #step([Tính hệ số a0])
    Cho $x = 0$: $a_0 = P(0) = (3 - 0)^8 = 3^8 = 6561$ (Ý a ĐÚNG).
    #step([Tính tổng hệ số])
    Cho $x = 1$: $a_0 + a_1 + ... + a_8 = P(1) = (3 - 2)^8 = 1^8 = 1$ (Ý b ĐÚNG).
    #step([Tính hệ số a1])
    Số hạng chứa $x$: $T_2 = C_8^1 3^7 (-2x)^1 = 8 times 2187 times (-2) x = -34992 x$.
    Do đó $a_1 = -34992$ (Ý c ĐÚNG).
    #step([Tổng đan dấu])
    Tổng đan dấu là $P(-1) = (3 - 2(-1))^8 = (3 + 2)^8 = 5^8 = 390625 != 1$. Ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Xét các tổng hệ số tổ hợp của $n = 7$:
- $S_1 = C_7^0 + C_7^2 + C_7^4 + C_7^6$ (tổng các hệ số chẵn).
- $S_2 = C_7^1 + C_7^3 + C_7^5 + C_7^7$ (tổng các hệ số lẻ).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("faf5ff"), stroke: 1.2pt + rgb("6d28d9"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("6d28d9"))[Cân bằng hệ số chẵn lẻ: $S_1 = S_2 = 2^(n-1)$])
  })
]],
  (
    True([Tổng $S_1 + S_2 = 2^7 = 128$.]),
    True([Hiệu $S_1 - S_2 = 0$.]),
    True([Giá trị của $S_1$ bằng $64$.]),
    [Giá trị của $S_2$ bằng $128$.]
  ),
  loigiai: [
    #step([Tính tổng và hiệu])
    - $S_1 + S_2 = sum_(k=0)^7 C_7^k = 2^7 = 128$ (Ý a ĐÚNG).
    - $S_1 - S_2 = sum_(k=0)^7 (-1)^k C_7^k = (1 - 1)^7 = 0$ (Ý b ĐÚNG).
    - Suy ra $S_1 = S_2 = 128 / 2 = 64$ (Ý c ĐÚNG).
    - $S_2 = 64 != 128$. Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Xét khai triển nhị thức $(2 + x)^9 = a_0 + a_1 x + a_2 x^2 + ... + a_9 x^9$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("faf5ff"), stroke: 1.2pt + rgb("6d28d9"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("6d28d9"))[Tìm hệ số lớn nhất của khai triển $(2 + x)^9$])
  })
]],
  (
    True([Hệ số tổng quát là $a_k = C_9^k 2^(9-k)$ với $0 <= k <= 9$.]),
    True([Tỉ số $a_(k+1) / a_k = (9 - k) / (2(k + 1))$.]),
    True([Hệ số $a_k$ đạt giá trị lớn nhất khi $k = 3$.]),
    [Hệ số lớn nhất trong khai triển là $a_5$.]
  ),
  loigiai: [
    #step([Thiết lập công thức hệ số])
    - $a_k = C_9^k 2^(9-k)$ (Ý a ĐÚNG).
    - Tỉ số: $a_(k+1) / a_k = (C_9^(k+1) 2^(8-k)) / (C_9^k 2^(9-k)) = (9 - k) / (2(k + 1))$ (Ý b ĐÚNG).
    #step([Khảo sát tỉ số])
    $ a_(k+1) / a_k >= 1 <=> 9 - k >= 2k + 2 <=> 3k <= 7 <=> k <= 7/3 approx 2.33 $
    - Với $k = 0: a_1 > a_0$.
    - Với $k = 1: a_2 > a_1$.
    - Với $k = 2: a_3 / a_2 = 7/6 > 1 => a_3 > a_2$.
    - Với $k = 3: a_4 / a_3 = 6/8 = 3/4 < 1 => a_3 > a_4$.
    Do đó hệ số lớn nhất đạt được duy nhất tại $k = 3$ (Ý c ĐÚNG):
    $ a_3 = C_9^3 2^6 = 84 times 64 = 5376 $
    Hệ số lớn nhất là $a_3$ chứ không phải $a_5$. Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Xét tổng $T = C_6^1 + 2 C_6^2 + 3 C_6^3 + 4 C_6^4 + 5 C_6^5 + 6 C_6^6$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("faf5ff"), stroke: 1.2pt + rgb("6d28d9"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("6d28d9"))[Công thức đạo hàm: $sum_(k=1)^n k C_n^k = n 2^(n-1)$])
  })
]],
  (
    True([Ta có đẳng thức tổ hợp $k C_n^k = n C_(n-1)^(k-1)$ với mọi $1 <= k <= n$.]),
    True([Tổng $T$ có thể viết lại thành $6(C_5^0 + C_5^1 + C_5^2 + C_5^3 + C_5^4 + C_5^5)$.]),
    True([Giá trị của tổng $T$ bằng $6 times 2^5 = 192$.]),
    [Giá trị của tổng $T$ bằng $384$.]
  ),
  loigiai: [
    #step([Chứng minh đẳng thức tổ hợp])
    $ k C_n^k = k times (n!) / (k!(n-k)!) = (n times (n-1)!) / ((k-1)!(n-k)!) = n C_(n-1)^(k-1) $ (Ý a ĐÚNG).
    #step([Biến đổi tổng T])
    $ T = sum_(k=1)^6 k C_6^k = sum_(k=1)^6 6 C_5^(k-1) = 6 sum_(j=0)^5 C_5^j $ (Ý b ĐÚNG).
    #step([Tính giá trị])
    $ T = 6 times 2^5 = 6 times 32 = 192 $ (Ý c ĐÚNG).
    Giá trị $T = 384$ là SAI (Ý d SAI).
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1 (Câu 17)
#tln([Tính tổng tất cả các hệ số trong khai triển đa thức của biểu thức $P(x) = (5x - 4)^9$.],
    [1],
    loigiai: [
        #step([Thay x = 1 vào đa thức])
        Tổng các hệ số bằng giá trị của $P(x)$ tại $x = 1$:
        $ P(1) = (5(1) - 4)^9 = 1^9 = 1 $
    ]
)

// TLN 2 (Câu 18)
#tln([Tính giá trị của tổng các hệ số tổ hợp:
$ S = C_6^0 + C_6^1 + C_6^2 + C_6^3 + C_6^4 + C_6^5 + C_6^6 $],
    [64],
    loigiai: [
        #step([Áp dụng công thức tổng hệ số nhị thức])
        $ S = 2^6 = 64 $
    ]
)

// TLN 3 (Câu 19)
#tln([Tìm số tự nhiên $n$ ($n >= 2$) thỏa mãn phương trình tổ hợp:
$ C_n^1 + C_n^2 = 21 $],
    [6],
    loigiai: [
        #step([Biến đổi phương trình tổ hợp])
        Ta có $C_n^1 = n$ và $C_n^2 = (n(n - 1)) / 2$.
        Phương trình trở thành:
        $ n + (n(n - 1)) / 2 = 21 <=> 2n + n^2 - n = 42 <=> n^2 + n - 42 = 0 $
        #step([Giải phương trình bậc hai])
        $ (n - 6)(n + 7) = 0 $
        Vì $n in NN, n >= 2$ nên $n = 6$.
    ]
)

// TLN 4 (Câu 20)
#tln([Tìm hệ số lớn nhất trong các hệ số của khai triển nhị thức $(1 + x)^8$.],
    [70],
    loigiai: [
        #step([Xác định hệ số lớn nhất])
        Với nhị thức $(1 + x)^8$, các hệ số là $C_8^k$.
        Hệ số lớn nhất ứng với số hạng chính giữa $k = 8/2 = 4$:
        $ C_8^4 = (8 times 7 times 6 times 5) / (4 times 3 times 2 times 1) = 70 $
    ]
)

// TLN 5 (Câu 21)
#tln([Tính giá trị của biểu thức:
$ S = C_7^1 + 2 C_7^2 + 3 C_7^3 + 4 C_7^4 + 5 C_7^5 + 6 C_7^6 + 7 C_7^7 $],
    [448],
    loigiai: [
        #step([Áp dụng công thức tổng đạo hàm])
        Ta có công thức:
        $ sum_(k=1)^n k C_n^k = n 2^(n-1) $
        Với $n = 7$:
        $ S = 7 times 2^(7-1) = 7 times 2^6 = 7 times 64 = 448 $
    ]
)

// TLN 6 (Câu 22)
#tln([Biết rằng tổng các hệ số trong khai triển nhị thức của biểu thức $f(x) = (1 + 2x)^n$ bằng $2187$.
Tìm giá trị của số tự nhiên $n$.],
    [7],
    loigiai: [
        #step([Tính tổng hệ số])
        Tổng các hệ số bằng $f(1)$:
        $ f(1) = (1 + 2(1))^n = 3^n $
        #step([Giải phương trình tìm n])
        Theo đề bài:
        $ 3^n = 2187 = 3^7 <=> n = 7 $
    ]
)

] // end make-questions

#make-questions()
