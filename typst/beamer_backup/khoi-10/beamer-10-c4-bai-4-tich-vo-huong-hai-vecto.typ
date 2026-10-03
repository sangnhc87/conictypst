#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Tích Vô Hướng Của Hai Vectơ],
  subtitle: [TOÁN 10 — CHƯƠNG IV: GÓC GIỮA HAI VECTƠ, ĐỊNH NGHĨA, TÍNH CHẤT & CÔNG CỦA LỰC],
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
// PHẦN I: GÓC GIỮA HAI VECTƠ
// ════════════════════════════════════════════════
#lt-section-link("sec-goc-giua-hai-vecto", "📐", [I. Góc Giữa Hai Vectơ])

#lt-slide-back(title: "📐 Định Nghĩa Góc Giữa Hai Vectơ")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Định nghĩa góc giữa hai vectơ")[
        Cho hai vectơ $arrow(a)$ và $arrow(b)$ đều khác $arrow(0)$. Từ một điểm $O$ tùy ý, vẽ $arrow(O A) = arrow(a)$ và $arrow(O B) = arrow(b)$.
        Khi đó, góc $hat(A O B)$ với số đo từ $0^degree$ đến $180^degree$ được gọi là *góc giữa hai vectơ* $arrow(a)$ và $arrow(b)$, kí hiệu là $(arrow(a), arrow(b))$.
      ]
      #v(0.2em)
      #lt-important(title: "Quy ước & Tính chất")[
        - $0^degree <= (arrow(a), arrow(b)) <= 180^degree$.
        - $(arrow(a), arrow(b)) = (arrow(b), arrow(a))$.
        - Nếu $arrow(a), arrow(b)$ cùng hướng $=> (arrow(a), arrow(b)) = 0^degree$.
        - Nếu $arrow(a), arrow(b)$ ngược hướng $=> (arrow(a), arrow(b)) = 180^degree$.
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Dựng Góc Từ Gốc Chung $O$]
          #v(0.3em)
          #cetz.canvas({
            import cetz.draw: *
            let O = (0, 0)
            let A = (3.0, 0)
            let B = (2.0, 1.8)

            // Tia OA, OB
            line(O, A, mark: (end: "stealth", fill: rgb("#2563eb")), stroke: 2pt + rgb("#2563eb"))
            line(O, B, mark: (end: "stealth", fill: rgb("#d81b60")), stroke: 2pt + rgb("#d81b60"))

            // Cung góc
            arc(O, radius: 0.8, start: 0deg, stop: 42deg, stroke: 1.5pt + rgb("#16a34a"))

            circle(O, radius: 2.5pt, fill: black)
            content((-0.2, -0.2), text(size: 9pt, weight: "bold")[$O$])
            content((1.8, -0.25), text(size: 9.5pt, fill: rgb("#2563eb"), weight: "bold")[$arrow(a)$])
            content((0.8, 1.1), text(size: 9.5pt, fill: rgb("#d81b60"), weight: "bold")[$arrow(b)$])
            content((1.1, 0.35), text(size: 9pt, fill: rgb("#16a34a"), weight: "bold")[$alpha$])
          })
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "⚠️ Cạm Bẫy Sư Phạm: Góc Giữa Hai Vectơ Nối Tiếp")[
  #lt-warning(title: "Bẫy góc kinh điển trong tam giác đều")[
    Cho tam giác $A B C$ đều. Nhiều học sinh hay nhầm lẫn:
    $ (arrow(A B), arrow(B C)) = 60^degree quad cancel((S A I !)) $
  ]
  #v(0.2em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"))[Cách xác định đúng:]\
        - Hai vectơ chưa chung gốc! Ta phải tịnh tiến đưa về chung gốc $B$:
        $arrow(A B) = arrow(B B')$ (với $B'$ nằm trên tia đối của $B A$).\
        - Khi đó:
        $ (arrow(A B), arrow(B C)) = (arrow(B B'), arrow(B C)) = 180^degree - 60^degree = 120^degree $
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#ef4444"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"))[Công thức tổng quát khi đổi đầu mút:]\
        - $(arrow(A B), arrow(A C)) = hat(A)$. (Chung gốc)\
        - $(arrow(A B), arrow(C A)) = 180^degree - hat(A)$. (Một vectơ bị đảo đầu)\
        - $(arrow(B A), arrow(C A)) = hat(A)$. (Cả hai cùng bị đảo đầu)
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: ĐỊNH NGHĨA TÍCH VÔ HƯỚNG
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia-tich-vo-huong", "💥", [II. Định Nghĩa Tích Vô Hướng])

#lt-slide-back(title: "💥 Định Nghĩa Tích Vô Hướng Của Hai Vectơ")[
  #lt-definition(title: "Định nghĩa tích vô hướng")[
    Cho hai vectơ $arrow(a)$ và $arrow(b)$ đều khác vectơ-không.
    *Tích vô hướng* của $arrow(a)$ và $arrow(b)$ là một *số thực*, kí hiệu là $arrow(a) dot arrow(b)$, được xác định bởi:
    $ arrow(a) dot arrow(b) = |arrow(a)| dot |arrow(b)| dot cos(arrow(a), arrow(b)) $
    Quy ước: Nếu $arrow(a) = arrow(0)$ hoặc $arrow(b) = arrow(0)$ thì $arrow(a) dot arrow(b) = 0$.
  ]
  #v(0.3em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#22c55e"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#15803d"))[Góc nhọn ($0^degree <= alpha < 90^degree$)]\
        $cos alpha > 0$\
        $=> arrow(a) dot arrow(b) > 0$
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#a16207"))[Góc vuông ($alpha = 90^degree$)]\
        $cos 90^degree = 0$\
        $=> arrow(a) dot arrow(b) = 0$
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#ef4444"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"))[Góc tù ($90^degree < alpha <= 180^degree$)]\
        $cos alpha < 0$\
        $=> arrow(a) dot arrow(b) < 0$
      ]
    ]
  )
]

