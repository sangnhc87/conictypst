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
  exam-title: "BÀI 10: VECTƠ TRONG MẶT PHẲNG TỌA ĐỘ (ĐỀ SỐ 3)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "112",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong mặt phẳng tọa độ $O x y$, cho điểm $M(3; -5)$. Tọa độ của điểm $M'$ đối xứng với điểm $M$ qua trục hoành $O x$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.2, 0), text(size: 8pt)[$x$])
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 2.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pM = (2.2, -1.8)
    let pM1 = (2.2, 1.8)
    line(pM, pM1, stroke: (paint: luma(160), dash: "dashed"))
    circle(pM, radius: 2pt, fill: black)
    content((2.5, -2.0), text(size: 8pt)[$M(3; -5)$])
    circle(pM1, radius: 2pt, fill: rgb("d97706"))
    content((2.5, 2.0), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$M'$])
  })
]],
    (
        True([$M'(3; 5)$]),
        [$M'(-3; -5)$],
        [$M'(-3; 5)$],
        [$M'(5; -3)$]
    ),
    loigiai: [
        Điểm đối xứng của điểm $M(x; y)$ qua trục hoành $O x$ giữ nguyên hoành độ và đổi dấu tung độ: $M'(x; -y)$.
        Với $M(3; -5)$, suy ra $M'(3; 5)$.
    ]
)

// TN 2
#tn([Trong mặt phẳng tọa độ $O x y$, cho điểm $N(-2; 7)$. Tọa độ của điểm $N'$ đối xứng với điểm $N$ qua trục tung $O y$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((2.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((0.2, -0.2), text(size: 8pt)[$O$])
    
    let pN = (-1.5, 2.5)
    let pN1 = (1.5, 2.5)
    line(pN, pN1, stroke: (paint: luma(160), dash: "dashed"))
    circle(pN, radius: 2pt, fill: black)
    content((-1.7, 2.7), text(size: 8pt)[$N(-2; 7)$])
    circle(pN1, radius: 2pt, fill: rgb("d97706"))
    content((1.7, 2.7), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$N'$])
  })
]],
    (
        True([$N'(2; 7)$]),
        [$N'(-2; -7)$],
        [$N'(2; -7)$],
        [$N'(7; -2)$]
    ),
    loigiai: [
        Điểm đối xứng của điểm $N(x; y)$ qua trục tung $O y$ đổi dấu hoành độ và giữ nguyên tung độ: $N'(-x; y)$.
        Với $N(-2; 7)$, suy ra $N'(2; 7)$.
    ]
)

// TN 3
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 3)$ và $B(5; -1)$. Điểm $M$ thỏa mãn hệ thức vectơ $vec(M A) + 3 vec(M B) = vec(0)$. Tọa độ của điểm $M$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.2, 0), text(size: 8pt)[$x$])
    line((0, -1.5), (0, 3.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (0.8, 2.2)
    let pM = (3.2, 0)
    let pB = (4.0, -0.7)
    line(pA, pB, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.8, 2.5), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((4.2, -0.9), text(size: 8pt)[$B$])
    circle(pM, radius: 2.5pt, fill: rgb("d97706"))
    content((3.2, 0.35), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$M$])
  })
]],
    (
        True([$M(4; 0)$]),
        [$M(3; 1)$],
        [$M(2; 2)$],
        [$M(0; 4)$]
    ),
    loigiai: [
        Từ đẳng thức $vec(M A) + 3 vec(M B) = vec(0)$, chuyển gốc về tọa độ:
        $ x_M = (x_A + 3 x_B) / (1 + 3) = (1 + 3 dot 5) / 4 = 16 / 4 = 4 $
        $ y_M = (y_A + 3 y_B) / (1 + 3) = (3 + 3 dot (-1)) / 4 = 0 / 4 = 0 $
        Vậy $M(4; 0)$.
    ]
)

