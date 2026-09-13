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
#let accent = rgb("1e40af") // Classic Blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 4",
  exam-title: "BÀI 8: TỔNG VÀ HIỆU CỦA HAI VECTƠ (ĐỀ SỐ 1)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "104",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Với ba điểm bất kỳ $A, B, C$, khẳng định nào sau đây luôn đúng (quy tắc ba điểm của phép cộng)?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3, 0)
    let pC = (2, 1.8)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((1.5, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(A B)$])
    line(pB, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((2.8, 1.0), text(fill: rgb("0d9488"), size: 8pt)[$vec(B C)$])
    line(pA, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((0.8, 1.1), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2, 2.05), text(size: 8.5pt, weight: "bold")[$C$])
  })
]],
    (
        True([$vec(A B) + vec(B C) = vec(A C)$]),
        [$vec(A B) + vec(A C) = vec(B C)$],
        [$vec(A B) - vec(B C) = vec(C A)$],
        [$vec(B A) + vec(B C) = vec(A C)$]
    ),
    loigiai: [
        Theo quy tắc ba điểm (quy tắc tam giác), với ba điểm tùy ý $A, B, C$ ta luôn có:
        $ vec(A B) + vec(B C) = vec(A C) $
    ]
)

// TN 2
#tn([Cho hình bình hành $A B C D$. Vectơ tổng $vec(A B) + vec(A D)$ bằng vectơ nào sau đây (quy tắc hình bình hành)?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.6, 0)
    let pD = (1.0, 1.5)
    let pC = (3.6, 1.5)
    line(pB, pC, pD, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((1.3, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(A B)$])
    line(pA, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((0.3, 0.9), text(fill: rgb("0d9488"), size: 8pt)[$vec(A D)$])
    line(pA, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((2.2, 0.9), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.8, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.8, 1.5), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0.8, 1.6), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$vec(A C)$]),
        [$vec(C A)$],
        [$vec(B D)$],
        [$vec(D B)$]
    ),
    loigiai: [
        Theo quy tắc hình bình hành, nếu $A B C D$ là hình bình hành thì tổng hai vectơ chung gốc $A$ tương ứng với hai cạnh kề bằng vectơ đường chéo xuất phát từ đỉnh $A$:
        $ vec(A B) + vec(A D) = vec(A C) $
    ]
)

// TN 3
#tn([Với ba điểm phân biệt $A, B, C$, vectơ hiệu $vec(A B) - vec(A C)$ bằng vectơ nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3, 0)
    let pC = (1.5, 1.8)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((1.5, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(A B)$])
    line(pA, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((0.5, 1.0), text(fill: rgb("0d9488"), size: 8pt)[$vec(A C)$])
    line(pC, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((2.5, 1.1), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(C B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((1.5, 2.05), text(size: 8.5pt, weight: "bold")[$C$])
  })
]],
    (
        True([$vec(C B)$]),
        [$vec(B C)$],
        [$vec(C A)$],
        [$vec(A B)$]
    ),
    loigiai: [
        Theo quy tắc trừ hai vectơ chung điểm đầu:
        $ vec(A B) - vec(A C) = vec(C B) $
    ]
)

// TN 4
#tn([Cho đoạn thẳng $A B$ có trung điểm là $I$. Khẳng định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pI = (2, 0)
    let pB = (4, 0)
    line(pA, pB, stroke: 0.8pt + luma(180))
    line(pI, (0.2, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    content((1.0, 0.35), text(fill: rgb("dc2626"), size: 8pt)[$vec(I A)$])
    line(pI, (3.8, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.6pt + rgb("0d9488"))
    content((3.0, 0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(I B)$])
    circle(pA, radius: 2pt, fill: black)
    content((pA.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pI, radius: 2pt, fill: black)
    content((pI.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$I$])
    circle(pB, radius: 2pt, fill: black)
    content((pB.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$B$])
  })
]],
    (
        True([$vec(I A) + vec(I B) = vec(0)$]),
        [$vec(I A) + vec(I B) = vec(A B)$],
        [$vec(I A) - vec(I B) = vec(0)$],
        [$vec(A I) + vec(B I) = vec(A B)$]
    ),
    loigiai: [
        Vì $I$ là trung điểm của $A B$ nên hai vectơ $vec(I A)$ và $vec(I B)$ là hai vectơ đối nhau, do đó:
        $ vec(I A) + vec(I B) = vec(0) $
    ]
)