#lt-slide-back(title: "🎯 Bình Phương Vô Hướng & Điều Kiện Vuông Góc")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-important(title: "Bình phương vô hướng")[
        Khi $arrow(a) = arrow(b)$, góc giữa chúng bằng $0^degree$ ($cos 0^degree = 1$):
        $ arrow(a)^2 = arrow(a) dot arrow(a) = |arrow(a)| dot |arrow(a)| dot 1 = |arrow(a)|^2 $
        *Bình phương vô hướng bằng bình phương độ dài!*
        $ arrow(a)^2 = |arrow(a)|^2 >= 0 $
        $ |arrow(a)| = sqrt(arrow(a)^2) $
      ]
    ],
    [
      #lt-theorem(title: "Điều kiện hai vectơ vuông góc")[
        Với hai vectơ khác $arrow(0)$, ta có:
        $ arrow(a) perp arrow(b) <=> arrow(a) dot arrow(b) = 0 $
        #v(0.2em)
        #text(size: 10pt)[
          *Ứng dụng vàng:* Muốn chứng minh hai đường thẳng vuông góc $A B perp C D$, ta chỉ cần chứng minh tích vô hướng của hai vectơ chỉ phương bằng 0:
          $ arrow(A B) dot arrow(C D) = 0 $
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: CÁC TÍNH CHẤT CỦA TÍCH VÔ HƯỚNG
// ════════════════════════════════════════════════
#lt-section-link("sec-tinh-chat-tich-vo-huong", "⚡", [III. Các Tính Chất Của Tích Vô Hướng])

#lt-slide-back(title: "⚡ Các Tính Chất Đại Số Của Tích Vô Hướng")[
  #lt-theorem(title: "Hệ thống tính chất")[
    Với ba vectơ $arrow(a), arrow(b), arrow(c)$ tùy ý và mọi số thực $k$, ta có:
  ]
  #v(0.2em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    row-gutter: 8pt,
    [
      #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1e3a8a"))[1. Giao hoán:]
        $ arrow(a) dot arrow(b) = arrow(b) dot arrow(a) $
      ]
    ],
    [
      #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1e3a8a"))[2. Phân phối với phép cộng:]
        $ arrow(a) dot (arrow(b) + arrow(c)) = arrow(a) dot arrow(b) + arrow(a) dot arrow(c) $
      ]
    ],
    [
      #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1e3a8a"))[3. Kết hợp với số thực:]
        $ (k arrow(a)) dot arrow(b) = k (arrow(a) dot arrow(b)) = arrow(a) dot (k arrow(b)) $
      ]
    ],
    [
      #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1e3a8a"))[4. Hằng đẳng thức đáng nhớ:]
        $ (arrow(a) +- arrow(b))^2 = arrow(a)^2 +- 2 arrow(a) dot arrow(b) + arrow(b)^2 $
        $ (arrow(a) + arrow(b))(arrow(a) - arrow(b)) = arrow(a)^2 - arrow(b)^2 $
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: CÔNG THỨC TÍNH GÓC & ỨNG DỤNG VẬT LÍ
// ════════════════════════════════════════════════
#lt-section-link("sec-ung-dung-vat-li", "🚀", [IV. Công Thức Tính Góc & Ứng Dụng Vật Lí])

#lt-slide-back(title: "🚀 Tính Góc & Công Cơ Học Trong Vật Lí")[
  #lt-two-col(
    ratio: (48%, 52%),
    [
      #lt-important(title: "Công thức tính cosin góc")[
        Từ định nghĩa tích vô hướng, ta suy ra công thức tính góc giữa hai vectơ khác $arrow(0)$:
        $ cos(arrow(a), arrow(b)) = (arrow(a) dot arrow(b)) / (|arrow(a)| dot |arrow(b)|) $
        #v(0.2em)
        #text(size: 10pt)[
          Nhờ công thức này, ta có thể tính được góc giữa hai đường thẳng trong không gian và mặt phẳng!
        ]
      ]
    ],
    [
      #lt-example(title: "Liên môn: Công của một lực (Vật lí 10)")[
        Khi một lực không đổi $arrow(F)$ tác dụng làm chất điểm chuyển dời một quãng đường theo vectơ $arrow(d)$, công sinh ra là:
        $ A = arrow(F) dot arrow(d) = |arrow(F)| dot |arrow(d)| dot cos alpha $
        (trong đó $alpha = (arrow(F), arrow(d))$ là góc tạo bởi lực kéo và hướng dịch chuyển).
        - $alpha < 90^degree => A > 0$: *Công phát động*.
        - $alpha = 90^degree => A = 0$: Lực *không sinh công*.
        - $alpha > 90^degree => A < 0$: *Công cản* (như lực ma sát).
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP TRẮC NGHIỆM CHỌN 1 ĐÁP ÁN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "✍️", [V. Luyện tập: Trắc nghiệm 4 phương án])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — TÍCH VÔ HƯỚNG CỦA HAI VECTƠ],
  questions: (
    (num: 1, type: "TN", desc: [Góc Giữa Hai Vectơ Nối Đuôi]),
    (num: 2, type: "TN", desc: [Tích Vô Hướng Tam Giác Đều]),
    (num: 3, type: "TN", desc: [Hai Vectơ Vuông Góc]),
    (num: 4, type: "TN", desc: [Tích Vô Hướng Tam Giác Vuông]),
    (num: 5, type: "TN", desc: [Dấu Của Tích Vô Hướng]),
    (num: 6, type: "TN", desc: [Ứng Dụng Vật Lí Tính Công]),
    (num: 7, type: "DS", desc: [Đúng/Sai Tích Vô Hướng Tam Giác Đều]),
    (num: 8, type: "TLN", desc: [Tính Độ Dài Vectơ Tổng Bằng Tích Vô Hướng]),
    (num: 9, type: "TLN", desc: [Công Cơ Học Liên Môn Vật Lí]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho tam giác đều $A B C$. Góc giữa hai vectơ $arrow(A B)$ và $arrow(B C)$ bằng:],
  (
    [$60^degree$],
    [$120^degree$],
    [$30^degree$],
    [$90^degree$],
  ),
  correct: 2,
  num: 1,
  de: "Đề 10A — Góc Giữa Hai Vectơ Nối Đuôi",
  loigiai: [
    Tịnh tiến $arrow(A B)$ thành $arrow(B B')$ thì $(arrow(A B), arrow(B C)) = (arrow(B B'), arrow(B C))$.\
    Vì $B'$ nằm trên tia đối của tia $B A$ nên góc này bù với góc trong $hat(A B C) = 60^degree$.\
    $arrow (arrow(A B), arrow(B C)) = 180^degree - 60^degree = 120^degree$. Chọn đáp án *B: 120°*.
  ]
)

