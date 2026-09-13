#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1e40af") // Classic Blue cho Đề 4A

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: QUY NẠP TOÁN HỌC & NHỊ THỨC NEWTON",
  exam-title: "BÀI 1: PHƯƠNG PHÁP QUY NẠP TOÁN HỌC (ĐỀ A - ĐẲNG THỨC & DÃY SỐ)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "310",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Phương pháp quy nạp toán học dùng để chứng minh một mệnh đề $P(n)$ đúng với mọi số nguyên dương $n >= p$ gồm hai bước:
- *Bước 1 (Bước cơ sở)*: Kiểm tra mệnh đề $P(n)$ đúng với $n = p$.
- *Bước 2 (Bước quy nạp)*: Giả thiết mệnh đề $P(n)$ đúng với một số tự nhiên bất kỳ $n = k >= p$ (gọi là giả thiết quy nạp), chứng minh rằng mệnh đề cũng đúng với
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Minh họa Domino
    rect((-2.5, -0.6), (-1.8, 0.6), fill: rgb("eff6ff"), stroke: 1.2pt + rgb("1e40af"))
    content((-2.15, 0), text(size: 7.5pt, weight: "bold", fill: rgb("1e40af"))[$n=p$])
    line((-1.6, 0), (-0.8, 0), stroke: 1.2pt + rgb("1e40af"), mark: (end: "stealth"))
    content((-1.2, 0.25), text(size: 7pt)[Đổ])

    rect((-0.6, -0.6), (0.3, 0.6), fill: rgb("eff6ff"), stroke: 1.2pt + rgb("1e40af"))
    content((-0.15, 0), text(size: 7.5pt, weight: "bold", fill: rgb("1e40af"))[$n=k$])
    line((0.5, 0), (1.3, 0), stroke: 1.2pt + rgb("dc2626"), mark: (end: "stealth"))
    content((0.9, 0.25), text(size: 7pt, fill: rgb("dc2626"))[Kéo theo])

    rect((1.5, -0.6), (2.6, 0.6), fill: rgb("fef2f2"), stroke: 1.2pt + rgb("dc2626"))
    content((2.05, 0), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[$n=k+1$])
  })
]],
    (
        True([$n = k + 1$]),
        [$n = k + 2$],
        [$n = 2k$],
        [$n = k - 1$]
    ),
    loigiai: [
        #step([Định nghĩa bước quy nạp])
        Trong bước quy nạp, ta giả sử mệnh đề đúng với $n = k >= p$, sau đó cần chứng minh mệnh đề đúng với số tự nhiên kế tiếp là $n = k + 1$.
    ]
)

// TN 2
#tn([Hiệu ứng Domino trong đời sống thường được dùng để giải thích trực quan nguyên lý quy nạp toán học.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Các thanh domino nghiêng
    for i in (0, 1, 2, 3, 4) {
      rotate(-15deg, origin: (i * 0.8, 0))
      rect((i * 0.8 - 0.1, 0), (i * 0.8 + 0.1, 1), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    }
  })
]
Nếu quân cờ domino đầu tiên bị xô đổ, và sự đổ của bất kỳ quân cờ thứ $k$ nào cũng làm đổ quân cờ thứ $k+1$, thì kết luận rút ra là],
    (
        True([Tất cả các quân cờ trong hàng domino đều sẽ bị đổ]),
        [Chỉ có quân cờ đầu tiên và quân cờ thứ hai bị đổ],
        [Chỉ có các quân cờ mang số chẵn bị đổ],
        [Chỉ có các quân cờ mang số lẻ bị đổ]
    ),
    loigiai: [
        #step([Nguyên lý dây chuyền domino])
        Quân 1 đổ làm quân 2 đổ. Quân 2 đổ làm quân 3 đổ,... Cứ như thế bằng hiệu ứng dây chuyền, toàn bộ dãy vô hạn các quân cờ domino đều sẽ đổ.
    ]
)

// TN 3
#tn([Công thức tính tổng của $n$ số tự nhiên liên tiếp đầu tiên $S_n = 1 + 2 + 3 + ... + n$ là],
    (
        True([$S_n = (n(n + 1)) / 2$]),
        [$S_n = n(n + 1)$],
        [$S_n = (n(n - 1)) / 2$],
        [$S_n = (n(2n + 1)) / 2$]
    ),
    loigiai: [
        #step([Công thức tổng cấp số cộng])
        Dãy $1, 2, ..., n$ là một cấp số cộng với số hạng đầu $u_1 = 1$, công sai $d = 1$, số số hạng là $n$:
        $ S_n = (n(1 + n)) / 2 = (n(n + 1)) / 2 $
    ]
)

