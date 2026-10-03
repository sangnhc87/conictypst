#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Nhị Thức Newton],
  subtitle: [TOÁN 10 — CHƯƠNG VIII: CÔNG THỨC KHAI TRIỂN BẬC 4, BẬC 5 & TAM GIÁC PASCAL],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
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
// PHẦN I: KHAI TRIỂN NHỊ THỨC NEWTON BẬC 4 & BẬC 5
// ════════════════════════════════════════════════
#lt-section-link("sec-khai-trien", "📐", [I. Khai Triển Nhị Thức Newton Bậc 4 & Bậc 5])

#lt-slide-back(title: "📜 Từ Chu Thế Kiệt, Pascal Đến Sir Isaac Newton")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Lịch sử nhị thức Newton")[
        - Năm 1303, nhà toán học Trung Hoa *Chu Thế Kiệt* ghi chép bảng hệ số tam giác trong cuốn sách *“Tứ nguyên ngọc giám”*.
        - Năm 1654, *Blaise Pascal* công bố chuyên luận hệ thống hóa tam giác số mang tên ông.
        - Năm 1665, *Sir Isaac Newton* mở rộng công thức cho số mũ tùy ý, mở ra kỷ nguyên Giải tích toán học hiện đại!
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10pt)[💡 Quy Luật Số Mũ Trong Khai Triển]\
        #v(0.1em)
        #text(size: 8.5pt)[
          - Khai triển $(a + b)^n$ luôn có đúng $n + 1$ số hạng.
          - Số mũ của $a$ giảm dần từ $n$ về $0$.
          - Số mũ của $b$ tăng dần từ $0$ lên $n$.
          - Tổng số mũ của $a$ và $b$ trong mỗi số hạng luôn bằng $n$!
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Công Thức Khai Triển Bậc 4 & Bậc 5")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "1. Khai triển bậc 4 (n = 4)")[
        $ (a + b)^4 = C_4^0 a^4 + C_4^1 a^3 b + C_4^2 a^2 b^2 + C_4^3 a b^3 + C_4^4 b^4 $
        $ = a^4 + 4 a^3 b + 6 a^2 b^2 + 4 a b^3 + b^4 $
        - Hệ số nhị thức: $1 quad 4 quad 6 quad 4 quad 1$.
      ]
    ],
    [
      #lt-theorem(title: "2. Khai triển bậc 5 (n = 5)")[
        $ (a + b)^5 = a^5 + 5 a^4 b + 10 a^3 b^2 + 10 a^2 b^3 + 5 a b^4 + b^5 $
        - Hệ số nhị thức: $1 quad 5 quad 10 quad 10 quad 5 quad 1$.
      ]
    ]
  )
  #v(0.2em)
  #lt-important(title: "Trường hợp dấu trừ: (a - b)^n")[
    Thay $b$ bởi $(-b)$, các dấu sẽ đan xen nhau: số hạng chứa lũy thừa lẻ của $b$ mang dấu trừ!
  ]
]

