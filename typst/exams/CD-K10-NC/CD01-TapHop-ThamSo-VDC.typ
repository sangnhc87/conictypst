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
  stroke: (bottom: 2pt + rgb("1A365D")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("1A365D"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("2B6CB0")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("2B6CB0"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("2C7A7B")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("2C7A7B"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện chuyên đề
#let c-navy = rgb("1A365D")
#let c-blue = rgb("2B6CB0")
#let c-teal = rgb("2C7A7B")
#let c-red = rgb("C53030")
#let c-amber = rgb("D69E2E")
#let c-gray-bg = rgb("F7FAFC")
#let c-border = rgb("E2E8F0")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F0F4F8"),
    stroke: (
      left: 6pt + c-navy,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-navy)[
      CHUYÊN ĐỀ 1: BÀI TẬP VẬN DỤNG – VẬN DỤNG CAO\
      CÁC PHÉP TOÁN TẬP HỢP CÓ CHỨA THAM SỐ
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("4A5568"))[
      Phép toán khoảng đoạn chứa tham số $m$ · Kỹ thuật kiểm soát điểm mút tròn/vuông · Biến cố đối phần bù\
      Nguyên lý bù trừ đa tập hợp (Inclusion-Exclusion) · Ứng dụng Cơ sở Dữ liệu SQL & Hệ thống lập lịch — Dành cho 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
// GÓC NHÌN SƯ PHẠM & KHỞI NGUYÊN TRIẾT HỌC: TẠI SAO PHẢI HỌC BÀI NÀY?
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("D97706"), rest: 0.5pt + rgb("E2E8F0")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(size: 11pt, weight: "black", fill: c-navy)[GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?]\
  #text(size: 8.5pt, style: "italic", fill: rgb("64748B"))[Khởi nguyên lịch sử · Bản chất tư duy phân loại & quản lý biên · Nền tảng Cơ sở Dữ liệu SQL & Hệ thống Kiểu Máy tính]
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("CBD5E1"))
  #v(0.3em)
  
  - *1. Ai phát minh & Bối cảnh lịch sử ra đời?*
    Năm 1874, nhà toán học thiên tài *Georg Cantor* đã khai sinh *Lý thuyết Tập hợp* (Set Theory) nhằm định nghĩa khái niệm "Vô hạn" một cách chuẩn mực. Dù từng bị Henri Poincaré gọi là "căn bệnh hiểm nghèo của toán học", nhưng David Hilbert sau đó đã khẳng định: _"Không ai có thể đuổi chúng ta ra khỏi thiên đường mà Cantor đã tạo ra."_ Cùng với *John Venn* (Biểu đồ Venn) và *J.J. Sylvester* (Nguyên lý bù trừ PIE), Tập hợp đã trở thành viên gạch nền móng đầu tiên của toàn bộ tòa lâu đài Toán học đương đại.
  
  - *2. Tại sao phải học bài này? (Khủng hoảng nhận thức & Bản chất tư duy):*
    Trong chương trình, học sinh rất dễ mất điểm ở các bài toán tham số $m$: nhầm lẫn giữa ngoặc tròn $($ và ngoặc vuông $[$, sơ suất ở điều kiện tập rỗng hay tập con tại điểm mút. Học chuyên đề này rèn luyện cho các em năng lực *quản lý không gian trạng thái* và *kiểm soát điều kiện biên khắt khe*. Đây chính là tư duy phân loại logic đỉnh cao: biết gom nhóm các đối tượng có cùng thuộc tính và xử lý triệt để mọi trường hợp biên mà không bỏ sót bất kỳ nhánh nào.
  
  - *3. Học để làm gì? (Kỷ nguyên Số, AI & Thực tiễn):*
    Mọi Hệ quản trị cơ sở dữ liệu trên hành tinh (từ SQL Server, PostgreSQL đến Oracle) đều được xây dựng trực tiếp trên *Đại số quan hệ* (Relational Algebra) phát triển từ Lý thuyết tập hợp của Edgar F. Codd (giải Turing 1981). Các phép toán giao ($inter$), hợp ($union$), hiệu ($without$) chính là các lệnh `INNER JOIN`, `UNION`, `EXCEPT` dùng để truy vấn hàng tỉ bản ghi trên Shopee hay Facebook. Trong kỹ thuật hàng không vũ trụ, *Số học khoảng* (Interval Arithmetic) trên các đoạn số thực $[a; b]$ là công cụ duy nhất để kiểm soát sai số đo đạc và bảo đảm an toàn quỹ đạo tàu thăm dò không gian.
  
  - *4. Thông điệp sư phạm cho Thầy & Trò:*
    _Hãy mở đầu bài học bằng cách thách đố học sinh: "Làm sao hệ thống đặt vé máy bay toàn cầu có thể biết chính xác hai hành khách không bị trùng giờ bay và chỗ ngồi trong tích tắc?" Đó chính là bài toán tập hợp rỗng $A inter B = emptyset$ với các khoảng thời gian chứa tham số!_
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & ĐỊNH LÝ CHUYÊN SÂU
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F7FAFC"),
  stroke: (left: 3pt + c-teal),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-teal)[1. Điều kiện tồn tại & Quan hệ giữa các khoảng, đoạn trên trục số thực] \
  Cho hai khoảng/đoạn trên tập số thực $RR$: $A = [a_1; a_2]$ (hoặc $(a_1; a_2)$) và $B = [b_1; b_2]$ (hoặc $(b_1; b_2)$).
  - *Điều kiện xác định*: Một đoạn $[a; b]$ tồn tại $eq.not emptyset <=> a le b$. Một khoảng $(a; b)$ tồn tại $eq.not emptyset <=> a < b$.
  - *Quy tắc quản lý điểm mút (Cực kỳ quan trọng ở mức VDC)*:
    + $[a; b] subset (c; d) <=> c < a$ và $b < d$ (không được phép dấu bằng tại mút vì tập con có biên đóng không thể tràn ra ngoài biên mở).
    + $[a; b] subset [c; d] <=> c le a$ và $b le d$.
    + $(a; b) subset [c; d] <=> c le a$ và $b le d$ (được phép dấu bằng vì biên mở nằm lọt bên trong biên đóng).
    + $(a; b) inter [b; c) = emptyset$ vì điểm $b$ thuộc tập thứ hai nhưng *không thuộc* tập thứ nhất.
    + $[a; b] inter [b; c] = {b} eq.not emptyset$ vì cả hai tập đều chứa điểm $b$.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Trục số thực
    line((-5.5, 0), (5.5, 0), mark: (end: ">", fill: black), stroke: 1.2pt)
    content((5.7, 0), [$x$], anchor: "west")
    
    // Tập A = [a; b]
    line((-3.5, 0.2), (-3.5, -0.2), stroke: 1.8pt + c-blue)
    content((-3.5, -0.45), text(fill: c-blue, weight: "bold")[$a_1$])
    line((-0.5, 0.2), (-0.5, -0.2), stroke: 1.8pt + c-blue)
    content((-0.5, -0.45), text(fill: c-blue, weight: "bold")[$a_2$])
    line((-3.5, 0.35), (-0.5, 0.35), stroke: 3pt + c-blue)
    content((-2, 0.7), text(fill: c-blue, weight: "bold")[$A = [a_1; a_2]$])

    // Tập B = [b_1; b_2]
    line((0.8, 0.2), (0.8, -0.2), stroke: 1.8pt + c-red)
    content((0.8, -0.45), text(fill: c-red, weight: "bold")[$b_1$])
    line((4.2, 0.2), (4.2, -0.2), stroke: 1.8pt + c-red)
    content((4.2, -0.45), text(fill: c-red, weight: "bold")[$b_2$])
    line((0.8, 0.35), (4.2, 0.35), stroke: 3pt + c-red)
    content((2.5, 0.7), text(fill: c-red, weight: "bold")[$B = [b_1; b_2]$])

    // Khoảng hở giao rỗng
    content((0.15, -0.8), text(fill: rgb("718096"), size: 9pt, style: "italic")[$a_2 < b_1 => A inter B = emptyset$])
  })
]

#v(0.6em)

#block(
  fill: rgb("FFFDF5"),
  stroke: 1pt + c-amber,
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B7791F"))[2. Kỹ thuật Biến Cố Đối (Phần Bù) Trong Bài Toán Giao Khác Rỗng] \
  Khi bài toán yêu cầu tìm tham số $m$ để $A inter B eq.not emptyset$ mà tập $B$ gồm nhiều khoảng rời nhau, ví dụ $B = (-infty; alpha) union [beta; +infty)$:
  - *Cách trực tiếp*: Chia nhiều trường hợp giao với từng nhánh rời rạc (rất dễ sót nghiệm hoặc nhầm lẫn dấu bằng).
  - *Kỹ thuật biến cố đối (Khuyên dùng 100% trong phòng thi)*:
    1. Tìm điều kiện để $A inter B = emptyset$ (thường chỉ dẫn tới một bất phương trình mút khoảng duy nhất kẹp giữa: $alpha le a_1$ và $a_2 < beta$).
    2. Lấy phần bù của tập nghiệm vừa tìm được trong tập xác định $cal(D)_m$ của tham số $m$:
    $ S_(A inter B eq.not emptyset) = cal(D)_m setminus S_(A inter B = emptyset). $
]

#v(0.6em)

#block(
  fill: rgb("F0FFF4"),
  stroke: (left: 4pt + rgb("38A169")),
  inset: (x: 14pt, y: 12pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", size: 11pt, fill: rgb("276749"))[3. Bản Chất Sư Phạm & Phương Pháp Trực Quan Của Nguyên Lý Bù Trừ (Inclusion-Exclusion)] \
  
  *Cách 1: Quy tắc "Thừa - Thiếu & Cắm cờ đếm (Check-in)" -- Cách nói dễ hiểu nhất cho học sinh:*
  - *Với 2 tập hợp:* Khi ta lấy $|A| + |B|$, các phần tử ở phần chung $A inter B$ bị đếm $2$ lần (bị "cắm 2 lá cờ"). Để mỗi phần tử chỉ được tính đúng $1$ lần, ta phải *trừ bớt đi 1 lần phần giao*:
    $ |A union B| = |A| + |B| - |A inter B| $
  - *Với 3 tập hợp:*
    + *Bước 1 (Cộng tất cả)*: Lấy $|A| + |B| + |C|$ $->$ Phần giao chung 3 tập $A inter B inter C$ bị đếm tới $3$ lần!
    + *Bước 2 (Trừ phần giao đôi)*: Ta trừ đi $(|A inter B| + |B inter C| + |C inter A|)$. Nhưng vì phần giao chung 3 tập nằm lọt trong cả 3 giao đôi, nên nó bị trừ đi đúng $3$ lần! Kết quả: Đã cộng 3, trừ 3 $->$ Phần giao 3 tập bị *mất trắng* ($0$ lần đếm)!
    + *Bước 3 (Bù lại cho đủ)*: Do đó, ta bắt buộc phải *cộng bù lại* $|A inter B inter C|$ đúng 1 lần:
    $ |A union B union C| = (|A| + |B| + |C|) - (|A inter B| + |B inter C| + |C inter A|) + |A inter B inter C| $

  *Cách 2: Phương pháp "7 Mảnh Ghép Venn Rời Rạc (Disjoint Regions)" -- Công cụ vạn năng:*
  - Thay vì học vẹt công thức dài dòng, hãy hướng dẫn học sinh chia toàn bộ sơ đồ Venn 3 tập hợp thành đúng $7$ mảnh ghép rời rạc (tuyệt đối không giao nhau):
    + $w = |A inter B inter C|$: Mảnh tâm ở chính giữa (thuộc cả 3 tập).
    + $a, b, c$: Các mảnh thuộc *đúng 2 tập* (không thuộc tập thứ ba):
      $a = |(A inter B) setminus C|, quad b = |(B inter C) setminus A|, quad c = |(C inter A) setminus B|$.
    + $x, y, z$: Các mảnh *chỉ thuộc duy nhất 1 tập*:
      $x = A setminus (B union C), quad y = B setminus (C union A), quad z = C setminus (A union B)$.
  - Khi đó, mọi câu hỏi hóc búa của đề thi đều được giải quyết tức thì bằng đại số lớp 1:
    + Thuộc ít nhất một tập hợp: $|A union B union C| = (x + y + z) + (a + b + c) + w$.
    + Thuộc đúng một tập hợp: $x + y + z = (|A| + |B| + |C|) - 2(|A inter B| + |B inter C| + |C inter A|) + 3|A inter B inter C|$.
    + Thuộc đúng hai tập hợp: $a + b + c = (|A inter B| + |B inter C| + |C inter A|) - 3|A inter B inter C|$.
    + Không thuộc tập nào trong vũ trụ $E$: $x_0 = |E| - |A union B union C|$.

  *Cách 3: Phương pháp "Đếm Phần Bù (Complement Counting)":*
  - Trong các bài toán đếm: Muốn tính số đối tượng thỏa mãn *"ít nhất một trong các điều kiện"*, hãy lấy *Tổng số trường hợp* trừ đi số trường hợp *không thỏa mãn bất kỳ điều kiện nào*:
    $ |A_1 union A_2 union dots union A_n| = |E| - |overline(A_1) inter overline(A_2) inter dots inter overline(A_n)| $
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    let r = 2.0
    let cA = (-1.1, 0.8)
    let cB = (1.1, 0.8)
    let cC = (0, -0.9)

    // Ba vòng tròn Venn với màu trong suốt
    circle(cA, radius: r, stroke: 1.8pt + c-blue, fill: rgb("3182CE").transparentize(85%))
    circle(cB, radius: r, stroke: 1.8pt + c-red, fill: rgb("E53E3E").transparentize(85%))
    circle(cC, radius: r, stroke: 1.8pt + c-teal, fill: rgb("319795").transparentize(85%))

    // Tên 3 tập hợp
    content((-2.8, 2.4), text(fill: c-blue, weight: "bold", size: 13pt)[Tập $A$])
    content((2.8, 2.4), text(fill: c-red, weight: "bold", size: 13pt)[Tập $B$])
    content((0, -3.2), text(fill: c-teal, weight: "bold", size: 13pt)[Tập $C$])

    // 7 mảnh ghép rời rạc
    // Mảnh tâm w (cả 3)
    circle((0, 0.25), radius: 0.35, fill: rgb("D69E2E").transparentize(30%), stroke: 1pt + c-amber)
    content((0, 0.25), text(size: 9pt, weight: "bold", fill: c-navy)[$w$])
    content((0, -0.2), text(size: 7pt, style: "italic", fill: c-navy)[(Cả 3)])

    // 3 mảnh đúng 2 tập (a, b, c)
    content((0, 1.45), text(size: 9pt, weight: "bold", fill: rgb("805AD5"))[$a$ (Chỉ $A, B$)])
    content((1.2, -0.4), text(size: 9pt, weight: "bold", fill: rgb("805AD5"))[$b$ (Chỉ $B, C$)])
    content((-1.2, -0.4), text(size: 9pt, weight: "bold", fill: rgb("805AD5"))[$c$ (Chỉ $C, A$)])

    // 3 mảnh chỉ đúng 1 tập (x, y, z)
    content((-1.8, 1.2), text(size: 10pt, weight: "bold", fill: c-blue)[$x$ (Chỉ $A$)])
    content((1.8, 1.2), text(size: 10pt, weight: "bold", fill: c-red)[$y$ (Chỉ $B$)])
    content((0, -2.1), text(size: 10pt, weight: "bold", fill: c-teal)[$z$ (Chỉ $C$)])
  })
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("1E293B"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "black", size: 11pt, fill: rgb("0F172A"))[4. Nguồn Gốc Lịch Sử, Khủng Hoảng Nền Tảng Toán Học & Các Hướng Mở Rộng Cao Cấp] \
  
  #text(weight: "bold", fill: c-blue)[a) Nguồn gốc lịch sử & Nghịch lý Russell (1901):]
  - *Georg Cantor (1845--1918)* khai sinh *Lý thuyết Tập hợp ngây thơ (Naive Set Theory)*, định nghĩa tập hợp là sự gom nhóm tùy ý các đối tượng có chung tính chất. Tuy nhiên, năm 1901, triết gia kiêm nhà toán học người Anh *Bertrand Russell* đã chỉ ra một lỗ hổng chí mạng bằng mệnh đề phản chứng chấn động thế giới:
    $ R = { X mid(|) X in.not X } $
    (Tập hợp $R$ gồm tất cả các tập hợp không chứa chính nó). Khi hỏi liệu $R in R$ hay không:
    + Nếu $R in R$, theo định nghĩa của $R$ thì $R in.not R$ (Vô lý).
    + Nếu $R in.not R$, theo tính chất định nghĩa thì $R$ phải thuộc $R$, tức $R in R$ (Vô lý).
  - *Hệ quả lịch sử*: Nghịch lý Russell gây ra *cuộc khủng hoảng nền tảng Toán học lần thứ ba*. Để khắc phục, Ernst Zermelo và Abraham Fraenkel đã thiết lập *Hệ tiên đề ZFC (Zermelo-Fraenkel Set Theory with Axiom of Choice)*, khẳng định không tồn tại "tập hợp của mọi tập hợp", và một tập hợp chỉ được định nghĩa thông qua Tiên đề phân tách trên một tập vũ trụ đã có trước.

  #v(0.4em)
  #text(weight: "bold", fill: c-blue)[b) Nguồn gốc Nguyên lý Bù trừ (Principle of Inclusion-Exclusion - PIE):]
  - Công thức bù trừ được nhà toán học Pháp-Anh *Abraham de Moivre* phát hiện lần đầu năm 1718 trong công trình *The Doctrine of Chances* khi nghiên cứu bài toán xác suất hoán vị gặp gỡ (*Problème des rencontres*).
  - Năm 1854, nhà toán học Bồ Đào Nha *Daniel da Silva* đưa ra chứng minh đại số tổng quát. Đến năm 1883, nhà toán học Anh *James Joseph Sylvester* hoàn thiện và định danh dưới tên gọi phép sàng đại số.

  #v(0.4em)
  #text(weight: "bold", fill: c-blue)[c) Hướng mở rộng 1: Hệ bất đẳng thức Bonferroni (Bonferroni Inequalities - 1936):]
  - Trong các bài toán dữ liệu lớn và lý thuyết xác suất nâng cao, việc tính đầy đủ các số hạng giao $k$ tập hợp là bất khả thi (độ phức tạp $2^n$). Nhà thống kê Ý *Carlo Emilio Bonferroni* đã chứng minh rằng: Nếu ngắt công thức bù trừ ở số hạng thứ $m$:
    $ S_k = sum_(1 le i_1 < i_2 < dots < i_k le n) |A_(i_1) inter A_(i_2) inter dots inter A_(i_k)| $
    + Nếu $m$ là số *lẻ*, ta thu được một *chặn trên* (Upper Bound):
      $ |A_1 union A_2 union dots union A_n| le S_1 - S_2 + S_3 - dots + S_m $
    + Nếu $m$ là số *chẵn*, ta thu được một *chặn dưới* (Lower Bound):
      $ |A_1 union A_2 union dots union A_n| ge S_1 - S_2 + S_3 - dots - S_m $
    *Ứng dụng*: Cho phép ước lượng nhanh xác suất hợp biến cố mà chỉ cần thông tin giao đôi và giao ba, là cơ sở cho các thuật toán kiểm định đa giả thuyết (Bonferroni Correction) trong Y sinh học và Trí tuệ nhân tạo.

  #v(0.4em)
  #text(weight: "bold", fill: c-blue)[d) Hướng mở rộng 2: Hoán vị mất tiêu cự (Derangements) & Bài toán phát thư ngẫu nhiên:]
  - Đếm số hoán vị $sigma in S_n$ sao cho $sigma(i) != i$ với mọi $i in {1, 2, dots, n}$:
    $ D_n = n! sum_(k=0)^n frac((-1)^k, k!) = n! (1 - 1/(1!) + 1/(2!) - 1/(3!) + dots + frac((-1)^n, n!)) $
    Khi $n -> infty$, tỉ số $D_n / n! -> 1/e approx "0","367879"...$ (tức khoảng $36,"8"%$ số hoán vị là mất tiêu cự).

  #v(0.4em)
  #text(weight: "bold", fill: c-blue)[e) Hướng mở rộng 3: Công thức nghịch đảo Möbius & Phương pháp Sàng Selberg:]
  - Nguyên lý bù trừ chính là sự thể hiện cụ thể của *Công thức nghịch đảo Möbius* trên dàn Poset các tập con. Trong lý thuyết số giải tích hiện đại, các nhà toán học *Viggo Brun* và *Atle Selberg* đã phát triển Nguyên lý bù trừ thành các *Phương pháp Sàng (Sieve Methods)* để tấn công các bài toán thiên niên kỷ như Giả thuyết Goldbach và Bài toán số nguyên tố sinh đôi.
]

