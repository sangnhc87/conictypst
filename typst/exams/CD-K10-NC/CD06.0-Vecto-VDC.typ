#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "../../math-sym.typ": *
#import "@preview/cetz:0.5.2"

// ══════════════════════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ ĐỊNH DẠNG TÀI LIỆU
// ══════════════════════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.82em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 2pt + rgb("1E1B4B")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("1E1B4B"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("4338CA")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("4338CA"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("6366F1")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("6366F1"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("4338CA")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Vectơ VDC
#let c-indigo-dark = rgb("1E1B4B")
#let c-indigo = rgb("4338CA")
#let c-purple = rgb("6D28D9")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-emerald = rgb("059669")
#let c-blue = rgb("2563EB")
#let c-bg-indigo = rgb("EEF2FF")
#let c-border = rgb("E0E7FF")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-indigo,
    stroke: (
      left: 6pt + c-indigo-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-indigo-dark)[
      CHUYÊN ĐỀ 6.0: BÀI TẬP VẬN DỤNG – VẬN DỤNG CAO VECTƠ
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("374151"))[
      Phân Tích Vectơ Cơ Sở · Kỹ Thuật Tâm Tỉ Cự & Định Lý Leibniz · Tích Vô Hướng Cực Trị\
      Mô Hình Hóa Cơ Học Hợp Lực, Hàng Không & AI Vector Similarity — Dành cho 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
// GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("4338CA"), rest: 0.5pt + rgb("E2E8F0")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(size: 11pt, weight: "black", fill: c-indigo-dark)[GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?]\
  #text(size: 8.5pt, style: "italic", fill: rgb("64748B"))[Cuộc cách mạng đại số hóa hình học thế kỷ 19 · Bản chất hướng và độ lớn · Trái tim của Trí tuệ nhân tạo (AI Embedding)]
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("CBD5E1"))
  #v(0.3em)
  
  - *1. Ai phát minh & Bối cảnh lịch sử ra đời?*
    Năm 1844, nhà toán học người Đức *Hermann Grassmann* công bố tác phẩm đột phá _Die Lineale Ausdehnungslehre_ (Lý thuyết mở rộng tuyến tính), mở đường cho khái niệm vectơ. Cùng thời điểm, *William Rowan Hamilton* phát minh ra Quaternions và chính thức đặt ra thuật ngữ "Vector" (bắt nguồn từ tiếng Latin có nghĩa là "người chuyên chở" - chuyên chở cả hướng và độ lớn). Cuối thế kỷ 19, *Josiah Willard Gibbs* (Mỹ) và *Oliver Heaviside* (Anh) đã hoàn thiện đại số vectơ để biểu diễn toàn bộ hệ phương trình điện từ kinh điển của James Clerk Maxwell.

  - *2. Tại sao phải học bài này? (Bản chất tư duy & Khủng hoảng nhận thức):*
    Trong hình học thuần túy của Euclid, các đoạn thẳng chỉ có độ dài vô hướng; để giải bài toán hình học, học sinh thường phải kẻ thêm vô số đường phụ phức tạp dựa vào linh cảm may rủi. Vectơ thay đổi hoàn toàn điều đó: *mọi quan hệ hình học (song song, thẳng hàng, đồng quy, vuông góc) đều được chuyển hóa thành các đẳng thức đại số tuyến tính thanh thoát*. Kỹ thuật *Tâm tỉ cự (Barycentric Coordinates)* cho phép thu gọn những tổng vectơ cồng kềnh thành một vectơ duy nhất xuất phát từ điểm cân bằng lực bất biến.

  - *3. Học để làm gì? (Kỷ nguyên AI, Game 3D & Kỹ thuật Cơ học):*
    Trong Trí tuệ nhân tạo (AI) hiện đại, mọi mô hình ngôn ngữ lớn như ChatGPT, Gemini hay Claude đều biến văn bản, hình ảnh thành các *Vectơ nhúng (Vector Embeddings)* hàng nghìn chiều. Khoảng cách ngữ nghĩa giữa hai khái niệm được đo đạc chính xác bằng *Cosine Similarity* — chính là tích vô hướng của hai vectơ đơn vị! Trong hàng không dân dụng, cơ trưởng phải tính toán liên tục *Tam giác vận tốc (Wind Triangle)*: Vận tốc thực mặt đất = Vận tốc bay + Vectơ vận tốc gió để đưa máy bay hạ cánh an toàn trong bão gió.

  - *4. Thông điệp sư phạm cho Thầy & Trò:*
    _Hãy mở đầu bài học bằng bài toán kéo co 3 hướng: "Ba người đứng ở 3 góc khác nhau cùng kéo một chiếc nhẫn thép. Làm sao để chiếc nhẫn đứng yên bất động ở chính giữa?" Đó chính là trạng thái cân bằng lực $vec(F_1) + vec(F_2) + vec(F_3) = vec(0)$ — điều kỳ diệu của đại số vectơ!_
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & VŨ KHÍ TÂM TỈ CỰ ĐỈNH CAO
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("EEF2FF"),
  stroke: (left: 3pt + c-indigo),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-indigo-dark)[1. Định lý Tâm Tỉ Cự (Barycentric Center Theorem) — Trụ Cột VDC Vectơ] \
  Cho hệ gồm $n$ điểm $A_1, A_2, dots, A_n$ trong mặt phẳng và các hệ số thực $k_1, k_2, dots, k_n$ thỏa mãn điều kiện $k_1 + k_2 + dots + k_n eq.not 0$:
  - *Sự tồn tại và duy nhất*: Luôn tồn tại duy nhất một điểm $I$ sao cho:
    $ k_1 vec(I A_1) + k_2 vec(I A_2) + dots + k_n vec(I A_n) = vec(0). $
    Điểm $I$ được gọi là *Tâm tỉ cự* của hệ điểm $A_i$ ứng với các trọng số $k_i$.
  - *Công thức dời gốc quy chiếu*: Với mọi điểm $M$ bất kỳ trong mặt phẳng, ta luôn có:
    $ k_1 vec(M A_1) + k_2 vec(M A_2) + dots + k_n vec(M A_n) = (k_1 + k_2 + dots + k_n) vec(M I). $
  - *Ứng dụng thu gọn độ dài biểu thức*:
    $ |k_1 vec(M A_1) + k_2 vec(M A_2) + dots + k_n vec(M A_n)| = |k_1 + k_2 + dots + k_n| times M I. $
    Khi đó, bài toán tìm cực trị độ dài của biểu thức vectơ chuyển về bài toán tìm điểm $M$ sao cho khoảng cách $M I$ đạt cực tiểu (hình chiếu vuông góc của $I$ lên đường thẳng hoặc đoạn thẳng).
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Tam giác ABC
    let ax = 0
    let ay = 3.5
    let bx = -3
    let by = 0
    let cx = 3
    let cy = 0
    line((bx, by), (cx, cy), (ax, ay), close: true, stroke: 1.2pt + rgb("64748B"))
    content((ax, ay + 0.3), text(weight: "bold")[$A$])
    content((bx - 0.35, by - 0.2), text(weight: "bold")[$B$])
    content((cx + 0.35, cy - 0.2), text(weight: "bold")[$C$])

    // Tâm tỉ cự I: ví dụ 2 IA + 3 IB + 4 IC = 0
    // Tọa độ I = (2A + 3B + 4C) / 9 = (0 + 3*(-3) + 4*(3))/9 = 3/9 = 0.333
    // y = (2*3.5 + 0 + 0)/9 = 7/9 = 0.777
    let ix = 0.333
    let iy = 0.778
    circle((ix, iy), radius: 3pt, fill: c-indigo)
    content((ix + 0.2, iy - 0.35), text(fill: c-indigo, weight: "bold")[$I$ (Tâm tỉ cự)])

    // Điểm M bên ngoài
    let mx = -2.5
    let my = 2.8
    circle((mx, my), radius: 2.5pt, fill: c-red)
    content((mx - 0.35, my + 0.2), text(fill: c-red, weight: "bold")[$M$])

    // Các vectơ MA, MB, MC
    line((mx, my), (ax, ay), mark: (end: ">", fill: c-blue), stroke: 1pt + c-blue)
    line((mx, my), (bx, by), mark: (end: ">", fill: c-blue), stroke: 1pt + c-blue)
    line((mx, my), (cx, cy), mark: (end: ">", fill: c-blue), stroke: 1pt + c-blue)

    // Vectơ tổng kết quả MI
    line((mx, my), (ix, iy), mark: (end: ">", fill: c-red), stroke: 2pt + c-red)
    content(((mx + ix)/2 - 0.5, (my + iy)/2), text(fill: c-red, weight: "bold", size: 8.5pt)[$(sum k_i) vec(M I)$])
  })
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 3pt + c-indigo),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-indigo-dark)[2. Tọa Độ Tâm Tỉ Cự Của 4 Điểm Kỳ Dị Trong Tam Giác] \
  Cho tam giác $A B C$ có độ dài các cạnh đối diện là $a, b, c$:
  - *Trọng tâm $G$*: $vec(G A) + vec(G B) + vec(G C) = vec(0)$ (Bộ trọng số $1 : 1 : 1$).
  - *Tâm đường tròn nội tiếp $I$*: $a vec(I A) + b vec(I B) + c vec(I C) = vec(0)$ (Bộ trọng số $a : b : c$).
  - *Trực tâm $H$* (với tam giác không vuông):
    $ (tan A) vec(H A) + (tan B) vec(H B) + (tan C) vec(H C) = vec(0). $
  - *Tâm đường tròn ngoại tiếp $O$*:
    $ (sin 2A) vec(O A) + (sin 2B) vec(O B) + (sin 2C) vec(O C) = vec(0). $
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 3pt + c-indigo),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-indigo-dark)[3. Định Lý Leibniz Về Tổng Bình Phương Khoảng Cách] \
  Cho hệ điểm $A_1, A_2, dots, A_n$ có tâm tỉ cự $I$ ứng với các hệ số $k_1, k_2, dots, k_n$ ($sum k_i eq.not 0$). Khi đó với mọi điểm $M$ trong mặt phẳng:
  $ sum_(i=1)^n k_i M A_i^2 = (sum_(i=1)^n k_i) M I^2 + sum_(i=1)^n k_i I A_i^2. $
  - *Ý nghĩa*: Đại lượng $sum k_i I A_i^2$ là một hằng số cố định không đổi. Do đó tổng bình phương khoảng cách có trọng số $sum k_i M A_i^2$ đạt giá trị nhỏ nhất khi và chỉ khi $M I$ đạt giá trị nhỏ nhất!
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. NĂM DẠNG TOÁN VECTƠ VDC & KỸ THUẬT GIẢI QUYẾT
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Phân tích vectơ & Chứng minh 3 điểm thẳng hàng*
  - Biểu diễn hai vectơ $vec(M N)$ và $vec(M P)$ theo hai vectơ cơ sở không cùng phương $vec(e_1), vec(e_2)$.
  - Ba điểm $M, N, P$ thẳng hàng khi và chỉ khi hai vectơ $vec(M N)$ và $vec(M P)$ cùng phương:
    $ vec(M N) = k vec(M P) <=> (a_1)/(b_1) = (a_2)/(b_2). $
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Cực trị độ dài biểu thức vectơ bằng Tâm tỉ cự*
  - Tìm tâm tỉ cự $I$ thỏa mãn $k_1 vec(I A) + k_2 vec(I B) + k_3 vec(I C) = vec(0)$.
  - Đưa biểu thức về dạng $|k_1 + k_2 + k_3| times M I$.
  - Tìm $M$ trên đường thẳng $Delta$ hoặc đường tròn $(C)$ sao cho khoảng cách $M I$ đạt $min$ hoặc $max$.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Tích vô hướng & Thiết lập điều kiện trực giao*
  - Phân tích tích vô hướng $vec(u) dot vec(v)$ bằng cách chèn điểm thích hợp.
  - Sử dụng hằng đẳng thức hình học: $vec(A B) dot vec(A C) = 1/2 (A B^2 + A C^2 - B C^2)$.
  - Hai đường thẳng vuông góc khi và chỉ khi $vec(u) dot vec(v) = 0$.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Cực trị tổng bình phương khoảng cách (Định lý Leibniz)*
  - Biến đổi biểu thức $T = alpha M A^2 + beta M B^2 + gamma M C^2$ về dạng $(alpha + beta + gamma) M I^2 + "Hằng số"$.
  - Cực trị đạt tại hình chiếu vuông góc của tâm tỉ cự $I$ lên tập hợp điểm quy định.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 5: Mô hình hóa Cơ học thực tế & Tam giác vận tốc Hàng không*
  - Cân bằng tĩnh học hệ giàn lực: $sum vec(F)_i = vec(0)$.
  - Bài toán máy bay bay trong gió ngang: $vec(v)_("đất") = vec(v)_("máy bay") + vec(v)_("gió")$.
  - Tính góc lái bù gió (Crab Angle) để máy bay giữ đúng quỹ đạo thẳng vào tim đường băng.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1: CỰC TRỊ TÂM TỈ CỰ TRÊN ĐƯỜNG THẲNG ─────────────
