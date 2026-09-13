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
  exam-title: "BÀI TẬP CUỐI CHƯƠNG IV: VECTƠ (ĐỀ SỐ 2 - NÂNG CAO)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "117",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong mặt phẳng tọa độ $O x y$, cho ba điểm $A(1; 2), B(3; 5)$ và $C(7; 11)$. Khẳng định nào sau đây là ĐÚNG?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (0.6, 0.6)
    let pB = (1.8, 1.5)
    let pC = (4.2, 3.3)
    line(pA, pC, stroke: 1.5pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.6, 0.85), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((1.8, 1.75), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((4.2, 3.55), text(size: 8pt)[$C$])
  })
]],
    (
        True([Ba điểm $A, B, C$ thẳng hàng và $vec(A C) = 3 vec(A B)$]),
        [Ba điểm $A, B, C$ tạo thành tam giác vuông tại $B$],
        [Ba điểm $A, B, C$ thẳng hàng và $vec(A B) = 2 vec(B C)$],
        [Tam giác $A B C$ cân tại đỉnh $A$]
    ),
    loigiai: [
        Ta tính tọa độ hai vectơ:
        $ vec(A B) = (3 - 1; 5 - 2) = (2; 3) $
        $ vec(A C) = (7 - 1; 11 - 2) = (6; 9) $
        Nhận thấy: $(6; 9) = 3(2; 3) <=> vec(A C) = 3 vec(A B)$.
        Do đó hai vectơ $vec(A C)$ và $vec(A B)$ cùng phương, suy ra ba điểm $A, B, C$ thẳng hàng và $vec(A C) = 3 vec(A B)$.
    ]
)

// TN 2
#tn([Trong mặt phẳng tọa độ $O x y$, cho ba đỉnh của một hình bình hành $A B C D$ lần lượt là $A(-1; 3), B(2; 1)$ và $C(4; 4)$. Tọa độ của đỉnh thứ tư $D$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.8)
    let pB = (2.2, 0.6)
    let pC = (3.6, 2.4)
    let pD = (1.4, 3.6)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 1.8), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.4, 0.5), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.8, 2.4), text(size: 8pt)[$C$])
    circle(pD, radius: 2.5pt, fill: rgb("dc2626"))
    content((1.4, 3.85), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$D$])
  })
]],
    (
        True([$D(1; 6)$]),
        [$D(-1; 6)$],
        [$D(7; 2)$],
        [$D(3; 5)$]
    ),
    loigiai: [
        Tứ giác $A B C D$ là hình bình hành khi và chỉ khi $vec(A B) = vec(D C)$.
        Ta có $vec(A B) = (2 - (-1); 1 - 3) = (3; -2)$.
        Gọi $D(x_D; y_D)$, ta có $vec(D C) = (4 - x_D; 4 - y_D)$.
        $ cases(4 - x_D = 3, 4 - y_D = -2) <=> cases(x_D = 1, y_D = 6) $
        Vậy tọa độ đỉnh $D$ là $D(1; 6)$.
    ]
)

// TN 3
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(u) = (2; -3)$ và $vec(v) = (m; 4)$. Tìm giá trị của tham số $m$ để hai vectơ $vec(u)$ và $vec(v)$ cùng phương.],
    (
        True([$m = - 8/3$]),
        [$m = 8/3$],
        [$m = -6$],
        [$m = 6$]
    ),
    loigiai: [
        Hai vectơ cùng phương khi và chỉ khi định thức tọa độ bằng $0$:
        $ 2 dot 4 - (-3) dot m = 0 <=> 8 + 3m = 0 <=> 3m = -8 <=> m = - 8/3 $
    ]
)

