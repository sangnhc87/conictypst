#import "../sang-exam.typ": *
#import "../template.typ": *

#set page(
  paper: "a4",
  margin: (x: 1.45cm, y: 1.8cm),
)
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
    #text(fill: rgb("E1F5FE"), size: 12.5pt)[Nhìn đề qua bối cảnh thực tế, không hỏi thẳng công thức mô hình]
    #v(0.5em)
    #text(
      fill: rgb("B3E5FC"),
      size: 10.5pt,
      style: "italic",
    )[(Trọng tâm là đọc đúng quy luật biến thiên liên tục, suy ra ngưỡng, xu thế và thời điểm đạt mốc)]
  ]
]

#v(0.9em)

#intro-box(title: [Mục tiêu của file này])[
  - Giúp học sinh nhận ra *đề đang giấu mô hình tăng giảm liên tục ở đâu* trong các bối cảnh công nghệ, y sinh, môi trường, nhiệt học và điện tử.

  - Gói chuyên đề về đúng ba khung lõi: tăng hoặc giảm thuần, vừa hao hụt vừa được bổ sung đều, và nhiệt độ tiến dần về môi trường.

  - Luyện đúng hai kiểu hỏi dự đoán thi phổ thông hay dùng: *đúng sai* và *trả lời ngắn*, thay vì hỏi trần “lập phương trình vi phân”.

  - Tách thật rõ giữa bài toán *liên tục* và bài toán *rời rạc theo chu kỳ*; cuối file có thêm một phụ lục riêng cho kiểu “tăng $x\%$, rồi giảm $y\%$, rồi lại tăng...”.
]

= Phần I — Nhìn Đúng Chuyên Đề

== 1.1 — Đâu Là “Liên Tục”, Đâu Là “Rời Rạc”?

Trong chuyên đề này, biến thời gian $t$ chạy *liên tục*: phút, giờ, ngày, tháng... và đại lượng đang xét thay đổi ở *mọi thời điểm*. Trong đề thi phổ thông, học sinh hiếm khi bị hỏi thẳng “hãy lập phương trình vi phân”, mà thường bị hỏi *sau bao lâu đạt ngưỡng*, *về lâu dài tiến tới đâu*, hoặc *phát biểu nào đúng*.

#note-box(title: [Nhận diện rất nhanh])[
  - Nếu đề nói: *tốc độ tăng tỉ lệ với lượng đang có*, *mỗi giây thất thoát theo lượng hiện tại*, *nhiệt độ giảm nhanh hay chậm tùy độ chênh với môi trường*, thì đó là bài *liên tục*.

  - Nếu đề nói: *cuối mỗi tháng tăng $5\%$*, *mỗi năm giảm $10\%$ rồi tăng lại $8\%$*, *qua từng chu kỳ*, thì đó là bài *rời rạc*; phần này không nằm trong lõi liên tục và được tách riêng ở *Phần IV*.
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
    table.header([*Dấu hiệu lời văn*], [*Khung toán học ẩn*], [*Công thức dùng khi giải*]),
    [Tốc độ tăng hoặc giảm tỉ lệ với lượng đang có], [$y'(t) = k y(t)$], [$y(t) = y_0 e^(k t)$],
    [Vừa hao hụt theo lượng đang có, vừa được bổ sung đều], [$y'(t) = a y(t) + b$], [$y(t) = -frac(b, a) + C e^(a t)$],
    [Nhiệt độ tiến dần về nhiệt độ môi trường],
    [$T'(t) = -k (T(t) - T_"mt")$],
    [$T(t) = T_"mt" + (T_0 - T_"mt") e^(-k t)$],
  )
  )
]

#v(0.5em)
#intro-box(title: [Góc hiểu bản chất: Nguồn gốc của nghiệm tổng quát cho từng mô hình])[
  Thay vì học thuộc vẹt công thức, ta có thể dễ dàng tìm ra hàm số bằng công cụ *Nguyên hàm* (giải phương trình vi phân tách biến).
  
  *1. Mô hình tăng/giảm thuần:* $y'(t) = k y(t)$
  $ frac(d y, d t) = k y => frac(d y, y) = k d t $
  Lấy nguyên hàm hai vế:
  $ integral frac(1, y) d y = integral k d t => ln|y| = k t + C_1 => |y| = e^(k t + C_1) = e^(C_1) dot e^(k t) $
  Bỏ dấu giá trị tuyệt đối, đặt $C = plus.minus e^(C_1)$, ta được: $y(t) = C e^(k t)$. Vì tại $t=0$, $y(0) = C$, ta hay viết *$y(t) = y_0 e^(k t)$*.
  
  *2. Mô hình vừa hao hụt vừa bổ sung:* $y'(t) = a y(t) + b$
  $ frac(d y, d t) = a y + b => frac(d y, a y + b) = d t $
  Lấy nguyên hàm hai vế:
  $ integral frac(1, a y + b) d y = integral 1 d t => frac(1, a) ln|a y + b| = t + C_1 => ln|a y + b| = a t + a C_1 $
  Chuyển về dạng mũ và đặt $C_2 = plus.minus e^(a C_1)$:
  $ a y + b = C_2 e^(a t) => a y = -b + C_2 e^(a t) => y(t) = -frac(b, a) + C e^(a t) quad ("với" C = C_2 / a) $
  
  *3. Mô hình định luật làm nguội Newton:* $T'(t) = -k(T(t) - T_"mt")$
  $ frac(d T, d t) = -k(T - T_"mt") => frac(d T, T - T_"mt") = -k d t $
  Lấy nguyên hàm hai vế:
  $ integral frac(1, T - T_"mt") d T = integral -k d t => ln|T - T_"mt"| = -k t + C_1 $
  Chuyển về dạng mũ: $T - T_"mt" = C e^(-k t) => T(t) = T_"mt" + C e^(-k t)$.
]
#v(0.5em)

== 1.3 — Quy Trình 5 Bước Làm Đề Không Bị Rối

