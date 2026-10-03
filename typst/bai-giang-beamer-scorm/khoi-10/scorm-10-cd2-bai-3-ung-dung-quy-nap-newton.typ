#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Ứng Dụng Quy Nạp & Nhị Thức Newton],
  subtitle: [TOÁN 10 — CHUYÊN ĐỀ HỌC TẬP: CHUYÊN ĐỀ 2],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#0284c7"),
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
// PHẦN I: ỨNG DỤNG QUY NẠP TRONG THỰC TIỄN
// ════════════════════════════════════════════════
#lt-section-link("sec-quy-nap", "🗼", [I. Ứng Dụng Quy Nạp (Tháp Hà Nội & Phân Chia Mặt Phẳng)])

#lt-slide-back(title: "🗼 Bài toán Tháp Hà Nội & Phân chia mặt phẳng")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Tháp Hà Nội")[
        Di chuyển $n$ đĩa với luật không đặt đĩa lớn lên đĩa nhỏ:
        - Hệ thức truy hồi: $H_n = 2 H_(n-1) + 1$
        - Công thức tổng quát: $H_n = 2^n - 1$ bước chuyển.
      ]
      #lt-definition(title: "Phân chia mặt phẳng (Cắt pizza)")[
        Số miếng bánh tối đa $P_n$ sau $n$ nhát cắt thẳng:
        - Hệ thức: $P_n = P_(n-1) + n$
        - Công thức: $P_n = (n(n + 1))/2 + 1$
      ]
    ],
    [
      #block(fill: rgb("#f0fdfa"), stroke: 1.5pt + rgb("#0284c7"), inset: 9pt, radius: 7pt)[
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            line((-2.5, 0), (2.5, 0), stroke: 2pt + rgb("0284c7"))
            line((-1.6, 0), (-1.6, 1.5), stroke: 1.5pt + rgb("0284c7"))
            line((0, 0), (0, 1.5), stroke: 1.5pt + rgb("0284c7"))
            line((1.6, 0), (1.6, 1.5), stroke: 1.5pt + rgb("0284c7"))
            rect((-2.2, 0.05), (-1.0, 0.3), fill: rgb("e0f2fe"), stroke: 1pt + rgb("0284c7"))
            rect((-2.0, 0.3), (-1.2, 0.55), fill: rgb("bae6fd"), stroke: 1pt + rgb("0284c7"))
            rect((-1.8, 0.55), (-1.4, 0.8), fill: rgb("7dd3fc"), stroke: 1pt + rgb("0284c7"))
          })
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: ỨNG DỤNG NHỊ THỨC NEWTON TRONG XÁC SUẤT
// ════════════════════════════════════════════════
#lt-section-link("sec-newton", "🎲", [II. Ứng Dụng Nhị Thức Newton (Công thức Bernoulli)])

#lt-slide-back(title: "🎲 Xác suất Bernoulli")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Phép thử Bernoulli")[
        Phép thử có $2$ kết cục: Thành công (xác suất $p$) và Thất bại (xác suất $q = 1 - p$).
      ]
      #lt-definition(title: "Công thức Bernoulli")[
        Thực hiện $n$ phép thử Bernoulli độc lập. Xác suất có đúng $k$ lần thành công ($0 <= k <= n$):
        $ P_n(k) = C_n^k p^k q^(n-k) $
        Mối liên hệ Nhị thức Newton:
        $ sum_(k=0)^n P_n(k) = sum_(k=0)^n C_n^k p^k q^(n-k) = (p+q)^n = 1 $
      ]
    ],
    [
      #lt-important(title: "Số lần thành công có khả năng nhất")[
        Gọi $k_0$ là số lần thành công có xác suất cao nhất. $k_0$ là số nguyên thỏa mãn:
        $ n p - q <= k_0 <= n p + p $
        (Hay $ (n+1)p - 1 <= k_0 <= (n+1)p $)
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Ứng dụng quy nạp & Newton])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHUYÊN ĐỀ 2 BÀI 3],
  questions: (
    ( type: "TN", desc: [Hệ thức truy hồi Tháp Hà Nội]),
    ( type: "TN", desc: [Công thức Tháp Hà Nội]),
    ( type: "TN", desc: [Bài toán cắt bánh pizza]),
    ( type: "TN", desc: [Công thức Bernoulli]),
    ( type: "TN", desc: [Bài toán bắn súng]),
    ( type: "DS", desc: [Ném bóng rổ]),
    ( type: "DS", desc: [Xét nghiệm y khoa]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(num: 1, [Gọi $H_n$ là số bước chuyển tối thiểu để di chuyển toàn bộ $n$ chiếc đĩa từ cọc $A$ sang cọc $C$ trong bài toán Tháp Hà Nội. Hệ thức truy hồi liên hệ giữa $H_n$ và $H_(n-1)$ là],
    (
        [$H_n = 3 H_(n-1) + 1$],
        [$H_n = 2 H_(n-1) + 1$],
        [$H_n = H_(n-1) + 2$],
        [$H_n = 2 H_(n-1)$]
    ),
    correct: 2,
    loigiai: [
        Thuật toán chuyển đĩa:
        - Chuyển $n - 1$ đĩa sang cọc trung gian (mất $H_(n-1)$ bước).
        - Chuyển $1$ đĩa lớn nhất sang cọc đích (mất $1$ bước).
        - Chuyển $n - 1$ đĩa từ cọc trung gian sang cọc đích (mất $H_(n-1)$ bước).
        Tổng số bước: $H_n = 2 H_(n-1) + 1$.
    ]
)

#lt-tn(num: 2, [Công thức tổng quát tính số bước chuyển tối thiểu $H_n$ để giải bài toán Tháp Hà Nội với $n$ đĩa là],
    (
        [$H_n = 2^n - 1$],
        [$H_n = 2^n$],
        [$H_n = 2^(n-1)$],
        [$H_n = n^2 - 1$]
    ),
    correct: 1,
    loigiai: [
        Bằng quy nạp toán học, ta dễ dàng chứng minh được $H_n = 2^n - 1$ thỏa mãn $H_1 = 1$ và $H_(k+1) = 2(2^k - 1) + 1 = 2^(k+1) - 1$.
    ]
)

#lt-tn(num: 3, [Bài toán cắt bánh pizza: Số miếng bánh tối đa $P_n$ có thể nhận được từ một chiếc bánh tròn sau $n$ nhát cắt thẳng là],
    (
        [$P_n = (n(n - 1)) / 2 + 1$],
        [$P_n = 2^n$],
        [$P_n = (n(n + 1)) / 2 + 1$],
        [$P_n = 2n$]
    ),
    correct: 3,
    loigiai: [
        Hệ thức truy hồi là $P_n = P_(n-1) + n$. Từ đó suy ra công thức tổng quát là $P_n = (n(n + 1)) / 2 + 1$.
    ]
)