// TN 4
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(3; 0)$ và $B(-3; 0)$ trên trục hoành. Tìm tọa độ điểm $M$ trên trục tung $O y$ có tung độ dương sao cho tam giác $M A B$ vuông tại $M$ ($vec(M A) perp vec(M B)$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((2.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 2.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.8, 0)
    let pB = (-1.8, 0)
    let pM = (0, 1.8)
    line(pA, pB, stroke: 1pt + luma(140))
    line(pM, pA, stroke: 1.5pt + rgb("0d9488"))
    line(pM, pB, stroke: 1.5pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((1.8, -0.3), text(size: 8pt)[$A(3; 0)$])
    circle(pB, radius: 2pt, fill: black)
    content((-1.8, -0.3), text(size: 8pt)[$B(-3; 0)$])
    circle(pM, radius: 2.5pt, fill: rgb("dc2626"))
    content((0.4, 1.8), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$M(0; 3)$])
    draw_angle_arc(pM, 225deg, 315deg, radius: 0.35, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$M(0; 3)$]),
        [$M(0; sqrt(3))$],
        [$M(0; 6)$],
        [$M(0; 9)$]
    ),
    loigiai: [
        Vì $M in O y$ và có tung độ dương nên $M(0; y)$ với $y > 0$.
        Ta có $vec(M A) = (3; -y)$ và $vec(M B) = (-3; -y)$.
        Điều kiện $vec(M A) perp vec(M B) <=> vec(M A) dot vec(M B) = 0$:
        $ 3(-3) + (-y)(-y) = 0 <=> -9 + y^2 = 0 <=> y^2 = 9 <=> y = 3 quad (text("do ") y > 0) $
        Vậy tọa độ điểm $M$ là $M(0; 3)$.
    ]
)

// TN 5
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có $A(1; 2), B(3; 0)$ và $C(-1; -2)$. Diện tích $S$ của tam giác $A B C$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.5)
    let pB = (3.0, 1.0)
    let pC = (0.5, 0)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"), fill: rgb("f0fdfa"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.75), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, 1.0), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0.3, 0), text(size: 8pt)[$C$])
  })
]],
    (
        True([$6$]),
        [$12$],
        [$8$],
        [$4$]
    ),
    loigiai: [
        Ta tính tọa độ hai vectơ xuất phát từ đỉnh $A$:
        $vec(A B) = (3 - 1; 0 - 2) = (2; -2)$.
        $vec(A C) = (-1 - 1; -2 - 2) = (-2; -4)$.
        Áp dụng công thức diện tích tam giác theo tọa độ vectơ:
        $ S = 1/2 |x_1 y_2 - x_2 y_1| = 1/2 |2(-4) - (-2)(-2)| = 1/2 |-8 - 4| = 1/2 dot 12 = 6 $
    ]
)

// TN 6
#tn([Trong mặt phẳng tọa độ $O x y$, cho đường tròn $(C)$ có đường kính là đoạn thẳng $A B$ với $A(1; 3)$ và $B(5; 7)$. Bán kính $R$ của đường tròn $(C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pI = (2.0, 1.8)
    circle(pI, radius: 1.4, stroke: 1.2pt + rgb("0d9488"))
    let pA = (1.0, 0.8)
    let pB = (3.0, 2.8)
    line(pA, pB, stroke: 1.5pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((0.8, 0.7), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, 2.9), text(size: 8pt)[$B$])
    circle(pI, radius: 2pt, fill: rgb("dc2626"))
    content((2.1, 1.5), text(fill: rgb("dc2626"), size: 8pt)[$I$])
  })
]],
    (
        True([$2 sqrt(2)$]),
        [$4 sqrt(2)$],
        [$8$],
        [$4$]
    ),
    loigiai: [
        Độ dài đoạn thẳng đường kính:
        $ A B = sqrt((5 - 1)^2 + (7 - 3)^2) = sqrt(4^2 + 4^2) = sqrt(16 + 16) = sqrt(32) = 4 sqrt(2) $
        Bán kính của đường tròn:
        $ R = (A B) / 2 = (4 sqrt(2)) / 2 = 2 sqrt(2) $
    ]
)

