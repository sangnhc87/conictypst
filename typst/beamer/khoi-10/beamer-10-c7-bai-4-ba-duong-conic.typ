#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Ba Đường Conic],
  subtitle: [TOÁN 10 — CHƯƠNG VII: ELIP, HYPEBOL, PARABOL & CÁC ỨNG DỤNG ĐỈNH CAO],
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
// PHẦN I: ĐƯỜNG ELIP (ELLIPSE)
// ════════════════════════════════════════════════
#lt-section-link("sec-elip", "🪐", [I. Đường Elip (Ellipse)])

#lt-slide-back(title: "🪐 Định Nghĩa & Phương Trình Chính Tắc Của Elip")[
  #lt-two-col(
    ratio: (53%, 47%),
    [
      #lt-definition(title: "Định nghĩa Elip")[
        Cho hai điểm cố định $F_1, F_2$ với $F_1 F_2 = 2c$ ($c > 0$).
        *Đường Elip* $(E)$ là tập hợp các điểm $M$ sao cho:
        $ M F_1 + M F_2 = 2a quad (a > c > 0) $
        - $F_1, F_2$ gọi là các *tiêu điểm*.
        - Đoạn thẳng $F_1 F_2 = 2c$ gọi là *tiêu cự*.
        - Phương trình chính tắc:
        $ x^2 / a^2 + y^2 / b^2 = 1 quad (b^2 = a^2 - c^2 > 0) $
      ]
    ],
    [
      #lt-theorem(title: "Các đặc trưng hình học của Elip")[
        - Độ dài trục lớn: $A_1 A_2 = 2a$ (nằm trên $O x$).
        - Độ dài trục nhỏ: $B_1 B_2 = 2b$ (nằm trên $O y$).
        - Tiêu điểm: $F_1(-c; 0)$ và $F_2(c; 0)$.
        - Bốn đỉnh: $A_1(-a; 0), A_2(a; 0), B_1(0; -b), B_2(0; b)$.
        - Tâm sai: $e = c / a < 1$ (đo độ dẹt của elip).
      ]
    ]
  )
]

#lt-slide-back(title: "🎨 Trực Quan Hóa Đường Elip Bằng CeTZ")[
  #lt-two-col(
    ratio: (48%, 52%),
    [
      #lt-theorem(title: "Cách vẽ Elip của người thợ mộc")[
        - Cắm hai chiếc đinh tại hai tiêu điểm $F_1, F_2$.
        - Buộc một sợi dây kín có độ dài không đổi $2a + 2c$.
        - Dùng đầu bút chì căng sợi dây di chuyển xung quanh, quỹ đạo vạch ra chính là một *Đường Elip hoàn hảo*!
      ]
      #v(0.1em)
      #lt-tip(title: "Liên hệ")[
        Khi $c -> 0$, hai tiêu điểm chập lại và Elip trở thành đường tròn bán kính $a$!
      ]
    ],
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          let sc = 0.95
          line((-3.2*sc, 0), (3.2*sc, 0), mark: (end: "stealth", fill: rgb("#94a3b8")), stroke: 0.7pt + rgb("#94a3b8"))
          line((0, -2.4*sc), (0, 2.4*sc), mark: (end: "stealth", fill: rgb("#94a3b8")), stroke: 0.7pt + rgb("#94a3b8"))

          // Vẽ Elip a=2.5, b=1.5
          circle((0, 0), radius: (2.5*sc, 1.5*sc), stroke: 1.8pt + rgb("#2563eb"), fill: rgb("#eff6ff"))

          // Tiêu điểm c = sqrt(2.5^2 - 1.5^2) = 2.0
          circle((-2.0*sc, 0), radius: 2.5pt, fill: rgb("#dc2626"))
          content((-2.0*sc, -0.35*sc), text(size: 8.5pt, weight: "bold", fill: rgb("#dc2626"))[$F_1$])

          circle((2.0*sc, 0), radius: 2.5pt, fill: rgb("#dc2626"))
          content((2.0*sc, -0.35*sc), text(size: 8.5pt, weight: "bold", fill: rgb("#dc2626"))[$F_2$])

          // Điểm M trên Elip (x=1.5, y = 1.5 * sqrt(1 - 1.5^2/2.5^2) = 1.2)
          let mx = 1.5 * sc
          let my = 1.2 * sc
          circle((mx, my), radius: 2.5pt, fill: rgb("#059669"))
          content((mx + 0.3*sc, my + 0.2*sc), text(size: 8.5pt, weight: "bold", fill: rgb("#059669"))[$M$])

          // Đoạn MF1 và MF2
          line((-2.0*sc, 0), (mx, my), stroke: 1.2pt + rgb("#059669"), dash: "dashed")
          line((2.0*sc, 0), (mx, my), stroke: 1.2pt + rgb("#059669"), dash: "dashed")
          content((0, 1.9*sc), text(size: 8.5pt, fill: rgb("#1d4ed8"), weight: "bold")[$M F_1 + M F_2 = 2a$])
        })
      ]
    ]
  )
]

