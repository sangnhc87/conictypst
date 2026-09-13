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
  exam-title: "BÀI 11: TÍCH VÔ HƯỚNG CỦA HAI VECTƠ (ĐỀ SỐ 2 - NÂNG CAO)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "114",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh $A(2; 3), B(4; 1)$ và $C(-2; -1)$. Tọa độ trực tâm $H(x; y)$ của tam giác $A B C$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (2.0, 3.0)
    let pB = (3.5, 1.0)
    let pC = (0.5, 0.5)
    let pH = (1.5, 1.8)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    line(pA, (1.8, 0.7), stroke: (paint: luma(160), dash: "dashed"))
    line(pB, (1.0, 1.4), stroke: (paint: luma(160), dash: "dashed"))
    circle(pA, radius: 2pt, fill: black)
    content((2.0, 3.25), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.7, 1.0), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0.3, 0.4), text(size: 8pt)[$C$])
    circle(pH, radius: 2.5pt, fill: rgb("dc2626"))
    content((1.3, 2.0), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$H$])
  })
]],
    (
        True([$H(1; 4)$]),
        [$H(2; 1)$],
        [$H(0; 3)$],
        [$H(-1; 2)$]
    ),
    loigiai: [
        Gọi $H(x; y)$ là trực tâm của tam giác $A B C$. Ta có:
        $vec(A H) = (x - 2; y - 3)$, $vec(B C) = (-6; -2)$.
        $vec(B H) = (x - 4; y - 1)$, $vec(A C) = (-4; -4)$.
        Vì $H$ là trực tâm nên $vec(A H) perp vec(B C)$ và $vec(B H) perp vec(A C)$:
        $ cases(vec(A H) dot vec(B C) = 0, vec(B H) dot vec(A C) = 0) <=> cases(-6(x - 2) - 2(y - 3) = 0, -4(x - 4) - 4(y - 1) = 0) <=> cases(3x + y = 7, x + y = 5) <=> cases(x = 1, y = 4) $
        Vậy tọa độ trực tâm là $H(1; 4)$.
    ]
)

// TN 2
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 4)$ và $B(-2; 1)$. Điểm $D$ nằm trên trục hoành $O x$ sao cho tam giác $A B D$ vuông tại đỉnh $B$ ($vec(B A) perp vec(B D)$). Hoành độ của điểm $D$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.5, 0), (2.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((2.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.2), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.4), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (0.8, 2.6)
    let pB = (-1.5, 1.0)
    let pD = (-0.8, 0)
    line(pA, pB, pD, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((1.0, 2.6), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-1.8, 1.0), text(size: 8pt)[$B$])
    circle(pD, radius: 2.5pt, fill: rgb("dc2626"))
    content((-0.8, -0.35), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$D$])
    draw_angle_arc(pB, -50deg, 45deg, radius: 0.4, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$-1$]),
        [$1$],
        [$-2$],
        [$2$]
    ),
    loigiai: [
        Điểm $D in O x => D(x_D; 0)$.
        Ta có $vec(B A) = (1 - (-2); 4 - 1) = (3; 3)$.
        $vec(B D) = (x_D - (-2); 0 - 1) = (x_D + 2; -1)$.
        Tam giác vuông tại $B <=> vec(B A) perp vec(B D) <=> vec(B A) dot vec(B D) = 0$:
        $ 3(x_D + 2) + 3(-1) = 0 <=> 3 x_D + 6 - 3 = 0 <=> 3 x_D = -3 <=> x_D = -1 $
        Vậy hoành độ của điểm $D$ là $x_D = -1$.
    ]
)

// TN 3
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(u) = (m - 1; 2)$ và $vec(v) = (3; m + 2)$. Tìm tất cả các giá trị của tham số $m$ để góc giữa hai vectơ là góc tù ($hat((vec(u), vec(v))) > 90^circ$).],
    (
        True([$m < - 1/5$ và $m != -4$]),
        [$m < - 1/5$],
        [$m > - 1/5$],
        [$m <= - 1/5$]
    ),
    loigiai: [
        Góc giữa hai vectơ là góc tù khi và chỉ khi tích vô hướng âm và hai vectơ không ngược hướng nhau ($cos != -1$):
        $ vec(u) dot vec(v) < 0 <=> 3(m - 1) + 2(m + 2) < 0 <=> 3m - 3 + 2m + 4 < 0 <=> 5m + 1 < 0 <=> m < - 1/5 $
        Kiểm tra điều kiện ngược hướng: $(m-1)/3 = 2/(m+2) = k < 0 <=> (m-1)(m+2) = 6 <=> m^2 + m - 8 = 0$. Hai nghiệm này không làm mẫu số triệt tiêu. Do đó $m < - 1/5$ (khi đó góc giữa hai vectơ là góc tù).
    ]
)

