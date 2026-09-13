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
  exam-title: "BÀI 7: CÁC KHÁI NIỆM MỞ ĐẦU VỀ VECTƠ (ĐỀ SỐ 1)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Khẳng định nào sau đây là đúng về định nghĩa vectơ?],
    (
        True([Vectơ là một đoạn thẳng có hướng (đã chỉ rõ điểm đầu và điểm cuối).]),
        [Vectơ là một đường thẳng không bị giới hạn về hai phía.],
        [Vectơ là một tia có gốc xác định và kéo dài vô tận.],
        [Vectơ là một đoạn thẳng không xác định hướng đi.]
    ),
    loigiai: [
        Theo định nghĩa trong SGK Toán 10: Vectơ là một đoạn thẳng có hướng, nghĩa là trong hai điểm mút của đoạn thẳng đã chỉ rõ điểm nào là điểm đầu, điểm nào là điểm cuối.
    ]
)

// TN 2
#tn([Cho hai điểm phân biệt $A$ và $B$. Vectơ có điểm đầu là $A$ và điểm cuối là $B$ được ký hiệu là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3, 0)
    line(pA, pB, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.5, 0.35), text(fill: rgb("1e40af"), weight: "bold", size: 9pt)[$vec(A B)$])
    circle(pA, radius: 2.2pt, fill: black)
    content((pA.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2.2pt, fill: black)
    content((pB.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$B$])
  })
]],
    (
        True([$vec(A B)$]),
        [$vec(B A)$],
        [$A B$],
        [$|vec(A B)|$]
    ),
    loigiai: [
        Vectơ có điểm đầu $A$ và điểm cuối $B$ được viết là $vec(A B)$ (điểm đầu viết trước, điểm cuối viết sau, có mũi tên phía trên).
    ]
)

// TN 3
#tn([Khẳng định nào sau đây là đúng về vectơ-không?],
    (
        True([Vectơ-không là vectơ có điểm đầu và điểm cuối trùng nhau, ký hiệu là $vec(0)$.]),
        [Vectơ-không có độ dài bằng $1$.],
        [Vectơ-không không cùng phương với bất kỳ vectơ nào.],
        [Điểm đầu và điểm cuối của vectơ-không luôn phân biệt.]
    ),
    loigiai: [
        Vectơ-không là vectơ có điểm đầu và điểm cuối trùng nhau, có độ dài bằng $0$, ký hiệu là $vec(0)$. Vectơ-không được quy ước cùng phương và cùng hướng với mọi vectơ.
    ]
)

// TN 4
#tn([Độ dài của vectơ $vec(A B)$ được hiểu là],
    (
        True([Khoảng cách giữa điểm đầu $A$ và điểm cuối $B$, ký hiệu là $|vec(A B)| = A B$.]),
        [Độ dài đường thẳng đi qua hai điểm $A$ và $B$.],
        [Khoảng cách từ gốc tọa độ đến điểm $A$.],
        [Số đo góc tạo bởi vectơ $vec(A B)$ và trục hoành.]
    ),
    loigiai: [
        Độ dài của vectơ $vec(A B)$ chính là độ dài đoạn thẳng $A B$ (khoảng cách giữa hai điểm $A$ và $B$), ký hiệu là $|vec(A B)| = A B$.
    ]
)

// TN 5
#tn([Đường thẳng đi qua điểm đầu và điểm cuối của vectơ $vec(A B)$ (với $A != B$) được gọi là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.8, 0)
    let pB = (2.6, 0)
    line((-0.5, 0), (3.8, 0), stroke: (paint: luma(140), dash: "dashed", thickness: 0.8pt))
    content((4.0, 0), text(fill: luma(100), size: 8pt)[$d$])
    line(pA, pB, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.7, 0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(A B)$])
    circle(pA, radius: 2pt, fill: black)
    content((pA.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((pB.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$B$])
  })
]],
    (
        True([Giá của vectơ $vec(A B)$]),
        [Độ dài của vectơ $vec(A B)$],
        [Phương sai của vectơ $vec(A B)$],
        [Hướng của vectơ $vec(A B)$]
    ),
    loigiai: [
        Đường thẳng đi qua điểm đầu và điểm cuối của vectơ được gọi là giá của vectơ đó.
    ]
)

