// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 11: TÍCH VÔ HƯỚNG CỦA HAI VECTƠ (ĐỀ SỐ 3 - NÂNG CAO)
// Lớp: Khối 10  ·  Mã đề: 115  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "../../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let notin = sym.in.not
#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset
#let True(body) = ("true": true, body: body)
#let accent = rgb("#0057b8")

#let draw_angle_arc(center, a1, a2, radius: 0.8, ..rest) = {
  let sx = center.at(0) + radius * calc.cos(a1)
  let sy = center.at(1) + radius * calc.sin(a1)
  cetz.draw.arc((sx, sy), start: a1, stop: a2, radius: radius, ..rest)
}

#show: lecture-theme.with(
  title: "BÀI 11: TÍCH VÔ HƯỚNG CỦA HAI VECTƠ (ĐỀ SỐ 3 - NÂNG CAO)",
  subtitle: "ÔN TẬP CHƯƠNG 4 — MÃ ĐỀ: 115",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size: 18pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#lt-toc(title: [🗺️ CẤU TRÚC ĐỀ THI & ĐIỀU HƯỚNG])

// ── BẢNG ĐIỀU HƯỚNG 22 CÂU HỎI ────────────────────────────
#slide(title: none)[
  #[#metadata(none) #label("sec-exercise-hub")]
  #context {
    let s = _lec-style.get()
    v(-0.4em)
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      box(fill: s.accent, inset: (x: 10pt, y: 5pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 11pt)[📋 MA TRẬN ĐIỀU HƯỚNG 22 CÂU HỎI]
      ],
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 115]],
      lt-nav-btn("lec-toc-main", icon: "◀", txt: "Mục lục chính")
    )
    v(0.4em)

    // Phần I: 12 câu TN (Lưới 6x2)
    block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#1d4ed8"))[🎯 PHẦN I: TRẮC NGHIỆM 4 LỰA CHỌN (Câu 1 -> 12)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#3b82f6"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#1d4ed8"))[Câu #i]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần II: 4 câu Đúng/Sai (Lưới 4x1)
    block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#e9d5ff"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#7e22ce"))[📝 PHẦN II: TRẮC NGHIỆM ĐÚNG / SAI (Câu 13 -> 16 — Mỗi câu 4 ý a, b, c, d)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 6pt,
        ..(13, 14, 15, 16).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#a855f7"),
              inset: (y: 4.5pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#7e22ce"))[Câu #i (Đ/S)]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần III: 6 câu Trả lời ngắn (Lưới 6x1)
    block(fill: rgb("#ecfeff"), stroke: 1pt + rgb("#a5f3fc"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#0e7490"))[🔢 PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (Câu 17 -> 22)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(17, 18, 19, 20, 21, 22).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#06b6d4"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#0e7490"))[Câu #i]]
            )
          ]
        })
      )
    ]
  }
]

#let exam-part(title, count: none) = {
  slide(title: none)[
    #align(center + horizon)[
      #block(fill: rgb("#eff6ff"), stroke: 2pt + rgb("#2563eb"), inset: 18pt, radius: 10pt, width: 85%)[
        #text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[#title]
      ]
    ]
  ]
}

