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
  exam-title: "BÀI 10: VECTƠ TRONG MẶT PHẲNG TỌA ĐỘ (ĐỀ SỐ 1)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "110",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong mặt phẳng tọa độ $O x y$, cho vectơ $vec(u) = 2 vec(i) - 5 vec(j)$ (với $vec(i), vec(j)$ lần lượt là hai vectơ đơn vị trên hai trục $O x$ và $O y$). Tọa độ của vectơ $vec(u)$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Hệ trục Oxy
    line((-0.5, 0), (3.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((3.2, 0), text(size: 8pt)[$x$])
    line((0, -2.5), (0, 1.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 1.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    // Vectơ i, j
    line((0, 0), (1, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((0.5, 0.25), text(fill: rgb("0d9488"), size: 7.5pt)[$vec(i)$])
    line((0, 0), (0, 1), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((-0.25, 0.5), text(fill: rgb("0d9488"), size: 7.5pt)[$vec(j)$])
    
    // Vectơ u = (2; -2.2 tượng trưng)
    line((0, 0), (2, -1.8), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((2.2, -1.9), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(u)$])
    line((2, 0), (2, -1.8), (0, -1.8), stroke: (paint: luma(180), dash: "dashed"))
    content((2, 0.25), text(size: 7.5pt)[$2$])
    content((-0.3, -1.8), text(size: 7.5pt)[$-5$])
  })
]],
    (
        True([$vec(u) = (2; -5)$]),
        [$vec(u) = (-5; 2)$],
        [$vec(u) = (2; 5)$],
        [$vec(u) = (-2; -5)$]
    ),
    loigiai: [
        Theo định nghĩa tọa độ của một vectơ đối với hệ trục tọa độ $O x y$:
        $ vec(u) = x vec(i) + y vec(j) <=> vec(u) = (x; y) $
        Với $vec(u) = 2 vec(i) - 5 vec(j)$, suy ra tọa độ của $vec(u)$ là $(2; -5)$.
    ]
)

// TN 2
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 3)$ và $B(4; -1)$. Tọa độ của vectơ $vec(A B)$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -1.8), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1, 2.5)
    let pB = (3.5, -1)
    circle(pA, radius: 2pt, fill: black)
    content((0.8, 2.7), text(size: 8pt, weight: "bold")[$A(1; 3)$])
    circle(pB, radius: 2pt, fill: black)
    content((3.8, -1.2), text(size: 8pt, weight: "bold")[$B(4; -1)$])
    
    line(pA, pB, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((2.5, 1.1), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(A B)$])
  })
]],
    (
        True([$vec(A B) = (3; -4)$]),
        [$vec(A B) = (-3; 4)$],
        [$vec(A B) = (5; 2)$],
        [$vec(A B) = (3; 2)$]
    ),
    loigiai: [
        Tọa độ của vectơ nối hai điểm $A(x_A; y_A)$ và $B(x_B; y_B)$ được tính theo công thức:
        $ vec(A B) = (x_B - x_A; y_B - y_A) = (4 - 1; -1 - 3) = (3; -4) $
    ]
)

// TN 3
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(a) = (3; -2)$ và $vec(b) = (-1; 4)$. Tọa độ của vectơ tổng $vec(u) = vec(a) + vec(b)$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((3.7, 0), text(size: 8pt)[$x$])
    line((0, -2), (0, 3.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    line((0, 0), (2.5, -1.5), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((2.6, -1.7), text(fill: rgb("0d9488"), size: 8pt)[$vec(a)$])
    line((0, 0), (-1, 2.5), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((-1.2, 2.7), text(fill: rgb("0d9488"), size: 8pt)[$vec(b)$])
    line((0, 0), (1.5, 1.0), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((1.9, 1.2), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(a) + vec(b)$])
  })
]],
    (
        True([$vec(u) = (2; 2)$]),
        [$vec(u) = (4; -6)$],
        [$vec(u) = (-3; -8)$],
        [$vec(u) = (2; -6)$]
    ),
    loigiai: [
        Theo quy tắc cộng hai vectơ theo tọa độ:
        $ vec(u) = (x_a + x_b; y_a + y_b) = (3 + (-1); -2 + 4) = (2; 2) $
    ]
)

