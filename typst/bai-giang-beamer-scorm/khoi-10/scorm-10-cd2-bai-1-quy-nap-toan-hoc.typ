#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Phương Pháp Quy Nạp Toán Học],
  subtitle: [TOÁN 10 — CHUYÊN ĐỀ HỌC TẬP: CHUYÊN ĐỀ 2],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#1e40af"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC BÀI HỌC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG BÀI HỌC])

// ════════════════════════════════════════════════
// PHẦN I: NGUYÊN LÝ QUY NẠP TOÁN HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-nguyen-ly", "🎯", [I. Nguyên Lý Quy Nạp Toán Học])

#lt-slide-back(title: "🎯 Phương Pháp Chứng Minh Quy Nạp")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Nguyên lý")[
        Để chứng minh một mệnh đề $P(n)$ đúng với mọi số tự nhiên $n >= p$ ($p$ là số tự nhiên), ta thực hiện 2 bước:
        
        - *Bước 1 (Bước cơ sở):* Kiểm tra mệnh đề $P(n)$ đúng với $n = p$.
        - *Bước 2 (Bước quy nạp):* Giả thiết mệnh đề $P(n)$ đúng với một số tự nhiên bất kỳ $n = k >= p$ (gọi là *giả thiết quy nạp*). Ta phải chứng minh mệnh đề $P(n)$ cũng đúng với số tự nhiên liền sau là $n = k + 1$.
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e40af"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1e40af"), size: 10.5pt)[Hiệu ứng Domino]\
        #v(0.15em)
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
        ]
        #text(size: 8.5pt)[
          Nếu quân cờ đầu tiên bị xô đổ (bước cơ sở), và cứ quân cờ thứ $k$ đổ thì chắc chắn làm đổ quân cờ thứ $k+1$ (bước quy nạp), thì *tất cả các quân cờ đều sẽ đổ*.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: MỘT SỐ BÀI TOÁN THƯỜNG GẶP
// ════════════════════════════════════════════════
#lt-section-link("sec-bai-toan", "📚", [II. Các Đẳng Thức Tính Tổng Kinh Điển])

#lt-slide-back(title: "📚 Các Đẳng Thức Tổng Cần Nhớ")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Tổng n số tự nhiên")[
        Tổng của $n$ số nguyên dương đầu tiên:
        $ 1 + 2 + 3 + ... + n = (n(n + 1)) / 2 $
      ]
      #lt-definition(title: "Tổng bình phương")[
        Tổng bình phương $n$ số nguyên dương đầu tiên:
        $ 1^2 + 2^2 + ... + n^2 = (n(n + 1)(2n + 1)) / 6 $
      ]
    ],
    [
      #lt-definition(title: "Tổng lập phương (Định lý Nicomachus)")[
        Tổng lập phương $n$ số nguyên dương đầu tiên bằng bình phương của tổng bậc nhất:
        $ 1^3 + 2^3 + ... + n^3 = ((n(n + 1)) / 2)^2 $
      ]
      
      #lt-definition(title: "Tổng số lẻ liên tiếp")[
        Tổng $n$ số lẻ liên tiếp đầu tiên luôn bằng bình phương của $n$:
        $ 1 + 3 + 5 + ... + (2n - 1) = n^2 $
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Quy Nạp Toán Học])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHUYÊN ĐỀ 2 BÀI 1],
  questions: (
    ( type: "TN", desc: [Định nghĩa bước quy nạp n = k + 1]),
    ( type: "TN", desc: [Công thức tổng n số tự nhiên liên tiếp]),
    ( type: "TN", desc: [Công thức tổng lập phương (Nicomachus)]),
    ( type: "TN", desc: [Tổng dãy số lẻ liên tiếp 2n-1]),
    ( type: "TN", desc: [Tổng các phân số triệt tiêu (telescoping)]),
    ( type: "DS", desc: [Chứng minh đẳng thức tích hai số]),
    ( type: "DS", desc: [Truy hồi tuyến tính $u_n = 2u_(n-1) - 1$]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(num: 1, [Phương pháp quy nạp toán học dùng để chứng minh một mệnh đề $P(n)$ đúng với mọi số nguyên dương $n >= p$ gồm hai bước: Bước cơ sở và Bước quy nạp. Ở bước quy nạp, ta giả thiết mệnh đề đúng với $n = k >= p$, sau đó cần chứng minh mệnh đề cũng đúng với],
    (
        [$n = 2k$],
        [$n = k + 2$],
        [$n = k + 1$],
        [$n = k - 1$]
    ),
    correct: 3,
    loigiai: [
        Trong bước quy nạp, ta giả sử mệnh đề đúng với $n = k >= p$, sau đó cần chứng minh mệnh đề đúng với số tự nhiên liền kề tiếp theo là $n = k + 1$.
    ]
)

#lt-tn(num: 2, [Công thức tính tổng của $n$ số tự nhiên liên tiếp đầu tiên $S_n = 1 + 2 + 3 + ... + n$ là],
    (
        [$S_n = (n(n - 1)) / 2$],
        [$S_n = (n(n + 1)) / 2$],
        [$S_n = (n(2n + 1)) / 2$],
        [$S_n = n(n + 1)$]
    ),
    correct: 2,
    loigiai: [
        Dãy $1, 2, ..., n$ là một cấp số cộng với số hạng đầu $u_1 = 1$, công sai $d = 1$, số hạng thứ $n$ là $n$:
        $ S_n = (n(1 + n)) / 2 = (n(n + 1)) / 2 $
    ]
)

#lt-tn(num: 3, [Mối liên hệ giữa tổng lập phương $1^3 + 2^3 + ... + n^3$ và tổng bậc nhất $1 + 2 + ... + n$ là],
    (
        [$1^3 + 2^3 + ... + n^3 = (1 + 2 + ... + n)^2$],
        [$1^3 + 2^3 + ... + n^3 = (1 + 2 + ... + n)^3$],
        [$1^3 + 2^3 + ... + n^3 = 2(1 + 2 + ... + n)$],
        [$1^3 + 2^3 + ... + n^3 = 3(1 + 2 + ... + n)^2$]
    ),
    correct: 1,
    loigiai: [
        Theo định lý Nicomachus, tổng lập phương của $n$ số nguyên dương đầu tiên bằng bình phương tổng của $n$ số nguyên dương đầu tiên:
        $ 1^3 + 2^3 + ... + n^3 = ((n(n+1))/2)^2 = (1 + 2 + ... + n)^2 $
    ]
)