#intro-box(title: [Quy trình nên làm cố định])[
  1. Chọn đại lượng cần theo dõi: số lượng, nhiệt độ, nồng độ, số người dùng...

  2. Đọc kỹ lời văn để viết đúng *tốc độ biến thiên* của đại lượng đó: tăng theo lượng đang có, giảm theo độ chênh, hay vừa hao hụt vừa được bổ sung.

  3. Từ quy luật biến thiên, suy ra công thức theo thời gian.

  4. Dùng điều kiện ban đầu để tìm hằng số.

  5. Trả lời đúng câu hỏi thực tế: thời gian đạt ngưỡng, giá trị sau $t$ đơn vị, trạng thái lâu dài, hay nhận xét đúng sai.
]

== 1.4 — Bốn Sai Lầm Học Sinh Hay Mắc

#warn-box[
  1. Vừa thấy chữ “tăng giảm” là lao vào nhân phần trăm theo chu kỳ, trong khi bài đang nói về tốc độ thay đổi liên tục.

  2. Viết sai dấu của tốc độ biến thiên: hao hụt phải mang dấu âm, bổ sung phải mang dấu dương.

  3. Tìm được công thức $y(t)$ rồi nhưng quên dùng điều kiện ban đầu để xác định hằng số $C$.

  4. Giải đúng phương trình nhưng kết luận sai đơn vị: phút, giờ, ngày, tháng phải bám đúng đề.
]

#pagebreak()

= Phần II — Bộ Câu Hỏi Dự Đoán Thi Phổ Thông

#intro-box(title: [Tinh thần ra đề nên luyện])[
  - Không hỏi trần “lập phương trình vi phân”, mà giấu mô hình trong tình huống thực tế rồi hỏi *sau bao lâu đạt mốc*, *về lâu dài tiến tới đâu*, hoặc *phát biểu nào đúng*.

  - Cùng một lõi toán nhưng ngữ cảnh có thể rơi vào nền tảng số, xử lý môi trường, y sinh, nhiệt học, điện tử, hóa học hay sinh thái.
]

== Dạng I — Nhìn Ra Mô Hình Ẩn Trong Lời Văn

#ds(
  [Xét bốn nhận xét sau về những tình huống biến thiên theo thời gian trong đề toán thực tế.],
  (
    True([Một quần thể sinh vật có tốc độ tăng tỉ lệ với số lượng đang có là một bài tăng trưởng liên tục.]),
    [Một khoản tiền tăng $2\%$ vào cuối mỗi quý vẫn là đúng mô hình liên tục của chuyên đề này.],
    True([Nhiệt độ của một vật đặt trong phòng thường tiến dần về nhiệt độ phòng chứ không rời xa mãi.]),
    True([Một bể nước vừa rò theo lượng nước đang có vừa được bơm thêm đều thường có một mức ổn định lâu dài.]),
  ),
  loigiai: [
    #ppgiai[
      - Muốn phân loại đúng, phải đọc xem đề mô tả *biến thiên ở mọi thời điểm* hay *chỉ cập nhật theo từng chu kỳ*.
      - Hai tín hiệu mạnh của chuyên đề này là: tốc độ tỉ lệ với lượng đang có, hoặc tốc độ tỉ lệ với độ chênh so với một mức cân bằng.
    ]

    - *Ý a) Đúng.* Đây chính là mô hình tăng liên tục theo lượng đang có.

    - *Ý b) Sai.* “Cuối mỗi quý” là bài toán *rời rạc theo chu kỳ*, không thuộc lõi liên tục của phần đầu file.

    - *Ý c) Đúng.* Theo định luật làm nguội Newton, nhiệt độ sẽ tiến dần về nhiệt độ môi trường.

    - *Ý d) Đúng.* Khi vừa có phần giảm theo lượng hiện có vừa có phần bổ sung đều, hệ thường tiến về một mức ổn định.

    #ans-box[Các phát biểu đúng là *a, c, d*; phát biểu *b* sai.]
  ],
)

== Dạng II — Tăng Hoặc Giảm Thuần, Nhưng Đề Giấu Trong Bối Cảnh

#tln(
  id: "TG-LT-01",
  [Một nền tảng luyện thi trực tuyến có số tài khoản hoạt động là $N(t)$ tại thời điểm $t$ tháng. Tốc độ tăng của số tài khoản luôn tỉ lệ với số tài khoản đang có. Biết lúc bắt đầu có $12000$ tài khoản hoạt động, sau $4$ tháng có $18000$ tài khoản. Nếu xu thế đó tiếp tục đúng, hỏi sau khoảng bao nhiêu tháng kể từ lúc bắt đầu thì nền tảng đạt $50000$ tài khoản hoạt động? (_làm tròn đến hàng phần mười_).],
  [$14","1$],
  loigiai: [
    #ppgiai[
    - Tốc độ tăng tỉ lệ với lượng đang có là mô hình tăng trưởng liên tục.
      - Thay vì ốp công thức, ta lập phương trình vi phân và giải bằng tích phân.
    ]

    Tốc độ tăng tỉ lệ với số tài khoản $N(t)$ (hệ số $k > 0$):
    $ N'(t) = k N(t) <=> frac(d N, d t) = k N <=> frac(d N, N) = k d t $
    Lấy nguyên hàm hai vế:
    $ integral frac(1, N) d N = integral k d t => ln N = k t + C_1 => N(t) = e^(k t + C_1) = C e^(k t) $
    Từ $N(0) = 12000$, suy ra $C = 12000$, nên:
    $
      N(t) = 12000 e^(k t).
    $

    Dùng dữ kiện $N(4) = 18000$:
    $
      12000 e^(4 k) = 18000
      <=> e^(4 k) = frac(3, 2)
      <=> k = frac(1, 4) ln (3 / 2).
    $

    Khi $N(t) = 50000$, ta có
    $
      12000 e^(k t) = 50000
      <=> e^(k t) = frac(25, 6)
      <=> t = frac(ln (25 / 6), k)
      = frac(4 ln (25 / 6), ln (3 / 2)).
    $

    Bấm máy tính:
    $
      t approx 14","078...
    $

    #ans-box[Sau khoảng *$14","1$ tháng* thì nền tảng đạt $50000$ tài khoản hoạt động.]
  ],
)

