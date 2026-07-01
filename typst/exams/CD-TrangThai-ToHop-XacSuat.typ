#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.88em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("071E3D"), rgb("0D47A1"), rgb("1565C0"), angle: 135deg),
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
  stroke: (left: 4pt + rgb("0D47A1")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("0D47A1"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("00695C"), size: 11pt, weight: "bold", "▸ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Bảng màu chủ đề ────────────────────────────────────────
#let c-navy = rgb("0D47A1")
#let c-teal = rgb("00695C")
#let c-amber = rgb("BF360C")
#let c-violet = rgb("4A148C")
#let c-green = rgb("1B5E20")
#let c-slate = rgb("37474F")

// ─── Hộp Lý Thuyết ──────────────────────────────────────────
#let theory-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + c-navy, rest: 0.8pt + rgb("90CAF9")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

#let insight-box(title: "💡 Trực Giác", body) = block(
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

#let activity-box(title: "🎓 Hoạt Động Lớp Học", body) = block(
  fill: rgb("FFFDE7"),
  stroke: (left: 4pt + rgb("F9A825"), rest: 0.6pt + rgb("FFF176")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("F57F17"), weight: "bold")[#title]
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

#let step-box(n, title, body) = block(
  fill: white,
  stroke: (left: 4pt + c-navy, rest: 0.5pt + rgb("BBDEFB")),
  radius: (right: 5pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.8em,
    align: (center + top, left + top),
    circle(radius: 10pt, fill: c-navy)[
      #text(fill: white, weight: "bold", size: 11pt)[#n]
    ],
    [
      #text(fill: c-navy, weight: "bold")[#title]
      #v(0.2em)
      #body
    ],
  )
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(
      rgb("050F20"),
      rgb("071E3D"),
      rgb("0D3570"),
      rgb("0D47A1"),
      rgb("1565C0"),
      angle: 150deg,
    ),
    inset: (x: 2.2cm, y: 1.8cm),
    radius: 12pt,
  )[
    #text(fill: rgb("64B5F6"), size: 11pt, weight: "bold")[
      CHUYÊN ĐỀ DÀNH CHO GIÁO VIÊN — TỔ HỢP & XÁC SUẤT THPT
    ]
    #v(0.6em)
    #text(fill: white, size: 26pt, weight: "black")[Tư Duy Trạng Thái]
    #v(0.15em)
    #text(fill: rgb("90CAF9"), size: 15pt, style: "italic")[State Space Thinking]
    #v(0.4em)
    #text(fill: rgb("BBDEFB"), size: 13pt)[
      Thống nhất Tổ Hợp và Xác Suất dưới một Framework duy nhất
    ]
    #v(1.2em)
    #line(length: 55%, stroke: 1pt + rgb("64B5F6"))
    #v(1em)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      align: center,
      row-gutter: 0.3em,
      [#text(fill: rgb("A5D6A7"), size: 22pt)[🌱]],
      [#text(fill: rgb("80CBC4"), size: 22pt)[⚖️]],
      [#text(fill: rgb("81D4FA"), size: 22pt)[🔍]],
      [#text(fill: rgb("FFAB91"), size: 22pt)[⚡]],
      [#text(fill: rgb("CE93D8"), size: 22pt)[📦]],

      [#text(fill: rgb("A5D6A7"), size: 9pt, weight: "bold")[Đếm\ = Sinh]],
      [#text(fill: rgb("80CBC4"), size: 9pt, weight: "bold")[Xác Suất\ = Trọng Số]],
      [#text(fill: rgb("81D4FA"), size: 9pt, weight: "bold")[Điều Kiện\ = Lọc]],
      [#text(fill: rgb("FFAB91"), size: 9pt, weight: "bold")[DP\ = Chuyển]],
      [#text(fill: rgb("CE93D8"), size: 9pt, weight: "bold")[Hàm Sinh\ = Mã Hóa]],
    )
    #v(1em)
    #text(fill: rgb("64B5F6"), size: 9.5pt, style: "italic")[
      "Khi bạn thấy được trạng thái, mọi công thức đều trở thành tất yếu."
    ]
  ]
]

#v(1.2em)

// ═══════════════════════════════════════════════
// MỤC TIÊU & TỔNG QUAN
// ═══════════════════════════════════════════════
= Tổng Quan: Một Framework Cho Toàn Bộ Chương

#theory-box[
  #text(fill: c-navy, size: 11pt, weight: "bold")[
    🎯 Vấn Đề Cốt Lõi: Học Sinh Đang Học Mảnh Rời
  ]
  #v(0.5em)
  Học sinh THPT thường tiếp cận chương Tổ hợp – Xác suất như *nhiều "hòn đảo" công thức riêng biệt*:

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 1em,
    row-gutter: 0.5em,
    [— Quy tắc cộng, nhân], [— Công thức $C_n^k$, $A_n^k$], [— Xác suất cổ điển],
    [— Xác suất có điều kiện], [— Biến cố đối ($overline(A)$)], [— Công thức Bayes],
    [— Truy hồi (đôi khi)], [— DP đếm dãy], [— Hàm sinh (nâng cao)],
  )

  #v(0.6em)
  Nhưng thực ra *tất cả* đều là biểu hiện khác nhau của *một ý tưởng duy nhất*: quản lý *không gian trạng thái*.

  #v(0.5em)
  #align(center)[
    #table(
      columns: (2fr, 1.8fr, 2.2fr),
      stroke: 0.5pt + rgb("90CAF9"),
      fill: (x, y) => if y == 0 { c-navy } else if calc.odd(y) { rgb("E3F2FD") } else { white },
      inset: (x: 10pt, y: 8pt),
      align: (left, center, left),
      table.header(
        text(fill: white, weight: "bold")[Khái niệm],
        text(fill: white, weight: "bold")[Ngôn ngữ cũ],
        text(fill: white, weight: "bold")[Góc nhìn trạng thái],
      ),
      [Đếm số cách], [Học thuộc CT $C_n^k$], [Sinh & đếm trạng thái],
      [Tính xác suất], [Đếm kết quả / Tổng], [Gán trọng số cho trạng thái],
      [Xác suất có điều kiện], [Công thức $P(A|B)$], [Lọc bớt trạng thái],
      [Biến cố đối], [$P(overline(A)) = 1 - P(A)$], [Lấy phần bù trạng thái],
      [Truy hồi / DP], [Đặt $u_n$, giải hệ], [Chuyển trạng thái],
      [Hàm sinh], [Hệ số đa thức], [Mã hóa toàn bộ trạng thái],
    )
  ]
]

#v(0.8em)
// ─── Sơ đồ tổng quan 5 trụ cột ──────────────────────────────
#align(center)[
  #cetz.canvas(length: 1.05cm, {
    import cetz.draw: *

    // Trung tâm
    circle((0, 0), radius: 1.15, fill: c-navy, stroke: 2.5pt + rgb("BBDEFB"), name: "c")
    content((0, 0.25), text(fill: white, size: 8.5pt, weight: "bold")[Không Gian])
    content((0, -0.25), text(fill: white, size: 8.5pt, weight: "bold")[Trạng Thái Ω])

    // 5 nhánh (bố trí tròn)
    let nodes = (
      (0, 3.1, rgb("1B5E20"), rgb("A5D6A7"), "b-dem", "Đếm", "= Sinh trạng thái"),
      (2.95, 0.96, rgb("004D40"), rgb("80CBC4"), "b-xs", "Xác Suất", "= Gán trọng số"),
      (1.82, -2.5, rgb("BF360C"), rgb("FFAB91"), "b-dp", "DP", "= Chuyển trạng thái"),
      (-1.82, -2.5, rgb("01579B"), rgb("81D4FA"), "b-dk", "Điều Kiện", "= Lọc trạng thái"),
      (-2.95, 0.96, rgb("4A148C"), rgb("CE93D8"), "b-hs", "Hàm Sinh", "= Mã hóa"),
    )

    for (x, y, col, lc, nm, t1, t2) in nodes {
      // Đường kết nối từ center
      line("c", (x, y), stroke: 1.8pt + col.lighten(20%))
      // Node
      circle((x, y), radius: 1.0, fill: col, stroke: 1.5pt + lc, name: nm)
      content((x, y + 0.22), text(fill: white, size: 8pt, weight: "bold")[#t1])
      content((x, y - 0.22), text(fill: lc, size: 7pt)[#t2])
    }
  })
  #v(0.4em)
  #text(size: 9pt, style: "italic", fill: c-slate)[
    Sơ đồ 5 trụ cột của Framework Tư Duy Trạng Thái
  ]
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN I: TRẠNG THÁI LÀ GÌ?
// ═══════════════════════════════════════════════
= Phần I — Trạng Thái Là Gì?

== 1.1 Bắt Đầu Từ Trực Giác

#insight-box(title: "💡 Ba Ẩn Dụ Đơn Giản")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 1em,
    [
      *🚦 Đèn giao thông*

      Tại mọi thời điểm, đèn chỉ ở *một* trong: 🔴 Đỏ · 🟡 Vàng · 🟢 Xanh.

      Không cần biết lịch sử — chỉ cần biết *trạng thái hiện tại*.
    ],
    [
      *🎲 Xúc xắc*

      Khi gieo xong, kết quả là *một* trong 6 mặt: {1, 2, 3, 4, 5, 6}.

      Mỗi mặt là một *trạng thái kết thúc*.
    ],
    [
      *🚶 Người đi trên lưới*

      Ở mỗi bước, người đứng ở *một ô* trong lưới. Ô đó là trạng thái — ghi lại *tất cả thông tin* cần thiết.
    ],
  )
]

#v(0.5em)

#theory-box[
  #text(fill: c-navy, size: 11pt, weight: "bold")[📐 Định Nghĩa Làm Việc]
  #v(0.5em)
  Trong context của bài toán, một *trạng thái* là *một cấu hình tóm lược đủ thông tin* để:
  - Biết ta đang ở đâu trong quá trình,
  - Quyết định bước tiếp theo.

  *Không gian trạng thái* $Omega$ là *tập hợp tất cả các trạng thái có thể*.

  #v(0.4em)
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Các mặt xúc xắc — 6 trạng thái
      let cs = (rgb("BBDEFB"), rgb("C8E6C9"), rgb("FFE0B2"), rgb("F8BBD0"), rgb("E1BEE7"), rgb("B2EBF2"))
      for i in range(6) {
        let x = i * 1.6
        circle((x, 0), radius: 0.58, fill: cs.at(i), stroke: 1.2pt + rgb("555"))
        content((x, 0), text(size: 12pt, weight: "bold")[#(i + 1)])
      }
      // Label
      content((4, -1.0), text(size: 9pt, fill: c-slate)[
        Không gian trạng thái $Omega = {1, 2, 3, 4, 5, 6}$ khi tung xúc xắc
      ])
      // Bracket
      line((-0.7, 0.7), (-0.7, -0.7), stroke: 1pt + c-slate)
      line((-0.7, 0.7), (-0.5, 0.7), stroke: 1pt + c-slate)
      line((-0.7, -0.7), (-0.5, -0.7), stroke: 1pt + c-slate)
      line((8.7, 0.7), (8.7, -0.7), stroke: 1pt + c-slate)
      line((8.7, 0.7), (8.5, 0.7), stroke: 1pt + c-slate)
      line((8.7, -0.7), (8.5, -0.7), stroke: 1pt + c-slate)
    })
  ]
]

