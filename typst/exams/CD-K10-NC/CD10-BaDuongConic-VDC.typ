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
  stroke: (bottom: 2pt + rgb("881337")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("881337"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("BE123C")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("BE123C"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("FB7185")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("FB7185"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("BE123C")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Ba đường Cônic (Rose - Crimson)
#let c-rose-dark = rgb("881337")
#let c-rose = rgb("BE123C")
#let c-rose-light = rgb("FB7185")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-emerald = rgb("059669")
#let c-bg-rose = rgb("FFF1F2")
#let c-border = rgb("FFE4E6")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-rose,
    stroke: 1.5pt + c-rose,
    radius: 8pt,
    width: 100%,
    inset: (x: 15pt, y: 12pt),
  )[
    #text(fill: c-rose-dark, size: 11pt, weight: "bold")[BỘ GIÁO ÁN VẬN DỤNG CAO TOÁN 10 — CHUYÊN ĐỀ CHUYÊN SÂU] \
    #v(4pt)
    #text(fill: c-rose, size: 16pt, weight: "black")[CHUYÊN ĐỀ 10: BÀI TẬP VẬN DỤNG – VẬN DỤNG CAO BA ĐƯỜNG CÔNIC]\
    #v(3pt)
    #text(fill: rgb("4B5563"), size: 10pt, style: "italic")[
      Định nghĩa thống nhất Tiêu điểm - Đường chuẩn, Tính chất quang học phản xạ, Quỹ đạo thiên văn & Định lý Monge
    ]
  ]
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
// LỜI NÓI ĐẦU & TƯ TƯỞNG SƯ PHẠM
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-rose),
  inset: 12pt,
  radius: (right: 6pt),
  width: 100%,
)[
  *Khởi nguyên Hình học của Ba đường Cônic & Sự thống trị trong Thiên văn học:*
  
  Hơn 2200 năm trước, Apollonius xứ Perga đã viết bộ đại toàn thư _Conics_, chứng minh rằng khi một mặt phẳng cắt một mặt nón tròn xoay hai đáy, tùy thuộc vào góc nghiêng của mặt phẳng so với trục hình nón mà ta thu được ba đường cong kỳ diệu: *Elip*, *Parabol* và *Hyperbol*. 
  
  Đến thế kỷ XVII, Johannes Kepler phát hiện Định luật 1: Các hành tinh quay quanh Mặt Trời theo quỹ đạo Elip. Isaac Newton tiếp tục chứng minh bằng giải tích cơ học rằng dưới tác dụng của lực hấp dẫn nghịch đảo bình phương khoảng cách, mọi vật thể trong vũ trụ đều chuyển động theo một trong ba đường cônic:
  - Cơ năng $E < 0$: Quỹ đạo Elip (Hành tinh, vệ tinh nhân tạo bay theo quỹ đạo khép kín).
  - Cơ năng $E = 0$: Quỹ đạo Parabol (Tốc độ thoát ly vũ trụ cấp 2, sao chổi bay một lần rồi thoát mãi mãi).
  - Cơ năng $E > 0$: Quỹ đạo Hyperbol (Thiên thể ngoài hệ mặt trời bay qua rồi rời đi với tốc độ siêu thoát).
  
  Trong chương trình Toán 10 và các kỳ thi HSG, Chuyên đề Ba đường Cônic là đỉnh cao hình học giải tích bậc hai:
  1. *Định nghĩa thống nhất Tiêu điểm - Đường chuẩn*: Tỉ số khoảng cách $M F / d(M, Delta) = e$ (Tâm sai $e$).
  2. *Tính chất quang học phản xạ & Ứng dụng y học*: Phòng thì thầm (Whispering Gallery), máy tán sỏi thận Lithotripter không cần phẫu thuật, kính thiên văn viễn vọng phản xạ kép Cassegrain.
  3. *Hệ thống định vị sóng vô tuyến LORAN*: Ứng dụng tính chất hiệu khoảng cách không đổi $|M F_1 - M F_2| = 2a$ của Hyperbol.
  4. *Đường tròn Monge*: Quỹ tích các điểm nhìn đường cônic dưới một góc vuông $90^circle$.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. HỆ THỐNG ĐỊNH NGHĨA & TÍNH CHẤT TOÀN DIỆN
// ══════════════════════════════════════════════════════════════

== 1. Bảng so sánh phương trình chính tắc của Ba đường Cônic

#table(
  columns: (2.2fr, 2.8fr, 2.8fr, 2.2fr),
  fill: (col, row) => if row == 0 { c-rose } else if calc.even(row) { rgb("FFF1F2") } else { none },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  inset: 6pt,
  stroke: 0.5pt + rgb("CBD5E0"),
  [#text(fill: white, weight: "bold")[Yếu tố hình học]],
  [#text(fill: white, weight: "bold")[Đường Elip ($e < 1$)]],
  [#text(fill: white, weight: "bold")[Đường Hyperbol ($e > 1$)]],
  [#text(fill: white, weight: "bold")[Đường Parabol ($e = 1$)]],

  [*Phương trình chính tắc*],
  [$x^2/a^2 + y^2/b^2 = 1$ \ ($a > b > 0$)],
  [$x^2/a^2 - y^2/b^2 = 1$ \ ($a > 0, b > 0$)],
  [$y^2 = 2 p x$ \ ($p > 0$)],

  [*Quan hệ tham số*],
  [$a^2 = b^2 + c^2$],
  [$c^2 = a^2 + b^2$],
  [$p$ là tham số tiêu],

  [*Tọa độ tiêu điểm*],
  [$F_1(-c; 0), F_2(c; 0)$],
  [$F_1(-c; 0), F_2(c; 0)$],
  [$F(p/2; 0)$],

  [*Tâm sai $e$*],
  [$e = c / a < 1$],
  [$e = c / a > 1$],
  [$e = 1$],

  [*Đường chuẩn $Delta$*],
  [$x = plus.minus a / e = plus.minus a^2 / c$],
  [$x = plus.minus a / e = plus.minus a^2 / c$],
  [$x = -p / 2$],

  [*Bán kính qua tiêu*],
  [$r_1 = a + e x, r_2 = a - e x$ \ ($r_1 + r_2 = 2a$)],
  [$r_1 = |a + e x|, r_2 = |a - e x|$ \ ($|r_1 - r_2| = 2a$)],
  [$r = x + p / 2$],

  [*Đường tiệm cận*],
  [Không có],
  [$y = plus.minus b / a x$],
  [Không có],
)

#v(0.6em)

== 2. Tính chất Quang học & Ứng dụng Y học Máy tán sỏi thận Lithotripter

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ Elip bán trục lớn a = 3, bán trục bé b = 2
    let a = 3.0
    let b = 2.0
    let c = calc.sqrt(a * a - b * b) // approx 2.236

    // Đường Elip
    let pts = ()
    let i = 0
    while i <= 60 {
      let phi = i * 360deg / 60
      let x = a * calc.cos(phi)
      let y = b * calc.sin(phi)
      pts.push((x, y))
      i = i + 1
    }
    line(..pts, stroke: 1.8pt + c-rose)

    // Trục đối xứng
    line((-3.8, 0), (3.8, 0), stroke: 0.7pt + rgb("94A3B8"), mark: (end: "stealth"))
    line((0, -2.5), (0, 2.5), stroke: 0.7pt + rgb("94A3B8"), mark: (end: "stealth"))

    // Hai tiêu điểm F1 và F2
    circle((-c, 0), radius: 2.5pt, fill: c-blue)
    content((-c, -0.35), text(fill: c-blue, weight: "bold")[$F_1$ (Nguồn phát sóng)])

    circle((c, 0), radius: 2.5pt, fill: c-red)
    content((c, -0.35), text(fill: c-red, weight: "bold")[$F_2$ (Vị trí viên sỏi)])

    // Một điểm phản xạ M trên thành Elip
    let m_phi = 55deg
    let mx = a * calc.cos(m_phi)
    let my = b * calc.sin(m_phi)
    circle((mx, my), radius: 2.5pt, fill: c-emerald)
    content((mx + 0.3, my + 0.2), text(fill: c-emerald, weight: "bold")[$M$])

    // Tia sóng âm phát từ F1 tới M rồi hội tụ tại F2
    line((-c, 0), (mx, my), stroke: 1.4pt + c-blue, mark: (end: "stealth"))
    line((mx, my), (c, 0), stroke: 1.4pt + c-red, mark: (end: "stealth"))

    // Tiếp tuyến tại M
    let tx = -a * calc.sin(m_phi)
    let ty = b * calc.cos(m_phi)
    line((mx - 0.7 * tx, my - 0.7 * ty), (mx + 0.7 * tx, my + 0.7 * ty), stroke: (paint: rgb("64748B"), dash: "dashed", thickness: 0.8pt))

    content((0, 2.8), text(fill: c-rose-dark, weight: "bold", size: 9pt)[
      Nguyên lý phản xạ: Mọi sóng từ $F_1$ đều dội vào thành Elip và hội tụ chính xác tại $F_2$!
    ])
  })
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BÀI TẬP MA TRẬN 2025: VẬN DỤNG & VẬN DỤNG CAO
// ══════════════════════════════════════════════════════════════

== PHẦN I: CÂU HỎI TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN

#tn(
  [
    *Câu 1 (VDC - Thiên văn học & Quỹ đạo vệ tinh quanh Trái Đất):*
    Một vệ tinh nhân tạo bay theo quỹ đạo Elip quanh Trái Đất với tâm Trái Đất đặt tại một tiêu điểm $F_1$. Khoảng cách từ vệ tinh đến bề mặt Trái Đất ở điểm gần nhất (cận điểm) là $h_1 = 400$ km và ở điểm xa nhất (viễn điểm) là $h_2 = 1200$ km. Biết bán kính Trái Đất là $R_0 = 6400$ km. Tâm sai $e$ của quỹ đạo vệ tinh bằng bao nhiêu?
  ],
  (
    [$0.08$],
    True([$0.0556$ (xấp xỉ $4/72 = 1/18$)]),
    [$0.125$],
    [$0.025$],
  ),
)
#step[
  *Mô hình hóa toán học quỹ đạo Elip:*
  - Gọi bán trục lớn của quỹ đạo Elip là $a$ và tiêu cự là $2c$.
  - Tiêu điểm $F_1$ là tâm Trái Đất.
  - Khoảng cách từ tâm Trái Đất đến cận điểm (điểm gần nhất trên quỹ đạo):
    $ r_"min" = a - c = R_0 + h_1 = 6400 + 400 = 6800 " km". $
  - Khoảng cách từ tâm Trái Đất đến viễn điểm (điểm xa nhất trên quỹ đạo):
    $ r_"max" = a + c = R_0 + h_2 = 6400 + 1200 = 7600 " km". $
  - Cộng hai phương trình:
    $ 2a = 6800 + 7600 = 14400 ==> a = 7200 " km". $
  - Trừ hai phương trình:
    $ 2c = 7600 - 6800 = 800 ==> c = 400 " km". $
  - Tâm sai $e$ của quỹ đạo Elip là:
    $ e = c / a = 400 / 7200 = 4 / 72 = 1 / 18 approx 0.0556. $
  - Quỹ đạo vệ tinh rất gần hình tròn (tâm sai nhỏ $e approx 0.056$).
]