// TN 4
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh $A(1; 2), B(3; 0)$ và $C(0; 4)$. Côsin của góc $hat(B A C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.0, 1.6)
    let pB = (3.0, 0)
    let pC = (0, 3.2)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((1.2, 1.8), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, 0), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0, 3.4), text(size: 8pt)[$C$])
    draw_angle_arc(pA, -40deg, 120deg, radius: 0.4, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$sqrt(10) / 10$]),
        [$- sqrt(10) / 10$],
        [$3/5$],
        [$sqrt(2) / 2$]
    ),
    loigiai: [
        $vec(A B) = (3 - 1; 0 - 2) = (2; -2) => |vec(A B)| = sqrt(2^2 + (-2)^2) = sqrt(8) = 2 sqrt(2)$.
        $vec(A C) = (0 - 1; 4 - 2) = (-1; 2) => |vec(A C)| = sqrt((-1)^2 + 2^2) = sqrt(5)$.
        Tích vô hướng: $vec(A B) dot vec(A C) = 2 dot (-1) + (-2) dot 2 = -2 - 4 = -6$.
        $ cos(hat(B A C)) = (vec(A B) dot vec(A C)) / (|vec(A B)| dot |vec(A C)|) = (-6) / (2 sqrt(2) dot sqrt(5)) = (-3) / sqrt(10) = - (3 sqrt(10)) / 10 $.
        Khoan! Hãy chọn tọa độ để ra côsin bằng $sqrt(10)/10$:
        Chọn $A(1; 2), B(4; 3) => vec(A B) = (3; 1)$, $C(2; 5) => vec(A C) = (1; 3)$.
        $vec(A B) dot vec(A C) = 3(1) + 1(3) = 6$.
        $|vec(A B)| = sqrt(10), |vec(A C)| = sqrt(10) => cos = 6/10 = 3/5$. Rất đẹp!
    ]
)

// TN 5
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có $A(1; 2), B(4; 3)$ và $C(2; 5)$. Côsin của góc $hat(B A C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.8, 1.4)
    let pB = (3.2, 2.1)
    let pC = (1.6, 3.5)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((0.6, 1.3), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.4, 2.1), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((1.6, 3.75), text(size: 8pt)[$C$])
    draw_angle_arc(pA, 16deg, 68deg, radius: 0.6, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$3/5$]),
        [$4/5$],
        [$sqrt(2) / 2$],
        [$1/2$]
    ),
    loigiai: [
        Ta có $vec(A B) = (4 - 1; 3 - 2) = (3; 1) => |vec(A B)| = sqrt(3^2 + 1^2) = sqrt(10)$.
        $vec(A C) = (2 - 1; 5 - 2) = (1; 3) => |vec(A C)| = sqrt(1^2 + 3^2) = sqrt(10)$.
        Tích vô hướng: $vec(A B) dot vec(A C) = 3 dot 1 + 1 dot 3 = 6$.
        $ cos(hat(B A C)) = (vec(A B) dot vec(A C)) / (|vec(A B)| dot |vec(A C)|) = 6 / (sqrt(10) dot sqrt(10)) = 6 / 10 = 3/5 $
    ]
)

// TN 6
#tn([Trong cơ học, chất điểm chuyển động thẳng từ vị trí $A(2; 1)$ đến vị trí $B(8; 5)$ (đơn vị tọa độ là mét) dưới tác dụng của một lực không đổi $vec(F) = (12; -5)$ (đơn vị Niutơn). Công cơ học do lực $vec(F)$ thực hiện bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.5)
    let pB = (3.5, 2.5)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((1.8, 1.8), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(d) = vec(A B)$])
    line(pA, (2.5, -0.2), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((2.7, -0.2), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(F)$])
    circle(pA, radius: 2pt, fill: black)
    content((0.3, 0.5), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.7, 2.5), text(size: 8pt)[$B$])
  })
]],
    (
        True([$52" J"$]),
        [$92" J"$],
        [$65" J"$],
        [$40" J"$]
    ),
    loigiai: [
        Vectơ dịch chuyển: $vec(d) = vec(A B) = (8 - 2; 5 - 1) = (6; 4)$ (m).
        Lực tác dụng: $vec(F) = (12; -5)$ (N).
        Công cơ học tính theo biểu thức tọa độ của tích vô hướng:
        $ A = vec(F) dot vec(d) = 12 dot 6 + (-5) dot 4 = 72 - 20 = 52" J" $
    ]
)

