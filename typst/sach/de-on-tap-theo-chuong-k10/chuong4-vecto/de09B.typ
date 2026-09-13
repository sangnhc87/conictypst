#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let draw_angle_arc(center, a1, a2, radius: 0.8, ..rest) = {
  let sx = center.at(0) + radius * calc.cos(a1)
  let sy = center.at(1) + radius * calc.sin(a1)
  cetz.draw.arc((sx, sy), start: a1, stop: a2, radius: radius, ..rest)
}

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0d9488") // Teal

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 4",
  exam-title: "BÀI 9: TÍCH CỦA MỘT VECTƠ VỚI MỘT SỐ (ĐỀ SỐ 2)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "108",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho tam giác $A B C$. Gọi $M$ là trung điểm của cạnh $B C$. Phân tích vectơ trung tuyến $vec(A M)$ theo hai vectơ cạnh $vec(A B)$ và $vec(A C)$ ta được
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.4)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (1.5, 0)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.9, 1.2), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A M)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.65), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((1.5, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
  })
]],
    (
        True([$vec(A M) = 1/2 vec(A B) + 1/2 vec(A C)$]),
        [$vec(A M) = vec(A B) + vec(A C)$],
        [$vec(A M) = 1/2 vec(A B) - 1/2 vec(A C)$],
        [$vec(A M) = 2 vec(A B) + 2 vec(A C)$]
    ),
    loigiai: [
        Vì $M$ là trung điểm của $B C$ nên $vec(A B) + vec(A C) = 2 vec(A M)$. Suy ra $vec(A M) = 1/2 vec(A B) + 1/2 vec(A C)$.
    ]
)

// TN 2
#tn([Cho tam giác $A B C$ có trọng tâm là $G$. Biểu diễn vectơ $vec(A G)$ theo hai vectơ $vec(A B)$ và $vec(A C)$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.5)
    let pB = (0, 0)
    let pC = (3.2, 0)
    let pM = (1.6, 0)
    let pG = (1.53, 0.83)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, stroke: (paint: luma(180), dash: "dashed"))
    line(pA, pG, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.9, 1.6), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(A G)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.75), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.4, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pG, radius: 2pt, fill: black)
    content((1.8, 0.83), text(size: 8.5pt, weight: "bold")[$G$])
  })
]],
    (
        True([$vec(A G) = 1/3 vec(A B) + 1/3 vec(A C)$]),
        [$vec(A G) = 2/3 vec(A B) + 2/3 vec(A C)$],
        [$vec(A G) = 1/2 vec(A B) + 1/2 vec(A C)$],
        [$vec(A G) = 1/3 vec(A B) - 1/3 vec(A C)$]
    ),
    loigiai: [
        Ta có $vec(A G) = 2/3 vec(A M) = 2/3 dot (1/2 vec(A B) + 1/2 vec(A C)) = 1/3 vec(A B) + 1/3 vec(A C)$.
    ]
)

// TN 3
#tn([Cho hình thang $A B C D$ có hai đáy là $A B$ và $C D$ thỏa mãn $A B = 2 C D$. Đẳng thức vectơ nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3.6, 0)
    let pC = (2.6, 1.6)
    let pD = (0.8, 1.6)
    line(pA, pB, stroke: 0.8pt + luma(160))
    line(pD, pC, stroke: 0.8pt + luma(160))
    line(pA, pD, stroke: 0.8pt + luma(160))
    line(pB, pC, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.8, -0.35), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A B)$])
    line(pD, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.7, 1.95), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(D C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.8, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.8, 1.6), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0.6, 1.6), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$vec(A B) = 2 vec(D C)$]),
        [$vec(A B) = 2 vec(C D)$],
        [$vec(A B) = - 2 vec(D C)$],
        [$vec(A B) = 1/2 vec(D C)$]
    ),
    loigiai: [
        Hai đoạn thẳng $A B parallel C D$, hướng từ $A$ sang $B$ cùng hướng từ $D$ sang $C$, và độ dài $A B = 2 D C$. Do đó $vec(A B) = 2 vec(D C)$.
    ]
)

// TN 4
#tn([Cho đoạn thẳng $A B$. Điểm $N$ nằm trên tia đối của tia $B A$ sao cho $B N = A B$. Đẳng thức vectơ nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (1.8, 0)
    let pN = (3.6, 0)
    line(pA, pN, stroke: 0.8pt + luma(180))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.9, 0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(A B)$])
    line(pA, (3.5, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.2pt + rgb("1e40af"))
    content((2.7, -0.35), text(fill: rgb("1e40af"), size: 8pt)[$vec(A N) = 2 vec(A B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((1.8, -0.25), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pN, radius: 2pt, fill: black)
    content((3.8, 0), text(size: 8.5pt, weight: "bold")[$N$])
  })
]],
    (
        True([$vec(A N) = 2 vec(A B)$]),
        [$vec(A N) = - 2 vec(A B)$],
        [$vec(A N) = 1/2 vec(A B)$],
        [$vec(B N) = - vec(A B)$]
    ),
    loigiai: [
        $N$ thuộc tia đối của tia $B A$ nghĩa là $B$ nằm giữa $A$ và $N$. Vì $B N = A B$ nên $B$ là trung điểm của $A N$, suy ra $A N = 2 A B$. Hai vectơ $vec(A N)$ và $vec(A B)$ cùng hướng, do đó $vec(A N) = 2 vec(A B)$.
    ]
)

