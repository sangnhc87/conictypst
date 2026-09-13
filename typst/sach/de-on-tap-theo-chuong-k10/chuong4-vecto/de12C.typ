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
  exam-title: "BÀI TẬP CUỐI CHƯƠNG IV: VECTƠ (ĐỀ SỐ 3 - NÂNG CAO)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "118",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho hai vectơ bất kỳ $vec(a)$ và $vec(b)$. Bất đẳng thức nào sau đây luôn đúng với mọi cặp vectơ?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pA = (2.2, 0)
    let pB = (3.2, 1.8)
    line(pO, pA, mark: (end: ">", fill: rgb("d97706")), stroke: 1.8pt + rgb("d97706"))
    content((1.1, -0.25), text(fill: rgb("d97706"), size: 8.5pt)[$vec(a)$])
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((2.9, 0.9), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(b)$])
    line(pO, pB, mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((1.4, 1.1), text(fill: rgb("1e40af"), size: 8.5pt, weight: "bold")[$vec(a) + vec(b)$])
  })
]],
    (
        True([$|vec(a) + vec(b)| <= |vec(a)| + |vec(b)|$]),
        [$|vec(a) + vec(b)| >= |vec(a)| + |vec(b)|$],
        [$|vec(a) + vec(b)| = |vec(a)| + |vec(b)|$],
        [$|vec(a) + vec(b)| <= |vec(a)| - |vec(b)|$]
    ),
    loigiai: [
        Đây là bất đẳng thức tam giác cho độ dài vectơ: Với ba điểm $O, A, B$ sao cho $vec(O A) = vec(a), vec(A B) = vec(b) => vec(O B) = vec(a) + vec(b)$.
        Trong tam giác $O A B$, ta luôn có $O B <= O A + A B <=> |vec(a) + vec(b)| <= |vec(a)| + |vec(b)|$.
        Dấu bằng xảy ra khi và chỉ khi hai vectơ $vec(a)$ và $vec(b)$ cùng hướng.
    ]
)

// TN 2
#tn([Cho hai vectơ bất kỳ $vec(u)$ và $vec(v)$. Bất đẳng thức Cauchy - Schwarz dạng vectơ nào sau đây luôn đúng?],
    (
        True([$(vec(u) dot vec(v))^2 <= |vec(u)|^2 dot |vec(v)|^2$]),
        [$(vec(u) dot vec(v))^2 >= |vec(u)|^2 dot |vec(v)|^2$],
        [$vec(u) dot vec(v) <= |vec(u)| dot |vec(v)| - 1$],
        [$vec(u) dot vec(v) >= |vec(u)| dot |vec(v)|$]
    ),
    loigiai: [
        Ta có $vec(u) dot vec(v) = |vec(u)| dot |vec(v)| dot cos(vec(u), vec(v))$.
        Bình phương hai vế:
        $ (vec(u) dot vec(v))^2 = |vec(u)|^2 dot |vec(v)|^2 dot cos^2(vec(u), vec(v)) $
        Vì $cos^2(vec(u), vec(v)) <= 1$ nên $(vec(u) dot vec(v))^2 <= |vec(u)|^2 dot |vec(v)|^2$.
        Dấu bằng xảy ra khi và chỉ khi hai vectơ cùng phương ($cos^2 = 1$).
    ]
)

// TN 3
#tn([Cho tam giác $A B C$ không vuông, gọi $O, G, H$ lần lượt là tâm đường tròn ngoại tiếp, trọng tâm và trực tâm của tam giác $A B C$. Đẳng thức vectơ nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pG = (1.2, 0)
    let pH = (3.6, 0)
    line((-0.5, 0), (4.2, 0), stroke: 1.2pt + rgb("d97706"))
    circle(pO, radius: 2.5pt, fill: black)
    content((0, 0.3), text(size: 8pt)[$O$])
    circle(pG, radius: 2.5pt, fill: rgb("0d9488"))
    content((1.2, 0.3), text(fill: rgb("0d9488"), size: 8pt)[$G$])
    circle(pH, radius: 2.5pt, fill: rgb("dc2626"))
    content((3.6, 0.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$H$])
    content((2.1, -0.4), text(fill: luma(100), size: 7.5pt)[Đường thẳng Euler])
  })
]],
    (
        True([$vec(O H) = 3 vec(O G)$]),
        [$vec(O H) = 2 vec(O G)$],
        [$vec(O G) = 3 vec(O H)$],
        [$vec(G H) = 3 vec(O G)$]
    ),
    loigiai: [
        Theo định lý về đường thẳng Euler trong tam giác:
        Tâm ngoại tiếp $O$, trọng tâm $G$ và trực tâm $H$ luôn thẳng hàng và thỏa mãn hệ thức vectơ:
        $ vec(O H) = 3 vec(O G) <=> vec(G H) = 2 vec(O G) $
    ]
)

