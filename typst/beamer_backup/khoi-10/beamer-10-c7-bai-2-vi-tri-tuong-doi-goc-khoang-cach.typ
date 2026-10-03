#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Vị Trí Tương Đối, Góc & Khoảng Cách],
  subtitle: [TOÁN 10 — CHƯƠNG VII: XÉT VỊ TRÍ HAI ĐƯỜNG THẲNG, CÔNG THỨC GÓC & KHOẢNG CÁCH],
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
// PHẦN I: VỊ TRÍ TƯƠNG ĐỐI GIỮA HAI ĐƯỜNG THẲNG
// ════════════════════════════════════════════════
#lt-section-link("sec-vi-tri-tuong-doi", "📐", [I. Vị Trí Tương Đối Giữa Hai Đường Thẳng])

#lt-slide-back(title: "📐 Ba Vị Trí Tương Đối Giữa Hai Đường Thẳng")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Xét theo hệ phương trình")[
        Cho hai đường thẳng:
        $ Delta_1: a_1 x + b_1 y + c_1 = 0 $
        $ Delta_2: a_2 x + b_2 y + c_2 = 0 $
        Tọa độ giao điểm là nghiệm của hệ phương trình:
        $ cases(a_1 x + b_1 y = -c_1, a_2 x + b_2 y = -c_2) $
        - *Cắt nhau*: Hệ có nghiệm duy nhất $(x_0; y_0)$.
        - *Song song*: Hệ vô nghiệm.
        - *Trùng nhau*: Hệ có vô số nghiệm.
      ]
    ],
    [
      #lt-theorem(title: "Xét nhanh qua tỉ số hệ số")[
        (Khi các hệ số $a_2, b_2, c_2 != 0$):
        - $Delta_1$ cắt $Delta_2 <=> a_1 / a_2 != b_1 / b_2$.
        - $Delta_1 parallel Delta_2 <=> a_1 / a_2 = b_1 / b_2 != c_1 / c_2$.
        - $Delta_1 equiv Delta_2 <=> a_1 / a_2 = b_1 / b_2 = c_1 / c_2$.
      ]
      #v(0.15em)
      #lt-important(title: "Trường hợp vuông góc đặc biệt")[
        $Delta_1 perp Delta_2 <=> vec(n)_1 dot vec(n)_2 = 0 <=> a_1 a_2 + b_1 b_2 = 0$.
      ]
    ]
  )
]

