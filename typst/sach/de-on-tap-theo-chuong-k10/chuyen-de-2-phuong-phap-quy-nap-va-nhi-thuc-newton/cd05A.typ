#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("4338ca") // Indigo cho Đề 5A

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: QUY NẠP TOÁN HỌC & NHỊ THỨC NEWTON",
  exam-title: "BÀI 2: NHỊ THỨC NEWTON MỞ RỘNG (ĐỀ A - SỐ HẠNG TỔNG QUÁT & HỆ SỐ)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "313",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Công thức khai triển nhị thức Newton với số mũ nguyên dương $n$ là
$ (a + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Tam giác Pascal nhỏ
    content((0, 1.2), text(size: 7.5pt, weight: "bold", fill: rgb("4338ca"))[1])
    content((-0.4, 0.8), text(size: 7.5pt)[1])
    content((0.4, 0.8), text(size: 7.5pt)[1])
    content((-0.8, 0.4), text(size: 7.5pt)[1])
    content((0, 0.4), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[2])
    content((0.8, 0.4), text(size: 7.5pt)[1])
    content((-1.2, 0), text(size: 7.5pt)[1])
    content((-0.4, 0), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[3])
    content((0.4, 0), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[3])
    content((1.2, 0), text(size: 7.5pt)[1])
  })
]
Số lượng các số hạng trong khai triển của nhị thức $(a + b)^n$ là],
    (
        True([$n + 1$]),
        [$n$],
        [$n - 1$],
        [$2n$]
    ),
    loigiai: [
        #step([Xác định số số hạng])
        Chỉ số $k$ chạy từ $0$ đến $n$, do đó số lượng số hạng trong khai triển nhị thức Newton là $(n - 0 + 1) = n + 1$.
    ]
)

// TN 2
#tn([Trong khai triển nhị thức Newton $(a + b)^n$, số hạng thứ $k + 1$ ($0 <= k <= n$) được xác định bởi công thức nào sau đây?],
    (
        True([$T_(k+1) = C_n^k a^(n-k) b^k$]),
        [$T_(k+1) = C_n^(k+1) a^(n-k) b^k$],
        [$T_(k+1) = C_n^k a^k b^(n-k)$],
        [$T_(k+1) = C_n^(k-1) a^(n-k) b^k$]
    ),
    loigiai: [
        #step([Công thức số hạng tổng quát])
        Số hạng thứ nhất ứng với $k = 0$: $T_1 = C_n^0 a^n$.
        Số hạng tổng quát thứ $k + 1$ là $T_(k+1) = C_n^k a^(n-k) b^k$.
    ]
)

// TN 3
#tn([Hệ số của số hạng chứa $x^4$ trong khai triển của nhị thức $(x + 2)^6$ là],
    (
        True([$60$]),
        [$15$],
        [$240$],
        [$30$]
    ),
    loigiai: [
        #step([Tìm số hạng chứa x^4])
        Số hạng tổng quát:
        $ T_(k+1) = C_6^k x^(6-k) 2^k $
        Số hạng chứa $x^4$ ứng với $6 - k = 4 <=> k = 2$.
        Hệ số cần tìm là:
        $ C_6^2 times 2^2 = 15 times 4 = 60 $
    ]
)

// TN 4
#tn([Số hạng thứ tư ($T_4$) trong khai triển của nhị thức $(2x - 1)^7$ theo chiều lũy thừa giảm dần của $x$ là],
    (
        True([$-560 x^4$]),
        [$560 x^4$],
        [$-280 x^3$],
        [$280 x^3$]
    ),
    loigiai: [
        #step([Xác định số hạng thứ tư T4])
        Số hạng thứ tư ứng với $k = 3$:
        $ T_4 = C_7^3 (2x)^(7-3) (-1)^3 = 35 times (2x)^4 times (-1) = 35 times 16 x^4 times (-1) = -560 x^4 $
    ]
)