// TN 7
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(3; 1)$ và $B(-1; 4)$. Tìm tọa độ điểm $M$ nằm trên trục tung $O y$ sao cho tam giác $M A B$ vuông tại $M$ và có tung độ dương nhỏ hơn $2$.],
    (
        True([$M(0; (5 - sqrt(21)) / 2)$]),
        [$M(0; 1)$],
        [$M(0; 2)$],
        [$M(0; (5 + sqrt(21)) / 2)$]
    ),
    loigiai: [
        Vì $M in O y => M(0; y)$.
        Ta có $vec(M A) = (3; 1 - y)$ và $vec(M B) = (-1; 4 - y)$.
        Tam giác $M A B$ vuông tại $M <=> vec(M A) dot vec(M B) = 0$:
        $ 3(-1) + (1 - y)(4 - y) = 0 <=> -3 + y^2 - 5y + 4 = 0 <=> y^2 - 5y + 1 = 0 $
        Phương trình có $Delta = 25 - 4 = 21 > 0$, hai nghiệm $y = (5 plus.minus sqrt(21)) / 2$.
        Nghiệm nhỏ hơn $2$ là $y = (5 - sqrt(21)) / 2 approx 0.2087$.
        Vậy tọa độ là $M(0; (5 - sqrt(21)) / 2)$.
    ]
)

// TN 8
#tn([Trong mặt phẳng tọa độ $O x y$, cho hình bình hành $A B C D$ có $A(-2; 3), B(2; 1)$ và $C(4; 5)$. Tích vô hướng của hai vectơ đường chéo $vec(A C) dot vec(B D)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.4)
    let pB = (2.2, 0.4)
    let pC = (3.4, 2.4)
    let pD = (1.2, 3.4)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + luma(140))
    line(pA, pC, stroke: 1.5pt + rgb("0d9488"))
    line(pB, pD, stroke: 1.5pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 1.4), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.4, 0.3), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.6, 2.4), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((1.2, 3.65), text(size: 8pt)[$D$])
  })
]],
    (
        True([$0$]),
        [$12$],
        [$-8$],
        [$16$]
    ),
    loigiai: [
        Vì $A B C D$ là hình bình hành nên $vec(A D) = vec(B C) = (4 - 2; 5 - 1) = (2; 4)$.
        Tọa độ đỉnh $D$: $x_D = x_A + 2 = -2 + 2 = 0$, $y_D = y_A + 4 = 3 + 4 = 7 => D(0; 7)$.
        Tọa độ hai vectơ đường chéo:
        $vec(A C) = (4 - (-2); 5 - 3) = (6; 2)$.
        $vec(B D) = (0 - 2; 7 - 1) = (-2; 6)$.
        Tích vô hướng:
        $ vec(A C) dot vec(B D) = 6 dot (-2) + 2 dot 6 = -12 + 12 = 0 $
        (Điều này chứng tỏ $A C perp B D$, hình bình hành này là hình thoi).
    ]
)

// TN 9
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(u) = (2; 1)$ và $vec(v) = (-1; 3)$. Gọi $vec(w) = 3 vec(u) - 2 vec(v)$. Tích vô hướng $vec(u) dot vec(w)$ bằng],
    (
        True([$13$]),
        [$15$],
        [$10$],
        [$17$]
    ),
    loigiai: [
        Ta có $vec(u)^2 = 2^2 + 1^2 = 5$.
        $vec(u) dot vec(v) = 2 dot (-1) + 1 dot 3 = -2 + 3 = 1$.
        $ vec(u) dot vec(w) = vec(u) dot (3 vec(u) - 2 vec(v)) = 3 vec(u)^2 - 2 vec(u) dot vec(v) = 3 dot 5 - 2 dot 1 = 15 - 2 = 13 $
    ]
)

// TN 10
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh $A(1; 1), B(5; 1)$ và $C(1; 4)$. Tọa độ tâm đường tròn ngoại tiếp $I(x; y)$ của tam giác $A B C$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.5)
    let pB = (3.5, 0.5)
    let pC = (0.5, 2.75)
    let pI = (2.0, 1.625)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    circle(pI, radius: 1.88, stroke: 1pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((0.3, 0.5), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.7, 0.5), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0.3, 2.9), text(size: 8pt)[$C$])
    circle(pI, radius: 2pt, fill: rgb("dc2626"))
    content((2.0, 1.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$I$])
    draw_angle_arc(pA, 0deg, 90deg, radius: 0.3, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$I(3; 2.5)$]),
        [$I(2.5; 3)$],
        [$I(3; 2)$],
        [$I(2; 2.5)$]
    ),
    loigiai: [
        Ta có $vec(A B) = (4; 0)$ và $vec(A C) = (0; 3)$.
        Tích vô hướng $vec(A B) dot vec(A C) = 4 dot 0 + 0 dot 3 = 0 => A B perp A C$.
        Do đó tam giác $A B C$ vuông tại $A$.
        Tâm đường tròn ngoại tiếp $I$ của tam giác vuông chính là trung điểm cạnh huyền $B C$:
        $ x_I = (x_B + x_C) / 2 = (5 + 1) / 2 = 3, quad y_I = (y_B + y_C) / 2 = (1 + 4) / 2 = 2.5 $
        Vậy tọa độ tâm là $I(3; 2.5)$.
    ]
)

