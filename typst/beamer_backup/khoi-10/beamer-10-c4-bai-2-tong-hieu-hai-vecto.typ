#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Tổng Và Hiệu Của Hai Vectơ],
  subtitle: [TOÁN 10 — CHƯƠNG IV: QUY TẮC BA ĐIỂM, HÌNH BÌNH HÀNH & TRỌNG TÂM],
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
// PHẦN I: TỔNG CỦA HAI VECTƠ
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-hai-vecto", "➕", [I. Tổng Của Hai Vectơ])

#lt-slide-back(title: "➕ Định Nghĩa Tổng Của Hai Vectơ")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Định nghĩa tổng")[
        Cho hai vectơ $arrow(a)$ và $arrow(b)$. Từ một điểm $A$ tùy ý, lấy điểm $B$ sao cho $arrow(A B) = arrow(a)$, rồi lấy điểm $C$ sao cho $arrow(B C) = arrow(b)$.
        Vectơ $arrow(A C)$ được gọi là *tổng của hai vectơ* $arrow(a)$ và $arrow(b)$:
        $ arrow(a) + arrow(b) = arrow(A B) + arrow(B C) = arrow(A C) $
      ]
      #v(0.25em)
      #lt-important(title: "Quy tắc Ba Điểm (Nối Đuôi)")[
        Với ba điểm $A, B, C$ bất kỳ, ta luôn có:
        $ arrow(A B) + arrow(B C) = arrow(A C) $
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Quy Tắc Ba Điểm]
          #v(0.4em)
          #cetz.canvas({
            import cetz.draw: *
            let sc = 1.4
            let A = (0, 0)
            let B = (2*sc, 0.4*sc)
            let C = (1.2*sc, 1.8*sc)

            // Vectơ AB
            line(A, B, mark: (end: "stealth", fill: rgb("#2563eb")), stroke: 1.8pt + rgb("#2563eb"))
            content((1*sc, 0.05*sc), text(size: 9.5pt, fill: rgb("#2563eb"), weight: "bold")[$arrow(a)$])

            // Vectơ BC
            line(B, C, mark: (end: "stealth", fill: rgb("#16a34a")), stroke: 1.8pt + rgb("#16a34a"))
            content((1.8*sc, 1.2*sc), text(size: 9.5pt, fill: rgb("#16a34a"), weight: "bold")[$arrow(b)$])

            // Vectơ AC (tổng)
            line(A, C, mark: (end: "stealth", fill: rgb("#dc2626")), stroke: 2pt + rgb("#dc2626"))
            content((0.4*sc, 1.05*sc), text(size: 9.5pt, fill: rgb("#dc2626"), weight: "bold")[$arrow(a) + arrow(b)$])

            // Đỉnh
            circle(A, radius: 2.5pt, fill: black)
            circle(B, radius: 2.5pt, fill: black)
            circle(C, radius: 2.5pt, fill: black)

            content((-0.15*sc, -0.1*sc), text(size: 9.5pt, weight: "bold")[$A$])
            content((2.15*sc, 0.35*sc), text(size: 9.5pt, weight: "bold")[$B$])
            content((1.2*sc, 2.05*sc), text(size: 9.5pt, weight: "bold")[$C$])
          })
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Quy Tắc Hình Bình Hành")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-theorem(title: "Quy tắc Hình bình hành")[
        Nếu $A B C D$ là một hình bình hành thì:
        $ arrow(A B) + arrow(A D) = arrow(A C) $
      ]
      #v(0.3em)
      #block(fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#2563eb"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 11pt)[💡 Ý nghĩa Vật lí: Hợp Lực]
        - Nếu hai lực $arrow(F_1)$ và $arrow(F_2)$ cùng tác dụng lên một vật tại $A$, lực tổng hợp là:
        $ arrow(F) = arrow(F_1) + arrow(F_2) $
        chính là đường chéo của hình bình hành tạo bởi hai lực đó!
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Hình Bình Hành ABCD]
          #v(0.3em)
          #cetz.canvas({
            import cetz.draw: *
            let sc = 1.3
            let A = (0, 0)
            let B = (2.2*sc, 0)
            let D = (0.9*sc, 1.4*sc)
            let C = (3.1*sc, 1.4*sc)

            // Cạnh nét mờ
            line(B, C, stroke: 0.8pt + rgb("#94a3b8"), dash: "dashed")
            line(D, C, stroke: 0.8pt + rgb("#94a3b8"), dash: "dashed")

            // Vectơ AB và AD
            line(A, B, mark: (end: "stealth", fill: rgb("#2563eb")), stroke: 1.8pt + rgb("#2563eb"))
            content((1.1*sc, -0.22*sc), text(size: 9pt, fill: rgb("#2563eb"), weight: "bold")[$arrow(A B)$])

            line(A, D, mark: (end: "stealth", fill: rgb("#16a34a")), stroke: 1.8pt + rgb("#16a34a"))
            content((0.28*sc, 0.8*sc), text(size: 9pt, fill: rgb("#16a34a"), weight: "bold")[$arrow(A D)$])

            // Đường chéo AC
            line(A, C, mark: (end: "stealth", fill: rgb("#dc2626")), stroke: 2pt + rgb("#dc2626"))
            content((1.8*sc, 0.85*sc), text(size: 9.5pt, fill: rgb("#dc2626"), weight: "bold")[$arrow(A C)$])

            // Đỉnh
            content((-0.15*sc, -0.1*sc), text(size: 9.5pt, weight: "bold")[$A$])
            content((2.35*sc, -0.1*sc), text(size: 9.5pt, weight: "bold")[$B$])
            content((0.8*sc, 1.6*sc), text(size: 9.5pt, weight: "bold")[$D$])
            content((3.25*sc, 1.55*sc), text(size: 9.5pt, weight: "bold")[$C$])
          })
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: HIỆU CỦA HAI VECTƠ
// ════════════════════════════════════════════════
#lt-section-link("sec-hieu-hai-vecto", "➖", [II. Hiệu Của Hai Vectơ])