// TN 4
#tn([Trong mặt phẳng tọa độ $O x y$, cho vectơ $vec(a) = (-2; 3)$. Tọa độ của vectơ $-4 vec(a)$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -3.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 2.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    line((0, 0), (-1.2, 1.5), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((-1.4, 1.7), text(fill: rgb("0d9488"), size: 8pt)[$vec(a)$])
    line((0, 0), (3.6, -3), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((3.8, -3.2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$-4 vec(a)$])
  })
]],
    (
        True([$(8; -12)$]),
        [$(-8; 12)$],
        [$(8; 12)$],
        [$(-6; -1)$]
    ),
    loigiai: [
        Nhân một số thực với một vectơ theo tọa độ:
        $ -4 vec(a) = (-4 dot (-2); -4 dot 3) = (8; -12) $
    ]
)

// TN 5
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(2; -3)$ và $B(6; 1)$. Tọa độ trung điểm $I$ của đoạn thẳng $A B$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.2, 0), text(size: 8pt)[$x$])
    line((0, -2.5), (0, 2), mark: (end: ">"), stroke: 0.8pt)
    content((0, 2.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.5, -1.8)
    let pI = (3.0, -0.6)
    let pB = (4.5, 0.6)
    line(pA, pB, stroke: 1.2pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, -2.1), text(size: 8pt)[$A$])
    circle(pI, radius: 2pt, fill: rgb("dc2626"))
    content((3.0, -0.25), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$I$])
    circle(pB, radius: 2pt, fill: black)
    content((4.5, 0.9), text(size: 8pt)[$B$])
  })
]],
    (
        True([$I(4; -1)$]),
        [$I(8; -2)$],
        [$I(2; 2)$],
        [$I(4; -2)$]
    ),
    loigiai: [
        Tọa độ trung điểm $I$ của đoạn thẳng $A B$:
        $ x_I = (x_A + x_B) / 2 = (2 + 6) / 2 = 4, quad y_I = (y_A + y_B) / 2 = (-3 + 1) / 2 = -1 $
        Vậy $I(4; -1)$.
    ]
)

// TN 6
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có $A(1; 2), B(-2; 4), C(4; 0)$. Tọa độ trọng tâm $G$ của tam giác $A B C$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.0, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.8), (0, 3.8), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.0), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1, 1.6)
    let pB = (-1.5, 3.0)
    let pC = (3.5, 0)
    let pG = (1, 1.53)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    circle(pA, radius: 2pt, fill: black)
    content((1, 1.9), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-1.5, 3.3), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.5, -0.3), text(size: 8pt)[$C$])
    circle(pG, radius: 2pt, fill: rgb("dc2626"))
    content((1.3, 1.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$G$])
  })
]],
    (
        True([$G(1; 2)$]),
        [$G(3; 6)$],
        [$G(1; 3)$],
        [$G(2; 1)$]
    ),
    loigiai: [
        Tọa độ trọng tâm $G$ của tam giác $A B C$:
        $ x_G = (x_A + x_B + x_C) / 3 = (1 + (-2) + 4) / 3 = 3/3 = 1 $
        $ y_G = (y_A + y_B + y_C) / 3 = (2 + 4 + 0) / 3 = 6/3 = 2 $
        Vậy $G(1; 2)$.
    ]
)

// TN 7
#tn([Trong mặt phẳng tọa độ $O x y$, độ dài của vectơ $vec(u) = (6; -8)$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((3.7, 0), text(size: 8pt)[$x$])
    line((0, -3.0), (0, 1.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 1.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    line((0, 0), (2.4, -2.4), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((2.6, -2.6), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(u)$])
    line((2.4, 0), (2.4, -2.4), (0, -2.4), stroke: (paint: luma(180), dash: "dashed"))
    content((2.4, 0.25), text(size: 7.5pt)[$6$])
    content((-0.3, -2.4), text(size: 7.5pt)[$-8$])
  })
]],
    (
        True([$10$]),
        [$14$],
        [$2$],
        [$100$]
    ),
    loigiai: [
        Độ dài của một vectơ theo tọa độ:
        $ |vec(u)| = sqrt(x^2 + y^2) = sqrt(6^2 + (-8)^2) = sqrt(36 + 64) = sqrt(100) = 10 $
    ]
)