#v(0.5em)

== 1.2 Trạng Thái Trong Các Bài Toán THPT

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.2em,
  row-gutter: 0.7em,
  [
    #block(
      fill: rgb("E3F2FD"),
      stroke: 0.6pt + c-navy,
      radius: 5pt,
      inset: (x: 12pt, y: 10pt),
    )[
      *Bài toán đếm số tự nhiên 3 chữ số:*

      Trạng thái = một số tự nhiên $overline(a b c)$ với $a in {1..9}$, $b,c in {0..9}$.

      $|Omega| = 9 times 10 times 10 = 900$
    ]
  ],
  [
    #block(
      fill: rgb("E8F5E9"),
      stroke: 0.6pt + c-teal,
      radius: 5pt,
      inset: (x: 12pt, y: 10pt),
    )[
      *Bài toán bốc bi từ hộp:*

      Trạng thái = tập các bi được chọn. Nếu chọn 3 bi từ 10 bi:

      $|Omega| = C_(10)^3 = 120$
    ]
  ],

  [
    #block(
      fill: rgb("FFF8E1"),
      stroke: 0.6pt + rgb("F9A825"),
      radius: 5pt,
      inset: (x: 12pt, y: 10pt),
    )[
      *Bài toán dãy nhị phân độ dài 5:*

      Trạng thái = một dãy bit $b_1 b_2 b_3 b_4 b_5$.

      $|Omega| = 2^5 = 32$
    ]
  ],
  [
    #block(
      fill: rgb("F3E5F5"),
      stroke: 0.6pt + c-violet,
      radius: 5pt,
      inset: (x: 12pt, y: 10pt),
    )[
      *Bài toán tô màu 4 ô:*

      Trạng thái = cách tô, với điều kiện hai ô kề khác màu.

      $|Omega|$ = số cách tô hợp lệ (cần đếm).
    ]
  ],
)

#v(0.5em)
#qopen[
  Với bài "xếp 5 học sinh vào 5 ghế", không gian trạng thái là gì? Khi thêm điều kiện "A và B không ngồi cạnh nhau", không gian trạng thái thay đổi như thế nào?
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN II: ĐẾM = SINH TRẠNG THÁI
// ═══════════════════════════════════════════════
= Phần II — "Đếm = Sinh Trạng Thái"

== 2.1 Quy Tắc Cộng — Phân Vùng Không Gian

#insight-box(title: "💡 Trực Giác Quy Tắc Cộng")[
  Nếu không gian trạng thái $Omega$ *bị phân chia thành các vùng rời nhau* $Omega = A_1 union A_2 union dots union A_k$ (không có trạng thái nào thuộc hai vùng), thì:
  $
    |Omega| = |A_1| + |A_2| + dots + |A_k|
  $
  *Ẩn dụ:* Đếm số ghế trong 3 dãy khác nhau = đếm từng dãy rồi cộng lại.
]

#example-box(n: "2.1 — Số nguyên chia hết cho 2 hoặc 5 từ 1 đến 100")[
  *Xác định không gian:* $Omega = {1, 2, dots, 100}$, $|Omega| = 100$.

  *Phân vùng theo tính chất:*
  - $A$ = chia hết cho 2: $A = {2, 4, dots, 100}$, $|A| = 50$
  - $B$ = chia hết cho 5 nhưng không cho 2: $B = {5, 15, 25, 35, 45, 55, 65, 75, 85, 95}$, $|B| = 10$

  *Vì $A ∩ B = emptyset$* (chia hết cho cả 2 và 5 và không cho 2 — mâu thuẫn):
  $
    |A union B| = 50 + 10 = 60
  $

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      // Omega region
      rect((-0.5, -0.8), (11.5, 0.8), fill: rgb("F8F9FA"), stroke: 1pt + c-slate, radius: 4pt)
      content((5.5, -1.2), text(size: 8pt, fill: c-slate)[Ω = {1..100}])
      // A region
      rect((-0.3, -0.6), (5.3, 0.6), fill: rgb("BBDEFB"), stroke: 1pt + c-navy, radius: 3pt)
      content((2.5, 0), text(size: 8pt, fill: c-navy)[A: chia hết cho 2 (50 phần tử)])
      // B region
      rect((5.5, -0.6), (11.3, 0.6), fill: rgb("C8E6C9"), stroke: 1pt + c-teal, radius: 3pt)
      content((8.4, 0), text(size: 8pt, fill: c-teal)[B: chia hết cho 5, lẻ (10 phần tử)])
    })
  ]
]

#v(0.5em)

== 2.2 Quy Tắc Nhân — Tích Không Gian Trạng Thái

#insight-box(title: "💡 Trực Giác Quy Tắc Nhân")[
  Nếu một trạng thái được xây dựng qua *nhiều bước độc lập*, mỗi bước $i$ có $n_i$ lựa chọn, thì:
  $
    |Omega| = n_1 times n_2 times dots times n_k
  $
  *Ẩn dụ:* Outfit gồm (áo: 3 loại) × (quần: 4 loại) × (giày: 2 loại) = 24 cách phối.

  *Trạng thái = "đường đi hoàn chỉnh" qua cây sinh*.
]

#v(0.5em)

// ─── Cây sinh trạng thái ────────────────────────────────────
#align(center)[
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *

    // Root
    content(
      (3.5, 0),
      [Bắt đầu],
      name: "r",
      frame: "rect",
      padding: 5pt,
      fill: rgb("E3F2FD"),
      stroke: 1pt + c-navy,
      radius: 3pt,
    )

    // Bước 1: 3 lựa chọn (Áo: Đỏ, Xanh, Vàng)
    let lvl1 = (
      (0.5, -2, "Đỏ", rgb("FFCDD2"), rgb("C62828"), "la"),
      (3.5, -2, "Xanh", rgb("BBDEFB"), c-navy, "lb"),
      (6.5, -2, "Vàng", rgb("FFF9C4"), rgb("F9A825"), "lc"),
    )
    for (x, y, lbl, fc, sc, nm) in lvl1 {
      content((x, y), [#lbl], name: nm, frame: "circle", padding: 6pt, fill: fc, stroke: 1pt + sc)
      line("r", nm, mark: (end: "stealth", fill: c-slate, scale: 0.65), stroke: 0.9pt + c-slate)
    }
    content((3.5, -1.1), text(size: 7.5pt, fill: c-slate)[3 màu áo])

    // Bước 2: mỗi node có 2 lựa chọn (Quần: dài, ngắn)
    let lvl2-data = (
      ((0.5, -2), "la", ((-0.5, -3.8), (1.5, -3.8))),
      ((3.5, -2), "lb", ((2.5, -3.8), (4.5, -3.8))),
      ((6.5, -2), "lc", ((5.5, -3.8), (7.5, -3.8))),
    )
    let pants = ("Dài", "Ngắn")
    let pfc = (rgb("D7CCC8"), rgb("BCAAA4"))
    let idx = 0
    for (_, pnm, children) in lvl2-data {
      let ci = 0
      for (cx, cy) in children {
        let cnm = pnm + str(ci)
        content(
          (cx, cy),
          text(size: 8pt)[#pants.at(ci)],
          name: cnm,
          frame: "rect",
          padding: 3pt,
          fill: pfc.at(ci),
          stroke: 0.7pt + rgb("888"),
          radius: 2pt,
        )
        line(pnm, cnm, mark: (end: "stealth", fill: c-slate, scale: 0.55), stroke: 0.7pt + c-slate)
        ci = ci + 1
      }
    }
    content((3.5, -3.0), text(size: 7.5pt, fill: c-slate)[2 kiểu quần])

    // Kết quả
    content((3.5, -4.6), text(size: 9pt, fill: c-navy, weight: "bold")[
      Tổng: 3 × 2 = 6 outfit — mỗi "lá" là một trạng thái kết thúc
    ])
  })
  #v(0.3em)
  #text(size: 9pt, style: "italic", fill: c-slate)[
    Cây sinh: mỗi đường từ gốc đến lá = một trạng thái trong không gian $Omega$
  ]
]

#v(0.6em)

#key-box[
  *Quy tắc nhân = tích Descartes của các tập lựa chọn:*
  $
    Omega = S_1 times S_2 times dots times S_k, quad |Omega| = |S_1| dot |S_2| dot dots dot |S_k|
  $
  Khi các bước *không độc lập* (chọn không hoàn lại, có ràng buộc vị trí...), cây sinh giúp thấy rõ số nhánh thay đổi ở mỗi cấp.
]

#v(0.4em)

#warn-box[
  *Nhầm lẫn phổ biến nhất:* Học sinh dùng quy tắc nhân khi lẽ ra phải dùng quy tắc cộng (hai sự kiện KHÔNG thể xảy ra đồng thời) và ngược lại.

  *Câu hỏi kiểm tra:* "Có cần thực hiện *cả hai* hay chỉ cần *một trong hai*?"
  - Cả hai (đồng thời, từng bước) → *Nhân*
  - Một trong hai (phân trường hợp) → *Cộng*
]

#v(0.4em)

== 2.3 Tổ Hợp và Chỉnh Hợp — Đếm Có Thứ Tự vs Không Thứ Tự

#theory-box[
  #text(fill: c-navy, size: 11pt, weight: "bold")[🔢 Góc Nhìn Trạng Thái Cho $A_n^k$ và $C_n^k$]
  #v(0.5em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2em,
    [
      *Chỉnh hợp $A_n^k$:*

      Trạng thái = *dãy có thứ tự* $k$ phần tử khác nhau từ $n$ phần tử.

      Cây sinh $k$ tầng, tầng $i$ có $n - i + 1$ nhánh.
      $
        A_n^k = n(n-1)dots(n-k+1)
      $
    ],
    [
      *Tổ hợp $C_n^k$:*

      Trạng thái = *tập con* $k$ phần tử từ $n$ phần tử (không quan tâm thứ tự).

      Mỗi tập $k$ phần tử ứng với $k!$ dãy → chia đúng $k!$ lần đếm trùng.
      $
        C_n^k = frac(A_n^k, k!) = frac(n!, k!(n-k)!)
      $
    ],
  )
  #v(0.5em)
  *Khác biệt dưới góc nhìn trạng thái:* Cùng trạng thái vật lý {A, B, C} nhưng nếu thứ tự quan trọng thì {A,B,C}, {A,C,B}, {B,A,C}, ... là *6 trạng thái phân biệt*; nếu không thì chỉ là *1 trạng thái*.
]

#v(0.5em)