// TN 4
#tn([Cho đoạn thẳng $A B$ có độ dài $A B = 2a$, gọi $I$ là trung điểm của $A B$. Tập hợp tất cả các điểm $M$ thỏa mãn đẳng thức tích vô hướng $vec(M A) dot vec(M B) = 3 a^2$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pI = (2.0, 1.6)
    circle(pI, radius: 1.6, stroke: 1.5pt + rgb("d97706"))
    let pA = (1.2, 1.6)
    let pB = (2.8, 1.6)
    line((0, 1.6), (4.0, 1.6), stroke: (paint: luma(160), dash: "dashed"))
    circle(pA, radius: 2pt, fill: black)
    content((1.2, 1.3), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.8, 1.3), text(size: 8pt)[$B$])
    circle(pI, radius: 2pt, fill: black)
    content((2.0, 1.3), text(size: 8pt)[$I$])
    line(pI, (3.6, 1.6), stroke: 1.5pt + rgb("dc2626"))
    content((2.8, 1.85), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$R = 2a$])
  })
]],
    (
        True([Đường tròn tâm $I$ bán kính $R = 2a$]),
        [Đường tròn tâm $I$ bán kính $R = a sqrt(3)$],
        [Đường tròn đường kính $A B$],
        [Đường trung trực của đoạn thẳng $A B$]
    ),
    loigiai: [
        Vì $I$ là trung điểm của $A B$ nên $I A = I B = a$.
        Áp dụng công thức thu gọn tích vô hướng:
        $ vec(M A) dot vec(M B) = M I^2 - I A^2 = 3 a^2 $
        $ <=> M I^2 - a^2 = 3 a^2 <=> M I^2 = 4 a^2 <=> M I = 2a $
        Vậy tập hợp điểm $M$ là đường tròn tâm $I$, bán kính $R = 2a$.
    ]
)

// TN 5
#tn([Cho tam giác $A B C$ có ba cạnh $a = 8, b = 7$ và $c = 5$ (với $a = B C, b = A C, c = A B$). Tích vô hướng $vec(C A) dot vec(C B)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pC = (0, 0)
    let pB = (3.5, 0)
    let pA = (1.5, 2.5)
    line(pC, pB, pA, close: true, stroke: 1.2pt + rgb("d97706"))
    circle(pC, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$C$])
    circle(pB, radius: 2pt, fill: black)
    content((3.7, -0.2), text(size: 8pt)[$B$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.75), text(size: 8pt)[$A$])
  })
]],
    (
        True([$44$]),
        [$55$],
        [$22$],
        [$88$]
    ),
    loigiai: [
        Theo hệ quả của định lý côsin tại đỉnh $C$:
        $ A B^2 = C A^2 + C B^2 - 2 vec(C A) dot vec(C B) $
        $ <=> vec(C A) dot vec(C B) = (C A^2 + C B^2 - A B^2) / 2 = (b^2 + a^2 - c^2) / 2 $
        $ = (7^2 + 8^2 - 5^2) / 2 = (49 + 64 - 25) / 2 = 88 / 2 = 44 $
    ]
)

// TN 6
#tn([Cho tam giác $A B C$ vuông tại $A$ có $A B = 6$ và $A C = 8$. Gọi $M$ là trung điểm của cạnh huyền $B C$. Tích vô hướng $vec(A M) dot vec(A B)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.4, 0)
    let pC = (0, 3.2)
    let pM = (1.2, 1.6)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("d97706"))
    line(pA, pM, stroke: 1.5pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.6, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((-0.2, 3.4), text(size: 8pt)[$C$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((1.4, 1.7), text(fill: rgb("0d9488"), size: 8pt, weight: "bold")[$M$])
    draw_angle_arc(pA, 0deg, 90deg, radius: 0.3, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$18$]),
        [$24$],
        [$36$],
        [$12$]
    ),
    loigiai: [
        Vì $M$ là trung điểm của $B C$ nên $vec(A M) = 1/2 (vec(A B) + vec(A C))$.
        Nhân vô hướng với $vec(A B)$:
        $ vec(A M) dot vec(A B) = 1/2 (vec(A B) + vec(A C)) dot vec(A B) = 1/2 (A B^2 + vec(A C) dot vec(A B)) $
        Vì tam giác $A B C$ vuông tại $A$ nên $vec(A C) dot vec(A B) = 0$.
        $ vec(A M) dot vec(A B) = 1/2 A B^2 = 1/2 dot 6^2 = 1/2 dot 36 = 18 $
    ]
)