// TN 5
#tn([Cho hình chữ nhật $A B C D$. Độ dài của vectơ tổng $vec(A B) + vec(A D)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.8)
    let pB = (3, 1.8)
    let pC = (3, 0)
    let pD = (0, 0)
    line(pB, pC, pD, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.8, 1.1), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.25, 1.8), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.25, 1.8), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.25, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.25, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([Độ dài đoạn thẳng $A C$]),
        [Độ dài đoạn thẳng $A B + A D$],
        [Nửa độ dài đoạn thẳng $A C$],
        [$0$]
    ),
    loigiai: [
        Theo quy tắc hình bình hành, với hình chữ nhật $A B C D$ ta có:
        $ vec(A B) + vec(A D) = vec(A C) => |vec(A B) + vec(A D)| = |vec(A C)| = A C $
    ]
)

// TN 6
#tn([Cho tam giác đều $A B C$ có cạnh bằng $a$. Độ dài của vectơ $vec(A B) + vec(B C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.3)
    let pB = (0, 0)
    let pC = (3, 0)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pB, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((2.5, 1.2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    content((1.5, -0.25), text(size: 8pt)[$a$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.55), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
  })
]],
    (
        True([$a$]),
        [$2a$],
        [$a sqrt(3)$],
        [$(a sqrt(3)) / 2$]
    ),
    loigiai: [
        Áp dụng quy tắc ba điểm: $vec(A B) + vec(B C) = vec(A C)$.
        Vì tam giác $A B C$ đều cạnh $a$ nên $|vec(A C)| = A C = a$.
    ]
)

// TN 7
#tn([Cho bốn điểm bất kỳ $A, B, C, D$. Biểu thức vectơ $vec(A B) + vec(B C) + vec(C D)$ được rút gọn thành],
    (
        True([$vec(A D)$]),
        [$vec(D A)$],
        [$vec(A C)$],
        [$vec(0)$]
    ),
    loigiai: [
        Áp dụng liên tiếp quy tắc ba điểm:
        $ (vec(A B) + vec(B C)) + vec(C D) = vec(A C) + vec(C D) = vec(A D) $
    ]
)

// TN 8
#tn([Hiệu của hai vectơ $vec(a) - vec(b)$ được định nghĩa là tổng của vectơ $vec(a)$ với],
    (
        True([Vectơ đối của vectơ $vec(b)$]),
        [Vectơ $vec(b)$],
        [Vectơ đối của vectơ $vec(a)$],
        [Vectơ-không]
    ),
    loigiai: [
        Theo định nghĩa hiệu của hai vectơ, phép trừ được chuyển thành phép cộng với vectơ đối:
        $ vec(a) - vec(b) = vec(a) + (- vec(b)) $
    ]
)

// TN 9
#tn([Cho tam giác $A B C$ vuông cân tại $A$ có $A B = A C = 3" cm"$. Độ dài của vectơ hiệu $vec(A B) - vec(A C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.2, 0)
    let pC = (0, 2.2)
    line((0.3, 0), (0.3, 0.3), (0, 0.3), stroke: 0.7pt + black)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((1.1, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(A B)$])
    line(pA, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((-0.4, 1.1), text(fill: rgb("0d9488"), size: 8pt)[$vec(A C)$])
    line(pC, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.4, 1.4), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(C B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.4, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0, 2.4), text(size: 8.5pt, weight: "bold")[$C$])
  })
]],
    (
        True([$3 sqrt(2)" cm"$]),
        [$3" cm"$],
        [$6" cm"$],
        [$0" cm"$]
    ),
    loigiai: [
        Ta có $vec(A B) - vec(A C) = vec(C B)$.
        Áp dụng định lý Pytago trong tam giác vuông cân $A B C$:
        $ |vec(C B)| = C B = sqrt(A B^2 + A C^2) = sqrt(3^2 + 3^2) = 3 sqrt(2)" cm" $
    ]
)