#v(0.5em)

#tn(
  [
    *Câu 2 (VDC - Hệ thống định vị vô tuyến hàng hải LORAN):*
    Hai trạm phát tín hiệu vô tuyến $A$ và $B$ đặt cách nhau một khoảng $200$ km. Một con tàu biển nhận tín hiệu từ hai trạm và đo được độ chênh lệch thời gian nhận tín hiệu từ $A$ và $B$ tương ứng với độ chênh lệch khoảng cách là $120$ km (khoảng cách từ tàu đến $A$ luôn lớn hơn khoảng cách từ tàu đến $B$ là $120$ km). Chọn hệ trục tọa độ $O x y$ có gốc $O$ là trung điểm của $A B$, trục $O x$ trùng với đường thẳng $A B$. Phương trình quỹ đạo chuyển động của con tàu là:
  ],
  (
    [Elip: $x^2 / 10000 + y^2 / 6400 = 1$],
    True([Một nhánh Hyperbol: $x^2 / 3600 - y^2 / 6400 = 1$ với $x > 0$]),
    [Hyperbol: $x^2 / 6400 - y^2 / 3600 = 1$],
    [Parabol: $y^2 = 120 x$],
  ),
)
#step[
  *Lời giải chi tiết:*
  - Theo định nghĩa đường Hyperbol: Tập hợp các điểm $M$ có hiệu khoảng cách tới hai tiêu điểm $A, B$ cố định bằng một hằng số $2a$:
    $ M A - M B = 2a = 120 " km" ==> a = 60 " km". $
  - Khoảng cách giữa hai trạm phát sóng là tiêu cự:
    $ 2c = A B = 200 " km" ==> c = 100 " km". $
  - Ta có hệ thức liên hệ của Hyperbol:
    $ b^2 = c^2 - a^2 = 100^2 - 60^2 = 10000 - 3600 = 6400 ==> b = 80 " km". $
  - Phương trình chính tắc của Hyperbol là:
    $ x^2 / 3600 - y^2 / 6400 = 1. $
  - Vì con tàu luôn ở gần trạm $B(100; 0)$ hơn trạm $A(-100; 0)$ ($M A > M B$), tàu chỉ chuyển động trên nhánh bên phải của Hyperbol, tương ứng với điều kiện $x >= a = 60 > 0$.
]

