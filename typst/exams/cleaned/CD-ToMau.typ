#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════

#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.88em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("004D40"), rgb("00695C"), rgb("00897B"), angle: 135deg),
  stroke: none,
  inset: (x: 16pt, y: 11pt),
  radius: 6pt,
  above: 1.9em,
  below: 1.3em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("00695C")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("00695C"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("BF360C"), size: 11pt, weight: "bold", "▸ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Bảng màu chủ đề ─────────────────────────────────────────
#let c-teal = rgb("00695C")
#let c-navy = rgb("0D47A1")
#let c-amber = rgb("BF360C")
#let c-violet = rgb("4A148C")
#let c-green = rgb("1B5E20")
#let c-slate = rgb("37474F")
#let c-emerald = rgb("00695C")

// ─── Hộp lý thuyết ───────────────────────────────────────────
#let theory-box(body) = block(
  fill: rgb("E0F2F1"),
  stroke: (left: 4pt + c-teal, rest: 0.8pt + rgb("80CBC4")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

#let insight-box(title: "💡 Trực Giác", body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + c-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let key-box(body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + rgb("F9A825"), rest: 0.6pt + rgb("FFF176")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("E65100"), weight: "bold")[🔑 Công Thức Then Chốt]
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

#let example-box(n: "", body) = block(
  fill: rgb("F1F8E9"),
  stroke: (left: 4pt + c-green, rest: 0.6pt + rgb("C5E1A5")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[📝 Ví Dụ #n]
  #v(0.3em)
  #body
]

#let qopen(body) = block(
  fill: rgb("EDE7F6"),
  stroke: (left: 3pt + c-violet, rest: 0.5pt + rgb("D1C4E9")),
  radius: (right: 5pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: c-violet, weight: "bold", size: 9.5pt)[❓ Câu Hỏi Gợi Mở]
  #v(0.22em)
  #body
]

#let recognize-box(title, body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + c-navy, rest: 0.6pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-navy, weight: "bold")[🔍 #title]
  #v(0.3em)
  #body
]

#let route-box(title: "🧭 Cách Nghĩ Chậm", body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 4pt + rgb("EF6C00"), rest: 0.6pt + rgb("FFCC80")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("E65100"), weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let cannon-box(title, body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 5pt + rgb("D84315"), rest: 0.7pt + rgb("FFAB91")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("BF360C"), weight: "bold")[🧨 #title]
  #v(0.35em)
  #body
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(
      rgb("051F1A"),
      rgb("002B25"),
      rgb("004D40"),
      rgb("00695C"),
      rgb("00897B"),
      angle: 150deg,
    ),
    inset: (x: 2.2cm, y: 1.8cm),
    radius: 12pt,
  )[
    #text(fill: rgb("80CBC4"), size: 11pt, weight: "bold")[
      CHUYÊN ĐỀ DÀNH CHO GIÁO VIÊN — TỔ HỢP THPT
    ]
    #v(0.6em)
    #text(fill: white, size: 28pt, weight: "black")[Tô Màu Ẩn Dụ]
    #v(0.15em)
    #text(fill: rgb("A7FFEB"), size: 15pt, style: "italic")[Graph Coloring in Disguise]
    #v(0.4em)
    #text(fill: rgb("B2DFDB"), size: 13pt)[
      Nhận diện 8 dạng toán thi phổ thông nấp sau bài toán tô màu
    ]
    #v(1.2em)
    #line(length: 55%, stroke: 1pt + rgb("80CBC4"))
    #v(1em)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      align: center,
      row-gutter: 0.3em,
      [#text(fill: rgb("A5D6A7"), size: 20pt)[🔢]],
      [#text(fill: rgb("80CBC4"), size: 20pt)[🏠]],
      [#text(fill: rgb("A7FFEB"), size: 20pt)[🔄]],
      [#text(fill: rgb("FFE57F"), size: 20pt)[⬛]],
      [#text(fill: rgb("FFAB91"), size: 20pt)[🚩]],
      [#text(fill: rgb("CE93D8"), size: 20pt)[📅]],
      [#text(fill: rgb("81D4FA"), size: 20pt)[🗺️]],
      [#text(fill: rgb("F48FB1"), size: 20pt)[💎]],

      [#text(fill: rgb("A5D6A7"), size: 8pt, weight: "bold")[Dãy\ số]],
      [#text(fill: rgb("80CBC4"), size: 8pt, weight: "bold")[Nhà/\ Cột]],
      [#text(fill: rgb("A7FFEB"), size: 8pt, weight: "bold")[Vòng\ tròn]],
      [#text(fill: rgb("FFE57F"), size: 8pt, weight: "bold")[Bảng\ 2×n]],
      [#text(fill: rgb("FFAB91"), size: 8pt, weight: "bold")[Cờ/\ Băng]],
      [#text(fill: rgb("CE93D8"), size: 8pt, weight: "bold")[Lịch/\ Nhóm]],
      [#text(fill: rgb("81D4FA"), size: 8pt, weight: "bold")[Bản\ đồ]],
      [#text(fill: rgb("F48FB1"), size: 8pt, weight: "bold")[Vòng\ hoa]],
    )
    #v(1em)
    #text(fill: rgb("80CBC4"), size: 9.5pt, style: "italic")[
      "Khi nhìn thấy ràng buộc kề nhau — đó là bài toán tô màu đang đội lốt."
    ]
  ]
]

#v(1.2em)

// ═══════════════════════════════════════════════
// TỔNG QUAN
// ═══════════════════════════════════════════════
= Tổng Quan: Bản Đồ Nhận Diện

#theory-box[
  #text(fill: c-teal, size: 11pt, weight: "bold")[
    🎯 Gốc Của Cả Chuyên Đề
  ]
  #v(0.5em)
  Nơi học sinh thường bị hụt hơi không phải ở phép tính, mà ở bước *dịch đề bài*
  sang ngôn ngữ tô màu. Ta nên đi chậm theo một cầu nối ngắn:

  #v(0.35em)
  #align(center)[
    #cetz.canvas(length: 1.35cm, {
      import cetz.draw: *

      for i in range(4) {
        rect((i * 1.35, 0.15), (i * 1.35 + 0.95, 1.0), fill: rgb("E0F2F1"), stroke: 1.1pt + c-slate, radius: 2pt)
        content((i * 1.35 + 0.48, 0.57), text(size: 8pt, weight: "bold")[$H_(#i + 1)$])
        if i < 3 {
          line((i * 1.35 + 0.95, 0.57), (i * 1.35 + 1.35, 0.57), stroke: 0.9pt + c-amber)
        }
      }
      content((2.0, -0.45), text(size: 8pt, fill: c-amber, weight: "bold")[Nhà kề nhà])

      line((5.9, 0.55), (7.0, 0.55), mark: (end: "stealth"), stroke: 1pt + c-slate)
      content((6.45, 0.95), text(size: 8pt, style: "italic")[đổi sang đồ thị])

      let gx = 8.2
      for i in range(4) {
        let p = (gx + i * 1.25, 0.55)
        circle(p, radius: 0.22, fill: white, stroke: 1.2pt + c-teal)
        content(p, text(size: 8pt, weight: "bold")[#i + 1])
        if i < 3 {
          line(p, (gx + (i + 1) * 1.25, 0.55), stroke: 1.2pt + c-teal)
        }
      }
      content((10.1, -0.45), text(size: 8pt, fill: c-teal, weight: "bold")[Đường thẳng $P_4$])
    })
  ]

  #v(0.4em)
  Cách hiểu nhẹ nhàng nhất là:
  - Mỗi *đối tượng* cần gán màu/nhóm/buổi/ký hiệu → xem như một ô hoặc một đỉnh.
  - Hai đối tượng *không được trùng nhau khi kề nhau* → nối bằng một cạnh.
  - "Màu" ở đây có thể là màu thật, cũng có thể là *buổi thi, nhóm, ca làm, chữ số, ký tự*.
  - Khi đã nhìn ra cấu trúc, ta mới tra công thức.

  #v(0.35em)
  Bảng dưới đây là bảng *tra nhanh sau khi đã nhận dạng được cấu trúc*:

  #v(0.4em)
  #align(center)[
    #table(
      columns: (2.2fr, 2fr, 2fr),
      stroke: 0.5pt + rgb("80CBC4"),
      fill: (x, y) => if y == 0 { c-teal } else if calc.odd(y) { rgb("E0F2F1") } else { white },
      inset: (x: 9pt, y: 7pt),
      align: (left, left, center),
      table.header(
        text(fill: white, weight: "bold")[Vỏ bọc trong đề thi],
        text(fill: white, weight: "bold")[Cấu trúc ẩn],
        text(fill: white, weight: "bold")[Công thức],
      ),
      [Dãy $n$ chữ số / mật khẩu; kề ≠], [Hàng thẳng], [$k(k-1)^(n-1)$],
      [Số có $n$ chữ số (≠ 0 đầu); kề ≠], [Hàng thẳng biến tấu], [$(k-1) dot (k-1)^(n-1)$],
      [Dãy nhà / cột / dải; kề ≠], [Hàng thẳng], [$k(k-1)^(n-1)$],
      [Vòng đèn / ghế tròn / vòng hoa; kề ≠], [Vòng tròn], [$(k-1)^n + (-1)^n (k-1)$],
      [Bảng $2 times n$; kề cạnh ≠], [Lưới $2 times n$], [$k(k-1)(k^2-3k+3)^(n-1)$],
      [Cờ / băng $n$ dải; kề ≠], [Hàng thẳng], [$k(k-1)^(n-1)$],
      [Lịch / phân ca / phân nhóm; không chồng], [Đồ thị xung đột], [$P(G_"xung đột", k)$],
      [Tô vùng bản đồ / hình phẳng], [Đồ thị đối ngẫu], [$P(G, k)$],
      [Vòng cườm / hoa; giống nếu xoay/lật], [Burnside $C_n$ / $D_n$], [$frac(1, |G|) sum_g k^(c(g))$],
    )
  ]

  #v(0.5em)
  *Dấu hiệu nhận biết tô màu ẩn:* Bài toán đếm có ràng buộc dạng
  *"hai đối tượng liền kề / tiếp giáp / kề nhau không được giống/trùng nhau"*
  → hầu như chắc chắn là bài toán tô màu đồ thị.
]

#v(0.5em)

#route-box(title: "🧭 Cách Đọc Đề Trong 20 Giây")[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    row-gutter: 0.6em,
    text(fill: c-amber, weight: "bold", size: 13pt)["1"],
    [*Tìm đúng đối tượng cần gán màu:* nhà, ô, vùng, môn học, chữ số, nhân viên...],

    text(fill: c-amber, weight: "bold", size: 13pt)["2"],
    [*Xác định ai không được giống nhau:* hễ hai đối tượng kề/xung đột/tiếp giáp thì nối cạnh.],

    text(fill: c-amber, weight: "bold", size: 13pt)["3"],
    [*Nhìn hình xếp:* thẳng, vòng, bảng $2 times n$, hay một đồ thị tự do? Đây là lúc chọn công thức.],

    text(fill: c-amber, weight: "bold", size: 13pt)["4"],
    [*Kiểm tra đối xứng:* nếu xoay/lật mà coi như nhau thì không dừng ở công thức cơ bản, mà đi sang Burnside.],
  )
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN I
// ═══════════════════════════════════════════════
= Phần I — Hai Công Thức Nền

== 1.1 Hàng Thẳng: $k(k-1)^(n-1)$

#theory-box[
  #text(fill: c-teal, size: 11pt, weight: "bold")[📐 Hàng Thẳng: Nhớ Bằng Một Câu Nói]
  #v(0.5em)
  Với hàng thẳng, đừng học thuộc công thức trước. Hãy nhớ câu nói này:

  #v(0.25em)
  #align(center)[
    #text(fill: c-teal, weight: "bold")[Ô đầu tự do; mỗi ô sau chỉ cần né màu của ô bên trái.]
  ]

  #v(0.3em)
  Từ câu nói đó, công thức tự xuất hiện:

  $ N_"thẳng" = k dot (k-1)^(n-1). $

  - Ô đầu tiên có $k$ lựa chọn.
  - Mỗi ô tiếp theo bị cấm đúng $1$ màu: màu của ô đứng ngay trước nó.
  - Vì vậy mỗi ô sau còn $k-1$ cách.

  #v(0.4em)
  #align(center)[
    #cetz.canvas(length: 1.35cm, {
      import cetz.draw: *
      let cols = (rgb("FFCDD2"), rgb("C8E6C9"), rgb("BBDEFB"), rgb("FFF9C4"), rgb("F3E5F5"))
      for i in range(5) {
        rect((i * 1.8, 0), (i * 1.8 + 1.4, 0.9), fill: cols.at(i), stroke: 1.5pt + c-slate, radius: 3pt)
        if i == 0 {
          content((i * 1.8 + 0.7, -0.5), text(size: 8pt, fill: c-green, weight: "bold")[$k$ cách])
        } else {
          content((i * 1.8 + 0.7, -0.5), text(size: 8pt, fill: c-amber, weight: "bold")[$k-1$ cách])
        }
        if i < 4 {
          line((i * 1.8 + 1.4, 0.45), (i * 1.8 + 1.8, 0.45), mark: (end: "stealth"), stroke: 0.8pt + c-slate)
        }
      }
      content((4, -1.2), text(size: 9pt, fill: c-teal)[Tổng: $k times (k-1)^4$ với $n=5$])
    })
  ]
]

#qopen[
  Nếu thay "màu" bằng chữ số, ký tự hay loại sơn, bản chất vẫn không đổi.
  Ta chỉ đang đổi *tên của màu*, chứ không đổi *cấu trúc hàng thẳng*.
]

#example-box(n: "1.1 — Sơn 5 ngôi nhà liền tiếp")[
  *Đề:* Một dãy $5$ ngôi nhà liền kề, có $3$ màu sơn. Hai nhà liền kề phải khác màu.
  Tính số cách sơn.

  *Nhận diện:* Hàng thẳng $n=5$, $k=3$.

  *Tính:* $N = 3 dot 2^4 = 3 dot 16 = 48.$
]

#warn-box[
  *Bẫy quen thuộc nhất là chữ số $0$ ở đầu số.*

  Cách hiểu nên nói với học sinh là:
  - Vị trí đầu tiên không được nhận $0$, nên chỉ còn $k-1$ chọn.
  - Từ vị trí thứ hai trở đi, $0$ lại dùng bình thường; mỗi vị trí chỉ cần khác chữ số đứng ngay trước.
  - Vì vậy các vị trí sau vẫn có đúng $k-1$ cách.

  Do đó: $(k-1) dot (k-1)^(n-1) = (k-1)^n$.
]

#v(0.5em)

#tn(
  [Có bao nhiêu số tự nhiên có $4$ chữ số (khác $0$ ở hàng nghìn), lấy từ tập
    $\{0, 1, 2, 3, 4\}$, sao cho không có hai chữ số liên tiếp nào bằng nhau?],
  (
    [$250$],
    True([$256$]),
    [$320$],
    [$500$],
  ),
  loigiai: [
    Đây là bài toán hàng thẳng gồm $4$ vị trí.

    - Chữ số hàng nghìn không được bằng $0$, nên có $4$ cách chọn: $1,2,3,4$.
    - Mỗi chữ số phía sau chỉ cần khác chữ số đứng ngay trước nó, nên mỗi vị trí đều có $5-1=4$ cách.

    Vì vậy
    $N = 4 dot 4 dot 4 dot 4 = 4^4 = 256.$

    Vậy có $256$ số thỏa mãn.
  ],
)

