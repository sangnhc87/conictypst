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
  exam-title: "BÀI TẬP CUỐI CHƯƠNG IV: VECTƠ (ĐỀ SỐ 1 - NÂNG CAO)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "116",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho tam giác đều $A B C$ có cạnh bằng $a$. Độ dài của vectơ tổng $vec(u) = vec(A B) + vec(A C) + vec(B C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3.0, 0)
    let pM = (1.5, 0)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    line(pA, pM, stroke: (paint: luma(140), dash: "dashed"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.9), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8pt)[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((1.5, -0.3), text(size: 8pt)[$M$])
    draw_angle_arc(pM, 0deg, 90deg, radius: 0.3, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$2a$]),
        [$a sqrt(3)$],
        [$3a$],
        [$a sqrt(7)$]
    ),
    loigiai: [
        Gọi $M$ là trung điểm cạnh $B C$. Ta có $vec(A B) + vec(A C) = 2 vec(A M)$.
        Khi đó:
        $ vec(u) = 2 vec(A M) + vec(B C) $
        Vì tam giác $A B C$ đều nên đường trung tuyến $A M$ đồng thời là đường cao, do đó $A M perp B C => vec(A M) perp vec(B C)$.
        Bình phương độ dài vectơ tổng:
        $ |vec(u)|^2 = (2 vec(A M) + vec(B C))^2 = 4 A M^2 + B C^2 + 4 vec(A M) dot vec(B C) = 4 A M^2 + B C^2 $
        Với $A M = (a sqrt(3)) / 2$ và $B C = a$:
        $ |vec(u)|^2 = 4 dot ((3 a^2) / 4) + a^2 = 3 a^2 + a^2 = 4 a^2 => |vec(u)| = 2a $
    ]
)

// TN 2
#tn([Cho tam giác $A B C$. Lấy điểm $M$ trên cạnh $B C$ sao cho $M B = 2 M C$ và gọi $G$ là trọng tâm của tam giác $A B C$. Phân tích vectơ $vec(M G)$ theo hai vectơ cạnh $vec(A B)$ và $vec(A C)$ ta được kết quả là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 3.0)
    let pB = (0, 0)
    let pC = (3.6, 0)
    let pG = (1.7, 1.0)
    let pM = (2.4, 0)
    line(pA, pB, pC, close: true, stroke: 1.2pt + luma(140))
    line(pM, pG, mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 3.25), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.8, -0.2), text(size: 8pt)[$C$])
    circle(pG, radius: 2pt, fill: rgb("dc2626"))
    content((1.7, 1.3), text(fill: rgb("dc2626"), size: 8pt)[$G$])
    circle(pM, radius: 2pt, fill: black)
    content((2.4, -0.3), text(size: 8pt)[$M$])
  })
]],
    (
        True([$vec(M G) = - 1/3 vec(A C)$]),
        [$vec(M G) = 1/3 vec(A B) - 1/3 vec(A C)$],
        [$vec(M G) = - 1/3 vec(A B)$],
        [$vec(M G) = 1/6 vec(A B) - 1/3 vec(A C)$]
    ),
    loigiai: [
        Vì $G$ là trọng tâm tam giác $A B C$ nên $vec(A G) = 1/3 vec(A B) + 1/3 vec(A C)$.
        Vì $M B = 2 M C => vec(M B) = -2 vec(M C) => vec(A M) = (vec(A B) + 2 vec(A C)) / 3 = 1/3 vec(A B) + 2/3 vec(A C)$.
        Suy ra:
        $ vec(M G) = vec(A G) - vec(A M) = (1/3 vec(A B) + 1/3 vec(A C)) - (1/3 vec(A B) + 2/3 vec(A C)) = - 1/3 vec(A C) $
        (Điều này chứng tỏ đoạn thẳng $M G$ song song với cạnh $A C$).
    ]
)

