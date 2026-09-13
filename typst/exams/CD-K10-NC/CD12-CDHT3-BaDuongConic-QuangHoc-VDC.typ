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
  stroke: (left: 3pt + rgb("E11D48")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("E11D48"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("BE123C")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Ba đường Conic & Quang học
#let c-rose-dark = rgb("881337")
#let c-rose = rgb("BE123C")
#let c-pink = rgb("E11D48")
#let c-blue = rgb("2563EB")
#let c-teal = rgb("0D9488")
#let c-red = rgb("DC2626")
#let c-amber = rgb("D97706")
#let c-purple = rgb("7C3AED")
#let c-bg-rose = rgb("FFF1F2")
#let c-border = rgb("FECDD3")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-rose,
    stroke: (
      left: 6pt + c-rose-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-rose-dark)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: BA ĐƯỜNG CONIC TỔNG QUÁT,\
      TÍNH CHẤT QUANG HỌC PHẢN XẠ & ỨNG DỤNG THỰC TIỄN
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("4B5563"))[
      Chuyên đề học tập 3 Toán 10 (GDPT 2018) -- Tâm sai $e$, đường chuẩn, tiếp tuyến Conic,\
      định lý quang học phản xạ Elip-Parabol-Hyperbol, kính viễn vọng Cassegrain & định vị LORAN
    ]
  ]
]

#v(1em)

= PHẦN I: CƠ SỞ LÝ THUYẾT & ĐỊNH LÝ HÌNH HỌC NÂNG CAO

== 1. Định nghĩa tổng quát của Ba đường Conic qua Tâm sai và Đường chuẩn
Cho một điểm cố định $F$ (gọi là *tiêu điểm*) và một đường thẳng cố định $Delta$ không đi qua $F$ (gọi là *đường chuẩn*). Tập hợp các điểm $M$ trên mặt phẳng sao cho tỉ số khoảng cách từ $M$ đến $F$ và từ $M$ đến $Delta$ bằng một hằng số dương $e$ ($e > 0$, gọi là *tâm sai*):
$ (d(M, F))/(d(M, Delta)) = e $
được gọi là một *đường conic*. Cụ thể:
- Nếu $0 < e < 1$: Conic là một *Elip* ($"E"$).
- Nếu $e = 1$: Conic là một *Parabol* ($"P"$).
- Nếu $e > 1$: Conic là một *Hyperbol* ($"H"$).

== 2. Bán kính qua tiêu và Đường chuẩn trong hệ tọa độ chính tắc
#align(center)[
  #table(
    columns: (2.8cm, 3.8cm, 3.8cm, 3.8cm),
    inset: (x: 6pt, y: 6pt),
    align: center,
    stroke: 0.5pt + c-rose,
    fill: (col, row) => if row == 0 { c-bg-rose } else { white },
    [*Đặc trưng*], [*Elip (E)*], [*Hyperbol (H)*], [*Parabol (P)*],
    [PT chính tắc], [$x^2/a^2 + y^2/b^2 = 1$], [$x^2/a^2 - y^2/b^2 = 1$], [$y^2 = 2 p x$ ($p > 0$)],
    [Tâm sai $e$], [$e = c/a < 1$ ($c^2 = a^2 - b^2$)], [$e = c/a > 1$ ($c^2 = a^2 + b^2$)], [$e = 1$],
    [Tiêu điểm], [$F_1(-c, 0), F_2(c, 0)$], [$F_1(-c, 0), F_2(c, 0)$], [$F(p/2, 0)$],
    [Đường chuẩn], [$Delta_1: x = -a/e, Delta_2: x = a/e$], [$Delta_1: x = -a/e, Delta_2: x = a/e$], [$Delta: x = -p/2$],
    [Bán kính qua tiêu], [$cases(M F_1 = a + e x, M F_2 = a - e x)$], [$cases(M F_1 = |a + e x|, M F_2 = |a - e x|)$], [$M F = x + p/2$],
  )
]

== 3. Phương trình tiếp tuyến và điều kiện tiếp xúc của Conic
- *Phương trình tiếp tuyến tại điểm $M(x_0, y_0)$ thuộc Conic*:
  + Elip: $(x_0 x)/a^2 + (y_0 y)/b^2 = 1$.
  + Hyperbol: $(x_0 x)/a^2 - (y_0 y)/b^2 = 1$.
  + Parabol: $y_0 y = p(x + x_0)$.
- *Điều kiện tiếp xúc*: Đường thẳng $d: A x + B y + C = 0$ tiếp xúc với:
  + Elip $(E)$ khi và chỉ khi: $a^2 A^2 + b^2 B^2 = C^2$.
  + Hyperbol $(H)$ khi và chỉ khi: $a^2 A^2 - b^2 B^2 = C^2$.
  + Parabol $(P)$ khi và chỉ khi: $p B^2 = 2 A C$.

