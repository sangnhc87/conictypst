#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("b45309") // Amber/Orange cho Đề 4C

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: QUY NẠP TOÁN HỌC & NHỊ THỨC NEWTON",
  exam-title: "BÀI 1: PHƯƠNG PHÁP QUY NẠP TOÁN HỌC (ĐỀ C - CHIA HẾT & HÌNH HỌC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "312",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Với mọi số nguyên dương $n in NN^*$, biểu thức $A_n = n^3 - n$ luôn chia hết cho số nguyên nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("fffbeb"), stroke: 1pt + rgb("b45309"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("b45309"))[$n^3 - n = (n - 1) n (n + 1)$])
  })
]],
    (
        True([$6$]),
        [$12$],
        [$24$],
        [$8$]
    ),
    loigiai: [
        #step([Phân tích tích ba số tự nhiên liên tiếp])
        $ n^3 - n = n(n^2 - 1) = (n - 1)n(n + 1) $
        Trong ba số tự nhiên liên tiếp $(n - 1), n, (n + 1)$ luôn có ít nhất một số chẵn và đúng một số chia hết cho $3$.
        Do $"ƯCLN"(2, 3) = 1$, tích của chúng luôn chia hết cho $2 times 3 = 6$.
    ]
)

// TN 2
#tn([Biểu thức $B_n = 4^n + 15n - 1$ chia hết cho $9$ với mọi $n in NN^*$. Khi kiểm tra bước cơ sở với $n = 1$, giá trị của $B_1$ bằng],
    (
        True([$18$]),
        [$9$],
        [$27$],
        [$0$]
    ),
    loigiai: [
        #step([Kiểm tra bước cơ sở])
        Với $n = 1$:
        $ B_1 = 4^1 + 15(1) - 1 = 4 + 15 - 1 = 18 $
        Vì $18 = 9 times 2$ chia hết cho $9$, nên bước cơ sở thỏa mãn.
    ]
)

// TN 3
#tn([Với mọi số nguyên dương $n in NN^*$, biểu thức $C_n = 16^n - 15n - 1$ luôn chia hết cho số nguyên nào sau đây?],
    (
        True([$225$]),
        [$15$],
        [$45$],
        [$75$]
    ),
    loigiai: [
        #step([Ứng dụng quy nạp hoặc nhị thức Newton])
        Ta có $16^n = (1 + 15)^n = 1 + 15n + C_n^2 15^2 + ... + 15^n$.
        Suy ra $16^n - 15n - 1$ chia hết cho $15^2 = 225$ với mọi $n in NN^*$.
    ]
)

// TN 4
#tn([Tổng các góc trong của một đa giác lồi có $n$ đỉnh ($n >= 3$) được tính theo công thức
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Đa giác lồi 5 đỉnh chia thành 3 tam giác từ đỉnh A1
    line((0, 1.2), (-1.2, 0.3), (-0.8, -1), (0.8, -1), (1.2, 0.3), (0, 1.2), stroke: 1.2pt + rgb("b45309"))
    line((0, 1.2), (-0.8, -1), stroke: (dash: "dashed", paint: rgb("dc2626")))
    line((0, 1.2), (0.8, -1), stroke: (dash: "dashed", paint: rgb("dc2626")))
    content((0, 1.45), text(size: 7.5pt, weight: "bold")[$A_1$])
    content((0, 0), text(size: 7pt, fill: rgb("dc2626"))[$n-2$ tam giác])
  })
]],
    (
        True([$(n - 2) times 180^circ$]),
        [$(n - 1) times 180^circ$],
        [$n times 180^circ$],
        [$(n - 3) times 180^circ$]
    ),
    loigiai: [
        #step([Chứng minh bằng quy nạp hình học])
        Từ một đỉnh của đa giác lồi $n$ cạnh, ta kẻ được $n - 3$ đường chéo chia đa giác thành $(n - 2)$ tam giác không chồng lấn.
        Tổng các góc của mỗi tam giác là $180^circ$, do đó tổng các góc của đa giác là $(n - 2) times 180^circ$.
    ]
)

