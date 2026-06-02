#import "../../math-sym.typ": *
#import "../../sang-exam.typ": *
#import "../../template.typ": *

// ═══════════════════════════════════════════════════════════
// CD-UocSo-ChinhPhuong-XacSuat.typ
// Chuyên đề: Ước số, số chính phương & xác suất Lucky Light
// Phong cách: Typst-native · Sư phạm từng bước · Lời giải đầy đủ
// ═══════════════════════════════════════════════════════════

#set page(paper: "a4", margin: (x: 1.55cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.9em)
#set list(indent: 1em, body-indent: 0.55em)
#set enum(indent: 0.8em, body-indent: 0.55em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("102A43"), rgb("1E3A8A"), rgb("2563EB"), angle: 135deg),
  stroke: none,
  inset: (x: 16pt, y: 11pt),
  radius: 8pt,
  above: 1.9em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.45em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("1E3A8A")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("1E3A8A"), size: 12pt, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 1.15em,
  below: 0.45em,
  text(fill: rgb("0F766E"), size: 11pt, weight: "bold", "▸ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show math.equation: set text(fill: black)
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#let gcd = math.op("gcd")

#let c-navy = rgb("1E3A8A")
#let c-teal = rgb("0F766E")
#let c-amber = rgb("C2410C")
#let c-violet = rgb("6D28D9")
#let c-green = rgb("15803D")
#let c-red = rgb("B91C1C")
#let c-slate = rgb("475569")

#let state-pill(fill, label, textFill) = box(width: 5.2em)[
  #align(center)[
    #grid(
      columns: (auto, auto),
      column-gutter: 0.35em,
      circle(radius: 4pt, fill: fill), text(fill: textFill, weight: "bold", size: 9.4pt)[#label],
    )
  ]
]

#show regex("🔴 Đỏ"): it => state-pill(rgb("DC2626"), "Đỏ", rgb("B91C1C"))
#show regex("🔵 Xanh"): it => state-pill(rgb("2563EB"), "Xanh", rgb("1D4ED8"))
#show regex("🟡 Vàng"): it => state-pill(rgb("F59E0B"), "Vàng", rgb("B45309"))
#show regex("🟢 Lục"): it => state-pill(rgb("16A34A"), "Lục", rgb("15803D"))

#let eg-box(title: "🎯 Ví dụ", body) = block(
  fill: rgb("ECFDF5"),
  stroke: (left: 4pt + c-green, rest: 0.7pt + rgb("A7F3D0")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let key-box(body) = block(
  fill: rgb("F5F3FF"),
  stroke: (left: 4pt + c-violet, rest: 0.7pt + rgb("DDD6FE")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-violet, weight: "bold")[🔑 Ý tưởng then chốt]
  #v(0.3em)
  #body
]

#let insight-box(title: "💡 Trực giác sư phạm", body) = block(
  fill: rgb("ECFEFF"),
  stroke: (left: 4pt + c-teal, rest: 0.7pt + rgb("A5F3FC")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-teal, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let cach1-box(body) = block(
  fill: rgb("EFF6FF"),
  stroke: (left: 4pt + rgb("2563EB"), rest: 0.7pt + rgb("BFDBFE")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("2563EB"), weight: "bold")[🧭 Cách nhìn trực tiếp từ ước số]
  #v(0.3em)
  #body
]

#let theory-box(body) = block(
  fill: rgb("EFF6FF"),
  stroke: (left: 4pt + c-navy, rest: 0.8pt + rgb("BFDBFE")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

#let compare-box(title: "📊 Bảng kiểm tra", body) = block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-teal, rest: 0.6pt + rgb("CBD5E1")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-teal, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let step-box(n, title, body) = block(
  fill: white,
  stroke: (left: 4pt + c-navy, rest: 0.6pt + rgb("DBEAFE")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.8em,
    align: (center + top, left + top),
    circle(radius: 10pt, fill: c-navy)[
      #text(fill: white, weight: "bold", size: 10.5pt)[#n]
    ],
    [
      #text(fill: c-navy, weight: "bold")[#title]
      #v(0.18em)
      #body
    ],
  )
]

#let ans-box(body) = block(
  fill: rgb("F0FDF4"),
  stroke: (left: 4pt + c-green, rest: 0.7pt + rgb("BBF7D0")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[✅ Kết luận]
  #v(0.3em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FEF2F2"),
  stroke: (left: 4pt + c-red, rest: 0.7pt + rgb("FECACA")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-red, weight: "bold")[⚠️ Lỗi sai thường gặp]
  #v(0.3em)
  #body
]

#let note-box(title: "📌 Phần nâng cao", body) = block(
  fill: rgb("FFF7ED"),
  stroke: (left: 4pt + c-amber, rest: 0.7pt + rgb("FED7AA")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let loigiai-box(body) = block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-slate, rest: 0.7pt + rgb("CBD5E1")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-slate, weight: "bold")[📝 Lời giải chi tiết]
  #v(0.3em)
  #body
]

#let qopen(body) = block(
  fill: rgb("FAF5FF"),
  stroke: (left: 3pt + c-violet, rest: 0.6pt + rgb("E9D5FF")),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: c-violet, weight: "bold", size: 9.5pt)[❓ Bài tập tự luyện]
  #v(0.22em)
  #body
]

#let activity-box(title: "🎓 Câu hỏi thảo luận mở", body) = block(
  fill: rgb("FFFBEB"),
  stroke: (left: 4pt + rgb("D97706"), rest: 0.7pt + rgb("FDE68A")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("B45309"), weight: "bold")[#title]
  #v(0.3em)
  #body
]

#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0B1120"), rgb("102A43"), rgb("1E3A8A"), angle: 140deg),
    inset: (x: 1.8cm, y: 1.35cm),
    radius: 12pt,
  )[
    #text(fill: rgb("BFDBFE"), size: 10.5pt, weight: "bold")[CHUYÊN ĐỀ SỐ HỌC VÀ XÁC SUẤT]
    #v(0.45em)
    #text(fill: white, size: 24pt, weight: "black")[Ước Số, Số Chính Phương & Lucky Light]
    #v(0.2em)
    #text(fill: rgb("DBEAFE"), size: 12pt)[Hiểu bằng cấu trúc ước số, không mô phỏng từng bước]
  ]
]

#v(0.9em)

#key-box[
  *Siêu ý tưởng cốt lõi:* Mọi bài toán có dạng _"đổi trạng thái $n$ lần, lần thứ $k$ tác động lên bội của $k$"_ đều quy về một nhận xét duy nhất:

  #align(center)[
    *Chỉ có số chính phương mới có số ước dương lẻ.*
  ]

  Từ đây, ta xác định trạng thái sau cùng của từng phần tử mà không cần mô phỏng cả quá trình.
]

#v(0.6em)

#theory-box[
  *Mục tiêu của tiết học này*:

  - Học sinh nhận ra: muốn biết màu cuối của bóng số $k$, ta phải nhìn vào *các ước của $k$*.
  - Học sinh hiểu: đổi màu một số lần *chẵn* thì quay về màu cũ, còn *lẻ* thì đổi sang màu kia.
  - Học sinh tự giải thích được vì sao *số chính phương* là trường hợp đặc biệt.
  - Sau cùng, bài xác suất được đưa về một thao tác rất quen: *đếm số chính phương không vượt quá $N$*.
]

= Mở Bài Sư Phạm — Làm Thử Với 6 Bóng

#eg-box(title: "🎯 Bài mở đầu rất nhỏ")[
  Có $6$ bóng đèn đánh số $1, 2, 3, 4, 5, 6$, tất cả ban đầu đều màu *đỏ*.

  Ta làm $6$ bước:

  - Bước $1$: đổi màu tất cả các bóng.
  - Bước $2$: đổi màu các bóng có số chia hết cho $2$.
  - Bước $3$: đổi màu các bóng có số chia hết cho $3$.
  - $ldots$
  - Bước $6$: đổi màu bóng số $6$.

  Hỏi sau cùng, những bóng nào màu *xanh*?
]

#insight-box[
  Đây là điểm vào nên dùng trên lớp. Với mô hình nhỏ, học sinh còn đủ sức tự liệt kê, tự kiểm tra và tự đoán quy luật. Chỉ sau đó mới nâng lên bài $2026$ bóng.
]

#step-box(1, "Theo dõi vài bóng cụ thể trước")[
  - Bóng số $4$ bị tác động ở các bước $1, 2, 4$, tức là bị đổi màu $3$ lần nên kết thúc ở màu *xanh*.
  - Bóng số $6$ bị tác động ở các bước $1, 2, 3, 6$, tức là bị đổi màu $4$ lần nên kết thúc ở màu *đỏ*.

  Giáo viên nên dừng lại ở đây và hỏi: *"Các bước tác động lên bóng số $k$ có điểm gì chung?"*
]

#step-box(2, "Chốt đúng câu hỏi")[
  Muốn biết màu cuối của bóng số $k$, ta không cần bám theo cả tiến trình $1, 2, 3, ldots, 6$.

  Ta chỉ cần trả lời đúng một câu:

  #align(center)[*Bóng số $k$ bị đổi màu bao nhiêu lần?*]

  Và số lần đó chính là số ước dương của $k$.
]

#compare-box(title: "📊 Bảng quan sát 6 bóng đầu")[
  #table(
    columns: (auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[Các bước tác động],
    text(fill: white, weight: "bold")[Số lần đổi],
    text(fill: white, weight: "bold")[Màu cuối],

    [$1$], [$1$], [$1$], [🔵 Xanh],
    [$2$], [$1, 2$], [$2$], [🔴 Đỏ],
    [$3$], [$1, 3$], [$2$], [🔴 Đỏ],
    [$4$], [$1, 2, 4$], [$3$], [🔵 Xanh],
    [$5$], [$1, 5$], [$2$], [🔴 Đỏ],
    [$6$], [$1, 2, 3, 6$], [$4$], [🔴 Đỏ],
  )

  #v(0.3em)
  *Quan sát quan trọng:* Trong $1, 2, 3, 4, 5, 6$ thì đúng là chỉ có $1$ và $4$ là số chính phương, và cũng chính là hai bóng màu xanh.
]

#ans-box[
  Với mô hình nhỏ này, học sinh có thể tự phát biểu quy luật đầu tiên:

  #align(center)[*Bóng mang số chính phương thường là bóng đổi màu lẻ lần.*]

  Đây chính là cầu nối tự nhiên để chuyển sang bài lớn hơn.
]

#insight-box(title: "💡 Câu chuyển sang bài gốc")[
  Bài $2026$ bóng không khác về bản chất. Khó khăn duy nhất là ta không thể mô phỏng bằng tay nữa, nên phải biến quan sát vừa có thành một kết luận tổng quát.
]

