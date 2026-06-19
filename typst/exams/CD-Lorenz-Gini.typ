#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *

#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
  footer: context align(right)[
    #text(size: 7.2pt, fill: rgb("7F8C8D"))[GV Nguyễn Văn Sang — Chuyên đề Khảo sát & Kinh tế]
  ],
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)

#show heading.where(level: 1): it => block(
  width: 100%,
  above: 1.8em,
  below: 1.2em,
  fill: gradient.linear(rgb("1B4F72"), rgb("117A65"), angle: 30deg),
  inset: (x: 14pt, y: 9pt),
  radius: 5pt,
  text(fill: white, size: 13pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.6em,
  stroke: (bottom: 2.5pt + rgb("E67E22")),
  inset: (bottom: 5pt),
  text(fill: rgb("E67E22"), size: 11.5pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ── Màu sắc chuyên đề ─────────────────────────────────────
#let eq-color = rgb("E74C3C")             // Đường bình đẳng tuyệt đối
#let dd-color = rgb("1A5276")             // Đường Lorenz
#let area-fill = rgb(180, 220, 255, 120)  // Vùng diện tích tích phân
#let fig-shadow = rgb(198, 210, 224, 70)

#let fig-panel(body) = block(
  fill: gradient.linear(rgb("FDFEFE"), rgb("EBF5FB"), angle: 90deg),
  stroke: 0.8pt + rgb("D4E6EC"),
  radius: 10pt,
  inset: (x: 8pt, y: 8pt),
)[#body]

// ── Tiêu đề chuyên đề ─────────────────────────────────────
#align(center)[
  #block(
    fill: gradient.linear(rgb("1B4F72"), rgb("117A65"), angle: 45deg),
    inset: (x: 22pt, y: 16pt),
    radius: 8pt,
    width: 100%,
  )[
    #text(fill: white, size: 18pt, weight: "bold")[ĐƯỜNG CONG LORENZ VÀ PHÂN PHỐI THU NHẬP NỀN KINH TẾ]
    #v(0.4em)
    #text(fill: rgb("AED6F1"), size: 10.5pt, style: "italic")[
      Khảo sát cơ cấu ngũ phân vị · Ý nghĩa đạo hàm biên · Thiết lập mô hình và dự báo trong đề thi
    ]
  ]
]
#v(0.8em)

#loinoidau[
  Đo lường cơ cấu và mức độ phân hóa thu nhập là một nội dung quan trọng trong kinh tế học vĩ mô và toán học ứng dụng. Trong các kỳ thi đánh giá năng lực và tuyển sinh, các bài toán thực tế khai thác *Đường cong Lorenz* xuất hiện ngày càng phổ biến dưới dạng khảo sát bảng số liệu rời rạc kết hợp với nội suy hàm số liên tục.

  Chuyên đề này được xây dựng nhằm giúp học sinh làm quen với các dạng bài toán thực tế: phân tích cơ cấu thu nhập từ bảng số liệu chia 5 nhóm (quintiles), hiểu ý nghĩa kinh tế học của đạo hàm đường Lorenz ($L'(x)$) để xác định mốc thu nhập trung bình xã hội, và sử dụng phương pháp tích phân, đạo hàm để xây dựng mô hình liên tục và đưa ra các dự báo phân phối thu nhập chính xác.
]

#muctieuchung[
  - Thành thạo kỹ thuật tính toán và phân tích cơ cấu thu nhập từng nhóm dân số từ bảng số liệu lũy kế.
  - Hiểu rõ ý nghĩa của đạo hàm $L'(x)$ và phương pháp xác định phân vị dân số có thu nhập bằng trung bình xã hội thông qua giải phương trình $L'(x) = 1$.
  - Biết cách sử dụng các mốc dữ liệu thực tế để nội suy tìm tham số cho mô hình đường cong Lorenz liên tục dạng đa thức $L(x) = a x^k + (1-a)x$.
  - Ứng dụng đạo hàm và tích phân để đưa ra các dự báo kinh tế lượng mang tính thực tiễn cao trong cấu trúc đề thi mới.
]

= I. LÝ THUYẾT NỀN TẢNG

== 1. Đường cong Lorenz và phân hoạch ngũ phân vị
#lythuyet[
  Giả sử một quốc gia (hoặc địa phương) có tổng dân số là $N$ và tổng thu nhập là $I$. Ta sắp xếp dân số theo thứ tự từ người có thu nhập thấp nhất đến người có thu nhập cao nhất.

  Gọi $x in [0; 1]$ là tỉ lệ cộng dồn dân số (từ $0%$ đến $100%$) và $L(x) in [0; 1]$ là tỉ lệ cộng dồn thu nhập tương ứng mà nhóm dân cư này sở hữu. Đường biểu diễn hàm số $y = L(x)$ được gọi là *Đường cong Lorenz*.

  Hai tính chất bắt buộc của mọi đường cong Lorenz:
  - *Điều kiện biên:* $L(0) = 0$ (chưa có ai thì chưa có thu nhập) và $L(1) = 1$ (cả xã hội sở hữu 100% thu nhập).
  - *Tính lồi:* đường cong nằm *bên dưới* đường thẳng bình đẳng $y = x$ (vì người nghèo luôn sở hữu phần thu nhập nhỏ hơn phần dân số của họ).

  Trong thực tế thống kê, dân số thường được chia thành 5 nhóm bằng nhau (mỗi nhóm chiếm $20%$ dân số), gọi là *Phân hoạch ngũ phân vị* (Quintiles). Tỉ lệ thu nhập sở hữu của mỗi nhóm là hiệu $S_i = L(x_i) - L(x_(i-1))$, trong đó $x_i$ là mốc dân số lũy kế tương ứng:
  #align(center)[
    #table(
      columns: (auto, auto, auto, 1fr),
      align: (left + horizon, center + horizon, center + horizon, left + horizon),
      stroke: 0.5pt + rgb("D4E6EC"),
      fill: (col, row) => if row == 0 { rgb("D6EAF8") } else if calc.odd(row) { rgb("FDFEFE") } else { white },
      table.cell(text(weight: "bold")[Nhóm]),
      table.cell(text(weight: "bold")[Khoảng dân số]),
      table.cell(text(weight: "bold")[Ký hiệu $S_i$]),
      table.cell(text(weight: "bold")[Công thức tính]),
      [1. Nghèo nhất], [$x in [0; 0.2]$], [$S_1$], [$L(0.2) - L(0) = L(0.2)$],
      [2. Cận nghèo], [$x in [0.2; 0.4]$], [$S_2$], [$L(0.4) - L(0.2)$],
      [3. Trung lưu], [$x in [0.4; 0.6]$], [$S_3$], [$L(0.6) - L(0.4)$],
      [4. Cận giàu], [$x in [0.6; 0.8]$], [$S_4$], [$L(0.8) - L(0.6)$],
      [5. Giàu nhất], [$x in [0.8; 1.0]$], [$S_5$], [$L(1.0) - L(0.8) = 1 - L(0.8)$],
    )
  ]

  Vì tổng tỉ lệ thu nhập của 5 nhóm phải bằng $100%$, ta có hệ thức kiểm tra nhanh: $S_1 + S_2 + S_3 + S_4 + S_5 = 1$.
]

== 2. Hàm nhiều công thức (đường gấp khúc) — Mô hình Lorenz thực tế từ dữ liệu rời rạc
#lythuyet[
  Trong thực tế khảo sát, ta thường chỉ có bảng số liệu lũy kế tại một số mốc dân số *rời rạc* (ví dụ $x_0=0, x_1=0.2, x_2=0.4, x_3=0.6, x_4=0.8, x_5=1$). Để biểu diễn *đường cong Lorenz thực tế*, ta nối các điểm dữ liệu $(x_i, L(x_i))$ bằng các đoạn thẳng liên tiếp — tạo thành một *đường gấp khúc* (polyline).

  Khi đó, $L_("thực tế")(x)$ được viết dưới dạng *hàm nhiều công thức* (piecewise function): trên mỗi khoảng $[x_(i-1), x_i]$ ta dùng một biểu thức đường thẳng riêng:

  $ L_("thực tế")(x) = cases(
    L(x_0) + (L(x_1) - L(x_0))/(x_1 - x_0) (x - x_0) & "khi " x in [x_0, x_1),
    L(x_1) + (L(x_2) - L(x_1))/(x_2 - x_1) (x - x_1) & "khi " x in [x_1, x_2),
    dots.v & dots.v,
    L(x_(n-1)) + (L(x_n) - L(x_(n-1)))/(x_n - x_(n-1)) (x - x_(n-1)) & "khi " x in [x_(n-1), x_n]
  ) $

  Trên mỗi khoảng con, *hệ số góc* chính là đạo hàm của hàm gấp khúc tại các điểm bên trong:
  $ L_("thực tế")'(x) = (L(x_i) - L(x_(i-1)))/(x_i - x_(i-1)) = (S_i)/(0.2) = 5 S_i quad ("với " x in (x_(i-1), x_i)) $

  Hệ số góc này có *ý nghĩa kinh tế học quan trọng*: nó chính là tỉ số thu nhập bình quân của nhóm $i$ so với thu nhập bình quân toàn xã hội (sẽ phân tích chi tiết ở Mục 3).
]