#v(0.5em)
#tn(
  [Có bao nhiêu số tự nhiên có $5$ chữ số (khác $0$ ở hàng chục nghìn), lấy từ tập
    $\{0,1,2,3,4\}$, sao cho không có hai chữ số liên tiếp nào bằng nhau?],
  (
    [$512$],
    [$768$],
    True([$1024$]),
    [$1250$],
  ),
  loigiai: [
    Đây là bài toán hàng thẳng gồm $5$ vị trí.

    - Chữ số đầu không được bằng $0$, nên có $4$ cách chọn: $1,2,3,4$.
    - Mỗi chữ số phía sau chỉ cần khác chữ số đứng ngay trước nó, nên mỗi vị trí có $5-1=4$ cách.

    Vì vậy
    $N = 4 dot 4 dot 4 dot 4 dot 4 = 4^5 = 1024.$

    Vậy có $1024$ số thỏa mãn.
  ],
)

#v(0.5em)
#tn(
  [Có bao nhiêu số tự nhiên có $4$ chữ số (khác $0$ ở hàng nghìn), lấy từ tập
    $\{0,1,2,3\}$, sao cho không có hai chữ số liên tiếp nào bằng nhau?],
  (
    [$64$],
    True([$81$]),
    [$108$],
    [$120$],
  ),
  loigiai: [
    Đây là bài toán hàng thẳng gồm $4$ vị trí.

    - Chữ số hàng nghìn không được bằng $0$, nên có $3$ cách chọn: $1,2,3$.
    - Mỗi chữ số phía sau chỉ cần khác chữ số đứng ngay trước nó, nên mỗi vị trí có $4-1=3$ cách.

    Vì vậy
    $N = 3 dot 3 dot 3 dot 3 = 3^4 = 81.$

    Vậy có $81$ số thỏa mãn.
  ],
)

#v(0.5em)

#tn(
  [Có bao nhiêu số tự nhiên có $5$ chữ số, lấy từ tập
    $\{1,2,3,4\}$, sao cho không có hai chữ số liên tiếp nào bằng nhau?],
  (
    [$192$],
    [$216$],
    True([$324$]),
    [$625$],
  ),
  loigiai: [
    Đây là bài toán hàng thẳng gồm $5$ vị trí.

    Vì tập chữ số không chứa $0$, nên chữ số đầu có $4$ cách chọn.

    Mỗi chữ số phía sau phải khác chữ số đứng ngay trước nó, nên mỗi vị trí có $4-1=3$ cách.

    Vì vậy
    $N = 4 dot 3 dot 3 dot 3 dot 3 = 4 dot 3^4 = 324.$

    Vậy có $324$ số thỏa mãn.
  ],
)

#v(0.5em)


#tn(
  [Có bao nhiêu số tự nhiên có $4$ chữ số (khác $0$ ở hàng nghìn), lấy từ tập
    $\{0,1,2,3,4\}$, sao cho không có hai chữ số liên tiếp nào bằng nhau và chữ số hàng đơn vị bằng $0$?],
  (
    [$48$],
    True([$52$]),
    [$64$],
    [$80$],
  ),
  loigiai: [
    Gọi số cần lập có dạng $overline( a b c d)$, trong đó $a != 0$ và $d=0$.

    Ta cần:
    $a != b$, $b != c$, $c != d$.

    Vì $d=0$ nên $c != 0$.

    Chọn $c$: có $4$ cách, là $1,2,3,4$.

    Với mỗi $c$, chọn $b$ khác $c$: có $4$ cách trong tập $\{0,1,2,3,4\}$.

    Xét hai trường hợp:

    - Nếu $b=0$: khi đó $a$ có $4$ cách chọn, là $1,2,3,4$.
    - Nếu $b != 0$: khi đó $a$ khác $0$ và khác $b$, nên có $3$ cách chọn.

    Với mỗi $c$, trong $4$ cách chọn $b$ có:
    - $1$ cách cho $b=0$;
    - $3$ cách cho $b != 0$.

    Số cách ứng với mỗi $c$ là
    $1 dot 4 + 3 dot 3 = 13.$

    Vì có $4$ cách chọn $c$, nên
    $N = 4 dot 13 = 52.$

    Vậy có $52$ số thỏa mãn.
  ],
)

#v(0.5em)

#tn(
  [Có bao nhiêu số tự nhiên có $4$ chữ số (khác $0$ ở hàng nghìn), lấy từ tập
    $\{0,1,2,3,4\}$, sao cho không có hai chữ số liên tiếp nào bằng nhau và trong số đó có ít nhất một chữ số $0$?],
  (
    [$108$],
    [$148$],
    True([$148$]),
    [$192$],
  ),
  loigiai: [
    Trước hết đếm tất cả các số có $4$ chữ số thỏa mãn điều kiện không có hai chữ số liên tiếp bằng nhau.

    - Chữ số đầu có $4$ cách chọn: $1,2,3,4$.
    - Mỗi chữ số sau có $4$ cách chọn vì chỉ cần khác chữ số đứng ngay trước nó.

    Do đó tổng số là
    $4 dot 4 dot 4 dot 4 = 256.$

    Bây giờ đếm số không chứa chữ số $0$.

    Khi đó chỉ dùng các chữ số $\{1,2,3,4\}$.

    - Chữ số đầu có $4$ cách.
    - Mỗi chữ số sau có $3$ cách, vì phải khác chữ số ngay trước.

    Số cách không chứa $0$ là
    $4 dot 3 dot 3 dot 3 = 108.$

    Vậy số cần tìm là
    $256 - 108 = 148.$

    Vậy có $148$ số thỏa mãn.
  ],
)

#v(0.5em)
#tn(
  [Có bao nhiêu số tự nhiên có $4$ chữ số, lấy từ tập
    $\{0,1,2,3,4\}$, sao cho chữ số đầu và chữ số cuối đều khác $0$, đồng thời không có hai chữ số liên tiếp nào bằng nhau?],
  (
    [$180$],
    True([$208$]),
    [$216$],
    [$256$],
  ),
  loigiai: [
    Gọi số cần lập có dạng $overline( a b c d)$.

    Điều kiện:
    $a != 0$, $d != 0$ và
    $a != b$, $b != c$, $c != d$.

    Trước hết, nếu chưa xét điều kiện $d != 0$, số cách là:
    $4 dot 4 dot 4 dot 4 = 256.$

    Ta trừ đi số cách có $d=0$.

    Với $d=0$, ta cần $c != 0$.

    - Chọn $c$: có $4$ cách.
    - Chọn $b$ khác $c$: có $4$ cách.

    Xét theo $b$:

    - Nếu $b=0$, thì $a$ có $4$ cách chọn.
    - Nếu $b != 0$, thì $a$ khác $0$ và khác $b$, nên có $3$ cách chọn.

    Với mỗi $c$, số cách chọn $(a,b)$ là:
    $1 dot 4 + 3 dot 3 = 13.$

    Do đó số cách có $d=0$ là:
    $4 dot 13 = 52.$

    Vậy số cần tìm là:
    $256 - 52 = 204.$

    Do đó đáp án đúng là $204$.
  ],
)

#v(0.5em)
#tn(
  [Có bao nhiêu dãy gồm $n$ kí tự, lấy từ một tập có $k$ kí tự khác nhau, sao cho không có hai kí tự liên tiếp nào bằng nhau?],
  (
    [$k^n$],
    [$(k-1)^n$],
    True([$k(k-1)^(n-1)$]),
    [$k^n-k$],
  ),
  loigiai: [
    Đây là bài toán hàng thẳng gồm $n$ vị trí.

    - Vị trí đầu có $k$ cách chọn.
    - Mỗi vị trí sau chỉ cần khác kí tự đứng ngay trước nó, nên có $k-1$ cách chọn.

    Vì vậy
    $N = k(k-1)^(n-1).$

    Vậy số dãy thỏa mãn là $k(k-1)^(n-1)$.
  ],
)

#v(0.5em)

#tn(
  [Lập mật khẩu gồm $5$ ký tự từ bảng chữ $\{a, b, c, d, e, f\}$ ($6$ ký tự).
    Hai ký tự liên tiếp không được trùng nhau. Số mật khẩu hợp lệ là:],
  (
    [$5^5 = 3125$],
    [$6 dot 5^3 = 750$],
    True([$6 dot 5^4 = 3750$]),
    [$6^5 = 7776$],
  ),
  loigiai: [
    Mật khẩu gồm $5$ ký tự xếp theo hàng thẳng, với $6$ lựa chọn cho mỗi vị trí ban đầu.

    - Ký tự thứ nhất chọn tự do nên có $6$ cách.
    - Từ ký tự thứ hai trở đi, mỗi ký tự chỉ bị cấm trùng với ký tự đứng trước, nên còn $5$ cách.

    Do đó
    $N = 6 dot 5^4 = 6 dot 625 = 3750.$

    Vậy số mật khẩu hợp lệ là $3750$.
  ],
)

#v(0.5em)
==  cụm hàng thẳng nhưng “không có 3 chữ số liên tiếp giống nhau”

#tn(
  [Có bao nhiêu số tự nhiên có $5$ chữ số (khác $0$ ở hàng chục nghìn), lấy từ tập
    $\{0,1,2,3,4\}$, sao cho không có $3$ chữ số liên tiếp nào bằng nhau?],
  (
    [$2048$],
    True([$2240$]),
    [$2304$],
    [$2500$],
  ),
  loigiai: [
    Đây là bài toán hàng thẳng, trong đó cho phép hai chữ số liên tiếp bằng nhau, nhưng không cho phép ba chữ số liên tiếp bằng nhau.

    Ta dùng hai trạng thái:

    - $x_n$: số dãy độ dài $n$ mà chữ số cuối khác chữ số ngay trước nó.
    - $y_n$: số dãy độ dài $n$ mà hai chữ số cuối bằng nhau.

    Chữ số đầu khác $0$ nên:
    $x_1=4$, $y_1=0$.

    Với tập $\{0,1,2,3,4\}$ có $5$ chữ số.

    Khi thêm một chữ số mới:

    - Nếu chọn khác chữ số trước đó: có $4$ cách.
    - Nếu chọn giống chữ số trước đó: chỉ được phép khi trước đó thuộc trạng thái $x$, và có $1$ cách.

    Do đó:
    $x_n=4(x_(n-1)+y_(n-1))$,
    $y_n=x_(n-1)$.

    Tính:

    $x_2=4(4+0)=16$, $y_2=4$.

    $x_3=4(16+4)=80$, $y_3=16$.

    $x_4=4(80+16)=384$, $y_4=80$.

    $x_5=4(384+80)=1856$, $y_5=384$.

    Vậy:
    $N=x_5+y_5=1856+384=2240.$

    Vậy có $2240$ số thỏa mãn.
  ],
)

#v(0.5em)
#tn(
  [Có bao nhiêu số tự nhiên có $5$ chữ số (khác $0$ ở hàng chục nghìn), lấy từ tập
    $\{0,1,2,3,4\}$, sao cho không có $3$ chữ số liên tiếp nào bằng nhau?],
  (
    [$2048$],
    True([$2240$]),
    [$2304$],
    [$2500$],
  ),
  loigiai: [
    Đây là bài toán hàng thẳng, trong đó cho phép hai chữ số liên tiếp bằng nhau, nhưng không cho phép ba chữ số liên tiếp bằng nhau.

    Ta dùng hai trạng thái:

    - $x_n$: số dãy độ dài $n$ mà chữ số cuối khác chữ số ngay trước nó.
    - $y_n$: số dãy độ dài $n$ mà hai chữ số cuối bằng nhau.

    Chữ số đầu khác $0$ nên:
    $x_1=4$, $y_1=0$.

    Với tập $\{0,1,2,3,4\}$ có $5$ chữ số.

    Khi thêm một chữ số mới:

    - Nếu chọn khác chữ số trước đó: có $4$ cách.
    - Nếu chọn giống chữ số trước đó: chỉ được phép khi trước đó thuộc trạng thái $x$, và có $1$ cách.

    Do đó:
    $x_n=4(x_(n-1)+y_(n-1))$,
    $y_n=x_(n-1)$.

    Tính:

    $x_2=4(4+0)=16$, $y_2=4$.

    $x_3=4(16+4)=80$, $y_3=16$.

    $x_4=4(80+16)=384$, $y_4=80$.

    $x_5=4(384+80)=1856$, $y_5=384$.

    Vậy:
    $N=x_5+y_5=1856+384=2240.$

    Vậy có $2240$ số thỏa mãn.
  ],
)

#v(0.5em)
#tn(
  [Có bao nhiêu số tự nhiên có $4$ chữ số (khác $0$ ở hàng nghìn), lấy từ tập
    ${0,1,2,3,4}$, sao cho không có $3$ chữ số liên tiếp nào bằng nhau và chữ số hàng đơn vị bằng $0$?],
  (
    [$84$],
    True([$92$]),
    [$96$],
    [$100$],
  ),
  loigiai: [
    Gọi số cần lập có dạng $overline(a b c d)$.

    Điều kiện:
    - $a != 0$.
    - $d=0$.
    - Không có $3$ chữ số liên tiếp nào bằng nhau.

    Vì $d=0$, ta cần xét các bộ $(a,b,c,0)$.

    Trước hết:
    - $a$ có $4$ cách chọn: $1,2,3,4$.
    - $b$ có $5$ cách chọn.
    - $c$ có $5$ cách chọn.

    Nếu chưa xét điều kiện cấm $3$ chữ số liên tiếp bằng nhau, có:
    $4 dot 5 dot 5 = 100$ cách.

    Ta loại các trường hợp vi phạm.

    Có hai nhóm ba chữ số liên tiếp:

    - Nhóm $a b c$.
    - Nhóm $b c 0$.

    Nhóm $a b c$ vi phạm khi:
    $a=b=c$.

    Vì $a$ khác $0$, nên có $4$ trường hợp.

    Nhóm $b c 0$ vi phạm khi:
    $b=c=0$.

    Khi đó $a$ vẫn có $4$ cách chọn, nên có $4$ trường hợp.

    Hai loại vi phạm này không giao nhau, vì $a=b=c$ với $a != 0$ không thể đồng thời có $b=c=0$.

    Vậy số cách thỏa mãn là:
    $100-4-4=92.$

    Vậy có $92$ số thỏa mãn.
  ],
)

#v(0.5em)
#tn(
  [Một dãy gồm $n$ kí tự, lấy từ một tập có $k$ kí tự khác nhau. Hỏi công thức truy hồi nào dùng để đếm số dãy không có $3$ kí tự liên tiếp nào bằng nhau?],
  (
    [$a_n=k(a_(n-1)+a_(n-2))$],
    [$a_n=(k-1)a_(n-1)$],
    True([$a_n=(k-1)(a_(n-1)+a_(n-2))$]),
    [$a_n=k^n-k$],
  ),
  loigiai: [
    Gọi $a_n$ là số dãy độ dài $n$ không có $3$ kí tự liên tiếp nào bằng nhau.

    Xét dãy độ dài $n$ theo phần cuối:

    Cách 1: Kí tự cuối khác kí tự ngay trước nó.

    Khi đó ta có thể lấy một dãy hợp lệ độ dài $n-1$, rồi chọn kí tự cuối khác kí tự thứ $n-1$.

    Có $(k-1)a_(n-1)$ cách.

    Cách 2: Kí tự cuối bằng kí tự ngay trước nó.

    Khi đó để không tạo thành $3$ kí tự liên tiếp bằng nhau, kí tự thứ $n-2$ phải khác kí tự thứ $n-1$.

    Có thể xem ta lấy một dãy hợp lệ độ dài $n-2$, rồi chọn một kí tự khác kí tự cuối của dãy đó để lặp lại hai lần ở cuối.

    Có $(k-1)a_(n-2)$ cách.

    Do đó:
    $a_n=(k-1)a_(n-1)+(k-1)a_(n-2)$

    Hay:
    $a_n=(k-1)(a_(n-1)+a_(n-2)).$

    Với:
    $a_1=k$, $a_2=k^2.$

    Vậy công thức đúng là:
    $a_n=(k-1)(a_(n-1)+a_(n-2)).$
  ],
)