// TN 4
#tn([Công thức tính tổng bình phương của $n$ số tự nhiên liên tiếp đầu tiên $S_n = 1^2 + 2^2 + 3^2 + ... + n^2$ là],
    (
        True([$S_n = (n(n + 1)(2n + 1)) / 6$]),
        [$S_n = (n(n + 1)(n + 2)) / 6$],
        [$S_n = ((n(n + 1)) / 2)^2$],
        [$S_n = (n(2n + 1)) / 6$]
    ),
    loigiai: [
        #step([Đẳng thức tổng bình phương])
        Theo phương pháp quy nạp toán học:
        $ 1^2 + 2^2 + ... + n^2 = (n(n + 1)(2n + 1)) / 6 $
    ]
)

// TN 5
#tn([Mối liên hệ giữa tổng lập phương $1^3 + 2^3 + ... + n^3$ và tổng bậc nhất $1 + 2 + ... + n$ là],
    (
        True([$1^3 + 2^3 + ... + n^3 = (1 + 2 + ... + n)^2$]),
        [$1^3 + 2^3 + ... + n^3 = (1 + 2 + ... + n)^3$],
        [$1^3 + 2^3 + ... + n^3 = 2(1 + 2 + ... + n)$],
        [$1^3 + 2^3 + ... + n^3 = 3(1 + 2 + ... + n)^2$]
    ),
    loigiai: [
        #step([Định lý Nicomachus])
        Tổng lập phương của $n$ số nguyên dương đầu tiên bằng bình phương tổng của $n$ số nguyên dương đầu tiên:
        $ 1^3 + 2^3 + ... + n^3 = ((n(n+1))/2)^2 = (1 + 2 + ... + n)^2 $
    ]
)

// TN 6
#tn([Cho tổng các phân số có quy luật:
$ S_n = 1 / (1 times 2) + 1 / (2 times 3) + 1 / (3 times 4) + ... + 1 / (n(n + 1)) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("1e40af"))[$1/(k(k+1)) = 1/k - 1/(k+1)$])
  })
]
Giá trị của tổng $S_n$ theo $n$ là],
    (
        True([$S_n = n / (n + 1)$]),
        [$S_n = 1 / (n + 1)$],
        [$S_n = (n + 1) / n$],
        [$S_n = (n - 1) / (n + 1)$]
    ),
    loigiai: [
        #step([Phân tích thành hiệu hai phân số])
        Ta có $1 / (k(k+1)) = 1/k - 1/(k+1)$.
        Tổng triệt tiêu từng đôi một (telescoping):
        $ S_n = (1 - 1/2) + (1/2 - 1/3) + ... + (1/n - 1/(n+1)) = 1 - 1/(n+1) = n / (n + 1) $
    ]
)

// TN 7
#tn([Cho dãy số $(u_n)$ xác định bởi hệ thức truy hồi: $u_1 = 1$ và $u_(n+1) = u_n + 2n + 1$ với mọi $n >= 1$.
Ba số hạng đầu tiên của dãy số là $u_1 = 1, u_2 = 4, u_3 = 9$.
Dự đoán công thức số hạng tổng quát $u_n$ là],
    (
        True([$u_n = n^2$]),
        [$u_n = 2^n - 1$],
        [$u_n = n^2 + 1$],
        [$u_n = 2n - 1$]
    ),
    loigiai: [
        #step([Dự đoán quy luật])
        Ta có: $u_1 = 1 = 1^2$, $u_2 = 4 = 2^2$, $u_3 = 9 = 3^2$, $u_4 = 9 + 2(3) + 1 = 16 = 4^2$.
        Dự đoán $u_n = n^2$.
        Chứng minh bằng quy nạp: Giả sử $u_k = k^2$, thì $u_(k+1) = k^2 + 2k + 1 = (k+1)^2$ (đúng).
    ]
)