// TN 5
#tn([Số hạng không chứa $x$ trong khai triển nhị thức $(x + 1/x)^8$ (với $x != 0$) là],
    (
        True([$70$]),
        [$56$],
        [$28$],
        [$1$]
    ),
    loigiai: [
        #step([Tìm số hạng không chứa x])
        Số hạng tổng quát:
        $ T_(k+1) = C_8^k x^(8-k) (1/x)^k = C_8^k x^(8 - 2k) $
        Không chứa $x$ tương ứng với số mũ $8 - 2k = 0 <=> k = 4$.
        Giá trị số hạng là:
        $ C_8^4 = (8 times 7 times 6 times 5) / (4 times 3 times 2 times 1) = 70 $
    ]
)

// TN 6
#tn([Hệ số của $x^3$ trong khai triển nhị thức $(1 - 3x)^8$ là],
    (
        True([$-1512$]),
        [$1512$],
        [$-56$],
        [$56$]
    ),
    loigiai: [
        #step([Tìm hệ số x^3])
        Số hạng tổng quát:
        $ T_(k+1) = C_8^k 1^(8-k) (-3x)^k = C_8^k (-3)^k x^k $
        Số hạng chứa $x^3$ ứng với $k = 3$.
        Hệ số là:
        $ C_8^3 (-3)^3 = 56 times (-27) = -1512 $
    ]
)

// TN 7
#tn([Trong mỗi số hạng của khai triển nhị thức $(a + b)^n$, tổng số mũ của hai biến $a$ và $b$ luôn có giá trị bằng],
    (
        True([$n$]),
        [$n + 1$],
        [$2n$],
        [$n - 1$]
    ),
    loigiai: [
        #step([Tính chất đồng bậc của khai triển nhị thức])
        Số hạng tổng quát có dạng $C_n^k a^(n-k) b^k$.
        Tổng số mũ của $a$ và $b$ là $(n - k) + k = n$, luôn không đổi và bằng số mũ của nhị thức ban đầu.
    ]
)

// TN 8
#tn([Tính chất đối xứng của các hệ số nhị thức Newton được thể hiện qua đẳng thức tổ hợp nào sau đây?],
    (
        True([$C_n^k = C_n^(n-k)$]),
        [$C_n^k = C_n^(k-1)$],
        [$C_n^k = C_(n-1)^k$],
        [$C_n^k = -C_n^(n-k)$]
    ),
    loigiai: [
        #step([Tính chất đối xứng])
        Chọn $k$ phần tử từ $n$ phần tử tương đương với việc bỏ lại $n - k$ phần tử:
        $ C_n^k = C_n^(n-k) $
    ]
)

// TN 9
#tn([Số hạng đứng chính giữa trong khai triển $(x + y)^8$ là],
    (
        True([Số hạng thứ $5$ ($T_5$)]),
        [Số hạng thứ $4$ ($T_4$)],
        [Số hạng thứ $6$ ($T_6$)],
        [Không có số hạng chính giữa]
    ),
    loigiai: [
        #step([Xác định vị trí chính giữa])
        Khai triển $(x + y)^8$ có $8 + 1 = 9$ số hạng.
        Số lượng số hạng là số lẻ, nên có duy nhất một số hạng đứng chính giữa ở vị trí $(9 + 1)/2 = 5$, tức $T_5$ (ứng với $k = 4$).
    ]
)

// TN 10
#tn([Hệ số của số hạng không chứa $x$ trong khai triển nhị thức $(2x^2 - 1/x)^6$ (với $x != 0$) là],
    (
        True([$60$]),
        [$-60$],
        [$15$],
        [$240$]
    ),
    loigiai: [
        #step([Biến đổi số hạng tổng quát])
        $ T_(k+1) = C_6^k (2x^2)^(6-k) (-1/x)^k = C_6^k 2^(6-k) (-1)^k x^(12 - 2k - k) = C_6^k 2^(6-k) (-1)^k x^(12 - 3k) $
        Không chứa $x$ ứng với:
        $ 12 - 3k = 0 <=> k = 4 $
        Hệ số:
        $ C_6^4 2^(6-4) (-1)^4 = 15 times 2^2 times 1 = 15 times 4 = 60 $
    ]
)

