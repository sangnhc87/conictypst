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
  exam-title: "BÀI 9: TÍCH CỦA MỘT VECTƠ VỚI MỘT SỐ (ĐỀ SỐ 3)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "109",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Điều kiện cần và đủ để ba điểm phân biệt $A, B, C$ thẳng hàng là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (1.8, 0)
    let pC = (3.6, 0)
    line((-0.5, 0), (4.2, 0), stroke: 0.6pt + luma(180))
    line(pA, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.9, 0.35), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(A B)$])
    line(pA, pC, mark: (end: ">", fill: rgb("d97706")), stroke: 1.8pt + rgb("d97706"))
    content((2.7, -0.35), text(fill: rgb("d97706"), size: 8.5pt)[$vec(A C) = k vec(A B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.1, -0.25), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((1.8, -0.25), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.6, -0.25), text(size: 8.5pt, weight: "bold")[$C$])
  })
]],
    (
        True([Tồn tại một số thực $k != 0$ sao cho $vec(A B) = k vec(A C)$.]),
        [Vectơ $vec(A B)$ bằng vectơ $vec(A C)$.],
        [Độ dài $|vec(A B)| = |vec(A C)|$.],
        [Tồn tại điểm $O$ sao cho $vec(O A) + vec(O B) = vec(O C)$.]
    ),
    loigiai: [
        Ba điểm phân biệt $A, B, C$ thẳng hàng khi và chỉ khi hai vectơ $vec(A B)$ và $vec(A C)$ cùng phương, tức là tồn tại một số thực $k != 0$ sao cho $vec(A B) = k vec(A C)$.
    ]
)

// TN 2
#tn([Cho ba điểm phân biệt $A, B, C$ thẳng hàng thỏa mãn đẳng thức vectơ $vec(C A) = 2 vec(C B)$. Khẳng định nào sau đây là đúng về vị trí tương đối giữa các điểm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pC = (0, 0)
    let pB = (1.8, 0)
    let pA = (3.6, 0)
    line(pC, pA, stroke: 0.8pt + luma(180))
    line(pC, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((0.9, 0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(C B)$])
    line(pC, (3.5, 0), mark: (end: ">", fill: rgb("d97706")), stroke: 1.2pt + rgb("d97706"))
    content((2.7, -0.35), text(fill: rgb("d97706"), size: 8pt)[$vec(C A) = 2 vec(C B)$])
    circle(pC, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pB, radius: 2pt, fill: black)
    content((1.8, -0.25), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pA, radius: 2pt, fill: black)
    content((3.8, 0), text(size: 8.5pt, weight: "bold")[$A$])
  })
]],
    (
        True([Điểm $B$ nằm giữa hai điểm $C$ và $A$.]),
        [Điểm $C$ nằm giữa hai điểm $A$ và $B$.],
        [Điểm $A$ nằm giữa hai điểm $B$ và $C$.],
        [Điểm $C$ là trung điểm của đoạn thẳng $A B$.]
    ),
    loigiai: [
        Vì hệ số $k = 2 > 0$ nên hai vectơ $vec(C A)$ và $vec(C B)$ cùng hướng, do đó $A$ và $B$ nằm cùng phía đối với điểm $C$. Lại có $C A = 2 C B > C B$, suy ra điểm $B$ nằm giữa hai điểm $C$ và $A$ (thậm chí $B$ là trung điểm của $C A$).
    ]
)

// TN 3
#tn([Cho đoạn thẳng $A B$. Điểm $I$ thỏa mãn hệ thức vectơ $vec(I A) + 2 vec(I B) = vec(0)$. Khẳng định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pI = (2.4, 0)
    let pB = (3.6, 0)
    line(pA, pB, stroke: 0.8pt + luma(180))
    line(pI, (0.1, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.2, 0.35), text(fill: rgb("dc2626"), size: 8pt)[$vec(I A)$])
    line(pI, (3.5, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((3.0, 0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(I B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pI, radius: 2pt, fill: black)
    content((2.4, -0.25), text(size: 8.5pt, weight: "bold")[$I$])
    circle(pB, radius: 2pt, fill: black)
    content((3.8, 0), text(size: 8.5pt, weight: "bold")[$B$])
  })
]],
    (
        True([Điểm $I$ nằm trên đoạn $A B$ và $I A = 2 I B$.]),
        [Điểm $I$ nằm trên đoạn $A B$ và $I B = 2 I A$.],
        [Điểm $I$ nằm ngoài đoạn thẳng $A B$.],
        [$vec(A I) = 1/2 vec(A B)$.]
    ),
    loigiai: [
        Từ $vec(I A) + 2 vec(I B) = vec(0) <=> vec(I A) = - 2 vec(I B)$.
        Do hệ số âm nên $vec(I A)$ và $vec(I B)$ ngược hướng, nghĩa là $I$ nằm giữa $A$ và $B$.
        Độ dài $I A = 2 I B$.
    ]
)