#lt-slide-back(title: "🔺 Tam Giác Pascal & Tính Đối Xứng Tuyệt Mỹ")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
      #text(weight: "bold", fill: rgb("#1e3a8a"), size: 10.5pt)[Kim Tự Tháp Hệ Số Tam Giác Pascal]\
      #v(0.3em)
      #grid(
        columns: (1fr),
        row-gutter: 5pt,
        [#text(size: 9pt, weight: "bold", fill: rgb("#64748b"))[Dòng 0 ($n = 0$):] #h(1em) #text(size: 10pt, fill: rgb("#2563eb"))[$1$]],
        [#text(size: 9pt, weight: "bold", fill: rgb("#64748b"))[Dòng 1 ($n = 1$):] #h(1em) #text(size: 10pt, fill: rgb("#2563eb"))[$1 quad 1$]],
        [#text(size: 9pt, weight: "bold", fill: rgb("#64748b"))[Dòng 2 ($n = 2$):] #h(1em) #text(size: 10pt, fill: rgb("#2563eb"))[$1 quad 2 quad 1$]],
        [#text(size: 9pt, weight: "bold", fill: rgb("#64748b"))[Dòng 3 ($n = 3$):] #h(1em) #text(size: 10pt, fill: rgb("#2563eb"))[$1 quad 3 quad 3 quad 1$]],
        [#text(size: 9pt, weight: "bold", fill: rgb("#64748b"))[Dòng 4 ($n = 4$):] #h(1em) #text(size: 10.5pt, weight: "bold", fill: rgb("#059669"))[$1 quad 4 quad 6 quad 4 quad 1$]],
        [#text(size: 9pt, weight: "bold", fill: rgb("#64748b"))[Dòng 5 ($n = 5$):] #h(1em) #text(size: 10.5pt, weight: "bold", fill: rgb("#d81b60"))[$1 quad 5 quad 10 quad 10 quad 5 quad 1$]],
      )
      #v(0.2em)
      #text(size: 8.5pt, fill: rgb("#475569"), style: "italic")[
        Quy tắc Pascal: Mỗi số bên trong bằng tổng của hai số nằm ngay phía trên nó: $C_n^k = C_(n-1)^(k-1) + C_(n-1)^k$.
      ]
    ]
  ]
]

// ════════════════════════════════════════════════
// PHẦN II: KỸ THUẬT TÌM HỆ SỐ & ỨNG DỤNG THỰC TẾ
// ════════════════════════════════════════════════
#lt-section-link("sec-he-so-ung-dung", "💡", [II. Kỹ Thuật Tìm Hệ Số & Ứng Dụng])

#lt-slide-back(title: "💡 Kỹ Thuật Tìm Hệ Số & Tính Tổng")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-theorem(title: "1. Tìm hệ số của x^k")[
        - Viết số hạng tổng quát của khai triển:
        $ T_(k+1) = C_n^k a^(n - k) b^k $
        - Nhóm các phần hệ số và phần lũy thừa của $x$.
        - Đồng nhất số mũ của $x$ với số mũ $k$ cần tìm.
        - Số hạng không chứa $x$ tương ứng số mũ bằng $0$.
      ]
    ],
    [
      #lt-theorem(title: "2. Tính tổng tất cả các hệ số")[
        Cho đa thức $P(x) = (A x + B)^n = a_n x^n + dots + a_0$:
        - *Tổng tất cả các hệ số:* Thay $x = 1$:
        $ S = a_n + a_(n-1) + dots + a_0 = P(1) $
        - *Tổng đan dấu:* Thay $x = -1$:
        $ a_0 - a_1 + a_2 - dots = P(-1) $
      ]
    ]
  )
]