// TN 8
#tn([Khi chứng minh mệnh đề $P(n): "2^n > 2n + 1"$ đúng với mọi số tự nhiên $n >= 3$ bằng phương pháp quy nạp toán học, ở bước cơ sở ta cần kiểm tra mệnh đề đúng với giá trị nào của $n$?],
    (
        True([$n = 3$]),
        [$n = 1$],
        [$n = 0$],
        [$n = 2$]
    ),
    loigiai: [
        #step([Xác định bước cơ sở])
        Vì bài toán yêu cầu chứng minh với mọi số tự nhiên $n >= 3$, nên giá trị nhỏ nhất cần kiểm tra ở bước 1 là $n = 3$:
        Với $n = 3$: $2^3 = 8$ và $2(3) + 1 = 7$. Do $8 > 7$ nên mệnh đề đúng với $n = 3$.
    ]
)

// TN 9
#tn([Cho cấp số nhân có số hạng đầu $u_1 = 1$ và công bội $q != 1$. Tổng $n$ số hạng đầu tiên $S_n = 1 + q + q^2 + ... + q^(n-1)$ bằng],
    (
        True([$S_n = (q^n - 1) / (q - 1)$]),
        [$S_n = (q^(n+1) - 1) / (q - 1)$],
        [$S_n = (1 - q^n) / (1 + q)$],
        [$S_n = q^n - 1$]
    ),
    loigiai: [
        #step([Công thức tổng cấp số nhân])
        Tổng $n$ số hạng đầu tiên của cấp số nhân:
        $ S_n = u_1 (q^n - 1) / (q - 1) = (q^n - 1) / (q - 1) $
    ]
)

// TN 10
#tn([Xét tích hữu hạn $P_n = (1 - 1/4)(1 - 1/9)(1 - 1/16)...(1 - 1/n^2)$ với $n >= 2$.
Tính giá trị của $P_2, P_3$:
- $P_2 = 1 - 1/4 = 3/4$.
- $P_3 = (3/4)(1 - 1/9) = (3/4)(8/9) = 2/3 = 4/6$.
Công thức tổng quát của $P_n$ là],
    (
        True([$P_n = (n + 1) / (2n)$]),
        [$P_n = n / (2n + 1)$],
        [$P_n = (n - 1) / (2n)$],
        [$P_n = (n + 1) / n$]
    ),
    loigiai: [
        #step([Phân tích thừa số])
        Mỗi thừa số có dạng:
        $ 1 - 1/k^2 = (k^2 - 1) / k^2 = ((k - 1)(k + 1)) / (k times k) $
        Nhân liên tiếp từ $k = 2$ đến $n$:
        $ P_n = (1 times 3) / (2 times 2) times (2 times 4) / (3 times 3) times ... times ((n - 1)(n + 1)) / (n times n) = (1 / 2) times ((n + 1) / n) = (n + 1) / (2n) $
    ]
)

// TN 11
#tn([Một học sinh chứng minh khẳng định: "Mọi con ngựa đều có cùng một màu lông" bằng phương pháp quy nạp toán học. Sai lầm chết người trong lập luận ngụy biện nổi tiếng này xảy ra ở bước nào?],
    (
        True([Bước chuyển quy nạp từ $k = 1$ lên $k = 2$ (hai tập hợp không giao nhau)]),
        [Bước cơ sở với $n = 1$ không đúng],
        [Mọi con ngựa đều thực sự cùng màu lông],
        [Toán học không thể áp dụng cho sinh học]
    ),
    loigiai: [
        #step([Phân tích nghịch lý đàn ngựa Pólya])
        - Với $n = 1$: một con ngựa hiển nhiên cùng màu với chính nó (bước cơ sở đúng).
        - Tuy nhiên, bước chuyển từ $k$ lên $k+1$ đòi hỏi hai tập con $k$ phần tử phải có phần tử chung (giao nhau khác rỗng).
        - Khi $k = 1$, xét tập 2 con ngựa $\{A, B\}$: tập $\{A\}$ và tập $\{B\}$ rời nhau, không có con ngựa nào ở giữa làm trung gian! Do đó bước chuyển từ $k=1$ lên $k=2$ bị sụp đổ hoàn toàn.
    ]
)