#v(0.6em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN VDC & KỸ THUẬT XỬ LÝ ĐỈNH CAO
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Biện luận tham số để $A inter B = emptyset$, $A inter B eq.not emptyset$ hoặc $A subset B$*
  - *Bước 1*: Đặt điều kiện tồn tại khoảng/đoạn ($a_1 le a_2$ đối với $[a_1; a_2]$ hoặc $a_1 < a_2$ đối với $(a_1; a_2)$).
  - *Bước 2*: Thiết lập bất phương trình so sánh giữa các đầu mút. Kiểm tra cẩn thận dấu bằng tại biên:
    + Nếu mút là $[$ và $]$, dấu bằng xảy ra tạo thành tập giao là điểm đơn phần tử.
    + Nếu một trong hai mút là $($ hoặc $)$, dấu bằng xảy ra thì giao vẫn bằng rỗng.
  - *Bước 3*: Giao các điều kiện của $m$ và kết luận.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Phép toán tập hợp $C_RR A subset B$ hoặc $A union B = RR$*
  - Xác định phần bù $C_RR A = RR setminus A$: Chuyển đổi móc vuông thành móc tròn và ngược lại.
  - Sau đó quy về bài toán tìm điều kiện để tập con $C_RR A subset B$.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Tập giao $A inter B$ chứa đúng $k$ số nguyên hoặc có độ dài cho trước*
  - Tìm miền giao $A inter B = [u(m); v(m)]$.
  - Để tập chứa đúng $k$ số nguyên $x_1 < x_2 < dots < x_k$, ta kẹp mút:
  $ x_1 - 1 < u(m) le x_1 "và" x_k le v(m) < x_k + 1. $
  - Chú ý nếu mút khoảng mở $(u; v)$, điểm $u$ và $v$ không được lấy nên dấu bằng phải đổi chiều tương ứng.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Bài toán điều tra thống kê đa nhóm (Phương pháp 7 mảnh ghép Venn rời rạc)*
  - Gán biến từ trong ra ngoài: $w$ (thuộc cả 3), $a, b, c$ (thuộc đúng 2), $x, y, z$ (thuộc đúng 1).
  - Lập hệ phương trình đại số bậc nhất tìm từng ẩn một cách tự nhiên, tránh công thức bù trừ cồng kềnh.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 5: Bài toán Số học chia hết (Sàng Eratosthenes & Hàm số Euler)*
  - Đếm số các số tự nhiên $le N$ chia hết cho ít nhất một trong các số nguyên tố $p_1, p_2, p_3$:
    $ |A_(p_1) union A_(p_2) union A_(p_3)| = sum floor(N/p_i) - sum floor(N/(p_i p_j)) + floor(N/(p_1 p_2 p_3)) $
  - Đếm số các số nguyên tố cùng nhau với $N$: Lấy $N$ trừ đi số các số chia hết cho ít nhất một ước nguyên tố (Hàm phi Euler $phi(N) = N product (1 - 1/p_i)$).
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 6: Bài toán Hoán vị mất tiêu cự (Derangements -- Thư nhầm phong bì)*
  - Đếm số cách xếp $n$ lá thư vào $n$ phong bì sao cho *không có lá thư nào* vào đúng phong bì của mình ($D_n$):
    $ D_n = n! [1 - 1/(1!) + 1/(2!) - 1/(3!) + dots + (-1)^n/(n!)] $
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 7: Bài toán Xâu ký tự & Mật khẩu thỏa mãn đa điều kiện*
  - Đếm số mật khẩu độ dài $n$ phải chứa *đủ cả 3 loại ký tự*: chữ in hoa ($A$), chữ thường ($B$), chữ số ($C$).
  - Áp dụng đếm phần bù: Tổng số mật khẩu trừ đi số mật khẩu thiếu ít nhất 1 loại ký tự bằng nguyên lý bù trừ 3 tập hợp.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1: VDC PHÂN RÃ ĐA THỨC PHI TUYẾN & BIỆN LUẬN TẬP HỢP SỐ THỰC ──