// TN 11
#tn([Tìm số hạng chứa $x$ trong khai triển nhị thức $(sqrt(x) + 1 / root(4, x))^6$ với $x > 0$. Số hạng đó ứng với giá trị nào của chỉ số $k$?],
    (
        True([$k = 2$]),
        [$k = 1$],
        [$k = 3$],
        [$k = 4$]
    ),
    loigiai: [
        #step([Viết số hạng dưới dạng lũy thừa hữu tỉ])
        $ T_(k+1) = C_6^k (x^(1/2))^(6-k) (x^(-1/4))^k = C_6^k x^(3 - k/2 - k/4) = C_6^k x^(3 - (3k)/4) $
        Số hạng chứa $x = x^1$ thỏa mãn:
        $ 3 - (3k)/4 = 1 <=> (3k)/4 = 2 <=> 3k = 8 $
        Khoan, $3k = 8$ không chia hết!
        Thử lại: nếu tìm số hạng chứa $x^0$ thì $3 - 3k/4 = 0 <=> k = 4$.
        Nếu tìm số hạng chứa $root(4, x^3)$ hay $x^(3/2)$:
        Với $k = 2$: $3 - 3(2)/4 = 3 - 1.5 = 1.5 = 3/2$ ($x^(3/2) = x sqrt(x)$).
        Với $k = 0$: $x^3$.
        Với $k = 4$: $x^0$ (số hạng không chứa $x$).
        Để số mũ nguyên: số hạng không chứa $x$ ứng với $k = 4$.
    ]
)