// TN 4
#tn([Cho tam giác $A B C$. Điểm $M$ thỏa mãn đẳng thức vectơ $vec(M A) + vec(M B) + vec(M C) = vec(0)$ khi và chỉ khi
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.5)
    let pB = (0, 0)
    let pC = (3.2, 0)
    let pM = (1.57, 0.83)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pM, pA, mark: (end: ">", fill: rgb("d97706")), stroke: 1.5pt + rgb("d97706"))
    line(pM, pB, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.5pt + rgb("0d9488"))
    line(pM, pC, mark: (end: ">", fill: rgb("1e40af")), stroke: 1.5pt + rgb("1e40af"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.75), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.4, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((1.9, 0.83), text(size: 8.5pt, weight: "bold")[$M$])
  })
]],
    (
        True([Điểm $M$ là trọng tâm của tam giác $A B C$.]),
        [Điểm $M$ là trực tâm của tam giác $A B C$.],
        [Điểm $M$ là tâm đường tròn ngoại tiếp tam giác $A B C$.],
        [Điểm $M$ là tâm đường tròn nội tiếp tam giác $A B C$.]
    ),
    loigiai: [
        Theo tính chất cơ bản của trọng tâm tam giác, điểm duy nhất thỏa mãn tổng ba vectơ từ điểm đó đến ba đỉnh bằng vectơ-không chính là trọng tâm của tam giác.
    ]
)

// TN 5
#tn([Cho hai vectơ không cùng phương $vec(a)$ và $vec(b)$. Tìm giá trị của số thực $m$ để hai vectơ $vec(u) = 2 vec(a) + 3 vec(b)$ và $vec(v) = m vec(a) - 6 vec(b)$ cùng phương với nhau.],
    (
        True([$m = - 4$]),
        [$m = 4$],
        [$m = - 9$],
        [$m = 9$]
    ),
    loigiai: [
        Hai vectơ $vec(u)$ và $vec(v)$ cùng phương khi và chỉ khi các hệ số tương ứng tỉ lệ:
        $ m / 2 = (- 6) / 3 <=> m / 2 = - 2 <=> m = - 4 $
    ]
)

// TN 6
#tn([Cho hình chữ nhật $A B C D$ có tâm $O$. Với điểm $M$ tùy ý trong mặt phẳng, đẳng thức vectơ nào sau đây luôn đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 1.8)
    let pB = (2.8, 1.8)
    let pC = (2.8, 0)
    let pD = (0, 0)
    let pO = (1.4, 0.9)
    let pM = (-0.8, 1.4)
    line(pA, pB, pC, pD, close: true, stroke: 0.8pt + luma(160))
    line(pA, pC, stroke: (paint: luma(180), dash: "dashed"))
    line(pB, pD, stroke: (paint: luma(180), dash: "dashed"))
    line(pM, pA, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.2pt + rgb("0d9488"))
    line(pM, pC, mark: (end: ">", fill: rgb("0d9488")), stroke: 1.2pt + rgb("0d9488"))
    circle(pO, radius: 2pt, fill: black)
    content((1.6, 0.9), text(size: 8pt, weight: "bold")[$O$])
    circle(pM, radius: 2pt, fill: black)
    content((-1.0, 1.4), text(size: 8.5pt, weight: "bold")[$M$])
  })
]],
    (
        True([$vec(M A) + vec(M C) = vec(M B) + vec(M D)$]),
        [$vec(M A) + vec(M B) = vec(M C) + vec(M D)$],
        [$vec(M A) + vec(M D) = vec(M B) + vec(M C)$],
        [$vec(M A) - vec(M C) = vec(M B) - vec(M D)$]
    ),
    loigiai: [
        Vì $O$ là trung điểm của cả hai đường chéo $A C$ và $B D$ nên theo tính chất trung điểm:
        $ vec(M A) + vec(M C) = 2 vec(M O) quad text("và") quad vec(M B) + vec(M D) = 2 vec(M O) $
        Do đó: $vec(M A) + vec(M C) = vec(M B) + vec(M D)$.
    ]
)

// TN 7
#tn([Cho đoạn thẳng $A B$. Tập hợp các điểm $M$ thỏa mãn đẳng thức $|vec(M A) + vec(M B)| = |vec(M A) - vec(M B)|$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (-1.5, 0)
    let pB = (1.5, 0)
    let pI = (0, 0)
    circle(pI, radius: 1.5, stroke: 1.2pt + rgb("d97706"))
    line(pA, pB, stroke: 0.8pt + luma(160))
    circle(pA, radius: 2pt, fill: black)
    content((-1.7, -0.2), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((1.7, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pI, radius: 2pt, fill: black)
    content((0, -0.25), text(size: 8pt, weight: "bold")[$I$])
    circle((0, 1.5), radius: 2pt, fill: rgb("d97706"))
    content((0, 1.75), text(fill: rgb("d97706"), size: 8.5pt, weight: "bold")[$M$])
  })
]],
    (
        True([Đường tròn có đường kính là đoạn thẳng $A B$.]),
        [Đường trung trực của đoạn thẳng $A B$.],
        [Đoạn thẳng $A B$.],
        [Một điểm duy nhất là trung điểm của $A B$.]
    ),
    loigiai: [
        Gọi $I$ là trung điểm của $A B$. Khi đó $vec(M A) + vec(M B) = 2 vec(M I)$.
        Lại có $vec(M A) - vec(M B) = vec(B A)$.
        Thay vào đẳng thức:
        $ |2 vec(M I)| = |vec(B A)| <=> 2 M I = A B <=> M I = (A B) / 2 $
        Vậy tập hợp các điểm $M$ là đường tròn tâm $I$ bán kính $R = (A B) / 2$, tức là đường tròn đường kính $A B$.
    ]
)