// TN 7
#tn([Cho tam giác $A B C$ có trọng tâm là $G$. Điểm $M$ trong mặt phẳng sao cho độ dài vectơ $|vec(M A) + vec(M B) + vec(M C)|$ đạt giá trị nhỏ nhất. Khẳng định nào sau đây là ĐÚNG?],
    (
        True([Điểm $M$ trùng với trọng tâm $G$ và giá trị nhỏ nhất bằng $0$]),
        [Điểm $M$ trùng với trực tâm $H$ của tam giác],
        [Điểm $M$ trùng với tâm đường tròn ngoại tiếp $O$],
        [Điểm $M$ trùng với trung điểm của cạnh $B C$]
    ),
    loigiai: [
        Vì $G$ là trọng tâm của tam giác $A B C$ nên $vec(M A) + vec(M B) + vec(M C) = 3 vec(M G)$.
        Độ lớn: $|vec(M A) + vec(M B) + vec(M C)| = 3 |vec(M G)| = 3 M G >= 0$.
        Dấu bằng xảy ra khi $M G = 0 <=> M equiv G$.
        Giá trị nhỏ nhất bằng $0$.
    ]
)

// TN 8
#tn([Cho hai vectơ đơn vị $vec(u)$ và $vec(v)$ ($|vec(u)| = |vec(v)| = 1$). Giá trị nhỏ nhất của tích vô hướng $vec(u) dot vec(v)$ bằng],
    (
        True([$-1$]),
        [$0$],
        [$1$],
        [$-2$]
    ),
    loigiai: [
        $vec(u) dot vec(v) = |vec(u)| dot |vec(v)| dot cos(vec(u), vec(v)) = 1 dot 1 dot cos(vec(u), vec(v)) = cos(vec(u), vec(v))$.
        Vì $cos(vec(u), vec(v)) >= -1$ nên giá trị nhỏ nhất của tích vô hướng bằng $-1$, đạt được khi hai vectơ ngược hướng nhau ($alpha = 180^circ$).
    ]
)

// TN 9
#tn([Cho tam giác $A B C$ có độ dài ba cạnh $a = B C, b = A C, c = A B$. Công thức tính bình phương độ dài đường trung tuyến $m_a^2$ kẻ từ đỉnh $A$ là],
    (
        True([$m_a^2 = (2 b^2 + 2 c^2 - a^2) / 4$]),
        [$m_a^2 = (b^2 + c^2 - 2 a^2) / 4$],
        [$m_a^2 = (2 b^2 + 2 c^2 + a^2) / 4$],
        [$m_a^2 = (b^2 + c^2 - a^2) / 2$]
    ),
    loigiai: [
        Gọi $M$ là trung điểm của $B C$. Ta có $vec(A M) = 1/2 (vec(A B) + vec(A C))$.
        Bình phương vô hướng:
        $ m_a^2 = vec(A M)^2 = 1/4 (vec(A B) + vec(A C))^2 = 1/4 (A B^2 + A C^2 + 2 vec(A B) dot vec(A C)) $
        Thay $2 vec(A B) dot vec(A C) = b^2 + c^2 - a^2$ vào ta được:
        $ m_a^2 = 1/4 (c^2 + b^2 + b^2 + c^2 - a^2) = (2 b^2 + 2 c^2 - a^2) / 4 $
    ]
)

