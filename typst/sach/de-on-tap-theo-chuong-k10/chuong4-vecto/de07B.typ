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
  exam-title: "BÀI 7: CÁC KHÁI NIỆM MỞ ĐẦU VỀ VECTƠ (ĐỀ SỐ 2)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "102",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Điều kiện cần và đủ để hai vectơ $vec(a)$ và $vec(b)$ bằng nhau là],
    (
        True([$vec(a)$ và $vec(b)$ cùng hướng và cùng độ dài.]),
        [$vec(a)$ và $vec(b)$ cùng phương và cùng độ dài.],
        [$vec(a)$ và $vec(b)$ có độ dài bằng nhau.],
        [$vec(a)$ và $vec(b)$ có giá trùng nhau.]
    ),
    loigiai: [
        Hai vectơ được gọi là bằng nhau nếu chúng thỏa mãn đồng thời hai điều kiện: cùng hướng và cùng độ dài.
    ]
)

// TN 2
#tn([Cho tam giác $A B C$. Có bao nhiêu vectơ khác vectơ-không có điểm đầu và điểm cuối là các đỉnh của tam giác $A B C$?],
    (
        True([$6$]),
        [$3$],
        [$9$],
        [$4$]
    ),
    loigiai: [
        Số vectơ khác $vec(0)$ tạo từ $3$ đỉnh là số chỉnh hợp $A_3^2 = 3 dot 2 = 6$.
        Các vectơ đó là: $vec(A B), vec(B A), vec(A C), vec(C A), vec(B C), vec(C B)$.
    ]
)

// TN 3
#tn([Vectơ đối của vectơ $vec(A B)$ là vectơ nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3, 0)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.5, 0.35), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A B)$])
    line((3, -0.6), (0, -0.6), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.5, -0.95), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(B A) = - vec(A B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
  })
]],
    (
        True([$vec(B A)$]),
        [$vec(A B)$],
        [$- vec(B A)$],
        [$|vec(A B)|$]
    ),
    loigiai: [
        Vectơ đối của $vec(A B)$ là vectơ có cùng độ dài nhưng ngược hướng với $vec(A B)$, đó chính là $vec(B A) = - vec(A B)$.
    ]
)

// TN 4
#tn([Cho hình thoi $A B C D$ tâm $O$. Cặp vectơ nào sau đây là hai vectơ bằng nhau?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.4)
    let pB = (2, 1.4)
    let pD = (-0.8, 0)
    let pC = (1.2, 0)
    line(pA, pD, stroke: 0.8pt + luma(160))
    line(pB, pC, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1, 1.7), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A B)$])
    line(pD, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.2, -0.3), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(D C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 1.4), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.2, 1.4), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((1.4, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-1.0, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$vec(A B)$ và $vec(D C)$]),
        [$vec(A B)$ và $vec(C D)$],
        [$vec(A D)$ và $vec(C B)$],
        [$vec(O A)$ và $vec(O C)$]
    ),
    loigiai: [
        Trong hình thoi $A B C D$, $A B parallel D C$ và $A B = D C$. Hướng từ $A$ sang $B$ cùng hướng từ $D$ sang $C$, nên $vec(A B) = vec(D C)$.
    ]
)

// TN 5
#tn([Cho lục giác đều $A B C D E F$ tâm $O$. Vectơ nào sau đây cùng phương và cùng hướng với vectơ $vec(A B)$?
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
    line(pts.at(5), pts.at(0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content(((pts.at(5).at(0)+pts.at(0).at(0))/2 + 0.35, (pts.at(5).at(1)+pts.at(0).at(1))/2), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(A B)$])
    line(pts.at(4), (0, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((-0.4, -0.6), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(F O)$])
    circle((0, 0), radius: 2pt, fill: black)
    content((0.2, 0.1), text(size: 8pt, weight: "bold")[$O$])
    circle(pts.at(5), radius: 2pt, fill: black)
    content((pts.at(5).at(0) + 0.2, pts.at(5).at(1) - 0.2), text(size: 8pt, weight: "bold")[$A$])
    circle(pts.at(0), radius: 2pt, fill: black)
    content((pts.at(0).at(0) + 0.2, pts.at(0).at(1) + 0.2), text(size: 8pt, weight: "bold")[$B$])
    circle(pts.at(4), radius: 2pt, fill: black)
    content((pts.at(4).at(0) - 0.2, pts.at(4).at(1) - 0.2), text(size: 8pt, weight: "bold")[$F$])
  })
]],
    (
        True([$vec(F O)$]),
        [$vec(E D)$],
        [$vec(B C)$],
        [$vec(A F)$]
    ),
    loigiai: [
        Trong lục giác đều $A B C D E F$ tâm $O$, đoạn $F O parallel A B$ và hướng từ $F$ đến $O$ cùng hướng từ $A$ đến $B$. Do đó $vec(F O)$ cùng phương và cùng hướng với $vec(A B)$ (thậm chí $vec(A B) = vec(F O)$).
    ]
)