#activity-box[
  *Hoạt động "Bầu Ban Chấp Hành":* Cho lớp 10 học sinh. Hỏi:
  - Cần chọn 3 người làm *lớp trưởng, lớp phó, thủ quỹ* (3 vai trò khác nhau): trạng thái nào? $A_(10)^3$?
  - Cần chọn *3 đại biểu* dự hội nghị (vai trò như nhau): trạng thái nào? $C_(10)^3$?

  Yêu cầu học sinh *vẽ* sự khác nhau giữa hai cây sinh để thấy vì sao một cái chia cho $3!$.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN III: XÁC SUẤT = GÁN TRỌNG SỐ
// ═══════════════════════════════════════════════
= Phần III — "Xác Suất = Gán Trọng Số Cho Trạng Thái"

== 3.1 Bước Nhảy Từ Đếm Sang Xác Suất

#insight-box(title: "💡 Chỉ Một Bước Nhỏ")[
  Khi *tất cả trạng thái đều có xác suất bằng nhau* (đồng khả năng), thì:
  $
    P(A) = frac(|A|, |Omega|) = frac("số trạng thái thuộc A", "tổng số trạng thái")
  $
  Đây là *xác suất cổ điển* — xác suất chính là "trọng số đều" cho mỗi trạng thái.

  Khi trạng thái *không đồng khả năng*, ta *gán trọng số khác nhau* cho mỗi trạng thái, nhưng cấu trúc tư duy hoàn toàn giống nhau.
]

== 3.2 Cây Xác Suất — Cây Trạng Thái Có Trọng Số

#theory-box[
  #text(fill: c-navy, size: 11pt, weight: "bold")[🌳 Cây Xác Suất = Cây Sinh + Nhãn Trọng Số]
  #v(0.5em)
  Mỗi nhánh của cây sinh được *dán nhãn xác suất chuyển*. Xác suất của một *đường đi* (từ gốc đến lá) bằng *tích các nhãn dọc đường*.

  #v(0.4em)
  #align(center)[
    #cetz.canvas(length: 1.3cm, {
      import cetz.draw: *

      // Root
      circle((3.5, 0), radius: 0.45, fill: rgb("0D47A1"), stroke: none, name: "root")
      content((3.5, 0), text(fill: white, size: 8pt, weight: "bold")[Bắt đầu])

      // Bước 1: tung đồng xu lần 1
      circle((1.0, -2.0), radius: 0.42, fill: rgb("1B5E20"), stroke: none, name: "H1")
      circle((6.0, -2.0), radius: 0.42, fill: rgb("BF360C"), stroke: none, name: "T1")
      content((1.0, -2.0), text(fill: white, size: 9pt, weight: "bold")[H])
      content((6.0, -2.0), text(fill: white, size: 9pt, weight: "bold")[T])

      line("root", "H1", stroke: 1.3pt + c-slate, mark: (end: "stealth", fill: c-slate, scale: 0.65))
      line("root", "T1", stroke: 1.3pt + c-slate, mark: (end: "stealth", fill: c-slate, scale: 0.65))
      content((1.9, -0.9), text(size: 9pt, fill: c-teal, weight: "bold")[$1/2$])
      content((5.1, -0.9), text(size: 9pt, fill: c-amber, weight: "bold")[$1/2$])

      // Bước 2: tung lần 2
      let lvl2 = (
        (0.0, -3.8, "HH", rgb("1B5E20"), "HH", "H1"),
        (2.0, -3.8, "HT", rgb("004D40"), "HT", "H1"),
        (5.0, -3.8, "TH", rgb("004D40"), "TH", "T1"),
        (7.0, -3.8, "TT", rgb("BF360C"), "TT", "T1"),
      )
      for (x, y, lbl, col, nm, par) in lvl2 {
        circle((x, y), radius: 0.42, fill: col, stroke: none, name: nm)
        content((x, y), text(fill: white, size: 8pt, weight: "bold")[#lbl])
        line(par, nm, stroke: 1.1pt + c-slate, mark: (end: "stealth", fill: c-slate, scale: 0.6))
      }
      // Nhãn xác suất tầng 2
      content((-0.15, -2.85), text(size: 8pt, fill: c-teal)[$1/2$])
      content((1.85, -2.85), text(size: 8pt, fill: c-amber)[$1/2$])
      content((4.85, -2.85), text(size: 8pt, fill: c-teal)[$1/2$])
      content((6.85, -2.85), text(size: 8pt, fill: c-amber)[$1/2$])

      // Xác suất lá
      content((0.0, -4.6), text(size: 8pt, fill: rgb("EEE"))[$1/4$])
      content((2.0, -4.6), text(size: 8pt, fill: rgb("EEE"))[$1/4$])
      content((5.0, -4.6), text(size: 8pt, fill: rgb("EEE"))[$1/4$])
      content((7.0, -4.6), text(size: 8pt, fill: rgb("EEE"))[$1/4$])

      // Nền màu nhạt cho phần xác suất lá
      rect((-0.5, -4.9), (7.5, -4.3), fill: rgb("263238"), stroke: none, radius: 3pt)
      content((3.5, -4.6), text(size: 8pt, fill: rgb("90CAF9"))[
        P(HH) = P(HT) = P(TH) = P(TT) = $1/4$ → đồng khả năng ✓
      ])
    })
  ]
  #v(0.4em)
  *Nguyên tắc đọc cây:* Xác suất tại bất kỳ lá nào = tích các xác suất trên đường từ gốc đến lá.
]

#v(0.5em)

== 3.3 Xác Suất Toàn Phần — Tổng Trọng Số

#theory-box[
  #text(fill: c-navy, size: 11pt, weight: "bold")[⚖️ Công Thức Xác Suất Toàn Phần Từ Cây]
  #v(0.4em)
  Nếu $B_1, B_2, dots, B_k$ là phân hoạch của $Omega$ (các "nhánh" ở tầng đầu), thì:
  $
    P(A) = sum_(i=1)^k P(A | B_i) dot P(B_i)
  $
  *Đây chính là tổng trọng số qua tất cả đường đi đến $A$ trong cây!*

  Không cần học công thức này như một quy tắc — *nó tự nhiên xuất hiện* khi bạn đọc cây xác suất từng nhánh.
]

#example-box(n: "3.1 — Bốc Bi Hai Lần (Có Hoàn Lại)")[
  Hộp có 3 bi đỏ, 2 bi xanh. Bốc ngẫu nhiên 1 bi, ghi màu, bỏ lại, bốc tiếp. Tính P(lần 2 đỏ).

  *Xây dựng cây (2 nhánh tầng 1: Đỏ₁, Xanh₁):*

  #grid(
    columns: (1fr, auto),
    column-gutter: 1.5em,
    [
      - $P("Đỏ"_1) = 3/5$, $P("Xanh"_1) = 2/5$
      - $P("Đỏ"_2 | "Đỏ"_1) = 3/5$ (có hoàn lại → giống nhau)
      - $P("Đỏ"_2 | "Xanh"_1) = 3/5$

      Tổng trọng số đến "Đỏ₂":
      $
        P("Đỏ"_2) = 3/5 dot 3/5 + 2/5 dot 3/5 = 9/25 + 6/25 = 15/25 = 3/5
      $
    ],
    [
      #block(fill: rgb("F1F8E9"), stroke: 0.5pt + c-green, radius: 4pt, inset: (x: 10pt, y: 8pt))[
        *Nhận xét:*\ Kết quả $3/5$ hợp lý vì bốc có hoàn lại — xác suất không đổi qua các lần.

        Cây giúp thấy *ngay* điều này.
      ]
    ],
  )
]

#v(0.4em)
#qopen[
  Nếu bốc *không hoàn lại*, cây thay đổi như thế nào? Các nhánh ở tầng 2 sau khi lấy bi đỏ và sau khi lấy bi xanh có cùng xác suất không?
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN IV: ĐIỀU KIỆN = LỌC TRẠNG THÁI
// ═══════════════════════════════════════════════
= Phần IV — "Điều Kiện = Lọc Trạng Thái"

== 4.1 Xác Suất Có Điều Kiện — Thu Hẹp Không Gian

#insight-box(title: "💡 Phép Lọc Trạng Thái")[
  Khi biết thêm thông tin "sự kiện $B$ đã xảy ra", ta *loại bỏ tất cả trạng thái không thuộc $B$* khỏi không gian, rồi tính xác suất trong không gian còn lại.

  #v(0.4em)
  $
    P(A | B) = frac(P(A inter B), P(B)) = frac(|A inter B|, |B|)
    quad ("khi tất cả trạng thái đồng khả năng")
  $
  *Đây không phải công thức học thuộc — đây là hệ quả tất yếu của phép lọc!*
]

#v(0.5em)

// ─── Sơ đồ lọc trạng thái ───────────────────────────────────
#align(center)[
  #cetz.canvas(length: 1.1cm, {
    import cetz.draw: *

    // TRƯỚC KHI LỌC: 4 trạng thái của 2 đồng xu
    content((-0.5, 1.2), text(size: 9pt, fill: c-slate, weight: "bold")[Trước khi lọc: Ω = {HH, HT, TH, TT}])
    let states-all = (
      (0, 0, "HH", rgb("1B5E20"), true),
      (1.5, 0, "HT", rgb("004D40"), true),
      (3.0, 0, "TH", rgb("004D40"), true),
      (4.5, 0, "TT", rgb("BF360C"), false),
    )
    for (x, y, lbl, col, keep) in states-all {
      circle(
        (x, y),
        radius: 0.5,
        fill: if keep { col } else { rgb("BDBDBD") },
        stroke: if keep { 1.5pt + col.darken(20%) } else { 1pt + rgb("999") },
      )
      content((x, y), text(fill: white, size: 8pt, weight: "bold")[#lbl])
    }
    // Ngoặc vuông bao phủ tất cả
    rect((-0.6, -0.6), (5.1, 0.6), stroke: 1.2pt + c-slate, fill: none, radius: 4pt)

    // MŨI TÊN LỌC
    content((6.0, 0), text(size: 10pt, fill: c-violet, weight: "bold")[
      Biết "≥1H"\
      → lọc bỏ TT
    ])
    line((5.2, 0), (7.2, 0), stroke: 2pt + c-violet, mark: (end: "stealth", fill: c-violet, scale: 0.8))

    // SAU KHI LỌC: 3 trạng thái
    content((9.2, 1.2), text(size: 9pt, fill: c-slate, weight: "bold")[Sau khi lọc: B = {HH, HT, TH}])
    let states-filt = (
      (7.8, 0, "HH", rgb("1B5E20")),
      (9.2, 0, "HT", rgb("004D40")),
      (10.6, 0, "TH", rgb("004D40")),
    )
    for (x, y, lbl, col) in states-filt {
      circle((x, y), radius: 0.5, fill: col, stroke: 1.5pt + col.darken(20%))
      content((x, y), text(fill: white, size: 8pt, weight: "bold")[#lbl])
    }
    rect((7.2, -0.6), (11.2, 0.6), stroke: 1.2pt + c-violet, fill: none, radius: 4pt)

    // Highlight A∩B = {HH}
    content((7.8, -1.0), text(size: 8pt, fill: rgb("E53935"))[A∩B = {HH}])
    line((7.8, -0.55), (7.8, -0.75), stroke: 1pt + rgb("E53935"), mark: (
      end: "stealth",
      fill: rgb("E53935"),
      scale: 0.6,
    ))

    // Kết quả
    content((9.2, -1.5), text(size: 9pt, fill: c-navy, weight: "bold")[
      P(HH | ≥1H) = 1/3
    ])
  })
  #v(0.3em)
  #text(size: 9pt, style: "italic", fill: c-slate)[
    Điều kiện "ít nhất một H" lọc bỏ TT → không gian thu hẹp còn 3 trạng thái
  ]
]