// TN 10
#tn([Một tấm pin năng lượng mặt trời phẳng có vectơ pháp tuyến đơn vị $vec(n)$. Ánh sáng mặt trời chiếu tới theo phương vectơ đơn vị $vec(s)$. Cường độ năng lượng quang điện sinh ra tỉ lệ thuận với tích vô hướng $vec(n) dot vec(s) = cos theta$ (với $theta$ là góc giữa $vec(n)$ và $vec(s)$, $0^circ <= theta < 90^circ$). Hiệu suất hấp thụ năng lượng của tấm pin đạt cực đại khi
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.5, 0.5), (3.5, 1.2), fill: rgb("eff6ff"), stroke: 1.5pt + rgb("d97706"))
    content((2.0, 0.85), [☀️ Pin mặt trời])
    line((2.0, 1.2), (2.0, 2.5), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((2.2, 2.5), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(n)$])
    line((3.2, 2.5), (2.0, 1.2), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((3.4, 2.4), text(fill: rgb("0d9488"), size: 8.5pt)[Tia sáng $vec(s)$])
  })
]],
    (
        True([$theta = 0^circ$ (tia sáng chiếu vuông góc với bề mặt tấm pin)]),
        [$theta = 45^circ$],
        [$theta = 60^circ$],
        [$theta = 90^circ$ (tia sáng chiếu là là song song mặt pin)]
    ),
    loigiai: [
        Vì hàm $cos theta$ nghịch biến trên $[0^circ; 90^circ)$ nên $cos theta$ đạt giá trị lớn nhất bằng $1$ khi $theta = 0^circ$.
        Khi đó vectơ pháp tuyến $vec(n)$ cùng hướng với tia sáng $vec(s)$, nghĩa là chùm tia sáng chiếu vuông góc với bề mặt tấm pin năng lượng mặt trời.
    ]
)

// TN 11
#tn([Trong không gian, một tàu vũ trụ đang bay với vận tốc ban đầu $vec(v)_0 = (6; 8)$ (km/s). Để tăng tốc, động cơ phụt khí tạo lực đẩy làm tăng vận tốc một lượng $Delta vec(v) = (3; 4)$ (km/s) cùng hướng chuyển động. Tốc độ mới của tàu vũ trụ bằng],
    (
        True([$15" km/s"$]),
        [$10" km/s"$],
        [$14" km/s"$],
        [$12.5" km/s"$]
    ),
    loigiai: [
        Vận tốc mới của tàu: $vec(v) = vec(v)_0 + Delta vec(v) = (6 + 3; 8 + 4) = (9; 12)$ (km/s).
        Tốc độ mới:
        $ v = |vec(v)| = sqrt(9^2 + 12^2) = sqrt(81 + 144) = sqrt(225) = 15" km/s" $
    ]
)

// TN 12
#tn([Cho tam giác $A B C$. Điều kiện cần và đủ để đường phân giác trong góc $A$ vuông góc với đường trung tuyến kẻ từ đỉnh $A$ là],
    (
        True([Tam giác $A B C$ cân tại đỉnh $A$]),
        [Tam giác $A B C$ vuông tại đỉnh $A$],
        [Tam giác $A B C$ là tam giác đều],
        [Tam giác $A B C$ có góc $hat(A) = 120^circ$]
    ),
    loigiai: [
        Đường phân giác trong và đường trung tuyến xuất phát từ cùng đỉnh $A$ vuông góc nhau khi và chỉ khi hai đường này trùng nhau (tạo góc $0^circ$), điều đó xảy ra khi và chỉ khi tam giác $A B C$ cân tại đỉnh $A$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Đường thẳng Euler)
#ds([Cho tam giác $A B C$ không vuông có tâm đường tròn ngoại tiếp $O$, trọng tâm $G$ và trực tâm $H$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pG = (1.2, 0)
    let pH = (3.6, 0)
    line((-0.5, 0), (4.2, 0), stroke: 1.5pt + rgb("d97706"))
    circle(pO, radius: 2.5pt, fill: black)
    content((0, 0.3), text(size: 8pt)[$O$])
    circle(pG, radius: 2.5pt, fill: rgb("0d9488"))
    content((1.2, 0.3), text(fill: rgb("0d9488"), size: 8pt)[$G$])
    circle(pH, radius: 2.5pt, fill: rgb("dc2626"))
    content((3.6, 0.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$H$])
    content((2.1, -0.4), text(fill: luma(100), size: 7.5pt)[Đường thẳng Euler])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hệ thức vectơ liên hệ giữa tâm ngoại tiếp và trực tâm là: $vec(O A) + vec(O B) + vec(O C) = vec(O H)$.]),
    True([Ba điểm $O, G, H$ luôn thẳng hàng trên một đường thẳng gọi là đường thẳng Euler.]),
    True([Hệ thức vectơ giữa ba điểm trên đường thẳng Euler là $vec(O H) = 3 vec(O G)$.]),
    [Trọng tâm $G$ là trung điểm của đoạn thẳng nối trực tâm $H$ và tâm ngoại tiếp $O$.]
  ),
  loigiai: [
    #step([Chứng minh hệ thức vectơ trực tâm])
    Từ hệ thức quen thuộc $vec(O A) + vec(O B) + vec(O C) = 3 vec(O G)$ và định nghĩa trực tâm suy ra $vec(O A) + vec(O B) + vec(O C) = vec(O H)$. Mệnh đề a ĐÚNG.

    #step([Đường thẳng Euler])
    Do $vec(O H) = 3 vec(O G)$ nên hai vectơ $vec(O H)$ và $vec(O G)$ cùng phương, ba điểm $O, G, H$ luôn thẳng hàng. Mệnh đề b, c ĐÚNG.

    #step([Tỉ số đoạn thẳng])
    Vì $vec(O H) = 3 vec(O G)$ nên $O G = 1/3 O H$ và $G H = 2/3 O H$, điểm $G$ không phải là trung điểm của $O H$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Quỹ tích đường tròn Apollonius)