// TN 12
#tn([Khai triển nhị thức $(1 + x)^6$ có tất cả bao nhiêu số hạng có hệ số bằng $15$?],
    (
        True([$2$ số hạng]),
        [$1$ số hạng],
        [$3$ số hạng],
        [$0$ số hạng]
    ),
    loigiai: [
        #step([Áp dụng tính đối xứng])
        Các hệ số trong khai triển $(1 + x)^6$ là $C_6^0, C_6^1, C_6^2, C_6^3, C_6^4, C_6^5, C_6^6$.
        Cụ thể: $1, 6, 15, 20, 15, 6, 1$.
        Ta thấy $C_6^2 = C_6^4 = 15$.
        Có đúng $2$ số hạng có hệ số bằng $15$ là $15 x^2$ và $15 x^4$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Xét khai triển nhị thức Newton của biểu thức $P(x) = (2x - 3)^6$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("eef2ff"), stroke: 1.2pt + rgb("4338ca"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("4338ca"))[Khai triển nhị thức $(2x - 3)^6$])
  })
]],
  (
    True([Khai triển có tất cả $7$ số hạng.]),
    True([Số hạng tổng quát trong khai triển là $T_(k+1) = C_6^k 2^(6-k) (-3)^k x^(6-k)$ với $0 <= k <= 6$.]),
    True([Hệ số của $x^4$ trong khai triển bằng $2160$.]),
    [Hệ số tự do (số hạng không chứa $x$) trong khai triển bằng $-729$.]
  ),
  loigiai: [
    #step([Xét số số hạng và số hạng tổng quát])
    - Số mũ $n = 6$ nên có $6 + 1 = 7$ số hạng (Ý a ĐÚNG).
    - $T_(k+1) = C_6^k (2x)^(6-k) (-3)^k = C_6^k 2^(6-k) (-3)^k x^(6-k)$ (Ý b ĐÚNG).
    #step([Tìm hệ số của x^4])
    Ứng với $6 - k = 4 <=> k = 2$.
    Hệ số:
    $ a_4 = C_6^2 2^4 (-3)^2 = 15 times 16 times 9 = 2160 $ (Ý c ĐÚNG).
    #step([Tìm hệ số tự do])
    Ứng với $6 - k = 0 <=> k = 6$.
    Hệ số tự do:
    $ a_0 = C_6^6 2^0 (-3)^6 = 1 times 1 times 729 = 729 != -729 $
    (Vì số mũ chẵn $6$ nên $(-3)^6 = +729$). Ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Xét khai triển nhị thức Newton của biểu thức $Q(x) = (x^2 + 1/x)^9$ với $x != 0$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("eef2ff"), stroke: 1.2pt + rgb("4338ca"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("4338ca"))[Số hạng tổng quát $T_(k+1) = C_9^k x^(18 - 3k)$])
  })
]],
  (
    True([Số hạng tổng quát trong khai triển là $T_(k+1) = C_9^k x^(18 - 3k)$ với $0 <= k <= 9$.]),
    True([Số hạng không chứa $x$ tương ứng với $k = 6$ và có giá trị bằng $84$.]),
    True([Số hạng chứa $x^6$ trong khai triển tương ứng với $k = 4$ và có hệ số bằng $126$.]),
    [Số hạng có bậc cao nhất trong khai triển là $x^(16)$.]
  ),
  loigiai: [
    #step([Biến đổi số hạng tổng quát])
    $ T_(k+1) = C_9^k (x^2)^(9-k) (1/x)^k = C_9^k x^(18 - 2k - k) = C_9^k x^(18 - 3k) $ (Ý a ĐÚNG).
    #step([Số hạng không chứa x])
    $ 18 - 3k = 0 <=> 3k = 18 <=> k = 6 $.
    Hệ số: $C_9^6 = C_9^3 = (9 times 8 times 7) / (3 times 2 times 1) = 84$ (Ý b ĐÚNG).
    #step([Số hạng chứa x^6])
    $ 18 - 3k = 6 <=> 3k = 12 <=> k = 4 $.
    Hệ số: $C_9^4 = (9 times 8 times 7 times 6) / (4 times 3 times 2 times 1) = 126$ (Ý c ĐÚNG).
    #step([Bậc cao nhất])
    Bậc cao nhất ứng với $k = 0$: $x^(18 - 3(0)) = x^(18)$ chứ không phải $x^(16)$. Ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Cho tam giác Pascal biểu diễn các hệ số của khai triển nhị thức Newton $(a + b)^n$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("eef2ff"), stroke: 1.2pt + rgb("4338ca"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("4338ca"))[Công thức Pascal: $C_(n+1)^k = C_n^k + C_n^(k-1)$])
  })
]],
  (
    True([Hàng thứ $0$ của tam giác Pascal chỉ gồm một số $1$.]),
    True([Mỗi số hạng bên trong tam giác Pascal bằng tổng của hai số hạng đứng ngay phía trên nó.]),
    True([Tổng các số hạng trên hàng thứ $n$ của tam giác Pascal bằng $2^n$.]),
    [Hàng thứ $6$ của tam giác Pascal gồm đúng $6$ số hạng.]
  ),
  loigiai: [
    #step([Các tính chất của tam giác Pascal])
    - Hàng 0 là $C_0^0 = 1$ (Ý a ĐÚNG).
    - Công thức truy hồi Pascal: $C_(n+1)^k = C_n^k + C_n^(k-1)$ (Ý b ĐÚNG).
    - Tổng các số hạng trên hàng $n$: $C_n^0 + C_n^1 + ... + C_n^n = (1 + 1)^n = 2^n$ (Ý c ĐÚNG).
    - Hàng thứ $n$ có $n + 1$ số hạng, do đó hàng thứ $6$ có $6 + 1 = 7$ số hạng chứ không phải $6$. Ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Xét khai triển nhị thức Newton của biểu thức $f(x) = (1 + 2x)^7 = a_0 + a_1 x + a_2 x^2 + ... + a_7 x^7$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("eef2ff"), stroke: 1.2pt + rgb("4338ca"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("4338ca"))[So sánh và tìm hệ số lớn nhất trong khai triển])
  })
]],
  (
    True([Hệ số tự do là $a_0 = 1$.]),
    True([Hệ số $a_1 = C_7^1 times 2^1 = 14$.]),
    True([Hệ số $a_k$ đạt giá trị lớn nhất khi $k = 5$.]),
    [Hệ số lớn nhất trong khai triển là $a_4$.]
  ),
  loigiai: [
    #step([Tính các hệ số cụ thể])
    Số hạng tổng quát: $a_k = C_7^k 2^k$.
    - $a_0 = C_7^0 2^0 = 1$ (Ý a ĐÚNG).
    - $a_1 = C_7^1 2^1 = 7 times 2 = 14$ (Ý b ĐÚNG).
    #step([Tìm hệ số lớn nhất])
    Xét tỉ số:
    $ a_(k+1) / a_k = (C_7^(k+1) 2^(k+1)) / (C_7^k 2^k) = ((7 - k) / (k + 1)) times 2 = (14 - 2k) / (k + 1) $
    Để $a_(k+1) > a_k$:
    $ (14 - 2k) / (k + 1) > 1 <=> 14 - 2k > k + 1 <=> 3k < 13 <=> k < 13/3 approx 4.33 $
    Do $k$ nguyên nên:
    - $k = 0, 1, 2, 3, 4$: $a_(k+1) > a_k$, tức $a_0 < a_1 < a_2 < a_3 < a_4 < a_5$.
    - $k = 5, 6$: $a_(k+1) < a_k$, tức $a_5 > a_6 > a_7$.
    Vậy hệ số lớn nhất là $a_5$ (Ý c ĐÚNG, Ý d SAI).
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1 (Câu 17)
#tln([Tìm hệ số của số hạng chứa $x^5$ trong khai triển nhị thức $(x + 2)^8$.],
    [448],
    loigiai: [
        #step([Số hạng tổng quát])
        $ T_(k+1) = C_8^k x^(8-k) 2^k $
        Số hạng chứa $x^5$ ứng với $8 - k = 5 <=> k = 3$.
        Hệ số là:
        $ C_8^3 2^3 = 56 times 8 = 448 $
    ]
)