// TN 12
#tn([Tổng các số hạng của dãy số lẻ liên tiếp $S_n = 1 + 3 + 5 + ... + (2n - 1)$ có giá trị bằng],
    (
        True([$n^2$]),
        [$n(n + 1)$],
        [$2n^2$],
        [$n^2 - 1$]
    ),
    loigiai: [
        #step([Tính tổng n số lẻ đầu tiên])
        Đây là cấp số cộng có $u_1 = 1, u_n = 2n - 1$, số số hạng là $n$:
        $ S_n = (n(u_1 + u_n)) / 2 = (n(1 + 2n - 1)) / 2 = (n(2n)) / 2 = n^2 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Xét mệnh đề chứa biến $P(n)$:
$ 1 times 2 + 2 times 3 + 3 times 4 + ... + n(n + 1) = (n(n + 1)(n + 2)) / 3 $
với $n$ là số nguyên dương ($n in NN^*$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.5), (2.5, 0.5), fill: rgb("eff6ff"), stroke: 1.2pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("1e40af"))[Chứng minh quy nạp đẳng thức tổng tích hai số liên tiếp])
  })
]],
  (
    True([Với $n = 1$, vế trái bằng $2$ và vế phải bằng $(1 times 2 times 3)/3 = 2$, do đó $P(1)$ đúng.]),
    True([Giả thiết quy nạp là giả sử đẳng thức đúng với $n = k >= 1$, nghĩa là $1 times 2 + ... + k(k + 1) = (k(k + 1)(k + 2)) / 3$.]),
    True([Khi xét $n = k + 1$, vế trái được viết thành $(k(k + 1)(k + 2)) / 3 + (k + 1)(k + 2)$.]),
    [Giá trị của tổng khi $n = 5$ bằng $80$.]
  ),
  loigiai: [
    #step([Kiểm tra bước cơ sở])
    Với $n = 1$:
    $ V T = 1 times 2 = 2 $
    $ V P = (1(1 + 1)(1 + 2)) / 3 = (1 times 2 times 3) / 3 = 2 $
    Vậy $P(1)$ đúng (Ý a ĐÚNG).
    #step([Giả thiết quy nạp])
    Giả sử đẳng thức đúng với $n = k >= 1$:
    $ S_k = 1 times 2 + 2 times 3 + ... + k(k + 1) = (k(k + 1)(k + 2)) / 3 $ (Ý b ĐÚNG).
    #step([Xét với n = k + 1])
    $ S_(k+1) = S_k + (k + 1)(k + 2) = (k(k + 1)(k + 2)) / 3 + (k + 1)(k + 2) $ (Ý c ĐÚNG).
    Đặt nhân tử chung $(k + 1)(k + 2)$:
    $ S_(k+1) = (k + 1)(k + 2) (k/3 + 1) = ((k + 1)(k + 2)(k + 3)) / 3 $
    #step([Tính giá trị tại n = 5])
    $ S_5 = (5(5 + 1)(5 + 2)) / 3 = (5 times 6 times 7) / 3 = 5 times 2 times 7 = 70 != 80 $
    Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Cho dãy số $(u_n)$ xác định bởi công thức truy hồi:
$ cases(u_1 = 2, u_(n+1) = 2 u_n - 1 quad (n >= 1)) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.5), (2.5, 0.5), fill: rgb("eff6ff"), stroke: 1.2pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("1e40af"))[Dãy số truy hồi tuyến tính bậc nhất $u_(n+1) = a u_n + b$])
  })
]],
  (
    True([Số hạng thứ hai của dãy số là $u_2 = 3$.]),
    True([Số hạng thứ ba của dãy số là $u_3 = 5$.]),
    True([Công thức số hạng tổng quát của dãy số là $u_n = 2^(n-1) + 1$ với mọi $n >= 1$.]),
    [Số hạng thứ mười của dãy số là $u_(10) = 1025$.]
  ),
  loigiai: [
    #step([Tính vài số hạng đầu])
    - $u_1 = 2$.
    - $u_2 = 2 u_1 - 1 = 2(2) - 1 = 3$ (Ý a ĐÚNG).
    - $u_3 = 2 u_2 - 1 = 2(3) - 1 = 5$ (Ý b ĐÚNG).
    - $u_4 = 2(5) - 1 = 9$.
    #step([Chứng minh công thức số hạng tổng quát bằng quy nạp])
    Ta thấy $u_1 = 2^0 + 1$, $u_2 = 2^1 + 1$, $u_3 = 2^2 + 1$, $u_4 = 2^3 + 1$.
    Dự đoán: $u_n = 2^(n-1) + 1$.
    - Với $n = 1$: $u_1 = 2^0 + 1 = 2$ (đúng).
    - Giả sử đúng với $n = k$: $u_k = 2^(k-1) + 1$.
    - Khi đó $u_(k+1) = 2 u_k - 1 = 2(2^(k-1) + 1) - 1 = 2^k + 2 - 1 = 2^k + 1 = 2^((k+1)-1) + 1$ (đúng).
    Vậy $u_n = 2^(n-1) + 1$ với mọi $n >= 1$ (Ý c ĐÚNG).
    #step([Tính u_10])
    $ u_(10) = 2^(10 - 1) + 1 = 2^9 + 1 = 512 + 1 = 513 != 1025 $
    Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Cho hình vuông có kích thước $n times n$ được chia thành $n^2$ ô vuông đơn vị. Hình học hóa việc tính tổng các số lẻ liên tiếp $1 + 3 + 5 + ... + (2n - 1) = n^2$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Lớp 1 (1 ô)
    rect((0, 0), (0.6, 0.6), fill: rgb("dbeafe"), stroke: 1pt + rgb("1e40af"))
    content((0.3, 0.3), text(size: 6pt)[$1$])
    // Lớp 2 (3 ô)
    rect((0.6, 0), (1.2, 0.6), fill: rgb("bfdbfe"), stroke: 1pt + rgb("1e40af"))
    rect((0.6, 0.6), (1.2, 1.2), fill: rgb("bfdbfe"), stroke: 1pt + rgb("1e40af"))
    rect((0, 0.6), (0.6, 1.2), fill: rgb("bfdbfe"), stroke: 1pt + rgb("1e40af"))
    content((0.9, 0.9), text(size: 6pt)[$3$])
    // Lớp 3 (5 ô)
    rect((1.2, 0), (1.8, 1.8), fill: rgb("93c5fd"), stroke: 1pt + rgb("1e40af"))
    rect((0, 1.2), (1.2, 1.8), fill: rgb("93c5fd"), stroke: 1pt + rgb("1e40af"))
    content((1.5, 1.5), text(size: 6pt)[$5$])
  })
]],
  (
    True([Khi tăng kích thước hình vuông từ $k times k$ lên $(k + 1) times (k + 1)$, số ô vuông đơn vị thêm vào là $2k + 1$.]),
    True([Hiệu diện tích $((k + 1)^2 - k^2)$ luôn bằng số lẻ thứ $k + 1$.]),
    True([Tổng $10$ số lẻ liên tiếp đầu tiên bằng $100$.]),
    [Tổng $n$ số lẻ đầu tiên có thể là một số nguyên tố khi $n >= 2$.]
  ),
  loigiai: [
    #step([Ý nghĩa hình học của mở rộng hình vuông])
    Hình vuông $(k + 1) times (k + 1)$ có diện tích $(k + 1)^2$.
    Hình vuông $k times k$ có diện tích $k^2$.
    Số ô vuông tăng thêm:
    $ (k + 1)^2 - k^2 = k^2 + 2k + 1 - k^2 = 2k + 1 $ (Ý a ĐÚNG, Ý b ĐÚNG).
    #step([Tính tổng 10 số lẻ đầu tiên])
    $ S_(10) = 10^2 = 100 $ (Ý c ĐÚNG).
    #step([Xét tính nguyên tố])
    Vì $S_n = n^2 = n times n$, với $n >= 2$ thì $n^2$ luôn là hợp số (chia hết cho $1, n, n^2$), không bao giờ là số nguyên tố.
    Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Xét tích $n$ thừa số:
$ P_n = (1 + 1/1)(1 + 1/2)(1 + 1/3)...(1 + 1/n) quad (n in NN^*) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.4), (2, 0.4), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("1e40af"))[$1 + 1/k = (k + 1)/k$])
  })
]],
  (
    True([Giá trị của tích với $n = 1$ là $P_1 = 2$.]),
    True([Giá trị của tích với $n = 2$ là $P_2 = 3$.]),
    True([Công thức tổng quát của tích là $P_n = n + 1$ với mọi $n in NN^*$.]),
    [Giá trị của tích $P_(100)$ bằng $100$.]
  ),
  loigiai: [
    #step([Rút gọn các thừa số])
    Ta có $1 + 1/k = (k + 1) / k$.
    - $P_1 = 1 + 1/1 = 2$ (Ý a ĐÚNG).
    - $P_2 = (1 + 1/1)(1 + 1/2) = 2 times 3/2 = 3$ (Ý b ĐÚNG).
    - $P_3 = 3 times (1 + 1/3) = 3 times 4/3 = 4$.
    #step([Quy nạp toán học])
    Dự đoán $P_n = n + 1$.
    Giả sử đúng với $n = k$: $P_k = k + 1$.
    Khi đó:
    $ P_(k+1) = P_k times (1 + 1/(k+1)) = (k + 1) times ((k + 2) / (k + 1)) = k + 2 = (k + 1) + 1 $
    Vậy $P_n = n + 1$ với mọi $n in NN^*$ (Ý c ĐÚNG).
    #step([Tính P_100])
    $ P_(100) = 100 + 1 = 101 != 100 $
    Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1 (Câu 17)
#tln([Tính tổng của $100$ số nguyên dương đầu tiên:
$ S = 1 + 2 + 3 + ... + 100 $],
    [5050],
    loigiai: [
        #step([Áp dụng công thức tổng cấp số cộng])
        $ S = (100(100 + 1)) / 2 = (100 times 101) / 2 = 50 times 101 = 5050 $
    ]
)