// TN 4
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có $A(1; 4), B(-2; 2)$ và $C(4; 0)$. Điểm $M$ thuộc trục hoành $O x$ sao cho độ dài của vectơ tổng $vec(v) = vec(M A) + vec(M B) + vec(M C)$ đạt giá trị nhỏ nhất. Tọa độ của điểm $M$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.8), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.0), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pG = (1.0, 1.8)
    let pM = (1.0, 0)
    circle(pG, radius: 2pt, fill: black)
    content((1.3, 1.8), text(size: 8pt)[$G(1; 2)$])
    line(pG, pM, stroke: (paint: rgb("d97706"), dash: "dashed", thickness: 1.2pt))
    circle(pM, radius: 2.5pt, fill: rgb("d97706"))
    content((1.0, -0.35), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$M(1; 0)$])
  })
]],
    (
        True([$M(1; 0)$]),
        [$M(0; 2)$],
        [$M(3; 0)$],
        [$M(0; 0)$]
    ),
    loigiai: [
        Gọi $G$ là trọng tâm của tam giác $A B C$:
        $ x_G = (1 + (-2) + 4) / 3 = 1, quad y_G = (4 + 2 + 0) / 3 = 2 => G(1; 2) $
        Ta có $vec(M A) + vec(M B) + vec(M C) = 3 vec(M G)$.
        Độ dài: $|vec(v)| = 3 M G$.
        Vì $M in O x$ nên $M G$ nhỏ nhất khi $M$ là hình chiếu vuông góc của $G$ lên trục hoành $O x$, suy ra $M(1; 0)$.
    ]
)

// TN 5
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(2; 1)$ và $B(4; 3), C(6; -1)$. Điểm $D$ nằm trên trục tung $O y$ sao cho hai vectơ $vec(A D)$ và $vec(B C)$ cùng phương với nhau. Tọa độ của điểm $D$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -1.0), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.5, 0.8)
    let pD = (0, 3.5)
    line(pA, pD, mark: (end: ">", fill: rgb("d97706")), stroke: 1.5pt + rgb("d97706"))
    circle(pA, radius: 2pt, fill: black)
    content((1.7, 0.6), text(size: 8pt)[$A$])
    circle(pD, radius: 2.5pt, fill: rgb("d97706"))
    content((-0.3, 3.5), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$D$])
  })
]],
    (
        True([$D(0; 5)$]),
        [$D(0; 3)$],
        [$D(0; -5)$],
        [$D(5; 0)$]
    ),
    loigiai: [
        Vì $D in O y$ nên $D(0; y)$.
        $vec(A D) = (0 - 2; y - 1) = (-2; y - 1)$.
        $vec(B C) = (6 - 4; -1 - 3) = (2; -4)$.
        Hai vectơ cùng phương khi và chỉ khi:
        $ (-2) / 2 = (y - 1) / (-4) <=> -1 = (y - 1) / (-4) <=> y - 1 = 4 <=> y = 5 $
        Vậy $D(0; 5)$.
    ]
)

// TN 6
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(2; 3)$ và $B(6; 7)$. Tọa độ của điểm $A'$ đối xứng với $A$ qua điểm $B$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.5)
    let pB = (2.0, 1.8)
    let pA1 = (3.5, 3.1)
    line(pA, pA1, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.5, 0.2), text(size: 8pt)[$A(2; 3)$])
    circle(pB, radius: 2pt, fill: black)
    content((2.0, 1.5), text(size: 8pt)[$B(6; 7)$])
    circle(pA1, radius: 2.5pt, fill: rgb("d97706"))
    content((3.5, 2.8), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$A'$])
  })
]],
    (
        True([$A'(10; 11)$]),
        [$A'(4; 4)$],
        [$A'(8; 10)$],
        [$A'(14; 17)$]
    ),
    loigiai: [
        $A'$ đối xứng với $A$ qua $B$ nghĩa là $B$ là trung điểm của đoạn thẳng $A A'$:
        $ x_{A'} = 2 x_B - x_A = 2 dot 6 - 2 = 10 $
        $ y_{A'} = 2 y_B - y_A = 2 dot 7 - 3 = 11 $
        Vậy $A'(10; 11)$.
    ]
)

// TN 7
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh $A(0; 0), B(6; 0)$ và $C(0; 8)$. Tọa độ tâm đường tròn ngoại tiếp của tam giác $A B C$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    
    let pB = (3.0, 0)
    let pC = (0, 3.5)
    let pI = (1.5, 1.75)
    line((0, 0), pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pI, radius: 2pt, fill: rgb("d97706"))
    content((1.8, 1.95), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$I$])
    circle(pB, radius: 2pt, fill: black)
    content((3.0, -0.3), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((-0.3, 3.5), text(size: 8pt)[$C$])
  })
]],
    (
        True([$I(3; 4)$]),
        [$I(2; 8/3)$],
        [$I(6; 8)$],
        [$I(0; 4)$]
    ),
    loigiai: [
        Tam giác $A B C$ vuông tại $A(0; 0)$ do hai đỉnh $B in O x, C in O y$.
        Tâm đường tròn ngoại tiếp tam giác vuông là trung điểm của cạnh huyền $B C$:
        $ x_I = (6 + 0) / 2 = 3, quad y_I = (0 + 8) / 2 = 4 $
        Vậy $I(3; 4)$.
    ]
)

// TN 8
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(u) = (2; -1)$ và $vec(v) = (x; 3)$. Độ dài của vectơ tổng $vec(u) + vec(v)$ đạt giá trị nhỏ nhất khi $x$ bằng],
    (
        True([$x = -2$]),
        [$x = 2$],
        [$x = 0$],
        [$x = -1$]
    ),
    loigiai: [
        $vec(u) + vec(v) = (x + 2; 2)$.
        Độ dài:
        $ |vec(u) + vec(v)| = sqrt((x + 2)^2 + 2^2) = sqrt((x + 2)^2 + 4) >= sqrt(4) = 2 $
        Dấu bằng xảy ra khi $(x + 2)^2 = 0 <=> x = -2$.
    ]
)

