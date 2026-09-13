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
#let accent = rgb("d97706") // Amber

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 4",
  exam-title: "BÀI 8: TỔNG VÀ HIỆU CỦA HAI VECTƠ (ĐỀ SỐ 3)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "106",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho tam giác $A B C$. Điểm $M$ thỏa mãn hệ thức vectơ $vec(M A) + vec(M B) + vec(M C) = vec(0)$ thì $M$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.2)
    let pB = (0, 0)
    let pC = (3.2, 0)
    let pM = ((pA.at(0)+pB.at(0)+pC.at(0))/3, (pA.at(1)+pB.at(1)+pC.at(1))/3)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pM, pA, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.5pt + rgb("dc2626"))
    content((pM.at(0) - 0.25, 1.5), text(fill: rgb("dc2626"), size: 8pt)[$vec(M A)$])
    line(pM, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((0.5, 0.5), text(fill: rgb("0d9488"), size: 8pt)[$vec(M B)$])
    line(pM, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((2.5, 0.5), text(fill: rgb("0d9488"), size: 8pt)[$vec(M C)$])
    circle(pA, radius: 2pt, fill: black)
    content((pA.at(0), 2.45), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.4, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2.5pt, fill: rgb("dc2626"))
    content((pM.at(0) + 0.3, pM.at(1) - 0.2), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$M$])
  })
]],
    (
        True([Trọng tâm của tam giác $A B C$]),
        [Trực tâm của tam giác $A B C$],
        [Tâm đường tròn ngoại tiếp tam giác $A B C$],
        [Tâm đường tròn nội tiếp tam giác $A B C$]
    ),
    loigiai: [
        Hệ thức $vec(M A) + vec(M B) + vec(M C) = vec(0)$ là điều kiện cần và đủ để điểm $M$ trùng với trọng tâm $G$ của tam giác $A B C$.
    ]
)

// TN 2
#tn([Cho đoạn thẳng $A B$. Điểm $M$ thỏa mãn hệ thức nào sau đây thì $M$ là trung điểm của đoạn thẳng $A B$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pM = (1.8, 0)
    let pB = (3.6, 0)
    line(pA, pB, stroke: 0.8pt + luma(180))
    line(pM, (0.2, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    content((0.9, 0.35), text(fill: rgb("dc2626"), size: 8pt)[$vec(M A)$])
    line(pM, (3.4, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.6pt + rgb("0d9488"))
    content((2.7, 0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(M B)$])
    circle(pA, radius: 2pt, fill: black)
    content((pA.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pM, radius: 2pt, fill: black)
    content((pM.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$M$])
    circle(pB, radius: 2pt, fill: black)
    content((pB.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$B$])
  })
]],
    (
        True([$vec(M A) + vec(M B) = vec(0)$]),
        [$vec(M A) - vec(M B) = vec(0)$],
        [$vec(A M) + vec(M B) = vec(0)$],
        [$vec(M A) = vec(M B)$]
    ),
    loigiai: [
        $M$ là trung điểm của đoạn thẳng $A B$ khi và chỉ khi hai vectơ $vec(M A)$ và $vec(M B)$ đối nhau, tức là $vec(M A) + vec(M B) = vec(0)$.
    ]
)

// TN 3
#tn([Cho tam giác $A B C$. Tổng ba vectơ $vec(A B) + vec(B C) + vec(C A)$ bằng vectơ nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2)
    let pB = (0, 0)
    let pC = (3, 0)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((0.5, 1.1), text(fill: rgb("0d9488"), size: 8pt)[$vec(A B)$])
    line(pB, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((1.5, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(B C)$])
    line(pC, pA, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.5pt + rgb("dc2626"))
    content((2.5, 1.1), text(fill: rgb("dc2626"), size: 8pt)[$vec(C A)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.25), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
  })
]],
    (
        True([$vec(0)$]),
        [$vec(A C)$],
        [$vec(C B)$],
        [$2 vec(A B)$]
    ),
    loigiai: [
        Áp dụng quy tắc ba điểm liên tiếp:
        $ (vec(A B) + vec(B C)) + vec(C A) = vec(A C) + vec(C A) = vec(A A) = vec(0) $
    ]
)