== 4. Định lý Quang học phản xạ (Optical Reflection Laws)
- *Định lý quang học của Elip*: Pháp tuyến tại điểm $M$ thuộc elip là phân giác trong của góc $hat(F_1 M F_2)$, tiếp tuyến là phân giác ngoài. Do đó: Mọi tia sáng xuất phát từ tiêu điểm $F_1$, sau khi phản xạ tại gương elip, đều truyền thẳng tới tiêu điểm $F_2$.
- *Định lý quang học của Parabol*: Tiếp tuyến tại điểm $M$ thuộc parabol là phân giác của góc tạo bởi bán kính qua tiêu $M F$ và đường thẳng qua $M$ song song với trục đối xứng. Do đó: Mọi tia sáng xuất phát từ tiêu điểm $F$ khi phản xạ qua gương parabol đều biến thành chùm tia song song với trục đối xứng (ứng dụng đèn pha, chảo radar). Ngược lại, chùm tia song song tới gương parabol đều hội tụ tại tiêu điểm $F$.
- *Định lý quang học của Hyperbol*: Tiếp tuyến tại điểm $M$ thuộc hyperbol là đường phân giác trong của góc $hat(F_1 M F_2)$. Do đó: Tia sáng hướng về tiêu điểm $F_1$ khi phản xạ qua gương hyperbol sẽ phản xạ theo phương có đường kéo dài đi qua tiêu điểm $F_2$.

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    [
      #cetz.canvas(length: 0.85cm, {
        import cetz.draw: *
        // Gương Parabol hội tụ
        content((1.2, 2.2), text(size: 8.5pt, weight: "bold", fill: c-rose-dark)[Gương Parabol: Tia song song hội tụ tại $F$])
        // Trục đối xứng
        line((-0.8, 0), (3.5, 0), stroke: 0.6pt + gray)
        // Đường chuẩn
        line((-0.5, -1.8), (-0.5, 1.8), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
        content((-0.5, -2.0), text(size: 6.5pt, fill: gray)[Đường chuẩn])
        
        // Parabol y^2 = 2px -> x = y^2 / 2
        let pts = ()
        let n = 20
        for i in range(-n, n + 1) {
          let y = i * 1.6 / n
          let x = (y * y) / 2
          pts.push((x, y))
        }
        line(..pts, stroke: 2pt + c-rose)

        // Tiêu điểm F(0.5, 0)
        circle((0.5, 0), radius: 2.5pt, fill: c-rose-dark)
        content((0.5, -0.35), text(size: 7.5pt, weight: "bold", fill: c-rose-dark)[$F$])

        // 3 tia tới song song và phản xạ
        for y in (-1.1, 0.5, 1.1) {
          let x = (y * y) / 2
          line((3.2, y), (x, y), mark: (end: ">"), stroke: 1pt + c-amber)
          line((x, y), (0.5, 0), mark: (end: ">"), stroke: 1.2pt + c-red)
        }
      })
    ],
    [
      #cetz.canvas(length: 0.85cm, {
        import cetz.draw: *
        // Gương Elip: Tiêu điểm F1 sang F2
        content((0, 2.2), text(size: 8.5pt, weight: "bold", fill: c-rose-dark)[Gương Elip: Tia từ $F_1$ phản xạ tới $F_2$])
        // Trục lớn và trục nhỏ
        line((-2.7, 0), (2.7, 0), stroke: 0.6pt + gray)
        line((0, -1.6), (0, 1.6), stroke: 0.6pt + gray)

        // Đường Elip
        circle((0, 0), radius: (2.4, 1.4), stroke: 2pt + c-purple)

        // Tiêu điểm F1, F2
        let c_val = 1.95
        circle((-c_val, 0), radius: 2.5pt, fill: c-purple)
        circle((c_val, 0), radius: 2.5pt, fill: c-purple)
        content((-c_val, -0.35), text(size: 7.5pt, weight: "bold", fill: c-purple)[$F_1$])
        content((c_val, -0.35), text(size: 7.5pt, weight: "bold", fill: c-purple)[$F_2$])

        // Điểm M trên elip
        let M = (0.8, 1.32)
        circle(M, radius: 2pt, fill: c-red)
        content((0.8, 1.55), text(size: 7.5pt, weight: "bold", fill: c-red)[$M$])

        // Tia từ F1 tới M và phản xạ tới F2
        line((-c_val, 0), M, mark: (end: ">"), stroke: 1.2pt + c-amber)
        line(M, (c_val, 0), mark: (end: ">"), stroke: 1.2pt + c-red)

        // Điểm N khác trên elip
        let N = (-0.9, -1.29)
        circle(N, radius: 2pt, fill: c-red)
        line((-c_val, 0), N, mark: (end: ">"), stroke: 1pt + c-amber)
        line(N, (c_val, 0), mark: (end: ">"), stroke: 1pt + c-red)
      })
    ]
  )
]

== 5. Nguồn gốc lịch sử & Các hướng mở rộng cao cấp

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("881337"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-rose-dark)[a) Nguồn gốc lịch sử: Từ Apollonius đến Kepler và Isaac Newton:]
  - *Menaechmus (thế kỷ 4 TCN)* và *Apollonius xứ Perga (thế kỷ 3 TCN)*: Đặt tên và khám phá các tính chất thuần túy hình học của ba đường conic. Suốt 1800 năm sau đó, các đường conic chỉ được xem như một trò chơi trí tuệ trừu tượng không có ứng dụng thực tiễn.
  - *Johannes Kepler (1571--1630)*: Năm 1609, sau 8 năm giải mã dữ liệu quan sát sao Hỏa của Tycho Brahe, Kepler phát hiện chấn động: Trái Đất và các hành tinh *không chuyển động theo đường tròn hoàn hảo* như niềm tin của Aristotle suốt 2000 năm, mà chuyển động theo *quỹ đạo Elip với Mặt Trời là một tiêu điểm* (*Định luật 1 Kepler*).
  - *Isaac Newton (1642--1727)*: Trong *Principia* (1687), Newton chứng minh bằng toán học giải tích rằng: Dưới tác dụng của lực hấp dẫn tỉ lệ nghịch với bình phương khoảng cách $F = G frac(M m, r^2)$, mọi vật thể trong vũ trụ *bắt buộc phải chuyển động theo một đường Conic*:
    + $e < 1$: Quỹ đạo Elip (các hành tinh, mặt trăng, vệ tinh viễn thông).
    + $e = 1$: Quỹ đạo Parabol (vận tốc vũ trụ cấp hai, sao chổi chỉ ghé qua Hệ Mặt Trời đúng một lần).
    + $e > 1$: Quỹ đạo Hyperbol (tiểu hành tinh bay tự do ngoài không gian liên sao như 'Oumuamua năm 2017).

  #v(0.4em)
  #text(weight: "bold", fill: c-rose-dark)[b) Hướng mở rộng 1: Kính thiên văn không gian James Webb (JWST) & Hệ quang học 3 gương Conic:]
  - Kính viễn vọng không gian James Webb trị giá 10 tỷ USD của NASA không sử dụng thấu kính khúc xạ thông thường mà sử dụng hệ thống quang học phản xạ gồm *3 gương conic (Three-Mirror Anastigmat - TMA)*:
    + Gương sơ cấp đường kính $"6,5" "m"$ là một gương *Parabol* thu nhận ánh sáng hồng ngoại từ rìa vũ trụ sơ khai.
    + Gương thứ cấp lồi là một gương *Hyperbol* phản xạ chùm tia hội tụ về phía gương tam cấp.
    + Gương tam cấp là một gương *Elip* hiệu chỉnh dẹt để triệt tiêu hoàn toàn hiện tượng quang sai cầu và hiện tượng hôn mê (Coma), đem lại hình ảnh thiên hà cách xa 13,5 tỷ năm ánh sáng sắc nét tuyệt đối.

  #v(0.4em)
  #text(weight: "bold", fill: c-rose-dark)[c) Hướng mở rộng 2: Thấu kính hấp dẫn Einstein (Gravitational Lensing):]
  - Thuyết tương đối rộng của Albert Einstein (1915) chỉ ra rằng lực hấp dẫn thực chất là sự uốn cong của không thời gian. Khi ánh sáng từ một thiên hà xa xôi đi qua gần một lỗ đen hoặc cụm thiên hà khổng lồ, tia sáng bị bẻ cong theo một đường Hyperbol trắc địa, tạo nên hiện tượng thấu kính hấp dẫn sinh ra các *Vòng Einstein (Einstein Rings)* hoặc bốn ảnh đối xứng của cùng một chuẩn tinh (*Chữ thập Einstein - Einstein Cross*).
]

#v(1em)

= PHẦN II: 4 DẠNG TOÁN VẬN DỤNG CAO VÀ KỸ THUẬT GIẢI