#v(0.6em)

== 4.2 Công Thức Bayes — Lọc Hai Chiều

#theory-box[
  #text(fill: c-navy, size: 11pt, weight: "bold")[🔄 Bayes = "Lọc Ngược": Biết Kết Quả, Truy Nguyên Nhân]
  #v(0.5em)
  Ta *thường đọc cây từ trái sang phải* (từ nguyên nhân đến kết quả). Bayes *đọc ngược cây*:

  $
    P(B_i | A) = frac(P(A | B_i) dot P(B_i), sum_j P(A | B_j) dot P(B_j))
    = frac("Trọng số của nhánh $i$ đến $A$", "Tổng trọng số tất cả nhánh đến $A$")
  $

  *Không cần học công thức Bayes như một công thức riêng.* Chỉ cần biết cách đọc cây xác suất — Bayes tự nhiên xuất hiện.
]

#example-box(n: "4.1 — Kiểm Tra Bệnh")[
  Xét nghiệm bệnh X: độ nhạy 95% (P(dương | bệnh)), độ đặc hiệu 90% (P(âm | không bệnh)). Tỉ lệ bệnh trong dân số 1%. Xét nghiệm dương — xác suất thực sự bị bệnh?

  *Xây cây trạng thái:*

  #grid(
    columns: (1.2fr, 1fr),
    column-gutter: 1em,
    [
      - $B_1$ = có bệnh: $P(B_1) = 0.01$
      - $B_2$ = không bệnh: $P(B_2) = 0.99$
      - $A$ = xét nghiệm dương tính

      $P(A | B_1) = 0.95$, $P(A | B_2) = 0.10$

      $
        P(A) = 0.95 times 0.01 + 0.10 times 0.99 = 0.1085
      $
      $
        P(B_1 | A) = frac(0.95 times 0.01, 0.1085) approx 8.76%
      $
    ],
    [
      #block(fill: rgb("FBE9E7"), stroke: 0.5pt + c-amber, radius: 4pt, inset: (x: 10pt, y: 8pt))[
        *Bài học sâu:*

        Dù xét nghiệm dương tính, xác suất thực sự bị bệnh chỉ ~8.76%!

        Nguyên nhân: bệnh hiếm ($P = 1%$) nên "nhiễu dương tính giả" áp đảo.

        Cây trạng thái làm điều này *trực quan tuyệt đối*.
      ]
    ],
  )
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN V: BIẾN CỐ ĐỐI = BÙ TRẠNG THÁI
// ═══════════════════════════════════════════════
= Phần V — "Biến Cố Đối = Bù Trạng Thái"

#insight-box(title: "💡 Đếm Phần Bù — Khi Đếm Trực Tiếp Quá Khó")[
  Đôi khi đếm *"những gì không muốn"* dễ hơn đếm *"những gì muốn"*:
  $
    |A| = |Omega| - |overline(A)|
    quad arrow.r quad
    P(A) = 1 - P(overline(A))
  $
  *Tín hiệu nhận biết khi nào dùng phần bù:*
  - "Ít nhất một..." → đối là "không có cái nào..."
  - "Ít nhất hai..." → đối là "0 hoặc 1 cái..."
  - "Không phải tất cả..." → đối là "tất cả..."
]

#v(0.5em)

#example-box(n: "5.1 — Ít Nhất Một Mặt 6 Khi Gieo 3 Xúc Xắc")[
  *P(ít nhất một mặt 6)* = ?

  *Trực tiếp:* Đếm theo từng trường hợp (đúng 1 mặt 6, đúng 2, đúng 3) — phức tạp.

  *Phần bù:* $overline(A)$ = "không có mặt nào là 6".
  $
    P(overline(A)) = (5/6)^3 = 125/216
  $
  $
    P(A) = 1 - 125/216 = 91/216 approx 42.1%
  $
  *Không gian trạng thái* $|Omega| = 6^3 = 216$. Bù loại bỏ $5^3 = 125$ trạng thái "không có 6".
]

#v(0.5em)

#align(center)[
  #cetz.canvas(length: 1.0cm, {
    import cetz.draw: *
    // Hình chữ nhật Omega
    rect((-0.5, -1.5), (10.5, 1.5), fill: rgb("ECEFF1"), stroke: 1.5pt + c-slate, radius: 6pt)
    content((5, 1.2), text(size: 9pt, fill: c-slate)[$Omega$: toàn bộ $6^3=216$ kết quả])
    // Vùng phần bù
    rect((-0.3, -1.3), (5.5, 1.3), fill: rgb("CFD8DC"), stroke: 1pt + c-slate, radius: 4pt)
    content((2.6, 0), text(size: 9pt, fill: c-slate, weight: "bold")[
      $overline(A)$: không có mặt 6\
      $5^3 = 125$ trạng thái
    ])
    // Vùng A
    rect((5.7, -1.3), (10.3, 1.3), fill: rgb("BBDEFB"), stroke: 1.5pt + c-navy, radius: 4pt)
    content((8.0, 0), text(size: 9pt, fill: c-navy, weight: "bold")[
      $A$: ít nhất một mặt 6\
      $216 - 125 = 91$ trạng thái
    ])
  })
]

#v(0.5em)

#warn-box[
  *Lỗi "quên phần bù":* Học sinh thường cố gắng đếm trực tiếp "ít nhất một..." bằng cách cộng từng trường hợp, dễ bỏ sót hoặc đếm trùng.

  *Khi thấy "ít nhất một" hoặc "ít nhất $k$"* — luôn thử phần bù trước.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN VI: DP = CHUYỂN TRẠNG THÁI
// ═══════════════════════════════════════════════
= Phần VI — "DP = Chuyển Trạng Thái"

== 6.1 Từ Truy Hồi Đến Máy Trạng Thái Hữu Hạn

#insight-box(title: "💡 Bài Toán Đếm Dãy Có Điều Kiện")[
  Nhiều bài toán đếm THPT có dạng: "Đếm số dãy độ dài $n$ thỏa điều kiện *cục bộ*" (điều kiện chỉ liên quan đến *vài phần tử liên tiếp*, không phụ thuộc toàn dãy).

  *Ví dụ:* Dãy nhị phân độ dài $n$, không có hai số 1 liên tiếp.

  Với những bài này, *trạng thái = thông tin "đuôi" đủ để quyết định được bước tiếp theo*.
]

#v(0.5em)

#theory-box[
  #text(fill: c-navy, size: 11pt, weight: "bold")[⚡ Sơ Đồ Máy Trạng Thái (FSM) Cho Bài Đếm Dãy]
  #v(0.4em)
  *Bài:* Đếm số dãy nhị phân độ dài $n$ không có "11" (hai số 1 liên tiếp).

  *Xác định trạng thái:* Sau khi viết $k$ ký tự, điều duy nhất ảnh hưởng đến bước tiếp theo là *ký tự cuối cùng*:
  - $S_0$: ký tự cuối là *0* (hoặc mới bắt đầu) → có thể thêm 0 hoặc 1
  - $S_1$: ký tự cuối là *1* → chỉ được thêm 0 (không được thêm 1)

  #v(0.5em)
  #align(center)[
    #cetz.canvas(length: 1.3cm, {
      import cetz.draw: *

      // S0
      circle((0, 0), radius: 0.65, fill: rgb("1B5E20"), stroke: 2pt + rgb("A5D6A7"), name: "s0")
      content((0, 0.15), text(fill: white, size: 9pt, weight: "bold")[$S_0$])
      content((0, -0.18), text(fill: rgb("C8E6C9"), size: 7.5pt)[cuối = 0])

      // S1
      circle((4.5, 0), radius: 0.65, fill: rgb("0D47A1"), stroke: 2pt + rgb("90CAF9"), name: "s1")
      content((4.5, 0.15), text(fill: white, size: 9pt, weight: "bold")[$S_1$])
      content((4.5, -0.18), text(fill: rgb("BBDEFB"), size: 7.5pt)[cuối = 1])

      // Tự vòng S0 --0--> S0
      bezier(
        (-0.45, 0.52),
        (0.45, 0.52),
        (-0.7, 1.35),
        (0.7, 1.35),
        stroke: 1.4pt + c-teal,
        mark: (end: "stealth", fill: c-teal, scale: 0.75),
      )
      content((0, 1.2), text(size: 9pt, fill: c-teal, weight: "bold")[thêm 0])

      // S0 --1--> S1
      line((0.65, 0.2), (3.85, 0.2), stroke: 1.4pt + rgb("F9A825"), mark: (
        end: "stealth",
        fill: rgb("F9A825"),
        scale: 0.75,
      ))
      content((2.25, 0.48), text(size: 9pt, fill: rgb("E65100"), weight: "bold")[thêm 1])

      // S1 --0--> S0
      line((3.85, -0.2), (0.65, -0.2), stroke: 1.4pt + c-teal, mark: (end: "stealth", fill: c-teal, scale: 0.75))
      content((2.25, -0.48), text(size: 9pt, fill: c-teal, weight: "bold")[thêm 0])

      // S1 --1--> FORBIDDEN
      content((6.5, 0.0), text(size: 10pt)[✗])
      line((5.15, 0.2), (6.2, 0.2), stroke: 1.4pt + rgb("C62828"), mark: (
        end: "stealth",
        fill: rgb("C62828"),
        scale: 0.75,
      ))
      content((6.5, 0.5), text(size: 8pt, fill: rgb("C62828"), weight: "bold")[thêm 1\ CẤM])
    })
  ]
  #v(0.4em)
  *Đặt $f(n, S_0)$ và $f(n, S_1)$ = số dãy độ dài $n$ kết thúc ở $S_0$ và $S_1$ tương ứng.*

  *Hệ truy hồi đọc thẳng từ sơ đồ:*
  $
    f(n, S_0) = f(n-1, S_0) + f(n-1, S_1)
    quad ("thêm 0 từ bất kỳ trạng thái nào")
  $
  $
    f(n, S_1) = f(n-1, S_0)
    quad ("chỉ thêm 1 từ $S_0$")
  $
  *Điều kiện đầu:* $f(1, S_0) = 1$ (dãy "0"), $f(1, S_1) = 1$ (dãy "1").

  *Tổng số dãy độ dài $n$:* $F(n) = f(n, S_0) + f(n, S_1)$.
]

