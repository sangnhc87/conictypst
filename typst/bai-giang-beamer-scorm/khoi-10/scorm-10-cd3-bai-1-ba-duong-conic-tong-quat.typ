#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Ba Đường Conic Và Định Nghĩa Tổng Quát],
  subtitle: [TOÁN 10 — CHUYÊN ĐỀ HỌC TẬP: CHUYÊN ĐỀ 3],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#4f46e5"),
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
// PHẦN I: ĐỊNH NGHĨA TỔNG QUÁT BA ĐƯỜNG CONIC
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia-chung", "🔍", [I. Định Nghĩa Tổng Quát Về Đường Conic])

#lt-slide-back(title: "🔍 Định nghĩa chung thông qua tâm sai")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Tâm sai và Đường chuẩn")[
        Cho điểm $F$ cố định (tiêu điểm) và đường thẳng $Delta$ cố định (đường chuẩn) sao cho $F in.not Delta$.
        Cho một số thực dương $e$ (tâm sai).
        
        Tập hợp các điểm $M$ sao cho tỉ số khoảng cách từ $M$ đến $F$ và khoảng cách từ $M$ đến $Delta$ luôn bằng $e$ được gọi là một *đường conic*.
        $ (M F) / (d(M, Delta)) = e $
      ]
      
      #lt-important(title: "Phân loại đường conic")[
        - Nếu $0 < e < 1$: Đường conic là đường *Elip*.
        - Nếu $e = 1$: Đường conic là đường *Parabol*.
        - Nếu $e > 1$: Đường conic là đường *Hypebol*.
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#6d28d9"), inset: 9pt, radius: 7pt)[
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            // Directrix Delta
            line((-2.5, -1.8), (-2.5, 1.8), stroke: 1.5pt + rgb("4f46e5"))
            content((-2.5, 2.0), text(size: 7.5pt, fill: rgb("4f46e5"), weight: "bold")[$Delta$])
            // Focus F
            circle((0.8, 0), radius: 0.08, fill: rgb("4f46e5"))
            content((0.8, -0.3), text(size: 7.5pt, weight: "bold")[$F$])
            // Point M
            circle((-0.5, 1.1), radius: 0.08, fill: rgb("dc2626"))
            content((-0.5, 1.35), text(size: 7.5pt, weight: "bold")[$M$])
            // MF and MH
            line((-0.5, 1.1), (0.8, 0), stroke: 1pt + rgb("dc2626"))
            line((-0.5, 1.1), (-2.5, 1.1), stroke: (paint: rgb("dc2626"), dash: "dashed"))
            circle((-2.5, 1.1), radius: 0.06, fill: rgb("4f46e5"))
            content((-2.8, 1.1), text(size: 7.5pt)[$H$])
            // Right angle mark at H
            line((-2.5, 0.95), (-2.35, 0.95), stroke: 0.6pt)
            line((-2.35, 0.95), (-2.35, 1.1), stroke: 0.6pt)
            // Ellipse arc
            arc((0, 0), start: 40deg, stop: 200deg, radius: 1.5, stroke: 1.2pt + rgb("4f46e5"))
          })
        ]
        #text(size: 8.5pt)[
          *Hình học:* Tỉ số độ dài $M F$ và $M H$ là hằng số $e$.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: ĐƯỜNG CHUẨN CỦA ELIP & HYPEBOL
// ════════════════════════════════════════════════
#lt-section-link("sec-duong-chuan-elip", "🎯", [II. Đường Chuẩn của Elip và Hypebol])