// TN 4
#tn([Cho hình chữ nhật $A B C D$ có tâm $O$. Tổng bốn vectơ $vec(O A) + vec(O B) + vec(O C) + vec(O D)$ bằng
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
    line(pO, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.4pt + rgb("0d9488"))
    line(pO, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.4pt + rgb("0d9488"))
    line(pO, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.4pt + rgb("dc2626"))
    line(pO, pD, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.4pt + rgb("dc2626"))
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
]],
    (
        True([$vec(0)$]),
        [$vec(A C)$],
        [$vec(B D)$],
        [$2 vec(A B)$]
    ),
    loigiai: [
        Vì $O$ là trung điểm của hai đường chéo $A C$ và $B D$ nên $vec(O A) + vec(O C) = vec(0)$ và $vec(O B) + vec(O D) = vec(0)$.
        Do đó tổng bốn vectơ bằng:
        $ (vec(O A) + vec(O C)) + (vec(O B) + vec(O D)) = vec(0) + vec(0) = vec(0) $
    ]
)

// TN 5
#tn([Với hai vectơ tùy ý $vec(a)$ và $vec(b)$, bất đẳng thức nào sau đây luôn đúng?],
    (
        True([$|vec(a) + vec(b)| <= |vec(a)| + |vec(b)|$]),
        [$|vec(a) + vec(b)| >= |vec(a)| + |vec(b)|$],
        [$|vec(a) + vec(b)| = |vec(a)| + |vec(b)|$],
        [$|vec(a) - vec(b)| > |vec(a)| + |vec(b)|$]
    ),
    loigiai: [
        Theo bất đẳng thức tam giác mở rộng cho vectơ, với mọi vectơ $vec(a)$ và $vec(b)$ ta luôn có:
        $ |vec(a) + vec(b)| <= |vec(a)| + |vec(b)| $
    ]
)

// TN 6
#tn([Dấu đẳng thức trong bất đẳng thức $|vec(a) + vec(b)| = |vec(a)| + |vec(b)|$ (với $vec(a), vec(b) != vec(0)$) xảy ra khi và chỉ khi],
    (
        True([Hai vectơ $vec(a)$ và $vec(b)$ cùng hướng]),
        [Hai vectơ $vec(a)$ và $vec(b)$ ngược hướng],
        [Hai vectơ $vec(a)$ và $vec(b)$ vuông góc nhau],
        [Hai vectơ $vec(a)$ và $vec(b)$ có cùng độ dài]
    ),
    loigiai: [
        Đẳng thức $|vec(a) + vec(b)| = |vec(a)| + |vec(b)|$ xảy ra khi và chỉ khi hai vectơ $vec(a)$ và $vec(b)$ cùng phương và cùng hướng (chúng nằm trên cùng một tia).
    ]
)

// TN 7
#tn([Cho tam giác $A B C$ vuông tại $A$ có $A B = 5" cm"$ và $A C = 12" cm"$. Độ dài của vectơ $vec(B A) + vec(A C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.4, 0)
    let pC = (0, 2.0)
    line((0.3, 0), (0.3, 0.3), (0, 0.3), stroke: 0.7pt + black)
    line(pB, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((1.2, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(B A)$])
    line(pA, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((-0.4, 1.0), text(fill: rgb("0d9488"), size: 8pt)[$vec(A C)$])
    line(pB, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.4, 1.2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(B C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.6, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0, 2.2), text(size: 8.5pt, weight: "bold")[$C$])
  })
]],
    (
        True([$13" cm"$]),
        [$17" cm"$],
        [$7" cm"$],
        [$10" cm"$]
    ),
    loigiai: [
        Theo quy tắc ba điểm: $vec(B A) + vec(A C) = vec(B C)$.
        Áp dụng định lý Pytago trong tam giác vuông $A B C$:
        $ |vec(B C)| = B C = sqrt(A B^2 + A C^2) = sqrt(5^2 + 12^2) = sqrt(25 + 144) = sqrt(169) = 13" cm" $
    ]
)

// TN 8
#tn([Cho hình vuông $A B C D$ có cạnh bằng $a$. Độ dài của vectơ tổng $vec(A B) + vec(B C) + vec(C D)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 2)
    let pB = (2, 2)
    let pC = (2, 0)
    let pD = (0, 0)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.4pt + rgb("0d9488"))
    content((1, 2.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(A B)$])
    line(pB, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.4pt + rgb("0d9488"))
    content((2.35, 1), text(fill: rgb("0d9488"), size: 8pt)[$vec(B C)$])
    line(pC, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.4pt + rgb("0d9488"))
    content((1, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(C D)$])
    line(pA, pD, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((-0.4, 1), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A D)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.2, 2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$a$]),
        [$2a$],
        [$3a$],
        [$a sqrt(2)$]
    ),
    loigiai: [
        Áp dụng quy tắc cộng liên tiếp:
        $ vec(A B) + vec(B C) + vec(C D) = vec(A C) + vec(C D) = vec(A D) $
        Độ dài vectơ là $|vec(A D)| = A D = a$.
    ]
)