// TN 3
#tn([Cho tam giác $A B C$. Điểm $I$ thỏa mãn $vec(I A) = 2 vec(I B)$ và điểm $J$ thỏa mãn $3 vec(J A) + 2 vec(J C) = vec(0)$. Điểm $K$ nằm trên cạnh $B C$ sao cho ba điểm $I, J, K$ thẳng hàng. Tỉ số $(K B) / (K C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.2, 2.5)
    let pB = (0, 0)
    let pC = (3.0, 0)
    let pI = (-1.2, -2.5)
    let pJ = (1.92, 1.5)
    let pK = (0.75, 0)
    line(pA, pB, pC, close: true, stroke: 1.2pt + luma(140))
    line(pI, pJ, stroke: 1.5pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((1.2, 2.75), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8pt)[$C$])
    circle(pJ, radius: 2pt, fill: black)
    content((2.1, 1.65), text(size: 8pt)[$J$])
    circle(pK, radius: 2pt, fill: rgb("dc2626"))
    content((0.75, -0.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$K$])
  })
]],
    (
        True([$1/3$]),
        [$1/2$],
        [$2/3$],
        [$1/4$]
    ),
    loigiai: [
        Ta phân tích các vectơ theo cơ sở $vec(A B)$ và $vec(A C)$:
        $vec(I A) = 2 vec(I B) <=> vec(I A) = 2(vec(I A) + vec(A B)) <=> vec(A I) = 2 vec(A B)$.
        $3 vec(J A) + 2 vec(J C) = vec(0) <=> -3 vec(A J) + 2(vec(A C) - vec(A J)) = vec(0) <=> vec(A J) = 2/5 vec(A C)$.
        Do đó: $vec(I J) = vec(A J) - vec(A I) = -2 vec(A B) + 2/5 vec(A C)$.
        Giả sử $vec(B K) = k vec(B C) => vec(A K) = (1 - k) vec(A B) + k vec(A C)$.
        $vec(I K) = vec(A K) - vec(A I) = (1 - k - 2) vec(A B) + k vec(A C) = -(k + 1) vec(A B) + k vec(A C)$.
        Ba điểm $I, J, K$ thẳng hàng khi $vec(I K)$ cùng phương với $vec(I J)$:
        $ (-(k + 1)) / (-2) = k / (2/5) <=> (k + 1) / 2 = (5k) / 2 <=> k + 1 = 5k <=> 4k = 1 <=> k = 1/4 $
        Do $k = 1/4$ nên $K B = 1/4 B C$ và $K C = 3/4 B C$. Vậy $(K B) / (K C) = 1/3$.
    ]
)

// TN 4
#tn([Cho hình chữ nhật $A B C D$ có $A B = 4$ và $A D = 3$. Gọi $M$ là trung điểm của cạnh $C D$ và $N$ là điểm trên cạnh $A D$ sao cho $A N = 1$. Tích vô hướng $vec(B M) dot vec(B N)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3.2, 0)
    let pC = (3.2, 2.4)
    let pD = (0, 2.4)
    let pM = (1.6, 2.4)
    let pN = (0, 0.8)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + luma(140))
    line(pB, pM, stroke: 1.5pt + rgb("0d9488"))
    line(pB, pN, stroke: 1.5pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.4, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.4, 2.5), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, 2.5), text(size: 8pt)[$D$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((1.6, 2.65), text(fill: rgb("0d9488"), size: 8pt)[$M$])
    circle(pN, radius: 2pt, fill: rgb("1e40af"))
    content((-0.25, 0.8), text(fill: rgb("1e40af"), size: 8pt)[$N$])
  })
]],
    (
        True([$11$]),
        [$13$],
        [$9$],
        [$15$]
    ),
    loigiai: [
        Phân tích theo hai vectơ vuông góc $vec(A B)$ và $vec(A D)$ ($vec(A B) dot vec(A D) = 0$):
        $vec(B M) = vec(B C) + vec(C M) = vec(A D) - 1/2 vec(A B)$.
        $vec(B N) = vec(B A) + vec(A N) = - vec(A B) + 1/3 vec(A D)$ (vì $A N = 1 = 1/3 A D$).
        Nhân vô hướng:
        $ vec(B M) dot vec(B N) = (vec(A D) - 1/2 vec(A B)) dot (1/3 vec(A D) - vec(A B)) = 1/3 A D^2 + 1/2 A B^2 $
        $ = 1/3 dot 3^2 + 1/2 dot 4^2 = 3 + 8 = 11 $
    ]
)

// TN 5
#tn([Cho tam giác $A B C$. Gọi $I$ là điểm thỏa mãn $vec(I A) + vec(I B) + 2 vec(I C) = vec(0)$ và $J$ là điểm thỏa mãn $vec(J A) + 2 vec(J B) + vec(J C) = vec(0)$. Tập hợp tất cả các điểm $M$ thỏa mãn hệ thức độ dài $|vec(M A) + vec(M B) + 2 vec(M C)| = |vec(M A) + 2 vec(M B) + vec(M C)|$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pI = (1.5, 1.5)
    let pJ = (3.5, 1.5)
    line(pI, pJ, stroke: 1.2pt + luma(140))
    line((2.5, 0), (2.5, 3.0), stroke: 1.5pt + rgb("1e40af"))
    circle(pI, radius: 2pt, fill: black)
    content((1.3, 1.5), text(size: 8pt)[$I$])
    circle(pJ, radius: 2pt, fill: black)
    content((3.7, 1.5), text(size: 8pt)[$J$])
    content((2.8, 2.7), text(fill: rgb("1e40af"), size: 8pt, weight: "bold")[Đường trung trực])
  })
]],
    (
        True([Đường trung trực của đoạn thẳng $I J$]),
        [Đường tròn đường kính $I J$],
        [Đường thẳng đi qua hai điểm $I$ và $J$],
        [Đoạn thẳng nối $I$ và $J$]
    ),
    loigiai: [
        Sử dụng tính chất tâm tỉ cự:
        $ vec(M A) + vec(M B) + 2 vec(M C) = 4 vec(M I) + (vec(I A) + vec(I B) + 2 vec(I C)) = 4 vec(M I) $
        $ vec(M A) + 2 vec(M B) + vec(M C) = 4 vec(M J) + (vec(J A) + 2 vec(J B) + vec(J C)) = 4 vec(M J) $
        Hệ thức giả thiết tương đương:
        $ |4 vec(M I)| = |4 vec(M J)| <=> 4 M I = 4 M J <=> M I = M J $
        Tập hợp điểm $M$ cách đều hai điểm cố định $I$ và $J$ là đường trung trực của đoạn thẳng $I J$.
    ]
)