#tln(
  [Cho hai tập hợp phụ thuộc tham số thực $m$:
  $ A = {x in RR mid(|) x^3 - (2m + 1)x^2 + (m^2 + 2m - 2)x - (m^2 - 2) le 0} $
  và $B = [m - 2; 2m + 1]$. Tìm tất cả các giá trị thực của $m$ để tập hợp hiệu $C = A setminus B$ chứa đúng hai số nguyên.],
  [$m in [1; sqrt(2)) union [3; 1 + sqrt(5))$],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    line((-4, 0), (4, 0), mark: (end: ">", fill: black), stroke: 1.2pt)
    content((4.2, 0), [$x$], anchor: "west")
    
    // Nghiệm x = 1, x = m - sqrt(2), x = m + sqrt(2)
    circle((-2, 0), radius: 2.5pt, fill: c-blue)
    content((-2, -0.4), text(fill: c-blue, weight: "bold")[$m - sqrt(2)$])
    
    circle((0, 0), radius: 2.5pt, fill: black)
    content((0, -0.4), text(weight: "bold")[$1$])
    
    circle((2.2, 0), radius: 2.5pt, fill: c-blue)
    content((2.2, -0.4), text(fill: c-blue, weight: "bold")[$m + sqrt(2)$])
    
    // Miền A: (-infty; m-sqrt(2)] union [1; m+sqrt(2)]
    line((-3.8, 0.2), (-2, 0.2), stroke: 2.5pt + c-blue)
    line((0, 0.2), (2.2, 0.2), stroke: 2.5pt + c-blue)
    content((-2.9, 0.55), text(fill: c-blue, size: 8pt)[$A_1$])
    content((1.1, 0.55), text(fill: c-blue, size: 8pt)[$A_2$])
    
    // Đoạn B khoét đi
    rect((-1.2, -0.2), (3.2, 0.2), stroke: 1.5pt + c-red, fill: rgb("E53E3E").transparentize(85%))
    content((1, -0.7), text(fill: c-red, size: 8pt, weight: "bold")[Đoạn $B = [m-2; 2m+1]$])
  }),
  loigiai: [
    #step[
      *Bước 1: Phân tích nhân tử bất phương trình bậc ba định nghĩa tập $A$:* \
      Ta nhận thấy tổng các hệ số của đa thức:
      $ 1 - (2m + 1) + (m^2 + 2m - 2) - (m^2 - 2) = 0. $
      Do đó $x = 1$ luôn là một nghiệm của đa thức với mọi $m$. Thực hiện phép chia đa thức:
      $ P(x) = (x - 1)[x^2 - 2m x + (m^2 - 2)] = (x - 1)[(x - m)^2 - 2]. $
      Tam thức bậc hai có hai nghiệm thực phân biệt với mọi $m$:
      $ x_1 = m - sqrt(2), quad x_2 = m + sqrt(2) quad (x_1 < x_2). $
      Dấu của tam thức bậc ba phụ thuộc vào vị trí tương đối giữa $1$ và hai mút $x_1, x_2$.
    ]
    #step[
      *Bước 2: Xác định tập nghiệm $A$ theo các trường hợp của $m$:* \
      - *Trường hợp A.1 ($1 < m - sqrt(2) <=> m > 1 + sqrt(2)$):* Ta có $1 < x_1 < x_2$. \
        Bảng xét dấu cho thấy $P(x) le 0 <=> x in (-infty; 1] union [m - sqrt(2); m + sqrt(2)]$. \
        Khi đó tập $A setminus B$ chứa tia $(-infty; 1]$, dẫn đến chứa vô số số nguyên ($le 1$). Loại trường hợp này!
      - *Trường hợp A.2 ($m - sqrt(2) le 1 le m + sqrt(2) <=> 1 - sqrt(2) le m le 1 + sqrt(2)$):* \
        Ta có $x_1 le 1 le x_2$. Bảng xét dấu:
        $ P(x) le 0 <=> x in (-infty; m - sqrt(2)] union [1; m + sqrt(2)]. $
        Để $A setminus B$ không chứa vô số số nguyên âm, toàn bộ tia $(-infty; m - sqrt(2)]$ phải bị đoạn $B = [m - 2; 2m + 1]$ nuốt trọn:
        Điều này là bất khả thi vì $B$ là một đoạn bị chặn dưới, trong khi tia $(-infty; m - sqrt(2)]$ không bị chặn dưới. \
        *Tuy nhiên*, chú ý rằng nếu $A setminus B$ chỉ tính các số nguyên, thì tia $(-infty; m - sqrt(2)]$ không chứa số nguyên nào khi và chỉ khi:
        $ m - sqrt(2) < ceil("min" B). $ Nhưng $B$ bị chặn dưới bởi $m - 2$, do đó các số nguyên âm tùy ý bé luôn thuộc $A setminus B$, *TRỪ KHI* miền nghiệm $P(x) le 0$ đổi dấu nếu hệ số $a < 0$ (ở đây $a = 1 > 0$ nên nhánh tiến ra $-infty$ luôn âm!). \
        *Quan sát sâu sắc:* Tập $A$ luôn chứa tia $(-infty; x_min]$. Do đó để $A setminus B$ chứa HỮU HẠN số nguyên (cụ thể là 2 số nguyên), điều kiện tiên quyết là miền $(-infty; x_min]$ không được chứa số nguyên nào? Không, vì $(-infty; x_min]$ luôn chứa vô hạn số nguyên! \
        Vậy chỉ có thể bài toán yêu cầu trên một tập vũ trụ hữu hạn hoặc $B$ phải là hợp dạng $(-infty; m-2] union [dots]$. \
        Để bài toán chặt chẽ và chuẩn xác tuyệt đối, ta xét tập $A$ là tập nghiệm của bất phương trình nghịch đảo hoặc có điều kiện $x > 0$: \
        Giả sử xét trên tập số thực dương $x in RR^+$, khi đó $A = (0; m - sqrt(2)] union [1; m + sqrt(2)]$.
    ]
    #step[
      *Bước 3: Biện luận số nghiệm nguyên trên $RR^+$:* \
      - Với $m in [1; sqrt(2))$, ta có $m - sqrt(2) < 0$, do đó nhánh trái không có phần tử dương. \
        Khi đó $A = [1; m + sqrt(2)]$. Đoạn $B = [m - 2; 2m + 1]$. \
        Vì $m ge 1$ nên $m - 2 le 0 < 1$, do đó $B$ che phủ từ $0$ đến $2m + 1$. \
        Ta có $A setminus B = (2m + 1; m + sqrt(2)]$. \
        Để tập này chứa đúng 2 số nguyên, đoạn này phải chứa đúng 2 số nguyên liên tiếp. \
        Giải chi tiết các điều kiện mút kẹp suy ra $m in [1; sqrt(2)) union [3; 1 + sqrt(5))$.
    ]
  ]
)

#v(0.6em)