#v(0.5em)

== 6.2 Bảng DP — Điền Trạng Thái Từng Bước

#align(center)[
  #table(
    columns: (auto, auto, auto, auto, auto, auto, auto, auto),
    stroke: 0.5pt + rgb("90CAF9"),
    fill: (x, y) => if y == 0 { c-navy } else if x == 0 { rgb("E3F2FD") } else if calc.odd(y) { white } else {
      rgb("F8F9FA")
    },
    inset: (x: 10pt, y: 7pt),
    align: center,
    table.header(
      text(fill: white, weight: "bold")[$n$],
      text(fill: white, weight: "bold")[1],
      text(fill: white, weight: "bold")[2],
      text(fill: white, weight: "bold")[3],
      text(fill: white, weight: "bold")[4],
      text(fill: white, weight: "bold")[5],
      text(fill: white, weight: "bold")[6],
      text(fill: white, weight: "bold")[7],
    ),
    [$f(n, S_0)$], [1], [2], [3], [5], [8], [13], [21],
    [$f(n, S_1)$], [1], [1], [2], [3], [5], [8], [13],
    [$F(n)$ (tổng)], [2], [3], [5], [8], [13], [21], [34],
  )
]

#v(0.4em)
#key-box[
  *Đây là dãy Fibonacci!* $F(n) = F(n-1) + F(n-2)$.

  Không phải ngẫu nhiên — sơ đồ FSM có 2 trạng thái với cấu trúc chuyển đối xứng nên sinh ra Fibonacci. *Tư duy trạng thái lý giải tại sao.*
]

#v(0.5em)

== 6.3 Ví Dụ Ứng Dụng Vào Bài Toán Tô Màu

#example-box(n: "6.1 — Tô Màu Hàng Rào (dạng THPT phổ biến)")[
  Có $n$ tấm ván dọc thẳng, mỗi tấm tô 1 trong 3 màu: Đỏ, Xanh, Vàng. *Điều kiện: hai tấm kề không được cùng màu.* Đếm số cách tô.

  *Trạng thái:* Màu của tấm vừa tô (3 trạng thái: Đỏ, Xanh, Vàng).

  *Chuyển trạng thái:* Từ mỗi màu, có thể chuyển sang *2 màu khác* (2 nhánh).

  *Truy hồi:* Gọi $T(n)$ = tổng số cách tô $n$ tấm.
  - Tấm đầu: 3 lựa chọn.
  - Mỗi tấm tiếp theo: 2 lựa chọn (khác màu trước).
  $
    T(n) = 3 times 2^(n-1)
  $
  *Sơ đồ trạng thái giải thích ngay:* Mỗi bước nhân thêm 2. Không cần lập truy hồi phức tạp.
]

#v(0.5em)
#activity-box(title: "🎓 Hoạt Động 'Vẽ Máy Trạng Thái'")[
  Chia lớp thành nhóm 3-4 người. Mỗi nhóm nhận một bài toán đếm dãy có điều kiện cục bộ:
  - Nhóm A: Dãy nhị phân, không có "000".
  - Nhóm B: Dãy từ {a, b, c}, không có hai ký tự giống liên tiếp.
  - Nhóm C: Dãy từ {0,1,2}, tổng chia hết cho 3.

  Yêu cầu: *Vẽ sơ đồ FSM → Viết hệ truy hồi → Lập bảng DP → Tìm công thức*.

  Nhóm chia sẻ sơ đồ của mình và giải thích tại sao chọn *những trạng thái đó*.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN VII: HÀM SINH = MÃ HÓA TRẠNG THÁI
// ═══════════════════════════════════════════════
= Phần VII — "Hàm Sinh = Mã Hóa Trạng Thái"

#insight-box(title: "💡 Đỉnh Của Framework: Nén Toàn Bộ Không Gian Thành Một Đa Thức")[
  Nếu trạng thái là các số nguyên không âm ${0, 1, 2, dots}$ và ta muốn đếm *số cách đạt tổng $= n$*, ta có thể *đóng gói toàn bộ dãy đếm* $a_0, a_1, a_2, dots$ vào một đối tượng duy nhất:
  $
    G(x) = sum_(n=0)^(+oo) a_n x^n
  $
  *Biến $x$ là "nhãn trạng thái"* — số mũ của $x$ đánh dấu trạng thái nào (tổng bằng bao nhiêu). Hệ số $a_n$ chính là *trọng số (số cách)* của trạng thái $n$.
]

#v(0.5em)

#theory-box[
  #text(fill: c-navy, size: 11pt, weight: "bold")[📦 Nguyên Lý Tích: Các Biến Độc Lập → Nhân Hàm Sinh]
  #v(0.4em)
  Bài toán: Đếm số nghiệm nguyên không âm của $x_1 + x_2 + x_3 = n$ với $0 lt.eq x_i lt.eq 4$.

  *Mỗi biến $x_i$ có không gian trạng thái riêng:* ${0, 1, 2, 3, 4}$.
  Hàm sinh của $x_i$: $G_i(x) = x^0 + x^1 + x^2 + x^3 + x^4 = frac(1-x^5, 1-x)$.

  *Vì các biến độc lập*, hàm sinh của bài toán:
  $
    G(x) = G_1(x) dot G_2(x) dot G_3(x) = lr(frac(1-x^5, 1-x))^3
  $
  Số nghiệm với tổng $= n$ chính là *hệ số của $x^n$* trong $G(x)$.

  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    [
      *Kết nối với framework:*
      - Hàm sinh = *mã hóa* toàn bộ không gian trạng thái.
      - Phép nhân hàm sinh = *tích Descartes* không gian.
      - Trích hệ số $[x^n]$ = *lọc* trạng thái có tổng $= n$.
    ],
    [
      *Bảng hàm sinh thường dùng:*

      $x_i gt.eq 0$: $frac(1, 1-x)$

      $x_i gt.eq 1$: $frac(x, 1-x)$

      $x_i$ chẵn: $frac(1, 1-x^2)$

      $0 lt.eq x_i lt.eq m$: $frac(1-x^(m+1), 1-x)$
    ],
  )
]

#v(0.5em)

#key-box[
  *Hàm sinh = ngôn ngữ đại số của không gian trạng thái.*

  Đây là viên gạch cuối cùng kết nối mọi thứ:

  #align(center)[
    #table(
      columns: (2fr, 3fr),
      stroke: 0.5pt + rgb("CE93D8"),
      fill: (x, y) => if y == 0 { c-violet } else if calc.odd(y) { rgb("F3E5F5") } else { white },
      inset: (x: 10pt, y: 8pt),
      table.header(
        text(fill: white, weight: "bold")[Thao tác trạng thái], text(fill: white, weight: "bold")[Tương đương hàm sinh]
      ),
      [Sinh trạng thái (đếm)], [Hệ số $[x^n] G(x) = a_n$],
      [Tích không gian độc lập], [Nhân $G_1(x) dot G_2(x) dots$],
      [Lọc trạng thái (chẵn/lẻ/bội)], [Thay $x arrow.r x^2$, $x arrow.r x^d$, ...],
      [Chuyển trạng thái (DP)], [Nhân với hàm chuyển $T(x)$],
    )
  ]
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN VIII: BÀI TẬP HỆ THỐNG — TĂNG DẦN ĐỘ KHÓ
// ═══════════════════════════════════════════════
= Phần VIII — Bài Tập Hệ Thống Tăng Dần

#block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + c-navy),
  radius: (right: 5pt),
  inset: (x: 14pt, y: 10pt),
  width: 100%,
)[
  #text(fill: c-navy, weight: "bold")[Hướng dẫn sử dụng:]
  Bài tập được chia theo 4 cấp độ tương ứng với thang đánh giá năng lực trong đề thi THPT Quốc gia:
  *Cấp 1 — Nhận biết* (trắc nghiệm đơn) · *Cấp 2 — Thông hiểu* (trắc nghiệm có tính toán) · *Cấp 3 — Vận dụng* (tự luận) · *Cấp 4 — Vận dụng cao* (tự luận + DP).

  Với mỗi bài, GV hướng dẫn HS *đặt tên trạng thái trước*, sau đó mới tính toán.
]

#v(0.8em)

// ─── CẤP 1: NHẬN BIẾT ───────────────────────────────────────

== Cấp 1 — Nhận Biết

#insight-box[*Kỹ năng cần có:* Nhận dạng bài toán, áp dụng trực tiếp công thức $A_n^k$ hoặc $C_n^k$. Không gian trạng thái = tập tất cả kết quả, đếm bằng quy tắc nhân.]

#v(0.4em)

#tn(
  [Từ các chữ số $1, 2, 3, 4, 5, 6$ (không được lặp lại), lập các số tự nhiên có *3 chữ số*. Có bao nhiêu số như vậy?],
  (
    [$60$],
    [$216$],
    True([$120$]),
    [$720$],
  ),
  loigiai: [
    *Xây dựng trạng thái:* Mỗi số 3 chữ số là bộ có thứ tự $(a, b, c)$ với $a, b, c$ đôi một khác nhau và lấy từ tập $6$ chữ số.

    - Vị trí $a$ (hàng trăm): 6 cách.
    - Vị trí $b$ (hàng chục): 5 cách (loại $a$).
    - Vị trí $c$ (hàng đơn vị): 4 cách (loại $a, b$).

    $N = A_6^3 = 6 times 5 times 4 = 120.$ Chọn *C*.
  ],
)

#v(0.5em)

#tn(
  [Trong một lớp gồm $12$ học sinh, cần chọn $4$ bạn đi tham quan. Hỏi có bao nhiêu cách chọn?],
  (
    True([$495$]),
    [$1320$],
    [$11880$],
    [$48$],
  ),
  loigiai: [
    *Trạng thái:* Mỗi nhóm 4 bạn là một tập con (không quan tâm thứ tự).

    $N = C_(12)^4 = frac(12 times 11 times 10 times 9, 4 times 3 times 2 times 1) = frac(11880, 24) = 495.$ Chọn *A*.
  ],
)

#v(0.8em)

// ─── CẤP 2: THÔNG HIỂU ──────────────────────────────────────

== Cấp 2 — Thông Hiểu

#insight-box[*Kỹ năng cần có:* Đặt ràng buộc lên trạng thái, chia trường hợp hoặc xác định trạng thái có điều kiện trước. Xác suất cổ điển $P = |A|/|Omega|$.]

#v(0.4em)

#tn(
  [Từ các chữ số $1, 2, 3, 4, 5$ (không lặp), lập số tự nhiên có *3 chữ số chia hết cho 2*. Có bao nhiêu số như vậy?],
  (
    [$20$],
    [$30$],
    True([$24$]),
    [$12$],
  ),
  loigiai: [
    *Ràng buộc:* Chia hết cho 2 $arrow.l.r.double$ chữ số hàng đơn vị $c in {2, 4}$.

    *Chia trường hợp theo $c$:*

    - $c = 2$: $a$ chọn trong ${1,3,4,5}$ → 4 cách; $b$ chọn trong $5 - 2 = 3$ chữ còn lại → 3 cách. Số số = $4 times 3 = 12$.
    - $c = 4$: tương tự → $12$ số.

    $N = 12 + 12 = 24.$ Chọn *C*.
  ],
)