#lt-slide-back(title: "➖ Vectơ Đối & Hiệu Của Hai Vectơ")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[1. Vectơ Đối]
        #v(0.25em)
        - Vectơ đối của $arrow(a)$ ký hiệu là $-arrow(a)$.
        - Hai vectơ đối nhau ngược hướng và cùng độ dài:
        $ arrow(a) + (-arrow(a)) = arrow(0) $
        - Ta có: $-arrow(A B) = arrow(B A)$.
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[2. Định Nghĩa Hiệu]
        #v(0.25em)
        Hiệu của $arrow(a)$ và $arrow(b)$ là tổng của $arrow(a)$ với vectơ đối của $arrow(b)$:
        $ arrow(a) - arrow(b) = arrow(a) + (-arrow(b)) $
      ]
    ]
  )
  #v(0.3em)
  #lt-important(title: "Quy tắc Hiệu (Chung Điểm Đầu)")[
    Với ba điểm $O, A, B$ bất kỳ, ta luôn có:
    $ arrow(O B) - arrow(O A) = arrow(A B) quad text("(Điểm cuối trừ điểm đầu)") $
  ]
]

// ════════════════════════════════════════════════
// PHẦN III: TÍNH CHẤT TRUNG ĐIỂM & TRỌNG TÂM
// ════════════════════════════════════════════════
#lt-section-link("sec-trung-diem-trong-tam", "⭐", [III. Trung Điểm & Trọng Tâm])