// TN 6
#tn([Cho ba điểm phân biệt $A, B, C$. Điều kiện cần và đủ để ba điểm $A, B, C$ thẳng hàng là],
    (
        True([Hai vectơ $vec(A B)$ và $vec(A C)$ cùng phương.]),
        [Hai vectơ $vec(A B)$ và $vec(A C)$ cùng độ dài.],
        [Hai vectơ $vec(A B)$ và $vec(B C)$ cùng hướng.],
        [Tồn tại điểm $O$ sao cho $vec(O A) = vec(O B)$.]
    ),
    loigiai: [
        Ba điểm phân biệt $A, B, C$ thẳng hàng khi và chỉ khi hai đường thẳng $A B$ và $A C$ trùng nhau, tức là hai vectơ $vec(A B)$ và $vec(A C)$ cùng phương.
    ]
)

// TN 7
#tn([Cho điểm $M$ nằm giữa hai điểm phân biệt $A$ và $B$. Khẳng định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pM = (1.5, 0)
    let pB = (3.5, 0)
    line(pA, pB, stroke: 0.8pt + luma(180))
    line(pM, (0.2, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    content((0.8, 0.35), text(fill: rgb("dc2626"), size: 8pt)[$vec(M A)$])
    line(pM, (3.3, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.6pt + rgb("0d9488"))
    content((2.4, 0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(M B)$])
    circle(pA, radius: 2pt, fill: black)
    content((pA.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pM, radius: 2pt, fill: black)
    content((pM.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$M$])
    circle(pB, radius: 2pt, fill: black)
    content((pB.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$B$])
  })
]],
    (
        True([Hai vectơ $vec(M A)$ và $vec(M B)$ ngược hướng nhau.]),
        [Hai vectơ $vec(M A)$ và $vec(M B)$ cùng hướng nhau.],
        [Hai vectơ $vec(A M)$ và $vec(B M)$ cùng hướng nhau.],
        [$vec(M A) = vec(M B)$]
    ),
    loigiai: [
        Vì $M$ nằm giữa $A$ và $B$ nên hai tia $M A$ và $M B$ là hai tia đối nhau, do đó hai vectơ $vec(M A)$ và $vec(M B)$ ngược hướng nhau.
    ]
)

// TN 8
#tn([Cho tam giác $A B C$ vuông cân tại $A$ có $A B = A C = 4" cm"$. Độ dài của vectơ $vec(B C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.2, 0)
    let pC = (0, 2.2)
    line((0.3, 0), (0.3, 0.3), (0, 0.3), stroke: 0.7pt + black)
    line(pA, pB, stroke: 0.8pt + luma(160))
    line(pA, pC, stroke: 0.8pt + luma(160))
    line(pB, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.3, 1.3), text(fill: rgb("0d9488"), weight: "bold", size: 8.5pt)[$vec(B C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.4, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0, 2.4), text(size: 8.5pt, weight: "bold")[$C$])
  })
]],
    (
        True([$4 sqrt(2)" cm"$]),
        [$4" cm"$],
        [$8" cm"$],
        [$2 sqrt(2)" cm"$]
    ),
    loigiai: [
        Áp dụng định lý Pytago trong tam giác vuông $A B C$:
        $ |vec(B C)| = B C = sqrt(A B^2 + A C^2) = sqrt(4^2 + 4^2) = 4 sqrt(2)" cm" $
    ]
)

