#import "../sang-exam.typ": *
#import "../template.typ": *
#import "../sang-full.typ": *
#import "@preview/cetz:0.5.2"
#import "@preview/cetz:0.5.2": canvas, draw

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("1A237E"), rgb("283593"), rgb("3F51B5"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("1A237E")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("1A237E"), size: 12pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#let col-blue = rgb("1A237E")
#let col-amber = rgb("E65100")
#let col-green = rgb("2E7D32")
#let col-teal = rgb("006064")
#let col-purple = rgb("4A148C")
#let c-navy = rgb("0D47A1")
#let c-teal = rgb("00695C")
#let c-violet = rgb("4A148C")
#let c-amber = rgb("BF360C")
#let c-green = rgb("1B5E20")

#let eg-box(title: "🎯 Ví dụ minh họa", body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFE0B2")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// ═══════════════════════════════════════════════
// ĐỊNH NGHĨA CÁC HỘP LỜI GIẢI MẪU
// ═══════════════════════════════════════════════
#let cach-box(title: "Hướng giải", color: col-blue, icon: "🔵", body) = block(
  fill: color.lighten(94%),
  stroke: (left: 4pt + color, rest: 0.5pt + color.lighten(70%)),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: color, weight: "bold", size: 10.5pt)[#icon #title]
  #v(0.3em)
  #body
]

#let note-box(title: "📌 Nhận Xét Quan Trọng", body) = block(
  fill: rgb("FFF9C4"),
  stroke: (left: 4pt + rgb("FBC02D"), rest: 0.5pt + rgb("FFF59D")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: rgb("FBC02D").darken(20%), weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let cach1-box(body) = block(
  fill: rgb("E8F8F5"),
  stroke: (left: 4pt + rgb("117A65"), rest: 0.8pt + rgb("A2D9CE")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: rgb("117A65"), weight: "bold")[💡 Cách 1: Phân tích Sơ đồ cây / Lời giải Trực quan]
  #v(0.3em)
  #body
]

#let cach2-box(body) = block(
  fill: rgb("EBF5FB"),
  stroke: (left: 4pt + rgb("2E86C1"), rest: 0.8pt + rgb("AED6F1")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: rgb("2E86C1"), weight: "bold")[⚡ Cách 2: Thiết lập phương trình / Giải tích / Công thức tổng quát]
  #v(0.3em)
  #body
]

#let ans-box(body) = block(
  fill: rgb("F4ECF7"),
  stroke: (left: 4pt + rgb("8E44AD"), rest: 0.8pt + rgb("D7BDE2")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: rgb("8E44AD"), weight: "bold")[🏁 Đáp số & Mệnh đề đúng/sai]
  #v(0.3em)
  #body
]

#let loigiai-box(body) = block(
  fill: rgb("F8F9F9"),
  stroke: (left: 4pt + rgb("7F8C8D"), rest: 0.8pt + rgb("D5DBDB")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: rgb("7F8C8D"), weight: "bold")[📝 Lời giải chi tiết]
  #v(0.3em)
  #body
]

#let theory-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + c-navy, rest: 0.8pt + rgb("90CAF9")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

#let insight-box(title: "💡 Trực Giác Sư Phạm", body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + c-teal, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-teal, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let key-box(body) = block(
  fill: rgb("F3E5F5"),
  stroke: (left: 4pt + c-violet, rest: 0.6pt + rgb("CE93D8")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-violet, weight: "bold")[🔑 Nguyên Lý Then Chốt]
  #v(0.3em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FBE9E7"),
  stroke: (left: 4pt + c-amber, rest: 0.6pt + rgb("FFAB91")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: c-amber, weight: "bold")[⚠️ Lỗi Sai Thường Gặp]
  #v(0.3em)
  #body
]

#let compare-box(title: "🔍 Phân Tích So Sánh", body) = block(
  fill: rgb("F7F9FA"),
  stroke: (left: 4pt + rgb("006064"), rest: 0.6pt + rgb("B2EBF2")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("006064"), weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let example-box(n: "", body) = block(
  fill: rgb("F1F8E9"),
  stroke: (left: 4pt + c-green, rest: 0.6pt + rgb("C5E1A5")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[🎯 Ví dụ #n]
  #v(0.3em)
  #body
]

#let activity-box(title: "🎓 Hoạt Động Lớp Học", body) = block(
  fill: rgb("E8F8F5"),
  stroke: (left: 4pt + rgb("117A65"), rest: 0.8pt + rgb("A2D9CE")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: rgb("117A65"), weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let qopen(body) = block(
  fill: rgb("F7F9FA"),
  stroke: 0.5pt + rgb("CFD8DC"),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[#body]

#let step-box(n, title, body) = block(
  fill: rgb("EBF5FB"),
  stroke: (left: 4pt + rgb("2E86C1"), rest: 0.5pt + rgb("AED6F1")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: rgb("2E86C1"), weight: "bold")[Bước #n: #title]
  #v(0.3em)
  #body
]

#let crime-gold = rgb("D4AC0D")
#let verdict-box(body) = block(
  fill: rgb("FFFDE7"),
  stroke: (left: 4pt + crime-gold, rest: 0.5pt + rgb("F9E79F")),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: rgb("7D6608"), weight: "bold")[⚖️ Phán Quyết]
  #v(0.3em)
  #body
]

#let fig-shadow = rgb(198, 210, 224, 70)
#let iso-point(p, dx: 0.18, dy: -0.14) = (p.at(0) + dx, p.at(1) + dy)
#let iso-points(pts, dx: 0.18, dy: -0.14) = pts.map(p => iso-point(p, dx: dx, dy: dy))
#let fig-panel(body) = block(
  fill: gradient.linear(rgb("FDFEFE"), rgb("ECF5F8"), angle: 90deg),
  stroke: 0.8pt + rgb("D4E6EC"),
  radius: 10pt,
  inset: (x: 8pt, y: 8pt),
)[#body]

#let method-box(body) = loigiai-box(body)
#let thm-box(title: "📐 Định Lý", body) = theory-box(body)
#let sol-diagram(body) = align(center, body)

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D47A1"), rgb("1565C0"), rgb("1E88E5"), rgb("42A5F5"), angle: 135deg),
    inset: (x: 2cm, y: 1.8cm),
    radius: 14pt,
  )[
    #text(fill: rgb("E3F2FD"), size: 11pt, weight: "bold", tracking: 2pt)[
      BỘ TÀI LIỆU CHUYÊN SÂU HSG & ĐGNL
    ]
    #v(0.6em)
    #text(fill: white, size: 22pt, weight: "black")[Hệ Thống Chuyên Đề & Lời Giải Chi Tiết]
    #v(0.4em)
    #text(fill: rgb("E3F2FD"), size: 14pt)[📚 Tuyển tập các phương pháp giải quyết bài toán nâng cao, thực tế & liên môn]
    #v(0.5em)
    #text(fill: rgb("E3F2FD"), size: 11pt, style: "italic")[
      "Phân tích đa dạng cách giải, ưu tiên trực quan hóa bằng Sơ đồ cây và các phương pháp bản chất"
    ]
  ]
]

#v(1.5em)
#outline(title: "Mục Lục Hệ Thống Chuyên Đề", depth: 2, indent: 1.5em)
#pagebreak()

= NHÓM 1: TỔ HỢP & ĐẾM NÂNG CAO (COMBINATORICS & COUNTING)

== 1. Bài toán Tô màu Bản đồ & Hàng ô vuông (CD-ToMau.typ)
- *Ý tưởng chính:* Phương pháp đếm số cách tô màu các đỉnh của đa giác, các ô vuông liên tiếp sao cho hai ô kề nhau khác màu.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Có bao nhiêu số tự nhiên có $4$ chữ số (khác $0$ ở hàng nghìn), lấy từ tập
    $\{0, 1, 2, 3, 4\}$, sao cho không có hai chữ số liên tiếp nào bằng nhau?

  *Đáp số:* $250$ / $256$ / $320$ / $500$
]

#loigiai-box[
Đây là bài toán hàng thẳng gồm $4$ vị trí.

    - Chữ số hàng nghìn không được bằng $0$, nên có $4$ cách chọn: $1,2,3,4$.
    - Mỗi chữ số phía sau chỉ cần khác chữ số đứng ngay trước nó, nên mỗi vị trí đều có $5-1=4$ cách.

    Vì vậy
    $N = 4 dot 4 dot 4 dot 4 = 4^4 = 256.$

    Vậy có $256$ số thỏa mãn.
]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Lập mật khẩu gồm $5$ ký tự từ bảng chữ $\{a, b, c, d, e, f\}$ ($6$ ký tự).
    Hai ký tự liên tiếp không được trùng nhau. Số mật khẩu hợp lệ là:

  *Đáp số:* $5^5 = 3125$ / $6 dot 5^3 = 750$ / $6 dot 5^4 = 3750$ / $6^5 = 7776$
]

#loigiai-box[
Mật khẩu gồm $5$ ký tự xếp theo hàng thẳng, với $6$ lựa chọn cho mỗi vị trí ban đầu.

    - Ký tự thứ nhất chọn tự do nên có $6$ cách.
    - Từ ký tự thứ hai trở đi, mỗi ký tự chỉ bị cấm trùng với ký tự đứng trước, nên còn $5$ cách.

    Do đó
    $N = 6 dot 5^4 = 6 dot 625 = 3750.$

    Vậy số mật khẩu hợp lệ là $3750$.
]


== 2. Các kỹ thuật đếm nâng cao và truy hồi (CD-Đếm Nâng Cao.typ)
- *Ý tưởng chính:* Các bài toán đếm mức độ vận dụng cao sử dụng hệ thức truy hồi tuyến tính.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Cho tập $X = {1; 2; dots; 14}$ và 7 ô tròn $a, b, c, d, e, f, g$ được bố trí như hình vẽ bên dưới. Mỗi ô tròn nhỏ chỉ xếp được đúng một số từ $X$. Biết rằng có tất cả $T$ cách chọn ra $7$ số khác nhau từ tập $X$ để xếp vào 7 ô tròn, sao cho có ít nhất một hàng được sắp xếp theo chiều tăng dần hoặc giảm dần. Hãy xác định ba chữ số có nghĩa đầu tiên của $T$?

  *Đáp số:* $113$
]

#ppgiai[
      - Vì các ô tròn được đặt tên phân biệt ($a, b, c, d, e, f, g$) nên đây là bài toán xếp vị trí phân biệt (hoán vị thẳng), không phải hoán vị vòng tròn.
      - Sử dụng phương pháp đếm phần bù: $T = ("Số cách chọn 7 số") times ("Số cách xếp thỏa mãn")$.
      - Số cách xếp thỏa mãn = Tổng số cách xếp (là $7!$) trừ đi số cách xếp "lệch" (KHÔNG có hàng nào tăng dần hay giảm dần).
      - Một hàng chứa 3 phần tử $(X, g, Y)$ không tăng/giảm dần khi và chỉ khi phần tử ở tâm ($g$) lớn hơn cả 2 phần tử ở hai đầu hoặc nhỏ hơn cả 2 phần tử ở hai đầu.
    ]


== 3. Kỹ thuật đếm FSM trên bảng lưới vuông N x N (Đếm-FSM-NxN.typ)
- *Ý tưởng chính:* Đếm số cách sắp xếp các đối tượng trên lưới tọa độ vuông thỏa mãn điều kiện biên bằng FSM.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Người ta trang trí một bảng ô vuông $5 times 5$ bằng các *Ngôi sao* và *Bông hoa* $(*)$ giống nhau. Mỗi ô vuông nhỏ được dán một đối tượng sao cho trong mỗi hàng và mỗi cột của bảng đó đều có đúng *2 Ngôi sao* (và $3$ Bông hoa). Có tất cả bao nhiêu cách trang trí bảng lưới này?

  *Đáp số:* $2040$
]

#ppgiai[
      - Bài toán tương đương với việc đếm số ma trận nhị phân kích thước $n times n$ (với $n=5$), trong đó các phần tử là $1$ (Ngôi sao) và $0$ (Bông hoa), sao cho tổng các phần tử trên mỗi hàng và mỗi cột đều bằng $2$.
      - Gọi $A_n$ là số ma trận thỏa mãn. Ta xét cách xếp ở dòng cuối cùng (dòng thứ $n$):
        + Có $C_n^2$ cách chọn 2 vị trí điền số $1$ ở dòng $n$ (giả sử ở cột $i$ và cột $j$).
        + Ở cột $i$ và cột $j$ còn thiếu đúng một số $1$ nữa. Ta chia làm 2 trường hợp:\
          *Trường hợp 1:* Số $1$ còn thiếu của cột $i$ và cột $j$ cùng nằm trên một dòng $k$ nào đó ($k < n$). Có $n-1$ cách chọn dòng $k$. Xóa dòng $n$, dòng $k$ và cột $i$, cột $j$, ta được ma trận cấp $(n-2)$ thỏa mãn yêu cầu $=> (n-1)A_(n-2)$ cách.\
          *Trường hợp 2:* Số $1$ còn thiếu của cột $i$ và cột $j$ nằm ở hai dòng khác nhau. Ta có thể "chập" cột $i$ và cột $j$ thành một cột mới cần hai số $1$, khi đó bài toán đưa về ma trận cấp $n-1$. Với mỗi cấu hình của ma trận cấp $n-1$, ta có $2$ cách tách ngược lại ra cột $i$ và cột $j$ $=> 2A_(n-1)$ cách.
      - Ta có công thức truy hồi: $A_n = C_n^2 (2A_(n-1) + (n-1)A_(n-2))$.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trong công viên, vòng đu quay (Ferris wheel) là đường tròn $(T)$ trong không gian $O x y z$ (mặt đất là mặt phẳng $O x y$). Ba cabin ở vị trí $M(20 ; 10 ; 5)$, $N(35 ; 25 ; 20)$, $P(5 ; 55 ; 20)$. Vòng quay giữ cố định mặt phẳng quỹ đạo. Tính khoảng cách từ điểm cao nhất của đu quay xuống mặt đất (làm tròn đến 1 chữ số thập phân).

  *Đáp số:* $26,9$
]

#ppgiai[
      - Mặt đất là mặt phẳng $(O x y)$ có phương trình $z = 0$. Khoảng cách từ một điểm $A(x_A; y_A; z_A)$ đến mặt đất chính là trị tuyệt đối cao độ $|z_A|$.
      - Vòng đu quay là đường tròn $(T)$ đi qua 3 điểm $M, N, P$. Viết phương trình mặt phẳng $(M N P)$, sau đó tìm tâm $I$ và bán kính $R$ của đường tròn $(T)$.
      - Góc nghiêng của mặt phẳng $(M N P)$ so với mặt đất nằm ngang là $gamma$. Độ chênh lệch cao độ lớn nhất từ tâm $I$ đến các điểm trên đường biên là $Delta z = R sin gamma$.
      - Khi đó, các điểm đặc biệt có cao độ:
        + Điểm cao nhất: $z_"max" = z_I + Delta z$.
        + Điểm thấp nhất: $z_"min" = z_I - Delta z$.
    ]


== 4. Tổ hợp và Hình học trên Đa giác đều (Da-Giac-Deu.typ)
- *Ý tưởng chính:* Tính toán số tam giác, hình chữ nhật, đa giác con tạo bởi các đỉnh của đa giác đều.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Cho đa giác đều $(H)$ có $18$ đỉnh nội tiếp trong một đường tròn. Chọn ngẫu nhiên $3$ đỉnh của $(H)$ để tạo thành một tam giác. Gọi $P$ là xác suất để tam giác được tạo thành là tam giác nhọn. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).

  *Đáp số:* $206$
]

#ppgiai[
      - Tính không gian mẫu: Chọn $3$ đỉnh bất kỳ.
      - Đếm số tam giác vuông ($n$ chẵn).
      - Đếm số tam giác tù (Chọn $1$ đỉnh lớn nhất, $2$ đỉnh còn lại cùng một phía).
      - Số tam giác nhọn = Tổng số tam giác - Số TG vuông - Số TG tù.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Cho đa giác đều $(H)$ có $20$ đỉnh nội tiếp đường tròn. Chọn ngẫu nhiên $4$ đỉnh của $(H)$ để tạo thành một tứ giác. Gọi $P$ là xác suất để tứ giác đó là hình chữ nhật nhưng không phải là hình vuông. Hãy tính $1000P$ (làm tròn kết quả đến hàng đơn vị).

  *Đáp số:* $8$
]

#ppgiai[
      - Tính không gian mẫu: Số cách chọn $4$ đỉnh bất kỳ tạo thành tứ giác.
      - Đếm tổng số hình chữ nhật được tạo thành (chọn $2$ đường kính).
      - Đếm số hình vuông được tạo thành.
      - Lấy số hình chữ nhật trừ đi số hình vuông.
    ]


== 5. Xây dựng Máy trạng thái hữu hạn FSM trong bài toán đếm (FSM.typ)
- *Ý tưởng chính:* Chi tiết cách thiết lập các trạng thái và lập công thức truy hồi đếm chuỗi bằng FSM.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một dải đèn LED trang trí được cấu tạo từ $n$ bóng đèn xếp thành một hàng ngang. Mỗi bóng đèn có thể phát ra một trong $3$ màu: Đỏ (Đ), Xanh lá (X), Xanh dương (B). Để dải đèn đạt được hiệu ứng thị giác theo thiết kế của kỹ sư, hệ thống được lập trình với các quy tắc sau:
  1. Hai bóng kề nhau không được phát cùng một màu (quy tắc chống nháy liên tục).
  2. Nếu một bóng phát màu Đỏ (Đ), thì bóng ngay phía sau nó (bên phải) bắt buộc phải phát màu Xanh lá (X). Nghĩa là, cấm sự xuất hiện của bóng Xanh dương (B) ngay sau bóng Đỏ.
  
  Hãy vẽ sơ đồ trạng thái mô tả hệ thống, lập hệ thức truy hồi và tính số dải màu khác nhau có thể tạo ra khi dải có $6$ bóng đèn ($n=6$).

  *Đáp số:* Đỏ (Đ)
]

#ppgiai[
      Ta mô hình hóa dải màu bằng cách coi mỗi bóng đèn thứ $i$ là một "bước", và màu của nó là một "trạng thái".
      - *Trạng thái:* Có 3 trạng thái tương ứng với màu của bóng đèn: Đỏ (Đ), Xanh lá (X), Xanh dương (B).
      - *Quy tắc chuyển trạng thái:*
        + Từ Đỏ (Đ): Theo quy tắc 2, chỉ có thể chuyển sang Xanh lá (X).
        + Từ Xanh lá (X): Theo quy tắc 1, có thể chuyển sang Đỏ (Đ) hoặc Xanh dương (B).
        + Từ Xanh dương (B): Theo quy tắc 1, có thể chuyển sang Đỏ (Đ) hoặc Xanh lá (X).
    ]


== 6. Đại số Tổ hợp & Quy tắc đếm cơ bản (CD-DaiSo-ToHop-content.typ)
- *Ý tưởng chính:* Tổng hợp kiến thức về nguyên lý cộng, nguyên lý nhân, hoán vị, chỉnh hợp, tổ hợp và phương pháp phân nhóm.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Bạn Nam muốn đi từ thành phố A đến thành phố C qua thành phố B. Biết rằng từ A đến B có 3 con đường khác nhau, và từ B đến C có 4 con đường khác nhau. Hỏi Nam có bao nhiêu cách chọn lộ trình đi từ A đến C?

  *Đáp số:* 12
]

#ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Từ các chữ số $\{1, 2, 3, 4, 5\}$, lập được bao nhiêu số tự nhiên có 3 chữ số đôi một khác nhau?

  *Đáp số:* 60
]

#ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]


== 7. Đếm Tổ hợp bằng Máy trạng thái hữu hạn (FSM) (CD-FSM-Dem-To-Hop.typ)
- *Ý tưởng chính:* Ứng dụng Máy trạng thái hữu hạn để đếm số chuỗi ký tự, chuỗi nhị phân có ràng buộc phức tạp.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một dải gồm $6$ bóng đèn LED xếp thành hàng ngang. Mỗi bóng có thể phát một trong ba màu: Đỏ (Đ), Xanh lá (X), Xanh dương (B). Các quy tắc:
  1. Hai bóng kề nhau không được cùng màu.
  2. Sau bóng Đỏ, bóng tiếp theo *bắt buộc* là Xanh lá (không được là Xanh dương).
  
  Tính số dải màu hợp lệ khi $n = 6$.

  *Đáp số:* Đ
]

#reset-step()

#step[
      *Xác định trạng thái và bước chuyển:*
      - Từ *Đ*: chỉ → X (quy tắc 2)
      - Từ *X*: → Đ hoặc B (quy tắc 1)
      - Từ *B*: → Đ hoặc X (quy tắc 1)
    ]

#step[
      *Hệ thức truy hồi* ($D_n$, $X_n$, $B_n$ = số dải kết thúc bằng Đ, X, B):
      $ D_n = X_(n-1) + B_(n-1), quad X_n = D_(n-1) + B_(n-1), quad B_n = X_(n-1) $
      Khởi tạo: $D_1 = X_1 = B_1 = 1$.
    ]

#step[
      *Bảng truy hồi:*
      #align(center)[
        #table(
          columns: 5, align: center, stroke: 0.5pt + black,
          [*$n$*],[*$D_n$*],[*$X_n$*],[*$B_n$*],[*$S_n$*],
          [1],[1],[1],[1],[3],
          [2],[2],[2],[1],[5],
          [3],[3],[3],[2],[8],
          [4],[5],[5],[3],[13],
          [5],[8],[8],[5],[21],
          [6],[13],[13],[8],[*34*],
        )
      ]
      Vậy số dải hợp lệ là $S_6 = rect(34)$.
    ]

#reset-step()

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Tô màu $7$ ô vuông xếp thành hàng ngang bằng $4$ màu: Đỏ (Đ), Xanh (X), Vàng (V), Tím (T). Hai ô kề nhau không được trùng màu, đồng thời màu Đỏ và màu Tím không được đứng kề nhau (dù theo thứ tự nào). Tính số cách tô màu hợp lệ.

  *Đáp số:* Đ
]

#reset-step()

#step[
      *Bước chuyển hợp lệ* (cấm: kề nhau trùng màu, và Đ–T liền kề):
      - Từ Đ: → X, V
      - Từ X: → Đ, V, T
      - Từ V: → Đ, X, T
      - Từ T: → X, V
    ]

#step[
      Gọi $D_n, X_n, V_n, T_n$ là số cách kết thúc bằng Đ, X, V, T ở ô thứ $n$.
      $ D_n = X_(n-1) + V_(n-1) $
      $ X_n = D_(n-1) + V_(n-1) + T_(n-1) $
      $ V_n = D_(n-1) + X_(n-1) + T_(n-1) $
      $ T_n = X_(n-1) + V_(n-1) $
      Khởi tạo: $D_1 = X_1 = V_1 = T_1 = 1$.

      Nhận xét: $D_n = T_n$ với mọi $n$ (đối xứng), và $X_n = V_n$.
    ]

#step[
      *Bảng truy hồi* (dùng ký hiệu tắt $d = D_n = T_n$, $x = X_n = V_n$):
      #align(center)[
        #table(
          columns: 5, align: center, stroke: 0.5pt + black,
          [*$n$*],[*$D_n$*],[*$X_n$*],[*$V_n$*],[*$T_n$*],
          [1],[1],[1],[1],[1],
          [2],[2],[3],[3],[2],
          [3],[5],[7],[7],[5],
          [4],[12],[17],[17],[12],
          [5],[29],[41],[41],[29],
          [6],[70],[99],[99],[70],
          [7],[169],[238],[238],[169],
        )
      ]
      Tổng: $S_7 = 169 + 238 + 238 + 169 = rect(2058)$.  
      *(Kiểm tra nhanh: $S_1=4$, $S_2=10$; bước chuyển mỗi trạng thái có 2 (Đ,T) hoặc 3 (X,V) cạnh ra.)*
    ]

#reset-step()


== 8. Đếm số cách tô màu sử dụng trạng thái FSM (FSM-To-Mau.typ)
- *Ý tưởng chính:* Thiết lập mô hình trạng thái FSM để giải bài toán tô màu các hình phẳng phức tạp.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một dải băng giấy được chia làm $6$ ô vuông liên tiếp từ trái qua phải. Có $4$ loại màu sơn khác nhau. Cần tô màu cho $6$ ô vuông này sao cho hai ô liền kề nhau luôn được sơn khác màu. Hỏi có bao nhiêu cách tô sao cho *ô số 6 CÙNG MÀU với ô số 1*?

  *Đáp số:* $240$
]

#ppgiai[
      - Bài toán có $n=6$ ô và $k=4$ màu.
      - Gọi $S_i$ là số cách tô $i$ ô đầu sao cho ô $i$ *Trùng* màu ô 1.
      - Gọi $D_i$ là số cách tô $i$ ô đầu sao cho ô $i$ *Khác* màu ô 1.
      - Yêu cầu bài toán là tìm số cách sao cho ô 6 Trùng ô 1 $=>$ Cần tính *$S_6$*.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Một mặt dây chuyền hình lục giác đều có $6$ đỉnh (tương ứng với $6$ viên ngọc đính quanh vòng kim loại). Thợ kim hoàn có $4$ loại đá quý với màu sắc khác nhau. Người thợ muốn đính các viên đá này vào $6$ đỉnh sao cho $2$ đỉnh liền kề nhau trên vòng tròn không được đính đá cùng loại. Hỏi có bao nhiêu cách đính đá thỏa mãn yêu cầu? (Coi các đỉnh đã được cố định vị trí, không xét các phép xoay).

  *Đáp số:* $240$ / $972$ / $732$ / $1024$
]

#ppgiai[
      - Vòng tròn khép kín gồm $6$ ô thực chất là một *Dải băng thẳng $6$ ô* bị uốn cong sao cho ô số 6 kết nối lại với ô số 1.
      - Để mối nối này hợp lệ (hai đỉnh kề nhau phải khác màu), ta bắt buộc *ô số 6 phải KHÁC MÀU ô số 1*.
      - Sử dụng lại cấu trúc của Sơ đồ trạng thái FSM ở Mô hình 1. Đại lượng ta cần tìm để vòng khép kín thành công chính là số trạng thái *$D_6$*.
    ]

#meo[Sự liên kết giữa hai bài toán khẳng định: Bất kỳ bài toán tô màu vòng tròn $n$ miền nào bằng $k$ màu cũng có thể giải gọn gàng bằng cách chạy FSM từ $1 -> n$ và lấy giá trị $D_n$ làm kết quả cuối cùng. Máy tính cũng dùng cách tiếp cận ma trận trạng thái này thay cho công thức đa thức sắc số đệ quy phức tạp.]


= NHÓM 2: XÁC SUẤT & MÔ HÌNH PHÂN NHÁNH (PROBABILITY & BRANCHING)

== 1. Bài toán bốc bi & Xác suất có điều kiện (Xác-Suất-Bốc-Bi.typ)
- *Ý tưởng chính:* Các bài toán bốc bi từ nhiều hộp, chuyển bi giữa các hộp và tính xác suất sau khi biết thông tin phụ.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Ban đầu cho hai hộp bi riêng biệt đựng những viên bi có cùng kích thước và cùng khối lượng. Hộp I đựng 4 viên bi màu đỏ, 2 viên bi màu xanh, 1 viên bi vàng còn hộp II đựng 5 viên bi màu đỏ và 2 viên bi màu xanh. Tiến hành lấy ngẫu nhiên hai viên bi ở hộp I bỏ sang hộp II, rồi lấy ngẫu nhiên hai viên bi từ hộp II bỏ về hộp I. Hãy tính xác suất để hộp I vẫn có đủ ba loại bi, nếu biết hai viên bi lấy ra từ hộp II cùng màu (làm tròn kết quả đến hàng phần trăm)?

  *Đáp số:* $0,74$
]

