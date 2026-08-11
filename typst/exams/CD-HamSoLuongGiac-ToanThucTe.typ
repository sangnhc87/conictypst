#import "../sang-exam.typ": *
#import "../template.typ": *
#import "../bbt.typ": bbbt, bbt-opt
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("1565C0"), rgb("1976D2"), angle: 0deg),
  stroke: none,
  inset: (x: 15pt, y: 10pt),
  radius: 6pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("E67E22")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("E67E22"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("1E8449"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Màu chủ đề ─────────────────────────────────────────────
#let eco-navy = rgb("1B2A4A")
#let eco-amber = rgb("E67E22")
#let eco-green = rgb("1E8449")
#let eco-red = rgb("C0392B")
#let eco-gold = rgb("B7950B")
#let eco-teal = rgb("148F77")

// ─── Hộp Lý Thuyết (nền sáng xanh) ─────────────────────────────
#let eco-box(body) = block(
  fill: rgb("EEF4FB"),
  stroke: (left: 4pt + rgb("1565C0"), rest: 0.8pt + rgb("AACCE0")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

// ─── Hộp Nhận Xét (nền sáng, viền trái cam) ─────────────────
#let note-box(title: "📌 Nhận Xét", body) = block(
  fill: rgb("FFFBF2"),
  stroke: (left: 4pt + eco-amber, rest: 0.6pt + rgb("FAD7A0")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: eco-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// ─── Hộp Kết Luận (vàng nhạt) ────────────────────────────────
#let ans-box(body) = block(
  fill: rgb("FFFDE7"),
  stroke: (left: 4pt + eco-gold, rest: 0.6pt + rgb("F9E79F")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: rgb("7D6608"), weight: "bold")[✅ Kết Luận]
  #v(0.3em)
  #body
]

// ─── Hộp Cảnh Báo (đỏ nhạt) ─────────────────────────────────
#let warn-box(body) = block(
  fill: rgb("FDF0EC"),
  stroke: (left: 4pt + eco-red, rest: 0.6pt + rgb("F5B7B1")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: eco-red, weight: "bold")[⚠️ Chú Ý — Bẫy Thường Gặp]
  #v(0.3em)
  #body
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D1B2A"), rgb("1B3A6B"), rgb("0D1B2A"), angle: 135deg),
    radius: 12pt,
    inset: (x: 20pt, y: 22pt),
  )[
    #text(fill: eco-amber, size: 10pt, weight: "bold", tracking: 3pt)[
      CHUYÊN ĐỀ ỨNG DỤNG THỰC TẾ
    ]
    #v(0.6em)
    #text(fill: white, size: 22pt, weight: "bold")[HÀM SỐ LƯỢNG GIÁC LỚP 11]
    #v(0.4em)
  ]
]

#note-box(title: "MỤC TIÊU HỌC TẬP")[
  - Nhận diện và thiết lập các mô hình hàm số lượng giác từ các bài toán thực tế (Chuyển động đu quay, con lắc, thủy triều, dao động nhiệt độ, huyết áp...).

  - Tìm chu kỳ, biên độ, giá trị lớn nhất (GTLN) và giá trị nhỏ nhất (GTNN) của các mô hình hàm lượng giác.

  - Phân tích và dự báo các đại lượng thông qua phương trình lượng giác.

  - Vận dụng thành thạo để xử lý hệ thống bài tập theo chuẩn định dạng thi mới của Bộ Giáo dục & Đào tạo.
]

== A. CÁC MÔ HÌNH TRỌNG ĐIỂM VÀ BÀI TẬP MẪU

=== 1. Mô hình Đu quay (Ferris Wheel)

#eco-box[
    *Phân tích Mô hình Đu quay*
    
    Chuyển động của một cabin trên đu quay khổng lồ (Ferris Wheel) thường được mô tả bởi một hàm lượng giác có dạng:
    $ h(t) = a cos(omega t + phi) + c quad "hoặc" quad h(t) = a sin(omega t + phi) + c $
    Trong đó:
    - $t$: Thời gian (phút hoặc giây).

    - $h(t)$: Độ cao của cabin tại thời điểm $t$ so với mặt đất.

    - $a$: Biên độ dao động (bằng đúng bán kính $R$ của đu quay).

    - $c$: Chiều cao tâm của đu quay so với mặt đất (vị trí cân bằng).

    - Chu kỳ $T = (2pi)/omega$: Thời gian để đu quay quay hết đúng một vòng.
    
    *Giá trị lớn nhất và nhỏ nhất:*

    - Chiều cao lớn nhất (đỉnh đu quay): $h_"max" = c + a$

    - Chiều cao thấp nhất (đáy đu quay, nơi lên cabin): $h_"min" = c - a$
]

*Ví dụ 1:* Một chiếc đu quay có bán kính $15$ m, tâm của vòng quay ở độ cao $20$ m so với mặt đất. Thời gian thực hiện mỗi vòng quay của đu quay là $4$ phút. Giả sử tại thời điểm $t = 0$, bạn đang ở vị trí thấp nhất của vòng quay.

a) Viết phương trình mô tả độ cao $h$ (m) của bạn so với mặt đất tại thời điểm $t$ (phút).

b) Tại thời điểm $t = 5$ phút, độ cao của bạn so với mặt đất là bao nhiêu?

*Hướng dẫn giải:*

*a) Lập phương trình độ cao:*

- Chọn mô hình hàm số. Do thời điểm ban đầu ($t = 0$) vật ở vị trí thấp nhất, ta ưu tiên sử dụng hàm cosin với dấu âm ở trước: $h(t) = c - a cos(omega t)$.

- Độ cao của tâm đu quay là $c = 20$.

- Bán kính đu quay là biên độ dao động, vậy $a = 15$.

- Thời gian quay một vòng là chu kỳ $T = 4$ phút. Tần số góc được tính là:
  $ omega = (2pi)/T = (2pi)/4 = pi/2 $

- Vậy phương trình mô tả độ cao là:
  $ h(t) = 20 - 15 cos((pi)/2 t) quad ("m") $

*b) Tính độ cao tại một thời điểm:*

- Tại $t = 5$, ta thay trực tiếp vào phương trình vừa lập:
  $ h(5) = 20 - 15 cos((pi)/2 dot 5) = 20 - 15 cos((5pi)/2) $

- Vì $cos((5pi)/2) = cos(2pi + pi/2) = cos(pi/2) = 0$, ta có:
  $ h(5) = 20 - 15 dot 0 = 20 " m" $