// TN 9
#tn([Cho hình vuông $A B C D$. Khẳng định nào sau đây là SAI?],
    (
        True([$vec(A C) = vec(B D)$]),
        [$|vec(A B)| = |vec(B C)|$],
        [$vec(A B) = vec(D C)$],
        [$|vec(A C)| = |vec(B D)|$]
    ),
    loigiai: [
        Hai đường chéo của hình vuông có độ dài bằng nhau ($A C = B D$), nhưng hai vectơ $vec(A C)$ và $vec(B D)$ có phương vuông góc nhau chứ không cùng phương, do đó $vec(A C) != vec(B D)$. Khẳng định A là sai.
    ]
)

// TN 10
#tn([Trong mặt phẳng, cho vectơ $vec(u)$ có điểm đầu là gốc $O$ và điểm cuối là điểm $M(3; 4)$. Độ dài của vectơ $vec(u)$ bằng],
    (
        True([$5$]),
        [$7$],
        [$1$],
        [$25$]
    ),
    loigiai: [
        Độ dài vectơ $vec(u) = vec(O M)$ là khoảng cách từ gốc $O(0; 0)$ đến $M(3; 4)$:
        $ |vec(u)| = O M = sqrt(3^2 + 4^2) = sqrt(25) = 5 $
    ]
)

// TN 11
#tn([Cho hình thang $A B C D$ với hai đáy là $A B$ và $C D$ ($A B parallel C D$). Hai vectơ $vec(A B)$ và $vec(D C)$ là hai vectơ],
    (
        True([Cùng phương và cùng hướng]),
        [Cùng phương và ngược hướng],
        [Vuông góc với nhau],
        [Có cùng độ dài]
    ),
    loigiai: [
        Hình thang có hai đáy $A B parallel C D$, quy ước thứ tự đỉnh $A B C D$ quanh chu vi cho thấy chiều từ $A$ đến $B$ cùng chiều từ $D$ đến $C$. Do đó $vec(A B)$ và $vec(D C)$ cùng phương và cùng hướng.
    ]
)

// TN 12
#tn([Nếu hai vectơ $vec(u)$ và $vec(v)$ là hai vectơ đối nhau thì],
    (
        True([$vec(u)$ và $vec(v)$ ngược hướng và có độ dài bằng nhau.]),
        [$vec(u)$ và $vec(v)$ cùng hướng và có độ dài bằng nhau.],
        [$vec(u)$ và $vec(v)$ có cùng điểm đầu.],
        [$vec(u)$ và $vec(v)$ có độ dài khác nhau.]
    ),
    loigiai: [
        Hai vectơ đối nhau là hai vectơ có cùng độ dài nhưng ngược hướng nhau, ký hiệu $vec(u) = - vec(v)$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Lục giác đều)