// TN 9
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có $A(1; 1), B(5; 1)$ và $C(1; 4)$. Bán kính đường tròn ngoại tiếp của tam giác $A B C$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.5)
    let pB = (3.5, 0.5)
    let pC = (0.5, 2.8)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.2, 0.4), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.7, 0.5), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0.5, 3.1), text(size: 8pt)[$C$])
  })
]],
    (
        True([$2.5$]),
        [$5$],
        [$3.5$],
        [$2$]
    ),
    loigiai: [
        $A B parallel O x$ và $A C parallel O y$ nên tam giác $A B C$ vuông tại $A$.
        Độ dài hai cạnh góc vuông: $A B = 5 - 1 = 4$ và $A C = 4 - 1 = 3$.
        Cạnh huyền $B C = sqrt(4^2 + 3^2) = 5$.
        Bán kính đường tròn ngoại tiếp: $R = (B C) / 2 = 5 / 2 = 2.5$.
    ]
)

// TN 10
#tn([Trong mặt phẳng tọa độ $O x y$, cho hình chữ nhật $A B C D$ có ba đỉnh $A(0; 0), B(a; 0), D(0; b)$ với $a, b > 0$. Tọa độ đỉnh $C$ là],
    (
        True([$C(a; b)$]),
        [$C(b; a)$],
        [$C(a; -b)$],
        [$C(-a; b)$]
    ),
    loigiai: [
        Trong hình chữ nhật $A B C D$, theo quy tắc hình bình hành:
        $ vec(A C) = vec(A B) + vec(A D) = (a; 0) + (0; b) = (a; b) $
        Vì $A(0; 0)$ nên tọa độ đỉnh $C$ là $(a; b)$.
    ]
)

// TN 11
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có trọng tâm là $G$. Với điểm $M$ tùy ý trong mặt phẳng, vectơ $vec(v) = 2 vec(M A) + 2 vec(M B) + 2 vec(M C)$ luôn bằng],
    (
        True([$6 vec(M G)$]),
        [$3 vec(M G)$],
        [$2 vec(M G)$],
        [$vec(0)$]
    ),
    loigiai: [
        Đặt thừa số chung:
        $ vec(v) = 2(vec(M A) + vec(M B) + vec(M C)) = 2(3 vec(M G)) = 6 vec(M G) $
    ]
)

// TN 12
#tn([Trong mặt phẳng tọa độ $O x y$, khoảng cách từ điểm $M(x_0; y_0)$ đến trục hoành $O x$ được tính bằng công thức],
    (
        True([$|y_0|$]),
        [$|x_0|$]),
        [$x_0$],
        [$y_0$]
    ),
    loigiai: [
        Hình chiếu vuông góc của điểm $M(x_0; y_0)$ lên trục hoành $O x$ là điểm $H(x_0; 0)$.
        Khoảng cách: $M H = sqrt((x_0 - x_0)^2 + (0 - y_0)^2) = sqrt(y_0^2) = |y_0|$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Tâm tỉ cự ba điểm)
