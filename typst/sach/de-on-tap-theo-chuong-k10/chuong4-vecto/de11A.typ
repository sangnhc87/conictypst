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
  exam-title: "BÀI 11: TÍCH VÔ HƯỚNG CỦA HAI VECTƠ (ĐỀ SỐ 1 - NÂNG CAO)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "113",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho tam giác $A B C$ vuông tại $A$ có $A B = c$ và $A C = b$. Gọi $M$ là trung điểm của cạnh huyền $B C$. Giá trị của tích vô hướng $vec(A M) dot vec(B C)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3.2, 0)
    let pC = (0, 2.4)
    let pM = (1.6, 1.2)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    line(pA, pM, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    line(pB, pC, mark: (end: ">", fill: rgb("dc2626")), stroke: 1.5pt + rgb("dc2626"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.4, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((-0.2, 2.5), text(size: 8pt)[$C$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((1.9, 1.4), text(fill: rgb("0d9488"), size: 8pt, weight: "bold")[$M$])
  })
]],
    (
        True([$(b^2 - c^2) / 2$]),
        [$(c^2 - b^2) / 2$],
        [$0$],
        [$(b^2 + c^2) / 4$]
    ),
    loigiai: [
        Vì $M$ là trung điểm của $B C$ nên $vec(A M) = 1/2(vec(A B) + vec(A C))$.
        Vectơ $vec(B C) = vec(A C) - vec(A B)$.
        Do tam giác $A B C$ vuông tại $A$ nên $vec(A B) dot vec(A C) = 0$. Khi đó:
        $ vec(A M) dot vec(B C) = 1/2 (vec(A C) + vec(A B)) dot (vec(A C) - vec(A B)) = 1/2 (A C^2 - A B^2) = (b^2 - c^2) / 2 $
    ]
)

// TN 2
#tn([Cho tam giác $A B C$ có hai đường trung tuyến $B M$ và $C N$ vuông góc với nhau ($B M perp C N$). Mối quan hệ giữa ba cạnh $a = B C, b = A C, c = A B$ của tam giác là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 3.2)
    let pB = (0, 0)
    let pC = (3.5, 0)
    let pM = (2.5, 1.6)
    let pN = (0.75, 1.6)
    let pG = (1.67, 1.07)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    line(pB, pM, stroke: 1.5pt + rgb("0d9488"))
    line(pC, pN, stroke: 1.5pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 3.45), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.7, -0.2), text(size: 8pt)[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((2.7, 1.7), text(size: 8pt)[$M$])
    circle(pN, radius: 2pt, fill: black)
    content((0.5, 1.7), text(size: 8pt)[$N$])
    circle(pG, radius: 2pt, fill: rgb("dc2626"))
    content((1.67, 0.75), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$G$])
    draw_angle_arc(pG, -40deg, 50deg, radius: 0.35, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$b^2 + c^2 = 5 a^2$]),
        [$a^2 + c^2 = 5 b^2$],
        [$b^2 + c^2 = 2 a^2$],
        [$a^2 + b^2 + c^2 = 0$]
    ),
    loigiai: [
        Ta phân tích hai vectơ trung tuyến theo hai vectơ cạnh $vec(A B)$ và $vec(A C)$:
        $ vec(B M) = 1/2 vec(A C) - vec(A B), quad vec(C N) = 1/2 vec(A B) - vec(A C) $
        Điều kiện vuông góc:
        $ vec(B M) dot vec(C N) = 0 <=> (1/2 vec(A C) - vec(A B)) dot (1/2 vec(A B) - vec(A C)) = 0 $
        $ <=> 1/4 vec(A B) dot vec(A C) - 1/2 A C^2 - 1/2 A B^2 + vec(A B) dot vec(A C) = 0 $
        $ <=> 5/4 vec(A B) dot vec(A C) = 1/2(b^2 + c^2) <=> 5/2 vec(A B) dot vec(A C) = b^2 + c^2 $
        Mặt khác, $2 vec(A B) dot vec(A C) = b^2 + c^2 - a^2$. Thay vào ta được:
        $ 5/4 (b^2 + c^2 - a^2) = 1/2(b^2 + c^2) <=> 5(b^2 + c^2 - a^2) = 2(b^2 + c^2) <=> b^2 + c^2 = 5 a^2 $
    ]
)

// TN 3
#tn([Cho hình vuông $A B C D$ có cạnh bằng $a$. Trên cạnh $B C$ lấy điểm $M$ sao cho $B M = 1/3 B C$, trên cạnh $C D$ lấy điểm $N$ sao cho $D N = 1/2 C D$. Tích vô hướng $vec(A M) dot vec(A N)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.4, 0)
    let pC = (2.4, 2.4)
    let pD = (0, 2.4)
    let pM = (2.4, 0.8)
    let pN = (1.2, 2.4)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + luma(140))
    line(pA, pM, stroke: 1.5pt + rgb("0d9488"))
    line(pA, pN, stroke: 1.5pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.6, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.6, 2.5), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, 2.5), text(size: 8pt)[$D$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((2.7, 0.8), text(fill: rgb("0d9488"), size: 8pt)[$M$])
    circle(pN, radius: 2pt, fill: rgb("1e40af"))
    content((1.2, 2.65), text(fill: rgb("1e40af"), size: 8pt)[$N$])
  })
]],
    (
        True([$5/6 a^2$]),
        [$1/2 a^2$],
        [$2/3 a^2$],
        [$a^2$]
    ),
    loigiai: [
        Phân tích theo hai vectơ trực chuẩn $vec(A B)$ và $vec(A D)$ ($vec(A B) dot vec(A D) = 0$):
        $ vec(A M) = vec(A B) + vec(B M) = vec(A B) + 1/3 vec(A D) $
        $ vec(A N) = vec(A D) + vec(D N) = vec(A D) + 1/2 vec(A B) $
        Nhân vô hướng:
        $ vec(A M) dot vec(A N) = (vec(A B) + 1/3 vec(A D)) dot (1/2 vec(A B) + vec(A D)) = 1/2 A B^2 + 1/3 A D^2 = (1/2 + 1/3) a^2 = 5/6 a^2 $
    ]
)