#v(0.5em)
#tn(
  [Có bao nhiêu dãy gồm $6$ kí tự, lấy từ một tập có $3$ kí tự khác nhau, sao cho không có $3$ kí tự liên tiếp nào bằng nhau?],
  (
    [$486$],
    True([$492$]),
    [$500$],
    [$512$],
  ),
  loigiai: [
    Gọi $a_n$ là số dãy độ dài $n$ lấy từ $3$ kí tự và không có $3$ kí tự liên tiếp nào bằng nhau.

    Với $k=3$:
    $a_n=(k-1)(a_(n-1)+a_(n-2))=2(a_(n-1)+a_(n-2)).$

    Ta có:
    $a_1=3$, $a_2=3^2=9$.

    Suy ra:

    $a_3=2(9+3)=24$.

    $a_4=2(24+9)=66$.

    $a_5=2(66+24)=180$.

    $a_6=2(180+66)=492$.

    Vậy có $492$ dãy thỏa mãn.
  ],
)

#v(0.5em)

== 1.2 Vòng Tròn: $(k-1)^n + (-1)^n (k-1)$

#theory-box[
  #text(fill: c-teal, size: 11pt, weight: "bold")[📐 Vòng Tròn: Chỉ Khó Hơn Hàng Thẳng Một Chút]
  #v(0.5em)
  Vòng tròn không khó vì công thức dài hơn, mà khó vì *ô cuối còn phải nhìn lại ô đầu*.
  Đó là khác biệt duy nhất so với hàng thẳng.

  #v(0.3em)
  Công thức tổng quát là:

  $ N_"vòng" = (k-1)^n + (-1)^n (k-1). $

  Câu nhớ nhanh là:
  *vòng tròn = hàng thẳng, nhưng khóa thêm điều kiện đầu khác cuối*.

  #v(0.4em)
  #align(center)[
    #cetz.canvas(length: 1.45cm, {
      import cetz.draw: *
      let r = 1.3
      let n = 5
      let cols = (rgb("FFCDD2"), rgb("C8E6C9"), rgb("BBDEFB"), rgb("FFF9C4"), rgb("F3E5F5"))
      let names = ("1", "2", "3", "4", "n")

      // Draw edges
      for i in range(n) {
        let a1 = (i * 360 / n + 90) * 1deg
        let a2 = ((i + 1) * 360 / n + 90) * 1deg
        let p1 = (calc.cos(a1) * r, calc.sin(a1) * r)
        let p2 = (calc.cos(a2) * r, calc.sin(a2) * r)
        if i == n - 1 {
          line(p1, p2, stroke: (dash: "dashed", paint: c-amber, thickness: 1.5pt))
        } else {
          line(p1, p2, stroke: 1.5pt + c-slate)
        }
      }

      // Draw vertices
      for i in range(n) {
        let a = (i * 360 / n + 90) * 1deg
        let p = (calc.cos(a) * r, calc.sin(a) * r)
        circle(p, radius: 0.3, fill: cols.at(i), stroke: 1.5pt + c-slate)
        content(p, text(weight: "bold", size: 9pt)[#names.at(i)])
      }

      content((0, 0), text(size: 8pt, fill: c-amber, weight: "bold")[Ô $n$ ≠ Ô $1$])
    })
  ]

  #v(0.35em)
  *Kiểm tra một giá trị nhỏ:* $n=3$, $k=3$ thì $N = 2^3 - 2 = 6$.
  Đây đúng là số cách tô tam giác bằng $3$ màu sao cho hai đỉnh kề nhau khác màu.
]

#route-box(title: "🧭 Cách Nghĩ Chậm Cho Vòng Tròn")[
  - *Bước 1:* Tạm cắt một chỗ trên vòng để mở thành hàng thẳng.
  - *Bước 2:* Tô hàng thẳng như bình thường.
  - *Bước 3:* Giữ lại những cấu hình mà hai đầu vừa cắt ra có màu khác nhau.

  Nếu muốn hiểu sâu hơn bằng truy hồi, ta tách các cách tô hàng thẳng thành hai nhóm:
  - đầu và cuối *khác màu* → chính là cấu hình hợp lệ của vòng $n$ ô;
  - đầu và cuối *cùng màu* → tương ứng với cấu hình của vòng $n-1$ ô.

  Từ đó có
  $N_"thẳng"(n) = N_"vòng"(n) + N_"vòng"(n-1)$
  nên
  $N_"vòng"(n) = k(k-1)^(n-1) - N_"vòng"(n-1).$
]

#v(0.5em)

#tn(
  [Một vòng đèn trang trí gồm $6$ bóng đèn xếp thành vòng tròn.
    Có $3$ màu đèn. Hai bóng liền kề nhau không được cùng màu.
    Số cách bố trí màu là:],
  (
    [$48$],
    [$54$],
    [$60$],
    True([$66$]),
  ),
  loigiai: [
    Đây là cấu trúc vòng tròn $C_6$ với $k=3$ màu.

    Áp dụng công thức vòng tròn:
    $N = (k-1)^n + (-1)^n (k-1).$

    Thay $n=6$, $k=3$ ta được
    $N = (3-1)^6 + (-1)^6(3-1) = 2^6 + 2 = 64 + 2 = 66.$

    Vậy có $66$ cách bố trí màu.
  ],
)

#v(0.5em)
#tn(
  [Một vòng đèn gồm $5$ bóng xếp thành vòng tròn.
  Có $4$ màu. Hai bóng kề nhau không cùng màu.
  Số cách bố trí là:],
  (
    [$240$],
    [$243$],
    True([$244$]),
    [$256$],
  ),
  loigiai: [
    Công thức vòng tròn:
    $N=(k-1)^n + (-1)^n (k-1)$

    Thay $n=5, k=4$:
    $N=3^5 - 3 = 243 - 3 = 240$

    ⇒ Đáp án đúng là $240$
  ],
)

#tn(
  [Một vòng gồm $8$ bóng đèn. Có $3$ màu.
  Hai bóng kề nhau khác màu.
  Số cách tô là:],
  (
    [$254$],
    True([$258$]),
    [$256$],
    [$260$],
  ),
  loigiai: [
    $N=(k-1)^n + (-1)^n (k-1)$

    $n=8, k=3$:
    $N=2^8 + 2 = 256 + 2 = 258$
  ],
)

#tn(
  [Một vòng tròn gồm $6$ bóng, có $4$ màu.
  Hai bóng liền kề không cùng màu.
  Số cách là:],
  (
    [$720$],
    True([$732$]),
    [$728$],
    [$756$],
  ),
  loigiai: [
    $N=(k-1)^n + (-1)^n (k-1)$

    $n=6, k=4$:
    $N=3^6 + 3 = 729 + 3 = 732$
  ],
)

#tn(
  [Một vòng gồm $7$ bóng đèn, có $3$ màu.
  Hai bóng kề nhau khác màu.
  Hỏi có bao nhiêu cách tô màu?],
  (
    [$126$],
    True([$126$]),
    [$128$],
    [$130$],
  ),
  loigiai: [
    $N=(k-1)^n + (-1)^n (k-1)$

    $n=7, k=3$:
    $N=2^7 - 2 = 128 - 2 = 126$
  ],
)

#tn(
  [$5$ chiếc ghế xếp quanh bàn tròn. Mỗi người ngồi mặc một chiếc áo
    trong $4$ màu khác nhau. Hai người ngồi kề nhau không được mặc áo cùng màu
    (không xét phép xoay). Số cách chọn màu áo là:],
  (
    True([$240$]),
    [$180$],
    [$360$],
    [$120$],
  ),
  loigiai: [
    Vì $5$ ghế xếp quanh bàn và đề nói rõ *không xét phép xoay*, ta dùng công thức vòng tròn cố định.

    Ở đây $n=5$, $k=4$, nên
    $N = (4-1)^5 + (-1)^5(4-1).$

    Suy ra
    $N = 3^5 - 3 = 243 - 3 = 240.$

    Vậy số cách chọn màu áo là $240$.
  ],
)

#v(0.5em)

#warn-box[
  *Sai lầm hay gặp:* cứ thấy hình tròn là áp công thức vòng tròn ngay.

  Cần hỏi thêm một câu:
  - *Vị trí có cố định không?* Vòng đèn gắn tường, pizza chia sẵn múi, ô trên mặt đồng hồ... → dùng công thức vòng tròn.
  - *Hay hai cách chỉ khác do xoay/lật được coi là một?* Khi đó phải chuyển sang Burnside ở Dạng 8.

  Đề phổ thông đôi khi viết mập mờ, nên luôn đọc kỹ câu "coi là giống nhau" hay "không xét phép xoay".
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN II
// ═══════════════════════════════════════════════
= Phần II — Phân Nhóm và Đa Thức Màu Tổng Quát

== 2.1 Nhân Theo Thành Phần Độc Lập

#key-box[
  Nếu đồ thị $G$ tách thành các phần *rời nhau hoàn toàn* $G_1, dots, G_c$ thì:
  $ P(G, k) = P(G_1, k) dot P(G_2, k) dot dots dot P(G_c, k). $

  Hiểu thật đơn giản là: cụm này tô thế nào cũng không ảnh hưởng đến cụm kia,
  nên ta đếm từng cụm rồi nhân lại.

  #v(0.35em)
  #align(center)[
    #cetz.canvas(length: 1.35cm, {
      import cetz.draw: *

      let a1 = (0, 0.7)
      let a2 = (1.1, 0.7)
      let a3 = (2.2, 0.7)
      line(a1, a2, a3, stroke: 1.2pt + c-teal)
      circle(a1, radius: 0.18, fill: white, stroke: 1.1pt + c-teal)
      circle(a2, radius: 0.18, fill: white, stroke: 1.1pt + c-teal)
      circle(a3, radius: 0.18, fill: white, stroke: 1.1pt + c-teal)
      content((1.1, 0.15), text(size: 8pt, fill: c-teal, weight: "bold")[Cụm $G_1$])

      content((3.3, 0.7), text(size: 12pt, weight: "bold")[$times$])

      let b1 = (4.7, 1.05)
      let b2 = (4.1, 0.0)
      let b3 = (5.3, 0.0)
      line(b1, b2, b3, b1, stroke: 1.2pt + c-amber)
      circle(b1, radius: 0.18, fill: white, stroke: 1.1pt + c-amber)
      circle(b2, radius: 0.18, fill: white, stroke: 1.1pt + c-amber)
      circle(b3, radius: 0.18, fill: white, stroke: 1.1pt + c-amber)
      content((4.7, -0.45), text(size: 8pt, fill: c-amber, weight: "bold")[Cụm $G_2$])

      content((7.0, 0.7), text(size: 11pt, weight: "bold")[$=>$])
      content((8.6, 0.7), text(size: 8.5pt, fill: c-slate, weight: "bold")[$P(G,k)=P(G_1,k)P(G_2,k)$])
    })
  ]
]

#example-box(n: "2.1 — Hai vòng ghép")[
  *Đề:* Một bảng gồm $4$ ô xếp vòng, mỗi ô chia làm phần *trong* và *ngoài*.
  Bốn phần ngoài kề nhau theo vòng; bốn phần trong cũng kề nhau theo vòng;
  trong và ngoài của cùng ô không bị ràng buộc.
  Có $3$ màu. Số cách tô $8$ phần?

  *Nhận diện:* Có đúng $2$ cụm rời nhau, mỗi cụm là một vòng $C_4$.

  *Lời giải ngắn theo ý tưởng:*
  - Mỗi vòng có $P(C_4, 3) = 18$ cách tô.
  - Hai vòng độc lập nên nhân lại.

  Vậy $N = 18 dot 18 = 324.$
]

#v(0.5em)

== 2.2 Deletion-Contraction — Công Thức Đệ Quy Tổng Quát

