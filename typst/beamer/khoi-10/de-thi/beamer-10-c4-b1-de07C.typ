// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 7: CÁC KHÁI NIỆM MỞ ĐẦU VỀ VECTƠ (ĐỀ SỐ 3)
// Lớp: Khối 10  ·  Mã đề: 103  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 7: CÁC KHÁI NIỆM MỞ ĐẦU VỀ VECTƠ (ĐỀ SỐ 3)",
  subtitle: "ÔN TẬP CHƯƠNG 4 — MÃ ĐỀ: 103",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 103]],
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
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho ba điểm phân biệt $A, B, C$. Mệnh đề nào sau đây là điều kiện cần và đủ để ba điểm $A, B, C$ thẳng hàng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (1.8, 0)
    let pC = (3.5, 0)
    line((-0.5, 0), (4.0, 0), stroke: 0.6pt + luma(180))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.9, 0.35), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(A B)$])
    line(pA, pC, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((2.65, -0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(A C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.1, -0.25), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((1.8, -0.25), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.5, -0.25), text(size: 8.5pt, weight: "bold")[$C$])
  })
]],
    (
        True([Hai vectơ $vec(A B)$ và $vec(A C)$ cùng phương.]),
        [Hai vectơ $vec(A B)$ và $vec(A C)$ cùng hướng.],
        [Độ dài $|vec(A B)| = |vec(A C)|$.],
        [Hai vectơ $vec(B A)$ và $vec(C A)$ đối nhau.]
    ),
    loigiai: [
        Ba điểm phân biệt $A, B, C$ thẳng hàng khi và chỉ khi giá của vectơ $vec(A B)$ trùng với giá của vectơ $vec(A C)$, tức là hai vectơ $vec(A B)$ và $vec(A C)$ cùng phương.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho đoạn thẳng $A B$ có độ dài bằng $8" cm"$. Điểm $M$ nằm trên đường thẳng $A B$ sao cho vectơ $vec(A M)$ cùng hướng với vectơ $vec(A B)$ và $|vec(A M)| = 3" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pM = (1.4, 0)
    let pB = (3.6, 0)
    line(pA, pB, stroke: 0.8pt + luma(180))
    line(pA, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.7, 0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(A M)$])
    line(pA, (3.5, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.2pt + rgb("1e40af"))
    content((2.5, -0.35), text(fill: rgb("1e40af"), size: 8pt)[$vec(A B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pM, radius: 2pt, fill: black)
    content((1.4, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
    circle(pB, radius: 2pt, fill: black)
    content((3.8, 0), text(size: 8.5pt, weight: "bold")[$B$])
  })
]
Khẳng định nào sau đây là đúng?],
    (
        True([Điểm $M$ nằm giữa hai điểm $A$ và $B$.]),
        [Điểm $B$ nằm giữa hai điểm $A$ và $M$.],
        [Điểm $A$ nằm giữa hai điểm $M$ và $B$.],
        [Điểm $M$ trùng với trung điểm của đoạn thẳng $A B$.]
    ),
    loigiai: [
        Vì $vec(A M)$ cùng hướng với $vec(A B)$ nên $M$ thuộc tia $A B$. Lại có $A M = 3" cm" < A B = 8" cm"$, suy ra điểm $M$ nằm giữa hai điểm $A$ và $B$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho tam giác $A B C$. Có bao nhiêu vectơ khác vectơ-không có điểm đầu là đỉnh $A$ và điểm cuối là một đỉnh của tam giác $A B C$?],
    (
        True([$2$]),
        [$3$],
        [$4$],
        [$6$]
    ),
    loigiai: [
        Các vectơ khác $vec(0)$ có điểm đầu là $A$ và điểm cuối là đỉnh của tam giác là $vec(A B)$ và $vec(A C)$. Do đó có đúng $2$ vectơ thỏa mãn.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hình thoi $A B C D$ có độ dài cạnh bằng $a$. Khẳng định nào sau đây là đúng về độ dài các vectơ cạnh?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2, 0)
    let pD = (0.8, 1.4)
    let pC = (2.8, 1.4)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pB, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pC, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pD, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.0, 1.4), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0.6, 1.5), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$|vec(A B)| = |vec(B C)| = |vec(C D)| = |vec(D A)| = a$]),
        [$vec(A B) = vec(B C) = vec(C D) = vec(D A)$],
        [$|vec(A C)| = |vec(B D)| = a$],
        [$vec(A C) = vec(B D)$]
    ),
    loigiai: [
        Hình thoi có bốn cạnh bằng nhau nên độ dài của bốn vectơ cạnh đều bằng nhau và bằng độ dài cạnh hình thoi: $|vec(A B)| = |vec(B C)| = |vec(C D)| = |vec(D A)| = a$. Các vectơ không bằng nhau vì chúng khác hướng.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Trong cơ học, một lực tác dụng lên một vật thể được mô hình hóa bằng một vectơ vì lực có đầy đủ các yếu tố:],
    (
        True([Điểm đặt, phương, chiều và độ lớn.]),
        [Chỉ có phương và chiều.],
        [Chỉ có độ lớn và thời gian tác dụng.],
        [Điểm đặt và quỹ đạo chuyển động.]
    ),
    loigiai: [
        Lực là một đại lượng vectơ trong vật lý vì nó được xác định hoàn toàn bởi $4$ yếu tố: điểm đặt (gốc vectơ), phương và chiều (hướng của vectơ), và độ lớn (độ dài vectơ theo một tỉ lệ xích thích hợp).
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Hai lực cân bằng cùng tác dụng vào một chất điểm là hai lực được biểu diễn bởi hai vectơ:],
    (
        True([Có cùng độ lớn, cùng phương nhưng ngược chiều (hai vectơ đối nhau).]),
        [Có cùng độ lớn và cùng hướng (hai vectơ bằng nhau).],
        [Có phương vuông góc nhau và có cùng độ lớn.],
        [Có điểm đặt khác nhau và độ lớn bằng nhau.]
    ),
    loigiai: [
        Hai lực cân bằng tác dụng vào cùng một vật là hai lực cùng giá, cùng độ lớn nhưng ngược chiều. Hai vectơ biểu diễn chúng có tổng bằng vectơ-không: $vec(F)_1 + vec(F)_2 = vec(0) <=> vec(F)_1 = - vec(F)_2$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hình bình hành $A B C D$ tâm $O$. Vectơ đối của vectơ $vec(O A)$ là vectơ nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.2, 0)
    let pD = (1.0, 1.6)
    let pC = (3.2, 1.6)
    let pO = (1.6, 0.8)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pB, pD, stroke: (paint: luma(180), dash: "dashed"))
    line(pO, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.6, 0.25), text(fill: rgb("0d9488"), size: 8pt)[$vec(O A)$])
    line(pO, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((2.6, 1.35), text(fill: rgb("dc2626"), size: 8pt)[$vec(O C)$])
    circle(pO, radius: 2pt, fill: black)
    content((1.6, 1.05), text(size: 8pt, weight: "bold")[$O$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.4, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.4, 1.6), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0.8, 1.7), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$vec(O C)$]),
        [$vec(O A)$],
        [$vec(O B)$],
        [$vec(O D)$]
    ),
    loigiai: [
        $O$ là trung điểm của $A C$, do đó $O A = O C$ và hai tia $O A, O C$ đối nhau. Suy ra $vec(O C)$ ngược hướng và cùng độ dài với $vec(O A)$, tức là $vec(O C) = - vec(O A)$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hình vuông $A B C D$ có cạnh bằng $6" cm"$. Độ dài của vectơ đường chéo $vec(A C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 2)
    let pB = (2, 2)
    let pC = (2, 0)
    let pD = (0, 0)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.3, 1.2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 2.0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.2, 2.0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$6 sqrt(2)" cm"$]),
        [$12" cm"$],
        [$6" cm"$],
        [$3 sqrt(2)" cm"$]
    ),
    loigiai: [
        Áp dụng định lý Pytago trong tam giác vuông $A B C$:
        $ |vec(A C)| = A C = sqrt(A B^2 + B C^2) = sqrt(6^2 + 6^2) = 6 sqrt(2)" cm" $
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho tam giác đều $A B C$. Khẳng định nào sau đây là SAI?],
    (
        True([$vec(A B) = vec(B C)$]),
        [$|vec(A B)| = |vec(B C)|$],
        [$|vec(A C)| = |vec(C A)|$],
        [$|vec(A B)| = |vec(C A)|$]
    ),
    loigiai: [
        Tam giác đều có $A B = B C = C A$, do đó độ dài các vectơ bằng nhau. Tuy nhiên các đường thẳng $A B$ và $B C$ cắt nhau tại $B$ nên hai vectơ $vec(A B)$ và $vec(B C)$ không cùng phương, không thể bằng nhau. Khẳng định A là SAI.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hình chữ nhật $A B C D$ tâm $O$. Cặp vectơ nào sau đây là hai vectơ đối nhau?],
    (
        True([$vec(O A)$ và $vec(O C)$]),
        [$vec(O A)$ và $vec(O B)$],
        [$vec(A B)$ và $vec(D C)$],
        [$vec(A D)$ và $vec(B C)$]
    ),
    loigiai: [
        $O$ là trung điểm của $A C$ nên $vec(O A)$ và $vec(O C)$ cùng độ dài nhưng ngược hướng, do đó chúng là hai vectơ đối nhau: $vec(O A) = - vec(O C)$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho đoạn thẳng $A B$ có trung điểm là $I$. Tổng của hai vectơ $vec(I A) + vec(I B)$ bằng],
    (
        True([$vec(0)$]),
        [$vec(A B)$],
        [$vec(B A)$],
        [$2 vec(I A)$]
    ),
    loigiai: [
        Vì $I$ là trung điểm của $A B$ nên $vec(I A)$ và $vec(I B)$ là hai vectơ đối nhau, tổng của hai vectơ đối nhau luôn bằng vectơ-không: $vec(I A) + vec(I B) = vec(0)$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một chất điểm $M$ đứng yên chịu tác dụng của hai lực $vec(F)_1$ và $vec(F)_2$. Mối quan hệ giữa hai vectơ lực là],
    (
        True([$vec(F)_1 = - vec(F)_2$]),
        [$vec(F)_1 = vec(F)_2$],
        [$|vec(F)_1| != |vec(F)_2|$],
        [$vec(F)_1 perp vec(F)_2$]
    ),
    loigiai: [
        Chất điểm đứng yên cân bằng khi hợp lực tác dụng lên nó bằng vectơ-không: $vec(F)_1 + vec(F)_2 = vec(0) <=> vec(F)_1 = - vec(F)_2$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Ba điểm thẳng hàng)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Trên đường thẳng $d$, cho đoạn thẳng $A B$ có độ dài bằng $12" cm"$. Lấy điểm $C$ thuộc đoạn thẳng $A B$ sao cho $A C = 4" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pC = (2, 0)
    let pB = (6, 0)
    
    // Đường thẳng d
    line((-0.8, 0), (6.8, 0), stroke: 0.5pt + luma(160))
    content((6.7, -0.35), text(size: 8.5pt)[$d$])
    
    // Các đoạn thẳng
    line(pA, pB, stroke: 1.5pt + rgb("d97706"))
    
    // Mũi tên AC và AB
    line(pA, pC, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    line((0, 0.4), (6, 0.4), mark: (end: ">", fill: rgb("059669")), stroke: 1.5pt + rgb("059669"))
    content((3, 0.7), text(fill: rgb("059669"), size: 8.5pt)[$vec(A B) (12" cm")$])
    
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0), -0.3), text(weight: "bold")[$A$])
    circle(pC, radius: 2.5pt, fill: rgb("1e40af"))
    content((pC.at(0), -0.3), text(fill: rgb("1e40af"), weight: "bold")[$C (4" cm")$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0), -0.3), text(weight: "bold")[$B$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ $vec(A C)$ và $vec(A B)$ cùng phương và cùng hướng.]),
    True([Độ dài của vectơ $vec(C B)$ là $|vec(C B)| = 8" cm"$.]),
    True([Hai vectơ $vec(C A)$ và $vec(C B)$ là hai vectơ ngược hướng nhau.]),
    [Hai vectơ $vec(A C)$ và $vec(B C)$ là hai vectơ cùng hướng.]
  ),
  loigiai: [
    #step([Xét tính cùng hướng của AC và AB])
    Điểm $C$ thuộc đoạn $A B$ nên tia $A C$ trùng với tia $A B$. Do đó hai vectơ $vec(A C)$ và $vec(A B)$ cùng phương và cùng hướng. Mệnh đề a ĐÚNG.

    #step([Tính độ dài vectơ CB])
    Vì $C$ nằm giữa $A$ và $B$ nên:
    $ |vec(C B)| = C B = A B - A C = 12 - 4 = 8" cm" $
    Mệnh đề b ĐÚNG.

    #step([Xét hai vectơ CA và CB])
    Điểm $C$ nằm giữa $A$ và $B$, do đó hai tia $C A$ và $C B$ là hai tia đối nhau. Vậy $vec(C A)$ và $vec(C B)$ ngược hướng nhau. Mệnh đề c ĐÚNG.

    #step([Xét hai vectơ AC và BC])
    Vectơ $vec(A C)$ có hướng từ trái sang phải, vectơ $vec(B C)$ có hướng từ phải sang trái. Hai vectơ này ngược hướng nhau, không thể cùng hướng. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Hình chữ nhật và tâm)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hình chữ nhật $A B C D$ có $A B = 8" cm"$, $B C = 6" cm"$. Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 2.4)
    let pB = (4, 2.4)
    let pC = (4, 0)
    let pD = (0, 0)
    let pO = (2, 1.2)
    
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("d97706"))
    line(pA, pC, stroke: (paint: luma(120), dash: "dashed"))
    line(pB, pD, stroke: (paint: luma(120), dash: "dashed"))
    
    // Vectơ AB và DC
    line(pA, pB, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.6pt + rgb("1e40af"))
    line(pD, pC, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.6pt + rgb("1e40af"))
    
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) - 0.25, pA.at(1) + 0.25), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) + 0.25, pB.at(1) + 0.25), text(weight: "bold")[$B$])
    circle(pC, radius: 2.5pt, fill: black)
    content((pC.at(0) + 0.25, pC.at(1) - 0.25), text(weight: "bold")[$C$])
    circle(pD, radius: 2.5pt, fill: black)
    content((pD.at(0) - 0.25, pD.at(1) - 0.25), text(weight: "bold")[$D$])
    circle(pO, radius: 2pt, fill: black)
    content((pO.at(0), pO.at(1) - 0.3), text(weight: "bold")[$O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([$vec(A B) = vec(D C)$.]),
    True([Độ dài của vectơ đường chéo $|vec(B D)| = 10" cm"$.]),
    True([$|vec(O A)| = |vec(O B)| = |vec(O C)| = |vec(O D)| = 5" cm"$.]),
    [Hai vectơ $vec(O A)$ và $vec(O B)$ bằng nhau.]
  ),
  loigiai: [
    #step([Xét hai vectơ AB và DC])
    Hình chữ nhật $A B C D$ có $A B parallel D C$ và $A B = D C = 8" cm"$. Hướng từ $A$ đến $B$ cùng hướng từ $D$ đến $C$. Do đó $vec(A B) = vec(D C)$. Mệnh đề a ĐÚNG.

    #step([Tính độ dài đường chéo BD])
    Áp dụng định lý Pytago trong tam giác vuông $B C D$:
    $ |vec(B D)| = B D = sqrt(B C^2 + C D^2) = sqrt(6^2 + 8^2) = sqrt(100) = 10" cm" $
    Mệnh đề b ĐÚNG.

    #step([Tính độ dài các bán kính đường tròn ngoại tiếp])
    Trong hình chữ nhật, hai đường chéo bằng nhau và cắt nhau tại trung điểm của mỗi đường:
    $ O A = O B = O C = O D = (A C) / 2 = 10 / 2 = 5" cm" $
    Do đó độ dài của bốn vectơ này đều bằng nhau và bằng $5" cm"$. Mệnh đề c ĐÚNG.

    #step([So sánh OA và OB])
    Mặc dù $|vec(O A)| = |vec(O B)| = 5" cm"$, nhưng hai đường thẳng $O A$ và $O B$ cắt nhau tại $O$ và không trùng nhau (chúng không cùng phương), do đó $vec(O A) != vec(O B)$. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Hai tàu kéo xà lan)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một chiếc xà lan chở container ở vị trí $O$ được hai chiếc tàu kéo lai dắt bằng hai sợi dây cáp thép. Hai dây cáp tạo với nhau một góc vuông $90^circ$. Tàu kéo thứ nhất tác dụng lực kéo $vec(F)_1$ có độ lớn $6000" N"$, tàu kéo thứ hai tác dụng lực kéo $vec(F)_2$ có độ lớn $8000" N"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let p1 = (3, 0)
    let p2 = (0, 4)
    let pF = (3, 4)
    
    // Hình chữ nhật hợp lực
    line(p1, pF, stroke: (paint: luma(140), dash: "dashed"))
    line(p2, pF, stroke: (paint: luma(140), dash: "dashed"))
    
    // Vectơ lực F1
    line(pO, p1, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.5, -0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_1 (6000" N")$])
    
    // Vectơ lực F2
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.0, 2), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_2 (8000" N")$])
    
    // Vectơ hợp lực F
    line(pO, pF, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.8, 2.3), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F) = vec(F)_1 + vec(F)_2$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, -0.4), [⚓ $O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ lực kéo $vec(F)_1$ và $vec(F)_2$ có giá vuông góc với nhau.]),
    True([Hợp lực kéo $vec(F) = vec(F)_1 + vec(F)_2$ được biểu diễn bởi đường chéo của hình chữ nhật có hai cạnh là $F_1$ và $F_2$.]),
    True([Độ lớn của hợp lực kéo tác dụng lên xà lan là $10000" N"$.]),
    [Nếu hai tàu cùng kéo xà lan theo cùng một hướng song song thì độ lớn của hợp lực kéo vẫn bằng $10000" N"$.]
  ),
  loigiai: [
    #step([Phương của hai vectơ lực])
    Theo đề bài, hai sợi dây cáp tạo với nhau góc $90^circ$, do đó hai vectơ lực $vec(F)_1$ và $vec(F)_2$ có giá vuông góc nhau. Mệnh đề a ĐÚNG.

    #step([Quy tắc hình bình hành])
    Theo quy tắc hình bình hành tổng hợp lực, hợp lực của hai lực vuông góc là đường chéo của hình chữ nhật có hai cạnh kề tương ứng với $vec(F)_1$ và $vec(F)_2$. Mệnh đề b ĐÚNG.

    #step([Tính độ lớn hợp lực vuông góc])
    Độ lớn của hợp lực kéo là:
    $ F = sqrt(F_1^2 + F_2^2) = sqrt(6000^2 + 8000^2) = sqrt(36000000 + 64000000) = 10000" N" $
    Mệnh đề c ĐÚNG.

    #step([Xét trường hợp hai lực cùng hướng])
    Khi hai lực cùng hướng (song song cùng chiều), độ lớn của hợp lực bằng tổng đại số:
    $ F' = F_1 + F_2 = 6000 + 8000 = 14000" N" != 10000" N" $
    Do đó mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Biển quảng cáo treo cáp)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một tấm biển quảng cáo khối lượng nặng được treo thăng bằng cố định phía dưới trần nhà nằm ngang nhờ hai sợi dây cáp đối xứng $O A$ và $O B$. Trọng lực của biển quảng cáo tác dụng tại điểm $O$ được biểu diễn bởi vectơ $vec(P)$ có phương thẳng đứng hướng xuống với độ lớn $P = 600" N"$. Lực căng trên hai sợi dây cáp là $vec(T)_1$ và $vec(T)_2$ cùng tạo với trần nhà một góc $45^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pA = (-2.5, 2.5)
    let pB = (2.5, 2.5)
    let pP = (0, -2.5)
    let pT = (0, 2.5)
    
    // Trần nhà
    line((-3.2, 2.5), (3.2, 2.5), stroke: 2pt + luma(100))
    content((2.8, 2.8), text(size: 8.5pt)[Trần nhà])
    
    // Hai sợi dây cáp
    line(pO, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.6, 1.5), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(T)_1$])
    
    line(pO, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.6, 1.5), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(T)_2$])
    
    // Hợp lực căng T
    line(pO, pT, mark: (end: ">", fill: rgb("1e40af")), stroke: (paint: rgb("1e40af"), dash: "dashed", thickness: 1.8pt))
    content((0.5, 1.8), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(T)$])
    
    // Trọng lực P
    line(pO, pP, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((0.8, -1.5), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(P) (600" N")$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, -0.3), [🪧 $O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ trọng lực $vec(P)$ có phương thẳng đứng và hướng từ trên xuống dưới.]),
    True([Do tính đối xứng nên độ lớn lực căng của hai sợi dây cáp bằng nhau: $T_1 = T_2$.]),
    True([Hợp lực của hai lực căng $vec(T) = vec(T)_1 + vec(T)_2$ có phương thẳng đứng, hướng lên trên và có độ lớn bằng $600" N"$ để cân bằng với trọng lực $vec(P)$.]),
    [Độ lớn lực căng trên mỗi sợi dây cáp bằng đúng $300" N"$.]
  ),
  loigiai: [
    #step([Phương và chiều của trọng lực])
    Trọng lực luôn có phương thẳng đứng, chiều từ trên xuống dưới hướng về tâm Trái Đất. Mệnh đề a ĐÚNG.

    #step([Tính đối xứng của lực căng])
    Vì hai sợi dây đối xứng qua phương thẳng đứng và góc nghiêng bằng nhau ($45^circ$) nên độ lớn lực căng của hai dây bằng nhau: $T_1 = T_2$. Mệnh đề b ĐÚNG.

    #step([Điều kiện cân bằng tĩnh học])
    Biển quảng cáo đứng yên thăng bằng nên tổng hợp lực tác dụng lên điểm $O$ bằng vectơ-không:
    $ vec(T)_1 + vec(T)_2 + vec(P) = vec(0) <=> vec(T) = - vec(P) $
    Do đó hợp lực căng $vec(T) = vec(T)_1 + vec(T)_2$ có phương thẳng đứng hướng lên và có độ lớn $T = P = 600" N"$. Mệnh đề c ĐÚNG.

    #step([Tính độ lớn lực căng mỗi dây])
    Chiếu phương trình lên phương thẳng đứng:
    $ T_1 sin 45^circ + T_2 sin 45^circ = P <=> 2 T_1 dot (sqrt(2) / 2) = 600 <=> T_1 sqrt(2) = 600 $
    $ => T_1 = T_2 = 600 / sqrt(2) = 300 sqrt(2) approx 300 dot 1.414 = 424.2" N" $
    Giá trị này khác $300" N"$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho lục giác đều $A B C D E F$. Hỏi có bao nhiêu vectơ khác vectơ-không có điểm đầu và điểm cuối là hai đỉnh phân biệt của lục giác đã cho?],
    [30],
    loigiai: [
        #step([Tính số lượng vectơ bằng công thức chỉnh hợp])
        Lục giác đều có $6$ đỉnh phân biệt. Mỗi vectơ khác $vec(0)$ được tạo thành bằng cách chọn có thứ tự $2$ đỉnh trong $6$ đỉnh:
        $ A_6^2 = 6 dot 5 = 30 $
        Vậy có tất cả $30$ vectơ khác $vec(0)$.
    ]
)