// ── NỘI DUNG 22 CÂU HỎI THỰC CHIẾN ─────────────────────────
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Trong mặt phẳng, cho hai điểm cố định $A$ và $B$ phân biệt. Tập hợp tất cả các điểm $M$ thỏa mãn đẳng thức vectơ $vec(M A) dot vec(M B) = 0$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pI = (2.0, 1.5)
    circle(pI, radius: 1.5, stroke: 1.2pt + rgb("d97706"))
    let pA = (0.5, 1.5)
    let pB = (3.5, 1.5)
    let pM = (2.0, 3.0)
    line(pA, pB, stroke: 1pt + luma(160))
    line(pM, pA, stroke: 1.2pt + rgb("0d9488"))
    line(pM, pB, stroke: 1.2pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((0.3, 1.5), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.7, 1.5), text(size: 8pt)[$B$])
    circle(pI, radius: 1.5pt, fill: black)
    content((2.0, 1.2), text(size: 8pt)[$I$])
    circle(pM, radius: 2.5pt, fill: rgb("dc2626"))
    content((2.0, 3.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$M$])
    draw_angle_arc(pM, 225deg, 315deg, radius: 0.4, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([Đường tròn đường kính $A B$]),
        [Đường trung trực của đoạn thẳng $A B$],
        [Đường thẳng song song với $A B$],
        [Đoạn thẳng nối $A$ và $B$]
    ),
    loigiai: [
        $vec(M A) dot vec(M B) = 0 <=> vec(M A) perp vec(M B)$.
        Do đó khi $M != A$ và $M != B$, góc $hat(A M B) = 90^circ$, điểm $M$ nhìn đoạn $A B$ dưới góc vuông. Khi $M equiv A$ hoặc $M equiv B$ thì một trong hai vectơ bằng $vec(0)$ nên tích vô hướng vẫn bằng $0$.
        Vậy tập hợp điểm $M$ là đường tròn nhận đoạn thẳng $A B$ làm đường kính.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho đoạn thẳng $A B$ có độ dài bằng $2a$ và trung điểm $I$. Với điểm $M$ tùy ý trong mặt phẳng, biểu thức $vec(M A) dot vec(M B)$ luôn bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pI = (2.0, 0)
    let pB = (4.0, 0)
    let pM = (2.0, 2.2)
    line(pA, pB, stroke: 1.2pt + luma(140))
    line(pM, pA, stroke: 1pt + rgb("0d9488"))
    line(pM, pB, stroke: 1pt + rgb("1e40af"))
    line(pM, pI, stroke: 1.5pt + rgb("d97706"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((4.2, -0.2), text(size: 8pt)[$B$])
    circle(pI, radius: 2pt, fill: black)
    content((2.0, -0.3), text(size: 8pt)[$I$])
    circle(pM, radius: 2.5pt, fill: rgb("d97706"))
    content((2.0, 2.5), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$M$])
  })
]],
    (
        True([$M I^2 - a^2$]),
        [$M I^2 + a^2$],
        [$M I^2 - 2a^2$],
        [$M I^2 + 2a^2$]
    ),
    loigiai: [
        Chèn điểm trung điểm $I$ vào hệ thức:
        $ vec(M A) = vec(M I) + vec(I A) = vec(M I) - vec(I B) $
        $ vec(M B) = vec(M I) + vec(I B) $
        Nhân vô hướng:
        $ vec(M A) dot vec(M B) = (vec(M I) - vec(I B)) dot (vec(M I) + vec(I B)) = vec(M I)^2 - vec(I B)^2 = M I^2 - a^2 $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho đoạn thẳng $A B$ có độ dài $A B = 6$, gọi $I$ là trung điểm của $A B$. Tập hợp các điểm $M$ thỏa mãn hệ thức $vec(M A) dot vec(M B) = 16$ là một đường tròn tâm $I$ có bán kính $R$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pI = (2.0, 1.5)
    circle(pI, radius: 1.5, stroke: 1.2pt + rgb("d97706"))
    let pA = (0.9, 1.5)
    let pB = (3.1, 1.5)
    line((0, 1.5), (4.0, 1.5), stroke: (paint: luma(160), dash: "dashed"))
    circle(pA, radius: 2pt, fill: black)
    content((0.9, 1.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.1, 1.2), text(size: 8pt)[$B$])
    circle(pI, radius: 2pt, fill: black)
    content((2.0, 1.2), text(size: 8pt)[$I$])
    line(pI, (3.5, 1.5), stroke: 1.5pt + rgb("d97706"))
    content((2.75, 1.75), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$R$])
  })
]],
    (
        True([$R = 5$]),
        [$R = 4$],
        [$R = sqrt(7)$],
        [$R = 25$]
    ),
    loigiai: [
        Vì $I$ là trung điểm của $A B$ nên $I A = I B = (A B) / 2 = 6 / 2 = 3$.
        Ta có $vec(M A) dot vec(M B) = M I^2 - I A^2 = 16$.
        Suy ra:
        $ M I^2 - 3^2 = 16 <=> M I^2 = 16 + 9 = 25 <=> M I = 5 $
        Vậy tập hợp điểm $M$ là đường tròn tâm $I$, bán kính $R = 5$.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh $A B = 5, A C = 7$ và $B C = 8$. Giá trị của tích vô hướng $vec(A B) dot vec(A C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.5, 0)
    let pC = (1.75, 3.03)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("d97706"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.7, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((1.75, 3.3), text(size: 8pt)[$C$])
  })
]],
    (
        True([$5$]),
        [$10$],
        [$7$],
        [$-5$]
    ),
    loigiai: [
        Từ hệ quả của định lý côsin trong tam giác $A B C$:
        $ B C^2 = A B^2 + A C^2 - 2 vec(A B) dot vec(A C) $
        $ <=> vec(A B) dot vec(A C) = (A B^2 + A C^2 - B C^2) / 2 = (5^2 + 7^2 - 8^2) / 2 = (25 + 49 - 64) / 2 = 10 / 2 = 5 $
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho hai vectơ $vec(u)$ và $vec(v)$ thỏa mãn $|vec(u)| = 2, |vec(v)| = 3$ và góc giữa chúng $(vec(u), vec(v)) = 60^circ$. Độ dài của vectơ tổng $|vec(u) + vec(v)|$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (2.0, 0), mark: (end: ">", fill: rgb("d97706")), stroke: 1.8pt + rgb("d97706"))
    content((2.1, -0.25), text(fill: rgb("d97706"), size: 8pt)[$vec(u)$])
    line(pO, (1.5, 2.6), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.6, 2.8), text(fill: rgb("0d9488"), size: 8pt)[$vec(v)$])
    line(pO, (3.5, 2.6), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((3.7, 2.8), text(fill: rgb("1e40af"), size: 8.5pt, weight: "bold")[$vec(u) + vec(v)$])
  })
]],
    (
        True([$sqrt(19)$]),
        [$5$],
        [$sqrt(13)$],
        [$sqrt(7)$]
    ),
    loigiai: [
        Áp dụng bình phương vô hướng:
        $ |vec(u) + vec(v)|^2 = vec(u)^2 + vec(v)^2 + 2 vec(u) dot vec(v) = |vec(u)|^2 + |vec(v)|^2 + 2 |vec(u)| dot |vec(v)| dot cos 60^circ $
        $ = 2^2 + 3^2 + 2 dot 2 dot 3 dot 1/2 = 4 + 9 + 6 = 19 $
        Suy ra $|vec(u) + vec(v)| = sqrt(19)$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho hai vectơ $vec(a)$ và $vec(b)$ thỏa mãn $|vec(a)| = 4, |vec(b)| = 5$ và tích vô hướng $vec(a) dot vec(b) = -10$. Độ dài của vectơ hiệu $|vec(a) - vec(b)|$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (2.4, 0), mark: (end: ">", fill: rgb("d97706")), stroke: 1.8pt + rgb("d97706"))
    content((2.5, -0.25), text(fill: rgb("d97706"), size: 8pt)[$vec(a)$])
    line(pO, (-1.8, 2.4), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-2.0, 2.5), text(fill: rgb("0d9488"), size: 8pt)[$vec(b)$])
    line((-1.8, 2.4), (2.4, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((0.5, 1.6), text(fill: rgb("1e40af"), size: 8.5pt, weight: "bold")[$vec(a) - vec(b)$])
  })
]],
    (
        True([$sqrt(61)$]),
        [$sqrt(21)$],
        [$9$],
        [$1$]
    ),
    loigiai: [
        $ |vec(a) - vec(b)|^2 = vec(a)^2 + vec(b)^2 - 2 vec(a) dot vec(b) = 4^2 + 5^2 - 2 dot (-10) = 16 + 25 + 20 = 61 $
        Suy ra $|vec(a) - vec(b)| = sqrt(61)$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho tam giác đều $A B C$ có cạnh bằng $a$. Điểm $M$ thuộc cạnh $B C$ sao cho $B M = 1/3 B C$. Tích vô hướng $vec(A M) dot vec(B C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3.0, 0)
    let pM = (1.0, 0)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("d97706"))
    line(pA, pM, stroke: 1.5pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.9), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8pt)[$C$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((1.0, -0.3), text(fill: rgb("0d9488"), size: 8pt, weight: "bold")[$M$])
  })
]],
    (
        True([$- 1/6 a^2$]),
        [$1/6 a^2$],
        [$- 1/3 a^2$],
        [$1/3 a^2$]
    ),
    loigiai: [
        Phân tích vectơ $vec(A M) = vec(A B) + vec(B M) = vec(A B) + 1/3 vec(B C)$.
        Nhân vô hướng với $vec(B C)$:
        $ vec(A M) dot vec(B C) = (vec(A B) + 1/3 vec(B C)) dot vec(B C) = vec(A B) dot vec(B C) + 1/3 B C^2 $
        Ta có $vec(A B) dot vec(B C) = - vec(B A) dot vec(B C) = - a dot a dot cos 60^circ = - 1/2 a^2$.
        Suy ra:
        $ vec(A M) dot vec(B C) = - 1/2 a^2 + 1/3 a^2 = - 1/6 a^2 $
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho hai vectơ không cùng phương $vec(a)$ và $vec(b)$ có $|vec(a)| = 2, |vec(b)| = 3$ và góc $(vec(a), vec(b)) = 60^circ$. Giá trị của tham số thực $k$ để vectơ $vec(u) = 2 vec(a) + k vec(b)$ vuông góc với vectơ $vec(v) = vec(a) - vec(b)$ là],
    (
        True([$k = 1/3$]),
        [$k = - 1/3$],
        [$k = 5/6$],
        [$k = 2/3$]
    ),
    loigiai: [
        Ta có $vec(a) dot vec(b) = |vec(a)| dot |vec(b)| dot cos 60^circ = 2 dot 3 dot 1/2 = 3$.
        $vec(a)^2 = 2^2 = 4$ và $vec(b)^2 = 3^2 = 9$.
        Điều kiện $vec(u) perp vec(v) <=> vec(u) dot vec(v) = 0$:
        $ (2 vec(a) + k vec(b)) dot (vec(a) - vec(b)) = 0 <=> 2 vec(a)^2 - 2 vec(a) dot vec(b) + k vec(a) dot vec(b) - k vec(b)^2 = 0 $
        $ <=> 2(4) - 2(3) + k(3) - k(9) = 0 <=> 8 - 6 - 6k = 0 <=> 2 - 6k = 0 <=> k = 1/3 $
        Vậy giá trị cần tìm là $k = 1/3$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $A B = 5, A C = 6$ và $B C = 7$. Gọi $M$ là trung điểm của cạnh $B C$. Giá trị của tích vô hướng $vec(A M) dot vec(A B)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 3.2)
    let pB = (0, 0)
    let pC = (4.0, 0)
    let pM = (2.0, 0)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("d97706"))
    line(pA, pM, stroke: 1.5pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 3.45), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((4.2, -0.2), text(size: 8pt)[$C$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((2.0, -0.3), text(fill: rgb("0d9488"), size: 8pt, weight: "bold")[$M$])
  })
]],
    (
        True([$15.5$]),
        [$18.5$],
        [$12.0$],
        [$21.0$]
    ),
    loigiai: [
        Vì $M$ là trung điểm $B C$ nên $vec(A M) = 1/2 (vec(A B) + vec(A C))$.
        Nhân vô hướng với $vec(A B)$:
        $ vec(A M) dot vec(A B) = 1/2 (vec(A B) + vec(A C)) dot vec(A B) = 1/2 (A B^2 + vec(A B) dot vec(A C)) $
        Mặt khác, theo hệ quả định lý côsin:
        $ vec(A B) dot vec(A C) = (A B^2 + A C^2 - B C^2) / 2 = (5^2 + 6^2 - 7^2) / 2 = (25 + 36 - 49) / 2 = 12 / 2 = 6 $
        Do đó:
        $ vec(A M) dot vec(A B) = 1/2 (25 + 6) = 31 / 2 = 15.5 $
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho hình thang vuông $A B C D$ tại $A$ và $D$ có $A B = a, A D = a$ và đáy lớn $C D = 2a$. Tích vô hướng $vec(A C) dot vec(B D)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.8)
    let pB = (1.8, 1.8)
    let pC = (3.6, 0)
    let pD = (0, 0)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("d97706"))
    line(pA, pC, stroke: 1.5pt + rgb("0d9488"))
    line(pB, pD, stroke: 1.5pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 1.8), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((1.8, 2.05), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.8, -0.2), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$D$])
  })
]],
    (
        True([$-a^2$]),
        [$0$],
        [$a^2$],
        [$-2a^2$]
    ),
    loigiai: [
        Phân tích theo hai vectơ vuông góc $vec(A D)$ và $vec(A B)$ ($vec(A D) dot vec(A B) = 0$):
        $vec(A C) = vec(A D) + vec(D C) = vec(A D) + 2 vec(A B)$ (vì $vec(D C) = 2 vec(A B)$).
        $vec(B D) = vec(A D) - vec(A B)$.
        Nhân vô hướng:
        $ vec(A C) dot vec(B D) = (vec(A D) + 2 vec(A B)) dot (vec(A D) - vec(A B)) = vec(A D)^2 + vec(A D) dot vec(A B) - 2 vec(A B)^2 $
        $ = A D^2 + 0 - 2 A B^2 = a^2 - 2a^2 = -a^2 $
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có trọng tâm là $G$. Đẳng thức nào sau đây luôn đúng với mọi điểm $M$ trong mặt phẳng?],
    (
        True([$M A^2 + M B^2 + M C^2 = 3 M G^2 + G A^2 + G B^2 + G C^2$]),
        [$M A^2 + M B^2 + M C^2 = 3 M G^2$],
        [$M A^2 + M B^2 + M C^2 = M G^2 + G A^2 + G B^2 + G C^2$],
        [$M A^2 + M B^2 + M C^2 = 3 M G^2 - (G A^2 + G B^2 + G C^2)$]
    ),
    loigiai: [
        Chèn điểm trọng tâm $G$ vào từng số hạng:
        $ M A^2 = vec(M A)^2 = (vec(M G) + vec(G A))^2 = M G^2 + G A^2 + 2 vec(M G) dot vec(G A) $
        Tương tự cho $M B^2$ và $M C^2$. Cộng từng vế và sử dụng $vec(G A) + vec(G B) + vec(G C) = vec(0)$:
        $ M A^2 + M B^2 + M C^2 = 3 M G^2 + G A^2 + G B^2 + G C^2 + 2 vec(M G) dot (vec(G A) + vec(G B) + vec(G C)) $
        $ = 3 M G^2 + G A^2 + G B^2 + G C^2 $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài cạnh $B C = a$. Gọi $I, J$ lần lượt là trung điểm của các cạnh $A B$ và $A C$. Tập hợp tất cả các điểm $M$ thỏa mãn hệ thức vectơ $(vec(M A) + vec(M B)) dot (vec(M A) + vec(M C)) = 0$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3.0, 0)
    let pI = (0.75, 1.3)
    let pJ = (2.25, 1.3)
    let pK = (1.5, 1.3)
    line(pA, pB, pC, close: true, stroke: 1.2pt + luma(140))
    circle(pK, radius: 0.75, stroke: 1.2pt + rgb("d97706"))
    line(pI, pJ, stroke: 1.5pt + rgb("0d9488"))
    circle(pI, radius: 2pt, fill: black)
    content((0.5, 1.3), text(size: 8pt)[$I$])
    circle(pJ, radius: 2pt, fill: black)
    content((2.5, 1.3), text(size: 8pt)[$J$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.85), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8pt)[$C$])
  })
]],
    (
        True([Đường tròn đường kính $I J$ có bán kính $R = a / 4$]),
        [Đường tròn đường kính $B C$ có bán kính $R = a / 2$],
        [Đường trung trực của đoạn thẳng $I J$],
        [Đường tròn tâm $A$ bán kính $R = a / 2$]
    ),
    loigiai: [
        Vì $I, J$ lần lượt là trung điểm của $A B$ và $A C$ nên:
        $ vec(M A) + vec(M B) = 2 vec(M I) $
        $ vec(M A) + vec(M C) = 2 vec(M J) $
        Thay vào hệ thức đề bài:
        $ (2 vec(M I)) dot (2 vec(M J)) = 0 <=> 4 vec(M I) dot vec(M J) = 0 <=> vec(M I) dot vec(M J) = 0 $
        Đẳng thức này chứng tỏ điểm $M$ nhìn đoạn thẳng $I J$ dưới một góc vuông.
        Tập hợp điểm $M$ là đường tròn đường kính $I J$.
        Vì $I J$ là đường trung bình của tam giác $A B C$ ứng với cạnh $B C$ nên $I J = 1/2 B C = a / 2$.
        Bán kính của đường tròn là $R = (I J) / 2 = a / 4$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Quỹ tích đường tròn đường kính AB trong Oxy)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 2)$ và $B(5; 6)$. Gọi $(C)$ là tập hợp các điểm $M(x; y)$ thỏa mãn hệ thức vectơ: $vec(M A) dot vec(M B) = 0$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 5.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 5.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.0, 1.6)
    let pB = (4.2, 4.4)
    let pI = (2.6, 3.0)
    circle(pI, radius: 2.1, stroke: 1.2pt + rgb("d97706"))
    line(pA, pB, stroke: 1pt + luma(160))
    circle(pA, radius: 2pt, fill: black)
    content((0.8, 1.4), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((4.4, 4.6), text(size: 8pt)[$B$])
    circle(pI, radius: 2pt, fill: black)
    content((2.8, 2.8), text(size: 8pt)[$I$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tập hợp các điểm $M$ thỏa mãn hệ thức là đường tròn nhận $A B$ làm đường kính.]),
    True([Tâm của đường tròn là trung điểm của đoạn thẳng $A B$, có tọa độ $I(3; 4)$.]),
    True([Bán kính của đường tròn là $R = 2 sqrt(2)$.]),
    [Gốc tọa độ $O(0; 0)$ là một điểm nằm trên đường tròn $(C)$.]
  ),
  loigiai: [
    #step([Bản chất quỹ tích])
    $vec(M A) dot vec(M B) = 0$ nghĩa là góc $hat(A M B) = 90^circ$ hoặc $M$ trùng $A, B$. Quỹ tích là đường tròn đường kính $A B$. Mệnh đề a ĐÚNG.

    #step([Tọa độ tâm I])
    $I$ là trung điểm của $A B$: $x_I = (1 + 5)/2 = 3, y_I = (2 + 6)/2 = 4 => I(3; 4)$. Mệnh đề b ĐÚNG.

    #step([Tính bán kính R])
    Độ dài đường kính: $A B = sqrt((5 - 1)^2 + (6 - 2)^2) = sqrt(16 + 16) = 4 sqrt(2)$.
    Bán kính: $R = (A B) / 2 = 2 sqrt(2)$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra gốc O có thuộc đường tròn])
    Xét tích vô hướng tại gốc tọa độ:
    $ vec(O A) dot vec(O B) = 1 dot 5 + 2 dot 6 = 5 + 12 = 17 != 0 $
    Vì tích vô hướng khác $0$ nên gốc $O$ không nằm trên đường tròn $(C)$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Cực trị tích vô hướng trên trục tọa độ)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(2; 3)$ và $B(6; 1)$. Điểm $M(x; 0)$ di động trên trục hoành $O x$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.6, 2.4)
    let pB = (4.5, 0.8)
    let pM = (3.2, 0)
    line(pM, pA, stroke: 1.2pt + rgb("0d9488"))
    line(pM, pB, stroke: 1.2pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((1.6, 2.7), text(size: 8pt)[$A(2; 3)$])
    circle(pB, radius: 2pt, fill: black)
    content((4.5, 1.1), text(size: 8pt)[$B(6; 1)$])
    circle(pM, radius: 2.5pt, fill: rgb("d97706"))
    content((3.2, -0.35), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$M(x; 0)$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ của hai vectơ là $vec(M A) = (2 - x; 3)$ và $vec(M B) = (6 - x; 1)$.]),
    True([Biểu thức tích vô hướng theo biến $x$ là $f(x) = vec(M A) dot vec(M B) = x^2 - 8x + 15$.]),
    True([Giá trị nhỏ nhất của tích vô hướng $vec(M A) dot vec(M B)$ bằng $-1$.]),
    [Tích vô hướng đạt giá trị nhỏ nhất khi điểm $M$ có tọa độ $M(0; 4)$.]
  ),
  loigiai: [
    #step([Xác định tọa độ hai vectơ])
    $vec(M A) = (2 - x; 3)$ và $vec(M B) = (6 - x; 1)$. Mệnh đề a ĐÚNG.

    #step([Thiết lập hàm số f(x)])
    $ f(x) = vec(M A) dot vec(M B) = (2 - x)(6 - x) + 3 dot 1 = x^2 - 8x + 12 + 3 = x^2 - 8x + 15 $
    Mệnh đề b ĐÚNG.

    #step([Tìm giá trị nhỏ nhất])
    $ f(x) = (x - 4)^2 - 1 >= -1, quad forall x in bb(R) $
    Giá trị nhỏ nhất là $-1$. Mệnh đề c ĐÚNG.

    #step([Tọa độ điểm M đạt cực tiểu])
    Dấu bằng xảy ra khi $x - 4 = 0 <=> x = 4$.
    Vì $M in O x$ nên tọa độ đúng là $M(4; 0)$ chứ không phải $M(0; 4)$. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Tối ưu lực kéo sà lan trên kênh đào)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Một chiếc sà lan chở vật liệu di chuyển thẳng dọc theo đường trung tâm của một kênh đào hẹp. Một máy tời điện cố định trên bờ kênh kéo sà lan bằng dây cáp với lực kéo không đổi $F = 5000" N"$. Hướng của dây cáp hợp với hướng tiến của sà lan một góc $alpha$ ($0^circ <= alpha < 90^circ$). Sà lan di chuyển được quãng đường thẳng $s = 100" m"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Bờ kênh
    line((-0.5, 2.0), (5.5, 2.0), stroke: 1.8pt + rgb("0284c7"))
    line((-0.5, -2.0), (5.5, -2.0), stroke: 1.8pt + rgb("0284c7"))
    line((-0.5, 0), (5.5, 0), stroke: (paint: luma(160), dash: "dashed"))
    content((5.2, 0.3), text(fill: luma(120), size: 7.5pt)[Trục kênh])
    // Sà lan
    rect((0.8, -0.6), (2.6, 0.6), fill: rgb("f8fafc"), stroke: 1.5pt + rgb("0369a1"))
    content((1.7, 0), [🚢 Sà lan])
    // Máy tời trên bờ
    circle((3.8, 2.0), radius: 3pt, fill: rgb("d97706"))
    content((3.8, 2.3), [⚙️ Máy tời])
    line((2.6, 0), (3.8, 2.0), stroke: 1.5pt + rgb("d97706"))
    draw_angle_arc((2.6, 0), 0deg, 59deg, radius: 0.6, stroke: 1pt + rgb("dc2626"))
    content((3.2, 0.5), text(fill: rgb("dc2626"), size: 8pt)[$alpha$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Công có ích kéo sà lan tịnh tiến về phía trước phụ thuộc góc $alpha$ theo công thức $A(alpha) = 500000 cos alpha$ (J).]),
    True([Công của lực kéo đạt giá trị cực đại bằng $500000" J"$ khi $alpha = 0^circ$.]),
    True([Khi góc kéo $alpha = 60^circ$, công của lực kéo giảm đi một nửa so với cực đại, chỉ còn $250000" J"$.]),
    [Lực thành phần có xu hướng kéo dạt sà lan va vào bờ kênh có độ lớn bằng $F_y = F cos alpha$.]
  ),
  loigiai: [
    #step([Biểu thức tính công])
    $ A(alpha) = vec(F) dot vec(s) = F dot s dot cos alpha = 5000 dot 100 dot cos alpha = 500000 cos alpha" J" $
    Mệnh đề a ĐÚNG.

    #step([Công cực đại])
    Vì $cos alpha <= 1$, dấu bằng xảy ra khi $alpha = 0^circ$ (kéo dọc theo trục kênh), khi đó $A_(max) = 500000" J"$. Mệnh đề b ĐÚNG.

    #step([Giá trị khi góc kéo bằng 60 độ])
    $ A(60^circ) = 500000 dot cos 60^circ = 500000 dot 1/2 = 250000" J" $
    Mệnh đề c ĐÚNG.

    #step([Thành phần lực dạt bờ])
    Lực kéo $vec(F)$ phân tích thành:
    - Thành phần kéo tiến: $F_x = F cos alpha$.
    - Thành phần kéo dạt vuông góc vào bờ: $F_y = F sin alpha$ chứ không phải $F cos alpha$. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Vệ tinh điều chỉnh quỹ đạo LEO)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Một vệ tinh viễn thám bay trên quỹ đạo thấp (LEO) với vận tốc ban đầu $vec(v)_0$ có độ lớn $v_0 = 7.5" km/s"$. Để nâng quỹ đạo, động cơ đẩy kích hoạt sinh ra xung vận tốc bổ sung $Delta vec(v)$ có độ lớn $1.0" km/s"$, hợp với vectơ vận tốc ban đầu một góc $theta = 60^circ$. Vectơ vận tốc mới của vệ tinh sau khi đốt động cơ là $vec(v) = vec(v)_0 + Delta vec(v)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (3.2, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((3.4, -0.3), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)_0$])
    line((3.2, 0), (4.0, 1.4), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((4.2, 1.6), text(fill: rgb("dc2626"), size: 8.5pt)[$Delta vec(v)$])
    line(pO, (4.0, 1.4), mark: (end: ">", fill: rgb("d97706")), stroke: 2pt + rgb("d97706"))
    content((2.0, 1.2), text(fill: rgb("d97706"), size: 9pt, weight: "bold")[$vec(v)$])
    content((0, 0), [🛰️], anchor: "north-east")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tích vô hướng giữa vận tốc ban đầu và xung vận tốc là $vec(v)_0 dot Delta vec(v) = 3.75" (km/s)"^2$.]),
    True([Bình phương độ lớn vận tốc mới thỏa mãn: $v^2 = v_0^2 + |Delta vec(v)|^2 + 2 vec(v)_0 dot Delta vec(v)$.]),
    True([Bình phương độ lớn vận tốc mới đạt giá trị $v^2 = 64.75" (km/s)"^2$.]),
    [Tốc độ mới của vệ tinh sau khi đốt động cơ đạt đúng $8.5" km/s"$.]
  ),
  loigiai: [
    #step([Tích vô hướng hai vectơ vận tốc])
    $ vec(v)_0 dot Delta vec(v) = v_0 dot |Delta vec(v)| dot cos 60^circ = 7.5 dot 1.0 dot 1/2 = 3.75" (km/s)"^2 $
    Mệnh đề a ĐÚNG.

    #step([Hệ thức bình phương vô hướng])
    $ v^2 = vec(v)^2 = (vec(v)_0 + Delta vec(v))^2 = v_0^2 + |Delta vec(v)|^2 + 2 vec(v)_0 dot Delta vec(v) $
    Mệnh đề b ĐÚNG.

    #step([Tính toán bình phương độ lớn vận tốc mới])
    $ v^2 = 7.5^2 + 1.0^2 + 2 dot 3.75 = 56.25 + 1 + 7.5 = 64.75" (km/s)"^2 $
    Mệnh đề c ĐÚNG.

    #step([Tính tốc độ mới])
    $ v = sqrt(64.75) approx 8.047" km/s" != 8.5" km/s" $
    (Vận tốc chỉ đạt $8.5" km/s"$ nếu hai vectơ cùng hướng $theta = 0^circ$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho đoạn thẳng $A B$ có độ dài $A B = 8$, gọi $I$ là trung điểm của $A B$. Điểm $M$ trong mặt phẳng thỏa mãn đẳng thức tích vô hướng $vec(M A) dot vec(M B) = 9$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pI = (2.0, 0)
    let pB = (4.0, 0)
    let pM = (2.0, 2.0)
    line(pA, pB, stroke: 1.2pt + luma(140))
    line(pM, pI, stroke: 1.5pt + rgb("d97706"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((4.2, -0.2), text(size: 8pt)[$B$])
    circle(pI, radius: 2pt, fill: black)
    content((2.0, -0.3), text(size: 8pt)[$I$])
    circle(pM, radius: 2.5pt, fill: rgb("d97706"))
    content((2.0, 2.3), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$M$])
  })
]
Tính khoảng cách từ điểm $M$ đến trung điểm $I$ (độ dài đoạn thẳng $M I$).],
    [5],
    loigiai: [
        #step([Sử dụng công thức thu gọn qua trung điểm])
        Với $I$ là trung điểm của $A B$, ta có $I A = (A B) / 2 = 8 / 2 = 4$.
        $ vec(M A) dot vec(M B) = M I^2 - I A^2 $
        
        #step([Giải phương trình tìm MI])
        $ M I^2 - 4^2 = 9 <=> M I^2 - 16 = 9 <=> M I^2 = 25 <=> M I = 5 $
        Vậy khoảng cách $M I = 5$.
    ]
)