#ds([Trong mặt phẳng tọa độ $O x y$, cho ba điểm $A(1; 2), B(-2; 5)$ và $C(4; 1)$. Điểm $I$ trong mặt phẳng thỏa mãn hệ thức vectơ: $2 vec(I A) + 3 vec(I B) - vec(I C) = vec(0)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (0.8, 1.4)
    let pB = (-1.5, 3.5)
    let pC = (3.0, 0.7)
    let pI = (-1.5, 3.1)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    circle(pA, radius: 2pt, fill: black)
    content((0.8, 1.1), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-1.5, 3.8), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, 0.7), text(size: 8pt)[$C$])
    circle(pI, radius: 2.5pt, fill: rgb("d97706"))
    content((-1.8, 3.0), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$I$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng các hệ số của hệ thức tâm tỉ cự bằng $2 + 3 - 1 = 4 != 0$, do đó điểm $I$ tồn tại duy nhất.]),
    True([Hoành độ của điểm $I$ được tính là $x_I = (2 x_A + 3 x_B - x_C) / 4 = -2$.]),
    True([Tung độ của điểm $I$ được tính là $y_I = (2 y_A + 3 y_B - y_C) / 4 = 4.5$.]),
    [Tọa độ điểm $I$ thỏa mãn hệ thức là $I(2; -4.5)$.]
  ),
  loigiai: [
    #step([Tính duy nhất của điểm tâm tỉ cự])
    Vì $2 + 3 - 1 = 4 != 0$ nên điểm $I$ tồn tại và là duy nhất. Mệnh đề a ĐÚNG.

    #step([Tính hoành độ xI])
    $ x_I = (2 dot 1 + 3 dot (-2) - 4) / 4 = (2 - 6 - 4) / 4 = -8 / 4 = -2 $
    Mệnh đề b ĐÚNG.

    #step([Tính tung độ yI])
    $ y_I = (2 dot 2 + 3 dot 5 - 1) / 4 = (4 + 15 - 1) / 4 = 18 / 4 = 4.5 $
    Mệnh đề c ĐÚNG.

    #step([Kết luận tọa độ điểm I])
    Tọa độ đúng là $I(-2; 4.5)$ chứ không phải $I(2; -4.5)$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Điểm di động trên trục tọa độ & Cực trị)
#ds([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 4)$ và $B(5; 2)$. Điểm $M(x; 0)$ di động trên trục hoành $O x$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.0, 3.2)
    let pB = (4.5, 1.6)
    let pK = (2.75, 2.4)
    let pM = (2.75, 0)
    line(pA, pB, stroke: 1pt + luma(160))
    circle(pK, radius: 2pt, fill: black)
    content((3.0, 2.6), text(size: 8pt)[$K(3; 3)$])
    line(pK, pM, stroke: (paint: rgb("d97706"), dash: "dashed", thickness: 1.2pt))
    circle(pM, radius: 2.5pt, fill: rgb("d97706"))
    content((2.75, -0.35), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$M$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Trung điểm của đoạn thẳng $A B$ có tọa độ là $K(3; 3)$.]),
    True([Với mọi điểm $M$, ta luôn có hệ thức vectơ: $vec(M A) + vec(M B) = 2 vec(M K)$.]),
    True([Độ dài của vectơ tổng $|vec(M A) + vec(M B)|$ nhỏ nhất khi $M$ có tọa độ $M(3; 0)$.]),
    [Giá trị nhỏ nhất của độ dài vectơ tổng $|vec(M A) + vec(M B)|$ bằng đúng $3$.]
  ),
  loigiai: [
    #step([Tọa độ trung điểm K])
    $x_K = (1 + 5)/2 = 3, quad y_K = (4 + 2)/2 = 3 => K(3; 3)$. Mệnh đề a ĐÚNG.

    #step([Hệ thức trung điểm])
    $vec(M A) + vec(M B) = 2 vec(M K)$. Mệnh đề b ĐÚNG.

    #step([Tìm vị trí M trên Ox để độ dài nhỏ nhất])
    Độ dài: $|vec(M A) + vec(M B)| = 2 M K$.
    Vì $M(x; 0) in O x$ nên $M K$ nhỏ nhất khi $M$ là hình chiếu của $K(3; 3)$ lên trục $O x$, suy ra $M(3; 0)$. Mệnh đề c ĐÚNG.

    #step([Tính giá trị nhỏ nhất])
    Khi $M(3; 0)$, khoảng cách $M K = |y_K| = 3$.
    Do đó giá trị nhỏ nhất của $2 M K = 2 dot 3 = 6$ chứ không phải $3$. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Trạm bơm tưới tiêu bờ kênh Heron)
