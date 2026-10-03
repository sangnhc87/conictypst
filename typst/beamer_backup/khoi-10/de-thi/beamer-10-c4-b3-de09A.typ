// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 9: TÍCH CỦA MỘT VECTƠ VỚI MỘT SỐ (ĐỀ SỐ 1)
// Lớp: Khối 10  ·  Mã đề: 107  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 9: TÍCH CỦA MỘT VECTƠ VỚI MỘT SỐ (ĐỀ SỐ 1)",
  subtitle: "ÔN TẬP CHƯƠNG 4 — MÃ ĐỀ: 107",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 107]],
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
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho số thực $k > 0$ và vectơ $vec(a) != vec(0)$. Khẳng định nào sau đây là đúng về vectơ $k vec(a)$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0.6), (1.8, 0.6), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.9, 0.95), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(a)$])
    line((0, 0), (3.6, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.8, -0.35), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$2 vec(a)$ (cùng hướng)])
  })
]],
    (
        True([Cùng hướng với vectơ $vec(a)$ và có độ dài bằng $k |vec(a)|$.]),
        [Ngược hướng với vectơ $vec(a)$ và có độ dài bằng $k |vec(a)|$.],
        [Cùng hướng với vectơ $vec(a)$ và có độ dài bằng $|vec(a)|$.],
        [Vuông góc với vectơ $vec(a)$ và có độ dài bằng $k$.]
    ),
    loigiai: [
        Theo định nghĩa tích của một số thực với một vectơ, khi $k > 0$, vectơ $k vec(a)$ cùng hướng với vectơ $vec(a)$ và có độ dài bằng $k |vec(a)|$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho số thực $k < 0$ và vectơ $vec(a) != vec(0)$. Vectơ $k vec(a)$ có hướng và độ dài như thế nào so với vectơ $vec(a)$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0.6), (1.5, 0.6), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.75, 0.95), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(a)$])
    line((3.5, 0), (0.5, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((2.0, -0.35), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$-2 vec(a)$ (ngược hướng)])
  })
]],
    (
        True([Ngược hướng với vectơ $vec(a)$ và có độ dài bằng $|k| dot |vec(a)|$.]),
        [Cùng hướng với vectơ $vec(a)$ và có độ dài bằng $|k| dot |vec(a)|$.],
        [Ngược hướng với vectơ $vec(a)$ và có độ dài bằng $k dot |vec(a)|$.],
        [Có độ dài bằng $0$.]
    ),
    loigiai: [
        Khi nhân vectơ $vec(a)$ với số âm $k < 0$, vectơ kết quả $k vec(a)$ đổi chiều ngược hướng với $vec(a)$ và có độ dài không âm là $|k vec(a)| = |k| dot |vec(a)|$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho đoạn thẳng $A B$ có trung điểm là $I$. Đẳng thức vectơ nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pI = (1.8, 0)
    let pB = (3.6, 0)
    line(pA, pB, stroke: 0.8pt + luma(180))
    line(pA, pB, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.5pt + rgb("1e40af"))
    content((2.7, 0.35), text(fill: rgb("1e40af"), size: 8pt)[$vec(A B)$])
    line(pA, pI, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.9, -0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(A I)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pI, radius: 2pt, fill: black)
    content((1.8, -0.25), text(size: 8.5pt, weight: "bold")[$I$])
    circle(pB, radius: 2pt, fill: black)
    content((3.8, 0), text(size: 8.5pt, weight: "bold")[$B$])
  })
]],
    (
        True([$vec(A B) = 2 vec(A I)$]),
        [$vec(A B) = - 2 vec(A I)$],
        [$vec(I A) = 2 vec(I B)$],
        [$vec(A I) = 2 vec(A B)$]
    ),
    loigiai: [
        Vì $I$ là trung điểm của $A B$ nên vectơ $vec(A B)$ và $vec(A I)$ cùng hướng và độ dài $A B = 2 A I$. Do đó $vec(A B) = 2 vec(A I)$.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho tam giác $A B C$. Gọi $M$ là trung điểm của cạnh $B C$. Với điểm $O$ tùy ý, khẳng định nào sau đây luôn đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.8, 2.2)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (1.5, 0)
    let pO = (-0.8, 1)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pO, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.2pt + rgb("0d9488"))
    line(pO, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.2pt + rgb("0d9488"))
    line(pO, pM, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((0.4, 0.8), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$vec(O M)$])
    circle(pO, radius: 2pt, fill: black)
    content((-1.0, 1.0), text(size: 8.5pt, weight: "bold")[$O$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((1.5, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
  })
]],
    (
        True([$vec(O B) + vec(O C) = 2 vec(O M)$]),
        [$vec(O B) + vec(O C) = vec(O M)$],
        [$vec(O B) + vec(O C) = 3 vec(O M)$],
        [$vec(O B) - vec(O C) = 2 vec(O M)$]
    ),
    loigiai: [
        Theo tính chất trung điểm của đoạn thẳng với một điểm $O$ bất kỳ:
        $ vec(O B) + vec(O C) = 2 vec(O M) <=> vec(O M) = 1/2 (vec(O B) + vec(O C)) $
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có trọng tâm là $G$ và $A M$ là đường trung tuyến. Khẳng định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.4)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (1.5, 0)
    let pG = (1.5, 0.8)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, stroke: (paint: luma(180), dash: "dashed"))
    line(pA, pG, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.85, 1.6), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(A G)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.65), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pG, radius: 2pt, fill: black)
    content((1.8, 0.8), text(size: 8.5pt, weight: "bold")[$G$])
    circle(pM, radius: 2pt, fill: black)
    content((1.5, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
  })
]],
    (
        True([$vec(A G) = 2/3 vec(A M)$]),
        [$vec(A G) = 3/2 vec(A M)$],
        [$vec(A G) = - 2/3 vec(A M)$],
        [$vec(A G) = 1/3 vec(A M)$]
    ),
    loigiai: [
        Theo tính chất trọng tâm tam giác, $A G = 2/3 A M$ và hai vectơ $vec(A G), vec(A M)$ cùng hướng từ đỉnh $A$ xuống trung điểm $M$. Do đó $vec(A G) = 2/3 vec(A M)$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho vectơ $vec(u)$ có độ dài $|vec(u)| = 4$. Độ dài của vectơ $- 3 vec(u)$ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0.5), (1.2, 0.5), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.6, 0.85), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(u) (|vec(u)|=4)$])
    line((3.6, 0), (0, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.8, -0.35), text(fill: rgb("dc2626"), size: 8.5pt)[$-3 vec(u)$])
  })
]],
    (
        True([$12$]),
        [$-12$],
        [$7$],
        [$1$]
    ),
    loigiai: [
        Độ dài của một vectơ luôn là số không âm:
        $ |- 3 vec(u)| = |- 3| dot |vec(u)| = 3 dot 4 = 12 $
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho điểm $M$ nằm trên đoạn thẳng $A B$ sao cho $A M = 3 M B$. Đẳng thức vectơ nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pM = (2.4, 0)
    let pB = (3.2, 0)
    line(pA, pB, stroke: 0.8pt + luma(180))
    line(pA, pM, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.2, 0.35), text(fill: rgb("1e40af"), size: 8pt)[$vec(A M)$])
    line(pA, (3.1, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.2pt + rgb("0d9488"))
    content((2.8, -0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(A B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pM, radius: 2pt, fill: black)
    content((2.4, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
    circle(pB, radius: 2pt, fill: black)
    content((3.4, 0), text(size: 8.5pt, weight: "bold")[$B$])
  })
]],
    (
        True([$vec(A M) = 3/4 vec(A B)$]),
        [$vec(A M) = 3 vec(A B)$],
        [$vec(A M) = 1/3 vec(A B)$],
        [$vec(A M) = 1/4 vec(A B)$]
    ),
    loigiai: [
        Vì $M$ nằm trên đoạn $A B$ và $A M = 3 M B$, nên đoạn $A B$ được chia làm $3 + 1 = 4$ phần bằng nhau, trong đó $A M$ chiếm $3$ phần.
        Hai vectơ $vec(A M)$ và $vec(A B)$ cùng hướng, do đó $vec(A M) = 3/4 vec(A B)$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Với hai vectơ tùy ý $vec(a), vec(b)$ và số thực $k$, khẳng định nào sau đây là SAI (tính chất phân phối)?],
    (
        True([$k(vec(a) + vec(b)) = k vec(a) - k vec(b)$]),
        [$k(vec(a) + vec(b)) = k vec(a) + k vec(b)$],
        [$(h + k)vec(a) = h vec(a) + k vec(a)$],
        [$k(h vec(a)) = (k h)vec(a)$]
    ),
    loigiai: [
        Theo tính chất phân phối của phép nhân vectơ với số thực: $k(vec(a) + vec(b)) = k vec(a) + k vec(b)$. Do đó phương án A ghi dấu trừ là sai.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho tam giác đều $A B C$ có cạnh bằng $a$. Gọi $M$ là trung điểm của $B C$. Độ dài của vectơ $2 vec(A M)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (1.5, 0)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.9, 1.3), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A M)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.85), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((1.5, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
  })
]],
    (
        True([$a sqrt(3)$]),
        [$a$],
        [$2a$],
        [$(a sqrt(3)) / 2$]
    ),
    loigiai: [
        Đường cao tam giác đều cạnh $a$ có độ dài $A M = (a sqrt(3)) / 2$.
        Độ dài vectơ: $|2 vec(A M)| = 2 dot A M = 2 dot (a sqrt(3)) / 2 = a sqrt(3)$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho hình bình hành $A B C D$ có tâm $O$. Phân tích vectơ $vec(A O)$ theo hai vectơ cạnh $vec(A B)$ và $vec(A D)$ ta được
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.4, 0)
    let pD = (1.0, 1.6)
    let pC = (3.4, 1.6)
    let pO = (1.7, 0.8)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, stroke: (paint: luma(180), dash: "dashed"))
    line(pB, pD, stroke: (paint: luma(180), dash: "dashed"))
    line(pA, pO, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((0.7, 0.6), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A O)$])
    circle(pO, radius: 2pt, fill: black)
    content((1.8, 1.05), text(size: 8pt, weight: "bold")[$O$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.6, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.6, 1.6), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0.8, 1.7), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$vec(A O) = 1/2 vec(A B) + 1/2 vec(A D)$]),
        [$vec(A O) = vec(A B) + vec(A D)$],
        [$vec(A O) = 1/2 vec(A B) - 1/2 vec(A D)$],
        [$vec(A O) = 2 vec(A B) + 2 vec(A D)$]
    ),
    loigiai: [
        Theo quy tắc hình bình hành: $vec(A C) = vec(A B) + vec(A D)$.
        Vì $O$ là trung điểm đường chéo $A C$ nên $vec(A O) = 1/2 vec(A C) = 1/2 (vec(A B) + vec(A D)) = 1/2 vec(A B) + 1/2 vec(A D)$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Điều kiện cần và đủ để hai vectơ $vec(a)$ và $vec(b)$ ($vec(b) != vec(0)$) cùng phương là],
    (
        True([Có số thực $k$ sao cho $vec(a) = k vec(b)$.]),
        [Có số thực $k > 0$ sao cho $vec(a) = k vec(b)$.],
        [$|vec(a)| = |vec(b)|$.],
        [$vec(a) + vec(b) = vec(0)$.]
    ),
    loigiai: [
        Hai vectơ cùng phương khi và chỉ khi giá của chúng song song hoặc trùng nhau, điều này tương đương với việc tồn tại một số thực $k$ sao cho $vec(a) = k vec(b)$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho số thực $k$ và vectơ $vec(a)$. Đẳng thức $k vec(a) = vec(0)$ xảy ra khi và chỉ khi],
    (
        True([$k = 0$ hoặc $vec(a) = vec(0)$]),
        [$k = 0$ và $vec(a) = vec(0)$],
        [$k = 0$],
        [$vec(a) = vec(0)$]
    ),
    loigiai: [
        Tích của một số với một vectơ bằng vectơ-không khi và chỉ khi số đó bằng $0$ hoặc vectơ đó là vectơ-không.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Hệ vectơ trong tam giác)
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho tam giác $A B C$. Gọi $M$ là trung điểm của cạnh $B C$, $N$ là trung điểm của cạnh $A C$ và $P$ là trung điểm của cạnh $A B$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3.4, 0)
    let pM = (1.7, 0)
    let pN = (2.45, 1.3)
    let pP = (0.75, 1.3)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pM, pN, pP, close: true, stroke: 1pt + rgb("0d9488"))
    line(pA, pM, stroke: (paint: luma(180), dash: "dashed"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.85), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.6, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((1.7, -0.25), text(size: 8pt, weight: "bold")[$M$])
    circle(pN, radius: 2pt, fill: black)
    content((2.65, 1.4), text(size: 8pt, weight: "bold")[$N$])
    circle(pP, radius: 2pt, fill: black)
    content((0.55, 1.4), text(size: 8pt, weight: "bold")[$P$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đoạn thẳng $M N$ là đường trung bình của tam giác $A B C$ và $vec(M N) = 1/2 vec(B A)$.]),
    True([Vectơ tổng của hai cạnh kề thỏa mãn $vec(A B) + vec(A C) = 2 vec(A M)$.]),
    True([Tổng ba vectơ trung tuyến xuất phát từ ba đỉnh thỏa mãn $vec(A M) + vec(B N) + vec(C P) = vec(0)$.]),
    [Hai vectơ $vec(M N)$ và $vec(A B)$ có mối liên hệ là $vec(M N) = 1/2 vec(A B)$.]
  ),
  loigiai: [
    #step([Tính chất đường trung bình MN])
    $M, N$ lần lượt là trung điểm của $B C, A C$ nên $M N$ là đường trung bình song song với $A B$. Chiều từ $M$ đến $N$ cùng chiều từ $B$ đến $A$, do đó $vec(M N) = 1/2 vec(B A)$. Mệnh đề a ĐÚNG.

    #step([Tính chất trung điểm đối với cạnh kề])
    Vì $M$ là trung điểm $B C$ nên với điểm đầu $A$ ta luôn có $vec(A B) + vec(A C) = 2 vec(A M)$. Mệnh đề b ĐÚNG.

    #step([Tổng ba vectơ trung tuyến])
    Biểu diễn các trung tuyến qua các cạnh:
    $ vec(A M) = 1/2 (vec(A B) + vec(A C)), quad vec(B N) = 1/2 (vec(B A) + vec(B C)), quad vec(C P) = 1/2 (vec(C A) + vec(C B)) $
    Cộng vế theo vế:
    $ vec(A M) + vec(B N) + vec(C P) = 1/2 (vec(A B) + vec(B A) + vec(A C) + vec(C A) + vec(B C) + vec(C B)) = vec(0) $
    Mệnh đề c ĐÚNG.

    #step([Kiểm tra hướng của MN và AB])
    Vectơ $vec(M N)$ có hướng từ $M$ đến $N$ (cùng hướng với $vec(B A)$), trong khi $vec(A B)$ ngược hướng với $vec(B A)$. Do đó $vec(M N) = - 1/2 vec(A B) != 1/2 vec(A B)$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Phân tích vectơ trong hình bình hành)
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho hình bình hành $A B C D$. Lấy điểm $M$ trên cạnh $A B$ sao cho $A M = 1/3 A B$, điểm $N$ trên đường chéo $A C$ sao cho $A N = 1/4 A C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3, 0)
    let pD = (1.2, 1.8)
    let pC = (4.2, 1.8)
    let pM = (1, 0)
    let pN = (1.05, 0.45)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, stroke: (paint: luma(180), dash: "dashed"))
    line(pD, pM, stroke: (paint: rgb("dc2626"), thickness: 1.2pt))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((4.4, 1.8), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((1.0, 2.0), text(size: 8.5pt, weight: "bold")[$D$])
    circle(pM, radius: 2pt, fill: black)
    content((1, -0.25), text(size: 8pt, weight: "bold")[$M$])
    circle(pN, radius: 2pt, fill: black)
    content((1.3, 0.55), text(size: 8pt, weight: "bold")[$N$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ $vec(A M)$ biểu diễn theo $vec(A B)$ là $vec(A M) = 1/3 vec(A B)$.]),
    True([Vectơ đường chéo thỏa mãn $vec(A C) = vec(A B) + vec(A D)$.]),
    True([Vectơ $vec(A N)$ biểu diễn qua hai vectơ cạnh là $vec(A N) = 1/4 vec(A B) + 1/4 vec(A D)$.]),
    [Ba điểm $D, N, M$ không thẳng hàng (tạo thành một tam giác).]
  ),
  loigiai: [
    #step([Biểu diễn vectơ AM])
    Vì $M$ thuộc đoạn thẳng $A B$ và $A M = 1/3 A B$ nên hai vectơ $vec(A M), vec(A B)$ cùng hướng, suy ra $vec(A M) = 1/3 vec(A B)$. Mệnh đề a ĐÚNG.

    #step([Quy tắc hình bình hành cho đường chéo AC])
    Theo quy tắc hình bình hành: $vec(A C) = vec(A B) + vec(A D)$. Mệnh đề b ĐÚNG.

    #step([Biểu diễn vectơ AN])
    Vì $A N = 1/4 A C$ và cùng hướng với $vec(A C)$ nên:
    $ vec(A N) = 1/4 vec(A C) = 1/4 (vec(A B) + vec(A D)) = 1/4 vec(A B) + 1/4 vec(A D) $
    Mệnh đề c ĐÚNG.

    #step([Xét sự thẳng hàng của ba điểm D, N, M])
    Ta phân tích hai vectơ $vec(D M)$ và $vec(D N)$ theo hai vectơ cơ sở $vec(A B)$ và $vec(A D)$:
    $ vec(D M) = vec(A M) - vec(A D) = 1/3 vec(A B) - vec(A D) $
    $ vec(D N) = vec(A N) - vec(A D) = 1/4 vec(A B) + 1/4 vec(A D) - vec(A D) = 1/4 vec(A B) - 3/4 vec(A D) = 3/4 (1/3 vec(A B) - vec(A D)) $
    Từ đó suy ra $vec(D N) = 3/4 vec(D M)$.
    Điều này chứng tỏ hai vectơ $vec(D N)$ và $vec(D M)$ cùng phương, tức là ba điểm $D, N, M$ thẳng hàng.
    Do đó nhận định ba điểm không thẳng hàng là SAI.
  ]
)