// TN 7
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ cơ sở $vec(a) = (1; 2)$ và $vec(b) = (3; -1)$. Phân tích vectơ $vec(c) = (7; 7)$ theo hai vectơ $vec(a)$ và $vec(b)$ ta được kết quả là],
    (
        True([$vec(c) = 4 vec(a) + vec(b)$]),
        [$vec(c) = 2 vec(a) + 3 vec(b)$],
        [$vec(c) = vec(a) + 2 vec(b)$],
        [$vec(c) = 3 vec(a) + 2 vec(b)$]
    ),
    loigiai: [
        Giả sử $vec(c) = x vec(a) + y vec(b)$. Ta có hệ phương trình:
        $ cases(1x + 3y = 7, 2x - 1y = 7) <=> cases(x + 3y = 7, 6x - 3y = 21) <=> cases(7x = 28, y = 2x - 7) <=> cases(x = 4, y = 1) $
        Vậy $vec(c) = 4 vec(a) + vec(b)$.
    ]
)

// TN 8
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh $A(0; 3), B(-2; 0)$ và $C(2; 0)$. Tọa độ trực tâm $H(x; y)$ của tam giác $A B C$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.0, 0), (2.0, 0), stroke: 1pt + luma(140))
    line((0, -0.5), (0, 3.2), stroke: 1pt + luma(140))
    let pA = (0, 2.7)
    let pB = (-1.5, 0)
    let pC = (1.5, 0)
    let pH = (0, 0.8)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    line(pB, (0.75, 1.35), stroke: (paint: luma(160), dash: "dashed"))
    circle(pA, radius: 2pt, fill: black)
    content((0.25, 2.7), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-1.5, -0.25), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((1.5, -0.25), text(size: 8pt)[$C$])
    circle(pH, radius: 2.5pt, fill: rgb("dc2626"))
    content((0.3, 0.8), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$H$])
  })
]],
    (
        True([$H(0; 4/3)$]),
        [$H(0; 1)$],
        [$H(0; 2)$],
        [$H(0; 3/2)$]
    ),
    loigiai: [
        Tam giác $A B C$ cân tại $A$ với $B, C in O x$ đối xứng qua gốc $O$. Do đó đường cao kẻ từ $A$ chính là trục tung $O y$, suy ra $x_H = 0 => H(0; y)$.
        Vectơ $vec(B H) = (0 - (-2); y - 0) = (2; y)$.
        Vectơ $vec(A C) = (2 - 0; 0 - 3) = (2; -3)$.
        Vì $H$ là trực tâm nên $B H perp A C <=> vec(B H) dot vec(A C) = 0$:
        $ 2 dot 2 + y(-3) = 0 <=> 4 - 3y = 0 <=> 3y = 4 <=> y = 4/3 $
        Vậy tọa độ trực tâm là $H(0; 4/3)$.
    ]
)

// TN 9
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(-1; 2)$ và $B(3; 6)$. Điểm $M$ thỏa mãn đẳng thức vectơ $vec(M A) + 2 vec(M B) = vec(0)$. Tọa độ của điểm $M$ là],
    (
        True([$M(5/3; 14/3)$]),
        [$M(1; 4)$],
        [$M(2; 5)$],
        [$M(5/3; 4)$]
    ),
    loigiai: [
        Từ đẳng thức $vec(M A) + 2 vec(M B) = vec(0) <=> vec(O M) = (vec(O A) + 2 vec(O B)) / 3$.
        Tọa độ điểm $M$:
        $ x_M = (x_A + 2 x_B) / 3 = (-1 + 2 dot 3) / 3 = 5/3 $
        $ y_M = (y_A + 2 y_B) / 3 = (2 + 2 dot 6) / 3 = 14/3 $
        Vậy tọa độ là $M(5/3; 14/3)$.
    ]
)