#lt-tn(
  [Cho tam giác đều $A B C$ cạnh $a$. Tích vô hướng $arrow(A B) dot arrow(A C)$ bằng:],
  (
    [$a^2$],
    [$a^2 / 2$],
    [$- a^2 / 2$],
    [$(a^2 sqrt(3)) / 2$],
  ),
  correct: 2,
  num: 2,
  de: "Đề 10A — Tích Vô Hướng Tam Giác Đều",
  loigiai: [
    Áp dụng công thức định nghĩa tích vô hướng:\
    $arrow(A B) dot arrow(A C) = |arrow(A B)| dot |arrow(A C)| dot cos(arrow(A B), arrow(A C))$.\
    Vì tam giác đều nên độ dài bằng $a$ và góc $hat(B A C) = 60^degree$.\
    $arrow(A B) dot arrow(A C) = a dot a dot cos 60^degree = a^2 dot 1/2 = a^2 / 2$. Chọn đáp án *B*.
  ]
)

#lt-tn(
  [Cho hình vuông $A B C D$ cạnh $a$. Tích vô hướng $arrow(A B) dot arrow(A D)$ bằng:],
  (
    [$0$],
    [$a^2$],
    [$a^2 sqrt(2)$],
    [$2 a^2$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 10B — Hai Vectơ Vuông Góc",
  loigiai: [
    Vì $A B C D$ là hình vuông nên $A B perp A D <=> (arrow(A B), arrow(A D)) = 90^degree$.\
    Tích vô hướng: $arrow(A B) dot arrow(A D) = a dot a dot cos 90^degree = a^2 dot 0 = 0$.\
    Chọn đáp án *A: 0*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ vuông tại $A$ có cạnh $A B = 3$ và $A C = 4$. Tích vô hướng $arrow(B A) dot arrow(B C)$ bằng:],
  (
    [$9$],
    [$12$],
    [$15$],
    [$0$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 10B — Tích Vô Hướng Tam Giác Vuông",
  loigiai: [
    Cạnh huyền $B C = sqrt(A B^2 + A C^2) = sqrt(3^2 + 4^2) = 5$.\
    Trong tam giác vuông tại $A$: $cos B = (A B) / (B C) = 3/5$.\
    Tích vô hướng: $arrow(B A) dot arrow(B C) = |arrow(B A)| dot |arrow(B C)| dot cos B = 3 dot 5 dot 3/5 = 9$.\
    Chọn đáp án *A: 9*.
  ]
)

#lt-tn(
  [Cho hai vectơ khác vectơ-không $arrow(u)$ và $arrow(v)$ thỏa mãn $arrow(u) dot arrow(v) < 0$. Khi đó góc giữa hai vectơ $arrow(u)$ và $arrow(v)$ là:],
  (
    [Góc nhọn],
    [Góc vuông],
    [Góc tù],
    [Góc bẹt],
  ),
  correct: 3,
  num: 5,
  de: "Đề 10C — Dấu Của Tích Vô Hướng",
  loigiai: [
    Ta có $arrow(u) dot arrow(v) = |arrow(u)| dot |arrow(v)| dot cos(arrow(u), arrow(v))$.\
    Vì $|arrow(u)| > 0$ và $|arrow(v)| > 0$ nên $arrow(u) dot arrow(v) < 0 <=> cos(arrow(u), arrow(v)) < 0$.\
    Do $0^degree <= alpha <= 180^degree$, điều kiện $cos alpha < 0 <=> 90^degree < alpha <= 180^degree$ (góc tù). Chọn *C*.
  ]
)

#lt-tn(
  [Một người kéo một thùng hàng di chuyển trên mặt đất nằm ngang quãng đường $s = 10$ m bằng một lực kéo có độ lớn $F = 50$ N hợp với phương ngang một góc $60^degree$. Công sinh ra bởi lực kéo bằng:],
  (
    [$500$ J],
    [$250$ J],
    [$250 sqrt(3)$ J],
    [$50$ J],
  ),
  correct: 2,
  num: 6,
  de: "Đề 10C — Ứng Dụng Vật Lí Tính Công",
  loigiai: [
    Áp dụng công thức tính công của một lực:\
    $A = arrow(F) dot arrow(d) = |arrow(F)| dot |arrow(d)| dot cos 60^degree = 50 dot 10 dot 1/2 = 250$ J.\
    Chọn đáp án *B: 250 J*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: BÀI TẬP ĐÚNG / SAI & TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [VI. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho tam giác đều $A B C$ cạnh bằng $a$, đường cao $A H$. Xét tính Đúng / Sai của các khẳng định sau:],
  (
    (body: [Góc giữa hai vectơ $(arrow(A B), arrow(A C)) = 60^degree$.], "true": true),
    (body: [Góc giữa hai vectơ $(arrow(A B), arrow(B C)) = 60^degree$.], "true": false),
    (body: [Tích vô hướng $arrow(A B) dot arrow(A C) = a^2 / 2$.], "true": true),
    (body: [Đẳng thức $arrow(A H) dot arrow(B C) = 0$ luôn đúng.], "true": true),
  ),
  de: "Đề 10D — Đúng/Sai Tích Vô Hướng Tam Giác Đều",
  num: 7,
  loigiai: [
    - a) *Đ:* $hat(B A C) = 60^degree => (arrow(A B), arrow(A C)) = 60^degree$.
    - b) *S:* Đưa về chung gốc $B$ ta có $(arrow(A B), arrow(B C)) = 180^degree - 60^degree = 120^degree$.
    - c) *Đ:* $arrow(A B) dot arrow(A C) = a dot a dot cos 60^degree = a^2 / 2$.
    - d) *Đ:* Đường cao $A H perp B C => (arrow(A H), arrow(B C)) = 90^degree => arrow(A H) dot arrow(B C) = 0$.
  ]
)