#ds([Một tuyến kênh thủy lợi thẳng tắp trong vùng chuyên canh nông nghiệp được mô hình hóa bằng trục hoành $O x$ (đơn vị: kilômét). Hai trang trại lớn nằm cùng một phía bờ kênh tại hai tọa độ $A(2; 3)$ và $B(8; 5)$. Ban điều hành dự án cần xây dựng một trạm bơm nước tập trung tại điểm $M(x; 0)$ trên bờ kênh để dẫn nước tưới tiêu về hai trang trại.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Bờ kênh Ox
    line((-0.5, 0), (6.0, 0), stroke: 2pt + rgb("0284c7"))
    line((-0.5, 0), (6.0, 0), stroke: (paint: white, dash: "dashed", thickness: 0.8pt))
    content((5.8, -0.35), text(fill: rgb("0284c7"), size: 8pt)[Kênh $O x$])
    
    let pA = (1.2, 1.8)
    let pB = (4.8, 3.0)
    let pA1 = (1.2, -1.8)
    let pM = (2.55, 0)
    
    line(pA1, pB, stroke: 1.2pt + rgb("d97706"))
    line(pA, pM, stroke: 1pt + luma(160))
    circle(pA, radius: 2.5pt, fill: black)
    content(pA, [🌾 $A(2; 3)$], anchor: "south-east")
    circle(pB, radius: 2.5pt, fill: black)
    content(pB, [🚜 $B(8; 5)$], anchor: "south-east")
    circle(pA1, radius: 2pt, fill: luma(120))
    content(pA1, [$A'(2; -3)$], anchor: "north-east")
    circle(pM, radius: 3pt, fill: rgb("dc2626"))
    content(pM, [🌊 $M$], anchor: "north-west")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điểm đối xứng của trang trại $A(2; 3)$ qua bờ kênh (trục $O x$) là $A'(2; -3)$.]),
    True([Tổng chiều dài đường ống dẫn nước từ trạm bơm về hai trang trại thỏa mãn: $M A + M B = M A' + M B >= A' B$.]),
    True([Tổng chiều dài đường ống ngắn nhất khi và chỉ khi ba điểm $A', M, B$ thẳng hàng.]),
    [Tổng chiều dài đường ống dẫn nước ngắn nhất đúng bằng $8" km"$.]
  ),
  loigiai: [
    #step([Tọa độ điểm đối xứng])
    Đối xứng của $A(2; 3)$ qua trục hoành $O x$ là $A'(2; -3)$. Mệnh đề a ĐÚNG.

    #step([Bất đẳng thức tam giác cho độ dài đường ống])
    Vì $M in O x$ nên $M A = M A'$.
    Do đó tổng chiều dài đường ống: $L = M A + M B = M A' + M B >= A' B$. Mệnh đề b ĐÚNG.

    #step([Điều kiện đạt cực tiểu])
    Dấu bằng xảy ra khi điểm $M$ là giao điểm của đoạn thẳng $A' B$ với trục hoành $O x$, tức là ba điểm $A', M, B$ thẳng hàng. Mệnh đề c ĐÚNG.

    #step([Tính độ dài ngắn nhất])
    $ A' B = sqrt((8 - 2)^2 + (5 - (-3))^2) = sqrt(6^2 + 8^2) = sqrt(36 + 64) = sqrt(100) = 10" km" $
    Giá trị ngắn nhất là $10" km"$ chứ không phải $8" km"$. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Định vị tâm chấn động đất)
#ds([Ba trạm quan trắc địa chấn tự động ven biển đặt tại ba vị trí có tọa độ $S_1(0; 0), S_2(6; 0)$ và $S_3(0; 8)$ (hệ tọa độ $O x y$, đơn vị: kilômét). Một trận động đất bất ngờ xảy ra ngoài khơi, sóng sơ cấp truyền đến cả ba trạm quan trắc cùng một thời điểm, chứng tỏ tâm chấn $E$ cách đều cả ba trạm quan trắc địa chấn này.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y$])
    content((-0.3, -0.3), [📡 $S_1$])
    
    let pS2 = (3.0, 0)
    let pS3 = (0, 3.5)
    let pE = (1.5, 1.75)
    line((0, 0), pS2, pS3, close: true, stroke: 1.2pt + rgb("0d9488"))
    content(pS2, [📡 $S_2$], anchor: "north")
    content(pS3, [📡 $S_3$], anchor: "east")
    circle(pE, radius: 3pt, fill: rgb("dc2626"))
    content(pE, [🌋 $E$], anchor: "south-west")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tam giác $S_1 S_2 S_3$ là tam giác vuông tại trạm $S_1(0; 0)$.]),
    True([Khoảng cách giữa hai trạm $S_2$ và $S_3$ bằng $10" km"$.]),
    True([Tâm chấn động đất $E$ là tâm đường tròn ngoại tiếp tam giác $S_1 S_2 S_3$, có tọa độ là $E(3; 4)$.]),
    [Khoảng cách từ tâm chấn $E$ đến trạm quan trắc $S_1$ bằng $10" km"$.]
  ),
  loigiai: [
    #step([Tính chất hình học của tam giác trạm])
    $S_1(0; 0) equiv O$, $S_2(6; 0) in O x$, $S_3(0; 8) in O y$.
    Do hai trục tọa độ vuông góc nên tam giác $S_1 S_2 S_3$ vuông tại $S_1$. Mệnh đề a ĐÚNG.

    #step([Tính độ dài cạnh huyền S2S3])
    $ S_2 S_3 = sqrt((6 - 0)^2 + (0 - 8)^2) = sqrt(36 + 64) = 10" km" $
    Mệnh đề b ĐÚNG.

    #step([Tọa độ tâm chấn E])
    Tâm chấn $E$ cách đều ba đỉnh nên $E$ là tâm đường tròn ngoại tiếp tam giác vuông $S_1 S_2 S_3$, tức trung điểm cạnh huyền $S_2 S_3$:
    $ x_E = (6 + 0) / 2 = 3, quad y_E = (0 + 8) / 2 = 4 => E(3; 4) $
    Mệnh đề c ĐÚNG.

    #step([Khoảng cách từ E đến S1])
    Khoảng cách bằng bán kính đường tròn ngoại tiếp:
    $ E S_1 = R = (S_2 S_3) / 2 = 10 / 2 = 5" km" != 10" km" $
    Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 2)$ và $B(7; 5)$. Điểm $M$ thỏa mãn hệ thức vectơ $vec(M A) + 2 vec(M B) = vec(0)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.5)
    let pM = (2.5, 1.5)
    let pB = (3.5, 2.0)
    line(pA, pB, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.5, 0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.5, 1.7), text(size: 8pt)[$B$])
    circle(pM, radius: 2.5pt, fill: rgb("d97706"))
    content((2.5, 1.8), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$M$])
  })
]
Tính hoành độ $x_M$ của điểm $M$.],
    [5],
    loigiai: [
        #step([Sử dụng công thức tọa độ tâm tỉ cự])
        Từ $vec(M A) + 2 vec(M B) = vec(0)$:
        $ x_M = (x_A + 2 x_B) / (1 + 2) $
        
        #step([Tính hoành độ xM])
        Thay số:
        $ x_M = (1 + 2 dot 7) / 3 = (1 + 14) / 3 = 15 / 3 = 5 $
        Vậy hoành độ của điểm $M$ là $5$.
    ]
)