// TN 6
#tn([Hai vectơ khác vectơ-không được gọi là cùng phương khi và chỉ khi
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.3, 0.9), (3.3, 0.9), stroke: (paint: luma(160), dash: "dashed"))
    line((0.3, 0.9), (2.5, 0.9), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.6pt + rgb("0d9488"))
    content((1.4, 1.2), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(a)$])
    
    line((-0.3, 0), (3.3, 0), stroke: (paint: luma(160), dash: "dashed"))
    line((0.8, 0), (2.8, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.6pt + rgb("1e40af"))
    content((1.8, -0.3), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(b)$])
  })
]],
    (
        True([Giá của chúng song song hoặc trùng nhau.]),
        [Giá của chúng vuông góc với nhau.],
        [Chúng có cùng độ dài và cùng điểm đầu.],
        [Giá của chúng cắt nhau tại một điểm duy nhất.]
    ),
    loigiai: [
        Hai vectơ được gọi là cùng phương nếu giá của chúng song song hoặc trùng nhau.
    ]
)

// TN 7
#tn([Mệnh đề nào sau đây là đúng?],
    (
        True([Hai vectơ cùng hướng thì luôn cùng phương.]),
        [Hai vectơ cùng phương thì luôn cùng hướng.],
        [Hai vectơ có cùng độ dài thì luôn bằng nhau.],
        [Hai vectơ ngược hướng thì không cùng phương.]
    ),
    loigiai: [
        Để xét hướng (cùng hướng hay ngược hướng), hai vectơ trước hết phải cùng phương. Do đó, hai vectơ cùng hướng thì luôn cùng phương. Ngược lại, hai vectơ cùng phương có thể cùng hướng hoặc ngược hướng.
    ]
)

// TN 8
#tn([Cho tam giác đều $A B C$ có cạnh bằng $5" cm"$. Độ dài của vectơ $vec(B C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.2)
    let pB = (0, 0)
    let pC = (3, 0)
    line(pA, pB, stroke: 0.8pt + luma(160))
    line(pA, pC, stroke: 0.8pt + luma(160))
    line(pB, pC, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.5, -0.35), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(B C)$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.45), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
  })
]],
    (
        True([$5" cm"$]),
        [$10" cm"$],
        [$5 sqrt(3)" cm"$],
        [$(5 sqrt(3)) / 2" cm"$]
    ),
    loigiai: [
        Độ dài vectơ $|vec(B C)| = B C = 5" cm"$.
    ]
)

// TN 9
#tn([Cho hình chữ nhật $A B C D$ có $A B = 6" cm"$ và $B C = 8" cm"$. Độ dài của vectơ $vec(A C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.8)
    let pB = (2.6, 1.8)
    let pC = (2.6, 0)
    let pD = (0, 0)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.6, 1.1), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(A C)$])
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
        True([$10" cm"$]),
        [$14" cm"$],
        [$2" cm"$],
        [$48" cm"$]
    ),
    loigiai: [
        Áp dụng định lý Pytago trong tam giác vuông $A B C$:
        $ A C = sqrt(A B^2 + B C^2) = sqrt(6^2 + 8^2) = sqrt(100) = 10" cm" $
        Do đó $|vec(A C)| = 10" cm"$.
    ]
)

// TN 10
#tn([Hai vectơ $vec(a)$ và $vec(b)$ được gọi là bằng nhau, ký hiệu $vec(a) = vec(b)$, khi và chỉ khi],
    (
        True([Chúng cùng hướng và có cùng độ dài.]),
        [Chúng cùng phương và có cùng độ dài.],
        [Chúng có cùng điểm đầu và cùng điểm cuối.],
        [Chúng ngược hướng nhưng có cùng độ dài.]
    ),
    loigiai: [
        Hai vectơ được gọi là bằng nhau nếu chúng cùng hướng và cùng độ dài.
    ]
)