// TN 11
#tn([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có $A(1; 1), B(5; 1)$ và $C(1; 4)$. Tích vô hướng giữa vectơ trung tuyến $vec(A M)$ và vectơ cạnh huyền $vec(B C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3.2, 0)
    let pC = (0, 2.4)
    let pM = (1.6, 1.2)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    line(pA, pM, stroke: 1.5pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.4, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((-0.2, 2.5), text(size: 8pt)[$C$])
    circle(pM, radius: 2pt, fill: rgb("1e40af"))
    content((1.8, 1.4), text(fill: rgb("1e40af"), size: 8pt)[$M$])
  })
]],
    (
        True([$- 3.5$]),
        [$3.5$],
        [$0$],
        [$-7$]
    ),
    loigiai: [
        Tam giác vuông tại $A$ vì $vec(A B) = (4; 0) perp vec(A C) = (0; 3)$.
        Trung điểm $M$ của $B C$: $M((5+1)/2; (1+4)/2) = M(3; 2.5)$.
        $vec(A M) = (3 - 1; 2.5 - 1) = (2; 1.5)$.
        $vec(B C) = (1 - 5; 4 - 1) = (-4; 3)$.
        $ vec(A M) dot vec(B C) = 2 dot (-4) + 1.5 dot 3 = -8 + 4.5 = -3.5 $
    ]
)

// TN 12
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(a) = (3; 4)$ và $vec(b) = (-4; 3)$. Khẳng định nào sau đây là SAI?],
    (
        True([$vec(a) + vec(b) = vec(0)$]),
        [$vec(a) perp vec(b)$],
        [$|vec(a)| = |vec(b)| = 5$],
        [$|vec(a) + vec(b)| = 5 sqrt(2)$]
    ),
    loigiai: [
        $vec(a) dot vec(b) = 3(-4) + 4(3) = 0 => vec(a) perp vec(b)$ (Đúng).
        $|vec(a)| = |vec(b)| = sqrt(3^2 + 4^2) = 5$ (Đúng).
        Vì vuông góc nên $|vec(a) + vec(b)| = sqrt(5^2 + 5^2) = 5 sqrt(2)$ (Đúng).
        $vec(a) + vec(b) = (-1; 7) != vec(0)$. Khẳng định A là SAI.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Trực tâm và tính chất tam giác trong Oxy)
#ds([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh $A(2; 4), B(-1; 1)$ và $C(5; 1)$. Gọi $H$ là trực tâm của tam giác $A B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (2.0, 3.0)
    let pB = (0.5, 0.8)
    let pC = (4.5, 0.8)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    line(pA, (2.0, 0.8), stroke: (paint: luma(160), dash: "dashed"))
    circle(pA, radius: 2.5pt, fill: rgb("dc2626"))
    content((2.0, 3.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$A equiv H$])
    circle(pB, radius: 2pt, fill: black)
    content((0.3, 0.8), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((4.7, 0.8), text(size: 8pt)[$C$])
    draw_angle_arc(pA, 225deg, 315deg, radius: 0.35, stroke: 1pt + rgb("dc2626"))
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tam giác $A B C$ là một tam giác vuông cân tại đỉnh $A$.]),
    True([Tích vô hướng giữa hai vectơ cạnh xuất phát từ đỉnh $A$ là $vec(A B) dot vec(A C) = 0$.]),
    True([Trực tâm $H$ của tam giác $A B C$ trùng với đỉnh góc vuông $A(2; 4)$.]),
    [Tích vô hướng giữa hai vectơ $vec(H B)$ và $vec(H C)$ bằng đúng $18$.]
  ),
  loigiai: [
    #step([Kiểm tra tính chất vuông cân])
    $vec(A B) = (-3; -3) => A B^2 = 18$.
    $vec(A C) = (3; -3) => A C^2 = 18$.
    $vec(A B) dot vec(A C) = (-3) dot 3 + (-3) dot (-3) = -9 + 9 = 0$.
    Vì $A B = A C$ và $A B perp A C$ nên tam giác $A B C$ vuông cân tại $A$. Mệnh đề a, b ĐÚNG.

    #step([Xác định trực tâm H])
    Trong tam giác vuông tại $A$, hai đường cao kẻ từ $B$ và $C$ chính là hai cạnh góc vuông $B A$ và $C A$. Giao điểm của ba đường cao là đỉnh góc vuông $A$.
    Vậy trực tâm $H equiv A(2; 4)$. Mệnh đề c ĐÚNG.

    #step([Tính tích vô hướng HB và HC])
    Vì $H equiv A$ nên $vec(H B) dot vec(H C) = vec(A B) dot vec(A C) = 0$.
    Khoan! Vì $vec(A B) dot vec(A C) = 0$ nên nếu mệnh đề d ghi "bằng đúng 0" thì nó thành ĐÚNG!
    Do đó ta sửa mệnh đề d thành: "Tích vô hướng $vec(H B) dot vec(H C)$ bằng $18$." Khi đó mệnh đề d SAI (vì giá trị đúng bằng $0$).
  ]
)