// TN 5
#tn([Số đường chéo của một đa giác lồi có $n$ đỉnh ($n >= 3$) là],
    (
        True([$(n(n - 3)) / 2$]),
        [$(n(n - 1)) / 2$],
        [$n(n - 3)$],
        [$(n(n - 2)) / 2$]
    ),
    loigiai: [
        #step([Công thức số đường chéo])
        Nối $n$ đỉnh với nhau tạo thành $C_n^2 = (n(n - 1))/2$ đoạn thẳng, trong đó có $n$ cạnh của đa giác.
        Số đường chéo là:
        $ (n(n - 1)) / 2 - n = (n^2 - n - 2n) / 2 = (n(n - 3)) / 2 $
    ]
)

// TN 6
#tn([Trên mặt phẳng cho $n$ đường thẳng đôi một cắt nhau và không có ba đường nào đồng quy. Số miền mặt phẳng được phân chia tối đa bởi $n$ đường thẳng này là $L_n$. Công thức truy hồi liên hệ giữa $L_(n+1)$ và $L_n$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, -0.8), (2, 0.8), stroke: 1pt + rgb("b45309"))
    line((-2, 0.8), (2, -0.8), stroke: 1pt + rgb("b45309"))
    line((-1.5, -1), (1.5, 1), stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$L_(n+1) = L_n + n + 1$]),
        [$L_(n+1) = L_n + n$],
        [$L_(n+1) = 2 L_n$],
        [$L_(n+1) = L_n + 2$]
    ),
    loigiai: [
        #step([Phân tích đường thẳng thứ n+1])
        Đường thẳng thứ $n + 1$ cắt $n$ đường thẳng đã có tại $n$ giao điểm phân biệt.
        Các giao điểm này chia đường thẳng thứ $n + 1$ thành $n + 1$ đoạn thẳng (và tia).
        Mỗi đoạn này chia một miền cũ thành hai miền mới, do đó số miền tăng thêm đúng $n + 1$:
        $ L_(n+1) = L_n + n + 1 $
    ]
)

// TN 7
#tn([Số miền mặt phẳng tối đa $L_n$ được tạo ra bởi $n$ đường thẳng phân biệt thỏa mãn công thức tổng quát nào?],
    (
        True([$L_n = (n(n + 1)) / 2 + 1$]),
        [$L_n = (n(n - 1)) / 2 + 1$],
        [$L_n = n^2 + 1$],
        [$L_n = 2^n$]
    ),
    loigiai: [
        #step([Tính công thức tổng quát])
        Ta có $L_0 = 1$ (mặt phẳng ban đầu chưa có đường thẳng nào).
        $ L_n = L_0 + 1 + 2 + 3 + ... + n = 1 + (n(n + 1)) / 2 $
    ]
)

// TN 8
#tn([Biểu thức $7^n - 1$ chia hết cho $6$ với mọi số nguyên dương $n in NN^*$. Khi chuyển từ $k$ lên $k + 1$ trong bước quy nạp, biến đổi nào sau đây là đúng?],
    (
        True([$7^(k+1) - 1 = 7(7^k - 1) + 6$]),
        [$7^(k+1) - 1 = 7(7^k - 1) + 7$],
        [$7^(k+1) - 1 = 6(7^k - 1) + 1$],
        [$7^(k+1) - 1 = 7^k + 6$]
    ),
    loigiai: [
        #step([Biến đổi tách thừa số])
        $ 7^(k+1) - 1 = 7 times 7^k - 1 = 7(7^k - 1) + 7 - 1 = 7(7^k - 1) + 6 $
        Vì $7^k - 1$ chia hết cho $6$ theo giả thiết quy nạp và $6$ chia hết cho $6$, nên $7^(k+1) - 1$ chia hết cho $6$.
    ]
)