#lt-slide-back(title: "📈 Ước Lượng Giá Trị Gần Đúng & Lãi Suất Ngân Hàng")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10pt)[1. Tính gần đúng trong khoa học]\
        #v(0.1em)
        #text(size: 8.5pt)[
          - Khi $|alpha| << 1$, các lũy thừa $alpha^3, alpha^4$ rất nhỏ có thể bỏ qua:
          $ (1 + alpha)^n approx 1 + n alpha + (n(n - 1))/2 alpha^2 $
          - Ví dụ: $1.01^4 = (1 + 0.01)^4 approx 1 + 4(0.01) + 6(0.0001) = 1.0406$.
          - Máy tính dùng xấp xỉ này để tính siêu tốc!
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#10b981"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#047857"), size: 10pt)[2. Mô hình lãi suất kép ngân hàng]\
        #v(0.1em)
        #text(size: 8.5pt)[
          - Gửi vốn $P$ với lãi suất $r$/năm sau $n$ năm:
          $ A_n = P(1 + r)^n $
          - Khai triển nhị thức Newton giúp phân tích thành phần vốn gốc, lãi đơn và lãi sinh ra từ lãi (lãi kép)!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM & ỨNG DỤNG
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Hệ Thống Bài Tập Tuyển Chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VIII BÀI 3],
  questions: (
    (num: 1, type: "TN", desc: [Hệ số chứa x^3 trong (1 + 2x)^4]),
    (num: 2, type: "TN", desc: [Hệ số chứa x^2 trong (x - 2)^5]),
    (num: 3, type: "TN", desc: [Tổng tất cả hệ số (2x - 1)^5]),
    (num: 4, type: "TN", desc: [Số hạng không chứa x]),
    (num: 5, type: "TN", desc: [Tìm tham số a trong (x + a)^5]),
    (num: 6, type: "TN", desc: [Ước lượng gần đúng 1.01^4]),
    (num: 7, type: "DS", desc: [Đúng/Sai khai triển (1 + 2x)^5]),
    (num: 8, type: "TLN", desc: [Tính tổng hệ số đan dấu]),
    (num: 9, type: "TLN", desc: [Lãi kép ngân hàng sau 4 năm]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Hệ số của số hạng chứa $x^3$ trong khai triển nhị thức $(1 + 2x)^4$ là:],
  (
    [$32$],
    [$8$],
    [$16$],
    [$24$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 28A — Tìm Hệ Số Số Hạng Trong Khai Triển Bậc 4",
  loigiai: [
    Khai triển $(1 + 2x)^4 = sum_(k=0)^4 C_4^k dot 1^(4-k) dot (2x)^k$.\
    Số hạng chứa $x^3$ tương ứng với $k = 3$:\
    $T_4 = C_4^3 dot (2x)^3 = 4 dot 8x^3 = 32x^3$.\
    Vậy hệ số là $32$. Phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Hệ số của số hạng chứa $x^2$ trong khai triển nhị thức $(x - 2)^5$ là:],
  (
    [$-80$],
    [$80$],
    [$-40$],
    [$40$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 28A — Tìm Hệ Số Có Chứa Dấu Trừ Trong Khai Triển Bậc 5",
  loigiai: [
    Số hạng tổng quát trong $(x - 2)^5$ là: $C_5^k dot x^(5-k) dot (-2)^k$.\
    Số hạng chứa $x^2$ ứng với $5 - k = 2 <=> k = 3$:\
    $T_4 = C_5^3 dot x^2 dot (-2)^3 = 10 dot (-8) dot x^2 = -80x^2$.\
    Vậy hệ số là $-80$. Phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Tổng tất cả các hệ số trong khai triển của nhị thức $P(x) = (2x - 1)^5$ bằng:],
  (
    [$1$],
    [$32$],
    [$0$],
    [$-1$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 28A — Kỹ Thuật Tính Tổng Tất Cả Hệ Số Khai Triển",
  loigiai: [
    Khai triển $P(x) = a_5 x^5 + a_4 x^4 + dots + a_0$.\
    Tổng tất cả các hệ số đúng bằng giá trị của đa thức tại $x = 1$:\
    $S = P(1) = (2(1) - 1)^5 = 1^5 = 1$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Số hạng không chứa $x$ trong khai triển nhị thức $(x + 1/x)^4$ (với $x != 0$) là:],
  (
    [$6$],
    [$4$],
    [$1$],
    [$16$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 28A — Tìm Số Hạng Không Chứa Biến (Hệ Số Tự Do)",
  loigiai: [
    Số hạng tổng quát: $C_4^k dot x^(4-k) dot (1/x)^k = C_4^k dot x^(4 - 2k)$.\
    Số hạng không chứa $x$ ứng với số mũ $4 - 2k = 0 <=> k = 2$.\
    Số hạng đó là: $C_4^2 dot x^0 = 6$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Trong khai triển của nhị thức $(x + a)^5$ với $a > 0$, hệ số của số hạng chứa $x^3$ bằng $90$. Giá trị của $a$ bằng:],
  (
    [$3$],
    [$9$],
    [$sqrt(3)$],
    [$6$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 28A — Xác Định Tham Số Trong Khai Triển Nhị Thức",
  loigiai: [
    Số hạng chứa $x^3$ trong $(x + a)^5$ là: $C_5^2 dot x^3 dot a^2 = 10 a^2 x^3$.\
    Theo đề bài: $10 a^2 = 90 <=> a^2 = 9$.\
    Vì $a > 0$ nên ta chọn $a = 3$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Sử dụng khai triển $(1 + alpha)^4 approx 1 + 4 alpha + 6 alpha^2$ để ước lượng giá trị của $1.01^4$. Kết quả nhận được là:],
  (
    [$1.0406$],
    [$1.0400$],
    [$1.0460$],
    [$1.0404$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 28A — Ứng Dụng Khai Triển Nhị Thức Tính Gần Đúng",
  loigiai: [
    Viết $1.01 = 1 + 0.01$ với $alpha = 0.01$:\
    $1.01^4 = (1 + 0.01)^4 approx 1 + 4(0.01) + 6(0.01)^2 = 1 + 0.04 + 0.0006 = 1.0406$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Cho đa thức $P(x) = (1 + 2x)^5 = a_5 x^5 + a_4 x^4 + a_3 x^3 + a_2 x^2 + a_1 x + a_0$. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Hệ số tự do của đa thức là $a_0 = 1$.], "true": true),
    (body: [Tổng tất cả các hệ số $a_5 + a_4 + dots + a_0 = 243$.], "true": true),
    (body: [Hệ số của số hạng chứa $x^4$ là $a_4 = 80$.], "true": true),
    (body: [Hệ số $a_5$ là hệ số có giá trị lớn nhất trong các hệ số.], "true": false),
  ),
  num: 7,
  de: "Đề 28A — Khảo Sát Toàn Diện Các Hệ Số Trong Khai Triển Bậc 5",
  loigiai: [
    - a) *Đ:* $a_0 = C_5^0 = 1$.
    - b) *Đ:* Thay $x = 1: P(1) = (1 + 2)^5 = 3^5 = 243$.
    - c) *Đ:* $a_4 = C_5^4 dot 2^4 = 5 dot 16 = 80$.
    - d) *S:* $a_3 = C_5^3 dot 2^3 = 80, a_4 = 80$ lớn hơn $a_5 = 2^5 = 32$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Cho đa thức $P(x) = (2x - 3)^4 = a_4 x^4 + a_3 x^3 + a_2 x^2 + a_1 x + a_0$. Tính giá trị của biểu thức đan dấu $S = a_4 - a_3 + a_2 - a_1 + a_0$.],
  "625",
  num: 8,
  de: "Đề 28A — Tính Tổng Các Hệ Số Đan Dấu Bằng Giá Trị Đa Thức",
  loigiai: [
    1. Thay $x = -1$ vào đa thức $P(x)$:\
       $P(-1) = a_4 (-1)^4 + a_3 (-1)^3 + a_2 (-1)^2 + a_1 (-1) + a_0 = a_4 - a_3 + a_2 - a_1 + a_0$.\
    2. Mặt khác, theo định nghĩa của $P(x)$:\
       $P(-1) = (2(-1) - 3)^4 = (-5)^4 = 625$.\
    3. Suy ra: $S = a_4 - a_3 + a_2 - a_1 + a_0 = 625$.\
    4. Đáp số: *$625$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Một người gửi $100$ triệu đồng vào ngân hàng với lãi suất kép $5\%$/năm. Sau $4$ năm, tổng số tiền cả gốc và lãi nhận được là $A = 100(1 + 0.05)^4$ triệu đồng. Tính số tiền $A$ làm tròn đến hàng phần mười triệu đồng.],
  "121.6",
  num: 9,
  de: "Đề 28B — Ứng Dụng Nhị Thức Newton Tính Lãi Kép Ngân Hàng",
  loigiai: [
    1. Áp dụng khai triển nhị thức Newton bậc 4 với $alpha = 0.05$:\
       $(1 + 0.05)^4 = 1 + 4(0.05) + 6(0.05)^2 + 4(0.05)^3 + (0.05)^4$.\
    2. Tính toán từng hạng tử:\
       $= 1 + 0.2 + 0.015 + 0.0005 + 0.00000625 = 1.21550625$.\
    3. Số tiền nhận được sau $4$ năm:\
       $A = 100 times 1.21550625 = 121.550625 approx 121.6 " (triệu đồng)"$.\
    4. Đáp số: *$121.6$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN IV: TỔNG KẾT & CỘT MỐC BÀI HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Tổng Kết & Cột Mốc])

#lt-slide-back(title: "🗺️ Bảng Tổng Hợp Công Thức Nhị Thức Newton")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr),
        column-gutter: 12pt,
        row-gutter: 10pt,
        [
          #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#1d4ed8"))[1. Khai triển bậc 4]\
            #v(0.1em)
            $(a + b)^4 = a^4 + 4a^3 b + 6a^2 b^2 + 4a b^3 + b^4$\
            Hệ số đối xứng: $1 quad 4 quad 6 quad 4 quad 1$
          ]
        ],
        [
          #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#10b981"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#047857"))[2. Khai triển bậc 5]\
            #v(0.1em)
            $(a + b)^5 = a^5 + 5a^4 b + 10a^3 b^2 + 10a^2 b^3 + 5a b^4 + b^5$\
            Hệ số đối xứng: $1 quad 5 quad 10 quad 10 quad 5 quad 1$
          ]
        ],
        [
          #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#a16207"))[3. Tam giác Pascal]\
            #v(0.1em)
            $C_n^k = C_(n-1)^(k-1) + C_(n-1)^k$\
            Quy tắc cộng kim tự tháp số đối xứng
          ]
        ],
        [
          #block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#a855f7"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#7e22ce"))[4. Kỹ thuật tính tổng hệ số]\
            #v(0.1em)
            Tổng các hệ số: Thay $x = 1$\
            Tổng đan dấu: Thay $x = -1$
          ]
        ]
      )
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Bài 25!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 18pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 20pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC BÀI 25!]\
      #v(0.5em)
      #text(size: 11pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn toàn các kỹ năng:\
        *Khai triển nhị thức Newton bậc 4 & 5, Tam giác Pascal, Tìm hệ số & Ứng dụng tính xấp xỉ.*
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 12pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
