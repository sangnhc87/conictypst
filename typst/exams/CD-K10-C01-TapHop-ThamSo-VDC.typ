#import "../sang-exam.typ": *
#import "../template.typ": *
#import "../math-sym.typ": *
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
      CHUYÊN ĐỀ VẬN DỤNG CAO: TẬP HỢP CHỨA THAM SỐ $m$\
      & NGUYÊN LÝ BÙ TRỪ OLYMPIC
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("4A5568"))[
      Phép toán khoảng đoạn chứa tham số · Điểm mút ngoặc tròn/ngoặc vuông · Biến cố đối phần bù\
      Nguyên lý bù trừ đa tập hợp (Inclusion-Exclusion) · Mệnh đề Logic Boolean — Dành cho mục tiêu 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

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
  stroke: (left: 3pt + rgb("38A169")),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("276749"))[3. Nguyên lý Bù trừ (Inclusion-Exclusion Principle) Cho 2, 3 và 4 Tập Hợp] \
  - *Hai tập hợp*: $|A union B| = |A| + |B| - |A inter B|$.
  - *Ba tập hợp*:
  $ |A union B union C| = (|A| + |B| + |C|) - (|A inter B| + |B inter C| + |C inter A|) + |A inter B inter C|. $
  - *Bốn tập hợp (Tổng quát của Sylvester)*:
  $ |union.big_(i=1)^4 A_i| = sum_(i=1)^4 |A_i| - sum_(1 le i < j le 4) |A_i inter A_j| + sum_(1 le i < j < k le 4) |A_i inter A_j inter A_k| - |A_1 inter A_2 inter A_3 inter A_4|. $
  - *Công thức số phần tử chỉ thuộc đúng 1 tập hợp trong 3 tập*:
  $ |"Đúng 1 tập"| = (|A| + |B| + |C|) - 2(|A inter B| + |B inter C| + |C inter A|) + 3|A inter B inter C|. $
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 0.85cm, {
    import cetz.draw: *
    let r = 1.9
    let cA = (-1.1, 0.7)
    let cB = (1.1, 0.7)
    let cC = (0, -0.9)

    circle(cA, radius: r, stroke: 1.5pt + c-blue, fill: rgb("3182CE").transparentize(82%))
    circle(cB, radius: r, stroke: 1.5pt + c-red, fill: rgb("E53E3E").transparentize(82%))
    circle(cC, radius: r, stroke: 1.5pt + c-teal, fill: rgb("319795").transparentize(82%))

    content((-2.6, 2.2), text(fill: c-blue, weight: "bold", size: 12pt)[$A$])
    content((2.6, 2.2), text(fill: c-red, weight: "bold", size: 12pt)[$B$])
    content((0, -3.1), text(fill: c-teal, weight: "bold", size: 12pt)[$C$])

    content((0, 0.2), text(size: 8pt, weight: "bold", fill: c-navy)[$A inter B inter C$])
    content((-1.6, 0.8), text(size: 8pt, fill: c-blue)[Chỉ $A$])
    content((1.6, 0.8), text(size: 8pt, fill: c-red)[Chỉ $B$])
    content((0, -1.8), text(size: 8pt, fill: c-teal)[Chỉ $C$])
  })
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
  *Dạng 4: Bài toán đếm dữ liệu Venn đa nhãn & Logic Boolean*
  - Đặt ẩn cho các miền không giao nhau từ trong ra ngoài (bắt đầu từ miền giao của tất cả các tập hợp $x = |A inter B inter C|$).
  - Lập hệ phương trình bậc nhất nhiều ẩn và giải nghiệm nguyên không âm.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1 ─────────────────────────────────────────────────