// TN 8
#tn([Trong mặt phẳng tọa độ $O x y$, khoảng cách giữa hai điểm $M(1; 2)$ và $N(4; 6)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.2), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.4), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pM = (0.8, 1.2)
    let pN = (3.2, 3.6)
    circle(pM, radius: 2pt, fill: black)
    content((0.6, 1.4), text(size: 8pt)[$M(1; 2)$])
    circle(pN, radius: 2pt, fill: black)
    content((3.4, 3.8), text(size: 8pt)[$N(4; 6)$])
    line(pM, pN, stroke: 1.5pt + rgb("1e40af"))
    line(pM, (3.2, 1.2), pN, stroke: (paint: luma(180), dash: "dashed"))
    content((2.0, 0.9), text(size: 7.5pt)[$Delta x = 3$])
    content((3.6, 2.4), text(size: 7.5pt)[$Delta y = 4$])
  })
]],
    (
        True([$5$]),
        [$7$],
        [$25$],
        [$sqrt(7)$]
    ),
    loigiai: [
        Khoảng cách giữa hai điểm trong mặt phẳng tọa độ:
        $ M N = sqrt((x_N - x_M)^2 + (y_N - y_M)^2) = sqrt((4 - 1)^2 + (6 - 2)^2) = sqrt(3^2 + 4^2) = 5 $
    ]
)

// TN 9
#tn([Trong mặt phẳng tọa độ $O x y$, cho điểm $A(-3; 5)$. Tọa độ của vectơ vị trí $vec(O A)$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-3.0, 0), (1.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((1.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (-2.0, 2.5)
    line((0, 0), pA, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-2.2, 2.7), text(size: 8pt, weight: "bold")[$A(-3; 5)$])
    line((-2.0, 0), pA, (0, 2.5), stroke: (paint: luma(180), dash: "dashed"))
  })
]],
    (
        True([$vec(O A) = (-3; 5)$]),
        [$vec(O A) = (3; -5)$],
        [$vec(O A) = (5; -3)$],
        [$vec(O A) = (-3; -5)$]
    ),
    loigiai: [
        Tọa độ của điểm $A$ chính là tọa độ của vectơ vị trí $vec(O A)$ xuất phát từ gốc tọa độ $O(0; 0)$. Do đó $vec(O A) = (-3; 5)$.
    ]
)

// TN 10
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(u) = (2; -1)$ và $vec(v) = (1; 3)$. Tọa độ của vectơ $vec(w) = 3 vec(u) - 2 vec(v)$ là],
    (
        True([$vec(w) = (4; -9)$]),
        [$vec(w) = (8; -3)$],
        [$vec(w) = (4; 3)$],
        [$vec(w) = (8; -9)$]
    ),
    loigiai: [
        Ta có $3 vec(u) = (6; -3)$ và $2 vec(v) = (2; 6)$.
        Do đó:
        $ vec(w) = 3 vec(u) - 2 vec(v) = (6 - 2; -3 - 6) = (4; -9) $
    ]
)

