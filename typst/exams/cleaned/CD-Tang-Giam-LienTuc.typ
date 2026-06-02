#import "../../sang-exam.typ": *
#import "../../template.typ": *


#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.84em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0B1F54"), rgb("0D47A1"), rgb("006064"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.7em,
  below: 1.1em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.35em,
  below: 0.75em,
  stroke: (left: 4pt + rgb("006064")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("006064"), size: 12pt, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 1.05em,
  below: 0.45em,
  text(fill: rgb("1565C0"), size: 11pt, weight: "bold", "- " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#let col-navy = rgb("0B1F54")
#let col-green = rgb("2E7D32")
#let col-amber = rgb("E65100")
#let col-red = rgb("C62828")

#let intro-box(title: none, body) = block(
  fill: rgb("EEF6FF"),
  stroke: (left: 4pt + col-navy, rest: 0.6pt + rgb("CFD8DC")),
  radius: (right: 7pt),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-navy, weight: "bold")[#title]
    #v(0.3em)
  ]
  #body
]

#let note-box(title: none, body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFE082")),
  radius: (right: 7pt),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-amber, weight: "bold")[#title]
    #v(0.3em)
  ]
  #body
]

#let warn-box(body) = block(
  fill: rgb("FFEBEE"),
  stroke: (left: 4pt + col-red, rest: 0.6pt + rgb("FFCDD2")),
  radius: (right: 7pt),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
)[
  #text(fill: col-red, weight: "bold")[Bẫy cần tránh]
  #v(0.3em)
  #body
]

#let ans-box(body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("C8E6C9")),
  radius: (right: 7pt),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
)[
  #text(fill: col-green, weight: "bold")[Kết luận]
  #v(0.3em)
  #body
]

#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("09152E"), rgb("0B1F54"), rgb("0D47A1"), rgb("006064"), angle: 135deg),
    radius: 12pt,
    inset: (x: 20pt, y: 24pt),
  )[
    #text(fill: rgb("B3E5FC"), size: 11pt, weight: "bold", tracking: 2pt)[CHUYÊN ĐỀ ỨNG DỤNG]
    #v(0.5em)
    #text(fill: white, size: 22pt, weight: "bold")[Chủ Đề Tăng Giảm Liên Tục]
    #v(0.35em)
    #text(fill: rgb("E1F5FE"), size: 12.5pt)[Mô hình hóa bằng đạo hàm và phương trình vi phân bậc nhất]
    #v(0.5em)
    #text(
      fill: rgb("B3E5FC"),
      size: 10.5pt,
      style: "italic",
    )[(Tập trung vào biến thiên theo thời gian liên tục, không lẫn với bài tăng giảm rời rạc theo chu kỳ)]
  ]
]

#v(0.9em)

#intro-box(title: [Mục tiêu của file này])[
  - Giúp học sinh nhận ra *khi nào phải dùng đạo hàm để mô hình hóa sự thay đổi liên tục theo thời gian*.

  - Gói chuyên đề về đúng ba mô hình lõi: $y' = k y$, $y' = a y + b$ và $T' = -k (T - T_"mt")$.

  - Tách thật rõ giữa bài toán *liên tục* và bài toán *rời rạc theo chu kỳ*, vì đây là chỗ nhầm lẫn nhiều nhất.
]

= Phần I — Nhìn Đúng Chuyên Đề

== 1.1 — Đâu Là “Liên Tục”, Đâu Là “Rời Rạc”?

Trong chuyên đề này, biến thời gian $t$ chạy *liên tục*: phút, giờ, ngày, tháng... và đại lượng đang xét thay đổi ở *mọi thời điểm*. Vì thế công cụ trung tâm là *đạo hàm* hoặc *phương trình vi phân*.

#note-box(title: [Nhận diện rất nhanh])[
  - Nếu đề nói: *tốc độ tăng tỉ lệ với lượng đang có*, *mỗi giây thất thoát theo lượng hiện tại*, *nhiệt độ giảm nhanh hay chậm tùy độ chênh với môi trường*, thì đó là bài *liên tục*.

  - Nếu đề nói: *cuối mỗi tháng tăng $5\%$*, *mỗi năm giảm $10\%$ rồi tăng lại $8\%$*, *qua từng chu kỳ*, thì đó là bài *rời rạc*, không phải trọng tâm của file này.
]