// TN 4
#tn([Cho hai vectơ $vec(a)$ và $vec(b)$ thỏa mãn $|vec(a)| = 2, |vec(b)| = 3$ và $|vec(a) + 2 vec(b)| = 2 sqrt(7)$. Số đo của góc giữa hai vectơ $vec(a)$ và $vec(b)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (2.0, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((2.2, -0.25), text(fill: rgb("1e40af"), size: 8.5pt)[$vec(a)$])
    line(pO, (-1.5, 2.6), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((-1.7, 2.8), text(fill: rgb("0d9488"), size: 8.5pt)[$2 vec(b)$])
    draw_angle_arc(pO, 0deg, 120deg, radius: 0.6, stroke: 1pt + rgb("dc2626"))
    content((0.4, 0.65), text(fill: rgb("dc2626"), size: 8pt)[$120^circ$])
  })
]],
    (
        True([$120^circ$]),
        [$60^circ$],
        [$135^circ$],
        [$150^circ$]
    ),
    loigiai: [
        Bình phương vô hướng biểu thức giả thiết:
        $ |vec(a) + 2 vec(b)|^2 = vec(a)^2 + 4 vec(b)^2 + 4 vec(a) dot vec(b) $
        $ (2 sqrt(7))^2 = 2^2 + 4 dot 3^2 + 4 vec(a) dot vec(b) <=> 28 = 4 + 36 + 4 vec(a) dot vec(b) $
        $ <=> 4 vec(a) dot vec(b) = 28 - 40 = -12 <=> vec(a) dot vec(b) = -3 $
        Tính côsin của góc giữa hai vectơ:
        $ cos(vec(a), vec(b)) = (vec(a) dot vec(b)) / (|vec(a)| dot |vec(b)|) = (-3) / (2 dot 3) = -1/2 => (vec(a), vec(b)) = 120^circ $
    ]
)

// TN 5
#tn([Cho hình chữ nhật $A B C D$ có $A B = 4$ và $A D = 3$. Điểm $M$ nằm trên cạnh $C D$ sao cho đường thẳng $A M$ vuông góc với đường chéo $B D$ ($A M perp B D$). Độ dài đoạn thẳng $D M$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3.2, 0)
    let pC = (3.2, 2.4)
    let pD = (0, 2.4)
    let pM = (1.8, 2.4)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + luma(140))
    line(pA, pM, stroke: 1.5pt + rgb("0d9488"))
    line(pB, pD, stroke: 1.5pt + rgb("dc2626"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.4, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.4, 2.5), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, 2.5), text(size: 8pt)[$D$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((1.8, 2.65), text(fill: rgb("0d9488"), size: 8pt, weight: "bold")[$M$])
  })
]],
    (
        True([$2.25$]),
        [$2.5$],
        [$1.75$],
        [$3.0$]
    ),
    loigiai: [
        Đặt $D M = x$ với $0 < x <= 4$. Vì $vec(D C)$ cùng hướng với $vec(A B)$ nên $vec(D M) = x/4 vec(A B)$.
        Phân tích: $vec(A M) = vec(A D) + vec(D M) = vec(A D) + x/4 vec(A B)$.
        Vectơ đường chéo: $vec(B D) = vec(A D) - vec(A B)$.
        Vì $A M perp B D <=> vec(A M) dot vec(B D) = 0$:
        $ (vec(A D) + x/4 vec(A B)) dot (vec(A D) - vec(A B)) = 0 $
        $ <=> A D^2 - x/4 A B^2 = 0 <=> 3^2 - x/4 dot 4^2 = 0 <=> 9 - 4x = 0 <=> x = 9/4 = 2.25 $
    ]
)

// TN 6
#tn([Cho tam giác $A B C$ có độ dài ba cạnh lần lượt là $a, b, c$ và trọng tâm $G$. Biểu thức tổng bình phương khoảng cách $G A^2 + G B^2 + G C^2$ luôn bằng],
    (
        True([$(a^2 + b^2 + c^2) / 3$]),
        [$(a^2 + b^2 + c^2) / 4$],
        [$(a^2 + b^2 + c^2) / 2$],
        [$a^2 + b^2 + c^2$]
    ),
    loigiai: [
        Từ hệ thức vectơ trọng tâm $vec(G A) + vec(G B) + vec(G C) = vec(0)$, bình phương vô hướng hai vế:
        $ (vec(G A) + vec(G B) + vec(G C))^2 = 0 $
        $ <=> G A^2 + G B^2 + G C^2 + 2(vec(G A) dot vec(G B) + vec(G B) dot vec(G C) + vec(G C) dot vec(G A)) = 0 $
        Mặt khác, $A B^2 = (vec(G B) - vec(G A))^2 = G B^2 + G A^2 - 2 vec(G A) dot vec(G B)$.
        Cộng ba cạnh: $a^2 + b^2 + c^2 = 2(G A^2 + G B^2 + G C^2) - 2(vec(G A) dot vec(G B) + vec(G B) dot vec(G C) + vec(G C) dot vec(G A))$.
        Suy ra: $a^2 + b^2 + c^2 = 3(G A^2 + G B^2 + G C^2) => G A^2 + G B^2 + G C^2 = (a^2 + b^2 + c^2) / 3$.
    ]
)