// TN 11
#tn([Trong mặt phẳng tọa độ $O x y$, cho điểm $M(2; -4)$. Điểm $M'$ đối xứng với $M$ qua gốc tọa độ $O$ có tọa độ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((2.7, 0), text(size: 8pt)[$x$])
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 2.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pM = (1.5, -1.8)
    let pM1 = (-1.5, 1.8)
    line(pM, pM1, stroke: (paint: luma(160), dash: "dashed"))
    circle(pM, radius: 2pt, fill: black)
    content((1.7, -2.0), text(size: 8pt)[$M(2; -4)$])
    circle(pM1, radius: 2pt, fill: rgb("dc2626"))
    content((-1.7, 2.0), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$M'$])
  })
]],
    (
        True([$M'(-2; 4)$]),
        [$M'(2; 4)$],
        [$M'(-2; -4)$],
        [$M'(4; -2)$]
    ),
    loigiai: [
        Điểm đối xứng với $M(x; y)$ qua gốc tọa độ $O(0; 0)$ có tọa độ là $(-x; -y)$.
        Với $M(2; -4)$, ta được $M'(-2; 4)$.
    ]
)

// TN 12
#tn([Trong mặt phẳng tọa độ $O x y$, vectơ nào sau đây cùng hướng với vectơ đơn vị $vec(i)$ của trục hoành $O x$?],
    (
        True([$vec(u) = (3; 0)$]),
        [$vec(v) = (-3; 0)$],
        [$vec(w) = (0; 3)$],
        [$vec(z) = (3; 3)$]
    ),
    loigiai: [
        Vectơ đơn vị của trục hoành là $vec(i) = (1; 0)$.
        Vectơ $vec(u) = (3; 0) = 3 vec(i)$ với hệ số $k = 3 > 0$ nên cùng hướng với $vec(i)$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Hệ vectơ và tam giác trong mặt phẳng tọa độ)
#ds([Trong mặt phẳng tọa độ $O x y$, cho ba điểm $A(-1; 2), B(3; 5)$ và $C(5; -1)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.0, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x$])
    line((0, -2.0), (0, 4.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (-0.8, 1.6)
    let pB = (2.4, 4.0)
    let pC = (4.0, -0.8)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-1.2, 1.6), text(size: 8pt, weight: "bold")[$A(-1; 2)$])
    circle(pB, radius: 2pt, fill: black)
    content((2.4, 4.3), text(size: 8pt, weight: "bold")[$B(3; 5)$])
    circle(pC, radius: 2pt, fill: black)
    content((4.4, -0.8), text(size: 8pt, weight: "bold")[$C(5; -1)$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ của vectơ $vec(A B)$ là $vec(A B) = (4; 3)$ và độ dài đoạn thẳng $A B = 5$.]),
    True([Tọa độ của vectơ $vec(B C)$ là $vec(B C) = (2; -6)$.]),
    True([Tọa độ trung điểm $M$ của cạnh $A C$ là $M(2; 1/2)$.]),
    [Tọa độ trọng tâm $G$ của tam giác $A B C$ là $G(7/3; 3)$.]
  ),
  loigiai: [
    #step([Tọa độ và độ dài vectơ AB])
    $vec(A B) = (3 - (-1); 5 - 2) = (4; 3)$.
    Độ dài: $A B = sqrt(4^2 + 3^2) = sqrt(25) = 5$. Mệnh đề a ĐÚNG.

    #step([Tọa độ vectơ BC])
    $vec(B C) = (5 - 3; -1 - 5) = (2; -6)$. Mệnh đề b ĐÚNG.

    #step([Tọa độ trung điểm M của AC])
    $x_M = (-1 + 5)/2 = 2, quad y_M = (2 + (-1))/2 = 1/2 => M(2; 1/2)$. Mệnh đề c ĐÚNG.

    #step([Tọa độ trọng tâm G của tam giác ABC])
    $x_G = (-1 + 3 + 5)/3 = 7/3, quad y_G = (2 + 5 + (-1))/3 = 6/3 = 2$.
    Vậy $G(7/3; 2)$ chứ không phải $G(7/3; 3)$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Tứ giác và hình bình hành trong tọa độ)
#ds([Trong mặt phẳng tọa độ $O x y$, cho ba điểm $A(1; 1), B(4; 2)$ và $C(2; 5)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (0.8, 0.8)
    let pB = (3.2, 1.6)
    let pC = (1.6, 4.0)
    let pD = (-0.8, 3.2)
    line(pA, pB, pC, stroke: 1pt + luma(140))
    line(pA, pD, pC, stroke: (paint: rgb("0d9488"), dash: "dashed", thickness: 1.2pt))
    circle(pA, radius: 2pt, fill: black)
    content((0.6, 0.6), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.4, 1.6), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((1.6, 4.2), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: rgb("0d9488"))
    content((-1.0, 3.4), text(fill: rgb("0d9488"), size: 8pt, weight: "bold")[$D$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ của vectơ $vec(B A)$ là $vec(B A) = (-3; -1)$.]),
    True([Vectơ $vec(B C)$ có tọa độ là $vec(B C) = (-2; 3)$.]),
    True([Để tứ giác $A B C D$ là hình bình hành thì tọa độ đỉnh $D$ phải thỏa mãn $vec(A D) = vec(B C)$.]),
    [Tọa độ đỉnh $D$ để tứ giác $A B C D$ là hình bình hành là $D(5; 4)$.]
  ),
  loigiai: [
    #step([Tọa độ vectơ BA và BC])
    $vec(B A) = (1 - 4; 1 - 2) = (-3; -1)$. Mệnh đề a ĐÚNG.
    $vec(B C) = (2 - 4; 5 - 2) = (-2; 3)$. Mệnh đề b ĐÚNG.

    #step([Điều kiện hình bình hành])
    Tứ giác $A B C D$ là hình bình hành khi và chỉ khi hai vectơ đối diện bằng nhau: $vec(A D) = vec(B C)$. Mệnh đề c ĐÚNG.

    #step([Tìm tọa độ đỉnh D])
    Gọi $D(x_D; y_D)$, ta có $vec(A D) = (x_D - 1; y_D - 1)$.
    $ vec(A D) = vec(B C) <=> cases(x_D - 1 = -2, y_D - 1 = 3) <=> cases(x_D = -1, y_D = 4) $
    Vậy $D(-1; 4)$ chứ không phải $D(5; 4)$. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Robot giao hàng thông minh trên bản đồ lưới)
#ds([Một robot giao hàng tự hành trong nhà kho thông minh hoạt động trên mặt sàn được mô hình hóa bằng hệ trục tọa độ $O x y$ (đơn vị mỗi trục là mét). Robot xuất phát từ trạm sạc gốc $O(0; 0)$ với vận tốc ban đầu bằng $0$.
Chặng thứ nhất: Robot di chuyển thẳng đến vị trí bốc hàng $A(30; 40)$.
Chặng thứ hai: Từ điểm $A$, robot tiếp tục di chuyển theo vectơ độ dịch chuyển $vec(u) = (20; -15)$ đến vị trí bàn giao $B$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x" (m)"$])
    line((0, -1.0), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y" (m)"$])
    content((-0.2, -0.2), [🤖 $O$])
    
    let pA = (2.4, 3.2)
    let pB = (4.0, 2.0)
    line((0, 0), pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.0, 1.8), text(fill: rgb("0d9488"), size: 8pt)[$vec(O A)$])
    line(pA, pB, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((3.3, 2.8), text(fill: rgb("1e40af"), size: 8pt)[$vec(u)$])
    circle(pA, radius: 2pt, fill: black)
    content((2.4, 3.45), text(size: 8pt, weight: "bold")[📦 $A$])
    circle(pB, radius: 2pt, fill: rgb("dc2626"))
    content((4.2, 2.2), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[🏁 $B$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Quãng đường robot đã di chuyển trong chặng thứ nhất từ trạm $O$ đến điểm $A$ bằng $50" m"$.]),
    True([Tọa độ vị trí bàn giao hàng $B$ là $B(50; 25)$.]),
    True([Vectơ độ dịch chuyển tổng hợp của robot từ gốc $O$ đến đích $B$ là $vec(d) = (50; 25)$.]),
    [Độ lớn của vectơ dịch chuyển ở chặng thứ hai bằng $35" m"$.]
  ),
  loigiai: [
    #step([Tính độ dài chặng 1])
    Khoảng cách $O A = sqrt(30^2 + 40^2) = sqrt(900 + 1600) = sqrt(2500) = 50" m"$. Mệnh đề a ĐÚNG.

    #step([Xác định tọa độ điểm B])
    Ta có $vec(A B) = vec(u) = (20; -15)$.
    $ cases(x_B - x_A = 20, y_B - y_A = -15) <=> cases(x_B = 30 + 20 = 50, y_B = 40 - 15 = 25) $
    Vậy $B(50; 25)$. Mệnh đề b ĐÚNG.

    #step([Vectơ độ dịch chuyển tổng hợp])
    $vec(d) = vec(O B) = (x_B - 0; y_B - 0) = (50; 25)$. Mệnh đề c ĐÚNG.

    #step([Tính độ lớn dịch chuyển chặng 2])
    Độ lớn vectơ $vec(u)$:
    $ |vec(u)| = sqrt(20^2 + (-15)^2) = sqrt(400 + 225) = sqrt(625) = 25" m" $
    Giá trị đúng là $25" m"$ chứ không phải $35" m"$. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Vận tốc tổng hợp ca nô vượt sông)