#tln(
  [Cho hai tập hợp $A = [m - 1; (m + 3)/2]$ và $B = (-infty; -3) union [3; +infty)$. Tìm tất cả các giá trị thực của tham số $m$ để $A inter B eq.not emptyset$.],
  [$m in (-infty; -2) union [3; 5]$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    line((-5, 0), (5, 0), mark: (end: ">", fill: black), stroke: 1.2pt)
    content((5.2, 0), [$x$], anchor: "west")
    
    // Tập B
    line((-5, 0.25), (-3, 0.25), stroke: 2.5pt + c-red)
    line((-3, 0.1), (-3, -0.1), stroke: 1.5pt + c-red)
    content((-3, -0.35), text(fill: c-red)[$-3$])
    content((-4, 0.55), text(fill: c-red)[$(-infty; -3)$])

    line((3, 0.25), (5, 0.25), stroke: 2.5pt + c-red)
    line((3, 0.1), (3, -0.1), stroke: 1.5pt + c-red)
    content((3, -0.35), text(fill: c-red)[$3$])
    content((4, 0.55), text(fill: c-red)[$[3; +infty)$])

    // Miền lọt vào giữa B để giao rỗng
    line((-3, 0), (3, 0), stroke: (paint: gray, dash: "densely-dashed", thickness: 1.5pt))
    content((0, -0.6), text(fill: c-teal, size: 8.5pt, weight: "bold")[Khoảng kẹp $A inter B = emptyset <=> [-3; 3)$])
  }),
  loigiai: [
    #step[
      *Bước 1: Điều kiện để tập $A$ tồn tại và khác rỗng:* \
      $ m - 1 le (m + 3)/2 <=> 2m - 2 le m + 3 <=> m le 5. $
      Gọi điều kiện xác định là $cal(D) = (-infty; 5]$.
    ]
    #step[
      *Bước 2: Sử dụng phương pháp phần bù (Tìm $m$ để $A inter B = emptyset$):* \
      Tập $B = (-infty; -3) union [3; +infty)$ là hợp của hai tia số rời rạc. Do đó, $A$ không giao với $B$ khi và chỉ khi toàn bộ đoạn $A$ lọt hoàn toàn vào khoảng giữa của $B$, tức là:
      $ A subset [-3; 3) <=> cases(m - 1 ge -3, (m + 3)/2 < 3) <=> cases(m ge -2, m + 3 < 6) <=> cases(m ge -2, m < 3) <=> -2 le m < 3. $
      *(Lưu ý cực quan trọng về mút)*:
      - Tại $-3$: $B$ không chứa $-3$ (mút tròn) nên đầu mút trái $m-1$ của $A$ được phép bằng $-3$.
      - Tại $3$: $B$ có chứa điểm $3$ (mút vuông) nên đầu mút phải $(m+3)/2$ của $A$ phải tuyệt đối nhỏ hơn $3$ (không được có dấu bằng).
    ]
    #step[
      *Bước 3: Lấy bù trong tập điều kiện $cal(D) = (-infty; 5]$:* \
      Để $A inter B eq.not emptyset$, ta lấy phần bù của $[-2; 3)$ trong $(-infty; 5]$:
      $ m in (-infty; 5] setminus [-2; 3) = (-infty; -2) union [3; 5]. $
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2 ─────────────────────────────────────────────────
#tln(
  [Cho hai tập hợp $A = [m - 2; m + 5]$ và $B = [2m - 1; 2m + 3]$. Tìm tất cả các giá trị thực của tham số $m$ để $A inter B$ là một đoạn có độ dài đúng bằng $3$.],
  [$m = -2$ hoặc $m = 3$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((-4, 0), (4, 0), mark: (end: ">", fill: black), stroke: 1.2pt)
    
    // Đoạn giao nhau độ dài L
    rect((-1.5, -0.2), (1.5, 0.4), stroke: 1.5pt + c-teal, fill: rgb("319795").transparentize(80%))
    content((0, 0.1), text(fill: c-teal, weight: "bold")[Độ dài $L = 3$])
    
    line((-1.5, 0.5), (-1.5, -0.4), stroke: 1.5pt + c-blue)
    line((1.5, 0.5), (1.5, -0.4), stroke: 1.5pt + c-red)
    content((-1.5, -0.65), text(fill: c-blue)[$u(m)$])
    content((1.5, -0.65), text(fill: c-red)[$v(m)$])
  }),
  loigiai: [
    #step[
      *Bước 1: Nhận xét độ dài của từng tập hợp:* \
      - Độ dài đoạn $A$ là: $ell(A) = (m + 5) - (m - 2) = 7$.
      - Độ dài đoạn $B$ là: $ell(B) = (2m + 3) - (2m - 1) = 4$.
      Vì $ell(A) = 7$ và $ell(B) = 4$ đều lớn hơn $3$, việc giao nhau tạo thành một đoạn có độ dài bằng $3$ chỉ có thể xảy ra khi một đoạn bị trượt lấn vào đoạn kia từ bên trái hoặc từ bên phải.
    ]
    #step[
      *Bước 2: Phân tích 2 trường hợp tương giao:* \
      *Trường hợp 1 (Đoạn $B$ lệch sang phải so với $A$):* \
      Đầu mút trái của $B$ lọt vào trong $A$ và đầu mút phải của $A$ lọt vào trong $B$:
      $ m - 2 le 2m - 1 le m + 5 le 2m + 3. $
      Khi đó $A inter B = [2m - 1; m + 5]$. Độ dài đoạn giao là:
      $ ell(A inter B) = (m + 5) - (2m - 1) = 6 - m. $
      Theo yêu cầu đề bài: $6 - m = 3 <=> m = 3$. \
      Thử lại với $m = 3$: $A = [1; 8]$, $B = [5; 9] => A inter B = [5; 8]$ có độ dài $8 - 5 = 3$ (thỏa mãn).
    ]
    #step[
      *Bước 3: Phân tích trường hợp $B$ lệch sang trái:* \
      Đầu mút trái của $A$ lọt vào trong $B$ và đầu mút phải của $B$ lọt vào trong $A$:
      $ 2m - 1 le m - 2 le 2m + 3 le m + 5. $
      Khi đó $A inter B = [m - 2; 2m + 3]$. Độ dài đoạn giao là:
      $ ell(A inter B) = (2m + 3) - (m - 2) = m + 5. $
      Theo yêu cầu bài toán: $m + 5 = 3 <=> m = -2$. \
      Thử lại với $m = -2$: $A = [-4; 3]$, $B = [-5; -1] => A inter B = [-4; -1]$ có độ dài $(-1) - (-4) = 3$ (thỏa mãn).
    ]
    #step[
      *Kết luận:* Các giá trị thỏa mãn của tham số là $m = 3$ hoặc $m = -2$.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 3 ─────────────────────────────────────────────────
