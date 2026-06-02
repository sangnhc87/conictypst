#import "../sang-exam.typ": *
#import "../template.typ": *

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.82em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0D1B2A"), rgb("1E3D59"), angle: 45deg),
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
  stroke: (left: 4pt + rgb("1E3D59")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("1E3D59"), size: 12pt, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("17A2B8"), size: 11pt, weight: "bold", "- " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Màu sắc và Hộp cục bộ ───────────────────────────────────
#let primary-color = rgb("1E3D59")
#let gold-color = rgb("FFD700")
#let success-color = rgb("28A745")
#let warn-color = rgb("C0392B")

#let ans-box(body) = block(
  fill: rgb("F1F8E9"),
  stroke: (left: 4pt + success-color, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: success-color, weight: "bold")[Kết luận]
  #v(0.3em)
  #body
]

#let local-theory-box(body) = block(
  fill: rgb("F7F9FA"),
  stroke: (left: 4pt + primary-color, rest: 0.5pt + rgb("E2E8F0")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: primary-color, weight: "bold")[Nguyên lý cốt lõi]
  #v(0.3em)
  #body
]

#let weapon-box(title: "Công cụ nên chọn", body) = block(
  fill: rgb("FFFDF0"),
  stroke: (left: 4pt + rgb("D4AC0D"), rest: 0.5pt + rgb("F9E79F")),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: rgb("7D6608"), weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FFEBEE"),
  stroke: (left: 4pt + warn-color, rest: 0.5pt + rgb("FFCDD2")),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: warn-color, weight: "bold")[Bẫy học sinh rất hay mắc]
  #v(0.3em)
  #body
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D1B2A"), rgb("1E3D59"), rgb("17A2B8"), angle: 135deg),
    radius: 12pt,
    inset: (x: 20pt, y: 25pt),
  )[
    #text(fill: gold-color, size: 11pt, weight: "bold", tracking: 3pt)[CHUYÊN ĐỀ XÁC SUẤT]
    #v(0.5em)
    #text(fill: white, size: 20pt, weight: "bold")[Xác Suất Có Điều Kiện Trong Bài Toán Phân Phối]
    #v(0.35em)
    #text(fill: rgb("E2E8F0"), size: 13pt, style: "italic")[
      Viết lại theo hướng dễ hiểu hơn, bám nhóm dạng kiểu thi phổ thông 12
    ]
    #v(1em)
    #line(length: 60%, stroke: 0.5pt + gold-color)
    #v(0.8em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 0.8em,
      align(center)[
        #text(fill: gold-color, size: 9pt, weight: "bold")[NHÌN ĐÚNG MẪU]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8pt)[Xác định hộp có tên hay khôngiết điều kiện đang khóa ở đâu]
      ],
      align(center)[
        #text(fill: gold-color, size: 9pt, weight: "bold")[ĐẾM VỪA SỨC]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8pt)[PIE cơ bản	hái sao và gạchiệt hóa theo cấu hình tải]
      ],
      align(center)[
        #text(fill: gold-color, size: 9pt, weight: "bold")[XÁC SUẤT ĐIỀU KIỆN]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8pt)[Đếm mẫu trước	ránh dùng công cụ nặng quá sớm]
      ],
    )
  ]
]

#v(1em)

#resetexamstate()

// ═══════════════════════════════════════════════
// PHẦN I — KHUNG SƯ PHẠM MỚI
// ═══════════════════════════════════════════════
= I. Bản Đồ Dạng Toán & Quy Trình Giải

== 1.1 — Trong chuyên đề này, điều quan trọng nhất là gì?

Điểm làm học sinh rối nhất ở dạng này không phải là công thức, mà là *đếm nhầm không gian mẫu*. Khi đề nói “biết rằng mỗi phòng đều có ít nhất một học sinh” hoặc “biết rằng mỗi hộp đều không rỗng”, ta không còn làm việc trên toàn bộ cách phân phối tự do nữa. Ta đã đổi sang *một không gian mẫu điều kiện mới*.