#lt-tn(num: 4, [Một phép thử Bernoulli được thực hiện $n$ lần độc lập, xác suất thành công của mỗi lần là $p$ ($0 < p < 1$), đặt $q = 1 - p$. Xác suất để có đúng $k$ lần thành công ($0 <= k <= n$) được xác định bởi công thức nào sau đây?],
    (
        [$P_n (k) = A_n^k p^k q^(n - k)$],
        [$P_n (k) = C_n^k p^(n - k) q^k$],
        [$P_n (k) = p^k q^(n - k)$],
        [$P_n (k) = C_n^k p^k q^(n - k)$]
    ),
    correct: 4,
    loigiai: [
        Theo lý thuyết xác suất và khai triển nhị thức Newton, xác suất có đúng $k$ lần thành công là $P_n (k) = C_n^k p^k q^(n - k)$.
    ]
)

#lt-tn(num: 5, [Một xạ thủ bắn $4$ phát đạn độc lập với xác suất trúng mỗi phát là $0.7$. Xác suất để xạ thủ không trúng phát nào là],
    (
        [$0.0243$],
        [$0.0081$],
        [$0.0016$],
        [$0.2401$]
    ),
    correct: 2,
    loigiai: [
        Xác suất trượt mỗi phát là $q = 1 - 0.7 = 0.3$.
        Xác suất không trúng phát nào ($k=0$) là:
        $ P_4 (0) = C_4^0 (0.7)^0 (0.3)^4 = 1 times 1 times 0.0081 = 0.0081 $
    ]
)

#lt-ds(num: 6, [Một người ném bóng rổ $6$ lần vào rổ một cách độc lập. Xác suất ném trúng mỗi lần là $p = 0.5$.],
  (
    [Số kết quả có thể xảy ra của $6$ lần ném là $2^6 = 64$.],
    [Xác suất để ném trúng đúng $3$ lần là $5 / 16$.],
    [Xác suất ném trúng số lần chẵn ($0, 2, 4, 6$ lần) bằng xác suất ném trúng số lần lẻ ($1, 3, 5$ lần).],
    [Xác suất để ném trúng ít nhất $5$ lần là $7 / 64$.]
  ),
  correct: "1111",
  loigiai: [
    a) Mỗi lần có 2 khả năng (trúng/trượt) nên 6 lần có $2^6 = 64$ kết quả (ĐÚNG).
    b) $P_6 (3) = C_6^3 (1/2)^3 (1/2)^3 = 20/64 = 5/16$ (ĐÚNG).
    c) $sum_(k "chẵn") C_6^k = sum_(k "lẻ") C_6^k = 32$, do đó 2 xác suất đều bằng $1/2$ (ĐÚNG).
    d) $P_6 (5) + P_6 (6) = (C_6^5 + C_6^6) / 64 = 7 / 64$ (ĐÚNG).
  ]
)

#lt-ds(num: 7, [Một xét nghiệm y khoa phát hiện một loại virus có độ chính xác $90%$ (tức xác suất đúng là $p = 0.9$, xác suất sai là $q = 0.1$). Tiến hành xét nghiệm độc lập $3$ lần trên mẫu bệnh phẩm của một bệnh nhân nhiễm virus.],
  (
    [Xác suất để cả $3$ lần xét nghiệm đều dương tính là $0.729$.],
    [Xác suất để có ít nhất một lần âm tính giả là $0.271$.],
    [Xác suất để có đúng $2$ lần dương tính là $0.243$.],
    [Quy tắc y khoa kết luận người này nhiễm virus nếu có ít nhất $2$ trong $3$ lần dương tính. Xác suất kết luận đúng của quy trình này là $0.950$.]
  ),
  correct: "1110",
  loigiai: [
    a) $P_3(3) = C_3^3 (0.9)^3 = 0.729$ (ĐÚNG).
    b) Ít nhất một lần âm tính là phần bù của cả 3 lần dương tính: $1 - 0.729 = 0.271$ (ĐÚNG).
    c) $P_3(2) = C_3^2 (0.9)^2 (0.1)^1 = 0.243$ (ĐÚNG).
    d) Ít nhất 2 lần dương tính là $P_3(2) + P_3(3) = 0.243 + 0.729 = 0.972 != 0.950$ (SAI).
  ]
)