#ds([Một chiếc ca nô cứu hộ xuất phát từ bờ nam con sông (gắn với trục $O x$), di chuyển sang bờ bắc. Vận tốc của dòng nước chảy theo hướng Đông (dọc theo trục hoành) được biểu diễn bởi vectơ $vec(v)_n = (4; 0)$ (đơn vị: $"km/h"$). Vận tốc riêng của ca nô đối với dòng nước hướng sang bờ đối diện có tọa độ $vec(v)_c = (3; 8)$ (đơn vị: $"km/h"$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Hai bờ sông
    line((-1.0, 0), (5.5, 0), stroke: 1.5pt + luma(100))
    line((-1.0, 3.2), (5.5, 3.2), stroke: 1.5pt + luma(100))
    content((5.0, -0.3), text(size: 8pt)[Bờ nam])
    content((5.0, 3.5), text(size: 8pt)[Bờ bắc])
    
    // Gốc O
    circle((0, 0), radius: 2.5pt, fill: black)
    content((-0.3, -0.3), [🚤 $O$])
    
    // Vận tốc dòng nước vn
    line((0, 0), (2.0, 0), mark: (end: ">", fill: rgb("0284c7")), stroke: 1.8pt + rgb("0284c7"))
    content((1.0, -0.3), text(fill: rgb("0284c7"), size: 8pt)[$vec(v)_n$ (nước)])
    
    // Vận tốc ca nô vc
    line((0, 0), (1.2, 3.2), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.4, 1.8), text(fill: rgb("0d9488"), size: 8pt)[$vec(v)_c$])
    
    // Vận tốc tổng hợp v
    line((0, 0), (3.2, 3.2), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((2.2, 1.5), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(v)$ (thực tế)])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vận tốc thực tế của ca nô đối với bờ sông là tổng hợp của hai vectơ: $vec(v) = vec(v)_c + vec(v)_n$.]),
    True([Tọa độ của vectơ vận tốc thực tế $vec(v)$ là $vec(v) = (7; 8)$ ($"km/h"$).]),
    True([Tốc độ dòng nước chảy có độ lớn bằng $4" km/h"$.]),
    [Tốc độ thực tế của ca nô đối với bờ sông bằng đúng $15" km/h"$.]
  ),
  loigiai: [
    #step([Công thức cộng vận tốc])
    Theo quy tắc cộng vận tốc trong chuyển động:
    $ vec(v) = vec(v)_c + vec(v)_n $
    Mệnh đề a ĐÚNG.

    #step([Tính tọa độ vectơ vận tốc thực tế])
    $ vec(v) = (3 + 4; 8 + 0) = (7; 8)" (km/h)" $
    Mệnh đề b ĐÚNG.

    #step([Độ lớn vận tốc dòng nước])
    $|vec(v)_n| = sqrt(4^2 + 0^2) = 4" km/h"$. Mệnh đề c ĐÚNG.

    #step([Tính tốc độ thực tế đối với bờ])
    Tốc độ thực tế của ca nô:
    $ v = |vec(v)| = sqrt(7^2 + 8^2) = sqrt(49 + 64) = sqrt(113) approx 10.63" km/h" != 15" km/h" $
    Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 3)$ và $B(-5; 11)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-3.0, 0), (2.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((2.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y$])
    content((0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (0.5, 1.0)
    let pB = (-2.5, 3.6)
    line(pA, pB, stroke: 1.5pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((0.8, 0.9), text(size: 8pt)[$A(1; 3)$])
    circle(pB, radius: 2pt, fill: black)
    content((-2.5, 3.9), text(size: 8pt)[$B(-5; 11)$])
  })
]
Tính độ dài đoạn thẳng $A B$.],
    [10],
    loigiai: [
        #step([Tính tọa độ vectơ AB])
        $ vec(A B) = (-5 - 1; 11 - 3) = (-6; 8) $
        
        #step([Tính độ dài đoạn thẳng AB])
        $ A B = |vec(A B)| = sqrt((-6)^2 + 8^2) = sqrt(36 + 64) = sqrt(100) = 10 $
    ]
)