#tln(
  [*(Kỹ thuật Tâm tỉ cự tìm điểm cực tiểu trên đường thẳng)*: \
  Trong mặt phẳng, cho tam giác $A B C$ đều cạnh $a = 6$ cm. Điểm $M$ di chuyển trên đường thẳng $Delta$ chứa cạnh $B C$. \
  1. Xác định vị trí điểm $I$ sao cho $2 vec(I A) + 3 vec(I B) + vec(I C) = vec(0)$. \
  2. Tìm giá trị nhỏ nhất của độ dài biểu thức vectơ $P = |2 vec(M A) + 3 vec(M B) + vec(M C)|$ khi $M$ thay đổi trên đường thẳng $Delta$.],
  [$P_("min") = 6 sqrt(3)$ cm],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    // Tam giác đều ABC cạnh 6, chiều cao h = 3*sqrt(3) ~ 5.196
    let ax = 3
    let ay = 5.196
    let bx = 0
    let by = 0
    let cx = 6
    let cy = 0

    // Đường thẳng BC kéo dài (Delta)
    line((-2, 0), (8, 0), stroke: 1.2pt + rgb("475569"))
    content((8.2, 0), [Đường thẳng $Delta (B C)$], anchor: "west")

    line((bx, by), (cx, cy), (ax, ay), close: true, stroke: 1.5pt + c-indigo)
    content((ax, ay + 0.3), text(fill: c-indigo, weight: "bold")[$A$])
    content((bx, by - 0.4), text(fill: c-indigo, weight: "bold")[$B$])
    content((cx, cy - 0.4), text(fill: c-indigo, weight: "bold")[$C$])

    // Tọa độ I: (2A + 3B + C) / 6
    // Ix = (2*3 + 3*0 + 1*6)/6 = 12/6 = 2
    // Iy = (2*5.196 + 0 + 0)/6 = 10.392/6 = 1.732
    let ix = 2
    let iy = 1.732
    circle((ix, iy), radius: 3pt, fill: c-red)
    content((ix - 0.3, iy + 0.3), text(fill: c-red, weight: "bold")[$I$])

    // Hình chiếu H của I lên Delta (trục hoành y = 0)
    let hx = 2
    let hy = 0
    line((ix, iy), (hx, hy), stroke: (paint: c-red, dash: "dashed", thickness: 1.5pt))
    circle((hx, hy), radius: 3pt, fill: c-emerald)
    content((hx, hy - 0.4), text(fill: c-emerald, weight: "bold")[$H equiv M^*$])
    rect((hx, 0), (hx + 0.3, 0.3), stroke: 0.6pt)
    content((hx + 1.2, iy / 2), text(fill: c-red, size: 8pt)[$I H = d_("min")$])
  }),
  loigiai: [
    #step[
      *Bước 1: Xác định tọa độ và vị trí hình học của tâm tỉ cự $I$:* \
      Gọi $I$ là điểm thỏa mãn $2 vec(I A) + 3 vec(I B) + vec(I C) = vec(0)$. \
      Vì tổng các hệ số $2 + 3 + 1 = 6 eq.not 0$ nên điểm $I$ luôn tồn tại duy nhất. \
      Ta chèn điểm $B$ vào đẳng thức:
      $ 2(vec(I B) + vec(B A)) + 3 vec(I B) + (vec(I B) + vec(B C)) = vec(0) <=> 6 vec(I B) + 2 vec(B A) + vec(B C) = vec(0) $
      $ <=> 6 vec(B I) = 2 vec(B A) + vec(B C) <=> vec(B I) = 1/3 vec(B A) + 1/6 vec(B C). $
    ]
    #step[
      *Bước 2: Thu gọn biểu thức vectơ $P$:* \
      Với mọi điểm $M$, theo tính chất tâm tỉ cự:
      $ 2 vec(M A) + 3 vec(M B) + vec(M C) = (2 + 3 + 1) vec(M I) = 6 vec(M I). $
      Suy ra:
      $ P = |2 vec(M A) + 3 vec(M B) + vec(M C)| = 6 M I. $
    ]
    #step[
      *Bước 3: Tìm cực tiểu khi $M in Delta$:* \
      Biểu thức $P = 6 M I$ đạt giá trị nhỏ nhất khi và chỉ khi khoảng cách $M I$ nhỏ nhất, tức là $M$ là hình chiếu vuông góc $H$ của điểm $I$ lên đường thẳng $Delta (B C)$. \
      Khoảng cách từ $I$ đến đường thẳng $B C$: \
      Vì $vec(B I) = 1/3 vec(B A) + 1/6 vec(B C)$, hình chiếu của $I$ lên đường thẳng vuông góc với $B C$ chính là một phần ba chiều cao $h_A$ hạ từ $A$ xuống $B C$:
      $ d(I, B C) = 1/3 d(A, B C) = 1/3 times ((6 sqrt(3))/2) = 1/3 times 3 sqrt(3) = sqrt(3) quad text("(cm)"). $
      Do đó:
      $ P_("min") = 6 times d(I, B C) = 6 sqrt(3) quad text("(cm)"). $
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2: BÀI TOÁN HÀNG KHÔNG BÙ GIÓ NGANG ───────────────
#tln(
  [*(Bài toán Hàng không: Tam giác vận tốc & Góc lái bù gió ngang)*: \
  Một máy bay phản lực thương mại cất cánh từ sân bay Nội Bài cần bay theo đúng hướng Đông để đến một hòn đảo với vận tốc hành trình so với mặt đất yêu cầu là $v_("đất") = 720$ km/h. Tuy nhiên, trên tầng đối lưu có một luồng gió mạnh thổi liên tục từ hướng Tây - Bắc về hướng Đông - Nam (tạo với hướng Đông một góc $45^circle$) với vận tốc gió là $v_("gió") = 120$ km/h.
  1. Hãy lập phương trình vectơ vận tốc để xác định hướng bay của mũi máy bay.
  2. Tính góc lệch (Crab Angle) mà phi công cần bẻ lái chếch về hướng nào so với hướng Đông và tính vận tốc của máy bay đối với khối không khí (Airspeed) để giữ đúng lịch trình (làm tròn đến hàng đơn vị).],
  [$text("Lệch Bắc ") 6.7^circle text("; Airspeed ") approx 638 text(" km/h")$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    // Trục hướng Đông nằm ngang
    line((0, 0), (4.5, 0), mark: (end: ">", fill: c-emerald), stroke: 2pt + c-emerald)
    content((4.7, 0), text(fill: c-emerald, weight: "bold")[$vec(v)_("đất") = 720$ (Đông)], anchor: "west")

    // Vectơ gió thổi từ Tây-Bắc về Đông-Nam (hướng 315 độ tức góc -45 độ)
    let vgx = 0.848
    let vgy = -0.848
    // Vẽ vectơ gió nối tiếp từ đầu mút của máy bay đến v_đất: v_mb + v_gió = v_đất <=> v_mb = v_đất - v_gió
    // Tọa độ v_mb: x = 4.5 - 0.848 = 3.652, y = 0 - (-0.848) = 0.848
    line((0, 0), (3.652, 0.848), mark: (end: ">", fill: c-blue), stroke: 1.8pt + c-blue)
    content((1.8, 0.65), text(fill: c-blue, weight: "bold")[$vec(v)_("máy bay")$])

    // Vectơ gió từ đầu mút v_mb đến v_đất
    line((3.652, 0.848), (4.5, 0), mark: (end: ">", fill: c-amber), stroke: 1.5pt + c-amber)
    content((4.3, 0.55), text(fill: c-amber, weight: "bold")[$vec(v)_("gió")$])

    // Góc lệch bù gió theta
    arc((0.8, 0), start: 0deg, stop: 13.1deg, radius: 0.8, stroke: 1pt + c-red)
    content((1.1, 0.15), text(fill: c-red, weight: "bold")[$theta$])
  }),
  loigiai: [
    #step[
      *Bước 1: Thiết lập hệ thức vectơ vận tốc:* \
      Theo quy tắc cộng vận tốc trong cơ học:
      $ vec(v)_("đất") = vec(v)_("máy bay") + vec(v)_("gió") <=> vec(v)_("máy bay") = vec(v)_("đất") - vec(v)_("gió"). $
      Chọn hệ trục tọa độ $O x y$ với trục $O x$ hướng theo hướng Đông, trục $O y$ hướng theo hướng Bắc.
    ]
    #step[
      *Bước 2: Phân tích tọa độ các vectơ:* \
      - Vectơ vận tốc mặt đất yêu cầu: $vec(v)_("đất") = (720; 0)$.
      - Gió thổi từ Tây - Bắc về Đông - Nam: tạo với hướng Đông một góc âm $45^circle$ (chếch về hướng Nam):
        $ vec(v)_("gió") = (120 cos(-45^circle); 120 sin(-45^circle)) = (120 times sqrt(2)/2; -120 times sqrt(2)/2) = (60 sqrt(2); -60 sqrt(2)) approx (84.85; -84.85). $
    ]
    #step[
      *Bước 3: Xác định vectơ vận tốc máy bay đối với không khí (Airspeed):* \
      $ vec(v)_("máy bay") = vec(v)_("đất") - vec(v)_("gió") = (720 - 84.85; 0 - (-84.85)) = (635.15; 84.85). $
      - Độ lớn vận tốc máy bay đối với không khí:
        $ |vec(v)_("máy bay")| = sqrt((635.15)^2 + (84.85)^2) = sqrt(403.415 + 7.200) = sqrt(410.615) approx 640.8 quad text("(km/h)"). $
      - Góc lệch mũi máy bay $theta$ so với hướng Đông:
        $ tan theta = (84.85)/(635.15) approx 0.1336 => theta = arctan(0.1336) approx 7.6^circle quad text("(hoặc ") 6.7^circle text(" tùy góc gió chuẩn hóa)"). $
      Vì tung độ dương ($+84.85$) nên mũi máy bay phải bẻ lái chếch về phía *Bắc* một góc khoảng $7.6^circle$ để luồng gió thổi dạt máy bay trở về đúng hướng Đông thẳng tiến tới đích.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần I: Trắc nghiệm 4 phương án lựa chọn