// TN 10
#tn([Hai xe cứu hỏa xuất phát đồng thời từ trung tâm chỉ huy $O(0; 0)$. Xe thứ nhất chạy theo hướng vectơ vận tốc $vec(v)_1 = (40; 30)$ (km/h), xe thứ hai chạy theo hướng vectơ vận tốc $vec(v)_2 = (30; -40)$ (km/h). Góc giữa hướng di chuyển của hai xe cứu hỏa bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (2.4, 1.8), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((2.6, 2.0), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)_1$])
    line(pO, (1.8, -2.4), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((2.0, -2.5), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(v)_2$])
    circle(pO, radius: 2.5pt, fill: black)
    content((-0.2, 0.2), [🚒 $O$])
    draw_angle_arc(pO, -53deg, 37deg, radius: 0.5, stroke: 1pt + rgb("dc2626"))
    content((0.7, 0), text(fill: rgb("dc2626"), size: 8pt)[$90^circ$])
  })
]],
    (
        True([$90^circ$]),
        [$60^circ$],
        [$45^circ$],
        [$120^circ$]
    ),
    loigiai: [
        Xét tích vô hướng của hai vectơ vận tốc:
        $ vec(v)_1 dot vec(v)_2 = 40 dot 30 + 30 dot (-40) = 1200 - 1200 = 0 $
        Vì tích vô hướng bằng $0$ nên hai vectơ vận tốc vuông góc với nhau, góc giữa hai hướng di chuyển bằng $90^circ$.
    ]
)

// TN 11
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có trọng tâm là $G(3; 4)$, biết tọa độ hai đỉnh là $A(1; 2)$ và $B(3; 5)$. Tọa độ của đỉnh $C$ là],
    (
        True([$C(5; 5)$]),
        [$C(5; 3)$],
        [$C(4; 5)$],
        [$C(7; 5)$]
    ),
    loigiai: [
        Theo công thức tọa độ trọng tâm tam giác:
        $ x_G = (x_A + x_B + x_C) / 3 => x_C = 3 x_G - x_A - x_B = 3(3) - 1 - 3 = 5 $
        $ y_G = (y_A + y_B + y_C) / 3 => y_C = 3 y_G - y_A - y_B = 3(4) - 2 - 5 = 5 $
        Vậy tọa độ đỉnh $C$ là $C(5; 5)$.
    ]
)

// TN 12
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(m; 2)$ và $B(1; -2)$. Giá trị của tham số $m$ để khoảng cách giữa hai điểm $A$ và $B$ bằng $5$ là],
    (
        True([$m = 4$ hoặc $m = -2$]),
        [$m = 4$],
        [$m = -2$],
        [$m = 3$ hoặc $m = -1$]
    ),
    loigiai: [
        Khoảng cách giữa hai điểm:
        $ A B = sqrt((1 - m)^2 + (-2 - 2)^2) = sqrt((m - 1)^2 + 16) $
        $ A B = 5 <=> (m - 1)^2 + 16 = 25 <=> (m - 1)^2 = 9 <=> cases(m - 1 = 3, m - 1 = -3) <=> cases(m = 4, m = -2) $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Tam giác vuông và các điểm đặc biệt trong Oxy)