// TLN 2 (Câu 18)
#tln([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có $A(2; 3), B(4; 7)$ và $C(6; -1)$. Điểm $M(x; 0)$ thuộc trục hoành $O x$ sao cho biểu thức độ dài $|vec(M A) + vec(M B) + vec(M C)|$ đạt giá trị nhỏ nhất.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pG = (2.4, 1.8)
    let pM = (2.4, 0)
    circle(pG, radius: 2pt, fill: black)
    content((2.7, 1.8), text(size: 8pt)[$G$])
    line(pG, pM, stroke: (paint: rgb("d97706"), dash: "dashed", thickness: 1.2pt))
    circle(pM, radius: 2.5pt, fill: rgb("d97706"))
    content((2.4, -0.35), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$M(x; 0)$])
  })
]
Tìm hoành độ $x$ của điểm $M$.],
    [4],
    loigiai: [
        #step([Xác định tọa độ trọng tâm G])
        $ x_G = (x_A + x_B + x_C) / 3 = (2 + 4 + 6) / 3 = 12 / 3 = 4 $
        $ y_G = (y_A + y_B + y_C) / 3 = (3 + 7 + (-1)) / 3 = 9 / 3 = 3 $
        
        #step([Thu gọn biểu thức độ dài])
        $ |vec(M A) + vec(M B) + vec(M C)| = |3 vec(M G)| = 3 M G $
        Vì $M in O x$ nên $M G$ nhỏ nhất khi $M$ là hình chiếu của $G(4; 3)$ lên trục $O x$, suy ra $x = x_G = 4$.
    ]
)