#tln(
  id: "TG-LT-02",
  [Nồng độ một chất khử khuẩn trong bể xử lí nước được ký hiệu là $C(t)$ (mg/L) sau $t$ giờ kể từ lúc ngừng bổ sung thêm hóa chất. Người ta thấy tốc độ giảm của nồng độ luôn tỉ lệ với nồng độ đang có. Biết ban đầu nồng độ là $80$ mg/L, sau $5$ giờ còn $50$ mg/L. Hỏi sau khoảng bao nhiêu giờ thì nồng độ giảm xuống dưới mức $10$ mg/L? (_làm tròn đến hàng phần mười_).],
  [$22","1$],
  loigiai: [
    #ppgiai[
    - Tốc độ giảm tỉ lệ với lượng đang có là mô hình giảm liên tục thuần.
      - Lập phương trình vi phân và lấy nguyên hàm để giải.
    ]

    Tốc độ giảm tỉ lệ với nồng độ hiện tại (hệ số $k > 0$):
    $ C'(t) = -k C(t) <=> frac(d C, C) = -k d t $
    Lấy nguyên hàm hai vế:
    $ integral frac(1, C) d C = integral -k d t => ln C = -k t + C_1 => C(t) = C_2 e^(-k t) $
    Từ $C(0) = 80$, suy ra $C_2 = 80$, nên:
    $
      C(t) = 80 e^(-k t).
    $

    Dùng dữ kiện $C(5) = 50$:
    $
      80 e^(-5 k) = 50
      <=> e^(-5 k) = frac(5, 8)
      <=> k = frac(1, 5) ln (8 / 5).
    $

    Để $C(t) < 10$, ta giải:
    $
      80 e^(-k t) < 10
      <=> e^(-k t) < frac(1, 8)
      <=> t > frac(ln 8, k)
      = frac(5 ln 8, ln (8 / 5)).
    $

    Bấm máy tính:
    $
      t approx 22","118...
    $

    #ans-box[Sau khoảng *$22","1$ giờ* thì nồng độ giảm xuống dưới $10$ mg/L.]
  ],
)

#pagebreak()

== Dạng III — Vừa Hao Hụt Vừa Được Bổ Sung, Nên Có Mức Ổn Định

#tln(
  id: "TG-LT-03",
  [Một bộ pin dự phòng đang được sạc. Gọi $Q(t)$ là mức năng lượng của pin sau $t$ giờ. Mỗi giờ, pin nhận thêm đều đặn $20$ đơn vị năng lượng, nhưng đồng thời tự hao hụt một lượng tỉ lệ với mức năng lượng hiện có theo hệ số $0","25$. Biết lúc bắt đầu xét thì pin có $15$ đơn vị năng lượng. Hỏi sau khoảng bao nhiêu giờ thì pin đạt mức $60$ đơn vị? (_làm tròn đến hàng phần mười_).],
  [$4","7$],
  loigiai: [
    #ppgiai[
      - Phần hao hụt cho ta một hạng tử âm tỉ lệ với $Q(t)$.
      - Phần sạc đều cho ta một hạng tử dương không đổi.
    ]

    Mô hình bài toán được mô tả bằng phương trình vi phân:
    $
      Q'(t) = -0","25 Q(t) + 20
      <=> frac(d Q, d t) = -0","25 Q + 20
      <=> frac(d Q, -0","25 Q + 20) = d t
    $

    Lấy nguyên hàm hai vế:
    $
      integral frac(1, -0","25 Q + 20) d Q = integral 1 d t
      => frac(1, -0","25) ln|-0","25 Q + 20| = t + C_1
    $
    $
      => ln|-0","25 Q + 20| = -0","25 t - 0","25 C_1
    $

    Chuyển về dạng mũ và gộp hằng số, ta được:
    $
      -0","25 Q + 20 = C_2 e^(-0","25 t)
      => Q(t) = 80 + C e^(-0","25 t)
    $

    Dùng điều kiện đầu $Q(0) = 15$:
    $
      15 = 80 + C => C = -65.
    $

    Suy ra
    $
      Q(t) = 80 - 65 e^(-0","25 t).
    $

    Tìm thời điểm $Q(t) = 60$:
    $
      80 - 65 e^(-0","25 t) = 60
      <=> 65 e^(-0","25 t) = 20
      <=> e^(-0","25 t) = frac(4, 13).
    $

    Suy ra
    $
      t = 4 ln (13 / 4) approx 4","715...
    $

    #ans-box[Sau khoảng *$4","7$ giờ* thì bộ pin đạt mức $60$ đơn vị năng lượng.]
  ],
)

#ds(
  [Trong một bể nuôi vi sinh, lượng dinh dưỡng hòa tan $D(t)$ (g/L) giảm theo lượng đang có với hệ số $0","3$ mỗi giờ, nhưng đồng thời được bổ sung đều $9$ g/L mỗi giờ. Biết ban đầu $D(0) = 45$.],
  (
    True([Công thức đúng là $D(t) = 30 + 15 e^(-0","3 t)$.]),
    True([Trên khoảng $[0; +oo)$, lượng dinh dưỡng $D(t)$ luôn giảm.]),
    True([Khi $t -> +oo$, lượng dinh dưỡng tiến dần về $30$ g/L.]),
    [Có một thời điểm để $D(t) = 20$ g/L.],
  ),
  loigiai: [
    #ppgiai[
      - Đây là mô hình vừa hao hụt theo lượng đang có, vừa được bổ sung đều.
      - Mức cân bằng là giá trị lâu dài khi phần mũ triệt tiêu dần.
    ]

    Ta lập phương trình vi phân:
    $ D'(t) = -0","3 D(t) + 9 <=> frac(d D, -0","3 D + 9) = d t $
    
    Lấy nguyên hàm hai vế:
    $
      integral frac(1, -0","3 D + 9) d D = integral 1 d t
      => frac(1, -0","3) ln|-0","3 D + 9| = t + C_1
    $
    $
      => ln|-0","3 D + 9| = -0","3 t - 0","3 C_1
    $
    
    Chuyển qua dạng mũ, ta rút ra được:
    $ -0","3 D + 9 = C_2 e^(-0","3 t) => D(t) = 30 + C e^(-0","3 t). $

    Từ $D(0) = 45$, suy ra $C = 15$, nên
    $
      D(t) = 30 + 15 e^(-0","3 t).
    $

    - *Ý a) Đúng.* Khớp đúng công thức vừa tìm.

    - *Ý b) Đúng.* Ta có
      $
        D'(t) = -4","5 e^(-0","3 t) < 0
      $
      với mọi $t >= 0$, nên $D(t)$ luôn giảm.

    - *Ý c) Đúng.* Vì $e^(-0","3 t) -> 0$ khi $t -> +oo$, nên
      $
        lim_(t -> +oo) D(t) = 30.
      $

    - *Ý d) Sai.* Công thức $D(t) = 30 + 15 e^(-0","3 t)$ luôn lớn hơn $30$, nên không thể bằng $20$.

    #ans-box[Các phát biểu đúng là *a, b, c*; phát biểu *d* sai.]
  ],
)