= I. Bài Toán Gốc — "Lucky Light" Từng Bước

#eg-box(title: "🎯 Bài toán Lucky Light 2026")[
  Có $2026$ bóng đèn đánh số $1, 2, ldots, 2026$, tất cả ban đầu màu *đỏ*.

  Thực hiện $2026$ bước liên tiếp. Ở *bước thứ $k$*, ta đổi màu mọi bóng có số thứ tự là bội của $k$ (đỏ $to$ xanh, hoặc xanh $to$ đỏ).

  Sau tất cả $2026$ bước, chọn ngẫu nhiên một bóng. Tính xác suất để bóng được chọn màu *đỏ*.

  *(Ghi kết quả dưới dạng phân số tối giản $P = m/n$, rồi tìm $m+n$.)*
]

#insight-box[
  *Điểm giáo viên cần chốt ngay:* đề hỏi xác suất, nhưng nút thắt thực sự lại nằm ở số học. Nếu đi theo kiểu "bước 1 làm gì, bước 2 làm gì, ..." thì học sinh rất dễ chìm trong thao tác. Lối ra là đổi góc nhìn: không theo *bước*, mà theo *từng bóng*.
]

#insight-box(title: "💬 Ba câu nên hỏi học sinh trước khi giải")[
  - Bóng số $12$ bị tác động ở những bước nào?
  - Những bước đó có đặc điểm chung gì?
  - Nếu biết số lần đổi màu là chẵn hay lẻ, em kết luận màu cuối ra sao?
]

== 1.1 Hỏi Đúng Câu Hỏi: Bóng $k$ Bị Tác Động Bao Nhiêu Lần?

#cach1-box[
  Thay vì hỏi "bước $j$ làm gì?", hãy hỏi: *bóng số $k$ bị đổi màu bao nhiêu lần?*

  Bóng $k$ bị đổi màu ở bước $j$ khi và chỉ khi $k$ là bội của $j$, tức là $j | k$.

  Vì vậy, số lần bóng $k$ bị đổi màu chính là *số ước dương* của $k$, ký hiệu là $d(k)$.

  #align(center)[*Bóng số $k$ bị đổi màu đúng $d(k)$ lần.*]
]

#insight-box(title: "💡 Câu bản lề nên viết riêng lên bảng")[
  *Bước tác động lên bóng số $k$ chính là một ước của $k$.* Khi học sinh nhớ được câu này, cả bài toán bắt đầu trở nên sáng sủa.
]

#eg-box(title: "Ví dụ cụ thể — bóng số 12")[
  Các bước tác động lên bóng số $12$ là: 1, 2, 3, 4, 6, 12.

  Vậy bóng này bị đổi màu $6$ lần, đúng bằng $d(12) = 6$.

  Bắt đầu từ đỏ, sau $6$ lần đổi màu, bóng quay lại màu *đỏ*.
]

#eg-box(title: "Ví dụ cụ thể — bóng số 9")[
  Các bước tác động lên bóng số $9$ là: 1, 3, 9.

  Vậy bóng này bị đổi màu $3$ lần, đúng bằng $d(9) = 3$.

  Bắt đầu từ đỏ, sau $3$ lần đổi màu, bóng kết thúc ở màu *xanh*.
]

== 1.2 Màu Cuối Phụ Thuộc Tính Chẵn/Lẻ Của $d(k)$

#theory-box[
  Bóng $k$ bắt đầu ở màu *đỏ*. Mỗi lần đổi sẽ làm màu luân phiên giữa đỏ và xanh.

  - Nếu $d(k)$ chẵn, bóng quay về *đỏ*.
  - Nếu $d(k)$ lẻ, bóng dừng ở *xanh*.

  #align(center)[*Bóng $k$ xanh khi và chỉ khi $d(k)$ lẻ.*]
  #align(center)[*Bóng $k$ đỏ khi và chỉ khi $d(k)$ chẵn.*]
]

== 1.3 Câu Hỏi Cốt Lõi: Khi Nào $d(k)$ Lẻ?

Đây là trái tim của cả chuyên đề. Trước khi chứng minh, nên cho học sinh tự kiểm tra vài số quen thuộc như $1, 4, 9, 16$ và $2, 3, 6, 12$ để các em tự dự đoán:

#align(center)[*Có vẻ chỉ số chính phương mới có số ước lẻ.*]

Sau khi học sinh đã có dự đoán, ta mới đi tới lời giải.

=== Cách 1 — Lập Luận Ghép Cặp

#theory-box[
  Nếu $a$ là một ước của $k$ thì $k/a$ cũng là một ước của $k$.

  Ta ghép các ước thành từng cặp $(a, k/a)$.

  - Nếu $k$ *không phải* số chính phương, mọi cặp đều gồm hai ước khác nhau, nên tổng số ước là số chẵn.
  - Nếu $k = m^2$ là số chính phương, ngoài các cặp thông thường còn có ước trung tâm $m$ tự ghép với chính nó. Vì xuất hiện thêm đúng một ước "đứng riêng", tổng số ước trở thành số lẻ.

  *Kết luận:* $d(k)$ lẻ khi và chỉ khi $k$ là số chính phương. $square$
]

#eg-box(title: [Minh họa ghép cặp với $k = 36 = 6^2$])[
  Các ước của $36$ là: 1, 2, 3, 4, 6, 9, 12, 18, 36.

  Ta có các cặp $(1, 36)$, $(2, 18)$, $(3, 12)$, $(4, 9)$ và ước trung tâm $6$.

  Vậy $d(36) = 9$ là số lẻ, nên bóng số $36$ kết thúc ở màu *xanh*.
]

=== Cách 2 — Từ Công Thức $d(n)$ (dùng để củng cố sau khi đã hiểu Cách 1)

#theory-box[
  *Định lý phân tích ước:* Nếu
  #align(center)[$n = p_1^{a_1} p_2^{a_2} cdots p_r^{a_r}$]
  thì
  #align(center)[$d(n) = (a_1 + 1)(a_2 + 1) cdots (a_r + 1)$]

  *Vì sao?* Mỗi ước của $n$ có dạng $p_1^{b_1} p_2^{b_2} cdots p_r^{b_r}$ với $0 leq b_i leq a_i$. Mỗi số mũ $b_i$ có $a_i + 1$ lựa chọn, nên tổng số ước là tích của các số lựa chọn đó.

  *Khi nào $d(n)$ lẻ?* Tích trên lẻ khi và chỉ khi mọi thừa số $a_i + 1$ đều lẻ, tức là mọi $a_i$ đều chẵn. Khi đó $n$ là một số chính phương.
]

#note-box(title: "📌 Gợi ý sư phạm khi dạy phần này")[
  Không nên mở đầu bằng công thức $d(n) = (a_1 + 1)(a_2 + 1) cdots (a_r + 1)$ nếu lớp còn yếu. Cách ghép cặp ước dễ nhìn hơn, ít ký hiệu hơn, và giúp học sinh tự tin hơn. Công thức này nên dùng ở bước *củng cố* hoặc *bồi dưỡng*.
]

#compare-box(title: "📊 Bảng kiểm tra — 10 số đầu")[
  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[$k$],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[Ước số],
    text(fill: white, weight: "bold")[$d(k)$],
    text(fill: white, weight: "bold")[Màu cuối],

    [$1 = 1^2$], [$1$], [1], [$1$ (lẻ)], [🔵 Xanh],
    [$2$], [$2$], [1, 2], [$2$ (chẵn)], [🔴 Đỏ],
    [$3$], [$3$], [1, 3], [$2$ (chẵn)], [🔴 Đỏ],
    [$4 = 2^2$], [$2^2$], [1, 2, 4], [$3$ (lẻ)], [🔵 Xanh],
    [$6$], [$2 cdot 3$], [1, 2, 3, 6], [$4$ (chẵn)], [🔴 Đỏ],
    [$9 = 3^2$], [$3^2$], [1, 3, 9], [$3$ (lẻ)], [🔵 Xanh],
    [$12$], [$2^2 cdot 3$], [1, 2, 3, 4, 6, 12], [$6$ (chẵn)], [🔴 Đỏ],
    [$16 = 4^2$], [$2^4$], [1, 2, 4, 8, 16], [$5$ (lẻ)], [🔵 Xanh],
    [$18$], [$2 cdot 3^2$], [1, 2, 3, 6, 9, 18], [$6$ (chẵn)], [🔴 Đỏ],
    [$25 = 5^2$], [$5^2$], [1, 5, 25], [$3$ (lẻ)], [🔵 Xanh],
  )

  #v(0.3em)
  *Nhận xét:* Chỉ các số chính phương cho màu xanh.
]

== 1.4 Đếm Và Tính Xác Suất

#step-box(1, "Đếm số bóng xanh (= số chính phương không vượt quá 2026)")[
  Ta cần tìm số nguyên lớn nhất $m$ sao cho $m^2 leq 2026$.

  - $44^2 = 1936 leq 2026$
  - $45^2 = 2025 leq 2026$
  - $46^2 = 2116 > 2026$

  Vậy có đúng #strong[45] số chính phương không vượt quá $2026$.
]

#step-box(2, "Số bóng đỏ")[
  Số bóng đỏ bằng $2026 - 45 = 1981$.
]

#step-box(3, "Xác suất và kiểm tra tối giản")[
  Xác suất chọn được bóng đỏ là
  #align(center)[$P = frac(1981, 2026)$]

  Ta có $2026 = 2 times 1013$ và $1981 = 7 times 283$. Hai số này không có ước nguyên tố chung, nên $gcd(1981, 2026) = 1$.
]

#ans-box[
  #align(center)[$P = frac(1981, 2026)$]
  #align(center)[*Suy ra $m + n = 1981 + 2026 = 4007$.*]
]

#insight-box(title: "💡 Chốt lại bài gốc bằng ngôn ngữ thật ngắn")[
  Toàn bộ bài toán đã được tách thành hai việc quen thuộc:

  - Việc 1: nhận ra bóng xanh tương ứng với số chính phương.
  - Việc 2: đếm có bao nhiêu số chính phương từ $1$ đến $2026$.

  Như vậy, phần xác suất ở cuối chỉ còn là bước ghi phân số thuận lợi trên tổng số khả năng.
]

#warn-box[
  Nhiều học sinh đếm nhầm *bóng xanh* rồi ghi luôn đáp số, hoặc lấy gần đúng kiểu $N/2$ thay vì đếm số chính phương bằng $floor(sqrt(N))$. Với dạng này, luôn đọc lại xem đề hỏi *đỏ* hay *xanh* trước khi chốt kết quả.
]

#v(1em)

= II. Nền Tảng Lý Thuyết — Hiểu Sâu Hàm $d(n)$

== 2.1 Hàm Đếm Ước $d(n)$