#theory-box[
  #text(fill: c-teal, size: 11pt, weight: "bold")[📐 Deletion-Contraction: Bỏ Cạnh Rồi Trừ Phần Đếm Thừa]
  #v(0.5em)
  Công cụ này dùng khi đề bài không rơi thẳng vào hàng thẳng, vòng tròn hay bảng $2 times n$.
  Chọn một cạnh $e = {u,v}$ đang làm bài toán khó, rồi nghĩ như sau:

  - *Bỏ cạnh $e$* để được $G'$: lúc này ràng buộc "$u$ phải khác $v$" biến mất nên đồ thị dễ đếm hơn.
  - Nhưng vì đã bỏ cạnh, ta đếm *thừa* những cấu hình mà $u$ và $v$ lại cùng màu.
  - Những cấu hình đếm thừa đó tương ứng đúng với việc *gộp $u,v$ thành một đỉnh* để được $G''$.

  $ P(G, k) = P(G', k) - P(G'', k). $

  Nói rất gọn: *số cần tìm = số dễ đếm hơn - phần đếm thừa*.

  #v(0.4em)
  #align(center)[
    #cetz.canvas(length: 1.35cm, {
      import cetz.draw: *

      // Helper to draw a triangle G
      let draw-triangle(x, label) = {
        let p1 = (x, 0.8)
        let p2 = (x - 0.7, -0.4)
        let p3 = (x + 0.7, -0.4)
        line(p1, p2, p3, p1, stroke: 1.2pt + c-slate)
        circle(p1, radius: 0.18, fill: white, stroke: 1.2pt + c-slate)
        circle(p2, radius: 0.18, fill: white, stroke: 1.2pt + c-slate)
        circle(p3, radius: 0.18, fill: white, stroke: 1.2pt + c-slate)
        content(p1, text(size: 7.5pt, weight: "bold")[1])
        content(p2, text(size: 7.5pt, weight: "bold")[2])
        content(p3, text(size: 7.5pt, weight: "bold")[3])
        content((x, -0.9), text(size: 8.5pt, weight: "bold")[#label])
      }

      // Helper to draw G' (deleted edge 3-1)
      let draw-deleted(x, label) = {
        let p1 = (x, 0.8)
        let p2 = (x - 0.7, -0.4)
        let p3 = (x + 0.7, -0.4)
        line(p1, p2, p3, stroke: 1.2pt + c-slate)
        line(p3, p1, stroke: (dash: "dashed", paint: c-amber, thickness: 1.2pt))
        circle(p1, radius: 0.18, fill: white, stroke: 1.2pt + c-slate)
        circle(p2, radius: 0.18, fill: white, stroke: 1.2pt + c-slate)
        circle(p3, radius: 0.18, fill: white, stroke: 1.2pt + c-slate)
        content(p1, text(size: 7.5pt, weight: "bold")[1])
        content(p2, text(size: 7.5pt, weight: "bold")[2])
        content(p3, text(size: 7.5pt, weight: "bold")[3])
        content((x, -0.9), text(size: 8.5pt, weight: "bold")[#label])
      }

      // Helper to draw G'' (contracted 3-1)
      let draw-contracted(x, label) = {
        let p1 = (x, 0.5)
        let p2 = (x, -0.5)
        line(p1, p2, stroke: 1.2pt + c-slate)
        circle(p1, radius: 0.22, fill: rgb("FFF8E1"), stroke: 1.2pt + c-amber)
        circle(p2, radius: 0.18, fill: white, stroke: 1.2pt + c-slate)
        content(p1, text(size: 6.5pt, weight: "bold")[1,3])
        content(p2, text(size: 7.5pt, weight: "bold")[2])
        content((x, -0.9), text(size: 8.5pt, weight: "bold")[#label])
      }

      draw-triangle(0, [$G$ (gốc)])
      content((1.2, 0), text(size: 14pt)[$=$])
      draw-deleted(2.7, [$G'$ (xóa $e$)])
      content((4.2, 0), text(size: 14pt)[$-$])
      draw-contracted(5.6, [$G''$ (gộp $e$)])
    })
  ]

  *Điểm tựa để dừng phép biến đổi:*
  - Không cạnh: $P(overline(K)_n, k) = k^n$.
  - Cây $n$ đỉnh: $P(T, k) = k(k-1)^(n-1)$.
  - Đồ thị đầy đủ: $P(K_n, k) = k(k-1) dots (k-n+1)$.
]

#example-box(n: "2.2 — Tính $P(C_4, k)$")[
  Chọn một cạnh của hình vuông.

  - *Xóa cạnh đó:* hình vuông mở thành đường thẳng $P_4$, nên $P(G', k) = k(k-1)^3$.
  - *Gộp hai đầu mút của cạnh đó:* ta được tam giác $C_3$, nên $P(G'', k) = k(k-1)(k-2)$.

  Vậy
  $P(C_4, k) = k(k-1)^3 - k(k-1)(k-2) = k(k-1)(k^2-3k+3).$

  Nếu thay $k=3$ thì $P(C_4, 3) = 18$.
]

#v(0.5em)

#key-box[
  *Dành cho giáo viên muốn nhìn bức tranh lớn:* công thức Whitney là dạng tổng quát của bài toán tô màu.

  $ P(G, k) = sum_(S subset.eq E) (-1)^(|S|) k^(c(S)) $

  trong đó $c(S)$ là số thành phần liên thông của đồ thị con với tập cạnh $S$.

  Với học sinh phổ thông, thường không nên mở đầu bằng công thức này.
  Nhịp trình bày mềm hơn là: hàng thẳng → vòng tròn → bảng $2 times n$ → thành phần độc lập → deletion-contraction.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN III — TRỌNG TÂM CHUYÊN ĐỀ
// ═══════════════════════════════════════════════
= Phần III — Tám Đại Bác Công Phá Biến Thể THPT

#cannon-box("Bản Đồ 8 Đại Bác Công Phá")[
  #table(
    columns: (0.75fr, 1.6fr, 1.25fr, 1.6fr),
    stroke: 0.45pt + rgb("FFAB91"),
    fill: (x, y) => if y == 0 { rgb("D84315") } else if calc.odd(y) { rgb("FFF3E0") } else { white },
    inset: (x: 8pt, y: 6pt),
    align: (center, left, left, left),
    table.header(
      text(fill: white, weight: "bold")[Đại bác],
      text(fill: white, weight: "bold")[Vỏ bọc trong đề],
      text(fill: white, weight: "bold")[Kéo về],
      text(fill: white, weight: "bold")[Cú bắn chốt],
    ),
    [1], [Số, mật khẩu, OTP, mã], [Hàng thẳng], [$k(k-1)^(n-1)$ hoặc $(k-1)^n$],
    [2], [Nhà, hàng rào, cột, ghế], [Hàng thẳng có xét biên], [soi thêm đầu-cuối, dùng đủ màu],
    [3], [Đèn vòng, pizza, đồng hồ], [Vòng cố định], [$(k-1)^n + (-1)^n (k-1)$],
    [4], [Cửa sổ $2$ tầng, bảng $2 times n$], [Lưới $2 times n$], [$k(k-1)(k^2-3k+3)^(n-1)$],
    [5], [Cờ, logo, bảng hiệu chia mảng], [Hàng thẳng hoặc đối ngẫu], [vẽ đúng quan hệ kề],
    [6], [Lịch, ca, nhóm, phân phòng], [Đồ thị xung đột], [$P(G, k)$],
    [7], [Bản đồ, hình phẳng chia vùng], [Đồ thị đối ngẫu], [$P(G_"đối ngẫu", k)$],
    [8], [Vòng hoa, hạt cườm, mẫu tròn], [Burnside], [$frac(1, |G|) sum |X^g|$],
  )

  #v(0.45em)
  *Nguyên tắc công phá:* không cố nhớ từng bài lẻ. Hãy kéo đề về đúng *1 trong 8 đại bác* này, rồi mới bắn công thức.
]

#route-box(title: "✍️ Khuôn Lời Giải Ngắn Cho Hầu Hết Các Câu")[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.9em,
    row-gutter: 0.55em,
    text(fill: c-amber, weight: "bold")[1],
    [*Nhận diện đối tượng:* mỗi nhà/ô/vùng/môn/người tương ứng với một đỉnh hoặc một ô.],

    text(fill: c-amber, weight: "bold")[2],
    [*Chỉ ra cấu trúc ẩn:* hàng thẳng, vòng tròn, bảng $2 times n$, hay đồ thị xung đột/đối ngẫu.],

    text(fill: c-amber, weight: "bold")[3], [*Viết công thức phù hợp* rồi thay đúng $n, k$.],

    text(fill: c-amber, weight: "bold")[4],
    [*Kết luận bằng một câu đầy đủ:* "Vậy số cách là ...". Tránh nhảy thẳng vào phép tính mà không nói bản chất.],
  )
]

== Đại Bác 1 🔢 — Dãy Số và Mật Khẩu

#recognize-box("Đại Bác 1 — Chụp Hàng Thẳng")[
  *Vỏ bọc hay gặp:* "lập số ... chữ số", "mật khẩu ... ký tự", "mã sản phẩm",
  "dãy ký hiệu ... phần tử", "mã OTP", "chuỗi xác thực".

  *Cú bắn chuẩn:* đóng đề về một hàng thẳng $n$ vị trí.
  Nếu mỗi vị trí chỉ cần khác vị trí sát trước nó thì dùng ngay hàng thẳng:
  - ô đầu tự do → $N = k(k-1)^(n-1)$;
  - ô đầu bị cấm $1$ giá trị (thường là chữ số $0$) → $N = (k-1)^n$.

  *Biến thể phổ thông hay nấp:* số có nhiều chữ số, mã ghế, số báo danh, chuỗi đèn LED thẳng, biển quảng cáo có các ô liên tiếp.

  *Bẫy cuối:* nếu đề chỉ cấm một ký hiệu đặc biệt, ví dụ "không có hai số $1$ liên tiếp", thì đó không còn là tô màu thuần nữa mà chuyển sang DP/Fibonacci.
]

#v(0.5em)

#tn(
  [Một dải băng giấy được chia làm $4$ ô liên tiếp. Có cọ vẽ $3$ màu (Đỏ, Xanh, Vàng). Bạn cần tô màu sao cho hai ô kề nhau phải khác màu. Hỏi có bao nhiêu cách tô dải băng này?],
  (
    [$3^4 = 81$],
    True([$3 dot 2^3 = 24$]),
    [$4 dot 3 = 12$],
    [$3 dot 2 dot 1 = 6$],
  ),
  loigiai: [
    Đây là mô hình hàng thẳng cơ bản nhất: $n=4$ ô, $k=3$ màu.
    
    - Ô đầu tiên thoái mái chọn, có $3$ cách.
    - Từ ô thứ hai trở đi, mỗi ô chỉ cần né đi $1$ màu của ô đứng trước nó. Vậy mỗi ô đều có $3 - 1 = 2$ cách lựa chọn.
    
    Áp dụng công thức Đại Bác 1: 
    $N = k(k-1)^(n-1) = 3 dot 2^3 = 24$ cách.
    
    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(4) {
          rect((i*1.3, 0), (i*1.3 + 1, 0.8), fill: rgb("FFEBEE"), stroke: 1.5pt + c-slate)
        }
        content((0.5, 0.4), text(weight: "bold")[3])
        content((1.8, 0.4), text(weight: "bold")[2])
        content((3.1, 0.4), text(weight: "bold")[2])
        content((4.4, 0.4), text(weight: "bold")[2])
        content((2.45, -0.4), text(size: 8.5pt, weight: "bold")[Các ô kề nhau bị cấm lặp màu])
      })
    ]
  ]
)

#v(0.5em)

#tn(
  [Có bao nhiêu số tự nhiên có $5$ chữ số, lấy từ tập $\{1, 2, 3, 4, 5\}$,
    không có hai chữ số liên tiếp bằng nhau?],
  (
    [$4 dot 5^3 = 500$],
    True([$5 dot 4^4 = 1280$]),
    [$5^5 = 3125$],
    [$5 dot 4^3 = 320$],
  ),
  loigiai: [
    Đây là hàng thẳng gồm $5$ vị trí, với $5$ chữ số cho phép và không có chữ số $0$ nên ô đầu không bị hạn chế riêng.

    - Chữ số đầu có $5$ cách chọn.
    - Mỗi chữ số tiếp theo chỉ cần khác chữ số đứng ngay trước, nên có $4$ cách.

    Do đó
    $N = 5 dot 4^4 = 5 dot 256 = 1280.$

    Vậy có $1280$ số thỏa mãn.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(5) {
          rect((i*1.5, 0), (i*1.5 + 1.1, 1), fill: rgb("E8EAF6"), stroke: 1.5pt + c-navy, radius: 2pt)
          if i > 0 {
            line((i*1.5 - 0.4, 0.5), (i*1.5, 0.5), mark: (end: "stealth", size: 0.15), stroke: 1.5pt + c-amber)
          }
        }
        content((0.55, 0.5), text(weight: "bold")[5])
        for i in range(1, 5) {
          content((i*1.5 + 0.55, 0.5), text(weight: "bold")[4])
        }
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Biển số xe gồm $3$ chữ cái tiếp theo $3$ chữ số. Mỗi chữ số lấy từ $\{0..9\}$;
    chữ số đầu ≠ $0$; không có hai chữ số liên tiếp bằng nhau.
    Số biển số hợp lệ (chỉ tính phần $3$ chữ số) là:],
  (
    [$720$],
    True([$9 dot 9 dot 9 = 729$]),
    [$9 dot 10 dot 9 = 810$],
    [$10 dot 9^2 = 810$],
  ),
  loigiai: [
    Ta chỉ cần xét phần $3$ chữ số ở cuối biển số.

    - Chữ số đầu tiên không được bằng $0$, nên có $9$ cách chọn.
    - Chữ số thứ hai phải khác chữ số thứ nhất, nên vẫn có $9$ cách.
    - Chữ số thứ ba chỉ cần khác chữ số thứ hai, nên cũng có $9$ cách.

    Vậy
    $N = 9 dot 9 dot 9 = 9^3 = 729.$

    Số biển số hợp lệ ở phần chữ số là $729$.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(3) {
          rect((i*1.5, 0), (i*1.5 + 1.1, 1), fill: rgb("FFFDE7"), stroke: 1.5pt + c-navy, radius: 2pt)
          if i > 0 {
            line((i*1.5 - 0.4, 0.5), (i*1.5, 0.5), mark: (end: "stealth", size: 0.15), stroke: 1.2pt + c-slate)
            content((i*1.5 - 0.2, 0.75), text(size: 8pt)[≠])
          }
        }
        content((0.55, 0.5), text(weight: "bold")[9 ch])
        for i in range(1, 3) {
          content((i*1.5 + 0.55, 0.5), text(weight: "bold")[9 ch])
        }
        content((0.55, -0.4), text(size: 8pt)[Khác 0])
      })
    ]
  ],
)

#v(0.5em)

#tln(
  id: "CB-OTP",
  [Một hệ thống bảo mật tạo mã OTP ngang gồm $6$ ô. Mỗi ô được điền tự động một chữ số từ $1$ đến $5$. Để tránh rủi ro người dùng nhập sai do phím đúp, hệ thống cấm hai ô kề nhau có cùng chữ số. Tính số lượng mã OTP hợp lệ có thể tạo ra. *(Điền đáp án là một số nguyên)*],
  [$5120$],
  loigiai: [
    Đây là một bài toán cấu trúc hàng thẳng với $n=6$ ô và $k=5$ giá trị (chữ số).

    - Ô thứ nhất nằm tự do, có đủ $5$ lựa chọn.
    - Từ ô thứ hai đến ô thứ sáu ($5$ ô), mỗi ô chỉ cần khác với ô đứng ngay trước nó, do đó mỗi ô có $4$ lựa chọn.

    Số cách tạo mã là $N = 5 dot 4^5 = 5120.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(6) {
          rect((i * 1.5, 0), (i * 1.5 + 1.1, 1), fill: rgb("E3F2FD"), stroke: 1pt + c-navy, radius: 2pt)
          if i > 0 {
            line((i * 1.5 - 0.4, 0.5), (i * 1.5, 0.5), mark: (end: "stealth", size: 0.15), stroke: 1.2pt + c-amber)
            content((i * 1.5 - 0.2, 0.7), text(size: 8pt, fill: c-amber, weight: "bold")[≠])
          }
        }
        content((0.55, 0.5), text(weight: "bold")[5 ch])
        for i in range(1, 6) {
          content((i * 1.5 + 0.55, 0.5), text(weight: "bold")[4 ch])
        }
      })
    ]
  ],
)

#v(0.5em)

#example-box(n: "1 — Biến Tấu: Dãy Nhị Phân Không Có Hai Số 1 Liên Tiếp")[
  *Đây là bài toán tô màu biến thể:* dãy $n$ bit $\{0,1\}$ sao cho không có $"11"$
  (hai chữ số $1$ liên tiếp).

  *Lưu ý:* Đây *không* phải là hàng thẳng $k=2$ thông thường vì ràng buộc
  chỉ áp dụng cho chữ số $1$ (không cấm "$00$"). Đây là bài toán đếm bằng quy hoạch
  động (DP), không phải đơn thuần tô màu.
  Số dãy: $a_n$ trong đó $a_1=2$, $a_2=3$, $a_n = a_{n-1}+a_{n-2}$ (Fibonacci).
]

#v(0.5em)

== Đại Bác 2 🏠 — Sơn Nhà, Cột, Hàng Rào, Dải Màu

#recognize-box("Đại Bác 2 — Sơn Dọc Một Dãy Thật")[
  *Vỏ bọc hay gặp:* "dãy nhà liền kề", "cột đèn trên đường thẳng",
  "hàng rào $n$ tấm ván", "sơn $n$ đoạn", "băng màu $n$ ô", "dãy ghế khán đài".

  *Cú bắn chuẩn:* bản chất vẫn là hàng thẳng, nhưng phải soi kỹ *điều kiện ở biên*:
  - nếu chỉ cấm hai vật sát nhau trùng màu → dùng công thức hàng thẳng;
  - nếu đầu và cuối cũng bị ràng buộc → chuyển ngay sang Đại Bác 3;
  - nếu đề gài điều kiện "dùng đủ màu", "không quá ... màu" → phải tách trường hợp hoặc inclusion-exclusion.

  *Biến thể phổ thông hay nấp:* sơn chậu hoa xếp dọc, ghế rạp, cọc tiêu, pano quảng cáo, dãy cửa hàng sát nhau.

  *Bẫy cuối:* nhìn vật thể thật rất dễ bị cuốn theo ngữ cảnh. Chỉ cần hỏi lại: "chúng có đang tạo thành đúng *một dãy* không?".
]

#v(0.5em)