#v(0.5em)

#tn(
  [
    *Câu 3 (VDC - Điều kiện tiếp xúc của đường thẳng với Elip):*
    Trong mặt phẳng tọa độ $O x y$, cho Elip $(E): x^2 / 9 + y^2 / 4 = 1$. Đường thẳng $Delta: y = x + m$ tiếp xúc với $(E)$ khi và chỉ khi tham số $m$ nhận giá trị là:
  ],
  (
    [$m = plus.minus 5$],
    True([$m = plus.minus sqrt(13)$]),
    [$m = plus.minus sqrt(5)$],
    [$m = plus.minus 13$],
  ),
)
#step[
  *Lời giải chi tiết bằng Điều kiện tiếp xúc chính tắc:*
  - Đường thẳng $Delta: x - y + m = 0$ có dạng $A x + B y + C = 0$ với $A = 1, B = -1, C = m$.
  - Elip có bán trục lớn $a = 3 ==> a^2 = 9$ và bán trục bé $b = 2 ==> b^2 = 4$.
  - Điều kiện cần và đủ để đường thẳng $A x + B y + C = 0$ tiếp xúc với Elip $x^2/a^2 + y^2/b^2 = 1$ là:
    $ a^2 A^2 + b^2 B^2 = C^2. $
  - Thay số vào điều kiện tiếp xúc:
    $ 9 dot 1^2 + 4 dot (-1)^2 = m^2 <==> 9 + 4 = m^2 <==> m^2 = 13 <==> m = plus.minus sqrt(13). $
  - *Cách 2 (Bằng phương pháp thế đại số):*
    - Thay $y = x + m$ vào phương trình Elip:
      $ x^2 / 9 + (x + m)^2 / 4 = 1 <==> 4 x^2 + 9(x^2 + 2m x + m^2) = 36 $
      $ <==> 13 x^2 + 18m x + (9m^2 - 36) = 0. $
    - Đường thẳng tiếp xúc Elip khi và chỉ khi phương trình bậc hai có nghiệm kép ($Delta' = 0$):
      $ Delta' = (9m)^2 - 13(9m^2 - 36) = 81m^2 - 117m^2 + 468 = -36m^2 + 468 = 0 $
      $ <==> 36m^2 = 468 <==> m^2 = 468 / 36 = 13 <==> m = plus.minus sqrt(13). $
]

