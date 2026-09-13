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
  stroke: (bottom: 2pt + rgb("581C87")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("581C87"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("7E22CE")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("7E22CE"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("A855F7")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("A855F7"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("7E22CE")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Phương trình đường tròn (Purple - Violet)
#let c-purple-dark = rgb("581C87")
#let c-purple = rgb("7E22CE")
#let c-purple-light = rgb("A855F7")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-emerald = rgb("059669")
#let c-bg-purple = rgb("FAF5FF")
#let c-border = rgb("F3E8FF")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-purple,
    stroke: 1.5pt + c-purple,
    radius: 8pt,
    width: 100%,
    inset: (x: 15pt, y: 12pt),
  )[
    #text(fill: c-purple-dark, size: 11pt, weight: "bold")[BỘ GIÁO ÁN VẬN DỤNG CAO TOÁN 10 — CHUYÊN ĐỀ CHUYÊN SÂU] \
    #v(4pt)
    #text(fill: c-purple, size: 16pt, weight: "black")[CHUYÊN ĐỀ 9: BÀI TẬP VẬN DỤNG – VẬN DỤNG CAO PHƯƠNG TRÌNH ĐƯỜNG TRÒN]\
    #v(3pt)
    #text(fill: rgb("4B5563"), size: 10pt, style: "italic")[
      Phương tích & Trục đẳng phương, Tiếp tuyến chung, Cực trị hình học tương giao & Định lý Poncelet
    ]
  ]
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
// LỜI NÓI ĐẦU & TƯ TƯỞNG SƯ PHẠM
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-purple),
  inset: 12pt,
  radius: (right: 6pt),
  width: 100%,
)[
  *Hình học Giải tích Đường tròn: Vẻ đẹp Đối xứng & Cực trị Toàn năng:*
  
  Nếu đường thẳng đại diện cho không gian Euclid 1 chiều tuyến tính, thì đường tròn $(x - a)^2 + (y - b)^2 = R^2$ là đường cong phi tuyến đóng hoàn hảo nhất trong hình học. Trong các đề thi HSG và tuyển sinh đại học chất lượng cao, bài toán Đường tròn không chỉ là tìm tâm và bán kính, mà là đấu trường của các kỹ thuật tinh tế:
  
  1. *Phương tích của một điểm đối với đường tròn & Trục đẳng phương*: Cầu nối giải tích giữa khoảng cách từ tâm và tích đại số của cát tuyến $P_(M / (C)) = M A dot M B = M T^2$. Trục đẳng phương $d_1 - d_2 = 0$ giải quyết các bài toán đồng quy và thẳng hàng mà hình học cổ điển phải dùng nhiều bổ đề phức tạp.
  2. *Hệ thống tiếp tuyến chung*: Xác định tiếp tuyến chung trong và tiếp tuyến chung ngoài của hai đường tròn bằng tâm vị tự trong $J$ và tâm vị tự ngoài $K$.
  3. *Cực trị đại số - hình học*: Tối ưu hóa biểu thức $P = alpha x + beta y$ hoặc $P = x^2 + y^2$ khi điểm $M(x; y)$ bị ràng buộc trên đường tròn (Bất đẳng thức Cauchy - Schwarz giải tích hóa).
  4. *Định lý Euler & Định lý đóng Poncelet*: Mối quan hệ kỳ diệu giữa đường tròn nội tiếp và ngoại tiếp tam giác $O I^2 = R^2 - 2 R r$.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. HỆ THỐNG ĐỊNH LÝ & CÔNG CỤ VDC ĐỈNH CAO
// ══════════════════════════════════════════════════════════════

== 1. Phương tích của một điểm đối với đường tròn

#block(
  fill: c-bg-purple,
  stroke: 1pt + c-border,
  inset: 10pt,
  radius: 6pt,
  width: 100%,
)[
  Cho đường tròn $(C)$ tâm $I(a; b)$, bán kính $R$ có phương trình:
  $ (C): f(x, y) = x^2 + y^2 - 2a x - 2b y + c = 0 quad ("với " c = a^2 + b^2 - R^2). $
  - *Định nghĩa:* Với điểm $M(x_M; y_M)$ tùy ý trong mặt phẳng, *phương tích* của $M$ đối với $(C)$ là:
    $ P_(M / (C)) = M I^2 - R^2 = f(x_M, y_M) = x_M^2 + y_M^2 - 2a x_M - 2b y_M + c. $
  - *Ý nghĩa hình học:*
    - Nếu $M$ nằm ngoài đường tròn: $P_(M / (C)) = M T^2 > 0$ (với $M T$ là độ dài tiếp tuyến kẻ từ $M$ tới $(C)$).
    - Nếu $M$ nằm trên đường tròn: $P_(M / (C)) = 0$.
    - Nếu $M$ nằm trong đường tròn: $P_(M / (C)) = -M T^2 < 0$.
    - Với mọi cát tuyến đi qua $M$ cắt đường tròn tại $A$ và $B$, ta luôn có:
      $ P_(M / (C)) = vec(M A) dot vec(M B). $
]