#ppgiai[
      - Sử dụng *Sơ đồ cây* kết hợp với công thức xác suất toàn phần và xác suất điều kiện: $P(F|E) = (P(F cap E))/(P(E))$.
      - Phân tích cẩn thận sự thay đổi số lượng bi ở từng hộp sau Lượt 1. Việc sử dụng sơ đồ cây giúp phân nhánh các trường hợp rõ ràng và tránh nhầm lẫn.
    ]

#meo[
      Sơ đồ cây giúp ta hình thị hóa toàn bộ quá trình biến đổi của không gian mẫu. Đặc biệt, việc nhìn vào sơ đồ cây giúp bạn dễ dàng nhận ra nhánh TH4 và TH5 có $P(F cap E) = 0$ ngay lập tức, tiết kiệm tối đa thời gian suy luận trong phòng thi!
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Ban đầu cho hai hộp bi riêng biệt đựng những viên bi có cùng kích thước và cùng khối lượng. Hộp I đựng 4 viên bi màu đỏ, 2 viên bi màu xanh, 1 viên bi vàng còn hộp II đựng 5 viên bi màu đỏ và 2 viên bi màu xanh. Tiến hành lấy ngẫu nhiên hai viên bi ở hộp I bỏ sang hộp II, rồi lấy ngẫu nhiên hai viên bi từ hộp II bỏ về hộp I. Hãy tính xác suất để hộp I vẫn có đủ ba loại bi, nếu biết hai viên bi lấy ra từ hộp II cùng màu (làm tròn kết quả đến hàng phần trăm)?

  *Đáp số:* $0,74$
]

#ppgiai[
      - Sử dụng *Sơ đồ cây* kết hợp với công thức xác suất toàn phần và xác suất điều kiện: $P(F|E) = (P(F cap E))/(P(E))$.
      - Phân tích sự thay đổi số lượng bi ở từng hộp sau Lượt 1. Việc sử dụng sơ đồ cây giúp phân nhánh các trường hợp rõ ràng và tránh nhầm lẫn.
      - Ứng dụng "Tư duy phá án" để triệt tiêu các nhánh bất khả thi, giúp tăng tốc độ tính toán.
    ]


== 2. Công thức xác suất Bayes và bài toán tìm x (CD-Xac-Suất-Bayes-Tim-x.typ)
- *Ý tưởng chính:* Ứng dụng công thức xác suất đầy đủ và công thức Bayes để tìm các tham số chưa biết trong mô hình.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Ban đầu cho hai hộp bi riêng biệt đựng những viên bi có cùng kích thước và cùng khối lượng. Hộp I đựng $x$ viên bi màu đỏ, $4$ viên bi màu xanh còn hộp II đựng $5$ viên bi màu đỏ và $3$ viên bi màu xanh. Tiến hành lấy ngẫu nhiên ba viên bi ở hộp I và hai viên bi ở hộp II, bỏ vào hộp III (ban đầu không có bi). Từ hộp III lấy ngẫu nhiên ra một viên bi. Biết rằng xác suất để viên bi lấy ra từ hộp III có nguồn gốc từ hộp I, nếu biết nó màu đỏ, không nhỏ hơn $0,6$. Hãy xác định giá trị nguyên nhỏ nhất của $x$?

  *Đáp số:* $7$
]

#ppgiai[
      *Phân tích mạch tư duy:* 1. *Xác định nguồn gốc:* Viên bi rút từ Hộp III chỉ có thể đến từ Hộp I hoặc Hộp II. 
      2. *Tỉ lệ nguồn:* Hộp III chứa tổng cộng $5$ bi ($3$ bi từ Hộp I và $2$ bi từ Hộp II), nên xác suất "nguồn gốc" tương ứng là $3/5$ và $2/5$.
      3. *Tỉ lệ màu sắc:* Áp dụng tính chất bảo toàn tỉ lệ, xác suất rút được bi đỏ nếu biết nó đến từ Hộp I chính bằng tỉ lệ bi đỏ trong Hộp I ban đầu.
    ]

#step([Gọi các biến cố])

#step([Tính xác suất điều kiện (Theo sơ đồ cây)])

#step([Áp dụng công thức Bayes])

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Cho hai hộp bi. Hộp I đựng $5$ viên bi Đỏ và $5$ viên bi Xanh. Hộp II đựng $2$ viên bi Đỏ và $x$ viên bi Xanh. Người ta lấy ngẫu nhiên $2$ viên bi từ Hộp I và $3$ viên bi từ Hộp II bỏ vào Hộp III (ban đầu không có bi). Từ Hộp III, lấy ngẫu nhiên ra một viên bi. Giả sử viên bi lấy ra từ Hộp III có màu Xanh. Biết rằng xác suất để viên bi này có nguồn gốc từ Hộp II bằng $9/14$. Tìm số lượng bi Xanh $x$ trong Hộp II?

  *Đáp số:* $3$
]

#ppgiai[
      *1. Sơ đồ mô phỏng quá trình chuyển bi:*
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          rect((-4.5, 2), (-1.5, 5), radius: 0.2, stroke: 1.5pt + rgb("1A5276"), fill: rgb("EBF5FB"))
          content((-3, 5.5), text(weight: "bold", fill: rgb("1A5276"))[HỘP I])
          content((-3, 3.5), text(fill: red)[$5$ Đỏ] + [\ ] + text(fill: blue)[$5$ Xanh])

          rect((1.5, 2), (4.5, 5), radius: 0.2, stroke: 1.5pt + rgb("900C3F"), fill: rgb("FADBD8"))
          content((3, 5.5), text(weight: "bold", fill: rgb("900C3F"))[HỘP II])
          content((3, 3.5), text(fill: red)[$2$ Đỏ] + [\ ] + text(fill: blue)[$x$ Xanh])

          rect((-1.5, -2.5), (1.5, 0), radius: 0.2, stroke: 1.5pt + rgb("117A65"), fill: rgb("E8F8F5"))
          content((0, 0.5), text(weight: "bold", fill: rgb("117A65"))[HỘP III])
          content((0, -1.25), text(size: 10pt)[(Tổng: $5$ bi)])

          line((-3, 2), (-0.5, 0), mark: (end: ">", fill: black), stroke: 1.5pt + rgb("555555"))
          content((-2.2, 0.7), angle: -33deg, box(fill: white, inset: 2pt)[*Lấy 2 bi*])

          line((3, 2), (0.5, 0), mark: (end: ">", fill: black), stroke: 1.5pt + rgb("555555"))
          content((2.2, 0.7), angle: 33deg, box(fill: white, inset: 2pt)[*Lấy 3 bi*])
          
          line((0, -2.5), (0, -4), mark: (end: ">", fill: black), stroke: 1.5pt + blue)
          content((1, -3.2), box(fill: white, inset: 2pt, text(fill: blue)[*Lấy 1 bi*]))
          circle((0, -4.6), radius: 0.4, fill: rgb("e3f2fd"), stroke: 1.5pt + blue)
          content((0, -4.6), text(fill: blue, weight: "bold")[Xanh])
        })
      ]

      *2. Sơ đồ cây xác suất:* #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let b1 = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*1 bi từ Hộp III*]
          content((0, 4), b1, name: "root")

          let b2 = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Hộp I*]
          content((-3.5, 2), b2, name: "h1")
          let b3 = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Hộp II*]
          content((3.5, 2), b3, name: "h2")

          circle((-5, 0), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + red, name: "c1")
          content("c1", text(fill: red)[*Đỏ*])
          circle((-2, 0), radius: 0.6, fill: rgb("e3f2fd"), stroke: 1.5pt + blue, name: "c2")
          content("c2", text(fill: blue)[*Xanh*])
          circle((2, 0), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + red, name: "c3")
          content("c3", text(fill: red)[*Đỏ*])
          circle((5, 0), radius: 0.6, fill: rgb("e3f2fd"), stroke: 1.5pt + blue, name: "c4")
          content("c4", text(fill: blue)[*Xanh*])

          line("root", "h1", mark: (end: ">")); content((-1.6, 3.2), box(fill: white, inset: 1pt)[$2 / 5$])
          line("root", "h2", mark: (end: ">")); content((1.6, 3.2), box(fill: white, inset: 1pt)[$3 / 5$])
          line("h1", "c1", mark: (end: ">")); content((-4.8, 1.2), box(fill: white, inset: 1pt)[$1 / 2$])
          line("h1", "c2", mark: (end: ">")); content((-2.2, 1.2), box(fill: white, inset: 1pt)[$1 / 2$])
          line("h2", "c3", mark: (end: ">")); content((2.2, 1.2), box(fill: white, inset: 1pt)[$2 / (x + 2)$])
          line("h2", "c4", mark: (end: ">")); content((4.8, 1.2), box(fill: white, inset: 1pt)[$x / (x + 2)$])
        })
      ]
    ]

#step([Gọi biến cố và thiết lập phương trình])

#step([Giải phương trình])


== 3. Sơ đồ cây & Xác suất trò chơi (CD-SoDoCay-XacSuat-TroChoi.typ)
- *Ý tưởng chính:* Trực quan hóa các kịch bản thi đấu nhiều giai đoạn (có momentum, hồi sinh) bằng sơ đồ cây vector.

*(Chưa có ví dụ trích xuất)*

== 4. Sơ đồ cây xác suất 1-3-6 (Phân nhánh động) (Sơ-Đồ-Cây-1-3-6.typ)
- *Ý tưởng chính:* Mô hình phân nhánh xác suất với 3 kịch bản ở mỗi giai đoạn phát triển.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một công ty sản xuất một loại sản phẩm. Trước khi bán ra thị trường, công ty đã phỏng vấn $200$ khách hàng và thấy có $88$ người trả lời "sẽ mua", $52$ người trả lời "không mua", số còn lại trả lời "sẽ cân nhắc" thêm và hiện tại chưa quyết định sẽ mua hay không mua. Theo thống kê bằng các đợt bán các sản phẩm trước thì trong những khách hàng trả lời sẽ mua thì sẽ có $80%$ là thực sự mua, trong những khách hàng trả lời không mua thì sẽ có $30%$ thực sự mua và có $65%$ tổng số người phỏng vấn là thực sự mua. Chọn ngẫu nhiên một khách hàng trong các khách hàng đã được phỏng vấn.

  *Đáp số:* Xác suất để chọn được người trả lời "sẽ mua" là $44%$. / Xác suất để chọn được khách hàng thực sự mua, nếu đã biết khách hàng này đã trả lời "sẽ mua", là $44/125$. / Nếu chọn được khách hàng trả lời "sẽ cân nhắc" thì tỉ lệ thực sự mua là $35%$. / Xác suất để chọn được khách hàng trả lời "sẽ cân nhắc", nếu biết khách hàng đó thực sự mua là $8/25$.
]

#ppgiai[
      - Bài toán yêu cầu tính xác suất có điều kiện thuận và ngược. Ta sử dụng hệ biến cố đầy đủ.
      - Gọi $A, B, C$ lần lượt là các biến cố khách hàng trả lời "sẽ mua", "cân nhắc", "không mua".
      - Gọi $M$ là biến cố khách hàng "thực sự mua".
      - *Công thức xác suất đầy đủ:* $P(M) = P(A)P(M|A) + P(B)P(M|B) + P(C)P(M|C)$.
      - *Công thức Bayes:* $P(B|M) = (P(B)P(M|B))/(P(M))$.
    ]

#meo[Ghi nhớ sơ đồ Bayes bằng hình chữ nhật tỉ trọng: Xác suất hậu nghiệm $P(B|M)$ chính là phần diện tích của nhóm $B$ chiếm trong tổng diện tích của toàn bộ hình chữ nhật $M$.]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Một nhà máy có $3$ phân xưởng cùng sản xuất một loại linh kiện. Phân xưởng I chiếm $50%$ tổng sản lượng, phân xưởng II chiếm $30%$, số còn lại do phân xưởng III sản xuất. Theo thống kê từ bộ phận KCS, tỉ lệ phế phẩm của phân xưởng I là $2%$, của phân xưởng III là $3%$. Biết tỉ lệ phế phẩm chung của toàn nhà máy là $3,1%$. Chọn ngẫu nhiên một linh kiện do nhà máy sản xuất.

  *Đáp số:* Xác suất để chọn được linh kiện do phân xưởng I sản xuất là $50%$. / Xác suất để linh kiện là phế phẩm, nếu đã biết nó do phân xưởng I sản xuất, là $1/25$. / Nếu chọn được linh kiện của phân xưởng II thì tỉ lệ là phế phẩm của nó là $5%$. / Xác suất để linh kiện do phân xưởng II sản xuất, nếu biết nó là phế phẩm, là $1/2$.
]

#ppgiai[
      - Bài toán yêu cầu tính xác suất có điều kiện thuận và ngược. Ta sử dụng hệ biến cố đầy đủ.
      - Gọi $A, B, C$ lần lượt là các biến cố linh kiện do phân xưởng I, II, III sản xuất.
      - Gọi $D$ là biến cố linh kiện "là phế phẩm".
      - *Công thức xác suất đầy đủ:* $P(D) = P(A)P(D|A) + P(B)P(D|B) + P(C)P(D|C)$.
      - *Công thức Bayes:* $P(B|D) = (P(B)P(D|B))/(P(D))$.
    ]

#meo[Bài toán Bayes thường xuyên xuất hiện dạng "Tìm thông số kỹ thuật của 1 máy/xưởng dựa vào thông số tổng". Lúc này ta dùng công thức xác suất đầy đủ làm phương trình bậc nhất để tìm $x$.]


== 5. Sơ đồ cây xác suất 2-4-8 (Trò chơi phân nhánh) (Sơ-Đồ-Cây-2-4-8.typ)
- *Ý tưởng chính:* Phân tích trò chơi có 3 lựa chọn với trọng số xác suất thay đổi theo thời gian.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một công ty bảo hiểm thực hiện thống kê trên $20.000$ khách hàng đăng ký. Các khách hàng được phân loại dựa trên ba tiêu chí độc lập:
  - Độ tuổi: Trẻ hoặc Già;
  - Giới tính: Nam hoặc Nữ;
  - Tình trạng hôn nhân: Đã lập gia đình hoặc Độc thân.
  Dữ liệu thống kê thu được như sau: có $6.300$ người trẻ; $9.600$ nam giới; $13.800$ người đã lập gia đình. Ngoài ra, các nhóm kết hợp bao gồm: $2.700$ nam giới trẻ; $6.400$ nam giới đã lập gia đình; $2.900$ người trẻ đã lập gia đình và $1.100$ nam giới trẻ đã lập gia đình.

  *Đáp số:* Công ty có tất cả $6.800$ khách hàng là đàn ông già / Có tất cả $6.200$ khách hàng độc thân và $10.400$ khách hàng là phụ nữ / Xác suất để chọn ngẫu nhiên một khách hàng là phụ nữ trẻ và độc thân là $9,2%$ / Biết rằng một người trẻ được chọn đã lập gia đình, xác suất người đó là đàn ông xấp xỉ $0,38$ (sai số không quá $0,01$)
]

#ppgiai[
      - Phân tích số liệu bài toán bằng sơ đồ cây để dễ dàng bóc tách các nhóm tập hợp.
      - Vận dụng phần bù: $n(overline(A)) = n(Omega) - n(A)$.
      - Xác suất có điều kiện $P(A|B) = (n(A ∩ B)) / (n(B))$.
    ]

#luuy[
      Trong các bài toán xác suất có điều kiện $P(A|B)$, không gian mẫu sẽ bị thu hẹp lại thành số phần tử của tập $B$. Cụ thể ở ý d, khi đề bài nhấn mạnh "Biết rằng một người trẻ được chọn đã lập gia đình", ta chỉ được phép chia cho $n(B) = 2900$ thay vì chia cho tổng số $20000$ khách hàng.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Có hai hộp bi, hộp I có $5$ bi trắng và $7$ bi đỏ, hộp II có $10$ bi trắng và $15$ bi đỏ. Lấy ngẫu nhiên hai viên bi từ hộp I chuyển sang hộp II. Sau đó, từ hộp II lấy ngẫu nhiên $1$ viên bi thì được bi trắng. Xác suất để $2$ bi chuyển từ hộp I sang hộp II không cùng màu là bao nhiêu (làm tròn đến hàng phần trăm).

  *Đáp số:* $0,54$
]

#ppgiai[
      - Vẽ sơ đồ cây biểu diễn 2 giai đoạn: Chuyển 2 bi từ Hộp I sang Hộp II $=>$ Rút 1 bi từ Hộp II.
      - Tính xác suất chuyển bi: Không gian mẫu $C_12^2 = 66$. Các nhánh sẽ có xác suất lần lượt là $C_5^2/66, (C_5^1 dot C_7^1)/66, C_7^2/66$.
      - Khi chuyển bi xong, tổng số bi ở Hộp II luôn là $25 + 2 = 27$ viên. Số bi trắng sẽ thay đổi tùy theo nhánh.
      - Áp dụng công thức Bayes (hoặc định nghĩa trên sơ đồ cây): 
        $ P("Chuyển khác màu" | "Rút được bi Trắng") = ("Xác suất nhánh: Khác màu  VÀ  Rút Trắng") / ("Tổng các nhánh Rút được bi Trắng") $
    ]


== 6. Xác suất có điều kiện trên phân phối vật vào hộp (CD-XacSuat-DieuKien-PhanPhoi.typ)
- *Ý tưởng chính:* Tính xác suất để các hộp thỏa mãn điều kiện nhất định khi phân phối ngẫu nhiên các quả cầu.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Xếp ngẫu nhiên ba học sinh lớp A, ba học sinh lớp B, hai học sinh lớp C vào 5 phòng học phân biệt. Gọi $p$ là xác suất để sao cho không có hai học sinh cùng lớp nào ở chung một phòng, nếu đã biết mỗi phòng học đều có ít nhất một học sinh. Hãy tính giá trị của $10^4 p$ (lấy phần nguyên).

  *Đáp số:* 3143
]

#ppgiai[
      Đây là bài toán xác suất có điều kiện $P(E | F) = frac(N(E inter F), N(F))$ trong đó:
      - Biến cố điều kiện $F$: "Mỗi phòng học có ít nhất một học sinh".
      - Biến cố mục tiêu $E$: "Không có hai học sinh cùng lớp nào ở chung phòng".
      
      Ta sẽ giải chi tiết bằng hai phương pháp để làm nổi bật cấu trúc toán học của bài toán.
    ]

#ans-box[Giá trị phần nguyên của $10^4 p$ là *3143*.]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Có bốn học sinh lớp A, bốn học sinh lớp B và hai học sinh lớp C được phân vào 6 phòng học phân biệt một cách ngẫu nhiên. Biết rằng sau khi phân phối, mỗi phòng học đều có ít nhất một học sinh. Tính xác suất $p$ để không có phòng học nào chứa từ hai học sinh cùng lớp trở lên. Tính $10^4 p$ (lấy phần nguyên).

  *Đáp số:* 1377
]

#ppgiai[
      Tương tự Bài 1, đây là bài toán tính xác suất có điều kiện trên không gian phân phối lớn hơn: 10 học sinh (4A, 4B, 2C) vào 6 phòng học.
      Ta sẽ áp dụng đồng thời cả PIE và EGF để giải quyết nhanh chóng và kiểm chứng chéo.
    ]

#ans-box[Giá trị phần nguyên của $10^4 p$ là *1377*.]


== 7. Xác suất có điều kiện và mô hình giả thuyết (CD-XacSuat-DieuKien-Gia.typ)
- *Ý tưởng chính:* Giải quyết các bài toán xác suất thực tế phức tạp bằng phương pháp giả thuyết hóa các điều kiện biên.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trong một vụ mưu sát tại biệt thự, thám tử Conan khoanh vùng $3$ nghi phạm: $A$ (chủ nhà), $B$ (quản gia), $C$ (kẻ thù kinh doanh). Dựa trên động cơ, xác suất tiên nghiệm lần lượt là $P(A) = 30\%$, $P(B) = 20\%$, $P(C) = 50\%$.

    Đội điều tra tìm thấy *một* manh mối: loại thuốc độc sử dụng là Xyanua-X. Phân tích hành vi cho biết:
    - Nghi phạm $A$ sẽ chọn Xyanua-X với xác suất $40\%$.
    - Nghi phạm $B$ sẽ chọn Xyanua-X với xác suất $80\%$.
    - Nghi phạm $C$ sẽ chọn Xyanua-X với xác suất $10\%$.

    Tính xác suất từng nghi phạm là hung thủ thực sự sau khi tìm thấy manh mối Xyanua-X. (Làm tròn đến bốn chữ số thập phân).

  *Đáp số:* $P(A|M) approx 0{,}3636$;
    $P(B|M) approx 0{,}4848$;
    $P(C|M) approx 0{,}1515$
]

#ppgiai[
      Bài toán Bayes cơ bản với *một* bằng chứng (manh mối). Ta lập sơ đồ cây gốc → nghi phạm → manh mối, tính tích trên mỗi nhánh, rồi chia theo công thức Bayes.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  *Tiếp tục vụ án tại biệt thự hoa hồng.* Xác suất tiên nghiệm: $P(A)=0{,}3$, $P(B)=0{,}2$, $P(C)=0{,}5$. Đội điều tra tìm được *đồng thời hai manh mối độc lập* (khi biết hung thủ, hai manh mối độc lập có điều kiện):

    - *Manh mối $M_1$:* Loại độc sử dụng là Xyanua-X. $P(M_1|A) = 40\%$, $P(M_1|B) = 80\%$, $P(M_1|C) = 10\%$.
    - *Manh mối $M_2$:* Bức thư tuyệt mệnh giả mạo được để lại. $P(M_2|A) = 70\%$, $P(M_2|B) = 20\%$, $P(M_2|C) = 90\%$.

    Tính xác suất để $C$ thực sự là hung thủ khi hiện trường xuất hiện cả hai manh mối trên. (Làm tròn đến hàng phần trăm).

  *Đáp số:* $P(C|E) approx 0{,}28$
]

#ppgiai[
      - *Bước gộp:* Vì hai manh mối $M_1$ và $M_2$ độc lập có điều kiện, ta gộp thành $E = M_1 inter M_2$.
      - *Nguyên lý Naive Bayes:* $P(E|X) = P(M_1|X) dot P(M_2|X)$ với mọi nghi phạm $X in {A, B, C}$.
    ]


== 8. Xác suất gieo xúc sắc kết hợp bốc bi (Gieo-Xúc-Sắc-Xác-Suất-Bốc-Bi.typ)
- *Ý tưởng chính:* Mô hình xác suất liên kết giữa kết quả gieo xúc sắc và số lượng bi được rút ra từ các hộp.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Có 3 chiếc hộp trống được ký hiệu là $A$, $B$ và $C$. Người ta thực hiện một phép thử như sau: Gieo một con xúc xắc cân đối và đồng chất, gọi $k$ là số chấm xuất hiện. Mỗi lần gieo, người ta lấy đúng 2 quả bóng để cho vào các hộp theo quy tắc: nếu $k <= 2$ thì cho cả 2 quả bóng vào hộp $A$; nếu $3 <= k <= 5$ thì cho 1 quả bóng vào hộp $A$ và 1 quả bóng vào hộp $B$; nếu $k = 6$ thì cho 1 quả bóng vào hộp $B$ và 1 quả bóng vào hộp $C$. Thực hiện lặp lại phép thử trên 2 lần. Biết rằng sau 2 lần gieo, số bóng có trong hộp $A$ là một số chẵn. Tính xác suất để số bóng trong hộp $B$ nhiều hơn số bóng trong hộp $C$.

  *Đáp số:* 0.5
]

#step[
      Gọi $X$ là biến cố "Sau 2 lần gieo, số bóng ở hộp $A$ là số chẵn" và $Y$ là biến cố "Số bóng ở hộp $B$ nhiều hơn hộp $C$". Ta cần tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Trước tiên, phân tích 3 khả năng (KN) có thể xảy ra trong *mỗi lần gieo*:
      - *KN1:* $k in {1; 2}$ $arrow$ Xác suất $1/3$, phân bổ bóng: $(+2A, 0B, 0C)$.
      - *KN2:* $k in {3; 4; 5}$ $arrow$ Xác suất $1/2$, phân bổ bóng: $(+1A, +1B, 0C)$.
      - *KN3:* $k = 6$ $arrow$ Xác suất $1/6$, phân bổ bóng: $(0A, +1B, +1C)$.
    ]