// TN 6
#tn([Cho hai vectơ không cùng phương $vec(u)$ và $vec(v)$ cùng có độ dài bằng $1$ thỏa mãn $|vec(u) + vec(v)| = sqrt(3)$. Số đo góc giữa hai vectơ $vec(u)$ và $vec(u) - vec(v)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (2.2, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((2.4, -0.2), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(u)$])
    line(pO, (1.1, 1.9), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.1, 2.15), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)$])
    line((1.1, 1.9), (2.2, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.9, 1.1), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$vec(u) - vec(v)$])
    draw_angle_arc(pO, 0deg, 60deg, radius: 0.5, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$60^circ$]),
        [$30^circ$],
        [$45^circ$],
        [$90^circ$]
    ),
    loigiai: [
        Bình phương độ lớn: $|vec(u) + vec(v)|^2 = u^2 + v^2 + 2 vec(u) dot vec(v) <=> 3 = 1 + 1 + 2 vec(u) dot vec(v) <=> vec(u) dot vec(v) = 1/2$.
        Suy ra $(vec(u), vec(v)) = 60^circ$.
        Độ dài vectơ hiệu:
        $ |vec(u) - vec(v)|^2 = u^2 + v^2 - 2 vec(u) dot vec(v) = 1 + 1 - 2(1/2) = 1 => |vec(u) - vec(v)| = 1 $
        Tích vô hướng giữa $vec(u)$ và $vec(u) - vec(v)$:
        $ vec(u) dot (vec(u) - vec(v)) = vec(u)^2 - vec(u) dot vec(v) = 1 - 1/2 = 1/2 $
        Côsin góc giữa chúng:
        $ cos(vec(u), vec(u) - vec(v)) = (vec(u) dot (vec(u) - vec(v))) / (|vec(u)| dot |vec(u) - vec(v)|) = (1/2) / (1 dot 1) = 1/2 => hat((vec(u), vec(u) - vec(v))) = 60^circ $
    ]
)

// TN 7
#tn([Cho tam giác $A B C$ có $A B = 6, A C = 8$ và $B C = 10$. Gọi $H$ là trực tâm của tam giác $A B C$. Biểu thức tổng tích vô hướng $S = vec(H A) dot vec(H B) + vec(H B) dot vec(H C) + vec(H C) dot vec(H A)$ có giá trị bằng],
    (
        True([$0$]),
        [$48$],
        [$24$],
        [$-48$]
    ),
    loigiai: [
        Nhận xét: $A B^2 + A C^2 = 6^2 + 8^2 = 36 + 64 = 100 = B C^2$.
        Do đó tam giác $A B C$ vuông tại đỉnh $A$.
        Trong tam giác vuông, trực tâm $H$ trùng với đỉnh góc vuông: $H equiv A$.
        Khi đó:
        $ vec(H A) = vec(A A) = vec(0) => vec(H A) dot vec(H B) = 0 text(" và ") vec(H C) dot vec(H A) = 0 $
        Mặt khác: $vec(H B) dot vec(H C) = vec(A B) dot vec(A C) = 0$ (do $A B perp A C$).
        Vậy $S = 0 + 0 + 0 = 0$.
    ]
)

// TN 8
#tn([Cho tam giác $A B C$ có ba cạnh $a = 7, b = 8, c = 5$ và trọng tâm là $G$. Tổng bình phương khoảng cách từ trọng tâm $G$ tới ba đỉnh của tam giác $G A^2 + G B^2 + G C^2$ bằng],
    (
        True([$46$]),
        [$138$],
        [$69$],
        [$92$]
    ),
    loigiai: [
        Áp dụng công thức tổng khoảng cách trọng tâm Leibniz:
        $ G A^2 + G B^2 + G C^2 = (a^2 + b^2 + c^2) / 3 $
        Thay số:
        $ G A^2 + G B^2 + G C^2 = (7^2 + 8^2 + 5^2) / 3 = (49 + 64 + 25) / 3 = 138 / 3 = 46 $
    ]
)