// TN 7
#tn([Cho hai vectơ $vec(u)$ và $vec(v)$ thỏa mãn $|vec(u)| = 1, |vec(v)| = 2$ và góc $(vec(u), vec(v)) = 120^circ$. Giá trị của tham số thực $k$ để vectơ $vec(x) = vec(u) + k vec(v)$ vuông góc với vectơ $vec(y) = vec(u) - vec(v)$ là],
    (
        True([$k = 2/5$]),
        [$k = 1/2$],
        [$k = -2/5$],
        [$k = 3/4$]
    ),
    loigiai: [
        Ta có $vec(u) dot vec(v) = 1 dot 2 dot cos 120^circ = 2 dot (-1/2) = -1$.
        Điều kiện $vec(x) perp vec(y) <=> vec(x) dot vec(y) = 0$:
        $ (vec(u) + k vec(v)) dot (vec(u) - vec(v)) = 0 $
        $ <=> vec(u)^2 - vec(u) dot vec(v) + k vec(u) dot vec(v) - k vec(v)^2 = 0 $
        $ <=> 1^2 - (-1) + k(-1) - k dot 2^2 = 0 <=> 2 - 5k = 0 <=> k = 2/5 $
    ]
)

// TN 8
#tn([Cho tam giác đều $A B C$ có cạnh bằng $a$. Hai điểm $M, N$ thỏa mãn $vec(A M) = 1/3 vec(A B)$ và $vec(A N) = 1/3 vec(A C)$. Tích vô hướng $vec(C M) dot vec(B N)$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3.0, 0)
    let pM = (1.0, 1.73)
    let pN = (2.0, 1.73)
    line(pA, pB, pC, close: true, stroke: 1.2pt + luma(140))
    line(pC, pM, stroke: 1.5pt + rgb("0d9488"))
    line(pB, pN, stroke: 1.5pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.9), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8pt)[$C$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((0.8, 1.9), text(fill: rgb("0d9488"), size: 8pt)[$M$])
    circle(pN, radius: 2pt, fill: rgb("1e40af"))
    content((2.2, 1.9), text(fill: rgb("1e40af"), size: 8pt)[$N$])
  })
]],
    (
        True([$- 1/9 a^2$]),
        [$1/9 a^2$],
        [$- 2/9 a^2$],
        [$0$]
    ),
    loigiai: [
        Biểu diễn qua $vec(A B)$ và $vec(A C)$ với $vec(A B) dot vec(A C) = a^2 cos 60^circ = 1/2 a^2$:
        $ vec(C M) = vec(A M) - vec(A C) = 1/3 vec(A B) - vec(A C) $
        $ vec(B N) = vec(A N) - vec(A B) = 1/3 vec(A C) - vec(A B) $
        Nhân vô hướng:
        $ vec(C M) dot vec(B N) = (1/3 vec(A B) - vec(A C)) dot (1/3 vec(A C) - vec(A B)) $
        $ = 1/9 vec(A B) dot vec(A C) - 1/3 A B^2 - 1/3 A C^2 + vec(A B) dot vec(A C) = 10/9 (1/2 a^2) - 2/3 a^2 = 5/9 a^2 - 6/9 a^2 = - 1/9 a^2 $
    ]
)

// TN 9
#tn([Cho tam giác $A B C$ có $A B = 3, A C = 6$ và $hat(B A C) = 60^circ$. Gọi $A D$ là đường phân giác trong của góc $A$. Độ dài của đoạn thẳng $A D$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.6, 0)
    let pC = (2.6, 4.5)
    let pD = (2.6, 1.5)
    line(pA, pB, pC, close: true, stroke: 1.2pt + luma(140))
    line(pA, pD, stroke: 1.8pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.8, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.8, 4.6), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: rgb("1e40af"))
    content((2.9, 1.5), text(fill: rgb("1e40af"), size: 8pt, weight: "bold")[$D$])
    draw_angle_arc(pA, 0deg, 30deg, radius: 0.7, stroke: 1pt + rgb("dc2626"))
    draw_angle_arc(pA, 30deg, 60deg, radius: 0.8, stroke: 1pt + rgb("0d9488"))
  })
]],
    (
        True([$2 sqrt(3)$]),
        [$3 sqrt(3)$],
        [$4$],
        [$sqrt(15)$]
    ),
    loigiai: [
        Theo tính chất đường phân giác trong: $(D B) / (D C) = (A B) / (A C) = 3/6 = 1/2 => vec(D B) = - 1/2 vec(D C)$.
        Biểu diễn vectơ phân giác:
        $ vec(A D) = (A C dot vec(A B) + A B dot vec(A C)) / (A B + A C) = (6 vec(A B) + 3 vec(A C)) / 9 = 2/3 vec(A B) + 1/3 vec(A C) $
        Bình phương vô hướng:
        $ A D^2 = vec(A D)^2 = 4/9 A B^2 + 1/9 A C^2 + 4/9 vec(A B) dot vec(A C) $
        Với $vec(A B) dot vec(A C) = 3 dot 6 dot cos 60^circ = 9$:
        $ A D^2 = 4/9 dot 9 + 1/9 dot 36 + 4/9 dot 9 = 4 + 4 + 4 = 12 => A D = sqrt(12) = 2 sqrt(3) $
    ]
)

