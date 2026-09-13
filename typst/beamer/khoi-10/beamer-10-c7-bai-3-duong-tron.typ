#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Phương Trình Đường Tròn],
  subtitle: [TOÁN 10 — CHƯƠNG VII: TÂM, BÁN KÍNH, PHƯƠNG TRÌNH CHÍNH TẮC & TIẾP TUYẾN],
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
// PHẦN I: PHƯƠNG TRÌNH ĐƯỜNG TRÒN
// ════════════════════════════════════════════════
#lt-section-link("sec-pt-duong-tron", "⭕", [I. Phương Trình Đường Tròn])

#lt-slide-back(title: "⭕ Phương Trình Chính Tắc Của Đường Tròn")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Phương trình chính tắc")[
        Đường tròn $(C)$ có tâm $I(a; b)$ và bán kính $R > 0$ là tập hợp các điểm $M(x; y)$ sao cho $I M = R$:
        $ (x - a)^2 + (y - b)^2 = R^2 $
        - Khi tâm là gốc tọa độ $O(0; 0)$:
        $ x^2 + y^2 = R^2 $
        - Biết tâm $I$ và bán kính $R$ là viết được ngay phương trình chính tắc.
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[💡 Ví Dụ Mẫu]\
        #v(0.2em)
        #text(size: 9pt)[
          - Đường tròn tâm $I(2; -3)$, $R = 5$:
            $ (x - 2)^2 + (y + 3)^2 = 25 $
          - Cho $(C): (x + 1)^2 + (y - 4)^2 = 16$:
            Tâm $I(-1; 4)$ và bán kính $R = sqrt(16) = 4$.
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Phương Trình Tổng Quát & Điều Kiện Tồn Tại")[
  #lt-two-col(
    ratio: (53%, 47%),
    [
      #lt-definition(title: "Phương trình tổng quát")[
        Khai triển $(x - a)^2 + (y - b)^2 = R^2$, ta được:
        $ x^2 + y^2 - 2a x - 2b y + c = 0 $
        trong đó $c = a^2 + b^2 - R^2$.
        - Ngược lại, phương trình trên là phương trình đường tròn khi và chỉ khi:
        $ a^2 + b^2 - c > 0 $
        - Khi đó: Tâm $I(a; b)$ và bán kính $R = sqrt(a^2 + b^2 - c)$.
      ]
    ],
    [
      #lt-warning(title: "Cạm bẫy phương trình tổng quát")[
        Không phải mọi phương trình dạng $x^2 + y^2 - 2a x - 2b y + c = 0$ đều là đường tròn!
        - Nếu $a^2 + b^2 - c = 0$: Chỉ biểu diễn một điểm duy nhất $I(a; b)$.
        - Nếu $a^2 + b^2 - c < 0$: Tập hợp rỗng (không có điểm thực nào).
      ]
      #v(0.1em)
      #lt-tip(title: "Mẹo tìm tâm I")[
        Lấy hệ số của $x$ và $y$ lần lượt chia cho $-2$.
      ]
    ]
  )
]