// TN 9
#tn([Cho đoạn thẳng $A B = 6$. Điểm $M$ trong mặt phẳng sao cho tổng bình phương khoảng cách $M A^2 + M B^2$ đạt giá trị nhỏ nhất. Giá trị nhỏ nhất đó bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pI = (2.0, 0)
    let pB = (4.0, 0)
    line(pA, pB, stroke: 1.5pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((4.2, -0.2), text(size: 8pt)[$B$])
    circle(pI, radius: 2.5pt, fill: rgb("dc2626"))
    content((2.0, 0.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$M equiv I$])
  })
]],
    (
        True([$18$]),
        [$36$],
        [$9$],
        [$24$]
    ),
    loigiai: [
        Gọi $I$ là trung điểm của $A B$. Chèn điểm $I$ vào biểu thức:
        $ M A^2 + M B^2 = (vec(M I) + vec(I A))^2 + (vec(M I) + vec(I B))^2 $
        $ = 2 M I^2 + I A^2 + I B^2 + 2 vec(M I) dot (vec(I A) + vec(I B)) = 2 M I^2 + (A B^2) / 2 $
        Vì $M I >= 0$ nên $M A^2 + M B^2 >= (A B^2) / 2 = 6^2 / 2 = 18$.
        Dấu bằng xảy ra khi $M equiv I$ (trung điểm của $A B$).
    ]
)

// TN 10
#tn([Một dầm bê tông dự ứng lực được cẩu tháp công trường nâng thẳng đứng với lực kéo cáp không đổi $F = 50" kN"$. Dầm cầu được cẩu lên một độ cao $h = 8" m"$. Công cơ học do lực căng cáp thực hiện bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (3.5, 0), stroke: 1.5pt + luma(140))
    rect((0.5, 1.2), (2.5, 1.7), fill: rgb("eff6ff"), stroke: 1.5pt + rgb("1e40af"))
    content((1.5, 1.45), [🏗️ Dầm bê tông])
    line((1.5, 1.7), (1.5, 2.7), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.8, 2.7), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(F)$])
    line((0.2, 0), (0.2, 1.45), mark: (both: ">"), stroke: 1pt + rgb("0d9488"))
    content((-0.2, 0.7), text(fill: rgb("0d9488"), size: 8pt)[$h = 8" m"$])
  })
]],
    (
        True([$400" kJ"$]),
        [$400" J"$],
        [$200" kJ"$],
        [$800" kJ"$]
    ),
    loigiai: [
        Vì lực kéo cùng phương, cùng chiều với hướng chuyển động nâng lên nên góc giữa chúng bằng $0^circ$:
        $ A = F dot h dot cos 0^circ = 50000 dot 8 dot 1 = 400000" J" = 400" kJ" $
    ]
)

// TN 11
#tn([Hai tàu tuần duyên $A$ và $B$ rời trạm chỉ huy cùng một lúc. Tàu $A$ chạy về hướng Đông với vận tốc $30" km/h"$, tàu $B$ chạy về hướng Bắc với vận tốc $40" km/h"$. Tốc độ tương đối của tàu $B$ đối với tàu $A$ (độ lớn của vectơ vận tốc tương đối $vec(v)_(B A) = vec(v)_B - vec(v)_A$) bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (2.4, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((2.5, -0.25), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(v)_A$ (Đông)])
    line(pO, (0, 2.4), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-0.3, 2.5), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)_B$ (Bắc)])
    line((2.4, 0), (0, 2.4), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.6, 1.4), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(v)_(B A)$])
    draw_angle_arc(pO, 0deg, 90deg, radius: 0.4, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$50" km/h"$]),
        [$70" km/h"$],
        [$10" km/h"$],
        [$25" km/h"$]
    ),
    loigiai: [
        Vì hướng Đông và hướng Bắc vuông góc với nhau nên hai vectơ vận tốc $vec(v)_A perp vec(v)_B$.
        Độ lớn vận tốc tương đối:
        $ v_(B A) = |vec(v)_B - vec(v)_A| = sqrt(v_B^2 + v_A^2) = sqrt(40^2 + 30^2) = sqrt(1600 + 900) = sqrt(2500) = 50" km/h" $
    ]
)

// TN 12
#tn([Cho hai vectơ $vec(a)$ và $vec(b)$ khác vectơ-không. Khẳng định nào sau đây là ĐÚNG?],
    (
        True([$|vec(a) + vec(b)| = |vec(a) - vec(b)| <=> vec(a) perp vec(b)$]),
        [$|vec(a) + vec(b)| = |vec(a) - vec(b)| <=> vec(a) text(" cùng phương ") vec(b)$],
        [$|vec(a) + vec(b)| = |vec(a)| + |vec(b)| <=> vec(a) perp vec(b)$],
        [$vec(a) dot vec(b) = 0 <=> |vec(a)| = |vec(b)|$]
    ),
    loigiai: [
        Bình phương hai vế đẳng thức:
        $ |vec(a) + vec(b)|^2 = |vec(a) - vec(b)|^2 <=> vec(a)^2 + vec(b)^2 + 2 vec(a) dot vec(b) = vec(a)^2 + vec(b)^2 - 2 vec(a) dot vec(b) $
        $ <=> 4 vec(a) dot vec(b) = 0 <=> vec(a) dot vec(b) = 0 <=> vec(a) perp vec(b) $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Tâm tỉ cự và đẳng thức vectơ)