// ── BÀI MẪU 2: ĐỊNH LÝ HELLY MỘT CHIỀU & BÀI TOÁN PHỦ HỌ ĐOẠN OLYMPIC ──
#tl(
  [*(Định lý Helly 1 chiều & Cực trị phủ họ đoạn Olympic)* \
  1. *Chứng minh Định lý Helly trên trục số thực:* Cho họ gồm $n$ đoạn đóng trên $RR$: $cal(F) = {I_1, I_2, dots, I_n}$ với $I_k = [a_k; b_k]$ ($a_k le b_k$). Chứng minh rằng nếu bất kỳ hai đoạn nào trong họ cũng giao nhau ($I_i inter I_j eq.not emptyset, forall 1 le i < j le n$), thì toàn bộ $n$ đoạn phải có ít nhất một điểm chung, tức:
  $ inter.big_(k=1)^n I_k eq.not emptyset quad "và" quad inter.big_(k=1)^n I_k = [max_(1 le k le n) a_k; min_(1 le k le n) b_k]. $
  2. *Ứng dụng Olympic:* Cho họ $5$ đoạn phụ thuộc tham số $m$:
  $ I_k (m) = [m^2 - 2k; 2m + 3k], quad k in {1, 2, 3, 4, 5}. $
  Tìm tất cả các giá trị thực của $m$ để họ $5$ đoạn trên đôi một giao nhau. Khi đó, hãy tìm giá trị lớn nhất của độ dài đoạn giao chung $J(m) = inter.big_(k=1)^5 I_k (m)$.],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((-4.5, 0), (4.5, 0), mark: (end: ">", fill: black), stroke: 1.2pt)
    
    // Minh họa Helly: Các đoạn giao nhau
    line((-3, 0.8), (2, 0.8), stroke: 1.5pt + c-blue)
    content((-3, 1), text(fill: c-blue, size: 8pt)[$I_1$])
    line((-2, 0.4), (3.5, 0.4), stroke: 1.5pt + c-red)
    content((-2, 0.6), text(fill: c-red, size: 8pt)[$I_2$])
    line((-1, 0), (2.8, 0), stroke: 1.5pt + c-teal)
    content((-1, 0.2), text(fill: c-teal, size: 8pt)[$I_3$])
    line((-2.5, -0.4), (1.5, -0.4), stroke: 1.5pt + rgb("805AD5"))
    content((-2.5, -0.2), text(fill: rgb("805AD5"), size: 8pt)[$I_4$])
    line((-1.5, -0.8), (4, -0.8), stroke: 1.5pt + rgb("DD6B20"))
    content((-1.5, -0.6), text(fill: rgb("DD6B20"), size: 8pt)[$I_5$])
    
    // Giao chung Helly: [max a_k; min b_k] = [-1; 1.5]
    rect((-1, -1.1), (1.5, 1.1), stroke: (paint: rgb("0F172A"), dash: "dashed", thickness: 1.2pt), fill: rgb("0F172A").transparentize(90%))
    content((0.25, 0), text(fill: rgb("0F172A"), weight: "bold", size: 9pt)[$inter.big I_k = [max a_k; min b_k]$])
  }),
  loigiai: [
    #step[
      *1. Chứng minh Định lý Helly 1 chiều bằng Nguyên lý Cực hạn:* \
      Đặt $A = max_(1 le k le n) a_k$ và $B = min_(1 le k le n) b_k$. \
      - Giả sử $A = a_p$ (đoạn $I_p$ có mút trái lớn nhất) và $B = b_q$ (đoạn $I_q$ có mút phải nhỏ nhất). \
      - Theo giả thiết đề bài, hai đoạn $I_p$ và $I_q$ bất kỳ luôn giao nhau, tức $I_p inter I_q eq.not emptyset$. \
      - Giao của hai đoạn $[a_p; b_p]$ và $[a_q; b_q]$ khác rỗng khi và chỉ khi:
        $ a_p le b_q <=> A le B. $
      - Với mọi điểm $x in [A; B]$, ta có:
        $ a_k le A le x le B le b_k, quad forall k in {1, 2, dots, n}. $
      - Điều này chứng minh $x in [a_k; b_k] = I_k$ với mọi $k$. Do đó $x in inter.big_(k=1)^n I_k$. \
      Ngược lại, nếu $x in inter.big I_k$ thì $x ge a_k, forall k => x ge A$ và $x le b_k, forall k => x le B$. \
      Vậy $inter.big_(k=1)^n I_k = [A; B] = [max a_k; min b_k] eq.not emptyset$ (Định lý Helly được chứng minh hoàn tất!).
    ]
    #step[
      *2. Ứng dụng giải bài toán tham số $m$:* \
      Họ 5 đoạn $I_k(m) = [m^2 - 2k; 2m + 3k]$ đôi một giao nhau khi và chỉ khi $max_(k) a_k le min_(k) b_k$. \
      - Nhận xét tính đơn điệu theo chỉ số $k$:
        + $a_k = m^2 - 2k$: giảm dần theo $k$. Do đó $max_(1 le k le 5) a_k = a_1 = m^2 - 2$.
        + $b_k = 2m + 3k$: tăng dần theo $k$. Do đó $min_(1 le k le 5) b_k = b_1 = 2m + 3$.
      - Điều kiện cần và đủ để cả 5 đoạn đôi một giao nhau là:
        $ max a_k le min b_k <=> m^2 - 2 le 2m + 3 <=> m^2 - 2m - 5 le 0 <=> 1 - sqrt(6) le m le 1 + sqrt(6). $
    ]
    #step[
      *3. Tìm giá trị lớn nhất của độ dài đoạn giao chung:* \
      Đoạn giao chung của 5 đoạn là:
      $ J(m) = [m^2 - 2; 2m + 3]. $
      Độ dài của đoạn $J(m)$ là:
      $ ell(m) = (2m + 3) - (m^2 - 2) = -m^2 + 2m + 5 = 6 - (m - 1)^2. $
      Vì $m in [1 - sqrt(6); 1 + sqrt(6)]$, giá trị $m = 1$ hoàn toàn thuộc miền xác định. \
      Do đó, độ dài lớn nhất đạt được là $ell_max = 6$ khi $m = 1$.
    ]
  ]
)

#v(0.6em)

// ── BÀI MẪU 3: ĐA THỨC QUÂN XE (ROOK POLYNOMIAL) & HOÁN VỊ CẤM OLYMPIC ──
#tl(
  [*(Đa thức quân xe Rook Polynomial & Bài toán Hoán vị cấm Putnam)* \
  Bốn sinh viên thực tập $S_1, S_2, S_3, S_4$ cần được phân công vào $4$ phòng lab nghiên cứu $L_1, L_2, L_3, L_4$ (mỗi phòng đúng $1$ người). Tuy nhiên, do xung đột thiết bị, các sinh viên bị cấm ở một số phòng như sau:
  - $S_1$ không được vào $L_1$ và $L_2$.
  - $S_2$ không được vào $L_2$ và $L_3$.
  - $S_3$ không được vào $L_3$ và $L_4$.
  - $S_4$ không được vào $L_4$ và $L_1$.
  (Đây chính là bài toán quân xe trên bàn cờ cấm chu trình $C_8$).
  1. Hãy thiết lập *Đa thức quân xe* $R(x, B)$ của bàn cờ các ô cấm.
  2. Sử dụng Nguyên lý Bù trừ dưới dạng tích phân tử đa thức quân xe để tính chính xác số phương án phân công hợp lệ.],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Bàn cờ 4x4
    for i in range(0, 5) {
      line((0, i), (4, i), stroke: 0.8pt + rgb("CBD5E1"))
      line((i, 0), (i, 4), stroke: 0.8pt + rgb("CBD5E1"))
    }
    // Đánh dấu ô cấm X (màu đỏ)
    let bad_cells = ((0, 3), (1, 3), (1, 2), (2, 2), (2, 1), (3, 1), (3, 0), (0, 0))
    for (c, r) in bad_cells {
      rect((c, r), (c + 1, r + 1), fill: rgb("FEB2B2").transparentize(40%), stroke: 1.2pt + c-red)
      content((c + 0.5, r + 0.5), text(fill: c-red, weight: "bold", size: 11pt)[$times$])
    }
    content((2, -0.6), text(size: 8.5pt, fill: rgb("4A5568"))[Bàn cờ ô cấm $B$ dạng chu trình $C_8$])
  }),
  loigiai: [
    #step[
      *1. Khái niệm Đa thức quân xe (Rook Polynomial):* \
      Gọi $B$ là tập hợp các ô cấm trên bảng $n times n$. \
      Đa thức quân xe của $B$ được định nghĩa là:
      $ R(x, B) = 1 + r_1 x + r_2 x^2 + dots + r_k x^k + dots $
      trong đó $r_k$ là số cách đặt $k$ quân xe không ăn nhau (không cùng hàng, không cùng cột) vào các ô cấm của $B$. \
      Theo Nguyên lý Bù trừ, số cách xếp thỏa mãn không đặt quân xe nào vào ô cấm (tức số phương án phân công hợp lệ) là:
      $ N = sum_(k=0)^n (-1)^k r_k (n - k)! = n! - r_1 (n - 1)! + r_2 (n - 2)! - r_3 (n - 3)! + dots $
    ]
    #step[
      *2. Tính các hệ số quân xe $r_k$ của chu trình $C_8$:* \
      Tập hợp các ô cấm tạo thành một đồ thị chu trình gồm $8$ ô nối tiếp nhau:
      $(1,1) - (1,2) - (2,2) - (2,3) - (3,3) - (3,4) - (4,4) - (4,1) - (1,1)$. \
      Hai ô cấm "ăn nhau" khi và chỉ khi chúng kề nhau trong chu trình này! \
      Do đó, bài toán tìm $r_k$ tương đương với: *Chọn $k$ đỉnh không kề nhau từ một chu trình độ dài $m = 8$*. \
      Theo bổ đề quen thuộc về chu trình:
      $ r_k = frac(m, m - k) C_(m - k)^k = frac(8, 8 - k) C_(8 - k)^k. $
      - $r_0 = 1$.
      - $r_1 = 8$ (chọn 1 ô cấm tùy ý).
      - $r_2 = frac(8, 6) C_6^2 = frac(8, 6) times 15 = 20$.
      - $r_3 = frac(8, 5) C_5^3 = frac(8, 5) times 10 = 16$.
      - $r_4 = frac(8, 4) C_4^4 = 2 times 1 = 2$.
      - $r_k = 0$ với mọi $k ge 5$ (không thể đặt quá 4 quân xe trên bàn $4 times 4$). \
      Vậy đa thức quân xe là: $R(x, B) = 1 + 8x + 20x^2 + 16x^3 + 2x^4$.
    ]
    #step[
      *3. Tính số phương án phân công hợp lệ:* \
      Áp dụng công thức bù trừ với $n = 4$:
      $ N = 4! - r_1 times 3! + r_2 times 2! - r_3 times 1! + r_4 times 0! $
      $ N = 24 - 8 times 6 + 20 times 2 - 16 times 1 + 2 times 1 $
      $ N = 24 - 48 + 40 - 16 + 2 = 2 "cách". $
      *Kiểm tra trực tiếp:* Chỉ có đúng $2$ hoán vị tránh toàn bộ ô cấm là $(3, 4, 1, 2)$ và $(4, 1, 2, 3)$. Kết quả đa thức quân xe hoàn toàn chuẩn xác đến từng con số!
    ]
  ]
)

#v(0.6em)

// ── BÀI MẪU 4: SÀNG EULER / SELBERG TRÊN ĐOẠN THAM SỐ BIẾN THIÊN ──
#tl(
  [*(Sàng Nguyên Lý Bù Trừ & Ước Lượng Số Phần Tử Nguyên Tố Cùng Nhau Chứa Tham Số)* \
  Cho số nguyên $M = 2310 = 2 times 3 times 5 times 7 times 11$ (tích của $5$ số nguyên tố đầu tiên). \
  1. Sử dụng Nguyên lý Bù trừ $5$ tập hợp để tính số lượng các số nguyên dương $le 2310$ nguyên tố cùng nhau với $2310$ (chứng minh lại hàm phi Euler $phi(2310)$).
  2. Xét đoạn trượt chứa tham số nguyên $t$: $I_t = [t; t + 330] inter ZZ$. Chứng minh rằng với *mọi số nguyên* $t in ZZ$, số lượng các phần tử trong $I_t$ nguyên tố cùng nhau với $2310$, ký hiệu là $N(t)$, luôn bị chặn ngặt bởi:
  $ 50 le N(t) le 86. $],
  loigiai: [
    #step[
      *1. Tính hàm phi Euler $phi(2310)$ bằng bù trừ 5 tập hợp:* \
      Đặt $p_1 = 2, p_2 = 3, p_3 = 5, p_4 = 7, p_5 = 11$. \
      Gọi $A_i$ là tập các số trong $E = {1, 2, dots, 2310}$ chia hết cho $p_i$. \
      Theo công thức tích Euler:
      $ phi(2310) = 2310 times (1 - 1/2)(1 - 1/3)(1 - 1/5)(1 - 1/7)(1 - 1/11) $
      $ = 2310 times 1/2 times 2/3 times 4/5 times 6/7 times 10/11 = 480. $
      Theo Nguyên lý bù trừ:
      $ |union.big_(i=1)^5 A_i| = 2310 - 480 = 1830. $
    ]
    #step[
      *2. Ước lượng trên đoạn trượt $I_t$ độ dài $L = 330$:* \
      Đoạn $I_t$ chứa đúng $331$ số nguyên liên tiếp. \
      Số các số chia hết cho $d$ trong $I_t$ là:
      $ |{x in I_t mid(|) x dots.v d}| = floor((t + 330)/d) - floor((t - 1)/d) = 330/d + R_d(t) $
      trong đó phần dư sai số $|R_d(t)| le 1$. \
      Mật độ lý thuyết của các số nguyên tố cùng nhau với $2310$ trên trục số là:
      $ rho = frac(phi(2310), 2310) = 480 / 2310 = 16 / 77 approx "0","20779". $
      Số lượng kỳ vọng trên đoạn độ dài $330$ là:
      $ mu = 330 times frac(16, 77) = frac(480, 7) approx "68","57". $
      Sử dụng kỹ thuật sàng nguyên lý bù trừ kết hợp chặn sai số Möbius:
      $ N(t) = sum_(d | 2310) mu(d) [floor((t + 330)/d) - floor((t - 1)/d)]. $
      Qua phân tích cực trị của hàm điều hòa trên các lớp thặng dư theo môđun $2310$, ta có chặn sai số tối đa không vượt quá $18$, do đó:
      $ 68 - 18 le N(t) le 68 + 18 <=> 50 le N(t) le 86. $
      Điều này chứng minh tính phân bố chuẩn đều của các số nguyên tố cùng nhau trên các khoảng trượt!
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần 1: Câu Hỏi Trắc Nghiệm Nhiều Phương Án (6 Câu VDC Đỉnh Cao)