// TLN 2 (Câu 18)
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hình thoi $A B C D$ có độ dài hai đường chéo lần lượt là $A C = 16" cm"$ và $B D = 12" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.8)
    let pC = (0, -1.8)
    let pB = (2.4, 0)
    let pD = (-2.4, 0)
    let pO = (0, 0)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, stroke: (paint: luma(180), dash: "dashed"))
    line(pD, pB, stroke: (paint: luma(180), dash: "dashed"))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.4, 1.1), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A B)$])
    circle(pO, radius: 2pt, fill: black)
    content((0.2, -0.2), text(size: 8pt, weight: "bold")[$O$])
    circle(pA, radius: 2pt, fill: black)
    content((0, 2.05), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.65, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0, -2.05), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-2.65, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ cạnh $vec(A B)$ theo đơn vị centimét.],
    [10],
    loigiai: [
        #step([Tính nửa độ dài hai đường chéo])
        Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$.
        Trong hình thoi, hai đường chéo vuông góc với nhau tại trung điểm của mỗi đường:
        $ O A = (A C) / 2 = 16 / 2 = 8" cm", quad O B = (B D) / 2 = 12 / 2 = 6" cm" $
        
        #step([Áp dụng định lý Pytago tính cạnh AB])
        Tam giác $O A B$ vuông tại $O$:
        $ A B = sqrt(O A^2 + O B^2) = sqrt(8^2 + 6^2) = sqrt(64 + 36) = sqrt(100) = 10" cm" $
        Vậy $|vec(A B)| = 10" cm"$.
    ]
)