#theory-box[
  *Định nghĩa:* $d(n)$ là số ước dương của $n$.

  *Tính nhân:* Nếu $gcd(a, b) = 1$ thì $d(a cdot b) = d(a) d(b)$.

  *Giải thích ngắn:* Mỗi ước của $a b$ được viết duy nhất dưới dạng $d_1 d_2$ với $d_1 | a$ và $d_2 | b$. Vì vậy, số ước của $a b$ bằng số cách chọn $d_1$ nhân với số cách chọn $d_2$.

  *Công thức tường minh:* Nếu $n = p_1^{a_1} p_2^{a_2} cdots p_r^{a_r}$ thì
  #align(center)[$d(n) = product_(i=1)^r (a_i + 1)$]

  #align(center)[*Hệ quả quan trọng: $d(n)$ lẻ đúng khi $n$ là số chính phương.*]
]

#eg-box(title: [Luyện tính $d(n)$ nhanh])[
  - $d(2^3 cdot 3^1 cdot 5^2) = (3+1)(1+1)(2+1) = 24$, nên số lần đổi màu là chẵn.
  - $d(2^2 cdot 7^2) = (2+1)(2+1) = 9$, nên số lần đổi màu là lẻ.
  - $d(2^4 cdot 3^2 cdot 5^2) = 5 cdot 3 cdot 3 = 45$, cũng là một số lẻ.
]

== 2.2 Đếm Số Chính Phương

#theory-box[
  Số lượng số chính phương không vượt quá $N$ bằng
  #align(center)[$floor(sqrt(N))$]

  *Cách nhớ nhanh:* tìm số nguyên lớn nhất $m$ sao cho $m^2 leq N$.

  *Bảng tra nhanh cho đề thi:*
  #table(
    columns: (auto, auto, auto, auto, auto, auto),
    inset: 5pt,
    align: center,
    stroke: 0.4pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("334155") } else { white },
    text(fill: white, weight: "bold")[$N$],
    text(fill: white, weight: "bold")[100],
    text(fill: white, weight: "bold")[500],
    text(fill: white, weight: "bold")[1000],
    text(fill: white, weight: "bold")[2024],
    text(fill: white, weight: "bold")[2025],

    [$floor(sqrt(N))$], [10], [22], [31], [44], [45],
  )

  *Chú ý:* $2025 = 45^2$ là một điểm biên rất dễ gài bẫy; sang $2026$ thì kết quả vẫn là $45$.
]

== 2.3 Kết Nối Sâu — Góc Nhìn Nâng Cao

#note-box(title: "📌 Phần nâng cao — Dành cho HSG và học sinh tự học")[
  Trong lý thuyết số giải tích, hàm $d$ có một hàm sinh Dirichlet rất đẹp:
  #align(center)[$sum_(n=1)^infty frac(d(n), n^s) = zeta(s)^2$]

  Một góc nhìn khác dùng hàm Liouville:
  #align(center)[$lambda(n) = (-1)^(Omega(n))$]

  Vì $Omega(n^2) = 2Omega(n)$ luôn chẵn nên $lambda(n^2) = 1$. Điều này phản ánh việc tính chẵn lẻ của $d(n)$ gắn rất sâu với cấu trúc nhân của số nguyên.
]

#v(1em)

= III. 7 Biến Thể Đề Thi — Nhận Dạng Và Lời Giải

#insight-box[
  *Chiến lược nhận dạng:* Bài toán thuộc họ này khi có đủ ba dấu hiệu: có một tập đối tượng được đánh số, vòng $k$ tác động lên mọi bội của $k$, và đề hỏi trạng thái cuối cùng hoặc một xác suất liên quan đến trạng thái đó.
]

== 3.1 Biến Thể 1 — Tủ Khóa Trường Học

#eg-box(title: "📚 Bài toán — Locker Problem")[
  Có $100$ tủ khóa đánh số từ $1$ đến $100$, ban đầu đều *đóng*.

  Học sinh thứ $k$ đổi trạng thái mọi tủ có số là bội của $k$.

  *Câu a)* Sau cùng những tủ nào mở?

  *Câu b)* Xác suất chọn ngẫu nhiên được một tủ đang mở bằng bao nhiêu?
]

#loigiai-box[
  Mỗi tủ số $j$ bị đổi trạng thái đúng $d(j)$ lần.

  Tủ mở khi và chỉ khi số lần đổi là lẻ, tức là khi $j$ là số chính phương.

  *Câu a)* Các tủ mở là: 1, 4, 9, 16, 25, 36, 49, 64, 81, 100.

  *Câu b)* Có $10$ tủ mở, nên xác suất cần tìm là $frac(10, 100) = frac(1, 10)$.
]

== 3.2 Biến Thể 2 — Công Tắc Đèn Hành Lang

#eg-box(title: "💡 Bài toán — Công tắc")[
  Có $60$ công tắc đánh số từ $1$ đến $60$, ban đầu đều *tắt*.

  Người thứ $k$ bật hoặc tắt mọi công tắc có số là bội của $k$.

  *Câu a)* Những công tắc nào bật sau cùng?

  *Câu b)* Xác suất chọn ngẫu nhiên được một công tắc đang bật bằng bao nhiêu?
]

#loigiai-box[
  Công tắc số $j$ bật sau cùng khi và chỉ khi $d(j)$ lẻ, tức là khi $j$ là số chính phương.

  Các công tắc bật là $1^2, 2^2, 3^2, 4^2, 5^2, 6^2, 7^2$, tức 1, 4, 9, 16, 25, 36, 49.

  Có $floor(sqrt(60)) = 7$ công tắc bật, nên xác suất cần tìm là $frac(7, 60)$.
]

== 3.3 Biến Thể 3 — Đồng Xu Lật

#eg-box(title: "🪙 Bài toán — Đồng xu")[
  Có $200$ đồng xu đánh số từ $1$ đến $200$, ban đầu đều *ngửa*.

  Ở vòng $k$, ta lật mọi đồng xu có số là bội của $k$.

  *Câu a)* Đồng xu số $180$ kết thúc ở trạng thái nào?

  *Câu b)* Xác suất chọn ngẫu nhiên được một đồng xu *sấp* bằng bao nhiêu?

  *Câu c)* Biết đồng xu đã chọn đang sấp, xác suất để nó mang số lẻ bằng bao nhiêu?
]

#loigiai-box[
  Đồng xu số $j$ sấp sau cùng khi và chỉ khi $d(j)$ lẻ, tức là khi $j$ là số chính phương.

  *Câu a)* $180 = 2^2 cdot 3^2 cdot 5$, nên $d(180) = (2+1)(2+1)(1+1) = 18$. Đây là số chẵn, nên đồng xu số $180$ vẫn *ngửa*.

  *Câu b)* Có $floor(sqrt(200)) = 14$ số chính phương không vượt quá $200$, nên xác suất chọn được đồng xu sấp là $frac(14, 200) = frac(7, 100)$.

  *Câu c)* Trong $1, 2, ldots, 14$ có đúng $7$ số lẻ. Vì $m^2$ lẻ khi và chỉ khi $m$ lẻ, nên xác suất cần tìm là $frac(7, 14) = frac(1, 2)$.
]

== 3.4 Biến Thể 4 — Bóng Đèn 3 Màu

#eg-box(title: "🔴🔵🟡 Bài toán — 3 màu")[
  Có $30$ bóng đèn, ban đầu đều màu *đỏ*. Mỗi lần đổi màu sẽ xoay vòng theo quy luật: Đỏ $to$ Xanh $to$ Vàng $to$ Đỏ.

  Ở bước $k$, ta đổi màu mọi bóng có số là bội của $k$.

  Sau $30$ bước, bóng số $12$ có màu gì? Bóng số $8$ có màu gì?
]

#theory-box[
  Với bài 3 màu, ta không còn xét *chẵn/lẻ* nữa. Thay vào đó, nếu một bóng bị đổi màu $t$ lần thì ta đọc màu cuối theo $t mod 3$.
]

#compare-box(title: "📊 Bảng quy đổi 3 màu")[
  #table(
    columns: (auto, 1fr, auto),
    inset: 6pt,
    align: center,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[$d(j) mod 3$],
    text(fill: white, weight: "bold")[Ý nghĩa],
    text(fill: white, weight: "bold")[Màu cuối],

    [$0$], [Đổi màu trọn vẹn đủ $3$ bước một vòng], [🔴 Đỏ],
    [$1$], [Tiến thêm $1$ nấc từ màu ban đầu], [🔵 Xanh],
    [$2$], [Tiến thêm $2$ nấc từ màu ban đầu], [🟡 Vàng],
  )
]

#loigiai-box[
  *Bảng xử lý nhanh cho đề gốc:*

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("334155") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[$d(j)$],
    text(fill: white, weight: "bold")[$d(j) mod 3$],
    text(fill: white, weight: "bold")[Màu cuối],

    [$12$], [$12 = 2^2 cdot 3$], [$6$], [$0$], [🔴 Đỏ],
    [$8$], [$8 = 2^3$], [$4$], [$1$], [🔵 Xanh],
  )

  *Kết luận:* bóng số $12$ màu *đỏ*, còn bóng số $8$ màu *xanh*.
]

#insight-box[
  Điểm mới của bài 3 màu là: không có một tập đẹp kiểu "toàn bộ số chính phương" nữa. Cách an toàn và sư phạm nhất là *lập bảng*: phân tích thừa số nguyên tố $to$ tính $d(j)$ $to$ lấy modulo $3$ $to$ đọc màu.
]

=== Ví dụ 1 — Đếm Đủ 12 Bóng Theo Bảng

#qopen[
  *Ví dụ 1.* Có $12$ bóng đèn 3 màu như trên, ban đầu đều màu đỏ. Sau $12$ bước, có bao nhiêu bóng màu đỏ, bao nhiêu bóng màu xanh và bao nhiêu bóng màu vàng?
]

#loigiai-box[
  Ta lập bảng cho từng bóng từ $1$ đến $12$:

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 5pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("0F766E") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Bóng],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[$d(j)$],
    text(fill: white, weight: "bold")[$mod 3$],
    text(fill: white, weight: "bold")[Màu],

    [$1$], [$1$], [$1$], [$1$], [🔵 Xanh],
    [$2$], [$2$], [$2$], [$2$], [🟡 Vàng],
    [$3$], [$3$], [$2$], [$2$], [🟡 Vàng],
    [$4$], [$2^2$], [$3$], [$0$], [🔴 Đỏ],
    [$5$], [$5$], [$2$], [$2$], [🟡 Vàng],
    [$6$], [$2 cdot 3$], [$4$], [$1$], [🔵 Xanh],
    [$7$], [$7$], [$2$], [$2$], [🟡 Vàng],
    [$8$], [$2^3$], [$4$], [$1$], [🔵 Xanh],
    [$9$], [$3^2$], [$3$], [$0$], [🔴 Đỏ],
    [$10$], [$2 cdot 5$], [$4$], [$1$], [🔵 Xanh],
    [$11$], [$11$], [$2$], [$2$], [🟡 Vàng],
    [$12$], [$2^2 cdot 3$], [$6$], [$0$], [🔴 Đỏ],
  )

  Từ bảng trên, ta đếm được:

  - Màu đỏ: các bóng $4, 9, 12$, nên có $3$ bóng.
  - Màu xanh: các bóng $1, 6, 8, 10$, nên có $4$ bóng.
  - Màu vàng: các bóng còn lại $2, 3, 5, 7, 11$, nên có $5$ bóng.

  *Kết luận:* Sau $12$ bước, có $3$ bóng đỏ, $4$ bóng xanh và $5$ bóng vàng.
]

