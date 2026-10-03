#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Bài Tập Cuối Chương VII],
  subtitle: [TOÁN 10 — CHƯƠNG VII: ÔN TẬP TỔNG HỢP ĐƯỜNG THẲNG, ĐƯỜNG TRÒN & BA ĐƯỜNG CONIC],
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
#lt-toc(title: [🗺️ NỘI DUNG ÔN TẬP CHƯƠNG VII])

// ════════════════════════════════════════════════
// PHẦN I: SƠ ĐỒ HỆ THỐNG KIẾN THỨC
// ════════════════════════════════════════════════
#lt-section-link("sec-so-do-he-thong", "🗺️", [I. Sơ Đồ Hệ Thống Kiến Thức])

#lt-slide-back(title: "🗺️ Bốn Trụ Cột Của Phương Pháp Tọa Độ Oxy")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Bản chất phương pháp tọa độ")[
        - Biến các đối tượng hình học trực quan thành *phương trình đại số*.
        - Biến các quan hệ hình học (song song, vuông góc, khoảng cách, tiếp xúc) thành *phép toán số học và hệ phương trình*.
        - Nền tảng cho đồ họa máy tính, GIS bản đồ vệ tinh, mô phỏng vật lý và trí tuệ nhân tạo.
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10pt)[4 Trụ Cột Cốt Lõi Chương VII]\
        #v(0.15em)
        #text(size: 8.5pt)[
          1. *Vectơ & Điểm*: Tọa độ, độ dài, tích vô hướng.
          2. *Đường thẳng*: VTCP, VTPT, PT tham số, PTTQ, góc & khoảng cách.
          3. *Đường tròn*: PT chính tắc, PTTQ, tiếp tuyến.
          4. *Ba đường Conic*: Elip, Hypebol, Parabol và tính chất phản xạ quang học.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: CẨM NANG CẠM BẪY & SAI LẦM THƯỜNG GẶP
// ════════════════════════════════════════════════
#lt-section-link("sec-cam-bay", "⚠️", [II. Cẩm Nang Cạm Bẫy & Sai Lầm Thường Gặp])