#lt-slide-back(title: "🎨 Trực Quan Hóa Vị Trí Tương Đối Bằng CeTZ")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #align(center)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10pt)[1. Hai đường thẳng cắt nhau]\
        #v(0.2em)
        #cetz.canvas({
          import cetz.draw: *
          let sc = 0.95
          line((-0.5*sc, 0), (3.8*sc, 0), mark: (end: "stealth", fill: rgb("#94a3b8")), stroke: 0.7pt + rgb("#94a3b8"))
          line((0, -0.5*sc), (0, 3.2*sc), mark: (end: "stealth", fill: rgb("#94a3b8")), stroke: 0.7pt + rgb("#94a3b8"))

          // d1 và d2 cắt nhau
          line((0.2*sc, 0.4*sc), (3.6*sc, 2.6*sc), stroke: 1.5pt + rgb("#2563eb"))
          content((3.6*sc, 2.8*sc), text(size: 8.5pt, fill: rgb("#2563eb"), weight: "bold")[$d_1$])

          line((0.3*sc, 2.8*sc), (3.5*sc, 0.3*sc), stroke: 1.5pt + rgb("#dc2626"))
          content((3.5*sc, 0.5*sc), text(size: 8.5pt, fill: rgb("#dc2626"), weight: "bold")[$d_2$])

          // Giao điểm M
          circle((1.9*sc, 1.5*sc), radius: 2.5pt, fill: rgb("#7c3aed"))
          content((2.3*sc, 1.8*sc), text(size: 8.5pt, fill: rgb("#7c3aed"), weight: "bold")[$M(x_0; y_0)$])
        })
      ]
    ],
    [
      #align(center)[
        #text(weight: "bold", fill: rgb("#047857"), size: 10pt)[2. Hai đường thẳng song song]\
        #v(0.2em)
        #cetz.canvas({
          import cetz.draw: *
          let sc = 0.95
          line((-0.5*sc, 0), (3.8*sc, 0), mark: (end: "stealth", fill: rgb("#94a3b8")), stroke: 0.7pt + rgb("#94a3b8"))
          line((0, -0.5*sc), (0, 3.2*sc), mark: (end: "stealth", fill: rgb("#94a3b8")), stroke: 0.7pt + rgb("#94a3b8"))

          // d1 và d2 song song
          line((0.2*sc, 1.2*sc), (3.5*sc, 2.8*sc), stroke: 1.5pt + rgb("#059669"))
          content((3.6*sc, 3.0*sc), text(size: 8.5pt, fill: rgb("#059669"), weight: "bold")[$Delta_1$])

          line((0.2*sc, 0.3*sc), (3.5*sc, 1.9*sc), stroke: 1.5pt + rgb("#059669"))
          content((3.6*sc, 1.8*sc), text(size: 8.5pt, fill: rgb("#059669"), weight: "bold")[$Delta_2$])

          // Đoạn khoảng cách d
          line((1.5*sc, 1.83*sc), (1.8*sc, 1.07*sc), stroke: 1pt + rgb("#d97706"), dash: "dashed")
          content((2.1*sc, 1.4*sc), text(size: 8.5pt, fill: rgb("#d97706"), weight: "bold")[$d$])
        })
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: GÓC GIỮA HAI ĐƯỜNG THẲNG
// ════════════════════════════════════════════════
#lt-section-link("sec-goc-hai-duong-thang", "🧭", [II. Góc Giữa Hai Đường Thẳng])

#lt-slide-back(title: "🧭 Định Nghĩa & Công Thức Góc Giữa Hai Đường Thẳng")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Khái niệm góc giữa hai đường thẳng")[
        Góc giữa hai đường thẳng $Delta_1$ và $Delta_2$, kí hiệu $(Delta_1, Delta_2)$ hoặc $phi$, là góc nhọn hoặc góc vuông tạo bởi chúng:
        $ 0^circle <= phi <= 90^circle $
        - Nếu $Delta_1 parallel Delta_2$ hoặc $Delta_1 equiv Delta_2$, ta quy ước $phi = 0^circle$.
        - Nếu $Delta_1 perp Delta_2$, ta có $phi = 90^circle$.
      ]
    ],
    [
      #lt-theorem(title: "Công thức Cosin góc qua VTPT / VTCP")[
        Gọi $vec(n)_1 = (a_1; b_1)$ và $vec(n)_2 = (a_2; b_2)$ là VTPT của $Delta_1, Delta_2$:
        $ cos phi = (|vec(n)_1 dot vec(n)_2|) / (|vec(n)_1| dot |vec(n)_2|) = (|a_1 a_2 + b_1 b_2|) / (sqrt(a_1^2 + b_1^2) dot sqrt(a_2^2 + b_2^2)) $
      ]
      #v(0.15em)
      #lt-warning(title: "Cạm bẫy dấu giá trị tuyệt đối")[
        Góc giữa hai vectơ có thể tù ($[0^circle, 180^circle]$), nhưng góc giữa hai đường thẳng *luôn $<= 90^circle$* nên bắt buộc phải có *giá trị tuyệt đối* trên tử số!
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: KHOẢNG CÁCH TRONG MẶT PHẲNG TỌA ĐỘ
// ════════════════════════════════════════════════
#lt-section-link("sec-khoang-cach", "📏", [III. Khoảng Cách Trong Mặt Phẳng Tọa Độ])