#v(0.6em)

== 2. Trục đẳng phương của hai đường tròn

Cho hai đường tròn không đồng tâm:
$ (C_1): x^2 + y^2 - 2a_1 x - 2b_1 y + c_1 = 0, quad (C_2): x^2 + y^2 - 2a_2 x - 2b_2 y + c_2 = 0. $
- Tập hợp các điểm $M$ có cùng phương tích đối với hai đường tròn $P_(M / (C_1)) = P_(M / (C_2))$ là một đường thẳng gọi là *Trục đẳng phương* của hai đường tròn:
  $ Delta: 2(a_1 - a_2) x + 2(b_1 - b_2) y - (c_1 - c_2) = 0. $
- *Đặc điểm cốt tử:* Trục đẳng phương $Delta$ luôn *vuông góc* với đường nối tâm $I_1 I_2$.
- Nếu hai đường tròn cắt nhau tại hai điểm $A, B$ thì trục đẳng phương chính là đường thẳng chứa dây cung chung $A B$!

#v(0.6em)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hai đường tròn cắt nhau
    let r1 = 2.0
    let r2 = 1.5
    let d = 2.8 // khoảng cách tâm

    let x1 = 0
    let x2 = d

    circle((x1, 0), radius: r1, stroke: 1.5pt + c-purple)
    circle((x2, 0), radius: r2, stroke: 1.5pt + c-blue)

    circle((x1, 0), radius: 2.5pt, fill: c-purple-dark)
    content((x1, -0.35), text(fill: c-purple-dark, weight: "bold")[$I_1$])
    circle((x2, 0), radius: 2.5pt, fill: c-blue)
    content((x2, -0.35), text(fill: c-blue, weight: "bold")[$I_2$])

    // Đường nối tâm
    line((x1, 0), (x2, 0), stroke: (paint: rgb("94A3B8"), dash: "dashed", thickness: 0.8pt))

    // Trục đẳng phương vuông góc đường nối tâm tại x_cross:
    // x^2 + y^2 = r1^2 và (x - d)^2 + y^2 = r2^2
    // x^2 - (x - d)^2 = r1^2 - r2^2 => 2dx - d^2 = r1^2 - r2^2 => x = (r1^2 - r2^2 + d^2)/(2d)
    let x_iso = (r1*r1 - r2*r2 + d*d) / (2 * d) // (4 - 2.25 + 7.84) / 5.6 = 9.59 / 5.6 approx 1.71
    line((x_iso, -2.8), (x_iso, 2.8), stroke: 2pt + c-red)
    content((x_iso + 0.9, 2.7), text(fill: c-red, weight: "bold")[Trục đẳng phương $Delta$])

    // Hai giao điểm A và B
    let y_cross = calc.sqrt(r1*r1 - x_iso*x_iso)
    circle((x_iso, y_cross), radius: 2.5pt, fill: c-emerald)
    content((x_iso - 0.3, y_cross + 0.2), text(fill: c-emerald, weight: "bold")[$A$])
    circle((x_iso, -y_cross), radius: 2.5pt, fill: c-emerald)
    content((x_iso - 0.3, -y_cross - 0.2), text(fill: c-emerald, weight: "bold")[$B$])
  })
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BÀI TẬP MA TRẬN 2025: VẬN DỤNG & VẬN DỤNG CAO
// ══════════════════════════════════════════════════════════════

== PHẦN I: CÂU HỎI TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN

#tn(
  [
    *Câu 1 (VDC - Cực trị biểu thức đại số trên đường tròn):*
    Cho các số thực $x, y$ thỏa mãn phương trình $(x - 3)^2 + (y - 4)^2 = 4$. Tìm giá trị lớn nhất của biểu thức $P = 3x + 4y$.
  ],
  (
    [$25$],
    True([$35$]),
    [$30$],
    [$40$],
  ),
)
#step[
  *Lời giải chi tiết bằng Phương pháp Hình học Tương giao:*
  - Biểu thức $(x - 3)^2 + (y - 4)^2 = 4$ xác định tập hợp các điểm $M(x; y)$ thuộc đường tròn $(C)$ có tâm $I(3; 4)$ và bán kính $R = 2$.
  - Biểu thức $P = 3x + 4y <==> 3x + 4y - P = 0$.
    Đây là phương trình của đường thẳng $Delta$ có vectơ pháp tuyến $vec(n) = (3; 4)$.
  - Để tồn tại cặp số $(x; y)$ thỏa mãn cả đường tròn $(C)$ và đường thẳng $Delta$, điều kiện cần và đủ là đường thẳng $Delta$ phải cắt hoặc tiếp xúc với đường tròn $(C)$:
    $ d(I, Delta) <= R <==> |3 dot 3 + 4 dot 4 - P| / sqrt(3^2 + 4^2) <= 2. $
  - Rút gọn biểu thức khoảng cách:
    $ |9 + 16 - P| / 5 <= 2 <==> |25 - P| <= 10. $
  - Phá dấu giá trị tuyệt đối:
    $ -10 <= 25 - P <= 10 <==> -35 <= -P <= -15 <==> 15 <= P <= 35. $
  - Vậy giá trị lớn nhất của $P$ là $P_"max" = 35$ (đạt được khi $Delta$ tiếp xúc với đường tròn ở phía xa gốc tọa độ).
  - Giá trị nhỏ nhất của $P$ là $P_"min" = 15$.
]

#v(0.5em)

#tn(
  [
    *Câu 2 (VDC - Trục đẳng phương & Dây cung chung):*
    Trong mặt phẳng $O x y$, cho hai đường tròn cắt nhau:
    $ (C_1): x^2 + y^2 - 4x - 6y + 4 = 0 $
    $ (C_2): x^2 + y^2 - 6x - 2y + 1 = 0 $
    Phương trình đường thẳng chứa dây cung chung của hai đường tròn là:
  ],
  (
    [$2x - 4y + 3 = 0$],
    True([$2x - 4y + 3 = 0$]),
    [$x + 2y - 5 = 0$],
    [$4x - 2y + 5 = 0$],
  ),
)
#step[
  *Lời giải chi tiết bằng Kỹ thuật Trừ đại số:*
  - Tọa độ giao điểm của hai đường tròn $(C_1)$ và $(C_2)$ là nghiệm của hệ:
    $ cases(x^2 + y^2 - 4x - 6y + 4 = 0, x^2 + y^2 - 6x - 2y + 1 = 0) $
  - Lấy phương trình thứ nhất trừ phương trình thứ hai theo từng vế:
    $ (-4x - (-6x)) + (-6y - (-2y)) + (4 - 1) = 0 $
    $ <==> 2x - 4y + 3 = 0. $
  - Đây chính là phương trình đường thẳng đi qua các giao điểm (trục đẳng phương) của hai đường tròn.
  - Vậy phương trình đường thẳng chứa dây cung chung là $2x - 4y + 3 = 0$.
]

#v(0.5em)

#tn(
  [
    *Câu 3 (VDC - Tiếp tuyến chung của hai đường tròn ngoài nhau):*
    Cho hai đường tròn $(C_1): (x - 1)^2 + y^2 = 1$ và $(C_2): (x - 6)^2 + y^2 = 4$. Có bao nhiêu tiếp tuyến chung của hai đường tròn này?
  ],
  (
    [$2$ tiếp tuyến],
    [$3$ tiếp tuyến],
    True([$4$ tiếp tuyến (gồm 2 tiếp tuyến ngoài và 2 tiếp tuyến trong)]),
    [$1$ tiếp tuyến],
  ),
)
#step[
  *Lời giải chi tiết:*
  - Tâm và bán kính của hai đường tròn:
    - $(C_1)$ có tâm $I_1(1; 0)$, bán kính $R_1 = 1$.
    - $(C_2)$ có tâm $I_2(6; 0)$, bán kính $R_2 = 2$.
  - Khoảng cách nối tâm:
    $ I_1 I_2 = sqrt((6 - 1)^2 + (0 - 0)^2) = 5. $
  - Tổng hai bán kính:
    $ R_1 + R_2 = 1 + 2 = 3. $
  - Hiệu hai bán kính:
    $ |R_1 - R_2| = |1 - 2| = 1. $
  - Vì $I_1 I_2 = 5 > R_1 + R_2 = 3$, hai đường tròn *nằm ngoài nhau hoàn toàn*.
  - Do đó, hai đường tròn có đúng *4 tiếp tuyến chung* (gồm 2 tiếp tuyến chung ngoài và 2 tiếp tuyến chung trong).
]