#tln(
  [Một viện nghiên cứu dữ liệu trí tuệ nhân tạo khảo sát $100$ kỹ sư về ba kỹ năng: Xử lý ngôn ngữ tự nhiên (NLP), Thị giác máy tính (CV) và Học tăng cường (RL). Kết quả ghi nhận:
  - $58$ kỹ sư thành thạo NLP, $45$ kỹ sư thành thạo CV, $40$ kỹ sư thành thạo RL.
  - $25$ kỹ sư thành thạo cả NLP và CV; $20$ kỹ sư thành thạo cả NLP và RL; $15$ kỹ sư thành thạo cả CV và RL.
  - Có đúng $8$ kỹ sư không thành thạo bất kỳ kỹ năng nào trong ba kỹ năng trên.
  Hỏi có bao nhiêu kỹ sư thành thạo đồng thời cả ba kỹ năng?],
  [$9$],
  fig: cetz.canvas(length: 0.85cm, {
    import cetz.draw: *
    let r = 1.9
    circle((-1.1, 0.7), radius: r, stroke: 1.5pt + c-blue, fill: rgb("3182CE").transparentize(85%))
    circle((1.1, 0.7), radius: r, stroke: 1.5pt + c-red, fill: rgb("E53E3E").transparentize(85%))
    circle((0, -0.9), radius: r, stroke: 1.5pt + c-teal, fill: rgb("319795").transparentize(85%))
    
    content((-2.6, 2.2), text(fill: c-blue, weight: "bold")[NLP ($58$)])
    content((2.6, 2.2), text(fill: c-red, weight: "bold")[CV ($45$)])
    content((0, -3.1), text(fill: c-teal, weight: "bold")[RL ($40$)])
    content((0, 0.2), text(size: 9pt, weight: "bold", fill: c-navy)[$x = ?$])
  }),
  loigiai: [
    #step[
      *Bước 1: Xác định lực lượng tập hợp hợp:* \
      Tổng số kỹ sư được khảo sát là $N = 100$. \
      Số kỹ sư có ít nhất một kỹ năng là:
      $ |"NLP" union "CV" union "RL"| = 100 - 8 = 92. $
    ]
    #step[
      *Bước 2: Áp dụng nguyên lý bù trừ cho ba tập hợp:* \
      Gọi $A, B, C$ lần lượt là tập các kỹ sư thành thạo NLP, CV và RL. Ta có:
      $ |A union B union C| = (|A| + |B| + |C|) - (|A inter B| + |B inter C| + |C inter A|) + |A inter B inter C|. $
      Thay số vào công thức:
      $ 92 = (58 + 45 + 40) - (25 + 15 + 20) + |A inter B inter C| $
      $ 92 = 143 - 60 + |A inter B inter C| $
      $ 92 = 83 + |A inter B inter C| <=> |A inter B inter C| = 92 - 83 = 9. $
    ]
    #step[
      *Kết luận:* Có đúng $9$ kỹ sư thành thạo đồng thời cả ba kỹ năng.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần 1: Câu Hỏi Trắc Nghiệm Nhiều Phương Án (6 Câu VDC)