// TN 11
#tn([Cho đoạn thẳng $A B$ có trung điểm là $I$. Khẳng định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pI = (1.8, 0)
    let pB = (3.6, 0)
    line(pA, pB, stroke: 0.8pt + luma(180))
    line(pI, (0.2, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    content((0.9, 0.35), text(fill: rgb("dc2626"), size: 8pt)[$vec(I A)$])
    line(pI, (3.4, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.6pt + rgb("1e40af"))
    content((2.7, 0.35), text(fill: rgb("1e40af"), size: 8pt)[$vec(I B)$])
    circle(pA, radius: 2pt, fill: black)
    content((pA.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pI, radius: 2pt, fill: black)
    content((pI.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$I$])
    circle(pB, radius: 2pt, fill: black)
    content((pB.at(0), -0.25), text(size: 8.5pt, weight: "bold")[$B$])
  })
]],
    (
        True([$vec(I A)$ và $vec(I B)$ là hai vectơ đối nhau.]),
        [$vec(I A) = vec(I B)$],
        [$vec(I A)$ và $vec(I B)$ là hai vectơ cùng hướng.],
        [$|vec(I A)| != |vec(I B)|$]
    ),
    loigiai: [
        Vì $I$ là trung điểm của $A B$ nên $I A = I B$ và hướng từ $I$ đến $A$ ngược với hướng từ $I$ đến $B$. Do đó $vec(I A)$ và $vec(I B)$ là hai vectơ đối nhau (ngược hướng và cùng độ dài).
    ]
)