// TLN 2 (Câu 18)
#tln([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(a) = (2; -3)$ và $vec(b) = (-1; 5)$. Biết vectơ $vec(u) = 2 vec(a) + 3 vec(b)$ có tọa độ là $(x_0; y_0)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((2.7, 0), text(size: 8pt)[$x$])
    line((0, -2.0), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    line((0, 0), (0.8, 3.0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((1.0, 3.2), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(u) = 2 vec(a) + 3 vec(b)$])
  })
]
Tính giá trị của tổng $S = x_0 + y_0$.],
    [10],
    loigiai: [
        #step([Tính tọa độ các vectơ thành phần])
        $ 2 vec(a) = (4; -6), quad 3 vec(b) = (-3; 15) $
        
        #step([Tính tọa độ vectơ u])
        $ vec(u) = 2 vec(a) + 3 vec(b) = (4 + (-3); -6 + 15) = (1; 9) $
        Suy ra $x_0 = 1, y_0 = 9$.
        
        #step([Tính tổng S])
        $ S = x_0 + y_0 = 1 + 9 = 10 $
    ]
)

// TLN 3 (Câu 19)
#tln([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có $A(2; 3), B(-1; 0)$ và trọng tâm $G(1; 2)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1.5, 0), (3.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((3.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.5, 2.5)
    let pB = (-0.8, 0)
    let pC = (1.5, 2.5)
    let pG = (0.7, 1.5)
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.8), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.8, -0.3), text(size: 8pt)[$B$])
    circle(pG, radius: 2pt, fill: rgb("dc2626"))
    content((0.9, 1.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$G$])
  })
]
Tìm tung độ $y_C$ của đỉnh $C$.],
    [3],
    loigiai: [
        #step([Sử dụng công thức tọa độ trọng tâm])
        Gọi tọa độ đỉnh $C$ là $C(x_C; y_C)$. Vì $G(1; 2)$ là trọng tâm tam giác $A B C$:
        $ y_G = (y_A + y_B + y_C) / 3 <=> 2 = (3 + 0 + y_C) / 3 $
        
        #step([Giải tìm yC])
        $ 3 + y_C = 6 <=> y_C = 3 $
        Vậy tung độ đỉnh $C$ là $3$.
    ]
)