// TLN 3 (Câu 19)
#tln([Trong mặt phẳng tọa độ $O x y$, cho điểm $A(3; 4)$. Điểm $A'$ đối xứng với điểm $A$ qua điểm $I(5; 2)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 1.8)
    let pI = (2.0, 1.0)
    let pA1 = (3.5, 0.2)
    line(pA, pA1, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.5, 2.1), text(size: 8pt)[$A$])
    circle(pI, radius: 2pt, fill: black)
    content((2.0, 1.3), text(size: 8pt)[$I$])
    circle(pA1, radius: 2.5pt, fill: rgb("d97706"))
    content((3.5, 0.5), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$A'$])
  })
]
Tính tổng hoành độ và tung độ của điểm $A'$: $S = x_{A'} + y_{A'}$.],
    [7],
    loigiai: [
        #step([Sử dụng công thức đối xứng qua điểm])
        Vì $I$ là trung điểm của đoạn thẳng $A A'$:
        $ x_{A'} = 2 x_I - x_A = 2 dot 5 - 3 = 7 $
        $ y_{A'} = 2 y_I - y_A = 2 dot 2 - 4 = 0 $
        Vậy $A'(7; 0)$.
        
        #step([Tính tổng S])
        $ S = x_{A'} + y_{A'} = 7 + 0 = 7 $
    ]
)

// TLN 4 (Câu 20)
#tln([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh là $A(0; 0), B(6; 0)$ và $C(0; 8)$. Gọi $I$ là tâm đường tròn ngoại tiếp của tam giác $A B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    
    let pB = (2.8, 0)
    let pC = (0, 3.0)
    let pI = (1.4, 1.5)
    line((0, 0), pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pI, radius: 2.5pt, fill: rgb("d97706"))
    content((1.7, 1.7), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$I$])
  })
]
Tính khoảng cách từ tâm ngoại tiếp $I$ đến gốc tọa độ $O(0; 0)$ (độ dài đoạn thẳng $O I$).],
    [5],
    loigiai: [
        #step([Xác định tọa độ tâm ngoại tiếp I])
        Tam giác $A B C$ vuông tại $A(0; 0)$ nên tâm ngoại tiếp $I$ là trung điểm của cạnh huyền $B C$:
        $ x_I = (6 + 0) / 2 = 3, quad y_I = (0 + 8) / 2 = 4 => I(3; 4) $
        
        #step([Tính khoảng cách OI])
        $ O I = sqrt(x_I^2 + y_I^2) = sqrt(3^2 + 4^2) = sqrt(9 + 16) = sqrt(25) = 5 $
    ]
)