#lt-slide-back(title: "🎯 Đường chuẩn của Elip và Hypebol")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Công thức Đường Chuẩn")[
        Xét Elip hoặc Hypebol có phương trình chính tắc (với $c = sqrt(|a^2 plus.minus b^2|)$). Tâm sai $e = c / a$.
        
        Tương ứng với hai tiêu điểm $F_1(-c, 0)$ và $F_2(c, 0)$, ta có hai *đường chuẩn* lần lượt là:
        $ Delta_1: x = -a / e = -a^2 / c $
        $ Delta_2: x = a / e = a^2 / c $
      ]
      #lt-tip(title: "Khoảng cách")[
        Khoảng cách giữa hai đường chuẩn là:
        $ d(Delta_1, Delta_2) = 2 a^2 / c $
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 10.5pt)[Ví dụ: Elip $x^2 / 25 + y^2 / 16 = 1$]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Ta có $a = 5, b = 4 => c = sqrt(25 - 16) = 3$.
          - Tâm sai $e = 3/5$.
          - Phương trình hai đường chuẩn là:
          $ x = plus.minus a^2 / c = plus.minus 25 / 3 $
          Khoảng cách giữa hai đường chuẩn: $50 / 3$.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: ĐƯỜNG CHUẨN CỦA PARABOL
// ════════════════════════════════════════════════
#lt-section-link("sec-duong-chuan-parabol", "☄️", [III. Đường Chuẩn của Parabol])

#lt-slide-back(title: "☄️ Đường chuẩn của Parabol")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Đường chuẩn Parabol")[
        Parabol $(P)$ có phương trình chính tắc:
        $ y^2 = 2 p x quad (p > 0) $
        Theo định nghĩa, Parabol có tâm sai $e = 1$.
        - Tiêu điểm: $F(p / 2, 0)$
        - Đường chuẩn: $Delta: x = -p / 2$
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#22c55e"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 10.5pt)[Ví dụ: Parabol $y^2 = 12 x$]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Ta có $2p = 12 => p = 6$.
          - Tiêu điểm: $F(3, 0)$.
          - Đường chuẩn: $Delta: x = -3$ hay $x + 3 = 0$.
          - Mọi điểm $M$ thuộc Parabol đều có $M F = d(M, Delta)$.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [IV. Luyện tập: Trắc nghiệm Tổng Quát Conic])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHUYÊN ĐỀ 3 BÀI 1],
  questions: (
    ( type: "TN", desc: [Định nghĩa tổng quát đường conic tâm sai e < 1]),
    ( type: "TN", desc: [Đường chuẩn tương ứng tiêu điểm F2 của Elip]),
    ( type: "TN", desc: [Tâm sai của Elip]),
    ( type: "TN", desc: [Khoảng cách giữa 2 đường chuẩn Elip]),
    ( type: "TN", desc: [Tiêu điểm và đường chuẩn Parabol]),
    ( type: "DS", desc: [Phân tích Elip 1]),
    ( type: "DS", desc: [Phân tích Parabol 1]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(num: 1, [Cho tiêu điểm $F$, đường chuẩn $Delta$ ($F in.not Delta$) và số thực dương $e$. Tập hợp tất cả các điểm $M$ thỏa mãn tỉ số $(M F) / (d(M, Delta)) = e$ được gọi là một đường conic có tâm sai $e$. Khi $0 < e < 1$, đường conic đó là],
    (
        [Đường Parabol],
        [Đường Elip],
        [Đường Hypebol],
        [Đường tròn]
    ),
    correct: 2,
    loigiai: [
        Theo định nghĩa tổng quát đường Conic:
        - $0 < e < 1$: Đường Elip.
        - $e = 1$: Đường Parabol.
        - $e > 1$: Đường Hypebol.
    ]
)

#lt-tn(num: 2, [Cho elip $(E)$ có phương trình chính tắc $x^2 / a^2 + y^2 / b^2 = 1$ ($a > b > 0$). Đặt $c = sqrt(a^2 - b^2)$ và tâm sai $e = c / a$. Phương trình đường chuẩn $Delta_2$ tương ứng với tiêu điểm bên phải $F_2(c, 0)$ là],
    (
        [$x = a^2 / c$],
        [$x = c^2 / a$],
        [$x = a / c$],
        [$x = c / a$]
    ),
    correct: 1,
    loigiai: [
        Với elip $x^2 / a^2 + y^2 / b^2 = 1$, hai đường chuẩn có phương trình:
        - $Delta_1: x = -a / e = -a^2 / c$ (ứng với $F_1$).
        - $Delta_2: x = a / e = a^2 / c$ (ứng với $F_2$).
    ]
)

#lt-tn(num: 3, [Tâm sai $e$ của elip $(E): x^2 / 25 + y^2 / 9 = 1$ bằng],
    (
        [$3 / 5$],
        [$4 / 5$],
        [$5 / 4$],
        [$4 / 3$]
    ),
    correct: 2,
    loigiai: [
        Ta có $a^2 = 25 => a = 5$, $b^2 = 9 => b = 3$.
        $ c = sqrt(a^2 - b^2) = sqrt(25 - 9) = 4 $
        Tâm sai của elip: $e = c / a = 4 / 5$.
    ]
)