#lt-slide-back(title: "📏 Công Thức Khoảng Cách Trong Mặt Phẳng Tọa Độ")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Từ điểm đến đường thẳng")[
        Khoảng cách từ $M_0(x_0; y_0)$ đến $Delta: a x + b y + c = 0$:
        $ d(M_0, Delta) = (|a x_0 + b y_0 + c|) / sqrt(a^2 + b^2) $
        - Tử số: Thay tọa độ $M_0$ vào vế trái PTTQ.
        - Mẫu số: Độ dài VTPT $sqrt(a^2 + b^2)$.
      ]
    ],
    [
      #lt-theorem(title: "Giữa hai đường song song")[
        Cho hai đường thẳng song song:
        $ Delta_1: a x + b y + c_1 = 0 $
        $ Delta_2: a x + b y + c_2 = 0 $
        $ d(Delta_1, Delta_2) = (|c_1 - c_2|) / sqrt(a^2 + b^2) $
      ]
      #v(0.1em)
      #lt-tip(title: "Ứng dụng")[
        Định vị radar, sóng viễn thông, cự ly hàng hải.
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP TRẮC NGHIỆM & ỨNG DỤNG
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [IV. Luyện tập: Hệ Thống Bài Tập Tuyển Chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VII BÀI 2],
  questions: (
    (num: 1, type: "TN", desc: [Vị trí tương đối: Trùng nhau]),
    (num: 2, type: "TN", desc: [Vị trí tương đối: Song song]),
    (num: 3, type: "TN", desc: [Hai đường thẳng vuông góc]),
    (num: 4, type: "TN", desc: [Khoảng cách từ điểm đến đường]),
    (num: 5, type: "TN", desc: [Cosin góc giữa hai đường thẳng]),
    (num: 6, type: "TN", desc: [Khoảng cách 2 đường song song]),
    (num: 7, type: "DS", desc: [Đúng/Sai khảo sát 2 đường thẳng]),
    (num: 8, type: "TLN", desc: [Tìm m để hai đường vuông góc]),
    (num: 9, type: "TLN", desc: [Cự ly trạm viễn thông đến quốc lộ]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Vị trí tương đối của hai đường thẳng $d_1: 2x - 3y + 5 = 0$ và $d_2: 4x - 6y + 10 = 0$ là:],
  (
    [Trùng nhau],
    [Song song với nhau],
    [Cắt nhau nhưng không vuông góc],
    [Vuông góc với nhau],
  ),
  correct: 1,
  num: 1,
  de: "Đề 22A — Nhận Biết Hai Đường Thẳng Trùng Nhau",
  loigiai: [
    Xét tỉ số giữa các hệ số tương ứng của hai phương trình:\
    $2 / 4 = (-3) / (-6) = 5 / 10 = 1 / 2$.\
    Vì cả ba tỉ số đều bằng nhau nên hai đường thẳng $d_1$ và $d_2$ trùng nhau.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Vị trí tương đối của hai đường thẳng $Delta_1: x - 2y + 3 = 0$ và $Delta_2: 2x - 4y + 7 = 0$ là:],
  (
    [Song song với nhau],
    [Trùng nhau],
    [Cắt nhau],
    [Vuông góc với nhau],
  ),
  correct: 1,
  num: 2,
  de: "Đề 22A — Nhận Biết Hai Đường Thẳng Song Song",
  loigiai: [
    Xét tỉ số giữa các hệ số tương ứng của hai đường thẳng:\
    $1 / 2 = (-2) / (-4) != 3 / 7$ (vì $1/2 != 3/7$).\
    Hệ số $x$ và $y$ tỉ lệ nhưng hệ số tự do không tỉ lệ, suy ra hai đường thẳng song song.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Hai đường thẳng $d_1: 3x - y + 2 = 0$ và $d_2: x + 3y - 5 = 0$ có vị trí tương đối là:],
  (
    [Vuông góc với nhau],
    [Song song với nhau],
    [Trùng nhau],
    [Cắt nhau nhưng không vuông góc],
  ),
  correct: 1,
  num: 3,
  de: "Đề 22A — Nhận Biết Hai Đường Thẳng Vuông Góc",
  loigiai: [
    VTPT của $d_1$ là $vec(n)_1 = (3; -1)$ và của $d_2$ là $vec(n)_2 = (1; 3)$.\
    Tích vô hướng: $vec(n)_1 dot vec(n)_2 = 3 dot 1 + (-1) dot 3 = 3 - 3 = 0$.\
    Vì tích vô hướng bằng $0$ nên hai đường thẳng vuông góc với nhau.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Khoảng cách từ điểm $M(1; 2)$ đến đường thẳng $Delta: 3x + 4y + 4 = 0$ bằng:],
  (
    [$3$],
    [$15$],
    [$5$],
    [$3/5$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 22A — Tính Khoảng Cách Từ Điểm Đến Đường Thẳng",
  loigiai: [
    Áp dụng công thức khoảng cách từ điểm $M(x_0; y_0) = (1; 2)$ đến $Delta$:\
    $d(M, Delta) = (|3(1) + 4(2) + 4|) / sqrt(3^2 + 4^2) = (|3 + 8 + 4|) / sqrt(25) = 15 / 5 = 3$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Cosin của góc giữa hai đường thẳng $d_1: x + 2y - 1 = 0$ và $d_2: 2x - y + 3 = 0$ bằng:],
  (
    [$0$],
    [$1$],
    [$1/sqrt(5)$],
    [$4/5$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 22A — Tính Cosin Góc Giữa Hai Đường Thẳng",
  loigiai: [
    VTPT của $d_1$ là $vec(n)_1 = (1; 2)$ và của $d_2$ là $vec(n)_2 = (2; -1)$.\
    $vec(n)_1 dot vec(n)_2 = 1 dot 2 + 2 dot (-1) = 0$.\
    Do đó $cos(d_1, d_2) = (|vec(n)_1 dot vec(n)_2|) / (|vec(n)_1| dot |vec(n)_2|) = 0 / 5 = 0$.\
    Góc giữa hai đường thẳng bằng $90^circle$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Khoảng cách giữa hai đường thẳng song song $d_1: 3x - 4y + 1 = 0$ và $d_2: 3x - 4y - 9 = 0$ bằng:],
  (
    [$2$],
    [$8/5$],
    [$10$],
    [$5/2$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 22A — Tính Khoảng Cách Giữa Hai Đường Thẳng Song Song",
  loigiai: [
    Áp dụng công thức khoảng cách giữa hai đường thẳng song song:\
    $d(d_1, d_2) = (|c_1 - c_2|) / sqrt(a^2 + b^2) = (|1 - (-9)|) / sqrt(3^2 + (-4)^2) = 10 / 5 = 2$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Cho hai đường thẳng $d_1: 3x - 4y + 5 = 0$ và $d_2: 4x + 3y - 10 = 0$ cùng điểm $A(1; 2)$. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Hai đường thẳng $d_1$ và $d_2$ vuông góc với nhau.], "true": true),
    (body: [Giao điểm của $d_1$ và $d_2$ là điểm $M(1; 2)$.], "true": true),
    (body: [Điểm $A(1; 2)$ không thuộc đường thẳng $d_1$.], "true": false),
    (body: [Khoảng cách từ gốc tọa độ $O(0; 0)$ đến đường thẳng $d_1$ bằng $1$.], "true": true),
  ),
  num: 7,
  de: "Đề 22A — Khảo Sát Hai Đường Thẳng Vuông Góc & Khoảng Cách",
  loigiai: [
    - a) *Đ:* $vec(n)_1 = (3; -4), vec(n)_2 = (4; 3) ==> vec(n)_1 dot vec(n)_2 = 3(4) - 4(3) = 0 ==> d_1 perp d_2$.
    - b) *Đ:* Thay $(1; 2)$: $3(1)-4(2)+5 = 0$ và $4(1)+3(2)-10 = 0$. Điểm $(1; 2)$ là giao điểm.
    - c) *S:* Vì $3(1) - 4(2) + 5 = 0$ nên $A(1; 2)$ thuộc đường thẳng $d_1$.
    - d) *Đ:* $d(O, d_1) = (|5|) / sqrt(3^2 + (-4)^2) = 5 / 5 = 1$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Tìm giá trị của tham số $m$ để hai đường thẳng $d_1: 2x - y + 1 = 0$ và $d_2: x + m y + 2 = 0$ vuông góc với nhau.],
  "2",
  num: 8,
  de: "Đề 22A — Tìm Tham Số Để Hai Đường Thẳng Vuông Góc",
  loigiai: [
    1. VTPT của $d_1$ là $vec(n)_1 = (2; -1)$.\
    2. VTPT của $d_2$ là $vec(n)_2 = (1; m)$.\
    3. Hai đường thẳng vuông góc với nhau khi và chỉ khi:\
       $vec(n)_1 dot vec(n)_2 = 0 <=> 2(1) + (-1)(m) = 0 <=> 2 - m = 0 <=> m = 2$.\
    4. Đáp số: *$2$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Một trạm phát sóng viễn thông đặt tại điểm $A(2; 3)$. Một tuyến đường quốc lộ thẳng được mô hình hóa bởi đường thẳng $d: 4x + 3y + 8 = 0$ (với đơn vị tọa độ là km). Khoảng cách ngắn nhất từ trạm phát sóng $A$ đến quốc lộ bằng bao nhiêu kilômét?],
  "5",
  num: 9,
  de: "Đề 22A — Ứng Dụng Khoảng Cách Trạm Viễn Thông Đến Quốc Lộ",
  loigiai: [
    1. Khoảng cách ngắn nhất từ trạm $A(2; 3)$ đến quốc lộ chính là khoảng cách từ điểm $A$ đến đường thẳng $d$:\
       $d(A, d) = (|4(2) + 3(3) + 8|) / sqrt(4^2 + 3^2)$.\
    2. Tử số: $|8 + 9 + 8| = |25| = 25$.\
    3. Mẫu số: $sqrt(16 + 9) = sqrt(25) = 5$.\
    4. Suy ra: $d(A, d) = 25 / 5 = 5 " (km)"$.\
    5. Đáp số: *$5$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN V: TỔNG KẾT & CỘT MỐC BÀI HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [V. Tổng Kết & Cột Mốc])

#lt-slide-back(title: "🗺️ Bảng Tổng Hợp Công Thức Vị Trí, Góc & Khoảng Cách")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr),
        column-gutter: 12pt,
        row-gutter: 10pt,
        [
          #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#1d4ed8"))[1. Vị trí tương đối]\
            #v(0.1em)
            $a_1 a_2 + b_1 b_2 = 0 <=> Delta_1 perp Delta_2$\
            Cắt nhau / Song song / Trùng nhau qua tỉ số
          ]
        ],
        [
          #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#10b981"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#047857"))[2. Góc giữa hai đường thẳng]\
            #v(0.1em)
            $cos phi = (|a_1 a_2 + b_1 b_2|) / (sqrt(a_1^2 + b_1^2) sqrt(a_2^2 + b_2^2))$\
            $0^circle <= phi <= 90^circle$
          ]
        ],
        [
          #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#a16207"))[3. Khoảng cách từ điểm]\
            #v(0.1em)
            $d(M_0, Delta) = (|a x_0 + b y_0 + c|) / sqrt(a^2 + b^2)$\
            Thay điểm vào PTTQ, chia độ dài VTPT
          ]
        ],
        [
          #block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#a855f7"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#7e22ce"))[4. Khoảng cách hai đường song song]\
            #v(0.1em)
            $d(Delta_1, Delta_2) = (|c_1 - c_2|) / sqrt(a^2 + b^2)$\
            Hai đường chung VTPT $(a; b)$
          ]
        ]
      )
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Bài 20!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 18pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 20pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC BÀI 20!]\
      #v(0.5em)
      #text(size: 11pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn toàn các công thức:\
        *Xét vị trí tương đối, Tính góc nhọn & Đo khoảng cách trong mặt phẳng tọa độ Oxy.*
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