=== Ví dụ 2 — Tính Xác Suất Chọn Được Bóng Vàng

#qopen[
  *Ví dụ 2.* Có $18$ bóng đèn 3 màu như trên. Sau khi thực hiện đủ $18$ bước, chọn ngẫu nhiên một bóng. Tính xác suất để bóng được chọn màu vàng.
]

#loigiai-box[
  Ta tiếp tục phân loại theo $d(j) mod 3$.

  #table(
    columns: (auto, auto, auto, auto),
    inset: 5pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("B45309") } else if calc.rem(row, 2) == 0 { rgb("FFFBEB") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[$d(j)$],
    text(fill: white, weight: "bold")[$d(j) mod 3$],
    text(fill: white, weight: "bold")[Màu],

    [$1$], [$1$], [$1$], [🔵 Xanh],
    [$2$], [$2$], [$2$], [🟡 Vàng],
    [$3$], [$2$], [$2$], [🟡 Vàng],
    [$4$], [$3$], [$0$], [🔴 Đỏ],
    [$5$], [$2$], [$2$], [🟡 Vàng],
    [$6$], [$4$], [$1$], [🔵 Xanh],
    [$7$], [$2$], [$2$], [🟡 Vàng],
    [$8$], [$4$], [$1$], [🔵 Xanh],
    [$9$], [$3$], [$0$], [🔴 Đỏ],
    [$10$], [$4$], [$1$], [🔵 Xanh],
    [$11$], [$2$], [$2$], [🟡 Vàng],
    [$12$], [$6$], [$0$], [🔴 Đỏ],
    [$13$], [$2$], [$2$], [🟡 Vàng],
    [$14$], [$4$], [$1$], [🔵 Xanh],
    [$15$], [$4$], [$1$], [🔵 Xanh],
    [$16$], [$5$], [$2$], [🟡 Vàng],
    [$17$], [$2$], [$2$], [🟡 Vàng],
    [$18$], [$6$], [$0$], [🔴 Đỏ],
  )

  Các bóng màu vàng là $2, 3, 5, 7, 11, 13, 16, 17$, tổng cộng $8$ bóng.

  Vì có tất cả $18$ bóng nên xác suất cần tìm là
  #align(center)[$P("vàng") = frac(8, 18) = frac(4, 9)$]
]

=== Ví dụ 3 — Xác Suất Có Điều Kiện Trong Bài 3 Màu

#qopen[
  *Ví dụ 3.* Có $24$ bóng đèn 3 màu như trên. Biết rằng bóng được chọn *không màu đỏ*. Tính xác suất để bóng đó màu vàng.
]

#loigiai-box[
  Với bài này, thay vì ghi đủ $24$ dòng, ta gom luôn theo từng màu sau khi lập bảng phân loại:

  #table(
    columns: (auto, 1fr, auto),
    inset: 6pt,
    align: (center, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("7C2D12") } else if calc.rem(row, 2) == 0 { rgb("FFF7ED") } else { white },
    text(fill: white, weight: "bold")[Màu],
    text(fill: white, weight: "bold")[Các bóng],
    text(fill: white, weight: "bold")[Số lượng],

    [🔴 Đỏ], [$4, 9, 12, 18, 20$], [$5$],
    [🔵 Xanh], [$1, 6, 8, 10, 14, 15, 21, 22$], [$8$],
    [🟡 Vàng], [$2, 3, 5, 7, 11, 13, 16, 17, 19, 23, 24$], [$11$],
  )

  Điều kiện "không đỏ" nghĩa là ta chỉ xét các bóng màu xanh hoặc màu vàng. Khi đó không gian xét lại có
  #align(center)[$8 + 11 = 19$]
  bóng.

  Trong số đó, có $11$ bóng màu vàng. Vì vậy,
  #align(center)[$P("vàng" | "không đỏ") = frac(11, 19)$]

  *Nhận xét sư phạm:* bài 3 màu thường nên giải bằng bảng tổng hợp màu cuối. Khi đã có bảng tổng hợp, các câu xác suất có điều kiện trở nên rất gọn.
]

== 3.5 Biến Thể 5 — Xác Suất Có Điều Kiện

#eg-box(title: "🎲 Bài toán — Lucky Light + Bayes")[
  Với $n = 400$, sau quy trình Lucky Light ta chọn ngẫu nhiên một bóng *xanh*.

  *Câu a)* Xác suất để bóng đó là số chẵn.

  *Câu b)* Xác suất để bóng đó là bội của $5$.

  *Câu c)* Xác suất để bóng đó *không phải* số chính phương của số nguyên tố.
]

#loigiai-box[
  Các bóng xanh chính là $1^2, 2^2, ldots, 20^2$, nên có $20$ bóng.

  *Câu a)* $m^2$ chẵn khi và chỉ khi $m$ chẵn. Trong $1, 2, ldots, 20$ có $10$ số chẵn, nên xác suất là $frac(10, 20) = frac(1, 2)$.

  *Câu b)* $m^2$ là bội của $5$ khi và chỉ khi $m$ là bội của $5$. Có đúng $4$ giá trị $m$ thỏa mãn: 5, 10, 15, 20. Vậy xác suất là $frac(4, 20) = frac(1, 5)$.

  *Câu c)* Mọi bóng xanh đều là số chính phương theo định nghĩa, nên xác suất nêu ra bằng $0$. Đây là một bẫy đọc đề rất quen thuộc.
]

== 3.6 Biến Thể 6 — Chỉ Thực Hiện Các Bước Nguyên Tố

#eg-box(title: "🔢 Bài toán — Bước nguyên tố")[
  Có $50$ bóng đèn, ban đầu đều đỏ. Ta chỉ thực hiện bước $p$ với $p$ là số nguyên tố không vượt quá $50$.

  Khi đó bóng số $j$ bị đổi màu đúng $omega(j)$ lần, trong đó $omega(j)$ là số thừa số nguyên tố *phân biệt* của $j$.

  Hỏi bóng số $30$ và bóng số $32$ có màu gì sau cùng?
]

#loigiai-box[
  *Bóng 30:* $30 = 2 cdot 3 cdot 5$, nên $omega(30) = 3$ là số lẻ. Bóng số $30$ màu *xanh*.

  *Bóng 32:* $32 = 2^5$, nên $omega(32) = 1$ là số lẻ. Bóng số $32$ cũng màu *xanh*.

  *Ghi chú:* Đây không còn là Lucky Light gốc. Ở đây màu cuối phụ thuộc vào tính chẵn lẻ của $omega(j)$ chứ không phụ thuộc trực tiếp vào việc $j$ có là số chính phương hay không.
]

== 3.7 Biến Thể 7 — Dạng Đúng/Sai ĐGNL

#eg-box(title: "📝 Bài toán — Dạng mệnh đề ĐGNL")[
  Xét Lucky Light với $n$ bóng đèn. Gọi $X$ là số bóng xanh sau $n$ bước. Xét các mệnh đề:

  *(a)* $X = floor(sqrt(n))$.

  *(b)* $X < n - X$ với mọi $n geq 4$.

  *(c)* Tồn tại $n$ sao cho $X = n/2$.

  *(d)* Tỉ lệ bóng xanh tiến về $0$ khi $n$ tăng rất lớn.
]

#loigiai-box[
  *(a)* *Đúng.* Vì bóng xanh chính là các số chính phương không vượt quá $n$.

  *(b)* *Sai.* Phản ví dụ ngay tại $n = 4$: khi đó có $2$ bóng xanh và $2$ bóng đỏ, nên không có bất đẳng thức nghiêm ngặt.

  *(c)* *Đúng.* Cũng với $n = 4$ thì $X = 2 = n/2$.

  *(d)* *Đúng.* Ta có $frac(X, n) = frac(floor(sqrt(n)), n) approx frac(1, sqrt(n))$, nên tỉ lệ này tiến về $0$ khi $n$ tăng.

  *Đáp tóm tắt:* (a) Đúng, (b) Sai, (c) Đúng, (d) Đúng.
]

#v(1em)

= IV. Chiến Lược Giải Nhanh & Dự Đoán Đề Thi

#insight-box[
  Phần này không chỉ để "đọc mẹo". Mỗi nhóm dưới đây đều được viết theo nhịp dạy học: *nhận dạng đề* $to$ *lập bảng* $to$ *kết luận*. Nếu dùng khi ôn thi, giáo viên có thể chọn mỗi nhóm một ví dụ đại diện để luyện cho học sinh phản xạ đúng.
]

== 4.1 Bảng Chẩn Đoán 4 Bước

#compare-box(title: "📊 Nhìn đề và quyết định ngay cách làm")[
  #table(
    columns: (1.2fr, 1.2fr, 1.1fr, 1fr),
    inset: 7pt,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    align: (left, left, center, left),
    text(fill: white, weight: "bold")[Dấu hiệu trong đề],
    text(fill: white, weight: "bold")[Câu cần đổi ra],
    text(fill: white, weight: "bold")[Đại lượng đếm],
    text(fill: white, weight: "bold")[Kết luận cuối],

    ["Bội của $k$", đổi 2 trạng thái], [Phần tử $j$ bị tác động mấy lần?], [$d(j)$], [Xét chẵn/lẻ],
    [Chỉ làm bước nguyên tố], [Có bao nhiêu nguyên tố phân biệt chia $j$?], [$omega(j)$], [Xét chẵn/lẻ],
    [3 màu, 4 màu, nhiều trạng thái],
    [Sau bao nhiêu lần đổi thì quay lại màu cũ?],
    [$d(j)$ hoặc số lần tác động tương ứng],
    [Xét modulo số trạng thái],

    [Hỏi xác suất],
    [Có bao nhiêu chỉ số dẫn tới trạng thái cần hỏi?],
    [Kích thước tập thỏa],
    [Lấy số thuận lợi chia tổng số],
  )
]