// TLN 2 (Câu 18)
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 3)$ và $B(5; 1)$. Điểm $M(x; 0)$ thuộc trục hoành $O x$ sao cho tích vô hướng $vec(M A) dot vec(M B)$ đạt giá trị nhỏ nhất.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.0, 2.4)
    let pB = (4.5, 0.8)
    let pM = (2.6, 0)
    line(pM, pA, stroke: 1.2pt + rgb("0d9488"))
    line(pM, pB, stroke: 1.2pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((1.0, 2.7), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((4.5, 1.1), text(size: 8pt)[$B$])
    circle(pM, radius: 2.5pt, fill: rgb("d97706"))
    content((2.6, -0.35), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$M$])
  })
]
Tìm hoành độ $x$ của điểm $M$.],
    [3],
    loigiai: [
        #step([Biểu diễn tích vô hướng theo x])
        $vec(M A) = (1 - x; 3)$ và $vec(M B) = (5 - x; 1)$.
        $ vec(M A) dot vec(M B) = (1 - x)(5 - x) + 3 dot 1 = x^2 - 6x + 5 + 3 = x^2 - 6x + 8 $
        
        #step([Tìm vị trí đạt cực tiểu])
        $ x^2 - 6x + 8 = (x - 3)^2 - 1 >= -1 $
        Dấu bằng xảy ra khi $x - 3 = 0 <=> x = 3$.
        Vậy hoành độ của điểm $M$ là $3$.
    ]
)