#tn(
  [Một hàng rào gồm $7$ tấm ván xếp thẳng. Có $4$ màu sơn.
    Hai tấm liền kề phải khác màu. Số cách sơn là:],
  (
    [$4 dot 3^5 = 972$],
    True([$4 dot 3^6 = 2916$]),
    [$4^7 = 16384$],
    [$3^7 = 2187$],
  ),
  loigiai: [
    Hàng rào là một hàng thẳng gồm $7$ tấm, với $4$ màu sơn.

    - Tấm đầu tiên có $4$ cách chọn màu.
    - Mỗi tấm sau chỉ cần khác tấm đứng liền trước, nên có $3$ cách.

    Do đó
    $N = 4 dot 3^6 = 4 dot 729 = 2916.$

    Vậy số cách sơn là $2916$.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(7) {
          rect((i*1.2, 0), (i*1.2 + 0.8, 1.5), fill: rgb("FFFFFF"), stroke: 1.5pt + c-teal, radius: 1pt)
          let v = if i == 0 { "4" } else { "3" }
          content((i*1.2 + 0.4, 0.75), text(weight: "bold", fill: c-teal)[#v])
        }
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Một dãy $6$ căn nhà liền tiếp cần sơn bằng $3$ màu.
    Hai nhà kề nhau phải khác màu; thêm điều kiện nhà đầu tiên và nhà cuối cùng
    cũng phải khác màu. Số cách sơn là:],
  (
    [$96$],
    True([$66$]),
    [$60$],
    [$72$],
  ),
  loigiai: [
    Nếu nhà đầu tiên cũng phải khác nhà cuối cùng, dãy nhà này không còn là hàng thẳng nữa mà trở thành vòng $C_6$.

    Với $n=6$, $k=3$, ta áp dụng công thức vòng tròn:
    $N = (3-1)^6 + (-1)^6(3-1).$

    Suy ra
    $N = 2^6 + 2 = 64 + 2 = 66.$

    Vậy số cách sơn là $66$.
  ],
)

#v(0.5em)

#tln(
  id: "CB-LED",
  [Tại phố đi bộ người ta thiết kế một dãy đèn LED gồm $8$ module sáng thẳng hàng để tạo hiệu ứng sóng chạy. Người thiết kế lập trình dùng $4$ loại bóng màu. Yêu cầu là hai module kề nhau luôn phát màu khác nhau, và đặc biệt module đầu dãy phải khác màu module cuối dãy. Tính số cách cấu hình màu. *(Điền đáp án là một số nguyên)*],
  [$6564$],
  loigiai: [
    Mặc dù bề ngoài là một "hàng thẳng", nhưng điều kiện đặc biệt "đầu dãy khác cuối dãy" đã kéo cấu trúc này cuộn lại, tạo thành một đồ thị vòng tròn $C_8$.

    Áp dụng công thức vòng tròn với $n=8$ và $k=4$ màu:
    $N = (k-1)^n + (-1)^n (k-1).$

    Vào phép tính:
    $N = (4-1)^8 + (-1)^8(4-1) = 3^8 + 3 = 6561 + 3 = 6564.$

    Vậy có $6564$ cách.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(8) {
          circle((i * 1.2, 0), radius: 0.35, fill: rgb("FFF9C4"), stroke: 1.2pt + c-slate)
          content((i * 1.2, 0), text(size: 9pt, weight: "bold")[$i+1$])
          if i < 7 {
            line((i * 1.2 + 0.35, 0), (i * 1.2 + 1.2 - 0.35, 0), stroke: 1.5pt + c-teal)
          }
        }
        bezier((0, 0.35), (7 * 1.2, 0.35), (3 * 1.2, 2.5), stroke: (dash: "dashed", paint: c-amber, thickness: 1.5pt))
        content((3 * 1.2 + 0.6, 1.2), text(fill: c-amber, weight: "bold")[Cấm 1 kề 8 (kéo thành vòng)])
      })
    ]
  ],
)

#v(0.5em)

== Đại Bác 3 🔄 — Vòng Đèn, Bàn Tròn, Vòng Hoa (Vị Trí Cố Định)

#recognize-box("Đại Bác 3 — Khóa Vòng Cố Định")[
  *Vỏ bọc hay gặp:* "vòng đèn $n$ bóng", "$n$ bông hoa xếp vòng tròn",
  "$n$ ô trên mặt đồng hồ", "$n$ múi cam", "các ghế quanh vòng nhưng vị trí đã chốt".

  *Cú bắn chuẩn:* đây là hàng thẳng bị khóa thêm một cạnh cuối cùng: *ô cuối cũng phải khác ô đầu*.
  Khi vị trí là cố định, dùng ngay
  $N = (k-1)^n + (-1)^n (k-1).$

  *Biến thể phổ thông hay nấp:* đồng hồ 12 số, bánh xe chia múi, vòng gạch trang trí, đèn LED viền bảng hiệu, pizza cắt sẵn.

  *Bẫy cuối:* nếu đề nói "hai cách giống nhau khi xoay/lật" thì thôi không dùng đại bác này nữa, mà chuyển sang Đại Bác 8.
]

#tn(
  [$8$ bóng đèn màu được gắn cố định trên một vòng tròn trang trí.
    Có $4$ màu đèn. Hai bóng liền kề phải khác màu. Số cách bố trí là:],
  (
    [$3^8 = 6561$],
    True[$3^8 + 3 = 6564$],
    [$4 dot 3^7 = 8748$],
    [$3^8 - 3 = 6558$],
  ),
  loigiai: [
    Vì các bóng được gắn cố định trên một vòng tròn, ta dùng công thức tô màu vòng tròn với $n=8$, $k=4$.

    Do đó
    $N = (4-1)^8 + (-1)^8(4-1) = 3^8 + 3.$

    Tính ra
    $N = 6561 + 3 = 6564.$

    Vậy có $6564$ cách bố trí.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(8) {
          let a = i * 45deg
          circle((calc.cos(a)*1.5, calc.sin(a)*1.5), radius: 0.3, fill: rgb("FFF9C4"), stroke: 1.5pt + c-amber)
          let a_next = (i+1) * 45deg
          line((calc.cos(a)*1.5, calc.sin(a)*1.5), (calc.cos(a_next)*1.5, calc.sin(a_next)*1.5), stroke: 1.5pt + c-slate)
        }
        content((0,0), text(size: 9pt, weight: "bold")[8 Bóng])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Tô màu $7$ vùng của một bánh pizza cắt đều $7$ miếng xếp thành vòng.
    Có $3$ màu; hai miếng kề nhau phải khác màu. Số cách tô là:],
  (
    [$2^7 = 128$],
    True([$2^7 - 2 = 126$]),
    [$2^7 + 2 = 130$],
    [$3 dot 2^6 = 192$],
  ),
  loigiai: [
    Bảy miếng pizza tạo thành một vòng tròn $C_7$, với $3$ màu và điều kiện các miếng kề nhau phải khác màu.

    Áp dụng công thức vòng tròn:
    $N = (3-1)^7 + (-1)^7(3-1).$

    Suy ra
    $N = 2^7 - 2 = 128 - 2 = 126.$

    Vậy số cách tô là $126$.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(7) {
          let a1 = i * 360deg / 7
          let a2 = (i+1) * 360deg / 7
          arc((0,0), radius: 1.4, start: a1, stop: a2, mode: "PIE", fill: rgb("FFEBEE"), stroke: 1.5pt + c-slate)
        }
        content((0,-1.8), text(size: 9pt, weight: "bold")[Pizza $C_7$])
      })
    ]
  ],
)

#v(0.5em)

#tln(
  id: "CB-RLT",
  [Một bàn quay roulette CỐ ĐỊNH được chia làm $6$ múi bằng nhau. Người thợ dùng $5$ màu sơn để sơn lên các múi này sao cho múi kề nhau phải có màu khác nhau để dễ phân biệt. Khung bàn quay gắn chặt vào mặt tường nên không xét tính chất đối xứng xoay (vị trí múi trên cùng, múi dưới cùng luôn phân biệt). Tính số cách hoàn thiện bàn quay này.],
  [$4100$],
  loigiai: [
    Vòng quay gắn cố định trên tường, nên khoảng không này chuẩn xác là đồ thị vòng tròn $C_6$ bình thường. Điểm mấu chốt là "Không xét đối xứng xoay", nên khóa hẳn Đại Bác 3 thay vì nhảy qua Burnside.

    Áp dụng công thức tô màu vòng:
    $N = (k-1)^n + (-1)^n (k-1).$

    Với $n=6, k=5$:
    $N = (5-1)^6 + (-1)^6(5-1) = 4^6 + 4.$
    $N = 4096 + 4 = 4100.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.3
        for i in range(6) {
          let a1 = i * 60deg
          let a2 = (i + 1) * 60deg
          arc((0, 0), radius: r, start: a1, stop: a2, mode: "PIE", fill: rgb("E8EAF6"), stroke: 1.2pt + c-slate)

          let am = i * 60 + 30
          content((calc.cos(am * 1deg) * r * 0.7, calc.sin(am * 1deg) * r * 0.7), text(
            size: 10pt,
            weight: "bold",
          )[$i+1$])
        }
        content((0, -r - 0.4), text(size: 9pt, weight: "bold", fill: c-navy)[Điểm chốt (Vị trí cố định)])
      })
    ]
  ],
)

#pagebreak()

== Đại Bác 4 ⬛ — Bảng $2 times n$

#recognize-box("Đại Bác 4 — Quét Theo Cột 2×n")[
  *Vỏ bọc hay gặp:* "bảng $2 times n$ ô", "lịch $2$ hàng $n$ cột",
  "mặt tiền nhà $2$ tầng $n$ cửa sổ", "hành lang $2$ bên $n$ phòng", "hai dãy phòng song song".

  *Cú bắn chuẩn:* nghĩ theo *cột*, không nghĩ theo từng ô rời rạc.
  Cột đầu có $k(k-1)$ cách, còn mỗi cột sau đóng góp hệ số
  $k^2-3k+3$,
  nên
  $N_(2 times n) = k(k-1)(k^2-3k+3)^(n-1).$

  *Biến thể phổ thông hay nấp:* cửa sổ 2 tầng, ghế hai dãy, logo hai hàng, kệ trên-dưới, dãy phòng hai bên hành lang.

  *Bẫy cuối:* kề chéo *không* bị cấm nếu đề chỉ nói kề cạnh. Chỉ cần đổi điều kiện kề là công thức sẽ thay ngay.

  #v(0.4em)
  #align(center)[
    #cetz.canvas(length: 1.35cm, {
      import cetz.draw: *

      // Draw Grid column i-1
      rect((0, 0.5), (1.2, 1.7), fill: rgb("E0F2F1"), stroke: 1.5pt + c-slate, radius: 2pt)
      rect((0, -0.9), (1.2, 0.3), fill: rgb("FFCDD2"), stroke: 1.5pt + c-slate, radius: 2pt)

      // Draw Grid column i
      rect((2.4, 0.5), (3.6, 1.7), fill: white, stroke: 1.2pt + c-slate, radius: 2pt)
      rect((2.4, -0.9), (3.6, 0.3), fill: white, stroke: 1.2pt + c-slate, radius: 2pt)

      // Ràng buộc kề
      // Ngang: a_(i-1) != a_i và b_(i-1) != b_i
      line((1.2, 1.1), (2.4, 1.1), mark: (both: "stealth", size: 0.12), stroke: 1pt + c-amber)
      line((1.2, -0.3), (2.4, -0.3), mark: (both: "stealth", size: 0.12), stroke: 1pt + c-amber)

      // Dọc: a_(i-1) != b_(i-1) và a_i != b_i
      line((0.6, 0.5), (0.6, 0.3), mark: (both: "stealth", size: 0.1), stroke: 1pt + c-teal)
      line((3.0, 0.5), (3.0, 0.3), mark: (both: "stealth", size: 0.1), stroke: 1pt + c-teal)

      content((0.6, 1.1), text(weight: "bold")[$a_(i-1)$])
      content((0.6, -0.3), text(weight: "bold")[$b_(i-1)$])
      content((3.0, 1.1), text(weight: "bold")[$a_i$])
      content((3.0, -0.3), text(weight: "bold")[$b_i$])

      content((0.6, 2.1), text(size: 8pt, fill: c-teal, weight: "bold")[Cột $i-1$ (đã tô)])
      content((3.0, 2.1), text(size: 8pt, fill: c-amber, weight: "bold")[Cột $i$ (cần tô)])

      content((1.8, 1.4), text(size: 7.5pt, fill: c-amber, weight: "bold")[≠])
      content((1.8, -0.6), text(size: 7.5pt, fill: c-amber, weight: "bold")[≠])
      content((-0.2, 0.4), text(size: 7.5pt, fill: c-teal, weight: "bold")[≠])
      content((3.8, 0.4), text(size: 7.5pt, fill: c-teal, weight: "bold")[≠])
    })
  ]

  *Giải thích dẫn xuất trực quan:*
  Ta thực hiện tô màu lần lượt từ trái sang phải, theo từng cột:
  - *Cột 1:* Gồm hai ô $(a_1, b_1)$ kề nhau. Ô $a_1$ có $k$ cách chọn màu, ô $b_1$ kề dưới $a_1$ nên có $k-1$ cách chọn. Vậy cột 1 có $k(k-1)$ cách tô.
  - *Xét bước chuyển tiếp từ cột $i-1$ sang cột $i$:* Giả sử cột $i-1$ đã tô xong với hai màu khác nhau là $(a_(i-1), b_(i-1))$. Ta cần chọn cặp màu $(a_i, b_i)$ cho cột $i$ sao cho: $a_i != a_(i-1)$, $b_i != b_(i-1)$, và $a_i != b_i$.
    Ô $a_i$ kề bên phải $a_(i-1)$ nên có $k-1$ cách chọn (loại màu của $a_(i-1)$). Khi đó, ô $b_i$ phụ thuộc vào việc màu $a_i$ được chọn như thế nào:
    - *Trường hợp 1 (Trùng màu chéo):* Nếu ô $a_i$ trùng màu với $b_(i-1)$ (chỉ có $1$ cách chọn vì màu của $b_(i-1)$ đã cố định và chắc chắn khác $a_(i-1)$). Lúc này, ô $b_i$ cần khác $b_(i-1)$ (kề trái) và khác $a_i$ (kề trên). Tuy nhiên vì $a_i = b_(i-1)$, thực chất $b_i$ chỉ cần tránh đúng $1$ màu này. Do đó $b_i$ có $k-1$ cách chọn.
      $=> N_1 = 1 dot (k-1) = k-1$ cách.
    - *Trường hợp 2 (Khác màu chéo):* Nếu ô $a_i$ khác màu với $b_(i-1)$ (có $(k-1) - 1 = k-2$ cách chọn vì $a_i$ phải vừa khác $a_(i-1)$ vừa khác $b_(i-1)$). Lúc này, ô $b_i$ phải khác cả $b_(i-1)$ (kề trái) và khác $a_i$ (kề trên). Vì hai màu này khác nhau, ô $b_i$ bị cấm $2$ màu. Do đó $b_i$ còn $k-2$ cách chọn.
      $=> N_2 = (k-2) dot (k-2) = (k-2)^2$ cách.

    Tổng số cách chọn cho mỗi cột tiếp theo là:
    $ N_"cột" = (k-1) + (k-2)^2 = k - 1 + k^2 - 4k + 4 = k^2 - 3k + 3. $
    Nhân $n-1$ cột tiếp theo vào cột đầu tiên, ta có công thức tổng quát.
]

#example-box(n: "4 — Bảng 2×3, 3 màu")[
  $k=3$, $n=3$: $N = 3 dot 2 dot (9-9+3)^2 = 6 dot 9 = 54.$

  *Kiểm tra bằng tô trực tiếp:* Cột 1: $(a_1, b_1)$ với $a_1 != b_1$ → $3 dot 2 = 6$ cách.
  Từ cột 1 → cột 2: $k^2 - 3k + 3 = 3$ cách. Từ cột 2 → cột 3: lại $3$ cách.
  $N = 6 dot 3 dot 3 = 54$ ✓
]