// TN 12
#tn([Cho hình bình hành $A B C D$. Vectơ nào sau đây bằng vectơ $vec(A B)$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.5)
    let pB = (2.2, 1.5)
    let pD = (-0.8, 0)
    let pC = (1.4, 0)
    line(pA, pD, stroke: 0.8pt + luma(160))
    line(pB, pC, stroke: 0.8pt + luma(160))
    line(pA, pB, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.6pt + rgb("1e40af"))
    content((1.1, 1.8), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(A B)$])
    line(pD, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.6pt + rgb("dc2626"))
    content((0.3, -0.3), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(D C)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 1.5), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.4, 1.5), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((1.6, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-1.0, 0), text(size: 8.5pt, weight: "bold")[$D$])
  })
]],
    (
        True([$vec(D C)$]),
        [$vec(C D)$],
        [$vec(B A)$],
        [$vec(A D)$]
    ),
    loigiai: [
        Trong hình bình hành $A B C D$, hai đoạn thẳng $A B$ và $D C$ song song và bằng nhau. Chiều từ $A$ sang $B$ cùng chiều từ $D$ sang $C$, nên $vec(A B) = vec(D C)$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Cho hình vuông $A B C D$ tâm $O$ có cạnh bằng $a$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let a = 2.4
    let pA = (0, a)
    let pB = (a, a)
    let pC = (a, 0)
    let pD = (0, 0)
    let pO = (a/2, a/2)
    
    // Hình vuông và đường chéo
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("1e40af"))
    line(pA, pC, stroke: (paint: luma(120), dash: "dashed"))
    line(pB, pD, stroke: (paint: luma(120), dash: "dashed"))
    
    // Vectơ AB và DC nổi bật
    line(pA, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.5pt + rgb("dc2626"))
    line(pD, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.5pt + rgb("dc2626"))
    
    // Các đỉnh
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
    True([Hai vectơ $vec(A B)$ và $vec(D C)$ cùng phương và cùng hướng.]),
    True([$vec(A D) = vec(B C)$.]),
    True([Độ dài của vectơ $vec(A C)$ bằng $a sqrt(2)$.]),
    [Hai vectơ $vec(O A)$ và $vec(O C)$ bằng nhau.]
  ),
  loigiai: [
    #step([Xét tính cùng hướng của AB và DC])
    Đoạn thẳng $A B$ song song với $D C$, hướng từ $A$ đến $B$ cùng hướng từ $D$ đến $C$, nên $vec(A B)$ và $vec(D C)$ cùng phương và cùng hướng. Mệnh đề a ĐÚNG.

    #step([Xét hai vectơ AD và BC])
    Tứ giác $A B C D$ là hình vuông nên $A D = B C$ và $A D parallel B C$. Hướng từ $A$ đến $D$ cùng hướng từ $B$ đến $C$. Do đó $vec(A D) = vec(B C)$. Mệnh đề b ĐÚNG.

    #step([Tính độ dài vectơ AC])
    Tam giác $A B C$ vuông tại $B$ có $A B = B C = a$:
    $ |vec(A C)| = A C = sqrt(a^2 + a^2) = a sqrt(2) $
    Mệnh đề c ĐÚNG.

    #step([So sánh OA và OC])
    $O$ là giao điểm hai đường chéo nên $O$ là trung điểm của $A C$. Do đó hai vectơ $vec(O A)$ và $vec(O C)$ cùng độ dài nhưng ngược hướng nhau ($vec(O A) = - vec(O C)$). Hai vectơ ngược hướng thì không thể bằng nhau. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Cho hình bình hành $A B C D$ có tâm đối xứng $O$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3, 0)
    let pC = (4, 1.8)
    let pD = (1, 1.8)
    let pO = (2, 0.9)
    
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("0d9488"))
    line(pA, pC, stroke: (paint: luma(120), dash: "dashed"))
    line(pB, pD, stroke: (paint: luma(120), dash: "dashed"))
    
    // Mũi tên AB và DC
    line(pA, pB, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.5pt + rgb("1e40af"))
    line(pD, pC, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.5pt + rgb("1e40af"))
    
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) - 0.25, pA.at(1) - 0.2), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) + 0.25, pB.at(1) - 0.2), text(weight: "bold")[$B$])
    circle(pC, radius: 2.5pt, fill: black)
    content((pC.at(0) + 0.25, pC.at(1) + 0.2), text(weight: "bold")[$C$])
    circle(pD, radius: 2.5pt, fill: black)
    content((pD.at(0) - 0.25, pD.at(1) + 0.2), text(weight: "bold")[$D$])
    circle(pO, radius: 2pt, fill: black)
    content((pO.at(0) + 0.1, pO.at(1) - 0.3), text(weight: "bold")[$O$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ $vec(A B)$ và $vec(C D)$ cùng phương nhưng ngược hướng.]),
    True([$vec(A B) = vec(D C)$.]),
    True([Hai vectơ $vec(A O)$ và $vec(O C)$ bằng nhau: $vec(A O) = vec(O C)$.]),
    [Hai vectơ $vec(A C)$ và $vec(B D)$ luôn có cùng độ dài.]
  ),
  loigiai: [
    #step([Xét quan hệ giữa AB và CD])
    Vì $A B parallel C D$ nên $vec(A B)$ và $vec(C D)$ cùng phương. Chiều $A -> B$ từ trái sang phải, chiều $C -> D$ từ phải sang trái nên chúng ngược hướng. Mệnh đề a ĐÚNG.

    #step([Xét hai vectơ AB và DC])
    $A B parallel D C$ và $A B = D C$, chiều từ $A$ sang $B$ cùng chiều từ $D$ sang $C$, nên $vec(A B) = vec(D C)$. Mệnh đề b ĐÚNG.

    #step([Xét hai vectơ AO và OC])
    $O$ là trung điểm của $A C$, do đó tia $A O$ và tia $O C$ trùng nhau (cùng hướng) và đoạn $A O = O C$. Vậy $vec(A O) = vec(O C)$. Mệnh đề c ĐÚNG.

    #step([Độ dài hai đường chéo])
    Trong hình bình hành tổng quát, độ dài hai đường chéo $A C$ và $B D$ không bằng nhau (chỉ bằng nhau khi hình bình hành là hình chữ nhật hoặc hình vuông). Do đó $|vec(A C)|$ không nhất thiết bằng $|vec(B D)|$. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Robot)
