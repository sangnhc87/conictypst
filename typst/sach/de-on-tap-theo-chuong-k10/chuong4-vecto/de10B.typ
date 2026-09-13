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
  exam-title: "BÀI 10: VECTƠ TRONG MẶT PHẲNG TỌA ĐỘ (ĐỀ SỐ 2)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "111",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong mặt phẳng tọa độ $O x y$, điều kiện cần và đủ để hai vectơ $vec(u) = (x_1; y_1)$ và $vec(v) = (x_2; y_2)$ ($vec(v) != vec(0)$) cùng phương là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    line((0, 0), (1.5, 1.0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.2, 1.2), text(fill: rgb("0d9488"), size: 8pt)[$vec(u)$])
    line((0, 0), (3.0, 2.0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.2pt + rgb("1e40af"))
    content((2.8, 2.2), text(fill: rgb("1e40af"), size: 8pt)[$vec(v) = k vec(u)$])
  })
]],
    (
        True([$x_1 y_2 - x_2 y_1 = 0$]),
        [$x_1 x_2 + y_1 y_2 = 0$],
        [$x_1 y_1 - x_2 y_2 = 0$],
        [$x_1 + y_1 = x_2 + y_2$]
    ),
    loigiai: [
        Hai vectơ $vec(u) = (x_1; y_1)$ và $vec(v) = (x_2; y_2)$ cùng phương khi và chỉ khi tồn tại số thực $k$ sao cho $vec(u) = k vec(v)$, điều này tương đương với biểu thức tích chéo: $x_1 y_2 - x_2 y_1 = 0$.
    ]
)

// TN 2
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(u) = (2; 3)$ và $vec(v) = (4; m)$. Tìm giá trị của tham số $m$ để hai vectơ $vec(u)$ và $vec(v)$ cùng phương với nhau.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((3.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    line((0, 0), (1.2, 1.5), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.9, 1.6), text(fill: rgb("0d9488"), size: 8pt)[$vec(u)(2; 3)$])
    line((0, 0), (2.4, 3.0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.2pt + rgb("1e40af"))
    content((2.2, 3.2), text(fill: rgb("1e40af"), size: 8pt)[$vec(v)(4; m)$])
  })
]],
    (
        True([$m = 6$]),
        [$m = -6$],
        [$m = 8/3$],
        [$m = 5$]
    ),
    loigiai: [
        Hai vectơ $vec(u)$ và $vec(v)$ cùng phương khi và chỉ khi:
        $ 4 / 2 = m / 3 <=> 2 = m / 3 <=> m = 6 $
    ]
)

// TN 3
#tn([Trong mặt phẳng tọa độ $O x y$, cho ba điểm $A(1; 1), B(2; 3)$ và $C(3; 5)$. Khẳng định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.8), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.0), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (0.8, 0.8)
    let pB = (1.8, 2.0)
    let pC = (2.8, 3.2)
    line(pA, pC, stroke: 1.5pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.6, 0.9), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((1.6, 2.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.6, 3.4), text(size: 8pt)[$C$])
  })
]],
    (
        True([Ba điểm $A, B, C$ thẳng hàng và $B$ là trung điểm của $A C$.]),
        [Ba điểm $A, B, C$ tạo thành một tam giác vuông.],
        [Ba điểm $A, B, C$ tạo thành một tam giác cân.],
        [Điểm $A$ nằm giữa hai điểm $B$ và $C$.]
    ),
    loigiai: [
        Ta có $vec(A B) = (2 - 1; 3 - 1) = (1; 2)$ và $vec(B C) = (3 - 2; 5 - 3) = (1; 2)$.
        Vì $vec(A B) = vec(B C)$ nên ba điểm $A, B, C$ thẳng hàng và $B$ là trung điểm của đoạn thẳng $A C$.
    ]
)