#lt-slide-back(title: "🎨 Trực Quan Hóa Đường Tròn & Tiếp Tuyến Bằng CeTZ")[
  #lt-two-col(
    ratio: (48%, 52%),
    [
      #lt-theorem(title: "Đặc trưng hình học tiếp tuyến")[
        - Cho đường tròn $(C)$ tâm $I(a; b)$ và điểm $M_0(x_0; y_0) in (C)$.
        - Tiếp tuyến $Delta$ tại $M_0$ vuông góc với bán kính $I M_0$:
        $ Delta perp I M_0 <=> vec(n)_Delta = arrow(I M_0) = (x_0 - a; y_0 - b) $
        - Phương trình tiếp tuyến tại $M_0$:
        $ (x_0 - a)(x - x_0) + (y_0 - b)(y - y_0) = 0 $
      ]
    ],
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          let sc = 0.95
          line((-0.3*sc, 0), (4.5*sc, 0), mark: (end: "stealth", fill: rgb("#94a3b8")), stroke: 0.7pt + rgb("#94a3b8"))
          line((0, -0.3*sc), (0, 3.8*sc), mark: (end: "stealth", fill: rgb("#94a3b8")), stroke: 0.7pt + rgb("#94a3b8"))

          // Đường tròn (C) tâm I(2.2, 1.8), R = 1.4
          circle((2.2*sc, 1.8*sc), radius: 1.4*sc, stroke: 1.8pt + rgb("#2563eb"), fill: rgb("#eff6ff"))
          circle((2.2*sc, 1.8*sc), radius: 2.5pt, fill: rgb("#1d4ed8"))
          content((2.2*sc, 1.45*sc), text(size: 8.5pt, weight: "bold", fill: rgb("#1d4ed8"))[$I(a; b)$])

          // Điểm M0 trên đường tròn (góc 45 độ: x = 2.2 + 1.4*0.707 = 3.19, y = 1.8 + 1.4*0.707 = 2.79)
          let mx = 3.19 * sc
          let my = 2.79 * sc
          circle((mx, my), radius: 2.5pt, fill: rgb("#dc2626"))
          content((mx + 0.5*sc, my - 0.2*sc), text(size: 8.5pt, weight: "bold", fill: rgb("#dc2626"))[$M_0$])

          // Bán kính IM0
          line((2.2*sc, 1.8*sc), (mx, my), stroke: 1.2pt + rgb("#1d4ed8"), dash: "dashed")
          content((2.55*sc, 2.45*sc), text(size: 8pt, fill: rgb("#1d4ed8"))[$R$])

          // Tiếp tuyến Delta vuông góc IM0
          line((mx - 0.9*sc, my + 0.9*sc), (mx + 0.9*sc, my - 0.9*sc), stroke: 2pt + rgb("#059669"))
          content((mx + 1.1*sc, my - 0.8*sc), text(size: 9pt, weight: "bold", fill: rgb("#059669"))[$Delta$])
        })
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: VỊ TRÍ TƯƠNG ĐỐI & ỨNG DỤNG
// ════════════════════════════════════════════════
#lt-section-link("sec-vi-tri-tuong-doi-dt", "📡", [II. Vị Trí Tương Đối & Ứng Dụng])