#step[
      *Sơ đồ cây biểu diễn phân bổ bóng sau 2 lần gieo:*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          // Các điểm neo L1
          let p1_1 = (3.5, 4.5)
          let p1_2 = (3.5, 0)
          let p1_3 = (3.5, -4.5)

          // Vẽ Nút gốc (Bắt đầu)
          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Bắt đầu], name: "N0")
          
          // Vẽ Nút Lần 1
          content(p1_1, align(center)[*KN1* \ $(2A, 0B, 0C)$], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ $(1A, 1B, 0C)$], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ $(0A, 1B, 1C)$], name: "N1_3")

          // Nhánh Lần 1
          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/3$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/2$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/6$])

          // Nhánh Lần 2 (Viết tường minh, không dùng vòng lặp để tránh lỗi scope của Cetz)
          
          // 1. Từ KN1 rẽ ra 3 nhánh
          line("N1_1", (7.5, 6.0), ..edge-style)
          content((5.5, 5.6), lbl[$1/3$])
          content((7.7, 6.0), [*KN1* $arrow (4A, 0B, 0C)$ #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")

          line("N1_1", (7.5, 4.5), ..edge-style)
          content((5.5, 4.4), lbl[$1/2$])
          content((7.7, 4.5), [*KN2* $arrow (3A, 1B, 0C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west") 

          line("N1_1", (7.5, 3.0), ..edge-style)
          content((5.5, 3.25), lbl[$1/6$])
          content((7.7, 3.0), [*KN3* $arrow (2A, 1B, 1C)$ #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")

          // 2. Từ KN2 rẽ ra 3 nhánh
          line("N1_2", (7.5, 1.5), ..edge-style)
          content((5.5, 0.8+.3), lbl[$1/3$])
          content((7.7, 1.5), [*KN1* $arrow (3A, 1B, 0C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          line("N1_2", (7.5, 0), ..edge-style)
          content((5.5, 0.1 -.2), lbl[$1/2$])
          content((7.7, 0), [*KN2* $arrow (2A, 2B, 0C)$ #h(2pt) #text(fill: blue, weight: "bold")[($B>C$)]], anchor: "west")

          line("N1_2", (7.5, -1.5), ..edge-style)
          content((5.5, -0.5 -.8), lbl[$1/6$])
          content((7.7, -1.5), [*KN3* $arrow (1A, 2B, 1C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // 3. Từ KN3 rẽ ra 3 nhánh
          line("N1_3", (7.5, -3.0), ..edge-style)
          content((5.5, -3.7 +.3), lbl[$1/3$])
          content((7.7, -3.0), [*KN1* $arrow (2A, 1B, 1C)$ #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")

          line("N1_3", (7.5, -4.5), ..edge-style)
          content((5.5, -4.4 -.2), lbl[$1/2$])
          content((7.7, -4.5), [*KN2* $arrow (1A, 2B, 1C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          line("N1_3", (7.5, -6.0), ..edge-style)
          content((5.5, -5.1-.8), lbl[$1/6$])
          content((7.7, -6.0), [*KN3* $arrow (0A, 2B, 2C)$ #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")
        })
      ]
    ]

#step[
      Dựa vào sơ đồ cây, ta lọc được các nhánh mà hộp $A$ có số bóng chẵn (biến cố $X$):
      $ P(X) = (1/3 times 1/3) + (1/3 times 1/6) + (1/2 times 1/2) + (1/6 times 1/3) + (1/6 times 1/6) = 1/2 $
      
      Trong số các nhánh trên, nhánh duy nhất thỏa mãn điều kiện số bóng hộp $B$ nhiều hơn hộp $C$ (biến cố $X inter Y$) là nhánh gieo ra KN2 cả hai lần (được $2A, 2B, 0C$):
      $ P(X inter Y) = 1/2 times 1/2 = 1/4 $
    ]

#step[
      Xác suất cần tìm (xác suất có điều kiện) là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (1/4) / (1/2) = 1/2 $
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Có $3$ chiếc hộp trống được ký hiệu là $A$, $B$ và $C$. Người ta thực hiện một phép thử như sau: Gieo một con xúc xắc cân đối và đồng chất, gọi $k$ là số chấm xuất hiện. Mỗi lần gieo, người ta lấy đúng $2$ quả bóng để cho vào các hộp theo quy tắc: nếu $k <= 2$ thì cho cả $2$ quả bóng vào hộp $A$; nếu $3 <= k <= 5$ thì cho $1$ quả bóng vào hộp $A$ và $1$ quả bóng vào hộp $B$; nếu $k = 6$ thì cho $1$ quả bóng vào hộp $B$ và $1$ quả bóng vào hộp $C$. Thực hiện lặp lại phép thử trên $2$ lần. Biết rằng sau $2$ lần gieo, số bóng có trong hộp $A$ là một số chẵn. Tính xác suất để số bóng trong hộp $B$ nhiều hơn số bóng trong hộp $C$.

  *Đáp số:* $1/2$
]

#ppgiai(title: [Tư duy phá án (Xác suất có điều kiện)])[
      Bài toán yêu cầu tính xác suất $P(N|M)$ với:
      - Biến cố $M$: "Sau $2$ lần gieo, số bóng trong hộp $A$ là số chẵn".
      - Biến cố $N$: "Số bóng trong hộp $B$ nhiều hơn hộp $C$".
      Ta áp dụng công thức Bayes để phá án: $P(N|M) = (P(N cap M))/(P(M))$.
    ]

#step[Phân tích phép thử trong 1 lần gieo]

#step[Sơ đồ phân nhánh không gian mẫu sau 2 lần gieo]

#step[Khoanh vùng hiện trường và kết luận]

#reset-step()


== 9. Xác suất đối kháng & Thi đấu luân lưu (Xác-Suât-Đối Kháng.typ)
- *Ý tưởng chính:* Tính toán xác suất chiến thắng trong các trận đấu thể thao, loạt sút luân lưu với phong độ thay đổi.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một công ty sản xuất một loại sản phẩm. Trước khi bán ra thị trường, công ty đã phỏng vấn $200$ khách hàng và thấy có $88$ người trả lời "sẽ mua", $52$ người trả lời "không mua", số còn lại trả lời "sẽ cân nhắc" thêm và hiện tại chưa quyết định sẽ mua hay không mua. Theo thống kê bằng các đợt bán các sản phẩm trước thì trong những khách hàng trả lời sẽ mua thì sẽ có $80%$ là thực sự mua, trong những khách hàng trả lời không mua thì sẽ có $30%$ thực sự mua và có $65%$ tổng số người phỏng vấn là thực sự mua. Chọn ngẫu nhiên một khách hàng trong các khách hàng đã được phỏng vấn.

  *Đáp số:* Xác suất để chọn được người trả lời "sẽ mua" là $44%$. / Xác suất để chọn được khách hàng thực sự mua, nếu đã biết khách hàng này đã trả lời "sẽ mua", là $44/125$. / Nếu chọn được khách hàng trả lời "sẽ cân nhắc" thì tỉ lệ thực sự mua là $35%$. / Xác suất để chọn được khách hàng trả lời "sẽ cân nhắc", nếu biết khách hàng đó thực sự mua là $8/25$.
]

#ppgiai[
      - Bài toán yêu cầu tính xác suất có điều kiện thuận và ngược. Ta sử dụng hệ biến cố đầy đủ.
      - Gọi $A, B, C$ lần lượt là các biến cố khách hàng trả lời "sẽ mua", "cân nhắc", "không mua".
      - Gọi $M$ là biến cố khách hàng "thực sự mua".
      - *Công thức xác suất đầy đủ:* $P(M) = P(A)P(M|A) + P(B)P(M|B) + P(C)P(M|C)$.
      - *Công thức Bayes:* $P(B|M) = (P(B)P(M|B))/(P(M))$.
    ]

#meo[Ghi nhớ sơ đồ Bayes bằng hình chữ nhật tỉ trọng: Xác suất hậu nghiệm $P(B|M)$ chính là phần diện tích của nhóm $B$ chiếm trong tổng diện tích của toàn bộ hình chữ nhật $M$.]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Một nhà máy có $3$ phân xưởng cùng sản xuất một loại linh kiện. Phân xưởng I chiếm $50%$ tổng sản lượng, phân xưởng II chiếm $30%$, số còn lại do phân xưởng III sản xuất. Theo thống kê từ bộ phận KCS, tỉ lệ phế phẩm của phân xưởng I là $2%$, của phân xưởng III là $3%$. Biết tỉ lệ phế phẩm chung của toàn nhà máy là $3,1%$. Chọn ngẫu nhiên một linh kiện do nhà máy sản xuất.

  *Đáp số:* Xác suất để chọn được linh kiện do phân xưởng I sản xuất là $50%$. / Xác suất để linh kiện là phế phẩm, nếu đã biết nó do phân xưởng I sản xuất, là $1/25$. / Nếu chọn được linh kiện của phân xưởng II thì tỉ lệ là phế phẩm của nó là $5%$. / Xác suất để linh kiện do phân xưởng II sản xuất, nếu biết nó là phế phẩm, là $1/2$.
]

#ppgiai[
      - Bài toán yêu cầu tính xác suất có điều kiện thuận và ngược. Ta sử dụng hệ biến cố đầy đủ.
      - Gọi $A, B, C$ lần lượt là các biến cố linh kiện do phân xưởng I, II, III sản xuất.
      - Gọi $D$ là biến cố linh kiện "là phế phẩm".
      - *Công thức xác suất đầy đủ:* $P(D) = P(A)P(D|A) + P(B)P(D|B) + P(C)P(D|C)$.
      - *Công thức Bayes:* $P(B|D) = (P(B)P(D|B))/(P(D))$.
    ]

#meo[Bài toán Bayes thường xuyên xuất hiện dạng "Tìm thông số kỹ thuật của 1 máy/xưởng dựa vào thông số tổng". Lúc này ta dùng công thức xác suất đầy đủ làm phương trình bậc nhất để tìm $x$.]


= NHÓM 3: HÀM SINH TRONG TỔ HỢP (GENERATING FUNCTIONS)

== 1. Chia kẹo Euler — Sao và Vạch & Đa thức sinh (CD-Chia-Keo-Euler.typ)
- *Ý tưởng chính:* Phương pháp Sao và Vạch cổ điển kết hợp với hàm sinh để đếm số nghiệm nguyên không âm.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Có bao nhiêu cách chia $12$ viên kẹo *giống hệt nhau* cho $5$ em bé phân biệt sao cho:
  1. Mỗi em có ít nhất $1$ viên?
  2. Có em có thể không có kẹo?
  3. Em thứ nhất có ít nhất $2$ viên, em thứ hai có ít nhất $3$ viên, các em còn lại tùy ý?

  *Đáp số:* $(1)\; 330,; (2)\; 1820,; (3)\; 252$
]

#reset-step()

#step[
      *(1) Mỗi em ít nhất 1 viên:* \
      Đặt $y_i = x_i - 1 ge 0$, ta có $y_1 + y_2 + y_3 + y_4 + y_5 = 12 - 5 = 7$.
      Số nghiệm: $C_(7+5-1)^(5-1) = C_11^4 = 330$. \
      $ (12 "kẹo", 5 "em", "mỗi em" ge 1) => C_(12-1)^(5-1) = C_11^4 = 330 $.
    ]

#step[
      *(2) Có em 0 kẹo:* \
      $x_1 + x_2 + x_3 + x_4 + x_5 = 12$, $x_i ge 0$.
      Số nghiệm: $C_(12+5-1)^(5-1) = C_16^4 = 1820$.
    ]

#step[
      *(3) Ràng buộc riêng:* \
      $x_1 ge 2,\; x_2 ge 3,\; x_3, x_4, x_5 ge 0$.
      Đặt $y_1 = x_1 - 2$, $y_2 = x_2 - 3$, $y_3 = x_3$, $y_4 = x_4$, $y_5 = x_5$, với $y_i ge 0$.
      $ y_1 + y_2 + y_3 + y_4 + y_5 = 12 - 2 - 3 = 7 $.
      Số nghiệm: $C_(7+5-1)^(5-1) = C_11^4 = 330$.
    ]

#reset-step()

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Tìm số nghiệm nguyên không âm của bất phương trình:
  $ x_1 + x_2 + x_3 + x_4 le 15 $

  *Đáp số:* 3876
]

#luuy[Tổng quát: $x_1 + dots + x_k le n$ có $C_(n+k)^(k)$ nghiệm — dễ nhớ hơn công thức gốc nếu coi thêm $1$ biến phụ.]


== 2. Chuỗi trạng thái Markov & Xác suất đệ quy (CD-ChuoiTrangThai-Markov.typ)
- *Ý tưởng chính:* Lập hệ phương trình tuyến tính tính xác suất thắng cuộc trong trò chơi lặp vô hạn dựa trên tính chất Markov.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  *1.1 (Trò chơi tung xúc xắc luân phiên)*: Hai bạn An và Bình luân phiên nhau tung một con xúc xắc cân đối và đồng chất. An là người tung trước. Ai tung được mặt $6$ chấm trước thì người đó thắng cuộc và trò chơi kết thúc. Tính xác suất để An là người giành chiến thắng chung cuộc.
]

#sol-diagram(canvas({
  import draw: *
  // Các trạng thái
  circle((-2.5, 0), radius: 0.85, name: "A")
  content("A", text(size: 8.5pt)[Lượt An \ (A)])
  circle((2.5, 0), radius: 0.85, name: "B")
  content("B", text(size: 8.5pt)[Lượt Bình \ (B)])
  circle((-2.5, -2.2), radius: 0.85, name: "EA")
  content("EA", text(size: 8.5pt)[An thắng])
  circle((2.5, -2.2), radius: 0.85, name: "EB")
  content("EB", text(size: 8.5pt)[Bình thắng])
  
  // Các cung chuyển trạng thái
  bezier("A.30", "B.150", (0, 0.9), mark: (end: ">", fill: black))
  content((0, 1.1), $5/6$)
  
  bezier("B.210", "A.330", (0, -0.9), mark: (end: ">", fill: black))
  content((0, -1.1), $5/6$)
  
  line("A.south", "EA.north", mark: (end: ">", fill: black))
  content((-3.6, -1.1), $1/6$)
  
  line("B.south", "EB.north", mark: (end: ">", fill: black))
  content((3.6, -1.1), $1/6$)
}))

#cach1-box[
  Ta có thể mô tả quá trình thắng cuộc của An dưới dạng tổng của một chuỗi các biến cố độc lập qua các vòng chơi:
  - Vòng 1: An tung và thắng ngay lập tức ở lượt đầu tiên (lượt 1). Xác suất là $P_1 = 1/6$.
  - Vòng 2: An tung hỏng ở lượt 1 ($5/6$), Bình tung hỏng ở lượt 2 ($5/6$), và An tung trúng ở lượt 3. Xác suất là $P_3 = (5/6)^2 times 1/6$.
  - Vòng $k$: An tung thắng ở lượt thứ $2k-1$ (tức là $2k-2$ lượt trước đó của cả hai đều hỏng). Xác suất là $P_(2k-1) = (5/6)^(2k-2) times 1/6$.
  
  Tổng xác suất để An thắng chung cuộc là tổng cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 1/6$ và công bội $q = (5/6)^2 = 25/36 < 1$:
  $ P(A) = 1/6 + (5/6)^2 times 1/6 + (5/6)^4 times 1/6 + dots = 1/6 times frac(1, 1 - 25/36) = 1/6 times frac(36, 11) = frac(6, 11) $
]

#cach2-box[
  Sử dụng phương pháp thiết lập phương trình trạng thái (Markov Chain State Equation):
  Gọi $a$ là xác suất An giành chiến thắng chung cuộc khi đang ở trạng thái lượt của mình.
  Gọi $b$ là xác suất An giành chiến thắng chung cuộc khi đang ở trạng thái lượt của Bình.
  - Khi đến lượt của An, An sẽ thắng ngay với xác suất $1/6$. Nếu An tung trượt (xác suất $5/6$), trạng thái chuyển sang lượt của Bình, và từ đây cơ hội thắng của An là $b$. Do đó:
    $ a = 1/6 times 1 + 5/6 times b = 1/6 + 5/6 b $
  - Khi đến lượt của Bình, An chỉ có thể thắng nếu Bình tung trượt (xác suất $5/6$), lúc đó trạng thái quay trở lại lượt của An, và cơ hội thắng của An lúc này lại là $a$. Do đó:
    $ b = 5/6 times a $
  Thay thế $b$ vào phương trình đầu tiên, ta có:
  $ a = 1/6 + 5/6 times (5/6 a) = 1/6 + 25/36 a \
    => a (1 - 25/36) = 1/6 => frac(11, 36) a = 1/6 => a = frac(6, 11) $
]

#ans-box[
  Xác suất để An là người giành chiến thắng chung cuộc là $frac(6, 11)$ (xấp xỉ $54.55\%$).
]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  *1.2 (Trò chơi bắn súng đối đầu)*: Thầy Nghĩa và thầy Ái luân phiên nhau bắn vào một mục tiêu di động, ai bắn trúng trước sẽ thắng cuộc và trò chơi dừng lại. Biết thầy Nghĩa bắn trước. Xác suất bắn trúng trong mỗi lượt của thầy Nghĩa là $0.4$ và của thầy Ái là $0.5$. Tính xác suất để thầy Nghĩa giành chiến thắng.
]

#cach1-box[
  Thầy Nghĩa bắn thắng ở các lượt lẻ: lượt 1, lượt 3, lượt 5,...
  - Thắng ở lượt 1: Nghĩa bắn trúng ngay. Xác suất: $0.4$.
  - Thắng ở lượt 3: Nghĩa trượt lượt 1 ($0.6$), Ái trượt lượt 2 ($0.5$), Nghĩa trúng lượt 3 ($0.4$). Xác suất: $0.6 times 0.5 times 0.4 = 0.3 times 0.4$.
  - Thắng ở lượt $2k-1$: Nghĩa và Ái đều trượt $k-1$ vòng trước. Xác suất: $(0.6 times 0.5)^(k-1) times 0.4 = (0.3)^(k-1) times 0.4$.
  
  Xác suất thắng của thầy Nghĩa là tổng cấp số nhân lùi vô hạn với $u_1 = 0.4$ và công bội $q = 0.3$:
  $ P = 0.4 + 0.4 times 0.3 + 0.4 times (0.3)^2 + dots = frac(0.4, 1 - 0.3) = frac(0.4, 0.7) = frac(4, 7) $
]

#cach2-box[
  Gọi $x$ là xác suất thầy Nghĩa thắng khi đến lượt bắn của thầy Nghĩa.
  Gọi $y$ là xác suất thầy Nghĩa thắng khi đến lượt bắn của thầy Ái.
  - Từ lượt của mình, thầy Nghĩa thắng ngay với xác suất $0.4$. Nếu trượt ($0.6$), lượt chuyển sang thầy Ái và xác suất thắng lúc này là $y$:
    $ x = 0.4 + 0.6 y $
  - Từ lượt của thầy Ái, thầy Nghĩa chỉ thắng được nếu thầy Ái bắn trượt ($1 - 0.5 = 0.5$), khi đó lượt quay lại thầy Nghĩa với xác suất thắng là $x$:
    $ y = 0.5 x $
  Thế vào phương trình thứ nhất:
  $ x = 0.4 + 0.6 times (0.5 x) = 0.4 + 0.3 x \
    => 0.7 x = 0.4 => x = frac(4, 7) $
]

#ans-box[
  Xác suất để thầy Nghĩa giành chiến thắng chung cuộc là $frac(4, 7)$ (xấp xỉ $57.14\%$).
]


== 3. Giải bài toán đếm nâng cao bằng Hàm sinh (EGF) (CD-HamSinh-LoiBai-NangCao-content.typ)
- *Ý tưởng chính:* Ứng dụng hàm sinh lũy thừa để giải quyết các bài toán đếm chuỗi ký tự có giới hạn tần suất xuất hiện.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Có bao nhiêu chuỗi gồm $n = 5$ ký tự, mỗi ký tự chọn từ tập ${1, 2, 3}$, sao cho chữ số $1$ xuất hiện *chẵn lần* (kể cả $0$ lần)?

  *Đáp số:* 122
]

#ppgiai[
      Đây là bài toán đếm chuỗi có thứ tự với ràng buộc trên số lần xuất hiện của chữ số $1$. Ta sẽ giải bằng hai phương pháp để so sánh.
    ]

#cach1-box[
      *Phân nhóm theo số lần chữ số $1$ xuất hiện* (gọi là $k$ lần, $k$ chẵn, $0 <= k <= 5$):

      Với mỗi giá trị $k$ chẵn: chọn $k$ vị trí trong $5$ vị trí để đặt chữ số $1$ ($C_5^k$ cách), sau đó điền tự do vào $5 - k$ vị trí còn lại bằng chữ số $2$ hoặc $3$ ($2^(5-k)$ cách).

      $
        a_5 & = sum_(k in {0, 2, 4}) C_5^k dot 2^(5-k) \
            & = C_5^0 dot 2^5 + C_5^2 dot 2^3 + C_5^4 dot 2^1 \
            & = 1 dot 32 + 10 dot 8 + 5 dot 2 \
            & = 32 + 80 + 10 = bold(122)
      $
    ]

#cach2-box[
      *Đừng nhìn $cosh(x)$ như một công thức lạ.* Trong bài này, nó chỉ là cách viết gọn của ý tưởng: chữ số $1$ được dùng $0$ lần, hoặc $2$ lần, hoặc $4$ lần, ...

      *Bước 1 -- Viết EGF cho từng chữ số:*
      - Chữ số $1$ phải xuất hiện chẵn lần, nên:
        $ f_1(x) = 1 + frac(x^2, 2!) + frac(x^4, 4!) + dots = cosh(x) $
      - Chữ số $2$ không bị ràng buộc, nên:
        $ f_2(x) = 1 + x + frac(x^2, 2!) + frac(x^3, 3!) + dots = e^x $
      - Tương tự, $f_3(x) = e^x$.

      Hạng tử $frac(x^j, j!)$ có nghĩa: "chữ số đó xuất hiện đúng $j$ lần". Mẫu số $j!$ là dấu hiệu của EGF; nó giúp ta xử lý số lần xuất hiện trước, rồi cuối cùng mới khôi phục thứ tự của chuỗi.

      *Bước 2 -- Ghép ba điều kiện lại bằng phép nhân:*
      $ G(x) = f_1(x) dot f_2(x) dot f_3(x) = cosh(x) dot e^x dot e^x $

      Ta nhân vì ta đang chọn đồng thời số lần xuất hiện của ba chữ số. Khi nhân, số mũ của $x$ sẽ cộng lại, nên nó chính là *độ dài chuỗi*.

      Ví dụ:
      $ frac(x^2, 2!) dot frac(x, 1!) dot frac(x^2, 2!) = frac(x^5, 2! 1! 2!) $
      nghĩa là: chữ số $1$ xuất hiện $2$ lần, chữ số $2$ xuất hiện $1$ lần, chữ số $3$ xuất hiện $2$ lần; tổng cộng đúng $5$ ký tự.

      Rút gọn $G(x)$:
      $ G(x) = frac(e^x + e^(-x), 2) dot e^(2x) = frac(e^(3x) + e^x, 2) $

      *Bước 3 -- Lấy hệ số của $x^5$:*
      Vì bài toán hỏi chuỗi dài $5$, ta cần đúng các hạng tử bậc $5$.

      Dùng khai triển $e^(alpha x) = sum_(n=0)^oo frac((alpha x)^n, n!)$:
      $ [x^5] G(x) = frac(1, 2) lr((frac(3^5, 5!) + frac(1^5, 5!))) = frac(3^5 + 1, 2 dot 5!) $

      *Bước 4 -- Nhân lại với $5!$:*
      $ a_5 = 5! dot [x^5] G(x) = frac(3^5 + 1, 2) = frac(243 + 1, 2) = bold(122) $

      *Kết luận tổng quát:* với chuỗi dài $n$, ta luôn có
      $ a_n = frac(3^n + 1, 2) $
    ]

#ans-box[Số chuỗi thỏa mãn là $frac(3^5 + 1, 2) = bold(122)$ chuỗi.]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Có bao nhiêu chuỗi gồm $n = 6$ ký tự, mỗi ký tự chọn từ tập ${1, 2, 3, 4}$, sao cho cả chữ số $1$ lẫn chữ số $2$ đều xuất hiện *chẵn lần*?

  *Đáp số:* 1056
]

#ppgiai[
      Bài này có *hai ràng buộc đồng thời*: số lần xuất hiện của $1$ chẵn VÀ số lần xuất hiện của $2$ chẵn. EGF xử lý hai điều kiện này song song một cách tự nhiên.
    ]

#cach1-box[
      *Kỹ thuật gán trọng số $plus.minus 1$:* Để "lọc" đồng thời cả hai điều kiện chẵn, ta dùng đẳng thức:
      $ sum_(k=0, k "chẵn")^n C_n^k = frac((1+1)^n + (1-1)^n, 2) = frac(2^n, 2) = 2^(n-1) $

      Tổng quát hóa cho hai ràng buộc: số chuỗi thỏa mãn bằng:
      $ a_n = frac(1, 4) sum_(epsilon_1, epsilon_2 in {+1, -1}) (epsilon_1 dot 1 + epsilon_2 dot 1 + 1 + 1)^n $
      trong đó mỗi chữ số $i$ đóng góp trọng số $epsilon_i$ (nếu có ràng buộc chẵn) hoặc $1$ (nếu tự do).

      - $(epsilon_1, epsilon_2) = (+1, +1)$: $(1 + 1 + 1 + 1)^6 = 4^6 = 4096$
      - $(epsilon_1, epsilon_2) = (+1, -1)$: $(1 - 1 + 1 + 1)^6 = 2^6 = 64$ (vì chữ số $2$ đóng góp $-1$)
      - $(epsilon_1, epsilon_2) = (-1, +1)$: $(-1 + 1 + 1 + 1)^6 = 2^6 = 64$
      - $(epsilon_1, epsilon_2) = (-1, -1)$: $(-1 - 1 + 1 + 1)^6 = 0^6 = 0$

      $ a_6 = frac(4096 + 64 + 64 + 0, 4) = frac(4224, 4) = bold(1056) $
    ]

#cach2-box[
      *Bài này y hệt bài trước, chỉ khác ở chỗ ta có hai "bộ lọc chẵn" thay vì một.*

      *Bước 1 -- Viết EGF cho từng chữ số:*
      - Chữ số $1$ phải xuất hiện chẵn lần, nên $f_1(x) = cosh(x)$.
      - Chữ số $2$ cũng phải xuất hiện chẵn lần, nên $f_2(x) = cosh(x)$.
      - Chữ số $3$ và $4$ là tự do, nên $f_3(x) = f_4(x) = e^x$.

      Vậy:
      $ G(x) = f_1(x) dot f_2(x) dot f_3(x) dot f_4(x) = cosh^2(x) dot e^(2x) $

      *Bước 2 -- Rút gọn hàm sinh tổng:*
      $ G(x) = lr((frac(e^x + e^(-x), 2)))^2 dot e^(2x) $
      $ = frac((e^x + e^(-x))^2, 4) dot e^(2x) $
      $ = frac(e^(2x) + 2 + e^(-2x), 4) dot e^(2x) $
      $ = frac(e^(4x) + 2 e^(2x) + 1, 4) $

      Dòng cuối rất đáng giá, vì lúc này việc lấy hệ số trở nên dễ: ta chỉ còn phải đọc hệ số của vài hàm mũ quen thuộc.

      *Bước 3 -- Lấy hệ số của $x^6$:*
      Vì bài toán hỏi chuỗi dài $6$, ta cần $[x^6] G(x)$. Hạng tử $1$ không đóng góp gì vì nó chỉ là bậc $0$.

      Do đó:
      $ [x^6] G(x) = frac(1, 4) lr((frac(4^6, 6!) + frac(2 dot 2^6, 6!))) = frac(4^6 + 2^7, 4 dot 6!) $

      *Bước 4 -- Nhân lại với $6!$:*
      $ a_6 = 6! dot [x^6] G(x) = frac(4^6 + 2^7, 4) = frac(4096 + 128, 4) = bold(1056) $

      *Kết luận tổng quát:* với chuỗi dài $n$,
      $ a_n = frac(4^n + 2 dot 2^n, 4) = frac(4^n + 2^(n+1), 4) $
    ]

#ans-box[Số chuỗi thỏa mãn là $frac(4^6 + 2^7, 4) = bold(1056)$ chuỗi.]


== 4. Hàm sinh trong Tổ hợp (Generating Functions) (CD-HamSinh-GeneratingFunction-content.typ)
- *Ý tưởng chính:* Nền tảng lý thuyết về hàm sinh thường (OGF) và hàm sinh lũy thừa (EGF) trong toán rời rạc.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một học sinh muốn chọn mua đúng 3 quyển vở từ 2 loại vở khác nhau: vở kẻ ngang và vở ô ly. Biết số lượng mỗi loại vở ở cửa hàng là không giới hạn. Hỏi học sinh đó có bao nhiêu cách chọn?

  *Đáp số:* $4$ cách
]

#ppgiai[Đây là bài toán chọn phần tử có lặp, tương đương với việc tìm số nghiệm nguyên không âm của phương trình $x_1 + x_2 = 3$, trong đó $x_1, x_2$ lần lượt là số vở kẻ ngang và vở ô ly được chọn.]

#cach1-box[
      *Lập luận trực tiếp và liệt kê:*
      Ta chỉ ra tất cả các cách chọn bộ số $(x_1, x_2)$ có tổng bằng 3:
      - Cách 1: $(3, 0)$ (chọn 3 vở kẻ ngang, 0 vở ô ly).
      - Cách 2: $(2, 1)$ (chọn 2 vở kẻ ngang, 1 vở ô ly).
      - Cách 3: $(1, 2)$ (chọn 1 vở kẻ ngang, 2 vở ô ly).
      - Cách 4: $(0, 3)$ (chọn 0 vở kẻ ngang, 3 vở ô ly).

      Sử dụng công thức chia kẹo (Stars and Bars) với $n = 3$ phần tử và $k = 2$ loại:
      $
        N = C_(3+2-1)^(2-1) = C_4^1 = 4 " cách."
      $
    ]