// TN 5
#tn([Cho tam giác $A B C$. Lấy điểm $K$ trên cạnh $A C$ sao cho $A K = 2/3 A C$. Phân tích vectơ $vec(B K)$ theo hai vectơ $vec(B A)$ và $vec(B C)$ ta được
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 2.4)
    let pB = (0, 0)
    let pC = (3.2, 0)
    let pK = (2.3, 0.8)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pB, pK, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.2, 0.7), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(B K)$])
    circle(pA, radius: 2pt, fill: black)
    content((0.5, 2.65), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.4, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pK, radius: 2pt, fill: black)
    content((2.5, 0.95), text(size: 8.5pt, weight: "bold")[$K$])
  })
]],
    (
        True([$vec(B K) = 1/3 vec(B A) + 2/3 vec(B C)$]),
        [$vec(B K) = 2/3 vec(B A) + 1/3 vec(B C)$],
        [$vec(B K) = 1/3 vec(B A) - 2/3 vec(B C)$],
        [$vec(B K) = 2/3 vec(B A) - 1/3 vec(B C)$]
    ),
    loigiai: [
        Ta có $vec(A K) = 2/3 vec(A C) = 2/3 (vec(B C) - vec(B A))$.
        Suy ra:
        $ vec(B K) = vec(B A) + vec(A K) = vec(B A) + 2/3 (vec(B C) - vec(B A)) = (1 - 2/3) vec(B A) + 2/3 vec(B C) = 1/3 vec(B A) + 2/3 vec(B C) $
    ]
)

// TN 6
#tn([Cho hai vectơ không cùng phương $vec(a)$ và $vec(b)$. Nếu $m vec(a) + n vec(b) = vec(0)$ thì kết luận nào sau đây luôn đúng?],
    (
        True([$m = 0$ và $n = 0$]),
        [$m = n != 0$],
        [$m = - n$],
        [$m > 0$ và $n < 0$]
    ),
    loigiai: [
        Do $vec(a)$ và $vec(b)$ là hai vectơ không cùng phương, nếu giả sử $m != 0$ thì $vec(a) = - n/m vec(b)$, dẫn đến $vec(a)$ và $vec(b)$ cùng phương (mâu thuẫn). Do đó bắt buộc $m = 0$ và $n = 0$.
    ]
)

// TN 7
#tn([Cho lục giác đều $A B C D E F$ tâm $O$. Đặt vectơ $vec(u) = vec(O A)$. Phân tích vectơ $vec(A D)$ theo $vec(u)$ ta được
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
    line(pts.at(0), pts.at(1), pts.at(2), pts.at(3), pts.at(4), pts.at(5), close: true, stroke: 0.8pt + luma(160))
    line((0, 0), pts.at(3), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-0.7, 0.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(u) = vec(O A)$])
    line(pts.at(3), pts.at(0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((0, -0.35), text(fill: rgb("dc2626"), size: 8pt)[$vec(A D)$])
    circle((0, 0), radius: 2pt, fill: black)
    content((0, 0.25), text(size: 8pt, weight: "bold")[$O$])
    circle(pts.at(3), radius: 2pt, fill: black)
    content((pts.at(3).at(0) - 0.25, 0), text(size: 8pt, weight: "bold")[$A$])
    circle(pts.at(0), radius: 2pt, fill: black)
    content((pts.at(0).at(0) + 0.25, 0), text(size: 8pt, weight: "bold")[$D$])
  })
]],
    (
        True([$vec(A D) = - 2 vec(u)$]),
        [$vec(A D) = 2 vec(u)$],
        [$vec(A D) = - vec(u)$],
        [$vec(A D) = vec(u)$]
    ),
    loigiai: [
        Trong lục giác đều, tâm $O$ là trung điểm của đường chéo chính $A D$, do đó $vec(A D) = 2 vec(A O) = - 2 vec(O A) = - 2 vec(u)$.
    ]
)