#lt-slide-back(title: "📡 Vị Trí Tương Đối Giữa Đường Thẳng & Đường Tròn")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "So sánh khoảng cách d(I, Delta) với R")[
        Cho đường tròn $(C)$ tâm $I$, bán kính $R$ và đường thẳng $Delta$:
        - $d(I, Delta) < R <=> Delta$ *cắt* $(C)$ tại $2$ điểm phân biệt (dây cung $A B = 2 sqrt(R^2 - d^2)$).
        - $d(I, Delta) = R <=> Delta$ *tiếp xúc* với $(C)$ tại $1$ điểm (tiếp tuyến).
        - $d(I, Delta) > R <=> Delta$ *không cắt* $(C)$.
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[📡 Radar Vòng Quét & Tâm Chấn Động Đất]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - *Radar quét $360^circle$*: Vùng kiểm soát không lưu là hình tròn tâm $I$ bán kính $R$. Máy bay có tọa độ $(x; y)$ nằm trong vùng an toàn khi $(x - a)^2 + (y - b)^2 <= R^2$.
          - *Định vị tâm chấn động đất*: Ba trạm địa chấn ghi nhận sóng $P$ và $S$ tạo thành $3$ đường tròn. Giao điểm duy nhất của $3$ đường tròn xác định chính xác tâm chấn!
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
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VII BÀI 3],
  questions: (
    (num: 1, type: "TN", desc: [Tâm và bán kính PT chính tắc]),
    (num: 2, type: "TN", desc: [Lập PT chính tắc từ tâm và R]),
    (num: 3, type: "TN", desc: [Tâm và bán kính PT tổng quát]),
    (num: 4, type: "TN", desc: [Điều kiện m là đường tròn]),
    (num: 5, type: "TN", desc: [Đường tròn đường kính AB]),
    (num: 6, type: "TN", desc: [Phương trình tiếp tuyến tại điểm]),
    (num: 7, type: "DS", desc: [Đúng/Sai khảo sát đường tròn]),
    (num: 8, type: "TLN", desc: [Bán kính đường tròn tổng quát]),
    (num: 9, type: "TLN", desc: [Khoảng cách tâm chấn động đất]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Tọa độ tâm $I$ và bán kính $R$ của đường tròn $(C): (x - 2)^2 + (y + 3)^2 = 25$ là:],
  (
    [$I(2; -3)$ và $R = 5$],
    [$I(-2; 3)$ và $R = 5$],
    [$I(2; -3)$ và $R = 25$],
    [$I(-2; 3)$ và $R = 25$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 23A — Xác Định Tâm Và Bán Kính Từ Phương Trình Chính Tắc",
  loigiai: [
    Phương trình chính tắc dạng $(x - a)^2 + (y - b)^2 = R^2$.\
    So sánh với phương trình đã cho: $a = 2, b = -3$ và $R = sqrt(25) = 5$.\
    Vậy tâm $I(2; -3)$ và bán kính $R = 5$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Phương trình của đường tròn có tâm $I(-1; 2)$ và bán kính $R = 3$ là:],
  (
    [$(x + 1)^2 + (y - 2)^2 = 9$],
    [$(x - 1)^2 + (y + 2)^2 = 9$],
    [$(x + 1)^2 + (y - 2)^2 = 3$],
    [$(x - 1)^2 + (y + 2)^2 = 3$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 23A — Lập Phương Trình Chính Tắc Từ Tâm Và Bán Kính",
  loigiai: [
    Áp dụng công thức đường tròn tâm $I(a; b)$ bán kính $R$:\
    $(x - a)^2 + (y - b)^2 = R^2 <=> (x - (-1))^2 + (y - 2)^2 = 3^2 <=> (x + 1)^2 + (y - 2)^2 = 9$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Tọa độ tâm $I$ và bán kính $R$ của đường tròn $(C): x^2 + y^2 - 4x + 6y - 12 = 0$ là:],
  (
    [$I(2; -3)$ và $R = 5$],
    [$I(-2; 3)$ và $R = 5$],
    [$I(2; -3)$ và $R = 25$],
    [$I(4; -6)$ và $R = 5$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 23A — Xác Định Tâm Và Bán Kính Từ Phương Trình Tổng Quát",
  loigiai: [
    Từ PTTQ $x^2 + y^2 - 2a x - 2b y + c = 0$:\
    $-2a = -4 ==> a = 2$; $-2b = 6 ==> b = -3$; $c = -12$.\
    Bán kính: $R = sqrt(a^2 + b^2 - c) = sqrt(2^2 + (-3)^2 - (-12)) = sqrt(4 + 9 + 12) = sqrt(25) = 5$.\
    Vậy $I(2; -3)$ và $R = 5$. Phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Tìm tất cả các giá trị của tham số $m$ để phương trình $x^2 + y^2 - 2x + 4y + m = 0$ là phương trình của một đường tròn.],
  (
    [$m < 5$],
    [$m <= 5$],
    [$m > 5$],
    [$m < -5$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 23A — Điều Kiện Để Phương Trình Bậc Hai Là Đường Tròn",
  loigiai: [
    Ta có $a = 1, b = -2, c = m$.\
    Phương trình là phương trình đường tròn khi và chỉ khi:\
    $a^2 + b^2 - c > 0 <=> 1^2 + (-2)^2 - m > 0 <=> 5 - m > 0 <=> m < 5$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Phương trình đường tròn có đường kính $A B$ với $A(1; 3)$ và $B(5; -1)$ là:],
  (
    [$(x - 3)^2 + (y - 1)^2 = 8$],
    [$(x - 3)^2 + (y - 1)^2 = 32$],
    [$(x + 3)^2 + (y + 1)^2 = 8$],
    [$(x - 3)^2 + (y - 1)^2 = sqrt(8)$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 23A — Lập Phương Trình Đường Tròn Đường Kính AB",
  loigiai: [
    1. Tâm $I$ là trung điểm $A B$: $I((1+5)/2; (3+(-1))/2) = (3; 1)$.\
    2. Bán kính $R = (A B)/2 = sqrt((5-1)^2 + (-1-3)^2) / 2 = sqrt(16 + 16) / 2 = sqrt(32)/2 = sqrt(8)$.\
    3. Phương trình: $(x - 3)^2 + (y - 1)^2 = (sqrt(8))^2 = 8$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Phương trình tiếp tuyến của đường tròn $(C): (x - 1)^2 + (y - 2)^2 = 25$ tại điểm $M(4; 6) in (C)$ là:],
  (
    [$3x + 4y - 36 = 0$],
    [$3x + 4y + 36 = 0$],
    [$4x + 3y - 34 = 0$],
    [$3x - 4y + 12 = 0$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 23A — Viết Phương Trình Tiếp Tuyến Của Đường Tròn Tại Một Điểm",
  loigiai: [
    Đường tròn $(C)$ có tâm $I(1; 2)$.\
    Tiếp tuyến tại $M(4; 6)$ nhận $arrow(I M) = (4 - 1; 6 - 2) = (3; 4)$ làm VTPT.\
    Phương trình tiếp tuyến là:\
    $3(x - 4) + 4(y - 6) = 0 <=> 3x + 4y - 36 = 0$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Cho đường tròn $(C): x^2 + y^2 - 2x - 4y - 20 = 0$ và điểm $M(4; 6)$. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Đường tròn $(C)$ có tâm $I(1; 2)$ và bán kính $R = 5$.], "true": true),
    (body: [Điểm $M(4; 6)$ nằm bên ngoài đường tròn $(C)$.], "true": false),
    (body: [Điểm $M(4; 6)$ thuộc đường tròn $(C)$.], "true": true),
    (body: [Tiếp tuyến của $(C)$ tại $M$ có phương trình $3x + 4y - 36 = 0$.], "true": true),
  ),
  num: 7,
  de: "Đề 23A — Khảo Sát Toàn Diện Đường Tròn & Tiếp Tuyến",
  loigiai: [
    - a) *Đ:* $a = 1, b = 2, c = -20 ==> R = sqrt(1^2 + 2^2 - (-20)) = sqrt(25) = 5$. Tâm $I(1; 2)$.
    - b) *S:* Khoảng cách $I M = sqrt((4-1)^2 + (6-2)^2) = 5 = R$ nên $M$ thuộc đường tròn.
    - c) *Đ:* Thay $(4; 6)$ vào PT: $4^2 + 6^2 - 2(4) - 4(6) - 20 = 16 + 36 - 8 - 24 - 20 = 0$.
    - d) *Đ:* VTPT là $arrow(I M) = (3; 4)$, PTTT: $3(x - 4) + 4(y - 6) = 0 <=> 3x + 4y - 36 = 0$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Cho đường tròn $(C): x^2 + y^2 - 6x + 8y - 11 = 0$. Bán kính $R$ của đường tròn bằng bao nhiêu?],
  "6",
  num: 8,
  de: "Đề 23A — Tính Bán Kính Đường Tròn Từ Phương Trình Tổng Quát",
  loigiai: [
    1. Xác định các hệ số: $a = 3, b = -4, c = -11$.\
    2. Bán kính $R$ được tính theo công thức:\
       $R = sqrt(a^2 + b^2 - c) = sqrt(3^2 + (-4)^2 - (-11)) = sqrt(9 + 16 + 11) = sqrt(36) = 6$.\
    3. Đáp số: *$6$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Một trận động đất xảy ra với tâm chấn tại vị trí có tọa độ $I(5; 12)$ (đơn vị trên bản đồ là kilômét). Khoảng cách từ tâm chấn đến trạm quan trắc địa chấn đặt tại gốc tọa độ $O(0; 0)$ bằng bao nhiêu kilômét?],
  "13",
  num: 9,
  de: "Đề 23A — Ứng Dụng Khoảng Cách Tâm Chấn Động Đất Đến Trạm Quan Trắc",
  loigiai: [
    1. Tọa độ tâm chấn là $I(5; 12)$, trạm quan trắc tại $O(0; 0)$.\
    2. Khoảng cách từ tâm chấn $I$ đến trạm quan trắc $O$ chính là độ dài đoạn thẳng $O I$:\
       $d = O I = sqrt((5 - 0)^2 + (12 - 0)^2) = sqrt(25 + 144) = sqrt(169) = 13 " (km)"$.\
    3. Đáp số: *$13$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN IV: TỔNG KẾT & CỘT MỐC BÀI HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Tổng Kết & Cột Mốc])

#lt-slide-back(title: "🗺️ Bảng Tổng Hợp Công Thức Đường Tròn")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr),
        column-gutter: 12pt,
        row-gutter: 10pt,
        [
          #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#1d4ed8"))[1. Phương trình chính tắc]\
            #v(0.1em)
            $(x - a)^2 + (y - b)^2 = R^2$\
            Tâm $I(a; b)$, bán kính $R > 0$
          ]
        ],
        [
          #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#10b981"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#047857"))[2. Phương trình tổng quát]\
            #v(0.1em)
            $x^2 + y^2 - 2a x - 2b y + c = 0$\
            Điều kiện: $a^2 + b^2 - c > 0$, $R = sqrt(a^2 + b^2 - c)$
          ]
        ],
        [
          #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#a16207"))[3. Tiếp tuyến tại điểm $M_0$]\
            #v(0.1em)
            $(x_0 - a)(x - x_0) + (y_0 - b)(y - y_0) = 0$\
            VTPT chính là $arrow(I M_0) = (x_0 - a; y_0 - b)$
          ]
        ],
        [
          #block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#a855f7"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#7e22ce"))[4. Vị trí tương đối với đường thẳng]\
            #v(0.1em)
            $d(I, Delta) < R <=> 2$ giao điểm\
            $d(I, Delta) = R <=> "tiếp xúc"$ (tiếp tuyến)
          ]
        ]
      )
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Bài 21!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 18pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 20pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC BÀI 21!]\
      #v(0.5em)
      #text(size: 11pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn toàn các kỹ năng:\
        *Xác định tâm & bán kính, Lập phương trình chính tắc/tổng quát & Viết phương trình tiếp tuyến.*
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