#ds([Cho hai điểm cố định $A$ và $B$ có khoảng cách $A B = 6$. Điểm $M$ trong mặt phẳng thỏa mãn tỉ số khoảng cách $M A = 2 M B$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pE = (2.0, 0)
    let pF = (4.0, 0)
    let pI = (3.0, 0)
    circle(pI, radius: 1.0, stroke: 1.5pt + rgb("d97706"))
    line((0, 0), (5.0, 0), stroke: 1pt + luma(140))
    circle((0.5, 0), radius: 2pt, fill: black)
    content((0.5, -0.3), text(size: 8pt)[$A$])
    circle((2.5, 0), radius: 2pt, fill: black)
    content((2.5, -0.3), text(size: 8pt)[$B$])
    circle(pI, radius: 2pt, fill: rgb("dc2626"))
    content((3.0, 0.3), text(fill: rgb("dc2626"), size: 8pt)[Tâm])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hệ thức khoảng cách tương đương với đẳng thức vectơ: $(vec(M A) - 2 vec(M B)) dot (vec(M A) + 2 vec(M B)) = 0$.]),
    True([Gọi $E, F$ là hai điểm trên đường thẳng $A B$ chia trong và chia ngoài đoạn $A B$ theo tỉ số $2$, khi đó $M E perp M F$.]),
    True([Tập hợp điểm $M$ là đường tròn nhận đoạn thẳng $E F$ làm đường kính (đường tròn Apollonius).]),
    [Tâm của đường tròn quỹ tích này trùng với trung điểm của đoạn thẳng $A B$.]
  ),
  loigiai: [
    #step([Chuyển sang tích vô hướng])
    $M A = 2 M B <=> M A^2 - 4 M B^2 = 0 <=> vec(M A)^2 - (2 vec(M B))^2 = 0$.
    $ <=> (vec(M A) - 2 vec(M B)) dot (vec(M A) + 2 vec(M B)) = 0 $. Mệnh đề a ĐÚNG.

    #step([Điểm chia trong và chia ngoài])
    Xác định điểm $E, F$ sao cho $vec(E A) - 2 vec(E B) = vec(0)$ và $vec(F A) + 2 vec(F B) = vec(0)$.
    Khi đó $vec(M A) - 2 vec(M B) = - vec(M E)$ và $vec(M A) + 2 vec(M B) = 3 vec(M F)$.
    Suy ra $vec(M E) dot vec(M F) = 0 <=> M E perp M F$. Mệnh đề b ĐÚNG.

    #step([Quỹ tích đường tròn Apollonius])
    Vì góc $hat(E M F) = 90^circ$ nên tập hợp điểm $M$ là đường tròn đường kính $E F$. Mệnh đề c ĐÚNG.

    #step([Vị trí của tâm])
    Tâm đường tròn là trung điểm của $E F$, nằm lệch hẳn về phía điểm $B$ (do $M A = 2 M B$), không trùng với trung điểm của $A B$. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Tối ưu lực kéo sà lan trên kênh đào hẹp)