// TN 9
#tn([Ba lực đồng phẳng $vec(F)_1, vec(F)_2, vec(F)_3$ cùng tác dụng vào một chất điểm làm cho chất điểm đó đứng yên cân bằng. Khẳng định nào sau đây là đúng?],
    (
        True([$vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0)$]),
        [$vec(F)_1 + vec(F)_2 = vec(F)_3$],
        [$F_1 + F_2 + F_3 = 0$],
        [$|vec(F)_1| + |vec(F)_2| = |vec(F)_3|$]
    ),
    loigiai: [
        Điều kiện cân bằng tĩnh học của một chất điểm chịu tác dụng của nhiều lực là tổng hợp lực của tất cả các lực tác dụng lên chất điểm phải bằng vectơ-không:
        $ vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0) $
    ]
)

// TN 10
#tn([Cho hình bình hành $A B C D$ tâm $O$. Khẳng định nào sau đây là SAI?],
    (
        True([$vec(A B) + vec(B C) + vec(C D) + vec(D A) = vec(A C)$]),
        [$vec(A B) + vec(A D) = vec(A C)$],
        [$vec(B A) + vec(B C) = vec(B D)$],
        [$vec(O A) + vec(O B) + vec(O C) + vec(O D) = vec(0)$]
    ),
    loigiai: [
        Ta có $vec(A B) + vec(B C) + vec(C D) + vec(D A) = vec(A A) = vec(0) != vec(A C)$.
        Do đó khẳng định A là SAI.
    ]
)

// TN 11
#tn([Cho tam giác $A B C$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $A C$. Biểu thức nào sau đây bằng vectơ $vec(M N)$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.2)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (0.75, 1.1)
    let pN = (2.25, 1.1)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.4pt + rgb("0d9488"))
    content((0.2, 1.7), text(fill: rgb("0d9488"), size: 8pt)[$vec(A M)$])
    line(pA, pN, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.4pt + rgb("0d9488"))
    content((2.8, 1.7), text(fill: rgb("0d9488"), size: 8pt)[$vec(A N)$])
    line(pM, pN, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.5, 0.8), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(M N)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.45), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((0.5, 1.1), text(size: 8pt, weight: "bold")[$M$])
    circle(pN, radius: 2pt, fill: black)
    content((2.5, 1.1), text(size: 8pt, weight: "bold")[$N$])
  })
]],
    (
        True([$vec(A N) - vec(A M)$]),
        [$vec(A M) - vec(A N)$],
        [$vec(A M) + vec(A N)$],
        [$vec(B M) + vec(C N)$]
    ),
    loigiai: [
        Theo quy tắc trừ hai vectơ chung điểm đầu $A$:
        $ vec(A N) - vec(A M) = vec(M N) $
    ]
)

// TN 12
#tn([Hai lực $vec(F)_1$ và $vec(F)_2$ có độ lớn không đổi cùng tác dụng vào một điểm $O$. Hợp lực $vec(F) = vec(F)_1 + vec(F)_2$ đạt độ lớn nhỏ nhất khi],
    (
        True([Hai lực $vec(F)_1$ và $vec(F)_2$ cùng phương nhưng ngược chiều.]),
        [Hai lực $vec(F)_1$ và $vec(F)_2$ cùng phương và cùng chiều.],
        [Hai lực $vec(F)_1$ và $vec(F)_2$ vuông góc với nhau.],
        [Hai lực $vec(F)_1$ và $vec(F)_2$ tạo với nhau một góc $60^circ$.]
    ),
    loigiai: [
        Độ lớn hợp lực thỏa mãn bất đẳng thức $|F_1 - F_2| <= F <= F_1 + F_2$.
        Giá trị nhỏ nhất $F_("min") = |F_1 - F_2|$ đạt được khi hai lực cùng phương ngược chiều nhau (góc giữa hai lực là $180^circ$).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Tam giác ABC và trọng tâm G)