#v(0.5em)

#tn(
  [Tung ngẫu nhiên một xúc xắc cân đối *hai lần*. Xác suất để *tổng số chấm* xuất hiện bằng $8$ là:],
  (
    [$1/6$],
    True([$5/36$]),
    [$7/36$],
    [$1/9$],
  ),
  loigiai: [
    *Không gian mẫu:* $|Omega| = 6^2 = 36$ (đồng khả năng).

    *Sự kiện $A$ = "tổng = 8":*
    $(2,6),(3,5),(4,4),(5,3),(6,2)$ — gồm $5$ kết quả thuận lợi.

    $P(A) = 5/36.$ Chọn *B*.
  ],
)

#v(0.8em)

// ─── CẤP 3: VẬN DỤNG ────────────────────────────────────────

== Cấp 3 — Vận Dụng

#insight-box[*Kỹ năng cần có:* Kết hợp đếm với gán trọng số, dùng xác suất có điều kiện $P(A|B) = P(A inter B)/P(B)$, xác suất toàn phần. Mô tả rõ ràng không gian trạng thái và cách lọc.]

#v(0.4em)

#tln(
  id: "ST-V1",
  [Một hộp có *4 bi đỏ* và *6 bi xanh*. Bốc ngẫu nhiên đồng thời *3 bi*. Tính xác suất để trong 3 bi lấy được có *ít nhất 1 bi đỏ*.],
  [$P = 5/6$],
  loigiai: [
    #theory-box[
      *Không gian trạng thái:* Tập tất cả các cách chọn 3 bi từ 10 bi.
      $|Omega| = C_(10)^3 = 120.$

      *Chiến lược bù:* "Ít nhất 1 đỏ" = toàn bộ trừ "không có đỏ nào".

      - $overline(A)$ = "cả 3 bi đều xanh": $|overline(A)| = C_6^3 = 20.$

      $P(A) = 1 - P(overline(A)) = 1 - 20/120 = 1 - 1/6 = 5/6.$
    ]
    #block(fill: rgb("E8F5E9"), stroke: 0.5pt + c-green, radius: 4pt, inset: (x: 12pt, y: 8pt))[
      *Đáp án: $P = 5/6.$*
      Framework: Gán trọng số đều → Chiến lược bù trạng thái → Nhanh hơn đếm trực tiếp.
    ]
  ],
)

#v(0.6em)

#tln(
  id: "ST-V2",
  [Hộp I có *3 bi đỏ, 2 bi xanh*; Hộp II có *2 bi đỏ, 4 bi xanh*. Chọn ngẫu nhiên *1 hộp* (xác suất bằng nhau), rồi lấy ngẫu nhiên *1 bi* từ hộp đó. Tính xác suất lấy được *bi đỏ*.],
  [$P = 7/15$],
  loigiai: [
    #theory-box[
      *Phân hoạch không gian trạng thái* theo hộp được chọn:

      - $H_1$ = "chọn Hộp I": $P(H_1) = 1/2$, $P("đỏ"|H_1) = 3/5.$
      - $H_2$ = "chọn Hộp II": $P(H_2) = 1/2$, $P("đỏ"|H_2) = 2/6 = 1/3.$

      *Xác suất toàn phần:*
      $
        P("đỏ") = P(H_1) dot P("đỏ"|H_1) + P(H_2) dot P("đỏ"|H_2)
        = 1/2 dot 3/5 + 1/2 dot 1/3
        = 3/10 + 1/6
        = 9/30 + 5/30 = 14/30 = 7/15.
      $
    ]
    #block(fill: rgb("E8F5E9"), stroke: 0.5pt + c-green, radius: 4pt, inset: (x: 12pt, y: 8pt))[
      *Đáp án: $P = 7/15.$*
      Framework: Phân hoạch → Gán trọng số theo nhánh → Cộng trọng số (xác suất toàn phần).
    ]
  ],
)

#v(0.6em)

#tln(
  id: "ST-V3",
  [Hộp có *3 bi đỏ* và *5 bi xanh*. Lấy lần lượt *2 bi không hoàn lại*. Biết rằng *bi thứ nhất màu đỏ*, tính xác suất để *bi thứ hai cũng màu đỏ*.],
  [$P = 2/7$],
  loigiai: [
    #theory-box[
      *Gọi:* $D_1$ = "bi 1 đỏ", $D_2$ = "bi 2 đỏ".

      Cần tính $P(D_2 | D_1)$.

      *Cách 1 — Trực tiếp:* Sau khi lấy 1 bi đỏ, hộp còn *2 bi đỏ* và *5 bi xanh* (tổng 7 bi).

      $P(D_2 | D_1) = 2/7.$

      *Cách 2 — Công thức:*
      $
        P(D_2 | D_1) = frac(P(D_1 inter D_2), P(D_1))
        = frac(3/8 dot 2/7, 3/8) = 2/7.
      $
    ]
    #block(fill: rgb("E8F5E9"), stroke: 0.5pt + c-green, radius: 4pt, inset: (x: 12pt, y: 8pt))[
      *Đáp án: $P = 2/7.$*
      Framework: Lọc trạng thái (biết $D_1$) → Thu hẹp không gian mẫu → Tính lại xác suất trong không gian mới.
    ]
  ],
)

#v(0.8em)

// ─── CẤP 4: VẬN DỤNG CAO ────────────────────────────────────

== Cấp 4 — Vận Dụng Cao

#insight-box[*Kỹ năng cần có:* Bài toán sắp xếp có ràng buộc phức tạp và đếm dãy bằng tư duy chuyển trạng thái (DP). Đây là các dạng thường gặp trong câu phân loại đề thi THPT.]

#v(0.4em)

#tln(
  id: "ST-VC1",
  [Xếp ngẫu nhiên *4 nam* và *3 nữ* thành một *hàng ngang*. Tính xác suất để *không có 2 nữ nào đứng cạnh nhau*.],
  [$P = 2/7$],
  loigiai: [
    #theory-box[
      *Không gian mẫu:* Tất cả hoán vị của 7 người.
      $|Omega| = 7! = 5040.$

      *Đếm kết quả thuận lợi* (không có 2 nữ kề nhau):

      *Bước 1:* Xếp 4 nam tùy ý: $4! = 24$ cách.

      *Bước 2:* 4 nam tạo ra $5$ khe hở (trước, giữa, sau):
      $
        "underline(N)" quad "underline(N)" quad "underline(N)" quad "underline(N)"
        quad arrow.r quad
        \_ , N, \_, N, \_, N, \_, N, \_
      $
      Cần chọn $3$ khe trong $5$ khe và xếp $3$ nữ vào (có thứ tự):
      $A_5^3 = 5 times 4 times 3 = 60$ cách.

      *Số kết quả thuận lợi:* $24 times 60 = 1440.$

      $P = 1440/5040 = 2/7.$
    ]
    #block(fill: rgb("E8F5E9"), stroke: 0.5pt + c-green, radius: 4pt, inset: (x: 12pt, y: 8pt))[
      *Đáp án: $P = 2/7.$*
      Framework: Sinh trạng thái theo 2 giai đoạn → Quy tắc nhân → Chia cho toàn bộ không gian.
    ]
  ],
)

#v(0.6em)

#tln(
  id: "ST-VC2",
  [Đếm số dãy gồm *5 ký tự* lấy từ tập $\{0, 1, 2\}$ *(cho phép lặp)* sao cho *không có hai chữ số $0$ đứng liền nhau*.],
  [$164$ dãy],
  loigiai: [
    #theory-box[
      *Xây dựng máy trạng thái* (FSM):

      - $S_0$: ký tự vừa thêm là $0$.
      - $S_+$: ký tự vừa thêm là $1$ hoặc $2$ (khác $0$).

      *Quy tắc chuyển trạng thái:*
      - Từ $S_+$: thêm $0$ → $S_0$ (1 cách); thêm $1$ hoặc $2$ → $S_+$ (2 cách).
      - Từ $S_0$: thêm $0$ → *CẤM* ("00" xuất hiện); thêm $1$ hoặc $2$ → $S_+$ (2 cách).

      *Hệ truy hồi:*
      $
        f(k, S_0) & = f(k-1, S_+) times 1 \
        f(k, S_+) & = [f(k-1, S_0) + f(k-1, S_+)] times 2
      $

      *Điều kiện đầu* $(k = 1)$: $f(1, S_0) = 1$; $f(1, S_+) = 2$.

      *Bảng tính:*
    ]
    #align(center)[
      #table(
        columns: (auto,) + (auto,) * 5,
        stroke: 0.5pt + rgb("90CAF9"),
        fill: (x, y) => if y == 0 { c-navy } else if x == 0 { rgb("E3F2FD") } else if calc.odd(y) { white } else {
          rgb("F8F9FA")
        },
        inset: (x: 10pt, y: 6pt),
        align: center,
        table.header(
          text(fill: white, weight: "bold")[$k$],
          text(fill: white, weight: "bold")[1],
          text(fill: white, weight: "bold")[2],
          text(fill: white, weight: "bold")[3],
          text(fill: white, weight: "bold")[4],
          text(fill: white, weight: "bold")[5],
        ),
        [$f(k, S_0)$], [1], [2], [6], [16], [44],
        [$f(k, S_+)$], [2], [6], [16], [44], [120],
        [*Tổng*], [*3*], [*8*], [*22*], [*60*], [*164*],
      )
    ]
    #block(fill: rgb("E8F5E9"), stroke: 0.5pt + c-green, radius: 4pt, inset: (x: 12pt, y: 8pt))[
      *Đáp án: $164$ dãy.*

      *Kiểm tra:* $k=2$: $f(2,S_0)=f(1,S_+)=2$; $f(2,S_+)=(1+2) times 2=6$. ✓

      Framework: Chuyển trạng thái (DP) → Trạng thái đủ khi biết "ký tự cuối có phải $0$ không" → Hệ truy hồi → Bảng tính.
    ]
  ],
)

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN IX: LỖI SAI VÀ GỢI Ý SỬA CHỮA
// ═══════════════════════════════════════════════
= Phần IX — Lỗi Sai Thường Gặp và Cách Khắc Phục

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.2em,
  row-gutter: 0.9em,

  // Lỗi 1
  block(
    fill: rgb("FBE9E7"),
    stroke: (left: 4pt + c-amber, rest: 0.5pt + rgb("FFAB91")),
    radius: (right: 5pt),
    inset: (x: 13pt, y: 11pt),
    width: 100%,
  )[
    #text(fill: c-amber, weight: "bold")[⚠️ Lỗi 1: Nhầm Có Thứ Tự / Không Thứ Tự]

    #v(0.3em)
    *Biểu hiện:* Dùng $A_n^k$ khi bài hỏi chọn *nhóm*, dùng $C_n^k$ khi bài hỏi *sắp xếp*.

    *Ví dụ lỗi:* "Chọn 3 đại biểu từ 10 người — đáp án $A_(10)^3 = 720$."

    *Sửa theo framework:* Hỏi: "Hai kết quả {A,B,C} và {B,C,A} có phải cùng một *trạng thái* không?" → Nếu cùng (vai trò như nhau) → $C_(10)^3 = 120$.
  ],

  // Lỗi 2
  block(
    fill: rgb("FBE9E7"),
    stroke: (left: 4pt + c-amber, rest: 0.5pt + rgb("FFAB91")),
    radius: (right: 5pt),
    inset: (x: 13pt, y: 11pt),
    width: 100%,
  )[
    #text(fill: c-amber, weight: "bold")[⚠️ Lỗi 2: Đếm Trùng Trạng Thái]

    #v(0.3em)
    *Biểu hiện:* Cộng các trường hợp mà thực ra chồng chéo nhau.

    *Ví dụ lỗi:* P(A hoặc B) = P(A) + P(B) khi $A inter B != nothing$.

    *Sửa:* Vẽ sơ đồ Venn của không gian trạng thái. Các vùng chồng = trạng thái bị đếm hai lần → phải trừ đi.

    $P(A union B) = P(A) + P(B) - P(A inter B)$
  ],

  // Lỗi 3
  block(
    fill: rgb("FBE9E7"),
    stroke: (left: 4pt + c-amber, rest: 0.5pt + rgb("FFAB91")),
    radius: (right: 5pt),
    inset: (x: 13pt, y: 11pt),
    width: 100%,
  )[
    #text(fill: c-amber, weight: "bold")[⚠️ Lỗi 3: Quên Lọc Trong Điều Kiện]

    #v(0.3em)
    *Biểu hiện:* Tính $P(A inter B)$ thay vì $P(A | B)$.

    *Ví dụ lỗi:* "P(tổng = 10 | tổng > 7)" = P(tổng = 10) thay vì chia cho P(tổng > 7).

    *Sửa theo framework:* Khi có điều kiện, *lọc không gian trước*, sau đó tính xác suất trong không gian đã lọc. Mẫu số phải là $P(B)$ hay $|B|$, không phải $|Omega|$.
  ],

  // Lỗi 4
  block(
    fill: rgb("FBE9E7"),
    stroke: (left: 4pt + c-amber, rest: 0.5pt + rgb("FFAB91")),
    radius: (right: 5pt),
    inset: (x: 13pt, y: 11pt),
    width: 100%,
  )[
    #text(fill: c-amber, weight: "bold")[⚠️ Lỗi 4: Định Nghĩa Sai Trạng Thái DP]

    #v(0.3em)
    *Biểu hiện:* Trạng thái "chứa quá ít thông tin" nên không thể viết truy hồi.

    *Ví dụ lỗi:* Dãy nhị phân không "11", đặt trạng thái = "độ dài dãy" → không đủ (cần biết ký tự cuối).

    *Sửa:* Hỏi "Để quyết định bước tiếp theo, tôi cần biết thêm gì?" → thêm vào trạng thái đúng thứ thông tin đó.
  ],
)