// TN 10
#tn([Hai lực $vec(F)_1$ và $vec(F)_2$ cùng tác dụng vào một vật có độ lớn lần lượt là $30" N"$ và $40" N"$, giá của hai lực vuông góc với nhau. Độ lớn của hợp lực $vec(F) = vec(F)_1 + vec(F)_2$ bằng],
    (
        True([$50" N"$]),
        [$70" N"$],
        [$10" N"$],
        [$1200" N"$]
    ),
    loigiai: [
        Vì hai lực vuông góc nhau nên tứ giác tạo bởi hai vectơ lực là hình chữ nhật.
        Độ lớn hợp lực là:
        $ F = sqrt(F_1^2 + F_2^2) = sqrt(30^2 + 40^2) = sqrt(900 + 1600) = sqrt(2500) = 50" N" $
    ]
)

// TN 11
#tn([Cho hình thoi $A B C D$ tâm $O$. Vectơ hiệu $vec(O B) - vec(O C)$ bằng vectơ nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pA = (-1.8, 0)
    let pC = (1.8, 0)
    let pB = (0, 1.2)
    let pD = (0, -1.2)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pO, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((-0.35, 0.6), text(fill: rgb("0d9488"), size: 8pt)[$vec(O B)$])
    line(pO, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((0.9, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(O C)$])
    line(pC, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.1, 0.8), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(C B)$])
    circle(pO, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt, weight: "bold")[$O$])
    circle(pA, radius: 2pt, fill: black)
    content((-2.0, 0), text(size: 8pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((0, 1.4), text(size: 8pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.0, 0), text(size: 8pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0, -1.4), text(size: 8pt, weight: "bold")[$D$])
  })
]],
    (
        True([$vec(C B)$]),
        [$vec(B C)$],
        [$vec(C D)$],
        [$vec(B A)$]
    ),
    loigiai: [
        Theo quy tắc trừ hai vectơ chung gốc:
        $ vec(O B) - vec(O C) = vec(C B) $
    ]
)

// TN 12
#tn([Với hai vectơ tùy ý $vec(a)$ và $vec(b)$, khẳng định nào sau đây là SAI?],
    (
        True([$|vec(a) + vec(b)| = |vec(a)| + |vec(b)|$ với mọi vectơ $vec(a), vec(b)$]),
        [$vec(a) + vec(0) = vec(a)$]),
        [$vec(a) - vec(a) = vec(0)$]),
        [$vec(a) + vec(b) = vec(b) + vec(a)$]
    ),
    loigiai: [
        Đẳng thức $|vec(a) + vec(b)| = |vec(a)| + |vec(b)|$ chỉ đúng khi hai vectơ $vec(a)$ và $vec(b)$ cùng hướng. Với hai vectơ bất kỳ, ta có bất đẳng thức tam giác $|vec(a) + vec(b)| <= |vec(a)| + |vec(b)|$. Do đó khẳng định A là SAI.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Hình vuông ABCD cạnh a tâm O)