// TLN 2 (Câu 18)
#tln([Tính tổng bình phương của $10$ số nguyên dương đầu tiên:
$ S = 1^2 + 2^2 + 3^2 + ... + 10^2 $],
    [385],
    loigiai: [
        #step([Áp dụng công thức tổng bình phương])
        $ S = (n(n + 1)(2n + 1)) / 6 $
        Với $n = 10$:
        $ S = (10(11)(2 times 10 + 1)) / 6 = (10 times 11 times 21) / 6 = (2310) / 6 = 385 $
    ]
)

// TLN 3 (Câu 19)
#tln([Cho dãy số $(u_n)$ xác định bởi $u_1 = 2$ và $u_(n+1) = u_n + 3$ với mọi $n >= 1$.
Giá trị của số hạng thứ $50$ ($u_(50)$) bằng bao nhiêu?],
    [149],
    loigiai: [
        #step([Xác định số hạng tổng quát])
        Dãy số $(u_n)$ là cấp số cộng có số hạng đầu $u_1 = 2$, công sai $d = 3$.
        Số hạng tổng quát:
        $ u_n = u_1 + (n - 1)d = 2 + 3(n - 1) = 3n - 1 $
        #step([Tính u_50])
        $ u_(50) = 3(50) - 1 = 150 - 1 = 149 $
    ]
)