// TN 10
#tn([Một kiện hàng có khối lượng $m = 10" kg"$ bị kéo trượt đều lên một mặt dốc nghiêng dài $s = 10" m"$, dốc hợp với mặt phẳng ngang một góc $alpha = 30^circ$. Hệ số ma sát trượt giữa kiện hàng và dốc là $mu = 0.1$. Lấy gia tốc trọng trường $g = 10" m/s"^2$. Công của lực ma sát trượt tác dụng lên kiện hàng trong suốt chiều dài dốc bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Mặt dốc
    line((0, 0), (4.5, 2.6), stroke: 1.5pt + luma(120))
    line((0, 0), (4.5, 0), stroke: 1pt + luma(160))
    line((4.5, 0), (4.5, 2.6), stroke: (paint: luma(160), dash: "dashed"))
    draw_angle_arc((0, 0), 0deg, 30deg, radius: 0.9, stroke: 1pt + rgb("dc2626"))
    content((1.2, 0.3), text(fill: rgb("dc2626"), size: 8pt)[$30^circ$])
    // Kiện hàng
    let pBox = (2.2, 1.27)
    circle(pBox, radius: 3pt, fill: rgb("eff6ff"))
    content(pBox, [📦])
    // Lực ma sát ngược hướng dốc
    line(pBox, (1.2, 0.69), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((0.9, 0.5), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$vec(F)_(m s)$])
  })
]],
    (
        True([$-50 sqrt(3)" J"$]),
        [$50 sqrt(3)" J"$],
        [$-50" J"$],
        [$-100" J"$]
    ),
    loigiai: [
        Áp lực kiện hàng lên mặt dốc: $N = m g cos 30^circ = 10 dot 10 dot (sqrt(3))/2 = 50 sqrt(3)" N"$.
        Độ lớn lực ma sát trượt: $F_(m s) = mu N = 0.1 dot 50 sqrt(3) = 5 sqrt(3)" N"$.
        Vì lực ma sát ngược hướng với độ dịch chuyển ($180^circ$):
        $ A_(m s) = vec(F)_(m s) dot vec(s) = F_(m s) dot s dot cos 180^circ = 5 sqrt(3) dot 10 dot (-1) = -50 sqrt(3)" J" $
    ]
)

// TN 11
#tn([Cho tứ giác lồi $A B C D$. Điều kiện cần và đủ để hai đường chéo $A C$ và $B D$ vuông góc với nhau là],
    (
        True([$A B^2 + C D^2 = B C^2 + D A^2$]),
        [$A B^2 + B C^2 = C D^2 + D A^2$],
        [$A C^2 + B D^2 = A B^2 + C D^2$],
        [$A B dot C D = B C dot D A$]
    ),
    loigiai: [
        Ta có $vec(A C) dot vec(B D) = (vec(A D) + vec(D C)) dot (vec(B A) + vec(A D)) = 0$.
        Khai triển bình phương vô hướng các cạnh:
        $ 2 vec(A C) dot vec(B D) = (A B^2 + C D^2) - (B C^2 + D A^2) $
        Do đó $A C perp B D <=> vec(A C) dot vec(B D) = 0 <=> A B^2 + C D^2 = B C^2 + D A^2$.
    ]
)

// TN 12
#tn([Cho tam giác $A B C$ vuông tại $A$. Gọi $H$ là chân đường cao hạ từ $A$ xuống $B C$. Đẳng thức vectơ nào sau đây là đúng?],
    (
        True([$vec(A H) dot vec(B C) = 0$]),
        [$vec(A H) dot vec(A B) = 0$],
        [$vec(A B) dot vec(B C) = 0$],
        [$vec(A H) dot vec(A C) = A H^2$]
    ),
    loigiai: [
        Vì $A H$ là đường cao hạ xuống cạnh $B C$ nên $A H perp B C$.
        Hai vectơ vuông góc có tích vô hướng bằng $0$: $vec(A H) dot vec(B C) = 0$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Hệ thức hai trung tuyến vuông góc)