// TN 8
#tn([Cho hình bình hành $A B C D$. Gọi $M$ là trung điểm của cạnh $B C$. Phân tích vectơ $vec(A M)$ theo hai vectơ $vec(A B)$ và $vec(A D)$ ta được
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.6, 0)
    let pD = (1.0, 1.8)
    let pC = (3.6, 1.8)
    let pM = (3.1, 0.9)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.6, 0.7), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A M)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.6, -0.25), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.8, 1.8), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0.8, 1.9), text(size: 8.5pt, weight: "bold")[$D$])
    circle(pM, radius: 2pt, fill: black)
    content((3.3, 0.9), text(size: 8.5pt, weight: "bold")[$M$])
  })
]],
    (
        True([$vec(A M) = vec(A B) + 1/2 vec(A D)$]),
        [$vec(A M) = 1/2 vec(A B) + vec(A D)$],
        [$vec(A M) = vec(A B) + vec(A D)$],
        [$vec(A M) = vec(A B) - 1/2 vec(A D)$]
    ),
    loigiai: [
        Ta có $vec(A M) = vec(A B) + vec(B M)$. Vì $M$ là trung điểm của $B C$ và $vec(B C) = vec(A D)$ nên:
        $ vec(A M) = vec(A B) + 1/2 vec(B C) = vec(A B) + 1/2 vec(A D) $
    ]
)

// TN 9
#tn([Cho tam giác $A B C$ vuông tại $A$ có $A B = 3" cm"$ và $A C = 4" cm"$. Gọi $I$ là trung điểm của cạnh huyền $B C$. Độ dài của vectơ $4 vec(A I)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.4, 0)
    let pC = (0, 3.2)
    let pI = (1.2, 1.6)
    line((0.3, 0), (0.3, 0.3), (0, 0.3), stroke: 0.7pt + black)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pI, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.5, 1.0), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A I)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.6, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0, 3.4), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pI, radius: 2pt, fill: black)
    content((1.4, 1.8), text(size: 8.5pt, weight: "bold")[$I$])
  })
]],
    (
        True([$10" cm"$]),
        [$5" cm"$],
        [$20" cm"$],
        [$2.5" cm"$]
    ),
    loigiai: [
        Cạnh huyền $B C = sqrt(A B^2 + A C^2) = sqrt(3^2 + 4^2) = 5" cm"$.
        Đường trung tuyến ứng với cạnh huyền $A I = (B C) / 2 = 2.5" cm"$.
        Độ dài vectơ: $|4 vec(A I)| = 4 dot A I = 4 dot 2.5 = 10" cm"$.
    ]
)

// TN 10
#tn([Điểm $G$ là trọng tâm của tứ giác $A B C D$ khi và chỉ khi thỏa mãn đẳng thức vectơ nào sau đây?],
    (
        True([$vec(G A) + vec(G B) + vec(G C) + vec(G D) = vec(0)$]),
        [$vec(G A) + vec(G B) + vec(G C) = vec(G D)$],
        [$vec(A B) + vec(C D) = 2 vec(A C)$],
        [$vec(G A) + vec(G B) = vec(G C) + vec(G D)$]
    ),
    loigiai: [
        Theo định nghĩa trọng tâm của hệ $4$ điểm (tứ giác $A B C D$), điểm $G$ là trọng tâm khi và chỉ khi tổng các vectơ xuất phát từ $G$ đến $4$ đỉnh bằng vectơ-không: $vec(G A) + vec(G B) + vec(G C) + vec(G D) = vec(0)$.
    ]
)

// TN 11
#tn([Cho tam giác $A B C$. Gọi $I$ là điểm thỏa mãn đẳng thức $2 vec(I A) + 3 vec(I B) = vec(0)$. Khẳng định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pI = (2.1, 0)
    let pB = (3.5, 0)
    line(pA, pB, stroke: 0.8pt + luma(180))
    line(pI, (0.1, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.0, 0.35), text(fill: rgb("dc2626"), size: 8pt)[$2 vec(I A)$])
    line(pI, (3.4, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((2.8, 0.35), text(fill: rgb("0d9488"), size: 8pt)[$3 vec(I B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pI, radius: 2pt, fill: black)
    content((2.1, -0.25), text(size: 8.5pt, weight: "bold")[$I$])
    circle(pB, radius: 2pt, fill: black)
    content((3.7, 0), text(size: 8.5pt, weight: "bold")[$B$])
  })
]],
    (
        True([Điểm $I$ nằm trên đoạn thẳng $A B$ và $I A = 3/2 I B$.]),
        [Điểm $I$ nằm trên đoạn thẳng $A B$ và $I A = 2/3 I B$.],
        [Điểm $I$ nằm ngoài đoạn thẳng $A B$.],
        [$vec(A I) = 2/3 vec(A B)$.]
    ),
    loigiai: [
        Từ $2 vec(I A) + 3 vec(I B) = vec(0) <=> vec(I A) = - 3/2 vec(I B)$.
        Do hệ số âm nên hai vectơ $vec(I A), vec(I B)$ ngược hướng, suy ra $I$ nằm giữa $A$ và $B$.
        Lấy độ dài: $I A = 3/2 I B$.
    ]
)