// TLN 4 (Câu 20)
#tln([Tính giá trị của tổng gồm $99$ số hạng:
$ S = 1 / (1 times 2) + 1 / (2 times 3) + 1 / (3 times 4) + ... + 1 / (99 times 100) $
Biết giá trị của tổng viết dưới dạng phân số tối giản là $a / b$ ($a, b in NN^*$). Tính tổng $a + b$.],
    [199],
    loigiai: [
        #step([Rút gọn tổng telescoping])
        Áp dụng công thức $S_n = n / (n + 1)$:
        Với $n = 99$:
        $ S = 99 / (99 + 1) = 99 / 100 $
        Phân số $99/100$ đã tối giản vì $"ƯCLN"(99, 100) = 1$.
        Suy ra $a = 99, b = 100$.
        Tổng $a + b = 99 + 100 = 199$.
    ]
)

// TLN 5 (Câu 21)
#tln([Cho dãy số $(u_n)$ có số hạng đầu $u_1 = 1$ và $u_n = u_(n-1) + 2n - 1$ với mọi $n >= 2$.
Biết rằng $u_n = 400$, tìm giá trị của chỉ số $n$.],
    [20],
    loigiai: [
        #step([Tìm công thức số hạng tổng quát])
        Ta có:
        $ u_1 = 1 $
        $ u_2 = u_1 + 3 = 1 + 3 = 4 = 2^2 $
        $ u_3 = u_2 + 5 = 1 + 3 + 5 = 9 = 3^2 $
        Tổng quát: $u_n = 1 + 3 + 5 + ... + (2n - 1) = n^2$.
        #step([Giải phương trình tìm n])
        Theo đề bài:
        $ u_n = 400 <=> n^2 = 400 <=> n = 20 $ (vì $n in NN^*$).
    ]
)

// TLN 6 (Câu 22)
#tln([Tính tổng lập phương của $8$ số nguyên dương đầu tiên:
$ S = 1^3 + 2^3 + 3^3 + ... + 8^3 $],
    [1296],
    loigiai: [
        #step([Áp dụng công thức Nicomachus])
        $ S = (1 + 2 + ... + 8)^2 = ((8 times 9) / 2)^2 = 36^2 = 1296 $
    ]
)

] // end make-questions

#make-questions()