#ans-box[
  Tại thời điểm $t = 5$ phút, độ cao của cabin là *$20$ m* (nằm ngang bằng với tâm của vòng quay).
]

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Ground
    line((-1, 0), (7, 0), stroke: (paint: green.darken(50%), thickness: 2pt))
    content((3, -0.3), text(size: 8pt)[Mặt đất])
    
    // Ferris wheel
    circle((3, 3), radius: 2, stroke: 1pt)
    circle((3, 3), radius: 0.1, fill: black)
    
    // Supports
    line((3, 3), (2, 0), stroke: 1.5pt)
    line((3, 3), (4, 0), stroke: 1.5pt)
    
    // Spokes and cabins
    for i in range(0, 8) {
      let angle = i * 45 * 3.14159 / 180.0
      let x = 3 + 2 * calc.cos(angle)
      let y = 3 + 2 * calc.sin(angle)
      line((3, 3), (x, y), stroke: 0.5pt)
      content((x, y), box(fill: red, width: 6pt, height: 6pt))
    }
    
    // Labels
    content((3.5, 3), text(size: 8pt)[$c = 20$])
    line((1.3, 3), (4.7, 3), stroke: (dash: "dashed", paint: gray))
    content((5.5, 3), text(size: 8pt)[Tâm quay])
    line((5.2, 1), (5.2, 5), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((5.5, 4), text(size: 8pt)[$2a = 30$])
  })
]

=== 2. Mô hình Thủy triều và Mực nước biển

#eco-box[
    *Phân tích Mô hình Thủy triều*
    
    Mực nước biển tại một cảng thường dao động điều hòa theo thời gian do hiện tượng thủy triều. Hàm số mô tả độ sâu $h(t)$ của mực nước thường có dạng:
    $ h(t) = c + a cos(omega t + phi) $
    Trong đó:
    - Chu kỳ thủy triều thường là khoảng $12$ giờ (bán nhật triều) hoặc $24$ giờ (nhật triều). Do đó $omega$ thường là $pi/6$ hoặc $pi/12$.

    - Mực nước cao nhất (Triều cường): $h_"max" = c + a$

    - Mực nước thấp nhất (Triều kém): $h_"min" = c - a$

    - Thời gian an toàn cho tàu cập cảng là giải bất phương trình lượng giác: $h(t) >= h_0$ (với $h_0$ là độ sâu tối thiểu yêu cầu của tàu).
]

*Ví dụ 2:* Độ sâu $h$ (m) của mực nước ở một cảng biển vào thời điểm $t$ (giờ) sau nửa đêm được tính bởi công thức:
$ h(t) = 12 + 3 cos(pi/6 t + pi/3) $
Một chiếc tàu chở hàng cần mực nước sâu ít nhất $13.5$ m để có thể cập cảng an toàn. Trong khoảng thời gian từ $0$ giờ đến $12$ giờ trưa, tàu có thể cập cảng an toàn trong khoảng thời gian nào?

*Hướng dẫn giải:*

*Bước 1: Lập bất phương trình an toàn* 

Để tàu cập cảng an toàn, độ sâu của nước phải thỏa mãn $h(t) >= 13.5$:
$ 12 + 3 cos(pi/6 t + pi/3) >= 13.5 $
$ 3 cos(pi/6 t + pi/3) >= 1.5 $
$ cos(pi/6 t + pi/3) >= 1/2 $

*Bước 2: Giải bất phương trình lượng giác cơ bản* 

Giải bất phương trình $cos X >= 1/2$ trên đường tròn lượng giác, ta lấy phần cung có hoành độ $>= 1/2$. Các góc nằm trong khoảng:
$ -pi/3 + k 2pi <= X <= pi/3 + k 2pi quad (k in Z) $

*Bước 3: Suy ra khoảng thời gian $t$* 

Áp dụng trở lại với $X = pi/6 t + pi/3$:
$ -pi/3 + k 2pi <= pi/6 t + pi/3 <= pi/3 + k 2pi $

Trừ đi $pi/3$ ở cả ba vế:
$ -2pi/3 + k 2pi <= pi/6 t <= k 2pi $

Nhân cả ba vế với $6/pi$ để cô lập $t$:
$ -4 + 12k <= t <= 12k $

*Bước 4: Xét trong khoảng thời gian $[0, 12]$* 

Ta cho $k$ nhận các giá trị nguyên để xem khoảng nghiệm nào lọt vào $[0, 12]$:

- Nếu $k = 0$: $t in [-4, 0]$. Phần lọt vào $[0, 12]$ là $t = 0$.

- Nếu $k = 1$: $t in [8, 12]$. Toàn bộ khoảng này đều nằm trong $[0, 12]$.

#ans-box[
  Vậy tàu có thể cập cảng an toàn vào đúng lúc *0 giờ sáng (nửa đêm)* và trong khoảng từ *8 giờ sáng đến 12 giờ trưa*.
]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Vòng tròn lượng giác
      circle((0,0), radius: 1.5, stroke: 1pt)
      line((-2, 0), (2, 0), mark: (end: ">"), stroke: 0.8pt)
      line((0, -2), (0, 2), mark: (end: ">"), stroke: 0.8pt)
      content((2.2, 0), text(size: 8pt)[$cos$])
      content((0.2, 2.2), text(size: 8pt)[$sin$])
      
      // cos X >= 1/2
      line((0.75, -1.5), (0.75, 1.5), stroke: (paint: red, dash: "dashed"))
      content((0.9, -0.3), text(size: 8pt, fill: red)[$1/2$])
      
      // highlight arc
      arc((0,0), start: -60deg, stop: 60deg, radius: 1.5, stroke: (paint: blue, thickness: 2pt))
      
      line((0,0), (0.75, 1.299), stroke: 0.5pt)
      line((0,0), (0.75, -1.299), stroke: 0.5pt)
      content((1.2, 1.4), text(size: 8pt)[$pi/3$])
      content((1.2, -1.4), text(size: 8pt)[$-pi/3$])
      
      content((0, -2.5), text(size: 9pt)[*Hình 1:* Giải bpt $cos X >= 1/2$])
    })
  ],
  align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Axes
      line((-0.2, 0), (5.5, 0), mark: (end: ">", size: 0.2), stroke: 0.8pt)
      line((0, -0.2), (0, 4.5), mark: (end: ">", size: 0.2), stroke: 0.8pt)
      content((5.7, 0), text(size: 8pt)[$t$])
      content((0.2, 4.7), text(size: 8pt)[$h$])
      
      // Wave h(t) = 3 cos(pi/6 t + pi/3) + 12
      // Scale: y axis 1cm = 4m, x axis 1cm = 3 hours -> 12 hours = 4cm
      let pts = ()
      for i in range(0, 41, step: 2) {
        let t = i / 10.0 * 3.0
        let h = 3.0 * calc.cos(3.14159 / 6.0 * t + 3.14159 / 3.0) + 12.0
        pts.push((t / 3.0, h / 4.0))
      }
      line(..pts, stroke: (paint: blue, thickness: 1.2pt))
      
      // Safe depth threshold h = 13.5
      line((0, 3.375), (5, 3.375), stroke: (paint: red, dash: "dashed"))
      content((-0.6, 3.375), text(size: 8pt, fill: red)[$13.5$])
      
      // Shading the safe zone
      line((8.0/3.0, 3.375), (8.0/3.0, 0), stroke: (paint: gray, dash: "dashed"))
      content((8.0/3.0, -0.3), text(size: 8pt)[$8$])
      content((4.0, -0.3), text(size: 8pt)[$12$])
      content((2.5, -1), text(size: 9pt)[*Hình 2:* Khoảng an toàn])
    })
  ]
)