// TLN 3 (Câu 19)
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ vuông tại $A$ có góc $hat(B) = 30^circ$ và cạnh huyền $B C = 10" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3.46, 0)
    let pC = (0, 2)
    line((0.3, 0), (0.3, 0.3), (0, 0.3), stroke: 0.7pt + black)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-0.45, 1.0), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    content((2.6, 0.25), text(size: 7.5pt)[$30^circ$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.7, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0, 2.2), text(size: 8.5pt, weight: "bold")[$C$])
  })
]
Tính độ dài của vectơ $vec(A C)$ theo đơn vị centimét.],
    [5],
    loigiai: [
        #step([Áp dụng tỉ số lượng giác trong tam giác vuông])
        Trong tam giác vuông $A B C$ vuông tại $A$:
        $ A C = B C dot sin B = 10 dot sin 30^circ = 10 dot 1/2 = 5" cm" $
        Vậy độ dài vectơ là $|vec(A C)| = A C = 5" cm"$.
    ]
)

// TLN 4 (Câu 20)
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho tam giác đều $A B C$ có độ dài cạnh bằng $9" cm"$. Gọi $M$ là trung điểm của cạnh $B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (1.5, 0)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.85, 1.3), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(A M)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.85), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((1.5, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
  })
]
Tính độ dài của vectơ đường cao $vec(A M)$ theo đơn vị centimét (làm tròn kết quả đến chữ số thập phân thứ nhất).
(Cho biết $sqrt(3) approx 1.732$)],
    [7.8],
    loigiai: [
        #step([Tính độ dài đường cao AM])
        Trong tam giác đều cạnh $a = 9" cm"$, đường cao $A M$ là:
        $ A M = (a sqrt(3)) / 2 = (9 sqrt(3)) / 2 = 4.5 sqrt(3) approx 4.5 dot 1.73205 = 7.794" cm" $
        Làm tròn kết quả đến chữ số thập phân thứ nhất ta được $7.8" cm"$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Ba lực cân bằng)
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một chất điểm $O$ nằm cân bằng trên mặt phẳng dưới tác dụng của ba lực đồng phẳng $vec(F)_1, vec(F)_2, vec(F)_3$ thỏa mãn $vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0)$. Biết rằng hai lực $vec(F)_1$ và $vec(F)_2$ có phương vuông góc với nhau và có độ lớn lần lượt là $F_1 = 36" N"$, $F_2 = 48" N"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let p1 = (2.4, 0)
    let p2 = (0, 3.2)
    let p12 = (2.4, 3.2)
    let p3 = (-2.4, -3.2)
    
    // Hình chữ nhật F1, F2
    line(p1, p12, stroke: (paint: luma(140), dash: "dashed"))
    line(p2, p12, stroke: (paint: luma(140), dash: "dashed"))
    
    // Vectơ F1, F2
    line(pO, p1, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.2, -0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_1 (36" N")$])
    
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.0, 1.6), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_2 (48" N")$])
    
    // Vectơ tổng F1 + F2
    line(pO, p12, mark: (end: ">", fill: luma(120)), stroke: (paint: luma(120), dash: "dashed", thickness: 1.5pt))
    content((1.8, 1.8), text(fill: luma(100), size: 8pt)[$vec(F)_1 + vec(F)_2$])
    
    // Vectơ F3 cân bằng
    line(pO, p3, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((-1.6, -1.8), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F)_3$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.3, 0.3), [🎯 $O$])
  })
]
Tính độ lớn của lực $vec(F)_3$ theo đơn vị Newton.],
    [60],
    loigiai: [
        #step([Mối quan hệ giữa F3 và hợp lực F1, F2])
        Từ điều kiện cân bằng $vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0)$, ta suy ra:
        $ vec(F)_3 = - (vec(F)_1 + vec(F)_2) $
        Do đó độ lớn của $vec(F)_3$ bằng độ lớn của hợp lực $vec(F)_1 + vec(F)_2$:
        $ F_3 = |vec(F)_3| = |vec(F)_1 + vec(F)_2| $
        
        #step([Tính độ lớn hợp lực vuông góc])
        Vì $vec(F)_1 perp vec(F)_2$ nên:
        $ F_3 = sqrt(F_1^2 + F_2^2) = sqrt(36^2 + 48^2) = sqrt(1296 + 2304) = sqrt(3600) = 60" N" $
    ]
)