#align(center)[
  #table(
    columns: (1.2fr, 1.6fr, 1.6fr),
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("E3F2FD") } else if calc.odd(y) { rgb("FAFAFA") } else { white },
    align: (left, left, left),
    table.header([*Kiểu đề*], [*Dấu hiệu lời văn*], [*Công cụ chính*]),
    [Liên tục], [Tốc độ thay đổi tại mọi thời điểm], [Đạo hàm, phương trình vi phân],
    [Rời rạc], [Lặp lại theo ngày, tháng, quý, năm], [Cấp số nhân, công bội],
  )
]

== 1.2 — Ba Mô Hình Gốc Cần Thuộc

#align(center)[
  #table(
    columns: (1.5fr, 1.3fr, 1.7fr),
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("E8F5E9") } else if calc.odd(y) { rgb("FBFBFB") } else { white },
    align: (left, center, left),
    table.header([*Dấu hiệu đề bài*], [*Mô hình*], [*Nghiệm chuẩn*]),
    [Tốc độ tăng hoặc giảm tỉ lệ với lượng đang có], [$y'(t) = k y(t)$], [$y(t) = y_0 e^(k t)$],
    [Vừa hao hụt theo lượng đang có, vừa được bổ sung đều], [$y'(t) = a y(t) + b$], [$y(t) = -frac(b, a) + C e^(a t)$],
    [Nhiệt độ tiến dần về nhiệt độ môi trường],
    [$T'(t) = -k (T(t) - T_"mt")$],
    [$T(t) = T_"mt" + (T_0 - T_"mt") e^(-k t)$],
  )
]

== 1.3 — Quy Trình 5 Bước Giải Không Rối

#intro-box(title: [Quy trình nên làm cố định])[
  1. Chọn đại lượng cần theo dõi: số lượng, nhiệt độ, nồng độ, số người dùng...

  2. Đọc kỹ lời văn để viết đúng *tốc độ biến thiên* $y'(t)$.

  3. Giải phương trình vi phân tổng quát.

  4. Dùng điều kiện ban đầu để tìm hằng số.

  5. Trả lời câu hỏi thực tế: thời gian đạt ngưỡng, giá trị sau $t$ đơn vị, hay trạng thái lâu dài.
]

== 1.4 — Bốn Sai Lầm Học Sinh Hay Mắc

#warn-box[
  1. Vừa thấy chữ “tăng giảm” là lao vào nhân phần trăm theo chu kỳ, trong khi bài đang nói về tốc độ thay đổi liên tục.

  2. Viết sai dấu của đạo hàm: hao hụt phải mang dấu âm, bổ sung phải mang dấu dương.

  3. Tìm được công thức $y(t)$ rồi nhưng quên dùng điều kiện ban đầu để xác định hằng số $C$.

  4. Giải đúng phương trình nhưng kết luận sai đơn vị: phút, giờ, ngày, tháng phải bám đúng đề.
]

#pagebreak()

= Phần II — 5 Dạng Trọng Điểm

== Dạng I — Từ Lời Văn Sang Phương Trình Vi Phân

