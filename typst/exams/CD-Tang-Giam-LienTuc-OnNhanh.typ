#import "../sang-exam.typ": *
#import "../template.typ": *

#set page(paper: "a4", margin: (x: 1.35cm, y: 1.55cm))
#set text(font: "New Computer Modern", size: 10.8pt, lang: "vi")
#set par(justify: true, leading: 0.8em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("061A40"), rgb("0D47A1"), rgb("1976D2"), angle: 135deg),
  inset: (x: 14pt, y: 10pt),
  radius: 7pt,
  above: 1.3em,
  below: 0.9em,
  text(fill: white, size: 13.2pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1em,
  below: 0.45em,
  stroke: (left: 4pt + rgb("1565C0")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("0D47A1"), size: 11.3pt, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 0.8em,
  below: 0.35em,
  text(fill: rgb("283593"), size: 10.8pt, weight: "bold", "• " + it.body),
)

#let navy = rgb("0D47A1")
#let blue = rgb("1E88E5")
#let green = rgb("2E7D32")
#let amber = rgb("EF6C00")
#let violet = rgb("6A1B9A")

#let note-box(title, body, fill: rgb("F5F9FF"), stroke-color: navy) = block(
  fill: fill,
  stroke: (left: 4pt + stroke-color, rest: 0.45pt + rgb("CFD8DC")),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: stroke-color, weight: "bold")[#title]
  #v(0.24em)
  #body
]

#let tag(label, fill-color, text-color: white) = box(
  fill: fill-color,
  inset: (x: 8pt, y: 3pt),
  radius: 999pt,
  text(fill: text-color, weight: "bold", size: 9pt, label),
)

#let sample-box(title, color, body) = block(
  fill: color.lighten(85%),
  stroke: (left: 4pt + color, rest: 0.45pt + color.lighten(55%)),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: color, weight: "bold")[#title]
  #v(0.24em)
  #body
]

#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("031127"), rgb("0A2F73"), rgb("1565C0"), rgb("42A5F5"), angle: 135deg),
    radius: 12pt,
    inset: (x: 18pt, y: 20pt),
  )[
    #text(fill: rgb("BBDEFB"), size: 10.5pt, weight: "bold", tracking: 2pt)[BẢN ÔN NHANH]
    #v(0.35em)
    #text(fill: white, size: 20pt, weight: "bold")[Tăng Giảm Liên Tục Trong 30 Giây Nhận Diện]
    #v(0.3em)
    #text(fill: rgb("E3F2FD"), size: 11.5pt)[Dùng trước giờ luyện đề hoặc trước khi giao bộ đề riêng]
  ]
]

#v(0.7em)

#note-box([Mục tiêu của tờ ôn này], [
  Tờ này không thay cho file chuyên đề dài. Nó chỉ giữ lại đúng những gì học sinh phải nhớ để không bị lạc hướng:

  - đọc đề và chốt mô hình trong vài giây,
  - viết đúng phương trình vi phân,
  - gắn đúng công thức nghiệm,
  - biết lúc nào cần tìm giá trị sau $t$, lúc nào cần tìm thời điểm đạt ngưỡng.
])

= I. Bản Đồ Nhận Diện 5 Dạng