#local-theory-box[
  Nếu mọi cách phân phối trong không gian điều kiện đều đồng khả năng, thì
  $ P(E | F) = frac(N(E inter F), N(F)). $

  Nói rất đời thường:
  - Mẫu số $N(F)$ là số cách còn sống sau khi áp điều kiện của đề.
  - Tử số $N(E inter F)$ là số cách vừa sống qua điều kiện, vừa thỏa thêm yêu cầu cần hỏi.
]

== 1.2 — Bản Đồ 5 Nhóm Dạng Dễ Gặp Kiểu Thi 12

#align(center)[
  #table(
    columns: (0.75fr, 1.8fr, 1.35fr, 1.95fr),
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("E8F1F8") } else if calc.odd(y) { rgb("FAFAFA") } else { white },
    align: (center, left, left, left),
    table.header([*Nhóm*], [*Dấu hiệu đề bài*], [*Mẫu số nên dùng*], [*Công cụ cho tử số*]),
    [1],
    [Vật phân biệt vào hộp phân biệt, biết mọi hộp đều không rỗng, hỏi một hộp nhận bao nhiêu],
    [PIE hoặc $m! S(n, m)$],
    [Chọn vật vào hộp đặc biệt rồi đếm phần còn lại không rỗng.],

    [2],
    [Có nhiều nhóm A, B, C; cấm trùng loại trong cùng hộp],
    [PIE trên điều kiện không rỗng],
    [Xếp từng nhóm bằng chỉnh hợp rồi lọc phòng trống.],

    [3],
    [Vật giống nhau vào hộp phân biệt, có chặn dưới hoặc chặn trên],
    [Stars and bars sau khi dịch biến],
    [PIE hoặc OGF rất ngắn để xử lý chặn trên.],

    [4],
    [Gói dữ liệu, khách hàng, bài tải hệ thống, hỏi không quá tải],
    [PIE cho điều kiện không rỗng],
    [Liệt kê cấu hình tải hoặc lấy toàn bộ trừ quá tải.],

    [5],
    [Số hộp nhỏ, mỗi hộp có tải cố định hoặc gần cố định],
    [Đếm cấu hình nền],
    [Chia theo kiểu tải như $(2,2,2)$, $(4,3,2)$ rồi nhân số hoán vị nhãn hộp.],
  )
]

== 1.3 — Quy Trình 4 Bước Không Lang Mang

#weapon-box[
  1. Đọc điều kiện khóa của đề và gọi nó là $F$.

  2. Đếm đúng $N(F)$ trước. Không được làm tử số trước khi mẫu số còn mơ hồ.

  3. Đếm $N(E inter F)$ bằng công cụ nhẹ nhất có thể: PIE cơ bản, chỉnh hợp, stars and bars, hoặc liệt kê cấu hình tải.

  4. Lập tỉ số $P(E | F) = frac(N(E inter F), N(F))$, rồi mới rút gọn hoặc tính gần đúng.
]

== 1.4 — Bốn Công Cụ Nền Vừa Đủ Dùng

#align(center)[
  #table(
    columns: (1.65fr, 1.8fr, 1.9fr),
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("F7FBFF") } else if calc.odd(y) { rgb("FCFCFC") } else { white },
    align: (left, left, left),
    table.header([*Tình huống*], [*Công thức chính*], [*Khi nào dùng*]),
    [Phân biệt vào hộp phân biệt tự do], [$m^n$], [Mỗi vật tự chọn một trong $m$ hộp.],
    [Không hộp nào rỗng], [$m^n - C_m^1 (m-1)^n + ...$], [Ưu tiên PIE nếu số hộp nhỏ.],
    [Giống nhau vào $m$ hộp, mỗi hộp ít nhất 1], [$C_(n-1)^(m-1)$], [Stars and bars sau khi đặt trước 1 vật mỗi hộp.],
    [Tải cụ thể $(a,b,c,...)$ trên hộp có tên],
    [$frac(n!, a! b! c! ...)$],
    [Khi tổng vật phân biệt và đã biết chính xác từng hộp nhận bao nhiêu.],
  )
]

== 1.5 — Năm Lỗi Học Sinh Rất Hay Mắc