#ds([Một robot tự hành xuất phát từ trạm điều khiển $O(0; 0)$ trên mặt sàn phẳng. Robot di chuyển theo vectơ $vec(d)_1 = vec(O A)$ đi về hướng Đông $4" m"$ đến điểm $A$, sau đó chuyển hướng đi theo vectơ $vec(d)_2 = vec(A B)$ về hướng Bắc $3" m"$ đến trạm nhận hàng $B$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.9
    let pO = (0, 0)
    let pA = (4 * sc, 0)
    let pB = (4 * sc, 3 * sc)
    
    // Hệ trục hướng la bàn
    line((-0.8, 0), (4.8, 0), stroke: 0.5pt + luma(160))
    line((0, -0.8), (0, 3.8), stroke: 0.5pt + luma(160))
    content((4.8, -0.3), [🧭 Đông])
    content((-0.4, 3.8), [Bắc])
    
    // Các vectơ di chuyển
    line(pO, pA, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.5pt + rgb("1e40af"))
    content((2 * sc, -0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(d)_1 (4" m")$])
    
    line(pA, pB, mark: (end: ">", fill: rgb("059669")), stroke: 1.5pt + rgb("059669"))
    content((4 * sc + 0.65, 1.5 * sc), text(fill: rgb("059669"), size: 8.5pt)[$vec(d)_2 (3" m")$])
    
    // Vectơ tổng hợp OB
    line(pO, pB, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.5pt + rgb("dc2626"))
    content((1.8 * sc, 1.8 * sc), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(d) = vec(O B)$])
    
    // Điểm và emoji
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.4, -0.3), [🎯 $O$])
    circle(pA, radius: 2.5pt, fill: black)
    content((4 * sc + 0.25, -0.25), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: rgb("dc2626"))
    content((4 * sc + 0.35, 3 * sc + 0.2), [🚗 $B$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ độ dịch chuyển thứ nhất $vec(d)_1$ có độ dài $|vec(d)_1| = 4" m"$.]),
    True([Hai vectơ $vec(d)_1$ và $vec(d)_2$ có giá vuông góc với nhau.]),
    True([Độ lớn của vectơ độ dịch chuyển tổng hợp $vec(d) = vec(O B)$ là $5" m"$.]),
    [Tổng quãng đường di chuyển của robot bằng độ lớn của vectơ độ dịch chuyển tổng hợp $|vec(d)|$.]
  ),
  loigiai: [
    #step([Độ dài vectơ dịch chuyển thứ nhất])
    Theo đề bài, robot đi từ $O$ đến $A$ đoạn $4" m"$, do đó $|vec(d)_1| = O A = 4" m"$. Mệnh đề a ĐÚNG.

    #step([Phương của hai vectơ])
    $vec(d)_1$ có phương Tây - Đông (nằm ngang), $vec(d)_2$ có phương Nam - Bắc (thẳng đứng). Do hai phương này vuông góc nhau nên giá của $vec(d)_1$ và $vec(d)_2$ vuông góc nhau. Mệnh đề b ĐÚNG.

    #step([Tính độ lớn vectơ dịch chuyển tổng hợp])
    Tam giác $O A B$ vuông tại $A$ có $O A = 4" m"$, $A B = 3" m"$. Áp dụng định lý Pytago:
    $ |vec(d)| = O B = sqrt(O A^2 + A B^2) = sqrt(4^2 + 3^2) = 5" m" $
    Mệnh đề c ĐÚNG.

    #step([So sánh quãng đường và độ lớn độ dịch chuyển])
    Tổng quãng đường robot đã lăn bánh là $s = O A + A B = 4 + 3 = 7" m"$.
    Trong khi độ lớn của vectơ độ dịch chuyển chỉ bằng $O B = 5" m"$. Do $s != |vec(d)|$, mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Hàng không)