#v(0.8em)

== PHẦN II: CÂU HỎI ĐÚNG / SAI (4 Ý TOÀN DIỆN)

#ds(
  [
    *Câu 1 (Khảo sát toàn diện tính chất hình học của Elip):*
    Trong mặt phẳng tọa độ $O x y$, xét đường Elip $(E): x^2 / 25 + y^2 / 16 = 1$.
  ],
  (
    True([a) Độ dài trục lớn bằng $10$, độ dài trục bé bằng $8$ và tiêu cự bằng $6$.]),
    True([b) Hai tiêu điểm của $(E)$ là $F_1(-3; 0)$ và $F_2(3; 0)$, tâm sai $e = 3/5 = 0.6$.]),
    True([c) Hai đường chuẩn của $(E)$ có phương trình là $x = plus.minus 25/3$.]),
    False([d) Diện tích của hình chữ nhật cơ sở ngoại tiếp Elip $(E)$ bằng $40$.]),
  ),
)
#step[
  *Lời giải chi tiết từng mệnh đề:*
  - *Ý a) Đúng:* $a^2 = 25 ==> a = 5$, do đó trục lớn $2a = 10$.
    $b^2 = 16 ==> b = 4$, do đó trục bé $2b = 8$.
    $c = sqrt(a^2 - b^2) = sqrt(25 - 16) = sqrt(9) = 3$, do đó tiêu cự $2c = 6$.
  - *Ý b) Đúng:* Tiêu điểm $F_1(-c; 0) = (-3; 0)$ và $F_2(c; 0) = (3; 0)$.
    Tâm sai $e = c / a = 3 / 5 = 0.6$.
  - *Ý c) Đúng:* Phương trình hai đường chuẩn của Elip:
    $ x = plus.minus a / e = plus.minus 5 / (3/5) = plus.minus 25 / 3. $
  - *Ý d) Sai:* Hình chữ nhật cơ sở ngoại tiếp Elip được giới hạn bởi 4 đường thẳng $x = plus.minus a = plus.minus 5$ và $y = plus.minus b = plus.minus 4$.
    Kích thước của hình chữ nhật này là $2a = 10$ và $2b = 8$.
    Diện tích hình chữ nhật cơ sở là:
    $ S = 2a dot 2b = 10 dot 8 = 80 $ (không phải $40$). Mệnh đề d là Sai.
]