// TN 8
#tn([Cho đoạn thẳng $A B$ có độ dài bằng $6" cm"$. Gọi $I$ là điểm thỏa mãn $2 vec(I A) + vec(I B) = vec(0)$. Tập hợp các điểm $M$ thỏa mãn đẳng thức $|2 vec(M A) + vec(M B)| = 6$ là],
    (
        True([Đường tròn tâm $I$ bán kính $R = 2" cm"$.]),
        [Đường tròn tâm $I$ bán kính $R = 6" cm"$.],
        [Đường trung trực của đoạn thẳng $A B$.],
        [Đường thẳng song song với $A B$.]
    ),
    loigiai: [
        Chèn điểm $I$ vào biểu thức:
        $ 2 vec(M A) + vec(M B) = 2(vec(M I) + vec(I A)) + (vec(M I) + vec(I B)) = 3 vec(M I) + (2 vec(I A) + vec(I B)) = 3 vec(M I) $
        Do đó:
        $ |3 vec(M I)| = 6 <=> 3 M I = 6 <=> M I = 2" cm" $
        Vậy tập hợp các điểm $M$ là đường tròn tâm $I$ bán kính $R = 2" cm"$.
    ]
)

// TN 9
#tn([Cho tam giác đều $A B C$ có cạnh bằng $a$ và trọng tâm là $G$. Tập hợp các điểm $M$ thỏa mãn đẳng thức $|vec(M A) + vec(M B) + vec(M C)| = 3 a$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.4)
    let pB = (0, 0)
    let pC = (3, 0)
    let pG = (1.5, 0.8)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    circle(pG, radius: 1.4, stroke: 1.2pt + rgb("d97706"))
    circle(pG, radius: 2pt, fill: black)
    content((1.5, 0.55), text(size: 8pt, weight: "bold")[$G$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.65), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
  })
]],
    (
        True([Đường tròn tâm $G$ bán kính $R = a$.]),
        [Đường tròn tâm $G$ bán kính $R = 3 a$.],
        [Đường tròn tâm $A$ bán kính $R = a$.],
        [Đường thẳng đi qua trọng tâm $G$.]
    ),
    loigiai: [
        Vì $G$ là trọng tâm tam giác $A B C$ nên $vec(M A) + vec(M B) + vec(M C) = 3 vec(M G)$.
        Đẳng thức trở thành:
        $ |3 vec(M G)| = 3 a <=> 3 M G = 3 a <=> M G = a $
        Vậy tập hợp các điểm $M$ là đường tròn tâm $G$ bán kính $R = a$.
    ]
)

// TN 10
#tn([Cho hai điểm phân biệt $A, B$. Có bao nhiêu điểm $M$ thỏa mãn đẳng thức vectơ $vec(M A) + 3 vec(M B) = vec(0)$?],
    (
        True([Có duy nhất $1$ điểm $M$.]),
        [Có vô số điểm $M$.],
        [Không có điểm nào thỏa mãn.],
        [Có đúng $2$ điểm $M$.]
    ),
    loigiai: [
        Ta có $vec(M A) + 3 vec(M B) = vec(0) <=> vec(M A) + 3(vec(M A) + vec(A B)) = vec(0) <=> 4 vec(M A) = - 3 vec(A B) <=> vec(A M) = 3/4 vec(A B)$.
        Vì $A, B$ cố định nên vectơ $3/4 vec(A B)$ hoàn toàn xác định, do đó tồn tại duy nhất một điểm $M$ thỏa mãn.
    ]
)

// TN 11
#tn([Cho tam giác $A B C$. Gọi $M, N$ lần lượt là các điểm thỏa mãn $vec(A M) = 1/3 vec(A B)$ và $vec(A N) = 1/3 vec(A C)$. Khẳng định nào sau đây là đúng về hai đường thẳng $M N$ và $B C$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.5)
    let pB = (0, 0)
    let pC = (3.2, 0)
    let pM = (1.0, 1.67)
    let pN = (2.07, 1.67)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pM, pN, stroke: 1.5pt + rgb("d97706"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.75), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.4, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((0.75, 1.7), text(size: 8.5pt, weight: "bold")[$M$])
    circle(pN, radius: 2pt, fill: black)
    content((2.3, 1.7), text(size: 8.5pt, weight: "bold")[$N$])
  })
]],
    (
        True([Đường thẳng $M N$ song song với đường thẳng $B C$.]),
        [Đường thẳng $M N$ cắt đường thẳng $B C$.],
        [Đường thẳng $M N$ trùng với đường thẳng $B C$.],
        [Đường thẳng $M N$ vuông góc với đường thẳng $B C$.]
    ),
    loigiai: [
        Ta có:
        $ vec(M N) = vec(A N) - vec(A M) = 1/3 vec(A C) - 1/3 vec(A B) = 1/3 (vec(A C) - vec(A B)) = 1/3 vec(B C) $
        Do $vec(M N) = 1/3 vec(B C)$ nên hai vectơ cùng phương và điểm $M$ không thuộc đường thẳng $B C$, suy ra $M N parallel B C$.
    ]
)