#ds([Một chiếc máy bay phản lực đang bay theo phương nằm ngang từ Tây sang Đông với vận tốc riêng đối với không khí được biểu diễn bởi vectơ $vec(v)_1$ có độ lớn $600" km/h"$. Tại thời điểm đó, một luồng gió thổi cùng hướng từ Tây sang Đông với vận tốc biểu diễn bởi vectơ $vec(v)_2$ có độ lớn $50" km/h"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pA = (4.5, 0)
    let pB = (5.5, 0)
    
    // Trục hướng
    line((-0.5, 0), (6.5, 0), stroke: 0.5pt + luma(180))
    content((6.2, -0.4), [🧭 Đông])
    content((-0.4, -0.4), [Tây])
    
    // Vectơ vận tốc máy bay
    line(pO, pA, mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((2.2, 0.4), [✈️ $vec(v)_1 (600" km/h")$])
    
    // Vectơ vận tốc gió
    line(pA, pB, mark: (end: ">", fill: rgb("d97706")), stroke: 2pt + rgb("d97706"))
    content((5.0, 0.4), [💨 $vec(v)_2 (50" km/h")$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ $vec(v)_1$ và $vec(v)_2$ là hai vectơ cùng phương và cùng hướng.]),
    True([Vận tốc thực tế của máy bay đối với mặt đất có độ lớn là $650" km/h"$.]),
    True([Vectơ vận tốc thực tế của máy bay đối với mặt đất cùng hướng với vectơ $vec(v)_1$.]),
    [Nếu luồng gió đổi hướng thổi ngược chiều (từ Đông sang Tây) với vận tốc $50" km/h"$ thì tốc độ của máy bay so với mặt đất vẫn giữ nguyên.]
  ),
  loigiai: [
    #step([Phương và hướng của hai vectơ vận tốc])
    Cả máy bay và gió đều di chuyển theo phương nằm ngang từ Tây sang Đông, nên $vec(v)_1$ và $vec(v)_2$ cùng phương và cùng hướng. Mệnh đề a ĐÚNG.

    #step([Tính tốc độ thực tế so với mặt đất khi cùng hướng])
    Vì máy bay bay xuôi theo chiều gió nên vận tốc của máy bay so với mặt đất bằng tổng hai độ lớn:
    $ v = v_1 + v_2 = 600 + 50 = 650" km/h" $
    Mệnh đề b ĐÚNG.

    #step([Hướng của vectơ vận tốc tổng hợp])
    Do hai vectơ thành phần cùng hướng từ Tây sang Đông nên vectơ vận tốc tổng hợp cũng có hướng từ Tây sang Đông (cùng hướng với $vec(v)_1$). Mệnh đề c ĐÚNG.

    #step([Xét trường hợp gió thổi ngược chiều])
    Khi gió thổi ngược chiều (ngược gió), vận tốc thực tế của máy bay đối với mặt đất sẽ giảm đi:
    $ v' = v_1 - v_2 = 600 - 50 = 550" km/h" < 650" km/h" $
    Do tốc độ bị giảm từ $650" km/h"$ xuống $550" km/h"$ nên mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho $4$ điểm phân biệt $A, B, C, D$ trên một mặt phẳng, trong đó không có ba điểm nào thẳng hàng. Hỏi có bao nhiêu vectơ khác vectơ-không có điểm đầu và điểm cuối là hai trong số bốn điểm đã cho?],
    [12],
    loigiai: [
        #step([Tính số lượng vectơ theo quy tắc chỉnh hợp])
        Mỗi vectơ khác $vec(0)$ được xác định bởi một cặp điểm $(X, Y)$ có thứ tự (với $X != Y$), trong đó $X$ là điểm đầu và $Y$ là điểm cuối.
        Số lượng vectơ thỏa mãn chính là số chỉnh hợp chập $2$ của $4$ phần tử:
        $ A_4^2 = 4 dot 3 = 12 $
        Cụ thể các vectơ đó là: $vec(A B), vec(B A), vec(A C), vec(C A), vec(A D), vec(D A), vec(B C), vec(C B), vec(B D), vec(D B), vec(C D), vec(D C)$.
    ]
)