#ds([Cho lục giác đều $A B C D E F$ tâm $O$ có cạnh bằng $a$.
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
    
    // Viền lục giác và các đường chéo chính
    line(pA, pB, pC, pD, pE, pF, close: true, stroke: 1.2pt + rgb("0d9488"))
    line(pA, pD, stroke: (paint: luma(140), dash: "dashed"))
    line(pB, pE, stroke: (paint: luma(140), dash: "dashed"))
    line(pC, pF, stroke: (paint: luma(140), dash: "dashed"))
    
    // Mũi tên AB và ED
    line(pA, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    line(pF, pO, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    line(pO, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    
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
    content((pO.at(0) + 0.2, pO.at(1) - 0.25), text(weight: "bold")[$O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Các vectơ $vec(A B), vec(F O), vec(O C), vec(E D)$ là các vectơ bằng nhau.]),
    True([Hai vectơ $vec(A D)$ và $vec(B C)$ cùng phương nhưng không cùng độ dài.]),
    True([Độ dài của vectơ đường chéo chính $vec(A D)$ bằng $2a$.]),
    [Hai vectơ $vec(A O)$ và $vec(O D)$ là hai vectơ đối nhau.]
  ),
  loigiai: [
    #step([Xét các vectơ bằng nhau])
    Trong lục giác đều $A B C D E F$ tâm $O$, các tứ giác $A B O F$, $O B C D$, $F O D E$ là các hình thoi cạnh $a$. Do đó các đoạn $A B, F O, O C, E D$ song song, bằng nhau và cùng hướng. Vậy $vec(A B) = vec(F O) = vec(O C) = vec(E D)$. Mệnh đề a ĐÚNG.

    #step([Xét tính cùng phương của AD và BC])
    Đường chéo chính $A D$ song song với cạnh $B C$, nên $vec(A D)$ và $vec(B C)$ cùng phương. Tuy nhiên độ dài $A D = 2a != B C = a$. Mệnh đề b ĐÚNG.

    #step([Độ dài vectơ đường chéo chính])
    Đường kính đường tròn ngoại tiếp lục giác đều là $A D = 2 R = 2a$. Do đó $|vec(A D)| = 2a$. Mệnh đề c ĐÚNG.

    #step([Xét quan hệ giữa AO và OD])
    $O$ là trung điểm của đoạn $A D$. Hướng từ $A$ đến $O$ cùng hướng từ $O$ đến $D$ và $A O = O D = a$. Do đó $vec(A O) = vec(O D)$ (hai vectơ bằng nhau), chứ không phải đối nhau. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Đường trung bình tam giác)
#ds([Cho tam giác $A B C$. Gọi $M, N, P$ lần lượt là trung điểm của các cạnh $A B, A C, B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (2, 3)
    let pB = (0, 0)
    let pC = (5, 0)
    let pM = ((pA.at(0)+pB.at(0))/2, (pA.at(1)+pB.at(1))/2)
    let pN = ((pA.at(0)+pC.at(0))/2, (pA.at(1)+pC.at(1))/2)
    let pP = ((pB.at(0)+pC.at(0))/2, (pB.at(1)+pC.at(1))/2)
    
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    line(pM, pN, pP, close: true, stroke: 1pt + rgb("0d9488"))
    
    // Mũi tên MN và BP
    line(pM, pN, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    line(pB, pP, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0), pA.at(1) + 0.25), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) - 0.25, pB.at(1) - 0.2), text(weight: "bold")[$B$])
    circle(pC, radius: 2.5pt, fill: black)
    content((pC.at(0) + 0.25, pC.at(1) - 0.2), text(weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((pM.at(0) - 0.3, pM.at(1) + 0.1), text(weight: "bold")[$M$])
    circle(pN, radius: 2pt, fill: black)
    content((pN.at(0) + 0.3, pN.at(1) + 0.1), text(weight: "bold")[$N$])
    circle(pP, radius: 2pt, fill: black)
    content((pP.at(0), pP.at(1) - 0.25), text(weight: "bold")[$P$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ $vec(M N)$ và $vec(B P)$ cùng hướng.]),
    True([$vec(M N) = vec(B P) = vec(P C)$.]),
    True([$|vec(M N)| = 1/2 |vec(B C)|$.]),
    [Hai vectơ $vec(P M)$ và $vec(P N)$ cùng phương.]
  ),
  loigiai: [
    #step([Tính chất đường trung bình MN])
    $M N$ là đường trung bình của tam giác $A B C$ ứng với cạnh $B C$, do đó $M N parallel B C$ và $M N = 1/2 B C$.
    Vì $P$ là trung điểm của $B C$ nên $B P = P C = 1/2 B C = M N$.
    Hướng từ $M$ đến $N$ cùng hướng từ $B$ đến $P$, nên $vec(M N)$ cùng hướng với $vec(B P)$. Mệnh đề a ĐÚNG.

    #step([Xét các vectơ bằng nhau])
    Do $M N parallel B C$, $M N = B P = P C$ và cùng hướng từ trái sang phải nên $vec(M N) = vec(B P) = vec(P C)$. Mệnh đề b ĐÚNG.

    #step([Xét tỉ lệ độ dài])
    $|vec(M N)| = M N = 1/2 B C = 1/2 |vec(B C)|$. Mệnh đề c ĐÚNG.

    #step([Xét hai vectơ PM và PN])
    Hai đường thẳng $P M$ và $P N$ cắt nhau tại điểm $P$ và không trùng nhau, nên hai vectơ $vec(P M)$ và $vec(P N)$ không cùng phương. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Tàu chạy ngược dòng)
#ds([Một chiếc tàu thủy chở khách di chuyển trên một con sông. Vận tốc của tàu đối với dòng nước được biểu diễn bởi vectơ $vec(v)_t$ có độ lớn $25" km/h"$. Vận tốc dòng nước chảy đối với bờ sông được biểu diễn bởi vectơ $vec(v)_n$ có độ lớn $5" km/h"$. Tàu xuất phát từ bến $A$ chạy ngược dòng sông đến bến $B$ cách bến $A$ một khoảng cách $60" km"$.
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
    
    // Vectơ vận tốc tàu (ngược dòng: A -> B)
    line((1.5, 0.2), (3.5, 0.2), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((2.5, 0.5), [🚢 $vec(v)_t (25" km/h")$])
    
    // Vectơ vận tốc dòng nước (chảy xuôi: B -> A)
    line((3.5, -0.2), (2.0, -0.2), mark: (end: ">", fill: rgb("d97706")), stroke: 1.8pt + rgb("d97706"))
    content((2.7, -0.5), [💧 $vec(v)_n (5" km/h")$])
    
    // Bến A và B
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0), -0.3), text(weight: "bold")[Bến $A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0), -0.3), text(weight: "bold")[Bến $B$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ vận tốc riêng của tàu $vec(v)_t$ và vectơ vận tốc dòng nước $vec(v)_n$ là hai vectơ ngược hướng.]),
    True([Tốc độ thực tế của tàu đối với bờ sông khi chạy ngược dòng là $20" km/h"$.]),
    True([Vectơ vận tốc thực tế của tàu đối với bờ sông cùng hướng với vectơ $vec(v)_t$.]),
    [Thời gian để tàu hoàn thành chuyến đi từ $A$ đến $B$ là $2.4$ giờ.]
  ),
  loigiai: [
    #step([Xét hướng của hai vectơ vận tốc])
    Tàu chạy ngược dòng nên chiều chuyển động của tàu ngược với chiều chảy của dòng nước. Do đó $vec(v)_t$ và $vec(v)_n$ là hai vectơ cùng phương nhưng ngược hướng. Mệnh đề a ĐÚNG.

    #step([Tính tốc độ thực tế ngược dòng])
    Tốc độ thực tế của tàu đối với bờ sông khi chạy ngược dòng là:
    $ v = v_t - v_n = 25 - 5 = 20" km/h" $
    Mệnh đề b ĐÚNG.

    #step([Xét hướng của vectơ vận tốc thực tế])
    Vì $v_t > v_n$ ($25 > 5$) nên tàu vẫn tiến về phía trước theo hướng chuyển động của tàu. Do đó vectơ vận tốc thực tế cùng hướng với $vec(v)_t$. Mệnh đề c ĐÚNG.

    #step([Tính thời gian tàu di chuyển])
    Thời gian đi hết quãng đường $s = 60" km"$ là:
    $ t = s / v = 60 / 20 = 3" giờ" $
    Giá trị $3$ giờ khác $2.4$ giờ (chỉ bằng $2.4$ giờ khi xuôi dòng: $60 / 25 = 2.4$). Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Người bơi qua sông)