#cach2-box[
      *Sử dụng hàm sinh:*
      Mỗi loại vở có thể được chọn với số lượng tùy ý từ 0 đến 3 quyển. Hàm sinh đại diện cho mỗi loại vở là:
      $
        G_1(x) = G_2(x) = 1 + x^1 + x^2 + x^3 + ... = frac(1, 1-x)
      $
      Hàm sinh cho tổng số vở chọn được từ cả hai loại là:
      $
        G(x) = G_1(x) dot.c G_2(x) = lr((frac(1, 1-x)))^2 = frac(1, (1-x)^2)
      $
      Số cách chọn ra 3 quyển vở chính là hệ số của $x^3$ trong khai triển của $G(x)$:
      $
        [x^3] G(x) = [x^3] sum_(n=0)^(+oo) C_(n+2-1)^(2-1) x^n = C_(3+2-1)^(2-1) = C_4^1 = 4 " cách."
      $
    ]

#ans-box[Có tất cả *4 cách* chọn tập vở.]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Tìm số nghiệm nguyên dương của phương trình: $x_1 + x_2 + x_3 = 5$.

  *Đáp số:* $6$ nghiệm
]

#ppgiai[Vì nghiệm yêu cầu nguyên dương nên các biến $x_i >= 1$. Ta có thể biến đổi biến số hoặc dùng hàm sinh có số mũ bắt đầu từ 1.]

#cach1-box[
      *Sử dụng tổ hợp vách ngăn (Stars and Bars):*
      Xếp 5 ngôi sao biểu thị giá trị 5 thành một hàng ngang. Giữa 5 ngôi sao có đúng $5-1=4$ khoảng trống.
      Để chia thành 3 phần dương, ta chọn đặt 2 vách ngăn vào 4 khoảng trống này.
      Số cách chọn là:
      $
        N = C_(5-1)^(3-1) = C_4^2 = 6 " nghiệm."
      $
      Các nghiệm cụ thể gồm: $(1,1,3)$, $(1,2,2)$, $(1,3,1)$, $(2,1,2)$, $(2,2,1)$, $(3,1,1)$.
    ]

#cach2-box[
      *Sử dụng hàm sinh:*
      Mỗi biến $x_i >= 1$ có hàm sinh tương ứng là:
      $
        G_i(x) = x^1 + x^2 + x^3 + ... = x(1 + x + x^2 + ...) = frac(x, 1-x)
      $
      Hàm sinh cho tổng $x_1 + x_2 + x_3$ của ba biến là:
      $
        G(x) = G_1(x) G_2(x) G_3(x) = lr((frac(x, 1-x)))^3 = frac(x^3, (1-x)^3)
      $
      Số nghiệm chính là hệ số của $x^5$ trong khai triển $G(x)$:
      $
        [x^5] G(x) = [x^5] frac(x^3, (1-x)^3) = [x^2] frac(1, (1-x)^3)
      $
      Áp dụng công thức hệ số:
      $
        [x^2] frac(1, (1-x)^3) = C_(2+3-1)^(3-1) = C_4^2 = 6 " nghiệm."
      $
    ]

#ans-box[Phương trình có đúng *6 nghiệm* nguyên dương.]


== 5. Mô hình Phân phối vật vào hộp (4 Trường hợp) (CD-PhanPhoi-4TruongHop.typ)
- *Ý tưởng chính:* Phân loại cách phân phối vật (phân biệt/giống nhau) vào hộp (phân biệt/giống nhau) sử dụng số Stirling.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  *🎯 Yêu cầu nâng cao cho Case 1*: Xếp 6 quả bóng phân biệt vào 3 hộp phân biệt sao cho *mỗi hộp chứa ít nhất 1 quả bóng*.
]

#cach1-box[
  *Sử dụng tư duy chia nhóm rồi gán nhãn:*
  - Chia 6 quả bóng phân biệt thành 3 nhóm không phân biệt, không nhóm nào trống: Số cách chia là $S_6^3$.
    Ta dùng công thức truy hồi để tính nhanh:
    $ S_6^3 = S_5^2 + 3  dot.c  S_5^3 $
    Với $S_5^3 = 25$ (đã tính ở mục I), ta tính thêm $S_5^2$:
    $ S_5^2 = S_4^1 + 2  dot.c  S_4^2 = 1 + 2  dot.c  7 = 15. $
    Do đó: $S_6^3 = 15 + 3  dot.c  25 = 90$ cách chia nhóm.
  - Gán 3 nhóm bóng này vào 3 chiếc hộp phân biệt: $3! = 6$ cách.
  
  Tổng số cách xếp là:
  $ N = 3!  dot.c  S_6^3 = 6  dot.c  90 = 540 "cách." $
]

#cach2-box[
  *Sử dụng Hàm sinh mũ (EGF):*
  Mỗi hộp chứa ít nhất 1 quả bóng phân biệt $ -> $ EGF của một hộp là $e^x - 1$.
  Hàm sinh tổng thể cho 3 hộp phân biệt là:
  $ E(x) = (e^x - 1)^3 = e^(3x) - 3e^(2x) + 3e^x - 1 $
  Ta trích hệ số của $x^6 / 6!$ trong $E(x)$:
  $ N = 6!  dot.c  [x^6] E(x) = 6!  dot.c  (3^6 / 6! - 3  dot.c  2^6 / 6! + 3  dot.c  1^6 / 6!) $
  $ N = 3^6 - 3  dot.c  2^6 + 3  dot.c  1^6 = 729 - 192 + 3 = 540 "cách." $
]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  *🎯 Yêu cầu nâng cao cho Case 2*: Chia 6 quả bóng giống nhau vào 3 hộp phân biệt sao cho *hộp 1 chứa tối đa 2 quả*.
]

#cach1-box[
  *Chia trường hợp theo số bóng trong Hộp 1:*
  Gọi số bóng trong hộp 1, 2, 3 lần lượt là $x_1, x_2, x_3 >= 0$ thỏa mãn $x_1 + x_2 + x_3 = 6$ với điều kiện $x_1 <= 2$.
  - *Trường hợp 1: $x_1 = 0$.* Phương trình thành $x_2 + x_3 = 6$. Số nghiệm là $C_7^1 = 7$.
  - *Trường hợp 2: $x_1 = 1$.* Phương trình thành $x_2 + x_3 = 5$. Số nghiệm là $C_6^1 = 6$.
  - *Trường hợp 3: $x_1 = 2$.* Phương trình thành $x_2 + x_3 = 4$. Số nghiệm là $C_5^1 = 5$.
  $ N = 7 + 6 + 5 = 18 "cách." $
]

#cach2-box[
  *Sử dụng Hàm sinh thường (OGF):*
  - Hộp 1 chứa tối đa 2 bóng $ -> $ OGF: $G_1(x) = 1 + x + x^2$.
  - Hộp 2 và Hộp 3 tự do $ -> $ OGF: $G_2(x) = G_3(x) = 1/(1-x)$.
  
  Hàm sinh tổng cho 3 hộp là:
  $ G(x) = (1 + x + x^2)  dot.c  lr((1 / (1-x)))^2 = (1 + x + x^2) / (1-x)^2 $
  $ N = [x^6] (1 + x + x^2) / (1-x)^2 = [x^6] 1 / (1-x)^2 + [x^5] 1 / (1-x)^2 + [x^4] 1 / (1-x)^2 $
  Áp dụng công thức nhị thức âm $[x^m] 1 / (1-x)^2 = C_(m+1)^1 = m + 1$:
  $ N = (6 + 1) + (5 + 1) + (4 + 1) = 7 + 6 + 5 = 18 "cách." $
]


= NHÓM 4: GIẢI TÍCH, TÍCH PHÂN & TỐI ƯU HÓA (CALCULUS & OPTIMIZATION)

== 1. Các bài toán tích phân độc lạ và nâng cao (CD-tich-Phan-đọc lạ.typ)
- *Ý tưởng chính:* Các dạng bài tích phân phi chuẩn, ứng dụng tính diện tích, thể tích các vật thể có biên phức tạp.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một đường hầm mô hình có chiều dài là $6 " cm"$. Thiết diện vuông góc với mặt đáy là một nửa hình elip, thiết diện có độ dài cạnh đáy (trục lớn) luôn gấp $3$ lần chiều cao (nửa trục bé). Chiều cao của mỗi thiết diện nửa elip cho bởi công thức $h(x) = 4 - 0,5x$ ($x$ là khoảng cách tính từ lối vào lớn hơn). Tính thể tích không gian bên trong đường hầm (làm tròn hàng đơn vị).

  *Đáp số:* $99$
]

#ppgiai[
      *Cơ sở lý thuyết: Thể tích vật thể*
      - Thể tích của vật thể được tính bằng nguyên hàm diện tích mặt cắt $S(x)$ dọc theo trục $O x$:
        $ V = integral_(x_1)^(x_2) S(x) dif x $
      - Diện tích hình nửa elip với chiều dài nửa trục lớn $a$ và nửa trục bé $b$ là $S = 1/2 pi dot a dot b$.
    ]

#luuy[Khi sử dụng phương pháp lát cắt để tính thể tích, cần chú ý xác định đúng thiết diện $S(x)$ vuông góc với trục $O x$ và đổi biến cẩn thận khi tính toán tích phân xác định.]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Một vật thể 3 chiều có đáy là một phần của mặt phẳng tọa độ $O x y$, được giới hạn bởi trục hoành, đường thẳng $x=0$, $x=2$ và đường cong đồ thị hàm số $y=2^x$. Biết rằng khi cắt vật thể bởi các mặt phẳng vuông góc với trục $O x$ tại vị trí có hoành độ $x$ ($0 <= x <= 2$), thiết diện thu được luôn là một hình vuông có một cạnh nằm trên mặt đáy (tham khảo hình vẽ). Tính thể tích của vật thể đó (làm tròn kết quả đến hàng phần trăm).

  *Đáp số:* $10,82$
]

#ppgiai[
      - Thể tích của một vật thể giới hạn bởi hai mặt phẳng vuông góc với trục $O x$ tại $x = a$ và $x = b$ được tính theo công thức tích phân:
        $ V = integral_a^b S(x) dif x $
      - Trong đó, $S(x)$ là diện tích của thiết diện vật thể bị cắt bởi mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ $x$.
    ]

#luuy[
      Cần phân biệt rõ giữa bài toán "tính thể tích theo diện tích thiết diện $S(x)$" và "tính thể tích khối tròn xoay". Công thức mặt cắt $S(x)$ không nhân thêm $pi$ ở ngoài tích phân vì chính bản thân $S(x)$ đã là diện tích trọn vẹn của mặt cắt rồi.
    ]


== 2. Mô hình tăng giảm liên tục & Cực trị (CD-Tang-Giam-LienTuc.typ)
- *Ý tưởng chính:* Khảo sát và tìm cực trị của các mô hình tăng trưởng liên tục hoặc suy giảm liên tục trong thực tế.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  _Câu chuyện về mối tình đầu của giới trẻ thì nó rất là thú vị và hấp dẫn, yêu thì nồng nhiệt hết mình mà chia tay thì cũng phũ phàng quyết liệt không kém. Thế nhưng dù có như thế nào thì mối tình đầu cũng rất là khó phai._ \
    Giả sử có một mối tình đầu giữa hai bạn *Huỳnh Thanh Nam* và *Nguyễn Minh Thư* khi còn yêu nhau ta coi như có $100$ điểm tình cảm. Vào một ngày nọ, vì một số lí do hiểu lầm không thể nào giải thích giữa đôi nam nữ này mà dẫn tới họ quyết định chia tay nhau. Ở những ngày sau đó coi như họ gặp nhau mỗi ngày một lần, coi như sau một ngày không gặp nhau thì tình cảm giảm đi $30%$ so với lúc vừa gặp nhau xong, mỗi lần gặp nhau lại hâm nóng tình cảm và tăng lên $12%$ so với ngày trước đó. Với giả sử điểm tình cảm nhỏ hơn $10$ thì coi như quên hẳn được nhau và khi gặp sẽ không còn hâm nóng lên được nữa. Hỏi sau tối thiểu bao nhiêu ngày kể từ lúc chia tay thì hai bạn này quên được nhau (_làm tròn kết quả đến hàng đơn vị_)?

  *Đáp số:* $10$
]

#ppgiai[
      - Bài toán liên quan đến tăng trưởng / suy giảm kép.
      - Nếu một đại lượng $A$ ban đầu, qua mỗi chu kỳ (mỗi ngày) bị giảm $a%$ rồi ngay lập tức tăng $b%$ (trên nền lượng vừa giảm), thì sau một chu kỳ đại lượng đó trở thành:
        $ A_1 = A dot (1 - a%) dot (1 + b%) $
      - Lặp lại quá trình này $n$ chu kỳ, ta thu được dãy số là một cấp số nhân với công thức số hạng tổng quát:
        $ A_n = A dot q^n quad "với công bội " q = (1 - a%) dot (1 + b%) $
    ]

#luuy[
      Khi giải bất phương trình logarit hoặc mũ dạng $q^n < C$. Nếu cơ số $0 < q < 1$, ta bắt buộc phải *đổi chiều bất phương trình* ($n > log_q C$).
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Tại một khu bảo tồn thiên nhiên, một quần thể chim quý hiếm ban đầu được ghi nhận có $500$ cá thể. Khí hậu ở đây chia làm hai mùa rõ rệt trong một năm. Theo thống kê của các nhà sinh học, trải qua mỗi mùa khô khắc nghiệt, số lượng cá thể của quần thể bị sụt giảm $15%$. Tuy nhiên, ngay sau đó bước vào mùa sinh sản, số lượng cá thể lại được gia tăng $20%$ so với số lượng còn sống sót sau mùa khô. Giả sử chu kỳ này lặp lại đều đặn và các tỷ lệ biến động là không đổi qua các năm. Hỏi sau ít nhất bao nhiêu năm (tính trọn vẹn cả hai mùa) thì số lượng cá thể của quần thể chim quý này vượt mức $700$ cá thể?

  *Đáp số:* $17$
]

#ppgiai[
      - Bài toán thực tế liên quan đến mô hình tăng trưởng/suy giảm kép.
      - Nếu một đại lượng $A$ ban đầu, qua mỗi chu kỳ bị giảm $a%$ rồi ngay lập tức tăng $b%$ (trên nền lượng vừa giảm), thì sau một chu kỳ đại lượng đó trở thành:
        $ A_1 = A dot (1 - a%) dot (1 + b%) $
      - Lặp lại quá trình này $n$ chu kỳ, ta thu được dãy số là một cấp số nhân với công thức số hạng tổng quát:
        $ A_n = A dot q^n quad "với công bội " q = (1 - a%) dot (1 + b%) $
    ]

#luuy[
      Nhiều học sinh thường mắc sai lầm khi cộng trừ trực tiếp các số phần trăm: lấy tăng $20%$ trừ đi giảm $15%$ thành tăng $5%$ (tương ứng $q=1","05$). Đây là tư duy sai lầm trong bài toán biến động kép. Phải tính chính xác theo hệ số nhân: $(1 - 15%) dot (1 + 20%) = 1","02$ (tức là thực chất quần thể chỉ tăng $2%$ sau mỗi chu kỳ một năm).
    ]


== 3. Suy diễn Logistic & Giới hạn thay đổi bão hòa (CHủ Đề Thay Đổi Bảo Hoà.typ)
- *Ý tưởng chính:* Mô hình hóa sự phát triển theo hàm số Logistic và tìm điểm giới hạn bão hòa tối ưu.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Doanh thu hằng tháng $R$ của một sản phẩm mới trong một khoảng thời gian dự kiến tuân theo hàm logistic: $R = R(t) = A / (1+55e^(-t)) - B$ (sản phẩm), với $A, B$ là các hệ số thực và $t$ là thời gian được tính bằng tháng. Biết tốc độ bán hàng là đạo hàm theo thời gian $t$ của doanh thu với đơn vị là sản phẩm/ tháng, số lượng sản phẩm bán được tối đa là $5500$ sản phẩm. Trong bài toán kết quả được trả lời làm tròn đến hàng đơn vị. Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?

  *Đáp số:* $B = A / 56$ / $R'(t) > 0$ với mọi $t >= 0$ / Khi doanh thu bằng $500$ thì tốc độ bán hàng bằng $536$ sản phẩm/ $1$ tháng / Sản phẩm bán chạy nhất ở tháng thứ $4$
]

#step[Kiểm tra mệnh đề a]

#step[Kiểm tra mệnh đề b]

#step[Kiểm tra mệnh đề c]

#step[Kiểm tra mệnh đề d]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Số lượng người dùng $N$ của một ứng dụng giáo dục mới sau $t$ tuần ra mắt dự kiến tuân theo hàm logistic: $N = N(t) = A / (1+49e^(-t)) - B$ (người dùng), với $A, B$ là các hằng số thực dương. Biết tại thời điểm ra mắt ($t=0$), ứng dụng chưa có người dùng nào. Dựa trên cấu hình hạ tầng máy chủ, số lượng người dùng tối đa mà hệ thống có thể đáp ứng được là $9800$ người. Tốc độ tăng trưởng lượng người dùng là đạo hàm của hàm số $N(t)$ theo thời gian $t$ (đơn vị: người/tuần). Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?

  *Đáp số:* $A = 50B$ / Hệ số $A = 10000$ / Tốc độ tăng người dùng đạt lớn nhất rơi vào tuần thứ $5$ (kết quả làm tròn đến hàng đơn vị) / Tại thời điểm ứng dụng có $1800$ người dùng thì tốc độ tăng trưởng là $1600$ người/ $1$ tuần
]

#step[Kiểm tra mệnh đề a]

#step[Kiểm tra mệnh đề b]

#step[Kiểm tra mệnh đề c]

#step[Kiểm tra mệnh đề d]


== 4. Tích phân trong Kinh tế: Thặng dư CS & PS (CD-Kinh-Te-Tich-Phan.typ)
- *Ý tưởng chính:* Tính thặng dư tiêu dùng (CS) và thặng dư sản xuất (PS) tại điểm cân bằng cung cầu bằng tích phân.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một kỹ sư tiến hành lắp ráp một rotor của động cơ phản lực. Rotor có $9$ khe cắm cánh quạt được đánh số cố định từ $1$ đến $9$ theo vòng tròn. Khoảng cách giữa các khe đều nhau, tạo thành các đỉnh của một đa giác đều có $9$ cạnh. Do sai số chế tạo, $9$ cánh quạt có khối lượng thực tế là các số nguyên phân biệt từ $1$ đến $9$ gam.
    #grid(
      columns: (1fr, 38%),
      column-gutter: 14pt,
      align: (left + top, center + top),
      [
        Để đảm bảo rotor cân bằng động học khi quay, kỹ sư lựa chọn phương án lắp đặt thỏa mãn đồng thời các điều kiện sau:
        + Chia $9$ cánh quạt thành $3$ nhóm (mỗi nhóm $3$ cánh).
        + Mỗi nhóm được lắp vào $3$ khe cắm tạo thành một tam giác đều (ba khe cắm tạo thành một tam giác đều khi và chỉ khi chúng cách nhau đúng $3$ khe theo vòng tròn).
        + Tổng khối lượng của $3$ cánh quạt trong mỗi nhóm phải bằng nhau.
      ],
      cetz.canvas(length: 1cm, {
        import cetz.draw: *
        let R = 1.8
        let pts = ()
        for i in range(1, 10) {
          let a = 90deg - (i - 1) * 40deg
          pts.push((R * calc.cos(a), R * calc.sin(a)))
        }
        for i in range(9) {
          line(pts.at(i), pts.at(calc.rem(i + 1, 9)), stroke: blue + 0.8pt)
        }
        line(pts.at(0), pts.at(3), pts.at(6), close: true, stroke: green + 0.8pt)
        for i in range(9) {
          circle(pts.at(i), radius: 1.5pt, fill: red, stroke: none)
          let ta = 90deg - i * 40deg
          let tr = R + 0.3
          content((tr * calc.cos(ta), tr * calc.sin(ta)), [*#str(i + 1)*])
        }
      }),
    )
    Hỏi có bao nhiêu cách sắp xếp $9$ cánh quạt vào $9$ khe cắm thỏa mãn các điều kiện kỹ thuật trên?
    _(Hai cách sắp xếp được coi là khác nhau nếu có ít nhất một cánh quạt ở một vị trí khe cắm khác nhau, không đồng nhất các cách lắp khác nhau bởi phép quay hay phép đối xứng của rotor)_

  *Đáp số:* $2592$
]

#ppgiai[
      Để bài toán trở nên dễ hình dung nhất, ta tưởng tượng việc lắp cánh quạt giống như việc *chia 9 vận động viên vào 3 đội* và xếp họ thi đấu trên *3 sân khác nhau*. Quá trình gồm 3 bước độc lập:
      - *Bước 1 (Chia đội):* Tìm số cách chia 9 cánh quạt thành 3 nhóm có tổng khối lượng bằng nhau.
      - *Bước 2 (Chọn sân):* Nhận diện 3 bộ vị trí tạo thành tam giác đều trên rotor.
      - *Bước 3 (Xếp người):* Gán các đội vào sân và xếp chỗ cho từng người trong sân đó.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Hàm cầu: $p = D(x) = 4 - 0","2x$ (triệu đồng/tấm). Hàm cung: $p = S(x) = 0","4 + 0","1x + frac(1, m) x^2$ (triệu đồng/tấm), trong đó $x$ là sản lượng (nghìn sản phẩm), $m > 0$. Biết thặng dư sản xuất tại cân bằng bằng $4","2$ tỷ đồng. Tính thặng dư tiêu dùng.

  *Đáp số:* 0,4
]

#reset-step()

#step[
      *Tìm điểm cân bằng qua điều kiện PS.*

      PS $= integral_0^(x_0) [p_0 - S(x)] dif x = 4","2$, với $p_0 = 0","4 + 0","1x_0 + frac(x_0^2, m)$.

      Sau khi triển khai:
      $0","05 x_0^2 + frac(2, 3m) x_0^3 = 4","2. quad (1)$

      Điều kiện cân bằng $D(x_0)=S(x_0)$ cho:
      $frac(x_0^2, m) = 3","6 - 0","3 x_0. quad (2)$

      Thay $(2)$ vào $(1)$:
      $0","05 x_0^2 + frac(2, 3) x_0(3","6 - 0","3 x_0) = 4","2$
      $=> -0","15 x_0^2 + 2","4 x_0 - 4","2 = 0$
      $=> x_0^2 - 16 x_0 + 28 = 0.$
    ]

#step[
      *Giải phương trình và chọn nghiệm hợp lệ.*

      $x_0 = 2$ hoặc $x_0 = 14$.

      Với $x_0 = 14$: từ $(2)$ suy ra $frac(196, m) = -0","6 < 0$ (loại vì $m>0$).

      Vậy $x_0 = 2,\ p_0 = 4 - 0","4 = 3","6$.
    ]

#step[
      *Tính thặng dư tiêu dùng.*

      $"CS" = integral_0^2 [(4 - 0","2x) - 3","6] dif x = integral_0^2 (0","4 - 0","2x) dif x$
      $= (0","4x - 0","1x^2)|_0^2 = 0","8 - 0","4 = bold(0","4) " tỷ đồng".$

      #nhanxet[Đáp số tô phiếu: *0,4*. Chìa khóa là dùng điều kiện cân bằng để khử tham số $m$ trước khi giải phương trình bậc hai.]
    ]


== 5. Tích phân tốc độ thay đổi & Doanh thu lũy tiến (CD-TichPhan-TocDo-DoanhThu.typ)
- *Ý tưởng chính:* Ứng dụng tích phân xác định tính tổng doanh thu lũy tích, chi phí khi biết hàm tốc độ thay đổi.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một doanh nghiệp tung chiến dịch ra mắt sản phẩm. Tốc độ phát sinh doanh thu (triệu đồng/ngày) sau $t$ ngày kể từ ngày ra mắt được mô hình hóa bởi:
  $
    f(t) = cases(2t & 0 <= t <= 15, 30 & 15 < t <= 45)
  $
  Tính tổng doanh thu thu được trong toàn bộ chiến dịch 45 ngày.

  *Đáp số:* $1\,125$ triệu đồng
]

#ppgiai[
      - Hàm liên tục tại $t = 15$: $f(15^-) = 2 times 15 = 30 = f(15^+)$ ✓ — hai pha khớp nhau.
      - Tính từng phần tích phân, sau đó cộng lại.
    ]

#ans-box[
      Tổng doanh thu $= S_1 + S_2 = 225 + 900 = $*1 125 triệu đồng*.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Lưu lượng nước chảy vào bể (m³/giờ) trong $t$ giờ kể từ khi mở van được mô hình hóa bởi:
  $
    Q(t) = cases(4t^2 & 0 <= t <= 3, 36 & 3 < t <= 8, 36 - 4(t - 8)^2 & 8 < t <= 11)
  $
  Tính tổng lượng nước chảy vào bể trong 11 giờ.

  *Đáp số:* $288$ m³
]

#ppgiai[
      - Kiểm tra liên tục: $Q(3^-) = 4 times 9 = 36 = Q(3^+)$ ✓; $Q(8^-) = 36 = Q(8^+)$ ✓; $Q(11) = 36-4times 9 = 0$ ✓.
      - Giai đoạn 3 dùng tích phân bằng cách đặt $u = t - 8$ cho gọn.
    ]

#ans-box[
      Tổng lượng nước $= 36 + 180 + 72 = $*288 m³*.
    ]


== 6. Tối ưu hóa kinh tế nhiều điều kiện ràng buộc (CD-ToiUu-KinhTe-DaDieuKien.typ)
- *Ý tưởng chính:* Tìm giá trị cực trị của hàm nhiều biến dưới các điều kiện ràng buộc kinh tế hoặc sản xuất.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một công ty du lịch thông báo giá tiền cho chuyến đi tham quan của một nhóm khách du lịch như sau: $20$ khách đầu tiên có giá là $30$ USD/người; nếu có nhiều hơn $20$ người đăng kí thì cứ có thêm $1$ người, giá vé sẽ giảm $1$ USD/người cho toàn bộ hành khách. Hỏi công ty nên giới hạn số lượng hành khách tối đa là bao nhiêu để công ty không bị lỗ? Biết rằng chi phí tổ chức của chuyến đi cố định là $400$ USD.

  *Đáp số:* $40$
]

#reset-step()

#step[
      *Phân tích ý tưởng đằng sau bài toán.*
      
      Bài toán phản ánh một mô hình định giá phổ biến: *Chiết khấu theo số lượng (Quantity Discount)*. Ban đầu, khi có ít khách, giá vé được neo ở mức cao ($30$ USD). Khi số khách vượt ngưỡng ($20$ người), doanh nghiệp chấp nhận giảm đơn giá cho toàn đoàn nhằm kích cầu. 
      
      Tuy nhiên, do giảm giá áp dụng cho *toàn bộ hành khách* chứ không riêng phần vượt ngưỡng, nên khi số lượng khách tăng quá lớn, doanh thu trên một khách giảm nhanh hơn tốc độ tăng số lượng khách. Điều này tạo nên một hàm doanh thu hình parabol úp ngược. Điểm hòa vốn biên phía bên phải chính là giới hạn tối đa để tránh bị "sập bẫy" quy mô (lượng tăng nhưng tổng tiền thu về lại giảm).
    ]