#ds([Cho tam giác $A B C$ có trọng tâm $G$. Gọi $M$ là trung điểm của cạnh $B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (2, 3.2)
    let pB = (0, 0)
    let pC = (5, 0)
    let pM = ((pB.at(0)+pC.at(0))/2, 0)
    let pG = ((pA.at(0)+pB.at(0)+pC.at(0))/3, (pA.at(1)+pB.at(1)+pC.at(1))/3)
    
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("d97706"))
    line(pA, pM, stroke: (paint: rgb("0d9488"), dash: "dashed", thickness: 1.2pt))
    
    // Mũi tên AG và AM
    line(pA, pG, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0), pA.at(1) + 0.25), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) - 0.25, pB.at(1) - 0.2), text(weight: "bold")[$B$])
    circle(pC, radius: 2.5pt, fill: black)
    content((pC.at(0) + 0.25, pC.at(1) - 0.2), text(weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((pM.at(0), pM.at(1) - 0.25), text(weight: "bold")[$M$])
    circle(pG, radius: 2.5pt, fill: rgb("dc2626"))
    content((pG.at(0) + 0.3, pG.at(1) + 0.1), text(fill: rgb("dc2626"), weight: "bold")[$G$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Với mọi điểm $O$ bất kỳ trong mặt phẳng, ta luôn có $vec(O A) + vec(O B) + vec(O C) = 3 vec(O G)$.]),
    True([$vec(A B) + vec(A C) = 2 vec(A M)$.]),
    True([Vectơ $vec(A G)$ cùng hướng với vectơ $vec(A M)$ và có độ dài $A G = 2/3 A M$.]),
    [Điểm $K$ thỏa mãn hệ thức $vec(K A) + vec(K B) = vec(0)$ thì $K$ trùng với trọng tâm $G$.]
  ),
  loigiai: [
    #step([Đẳng thức trọng tâm đối với điểm O tùy ý])
    Chèn điểm $G$ vào vế trái:
    $ vec(O A) + vec(O B) + vec(O C) = 3 vec(O G) + (vec(G A) + vec(G B) + vec(G C)) $
    Vì $G$ là trọng tâm nên $vec(G A) + vec(G B) + vec(G C) = vec(0)$, suy ra $vec(O A) + vec(O B) + vec(O C) = 3 vec(O G)$. Mệnh đề a ĐÚNG.

    #step([Tính chất trung điểm cạnh BC])
    Vì $M$ là trung điểm của $B C$ nên $vec(A B) + vec(A C) = 2 vec(A M)$. Mệnh đề b ĐÚNG.

    #step([Mối quan hệ giữa AG và AM])
    Trọng tâm $G$ nằm trên trung tuyến $A M$ và chia đoạn $A M$ theo tỉ lệ $A G = 2/3 A M$. Vì $A, G, M$ thẳng hàng theo thứ tự đó nên hai vectơ $vec(A G)$ và $vec(A M)$ cùng hướng và $vec(A G) = 2/3 vec(A M)$. Mệnh đề c ĐÚNG.

    #step([Xác định vị trí điểm K])
    Hệ thức $vec(K A) + vec(K B) = vec(0)$ xác định $K$ là trung điểm của cạnh $A B$, chứ không phải trọng tâm $G$ của tam giác. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Hình chữ nhật ABCD)
#ds([Cho hình chữ nhật $A B C D$ có $A B = 4" cm"$, $B C = 3" cm"$. Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 2.25)
    let pB = (3, 2.25)
    let pC = (3, 0)
    let pD = (0, 0)
    let pO = (1.5, 1.125)
    
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("d97706"))
    line(pA, pC, stroke: (paint: luma(140), dash: "dashed"))
    line(pB, pD, stroke: (paint: luma(140), dash: "dashed"))
    
    // Mũi tên AB và AD
    line(pA, pB, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.6pt + rgb("1e40af"))
    line(pA, pD, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.6pt + rgb("1e40af"))
    
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
    True([Độ dài của vectơ tổng $|vec(A B) + vec(A D)| = 5" cm"$.]),
    True([Độ dài của vectơ hiệu $|vec(A B) - vec(A D)| = 5" cm"$.]),
    True([Hai vectơ tổng $vec(A B) + vec(A D)$ và vectơ hiệu $vec(A B) - vec(A D)$ có cùng độ dài.]),
    [Hai vectơ $vec(A B) + vec(A D)$ và $vec(A B) - vec(A D)$ có giá vuông góc với nhau.]
  ),
  loigiai: [
    #step([Tính độ dài vectơ tổng AB + AD])
    Theo quy tắc hình bình hành: $vec(A B) + vec(A D) = vec(A C)$.
    Trong tam giác vuông $A B C$:
    $ |vec(A C)| = A C = sqrt(A B^2 + B C^2) = sqrt(4^2 + 3^2) = 5" cm" $
    Mệnh đề a ĐÚNG.

    #step([Tính độ dài vectơ hiệu AB - AD])
    Theo quy tắc trừ: $vec(A B) - vec(A D) = vec(D B)$.
    Trong tam giác vuông $D A B$:
    $ |vec(D B)| = D B = sqrt(A D^2 + A B^2) = sqrt(3^2 + 4^2) = 5" cm" $
    Mệnh đề b ĐÚNG.

    #step([So sánh độ dài vectơ tổng và hiệu])
    Cả hai vectơ đều có độ dài bằng $5" cm"$ (bằng độ dài hai đường chéo bằng nhau của hình chữ nhật). Mệnh đề c ĐÚNG.

    #step([Xét góc giữa vectơ tổng và hiệu])
    Giá của vectơ tổng là đường thẳng $A C$, giá của vectơ hiệu là đường thẳng $B D$.
    Trong hình chữ nhật không phải hình vuông ($A B != B C$, $4 != 3$), hai đường chéo $A C$ và $B D$ không vuông góc với nhau. Do đó hai vectơ này không có giá vuông góc nhau. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Ba lực cân bằng)