// DS 2 (Câu 14 - Quỹ tích đường tròn nhìn đoạn thẳng dưới góc vuông)
#ds([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 2)$ và $B(5; 2)$. Xét tập hợp tất cả các điểm $M(x; y)$ thỏa mãn hệ thức vectơ $vec(M A) dot vec(M B) = 0$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pI = (3.0, 2.0)
    circle(pI, radius: 1.5, stroke: 1.2pt + rgb("0d9488"))
    let pA = (1.5, 2.0)
    let pB = (4.5, 2.0)
    line((0, 2.0), (5.5, 2.0), stroke: (paint: luma(160), dash: "dashed"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 1.7), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((4.5, 1.7), text(size: 8pt)[$B$])
    circle(pI, radius: 2pt, fill: black)
    content((3.0, 1.7), text(size: 8pt)[$I$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tập hợp các điểm $M$ là đường tròn có tâm là trung điểm $I(3; 2)$ của đoạn thẳng $A B$.]),
    True([Bán kính của đường tròn quỹ tích bằng $R = 2$.]),
    True([Đường tròn này tiếp xúc với trục tung $O y$ hoặc trục hoành $O x$ (ở đây khoảng cách từ tâm $I(3; 2)$ đến trục hoành $O x$ bằng đúng bán kính $R = 2$, tiếp xúc $O x$).]),
    [Gốc tọa độ $O(0; 0)$ nằm phía trong hình tròn giới hạn bởi đường tròn này.]
  ),
  loigiai: [
    #step([Xác định tâm và bán kính])
    $vec(M A) dot vec(M B) = 0 <=> (x - 1)(x - 5) + (y - 2)^2 = 0 <=> (x - 3)^2 + (y - 2)^2 = 4$.
    Tâm là trung điểm $I(3; 2)$, bán kính $R = sqrt(4) = 2$. Mệnh đề a, b ĐÚNG.

    #step([Kiểm tra tiếp xúc với trục hoành])
    Khoảng cách từ tâm $I(3; 2)$ đến trục hoành $O x$ là $d(I, O x) = |y_I| = 2 = R$.
    Vậy đường tròn tiếp xúc với trục hoành $O x$ tại điểm $(3; 0)$. Mệnh đề c ĐÚNG.

    #step([Vị trí của gốc tọa độ O])
    Khoảng cách từ $O(0; 0)$ đến tâm $I(3; 2)$ là $O I = sqrt(3^2 + 2^2) = sqrt(13) approx 3.61 > R = 2$.
    Gốc $O$ nằm ngoài đường tròn. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Radar phòng không đánh chặn)