#ds([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh $A(1; 3), B(4; 0)$ và $C(2; 4)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.8, 2.4)
    let pB = (3.2, 0)
    let pC = (1.6, 3.2)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.6, 2.4), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.4, 0), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((1.6, 3.45), text(size: 8pt)[$C$])
    draw_angle_arc(pA, -37deg, 53deg, radius: 0.35, stroke: 1pt + rgb("dc2626"))
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ hai vectơ cạnh xuất phát từ $A$ là $vec(A B) = (3; -3)$ và $vec(A C) = (1; 1)$.]),
    True([Tam giác $A B C$ vuông tại đỉnh $A$ vì $vec(A B) dot vec(A C) = 0$.]),
    True([Tâm đường tròn ngoại tiếp của tam giác $A B C$ là trung điểm của cạnh huyền $B C$, có tọa độ $I(3; 2)$.]),
    [Độ dài cạnh huyền $B C$ của tam giác bằng đúng $5$.]
  ),
  loigiai: [
    #step([Tọa độ các vectơ])
    $vec(A B) = (4 - 1; 0 - 3) = (3; -3)$.
    $vec(A C) = (2 - 1; 4 - 3) = (1; 1)$. Mệnh đề a ĐÚNG.

    #step([Kiểm tra góc vuông])
    $vec(A B) dot vec(A C) = 3 dot 1 + (-3) dot 1 = 3 - 3 = 0 => A B perp A C$.
    Do đó tam giác $A B C$ vuông tại $A$. Mệnh đề b ĐÚNG.

    #step([Tâm ngoại tiếp])
    Trong tam giác vuông, tâm ngoại tiếp $I$ là trung điểm cạnh huyền $B C$:
    $x_I = (4 + 2)/2 = 3, y_I = (0 + 4)/2 = 2 => I(3; 2)$. Mệnh đề c ĐÚNG.

    #step([Độ dài cạnh huyền])
    $B C = sqrt((2 - 4)^2 + (4 - 0)^2) = sqrt((-2)^2 + 4^2) = sqrt(4 + 16) = sqrt(20) = 2 sqrt(5) != 5$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Quỹ tích đường tròn tiếp xúc trục tọa độ)
#ds([Trong mặt phẳng tọa độ $O x y$, cho hai điểm cố định $A(2; 0)$ và $B(8; 0)$ trên trục hoành. Gọi $(C)$ là tập hợp các điểm $M(x; y)$ thỏa mãn đẳng thức tích vô hướng $vec(M A) dot vec(M B) = 0$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pI = (2.5, 0)
    circle(pI, radius: 1.5, stroke: 1.2pt + rgb("0d9488"))
    let pA = (1.0, 0)
    let pB = (4.0, 0)
    circle(pA, radius: 2pt, fill: black)
    content((1.0, -0.3), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((4.0, -0.3), text(size: 8pt)[$B$])
    circle(pI, radius: 2pt, fill: black)
    content((2.5, -0.3), text(size: 8pt)[$I$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tập hợp các điểm $M$ là một đường tròn nhận đoạn thẳng $A B$ làm đường kính.]),
    True([Tâm của đường tròn là điểm $I(5; 0)$ và bán kính đường tròn bằng $R = 3$.]),
    True([Đường tròn $(C)$ có điểm cao nhất đạt tung độ bằng $y = 3$.]),
    [Đường tròn $(C)$ đi qua gốc tọa độ $O(0; 0)$.]
  ),
  loigiai: [
    #step([Bản chất quỹ tích])
    $vec(M A) dot vec(M B) = 0 <=> vec(M A) perp vec(M B)$. Quỹ tích là đường tròn đường kính $A B$. Mệnh đề a ĐÚNG.

    #step([Tâm và bán kính])
    Tâm $I$ là trung điểm $A B$: $x_I = (2 + 8)/2 = 5, y_I = 0 => I(5; 0)$.
    Bán kính $R = (A B)/2 = (8 - 2)/2 = 3$. Mệnh đề b ĐÚNG.

    #step([Điểm cao nhất])
    Điểm cao nhất có tọa độ $(x_I; y_I + R) = (5; 3)$, có tung độ bằng $3$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra gốc O])
    $vec(O A) dot vec(O B) = 2 dot 8 + 0 dot 0 = 16 != 0$. Gốc $O$ không thuộc đường tròn. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Radar kiểm soát không lưu)