#ds([Một người bơi qua một con sông có hai bờ thẳng song song cách nhau $60" m"$. Người đó bơi theo phương vuông góc với bờ sông với tốc độ riêng không đổi $3" m/s"$. Dòng nước chảy xuôi bờ với tốc độ $4" m/s"$ đẩy người đó dạt về phía hạ lưu.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pA = (0, 3)
    let pB = (4, 0)
    let pM = (4, 3)
    
    // Hai bờ sông
    line((-0.8, 0), (5.2, 0), stroke: 1.5pt + rgb("0284c7"))
    line((-0.8, 3), (5.2, 3), stroke: 1.5pt + rgb("0284c7"))
    content((4.8, -0.3), text(fill: rgb("0284c7"), size: 8pt)[Bờ xuất phát])
    content((4.8, 3.3), text(fill: rgb("0284c7"), size: 8pt)[Bờ đích])
    
    // Hình chữ nhật vectơ vận tốc
    line(pA, pM, stroke: (paint: luma(140), dash: "dashed"))
    line(pB, pM, stroke: (paint: luma(140), dash: "dashed"))
    
    // Vectơ v_người
    line(pO, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-0.8, 1.5), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)_b (3" m/s")$])
    
    // Vectơ v_nước
    line(pO, pB, mark: (end: ">", fill: rgb("d97706")), stroke: 1.8pt + rgb("d97706"))
    content((2, -0.35), text(fill: rgb("d97706"), size: 8.5pt)[$vec(v)_n (4" m/s")$])
    
    // Vectơ tổng hợp
    line(pO, pM, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((2.2, 1.8), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(v) = vec(v)_b + vec(v)_n$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.3, -0.3), [🏊 $O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ $vec(v)_b$ và $vec(v)_n$ có giá vuông góc với nhau.]),
    True([Tốc độ thực tế của người bơi đối với bờ sông là $5" m/s"$.]),
    True([Thời gian người đó bơi sang đến bờ bên kia là $20$ giây.]),
    [Quãng đường thực tế người đó đã bơi trong nước đối với bờ sông bằng đúng bề rộng con sông ($60" m"$).]
  ),
  loigiai: [
    #step([Phương của hai vectơ vận tốc])
    Người bơi theo phương vuông góc bờ sông, dòng nước chảy dọc theo bờ sông, nên hai vectơ $vec(v)_b$ và $vec(v)_n$ vuông góc nhau. Mệnh đề a ĐÚNG.

    #step([Tính tốc độ thực tế đối với bờ])
    Áp dụng định lý Pytago cho hai vectơ vuông góc:
    $ v = |vec(v)| = sqrt(v_b^2 + v_n^2) = sqrt(3^2 + 4^2) = 5" m/s" $
    Mệnh đề b ĐÚNG.

    #step([Tính thời gian bơi sang bờ bên kia])
    Vận tốc theo phương vuông góc bờ sông chỉ do người bơi tạo ra ($v_b = 3" m/s"$), bề rộng sông $d = 60" m"$.
    Thời gian để sang bờ bên kia là:
    $ t = d / v_b = 60 / 3 = 20" giây" $
    Mệnh đề c ĐÚNG.

    #step([Tính quãng đường thực tế])
    Quãng đường thực tế người đó bơi dưới tác dụng tổng hợp của hai vận tốc là:
    $ s = v dot t = 5 dot 20 = 100" m" > 60" m" $
    Do bị dòng nước cuốn trôi dạt chéo, quãng đường thực tế dài $100" m"$ chứ không phải $60" m"$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho ngũ giác đều $A B C D E$. Hỏi có bao nhiêu vectơ khác vectơ-không có điểm đầu và điểm cuối là các đỉnh của ngũ giác đã cho?],
    [20],
    loigiai: [
        #step([Tính số lượng vectơ bằng chỉnh hợp])
        Từ $5$ đỉnh phân biệt của ngũ giác, số vectơ khác $vec(0)$ được tạo thành bằng cách chọn có thứ tự $2$ đỉnh trong $5$ đỉnh:
        $ A_5^2 = 5 dot 4 = 20 $
        Vậy có tất cả $20$ vectơ khác $vec(0)$.
    ]
)