// TN 4
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ không cùng phương $vec(a) = (1; 2)$ và $vec(b) = (3; 4)$. Phân tích vectơ $vec(c) = (7; 10)$ theo hai vectơ $vec(a), vec(b)$ ta được
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.8), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.0), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    line((0, 0), (0.8, 1.2), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((0.5, 1.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(a)$])
    line((0, 0), (1.8, 2.0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((1.5, 2.2), text(fill: rgb("0d9488"), size: 8pt)[$vec(b)$])
    line((0, 0), (3.2, 3.2), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((3.4, 3.2), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[$vec(c)$])
  })
]],
    (
        True([$vec(c) = vec(a) + 2 vec(b)$]),
        [$vec(c) = 2 vec(a) + vec(b)$],
        [$vec(c) = - vec(a) + 3 vec(b)$],
        [$vec(c) = 3 vec(a) + vec(b)$]
    ),
    loigiai: [
        Giả sử $vec(c) = x vec(a) + y vec(b)$. Ta có hệ phương trình:
        $ cases(x + 3y = 7, 2x + 4y = 10) <=> cases(x = 1, y = 2) $
        Vậy $vec(c) = vec(a) + 2 vec(b)$.
    ]
)

// TN 5
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; -2)$ và $B(3; 2)$. Tọa độ giao điểm $M$ của đường thẳng $A B$ với trục hoành $O x$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -2.0), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 2.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.2, -1.6)
    let pB = (3.6, 1.6)
    let pM = (2.4, 0)
    line(pA, pB, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((1.2, -1.9), text(size: 8pt)[$A(1; -2)$])
    circle(pB, radius: 2pt, fill: black)
    content((3.6, 1.9), text(size: 8pt)[$B(3; 2)$])
    circle(pM, radius: 2.5pt, fill: rgb("dc2626"))
    content((2.4, -0.35), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$M$])
  })
]],
    (
        True([$M(2; 0)$]),
        [$M(1.5; 0)$],
        [$M(0; 2)$],
        [$M(-2; 0)$]
    ),
    loigiai: [
        Vì $M in O x$ nên $M(x; 0)$.
        Ta có $vec(A B) = (3 - 1; 2 - (-2)) = (2; 4)$ và $vec(A M) = (x - 1; 0 - (-2)) = (x - 1; 2)$.
        Ba điểm $A, B, M$ thẳng hàng khi và chỉ khi:
        $ (x - 1) / 2 = 2 / 4 <=> x - 1 = 1 <=> x = 2 $
        Vậy $M(2; 0)$.
    ]
)