// TN 12
#tn([Cho ba vectơ tùy ý $vec(a), vec(b), vec(c)$ thỏa mãn $2 vec(a) - 3 vec(b) + vec(c) = vec(0)$. Khẳng định nào sau đây là đúng?],
    (
        True([Vectơ $vec(c)$ có thể biểu diễn theo hai vectơ $vec(a)$ và $vec(b)$ là $vec(c) = - 2 vec(a) + 3 vec(b)$.]),
        [Ba vectơ này đôi một vuông góc nhau.],
        [Cả ba vectơ đều phải bằng vectơ-không.],
        [$vec(c) = 2 vec(a) + 3 vec(b)$.]
    ),
    loigiai: [
        Chuyển vế ta có:
        $ 2 vec(a) - 3 vec(b) + vec(c) = vec(0) <=> vec(c) = - 2 vec(a) + 3 vec(b) $
        Do đó vectơ $vec(c)$ luôn biểu diễn tuyến tính được qua $vec(a)$ và $vec(b)$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Ba điểm thẳng hàng và tham số)
#ds([Cho tam giác $A B C$. Lấy điểm $M$ trên cạnh $A B$ sao cho $A M = 1/3 A B$, lấy điểm $N$ trên cạnh $A C$ sao cho $A N = 1/2 A C$. Lấy điểm $K$ trên cạnh $B C$ sao cho $B K = x B C$ ($x in bb(R)$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3.6, 0)
    let pM = (1.0, 1.73)
    let pN = (2.55, 1.3)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pM, pN, stroke: 1.2pt + rgb("d97706"))
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.85), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.8, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((0.7, 1.8), text(size: 8.5pt, weight: "bold")[$M$])
    circle(pN, radius: 2pt, fill: black)
    content((2.8, 1.4), text(size: 8.5pt, weight: "bold")[$N$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ $vec(M N)$ biểu diễn theo hai vectơ cạnh $vec(A B)$ và $vec(A C)$ là $vec(M N) = - 1/3 vec(A B) + 1/2 vec(A C)$.]),
    True([Vectơ $vec(A K)$ biểu diễn theo $x$ là $vec(A K) = (1 - x)vec(A B) + x vec(A C)$.]),
    True([Vectơ $vec(M K)$ biểu diễn theo $x$ là $vec(M K) = (2/3 - x)vec(A B) + x vec(A C)$.]),
    [Ba điểm $M, N, K$ thẳng hàng khi và chỉ khi $x = 1/2$.]
  ),
  loigiai: [
    #step([Phân tích vectơ MN])
    Ta có $vec(M N) = vec(A N) - vec(A M) = 1/2 vec(A C) - 1/3 vec(A B) = - 1/3 vec(A B) + 1/2 vec(A C)$. Mệnh đề a ĐÚNG.

    #step([Phân tích vectơ AK])
    Theo quy tắc chèn điểm trên đoạn thẳng:
    $ vec(A K) = vec(A B) + vec(B K) = vec(A B) + x vec(B C) = vec(A B) + x(vec(A C) - vec(A B)) = (1 - x)vec(A B) + x vec(A C) $
    Mệnh đề b ĐÚNG.

    #step([Phân tích vectơ MK])
    $ vec(M K) = vec(A K) - vec(A M) = [(1 - x)vec(A B) + x vec(A C)] - 1/3 vec(A B) = (2/3 - x)vec(A B) + x vec(A C) $
    Mệnh đề c ĐÚNG.

    #step([Tìm điều kiện để ba điểm M, N, K thẳng hàng])
    Ba điểm $M, N, K$ thẳng hàng khi và chỉ khi hai vectơ $vec(M K)$ và $vec(M N)$ cùng phương:
    $ (2/3 - x) / (- 1/3) = x / (1/2) <=> 1/2 (2/3 - x) = - 1/3 x <=> 1/3 - 1/2 x = - 1/3 x $
    $ <=> 1/2 x - 1/3 x = 1/3 <=> 1/6 x = 1/3 <=> x = 2 $
    Giá trị đúng là $x = 2$ chứ không phải $x = 1/2$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14 - Quỹ tích điểm và Tâm tỉ cự)
#ds([Cho tam giác $A B C$ có trọng tâm là $G$. Xét tập hợp các điểm $M$ trong mặt phẳng thỏa mãn đẳng thức vectơ: $|vec(M A) + vec(M B) + vec(M C)| = |vec(M A) + 2 vec(M B) - 3 vec(M C)|$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.5)
    let pB = (0, 0)
    let pC = (3.2, 0)
    let pG = (1.57, 0.83)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    circle(pG, radius: 1.5, stroke: 1.2pt + rgb("d97706"))
    circle(pG, radius: 2pt, fill: black)
    content((1.57, 0.6), text(size: 8pt, weight: "bold")[$G$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.75), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.4, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vế trái của đẳng thức luôn rút gọn được thành $|vec(M A) + vec(M B) + vec(M C)| = 3 M G$.]),
    True([Vectơ vế phải $vec(v) = vec(M A) + 2 vec(M B) - 3 vec(M C)$ là một vectơ không đổi, độc lập với điểm $M$.]),
    True([Vectơ vế phải được biểu diễn theo các cạnh là $vec(v) = vec(C A) + 2 vec(C B)$.]),
    [Tập hợp các điểm $M$ thỏa mãn đẳng thức trên là một đường thẳng song song với $A B$.]
  ),
  loigiai: [
    #step([Rút gọn vế trái qua trọng tâm G])
    Vì $G$ là trọng tâm tam giác $A B C$ nên $vec(M A) + vec(M B) + vec(M C) = 3 vec(M G)$.
    Do đó vế trái bằng $|3 vec(M G)| = 3 M G$. Mệnh đề a ĐÚNG.

    #step([Rút gọn vế phải])
    Biến đổi vế phải bằng cách chèn điểm $C$:
    $ vec(v) = (vec(M A) - vec(M C)) + 2(vec(M B) - vec(M C)) = vec(C A) + 2 vec(C B) $
    Vì $A, B, C$ cố định nên vectơ $vec(v) = vec(C A) + 2 vec(C B)$ là vectơ cố định, không phụ thuộc vào vị trí điểm $M$. Mệnh đề b và c ĐÚNG.

    #step([Xác định tập hợp điểm M])
    Đẳng thức trở thành:
    $ 3 M G = |vec(C A) + 2 vec(C B)| <=> M G = 1/3 |vec(C A) + 2 vec(C B)| = "const" $
    Vì $G$ cố định và khoảng cách từ $M$ đến $G$ là một hằng số dương không đổi, nên tập hợp điểm $M$ là một đường tròn tâm $G$ chứ không phải đường thẳng. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15 - Thực tế Ba trạm radar không lưu bờ biển)