== Dạng 1: Viết tiếp tuyến Conic & Cực trị hình học (Khoảng cách, Diện tích)
- Cho hyperbol $(H): x^2/a^2 - y^2/b^2 = 1$ với hai tiệm cận $y = plus.minus b/a x$.
- *Tính chất vàng*: Tiếp tuyến tại điểm bất kỳ $M$ thuộc $(H)$ cắt hai tiệm cận tại $P$ và $Q$. Khi đó:
  + $M$ là trung điểm của đoạn thẳng $P Q$.
  + Diện tích tam giác $O P Q$ luôn không đổi: $S_(Delta O P Q) = a b$.

== Dạng 2: Bài toán quang học & Đường truyền tia sáng qua hệ thống gương
- Kỹ thuật: Sử dụng tính chất đối xứng qua tiếp tuyến hoặc bảo toàn phương truyền tia sáng qua các tiêu điểm liên hợp.

== Dạng 3: Mô hình định vị hàng hải Hyperbol LORAN
- Nguyên lý: Hai trạm phát tín hiệu vô tuyến tại hai tiêu điểm $F_1, F_2$ phát sóng đồng bộ. Một con tàu ở vị trí $M$ đo hiệu thời gian nhận sóng $Delta t = t_1 - t_2$.
- Khi đó hiệu khoảng cách $M F_1 - M F_2 = c dot Delta t = 2a$ không đổi ($c$ là vận tốc ánh sáng). Con tàu buộc phải nằm trên một nhánh của Hyperbol có tiêu cự $2c = F_1 F_2$.
- Giao điểm của hai nhánh Hyperbol (từ hai cặp trạm phát khác nhau) xác định duy nhất vị trí con tàu.

== Dạng 4: Thiết kế kỹ thuật -- Kính thiên văn phản xạ Cassegrain
- Hệ gồm 2 gương: Gương chính là gương Parabol lõm ($y^2 = 2 p x$), gương phụ là gương Hyperbol lồi.
- Tiêu điểm của Parabol trùng với tiêu điểm xa của Hyperbol. Tia sáng tới song song phản xạ qua parabol hướng tới tiêu điểm $F_1$, gặp gương hyperbol phản xạ hội tụ về tiêu điểm gần $F_2$ đặt ống ngắm thị kính.

#v(1em)

= PHẦN III: BÀI TẬP MẪU CÓ LỜI GIẢI SƯ PHẠM CHI TIẾT

// ── BÀI MẪU 1 ─────────────────────────────────────────────────
#tl(
  [*(Tính chất diện tích không đổi của tiếp tuyến Hyperbol)*\
  Cho hyperbol $(H): x^2/a^2 - y^2/b^2 = 1$ ($a, b > 0$). Gọi $d$ là tiếp tuyến của $(H)$ tại một điểm tùy ý $M(x_0, y_0)$ thuộc $(H)$ ($y_0 != 0$).
  1. Chứng minh rằng tiếp tuyến $d$ luôn cắt hai đường tiệm cận $Delta_1: y = b/a x$ và $Delta_2: y = -b/a x$ tại hai điểm phân biệt $P$ và $Q$.
  2. Chứng minh rằng điểm tiếp xúc $M$ là trung điểm của đoạn thẳng $P Q$.
  3. Chứng minh diện tích tam giác $O P Q$ ($O$ là gốc tọa độ) là một hằng số không phụ thuộc vào vị trí của điểm $M$.],
  loigiai: [
    #step[
      *1. Tìm tọa độ giao điểm $P$ và $Q$:* \
      Phương trình tiếp tuyến của $(H)$ tại $M(x_0, y_0)$ là:
      $ d: (x_0 x)/a^2 - (y_0 y)/b^2 = 1 $
      Giao điểm $P$ của $d$ với tiệm cận $Delta_1: y = b/a x$:
      $ (x_0 x_P)/a^2 - (y_0 (b/a x_P))/b^2 = 1 <=> x_P (x_0/a^2 - y_0/(a b)) = 1 <=> x_P (b x_0 - a y_0)/(a^2 b) = 1 $
      Suy ra: $x_P = (a^2 b)/(b x_0 - a y_0)$ và $y_P = b/a x_P = (a b^2)/(b x_0 - a y_0)$. \
      Tương tự, giao điểm $Q$ của $d$ với tiệm cận $Delta_2: y = -b/a x$:
      $ x_Q = (a^2 b)/(b x_0 + a y_0), quad y_Q = -b/a x_Q = -(a b^2)/(b x_0 + a y_0). $
    ]

    #step[
      *2. Chứng minh $M$ là trung điểm $P Q$:* \
      Tọa độ trung điểm $I$ của đoạn thẳng $P Q$ có hoành độ:
      $ x_I = (x_P + x_Q)/2 = (a^2 b)/2 (1/(b x_0 - a y_0) + 1/(b x_0 + a y_0)) = (a^2 b)/2 dot (2 b x_0)/(b^2 x_0^2 - a^2 y_0^2) $
      Vì $M(x_0, y_0) in (H)$ nên $x_0^2/a^2 - y_0^2/b^2 = 1 <=> b^2 x_0^2 - a^2 y_0^2 = a^2 b^2$. Do đó:
      $ x_I = (a^2 b^2 x_0)/(a^2 b^2) = x_0 $
      Tương tự:
      $ y_I = (y_P + y_Q)/2 = (a b^2)/2 (1/(b x_0 - a y_0) - 1/(b x_0 + a y_0)) = (a b^2)/2 dot (2 a y_0)/(a^2 b^2) = y_0 $
      Vậy $I equiv M$, tức là $M$ chính là trung điểm của đoạn thẳng $P Q$.
    ]

    #step[
      *3. Chứng minh diện tích tam giác $O P Q$ không đổi:* \
      Diện tích tam giác $O P Q$ tính theo công thức định thức tọa độ hai vectơ $vec(O P) = (x_P, y_P)$ và $vec(O Q) = (x_Q, y_Q)$:
      $ S_(Delta O P Q) = 1/2 |x_P y_Q - x_Q y_P| $
      Thay tọa độ $P, Q$ vào:
      $ x_P y_Q - x_Q y_P = (a^2 b)/(b x_0 - a y_0) dot (-(a b^2))/(b x_0 + a y_0) - (a^2 b)/(b x_0 + a y_0) dot (a b^2)/(b x_0 - a y_0) $
      $ = (-2 a^3 b^3)/(b^2 x_0^2 - a^2 y_0^2) = (-2 a^3 b^3)/(a^2 b^2) = -2 a b $
      Do đó:
      $ S_(Delta O P Q) = 1/2 |-2 a b| = a b $
      *Kết luận:* Diện tích tam giác $O P Q$ luôn bằng $a b$ (không phụ thuộc vào vị trí của điểm $M$).
    ]
  ]
)

#v(0.8em)