// TN 6
#tn([Trong mặt phẳng tọa độ $O x y$, cho hình bình hành $A B C D$ có $A(1; 0), B(0; 2), C(-2; 1)$. Tọa độ tâm $O'$ của hình bình hành là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.5, 0), (2.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((2.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 2.7), text(size: 8pt)[$y$])
    content((0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.2, 0)
    let pB = (0, 1.8)
    let pC = (-1.8, 1.0)
    let pD = (-0.6, -0.8)
    let pOp = (-0.3, 0.5)
    line(pA, pB, pC, pD, close: true, stroke: 1pt + luma(160))
    line(pA, pC, stroke: (paint: luma(180), dash: "dashed"))
    circle(pOp, radius: 2pt, fill: rgb("dc2626"))
    content((-0.3, 0.75), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$O'$])
  })
]],
    (
        True([$O'(-1/2; 1/2)$]),
        [$O'(1/2; 1/2)$],
        [$O'(-1; 1)$],
        [$O'(-1/2; 3/2)$]
    ),
    loigiai: [
        Tâm $O'$ của hình bình hành $A B C D$ chính là trung điểm của đường chéo $A C$:
        $ x_{O'} = (x_A + x_C) / 2 = (1 + (-2)) / 2 = -1/2 $
        $ y_{O'} = (y_A + y_C) / 2 = (0 + 1) / 2 = 1/2 $
        Vậy $O'(-1/2; 1/2)$.
    ]
)

// TN 7
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(u) = (-3; 6)$ và $vec(v) = (1; -2)$. Mối quan hệ giữa hai vectơ $vec(u)$ và $vec(v)$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.5, 0), (2.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((2.2, 0), text(size: 8pt)[$x$])
    line((0, -2.0), (0, 3.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    line((0, 0), (0.8, -1.2), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.0, -1.3), text(fill: rgb("0d9488"), size: 8pt)[$vec(v)$])
    line((0, 0), (-2.0, 2.5), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((-2.2, 2.6), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$vec(u) = -3 vec(v)$])
  })
]],
    (
        True([Hai vectơ cùng phương và ngược hướng nhau.]),
        [Hai vectơ cùng phương và cùng hướng nhau.],
        [Hai vectơ vuông góc với nhau.],
        [Hai vectơ có độ dài bằng nhau.]
    ),
    loigiai: [
        Ta có:
        $ vec(u) = (-3; 6) = -3(1; -2) = -3 vec(v) $
        Vì hệ số $k = -3 < 0$ nên hai vectơ $vec(u)$ và $vec(v)$ cùng phương và ngược hướng nhau.
    ]
)

// TN 8
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có $A(3; 5), B(1; 2)$ và $C(5; 2)$. Vectơ đường trung tuyến $vec(A M)$ xuất phát từ đỉnh $A$ có phương
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (2.4, 3.5)
    let pB = (1.0, 1.5)
    let pC = (3.8, 1.5)
    let pM = (2.4, 1.5)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((2.4, 3.8), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((0.8, 1.5), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((4.0, 1.5), text(size: 8pt)[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((2.4, 1.2), text(size: 8pt)[$M$])
  })
]],
    (
        True([Song song hoặc trùng với trục tung $O y$.]),
        [Song song hoặc trùng với trục hoành $O x$.],
        [Trùng với đường phân giác góc phần tư thứ nhất.],
        [Tạo với trục $O x$ một góc $45^circ$.]
    ),
    loigiai: [
        Trung điểm $M$ của cạnh $B C$: $M((1+5)/2; (2+2)/2) = M(3; 2)$.
        Vectơ trung tuyến $vec(A M) = (3 - 3; 2 - 5) = (0; -3)$.
        Vì hoành độ bằng $0$ nên vectơ $vec(A M)$ có phương thẳng đứng, song song (hoặc nằm trên) trục tung $O y$.
    ]
)

// TN 9
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(-2; 4)$ và $B(1; 1)$. Điểm $P$ thuộc đoạn thẳng $A B$ sao cho $vec(A P) = 2 vec(P B)$. Tọa độ của điểm $P$ là],
    (
        True([$P(0; 2)$]),
        [$P(-1; 3)$],
        [$P(0; 3)$],
        [$P(2; 0)$]
    ),
    loigiai: [
        Gọi $P(x; y)$, ta có $vec(A P) = (x + 2; y - 4)$ và $vec(P B) = (1 - x; 1 - y)$.
        $ vec(A P) = 2 vec(P B) <=> cases(x + 2 = 2(1 - x), y - 4 = 2(1 - y)) <=> cases(3x = 0, 3y = 6) <=> cases(x = 0, y = 2) $
        Vậy $P(0; 2)$.
    ]
)

// TN 10
#tn([Trong mặt phẳng tọa độ $O x y$, cho bốn điểm $A(1; 2), B(3; 6), C(7; 4), D(5; 0)$. Tứ giác $A B C D$ là hình gì?],
    (
        True([Hình bình hành]),
        [Hình thang cân nhưng không là hình bình hành],
        [Hình vuông],
        [Hình thoi]
    ),
    loigiai: [
        Tính tọa độ hai vectơ đối diện:
        $ vec(A B) = (3 - 1; 6 - 2) = (2; 4) $
        $ vec(D C) = (7 - 5; 4 - 0) = (2; 4) $
        Vì $vec(A B) = vec(D C)$ nên tứ giác $A B C D$ là hình bình hành.
    ]
)