#nhanxet[
  - *"Hàm nhiều công thức" khác với "hàm đa trị" trong toán học:* Trên mỗi khoảng con ta dùng một công thức riêng, nhưng ứng với mỗi $x in [0; 1]$, hàm $L_("thực tế")(x)$ vẫn cho *đúng một* giá trị $L(x)$ duy nhất. Đây là hàm *đơn trị* (single-valued) nhưng có nhiều biểu thức con — tiện cho việc tính toán từng đoạn.
  - Hàm gấp khúc $L_("thực tế")(x)$ *liên tục* trên toàn $[0; 1]$ nhưng *không khả vi* tại các điểm nút $x = 0.2, 0.4, 0.6, 0.8$ (vì đạo hàm trái và phải tại đó khác nhau, tạo thành "góc" trên đường gấp khúc).
  - Vì hệ số góc tăng dần qua các đoạn (phản ánh bất bình đẳng tăng theo từng nhóm quintile), hàm gấp khúc là hàm *lồi* và nằm hoàn toàn dưới đường thẳng bình đẳng $y = x$.
]

#align(center)[
  #fig-panel(cetz.canvas(length: 5.2cm, {
    import cetz.draw: *
    let pts = ((0.0, 0.0), (0.2, 0.06), (0.4, 0.18), (0.6, 0.38), (0.8, 0.68), (1.0, 1.0))

    // Diện tích dưới đường Lorenz
    let area_pts = ((0.0, 0.0), (0.2, 0.06), (0.4, 0.18), (0.6, 0.38), (0.8, 0.68), (1.0, 1.0), (1.0, 0.0), (0.0, 0.0))
    merge-path(fill: area-fill, stroke: none, close: true, { line(..area_pts) })

    // Lưới tọa độ mờ
    for p in pts {
      if p.at(0) > 0.0 and p.at(0) < 1.0 {
        line((p.at(0), 0.0), p, stroke: (dash: "dotted", paint: rgb("BDC3C7"), thickness: 0.5pt))
        line((0.0, p.at(1)), p, stroke: (dash: "dotted", paint: rgb("BDC3C7"), thickness: 0.5pt))
      }
    }

    // Đường bình đẳng tuyệt đối
    line((0.0, 0.0), (1.0, 1.0), stroke: (paint: eq-color, dash: "dashed", thickness: 1pt))

    // Đường Lorenz gấp khúc
    line(..pts, stroke: 1.8pt + dd-color)

    // Các điểm dữ liệu
    for p in pts {
      circle(p, radius: 2.2pt, fill: rgb("E74C3C"), stroke: 0.5pt + white)
    }

    // Đánh dấu hệ số góc (đạo hàm) từng đoạn
    let midpts = ((0.1, 0.03), (0.3, 0.12), (0.5, 0.28), (0.7, 0.53), (0.9, 0.84))
    let slopes = ($0.30$, $0.60$, $1.00$, $1.50$, $1.60$)
    for ((m, s)) in midpts.zip(slopes) {
      content(m, text(size: 6.5pt, fill: rgb("7D3C98"))[#s])
    }

    // Trục tọa độ
    line((-0.05, 0.0), (1.1, 0.0), mark: (end: ">"), stroke: 0.6pt)
    line((0.0, -0.05), (0.0, 1.1), mark: (end: ">"), stroke: 0.6pt)
    content((1.08, -0.05), $x$)
    content((-0.08, 1.08), $L(x)$)

    // Nhãn trục hoành
    for (xx, lbl) in ((0.0, [0]), (0.2, [0.2]), (0.4, [0.4]), (0.6, [0.6]), (0.8, [0.8]), (1.0, [1])) {
      content((xx, -0.05), text(size: 7.5pt)[#lbl])
    }
    // Nhãn trục tung
    for (yy, lbl) in ((0.06, [0.06]), (0.18, [0.18]), (0.38, [0.38]), (0.68, [0.68]), (1.0, [1])) {
      content((-0.07, yy), text(size: 7.5pt)[#lbl])
    }

    // Ghi chú
    content((0.50, 0.58), text(fill: eq-color, size: 7.5pt)[$y = x$], angle: 45deg)
    content((0.78, 0.40), text(fill: dd-color, size: 7.5pt)[$L_("thực tế")(x)$ — đường gấp khúc])
    content((0.45, -0.13), text(size: 6.8pt, fill: rgb("7D3C98"))[Hệ số góc $L'(x)$ từng đoạn])
  }))
]

== 3. Ý nghĩa kinh tế học của đạo hàm đường Lorenz
#lythuyet[
  Gọi $mu = I/N$ là mức thu nhập trung bình của toàn nền kinh tế.

  Xét một nhóm dân số rất nhỏ ở phân vị $x$ có quy mô là $N  dif  x$. Tỉ lệ thu nhập tích lũy lũy kế của nhóm này tăng thêm một lượng là $ dif  L = L'(x)  dif  x$.
  Do đó, tổng thu nhập thực tế của nhóm dân số này bằng:
  $  dif  I = I  dif  L = I L'(x)  dif  x $

  Mức thu nhập bình quân đầu người của nhóm dân cư nhỏ ở phân vị $x$ là:
  $ y(x) = ( dif  I) / (N  dif  x) = (I L'(x)  dif  x) / (N  dif  x) = (I) / (N) L'(x) = mu L'(x) $

  Từ đó, ta có công thức liên hệ trực tiếp:
  $ (y(x)) / (mu) = L'(x) $

  *Ý nghĩa của đạo hàm $L'(x)$:*
  - Đạo hàm $L'(x)$ tại điểm $x$ chính là *tỉ số giữa thu nhập của cá nhân ở phân vị $x$ và thu nhập trung bình của toàn xã hội*.
  - Vì đường Lorenz là hàm lồi ($L''(x)  >=  0$), nên đạo hàm $L'(x)$ là hàm đồng biến (tăng dần từ trái sang phải), phản ánh việc cá nhân ở phân vị dân số cao hơn sẽ có mức thu nhập cao hơn.
  - Điểm chuyển tiếp đặc biệt là nơi phương trình $L'(x) = 1$ có nghiệm $x = x_0$. Tại phân vị $x_0$, cá nhân có thu nhập *đúng bằng* thu nhập trung bình của toàn xã hội.
    - Nhóm dân cư ở phân vị $x < x_0$ có thu nhập dưới mức trung bình xã hội ($L'(x) < 1$).
    - Nhóm dân cư ở phân vị $x > x_0$ có thu nhập trên mức trung bình xã hội ($L'(x) > 1$).
]

#nhanxet[
  - *Hệ quả trực tiếp cho hàm gấp khúc:* Trên mỗi đoạn $(x_(i-1), x_i)$, đạo hàm $L_("thực tế")'(x) = S_i / 0.2 = 5 S_i$ là hằng số — nghĩa là *mọi cá nhân trong cùng nhóm quintile đều có cùng tỉ lệ thu nhập so với trung bình xã hội*. Đây là một giả định của mô hình rời rạc.
  - *Đơn vị đạo hàm:* $L'(x)$ là đại lượng không thứ nguyên (vì cả $L$ và $x$ đều là tỉ lệ), nên có thể so sánh trực tiếp với $1$.
  - *Mốc $L'(x) = 1$* là *ranh giới phân tầng kinh tế*: bên trái là nhóm dưới trung bình, bên phải là nhóm trên trung bình. Đây là ý nghĩa thường gặp nhất trong các đề thi.
]

== 4. Tổng hợp các tính chất cần nhớ
#nhanxet[
  *Ba tính chất nền tảng của đường cong Lorenz (dùng để kiểm tra tính hợp lệ của một mô hình):*
  + *Điều kiện biên:* $L(0) = 0$ và $L(1) = 1$ — mọi mô hình Lorenz đều phải thỏa mãn.
  + *Tính đồng biến:* $L'(x)  >=  0$ — tỉ lệ thu nhập tích lũy không bao giờ giảm khi ta cộng thêm người.
  + *Tính lồi:* $L''(x)  >=  0$ — phản ánh bất bình đẳng thu nhập (cá nhân thu nhập cao ở phân vị sau luôn có thu nhập không thấp hơn cá nhân ở phân vị trước).

  *Hai cách biểu diễn phổ biến và mối liên hệ:*
  + *Đường gấp khúc* (từ bảng số liệu rời rạc): nối các điểm dữ liệu bằng đoạn thẳng — dạng hàm nhiều công thức, đạo hàm là hằng số trên từng đoạn.
  + *Đường cong trơn* (mô hình hóa liên tục): thường dùng đa thức $L(x) = a x^k + (1-a) x$ — đạo hàm $L'(x)$ thay đổi liên tục.
  + Cả hai cách đều phải nằm *dưới* đường thẳng bình đẳng $y = x$.

  *Ba "con số vàng" thường xuất hiện trong đề thi:*
  + *Nghiệm $L'(x) = 1$* → mốc dân số có thu nhập đúng bằng trung bình xã hội.
  + *Nghiệm $L'(x) = k$* ($k > 1$) → mốc dân số có thu nhập gấp $k$ lần trung bình.
  + *Tỉ số $S_5 / S_1$* → đo mức chênh lệch giữa nhóm giàu nhất và nghèo nhất (cùng quy mô 20%).
]

= II. CÁC DẠNG TOÁN VÀ PHƯƠNG PHÁP GIẢI

== Dạng 1. Khai thác cơ cấu thu nhập từ bảng số liệu rời rạc (Ngũ phân vị)
#phuongphap[
  Cho bảng thống kê ngũ phân vị rời rạc gồm các mốc lũy kế dân số $x_i = 0; 0.2; 0.4; 0.6; 0.8; 1.0$ và các giá trị thu nhập lũy kế tương ứng $y_i = L(x_i)$.
  - *Tỉ lệ thu nhập của nhóm thứ $i$ (chiếm 20% dân số):* $S_i = y_i - y_(i-1)$.
  - *Tỉ số thu nhập bình quân giữa nhóm giàu nhất và nhóm nghèo nhất:*
    Vì quy mô dân số mỗi nhóm bằng nhau (đều là $20%$), tỉ số thu nhập bình quân giữa nhóm giàu nhất (Nhóm 5) và nhóm nghèo nhất (Nhóm 1) bằng tỉ số tổng thu nhập của hai nhóm đó:
    $ R = (S_5) / (S_1) = (1 - y_4) / (y_1) $
  - *Tỉ số thu nhập bình quân của một nhóm so với trung bình xã hội:*
    Thu nhập bình quân của nhóm $i$ bằng $y_("bq", i) = (I  cdot  S_i) / (0.2 N) = (S_i) / (0.2)  mu $. Do đó, tỉ số này bằng:
    $ (y_("bq", i)) / ( mu ) = (S_i) / (0.2) = 5 S_i $
]

#vd(
  [Một nhóm khảo sát kinh tế thu thập dữ liệu về phân phối thu nhập của một địa phương và chia dân số thành 5 nhóm bằng nhau. Tỉ lệ cộng dồn thu nhập tích lũy tương ứng được cho trong bảng sau:
  #align(center)[
    #table(
      columns: (2.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
      align: center + horizon,
      [*Mốc dân số lũy kế ($x$)*], [0%], [20%], [40%], [60%], [80%], [100%],
      [*Thu nhập tích lũy ($L(x)$)*], [0%], [4%], [12%], [28%], [56%], [100%]
    )
  ]
  (a) Hãy xác định tỉ lệ thu nhập sở hữu của từng nhóm trong 5 nhóm dân số nói trên.
  (b) Tính tỉ số giữa thu nhập bình quân của nhóm $20%$ dân số giàu nhất và nhóm $20%$ dân số nghèo nhất.
  (c) Thu nhập bình quân của một hộ gia đình thuộc nhóm $20%$ dân số giàu nhất gấp bao nhiêu lần thu nhập bình quân của toàn bộ địa phương?
  (d) Thiết lập công thức hàm số phân đoạn $L_("thực tế")(x)$ biểu diễn đường cong Lorenz thực tế dưới dạng các đoạn gấp khúc nối các điểm dữ liệu rời rạc và vẽ đồ thị biểu diễn hàm số phân đoạn này.],
  loigiai: [
    Ta chuyển đổi các mốc dân số và tỉ lệ thu nhập tích lũy sang số thập phân:
    Các mốc dân số: $x_0=0; x_1=0.2; x_2=0.4; x_3=0.6; x_4=0.8; x_5=1.0$.
    Các mốc thu nhập tích lũy: $y_0=0; y_1=0.04; y_2=0.12; y_3=0.28; y_4=0.56; y_5=1.0$.

    (a) Tỉ lệ thu nhập sở hữu của từng nhóm dân cư $20%$:
    - Nhóm 1 (20% nghèo nhất): $S_1 = y_1 - y_0 = 0.04 - 0 = 0.04$ (tương ứng $4%$).
    - Nhóm 2 (20% cận nghèo): $S_2 = y_2 - y_1 = 0.12 - 0.04 = 0.08$ (tương ứng $8%$).
    - Nhóm 3 (20% trung lưu): $S_3 = y_3 - y_2 = 0.28 - 0.12 = 0.16$ (tương ứng $16%$).
    - Nhóm 4 (20% cận giàu): $S_4 = y_4 - y_3 = 0.56 - 0.28 = 0.28$ (tương ứng $28%$).
    - Nhóm 5 (20% giàu nhất): $S_5 = y_5 - y_4 = 1.0 - 0.56 = 0.44$ (tương ứng $44%$).

    (b) Tỉ số thu nhập bình quân của nhóm giàu nhất (Nhóm 5) so với nhóm nghèo nhất (Nhóm 1):
    Vì dân số hai nhóm bằng nhau nên tỉ số thu nhập bình quân bằng tỉ số tổng thu nhập:
    $ R = (S_5) / (S_1) = (0.44) / (0.04) = bold(11) " lần" $

    (c) Tỉ số giữa thu nhập bình quân của nhóm giàu nhất và thu nhập bình quân toàn địa phương:
    $ (y_("bq", 5)) / (mu) = (S_5) / (0.2) = (0.44) / (0.2) = bold(2.2) " lần" $

    (d) Thiết lập công thức hàm số phân đoạn $L_("thực tế")(x)$ biểu diễn đường cong Lorenz:
    Đường cong Lorenz thực tế được lập bằng cách nối các điểm dữ liệu rời rạc $(x_i, y_i)$ bằng các đoạn thẳng. Phương trình đường thẳng đi qua hai điểm $(x_(i-1), y_(i-1))$ và $(x_i, y_i)$ có dạng:
    $ L_("thực tế")(x) = y_(i-1) + (y_i - y_(i-1)) / (x_i - x_(i-1)) (x - x_(i-1)) $
    
    Với các mốc dân số cách đều $0.2$, ta tính các đoạn hàm số cụ thể như sau:
    - Với $x in [0; 0.2]$: $L_("thực tế")(x) = 0 + (0.04 - 0) / (0.2) (x - 0) = 0.2 x$.
    - Với $x in [0.2; 0.4]$: $L_("thực tế")(x) = 0.04 + (0.12 - 0.04) / (0.2) (x - 0.2) = 0.4 x - 0.04$.
    - Với $x in [0.4; 0.6]$: $L_("thực tế")(x) = 0.12 + (0.28 - 0.12) / (0.2) (x - 0.4) = 0.8 x - 0.2$.
    - Với $x in [0.6; 0.8]$: $L_("thực tế")(x) = 0.28 + (0.56 - 0.28) / (0.2) (x - 0.6) = 1.4 x - 0.56$.
    - Với $x in [0.8; 1.0]$: $L_("thực tế")(x) = 0.56 + (1.0 - 0.56) / (0.2) (x - 0.8) = 2.2 x - 1.2$.

    Tổng hợp lại, ta được hàm số phân đoạn:
    $ L_("thực tế") (x) = cases(
      0.2 x & "khi " 0 <= x < 0.2,
      0.4 x - 0.04 & "khi " 0.2 <= x < 0.4,
      0.8 x - 0.2 & "khi " 0.4 <= x < 0.6,
      1.4 x - 0.56 & "khi " 0.6 <= x < 0.8,
      2.2 x - 1.2 & "khi " 0.8 <= x <= 1
    ) $

    *Vẽ đồ thị biểu diễn đường Lorenz thực tế gấp khúc:*
    #align(center)[
      #fig-panel(cetz.canvas(length: 4.8cm, {
        import cetz.draw: *
        let pts = ((0.0, 0.0), (0.2, 0.04), (0.4, 0.12), (0.6, 0.28), (0.8, 0.56), (1.0, 1.0))
        
        // Vẽ diện tích dưới đường Lorenz
        let area_pts = ((0.0, 0.0), (0.2, 0.04), (0.4, 0.12), (0.6, 0.28), (0.8, 0.56), (1.0, 1.0), (1.0, 0.0), (0.0, 0.0))
        merge-path(fill: area-fill, stroke: none, close: true, { line(..area_pts) })
        
        // Vẽ lưới tọa độ mờ
        for p in pts {
          if p.at(0) > 0.0 and p.at(0) < 1.0 {
            line((p.at(0), 0.0), p, stroke: (dash: "dotted", paint: rgb("BDC3C7"), thickness: 0.5pt))
            line((0.0, p.at(1)), p, stroke: (dash: "dotted", paint: rgb("BDC3C7"), thickness: 0.5pt))
          }
        }
        
        // Đường bình đẳng tuyệt đối
        line((0.0, 0.0), (1.0, 1.0), stroke: (paint: eq-color, dash: "dashed", thickness: 1pt))
        
        // Đường Lorenz thực tế gấp khúc
        line(..pts, stroke: 1.8pt + dd-color)
        
        // Các điểm dữ liệu rời rạc
        for p in pts {
          circle(p, radius: 2.2pt, fill: rgb("E74C3C"), stroke: 0.5pt + white)
        }
        
        // Trục tọa độ
        line((-0.05, 0.0), (1.1, 0.0), mark: (end: ">"), stroke: 0.6pt)
        line((0.0, -0.05), (0.0, 1.1), mark: (end: ">"), stroke: 0.6pt)
        
        content((1.08, -0.05), $x$)
        content((-0.08, 1.08), $L(x)$)
        
        // Nhãn trục hoành
        content((0.0, -0.05), text(size: 8pt)[$0$])
        content((0.2, -0.05), text(size: 8pt)[$0.2$])
        content((0.4, -0.05), text(size: 8pt)[$0.4$])
        content((0.6, -0.05), text(size: 8pt)[$0.6$])
        content((0.8, -0.05), text(size: 8pt)[$0.8$])
        content((1.0, -0.05), text(size: 8pt)[$1.0$])
        
        // Nhãn trục tung
        content((-0.07, 0.04), text(size: 8pt)[$0.04$])
        content((-0.07, 0.12), text(size: 8pt)[$0.12$])
        content((-0.07, 0.28), text(size: 8pt)[$0.28$])
        content((-0.07, 0.56), text(size: 8pt)[$0.56$])
        content((-0.07, 1.0), text(size: 8pt)[$1.0$])
        
        // Ghi chú tên đường
        content((0.45, 0.55), text(fill: eq-color, size: 8pt)[$y = x$], angle: 45deg)
        content((0.78, 0.38), text(fill: dd-color, size: 8pt)[$L_("thực tế") (x)$])
      }))
    ]

    *Kết luận:* Hộ gia đình thuộc nhóm 20% giàu nhất có thu nhập bình quân gấp 11 lần nhóm 20% nghèo nhất, và gấp 2.2 lần trung bình của toàn địa phương. Hàm số Lorenz thực tế được ghép bởi 5 đoạn thẳng nối tiếp tạo thành một đường cong lồi gấp khúc nằm dưới đường thẳng bình đẳng.
  ]
)