#lt-slide-back(title: "🏥 Máy Tán Sỏi Thận ESWL & Quỹ Đạo Kepler 1609")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10.5pt)[🏥 Máy Tán Sỏi Thận Ngoài Cơ Thể (ESWL)]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Buồng phản xạ của máy ESWL có hình nửa khối bầu dục Elip.
          - Đầu phát sóng siêu âm đặt tại tiêu điểm $F_1$.
          - Nhờ tính chất quang học Elip: *mọi tia sóng phát ra từ $F_1$ khi phản xạ đều hội tụ chính xác tại tiêu điểm $F_2$*!
          - Bác sĩ định vị viên sỏi thận của bệnh nhân nằm đúng tiêu điểm $F_2$. Sỏi bị tán vụn mà không cần phẫu thuật!
        ]
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#3b82f6"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[🌌 Định Luật 1 Kepler (1609)]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Năm 1609, nhà thiên văn học *Johannes Kepler* phát hiện:
          - *“Mọi hành tinh trong hệ Mặt Trời đều chuyển động theo quỹ đạo Elip với Mặt Trời nằm tại một trong hai tiêu điểm!”*
          - Trái Đất có khoảng cách gần Mặt Trời nhất (điểm cận nhật) là $147$ triệu km và xa nhất (điểm viễn nhật) là $153$ triệu km.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: HYPEBOL & PARABOL
// ════════════════════════════════════════════════
#lt-section-link("sec-hypebol-parabol", "📡", [II. Đường Hypebol & Parabol])

#lt-slide-back(title: "📡 Đường Hypebol (Hyperbola)")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Định nghĩa & Phương trình chính tắc")[
        Tập hợp các điểm $M$ có giá trị tuyệt đối hiệu khoảng cách đến hai tiêu điểm $F_1, F_2$ bằng hằng số $2a$ ($a < c$):
        $ |M F_1 - M F_2| = 2a $
        - Phương trình chính tắc:
        $ x^2 / a^2 - y^2 / b^2 = 1 quad (b^2 = c^2 - a^2 > 0) $
        - Hai nhánh mở sang hai phía đối xứng qua gốc $O$.
      ]
    ],
    [
      #lt-theorem(title: "Đặc trưng hình học & Ứng dụng")[
        - Tiêu điểm: $F_1(-c; 0), F_2(c; 0)$ với $c = sqrt(a^2 + b^2)$.
        - Hai đường tiệm cận: $y = plus.minus b / a x$.
        - *Hệ thống định vị LORAN-C*: Hiệu thời gian sóng vô tuyến phát từ hai đài phát cố định là hằng số, giúp tàu xác định vị trí trên đường Hypebol.
        - *Tháp giải nhiệt hạt nhân*: Hình khối Hypeboloid chịu lực gió cực tốt.
      ]
    ]
  )
]