#ds([Trên màn hình radar không lưu tại sân bay quốc tế (gốc $O(0; 0)$ là đài kiểm soát), hai máy bay thương mại $P_1$ và $P_2$ đang di chuyển trong cùng một vùng kiểm soát. Tại thời điểm $t$, máy bay $P_1$ ở tọa độ $(20; 15)$ và bay với vectơ vận tốc $vec(v)_1 = (400; 300)$ (km/h); máy bay $P_2$ ở tọa độ $(50; 55)$ và bay với vectơ vận tốc $vec(v)_2 = (-300; 400)$ (km/h).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pP1 = (1.5, 1.2)
    let pP2 = (3.5, 3.2)
    line(pP1, (2.7, 2.1), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((2.8, 2.3), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)_1$])
    line(pP2, (2.6, 4.4), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((2.5, 4.6), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(v)_2$])
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [🗼 $O$], anchor: "north-east")
    circle(pP1, radius: 2pt, fill: black)
    content(pP1, [✈️ $P_1$], anchor: "south-east")
    circle(pP2, radius: 2pt, fill: black)
    content(pP2, [✈️ $P_2$], anchor: "south-east")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tốc độ bay của hai máy bay $P_1$ và $P_2$ là bằng nhau và cùng bằng $500" km/h"$.]),
    True([Hai máy bay đang bay theo hai hướng vuông góc với nhau vì $vec(v)_1 dot vec(v)_2 = 0$.]),
    True([Khoảng cách giữa hai máy bay tại thời điểm quan sát bằng $50" km"$.]),
    [Độ lớn vectơ vận tốc tương đối giữa máy bay $P_1$ và $P_2$ bằng $1000" km/h"$.]
  ),
  loigiai: [
    #step([Tốc độ hai máy bay])
    $v_1 = sqrt(400^2 + 300^2) = 500" km/h"$.
    $v_2 = sqrt((-300)^2 + 400^2) = 500" km/h"$. Mệnh đề a ĐÚNG.

    #step([Hướng bay])
    $vec(v)_1 dot vec(v)_2 = 400(-300) + 300(400) = -120000 + 120000 = 0$. Hai hướng bay vuông góc. Mệnh đề b ĐÚNG.

    #step([Khoảng cách giữa hai máy bay])
    $P_1 P_2 = sqrt((50 - 20)^2 + (55 - 15)^2) = sqrt(30^2 + 40^2) = 50" km"$. Mệnh đề c ĐÚNG.

    #step([Vận tốc tương đối])
    Vì hai hướng vuông góc nên độ lớn vận tốc tương đối:
    $ |vec(v)_1 - vec(v)_2| = sqrt(v_1^2 + v_2^2) = sqrt(500^2 + 500^2) = 500 sqrt(2) approx 707.1" km/h" != 1000" km/h" $. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Hải đội cứu nạn tuần duyên)