#tn(
  [Một bồn nước có lượng nước là $V(t)$ lít tại thời điểm $t$ phút. Nước rò rỉ ra ngoài với tốc độ tỉ lệ thuận với lượng nước đang có theo hệ số $0","15$. Đồng thời máy bơm cấp thêm nước sạch vào bồn với tốc độ không đổi $12$ lít/phút. Phương trình vi phân nào mô tả đúng sự biến thiên của $V(t)$?],
  (
    [$V'(t) = 0","15 V(t) + 12$],
    [$V'(t) = -0","15 V(t) - 12$],
    True([$V'(t) = -0","15 V(t) + 12$]),
    [$V'(t) = 12 - 0","15 t$],
  ),
  loigiai: [
    #ppgiai[
      - Phần rò rỉ làm lượng nước *giảm* nên có dạng $-0","15 V(t)$.
      - Máy bơm cấp đều $12$ lít/phút nên tạo thêm một lượng *dương*, đúng bằng $+12$.
    ]

    Vậy tốc độ biến thiên tổng cộng của bồn nước là
    $
      V'(t) = -0","15 V(t) + 12.
    $

    #ans-box[Chọn đáp án *C*.]
  ],
)

== Dạng II — Tăng Hoặc Giảm Thuần: $y'(t) = k y(t)$

#tln(
  id: "TG-LT-01",
  [Một nền tảng học ngoại ngữ có số học viên hoạt động là $N(t)$ tại thời điểm $t$ tháng. Người ta nhận thấy tốc độ tăng của số học viên tỉ lệ thuận với số học viên đang có. Biết rằng lúc khai trương có $5000$ học viên hoạt động, sau $3$ tháng thì có $8000$ học viên. Hỏi nếu mô hình này tiếp tục đúng thì sau khoảng bao nhiêu tháng kể từ lúc khai trương số học viên đạt $20000$? (_làm tròn đến hàng phần mười_).],
  [$8","8$],
  loigiai: [
    #ppgiai[
      - Vì tốc độ tăng tỉ lệ thuận với lượng đang có nên ta đặt mô hình $N'(t) = k N(t)$ với $k > 0$.
      - Nghiệm tổng quát của mô hình này là $N(t) = N_0 e^(k t)$.
    ]

    Từ $N(0) = 5000$, ta có
    $
      N(t) = 5000 e^(k t).
    $

    Dùng dữ kiện $N(3) = 8000$:
    $
      5000 e^(3 k) = 8000
      <=> e^(3 k) = frac(8, 5)
      <=> k = frac(1, 3) ln frac(8, 5).
    $

    Khi $N(t) = 20000$, ta giải:
    $
      5000 e^(k t) = 20000
      <=> e^(k t) = 4
      <=> t = frac(ln 4, k)
      = frac(3 ln 4, ln (8/5)).
    $

    Bấm máy tính:
    $
      t approx 8","848...
    $

    #ans-box[Sau khoảng *$8","8$ tháng* thì số học viên đạt $20000$.]
  ],
)

#tln(
  id: "TG-LT-02",
  [Lượng hoạt chất của một loại thuốc trong máu bệnh nhân được ký hiệu là $A(t)$ (mg) sau $t$ giờ kể từ lúc uống thuốc. Biết rằng tốc độ đào thải của thuốc tỉ lệ thuận với lượng thuốc còn lại trong máu. Ban đầu có $120$ mg thuốc, sau $6$ giờ còn $90$ mg. Hỏi sau khoảng bao nhiêu giờ kể từ lúc uống thuốc thì lượng thuốc còn lại giảm xuống còn đúng $30$ mg? (_làm tròn đến hàng phần mười_).],
  [$28","9$],
  loigiai: [
    #ppgiai[
      - Vì thuốc bị đào thải theo lượng còn lại nên mô hình là $A'(t) = -k A(t)$ với $k > 0$.
      - Nghiệm tổng quát là $A(t) = A_0 e^(-k t)$.
    ]

    Từ $A(0) = 120$, ta có
    $
      A(t) = 120 e^(-k t).
    $

    Dùng dữ kiện $A(6) = 90$:
    $
      120 e^(-6 k) = 90
      <=> e^(-6 k) = frac(3, 4).
    $

    Khi $A(t) = 30$, ta có
    $
      120 e^(-k t) = 30
      <=> e^(-k t) = frac(1, 4).
    $

    Từ đó
    $
      t = frac(6 ln 4, ln (4/3)).
    $

    Bấm máy tính:
    $
      t approx 28","918...
    $

    #ans-box[Sau khoảng *$28","9$ giờ* thì lượng thuốc còn lại là $30$ mg.]
  ],
)

#pagebreak()

== Dạng III — Vừa Hao Hụt Vừa Được Bổ Sung: $y'(t) = a y(t) + b$