// TLN 2 (Câu 18)
#tln([Cho hình chữ nhật $A B C D$ có $A B = 5" cm"$ và $B C = 12" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 2)
    let pB = (3.2, 2)
    let pC = (3.2, 0)
    let pD = (0, 0)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pB, pD, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.8, 1.2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(B D)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 2.0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.4, 2.0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.4, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ đường chéo $vec(B D)$ theo đơn vị centimét.],
    [13],
    loigiai: [
        #step([Áp dụng định lý Pytago])
        Tam giác $B C D$ vuông tại $C$ có $C D = A B = 5" cm"$, $B C = 12" cm"$:
        $ B D = sqrt(B C^2 + C D^2) = sqrt(12^2 + 5^2) = sqrt(144 + 25) = sqrt(169) = 13" cm" $
        Do đó độ dài vectơ là $|vec(B D)| = B D = 13" cm"$.
    ]
)

// TLN 3 (Câu 19)
#tln([Cho tam giác đều $A B C$ có cạnh bằng $6" cm"$. Gọi $G$ là trọng tâm của tam giác $A B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3, 0)
    let pH = (1.5, 0)
    let pG = (1.5, 0.87)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pH, stroke: (paint: luma(180), dash: "dashed"))
    line(pA, pG, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.85, 1.8), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(A G)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.85), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pG, radius: 2pt, fill: black)
    content((1.8, 0.85), text(size: 8.5pt, weight: "bold")[$G$])
  })
]
Tính độ dài của vectơ $vec(A G)$ theo đơn vị centimét (làm tròn kết quả đến chữ số thập phân thứ nhất).
(Cho biết $sqrt(3) approx 1.732$)],
    [3.5],
    loigiai: [
        #step([Tính độ dài đường cao AH])
        Gọi $H$ là trung điểm của $B C$. Trong tam giác đều cạnh $a = 6" cm"$, đường cao $A H$ là:
        $ A H = (a sqrt(3)) / 2 = (6 sqrt(3)) / 2 = 3 sqrt(3)" cm" $
        
        #step([Tính độ dài AG])
        Vì $G$ là trọng tâm nên:
        $ A G = 2/3 A H = 2/3 dot 3 sqrt(3) = 2 sqrt(3) approx 2 dot 1.732 = 3.464" cm" $
        Làm tròn đến chữ số thập phân thứ nhất ta được $3.5" cm"$.
    ]
)