#ds([Một chiếc sà lan chở cát di chuyển thẳng đều dọc theo trục giữa của một con kênh hẹp. Một máy tời kéo cáp trên bờ kéo sà lan với lực căng $F = 4000" N"$ hợp với hướng tiến của sà lan một góc $alpha$ ($0^circ <= alpha < 90^circ$). Sà lan di chuyển được quãng đường $s = 50" m"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 1.8), (5.0, 1.8), stroke: 1.8pt + rgb("0284c7"))
    line((-0.5, -1.8), (5.0, -1.8), stroke: 1.8pt + rgb("0284c7"))
    line((-0.5, 0), (5.0, 0), stroke: (paint: luma(160), dash: "dashed"))
    rect((0.8, -0.5), (2.4, 0.5), fill: rgb("f8fafc"), stroke: 1.5pt + rgb("0369a1"))
    content((1.6, 0), [🚢 Sà lan])
    circle((3.8, 1.8), radius: 3pt, fill: rgb("d97706"))
    content((3.8, 2.1), [⚙️ Máy tời])
    line((2.4, 0), (3.8, 1.8), stroke: 1.5pt + rgb("d97706"))
    draw_angle_arc((2.4, 0), 0deg, 52deg, radius: 0.6, stroke: 1pt + rgb("dc2626"))
    content((2.9, 0.4), text(fill: rgb("dc2626"), size: 8pt)[$alpha$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Công của lực kéo thực hiện trên quãng đường $50" m"$ là $A(alpha) = 200000 cos alpha" J"$.]),
    True([Công của lực kéo đạt giá trị lớn nhất khi $alpha = 0^circ$, bằng $200" kJ"$.]),
    True([Khi góc kéo tăng dần từ $0^circ$ lên $60^circ$, công có ích của lực kéo giảm đi $100" kJ"$.]),
    [Khi góc kéo $alpha = 45^circ$, thành phần lực kéo tiến và thành phần lực kéo dạt bờ triệt tiêu lẫn nhau.]
  ),
  loigiai: [
    #step([Công thức tính công])
    $A(alpha) = F dot s dot cos alpha = 4000 dot 50 dot cos alpha = 200000 cos alpha" J"$. Mệnh đề a ĐÚNG.

    #step([Công cực đại])
    Khi $alpha = 0^circ => A_(max) = 200000" J" = 200" kJ"$. Mệnh đề b ĐÚNG.

    #step([Độ giảm khi alpha = 60 độ])
    $A(60^circ) = 200000 dot 1/2 = 100000" J" = 100" kJ"$.
    Độ giảm: $200 - 100 = 100" kJ"$. Mệnh đề c ĐÚNG.

    #step([Thành phần lực])
    Khi $alpha = 45^circ$, $F_x = F cos 45^circ$ và $F_y = F sin 45^circ$ có độ lớn bằng nhau nhưng vuông góc nhau chứ không hề triệt tiêu nhau. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Động cơ đẩy tàu vũ trụ)
#ds([Một tàu thám hiểm không gian đang chuyển động trên quỹ đạo với vận tốc $vec(v)_0$ có độ lớn $v_0 = 8" km/s"$. Để chuyển tiếp quỹ đạo, động cơ phản lực được kích hoạt tạo ra xung vận tốc $Delta vec(v)$ có độ lớn $6" km/s"$ vuông góc với hướng vận tốc ban đầu ($Delta vec(v) perp vec(v)_0$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (3.2, 0), mark: (end: ">", fill: rgb("d97706")), stroke: 2pt + rgb("d97706"))
    content((3.4, -0.25), text(fill: rgb("d97706"), size: 8.5pt)[$vec(v)_0$])
    line(pO, (0, 2.4), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((-0.3, 2.5), text(fill: rgb("0d9488"), size: 8.5pt)[$Delta vec(v)$])
    line(pO, (3.2, 2.4), mark: (end: ">", fill: rgb("1e40af")), stroke: 2.2pt + rgb("1e40af"))
    content((3.4, 2.6), text(fill: rgb("1e40af"), size: 8.5pt, weight: "bold")[$vec(v)$])
    content(pO, [🚀], anchor: "north-east")
    draw_angle_arc(pO, 0deg, 90deg, radius: 0.4, stroke: 1pt + rgb("dc2626"))
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tích vô hướng giữa vận tốc ban đầu và xung vận tốc bổ sung bằng $0$: $vec(v)_0 dot Delta vec(v) = 0$.]),
    True([Vận tốc mới của tàu thám hiểm thỏa mãn: $vec(v) = vec(v)_0 + Delta vec(v)$.]),
    True([Tốc độ mới của tàu thám hiểm sau khi đốt động cơ bằng đúng $10" km/s"$.]),
    [Động năng của con tàu sau khi đốt động cơ tăng gấp đôi so với động năng ban đầu.]
  ),
  loigiai: [
    #step([Tích vô hướng hai vectơ vuông góc])
    $vec(v)_0 perp Delta vec(v) <=> vec(v)_0 dot Delta vec(v) = 0$. Mệnh đề a ĐÚNG.

    #step([Vận tốc tổng hợp])
    $vec(v) = vec(v)_0 + Delta vec(v)$. Mệnh đề b ĐÚNG.

    #step([Tốc độ mới])
    $v = sqrt(v_0^2 + |Delta vec(v)|^2) = sqrt(8^2 + 6^2) = sqrt(64 + 36) = sqrt(100) = 10" km/s"$. Mệnh đề c ĐÚNG.

    #step([So sánh động năng])
    Tỉ số động năng: $W_(d 2) / W_(d 1) = v^2 / v_0^2 = 10^2 / 8^2 = 100 / 64 = 1.5625 != 2$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho đoạn thẳng $A B$ có độ dài $A B = 8$, gọi $I$ là trung điểm của $A B$. Điểm $M$ trong mặt phẳng thỏa mãn đẳng thức tích vô hướng $vec(M A) dot vec(M B) = 9$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pI = (2.0, 0)
    let pB = (4.0, 0)
    let pM = (2.0, 2.0)
    line(pA, pB, stroke: 1.2pt + luma(140))
    line(pM, pI, stroke: 1.5pt + rgb("d97706"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((4.2, -0.2), text(size: 8pt)[$B$])
    circle(pI, radius: 2pt, fill: black)
    content((2.0, -0.3), text(size: 8pt)[$I$])
    circle(pM, radius: 2.5pt, fill: rgb("d97706"))
    content((2.0, 2.3), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$M$])
  })
]
Tính khoảng cách từ điểm $M$ đến trung điểm $I$ (độ dài đoạn thẳng $M I$).],
    [5],
    loigiai: [
        #step([Sử dụng công thức trung điểm])
        $I$ là trung điểm $A B => I A = (A B) / 2 = 8 / 2 = 4$.
        $ vec(M A) dot vec(M B) = M I^2 - I A^2 = 9 $
        
        #step([Tính khoảng cách MI])
        $ M I^2 - 4^2 = 9 <=> M I^2 - 16 = 9 <=> M I^2 = 25 <=> M I = 5 $
        Vậy $M I = 5$.
    ]
)