#step[
      *Cách đặt biến số và phân tích miền xác định.*
      
      Gọi $x$ là số lượng hành khách đăng ký tham gia chuyến đi. 
      - Điều kiện thực tế: Số lượng người phải là số nguyên dương, tức $x in NN^*$.
      - Dựa theo kết cấu giá vé đổi mốc tại $20$ khách, ta bắt buộc phải phân mảnh miền xác định của biến thành hai đoạn độc lập: $[1, 20]$ và $(20, +oo)$ để thiết lập các công thức đại số tương ứng.
    ]

#step[
      *Thiết lập bảng giá trị phân tích số liệu.*
      
      Để hiểu rõ chiều hướng biến thiên của doanh thu và kết quả tài chính (lợi nhuận/lỗ) của công ty du lịch, ta lập bảng số liệu cho các mốc hành khách điển hình:
      
      #align(center)[
        #table(
          columns: (auto, 1fr, 1.2fr, 1fr, 1.2fr),
          fill: (x, y) => if y == 0 { rgb("E0F2F1") } else if y == 6 { rgb("FFEBEE") } else if y == 3 { rgb("EDE7F6") } else { white },
          stroke: 0.5pt + gray,
          align: center + horizon,
          table.header(
            [*Số khách ($x$)*], [*Đơn giá ($P$)*], [*Doanh thu ($R$)*], [*Chi phí ($C$)*], [*Kết quả (Lãi/Lỗ)*]
          ),
          [10], [30 USD], [300 USD], [400 USD], [Lỗ -100 USD],
          [13], [30 USD], [390 USD], [400 USD], [Lỗ -10 USD],
          [14], [30 USD], [420 USD], [400 USD], [Lãi +20 USD],
          [20], [30 USD], [600 USD], [400 USD], [Lãi +200 USD (Cực đại I)],
          [25], [25 USD], [625 USD], [400 USD], [Lãi +225 USD (Cực đại II)],
          [*40*], [*10 USD*], [*400 USD*], [*400 USD*], [*Hòa vốn (Biên tối đa)*],
          [41], [9 USD], [369 USD], [400 USD], [Lỗ -31 USD]
        )
      ]
    ]

#step[
      *Lời giải chi tiết.*
      
      Hàm doanh thu tổng quát được viết dưới dạng phân đoạn:
      $
      R(x) = cases(
        30x &"nếu" 1 <= x <= 20,
        x(50 - x) = 50x - x^2 &"nếu" x > 20
      )
      $
      Để công ty không bị lỗ, ta giải bất phương trình doanh thu không nhỏ hơn chi phí: $R(x) >= 400$
      - *Phân đoạn 1: $1 <= x <= 20$*
        $30x >= 400 <=> x >= 13.33$. Vì $x$ nguyên nên ta được $14 <= x <= 20$.
      - *Phân đoạn 2: $x > 20$*
        $50x - x^2 >= 400 <=> x^2 - 50x + 400 <= 0$.
        Phương trình $x^2 - 50x + 400 = 0$ có hai nghiệm $x_1 = 10, x_2 = 40$.
        Nghiệm của bất phương trình là $10 <= x <= 40$.
        Kết hợp điều kiện $x > 20$, ta thu được khoảng $20 < x <= 40$.
        
      Kết hợp cả hai phân đoạn, tập số lượng khách để công ty hòa vốn hoặc có lãi là $14 <= x <= 40$.
      Như vậy, giới hạn hành khách tối đa mà công ty nên đặt ra là $40$ người.

      #ans-box[Giới hạn số lượng hành khách tối đa là *40* người.]
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Một ứng dụng gọi xe công nghệ áp dụng biểu phí chuyến đi dài (tính theo km) như sau:
    - $2$ km đầu tiên giá trọn gói là $30$ nghìn đồng.
    - Từ km thứ $3$ đến km thứ $10$, giá cước tăng thêm $15$ nghìn đồng/km.
    - Từ km thứ $11$ trở đi, giá cước tăng thêm $12$ nghìn đồng/km.
    - Đặc biệt, với chuyến đi trên $15$ km, hành khách phải chịu thêm phụ phí cao tốc là $20$ nghìn đồng, nhưng được giảm $10\%$ trên tổng cước cơ bản (không gồm phụ phí).
    
    Hãy xác định quãng đường di chuyển $x$ (km) biết số tiền cước thực tế hành khách phải trả là $209$ nghìn đồng. (Kết quả làm tròn đến chữ số thập phân thứ hai).

  *Đáp số:* $14.92$
]

#reset-step()

#step[
      *Phân tích ý tưởng đằng sau.*
      
      Các hãng xe công nghệ thường thiết kế các biểu phí bậc thang phức tạp: giá km đầu rất cao để bù đắp chi phí xuất bến, giá các km sau giảm dần để khuyến khích đi đường dài. Để điều phối khách hàng đi các tuyến xa mà không ngại phí cầu đường, họ dùng kỹ thuật *Bù trừ giá*: tăng phụ phí cao tốc nhưng giảm giá phần cước cốt lõi. Sự đan xen này vô tình tạo ra các điểm gián đoạn trên đồ thị cước phí, nơi mà đi xa hơn đôi khi lại rẻ hơn đi gần.
    ]

[[[#step[
      *Cách đặt biến số và phân tích miền xác định.*
      
      Gọi $x$ là chiều dài quãng đường di chuyển của khách hàng tính bằng km ($x > 0$).
      Do giá cước thay đổi công thức tại các mốc $2$ km, $10$ km và $15$ km, ta phân chia trục quãng đường thành 4 khoảng để lập hàm: $(0, 2]$, $(2, 10]$, $(10, 15]$, và $(15, +oo)$.
    ]

#step[
      *Lập bảng cơ cấu giá cước.*
      
      Chúng ta lập bảng phân tích biểu phí của ứng dụng xe công nghệ này theo từng cung đường để hiểu rõ cơ chế tính tiền:
      
      #align(center)[
        #table(
          columns: (1.5fr, 1.8fr, 1.8fr, 1.5fr),
          fill: (x, y) => if y == 0 { rgb("E0F2F1") } else if y == 3 { rgb("FFF8E1") } else { white },
          stroke: 0.5pt + gray,
          align: center + horizon,
          table.header(
            [*Quãng đường ($x$)*], [*Cước cơ bản ($T_("cb")$)*], [*Thực trả sau thuế/phụ phí ($T$)*], [*Giá trị tại mốc biên*]
          ),
          [$0 < x <= 2$], [30], [30], [T(2) = 30 nghìn],
          [$2 < x <= 10$], [$30 + 15(x-2)$], [$15x$], [T(10) = 150 nghìn],
          [$10 < x <= 15$], [$150 + 12(x-10)$], [$12x + 30$], [T(15) = 210 nghìn],
          [$x > 15$], [$150 + 12(x-10)$], [$0.9 dot (12x + 30) + 20$], [T(15+) = 209 nghìn]
        )
      ]
    ]

[#step[
      *Lời giải chi tiết.*
      
      Hàm số tính số tiền cước thực tế khách phải trả là:
      $
      T(x) = cases(
        30 &"nếu" 0 < x <= 2,
        15x &"nếu" 2 < x <= 10,
        12x + 30 &"nếu" 10 < x <= 15,
        10.8x + 47 &"nếu" x > 15
      )
      $
      Để xác định quãng đường $x$ ứng với số tiền thanh toán là $209$ nghìn đồng, ta giải phương trình $T(x) = 209$ trên các phân đoạn khả dĩ:
      - *Xét phân đoạn $10 < x <= 15$:*
        $12x + 30 = 209 <=> 12x = 179 <=> x = 14.9167$ (km).
        Giá trị này hoàn toàn nằm trong miền xác định $(10, 15]$.
      - *Xét phân đoạn $x > 15$:*
        $10.8x + 47 = 209 <=> 10.8x = 162 <=> x = 15$ (km).
        Giá trị này không thỏa mãn điều kiện $x > 15$.
        
      Kết luận: Khách hàng đã di chuyển quãng đường dài $14.92$ km.

      #ans-box[Quãng đường di chuyển là *14,92* km.]
    ]


== 7. Tối ưu hóa năng suất nhà máy (Hàm phân đoạn) (CD-NangSuat-NhaMay-ToiUu.typ)
- *Ý tưởng chính:* Tối ưu hóa chi phí và sản lượng nhà máy khi hàm sản xuất có sự thay đổi theo các phân đoạn.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Nếu nhà máy làm việc $46$ giờ/tuần thì số tổ còn lại và năng suất của mỗi tổ trong một giờ lần lượt là:

  *Đáp số:* $98$ tổ; $110$ sp/tổ/giờ / $99$ tổ; $110$ sp/tổ/giờ / $97$ tổ; $110$ sp/tổ/giờ
]

#ans-box[Đáp án đúng là *97 tổ; 105 sp/tổ/giờ*.]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Nếu đặt $x$ là số giờ làm việc trong tuần, biểu thức nào dưới đây mô tả đúng số sản phẩm thu được sau khi trừ phế phẩm?
]

#ans-box[
      Biểu thức đúng là $Q(x)=x(120 - x/2)(220 - 5x/2) - frac(95x^2 + 120x, 4)$.
    ]


= NHÓM 5: HÌNH HỌC OXYZ & CHUYỂN ĐỘNG (SPACE GEOMETRY & MOTION)

== 1. Chuyển động Oxyz & Tầm quét Cảm biến (CD-Oxyz-ChuyenDong-CamBien.typ)
- *Ý tưởng chính:* Mô hình hóa quỹ đạo chuyển động thẳng đều và tính khoảng cách đến trạm cảm biến cố định.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Nhân ngày Nhà giáo Việt Nam, một học sinh đúc tặng thầy giáo một chiếc cốc sứ. Chọn hệ trục tọa độ $O x y$ (đơn vị: cm) với trục $O y$ là trục đối xứng. Chiếc cốc đứng trên mặt phẳng $y = 0$ và có cấu trúc như sau:

    - *Phần thân cốc:* Là khối tròn xoay quanh trục $O y$, bao gồm: mặt ngoài là hình trụ bán kính $R = 4$, chiều cao từ $y = 0$ đến $y = 10$; phần rỗng chứa nước là hình trụ bán kính $r = 3$, từ $y = 2$ đến $y = 10$; phần rỗng ở đáy (đáy lõm) được tạo bởi việc quay parabol $y = 1 - x^2/9$ ($x in [0; 3]$) quanh $O y$.
    - *Phần tay cầm:* Là khối vật thể đặc có thiết diện cắt ngang không đổi $S = 2 c m^2$, trượt dọc theo đường cong tâm $x = 4 + (9 - (y-6)^2)/4$ với $y in [3; 9]$.

    Hỏi thể tích phần sứ cần dùng để đúc toàn bộ chiếc cốc bằng bao nhiêu $c m^3$? (Làm tròn kết quả đến hàng phần trăm).

  *Đáp số:* $273,71$
]

#ppgiai[Thể tích toàn bộ chiếc cốc được tính bằng tổng thể tích phần thân và thể tích phần tay cầm: $V_"tổng" = V_"thân" + V_"tay cầm"$.
      - Để tính $V_"thân"$, ta lấy thể tích khối trụ bao ngoài trừ đi thể tích khối trụ rỗng chứa nước và thể tích phần đáy lõm tròn xoay quanh trục $O y$ theo công thức $V = pi integral_a^b x^2 dif y$.
      - Để tính $V_"tay cầm"$, ta áp dụng công thức tính thể tích vật thể đặc có thiết diện không đổi trượt dọc theo một đường cong tâm: $V = S dot L$, trong đó $L$ là chiều dài đường cong tâm tính bằng tích phân $L = integral_a^b sqrt(1 + [f'(y)]^2) dif y$.
    ]

#step[Tính thể tích phần thân cốc ($V_"thân"$):
      - Thể tích khối trụ bao ngoài cùng ($R = 4, h = 10$):
        $ V_"bao" = pi R^2 h = pi dot 4^2 dot 10 = 160 pi $
      - Thể tích phần rỗng chứa nước ($r = 3, h = 10 - 2 = 8$):
        $ V_"nước" = pi r^2 h = pi dot 3^2 dot 8 = 72 pi $
      - Thể tích phần đáy lõm: Quay parabol $y = 1 - tfrac(x^2, 9) => x^2 = 9(1 - y)$ quanh trục $O y$ với $y in [0; 1]$:
        $ V_"lõm" = pi integral_0^1 x^2 dif y = pi integral_0^1 9(1 - y) dif y = 9 pi [y - tfrac(y^2, 2)]_0^1 = 4,5 pi $
      - Thể tích sứ của phần thân:
        $ V_"thân" = V_"bao" - V_"nước" - V_"lõm" = 160 pi - 72 pi - 4,5 pi = 83,5 pi = tfrac(167, 2) pi $
    ]

#step[Tính thể tích phần tay cầm ($V_"tay cầm"$):
      Đường cong tâm có phương trình $x = f(y) = 4 + tfrac(9 - (y-6)^2, 4) => f'(y) = -tfrac(y-6, 2)$.
      Chiều dài $L$ của đường cong tâm trên đoạn $y in [3; 9]$ là:
      $ L = integral_3^9 sqrt(1 + [f'(y)]^2) dif y = integral_3^9 sqrt(1 + tfrac((y-6)^2, 4)) dif y $
      Đặt $t = y - 6 => dif t = dif y$. Đổi cận: $y = 3 -> t = -3$; $y = 9 -> t = 3$.
      $
        L = integral_(-3)^3 sqrt(1 + tfrac(t^2, 4)) dif t = 2 integral_0^3 tfrac(1, 2) sqrt(4 + t^2) dif t = integral_0^3 sqrt(4 + t^2) dif t
      $
      Sử dụng phương pháp tích phân từng phần hoặc đặt $t = 2 tan u$, ta tính được:
      $
        L = [tfrac(t, 2) sqrt(4+t^2) + 2 ln(t + sqrt(4+t^2))]_0^3 = tfrac(3, 2) sqrt(13) + 2 ln(tfrac(3 + sqrt(13), 2))
      $
      Thể tích phần tay cầm với thiết diện $S = 2 c m^2$ là:
      $
        V_"tay cầm" = S dot L = 2 dot [tfrac(3, 2) sqrt(13) + 2 ln(tfrac(3 + sqrt(13), 2))] = 3 sqrt(13) + 4 ln(tfrac(3 + sqrt(13), 2))
      $]

#step[Tính tổng thể tích chiếc cốc:
      $ V_"tổng" = tfrac(167, 2) pi + 3 sqrt(13) + 4 ln(tfrac(3 + sqrt(13), 2)) approx 273,71 " cm"^3 $]

#reset-step()

#luuy[Khi tính thể tích phần đáy lõm hoặc lòng chứa nước, cần chú ý cận tích phân theo trục tung $O y$. Cận của đáy lõm là từ $y = 0$ đến $y = 1$, còn chiều cao phần chứa nước là độ dài từ $y = 2$ đến $y = 10$.]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trong không gian $O x y z$ (đơn vị là mét), một cảm biến đơn $S$ gắn ở đuôi xe ô tô đang lùi thẳng đều vào gara. Tại thời điểm $t = 0$ (giây), cảm biến ở tọa độ $S_0 (3; 2; 0.8)$. Xe lùi với vận tốc không đổi $arrow(v) = (4; 3; 0)$ (m/s). Bức tường cuối gara nằm trên mặt phẳng $(alpha): 4x + 3y - 35 = 0$. Còi cảnh báo sẽ kêu liên tục ngay khi cảm biến cách bức tường không quá $0.4$ mét.
    Tìm tọa độ của cảm biến $S$ tại thời điểm còi bắt đầu kêu lần đầu tiên?

  *Đáp số:* $(8.48; 6.11; 0.8)$
]

#ppgiai[
      - Tham số hóa tọa độ của cảm biến theo thời gian $t$: $S(t) = (3 + 4t; 2 + 3t; 0.8)$.
      - Tính khoảng cách động từ $S(t)$ đến mặt phẳng $(alpha)$.
      - Giải phương trình khoảng cách bằng $0.4$ để tìm thời điểm $t$ kích hoạt còi.
    ]

#ans-box[
      Tại thời điểm còi kêu, tọa độ cảm biến là $S(0.6) = (5.4; 3.8; 0.8)$.
      *(Lưu ý: Đáp án đề bài đưa ra $S(8.48; 6.11; 0.8)$ là của phiên bản bài toán khác, tọa độ đúng ở đây phải là $(5.4; 3.8; 0.8)$).*
    ]


== 2. Cực trị khoảng cách Đường thẳng & Đường tròn (CD-min-max-DT-DuongTron.typ)
- *Ý tưởng chính:* Cực trị khoảng cách giữa điểm di động trên đường tròn và điểm di động trên đường thẳng.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trong không gian $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 = 9$ và mặt phẳng $(alpha): z = 0$. Gọi $(C)$ là đường tròn giao tuyến của $(S)$ và $(alpha)$. Cho đường thẳng $d: cases(x = 5, z = 0)$. Gọi $M in (C)$, $N in d$. Khoảng cách ngắn nhất $M N$ bằng:

  *Đáp số:* $2$ / $3$ / $5$ / $8$
]

#ppgiai[
      - Vì $d: x = 5, z = 0$ nên $d$ nằm trong mặt phẳng $(alpha)$.
      - Bài toán trở thành hình phẳng: min khoảng cách từ điểm trên $(C)$ đến đường thẳng $d$.
      - $min M N = d(H, d) - r$ khi $d$ nằm ngoài $(C)$.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trong không gian $O x y z$, đường tròn $(C)$ là giao của mặt cầu $x^2 + y^2 + z^2 = 16$ và mặt phẳng $z = 0$. Đường thẳng $d: cases(x + y = 3, z = 0)$. Khoảng cách ngắn nhất giữa $M in (C)$ và $N in d$ bằng:

  *Đáp số:* $0$ / $3 - sqrt(2)/2$ / $4 - 3sqrt(2)/2$ / $1$
]

#ppgiai[
      - Tính khoảng cách từ tâm $H$ đến $d$, so sánh với $r$.
      - Nếu $d(H,d) <= r$ thì $d$ cắt hoặc tiếp xúc $(C)$, suy ra $min M N = 0$.
    ]


== 3. Góc và khoảng cách trong tọa độ Oxyz (CD-Goc-Khoang-Cach.typ)
- *Ý tưởng chính:* Hệ thống công thức và bài tập tính góc giữa hai đường thẳng, hai mặt phẳng và khoảng cách.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Cho khối chóp $S.A B C D$ có đáy là hình vuông cạnh bằng $6 " cm"$, cạnh bên $S A$ vuông góc với mặt phẳng đáy và số đo của góc nhị diện $[B, S C, D]$ bằng $120^degree$. Thể tích của khối chóp $S.A B C D$ bằng bao nhiêu centimet khối?

  *Đáp số:* $72$
]

#ppgiai[
      - Từ tính chất đối xứng của hình chóp có đáy là hình vuông và $S A perp (A B C D)$, mặt phẳng $(S A C)$ là mặt phẳng đối xứng của hệ.
      - Kẻ $B K perp S C$ ($K in S C$). Do tính đối xứng, ta cũng có $D K perp S C$.
      - Góc phẳng nhị diện $[B, S C, D]$ chính là góc $angle B K D$.
      - Dùng định lý hàm số cosin hoặc hệ thức lượng trong tam giác để tính cạnh, từ đó tìm chiều cao $S A$ và tính thể tích.
    ]

#luuy[Góc phẳng nhị diện trong hình chóp có thể là góc tù ($120^degree$), khi đó tâm $O$ sẽ nằm trong đoạn $B D$ nhưng hình chiếu $K$ nằm ngoài đoạn $S C$ hoặc hình dạng tam giác có góc ở đỉnh lớn hơn $90^degree$.]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình vuông tâm $O$ cạnh $a, S A perp (A B C D), S A = a sqrt(3)$. Tính theo $a$ khoảng cách từ điểm $O$ đến mặt phẳng $(S B C)$.

  *Đáp số:* $(2a sqrt(3))/3$ / $(a sqrt(3))/2$ / $a/2$ / $(a sqrt(3))/4$
]

#ppgiai[
      - Sử dụng tính chất tỉ số khoảng cách: đường thẳng $A C$ cắt $(S B C)$ tại $C$, nên $d(O, (S B C)) / d(A, (S B C)) = (O C) / (A C)$.
      - Chân đường cao hình chóp là $A$, ta dựng khoảng cách từ $A$ đến $(S B C)$ bằng cách kẻ $A H perp S B$.
    ]

#meo[Luôn dời điểm cần tính khoảng cách về chân đường cao của khối chóp để dễ dàng dựng đoạn vuông góc chung.]


== 4. Hình học không gian nâng cao (Thể tích & Góc) (CD-HHKG.typ)
- *Ý tưởng chính:* Tính thể tích khối đa diện, khoảng cách và góc bằng phương pháp cổ điển kết hợp tọa độ hóa.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Cho tứ diện $A B C D$ có $d(A, C D)=8$, $d(B, C D)=10$, $d(A B, C D)=5$, $A B=7$. Hãy tính theo đơn vị độ tổng số đo góc nhị diện $[A, C D, B]$ và góc giữa hai đường thẳng $A B, C D$ (không làm tròn ở các phép tính trung gian và kết quả cuối cùng được làm tròn đến hàng đơn vị).

  *Đáp số:* $29$
]

#ppgiai[
      - Mượn một hình hộp chữ nhật làm khung tham chiếu không gian.
      - Chuyển bài toán khoảng cách và góc trong không gian 3D phức tạp về thành các bài toán giải tam giác đơn giản trên các mặt phẳng trực giao (mặt đáy và mặt bên của hình hộp).
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Cho tứ diện $A B C D$ có khoảng cách $d(A, C D)=8$, $d(B, C D)=10$, $d(A B, C D)=5$ và độ dài đoạn $A B=7$. Hãy tính theo đơn vị độ tổng số đo góc nhị diện $[A, C D, B]$ và góc giữa hai đường thẳng $A B, C D$ (không làm tròn ở các phép tính trung gian và kết quả cuối cùng được làm tròn đến hàng đơn vị).

  *Đáp số:* $29$
]

#ppgiai[
      *Tư duy Hình hộp (Bounding Box) giải không gian:*
      Thay vì phải dựng các mặt phẳng phụ phức tạp trong tứ diện, ta "nhúng" tứ diện này vào một không gian trực chuẩn bằng cách:
      - Xem đường thẳng $C D$ là một trục thẳng đứng (trục $O z$).
      - Chiếu vuông góc $A$ và $B$ xuống một mặt phẳng đáy vuông góc với $C D$ tại $O$. Lúc này, bài toán 3D được phân rã thành hai bài toán 2D: Một bài toán diện tích trên mặt đáy và một bài toán Pytago theo chiều cao.
    ]

#meo[Bài toán này là minh chứng đỉnh cao cho "Tư duy hình hộp". Việc ép một tứ diện xiên xẹo vào một hệ trục không gian giả lập (với 1 cạnh làm trục thẳng đứng) giúp ta tránh hoàn toàn việc phải đi tìm điểm chung, kẻ song song hay dựng các mặt cắt phức tạp. Chỉ với Định lý Sin, Côsin cấp 2 và Pytago cấp 2, ta đã giải quyết trọn vẹn một bài toán Vận dụng cao hình không gian!]


== 5. Khoảng cách nhỏ nhất giữa đường thẳng & đường tròn phẳng (min-đường-thẳng-đường-tròn.typ)
- *Ý tưởng chính:* Tìm khoảng cách cực trị trong hệ tọa độ phẳng Oxy.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trong không gian $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 = 9$ và mặt phẳng $(alpha): z = 0$. Gọi $(C)$ là đường tròn giao tuyến của $(S)$ và $(alpha)$. Cho đường thẳng $d$ có phương trình $cases(x = 5, z = 0)$. Gọi $M$ là điểm chạy trên $(C)$, $N$ là điểm chạy trên $d$. Khoảng cách ngắn nhất giữa hai điểm $M$ và $N$ bằng bao nhiêu?

  *Đáp số:* $2$ / $3$ / $5$ / $8$
]

#ppgiai[
      - Bước 1: Vì đường thẳng $d$ có phương trình $z = 0$ nên $d$ nằm trọn trong mặt phẳng $(alpha)$. 
      - Bước 2: Bài toán trở thành tìm khoảng cách từ một điểm $M$ trên đường tròn $(C)$ đến đường thẳng $d$ trong cùng mặt phẳng. $min M N = max(0, d(H, d) - r)$.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Cho đường tròn $(C)$ có tâm $H$, bán kính $r$ nằm trong mặt phẳng $(alpha)$ và đường thẳng $d$ không đi qua $H$. Gọi $M$ là điểm chạy trên $(C)$, $N$ là điểm chạy trên $d$. Xét tính đúng sai của các mệnh đề sau liên quan đến việc tìm khoảng cách nhỏ nhất giữa $M$ và $N$ ($min M N$):

  *Đáp số:* Nếu $d$ nằm trong $(alpha)$ và khoảng cách từ $H$ đến $d$ nhỏ hơn $r$, thì $min M N = 0$. / Nếu $d$ song song với $(alpha)$, thì tại vị trí $M, N$ cho khoảng cách ngắn nhất, đường thẳng $M N$ luôn đi qua tâm $H$. / Tại vị trí $M, N$ cho khoảng cách ngắn nhất, vectơ $arrow(M N)$ luôn vuông góc với vectơ chỉ phương của đường thẳng $d$. / Khi đoạn $M N$ đạt giá trị nhỏ nhất thì $M N$ luôn nằm trọn trong mặt phẳng $(alpha)$.
]

#ppgiai[
      Vận dụng lý thuyết cực trị hình học không gian giữa đường thẳng và đường tròn. Điểm tối ưu đòi hỏi đoạn nối $M N$ phải vuông góc với các phương chuyển động ("hướng trượt") tại các điểm mút.
    ]


== 6. Mặt cầu & Cực trị mặt cầu trong Oxyz (CD-MatCau.typ)
- *Ý tưởng chính:* Các bài toán tương giao giữa mặt cầu và đường thẳng, mặt phẳng và cực trị hình học Oxyz.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trong không gian $O x y z$, coi Trái Đất là một hình cầu có tâm là gốc tọa độ và có bán kính bằng $16$, đơn vị dài trên mỗi trục tọa độ là $400 " km"$, đường xích đạo nằm trong mặt phẳng $(O x y)$. Tại điểm $A(0; 16; 0)$, người ta phóng một tàu vũ trụ (coi như bay thẳng) lên không trung theo hướng của vectơ $vect(u) = (2; 0; 1)$ với tốc độ $10 " km/s"$. Sau khoảng thời gian $3$ phút thì tàu vũ trụ ở vị trí $B$. Gọi $M$ là điểm nằm trên đường xích đạo và gần với $B$ nhất. Hãy xác định theo kilômét độ dài $M B$ (làm tròn kết quả đến hàng đơn vị).

  *Đáp số:* $829$
]