== Dạng 2. Thiết lập mô hình đường cong Lorenz liên tục từ dữ liệu thực tế
#phuongphap[
  Để xây dựng mô hình liên tục từ dữ liệu rời rạc, ta giả định đường cong Lorenz tuân theo hàm đa thức có dạng:
  $ L(x) = a x^k + (1-a)x quad ("với " k >= 2 " là số nguyên và " a in [0; 1]) $
  Mô hình này luôn tự động thỏa mãn các điều kiện biên $L(0) = 0$ và $L(1) = 1$.
  
  Để xác định tham số $a$, ta sử dụng một mốc dữ liệu thực tế từ bảng số liệu thống kê. Thông thường, mốc $x = 0.8$ (nhóm 80% dân số nghèo nhất) là mốc ổn định và phản ánh rõ nét nhất phân hóa thu nhập. 
  Sau khi tìm được tham số $a$, ta tiến hành kiểm chứng sự phù hợp của mô hình bằng cách so sánh các giá trị dự báo $L(x_i)$ với các mốc thực tế còn lại trong bảng.
]

#vd(
  [Dựa trên bảng số liệu thống kê ở Dạng 1, một chuyên gia kinh tế lượng đề xuất mô hình hóa đường cong Lorenz của địa phương bằng hàm số liên tục có dạng:
  $ L(x) = a x^3 + (1-a)x quad ("với " x in [0; 1]) $
  (a) Sử dụng mốc thực tế tại dân số lũy tích $x = 0.8$ sở hữu $56%$ tổng thu nhập để tìm giá trị tham số $a$.
  (b) Hãy dùng hàm số tìm được để dự báo tỉ lệ thu nhập tích lũy tại các mốc dân số $x = 0.2; 0.4; 0.6$ và đối chiếu với dữ liệu thực tế trong bảng.],
  loigiai: [
    #reset-step()
    #step[
      *Tìm giá trị tham số $a$:*
      Theo đề bài, tại $x = 0.8$, tỉ lệ thu nhập tích lũy thực tế là $L(0.8) = 0.56$.
      Thay giá trị vào phương trình mô hình:
      $ L(0.8) = a  cdot  (0.8)^3 + (1-a)  cdot  0.8 = 0.56 $
      $ a  cdot  0.512 + 0.8 - 0.8 a = 0.56 $
      $ -0.288 a = 0.56 - 0.8 = -0.24 $
      $ a = (-0.24) / (-0.288) = (240) / (288) = bold((5) / (6)) $
      
      Vậy mô hình đường cong Lorenz của địa phương được xác định là:
      $ L(x) = (5) / (6) x^3 + (1) / (6) x $
    ]
    #step[
      *Kiểm chứng dự báo của mô hình:*
      Ta tính toán giá trị của hàm số $L(x)$ tại các mốc phân vị $x = 0.2; 0.4; 0.6$:
      - Tại $x = 0.2$:
        $ L(0.2) = (5) / (6)(0.2)^3 + (1) / (6)(0.2) = (5) / (6)  cdot  0.008 + (0.2) / (6) = (0.04 + 0.2) / (6) = (0.24) / (6) = 0.04 " (tương ứng " 4% ")" $
      - Tại $x = 0.4$:
        $ L(0.4) = (5) / (6)(0.4)^3 + (1) / (6)(0.4) = (5) / (6)  cdot  0.064 + (0.4) / (6) = (0.32 + 0.4) / (6) = (0.72) / (6) = 0.12 " (tương ứng " 12% ")" $
      - Tại $x = 0.6$:
        $ L(0.6) = (5) / (6)(0.6)^3 + (1) / (6)(0.6) = (5) / (6)  cdot  0.216 + (0.6) / (6) = (1.08 + 0.6) / (6) = (1.68) / (6) = 0.28 " (tương ứng " 28% ")" $
      
      *Đối chiếu:* Các kết quả dự báo của mô hình tại mốc $20%$, $40%$, $60%$ lần lượt là $4%$, $12%$, $28%$ trùng khớp hoàn toàn với các số liệu thống kê thực tế trong bảng. Mô hình đề xuất có độ chính xác tuyệt đối.
    ]
  ]
)