#ds([Ba trạm thu phát sóng radar kiểm soát không lưu ven biển đặt tại ba vị trí $A, B, C$ nằm thẳng hàng theo thứ tự đó dọc bờ biển phẳng. Khoảng cách đo được giữa các trạm là $A B = 30" km"$ và $B C = 60" km"$. Một máy bay trực thăng cứu hộ tại vị trí $M$ thu nhận đồng thời tín hiệu điều hướng từ cả ba trạm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (1.8, 0)
    let pC = (5.4, 0)
    
    // Bờ biển
    line((-0.5, 0), (6.0, 0), stroke: 2pt + rgb("0284c7"))
    content((5.8, -0.4), text(fill: rgb("0284c7"), size: 8pt)[Bờ biển])
    
    // Trạm A, B, C
    circle(pA, radius: 3pt, fill: rgb("1e40af"))
    content((0, 0.4), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[📡 Trạm $A$])
    circle(pB, radius: 3pt, fill: rgb("1e40af"))
    content((1.8, 0.4), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[📡 Trạm $B$])
    circle(pC, radius: 3pt, fill: rgb("1e40af"))
    content((5.4, 0.4), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[📡 Trạm $C$])
    
    // Trực thăng M
    let pM = (2.4, 1.8)
    content(pM, [🚁 $M$])
    line(pM, pA, stroke: (paint: luma(180), dash: "dashed"))
    line(pM, pB, stroke: (paint: luma(180), dash: "dashed"))
    line(pM, pC, stroke: (paint: luma(180), dash: "dashed"))
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ $vec(A B)$ và $vec(B C)$ là hai vectơ cùng phương và thỏa mãn $vec(B C) = 2 vec(A B)$.]),
    True([Vị trí của trạm $B$ thỏa mãn hệ thức vectơ tâm tỉ cự với hai trạm còn lại là $2 vec(B A) + vec(B C) = vec(0)$.]),
    True([Vectơ khoảng cách $vec(A C)$ liên hệ với $vec(A B)$ qua biểu thức $vec(A C) = 3 vec(A B)$.]),
    [Nếu trạm $B$ nằm chính giữa hai trạm $A$ và $C$ thì hệ thức liên hệ là $vec(B A) + 2 vec(B C) = vec(0)$.]
  ),
  loigiai: [
    #step([Mối liên hệ giữa các đoạn trên đường thẳng])
    Ba trạm $A, B, C$ thẳng hàng theo thứ tự nên hướng từ $A$ sang $B$ cùng hướng từ $B$ sang $C$.
    Tỉ số độ dài: $(B C) / (A B) = 60 / 30 = 2 => vec(B C) = 2 vec(A B)$. Mệnh đề a ĐÚNG.

    #step([Hệ thức tâm tỉ cự đối với điểm B])
    Vì $B$ nằm giữa $A$ và $C$ nên hai vectơ $vec(B A)$ và $vec(B C)$ ngược hướng nhau:
    $ B C = 2 B A <=> vec(B C) = - 2 vec(B A) <=> 2 vec(B A) + vec(B C) = vec(0) $
    Mệnh đề b ĐÚNG.

    #step([Biểu diễn AC theo AB])
    Ta có $A C = A B + B C = 30 + 60 = 90" km"$.
    Vì $vec(A C)$ và $vec(A B)$ cùng hướng nên $vec(A C) = 90/30 vec(A B) = 3 vec(A B)$. Mệnh đề c ĐÚNG.

    #step([Xét khi B là trung điểm])
    Nếu $B$ nằm chính giữa $A$ và $C$ thì $B A = B C$ và hai vectơ đối nhau, khi đó hệ thức đúng phải là $vec(B A) + vec(B C) = vec(0)$ chứ không có hệ số $2$. Mệnh đề d SAI.
  ]
)

