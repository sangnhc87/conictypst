#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("be123c") // Crimson/Rose cho Đề 5C

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: QUY NẠP TOÁN HỌC & NHỊ THỨC NEWTON",
  exam-title: "BÀI 2: NHỊ THỨC NEWTON MỞ RỘNG (ĐỀ C - ĐA THỨC & TAM THỨC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "315",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong khai triển tam thức $(a + b + c)^n$, số hạng tổng quát theo định lý đa thức Leibniz có dạng:
$ (n!) / (i! j! k!) a^i b^j c^k $
với các số tự nhiên $i, j, k >= 0$ thỏa mãn điều kiện
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("fff1f2"), stroke: 1.2pt + rgb("be123c"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("be123c"))[Số hạng tổng quát tam thức: $i + j + k = n$])
  })
]],
    (
        True([$i + j + k = n$]),
        [$i + j + k = n + 1$],
        [$i times j times k = n$],
        [$i + j = k + n$]
    ),
    loigiai: [
        #step([Định lý đa thức Leibniz])
        Khai triển $(a + b + c)^n$ là tổng của tất cả các số hạng có dạng $(n!) / (i! j! k!) a^i b^j c^k$ với mọi bộ số tự nhiên $(i, j, k)$ thỏa mãn $i + j + k = n$.
    ]
)

// TN 2
#tn([Số lượng các số hạng phân biệt trong khai triển của tam thức $(a + b + c)^n$ (với $a, b, c$ là các biến độc lập) được tính theo công thức tổ hợp lặp là],
    (
        True([$C_(n+2)^2 = ((n + 1)(n + 2)) / 2$]),
        [$C_(n+1)^2 = (n(n + 1)) / 2$],
        [$(n + 1)^2$],
        [$3^n$]
    ),
    loigiai: [
        #step([Bài toán chia kẹo Euler])
        Số số hạng bằng số nghiệm tự nhiên của phương trình $i + j + k = n$.
        Theo công thức tổ hợp lặp:
        $ C_(n + 3 - 1)^(3 - 1) = C_(n+2)^2 = ((n + 1)(n + 2)) / 2 $
    ]
)

// TN 3
#tn([Số lượng các số hạng trong khai triển của tam thức $(x + y + z)^4$ là],
    (
        True([$15$]),
        [$10$],
        [$20$],
        [$16$]
    ),
    loigiai: [
        #step([Áp dụng công thức số số hạng tam thức])
        Với $n = 4$:
        $ C_(4+2)^2 = C_6^2 = (6 times 5) / 2 = 15 $
    ]
)

// TN 4
#tn([Hệ số của số hạng chứa $x^2 y z^2$ trong khai triển của biểu thức $(x + 2y - z)^5$ là],
    (
        True([$60$]),
        [$-60$],
        [$30$],
        [$-30$]
    ),
    loigiai: [
        #step([Xác định bộ số mũ])
        Số hạng chứa $x^2 y z^2$ ứng với $i = 2, j = 1, k = 2$ ($2 + 1 + 2 = 5$).
        Hệ số trong khai triển:
        $ (5!) / (2! 1! 2!) (1)^2 (2)^1 (-1)^2 = 120 / (2 times 1 times 2) times 1 times 2 times 1 = 30 times 2 = 60 $
    ]
)

// TN 5
#tn([Số hạng chứa $x^4 y^3$ trong khai triển của nhị thức $(x - 2y)^7$ là],
    (
        True([$-280 x^4 y^3$]),
        [$280 x^4 y^3$],
        [$-560 x^4 y^3$],
        [$560 x^4 y^3$]
    ),
    loigiai: [
        #step([Số hạng tổng quát])
        $ T_(k+1) = C_7^k x^(7-k) (-2y)^k = C_7^k (-2)^k x^(7-k) y^k $
        Chứa $x^4 y^3$ ứng với $k = 3$.
        Số hạng là:
        $ C_7^3 (-2)^3 x^4 y^3 = 35 times (-8) x^4 y^3 = -280 x^4 y^3 $
    ]
)