#lt-tln(
  [Cho hai vectơ $arrow(a)$ và $arrow(b)$ có độ dài lần lượt là $|arrow(a)| = 3$, $|arrow(b)| = 5$ và góc giữa hai vectơ bằng $60^degree$. Độ dài của vectơ tổng $|arrow(a) + arrow(b)|$ bằng bao nhiêu?],
  [7],
  num: 8,
  de: "Đề 10E — Tính Độ Dài Vectơ Tổng Bằng Tích Vô Hướng",
  loigiai: [
    Sử dụng bình phương vô hướng:\
    $|arrow(a) + arrow(b)|^2 = (arrow(a) + arrow(b))^2 = arrow(a)^2 + 2 arrow(a) dot arrow(b) + arrow(b)^2$.\
    $arrow(a) dot arrow(b) = 3 dot 5 dot cos 60^degree = 15 dot 1/2 = 7.5$.\
    $=> |arrow(a) + arrow(b)|^2 = 3^2 + 2(7.5) + 5^2 = 9 + 15 + 25 = 49$.\
    Do đó độ dài: $|arrow(a) + arrow(b)| = sqrt(49) = 7$. Đáp số: *$7$*.
  ]
)

#lt-tln(
  [Một toa xe được một đầu máy kéo chuyển động thẳng đều trên đường ray nằm ngang một quãng đường $s = 20$ m bởi một lực kéo $F = 150$ N có phương hợp với phương chuyển động một góc $30^degree$. Công của lực kéo đã thực hiện bằng bao nhiêu Joule? (Làm tròn kết quả đến hàng đơn vị).],
  [2598],
  num: 9,
  de: "Đề 10F — Công Cơ Học Liên Môn Vật Lí",
  loigiai: [
    Công thực hiện bởi lực kéo:\
    $A = F dot s dot cos 30^degree = 150 dot 20 dot (sqrt(3)/2) = 1500 sqrt(3)$ J.\
    Tính giá trị: $1500 dot 1.73205 approx 2598.07$ J.\
    Làm tròn đến hàng đơn vị: *$2598$* J.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VII: TỔNG KẾT & SƠ ĐỒ TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-c4-b4", "💎", [VII. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ Ma Trận Kiến Thức Tích Vô Hướng")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. GÓC GIỮA 2 VECTƠ]
        #v(0.2em)
        #text(size: 10pt)[
          - Dựng chung gốc $O$: $hat(A O B)$.
          - $0^degree <= (arrow(a), arrow(b)) <= 180^degree$.
          - Chú ý bẫy nối đuôi: $180^degree - hat(B)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. CÔNG THỨC ĐỊNH NGHĨA]
        #v(0.2em)
        #text(size: 10pt)[
          - $arrow(a) dot arrow(b) = |arrow(a)| |arrow(b)| cos alpha$.
          - Tích vô hướng là một *số thực*.
          - Nhọn: $> 0$; Vuông: $= 0$; Tù: $< 0$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. BÌNH PHƯƠNG VÔ HƯỚNG]
        #v(0.2em)
        #text(size: 10pt)[
          - $arrow(a)^2 = |arrow(a)|^2$.
          - Bình phương vô hướng bằng bình phương độ dài.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. ĐIỀU KIỆN VUÔNG GÓC]
        #v(0.2em)
        #text(size: 10pt)[
          - $arrow(a) perp arrow(b) <=> arrow(a) dot arrow(b) = 0$.
          - Công cụ số 1 chứng minh hình học vuông góc.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. CÔNG THỨC TÍNH GÓC]
        #v(0.2em)
        #text(size: 10pt)[
          - $cos alpha = (arrow(a) dot arrow(b)) / (|arrow(a)| |arrow(b)|)$.
          - Cầu nối giải tích góc trong hình học.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. ỨNG DỤNG VẬT LÍ]
        #v(0.2em)
        #text(size: 10pt)[
          - Công cơ học: $A = arrow(F) dot arrow(d)$.
          - $A > 0$: phát động; $A < 0$: cản trở.
        ]
      ]
    ]
  )
]

#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 28pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 KẾT THÚC BÀI 4 — CHƯƠNG IV!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Tích vô hướng là chiếc chìa khóa vạn năng nối kết góc, độ dài và công cơ học."\
        Chuẩn bị tổng ôn toàn diện cùng #text(fill: rgb("#fde047"), weight: "bold")[Bài tập Cuối Chương IV: Vectơ]!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 13pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 11pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