#v(0.8em)

== PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (KỸ THUẬT VDC)

#tln(
  [
    *Câu 1 (Bán kính qua tiêu của điểm thuộc Elip):*
    Trong mặt phẳng tọa độ $O x y$, cho Elip $(E): x^2 / 25 + y^2 / 9 = 1$ với hai tiêu điểm $F_1, F_2$ (với $x_(F_1) < x_(F_2)$). Cho điểm $M$ thuộc $(E)$ có hoành độ $x_M = 2.5$. Tính độ dài bán kính qua tiêu $M F_1$.
  ],
  [
    *Đáp số: 7*
  ],
)
#step[
  *Lời giải chi tiết bằng Công thức Bán kính qua tiêu:*
  - Ta có $a^2 = 25 ==> a = 5$, $b^2 = 9 ==> b = 3$.
  - Tiêu cự: $c = sqrt(a^2 - b^2) = sqrt(25 - 9) = 4$.
  - Tâm sai: $e = c / a = 4 / 5 = 0.8$.
  - Công thức bán kính qua tiêu của điểm $M(x_M; y_M) in (E)$:
    $ M F_1 = a + e x_M $
    $ M F_2 = a - e x_M $
  - Thay số $a = 5, e = 0.8, x_M = 2.5$:
    $ M F_1 = 5 + 0.8 dot 2.5 = 5 + 2 = 7. $
  - Kiểm tra lại: $M F_2 = 5 - 0.8 dot 2.5 = 5 - 2 = 3$.
  - Tổng $M F_1 + M F_2 = 7 + 3 = 10 = 2a$ (hoàn toàn khớp với định nghĩa Elip!).
  - *Đáp số:* $7$.
]