== B. BÀI TẬP TỰ LUYỆN ĐỊNH DẠNG MỚI (2025)

=== PHẦN I: Câu trắc nghiệm nhiều phương án lựa chọn
*(Thí sinh chọn 1 đáp án đúng duy nhất trong 4 phương án)*

#tn(
  id: "1",
  [Huyết áp của một người dao động theo nhịp tim. Huyết áp $p$ (mmHg) tại thời điểm $t$ (giây) được cho bởi hàm số $p(t) = 110 + 20 sin(160 pi t)$. Huyết áp tâm thu (huyết áp lớn nhất) và huyết áp tâm trương (huyết áp nhỏ nhất) của người đó lần lượt là:],
  (True([130 mmHg và 90 mmHg.]), [110 mmHg và 20 mmHg.], [130 mmHg và 110 mmHg.], [150 mmHg và 70 mmHg.]),
  loigiai: [
    *Bước 1: Tập giá trị của hàm sin* 

    Biểu thức lượng giác $sin(160pi t)$ luôn bị kẹp giữa $-1$ và $1$:
    $ -1 <= sin(160pi t) <= 1 $
    
    *Bước 2: Suy ra huyết áp lớn nhất (tâm thu)* 

    Giá trị lớn nhất đạt được khi phần lượng giác bằng cực đại ($+1$):
    $ p_"max" = 110 + 20(1) = 130 " (mmHg)" $
    
    *Bước 3: Suy ra huyết áp nhỏ nhất (tâm trương)* 

    Giá trị nhỏ nhất đạt được khi phần lượng giác bằng cực tiểu ($-1$):
    $ p_"min" = 110 + 20(-1) = 90 " (mmHg)" $

    #ans-box[Huyết áp tâm thu là *130 mmHg* và huyết áp tâm trương là *90 mmHg*.]
  ]
)

#tn(
  id: "2",
  [Chiều cao $h(m)$ của một cabin trên vòng quay Ferris so với mặt đất tại thời điểm $t$ (phút) được cho bởi $h(t) = 30 - 25 cos(pi/10 t)$. Bán kính của vòng quay Ferris đó là bao nhiêu?],
  ([30 m.], True([25 m.]), [55 m.], [5 m.]),
  loigiai: [
    *Phân tích phương trình dạng $h(t) = c - a cos(omega t)$* 

    - Độ cao tâm quay so với mặt đất là $c = 30$ m.

    - Biên độ dao động của chiều cao chính là bán kính $R$ của đu quay. Từ phương trình ta thấy biên độ $a = 25$.

    *Kiểm chứng độ cao:* 

    - Đỉnh cao nhất của vòng quay: $h_"max" = 30 + 25 = 55$ m.

    - Điểm thấp nhất của vòng quay (thường là chỗ đón khách): $h_"min" = 30 - 25 = 5$ m.

    Khoảng cách từ tâm đến biên (bán kính) chính là khoảng dao động từ trục cân bằng $30$ m đến đỉnh, tức là $55 - 30 = 25$ m.

    #ans-box[Bán kính của vòng quay Ferris là *$25$ m*.]
  ]
)

#tn(
  id: "3",
  [Nhiệt độ trung bình $T$ ($degree "C"$) của một thành phố trong tháng $t$ ($t=1, 2, ..., 12$) được cho bởi công thức $T(t) = 22 + 8 sin(pi/6 (t - 4))$. Tháng nào trong năm có nhiệt độ trung bình cao nhất?],
  ([Tháng 6.], True([Tháng 7.]), [Tháng 8.], [Tháng 4.]),
  loigiai: [
    *Bước 1: Điều kiện để nhiệt độ đạt cực đại* 

    Hàm số $T(t)$ đạt giá trị lớn nhất khi phần lượng giác đạt cực đại, tức là:
    $ sin(pi/6 (t - 4)) = 1 $
    
    *Bước 2: Giải phương trình tìm $t$* 

    $ pi/6 (t - 4) = pi/2 + k 2pi quad (k in Z) $ 

    Nhân cả 2 vế với $6/pi$: 

    $ t - 4 = 3 + 12k $ 

    $ t = 7 + 12k $
    
    *Bước 3: Lọc nghiệm theo tháng* 

    Do tháng trong năm phải thỏa mãn $1 <= t <= 12$, ta chọn $k = 0$, suy ra:
    $ t = 7 $

    #ans-box[Vậy *tháng 7* là thời điểm nóng nhất trong năm tại thành phố này.]
  ]
)

#tn(
  id: "4",
  [Mực nước cao nhất tại một bến cảng là $14$ m và thấp nhất là $6$ m. Giả sử sự biến thiên của mực nước là dao động điều hòa với chu kỳ 12 giờ. Biên độ dao động của mực nước là:],
  ([20 m.], [14 m.], True([4 m.]), [8 m.]),
  loigiai: [
    *Xác định biên độ của dao động điều hòa:* 

    Sự biến thiên của mực nước là một dao động xung quanh một mức trung bình. Biên độ dao động (ký hiệu là $A$) được tính bằng một nửa độ chênh lệch giữa giá trị cực đại và cực tiểu:
    $ A = (h_"max" - h_"min") / 2 $ 

    Thay các giá trị $h_"max" = 14$ m và $h_"min" = 6$ m vào công thức trên:
    $ A = (14 - 6) / 2 = 8 / 2 = 4 " (m)" $

    *Mở rộng:* Mực nước trung bình (trục cân bằng) là $c = (14 + 6)/2 = 10$ m. Phương trình dao động sẽ có dạng $h(t) = 10 plus.minus 4 cos(omega t)$.

    #ans-box[Biên độ dao động của mực nước là *$4$ m*.]
  ]
)