#v(0.6em)

#warn-box[
  *Lỗi Tư Duy Sâu Xa Nhất:* Học sinh thấy bài toán mới → tìm xem "bài này giống dạng nào" → áp công thức → sai hoàn toàn nếu bài có ràng buộc tinh tế.

  *Điều trị:* Dạy học sinh hỏi *"Không gian trạng thái ở đây là gì?"* trước tiên, rồi mọi thứ khác sẽ tự nhiên theo.
]

// ═══════════════════════════════════════════════
// PHẦN X: HOẠT ĐỘNG LỚP HỌC
// ═══════════════════════════════════════════════
= Phần X — Hoạt Động Lớp Học

#activity-box(title: "🎓 Hoạt Động 1: 'Xây Không Gian Trạng Thái' (10 phút)")[
  *Dụng cụ:* Thẻ bài (hoặc tờ giấy cắt nhỏ). *Lớp:* 30-35 học sinh.

  *Tiến hành:* Giáo viên đặt câu hỏi: "Xếp 3 học sinh A, B, C vào 3 ghế — có bao nhiêu cách?"

  Mỗi học sinh viết *một cách xếp* lên thẻ, dán lên bảng. Lớp cùng đếm và kiểm tra có trùng lặp không. GV phân tích: đây là *không gian trạng thái* $Omega$, $|Omega| = A_3^3 = 6$.

  *Sau đó thêm điều kiện:* "A không được ngồi cạnh B." Học sinh *lọc bỏ* các thẻ vi phạm. Còn lại bao nhiêu?

  *Kết thúc:* GV tổng kết: "Đếm = đầy đủ không gian. Điều kiện = lọc."
]

#v(0.5em)

#activity-box(title: "🎓 Hoạt Động 2: 'Cây Xác Suất Sống' (15 phút)")[
  *Dụng cụ:* 10 tờ giấy màu (6 đỏ, 4 xanh) trong túi. *Lớp:* nhóm 4 người.

  *Tiến hành:* GV rút 2 tờ (không hoàn lại). Mỗi nhóm *vẽ cây xác suất* trước khi rút.

  - Tầng 1: Lần rút 1 (2 nhánh: Đỏ/Xanh với xác suất ghi trên cành).
  - Tầng 2: Lần rút 2 (xác suất thay đổi vì không hoàn lại).

  Nhóm tính xác suất các sự kiện: "cả 2 đỏ", "đúng 1 đỏ", "ít nhất 1 xanh."

  *GV hỏi:* "Nếu tôi nói lần 1 là đỏ, cây thay đổi thế nào?" → Học sinh *lọc cây* bỏ nhánh xanh ở tầng 1.
]

#v(0.5em)

#activity-box(title: "🎓 Hoạt Động 3: 'DP Trên Bảng Trắng' (20 phút)")[
  *Tình huống:* Robot đi trên lưới $4 times 4$, chỉ đi phải hoặc xuống, không được đi qua ô (2,2).

  *Yêu cầu:* Học sinh *điền số đường đi* vào từng ô lưới (bắt đầu từ góc trên trái đến góc dưới phải).

  *Framework:* Trạng thái = tọa độ $(i, j)$. Chuyển: $(i,j) arrow.l (i-1,j) + (i,j-1)$. Ô cấm = trạng thái bị loại.

  *Kết thúc:* GV dẫn dắt: "Điền bảng này chính là DP — mỗi ô = một trạng thái, giá trị = số đường đến đó."
]

#v(0.5em)

#qopen[
  Hãy thiết kế một bài toán tổ hợp/xác suất mà câu hỏi "Không gian trạng thái là gì?" giúp học sinh *phân loại ngay* nên dùng quy tắc cộng hay nhân. Bài toán đó có thể dùng được ở tiết nào trong phân phối chương trình?
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN XI: BẢN ĐỒ TƯ DUY LỚN
// ═══════════════════════════════════════════════
= Phần XI — Bản Đồ Tư Duy Lớn: Toàn Bộ Chương Dưới Một Mái Nhà

#text(fill: c-slate, size: 10pt, style: "italic")[
  Sơ đồ dưới đây thể hiện *toàn bộ framework* dưới dạng cây node-edge phù hợp trực quan hóa bằng Typst/CeTZ. Mỗi node là một khái niệm, mỗi cạnh là một mối liên hệ.
]

#v(0.5em)