#ds([Cho tam giác đều $A B C$ có cạnh bằng $a$. Xét vectơ $vec(v) = 2 vec(M A) - 3 vec(M B) + vec(M C)$ với $M$ là một điểm tùy ý trong mặt phẳng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3.0, 0)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.85), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8pt)[$C$])
    line(pB, (-1.5, 2.6), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((-1.6, 2.7), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ $vec(v)$ là một vectơ không đổi, không phụ thuộc vào vị trí của điểm $M$.]),
    True([Vectơ $vec(v)$ có thể biểu diễn gọn lại qua hai đỉnh là $vec(v) = 2 vec(B A) + vec(B C)$.]),
    True([Độ dài của vectơ $vec(v)$ bằng $a sqrt(7)$.]),
    [Độ dài của vectơ $vec(v)$ đạt giá trị nhỏ nhất khi điểm $M$ trùng với trọng tâm $G$ của tam giác.]
  ),
  loigiai: [
    #step([Chứng minh vectơ v không đổi])
    Tổng hệ số: $2 - 3 + 1 = 0$.
    Chọn $M equiv B$:
    $ vec(v) = 2 vec(B A) - 3 vec(B B) + vec(B C) = 2 vec(B A) + vec(B C) $
    Vì $A, B, C$ cố định nên vectơ $vec(v)$ hoàn toàn cố định, không phụ thuộc vào vị trí điểm $M$. Mệnh đề a, b ĐÚNG.

    #step([Tính độ dài vectơ v])
    $ |vec(v)|^2 = (2 vec(B A) + vec(B C))^2 = 4 B A^2 + B C^2 + 4 vec(B A) dot vec(B C) $
    Với $vec(B A) dot vec(B C) = a dot a dot cos 60^circ = 1/2 a^2$:
    $ |vec(v)|^2 = 4 a^2 + a^2 + 4(1/2 a^2) = 5 a^2 + 2 a^2 = 7 a^2 => |vec(v)| = a sqrt(7) $. Mệnh đề c ĐÚNG.

    #step([Tính bất biến của độ dài])
    Vì vectơ $vec(v)$ là một vectơ không đổi có độ dài cố định $a sqrt(7)$ với mọi vị trí của $M$ nên độ dài không phụ thuộc vào $M$ (không có chuyện cực tiểu tại trọng tâm). Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Hệ thức lượng tam giác & phân giác)