#tn(
  id: "5",
  [Một con lắc lò xo dao động điều hòa theo phương ngang. Vị trí $x$ (cm) của vật so với vị trí cân bằng tại thời điểm $t$ (s) là $x(t) = 5 cos(4pi t)$. Quãng đường vật đi được trong một chu kỳ là:],
  ([5 cm.], [10 cm.], True([20 cm.]), [40 cm.]),
  loigiai: [
    *Bước 1: Phân tích phương trình dao động* 

    Từ phương trình $x(t) = 5 cos(4pi t)$, ta thấy biên độ dao động của vật là:
    $ A = 5 " cm" $
    
    *Bước 2: Xét sự dịch chuyển trong 1 chu kỳ* 

    Trong một chu kỳ dao động toàn phần (ví dụ đi từ biên dương sang biên âm rồi quay lại biên dương), quãng đường luôn tuân theo quy luật:

    - Từ $+A$ về VTCB ($0$): quãng đường bằng $A$.

    - Từ VTCB ($0$) ra biên âm ($-A$): quãng đường bằng $A$.

    - Từ biên âm ($-A$) về VTCB ($0$): quãng đường bằng $A$.

    - Từ VTCB ($0$) ra biên dương ($+A$): quãng đường bằng $A$.

    Tổng quãng đường trong một chu kỳ luôn là $S = 4A$.
    
    *Bước 3: Tính toán* 

    $ S = 4 times 5 = 20 " cm" $

    #ans-box[Quãng đường vật đi được trong một chu kỳ là *$20$ cm*.]
  ]
)

#tn(
  id: "6",
  [Trong 1 năm (365 ngày), số giờ có ánh sáng mặt trời của một thành phố $X$ ở ngày thứ $t$ trong năm được cho bởi $L(t) = 12 + 3 sin((2pi)/365 (t - 80))$. Có bao nhiêu giờ ánh sáng mặt trời vào ngày dài nhất trong năm?],
  ([12 giờ.], True([15 giờ.]), [9 giờ.], [18 giờ.]),
  loigiai: [
    *Đánh giá hàm số theo đặc tính của hàm sin:* 

    Hàm số biểu diễn số giờ ánh sáng là:
    $ L(t) = 12 + 3 sin((2pi)/365 (t - 80)) $ 

    Bất chấp biểu thức bên trong hàm sin có phức tạp đến đâu, ta luôn có đặc tính cốt lõi:
    $ -1 <= sin(...) <= 1 $
    
    *Tính toán ngày dài nhất:* 

    Ngày dài nhất trong năm tương ứng với thời điểm số giờ ánh sáng $L(t)$ đạt giá trị lớn nhất. Khi đó phần $sin$ phải đạt tối đa, tức là bằng $1$.
    $ L_"max" = 12 + 3(1) = 15 " (giờ)" $

    *Mở rộng:* Ngày ngắn nhất trong năm sẽ là lúc $L_"min" = 12 - 3 = 9$ giờ. Trục cân bằng 12 giờ rơi vào dịp Xuân phân/Thu phân.

    #ans-box[Ngày dài nhất trong năm tại thành phố đó có *$15$ giờ* chiếu sáng.]
  ]
)

#tn(
  id: "7",
  [Số lượng động vật ăn thịt (sói) trong một khu bảo tồn biến động theo chu kỳ của con mồi (thỏ) và được tính bằng công thức $N(t) = 400 + 150 cos((pi t)/4)$, với $t$ là số tháng tính từ đầu quan sát. Chu kỳ biến động của bầy sói là bao nhiêu tháng?],
  ([2 tháng.], [4 tháng.], True([8 tháng.]), [12 tháng.]),
  loigiai: [
    *Bước 1: Xác định tần số góc từ mô hình* 

    Phương trình dao động của lượng cá thể là $N(t) = 400 + 150 cos((pi t)/4)$.

    Hệ số đi kèm với biến thời gian $t$ trong hàm cosin chính là tần số góc $omega$. Do đó:
    $ omega = pi/4 " (rad/tháng)" $
    
    *Bước 2: Tính chu kỳ dao động* 

    Chu kỳ biến thiên (thời gian để quy luật số lượng lặp lại chính xác y như cũ) được tính bằng công thức $T = (2pi)/omega$:
    $ T = (2pi)/(pi/4) = 2pi times 4/pi = 8 " (tháng)" $

    #ans-box[Cứ mỗi *$8$ tháng*, bầy sói sẽ hoàn tất một chu kỳ sinh trưởng và suy giảm số lượng.]
  ]
)

#tn(
  id: "8",
  [Doanh thu $R$ (triệu đồng) của một công ty bán kem thay đổi theo tháng $t$ trong năm theo quy luật $R(t) = 500 - 300 cos(pi/6 t)$. Vào tháng mấy doanh thu của công ty đạt thấp nhất?],
  (True([Tháng 12.]), [Tháng 6.], [Tháng 1.], [Tháng 3.]),
  loigiai: [
    *Bước 1: Biện luận điểm rơi của GTNN* 

    Hàm doanh thu $R(t) = 500 - 300 cos(pi/6 t)$.

    Chú ý rằng trước hàm cosin có dấu TRỪ ($-300$). Do đó, để $R(t)$ đạt giá trị nhỏ nhất, thì hàm $cos$ lại phải đạt giá trị LỚN NHẤT.

    Tức là ta cần:
    $ cos(pi/6 t) = 1 $ 

    Lúc đó, $R_"min" = 500 - 300(1) = 200$ (triệu đồng).
    
    *Bước 2: Tìm tháng $t$ tương ứng* 

    $ pi/6 t = k 2pi quad (k in Z) $ 

    $ t = 12k $ 

    Do $t$ là số chỉ tháng trong năm, nên $1 <= t <= 12$. Ta chọn $k = 1$, suy ra:
    $ t = 12 $

    #ans-box[Vào *tháng 12* (giữa mùa đông), công ty bán được ít kem nhất với doanh thu chỉ 200 triệu.]
  ]
)