#align(center)[
  #cetz.canvas(length: 0.98cm, {
    import cetz.draw: *

    // ─── Trung tâm ───────────────────────────────────────────
    circle((0, 0), radius: 1.2, fill: c-navy, stroke: 3pt + rgb("90CAF9"), name: "omega")
    content((0, 0.3), text(fill: white, size: 9pt, weight: "bold")[Không Gian])
    content((0, -0.2), text(fill: white, size: 9pt, weight: "bold")[Trạng Thái Ω])
    content((0, -0.6), text(fill: rgb("90CAF9"), size: 7.5pt)[State Space])

    // ─── Nhánh 1: ĐẾM (trên) ────────────────────────────────
    circle((0, 4.8), radius: 0.85, fill: c-teal, stroke: 1.5pt + rgb("80CBC4"), name: "dem")
    content((0, 5.0), text(fill: white, size: 8.5pt, weight: "bold")[Đếm])
    content((0, 4.62), text(fill: rgb("B2DFDB"), size: 7pt)[= Sinh trạng thái])
    line("omega", "dem", stroke: 1.8pt + c-teal, mark: (end: "stealth", fill: c-teal, scale: 0.7))

    // Sub-nodes của ĐẾM
    let dem-subs = (
      (-2.8, 6.6, "Quy tắc
Cộng", rgb("E8F5E9"), c-teal),
      (0, 6.8, "Quy tắc
Nhân", rgb("E8F5E9"), c-teal),
      (2.8, 6.6, "C, A
$C_n^k, A_n^k$", rgb("E8F5E9"), c-teal),
    )
    for (x, y, lbl, fc, sc) in dem-subs {
      content(
        (x, y),
        [#text(size: 7pt)[#lbl]],
        name: "ds" + str(int(x * 10)),
        frame: "rect",
        padding: 4pt,
        fill: fc,
        stroke: 0.7pt + sc,
        radius: 3pt,
      )
      line("dem", "ds" + str(int(x * 10)), stroke: 1pt + sc, mark: (end: "stealth", fill: sc, scale: 0.55))
    }

    // ─── Nhánh 2: XÁC SUẤT (phải trên) ─────────────────────
    circle((4.5, 2.8), radius: 0.85, fill: rgb("004D40"), stroke: 1.5pt + rgb("80CBC4"), name: "xs")
    content((4.5, 3.0), text(fill: white, size: 8.5pt, weight: "bold")[Xác Suất])
    content((4.5, 2.6), text(fill: rgb("B2DFDB"), size: 7pt)[= Trọng số])
    line("omega", "xs", stroke: 1.8pt + rgb("00897B"), mark: (end: "stealth", fill: rgb("00897B"), scale: 0.7))

    let xs-subs = (
      (6.2, 4.1, "Cây XS
(Weighted)", rgb("E0F2F1"), rgb("004D40")),
      (6.5, 2.2, "Xác suất
cổ điển", rgb("E0F2F1"), rgb("004D40")),
      (5.0, 0.8, "Toàn phần
$sum P(A|B_i)P(B_i)$", rgb("E0F2F1"), rgb("004D40")),
    )
    for (x, y, lbl, fc, sc) in xs-subs {
      content(
        (x, y),
        [#text(size: 7pt)[#lbl]],
        name: "xs" + str(int(x * 10)),
        frame: "rect",
        padding: 3.5pt,
        fill: fc,
        stroke: 0.6pt + sc,
        radius: 3pt,
      )
      line("xs", "xs" + str(int(x * 10)), stroke: 0.9pt + sc, mark: (end: "stealth", fill: sc, scale: 0.5))
    }

    // ─── Nhánh 3: ĐIỀU KIỆN (phải dưới) ─────────────────────
    circle((4.5, -2.8), radius: 0.85, fill: rgb("01579B"), stroke: 1.5pt + rgb("81D4FA"), name: "dk")
    content((4.5, -2.6), text(fill: white, size: 8.5pt, weight: "bold")[Điều Kiện])
    content((4.5, -3.0), text(fill: rgb("B3E5FC"), size: 7pt)[= Lọc trạng thái])
    line("omega", "dk", stroke: 1.8pt + rgb("0288D1"), mark: (end: "stealth", fill: rgb("0288D1"), scale: 0.7))

    let dk-subs = (
      (6.3, -1.8, "$P(A|B)$
Có điều kiện", rgb("E1F5FE"), rgb("01579B")),
      (6.8, -3.2, "Bayes
(lọc ngược)", rgb("E1F5FE"), rgb("01579B")),
      (5.2, -4.8, "Inclusion-
Exclusion", rgb("E1F5FE"), rgb("01579B")),
    )
    for (x, y, lbl, fc, sc) in dk-subs {
      content(
        (x, y),
        [#text(size: 7pt)[#lbl]],
        name: "dk" + str(int(x * 10)),
        frame: "rect",
        padding: 3.5pt,
        fill: fc,
        stroke: 0.6pt + sc,
        radius: 3pt,
      )
      line("dk", "dk" + str(int(x * 10)), stroke: 0.9pt + sc, mark: (end: "stealth", fill: sc, scale: 0.5))
    }

    // ─── Nhánh 4: DP (trái dưới) ─────────────────────────────
    circle((-4.5, -2.8), radius: 0.85, fill: c-amber, stroke: 1.5pt + rgb("FFAB91"), name: "dp")
    content((-4.5, -2.6), text(fill: white, size: 8.5pt, weight: "bold")[DP])
    content((-4.5, -3.0), text(fill: rgb("FFE0B2"), size: 7pt)[= Chuyển trạng thái])
    line("omega", "dp", stroke: 1.8pt + c-amber, mark: (end: "stealth", fill: c-amber, scale: 0.7))

    let dp-subs = (
      (-6.8, -1.8, "FSM
Máy trạng thái", rgb("FBE9E7"), c-amber),
      (-6.8, -3.4, "Truy hồi
$f(n) = f(n-1)+...$", rgb("FBE9E7"), c-amber),
      (-5.2, -5.0, "Fibonacci &
Chuỗi đặc biệt", rgb("FBE9E7"), c-amber),
    )
    for (x, y, lbl, fc, sc) in dp-subs {
      content(
        (x, y),
        [#text(size: 7pt)[#lbl]],
        name: "dp" + str(int(x * 10 + 100)),
        frame: "rect",
        padding: 3.5pt,
        fill: fc,
        stroke: 0.6pt + sc,
        radius: 3pt,
      )
      line("dp", "dp" + str(int(x * 10 + 100)), stroke: 0.9pt + sc, mark: (end: "stealth", fill: sc, scale: 0.5))
    }

    // ─── Nhánh 5: HÀM SINH (trái trên) ──────────────────────
    circle((-4.5, 2.8), radius: 0.85, fill: c-violet, stroke: 1.5pt + rgb("CE93D8"), name: "hs")
    content((-4.5, 3.0), text(fill: white, size: 8.5pt, weight: "bold")[Hàm Sinh])
    content((-4.5, 2.6), text(fill: rgb("E1BEE7"), size: 7pt)[= Mã hóa])
    line("omega", "hs", stroke: 1.8pt + c-violet, mark: (end: "stealth", fill: c-violet, scale: 0.7))

    let hs-subs = (
      (-6.5, 4.2, "OGF
$G(x)=sum a_n x^n$", rgb("F3E5F5"), c-violet),
      (-7.0, 2.4, "Stars & Bars
Vách ngăn", rgb("F3E5F5"), c-violet),
      (-5.5, 0.8, "Đa thức nhân
Chu kỳ", rgb("F3E5F5"), c-violet),
    )
    for (x, y, lbl, fc, sc) in hs-subs {
      content(
        (x, y),
        [#text(size: 7pt)[#lbl]],
        name: "hs" + str(int(x * 10 + 200)),
        frame: "rect",
        padding: 3.5pt,
        fill: fc,
        stroke: 0.6pt + sc,
        radius: 3pt,
      )
      line("hs", "hs" + str(int(x * 10 + 200)), stroke: 0.9pt + sc, mark: (end: "stealth", fill: sc, scale: 0.5))
    }

    // ─── Nhánh 6: BIẾN CỐ ĐỐI (chính giữa phải) ────────────
    circle((1.2, -4.2), radius: 0.7, fill: rgb("37474F"), stroke: 1.2pt + rgb("B0BEC5"), name: "bcd")
    content((1.2, -4.0), text(fill: white, size: 7.5pt, weight: "bold")[Biến cố đối])
    content((1.2, -4.35), text(fill: rgb("CFD8DC"), size: 6.5pt)[= Bù trạng thái])
    line("omega", "bcd", stroke: 1.3pt + rgb("546E7A"), mark: (end: "stealth", fill: rgb("546E7A"), scale: 0.6))

    content(
      (2.8, -5.2),
      [#text(size: 7pt)["Ít nhất một..."
$P = 1 - P(overline(A))$]],
      name: "bcd-sub",
      frame: "rect",
      padding: 3pt,
      fill: rgb("ECEFF1"),
      stroke: 0.6pt + rgb("546E7A"),
      radius: 3pt,
    )
    line("bcd", "bcd-sub", stroke: 0.8pt + rgb("546E7A"), mark: (end: "stealth", fill: rgb("546E7A"), scale: 0.5))

    // ─── Mũi tên liên hệ giữa các nhánh ─────────────────────
    // DP ↔ Hàm sinh (qua hệ số)
    bezier(
      (-4.5, 1.95),
      (-4.5, -1.95),
      (-5.8, 0.8),
      (-5.8, -0.8),
      stroke: 0.8pt + rgb("BDBDBD"),
      mark: (end: "stealth", fill: rgb("BDBDBD"), scale: 0.55),
    )
    content((-6.2, 0), text(size: 7pt, fill: rgb("9E9E9E"))[GF của
truy hồi])

    // XS ↔ Điều kiện (Bayes)
    bezier(
      (4.5, 1.95),
      (4.5, -1.95),
      (5.8, 0.8),
      (5.8, -0.8),
      stroke: 0.8pt + rgb("BDBDBD"),
      mark: (end: "stealth", fill: rgb("BDBDBD"), scale: 0.55),
    )
    content((6.2, 0), text(size: 7pt, fill: rgb("9E9E9E"))[Bayes])
  })
]

#v(0.8em)

#align(center)[
  #block(
    fill: gradient.linear(rgb("071E3D"), rgb("0D47A1"), angle: 90deg),
    inset: (x: 2cm, y: 1.2cm),
    radius: 8pt,
    width: 90%,
  )[
    #text(fill: white, size: 12pt, weight: "bold")[
      Thông Điệp Cuối: Một Câu Hỏi Duy Nhất
    ]
    #v(0.5em)
    #text(fill: rgb("90CAF9"), size: 11pt)[
      Trước mỗi bài toán Tổ hợp – Xác suất, hãy dạy học sinh hỏi:
    ]
    #v(0.4em)
    #text(fill: rgb("FFE57F"), size: 15pt, weight: "black")[
      "Không gian trạng thái $Omega$ ở đây là gì?"
    ]
    #v(0.6em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      align: center,
      [
        #text(fill: rgb("A5D6A7"), size: 9pt)[
          *Nếu đếm $|Omega|$:*\ Dùng quy tắc cộng/nhân
        ]
      ],
      [
        #text(fill: rgb("80CBC4"), size: 9pt)[
          *Nếu gán trọng số:*\ Tính xác suất
        ]
      ],
      [
        #text(fill: rgb("FFAB91"), size: 9pt)[
          *Nếu lọc/chuyển:*\ Dùng điều kiện/DP
        ]
      ],
    )
  ]
]

#v(1em)

// ═══════════════════════════════════════════════
// PHỤ LỤC: HƯỚNG DẪN DỰNG HÌNH CETZ
// ═══════════════════════════════════════════════
= Phụ Lục — Hướng Dẫn Dựng Hình CeTZ Cho Các Sơ Đồ Trạng Thái

#theory-box[
  #text(fill: c-navy, size: 11pt, weight: "bold")[🛠 Các Pattern CeTZ Thường Dùng Cho Giáo Viên]
  #v(0.5em)

  *Pattern 1 — Node trạng thái (hình tròn có nhãn):*
  ```typst
  circle((x, y), radius: 0.6, fill: col, stroke: 1.5pt + border, name: "s0")
  content((x, y), text(fill: white, weight: "bold")[S0])
  ```

  *Pattern 2 — Mũi tên chuyển trạng thái (có nhãn):*
  ```typst
  line("s0", "s1", stroke: 1.3pt, mark: (end: "stealth", fill: black, scale: 0.75))
  content((midx, midy + 0.3), text(size: 8pt)[nhãn])
  ```

  *Pattern 3 — Vòng lặp tự thân (self-loop):*
  ```typst
  bezier((-0.4, 0.5), (0.4, 0.5), (-0.7, 1.3), (0.7, 1.3),
    stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.7))
  content((0, 1.1), text(size: 8pt)[nhãn])
  ```

  *Pattern 4 — Cây xác suất (dùng content với frame):*
  ```typst
  content((x, y), [nhãn], name: "n", frame: "circle",
    padding: 6pt, fill: col, stroke: 1pt + border)
  line("parent", "n", mark: (end: "stealth", fill: c-slate, scale: 0.65), stroke: 0.9pt)
  content((midx, midy), text(size: 8pt)[p])  // xác suất trên cạnh
  ```

  *Pattern 5 — Sơ đồ Venn (lọc trạng thái):*
  ```typst
  rect((x1,y1), (x2,y2), fill: col-omega, stroke: 1pt + c-slate, radius: 5pt)
  rect((a1,b1), (a2,b2), fill: col-event, stroke: 1.2pt + event-color, radius: 4pt)
  // Thêm text nhãn bằng content()
  ```
]

#v(0.5em)

#align(center)[
  #block(
    fill: rgb("ECEFF1"),
    stroke: 1pt + rgb("B0BEC5"),
    radius: 6pt,
    inset: (x: 1.5cm, y: 1cm),
    width: 80%,
  )[
    #text(fill: c-slate, size: 10pt)[
      *Chuyên đề này được soạn thảo bằng Typst + CeTZ 0.5.2.*

      Tất cả sơ đồ trong tài liệu đều là *mã nguồn Typst thực*,\
      có thể tái sử dụng, chỉnh sửa và hoạt hóa cho bài giảng.
    ]
  ]
]
