#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Bán Kính Qua Tiêu & Tính Chất Hình Học],
  subtitle: [TOÁN 10 — CHUYÊN ĐỀ HỌC TẬP: CHUYÊN ĐỀ 3],
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
// PHẦN I: BÁN KÍNH QUA TIÊU CỦA ELIP
// ════════════════════════════════════════════════
#lt-section-link("sec-elip", "🔵", [I. Bán Kính Qua Tiêu Của Elip])

#lt-slide-back(title: "🔵 Bán kính qua tiêu của Elip")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Công thức")[
        Cho Elip $(E): x^2 / a^2 + y^2 / b^2 = 1$ và điểm $M(x_M, y_M) in (E)$.
        Khoảng cách từ $M$ đến hai tiêu điểm $F_1, F_2$ gọi là các bán kính qua tiêu của $M$:
        - $M F_1 = a + e x_M = a + c/a x_M$
        - $M F_2 = a - e x_M = a - c/a x_M$
      ]
      #lt-important(title: "Tính chất")[
        - Tổng hai bán kính qua tiêu luôn không đổi: $M F_1 + M F_2 = 2a$.
        - Giá trị nhỏ nhất của bán kính qua tiêu là $a - c$ (tại $M(a, 0)$ hoặc $M(-a, 0)$ đối với tiêu điểm tương ứng).
        - Giá trị lớn nhất là $a + c$.
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e40af"), inset: 9pt, radius: 7pt)[
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            line((-3.2, 0), (3.2, 0), mark: (end: "stealth"), stroke: 0.8pt)
            line((0, -1.6), (0, 1.6), mark: (end: "stealth"), stroke: 0.8pt)
            content((3.4, 0), [$x$], anchor: "west")
            content((0, 1.8), [$y$], anchor: "south")
            circle((0, 0), radius: (2.2, 1.3), stroke: 1.5pt + rgb("1e40af"))
            circle((-1.4, 0), radius: 0.08, fill: rgb("1e40af"))
            content((-1.4, -0.3), text(size: 7.5pt)[$F_1$])
            circle((1.4, 0), radius: 0.08, fill: rgb("1e40af"))
            content((1.4, -0.3), text(size: 7.5pt)[$F_2$])
            circle((0.8, 1.1), radius: 0.08, fill: rgb("dc2626"))
            content((0.8, 1.35), text(size: 7.5pt, weight: "bold")[$M$])
            line((0.8, 1.1), (-1.4, 0), stroke: 1.2pt + rgb("dc2626"))
            content((-0.4, 0.7), text(size: 7.5pt, fill: rgb("dc2626"))[$M F_1$])
            line((0.8, 1.1), (1.4, 0), stroke: 1.2pt + rgb("16a34a"))
            content((1.3, 0.7), text(size: 7.5pt, fill: rgb("16a34a"))[$M F_2$])
          })
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: BÁN KÍNH QUA TIÊU CỦA PARABOL VÀ HYPEBOL
// ════════════════════════════════════════════════
#lt-section-link("sec-pb-hb", "🟠", [II. Bán Kính Qua Tiêu Của Parabol & Hypebol])

#lt-slide-back(title: "🟠 Bán kính qua tiêu Parabol và Hypebol")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Parabol")[
        Cho Parabol $(P): y^2 = 2 p x$ với tham số tiêu $p$.
        Bán kính qua tiêu của điểm $M(x_M, y_M)$ thuộc $(P)$ là khoảng cách từ $M$ đến tiêu điểm $F(p/2, 0)$:
        $ M F = x_M + p / 2 $
      ]
    ],
    [
      #lt-definition(title: "Hypebol")[
        Cho Hypebol $(H): x^2 / a^2 - y^2 / b^2 = 1$ và điểm $M(x_M, y_M) in (H)$.
        - Nếu $M$ nằm ở *nhánh phải* ($x_M >= a$):
          $ M F_1 = e x_M + a; quad M F_2 = e x_M - a $
        - Nếu $M$ nằm ở *nhánh trái* ($x_M <= -a$):
          $ M F_1 = -e x_M - a; quad M F_2 = -e x_M + a $
        - Tính chất: $|M F_1 - M F_2| = 2a$.
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Bán Kính Qua Tiêu])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHUYÊN ĐỀ 3 BÀI 2],
  questions: (
    ( type: "TN", desc: [Công thức bán kính qua tiêu Elip]),
    ( type: "TN", desc: [Tổng 2 bán kính qua tiêu Elip]),
    ( type: "TN", desc: [Công thức bán kính qua tiêu Parabol]),
    ( type: "TN", desc: [Bán kính qua tiêu Hypebol nhánh phải]),
    ( type: "TN", desc: [Tính MF1 của Elip]),
    ( type: "DS", desc: [Xét điểm trên Parabol y^2 = 12x]),
    ( type: "DS", desc: [Xét điểm trên Hypebol x^2/16 - y^2/9 = 1]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(num: 1, [Cho elip $(E): x^2 / a^2 + y^2 / b^2 = 1$ ($a > b > 0$) với tâm sai $e = c / a$. Điểm $M(x_0, y_0)$ thuộc $(E)$. Bán kính qua tiêu $M F_1$ (ứng với tiêu điểm bên trái $F_1(-c, 0)$) và $M F_2$ (ứng với tiêu điểm bên phải $F_2(c, 0)$) được xác định bởi công thức nào sau đây?],
    (
        [$M F_1 = a - e x_0$ và $M F_2 = a + e x_0$],
        [$M F_1 = c + e x_0$ và $M F_2 = c - e x_0$],
        [$M F_1 = a + (x_0) / e$ và $M F_2 = a - (x_0) / e$],
        [$M F_1 = a + e x_0$ và $M F_2 = a - e x_0$]
    ),
    correct: 4,
    loigiai: [
        Với điểm $M(x_0, y_0)$ thuộc elip, bán kính qua tiêu lần lượt là:
        - $M F_1 = a + e x_0 = a + (c / a) x_0$.
        - $M F_2 = a - e x_0 = a - (c / a) x_0$.
    ]
)

#lt-tn(num: 2, [Với mọi điểm $M$ thuộc elip $(E): x^2 / a^2 + y^2 / b^2 = 1$, tổng hai bán kính qua tiêu $M F_1 + M F_2$ luôn bằng],
    (
        [$2 b$],
        [$2 c$],
        [$2 a$],
        [$a + c$]
    ),
    correct: 3,
    loigiai: [
        $ M F_1 + M F_2 = (a + e x_0) + (a - e x_0) = 2 a $
        Tổng này không đổi và bằng độ dài trục lớn của elip.
    ]
)

#lt-tn(num: 3, [Cho parabol $(P): y^2 = 2 p x$ ($p > 0$). Bán kính qua tiêu của điểm $M(x_0, y_0)$ thuộc $(P)$ được tính bằng công thức nào sau đây?],
    (
        [$M F = y_0 + p / 2$],
        [$M F = x_0 + p / 2$],
        [$M F = x_0 - p / 2$],
        [$M F = 2 x_0 + p$]
    ),
    correct: 2,
    loigiai: [
        Với điểm $M(x_0, y_0)$ trên parabol $y^2 = 2 p x$:
        $ M F = d(M, Delta) = x_0 - (-p / 2) = x_0 + p / 2 $
    ]
)