#lt-tn(num: 4, [Tổng các số hạng của dãy số lẻ liên tiếp $S_n = 1 + 3 + 5 + ... + (2n - 1)$ có giá trị bằng],
    (
        [$n(n + 1)$],
        [$2n^2$],
        [$n^2 - 1$],
        [$n^2$]
    ),
    correct: 4,
    loigiai: [
        Đây là cấp số cộng có $u_1 = 1, u_n = 2n - 1$, số số hạng là $n$.
        $ S_n = (n(u_1 + u_n)) / 2 = (n(1 + 2n - 1)) / 2 = (n(2n)) / 2 = n^2 $
    ]
)

#lt-tn(num: 5, [Cho tổng các phân số có quy luật:
$ S_n = 1 / (1 times 2) + 1 / (2 times 3) + 1 / (3 times 4) + ... + 1 / (n(n + 1)) $
Giá trị của tổng $S_n$ theo $n$ là],
    (
        [$S_n = 1 / (n + 1)$],
        [$S_n = n / (n + 1)$],
        [$S_n = (n + 1) / n$],
        [$S_n = (n - 1) / (n + 1)$]
    ),
    correct: 2,
    loigiai: [
        Ta có $1 / (k(k+1)) = 1/k - 1/(k+1)$.
        Tổng triệt tiêu từng đôi một (telescoping):
        $ S_n = (1 - 1/2) + (1/2 - 1/3) + ... + (1/n - 1/(n+1)) = 1 - 1/(n+1) = n / (n + 1) $
    ]
)

#lt-ds(num: 6, [Xét mệnh đề chứa biến $P(n)$:
$ 1 times 2 + 2 times 3 + 3 times 4 + ... + n(n + 1) = (n(n + 1)(n + 2)) / 3 $
với $n$ là số nguyên dương ($n in NN^*$).],
  (
    [Với $n = 1$, vế trái bằng $2$ và vế phải bằng $(1 times 2 times 3)/3 = 2$, do đó $P(1)$ đúng.],
    [Giả thiết quy nạp là giả sử đẳng thức đúng với $n = k >= 1$, nghĩa là tổng tới số hạng $k(k+1)$ bằng $(k(k + 1)(k + 2)) / 3$.],
    [Khi xét $n = k + 1$, vế trái được viết thành $(k(k + 1)(k + 2)) / 3 + (k + 1)(k + 2)$.],
    [Giá trị của tổng khi $n = 5$ bằng $80$.]
  ),
  correct: "1110",
  loigiai: [
    a) Với $n = 1$: $V T = 2, V P = 6 / 3 = 2$ (ĐÚNG).
    b) Giả thiết quy nạp là giả sử đẳng thức đúng với $n = k$ (ĐÚNG).
    c) $S_(k+1) = S_k + (k+1)(k+2) = (k(k+1)(k+2))/3 + (k+1)(k+2)$ (ĐÚNG).
    d) Với $n = 5$: $S_5 = (5 times 6 times 7) / 3 = 70 != 80$ (SAI).
  ]
)

#lt-ds(num: 7, [Cho dãy số $(u_n)$ xác định bởi công thức truy hồi:
$ cases(u_1 = 2, u_(n+1) = 2 u_n - 1 quad (n >= 1)) $],
  (
    [Số hạng thứ hai của dãy số là $u_2 = 3$.],
    [Số hạng thứ ba của dãy số là $u_3 = 5$.],
    [Công thức số hạng tổng quát của dãy số là $u_n = 2^(n-1) + 1$ với mọi $n >= 1$.],
    [Số hạng thứ mười của dãy số là $u_(10) = 1025$.]
  ),
  correct: "1110",
  loigiai: [
    a) $u_2 = 2(2) - 1 = 3$ (ĐÚNG).
    b) $u_3 = 2(3) - 1 = 5$ (ĐÚNG).
    c) Bằng quy nạp, dễ dàng chứng minh $u_n = 2^(n-1) + 1$ (ĐÚNG).
    d) $u_(10) = 2^9 + 1 = 512 + 1 = 513 != 1025$ (SAI).
  ]
)