// TLN 3 (Câu 19)
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh là $a = 7, b = 8$ và $c = 5$ (với $a = B C, b = A C, c = A B$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pB = (0, 0)
    let pC = (3.5, 0)
    let pA = (1.0, 2.4)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("d97706"))
    circle(pA, radius: 2pt, fill: black)
    content((1.0, 2.7), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.7, -0.2), text(size: 8pt)[$C$])
  })
]
Tính giá trị của tích vô hướng $vec(B A) dot vec(B C)$.],
    [5],
    loigiai: [
        #step([Áp dụng hệ quả định lý côsin tại đỉnh B])
        $ A C^2 = B A^2 + B C^2 - 2 vec(B A) dot vec(B C) $
        $ <=> vec(B A) dot vec(B C) = (B A^2 + B C^2 - A C^2) / 2 $
        
        #step([Thay số tính toán])
        $ vec(B A) dot vec(B C) = (5^2 + 7^2 - 8^2) / 2 = (25 + 49 - 64) / 2 = 10 / 2 = 5 $
        Vậy kết quả bằng $5$.
    ]
)

// TLN 4 (Câu 20)
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Cho hai vectơ $vec(u)$ và $vec(v)$ thỏa mãn $|vec(u)| = 3, |vec(v)| = 4$ và $|vec(u) + vec(v)| = 5$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (2.4, 0), mark: (end: ">", fill: rgb("d97706")), stroke: 1.8pt + rgb("d97706"))
    content((2.5, -0.25), text(fill: rgb("d97706"), size: 8.5pt)[$vec(u)$])
    line(pO, (0, 3.0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-0.3, 3.0), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)$])
    line(pO, (2.4, 3.0), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((2.6, 3.2), text(fill: rgb("1e40af"), size: 8.5pt, weight: "bold")[$vec(u) + vec(v)$])
  })
]
Tính giá trị của tích vô hướng $vec(u) dot vec(v)$.],
    [0],
    loigiai: [
        #step([Khai triển bình phương vô hướng])
        $ |vec(u) + vec(v)|^2 = vec(u)^2 + vec(v)^2 + 2 vec(u) dot vec(v) $
        $ 5^2 = 3^2 + 4^2 + 2 vec(u) dot vec(v) $
        
        #step([Tính tích vô hướng])
        $ 25 = 9 + 16 + 2 vec(u) dot vec(v) <=> 25 = 25 + 2 vec(u) dot vec(v) <=> 2 vec(u) dot vec(v) = 0 <=> vec(u) dot vec(v) = 0 $
        (Điều này chứng tỏ hai vectơ $vec(u)$ và $vec(v)$ vuông góc với nhau).
    ]
)