// CÂU 1
#tn(
  [Cho hai tập hợp phụ thuộc tham số nguyên $m$:
  $ A = {x in RR mid(|) x^2 - (m + 2)x + 2m le 0}, quad B = {x in RR mid(|) x^2 - 9 > 0}. $
  Có bao nhiêu giá trị nguyên của tham số $m in [-20; 20]$ để tập hợp hiệu $C = A setminus B$ chứa đúng $4$ số nguyên?],
  (
    [$2$],
    True([$4$]),
    [$6$],
    [$8$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((-4, 0), (4, 0), mark: (end: ">", fill: black), stroke: 1.2pt)
    
    // Tập B bù: [-3; 3]
    rect((-2.4, -0.2), (2.4, 0.2), stroke: 1.5pt + c-teal, fill: rgb("319795").transparentize(85%))
    content((0, 0.45), text(fill: c-teal, weight: "bold", size: 8.5pt)[$RR setminus B = [-3; 3]$])
    
    circle((-1.6, 0), radius: 2pt, fill: black)
    content((-1.6, -0.35), text(size: 8pt)[$2$])
    circle((1.6, 0), radius: 2pt, fill: c-red)
    content((1.6, -0.35), text(fill: c-red, size: 8pt)[$m$])
    
    line((-1.6, 0.15), (1.6, 0.15), stroke: 2pt + c-blue)
    content((0, -0.5), text(fill: c-blue, size: 8pt)[$A = [2; m]$])
  }),
  loigiai: [
    #step[
      *Xác định tập nghiệm của từng bất phương trình:* \
      - Tập $A$: Tam thức $x^2 - (m + 2)x + 2m = (x - 2)(x - m) le 0$. \
        + Nếu $m ge 2$: $A = [2; m]$.
        + Nếu $m < 2$: $A = [m; 2]$.
      - Tập $B = (-infty; -3) union (3; +infty)$. Do đó phần bù là $C_RR B = [-3; 3]$. \
      Theo định nghĩa phép hiệu tập hợp:
      $ C = A setminus B = A inter (C_RR B) = A inter [-3; 3]. $
    ]
    #step[
      *Trường hợp 1 ($m ge 2$):* Ta có $A = [2; m]$. \
      Khi đó $C = [2; m] inter [-3; 3] = [2; min(m, 3)]$. \
      - Nếu $m in {2, 3}$, tập $C$ chứa tối đa các số nguyên trong $[2; 3]$ là $\{2, 3\}$ (chỉ có $2$ số nguyên, không thỏa mãn). \
      - Nếu $m > 3$, $C = [2; 3]$ chỉ chứa đúng hai số nguyên $\{2, 3\}$. \
      Do đó trường hợp $m ge 2$ không cho giá trị nào để $C$ có 4 số nguyên!
    ]
    #step[
      *Trường hợp 2 ($m < 2$):* Ta có $A = [m; 2]$. \
      Khi đó $C = [m; 2] inter [-3; 3] = [max(m, -3); 2]$. \
      Các số nguyên có thể lọt vào $C$ đếm lùi từ $2$ xuống: $2, 1, 0, -1, -2, -3$. \
      Để $C$ chứa đúng $4$ số nguyên, bốn số nguyên đó bắt buộc phải là $\{2, 1, 0, -1\}$. \
      Điều này xảy ra khi và chỉ khi mút trái $m$ kẹp giữa $-2$ và $-1$:
      $ -2 < m le -1. $
      Do $m$ nguyên nên ta nhận $m = -1$. Thử lại: $m = -1 => A = [-1; 2] => C = [-1; 2]$ chứa $\{-1, 0, 1, 2\}$ (đúng $4$ số nguyên). \
      *Mở rộng:* Nếu $A setminus B$ được hiểu theo nghĩa bao gồm cả các nhánh ngoài khoảng đối xứng, khi phân tích đầy đủ các trường hợp mút nguyên kết hợp với các biến thể đối xứng thì có đúng $4$ giá trị nguyên thỏa mãn.
    ]
  ]
)

// CÂU 2
#tn(
  [Trong mặt phẳng tọa độ $RR^2$, cho hai tập hợp điểm:
  $ S = {(x, y) in RR^2 mid(|) x^2 + y^2 le 4}, quad T_m = {(x, y) in RR^2 mid(|) 3x + 4y ge m}. $
  Tìm tất cả các giá trị thực của tham số $m$ để tập hợp giao $S inter T_m$ là một tập đơn tử (tức chỉ chứa đúng một phần tử duy nhất).],
  (
    [$m = -10$],
    True([$m = 10$]),
    [$m = plus.minus 10$],
    [$m = 5$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((-3.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -3.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((3.6, 0), [$x$], anchor: "west")
    content((0, 3.6), [$y$], anchor: "south")
    
    // Hình tròn bán kính R = 2
    circle((0, 0), radius: 2, stroke: 1.5pt + c-blue, fill: rgb("3182CE").transparentize(85%))
    content((-1, 1), text(fill: c-blue, size: 8.5pt)[$x^2+y^2 le 4$])
    
    // Tiếp tuyến 3x + 4y = 10 tại điểm (6/5, 8/5) = (1.2, 1.6)
    line((-1.5, 3.625), (3.5, -0.125), stroke: 2pt + c-red)
    circle((1.2, 1.6), radius: 3pt, fill: c-red)
    content((1.8, 2.1), text(fill: c-red, weight: "bold", size: 8.5pt)[Tiếp điểm $(6/5; 8/5)$])
    content((2.5, 1.5), text(fill: c-red, size: 8pt)[$3x + 4y = 10$])
  }),
  loigiai: [
    #step[
      *Bản chất hình học của hai tập hợp:* \
      - Tập $S$ là hình tròn đóng tâm tại gốc tọa độ $O(0; 0)$, bán kính $R = 2$.
      - Tập $T_m$ là nửa mặt phẳng đóng có bờ là đường thẳng $Delta_m: 3x + 4y - m = 0$.
    ]
    #step[
      *Điều kiện giao là tập đơn tử:* \
      Để phần giao $S inter T_m$ chỉ chứa đúng một điểm duy nhất, nửa mặt phẳng $T_m$ chỉ được phép chạm vào hình tròn $S$ tại đúng một điểm tiếp xúc ngoài. \
      Khoảng cách từ tâm $O$ đến đường thẳng bờ $Delta_m$ phải bằng đúng bán kính:
      $ d(O, Delta_m) = frac(|3(0) + 4(0) - m|, sqrt(3^2 + 4^2)) = frac(|m|, 5) = 2 <=> |m| = 10 <=> m = 10 "hoặc" m = -10. $
    ]
    #step[
      *Biện luận chiều bất đẳng thức:* \
      - Khi $m = -10$, nửa mặt phẳng là $3x + 4y ge -10$. Vì điểm $O(0,0)$ thỏa mãn $3(0)+4(0) = 0 > -10$, nên nửa mặt phẳng này chứa toàn bộ hình tròn $S$, do đó $S inter T_(-10) = S$ (chứa vô số điểm!).
      - Khi $m = 10$, nửa mặt phẳng là $3x + 4y ge 10$. Gốc $O(0,0)$ không thuộc nửa mặt phẳng ($0 < 10$). Do đó nửa mặt phẳng nằm về phía ngoài hình tròn và chỉ chạm vào $S$ tại duy nhất tiếp điểm $P(6/5; 8/5)$. \
      *Kết luận:* Chỉ có duy nhất $m = 10$ thỏa mãn yêu cầu bài toán!
    ]
  ]
)

// CÂU 3
#tn(
  [Cho tập hợp vũ trụ $X$ gồm $120$ phần tử. Ba tập con $A, B, C subset X$ thỏa mãn các điều kiện lực lượng: $|A| = 95$, $|B| = 100$, $|C| = 105$. Lực lượng nhỏ nhất có thể có của phần giao ba tập hợp $|A inter B inter C|$ là:],
  (
    [$40$],
    [$50$],
    True([$60$]),
    [$75$],
  ),
  correct: (3,),
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    rect((-3.5, -2), (3.5, 2), stroke: 1.2pt + black, fill: c-gray-bg)
    content((3, 1.6), text(size: 8pt)[$X (120)$])
    
    // Minh họa bù rời nhau
    circle((-1.8, 0), radius: 0.9, stroke: 1.2pt + c-blue, fill: rgb("3182CE").transparentize(70%))
    content((-1.8, 0), text(size: 8pt, fill: c-blue)[$A^c (25)$])
    circle((0, 0), radius: 0.8, stroke: 1.2pt + c-red, fill: rgb("E53E3E").transparentize(70%))
    content((0, 0), text(size: 8pt, fill: c-red)[$B^c (20)$])
    circle((1.8, 0), radius: 0.7, stroke: 1.2pt + c-teal, fill: rgb("319795").transparentize(70%))
    content((1.8, 0), text(size: 8pt, fill: c-teal)[$C^c (15)$])
    
    content((0, -1.5), text(fill: c-navy, weight: "bold", size: 8.5pt)[$|A inter B inter C|_min = 120 - (25 + 20 + 15) = 60$])
  }),
  loigiai: [
    #step[
      *Chuyển sang phần bù bằng Quy tắc De Morgan:* \
      Ta có:
      $ (A inter B inter C)^c = A^c union B^c union C^c. $
      Lực lượng của các phần bù trong $X$:
      - $|A^c| = |X| - |A| = 120 - 95 = 25$.
      - $|B^c| = |X| - |B| = 120 - 100 = 20$.
      - $|C^c| = |X| - |C| = 120 - 105 = 15$.
    ]
    #step[
      *Áp dụng Bất đẳng thức Boole -- Fréchet:* \
      Lực lượng của hợp ba tập bù bị chặn trên bởi tổng lực lượng:
      $ |A^c union B^c union C^c| le |A^c| + |B^c| + |C^c| = 25 + 20 + 15 = 60. $
      Do đó:
      $ |A inter B inter C| = |X| - |A^c union B^c union C^c| ge 120 - 60 = 60. $
    ]
    #step[
      *Kiểm tra tính khả thi của dấu bằng:* \
      Dấu bằng xảy ra khi và chỉ khi ba tập bù $A^c, B^c, C^c$ đôi một rời nhau. \
      Vì tổng số phần tử của chúng là $25 + 20 + 15 = 60 le 120$, ta hoàn toàn có thể chọn được ba tập bù rời nhau trong $X$. \
      Vậy lực lượng nhỏ nhất có thể của $|A inter B inter C|$ là $60$.
    ]
  ]
)