// TN 9
#tn([Một viên gạch L-tromino gồm $3$ ô vuông đơn vị ghép lại thành hình chữ L.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0, 0), (0.6, 0.6), fill: rgb("fffbeb"), stroke: 1pt + rgb("b45309"))
    rect((0, 0.6), (0.6, 1.2), fill: rgb("fffbeb"), stroke: 1pt + rgb("b45309"))
    rect((0.6, 0), (1.2, 0.6), fill: rgb("fffbeb"), stroke: 1pt + rgb("b45309"))
    content((0.6, 0.6), text(size: 7pt, fill: rgb("b45309"), weight: "bold")[L-tromino])
  })
]
Định lý Golomb phát biểu: Một bàn cờ kích thước $2^n times 2^n$ ($n >= 1$) bị khuyết đúng $1$ ô vuông bất kỳ thì],
    (
        True([Luôn có thể lát kín hoàn toàn bằng các viên gạch L-tromino không đè lên nhau]),
        [Chỉ lát kín được khi ô bị khuyết nằm ở góc bàn cờ],
        [Chỉ lát kín được khi ô bị khuyết nằm ở tâm bàn cờ],
        [Không bao giờ lát kín được với mọi $n >= 2$]
    ),
    loigiai: [
        #step([Định lý Golomb về lát gạch quy nạp])
        Bàn cờ $2^n times 2^n$ có $4^n$ ô. Khi khuyết $1$ ô còn lại $4^n - 1$ ô.
        Vì $4^n - 1 = (4 - 1)(4^(n-1) + ... + 1) = 3M$ luôn chia hết cho $3$.
        Bằng phương pháp quy nạp chia đôi bàn cờ làm 4 phần, Solomon Golomb đã chứng minh luôn lát kín được với bất kỳ vị trí ô khuyết nào.
    ]
)

// TN 10
#tn([Với mọi số tự nhiên $n in NN$, số $D_n = 2^(2n+1) + 1$ luôn chia hết cho số nguyên nào sau đây?],
    (
        True([$3$]),
        [$5$],
        [$7$],
        [$9$]
    ),
    loigiai: [
        #step([Chứng minh bằng quy nạp])
        - $n = 0: 2^1 + 1 = 3 vdots 3$.
        - $n = 1: 2^3 + 1 = 9 vdots 3$.
        - Giả sử $2^(2k+1) + 1 vdots 3$.
        - Với $n = k + 1$: $2^(2k+3) + 1 = 4 times 2^(2k+1) + 1 = 4(2^(2k+1) + 1) - 3 vdots 3$.
    ]
)

// TN 11
#tn([Cho đa giác lồi có $6$ đỉnh (lục giác lồi). Số đường chéo của lục giác này là],
    (
        True([$9$]),
        [$6$],
        [$12$],
        [$15$]
    ),
    loigiai: [
        #step([Tính số đường chéo của lục giác])
        Áp dụng công thức $N = (n(n - 3)) / 2$:
        Với $n = 6$:
        $ N = (6(6 - 3)) / 2 = (6 times 3) / 2 = 9 $
    ]
)