#ppgiai[
      - *Bước 1:* Tính khoảng cách thực tế $A B$, sau đó chia cho $400$ để quy đổi sang đơn vị độ dài của hệ tọa độ $O x y z$.
      - *Bước 2:* Xác định tọa độ điểm $B$ thông qua hệ thức vectơ $vect(A B) = k vect(u)$.
      - *Bước 3:* Đường xích đạo là đường tròn giao tuyến của mặt cầu và mặt phẳng $(O x y)$. Điểm $M$ thuộc xích đạo và gần $B$ nhất chính là giao điểm của tia $O B'$ với đường xích đạo (trong đó $B'$ là hình chiếu vuông góc của $B$ lên mặt phẳng $(O x y)$).
      - *Bước 4:* Áp dụng định lý Pytago trong tam giác vuông $B B' M$ để tính độ dài $M B$, rồi nhân với $400$ để đổi lại sang đơn vị kilômét.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trong không gian $O x y z$, coi Trái Đất là một hình cầu có tâm là gốc tọa độ và có bán kính bằng $10$, đơn vị dài trên mỗi trục tọa độ là $600 " km"$, đường xích đạo nằm trong mặt phẳng $(O x y)$. Tại điểm $A(0; 10; 0)$, người ta phóng một tàu vũ trụ (coi như bay thẳng) lên không trung theo hướng của vectơ $vect(u) = (3; 0; 4)$ với tốc độ $15 " km/s"$. Sau khoảng thời gian $5$ phút thì tàu vũ trụ ở vị trí $B$. Gọi $M$ là điểm nằm trên đường xích đạo và gần với $B$ nhất. Hãy xác định theo kilômét độ dài $M B$ (làm tròn kết quả đến hàng đơn vị).

  *Đáp số:* $3646$
]

#ppgiai[
      Bài toán yêu cầu tính khoảng cách ngắn nhất từ một điểm trong không gian đến một đường tròn nằm trên mặt phẳng tọa độ. Cấu trúc tư duy giải quyết bài toán gồm các bước logic sau:
      - *Bước 1: Đồng bộ hóa đơn vị.* Tính quãng đường bay thực tế của tàu vũ trụ, sau đó quy đổi về số đơn vị đo trong không gian tọa độ $O x y z$ bằng cách chia cho hệ số tỷ lệ ($600 " km"$).
      - *Bước 2: Hình học hóa vị trí.* Sử dụng tính chất của hai vectơ cùng hướng $vect(A B) = k vect(u)$ (với $k = (A B) / (|vect(u)|)$) để tìm chính xác tọa độ không gian của điểm $B$.
      - *Bước 3: Phân tích cực trị hình học.* Đường xích đạo là đường tròn $(C)$ tâm $O$, bán kính $R=10$ nằm trong mặt phẳng $(O x y)$. Điểm $M$ thuộc $(C)$ sao cho khoảng cách $M B$ là nhỏ nhất. Bằng bất đẳng thức tam giác, ta chứng minh được $M$ phải nằm trên đoạn thẳng $O B'$, với $B'$ là hình chiếu vuông góc của $B$ lên $(O x y)$.
      - *Bước 4: Tính toán tổng hợp.* Sử dụng định lý Pytago trong tam giác vuông $B B' M$ để tính khoảng cách tọa độ $M B$, cuối cùng nhân ngược với hệ số tỷ lệ để trả về khoảng cách thực tế.
    ]


== 7. Quỹ đạo Parabol có vận tốc trong Oxyz (Parabol-Oxyz-Có-Vận-Tốc.typ)
- *Ý tưởng chính:* Quỹ đạo ném xiên của vật thể dưới tác dụng của trọng lực trong hệ tọa độ Oxyz.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Cho khối nón $(N)$ có chiều cao $h=10$ và bán kính đáy $R=5$. Cắt khối nón $(N)$ bởi một mặt phẳng $(alpha)$ đi qua tâm của đường tròn đáy và song song với một đường sinh của hình nón, thiết diện thu được là một hình parabol. Tính diện tích của thiết diện đó.

  *Đáp số:* $(50 sqrt(5))/3$
]

#ppgiai[
      - Gắn hệ trục tọa độ $O x y z$ với gốc $O(0; 0; 0)$ là tâm đáy nón, đỉnh $S(0; 0; 10)$ trên trục $O z$.
      - Viết phương trình mặt nón: $z = 10 - 2 sqrt(x^2 + y^2)$.
      - Mặt phẳng cắt $(alpha)$ đi qua $O x$ (giao tuyến với đáy) và song song với đường sinh nằm trong mặt phẳng $O y z$.
      - Viết phương trình mặt phẳng $(alpha)$ và giải hệ để tìm phương trình hình chiếu của parabol.
      - Xác định độ rộng đáy $a$ và chiều cao $h_p$ (chiều dài $O M$ trong không gian) của parabol, từ đó tính diện tích $S = 2/3 a h_p$.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Cho khối nón $(N)$ có đỉnh $S$, chiều cao $h=10$ và bán kính đáy $R=5$. Cắt khối nón $(N)$ bởi một mặt phẳng $(alpha)$ đi qua tâm $O$ của đáy và song song với một đường sinh của khối nón. Biết thiết diện thu được là một hình parabol. Tính diện tích $S$ của thiết diện đó.

  *Đáp số:* $(50 sqrt(5))/3$
]

#ppgiai[
      - Thiết lập hệ trục tọa độ $O x y z$: $O(0,0,0)$ là tâm đáy, $S(0,0,10)$ là đỉnh.
      - Mặt phẳng $(alpha)$ đi qua $O x$ và song song với đường sinh $S B$ (với $B(0, -5, 0)$).
      - Phương trình $(alpha): z = 2y$. Giao tuyến với mặt nón $x^2 + y^2 = (R/h (h-z))^2$.
      - Diện tích Parabol: $S = 2/3 . "đáy" . "chiều cao"$.
    ]


== 8. Quỹ đạo chuyển động của Quả cầu trong Oxyz (Quả-Cầu-Di-Chuyển.typ)
- *Ý tưởng chính:* Mô phỏng chuyển động của mặt cầu và tính khoảng cách tiếp xúc với các chướng ngại vật.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trong không gian $O x y z$ có đơn vị dài trên mỗi trục là centimet, cho một quả cầu $(S)$ có bán kính bằng $30" cm"$, ở thời điểm ban đầu $t_0 = 0$ có tọa độ tâm là $I_0(20;10;0)$ và hai điểm cố định trong không gian có tọa độ $A(25;56;9)$, $B(21;59;24)$.
  Quả cầu $(S)$ bắt đầu chuyển động tịnh tiến theo hướng véctơ $vect(u)=(0;3;2)$ với tốc độ $8" cm/s"$. Biết rằng quả cầu bị dừng lại ngay khi va chạm vào một trong hai điểm $A$ hoặc $B$. Hãy tính theo đơn vị giây thời điểm mà quả cầu này bị dừng lại (_không làm tròn các phép tính trung gian và kết quả cuối cùng được làm tròn đến hàng phần trăm_)?

  *Đáp số:* $2,48$
]

#ppgiai[
      - Từ véctơ chỉ phương và tốc độ, ta xác định được véctơ vận tốc $vect(v)$.
      - Thiết lập phương trình chuyển động của tâm $I(t)$ theo thời gian $t$.
      - Quả cầu va chạm với điểm $X$ khi khoảng cách từ tâm $I$ đến $X$ đúng bằng bán kính $R$, tức là $I X = R$.
      - Giải phương trình $I A = R$ và $I B = R$ để tìm các thời điểm va chạm. Điểm nào cho nghiệm $t$ nhỏ hơn sẽ là điểm bị va chạm trước, và đó cũng là thời điểm quả cầu dừng lại.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trong không gian với hệ tọa độ $O x y z$ (đơn vị trên các trục là km), một trạm ra-đa kiểm soát không lưu được đặt tại vị trí $I(5; 5; 4)$ có khả năng phát hiện các vật thể bay trong phạm vi hình cầu bán kính $R = 9" km"$. Một thiết bị bay không người lái (drone) xuất phát từ điểm $A(-4; -7; 1)$ bay thẳng với tốc độ không đổi là $6" km/phút"$, hướng bay cùng hướng với véctơ $vect(u) = (2; 2; 1)$. 
  Hãy tính thời gian (theo đơn vị phút) mà drone nằm hoàn toàn trong vùng phủ sóng của trạm ra-đa? (_Không làm tròn các phép tính trung gian, kết quả cuối cùng làm tròn đến hàng phần trăm_).

  *Đáp số:* $2,83$
]

#ppgiai[
      - Từ véctơ hướng $vect(u)$ và tốc độ $v$, xác định véctơ vận tốc $vect(v)$ của drone.
      - Viết phương trình tham số biểu diễn tọa độ $(x; y; z)$ của drone theo thời gian $t$.
      - Drone nằm trong vùng ra-đa khi khoảng cách từ nó đến tâm $I$ nhỏ hơn hoặc bằng bán kính $R$. Thiết lập bất phương trình $I M^2 <= R^2$ theo ẩn $t$.
      - Giải bất phương trình để tìm khoảng thời gian $[t_1; t_2]$, khoảng thời gian drone bay trong vùng chính là $Delta t = t_2 - t_1$.
    ]


== 9. Quỹ đạo tròn & Cực trị khoảng cách trong Oxyz (CD-QuyDaoTron-KhoangCach.typ)
- *Ý tưởng chính:* Tìm khoảng cách lớn nhất, nhỏ nhất từ một điểm trên đường tròn nghiêng đến một đường thẳng hoặc mặt phẳng.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trong không gian $O x y z$ (đơn vị: mét), mặt đất là $z + 8 = 0$. Vật $M$ chuyển động trên quỹ đạo tròn, qua ba điểm $A(1; 0; 6)$, $B(3; 2; 4)$, $C(5; 0; 4)$. Tính khoảng cách ngắn nhất từ vật đến mặt đất (làm tròn đến hàng phần trăm).

  *Đáp số:* $d_(min) = 14 - (3sqrt(2))/2 - 8 approx ...$
]

#ppgiai[Thực hiện y hệt bài toán nguồn: tìm $(alpha)$, tâm $H$, bán kính $r$, rồi $z_(min) = z_H - r/sqrt(2)$ (nếu $(alpha): y + z = c$).]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trong không gian $O x y z$ (đơn vị: mét), mặt đất là $z + 5 = 0$. Vật $M$ chuyển động trên quỹ đạo tròn qua $A(0; 0; 7)$, $B(4; 0; 7)$, $C(2; 3; 7)$. Khoảng cách ngắn nhất từ vật đến mặt đất là bao nhiêu mét?

  *Đáp số:* $12 "m"$
]

#meo[Khi mặt phẳng quỹ đạo song song với mặt đất, khoảng cách từ mọi điểm trên quỹ đạo đến mặt đất là như nhau — bằng khoảng cách giữa hai mặt phẳng đó. Không cần tìm tâm hay bán kính.]


== 10. Đường Parabol trong không gian tọa độ Oxyz (Parabol-Oxyz.typ)
- *Ý tưởng chính:* Phương trình và tính chất của đường cong Parabol nằm trong một mặt phẳng nghiêng trong Oxyz.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trên bức tường cần trang trí một hình phẳng dạng parabol đỉnh $S$ như hình vẽ, biết rằng $S O = A B = 4"m"$, $O$ là trung điểm của $A B$. Parabol được chia thành 3 phần để sơn ba màu khác nhau với mức chi phí: phần trên là phần kẻ sọc $140.000$ đồng/$"m"^2$, phần giữa là phần hình quạt tâm $O$ có bán kính $2"m"$ được tô đậm $150.000$ đồng/$"m"^2$, phần còn lại $160.000$ đồng/$"m"^2$. Tổng chi phí để sơn cả ba phần gần nhất với số nào sau đây (làm tròn đến nghìn đồng)?

  *Đáp số:* $1575$
]

#ppgiai[
      - Gắn hệ trục tọa độ $O x y$ với $O(0;0)$. Xác định phương trình parabol $(P)$ và phương trình đường tròn $(C)$ giới hạn hình quạt.
      - Tìm hoành độ giao điểm của $(P)$ và $(C)$.
      - Sử dụng tích phân tính diện tích các phần:
        + Tổng diện tích parabol $S = integral_(-2)^2 (4 - x^2) dif x$.
        + Phần giao giữa Parabol và nửa đường tròn (phần giữa + phần kẻ sọc).
        + Diện tích hình quạt tròn $S_"quạt" = 1/2 R^2 alpha$.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Chuẩn bị cho đêm hội hóa trang, Bạn A thiết kế một chiếc mũ có dáng một khối tròn xoay. Mặt cắt qua trục của chiếc mũ như hình vẽ bên dưới. Biết rằng $O O' = 6" cm"$, $O A = 10" cm"$, $O B = 20" cm"$, đường cong $A B$ là một phần của parabol có đỉnh là điểm $B$. Tính thể tích của chiếc mũ (làm tròn đến hàng đơn vị).

  *Đáp số:* $5027$
]

#ppgiai[
      - Thể tích chiếc mũ bằng tổng thể tích của hai phần: Phần chóp ở trên (quay đường cong parabol) và phần đế ở dưới (hình trụ).
      - *Phần hình trụ:* Hình trụ có bán kính đáy $R = O A$ và chiều cao $h_1 = O O'$. Tính $V_1 = pi R^2 h_1$.
      - *Phần chóp parabol:* Gắn hệ trục tọa độ $O x y$ với $O(0;0)$, viết phương trình parabol $(P)$ đi qua $A$ có đỉnh $B$. Sau đó dùng tích phân tính thể tích khối tròn xoay quay $(P)$ quanh trục $O y$: $V_2 = pi integral x^2 dif y$.
    ]


== 11. Đường thẳng trong không gian Oxyz (CD-DuongThang-Oxyz.typ)
- *Ý tưởng chính:* Khảo sát phương trình tham số, vị trí tương đối và các bài toán cực trị hình học liên quan đến đường thẳng.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Cho $d_1: cases(x = 1 + 2t, y = -1 + t, z = 3 - t)$ và $d_2: cases(x = 3 + s, y = 1 - s, z = 1 + s)$. Vị trí tương đối của $d_1$ và $d_2$ là:

  *Đáp số:* Trùng nhau / Song song / Cắt nhau / Chéo nhau
]

#ppgiai[
      - Kiểm tra hai VTCP có song song không.
      - Kiểm tra điểm chung bằng hệ $3$ phương trình, $2$ ẩn $t, s$.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trong không gian $O x y z$, tính khoảng cách từ điểm $M(3; 1; -2)$ đến đường thẳng $d: cases(x = 1 + t, y = 2 - 2t, z = 3 + 2t)$.

  *Đáp số:* $sqrt(6)$
]

#ppgiai[
      $d(M, d) = (|vect(A M) times vect(u)|)/(|vect(u)|)$ với $A$ là điểm trên $d$, $vect(u)$ là VTCP.
    ]

#luuy[Kiểm tra lại: $(sqrt(26))^2 = 26$. Thực ra $sqrt(234)/3 = sqrt(234/9) = sqrt(26)$. Vậy $d(M,d) = sqrt(26)$, không phải $sqrt(6)$ — cần đặt bài lại.]


= NHÓM 6: ĐƯỜNG CONIC & SỰ TIẾP XÚC ĐƯỜNG CONG (CONIC SECTIONS & TANGENCY)

== 1. Ba đường Conic đầy đủ (Elip, Parabol, Hyperbol) (CD-Conic-DayDu.typ)
- *Ý tưởng chính:* Tổng ôn toàn diện về phương trình chính tắc, tiêu điểm, tiêu cự và tâm sai của ba đường Conic.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trong mặt phẳng $O x y$, cho hai điểm $F_1(-3, 0)$ và $F_2(3, 0)$. Gọi $(E)$ là tập hợp các điểm $M$ thỏa mãn $|M F_1| + |M F_2| = 10$.

  *Đáp số:* Phương trình của $(E)$ là $frac(x^2, 25) + frac(y^2, 16) = 1$. / Diện tích hình phẳng giới hạn bởi $(E)$ bằng $20 pi$. / Thể tích khối tròn xoay thu được khi quay hình Elip quanh trục $O x$ bằng $frac(320 pi, 3)$. / Thể tích khối tròn xoay thu được khi quay hình Elip quanh trục $O y$ bằng $frac(400 pi, 3)$.
]

#loigiai-box[
#lythuyet(title: [Nhận diện: Elip từ điều kiện tổng khoảng cách])[
      Tập hợp các điểm $M$ có *tổng khoảng cách đến hai tiêu điểm bằng hằng số* $2a$ chính xác là một *Elip*. Công thức xác định: $|M F_1| + |M F_2| = 2a$, tiêu cự $c = |O F_1|$, bán trục phụ $b^2 = a^2 - c^2$.
    ]

    *Ý (a):* Từ đề bài: $2a = 10 => a = 5$; $c = |O F_1| = 3$; $b^2 = a^2 - c^2 = 25 - 9 = 16$.
    Phương trình Elip: $frac(x^2, 25) + frac(y^2, 16) = 1$. ✓

    *Ý (b):* Diện tích Elip theo công thức: $S = pi a b = pi dot 5 dot 4 = 20 pi approx 62","83$. ✓

    *Ý (c):* Xoay hình Elip quanh $O x$. Từ PT Elip: $y^2 = 16 (1 - frac(x^2, 25))$.
    $
      V_x = pi integral_(-5)^5 y^2 dif x = pi dot 16 integral_(-5)^5 (1 - frac(x^2, 25)) dif x = 16 pi [x - frac(x^3, 75)]_(-5)^5
    $
    $
      = 16 pi [(5 - frac(125, 75)) - (-5 + frac(125, 75))] = 16 pi dot 2 (5 - frac(5, 3)) = 16 pi dot 2 dot frac(10, 3) = frac(320 pi, 3)
    $
    _(Kiểm chứng: CT tắt $V = frac(4, 3) pi a b^2 = frac(4, 3) pi dot 5 dot 16 = frac(320 pi, 3)$)_. ✓

    *Ý (d):* Xoay hình Elip quanh $O y$. Từ PT Elip: $x^2 = 25 (1 - frac(y^2, 16))$.
    $
      V_y = pi integral_(-4)^4 x^2 dif y = pi dot 25 integral_(-4)^4 (1 - frac(y^2, 16)) dif y = 25 pi [y - frac(y^3, 48)]_(-4)^4
    $
    $
      = 25 pi dot 2 (4 - frac(64, 48)) = 25 pi dot 2 dot frac(8, 3) = frac(400 pi, 3)
    $
    _(Kiểm chứng: CT tắt $V = frac(4, 3) pi b a^2 = frac(4, 3) pi dot 4 dot 25 = frac(400 pi, 3)$)_. ✓
]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trong mặt phẳng $O x y$, cho điểm $F(0, 2)$ và đường thẳng $Delta: y = -2$. Hình phẳng $(H)$ được giới hạn bởi parabol $(P): x^2 = 8y$ và đoạn thẳng $y = 4$. Tính diện tích hình phẳng $(H)$ (đơn vị cm²).

  *Đáp số:* $frac(64, 3)$
]

#loigiai-box[
#lythuyet(title: [Nhận diện: Parabol từ tiêu điểm và đường chuẩn])[
      Tập hợp $M$ có $|M F| = d(M, Delta)$ chính là Parabol. Với $F(0,2)$ và $Delta: y=-2$, khoảng cách từ tâm $O$ đến $Delta$ là $p = 2$. Phương trình Parabol: $x^2 = 4 dot 2 dot y = 8y$, đỉnh tại gốc tọa độ. ✓
    ]

    *Bước 1: Giao điểm $(P)$ và $y = 4$:*
    Thay $y = 4$ vào $x^2 = 8y$: $x^2 = 32 => x = plus.minus 4 sqrt(2)$.

    *Bước 2: Tính diện tích:*
    $
      S = integral_(-4sqrt(2))^(4sqrt(2)) (4 - frac(x^2, 8)) dif x = [4x - frac(x^3, 24)]_(-4sqrt(2))^(4sqrt(2))
    $
    $
      = 2 (4 dot 4sqrt(2) - frac((4sqrt(2))^3, 24)) = 2 (16sqrt(2) - frac(128sqrt(2), 24)) = 2 sqrt(2) (16 - frac(16, 3)) = 2sqrt(2) dot frac(32, 3) = frac(64sqrt(2), 3)
    $

    *Lưu ý:* Hoặc đổi biến tích phân theo $y$:
    $
      S = integral_0^4 2 sqrt(8y) dif y = 4sqrt(2) integral_0^4 y^(1/2) dif y = 4sqrt(2) dot frac(2, 3) dot 4^(3/2) = 4sqrt(2) dot frac(16, 3) = frac(64sqrt(2), 3) approx 30","17 "cm"^2
    $
]


== 2. Diện tích hình phẳng giới hạn bởi đường Conic ẩn (Dien-Tich-Conic-Ẩn.typ)
- *Ý tưởng chính:* Tính diện tích hình phẳng khi phương trình Conic chưa ở dạng chính tắc.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Cho hình vuông $A B C D$ có $A B = 60 sqrt(2)$ cm. Gọi $(H)$ là tập hợp các điểm $M$ nằm trong hình vuông $A B C D$ và thỏa mãn $d(M; B D) - 20 >= M A$. Hãy tính diện tích hình phẳng $(H)$ theo đơn vị centimét vuông (_làm tròn kết quả đến hàng đơn vị_).

  *Đáp số:* $350$
]

#ppgiai(title: [Tư duy Dời trục $O y$ (Smart Axis Shift)])[
      Thay vì giữ hệ trục cũ ở tâm hình vuông làm phương trình cồng kềnh, ta *chủ động chọn trục tung $O Y$ mới trùng ngay với đường chuẩn $Delta'$*.
      Mọi biểu thức sẽ tự động trở về dạng chính tắc tối giản nhất!
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Cho hình vuông $A B C D$ có $A B = 100 sqrt(2)$ cm. Gọi $(H)$ là tập hợp các điểm $M$ nằm trong hình vuông $A B C D$ và thỏa mãn $d(M; B D) - 50 >= M A$. Hãy tính diện tích hình phẳng $(H)$ theo đơn vị centimét vuông (_làm tròn kết quả đến hàng đơn vị_).

  *Đáp số:* $547$
]

#ppgiai(title: [Tư duy Dời trục $O y$ (Smart Axis Shift)])[
      Thay vì giữ hệ trục cũ ở tâm hình vuông làm phương trình cồng kềnh, ta *chủ động chọn trục tung $O Y$ mới trùng ngay với đường chuẩn $Delta'$*.
      Mọi biểu thức sẽ tự động trở về dạng chính tắc tối giản nhất!
    ]


== 3. Sự tiếp xúc của hai đường cong (CD-Sự-Tiếp-Xúc-2-Đường-Cong.typ)
- *Ý tưởng chính:* Điều kiện tiếp xúc (chung điểm và chung tiếp tuyến) của parabol, đường tròn, đường thẳng.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Nửa phải của rãnh một chiếc *nhẫn cưới* được tạo bởi hai nét ghép trơn:
    - Cung parabol $y = x^2 - 1$ từ $V(0; -1)$ đến $N(1; 0)$.
    - Một cung tròn ghép trơn với parabol tại $N$, có tâm nằm trên trục $O y$.

    Hãy tìm tâm $I$, bán kính $R$ của cung tròn. Sau đó tính thể tích khối tạo bởi miền giới hạn bởi cung parabol, trục $O y$ và đường thẳng $y = 0$ khi quay quanh $O y$.

  *Đáp số:* 1.57
]

#reset-step()

#step[
      *Tìm tâm cung tròn.*

      Parabol có đạo hàm $y' = 2x$. Tại $N(1; 0)$, hệ số góc tiếp tuyến là $2$, nên pháp tuyến có hệ số góc $-frac(1, 2)$.

      Pháp tuyến qua $N$ có phương trình:
      $y = -frac(1, 2)(x - 1).$

      Tâm cung tròn nằm trên trục $O y$, nên thay $x = 0$ ta được:
      $I(0; frac(1, 2)).$
    ]

#step[
      *Tính bán kính và lập tích phân thể tích.*

      $R = I N = sqrt(1^2 + (frac(1, 2))^2) = frac(sqrt(5), 2).$

      Với miền quay quanh $O y$, ta đổi theo biến $y$:
      $y = x^2 - 1 => x^2 = y + 1,$
      với $-1 <= y <= 0$.

      Do đó:
      $V = pi integral_(-1)^0 (y + 1) dif y.$
    ]

#step[
      *Tính ra đáp số.*

      $V = pi (frac(y^2, 2) + y)|_(-1)^0 = frac(pi, 2) approx 1.57.$

      #nhanxet[Đáp số tô phiếu: *1.57*. Bài này phải tách rõ hai việc: ghép trơn để tìm tâm, rồi mới chuyển sang tích phân tròn xoay.]
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Mặt trong của một *cái chén thủy tinh* là parabol tròn xoay $y = x^2$ (đơn vị cm). Một viên bi cầu bán kính $r$ được thả vào chén, tâm bi là $I(0; H)$ và bi tiếp xúc với thành chén theo một vòng tròn.

    Hãy chứng minh $r^2 = H - frac(1, 4)$. Sau đó, với $r = frac(sqrt(3), 2)$ cm, tính thể tích chất lỏng có thể đổ vào chén khi mực nước ngang đúng qua tâm bi.

  *Đáp số:* 0.21
]

#reset-step()

#step[
      *Thiết lập điều kiện tiếp xúc.*

      Gọi $N(x_0; x_0^2)$ là điểm tiếp xúc trên parabol. Vì $y = x^2$ nên $y' = 2x$, do đó pháp tuyến tại $N$ có hệ số góc $-frac(1, 2x_0)$.

      Đường thẳng $I N$ cũng là pháp tuyến, nên:
      $frac(H - x_0^2, 0 - x_0) = -frac(1, 2x_0) => H = x_0^2 + frac(1, 2).$
    ]

#step[
      *Rút ra hệ thức giữa $r$ và $H$.*

      $r^2 = I N^2 = x_0^2 + (H - x_0^2)^2 = x_0^2 + frac(1, 4).$

      Thay $x_0^2 = H - frac(1, 2)$, ta được:
      $r^2 = H - frac(1, 4).$
    ]

#step[
      *Thế số để tính thể tích chất lỏng.*

      Với $r = frac(sqrt(3), 2)$ thì $r^2 = frac(3, 4)$, nên:
      $H = r^2 + frac(1, 4) = 1.$

      Thể tích phần chén đến cao độ $y = 1$ là:
      $V_"chén" = pi integral_0^1 y dif y = frac(pi, 2).$

      Mực nước đi qua tâm bi nên phần bi chìm đúng là *nửa dưới* của hình cầu:
      $V_"bi" = frac(2pi r^3, 3) = frac(2pi (frac(sqrt(3), 2))^3, 3) = frac(pi sqrt(3), 4).$

      Vậy:
      $V_"lỏng" = frac(pi, 2) - frac(pi sqrt(3), 4) approx 0.21.$

      #nhanxet[Đáp số tô phiếu: *0.21*. Trọng tâm sư phạm là nhận ra mực nước qua tâm bi thì phần bi chiếm chỗ đúng bằng *nửa khối cầu*.]
    ]


== 4. Thiết diện Parabol của hình nón (CD-Thiet-Dien-Parabol-Hinh-Non.typ)
- *Ý tưởng chính:* Thiết diện cắt bởi mặt phẳng song song với một đường sinh của hình nón là một Parabol. Tính diện tích thiết diện.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Cắt hình nón tròn xoay bởi một mặt phẳng $(alpha)$ song song với đúng *một*
    đường sinh và không đi qua đỉnh. Thiết diện thu được là đường conic loại nào?

  *Đáp số:* Elip / Hyperbol / Parabol / Đường tròn
]