#ds([Cho hình vuông $A B C D$ tâm $O$ có cạnh bằng $a$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 3)
    let pB = (3, 3)
    let pC = (3, 0)
    let pD = (0, 0)
    let pO = (1.5, 1.5)
    
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("1e40af"))
    line(pA, pC, stroke: (paint: luma(140), dash: "dashed"))
    line(pB, pD, stroke: (paint: luma(140), dash: "dashed"))
    
    // Vectơ AB, AD và AC
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.6pt + rgb("0d9488"))
    line(pA, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.6pt + rgb("0d9488"))
    line(pA, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    
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
    True([$vec(A B) + vec(A D) = vec(A C)$.]),
    True([Độ dài của vectơ hiệu $|vec(A B) - vec(A D)| = a sqrt(2)$.]),
    True([$vec(O A) + vec(O C) = vec(0)$.]),
    [Độ dài của vectơ tổng $|vec(A B) + vec(A C)| = 2a$.]
  ),
  loigiai: [
    #step([Xét quy tắc hình bình hành])
    $A B C D$ là hình vuông nên cũng là hình bình hành. Theo quy tắc hình bình hành:
    $ vec(A B) + vec(A D) = vec(A C) $
    Mệnh đề a ĐÚNG.

    #step([Tính độ dài vectơ hiệu AB - AD])
    Theo quy tắc trừ: $vec(A B) - vec(A D) = vec(D B)$.
    Độ dài đường chéo hình vuông cạnh $a$ là $D B = a sqrt(2)$. Do đó $|vec(A B) - vec(A D)| = a sqrt(2)$. Mệnh đề b ĐÚNG.

    #step([Xét tính chất tâm đối xứng O])
    $O$ là trung điểm của đường chéo $A C$, nên hai vectơ $vec(O A)$ và $vec(O C)$ là hai vectơ đối nhau, suy ra $vec(O A) + vec(O C) = vec(0)$. Mệnh đề c ĐÚNG.

    #step([Tính độ dài vectơ AB + AC])
    Dựng điểm $E$ sao cho tứ giác $A B E C$ là hình bình hành, khi đó $vec(A B) + vec(A C) = vec(A E)$.
    Vì tam giác $A B C$ vuông cân tại $B$ nên:
    $ A E^2 = A B^2 + B E^2 = A B^2 + A C^2 = a^2 + (a sqrt(2))^2 = a^2 + 2a^2 = 3a^2 $
    (Hoặc tính theo quy tắc trung điểm cạnh $B C$: $|vec(A B) + vec(A C)| = 2 A M = 2 sqrt(a^2 + (a/2)^2) = 2 dot (a sqrt(5))/2 = a sqrt(5) != 2a$).
    Do đó $|vec(A B) + vec(A C)| = a sqrt(5) != 2a$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Tam giác đều và trung điểm M)