// TN 12
#tn([Biểu thức $n^3 + 2n$ chia hết cho $3$ với mọi $n in NN^*$. Khi chứng minh bằng quy nạp, ở bước quy nạp ta xét $P(k+1) = (k+1)^3 + 2(k+1)$. Khai triển nào sau đây giúp chỉ ra tính chia hết cho $3$?],
    (
        True([$(k+1)^3 + 2(k+1) = (k^3 + 2k) + 3(k^2 + k + 1)$]),
        [$(k+1)^3 + 2(k+1) = (k^3 + 2k) + 3k^2$],
        [$(k+1)^3 + 2(k+1) = (k^3 + 2k) + 6k$],
        [$(k+1)^3 + 2(k+1) = (k^3 + 2k) + 1$]
    ),
    loigiai: [
        #step([Khai triển nhị thức])
        $ (k+1)^3 + 2(k+1) = k^3 + 3k^2 + 3k + 1 + 2k + 2 = (k^3 + 2k) + (3k^2 + 3k + 3) = (k^3 + 2k) + 3(k^2 + k + 1) $
        Vì $(k^3 + 2k) vdots 3$ theo giả thiết quy nạp và $3(k^2 + k + 1) vdots 3$, nên biểu thức chia hết cho $3$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Xét biểu thức $A_n = 4^n + 15n - 1$ với $n$ là số nguyên dương ($n in NN^*$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("fffbeb"), stroke: 1.2pt + rgb("b45309"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("b45309"))[Chứng minh $4^n + 15n - 1$ chia hết cho $9$])
  })
]],
  (
    True([Với $n = 1$, ta có $A_1 = 4^1 + 15(1) - 1 = 18$ chia hết cho $9$.]),
    True([Với $n = 2$, ta có $A_2 = 4^2 + 15(2) - 1 = 45$ chia hết cho $9$.]),
    True([Hiệu $A_(k+1) - A_k$ có thể viết thành $3(4^k + 5)$.]),
    [Biểu thức $A_n$ luôn chia hết cho $27$ với mọi $n in NN^*$.]
  ),
  loigiai: [
    #step([Kiểm tra cơ sở])
    - $A_1 = 18 = 9 times 2$ chia hết cho 9 (Ý a ĐÚNG).
    - $A_2 = 16 + 30 - 1 = 45 = 9 times 5$ chia hết cho 9 (Ý b ĐÚNG).
    #step([Xét hiệu $A_(k+1) - A_k$])
    $ A_(k+1) - A_k = (4^(k+1) + 15(k+1) - 1) - (4^k + 15k - 1) $
    $ = 4 times 4^k - 4^k + 15 = 3 times 4^k + 15 = 3(4^k + 5) $ (Ý c ĐÚNG).
    Vì $4^k$ chia 3 dư 1 nên $4^k + 5 = 4^k - 1 + 6$ chia hết cho 3.
    Do đó $3(4^k + 5)$ chia hết cho $9$.
    #step([Xét chia hết cho 27])
    Với $n = 1$: $A_1 = 18$ không chia hết cho $27$. Do đó khẳng định chia hết cho 27 với mọi $n$ là SAI (Ý d SAI).
  ]
)