#tn(
  id: "9",
  [Dòng điện xoay chiều chạy qua một điện trở có cường độ $i(t) = 4 cos(100pi t + pi/4)$ (A). Cường độ dòng điện hiệu dụng bằng:],
  ([4 A.], True([$2sqrt(2)$ A.]), [$4sqrt(2)$ A.], [100 A.]),
  loigiai: [
    *Bước 1: Xác định cường độ dòng điện cực đại* 

    Từ phương trình tổng quát của dòng điện xoay chiều $i(t) = I_0 cos(omega t + phi)$, ta đối chiếu và thu được cường độ dòng điện cực đại (biên độ) là:
    $ I_0 = 4 " (A)" $
    
    *Bước 2: Áp dụng công thức dòng điện hiệu dụng* 

    Cường độ hiệu dụng $I$ của dòng điện xoay chiều hình sin bằng giá trị cực đại chia cho $sqrt(2)$:
    $ I = I_0 / sqrt(2) $ 

    Thay số vào ta được:
    $ I = 4 / sqrt(2) = (2 times 2) / sqrt(2) = 2sqrt(2) " (A)" $

    #ans-box[Cường độ dòng điện hiệu dụng qua mạch là *$2sqrt(2)$ A*.]
  ]
)

#tn(
  id: "10",
  [Nhịp sinh học (Biorhythms) về thể chất của một người dao động theo hàm $sin$ với chu kỳ 23 ngày. Một người đạt đỉnh thể chất (100%) vào ngày sinh nhật 1/1. Hỏi trong tháng 1, ngày nào người đó chạm đáy thể chất (0%)? Biết phương trình thể chất là $P(t) = 50 + 50 sin((2pi)/23 t + pi/2)$.],
  ([Ngày 11/1.], True([Ngày 12/1.]), [Ngày 23/1.], [Ngày 13/1.]),
  loigiai: [
    *Bước 1: Lập phương trình chạm đáy* 

    Thể chất của người đó chạm đáy khi $P(t) = 0$, nghĩa là:
    $ 50 + 50 sin((2pi)/23 t + pi/2) = 0 $ 

    $ sin((2pi)/23 t + pi/2) = -1 $
    
    *Bước 2: Giải phương trình lượng giác* 

    Hàm sin bằng $-1$ tại góc $-pi/2 + k 2pi$:
    $ (2pi)/23 t + pi/2 = -pi/2 + k 2pi $ 

    Chuyển vế $pi/2$:
    $ (2pi)/23 t = -pi + k 2pi $ 

    Nhân cả 2 vế với $23/(2pi)$:
    $ t = -23/2 + 23k = -11.5 + 23k $
    
    *Bước 3: Xác định ngày trong tháng 1* 

    Biết rằng ngày $1/1$ ứng với mốc thời gian $t = 0$.

    Để tìm thời điểm chạm đáy lần đầu tiên sau ngày 1/1, ta chọn $k = 1$:
    $ t = -11.5 + 23(1) = 11.5 $ 

    Mốc thời gian $t = 11.5$ tức là trải qua 11.5 ngày kể từ $0$ giờ ngày 1/1.
    $arrow.double.r 1 + 11.5 = 12.5$ (tức là 12 giờ trưa ngày 12/1).

    #ans-box[Người đó chạm đáy thể chất vào *ngày 12/1*.]
  ]
)

=== PHẦN II: Câu trắc nghiệm đúng sai
*(Thí sinh chọn Đúng hoặc Sai cho mỗi ý a, b, c, d)*

#ds(
  id: "1",
  [Độ sâu $h(m)$ của mực nước biển tại một bến cảng vào thời điểm $t$ (giờ) tính từ nửa đêm được xác định bởi công thức $h(t) = 15 + 4 cos((pi t)/6 + pi/3)$.],
  (
    True[Tại thời điểm ban đầu (0 giờ), mực nước biển cao $17$ m.],
    True[Biên độ dao động của mực nước là $4$ m.],
    False[Chu kỳ của sự thay đổi mực nước là $6$ giờ.],
    True[Trong một ngày (24 giờ), có đúng 2 lần mực nước đạt độ sâu lớn nhất.]
  ),
  loigiai: [
    *a) Kiểm tra độ sâu ban đầu:* 

    Tại $t=0$, thay vào phương trình ta được:
    $ h(0) = 15 + 4 cos(0 + pi/3) = 15 + 4 cos(pi/3) = 15 + 4(1/2) = 15 + 2 = 17 " (m)" $

    -> *Phát biểu Đúng.*

    *b) Xác định biên độ dao động:* 

    Dựa vào dạng chuẩn $h(t) = c + A cos(omega t + phi)$, phần hệ số đứng trước hàm cos chính là biên độ $A$.
    $ A = 4 " (m)" $

    -> *Phát biểu Đúng.*

    *c) Tính chu kỳ thay đổi:* 

    Tần số góc của mô hình là $omega = pi/6$. Chu kỳ biến đổi thủy triều là:
    $ T = (2pi)/omega = (2pi)/(pi/6) = 12 " (giờ)" $

    Như vậy chu kỳ là 12 giờ (bán nhật triều), không phải 6 giờ.

    -> *Phát biểu Sai.*

    *d) Đếm số lần đạt độ sâu cực đại:* 

    Do chu kỳ là 12 giờ, vậy trong 1 ngày (24 giờ) sẽ có số chu kỳ là: $24 / 12 = 2$ chu kỳ.

    Trong mỗi chu kỳ dao động hoàn chỉnh, mực nước sẽ chạm đỉnh (cao nhất) đúng 1 lần. 

    Vậy trong 2 chu kỳ, mực nước sẽ đạt độ sâu lớn nhất chính xác 2 lần.

    -> *Phát biểu Đúng.*
  ]
)