#tln(
  id: "TG-LT-03",
  [Số người dùng hoạt động của một ứng dụng được ký hiệu là $N(t)$ (nghìn tài khoản) sau $t$ tháng. Do người dùng rời bỏ nền tảng, số người dùng giảm với tốc độ tỉ lệ thuận với lượng đang có theo hệ số $0","2$. Đồng thời, nhờ quảng cáo, mỗi tháng ứng dụng thu hút thêm đều đặn $1","2$ nghìn tài khoản mới. Biết ban đầu ứng dụng có $10$ nghìn tài khoản hoạt động. Hỏi sau khoảng bao nhiêu tháng thì số người dùng giảm xuống còn đúng $7$ nghìn tài khoản? (_làm tròn đến hàng phần mười_).],
  [$6","9$],
  loigiai: [
    #ppgiai[
      - Mô hình đúng là $N'(t) = -0","2 N(t) + 1","2$.
      - Đây là dạng $y' = a y + b$ với nghiệm có dạng “mức cân bằng + phần mũ”.
    ]

    Mức cân bằng là
    $
      N_* = -frac(1","2, -0","2) = 6.
    $

    Vì vậy nghiệm tổng quát có dạng
    $
      N(t) = 6 + C e^(-0","2 t).
    $

    Dùng điều kiện ban đầu $N(0) = 10$:
    $
      10 = 6 + C => C = 4.
    $

    Do đó
    $
      N(t) = 6 + 4 e^(-0","2 t).
    $

    Tìm thời điểm $N(t) = 7$:
    $
      6 + 4 e^(-0","2 t) = 7
      <=> 4 e^(-0","2 t) = 1
      <=> e^(-0","2 t) = frac(1, 4).
    $

    Suy ra
    $
      t = 5 ln 4 approx 6","931...
    $

    #ans-box[Sau khoảng *$6","9$ tháng* thì số người dùng còn $7$ nghìn tài khoản.]
  ],
)

#ds(
  [Một hệ thống theo dõi truy cập có số phiên hoạt động $M(t)$ (nghìn phiên) thỏa mãn phương trình $M'(t) = -0","25 M(t) + 5$ với điều kiện ban đầu $M(0) = 30$.],
  (
    True([Hệ thức đúng là $M(t) = 20 + 10 e^(-0","25 t)$.]),
    True([Trên khoảng $[0; +oo)$, hàm số $M(t)$ luôn giảm.]),
    True([Khi $t -> +oo$, số phiên hoạt động tiến dần về $20$ nghìn phiên.]),
    [Có một thời điểm để $M(t) = 10$ nghìn phiên.],
  ),
  loigiai: [
    #ppgiai[
      - Mức cân bằng của phương trình là $M_* = -frac(5, -0","25) = 20$.
      - Vì vậy nghiệm có dạng $M(t) = 20 + C e^(-0","25 t)$.
    ]

    - *Ý a) Đúng.* Từ $M(0) = 30$, ta được $30 = 20 + C => C = 10$. Suy ra $M(t) = 20 + 10 e^(-0","25 t)$.

    - *Ý b) Đúng.* Ta có
      $
        M'(t) = -2","5 e^(-0","25 t) < 0
      $
      với mọi $t >= 0$, nên $M(t)$ luôn giảm.

    - *Ý c) Đúng.* Vì $e^(-0","25 t) -> 0$ khi $t -> +oo$, nên
      $
        lim_(t -> +oo) M(t) = 20.
      $

    - *Ý d) Sai.* Công thức $M(t) = 20 + 10 e^(-0","25 t)$ luôn lớn hơn $20$, nên không thể bằng $10$.

    #ans-box[Các phát biểu đúng là *a, b, c*; phát biểu *d* sai.]
  ],
)

== Dạng IV — Định Luật Làm Nguội Newton