// TN 12
#tn([Cho tam giác $A B C$. Với điểm $M$ tùy ý, biểu thức vectơ $vec(v) = vec(M A) + vec(M B) - 2 vec(M C)$],
    (
        True([Là một vectơ không đổi, hoàn toàn độc lập với vị trí điểm $M$.]),
        [Có độ lớn thay đổi phụ thuộc vào vị trí điểm $M$.],
        [Luôn bằng vectơ-không $vec(0)$.],
        [Có phương luôn đi qua trọng tâm tam giác $A B C$.]
    ),
    loigiai: [
        Ta biến đổi biểu thức vectơ:
        $ vec(v) = (vec(M A) - vec(M C)) + (vec(M B) - vec(M C)) = vec(C A) + vec(C B) $
        Vì $A, B, C$ là các điểm cố định nên vectơ tổng $vec(C A) + vec(C B)$ là một vectơ hoàn toàn xác định và không phụ thuộc vào vị trí của điểm $M$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Hình thang vuông và tỉ số đường chéo)
#ds([Cho hình thang vuông $A B C D$ vuông tại $A$ và $D$, có hai đáy $A B parallel C D$ thỏa mãn $A B = 2 C D$. Gọi $I$ là giao điểm của hai đường chéo $A C$ và $B D$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 2.4)
    let pB = (3.6, 2.4)
    let pC = (1.8, 0)
    let pD = (0, 0)
    let pI = (1.2, 0.8)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, stroke: 1pt + rgb("1e40af"))
    line(pB, pD, stroke: 1pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 2.4), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.8, 2.4), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.0, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$D$])
    circle(pI, radius: 2pt, fill: black)
    content((1.3, 1.05), text(size: 8.5pt, weight: "bold")[$I$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai tam giác $I A B$ và $I C D$ đồng dạng và tỉ số khoảng cách là $(I B) / (I D) = 2$.]),
    True([Vectơ $vec(I B)$ liên hệ với vectơ $vec(I D)$ qua đẳng thức $vec(I B) = - 2 vec(I D)$.]),
    True([Vectơ đường chéo $vec(A C)$ biểu diễn theo các cạnh là $vec(A C) = vec(A D) + 1/2 vec(A B)$.]),
    [Hệ thức vectơ đối với điểm $I$ thỏa mãn $vec(I A) = 2 vec(I C)$.]
  ),
  loigiai: [
    #step([Đồng dạng của hai tam giác qua giao điểm hai đường chéo])
    Do $A B parallel C D$ nên theo định lý Ta-lét, hai tam giác $I A B$ và $I C D$ đồng dạng với tỉ số:
    $ (I A) / (I C) = (I B) / (I D) = (A B) / (C D) = (2 C D) / (C D) = 2 $
    Mệnh đề a ĐÚNG.

    #step([Mối liên hệ giữa hai vectơ IB và ID])
    Vì $I$ nằm giữa hai điểm $B$ và $D$ nên hai vectơ $vec(I B)$ và $vec(I D)$ ngược hướng.
    Kết hợp $I B = 2 I D$, suy ra $vec(I B) = - 2 vec(I D)$. Mệnh đề b ĐÚNG.

    #step([Phân tích vectơ AC])
    Ta có $vec(A C) = vec(A D) + vec(D C)$. Vì $A B parallel C D$ và $A B = 2 C D$ nên $vec(D C) = 1/2 vec(A B)$.
    Do đó $vec(A C) = vec(A D) + 1/2 vec(A B)$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra vectơ IA và IC])
    $I$ nằm giữa $A$ và $C$ nên hai vectơ $vec(I A)$ và $vec(I C)$ ngược hướng nhau.
    Do đó $vec(I A) = - 2 vec(I C)$ chứ không phải $2 vec(I C)$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Lục giác đều tâm O & Hệ vectơ cơ sở)