#reset-step()

#step[Theo định lý Apollonius, mặt phẳng song song *đúng một* đường sinh của hình nón cho thiết diện là *parabol*.]

#step[Nhận nhanh các trường hợp còn lại: song song với *không* đường sinh thì được elip hoặc đường tròn; đi qua đỉnh cho hai đường thẳng; song song với hai đường sinh cho hyperbol.]

#reset-step()

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Cho hình nón đỉnh $S$, đáy tâm $O$ bán kính $R = 3$, chiều cao $H = 6$.
    Mặt phẳng $(alpha)$ song song đường sinh $S M$ ($M = (-3, 0, 0)$) và cắt đoạn $O N$
    ($N=(3,0,0)$) tại điểm có hoành độ $k = 1$.
    Tọa độ đỉnh $V$ của parabol thiết diện là:

  *Đáp số:* $(3/2, 0, 3)$ / $(2, 0, 2)$ / $(2, 0, 1)$ / $(5/2, 0, 1)$
]

#reset-step()

#step[Với $R=3$, $H=6$, $k=1$ ta có $H/R = 2$. Công thức đỉnh cho bởi
      $x_V = (R+k)/2 = (3+1)/2 = 2$.]

#step[Tung độ cao của đỉnh là
      $z_V = (H/R)(x_V-k) = 2(2-1) = 2$.]

#step[Vậy $V = (2, 0, 2)$. Kiểm tra lại trên mặt phẳng cắt $z = 2(x-1)$: tại $x=2$ thì $z=2$, hoàn toàn khớp.]

#reset-step()


== 5. Tích phân & Khối tròn xoay từ đường Conic (CD-Conic-KhoiQuay.typ)
- *Ý tưởng chính:* Tính thể tích nước trong bể hình Paraboloid hoặc Ellipsoid xoay tròn bằng tích phân phân lát.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trong không gian $O x y z$ (đơn vị: mét), hình phẳng $(H)$ nằm trong mặt phẳng $(O y z)$, được giới hạn bởi parabol $(P)$ và hai đoạn $C D$, $C' D'$ như hình vẽ. Hình không gian $(K)$ có hai đáy dạng $(H)$ và chiều dài $2$ m. Bể nước hình $(K)$, đáy $A B C D$ kín nằm dưới, miệng $A' B' C' D'$ để hở. Vòi nước lưu lượng không đổi $0","02 space (m^3 \/ "phút")$ chảy vào bể.

  *Đáp số:* Phương trình parabol $(P)$ là $z = 25/9 y^2 - 0","2$. / Diện tích hình phẳng $(H)$ bằng $0","73 space m^2$ (làm tròn đến hàng phần trăm). / Thời gian để nước chảy đầy bể là $72","8$ phút (làm tròn đến hàng phần mười). / Sau $60$ phút, chiều cao mực nước so với đáy bằng $0","69$ m (làm tròn đến hàng phần trăm).
]

#step([Lập phương trình parabol $(P)$])

#step([Tính diện tích $(H)$])

#step([Thể tích và thời gian đầy bể])

#step([Mực nước sau 60 phút])

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trong không gian $O x y z$ (đơn vị: mét), hình phẳng $(H)$ nằm trong mặt phẳng $(O y z)$, là nửa dưới của elip $(E): y^2/4 + z^2/1 = 1$ ($z <= 0$), tịnh tiến lên trên $1$ m. Cụ thể $(H)$ là vùng giới hạn bởi elip $(E'): y^2/4 + (z-1)^2 = 1$ với $z >= 0$ và đoạn $C D$ nằm trên trục $y$ ($z=0$). Một bể nước $(K)$ có chiều dài $3$ m, hai đáy hình $(H)$, đáy phẳng nằm ở $z=0$, miệng là đường elip phía trên. Lưu lượng vòi nước $0","03 space (m^3 \/ "phút")$.

  *Đáp số:* Chiều rộng mặt cắt ngang tại cao độ $z$ ($0 <= z <= 1$) là $w(z) = 4 sqrt(1 - (z-1)^2) = 4 sqrt(z(2-z))$. / Diện tích $(H)$ bằng $pi approx 3","14 space m^2$ (làm tròn đến hàng phần trăm). / Thể tích bể $(K)$ bằng $6 space m^3$. / Sau $100$ phút, mực nước cao hơn $0","43$ m so với đáy (làm tròn đến hàng phần trăm).
]

#step([Chiều rộng mặt cắt ngang])

#step([Diện tích $(H)$])

#step([Thể tích bể])

#step([Mực nước sau 100 phút])


= NHÓM 7: MÔ HÌNH HÓA VẬT LÝ & CƠ HỌC THỰC TẾ (PHYSICAL MODELING)

== 1. Bài toán Hai con bò (Tối ưu vị trí chăn thả) (CD-Hai-con-bo.typ)
- *Ý tưởng chính:* Tìm khoảng cách ngắn nhất để hai con bò di chuyển đến bờ sông uống nước rồi về chuồng.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Từ điểm $A$ trên mặt đất hai con bọ rùa I và II bò sát mặt đất theo hai hướng tạo với nhau một góc $50^degree$, với tốc độ lần lượt là $4 " cm/s"$ và $5 " cm/s"$, sau đó $20$ giây thì hai con bọ rùa bắt đầu đổi hướng bay lên trên không theo hai hướng vuông góc với các hướng ban đầu của chúng. Do lúc bò ở mặt đất con bọ rùa II bò nhanh quá nên thấm mệt và khi chuyển động trên không tốc độ của nó chỉ bằng một nửa con bọ rùa I. Biết rằng hai con bọ rùa này gặp nhau tại điểm $B$. Hãy xác định độ cao của điểm $B$ so với mặt đất theo đơn vị centimet (_làm tròn kết quả đến hàng phần mười_)?

  *Đáp số:* $27,9$
]

#ppgiai[
      - *Mô hình hóa hình học:* Đặt gốc tọa độ tại điểm xuất phát $A(0;0;0)$, mặt đất là mặt phẳng tọa độ $O x y$. Trục $O z$ hướng thẳng đứng lên trên.
      - Tại thời điểm bắt đầu bay, hai con bọ ở các vị trí $M_1$ và $M_2$ trên mặt đất. Quãng đường bò $s = v dot t$.
      - Hướng bay "vuông góc với hướng ban đầu" có nghĩa là mặt phẳng chứa quỹ đạo bay vuông góc với các vectơ hướng bò $vect(A M_1)$ và $vect(A M_2)$. Do đó, hình chiếu vuông góc $H$ của điểm gặp nhau $B$ lên mặt đất phải thỏa mãn: $M_1 H perp A M_1$ và $M_2 H perp A M_2$.
      - Khai thác tỉ lệ tốc độ bay để lập phương trình liên hệ khoảng cách: $M_1 B = 2 M_2 B$.
      - Sử dụng định lý Pythagore trong các tam giác vuông để giải tìm độ cao $h = B H$.
    ]

#meo[
      Điểm mấu chốt của bài này là nhận ra ý nghĩa hình học của cụm từ "hướng bay vuông góc với hướng ban đầu". Nó ám chỉ rằng *hình chiếu* của điểm $B$ xuống mặt đất chính là giao điểm của hai đường thẳng vuông góc với hai tia quỹ đạo $A M_1, A M_2$ tại các điểm mút $M_1, M_2$. Việc dùng Pytago ($A H^2 - A M_2^2$) giúp né được phép khai triển tọa độ phức tạp cho độ dài $M_2 H^2$.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Hai chiếc flycam I và II xuất phát cùng lúc từ điểm $O$ trên một bãi đất phẳng. Chúng bay ở độ cao là mặt phẳng đất theo hai hướng tạo với nhau một góc $60^degree$. Tốc độ bay ngang của flycam I là $6 " m/s"$ và flycam II là $10 " m/s"$. Sau đúng $5$ giây, hệ thống tự động điều khiển cả hai chiếc flycam cùng lúc đổi hướng bay thẳng lên trên trời. Biết quỹ đạo bay lên của mỗi chiếc nằm trong mặt phẳng vuông góc với mặt đất và vuông góc với hướng bay ngang ban đầu của chúng. Tốc độ bay lên theo phương thẳng đứng của flycam I gấp $2$ lần tốc độ bay lên của flycam II. Giả sử hai chiếc flycam này va chạm nhau tại điểm $B$ trên không trung. Hãy xác định độ cao của điểm $B$ so với mặt đất theo đơn vị mét (_làm tròn kết quả đến hàng phần mười_)?

  *Đáp số:* $22,4$
]

#ppgiai[
      - *Bước 1 (Mô hình hóa):* Gắn hệ trục tọa độ $O x y z$ với $O$ là điểm xuất phát, mặt đất là mặt phẳng $(O x y)$. Trục $O z$ hướng thẳng lên trời.
      - *Bước 2 (Tìm tọa độ mặt đất):* Tính quãng đường di chuyển ngang sau thời gian $t$. Dùng lượng giác để xác định tọa độ $M_1, M_2$ của hai flycam trước khi bay lên.
      - *Bước 3 (Xác định hình chiếu):* Khai thác giả thiết quỹ đạo bay thẳng lên "vuông góc với hướng bay ngang ban đầu". Điều này đồng nghĩa hình chiếu $H$ của điểm gặp nhau $B$ xuống mặt đất phải thỏa mãn: $M_1 H perp O M_1$ và $M_2 H perp O M_2$.
      - *Bước 4 (Thiết lập phương trình):* Tính tọa độ $H$. Sử dụng tỉ lệ tốc độ bay thẳng đứng để lập phương trình liên hệ giữa các quãng đường $M_1 B$ và $M_2 B$, từ đó tính độ cao $h$.
    ]

#meo[
      Việc sử dụng trực tiếp công thức khoảng cách tọa độ $M_2 H^2 = (x_H - x_(M_2))^2 + (y_H - y_(M_2))^2$ sẽ giúp học sinh tránh bị rối so với việc dùng hình học thuần túy. Hơn nữa, việc tính toán để nguyên phân số $4900/3$ và $100/3$ sẽ giúp bài toán ra được số đẹp $1500$, loại bỏ hoàn toàn sai số trung gian!
    ]


== 2. Bài toán treo vật nặng (Cân bằng lực lượng giác) (CD-Treo-Vật.typ)
- *Ý tưởng chính:* Tối ưu hóa lực căng dây treo bằng cách lập hàm số lượng giác và tìm cực trị.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trên trần nhà được coi là phẳng song song với mặt đất có bốn điểm $A, B, C, D$ theo thứ tự tạo thành một hình thang vuông tại $A$ và $B$, có các kích thước $A B = 40$ cm, $B C = 40$ cm, $A D = 60$ cm. Người ta dự định đặt mua một quả cầu phong thuỷ $(T)$ rất nặng có bán kính $R$ chưa biết và sẽ sử dụng 4 đoạn dây không giãn có độ dài $70$ cm, $70$ cm, $60$ cm, $60$ cm lần lượt có một đầu treo vào các điểm $A, B, C, D$ và đầu còn lại gắn vào các điểm trên quả cầu $(T)$. Biết rằng các đoạn dây này đều có đường kéo dài đi qua tâm của $(T)$. Hãy tính theo đơn vị centimet khoảng cách từ điểm thấp nhất của quả cầu $(T)$ đến trần nhà (làm tròn kết quả đến hàng đơn vị)?

  *Đáp số:* 168
]

#ppgiai[
      Để giải quyết các bài toán "treo vật thể" bằng dây hoặc các bài toán khoảng cách hình học không gian có hình thù phức tạp, không đối xứng, ta nên sử dụng *Phương pháp tọa độ hóa (Oxyz)*.
      - *Bước 1:* Chọn hệ trục tọa độ $O x y z$ sao cho mặt phẳng trần nhà (hoặc mặt đất) trùng với mặt phẳng tọa độ $(O x y)$. Chọn gốc tọa độ $O$ tại vị trí có nhiều góc vuông (như điểm $A$) để dễ dàng thiết lập tọa độ các điểm neo.
      - *Bước 2:* Gọi tọa độ tâm quả cầu là $I(x; y; z)$. Dựa vào giả thiết chiều dài dây và đường kéo dài đi qua tâm, ta thiết lập các phương trình khoảng cách: $I A^2 = (R + l_A)^2$, $I B^2 = (R + l_B)^2$,...
      - *Bước 3:* Giải hệ phương trình vế theo vế để triệt tiêu các đại lượng bậc hai ($R^2, z^2...$), từ đó tìm được hình chiếu $(x; y)$ của $I$ lên mặt trần, sau đó tìm được $R$ và độ cao $|z|$.
      - *Bước 4:* Xác định kết quả. Khoảng cách từ tâm đến trần nhà là $|z|$. Khoảng cách đến *điểm thấp nhất* của quả cầu sẽ là $|z| + R$.
    ]

#step[
      Chọn hệ trục tọa độ $O x y z$ sao cho mặt phẳng $(O x y)$ trùng với mặt trần nhà. Chọn $A(0; 0; 0)$ là gốc tọa độ.
      Vì hình thang $A B C D$ vuông tại $A$ và $B$ nên $A D parallel B C$.
      Dựa vào kích thước $A B = 40$, $B C = 40$, $A D = 60$, ta xác định được tọa độ các đỉnh:
      $ B(40; 0; 0), quad C(40; 40; 0), quad D(0; 60; 0) $
    ]

#step[
      Gọi $I(x; y; z)$ là tâm của quả cầu $(T)$. Vì quả cầu nằm dưới trần nhà nên $z < 0$.
      Do các đoạn dây được gắn vào mặt quả cầu và đường kéo dài đi qua tâm $I$, nên khoảng cách từ các điểm treo đến tâm $I$ chính bằng chiều dài đoạn dây cộng thêm bán kính $R$.
      Ta có hệ thức khoảng cách:
      $ I A = I B = R + 70 $
      $ I C = I D = R + 60 $
    ]

#step[
      Từ $I A = I B arrow.r.double I A^2 = I B^2$, ta có:
      $ x^2 + y^2 + z^2 = (x - 40)^2 + y^2 + z^2 arrow.r.double x^2 = (x - 40)^2 arrow.r.double x = 20 $
      
      Từ $I C = I D arrow.r.double I C^2 = I D^2$, ta có:
      $ (x - 40)^2 + (y - 40)^2 + z^2 = x^2 + (y - 60)^2 + z^2 $
      Thay $x = 20$ vào, ta thấy lượng $x$ hai bên bằng nhau và triệt tiêu:
      $ (y - 40)^2 = (y - 60)^2 arrow.r.double y - 40 = 60 - y arrow.r.double 2y = 100 arrow.r.double y = 50 $
      
      Vậy tọa độ hình chiếu của $I$ lên trần nhà là $(20; 50; 0)$ và $I(20; 50; z)$.
    ]

#step[
      Thay tọa độ $I$ vào biểu thức tính $I A^2$ và $I D^2$ để tìm $R$ và $z$:
      $ I A^2 = 20^2 + 50^2 + z^2 = 2900 + z^2 arrow.r.double 2900 + z^2 = (R + 70)^2 quad (1) $
      $ I D^2 = 20^2 + (50 - 60)^2 + z^2 = 500 + z^2 arrow.r.double 500 + z^2 = (R + 60)^2 quad (2) $
      
      Lấy (1) trừ (2) vế theo vế:
      $ (R + 70)^2 - (R + 60)^2 = 2900 - 500 = 2400 $
      $ (R^2 + 140R + 4900) - (R^2 + 120R + 3600) = 2400 $
      $ 20R + 1300 = 2400 arrow.r.double 20R = 1100 arrow.r.double R = 55 text(" (cm)") $
    ]

#step[
      Thay bán kính $R = 55$ vào phương trình (2) để tìm độ cao $z$:
      $ 500 + z^2 = (55 + 60)^2 = 115^2 = 13225 $
      $ z^2 = 12725 arrow.r.double |z| = sqrt(12725) approx 112.805 text(" (cm)") $
      Vậy khoảng cách từ tâm $I$ đến trần nhà là $112.805$ cm.
    ]

#step[
      Khoảng cách từ *điểm thấp nhất* của quả cầu đến trần nhà bằng khoảng cách từ tâm $I$ đến trần cộng thêm bán kính $R$:
      $ d = |z| + R = sqrt(12725) + 55 approx 112.805 + 55 = 167.805 text(" (cm)") $
      
      Làm tròn kết quả đến hàng đơn vị, ta được đáp án là *$168$ cm*.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trên trần nhà nằm ngang có ba điểm $A, B, C$ tạo thành một tam giác vuông tại $A$, có các kích thước $A B = 30$ cm, $A C = 40$ cm. Người ta treo một quả cầu pha lê $(T)$ có bán kính $R = 15$ cm lên trần nhà bằng ba sợi dây cước thanh mảnh, không dãn. Một đầu dây được gắn vào các điểm $A, B, C$, đầu còn lại gắn vào mặt quả cầu sao cho đường kéo dài của các sợi dây đều đi qua tâm của quả cầu. Biết chiều dài của ba sợi dây treo lần lượt là $l_A = 20$ cm, $l_B = 20$ cm, $l_C = 30$ cm. Tính khoảng cách từ *điểm thấp nhất* của quả cầu $(T)$ đến mặt trần nhà (tính bằng centimet).

  *Đáp số:* 45
]

#ppgiai[
      Để giải quyết bài toán treo vật thể bằng dây, ta dùng *Phương pháp tọa độ hóa (Oxyz)*:
      - *Bước 1:* Gắn hệ trục tọa độ $O x y z$ với mặt trần nhà là mặt phẳng $(O x y)$. Chọn gốc tọa độ tại vị trí góc vuông $A$ để tối ưu hóa tọa độ các điểm neo.
      - *Bước 2:* Gọi tọa độ tâm vật thể là $I(x; y; z)$. 
      - *Bước 3:* Sử dụng công thức khoảng cách từ $I$ đến các điểm treo (bằng chiều dài dây $+$ bán kính quả cầu) để lập hệ phương trình. Giải hệ tìm $(x; y; z)$.
      - *Bước 4:* Độ cao tâm quả cầu đến trần là $|z|$. Khoảng cách đến điểm thấp nhất là $|z| + R$.
    ]

#step[
      Chọn hệ trục tọa độ $O x y z$ sao cho mặt phẳng $(O x y)$ trùng với mặt trần nhà. Chọn $A(0; 0; 0)$ là gốc tọa độ, tia $A B$ nằm trên trục $O x$, tia $A C$ nằm trên trục $O y$.
      Từ giả thiết $A B = 30$, $A C = 40$, ta có tọa độ các điểm treo:
      $ A(0; 0; 0), quad B(30; 0; 0), quad C(0; 40; 0) $
    ]

#step[
      Gọi $I(x; y; z)$ là tâm của quả cầu $(T)$. Vì quả cầu treo dưới trần nhà nên $z < 0$.
      Khoảng cách từ các điểm treo đến tâm $I$ bằng chiều dài dây cộng với bán kính $R = 15$:
      $ I A = l_A + R = 20 + 15 = 35 $
      $ I B = l_B + R = 20 + 15 = 35 $
      $ I C = l_C + R = 30 + 15 = 45 $
    ]

#step[
      Từ $I A = I B arrow.r.double I A^2 = I B^2$, ta có:
      $ x^2 + y^2 + z^2 = (x - 30)^2 + y^2 + z^2 arrow.r.double x^2 = (x - 30)^2 arrow.r.double x = 15 $
      
      Từ $I C^2 = 45^2 = 2025$, ta có:
      $ x^2 + (y - 40)^2 + z^2 = 2025 quad (1) $
      
      Mặt khác, từ $I A^2 = 35^2 = 1225$, ta có:
      $ x^2 + y^2 + z^2 = 1225 quad (2) $
    ]

#step[
      Lấy phương trình (1) trừ đi phương trình (2) vế theo vế:
      $ (y - 40)^2 - y^2 = 2025 - 1225 $
      $ y^2 - 80y + 1600 - y^2 = 800 $
      $ -80y = -800 arrow.r.double y = 10 $
    ]

#step[
      Thay $x = 15$ và $y = 10$ vào phương trình (2) để tìm cao độ $z$:
      $ 15^2 + 10^2 + z^2 = 1225 $
      $ 225 + 100 + z^2 = 1225 arrow.r.double z^2 = 900 arrow.r.double z = -30 text(" (do } z < 0 text{)") $
      Vậy tâm quả cầu cách trần nhà một khoảng là $|z| = 30$ cm.
    ]

#step[
      Khoảng cách từ *điểm thấp nhất* của quả cầu đến trần nhà bằng khoảng cách từ tâm $I$ đến trần cộng thêm bán kính $R$:
      $ d = |z| + R = 30 + 15 = 45 text(" (cm)") $
    ]


== 3. Bài toán đánh trận có vận tốc di chuyển (Đánh-Trận-Có Vận Tốc.typ)
- *Ý tưởng chính:* Tối ưu hóa thời điểm khai hỏa bắn hạ phương tiện di động dựa trên vận tốc đạn và xe đua.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Cho một hồ nước nhỏ có hai bờ hồ song song cách nhau $20$ m. Ở hai bên bờ hồ có hai chiếc cọc thẳng đứng, hai đỉnh cọc $A$ và $B$ lần lượt có độ cao so với mặt nước hồ là $4$ m và $5$ m, hai điểm $A$ và $B$ cách nhau $30$ m. Một chú chim bói cá đậu tại $A$ và quan sát thấy có một con cá tại điểm $C$ (ở giữa hồ, cách bờ hồ phía chim bói cá $4$ m) đang bơi theo hướng vuông góc với bờ hồ với tốc độ $180 " cm/s"$ sang phía bờ bên kia. Chú chim bói cá này quan sát thấy con cá cách mình $6$ m và chú chim này sẽ bay thẳng với tốc độ $6 " m/s"$ để bắt con cá (coi thời gian bắt cá là $1$ giây) rồi mang theo con cá bay thẳng với tốc độ $5 " m/s"$ lên đỗ ở $B$. Hãy xác định khoảng thời gian tính từ lúc chú chim bói cá bắt đầu rời $A$ và đỗ vào $B$ theo đơn vị giây (làm tròn kết quả đến hàng phần trăm).

  *Đáp số:* $7,29$
]

#ppgiai[
      - Chìa khóa bài toán này là sử dụng phương pháp *tọa độ hóa không gian $O x y z$*.
      - Chọn mặt nước làm mặt phẳng $(O x y)$. Gốc tọa độ $O$ trùng với chân cọc của điểm $A$.
      - Dựa vào khoảng cách để xác định tọa độ các điểm $A, B$ và vị trí ban đầu của cá $C$.
      - Tham số hóa tọa độ của cá theo thời gian $t$. Dựa vào quãng đường bay của chim để lập phương trình tìm thời gian bắt được cá ($t_1$).
      - Tính khoảng cách từ điểm bắt cá $D$ đến $B$ để tìm thời gian bay tiếp ($t_2$).
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Một sân tập thực nghiệm có một đường ray thẳng nằm trên mặt đất. Gần đường ray có một cột quan sát thẳng đứng, đỉnh cột $A$ cao $9$ m so với mặt đất. Hình chiếu vuông góc của $A$ lên mặt đất là điểm $H$. Khoảng cách từ $H$ đến đường ray là $12$ m. Một chiếc xe đua mô hình bắt đầu chạy trên đường ray từ điểm $C$ (với $C$ là điểm trên đường ray gần $H$ nhất) dọc theo đường ray với tốc độ không đổi $8 " m/s"$. Cùng lúc đó, một flycam cất cánh từ $A$, bay thẳng với tốc độ $17 " m/s"$ để đánh chặn và thả một gói hàng xuống xe đua (gọi vị trí gặp nhau là $D$). Quá trình thả hàng mất $1,5$ giây. Ngay sau đó, flycam tiếp tục bay thẳng với tốc độ $5 " m/s"$ đến đỗ tại trạm sạc $B$ trên một bức tường. Biết rằng nếu chọn hệ trục tọa độ $O x y z$ với mặt phẳng $(O x y)$ trùng mặt đất, gốc $O$ trùng $H$, trục $O y$ đi qua $C$ và trục $O x$ cùng hướng chạy của xe đua, thì trạm sạc $B$ có tọa độ là $(23; -4; 12)$ (đơn vị tọa độ là mét). Hỏi khoảng thời gian tính từ lúc flycam cất cánh tại $A$ cho đến khi đỗ tại $B$ là bao nhiêu giây? (Làm tròn kết quả đến hàng phần trăm).

  *Đáp số:* $7,50$
]

#ppgiai[
      - Sử dụng hệ trục tọa độ $O x y z$ để giải bài toán động học không gian.
      - Tham số hóa tọa độ của xe đua $D(t)$ theo thời gian $t$.
      - Lập phương trình khoảng cách từ điểm xuất phát $A$ của flycam đến $D(t)$ bằng với quãng đường flycam bay được ($v_("flycam") dot t$) để giải tìm thời gian $t_1$.
      - Tính khoảng cách $D B$ trong không gian để tìm thời gian bay chặng thứ hai $t_2$.
    ]


== 4. Góc nhìn tối ưu & Bài toán vật chắn tầm nhìn (CD-Vật-Chắn-Tầm-Nhìn.typ)
- *Ý tưởng chính:* Tìm vị trí đứng để có góc quan sát bảng hiệu quảng cáo lớn nhất khi bị vật cản che khuất.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một sân khấu ngoài trời có mặt sân khấu nằm trên mặt phẳng ngang. Khán giả ngồi trên một khán đài với các hàng ghế được sắp xếp theo các bậc thang. Bậc thấp nhất có độ cao $h_1 = 0,5$ m so với mặt sân khấu. Các bậc tiếp theo có độ cao tăng dần, mỗi bậc cao hơn bậc ngay trước nó $0,3$ m. Khoảng cách theo phương ngang từ mép sân khấu (kí hiệu là $O$) đến hàng ghế đầu tiên là $d_1 = 2$ m, và khoảng cách giữa các hàng ghế liên tiếp là $0,8$ m. \
  Khán giả $A$ ngồi ở hàng ghế thứ $5$. Khán giả $B$ ngồi ở hàng ghế thứ $n$ (ngồi ngay phía sau $A$). Chiều cao từ chỗ ngồi đến mắt của cả hai người đều là $0,7$ m. Để $B$ có thể nhìn thấy toàn bộ mặt sân khấu (bắt đầu từ mép $O$) mà không bị đầu của $A$ che khuất, hỏi $B$ phải ngồi từ hàng ghế thứ mấy trở đi?

  *Đáp số:* Không tồn tại $n > 5$
]

#ppgiai[
      *Tư duy Tọa độ hóa (Giải tích) kiểm soát tầm nhìn:*
      - Gắn hệ trục tọa độ $O x y$ với $O(0,0)$ là mép sân khấu. Trục $O x$ dọc theo mặt sàn hướng về khán đài, trục $O y$ hướng thẳng đứng lên trên.
      - Để $B$ nhìn thấy mép $O$ mà không bị $A$ che khuất, tia nhìn từ $B$ đến $O$ phải nằm *phía trên* đầu của $A$.
      - Điều này tương đương với việc: Hệ số góc của đường thẳng $O B$ phải *lớn hơn* hệ số góc của đường thẳng $O A$ ($m_B > m_A$).
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Một nhà hát có mặt sân khấu nằm trên mặt phẳng nằm ngang. Khán giả ngồi trên một khán đài xếp thành các bậc thang. Bậc thứ nhất có độ cao $h_1 = 0,5$m so với mặt sân khấu. Các bậc tiếp theo có độ cao tăng dần, bậc sau cao hơn bậc trước $0,3$m. Khoảng cách theo phương ngang từ mép sân khấu (O) đến bậc thứ nhất là $d_1 = 2$m, khoảng cách giữa hai bậc liên tiếp là $d = 0,8$m. Khán giả A ngồi ở bậc thứ $5$. Khán giả B ngồi ở bậc thứ $n$ (ngồi ngay phía sau A). Chiều cao từ chỗ ngồi đến mắt của khán giả A và B đều là $0,7$m. Để B có thể nhìn thấy toàn bộ mặt sân khấu mà không bị khuất tầm nhìn bởi A thì B phải ngồi từ bậc thứ mấy trở đi?

  *Đáp số:* Không tồn tại $n > 5$
]