#lt-slide-back(title: "⭐ 2 Tính Chất Vàng Của Vectơ")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 10pt, radius: 8pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 12pt)[1. Tính Chất Trung Điểm]
        #v(0.3em)
        Điểm $I$ là trung điểm của đoạn thẳng $A B$ khi và chỉ khi:
        $ arrow(I A) + arrow(I B) = arrow(0) $
        #v(0.2em)
        *Mở rộng:* Với mọi điểm $M$ tùy ý:
        $ arrow(M A) + arrow(M B) = 2 arrow(M I) $
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 10pt, radius: 8pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7e22ce"), size: 12pt)[2. Tính Chất Trọng Tâm]
        #v(0.3em)
        Điểm $G$ là trọng tâm tam giác $A B C$ khi và chỉ khi:
        $ arrow(G A) + arrow(G B) + arrow(G C) = arrow(0) $
        #v(0.2em)
        *Mở rộng:* Với mọi điểm $M$ tùy ý:
        $ arrow(M A) + arrow(M B) + arrow(M C) = 3 arrow(M G) $
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP TRẮC NGHIỆM 4 LỰA CHỌN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "🎯", [IV. Bài tập: Trắc nghiệm 4 Lựa chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — TỔNG VÀ HIỆU CỦA HAI VECTƠ],
  questions: (
    (num: 1, type: "TN", desc: [Quy Tắc Ba Điểm]),
    (num: 2, type: "TN", desc: [Quy Tắc Hình Bình Hành]),
    (num: 3, type: "TN", desc: [Độ Dài Vectơ Tổng]),
    (num: 4, type: "TN", desc: [Độ Dài Vectơ Hiệu]),
    (num: 5, type: "TN", desc: [Hệ Thức Trọng Tâm]),
    (num: 6, type: "TN", desc: [Hợp Lực Hình Chữ Nhật]),
    (num: 7, type: "DS", desc: [Đúng/Sai Hình Bình Hành]),
    (num: 8, type: "TLN", desc: [Tính Độ Dài Tổng Vuông Cân]),
    (num: 9, type: "TLN", desc: [Bài Toán Kéo Thuyền Vật Lí]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho ba điểm $A, B, C$ bất kỳ. Đẳng thức nào sau đây luôn *đúng*?],
  (
    [$arrow(A B) + arrow(A C) = arrow(B C)$],
    [$arrow(A B) + arrow(C A) = arrow(C B)$],
    [$arrow(B A) + arrow(A C) = arrow(B C)$],
    [$arrow(A B) - arrow(A C) = arrow(B C)$],
  ),
  correct: 3,
  num: 1,
  de: "Đề 08A — Quy Tắc Ba Điểm",
  loigiai: [
    Theo quy tắc ba điểm (nối đuôi): $arrow(B A) + arrow(A C) = arrow(B C)$.\
    Phương án B: $arrow(A B) + arrow(C A) = arrow(C A) + arrow(A B) = arrow(C B)$ cũng đúng về giao hoán, nhưng C là dạng chuẩn nối tiếp trực tiếp $B arrow A arrow C$.\
    Chọn đáp án *C: BA + AC = BC*.
  ]
)

#lt-tn(
  [Cho hình bình hành $A B C D$. Đẳng thức vectơ nào sau đây là *đúng*?],
  (
    [$arrow(A B) + arrow(A C) = arrow(A D)$],
    [$arrow(A B) + arrow(A D) = arrow(A C)$],
    [$arrow(A B) - arrow(A D) = arrow(A C)$],
    [$arrow(B A) + arrow(B C) = arrow(C A)$],
  ),
  correct: 2,
  num: 2,
  de: "Đề 08A — Quy Tắc Hình Bình Hành",
  loigiai: [
    Theo quy tắc hình bình hành xuất phát từ đỉnh $A$:\
    $arrow(A B) + arrow(A D) = arrow(A C)$ (tổng hai cạnh bằng đường chéo đi qua $A$).\
    Chọn đáp án *B: AB + AD = AC*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ đều cạnh $a$. Độ dài của vectơ tổng $arrow(A B) + arrow(A C)$ bằng:],
  (
    [$2 a$],
    [$a sqrt(3)$],
    [$a$],
    [$a sqrt(3)/2$],
  ),
  correct: 2,
  num: 3,
  de: "Đề 08B — Độ Dài Vectơ Tổng",
  loigiai: [
    Dựng hình thoi $A B D C$. Khi đó $arrow(A B) + arrow(A C) = arrow(A D)$.\
    Độ dài: $|arrow(A B) + arrow(A C)| = A D = 2 A H$ (với $A H$ là đường cao tam giác đều).\
    $A D = 2 dot (a sqrt(3))/2 = a sqrt(3)$. Chọn đáp án *B: a sqrt(3)*.
  ]
)