#ds([Cho tam giác $A B C$ có độ dài ba cạnh $A B = 5, A C = 6$ và $B C = 7$. Gọi $M$ là trung điểm cạnh $B C$ và $A D$ là đường phân giác trong góc $A$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.2, 3.2)
    let pB = (0, 0)
    let pC = (4.0, 0)
    let pM = (2.0, 0)
    let pD = (1.82, 0)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    line(pA, pM, stroke: 1.5pt + rgb("0d9488"))
    line(pA, pD, stroke: 1.5pt + rgb("dc2626"))
    circle(pA, radius: 2pt, fill: black)
    content((1.2, 3.45), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((4.2, -0.2), text(size: 8pt)[$C$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((2.2, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$M$])
    circle(pD, radius: 2pt, fill: rgb("dc2626"))
    content((1.6, -0.3), text(fill: rgb("dc2626"), size: 8pt)[$D$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tích vô hướng giữa hai vectơ cạnh kề là $vec(A B) dot vec(A C) = 6$.]),
    True([Độ dài đường trung tuyến $A M$ của tam giác bằng $(sqrt(73)) / 2$.]),
    True([Vectơ đường phân giác biểu diễn qua hai cạnh là $vec(A D) = 6/11 vec(A B) + 5/11 vec(A C)$.]),
    [Độ dài đường phân giác $A D$ luôn lớn hơn độ dài đường trung tuyến $A M$.]
  ),
  loigiai: [
    #step([Tính tích vô hướng AB và AC])
    $vec(A B) dot vec(A C) = (A B^2 + A C^2 - B C^2) / 2 = (25 + 36 - 49) / 2 = 12 / 2 = 6$. Mệnh đề a ĐÚNG.

    #step([Tính độ dài trung tuyến AM])
    $A M^2 = (2(A B^2 + A C^2) - B C^2) / 4 = (2(25 + 36) - 49) / 4 = (122 - 49) / 4 = 73 / 4 => A M = (sqrt(73)) / 2$. Mệnh đề b ĐÚNG.

    #step([Biểu diễn vectơ phân giác AD])
    Theo tính chất phân giác: $(D B) / (D C) = (A B) / (A C) = 5/6 => vec(A D) = (6 vec(A B) + 5 vec(A C)) / 11 = 6/11 vec(A B) + 5/11 vec(A C)$. Mệnh đề c ĐÚNG.

    #step([So sánh độ dài])
    Trong tam giác, đường phân giác trong luôn nhỏ hơn hoặc bằng đường trung tuyến kẻ từ cùng một đỉnh ($A D <= A M$). Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Nút giàn thép cầu đường sắt)
#ds([Một nút giàn thép chịu lực của nhịp cầu đường sắt chịu tác động của ba lực đồng quy tại nút $O$: lực nén thẳng đứng $vec(F)_1$ hướng xuống dưới có độ lớn $F_1 = 120" kN"$ do đoàn tàu truyền qua mặt cầu; hai thanh xiên đối xứng chịu lực kéo $vec(F)_2$ và $vec(F)_3$ có độ lớn bằng nhau ($F_2 = F_3 = F$) và cùng hợp với phương thẳng đứng một góc $alpha = 30^circ$ (góc giữa $vec(F)_2$ và $vec(F)_3$ bằng $60^circ$). Nút giàn ở trạng thái cân bằng lực: $vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (0, -2.4), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((0.3, -2.4), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(F)_1$])
    line(pO, (-1.2, 2.1), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((-1.4, 2.1), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(F)_2$])
    line(pO, (1.2, 2.1), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((1.4, 2.1), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_3$])
    circle(pO, radius: 3pt, fill: black)
    content((-0.25, 0.15), [🏗️ $O$])
    draw_angle_arc(pO, 60deg, 120deg, radius: 0.5, stroke: 1pt + rgb("dc2626"))
    content((0, 0.75), text(fill: rgb("dc2626"), size: 8pt)[$60^circ$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hợp lực của hai lực căng thanh xiên $vec(F)_(23) = vec(F)_2 + vec(F)_3$ có phương thẳng đứng hướng lên và độ lớn bằng $120" kN"$.]),
    True([Độ lớn của hợp lực thỏa mãn công thức: $F_(23) = 2 F cos 30^circ = F sqrt(3)$.]),
    True([Lực kéo trong mỗi thanh xiên có độ lớn bằng $F = 40 sqrt(3)" kN" approx 69.28" kN"$.]),
    [Tổng độ lớn của hai lực kéo thanh xiên bằng đúng độ lớn của lực nén $F_1 = 120" kN"$.]
  ),
  loigiai: [
    #step([Điều kiện cân bằng lực])
    $vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0) <=> vec(F)_2 + vec(F)_3 = - vec(F)_1$.
    Vì $vec(F)_1$ hướng xuống độ lớn $120" kN"$ nên hợp lực $vec(F)_(23)$ hướng thẳng đứng lên trên và có độ lớn $F_(23) = 120" kN"$. Mệnh đề a ĐÚNG.

    #step([Tính độ lớn hợp lực theo góc 30 độ])
    Theo quy tắc hình thoi: $F_(23) = 2 F cos 30^circ = 2 F (sqrt(3))/2 = F sqrt(3)$. Mệnh đề b ĐÚNG.

    #step([Tính lực kéo F])
    $F sqrt(3) = 120 <=> F = 120 / sqrt(3) = 40 sqrt(3)" kN" approx 69.28" kN"$. Mệnh đề c ĐÚNG.

    #step([Tổng độ lớn đại số])
    $F_2 + F_3 = 2 F = 80 sqrt(3) approx 138.56" kN" != 120" kN"$.
    (Do hai lực xiên hợp góc $60^circ$ nên không thể cộng đại số trực tiếp). Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Hải trình ca nô qua sông có dòng hải lưu)
#ds([Một con tàu hàng rời bến chạy theo hướng Đông với vận tốc của động cơ đối với nước là $vec(v)_t$ có độ lớn $24" km/h"$. Dòng hải lưu chảy xiết về hướng Nam với vận tốc $vec(v)_d$ có độ lớn $7" km/h"$. Vận tốc thực tế của con tàu đối với bờ biển là $vec(v) = vec(v)_t + vec(v)_d$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (3.2, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((3.4, 0.2), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(v)_t$ (Đông)])
    line(pO, (0, -1.5), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-0.4, -1.5), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)_d$ (Nam)])
    line(pO, (3.2, -1.5), mark: (end: ">", fill: rgb("dc2626")), stroke: 2.2pt + rgb("dc2626"))
    content((3.5, -1.6), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(v)$])
    content(pO, [🚢 $O$], anchor: "north-east")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ vận tốc $vec(v)_t$ và $vec(v)_d$ vuông góc với nhau, tích vô hướng $vec(v)_t dot vec(v)_d = 0$.]),
    True([Tốc độ thực tế của con tàu đối với bờ biển bằng $25" km/h"$.]),
    True([Sau $2$ giờ hành trình liên tục, con tàu đã di chuyển được quãng đường thực tế là $50" km"$.]),
    [Hướng di chuyển thực tế của con tàu lệch về phía Nam một góc đúng bằng $45^circ$ so với hướng Đông.]
  ),
  loigiai: [
    #step([Tích vô hướng hai vận tốc thành phần])
    Hướng Đông vuông góc với hướng Nam nên $vec(v)_t perp vec(v)_d <=> vec(v)_t dot vec(v)_d = 0$. Mệnh đề a ĐÚNG.

    #step([Tốc độ thực tế đối với bờ])
    $ v = |vec(v)| = sqrt(v_t^2 + v_d^2) = sqrt(24^2 + 7^2) = sqrt(576 + 49) = sqrt(625) = 25" km/h" $. Mệnh đề b ĐÚNG.

    #step([Quãng đường di chuyển sau 2 giờ])
    $ s = v dot t = 25 dot 2 = 50" km" $. Mệnh đề c ĐÚNG.

    #step([Góc lệch hướng])
    Gọi $phi$ là góc lệch so với hướng Đông:
    $ tan phi = v_d / v_t = 7 / 24 approx 0.2917 => phi approx 16.26^circ != 45^circ $. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho tam giác $A B C$ có độ dài hai cạnh $A B = 5, A C = 8$ và góc $hat(B A C) = 60^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.5, 0)
    let pC = (2.0, 3.46)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.7, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.0, 3.7), text(size: 8pt)[$C$])
    draw_angle_arc(pA, 0deg, 60deg, radius: 0.5, stroke: 1pt + rgb("dc2626"))
  })
]
Tính độ dài của cạnh $B C$.],
    [7],
    loigiai: [
        #step([Sử dụng định lý côsin thông qua tích vô hướng])
        $ B C^2 = A B^2 + A C^2 - 2 vec(A B) dot vec(A C) = A B^2 + A C^2 - 2 A B dot A C dot cos 60^circ $
        
        #step([Thay số tính độ dài cạnh BC])
        $ B C^2 = 5^2 + 8^2 - 2 dot 5 dot 8 dot 1/2 = 25 + 64 - 40 = 49 $
        $ B C = sqrt(49) = 7 $
        Vậy độ dài cạnh $B C = 7$.
    ]
)