#ds(
  id: "2",
  [Huyết áp của một bệnh nhân được đo bằng công thức $P(t) = 100 + 25 sin(120pi t)$ (mmHg), trong đó $t$ là thời gian tính bằng phút.],
  (
    True[Huyết áp tâm thu (huyết áp cao nhất) của bệnh nhân là 125 mmHg.],
    False[Nhịp tim của bệnh nhân này là 120 nhịp/phút.],
    False[Huyết áp tâm trương (huyết áp thấp nhất) của bệnh nhân là 100 mmHg.],
    True[Tại thời điểm $t = 1/240$ phút, huyết áp của bệnh nhân là 125 mmHg.]
  ),
  loigiai: [
    *a) Tìm huyết áp tâm thu (GTLN):* 

    Huyết áp cao nhất đạt được khi $sin(120pi t) = 1$.
    $ P_"max" = 100 + 25(1) = 125 " (mmHg)" $

    -> *Phát biểu Đúng.*

    *b) Tính nhịp tim (tần số dao động):* 

    Tần số góc $omega = 120pi$. Thời gian của 1 nhịp tim (1 chu kỳ) là:
    $ T = (2pi)/(120pi) = 1/60 " (phút)" $

    Vì mỗi nhịp mất $1/60$ phút (tương đương 1 giây), nên trong 1 phút (60 giây) bệnh nhân đập được 60 nhịp.

    Vậy nhịp tim là 60 nhịp/phút, không phải 120.

    -> *Phát biểu Sai.*

    *c) Tìm huyết áp tâm trương (GTNN):* 

    Huyết áp thấp nhất đạt được khi $sin(120pi t) = -1$.
    $ P_"min" = 100 + 25(-1) = 75 " (mmHg)" $

    -> *Phát biểu Sai.*

    *d) Tính huyết áp tại thời điểm $t = 1/240$:* 

    Thay trực tiếp $t = 1/240$ vào mô hình:
    $ P(1/240) = 100 + 25 sin(120pi dot 1/240) = 100 + 25 sin(pi/2) $

    $ P(1/240) = 100 + 25(1) = 125 " (mmHg)" $

    -> *Phát biểu Đúng.*
  ]
)

#ds(
  id: "3",
  [Khối lượng tuyết đọng trên đỉnh núi A trong năm được mô hình hóa bởi $M(t) = 50 + 40 cos(pi/6 (t - 1))$ (tấn), với $t$ là tháng trong năm ($1 <= t <= 12$).],
  (
    True[Vào tháng 1, lượng tuyết trên đỉnh núi đạt cực đại.],
    False[Lượng tuyết ít nhất trong năm là 0 tấn.],
    True[Tuyết tan dần và đạt mức thấp nhất vào tháng 7.],
    True[Sự thay đổi lượng tuyết có tính tuần hoàn với chu kỳ 12 tháng.]
  ),
  loigiai: [
    *a) Kiểm tra lượng tuyết tháng 1:* 

    Tại $t=1$, $M(1) = 50 + 40 cos(pi/6 dot 0) = 50 + 40(1) = 90$ tấn.

    Vì phần hàm cos lớn nhất là 1, nên 90 chính là khối lượng cực đại. Tháng 1 tuyết phủ cực đại.

    -> *Phát biểu Đúng.*

    *b) Tìm lượng tuyết ít nhất:* 

    Hàm cos đạt giá trị nhỏ nhất là $-1$. Lượng tuyết ít nhất là:
    $ M_"min" = 50 + 40(-1) = 10 " (tấn)" $

    Nó không bao giờ về mức 0 tấn (luôn có ít nhất 10 tấn tuyết vĩnh cửu).

    -> *Phát biểu Sai.*

    *c) Xác định tháng có tuyết ít nhất:* 

    Để $M(t) = 10$, ta cần $cos(pi/6 (t - 1)) = -1$.
    $ pi/6 (t - 1) = pi arrow.double.r t - 1 = 6 arrow.double.r t = 7 $

    Vào tháng 7 (mùa hè), tuyết tan mạnh nhất và đạt mức đáy.

    -> *Phát biểu Đúng.*

    *d) Kiểm tra tính tuần hoàn:* 

    Chu kỳ dao động $T = (2pi)/(pi/6) = 12$. Điều này phản ánh tính chất chu kỳ 12 tháng của vòng tuần hoàn 4 mùa trong 1 năm.

    -> *Phát biểu Đúng.*
  ]
)

#ds(
  id: "4",
  [Vận tốc luồng khí truyền trong khí quản của một người đang thở bình thường (lít/giây) được cho bởi $v(t) = 0.6 sin((pi t)/3)$, với $t$ là thời gian tính bằng giây.],
  (
    True[Người này thở ra và hít vào với chu kỳ là $6$ giây.],
    True[Giá trị lớn nhất của luồng khí là $0.6$ lít/giây.],
    False[Tại thời điểm $t = 1.5$ giây, người đó đang nín thở (vận tốc khí bằng 0).],
    True[Trong 1 phút, người này thực hiện được 10 chu kỳ hô hấp.]
  ),
  loigiai: [
    *a) Tính chu kỳ hô hấp:* 

    Từ tần số góc $omega = pi/3$, ta có chu kỳ hô hấp của 1 nhịp (gồm hít vào $v>0$ và thở ra $v<0$) là:
    $ T = (2pi)/(pi/3) = 6 " (giây)" $

    -> *Phát biểu Đúng.*

    *b) Lưu lượng cực đại:* 

    Biên độ của hàm vận tốc là $0.6$. Giá trị lớn nhất đạt được khi $sin = 1$ là $v_"max" = 0.6$ (lít/giây).

    -> *Phát biểu Đúng.*

    *c) Đánh giá tại $t = 1.5$:* 

    Thay $t = 1.5$ vào hàm số:
    $ v(1.5) = 0.6 sin(pi/3 dot 1.5) = 0.6 sin(pi/2) = 0.6(1) = 0.6 " (lít/giây)" $

    Lúc này là thời điểm hít vào với vận tốc MẠNH NHẤT chứ không phải nín thở. Trạng thái nín thở xảy ra khi $v = 0$ (vd: tại $t = 0, 3, 6...$).

    -> *Phát biểu Sai.*

    *d) Tính số nhịp thở trong 1 phút:* 

    Mỗi chu kỳ hô hấp mất 6 giây.

    Trong 1 phút ($60$ giây), số chu kỳ thực hiện được là: $60 / 6 = 10$ chu kỳ.

    -> *Phát biểu Đúng.*
  ]
)