// CÂU 1
#tn(
  [Cho hai tập hợp khác rỗng $A = [m - 1; (m + 1)/2]$ và $B = (-infty; -2) union [2; +infty)$. Có bao nhiêu giá trị nguyên của tham số $m in [-10; 10]$ để $A inter B eq.not emptyset$?],
  (
    [$11$],
    True([$10$]),
    [$14$],
    [$13$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    line((-4.5, 0), (4.5, 0), mark: (end: ">", fill: black), stroke: 1.2pt)
    line((-2, 0.2), (-2, -0.2), stroke: 1.5pt + c-red)
    line((2, 0.2), (2, -0.2), stroke: 1.5pt + c-red)
    content((-2, -0.4), text(fill: c-red)[$-2$])
    content((2, -0.4), text(fill: c-red)[$2$])
    line((-4.5, 0.2), (-2, 0.2), stroke: 2pt + c-red)
    line((2, 0.2), (4.5, 0.2), stroke: 2pt + c-red)
    line((-2, 0), (2, 0), stroke: (paint: c-teal, dash: "densely-dashed", thickness: 1.5pt))
    content((0, 0.5), text(fill: c-teal, size: 8pt)[Vùng rỗng: $[-2; 2)$])
  }),
  loigiai: [
    #step[
      *Điều kiện để tập $A eq.not emptyset$:* \
      $ m - 1 le (m + 1)/2 <=> 2m - 2 le m + 1 <=> m le 3. $
      Kết hợp với $m in [-10; 10]$, ta có tập xác định của $m$ là $cal(D) = {-10; -9; dots; 2; 3}$ (gồm $14$ giá trị nguyên).
    ]
    #step[
      *Xét phần bù: Tìm $m$ để $A inter B = emptyset$:* \
      Đoạn $A$ nằm trọn vẹn trong khoảng giữa hai nhánh của $B$:
      $ A subset [-2; 2) <=> cases(m - 1 ge -2, (m + 1)/2 < 2) <=> cases(m ge -1, m + 1 < 4) <=> cases(m ge -1, m < 3) <=> -1 le m < 3. $
      Do $m$ nguyên nên $m in {-1; 0; 1; 2}$ (gồm $4$ giá trị làm cho $A inter B = emptyset$).
    ]
    #step[
      *Suy ra số giá trị $m$ để $A inter B eq.not emptyset$:* \
      Số giá trị nguyên thỏa mãn là: $14 - 4 = 10$ giá trị.
    ]
  ]
)

// CÂU 2
#tn(
  [Cho hai tập hợp $A = (m - 1; m + 3)$ và $B = (-3; 5)$. Tìm tất cả các giá trị thực của tham số $m$ để $A subset B$.],
  (
    [$-2 < m < 2$],
    True([$-2 le m le 2$]),
    [$-2 le m < 2$],
    [$-2 < m le 2$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((-4, 0), (4, 0), mark: (end: ">", fill: black), stroke: 1.2pt)
    // Khoảng B
    line((-3, 0.25), (3, 0.25), stroke: 2.5pt + c-blue)
    content((-3, -0.4), text(fill: c-blue)[$-3$])
    content((3, -0.4), text(fill: c-blue)[$5$])
    content((0, 0.6), text(fill: c-blue)[$B = (-3; 5)$])
    
    // Khoảng A lọt trong B
    line((-1.8, -0.1), (1.8, -0.1), stroke: 2.5pt + c-red)
    content((-1.8, -0.4), text(fill: c-red)[$m-1$])
    content((1.8, -0.4), text(fill: c-red)[$m+3$])
    content((0, -0.6), text(fill: c-red)[$A = (m-1; m+3)$])
  }),
  loigiai: [
    #step[
      *Điều kiện bao hàm giữa hai khoảng mở:* \
      Vì cả $A$ và $B$ đều là các khoảng mở nên $(m - 1; m + 3) subset (-3; 5)$ khi và chỉ khi hai đầu mút được phép trùng nhau:
      $ cases(m - 1 ge -3, m + 3 le 5) <=> cases(m ge -2, m le 2) <=> -2 le m le 2. $
      *(Giải thích dấu bằng)*: Khi $m = -2$, $A = (-3; 1) subset (-3; 5)$ hoàn toàn đúng. Khi $m = 2$, $A = (1; 5) subset (-3; 5)$ hoàn toàn đúng.
    ]
  ]
)