// TLN 2 (Câu 18)
#tln([Cho tam giác $A B C$ vuông tại $A$ có cạnh góc vuông $A B = 6" cm"$ và $A C = 8" cm"$. Gọi $M$ là trung điểm của cạnh huyền $B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.2, 0)
    let pC = (0, 2.6)
    let pM = (1.1, 1.3)
    line((0.3, 0), (0.3, 0.3), (0, 0.3), stroke: 0.7pt + black)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((0.4, 0.85), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(A M)$])
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
Tính độ dài của vectơ $vec(A M)$ theo đơn vị centimét.],
    [5],
    loigiai: [
        #step([Tính cạnh huyền BC])
        Áp dụng định lý Pytago trong tam giác vuông $A B C$:
        $ B C = sqrt(A B^2 + A C^2) = sqrt(6^2 + 8^2) = sqrt(36 + 64) = sqrt(100) = 10" cm" $
        
        #step([Tính độ dài trung tuyến AM])
        Trong tam giác vuông, đường trung tuyến ứng với cạnh huyền bằng một nửa độ dài cạnh huyền:
        $ A M = (B C) / 2 = 10 / 2 = 5" cm" $
        Do đó độ dài vectơ là $|vec(A M)| = A M = 5" cm"$.
    ]
)

// TLN 3 (Câu 19)
#tln([Cho hình thoi $A B C D$ có cạnh bằng $10" cm"$ và góc $hat(B A D) = 60^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2, 0)
    let pD = (1, 1.732)
    let pC = (3, 1.732)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pB, pD, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.8, 0.9), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(B D)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 1.73), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0.8, 1.8), text(size: 8.5pt, weight: "bold")[$D$])
  })
]
Tính độ dài của vectơ $vec(B D)$ theo đơn vị centimét.],
    [10],
    loigiai: [
        #step([Xác định tính chất tam giác ABD])
        Hình thoi $A B C D$ có $A B = A D = 10" cm"$, suy ra tam giác $A B D$ cân tại $A$.
        Lại có góc ở đỉnh $hat(B A D) = 60^circ$, do đó tam giác $A B D$ là tam giác đều.
        
        #step([Suy ra độ dài BD])
        Vì tam giác $A B D$ đều nên $B D = A B = 10" cm"$.
        Vậy $|vec(B D)| = B D = 10" cm"$.
    ]
)

// TLN 4 (Câu 20)
#tln([Cho hình vuông $A B C D$ có cạnh bằng $4" cm"$. Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$.
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
    line(pA, pC, stroke: (paint: luma(180), dash: "dashed"))
    line(pB, pD, stroke: (paint: luma(180), dash: "dashed"))
    line(pO, pA, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((0.35, 1.6), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(O A)$])
    circle(pO, radius: 2pt, fill: black)
    content((1.2, 0.85), text(size: 8pt, weight: "bold")[$O$])
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
Tính độ dài của vectơ $vec(O A)$ theo centimét (làm tròn kết quả đến chữ số thập phân thứ nhất).
(Cho biết $sqrt(2) approx 1.414$)],
    [2.8],
    loigiai: [
        #step([Tính độ dài đường chéo AC])
        Độ dài đường chéo hình vuông cạnh $a = 4" cm"$ là:
        $ A C = 4 sqrt(2)" cm" $
        
        #step([Tính độ dài đoạn OA])
        Vì $O$ là tâm hình vuông nên $O$ là trung điểm của đường chéo $A C$:
        $ O A = (A C) / 2 = (4 sqrt(2)) / 2 = 2 sqrt(2) approx 2 dot 1.414 = 2.828" cm" $
        Làm tròn đến chữ số thập phân thứ nhất ta được $2.8" cm"$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Cơ học Lực)
#tln([Một kiện hàng đặt trên mặt đất chịu tác dụng đồng thời của hai lực kéo $vec(F)_1$ và $vec(F)_2$ cùng đặt tại điểm $O$. Biết hai lực này có phương vuông góc với nhau và độ lớn lần lượt là $F_1 = 30" N"$, $F_2 = 40" N"$.
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
    
    // Các vectơ lực
    line(pO, p1, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.5, -0.35), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_1 (30" N")$])
    
    line(pO, p2, mark: (end: ">", fill: rgb("059669")), stroke: 1.8pt + rgb("059669"))
    content((-0.8, 2), text(fill: rgb("059669"), size: 8.5pt)[$vec(F)_2 (40" N")$])
    
    line(pO, pF, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.8, 2.3), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(F) = vec(F)_1 + vec(F)_2$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.3, -0.3), [📦 $O$])
  })
]
Tính độ lớn của hợp lực $vec(F) = vec(F)_1 + vec(F)_2$ tác dụng lên kiện hàng theo đơn vị Newton.],
    [50],
    loigiai: [
        #step([Quy tắc hình bình hành cho hai lực vuông góc])
        Theo quy tắc hình bình hành, hợp lực $vec(F) = vec(F)_1 + vec(F)_2$ là đường chéo của hình chữ nhật có hai cạnh kề là $F_1 = 30" N"$ và $F_2 = 40" N"$.
        
        #step([Tính độ lớn hợp lực])
        Độ lớn hợp lực là:
        $ F = |vec(F)| = sqrt(F_1^2 + F_2^2) = sqrt(30^2 + 40^2) = sqrt(900 + 1600) = sqrt(2500) = 50" N" $
    ]
)