// ── BÀI MẪU 2 ─────────────────────────────────────────────────
#tl(
  [*(Ứng dụng quang học Elip -- Nguyên lý máy tán sỏi thận Lithotripter)*\
  Trong y học, máy tán sỏi thận không xâm lấn (Lithotripter) sử dụng một buồng phản xạ có mặt cắt là một nửa đường elip $(E)$. Nguồn phát xung siêu âm được đặt tại tiêu điểm $F_1$, viên sỏi thận của bệnh nhân được định vị trùng với tiêu điểm $F_2$.
  Biết buồng phản xạ có chiều dài trục lớn $2a = 40 "cm"$ và chiều rộng trục bé $2b = 24 "cm"$.
  1. Hãy lập phương trình chính tắc của elip $(E)$.
  2. Tính khoảng cách từ vị trí phát xung siêu âm $F_1$ đến vị trí viên sỏi $F_2$.
  3. Chứng minh rằng mọi tia sóng xung kích phát ra từ $F_1$ sau khi phản xạ qua thành buồng elip đều tới viên sỏi $F_2$ cùng một lúc (quãng đường đi bằng nhau).],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    // Nửa elip
    arc((3, 0), radius: (3, 1.8), start: 0deg, stop: 180deg, stroke: 1.5pt + c-rose-dark)
    line((-3, 0), (3, 0), stroke: (dash: "dashed", paint: gray))
    // Tiêu điểm
    circle((-2.4, 0), radius: 0.12, fill: c-red)
    circle((2.4, 0), radius: 0.12, fill: c-blue)
    content((-2.4, -0.4), text(size: 8pt, fill: c-red)[$F_1$ (Nguồn sóng)])
    content((2.4, -0.4), text(size: 8pt, fill: c-blue)[$F_2$ (Sỏi thận)])
    // Tia phản xạ
    line((-2.4, 0), (0, 1.8), stroke: 1.2pt + c-rose, mark: (end: "stealth", fill: c-rose))
    line((0, 1.8), (2.4, 0), stroke: 1.2pt + c-rose, mark: (end: "stealth", fill: c-rose))
    content((0, 2.1), text(size: 8pt)[Điểm phản xạ $M$])
  }),
  loigiai: [
    #step[
      *1. Lập phương trình chính tắc của elip:* \
      Ta có $2a = 40 => a = 20 "cm"$. Chiều rộng trục bé $2b = 24 => b = 12 "cm"$. \
      Phương trình chính tắc của elip là:
      $ x^2 / 20^2 + y^2 / 12^2 = 1 <=> x^2 / 400 + y^2 / 144 = 1 $
    ]
    #step[
      *2. Tính khoảng cách hai tiêu điểm:* \
      Tiêu cự $2c$ được tính bởi:
      $ c^2 = a^2 - b^2 = 20^2 - 12^2 = 400 - 144 = 256 => c = 16 "cm" $
      Khoảng cách giữa nguồn phát sóng và viên sỏi là:
      $ F_1 F_2 = 2c = 2 dot 16 = 32 "cm" $
    ]
    #step[
      *3. Chứng minh các tia sóng đến đồng thời:* \
      Theo định nghĩa elip, với mọi điểm $M$ trên buồng phản xạ elip, tổng khoảng cách từ hai tiêu điểm đến $M$ là hằng số:
      $ M F_1 + M F_2 = 2a = 40 "cm" $
      Do sóng siêu âm truyền trong môi trường đồng nhất với vận tốc không đổi $v$, thời gian sóng truyền từ nguồn $F_1$, phản xạ tại $M$ rồi tới sỏi $F_2$ là:
      $ t = (M F_1 + M F_2)/v = (2a)/v = 40/v quad text("(không đổi)") $
      Vì thời gian truyền sóng từ mọi hướng phản xạ là hoàn toàn như nhau, toàn bộ năng lượng sóng siêu âm sẽ hội tụ cùng một lúc tại $F_2$, tạo ra áp lực cực đại tán vỡ sỏi mà không làm tổn thương các mô mềm xung quanh.
    ]
  ]
)

#v(1em)

= PHẦN IV: BÀI TẬP TỰ LUYỆN VDC ĐẲNG CẤP OLYMPIC & TST

== 1. Trắc nghiệm nhiều lựa chọn (4 phương án)

// CÂU 1
#tn(
  [*(Đường tròn Monge / Director Circle của Elip)*\
  Cho elip $(E): x^2/25 + y^2/9 = 1$. Tập hợp tất cả các điểm $P(x_0, y_0)$ trên mặt phẳng tọa độ sao cho từ $P$ kẻ được hai tiếp tuyến vuông góc với nhau tới elip $(E)$ là một đường tròn có tâm tại gốc tọa độ $O$. Bán kính $R$ của đường tròn này bằng:],
  (
    [$R = 4$],
    True([$R = sqrt(34)$]),
    [$R = 5$],
    [$R = sqrt(16) = 4$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Thiết lập phương trình tiếp tuyến vuông góc:* \
      Giả sử qua $P(x_0, y_0)$ kẻ được hai tiếp tuyến vuông góc tới $(E)$. \
      Xét đường thẳng $d$ đi qua $P$ có hệ số góc $k$: $y - y_0 = k(x - x_0) <=> k x - y + (y_0 - k x_0) = 0$. \
      Điều kiện để $d$ tiếp xúc với elip $x^2/a^2 + y^2/b^2 = 1$ ($a = 5, b = 3$):
      $ a^2 A^2 + b^2 B^2 = C^2 <=> a^2 k^2 + b^2 (-1)^2 = (y_0 - k x_0)^2 $
      $ <=> 25 k^2 + 9 = y_0^2 - 2 k x_0 y_0 + k^2 x_0^2 <=> (x_0^2 - 25) k^2 - 2 x_0 y_0 k + (y_0^2 - 9) = 0. $
      Để tồn tại hai tiếp tuyến vuông góc nhau, phương trình bậc hai theo $k$ phải có hai nghiệm phân biệt $k_1, k_2$ thỏa mãn $k_1 k_2 = -1$. \
      Theo định lý Viète:
      $ k_1 k_2 = frac(y_0^2 - 9, x_0^2 - 25) = -1 <=> y_0^2 - 9 = -(x_0^2 - 25) <=> x_0^2 + y_0^2 = 25 + 9 = 34. $
      Vậy quỹ tích của điểm $P$ là đường tròn Monge có bán kính $R = sqrt(34)$.
    ]
  ]
)