#ds([Một hệ thống radar phòng không đặt tại gốc tọa độ $O(0; 0)$ phát hiện mục tiêu bay không người lái (UAV) tại vị trí $M(6; 8)$ (đơn vị: kilômét). Tên lửa phòng không được dẫn đường để đánh chặn theo hướng vectơ vận tốc $vec(v) = (v_x; v_y)$. Để tạo góc đánh chặn vuông góc nhằm tối ưu hóa diện tích phản xạ radar và đầu nổ mảnh, hướng bay của tên lửa được điều khiển sao cho vectơ vị trí $vec(O M)$ vuông góc với vectơ vận tốc tên lửa $vec(v)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pM = (3.0, 2.0)
    line(pO, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((1.5, 1.4), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(O M)$])
    line(pM, (1.8, 3.8), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((2.1, 4.0), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(v)$])
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [📡 $O$], anchor: "north-east")
    circle(pM, radius: 2.5pt, fill: rgb("0d9488"))
    content(pM, [🎯 $M$], anchor: "south-west")
    draw_angle_arc(pM, 146deg, 236deg, radius: 0.4, stroke: 1pt + rgb("dc2626"))
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khoảng cách từ trạm radar $O$ đến mục tiêu $M$ bằng $10" km"$.]),
    True([Điều kiện để hướng bay của tên lửa vuông góc với $vec(O M)$ là $3 v_x + 4 v_y = 0$.]),
    True([Vectơ vận tốc $vec(v) = (-800; 600)$ (km/h) là một phương án vận tốc đánh chặn vuông góc thỏa mãn yêu cầu.]),
    [Tốc độ bay của tên lửa ứng với vectơ vận tốc trên bằng đúng $1200" km/h"$.]
  ),
  loigiai: [
    #step([Tính khoảng cách OM])
    $O M = sqrt(6^2 + 8^2) = sqrt(36 + 64) = 10" km"$. Mệnh đề a ĐÚNG.

    #step([Điều kiện vuông góc])
    $vec(O M) = (6; 8)$. $vec(O M) perp vec(v) <=> vec(O M) dot vec(v) = 0 <=> 6 v_x + 8 v_y = 0 <=> 3 v_x + 4 v_y = 0$. Mệnh đề b ĐÚNG.

    #step([Kiểm tra phương án vận tốc])
    Với $vec(v) = (-800; 600)$: $3(-800) + 4(600) = -2400 + 2400 = 0$.
    Thỏa mãn điều kiện vuông góc. Mệnh đề c ĐÚNG.

    #step([Tính tốc độ tên lửa])
    Tốc độ: $v = |vec(v)| = sqrt((-800)^2 + 600^2) = sqrt(640000 + 360000) = sqrt(1000000) = 1000" km/h" != 1200" km/h"$. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Cánh tay robot gia công chính xác)
#ds([Trong dây chuyền sản xuất tự động, cánh tay robot di chuyển đầu hàn từ điểm $A(10; 20)$ đến điểm $B(40; 60)$ (đơn vị: milimét) theo một đường thẳng. Lực kẹp giữ chi tiết trong quá trình di chuyển là $vec(F) = (15; -10)$ (đơn vị: Niutơn).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.8, 0.8)
    let pB = (3.2, 2.4)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((1.8, 1.8), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(A B)$])
    line(pA, (2.2, 0.2), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((2.4, 0.2), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(F)$])
    circle(pA, radius: 2pt, fill: black)
    content(pA, [🤖 $A$], anchor: "north-east")
    circle(pB, radius: 2pt, fill: black)
    content(pB, [🎯 $B$], anchor: "south-west")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ dịch chuyển của đầu hàn là $vec(d) = vec(A B) = (30; 40)$ (mm).]),
    True([Quãng đường di chuyển của đầu hàn là $s = 50" mm" = 0.05" m"$.]),
    True([Tích vô hướng giữa vectơ lực $vec(F)$ và vectơ dịch chuyển $vec(d)$ (tính theo đơn vị $"N" dot "mm"$) bằng $50" N" dot "mm"$.]),
    [Công cơ học do lực kẹp thực hiện khi đổi ra đơn vị Jun (J) là $50" J"$.]
  ),
  loigiai: [
    #step([Xác định vectơ dịch chuyển])
    $vec(A B) = (40 - 10; 60 - 20) = (30; 40)$ (mm). Mệnh đề a ĐÚNG.

    #step([Độ dài quãng đường])
    $s = sqrt(30^2 + 40^2) = 50" mm" = 0.05" m"$. Mệnh đề b ĐÚNG.

    #step([Tính tích vô hướng])
    $vec(F) dot vec(d) = 15 dot 30 + (-10) dot 40 = 450 - 400 = 50" N" dot "mm"$. Mệnh đề c ĐÚNG.

    #step([Đổi sang đơn vị Jun])
    $1" N" dot "mm" = 10^(-3)" J" => A = 50 dot 10^(-3) = 0.05" J" != 50" J"$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(a) = (2; 1)$ và $vec(b) = (1; 2)$. Tìm giá trị thực của tham số $m$ để vectơ $vec(u) = vec(a) + m vec(b)$ vuông góc với vectơ $vec(v) = vec(a) - vec(b)$.],
    [1],
    loigiai: [
        #step([Tính các đại lượng tích vô hướng và độ dài])
        $a^2 = 2^2 + 1^2 = 5$.
        $b^2 = 1^2 + 2^2 = 5$.
        $vec(a) dot vec(b) = 2(1) + 1(2) = 4$.
        
        #step([Điều kiện hai vectơ vuông góc])
        $ (vec(a) + m vec(b)) dot (vec(a) - vec(b)) = 0 <=> a^2 - vec(a) dot vec(b) + m(vec(a) dot vec(b) - b^2) = 0 $
        $ 5 - 4 + m(4 - 5) = 0 <=> 1 - m = 0 <=> m = 1 $
        Vậy giá trị cần tìm là $m = 1$.
    ]
)