// TLN 2 (Câu 18)
#tln([Cho tam giác $A B C$ có độ dài ba cạnh là $a = 6, b = 7$ và $c = 5$ (với $a = B C, b = A C, c = A B$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pB = (0, 0)
    let pC = (3.0, 0)
    let pA = (1.2, 2.5)
    let pM = (1.5, 0)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("d97706"))
    line(pA, pM, stroke: 1.5pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((1.2, 2.75), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8pt)[$C$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((1.5, -0.3), text(fill: rgb("0d9488"), size: 8pt)[$M$])
  })
]
Tính bình phương độ dài đường trung tuyến $m_a^2$ kẻ từ đỉnh $A$.],
    [28],
    loigiai: [
        #step([Áp dụng công thức đường trung tuyến])
        $ m_a^2 = (2 b^2 + 2 c^2 - a^2) / 4 $
        
        #step([Thay số tính toán])
        $ m_a^2 = (2 dot 7^2 + 2 dot 5^2 - 6^2) / 4 = (2 dot 49 + 2 dot 25 - 36) / 4 = (98 + 50 - 36) / 4 = 112 / 4 = 28 $
        Vậy $m_a^2 = 28$.
    ]
)

// TLN 3 (Câu 19)
#tln([Cho tam giác đều $A B C$ có cạnh bằng $4$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3.0, 0)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("d97706"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.85), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8pt)[$C$])
  })
]
Tính giá trị của biểu thức tích vô hướng $P = (vec(A B) + vec(A C)) dot (vec(A B) - vec(A C))$.],
    [0],
    loigiai: [
        #step([Áp dụng hằng đẳng thức tích vô hướng])
        $ P = (vec(A B) + vec(A C)) dot (vec(A B) - vec(A C)) = vec(A B)^2 - vec(A C)^2 = A B^2 - A C^2 $
        
        #step([Tính giá trị biểu thức])
        Vì tam giác $A B C$ đều nên $A B = A C = 4$:
        $ P = 4^2 - 4^2 = 16 - 16 = 0 $
        Vậy giá trị của $P$ bằng $0$.
    ]
)