// TLN 5 (Câu 21 - Thực tế Công suất kéo của đầu máy xe lửa)
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Một đầu máy xe lửa kéo đoàn toa tàu chuyển động thẳng đều trên đường ray với lực kéo không đổi $F = 40000" N"$ cùng hướng với chuyển động. Tàu di chuyển với tốc độ ổn định $v = 15" m/s"$. Công suất kéo cơ học tức thời của đầu máy được tính theo tích vô hướng $P = vec(F) dot vec(v)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 2pt + luma(120))
    rect((0.5, 0), (2.8, 1.2), fill: rgb("eff6ff"), stroke: 1.5pt + rgb("1e40af"))
    content((1.65, 0.6), [🚂 Đầu máy])
    line((2.8, 0.6), (4.6, 0.6), mark: (end: ">", fill: rgb("dc2626")), stroke: 2.2pt + rgb("dc2626"))
    content((4.8, 0.9), text(fill: rgb("dc2626"), size: 9pt, weight: "bold")[$vec(F)$])
    line((1.65, 1.4), (2.85, 1.4), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((3.2, 1.4), text(fill: rgb("0d9488"), size: 8pt)[$vec(v)$])
  })
]
Tính công suất kéo $P$ của đầu máy theo đơn vị kilôoát ($"kW"$).],
    [600],
    loigiai: [
        #step([Tính công suất theo đơn vị Oát])
        Vì lực kéo cùng hướng với vận tốc chuyển động nên góc giữa hai vectơ bằng $0^circ$:
        $ P = vec(F) dot vec(v) = F dot v dot cos 0^circ = 40000 dot 15 dot 1 = 600000" W" $
        
        #step([Đổi sang kilôoát])
        $ 600000" W" = 600" kW" $
        Vậy công suất kéo của đầu máy là $600" kW"$.
    ]
)

