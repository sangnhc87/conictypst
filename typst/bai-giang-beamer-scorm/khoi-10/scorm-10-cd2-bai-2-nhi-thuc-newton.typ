#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Nhị Thức Newton Mở Rộng],
  subtitle: [TOÁN 10 — CHUYÊN ĐỀ HỌC TẬP: CHUYÊN ĐỀ 2],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#4338ca"),
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
// PHẦN I: CÔNG THỨC KHAI TRIỂN NHỊ THỨC NEWTON
// ════════════════════════════════════════════════
#lt-section-link("sec-cong-thuc", "📦", [I. Công Thức Khai Triển Nhị Thức Newton])

#lt-slide-back(title: "📦 Khai triển Nhị thức Newton")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Công thức tổng quát")[
        Với mọi số nguyên dương $n$, ta có khai triển:
        $ (a + b)^n = C_n^0 a^n + C_n^1 a^(n-1) b + ... + C_n^n b^n $
        Hay viết gọn bằng dấu Sigma:
        $ (a + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k $
      ]
      #lt-important(title: "Nhận xét")[
        - Có tất cả *$(n + 1)$* số hạng trong khai triển.
        - Số hạng thứ $k + 1$ là: $T_(k+1) = C_n^k a^(n-k) b^k$.
        - Tổng các số mũ của $a$ và $b$ trong mỗi số hạng luôn bằng $n$.
      ]
    ],
    [
      #block(fill: rgb("#eef2ff"), stroke: 1.5pt + rgb("#4338ca"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#4338ca"), size: 10.5pt)[Tam giác Pascal]\
        #v(0.15em)
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            content((0, 1.2), text(size: 8.5pt, weight: "bold", fill: rgb("4338ca"))[1])
            content((-0.4, 0.8), text(size: 8.5pt)[1])
            content((0.4, 0.8), text(size: 8.5pt)[1])
            content((-0.8, 0.4), text(size: 8.5pt)[1])
            content((0, 0.4), text(size: 8.5pt, weight: "bold", fill: rgb("dc2626"))[2])
            content((0.8, 0.4), text(size: 8.5pt)[1])
            content((-1.2, 0), text(size: 8.5pt)[1])
            content((-0.4, 0), text(size: 8.5pt, weight: "bold", fill: rgb("dc2626"))[3])
            content((0.4, 0), text(size: 8.5pt, weight: "bold", fill: rgb("dc2626"))[3])
            content((1.2, 0), text(size: 8.5pt)[1])
          })
        ]
        #text(size: 8.5pt)[
          - Tính chất đối xứng: $C_n^k = C_n^(n-k)$.
          - Công thức Pascal: $C_(n+1)^k = C_n^k + C_n^(k-1)$.
          - Tổng các hệ số: $C_n^0 + C_n^1 + ... + C_n^n = 2^n$.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: TÌM SỐ HẠNG THEO ĐIỀU KIỆN CHO TRƯỚC
// ════════════════════════════════════════════════
#lt-section-link("sec-tim-so-hang", "🔎", [II. Tìm Số Hạng Theo Điều Kiện])

#lt-slide-back(title: "🔎 Phương pháp tìm số hạng chứa x^m")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Các bước thực hiện")[
        - *Bước 1:* Viết công thức số hạng tổng quát:
          $ T_(k+1) = C_n^k a^(n-k) b^k $
        - *Bước 2:* Tách riêng phần hệ số (số) và phần biến (chứa $x$). Sử dụng các công thức lũy thừa để gom biến $x$ lại thành dạng $x^f(k)$.
        - *Bước 3:* Cho số mũ của $x$ bằng với bậc $m$ cần tìm:
          $ f(k) = m $
        - *Bước 4:* Giải phương trình tìm $k$. (Lưu ý: $k$ phải nguyên và $0 <= k <= n$).
        - *Bước 5:* Thay $k$ trở lại để tìm hệ số hoặc số hạng.
      ]
    ],
    [
      #lt-tip(title: "Một số trường hợp đặc biệt")[
        - Tìm *hệ số tự do* (số hạng không chứa $x$): Cho số mũ của $x$ bằng $0$ ($f(k) = 0$).
        - Tìm số hạng *đứng chính giữa*:
          - Nếu $n$ chẵn: có 1 số hạng chính giữa tại $k = n/2$.
          - Nếu $n$ lẻ: có 2 số hạng chính giữa tại $k = (n-1)/2$ và $k = (n+1)/2$.
        - Mở rộng: Tổng các hệ số $a_0 + a_1 + ... + a_n$ chính là giá trị biểu thức khi cho $x = 1$.
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Nhị Thức Newton])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHUYÊN ĐỀ 2 BÀI 2],
  questions: (
    ( type: "TN", desc: [Số lượng số hạng của khai triển]),
    ( type: "TN", desc: [Công thức số hạng thứ k + 1]),
    ( type: "TN", desc: [Tìm hệ số chứa x^4 trong (x+2)^6]),
    ( type: "TN", desc: [Tìm số hạng không chứa x]),
    ( type: "TN", desc: [Tính chất đối xứng của hệ số]),
    ( type: "DS", desc: [Khai triển (2x - 3)^6]),
    ( type: "DS", desc: [Khai triển (x^2 + 1/x)^9]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(num: 1, [Công thức khai triển nhị thức Newton với số mũ nguyên dương $n$ là:
$ (a + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k $
Số lượng các số hạng trong khai triển của nhị thức $(a + b)^n$ là],
    (
        [$n$],
        [$n + 1$],
        [$2n$],
        [$n - 1$]
    ),
    correct: 2,
    loigiai: [
        Chỉ số $k$ chạy từ $0$ đến $n$, do đó số lượng số hạng trong khai triển nhị thức Newton là $(n - 0 + 1) = n + 1$.
    ]
)

#lt-tn(num: 2, [Trong khai triển nhị thức Newton $(a + b)^n$, số hạng thứ $k + 1$ (kí hiệu là $T_(k+1)$ với $0 <= k <= n$) được xác định bởi công thức nào sau đây?],
    (
        [$T_(k+1) = C_n^(k+1) a^(n-k) b^k$],
        [$T_(k+1) = C_n^k a^k b^(n-k)$],
        [$T_(k+1) = C_n^k a^(n-k) b^k$],
        [$T_(k+1) = C_n^(k-1) a^(n-k) b^k$]
    ),
    correct: 3,
    loigiai: [
        Số hạng thứ nhất ứng với $k = 0$: $T_1 = C_n^0 a^n b^0$.
        Số hạng tổng quát thứ $k + 1$ là $T_(k+1) = C_n^k a^(n-k) b^k$.
    ]
)

#lt-tn(num: 3, [Hệ số của số hạng chứa $x^4$ trong khai triển của nhị thức $(x + 2)^6$ là],
    (
        [$15$],
        [$30$],
        [$60$],
        [$240$]
    ),
    correct: 3,
    loigiai: [
        Số hạng tổng quát:
        $ T_(k+1) = C_6^k x^(6-k) 2^k $
        Số hạng chứa $x^4$ ứng với $6 - k = 4 <=> k = 2$.
        Hệ số cần tìm là:
        $ C_6^2 times 2^2 = 15 times 4 = 60 $
    ]
)

#lt-tn(num: 4, [Số hạng không chứa $x$ trong khai triển nhị thức $(x + 1/x)^8$ (với $x != 0$) là],
    (
        [$70$],
        [$56$],
        [$28$],
        [$1$]
    ),
    correct: 1,
    loigiai: [
        Số hạng tổng quát:
        $ T_(k+1) = C_8^k x^(8-k) (1/x)^k = C_8^k x^(8 - 2k) $
        Không chứa $x$ tương ứng với số mũ $8 - 2k = 0 <=> k = 4$.
        Giá trị số hạng là:
        $ C_8^4 = (8 times 7 times 6 times 5) / (4 times 3 times 2 times 1) = 70 $
    ]
)

