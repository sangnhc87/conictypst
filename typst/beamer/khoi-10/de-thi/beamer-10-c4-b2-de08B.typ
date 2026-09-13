// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 8: TỔNG VÀ HIỆU CỦA HAI VECTƠ (ĐỀ SỐ 2)
// Lớp: Khối 10  ·  Mã đề: 105  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 8: TỔNG VÀ HIỆU CỦA HAI VECTƠ (ĐỀ SỐ 2)",
  subtitle: "ÔN TẬP CHƯƠNG 4 — MÃ ĐỀ: 105",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 105]],
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
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có trọng tâm là $G$. Đẳng thức vectơ nào sau đây luôn đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.3)
    let pB = (0, 0)
    let pC = (3.5, 0)
    let pG = ((pA.at(0)+pB.at(0)+pC.at(0))/3, (pA.at(1)+pB.at(1)+pC.at(1))/3)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pG, pA, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.5pt + rgb("dc2626"))
    content((pG.at(0) - 0.25, 1.6), text(fill: rgb("dc2626"), size: 8pt)[$vec(G A)$])
    line(pG, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((0.5, 0.6), text(fill: rgb("0d9488"), size: 8pt)[$vec(G B)$])
    line(pG, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((2.8, 0.6), text(fill: rgb("0d9488"), size: 8pt)[$vec(G C)$])
    circle(pA, radius: 2pt, fill: black)
    content((pA.at(0), 2.55), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.7, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pG, radius: 2.5pt, fill: rgb("dc2626"))
    content((pG.at(0) + 0.3, pG.at(1) - 0.2), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$G$])
  })
]],
    (
        True([$vec(G A) + vec(G B) + vec(G C) = vec(0)$]),
        [$vec(G A) + vec(G B) + vec(G C) = vec(A B)$],
        [$vec(A G) + vec(B G) + vec(C G) = 3 vec(G A)$],
        [$vec(G A) = vec(G B) = vec(G C)$]
    ),
    loigiai: [
        Theo tính chất trọng tâm tam giác, điểm $G$ là trọng tâm của tam giác $A B C$ khi và chỉ khi:
        $ vec(G A) + vec(G B) + vec(G C) = vec(0) $
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho đoạn thẳng $A B$ có trung điểm là $I$. Với điểm $M$ tùy ý trong mặt phẳng, khẳng định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3, 0)
    let pI = (1.5, 0)
    let pM = (1.5, 1.8)
    line(pA, pB, stroke: 1pt + luma(160))
    line(pM, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((0.4, 0.9), text(fill: rgb("0d9488"), size: 8pt)[$vec(M A)$])
    line(pM, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((2.6, 0.9), text(fill: rgb("0d9488"), size: 8pt)[$vec(M B)$])
    line(pM, pI, mark: (end: ">", fill: rgb("dc2626")), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 1.8pt))
    content((1.9, 0.9), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(M I)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pI, radius: 2pt, fill: black)
    content((1.5, -0.25), text(size: 8.5pt, weight: "bold")[$I$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pM, radius: 2pt, fill: black)
    content((1.5, 2.05), text(size: 8.5pt, weight: "bold")[$M$])
  })
]],
    (
        True([$vec(M A) + vec(M B) = 2 vec(M I)$]),
        [$vec(M A) + vec(M B) = vec(M I)$],
        [$vec(M A) + vec(M B) = vec(A B)$],
        [$vec(M A) - vec(M B) = 2 vec(M I)$]
    ),
    loigiai: [
        Vì $I$ là trung điểm của $A B$ nên $vec(I A) + vec(I B) = vec(0)$.
        Chèn điểm $I$ vào vế trái:
        $ vec(M A) + vec(M B) = (vec(M I) + vec(I A)) + (vec(M I) + vec(I B)) = 2 vec(M I) + (vec(I A) + vec(I B)) = 2 vec(M I) $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho lục giác đều $A B C D E F$ có tâm đối xứng $O$. Tổng hai vectơ $vec(O A) + vec(O D)$ bằng vectơ nào?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let r = 1.4
    let pts = ()
    for i in range(6) {
      let ang = i * 60deg
      pts.push((r * calc.cos(ang), r * calc.sin(ang)))
    }
    line(pts.at(0), pts.at(1), pts.at(2), pts.at(3), pts.at(4), pts.at(5), close: true, stroke: 0.8pt + rgb("0d9488"))
    line(pts.at(5), pts.at(2), stroke: (paint: luma(160), dash: "dashed"))
    line((0, 0), pts.at(5), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    line((0, 0), pts.at(2), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    content((0.7, -0.65), text(fill: rgb("dc2626"), size: 8pt)[$vec(O A)$])
    content((-0.7, 0.65), text(fill: rgb("dc2626"), size: 8pt)[$vec(O D)$])
    circle((0, 0), radius: 2pt, fill: black)
    content((0.2, 0.2), text(size: 8pt, weight: "bold")[$O$])
    circle(pts.at(5), radius: 2pt, fill: black)
    content((pts.at(5).at(0) + 0.2, pts.at(5).at(1) - 0.2), text(size: 8pt, weight: "bold")[$A$])
    circle(pts.at(2), radius: 2pt, fill: black)
    content((pts.at(2).at(0) - 0.2, pts.at(2).at(1) + 0.2), text(size: 8pt, weight: "bold")[$D$])
  })
]],
    (
        True([$vec(0)$]),
        [$vec(A D)$],
        [$vec(D A)$],
        [$2 vec(O A)$]
    ),
    loigiai: [
        Trong lục giác đều $A B C D E F$ tâm $O$, điểm $O$ là trung điểm của đường chéo chính $A D$. Do đó hai vectơ $vec(O A)$ và $vec(O D)$ là hai vectơ đối nhau, suy ra $vec(O A) + vec(O D) = vec(0)$.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho hình bình hành $A B C D$. Biểu thức $vec(C B) + vec(C D)$ bằng vectơ nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.5)
    let pB = (1.2, 1.5)
    let pD = (-1.2, 0)
    let pC = (0, 0)
    line(pA, pB, stroke: 0.8pt + luma(160))
    line(pA, pD, stroke: 0.8pt + luma(160))
    line(pC, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((1.0, 0.7), text(fill: rgb("0d9488"), size: 8pt)[$vec(C B)$])
    line(pC, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((-0.8, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(C D)$])
    line(pC, pA, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((-0.3, 0.8), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(C A)$])
    circle(pA, radius: 2pt, fill: black)
    content((pA.at(0) - 0.25, pA.at(1)), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((pB.at(0) + 0.25, pB.at(1)), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((pC.at(0) + 0.25, pC.at(1) - 0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((pD.at(0) - 0.25, pD.at(1) - 0.2), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$vec(C A)$]),
        [$vec(A C)$],
        [$vec(B D)$],
        [$vec(D B)$]
    ),
    loigiai: [
        Theo quy tắc hình bình hành áp dụng tại đỉnh $C$, tổng hai vectơ chung gốc $C$ tương ứng với hai cạnh kề bằng vectơ đường chéo xuất phát từ $C$:
        $ vec(C B) + vec(C D) = vec(C A) $
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho hình vuông $A B C D$ có cạnh bằng $a$. Độ dài của vectơ $vec(A B) - vec(B C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 2)
    let pB = (2, 2)
    let pC = (2, 0)
    let pD = (0, 0)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pB, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pD, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((0.8, 1.3), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(D B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.25, 2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.25, 2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.25, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.25, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$a sqrt(2)$]),
        [$a$],
        [$2a$],
        [$0$]
    ),
    loigiai: [
        Vì trong hình vuông $A B C D$ ta có $vec(B C) = vec(A D)$, nên:
        $ vec(A B) - vec(B C) = vec(A B) - vec(A D) = vec(D B) $
        Độ dài đường chéo hình vuông là $D B = a sqrt(2)$, do đó $|vec(A B) - vec(B C)| = a sqrt(2)$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho ba điểm phân biệt $A, B, C$. Biểu thức $vec(A B) - vec(C B)$ bằng vectơ nào sau đây?],
    (
        True([$vec(A C)$]),
        [$vec(C A)$],
        [$vec(B C)$],
        [$vec(B A)$]
    ),
    loigiai: [
        Ta biến đổi phép trừ: $vec(A B) - vec(C B) = vec(A B) + vec(B C) = vec(A C)$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$. Gọi $M$ là trung điểm của cạnh $B C$. Hiệu hai vectơ $vec(B M) - vec(C M)$ bằng vectơ nào?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (1.5, 0)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pB, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pC, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pB, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 1.8pt))
    content((1.5, -0.35), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(B C)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.25), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((1.5, 0.25), text(size: 8.5pt, weight: "bold")[$M$])
  })
]],
    (
        True([$vec(B C)$]),
        [$vec(0)$],
        [$vec(C B)$],
        [$2 vec(B M)$]
    ),
    loigiai: [
        Vì $M$ là trung điểm của $B C$ nên $vec(C M) = - vec(M C)$, do đó:
        $ vec(B M) - vec(C M) = vec(B M) + vec(M C) = vec(B C) $
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Điều kiện cần và đủ để điểm $G$ là trọng tâm của tam giác $A B C$ là],
    (
        True([$vec(G A) + vec(G B) + vec(G C) = vec(0)$]),
        [$G A = G B = G C$],
        [$vec(A G) + vec(B G) + vec(C G) = vec(A B)$],
        [$vec(G A) + vec(G B) = vec(G C)$]
    ),
    loigiai: [
        Trong mặt phẳng, điểm $G$ là trọng tâm tam giác $A B C$ khi và chỉ khi hệ thức vectơ $vec(G A) + vec(G B) + vec(G C) = vec(0)$ được thỏa mãn.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho hình thoi $A B C D$ có cạnh bằng $a$ và góc $hat(B A D) = 60^circ$. Độ dài của vectơ $vec(A B) + vec(A D)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2, 0)
    let pD = (1, 1.732)
    let pC = (3, 1.732)
    line(pB, pC, pD, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.8, 1.0), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 1.73), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0.8, 1.8), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$a sqrt(3)$]),
        [$a$],
        [$2a$],
        [$a sqrt(2)$]
    ),
    loigiai: [
        Theo quy tắc hình bình hành: $vec(A B) + vec(A D) = vec(A C)$.
        Trong hình thoi cạnh $a$ có góc $60^circ$, tam giác $A B D$ là tam giác đều cạnh $a$ nên $B D = a$.
        Đường chéo dài $A C = 2 dot (a sqrt(3)) / 2 = a sqrt(3)$.
        Do đó $|vec(A B) + vec(A D)| = a sqrt(3)$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho hình thoi $A B C D$ có cạnh bằng $a$ và góc $hat(B A D) = 60^circ$. Độ dài của vectơ $vec(A B) - vec(A D)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2, 0)
    let pD = (1, 1.732)
    let pC = (3, 1.732)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pD, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.7, 0.9), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(D B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 1.73), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0.8, 1.8), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$a$]),
        [$a sqrt(3)$],
        [$2a$],
        [$a / 2$]
    ),
    loigiai: [
        Theo quy tắc trừ hai vectơ chung gốc:
        $ vec(A B) - vec(A D) = vec(D B) $
        Vì tam giác $A B D$ cân tại $A$ và có góc $hat(A) = 60^circ$ nên nó là tam giác đều cạnh $a$.
        Do đó $D B = a => |vec(A B) - vec(A D)| = a$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho hai vectơ khác vectơ-không $vec(a)$ và $vec(b)$. Đẳng thức $|vec(a) + vec(b)| = |vec(a) - vec(b)|$ xảy ra khi và chỉ khi],
    (
        True([Hai vectơ $vec(a)$ và $vec(b)$ có giá vuông góc với nhau.]),
        [Hai vectơ $vec(a)$ và $vec(b)$ cùng hướng.],
        [Hai vectơ $vec(a)$ và $vec(b)$ ngược hướng.],
        [Hai vectơ $vec(a)$ và $vec(b)$ có độ dài bằng nhau.]
    ),
    loigiai: [
        Dựng hình bình hành có hai cạnh kề biểu diễn bởi $vec(a)$ và $vec(b)$. Khi đó hai đường chéo biểu diễn bởi $vec(a) + vec(b)$ và $vec(a) - vec(b)$.
        Độ dài hai đường chéo bằng nhau khi và chỉ khi hình bình hành đó là hình chữ nhật, tức là hai vectơ $vec(a) perp vec(b)$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho bốn điểm bất kỳ $A, B, C, D$. Khẳng định nào sau đây luôn đúng?],
    (
        True([$vec(A B) + vec(C D) = vec(A D) + vec(C B)$]),
        [$vec(A B) + vec(A C) = vec(A D)$],
        [$vec(A B) - vec(C D) = vec(A C) - vec(B D)$],
        [$vec(A B) + vec(C D) = vec(0)$]
    ),
    loigiai: [
        Chuyển vế đẳng thức:
        $ vec(A B) + vec(C D) = vec(A D) + vec(C B) <=> vec(A B) - vec(A D) = vec(C B) - vec(C D) <=> vec(D B) = vec(D B) $
        Đẳng thức cuối cùng hiển nhiên đúng, do đó mệnh đề A luôn đúng.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Lục giác đều ABCDEF tâm O)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho lục giác đều $A B C D E F$ có tâm $O$ và cạnh bằng $a$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let r = 2.0
    let pts = ()
    for i in range(6) {
      let ang = i * 60deg
      pts.push((r * calc.cos(ang), r * calc.sin(ang)))
    }
    let pA = pts.at(0)
    let pB = pts.at(1)
    let pC = pts.at(2)
    let pD = pts.at(3)
    let pE = pts.at(4)
    let pF = pts.at(5)
    let pO = (0, 0)
    
    line(pA, pB, pC, pD, pE, pF, close: true, stroke: 1.2pt + rgb("0d9488"))
    line(pA, pD, stroke: (paint: luma(140), dash: "dashed"))
    line(pB, pE, stroke: (paint: luma(140), dash: "dashed"))
    line(pC, pF, stroke: (paint: luma(140), dash: "dashed"))
    
    // Vectơ OA, OC và OB
    line(pO, pA, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.6pt + rgb("1e40af"))
    line(pO, pC, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.6pt + rgb("1e40af"))
    line(pO, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) + 0.25, pA.at(1)), text(weight: "bold")[$B$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) + 0.2, pB.at(1) + 0.25), text(weight: "bold")[$C$])
    circle(pC, radius: 2.5pt, fill: black)
    content((pC.at(0) - 0.2, pC.at(1) + 0.25), text(weight: "bold")[$D$])
    circle(pD, radius: 2.5pt, fill: black)
    content((pD.at(0) - 0.25, pD.at(1)), text(weight: "bold")[$E$])
    circle(pE, radius: 2.5pt, fill: black)
    content((pE.at(0) - 0.2, pE.at(1) - 0.25), text(weight: "bold")[$F$])
    circle(pF, radius: 2.5pt, fill: black)
    content((pF.at(0) + 0.2, pF.at(1) - 0.25), text(weight: "bold")[$A$])
    circle(pO, radius: 2pt, fill: black)
    content((pO.at(0) - 0.25, pO.at(1) - 0.2), text(weight: "bold")[$O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([$vec(A B) + vec(A F) = vec(A O)$.]),
    True([$vec(O B) + vec(O D) = vec(O C)$.]),
    True([Độ dài của vectơ hiệu $|vec(A B) - vec(A F)| = a sqrt(3)$.]),
    [Tổng của $6$ vectơ xuất phát từ tâm $O$ đến các đỉnh thỏa mãn $vec(O A) + vec(O B) + vec(O C) + vec(O D) + vec(O E) + vec(O F) = vec(A D)$.]
  ),
  loigiai: [
    #step([Xét tứ giác ABOF])
    Trong lục giác đều, tứ giác $A B O F$ là hình thoi có các cạnh bằng $a$. Theo quy tắc hình bình hành:
    $ vec(A B) + vec(A F) = vec(A O) $
    Mệnh đề a ĐÚNG.

    #step([Xét tứ giác OBCD])
    Tương tự, tứ giác $O B C D$ là hình thoi có đường chéo $O C$. Do đó:
    $ vec(O B) + vec(O D) = vec(O C) $
    Mệnh đề b ĐÚNG.

    #step([Tính độ dài vectơ hiệu AB - AF])
    Theo quy tắc trừ: $vec(A B) - vec(A F) = vec(F B)$.
    Đoạn thẳng $F B$ nối hai đỉnh cách nhau một đỉnh trong lục giác đều cạnh $a$. Áp dụng định lý côsin trong tam giác $A F B$ với góc $hat(F A B) = 120^circ$:
    $ F B = sqrt(a^2 + a^2 - 2a^2 cos 120^circ) = sqrt(2a^2 + a^2) = a sqrt(3) $
    Do đó $|vec(A B) - vec(A F)| = a sqrt(3)$. Mệnh đề c ĐÚNG.

    #step([Xét tổng 6 vectơ từ tâm])
    Vì $O$ là tâm đối xứng của lục giác đều, các cặp vectơ đối nhau từng đôi một:
    $ (vec(O A) + vec(O D)) + (vec(O B) + vec(O E)) + (vec(O C) + vec(O F)) = vec(0) + vec(0) + vec(0) = vec(0) $
    Tổng này bằng $vec(0)$ chứ không bằng $vec(A D)$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Hình thoi ABCD góc 60 độ)
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho hình thoi $A B C D$ có cạnh bằng $a$ và góc $hat(B A D) = 60^circ$. Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let a = 3.0
    let pB = (a, 0)
    let pD = (a * calc.cos(60deg), a * calc.sin(60deg))
    let pC = (pB.at(0) + pD.at(0), pD.at(1))
    let pO = (pC.at(0)/2, pC.at(1)/2)
    
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("0d9488"))
    line(pA, pC, stroke: (paint: luma(140), dash: "dashed"))
    line(pB, pD, stroke: (paint: luma(140), dash: "dashed"))
    
    // Cung góc 60 độ tại A
    draw_angle_arc(pA, 0deg, 60deg, radius: 0.6, stroke: 0.8pt + rgb("d97706"))
    content((0.85, 0.35), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
    
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) - 0.25, pA.at(1) - 0.2), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) + 0.25, pB.at(1) - 0.2), text(weight: "bold")[$B$])
    circle(pC, radius: 2.5pt, fill: black)
    content((pC.at(0) + 0.25, pC.at(1) + 0.2), text(weight: "bold")[$C$])
    circle(pD, radius: 2.5pt, fill: black)
    content((pD.at(0) - 0.25, pD.at(1) + 0.2), text(weight: "bold")[$D$])
    circle(pO, radius: 2pt, fill: black)
    content((pO.at(0), pO.at(1) - 0.3), text(weight: "bold")[$O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tam giác $A B D$ là tam giác đều cạnh $a$.]),
    True([Độ dài của vectơ hiệu $|vec(A B) - vec(A D)| = a$.]),
    True([Độ dài của vectơ tổng $|vec(A B) + vec(A D)| = a sqrt(3)$.]),
    [Hai vectơ $vec(O B)$ và $vec(O D)$ thỏa mãn $vec(O B) + vec(O D) = vec(B D)$.]
  ),
  loigiai: [
    #step([Tính chất tam giác ABD])
    Hình thoi có $A B = A D = a$, suy ra tam giác $A B D$ cân tại $A$. Góc $hat(B A D) = 60^circ$, nên tam giác $A B D$ là tam giác đều cạnh $a$. Mệnh đề a ĐÚNG.

    #step([Tính độ dài vectơ hiệu AB - AD])
    Theo quy tắc trừ: $vec(A B) - vec(A D) = vec(D B)$.
    Vì tam giác $A B D$ đều nên $D B = a$. Do đó $|vec(A B) - vec(A D)| = a$. Mệnh đề b ĐÚNG.

    #step([Tính độ dài vectơ tổng AB + AD])
    Theo quy tắc hình bình hành: $vec(A B) + vec(A D) = vec(A C)$.
    Trong hình thoi, hai đường chéo vuông góc nhau tại $O$. Trong tam giác vuông $O A B$:
    $ O A = A B dot cos 30^circ = a dot (sqrt(3) / 2) => A C = 2 O A = a sqrt(3) $
    Vậy $|vec(A B) + vec(A D)| = a sqrt(3)$. Mệnh đề c ĐÚNG.

    #step([Xét tổng OB + OD])
    Vì $O$ là trung điểm của đường chéo $B D$ nên hai vectơ $vec(O B)$ và $vec(O D)$ đối nhau:
    $ vec(O B) + vec(O D) = vec(0) != vec(B D) $
    Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Đèn chùm cân bằng)
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Một chiếc đèn chùm trang trí phòng khách có trọng lượng $P = 400" N"$ được treo cố định thăng bằng tại điểm $O$ nhờ hai sợi dây cáp đối xứng $O A$ và $O B$ gắn chặt vào trần nhà. Hai sợi dây cáp tạo với nhau một góc $120^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let ang = 60deg
    let L = 2.5
    let pA = (-L * calc.sin(ang), L * calc.cos(ang))
    let pB = (L * calc.sin(ang), L * calc.cos(ang))
    let pT = (0, 2.5)
    let pP = (0, -2.5)
    
    // Trần nhà
    line((-3.0, pA.at(1)), (3.0, pA.at(1)), stroke: 2pt + luma(100))
    content((2.6, pA.at(1) + 0.3), text(size: 8.5pt)[Trần nhà])
    
    // Cung góc 120 độ tại O
    draw_angle_arc(pO, 30deg, 150deg, radius: 0.6, stroke: 0.8pt + rgb("d97706"))
    content((0, 0.9), text(fill: rgb("d97706"), size: 8pt)[$120^circ$])
    
    // Hai sợi dây cáp OA, OB
    line(pO, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.5, 0.8), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(T)_1$])
    
    line(pO, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.5, 0.8), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(T)_2$])
    
    // Hợp lực căng T
    line(pO, pT, mark: (end: ">", fill: rgb("1e40af")), stroke: (paint: rgb("1e40af"), dash: "dashed", thickness: 1.8pt))
    content((0.5, 1.8), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(T)$])
    
    // Trọng lực P
    line(pO, pP, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((0.8, -1.5), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(P) (400" N")$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, -0.3), [💡 $O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Do tính đối xứng nên độ lớn lực căng của hai sợi dây cáp bằng nhau: $T_1 = T_2$.]),
    True([Hợp lực của hai lực căng $vec(T) = vec(T)_1 + vec(T)_2$ có phương thẳng đứng, hướng lên trên và có độ lớn bằng $400" N"$ để cân bằng với trọng lực $vec(P)$.]),
    True([Độ lớn lực căng trên mỗi sợi dây cáp bằng đúng $400" N"$.]),
    [Nếu thu hẹp góc giữa hai sợi dây cáp lại (giảm góc xuống dưới $120^circ$) thì độ lớn lực căng trên mỗi sợi dây cáp sẽ tăng lên.]
  ),
  loigiai: [
    #step([Tính đối xứng của hệ lực])
    Hai sợi dây đối xứng qua phương thẳng đứng nên góc hợp bởi mỗi dây với phương thẳng đứng là $60^circ$. Do đó độ lớn hai lực căng bằng nhau: $T_1 = T_2$. Mệnh đề a ĐÚNG.

    #step([Điều kiện cân bằng tĩnh học])
    Đèn thăng bằng nên tổng hợp lực tác dụng lên $O$ bằng $vec(0)$:
    $ vec(T)_1 + vec(T)_2 + vec(P) = vec(0) <=> vec(T) = - vec(P) $
    Hợp lực $vec(T) = vec(T)_1 + vec(T)_2$ có phương thẳng đứng hướng lên và $T = P = 400" N"$. Mệnh đề b ĐÚNG.

    #step([Tính độ lớn lực căng T1, T2])
    Góc giữa hai vectơ lực căng là $120^circ$. Chiếu lên phương thẳng đứng:
    $ T = 2 T_1 cos(120^circ / 2) = 2 T_1 cos 60^circ = 2 T_1 dot (1/2) = T_1 $
    Vì $T = 400" N"$ nên $T_1 = T_2 = 400" N"$. Mệnh đề c ĐÚNG.

    #step([Khảo sát khi góc treo giảm xuống])
    Khi thu hẹp góc treo $alpha < 120^circ$, góc nghiêng so với phương đứng $alpha / 2 < 60^circ$, suy ra $cos(alpha / 2) > cos 60^circ = 1/2$.
    Lực căng $T_1 = P / (2 cos(alpha / 2))$ sẽ GIẢM ĐI chứ không tăng lên. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Vận tốc tổng hợp cano)
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Một chiếc cano chạy xuôi dòng trên một khúc sông từ bến $A$ đến bến $B$ cách nhau $72" km"$. Vận tốc riêng của cano đối với dòng nước là $v_c = 30" km/h"$, vận tốc dòng chảy của nước đối với bờ sông là $v_n = 6" km/h"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (5, 0)
    
    // Bờ sông
    line((-0.5, 0.8), (5.5, 0.8), stroke: 1.2pt + rgb("0284c7"))
    line((-0.5, -0.8), (5.5, -0.8), stroke: 1.2pt + rgb("0284c7"))
    content((2.5, 1.1), [🌊 Sông])
    
    // Vectơ cano xuôi dòng
    line((1.2, 0.2), (3.6, 0.2), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((2.4, 0.5), [⛵ $vec(v)_c$ (30 km/h)])
    
    // Vectơ dòng nước cùng chiều
    line((1.2, -0.2), (2.4, -0.2), mark: (end: ">", fill: rgb("d97706")), stroke: 1.8pt + rgb("d97706"))
    content((2.4, -0.5), [💧 $vec(v)_n$ (6 km/h)])
    
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0), -0.3), text(weight: "bold")[Bến $A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0), -0.3), text(weight: "bold")[Bến $B$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khi cano xuôi dòng, vectơ vận tốc riêng của cano $vec(v)_c$ và vectơ vận tốc dòng nước $vec(v)_n$ là hai vectơ cùng phương và cùng hướng.]),
    True([Vận tốc thực tế của cano đối với bờ sông khi chạy xuôi dòng là $36" km/h"$.]),
    True([Thời gian để cano chạy xuôi dòng từ bến $A$ đến bến $B$ là $2$ giờ.]),
    [Khi cano quay đầu chạy ngược dòng từ $B$ về $A$, vận tốc thực tế của cano đối với bờ sông là $26" km/h"$.]
  ),
  loigiai: [
    #step([Xét hướng của hai vectơ vận tốc khi xuôi dòng])
    Khi cano chạy xuôi dòng, chuyển động của cano cùng chiều với dòng nước, do đó $vec(v)_c$ và $vec(v)_n$ cùng hướng. Mệnh đề a ĐÚNG.

    #step([Tính vận tốc thực tế khi xuôi dòng])
    Vận tốc thực tế đối với bờ khi xuôi dòng là:
    $ v_x = v_c + v_n = 30 + 6 = 36" km/h" $
    Mệnh đề b ĐÚNG.

    #step([Tính thời gian chạy xuôi dòng])
    Thời gian đi từ $A$ đến $B$ quãng đường $s = 72" km"$:
    $ t = s / v_x = 72 / 36 = 2" giờ" $
    Mệnh đề c ĐÚNG.

    #step([Tính vận tốc thực tế khi ngược dòng])
    Khi chạy ngược dòng từ $B$ về $A$, vận tốc thực tế là:
    $ v' = v_c - v_n = 30 - 6 = 24" km/h" $
    Giá trị này bằng $24" km/h"$ chứ không phải $26" km/h"$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho hình thoi $A B C D$ có cạnh bằng $12" cm"$ và góc $hat(B A D) = 120^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2, 0)
    let pD = (-1, 1.732)
    let pC = (1, 1.732)
    line(pB, pC, pD, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((0.8, 0.9), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((1.2, 1.9), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-1.2, 1.8), text(size: 8.5pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ tổng $vec(A B) + vec(A D)$ theo đơn vị centimét.],
    [12],
    loigiai: [
        #step([Quy tắc hình bình hành cho hình thoi])
        Theo quy tắc hình bình hành:
        $ vec(A B) + vec(A D) = vec(A C) $
        
        #step([Tính độ dài đường chéo AC])
        Trong hình thoi $A B C D$ có $A B = A D = 12" cm"$ và $hat(B A D) = 120^circ$, góc $hat(B) = 180^circ - 120^circ = 60^circ$.
        Tam giác $A B C$ cân tại $B$ có góc $hat(B) = 60^circ$ nên nó là tam giác đều cạnh bằng $12" cm"$.
        Do đó $A C = 12" cm"$.
        Vậy $|vec(A B) + vec(A D)| = 12" cm"$.
    ]
)

// TLN 2 (Câu 18)
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ vuông tại $A$ có $A B = 9" cm"$ và $A C = 12" cm"$. Gọi $M$ là trung điểm của cạnh huyền $B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.2, 0)
    let pC = (0, 2.6)
    let pM = (1.1, 1.3)
    line((0.3, 0), (0.3, 0.3), (0, 0.3), stroke: 0.7pt + black)
    line(pA, pC, pB, stroke: 0.8pt + luma(160))
    line(pM, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pM, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.1, -0.3), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.4, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0, 2.8), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((1.3, 1.5), text(size: 8.5pt, weight: "bold")[$M$])
  })
]
Tính độ dài của vectơ hiệu $vec(M B) - vec(M A)$ theo đơn vị centimét.],
    [9],
    loigiai: [
        #step([Rút gọn vectơ hiệu])
        Theo quy tắc trừ hai vectơ chung điểm đầu:
        $ vec(M B) - vec(M A) = vec(A B) $
        
        #step([Tính độ dài vectơ])
        Độ dài vectơ là:
        $ |vec(M B) - vec(M A)| = |vec(A B)| = A B = 9" cm" $
    ]
)