#ds([Cho tam giác đều $A B C$ có cạnh bằng $a$. Gọi $M$ là trung điểm của cạnh $B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (2, 3.464)
    let pB = (0, 0)
    let pC = (4, 0)
    let pM = (2, 0)
    
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    line(pA, pM, stroke: (paint: rgb("0d9488"), dash: "dashed", thickness: 1.2pt))
    
    // Mũi tên AB và AC
    line(pA, pB, mark: (end: ">", fill: rgb("d97706")), stroke: 1.6pt + rgb("d97706"))
    line(pA, pC, mark: (end: ">", fill: rgb("d97706")), stroke: 1.6pt + rgb("d97706"))
    
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0), pA.at(1) + 0.25), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) - 0.25, pB.at(1) - 0.2), text(weight: "bold")[$B$])
    circle(pC, radius: 2.5pt, fill: black)
    content((pC.at(0) + 0.25, pC.at(1) - 0.2), text(weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((pM.at(0), pM.at(1) - 0.25), text(weight: "bold")[$M$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([$vec(A B) + vec(A C) = 2 vec(A M)$.]),
    True([Độ dài của vectơ hiệu $|vec(A B) - vec(A C)| = a$.]),
    True([Độ dài của vectơ tổng $|vec(A B) + vec(A C)| = a sqrt(3)$.]),
    [Hai vectơ $vec(M B)$ và $vec(M C)$ thỏa mãn $vec(M B) + vec(M C) = vec(B C)$.]
  ),
  loigiai: [
    #step([Tính chất trung điểm đối với vectơ tổng])
    Vì $M$ là trung điểm của đoạn thẳng $B C$, lấy điểm đối xứng của $A$ qua $M$ ta được hình thoi $A B A' C$, do đó:
    $ vec(A B) + vec(A C) = vec(A A') = 2 vec(A M) $
    Mệnh đề a ĐÚNG.

    #step([Tính độ dài vectơ hiệu AB - AC])
    Ta có $vec(A B) - vec(A C) = vec(C B)$.
    Vì tam giác $A B C$ đều cạnh $a$ nên $|vec(C B)| = C B = a$. Mệnh đề b ĐÚNG.

    #step([Tính độ dài vectơ tổng AB + AC])
    Từ $vec(A B) + vec(A C) = 2 vec(A M)$, ta có:
    $ |vec(A B) + vec(A C)| = 2 A M $
    Trong tam giác đều cạnh $a$, độ dài đường cao $A M$ là $A M = (a sqrt(3)) / 2$.
    Suy ra:
    $ |vec(A B) + vec(A C)| = 2 dot (a sqrt(3)) / 2 = a sqrt(3) $
    Mệnh đề c ĐÚNG.

    #step([Xét tổng MB + MC])
    Vì $M$ là trung điểm của $B C$ nên hai vectơ $vec(M B)$ và $vec(M C)$ là hai vectơ đối nhau, suy ra:
    $ vec(M B) + vec(M C) = vec(0) != vec(B C) $
    Do đó mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Robot tự hành)
#ds([Một robot tự hành xuất phát từ trạm điều khiển $O$, đi thẳng về phía Đông một quãng đường $40" m"$ đến vị trí $A$ (vectơ độ dịch chuyển thứ nhất là $vec(d)_1 = vec(O A)$), sau đó rẽ vuông góc đi thẳng về phía Bắc một quãng đường $30" m"$ đến vị trí trạm cảm biến $B$ (vectơ độ dịch chuyển thứ hai là $vec(d)_2 = vec(A B)$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pA = (4, 0)
    let pB = (4, 3)
    
    // Trục hướng la bàn
    line((-0.5, 0), (5.0, 0), stroke: 0.5pt + luma(180))
    line((0, -0.5), (0, 3.8), stroke: 0.5pt + luma(180))
    content((4.8, -0.3), [🧭 Đông])
    content((-0.3, 3.6), [Bắc])
    
    // Vectơ d1 và d2
    line(pO, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((2, -0.35), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(d)_1 (40" m")$])
    
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((4.8, 1.5), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(d)_2 (30" m")$])
    
    // Vectơ tổng hợp OB
    line(pO, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.8, 2.0), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(d) = vec(d)_1 + vec(d)_2$])
    
    // Góc vuông tại A
    line((3.6, 0), (3.6, 0.4), (4, 0.4), stroke: 0.8pt + black)
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.3, -0.3), [🤖 $O$])
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0), -0.3), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: rgb("dc2626"))
    content((pB.at(0) + 0.3, pB.at(1) + 0.3), text(fill: rgb("dc2626"), weight: "bold")[$B$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ độ dịch chuyển tổng hợp của robot từ điểm xuất phát $O$ đến đích $B$ là $vec(d) = vec(d)_1 + vec(d)_2 = vec(O B)$.]),
    True([Hai vectơ độ dịch chuyển thành phần $vec(d)_1$ và $vec(d)_2$ có giá vuông góc với nhau.]),
    True([Độ lớn của vectơ độ dịch chuyển tổng hợp là $|vec(d)| = 50" m"$.]),
    [Tổng quãng đường mà robot đã di chuyển bằng đúng độ lớn của vectơ độ dịch chuyển tổng hợp.]
  ),
  loigiai: [
    #step([Biểu diễn vectơ độ dịch chuyển tổng hợp])
    Theo quy tắc ba điểm của phép cộng vectơ:
    $ vec(d) = vec(d)_1 + vec(d)_2 = vec(O A) + vec(A B) = vec(O B) $
    Mệnh đề a ĐÚNG.

    #step([Phương của hai độ dịch chuyển])
    Hướng Đông vuông góc với hướng Bắc, nên hai vectơ $vec(d)_1$ và $vec(d)_2$ có giá vuông góc nhau. Mệnh đề b ĐÚNG.

    #step([Tính độ lớn độ dịch chuyển tổng hợp])
    Áp dụng định lý Pytago trong tam giác vuông $O A B$:
    $ |vec(d)| = O B = sqrt(O A^2 + A B^2) = sqrt(40^2 + 30^2) = sqrt(1600 + 900) = 50" m" $
    Mệnh đề c ĐÚNG.

    #step([Phân biệt quãng đường và độ dịch chuyển])
    Tổng quãng đường robot đi là:
    $ s = O A + A B = 40 + 30 = 70" m" $
    Trong khi đó độ lớn vectơ độ dịch chuyển là $50" m"$. Hai đại lượng này khác nhau ($70" m" != 50" m"$). Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Hai tàu kéo xà lan)