== Dạng 3. Dự báo và xác định ngưỡng thu nhập bằng đạo hàm
#phuongphap[
  Để xác định phân vị dân cư có mức thu nhập đạt một ngưỡng so với trung bình xã hội, ta sử dụng ý nghĩa kinh tế học của đạo hàm:
  - Để tìm mốc dân số tích lũy $x$ mà tại đó cá nhân có thu nhập đúng bằng mức trung bình của xã hội, ta giải phương trình đạo hàm:
    $ L'(x) = 1 $
  - Để tìm mốc dân số tích lũy $x$ mà tại đó cá nhân có thu nhập bằng $k$ lần thu nhập trung bình xã hội, ta giải:
    $ L'(x) = k $
]

#vd(
  [Sử dụng mô hình đường cong Lorenz liên tục đã thiết lập được ở Dạng 2:
  $ L(x) = (5) / (6) x^3 + (1) / (6) x $
  (a) Tìm phân vị dân số tích lũy $x$ mà tại đó cá nhân có mức thu nhập đúng bằng mức thu nhập trung bình của toàn địa phương.
  (b) Một cá nhân có thu nhập bằng $1.25$ lần mức thu nhập trung bình của địa phương thì nằm ở phân vị dân số tích lũy nào?],
  loigiai: [
    #reset-step()
    #step[
      *Tìm mốc thu nhập đúng bằng mức trung bình xã hội:*
      Đạo hàm của hàm số Lorenz biểu thị tỉ số thu nhập của cá nhân ở phân vị $x$ so với thu nhập trung bình xã hội:
      $ L'(x) = (5) / (2) x^2 + (1) / (6) $
      
      Để thu nhập của một cá nhân đúng bằng thu nhập trung bình của địa phương, ta giải phương trình:
      $ L'(x) = 1  =>  (5) / (2) x^2 + (1) / (6) = 1 $
      $ (5) / (2) x^2 = (5) / (6)  =>  x^2 = (5) / (6)  times  (2) / (5) = (1) / (3) $
      Vì $x  in  [0; 1]$, ta nhận nghiệm duy nhất:
      $ x = (1) / ( sqrt(3))  approx  bold(0.5774) " (tương ứng " 57.74% ")" $
      
      *Ý nghĩa:* Mốc $57.74%$ là ranh giới phân tầng. Nhóm $57.74%$ dân số nghèo nhất địa phương đều có thu nhập cá nhân thấp hơn mức trung bình xã hội.
    ]
    #step[
      *Tìm mốc thu nhập bằng 1.25 lần trung bình:*
      Ta giải phương trình đạo hàm:
      $ L'(x) = 1.25  =>  (5) / (2) x^2 + (1) / (6) = 1.25 = (5) / (4) $
      $ (5) / (2) x^2 = (5) / (4) - (1) / (6) = (15 - 2) / (12) = (13) / (12) $
      $ x^2 = (13) / (12)  times  (2) / (5) = (13) / (30) $
      Vì $x  in  [0; 1]$, ta có:
      $ x =  sqrt((13) / (30))  approx  bold(0.6583) " (tương ứng " 65.83% ")" $
      
      *Kết luận:* Cá nhân ở phân vị dân số tích lũy khoảng $65.83%$ sẽ có thu nhập bằng đúng $1.25$ lần trung bình của địa phương.
    ]
  ]
)