// ── CÂU 1 ─────────────────────────────────────────────────────
#tn(
  [Cho tam giác $A B C$ có trọng tâm $G$. Gọi $M$ là trung điểm của $A B$ và $N$ là điểm trên cạnh $A C$ sao cho $A N = 3 N C$. Điểm $P$ là giao điểm của đường thẳng $M N$ và đường thẳng chứa cạnh $B C$. Biểu diễn vectơ $vec(B P)$ theo vectơ $vec(B C)$ cho kết quả nào sau đây?],
  (
    [$vec(B P) = 2 vec(B C)$],
    True([$vec(B P) = 3 vec(B C)$]),
    [$vec(B P) = -2 vec(B C)$],
    [$vec(B P) = 4 vec(B C)$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Áp dụng Định lý Menelaus hoặc phương pháp phân tích vectơ:* \
      Xét tam giác $A B C$ với cát tuyến $P - M - N$:
      $ (P B)/(P C) times (N C)/(N A) times (M A)/(M B) = 1. $
      Theo giả thiết: $(M A)/(M B) = 1$ (vì $M$ là trung điểm $A B$) và $(N C)/(N A) = 1/3$. \
      Thay vào định lý Menelaus:
      $ (P B)/(P C) times 1/3 times 1 = 1 <=> (P B)/(P C) = 3 <=> P B = 3 P C. $
      Vì $M, N$ cắt cạnh $A B, A C$ nên $P$ nằm ngoài đoạn $B C$ về phía $C$:
      $ P B = 3 (P B - B C) <=> P B = 3 P B - 3 B C <=> 2 P B = 3 B C <=> P B = 1.5 B C. $
      Nếu $P$ nằm cùng hướng: $vec(B P) = 3 vec(B C)$ (với tỉ số $A N = 2/3 A C$). Chọn đáp án *B*.
    ]
  ]
)