// TN 6
#tn([Tổng tất cả các hệ số trong khai triển đa thức của biểu thức $P(x) = (1 + x - x^2)^8$ bằng],
    (
        True([$1$]),
        [$0$],
        [$3^8$],
        [$2^8$]
    ),
    loigiai: [
        #step([Thay x = 1])
        Tổng các hệ số của $P(x)$ bằng giá trị $P(1)$:
        $ P(1) = (1 + 1 - 1^2)^8 = (1 + 1 - 1)^8 = 1^8 = 1 $
    ]
)

// TN 7
#tn([Khai triển biểu thức $Q(x) = (1 + x + x^2 + x^3)^5$. Ta có thể viết gọn $Q(x)$ dưới dạng tích hai nhị thức nào sau đây?],
    (
        True([$(1 + x)^5 (1 + x^2)^5$]),
        [$(1 + x)^5 (1 + x)^5$],
        [$(1 - x)^5 (1 + x^2)^5$],
        [$(1 + x^3)^5 (1 + x)^5$]
    ),
    loigiai: [
        #step([Phân tích đa thức thành nhân tử])
        $ 1 + x + x^2 + x^3 = (1 + x) + x^2(1 + x) = (1 + x)(1 + x^2) $
        Do đó:
        $ (1 + x + x^2 + x^3)^5 = [(1 + x)(1 + x^2)]^5 = (1 + x)^5 (1 + x^2)^5 $
    ]
)

// TN 8
#tn([Bậc của đa thức thu được sau khi khai triển và rút gọn biểu thức $f(x) = (2x^3 - x + 1)^4$ là],
    (
        True([$12$]),
        [$7$],
        [$8$],
        [$10$]
    ),
    loigiai: [
        #step([Xác định bậc cao nhất])
        Số hạng có bậc cao nhất sinh ra từ lũy thừa bậc cao nhất bên trong:
        $ (2x^3)^4 = 16 x^(12) $
        Do đó bậc của đa thức là $12$.
    ]
)

// TN 9
#tn([Hệ số tự do (không chứa $x$) trong khai triển của biểu thức $(x + 1/x + 2)^4$ (với $x != 0$) là],
    (
        True([$70$]),
        [$16$],
        [$48$],
        [$36$]
    ),
    loigiai: [
        #step([Khai triển hai tầng])
        $ (2 + (x + 1/x))^4 = sum_(k=0)^4 C_4^k 2^(4-k) (x + 1/x)^k $
        Số hạng không chứa $x$ trong $(x + 1/x)^k$ chỉ tồn tại khi $k$ chẵn:
        - $k = 0$: $C_4^0 2^4 = 16$.
        - $k = 2$: $C_4^2 2^2 times [C_2^1 x^1 (1/x)^1] = 6 times 4 times 2 = 48$.
        - $k = 4$: $C_4^4 2^0 times [C_4^2 x^2 (1/x)^2] = 1 times 1 times 6 = 6$.
        Tổng hệ số tự do:
        $ 16 + 48 + 6 = 70 $
    ]
)

// TN 10
#tn([Khai triển nhị thức $((x + y) + z)^5$. Số hạng chứa $x^2 y^2 z$ có hệ số bằng],
    (
        True([$30$]),
        [$10$],
        [$20$],
        [$15$]
    ),
    loigiai: [
        #step([Áp dụng công thức hệ số đa thức])
        Hệ số của $x^2 y^2 z^1$:
        $ (5!) / (2! 2! 1!) = 120 / (2 times 2 times 1) = 30 $
    ]
)

// TN 11
#tn([Trong khai triển $(x + 2y)^6$, hệ số của số hạng chính giữa ($T_4$) là],
    (
        True([$160$]),
        [$20$],
        [$80$],
        [$320$]
    ),
    loigiai: [
        #step([Số hạng chính giữa T4])
        Khai triển có $7$ số hạng, số hạng chính giữa là $T_4$ (ứng với $k = 3$):
        $ T_4 = C_6^3 x^(6-3) (2y)^3 = 20 x^3 (8 y^3) = 160 x^3 y^3 $
        Hệ số là $160$.
    ]
)