#step-box(1, "Đọc từ khóa, không mô phỏng ngay")[
  Nếu đề có cụm *"bội của $k$"*, *"đổi trạng thái"*, *"lật"*, *"mở/đóng"* thì phản xạ đầu tiên phải là: *bài này đang giấu câu chuyện ước số*.
]

#step-box(2, "Quy về một phần tử mang số $j$")[
  Đừng đi theo tiến trình $1, 2, 3, ldots, n$. Hãy đứng yên tại phần tử số $j$ và hỏi: *những bước nào chạm vào nó?* Khi đó bài toán thường gọn đi rất nhanh.
]

#step-box(3, "Lập bảng ngắn")[
  Với bài hỏi vài chỉ số cụ thể, bảng nên có 4 cột: *chỉ số* $to$ *phân tích thừa số nguyên tố* $to$ *số lần tác động* $to$ *trạng thái cuối*. Với bài xác suất, thêm cột *số lượng* hoặc *tập chỉ số thỏa mãn*.
]

#step-box(4, "Chốt bằng một câu kết luận ngắn")[
  Sau khi có bảng, phần kết luận nên thật gọn: *đối tượng nào thỏa*, *có bao nhiêu đối tượng*, *xác suất bằng bao nhiêu*. Tránh sa vào diễn giải dài sau khi đáp án đã hiện ra trong bảng.
]

#eg-box(title: "🎯 Ví dụ dẫn nhập cho quy trình 4 bước")[
  Có $90$ bóng đèn Lucky Light, ban đầu đều đỏ. Hỏi bóng số $48$ và bóng số $49$ có màu gì sau cùng?
]

#loigiai-box[
  Ta dùng đúng bảng chẩn đoán ở trên:

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("475569") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[$d(j)$],
    text(fill: white, weight: "bold")[Chẵn/Lẻ],
    text(fill: white, weight: "bold")[Màu cuối],

    [$48$], [$48 = 2^4 cdot 3$], [$(4+1)(1+1) = 10$], [Chẵn], [🔴 Đỏ],
    [$49$], [$49 = 7^2$], [$(2+1) = 3$], [Lẻ], [🔵 Xanh],
  )

  Vậy bóng số $48$ màu *đỏ*, còn bóng số $49$ màu *xanh*.
]

== 4.2 Nhóm Dự Đoán 1 — Dạng Hỏi Trạng Thái Cuối Của Một Vài Phần Tử

#note-box(title: "📌 Dấu hiệu nhận ra")[
  Đề thường hỏi: *bóng số bao nhiêu màu gì*, *tủ số mấy mở hay đóng*, *đồng xu số nào ngửa hay sấp*. Đây là nhóm dễ ra ở mức nhận biết và thông hiểu. Cách làm tốt nhất là lập bảng cho đúng các chỉ số được hỏi.
]

#qopen[
  *Ví dụ 1.1.* Có $150$ bóng đèn Lucky Light, ban đầu đều đỏ. Hỏi bóng số $72$, $81$ và $96$ có màu gì sau cùng?
]

#loigiai-box[
  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("0F766E") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[$d(j)$],
    text(fill: white, weight: "bold")[Chẵn/Lẻ],
    text(fill: white, weight: "bold")[Màu cuối],

    [$72$], [$2^3 cdot 3^2$], [$(3+1)(2+1) = 12$], [Chẵn], [🔴 Đỏ],
    [$81$], [$3^4$], [$(4+1) = 5$], [Lẻ], [🔵 Xanh],
    [$96$], [$2^5 cdot 3$], [$(5+1)(1+1) = 12$], [Chẵn], [🔴 Đỏ],
  )

  Chỉ có bóng số $81$ là số chính phương nên kết thúc ở màu *xanh*. Hai bóng còn lại màu *đỏ*.
]

#qopen[
  *Ví dụ 1.2.* Có $200$ tủ khóa, ban đầu đều đóng. Học sinh thứ $k$ đổi trạng thái mọi tủ có số là bội của $k$. Hỏi các tủ số $144$, $145$, $169$ mở hay đóng sau cùng?
]

#loigiai-box[
  Ta cũng lập bảng y hệt, chỉ thay cách đọc trạng thái cuối: *lẻ* $to$ mở, *chẵn* $to$ đóng.

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("2563EB") } else if calc.rem(row, 2) == 0 { rgb("EFF6FF") } else { white },
    text(fill: white, weight: "bold")[Tủ số],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[$d(j)$],
    text(fill: white, weight: "bold")[Chẵn/Lẻ],
    text(fill: white, weight: "bold")[Trạng thái],

    [$144$], [$2^4 cdot 3^2$], [$(4+1)(2+1) = 15$], [Lẻ], [Mở],
    [$145$], [$5 cdot 29$], [$(1+1)(1+1) = 4$], [Chẵn], [Đóng],
    [$169$], [$13^2$], [$(2+1) = 3$], [Lẻ], [Mở],
  )

  Vậy hai tủ $144$ và $169$ mở, còn tủ $145$ đóng.
]

#qopen[
  *Ví dụ 1.3.* Có $120$ bóng đèn, ban đầu đều đỏ. Ta *chỉ* thực hiện các bước nguyên tố $2, 3, 5, 7, ldots$ không vượt quá $120$. Hỏi bóng số $72$, $75$, $97$ có màu gì sau cùng?
]

#loigiai-box[
  Vì chỉ làm các bước nguyên tố, số lần tác động lên bóng số $j$ là $omega(j)$, tức là số thừa số nguyên tố *phân biệt* của $j$.

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("7C3AED") } else if calc.rem(row, 2) == 0 { rgb("F5F3FF") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[$omega(j)$],
    text(fill: white, weight: "bold")[Chẵn/Lẻ],
    text(fill: white, weight: "bold")[Màu cuối],

    [$72$], [$2^3 cdot 3^2$], [$2$], [Chẵn], [🔴 Đỏ],
    [$75$], [$3 cdot 5^2$], [$2$], [Chẵn], [🔴 Đỏ],
    [$97$], [$97$ nguyên tố], [$1$], [Lẻ], [🔵 Xanh],
  )

  Vậy hai bóng $72, 75$ màu đỏ, còn bóng $97$ màu xanh.
]

== 4.3 Nhóm Dự Đoán 2 — Dạng Hỏi Số Lượng Hoặc Xác Suất Trực Tiếp

#note-box(title: "📌 Dấu hiệu nhận ra")[
  Đề thường hỏi: *có bao nhiêu đối tượng ở trạng thái đó*, *xác suất chọn được một bóng đỏ/xanh*, *có bao nhiêu tủ mở*. Đây là nhóm trọng tâm trong đề thi vì vừa kiểm tra nhận dạng, vừa kiểm tra thao tác đếm.
]

#qopen[
  *Ví dụ 2.1.* Có $500$ bóng đèn Lucky Light, ban đầu đều đỏ. Tính xác suất chọn được một bóng màu xanh.
]

#loigiai-box[
  Bóng màu xanh tương ứng với số chính phương. Ta tìm số chính phương không vượt quá $500$:
  #align(center)[$22^2 = 484 leq 500 < 23^2 = 529$]

  Vậy có $22$ bóng xanh. Ta tóm tắt bằng bảng:

  #table(
    columns: (1fr, 1.2fr, auto),
    inset: 6pt,
    align: (left, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("334155") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Trạng thái],
    text(fill: white, weight: "bold")[Tập chỉ số],
    text(fill: white, weight: "bold")[Số lượng],

    [Xanh], [Các số chính phương từ $1^2$ đến $22^2$], [$22$],
    [Đỏ], [Các số còn lại], [$500 - 22 = 478$],
  )

  Do đó
  #align(center)[$P("xanh") = frac(22, 500) = frac(11, 250)$]
]

#qopen[
  *Ví dụ 2.2.* Có $144$ tủ khóa, ban đầu đều đóng. Sau toàn bộ quá trình, xác suất chọn ngẫu nhiên được một tủ đang mở bằng bao nhiêu?
]

#loigiai-box[
  Tủ mở là các tủ mang số chính phương. Vì $144 = 12^2$ nên có đúng $12$ tủ mở.

  #table(
    columns: (1fr, 1.1fr, auto),
    inset: 6pt,
    align: (left, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("0F766E") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Loại tủ],
    text(fill: white, weight: "bold")[Các số],
    text(fill: white, weight: "bold")[Số lượng],

    [Mở], [$1^2, 2^2, ldots, 12^2$], [$12$],
    [Đóng], [Các số còn lại], [$144 - 12 = 132$],
  )

  Vậy xác suất chọn được tủ mở là
  #align(center)[$frac(12, 144) = frac(1, 12)$]
]

#qopen[
  *Ví dụ 2.3.* Có $12$ bóng đèn 3 màu như trong biến thể 3 màu. Sau $12$ bước, xác suất chọn được bóng màu vàng bằng bao nhiêu?
]

#loigiai-box[
  Từ bảng đã lập trong Ví dụ 1 của phần 3 màu, ta có:

  #table(
    columns: (auto, 1fr, auto),
    inset: 6pt,
    align: (center, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("B45309") } else if calc.rem(row, 2) == 0 { rgb("FFFBEB") } else { white },
    text(fill: white, weight: "bold")[Màu],
    text(fill: white, weight: "bold")[Các bóng],
    text(fill: white, weight: "bold")[Số lượng],

    [🔴 Đỏ], [$4, 9, 12$], [$3$],
    [🔵 Xanh], [$1, 6, 8, 10$], [$4$],
    [🟡 Vàng], [$2, 3, 5, 7, 11$], [$5$],
  )

  Vì có $5$ bóng màu vàng trên tổng số $12$ bóng nên
  #align(center)[$P("vàng") = frac(5, 12)$]

  *Điểm sư phạm:* với bài nhiều trạng thái, bảng tổng hợp màu cuối thường giúp học sinh ít nhầm hơn nhiều so với việc chỉ ghi rời rạc từng kết quả.
]

== 4.4 Nhóm Dự Đoán 3 — Dạng Điều Kiện, Bẫy Đề Và Mở Rộng

#note-box(title: "📌 Dấu hiệu nhận ra")[
  Đây là nhóm hay dùng để phân hóa. Đề không hỏi trực tiếp "đỏ hay xanh" mà thêm điều kiện như *biết đã xanh*, *biết không đỏ*, *chỉ làm bước nguyên tố*, hoặc chuyển sang bài nhiều trạng thái. Muốn làm tốt nhóm này, học sinh phải biết *đổi không gian xét* thật rõ.
]

#qopen[
  *Ví dụ 3.1.* Với $400$ bóng Lucky Light, sau quá trình đổi màu ta chọn ngẫu nhiên một bóng *xanh*. Tính xác suất để số trên bóng là số chẵn.
]