// TN 11
#tn([Trong mặt phẳng tọa độ $O x y$, góc giữa vectơ đơn vị $vec(i)$ của trục hoành và vectơ đơn vị $vec(j)$ của trục tung bằng bao nhiêu?],
    (
        True([$90^circ$]),
        [$0^circ$],
        [$180^circ$],
        [$45^circ$]
    ),
    loigiai: [
        Hệ trục tọa độ $O x y$ gồm hai trục tọa độ $O x$ và $O y$ vuông góc với nhau tại gốc $O$, do đó hai vectơ đơn vị $vec(i)$ và $vec(j)$ vuông góc với nhau, góc giữa chúng bằng $90^circ$.
    ]
)

// TN 12
#tn([Trong mặt phẳng tọa độ $O x y$, vectơ đối của vectơ $vec(u) = (-5; 7)$ là],
    (
        True([$-vec(u) = (5; -7)$]),
        [$-vec(u) = (-5; -7)$],
        [$-vec(u) = (5; 7)$],
        [$-vec(u) = (7; -5)$]
    ),
    loigiai: [
        Vectơ đối của vectơ $vec(u) = (x; y)$ là $-vec(u) = (-x; -y)$.
        Với $vec(u) = (-5; 7)$, suy ra $-vec(u) = (5; -7)$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Ba điểm thẳng hàng và tham số)
#ds([Trong mặt phẳng tọa độ $O x y$, cho ba điểm $A(1; 3), B(2; 5)$ và $C(4; 9)$. Điểm $D$ có tọa độ $D(m; 1)$ với $m in bb(R)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1.0, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (0.8, 1.2)
    let pB = (1.6, 2.2)
    let pC = (3.2, 4.2)
    let pD = (0, 0.4)
    line(pD, pC, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.6, 1.4), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((1.4, 2.4), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.0, 4.4), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: rgb("dc2626"))
    content((0.3, 0.4), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$D$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ của hai vectơ là $vec(A B) = (1; 2)$ và $vec(A C) = (3; 6)$.]),
    True([Ba điểm $A, B, C$ thẳng hàng vì $vec(A C) = 3 vec(A B)$.]),
    True([Vectơ $vec(A D)$ có tọa độ theo tham số $m$ là $vec(A D) = (m - 1; -2)$.]),
    [Điểm $D(m; 1)$ thẳng hàng với hai điểm $A, B$ khi và chỉ khi $m = 2$.]
  ),
  loigiai: [
    #step([Tọa độ các vectơ AB và AC])
    $vec(A B) = (2 - 1; 5 - 3) = (1; 2)$.
    $vec(A C) = (4 - 1; 9 - 3) = (3; 6)$. Mệnh đề a ĐÚNG.

    #step([Kiểm tra ba điểm A, B, C thẳng hàng])
    Ta thấy $vec(A C) = (3; 6) = 3(1; 2) = 3 vec(A B)$.
    Do đó hai vectơ cùng phương, suy ra ba điểm $A, B, C$ thẳng hàng. Mệnh đề b ĐÚNG.

    #step([Tọa độ vectơ AD])
    $vec(A D) = (m - 1; 1 - 3) = (m - 1; -2)$. Mệnh đề c ĐÚNG.

    #step([Điều kiện để D thẳng hàng với A, B])
    Ba điểm $A, B, D$ thẳng hàng khi và chỉ khi $vec(A D)$ cùng phương với $vec(A B)$:
    $ (m - 1) / 1 = (-2) / 2 <=> m - 1 = -1 <=> m = 0 $
    Giá trị đúng là $m = 0$ chứ không phải $m = 2$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Phân tích vectơ theo cơ sở)