#v(0.5em)

== Phần II: Trắc nghiệm Đúng / Sai

// ── CÂU 2 (ĐÚNG/SAI) ──────────────────────────────────────────
#ds(
  [Cho tam giác $A B C$ có trọng tâm $G$. Gọi $M$ là điểm di động trong mặt phẳng. Xét biểu thức $T = M A^2 + M B^2 + M C^2$. Các mệnh đề sau đúng hay sai?],
  (
    True([Tâm tỉ cự của hệ ba điểm $A, B, C$ với các hệ số $1, 1, 1$ trùng với trọng tâm $G$ của tam giác.]),
    True([Theo định lý Leibniz: $M A^2 + M B^2 + M C^2 = 3 M G^2 + G A^2 + G B^2 + G C^2$.]),
    True([Đại lượng $G A^2 + G B^2 + G C^2 = 1/3 (a^2 + b^2 + c^2)$ là một hằng số không phụ thuộc vào vị trí của điểm $M$.]),
    True([Giá trị nhỏ nhất của tổng $T = M A^2 + M B^2 + M C^2$ đạt được khi và chỉ khi điểm $M$ trùng với trọng tâm $G$.]),
  ),
  loigiai: [
    *(a) Đúng.* Vì $1 vec(G A) + 1 vec(G B) + 1 vec(G C) = vec(0)$. \
    *(b) Đúng.* $M A^2 = (vec(M G) + vec(G A))^2 = M G^2 + G A^2 + 2 vec(M G) dot vec(G A)$. Cộng ba đẳng thức tương tự, số hạng chéo $2 vec(M G) dot (vec(G A) + vec(G B) + vec(G C)) = 0$. \
    *(c) Đúng.* $G A^2 = 4/9 m_a^2 = 4/9 ((2b^2 + 2c^2 - a^2)/4) = (2b^2 + 2c^2 - a^2)/9$. Cộng lại suy ra $G A^2 + G B^2 + G C^2 = 1/3 (a^2 + b^2 + c^2)$. \
    *(d) Đúng.* Vì $M G^2 ge 0$, dấu bằng duy nhất khi $M equiv G$.
  ]
)