#lt-slide-back(title: "⚠️ 4 Cạm Bẫy Kinh Điển Cần Tuyệt Đối Tránh")[
  #align(center)[
    #block(fill: rgb("#fff7ed"), stroke: 1.2pt + rgb("#f97316"), inset: 9pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr),
        column-gutter: 10pt,
        row-gutter: 8pt,
        [
          #block(fill: white, stroke: 0.8pt + rgb("#fdba74"), inset: 6pt, radius: 5pt)[
            #text(weight: "bold", fill: rgb("#c2410c"), size: 9pt)[1. Quên điều kiện đường tròn]\
            #text(size: 8pt)[$x^2 + y^2 - 2a x - 2b y + c = 0$ *chỉ là đường tròn* khi $a^2 + b^2 - c > 0$! Nếu $<= 0$ là sai lầm!]
          ]
        ],
        [
          #block(fill: white, stroke: 0.8pt + rgb("#fdba74"), inset: 6pt, radius: 5pt)[
            #text(weight: "bold", fill: rgb("#c2410c"), size: 9pt)[2. Thiếu trị tuyệt đối góc hai đường]\
            #text(size: 8pt)[Góc giữa $2$ đường thẳng luôn nhọn hoặc vuông ($<= 90^circle$), bắt buộc có $|vec(n)_1 dot vec(n)_2|$ trên tử số!]
          ]
        ],
        [
          #block(fill: white, stroke: 0.8pt + rgb("#fdba74"), inset: 6pt, radius: 5pt)[
            #text(weight: "bold", fill: rgb("#c2410c"), size: 9pt)[3. Nhầm dấu tiêu cự Conic]\
            #text(size: 8pt)[- Elip: $c^2 = a^2 - b^2$ ($a > b$).\ - Hypebol: $c^2 = a^2 + b^2$ ($c > a$).]
          ]
        ],
        [
          #block(fill: white, stroke: 0.8pt + rgb("#fdba74"), inset: 6pt, radius: 5pt)[
            #text(weight: "bold", fill: rgb("#c2410c"), size: 9pt)[4. Tiêu điểm Parabol]\
            #text(size: 8pt)[$y^2 = 2p x$ có tiêu điểm là $F(p/2; 0)$, *không phải* $F(p; 0)$! Đường chuẩn là $x = -p/2$.]
          ]
        ]
      )
    ]
  ]
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM TỔNG HỢP
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Hệ Thống Bài Tập Tổng Hợp])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG ÔN TẬP — CUỐI CHƯƠNG VII],
  questions: (
    (num: 1, type: "TN", desc: [VTPT của đường thẳng]),
    (num: 2, type: "TN", desc: [Góc giữa hai đường vuông góc]),
    (num: 3, type: "TN", desc: [Khoảng cách từ điểm đến đường]),
    (num: 4, type: "TN", desc: [Tâm và bán kính đường tròn]),
    (num: 5, type: "TN", desc: [Tiếp tuyến đường tròn tại điểm]),
    (num: 6, type: "TN", desc: [Tiêu cự của Elip]),
    (num: 7, type: "DS", desc: [Đúng/Sai tổng hợp ba Conic]),
    (num: 8, type: "TLN", desc: [Diện tích tam giác trong Oxy]),
    (num: 9, type: "TLN", desc: [Cổng vòm Parabol triển lãm]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Trong mặt phẳng $O x y$, một vectơ pháp tuyến của đường thẳng $d: 2x - 3y + 5 = 0$ là:],
  (
    [$vec(n) = (2; -3)$],
    [$vec(n) = (3; 2)$],
    [$vec(n) = (2; 3)$],
    [$vec(n) = (-3; 2)$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 25A — Xác Định Vectơ Pháp Tuyến Đường Thẳng",
  loigiai: [
    Từ phương trình tổng quát $a x + b y + c = 0$, hệ số của $x$ và $y$ chính là tọa độ VTPT:\
    $a = 2$ và $b = -3 ==> vec(n) = (a; b) = (2; -3)$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Góc tạo bởi hai đường thẳng $d_1: x + 2y - 1 = 0$ và $d_2: 2x - y + 3 = 0$ bằng:],
  (
    [$90^circle$],
    [$45^circle$],
    [$60^circle$],
    [$30^circle$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 25A — Nhận Biết Góc Giữa Hai Đường Thẳng Vuông Góc",
  loigiai: [
    VTPT của $d_1$ là $vec(n)_1 = (1; 2)$ và của $d_2$ là $vec(n)_2 = (2; -1)$.\
    Tích vô hướng: $vec(n)_1 dot vec(n)_2 = 1(2) + 2(-1) = 2 - 2 = 0$.\
    Suy ra $d_1 perp d_2$, do đó góc giữa hai đường thẳng bằng $90^circle$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Khoảng cách từ điểm $M(1; -2)$ đến đường thẳng $d: 3x - 4y + 4 = 0$ bằng:],
  (
    [$3$],
    [$15$],
    [$5$],
    [$1$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 25A — Tính Khoảng Cách Từ Điểm Đến Đường Thẳng",
  loigiai: [
    Áp dụng công thức khoảng cách:\
    $d(M, d) = (|3(1) - 4(-2) + 4|) / sqrt(3^2 + (-4)^2) = (|3 + 8 + 4|) / sqrt(25) = 15 / 5 = 3$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Tọa độ tâm $I$ và bán kính $R$ của đường tròn $(C): x^2 + y^2 - 4x + 6y - 3 = 0$ là:],
  (
    [$I(2; -3)$ và $R = 4$],
    [$I(-2; 3)$ và $R = 4$],
    [$I(2; -3)$ và $R = 16$],
    [$I(-2; 3)$ và $R = 16$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 25A — Xác Định Tâm Và Bán Kính Đường Tròn Tổng Quát",
  loigiai: [
    Ta có $a = 2, b = -3, c = -3$.\
    Bán kính: $R = sqrt(a^2 + b^2 - c) = sqrt(2^2 + (-3)^2 - (-3)) = sqrt(4 + 9 + 3) = sqrt(16) = 4$.\
    Vậy tâm là $I(2; -3)$ và bán kính $R = 4$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Phương trình tiếp tuyến của đường tròn $(C): x^2 + y^2 = 25$ tại điểm $M(3; -4) in (C)$ là:],
  (
    [$3x - 4y - 25 = 0$],
    [$3x - 4y + 25 = 0$],
    [$4x + 3y = 0$],
    [$3x + 4y - 25 = 0$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 25A — Lập Phương Trình Tiếp Tuyến Của Đường Tròn",
  loigiai: [
    Đường tròn có tâm $O(0; 0)$.\
    Tiếp tuyến tại $M(3; -4)$ nhận $arrow(O M) = (3; -4)$ làm VTPT.\
    Phương trình tiếp tuyến là:\
    $3(x - 3) - 4(y - (-4)) = 0 <=> 3x - 4y - 25 = 0$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Tiêu cự của Elip $(E): x^2 / 16 + y^2 / 7 = 1$ bằng:],
  (
    [$6$],
    [$3$],
    [$9$],
    [$8$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 25A — Xác Định Tiêu Cự Của Đường Elip",
  loigiai: [
    Ta có $a^2 = 16$ và $b^2 = 7$.\
    $c^2 = a^2 - b^2 = 16 - 7 = 9 ==> c = 3$.\
    Tiêu cự của Elip là: $2c = 2(3) = 6$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Cho ba đường conic: $(E): x^2 / 25 + y^2 / 9 = 1$, $(H): x^2 / 16 - y^2 / 9 = 1$ và $(P): y^2 = 8x$. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Độ dài trục lớn của Elip $(E)$ bằng $10$.], "true": true),
    (body: [Tiêu cự của Elip $(E)$ bằng $8$.], "true": true),
    (body: [Tiêu cự của Hypebol $(H)$ bằng $10$.], "true": true),
    (body: [Tiêu điểm của Parabol $(P)$ là $F(4; 0)$.], "true": false),
  ),
  num: 7,
  de: "Đề 25A — Khảo Sát Tổng Hợp Ba Đường Conic",
  loigiai: [
    - a) *Đ:* $(E)$ có $a^2 = 25 ==> a = 5 ==> 2a = 10$.
    - b) *Đ:* $(E)$ có $c^2 = 25 - 9 = 16 ==> c = 4 ==> 2c = 8$.
    - c) *Đ:* $(H)$ có $c^2 = 16 + 9 = 25 ==> c = 5 ==> 2c = 10$.
    - d) *S:* $(P)$ có $2p = 8 ==> p = 4 ==> F(p/2; 0) = F(2; 0) != (4; 0)$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Cho tam giác $A B C$ có tọa độ ba đỉnh là $A(1; 3)$, $B(-2; -1)$ và $C(4; -1)$. Diện tích của tam giác $A B C$ bằng bao nhiêu?],
  "12",
  num: 8,
  de: "Đề 25A — Tính Diện Tích Tam Giác Bằng Phương Pháp Tọa Độ",
  loigiai: [
    1. Cạnh $B C$ nằm trên đường thẳng $y = -1$, độ dài đáy: $B C = |4 - (-2)| = 6$.\
    2. Chiều cao $A H$ từ đỉnh $A(1; 3)$ đến đường thẳng $y = -1$ là: $h = |3 - (-1)| = 4$.\
    3. Diện tích tam giác $A B C$ là:\
       $S_(A B C) = 1/2 B C dot h = 1/2 dot 6 dot 4 = 12$.\
    4. Đáp số: *$12$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Cổng chào của một khu triển lãm có dạng một đường Parabol với chiều rộng chân cổng là $12 " m"$ và chiều cao tại đỉnh cổng là $9 " m"$. Chiều cao của cổng tại vị trí cách tâm chân cổng $4 " m"$ bằng bao nhiêu mét?],
  "5",
  num: 9,
  de: "Đề 25A — Ứng Dụng Vòm Cổng Parabol Trong Thực Tế",
  loigiai: [
    1. Chọn hệ trục tọa độ với gốc $O(0; 0)$ tại tâm chân cổng, đỉnh cổng tại $(0; 9)$.\
    2. Phương trình Parabol dạng: $y = -a x^2 + 9$.\
    3. Chân cổng rộng $12 " m"$ nên đi qua điểm $(6; 0)$:\
       $0 = -a(6^2) + 9 <=> 36a = 9 <=> a = 1/4 ==> y = -1/4 x^2 + 9$.\
    4. Tại vị trí cách tâm $4 " m"$ ($x = 4$):\
       $y = -1/4(4^2) + 9 = -4 + 9 = 5 " (m)"$.\
    5. Đáp số: *$5$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN IV: TỔNG KẾT & CỘT MỐC CHƯƠNG VII
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Tổng Kết Toàn Diện Chương VII])

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Xuất Sắc Hoàn Thành Toàn Bộ Chương VII!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 18pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 20pt, weight: "bold", fill: rgb("#15803d"))[🎉 TOÀN THẮNG CHƯƠNG VII: TỌA ĐỘ OXY!]\
      #v(0.5em)
      #text(size: 11pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn hảo toàn bộ 5 bài học:\
        *Phương trình đường thẳng, Góc & khoảng cách, Đường tròn, Ba đường Conic & Ứng dụng thực tiễn.*
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