// TLN 4 (Câu 20)
#tln([Cho hai vectơ vuông góc với nhau $vec(a) perp vec(b)$ có độ dài lần lượt là $|vec(a)| = 5$ và $|vec(b)| = 12$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (1.8, 0), mark: (end: ">", fill: rgb("d97706")), stroke: 1.8pt + rgb("d97706"))
    content((1.9, -0.25), text(fill: rgb("d97706"), size: 8.5pt)[$vec(a)$])
    line(pO, (0, 3.2), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-0.3, 3.2), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(b)$])
    line(pO, (1.8, 3.2), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((2.0, 3.4), text(fill: rgb("1e40af"), size: 8.5pt, weight: "bold")[$vec(a) + vec(b)$])
    draw_angle_arc(pO, 0deg, 90deg, radius: 0.35, stroke: 1pt + rgb("dc2626"))
  })
]
Tính độ dài của vectơ tổng $|vec(a) + vec(b)|$.],
    [13],
    loigiai: [
        #step([Bình phương vô hướng])
        $ |vec(a) + vec(b)|^2 = vec(a)^2 + vec(b)^2 + 2 vec(a) dot vec(b) $
        Vì $vec(a) perp vec(b) => vec(a) dot vec(b) = 0$:
        $ |vec(a) + vec(b)|^2 = |vec(a)|^2 + |vec(b)|^2 = 5^2 + 12^2 = 25 + 144 = 169 $
        
        #step([Khai căn])
        $ |vec(a) + vec(b)| = sqrt(169) = 13 $
    ]
)

// TLN 5 (Câu 21 - Thực tế Tấm pin mặt trời xoay theo góc)
#tln([Một hệ thống pin quang điện mặt trời có công suất hấp thụ cực đại là $P_0 = 800" W"$ khi mặt trời chiếu thẳng góc với bề mặt pin. Vào buổi chiều, khi góc tạo bởi tia sáng mặt trời và vectơ pháp tuyến của tấm pin là $theta = 60^circ$, công suất quang điện hấp thụ tức thời của tấm pin bằng bao nhiêu Oát ($"W"$)?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.5, 0.5), (3.5, 1.2), fill: rgb("eff6ff"), stroke: 1.5pt + rgb("d97706"))
    content((2.0, 0.85), [☀️ Pin mặt trời])
    line((2.0, 1.2), (2.0, 2.5), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((2.2, 2.5), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(n)$])
    line((3.3, 2.3), (2.0, 1.2), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((3.5, 2.2), text(fill: rgb("0d9488"), size: 8pt)[Tia sáng])
    draw_angle_arc((2.0, 1.2), 40deg, 90deg, radius: 0.6, stroke: 1pt + rgb("d97706"))
    content((2.4, 1.8), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
  })
]],
    [400],
    loigiai: [
        #step([Công thức công suất phụ thuộc góc nghiêng])
        $ P = P_0 dot cos theta $
        
        #step([Thay số tính công suất])
        Với $P_0 = 800" W"$ và $theta = 60^circ$:
        $ P = 800 dot cos 60^circ = 800 dot 1/2 = 400" W" $
        Vậy công suất quang điện hấp thụ bằng $400" W"$.
    ]
)

// TLN 6 (Câu 22 - Thực tế Tàu phá băng vượt bão tuyết Bắc Cực)
#tln([Một tàu phá băng nghiên cứu Bắc Cực di chuyển thẳng về hướng Bắc với tốc độ máy $v_1 = 20" km/h"$. Dòng hải lưu ngầm vùng cực đẩy tàu dạt về hướng Đông với tốc độ $v_2 = 15" km/h"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (0, 2.4), mark: (end: ">", fill: rgb("d97706")), stroke: 1.8pt + rgb("d97706"))
    content((-0.4, 2.5), text(fill: rgb("d97706"), size: 8.5pt)[$vec(v)_1$ (Bắc)])
    line(pO, (2.0, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((2.0, -0.25), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)_2$ (Đông)])
    line(pO, (2.0, 2.4), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((2.3, 2.5), text(fill: rgb("1e40af"), size: 8.5pt, weight: "bold")[$vec(v)$])
    content(pO, [🚢], anchor: "north-east")
  })
]
Tính tốc độ thực tế của tàu phá băng đối với đáy biển thềm lục địa theo đơn vị $"km/h"$.],
    [25],
    loigiai: [
        #step([Phân tích vectơ vận tốc])
        Vận tốc thực tế của tàu là tổng hợp:
        $ vec(v) = vec(v)_1 + vec(v)_2 $
        Vì hướng Bắc vuông góc với hướng Đông nên:
        
        #step([Tính tốc độ thực tế])
        $ v = sqrt(v_1^2 + v_2^2) = sqrt(20^2 + 15^2) = sqrt(400 + 225) = sqrt(625) = 25" km/h" $
        Vậy tốc độ thực tế của tàu phá băng bằng $25" km/h"$.
    ]
)

] // end make-questions

#make-questions()