#ds([Cho tam giác $A B C$ có độ dài hai cạnh $A B = 6, A C = 8$. Hai đường trung tuyến $B M$ và $C N$ vuông góc với nhau tại trọng tâm $G$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.2, 2.8)
    let pB = (0, 0)
    let pC = (3.2, 0)
    let pM = (2.2, 1.4)
    let pN = (0.6, 1.4)
    let pG = (1.47, 0.93)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    line(pB, pM, stroke: 1.5pt + rgb("0d9488"))
    line(pC, pN, stroke: 1.5pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((1.2, 3.05), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.4, -0.2), text(size: 8pt)[$C$])
    circle(pG, radius: 2pt, fill: rgb("dc2626"))
    content((1.47, 0.6), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$G$])
    draw_angle_arc(pG, -40deg, 50deg, radius: 0.3, stroke: 1pt + rgb("dc2626"))
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ trung tuyến phân tích theo hai cạnh là $vec(B M) = 1/2 vec(A C) - vec(A B)$ và $vec(C N) = 1/2 vec(A B) - vec(A C)$.]),
    True([Điều kiện hai trung tuyến vuông góc tương đương với hệ thức cạnh: $b^2 + c^2 = 5 a^2$.]),
    True([Độ dài cạnh $B C$ của tam giác bằng $2 sqrt(5)$.]),
    [Tích vô hướng của hai vectơ cạnh kề $vec(A B) dot vec(A C)$ bằng đúng $25$.]
  ),
  loigiai: [
    #step([Phân tích vectơ trung tuyến])
    $vec(B M) = vec(A M) - vec(A B) = 1/2 vec(A C) - vec(A B)$.
    $vec(C N) = vec(A N) - vec(A C) = 1/2 vec(A B) - vec(A C)$. Mệnh đề a ĐÚNG.

    #step([Hệ thức cạnh tương đương])
    $vec(B M) perp vec(C N) <=> vec(B M) dot vec(C N) = 0 <=> 5 vec(A B) dot vec(A C) = 2(b^2 + c^2)$.
    Thay $2 vec(A B) dot vec(A C) = b^2 + c^2 - a^2$ vào ta rút gọn được $b^2 + c^2 = 5 a^2$. Mệnh đề b ĐÚNG.

    #step([Tính độ dài cạnh BC])
    $ 5 a^2 = b^2 + c^2 = 8^2 + 6^2 = 64 + 36 = 100 => a^2 = 20 => a = B C = sqrt(20) = 2 sqrt(5) $
    Mệnh đề c ĐÚNG.

    #step([Tính tích vô hướng AB và AC])
    $ vec(A B) dot vec(A C) = (b^2 + c^2 - a^2) / 2 = (100 - 20) / 2 = 80 / 2 = 40 != 25 $
    Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Phân tích vectơ trong hình thoi góc 60 độ)