#ds([Một vòng khuyên kim loại nhỏ $O$ nằm cân bằng trên mặt phẳng dưới tác dụng của ba lực kéo đồng phẳng $vec(F)_1, vec(F)_2, vec(F)_3$. Hai lực $vec(F)_1$ và $vec(F)_2$ có giá vuông góc với nhau và có độ lớn lần lượt là $F_1 = 300" N"$, $F_2 = 400" N"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let p1 = (2.4, 0)
    let p2 = (0, 3.2)
    let p12 = (2.4, 3.2)
    let p3 = (-2.4, -3.2)
    
    // Hình chữ nhật hợp lực F1, F2
    line(p1, p12, stroke: (paint: luma(140), dash: "dashed"))
    line(p2, p12, stroke: (paint: luma(140), dash: "dashed"))
    
    // Vectơ F1, F2
    line(pO, p1, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.2, -0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_1 (300" N")$])
    
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.0, 1.6), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_2 (400" N")$])
    
    // Hợp lực F1 + F2
    line(pO, p12, mark: (end: ">", fill: luma(120)), stroke: (paint: luma(120), dash: "dashed", thickness: 1.5pt))
    content((1.8, 1.8), text(fill: luma(100), size: 8pt)[$vec(F)_1 + vec(F)_2$])
    
    // Vectơ F3 đối
    line(pO, p3, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((-1.6, -1.8), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F)_3$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.3, 0.3), [🎯 $O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện cân bằng của vòng khuyên là $vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0)$.]),
    True([Lực $vec(F)_3$ là vectơ đối của hợp lực hai lực thành phần: $vec(F)_3 = - (vec(F)_1 + vec(F)_2)$.]),
    True([Độ lớn của lực $vec(F)_3$ là $F_3 = 500" N"$.]),
    [Vectơ $vec(F)_3$ tạo với vectơ $vec(F)_1$ một góc vuông $90^circ$.]
  ),
  loigiai: [
    #step([Điều kiện cân bằng lực])
    Vật đứng yên thăng bằng khi và chỉ khi hợp lực tác dụng lên nó bằng vectơ-không:
    $ vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0) $
    Mệnh đề a ĐÚNG.

    #step([Quan hệ giữa F3 và hợp lực F1, F2])
    Chuyển vế phương trình:
    $ vec(F)_3 = - (vec(F)_1 + vec(F)_2) $
    Do đó $vec(F)_3$ ngược hướng và cùng độ lớn với hợp lực $vec(F)_1 + vec(F)_2$. Mệnh đề b ĐÚNG.

    #step([Tính độ lớn lực F3])
    Vì $vec(F)_1 perp vec(F)_2$ nên:
    $ F_3 = |vec(F)_1 + vec(F)_2| = sqrt(F_1^2 + F_2^2) = sqrt(300^2 + 400^2) = 500" N" $
    Mệnh đề c ĐÚNG.

    #step([Xác định góc giữa F3 và F1])
    Vectơ hợp lực $vec(F)_1 + vec(F)_2$ tạo với $vec(F)_1$ một góc nhọn $alpha$ thỏa mãn $tan alpha = F_2 / F_1 = 400 / 300 = 4/3 => alpha approx 53.13^circ$.
    Vì $vec(F)_3$ ngược hướng với hợp lực này nên góc giữa $vec(F)_3$ và $vec(F)_1$ là $180^circ - alpha approx 126.87^circ != 90^circ$. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Cần cẩu nâng kiện hàng)