#warn-box[
  1. Đề đã cho điều kiện “mọi hộp đều không rỗng” nhưng vẫn lấy mẫu số là toàn bộ $m^n$.

  2. Nhìn thấy bài khó là nhảy ngay sang EGF đa biến, trong khi PIE cơ bản hoặc liệt kê cấu hình đã đủ.

  3. Đếm tử số $N(E)$ rồi quên chưa giao với điều kiện $F$.

  4. Vật giống nhau mà lại dùng chỉnh hợp hoặc hoán vị như vật phân biệt.

  5. Biết tải của từng hộp rồi nhưng quên nhân số cách gán các tải đó cho các hộp có nhãn.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN II — 5 NHÓM DẠNG KIỂU THI 12
// ═══════════════════════════════════════════════
= II. Năm Nhóm Dạng Trọng Điểm Kiểu Thi 12

== Nhóm 1 — Mẫu Số Là Không Gian Điều Kiện “Không Hộp Nào Rỗng”

#tln(
  id: "XS-PP-01",
  [Xếp ngẫu nhiên $7$ học sinh phân biệt vào $4$ phòng học phân biệt. Biết rằng sau khi xếp, phòng nào cũng có ít nhất một học sinh. Tính xác suất $p$ để phòng số $1$ có đúng $2$ học sinh.],
  [$p = frac(3, 8)$],
  loigiai: [
    #ppgiai[
      Đây là mẫu rất dễ thi: đề đã khóa sẵn điều kiện “mỗi phòng đều có người”, nên mẫu số không còn là $4^7$ nữa.
    ]

    *Bước 1: Tính mẫu số $N(F)$*

    Gọi $F$ là biến cố “cả $4$ phòng đều không rỗng”.

    Số cách xếp $7$ học sinh vào $4$ phòng phân biệt sao cho không phòng nào trống là:
    $
      N(F) = 4^7 - C_4^1 3^7 + C_4^2 2^7 - C_4^3 1^7.
    $

    Tính ra:
    $
      N(F) = 16384 - 4 dot 2187 + 6 dot 128 - 4 = 8400.
    $

    *Bước 2: Tính tử số $N(E inter F)$*

    Gọi $E$ là biến cố “phòng $1$ có đúng $2$ học sinh”.

    - Chọn $2$ học sinh vào phòng $1$: có $C_7^2$ cách.
    - $5$ học sinh còn lại phải vào $3$ phòng còn lại sao cho không phòng nào trống.

    Số cách cho phần còn lại là:
    $
      3^5 - C_3^1 2^5 + C_3^2 1^5 = 243 - 96 + 3 = 150.
    $

    Vậy:
    $
      N(E inter F) = C_7^2 dot 150 = 21 dot 150 = 3150.
    $

    *Bước 3: Lập xác suất có điều kiện*

    $
      p = frac(N(E inter F), N(F)) = frac(3150, 8400) = frac(3, 8).
    $

    #ans-box[Xác suất cần tìm là *$p = frac(3, 8)$*. Nếu đề trắc nghiệm hỏi $10^4 p$ thì nhận được $3750$.]
  ],
)

== Nhóm 2 — Cấm Trùng Loại Trong Cùng Hộp