#ds([Cho hình thoi $A B C D$ có cạnh bằng $a$ và góc $hat(B A D) = 60^circ$. Lấy điểm $M$ trên cạnh $B C$ sao cho $B M = 2/3 B C$ và điểm $N$ trên cạnh $C D$ sao cho $D N = 1/2 C D$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.2, 0)
    let pD = (1.1, 1.9)
    let pC = (3.3, 1.9)
    let pM = (2.93, 1.27)
    let pN = (0.55, 0.95)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("1e40af"))
    line(pA, pM, stroke: 1.5pt + rgb("0d9488"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.4, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.5, 1.9), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((0.9, 1.9), text(size: 8pt)[$D$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((3.1, 1.1), text(fill: rgb("0d9488"), size: 8pt)[$M$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tích vô hướng giữa hai vectơ cạnh xuất phát từ đỉnh $A$ là $vec(A B) dot vec(A D) = 1/2 a^2$.]),
    True([Vectơ $vec(A M)$ biểu diễn qua hai cạnh là $vec(A M) = vec(A B) + 2/3 vec(A D)$.]),
    True([Độ dài đoạn thẳng $A M$ bằng $(sqrt(19)) / 3 a$.]),
    [Tích vô hướng $vec(A M) dot vec(B D)$ bằng đúng $a^2$.]
  ),
  loigiai: [
    #step([Tích vô hướng cạnh kề])
    $vec(A B) dot vec(A D) = a dot a dot cos 60^circ = 1/2 a^2$. Mệnh đề a ĐÚNG.

    #step([Phân tích vectơ AM])
    Vì $vec(B C) = vec(A D)$ nên $vec(A M) = vec(A B) + 2/3 vec(B C) = vec(A B) + 2/3 vec(A D)$. Mệnh đề b ĐÚNG.

    #step([Tính độ dài AM])
    $ A M^2 = vec(A M)^2 = A B^2 + 4/9 A D^2 + 4/3 vec(A B) dot vec(A D) = a^2 + 4/9 a^2 + 4/3(1/2 a^2) = (1 + 4/9 + 2/3) a^2 = 19/9 a^2 $
    $ A M = (sqrt(19)) / 3 a $. Mệnh đề c ĐÚNG.

    #step([Tính tích vô hướng AM và BD])
    $vec(B D) = vec(A D) - vec(A B)$.
    $ vec(A M) dot vec(B D) = (vec(A B) + 2/3 vec(A D)) dot (vec(A D) - vec(A B)) = vec(A B) dot vec(A D) - A B^2 + 2/3 A D^2 - 2/3 vec(A B) dot vec(A D) $
    $ = 1/3 vec(A B) dot vec(A D) - 1/3 a^2 = 1/3 (1/2 a^2) - 1/3 a^2 = - 1/6 a^2 != a^2 $
    Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Cơ học - Kéo kiện hàng lên dốc nghiêng có ma sát)
#ds([Một khối hàng công nghiệp có khối lượng $m = 20" kg"$ được máy tời kéo trượt thẳng đều lên đỉnh một con dốc nghiêng có góc dốc $alpha = 30^circ$ so với phương ngang. Chiều dài mặt dốc là $s = 12" m"$. Lực kéo của dây cáp $vec(F)$ có phương song song với mặt dốc hướng lên. Hệ số ma sát trượt giữa khối hàng và mặt dốc là $mu = 0.2$. Lấy gia tốc trọng trường $g = 9.8" m/s"^2$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Mặt dốc
    line((0, 0), (5.0, 2.88), stroke: 1.5pt + luma(120))
    line((0, 0), (5.0, 0), stroke: 1pt + luma(160))
    line((5.0, 0), (5.0, 2.88), stroke: (paint: luma(160), dash: "dashed"))
    draw_angle_arc((0, 0), 0deg, 30deg, radius: 0.9, stroke: 1pt + rgb("dc2626"))
    content((1.2, 0.3), text(fill: rgb("dc2626"), size: 8pt)[$30^circ$])
    // Khối hàng
    let pBox = (2.5, 1.44)
    circle(pBox, radius: 3pt, fill: rgb("eff6ff"))
    content(pBox, [📦])
    // Lực kéo
    line(pBox, (3.8, 2.19), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((4.0, 2.3), text(fill: rgb("1e40af"), size: 8.5pt, weight: "bold")[$vec(F)$])
    // Lực ma sát
    line(pBox, (1.5, 0.86), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.5pt + rgb("dc2626"))
    content((1.3, 0.7), text(fill: rgb("dc2626"), size: 8pt)[$vec(F)_(m s)$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Công của trọng lực $vec(P)$ tác dụng lên khối hàng trong suốt quãng đường dốc là công cản và có giá trị $A_P = -1176" J"$.]),
    True([Độ lớn của phản lực pháp tuyến từ mặt dốc tác dụng lên khối hàng là $N = 98 sqrt(3)" N" approx 169.7" N"$.]),
    True([Công của lực ma sát trượt sinh ra trên quãng đường là $A_(m s) = -235.2 sqrt(3)" J" approx -407.4" J"$.]),
    [Công của lực kéo cáp $vec(F)$ bằng đúng $1176" J"$.]
  ),
  loigiai: [
    #step([Tính công của trọng lực P])
    Độ cao nâng lên: $h = s sin 30^circ = 12 dot 1/2 = 6" m"$.
    Vì vật đi lên ngược chiều trọng lực:
    $ A_P = - m g h = - 20 dot 9.8 dot 6 = -1176" J" $. Mệnh đề a ĐÚNG.

    #step([Tính áp lực N])
    $ N = m g cos 30^circ = 20 dot 9.8 dot (sqrt(3))/2 = 98 sqrt(3)" N" approx 169.7" N" $. Mệnh đề b ĐÚNG.

    #step([Tính công lực ma sát])
    Lực ma sát: $F_(m s) = mu N = 0.2 dot 98 sqrt(3) = 19.6 sqrt(3)" N"$.
    $ A_(m s) = - F_(m s) dot s = - 19.6 sqrt(3) dot 12 = -235.2 sqrt(3)" J" approx -407.4" J" $. Mệnh đề c ĐÚNG.

    #step([Tính công của lực kéo cáp])
    Vì khối hàng chuyển động thẳng đều, theo định lý động năng:
    $ A_F + A_P + A_(m s) + A_N = 0 <=> A_F = - (A_P + A_(m s)) = 1176 + 235.2 sqrt(3) approx 1583.4" J" != 1176" J" $
    (Do lực kéo còn phải thắng công cản của ma sát). Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Giàn khoan dầu khí ngoài khơi)
#ds([Một trụ giàn khoan dầu khí ngoài khơi được giữ thăng bằng trên mặt biển nhờ ba sợi dây cáp neo $vec(T)_1, vec(T)_2, vec(T)_3$ gắn vào đáy biển đối xứng tỏa tròn, cùng xuất phát từ tâm trụ $O$. Lực căng của ba dây cáp có độ lớn bằng nhau $T_1 = T_2 = T_3 = 60" kN"$. Góc giữa hai dây cáp bất kỳ đều bằng $120^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pT1 = (0, 2.2)
    let pT2 = (-1.9, -1.1)
    let pT3 = (1.9, -1.1)
    line(pO, pT1, mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content(pT1, [⚓ $vec(T)_1$], anchor: "south")
    line(pO, pT2, mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content(pT2, [⚓ $vec(T)_2$], anchor: "north-east")
    line(pO, pT3, mark: (end: ">", fill: rgb("d97706")), stroke: 2pt + rgb("d97706"))
    content(pT3, [⚓ $vec(T)_3$], anchor: "north-west")
    circle(pO, radius: 3pt, fill: rgb("dc2626"))
    content(pO, [🏗️ $O$], anchor: "south-west")
    draw_angle_arc(pO, 90deg, 210deg, radius: 0.5, stroke: 1pt + luma(120))
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tích vô hướng giữa hai lực căng cáp bất kỳ bằng $-1800" (kN)"^2$.]),
    True([Hợp lực của hai sợi cáp $vec(T)_1$ và $vec(T)_2$ có độ lớn đúng bằng $60" kN"$.]),
    True([Hợp lực của hai sợi cáp $vec(T)_1 + vec(T)_2$ có hướng ngược hoàn toàn với hướng của sợi cáp $vec(T)_3$.]),
    [Tổng hợp lực kéo của ba sợi dây cáp tác dụng lên trụ giàn khoan có độ lớn bằng $180" kN"$.]
  ),
  loigiai: [
    #step([Tích vô hướng giữa hai lực cáp])
    Vì góc giữa hai sợi cáp bất kỳ là $120^circ$:
    $ vec(T)_1 dot vec(T)_2 = T_1 dot T_2 dot cos 120^circ = 60 dot 60 dot (-1/2) = -1800" (kN)"^2 $. Mệnh đề a ĐÚNG.

    #step([Độ lớn hợp lực T1 + T2])
    $ |vec(T)_1 + vec(T)_2|^2 = T_1^2 + T_2^2 + 2 vec(T)_1 dot vec(T)_2 = 60^2 + 60^2 + 2 dot (-1800) = 3600 + 3600 - 3600 = 3600 $
    $ |vec(T)_1 + vec(T)_2| = sqrt(3600) = 60" kN" $. Mệnh đề b ĐÚNG.

    #step([Phương và chiều hợp lực])
    Theo quy tắc hình thoi có góc $120^circ$, đường chéo phân giác hợp lực $vec(T)_1 + vec(T)_2$ nằm trên tia đối của $vec(T)_3$. Mệnh đề c ĐÚNG.

    #step([Tổng hợp lực của cả ba cáp])
    Vì $vec(T)_1 + vec(T)_2 = - vec(T)_3$ nên $vec(T)_1 + vec(T)_2 + vec(T)_3 = vec(0)$.
    Hệ lực hoàn toàn triệt tiêu cân bằng, tổng hợp lực có độ lớn bằng $0" kN"$ chứ không phải $180" kN"$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho tam giác $A B C$ có độ dài ba cạnh $A B = 4, A C = 6$ và $B C = 2 sqrt(7)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3.0, 0)
    let pC = (1.5, 2.6)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((1.5, 2.9), text(size: 8pt)[$C$])
    draw_angle_arc(pA, 0deg, 60deg, radius: 0.5, stroke: 1pt + rgb("dc2626"))
  })
]
Tính số đo góc $hat(B A C)$ của tam giác $A B C$ theo đơn vị độ.],
    [60],
    loigiai: [
        #step([Sử dụng hệ quả định lý côsin])
        $ cos(hat(B A C)) = (A B^2 + A C^2 - B C^2) / (2 A B dot A C) $
        
        #step([Thay số tính góc])
        $ cos(hat(B A C)) = (4^2 + 6^2 - (2 sqrt(7))^2) / (2 dot 4 dot 6) = (16 + 36 - 28) / 48 = 24 / 48 = 1/2 $
        Suy ra $hat(B A C) = 60^circ$.
    ]
)