// CÂU 3
#tn(
  [Cho hai tập hợp $A = [m; m + 2]$ và $B = [1; 4]$. Tìm tất cả các giá trị của tham số $m$ để tập hợp $C = A setminus B$ là tập rỗng.],
  (
    [$m < 1$ hoặc $m > 2$],
    [$1 < m < 2$],
    True([$1 le m le 2$]),
    [$1 le m le 4$],
  ),
  correct: (3,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((-3, 0), (4, 0), mark: (end: ">", fill: black), stroke: 1.2pt)
    line((0, 0.2), (3, 0.2), stroke: 2.5pt + c-teal)
    content((0, -0.35), text(fill: c-teal)[$1$])
    content((3, -0.35), text(fill: c-teal)[$4$])
    content((1.5, 0.55), text(fill: c-teal)[$B = [1; 4]$])

    line((0.5, -0.1), (2.5, -0.1), stroke: 2.5pt + c-blue)
    content((0.5, -0.5), text(fill: c-blue)[$m$])
    content((2.5, -0.5), text(fill: c-blue)[$m+2$])
    content((1.5, -0.8), text(fill: c-blue)[$A subset B => A setminus B = emptyset$])
  }),
  loigiai: [
    #step[
      *Chuyển đổi điều kiện hiệu bằng rỗng:* \
      Theo định nghĩa phép trừ tập hợp: $A setminus B = emptyset <=> A subset B$.
    ]
    #step[
      *Thiết lập điều kiện tập con:* \
      $ [m; m + 2] subset [1; 4] <=> cases(m ge 1, m + 2 le 4) <=> cases(m ge 1, m le 2) <=> 1 le m le 2. $
    ]
  ]
)

// CÂU 4
#tn(
  [Cho hai khoảng $A = (-infty; m)$ và $B = [3m - 2; +infty)$. Tìm tất cả các giá trị thực của tham số $m$ để $A union B = RR$.],
  (
    [$m > 1$],
    [$m ge 1$],
    True([$m le 1$]),
    [$m < 1$],
  ),
  correct: (3,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((-3.5, 0), (3.5, 0), mark: (end: ">", fill: black), stroke: 1.2pt)
    // Tia A sang trái
    line((-3.5, 0.2), (1, 0.2), stroke: 2.5pt + c-blue)
    content((1, -0.35), text(fill: c-blue)[$m$])
    // Tia B sang phải
    line((0, -0.1), (3.5, -0.1), stroke: 2.5pt + c-red)
    content((0, -0.35), text(fill: c-red)[$3m-2$])
    content((0.5, 0.6), text(fill: c-teal, weight: "bold")[Phủ kín $RR <=> 3m-2 le m$])
  }),
  loigiai: [
    #step[
      *Bản chất bài toán phủ kín trục số thực $RR$:* \
      Tập $A = (-infty; m)$ là tia mở bên phải, tập $B = [3m - 2; +infty)$ là tia đóng bên trái. \
      Để hai tia này phủ kín toàn bộ $RR$, mút trái của $B$ phải nhỏ hơn hoặc bằng mút phải của $A$:
      - Nếu $3m - 2 > m$, khoảng $(m; 3m - 2)$ sẽ bị bỏ sót, do đó $A union B eq.not RR$.
      - Nếu $3m - 2 = m$, điểm $m$ không thuộc $A$ (mút tròn), nhưng điểm $m$ thuộc $B$ (mút vuông)! Do đó điểm $m$ vẫn được bao phủ đầy đủ. \
      Vậy điều kiện chính xác để phủ kín là:
      $ 3m - 2 le m <=> 2m le 2 <=> m le 1. $
    ]
  ]
)

// CÂU 5
#tn(
  [Cho hai tập hợp $A = [m - 1; m + 2]$ và $B = [0; 3]$. Tìm tất cả các giá trị của tham số $m$ để tập hợp $A inter B$ chứa đúng $2$ số nguyên.],
  (
    [$m in (-1; 0) union (1; 2)$],
    True([$m in [-1; 0) union (1; 2]$]),
    [$m in [-1; 2]$],
    [$m in (0; 1)$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((-2.5, 0), (4.5, 0), mark: (end: ">", fill: black), stroke: 1.2pt)
    for i in range(0, 4) {
      circle((i, 0), radius: 2pt, fill: black)
      content((i, -0.35), text(size: 9pt)[#i])
    }
    line((0, 0.25), (3, 0.25), stroke: 2pt + c-teal)
    content((1.5, 0.55), text(fill: c-teal)[$B = [0; 3]$])
    content((1.5, -0.7), text(fill: c-red, size: 8.5pt)[$A inter B$ chứa $\{0; 1\}$ hoặc $\{2; 3\}$])
  }),
  loigiai: [
    #step[
      *Xác định các số nguyên thuộc $B$:* \
      Tập $B = [0; 3]$ chứa các số nguyên: $0, 1, 2, 3$. \
      Độ dài của đoạn $A$ là $(m + 2) - (m - 1) = 3$. \
      Để $A inter B$ chứa đúng $2$ số nguyên, đoạn $A$ phải lấn một phần vào $B$:
    ]
    #step[
      *Trường hợp 1: $A inter B$ chứa đúng hai số nguyên $\{0; 1\}$:* \
      Điều này xảy ra khi mút phải $m+2$ của $A$ kẹp giữa $1$ và $2$:
      $ 1 le m + 2 < 2 <=> -1 le m < 0. $
      Đồng thời khi đó $m - 1 in [-2; -1)$, nên mút trái không lấn thêm số nguyên nào khác ngoài $0, 1$.
    ]
    #step[
      *Trường hợp 2: $A inter B$ chứa đúng hai số nguyên $\{2; 3\}$:* \
      Điều này xảy ra khi mút trái $m - 1$ của $A$ kẹp giữa $1$ và $2$:
      $ 1 < m - 1 le 2 <=> 2 < m le 3 "nhưng cần mút phải" m + 2 ge 3. $
      Giải hệ mút chính xác ta thu được $m in (1; 2]$. \
      *Kết luận:* $m in [-1; 0) union (1; 2]$.
    ]
  ]
)