#tln(
  id: "XS-PP-02",
  [Ba học sinh lớp A, hai học sinh lớp B và hai học sinh lớp C được xếp ngẫu nhiên vào $4$ phòng học phân biệt. Biết rằng sau khi xếp, phòng nào cũng có ít nhất một học sinh. Tính xác suất $p$ để không có hai học sinh cùng lớp nào ở chung một phòng.],
  [$p = frac(54, 175)$],
  loigiai: [
    #ppgiai[
      Dạng này dễ làm rối nếu đi quá nhanh vào công cụ nặng. Với mức phổ thông $12$, cách sạch nhất là: mẫu số bằng PIE, tử số bằng chỉnh hợp theo từng lớp rồi lại lọc phòng trống.
    ]

    *Bước 1: Tính mẫu số $N(F)$*

    Tổng số học sinh là $7$. Gọi $F$ là biến cố “mọi phòng đều có ít nhất một học sinh”.

    Giống bài trước:
    $
      N(F) = 4^7 - C_4^1 3^7 + C_4^2 2^7 - C_4^3 1^7 = 8400.
    $

    *Bước 2: Tính tử số $N(E inter F)$*

    Gọi $E$ là biến cố “không có hai học sinh cùng lớp nào ở chung phòng”.

    Nếu tạm thời chưa xét điều kiện phòng trống thì:
    - $3$ học sinh lớp A vào $4$ phòng, mỗi phòng tối đa $1$ bạn: có $P_4^3 = 24$ cách.
    - $2$ học sinh lớp B: có $P_4^2 = 12$ cách.
    - $2$ học sinh lớp C: có $P_4^2 = 12$ cách.

    Vậy số cách thỏa $E$ nhưng chưa ép đủ $4$ phòng có người là:
    $
      N(E) = 24 dot 12 dot 12 = 3456.
    $

    Ta phải loại tiếp trường hợp có phòng trống.

    - Chọn $1$ phòng trống: có $C_4^1 = 4$ cách.
    - Khi đó tất cả học sinh chỉ được vào $3$ phòng còn lại mà vẫn không được trùng lớp trong cùng một phòng.

    Số cách trên $3$ phòng là:
    $
      P_3^3 dot P_3^2 dot P_3^2 = 6 dot 6 dot 6 = 216.
    $

    Không thể có $2$ phòng trống vì riêng lớp A đã cần ít nhất $3$ phòng.

    Do đó:
    $
      N(E inter F) = 3456 - 4 dot 216 = 2592.
    $

    *Bước 3: Tính xác suất*

    $
      p = frac(2592, 8400) = frac(54, 175).
    $

    #ans-box[Xác suất cần tìm là *$p = frac(54, 175)$*. Nếu đề hỏi $10^4 p$ thì phần nguyên là $3085$.]
  ],
)

#pagebreak()

== Nhóm 3 — Vật Giống Nhau, Hộp Có Tên, Có Chặn Trên

#tln(
  id: "XS-PP-03",
  [Chia ngẫu nhiên $10$ viên kẹo giống nhau vào $4$ chiếc hộp phân biệt. Biết rằng mỗi hộp đều nhận được ít nhất một viên. Tính xác suất $p$ để không có hộp nào nhận quá $4$ viên kẹo.],
  [$p = frac(11, 21)$],
  loigiai: [
    #ppgiai[
      Đây là nhóm bài mà học sinh thường nhầm nhất giữa “đối tượng giống nhau” và “đối tượng phân biệt”. Vì kẹo giống nhau nên không được dùng chỉnh hợp hay hoán vị.
    ]

    *Bước 1: Tính mẫu số $N(F)$*

    Gọi $x_1, x_2, x_3, x_4$ là số kẹo vào bốn hộp. Điều kiện của không gian mẫu là:
    $
      x_1 + x_2 + x_3 + x_4 = 10, quad x_i >= 1.
    $

    Theo stars and bars:
    $
      N(F) = C_(10-1)^(4-1) = C_9^3 = 84.
    $

    *Bước 2: Tính tử số $N(E inter F)$*

    Ta cần thêm điều kiện $x_i <= 4$ với mọi $i$.

    Đặt $y_i = x_i - 1$ thì
    $
      y_1 + y_2 + y_3 + y_4 = 6, quad y_i >= 0,
    $

    và điều kiện $x_i <= 4$ trở thành $y_i <= 3$.

    Nếu chưa xét chặn trên, số nghiệm không âm là:
    $
      C_(6+4-1)^(4-1) = C_9^3 = 84.
    $

    Ta loại các nghiệm có ít nhất một $y_i >= 4$.

    Với một biến vi phạm, ví dụ $y_1 >= 4$, đặt $y_1 = z_1 + 4$. Khi đó:
    $
      z_1 + y_2 + y_3 + y_4 = 2.
    $

    Số nghiệm không âm là:
    $
      C_(2+4-1)^(4-1) = C_5^3 = 10.
    $

    Có $4$ cách chọn biến vi phạm, và không thể có đồng thời hai biến cùng $>= 4$ vì tổng chỉ bằng $6$.

    Do đó:
    $
      N(E inter F) = 84 - 4 dot 10 = 44.
    $

    *Bước 3: Tính xác suất*

    $
      p = frac(44, 84) = frac(11, 21).
    $

    #ans-box[Xác suất cần tìm là *$p = frac(11, 21)$*.]
  ],
)