// DS 4 (Câu 16 - Thực tế Tối ưu phụ tải lưới điện hải đảo)
#ds([Để cấp điện cho một cụm ba hòn đảo sinh thái $A, B, C$ tạo thành một tam giác đều có độ dài cạnh bằng $a = 6" km"$, ban quản lý năng lượng quy hoạch đặt một trạm biến áp phân phối trung tâm $M$ trên một tuyến đường dây cáp ngầm $d$. Chi phí xây lắp và tổn hao truyền tải điện tỉ lệ thuận với đại lượng tổng hợp $f(M) = |vec(M A) + vec(M B) + vec(M C)|$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.6)
    let pB = (0, 0)
    let pC = (3, 0)
    let pG = (1.5, 0.87)
    
    // Tam giác đảo
    line(pA, pB, pC, close: true, stroke: 1pt + rgb("0d9488"))
    content(pA, [🏝️ $A$], anchor: "south")
    content(pB, [🏝️ $B$], anchor: "north-east")
    content(pC, [🏝️ $C$], anchor: "north-west")
    
    // Đường cáp ngầm d
    line((-1.0, 0.87), (4.5, 0.87), stroke: (paint: rgb("d97706"), thickness: 1.5pt))
    content((4.2, 1.15), text(fill: rgb("d97706"), weight: "bold", size: 8.5pt)[Tuyến cáp $d$])
    
    // Trọng tâm G
    circle(pG, radius: 2.5pt, fill: black)
    content((1.5, 0.6), text(size: 8.5pt, weight: "bold")[$G$ (Tâm tải)])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Biểu thức hàm mục tiêu luôn thỏa mãn $f(M) = 3 M G$, trong đó $G$ là trọng tâm của tam giác $A B C$.]),
    True([Để chi phí và tổn thất điện năng nhỏ nhất thì khoảng cách $M G$ giữa trạm biến áp $M$ và trọng tâm $G$ phải nhỏ nhất.]),
    True([Nếu tuyến cáp ngầm $d$ đi qua trọng tâm $G$ thì vị trí đặt trạm $M$ tối ưu nhất là trùng đúng vào trọng tâm $G$.]),
    [Nếu tuyến cáp ngầm $d$ không đi qua $G$ thì giá trị nhỏ nhất của $f(M)$ bằng $0$.]
  ),
  loigiai: [
    #step([Rút gọn biểu thức tổng qua trọng tâm tam giác])
    Với $G$ là trọng tâm của tam giác $A B C$, ta luôn có $vec(M A) + vec(M B) + vec(M C) = 3 vec(M G)$.
    Do đó $f(M) = |3 vec(M G)| = 3 M G$. Mệnh đề a ĐÚNG.

    #step([Điều kiện cực tiểu hóa])
    $f(M) = 3 M G$ đạt giá trị nhỏ nhất khi và chỉ khi khoảng cách hình học $M G$ từ điểm $M$ trên đường thẳng $d$ đến điểm cố định $G$ đạt giá trị nhỏ nhất. Mệnh đề b ĐÚNG.

    #step([Xét trường hợp đường cáp d đi qua G])
    Nếu đường thẳng $d$ đi qua $G$, ta có thể chọn $M equiv G$, khi đó $M G = 0$ và $f(M) = 0$ (tối ưu tuyệt đối). Mệnh đề c ĐÚNG.

    #step([Xét trường hợp d không đi qua G])
    Khi đường thẳng $d$ không đi qua $G$, điểm $M$ gần $G$ nhất là hình chiếu vuông góc $H$ của $G$ lên $d$. Khi đó khoảng cách nhỏ nhất là $d(G, d) > 0$, do đó $f(M) = 3 d(G, d) > 0$ chứ không thể bằng $0$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho tam giác $A B C$. Lấy điểm $M$ trên cạnh $B C$ sao cho $vec(M B) = - 2 vec(M C)$, lấy điểm $N$ trên cạnh $A C$ sao cho $vec(N A) = - 3 vec(N C)$. Đường thẳng $M N$ cắt đường thẳng $A B$ kéo dài tại điểm $P$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 3)
    let pB = (0, 0)
    let pC = (3, 0)
    let pM = (2, 0)
    let pN = (0.75, 2.25)
    let pP = (0, 4.5)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    line(pA, pP, stroke: (paint: luma(160), dash: "dashed"))
    line(pM, pP, stroke: 1.2pt + rgb("d97706"))
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 3), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
    circle(pM, radius: 2pt, fill: black)
    content((2.0, -0.25), text(size: 8.5pt, weight: "bold")[$M$])
    circle(pN, radius: 2pt, fill: black)
    content((1.0, 2.3), text(size: 8.5pt, weight: "bold")[$N$])
    circle(pP, radius: 2pt, fill: black)
    content((-0.2, 4.5), text(size: 8.5pt, weight: "bold")[$P$])
  })
]
Tính tỉ số độ dài $(P A) / (P B)$.],
    [1.5],
    loigiai: [
        #step([Áp dụng định lý Mê-nê-la-uýt])
        Xét tam giác $A B C$ với cát tuyến $P - N - M$ cắt các đường thẳng chứa ba cạnh $A B, B C, C A$:
        $ (P A) / (P B) dot (M B) / (M C) dot (N C) / (N A) = 1 $
        
        #step([Thay các tỉ số từ giả thiết])
        Từ $vec(M B) = - 2 vec(M C) => (M B) / (M C) = 2$.
        Từ $vec(N A) = - 3 vec(N C) => (N C) / (N A) = 1/3$.
        
        #step([Tính tỉ số PA / PB])
        Thay vào công thức Mê-nê-la-uýt:
        $ (P A) / (P B) dot 2 dot 1/3 = 1 <=> (P A) / (P B) dot 2/3 = 1 <=> (P A) / (P B) = 3/2 = 1.5 $
    ]
)