#v(0.5em)

#tn(
  [Một bảng $2 times 2$ đơn giản nhất được tô bằng $4$ màu khác nhau. Hai ô kề cạnh không được lặp màu. Hỏi có bao nhiêu cách tô?],
  (
    [$36$],
    [$48$],
    [$60$],
    True([$84$]),
  ),
  loigiai: [
    Đây là bảng $2 times 2$, áp dụng Đại Bác số 4 với $n=2$ cột, $k=4$ màu.
    - Cột 1 có: $k(k-1) = 4 dot 3 = 12$ cách.
    - Cột 2 có hệ số truyền: $k^2-3k+3 = 16-12+3 = 7$ cách.
    
    Vậy số cách tô là $N = 12 dot 7 = 84.$
    
    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(2) {
          rect((i*1.2, 0), (i*1.2 + 1, 1), fill: rgb("E3F2FD"), stroke: 1.5pt + c-slate)
          rect((i*1.2, 1), (i*1.2 + 1, 2), fill: rgb("FFF9C4"), stroke: 1.5pt + c-slate)
        }
        content((0.5, 1.5), text(weight: "bold")[Cột 1])
        content((1.7, 1.5), text(weight: "bold")[Cột 2])
        content((0.5, 0.5), text(weight: "bold")[12])
        content((1.7, 0.5), text(weight: "bold")[7])
        content((1.1, -0.4), text(size: 8.5pt, weight: "bold")[Tổng: 84 cách])
        line((0.8, 1.0), (1.4, 1.0), stroke: 1.5pt + c-amber, mark: (end: "stealth", size: 0.15))
      })
    ]
  ]
)

#v(0.5em)

#tn(
  [Một bảng $2 times 4$ ô được tô màu bằng $3$ màu. Hai ô kề cạnh nhau
    phải khác màu. Số cách tô là:],
  (
    [$108$],
    [$126$],
    True([$162$]),
    [$216$],
  ),
  loigiai: [
    Đây là bảng $2 times n$ với $n=4$, $k=3$.
    Áp dụng công thức
    $N_(2 times n) = k(k-1)(k^2-3k+3)^(n-1).$
    Ta có
    $N = 3 dot 2 dot (9-9+3)^3 = 6 dot 27 = 162.$
    Vậy số cách tô là $162$.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(4) {
          rect((i*1.2, 0), (i*1.2 + 1, 1), fill: white, stroke: 1.5pt + c-slate)
          rect((i*1.2, 1), (i*1.2 + 1, 2), fill: white, stroke: 1.5pt + c-slate)
        }
        content((0.5, 1.5), text(weight: "bold", fill: c-teal)[$3 dot 2$])
        content((1.7, 1.5), text(weight: "bold", fill: c-amber)[$times 3$])
        content((2.9, 1.5), text(weight: "bold", fill: c-amber)[$times 3$])
        content((4.1, 1.5), text(weight: "bold", fill: c-amber)[$times 3$])
        content((2.3, -0.5), text(size: 9pt, weight: "bold")[Bảng $2 times 4$])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Một mặt tiền nhà gồm $2$ tầng, mỗi tầng $3$ cửa sổ (xếp thành bảng $2 times 3$).
    Sơn mỗi cửa sổ một màu trong $4$ màu; cửa sổ kề cạnh nhau phải khác màu.
    Số cách sơn là:],
  (
    [$240$],
    True([$588$]),
    [$432$],
    [$504$],
  ),
  loigiai: [
    Đây là bảng $2 times 3$, nên ta dùng công thức của dạng bảng $2 times n$.

    Với $k=4$, ta có
    $k^2 - 3k + 3 = 16 - 12 + 3 = 7.$

    Vì $n=3$, số cách tô là
    $N = k(k-1)(k^2-3k+3)^(n-1) = 4 dot 3 dot 7^2.$

    Tính ra
    $N = 12 dot 49 = 588.$

    Vậy số cách sơn là $588$.
  ],
)

#v(0.5em)

#tln(
  id: "CB-LOCKER",
  [Tại khu trưng bày bảo tàng, người thiết kế đặt một hệ tủ kính gồm $2$ tầng, mỗi tầng chia $4$ khoang đều nhau (như lưới $2 times 4$). Ban tổ chức setup thảm lót cho mỗi khoang dùng $1$ trong $3$ màu (Đỏ, Vàng, Xanh dương). Quy định là hai khoang kề cạnh (điểm chung trên biên) không được trải thảm cùng màu. Hỏi có bao nhiêu cách bố trí thảm?],
  [$162$],
  loigiai: [
    Hệ tủ này chính là mô hình bảng nới theo cột dạng lưới hình chữ nhật $2 times n$. Ta quét theo từng khối cột đứng.

    Sử dụng vũ khí đại bác 4 với $n=4, k=3$. Thay vào nhánh lưới:
    $N = k(k-1)(k^2-3k+3)^(n-1).$

    Hệ số nhân nhóm là $k^2-3k+3 = 9 - 9 + 3 = 3$.
    Nên số cách kết hợp setup là:
    $N = 3 dot 2 dot 3^3 = 6 dot 27 = 162$.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(4) {
          rect((i * 1.5, 0), (i * 1.5 + 1.2, 0.8), fill: rgb("FFEBEE"), stroke: 1.5pt + c-slate)
          rect((i * 1.5, 0.8), (i * 1.5 + 1.2, 1.6), fill: rgb("E3F2FD"), stroke: 1.5pt + c-slate)
          content((i * 1.5 + 0.6, 0.4), text(size: 8pt)[K#i T1])
          content((i * 1.5 + 0.6, 1.2), text(size: 8pt)[K#i T2])
        }
        line((1.5, 2.0), (1.5, 2.4), mark: (end: "stealth", size: 0.15), stroke: 1pt + c-amber)
        content((1.5, 2.65), text(size: 8.5pt, weight: "bold", fill: c-amber)[Cột kề truyền hệ số 3])
      })
    ]
  ],
)

#v(0.5em)

== Đại Bác 5 🚩 — Cờ và Băng Màu Phân Vùng

#recognize-box("Đại Bác 5 — Bắn Vào Cờ, Logo, Bảng Hiệu")[
  *Vỏ bọc hay gặp:* "thiết kế lá cờ $n$ dải", "tô màu $n$ băng song song",
  "phân chia bảng hiệu thành $n$ vùng dọc/ngang", "logo chia mảng", "poster nhiều panel".

  *Cú bắn chuẩn:* trước hết hỏi xem các vùng có thật sự xếp tuyến tính không.
  - nếu là các dải song song đơn giản → quay về đại bác hàng thẳng;
  - nếu là các mảng hình học kề nhau phức tạp → lập đồ thị đối ngẫu mini rồi tính như đồ thị.

  *Biến thể phổ thông hay nấp:* cờ nhiều dải, áo đấu chia mảng, menu nhiều vùng, bảng quảng cáo cắt ô, mặt tiền chia panel.

  *Bẫy cuối:* hai vùng chỉ chạm nhau ở *một điểm* thì chưa chắc được xem là kề. Phải đọc đúng chữ "chung cạnh" hay "chung đoạn biên".
]

#tn(
  [Thiết kế lá cờ gồm $5$ dải dọc song song, mỗi dải một màu trong $4$ màu.
    Hai dải liền kề không được cùng màu. Số thiết kế là:],
  (
    [$4 dot 3^3 = 108$],
    True([$4 dot 3^4 = 324$]),
    [$3^5 = 243$],
    [$4^5 = 1024$],
  ),
  loigiai: [
    Lá cờ có $5$ dải dọc song song, nên cấu trúc ẩn là một hàng thẳng gồm $5$ ô.

    - Dải đầu tiên có $4$ cách chọn màu.
    - Mỗi dải tiếp theo phải khác dải sát bên, nên có $3$ cách.

    Do đó
    $N = 4 dot 3^4 = 4 dot 81 = 324.$

    Vậy có $324$ thiết kế.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        for i in range(5) {
          rect((i, 0), (i + 1, 3), fill: rgb("F5F5F5"), stroke: 1.5pt + c-navy)
          let v = if i == 0 { "4" } else { "3" }
          content((i + 0.5, 1.5), text(weight: "bold")[#v])
        }
        content((2.5, -0.5), text(size: 9pt, weight: "bold")[Cờ 5 dải])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Một lá cờ hình chữ nhật chia thành $4$ tam giác bởi $2$ đường chéo.
    Gọi $4$ tam giác là Bắc ($B$), Đông ($Đ$), Nam ($N$), Tây ($T$).
    Cạnh kề: $B$–$Đ$, $Đ$–$N$, $N$–$T$, $T$–$B$ (cùng chung một cạnh biên).
    Có $3$ màu; hai vùng kề phải khác màu. Số cách tô là:],
  (
    [$12$],
    [$15$],
    True([$18$]),
    [$24$],
  ),
  loigiai: [
    Ta không tô trực tiếp theo hình học, mà đổi sang đồ thị đối ngẫu.

    Bốn tam giác $B, Đ, N, T$ chỉ kề nhau theo chu trình
    $B$–$Đ$–$N$–$T$–$B$,
    nên đồ thị đối ngẫu là vòng $C_4$.

    Do đó số cách tô là
    $P(C_4, 3) = 3 dot 2 dot 3 = 18.$

    Vậy có $18$ cách tô.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *

        // Left: Flag divided into 4 triangles
        let x_flag = 0
        rect((x_flag - 2, -1.2), (x_flag + 2, 1.2), stroke: 1.5pt + c-slate)
        line((x_flag - 2, -1.2), (x_flag + 2, 1.2), stroke: 1.2pt + c-slate)
        line((x_flag - 2, 1.2), (x_flag + 2, -1.2), stroke: 1.2pt + c-slate)

        content((x_flag, 0.6), text(weight: "bold")[B])
        content((x_flag + 1.1, 0), text(weight: "bold")[Đ])
        content((x_flag, -0.6), text(weight: "bold")[N])
        content((x_flag - 1.1, 0), text(weight: "bold")[T])
        content((x_flag, -1.7), text(size: 8.5pt, weight: "bold")[Lá cờ chia 4 phần])

        // Right: Dual graph
        let x_dual = 5
        let r = 1.0
        let pB = (x_dual, r)
        let pD = (x_dual + r, 0)
        let pN = (x_dual, -r)
        let pT = (x_dual - r, 0)

        line(pB, pD, pN, pT, pB, stroke: 1.5pt + c-teal)

        circle(pB, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
        circle(pD, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
        circle(pN, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
        circle(pT, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)

        content(pB, text(size: 8.5pt, weight: "bold")[B])
        content(pD, text(size: 8.5pt, weight: "bold")[Đ])
        content(pN, text(size: 8.5pt, weight: "bold")[N])
        content(pT, text(size: 8.5pt, weight: "bold")[T])

        content((x_dual, -1.7), text(size: 8.5pt, weight: "bold")[Đồ thị đối ngẫu $C_4$])

        // Arrow from flag to dual
        line((x_flag + 2.3, 0), (x_dual - 1.5, 0), mark: (end: "stealth", size: 0.15), stroke: 1pt + c-slate)
        content((x_flag + 3.1, 0.3), text(size: 7.5pt, style: "italic")[Đối ngẫu])
      })
    ]
  ],
)

#v(0.5em)

#tln(
  id: "CB-SHIELD",
  [Một huy chương vàng của hiệp hội được chế tác dạng chiếc khiên, chia làm $5$ phân khu bởi hai vành chéo chữ "X" và viền bao quanh. Sơ đồ vùng kề nhau ở đó tạo thành cấu trúc vòng khép kín. Người ta có $4$ loại men màu để phủ ngập lên đó bằng phương pháp châm men. Giới hạn vật lí buộc các phân khu tiếp giáp mặt biên phải được châm khác chất men. Tổng số thiết kế màu là bao nhiêu? *(Điền số nguyên)*],
  [$240$],
  loigiai: [
    Mặc dù bề mặt hình khiên rất rối, bài toán đã ngầm cho biết cấu trúc kề nhau uốn cong thành đúng vòng một biên $C_5$, đây là dạng bắn tỉa đối ngẫu của Đại Bác 5 & 7.

    Khi đưa về $C_n$ thì mọi thứ nhẹ tựa lông hồng nhờ Đại Bác số 3 (Công thức vòng):
    $P(C_n, k) = (k-1)^n + (-1)^n (k-1).$

    Vào thực chiến với $n=5, k=4$:
    $N = (4-1)^5 + (-1)^5(4-1) = 3^5 - 3 = 243 - 3 = 240.$

    Hiệp hội có $240$ mẫu khiên.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.2
        for i in range(5) {
          let a1 = i * 72deg + 90deg
          let a2 = (i + 1) * 72deg + 90deg
          let p1 = (calc.cos(a1) * r, calc.sin(a1) * r)
          let p2 = (calc.cos(a2) * r, calc.sin(a2) * r)
          line(p1, p2, stroke: 1.5pt + c-slate)
        }
        for i in range(5) {
          let a = i * 72deg + 90deg
          let p = (calc.cos(a) * r, calc.sin(a) * r)
          circle(p, radius: 0.25, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
          content(p, text(size: 7.5pt)[V#(i + 1)])
        }
        content((0, -1.8), text(size: 8.5pt, style: "italic")[Đối ngẫu 5 mảng $C_5$])
      })
    ]
  ],
)

#pagebreak()

== Đại Bác 6 📅 — Lịch Học, Phân Ca, Phân Nhóm Không Chồng Lấp

#recognize-box("Đại Bác 6 — Kéo Về Đồ Thị Xung Đột")[
  *Vỏ bọc hay gặp:* "xếp lịch $n$ môn vào $k$ buổi; nhóm học cả hai môn...",
  "phân $n$ nhân viên vào $k$ ca; một số cặp có xung đột...",
  "chia $n$ vật/người vào $k$ nhóm; một số cặp không được cùng nhóm".

  *Cú bắn chuẩn:* không quan tâm tên môn hay tên người, chỉ quan tâm *cặp nào không được đứng chung*.
  + Mỗi môn/người/vật → một đỉnh.
  + Mỗi cặp xung đột → một cạnh.
  + Màu = buổi/ca/nhóm.

  *Biến thể phổ thông hay nấp:* phòng thi, chia lớp, phân ca trực, xếp đội, phân khu vực làm việc, lịch hội thảo.

  *Bẫy cuối:* nhiều đề rất dài nhưng đồ thị sau cùng chỉ là $P_n$, $C_n$, $K_3$, sao, hoặc vài cụm rời nhau. Đừng sợ câu chữ, hãy vẽ xung đột trước.
]

#example-box(n: "6 — Lịch 4 Môn")[
  *Đề:* Có $4$ môn $A, B, C, D$. Xếp vào $3$ buổi. Các cặp cùng nhóm học:
  nhóm $alpha$: $\{A,B\}$; nhóm $beta$: $\{B,C\}$; nhóm $gamma$: $\{C,D\}$; nhóm $delta$: $\{A,D\}$.

  *Đồ thị xung đột:* cạnh $A$–$B$, $B$–$C$, $C$–$D$, $A$–$D$ → vòng $C_4$.

  *Số lịch:* $P(C_4, 3) = 18.$

  #v(0.4em)
  #align(center)[
    #cetz.canvas(length: 1.35cm, {
      import cetz.draw: *

      let pA = (0, 1.0)
      let pB = (1.2, 0)
      let pC = (0, -1.0)
      let pD = (-1.2, 0)

      line(pA, pB, pC, pD, pA, stroke: 1.5pt + c-teal)
      circle(pA, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
      circle(pB, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
      circle(pC, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
      circle(pD, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)

      content(pA, text(size: 8.5pt, weight: "bold")[A])
      content(pB, text(size: 8.5pt, weight: "bold")[B])
      content(pC, text(size: 8.5pt, weight: "bold")[C])
      content(pD, text(size: 8.5pt, weight: "bold")[D])
      content((0, -1.55), text(size: 8.5pt, weight: "bold")[Đồ thị xung đột là vòng $C_4$])
    })
  ]
]