== Nhóm 4 — Giới Hạn Tải Tối Đa Trên Hộp Có Tên

#tln(
  id: "XS-PP-04",
  [Một máy chủ phân phối ngẫu nhiên $9$ gói dữ liệu phân biệt vào $3$ kênh xử lý phân biệt. Biết rằng sau khi phân phối, không có kênh nào bị bỏ trống. Tính xác suất $p$ để mỗi kênh nhận nhiều nhất $4$ gói dữ liệu.],
  [$p = frac(371, 605)$],
  loigiai: [
    #ppgiai[
      Dạng này nên nghĩ theo “cấu hình tải”. Vì chỉ có $3$ kênh nên liệt kê các kiểu tải hợp lệ sẽ nhanh và sáng hơn nhiều so với EGF.
    ]

    *Bước 1: Tính mẫu số $N(F)$*

    Gọi $F$ là biến cố “cả $3$ kênh đều không rỗng”. Khi đó:
    $
      N(F) = 3^9 - C_3^1 2^9 + C_3^2 1^9.
    $

    Tính được:
    $
      N(F) = 19683 - 3 dot 512 + 3 = 18150.
    $

    *Bước 2: Tính tử số $N(E inter F)$*

    Điều kiện “mỗi kênh nhận nhiều nhất $4$ gói” cùng với tổng là $9$ cho các cấu hình tải dương hợp lệ sau:
    - $(4, 4, 1)$
    - $(4, 3, 2)$
    - $(3, 3, 3)$

    Ta đếm từng cấu hình.

    - *Cấu hình $(4,4,1)$*

      Có $frac(3!, 2!) = 3$ cách gán các tải này cho $3$ kênh có nhãn.

      Với một cách gán cụ thể, số cách chọn các gói dữ liệu là:
      $
        C_9^4 dot C_5^4 = 126 dot 5 = 630.
      $

      Vậy số cách là:
      $
        3 dot 630 = 1890.
      $

    - *Cấu hình $(4,3,2)$*

      Có $3! = 6$ cách gán tải cho ba kênh.

      Với một cách gán cụ thể, số cách chọn gói là:
      $
        C_9^4 dot C_5^3 = 126 dot 10 = 1260.
      $

      Suy ra số cách là:
      $
        6 dot 1260 = 7560.
      $

    - *Cấu hình $(3,3,3)$*

      Chỉ có một kiểu tải, và số cách chọn gói là:
      $
        C_9^3 dot C_6^3 = 84 dot 20 = 1680.
      $

    Cộng lại:
    $
      N(E inter F) = 1890 + 7560 + 1680 = 11130.
    $

    *Bước 3: Tính xác suất*

    $
      p = frac(11130, 18150) = frac(371, 605).
    $

    #ans-box[Xác suất hệ thống không quá tải là *$p = frac(371, 605)$*. Nếu đề hỏi $10^4 p$ thì phần nguyên là $6132$.]
  ],
)

#pagebreak()

== Nhóm 5 — Số Hộp Ít, Tải Gần Cố Định, Ưu Tiên Liệt Kê Cấu Hình