// TLN 2 (Câu 18)
#tln([Cho tam giác $A B C$ có độ dài ba cạnh lần lượt là $a = B C = 7" cm"$, $b = C A = 8" cm"$, $c = A B = 6" cm"$. Gọi $I$ là tâm đường tròn nội tiếp của tam giác $A B C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.5)
    let pB = (0, 0)
    let pC = (3.5, 0)
    let pI = (1.5, 0.9)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    circle(pI, radius: 0.9, stroke: 1pt + rgb("d97706"))
    circle(pI, radius: 2pt, fill: black)
    content((1.5, 0.65), text(size: 8pt, weight: "bold")[$I$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.75), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.7, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
  })
]
Biết rằng điểm $I$ thỏa mãn hệ thức vectơ tâm tỉ cự: $a vec(I A) + b vec(I B) + c vec(I C) = vec(0)$. Tính giá trị của biểu thức chu vi $P = a + b + c$ theo đơn vị centimét.],
    [21],
    loigiai: [
        #step([Ý nghĩa hệ thức tâm tỉ cự của tâm nội tiếp])
        Tâm đường tròn nội tiếp $I$ của tam giác $A B C$ luôn thỏa mãn hệ thức vectơ trọng số tỉ lệ với ba cạnh đối diện:
        $ a vec(I A) + b vec(I B) + c vec(I C) = vec(0) $
        với $a = B C, b = C A, c = A B$.
        
        #step([Tính chu vi tam giác])
        Chu vi của tam giác:
        $ P = a + b + c = 7 + 8 + 6 = 21" cm" $
    ]
)

// TLN 3 (Câu 19)
#tln([Cho đoạn thẳng $A B$ có độ dài bằng $10" cm"$. Gọi $I$ là điểm thỏa mãn hệ thức vectơ $vec(I A) + 4 vec(I B) = vec(0)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pI = (3.2, 0)
    let pB = (4.0, 0)
    line(pA, pB, stroke: 0.8pt + luma(180))
    line(pI, (0.1, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    content((1.6, 0.35), text(fill: rgb("dc2626"), size: 8pt)[$vec(I A)$])
    line(pI, (3.9, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((3.6, 0.35), text(fill: rgb("0d9488"), size: 8pt)[$vec(I B)$])
    circle(pA, radius: 2pt, fill: black)
    content((-0.2, 0), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pI, radius: 2pt, fill: black)
    content((3.2, -0.25), text(size: 8.5pt, weight: "bold")[$I$])
    circle(pB, radius: 2pt, fill: black)
    content((4.2, 0), text(size: 8.5pt, weight: "bold")[$B$])
  })
]
Tính khoảng cách từ điểm $A$ đến điểm $I$ (độ dài đoạn thẳng $A I$) theo đơn vị centimét.],
    [8],
    loigiai: [
        #step([Chuyển đẳng thức vectơ sang độ dài])
        $ vec(I A) + 4 vec(I B) = vec(0) <=> vec(I A) = - 4 vec(I B) => I A = 4 I B $
        
        #step([Tính khoảng cách AI])
        Vì $vec(I A)$ và $vec(I B)$ ngược hướng nên điểm $I$ nằm giữa $A$ và $B$:
        $ A B = I A + I B = 4 I B + I B = 5 I B = 10" cm" $
        Suy ra $I B = 10 / 5 = 2" cm"$.
        Vậy $A I = 4 I B = 4 dot 2 = 8" cm"$.
    ]
)

// TLN 4 (Câu 20)
#tln([Cho tam giác đều $A B C$ có độ dài cạnh bằng $6" cm"$ và có trọng tâm là $G$. Gọi $M$ là một điểm di động trong mặt phẳng thỏa mãn đẳng thức $|vec(M A) + vec(M B) + vec(M C)| = 18" cm"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (1.5, 2.5)
    let pB = (0, 0)
    let pC = (3, 0)
    let pG = (1.5, 0.83)
    line(pA, pB, pC, close: true, stroke: 0.8pt + luma(160))
    circle(pG, radius: 1.6, stroke: 1.2pt + rgb("d97706"))
    circle(pG, radius: 2pt, fill: black)
    content((1.5, 0.6), text(size: 8pt, weight: "bold")[$G$])
    circle(pA, radius: 2pt, fill: black)
    content((1.5, 2.75), text(size: 8.5pt, weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((-0.2, -0.2), text(size: 8.5pt, weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((3.2, -0.2), text(size: 8.5pt, weight: "bold")[$C$])
  })
]
Điểm $M$ luôn di động trên một đường tròn cố định. Tính bán kính $R$ của đường tròn quỹ tích đó theo đơn vị centimét.],
    [6],
    loigiai: [
        #step([Thu gọn vế trái qua trọng tâm G])
        Vì $G$ là trọng tâm của tam giác $A B C$ nên $vec(M A) + vec(M B) + vec(M C) = 3 vec(M G)$.
        
        #step([Xác định bán kính đường tròn])
        Đẳng thức độ dài trở thành:
        $ |3 vec(M G)| = 18 <=> 3 M G = 18 <=> M G = 6" cm" $
        Do đó điểm $M$ luôn cách trọng tâm $G$ cố định một khoảng bằng $6" cm"$.
        Vậy quỹ tích điểm $M$ là đường tròn tâm $G$ bán kính $R = 6" cm"$.
    ]
)