== Dạng IV — Nhiệt Độ Tiến Dần Về Môi Trường

#tln(
  id: "TG-LT-04",
  [Một thanh kim loại vừa được nung nóng đến $150$°C rồi đưa vào phòng có nhiệt độ không đổi $30$°C. Sau $10$ phút, nhiệt độ của thanh còn $90$°C. Nếu quá trình nguội tiếp tục theo đúng mô hình Newton, hỏi sau bao nhiêu phút kể từ lúc đưa vào phòng thì nhiệt độ thanh còn $45$°C?],
  [$30$],
  loigiai: [
    #ppgiai[
      - Với mô hình Newton, nhiệt độ luôn có dạng “nhiệt độ môi trường + phần chênh lệch giảm mũ”.
      - Ở đây nhiệt độ môi trường là $30$°C.
    ]

    Gọi $T(t)$ là nhiệt độ của thanh sau $t$ phút ($T > 30$). Tốc độ nguội tỉ lệ với độ chênh lệch nhiệt độ (hệ số $k > 0$):
    $ T'(t) = -k(T(t) - 30) <=> frac(d T, d t) = -k(T - 30) <=> frac(d T, T - 30) = -k d t $
    
    Lấy nguyên hàm hai vế:
    $
      integral frac(1, T - 30) d T = integral -k d t
      => ln(T - 30) = -k t + C_1
    $
    Chuyển qua dạng mũ: $T(t) - 30 = C e^(-k t) => T(t) = 30 + C e^(-k t)$.
    Ban đầu $T(0) = 150 => 150 = 30 + C => C = 120$. Do đó:
    $
      T(t) = 30 + 120 e^(-k t).
    $

    Dùng dữ kiện $T(10) = 90$:
    $
      30 + 120 e^(-10 k) = 90
      <=> 120 e^(-10 k) = 60
      <=> e^(-10 k) = frac(1, 2).
    $

    Khi $T(t) = 45$:
    $
      30 + 120 e^(-k t) = 45
      <=> 120 e^(-k t) = 15
      <=> e^(-k t) = frac(1, 8).
    $

    Từ $e^(-10 k) = 1 / 2$, suy ra $e^(-30 k) = 1 / 8$. Vậy
    $
      t = 30.
    $

    #ans-box[Sau *$30$ phút* thì nhiệt độ thanh còn $45$°C.]
  ],
)

#ds(
  [Một khay bánh được lấy ra khỏi lò và để trong phòng có nhiệt độ không đổi $26$°C. Nhiệt độ của bánh sau $t$ phút được mô hình hóa bởi
    $T(t) = 26 + 54 e^(-0","2 t).$],
  (
    True([Lúc $t = 0$, nhiệt độ của bánh là $80$°C.]),
    True([Trên khoảng $[0; +oo)$, nhiệt độ của bánh luôn giảm và tiến dần về $26$°C.]),
    [Sau một thời gian đủ dài, nhiệt độ bánh có thể xuống thấp hơn $20$°C.],
    True([Thời điểm bánh còn $44$°C là $t = 5 ln 3$ phút.]),
  ),
  loigiai: [
    #ppgiai[
      - Đây là công thức chuẩn của mô hình nguội dần về môi trường.
      - Muốn xét đúng sai, ta chỉ cần đọc giá trị đầu, giới hạn và giải phương trình ngưỡng nhiệt độ.
    ]

    - *Ý a) Đúng.* Ta có
      $
        T(0) = 26 + 54 = 80.
      $

    - *Ý b) Đúng.* Vì $e^(-0","2 t)$ giảm dần về $0$, nên $T(t)$ giảm dần và tiến về $26$°C.

    - *Ý c) Sai.* Nhiệt độ luôn lớn hơn hoặc bằng $26$°C, nên không thể xuống dưới $20$°C.

    - *Ý d) Đúng.* Giải phương trình
      $
        26 + 54 e^(-0","2 t) = 44
        <=> 54 e^(-0","2 t) = 18
        <=> e^(-0","2 t) = frac(1, 3)
        <=> t = 5 ln 3.
      $

    #ans-box[Các phát biểu đúng là *a, b, d*; phát biểu *c* sai.]
  ],
)

#pagebreak()

== Dạng V — Bộ Tự Luyện Quét Đủ Chủ Đề Dự Đoán Thi