// TLN 2 (Câu 18)
#tln([Cho hình chữ nhật $A B C D$ có $A B = 6$ và $A D = 4$. Lấy điểm $M$ trên cạnh $C D$ sao cho $A M perp B D$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3.6, 0)
    let pC = (3.6, 2.4)
    let pD = (0, 2.4)
    let pM = (1.6, 2.4)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + luma(140))
    line(pA, pM, stroke: 1.5pt + rgb("0d9488"))
    line(pB, pD, stroke: 1.5pt + rgb("dc2626"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((3.8, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.8, 2.5), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: black)
    content((-0.2, 2.5), text(size: 8pt)[$D$])
    circle(pM, radius: 2pt, fill: rgb("0d9488"))
    content((1.6, 2.65), text(fill: rgb("0d9488"), size: 8pt, weight: "bold")[$M$])
  })
]
Tính độ dài đoạn thẳng $D M$ (làm tròn kết quả đến hai chữ số thập phân).],
    [2.67],
    loigiai: [
        #step([Phân tích theo hai vectơ vuông góc])
        Đặt $D M = x$. Ta có $vec(A M) = vec(A D) + x/6 vec(A B)$ và $vec(B D) = vec(A D) - vec(A B)$.
        
        #step([Điều kiện tích vô hướng bằng 0])
        $ vec(A M) dot vec(B D) = 0 <=> A D^2 - x/6 A B^2 = 0 <=> 4^2 - x/6 dot 36 = 0 $
        $ 16 - 6x = 0 <=> x = 16 / 6 = 8 / 3 approx 2.67 $
        Vậy $D M approx 2.67$.
    ]
)

// TLN 3 (Câu 19)
#tln([Cho hai vectơ $vec(a)$ và $vec(b)$ có độ dài lần lượt là $|vec(a)| = 3, |vec(b)| = 4$ và độ dài vectơ tổng $|vec(a) + vec(b)| = sqrt(37)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (2.2, 0), mark: (end: ">", fill: rgb("1e40af")), stroke: 1.8pt + rgb("1e40af"))
    content((2.4, -0.2), text(fill: rgb("1e40af"), size: 8pt)[$vec(a)$])
    line(pO, (1.5, 2.6), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.5, 2.85), text(fill: rgb("0d9488"), size: 8pt)[$vec(b)$])
    line(pO, (3.7, 2.6), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((3.9, 2.8), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(a) + vec(b)$])
  })
]
Tính giá trị của biểu thức tích vô hướng $P = (2 vec(a) - vec(b)) dot (vec(a) + 3 vec(b))$.],
    [0],
    loigiai: [
        #step([Tìm tích vô hướng giữa a và b])
        $ |vec(a) + vec(b)|^2 = a^2 + b^2 + 2 vec(a) dot vec(b) <=> 37 = 3^2 + 4^2 + 2 vec(a) dot vec(b) $
        $ 37 = 25 + 2 vec(a) dot vec(b) <=> 2 vec(a) dot vec(b) = 12 <=> vec(a) dot vec(b) = 6 $
        
        #step([Khai triển biểu thức P])
        $ P = (2 vec(a) - vec(b)) dot (vec(a) + 3 vec(b)) = 2 a^2 + 6 vec(a) dot vec(b) - vec(a) dot vec(b) - 3 b^2 $
        $ = 2 a^2 + 5 vec(a) dot vec(b) - 3 b^2 = 2 dot 9 + 5 dot 6 - 3 dot 16 = 18 + 30 - 48 = 0 $
        Vậy $P = 0$ (hai vectơ này vuông góc với nhau).
    ]
)