// TLN 5 (Câu 21 - Thực tế Tuyến cáp quang biển)
#tln([Ba trạm thu phát cáp quang ngầm xuyên biển $A, B, C$ nằm thẳng hàng theo thứ tự đó trên hải trình. Khoảng cách giữa trạm $A$ và trạm $B$ là $40" km"$, khoảng cách giữa trạm $B$ và trạm $C$ là $60" km"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (2.0, 0)
    let pC = (5.0, 0)
    
    // Tuyến cáp ngầm
    line((-0.5, 0), (5.5, 0), stroke: 2pt + rgb("0284c7"))
    line((-0.5, 0), (5.5, 0), stroke: (paint: white, dash: "dashed", thickness: 0.8pt))
    content((5.2, -0.35), text(fill: rgb("0284c7"), size: 8pt)[Cáp ngầm 🌊])
    
    // Các trạm A, B, C
    circle(pA, radius: 3pt, fill: rgb("1e40af"))
    content((0, 0.45), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[🌐 Trạm $A$])
    circle(pB, radius: 3pt, fill: rgb("1e40af"))
    content((2.0, 0.45), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[🌐 Trạm $B$])
    circle(pC, radius: 3pt, fill: rgb("1e40af"))
    content((5.0, 0.45), text(fill: rgb("1e40af"), weight: "bold", size: 8.5pt)[🌐 Trạm $C$])
  })
]
Vectơ vị trí $vec(A C)$ liên hệ với vectơ $vec(A B)$ theo hệ thức $vec(A C) = k vec(A B)$. Tìm giá trị của số thực $k$.],
    [2.5],
    loigiai: [
        #step([Tính độ dài đoạn thẳng AC])
        Vì $B$ nằm giữa $A$ và $C$ trên cùng một đường thẳng nên:
        $ A C = A B + B C = 40 + 60 = 100" km" $
        
        #step([Xác định hệ số k])
        Hai vectơ $vec(A C)$ và $vec(A B)$ cùng hướng, do đó:
        $ k = (A C) / (A B) = 100 / 40 = 2.5 $
        Vậy $vec(A C) = 2.5 vec(A B)$.
    ]
)

// TLN 6 (Câu 22 - Thực tế Mạng vệ tinh LEO)
#tln([Ba vệ tinh viễn thông quỹ đạo thấp $S_1, S_2, S_3$ thuộc cùng một chùm vệ tinh Internet bay theo đội hình tạo thành một tam giác có trọng tâm là $G$. Trạm điều khiển mặt đất ghi nhận tọa độ của một vệ tinh viễn thám phụ trợ $M$ đang duy trì vị trí cân bằng tín hiệu sao cho vectơ tổng hợp $2 vec(M S_1) + 2 vec(M S_2) + 2 vec(M S_3)$ có độ lớn bằng $300" km"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pS1 = (1.5, 2.5)
    let pS2 = (0, 0)
    let pS3 = (3.2, 0)
    let pG = (1.57, 0.83)
    let pM = (3.8, 1.8)
    
    // Tam giác vệ tinh
    line(pS1, pS2, pS3, close: true, stroke: (paint: luma(160), dash: "dashed"))
    content(pS1, [🛰️ $S_1$], anchor: "south")
    content(pS2, [🛰️ $S_2$], anchor: "north-east")
    content(pS3, [🛰️ $S_3$], anchor: "north-west")
    
    // Trọng tâm G
    circle(pG, radius: 2.5pt, fill: black)
    content((1.57, 0.55), text(size: 8pt, weight: "bold")[$G$])
    
    // Vệ tinh M
    content(pM, [🛰️ $M$], anchor: "south-west")
    line(pM, pG, stroke: 1.5pt + rgb("d97706"))
  })
]
Tính khoảng cách từ vệ tinh phụ trợ $M$ đến trọng tâm đội hình $G$ (độ dài đoạn thẳng $M G$) theo đơn vị kilômét.],
    [50],
    loigiai: [
        #step([Thu gọn biểu thức vectơ qua trọng tâm G])
        Đặt thừa số chung $2$:
        $ 2 vec(M S_1) + 2 vec(M S_2) + 2 vec(M S_3) = 2(vec(M S_1) + vec(M S_2) + vec(M S_3)) $
        Vì $G$ là trọng tâm của tam giác $S_1 S_2 S_3$ nên $vec(M S_1) + vec(M S_2) + vec(M S_3) = 3 vec(M G)$.
        Do đó:
        $ 2(3 vec(M G)) = 6 vec(M G) $
        
        #step([Tính khoảng cách MG])
        Theo giả thiết, độ lớn của vectơ tổng hợp bằng $300" km"$:
        $ |6 vec(M G)| = 300 <=> 6 M G = 300 <=> M G = 300 / 6 = 50" km" $
        Vậy khoảng cách từ vệ tinh $M$ đến trọng tâm $G$ là $50" km"$.
    ]
)

] // end make-questions

#make-questions()