// TLN 4 (Câu 20)
#tln([Cho lục giác đều $A B C D E F$ có tâm $O$ và có độ dài cạnh bằng $8" cm"$.
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
    line(pts.at(3), pts.at(0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((0, 0.3), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A D)$])
    circle((0, 0), radius: 2pt, fill: black)
    content((0, -0.25), text(size: 8pt, weight: "bold")[$O$])
    circle(pts.at(3), radius: 2pt, fill: black)
    content((pts.at(3).at(0) - 0.25, pts.at(3).at(1)), text(size: 8pt, weight: "bold")[$A$])
    circle(pts.at(0), radius: 2pt, fill: black)
    content((pts.at(0).at(0) + 0.25, pts.at(0).at(1)), text(size: 8pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ đường chéo chính $vec(A D)$ theo đơn vị centimét.],
    [16],
    loigiai: [
        #step([Tính chất lục giác đều])
        Trong lục giác đều $A B C D E F$ tâm $O$, các tam giác $O A B, O B C, O C D, dots$ là các tam giác đều cạnh bằng $8" cm"$.
        Đoạn thẳng $A D$ là đường chéo chính đi qua tâm $O$ với $O$ là trung điểm của $A D$:
        $ A D = 2 dot O A = 2 dot 8 = 16" cm" $
        Vậy độ dài vectơ $|vec(A D)| = 16" cm"$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Kéo xe)
#tln([Hai công nhân cùng kéo một chiếc xe goòng bằng hai sợi dây cáp buộc tại điểm $O$. Hai sợi dây tạo với nhau một góc $60^circ$. Lực kéo của mỗi công nhân có cùng độ lớn bằng $400" N"$.
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
    
    // Vectơ F1 và F2
    line(pO, p1, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((p1.at(0) + 0.6, p1.at(1)), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_1 (400" N")$])
    
    line(pO, p2, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((p2.at(0) + 0.6, p2.at(1)), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_2 (400" N")$])
    
    // Vectơ F tổng hợp
    line(pO, pF, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((pF.at(0) + 0.6, 0), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F)$])
    
    // Góc giữa hai lực
    draw_angle_arc(pO, -30deg, 30deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.2, 0), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, 0), [🏗️ $O$])
  })
]
Tính độ lớn của hợp lực kéo $vec(F) = vec(F)_1 + vec(F)_2$ tác dụng lên xe goòng theo đơn vị Newton (làm tròn kết quả đến hàng đơn vị).
(Cho biết $sqrt(3) approx 1.732$)],
    [693],
    loigiai: [
        #step([Quy tắc hình bình hành cho hai lực bằng nhau])
        Vì hai lực có cùng độ lớn $F_1 = F_2 = 400" N"$ nên tứ giác tạo bởi hai vectơ là hình thoi. Hợp lực $vec(F)$ là đường chéo phân giác của góc $60^circ$.
        
        #step([Tính độ lớn hợp lực])
        Độ lớn hợp lực là:
        $ F = 2 dot F_1 dot cos(60^circ / 2) = 2 dot 400 dot cos 30^circ = 800 dot (sqrt(3) / 2) = 400 sqrt(3)" N" $
        Thay số: $F approx 400 dot 1.73205 = 692.82" N"$.
        Làm tròn đến hàng đơn vị ta được $693" N"$.
    ]
)