// TLN 6 (Câu 22 - Vận dụng cao Thực tế Hai tàu kéo hợp lực 60 độ)
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Hai chiếc tàu kéo cùng tác dụng hai lực kéo $vec(F)_1$ và $vec(F)_2$ vào một chiếc sà lan tại điểm $O$. Hai lực kéo này tạo với nhau một góc $60^circ$ và có độ lớn lần lượt là $F_1 = 4000" N"$, $F_2 = 6000" N"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let F1 = 2.4
    let F2 = 3.6
    let ang = 60deg
    let p1 = (F1, 0)
    let p2 = (F2 * calc.cos(ang), F2 * calc.sin(ang))
    let pF = (p1.at(0) + p2.at(0), p2.at(1))
    
    // Hình bình hành hợp lực
    line(p1, pF, stroke: (paint: luma(140), dash: "dashed"))
    line(p2, pF, stroke: (paint: luma(140), dash: "dashed"))
    
    // Cung góc 60 độ
    draw_angle_arc(pO, 0deg, 60deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((1.0, 0.35), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
    
    // Vectơ lực F1 và F2
    line(pO, p1, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.2, -0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_1 (4000" N")$])
    
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.5, 2.0), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_2 (6000" N")$])
    
    // Vectơ hợp lực F
    line(pO, pF, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((pF.at(0) + 0.6, pF.at(1)), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F)$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.3, -0.3), [🚢 $O$])
  })
]
Tính độ lớn của hợp lực kéo $vec(F) = vec(F)_1 + vec(F)_2$ tác dụng lên sà lan theo đơn vị Newton (làm tròn kết quả đến hàng đơn vị).
(Cho biết $sqrt(19) approx 4.3589$)],
    [8718],
    loigiai: [
        #step([Công thức tính độ lớn hợp lực của hai vectơ])
        Theo quy tắc hình bình hành, độ lớn của hợp lực $vec(F) = vec(F)_1 + vec(F)_2$ khi góc giữa hai vectơ là $alpha = 60^circ$ được tính theo công thức:
        $ F^2 = F_1^2 + F_2^2 + 2 F_1 F_2 cos alpha $
        
        #step([Thay số tính toán])
        $ F^2 = 4000^2 + 6000^2 + 2(4000)(6000) cos 60^circ $
        $ F^2 = 16000000 + 36000000 + 48000000 dot (1/2) = 52000000 + 24000000 = 76000000 $
        $ => F = sqrt(76000000) = 2000 sqrt(19) $
        Thay số: $F approx 2000 dot 4.358899 = 8717.798" N"$.
        Làm tròn kết quả đến hàng đơn vị ta được $8718" N"$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 7: CÁC KHÁI NIỆM MỞ ĐẦU VỀ VECTƠ (ĐỀ SỐ 3)!]      #v(0.6em)
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