// CÂU 2
#tn(
  [*(Dây cung qua tiêu điểm Focal Chord của Parabol)*\
  Cho parabol $(P): y^2 = 2 p x$ với tham số tiêu $p = 4$. Một đường thẳng $Delta$ bất kỳ đi qua tiêu điểm $F$ của parabol và cắt $(P)$ tại hai điểm phân biệt $A$ và $B$. Biết độ dài đoạn thẳng $A F = 3$. Độ dài đoạn thẳng $B F$ bằng:],
  (
    [$4$],
    True([$6$]),
    [$5$],
    [$9/2$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Định lý tổng nghịch đảo khoảng cách qua tiêu:* \
      Xét trong hệ tọa độ cực với gốc tại tiêu điểm $F$, trục cực là trục đối xứng của parabol hướng từ đỉnh sang tiêu điểm. \
      Phương trình của parabol trong tọa độ cực là: $r(theta) = frac(p, 1 - cos theta)$. \
      Giả sử điểm $A$ ứng với góc $theta$, khi đó điểm $B$ nằm đối diện qua tiêu điểm $F$ nên ứng với góc $theta + pi$:
      $ A F = r(theta) = frac(p, 1 - cos theta), quad B F = r(theta + pi) = frac(p, 1 - cos(theta + pi)) = frac(p, 1 + cos theta). $
      Lấy nghịch đảo và cộng lại:
      $ frac(1, A F) + frac(1, B F) = frac(1 - cos theta, p) + frac(1 + cos theta, p) = frac{2}{p}. $
      Thay $p = 4$ và $A F = 3$ vào hệ thức:
      $ frac(1, 3) + frac(1, B F) = frac{2}{4} = frac(1, 2) <=> frac(1, B F) = frac(1, 2) - frac(1, 3) = frac(1, 6) => B F = 6. $
    ]
  ]
)

// CÂU 3
#tn(
  [*(Định lý hình học Poncelet về hai tiếp tuyến cùng kẻ tới Elip)*\
  Từ một điểm $P$ nằm ngoài elip $(E)$ có hai tiêu điểm $F_1, F_2$, người ta kẻ hai tiếp tuyến $P T_1$ và $P T_2$ tiếp xúc với elip lần lượt tại $T_1$ và $T_2$. Mối quan hệ hình học nào sau đây giữa các góc là *luôn đúng* theo Định lý Poncelet?],
  (
    [$hat(F_1 P F_2) = hat(T_1 P T_2)$],
    True([$hat(F_1 P T_1) = hat(F_2 P T_2)$]),
    [$hat(P F_1 T_1) = hat(P F_2 T_2)$],
    [$P T_1 + P T_2 = P F_1 + P F_2$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Nội dung và chứng minh Định lý Poncelet:* \
      - Định lý Poncelet 1: Cho điểm $P$ nằm ngoài đường conic có hai tiêu điểm $F_1, F_2$. Khi kẻ hai tiếp tuyến $P T_1, P T_2$ đến conic, các góc nhìn từ $P$ đến các tiêu điểm và tiếp điểm thỏa mãn tính chất đẳng giác tuyệt đối:
        $ hat(F_1 P T_1) = hat(F_2 P T_2). $
      - Ý nghĩa: Hai đoạn thẳng $P F_1$ và $P F_2$ là các đường đẳng giác trong góc tạo bởi hai tiếp tuyến $hat(T_1 P T_2)$ (tức là phân giác của góc $hat(F_1 P F_2)$ trùng với phân giác của góc $hat(T_1 P T_2)$!).
    ]
  ]
)

// CÂU 4
#tn(
  [*(Dây cung vuông góc qua tiêu điểm Latus Rectum)*\
  Cho elip $(E): x^2/16 + y^2/9 = 1$. Dây cung của $(E)$ đi qua tiêu điểm $F_1$ và vuông góc với trục lớn (gọi là trực tiêu huyền - Latus Rectum) có độ dài bằng:],
  (
    [$9/2$],
    [$3$],
    True([$9/2$]),
    [$18/5$],
  ),
  correct: (3,),
  loigiai: [
    #step[
      *Công thức độ dài trực tiêu huyền:* \
      Ta có $a^2 = 16 => a = 4$, $b^2 = 9 => b = 3$. \
      Tiêu điểm $F_1(-c, 0)$ với $c = sqrt(a^2 - b^2) = sqrt(7)$. \
      Đường thẳng qua $F_1$ vuông góc với trục hoành có phương trình $x = -c$. \
      Thay vào phương trình elip:
      $ frac{(-c)^2}{a^2} + frac{y^2}{b^2} = 1 <=> frac{c^2}{a^2} + frac{y^2}{b^2} = 1 <=> frac{y^2}{b^2} = 1 - frac{c^2}{a^2} = frac{a^2 - c^2}{a^2} = frac{b^2}{a^2} $
      $ <=> y^2 = frac{b^4}{a^2} => y = plus.minus frac{b^2}{a}. $
      Độ dài dây cung trực tiêu huyền là:
      $ L = 2 |y| = frac{2 b^2}{a} = frac{2 dot 9}{4} = frac{9}{2} = "4,5". $
    ]
  ]
)

== 2. Trắc nghiệm Đúng/Sai (Đa ý)

// CÂU ĐÚNG SAI 1
#ds(
  [*(Mặt cầu Dandelin & Nguồn gốc hình học không gian của Ba đường Conic)*\
  Năm 1822, nhà toán học người Bỉ Germinal Dandelin đã tìm ra chứng minh thuần túy hình học không gian tuyệt mỹ cho định nghĩa của elip: Cho một mặt phẳng $(P)$ cắt mặt nón tròn xoay đỉnh $S$ theo một đường cong kín $(E)$. Đặt hai mặt cầu $S_1$ và $S_2$ (gọi là *Mặt cầu Dandelin*) nội tiếp trong mặt nón sao cho: $S_1$ tiếp xúc với mặt phẳng cắt $(P)$ tại $F_1$, $S_2$ tiếp xúc với $(P)$ tại $F_2$; đồng thời $S_1$ tiếp xúc mặt nón dọc theo đường tròn $(C_1)$, $S_2$ tiếp xúc mặt nón dọc theo đường tròn $(C_2)$.],
  (
    True([Với mỗi điểm $M$ tùy ý trên đường cong $(E)$, đoạn tiếp tuyến kẻ từ $M$ đến mặt cầu $S_1$ có độ dài bằng khoảng cách $M F_1$.]),
    True([Đường sinh của mặt nón đi qua $M$ cắt hai đường tròn tiếp xúc $(C_1)$ và $(C_2)$ lần lượt tại $A$ và $B$. Khi đó $M F_1 = M A$ và $M F_2 = M B$.]),
    True([Tổng khoảng cách $M F_1 + M F_2 = M A + M B = A B$ luôn bằng khoảng cách dọc theo đường sinh giữa hai đường tròn tiếp xúc $(C_1)$ và $(C_2)$, là một hằng số không đổi $2a$.]),
    False([Nếu mặt phẳng cắt $(P)$ song song với đúng một đường sinh của hình nón thì hai mặt cầu Dandelin vẫn luôn cùng nằm về một phía của $(P)$ và thiết diện thu được vẫn là một elip có tâm sai $e < 1$.]),
  ),
  loigiai: [
    #step[
      *Chứng minh tuyệt đỉnh của Dandelin:* \
      - *Ý a, b:* Vì $M F_1$ và $M A$ là hai tiếp tuyến cùng kẻ từ điểm $M$ đến mặt cầu $S_1$, theo tính chất các tiếp tuyến của mặt cầu thì độ dài của chúng bằng nhau: $M F_1 = M A$. Tương tự, $M F_2 = M B$ với mặt cầu $S_2$. (Đúng).
      - *Ý c:* Do $M$ nằm giữa $A$ và $B$ trên đường sinh $S A B$, ta có $M A + M B = A B$. Đoạn $A B$ nằm giữa hai đường tròn song song trên mặt nón nên có độ dài không đổi với mọi đường sinh. Do đó $M F_1 + M F_2 = A B = text("hằng số")$. Đây chính là định nghĩa tiêu cự của Elip! (Đúng).
      - *Ý d:* Khi mặt phẳng cắt $(P)$ song song với một đường sinh, thiết diện tạo thành là một *Parabol* ($e = 1$) và chỉ có đúng một mặt cầu Dandelin tiếp xúc với $(P)$. Mệnh đề d khẳng định vẫn là elip là SAI. (Ý d Sai).
    ]
  ]
)