// TLN 6 (Câu 22 - Vận dụng cao Thực tế Độ dịch chuyển máy bay)
#tln([Một máy bay trinh sát xuất phát từ căn cứ $O$, bay theo hướng Đông một quãng đường $80" km"$ đến vị trí $A$, sau đó đổi hướng bay chếch theo hướng Đông - Bắc $60^circ$ một quãng đường $60" km"$ đến vị trí mục tiêu $B$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.035
    let pO = (0, 0)
    let pA = (80 * sc, 0)
    let ang = 60deg
    let pB = (pA.at(0) + 60 * sc * calc.cos(ang), 60 * sc * calc.sin(ang))
    
    // Trục hướng tại O
    line((-0.5, 0), (5.5, 0), stroke: 0.5pt + luma(180))
    line((0, -0.5), (0, 3.0), stroke: 0.5pt + luma(180))
    content((5.3, -0.3), [🧭 Đông])
    content((-0.3, 2.9), [Bắc])
    
    // Đường kéo dài qua A để biểu diễn góc rẽ 60 độ
    line(pA, (pA.at(0) + 1.2, 0), stroke: (paint: luma(140), dash: "dashed"))
    draw_angle_arc(pA, 0deg, 60deg, radius: 0.6, stroke: 0.8pt + rgb("d97706"))
    content((pA.at(0) + 0.85, 0.35), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
    
    // Cung góc trong tam giác OAB tại A = 120 độ
    draw_angle_arc(pA, 60deg, 180deg, radius: 0.5, stroke: 0.8pt + rgb("2563eb"))
    content((pA.at(0) - 0.3, 0.45), text(fill: rgb("2563eb"), size: 8pt)[$120^circ$])
    
    // Vectơ di chuyển
    line(pO, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((40 * sc, -0.35), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(d)_1 (80" km")$])
    
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((pA.at(0) + 0.8, 1.3), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(d)_2 (60" km")$])
    
    // Vectơ độ dịch chuyển tổng hợp OB
    line(pO, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.3, 1.2), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(d) = vec(O B)$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.3, -0.3), text(weight: "bold")[$O$])
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0), -0.3), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: rgb("dc2626"))
    content((pB.at(0) + 0.4, pB.at(1) + 0.2), [✈️ $B$])
  })
]
Tính độ lớn của vectơ độ dịch chuyển tổng hợp $vec(d) = vec(O B)$ của máy bay theo đơn vị kilômét (làm tròn kết quả đến hàng đơn vị).
(Cho biết $sqrt(37) approx 6.0828$)],
    [122],
    loigiai: [
        #step([Xác định góc trong của tam giác OAB])
        Máy bay đang bay theo hướng Đông (chiều từ $O$ đến $A$), sau đó rẽ một góc $60^circ$ sang hướng Đông - Bắc.
        Do đó góc kề bù trong tam giác $O A B$ tại đỉnh $A$ là:
        $ hat(O A B) = 180^circ - 60^circ = 120^circ $
        
        #step([Áp dụng định lý côsin tính độ dài OB])
        Trong tam giác $O A B$ có $O A = 80" km"$, $A B = 60" km"$ và $hat(O A B) = 120^circ$:
        $ O B^2 = O A^2 + A B^2 - 2 O A dot A B cos 120^circ $
        $ O B^2 = 80^2 + 60^2 - 2(80)(60)(-1/2) = 6400 + 3600 + 4800 = 14800 $
        $ => O B = sqrt(14800) = 20 sqrt(37) approx 20 dot 6.0828 = 121.655" km" $
        Làm tròn đến hàng đơn vị ta được $122" km"$.
    ]
)

] // end make-questions

#make-questions()