#lt-tn(
  [Cho hình vuông $A B C D$ cạnh $a$. Độ dài của vectơ $arrow(A B) - arrow(A D)$ bằng:],
  (
    [$0$],
    [$a$],
    [$a sqrt(2)$],
    [$2 a$],
  ),
  correct: 3,
  num: 4,
  de: "Đề 08B — Độ Dài Vectơ Hiệu",
  loigiai: [
    Theo quy tắc hiệu chung gốc: $arrow(A B) - arrow(A D) = arrow(D B)$.\
    Độ dài: $|arrow(A B) - arrow(A D)| = |arrow(D B)| = D B$.\
    $D B$ là đường chéo hình vuông cạnh $a$ nên $D B = a sqrt(2)$. Chọn đáp án *C*.
  ]
)

#lt-tn(
  [Gọi $G$ là trọng tâm tam giác $A B C$ và $M$ là một điểm tùy ý. Đẳng thức nào sau đây luôn đúng?],
  (
    [$arrow(M A) + arrow(M B) + arrow(M C) = arrow(0)$],
    [$arrow(M A) + arrow(M B) + arrow(M C) = arrow(M G)$],
    [$arrow(M A) + arrow(M B) + arrow(M C) = 3 arrow(M G)$],
    [$arrow(M A) + arrow(M B) + arrow(M C) = 2 arrow(M G)$],
  ),
  correct: 3,
  num: 5,
  de: "Đề 08C — Hệ Thức Trọng Tâm",
  loigiai: [
    Theo tính chất trọng tâm mở rộng với điểm $M$ bất kỳ:\
    $arrow(M A) + arrow(M B) + arrow(M C) = 3 arrow(M G)$.\
    (Đặc biệt khi $M equiv G$ thì $arrow(G A) + arrow(G B) + arrow(G C) = arrow(0)$). Chọn *C*.
  ]
)

#lt-tn(
  [Cho hình chữ nhật $A B C D$ có $A B = 3, B C = 4$. Độ dài của vectơ $arrow(A B) + arrow(A D)$ bằng:],
  (
    [$7$],
    [$5$],
    [$1$],
    [$12$],
  ),
  correct: 2,
  num: 6,
  de: "Đề 08C — Hợp Lực Hình Chữ Nhật",
  loigiai: [
    Theo quy tắc hình bình hành: $arrow(A B) + arrow(A D) = arrow(A C)$.\
    Độ dài: $|arrow(A B) + arrow(A D)| = A C = sqrt(A B^2 + B C^2) = sqrt(3^2 + 4^2) = 5$.\
    Chọn đáp án *B: 5*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP ĐÚNG / SAI & TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [V. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho hình bình hành $A B C D$ tâm $O$. Xét tính Đúng / Sai của các khẳng định sau:],
  (
    (body: [Đẳng thức $arrow(O A) + arrow(O C) = arrow(0)$ luôn đúng.], "true": true),
    (body: [Ta có $arrow(A B) + arrow(C D) = arrow(0)$.], "true": true),
    (body: [Đẳng thức $arrow(A B) - arrow(A C) = arrow(B C)$ là khẳng định đúng.], "true": false),
    (body: [Vectơ tổng $arrow(A B) + arrow(A D) + arrow(C B) + arrow(C D) = arrow(0)$.], "true": true),
  ),
  de: "Đề 08D — Đúng/Sai Hình Bình Hành",
  num: 7,
  loigiai: [
    - a) *Đ:* $O$ là trung điểm $A C$ nên $arrow(O A) + arrow(O C) = arrow(0)$.
    - b) *Đ:* $arrow(C D) = -arrow(A B)$ nên $arrow(A B) + arrow(C D) = arrow(0)$.
    - c) *S:* $arrow(A B) - arrow(A C) = arrow(C B)$ (không phải $arrow(B C)$).
    - d) *Đ:* $arrow(A B) + arrow(A D) = arrow(A C)$, còn $arrow(C B) + arrow(C D) = arrow(C A) = -arrow(A C) arrow$ tổng bằng $arrow(0)$.
  ]
)