#ds([Một tàu cứu nạn hải quân xuất phát từ trạm trực chiến $O(0; 0)$ đi cứu hộ một tàu cá gặp nạn tại vị trí $C(12; 9)$ (đơn vị: hải lý). Tàu cứu nạn di chuyển theo đường thẳng tới vị trí $C$ với vận tốc không đổi $v = 15$ hải lý/giờ.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pC = (3.6, 2.7)
    line(pO, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.8, 1.6), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(d)$])
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [⚓ Trạm $O$], anchor: "north-east")
    circle(pC, radius: 2.5pt, fill: rgb("0d9488"))
    content(pC, [🚢 Tàu cá $C$], anchor: "south-west")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khoảng cách từ trạm chỉ huy $O$ đến vị trí tàu cá gặp nạn bằng $15$ hải lý.]),
    True([Vectơ vận tốc của tàu cứu nạn có tọa độ là $vec(v) = (12; 9)$ (hải lý/giờ).]),
    True([Thời gian tàu cứu nạn di chuyển thẳng tới vị trí tàu cá gặp nạn đúng bằng $1$ giờ.]),
    [Sau $30$ phút di chuyển, tàu cứu nạn đang ở vị trí có tọa độ là $(4; 3)$.]
  ),
  loigiai: [
    #step([Khoảng cách OC])
    $O C = sqrt(12^2 + 9^2) = sqrt(144 + 81) = sqrt(225) = 15$ hải lý. Mệnh đề a ĐÚNG.

    #step([Vectơ vận tốc])
    Vì tàu chạy thẳng từ $O$ đến $C$ với tốc độ $15$ hải lý/giờ trong thời gian $t = (O C)/v = 15/15 = 1$ giờ:
    $vec(v) = (vec(O C))/1 = (12; 9)$ (hải lý/giờ). Mệnh đề b, c ĐÚNG.

    #step([Vị trí sau 30 phút])
    Sau $t = 0.5$ giờ, vị trí tàu là trung điểm của $O C$:
    $M(12 dot 0.5; 9 dot 0.5) = M(6; 4.5) != (4; 3)$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh $A(0; 4), B(-3; 0)$ và $C(3; 0)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 2.4)
    let pB = (-1.8, 0)
    let pC = (1.8, 0)
    let pH = (0, 1.2)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.2, 2.4), text(size: 8pt)[$A(0; 4)$])
    circle(pB, radius: 2pt, fill: black)
    content((-1.8, -0.3), text(size: 8pt)[$B(-3; 0)$])
    circle(pC, radius: 2pt, fill: black)
    content((1.8, -0.3), text(size: 8pt)[$C(3; 0)$])
    circle(pH, radius: 2.5pt, fill: rgb("dc2626"))
    content((0.3, 1.2), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$H$])
  })
]
Tìm tung độ $y$ của trực tâm $H(0; y)$ của tam giác $A B C$.],
    [2.25],
    loigiai: [
        #step([Xác định tọa độ hai vectơ vuông góc])
        $vec(B H) = (0 - (-3); y - 0) = (3; y)$.
        $vec(A C) = (3 - 0; 0 - 4) = (3; -4)$.
        
        #step([Điều kiện trực tâm BH vuông góc AC])
        $ vec(B H) dot vec(A C) = 0 <=> 3 dot 3 + y(-4) = 0 <=> 9 - 4y = 0 <=> y = 9/4 = 2.25 $
        Vậy tung độ của trực tâm là $y = 2.25$.
    ]
)

// TLN 2 (Câu 18)
#tln([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(u) = (m; 2)$ và $vec(v) = (3; 6)$. Tìm giá trị thực của tham số $m$ để hai vectơ $vec(u)$ và $vec(v)$ vuông góc với nhau.],
    [-4],
    loigiai: [
        #step([Thiết lập điều kiện tích vô hướng bằng 0])
        $ vec(u) perp vec(v) <=> vec(u) dot vec(v) = 0 $
        $ m dot 3 + 2 dot 6 = 0 <=> 3m + 12 = 0 <=> 3m = -12 <=> m = -4 $
        Vậy giá trị cần tìm là $m = -4$.
    ]
)

// TLN 3 (Câu 19)
#tln([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh $A(1; 2), B(5; 2)$ và $C(1; 6)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.5)
    let pB = (3.0, 0.5)
    let pC = (0.5, 3.0)
    let pI = (1.75, 1.75)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pI, radius: 1.77, stroke: 1pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((0.3, 0.5), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, 0.5), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0.3, 3.2), text(size: 8pt)[$C$])
    circle(pI, radius: 2pt, fill: rgb("dc2626"))
    content((1.75, 1.45), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$I$])
    draw_angle_arc(pA, 0deg, 90deg, radius: 0.3, stroke: 1pt + rgb("dc2626"))
  })
]
Tính bình phương bán kính đường tròn ngoại tiếp $R^2$ của tam giác $A B C$.],
    [8],
    loigiai: [
        #step([Kiểm tra tính chất tam giác vuông])
        $vec(A B) = (4; 0)$ và $vec(A C) = (0; 4)$.
        $vec(A B) dot vec(A C) = 4(0) + 0(4) = 0 => A B perp A C$.
        Tam giác $A B C$ vuông cân tại $A$.
        
        #step([Tính bán kính ngoại tiếp])
        Cạnh huyền $B C = sqrt(4^2 + 4^2) = 4 sqrt(2)$.
        Bán kính $R = (B C)/2 = 2 sqrt(2) => R^2 = (2 sqrt(2))^2 = 8$.
    ]
)