// CÂU ĐÚNG SAI 2
#ds(
  [*(Lý thuyết Cực và Đối cực đối với Hyperbol)*\
  Cho hyperbol $(H): x^2/a^2 - y^2/b^2 = 1$ ($a, b > 0$). Với mỗi điểm $P(x_0, y_0)$ trên mặt phẳng, đường thẳng $d_P$ có phương trình:
  $ frac(x_0 x, a^2) - frac(y_0 y, b^2) = 1 $
  được gọi là *đường đối cực* của cực $P$ đối với $(H)$.],
  (
    True([Nếu điểm $P(x_0, y_0)$ nằm trên hyperbol $(H)$ thì đường đối cực $d_P$ chính là tiếp tuyến của $(H)$ tại $P$.]),
    True([Theo Định lý La Hire: Nếu điểm $P$ nằm trên đường đối cực của điểm $Q$ thì điểm $Q$ cũng nằm trên đường đối cực của điểm $P$.]),
    True([Đường đối cực của tiêu điểm $F_1(-c, 0)$ đối với $(H)$ chính là đường chuẩn tương ứng $Delta_1: x = -a^2/c = -a/e$.]),
    False([Nếu điểm $P$ di động trên đường chuẩn $Delta_1$, đường đối cực $d_P$ luôn luôn đi qua gốc tọa độ $O$ của hyperbol.]),
  ),
  loigiai: [
    #step[
      *Tính chất của Cực và Đối cực:* \
      - *Ý a:* Khi $P in (H)$, phương trình đường đối cực trùng với phương trình tiếp tuyến chính tắc tại $P$. (Đúng).
      - *Ý b:* $P(x_1, y_1)$ thuộc đối cực của $Q(x_2, y_2) <=> frac(x_2 x_1, a^2) - frac(y_2 y_1, b^2) = 1$. Biểu thức này đối xứng với $x_1, x_2$ và $y_1, y_2$, do đó $Q$ cũng thuộc đối cực của $P$. (Đúng - Định lý La Hire).
      - *Ý c:* Với $F_1(-c, 0)$, đường đối cực là $frac(-c x, a^2) - 0 = 1 <=> x = -frac(a^2, c) = -frac(a, e)$, chính là đường chuẩn $Delta_1$. (Đúng).
      - *Ý d:* Điểm $P$ trên $Delta_1$ có hoành độ $x_0 = -a^2/c$. Đường đối cực của $P$ là $frac{(-a^2/c) x, a^2) - frac(y_0 y, b^2) = 1 <=> -frac(x, c) - frac(y_0 y, b^2) = 1$. Khi thay $(x, y) = (-c, 0)$ ta được $-(-c)/c - 0 = 1$ (luôn thỏa mãn!). Do đó đường đối cực của $P$ luôn đi qua *tiêu điểm* $F_1(-c, 0)$, chứ không đi qua gốc tọa độ $O$. (Ý d Sai).
    ]
  ]
)

== 3. Trả lời ngắn

// TLN 1
#tln(
  [*(Bán kính đường tròn Monge của Hyperbol)*\
  Cho hyperbol $(H): x^2/25 - y^2/9 = 1$. Tập hợp tất cả các điểm $P$ trên mặt phẳng sao cho từ $P$ kẻ được hai tiếp tuyến vuông góc với nhau tới hyperbol $(H)$ là một đường tròn có tâm tại gốc tọa độ $O$. Tính bán kính $R$ của đường tròn này.],
  [$4$],
  loigiai: [
    #step[
      *Đường tròn trực giao (Director Circle) của Hyperbol:* \
      Tương tự như elip, xét đường thẳng $y = k x + m$ tiếp xúc với hyperbol $x^2/a^2 - y^2/b^2 = 1$:
      $ a^2 k^2 - b^2 = m^2 $
      Phương trình hai tiếp tuyến qua $P(x_0, y_0)$: $a^2 k^2 - b^2 = (y_0 - k x_0)^2 <=> (x_0^2 - a^2) k^2 - 2 x_0 y_0 k + (y_0^2 + b^2) = 0$. \
      Hai tiếp tuyến vuông góc khi và chỉ khi tích hai nghiệm $k_1 k_2 = -1$:
      $ frac(y_0^2 + b^2, x_0^2 - a^2) = -1 <=> y_0^2 + b^2 = a^2 - x_0^2 <=> x_0^2 + y_0^2 = a^2 - b^2. $
      Với $a^2 = 25, b^2 = 9$, ta có:
      $ R^2 = a^2 - b^2 = 25 - 9 = 16 => R = sqrt(16) = 4. $
    ]
  ]
)

// TLN 2
#tln(
  [*(Định lý Tích khoảng cách từ hai tiêu điểm đến tiếp tuyến Elip)*\
  Cho elip $(E): x^2/25 + y^2/16 = 1$. Gọi $d$ là một tiếp tuyến bất kỳ của $(E)$. Ký hiệu $d_1 = d(F_1, d)$ và $d_2 = d(F_2, d)$ lần lượt là khoảng cách từ hai tiêu điểm $F_1, F_2$ đến đường thẳng $d$. Tính tích số $P = d_1 dot d_2$.],
  [$16$],
  loigiai: [
    #step[
      *Chứng minh đẳng thức tích khoảng cách:* \
      Phương trình tiếp tuyến $d: A x + B y + C = 0$ tiếp xúc $(E)$ thỏa mãn: $a^2 A^2 + b^2 B^2 = C^2$. \
      Hai tiêu điểm là $F_1(-c, 0)$ và $F_2(c, 0)$ với $c^2 = a^2 - b^2$. \
      Khoảng cách từ $F_1, F_2$ đến $d$:
      $ d_1 = frac(|-A c + C|, sqrt(A^2 + B^2)), quad d_2 = frac(|A c + C|, sqrt(A^2 + B^2)). $
      Nhân hai khoảng cách:
      $ d_1 dot d_2 = frac(|C^2 - A^2 c^2|, A^2 + B^2) = frac{|(a^2 A^2 + b^2 B^2) - A^2(a^2 - b^2)|, A^2 + B^2} = frac{|b^2 A^2 + b^2 B^2|, A^2 + B^2} = frac{b^2(A^2 + B^2)}{A^2 + B^2} = b^2. $
      Thay số liệu: $b^2 = 16 => d_1 dot d_2 = 16$.
    ]
  ]
)