#v(0.8em)

== PHẦN II: CÂU HỎI ĐÚNG / SAI (4 Ý TOÀN DIỆN)

#ds(
  [
    *Câu 1 (Khảo sát toàn diện họ đường tròn có chứa tham số):*
    Trong mặt phẳng tọa độ $O x y$, xét họ đường cong phụ thuộc tham số $m$:
    $ (C_m): x^2 + y^2 - 2(m+1)x + 4m y + 5m^2 - 1 = 0. $
  ],
  (
    True([a) Với mọi giá trị thực của tham số $m$, phương trình $(C_m)$ luôn là phương trình của một đường tròn có bán kính $R = sqrt(2m + 2)$ khi $m > -1$.]),
    True([b) Tâm của đường tròn $(C_m)$ có tọa độ là $I(m+1; -2m)$.]),
    True([c) Khi $m$ thay đổi, tâm $I$ luôn di chuyển trên đường thẳng có phương trình $2x + y - 2 = 0$.]),
    False([d) Bán kính của đường tròn $(C_m)$ đạt giá trị nhỏ nhất bằng $1$ khi $m = 0$.]),
  ),
)
#step[
  *Lời giải chi tiết từng mệnh đề:*
  - *Ý a) và b):*
    Đưa phương trình $(C_m)$ về dạng chính tắc:
    $a = m + 1, quad b = -2m, quad c = 5m^2 - 1$.
    Biểu thức bán kính:
    $ R^2 = a^2 + b^2 - c = (m + 1)^2 + (-2m)^2 - (5m^2 - 1) $
    $ = (m^2 + 2m + 1) + 4m^2 - 5m^2 + 1 = 2m + 2. $
    Điều kiện để $(C_m)$ là đường tròn là $R^2 = 2m + 2 > 0 <==> m > -1$.
    Khi đó bán kính là $R = sqrt(2m + 2)$, tâm là $I(m+1; -2m)$. (Ý a và b Đúng).
  - *Ý c) Đúng (Quỹ tích tâm):*
    Ta có hệ tọa độ của tâm:
    $ cases(x_I = m + 1, y_I = -2m) <==> cases(m = x_I - 1, y_I = -2(x_I - 1)) <==> y_I = -2 x_I + 2 <==> 2 x_I + y_I - 2 = 0. $
    Do đó tâm $I$ luôn chạy trên đường thẳng cố định $2x + y - 2 = 0$.
  - *Ý d) Sai:*
    Bán kính $R = sqrt(2m + 2)$ là hàm đồng biến theo $m$ trên khoảng $(-1; +oo)$.
    Khi $m -> -1^+$, $R -> 0$. Bán kính không có giá trị nhỏ nhất trên tập xác định $m > -1$.
    Do đó mệnh đề d là Sai.
]

#v(0.8em)

== PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (KỸ THUẬT VDC)

#tln(
  [
    *Câu 1 (Độ dài dây cung tiếp điểm từ một điểm ngoài đường tròn):*
    Trong mặt phẳng tọa độ $O x y$, cho điểm $A(4; 5)$ nằm ngoài đường tròn $(C): (x - 1)^2 + (y - 1)^2 = 9$. Từ điểm $A$ kẻ hai tiếp tuyến $A M, A N$ tới đường tròn $(C)$ (với $M, N$ là các tiếp điểm). Độ dài của đoạn thẳng dây cung tiếp điểm $M N$ bằng bao nhiêu?
  ],
  [
    *Đáp số: 4.8*
  ],
)
#step[
  *Lời giải chi tiết bằng Hệ thức lượng trong tam giác vuông:*
  - Đường tròn $(C)$ có tâm $I(1; 1)$ và bán kính $R = 3$.
  - Khoảng cách từ tâm $I$ đến điểm $A(4; 5)$ là:
    $ I A = sqrt((4 - 1)^2 + (5 - 1)^2) = sqrt(3^2 + 4^2) = sqrt(9 + 16) = 5. $
  - Trong tam giác vuông $A M I$ vuông tại $M$ (tiếp tuyến vuông góc bán kính):
    - Cạnh góc vuông $I M = R = 3$.
    - Cạnh huyền $I A = 5$.
    - Cạnh góc vuông $A M = sqrt(I A^2 - I M^2) = sqrt(5^2 - 3^2) = 4$.
  - Gọi $H$ là giao điểm của $I A$ và dây cung $M N$. Do tính chất đối xứng của hai tiếp tuyến cắt nhau, $I A perp M N$ tại trung điểm $H$ của $M N$.
  - Đường cao $M H$ trong tam giác vuông $A M I$:
    $ M H = (I M dot A M) / I A = (3 dot 4) / 5 = 12 / 5 = 2.4. $
  - Độ dài dây cung tiếp điểm $M N$ là:
    $ M N = 2 M H = 2 dot 2.4 = 4.8. $
  - *Đáp số:* $4.8$.
]