#ppgiai[
      *Tư duy Tọa độ hóa (Giải tích) kiểm soát tầm nhìn:*
      - Gắn hệ trục tọa độ $O x y$ với $O(0,0)$ là mép sân khấu. Trục $O x$ dọc theo mặt sàn hướng về khán đài, trục $O y$ hướng thẳng đứng lên trên.
      - Để $B$ nhìn thấy mép $O$ (từ đó thấy toàn bộ mặt sân khấu) mà không bị $A$ che khuất, tia nhìn từ $B$ đến $O$ phải nằm *phía trên* tầm mắt của $A$.
      - Điều này tương đương với việc: Hệ số góc của đường thẳng $O B$ phải *lớn hơn* hệ số góc của đường thẳng $O A$ ($m_B > m_A$).
    ]


== 5. Quỹ đạo quay & Tọa độ Cánh tay Robot trong Oxyz (Cánh-Tay-Robot.typ)
- *Ý tưởng chính:* Tính toán tọa độ điểm đầu cuối của cánh tay robot nhiều khớp xoay trong không gian Oxyz.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Cho ba thanh cứng $A B, B C, C D$ gắn với nhau bằng hai bản lề tại $B$ và $C$, hai đầu còn lại được gắn cố định với sàn nhà tại hai bản lề $A$ và $D$. Biết rằng $A B = C D = 5$ m, $B C = 3$ m, $A D = 6$ m, mặt phẳng $(A B C D)$ luôn vuông góc với sàn nhà. Khi hai bản lề $B$ và $C$ di chuyển thì điểm $C$ cách sàn nhà một khoảng ngắn nhất bằng bao nhiêu centimet (làm tròn kết quả đến hàng đơn vị)?

  *Đáp số:* Cố định
]

#ppgiai[
      - Khoảng cách từ $C$ đến sàn nhà chính là chiều cao của tam giác $A C D$ hạ từ đỉnh $C$ xuống cạnh đáy $A D$.
      - Để chiều cao này nhỏ nhất, diện tích tam giác $A C D$ phải nhỏ nhất. Ta dùng công thức Heron để khảo sát diện tích theo độ dài cạnh thay đổi $A C$.
      - Sử dụng bất đẳng thức tam giác cho $Delta A B C$ để tìm giới hạn độ dài của $A C$.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Cho ba thanh cứng $A B, B C, C D$ gắn với nhau bằng hai bản lề tại $B$ và $C$, hai đầu còn lại được gắn cố định với sàn nhà tại hai bản lề $A$ và $D$. Biết rằng $A B = C D = 5$ m, $B C = 3$ m, $A D = 6$ m, mặt phẳng $(A B C D)$ luôn vuông góc với sàn nhà. Khi hai bản lề $B$ và $C$ di chuyển thì điểm $C$ cách sàn nhà một khoảng ngắn nhất bằng bao nhiêu centimet (làm tròn kết quả đến hàng đơn vị)?

  *Đáp số:* 156
]

#loigiai-box[
Bài toán này có thể giải quyết bằng nhiều góc nhìn khác nhau. Dưới đây là 3 cách giải tiêu biểu:

    #text(fill: blue, weight: "bold")[Cách 1: Sử dụng Định lý hàm số Cosin (Ngắn gọn và bản chất lượng giác)]
    Gọi $alpha = angle A D C$. Khoảng cách từ $C$ đến mặt sàn chính là chiều cao hạ từ $C$ của $Delta A C D$:
    $ h_C = C D dot sin alpha = 5 sin alpha. $
    Để $h_C$ nhỏ nhất thì $sin alpha$ phải nhỏ nhất. Vì $C$ nằm trên mặt sàn nên $alpha in (0; pi)$. Trong khoảng này, $sin alpha$ càng nhỏ khi $cos alpha$ càng lớn (vì $sin alpha = sqrt(1 - cos^2 alpha)$).
    
    Áp dụng định lý hàm số cosin trong $Delta A C D$:
    $ A C^2 = A D^2 + C D^2 - 2 dot A D dot C D dot cos alpha = 6^2 + 5^2 - 2 dot 6 dot 5 dot cos alpha = 61 - 60 cos alpha \
    => cos alpha = (61 - A C^2) / 60. $
    Để $cos alpha$ lớn nhất thì độ dài $A C^2$ phải nhỏ nhất.
    
    Xét $Delta A B C$, theo bất đẳng thức tam giác, ta luôn có:
    $ A C >= abs(A B - B C) = abs(5 - 3) = 2 " (m)". $
    Dấu "$=$" xảy ra khi ba điểm $A, C, B$ thẳng hàng theo thứ tự đó (thanh bị gập lại).
    Vậy $min(A C) = 2 " m"$. Lúc này:
    $ cos alpha = (61 - 2^2) / 60 = 57/60 = 19/20. $
    Suy ra:
    $ sin alpha = sqrt(1 - (19/20)^2) = sqrt(39) / 20. $
    Khoảng cách ngắn nhất từ $C$ xuống sàn là:
    $ h_C = 5 dot (sqrt(39) / 20) = sqrt(39) / 4 " (m)" = 25 sqrt(39) " (cm)" approx 156 " (cm)". $
    
    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 2: Phương pháp Tọa độ (Hình học giải tích)]
    Chọn hệ trục tọa độ $O x y$ sao cho $D(0;0)$, $A(6;0)$. Sàn nhà là trục $O x$. 
    Giả sử tọa độ điểm $C(x; y)$ với $y > 0$. Khoảng cách cần tìm chính là tung độ $y$.
    
    Vì $C D = 5$ nên điểm $C$ nằm trên đường tròn tâm $D$, bán kính 5:
    $ x^2 + y^2 = 25 quad (1) $
    
    Điểm $B$ di chuyển trên đường tròn tâm $A(6;0)$ bán kính $A B = 5$. 
    Vì khoảng cách $B C = 3$ nên $C$ phải cách đường tròn $(A)$ một đoạn xa nhất là $5 + 3 = 8$ và gần nhất là $abs(5 - 3) = 2$.
    Nói cách khác, khoảng cách từ $C$ đến tâm $A$ phải thỏa mãn:
    $ A C >= 2 <=> (x - 6)^2 + y^2 >= 4 quad (2) $
    
    Thay $y^2 = 25 - x^2$ từ $(1)$ vào $(2)$, ta được:
    $ x^2 - 12x + 36 + (25 - x^2) >= 4 \
    <=> 61 - 12x >= 4 \
    <=> 12x <= 57 \
    <=> x <= 19/4. $
    
    Ta có $y^2 = 25 - x^2$. Để $y$ nhỏ nhất (với $y > 0$) thì $x^2$ phải lớn nhất, tức là $x$ lớn nhất.
    Chọn $x = 19/4$, khi đó:
    $ y^2 = 25 - (19/4)^2 = 25 - 361/16 = 39/16 \
    => y = sqrt(39) / 4 " (m)". $
    Đổi ra centimet ta được $h_C approx 156 " (cm)"$.

    #line(length: 100%, stroke: 0.5pt + gray)

    #text(fill: blue, weight: "bold")[Cách 3: Sử dụng công thức Heron (Khảo sát hàm số)]
    Ký hiệu $h_C$ là chiều cao tam giác $A C D$. Ta có $h_C = (2 S_(A C D)) / (A D) = S_(A C D) / 3$.
    Nửa chu vi tam giác $A C D$: $p = (11 + A C) / 2$. 
    Bình phương diện tích tam giác $A C D$:
    $ S_(A C D)^2 = p(p-6)(p-5)(p-A C) = ((121 - A C^2)(A C^2 - 1)) / 16. $
    Như đã chứng minh ở Cách 1, độ dài $A C$ bị giới hạn: $2 <= A C <= 8$.
    Đặt $t = A C^2$ ($4 <= t <= 64$), xét hàm số: 
    $ f(t) = (121 - t)(t - 1) = -t^2 + 122t - 121. $
    Đỉnh parabol quay xuống dưới, nằm tại $t = 61$. Do đó giá trị nhỏ nhất trên đoạn $[4; 64]$ nằm ở một trong hai đầu mút:
    - Tại $t=4$: $f(4) = (121-4)(4-1) = 351$.
    - Tại $t=64$: $f(64) = (121-64)(64-1) = 3591$.
    Vậy $min f(t) = 351$ tại $t=4$.
    Khi đó $S_(A C D) = sqrt(351) / 4 = (3 sqrt(39)) / 4$.
    Suy ra khoảng cách $h_C = S_(A C D) / 3 = sqrt(39) / 4 " (m)" approx 156 " (cm)"$.
]


== 6. Tọa độ hóa bài toán săn bắt mục tiêu di động (Đon-Bắt-Mục tiêu.typ)
- *Ý tưởng chính:* Radar quét mục tiêu và điều khiển thiết bị đánh chặn mục tiêu di động thẳng đều trong không gian.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trên mặt phẳng tọa độ với đơn vị dài trên mỗi trục là kilômét có một khẩu pháo đặt tại gốc tọa độ và một mục tiêu chuyển động thẳng đều ở thời điểm ban đầu có tọa độ $A(0","5; 6)$. Ở thời điểm $20$ giây khoảng cách từ mục tiêu đến $3$ radar đặt tại $O$, $G(0","1; 0)$, $H(0; 0","1)$ lần lượt là $sqrt(97)/2$ km; $sqrt(2 386)/10$ km; $(2sqrt(146))/5$ km. Ngay sau đó từ khẩu pháo bắn ra một viên đạn bay với tốc độ $v_0$ m/s để đón bắt mục tiêu. Hãy tính theo đơn vị m/s giá trị nhỏ nhất $v_0$ (_làm tròn kết quả đến hàng đơn vị_).

  *Đáp số:* $99$
]

#ppgiai[
      - Giả sử tọa độ mục tiêu sau $20$ giây là $M_1(x;y)$. Giải hệ phương trình khoảng cách từ $M_1$ đến $O, G, H$ để tìm $(x; y)$.
      - Tính vectơ vận tốc của mục tiêu $vect(v)_T = (vect(A M_1))/20$.
      - Thiết lập phương trình chuyển động của mục tiêu và biểu diễn khoảng cách từ gốc tọa độ $O$ đến mục tiêu tại thời điểm $t > 20$.
      - Viên đạn bắn ra phải đi quãng đường bằng khoảng cách đó trong khoảng thời gian $T = t - 20$. Lập hàm số biểu diễn $v_0$ theo $T$ và tìm giá trị nhỏ nhất của hàm số đó.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trong không gian $O x y z$ (đơn vị trên các trục là nghìn km), một trạm phòng thủ không gian được đặt tại điểm $I(1; 1; 1)$. Lá chắn năng lượng bảo vệ trạm là một mặt cầu $(S)$ có tâm $I$ và bán kính $R = 5$. 
  
  Hệ thống radar phát hiện một thiên thạch đang bay thẳng đều. Tại thời điểm $t=0$ (giây), thiên thạch ở vị trí $M_0(3; 0; -1)$ (nằm bên trong lá chắn) và có véc-tơ vận tốc là $vect(v) = (2; 2; 1)$ (nghìn km/s).
  
  Ngay tại $t=0$, từ trạm $I$ phóng một tên lửa đánh chặn bay thẳng đều để tiêu diệt thiên thạch. Biết rằng tên lửa được lập trình để đánh trúng thiên thạch đúng tại vị trí thiên thạch chuẩn bị thoát ra khỏi lá chắn năng lượng $(S)$. 
  
  Hãy tính tốc độ bay của tên lửa đánh chặn (theo đơn vị nghìn km/s, viết kết quả dưới dạng số thập phân).

  *Đáp số:* $3,75$
]

#ppgiai[
      - Viết phương trình chuyển động (phương trình tham số) của thiên thạch theo thời gian $t$.
      - Xác định thời điểm $t > 0$ mà thiên thạch chạm vào mặt cầu $(S)$ bằng cách giải phương trình khoảng cách $I M(t) = R$.
      - Nhận xét rằng quãng đường tên lửa bay từ tâm $I$ đến điểm chạm trên mặt cầu chính bằng bán kính $R$.
      - Áp dụng công thức tính tốc độ $v = S/t$ để tìm tốc độ của tên lửa.
    ]

#meo[
      Bài toán có thể đánh lừa học sinh đi tính tọa độ cụ thể của điểm $B$ rồi mới tính độ dài $I B$. Tuy nhiên, nếu nắm vững bản chất hình học, ta nhận ra ngay điểm đánh chặn nằm trên mặt cầu tâm $I$, nên quãng đường bay của tên lửa xuất phát từ $I$ bắt buộc phải bằng bán kính $R = 5$ mà không cần bận tâm tọa độ điểm $B$ là bao nhiêu.
    ]


== 7. Tối ưu hóa chi phí ẩn và vận tốc di chuyển (CD-ChiPhi-An-VanToc.typ)
- *Ý tưởng chính:* Thiết lập hàm tổng chi phí gồm chi phí nhiên liệu và chi phí nhân công để tìm vận tốc tối ưu nhất.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một công ty du lịch sử dụng ca nô cao tốc để đưa khách tham quan trên một tuyến sông dài *20 km*. Vận tốc tối đa của ca nô là *120 km/h*. Chi phí vận hành của ca nô gồm hai thành phần:
    - *Chi phí nhiên liệu:* Tính trên quãng đường di chuyển và tỉ lệ thuận với bình phương vận tốc. Biết rằng nếu ca nô chạy với vận tốc $10$ km/h thì *chi phí nhiên liệu cho 1 giờ chạy là 60 nghìn đồng*.
    - *Chi phí nhân công và bến bãi:* Tỉ lệ thuận với thời gian ca nô hoạt động. Biết rằng nếu ca nô chạy với vận tốc $10$ km/h thì *chi phí nhân công cho 1 km là 5 nghìn đồng*.

    Biết tổng chi phí vận hành được tính bằng nghìn đồng. Hỏi công ty nên cho ca nô chạy với vận tốc bao nhiêu để tổng chi phí cho một chuyến là nhỏ nhất? Tính tổng chi phí tối thiểu đó (làm tròn đến hàng đơn vị nghìn đồng).

  *Đáp số:* 201 nghìn đồng, vận tốc tối ưu $approx 7","47$ km/h
]

#ppgiai[
      Đây là bài toán "chi phí ẩn" cổ điển — Cách cho hệ số *per-hour* (dạng 2). Bước quan trọng nhất là *quy về chi phí cho 1 km*, sau đó mọi thứ sẽ tự nhiên.
    ]

#ans-box[
      Chi phí tối thiểu $C_min approx 200","83$ nghìn đồng $arrow.double$ *Làm tròn lên: 201 nghìn đồng.*

      _Lưu ý: phải làm tròn lên (không phải xuống) vì 200,83 > 200._
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Một ca nô du lịch chạy trên tuyến sông dài *50 km*, vận tốc tối đa *90 km/h*. Chi phí gồm:
    - *Nhiên liệu:* Tỉ lệ bình phương vận tốc trên mỗi km. Biết rằng *tại vận tốc 10 km/h, chi phí nhiên liệu cho 1 km là 2 nghìn đồng.*
    - *Nhân công và vận hành:* *40 nghìn đồng mỗi giờ.*

    Tính tổng chi phí vận hành tối thiểu cho một chuyến (nghìn đồng).

  *Đáp số:* 300 nghìn đồng
]

#ppgiai[
      Dữ liệu cho theo *Cách 1 (per-km)* — không cần quy đổi. Bài này có đáp số *chính xác* đẹp, nên dùng để kiểm tra hiểu bài.
    ]

#ans-box[
      Tổng chi phí tối thiểu là *300 nghìn đồng* đạt tại $v_0 = 10$ km/h.
    ]


== 8. Tối ưu hóa thời gian di chuyển qua nhiều môi trường (Snell) (Di-Chuyển-Qua-Nhiều-Môi-Trường-Có-Vận-Tốc.typ)
- *Ý tưởng chính:* Tìm đường đi nhanh nhất giữa hai điểm khi đi qua các vùng có vận tốc khác nhau (Định luật khúc xạ Snell).

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Một phương tiện cần di chuyển từ điểm $A$ đến điểm $D$ thông qua điểm $B$ nằm trên đoạn $A C$. Biết $A C = 30$ km, $C D perp A C$ tại $C$ và $C D = 40$ km. Vận tốc di chuyển trên đoạn $A B$ là $v_1 = 80$ km/h, vận tốc di chuyển trên đoạn $B D$ là $v_2 = 40$ km/h. Gọi $x$ là khoảng cách từ $A$ đến $B$ (với $0 <= x <= 30$, đơn vị: km). Hãy xác định $x$ (làm tròn đến hàng phần mười) để thời gian di chuyển từ $A$ đến $D$ là ngắn nhất.

  *Đáp số:* $6,9$
]

#ppgiai[
      - *Bước 1:* Lập hàm số biểu diễn tổng thời gian di chuyển $T(x) = t_{A B} + t_{B D}$ theo biến $x$.
      - *Bước 2:* Sử dụng đạo hàm để tìm điểm tới hạn của hàm $T(x)$ trên khoảng xác định.
      - *Bước 3:* Đánh giá để tìm giá trị cực tiểu của hàm số.
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Một con mèo robot cần di chuyển từ điểm $A$ nằm trên bãi đất đến điểm $B$ nằm trên bãi cát. Đường phân cách giữa bãi đất và bãi cát là một đường thẳng $d$. Gọi $H$ và $K$ lần lượt là hình chiếu vuông góc của $A$ và $B$ lên $d$. Biết khoảng cách $A H = 3$ m, $B K = 4$ m và $H K = 7$ m. Vận tốc di chuyển của mèo robot trên bãi đất là $v_1 = 5$ m/s, vận tốc di chuyển trên bãi cát là $v_2 = 2$ m/s. Để thời gian di chuyển từ $A$ đến $B$ là ít nhất, mèo robot cần đi qua điểm $M$ nằm trên đoạn $H K$. Tính khoảng cách $H M$ (làm tròn kết quả đến hàng phần mười).
  // TODO: Cập nhật lại chính xác các số liệu (3m, 4m, 7m, 5m/s, 2m/s) nếu ảnh gốc có giá trị khác.

  *Đáp số:* $2,6$
]

#ppgiai[
      - *Bước 1:* Đặt ẩn đoạn $H M = x$ (điều kiện $0 <= x <= H K$). Biểu diễn đoạn $M K$ theo $x$.
      - *Bước 2:* Dùng định lý Pythagore để tính chiều dài quãng đường đi trên bãi đất ($A M$) và trên bãi cát ($M B$).
      - *Bước 3:* Lập hàm số biểu diễn tổng thời gian $T(x) = (A M)/v_1 + (M B)/v_2$.
      - *Bước 4:* Khảo sát hàm số bằng đạo hàm $T'(x) = 0$ để tìm giá trị $x$ làm cho $T(x)$ đạt cực tiểu.
    ]


== 9. Xác suất chuyển động ngẫu nhiên: Cầu bị gió thổi (Cầu Bị Gió Thổi.typ)
- *Ý tưởng chính:* Tính xác suất quả cầu rơi trúng mục tiêu khi chịu ảnh hưởng của các lực cản ngẫu nhiên.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Trong một cuộc thi Toán, hai học sinh Minh Châu và Tiến Hân cùng đạt điểm cao nhất. Ban tổ chức quyết định chọn ra một bạn để trao thưởng đặc biệt bằng cách cho mỗi bạn cầm hai con xúc xắc cân đối đồng chất và cùng gieo, bạn nào có tổng số chấm lớn hơn thì được chọn, bằng điểm thì gieo lại. Hãy tính xác suất để bạn Minh Châu nhận được phần thưởng ngay sau lần gieo đầu tiên (làm tròn kết quả đến hàng phần trăm).

  *Đáp số:* 0.44
]

#ppgiai
[ Tổng số chấm khi gieo hai con xúc xắc có các khả năng từ $2$ đến $12$ với số cách tương ứng là $1,2,3,4,5,6,5,4,3,2,1$. Do hai bạn gieo trong điều kiện như nhau nên xác suất Minh Châu thắng bằng xác suất Tiến Hân thắng. ]

#meo[
Vì hai người có vai trò đối xứng nên chỉ cần tính xác suất hòa, sau đó lấy nửa xác suất không hòa.
]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Trong một buổi ngoại khoá Toán học, hai học sinh Minh Khôi và Gia Linh tham gia một trò chơi tính điểm. Ban tổ chức chuẩn bị một hộp kín chứa $4$ quả bóng giống hệt nhau được đánh số từ $1$ đến $4$. 
  
  Mỗi bạn đến lượt sẽ bốc ngẫu nhiên đồng thời $2$ quả bóng từ hộp, ghi lại tổng các số trên $2$ quả bóng đó rồi trả lại vào hộp cho người kia bốc. Người nào bốc được tổng điểm lớn hơn sẽ giành chiến thắng, nếu bằng điểm nhau thì trò chơi hoà và cả hai phải bốc lại lượt mới. Hãy tính xác suất để bạn Minh Khôi giành chiến thắng ngay sau lượt bốc đầu tiên (_làm tròn kết quả đến hàng phần trăm_).

  *Đáp số:* $0,39$
]

#ppgiai[
      - *Bước 1:* Xác định không gian mẫu khi bốc $2$ quả bóng từ $4$ quả.
      - *Bước 2:* Gọi $X$ và $Y$ lần lượt là tổng điểm của Minh Khôi và Gia Linh. Lập bảng phân bố xác suất cho $X$.
      - *Bước 3:* Tính xác suất cửa hoà $P(X=Y)$.
      - *Bước 4:* Áp dụng tính chất đối xứng $P(X>Y) = P(X<Y)$ để tính xác suất thắng $P(X>Y) = (1 - P(X=Y))/2$.
    ]

#meo[
      Cốt lõi của những bài toán "đọ điểm" kiểu này luôn là công thức vàng: $P("Thắng") = (1 - P("Hoà")) / 2$. Thầy cô nên nhắc học trò chỉ cần tập trung tính xác suất cửa Hoà (tổng bình phương các xác suất thành phần), tránh việc liệt kê thủ công đếm số trường hợp Thắng rất dễ bị sót nghiệm.
    ]


== 10. Đường bay Chim săn mồi (Quỹ đạo parabol săn mồi) (CD-Chim-Săn-Mồi.typ)
- *Ý tưởng chính:* Mô hình hóa đường bay của chim săn mồi theo parabol để tối thiểu hóa độ cao hoặc quãng đường bay.

#eg-box(title: "🎯 Ví dụ mẫu 1")[
  Cho một hồ nước nhỏ có hai bờ hồ song song cách nhau $20$ m. Ở hai bên bờ hồ có hai chiếc cọc thẳng đứng, hai đỉnh cọc $A$ và $B$ lần lượt có độ cao so với mặt nước hồ là $4$ m và $5$ m, hai điểm $A$ và $B$ cách nhau $30$ m. Một chú chim bói cá đậu tại $A$ và quan sát thấy có một con cá tại điểm $C$ (ở giữa hồ, cách bờ hồ phía chim bói cá $4$ m) đang bơi theo hướng vuông góc với bờ hồ với tốc độ $180 " cm/s"$ sang phía bờ bên kia. Chú chim bói cá này quan sát thấy con cá cách mình $6$ m và chú chim này sẽ bay thẳng với tốc độ $6 " m/s"$ để bắt con cá (coi thời gian bắt cá là $1$ giây) rồi mang theo con cá bay thẳng với tốc độ $5 " m/s"$ lên đỗ ở $B$. Hãy xác định khoảng thời gian tính từ lúc chú chim bói cá bắt đầu rời $A$ và đỗ vào $B$ theo đơn vị giây (làm tròn kết quả đến hàng phần trăm).

  *Đáp số:* $7,29$
]

#ppgiai[
      - Chìa khóa bài toán này là sử dụng phương pháp *tọa độ hóa không gian $O x y z$*.
      - Chọn mặt nước làm mặt phẳng $(O x y)$. Gốc tọa độ $O$ trùng với chân cọc của điểm $A$.
      - Dựa vào khoảng cách để xác định tọa độ các điểm $A, B$ và vị trí ban đầu của cá $C$.
      - Tham số hóa tọa độ của cá theo thời gian $t$. Dựa vào quãng đường bay của chim để lập phương trình tìm thời gian bắt được cá ($t_1$).
      - Tính khoảng cách từ điểm bắt cá $D$ đến $B$ để tìm thời gian bay tiếp ($t_2$).
    ]

#eg-box(title: "🎯 Ví dụ mẫu 2")[
  Một sân tập thực nghiệm có một đường ray thẳng nằm trên mặt đất. Gần đường ray có một cột quan sát thẳng đứng, đỉnh cột $A$ cao $9$ m so với mặt đất. Hình chiếu vuông góc của $A$ lên mặt đất là điểm $H$. Khoảng cách từ $H$ đến đường ray là $12$ m. Một chiếc xe đua mô hình bắt đầu chạy trên đường ray từ điểm $C$ (với $C$ là điểm trên đường ray gần $H$ nhất) dọc theo đường ray với tốc độ không đổi $8 " m/s"$. Cùng lúc đó, một flycam cất cánh từ $A$, bay thẳng với tốc độ $17 " m/s"$ để đánh chặn và thả một gói hàng xuống xe đua (gọi vị trí gặp nhau là $D$). Quá trình thả hàng mất $1,5$ giây. Ngay sau đó, flycam tiếp tục bay thẳng với tốc độ $5 " m/s"$ đến đỗ tại trạm sạc $B$ trên một bức tường. Biết rằng nếu chọn hệ trục tọa độ $O x y z$ với mặt phẳng $(O x y)$ trùng mặt đất, gốc $O$ trùng $H$, trục $O y$ đi qua $C$ và trục $O x$ cùng hướng chạy của xe đua, thì trạm sạc $B$ có tọa độ là $(23; -4; 12)$ (đơn vị tọa độ là mét). Hỏi khoảng thời gian tính từ lúc flycam cất cánh tại $A$ cho đến khi đỗ tại $B$ là bao nhiêu giây? (Làm tròn kết quả đến hàng phần trăm).

  *Đáp số:* $7,50$
]

#ppgiai[
      - Sử dụng hệ trục tọa độ $O x y z$ để giải bài toán động học không gian.
      - Tham số hóa tọa độ của xe đua $D(t)$ theo thời gian $t$.
      - Lập phương trình khoảng cách từ điểm xuất phát $A$ của flycam đến $D(t)$ bằng với quãng đường flycam bay được ($v_("flycam") dot t$) để giải tìm thời gian $t_1$.
      - Tính khoảng cách $D B$ trong không gian để tìm thời gian bay chặng thứ hai $t_2$.
    ]