// TLN 5 (Câu 21 - Thực tế Tối ưu vị trí trạm bơm tưới tiêu)
#tln([Trong bài toán đặt trạm bơm tưới tiêu bờ kênh $O x$ cho hai trang trại $A(2; 3)$ và $B(8; 5)$ (đơn vị: kilômét), vị trí đặt trạm bơm $M(x; 0)$ trên bờ kênh sao cho tổng chiều dài đường ống dẫn nước $M A + M B$ đạt giá trị nhỏ nhất.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 2pt + rgb("0284c7"))
    line((-0.5, 0), (5.5, 0), stroke: (paint: white, dash: "dashed", thickness: 0.8pt))
    content((5.2, -0.35), text(fill: rgb("0284c7"), size: 8pt)[Kênh $O x$])
    
    let pA = (1.2, 1.6)
    let pB = (4.4, 2.8)
    let pA1 = (1.2, -1.6)
    let pM = (2.4, 0)
    line(pA1, pB, stroke: 1.2pt + rgb("d97706"))
    circle(pA, radius: 2pt, fill: black)
    content(pA, [🌾 $A$], anchor: "south-east")
    circle(pB, radius: 2pt, fill: black)
    content(pB, [🚜 $B$], anchor: "south-east")
    circle(pM, radius: 2.5pt, fill: rgb("dc2626"))
    content(pM, [🌊 $M$], anchor: "north-west")
  })
]
Tìm hoành độ $x$ của trạm bơm $M$ (viết kết quả dưới dạng số thập phân).],
    [4.25],
    loigiai: [
        #step([Xác định điều kiện thẳng hàng])
        Lấy điểm đối xứng của $A(2; 3)$ qua trục $O x$ là $A'(2; -3)$.
        Tổng $M A + M B$ nhỏ nhất khi $M$ là giao điểm của đường thẳng $A' B$ với trục hoành $O x$.
        
        #step([Lập phương trình và tìm hoành độ x])
        Ta có $vec(A' B) = (8 - 2; 5 - (-3)) = (6; 8) = 2(3; 4)$.
        Vectơ $vec(A' M) = (x - 2; 0 - (-3)) = (x - 2; 3)$.
        Vì ba điểm $A', M, B$ thẳng hàng:
        $ (x - 2) / 6 = 3 / 8 <=> x - 2 = (3 dot 6) / 8 = 18 / 8 = 2.25 $
        $ <=> x = 2 + 2.25 = 4.25 $
        Vậy hoành độ của trạm bơm là $4.25$.
    ]
)

// TLN 6 (Câu 22 - Thực tế Tâm phụ tải điện cụm ba phân xưởng)
#tln([Cụm ba phân xưởng công nghiệp có tọa độ vị trí lần lượt là $A(10; 20), B(30; 50)$ và $C(50; 20)$ (hệ tọa độ $O x y$, đơn vị: mét). Do phân xưởng $B$ tiêu thụ điện năng gấp đôi hai phân xưởng còn lại, vị trí đặt trạm biến áp trung tâm $P(x_P; y_P)$ được tính toán thỏa mãn hệ thức cân bằng phụ tải tâm tỉ cự: $vec(P A) + 2 vec(P B) + vec(P C) = vec(0)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x" (m)"$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y" (m)"$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.0, 1.6)
    let pB = (2.8, 3.5)
    let pC = (4.6, 1.6)
    let pP = (2.8, 2.45)
    line(pA, pB, pC, close: true, stroke: 1pt + luma(160))
    content(pA, [🏭 $A$], anchor: "north")
    content(pB, [🏭 $B$], anchor: "south")
    content(pC, [🏭 $C$], anchor: "north")
    circle(pP, radius: 3pt, fill: rgb("d97706"))
    content(pP, [⚡ $P$], anchor: "west")
  })
]
Tính khoảng cách từ trạm biến áp $P$ đến gốc tọa độ điều hành trung tâm $O(0; 0)$ theo đơn vị mét (làm tròn kết quả đến chữ số hàng đơn vị).],
    [46],
    loigiai: [
        #step([Tìm tọa độ trạm biến áp P])
        Từ đẳng thức tâm tỉ cự $vec(P A) + 2 vec(P B) + vec(P C) = vec(0)$:
        $ x_P = (x_A + 2 x_B + x_C) / (1 + 2 + 1) = (10 + 2 dot 30 + 50) / 4 = 120 / 4 = 30 $
        $ y_P = (y_A + 2 y_B + y_C) / (1 + 2 + 1) = (20 + 2 dot 50 + 20) / 4 = 140 / 4 = 35 $
        Vậy $P(30; 35)$.
        
        #step([Tính khoảng cách từ P đến gốc O])
        $ O P = sqrt(x_P^2 + y_P^2) = sqrt(30^2 + 35^2) = sqrt(900 + 1225) = sqrt(2125) approx 46.1" m" $
        Làm tròn đến chữ số hàng đơn vị ta được $46" m"$.
    ]
)

] // end make-questions

#make-questions()