== 4. Tự luận Vận dụng cao (Phân hóa sâu)

// TỰ LUẬN 1
#tl(
  [*(Chứng minh Định lý Quang học Elip qua Nguyên lý Fermat & Điểm cực trị)*\
  Cho elip $(E)$ có hai tiêu điểm $F_1, F_2$ và độ dài trục lớn $2a$. Gọi $d$ là tiếp tuyến của $(E)$ tại điểm $M in (E)$.
  1. Chứng minh rằng với mọi điểm $N != M$ nằm trên tiếp tuyến $d$, ta luôn có bất đẳng thức:
     $ N F_1 + N F_2 > M F_1 + M F_2 = 2a. $
     (Nghĩa là điểm tiếp xúc $M$ chính là điểm duy nhất trên tiếp tuyến $d$ làm cực tiểu hóa tổng khoảng cách đến hai tiêu điểm).
  2. Từ kết quả trên, hãy sử dụng phép lấy đối xứng gương để chứng minh rằng tiếp tuyến $d$ là phân giác ngoài của góc $hat(F_1 M F_2)$, và từ đó chứng minh tia sáng phát ra từ $F_1$ sau khi phản xạ tại gương elip $M$ sẽ truyền thẳng tới tiêu điểm $F_2$.],
  loigiai: [
    #step[
      *1. Chứng minh tính chất cực tiểu của điểm tiếp xúc $M$:* \
      - Vì $d$ là tiếp tuyến của elip $(E)$ tại điểm $M$, đường thẳng $d$ chỉ có đúng một điểm chung duy nhất với elip là $M$.
      - Do đó, với mọi điểm $N in d$ và $N != M$, điểm $N$ hoàn toàn nằm ở miền *ngoài* của elip $(E)$.
      - Theo định nghĩa hình học của elip, tập hợp tất cả các điểm nằm trong hoặc trên elip thỏa mãn $X F_1 + X F_2 <= 2a$. Các điểm nằm bên ngoài elip luôn thỏa mãn:
        $ N F_1 + N F_2 > 2a. $
      - Mặt khác, vì $M in (E)$ nên $M F_1 + M F_2 = 2a$.
      - Vậy với mọi $N in d$, ta có $N F_1 + N F_2 ge M F_1 + M F_2$, dấu đẳng thức xảy ra khi và chỉ khi $N equiv M$.
    ]

    #step[
      *2. Chứng minh Định lý quang học bằng phép đối xứng gương:* \
      - Lấy điểm $F'_1$ đối xứng với tiêu điểm $F_1$ qua đường thẳng tiếp tuyến $d$.
      - Khi đó với mọi điểm $N in d$, ta có $N F_1 = N F'_1$. Do đó:
        $ N F_1 + N F_2 = N F'_1 + N F_2. $
      - Theo bất đẳng thức tam giác trong $Delta N F'_1 F_2$:
        $ N F'_1 + N F_2 ge F'_1 F_2. $
      - Dấu đẳng thức xảy ra khi và chỉ khi ba điểm $F'_1, N, F_2$ thẳng hàng (tức là $N$ chính là giao điểm của đoạn thẳng $F'_1 F_2$ với đường thẳng tiếp tuyến $d$).
      - Kết hợp với phần 1 (điểm làm cực tiểu hóa duy nhất là $M$), ta suy ra ba điểm $F'_1, M, F_2$ *thẳng hàng*!
      - Vì $F'_1, M, F_2$ thẳng hàng và $d$ là đường trung trực của $F_1 F'_1$, ta có góc tạo bởi $M F_1$ với tiếp tuyến $d$ bằng góc tạo bởi $M F'_1$ với $d$, và bằng góc đối đỉnh tạo bởi $M F_2$ với $d$:
        $ hat(F_1 M d) = hat(F'_1 M d) = hat(F_2 M d'). $
      - Theo định luật phản xạ ánh sáng (góc tới bằng góc phản xạ), tia sáng truyền từ $F_1$ đến $M$ trên thành gương elip sẽ phản xạ theo phương thẳng hàng với $F'_1 M$, tức là truyền thẳng đến tiêu điểm $F_2$!
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC TRÍ TUỆ ĐỈNH CAO (OLYMPIC & GRAND CHALLENGES)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("0F172A"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC VẬT LÝ VŨ TRỤ: QUỸ ĐẠO CHUYỂN TIẾP HOHMANN TỚI SAO HỎA] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Walter Hohmann 1925 — Cơ học thiên thể quỹ đạo Elip và Bài toán tối ưu nhiên liệu đẩy tên lửa liên hành tinh)]

  #v(0.4em)
  *Đề bài:* Một tàu vũ trụ muốn di chuyển từ Trái Đất đến Sao Hỏa bằng phương án tiêu hao năng lượng tối thiểu (Quỹ đạo chuyển tiếp Hohmann). Coi quỹ đạo chuyển động của Trái Đất và Sao Hỏa quanh Mặt Trời là các đường tròn đồng tâm nằm trong cùng mặt phẳng hoàng đạo:
  - Bán kính quỹ đạo Trái Đất: $r_1 = 1 "AU"$ ($1$ Đơn vị Thiên văn $approx 150$ triệu km).
  - Bán kính quỹ đạo Sao Hỏa: $r_2 = "1,524" "AU"$.
  
  Quỹ đạo chuyển tiếp là một nửa đường Elip có một tiêu điểm đặt tại tâm Mặt Trời, điểm cận nhật (Perihelion) tiếp xúc với quỹ đạo Trái Đất và điểm viễn nhật (Aphelion) tiếp xúc với quỹ đạo Sao Hỏa.
  1. Hãy tính độ dài trục lớn $2a$, bán trục lớn $a$ và tâm sai $e$ của quỹ đạo chuyển tiếp Elip Hohmann này.
  2. Theo Định luật 3 Kepler ($T^2 = a^3$, với $T$ tính bằng năm Trái Đất và $a$ tính bằng AU), hãy tính thời gian hành trình bay một chiều của con tàu từ Trái Đất đến Sao Hỏa (đổi ra ngày và tháng).
  3. Phân tích góc xuất phát (Giai đoạn cửa sổ phóng - Launch Window) và tại sao các cơ quan hàng không vũ trụ (NASA, ESA) chỉ có thể phóng tàu tới Sao Hỏa mỗi $26$ tháng một lần!
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Mặt trời tại gốc tọa độ (Tiêu điểm F1)
    circle((0, 0), radius: 0.18, fill: rgb("F59E0B"), stroke: 1pt + rgb("D97706"))
    content((0, -0.4), text(fill: rgb("B45309"), weight: "bold", size: 8.5pt)[Mặt Trời])
    
    // Quỹ đạo Trái Đất: đường tròn r1 = 1.0 (màu xanh lá)
    circle((0, 0), radius: 1.0, stroke: (dash: "dashed", paint: rgb("10B981"), thickness: 1pt))
    content((-0.7, 0.8), text(fill: rgb("059669"), size: 8pt)[Quỹ đạo Trái Đất ($r_1 = 1$ AU)])
    
    // Điểm phóng tại Trái Đất: T(-1.0, 0)
    circle((-1.0, 0), radius: 0.1, fill: rgb("2563EB"))
    content((-1.0, 0.3), text(fill: rgb("1D4ED8"), weight: "bold", size: 8pt)[Khởi hành (Trái Đất)])

    // Quỹ đạo Sao Hỏa: đường tròn r2 = 1.524 (màu đỏ)
    circle((0, 0), radius: 1.524, stroke: (dash: "dashed", paint: rgb("EF4444"), thickness: 1pt))
    content((1.2, 1.2), text(fill: rgb("DC2626"), size: 8pt)[Quỹ đạo Sao Hỏa ($r_2 = "1,524"$ AU)])

    // Điểm đến tại Sao Hỏa: H(1.524, 0)
    circle((1.524, 0), radius: 0.1, fill: rgb("B91C1C"))
    content((1.524, 0.3), text(fill: rgb("B91C1C"), weight: "bold", size: 8pt)[Đến đích (Sao Hỏa)])
    
    // Quỹ đạo chuyển tiếp Elip Hohmann: nửa elip phía dưới từ (-1.0, 0) đến (1.524, 0)
    line(
      (-1.0, 0), (-0.95, -0.42), (-0.8, -0.76), (-0.5, -1.04), (-0.1, -1.21),
      (0.262, -1.235),
      (0.6, -1.21), (1.0, -1.04), (1.3, -0.76), (1.48, -0.42), (1.524, 0),
      stroke: 1.8pt + rgb("8B5CF6")
    )
    content((0.262, -1.5), text(fill: rgb("7C3AED"), weight: "bold", size: 8.5pt)[Quỹ đạo Elip Hohmann ($2a = r_1 + r_2$)])
  })
]