= III. BỘ CÂU HỎI TRẮC NGHIỆM TỰ LUYỆN

#let (tn, ds, tln, tl) = exam-mode(mode: "loigiai", accent: classic.blue)

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án chọn])

#tn(
  [Khảo sát phân phối thu nhập của một vùng nông thôn được chia thành 5 nhóm dân số bằng nhau (mỗi nhóm chiếm $20%$ số hộ gia đình). Tỉ lệ cộng dồn thu nhập tích lũy lũy kế từ nhóm nghèo nhất đến nhóm giàu nhất lần lượt ghi nhận các giá trị: $0%$, $4%$, $12%$, $28%$, $56%$, $100%$. Tỉ số giữa thu nhập bình quân của nhóm $20%$ dân số giàu nhất và nhóm $20%$ dân số nghèo nhất của vùng này bằng bao nhiêu?],
  (
    [$9$ lần],
    [$10$ lần],
    True([$11$ lần]),
    [$12$ lần]
  ),
  loigiai: [
    #reset-step()
    #step[
      Dựa trên bảng số liệu lũy tích ngũ phân vị:
      - Tỉ lệ thu nhập của nhóm 20% nghèo nhất (Nhóm 1): $S_1 = L(0.2) = 4%$.
      - Tỉ lệ thu nhập của nhóm 20% giàu nhất (Nhóm 5): $S_5 = L(1.0) - L(0.8) = 100% - 56% = 44%$.
    ]
    #step[
      Vì quy mô dân số của hai nhóm là bằng nhau (đều là $20%$ tổng dân số), nên tỉ số thu nhập bình quân đầu người giữa hai nhóm bằng tỉ số tổng thu nhập sở hữu của chúng:
      $ R = (S_5) / (S_1) = (44%) / (4%) = bold(11) " lần" $
      Vậy phương án đúng là *C*.
    ]
  ]
)

#tn(
  [Để mô hình hóa phân phối thu nhập của một quốc gia, nhà kinh tế sử dụng đường cong Lorenz liên tục có dạng:
  $ L(x) = (5) / (6) x^3 + (1) / (6) x quad ("với " x in [0; 1]) $
  Biết rằng đạo hàm $L'(x)$ biểu thị tỉ số giữa thu nhập cá nhân ở phân vị $x$ và mức thu nhập trung bình toàn xã hội. Hãy xác định phân vị dân số tích lũy $x$ mà tại đó cá nhân có thu nhập đúng bằng mức trung bình xã hội (làm tròn kết quả đến hàng phần mười của phần trăm).],
  (
    [$50.0%$],
    True([$57.7%$]),
    [$60.0%$],
    [$66.7%$]
  ),
  loigiai: [
    #reset-step()
    #step[
      Theo ý nghĩa kinh tế học của đạo hàm, thu nhập cá nhân ở phân vị $x$ bằng trung bình xã hội khi và chỉ khi đạo hàm $L'(x) = 1$.
      Ta tính đạo hàm của hàm số:
      $ L'(x) = (5) / (2) x^2 + (1) / (6) $
    ]
    #step[
      Giải phương trình đạo hàm bằng 1:
      $ (5) / (2) x^2 + (1) / (6) = 1  =>  (5) / (2) x^2 = (5) / (6)  =>  x^2 = (1) / (3) $
      Vì $x  in  [0; 1]$ nên ta nhận nghiệm duy nhất:
      $ x = (1) / ( sqrt(3))  approx  0.57735 " (tương ứng " bold(57.7%) ")" $
      Vậy phương án đúng là *B*.
    ]
  ]
)

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng/Sai])

#ds(
  [Một cuộc điều tra thu nhập dân cư tại một vùng nông nghiệp được chia thành 5 nhóm bằng nhau (ngũ phân vị), ghi nhận bảng phân phối thu nhập lũy kế thực tế:
  #align(center)[
    #table(
      columns: (2.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
      align: center + horizon,
      [*Mốc dân số lũy kế ($x$)*], [0%], [20%], [40%], [60%], [80%], [100%],
      [*Thu nhập tích lũy ($L(x)$)*], [0%], [4%], [12%], [28%], [56%], [100%]
    )
  ]
  Các khẳng định sau đây về phân phối thu nhập của vùng là đúng hay sai?],
  (
    True([Theo bảng số liệu, nhóm $40%$ dân số có thu nhập thấp nhất sở hữu tổng cộng $12%$ tổng thu nhập của cả vùng.]),
    True([Thu nhập bình quân của một hộ gia đình thuộc nhóm $20%$ dân số giàu nhất bằng đúng $2.2$ lần mức thu nhập bình quân của toàn vùng nông nghiệp.]),
    True([Hiệu số tỉ lệ thu nhập sở hữu giữa nhóm $20%$ dân số trung lưu (từ mốc $40%$ đến $60%$) và nhóm $20%$ dân số nghèo nhất là $12%$.]),
    False([Nếu sử dụng mô hình liên tục $L(x) = a x^3 + (1-a)x$ để nội suy số liệu trên từ duy nhất điểm nút thực tế $(0.8; 0.56)$, ta sẽ tìm được giá trị tham số $a = 0.85$.])
  ),
  loigiai: [
    #reset-step()
    #step[
      *Khẳng định A: ĐÚNG.*
      Tại mốc dân số lũy tích $x = 0.4$ (nhóm 40% dân số nghèo nhất), tỉ lệ thu nhập lũy tích là $L(0.4) = 0.12 = 12%$.
    ]
    #step[
      *Khẳng định B: ĐÚNG.*
      - Tỉ lệ thu nhập sở hữu của nhóm 20% giàu nhất (Nhóm 5) là: $S_5 = L(1.0) - L(0.8) = 1.0 - 0.56 = 0.44 = 44%$.
      - Thu nhập bình quân của nhóm này so với toàn vùng bằng: $(S_5) / (0.2) = (44%) / (20%) = 2.2$ lần.
    ]
    #step[
      *Khẳng định C: ĐÚNG.*
      - Nhóm 3 (trung lưu từ 40% đến 60%) sở hữu: $S_3 = L(0.6) - L(0.4) = 0.28 - 0.12 = 0.16 = 16%$.
      - Nhóm 1 (nghèo nhất từ 0% đến 20%) sở hữu: $S_1 = L(0.2) = 0.04 = 4%$.
      - Hiệu số tỉ lệ sở hữu: $16% - 4% = 12%$.
    ]
    #step[
      *Khẳng định D: SAI.*
      Thay mốc $(0.8; 0.56)$ vào phương trình $L(0.8) = a  cdot  0.8^3 + (1-a)  cdot  0.8 = 0.56$.
      Ta giải ra được $a = 5/6  approx  0.833$ (hoặc 83.33%) chứ không phải $0.85$.
    ]
  ]
)