#v(0.5em)

#tn(
  [Có $5$ môn học $A, B, C, D, E$. Các nhóm học sinh:
    nhóm 1: $\{A,B\}$; nhóm 2: $\{B,C\}$; nhóm 3: $\{C,D\}$;
    nhóm 4: $\{D,E\}$; nhóm 5: $\{A,E\}$.
    Xếp $5$ môn vào $3$ buổi sao cho không nhóm nào có $2$ môn cùng buổi.
    Số cách xếp lịch là:],
  (
    [$20$],
    [$24$],
    True([$30$]),
    [$36$],
  ),
  loigiai: [
    Vẽ đồ thị xung đột, ta được các cạnh
    $A$–$B$, $B$–$C$, $C$–$D$, $D$–$E$, $A$–$E$,
    tức là đúng một vòng $C_5$.

    Vì có $3$ buổi nên ta cần tính $P(C_5, 3)$:
    $P(C_5, 3) = (3-1)^5 + (-1)^5(3-1) = 32-2 = 30.$

    Vậy số cách xếp lịch là $30$.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let pts = ( (0,1.5), (1.4, 0.4), (0.9, -1.2), (-0.9, -1.2), (-1.4, 0.4) )
        let labels = ("A", "B", "C", "D", "E")
        for i in range(5) {
           line(pts.at(i), pts.at(calc.rem(i+1, 5)), stroke: 1.5pt + c-teal)
        }
        for i in range(5) {
           circle(pts.at(i), radius: 0.3, fill: white, stroke: 1.5pt + c-teal)
           content(pts.at(i), text(weight: "bold")[#labels.at(i)])
        }
        content((0, -2), text(size: 9pt, weight: "bold")[Đồ thị $C_5$])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Ba học sinh $X, Y, Z$ không được cùng nhóm; hai học sinh $P, Q$ không được cùng nhóm.
    Chia $5$ học sinh vào $3$ nhóm (mỗi học sinh thuộc đúng một nhóm).
    Số cách chia là:],
  (
    [$12$],
    [$18$],
    [$24$],
    True([$36$]),
  ),
  loigiai: [
    Đồ thị xung đột: $X$–$Y$, $Y$–$Z$, $X$–$Z$ (tam giác $K_3$) và $P$–$Q$.
    Hai thành phần độc lập: $K_3$ và cạnh $P$–$Q$ ($= K_2$).
    $P(K_3, 3) = 3 dot 2 dot 1 = 6.$
    $P(K_2, 3) = 3 dot 2 = 6.$
    Vì hai thành phần độc lập nên
    $N = P(K_3, 3) dot P(K_2, 3) = 6 dot 6 = 36.$
  ],
)

#v(0.5em)

#tln(
  id: "CB-MEDIC",
  [Tại trung tâm điều phối y tế, có một ca trưởng và $4$ điều dưỡng chuyên môn siêu việt. Tuy nhiên, tính cách làm việc của ca trưởng lại quá mạnh nên không có điều dưỡng nào có thể trực chung ca với vị này. Ngược lại, $4$ điều dưỡng kia phối hợp rất gắn kết và không hề xung đột lẫn nhau. Để điều phối vào $3$ ca trực chính trong ngày, mỗi người được chia vào một ca độc lập (có thể nằm chung nếu không xung đột). Tính số cách xếp y tế khả dĩ.],
  [$48$],
  loigiai: [
    Không cần quan tâm ai tên gì, ta bám vào lưới chằng chịt của Đại Bác 6. Khi phác họa đồ thị xung đột, vị ca trưởng (ở tâm) bị gạch mặt (tạo nét xung đột cạnh) với cả $4$ điều dưỡng vòng ngoài. Bốn người kia không bị nối với nhau cạnh nào. Đây chính là một ngôi sao $K_{1,4}$.

    - Vị trí chốt tâm (ca trưởng) có quyền càn quét trước với đủ $3$ cách chọn ca để xếp.
    - Cả $4$ đỉnh góc ngoài sau khi tâm bị khoá thì độc lập chọn ca, mỗi chóp chỉ cần né đúng ca của trung tâm. Vậy mỗi điều dưỡng có $3-1 = 2$ cách lựa.

    Đâm thẳng nhát chốt quy tắc nhân:
    $N = 3 dot 2^4 = 3 dot 16 = 48.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let c_pt = (0, 0)
        let pts = ((1, 1), (1, -1), (-1, -1), (-1, 1))
        for p in pts {
          line(c_pt, p, stroke: 1.2pt + c-teal)
          circle(p, radius: 0.25, fill: rgb("E3F2FD"), stroke: 1.2pt + c-navy)
        }
        circle(c_pt, radius: 0.25, fill: rgb("FFCDD2"), stroke: 1.5pt + c-amber)
        content(c_pt, text(size: 8pt)[C])
        content((0, -1.6), text(size: 8.5pt, weight: "bold", fill: c-navy)[Xung đột sao $K_(1,4)$])
      })
    ]
  ],
)

#v(0.5em)

== Đại Bác 7 🗺️ — Tô Màu Hình Phẳng và Bản Đồ

#recognize-box("Đại Bác 7 — Vẽ Đối Ngẫu Hình Phẳng")[
  *Vỏ bọc hay gặp:* "tô màu các vùng của bản đồ", "tô màu $n$ vùng của hình phẳng",
  "tam giác / tứ giác / lục giác chia thành nhiều phần", "phân ô ruộng", "bản vẽ chia khu".

  *Cú bắn chuẩn:* đừng tính trực tiếp trên hình.
  + Mỗi *vùng* → một đỉnh.
  + Hai đỉnh nối cạnh khi hai vùng có *chung đoạn biên*.
  + Sau đó tính $P(G_"đối ngẫu", k)$ như một bài tô màu đồ thị bình thường.

  *Biến thể phổ thông hay nấp:* bản đồ, mô hình ruộng đất, mặt gạch chia mảng, hình ghép tam giác, khu dân cư chia lô.

  *Bẫy cuối:* hai vùng chỉ chạm ở *một điểm* thì không nối cạnh. Đây là lỗi sai rất phổ biến khi vẽ đối ngẫu.
]

#tn(
  [Một tam giác lớn chia thành $4$ tam giác nhỏ bằng cách nối trung điểm
    các cạnh: tam giác Trên ($T$), Trái ($L$), Phải ($R$), Giữa ($M$).
    $M$ kề $T$, $L$, $R$; còn $T$, $L$, $R$ không kề nhau.
    Có $3$ màu; hai vùng kề phải khác màu. Số cách tô là:],
  (
    [$18$],
    True([$24$]),
    [$30$],
    [$36$],
  ),
  loigiai: [
    Vì vùng giữa $M$ kề với cả $T,L,R$, còn $T,L,R$ không kề nhau, đồ thị đối ngẫu là sao $K_{1,3}$.

    - Vùng giữa $M$ có $3$ cách chọn màu.
    - Mỗi vùng lá $T,L,R$ chỉ cần khác màu với $M$, nên mỗi vùng có $2$ cách.

    Do đó
    $P(K_{1,3}, 3) = 3 dot 2^3 = 24.$

    Vậy có $24$ cách tô.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *

        // Left: Triangle division
        let x_tri = 0
        let pA = (x_tri, 1.6)
        let pB = (x_tri - 1.6, -0.8)
        let pC = (x_tri + 1.6, -0.8)
        let pAB = (x_tri - 0.8, 0.4)
        let pBC = (x_tri, -0.8)
        let pAC = (x_tri + 0.8, 0.4)

        // Draw outer triangle and inner divisions
        line(pA, pB, pC, pA, stroke: 1.5pt + c-slate)
        line(pAB, pBC, pAC, pAB, stroke: 1.2pt + c-slate)

        content((x_tri, 0.8), text(weight: "bold")[T])
        content((x_tri - 0.7, -0.4), text(weight: "bold")[L])
        content((x_tri + 0.7, -0.4), text(weight: "bold")[R])
        content((x_tri, -0.1), text(weight: "bold")[M])
        content((x_tri, -1.4), text(size: 8.5pt, weight: "bold")[Tam giác chia 4 phần])

        // Right: Dual graph (star graph K_{1,3})
        let x_dual = 5
        let pM_d = (x_dual, 0)
        let pT_d = (x_dual, 1.2)
        let pL_d = (x_dual - 1.0, -0.6)
        let pR_d = (x_dual + 1.0, -0.6)

        line(pM_d, pT_d, stroke: 1.5pt + c-teal)
        line(pM_d, pL_d, stroke: 1.5pt + c-teal)
        line(pM_d, pR_d, stroke: 1.5pt + c-teal)

        circle(pM_d, radius: 0.22, fill: rgb("E0F2F1"), stroke: 1.2pt + c-teal)
        circle(pT_d, radius: 0.22, fill: rgb("E3F2FD"), stroke: 1.2pt + c-teal)
        circle(pL_d, radius: 0.22, fill: rgb("E3F2FD"), stroke: 1.2pt + c-teal)
        circle(pR_d, radius: 0.22, fill: rgb("E3F2FD"), stroke: 1.2pt + c-teal)

        content(pM_d, text(size: 8.5pt, weight: "bold")[M])
        content(pT_d, text(size: 8.5pt, weight: "bold")[T])
        content(pL_d, text(size: 8.5pt, weight: "bold")[L])
        content(pR_d, text(size: 8.5pt, weight: "bold")[R])

        content((x_dual, -1.4), text(size: 8.5pt, weight: "bold")[Đồ thị đối ngẫu $K_(1,3)$])

        // Arrow
        line((x_tri + 1.9, 0), (x_dual - 1.5, 0), mark: (end: "stealth", size: 0.15), stroke: 1pt + c-slate)
        content((x_tri + 2.7, 0.3), text(size: 7.5pt, style: "italic")[Đối ngẫu])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Lục giác đều chia thành $6$ tam giác đều bởi $3$ đường chéo chính.
    Tô mỗi tam giác một màu trong $4$ màu; hai tam giác kề cạnh nhau phải khác màu.
    *(Đồ thị đối ngẫu là vòng $C_6$.)*
    Số cách tô là:],
  (
    [$4 dot 3^5 = 972$],
    [$700$],
    True([$732$]),
    [$756$],
  ),
  loigiai: [
    Đề đã gợi ý rõ đồ thị đối ngẫu là vòng $C_6$.

    Vì có $4$ màu, ta tính
    $P(C_6, 4) = (4-1)^6 + (-1)^6(4-1).$

    Suy ra
    $P(C_6, 4) = 3^6 + 3 = 729 + 3 = 732.$

    Vậy số cách tô là $732$.
  ],
)

#v(0.5em)

#tln(
  id: "CB-CITY",
  [Tại khu đô thị ven sông, một văn phòng kiến trúc quy hoạch một quảng trường trung tâm hình khuyên và chỉa ra rẻ quạt $5$ khu phố bám xung quanh khối quảng trường này. Hệ thống thảm thực vật $6$ phân khu này được đấu thầu phủ màu rực rỡ dùng $4$ giống cỏ màu khác biệt. Nếu các khu vực có chung đoạn biên đất tiếp xúc thì cấm dùng cùng loại hạt giống, hỏi mô hình đô thị có bao nhiêu phương án phối màu họa bì? *(Điền số nguyên)*],
  [$120$],
  loigiai: [
    Cấu trúc không gian của bản đồ quy hoạch này chính là một bánh xe (quảng trường giữa bao bởi 5 khu xung quanh).
    Gỡ ra cho hết bụi đất, đồ thị đối ngẫu chính là Bánh xe $W_6$ gồm 1 đỉnh tâm kề với mâm vòng viền ngoài $C_5$.

    Để phủ màu công phá $W_6$, ta bắn tỉa ngòi nổ trung tâm trước:
    - Đỉnh trung tâm nằm lõi kề mọi đỉnh ngoài, nên ta ưu tiên chọn và khoá nó trước: Có $4$ cách chèn cỏ cho quảng trường.
    - Một khi "hạt nhân" đã được ghim 1 màu, vành $5$ khu phố bên ngoài mất quyền dùng màu đó nữa. Bộ vành chuyển ngay thành Đại Bác 3 (vòng tròn $C_5$) đánh với số màu co lại $4 - 1 = 3$ màu còn lại.

    Tô vòng $C_5$ bằng $3$ màu:
    $N_"vành" = (3-1)^5 + (-1)^5(3-1) = 32 - 2 = 30.$

    Tổng số cấu hình phối cảnh toàn dự án là hệ quả quy tắc nhân:
    $N = 4 dot 30 = 120.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.3
        let c_pt = (0, 0)
        for i in range(5) {
          let a1 = i * 72deg
          let a2 = (i + 1) * 72deg
          let p1 = (calc.cos(a1) * r, calc.sin(a1) * r)
          let p2 = (calc.cos(a2) * r, calc.sin(a2) * r)
          line(p1, p2, stroke: 1.2pt + c-slate)
          line(c_pt, p1, stroke: 1.2pt + c-slate)
        }
        circle(c_pt, radius: 0.25, fill: rgb("FFCDD2"), stroke: 1.2pt + c-slate)
        for i in range(5) {
          let a = i * 72deg
          let p = (calc.cos(a) * r, calc.sin(a) * r)
          circle(p, radius: 0.2, fill: rgb("E0F2F1"), stroke: 1pt + c-slate)
        }
        content((0, -1.8), text(size: 8.5pt, weight: "bold", fill: c-navy)[Đồ thị đối ngẫu Bánh Xe $W_6$])
      })
    ]
  ],
)

#pagebreak()

== Đại Bác 8 💎 — Vòng Hoa và Chuỗi Hạt (Burnside)

#recognize-box("Đại Bác 8 — Burnside Quét Đối Xứng")[
  *Vỏ bọc hay gặp:* "xâu $n$ hạt thành vòng; hai vòng coi là giống nhau nếu xoay được",
  "thiết kế vòng cườm $n$ màu; không phân biệt các vòng quay bằng nhau",
  "xếp $n$ đồ vật trên bàn tròn; hai cách xếp giống nếu xoay được/lật được".

  *Cú bắn chuẩn:* không đếm trực tiếp số cấu hình nữa, mà lấy *trung bình số cấu hình bất biến* theo từng phép đối xứng.

  *Công thức:*
  $ "Số phân biệt" = frac(1, |G|) sum_(g in G) |X^g| $
  trong đó $|X^g| = k^(c(g))$, $c(g)$ = số chu trình của phép đối xứng $g$.

  *Biến thể phổ thông hay nấp:* vòng hoa, vòng khăn ăn, chuỗi hạt, họa tiết tròn, logo quay, mô hình quanh bàn tròn.

  *Bẫy cuối:* nếu vị trí là cố định thì quay lại Đại Bác 3. Burnside chỉ xuất hiện khi đề thật sự nói "coi như nhau nếu xoay/lật".

  *Phân loại:*
  #table(
    columns: (2fr, 1.5fr, 1.5fr),
    stroke: 0.5pt + rgb("80CBC4"),
    fill: (x, y) => if y == 0 { c-teal } else if calc.odd(y) { rgb("E0F2F1") } else { white },
    inset: (x: 9pt, y: 7pt),
    align: (left, center, center),
    table.header(
      text(fill: white, weight: "bold")[Điều kiện],
      text(fill: white, weight: "bold")[Nhóm],
      text(fill: white, weight: "bold")[$|G|$],
    ),
    [Giống nếu xoay], [Nhóm xoay $C_n$], [$n$],
    [Giống nếu xoay hoặc lật], [Nhóm dihedral $D_n$], [$2n$],
  )
]