// TLN 2 (Câu 18)
#tln([Cho hình vuông $A B C D$ có cạnh bằng $6$. Gọi $M$ là trung điểm của cạnh $B C$ và $N$ là trung điểm của cạnh $C D$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.5, 0)
    let pC = (2.5, 2.5)
    let pD = (0, 2.5)
    let pM = (2.5, 1.25)
    let pN = (1.25, 2.5)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + luma(140))
    line(pA, pM, stroke: 1.5pt + rgb("0d9488"))
    line(pB, pN, stroke: 1.5pt + rgb("dc2626"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.7, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.7, 2.6), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, 2.6), text(size: 8pt)[$D$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((2.8, 1.25), text(fill: rgb("0d9488"), size: 8pt)[$M$])
    circle(pN, radius: 2pt, fill: rgb("dc2626"))
    content((1.25, 2.75), text(fill: rgb("dc2626"), size: 8pt)[$N$])
  })
]
Tính giá trị của tích vô hướng $vec(A M) dot vec(B N)$.],
    [0],
    loigiai: [
        #step([Phân tích theo hai cạnh vuông góc AB và AD])
        $vec(A M) = vec(A B) + vec(B M) = vec(A B) + 1/2 vec(A D)$.
        $vec(B N) = vec(B C) + vec(C N) = vec(A D) - 1/2 vec(A B)$.
        
        #step([Nhân vô hướng])
        $ vec(A M) dot vec(B N) = (vec(A B) + 1/2 vec(A D)) dot (vec(A D) - 1/2 vec(A B)) $
        $ = vec(A B) dot vec(A D) - 1/2 A B^2 + 1/2 A D^2 - 1/4 vec(A D) dot vec(A B) $
        Vì $A B perp A D$ và $A B = A D = 6$:
        $ vec(A M) dot vec(B N) = 0 - 1/2(36) + 1/2(36) - 0 = -18 + 18 = 0 $
        (Điều này chứng minh định lý hình học quen thuộc: $A M perp B N$).
    ]
)

// TLN 3 (Câu 19)
#tln([Cho tam giác $A B C$ có độ dài ba cạnh là $a = 13, b = 14, c = 15$ (với $a = B C, b = A C, c = A B$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pB = (0, 0)
    let pC = (3.5, 0)
    let pA = (1.5, 2.8)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 3.05), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.7, -0.2), text(size: 8pt)[$C$])
  })
]
Tính giá trị của tích vô hướng $vec(B A) dot vec(B C)$.],
    [99],
    loigiai: [
        #step([Sử dụng hệ quả định lý côsin tại góc B])
        $ A C^2 = B A^2 + B C^2 - 2 vec(B A) dot vec(B C) $
        $ <=> vec(B A) dot vec(B C) = (B A^2 + B C^2 - A C^2) / 2 = (c^2 + a^2 - b^2) / 2 $
        
        #step([Thay số tính toán])
        $ vec(B A) dot vec(B C) = (15^2 + 13^2 - 14^2) / 2 = (225 + 169 - 196) / 2 = 198 / 2 = 99 $
        Vậy tích vô hướng bằng $99$.
    ]
)