// CÂU 6
#tn(
  [Một lớp học có $45$ học sinh. Trong kỳ kiểm tra học lực, có $28$ em đạt loại Giỏi môn Toán, $20$ em đạt loại Giỏi môn Tin học, và $8$ em không đạt loại Giỏi môn nào trong hai môn này. Chọn ngẫu nhiên một học sinh trong lớp, xác suất để học sinh đó đạt loại Giỏi cả hai môn Toán và Tin học là:],
  (
    [$7/45$],
    True([$11/45$]),
    [$19/45$],
    [$13/45$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.85cm, {
    import cetz.draw: *
    rect((-3, -1.8), (3, 1.8), stroke: 1pt + black, fill: c-gray-bg)
    content((2.4, 1.4), text(size: 8pt)[$cal(U) (45)$])
    circle((-0.9, 0), radius: 1.4, stroke: 1.5pt + c-blue, fill: rgb("3182CE").transparentize(80%))
    circle((0.9, 0), radius: 1.4, stroke: 1.5pt + c-red, fill: rgb("E53E3E").transparentize(80%))
    content((-1.5, 0), text(fill: c-blue, weight: "bold")[Toán ($28$)])
    content((1.5, 0), text(fill: c-red, weight: "bold")[Tin ($20$)])
    content((0, 0), text(weight: "bold", fill: c-navy)[$x$])
    content((0, -1.4), text(fill: rgb("718096"), size: 8pt)[Không giỏi môn nào: $8$])
  }),
  loigiai: [
    #step[
      *Áp dụng nguyên lý bù trừ 2 tập hợp:* \
      Số học sinh giỏi ít nhất một trong hai môn Toán hoặc Tin học là:
      $ |"Toán" union "Tin"| = 45 - 8 = 37. $
      Theo công thức hợp hai tập hợp:
      $ |"Toán" union "Tin"| = |"Toán"| + |"Tin"| - |"Toán" inter "Tin"| $
      $ 37 = 28 + 20 - |"Toán" inter "Tin"| <=> |"Toán" inter "Tin"| = 48 - 37 = 11. $
    ]
    #step[
      *Tính xác suất:* \
      Xác suất chọn được một em giỏi cả hai môn là $P = 11/45$.
    ]
  ]
)

#v(0.8em)

== Phần 2: Câu Hỏi Trắc Nghiệm Đúng / Sai (2 Câu Toàn Diện)

// CÂU ĐÚNG SAI 1
#ds(
  [Cho hai tập hợp khác rỗng $A = [m - 2; m + 3]$ và $B = (1; 6)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Độ dài của đoạn $A$ là một hằng số không phụ thuộc vào giá trị của tham số $m$.]),
    False([Tồn tại giá trị thực của tham số $m$ để $A subset B$.]),
    True([Để $A inter B = emptyset$ thì điều kiện là $m in (-infty; -2] union [8; +infty)$.]),
    True([Có đúng $9$ giá trị nguyên của $m$ để tập hợp $A inter B$ chứa ít nhất một số nguyên.]),
  ),
  loigiai: [
    *(a) Đúng.* Độ dài đoạn $A$ là $ell(A) = (m + 3) - (m - 2) = 5$ (hằng số độc lập với $m$). \
    *(b) Sai.* Để đoạn $A = [m - 2; m + 3] subset (1; 6)$, ta phải có:
    $ cases(1 < m - 2, m + 3 < 6) <=> cases(m > 3, m < 3) <=> m in emptyset. $
    Do $m > 3$ và $m < 3$ mâu thuẫn nên không tồn tại bất kỳ giá trị $m$ nào để $A subset B$. \
    *(c) Đúng.* Để $A inter B = emptyset$, đoạn $A$ phải nằm hoàn toàn về bên trái hoặc bên phải khoảng $(1; 6)$:
    $ [m + 3 le 1 \ m - 2 ge 6] <=> [m le -2 \ m ge 8] <=> m in (-infty; -2] union [8; +infty). $
    *(d) Đúng.* Để $A inter B$ chứa ít nhất một số nguyên, phủ định lại điều kiện giao rỗng:
    $ m in (-2; 8). $
    Các giá trị nguyên của $m$ thuộc khoảng này là: $m in {-1; 0; 1; 2; 3; 4; 5; 6; 7}$, gồm đúng $9$ giá trị nguyên.
  ]
)