#route-box(title: "🧭 Burnside Nên Làm Theo 3 Bước")[
  - *Bước 1:* Xác định nhóm đối xứng đang dùng: chỉ xoay ($C_n$) hay xoay và lật ($D_n$).
  - *Bước 2:* Với từng phép đối xứng $g$, đếm số cấu hình không đổi dưới $g$ bằng cách đếm số chu trình $c(g)$.
  - *Bước 3:* Cộng tất cả các số đó rồi chia cho $|G|$.

  Mấu chốt không phải là nhớ thuộc lòng ký hiệu, mà là hiểu câu:
  *"Muốn một cấu hình đứng yên sau phép đối xứng $g$, mọi vị trí nằm trong cùng một chu trình phải nhận cùng màu."*
]

#example-box(n: "8 — Vòng 4 Hạt, 2 Màu, Chỉ Xoay")[
  Nhóm $C_4$: $r^0, r^1, r^2, r^3$.
  #table(
    columns: (auto, auto, auto, auto),
    stroke: 0.4pt + c-slate,
    fill: (x, y) => if y == 0 { c-teal } else if calc.odd(y) { rgb("E0F2F1") } else { white },
    inset: (x: 8pt, y: 6pt),
    align: center,
    table.header(
      text(fill: white, weight: "bold")[Phép xoay],
      text(fill: white, weight: "bold")[Chu trình],
      text(fill: white, weight: "bold")[$c(g)$],
      text(fill: white, weight: "bold")[$|X^g| = 2^(c(g))$],
    ),
    [$r^0$], [$(1)(2)(3)(4)$], [$4$], [$16$],
    [$r^1$ ($90°$)], [$(1234)$], [$1$], [$2$],
    [$r^2$ ($180°$)], [$(13)(24)$], [$2$], [$4$],
    [$r^3$ ($270°$)], [$(1432)$], [$1$], [$2$],
  )
  $"Số phân biệt" = display((16+2+4+2)/4 = 24/4 = 6).$
]

#v(0.5em)

#tn(
  [Xâu $5$ hạt cườm gồm $3$ màu thành vòng (không ràng buộc kề).
    Hai vòng coi là giống nhau nếu *xoay* được cái này thành cái kia.
    Số vòng cườm phân biệt là:],
  (
    [$39$],
    [$45$],
    True([$51$]),
    [$57$],
  ),
  loigiai: [
    Ta dùng Burnside với nhóm xoay $C_5$ nên có $5$ phép đối xứng.

    - Phép đồng nhất $r^0$ giữ nguyên mọi cấu hình: $|X^{r^0}| = 3^5 = 243$.
    - Mỗi phép xoay khác đồng nhất gom cả $5$ vị trí vào cùng một chu trình,
      nên cấu hình đứng yên chỉ có dạng "cả 5 hạt cùng màu": $|X^{r^j}| = 3$.

    Vì có $4$ phép như vậy, số vòng phân biệt là
    $"Số phân biệt" = (243 + 4 dot 3)/5 = 255/5 = 51.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.3
        for i in range(5) {
          let a = i * 72deg + 90deg
          circle((calc.cos(a)*r, calc.sin(a)*r), radius: 0.25, fill: white, stroke: 1.5pt + rgb("6A1B9A"))
          let a_next = (i+1) * 72deg + 90deg
          line((calc.cos(a)*r, calc.sin(a)*r), (calc.cos(a_next)*r, calc.sin(a_next)*r), stroke: 1.2pt + c-slate)
        }
        arc((0,0), radius: 0.6, start: 45deg, stop: 315deg, mark: (end: "stealth"), stroke: 1.5pt + c-amber)
        content((0, 0), text(size: 8pt, weight: "bold")[Xoay $C_5$])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Xâu $6$ hạt cườm gồm $2$ màu thành vòng. Hai vòng coi là giống nhau nếu
    *xoay hoặc lật* được cái này thành cái kia (nhóm dihedral $D_6$, $|D_6| = 12$).
    Số vòng phân biệt là:],
  (
    [$9$],
    [$10$],
    True([$14$]),
    [$13$],
  ),
  loigiai: [
    Ta dùng Burnside với nhóm $D_6$, nên phải xét $12$ phép đối xứng.

    *Phần xoay:*
    $r^0$: $c=6$ → $64$;
    $r^1,r^5$: $c=1$ → $2$ mỗi cái;
    $r^2,r^4$: $c=2$ → $4$ mỗi cái;
    $r^3$: $c=3$ → $8$.

    *Phần lật:*
    - $3$ trục qua hai đỉnh đối diện: mỗi phép có $4$ chu trình → $2^4=16$ cách cố định.
    - $3$ trục qua trung điểm hai cạnh đối diện: mỗi phép có $3$ chu trình → $2^3=8$ cách cố định.

    Tổng số cấu hình cố định là
    $64+2+4+4+2+8 + 3 dot 16 + 3 dot 8 = 168$.
    Chia cho $|D_6| = 12$, ta được $168/12 = 14$.
    Vậy có $14$ vòng phân biệt.
  ],
)

#v(0.5em)

#tln(
  id: "CB-BURNSIDE",
  [Một xưởng gia công đá quý ký hợp đồng chế tác dây chuyền kỉ niệm. Khung kẹp vòng khép định sẵn $6$ khuôn chốt dập móng để đính ngọc theo hình lục giác đều. Khách hàng yêu cầu rải $3$ loại đá quý (mã não, hồng ngọc, tử thạch đan) khảm vào mặt chuyền. Lớp lót dưới đáy của khung kẹp là vật liệu trơn phẳng như nhau nên sau khi chốt xong, chiếc vòng lật sấp lật ngửa cởi đeo thoải mái, tức là các cấu hình trùng nhau qua phép xoay hoặc lật khối đều tính là một sản phẩm đồng nhất. Hỏi nghệ nhân vàng có thể trích xuất ra bao nhiêu sản phẩm dây chuyền mang phong cách hoàn toàn khác biệt tung ra hòm tủ? *(Điền số nguyên)*],
  [$92$],
  loigiai: [
    Hiện sinh "xoay và lật tự do" chính thức là phát súng hiệu vẫy gọi Đỉnh Điểm Đại Bác 8: Burnside. Với khung lục giác xoay/lật, ta gọi nhóm đối xứng Dihedral $D_6$ có tổng cộng $|D_6| = 12$ hướng thao tác (6 xoay, 6 lật).
    Đề yêu cầu đính ngọc độc lập, nghĩa là chỉ thả màu vào chứ *không ép buộc 2 hạt kề phải khác loại*. Thế nên $k=3$ giữ vai trò rải tự do chốt khối.

    Đếm hàm lượng bất biến ghim dưới từng phép:
    - *Nhóm $6$ mũi xoay:*
      $r^0$ (đứng im): chu trình $c = 6$, tóm giữ $3^6 = 729$ mẫu.
      $r^1, r^5$ (xoay $1$ viền): gom tất vào chu trình $c = 1$, đóng keo $3^1 dot 2 = 6$ mẫu.
      $r^2, r^4$ (xoay $2$ viền): tách chu trình $c = 2$, đóng keo $3^2 dot 2 = 18$ mẫu.
      $r^3$ (xoay nửa vòng): ngàm vào chu trình $c = 3$, khóa chốt $3^3 = 27$ mẫu.
      *Sum xoay* = $729 + 6 + 18 + 27 = 780$.

    - *Nhóm $6$ mũi lật:*
      3 đòn lật vắt qua $2$ cực đỉnh đối diện: mỗi cái nhặt $4$ chu trình (vì $2$ đầu chốt chặt, $2$ đôi hông đổi nhau), giữ vỏn vẹn $3 dot 3^4 = 3 dot 81 = 243$ mẫu.
      3 đòn lật vắt qua trung điểm $2$ bề cạnh đối xứng: mỗi điểm nhặt $3$ chu trình, ôm bọc $3 dot 3^3 = 3 dot 27 = 81$ mẫu.
      *Sum lật* = $243 + 81 = 324$.

    Dội nổ Burnside trung bình hóa:
    $"Tổng SP" = (780 + 324) / 12 = 1104 / 12 = 92.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.3
        for i in range(6) {
          let a = i * 60deg
          circle((calc.cos(a) * r, calc.sin(a) * r), radius: 0.25, fill: rgb("E1BEE7"), stroke: 1.2pt + c-slate)
        }
        line((-1.8, 0), (1.8, 0), stroke: (dash: "dashed", paint: c-amber, thickness: 1pt))
        line((0, -1.8), (0, 1.8), stroke: (dash: "dashed", paint: c-amber, thickness: 1pt))
        content((2.1, 1.2), text(size: 8.5pt, style: "italic", fill: c-slate)[Trục lật của $D_6$])
      })
    ]
  ],
)

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN IV
// ═══════════════════════════════════════════════
= Phần IV — Bài Tập Kiểm Tra Tổng Hợp

== Nhận Diện Nhanh — Gán Đúng Công Thức

#theory-box[
  #text(fill: c-teal, size: 11pt, weight: "bold")[
    🎯 Bài Tập Nhận Diện
  ]
  #v(0.5em)
  Với mỗi bài toán dưới đây, *trước tiên xác định dạng*, sau đó tính.
  Đây là kỹ năng quan trọng nhất khi thi.
]

#v(0.5em)

#tn(
  [Một chiếc vòng gồm $10$ hạt được xâu thành vòng tròn.
    Mỗi hạt sơn một trong $3$ màu; hai hạt liền kề phải khác màu.
    Vị trí các hạt là CỐ ĐỊNH (không xét phép xoay).
    Số cách sơn là:],
  (
    [$2^{10} = 1024$],
    True([$(3-1)^{10} + (3-1) = 1026$]),
    [$3 dot 2^9 = 1536$],
    [$2^{10} - 2 = 1022$],
  ),
  loigiai: [
    Đây là bài toán vòng tròn cố định với $n=10$ hạt và $k=3$ màu.

    Áp dụng công thức vòng tròn:
    $N = (3-1)^{10} + (-1)^{10}(3-1).$

    Suy ra
    $N = 2^{10} + 2 = 1024 + 2 = 1026.$

    Vậy số cách sơn là $1026$.
  ],
)

#v(0.5em)

#tn(
  [Bảng $2 times 5$ ô được tô bằng $3$ màu, hai ô kề cạnh phải khác màu.
    Số cách tô là:],
  (
    [$6 dot 3^3 = 162$],
    True([$6 dot 3^4 = 486$]),
    [$6 dot 9^4$],
    [$162$],
  ),
  loigiai: [
    Đây là bảng $2 times 5$, nên ta dùng công thức của dạng bảng $2 times n$.

    Với $k=3$ ta có
    $k^2-3k+3 = 9-9+3 = 3.$

    Vì $n=5$, nên
    $N = 3 dot 2 dot 3^4 = 6 dot 81 = 486.$

    Vậy số cách tô là $486$.
  ],
)

#v(0.5em)

#tn(
  [Sáu môn học $A,B,C,D,E,F$ cần xếp vào $3$ phòng thi.
    Đồ thị xung đột (cặp học sinh học chung) tạo thành vòng $C_6$.
    Số cách phân phòng là:],
  (
    [$3^6 + 3 = 732$],
    True([$2^6 + 2 = 66$]),
    [$6 dot 2^5 = 192$],
    [$3 dot 2^5 = 96$],
  ),
  loigiai: [
    Đồ thị xung đột là vòng $C_6$, còn $3$ phòng thi đóng vai trò như $3$ màu.

    Vì vậy ta cần tính
    $P(C_6, 3) = (3-1)^6 + (-1)^6(3-1).$

    Suy ra
    $P(C_6, 3) = 64 + 2 = 66.$

    Vậy số cách phân phòng là $66$.
  ],
)

#v(0.5em)

#tn(
  [Mã màu sản phẩm gồm $4$ ô màu thành vòng tròn, tô bằng $3$ màu.
    Mỗi cặp ô liền kề phải khác màu. Hai mã được coi là giống nhau nếu
    xoay vòng được cái này thành cái kia. Số mã phân biệt là:],
  (
    [$4$],
    True([$6$]),
    [$18$],
    [$3$],
  ),
  loigiai: [
    Vì hai mã chỉ khác nhau do xoay được coi là một, ta dùng Burnside cho nhóm xoay $C_4$.

    Trước hết, số cách tô hợp lệ trên vòng $C_4$ là
    $P(C_4, 3) = 18.$

    Xét từng phép xoay:
    - $r^0$: giữ nguyên mọi cấu hình hợp lệ, nên có $18$ cấu hình cố định.
    - $r^1$ và $r^3$: muốn đứng yên thì cả $4$ ô phải cùng màu, điều này mâu thuẫn với điều kiện kề khác màu, nên được $0$.
    - $r^2$: cấu hình phải có dạng $(a,b,a,b)$ với $a != b$, nên có $3 dot 2 = 6$ cách.

    Vì vậy
    $"Phân biệt" = (18 + 0 + 6 + 0)/4 = 24/4 = 6.$

    Vậy có $6$ mã phân biệt.
  ],
)

#v(1em)

== Bảng Tổng Kết

#align(center)[
  #block(
    fill: rgb("E0F2F1"),
    stroke: 1pt + c-teal,
    radius: 8pt,
    inset: (x: 1.5em, y: 1.2em),
    width: 100%,
  )[
    #text(fill: c-teal, size: 12pt, weight: "bold")[
      📊 Bảng Tra Công Thức Tô Màu
    ]
    #v(0.6em)
    #table(
      columns: (2fr, 2fr, 2fr),
      stroke: 0.5pt + rgb("80CBC4"),
      fill: (x, y) => if y == 0 { c-teal } else if calc.odd(y) { rgb("E0F2F1") } else { white },
      inset: (x: 9pt, y: 7pt),
      align: (left, center, left),
      table.header(
        text(fill: white, weight: "bold")[Cấu hình],
        text(fill: white, weight: "bold")[Công thức $P(G,k)$],
        text(fill: white, weight: "bold")[Ghi chú],
      ),
      [Đường $P_n$ ($n$ đỉnh)], [$k(k-1)^(n-1)$], [Hàng thẳng, cây],
      [Vòng $C_n$], [$(k-1)^n + (-1)^n (k-1)$], [Mọi $n >= 3$],
      [Đầy đủ $K_n$], [$k(k-1) dots (k-n+1)$], [$k >= n$],
      [Sao $K_{1,n}$], [$k(k-1)^n$], [$1$ trung tâm, $n$ lá],
      [Lưới $2 times n$], [$k(k-1)(k^2-3k+3)^(n-1)$], [Bảng 2 hàng],
      [Thành phần rời], [$product P(G_i, k)$], [Nhân độc lập],
      [Tổng quát], [$P(G',k) - P(G'',k)$], [Deletion-Contraction],
      [Đến đối xứng], [$frac(1, |G|) sum_g k^(c(g))$], [Burnside],
    )
    #v(0.5em)
    #text(fill: c-teal, size: 10pt, style: "italic")[
      *Quy tắc vàng:* Vẽ đồ thị → nhận cấu trúc → tra công thức.
    ]
  ]
]