#tln(
  id: "TG-LT-05",
  [Diện tích phủ của một đám bèo trên mặt hồ được ký hiệu là $A(t)$ (m²) sau $t$ ngày. Tốc độ lan rộng của bèo tỉ lệ với diện tích đang có. Biết ban đầu đám bèo phủ $300$ m², sau $6$ ngày phủ $450$ m². Nếu mô hình tiếp tục đúng, hỏi sau khoảng bao nhiêu ngày thì diện tích phủ đạt $1000$ m²? (_làm tròn đến hàng phần mười_).],
  [$17","8$],
  loigiai: [
    #ppgiai[
      - Tốc độ tăng tỉ lệ với lượng đang có, nên ta sẽ lập phương trình vi phân và giải.
    ]

    Ta có phương trình vi phân:
    $ A'(t) = k A(t) <=> frac(d A, A) = k d t $
    Lấy nguyên hàm hai vế:
    $ integral frac(1, A) d A = integral k d t => ln A = k t + C_1 => A(t) = C_2 e^(k t) $
    Ban đầu $A(0) = 300 => C_2 = 300$, nên:
    $
      A(t) = 300 e^(k t).
    $

    Dùng dữ kiện $A(6) = 450$:
    $
      300 e^(6 k) = 450
      <=> e^(6 k) = frac(3, 2).
    $

    Khi $A(t) = 1000$:
    $
      300 e^(k t) = 1000
      <=> e^(k t) = frac(10, 3)
      <=> t = frac(6 ln (10 / 3), ln (3 / 2)).
    $

    Bấm máy tính:
    $
      t approx 17","819...
    $

    #ans-box[Sau khoảng *$17","8$ ngày* thì diện tích bèo đạt $1000$ m².]
  ],
)

#tln(
  id: "TG-LT-06",
  [Nồng độ bụi mịn PM2.5 trong một phòng học sau khi bật máy lọc được ký hiệu là $C(t)$ (µg/m³) sau $t$ giờ. Biết tốc độ giảm của nồng độ luôn tỉ lệ với nồng độ đang có. Lúc bật máy, nồng độ là $120$ µg/m³; sau $2$ giờ còn $90$ µg/m³. Hỏi sau khoảng bao nhiêu giờ thì nồng độ giảm xuống dưới mức $30$ µg/m³? (_làm tròn đến hàng phần mười_).],
  [$9","6$],
  loigiai: [
    #ppgiai[
      - Tốc độ giảm tỉ lệ với lượng đang có, ta lập phương trình vi phân và giải bằng tích phân.
    ]

    Phương trình vi phân (với $k > 0$):
    $ C'(t) = -k C(t) <=> frac(d C, C) = -k d t $
    Lấy nguyên hàm hai vế:
    $ integral frac(1, C) d C = integral -k d t => ln C = -k t + C_1 => C(t) = C_2 e^(-k t) $
    Từ $C(0) = 120$, suy ra $C_2 = 120$, nên:
    $
      C(t) = 120 e^(-k t).
    $

    Dùng dữ kiện $C(2) = 90$:
    $
      120 e^(-2 k) = 90
      <=> e^(-2 k) = frac(3, 4).
    $

    Muốn $C(t) < 30$, ta giải:
    $
      120 e^(-k t) < 30
      <=> e^(-k t) < frac(1, 4)
      <=> t > frac(ln 4, k)
      = frac(2 ln 4, ln (4 / 3)).
    $

    Bấm máy tính:
    $
      t approx 9","637...
    $

    #ans-box[Sau khoảng *$9","6$ giờ* thì nồng độ bụi xuống dưới $30$ µg/m³.]
  ],
)

#tln(
  id: "TG-LT-07",
  [Khối lượng muối hòa tan trong một bể trộn được ký hiệu là $S(t)$ (kg) sau $t$ giờ. Muối bị cuốn ra ngoài với tốc độ tỉ lệ với lượng muối đang có theo hệ số $0","5$, đồng thời một dòng dung dịch khác chảy vào làm tăng thêm đều đặn $15$ kg muối mỗi giờ. Biết ban đầu trong bể có $8$ kg muối. Hỏi sau khoảng bao nhiêu giờ thì lượng muối đạt $25$ kg? (_làm tròn đến hàng phần mười_).],
  [$3","0$],
  loigiai: [
    #ppgiai[
      - Đây là mô hình vừa hao hụt vừa bổ sung đều.
      - Lập phương trình vi phân, dùng nguyên hàm để tìm hàm $S(t)$.
    ]

    Phương trình vi phân của bài toán là:
    $ S'(t) = -0","5 S(t) + 15 <=> frac(d S, -0","5 S + 15) = d t $
    Lấy nguyên hàm hai vế:
    $
      integral frac(1, -0","5 S + 15) d S = integral 1 d t
      => frac(1, -0","5) ln|-0","5 S + 15| = t + C_1
    $
    $
      => ln|-0","5 S + 15| = -0","5 t - 0","5 C_1
    $
    Chuyển qua dạng mũ ta có:
    $ -0","5 S + 15 = C_2 e^(-0","5 t) => S(t) = 30 + C e^(-0","5 t) $

    Từ $S(0) = 8$, suy ra
    $
      8 = 30 + C => C = -22.
    $

    Vậy
    $
      S(t) = 30 - 22 e^(-0","5 t).
    $

    Tìm thời điểm $S(t) = 25$:
    $
      30 - 22 e^(-0","5 t) = 25
      <=> 22 e^(-0","5 t) = 5
      <=> e^(-0","5 t) = frac(5, 22).
    $

    Suy ra
    $
      t = 2 ln (22 / 5) approx 2","963...
    $

    #ans-box[Sau khoảng *$3","0$ giờ* thì lượng muối đạt $25$ kg.]
  ],
)