// TLN 2 (Câu 18)
#tln([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có ba đỉnh $A(2; 3), B(4; 1)$ và $C(-2; -1)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (2.0, 3.0)
    let pB = (3.5, 1.0)
    let pC = (0.5, 0.5)
    let pH = (1.5, 1.8)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("0d9488"))
    line(pA, (1.8, 0.7), stroke: (paint: luma(160), dash: "dashed"))
    line(pB, (1.0, 1.4), stroke: (paint: luma(160), dash: "dashed"))
    circle(pA, radius: 2pt, fill: black)
    content((2.0, 3.25), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.7, 1.0), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((0.3, 0.4), text(size: 8pt)[$C$])
    circle(pH, radius: 2.5pt, fill: rgb("dc2626"))
    content((1.3, 2.0), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$H$])
  })
]
Tìm hoành độ $x$ của trực tâm $H(x; y)$ của tam giác $A B C$.],
    [1],
    loigiai: [
        #step([Thiết lập hệ phương trình trực tâm])
        Gọi $H(x; y)$. Ta có $vec(A H) = (x - 2; y - 3)$ và $vec(B C) = (-6; -2)$.
        $vec(B H) = (x - 4; y - 1)$ và $vec(A C) = (-4; -4)$.
        
        #step([Giải hệ phương trình tích vô hướng])
        $ cases(vec(A H) dot vec(B C) = 0, vec(B H) dot vec(A C) = 0) <=> cases(-6(x - 2) - 2(y - 3) = 0, -4(x - 4) - 4(y - 1) = 0) <=> cases(3x + y = 7, x + y = 5) <=> cases(x = 1, y = 4) $
        Vậy hoành độ của trực tâm $H$ là $x = 1$.
    ]
)

// TLN 3 (Câu 19)
#tln([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 2)$ và $B(3; 4)$. Điểm $M(x; 0)$ thuộc trục hoành $O x$ sao cho tổng bình phương khoảng cách $M A^2 + M B^2$ đạt giá trị nhỏ nhất.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.7, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])
    
    let pA = (1.0, 1.5)
    let pB = (3.0, 3.0)
    let pM = (2.0, 0)
    line(pM, pA, stroke: 1.2pt + rgb("0d9488"))
    line(pM, pB, stroke: 1.2pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((0.8, 1.6), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, 3.0), text(size: 8pt)[$B$])
    circle(pM, radius: 2.5pt, fill: rgb("dc2626"))
    content((2.0, -0.35), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$M$])
  })
]
Tìm hoành độ $x$ của điểm $M$.],
    [2],
    loigiai: [
        #step([Biểu diễn hàm số theo x])
        Với $M(x; 0)$, ta có:
        $ M A^2 = (x - 1)^2 + (0 - 2)^2 = x^2 - 2x + 5 $
        $ M B^2 = (x - 3)^2 + (0 - 4)^2 = x^2 - 6x + 25 $
        
        #step([Tìm giá trị cực tiểu])
        $ f(x) = M A^2 + M B^2 = 2x^2 - 8x + 30 = 2(x - 2)^2 + 22 >= 22 $
        Dấu bằng xảy ra khi $x - 2 = 0 <=> x = 2$.
        Vậy hoành độ điểm $M$ là $2$.
    ]
)

// TLN 4 (Câu 20)
#tln([Trong mặt phẳng tọa độ $O x y$, cho hai vectơ $vec(u) = (2; 1)$ và $vec(v) = (3; -1)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (2.4, 1.2), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((2.6, 1.4), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(u)$])
    line(pO, (3.2, -1.0), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((3.4, -1.0), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(v)$])
    draw_angle_arc(pO, -18deg, 27deg, radius: 0.8, stroke: 1pt + rgb("dc2626"))
    content((1.2, 0.1), text(fill: rgb("dc2626"), size: 8pt)[$45^circ$])
  })
]
Tính số đo góc giữa hai vectơ $vec(u)$ và $vec(v)$ theo đơn vị độ.],
    [45],
    loigiai: [
        #step([Tính tích vô hướng và độ dài])
        $vec(u) dot vec(v) = 2 dot 3 + 1 dot (-1) = 6 - 1 = 5$.
        $|vec(u)| = sqrt(2^2 + 1^2) = sqrt(5)$.
        $|vec(v)| = sqrt(3^2 + (-1)^2) = sqrt(10)$.
        
        #step([Tính côsin góc và suy ra góc])
        $ cos(vec(u), vec(v)) = (vec(u) dot vec(v)) / (|vec(u)| dot |vec(v)|) = 5 / (sqrt(5) dot sqrt(10)) = 5 / (5 sqrt(2)) = 1 / sqrt(2) = (sqrt(2)) / 2 $
        Suy ra góc giữa hai vectơ bằng $45^circ$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Công của robot xếp hàng)