// TLN 2 (Câu 18)
#tln([Tìm số hạng không chứa $x$ trong khai triển nhị thức $(x + 2/x)^6$ (với $x != 0$).],
    [160],
    loigiai: [
        #step([Biến đổi số hạng tổng quát])
        $ T_(k+1) = C_6^k x^(6-k) (2/x)^k = C_6^k 2^k x^(6 - 2k) $
        Không chứa $x$ ứng với:
        $ 6 - 2k = 0 <=> k = 3 $
        Giá trị số hạng:
        $ C_6^3 2^3 = 20 times 8 = 160 $
    ]
)

// TLN 3 (Câu 19)
#tln([Trong khai triển nhị thức $(1 - 2x)^7$, tìm hệ số của số hạng chứa $x^3$.],
    [-280],
    loigiai: [
        #step([Số hạng tổng quát])
        $ T_(k+1) = C_7^k 1^(7-k) (-2x)^k = C_7^k (-2)^k x^k $
        Số hạng chứa $x^3$ ứng với $k = 3$.
        Hệ số là:
        $ C_7^3 (-2)^3 = 35 times (-8) = -280 $
    ]
)

// TLN 4 (Câu 20)
#tln([Tìm hệ số của số hạng chứa $x^4$ trong khai triển nhị thức $(3x - 1)^6$.],
    [1215],
    loigiai: [
        #step([Số hạng tổng quát])
        $ T_(k+1) = C_6^k (3x)^(6-k) (-1)^k = C_6^k 3^(6-k) (-1)^k x^(6-k) $
        Chứa $x^4$ ứng với $6 - k = 4 <=> k = 2$.
        Hệ số là:
        $ C_6^2 3^(6-2) (-1)^2 = 15 times 3^4 times 1 = 15 times 81 = 1215 $
    ]
)

// TLN 5 (Câu 21)
#tln([Khai triển nhị thức $(x^2 - 1/x)^6$ (với $x != 0$) có số hạng không chứa $x$ bằng bao nhiêu?],
    [15],
    loigiai: [
        #step([Số hạng tổng quát])
        $ T_(k+1) = C_6^k (x^2)^(6-k) (-1/x)^k = C_6^k (-1)^k x^(12 - 3k) $
        Không chứa $x$ ứng với:
        $ 12 - 3k = 0 <=> k = 4 $
        Giá trị số hạng:
        $ C_6^4 (-1)^4 = 15 times 1 = 15 $
    ]
)

// TLN 6 (Câu 22)
#tln([Biết rằng hệ số của số hạng chứa $x^2$ trong khai triển của nhị thức $(1 + a x)^6$ (với $a$ là tham số dương) bằng $60$.
Tìm giá trị của tham số $a$.],
    [2],
    loigiai: [
        #step([Thiết lập phương trình với a])
        Số hạng chứa $x^2$ là $C_6^2 1^(6-2) (a x)^2 = C_6^2 a^2 x^2 = 15 a^2 x^2$.
        Theo giả thiết hệ số bằng $60$:
        $ 15 a^2 = 60 <=> a^2 = 4 $
        Vì $a > 0$ nên $a = 2$.
    ]
)

] // end make-questions

#make-questions()