// TLN 3 (Câu 19)
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho hình chữ nhật $A B C D$ có $A B = 8" cm"$ và $B C = 6" cm"$. Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.8)
    let pB = (2.6, 1.8)
    let pC = (2.6, 0)
    let pD = (0, 0)
    let pO = (1.3, 0.9)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pO, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pO, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pB, pA, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.3, 2.1), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(B A)$])
    circle(pO, radius: 2pt, fill: black)
    content((1.3, 0.65), text(size: 8pt, weight: "bold")[$O$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 1.8), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.8, 1.8), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.8, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ hiệu $vec(O A) - vec(O B)$ theo đơn vị centimét.],
    [8],
    loigiai: [
        #step([Rút gọn vectơ hiệu])
        Áp dụng quy tắc trừ:
        $ vec(O A) - vec(O B) = vec(B A) $
        
        #step([Tính độ dài])
        Trong hình chữ nhật $A B C D$, độ dài cạnh $B A = A B = 8" cm"$.
        Do đó $|vec(O A) - vec(O B)| = |vec(B A)| = 8" cm"$.
    ]
)

// TLN 4 (Câu 20)
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác đều $A B C$ có cạnh bằng $12" cm"$. Gọi $G$ là trọng tâm của tam giác $A B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.3)
    let pB = (0, 0)
    let pC = (3, 0)
    let pG = ((pA.at(0)+pB.at(0)+pC.at(0))/3, (pA.at(1)+pB.at(1)+pC.at(1))/3)
    line(pA, pB, pC, close: true, stroke: 1pt + rgb("0d9488"))
    line(pG, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pG, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pG, mark: (end: ">", fill: rgb("dc2626")), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 1.8pt))
    content((1.2, 1.6), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A G)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.55), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pG, radius: 2pt, fill: black)
    content((1.5, 0.55), text(size: 8.5pt, weight: "bold")[$G$])
  })
]
Tính độ dài của vectơ tổng $vec(G B) + vec(G C)$ theo đơn vị centimét (làm tròn kết quả đến chữ số thập phân thứ nhất).
(Cho biết $sqrt(3) approx 1.732$)],
    [6.9],
    loigiai: [
        #step([Mối liên hệ giữa vectơ tổng và GA])
        Vì $G$ là trọng tâm của tam giác $A B C$ nên:
        $ vec(G A) + vec(G B) + vec(G C) = vec(0) <=> vec(G B) + vec(G C) = - vec(G A) $
        Do đó:
        $ |vec(G B) + vec(G C)| = |- vec(G A)| = G A $
        
        #step([Tính độ dài đoạn GA])
        Trong tam giác đều cạnh $a = 12" cm"$, đường cao $A H = (a sqrt(3)) / 2 = (12 sqrt(3)) / 2 = 6 sqrt(3)" cm"$.
        Khoảng cách từ trọng tâm $G$ đến đỉnh $A$ là:
        $ G A = 2/3 A H = 2/3 dot 6 sqrt(3) = 4 sqrt(3) approx 4 dot 1.73205 = 6.928" cm" $
        Làm tròn đến chữ số thập phân thứ nhất ta được $6.9" cm"$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Hai lực tạo góc 120 độ)
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Hai lực $vec(F)_1$ và $vec(F)_2$ có cùng độ lớn $F_1 = F_2 = 250" N"$ cùng tác dụng vào một móc cẩu tại điểm $O$, tạo với nhau một góc $120^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let F = 2.5
    let a1 = -60deg
    let a2 = 60deg
    let p1 = (F * calc.cos(a1), F * calc.sin(a1))
    let p2 = (F * calc.cos(a2), F * calc.sin(a2))
    let pF = (F, 0)
    
    // Hình thoi hợp lực
    line(p1, pF, stroke: (paint: luma(140), dash: "dashed"))
    line(p2, pF, stroke: (paint: luma(140), dash: "dashed"))
    
    // Cung góc 120 độ
    draw_angle_arc(pO, -60deg, 60deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((1.2, 0.4), text(fill: rgb("d97706"), size: 8pt)[$120^circ$])
    
    // Vectơ F1 và F2
    line(pO, p1, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((p1.at(0) + 0.6, p1.at(1)), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_1 (250" N")$])
    
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((p2.at(0) + 0.6, p2.at(1)), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_2 (250" N")$])
    
    // Vectơ hợp lực F
    line(pO, pF, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((pF.at(0) + 0.6, 0), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F)$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, 0), [🏗️ $O$])
  })
]
Tính độ lớn của hợp lực $vec(F) = vec(F)_1 + vec(F)_2$ theo đơn vị Newton.],
    [250],
    loigiai: [
        #step([Công thức hợp lực của hai lực bằng nhau góc 120 độ])
        Vì $F_1 = F_2 = 250" N"$ và góc giữa hai lực là $alpha = 120^circ$, độ lớn của hợp lực là:
        $ F = 2 dot F_1 dot cos(alpha / 2) = 2 dot 250 dot cos 60^circ = 2 dot 250 dot (1/2) = 250" N" $
        Hợp lực có độ lớn đúng bằng độ lớn của mỗi lực thành phần.
    ]
)