#ds(
  id: "5",
  [Một quả nặng treo vào đầu một con lắc lò xo dao động thẳng đứng. Khoảng cách từ tâm quả nặng đến sàn nhà là $y(t) = 80 - 15 cos(2pi t)$ (cm), với $t$ là thời gian dao động (s).],
  (
    True[Vị trí cân bằng của con lắc cách sàn nhà 80 cm.],
    True[Vật tiến lại gần mặt sàn nhất là 65 cm.],
    False[Chu kỳ dao động của con lắc là $pi$ giây.],
    True[Vào thời điểm $t=0.5$ giây, vật ở vị trí cao nhất (cách sàn 95cm).]
  ),
  loigiai: [
    *a) Xác định vị trí cân bằng:* 

    Mô hình có dạng $y(t) = c - A cos(omega t)$. Trong đó hằng số tự do $c = 80$ (cm) chính là tọa độ của vị trí cân bằng (trục đối xứng dao động).

    -> *Phát biểu Đúng.*

    *b) Tìm khoảng cách cực tiểu đến sàn:* 

    Khoảng cách nhỏ nhất $y_"min"$ đạt được khi phần dao động mang dấu âm tối đa.
    $ y_"min" = 80 - 15 = 65 " (cm)" $

    -> *Phát biểu Đúng.*

    *c) Tính chu kỳ con lắc:* 

    Tần số góc $omega = 2pi$.
    $ T = (2pi)/(2pi) = 1 " (giây)" $

    Chu kỳ là 1 giây, không phải $pi$.

    -> *Phát biểu Sai.*

    *d) Đánh giá vị trí tại $t = 0.5$:* 

    Thay $t = 0.5$ vào phương trình:
    $ y(0.5) = 80 - 15 cos(2pi dot 0.5) = 80 - 15 cos(pi) $

    $ y(0.5) = 80 - 15(-1) = 80 + 15 = 95 " (cm)" $

    Vì 95 cm là mức $y_"max"$, vật đang ở đỉnh cao nhất của dao động.

    -> *Phát biểu Đúng.*
  ]
)


=== PHẦN III: Câu trắc nghiệm trả lời ngắn
*(Thí sinh tính toán và điền đáp án số vào ô trống)*

#tln(
  id: "1",
  [Một vòng quay mặt trời quay mỗi vòng mất 15 phút. Tâm của vòng quay nằm ở độ cao 35m so với mặt đất, bán kính vòng quay là 30m. Lúc $t=0$, một người bắt đầu lên vòng quay ở vị trí thấp nhất. Hỏi sau bao nhiêu phút (lần đầu tiên) thì người đó đạt độ cao 50m?],
  [$5$],
  loigiai: [
    *Bước 1: Xây dựng hàm độ cao* 

    - Vì lúc $t=0$ người này lên xe ở vị trí THẤP NHẤT, ta dùng mô hình cosin có dấu âm: $h(t) = c - A cos(omega t)$.

    - Độ cao tâm trục $c = 35$ m. Bán kính đu quay $A = 30$ m.

    - Chu kỳ 1 vòng $T = 15$ phút, suy ra tần số góc $omega = (2pi)/15$.

    Phương trình độ cao:
    $ h(t) = 35 - 30 cos((2pi)/15 t) $
    
    *Bước 2: Lập phương trình độ cao đạt 50m* 

    Yêu cầu đề bài $h(t) = 50$:
    $ 35 - 30 cos((2pi)/15 t) = 50 $ 

    $ -30 cos((2pi)/15 t) = 15 $ 

    $ cos((2pi)/15 t) = -1/2 $
    
    *Bước 3: Giải phương trình lượng giác* 

    Giá trị góc dương nhỏ nhất (lần đầu tiên) làm cho $cos X = -1/2$ là $X = (2pi)/3$.

    Suy ra:
    $ (2pi)/15 t = (2pi)/3 $ 

    Rút gọn $2pi$ ở 2 vế và giải $t$:
    $ t/15 = 1/3 arrow.double.r t = 15/3 = 5 " (phút)" $

    #ans-box[Sau đúng *5 phút* kể từ lúc xuất phát, người đó sẽ đạt độ cao 50m lần đầu tiên.]
  ]
)

#tln(
  id: "2",
  [Số giờ có ánh sáng mặt trời của một thành phố ở vĩ độ cao trong ngày thứ $t$ của năm (1 năm 365 ngày) là $y(t) = 12 + 6 sin( (2pi)/365 (t - 80) )$. Tìm số giờ có ánh sáng mặt trời lớn nhất trong năm.],
  [$18$],
  loigiai: [
    *Bước 1: Phân tích hàm lượng giác* 

    Hàm số biểu diễn số giờ ánh sáng là một hàm dao động điều hòa:
    $ y(t) = 12 + 6 sin(X) $
    với $X = (2pi)/365 (t - 80)$.
    
    *Bước 2: Đánh giá cực trị* 

    Theo tính chất của hàm số sin, giá trị lớn nhất luôn là $+1$.

    Nên giá trị lớn nhất của cả biểu thức $y(t)$ sẽ là:
    $ y_"max" = 12 + 6(1) = 18 $
    
    (Lưu ý: Thời điểm này xảy ra khi góc $X = pi/2$, tương ứng với điểm Hạ chí tại Bắc Bán Cầu, lúc này ngày dài hơn đêm rất nhiều).

    #ans-box[Số giờ có ánh sáng mặt trời lớn nhất trong năm tại thành phố này là *18 giờ*.]
  ]
)

#tln(
  id: "3",
  [Độ cao $h$ (m) của mực nước biển tại một bến cảng vào thời điểm $t$ (giờ, $0 <= t <= 24$) được cho bởi hàm số $h(t) = 12 + 3 cos((pi)/6 t - (pi)/2)$. Hỏi trong một ngày (24 giờ), có bao nhiêu thời điểm mực nước đạt độ cao chính xác là 13.5m?],
  [$4$],
  loigiai: [
    *Bước 1: Lập phương trình độ cao* 

    Cần giải phương trình $h(t) = 13.5$:
    $ 12 + 3 cos((pi)/6 t - (pi)/2) = 13.5 $ 

    $ 3 cos((pi)/6 t - (pi)/2) = 1.5 $ 

    Biết rằng theo công thức phụ chéo $cos(alpha - pi/2) = sin(alpha)$, ta có thể đơn giản hóa:
    $ 3 sin((pi)/6 t) = 1.5 arrow.double.r sin((pi)/6 t) = 1/2 $
    
    *Bước 2: Khảo sát vòng tròn lượng giác* 

    - Ta đặt góc $X = (pi)/6 t$.

    - Khi thời gian $t$ khảo sát trọn vẹn 1 ngày ($0 <= t <= 24$), thì góc $X$ sẽ quét từ $0$ đến $(pi)/6 dot 24 = 4pi$.

    - Khoảng góc $[0, 4pi]$ tương ứng với đúng *2 vòng quay trọn vẹn* trên đường tròn lượng giác (mỗi vòng $2pi$).
    
    *Bước 3: Đếm số nghiệm* 

    - Phương trình $sin X = 1/2$ có 2 nghiệm phân biệt (2 vị trí cắt) trên 1 vòng tròn lượng giác tròn trịa (góc $pi/6$ và $5pi/6$).

    - Do đường tròn được quét đúng 2 vòng, số lần chạm mốc này sẽ là $2 times 2 = 4$ lần.

    #ans-box[Trong vòng 1 ngày (24 giờ), có tất cả *4 thời điểm* mực nước đạt chính xác 13.5m.]
  ]
)