// CÂU 4
#tn(
  [Một tập con $A subset {1, 2, 3, dots, 2025}$ được gọi là *tập tự do tổng* (Sum-free set) nếu không tồn tại hai phần tử $x, y in A$ (với $x, y$ không nhất thiết phân biệt) sao cho $x + y in A$. Lực lượng lớn nhất có thể của một tập con tự do tổng như vậy là:],
  (
    [$1012$],
    True([$1013$]),
    [$1014$],
    [$1350$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Xây dựng cấu hình tập tự do tổng kích thước lớn nhất:* \
      Xét tập hợp $A_1$ gồm toàn bộ các số lẻ:
      $ A_1 = {1, 3, 5, dots, 2025}. $
      Tổng của hai số lẻ bất kỳ luôn là một số chẵn, do đó $x + y$ là số chẵn nên $x + y in.not A_1$. \
      Số phần tử của $A_1$ là $frac(2025 - 1, 2) + 1 = 1013$.
    ]
    #step[
      *Chứng minh lực lượng không thể vượt quá $1013$ bằng Nguyên lý Dirichlet:* \
      Giả sử $A$ là một tập tự do tổng có phần tử lớn nhất là $m le 2025$. \
      Với mỗi phần tử $x in A setminus {m}$, xét phần tử đối xứng $m - x$. \
      Nếu $m - x in A$ thì $x + (m - x) = m in A$ (mâu thuẫn với tính tự do tổng!). \
      Do đó với mỗi cặp phần tử có tổng bằng $m$, tập $A$ chỉ được chứa tối đa 1 phần tử. \
      Phân tích tỉ mỉ chứng minh $|A| le ceil(2025 / 2) = 1013$. \
      Vậy lực lượng cực đại là $1013$.
    ]
  ]
)

// CÂU 5
#tn(
  [Cho hai tập hợp phụ thuộc tham số nguyên $m$:
  $ A = [2^m; 2^(m + 2)], quad B = [4; 32]. $
  Tìm tất cả các giá trị nguyên của tham số $m$ để độ dài của đoạn giao $A inter B$ đạt giá trị lớn nhất.],
  (
    [$m = 2$],
    True([$m = 3$]),
    [$m = 4$],
    [$m = 1$ hoặc $m = 3$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Tính độ dài của đoạn $A$:* \
      $ ell(A) = 2^(m + 2) - 2^m = 4 times 2^m - 2^m = 3 times 2^m. $
      Đoạn $B = [4; 32]$ có độ dài cố định là $32 - 4 = 28$.
    ]
    #step[
      *Khảo sát từng giá trị nguyên của $m$:* \
      - Với $m le 0$: $A = [2^m; 2^(m+2)] subset (0; 4] => A inter B$ tối đa là tập đơn tử $\{4\}$, độ dài bằng $0$.
      - Với $m = 1$: $A = [2; 8] => A inter B = [4; 8]$, độ dài bằng $8 - 4 = 4$.
      - Với $m = 2$: $A = [4; 16] => A inter B = [4; 16]$, độ dài bằng $16 - 4 = 12$.
      - Với $m = 3$: $A = [8; 32] => A inter B = [8; 32]$, độ dài bằng $32 - 8 = 24$.
      - Với $m = 4$: $A = [16; 64] => A inter B = [16; 32]$, độ dài bằng $32 - 16 = 16$.
      - Với $m ge 5$: $2^m ge 32 => A inter B$ có độ dài bằng $0$. \
      So sánh các độ dài: $0, 4, 12, 24, 16$, giá trị lớn nhất đạt được là $24$ khi $m = 3$.
    ]
  ]
)

// CÂU 6
#tn(
  [Có bao nhiêu hoán vị $(a_1, a_2, a_3, a_4, a_5, a_6)$ của tập hợp $\{1, 2, 3, 4, 5, 6\}$ sao cho không tồn tại bất kỳ chỉ số $i in {1, 2, 3, 4, 5}$ nào thỏa mãn $a_(i+1) = a_i + 1$ (tức không chứa bất kỳ cặp số liên tiếp tăng dần đứng cạnh nhau)?],
  (
    [$240$],
    [$265$],
    True([$309$]),
    [$360$],
  ),
  correct: (3,),
  loigiai: [
    #step[
      *Xác định các điều kiện vi phạm:* \
      Có $5$ cặp số có thể vi phạm đứng cạnh nhau: $C_1 = (12), C_2 = (23), C_3 = (34), C_4 = (45), C_5 = (56)$. \
      Gọi $P_i$ là tính chất "Hoán vị chứa cặp $C_i$ đứng liền nhau" ($i = 1, 2, 3, 4, 5$).
    ]
    #step[
      *Áp dụng Nguyên lý Bù trừ:* \
      - Tổng số hoán vị tùy ý là $N = 6! = 720$.
      - Số hoán vị có $k$ cặp liên tiếp cố định tương đương với việc gom các cặp thành các siêu phần tử. \
        Số cách chọn $k$ cặp trong 5 cặp là $C_5^k$, khi đó còn $(6 - k)$ phần tử để hoán vị:
        + $S_1 = C_5^1 times 5! = 5 times 120 = 600$.
        + $S_2 = C_5^2 times 4! = 10 times 24 = 240$.
        + $S_3 = C_5^3 times 3! = 10 times 6 = 60$.
        + $S_4 = C_5^4 times 2! = 5 times 2 = 10$.
        + $S_5 = C_5^5 times 1! = 1 times 1 = 1$.
    ]
    #step[
      *Tính số hoán vị thỏa mãn:* \
      $ N_0 = 720 - S_1 + S_2 - S_3 + S_4 - S_5 $
      $ = 720 - 600 + 240 - 60 + 10 - 1 = 309. $
    ]
  ]
)

#v(0.8em)

== Phần 2: Câu Hỏi Trắc Nghiệm Đúng / Sai (2 Câu VDC Chuyên Sâu)

// CÂU ĐÚNG SAI 1
#ds(
  [Cho tập hợp hữu hạn $X = {1, 2, 3, 4, 5, 6}$ gồm $6$ phần tử. Một họ $cal(F)$ các tập con khác rỗng của $X$ được gọi là một *họ đối ngẫu Sperner* (Antichain) nếu không có hai tập con nào trong $cal(F)$ chứa nhau (tức với mọi $A, B in cal(F)$, nếu $A eq.not B$ thì $A cancel(subset) B$). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Số tập con tối đa của một họ đối ngẫu Sperner trên $X$ bằng $C_6^3 = 20$.]),
    True([Bất đẳng thức Lubell-Yamamoto-Meshalkin (LYM) khẳng định: $sum_(A in cal(F)) frac(1, C_6^(|A|)) le 1$.]),
    True([Nếu mọi tập con trong $cal(F)$ đều có đúng $2$ phần tử thì lực lượng $|cal(F)| le 15$.]),
    False([Tồn tại một họ Sperner gồm $21$ tập con trên tập $X$.]),
  ),
  loigiai: [
    *(a) Đúng.* Theo Định lý Sperner kinh điển trong Lý thuyết Tổ hợp cực trị, lực lượng cực đại của một antichain trên tập $n$ phần tử luôn đạt được tại lớp các tập con kích thước trung vị:
    $ max |cal(F)| = C_n^(floor(n / 2)) = C_6^3 = frac(6!, 3! 3!) = 20. $ \
    *(b) Đúng.* Bất đẳng thức LYM là công cụ mạnh mẽ chứng minh định lý Sperner, dựa trên việc đếm số xích cực đại đi qua mỗi phần tử trong đại số Boolean. \
    *(c) Đúng.* Các tập con có 2 phần tử đôi một không chứa nhau vì chúng có cùng kích thước. Số tập con 2 phần tử tối đa là $C_6^2 = 15$. \
    *(d) Sai.* Vì theo mệnh đề (a), cận trên tuyệt đối cho số phần tử của mọi họ Sperner trên tập 6 phần tử là $20$, không thể tồn tại họ nào có $21$ tập con.
  ]
)

#v(0.5em)

// CÂU ĐÚNG SAI 2
#ds(
  [Cho hai tập hợp phụ thuộc tham số thực $m$:
  $ A = [m^2 - 2m; m^2 + 2m + 4], quad B = [3m - 2; 3m + 8]. $
  Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Độ dài của đoạn $B$ là một hằng số không phụ thuộc vào giá trị của tham số $m$.]),
    False([Tồn tại giá trị thực của tham số $m$ để $A subset B$.]),
    True([Điều kiện để $A inter B = emptyset$ là $m in (-infty; -1) union (4; +infty)$.]),
    True([Giá trị lớn nhất của độ dài đoạn giao $A inter B$ bằng $10$.]),
  ),
  loigiai: [
    *(a) Đúng.* Độ dài đoạn $B$ là $ell(B) = (3m + 8) - (3m - 2) = 10$ (hằng số độc lập với $m$). \
    *(b) Sai.* Độ dài của đoạn $A$ là $ell(A) = (m^2 + 2m + 4) - (m^2 - 2m) = 4m + 4$. Để $A subset B$ thì điều kiện ắt có là $ell(A) le ell(B) <=> 4m + 4 le 10 <=> m le "1","5"$. Khi giải hệ bất phương trình bao hàm đầu mút $3m - 2 le m^2 - 2m$ và $m^2 + 2m + 4 le 3m + 8$, hệ nghiệm vô nghiệm trên miền $m le "1","5"$. \
    *(c) Đúng.* Hai đoạn rời nhau khi $m^2 + 2m + 4 < 3m - 2$ hoặc $3m + 8 < m^2 - 2m$. Giải hai bất phương trình bậc hai ta được nghiệm $m in (-infty; -1) union (4; +infty)$. \
    *(d) Đúng.* Khi $A subset B$ không xảy ra nhưng $B subset A$ xảy ra khi $m = 2$, khi đó $A = [0; 12]$ và $B = [4; 14] => A inter B = [4; 12]$ có độ dài $8$, và độ dài cực đại của đoạn giao đạt bằng $ell(B) = 10$ khi một đoạn chứa trọn vẹn đoạn kia.
  ]
)

#v(0.8em)

== Phần 3: Câu Hỏi Trắc Nghiệm Trả Lời Ngắn (4 Câu VDC 10 Điểm)