// TLN 6 (Câu 22 - Vận dụng cao Thực tế Máy bay bay trong gió ngang)
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Một chiếc máy bay phản lực đang bay thẳng theo hướng Bắc với vận tốc riêng của động cơ là $500" km/h"$. Luồng gió thổi mạnh theo phương nằm ngang từ hướng Tây sang Đông với vận tốc $120" km/h"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let sc = 0.007
    let pV = (0, 500 * sc)
    let pG = (120 * sc * 2.5, 0)
    let pF = (pG.at(0), pV.at(1))
    
    // Trục tọa độ la bàn
    line((-0.5, 0), (3.0, 0), stroke: 0.5pt + luma(180))
    line((0, -0.5), (0, 4.2), stroke: 0.5pt + luma(180))
    content((2.8, -0.3), [🧭 Đông])
    content((-0.3, 4.0), [Bắc])
    
    // Hình chữ nhật tổng hợp
    line(pV, pF, stroke: (paint: luma(140), dash: "dashed"))
    line(pG, pF, stroke: (paint: luma(140), dash: "dashed"))
    
    // Vectơ vận tốc máy bay (Bắc)
    line(pO, pV, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.2, 1.8), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)_m (500" km/h")$])
    
    // Vectơ vận tốc gió (Đông)
    line(pO, pG, mark: (end: ">", fill: rgb("d97706")), stroke: 1.8pt + rgb("d97706"))
    content((1.2, -0.35), text(fill: rgb("d97706"), size: 8.5pt)[$vec(v)_g (120" km/h")$])
    
    // Vectơ vận tốc tổng hợp đối với mặt đất
    line(pO, pF, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((pF.at(0) + 0.3, pF.at(1) + 0.3), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[✈️ $vec(v)$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.3, -0.3), text(weight: "bold")[$O$])
  })
]
Tính tốc độ thực tế của máy bay đối với mặt đất theo đơn vị kilômét trên giờ (làm tròn kết quả đến hàng đơn vị).
(Cho biết $sqrt(661) approx 25.71$)],
    [514],
    loigiai: [
        #step([Tổng hợp vectơ vận tốc vuông góc])
        Vận tốc thực tế của máy bay đối với mặt đất là tổng hợp của hai chuyển động vuông góc:
        $ vec(v) = vec(v)_m + vec(v)_g $
        Do hướng Bắc vuông góc với hướng Đông nên $vec(v)_m perp vec(v)_g$.
        
        #step([Áp dụng định lý Pytago])
        Tốc độ thực tế đối với mặt đất là:
        $ v = sqrt(v_m^2 + v_g^2) = sqrt(500^2 + 120^2) = sqrt(250000 + 14400) = sqrt(264400) $
        $ v = 20 sqrt(661) approx 20 dot 25.7099 = 514.198" km/h" $
        Làm tròn đến hàng đơn vị ta được $514" km/h"$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 8: TỔNG VÀ HIỆU CỦA HAI VECTƠ (ĐỀ SỐ 2)!]      #v(0.6em)
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