// DS 3 (Câu 15 - Vật lý Định luật II Newton)
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Một khối hàng có khối lượng $m = 4" kg"$ đang nằm yên trên mặt sàn nằm ngang nhẵn bóng (bỏ qua mọi lực cản và ma sát). Tại thời điểm ban đầu, người ta tác dụng vào vật một lực kéo không đổi $vec(F)$ có phương nằm ngang hướng từ Tây sang Đông với độ lớn $F = 12" N"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pF = (3.5, 0)
    let pa = (2.0, 0)
    
    // Mặt sàn
    line((-1, -0.3), (5, -0.3), stroke: 1.5pt + luma(120))
    for i in range(8) {
      line((i * 0.7 - 0.5, -0.3), (i * 0.7 - 0.8, -0.6), stroke: 0.8pt + luma(160))
    }
    
    // Khối hàng
    rect((0, -0.3), (1.6, 0.9), fill: rgb("f1f5f9"), stroke: 1.2pt + rgb("1e40af"))
    content((0.8, 0.3), text(fill: rgb("1e40af"), weight: "bold", size: 9pt)[📦 $m=4"kg"$])
    
    // Lực kéo F
    line((1.6, 0.3), (4.5, 0.3), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((3.2, 0.7), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(F) = 12" N"$ (Đông)])
    
    // Gia tốc a
    line((0.8, 1.2), (2.4, 1.2), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.6, 1.5), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(a)$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Theo Định luật II Newton, vectơ gia tốc của vật là $vec(a) = 1/m vec(F)$, cùng phương và cùng hướng với lực kéo $vec(F)$.]),
    True([Độ lớn gia tốc mà vật thu được là $a = 3" m/s"^2$.]),
    True([Sau $5$ giây chuyển động kể từ trạng thái nghỉ, vectơ vận tốc của vật là $vec(v) = 5 vec(a)$ có độ lớn $15" m/s"$.]),
    [Nếu chất thêm hàng để khối lượng tăng lên thành $m' = 6" kg"$ dưới lực kéo $vec(F) = 12" N"$ như cũ thì độ lớn gia tốc tăng lên thành $4" m/s"^2$.]
  ),
  loigiai: [
    #step([Định luật II Newton về gia tốc])
    Phương trình định luật II Newton: $vec(F) = m vec(a) => vec(a) = 1/m vec(F)$.
    Vì khối lượng $m = 4 > 0$ nên vectơ gia tốc $vec(a)$ luôn cùng phương, cùng hướng với lực kéo $vec(F)$. Mệnh đề a ĐÚNG.

    #step([Tính độ lớn gia tốc])
    Độ lớn của gia tốc:
    $ a = F / m = 12 / 4 = 3" m/s"^2 $
    Mệnh đề b ĐÚNG.

    #step([Tính vận tốc sau 5 giây])
    Vật xuất phát từ trạng thái nghỉ ($v_0 = 0$), sau $t = 5" s"$ vectơ vận tốc là:
    $ vec(v) = vec(v)_0 + vec(a) t = 5 vec(a) $
    Độ lớn vận tốc: $v = 5 a = 5 dot 3 = 15" m/s"$. Mệnh đề c ĐÚNG.

    #step([Xét khi tăng khối lượng])
    Khi khối lượng tăng lên $m' = 6" kg"$ thì gia tốc mới là:
    $ a' = F / m' = 12 / 6 = 2" m/s"^2 < 3" m/s"^2 $
    Do đó độ lớn gia tốc giảm xuống $2" m/s"^2$ chứ không thể tăng lên $4" m/s"^2$. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Ca nô tăng tốc cứu hộ)
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Một chiếc ca nô cứu hộ xuất phát từ trạm tuần tra duyên hải, di chuyển thẳng đều theo hướng Đông với vận tốc ban đầu được biểu diễn bởi vectơ $vec(v)_0$ có độ lớn $20" km/h"$. Nhận được tín hiệu khẩn cấp, người lái lập tức tăng ga làm vận tốc ca nô tăng đều cùng hướng, sau một khoảng thời gian thì vận tốc ca nô đạt đến vectơ $vec(v)_1 = 2.5 vec(v)_0$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let p0 = (2.0, 0)
    let p1 = (5.0, 0)
    
    // Trục hướng
    line((-0.5, -0.4), (5.8, -0.4), stroke: 0.6pt + luma(180))
    content((5.5, -0.7), [🧭 Đông])
    content((-0.3, -0.7), [Tây])
    
    // Vận tốc ban đầu v0
    line(pO, p0, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.0, 0.35), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(v)_0 (20" km/h")$])
    
    // Vận tốc sau khi tăng tốc v1
    line(pO, p1, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((3.5, 0.35), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(v)_1 = 2.5 vec(v)_0$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, 0), [🚤 $O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ vận tốc $vec(v)_0$ và $vec(v)_1$ là hai vectơ cùng phương và cùng hướng.]),
    True([Độ lớn vận tốc mới của ca nô sau khi tăng tốc là $v_1 = 50" km/h"$.]),
    True([Vectơ độ biến thiên vận tốc $Delta vec(v) = vec(v)_1 - vec(v)_0 = 1.5 vec(v)_0$ có độ lớn bằng $30" km/h"$.]),
    [Nếu ca nô quay đầu chạy ngược lại về trạm với cùng tốc độ $50" km/h"$ thì vectơ vận tốc mới $vec(v)_2$ bằng vectơ $vec(v)_1$.]
  ),
  loigiai: [
    #step([Phương và hướng của hai vectơ vận tốc])
    Vì hệ số $k = 2.5 > 0$ nên vectơ $vec(v)_1 = 2.5 vec(v)_0$ cùng phương và cùng hướng với vectơ $vec(v)_0$ (hướng Đông). Mệnh đề a ĐÚNG.

    #step([Tính tốc độ mới])
    Độ lớn vận tốc sau khi tăng tốc:
    $ v_1 = |vec(v)_1| = 2.5 dot |vec(v)_0| = 2.5 dot 20 = 50" km/h" $
    Mệnh đề b ĐÚNG.

    #step([Độ biến thiên vận tốc])
    Vectơ biến thiên vận tốc:
    $ Delta vec(v) = vec(v)_1 - vec(v)_0 = 2.5 vec(v)_0 - vec(v)_0 = 1.5 vec(v)_0 $
    Độ lớn độ biến thiên: $|Delta vec(v)| = 1.5 dot 20 = 30" km/h"$. Mệnh đề c ĐÚNG.

    #step([Xét khi ca nô chạy ngược lại])
    Khi ca nô quay đầu chạy ngược lại (hướng Tây), hướng chuyển động bị đảo ngược nên vectơ vận tốc mới là $vec(v)_2 = - vec(v)_1 != vec(v)_1$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho đoạn thẳng $A B$ có độ dài bằng $12" cm"$. Điểm $M$ nằm giữa hai điểm $A$ và $B$ sao cho thỏa mãn hệ thức vectơ $vec(M A) = - 3 vec(M B)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pM = (3.0, 0)
    let pB = (4.0, 0)
    line(pA, pB, stroke: 0.8pt + luma(180))
    line(pM, (0.2, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.5, 0.35), text(fill: rgb("dc2626"), size: 8pt)[$vec(M A)$])
    line(pM, (3.8, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((3.5, 0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(M B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pM, radius: 2pt, fill: black)
    content((3.0, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
    circle(pB, radius: 2pt, fill: black)
    content((4.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
  })
]
Tính độ dài của đoạn thẳng $A M$ theo đơn vị centimét.],
    [9],
    loigiai: [
        #step([Chuyển đổi từ hệ thức vectơ sang độ dài])
        Lấy độ dài hai vế của đẳng thức vectơ $vec(M A) = - 3 vec(M B)$:
        $ |vec(M A)| = |- 3| dot |vec(M B)| <=> M A = 3 M B $
        
        #step([Tính độ dài AM])
        Vì $M$ nằm giữa hai điểm $A$ và $B$ nên:
        $ A B = A M + M B = 3 M B + M B = 4 M B = 12" cm" $
        Suy ra $M B = 12 / 4 = 3" cm"$.
        Vậy $A M = 3 dot M B = 3 dot 3 = 9" cm"$.
    ]
)

// TLN 2 (Câu 18)
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có trọng tâm là $G$. Gọi $M$ là trung điểm của cạnh $B C$. Biết độ dài đoạn thẳng trung tuyến $A M = 15" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.5)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (1.5, 0)
    let pG = (1.5, 0.83)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, stroke: (paint: luma(180), dash: "dashed"))
    line(pA, pG, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.85, 1.7), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(A G)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.75), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pG, radius: 2pt, fill: black)
    content((1.8, 0.83), text(size: 8.5pt, weight: "bold")[$G$])
    circle(pM, radius: 2pt, fill: black)
    content((1.5, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
  })
]
Tính độ dài của vectơ $vec(G A)$ theo đơn vị centimét.],
    [10],
    loigiai: [
        #step([Tính chất trọng tâm tam giác])
        Trong tam giác $A B C$, trọng tâm $G$ chia đoạn trung tuyến $A M$ theo tỉ lệ:
        $ A G = 2/3 A M $
        
        #step([Tính độ dài GA])
        Thay số $A M = 15" cm"$:
        $ G A = A G = 2/3 dot 15 = 10" cm" $
        Vậy độ dài của vectơ $|vec(G A)| = G A = 10" cm"$.
    ]
)