// TLN 4 (Câu 20)
#tln([Trong mặt phẳng tọa độ $O x y$, cho ba điểm $A(1; 2), B(3; 1), C(5; 4)$. Điểm $D(x_D; y_D)$ thỏa mãn tứ giác $A B C D$ là một hình bình hành.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (0.8, 1.6)
    let pB = (2.4, 0.8)
    let pC = (4.0, 3.2)
    let pD = (2.4, 4.0)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((0.6, 1.6), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.4, 0.5), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((4.2, 3.2), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: rgb("dc2626"))
    content((2.4, 4.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$D$])
  })
]
Tính tổng hoành độ và tung độ của đỉnh $D$: $T = x_D + y_D$.],
    [8],
    loigiai: [
        #step([Điều kiện hình bình hành ABCD])
        Tứ giác $A B C D$ là hình bình hành khi và chỉ khi:
        $ vec(A D) = vec(B C) $
        
        #step([Thiết lập phương trình tọa độ])
        Ta có $vec(B C) = (5 - 3; 4 - 1) = (2; 3)$.
        $vec(A D) = (x_D - 1; y_D - 2)$.
        $ cases(x_D - 1 = 2, y_D - 2 = 3) <=> cases(x_D = 3, y_D = 5) $
        Vậy $D(3; 5)$.
        
        #step([Tính tổng T])
        $ T = x_D + y_D = 3 + 5 = 8 $
    ]
)