#ds([Một chiếc sà lan chở hàng tại điểm $O$ được hai chiếc tàu kéo cùng tác dụng hai lực kéo $vec(F)_1$ và $vec(F)_2$ theo hai hướng vuông góc nhau. Lực kéo của tàu thứ nhất có độ lớn $F_1 = 3000" N"$, lực kéo của tàu thứ hai có độ lớn $F_2 = 4000" N"$.
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
    content((1.5, -0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_1 (3000" N")$])
    
    // Vectơ lực F2
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.0, 2), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_2 (4000" N")$])
    
    // Vectơ hợp lực F
    line(pO, pF, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.8, 2.3), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F) = vec(F)_1 + vec(F)_2$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, -0.4), [⚓ $O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hợp lực kéo $vec(F) = vec(F)_1 + vec(F)_2$ tác dụng lên sà lan được xác định theo quy tắc hình bình hành.]),
    True([Tứ giác tạo bởi hai vectơ lực thành phần và các đường dóng là một hình chữ nhật.]),
    True([Độ lớn của hợp lực kéo tác dụng lên sà lan là $5000" N"$.]),
    [Nếu tăng độ lớn của lực kéo $F_1$ lên gấp đôi ($6000" N"$) và giữ nguyên $F_2 = 4000" N"$ thì độ lớn của hợp lực kéo tăng lên đúng gấp đôi.]
  ),
  loigiai: [
    #step([Quy tắc tổng hợp lực])
    Theo quy tắc hình bình hành trong cơ học, hợp lực của hai lực đồng quy $vec(F)_1$ và $vec(F)_2$ là vectơ đường chéo $vec(F) = vec(F)_1 + vec(F)_2$. Mệnh đề a ĐÚNG.

    #step([Dạng hình học của tứ giác lực])
    Vì hai lực kéo có giá vuông góc nhau nên hình bình hành có một góc vuông, do đó nó là hình chữ nhật. Mệnh đề b ĐÚNG.

    #step([Tính độ lớn hợp lực ban đầu])
    Độ lớn của hợp lực là đường chéo hình chữ nhật:
    $ F = sqrt(F_1^2 + F_2^2) = sqrt(3000^2 + 4000^2) = sqrt(9000000 + 16000000) = 5000" N" $
    Mệnh đề c ĐÚNG.

    #step([Tính độ lớn hợp lực khi F1 tăng gấp đôi])
    Khi $F_1' = 2 F_1 = 6000" N"$, độ lớn hợp lực mới là:
    $ F' = sqrt(6000^2 + 4000^2) = sqrt(36000000 + 16000000) = sqrt(52000000) = 2000 sqrt(13) approx 7211" N" $
    Giá trị $7211" N"$ khác $2 dot 5000 = 10000" N"$ (không tăng gấp đôi). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho hình vuông $A B C D$ có độ dài cạnh bằng $8" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 2)
    let pB = (2, 2)
    let pC = (2, 0)
    let pD = (0, 0)
    line(pB, pC, pD, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.2, 1.2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.25, 2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.25, 2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.25, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.25, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ tổng $vec(A B) + vec(A D)$ theo đơn vị centimét (làm tròn kết quả đến chữ số thập phân thứ nhất).
(Cho biết $sqrt(2) approx 1.414$)],
    [11.3],
    loigiai: [
        #step([Quy tắc hình bình hành cho hình vuông])
        Vì $A B C D$ là hình vuông nên theo quy tắc hình bình hành:
        $ vec(A B) + vec(A D) = vec(A C) $
        
        #step([Tính độ dài đường chéo AC])
        Độ dài đường chéo hình vuông cạnh $a = 8" cm"$ là:
        $ A C = a sqrt(2) = 8 sqrt(2) approx 8 dot 1.4142 = 11.3136" cm" $
        Làm tròn đến chữ số thập phân thứ nhất ta được $11.3" cm"$.
    ]
)