#ds([Cho lục giác đều $A B C D E F$ có tâm $O$. Đặt hai vectơ cơ sở là $vec(u) = vec(A B)$ và $vec(v) = vec(A F)$.
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
    line(pts.at(0), pts.at(1), pts.at(2), pts.at(3), pts.at(4), pts.at(5), close: true, stroke: 0.8pt + luma(160))
    line(pts.at(3), pts.at(2), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.3, 1.0), text(fill: rgb("0d9488"), size: 8pt)[$vec(u) = vec(A B)$])
    line(pts.at(3), pts.at(4), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((-1.3, -1.0), text(fill: rgb("1e40af"), size: 8pt)[$vec(v) = vec(A F)$])
    line(pts.at(3), pts.at(0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((0, 0.3), text(fill: rgb("dc2626"), size: 8pt)[$vec(A D)$])
    circle((0, 0), radius: 2pt, fill: black)
    content((0, -0.25), text(size: 8pt, weight: "bold")[$O$])
    circle(pts.at(3), radius: 2pt, fill: black)
    content((pts.at(3).at(0) - 0.25, 0), text(size: 8pt, weight: "bold")[$A$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ $vec(A O)$ biểu diễn theo hai vectơ cơ sở là $vec(A O) = vec(u) + vec(v)$.]),
    True([Vectơ đường chéo chính $vec(A D)$ thỏa mãn $vec(A D) = 2 vec(u) + 2 vec(v)$.]),
    True([Vectơ đường chéo $vec(A C)$ biểu diễn theo hai vectơ cơ sở là $vec(A C) = 2 vec(u) + vec(v)$.]),
    [Vectơ $vec(A E)$ biểu diễn theo hai vectơ cơ sở là $vec(A E) = 2 vec(u) + vec(v)$.]
  ),
  loigiai: [
    #step([Biểu diễn vectơ AO])
    Trong lục giác đều, tứ giác $A B O F$ là hình bình hành (vì $A B = O F$ và $A B parallel O F$).
    Theo quy tắc hình bình hành: $vec(A O) = vec(A B) + vec(A F) = vec(u) + vec(v)$. Mệnh đề a ĐÚNG.

    #step([Biểu diễn vectơ AD])
    Vì $O$ là trung điểm của đường chéo chính $A D$:
    $ vec(A D) = 2 vec(A O) = 2 (vec(u) + vec(v)) = 2 vec(u) + 2 vec(v) $
    Mệnh đề b ĐÚNG.

    #step([Biểu diễn vectơ AC])
    Ta có $vec(A C) = vec(A B) + vec(B C)$.
    Trong lục giác đều, $vec(B C) = vec(A O) = vec(u) + vec(v)$.
    Do đó: $vec(A C) = vec(u) + (vec(u) + vec(v)) = 2 vec(u) + vec(v)$. Mệnh đề c ĐÚNG.

    #step([Biểu diễn vectơ AE])
    Ta có $vec(A E) = vec(A F) + vec(F E) = vec(v) + vec(A O) = vec(v) + (vec(u) + vec(v)) = vec(u) + 2 vec(v) != 2 vec(u) + vec(v)$. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Vật lý Khí động học máy bay)
#ds([Trong giai đoạn bay bằng hành trình, cánh của một chiếc máy bay phản lực thương mại tạo ra lực nâng khí động học $vec(L)$ hướng thẳng đứng lên trên để triệt tiêu trọng lực $vec(P)$ của máy bay ($L = P = 200000" N"$). Đồng thời, máy bay chịu lực cản của không khí $vec(D)$ hướng ngược chiều bay với độ lớn $D = 20000" N"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    
    // Thân máy bay tượng trưng
    circle(pO, radius: 3pt, fill: black)
    content((-0.4, 0.4), [✈️ $O$])
    
    // Lực nâng L hướng lên
    line(pO, (0, 2.5), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((0, 2.8), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(L) (200" kN")$])
    
    // Trọng lực P hướng xuống
    line(pO, (0, -2.5), mark: (end: ">", fill: luma(120)), stroke: (paint: luma(120), dash: "dashed", thickness: 1.5pt))
    content((0, -2.8), text(fill: luma(120), size: 8.5pt)[$vec(P) (200" kN")$])
    
    // Lực cản D hướng sang trái
    line(pO, (-1.5, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((-1.5, -0.35), text(fill: rgb("dc2626"), size: 8pt)[$vec(D) (20" kN")$])
    
    // Lực đẩy động cơ T hướng sang phải
    line(pO, (1.5, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.5, -0.35), text(fill: rgb("1e40af"), size: 8pt)[$vec(T) (20" kN")$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ lực nâng $vec(L)$ có phương vuông góc với vectơ lực cản $vec(D)$.]),
    True([Để máy bay duy trì bay thẳng đều, động cơ phản lực phải tạo ra lực đẩy $vec(T) = - vec(D)$ có độ lớn bằng $20000" N"$.]),
    True([Tỉ số giữa độ lớn lực nâng và độ lớn lực cản là $(|vec(L)|) / (|vec(D)|) = 10$.]),
    [Nếu máy bay giảm tốc độ làm lực cản $D$ giảm một nửa ($10000" N"$) trong khi giữ nguyên lực nâng $L$ thì tỉ số $(|vec(L)|) / (|vec(D)|)$ bị giảm xuống còn $5$.]
  ),
  loigiai: [
    #step([Phương của lực nâng và lực cản])
    Lực nâng $vec(L)$ có phương thẳng đứng hướng lên trên, lực cản $vec(D)$ có phương nằm ngang ngược chiều bay, do đó $vec(L) perp vec(D)$. Mệnh đề a ĐÚNG.

    #step([Điều kiện chuyển động thẳng đều])
    Để máy bay duy trì trạng thái bay bằng thẳng đều, tổng hợp lực tác dụng theo phương ngang phải triệt tiêu: $vec(T) + vec(D) = vec(0) <=> vec(T) = - vec(D)$. Độ lớn lực đẩy cần thiết là $T = D = 20000" N"$. Mệnh đề b ĐÚNG.

    #step([Tính tỉ số chất lượng khí động học])
    Tỉ số giữa lực nâng và lực cản là:
    $ (|vec(L)|) / (|vec(D)|) = 200000 / 20000 = 10 $
    Mệnh đề c ĐÚNG.

    #step([Xét khi lực cản giảm một nửa])
    Khi lực cản giảm xuống $D' = 10000" N"$ và $L = 200000" N"$ giữ nguyên:
    $ (|vec(L)|) / (|vec(D')|) = 200000 / 10000 = 20 > 10 $
    Tỉ số này tăng lên $20$ chứ không thể giảm xuống $5$. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Cẩu tháp nâng cấu kiện bê tông)
#ds([Một cẩu tháp tại công trường xây dựng nâng một khối bê tông đúc sẵn có khối lượng $m = 3000" kg"$ (trọng lượng $P = 30000" N"$) bằng hai sợi dây cáp thép $O A$ và $O B$ đối xứng qua phương thẳng đứng, mỗi sợi dây hợp với phương thẳng đứng một góc $30^circ$. Khối bê tông được giữ đứng yên thăng bằng ở trạng thái tĩnh.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let p1 = (-1.2, 2.078)
    let p2 = (1.2, 2.078)
    let pT = (0, 2.078 * 2)
    
    // Móc cẩu O
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.3, -0.2), [🏗️ $O$])
    
    // Trọng lực P
    line(pO, (0, -2.5), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((0, -2.8), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(P) (30000" N")$])
    
    // Cáp T1 và T2
    line(pO, p1, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.5, 1.2), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(T)_1$])
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.5, 1.2), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(T)_2$])
    
    // Góc 30 độ
    line(pO, (0, 2.5), stroke: (paint: luma(180), dash: "dashed"))
    content((-0.25, 0.8), text(size: 7.5pt)[$30^circ$])
    content((0.25, 0.8), text(size: 7.5pt)[$30^circ$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Do tính chất đối xứng hình học, độ lớn lực căng của hai sợi dây cáp bằng nhau: $T_1 = T_2$.]),
    True([Hợp lực của hai lực căng $vec(T) = vec(T)_1 + vec(T)_2$ có phương thẳng đứng, hướng lên trên và cân bằng với trọng lực: $vec(T) + vec(P) = vec(0)$.]),
    True([Độ lớn của hợp lực căng hai sợi dây là $T = 30000" N"$.]),
    [Độ lớn lực căng trên mỗi sợi dây cáp bằng đúng $15000" N"$.]
  ),
  loigiai: [
    #step([Tính đối xứng của lực căng])
    Hai sợi dây cáp đối xứng nhau qua trục thẳng đứng và chịu tải cân bằng nên hai vectơ lực căng có độ lớn bằng nhau: $T_1 = T_2$. Mệnh đề a ĐÚNG.

    #step([Điều kiện cân bằng lực])
    Khối bê tông ở trạng thái cân bằng đứng yên nên tổng hợp lực tác dụng lên móc cẩu $O$ bằng vectơ-không:
    $ vec(T)_1 + vec(T)_2 + vec(P) = vec(0) <=> vec(T) = - vec(P) $
    Hợp lực $vec(T)$ hướng thẳng đứng lên trên và có độ lớn $T = P = 30000" N"$. Do đó mệnh đề b và c ĐÚNG.

    #step([Tính độ lớn lực căng mỗi dây])
    Chiếu phương trình cân bằng lên trục thẳng đứng:
    $ T_1 cos 30^circ + T_2 cos 30^circ = P <=> 2 T_1 cos 30^circ = 30000 $
    $ <=> 2 T_1 dot (sqrt(3) / 2) = 30000 <=> T_1 sqrt(3) = 30000 $
    $ => T_1 = T_2 = 30000 / sqrt(3) = 10000 sqrt(3) approx 17320.5" N" $
    Giá trị này lớn hơn $15000" N"$ (do các sợi dây bị kéo xiên $30^circ$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho tam giác $A B C$. Gọi $M$ là điểm nằm trên cạnh $B C$ sao cho $B M = 2 M C$. Biểu diễn vectơ $vec(A M)$ theo hai vectơ cạnh dưới dạng $vec(A M) = x vec(A B) + y vec(A C)$ với $x, y in bb(R)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.2, 2.5)
    let pB = (0, 0)
    let pC = (3.6, 0)
    let pM = (2.4, 0)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.9, 1.2), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A M)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.2, 2.75), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.8, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((2.4, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
  })
]
Tính giá trị của biểu thức $T = 3 x + 6 y$.],
    [5],
    loigiai: [
        #step([Phân tích điểm M chia đoạn BC])
        Vì $M$ nằm trên cạnh $B C$ và $B M = 2 M C$ nên:
        $ vec(B M) = 2/3 vec(B C) = 2/3 (vec(A C) - vec(A B)) $
        
        #step([Biểu diễn vectơ AM])
        Áp dụng quy tắc tam giác:
        $ vec(A M) = vec(A B) + vec(B M) = vec(A B) + 2/3 (vec(A C) - vec(A B)) = 1/3 vec(A B) + 2/3 vec(A C) $
        Từ đó đồng nhất hệ số ta được $x = 1/3$ và $y = 2/3$.
        
        #step([Tính giá trị biểu thức T])
        $ T = 3 x + 6 y = 3 dot 1/3 + 6 dot 2/3 = 1 + 4 = 5 $
    ]
)