#ds(
  [Để mô hình hóa sự phân phối thu nhập tích lũy lý thuyết, người ta sử dụng mô hình đường cong Lorenz dạng lũy thừa đơn giản:
  $ L(x) = x^k quad ("với " k >= 1 " là số thực") $
  Đạo hàm $L'(x)$ biểu thị tỉ số thu nhập của cá nhân ở phân vị dân số $x$ so với trung bình toàn xã hội. Các khẳng định sau đây về mô hình là đúng hay sai?],
  (
    True([Với mô hình $L(x) = x^2$ (chỉ số $k = 2$), phân vị dân số có thu nhập đúng bằng trung bình toàn xã hội là $x = 0.50$ (tức là mốc trung vị).]),
    True([Với mọi mô hình lũy thừa dạng $L(x) = x^k$ ($k > 1$), cá nhân giàu nhất xã hội (tại phân vị $x = 1$) luôn có thu nhập gấp $k$ lần thu nhập trung bình xã hội.]),
    False([Khi chỉ số lũy thừa $k$ tăng lên thì tỉ lệ thu nhập tích lũy sở hữu bởi nhóm $20%$ dân số nghèo nhất ($x  in  [0; 0.2]$) sẽ tăng lên.]),
    True([Với mô hình $L(x) = x^3$ (chỉ số $k = 3$), mốc dân số tích lũy có thu nhập đúng bằng trung bình xã hội là $x  approx  0.58$.])
  ),
  loigiai: [
    #reset-step()
    #step[
      *Khẳng định A: ĐÚNG.*
      Với $L(x) = x^2  =>  L'(x) = 2x$. Giải $L'(x) = 1  =>  2x = 1  =>  x = 0.50$.
    ]
    #step[
      *Khẳng định B: ĐÚNG.*
      Với $L(x) = x^k  =>  L'(x) = k x^(k-1)$.
      Tại phân vị $x = 1$, ta có $L'(1) = k  cdot  (1)^(k-1) = k$. Điều này có nghĩa cá nhân giàu nhất có thu nhập bằng đúng $k$ lần mức trung bình toàn xã hội.
    ]
    #step[
      *Khẳng định C: SAI.*
      Tỉ lệ thu nhập sở hữu bởi nhóm 20% nghèo nhất là $L(0.2) = 0.2^k$.
      Vì cơ số $0.2 < 1$, nên khi số mũ $k$ tăng lên thì giá trị lũy thừa $0.2^k$ sẽ *giảm đi* (phản ánh bất bình đẳng gia tăng, nhóm nghèo càng sở hữu ít thu nhập hơn), chứ không tăng lên.
    ]
    #step[
      *Khẳng định D: ĐÚNG.*
      Với $L(x) = x^3  =>  L'(x) = 3x^2$. Giải $L'(x) = 1  =>  3x^2 = 1  =>  x^2 = 1/3  =>  x = 1/ sqrt(3)  approx  0.57735  approx  0.58$.
    ]
  ]
)

#ds(
  [Một địa phương có phân phối thu nhập được mô hình hóa bởi đường cong Lorenz liên tục dạng đa thức bậc ba khuyết bậc nhất:
  $ L(x) = a x^3 + (1-a)x^2 quad ("với " x in [0; 1] " và " a in [0; 1]) $
  Biết rằng nhóm $80%$ dân số nghèo nhất sở hữu $58.88%$ tổng thu nhập của toàn địa phương.
  Các khẳng định sau đây về phân phối thu nhập của địa phương là đúng hay sai?],
  (
    True([Giá trị của tham số mô hình $a$ được xác định bằng $0.4$.]),
    True([Tỉ lệ thu nhập sở hữu bởi nhóm $20%$ dân số cận nghèo (Nhóm 2, từ mốc $20%$ đến $40%$ dân số) là $9.44%$.]),
    True([Phân vị dân số tích lũy $x$ mà tại đó cá nhân có thu nhập đúng bằng mức trung bình của toàn địa phương là khoảng $54.08%$.]),
    False([Nếu tổng thu nhập của địa phương tăng gấp đôi nhưng cơ cấu phân phối không đổi thì phân vị dân số có thu nhập bằng mức trung bình mới sẽ tăng lên.])
  ),
  loigiai: [
    #reset-step()
    #step[
      *Khẳng định A: ĐÚNG.*
      Theo giả thiết, tại $x = 0.8$, ta có $L(0.8) = 58.88% = 0.5888$.
      Thay vào phương trình mô hình:
      $ L(0.8) = a  cdot  0.8^3 + (1-a)  cdot  0.8^2 = 0.5888 $
      $ a  cdot  0.512 + (1-a)  cdot  0.64 = 0.5888 $
      $ 0.512 a + 0.64 - 0.64 a = 0.5888  =>  -0.128 a = -0.0512  =>  a = 0.4 $.
    ]
    #step[
      *Khẳng định B: ĐÚNG.*
      Với $a = 0.4$, mô hình là $L(x) = 0.4 x^3 + 0.6 x^2$.
      - Tích lũy thu nhập đến mốc $x = 0.2$ là: $L(0.2) = 0.4  cdot  0.2^3 + 0.6  cdot  0.2^2 = 0.0032 + 0.024 = 0.0272 = 2.72%$.
      - Tích lũy thu nhập đến mốc $x = 0.4$ là: $L(0.4) = 0.4  cdot  0.4^3 + 0.6  cdot  0.4^2 = 0.0256 + 0.096 = 0.1216 = 12.16%$.
      - Nhóm 2 sở hữu: $S_2 = L(0.4) - L(0.2) = 12.16% - 2.72% = 9.44%$.
    ]
    #step[
      *Khẳng định C: ĐÚNG.*
      Ý nghĩa đạo hàm: $L'(x) = y(x)/mu$. Cá nhân có thu nhập bằng trung bình xã hội khi $L'(x) = 1$.
      Ta có $L'(x) = 1.2 x^2 + 1.2 x$.
      Giải phương trình: $1.2 x^2 + 1.2 x = 1  =>  6 x^2 + 6 x - 5 = 0$.
      Vì $x in [0; 1]$, ta nhận nghiệm duy nhất:
      $ x = (-3 +  sqrt(39)) / (6)  approx  0.5408 " (tức " 54.08% ")" $.
    ]
    #step[
      *Khẳng định D: SAI.*
      Tỉ số giữa thu nhập cá nhân tại phân vị $x$ và thu nhập trung bình xã hội được xác định duy nhất bởi đạo hàm $L'(x)$ của đường cong Lorenz. Khi tổng thu nhập toàn địa phương tăng lên (ví dụ tăng gấp đôi), mức thu nhập trung bình toàn xã hội $mu$ cũng tăng gấp đôi. Do đó, tỉ số thu nhập của cá nhân tại phân vị $x$ so với mức trung bình mới vẫn tuân theo $L'(x)$. Ranh giới thu nhập bằng trung bình xã hội vẫn thỏa mãn $L'(x) = 1  =>  x  approx  54.08%$, không thay đổi.
    ]
  ]
)