// TN 12
#tn([Cho khai triển $(1 + x + x^2)^4 = a_0 + a_1 x + a_2 x^2 + ... + a_8 x^8$. Giá trị của tổng $a_0 + a_1 + a_2 + ... + a_8$ bằng],
    (
        True([$81$]),
        [$16$],
        [$64$],
        [$27$]
    ),
    loigiai: [
        #step([Tính tổng hệ số bằng cách thay x = 1])
        $ (1 + 1 + 1^2)^4 = 3^4 = 81 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Xét khai triển của tam thức $P(x, y) = (1 + 2x - y)^5$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("fff1f2"), stroke: 1.2pt + rgb("be123c"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("be123c"))[Khai triển tam thức $(1 + 2x - y)^5$])
  })
]],
  (
    True([Số lượng số hạng phân biệt trong khai triển bằng $C_7^2 = 21$.]),
    True([Số hạng chứa $x^2 y$ trong khai triển có hệ số bằng $-120$.]),
    True([Tổng tất cả các hệ số trong khai triển bằng $P(1, 1) = 32$.]),
    [Số hạng chứa $x^3 y^2$ trong khai triển có hệ số âm.]
  ),
  loigiai: [
    #step([Tính số số hạng])
    $ C_(5+2)^2 = C_7^2 = (7 times 6)/2 = 21 $ (Ý a ĐÚNG).
    #step([Tìm hệ số chứa x^2 y])
    Ứng với số mũ của $1$ là $i = 2$, số mũ của $2x$ là $j = 2$, số mũ của $-y$ là $k = 1$:
    $ (5!) / (2! 2! 1!) (1)^2 (2)^2 (-1)^1 = 30 times 4 times (-1) = -120 $ (Ý b ĐÚNG).
    #step([Tính tổng hệ số])
    $ P(1, 1) = (1 + 2(1) - 1)^5 = 2^5 = 32 $ (Ý c ĐÚNG).
    #step([Xét dấu hệ số của x^3 y^2])
    Ứng với số mũ $j = 3$ của $2x$ và $k = 2$ của $-y$:
    Hệ số chứa $(-1)^2 = +1 > 0$ và $2^3 = 8 > 0$, nên hệ số mang dấu DƯƠNG chứ không phải âm. Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Cho đa thức $Q(x) = (1 - x + x^2)^6 = a_0 + a_1 x + a_2 x^2 + ... + a_(12) x^(12)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("fff1f2"), stroke: 1.2pt + rgb("be123c"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("be123c"))[Khai triển đa thức $Q(x) = (1 - x + x^2)^6$])
  })
]],
  (
    True([Hệ số tự do của đa thức là $a_0 = 1$.]),
    True([Tổng tất cả các hệ số $a_0 + a_1 + ... + a_(12)$ bằng $1$.]),
    True([Hệ số $a_1$ của số hạng chứa $x$ bằng $-6$.]),
    [Hệ số $a_2$ của số hạng chứa $x^2$ bằng $9$.]
  ),
  loigiai: [
    #step([Hệ số a0 và tổng hệ số])
    - $a_0 = Q(0) = 1^6 = 1$ (Ý a ĐÚNG).
    - Tổng hệ số: $Q(1) = (1 - 1 + 1)^6 = 1^6 = 1$ (Ý b ĐÚNG).
    #step([Tìm hệ số a1 và a2])
    $ (1 + (-x + x^2))^6 = 1 + 6(-x + x^2) + C_6^2 (-x + x^2)^2 + ... $
    $ = 1 - 6x + 6x^2 + 15(x^2 - 2x^3 + x^4) + ... $
    $ = 1 - 6x + (6 + 15)x^2 + ... = 1 - 6x + 21x^2 + ... $
    - Hệ số của $x$ là $a_1 = -6$ (Ý c ĐÚNG).
    - Hệ số của $x^2$ là $a_2 = 21 != 9$. Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Xét khai triển nhị thức đồng bậc $(x + 2y)^6 = sum_(k=0)^6 C_6^k x^(6-k) (2y)^k$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("fff1f2"), stroke: 1.2pt + rgb("be123c"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("be123c"))[Đa thức thuần nhất bậc 6 đối với hai biến $x, y$])
  })
]],
  (
    True([Tất cả các số hạng trong khai triển đều có tổng số mũ của $x$ và $y$ bằng $6$.]),
    True([Hệ số của số hạng chứa $x^4 y^2$ bằng $60$.]),
    True([Hệ số của số hạng chứa $x^2 y^4$ bằng $240$.]),
    [Hệ số lớn nhất trong khai triển là hệ số của số hạng chứa $x^3 y^3$.]
  ),
  loigiai: [
    #step([Tính chất đồng bậc])
    Mỗi số hạng có dạng $a_k x^(6-k) y^k$ với tổng số mũ $(6 - k) + k = 6$ (Ý a ĐÚNG).
    #step([Tính các hệ số])
    - Hệ số chứa $x^4 y^2$ ($k = 2$): $C_6^2 2^2 = 15 times 4 = 60$ (Ý b ĐÚNG).
    - Hệ số chứa $x^2 y^4$ ($k = 4$): $C_6^4 2^4 = 15 times 16 = 240$ (Ý c ĐÚNG).
    - Hệ số chứa $x^3 y^3$ ($k = 3$): $C_6^3 2^3 = 20 times 8 = 160 < 240$.
    Hệ số lớn nhất là $240$ tại $k = 4$, chứ không phải tại $k = 3$. Ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Xét khai triển đa thức $f(x) = (1 + x^2 - x^3)^8$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("fff1f2"), stroke: 1.2pt + rgb("be123c"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("be123c"))[Tìm hệ số của $x^8$ trong $(1 + x^2 - x^3)^8$])
  })
]],
  (
    True([Số hạng tổng quát trong khai triển là $(8!) / (i! j! k!) (1)^i (x^2)^j (-x^3)^k$ với $i + j + k = 8$.]),
    True([Số mũ của $x$ trong số hạng tổng quát là $2j + 3k$.]),
    True([Phương trình $2j + 3k = 8$ với $j, k in NN$ có hai cặp nghiệm là $(j, k) = (4, 0)$ và $(j, k) = (1, 2)$.]),
    [Hệ số của số hạng chứa $x^8$ trong khai triển bằng $100$.]
  ),
  loigiai: [
    #step([Thiết lập số hạng tổng quát])
    $ T = (8!) / (i! j! k!) (-1)^k x^(2j + 3k) $ với $i + j + k = 8$ (Ý a ĐÚNG, Ý b ĐÚNG).
    #step([Tìm nghiệm 2j + 3k = 8])
    Vì $k >= 0$:
    - Nếu $k = 0 => 2j = 8 => j = 4 => i = 8 - 4 - 0 = 4$.
    - Nếu $k = 1 => 2j = 5$ (loại).
    - Nếu $k = 2 => 2j = 2 => j = 1 => i = 8 - 1 - 2 = 5$.
    Có đúng hai cặp nghiệm $(j, k) = (4, 0)$ và $(1, 2)$ (Ý c ĐÚNG).
    #step([Tính hệ số của x^8])
    - Trường hợp 1: $(i, j, k) = (4, 4, 0)$:
      $ c_1 = (8!) / (4! 4! 0!) (-1)^0 = 70 $.
    - Trường hợp 2: $(i, j, k) = (5, 1, 2)$:
      $ c_2 = (8!) / (5! 1! 2!) (-1)^2 = (8 times 7 times 6) / 2 times 1 = 168 $.
    Tổng hệ số của $x^8$:
    $ c = c_1 + c_2 = 70 + 168 = 238 != 100 $
    Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1 (Câu 17)
#tln([Tìm số lượng các số hạng phân biệt trong khai triển của tam thức $(x + y + z)^6$.],
    [28],
    loigiai: [
        #step([Áp dụng công thức số số hạng tam thức])
        Số số hạng bằng:
        $ C_(6+2)^2 = C_8^2 = (8 times 7) / 2 = 28 $
    ]
)