// TLN 2 (Câu 18)
#tln([Cho hình bình hành $A B C D$. Gọi $G$ là trọng tâm của tam giác $A B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3, 0)
    let pD = (1.2, 1.8)
    let pC = (4.2, 1.8)
    let pG = (2.4, 0.6)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, stroke: (paint: luma(180), dash: "dashed"))
    line(pD, pG, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.9, 1.3), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(D G)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((4.4, 1.8), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((1.0, 2.0), text(size: 8.5pt, weight: "bold")[$D$])
    circle(pG, radius: 2pt, fill: black)
    content((2.5, 0.35), text(size: 8.5pt, weight: "bold")[$G$])
  })
]
Phân tích vectơ $vec(D G)$ theo hai vectơ $vec(D A)$ và $vec(D C)$ dưới dạng $vec(D G) = m vec(D A) + n vec(D C)$. Tính giá trị của biểu thức $P = 3(m + n)$.],
    [4],
    loigiai: [
        #step([Sử dụng tính chất trọng tâm tam giác])
        Vì $G$ là trọng tâm của tam giác $A B C$ nên với điểm $D$ bất kỳ ta luôn có:
        $ vec(D A) + vec(D B) + vec(D C) = 3 vec(D G) <=> vec(D G) = 1/3 (vec(D A) + vec(D B) + vec(D C)) $
        
        #step([Biểu diễn đường chéo DB theo quy tắc hình bình hành])
        Trong hình bình hành $A B C D$, theo quy tắc hình bình hành xuất phát từ đỉnh $D$:
        $ vec(D B) = vec(D A) + vec(D C) $
        
        #step([Rút gọn vectơ DG])
        Thay $vec(D B)$ vào biểu thức $vec(D G)$:
        $ vec(D G) = 1/3 (vec(D A) + (vec(D A) + vec(D C)) + vec(D C)) = 1/3 (2 vec(D A) + 2 vec(D C)) = 2/3 vec(D A) + 2/3 vec(D C) $
        Suy ra $m = 2/3$ và $n = 2/3$.
        
        #step([Tính giá trị P])
        $ P = 3(m + n) = 3(2/3 + 2/3) = 3 dot 4/3 = 4 $
    ]
)