#tln(
  id: "XS-PP-05",
  [Có $6$ học sinh phân biệt gồm hai bạn lớp A, hai bạn lớp B và hai bạn lớp C được xếp ngẫu nhiên vào $3$ bàn phân biệt, mỗi bàn đúng $2$ học sinh. Tính xác suất $p$ để ở cả ba bàn đều không có hai bạn cùng lớp ngồi chung.],
  [$p = frac(8, 15)$],
  loigiai: [
    #ppgiai[
      Dạng này rất hợp với thi phổ thông: số bàn ít, tải mỗi bàn cố định, nên đếm trực tiếp theo cấu hình lớp là sáng nhất.
    ]

    *Bước 1: Tính mẫu số $N(F)$*

    Vì mỗi bàn đúng $2$ học sinh, ta chỉ cần đếm số cách phân $6$ học sinh phân biệt vào $3$ bàn phân biệt, mỗi bàn $2$ bạn:
    $
      N(F) = C_6^2 dot C_4^2 dot C_2^2 = 15 dot 6 dot 1 = 90.
    $

    *Bước 2: Tính tử số $N(E inter F)$*

    Để không có hai bạn cùng lớp ngồi chung, ba bàn bắt buộc phải có đúng ba kiểu ghép lớp:
    - một bàn kiểu AB,
    - một bàn kiểu AC,
    - một bàn kiểu BC.

    Trước hết, gán ba kiểu này cho ba bàn phân biệt: có
    $
      3! = 6
    $
    cách.

    Với một cách gán cố định, ví dụ bàn $1$ là AB, bàn $2$ là AC, bàn $3$ là BC:
    - chọn bạn lớp A đi cùng lớp B ở bàn $1$: $2$ cách,
    - chọn bạn lớp B ngồi cùng bạn A ở bàn $1$: $2$ cách,
    - chọn bạn lớp C ngồi với bạn A còn lại ở bàn $2$: $2$ cách.

    Sau đó mọi vị trí còn lại đều tự quyết định.

    Vậy với cách gán bàn cố định, có:
    $
      2 dot 2 dot 2 = 8
    $
    cách.

    Suy ra:
    $
      N(E inter F) = 6 dot 8 = 48.
    $

    *Bước 3: Tính xác suất*

    $
      p = frac(48, 90) = frac(8, 15).
    $

    #ans-box[Xác suất cần tìm là *$p = frac(8, 15)$*.]
  ],
)

// ═══════════════════════════════════════════════
// PHẦN III — TỔNG KẾT KIỂU THI 12
// ═══════════════════════════════════════════════
= III. Kỹ Thuật Giải Nhanh & Lưu Ý Định Hướng Thi 12

#local-theory-box[
  *Quy tắc vàng khi gặp xác suất có điều kiện trong bài toán phân phối:*

  1. Đề khóa gì thì mẫu số phải bám đúng cái đó.

  2. Nếu số hộp nhỏ, ưu tiên PIE hoặc liệt kê cấu hình tải trước.

  3. Nếu vật giống nhau, nghĩ ngay đến stars and bars hoặc dịch biến rồi mới xét chặn trên.

  4. Nếu đã biết tải cụ thể từng hộp, dùng đếm kiểu $frac(n!, a! b! c! ...)$ thay vì làm vòng vo.
]

#weapon-box(title: "Mức công cụ nên ưu tiên trong đề phổ thông 12")[
  - *Ưu tiên 1:* PIE cơ bản, stars and bars, chỉnh hợp, tổ hợp.

  - *Ưu tiên 2:* Liệt kê các cấu hình tải khi số hộp nhỏ.

  - *Ưu tiên 3:* Viết $m! S(n,m)$ như một ký hiệu tắt khi đã quen.

  - *Không nên lấy làm đường chính ở bản phổ thông:* EGF đa biến. Công cụ này đẹp và mạnh, nhưng thường làm lời giải dài, trừu tượng, và dễ làm học sinh mất phương hướng nếu đưa quá sớm.
]

#warn-box[
  Khi đề chưa khó đến mức bắt buộc, không nên mở lời giải bằng hàm sinh đa biến. Với mục tiêu bám kiểu thi phổ thông 12, hướng đúng là:

  - nhìn điều kiện,
  - đếm mẫu,
  - chọn công cụ nhẹ nhất,
  - lập tỉ số.
]

#align(center)[
  #table(
    columns: (1.1fr, 2.9fr),
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("E8F1F8") } else if calc.odd(y) { rgb("FAFAFA") } else { white },
    align: (center, left),
    table.header([*Kiểm tra cuối*], [*Câu hỏi phải tự trả lời trước khi bấm bút*]),
    [1], [Mẫu số của mình đã bám đúng điều kiện “đã biết rằng ...” chưa?],
    [2], [Vật là phân biệt hay giống nhau?],
    [3], [Hộp có nhãn hay không?],
    [4], [Có cần PIE hay chỉ cần liệt kê cấu hình tải là đủ?],
    [5], [Kết quả cuối là xác suất, phân số rút gọn, hay phần nguyên của $10^4 p$?],
  )
]