#v(0.6em)

#tln(
  [
    *Câu 2 (Ứng dụng Y học Máy tán sỏi thận Lithotripter):*
    Một máy tán sỏi thận không phẫu thuật sử dụng một buồng phản xạ có mặt cắt là nửa đường Elip. Bộ phận phát xung kích đặt tại tiêu điểm $F_1$, viên sỏi thận trong cơ thể người bệnh được định vị chính xác tại tiêu điểm $F_2$. Biết độ dài trục lớn của buồng phản xạ là $2a = 34$ cm và độ dài trục bé là $2b = 16$ cm. Hỏi khoảng cách từ nguồn phát xung kích $F_1$ đến viên sỏi $F_2$ bằng bao nhiêu cm?
  ],
  [
    *Đáp số: 30*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Bán trục lớn của buồng phản xạ Elip là $a = 34 / 2 = 17$ cm.
  - Bán trục bé là $b = 16 / 2 = 8$ cm.
  - Khoảng cách từ tâm đối xứng đến mỗi tiêu điểm là $c$:
    $ c = sqrt(a^2 - b^2) = sqrt(17^2 - 8^2) = sqrt(289 - 64) = sqrt(225) = 15 " cm". $
  - Khoảng cách giữa nguồn phát xung kích $F_1$ và viên sỏi $F_2$ chính là tiêu cự $2c$:
    $ F_1 F_2 = 2c = 2 dot 15 = 30 " cm". $
  - *Đáp số:* $30$ cm.
]

#v(0.6em)

#tln(
  [
    *Câu 3 (Dây cung qua tiêu điểm Parabol - Thông số Latus Rectum):*
    Một chiếc kính thiên văn vô tuyến có chóa phản xạ hình Parabol với phương trình chính tắc $y^2 = 12 x$. Người ta lắp đặt một thanh thu tín hiệu chạy qua tiêu điểm $F$ của Parabol và vuông góc với trục đối xứng của chóa đèn. Chiều dài của thanh thu tín hiệu này (khoảng cách giữa hai giao điểm với Parabol) bằng bao nhiêu?
  ],
  [
    *Đáp số: 12*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Phương trình chính tắc của Parabol: $y^2 = 2 p x$.
  - Ở đây $2 p = 12 ==> p = 6$.
  - Tiêu điểm của Parabol có tọa độ là $F(p/2; 0) = (3; 0)$.
  - Trục đối xứng của Parabol là trục hoành $O x$.
  - Đường thẳng đi qua tiêu điểm $F(3; 0)$ và vuông góc với trục đối xứng có phương trình là $x = 3$.
  - Thay $x = 3$ vào phương trình Parabol:
    $ y^2 = 12 dot 3 = 36 <==> y = plus.minus 6. $
  - Hai đầu mút của thanh thu tín hiệu là $M_1(3; -6)$ và $M_2(3; 6)$.
  - Chiều dài của thanh thu tín hiệu là:
    $ M_1 M_2 = |6 - (-6)| = 12. $
  - *Ghi nhớ kiến thức:* Dây cung qua tiêu điểm vuông góc trục đối xứng được gọi là *Latus Rectum* của Parabol, luôn có độ dài đúng bằng $2p$!
  - *Đáp số:* $12$.
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
  *BÀI TOÁN (Định lý Đường tròn Monge - Director Circle cho Đường Elip):*
  
  Cho đường Elip có phương trình chính tắc $(E): x^2 / a^2 + y^2 / b^2 = 1$ ($a > b > 0$).
  1. Chứng minh rằng điều kiện cần và đủ để đường thẳng $d: y = k x + m$ tiếp xúc với Elip $(E)$ là $m^2 = a^2 k^2 + b^2$.
  2. Từ một điểm $P(x_0; y_0)$ nằm ngoài Elip, ta kẻ được hai tiếp tuyến vuông góc với nhau tới Elip. Chứng minh rằng tập hợp điểm $P$ là một đường tròn đồng tâm với Elip có phương trình:
     $ x^2 + y^2 = a^2 + b^2. $
  Đường tròn này được gọi là *Đường tròn Monge* (hay Đường tròn chỉ phương - Director Circle) mang tên nhà toán học lừng danh Gaspard Monge.
]