// TLN 3 (Câu 19)
#tln([Cho tam giác $A B C$ vuông tại $A$ có $A B = 6" cm"$ và $A C = 8" cm"$. Gọi $G$ là trọng tâm của tam giác $A B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.4, 0)
    let pC = (0, 3.2)
    let pM = (1.2, 1.6)
    let pG = (0.8, 1.07)
    line((0.3, 0), (0.3, 0.3), (0, 0.3), stroke: 0.7pt + black)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, stroke: (paint: luma(180), dash: "dashed"))
    line(pA, pG, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.3, 0.7), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A G)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.6, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0, 3.4), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pG, radius: 2pt, fill: black)
    content((1.0, 1.1), text(size: 8.5pt, weight: "bold")[$G$])
  })
]
Tính độ dài của vectơ $6 vec(A G)$ theo đơn vị centimét.],
    [20],
    loigiai: [
        #step([Tính độ dài cạnh huyền BC và trung tuyến AM])
        Tam giác $A B C$ vuông tại $A$:
        $ B C = sqrt(A B^2 + A C^2) = sqrt(6^2 + 8^2) = sqrt(100) = 10" cm" $
        Đường trung tuyến ứng với cạnh huyền:
        $ A M = (B C) / 2 = 10 / 2 = 5" cm" $
        
        #step([Tính độ dài vectơ 6 AG])
        Vì $G$ là trọng tâm nên $A G = 2/3 A M$.
        Độ dài vectơ:
        $ |6 vec(A G)| = 6 dot A G = 6 dot (2/3 A M) = 4 dot A M = 4 dot 5 = 20" cm" $
    ]
)

// TLN 4 (Câu 20)
#tln([Cho hình chữ nhật $A B C D$ có $A B = 8" cm"$ và $B C = 6" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.8)
    let pB = (2.8, 1.8)
    let pC = (2.8, 0)
    let pD = (0, 0)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.5, 1.1), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 1.8), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.0, 1.8), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.0, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ tổng $vec(v) = 2 vec(A B) + 2 vec(A D)$ theo đơn vị centimét.],
    [20],
    loigiai: [
        #step([Thu gọn biểu thức vectơ])
        Đặt thừa số chung:
        $ vec(v) = 2(vec(A B) + vec(A D)) $
        Áp dụng quy tắc hình bình hành cho hình chữ nhật $A B C D$:
        $ vec(A B) + vec(A D) = vec(A C) => vec(v) = 2 vec(A C) $
        
        #step([Tính độ dài đường chéo AC])
        $ A C = sqrt(A B^2 + B C^2) = sqrt(8^2 + 6^2) = sqrt(100) = 10" cm" $
        
        #step([Tính độ dài vectơ v])
        $ |vec(v)| = |2 vec(A C)| = 2 dot A C = 2 dot 10 = 20" cm" $
    ]
)