#ds([Một cần cẩu công nghiệp đang nâng thẳng đứng một kiện hàng có trọng lượng $P = 12000" N"$ chuyển động đều lên cao nhờ hai sợi dây cáp thép đối xứng cùng buộc vào móc cẩu tại điểm $O$. Hai sợi dây cáp tạo với nhau một góc $60^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let L = 3.0
    let a1 = 60deg
    let a2 = 120deg
    let p1 = (L * calc.cos(a1), L * calc.sin(a1))
    let p2 = (L * calc.cos(a2), L * calc.sin(a2))
    let pT = (0, 3.0)
    let pP = (0, -2.5)
    
    // Móc cẩu nằm ngang
    line((-2.5, 3.2), (2.5, 3.2), stroke: 2pt + luma(120))
    content((2.2, 3.5), text(size: 8.5pt)[Móc cẩu])
    
    // Dây cáp OA, OB
    line(pO, p1, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.2, 1.5), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(T)_1$])
    
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.2, 1.5), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(T)_2$])
    
    // Cung góc 60 độ tại O
    draw_angle_arc(pO, 60deg, 120deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((0, 1.0), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
    
    // Trọng lực P
    line(pO, pP, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((0.8, -1.5), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(P) (12000" N")$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, -0.3), [🏗️ $O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Do kiện hàng chuyển động đều và hệ thống đối xứng nên lực căng trên hai sợi dây cáp bằng nhau: $T_1 = T_2$.]),
    True([Hợp lực của hai lực căng dây cáp $vec(T) = vec(T)_1 + vec(T)_2$ có phương thẳng đứng, hướng lên trên và có độ lớn bằng $12000" N"$.]),
    True([Độ lớn lực căng trên mỗi sợi dây cáp xấp xỉ bằng $6928" N"$.]),
    [Độ lớn lực căng trên mỗi sợi dây cáp bằng đúng một nửa trọng lượng kiện hàng ($6000" N"$).]
  ),
  loigiai: [
    #step([Tính đối xứng của lực căng])
    Hệ thống hai dây cáp đối xứng qua phương thẳng đứng, mỗi dây nghiêng một góc $30^circ$ so với phương thẳng đứng, do đó $T_1 = T_2$. Mệnh đề a ĐÚNG.

    #step([Điều kiện cân bằng khi nâng đều])
    Khi kiện hàng chuyển động thẳng đều, gia tốc bằng $0$, tổng hợp lực tác dụng lên nó bằng $vec(0)$:
    $ vec(T)_1 + vec(T)_2 + vec(P) = vec(0) <=> vec(T) = - vec(P) $
    Hợp lực của hai lực căng có phương thẳng đứng hướng lên và có độ lớn $T = P = 12000" N"$. Mệnh đề b ĐÚNG.

    #step([Tính độ lớn lực căng mỗi dây])
    Chiếu phương trình lên phương thẳng đứng:
    $ 2 T_1 cos 30^circ = P <=> 2 T_1 dot (sqrt(3) / 2) = 12000 <=> T_1 sqrt(3) = 12000 $
    $ => T_1 = T_2 = 12000 / sqrt(3) = 4000 sqrt(3) approx 4000 dot 1.73205 = 6928.2" N" $
    Mệnh đề c ĐÚNG.

    #step([So sánh với một nửa trọng lượng])
    Vì $T_1 approx 6928" N" > 6000" N"$, lực căng mỗi dây lớn hơn $6000" N"$ do phải chịu thêm thành phần lực theo phương ngang. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho tam giác đều $A B C$ có độ dài cạnh bằng $6" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.2)
    let pB = (0, 0)
    let pC = (3, 0)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pB, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pC, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((0.5, 1.2), text(fill: rgb("0d9488"), size: 8pt)[$vec(A B)$])
    content((1.5, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(B C)$])
    content((2.5, 1.2), text(fill: rgb("0d9488"), size: 8pt)[$vec(C A)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.45), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
  })
]
Tính độ dài của vectơ tổng $vec(A B) + vec(B C) + vec(C A)$ theo đơn vị centimét.],
    [0],
    loigiai: [
        #step([Rút gọn vectơ tổng bằng quy tắc ba điểm])
        Ta có:
        $ (vec(A B) + vec(B C)) + vec(C A) = vec(A C) + vec(C A) = vec(A A) = vec(0) $
        
        #step([Tính độ dài])
        Độ dài của vectơ-không luôn bằng $0$:
        $ |vec(0)| = 0" cm" $
    ]
)