// TLN 2 (Câu 18)
#tln([Cho tam giác đều $A B C$ có cạnh bằng $10" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.2, 1.9)
    let pB = (0, 0)
    let pC = (2.4, 0)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pC, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.2, -0.3), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(C B)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.2, 2.15), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.6, 0), text(size: 8.5pt, weight: "bold")[$C$])
  })
]
Tính độ dài của vectơ hiệu $vec(A B) - vec(A C)$ theo đơn vị centimét.],
    [10],
    loigiai: [
        #step([Quy tắc trừ hai vectơ chung gốc])
        Áp dụng quy tắc trừ:
        $ vec(A B) - vec(A C) = vec(C B) $
        
        #step([Tính độ dài vectơ])
        Vì tam giác $A B C$ đều cạnh $10" cm"$ nên $C B = 10" cm"$.
        Do đó $|vec(A B) - vec(A C)| = |vec(C B)| = 10" cm"$.
    ]
)

// TLN 3 (Câu 19)
#tln([Cho hình chữ nhật $A B C D$ có $A B = 6" cm"$ và $B C = 8" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 2.2)
    let pB = (2.2, 2.2)
    let pC = (2.2, 0)
    let pD = (0, 0)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pD, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.3, 1.3), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(D B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.25, 2.2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.45, 2.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.45, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.25, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ hiệu $vec(A B) - vec(A D)$ theo đơn vị centimét.],
    [10],
    loigiai: [
        #step([Rút gọn vectơ hiệu])
        Theo quy tắc trừ hai vectơ chung điểm đầu:
        $ vec(A B) - vec(A D) = vec(D B) $
        
        #step([Tính độ dài đường chéo DB])
        Tam giác $D A B$ vuông tại $A$ có $A B = 6" cm"$ và $A D = B C = 8" cm"$:
        $ D B = sqrt(A B^2 + A D^2) = sqrt(6^2 + 8^2) = sqrt(36 + 64) = sqrt(100) = 10" cm" $
        Vậy độ dài vectơ là $|vec(A B) - vec(A D)| = 10" cm"$.
    ]
)

// TLN 4 (Câu 20)
#tln([Cho tam giác đều $A B C$ có cạnh bằng $6" cm"$. Gọi $M$ là trung điểm của cạnh $B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.2)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (1.5, 0)
    line(pA, pB, pC, close: true, stroke: 1pt + rgb("1e40af"))
    line(pA, pM, mark: (end: ">", fill: rgb("dc2626")), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 1.6pt))
    content((1.9, 1.1), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A M)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.45), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((1.5, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
  })
]
Tính độ dài của vectơ tổng $vec(A B) + vec(A C)$ theo đơn vị centimét (làm tròn kết quả đến chữ số thập phân thứ nhất).
(Cho biết $sqrt(3) approx 1.732$)],
    [10.4],
    loigiai: [
        #step([Áp dụng tính chất trung điểm])
        Vì $M$ là trung điểm của $B C$ nên:
        $ vec(A B) + vec(A C) = 2 vec(A M) => |vec(A B) + vec(A C)| = 2 A M $
        
        #step([Tính độ dài đường cao AM])
        Trong tam giác đều cạnh $a = 6" cm"$, đường cao $A M$ là:
        $ A M = (a sqrt(3)) / 2 = (6 sqrt(3)) / 2 = 3 sqrt(3)" cm" $
        
        #step([Tính độ dài vectơ tổng])
        $ |vec(A B) + vec(A C)| = 2 dot 3 sqrt(3) = 6 sqrt(3) approx 6 dot 1.73205 = 10.392" cm" $
        Làm tròn đến chữ số thập phân thứ nhất ta được $10.4" cm"$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Hợp lực vuông góc)