#lt-tn(num: 4, [Khoảng cách giữa hai đường chuẩn của elip $(E): x^2 / 16 + y^2 / 7 = 1$ bằng],
    (
        [$16 / 3$],
        [$8 / 3$],
        [$32 / 3$],
        [$64 / 3$]
    ),
    correct: 3,
    loigiai: [
        Ta có $a^2 = 16 => a = 4$, $b^2 = 7 => c = sqrt(16 - 7) = 3$.
        Hai đường chuẩn là $x = -a^2 / c$ và $x = a^2 / c$.
        Khoảng cách giữa hai đường chuẩn là:
        $ d(Delta_1, Delta_2) = (2 a^2) / c = (2 times 16) / 3 = 32 / 3 $
    ]
)

#lt-tn(num: 5, [Cho parabol $(P): y^2 = 8 x$. Tọa độ tiêu điểm $F$ và phương trình đường chuẩn $Delta$ của $(P)$ là],
    (
        [$F(4, 0)$ và $Delta: x = -4$],
        [$F(2, 0)$ và $Delta: x = 2$],
        [$F(0, 2)$ và $Delta: y = -2$],
        [$F(2, 0)$ và $Delta: x = -2$]
    ),
    correct: 4,
    loigiai: [
        Phương trình $y^2 = 2 p x = 8 x => 2 p = 8 => p = 4$.
        - Tiêu điểm: $F(p / 2, 0) = F(2, 0)$.
        - Đường chuẩn: $Delta: x = -p / 2 = -2$.
    ]
)

#lt-ds(num: 6, [Cho elip $(E)$ có phương trình chính tắc $x^2 / 25 + y^2 / 16 = 1$.],
  (
    [Độ dài trục lớn của elip là $2 a = 10$, độ dài trục nhỏ là $2 b = 8$.],
    [Tiêu cự của elip là $2 c = 6$.],
    [Tâm sai của elip là $e = 3 / 5 = 0.6$.],
    [Khoảng cách giữa hai đường chuẩn của elip bằng $15$.]
  ),
  correct: "1110",
  loigiai: [
    a) $a^2 = 25 => a = 5 => 2a = 10$; $b^2 = 16 => b = 4 => 2b = 8$ (ĐÚNG).
    b) $c = sqrt(25 - 16) = 3 => 2c = 6$ (ĐÚNG).
    c) $e = c / a = 3 / 5 = 0.6$ (ĐÚNG).
    d) Khoảng cách hai đường chuẩn: $d = (2 a^2) / c = 50 / 3 approx 16.67 != 15$ (SAI).
  ]
)

#lt-ds(num: 7, [Cho parabol $(P)$ có phương trình $y^2 = 12 x$.],
  (
    [Tham số tiêu của parabol là $p = 6$.],
    [Tọa độ tiêu điểm của parabol là $F(3, 0)$.],
    [Phương trình đường chuẩn của parabol là $Delta: x + 3 = 0$.],
    [Tâm sai của parabol là $e = 0.5$.]
  ),
  correct: "1110",
  loigiai: [
    a) Phương trình $y^2 = 2 p x = 12 x => 2 p = 12 => p = 6$ (ĐÚNG).
    b) Tiêu điểm: $F(p / 2, 0) = F(3, 0)$ (ĐÚNG).
    c) Đường chuẩn: $x = -p / 2 = -3 <=> x + 3 = 0$ (ĐÚNG).
    d) Mọi đường parabol đều có tâm sai cố định $e = 1$. (SAI).
  ]
)