// TLN 2 (Câu 18)
#tln([Cho hình vuông $A B C D$ có cạnh bằng $10" cm"$. Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (-1.5, 0)
    let pC = (1.5, 0)
    let pB = (0, 1.5)
    let pD = (0, -1.5)
    let pO = (0, 0)
    let pM = (-1.5, 1.5)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, stroke: (paint: luma(180), dash: "dashed"))
    line(pB, pD, stroke: (paint: luma(180), dash: "dashed"))
    line(pA, pM, stroke: (paint: luma(160), dash: "dashed"))
    line(pB, pM, stroke: (paint: luma(160), dash: "dashed"))
    line(pO, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pO, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pO, pM, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((-0.8, 1.0), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(O M)$])
    circle(pO, radius: 2pt, fill: black)
    content((0.2, -0.2), text(size: 8pt, weight: "bold")[$O$])
    circle(pA, radius: 2pt, fill: black)
    content((-1.75, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((0, 1.75), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((1.75, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0, -1.75), text(size: 8.5pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ tổng $vec(O A) + vec(O B)$ theo đơn vị centimét.],
    [10],
    loigiai: [
        #step([Quy tắc hình bình hành áp dụng tại tâm O])
        Dựng điểm $M$ sao cho tứ giác $O A M B$ là hình bình hành. Vì $O A perp O B$ và $O A = O B$ nên $O A M B$ là hình vuông.
        Khi đó $vec(O A) + vec(O B) = vec(O M)$.
        
        #step([Tính độ dài OM])
        Đường chéo của hình vuông $O A M B$ có độ dài bằng $O M = O A sqrt(2)$.
        Trong hình vuông $A B C D$, bán kính $O A = (A C) / 2 = (10 sqrt(2)) / 2 = 5 sqrt(2)" cm"$.
        Do đó:
        $ O M = (5 sqrt(2)) dot sqrt(2) = 10" cm" $
        Vậy $|vec(O A) + vec(O B)| = 10" cm"$.
    ]
)

// TLN 3 (Câu 19)
#tln([Cho hình chữ nhật $A B C D$ có $A B = 12" cm"$ và $B C = 5" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.6)
    let pB = (3, 1.6)
    let pC = (3, 0)
    let pD = (0, 0)
    line(pB, pC, pD, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pD, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.8, 1.0), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.25, 1.6), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.25, 1.6), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.25, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.25, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ tổng $vec(A B) + vec(A D)$ theo đơn vị centimét.],
    [13],
    loigiai: [
        #step([Quy tắc hình bình hành cho hình chữ nhật])
        Theo quy tắc hình bình hành:
        $ vec(A B) + vec(A D) = vec(A C) $
        
        #step([Tính độ dài đường chéo AC])
        Áp dụng định lý Pytago trong tam giác vuông $A B C$:
        $ A C = sqrt(A B^2 + B C^2) = sqrt(12^2 + 5^2) = sqrt(144 + 25) = sqrt(169) = 13" cm" $
        Vậy $|vec(A B) + vec(A D)| = 13" cm"$.
    ]
)

// TLN 4 (Câu 20)
#tln([Cho tam giác đều $A B C$ có độ dài cạnh bằng $8" cm"$. Gọi $M$ và $N$ lần lượt là trung điểm của hai cạnh $A B$ và $A C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.2)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (0.75, 1.1)
    let pN = (2.25, 1.1)
    let pK = (1.5, 0)
    line(pA, pB, pC, close: true, stroke: 1pt + rgb("0d9488"))
    line(pA, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pN, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pA, pK, mark: (end: ">", fill: rgb("dc2626")), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 1.8pt))
    content((1.9, 0.9), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A K)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.45), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((0.5, 1.1), text(size: 8pt, weight: "bold")[$M$])
    circle(pN, radius: 2pt, fill: black)
    content((2.5, 1.1), text(size: 8pt, weight: "bold")[$N$])
    circle(pK, radius: 2pt, fill: black)
    content((1.5, -0.25), text(size: 8pt, weight: "bold")[$K$])
  })
]
Tính độ dài của vectơ tổng $vec(A M) + vec(A N)$ theo đơn vị centimét (làm tròn kết quả đến chữ số thập phân thứ nhất).
(Cho biết $sqrt(3) approx 1.732$)],
    [6.9],
    loigiai: [
        #step([Biểu diễn AM + AN theo trung tuyến])
        Gọi $K$ là trung điểm của cạnh $B C$. Ta có:
        $ vec(A M) = 1/2 vec(A B), quad vec(A N) = 1/2 vec(A C) $
        $ => vec(A M) + vec(A N) = 1/2 (vec(A B) + vec(A C)) = 1/2 (2 vec(A K)) = vec(A K) $
        
        #step([Tính độ dài đường cao AK])
        Trong tam giác đều $A B C$ cạnh $a = 8" cm"$, đường cao $A K$ là:
        $ A K = (a sqrt(3)) / 2 = (8 sqrt(3)) / 2 = 4 sqrt(3) approx 4 dot 1.73205 = 6.928" cm" $
        Làm tròn đến chữ số thập phân thứ nhất ta được $6.9" cm"$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Hợp lực vuông góc của cano)