#table(
  columns: (0.8fr, 1.7fr, 1.35fr, 1.95fr),
  inset: (x: 7pt, y: 6pt),
  stroke: 0.45pt + navy,
  fill: (col, row) => if row == 0 { rgb("E3F2FD") } else if calc.rem(row, 2) == 1 { rgb("FAFCFF") } else { white },
  table.header([*Dạng*], [*Dấu hiệu đề bài*], [*Mô hình chốt*], [*Câu hỏi thường gặp*]),
  [#tag([1], blue)],
  [Đề chưa cho phương trình, chỉ mô tả bằng lời],
  [$y'(t)$ từ lời văn],
  [Viết phương trình đúng dấu âm, dương.],

  [#tag([2], green)],
  [Tốc độ tăng hoặc giảm tỉ lệ với lượng đang có],
  [$y' = k y$],
  [Bao lâu gấp đôi? Bao lâu còn một mức nào đó?],

  [#tag([3], violet)],
  [Vừa hao hụt theo lượng hiện tại, vừa được bổ sung đều],
  [$y' = a y + b$],
  [Tìm công thức, tìm ngưỡng, tìm giới hạn dài hạn.],

  [#tag([4], amber)],
  [Nhiệt độ tiến dần về nhiệt độ môi trường],
  [$T' = -k (T - T_"mt")$],
  [Sau bao lâu nguội tới mức nào?],

  [#tag([5], rgb("546E7A"))],
  [Đề trộn nhận diện mô hình với câu hỏi ngưỡng và giới hạn],
  [Chọn một trong ba khuôn trên],
  [Luyện phản xạ thay vì học thuộc rời rạc.],
)

#note-box([Hai câu hỏi phải tự hỏi trước khi giải], [
  - Đại lượng này thay đổi *liên tục theo thời gian* hay thay đổi *theo chu kỳ rời rạc*?

  - Tốc độ thay đổi phụ thuộc vào *chính lượng đang có*, hay phụ thuộc vào *độ chênh với môi trường*, hay còn có *một nguồn bổ sung đều*?
])

= II. Từ Điển Công Thức Cần Thuộc

== 1. Mẫu 1 — Tăng Hoặc Giảm Thuần

#table(
  columns: (1.8fr, 1.35fr, 1.95fr),
  inset: (x: 7pt, y: 6pt),
  stroke: 0.45pt + green,
  fill: (col, row) => if row == 0 { rgb("E8F5E9") } else if calc.rem(row, 2) == 1 { rgb("FBFFFC") } else { white },
  table.header([*Điều phải thấy*], [*Công thức*], [*Điều phải nhớ*]),
  [Tốc độ tỉ lệ với lượng đang có], [$y' = k y$], [Nếu $k > 0$ thì tăng; nếu $k < 0$ thì giảm.],
  [Nghiệm], [$y(t) = y_0 e^(k t)$], [Dùng dữ kiện tại một thời điểm khác để tìm $k$.],
  [Tìm thời gian đạt ngưỡng], [$y(t) = M$], [Đưa về phương trình mũ rồi lấy $ln$.],
)

== 2. Mẫu 2 — Hao Hụt Kèm Nguồn Bổ Sung Đều

#table(
  columns: (1.8fr, 1.45fr, 1.85fr),
  inset: (x: 7pt, y: 6pt),
  stroke: 0.45pt + violet,
  fill: (col, row) => if row == 0 { rgb("F3E5F5") } else if calc.rem(row, 2) == 1 { rgb("FEFBFF") } else { white },
  table.header([*Điều phải thấy*], [*Công thức*], [*Điều phải nhớ*]),
  [Mô hình chuẩn], [$y' = a y + b$], [Thường gặp khi có thất thoát và bơm thêm đều.],
  [Mức cân bằng], [$y_* = -frac(b, a)$], [Chỉ dùng khi $a != 0$.],
  [Nghiệm], [$y(t) = y_* + C e^(a t)$], [Nếu $a < 0$ thì $y(t)$ tiến dần về $y_*$.],
)

== 3. Mẫu 3 — Newton Cho Nhiệt Độ

#note-box(
  [Công thức chuẩn phải thuộc],
  [
    Nếu môi trường có nhiệt độ không đổi $T_"mt"$ và vật có nhiệt độ $T(t)$, thì:

    $T'(t) = -k (T(t) - T_"mt")$ với $k > 0$.

    Nghiệm tương ứng là:
    $T(t) = T_"mt" + (T_0 - T_"mt") e^(-k t).$

    Đây thực chất chỉ là một phiên bản riêng của dạng $y' = a y + b$.
  ],
  fill: rgb("FFF8E1"),
  stroke-color: amber,
)

= III. Bốn Bài Mẫu Chuẩn

== 1. Mẫu nhận diện từ lời văn

#sample-box([Mẫu 1: bể nước rò rỉ nhưng vẫn được bơm thêm], blue, [
  Nếu bể có lượng nước là $V(t)$, bị rò với tốc độ tỉ lệ thuận theo lượng đang có và đồng thời được bơm thêm đều, thì mô hình luôn có dạng:

  $V'(t) = -k V(t) + b.$

  Ý phải nhớ: *rò rỉ mang dấu âm*, *bơm thêm mang dấu dương*.
])

== 2. Mẫu tăng trưởng thuần

#sample-box([Mẫu 2: số người dùng tăng theo chính lượng đang có], green, [
  Nếu $N'(t) = k N(t)$ và $N(0) = N_0$ thì ngay lập tức viết được:

  $N(t) = N_0 e^(k t).$

  Muốn tìm $k$, thay thêm một dữ kiện như $N(3) = 8000$.

  Muốn tìm thời gian đạt ngưỡng, chỉ việc giải $N(t) = M$.
])

== 3. Mẫu có mức cân bằng

#sample-box([Mẫu 3: vừa hao hụt vừa được bổ sung đều], violet, [
  Với phương trình $y' = a y + b$, đừng lao ngay vào tìm $C$.

  Hãy làm chậm một nhịp:

  - tìm mức cân bằng $y_* = -b/a$,
  - rồi viết $y(t) = y_* + C e^(a t)$,
  - cuối cùng dùng điều kiện ban đầu để ra $C$.

  Cách này vừa nhanh, vừa giúp nhìn ngay trạng thái lâu dài khi $t -> +oo$.
])