#tln([Một kiện hàng đặt trên sàn phẳng chịu tác dụng đồng thời của hai lực kéo nằm ngang: lực kéo $vec(F)_1$ hướng sang phía Đông có độ lớn $60" N"$ và lực kéo $vec(F)_2$ hướng sang phía Bắc có độ lớn $80" N"$.
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
    
    // Vectơ F1 và F2
    line(pO, p1, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.5, -0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_1 (60" N")$])
    
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.0, 2), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_2 (80" N")$])
    
    // Vectơ hợp lực F
    line(pO, pF, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.8, 2.3), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F)$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, -0.4), [📦 $O$])
  })
]
Tính độ lớn của hợp lực kéo $vec(F) = vec(F)_1 + vec(F)_2$ tác dụng lên kiện hàng theo đơn vị Newton.],
    [100],
    loigiai: [
        #step([Xác định góc giữa hai lực])
        Hướng Đông vuông góc với hướng Bắc, nên hai lực $vec(F)_1 perp vec(F)_2$.
        
        #step([Tính độ lớn hợp lực])
        Áp dụng định lý Pytago cho hai vectơ lực vuông góc:
        $ F = sqrt(F_1^2 + F_2^2) = sqrt(60^2 + 80^2) = sqrt(3600 + 6400) = sqrt(10000) = 100" N" $
    ]
)

// TLN 6 (Câu 22 - Vận dụng cao Thực tế Hai lực tạo góc 60 độ)
#tln([Hai lực $vec(F)_1$ và $vec(F)_2$ cùng tác dụng vào một chất điểm tại điểm $O$, tạo với nhau một góc $60^circ$. Biết độ lớn của hai lực là $F_1 = F_2 = 50" N"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let F = 3.0
    let a1 = -30deg
    let a2 = 30deg
    let p1 = (F * calc.cos(a1), F * calc.sin(a1))
    let p2 = (F * calc.cos(a2), F * calc.sin(a2))
    let pF = (p1.at(0) + p2.at(0), 0)
    
    // Hình thoi hợp lực
    line(p1, pF, stroke: (paint: luma(140), dash: "dashed"))
    line(p2, pF, stroke: (paint: luma(140), dash: "dashed"))
    
    // Cung góc 60 độ
    draw_angle_arc(pO, -30deg, 30deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.2, 0), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
    
    // Vectơ F1 và F2
    line(pO, p1, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((p1.at(0) + 0.6, p1.at(1)), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_1 (50" N")$])
    
    line(pO, p2, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((p2.at(0) + 0.6, p2.at(1)), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_2 (50" N")$])
    
    // Vectơ hợp lực F
    line(pO, pF, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((pF.at(0) + 0.6, 0), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F)$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, 0), [🎯 $O$])
  })
]
Tính độ lớn của hợp lực $vec(F) = vec(F)_1 + vec(F)_2$ theo đơn vị Newton (làm tròn kết quả đến chữ số thập phân thứ nhất).
(Cho biết $sqrt(3) approx 1.732$)],
    [86.6],
    loigiai: [
        #step([Quy tắc hình thoi cho hai lực bằng nhau])
        Vì $F_1 = F_2 = 50" N"$ nên hình bình hành hợp lực là hình thoi. Vectơ hợp lực $vec(F)$ nằm trên đường phân giác của góc $60^circ$.
        
        #step([Tính độ lớn hợp lực])
        Công thức tính độ lớn hợp lực của hai lực bằng nhau tạo góc $alpha = 60^circ$:
        $ F = 2 dot F_1 dot cos(alpha / 2) = 2 dot 50 dot cos 30^circ = 100 dot (sqrt(3) / 2) = 50 sqrt(3)" N" $
        Thay số: $F approx 50 dot 1.73205 = 86.6025" N"$.
        Làm tròn đến chữ số thập phân thứ nhất ta được $86.6" N"$.
    ]
)

] // end make-questions

#make-questions()