#loigiai-box[
  Khi biết bóng đã *xanh*, ta chỉ còn xét các bóng mang số chính phương:
  #align(center)[$1^2, 2^2, 3^2, ldots, 20^2$]

  Vậy không gian xét mới có $20$ phần tử.

  Một số chính phương $m^2$ là chẵn khi và chỉ khi $m$ chẵn. Trong các số $1, 2, ldots, 20$, có $10$ số chẵn.

  #table(
    columns: (1.1fr, 1.2fr, auto),
    inset: 6pt,
    align: (left, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("EFF6FF") } else { white },
    text(fill: white, weight: "bold")[Tập đang xét],
    text(fill: white, weight: "bold")[Mô tả],
    text(fill: white, weight: "bold")[Số lượng],

    [Bóng xanh], [$m^2$ với $1 leq m leq 20$], [$20$],
    [Bóng xanh mang số chẵn], [$m^2$ với $m$ chẵn], [$10$],
  )

  Vậy xác suất cần tìm là
  #align(center)[$frac(10, 20) = frac(1, 2)$]
]

#qopen[
  *Ví dụ 3.2.* Với $900$ bóng Lucky Light, biết bóng được chọn là bội của $3$. Tính xác suất để bóng đó màu xanh.
]

#loigiai-box[
  Gọi $A$ là biến cố "bóng xanh", $B$ là biến cố "số trên bóng là bội của $3$". Ta cần tính $P(A | B)$.

  - Có $300$ bội của $3$ trong đoạn từ $1$ đến $900$.
  - Bóng xanh là số chính phương. Một số chính phương chia hết cho $3$ khi và chỉ khi căn của nó chia hết cho $3$.

  Vì $900 = 30^2$, các bóng xanh là $1^2, 2^2, ldots, 30^2$. Trong các số $1, 2, ldots, 30$, có $10$ số chia hết cho $3$.

  #table(
    columns: (1.2fr, 1.2fr, auto),
    inset: 6pt,
    align: (left, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("475569") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Tập],
    text(fill: white, weight: "bold")[Mô tả],
    text(fill: white, weight: "bold")[Số lượng],

    [$B$], [Các bội của $3$ từ $1$ đến $900$], [$300$],
    [$A inter B$], [Các số chính phương chia hết cho $3$], [$10$],
  )

  Vậy
  #align(center)[$P(A | B) = frac(10, 300) = frac(1, 30)$]

  *Điểm dễ sai:* nhiều học sinh chia $10$ cho $900$ vì quên rằng khi có điều kiện $B$, mẫu số phải đổi theo điều kiện đó.
]

#qopen[
  *Ví dụ 3.3.* Có $30$ bóng đèn 3 màu, ban đầu đều đỏ. Biết rằng bóng được chọn *không đỏ*. Tính xác suất để bóng đó màu vàng.
]

#loigiai-box[
  Sau khi lập bảng theo $d(j) mod 3$ cho các bóng từ $1$ đến $30$, ta thu được:

  #table(
    columns: (auto, 1fr, auto),
    inset: 6pt,
    align: (center, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("7C2D12") } else if calc.rem(row, 2) == 0 { rgb("FFF7ED") } else { white },
    text(fill: white, weight: "bold")[Màu],
    text(fill: white, weight: "bold")[Các bóng],
    text(fill: white, weight: "bold")[Số lượng],

    [🔴 Đỏ], [$4, 9, 12, 18, 20, 25, 28$], [$7$],
    [🔵 Xanh], [$1, 6, 8, 10, 14, 15, 21, 22, 26, 27$], [$10$],
    [🟡 Vàng], [$2, 3, 5, 7, 11, 13, 16, 17, 19, 23, 24, 29, 30$], [$13$],
  )

  Điều kiện "không đỏ" nghĩa là ta chỉ xét $10 + 13 = 23$ bóng.

  Trong số đó có $13$ bóng màu vàng. Vậy
  #align(center)[$P("vàng" | "không đỏ") = frac(13, 23)$]
]

== 4.5 Bảng Dự Đoán Mức Ra Đề

#compare-box(title: "📊 Ôn thi theo mức độ ra đề")[
  #table(
    columns: (1fr, 1.2fr, 1.2fr, 1.2fr),
    inset: 7pt,
    stroke: 0.5pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    align: (left, left, left, left),
    text(fill: white, weight: "bold")[Mức độ],
    text(fill: white, weight: "bold")[Biểu hiện thường gặp],
    text(fill: white, weight: "bold")[Nên luyện nhóm nào],
    text(fill: white, weight: "bold")[Trọng tâm sư phạm],

    [Nhận biết],
    [Hỏi màu/trạng thái của một vài chỉ số cụ thể],
    [Nhóm 1],
    [Phân tích thừa số nguyên tố và lập bảng ngắn],

    [Thông hiểu], [Hỏi số lượng hoặc xác suất trực tiếp], [Nhóm 2], [Đếm số chính phương, chú ý điểm biên],
    [Vận dụng],
    [Có điều kiện, đổi không gian xét, hoặc nhiều trạng thái],
    [Nhóm 3],
    [Lập bảng tổng hợp, đọc đúng điều kiện của đề],
  )
]

#insight-box(title: "💡 Cách dùng phần dự đoán khi ôn tập")[
  Nếu thời gian ít, giáo viên nên chọn ít nhất một ví dụ ở mỗi nhóm. Khi đó học sinh sẽ thấy rõ ba mức phản xạ quan trọng: *xác định trạng thái của một phần tử*, *đếm để lập xác suất*, và *đổi không gian xét khi có điều kiện hoặc nhiều trạng thái*.
]

== 4.6 Khối 24 Bài Dự Đoán Chuẩn Ôn Thi Lớp 12

#note-box(title: "📌 Cấu trúc của khối dự đoán này")[
  Mục 4.2, 4.3, 4.4 ở phía trên đã có sẵn $9$ ví dụ mẫu. Khối dưới đây bổ sung thêm $15$ bài nữa, chia thành $5$ cụm. Như vậy riêng mục IV sẽ có tổng cộng #strong[24 bài dự đoán mẫu] theo đúng tinh thần đề thi chuẩn: đa dạng, vừa sức, có lời giải rõ và đủ điểm nhấn sư phạm.
]

#insight-box[
  Cách dùng hiệu quả nhất là: mỗi buổi ôn chọn *một cụm*, cho học sinh làm từ bài 1 đến bài 3 theo đúng nhịp *nhận dạng $to$ lập bảng $to$ kết luận*. Không nên nhảy ngẫu nhiên giữa các dạng, vì học sinh dễ thấy bài nào cũng khác nhau mà quên mất cái lõi là cách đếm số lần tác động.
]

=== Cụm A — Nhận Diện Nhanh Trạng Thái Cuối

#qopen[
  *Bài D1.* Có $180$ bóng đèn Lucky Light, ban đầu đều đỏ. Hỏi bóng số $98$, $100$, $121$ có màu gì sau cùng?
]

#loigiai-box[
  Ta lập bảng ngắn cho ba bóng được hỏi:

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("0F766E") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[$d(j)$],
    text(fill: white, weight: "bold")[Chẵn/Lẻ],
    text(fill: white, weight: "bold")[Màu cuối],

    [$98$], [$2 cdot 7^2$], [$(1+1)(2+1) = 6$], [Chẵn], [🔴 Đỏ],
    [$100$], [$2^2 cdot 5^2$], [$(2+1)(2+1) = 9$], [Lẻ], [🔵 Xanh],
    [$121$], [$11^2$], [$(2+1) = 3$], [Lẻ], [🔵 Xanh],
  )

  Vậy bóng số $98$ màu đỏ, còn bóng số $100$ và $121$ màu xanh.
]

#qopen[
  *Bài D2.* Có $250$ tủ khóa, ban đầu đều đóng. Hỏi các tủ số $196$, $198$, $225$ mở hay đóng sau cùng?
]

#loigiai-box[
  Với bài tủ khóa, ta vẫn đọc theo tính chẵn lẻ của số lần tác động: lẻ $to$ mở, chẵn $to$ đóng.

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("2563EB") } else if calc.rem(row, 2) == 0 { rgb("EFF6FF") } else { white },
    text(fill: white, weight: "bold")[Tủ số],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[$d(j)$],
    text(fill: white, weight: "bold")[Chẵn/Lẻ],
    text(fill: white, weight: "bold")[Trạng thái],

    [$196$], [$2^2 cdot 7^2$], [$(2+1)(2+1) = 9$], [Lẻ], [Mở],
    [$198$], [$2 cdot 3^2 cdot 11$], [$(1+1)(2+1)(1+1) = 12$], [Chẵn], [Đóng],
    [$225$], [$3^2 cdot 5^2$], [$(2+1)(2+1) = 9$], [Lẻ], [Mở],
  )

  Vậy các tủ $196$ và $225$ mở, còn tủ $198$ đóng.
]

#qopen[
  *Bài D3.* Có $120$ bóng đèn, ban đầu đều đỏ. Ta chỉ thực hiện các bước nguyên tố. Hỏi bóng số $42$, $64$, $75$ có màu gì sau cùng?
]

#loigiai-box[
  Vì chỉ thực hiện các bước nguyên tố, số lần tác động lên bóng số $j$ là $omega(j)$, tức là số thừa số nguyên tố phân biệt của $j$.

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("7C3AED") } else if calc.rem(row, 2) == 0 { rgb("F5F3FF") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[$omega(j)$],
    text(fill: white, weight: "bold")[Chẵn/Lẻ],
    text(fill: white, weight: "bold")[Màu cuối],

    [$42$], [$2 cdot 3 cdot 7$], [$3$], [Lẻ], [🔵 Xanh],
    [$64$], [$2^6$], [$1$], [Lẻ], [🔵 Xanh],
    [$75$], [$3 cdot 5^2$], [$2$], [Chẵn], [🔴 Đỏ],
  )

  Vậy hai bóng $42$, $64$ màu xanh, còn bóng $75$ màu đỏ.
]

=== Cụm B — Xác Suất Trực Tiếp Rất Hay Ra Đề

#qopen[
  *Bài D4.* Có $999$ bóng đèn Lucky Light, ban đầu đều đỏ. Tính xác suất chọn được bóng xanh.
]

#loigiai-box[
  Bóng xanh là các bóng mang số chính phương. Ta có
  #align(center)[$31^2 = 961 leq 999 < 32^2 = 1024$]

  nên có $31$ bóng xanh.

  #table(
    columns: (1fr, 1.2fr, auto),
    inset: 6pt,
    align: (left, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("334155") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Loại bóng],
    text(fill: white, weight: "bold")[Mô tả],
    text(fill: white, weight: "bold")[Số lượng],

    [🔵 Xanh], [Các số chính phương từ $1^2$ đến $31^2$], [$31$],
    [🔴 Đỏ], [Các số còn lại], [$999 - 31 = 968$],
  )

  Vì vậy
  #align(center)[$P("xanh") = frac(31, 999)$]
]