// TLN 6 (Câu 22 - Vận dụng cao Thực tế Cano trên sông)
#tln([Một chiếc cano chuyển động thẳng đều từ bờ bên này sang bờ bên kia của một con sông. Vận tốc của cano đối với dòng nước được biểu diễn bởi vectơ $vec(v)_c$ vuông góc với bờ sông và có độ lớn bằng $12" km/h"$. Vận tốc của dòng nước chảy xuôi bờ được biểu diễn bởi vectơ $vec(v)_n$ có độ lớn bằng $5" km/h"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pC = (0, 3.6)
    let pN = (2, 0)
    let pV = (2, 3.6)
    
    // Hai bờ sông
    line((-1, 0), (3.5, 0), stroke: 1.5pt + rgb("0284c7"))
    line((-1, 3.6), (3.5, 3.6), stroke: 1.5pt + rgb("0284c7"))
    content((3.2, -0.3), text(fill: rgb("0284c7"), size: 8pt)[Bờ xuất phát])
    content((3.2, 3.9), text(fill: rgb("0284c7"), size: 8pt)[Bờ bên kia])
    content((-0.6, 1.8), [🌊])
    
    // Hình bình hành vận tốc
    line(pC, pV, stroke: (paint: luma(140), dash: "dashed"))
    line(pN, pV, stroke: (paint: luma(140), dash: "dashed"))
    
    // Vectơ vận tốc cano vc
    line(pO, pC, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((-0.9, 1.8), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(v)_c (12" km/h")$])
    
    // Vectơ vận tốc dòng nước vn
    line(pO, pN, mark: (end: ">", fill: rgb("059669")), stroke: 1.8pt + rgb("059669"))
    content((1, -0.35), text(fill: rgb("059669"), size: 8.5pt)[$vec(v)_n (5" km/h")$])
    
    // Vectơ vận tốc thực tế v
    line(pO, pV, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.6, 1.8), text(fill: rgb("dc2626"), weight: "bold", size: 9pt)[$vec(v) = vec(v)_c + vec(v)_n$])
    
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.3, -0.3), [⛵ $O$])
  })
]
Vận tốc thực tế của cano đối với bờ sông là $vec(v) = vec(v)_c + vec(v)_n$. Tính tốc độ thực tế của cano đối với bờ sông theo đơn vị km/h.],
    [13],
    loigiai: [
        #step([Mô hình hóa hình học vectơ vận tốc])
        Vectơ vận tốc của cano đối với bờ là tổng hợp của hai chuyển động:
        $ vec(v) = vec(v)_c + vec(v)_n $
        Trong đó vectơ vận tốc cano $vec(v)_c$ vuông góc với dòng chảy, vectơ vận tốc dòng nước $vec(v)_n$ song song với bờ sông.
        Do đó $vec(v)_c perp vec(v)_n$.

        #step([Tính độ lớn vectơ vận tốc thực tế])
        Độ lớn của vectơ vận tốc thực tế là:
        $ v = |vec(v)| = sqrt(v_c^2 + v_n^2) = sqrt(12^2 + 5^2) = sqrt(144 + 25) = sqrt(169) = 13" km/h" $
        Vậy tốc độ thực tế của cano so với bờ sông là $13" km/h"$.
    ]
)

] // end make-questions

#make-questions()