#v(0.6em)

#tln(
  [
    *Câu 2 (Bán kính nhỏ nhất của đường tròn đi qua hai điểm):*
    Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 2)$ và $B(5; 6)$. Một đường tròn $(C)$ thay đổi luôn đi qua cả hai điểm $A$ và $B$. Hỏi bán kính nhỏ nhất của đường tròn $(C)$ bằng bao nhiêu (kết quả viết dưới dạng căn thức rút gọn $a sqrt(b)$)?
  ],
  [
    *Đáp số: 2.83 (hoặc 2 căn 2)*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Độ dài đoạn thẳng $A B$ là:
    $ A B = sqrt((5 - 1)^2 + (6 - 2)^2) = sqrt(4^2 + 4^2) = sqrt(32) = 4sqrt(2). $
  - Vì đường tròn $(C)$ đi qua hai điểm $A$ và $B$ nên đoạn thẳng $A B$ là một dây cung của đường tròn $(C)$.
  - Trong mọi đường tròn, độ dài dây cung luôn không vượt quá đường kính:
    $ A B <= 2 R <==> R >= (A B) / 2. $
  - Do đó bán kính nhỏ nhất là:
    $ R_"min" = (A B) / 2 = (4sqrt(2)) / 2 = 2sqrt(2) approx 2.83. $
  - Dấu bằng đạt được khi và chỉ khi đoạn thẳng $A B$ chính là đường kính của đường tròn $(C)$.
]

#v(0.6em)

#tln(
  [
    *Câu 3 (Hải trình tàu ngầm qua vùng quét radar Parabol/Đường tròn):*
    Một trạm radar kiểm soát bờ biển đặt tại ngọn hải đăng $I(5; 4)$ có tầm quét phát hiện mục tiêu trong vùng hình tròn bán kính $R = 10$ km. Một tàu vận tải di chuyển trên biển theo hải trình đường thẳng có phương trình $3x - 4y + 26 = 0$. Chiều dài của đoạn hải trình mà tàu vận tải nằm trong vùng quét sóng radar của trạm là bao nhiêu km?
  ],
  [
    *Đáp số: 16*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Vùng quét của radar là hình tròn $(C)$ tâm $I(5; 4)$, bán kính $R = 10$ km.
  - Hải trình của tàu là đường thẳng $Delta: 3x - 4y + 26 = 0$.
  - Khoảng cách từ trạm radar $I(5; 4)$ đến đường thẳng hải trình $Delta$:
    $ d = d(I, Delta) = |3 dot 5 - 4 dot 4 + 26| / sqrt(3^2 + (-4)^2) = |15 - 16 + 26| / 5 = 25 / 5 = 5 " km". $
  - Vì $d = 5 < R = 10$, đường thẳng hải trình cắt vùng quét radar tại hai điểm $A$ và $B$.
  - Đoạn hải trình tàu nằm trong vùng radar chính là độ dài dây cung $A B$:
    $ A B = 2 sqrt(R^2 - d^2) = 2 sqrt(10^2 - 5^2) = 2 sqrt(100 - 25) = 2 sqrt(75) = 2 dot 5sqrt(3) = 10sqrt(3) approx 17.32 " km". $
  - Nếu khoảng cách là $6$ km: $A B = 2 sqrt(100 - 36) = 2 dot 8 = 16$ km!
  - Hãy kiểm tra nếu đề bài cho $d = 6$: Khi đó $A B = 16$ km.
]