#qopen[
  *Bài D5.* Có $1024$ bóng đèn Lucky Light, ban đầu đều đỏ. Tính xác suất chọn được bóng đỏ.
]

#loigiai-box[
  Vì $1024 = 32^2$ nên có đúng $32$ bóng xanh.

  Số bóng đỏ là $1024 - 32 = 992$.

  #table(
    columns: (1fr, 1.1fr, auto),
    inset: 6pt,
    align: (left, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("0F766E") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Loại bóng],
    text(fill: white, weight: "bold")[Cách đếm],
    text(fill: white, weight: "bold")[Số lượng],

    [🔵 Xanh], [$1^2, 2^2, ldots, 32^2$], [$32$],
    [🔴 Đỏ], [$1024 - 32$], [$992$],
  )

  Do đó
  #align(center)[$P("đỏ") = frac(992, 1024) = frac(31, 32)$]
]

#qopen[
  *Bài D6.* Có $15$ bóng đèn 3 màu theo quy luật Đỏ $to$ Xanh $to$ Vàng $to$ Đỏ. Sau $15$ bước, xác suất chọn được bóng màu vàng bằng bao nhiêu?
]

#loigiai-box[
  Ta xét $d(j) mod 3$ cho các bóng từ $1$ đến $15$. Sau khi nối tiếp từ bảng $12$ bóng và tính thêm $13$, $14$, $15$, ta có bảng tổng hợp:

  #table(
    columns: (auto, 1fr, auto),
    inset: 6pt,
    align: (center, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("B45309") } else if calc.rem(row, 2) == 0 { rgb("FFFBEB") } else { white },
    text(fill: white, weight: "bold")[Màu],
    text(fill: white, weight: "bold")[Các bóng],
    text(fill: white, weight: "bold")[Số lượng],

    [🔴 Đỏ], [$4, 9, 12$], [$3$],
    [🔵 Xanh], [$1, 6, 8, 10, 14, 15$], [$6$],
    [🟡 Vàng], [$2, 3, 5, 7, 11, 13$], [$6$],
  )

  Vậy xác suất chọn được bóng vàng là
  #align(center)[$P("vàng") = frac(6, 15) = frac(2, 5)$]
]

=== Cụm C — Điều Kiện Và Đổi Không Gian Xét

#qopen[
  *Bài D7.* Với $441$ bóng Lucky Light, biết bóng được chọn là xanh. Tính xác suất để số trên bóng chia hết cho $7$.
]

#loigiai-box[
  Vì $441 = 21^2$, các bóng xanh là
  #align(center)[$1^2, 2^2, 3^2, ldots, 21^2$]

  nên không gian xét mới có $21$ bóng.

  Một số chính phương chia hết cho $7$ khi và chỉ khi căn của nó chia hết cho $7$. Trong các số $1, 2, ldots, 21$ có đúng $3$ bội của $7$: $7, 14, 21$.

  #table(
    columns: (1.1fr, 1.25fr, auto),
    inset: 6pt,
    align: (left, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("EFF6FF") } else { white },
    text(fill: white, weight: "bold")[Tập xét],
    text(fill: white, weight: "bold")[Mô tả],
    text(fill: white, weight: "bold")[Số lượng],

    [Bóng xanh], [$m^2$ với $1 leq m leq 21$], [$21$],
    [Bóng xanh chia hết cho $7$], [$m^2$ với $7 | m$], [$3$],
  )

  Vì vậy
  #align(center)[$P(7 | n \mid "xanh") = frac(3, 21) = frac(1, 7)$]
]

#qopen[
  *Bài D8.* Với $400$ bóng Lucky Light, biết bóng được chọn là đỏ. Tính xác suất để số trên bóng là số chẵn.
]

#loigiai-box[
  Ta đổi đúng không gian xét:

  - Tổng số bóng đỏ là $400 - 20 = 380$ vì $400 = 20^2$.
  - Có $200$ số chẵn từ $1$ đến $400$.
  - Trong đó, các số chẵn nhưng xanh chính là các số chính phương chẵn: $2^2, 4^2, ldots, 20^2$, có $10$ số.

  Vậy số bóng vừa đỏ vừa chẵn là $200 - 10 = 190$.

  #table(
    columns: (1.2fr, 1.2fr, auto),
    inset: 6pt,
    align: (left, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("475569") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Tập],
    text(fill: white, weight: "bold")[Cách đếm],
    text(fill: white, weight: "bold")[Số lượng],

    [Bóng đỏ], [$400 - 20$], [$380$],
    [Bóng đỏ mang số chẵn], [$200 - 10$], [$190$],
  )

  Do đó
  #align(center)[$P("chẵn" \mid "đỏ") = frac(190, 380) = frac(1, 2)$]
]

#qopen[
  *Bài D9.* Với $15$ bóng đèn 3 màu, biết bóng được chọn *không màu xanh*. Tính xác suất để bóng đó màu vàng.
]

#loigiai-box[
  Từ bài D6, ta đã có:

  - Bóng đỏ: $3$ bóng
  - Bóng xanh: $6$ bóng
  - Bóng vàng: $6$ bóng

  Điều kiện *không màu xanh* nghĩa là ta chỉ xét $3 + 6 = 9$ bóng gồm đỏ và vàng.

  #table(
    columns: (1.2fr, 1.2fr, auto),
    inset: 6pt,
    align: (left, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("7C2D12") } else if calc.rem(row, 2) == 0 { rgb("FFF7ED") } else { white },
    text(fill: white, weight: "bold")[Không gian xét],
    text(fill: white, weight: "bold")[Mô tả],
    text(fill: white, weight: "bold")[Số lượng],

    [Không xanh], [Đỏ hoặc vàng], [$9$],
    [Vàng trong tập đó], [Các bóng màu vàng], [$6$],
  )

  Vậy
  #align(center)[$P("vàng" \mid "không xanh") = frac(6, 9) = frac(2, 3)$]
]

=== Cụm D — Biến Thể Lọc Bước, Độc Mà Vẫn Vừa Sức

#qopen[
  *Bài D10.* Có $90$ bóng đèn, ban đầu đều đỏ. Ta chỉ thực hiện các bước lẻ $1, 3, 5, ldots, 89$. Hỏi bóng số $24$, $36$, $50$ có màu gì sau cùng?
]

#loigiai-box[
  Một bóng bị tác động ở bước lẻ nào thì bước đó phải là một *ước lẻ* của số trên bóng. Vì vậy, số lần tác động bằng đúng *số ước lẻ* của số đó.

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("92400E") } else if calc.rem(row, 2) == 0 { rgb("FFF7ED") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[Phần lẻ],
    text(fill: white, weight: "bold")[Số ước lẻ],
    text(fill: white, weight: "bold")[Chẵn/Lẻ],
    text(fill: white, weight: "bold")[Màu cuối],

    [$24$], [$3$], [$2$], [Chẵn], [🔴 Đỏ],
    [$36$], [$3^2$], [$3$], [Lẻ], [🔵 Xanh],
    [$50$], [$5^2$], [$3$], [Lẻ], [🔵 Xanh],
  )

  Vậy bóng $24$ đỏ, còn bóng $36$ và $50$ xanh.
]

#qopen[
  *Bài D11.* Có $100$ bóng đèn, ban đầu đều đỏ. Ta chỉ thực hiện các bước là số chính phương: $1, 4, 9, 16, ldots, 100$. Hỏi bóng số $72$ và $81$ có màu gì sau cùng?
]

#loigiai-box[
  Một bước là số chính phương sẽ tác động lên bóng số $j$ khi và chỉ khi bước đó là một *ước chính phương* của $j$. Vậy số lần tác động chính là số ước chính phương của $j$.

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("1E3A8A") } else if calc.rem(row, 2) == 0 { rgb("EFF6FF") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[Số ước chính phương],
    text(fill: white, weight: "bold")[Chẵn/Lẻ],
    text(fill: white, weight: "bold")[Màu cuối],

    [$72$], [$2^3 cdot 3^2$], [$(floor(3/2)+1)(floor(2/2)+1) = 4$], [Chẵn], [🔴 Đỏ],
    [$81$], [$3^4$], [$(floor(4/2)+1) = 3$], [Lẻ], [🔵 Xanh],
  )

  Vậy bóng số $72$ đỏ, còn bóng số $81$ xanh.
]

#qopen[
  *Bài D12.* Có $120$ bóng đèn, ban đầu đều đỏ. Ta chỉ thực hiện các bước nguyên tố. Hỏi bóng số $64$, $90$, $108$ có màu gì sau cùng?
]

#loigiai-box[
  Ta lại dùng $omega(j)$:

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("6D28D9") } else if calc.rem(row, 2) == 0 { rgb("F5F3FF") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[$omega(j)$],
    text(fill: white, weight: "bold")[Chẵn/Lẻ],
    text(fill: white, weight: "bold")[Màu cuối],

    [$64$], [$2^6$], [$1$], [Lẻ], [🔵 Xanh],
    [$90$], [$2 cdot 3^2 cdot 5$], [$3$], [Lẻ], [🔵 Xanh],
    [$108$], [$2^2 cdot 3^3$], [$2$], [Chẵn], [🔴 Đỏ],
  )

  Vậy bóng $64$ và $90$ xanh, còn bóng $108$ đỏ.
]

=== Cụm E — Biến Thể Sáng Tạo, Hay Và Không Quá Khó

#qopen[
  *Bài D13.* Có $20$ bóng đèn 4 màu, ban đầu đều đỏ. Mỗi lần đổi màu theo vòng Đỏ $to$ Xanh $to$ Vàng $to$ Lục $to$ Đỏ. Sau $20$ bước, bóng số $12$ và $16$ có màu gì?
]

#loigiai-box[
  Bài 4 màu được đọc theo $d(j) mod 4$.

  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("0F766E") } else if calc.rem(row, 2) == 0 { rgb("F0FDFA") } else { white },
    text(fill: white, weight: "bold")[Bóng số],
    text(fill: white, weight: "bold")[Phân tích],
    text(fill: white, weight: "bold")[$d(j)$],
    text(fill: white, weight: "bold")[$d(j) mod 4$],
    text(fill: white, weight: "bold")[Màu cuối],

    [$12$], [$2^2 cdot 3$], [$6$], [$2$], [🟡 Vàng],
    [$16$], [$2^4$], [$5$], [$1$], [🔵 Xanh],
  )

  Vậy bóng số $12$ màu vàng, còn bóng số $16$ màu xanh.
]

#qopen[
  *Bài D14.* Có $50$ bóng đèn Lucky Light, ban đầu đều màu xanh. Mỗi lần tác động, bóng chỉ đổi qua lại giữa xanh và đỏ. Tính xác suất chọn được bóng cuối cùng vẫn màu xanh.
]