#tln(
  id: "TG-LT-08",
  [Nồng độ của một loại thuốc trong máu bệnh nhân, ký hiệu là $C(t)$ (mg/L) sau $t$ giờ kể từ khi tiêm tĩnh mạch. Tốc độ đào thải thuốc khỏi cơ thể luôn tỉ lệ với nồng độ thuốc hiện tại trong máu. Biết rằng ngay sau khi tiêm ($t=0$), nồng độ thuốc là $20$ mg/L, và sau $3$ giờ nồng độ giảm xuống còn $12$ mg/L. Hỏi sau khoảng bao nhiêu giờ kể từ lúc tiêm thì nồng độ thuốc trong máu giảm xuống mức $3$ mg/L? (_làm tròn đến hàng phần mười_).],
  [$11","1$],
  loigiai: [
    #ppgiai[
      - Bối cảnh Y sinh (dược động học). Tốc độ giảm tỉ lệ với lượng đang có là mô hình giảm liên tục.
      - Lập phương trình vi phân và giải bằng tích phân.
    ]

    Phương trình vi phân (với $k > 0$):
    $ C'(t) = -k C(t) <=> frac(d C, C) = -k d t $
    Lấy nguyên hàm hai vế:
    $ integral frac(1, C) d C = integral -k d t => ln C = -k t + C_1 => C(t) = C_2 e^(-k t) $
    Tại $t=0$, $C(0) = 20 => C_2 = 20$, nên:
    $ C(t) = 20 e^(-k t). $

    Dùng dữ kiện $C(3) = 12$:
    $ 20 e^(-3 k) = 12 <=> e^(-3 k) = 0","6. $

    Cần tìm $t$ khi $C(t) = 3$:
    $ 20 e^(-k t) = 3 <=> e^(-k t) = 0","15 <=> t = frac(3 ln 0","15, ln 0","6). $

    Bấm máy tính:
    $ t approx 11","078... $

    #ans-box[Sau khoảng *$11","1$ giờ* thì nồng độ thuốc giảm xuống mức $3$ mg/L.]
  ],
)

#tln(
  id: "TG-LT-09",
  [Sự phân rã của đồng vị phóng xạ Carbon-14 trong một mẫu vật khảo cổ tuân theo quy luật: tốc độ phân rã luôn tỉ lệ với khối lượng Carbon-14 còn lại trong mẫu vật. Gọi $M(t)$ (gam) là khối lượng Carbon-14 sau $t$ năm. Biết chu kỳ bán rã của Carbon-14 là $5730$ năm (tức là sau $5730$ năm, khối lượng chỉ còn một nửa so với ban đầu). Nếu một mảnh xương cổ được phát hiện chỉ còn chứa $30\%$ lượng Carbon-14 so với lúc sinh vật đó còn sống, hãy ước tính sinh vật đó đã chết cách đây khoảng bao nhiêu năm? (_làm tròn đến hàng đơn vị_).],
  [$9953$],
  loigiai: [
    #ppgiai[
      - Bối cảnh Khảo cổ / Vật lí hạt nhân. Đây là bài toán phân rã mũ kinh điển.
      - Thiết lập phương trình vi phân và giải qua nguyên hàm.
    ]

    Phương trình phân rã (với $k > 0$):
    $ M'(t) = -k M(t) <=> frac(d M, M) = -k d t $
    Lấy nguyên hàm hai vế ta được:
    $ integral frac(1, M) d M = integral -k d t => ln M = -k t + C_1 => M(t) = M_0 e^(-k t) $
    (với $M_0$ là khối lượng ban đầu lúc sinh vật còn sống).

    Dùng dữ kiện chu kỳ bán rã $t = 5730$:
    $ M_0 e^(-5730 k) = 0","5 M_0 <=> e^(-5730 k) = 0","5. $

    Mảnh xương hiện tại còn $30\%$, tức là $M(t) = 0","3 M_0$:
    $ M_0 e^(-k t) = 0","3 M_0 <=> e^(-k t) = 0","3 <=> t = frac(5730 ln 0","3, ln 0","5). $

    Bấm máy tính:
    $ t approx 9952","55... $

    #ans-box[Sinh vật đó đã chết cách đây khoảng *$9953$ năm*.]
  ],
)

#ds(
  [Xét quá trình nạp điện cho một tụ điện có điện dung $C = 100 mu "F"$ qua một điện trở $R = 10 "k" Omega$ bởi một nguồn điện một chiều có suất điện động không đổi $E = 12"V"$. Điện áp $U(t)$ (Volt) trên tụ điện sau $t$ giây thỏa mãn phương trình vi phân: $U'(t) = 1/(R C) (E - U(t))$. Tại thời điểm ban đầu $t=0$, tụ chưa tích điện ($U(0) = 0$). *(Cho biết $1 mu "F" = 10^(-6) "F"$, $1 "k" Omega = 10^3 Omega$)*.],
  (
    True([Hàm số biểu diễn điện áp trên tụ điện theo thời gian là $U(t) = 12 - 12 e^(-t)$.]),
    True([Tốc độ nạp điện (sự gia tăng điện áp) đạt giá trị lớn nhất ngay tại thời điểm ban đầu $t=0$.]),
    [Sau một thời gian rất dài ($t -> +oo$), điện áp trên tụ điện tiến dần về $0"V"$.],
    True([Để điện áp trên tụ đạt $6"V"$ (bằng một nửa nguồn), cần thời gian khoảng $0","69$ giây.]),
  ),
  loigiai: [
    #ppgiai[
      - Bối cảnh Vật lí / Điện tử (Mạch RC). Đây là mô hình tiệm cận về một mức giới hạn (giống làm nguội Newton).
      - Chú ý đổi đơn vị: $R = 10^4 Omega$, $C = 10^(-4) "F" => R C = 1$ (giây).
    ]

    Phương trình vi phân trở thành:
    $ U'(t) = 12 - U(t) <=> frac(d U, d t) = -(U - 12) <=> frac(d U, U - 12) = -d t $
    Lấy nguyên hàm hai vế:
    $ integral frac(1, U - 12) d U = integral -1 d t => ln|U - 12| = -t + C_1 $
    Chuyển qua dạng mũ: $U - 12 = C_2 e^(-t) => U(t) = 12 + C e^(-t)$.
    Từ $U(0) = 0 => 0 = 12 + C => C = -12$.
    Vậy $U(t) = 12 - 12 e^(-t)$.

    - *Ý a) Đúng.* Khớp đúng với công thức ta vừa chứng minh.

    - *Ý b) Đúng.* Tốc độ nạp điện là $U'(t) = 12 e^(-t)$. Hàm số này luôn giảm và lớn nhất khi $t=0$ (lúc đó $U'(0) = 12$ V/s).

    - *Ý c) Sai.* Khi $t -> +oo$, phần mũ $e^(-t) -> 0$, nên $U(t)$ tiến dần đến $12"V"$, tức là bằng điện áp của nguồn, chứ không phải về $0"V"$.

    - *Ý d) Đúng.* Giải phương trình $U(t) = 6$:
      $ 12 - 12 e^(-t) = 6 <=> e^(-t) = 0","5 <=> t = -ln 0","5 = ln 2 approx 0","693. $

    #ans-box[Các phát biểu đúng là *a, b, d*; phát biểu *c* sai.]
  ],
)