#step[
  *Chứng minh chuyên khảo sâu sắc:*
  
  - *Ý 1: Điều kiện tiếp xúc của đường thẳng có hệ số góc $k$:*
    Đường thẳng $d: k x - y + m = 0$ có các hệ số $A = k, B = -1, C = m$.
    Theo định lý tiếp xúc đường cônic:
    $ a^2 A^2 + b^2 B^2 = C^2 <==> a^2 k^2 + b^2 (-1)^2 = m^2 <==> m^2 = a^2 k^2 + b^2. $

  - *Ý 2: Thiết lập phương trình tiếp tuyến từ điểm $P(x_0; y_0)$:*
    - Một đường thẳng đi qua điểm $P(x_0; y_0)$ có hệ số góc $k$ có phương trình:
      $ y - y_0 = k(x - x_0) <==> y = k x + (y_0 - k x_0). $
    - Đường thẳng này tiếp xúc với Elip $(E)$ khi và chỉ khi tung độ gốc $m = y_0 - k x_0$ thỏa mãn điều kiện tiếp xúc:
      $ (y_0 - k x_0)^2 = a^2 k^2 + b^2 $
      $ <==> y_0^2 - 2 k x_0 y_0 + k^2 x_0^2 = a^2 k^2 + b^2 $
      $ <==> (x_0^2 - a^2) k^2 - 2 x_0 y_0 k + (y_0^2 - b^2) = 0. $
    - Đây là một phương trình bậc hai đối với hệ số góc $k$!
    - Để từ $P$ kẻ được hai tiếp tuyến vuông góc nhau đến Elip, phương trình bậc hai trên phải có hai nghiệm phân biệt $k_1, k_2$ thỏa mãn điều kiện vuông góc:
      $ k_1 dot k_2 = -1. $
    - Áp dụng định lý Viète cho phương trình bậc hai theo biến $k$:
      $ k_1 dot k_2 = (y_0^2 - b^2) / (x_0^2 - a^2). $
    - Ta có đẳng thức:
      $ (y_0^2 - b^2) / (x_0^2 - a^2) = -1 <==> y_0^2 - b^2 = -(x_0^2 - a^2) = -x_0^2 + a^2 $
      $ <==> x_0^2 + y_0^2 = a^2 + b^2. $
    - Đối với các tiếp tuyến thẳng đứng song song trục tung (không có hệ số góc $k$), các tiếp điểm nằm tại các đỉnh $(plus.minus a; 0)$ và $(0; plus.minus b)$, bốn giao điểm vuông góc là $(plus.minus a; plus.minus b)$ cũng thỏa mãn $x_0^2 + y_0^2 = a^2 + b^2$.
    - *Kết luận:* Tập hợp tất cả các điểm nhìn Elip dưới góc vuông $90^circle$ tạo thành một đường tròn hoàn hảo tâm $O$, bán kính $R = sqrt(a^2 + b^2)$ — chính là *Đường tròn Monge*!
]