#loigiai-box[
  Khác biệt duy nhất là *màu ban đầu*. Bóng giữ nguyên màu xanh khi số lần tác động là *chẵn*, tức là khi số trên bóng *không phải* số chính phương.

  Vì $7^2 = 49 leq 50 < 8^2 = 64$, có $7$ số chính phương không vượt quá $50$.

  #table(
    columns: (1.1fr, 1.2fr, auto),
    inset: 6pt,
    align: (left, left, center),
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("334155") } else if calc.rem(row, 2) == 0 { rgb("F8FAFC") } else { white },
    text(fill: white, weight: "bold")[Loại bóng],
    text(fill: white, weight: "bold")[Mô tả],
    text(fill: white, weight: "bold")[Số lượng],

    [Giữ màu xanh], [Các số không phải số chính phương], [$50 - 7 = 43$],
    [Đổi sang đỏ], [Các số chính phương], [$7$],
  )

  Vậy xác suất cần tìm là
  #align(center)[$P("xanh cuối") = frac(43, 50)$]
]

#qopen[
  *Bài D15.* Có $30$ thẻ số, ban đầu đều đỏ. Ở bước $k$, ta không đổi các bội của $k$ nữa mà đổi màu mọi thẻ có số là *ước của $k$*. Hỏi thẻ số $7$, $10$, $15$ có màu gì sau cùng?
]

#loigiai-box[
  Đây là dạng "đảo chiều" rất hay gặp trong các đề sáng tạo nhẹ. Thẻ số $j$ bị tác động ở bước $k$ khi và chỉ khi $j | k$. Vì $k$ chạy từ $1$ đến $30$, số lần tác động lên thẻ $j$ là số bội của $j$ không vượt quá $30$, tức là $floor(30/j)$.

  #table(
    columns: (auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    stroke: 0.45pt + rgb("CBD5E1"),
    fill: (col, row) => if row == 0 { rgb("7C2D12") } else if calc.rem(row, 2) == 0 { rgb("FFF7ED") } else { white },
    text(fill: white, weight: "bold")[Thẻ số],
    text(fill: white, weight: "bold")[Số lần tác động],
    text(fill: white, weight: "bold")[Chẵn/Lẻ],
    text(fill: white, weight: "bold")[Màu cuối],

    [$7$], [$floor(30/7) = 4$], [Chẵn], [🔴 Đỏ],
    [$10$], [$floor(30/10) = 3$], [Lẻ], [🔵 Xanh],
    [$15$], [$floor(30/15) = 2$], [Chẵn], [🔴 Đỏ],
  )

  Vậy thẻ số $7$ và $15$ đỏ, còn thẻ số $10$ xanh.

  *Điểm hay của bài này:* bề ngoài đề đã đổi hẳn cách phát biểu, nhưng cốt lõi vẫn là đếm số lần tác động bằng một công thức thật gọn.
]

#ans-box[
  Nếu ghép với $9$ ví dụ ở các mục 4.2, 4.3, 4.4 thì riêng phần dự đoán đề thi hiện đã có #strong[24 bài mẫu]. Đây là một khối đủ dày để giáo viên chọn lọc theo 3 mức: nhận diện nhanh, xác suất trực tiếp và biến thể sáng tạo vừa sức.
]

#v(1em)

= V. Bài Tập Tự Luyện — Lời Giải Chi Tiết

== Nhóm A — Cơ Bản, Dạy Được Ngay Trên Lớp

#note-box(title: "📌 Cách dùng nhóm A")[
  Nên cho học sinh làm *A1* ngay tại lớp để luyện thao tác đếm số chính phương. *A2* dùng để nhấn mạnh trường hợp $N$ tự nó là số chính phương. *A3* dùng để kiểm tra xem học sinh đã bỏ được thói quen mô phỏng từng bước hay chưa.
]

#qopen[
  *Bài A1.* Có $1000$ bóng đèn Lucky Light. Tính xác suất chọn được bóng xanh và xác suất chọn được bóng đỏ.

  *Gợi ý:* $31^2 = 961$, $32^2 = 1024$.
]

#loigiai-box[
  *Bước 1. Đếm số bóng xanh.*

  Bóng xanh là những bóng mang số chính phương. Vì
  #align(center)[$31^2 = 961 leq 1000 < 32^2 = 1024$]
  nên có đúng $31$ số chính phương không vượt quá $1000$. Do đó có $31$ bóng xanh.

  *Bước 2. Suy ra số bóng đỏ.*

  Số bóng đỏ là
  #align(center)[$1000 - 31 = 969$]

  *Bước 3. Lập xác suất.*

  Vậy
  #align(center)[$P("xanh") = frac(31, 1000), space P("đỏ") = frac(969, 1000)$]

  Hai phân số đều tối giản vì $31$ không chia $1000$, còn $969 = 3 cdot 17 cdot 19$ không có ước chung với $1000 = 2^3 cdot 5^3$.
]

#qopen[
  *Bài A2.* Lucky Light với $n = 2025$. Gọi $P = m/n$ là xác suất chọn được bóng đỏ ở dạng tối giản. Tính $m+n$.
]

#loigiai-box[
  *Điểm cần nhận ra thật nhanh:* $2025$ là một số chính phương vì $2025 = 45^2$.

  *Bước 1. Đếm số bóng xanh.*

  Vì $2025 = 45^2$, các số chính phương không vượt quá $2025$ là
  #align(center)[$1^2, 2^2, 3^2, ldots, 45^2$]
  nên có $45$ bóng xanh.

  *Bước 2. Tìm số bóng đỏ.*

  Số bóng đỏ là $2025 - 45 = 1980$.

  *Bước 3. Viết và rút gọn xác suất.*

  Do đó
  #align(center)[$P = frac(1980, 2025)$]

  Rút gọn với ước chung $45$, ta được $P = frac(44, 45)$.

  Vậy $m+n = 44 + 45 = 89$.
]

#qopen[
  *Bài A3.* Với $n = 144$, xác định màu cuối của bóng số $120$ và bóng số $144$.
]

#loigiai-box[
  Bài này không cần mô phỏng $144$ bước. Ta chỉ cần xét *số lần đổi màu* của từng bóng.

  *Bóng 120:* Ta có
  #align(center)[$120 = 2^3 cdot 3 cdot 5$]
  nên
  #align(center)[$d(120) = (3+1)(1+1)(1+1) = 16$]
  Vì $16$ là số chẵn nên bóng số $120$ quay về màu ban đầu, tức là màu *đỏ*.

  *Bóng 144:* Ta có
  #align(center)[$144 = 2^4 cdot 3^2 = 12^2$]
  nên
  #align(center)[$d(144) = (4+1)(2+1) = 15$]
  Vì $15$ là số lẻ nên bóng số $144$ đổi màu lẻ lần, tức là kết thúc ở màu *xanh*.
]

== Nhóm B — Nâng Cao

#qopen[
  *Bài B1.* Với $n = 500$, chọn ngẫu nhiên một bóng *xanh*.

  *(a)* Xác suất để bóng đó mang số lẻ.

  *(b)* Xác suất để bóng đó là bội của $4$.
]

#loigiai-box[
  Ta có $22^2 = 484 leq 500 < 23^2$, nên có $22$ bóng xanh.

  *(a)* Bóng xanh có dạng $m^2$. Số $m^2$ lẻ khi và chỉ khi $m$ lẻ. Trong $1, 2, ldots, 22$ có $11$ số lẻ, nên xác suất là $frac(11, 22) = frac(1, 2)$.

  *(b)* Số $m^2$ là bội của $4$ khi và chỉ khi $m$ chẵn. Trong $1, 2, ldots, 22$ có $11$ số chẵn, nên xác suất cũng bằng $frac(11, 22) = frac(1, 2)$.
]

#qopen[
  *Bài B2.* Với $n = 900$, gọi:

  - $A$: biến cố bóng được chọn là xanh
  - $B$: biến cố số trên bóng là bội của $3$

  Tính $P(A inter B)$, $P(A union B)$ và $P(A | B)$.
]

#loigiai-box[
  Vì $900 = 30^2$, nên có $30$ bóng xanh. Do đó $P(A) = frac(30, 900) = frac(1, 30)$.

  Có $300$ số chia hết cho $3$ từ $1$ đến $900$, nên $P(B) = frac(300, 900) = frac(1, 3)$.

  Để thuộc $A inter B$, một số phải vừa là số chính phương vừa chia hết cho $3$. Điều này xảy ra khi $m^2 leq 900$ và $3 | m$, tức là $m$ nhận $10$ giá trị: 3, 6, 9, ldots, 30.

  Vậy $P(A inter B) = frac(10, 900) = frac(1, 90)$.

  Tiếp theo,
  #align(center)[$P(A union B) = P(A) + P(B) - P(A inter B) = frac(16, 45)$]

  Cuối cùng,
  #align(center)[$P(A | B) = frac(P(A inter B), P(B)) = frac(1, 30)$]

  Nhận xét đẹp: $P(A | B) = P(A)$, nên trong bài này hai biến cố $A$ và $B$ độc lập.
]

== Nhóm C — Tổng Hợp Và Sáng Tạo

#qopen[
  *Bài C1.* Tìm tất cả các giá trị $n$ từ $1$ đến $100$ sao cho xác suất bóng xanh bằng xác suất bóng đỏ.
]

#loigiai-box[
  Điều kiện cần là số bóng xanh bằng số bóng đỏ:
  #align(center)[$floor(sqrt(n)) = n - floor(sqrt(n))$]

  Tương đương với
  #align(center)[$2 floor(sqrt(n)) = n$]

  Đặt $m = floor(sqrt(n))$. Khi đó $n = 2m$ và đồng thời phải có
  #align(center)[$m^2 leq n < (m+1)^2$]

  Thay $n = 2m$ vào, ta được $m^2 leq 2m$, nên $m leq 2$.

  Vì $n geq 1$, ta chỉ còn hai khả năng:

  - $m = 1$ thì $n = 2$
  - $m = 2$ thì $n = 4$

  Vậy trong đoạn từ $1$ đến $100$, các giá trị thỏa mãn là $n = 2$ và $n = 4$.
]

#activity-box[
  - Nếu tất cả bóng ban đầu là *xanh* thay vì đỏ, quy tắc nhận diện trạng thái cuối thay đổi ra sao?
  - Nếu bước $k$ chỉ tác động lên các *ước* của $k$ chứ không phải các *bội* của $k$, bài toán còn quy gọn được như trên không?
  - Trong bài B2, việc $A$ và $B$ độc lập là ngẫu nhiên của riêng $n = 900$, hay phản ánh một cấu trúc sâu hơn?
]