// TLN 4 (Câu 20)
#tln([Cho hai vectơ $vec(a)$ và $vec(b)$ có độ dài lần lượt là $|vec(a)| = 3, |vec(b)| = 2$ và góc giữa chúng $(vec(a), vec(b)) = 60^circ$. Tìm số thực $k$ để vectơ $vec(u) = vec(a) + k vec(b)$ vuông góc với vectơ $vec(v) = vec(a) - vec(b)$.],
    [6],
    loigiai: [
        #step([Tính tích vô hướng và bình phương độ dài])
        $vec(a)^2 = 3^2 = 9$.
        $vec(b)^2 = 2^2 = 4$.
        $vec(a) dot vec(b) = |vec(a)| dot |vec(b)| dot cos 60^circ = 3 dot 2 dot 1/2 = 3$.
        
        #step([Điều kiện hai vectơ vuông góc])
        $ vec(u) perp vec(v) <=> vec(u) dot vec(v) = 0 <=> (vec(a) + k vec(b)) dot (vec(a) - vec(b)) = 0 $
        $ <=> vec(a)^2 - vec(a) dot vec(b) + k vec(a) dot vec(b) - k vec(b)^2 = 0 $
        $ <=> 9 - 3 + k(3) - k(4) = 0 <=> 6 - k = 0 <=> k = 6 $
        Vậy giá trị cần tìm là $k = 6$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Cẩu tháp nâng hàng)
#tln([Một chiếc cẩu tháp trên công trường nâng một khối cấu kiện bê tông có trọng lượng $P = 25000" N"$ lên cao $h = 12" m"$ theo phương thẳng đứng với tốc độ không đổi. Công có ích do lực nâng của dây cáp cẩu thực hiện bằng bao nhiêu kilôjun ($"kJ"$)?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (3.5, 0), stroke: 1.5pt + luma(140))
    rect((0.6, 1.2), (2.4, 1.8), fill: rgb("eff6ff"), stroke: 1.5pt + rgb("1e40af"))
    content((1.5, 1.5), [🏗️ Cấu kiện])
    line((1.5, 1.8), (1.5, 2.8), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((1.8, 2.8), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(F)$])
    line((0.2, 0), (0.2, 1.5), mark: (both: ">"), stroke: 1pt + rgb("0d9488"))
    content((-0.3, 0.75), text(fill: rgb("0d9488"), size: 8pt)[$12" m"$])
  })
]],
    [300],
    loigiai: [
        #step([Xác định lực nâng cần thiết])
        Vì khối cấu kiện được nâng thẳng đều nên độ lớn lực nâng của dây cáp bằng đúng trọng lượng của cấu kiện:
        $ F = P = 25000" N" $
        
        #step([Tính công thực hiện])
        $ A = F dot h dot cos 0^circ = 25000 dot 12 dot 1 = 300000" J" $
        Đổi ra kilôjun: $300000" J" = 300" kJ"$.
    ]
)

// TLN 6 (Câu 22 - Thực tế Tốc độ ca nô vượt sông)
#tln([Một chiếc ca nô du lịch vượt qua một khúc sông lớn rộng $400" m"$. Hướng mũi ca nô luôn giữ vuông góc với bờ sông và duy trì tốc độ máy ổn định $v_1 = 12" km/h"$. Dòng nước sông chảy xuôi với tốc độ không đổi $v_2 = 5" km/h"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Hai bờ sông
    line((-0.5, 2.4), (4.5, 2.4), stroke: 1.5pt + rgb("0284c7"))
    line((-0.5, 0), (4.5, 0), stroke: 1.5pt + rgb("0284c7"))
    content((4.0, 1.2), text(fill: rgb("0284c7"), size: 8pt)[Dòng sông])
    let pA = (0.8, 0)
    line(pA, (0.8, 2.0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((0.4, 1.8), text(fill: rgb("1e40af"), size: 8pt)[$vec(v)_1$])
    line(pA, (2.2, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.8, -0.25), text(fill: rgb("0d9488"), size: 8pt)[$vec(v)_2$])
    line(pA, (2.2, 2.0), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((2.4, 2.15), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(v)$])
    content(pA, [🚤], anchor: "north")
  })
]
Tính tốc độ thực tế của chiếc ca nô đối với hai bờ sông theo đơn vị $"km/h"$.],
    [13],
    loigiai: [
        #step([Phân tích vectơ vận tốc])
        Vận tốc thực tế của ca nô đối với bờ là tổng vectơ:
        $ vec(v) = vec(v)_1 + vec(v)_2 $
        Trong đó $vec(v)_1$ vuông góc với dòng sông và $vec(v)_2$ xuôi theo dòng sông ($vec(v)_1 perp vec(v)_2$).
        
        #step([Tính tốc độ thực tế])
        $ v = |vec(v)| = sqrt(v_1^2 + v_2^2) = sqrt(12^2 + 5^2) = sqrt(144 + 25) = sqrt(169) = 13" km/h" $
        Vậy tốc độ thực tế của ca nô đối với bờ sông là $13" km/h"$.
    ]
)

] // end make-questions

#make-questions()