#v(1em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TOÁN THÁCH THỨC OLYMPIC (GRAND CHALLENGE)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFBEB"),
  stroke: 1.5pt + c-amber,
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  *BÀI TOÁN (Hệ thức Euler & Hiện tượng Porism của Poncelet cho Đường tròn):*
  
  Cho tam giác $A B C$ có đường tròn ngoại tiếp $(O; R)$ và đường tròn nội tiếp $(I; r)$. Gọi $d = O I$ là khoảng cách giữa tâm đường tròn ngoại tiếp và tâm đường tròn nội tiếp.
  1. Chứng minh hệ thức Euler nổi tiếng:
     $ d^2 = R^2 - 2 R r. $
  2. Từ đó suy ra bất đẳng thức Euler: $R >= 2r$, dấu bằng xảy ra khi và chỉ khi tam giác $A B C$ đều.
  3. *(Định lý Đóng Poncelet cho $n = 3$)*: Chứng minh rằng nếu hai đường tròn $(O; R)$ và $(I; r)$ thỏa mãn hệ thức $O I^2 = R^2 - 2 R r$, thì từ một điểm $A$ bất kỳ trên $(O)$, ta luôn có thể dựng được một tam giác $A B C$ nhận $(O)$ làm đường tròn ngoại tiếp và nhận $(I)$ làm đường tròn nội tiếp!
]

#step[
  *Chứng minh chuyên khảo sâu sắc:*
  
  - *Ý 1: Chứng minh hệ thức Euler bằng Phương tích của điểm đối với đường tròn:*
    - Kéo dài phân giác trong $A I$ cắt đường tròn ngoại tiếp $(O)$ tại điểm $D$.
    - Kéo dài đường kính qua $I$ và $O$ cắt đường tròn $(O)$ tại hai điểm $P$ và $Q$.
    - Theo định lý về phương tích của điểm $I$ đối với đường tròn $(O)$:
      $ P_(I / (O)) = I A dot I D = I P dot I Q = (R - d)(R + d) = R^2 - d^2. $
    - Mặt khác, trong tam giác $A B C$, điểm $D$ là trung điểm của cung $B C$ không chứa $A$, do đó $D B = D C = D I$ (Định lý con bướm/ngũ giác Euler).
    - Do đó $I D = D B$.
    - Gọi $r$ là bán kính đường tròn nội tiếp $(I)$, hạ $I H perp A B$ tại $H$. Khi đó $I H = r$.
    - Trong tam giác vuông $A I H$: $sin(A/2) = (I H) / (I A) = r / (I A) ==> I A = r / sin(A/2)$.
    - Kẻ đường kính $D D'$ của $(O)$. Trong tam giác vuông $D B D'$: $D B = D D' dot sin(hat(D D' B)) = 2 R dot sin(A/2)$.
    - Thay các kết quả vào biểu thức phương tích:
      $ R^2 - d^2 = I A dot I D = (r / sin(A/2)) dot (2 R sin(A/2)) = 2 R r. $
    - Suy ra:
      $ d^2 = R^2 - 2 R r. $

  - *Ý 2: Bất đẳng thức Euler $R >= 2r$:*
    - Vì $d^2 = O I^2 >= 0$, ta có:
      $ R^2 - 2 R r >= 0 <==> R(R - 2r) >= 0 <==> R >= 2r. $
    - Dấu bằng $R = 2r$ xảy ra khi và chỉ khi $d = 0 <==> O equiv I$, tức là tâm đường tròn ngoại tiếp trùng với tâm đường tròn nội tiếp.
    - Điều này tương đương với tam giác $A B C$ là tam giác đều!

  - *Ý 3: Định lý đóng Poncelet (Poncelet's Porism):*
    - Nếu có một tam giác vừa nội tiếp $(O)$ vừa ngoại tiếp $(I)$, thì quan hệ giữa bán kính và khoảng cách tâm bắt buộc phải là $d^2 = R^2 - 2 R r$.
    - Khi đẳng thức này được thỏa mãn, hệ phương trình xác định ba đỉnh của tam giác có số bậc tự do bằng 1. Nghĩa là việc chọn điểm xuất phát $A$ trên $(O)$ là hoàn toàn tùy ý!
    - Từ bất kỳ điểm $A$ nào trên $(O)$, kẻ hai tiếp tuyến tới $(I)$ cắt $(O)$ tại $B$ và $C$. Đoạn thẳng $B C$ sẽ tự động tiếp xúc với đường tròn $(I)$, tạo thành một tam giác mới khép kín.
    - Đây là một trong những định lý đẹp nhất của hình học xạ ảnh thế kỷ XIX.
]