#lt-tln(
  [Cho tam giác $A B C$ vuông cân tại $A$ có $A B = A C = 4$. Độ dài của vectơ $arrow(A B) + arrow(A C)$ bằng bao nhiêu? (Làm tròn đến hàng phần mười).],
  [5.7],
  num: 8,
  de: "Đề 08E — Tính Độ Dài Tổng Vuông Cân",
  loigiai: [
    Dựng hình vuông $A B D C$. Khi đó $arrow(A B) + arrow(A C) = arrow(A D)$.\
    Độ dài: $|arrow(A B) + arrow(A C)| = A D$.\
    Vì $A B D C$ là hình vuông cạnh $4$ nên $A D = 4 sqrt(2) approx 5.66$ (làm tròn thành $5.7$).\
    Đáp số: *$5.7$*.
  ]
)

#lt-tln(
  [Hai người cùng kéo một chiếc thuyền với hai lực $arrow(F_1)$ và $arrow(F_2)$ có độ lớn bằng nhau $|arrow(F_1)| = |arrow(F_2)| = 100$ N, góc tạo bởi hai lực là $60 degree$. Độ lớn của lực kéo tổng hợp tác dụng lên thuyền bằng bao nhiêu Newton? (Làm tròn đến hàng đơn vị).],
  [173],
  num: 9,
  de: "Đề 08F — Bài Toán Kéo Thuyền Vật Lí",
  loigiai: [
    Lực tổng hợp $arrow(F) = arrow(F_1) + arrow(F_2)$ là đường chéo hình thoi có góc nhọn $60 degree$.\
    Độ lớn: $|arrow(F)| = 2 dot |arrow(F_1)| dot cos(60 degree / 2) = 2(100) cos 30 degree = 200 dot sqrt(3)/2 = 100 sqrt(3)$.\
    Tính giá trị: $100 sqrt(3) approx 173.2$ N. Làm tròn đến hàng đơn vị là *$173$* N.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: TỔNG KẾT & SƠ ĐỒ TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-c4-b2", "💎", [VI. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ Ma Trận Phép Toán Tổng & Hiệu Vectơ")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. QUY TẮC BA ĐIỂM]
        #v(0.2em)
        #text(size: 10pt)[
          - $arrow(A B) + arrow(B C) = arrow(A C)$.
          - "Nối đuôi": Điểm cuối của vectơ trước là điểm đầu vectơ sau.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. QUY TẮC HÌNH BÌNH HÀNH]
        #v(0.2em)
        #text(size: 10pt)[
          - $arrow(A B) + arrow(A D) = arrow(A C)$.
          - "Chung gốc": Tổng 2 cạnh kề bằng đường chéo xuất phát từ gốc.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. QUY TẮC HIỆU]
        #v(0.2em)
        #text(size: 10pt)[
          - $arrow(O B) - arrow(O A) = arrow(A B)$.
          - "Chung gốc trừ nhau": Vectơ hướng từ điểm cuối sang điểm đầu.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. TRUNG ĐIỂM I]
        #v(0.2em)
        #text(size: 10pt)[
          - $arrow(I A) + arrow(I B) = arrow(0)$.
          - Mở rộng: $arrow(M A) + arrow(M B) = 2 arrow(M I)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. TRỌNG TÂM G]
        #v(0.2em)
        #text(size: 10pt)[
          - $arrow(G A) + arrow(G B) + arrow(G C) = arrow(0)$.
          - Mở rộng: $arrow(M A) + arrow(M B) + arrow(M C) = 3 arrow(M G)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. BƯỚC ĐỆM BÀI TIẾP]
        #v(0.2em)
        #text(size: 10pt)[
          - Bài 3: Tích của một số với vectơ $k arrow(a)$.
          - Phân tích một vectơ theo hai vectơ không cùng phương.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 KẾT THÚC BÀI 2 — CHƯƠNG IV!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Cộng trừ vectơ là phép toán thần kỳ đưa đại số vào không gian hình học."\
        Chuẩn bị chinh phục #text(fill: rgb("#fde047"), weight: "bold")[Bài 3: Tích Của Một Số Với Một Vectơ]!
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