#tln(
  id: "TG-LT-04",
  [Một cốc cà phê vừa pha có nhiệt độ 90°C, được đặt trong phòng có nhiệt độ không đổi 25°C. Theo định luật Newton, nhiệt độ $T(t)$ của cà phê sau $t$ phút thỏa mãn phương trình
    $T'(t) = -0","2 (T(t) - 25).$

    Hỏi sau khoảng bao nhiêu phút thì cà phê nguội xuống còn đúng 40°C? (_làm tròn đến hàng phần mười_).],
  [$7","3$],
  loigiai: [
    #ppgiai[
      - Mô hình Newton cho biết tốc độ nguội tỉ lệ với độ chênh nhiệt độ so với môi trường.
      - Nghiệm chuẩn là $T(t) = T_"mt" + (T_0 - T_"mt") e^(-k t)$.
    ]

    Ở đây $T_"mt" = 25$, $T_0 = 90$, $k = 0","2$, nên
    $
      T(t) = 25 + (90 - 25) e^(-0","2 t) = 25 + 65 e^(-0","2 t).
    $

    Tìm thời điểm $T(t) = 40$:
    $
      25 + 65 e^(-0","2 t) = 40
      <=> 65 e^(-0","2 t) = 15
      <=> e^(-0","2 t) = frac(3, 13).
    $

    Suy ra
    $
      t = -frac(ln (3/13), 0","2) = 5 ln frac(13, 3).
    $

    Bấm máy tính:
    $
      t approx 7","331...
    $

    #ans-box[Sau khoảng *$7","3$ phút* thì cà phê còn 40°C.]
  ],
)

#pagebreak()

== Dạng V — Bài Tự Luyện Có Lời Giải Ngắn

#tln(
  id: "TG-LT-05",
  [Một quần thể vi khuẩn có số lượng $P(t)$ sau $t$ giờ thỏa mãn quy luật tăng liên tục với tốc độ tỉ lệ thuận với số lượng đang có. Biết ban đầu có $2000$ vi khuẩn và mô hình đúng là $P'(t) = 0","12 P(t)$. Hỏi sau khoảng bao nhiêu giờ số lượng vi khuẩn đạt $5000$ con? (_làm tròn đến hàng phần mười_).],
  [$7","6$],
  loigiai: [
    #ppgiai[
      - Nghiệm của phương trình là $P(t) = 2000 e^(0","12 t)$.
      - Ta giải phương trình $2000 e^(0","12 t) = 5000$.
    ]

    $
      e^(0","12 t) = 2","5
      <=> 0","12 t = ln 2","5
      <=> t = frac(ln 2","5, 0","12) approx 7","636...
    $

    #ans-box[Sau khoảng *$7","6$ giờ* thì quần thể đạt $5000$ con.]
  ],
)

#tln(
  id: "TG-LT-06",
  [Mức năng lượng khả dụng của một bộ pin dự phòng được ký hiệu là $Q(t)$ sau $t$ giờ và thỏa mãn phương trình
    $Q'(t) = -0","3 Q(t) + 24.$
    Biết ban đầu $Q(0) = 20$. Hỏi sau khoảng bao nhiêu giờ thì mức năng lượng đạt $60$ đơn vị? (_làm tròn đến hàng phần mười_).],
  [$3","7$],
  loigiai: [
    #ppgiai[
      - Mức cân bằng là $Q_* = -frac(24, -0","3) = 80$.
      - Vì vậy nghiệm có dạng $Q(t) = 80 + C e^(-0","3 t)$.
    ]

    Từ $Q(0) = 20$, ta có $20 = 80 + C$, nên $C = -60$.

    Do đó
    $
      Q(t) = 80 - 60 e^(-0","3 t).
    $

    Tìm thời điểm $Q(t) = 60$:
    $
      80 - 60 e^(-0","3 t) = 60
      <=> 60 e^(-0","3 t) = 20
      <=> e^(-0","3 t) = frac(1, 3).
    $

    Suy ra
    $
      t = frac(ln 3, 0","3) approx 3","662...
    $

    #ans-box[Sau khoảng *$3","7$ giờ* thì bộ pin đạt mức $60$ đơn vị.]
  ],
)