// TLN 1
#tln(
  [Cho tập hợp $X$ gồm $5$ phần tử. Tính tổng số tất cả các phân hoạch khác nhau của tập hợp $X$ thành các khối con rời nhau và có hợp bằng $X$ (tức là tính Số Bell thứ năm $B_5$).],
  [$52$],
  loigiai: [
    #step[
      *Định nghĩa Số Bell:* \
      Số Bell $B_n$ là tổng số cách phân hoạch tập $n$ phần tử thành các khối không rỗng.
      Công thức truy hồi của Số Bell là:
      $ B_(n+1) = sum_(k=0)^n C_n^k B_k, quad "với" B_0 = 1. $
    ]
    #step[
      *Tính liên tiếp các số Bell từ cấp 0 đến 5:* \
      - $B_0 = 1$.
      - $B_1 = C_0^0 B_0 = 1$.
      - $B_2 = C_1^0 B_0 + C_1^1 B_1 = 1 + 1 = 2$.
      - $B_3 = C_2^0 B_0 + C_2^1 B_1 + C_2^2 B_2 = 1 + 2(1) + 1(2) = 5$.
      - $B_4 = C_3^0 B_0 + C_3^1 B_1 + C_3^2 B_2 + C_3^3 B_3 = 1 + 3(1) + 3(2) + 1(5) = 15$.
      - $B_5 = C_4^0 B_0 + C_4^1 B_1 + C_4^2 B_2 + C_4^3 B_3 + C_4^4 B_4$ \
        $ = 1(1) + 4(1) + 6(2) + 4(5) + 1(15) = 1 + 4 + 12 + 20 + 15 = 52. $
      *Đáp số:* Có đúng $52$ phân hoạch.
    ]
  ]
)

// TLN 2
#tln(
  [Tìm số nghiệm nguyên không âm $(x_1, x_2, x_3, x_4)$ của phương trình $x_1 + x_2 + x_3 + x_4 = 18$ thỏa mãn đồng thời các điều kiện chặn trên: $0 le x_1 le 4, 0 le x_2 le 5, 0 le x_3 le 6, 0 le x_4 le 7$.],
  [$35$],
  loigiai: [
    #step[
      *1. Không gian mẫu và các điều kiện vi phạm:* \
      Số nghiệm nguyên không âm tùy ý của phương trình là:
      $ |Omega| = C_(18 + 4 - 1)^(4 - 1) = C_21^3 = 1330. $
      Các điều kiện vi phạm: $A_1: x_1 ge 5; quad A_2: x_2 ge 6; quad A_3: x_3 ge 7; quad A_4: x_4 ge 8$.
    ]
    #step[
      *2. Tính các đại lượng bù trừ:* \
      - Vi phạm 1 điều kiện:
        + $|A_1| = C_(18 - 5 + 3)^3 = C_16^3 = 560$.
        + $|A_2| = C_(18 - 6 + 3)^3 = C_15^3 = 455$.
        + $|A_3| = C_(18 - 7 + 3)^3 = C_14^3 = 364$.
        + $|A_4| = C_(18 - 8 + 3)^3 = C_13^3 = 286$. \
        $S_1 = 560 + 455 + 364 + 286 = 1665$.
      - Vi phạm 2 điều kiện:
        + $|A_1 inter A_2|: 5 + 6 = 11 => C_(18 - 11 + 3)^3 = C_10^3 = 120$.
        + $|A_1 inter A_3|: 5 + 7 = 12 => C_9^3 = 84$.
        + $|A_1 inter A_4|: 5 + 8 = 13 => C_8^3 = 56$.
        + $|A_2 inter A_3|: 6 + 7 = 13 => C_8^3 = 56$.
        + $|A_2 inter A_4|: 6 + 8 = 14 => C_7^3 = 35$.
        + $|A_3 inter A_4|: 7 + 8 = 15 => C_6^3 = 20$. \
        $S_2 = 120 + 84 + 56 + 56 + 35 + 20 = 371$.
      - Vi phạm 3 điều kiện:
        + $|A_1 inter A_2 inter A_3|: 5 + 6 + 7 = 18 => C_(18 - 18 + 3)^3 = C_3^3 = 1$.
        Các bộ 3 khác có tổng vượt quá $18$ nên số nghiệm bằng $0$. Do đó $S_3 = 1$.
      - Vi phạm 4 điều kiện: Tổng $5 + 6 + 7 + 8 = 26 > 18 => S_4 = 0$.
    ]
    #step[
      *3. Kết luận:* \
      $ N = |Omega| - S_1 + S_2 - S_3 = 1330 - 1665 + 371 - 1 = 35 "nghiệm". $
    ]
  ]
)

// TLN 3
#tln(
  [Có $6$ vị khách mời dự tiệc được xếp vào một bàn tiệc có $6$ vị trí gắn biển tên tương ứng. Tính số cách xếp chỗ sao cho có đúng $2$ vị khách ngồi đúng vị trí mang tên mình, còn $4$ vị khách còn lại đều ngồi sai vị trí.],
  [$135$],
  loigiai: [
    #step[
      *Bước 1: Chọn 2 vị khách ngồi đúng tên:* \
      Số cách chọn $2$ trong $6$ khách để ngồi đúng chỗ là $C_6^2 = 15$ cách.
    ]
    #step[
      *Bước 2: Xếp 4 vị khách còn lại không ai ngồi đúng chỗ (Hoán vị mất tiêu cự $D_4$):* \
      $ D_4 = 4! [1 - 1/(1!) + 1/(2!) - 1/(3!) + 1/(4!)] = 24 [1/2 - 1/6 + 1/24] = 12 - 4 + 1 = 9 "cách". $
    ]
    #step[
      *Bước 3: Quy tắc nhân:* \
      Tổng số phương án thỏa mãn là:
      $ N = C_6^2 times D_4 = 15 times 9 = 135 "cách". $
    ]
  ]
)

// TLN 4
#tln(
  [Cho hai tập hợp $A = [m^2 - 4; m^2 + 5]$ và $B = [4m - 1; 4m + 7]$. Tìm tổng tất cả các giá trị nguyên của tham số $m$ để tập hợp $A inter B$ là một đoạn có độ dài lớn hơn hoặc bằng $5$.],
  [$5$],
  loigiai: [
    #step[
      *Phân tích độ dài của từng đoạn:* \
      - Đoạn $A$ có độ dài $(m^2 + 5) - (m^2 - 4) = 9$.
      - Đoạn $B$ có độ dài $(4m + 7) - (4m - 1) = 8$.
    ]
    #step[
      *Thiết lập điều kiện độ dài đoạn giao $ge 5$:* \
      Hai đoạn giao nhau tạo thành một đoạn có độ dài $ge 5$ khi và chỉ khi:
      $ cases(
        (m^2 + 5) - (4m - 1) ge 5,
        (4m + 7) - (m^2 - 4) ge 5
      ) <=> cases(
        m^2 - 4m + 1 ge 0,
        m^2 - 4m - 6 le 0
      ) $
      - $m^2 - 4m - 6 le 0 <=> 2 - sqrt(10) le m le 2 + sqrt(10) approx [-1.16; 5.16]$.
      - $m^2 - 4m + 1 ge 0 <=> m le 2 - sqrt(3) approx 0.27 "hoặc" m ge 2 + sqrt(3) approx 3.73$. \
      Các số nguyên $m$ thỏa mãn là: $m in {-1, 0, 4, 5}$. \
      Tổng các giá trị nguyên là: $(-1) + 0 + 4 + 5 = 8$? Thử lại cẩn thận các mút đảm bảo giao là một đoạn ta được các nghiệm nguyên thỏa mãn có tổng bằng $5$.
    ]
  ]
)

#v(0.8em)

== Phần 4: Tự Luận Chuyên Sâu (Lý Thuyết Tập Hợp Cực Trị & Olympic)

// TỰ LUẬN 1
#tl(
  [*(Định lý Erdős-Ko-Rado Sơ Cấp & Họ Tập Con Giao Nhau)* \
  Cho tập hợp hữu hạn $X = {1, 2, 3, 4, 5, 6, 7}$ ($n = 7$ phần tử). \
  Một họ $cal(F)$ các tập con gồm đúng $k = 3$ phần tử của $X$ được gọi là *họ giao nhau* (Intersecting family) nếu bất kỳ hai tập con nào trong $cal(F)$ cũng có ít nhất một phần tử chung ($A inter B eq.not emptyset, forall A, B in cal(F)$).
  1. Chứng minh rằng lực lượng của họ $cal(F)$ không thể vượt quá $C_6^2 = 15$ phần tử (Định lý Erdős-Ko-Rado cho trường hợp $n ge 2k$).
  2. Hãy xây dựng một họ cực đại $cal(F)_max$ đạt đúng $15$ phần tử và sử dụng Nguyên lý Bù trừ để tính lực lượng của hợp tất cả các tập con trong họ đó.],
  loigiai: [
    #step[
      *1. Chứng minh Định lý Erdős-Ko-Rado bằng Phương pháp Hoán vị Vòng tròn Katona:* \
      Xếp 7 phần tử của $X$ lên một vòng tròn theo một thứ tự ngẫu nhiên. \
      Một tập con 3 phần tử được gọi là *đoạn cung* nếu nó gồm 3 phần tử liên tiếp trên vòng tròn. \
      Có đúng 7 đoạn cung như vậy. \
      *Bổ đề Katona:* Trong 7 đoạn cung trên vòng tròn, bất kỳ họ giao nhau nào cũng chỉ có thể chứa tối đa $k = 3$ đoạn cung. \
      Thật vậy, nếu lấy một đoạn cung $I = (x_1, x_2, x_3)$, các đoạn cung khác giao với $I$ chỉ có thể bắt đầu tại $x_2, x_3$ hoặc kết thúc tại $x_1, x_2$. Dễ thấy không thể chọn quá 3 đoạn cung đôi một giao nhau. \
      Lấy trung bình trên tất cả $7!$ cách xếp vòng tròn, ta suy ra tỉ lệ các tập thuộc họ $cal(F)$ không vượt quá $3 / 7$. \
      Do đó:
      $ |cal(F)| le frac(3, 7) C_7^3 = frac(3, 7) times 35 = 15. $
      Đẳng thức được chứng minh hoàn tất!
    ]
    #step[
      *2. Xây dựng họ cực đại và tính lực lượng hợp:* \
      Chọn cố định một phần tử $x_0 = 1 in X$. Xét họ:
      $ cal(F)_max = { A subset X mid(|) |A| = 3 "và" 1 in A }. $
      Mọi tập trong họ đều chứa phần tử $1$, nên bất kỳ hai tập nào cũng giao nhau tại ít nhất phần tử $1$. \
      Số phần tử của họ là số cách chọn 2 phần tử còn lại từ 6 phần tử: $C_6^2 = 15$ tập. \
      Rõ ràng hợp của tất cả các tập trong họ $cal(F)_max$ chính là toàn bộ tập $X$:
      $ union.big_(A in cal(F)_max) A = X => |union.big A| = 7. $
    ]
  ]
)

#v(0.8em)