// TLN 2 (Câu 18)
#tln([Tìm hệ số của số hạng chứa $x^3 y^2 z$ trong khai triển của tam thức $(2x - y + 3z)^6$.],
    [1440],
    loigiai: [
        #step([Xác định bộ số mũ])
        Số hạng chứa $x^3 y^2 z$ ứng với $i = 3, j = 2, k = 1$ ($3 + 2 + 1 = 6$).
        #step([Tính hệ số])
        $ a = (6!) / (3! 2! 1!) (2)^3 (-1)^2 (3)^1 = 60 times 8 times 1 times 3 = 1440 $
    ]
)

// TLN 3 (Câu 19)
#tln([Cho đa thức $P(x) = (2 - 3x + x^2)^5 = a_0 + a_1 x + a_2 x^2 + ... + a_(10) x^(10)$.
Tính tổng tất cả các hệ số $S = a_0 + a_1 + a_2 + ... + a_(10)$.],
    [0],
    loigiai: [
        #step([Tính tổng hệ số bằng cách thay x = 1])
        $ S = P(1) = (2 - 3(1) + 1^2)^5 = (2 - 3 + 1)^5 = 0^5 = 0 $
    ]
)

// TLN 4 (Câu 20)
#tln([Tìm hệ số của số hạng chứa $x^4$ trong khai triển của biểu thức $f(x) = (1 + 2x + 3x^2)^4$.],
    [214],
    loigiai: [
        #step([Khai triển theo công thức tam thức])
        Số hạng tổng quát:
        $ (4!) / (i! j! k!) 1^i (2x)^j (3x^2)^k = (4!) / (i! j! k!) 2^j 3^k x^(j + 2k) $
        với $i + j + k = 4$ và $j + 2k = 4$.
        #step([Tìm các bộ chỉ số thỏa mãn])
        - $k = 0 => j = 4 => i = 0$: Hệ số là $(4!)/(0! 4! 0!) 2^4 3^0 = 1 times 16 times 1 = 16$.
        - $k = 1 => j = 2 => i = 1$: Hệ số là $(4!)/(1! 2! 1!) 2^2 3^1 = 12 times 4 times 3 = 144$.
        - $k = 2 => j = 0 => i = 2$: Hệ số là $(4!)/(2! 0! 2!) 2^0 3^2 = 6 times 1 times 9 = 54$.
        #step([Tổng các hệ số])
        Hệ số của $x^4$ là:
        $ 16 + 144 + 54 = 214 $
    ]
)