// DS 2 (Câu 14)
#ds([Cho đa giác lồi $H_n$ có $n$ đỉnh ($n >= 3$). Gọi $S_n$ là tổng các góc trong của đa giác.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.4), (2.4, 0.4), fill: rgb("fffbeb"), stroke: 1pt + rgb("b45309"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("b45309"))[Quy nạp mở rộng đa giác từ $k$ lên $k+1$ đỉnh])
  })
]],
  (
    True([Khi $n = 3$, đa giác là tam giác và $S_3 = (3 - 2) times 180^circ = 180^circ$.]),
    True([Khi bổ sung thêm một đỉnh mới để tạo đa giác $(k + 1)$ đỉnh, tổng các góc trong tăng thêm đúng $180^circ$.]),
    True([Một bát giác lồi ($n = 8$) có tổng các góc trong bằng $1080^circ$.]),
    [Tổng các góc trong của một đa giác lồi luôn là một số lẻ khi đo bằng độ.]
  ),
  loigiai: [
    #step([Kiểm tra cơ sở tam giác])
    $S_3 = 180^circ$ (Ý a ĐÚNG).
    #step([Bước chuyển quy nạp])
    Nối hai đỉnh kề với đỉnh mới tạo thành một tam giác phụ có tổng 3 góc bằng $180^circ$. Do đó $S_(k+1) = S_k + 180^circ$ (Ý b ĐÚNG).
    #step([Tính góc bát giác])
    $S_8 = (8 - 2) times 180^circ = 6 times 180^circ = 1080^circ$ (Ý c ĐÚNG).
    #step([Tính chẵn lẻ])
    $(n - 2) times 180^circ$ luôn chia hết cho $180$ nên luôn là số chẵn. Ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Trên một mặt phẳng cho $n$ đường thẳng ở vị trí tổng quát (không có hai đường thẳng nào song song và không có ba đường thẳng nào đồng quy). Gọi $L_n$ là số miền mặt phẳng tạo thành.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("fffbeb"), stroke: 1pt + rgb("b45309"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("b45309"))[Công thức phân chia mặt phẳng $L_n = (n(n+1))/2 + 1$])
  })
]],
  (
    True([Với $n = 1$, một đường thẳng chia mặt phẳng thành $L_1 = 2$ miền.]),
    True([Với $n = 2$, hai đường thẳng cắt nhau chia mặt phẳng thành $L_2 = 4$ miền.]),
    True([Với $n = 3$, ba đường thẳng ở vị trí tổng quát chia mặt phẳng thành $L_3 = 7$ miền.]),
    [Bốn đường thẳng ở vị trí tổng quát chia mặt phẳng thành $12$ miền.]
  ),
  loigiai: [
    #step([Tính số miền cụ thể])
    Áp dụng công thức $L_n = (n(n+1))/2 + 1$:
    - $L_1 = (1 times 2)/2 + 1 = 2$ (Ý a ĐÚNG).
    - $L_2 = (2 times 3)/2 + 1 = 4$ (Ý b ĐÚNG).
    - $L_3 = (3 times 4)/2 + 1 = 7$ (Ý c ĐÚNG).
    - $L_4 = (4 times 5)/2 + 1 = 11 != 12$.
    Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Xét bài toán lát một bàn cờ kích thước $2^n times 2^n$ bị khuyết một ô vuông đơn vị bằng các mảnh L-tromino ($3$ ô vuông).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("fffbeb"), stroke: 1pt + rgb("b45309"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("b45309"))[Thuật toán chia để trị & Quy nạp lát gạch L-tromino])
  })
]],
  (
    True([Tổng số ô vuông cần lát trên bàn cờ bị khuyết là $4^n - 1$ ô.]),
    True([Số $4^n - 1$ luôn chia hết cho $3$ với mọi số nguyên dương $n$.]),
    True([Bằng cách đặt một viên gạch L-tromino ở tâm bàn cờ, ta quy bài toán kích thước $2^n times 2^n$ về $4$ bài toán con kích thước $2^(n-1) times 2^(n-1)$ đều bị khuyết đúng $1$ ô.]),
    [Số viên gạch L-tromino cần dùng để lát kín bàn cờ $4 times 4$ khuyết một ô là $6$ viên.]
  ),
  loigiai: [
    #step([Xét các mệnh đề cấu trúc])
    - Bàn cờ có $2^n times 2^n = 4^n$ ô, bỏ 1 ô còn $4^n - 1$ ô (Ý a ĐÚNG).
    - $4^n - 1 = (4 - 1)(4^(n-1) + ... + 1) = 3M$ chia hết cho 3 (Ý b ĐÚNG).
    - Thuật toán Golomb: Chia bàn cờ làm 4 góc $2^(n-1) times 2^(n-1)$. Một góc chứa ô khuyết ban đầu. Ba góc còn lại chụm vào tâm, ta đặt 1 viên L-tromino che đúng 3 ô ở tâm đó, biến cả 4 góc đều thành bàn cờ khuyết 1 ô (Ý c ĐÚNG).
    #step([Tính số viên gạch cho n = 2 (bàn cờ 4x4)])
    Số ô cần lát: $4^2 - 1 = 15$ ô.
    Mỗi viên có 3 ô nên cần $15 / 3 = 5$ viên gạch, chứ không phải $6$ viên. Ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1 (Câu 17)
#tln([Tính tổng các góc trong của một đa giác lồi có $12$ đỉnh theo đơn vị độ ($degree$).],
    [1800],
    loigiai: [
        #step([Áp dụng công thức tổng các góc trong đa giác])
        $ S = (n - 2) times 180^circ $
        Với $n = 12$:
        $ S = (12 - 2) times 180^circ = 10 times 180^circ = 1800^circ $
    ]
)