#ds(
  [Khảo sát phân phối thu nhập ngũ phân vị tại một thị trấn ghi nhận số liệu lũy tích thu nhập thực tế như sau:
  #align(center)[
    #table(
      columns: (2.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
      align: center + horizon,
      [*Mốc dân số lũy kế ($x$)*], [0%], [20%], [40%], [60%], [80%], [100%],
      [*Thu nhập tích lũy ($L(x)$)*], [0%], [5%], [15%], [32%], [60%], [100%]
    )
  ]
  Các khẳng định sau đây về phân phối thu nhập của thị trấn là đúng hay sai?],
  (
    True([Nhóm $20%$ dân số giàu nhất thị trấn sở hữu tổng lượng thu nhập gấp đúng $8$ lần nhóm $20%$ dân số nghèo nhất.]),
    True([Thu nhập bình quân của một hộ gia đình thuộc nhóm trung lưu (Nhóm 3) bằng đúng $85%$ mức thu nhập trung bình của toàn thị trấn.]),
    False([Mô hình đường cong Lorenz liên tục dạng bậc hai $L(x) = a x^2 + (1-a)x$ nội suy từ mốc thực tế $(0.8; 0.60)$ là một mô hình hợp lệ về mặt kinh tế học.]),
    True([Nếu mô hình hóa bằng hàm số liên tục dạng bậc ba $L(x) = a x^3 + (1-a)x$, ta tìm được tham số mô hình $a = 25/36$.])
  ),
  loigiai: [
    #reset-step()
    #step[
      *Khẳng định A: ĐÚNG.*
      - Nhóm 1 (20% nghèo nhất) sở hữu: $S_1 = L(0.2) = 5%$.
      - Nhóm 5 (20% giàu nhất) sở hữu: $S_5 = L(1.0) - L(0.8) = 100% - 60% = 40%$.
      - Tỉ số thu nhập bình quân giữa hai nhóm (cùng quy mô dân số): $(S_5) / (S_1) = (40%) / (5%) = 8$ lần.
    ]
    #step[
      *Khẳng định B: ĐÚNG.*
      - Nhóm 3 sở hữu: $S_3 = L(0.6) - L(0.4) = 32% - 15% = 17%$.
      - Thu nhập bình quân của nhóm 3 so với trung bình xã hội: $(y_("bq", 3)) / ( mu ) = (S_3) / (0.2) = (0.17) / (0.2) = 0.85 = 85%$.
    ]
    #step[
      *Khẳng định C: SAI.*
      Nội suy mốc $L(0.8) = 0.60$ vào mô hình bậc hai:
      $ a  cdot  0.8^2 + (1-a)  cdot  0.8 = 0.60  =>  0.64 a + 0.8 - 0.8 a = 0.60  =>  -0.16 a = -0.20  =>  a = 1.25 $.
      Với $a = 1.25 > 1$, ta có hàm số $L(x) = 1.25 x^2 - 0.25 x$.
      Đạo hàm: $L'(x) = 2.5 x - 0.25$.
      Với $x in [0; 0.1)$, ta có $L'(x) < 0$, dẫn tới hàm số Lorenz nghịch biến (thu nhập tích lũy giảm khi dân số tăng, hoặc thu nhập cá nhân bị âm). Điều này vi phạm nghiêm trọng nguyên lý kinh tế học và định nghĩa đường cong Lorenz. Do đó, mô hình này không hợp lệ.
    ]
    #step[
      *Khẳng định D: ĐÚNG.*
      Nội suy mốc $L(0.8) = 0.60$ vào mô hình bậc ba:
      $ a  cdot  0.8^3 + (1-a)  cdot  0.8 = 0.60  =>  0.512 a + 0.8 - 0.8 a = 0.60  =>  -0.288 a = -0.20  =>  a = (200) / (288) = (25) / (36)  approx  0.694 $.
      Vì $a = 25/36 in [0; 1]$ nên mô hình này hoàn toàn hợp lệ (đạo hàm $L'(x) = (75) / (36) x^2 + (11) / (36) > 0$ và $L''(x) = (150) / (36) x > 0$ với mọi $x in [0; 1]$).
    ]
    #step[
      *Mở rộng: Thiết lập hàm phân đoạn và vẽ đồ thị các đoạn gấp khúc thực tế:*
      Đường cong Lorenz thực tế biểu diễn qua bảng số liệu trên được cho bởi hàm ghép liên tục sau:
      $ L_("thực tế") (x) = cases(
        0.25 x & "khi " 0 <= x < 0.2,
        0.5 x - 0.05 & "khi " 0.2 <= x < 0.4,
        0.85 x - 0.19 & "khi " 0.4 <= x < 0.6,
        1.4 x - 0.52 & "khi " 0.6 <= x < 0.8,
        2.0 x - 1.0 & "khi " 0.8 <= x <= 1
      ) $
      
      #align(center)[
        #fig-panel(cetz.canvas(length: 4.8cm, {
          import cetz.draw: *
          let pts = ((0.0, 0.0), (0.2, 0.05), (0.4, 0.15), (0.6, 0.32), (0.8, 0.60), (1.0, 1.0))
          
          // Vẽ diện tích dưới đường Lorenz
          let area_pts = ((0.0, 0.0), (0.2, 0.05), (0.4, 0.15), (0.6, 0.32), (0.8, 0.60), (1.0, 1.0), (1.0, 0.0), (0.0, 0.0))
          merge-path(fill: area-fill, stroke: none, close: true, { line(..area_pts) })
          
          // Lưới tọa độ
          for p in pts {
            if p.at(0) > 0.0 and p.at(0) < 1.0 {
              line((p.at(0), 0.0), p, stroke: (dash: "dotted", paint: rgb("BDC3C7"), thickness: 0.5pt))
              line((0.0, p.at(1)), p, stroke: (dash: "dotted", paint: rgb("BDC3C7"), thickness: 0.5pt))
            }
          }
          
          // Đường phân vị bình đẳng
          line((0.0, 0.0), (1.0, 1.0), stroke: (paint: eq-color, dash: "dashed", thickness: 1pt))
          
          // Đường cong Lorenz thực tế
          line(..pts, stroke: 1.8pt + dd-color)
          
          // Điểm dữ liệu
          for p in pts {
            circle(p, radius: 2.2pt, fill: rgb("E74C3C"), stroke: 0.5pt + white)
          }
          
          // Trục tọa độ
          line((-0.05, 0.0), (1.1, 0.0), mark: (end: ">"), stroke: 0.6pt)
          line((0.0, -0.05), (0.0, 1.1), mark: (end: ">"), stroke: 0.6pt)
          
          content((1.08, -0.05), $x$)
          content((-0.08, 1.08), $L(x)$)
          
          // Nhãn trục hoành
          content((0.0, -0.05), text(size: 8pt)[$0$])
          content((0.2, -0.05), text(size: 8pt)[$0.2$])
          content((0.4, -0.05), text(size: 8pt)[$0.4$])
          content((0.6, -0.05), text(size: 8pt)[$0.6$])
          content((0.8, -0.05), text(size: 8pt)[$0.8$])
          content((1.0, -0.05), text(size: 8pt)[$1.0$])
          
          // Nhãn trục tung
          content((-0.07, 0.05), text(size: 8pt)[$0.05$])
          content((-0.07, 0.15), text(size: 8pt)[$0.15$])
          content((-0.07, 0.32), text(size: 8pt)[$0.32$])
          content((-0.07, 0.60), text(size: 8pt)[$0.60$])
          content((-0.07, 1.0), text(size: 8pt)[$1.0$])
          
          // Ghi chú
          content((0.45, 0.55), text(fill: eq-color, size: 8pt)[$y = x$], angle: 45deg)
          content((0.78, 0.38), text(fill: dd-color, size: 8pt)[$L_("thực tế") (x)$])
        }))
      ]
    ]
  ]
)