#pagebreak()

= Phần III — Chốt Lại 5 Ý Phải Thuộc

#intro-box(title: [Checklist cuối file])[
  1. Đề thi phổ thông thường *không hỏi thẳng mô hình*, mà hỏi ngưỡng, xu thế, hay phát biểu đúng sai.

  2. Thấy cụm “tốc độ thay đổi tỉ lệ với lượng đang có” thì nghĩ ngay đến tăng hoặc giảm mũ.

  3. Thấy vừa hao hụt theo lượng hiện tại, vừa được cấp thêm đều thì nghĩ đến một *mức cân bằng lâu dài*.

  4. Bài nhiệt độ môi trường cố định gần như luôn đưa về dạng “nhiệt độ môi trường + phần chênh lệch giảm mũ”.

  5. Cần luyện đủ ba đích hỏi: *thời điểm đạt mốc*, *trạng thái khi $t -> +oo$*, và *nhận xét đúng sai về đồ thị hay giới hạn*.
]

#note-box(title: [Một câu nhắc rất quan trọng])[
  Nếu đề mô tả biến thiên theo *chu kỳ rời rạc* như cuối tháng, cuối năm, đầu quý..., thì không được bê nguyên bộ công thức liên tục sang. Lúc đó ta phải quay lại mô hình cấp số nhân hoặc công bội theo chu kỳ; ngay dưới đây là phần phụ lục dành riêng cho kiểu đó.
]

#align(center)[
  #table(
    columns: 4,
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("E3F2FD") } else if calc.odd(y) { rgb("FAFAFA") } else { white },
    align: center,
    table.header([*Câu*], [*Đáp số nhanh*], [*Câu*], [*Đáp số nhanh*]),
    [$1$], [a, c, d đúng], [$8$], [$17","8$],
    [$2$], [$14","1$], [$9$], [$9","6$],
    [$3$], [$22","1$], [$10$], [$3","0$],
    [$4$], [$4","7$], [$11$], [$11","1$],
    [$5$], [a, b, c đúng], [$12$], [$9953$],
    [$6$], [$30$], [$13$], [a, b, d đúng],
    [$7$], [a, b, d đúng], [], [],
  )
]

#pagebreak()

= Phần IV — Bổ Sung: Tăng Giảm Theo Chu Kỳ Rời Rạc

#intro-box(title: [Mẫu tư duy cho kiểu “tăng $x\%$, rồi giảm $y\%$”])[
  - Đây là dạng *rời rạc theo chu kỳ*, không dùng đạo hàm. Mỗi bước là một *phép nhân hệ số*.

  - Nếu một chu kỳ gồm nhiều lần điều chỉnh, chẳng hạn tăng $x\%$, rồi giảm $y\%$, rồi tăng $z\%$, thì hệ số nhân sau một chu kỳ là:
  $ q = (1 + x/100) (1 - y/100) (1 + z/100). $

  - Sau $n$ chu kỳ giống nhau, đại lượng có dạng:
  $ A_n = A_0 q^n. $

  - Sai lầm lớn nhất là *cộng trừ phần trăm trực tiếp*. Ví dụ tăng $10\%$ rồi giảm $10\%$ không quay về ban đầu vì $1","10 dot 0","90 = 0","99$.
]

== Dạng VI — Nhận Diện Hệ Số Nhân Sau Một Chu Kỳ

#ds(
  [Một mặt hàng được điều chỉnh giá theo chu kỳ 3 ngày: ngày thứ nhất tăng $10\%$, ngày thứ hai giảm $15\%$, ngày thứ ba tăng $5\%$, rồi lặp lại đúng chu kỳ đó.],
  (
    True([Hệ số nhân sau đúng một chu kỳ là $q = 1","10 dot 0","85 dot 1","05 = 0","98175$.]),
    [Vì $10 - 15 + 5 = 0$ nên sau mỗi chu kỳ giá quay về đúng mức ban đầu.],
    True([Sau mỗi chu kỳ, giá thực chất giảm $1","825\%$.]),
    [Vì có hai lần tăng nên nếu lặp mãi thì giá sẽ tăng không giới hạn.],
  ),
  loigiai: [
    #ppgiai[
      - Dạng rời rạc theo chu kỳ phải xử lí bằng *hệ số nhân*, không cộng trừ phần trăm theo cảm giác.
      - Chỉ cần chốt được $q$ của một chu kỳ là ta quyết định được xu hướng dài hạn.
    ]

    - *Ý a) Đúng.* Hệ số nhân của chu kỳ là:
      $
        q = 1","10 dot 0","85 dot 1","05 = 0","98175.
      $

    - *Ý b) Sai.* Tổng phần trăm bằng $0$ không có nghĩa là quay về ban đầu; phải nhìn vào tích các hệ số.

    - *Ý c) Đúng.* Vì:
      $
        1 - q = 1 - 0","98175 = 0","01825,
      $
      nên sau mỗi chu kỳ giá giảm $1","825\%$.

    - *Ý d) Sai.* Vì $q < 1$, nên nếu lặp lại nhiều chu kỳ thì giá giảm dần, không tăng mãi.

    #ans-box[Các phát biểu đúng là *a, c*; phát biểu *b, d* sai.]
  ],
)

== Dạng VII — Tìm Thời Điểm Vượt Ngưỡng Sau Nhiều Chu Kỳ