== 4. Mẫu làm nguội Newton

#sample-box([Mẫu 4: cà phê nguội dần về nhiệt độ phòng], amber, [
  Nếu cốc cà phê từ 90°C đặt trong phòng 25°C thì công thức phải có dạng:

  $T(t) = 25 + 65 e^(-k t).$

  Khi đó mọi câu hỏi kiểu “sau bao lâu còn 40°C” đều quy về giải một phương trình mũ.

  Đừng quên rằng nhiệt độ của vật *tiến dần về nhiệt độ phòng*, chứ không thể xuống thấp hơn nhiệt độ phòng nếu mô hình vẫn đúng.
])

= IV. Bẫy Sai Rất Thường Gặp

#note-box(
  [Năm lỗi học sinh hay mắc],
  [
    1. Thấy chữ “tăng giảm” là dùng ngay phần trăm theo chu kỳ, trong khi đề đang hỏi tốc độ thay đổi liên tục.

    2. Viết sai dấu của đạo hàm: hao hụt phải âm, bổ sung phải dương.

    3. Quên mất mức cân bằng $-b/a$ ở dạng $y' = a y + b$, nên lời giải dài hơn cần thiết.

    4. Đã lập được công thức $y(t)$ nhưng thay điều kiện ban đầu sai, nhất là khi hệ số đứng trước số mũ âm.

    5. Giải bất phương trình đúng nhưng kết luận sai đơn vị thời gian hoặc làm tròn quá sớm.
  ],
  fill: rgb("FFF8E1"),
  stroke-color: amber,
)

= V. Checklist 30 Giây Trước Khi Bấm Bút

#table(
  columns: (0.65fr, 3.45fr),
  inset: (x: 7pt, y: 6pt),
  stroke: 0.45pt + navy,
  fill: (col, row) => if row == 0 { rgb("E8EAF6") } else if calc.rem(row, 2) == 1 { rgb("FAFCFF") } else { white },
  table.header([*Bước*], [*Câu hỏi phải tự trả lời*]),
  [1], [Đề có nói “tốc độ thay đổi liên tục” hay thực chất là biến động theo chu kỳ?],
  [2], [Đạo hàm phụ thuộc vào $y$, vào $y - y_"moc"$, hay còn có thêm hằng số cộng vào?],
  [3], [Nếu là $y' = k y$, mình đã viết ngay $y = y_0 e^(k t)$ chưa?],
  [4], [Nếu là $y' = a y + b$, mình đã tìm mức cân bằng $-b/a$ chưa?],
  [5], [Nếu là nhiệt độ, mình đã xác định đúng nhiệt độ môi trường chưa?],
  [6], [Câu hỏi cuối cùng đang đòi giá trị sau $t$, đòi thời điểm đạt ngưỡng, hay đòi giới hạn dài hạn?],
)

#note-box(
  [Chốt cuối cùng],
  [
    Nếu đọc đề xong mà bạn chưa biết nên dùng công thức nào, đừng tính ngay. Hãy viết một câu rất ngắn theo mẫu:

    - “tốc độ tỉ lệ với lượng đang có”, hoặc
    - “vừa hao hụt theo lượng hiện tại, vừa được bơm thêm đều”, hoặc
    - “tốc độ tỉ lệ với độ chênh nhiệt độ”.

    Chỉ cần gọi đúng tên mô hình, gần như toàn bộ lời giải đã lộ ra.
  ],
  fill: rgb("EEF7FF"),
  stroke-color: blue,
)