// TLN 3 (Câu 19)
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho tam giác đều $A B C$ có cạnh bằng $8" cm"$. Gọi $M$ là trung điểm của cạnh $B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (1.5, 0)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.85, 1.3), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A M)$])
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
Tính độ dài của vectơ $3 vec(A M)$ theo đơn vị centimét (làm tròn kết quả đến chữ số thập phân thứ nhất).
(Cho biết $sqrt(3) approx 1.732$)],
    [20.8],
    loigiai: [
        #step([Tính độ dài đường cao AM])
        Trong tam giác đều cạnh $a = 8" cm"$, đường cao đồng thời là trung tuyến $A M$ có độ dài:
        $ A M = (a sqrt(3)) / 2 = (8 sqrt(3)) / 2 = 4 sqrt(3)" cm" $
        
        #step([Tính độ dài vectơ 3 AM])
        Độ dài của vectơ:
        $ |3 vec(A M)| = 3 dot A M = 3 dot 4 sqrt(3) = 12 sqrt(3)" cm" $
        Thay số: $12 sqrt(3) approx 12 dot 1.73205 = 20.7846" cm"$.
        Làm tròn đến chữ số thập phân thứ nhất ta được $20.8" cm"$.
    ]
)

// TLN 4 (Câu 20)
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Cho hình vuông $A B C D$ có cạnh bằng $6" cm"$. Gọi $O$ là tâm của hình vuông.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 2)
    let pB = (2, 2)
    let pC = (2, 0)
    let pD = (0, 0)
    let pO = (1, 1)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.3, 1.2), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    circle(pO, radius: 2pt, fill: black)
    content((1.2, 0.8), text(size: 8pt, weight: "bold")[$O$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 2.0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.2, 2.0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ $vec(u) = vec(A B) + vec(A D) + 2 vec(A C)$ theo đơn vị centimét (làm tròn kết quả đến chữ số thập phân thứ nhất).
(Cho biết $sqrt(2) approx 1.414$)],
    [25.5],
    loigiai: [
        #step([Thu gọn biểu thức vectơ])
        Vì $A B C D$ là hình vuông nên theo quy tắc hình bình hành:
        $ vec(A B) + vec(A D) = vec(A C) $
        Thay vào biểu thức của vectơ $vec(u)$:
        $ vec(u) = (vec(A B) + vec(A D)) + 2 vec(A C) = vec(A C) + 2 vec(A C) = 3 vec(A C) $
        
        #step([Tính độ dài đường chéo AC])
        Đường chéo hình vuông cạnh $a = 6" cm"$ là:
        $ A C = 6 sqrt(2)" cm" $
        
        #step([Tính độ dài vectơ u])
        Độ dài vectơ:
        $ |vec(u)| = |3 vec(A C)| = 3 dot A C = 3 dot 6 sqrt(2) = 18 sqrt(2)" cm" $
        Thay số: $18 sqrt(2) approx 18 dot 1.4142 = 25.4558" cm"$.
        Làm tròn đến chữ số thập phân thứ nhất ta được $25.5" cm"$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Đòn bẩy Archimedes)
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Một thanh đòn bẩy đồng chất nhẹ có chiều dài $A B = 200" cm"$ tựa thăng bằng nằm ngang trên điểm tựa $O$ nằm giữa hai đầu $A$ và $B$. Tại đầu $A$ treo một vật có khối lượng $m_1 = 30" kg"$, tại đầu $B$ treo một vật có khối lượng $m_2 = 50" kg"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pO = (3.125, 0)
    let pB = (5.0, 0)
    
    // Thanh đòn bẩy
    rect((-0.1, -0.08), (5.1, 0.08), fill: rgb("e2e8f0"), stroke: 1pt + black)
    
    // Điểm tựa tam giác O
    line((3.125, 0), (2.85, -0.6), (3.4, -0.6), close: true, fill: rgb("94a3b8"), stroke: 1pt + black)
    content((3.125, -0.85), text(weight: "bold", size: 8.5pt)[Điểm tựa $O$])
    
    // Quả cân A (m1 = 30kg)
    line((0, -0.08), (0, -0.7), stroke: 1pt + black)
    rect((-0.4, -1.3), (0.4, -0.7), fill: rgb("f8fafc"), stroke: 1.2pt + rgb("1e40af"))
    content((0, -1.0), text(fill: rgb("1e40af"), size: 8pt, weight: "bold")[$30" kg"$])
    content((0, 0.3), text(weight: "bold", size: 8.5pt)[$A$])
    
    // Quả cân B (m2 = 50kg)
    line((5.0, -0.08), (5.0, -0.7), stroke: 1pt + black)
    rect((4.5, -1.4), (5.5, -0.7), fill: rgb("f8fafc"), stroke: 1.2pt + rgb("dc2626"))
    content((5.0, -1.05), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$50" kg"$])
    content((5.0, 0.3), text(weight: "bold", size: 8.5pt)[$B$])
  })
]
Để thanh đòn bẩy cân bằng thăng bằng, vị trí điểm tựa $O$ phải thỏa mãn hệ thức vectơ tâm tỉ cự: $30 vec(O A) + 50 vec(O B) = vec(0)$. Tính khoảng cách từ điểm tựa $O$ đến đầu $A$ (độ dài đoạn $O A$) theo đơn vị centimét.],
    [125],
    loigiai: [
        #step([Biến đổi hệ thức vectơ cân bằng])
        Từ hệ thức cân bằng đòn bẩy:
        $ 30 vec(O A) + 50 vec(O B) = vec(0) <=> 30 vec(O A) = - 50 vec(O B) $
        Lấy độ dài hai vế:
        $ 30 dot O A = 50 dot O B <=> 3 O A = 5 O B <=> O B = 3/5 O A $
        
        #step([Tính độ dài đoạn OA])
        Vì $O$ nằm giữa hai đầu $A$ và $B$ nên:
        $ A B = O A + O B = O A + 3/5 O A = 8/5 O A $
        Biết chiều dài cả thanh $A B = 200" cm"$:
        $ 8/5 O A = 200 <=> O A = (200 dot 5) / 8 = 125" cm" $
        Vậy khoảng cách từ điểm tựa $O$ đến đầu $A$ là $125" cm"$.
    ]
)