#lt-slide-back(title: "🔦 Đường Parabol (Parabola)")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Định nghĩa & Phương trình chính tắc")[
        Tập hợp các điểm $M$ cách đều một điểm $F$ (tiêu điểm) và một đường thẳng $Delta$ (đường chuẩn) cố định:
        $ d(M, F) = d(M, Delta) $
        - Khoảng cách $p > 0$ từ $F$ đến $Delta$ gọi là *tham số tiêu*.
        - Phương trình chính tắc:
        $ y^2 = 2p x quad (p > 0) $
        - Tiêu điểm $F(p/2; 0)$ và đường chuẩn $Delta: x = -p/2$.
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[🔦 Tính Chất Phản Xạ Quang Học Parabol]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Mọi tia sáng đi qua tiêu điểm $F$ khi chạm vào gương Parabol đều *phản xạ thành chùm tia song song với trục đối xứng*.
          - *Đèn pha ô tô & Đèn pin*: Bóng đèn đặt tại $F$ chiếu tia sáng thẳng tắp, soi xa hàng trăm mét!
          - *Ăng-ten chảo vệ tinh*: Chùm sóng song song từ vũ trụ được chảo parabol phản xạ hội tụ trọn vẹn vào bộ thu tại $F$!
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
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VII BÀI 4],
  questions: (
    (num: 1, type: "TN", desc: [Tiêu điểm của Elip]),
    (num: 2, type: "TN", desc: [Độ dài các trục của Elip]),
    (num: 3, type: "TN", desc: [Lập PT chính tắc Elip]),
    (num: 4, type: "TN", desc: [Tiêu cự của Hypebol]),
    (num: 5, type: "TN", desc: [Đường tiệm cận Hypebol]),
    (num: 6, type: "TN", desc: [Tiêu điểm của Parabol]),
    (num: 7, type: "DS", desc: [Đúng/Sai khảo sát Elip]),
    (num: 8, type: "TLN", desc: [Độ dài trục thực Hypebol]),
    (num: 9, type: "TLN", desc: [Tiêu cự ăng-ten chảo vệ tinh]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Tọa độ các tiêu điểm của Elip $(E): x^2 / 25 + y^2 / 9 = 1$ là:],
  (
    [$F_1(-4; 0)$ và $F_2(4; 0)$],
    [$F_1(-5; 0)$ và $F_2(5; 0)$],
    [$F_1(0; -4)$ và $F_2(0; 4)$],
    [$F_1(-3; 0)$ và $F_2(3; 0)$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 24A — Xác Định Tiêu Điểm Của Đường Elip",
  loigiai: [
    Ta có $a^2 = 25$ và $b^2 = 9$.\
    $c = sqrt(a^2 - b^2) = sqrt(25 - 9) = sqrt(16) = 4$.\
    Vì $a > b$ nên hai tiêu điểm nằm trên trục hoành: $F_1(-4; 0)$ và $F_2(4; 0)$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Độ dài trục lớn và độ dài trục nhỏ của Elip $(E): x^2 / 16 + y^2 / 4 = 1$ lần lượt là:],
  (
    [$8$ và $4$],
    [$4$ và $2$],
    [$16$ và $4$],
    [$8$ và $2$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 24A — Xác Định Độ Dài Trục Lớn Và Trục Nhỏ Của Elip",
  loigiai: [
    Ta có $a^2 = 16 ==> a = 4$ và $b^2 = 4 ==> b = 2$.\
    Độ dài trục lớn: $2a = 2(4) = 8$.\
    Độ dài trục nhỏ: $2b = 2(2) = 4$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Phương trình chính tắc của Elip có độ dài trục lớn bằng $10$ và tiêu cự bằng $6$ là:],
  (
    [$x^2 / 25 + y^2 / 16 = 1$],
    [$x^2 / 100 + y^2 / 36 = 1$],
    [$x^2 / 25 + y^2 / 9 = 1$],
    [$x^2 / 16 + y^2 / 9 = 1$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 24A — Lập Phương Trình Chính Tắc Của Elip",
  loigiai: [
    Trục lớn: $2a = 10 ==> a = 5 ==> a^2 = 25$.\
    Tiêu cự: $2c = 6 ==> c = 3 ==> c^2 = 9$.\
    Ta có $b^2 = a^2 - c^2 = 25 - 9 = 16$.\
    Phương trình chính tắc của Elip là: $x^2 / 25 + y^2 / 16 = 1$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Tiêu cự của Hypebol $(H): x^2 / 16 - y^2 / 9 = 1$ bằng:],
  (
    [$10$],
    [$5$],
    [$8$],
    [$6$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 24A — Xác Định Tiêu Cự Của Đường Hypebol",
  loigiai: [
    Ta có $a^2 = 16$ và $b^2 = 9$.\
    Trong Hypebol: $c^2 = a^2 + b^2 = 16 + 9 = 25 ==> c = 5$.\
    Tiêu cự của Hypebol là: $2c = 2(5) = 10$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Phương trình các đường tiệm cận của Hypebol $(H): x^2 / 9 - y^2 / 16 = 1$ là:],
  (
    [$y = plus.minus 4/3 x$],
    [$y = plus.minus 3/4 x$],
    [$y = plus.minus 16/9 x$],
    [$y = plus.minus 9/16 x$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 24A — Xác Định Đường Tiệm Cận Của Hypebol",
  loigiai: [
    Ta có $a^2 = 9 ==> a = 3$ và $b^2 = 16 ==> b = 4$.\
    Phương trình hai đường tiệm cận của Hypebol $x^2/a^2 - y^2/b^2 = 1$ là:\
    $y = plus.minus b / a x = plus.minus 4/3 x$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Tọa độ tiêu điểm $F$ của Parabol $(P): y^2 = 8x$ là:],
  (
    [$F(2; 0)$],
    [$F(4; 0)$],
    [$F(8; 0)$],
    [$F(0; 2)$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 24A — Xác Định Tiêu Điểm Của Parabol",
  loigiai: [
    Phương trình chính tắc Parabol có dạng $y^2 = 2p x$.\
    So sánh với $y^2 = 8x ==> 2p = 8 ==> p = 4$.\
    Tọa độ tiêu điểm: $F(p/2; 0) = F(4/2; 0) = F(2; 0)$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Cho Elip $(E): x^2 / 25 + y^2 / 16 = 1$. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Độ dài trục lớn của Elip $(E)$ bằng $10$.], "true": true),
    (body: [Độ dài tiêu cự của Elip $(E)$ bằng $6$.], "true": true),
    (body: [Tọa độ hai tiêu điểm là $F_1(0; -3)$ và $F_2(0; 3)$.], "true": false),
    (body: [Điểm $M(5; 0)$ là một đỉnh của Elip $(E)$.], "true": true),
  ),
  num: 7,
  de: "Đề 24A — Khảo Sát Toàn Diện Các Yếu Tố Của Elip",
  loigiai: [
    - a) *Đ:* $a^2 = 25 ==> a = 5 ==> 2a = 10$.
    - b) *Đ:* $c^2 = a^2 - b^2 = 25 - 16 = 9 ==> c = 3 ==> 2c = 6$.
    - c) *S:* Vì $a > b$ nên hai tiêu điểm nằm trên trục hoành: $F_1(-3; 0), F_2(3; 0)$.
    - d) *Đ:* Với $y = 0 ==> x^2 = 25 ==> x = plus.minus 5$, đỉnh $A_2(5; 0) in (E)$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Cho Hypebol $(H): x^2 / 144 - y^2 / 25 = 1$. Độ dài trục thực của Hypebol bằng bao nhiêu?],
  "24",
  num: 8,
  de: "Đề 24A — Xác Định Độ Dài Trục Thực Của Hypebol",
  loigiai: [
    1. Phương trình chính tắc $x^2 / a^2 - y^2 / b^2 = 1$ có $a^2 = 144 ==> a = 12$.\
    2. Độ dài trục thực của Hypebol được tính bởi công thức:\
       $2a = 2(12) = 24$.\
    3. Đáp số: *$24$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Một ăng-ten chảo vệ tinh có mặt cắt đi qua trục đối xứng là một đường Parabol $y^2 = 40x$ (đơn vị: centimét). Bộ thu tín hiệu phải được đặt đúng tại tiêu điểm $F$ của Parabol. Khoảng cách từ đỉnh của chảo đến bộ thu tín hiệu bằng bao nhiêu centimét?],
  "10",
  num: 9,
  de: "Đề 24A — Ứng Dụng Tiêu Điểm Parabol Trong Ăng-ten Vệ Tinh",
  loigiai: [
    1. Phương trình chính tắc Parabol $y^2 = 2p x$ có đỉnh tại gốc tọa độ $O(0; 0)$.\
    2. Ta có $2p = 40 ==> p = 20 " (cm)"$.\
    3. Bộ thu tín hiệu đặt tại tiêu điểm $F(p/2; 0) = F(10; 0)$.\
    4. Khoảng cách từ đỉnh $O(0; 0)$ đến bộ thu tín hiệu $F$ chính là:\
       $O F = p / 2 = 20 / 2 = 10 " (cm)"$.\
    5. Đáp số: *$10$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN IV: TỔNG KẾT & CỘT MỐC BÀI HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Tổng Kết & Cột Mốc])

#lt-slide-back(title: "🗺️ Bảng So Sánh Toàn Diện Ba Đường Conic")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: 10pt,
        [
          #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 7pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#1d4ed8"))[1. Elip (Ellipse)]\
            #v(0.1em)
            $x^2 / a^2 + y^2 / b^2 = 1$ ($a > b$)\
            $c^2 = a^2 - b^2$\
            $M F_1 + M F_2 = 2a$\
            Tâm sai $e = c/a < 1$
          ]
        ],
        [
          #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 7pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#a16207"))[2. Hypebol]\
            #v(0.1em)
            $x^2 / a^2 - y^2 / b^2 = 1$\
            $c^2 = a^2 + b^2$\
            $|M F_1 - M F_2| = 2a$\
            Tiệm cận: $y = plus.minus b/a x$
          ]
        ],
        [
          #block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#a855f7"), inset: 7pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#7e22ce"))[3. Parabol]\
            #v(0.1em)
            $y^2 = 2p x$ ($p > 0$)\
            Tiêu điểm $F(p/2; 0)$\
            Đường chuẩn $x = -p/2$\
            $d(M, F) = d(M, Delta)$
          ]
        ]
      )
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Bài 22!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 18pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 20pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC BÀI 22!]\
      #v(0.5em)
      #text(size: 11pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn toàn các công thức & ứng dụng của:\
        *Đường Elip, Đường Hypebol và Đường Parabol trong mặt phẳng tọa độ.*
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