#lt-tn(num: 5, [Tính chất đối xứng của các hệ số nhị thức Newton được thể hiện qua đẳng thức tổ hợp nào sau đây?],
    (
        [$C_n^k = C_n^(k-1)$],
        [$C_n^k = C_(n-1)^k$],
        [$C_n^k = -C_n^(n-k)$],
        [$C_n^k = C_n^(n-k)$]
    ),
    correct: 4,
    loigiai: [
        Chọn $k$ phần tử từ $n$ phần tử tương đương với việc bỏ lại $n - k$ phần tử. Do đó các hệ số cách đều hai đầu bằng nhau:
        $ C_n^k = C_n^(n-k) $
    ]
)

#lt-ds(num: 6, [Xét khai triển nhị thức Newton của biểu thức $P(x) = (2x - 3)^6$.],
  (
    [Khai triển có tất cả $7$ số hạng.],
    [Số hạng tổng quát trong khai triển là $T_(k+1) = C_6^k 2^(6-k) (-3)^k x^(6-k)$ với $0 <= k <= 6$.],
    [Hệ số của $x^4$ trong khai triển bằng $2160$.],
    [Hệ số tự do (số hạng không chứa $x$) trong khai triển bằng $-729$.]
  ),
  correct: "1110",
  loigiai: [
    a) Số mũ $n = 6$ nên có $6 + 1 = 7$ số hạng (ĐÚNG).
    b) $T_(k+1) = C_6^k (2x)^(6-k) (-3)^k = C_6^k 2^(6-k) (-3)^k x^(6-k)$ (ĐÚNG).
    c) Tìm hệ số $x^4$ ứng với $6 - k = 4 <=> k = 2$: Hệ số là $C_6^2 2^4 (-3)^2 = 15 times 16 times 9 = 2160$ (ĐÚNG).
    d) Hệ số tự do ứng với $k = 6$: $a_0 = C_6^6 2^0 (-3)^6 = 1 times 1 times (+729) = 729 != -729$ (SAI).
  ]
)

#lt-ds(num: 7, [Xét khai triển nhị thức Newton của biểu thức $Q(x) = (x^2 + 1/x)^9$ với $x != 0$.],
  (
    [Số hạng tổng quát trong khai triển là $T_(k+1) = C_9^k x^(18 - 3k)$ với $0 <= k <= 9$.],
    [Số hạng không chứa $x$ tương ứng với $k = 6$ và có giá trị bằng $84$.],
    [Số hạng chứa $x^6$ trong khai triển tương ứng với $k = 4$ và có hệ số bằng $126$.],
    [Số hạng có bậc cao nhất trong khai triển là $x^(16)$.]
  ),
  correct: "1110",
  loigiai: [
    a) $T_(k+1) = C_9^k (x^2)^(9-k) (1/x)^k = C_9^k x^(18 - 2k - k) = C_9^k x^(18 - 3k)$ (ĐÚNG).
    b) Số hạng không chứa $x$ ứng với $18 - 3k = 0 <=> k = 6$. Hệ số $C_9^6 = C_9^3 = 84$ (ĐÚNG).
    c) Số hạng chứa $x^6$ ứng với $18 - 3k = 6 <=> k = 4$. Hệ số $C_9^4 = 126$ (ĐÚNG).
    d) Bậc cao nhất ứng với $k = 0$: $x^(18)$ chứ không phải $x^(16)$ (SAI).
  ]
)