// TLN 5 (Câu 21 - Thực tế Trạm sạc xe điện thông minh)
#tln([Trên tuyến đường cao tốc nối hai đô thị $A$ và $B$ có chiều dài $A B = 120" km"$, ban quản lý giao thông thông minh quy hoạch một trạm sạc xe điện siêu nhanh tại điểm $S$ nằm giữa hai đô thị. Để cân bằng lưới điện và tối ưu cự ly phục vụ theo mật độ phương tiện, vị trí trạm sạc $S$ được xác định thỏa mãn hệ thức vectơ: $vec(S A) + 3 vec(S B) = vec(0)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pS = (3.75, 0)
    let pB = (5.0, 0)
    
    // Đường cao tốc
    line((-0.5, 0), (5.5, 0), stroke: 2pt + luma(120))
    line((-0.5, 0), (5.5, 0), stroke: (paint: white, dash: "dashed", thickness: 0.8pt))
    
    circle(pA, radius: 3pt, fill: rgb("1e40af"))
    content((0, 0.45), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[🏙️ Đô thị $A$])
    circle(pB, radius: 3pt, fill: rgb("1e40af"))
    content((5.0, 0.45), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[🏙️ Đô thị $B$])
    
    // Trạm sạc S
    circle(pS, radius: 3pt, fill: rgb("0d9488"))
    content((3.75, -0.45), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[⚡ Trạm sạc $S$])
    content((3.75, 0.45), [🚗])
  })
]
Tính khoảng cách từ trạm sạc $S$ đến đô thị $A$ (độ dài đoạn thẳng $S A$) theo đơn vị kilômét.],
    [90],
    loigiai: [
        #step([Chuyển đổi hệ thức vectơ sang tỉ lệ độ dài])
        Từ đẳng thức vectơ:
        $ vec(S A) + 3 vec(S B) = vec(0) <=> vec(S A) = - 3 vec(S B) $
        Lấy độ dài hai vế:
        $ S A = 3 S B <=> S B = 1/3 S A $
        
        #step([Tính khoảng cách SA])
        Vì $S$ nằm trên đoạn thẳng $A B$ nối hai đô thị nên:
        $ A B = S A + S B = S A + 1/3 S A = 4/3 S A = 120" km" $
        Suy ra khoảng cách từ trạm sạc đến đô thị $A$ là:
        $ S A = (120 dot 3) / 4 = 90" km" $
    ]
)

// TLN 6 (Câu 22 - Thực tế Tải trọng liên kết giàn giáo)
#tln([Tại một điểm nút liên kết giàn giáo chịu tải trong xây dựng, ba thanh thép liên kết truyền lực đồng quy tại điểm $O$. Thanh thứ nhất truyền lực $vec(F)_1$ theo phương thẳng đứng hướng xuống dưới với độ lớn $F_1 = 2000" N"$. Thanh chống thứ hai truyền phản lực $vec(F)_3 = - 2 vec(F)_1$ theo phương thẳng đứng hướng lên trên.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    
    // Nút liên kết O
    circle(pO, radius: 3pt, fill: black)
    content((-0.4, 0), [🔩 $O$])
    
    // Lực F1 hướng xuống
    line(pO, (0, -1.8), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((0.7, -1.4), text(fill: rgb("dc2626"), size: 8pt)[$vec(F)_1 (2000" N")$])
    
    // Lực F3 hướng lên gấp đôi
    line(pO, (0, 3.6), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((0.8, 3.2), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(F)_3 = -2 vec(F)_1$])
  })
]
Tính độ lớn của hợp lực $vec(F) = vec(F)_1 + vec(F)_3$ tác dụng dọc theo phương thẳng đứng lên nút liên kết $O$ theo đơn vị Newton.],
    [2000],
    loigiai: [
        #step([Thu gọn biểu thức hợp lực])
        Thay mối liên hệ $vec(F)_3 = - 2 vec(F)_1$ vào biểu thức của hợp lực $vec(F)$:
        $ vec(F) = vec(F)_1 + vec(F)_3 = vec(F)_1 + (- 2 vec(F)_1) = - vec(F)_1 $
        
        #step([Tính độ lớn hợp lực])
        Độ lớn của hợp lực bằng:
        $ F = |vec(F)| = |- vec(F)_1| = |vec(F)_1| = 2000" N" $
        Hợp lực này hướng thẳng đứng lên trên với độ lớn đúng bằng $2000" N"$.
    ]
)

] // end make-questions

#make-questions()