// TLN 4 (Câu 20)
#tln([Cho tam giác $A B C$ có $A B = 3, A C = 6$ và góc $hat(A) = 60^circ$. Gọi $A D$ là đường phân giác trong của góc $A$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.2, 0)
    let pC = (2.2, 3.8)
    let pD = (2.2, 1.27)
    line(pA, pB, pC, close: true, stroke: 1.2pt + luma(140))
    line(pA, pD, stroke: 1.8pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((2.4, -0.2), text(size: 8pt)[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((2.4, 4.0), text(size: 8pt)[$C$])
    circle(pD, radius: 2pt, fill: rgb("1e40af"))
    content((2.5, 1.3), text(fill: rgb("1e40af"), size: 8pt, weight: "bold")[$D$])
  })
]
Tính bình phương độ dài đường phân giác trong $A D^2$.],
    [12],
    loigiai: [
        #step([Biểu diễn vectơ phân giác AD])
        Theo tính chất đường phân giác: $(D B) / (D C) = 3 / 6 = 1/2$.
        $ vec(A D) = (6 vec(A B) + 3 vec(A C)) / 9 = 2/3 vec(A B) + 1/3 vec(A C) $
        
        #step([Tính bình phương độ dài AD2])
        $ A D^2 = 4/9 A B^2 + 1/9 A C^2 + 4/9 vec(A B) dot vec(A C) $
        Với $vec(A B) dot vec(A C) = 3 dot 6 dot cos 60^circ = 9$:
        $ A D^2 = 4/9 dot 9 + 1/9 dot 36 + 4/9 dot 9 = 4 + 4 + 4 = 12 $
        Vậy $A D^2 = 12$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Xe tải vượt dốc nghiêng)
#tln([Một xe tải chở vật liệu có lực kéo động cơ không đổi $F = 6000" N"$ cùng hướng chuyển động, leo thẳng đều lên một đoạn đường dốc có góc nghiêng $alpha = 15^circ$ so với phương ngang. Khi xe leo được một đoạn dốc dài $s = 200" m"$, công cơ học mà động cơ xe tải đã thực hiện bằng bao nhiêu kilôjun ($"kJ"$)?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (5.0, 1.34), stroke: 1.8pt + luma(120))
    line((0, 0), (5.0, 0), stroke: 1pt + luma(160))
    line((5.0, 0), (5.0, 1.34), stroke: (paint: luma(160), dash: "dashed"))
    draw_angle_arc((0, 0), 0deg, 15deg, radius: 1.2, stroke: 1pt + rgb("dc2626"))
    content((1.6, 0.2), text(fill: rgb("dc2626"), size: 8pt)[$15^circ$])
    let pTruck = (2.5, 0.67)
    circle(pTruck, radius: 3pt, fill: rgb("eff6ff"))
    content(pTruck, [🚚])
    line(pTruck, (3.8, 1.02), mark: (end: ">", fill: rgb("1e40af")), stroke: 2pt + rgb("1e40af"))
    content((4.0, 1.2), text(fill: rgb("1e40af"), size: 8.5pt, weight: "bold")[$vec(F)$])
  })
]],
    [1200],
    loigiai: [
        #step([Xác định góc giữa lực kéo và hướng dịch chuyển])
        Vì lực kéo của động cơ cùng phương cùng chiều với hướng chuyển động của xe trên mặt dốc nên góc giữa chúng bằng $0^circ$.
        
        #step([Tính công thực hiện])
        $ A = F dot s dot cos 0^circ = 6000 dot 200 dot 1 = 1200000" J" $
        Đổi ra kilôjun: $1200000" J" = 1200" kJ"$.
    ]
)

// TLN 6 (Câu 22 - Thực tế Cực trị công suất tàu lai dắt)
#tln([Một tàu lai dắt hỗ trợ đưa sà lan vào âu tàu với lực kéo cáp $F = 40" kN"$ nghiêng một góc $alpha = 60^circ$ so với hướng di chuyển thẳng của sà lan. Tốc độ di chuyển ổn định của sà lan là $v = 3" m/s"$. Công suất kéo cơ học tức thời mà tàu lai dắt truyền cho sà lan bằng bao nhiêu kilôoát ($"kW"$)?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.0, 0), stroke: (paint: rgb("0284c7"), dash: "dashed", thickness: 1.2pt))
    rect((0.5, -0.5), (2.3, 0.5), fill: rgb("eff6ff"), stroke: 1.5pt + rgb("0369a1"))
    content((1.4, 0), [🚢 Sà lan])
    line((2.3, 0), (4.0, 1.2), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((4.2, 1.4), text(fill: rgb("dc2626"), size: 9pt, weight: "bold")[$vec(F)$])
    line((1.4, 0.8), (2.6, 0.8), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    content((2.9, 0.8), text(fill: rgb("0d9488"), size: 8pt)[$vec(v)$])
    draw_angle_arc((2.3, 0), 0deg, 35deg, radius: 0.8, stroke: 1pt + rgb("d97706"))
    content((3.3, 0.3), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
  })
]],
    [60],
    loigiai: [
        #step([Công thức công suất cơ học theo tích vô hướng])
        $ P = vec(F) dot vec(v) = F dot v dot cos alpha $
        
        #step([Tính công suất])
        Với $F = 40" kN" = 40000" N"$, $v = 3" m/s"$, $alpha = 60^circ$:
        $ P = 40000 dot 3 dot cos 60^circ = 120000 dot 1/2 = 60000" W" = 60" kW" $
        Vậy công suất kéo tức thời là $60" kW"$.
    ]
)

] // end make-questions

#make-questions()