#ds([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(a) = (2; 1)$ và $vec(b) = (-1; 3)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1.5, 0), (3.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((3.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    line((0, 0), (2.0, 1.0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((2.1, 0.8), text(fill: rgb("0d9488"), size: 8pt)[$vec(a)$])
    line((0, 0), (-1.0, 3.0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.2, 3.1), text(fill: rgb("0d9488"), size: 8pt)[$vec(b)$])
    line((0, 0), (1.0, 4.0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.5pt + rgb("1e40af"))
    content((1.2, 4.0), text(fill: rgb("1e40af"), size: 8pt)[$vec(u)$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ $vec(a)$ và $vec(b)$ không cùng phương vì $2 / (-1) != 1 / 3$.]),
    True([Vectơ tổng $vec(u) = vec(a) + vec(b) = (1; 4)$ có độ dài $|vec(u)| = sqrt(17)$.]),
    True([Vectơ $vec(c) = (3; 5)$ có thể phân tích thành tổ hợp tuyến tính $vec(c) = x vec(a) + y vec(b)$.]),
    [Biểu diễn của vectơ $vec(c) = (3; 5)$ qua hai vectơ $vec(a), vec(b)$ là $vec(c) = 3 vec(a) - vec(b)$.]
  ),
  loigiai: [
    #step([Kiểm tra tính cùng phương của a và b])
    Vì $2 / (-1) != 1 / 3$ (tức $-2 != 1/3$) nên hai vectơ $vec(a)$ và $vec(b)$ không cùng phương. Mệnh đề a ĐÚNG.

    #step([Tính tọa độ và độ dài vectơ tổng u])
    $vec(u) = vec(a) + vec(b) = (2 + (-1); 1 + 3) = (1; 4)$.
    $|vec(u)| = sqrt(1^2 + 4^2) = sqrt(17)$. Mệnh đề b ĐÚNG.

    #step([Khả năng phân tích của c])
    Do $vec(a), vec(b)$ không cùng phương nên mọi vectơ trong mặt phẳng đều phân tích duy nhất theo hệ cơ sở này. Mệnh đề c ĐÚNG.

    #step([Tìm hệ số phân tích của c])
    Giả sử $vec(c) = x vec(a) + y vec(b)$:
    $ cases(2x - y = 3, x + 3y = 5) <=> cases(y = 2x - 3, x + 3(2x - 3) = 5) <=> cases(7x = 14, y = 2x - 3) <=> cases(x = 2, y = 1) $
    Vậy $vec(c) = 2 vec(a) + vec(b)$ chứ không phải $3 vec(a) - vec(b)$. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Giám sát không lưu hai đường bay song song)
#ds([Trên màn hình giám sát radar kiểm soát không lưu (hệ tọa độ $O x y$, đơn vị khoảng cách: kilômét), tại cùng thời điểm $t = 0$:
- Máy bay chở khách thứ nhất $A$ ở tọa độ $A(100; 200)$, bay thẳng đều với vectơ vận tốc $vec(v)_A = (400; 300)$ (đơn vị: $"km/h"$).
- Máy bay chở khách thứ hai $B$ ở tọa độ $B(200; 150)$, bay thẳng đều với vectơ vận tốc $vec(v)_B = (400; 300)$ (đơn vị: $"km/h"$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x" (km)"$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y" (km)"$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.5, 3.0)
    let pB = (2.8, 1.8)
    line(pA, (3.5, 4.5), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content(pA, [✈️ $A$], anchor: "south-east")
    line(pB, (4.8, 3.3), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content(pB, [✈️ $B$], anchor: "south-east")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ vận tốc của hai máy bay bằng nhau: $vec(v)_A = vec(v)_B$.]),
    True([Hai máy bay đang bay theo hai hướng song song cùng chiều với nhau.]),
    True([Tốc độ di chuyển của mỗi chiếc máy bay đều bằng $500" km/h"$.]),
    [Khoảng cách giữa hai máy bay thay đổi liên tục theo thời gian bay.]
  ),
  loigiai: [
    #step([So sánh vectơ vận tốc])
    $vec(v)_A = vec(v)_B = (400; 300)$. Hai vectơ vận tốc bằng nhau. Mệnh đề a ĐÚNG.

    #step([Phương và hướng bay])
    Vì $vec(v)_A = vec(v)_B$ nên hướng chuyển động của hai máy bay song song cùng chiều. Mệnh đề b ĐÚNG.

    #step([Tính tốc độ bay])
    Tốc độ bay:
    $ v = |vec(v)_A| = sqrt(400^2 + 300^2) = sqrt(160000 + 90000) = sqrt(250000) = 500" km/h" $
    Mệnh đề c ĐÚNG.

    #step([Khoảng cách giữa hai máy bay theo thời gian])
    Vectơ vị trí tương đối giữa hai máy bay:
    $ vec(A B)(t) = vec(r)_B(t) - vec(r)_A(t) = (vec(r)_B(0) + vec(v)_B t) - (vec(r)_A(0) + vec(v)_A t) = vec(r)_B(0) - vec(r)_A(0) = vec(A B)(0) $
    Vì $vec(v)_A = vec(v)_B$ nên vectơ dịch chuyển tương đối không đổi, khoảng cách giữa hai máy bay luôn cố định và không thay đổi theo thời gian. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Tàu cứu nạn trên biển định vị thẳng hàng)