// TLN 5 (Câu 21 - Thực tế Trạm phát sóng viễn thông cân bằng)
#tln([Ba cụm dân cư nông thôn mới được xác định vị trí trên bản đồ địa chính với tọa độ lần lượt là $A(2; 5), B(6; 1)$ và $C(10; 9)$ (đơn vị: kilômét). Để chất lượng phủ sóng mạng $5"G"$ đến ba khu dân cư là tối ưu và cân bằng nhất, nhà mạng quyết định đặt một trạm phát sóng chính tại vị trí trọng tâm $G(x_G; y_G)$ của tam giác $A B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x" (km)"$])
    line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.7), text(size: 8pt)[$y" (km)"$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.0, 2.5)
    let pB = (3.0, 0.5)
    let pC = (5.0, 4.2)
    let pG = (3.0, 2.4)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    content(pA, [🏡 $A$], anchor: "south")
    content(pB, [🏡 $B$], anchor: "north")
    content(pC, [🏡 $C$], anchor: "south")
    circle(pG, radius: 3pt, fill: rgb("1e40af"))
    content(pG, [📡 $G$], anchor: "west")
  })
]
Tính khoảng cách từ trạm phát sóng $G$ đến gốc tọa độ trung tâm $O(0; 0)$ theo đơn vị kilômét (làm tròn kết quả đến chữ số hàng đơn vị).],
    [8],
    loigiai: [
        #step([Tìm tọa độ trạm phát sóng G])
        Vì $G$ là trọng tâm tam giác $A B C$:
        $ x_G = (2 + 6 + 10) / 3 = 18/3 = 6 $
        $ y_G = (5 + 1 + 9) / 3 = 15/3 = 5 $
        Vậy tọa độ trạm phát sóng là $G(6; 5)$.
        
        #step([Tính khoảng cách từ G đến gốc O])
        $ O G = sqrt(x_G^2 + y_G^2) = sqrt(6^2 + 5^2) = sqrt(36 + 25) = sqrt(61) approx 7.81" km" $
        Làm tròn đến chữ số hàng đơn vị ta được $8" km"$.
    ]
)

// TLN 6 (Câu 22 - Thực tế Tuyến cáp ngầm kết nối hải đảo)
#tln([Trên bản đồ quy hoạch hàng hải (hệ trục $O x y$, đơn vị: hải lý), trạm radar bờ biển đặt tại $A(3; 4)$, một trạm thuỷ văn trên đảo tại $B(15; 9)$. Do ảnh hưởng của địa tầng đáy biển, tuyến cáp ngầm nối $A$ và $B$ phải đi qua một trạm nối trung gian $M$ nằm trên đoạn thẳng $A B$ sao cho thỏa mãn hệ thức vectơ $vec(A M) = 1/4 vec(A B)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.0, 1.2)
    let pM = (2.0, 1.5)
    let pB = (5.0, 2.5)
    line(pA, pB, stroke: 1.5pt + rgb("0284c7"))
    circle(pA, radius: 2.5pt, fill: rgb("1e40af"))
    content(pA, [🗼 $A$], anchor: "south")
    circle(pB, radius: 2.5pt, fill: rgb("1e40af"))
    content(pB, [🏝️ $B$], anchor: "south")
    circle(pM, radius: 2.5pt, fill: rgb("dc2626"))
    content(pM, [⚓ $M$], anchor: "north")
  })
]
Tính hoành độ $x_M$ của trạm nối trung gian $M$.],
    [6],
    loigiai: [
        #step([Tính tọa độ vectơ AB])
        $ vec(A B) = (15 - 3; 9 - 4) = (12; 5) $
        
        #step([Sử dụng hệ thức vectơ AM])
        Vì $vec(A M) = 1/4 vec(A B)$ nên:
        $ vec(A M) = (1/4 dot 12; 1/4 dot 5) = (3; 1.25) $
        
        #step([Tính hoành độ của điểm M])
        Ta có $vec(A M) = (x_M - x_A; y_M - y_A) = (x_M - 3; y_M - 4)$.
        Suy ra:
        $ x_M - 3 = 3 <=> x_M = 6 $
        Vậy hoành độ của trạm nối trung gian $M$ là $6$.
    ]
)

] // end make-questions

#make-questions()