// TLN 6 (Câu 22 - Thực tế Robot chuyển hàng)
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 107], back-to: "sec-exercise-hub",[Một robot vận chuyển hàng thông minh trong nhà máy xuất phát từ điểm $O$, di chuyển thẳng theo vectơ độ dịch chuyển $vec(d)_1 = 10 vec(e)$ (với $vec(e)$ là vectơ đơn vị có độ dài $1" m"$ theo trục di chuyển). Đến vị trí thứ nhất, robot nhận thêm lệnh di chuyển tiếp cùng hướng với vectơ $vec(d)_2 = 2.5 vec(d)_1$ đến vị trí bốc dỡ. Sau khi hoàn thành bốc hàng, robot lùi lại theo hướng ngược lại với vectơ $vec(d)_3 = - 1.2 vec(d)_1$ về vị trí nghỉ.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let p1 = (1.5, 0)
    let p2 = (5.25, 0)
    let pEnd = (3.45, 0)
    
    // Trục chuyển động
    line((-0.5, 0), (6.0, 0), stroke: 0.6pt + luma(180))
    
    // Chặng 1: d1
    line(pO, p1, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.75, 0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(d)_1 (10"m")$])
    
    // Chặng 2: d2
    line(p1, p2, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((3.35, 0.35), text(fill: rgb("1e40af"), size: 8pt)[$vec(d)_2 (25"m")$])
    
    // Chặng 3: lùi lại d3
    line(p2, pEnd, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((4.35, -0.4), text(fill: rgb("dc2626"), size: 8pt)[$vec(d)_3$ (lùi)])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((0, -0.3), [🤖 $O$])
    circle(pEnd, radius: 2.5pt, fill: black)
    content((3.45, 0.35), [🛑 Điểm nghỉ])
  })
]
Tính khoảng cách từ vị trí xuất phát $O$ đến vị trí nghỉ cuối cùng của robot theo đơn vị mét.],
    [23],
    loigiai: [
        #step([Biểu diễn vectơ độ dịch chuyển tổng hợp])
        Vectơ độ dịch chuyển tổng hợp của robot từ điểm xuất phát $O$ đến vị trí nghỉ là tổng ba vectơ di chuyển liên tiếp:
        $ vec(d) = vec(d)_1 + vec(d)_2 + vec(d)_3 $
        
        #step([Rút gọn biểu thức vectơ theo d1])
        Thay các mối quan hệ đề bài cho:
        $ vec(d) = vec(d)_1 + 2.5 vec(d)_1 - 1.2 vec(d)_1 = (1 + 2.5 - 1.2) vec(d)_1 = 2.3 vec(d)_1 $
        
        #step([Tính khoảng cách thực tế])
        Độ lớn vectơ độ dịch chuyển tổng hợp:
        $ d = |vec(d)| = 2.3 dot |vec(d)_1| = 2.3 dot 10 = 23" m" $
        Vậy khoảng cách từ điểm xuất phát $O$ đến vị trí nghỉ là $23" m"$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 9: TÍCH CỦA MỘT VECTƠ VỚI MỘT SỐ (ĐỀ SỐ 1)!]      #v(0.6em)
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