#v(0.4em)

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 3pt + rgb("D97706")),
  inset: (x: 12pt, y: 10pt),
  radius: 3pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC & ĐẲNG CẤP CƠ HỌC THIÊN THỂ KEPLER:] \
  
  #step[
    *1. Xác định các thông số hình học của Elip chuyển tiếp Hohmann:* \
    - Trục lớn của quỹ đạo elip nối từ điểm cận nhật (quỹ đạo Trái Đất) sang điểm viễn nhật (quỹ đạo Sao Hỏa):
      $ 2a = r_1 + r_2 = 1 + "1,524" = "2,524" "AU". $
    - Bán trục lớn:
      $ a = "2,524" / 2 = "1,262" "AU". $
    - Khoảng cách từ tâm Mặt Trời (tiêu điểm $F_1$) đến tâm Elip $O_E$:
      $ c = a - r_1 = "1,262" - 1 = "0,262" "AU". $
    - Tâm sai của quỹ đạo chuyển tiếp Elip:
      $ e = c / a = "0,262" / "1,262" approx "0,2076". $
    - Bán trục bé của Elip:
      $ b = sqrt(a^2 - c^2) = sqrt((("1,262")^2 - ("0,262")^2)) = sqrt(("1,524")) approx "1,2345" "AU". $
  ]
  
  #step[
    *2. Tính thời gian hành trình theo Định luật 3 Kepler:* \
    Theo Định luật thứ ba của Johannes Kepler:
    Bình phương chu kỳ quay quanh Mặt Trời tỉ lệ thuận với lập phương bán trục lớn:
    $ T^2 = a^3. $
    Với $a = "1,262" "AU"$, chu kỳ của toàn bộ quỹ đạo Elip là:
    $ T = a^(3/2) = ("1,262")^(3/2) = sqrt((("1,262")^3)) approx sqrt(("2,0099")) approx "1,4177" "năm Trái Đất". $
    Vì hành trình từ Trái Đất đến Sao Hỏa chỉ là *đúng một nửa vòng Elip* (từ cận nhật đến viễn nhật), thời gian bay $t_("bay")$ là:
    $ t_("bay") = T / 2 = ("1,4177") / 2 approx "0,7088" "năm Trái Đất". $
    Đổi ra tháng và ngày:
    - Tính theo tháng: $"0,7088" times 12 approx "8,51" "tháng" approx 8 "tháng rưỡi"$.
    - Tính theo ngày: $"0,7088" times "365,25" approx 259 "ngày"$. \
    *Kết luận:* Tàu vũ trụ mất đúng khoảng $259$ ngày (khoảng $8$ tháng rưỡi) để bay tới Sao Hỏa!
  ]
  
  #step[
    *3. Phân tích Cửa sổ phóng (Launch Window) & Chu kỳ giao hội:* \
    - Trong $259$ ngày tàu bay, Sao Hỏa vẫn tiếp tục di chuyển trên quỹ đạo của nó. Để khi tàu bay đến điểm viễn nhật thì Sao Hỏa cũng vừa vặn tới đúng vị trí đó, góc lệch tương đối giữa Trái Đất và Sao Hỏa lúc phóng phải đạt chính xác $44^circ$.
    - Tốc độ góc của Trái Đất ($omega_1 = 360^circ / 1 "năm"$) nhanh hơn Sao Hỏa ($omega_2 = 360^circ / "1,881" "năm"$).
    - Chu kỳ giao hội (Synodic Period) giữa hai hành tinh:
      $ 1/S = 1/T_1 - 1/T_2 = 1/1 - 1/"1,881" = "0,881"/"1,881" => S = "1,881"/"0,881" approx "2,135" "năm" approx 26 "tháng". $
    - Do đó, cứ sau mỗi $26$ tháng (khoảng $2$ năm $2$ tháng), vị trí tương quan lý tưởng này mới lặp lại một lần! Đây chính là lý do vì sao mọi sứ mệnh Sao Hỏa trong lịch sử nhân loại (như Perseverance, Hope, Tianwen-1) đều phải phóng cùng vào những "cửa sổ vàng" xác định trước nhiều năm.
  ]
]