#tln(
  id: "TG-LT-07",
  [Nồng độ một chất ô nhiễm trong nước được ký hiệu là $C(t)$ (mg/L) sau $t$ giờ và thỏa mãn phương trình $C'(t) = -0","18 C(t)$. Biết ban đầu $C(0) = 50$. Hỏi sau khoảng bao nhiêu giờ thì nồng độ giảm xuống dưới mức $5$ mg/L? (_làm tròn đến hàng phần mười_).],
  [$12","8$],
  loigiai: [
    #ppgiai[
      - Nghiệm của mô hình là $C(t) = 50 e^(-0","18 t)$.
      - Ta cần giải bất phương trình $50 e^(-0","18 t) < 5$.
    ]

    $
      50 e^(-0","18 t) < 5
      <=> e^(-0","18 t) < 0","1
      <=> -0","18 t < ln 0","1.
    $

    Vì $-0","18 < 0$, chia hai vế ta được
    $
      t > frac(ln 10, 0","18) approx 12","792...
    $

    #ans-box[Sau khoảng *$12","8$ giờ* thì nồng độ xuống dưới $5$ mg/L.]
  ],
)

#tln(
  id: "TG-LT-08",
  [Khối lượng muối hòa tan trong một bể được ký hiệu là $S(t)$ (kg) sau $t$ giờ và thỏa mãn phương trình
    $S'(t) = -0","4 S(t) + 12.$
    Biết ban đầu trong bể có $10$ kg muối. Hỏi sau khoảng bao nhiêu giờ thì lượng muối tăng lên đến đúng $25$ kg? (_làm tròn đến hàng phần mười_).],
  [$3","5$],
  loigiai: [
    #ppgiai[
      - Mức cân bằng của bể là $S_* = -frac(12, -0","4) = 30$.
      - Nghiệm có dạng $S(t) = 30 + C e^(-0","4 t)$.
    ]

    Dùng $S(0) = 10$:
    $
      10 = 30 + C => C = -20.
    $

    Vậy
    $
      S(t) = 30 - 20 e^(-0","4 t).
    $

    Tìm thời điểm $S(t) = 25$:
    $
      30 - 20 e^(-0","4 t) = 25
      <=> 20 e^(-0","4 t) = 5
      <=> e^(-0","4 t) = frac(1, 4).
    $

    Suy ra
    $
      t = frac(ln 4, 0","4) approx 3","466...
    $

    #ans-box[Sau khoảng *$3","5$ giờ* thì lượng muối đạt $25$ kg.]
  ],
)

#pagebreak()

= Phần III — Chốt Lại 5 Ý Phải Thuộc

#intro-box(title: [Checklist cuối file])[
  1. Thấy cụm “tốc độ thay đổi tỉ lệ với lượng đang có” thì nghĩ ngay đến $y' = k y$.

  2. Thấy vừa hao hụt theo lượng hiện tại, vừa được bơm thêm đều thì nghĩ đến $y' = a y + b$.

  3. Bài nhiệt độ môi trường cố định gần như luôn đưa về $T' = -k (T - T_"mt")$.

  4. Sau khi giải xong, phải dùng điều kiện ban đầu để tìm hằng số.

  5. Câu hỏi thực tế thường rơi vào ba kiểu: *giá trị sau $t$*, *thời điểm đạt ngưỡng*, *trạng thái lâu dài khi $t -> +oo$*.
]

#note-box(title: [Một câu nhắc rất quan trọng])[
  Nếu đề mô tả biến thiên theo *chu kỳ rời rạc* như cuối tháng, cuối năm, đầu quý..., thì không được bê nguyên bộ công thức trong file này sang. Lúc đó ta phải quay lại mô hình cấp số nhân hoặc công bội theo chu kỳ.
]

#align(center)[
  #table(
    columns: 4,
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("E3F2FD") } else if calc.odd(y) { rgb("FAFAFA") } else { white },
    align: center,
    table.header([*Câu*], [*Đáp số nhanh*], [*Câu*], [*Đáp số nhanh*]),
    [$1$], [*C*], [$6$], [$7","3$],
    [$2$], [$8","8$], [$7$], [$7","6$],
    [$3$], [$28","9$], [$8$], [$3","7$],
    [$4$], [$6","9$], [$9$], [$12","8$],
    [$5$], [a, b, c đúng], [$10$], [$3","5$],
  )
]