#tln([Một chiếc cano chạy trên hồ nước phẳng lặng chịu tác dụng đồng thời của lực đẩy từ động cơ $vec(F)_1$ hướng về phía Đông có độ lớn $1500" N"$ và lực cản của dòng nước chảy $vec(F)_2$ hướng về phía Nam có độ lớn $2000" N"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let p1 = (3, 0)
    let p2 = (0, -4)
    let pF = (3, -4)
    
    // Hình chữ nhật hợp lực
    line(p1, pF, stroke: (paint: luma(140), dash: "dashed"))
    line(p2, pF, stroke: (paint: luma(140), dash: "dashed"))
    
    // Vectơ F1
    line(pO, p1, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.5, 0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_1 (1500" N")$])
    
    // Vectơ F2
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.2, -2.0), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_2 (2000" N")$])
    
    // Vectơ hợp lực F
    line(pO, pF, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.8, -2.3), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F) = vec(F)_1 + vec(F)_2$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, 0.4), [⛵ $O$])
  })
]
Tính độ lớn của hợp lực $vec(F) = vec(F)_1 + vec(F)_2$ tác dụng lên cano theo đơn vị Newton.],
    [2500],
    loigiai: [
        #step([Xác định góc giữa hai vectơ lực])
        Hướng Đông vuông góc với hướng Nam, nên $vec(F)_1 perp vec(F)_2$.
        
        #step([Tính độ lớn hợp lực vuông góc])
        Áp dụng định lý Pytago:
        $ F = sqrt(F_1^2 + F_2^2) = sqrt(1500^2 + 2000^2) = sqrt(2250000 + 4000000) = sqrt(6250000) = 2500" N" $
    ]
)

// TLN 6 (Câu 22 - Vận dụng cao Thực tế Hai tàu kéo xà lan góc 60 độ)
#tln([Hai chiếc tàu kéo cùng kéo một sà lan tại điểm $O$ bằng hai sợi dây cáp thép tạo với nhau một góc $60^circ$. Lực kéo của tàu thứ nhất là $F_1 = 5000" N"$, lực kéo của tàu thứ hai là $F_2 = 8000" N"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let F1 = 2.5
    let F2 = 4.0
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
    content((1.2, -0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_1 (5000" N")$])
    
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.5, 2.2), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_2 (8000" N")$])
    
    // Vectơ hợp lực F
    line(pO, pF, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((pF.at(0) + 0.6, pF.at(1)), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F)$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.3, -0.3), [🚢 $O$])
  })
]
Tính độ lớn của hợp lực kéo $vec(F) = vec(F)_1 + vec(F)_2$ tác dụng lên sà lan theo đơn vị Newton (làm tròn kết quả đến hàng đơn vị).
(Cho biết $sqrt(129) approx 11.3578$)],
    [11358],
    loigiai: [
        #step([Công thức tổng quát độ lớn hợp lực])
        Theo quy tắc hình bình hành, độ lớn của hợp lực $vec(F) = vec(F)_1 + vec(F)_2$ khi góc hợp bởi hai vectơ lực là $alpha = 60^circ$ được tính theo định lý côsin trong tam giác lực:
        $ F^2 = F_1^2 + F_2^2 + 2 F_1 F_2 cos 60^circ $
        
        #step([Thay số và tính toán])
        $ F^2 = 5000^2 + 8000^2 + 2(5000)(8000) dot (1/2) $
        $ F^2 = 25000000 + 64000000 + 40000000 = 129000000 $
        $ => F = sqrt(129000000) = 1000 sqrt(129) $
        Thay số: $F approx 1000 dot 11.357817 = 11357.8" N"$.
        Làm tròn đến hàng đơn vị ta được $11358" N"$.
    ]
)

] // end make-questions

#make-questions()