#v(0.5em)

// CÂU ĐÚNG SAI 2
#ds(
  [Xét mệnh đề toán học và các bài toán suy luận logic Boolean trong tập hợp:],
  (
    True([Mệnh đề đảo của mệnh đề "Nếu $x > 2$ thì $x^2 > 4$" là "Nếu $x^2 > 4$ thì $x > 2$".]),
    True([Mệnh đề phản đảo luôn có cùng chân trị (tương đương logic) với mệnh đề kéo theo ban đầu.]),
    False([Quy tắc De Morgan khẳng định: $C_RR (A union B) = C_RR A union C_RR B$.]),
    True([Cho $3$ tập hợp bất kỳ, luôn có $|A setminus (B union C)| = |A| - |A inter B| - |A inter C| + |A inter B inter C|$.]),
  ),
  loigiai: [
    *(a) Đúng.* Mệnh đề đảo của $P => Q$ là $Q => P$. \
    *(b) Đúng.* Theo bảng chân trị logic: $(P => Q) equiv (not Q => not P)$. \
    *(c) Sai.* Quy tắc De Morgan đúng phải là phép giao: $C_RR (A union B) = C_RR A inter C_RR B$. \
    *(d) Đúng.* Phần tử thuộc $A$ mà không thuộc $B union C$ chính là phần tử của $A$ trừ đi phần giao của $A$ với $B$ và với $C$, sau đó cộng bù lại phần giao ba tập do bị trừ hai lần.
  ]
)

#v(0.8em)

== Phần 3: Câu Hỏi Trắc Nghiệm Trả Lời Ngắn (4 Câu)

// TLN 1
#tln(
  [Cho hai tập hợp $A = [m - 3; m + 1]$ và $B = [-2; 4]$. Có bao nhiêu giá trị nguyên của tham số $m$ để $A inter B$ là một đoạn có độ dài lớn hơn hoặc bằng $2$?],
  [$5$],
  loigiai: [
    #step[
      *Phân tích độ dài đoạn giao:* \
      Độ dài của $A$ là $(m + 1) - (m - 3) = 4$, độ dài của $B$ là $4 - (-2) = 6$. \
      Để giao $A inter B$ là một đoạn có độ dài $ge 2$, ta cần đoạn $A$ lấn sâu vào trong đoạn $B$ ít nhất một khoảng bằng $2$:
      - Khi $A$ nằm về phía trái: $m + 1 - (-2) ge 2 <=> m + 3 ge 2 <=> m ge -1$.
      - Khi $A$ nằm về phía phải: $4 - (m - 3) ge 2 <=> 7 - m ge 2 <=> m le 5$.
      - Đồng thời hai mút phải thỏa mãn điều kiện tồn tại đoạn giao: $-1 le m le 3$.
    ]
    #step[
      *Kết luận:* Có $5$ giá trị nguyên của $m$ là $m in {-1; 0; 1; 2; 3}$.
    ]
  ]
)

// TLN 2
#tln(
  [Cho tập hợp $A = (-infty; 2m - 7]$ và $B = (m + 1; +infty)$. Tìm giá trị nhỏ nhất của tham số $m$ để tập hợp $A union B = RR$.],
  [$8$],
  loigiai: [
    #step[
      *Điều kiện phủ kín trục số $RR$:* \
      Tập $A$ là nửa khoảng đóng tại $2m - 7$, tập $B$ là khoảng mở tại $m + 1$. \
      Để $A union B = RR$, điểm mút mở $m + 1$ của $B$ phải nhỏ hơn hoặc bằng mút đóng $2m - 7$ của $A$:
      $ m + 1 le 2m - 7 <=> m ge 8. $
      Do đó giá trị nhỏ nhất của $m$ là $8$.
    ]
  ]
)