// TLN 6 (Câu 22 - Thực tế Bán kính phủ sóng trạm cảm biến)
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 115], back-to: "sec-exercise-hub",[Hai trạm thu phát tín hiệu địa chấn đặt cố định tại hai vị trí $A$ và $B$ cách nhau một khoảng $A B = 12" km"$. Để đo đạc chính xác, trạm điều hành lưu động di chuyển tại các điểm $M$ thỏa mãn điều kiện tương quan tín hiệu: $vec(M A) dot vec(M B) = 28$ ($"km"^2$). Vùng di chuyển của trạm lưu động là một đường tròn tâm $I$ (trung điểm của $A B$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pI = (2.2, 1.6)
    circle(pI, radius: 1.6, stroke: 1.5pt + rgb("d97706"))
    let pA = (0.9, 1.6)
    let pB = (3.5, 1.6)
    line(pA, pB, stroke: 1pt + luma(160))
    circle(pA, radius: 2.5pt, fill: rgb("0d9488"))
    content(pA, [📡 $A$], anchor: "east")
    circle(pB, radius: 2.5pt, fill: rgb("0d9488"))
    content(pB, [📡 $B$], anchor: "west")
    circle(pI, radius: 2pt, fill: black)
    content((2.2, 1.3), text(size: 8pt)[$I$])
    line(pI, (3.8, 1.6), stroke: 1.5pt + rgb("dc2626"))
    content((3.0, 1.85), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$R$])
  })
]
Tính bán kính $R$ của đường tròn vùng hoạt động theo đơn vị kilômét.],
    [8],
    loigiai: [
        #step([Xác định độ dài đoạn IA])
        $I$ là trung điểm của $A B$ nên $I A = (A B) / 2 = 12 / 2 = 6" km"$.
        
        #step([Áp dụng hệ thức thu gọn tích vô hướng])
        $ vec(M A) dot vec(M B) = M I^2 - I A^2 = 28 $
        $ M I^2 - 6^2 = 28 <=> M I^2 - 36 = 28 <=> M I^2 = 64 <=> M I = 8" km" $
        Vậy bán kính đường tròn vùng hoạt động là $R = 8" km"$.
    ]
)

// ── CỘT MỐC HOÀN THÀNH ─────────────────────────────────────
#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 24pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 11: TÍCH VÔ HƯỚNG CỦA HAI VECTƠ (ĐỀ SỐ 3 - NÂNG CAO)!]      #v(0.6em)
      #text(fill: white, size: 14pt)[
        Bạn đã hoàn thành xuất sắc toàn bộ 22 câu hỏi của đề thi!        Chúc các em tự tin đạt điểm số tối đa trong kỳ thi chính thức!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 12pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
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