#lt-tn(num: 4, [Cho hypebol $(H): x^2 / a^2 - y^2 / b^2 = 1$. Với điểm $M(x_0, y_0)$ nằm trên nhánh bên phải ($x_0 >= a$), các bán kính qua tiêu là],
    (
        [$M F_1 = e x_0 - a$ và $M F_2 = e x_0 + a$],
        [$M F_1 = e x_0 + a$ và $M F_2 = e x_0 - a$],
        [$M F_1 = a - e x_0$ và $M F_2 = a + e x_0$],
        [$M F_1 = e x_0$ và $M F_2 = a$]
    ),
    correct: 2,
    loigiai: [
        Trên nhánh phải ($x_0 >= a$), khoảng cách từ $M$ đến tiêu điểm bên trái lớn hơn:
        - $M F_1 = e x_0 + a$.
        - $M F_2 = e x_0 - a$.
        Hiệu $M F_1 - M F_2 = 2 a$.
    ]
)

#lt-tn(num: 5, [Cho elip $(E): x^2 / 25 + y^2 / 9 = 1$. Điểm $M$ thuộc $(E)$ có hoành độ $x_M = 2$. Bán kính qua tiêu $M F_1$ bằng],
    (
        [$3.4$],
        [$5.0$],
        [$6.6$],
        [$7.0$]
    ),
    correct: 3,
    loigiai: [
        $a = 5, b = 3 => c = sqrt(25 - 9) = 4$.
        Tâm sai $e = c / a = 4 / 5 = 0.8$.
        $ M F_1 = a + e x_M = 5 + 0.8 times 2 = 5 + 1.6 = 6.6 $
    ]
)

#lt-ds(num: 6, [Cho parabol $(P): y^2 = 12 x$ có tiêu điểm $F$. Điểm $M(x_0, y_0)$ nằm trên parabol $(P)$.],
  (
    [Tham số tiêu của parabol là $p = 6$.],
    [Bán kính qua tiêu của điểm $M$ là $M F = x_0 + 3$.],
    [Khoảng cách nhỏ nhất từ một điểm trên parabol đến tiêu điểm $F$ là $3$.],
    [Nếu điểm $M$ có $M F = 7$ thì hoành độ của $M$ là $x_0 = 5$.]
  ),
  correct: "1110",
  loigiai: [
    a) $2 p = 12 => p = 6 => p / 2 = 3$ (ĐÚNG).
    b) $M F = x_0 + p / 2 = x_0 + 3$ (ĐÚNG).
    c) Khoảng cách nhỏ nhất khi $x_0 = 0$ là $M F = 3$ (ĐÚNG).
    d) Nếu $M F = 7$ thì $x_0 + 3 = 7 <=> x_0 = 4 != 5$ (SAI).
  ]
)

#lt-ds(num: 7, [Cho hypebol $(H): x^2 / 16 - y^2 / 9 = 1$. Một điểm $M(x_0, y_0)$ nằm trên nhánh bên phải của $(H)$ ($x_0 >= 4$).],
  (
    [Tâm sai của hypebol là $e = 1.25$.],
    [Hiệu hai bán kính qua tiêu $M F_1 - M F_2 = 8$.],
    [Với điểm có hoành độ $x_0 = 8$, bán kính qua tiêu $M F_2 = 6$.],
    [Bán kính qua tiêu $M F_1$ có thể nhận giá trị bằng $3$.]
  ),
  correct: "1110",
  loigiai: [
    a) $a = 4, b = 3 => c = 5 => e = 5 / 4 = 1.25$ (ĐÚNG).
    b) $M F_1 - M F_2 = 2 a = 8$ (ĐÚNG).
    c) Với $x_0 = 8$: $M F_2 = e x_0 - a = 1.25 times 8 - 4 = 10 - 4 = 6$ (ĐÚNG).
    d) Vì $x_0 >= 4$, ta có $M F_1 = e x_0 + a >= 1.25 times 4 + 4 = 9$. Do đó $M F_1$ không thể bằng $3$ (SAI).
  ]
)