#ds([Một trạm cứu nạn hàng hải ven biển đặt tại gốc tọa độ $O(0; 0)$ (đơn vị bản đồ: hải lý). Tàu cứu hộ đang thực hiện nhiệm vụ tuần tra ven biển. Trên hải trình, tàu lần lượt đi qua hai phao tiêu định vị có tọa độ $M(10; 20)$ và $N(30; 60)$. Một tàu cá của ngư dân bị hỏng máy đang neo đậu chờ ứng cứu tại vị trí $P(50; 100)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), [🗼 $O$])
    
    let pM = (1.0, 0.8)
    let pN = (2.5, 2.0)
    let pP = (4.5, 3.6)
    line((0, 0), pP, stroke: 1.5pt + rgb("0284c7"))
    circle(pM, radius: 2.5pt, fill: rgb("0d9488"))
    content(pM, [🛟 $M$], anchor: "north-west")
    circle(pN, radius: 2.5pt, fill: rgb("0d9488"))
    content(pN, [🛟 $N$], anchor: "north-west")
    circle(pP, radius: 3pt, fill: rgb("dc2626"))
    content(pP, [🚢 $P$], anchor: "south-east")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ của hai vectơ vị trí là $vec(O M) = (10; 20)$ và $vec(O N) = (30; 60)$.]),
    True([Hai vectơ $vec(O M)$ và $vec(O N)$ cùng phương và thỏa mãn $vec(O N) = 3 vec(O M)$.]),
    True([Tàu cá $P(50; 100)$ nằm thẳng hàng với tuyến hải trình đi qua trạm $O$ và hai phao tiêu $M, N$.]),
    [Khoảng cách từ trạm $O$ đến tàu cá $P$ đúng bằng $100$ hải lý.]
  ),
  loigiai: [
    #step([Tọa độ vectơ vị trí])
    $vec(O M) = (10; 20)$ và $vec(O N) = (30; 60)$. Mệnh đề a ĐÚNG.

    #step([Mối liên hệ giữa OM và ON])
    Ta có $(30; 60) = 3(10; 20) => vec(O N) = 3 vec(O M)$. Hai vectơ cùng phương. Mệnh đề b ĐÚNG.

    #step([Kiểm tra tính thẳng hàng của tàu cá P])
    $vec(O P) = (50; 100) = 5(10; 20) = 5 vec(O M)$.
    Do đó điểm $P$ nằm trên cùng đường thẳng đi qua $O, M, N$. Mệnh đề c ĐÚNG.

    #step([Tính khoảng cách từ trạm O đến tàu cá P])
    $ O P = sqrt(50^2 + 100^2) = sqrt(2500 + 10000) = sqrt(12500) = 50 sqrt(5) approx 111.8" hải lý" != 100" hải lý" $
    Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Trong mặt phẳng tọa độ $O x y$, cho ba điểm $A(1; 2), B(3; 5)$ và $C(x; 11)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (0.8, 0.8)
    let pB = (1.8, 1.8)
    let pC = (3.8, 3.8)
    line(pA, pC, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.6, 0.9), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((1.6, 2.0), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: rgb("dc2626"))
    content((3.8, 4.0), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$C$])
  })
]
Tìm giá trị của $x$ để ba điểm $A, B, C$ thẳng hàng.],
    [7],
    loigiai: [
        #step([Tính tọa độ các vectơ AB và AC])
        $ vec(A B) = (3 - 1; 5 - 2) = (2; 3) $
        $ vec(A C) = (x - 1; 11 - 2) = (x - 1; 9) $
        
        #step([Điều kiện để ba điểm thẳng hàng])
        Ba điểm $A, B, C$ thẳng hàng khi và chỉ khi $vec(A B)$ và $vec(A C)$ cùng phương:
        $ (x - 1) / 2 = 9 / 3 <=> (x - 1) / 2 = 3 <=> x - 1 = 6 <=> x = 7 $
        Vậy $x = 7$.
    ]
)