#tln(
  id: "TG-CK-01",
  [Giá một chiếc máy tính ở đầu ngày thứ nhất là $2$ triệu đồng. Cứ sau mỗi 2 ngày, giá lặp đúng một chu kỳ: ngày đầu tăng $20\%$, ngày sau giảm $10\%$. Hỏi sau ít nhất bao nhiêu ngày thì giá chiếc máy tính vượt $3$ triệu đồng?],
  [$12$],
  loigiai: [
    #ppgiai[
      - Một chu kỳ 2 ngày có hệ số nhân:
      $ q = 1","20 dot 0","90 = 1","08. $
      - Vì đề hỏi *ít nhất bao nhiêu ngày*, ta phải tìm số chu kỳ nguyên nhỏ nhất làm giá vượt ngưỡng.
    ]

    Sau $n$ chu kỳ, giá máy tính là:
    $
      P_n = 2 dot 1","08^n
    $
    (triệu đồng).

    Cần:
    $
      2 dot 1","08^n > 3
      <=> 1","08^n > 1","5.
    $

    Thử các số nguyên gần đúng:
    $
      1","08^5 approx 1","4693 < 1","5,
    $
    nhưng
    $
      1","08^6 approx 1","5869 > 1","5.
    $

    Vậy cần $6$ chu kỳ, tức là:
    $
      6 dot 2 = 12
    $
    ngày.

    #ans-box[Sau *$12$ ngày* thì giá máy tính vượt $3$ triệu đồng.]
  ],
)

#tln(
  id: "TG-CK-02",
  [Một nền tảng học trực tuyến có $5000$ người dùng hoạt động ở đầu chu kỳ đầu tiên. Cứ mỗi chu kỳ 3 ngày, số người dùng biến động như sau: ngày thứ nhất tăng $15\%$ nhờ quảng cáo, ngày thứ hai giảm $5\%$ vì người dùng rời ứng dụng, ngày thứ ba tăng tiếp $10\%$ nhờ nội dung mới. Nếu chu kỳ này lặp lại đúng như cũ, hỏi sau $12$ ngày nền tảng có khoảng bao nhiêu người dùng hoạt động? (_làm tròn đến số nguyên gần nhất_).],
  [$10429$],
  loigiai: [
    #ppgiai[
      - Một chu kỳ 3 ngày có hệ số nhân:
      $ q = 1","15 dot 0","95 dot 1","10 = 1","20175. $
      - Sau $12$ ngày có đúng $4$ chu kỳ hoàn chỉnh.
    ]

    Số người dùng sau $12$ ngày là:
    $
      N = 5000 dot 1","20175^4.
    $

    Bấm máy tính:
    $
      N approx 10428","612...
    $

    Làm tròn đến số nguyên gần nhất, ta được:
    $
      N approx 10429.
    $

    #ans-box[Sau $12$ ngày có khoảng *$10429$ người dùng hoạt động*.]
  ],
)

#tln(
  id: "TG-CK-03",
  [Lượng một chất ô nhiễm trong hồ là $400$ đơn vị ở đầu đợt xử lí. Cứ mỗi chu kỳ 3 ngày, lượng chất này biến động theo mẫu: ngày thứ nhất giảm $20\%$, ngày thứ hai tăng lại $5\%$ do dòng chảy bên ngoài đưa vào, ngày thứ ba giảm tiếp $10\%$ nhờ xử lí bổ sung. Hỏi sau ít nhất bao nhiêu ngày thì lượng chất ô nhiễm giảm xuống dưới $100$ đơn vị?],
  [$15$],
  loigiai: [
    #ppgiai[
      - Hệ số nhân của một chu kỳ 3 ngày là:
      $ q = 0","80 dot 1","05 dot 0","90 = 0","756. $
      - Vì đề hỏi “ít nhất bao nhiêu ngày”, ta cần số chu kỳ nguyên nhỏ nhất sao cho lượng còn lại nhỏ hơn ngưỡng.
    ]

    Sau $n$ chu kỳ, lượng chất ô nhiễm là:
    $
      A_n = 400 dot 0","756^n.
    $

    Cần:
    $
      400 dot 0","756^n < 100
      <=> 0","756^n < 0","25.
    $

    Tính gần đúng cho thấy:
    $
      n > 4","956...
    $
    nên số chu kỳ nguyên nhỏ nhất là $n = 5$.

    Vậy số ngày ít nhất là:
    $
      5 dot 3 = 15.
    $

    #ans-box[Sau *$15$ ngày* thì lượng chất ô nhiễm giảm xuống dưới $100$ đơn vị.]
  ],
)

#tln(
  id: "TG-CK-04",
  [Một mã cổ phiếu cứ lặp đúng chu kỳ 2 phiên giao dịch: phiên đầu tăng $20\%$, phiên sau giảm $10\%$. Nếu muốn thay cả chu kỳ này bằng một mức tăng đều như nhau ở *mỗi phiên* sao cho sau 2 phiên kết quả vẫn giữ nguyên, thì mức tăng hiệu dụng mỗi phiên là bao nhiêu phần trăm? (_làm tròn đến hàng phần trăm_).],
  [$3","92\%$],
  loigiai: [
    #ppgiai[
      - Một chu kỳ 2 phiên có hệ số nhân tổng là:
      $ q = 1","20 dot 0","90 = 1","08. $
      - Nếu mỗi phiên cùng tăng một tỉ lệ $r$, thì sau 2 phiên phải có:
      $ (1 + r)^2 = 1","08. $
    ]

    Suy ra:
    $
      1 + r = sqrt(1","08)
      <=> r = sqrt(1","08) - 1.
    $

    Bấm máy tính:
    $
      r approx 0","03923 = 3","923\%.
    $

    Làm tròn đến hàng phần trăm:
    $
      r approx 3","92\%.
    $

    #ans-box[Mức tăng hiệu dụng mỗi phiên là khoảng *$3","92\%$*.]
  ],
)

#align(center)[
  #table(
    columns: 4,
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("FFF8E1") } else if calc.odd(y) { rgb("FFFCF4") } else { white },
    align: center,
    table.header([*Câu phụ lục*], [*Đáp số nhanh*], [*Câu phụ lục*], [*Đáp số nhanh*]),
    [$11$], [a, c đúng], [$13$], [$10429$],
    [$12$], [$12$], [$14$], [$15$],
    [$15$], [$3","92\%$], [], [],
  )
]