#tln(
  id: "4",
  [Một lò xo dao động điều hoà, phương trình vị trí là $x(t) = 10 cos(5pi t)$ (cm). Tìm tốc độ lớn nhất của vật nặng (cm/s). Biết tốc độ là trị tuyệt đối của đạo hàm vị trí theo thời gian $v(t) = x'(t)$. (Lấy $pi approx 3.14$, làm tròn kết quả đến phần nguyên).],
  [$157$],
  loigiai: [
    *Bước 1: Tính hàm vận tốc bằng đạo hàm* 

    - Vị trí $x(t) = 10 cos(5pi t)$.

    - Vận tốc (đạo hàm của vị trí):
      $ v(t) = x'(t) = -10 dot (5pi) sin(5pi t) = -50pi sin(5pi t) $
    
    *Bước 2: Tìm tốc độ cực đại* 

    - Tốc độ là độ lớn của vận tốc: $|v(t)| = 50pi |sin(5pi t)|$.

    - Tốc độ đạt cực đại khi trị tuyệt đối của hàm sin bằng $1$ (xảy ra khi vật đi qua vị trí cân bằng).
    $ v_"max" = 50pi " (cm/s)" $
    
    *Bước 3: Tính toán xấp xỉ số học* 

    - Đề yêu cầu lấy $pi approx 3.14$:
    $ v_"max" approx 50 times 3.14 = 157 " (cm/s)" $

    #ans-box[Tốc độ lớn nhất của vật nặng là *$157$ cm/s*.]
  ]
)

#tln(
  id: "5",
  [Nhiệt độ $T$ ($degree "C"$) ngoài trời của một ngày mùa hè được mô hình hóa bởi $T(h) = 28 + 6 sin(pi/12 (h - 8))$, với $h$ là số giờ kể từ nửa đêm ($0 <= h <= 24$). Nhiệt độ đạt mức cao nhất vào lúc mấy giờ?],
  [$14$],
  loigiai: [
    *Bước 1: Điều kiện đạt cực đại* 

    - Nhiệt độ lớn nhất khi hàm số $T(h)$ đạt cực đại. Điều này xảy ra khi phần dao động hình sin đạt giá trị $+1$:
    $ sin(pi/12 (h - 8)) = 1 $
    
    *Bước 2: Giải phương trình lượng giác* 

    - Phương trình cơ bản: $sin X = 1 arrow.double.r X = pi/2 + k 2pi$.
    $ pi/12 (h - 8) = pi/2 + k 2pi $ 

    Nhân $12/pi$ vào cả 2 vế:
    $ h - 8 = 6 + 24k $ 

    $ h = 14 + 24k $
    
    *Bước 3: Chọn nghiệm thực tế* 

    - Khảo sát trong 1 ngày ($0 <= h <= 24$), ta chọn $k = 0$, thu được:
    $ h = 14 $

    #ans-box[Vào lúc *14 giờ* (2 giờ chiều), nhiệt độ đạt mức cao nhất trong ngày.]
  ]
)

#tln(
  id: "6",
  [Điện áp của một lưới điện dân dụng xoay chiều là $u(t) = 220sqrt(2) cos(100pi t)$ (V). Hỏi trong 1 giây, điện áp $u(t)$ bằng 0 bao nhiêu lần?],
  [$100$],
  loigiai: [
    *Bước 1: Lập phương trình triệt tiêu điện áp* 

    - Điện áp bằng 0 khi:
    $ 220sqrt(2) cos(100pi t) = 0 arrow.double.r cos(100pi t) = 0 $
    
    *Bước 2: Giải họ nghiệm* 

    - $cos X = 0$ khi góc $X$ chạm 2 biên dọc của trục cosin ($X = pi/2 + k pi$).
    $ 100pi t = pi/2 + k pi $ 

    Chia cả 2 vế cho $100pi$:
    $ t = 1/200 + k/100 $
    
    *Bước 3: Đếm số lần trong 1 giây* 

    - Ta cần tìm bao nhiêu giá trị nguyên của $k$ sao cho thời gian $t$ rơi vào khoảng từ 0 đến 1 giây ($0 < t <= 1$):
    $ 0 < 1/200 + k/100 <= 1 $ 

    Trừ $1/200$:
    $ -1/200 < k/100 <= 199/200 $ 

    Nhân $100$:
    $ -0.5 < k <= 99.5 $ 

    - Các giá trị nguyên $k$ thỏa mãn là: $k = 0, 1, 2, ..., 99$.

    - Tổng cộng có đúng 100 giá trị nguyên của $k$.

    #ans-box[Trong vòng 1 giây, điện áp dân dụng xoay chiều bị triệt tiêu (bằng 0) đúng *100 lần*.]
  ]
)

#tln(
  id: "7",
  [Một quả bóng được thả nổi trên biển, nhấp nhô theo sóng biển. Độ cao của quả bóng so với đáy biển (m) là $h(t) = 5 + 1.2 cos(2pi t)$, với $t$ tính bằng giây. Quãng đường (tính bằng mét) quả bóng di chuyển theo phương thẳng đứng trong 1 phút là bao nhiêu?],
  [$288$],
  loigiai: [
    *Bước 1: Phân tích dao động của sóng* 

    - Phương trình dao động có biên độ là $A = 1.2$ m. Tần số góc $omega = 2pi$ rad/s.

    - Chu kỳ của sóng biển là:
      $ T = (2pi)/omega = (2pi)/(2pi) = 1 " (giây)" $
      (Nghĩa là cứ mỗi 1 giây quả bóng nhấp nhô hoàn tất 1 vòng lên và xuống).
      
    *Bước 2: Quãng đường trong 1 chu kỳ* 

    - Trong 1 chu kỳ, vật đi từ trên xuống dưới rồi lên lại. Quãng đường luôn bằng 4 lần biên độ:
      $ S_T = 4A = 4 times 1.2 = 4.8 " (m)" $
      
    *Bước 3: Tổng quãng đường trong 1 phút* 

    - Thời gian khảo sát $1$ phút $= 60$ giây.

    - Do chu kỳ $T=1$ s, số lượng chu kỳ trong 1 phút chính là 60 chu kỳ.

    - Tổng quãng đường quả bóng nhấp nhô là:
      $ S_"tổng" = 60 times S_T = 60 times 4.8 = 288 " (m)" $

    #ans-box[Quãng đường quả bóng di chuyển lên xuống trong 1 phút là *$288$ m*.]
  ]
)