// TLN 2 (Câu 18)
#tln([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(u) = (m - 1; 4)$ và $vec(v) = (3; 2)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((3.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    line((0, 0), (1.5, 1.0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.2, 1.2), text(fill: rgb("0d9488"), size: 8pt)[$vec(v)(3; 2)$])
    line((0, 0), (3.0, 2.0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.2pt + rgb("1e40af"))
    content((2.8, 2.2), text(fill: rgb("1e40af"), size: 8pt)[$vec(u)$])
  })
]
Tìm giá trị của tham số $m$ để hai vectơ $vec(u)$ và $vec(v)$ cùng phương với nhau.],
    [7],
    loigiai: [
        #step([Thiết lập điều kiện cùng phương])
        Hai vectơ cùng phương khi và chỉ khi:
        $ (m - 1) / 3 = 4 / 2 <=> (m - 1) / 3 = 2 $
        
        #step([Giải tìm m])
        $ m - 1 = 6 <=> m = 7 $
        Vậy $m = 7$.
    ]
)

// TLN 3 (Câu 19)
#tln([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có $A(-1; 1), B(3; 2), C(1; 5)$. Điểm $D(x_D; y_D)$ thỏa mãn tứ giác $A B C D$ là hình bình hành.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.0, 0), (3.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((3.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (-0.8, 0.8)
    let pB = (2.2, 1.5)
    let pC = (0.7, 3.2)
    let pD = (-1.8, 2.5)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.8, 0.5), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.2, 1.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0.7, 3.4), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: rgb("dc2626"))
    content((-1.8, 2.8), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$D$])
  })
]
Tìm tung độ $y_D$ của đỉnh $D$.],
    [4],
    loigiai: [
        #step([Điều kiện hình bình hành])
        Tứ giác $A B C D$ là hình bình hành khi và chỉ khi:
        $ vec(A B) = vec(D C) $
        
        #step([Thiết lập tọa độ])
        $vec(A B) = (3 - (-1); 2 - 1) = (4; 1)$.
        $vec(D C) = (1 - x_D; 5 - y_D)$.
        $ cases(1 - x_D = 4, 5 - y_D = 1) <=> cases(x_D = -3, y_D = 4) $
        Vậy tung độ đỉnh $D$ là $y_D = 4$.
    ]
)

// TLN 4 (Câu 20)
#tln([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(2; 4)$ và $B(8; 10)$. Điểm $M$ thuộc đoạn thẳng $A B$ sao cho $A M = 2 M B$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (0.8, 1.2)
    let pM = (2.4, 2.6)
    let pB = (3.6, 3.6)
    line(pA, pB, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.6, 1.3), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.8, 3.6), text(size: 8pt)[$B$])
    circle(pM, radius: 2.5pt, fill: rgb("dc2626"))
    content((2.2, 2.9), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$M$])
  })
]
Tính hoành độ $x_M$ của điểm $M$.],
    [6],
    loigiai: [
        #step([Chuyển đổi sang hệ thức vectơ])
        Vì $M$ nằm giữa $A$ và $B$, đồng thời $A M = 2 M B$ nên:
        $ vec(A M) = 2 vec(M B) $
        
        #step([Giải tìm tọa độ hoành độ])
        $ x_M - x_A = 2(x_B - x_M) <=> x_M - 2 = 2(8 - x_M) $
        $ <=> x_M - 2 = 16 - 2 x_M <=> 3 x_M = 18 <=> x_M = 6 $
        Vậy hoành độ của điểm $M$ là $6$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Drone tuần tra đường cao tốc)