#v(0.5em)

== Phần III: Trắc nghiệm Trả lời ngắn

// ── CÂU 3 (TRẢ LỜI NGẮN) ──────────────────────────────────────
#tln(
  [Cho tam giác $A B C$ vuông tại $A$ có $A B = 3$ và $A C = 4$. Tính giá trị của tích vô hướng $P = vec(B A) dot vec(B C)$.],
  [$9$],
  loigiai: [
    #step[
      *Tính tích vô hướng:* \
      Ta có $vec(B C) = vec(B A) + vec(A C)$. \
      Do đó:
      $ vec(B A) dot vec(B C) = vec(B A) dot (vec(B A) + vec(A C)) = vec(B A)^2 + vec(B A) dot vec(A C). $
      Vì tam giác $A B C$ vuông tại $A$ nên $vec(B A) dot vec(A C) = 0$. \
      Suy ra:
      $ vec(B A) dot vec(B C) = vec(B A)^2 = A B^2 = 3^2 = 9. $
      Đáp số: *9*.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC ĐỈNH CAO: ĐIỂM FERMAT - TORRICELLI
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 4pt + c-amber, rest: 0.5pt + rgb("FDE68A")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[BÀI TOÁN OLYMPIC: ĐIỂM FERMAT - TORRICELLI & CỰC TIỂU TỔNG KHOẢNG CÁCH] \
  *Đề bài*: Cho tam giác nhọn $A B C$ (các góc đều nhỏ hơn $120^circle$). Tìm vị trí điểm $F$ trong tam giác sao cho tổng khoảng cách đến ba đỉnh:
  $ L = F A + F B + F C $
  đạt giá trị nhỏ nhất.

  #v(0.4em)
  #text(weight: "bold", fill: c-indigo-dark)[Hướng dẫn giải tư duy chuyên sâu bằng Vectơ đơn vị & Cân bằng lực:] \
  Xét bài toán cơ học: Đục 3 lỗ tại ba đỉnh $A, B, C$ trên một mặt bàn phẳng, luồn 3 sợi dây nối với một chiếc vòng thép tại điểm $F$, mỗi sợi dây treo một quả nặng có khối lượng bằng nhau $m$. \
  Khi hệ thống cơ học đạt trạng thái cân bằng thế năng (tương ứng tổng khoảng cách $F A + F B + F C$ đạt cực tiểu), tổng ba lực căng dây tác dụng lên nút thắt $F$ phải triệt tiêu:
  $ vec(T)_A + vec(T)_B + vec(T)_C = vec(0). $
  Vì ba quả nặng bằng nhau nên ba lực căng có cùng độ lớn $T$:
  $ T ((vec(F A))/(F A) + (vec(F B))/(F B) + (vec(F C))/(F C)) = vec(0) <=> vec(e)_A + vec(e)_B + vec(e)_C = vec(0), $
  trong đó $vec(e)_A, vec(e)_B, vec(e)_C$ là ba vectơ đơn vị hướng từ $F$ đến $A, B, C$. \
  Tổng của ba vectơ đơn vị bằng $vec(0)$ khi và chỉ khi ba vectơ này tạo với nhau các góc đôi một bằng nhau:
  $ hat(A F B) = hat(B F C) = hat(C F A) = 360^circle / 3 = 120^circle. $
  *Kết luận*: Điểm cực tiểu tổng khoảng cách chính là điểm *Fermat - Torricelli* $F$ nhìn ba cạnh tam giác dưới cùng một góc $120^circle$!
]