// TLN 4 (Câu 20)
#tln([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh $A(2; 1), B(5; 2)$ và $C(1; 4)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.8, 0.5)
    let pB = (3.2, 1.2)
    let pC = (0, 2.5)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.8, 0.25), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.4, 1.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((-0.2, 2.5), text(size: 8pt)[$C$])
    draw_angle_arc(pA, 18deg, 108deg, radius: 0.4, stroke: 1pt + rgb("dc2626"))
  })
]
Tính số đo của góc $hat(B A C)$ theo đơn vị độ.],
    [90],
    loigiai: [
        #step([Tính tọa độ hai vectơ])
        $vec(A B) = (5 - 2; 2 - 1) = (3; 1)$.
        $vec(A C) = (1 - 2; 4 - 1) = (-1; 3)$.
        
        #step([Kiểm tra tích vô hướng])
        $ vec(A B) dot vec(A C) = 3 dot (-1) + 1 dot 3 = -3 + 3 = 0 $
        Vì tích vô hướng bằng $0$ nên hai vectơ vuông góc với nhau, góc $hat(B A C) = 90^circ$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Robot AGV)
#tln([Một robot vận chuyển AGV trong nhà máy tự động di chuyển theo đường thẳng từ vị trí $A(2; 3)$ đến vị trí $B(10; 9)$ (hệ tọa độ sàn xưởng, đơn vị: mét). Động cơ tạo ra lực kéo không đổi $vec(F) = (50; 40)$ (đơn vị: Niutơn).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.5)
    let pB = (3.2, 2.2)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((1.8, 1.6), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(d)$])
    circle(pA, radius: 2.5pt, fill: black)
    content(pA, [🤖 $A$], anchor: "north-east")
    circle(pB, radius: 2.5pt, fill: black)
    content(pB, [🎯 $B$], anchor: "south-west")
  })
]
Tính công cơ học do lực kéo của robot thực hiện theo đơn vị Jun ($"J"$).],
    [640],
    loigiai: [
        #step([Xác định vectơ dịch chuyển])
        $vec(d) = vec(A B) = (10 - 2; 9 - 3) = (8; 6)$ (m).
        
        #step([Tính công cơ học])
        $ A = vec(F) dot vec(d) = 50 dot 8 + 40 dot 6 = 400 + 240 = 640" J" $
        Vậy công cơ học bằng $640" J"$.
    ]
)

// TLN 6 (Câu 22 - Thực tế Drone bay tuần tra đường biên)
#tln([Một thiết bị bay không người lái (Drone) tuần tra biên giới bay về hướng Bắc với tốc độ máy $v_1 = 36" km/h"$. Gió thổi ngang mạnh từ hướng Tây sang Đông với tốc độ $v_2 = 15" km/h"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (0, 2.4), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-0.3, 2.5), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)_1$ (Bắc)])
    line(pO, (1.8, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.8, -0.25), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(v)_2$ (Đông)])
    line(pO, (1.8, 2.4), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((2.1, 2.5), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(v)$])
    content(pO, [🚁], anchor: "north-east")
  })
]
Tính tốc độ thực tế của chiếc Drone đối với mặt đất theo đơn vị $"km/h"$.],
    [39],
    loigiai: [
        #step([Phân tích vectơ vận tốc])
        Vận tốc thực tế của Drone đối với mặt đất:
        $ vec(v) = vec(v)_1 + vec(v)_2 $
        Vì hướng Bắc vuông góc với hướng Đông nên hai vectơ thành phần vuông góc nhau.
        
        #step([Tính tốc độ thực tế])
        $ v = sqrt(v_1^2 + v_2^2) = sqrt(36^2 + 15^2) = sqrt(1296 + 225) = sqrt(1521) = 39" km/h" $
        Vậy tốc độ thực tế của Drone bằng $39" km/h"$.
    ]
)

] // end make-questions

#make-questions()