#tln([Một thiết bị bay không người lái (Drone) tuần tra giám sát an toàn giao thông bay thẳng đều từ điểm chốt kiểm soát $A(10; 15)$ đến điểm chốt $B(70; 95)$ (hệ tọa độ $O x y$, đơn vị: mét) trong thời gian $10$ giây.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.2, 0), text(size: 8pt)[$x" (m)"$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y" (m)"$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.0, 1.2)
    let pB = (4.0, 3.5)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content(pA, [🚦 $A$], anchor: "south-east")
    content(pB, [🚁 $B$], anchor: "north-west")
  })
]
Tính tốc độ bay trung bình của Drone theo đơn vị mét trên giây ($"m/s"$).],
    [10],
    loigiai: [
        #step([Tính quãng đường Drone bay])
        Khoảng cách từ điểm $A$ đến điểm $B$:
        $ A B = sqrt((70 - 10)^2 + (95 - 15)^2) = sqrt(60^2 + 80^2) = sqrt(3600 + 6400) = sqrt(10000) = 100" m" $
        
        #step([Tính tốc độ trung bình])
        $ v = (A B) / t = 100 / 10 = 10" m/s" $
        Vậy tốc độ bay của Drone là $10" m/s"$.
    ]
)

// TLN 6 (Câu 22 - Thực tế Xe tự hành AGV trong kho thông minh)
#tln([Trong một kho hàng thông minh (mặt sàn được gắn hệ trục tọa độ $O x y$, đơn vị: mét), ba kệ hàng nằm thẳng hàng tại các vị trí $K_1(4; 6), K_2(10; 12)$ và $K_3(16; 18)$. Người ta đặt một trạm tiếp pin tự động tại điểm $I$ là trung điểm của đoạn nối hai kệ hàng ngoài cùng $K_1$ và $K_3$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.2, 0), text(size: 8pt)[$x" (m)"$])
    line((0, -0.5), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 4.2), text(size: 8pt)[$y" (m)"$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pK1 = (1.0, 1.0)
    let pI = (2.5, 2.3)
    let pK3 = (4.0, 3.6)
    line(pK1, pK3, stroke: 1.2pt + luma(160))
    content(pK1, [📦 $K_1$], anchor: "north-west")
    content(pK3, [📦 $K_3$], anchor: "north-west")
    circle(pI, radius: 3pt, fill: rgb("0d9488"))
    content(pI, [🔋 $I$], anchor: "south-east")
  })
]
Tính khoảng cách từ trạm tiếp pin $I$ đến gốc tọa độ điều hành trung tâm $O(0; 0)$ theo đơn vị mét (làm tròn kết quả đến chữ số hàng đơn vị).],
    [16],
    loigiai: [
        #step([Tìm tọa độ trạm tiếp pin I])
        Vì $I$ là trung điểm của $K_1 K_3$:
        $ x_I = (4 + 16) / 2 = 20/2 = 10 $
        $ y_I = (6 + 18) / 2 = 24/2 = 12 $
        Vậy tọa độ trạm tiếp pin là $I(10; 12)$ (trùng đúng vị trí kệ $K_2$).
        
        #step([Tính khoảng cách từ I đến gốc O])
        $ O I = sqrt(10^2 + 12^2) = sqrt(100 + 144) = sqrt(244) approx 15.62" m" $
        Làm tròn đến chữ số hàng đơn vị ta được $16" m"$.
    ]
)

] // end make-questions

#make-questions()