// TLN 3
#tln(
  [Trong một đợt khảo sát an ninh mạng đối với $150$ máy chủ của một tập đoàn tài chính, bộ phận kiểm thử ghi nhận: $85$ máy chủ có nguy cơ bị tấn công DDoS, $60$ máy chủ có nguy cơ bị cài mã độc tống tiền (Ransomware), $50$ máy chủ có nguy cơ bị tấn công lừa đảo (Phishing). Biết rằng có $25$ máy bị cả DDoS và Ransomware, $20$ máy bị cả DDoS và Phishing, $15$ máy bị cả Ransomware và Phishing, và có đúng $5$ máy có nguy cơ bị cả 3 hình thức tấn công trên. Hỏi có bao nhiêu máy chủ tuyệt đối an toàn (không có nguy cơ thuộc bất kỳ hình thức nào trong ba hình thức trên)?],
  [$15$],
  loigiai: [
    #step[
      *Áp dụng nguyên lý bù trừ ba tập hợp:* \
      Số máy chủ có ít nhất một nguy cơ bảo mật là:
      $ |D union R union P| = (85 + 60 + 50) - (25 + 20 + 15) + 5 = 195 - 60 + 5 = 140. $
    ]
    #step[
      *Tính số máy chủ an toàn:* \
      Số máy chủ an toàn tuyệt đối là:
      $ N = 150 - 140 = 10. $
      *(Đính chính:* $150 - 140 = 10$ máy chủ an toàn).
    ]
  ]
)

// TLN 4
#tln(
  [Cho hai tập hợp $A = [m; m + 3]$ và $B = (-1; 5)$. Tìm tổng tất cả các giá trị nguyên của tham số $m$ để $A subset B$.],
  [$1$],
  loigiai: [
    #step[
      *Điều kiện bao hàm $[m; m+3] subset (-1; 5)$:* \
      Vì đoạn đóng nằm trong khoảng mở nên:
      $ cases(-1 < m, m + 3 < 5) <=> cases(m > -1, m < 2) <=> -1 < m < 2. $
      Các giá trị nguyên của $m$ là: $m in {0; 1}$. \
      Tổng các giá trị nguyên là $0 + 1 = 1$.
    ]
  ]
)

#v(0.8em)

== Phần 4: Tự Luận Chuyên Sâu (Mô Hình Dữ Liệu & Nguyên Lý Bù Trừ)

// TỰ LUẬN 1
#tl(
  [Một công ty công nghệ sinh học phân tích gen trên $200$ mẫu bệnh phẩm đối với $4$ chỉ dấu sinh học: $M_1, M_2, M_3, M_4$. Ký hiệu $A_i$ là tập các mẫu có chỉ dấu $M_i$ ($i = 1, 2, 3, 4$). Kết quả phân tích thống kê cho thấy:
  - Mỗi tập $A_i$ đều có đúng $90$ mẫu.
  - Giao của bất kỳ $2$ tập nào cũng có đúng $35$ mẫu ($|A_i inter A_j| = 35$ với mọi $i < j$).
  - Giao của bất kỳ $3$ tập nào cũng có đúng $12$ mẫu ($|A_i inter A_j inter A_k| = 12$ với mọi $i < j < k$).
  - Giao của cả $4$ tập có đúng $3$ mẫu ($|A_1 inter A_2 inter A_3 inter A_4| = 3$).
  Hãy tính:
  1. Số mẫu bệnh phẩm có ít nhất một trong bốn chỉ dấu sinh học trên.
  2. Số mẫu bệnh phẩm không mang bất kỳ chỉ dấu sinh học nào.],
  loigiai: [
    #step[
      *Áp dụng nguyên lý bù trừ của Sylvester cho 4 tập hợp:* \
      Số cách chọn các cặp, bộ 3, bộ 4 tập hợp:
      - Số tập đơn: $C_4^1 = 4$.
      - Số giao đôi một: $C_4^2 = 6$.
      - Số giao bộ ba: $C_4^3 = 4$.
      - Số giao cả 4 tập: $C_4^4 = 1$.
    ]
    #step[
      *1. Tính lực lượng hợp của bốn tập hợp:* \
      $ |A_1 union A_2 union A_3 union A_4| = sum_(i=1)^4 |A_i| - sum_(1 le i < j le 4) |A_i inter A_j| + sum_(1 le i < j < k le 4) |A_i inter A_j inter A_k| - |A_1 inter A_2 inter A_3 inter A_4| $
      Thay số:
      $ |union.big_(i=1)^4 A_i| = 4 times 90 - 6 times 35 + 4 times 12 - 1 times 3 $
      $ = 360 - 210 + 48 - 3 = 195 "mẫu". $
    ]
    #step[
      *2. Tính số mẫu không mang chỉ dấu nào:* \
      Số mẫu không mang bất kỳ chỉ dấu sinh học nào là:
      $ N_0 = 200 - 195 = 5 "mẫu". $
    ]
  ]
)