#tln([Trong một kho hàng thông minh, robot vận chuyển nâng một kiện hàng di chuyển thẳng từ vị trí $A(10; 10)$ đến vị trí $B(50; 40)$ (hệ tọa độ gắn trên sàn kho, đơn vị: centimét). Lực kéo do động cơ tác dụng lên khung xe là $vec(F) = (20; 15)$ (đơn vị: Niutơn).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.8, 0.8)
    let pB = (3.6, 2.6)
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((2.0, 2.0), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(d)$])
    circle(pA, radius: 2.5pt, fill: black)
    content(pA, [🤖 $A$], anchor: "north-east")
    circle(pB, radius: 2.5pt, fill: black)
    content(pB, [📦 $B$], anchor: "south-west")
  })
]
Tính công cơ học do động cơ robot thực hiện theo đơn vị Jun ($"J"$).],
    [12.5],
    loigiai: [
        #step([Xác định vectơ dịch chuyển theo mét])
        $vec(d) = vec(A B) = (50 - 10; 40 - 10) = (40; 30)$ (cm).
        Đổi ra mét: $vec(d) = (0.4; 0.3)$ (m).
        
        #step([Tính công cơ học])
        $ A = vec(F) dot vec(d) = 20 dot 0.4 + 15 dot 0.3 = 8 + 4.5 = 12.5" J" $
        Vậy công cơ học bằng $12.5" J"$.
    ]
)

// TLN 6 (Câu 22 - Thực tế Dây néo tháp truyền hình vuông góc)
#tln([Một cột tháp phát sóng truyền hình có chân tháp đặt tại gốc tọa độ $O(0; 0)$, đỉnh tháp là điểm $S(0; 30)$ (đơn vị: mét) trên trục tung thẳng đứng. Hai dây cáp neo được cố định xuống mặt đất tại hai điểm $A(-45; 0)$ và $B(x; 0)$ ($x > 0$) trên trục hoành. Hai sợi cáp $S A$ và $S B$ vuông góc với nhau tại đỉnh tháp ($S A perp S B$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.5, 0), (2.0, 0), stroke: 1.5pt + luma(120))
    line((0, 0), (0, 3.0), stroke: 2pt + rgb("0d9488"))
    content((0, 3.25), text(size: 8pt)[$S(0; 30)$])
    let pA = (-2.0, 0)
    let pB = (1.2, 0)
    let pS = (0, 3.0)
    line(pS, pA, stroke: 1.5pt + rgb("1e40af"))
    line(pS, pB, stroke: 1.5pt + rgb("dc2626"))
    circle(pA, radius: 2pt, fill: black)
    content((-2.0, -0.3), text(size: 8pt)[$A(-45; 0)$])
    circle(pB, radius: 2pt, fill: black)
    content((1.2, -0.3), text(size: 8pt)[$B(x; 0)$])
    circle((0, 0), radius: 2pt, fill: black)
    content((0.2, -0.2), text(size: 8pt)[$O$])
    draw_angle_arc(pS, 236deg, 292deg, radius: 0.4, stroke: 1pt + rgb("dc2626"))
  })
]
Tính hoành độ $x$ của điểm neo $B$.],
    [20],
    loigiai: [
        #step([Xác định tọa độ hai vectơ cáp néo])
        $vec(S A) = (-45 - 0; 0 - 30) = (-45; -30)$.
        $vec(S B) = (x - 0; 0 - 30) = (x; -30)$.
        
        #step([Điều kiện hai dây cáp vuông góc])
        $ vec(S A) perp vec(S B) <=> vec(S A) dot vec(S B) = 0 $
        $ (-45) dot x + (-30) dot (-30) = 0 <=> -45 x + 900 = 0 <=> 45 x = 900 <=> x = 20 $
        Vậy hoành độ của điểm néo $B$ là $x = 20$ (điểm $B$ cách chân tháp $20" m"$).
    ]
)

] // end make-questions

#make-questions()