#ds(
  [Một vùng nông thôn khảo sát phân phối thu nhập ngũ phân vị ghi nhận bảng số liệu lũy kế thực tế:
  #align(center)[
    #table(
      columns: (2.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
      align: center + horizon,
      [*Mốc dân số lũy kế ($x$)*], [0%], [20%], [40%], [60%], [80%], [100%],
      [*Thu nhập tích lũy ($L(x)$)*], [0%], [6%], [18%], [38%], [68%], [100%]
    )
  ]
  Đường cong Lorenz thực tế $L_("thực tế")(x)$ là *đường gấp khúc* nối các điểm dữ liệu trên. Các khẳng định sau đây là đúng hay sai?],
  (
    True([Nhóm $60%$ dân số nghèo nhất của vùng sở hữu đúng $38%$ tổng thu nhập.]),
    True([Trên đoạn $x in [0.4; 0.6]$ của đường gấp khúc, hệ số góc — tức đạo hàm $L_("thực tế")'(x)$ — bằng đúng $1.0$.]),
    True([Tại $x = 0.5$, giá trị $L_("thực tế")(0.5) = 0.28$, tức $28%$ tổng thu nhập.]),
    False([Vì hàm số $L_("thực tế")(x)$ gồm $5$ biểu thức khác nhau nên nó là hàm đa trị — tức là ứng với một giá trị $x$ có thể nhận nhiều giá trị $L(x)$ khác nhau.])
  ),
  loigiai: [
    #reset-step()
    #step[
      *Khẳng định A: ĐÚNG.*
      Tại mốc dân số lũy tích $x = 0.6$, tỉ lệ thu nhập tích lũy đọc thẳng từ bảng là $L(0.6) = 38%$.
      Đây chính là tổng tỉ lệ thu nhập mà nhóm $60%$ dân số nghèo nhất đang sở hữu.
    ]
    #step[
      *Khẳng định B: ĐÚNG.*
      Trên đoạn $x in [0.4; 0.6]$, hệ số góc (đạo hàm) của đường gấp khúc được tính theo công thức Mục 2:
      $ L_("thực tế")'(x) = (L(0.6) - L(0.4))/(0.6 - 0.4) = (0.38 - 0.18)/0.2 = 1.0 $
      Vì $L'(x) = 1$, trên đoạn này mọi cá nhân đều có thu nhập *đúng bằng* mức trung bình xã hội.
    ]
    #step[
      *Khẳng định C: ĐÚNG.*
      Vì $0.5 in [0.4; 0.6]$, áp dụng công thức đoạn gấp khúc:
      $ L_("thực tế")(0.5) = L(0.4) + 1.0  cdot  (0.5 - 0.4) = 0.18 + 0.1 = 0.28 = bold(28%) $
    ]
    #step[
      *Khẳng định D: SAI.*
      Đây là điểm dễ nhầm lẫn giữa *"hàm nhiều công thức"* và *"hàm đa trị"* (xem Mục 2 phần Lý thuyết):
      - Hàm gấp khúc $L_("thực tế")(x)$ được ghép từ $5$ biểu thức con, nhưng mỗi $x in [0; 1]$ vẫn cho *đúng một* giá trị $L(x)$ duy nhất → đây là hàm *đơn trị* (single-valued), không phải hàm đa trị.
      - "Hàm đa trị" theo nghĩa toán học là hàm có nhiều giá trị ứng với cùng một đầu vào (ví dụ $y^2 = x$ cho hai giá trị $y$); đường Lorenz thực tế không rơi vào trường hợp này.
    ]
  ]
)



#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn])

#tln(
  [Phân phối thu nhập của một địa phương khảo sát thực tế ghi nhận nhóm $80%$ dân số nghèo nhất sở hữu $68%$ tổng thu nhập. Đường cong Lorenz được mô hình hóa bằng hàm đa thức bậc hai có dạng:
  $ L(x) = a x^2 + (1-a)x quad ("với " 0 <= a <= 1) $
  Tìm giá trị của tham số $a$ biểu thị mức độ phân hóa thu nhập dưới dạng số thập phân.],
  [0.75],
  loigiai: [
    #reset-step()
    #step[
      Mốc dữ liệu thực tế tại mốc dân số tích lũy $x = 0.8$ cho tỉ lệ thu nhập tích lũy là $L(0.8) = 68% = 0.68$.
      Thay giá trị này vào phương trình mô hình bậc hai:
      $ L(0.8) = a  cdot  (0.8)^2 + (1-a)  cdot  0.8 = 0.68 $
    ]
    #step[
      Giải phương trình để tìm tham số $a$:
      $ 0.64 a + 0.8 - 0.8 a = 0.68 $
      $ -0.16 a = 0.68 - 0.8 = -0.12 $
      $ a = (-0.12) / (-0.16) = (3) / (4) = bold(0.75) $
    ]
    #step[
      *Kiểm tra tính hợp lệ:* Với $a = 0.75$, hàm số Lorenz là $L(x) = 0.75 x^2 + 0.25 x$.
      - Đạo hàm: $L'(x) = 1.5 x + 0.25  >=  0.25 > 0$ với mọi $x  in  [0; 1]$.
      - Đạo hàm cấp hai: $L''(x) = 1.5 > 0$ (hàm lồi).
      Mọi điều kiện của đường cong Lorenz hoàn toàn được thỏa mãn.
      
      Đáp số ngắn cần điền: *0.75*.
    ]
  ]
)

#tln(
  [Một quốc gia có phân bố thu nhập tích lũy tuân theo mô hình Lorenz liên tục có dạng:
  $ L(x) = (3) / (4) x^2 + (1) / (4) x quad ("với " x in [0; 1]) $
  Mốc dân số tích lũy $x$ mà tại đó cá nhân có thu nhập đúng bằng thu nhập trung bình của toàn quốc gia được biểu thị dưới dạng số thập phân bằng bao nhiêu?],
  [0.5],
  loigiai: [
    #reset-step()
    #step[
      Theo ý nghĩa kinh tế học của đạo hàm, cá nhân có thu nhập đúng bằng mức trung bình xã hội tại mốc $x$ thỏa mãn phương trình:
      $ L'(x) = 1 $
    ]
    #step[
      Tính đạo hàm của hàm số Lorenz đã cho:
      $ L'(x) = (3) / (2) x + (1) / (4) = 1.5 x + 0.25 $
    ]
    #step[
      Giải phương trình:
      $ 1.5 x + 0.25 = 1  =>  1.5 x = 0.75  =>  x = (0.75) / (1.5) = bold(0.5) $
      
      *Giải thích ý nghĩa:* Mốc $x = 0.5$ chính là mốc trung vị. Điều này chỉ ra rằng đúng một nửa dân số nghèo nhất quốc gia có thu nhập dưới mức trung bình xã hội, và nửa dân số giàu nhất có thu nhập trên mức trung bình xã hội.
      
      Đáp số ngắn cần điền: *0.5*.
    ]
  ]
)

#tln(
  [Phân phối thu nhập của một địa phương được khảo sát ghi nhận nhóm $80%$ dân số nghèo nhất sở hữu $70.4%$ tổng thu nhập. Giả sử đường cong Lorenz tuân theo mô hình bậc hai có dạng:
  $ L(x) = a x^2 + (1-a)x quad ("với " 0 <= a <= 1) $
  Tìm phân vị dân số tích lũy $x$ (biểu thị dưới dạng số thập phân) mà tại đó một cá nhân có thu nhập bằng đúng $1.3$ lần mức thu nhập trung bình của toàn địa phương.],
  [0.75],
  loigiai: [
    #reset-step()
    #step[
      *Xác định tham số $a$ của mô hình:*
      Từ giả thiết $L(0.8) = 70.4% = 0.704$, ta có phương trình:
      $ a  cdot  0.8^2 + (1-a)  cdot  0.8 = 0.704 $
      $ 0.64 a + 0.8 - 0.8 a = 0.704 $
      $ -0.16 a = -0.096  =>  a = 0.6 $.
      Mô hình đường Lorenz: $L(x) = 0.6 x^2 + 0.4 x$.
    ]
    #step[
      *Tìm phân vị dân số thỏa mãn yêu cầu:*
      Đạo hàm của đường cong Lorenz biểu thị tỉ số thu nhập cá nhân so với thu nhập trung bình xã hội:
      $ L'(x) = 1.2 x + 0.4 $
      Để thu nhập cá nhân bằng đúng $1.3$ lần thu nhập trung bình xã hội, ta giải phương trình:
      $ L'(x) = 1.3  =>  1.2 x + 0.4 = 1.3 $
      $ 1.2 x = 0.9  =>  x = (0.9) / (1.2) = bold(0.75) $.
      
      Đáp số ngắn cần điền: *0.75*.
    ]
  ]
)

#tln(
  [Để phân tích mức độ bình đẳng của phân phối thu nhập tích lũy lý thuyết, các chuyên gia sử dụng mô hình đường cong Lorenz dạng:
  $ L(x) = (k) / (k+1) x^2 + (1) / (k+1) x quad ("với " k " là tham số dương") $
  Biết rằng tại phân vị dân số tích lũy $x = 0.75$ ($75%$), cá nhân đó có mức thu nhập gấp đúng $1.4$ lần mức thu nhập trung bình của toàn xã hội. Tìm giá trị của tham số $k$.],
  [4],
  loigiai: [
    #reset-step()
    #step[
      *Thiết lập đạo hàm biểu thị tỉ số thu nhập:*
      Tính đạo hàm của đường cong Lorenz theo biến $x$:
      $ L'(x) = (2k) / (k+1) x + (1) / (k+1) $
    ]
    #step[
      *Giải phương trình tìm tham số $k$:*
      Theo đề bài, tại $x = 0.75$, tỉ số thu nhập cá nhân so với trung bình xã hội là $1.4$. Do đó:
      $ L'(0.75) = 1.4  =>  (2k) / (k+1)  cdot  0.75 + (1) / (k+1) = 1.4 $
      $ (1.5 k + 1) / (k+1) = 1.4 $
      $ 1.5 k + 1 = 1.4(k + 1) $
      $ 1.5 k + 1 = 1.4 k + 1.4  =>  0.1 k = 0.4  =>  k = bold(4) $.
      
      Đáp số ngắn cần điền: *4*.
    ]
  ]
)