// TLN 2 (Câu 18)
#tln([Một đa giác lồi có $10$ đỉnh thì có tất cả bao nhiêu đường chéo?],
    [35],
    loigiai: [
        #step([Áp dụng công thức số đường chéo])
        $ N = (n(n - 3)) / 2 $
        Với $n = 10$:
        $ N = (10(10 - 3)) / 2 = (10 times 7) / 2 = 35 $
    ]
)

// TLN 3 (Câu 19)
#tln([Hỏi $10$ đường thẳng ở vị trí tổng quát (đôi một cắt nhau và không có ba đường nào đồng quy) chia mặt phẳng thành tối đa bao nhiêu miền?],
    [56],
    loigiai: [
        #step([Áp dụng công thức số miền mặt phẳng])
        $ L_n = (n(n + 1)) / 2 + 1 $
        Với $n = 10$:
        $ L_(10) = (10 times 11) / 2 + 1 = 55 + 1 = 56 $
    ]
)

// TLN 4 (Câu 20)
#tln([Tìm số dư trong phép chia biểu thức $4^(2026) + 15(2026) - 1$ cho $9$.],
    [0],
    loigiai: [
        #step([Áp dụng tính chất chia hết])
        Theo định lý đã chứng minh bằng quy nạp:
        Biểu thức $A_n = 4^n + 15n - 1$ luôn chia hết cho $9$ với mọi số nguyên dương $n in NN^*$.
        Vì $2026 in NN^*$, biểu thức $4^(2026) + 15(2026) - 1$ chia hết cho $9$, tức số dư bằng $0$.
    ]
)

// TLN 5 (Câu 21)
#tln([Một bàn cờ kích thước $8 times 8$ bị khuyết đi một ô vuông ở góc. Người ta dùng các viên gạch L-tromino (mỗi viên gồm $3$ ô vuông) để lát kín phần còn lại của bàn cờ.
Hỏi cần sử dụng bao nhiêu viên gạch L-tromino?],
    [21],
    loigiai: [
        #step([Tính số ô vuông cần lát])
        Bàn cờ $8 times 8$ có tổng cộng $8 times 8 = 64$ ô vuông.
        Bị khuyết $1$ ô thì số ô còn lại cần lát là:
        $ 64 - 1 = 63 " ô vuông" $
        #step([Tính số viên gạch])
        Mỗi viên gạch L-tromino phủ đúng $3$ ô vuông:
        $ N = 63 / 3 = 21 " viên gạch" $
    ]
)

// TLN 6 (Câu 22)
#tln([Tìm số đỉnh nhỏ nhất $n$ ($n >= 4$) của một đa giác lồi sao cho số đường chéo của nó lớn hơn $20$.],
    [9],
    loigiai: [
        #step([Thiết lập bất phương trình])
        Số đường chéo của đa giác lồi $n$ đỉnh là:
        $ (n(n - 3)) / 2 > 20 <=> n(n - 3) > 40 $
        #step([Thử các giá trị số tự nhiên n])
        - $n = 7: 7(7 - 3) = 7 times 4 = 28 < 40$.
        - $n = 8: 8(8 - 3) = 8 times 5 = 40$ (bằng $40$, không thỏa mãn $> 40$).
        - $n = 9: 9(9 - 3) = 9 times 6 = 54 > 40$ (thỏa mãn).
        Vậy số đỉnh nhỏ nhất cần tìm là $n = 9$.
    ]
)

] // end make-questions

#make-questions()