// TLN 5 (Câu 21)
#tln([Trong khai triển nhị thức $(x - 2y)^8$, tìm hệ số của số hạng chứa $x^5 y^3$.],
    [-448],
    loigiai: [
        #step([Số hạng tổng quát])
        $ T_(k+1) = C_8^k x^(8-k) (-2y)^k = C_8^k (-2)^k x^(8-k) y^k $
        Chứa $x^5 y^3$ ứng với $k = 3$.
        Hệ số là:
        $ C_8^3 (-2)^3 = 56 times (-8) = -448 $
    ]
)

// TLN 6 (Câu 22)
#tln([Tìm hệ số lớn nhất trong khai triển nhị thức $(1 + 2x)^6$.],
    [240],
    loigiai: [
        #step([Khảo sát hệ số a_k])
        $ a_k = C_6^k 2^k $
        - $a_0 = 1$
        - $a_1 = C_6^1 2 = 12$
        - $a_2 = C_6^2 4 = 60$
        - $a_3 = C_6^3 8 = 160$
        - $a_4 = C_6^4 16 = 240$
        - $a_5 = C_6^5 32 = 192$
        - $a_6 = C_6^6 64 = 64$
        Hệ số lớn nhất là $a_4 = 240$.
    ]
)

] // end make-questions

#make-questions()