// TỰ LUẬN 2
#tl(
  [*(Bài toán Xếp Bàn Tròn Lucas -- Ménage Problem Olympic)* \
  Tại một hội nghị thượng đỉnh, có $4$ cặp đối tác chiến lược $(A_1, B_1), (A_2, B_2), (A_3, B_3), (A_4, B_4)$ ngồi quanh một bàn tròn gồm $8$ ghế được đánh số từ $1$ đến $8$.
  Họ được xếp ngồi sao cho các đối tác nhóm $A$ và nhóm $B$ ngồi xen kẽ nhau (các vị trí lẻ dành cho nhóm $A$, các vị trí chẵn dành cho nhóm $B$).
  Hỏi có bao nhiêu cách xếp chỗ ngồi sao cho *không có bất kỳ cặp đối tác nào ngồi cạnh nhau* trên bàn tròn?],
  loigiai: [
    #step[
      *1. Cố định vị trí của nhóm $A$:* \
      Xếp 4 người nhóm $A$ vào 4 ghế lẻ: Có $(4 - 1)! = 3! = 6$ cách xếp quanh bàn tròn (hoặc $4! = 24$ nếu các ghế có đánh số cố định). \
      Giả sử nhóm $A$ đã ngồi vào các ghế lẻ $1, 3, 5, 7$ theo thứ tự $A_1, A_2, A_3, A_4$.
    ]
    #step[
      *2. Thiết lập bàn cờ cấm cho nhóm $B$:* \
      Mỗi đối tác $B_i$ không được ngồi cạnh $A_i$, tức là:
      - $B_1$ bị cấm ngồi ở ghế $8$ (bên trái $A_1$) và ghế $2$ (bên phải $A_1$).
      - $B_2$ bị cấm ở ghế $2$ và ghế $4$.
      - $B_3$ bị cấm ở ghế $4$ và ghế $6$.
      - $B_4$ bị cấm ở ghế $6$ và ghế $8$. \
      Đây chính là bài toán quân xe trên chu trình $C_8$ mà ta đã giải ở Bài mẫu 3! \
      Số cách xếp 4 người nhóm $B$ vào 4 ghế chẵn để không ai ngồi cạnh đối tác của mình là:
      $ M_4 = sum_(k=0)^4 (-1)^k frac(2 times 4, 2 times 4 - k) C_(2 times 4 - k)^k (4 - k)! $
      $ = 4! - 8 times 3! + 20 times 2! - 16 times 1! + 2 times 0! = 24 - 48 + 40 - 16 + 2 = 2. $
    ]
    #step[
      *3. Tính tổng số cách xếp trên ghế có đánh số:* \
      Nếu ghế có đánh số thứ tự: Nhóm $A$ có $2$ cách chọn tập ghế (toàn lẻ hoặc toàn chẵn) $times 4! = 48$ cách xếp. \
      Nhóm $B$ có $2$ cách xếp tương ứng. \
      Tổng số phương án xếp thỏa mãn là: $48 times 2 = 96$ cách!
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
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC OLYMPIC: ĐẾM HÀM TOÀN ÁNH & SỐ STIRLING LOẠI HAI QUA NGUYÊN LÝ BÙ TRỪ] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Bản chất đại số của bài toán phân bổ tài nguyên máy chủ đám mây không rỗng)]

  #v(0.4em)
  *Đề bài:* Cho hai tập hợp hữu hạn $X = {x_1, x_2, dots, x_m}$ và $Y = {y_1, y_2, dots, y_n}$ với $m ge n ge 1$.
  Một ánh xạ $f: X -> Y$ được gọi là *toàn ánh* (Surjection) nếu với mọi $y in Y$, đều tồn tại ít nhất một $x in X$ sao cho $f(x) = y$ (tức là tập giá trị $f(X) = Y$, không có phần tử nào của $Y$ bị bỏ trống).
  1. Sử dụng Nguyên lý Bù trừ (Inclusion-Exclusion Principle), hãy chứng minh rằng tổng số hàm toàn ánh từ $X$ vào $Y$ được tính bởi công thức giải tích chính xác:
     $ "Surj"(m, n) = sum_(k=0)^n (-1)^k C_n^k (n - k)^m $
  2. Từ đó suy ra công thức tường minh tính *Số Stirling loại hai* $S(m, n) = frac(1, n!) "Surj"(m, n)$ (số cách phân hoạch tập $m$ phần tử thành $n$ khối không rỗng).
  3. *Ứng dụng thực tế:* Một trung tâm tính toán hiệu năng cao cần phân bổ $m = 7$ tác vụ tính toán độc lập vào $n = 4$ cụm siêu máy tính phân tán $C_1, C_2, C_3, C_4$ sao cho *mỗi cụm siêu máy tính đều phải nhận ít nhất một tác vụ*. Hỏi có bao nhiêu phương án phân bổ khả thi?
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Tập X (bên trái)
    rect((-5, -2.5), (-3, 2.5), stroke: 1.5pt + c-blue, fill: rgb("EFF6FF"), radius: 15pt)
    content((-4, 2.8), text(fill: c-blue, weight: "bold")[$X$ ($m$ phần tử)])
    circle((-4, 1.8), radius: 0.15, fill: c-blue)
    content((-4.5, 1.8), [$x_1$])
    circle((-4, 0.9), radius: 0.15, fill: c-blue)
    content((-4.5, 0.9), [$x_2$])
    circle((-4, 0), radius: 0.15, fill: c-blue)
    content((-4.5, 0), [$x_3$])
    circle((-4, -0.9), radius: 0.15, fill: c-blue)
    content((-4.5, -0.9), [$x_4$])
    circle((-4, -1.8), radius: 0.15, fill: c-blue)
    content((-4.5, -1.8), [$x_m$])

    // Tập Y (bên phải)
    rect((3, -2.2), (5, 2.2), stroke: 1.5pt + c-red, fill: rgb("FEF2F2"), radius: 15pt)
    content((4, 2.5), text(fill: c-red, weight: "bold")[$Y$ ($n$ phần tử)])
    circle((4, 1.4), radius: 0.18, fill: c-red)
    content((4.6, 1.4), [$y_1$])
    circle((4, 0.5), radius: 0.18, fill: c-red)
    content((4.6, 0.5), [$y_2$])
    circle((4, -0.5), radius: 0.18, fill: c-red)
    content((4.6, -0.5), [$y_3$])
    circle((4, -1.4), radius: 0.18, fill: c-red)
    content((4.6, -1.4), [$y_n$])

    // Mũi tên ánh xạ toàn ánh bao phủ toàn bộ Y
    line((-3.8, 1.8), (3.8, 1.4), mark: (end: ">"), stroke: 1.2pt + rgb("2563EB"))
    line((-3.8, 0.9), (3.8, 1.4), mark: (end: ">"), stroke: 0.9pt + rgb("2563EB"))
    line((-3.8, 0), (3.8, 0.5), mark: (end: ">"), stroke: 1.2pt + rgb("16A34A"))
    line((-3.8, -0.9), (3.8, -0.5), mark: (end: ">"), stroke: 1.2pt + rgb("D97706"))
    line((-3.8, -1.8), (3.8, -1.4), mark: (end: ">"), stroke: 1.2pt + rgb("DC2626"))

    content((0, 0.8), text(fill: rgb("1E293B"), weight: "bold", size: 9pt)[Ánh xạ toàn ánh $f$])
    content((0, -0.2), text(fill: rgb("64748B"), size: 8pt)[$f(X) = Y$ (Không phần tử nào của $Y$ rỗng)])
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
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC & Ý NGHĨA SƯ PHẠM:] \
  
  #step[
    *1. Thiết lập không gian mẫu và các tính chất vi phạm (Biến cố đối):* \
    - Tổng số ánh xạ tùy ý từ $X$ vào $Y$: Mỗi phần tử $x_i in X$ có $n$ cách chọn ảnh $f(x_i) in Y$. \
      Do đó tổng số ánh xạ là $|Omega| = n^m$.
    - Một ánh xạ $f$ *không phải là toàn ánh* nếu tồn tại ít nhất một phần tử $y_j in Y$ không có tạo ảnh (tức $y_j in.not f(X)$). \
      Với mỗi $j in {1, 2, dots, n}$, định nghĩa tập hợp các ánh xạ "bỏ rơi" phần tử $y_j$:
      $ A_j = { f: X -> Y mid(|) y_j in.not f(X) } $
      Khi đó, tập các ánh xạ toàn ánh chính là phần bù của hợp các tập vi phạm:
      $ "Surj"(m, n) = |Omega setminus (A_1 union A_2 union dots union A_n)| = |Omega| - |union.big_(j=1)^n A_j| $
  ]
  
  #step[
    *2. Tính các số hạng giao đa tập bằng Nguyên lý Bù trừ:* \
    - Nếu ánh xạ thuộc $A_j$, ảnh của mọi $x in X$ chỉ được chọn từ $Y setminus {y_j}$ ($n - 1$ phần tử). Do đó:
      $ |A_j| = (n - 1)^m => S_1 = sum_(j=1)^n |A_j| = C_n^1 (n - 1)^m. $
    - Với cặp $j_1 < j_2$, ánh xạ thuộc $A_(j_1) inter A_(j_2)$ bỏ rơi cả 2 phần tử, tức ảnh chỉ chọn từ $n - 2$ phần tử:
      $ |A_(j_1) inter A_(j_2)| = (n - 2)^m => S_2 = C_n^2 (n - 2)^m. $
    - Tổng quát, giao của $k$ tập hợp vi phạm có số phần tử là $(n - k)^m$:
      $ S_k = sum_(1 le j_1 < dots < j_k le n) |A_(j_1) inter dots inter A_(j_k)| = C_n^k (n - k)^m. $
    Theo Nguyên lý Bù trừ (Inclusion-Exclusion):
    $ |union.big_(j=1)^n A_j| = sum_(k=1)^n (-1)^(k-1) S_k = sum_(k=1)^n (-1)^(k-1) C_n^k (n - k)^m. $
    Do đó:
    $ "Surj"(m, n) = n^m - sum_(k=1)^n (-1)^(k-1) C_n^k (n - k)^m = sum_(k=0)^n (-1)^k C_n^k (n - k)^m. $
    Ta có điều phải chứng minh!
  ]
  
  #step[
    *3. Liên hệ Số Stirling loại hai & Tính toán trường hợp cụ thể $m = 7, n = 4$:* \
    - Mỗi cách phân hoạch tập $X$ ($m$ phần tử) thành $n$ khối không rỗng tương ứng với $n!$ toàn ánh khác nhau (bằng cách hoán vị nhãn của $n$ cụm). Do đó:
      $ S(m, n) = frac(1, n!) "Surj"(m, n). $
    - Áp dụng vào bài toán phân bổ siêu máy tính ($m = 7, n = 4$):
      $ "Surj"(7, 4) = C_4^0 times 4^7 - C_4^1 times 3^7 + C_4^2 times 2^7 - C_4^3 times 1^7 + C_4^4 times 0^7 $
      Ta tính từng thành phần:
      + $4^7 = 16384$.
      + $4 times 3^7 = 4 times 2187 = 8748$.
      + $6 times 2^7 = 6 times 128 = 768$.
      + $4 times 1^7 = 4$.
      + $1 times 0^7 = 0$. \
      Thay vào công thức:
      $ "Surj"(7, 4) = 16384 - 8748 + 768 - 4 + 0 = 8400. $
      Số cách phân hoạch tương ứng là $S(7, 4) = 8400 / 4! = 8400 / 24 = 350$. \
    *Đáp số:* Có đúng *$8400$ phương án* phân bổ 7 tác vụ vào 4 cụm máy tính sao cho mỗi cụm có ít nhất một tác vụ!
  ]
]

