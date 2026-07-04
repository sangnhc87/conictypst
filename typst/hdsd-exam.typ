// ═══════════════════════════════════════════════════════════
// HƯỚNG DẪN SỬ DỤNG HỆ THỐNG ĐỀ THI  — sang-exam.typ
// Biên soạn: GV Nguyễn Văn Sang
// ═══════════════════════════════════════════════════════════
#import "sang-exam.typ": *
#import "bbt.typ": *
#import "math-sym.typ": *
#import "@preview/cetz:0.5.2"

// ── Bộ nhận diện HDSD ConicTypst ─────────────────────────
#let c-ink = rgb("#122033")
#let c-muted = rgb("#64748b")
#let c-blue = rgb("#0b5cad")
#let c-sky = rgb("#0ea5e9")
#let c-teal = rgb("#0f766e")
#let c-green = rgb("#16a34a")
#let c-amber = rgb("#f59e0b")
#let c-red = rgb("#dc2626")
#let c-purple = rgb("#7c3aed")
#let c-paper = rgb("#fbfcff")
#let c-soft-blue = rgb("#eaf3ff")
#let c-soft-green = rgb("#ecfdf5")
#let c-soft-amber = rgb("#fff7ed")
#let c-soft-purple = rgb("#f5f3ff")

// ── Trang và font ──────────────────────────────────────────
#set page(
  paper: "a4",
  margin: (x: 2.2cm, y: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      set text(size: 8.5pt, fill: c-muted)
      grid(
        columns: (1fr, auto),
        [#text(weight: "bold", fill: c-blue)[HDSD ConicTypst] #text(fill: c-muted)[· Sách hướng dẫn hệ thống Typst]],
        [#text(weight: "bold", fill: c-blue)[Trang #counter(page).display()]],
      )
      line(length: 100%, stroke: 0.6pt + c-blue.lighten(70%))
    }
  },
  footer: context {
    set text(size: 8pt, fill: c-muted)
    align(center)[GV Nguyễn Văn Sang · HDSD ConicTypst · #datetime.today().display("[day]/[month]/[year]")]
  },
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(leading: 0.8em, justify: true)
#set list(indent: 1em, body-indent: 0.5em)
#show: sang-setup

// ── Heading styles ──────────────────────────────────────────
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(
    width: 100%,
    above: 1.4em,
    below: 0.95em,
    fill: c-blue,
    stroke: 0.8pt + c-sky.lighten(35%),
    inset: 0pt,
    radius: 9pt,
    clip: true,
  )[
    #grid(
      columns: (auto, 1fr),
      align: (center + horizon, left + horizon),
      box(width: 44pt, height: 48pt, fill: c-sky)[
        #align(center + horizon)[#text(fill: white, size: 8.5pt, weight: "bold", tracking: 1pt)[HDSD]]
      ],
      block(width: 100%, inset: (x: 14pt, y: 11pt))[
        #text(fill: white, size: 15pt, weight: "bold")[#it.body]
        #v(0.2em)
        #line(length: 36%, stroke: 1.2pt + c-amber)
      ],
    )
  ]
}
#show heading.where(level: 2): it => block(
  width: 100%,
  above: 1.2em,
  below: 0.55em,
  fill: c-soft-blue,
  stroke: (left: 5pt + c-sky, bottom: 0.5pt + c-sky.lighten(60%)),
  inset: (left: 10pt, right: 10pt, y: 7pt),
  radius: (right: 5pt),
  text(fill: c-blue, size: 12.2pt, weight: "bold")[
    #it.body
  ],
)
#show heading.where(level: 3): it => block(
  above: 0.9em,
  below: 0.4em,
  stroke: (bottom: 0.5pt + c-purple.lighten(55%)),
  inset: (bottom: 3pt),
  text(fill: c-purple, size: 11pt, weight: "bold")[
    #text(fill: c-amber)[◆] #h(4pt)#it.body
  ],
)

// ── Macro tiện lợi cho HDSD ────────────────────────────────
// Hộp tham số
#let param(name, type-str, default: none, required: false, desc) = {
  block(
    width: 100%,
    above: 0.4em,
    below: 0.4em,
    stroke: (left: 4pt + if required { c-red } else { c-green }, rest: 0.5pt + luma(215)),
    inset: (left: 10pt, right: 10pt, y: 7pt),
    radius: (right: 5pt),
    fill: if required { rgb("#fff5f5") } else { c-soft-green },
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      [#text(weight: "bold", font: "Courier New", size: 10pt)[#name]
        #h(4pt)
        #if required {
          box(fill: c-red, inset: (x: 5pt, y: 1.5pt), radius: 999pt, text(fill: white, size: 8pt)[bắt buộc])
        } else {
          box(fill: c-green, inset: (x: 5pt, y: 1.5pt), radius: 999pt, text(fill: white, size: 8pt)[tuỳ chọn])
        }
        #if default != none { text(fill: luma(120), size: 9pt)[ · mặc định: #raw(default)] }
      ],
      [#text(fill: luma(50), size: 10pt)[#type-str] #h(6pt) #desc],
    )
  ]
}

// Hộp kết quả demo
#let demo-out(body) = block(
  width: 100%,
  above: 0.4em,
  below: 1em,
  stroke: 0.8pt + c-sky,
  inset: 0pt,
  radius: 7pt,
  fill: c-soft-blue,
  clip: true,
  breakable: false,
)[
  #block(width: 100%, fill: c-sky, inset: (x: 12pt, y: 5pt))[
    #text(size: 8pt, fill: white, weight: "bold", tracking: 1pt)[KẾT QUẢ HIỂN THỊ]
  ]
  #block(width: 100%, inset: (x: 12pt, y: 10pt))[#body]
]

// Hộp cảnh báo
#let caution(body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.5em,
  stroke: (left: 5pt + c-amber, rest: 0.5pt + c-amber.lighten(55%)),
  inset: (left: 11pt, right: 9pt, y: 7pt),
  radius: (right: 5pt),
  fill: c-soft-amber,
)[
  #text(weight: "bold", fill: c-amber.darken(15%))[Lưu ý] #h(5pt)#body
]

// Hộp gợi ý
#let tip(body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.5em,
  stroke: (left: 5pt + c-green, rest: 0.5pt + c-green.lighten(60%)),
  inset: (left: 11pt, right: 9pt, y: 7pt),
  radius: (right: 5pt),
  fill: c-soft-green,
)[
  #text(weight: "bold", fill: c-green.darken(8%))[Mẹo] #h(5pt)#body
]

#let cover-tag(body, fill: c-soft-blue, ink: c-blue) = box(
  fill: fill,
  inset: (x: 8pt, y: 3pt),
  radius: 999pt,
)[#text(fill: ink, size: 8pt, weight: "bold")[#body]]

#let cover-card(title, body, accent: c-blue) = block(
  width: 100%,
  fill: white,
  stroke: (left: 3pt + accent, rest: 0.6pt + accent.lighten(68%)),
  inset: (x: 9pt, y: 8pt),
  radius: 6pt,
)[
  #text(fill: accent, size: 10pt, weight: "bold")[#title]
  #v(0.25em)
  #text(fill: c-muted, size: 8.8pt)[#body]
]

// ══════════════════════════════════════════════════════════════════
//  BÌA
// ══════════════════════════════════════════════════════════════════
#set page(header: none, footer: none)
#place(top + left, dx: -2.2cm, dy: -2cm, rect(width: 21cm, height: 29.7cm, fill: c-paper))
#place(top + left, dx: -2.2cm, dy: -2cm, rect(
  width: 1.25cm,
  height: 29.7cm,
  fill: gradient.linear(c-blue.darken(18%), c-teal, dir: ttb),
))
#place(top + left, dx: -0.95cm, dy: -2cm, rect(
  width: 19.75cm,
  height: 8.7cm,
  fill: gradient.linear(c-blue, c-sky, dir: ltr),
))
#place(top + left, dx: 12.8cm, dy: -2cm, rect(
  width: 6cm,
  height: 8.7cm,
  fill: c-teal.transparentize(45%),
))
#place(top + left, dx: 15.6cm, dy: 0.65cm, rect(width: 2.8cm, height: 2.8cm, fill: c-amber, radius: 8pt))
#place(top + left, dx: 14.35cm, dy: 1.85cm, rect(width: 2.1cm, height: 2.1cm, fill: c-purple.transparentize(12%), radius: 6pt))
#place(top + left, dx: -1.78cm, dy: 1.05cm)[
  #rotate(-90deg)[#text(fill: white, size: 8pt, weight: "bold", tracking: 2pt)[HDSD CONICTYPST]]
]

#v(0.75cm)
#pad(left: 0.1cm, right: 0.1cm)[
  #cover-tag([HƯỚNG DẪN SỬ DỤNG], fill: white.transparentize(10%), ink: c-blue)
  #h(0.35cm)
  #cover-tag([PHIÊN BẢN ĐẦY ĐỦ], fill: c-amber, ink: white)
  #v(0.85cm)
  #text(fill: white, size: 30pt, weight: "bold")[Sách HDSD]
  #v(0.05cm)
  #text(fill: white, size: 22pt, weight: "bold")[hệ thống ConicTypst]
  #v(0.45cm)
  #text(fill: c-blue, size: 11.5pt, weight: "bold")[`sang-exam.typ` · đề thi · ngân hàng câu hỏi · BBT · web HDSD]
  #v(0.9cm)
  #grid(
    columns: (auto, auto, auto),
    gutter: 8pt,
    cover-tag([ID & tags], fill: c-soft-green, ink: c-green.darken(10%)),
    cover-tag([BBT/BXD], fill: c-soft-amber, ink: c-amber.darken(15%)),
    cover-tag([Typst params], fill: c-soft-purple, ink: c-purple),
  )
]

#v(2.05cm)
#block(width: 100%, inset: (x: 14pt, y: 14pt), radius: 8pt, fill: white, stroke: 0.6pt + c-blue.lighten(62%))[
  #text(fill: c-blue, size: 13pt, weight: "bold")[Bản đồ hệ thống trong một cuốn sách]
  #v(0.75em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    cover-card([Câu hỏi & lời giải], [`#tn`, `#ds`, `#tln`, `#tl`, đáp án, lời giải, ảnh, metadata.], accent: c-blue),
    cover-card([ID & ngân hàng], [Quy ước đặt ID, tags, bank.json, trộn đề và quản trị dữ liệu câu hỏi.], accent: c-green),
    cover-card([BBT, BXD, bảng], [`bbtv2`, `bbbt`, `bxd`, shade, ranks, hàng dấu và lỗi thường gặp.], accent: c-amber),
    cover-card([Typst nâng cao], [page, text, table, grid, figure, raw, màu sắc, import và tham số hệ thống.], accent: c-purple),
  )
]

#v(0.75cm)
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  block(width: 100%, fill: c-soft-blue, stroke: 0.6pt + c-blue.lighten(62%), inset: 12pt, radius: 7pt)[
    #text(fill: c-blue, weight: "bold")[Mục tiêu]
    #v(0.35em)
    #text(size: 9.5pt, fill: c-ink)[Người đọc mở sách là có thể tự soạn đề, sửa đề, quản lý ngân hàng câu hỏi và xuất bản PDF/web mà không cần đoán cú pháp.]
  ],
  block(width: 100%, fill: c-soft-green, stroke: 0.6pt + c-green.lighten(58%), inset: 12pt, radius: 7pt)[
    #text(fill: c-green.darken(8%), weight: "bold")[Tác giả]
    #v(0.35em)
    #text(size: 9.5pt, fill: c-ink)[GV Nguyễn Văn Sang \
    Cập nhật: #datetime.today().display("[day]/[month]/[year]")]
  ],
)

#v(0.65cm)
#line(length: 100%, stroke: 1pt + c-amber)
#v(0.25cm)
#align(center)[
  #text(size: 9.5pt, fill: c-muted)[Tài liệu mở, trình bày thẳng cú pháp thật, tham số thật và lỗi thật khi dùng hệ thống.]
]
#pagebreak()
#set page(
  header: context {
    if counter(page).get().first() > 1 {
      set text(size: 8.5pt, fill: c-muted)
      grid(
        columns: (1fr, auto),
        [#text(weight: "bold", fill: c-blue)[HDSD ConicTypst] #text(fill: c-muted)[· Sách hướng dẫn hệ thống Typst]],
        [#text(weight: "bold", fill: c-blue)[Trang #counter(page).display()]],
      )
      line(length: 100%, stroke: 0.6pt + c-blue.lighten(70%))
    }
  },
  footer: context {
    set text(size: 8pt, fill: c-muted)
    align(center)[GV Nguyễn Văn Sang · HDSD ConicTypst · #datetime.today().display("[day]/[month]/[year]")]
  },
)

// ── Mục lục ────────────────────────────────────────────────
#outline(title: [Mục lục], indent: 1.5em, depth: 2)
#pagebreak()

// ══════════════════════════════════════════════════════════════════
= Khởi động nhanh
// ══════════════════════════════════════════════════════════════════

== Cấu trúc file đề thi chuẩn

Mỗi file đề thi cần có đúng thứ tự:

```typst
// ① Import hệ thống
#import "../sang-exam.typ": *      // Hoặc import từ template.typ
#import "@preview/cetz:0.5.2"      // Nếu dùng hình vẽ cetz

// ② Cấu hình chế độ (thay đổi ở đây khi cần)
#let mode   = "dethi"        // "dethi" | "loigiai" | "solcolor"
#let accent = classic.blue   // classic.blue | classic.emerald | classic.crimson

// ③ Tạo bộ macro câu hỏi
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ④ Áp show rules (phân số display, màu toán, list spacing)
#show: sang-setup               // hoặc sang-setup.with(math-color: accent)

// ⑤ Tiêu đề đề thi (tuỳ chọn)
#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "TỈNH ...",
  exam-title: "KỲ THI THỬ ...",
  subject: "TOÁN",
  duration: "90 phút",
  code: "001",
)

// ⑥ Phần thi
#exam-part([PHẦN I. Trắc nghiệm nhiều phương án], count: 12)

// ⑦ Các câu hỏi...
#tn(...) #ds(...) #tln(...) #tl(...)
```

#demo-out[
  #grid(
    columns: (1fr, 1fr),
    align: center,
    [*SỞ GIÁO DỤC VÀ ĐÀO TẠO*\ *TỈNH ...*],
    [*KỲ THI THỬ ...*\ *Môn: TOÁN*]
  )
  #align(center)[_Thời gian làm bài: 90 phút_\ Mã đề: 001]
  #v(1em)
  #exam-part([PHẦN I. Trắc nghiệm nhiều phương án], count: 12)
  
  #let em = exam-mode(mode: "dethi", accent: classic.blue)
  #(em.tn)(
    [Hàm số $y = x^3 - 3x$ nghịch biến trên khoảng nào?],
    ([$(-oo;-1)$], True([$(-1;1)$]), [$(1;+oo)$], [$RR$]),
  )
]

== Ba chế độ hiển thị

#table(
  columns: (auto, 1fr, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 8pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*`mode`*], [*Hiển thị*], [*Dùng khi*],
  [`"dethi"`], [Câu hỏi thuần, không đáp án, ô trống trắc nghiệm ngắn], [In đề cho học sinh],
  [`"loigiai"`], [Câu hỏi + lời giải đầy đủ bên dưới, đáp án đúng tô sáng], [Soạn đáp án / tài liệu ôn],
  [`"solcolor"`], [Giống loigiai nhưng đáp án đúng tô màu nổi bật hơn], [Đáp án nộp / chiếu trình chiếu],
)

#caution[Thay `mode = "loigiai"` và biên dịch lại — không cần sửa nội dung câu hỏi.]

// ══════════════════════════════════════════════════════════════════
= Câu trắc nghiệm nhiều phương án — `#tn(...)`
// ══════════════════════════════════════════════════════════════════

`#tn` là alias của `#mcq`. Tự động chọn số cột 1/2/4 tuỳ độ rộng của phương án.

== Cú pháp đầy đủ

```typst
#tn(
  [Nội dung đề bài],           // ① thân câu — bắt buộc
  (                            // ② tuple phương án — bắt buộc
    [$A$],
    True([$B$]),               // đánh dấu đáp án đúng
    [$C$],
    [$D$],
  ),
  loigiai: [Lời giải.],        // lời giải — hiện khi mode ≠ "dethi"
  fig: <hình vẽ>,              // hình vẽ bên cạnh / phía dưới đề bài
  fig-pos: "right",            // "right" | "left" | "center"
  fig-width: 35%,              // chiều rộng vùng hình
  cols: 0,                     // 0=tự động | 1 | 2 | 4 cột phương án
  lines: 0,                    // số dòng trắng cho HS tự làm
  num: auto,                   // ép số câu thủ công nếu cần
  prefix: "Câu",               // nhãn trước số câu
)
```

#demo-out[
  #let em_demo_1 = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em_demo_1.tn)(
    [Nội dung đề bài],
    ([$A$], True([$B$]), [$C$], [$D$]),
    loigiai: [Lời giải.],
  )
]

== Tham số chi tiết

#param("stem", "content", required: true)[Thân câu hỏi. Có thể chứa văn bản, công thức, bảng, hình trong inline.]
#param(
  "options",
  "tuple",
  required: true,
)[Bộ phương án. Phải là tuple `(A, B, C, D)`. Phương án đúng bọc bằng `True([...])`.]
#param(
  "loigiai:",
  "content",
  default: "none",
)[Lời giải đầy đủ. Chỉ hiện khi `mode = "loigiai"` hoặc `"solcolor"`. Có thể dùng `#ppgiai`, `#luuy`, `#meo` bên trong.]
#param("fig:", "canvas/content", default: "none")[Hình vẽ. Thường là `cetz.canvas(...)` hoặc nội dung Typst bất kỳ.]
#param(
  "fig-pos:",
  "string",
  default: "\"right\"",
)[Vị trí hình: `"right"` = bên phải đề bài · `"left"` = bên trái · `"center"` = căn giữa phía dưới đề bài.]
#param(
  "fig-width:",
  "relative",
  default: "35%",
)[Chiều rộng vùng hình. Giảm xuống `25%` nếu hình nhỏ, tăng lên `45%` nếu hình phức tạp.]
#param("cols:", "int", default: "0")[Số cột phương án. `0` = tự động (khuyên dùng). Đặt `2` hoặc `4` để ép số cột.]
#param("lines:", "int", default: "0")[Số dòng kẻ trống. Dùng khi muốn HS viết thêm tính toán phía dưới.]
#param("num:", "int|auto", default: "auto")[Số thứ tự câu. Mặc định tự tăng; đặt thủ công khi cần nhảy số.]

== Ví dụ 1 — câu đơn không hình

```typst
#tn(
  [Đạo hàm của hàm số $f(x) = x^3 - 3x + 1$ tại $x = 2$ bằng],
  ([$3$], [$9$], True([$9$]), [$-3$]),
  loigiai: [
    $f'(x) = 3x^2 - 3 => f'(2) = 12 - 3 = 9$.
  ],
)
```

#demo-out[
  #let em1 = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em1.tn)(
    [Đạo hàm của hàm số $f(x) = x^3 - 3x + 1$ tại $x = 2$ bằng],
    ([$3$], [$6$], True([$9$]), [$-3$]),
    loigiai: [$f'(x) = 3x^2 - 3 => f'(2) = 12 - 3 = 9$.],
  )
]

== Ví dụ 2 — câu có hình bên phải (phổ biến nhất)

```typst
#tn(
  [Đồ thị bên có bao nhiêu cực trị?],
  ([$0$], [$1$], True([$2$]), [$3$]),
  fig: cetz.canvas(length: 0.7cm, {
    import cetz.draw: *
    // ... vẽ đồ thị ở đây ...
  }),
  fig-pos: "right",    // mặc định, có thể bỏ qua
  fig-width: 38%,
  loigiai: [Quan sát đồ thị: hàm có 2 cực trị.],
)
```

#demo-out[
  #let em3 = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em3.tn)(
    [Đồ thị bên có bao nhiêu cực trị?],
    ([$0$], [$1$], True([$2$]), [$3$]),
    fig: cetz.canvas(length: 0.7cm, {
      import cetz.draw: *
      line((-2.2, 0), (2.2, 0), mark: (end: ">"))
      line((0, -1.5), (0, 2), mark: (end: ">"))
      content((2.2, 0.3), $x$)
      content((0.3, 2), $y$)
      let pts = ()
      for i in range(-21, 21) {
        let x = i * 0.1
        let y = -x * x * x / 3 + x
        if y >= -1.5 and y <= 2 { pts.push((x, y)) }
      }
      line(..pts, stroke: 1.5pt + blue)
      circle((-1, 2 / 3), radius: 2.5pt, fill: red)
      circle((1, -2 / 3), radius: 2.5pt, fill: red)
    }),
    fig-width: 38%,
    loigiai: [Quan sát đồ thị: hàm có 2 cực trị (1 cực đại, 1 cực tiểu).],
  )
]

== Ví dụ 3 — hình phía dưới đề bài (`fig-pos: "center"`)

```typst
#tn(
  [Hình dưới đây mô tả đồ thị hàm số nào?],
  ([$y=x^2$], True([$y=x^3$]), [$y=1/x$], [$y=sqrt(x)$]),
  fig: cetz.canvas(...),
  fig-pos: "center",  // ← hình xuất hiện DƯỚI đề bài, căn giữa
  fig-width: 60%,     // fig-width không dùng khi fig-pos="center"
)
```

#tip[Dùng `fig-pos: "center"` khi hình to, chiếm nhiều chiều ngang; dùng `"right"` hoặc `"left"` khi hình nhỏ để tiết kiệm không gian.]

== Ví dụ 4 — Tích phân (Trích ngân hàng Giải tích 12)

```typst
#tn(
  [Tính tích phân $I = integral_0^(pi/2) cos x dif x$.],
  ([$-1$], True([$1$]), [$0$], [$pi/2$]),
  loigiai: [
    Áp dụng Newton--Leibniz:
    $ I = integral_0^(pi/2) cos x dif x = sin x |_0^(pi/2) = sin(pi/2) - sin(0) = 1 - 0 = 1. $
  ],
)
```

#demo-out[
  #let em_tn_real = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em_tn_real.tn)(
    [Tính tích phân $I = integral_0^(pi/2) cos x dif x$.],
    ([$-1$], True([$1$]), [$0$], [$pi/2$]),
    loigiai: [
      Áp dụng Newton--Leibniz:
      $ I = integral_0^(pi/2) cos x dif x = sin x |_0^(pi/2) = sin(pi/2) - sin(0) = 1 - 0 = 1. $
    ],
  )
]



== Ví dụ 5 — Tùy biến hiển thị phương án (Số cột & Khoanh tròn / Không khoanh tròn)

Hệ thống cung cấp các tham số để tùy biến cách hiển thị 4 phương án lựa chọn của câu hỏi trắc nghiệm `#tn`:
1. **Số cột phương án (`cols`)**:
   - `cols: 0` (Mặc định): Hệ thống tự động tính toán độ dài các phương án để xếp vào 1, 2 hoặc 4 cột tối ưu nhất.
   - `cols: 1`: Ép buộc xếp các phương án thẳng đứng thành 1 cột.
   - `cols: 2`: Ép buộc chia các phương án thành 2 cột đều nhau.
   - `cols: 4`: Ép buộc dàn các phương án thành 4 cột nằm ngang.
2. **Kiểu nhãn lựa chọn (`opt-style`)**:
   - `opt-style: "plain"` (Mặc định): Hiển thị nhãn thường kèm dấu chấm dạng **A.**, **B.**, **C.**, **D.**
   - `opt-style: "circle"` hoặc `"circled"`: Tự động vẽ hình tròn bao quanh nhãn dạng **Ⓐ**, **Ⓑ**, **Ⓒ**, **Ⓓ**.

=== Mẫu 5.1 — Thiết lập khoanh tròn và ép 4 cột (`opt-style: "circle"`, `cols: 4`)
```typst
#tn(
  [Nghiệm của phương trình $log_2 x = 3$ là:],
  ([$x = 9$], [$x = 6$], True([$x = 8$]), [$x = 5$]),
  opt-style: "circle",
  cols: 4,
)
```
#demo-out[
  #let em_tn_circle = exam-mode(mode: "dethi", accent: classic.blue)
  #(em_tn_circle.tn)(
    [Nghiệm của phương trình $log_2 x = 3$ là:],
    ([$x = 9$], [$x = 6$], True([$x = 8$]), [$x = 5$]),
    opt-style: "circle",
    cols: 4,
  )
]

=== Mẫu 5.2 — Thiết lập không khoanh tròn và ép 2 cột (`opt-style: "plain"`, `cols: 2`)
```typst
#tn(
  [Giá trị lớn nhất của hàm số $y = -x^2 + 4x$ trên đoạn $[0; 3]$ bằng:],
  ([$3$], True([$4$]), [$0$], [$2$]),
  opt-style: "plain",
  cols: 2,
)
```
#demo-out[
  #let em_tn_plain = exam-mode(mode: "dethi", accent: classic.blue)
  #(em_tn_plain.tn)(
    [Giá trị lớn nhất của hàm số $y = -x^2 + 4x$ trên đoạn $[0; 3]$ bằng:],
    ([$3$], True([$4$]), [$0$], [$2$]),
    opt-style: "plain",
    cols: 2,
  )
]

=== Mẫu 5.3 — Ép buộc hiển thị 1 cột đứng (`cols: 1`)
```typst
#tn(
  [Phát biểu nào sau đây là sai khi nói về thể tích khối đa diện?],
  (
    [Thể tích khối lăng trụ bằng diện tích đáy nhân chiều cao.],
    [Thể tích khối chóp bằng một phần ba diện tích đáy nhân chiều cao.],
    True([Thể tích khối hộp chữ nhật bằng tổng độ dài ba kích thước.]),
    [Thể tích của hai khối đa diện bằng nhau nếu chúng bằng nhau.]
  ),
  cols: 1,
)
```
#demo-out[
  #let em_tn_cols1 = exam-mode(mode: "dethi", accent: classic.blue)
  #(em_tn_cols1.tn)(
    [Phát biểu nào sau đây là sai khi nói về thể tích khối đa diện?],
    (
      [Thể tích khối lăng trụ bằng diện tích đáy nhân chiều cao.],
      [Thể tích khối chóp bằng một phần ba diện tích đáy nhân chiều cao.],
      True([Thể tích khối hộp chữ nhật bằng tổng độ dài ba kích thước.]),
      [Thể tích của hai khối đa diện bằng nhau nếu chúng bằng nhau.]
    ),
    cols: 1,
  )
]

== Ví dụ 6 — Trắc nghiệm 4 phương án là 4 hình vẽ (`opt-fig`)

Khi phương án trả lời là các hình vẽ lớn, bạn cần sử dụng `opt-fig: true` và `cols: 2` (hoặc 4) để các hình vẽ được tự động dàn trang vào lưới ảnh đẹp mắt mà không bị vỡ bố cục inline thông thường.

```typst
#tn(
  [Đồ thị nào sau đây biểu diễn hàm số $y = x^3 - 3x$?],
  (
    cetz.canvas(length: 0.5cm, { import cetz.draw: *; circle((0,0), radius: 1) }),
    True(cetz.canvas(length: 0.5cm, { import cetz.draw: *; rect((0,0), (1,1)) })),
    cetz.canvas(length: 0.5cm, { import cetz.draw: *; line((0,0), (1,1)) }),
    cetz.canvas(length: 0.5cm, { import cetz.draw: *; circle((0,0), radius: 0.5) })
  ),
  opt-fig: true,
  cols: 2,
  loigiai: [Đây là ví dụ minh hoạ, phương án đúng được khoanh đỏ.]
)
```

#demo-out[
  #let em_tn_fig = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em_tn_fig.tn)(
    [Đồ thị nào sau đây biểu diễn hàm số $y = x^3 - 3x$?],
    (
      cetz.canvas(length: 0.5cm, { import cetz.draw: *; circle((0,0), radius: 1) }),
      True(cetz.canvas(length: 0.5cm, { import cetz.draw: *; rect((0,0), (1,1)) })),
      cetz.canvas(length: 0.5cm, { import cetz.draw: *; line((0,0), (1,1)) }),
      cetz.canvas(length: 0.5cm, { import cetz.draw: *; circle((0,0), radius: 0.5) })
    ),
    opt-fig: true,
    cols: 2,
    loigiai: [Mỗi phương án là một hình vẽ (sử dụng cetz.canvas). `opt-fig: true` giúp dàn trang đều.]
  )
]

== Ví dụ 7 — Câu hỏi kèm dòng kẻ nháp tự vẽ (`lines`)

Dùng `lines: 4` để tạo ra 4 dòng kẻ chấm chấm cho học sinh tự điền nháp (chỉ xuất hiện ở chế độ `dethi`).

```typst
#tn(
  [Giải phương trình $2x - 4 = 0$.],
  ([$x = 1$], True([$x = 2$]), [$x = 3$], [$x = 4$]),
  lines: 4,
)
```

#demo-out[
  #let em_tn_boxed = exam-mode(mode: "dethi", accent: classic.blue)
  #(em_tn_boxed.tn)(
    [Giải phương trình $2x - 4 = 0$.],
    ([$x = 1$], True([$x = 2$]), [$x = 3$], [$x = 4$]),
    lines: 4,
  )
]

== Ví dụ 8 — Đồ thị hàm số trùng phương bậc 4 (Trích đề thi thực tế)

Ví dụ dưới đây thể hiện cách vẽ hệ trục tọa độ $O x y$, các nét đứt cực trị và đường cong đồ thị mịn bằng cách chạy vòng lặp trong `cetz.canvas`, sau đó đặt vào tham số `fig:` của `#tn` với vị trí bên phải (`fig-pos: "right"`).

```typst
#tn(
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-2.2, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.2, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -0.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.15, -0.15), $O$)
    
    // Đường nét đứt cực trị
    line((-1, 0), (-1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1, 0), (1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 2), (1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Nhãn trục
    content((-1, -0.25), $-1$)
    content((1, -0.25), $1$)
    content((-0.25, 2.0), $2$, anchor: "east")
    content((0.2, 0.8), $1$)
    
    // Đồ thị y = -x^4 + 2x^2 + 1
    let pts = ()
    for i in range(-16, 17) {
      let x = i / 10
      let y = -calc.pow(x, 4) + 2 * calc.pow(x, 2) + 1
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = f(x)$ có đồ thị là đường cong hình bên dưới. Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
  (
    [$(-1; 1)$],
    True([$(1; +oo)$]),
    [$(0; 1)$],
    [$(-1; +oo)$]
  ),
  loigiai: [
    #step[Dựa vào đồ thị hàm số, ta thấy trên các khoảng $(-1; 0)$ và $(1; +oo)$ đồ thị có hướng đi xuống từ trái sang phải. Do đó, hàm số nghịch biến trên các khoảng $(-1; 0)$ và $(1; +oo)$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)
```

#demo-out[
  #let em_real1 = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em_real1.tn)(
    dir: "doc",lines:0,
    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Vẽ hệ trục tọa độ
      line((-2.2, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt)
      content((2.2, 0), $x$, anchor: "north", padding: 2pt)
      line((0, -0.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
      content((0, 2.5), $y$, anchor: "west", padding: 2pt)
      content((0.15, -0.15), $O$)
      
      // Đường nét đứt cực trị
      line((-1, 0), (-1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
      line((1, 0), (1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
      line((-1, 2), (1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
      
      // Nhãn trục
      content((-1, -0.25), $-1$)
      content((1, -0.25), $1$)
      content((-0.25, 2.0), $2$, anchor: "east")
      content((0.2, 0.8), $1$)
      
      // Đồ thị y = -x^4 + 2x^2 + 1
      let pts = ()
      for i in range(-16, 17) {
        let x = i / 10
        let y = -calc.pow(x, 4) + 2 * calc.pow(x, 2) + 1
        pts.push((x, y))
      }
      line(..pts, stroke: 1.2pt + blue)
    }),
    fig-pos: "right",
    fig-width: 32%,
    [Cho hàm số $y = f(x)$ có đồ thị là đường cong hình bên dưới. Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
    (
      [$(-1; 1)$],
      True([$(1; +oo)$]),
      [$(0; 1)$],
      [$(-1; +oo)$]
    ),
    loigiai: [
      Dựa vào đồ thị hàm số, ta thấy trên các khoảng $(-1; 0)$ và $(1; +oo)$ đồ thị có hướng đi xuống từ trái sang phải. Do đó, hàm số nghịch biến trên các khoảng $(-1; 0)$ và $(1; +oo)$.

      Kết luận: Chọn đáp án B.
    ]
  )
]

// ══════════════════════════════════════════════════════════════════
= Câu Đúng–Sai — `#ds(...)`
// ══════════════════════════════════════════════════════════════════

Câu hỏi gồm một thân chung và 4 phát biểu a/b/c/d, học sinh chọn Đúng/Sai cho từng phát biểu.

== Cú pháp đầy đủ

```typst
#ds(
  [Thân câu chung — nêu tình huống / bài toán / định nghĩa],
  (                           // ← tuple 4 phát biểu
    [Phát biểu a — SAI],
    True([Phát biểu b — ĐÚNG]),
    True([Phát biểu c — ĐÚNG]),
    [Phát biểu d — SAI],
  ),
  loigiai: [Phân tích từng ý.],
  fig: none,
  fig-pos: "right",
  fig-width: 30%,
  lines: 0,
  num: auto,
  prefix: "Câu",
  boxed: false,
)
```

#demo-out[
  #let em_demo_2 = exam-mode(mode: "loigiai", accent: classic.emerald)
  #(em_demo_2.ds)(
    [Thân câu chung — nêu tình huống / bài toán / định nghĩa],
    (
      [Phát biểu a — SAI],
      True([Phát biểu b — ĐÚNG]),
      True([Phát biểu c — ĐÚNG]),
      [Phát biểu d — SAI],
    ),
    loigiai: [Phân tích từng ý.],
  )
]

== Tham số chi tiết

#param(
  "stem",
  "content",
  required: true,
)[Thân câu dùng chung cho tất cả phát biểu. Thường nêu bối cảnh, bài toán, hoặc cho đồ thị/bảng số liệu.]
#param(
  "statements",
  "tuple",
  required: true,
)[Tuple gồm 4 phát biểu. Phát biểu *đúng* bọc bằng `True([...])`, phát biểu *sai* để nguyên `[...]`.]
#param(
  "loigiai:",
  "content",
  default: "none",
)[Lời giải phân tích từng phát biểu. Nên dùng danh sách `- *Ý a) Đúng/Sai.* ...` để rõ ràng.]
#param("fig:", "canvas/content", default: "none")[Hình vẽ. Đặt bên cạnh thân câu hoặc phía dưới. Giống `#tn`.]
#param("fig-pos:", "string", default: "\"right\"")[Vị trí hình: `"right"` | `"left"` | `"center"`.]
#param("fig-width:", "relative", default: "30%")[Chiều rộng vùng hình.]

== Ví dụ — câu Đúng–Sai có phân tích

```typst
#ds(
  [Cho $f(x) = x^2 - 2x + 3$ trên $[-1; 3]$. Xét tính đúng/sai:],
  (
    [Hàm số đạt cực tiểu tại $x = 1$.],
    True([Giá trị nhỏ nhất của hàm số trên đoạn là $2$.]),
    [Hàm số nghịch biến trên $(1; 3)$.],
    True([Phương trình $f(x) = 3$ có nghiệm trên $[-1; 3]$.]),
  ),
  loigiai: [
    - *Ý a) Đúng.* $f'(x)=2x-2=0 => x=1$, $f''(1)=2>0$ → cực tiểu.
    - *Ý b) Đúng.* $f(1) = 1 - 2 + 3 = 2$.
    - *Ý c) Sai.* Hàm đồng biến trên $(1;3)$ vì $f'(x)>0$ ở đó.
    - *Ý d) Đúng.* $f(0)=3$ là nghiệm.
  ],
)
```

#demo-out[
  #let em2 = exam-mode(mode: "loigiai", accent: classic.emerald)
  #(em2.ds)(
    [Cho $f(x) = x^2 - 2x + 3$ trên $[-1; 3]$. Xét tính đúng/sai:],
    (
      [Hàm số đạt cực tiểu tại $x = 1$.],
      True([Giá trị nhỏ nhất của hàm số trên đoạn là $2$.]),
      [Hàm số nghịch biến trên $(1; 3)$.],
      True([Phương trình $f(x) = 3$ có nghiệm trên $[-1; 3]$.]),
    ),
    loigiai: [
      - *Ý a) Đúng.* $f'(x)=2x-2=0 => x=1$, $f''(1)=2>0$ → cực tiểu tại $x=1$.
      - *Ý b) Đúng.* $f_min = f(1) = 1 - 2 + 3 = 2$.
      - *Ý c) Sai.* Hàm đồng biến trên $(1;3)$ vì $f'(x)>0$ ở đó.
      - *Ý d) Đúng.* $f(0) = 3$ → $x=0$ là nghiệm trên $[-1;3]$.
    ],
  )
]


== Ví dụ 3 — Đúng-Sai dạng Danh sách không bảng (`ds-style: "list"`)

Mặc định, câu Đúng-Sai được hiển thị dưới dạng bảng có các cột Đ/S để học sinh đánh dấu tick. 
Nếu bạn muốn hiển thị dạng danh sách trơn (ví dụ trong đề thi tự luận có pha trắc nghiệm, hoặc dùng cho mục đích khác), sử dụng tham số `ds-style: "list"`.

```typst
#ds(
  [Xét tính đúng sai của các mệnh đề sau về phương trình $x^2 - 4 = 0$:],
  (
    [Phương trình vô nghiệm trên $RR$.],
    True([Phương trình có hai nghiệm phân biệt.]),
    True([Tổng hai nghiệm bằng $0$.]),
    [Nghiệm lớn nhất là $x = 4$.],
  ),
  ds-style: "list",
)
```

#demo-out[
  #let em_ds_list = exam-mode(mode: "dethi", accent: classic.emerald)
  #(em_ds_list.ds)(
    [Xét tính đúng sai của các mệnh đề sau về phương trình $x^2 - 4 = 0$:],
    (
      [Phương trình vô nghiệm trên $RR$.],
      True([Phương trình có hai nghiệm phân biệt.]),
      True([Tổng hai nghiệm bằng $0$.]),
      [Nghiệm lớn nhất là $x = 4$.],
    ),
    ds-style: "list",
  )
]

#demo-out[
  #let em_ds_list_ans = exam-mode(mode: "loigiai", accent: classic.emerald)
  #(em_ds_list_ans.ds)(
    [*(Chế độ lời giải sẽ hiện [ĐÚNG]/[SAI])* Xét tính đúng sai của các mệnh đề sau về phương trình $x^2 - 4 = 0$:],
    (
      [Phương trình vô nghiệm trên $RR$.],
      True([Phương trình có hai nghiệm phân biệt.]),
      True([Tổng hai nghiệm bằng $0$.]),
      [Nghiệm lớn nhất là $x = 4$.],
    ),
    ds-style: "list",
  )
]

== Ví dụ 4 — Câu hỏi trắc nghiệm Đúng - Sai tích phân (Trích đề thi thực tế)

Ví dụ thực tế dưới đây trích từ cuốn sách của bạn, hướng dẫn cách sử dụng cấu trúc `#ds` dạng bảng lưới mặc định để tạo câu hỏi trắc nghiệm Đúng - Sai.

```typst
#ds(
  [Cho hàm số $f(x)$ liên tục trên đoạn $[-1, 3]$ và thỏa mãn $integral_(-1)^1 f(x) d x = 4$, $integral_1^3 f(x) d x = 6$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Tích phân $integral_(-1)^3 f(x) d x$ có giá trị bằng $10$.]),
    [Tích phân $integral_3^1 f(x) d x$ có giá trị bằng $6$.],
    True([Tích phân $integral_(-1)^1 3 f(x) d x$ có giá trị bằng $12$.]),
    True([Tích phân $integral_(-1)^3 [f(x) - 2x] d x$ có giá trị bằng $2$.]),
  ),
  loigiai: [
    - a) *Đúng*. Theo tính chất cộng khoảng: $integral_(-1)^3 f(x) d x = integral_(-1)^1 f(x) d x + integral_1^3 f(x) d x = 4 + 6 = 10$.
    - b) *Sai*. Theo tính chất đổi cận: $integral_3^1 f(x) d x = -integral_1^3 f(x) d x = -6$.
    - c) *Đúng*. Theo tính chất hằng số: $integral_(-1)^1 3 f(x) d x = 3 integral_(-1)^1 f(x) d x = 3(4) = 12$.
    - d) *Đúng*. Ta có: $integral_(-1)^3 [f(x) - 2x] d x = integral_(-1)^3 f(x) d x - integral_(-1)^3 2x d x = 10 - [ x^2 ]_(-1)^3 = 10 - (9 - 1) = 2$.
  ]
)
```

#demo-out[
  #let em_real3 = exam-mode(mode: "loigiai", accent: classic.emerald)
  #(em_real3.ds)(
    [Cho hàm số $f(x)$ liên tục trên đoạn $[-1, 3]$ và thỏa mãn $integral_(-1)^1 f(x) d x = 4$, $integral_1^3 f(x) d x = 6$. Xét tính đúng sai của các khẳng định sau:],
    (
      True([Tích phân $integral_(-1)^3 f(x) d x$ có giá trị bằng $10$.]),
      [Tích phân $integral_3^1 f(x) d x$ có giá trị bằng $6$.],
      True([Tích phân $integral_(-1)^1 3 f(x) d x$ có giá trị bằng $12$.]),
      True([Tích phân $integral_(-1)^3 [f(x) - 2x] d x$ có giá trị bằng $2$.]),
    ),
    loigiai: [
      - a) *Đúng*. Theo tính chất cộng khoảng: $integral_(-1)^3 f(x) d x = integral_(-1)^1 f(x) d x + integral_1^3 f(x) d x = 4 + 6 = 10$.
      - b) *Sai*. Theo tính chất đổi cận: $integral_3^1 f(x) d x = -integral_1^3 f(x) d x = -6$.
      - c) *Đúng*. Theo tính chất hằng số: $integral_(-1)^1 3 f(x) d x = 3 integral_(-1)^1 f(x) d x = 3(4) = 12$.
      - d) *Đúng*. Ta có: $integral_(-1)^3 [f(x) - 2x] d x = integral_(-1)^3 f(x) d x - integral_(-1)^3 2x d x = 10 - [ x^2 ]_(-1)^3 = 10 - (9 - 1) = 2$.
    ]
  )
]

// ══════════════════════════════════════════════════════════════════
= Câu trả lời ngắn — `#tln(...)`
// ══════════════════════════════════════════════════════════════════

Học sinh điền vào 4 ô trống (chế độ đề thi) hoặc xem đáp án hiển thị (chế độ lời giải).

== Cú pháp đầy đủ

```typst
#tln(
  [Nội dung đề bài],           // ① thân câu — bắt buộc
  [$6$],                       // ② đáp án — bắt buộc
  loigiai: [Lời giải.],        // lời giải
  fig: <hình vẽ>,              // hình vẽ (cùng cú pháp tn/ds)
  fig-pos: "right",            // "right" | "left" | "center"
  fig-width: 30%,
  show-boxes: true,            // hiện 4 ô trống khi mode="dethi"
  lines: 0,                    // số dòng kẻ nếu cần chỗ tính
  box-count: 4,                // số ô trống (mặc định 4)
  num: auto,
  prefix: "Câu",
  boxed: false,
)
```

#demo-out[
  #let em_demo_3 = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em_demo_3.tln)(
    [Nội dung đề bài],
    [$6$],
    loigiai: [Lời giải.],
  )
]

== Vị trí hình trong `#tln`

Hình vẽ trong `#tln` hoạt động *giống hệt* `#tn`:

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 8pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*`fig-pos`*], [*Kết quả*],
  [`"right"` (mặc định)], [Hình ở *cột phải*, đề bài ở cột trái. 4 ô trống + đáp án nằm dưới đề bài.],
  [`"left"`], [Hình ở *cột trái*, đề bài ở cột phải.],
  [`"center"`], [Đề bài trước, hình xuất hiện *căn giữa phía dưới* đề bài, rồi mới đến 4 ô trống.],
)

== Tham số chi tiết

#param("stem", "content", required: true)[Thân câu hỏi.]
#param(
  "answer",
  "content",
  required: true,
)[Đáp án đúng. Hiển thị trong ô màu xanh khi `mode ≠ "dethi"`. Thường là biểu thức toán `[$6$]` hoặc văn bản `[Vô số nghiệm]`.]
#param("loigiai:", "content", default: "none")[Lời giải. Hiện phía dưới đáp án khi mode là loigiai/solcolor.]
#param("fig:", "canvas/content", default: "none")[Hình vẽ. Vị trí xác định bởi `fig-pos`.]
#param(
  "show-boxes:",
  "bool",
  default: "true",
)[Hiện 4 ô trống trong chế độ đề thi. Đặt `false` nếu không cần ô trống (ví dụ câu điền chữ).]
#param("box-count:", "int", default: "4")[Số ô trống. Thay đổi nếu đáp án có nhiều ký tự hơn.]
#param(
  "lines:",
  "int",
  default: "0",
)[Số dòng kẻ ngang để HS tính toán. Hữu ích cho câu trả lời ngắn dạng chứng minh ngắn.]

== Ví dụ 1 — câu trả lời ngắn đơn giản

```typst
#tln(
  [Giải phương trình $2x - 5 = 7$, tìm $x$.],
  [$6$],
  loigiai: [
    $2x = 7 + 5 = 12 => x = 6$.
  ],
)
```

#demo-out[
  #let em4 = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em4.tln)(
    [Giải phương trình $2x - 5 = 7$, tìm $x$.],
    [$6$],
    loigiai: [$2x = 7 + 5 = 12 => x = 6$.],
  )
]

== Ví dụ 2 — câu trả lời ngắn có hình bên phải

```typst
#tln(
  [Hình bên là đồ thị hàm số $y = f(x)$. Tìm số điểm cực trị.],
  [$2$],
  fig: cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    // ... vẽ đồ thị ...
  }),
  fig-pos: "right",   // hình bên PHẢI đề bài
  fig-width: 35%,
  loigiai: [Đồ thị có 1 cực đại và 1 cực tiểu → 2 cực trị.],
)
```

#caution[Hình (`fig:`) luôn đi kèm với *thân câu* (stem), không đi kèm đáp án. 4 ô trống/đáp án luôn nằm dưới stem+hình.]

== Ví dụ 3 — hình phía dưới, có dòng trống tính

```typst
#tln(
  [Tính diện tích hình phẳng giới hạn bởi $y = x^2$ và $y = x+2$.
   (Đơn vị: đơn vị diện tích)],
  [$9/2$],
  fig: cetz.canvas(...),
  fig-pos: "center",   // hình DƯỚI đề bài, căn giữa
  lines: 3,            // 3 dòng kẻ để tính toán
  loigiai: [
    Giao điểm: $x^2 = x+2 <=> x = -1; 2$.
    $S = integral_(-1)^2 (x+2-x^2) dif x = 9/2$.
  ],
)
```


== Ví dụ 4 — Bài toán thực tế (Trích ngân hàng Giải tích 12)

```typst
#tln(
  [Một nghệ nhân chế tác đôn đồng dạng khối tròn xoay, cao $40 " cm"$, đường kính trên-dưới $30 " cm"$, eo nhỏ nhất $24 " cm"$, mặt cắt qua trục là hai parabol đối xứng. Khối lượng riêng đồng $8960 " kg/m"^3$, giá $220 " nghìn đồng/kg"$, gia công $10 " triệu"$. Tổng chi phí (triệu đồng, làm tròn đến hàng phần mười)?],
  [$52,1$],
  loigiai: [
    Đường sinh parabol: $x = 3/400 y^2 + 12$, $y in [-20; 20]$.
    $V = 2pi integral_0^20 (3/400 y^2 + 12)^2 dif y = 6792pi " cm"^3$.
    $m = 8960 times 6792pi times 10^(-6) approx 191.45 " kg"$.
    Chi phí = $191.45 times 220 times 10^(-3) + 10 approx 52.1 " triệu"$.
  ],
)
```

#demo-out[
  #let em_tln_real = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em_tln_real.tln)(
    [Một nghệ nhân chế tác đôn đồng dạng khối tròn xoay, cao $40 " cm"$, đường kính trên-dưới $30 " cm"$, eo nhỏ nhất $24 " cm"$, mặt cắt qua trục là hai parabol đối xứng. Khối lượng riêng đồng $8960 " kg/m"^3$, giá $220 " nghìn đồng/kg"$, gia công $10 " triệu"$. Tổng chi phí (triệu đồng, làm tròn đến hàng phần mười)?],
    [$52,1$],
    loigiai: [
      Đường sinh parabol: $x = 3/400 y^2 + 12$, $y in [-20; 20]$.
      $V = 2pi integral_0^20 (3/400 y^2 + 12)^2 dif y = 6792pi " cm"^3$.
      $m = 8960 times 6792pi times 10^(-6) approx 191.45 " kg"$.
      Chi phí = $191.45 times 220 times 10^(-3) + 10 approx 52.1 " triệu"$.
    ],
  )
]


// ══════════════════════════════════════════════════════════════════
= Câu tự luận — `#tl(...)`
// ══════════════════════════════════════════════════════════════════

== Cú pháp đầy đủ

```typst
#tl(
  [Nội dung đề bài tự luận],   // ① thân câu — bắt buộc
  loigiai: [Lời giải mẫu.],    // lời giải — hiện khi mode ≠ "dethi"
  fig: <hình vẽ>,
  fig-pos: "right",
  fig-width: 30%,
  lines: 6,                    // dòng kẻ trống — mặc định 6
  num: auto,
  prefix: "Câu",
  boxed: false,
)
```

#demo-out[
  #let em_demo_4 = exam-mode(mode: "loigiai", accent: classic.crimson)
  #(em_demo_4.tl)(
    [Nội dung đề bài tự luận],
    loigiai: [Lời giải mẫu.],
  )
]

== Tham số chi tiết

#param("stem", "content", required: true)[Nội dung đề bài. Thường dài, có thể gồm nhiều phần a/b/c.]
#param("loigiai:", "content", default: "none")[Lời giải mẫu. Chỉ hiện khi `mode ≠ "dethi"`.]
#param(
  "lines:",
  "int",
  default: "6",
)[Số dòng kẻ trống. Đặt `0` để không có dòng kẻ (dùng khi in đề không cần chỗ viết).]
#param("fig:", "canvas/content", default: "none")[Hình vẽ minh hoạ bài toán.]

== Ví dụ — câu tự luận có lời giải từng bước dùng `#step`

```typst
#tl(
  [Cho hàm số $f(x) = x^3 - 3x^2 + 4$.
   a) Khảo sát sự biến thiên và vẽ đồ thị.
   b) Tìm $m$ để phương trình $f(x) = m$ có 3 nghiệm phân biệt.],
  lines: 8,
  loigiai: [
    #ppgiai[Dùng BBT để trả lời cả hai phần.]
    #step[Tính $f'(x) = 3x^2 - 6x = 3x(x-2)$. Cho $f'(x)=0 => x=0$ hoặc $x=2$.]
    #step[Lập bảng biến thiên: cực đại tại $x=0$: $f(0)=4$; cực tiểu tại $x=2$: $f(2)=0$.]
    #step[Câu b: $f(x)=m$ có 3 nghiệm phân biệt khi $0 < m < 4$.]
    #reset-step()
  ],
)
```

#demo-out[
  #let em5 = exam-mode(mode: "loigiai", accent: classic.crimson)
  #(em5.tl)(
    [Cho $f(x) = x^3 - 3x^2 + 4$. Tìm cực trị và khoảng $m$ để $f(x)=m$ có 3 nghiệm.],
    lines: 0,
    loigiai: [
      #ppgiai[Dùng đạo hàm và BBT.]
      #step[$f'(x) = 3x^2 - 6x = 3x(x-2) = 0 => x = 0$ hoặc $x = 2$.]
      #step[Cực đại: $f(0) = 4$. Cực tiểu: $f(2) = 0$.]
      #step[Phương trình $f(x)=m$ có 3 nghiệm phân biệt khi $0 < m < 4$.]
      #reset-step()
    ],
  )
]

== Ví dụ 2 — Bài toán tối ưu thực tế có hình vẽ và bảng cực trị (Trích đề thi thực tế)

Ví dụ nâng cao này trích từ cuốn sách Toán của bạn, hướng dẫn cách kết hợp câu hỏi tự luận `#tl` có hình vẽ minh họa bên phải bằng `canvas`, lời giải từng bước `#step`, và bảng biến thiên tối ưu chuyên dụng `#bbt-opt` từ thư viện `bbt.typ`.

```typst
#tl(
  fig: canvas(length: 0.9cm, {
    import draw: *
    // Vẽ bức tường
    line((0, 0), (0, 4), stroke: 2pt + rgb("555555"))
    for i in range(1, 9) {
      line((0, i * 0.5 - 0.2), (-0.4, i * 0.5 - 0.6), stroke: 0.5pt + rgb("555555"))
    }
    content((-0.8, 2), [*Bức tường*], angle: 90deg)

    // Vẽ hàng rào
    line((0, 3.5), (3, 3.5), (3, 0.5), (0, 0.5), stroke: 1.5pt + blue)

    // Nhãn kích thước
    content((1.5, 3.8), [$x$])
    content((1.5, 0.2), [$x$])
    content((3.8, 2), [$60 - 2x$])
    content((1.5, 2), [*Mảnh vườn*])
  }),
  fig-pos: "right",
  fig-width: 35%,
  [Một nhà vườn có $60$ m hàng rào để quây một mảnh đất hình chữ nhật sát một bức tường thẳng dài (không cần rào phía tường). Hỏi phải bố trí chiều dài, chiều rộng bao nhiêu để diện tích mảnh vườn là lớn nhất?],
  loigiai: [
    #step[Gọi $x$ (m) là chiều dài của cạnh hàng rào vuông góc với bức tường ($0 < x < 30$).]
    #step[Chiều dài cạnh song song với tường là $60 - 2x$ (m). Diện tích vườn là:
      $ S(x) = x(60 - 2x) = 60x - 2x^2 $]
    #step[Đạo hàm: $S'(x) = 60 - 4x = 0 <=> x = 15$.]
    #step[Bảng biến thiên tối ưu:]
    #align(center)[
      #bbt-opt(
        var: $x$, der: $S'$, func: $S$,
        x-vals: ($0$, $15$, $30$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $450$, $0$),
        is-min: false,
      )
    ]
    #step[Dựa vào bảng biến thiên, diện tích lớn nhất là $450$ m² đạt được tại $x = 15$ m.
      Chiều rộng là $15$ m, chiều dài là $30$ m.]
  ]
)
```

#demo-out[
  #let em_real4 = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em_real4.tl)(
    fig: canvas(length: 0.9cm, {
      import draw: *
      // Vẽ bức tường
      line((0, 0), (0, 4), stroke: 2pt + rgb("555555"))
      for i in range(1, 9) {
        line((0, i * 0.5 - 0.2), (-0.4, i * 0.5 - 0.6), stroke: 0.5pt + rgb("555555"))
      }
      content((-0.8, 2), [*Bức tường*], angle: 90deg)

      // Vẽ hàng rào
      line((0, 3.5), (3, 3.5), (3, 0.5), (0, 0.5), stroke: 1.5pt + blue)

      // Nhãn kích thước
      content((1.5, 3.8), [$x$])
      content((1.5, 0.2), [$x$])
      content((3.8, 2), [$60 - 2x$])
      content((1.5, 2), [*Mảnh vườn*])
    }),
    fig-pos: "right",
    fig-width: 35%,
    [Một nhà vườn có $60$ m hàng rào để quây một mảnh đất hình chữ nhật sát một bức tường thẳng dài (không cần rào phía tường). Hỏi phải bố trí chiều dài, chiều rộng bao nhiêu để diện tích mảnh vườn là lớn nhất?],
    loigiai: [
      #step[Gọi $x$ (m) là chiều dài của cạnh hàng rào vuông góc với bức tường ($0 < x < 30$).]
      #step[Chiều dài cạnh song song với tường là $60 - 2x$ (m). Diện tích vườn là:
        $ S(x) = x(60 - 2x) = 60x - 2x^2 $]
      #step[Đạo hàm: $S'(x) = 60 - 4x = 0 <=> x = 15$.]
      #step[Bảng biến thiên tối ưu:]
      #align(center)[
        #bbt-opt(
          var: $x$, der: $S'$, func: $S$,
          x-vals: ($0$, $15$, $30$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $450$, $0$),
          is-min: false,
        )
      ]
      #step[Dựa vào bảng biến thiên, diện tích lớn nhất là $450$ m² đạt được tại $x = 15$ m.
        Chiều rộng là $15$ m, chiều dài là $30$ m.]
    ]
  )
]

// ══════════════════════════════════════════════════════════════════
= Chèn hình vẽ — Tổng kết
// ══════════════════════════════════════════════════════════════════

== Ba vị trí có thể đặt hình

#table(
  columns: (auto, 1fr, auto),
  stroke: 0.5pt + luma(180),
  inset: 8pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*`fig-pos`*], [*Mô tả*], [*Khuyên dùng khi*],
  [`"right"`], [Hình ở cột phải, đề bài ở cột trái — 2 cột cạnh nhau], [Hình nhỏ–vừa, đề dài],
  [`"left"`], [Hình ở cột trái, đề bài ở cột phải — 2 cột cạnh nhau], [Muốn hình nổi bật trước],
  [`"center"`], [Hình căn giữa phía dưới đề bài — 1 cột dọc], [Hình to, đề ngắn],
)

== Nguồn hình vẽ hỗ trợ

```typst
// Cách 1: cetz canvas (phổ biến nhất)
fig: cetz.canvas(length: 1cm, {
  import cetz.draw: *
  circle((0,0), radius: 1.5)
  line((-2,0),(2,0), mark: (end: ">"))
  // ...
}),

// Cách 2: nội dung Typst thông thường
fig: image("../images/hinh-1.png", width: 100%),

// Cách 3: bảng số liệu hoặc content phức tạp
fig: table(columns: 3, [x], [0], [1], [y], [1], [3]),
```

#caution[`fig-width` chỉ có tác dụng khi `fig-pos` là `"right"` hoặc `"left"`. Khi `fig-pos: "center"`, hình chiếm toàn chiều ngang — dùng `width` bên trong canvas để thu nhỏ.]

== 10 Ví dụ thực chiến về Chèn hình & Đồ họa CeTZ

Dưới đây là tuyển tập 10 ví dụ minh họa chi tiết về mọi tình huống chèn hình ảnh, bản vẽ đồ học CeTZ trong đề thi và lời giải:

=== Ví dụ 1 — Hình vẽ bên phải trong câu hỏi (`fig-pos: "right"`)
```typst
#tn(
  [Cho hàm số bậc ba $y = f(x)$ có đồ thị như hình vẽ bên. Điểm cực tiểu của đồ thị hàm số là:],
  (True([$(1; -1)$]), [$(0; 1)$], [$(-1; 3)$], [$(2; 1)$]),
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    line((-2, 0), (3, 0), mark: (end: ">"))
    line((0, -2), (0, 3), mark: (end: ">"))
    content((2.8, -0.4), $x$)
    content((-0.4, 2.8), $y$)
    content((-0.3, -0.3), $O$)
    bezier((-1.8, -1.5), (-1, 1), (-1.4, 0.5), stroke: 1.2pt + blue)
    bezier((-1, 1), (1, -1), (-0.2, 1), (0.2, -1), stroke: 1.2pt + blue)
    bezier((1, -1), (1.8, 1.5), (1.4, -0.5), stroke: 1.2pt + blue)
    circle((1, -1), radius: 2pt, fill: red)
  }),
  fig-pos: "right",
  fig-width: 32%,
  loigiai: [Dựa vào đồ thị ta thấy điểm cực tiểu của đồ thị hàm số là $(1; -1)$. Chọn đáp án A.]
)
```
#demo-out[
  #tn(
    [Cho hàm số bậc ba $y = f(x)$ có đồ thị như hình vẽ bên. Điểm cực tiểu của đồ thị hàm số là:],
    (True([$(1; -1)$]), [$(0; 1)$], [$(-1; 3)$], [$(2; 1)$]),
    fig: cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      line((-2, 0), (3, 0), mark: (end: ">"))
      line((0, -2), (0, 3), mark: (end: ">"))
      content((2.8, -0.4), $x$)
      content((-0.4, 2.8), $y$)
      content((-0.3, -0.3), $O$)
      bezier((-1.8, -1.5), (-1, 1), (-1.4, 0.5), stroke: 1.2pt + blue)
      bezier((-1, 1), (1, -1), (-0.2, 1), (0.2, -1), stroke: 1.2pt + blue)
      bezier((1, -1), (1.8, 1.5), (1.4, -0.5), stroke: 1.2pt + blue)
      circle((1, -1), radius: 2pt, fill: red)
    }),
    fig-pos: "right",
    fig-width: 32%,
    loigiai: [Dựa vào đồ thị ta thấy điểm cực tiểu của đồ thị hàm số là $(1; -1)$. Chọn đáp án A.]
  )
]

=== Ví dụ 2 — Hình vẽ bên trái trong câu hỏi (`fig-pos: "left"`)
```typst
#tn(
  [Cho hình hộp chữ nhật $A B C D. A' B' C' D'$ như hình bên. Khẳng định nào sau đây đúng?],
  ([$A B || C' D'$], True([$A D || B' C'$]), [$A A' || C C'$], [$B D || B' D'$]),
  fig: cetz.canvas(length: 0.4cm, {
    import cetz.draw: *
    rect((0,0), (4,3), name: "front")
    let dx = 1.5; let dy = 1.2
    line((dx, dy+3), (dx+4, dy+3)) // top back
    line((dx+4, dy+3), (dx+4, dy)) // right back
    line((0,3), (dx, 3+dy))
    line((4,3), (4+dx, 3+dy))
    line((4,0), (4+dx, dy))
    
    // Nét đứt cho các cạnh khuất
    line((dx, dy), (4+dx, dy), stroke: (dash: "dashed"))
    line((dx, dy), (dx, 3+dy), stroke: (dash: "dashed"))
    line((0,0), (dx, dy), stroke: (dash: "dashed"))
  }),
  fig-pos: "left",
  fig-width: 30%,
  loigiai: [Ta có $A D || B C$ và $B C || B' C'$ nên $A D || B' C'$. Chọn B.]
)
```
#demo-out[
  #tn(
    [Cho hình hộp chữ nhật $A B C D. A' B' C' D'$ như hình bên. Khẳng định nào sau đây đúng?],
    ([$A B || C' D'$], True([$A D || B' C'$]), [$A A' || C C'$], [$B D || B' D'$]),
    fig: cetz.canvas(length: 0.4cm, {
      import cetz.draw: *
      rect((0,0), (4,3), name: "front")
      let dx = 1.5; let dy = 1.2
      line((dx, dy+3), (dx+4, dy+3))
      line((dx+4, dy+3), (dx+4, dy))
      line((0,3), (dx, 3+dy))
      line((4,3), (4+dx, 3+dy))
      line((4,0), (4+dx, dy))
      
      // Nét đứt cho các cạnh khuất
      line((dx, dy), (4+dx, dy), stroke: (dash: "dashed"))
      line((dx, dy), (dx, 3+dy), stroke: (dash: "dashed"))
      line((0,0), (dx, dy), stroke: (dash: "dashed"))
    }),
    fig-pos: "left",
    fig-width: 30%,
    loigiai: [Ta có $A D || B C$ và $B C || B' C'$ nên $A D || B' C'$. Chọn B.]
  )
]

=== Ví dụ 3 — Hình vẽ căn giữa dưới đề bài (`fig-pos: "center"`)
```typst
#tln(
  [Một hình nón có bán kính đáy $r = 3$ và chiều cao $h = 4$. Tính diện tích xung quanh của hình nón đó.],
  [$15 pi$],
  fig: cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    // Vẽ đáy elip: nửa sau nét đứt, nửa trước nét liền
    arc((2.5, 0), start: 0deg, stop: 180deg, radius: (2.5, 0.6), stroke: (dash: "dashed"))
    arc((-2.5, 0), start: 180deg, stop: 360deg, radius: (2.5, 0.6))
    
    line((0,4), (0,0), stroke: (dash: "dashed"))
    line((0,0), (2.5,0), stroke: (dash: "dashed"))
    line((0,4), (-2.5,0))
    line((0,4), (2.5,0))
    content((0.4, 2), $h=4$)
    content((1.2, 0.3), $r=3$)
  }),
  fig-pos: "center",
  loigiai: [Đường sinh $l = sqrt(r^2 + h^2) = sqrt(3^2 + 4^2) = 5$.
  Diện tích xung quanh: $S_(x q) = pi r l = pi dot 3 dot 5 = 15 pi$.]
)
```
#demo-out[
  #align(center)[
    #tln(
      [Một hình nón có bán kính đáy $r = 3$ và chiều cao $h = 4$. Tính diện tích xung quanh của hình nón đó.],
      [$15 pi$],
      fig: cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        // Vẽ đáy elip: nửa sau nét đứt, nửa trước nét liền
        arc((2.5, 0), start: 0deg, stop: 180deg, radius: (2.5, 0.6), stroke: (dash: "dashed"))
        arc((-2.5, 0), start: 180deg, stop: 360deg, radius: (2.5, 0.6))
        
        line((0,4), (0,0), stroke: (dash: "dashed"))
        line((0,0), (2.5,0), stroke: (dash: "dashed"))
        line((0,4), (-2.5,0))
        line((0,4), (2.5,0))
        content((0.4, 2), $h=4$)
        content((1.2, 0.3), $r=3$)
      }),
      fig-pos: "center",
      loigiai: [Đường sinh $l = sqrt(r^2 + h^2) = sqrt(3^2 + 4^2) = 5$.
      Diện tích xung quanh: $S_(x q) = pi r l = pi dot 3 dot 5 = 15 pi$.]
    )
  ]
]

=== Ví dụ 4 — Hình vẽ nằm trong Lời giải (`loigiai`) của câu hỏi
```typst
#tn(
  [Cho tam giác vuông tại $A$ có $A B = 3$ và $A C = 4$. Tính độ dài cạnh huyền $B C$.],
  ([$5$], [$6$], True([$5$]), [$7$]),
  loigiai: [
    Ta vẽ hình minh họa tam giác vuông:
    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        line((0,0), (4,0), (0,3), (0,0), stroke: 1.2pt)
        content((-0.3, -0.3), $A$)
        content((4.3, -0.3), $C$)
        content((-0.3, 3.3), $B$)
      })
    ]
    Theo định lý Pythagore: $B C = sqrt(A B^2 + A C^2) = sqrt(3^2 + 4^2) = 5$.
    Chọn đáp án C.
  ]
)
```
#demo-out[
  #tn(
    [Cho tam giác vuông tại $A$ có $A B = 3$ và $A C = 4$. Tính độ dài cạnh huyền $B C$.],
    ([$5$], [$6$], True([$5$]), [$7$]),
    loigiai: [
      Ta vẽ hình minh họa tam giác vuông:
      #align(center)[
        #cetz.canvas(length: 0.6cm, {
          import cetz.draw: *
          line((0,0), (4,0), (0,3), (0,0), stroke: 1.2pt)
          content((-0.3, -0.3), $A$)
          content((4.3, -0.3), $C$)
          content((-0.3, 3.3), $B$)
        })
      ]
      Theo định lý Pythagore: $B C = sqrt(A B^2 + A C^2) = sqrt(3^2 + 4^2) = 5$.
      Chọn đáp án C.
    ]
  )
]

=== Ví dụ 5 — Câu hỏi có 4 phương án, mỗi phương án chứa 1 hình vẽ riêng
```typst
#tn(
  [Đồ thị nào dưới đây biểu diễn một parabol đi qua gốc tọa độ?],
  (
    cetz.canvas(length: 0.3cm, {
      import cetz.draw: *
      line((-2,0), (2,0), mark: (end: ">"))
      line((0,-2), (0,2), mark: (end: ">"))
      bezier((-1.5, -1.8), (1.5, 1.8), (-0.5, 1.8), (0.5, -1.8), stroke: 1pt + blue)
    }),
    cetz.canvas(length: 0.3cm, {
      import cetz.draw: *
      line((-2,0), (2,0), mark: (end: ">"))
      line((0,-2), (0,2), mark: (end: ">"))
      bezier((-1.5, 1.8), (1.5, -1.8), (-0.5, -1.8), (0.5, 1.8), stroke: 1pt + red)
    }),
    cetz.canvas(length: 0.3cm, {
      import cetz.draw: *
      line((-2,0), (2,0), mark: (end: ">"))
      line((0,-2), (0,2), mark: (end: ">"))
      bezier((-1.5, 1.8), (1.5, 1.8), (-0.5, -1.8), (0.5, -1.8), stroke: 1pt + green)
    }),
    True(cetz.canvas(length: 0.3cm, {
      import cetz.draw: *
      line((-2,0), (2,0), mark: (end: ">"))
      line((0,-2), (0,2), mark: (end: ">"))
      bezier((-1.5, 1.5), (0,0), (-0.8, -0.5), stroke: 1pt + blue)
      bezier((0,0), (1.5, 1.5), (0.8, -0.5), stroke: 1pt + blue)
    }))
  ),
  opt-fig: true,
  cols: 2,
  loigiai: [Parabol đạt cực tiểu tại $(0;0)$ đi qua gốc tọa độ. Chọn D.]
)
```
#demo-out[
  #tn(
    [Đồ thị nào dưới đây biểu diễn một parabol đi qua gốc tọa độ?],
    (
      cetz.canvas(length: 0.3cm, {
        import cetz.draw: *
        line((-2,0), (2,0), mark: (end: ">"))
        line((0,-2), (0,2), mark: (end: ">"))
        bezier((-1.5, -1.8), (1.5, 1.8), (-0.5, 1.8), (0.5, -1.8), stroke: 1pt + blue)
      }),
      cetz.canvas(length: 0.3cm, {
        import cetz.draw: *
        line((-2,0), (2,0), mark: (end: ">"))
        line((0,-2), (0,2), mark: (end: ">"))
        bezier((-1.5, 1.8), (1.5, -1.8), (-0.5, -1.8), (0.5, 1.8), stroke: 1pt + red)
      }),
      cetz.canvas(length: 0.3cm, {
        import cetz.draw: *
        line((-2,0), (2,0), mark: (end: ">"))
        line((0,-2), (0,2), mark: (end: ">"))
        bezier((-1.5, 1.8), (1.5, 1.8), (-0.5, -1.8), (0.5, -1.8), stroke: 1pt + green)
      }),
      True(cetz.canvas(length: 0.3cm, {
        import cetz.draw: *
        line((-2,0), (2,0), mark: (end: ">"))
        line((0,-2), (0,2), mark: (end: ">"))
        bezier((-1.5, 1.5), (0,0), (-0.8, -0.5), stroke: 1pt + blue)
        bezier((0,0), (1.5, 1.5), (0.8, -0.5), stroke: 1pt + blue)
      }))
    ),
    opt-fig: true,
    cols: 2,
    loigiai: [Parabol đạt cực tiểu tại $(0;0)$ đi qua gốc tọa độ. Chọn D.]
  )
]

=== Ví dụ 6 — Vẽ nhiều hình ngang nhau bằng dịch tọa độ thủ công trong 1 CeTZ
```typst
#tn(
  [Cho hai đồ thị hàm số bậc nhất và bậc hai như hình bên. Phát biểu nào sau đây đúng?],
  ([Cắt nhau tại 1 điểm], True([Cắt nhau tại 2 điểm]), [Không cắt nhau], [Song song nhau]),
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    
    // Hình bên trái (tâm tại x=0)
    line((-2, 0), (2, 0), mark: (end: ">"))
    line((0, -2), (0, 2), mark: (end: ">"))
    line((-1.5, -1.5), (1.5, 1.5), stroke: 1pt + blue)
    content((0, 2.3), $f(x)$)
    
    // Hình bên phải (tâm tại x=5, cộng hoành độ cho tất cả các điểm vẽ)
    line((3, 0), (7, 0), mark: (end: ">"))
    line((5, -2), (5, 2), mark: (end: ">"))
    bezier((3.5, 1.5), (5,0), (4.2, -0.5), stroke: 1pt + red)
    bezier((5,0), (6.5, 1.5), (5.8, -0.5), stroke: 1pt + red)
    content((5, 2.3), $g(x)$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [Ta thấy đồ thị bậc nhất và đồ thị parabol cắt nhau tại 2 điểm phân biệt. Chọn B.]
)
```
#demo-out[
  #tn(
    [Cho hai đồ thị hàm số bậc nhất và bậc hai như hình bên. Phát biểu nào sau đây đúng?],
    ([Cắt nhau tại 1 điểm], True([Cắt nhau tại 2 điểm]), [Không cắt nhau], [Song song nhau]),
    fig: cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      
      // Hình bên trái (tâm tại x=0)
      line((-2, 0), (2, 0), mark: (end: ">"))
      line((0, -2), (0, 2), mark: (end: ">"))
      line((-1.5, -1.5), (1.5, 1.5), stroke: 1pt + blue)
      content((0, 2.3), $f(x)$)
      
      // Hình bên phải (tâm tại x=5, cộng hoành độ cho tất cả các điểm vẽ)
      line((3, 0), (7, 0), mark: (end: ">"))
      line((5, -2), (5, 2), mark: (end: ">"))
      bezier((3.5, 1.5), (5,0), (4.2, -0.5), stroke: 1pt + red)
      bezier((5,0), (6.5, 1.5), (5.8, -0.5), stroke: 1pt + red)
      content((5, 2.3), $g(x)$)
    }),
    fig-pos: "right",
    fig-width: 45%,
    loigiai: [Ta thấy đồ thị bậc nhất và đồ thị parabol cắt nhau tại 2 điểm phân biệt. Chọn B.]
  )
]

=== Ví dụ 7 — Đặt hình vẽ trong câu hỏi Tự luận (`#tl`)
```typst
#tl(
  [Cho hình lăng trụ đứng tam giác $A B C. A' B' C'$ có đáy $A B C$ vuông tại $B$. Hãy vẽ hình biểu diễn lăng trụ và tính khoảng cách từ $A$ đến mặt phẳng $(A' B C)$.],
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    line((0,0), (1,-1), (3,0)) // bottom front visible edges
    line((0,0), (3,0), stroke: (dash: "dashed")) // bottom back hidden edge
    line((0,0), (0,3))
    line((3,0), (3,3))
    line((1,-1), (1,2))
    line((0,3), (3,3), (1,2), (0,3)) // top face
    content((-0.3,0), $A$)
    content((3.3,0), $C$)
    content((1.2,-1.2), $B$)
    content((-0.3,3.3), $A'$)
  }),
  fig-pos: "right",
  loigiai: [Dựng đường cao $A H$ vuông góc với $A' B$. Khoảng cách chính bằng độ dài $A H$.]
)
```
#demo-out[
  #tl(
    [Cho hình lăng trụ đứng tam giác $A B C. A' B' C'$ có đáy $A B C$ vuông tại $B$. Hãy vẽ hình biểu diễn lăng trụ và tính khoảng cách từ $A$ đến mặt phẳng $(A' B C)$.],
    fig: cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      line((0,0), (1,-1), (3,0))
      line((0,0), (3,0), stroke: (dash: "dashed"))
      line((0,0), (0,3))
      line((3,0), (3,3))
      line((1,-1), (1,2))
      line((0,3), (3,3), (1,2), (0,3))
      content((-0.3,0), $A$)
      content((3.3,0), $C$)
      content((1.2,-1.2), $B$)
      content((-0.3,3.3), $A'$)
    }),
    fig-pos: "right",
    loigiai: [Dựng đường cao $A H$ vuông góc với $A' B$. Khoảng cách chính bằng độ dài $A H$.]
  )
]

=== Ví dụ 8 — Chèn hình ảnh dạng file ảnh (`#image`)
```typst
#tn(
  [Đồ thị biểu diễn trên hình ảnh bên là hàm số nào dưới đây?],
  ([$y = 2^x$], True([$y = ln x$]), [$y = x^2$], [$y = sin x$]),
  fig: image("images/de-01-1.png", width: 100%),
  fig-pos: "right",
  fig-width: 25%,
  loigiai: [Quan sát đồ thị minh họa hình ảnh bên. Chọn B.]
)
```
#demo-out[
  #tn(
    [Đồ thị biểu diễn trên hình ảnh bên là hàm số nào dưới đây?],
    ([$y = 2^x$], True([$y = ln x$]), [$y = x^2$], [$y = sin x$]),
    fig: image("images/de-01-1.png", width: 100%),
    fig-pos: "right",
    fig-width: 25%,
    loigiai: [Quan sát đồ thị minh họa hình ảnh bên. Chọn B.]
  )
]

=== Ví dụ 9 — Vẽ đồ thị Parabol và hệ trục Oxy bằng CetZ
```typst
#tn(
  [Đồ thị hàm số nào dưới đây có dạng như parabol bên?],
  (True([$y = x^2 - 2x$]), [$y = -x^2 + 2x$], [$y = x^2 + 2x$], [$y = -x^2 - 2x$]),
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    line((-2, 0), (4, 0), mark: (end: ">"))
    line((0, -2), (0, 4), mark: (end: ">"))
    content((3.8, -0.4), $x$)
    content((-0.4, 3.8), $y$)
    bezier((-1, 3), (1, -1), (0, -1), stroke: 1.2pt + red)
    bezier((1, -1), (3, 3), (2, -1), stroke: 1.2pt + red)
    circle((1, -1), radius: 2pt, fill: black)
    content((1.5, -1.3), $I(1;-1)$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  loigiai: [Đồ thị là parabol bề lõm quay lên, đỉnh tại $I(1; -1)$. Chọn A.]
)
```
#demo-out[
  #tn(
    [Đồ thị hàm số nào dưới đây có dạng như parabol bên?],
    (True([$y = x^2 - 2x$]), [$y = -x^2 + 2x$], [$y = x^2 + 2x$], [$y = -x^2 - 2x$]),
    fig: cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      line((-2, 0), (4, 0), mark: (end: ">"))
      line((0, -2), (0, 4), mark: (end: ">"))
      content((3.8, -0.4), $x$)
      content((-0.4, 3.8), $y$)
      bezier((-1, 3), (1, -1), (0, -1), stroke: 1.2pt + red)
      bezier((1, -1), (3, 3), (2, -1), stroke: 1.2pt + red)
      circle((1, -1), radius: 2pt, fill: black)
      content((1.5, -1.3), $I(1;-1)$)
    }),
    fig-pos: "right",
    fig-width: 32%,
    loigiai: [Đồ thị là parabol bề lõm quay lên, đỉnh tại $I(1; -1)$. Chọn A.]
  )
]

=== Ví dụ 10 — Vẽ hình chóp $S.A B C$ bằng CetZ
```typst
#tn(
  [Cho hình chóp $S.A B C$ có đáy $A B C$ là tam giác vuông tại $B$. Cạnh bên $S A$ vuông góc với đáy. Góc giữa mặt bên $S B C$ và đáy là góc nào?],
  ([Góc $S B A$], True([Góc $S B A$]), [Góc $S C A$], [Góc $S B C$]),
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    let S = (1.5, 4)
    let A = (0, 0)
    let B = (1.5, -1)
    let C = (3.5, 0.5)
    
    line(S, A, stroke: 1pt)
    line(S, B, stroke: 1pt)
    line(S, C, stroke: 1pt)
    line(A, B, stroke: 1pt)
    line(B, C, stroke: 1pt)
    line(A, C, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
    
    // Kí hiệu góc vuông 3D
    line((1.25, -0.83), (1.49, -0.65), (1.74, -0.82), stroke: 0.5pt) // tại B
    line((0, 0.3), (0.25, 0.13), (0.25, -0.17), stroke: 0.5pt) // SA perp AB
    line((0, 0.3), (0.3, 0.34), (0.3, 0.04), stroke: 0.5pt) // SA perp AC
    
    content((1.5, 4.3), $S$)
    content((-0.3, 0), $A$)
    content((1.5, -1.3), $B$)
    content((3.8, 0.5), $C$)
  }),
  fig-pos: "right",
  fig-width: 30%,
  loigiai: [Góc giữa $(S B C)$ và đáy là góc $S B A$ vì $B C perp A B$ và $B C perp S A$. Chọn B.]
)
```
#demo-out[
  #tn(
    [Cho hình chóp $S.A B C$ có đáy $A B C$ là tam giác vuông tại $B$. Cạnh bên $S A$ vuông góc với đáy. Góc giữa mặt bên $S B C$ và đáy là góc nào?],
    ([Góc $S B A$], True([Góc $S B A$]), [Góc $S C A$], [Góc $S B C$]),
    fig: cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      let S = (1.5, 4)
      let A = (0, 0)
      let B = (1.5, -1)
      let C = (3.5, 0.5)
      
      line(S, A, stroke: 1pt)
      line(S, B, stroke: 1pt)
      line(S, C, stroke: 1pt)
      line(A, B, stroke: 1pt)
      line(B, C, stroke: 1pt)
      line(A, C, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      
      // Kí hiệu góc vuông 3D
      line((1.25, -0.83), (1.49, -0.65), (1.74, -0.82), stroke: 0.5pt)
      line((0, 0.3), (0.25, 0.13), (0.25, -0.17), stroke: 0.5pt)
      line((0, 0.3), (0.3, 0.34), (0.3, 0.04), stroke: 0.5pt)
      
      content((1.5, 4.3), $S$)
      content((-0.3, 0), $A$)
      content((1.5, -1.3), $B$)
      content((3.8, 0.5), $C$)
    }),
    fig-pos: "right",
    fig-width: 30%,
    loigiai: [Góc giữa $(S B C)$ và đáy là góc $S B A$ vì $B C perp A B$ và $B C perp S A$. Chọn B.]
  )
]

// ══════════════════════════════════════════════════════════════════
= Các hộp sư phạm
// ══════════════════════════════════════════════════════════════════

Tất cả hộp dưới đây dùng được trong `loigiai:` của mọi loại câu hỏi.

== Nhóm hộp lời giải

#ppgiai[`#ppgiai[...]` — *Phương pháp giải* (xanh lá). Tóm tắt chiến lược trước khi trình bày chi tiết.]

#luuy[`#luuy[...]` — *Lưu ý* (vàng cam). Bẫy thường gặp, điểm cần chú ý đặc biệt.]

#meo[`#meo[...]` — *Mẹo* (tím). Cách làm nhanh, trick thi.]

#nhanxet[`#nhanxet[...]` — *Nhận xét* (xám xanh). Bình luận học thuật, mở rộng kiến thức.]

#lythuyet[`#lythuyet[...]` — *Lý thuyết liên quan* (xanh dương). Công thức hoặc định lý cần nhớ.]

== Nhóm hộp kiến thức

#dn[$dn$ — *Định nghĩa*. Phát biểu định nghĩa chính thức.]

#dl[$dl$ — *Định lý*. Phát biểu định lý, mệnh đề.]

#tc[$tc$ — *Tính chất* / Hệ quả.]

#bode[$bode$ — *Bổ đề*. Kết quả trung gian.]

== Macro `#step[...]` — tô màu từng bước lời giải

```typst
loigiai: [
  #step[Đặt ẩn phụ $t = e^x > 0$, phương trình trở thành $t^2 - 3t + 2 = 0$.]
  #step[Giải: $t = 1$ hoặc $t = 2$.]
  #step[Trả lại ẩn: $e^x = 1 => x = 0$; $e^x = 2 => x = ln 2$.]
  #step(color: red)[Không quên điều kiện $t > 0$: cả hai nghiệm đều thoả.]
  #reset-step()   // Reset bộ đếm trước câu tiếp theo
]
```

- Bước tự đếm, tự chọn màu xoay qua 6 màu.
- `#reset-step()` để bộ đếm về 0 cho câu tiếp theo.
- `#step(color: red)[...]` để ép màu tuỳ ý.

// ══════════════════════════════════════════════════════════════════
= Biên soạn Đề thi chuẩn và Trình chiếu Beamer
// ══════════════════════════════════════════════════════════════════

Chương này hướng dẫn chi tiết cách biên soạn một đề thi trắc nghiệm chuẩn theo cấu hình mới nhất của Bộ Giáo dục & Đào tạo (3 phần thi), cách in bảng đáp án tự động, và cách chuyển đổi đề thi thành slide trình chiếu Beamer.

== 1. Cấu trúc Đề thi chuẩn của Bộ GD&ĐT

Đề thi cấu trúc mới của Bộ GD&ĐT gồm 3 phần thi chính với cách tính điểm và đếm câu riêng biệt:
- *PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn*: Gồm 12 câu trắc nghiệm khách quan 4 lựa chọn (A, B, C, D). Mỗi câu trả lời đúng được $0,25$ điểm. Sử dụng cấu trúc `#tn(...)`.
- *PHẦN II. Câu trắc nghiệm đúng sai*: Gồm 4 câu hỏi. Mỗi câu có 4 phát biểu a, b, c, d độc lập. Thí sinh chỉ chọn Đúng hoặc Sai cho mỗi phát biểu. Điểm tối đa cho 1 câu là $1,0$ điểm khi trả lời đúng cả 4 phát biểu (được chấm lũy tiến theo bảng điểm quy định của Bộ). Sử dụng cấu trúc `#ds(...)`.
- *PHẦN III. Câu trắc nghiệm trả lời ngắn (Điền số)*: Gồm 6 câu tự luận ngắn. Thí sinh điền kết quả dạng số (nguyên hoặc thập phân làm tròn). Mỗi câu trả lời đúng được $0,5$ điểm. Sử dụng cấu trúc `#tln(...)` hoặc `#short(...)`.

== 2. Cấu hình Tiêu đề đề thi — `#thpt-school-exam`

Để tạo phần tiêu đề đầu trang thi (khung thông tin sở, trường, môn thi, mã đề...), hãy sử dụng cấu trúc `#show: thpt-school-exam.with(...)`.

```typst
#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",   // Dòng 1 tiêu đề bên trái (Sở GD)
  school: "TRƯỜNG THPT CHUYÊN ...",       // Dòng 2 tiêu đề bên trái (Trường)
  exam-title: "KỲ THI THỬ TỐT NGHIỆP THPT", // Căn giữa dòng 1
  subject: "Môn thi: TOÁN",               // Căn giữa dòng 2
  duration: "90 phút, không kể phát đề",  // Thời gian
  code: "101",                             // Mã đề thi
  structure: auto,                        // Tự động sinh dòng "Đề gồm X trang, Y câu"
  footer-left: [ĐỀ CHÍNH THỨC \ (Đề thi gồm 04 trang)], // Nhãn chân trang bên trái
  accent: accent,                         // Màu chủ đạo
  show-topbar: true,                      // Có thanh màu trang trí trên đầu trang hay không
  header-border: true,                    // Có đường kẻ đôi dưới dòng tiêu đề hay không
)
```

> [!IMPORTANT]
> Khai báo `#show: thpt-school-exam.with(...)` phải đặt ở đầu tệp đề thi, phía dưới dòng tạo bộ macro câu hỏi `#let (tn, ds, tln, tl) = exam-mode(...)` và show rule `#show: sang-setup`.

== 3. Phân chia phần thi — `#exam-part`

Để hiển thị tiêu đề cho từng phần thi (PHẦN I, PHẦN II, PHẦN III) kèm thông báo số câu tự động, hãy dùng macro `#exam-part`.

```typst
// Phần I: Có 12 câu, hệ thống hiển thị "(Từ câu 1 đến câu 12)"
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// Phần II: Có 4 câu tiếp theo, hệ thống hiển thị "(Từ câu 13 đến câu 16)"
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 13 đến câu 16. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// Phần III: Có 6 câu trả lời ngắn, hệ thống hiển thị "(Từ câu 17 đến câu 22)"
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: 6)
```

*Các tham số của `#exam-part`*:
- `body` (`content`, bắt buộc): Nội dung tiêu đề phần thi và hướng dẫn làm bài.
- `count` (`integer`, tùy chọn): Số câu trong phần đó. Nếu điền, hệ thống sẽ tự động tính toán dựa trên số câu hiện tại để sinh ra dòng ghi chú số câu (ví dụ: "Từ câu X đến câu Y").
- `reset-counter` (`boolean`, mặc định `false`): Reset bộ đếm số câu về 1 ở đầu phần. Đối với đề thi THPT QG chuẩn, bộ đếm câu chạy liên tục toàn bộ đề (không reset).

== 4. Mẫu file đề thi thực tế chuẩn hệ thống (`de-30.typ`)

Để câu hỏi của bạn có thể chuyển đổi tự động sang slide giảng dạy Beamer, file đề thi cần được bao bọc toàn bộ nội dung câu hỏi bên trong một hàm `#let make-questions(...) = [...]`. Dưới đây là mẫu khung sườn đầy đủ cho một đề thi:

```typst
#import "../sang-exam.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

// ① Thiết lập chế độ hiển thị mặc định của file đề
#let mode = "loigiai"        // "dethi" (đề trống) | "loigiai" (đề kèm lời giải)
#let accent = classic.blue   // Màu chủ đạo đề thi

// ② Tạo bộ câu hỏi tương thích
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show math.frac: math.display
#show: sang-setup

// ③ Tiêu đề đề thi
#show: thpt-school-exam.with(
  department: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "ĐỀ MINH HỌA",
  exam-title: "KỲ THI TỐT NGHIỆP THPT NĂM 2026", 
  subject: "Môn thi: TOÁN", 
  duration: "90 phút",
  code: "001",
  accent: accent,
)

// ④ Định nghĩa hàm gói câu hỏi (cần thiết để Beamer nạp câu hỏi)
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [
  #exam-part([Phần I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12.], count: 12)
  
  #tn(
    [Trong các hàm số sau, hàm số nào đồng biến trên $RR$?],
    ([$y = -x^3$], [$y = -x + 1$], True([$y = x^3 + x$]), [$y = x^2$]),
    loigiai: [
      - Ta có $y' = 3x^2 + 1 > 0, quad forall x in RR$.
      - Vậy hàm số $y = x^3 + x$ đồng biến trên $RR$. Chọn C.
    ]
  )
  
  // (Thêm tiếp 11 câu trắc nghiệm phần I)

  #exam-part([Phần II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 13 đến câu 16.], count: 4)

  #ds(
    [Cho hàm số $f(x) = x^3 - 3x^2 + 2$. Xét tính đúng sai của các khẳng định sau:],
    (
      True([Hàm số có hai điểm cực trị.]),
      [Cực đại của hàm số bằng $0$.],
      True([Đồ thị hàm số đi qua điểm $A(1;0)$.]),
      [Hàm số đồng biến trên khoảng $(0;2)$.],
    ),
    loigiai: [
      - a) *Đúng*. $f'(x) = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$.
      - b) *Sai*. Cực đại là $f(0) = 2$.
      - c) *Đúng*. $f(1) = 1 - 3 + 2 = 0$.
      - d) *Sai*. Hàm số nghịch biến trên $(0;2)$.
    ]
  )

  // (Thêm tiếp 3 câu Đúng/Sai phần II)

  #exam-part([Phần III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: 6)

  #tln(
    [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đồ thị như hình vẽ. Gọi $S$ là diện tích hình phẳng giới hạn bởi đồ thị và trục hoành. Biết $S = 12$. Tính giá trị của biểu thức $P = S / 2$.],
    ans: 6,
    loigiai: [Ta có $P = 12 / 2 = 6$. Điền số: 6.]
  )

  // (Thêm tiếp 5 câu trả lời ngắn phần III)
]

// ⑤ Thực thi in đề & đáp án
#if sys.inputs.at("beamer", default: "0") != "1" {
  // Chỉ chạy khối này khi biên dịch file đề thường (không phải slide Beamer)
  make-questions()

  // In bảng đáp án tự động ở cuối trang
  pagebreak() 
  print-answer-key()
  het
}
```

=== Hiển thị mẫu thực tế của đề thi chuẩn

Dưới đây là hình ảnh kết quả biên dịch thực tế của một đề thi mẫu sử dụng cấu trúc và cài đặt chuẩn trên:

#grid(
  columns: (1fr, 1fr),
  gutter: 1cm,
  [
    #align(center)[
      *Trang 1: Bố cục tiêu đề & Phần I*
      #image("images/de-01-1.png", width: 95%)
    ]
  ],
  [
    #align(center)[
      *Trang cuối: Bảng đáp án tự động*
      #image("images/de-01-8.png", width: 95%)
    ]
  ]
)

== 5. In bảng đáp án tự động — `print-answer-key()`

Hệ thống có khả năng tự động trích xuất đáp án đúng của tất cả các câu hỏi đã khai báo trên đề (lấy từ các lựa chọn bọc trong hàm `True()` của `#tn`, `#ds` và tham số `ans` của `#tln`) và lập thành các bảng đáp án cực kỳ gọn gàng.

Để in bảng đáp án, bạn chỉ cần chèn hàm `#print-answer-key()` ở cuối đề thi (như ví dụ phần 4 ở trên). 
Bảng đáp án sẽ tự động chia thành 3 phần rõ ràng:
- *BẢNG ĐÁP ÁN — TRẮC NGHIỆM*: Gom đáp án đúng của Phần I dưới dạng lưới dòng cột (ví dụ: 1. A, 2. B, ...).
- *BẢNG ĐÁP ÁN — ĐÚNG/SAI*: Dựng bảng lưới 4 cột (a, b, c, d) hiển thị ký tự màu xanh lá (Đ) hoặc đỏ (S) tương ứng cho từng ý của Phần II.
- *BẢNG ĐÁP ÁN — ĐIỀN SỐ*: Gom kết quả của các câu trả lời ngắn thuộc Phần III.

== 6. Chuyển đề thi thành Slide bài giảng Beamer

Nhờ có cấu trúc gói `make-questions` ở trên, bạn có thể chuyển đổi toàn bộ đề thi thành slide trình chiếu chữa đề chỉ trong vài giây thông qua file slide `Beamer.typ`:

=== Bước 1: Tạo file trình chiếu `Beamer.typ`
Tạo một file mới tên là `Beamer.typ` nằm ở thư mục dự án của bạn với nội dung cực kỳ tối giản như sau:

```typst
#import "sang-beamer.typ": *

// Nạp đề bài từ file đề thi thực tế của bạn
#import "dethi/de-30.typ": make-questions as _de

// Thiết lập thông tin trình chiếu
#show: sang-beamer-theme.with(
  title: "CHỮA ĐỀ THI THỬ THPT QG 2026",
  subtitle: "TOÁN - LỚP 12",
  author: "GV Nguyễn Văn Sang",
  institution: "ĐỀ SỐ 30",
  code: "9999",
  accent: classic.blue,
  total-q: 22,               // Tổng số câu hỏi của đề thi
  bg_color: rgb("#f1f5f9"),   // Nền sáng dễ nhìn
)

// Thực hiện sinh slide chữa đề tự động
#let mode = "loigiai"
#let _m = exam-mode(mode: mode, accent: classic.blue)
#_de(tn: _m.tn, ds: _m.ds, tln: _m.tln, tl: _m.tl, exam-part: exam-part)

#pagebreak()
#print-answer-key() // Slide đáp án tổng kết cuối buổi
#het
```

=== Bước 2: Biên dịch slide Beamer ra PDF
Chạy lệnh biên dịch sau ở cửa sổ terminal của dự án:
```bash
typst compile --input beamer=1 typst/Beamer.typ typst/Beamer.pdf
```
Hoặc sử dụng các lệnh định nghĩa sẵn trong `package.json`:
- Biên dịch slide: `npm run compile:Beamer`
- Chế độ xem trước thời gian thực (watch): `npm run watch:Beamer`

Slide Beamer được sinh ra sẽ tự động phân bổ: mỗi câu hỏi chiếm đúng 1 Slide, phần lời giải/BBT sẽ nằm trong thẻ lời giải thông minh và bảng Đúng/Sai tự động hiển thị đáp án trực quan rất chuyên nghiệp!

// ══════════════════════════════════════════════════════════════════

// ══════════════════════════════════════════════════════════════════
= `#sang-setup` — Tự động hoá show rules
// ══════════════════════════════════════════════════════════════════

```typst
// Cơ bản: toán đen, phân số display-size, list tự giãn
#show: sang-setup

// Toán màu theo accent
#show: sang-setup.with(math-color: accent)

// Toán màu tuỳ chỉnh
#show: sang-setup.with(math-color: rgb("#c00000"))
```

Khi `sang-setup` được kích hoạt:

- Phân số `$a/b$` tự động to như `\dfrac` — không cần gõ `\dfrac` thủ công.
- Công thức inline `$...$` cũng hiển thị cỡ display.
- List tự giãn dòng khi item chứa phân số (tránh đè nhau).

#caution[Đặt `#show: sang-setup` sau `#let (tn, ds, tln, tl) = exam-mode(...)` và sau các `#set page`, `#set text`. Không đặt trước các lệnh `#set`.]

// ══════════════════════════════════════════════════════════════════
Khi cấu hình hiển thị phân số display đang bật, mọi biểu thức phân số thông thường `$a/b$` đều được hiển thị cỡ lớn (display style). Để giữ phân số cỡ nhỏ (inline/script style) dùng trong các số mũ, cận tích phân hoặc khi viết công thức inline, ta sử dụng hàm `tfrac` (đã được tích hợp sẵn thông qua biến trạng thái `in-tfrac` toàn cục).

Cú pháp sử dụng:
```typst
// Phân số cỡ nhỏ trong số mũ (không bị vỡ dòng)
$3^(tfrac(5,3))$

// Phân số cỡ nhỏ trong cận tích phân
$integral_(tfrac(1,2))^(tfrac(3,2)) f(x) dif x$

// Phân số trong câu văn
Xác suất để rút được thẻ đỏ là $tfrac(3, 5)$.
```

#demo-out[
  Phân số display mặc định: $a/b + c/d$ \
  Phân số nhỏ với tfrac: $tfrac(1, 2) + tfrac(3, 4)$ \
  Phân số nhỏ ở số mũ: $3^(tfrac(5, 3))$
]

// ══════════════════════════════════════════════════════════════════
= ID, tags và metadata
Cách gán ID và tags trực tiếp vào câu hỏi rất đơn giản. Bạn chỉ cần truyền thêm `id` và `tags` vào cuối macro câu hỏi.

#demo-out[
  #let em = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em.tn)(
    [Hàm số $y = x^3 - 3x$ nghịch biến trên khoảng nào?],
    ([$(-oo;-1)$], True([$(-1;1)$]), [$(1;+oo)$], [$RR$]),
    id: "2D1H1-7",
    tags: ("lop12", "dao-ham", "don-dieu", "bbt")
  )
]

#caution[Lưu ý: `id:` sẽ KHÔNG hiển thị lên trang giấy khi in đề. Nó chỉ được lưu ẩn vào hệ thống để dùng cho việc trộn đề, xuất đáp án ra Excel, hoặc tìm kiếm. Nếu bạn muốn hiển thị ID lúc soạn thảo, hãy chèn text tĩnh vào ngay đầu câu hỏi.]


== `bank.json` giữ metadata, không giữ đề bài dài

`bank.json` hiện nên được hiểu là bản đồ phân loại:

```json
{
  "0D1N1-1": "Lớp 10 | Đại số | Ch1: Mệnh đề | Bài 1: Mệnh đề | Nhận biết"
}
```

Nội dung câu hỏi thật nên để trong Typst-native file như `typst/questions.typ`, vì câu hỏi Toán thường có công thức, hình Cetz, bảng, lời giải nhiều bước. Không nên nhồi toàn bộ đề bài vào JSON nếu muốn biên dịch đẹp và bền.

== Khai báo câu hỏi thật trong `questions.typ`

```typst
#import "modules/question-bank.typ": (
  ds-item, question-tn, question-ds, question-tln, question-tl,
  render-question, render-selection,
)

#let question-bank = (
  "0D1N1-1": question-tn(
    [Phát biểu nào sau đây là một mệnh đề?],
    (
      [Bạn học tốt nhé!],
      [$2$ là số nguyên tố.],
      [Hôm nay đẹp quá!],
      [$x + 1 = 3$],
    ),
    correct: 2,
    solution: [Chỉ phát biểu "$2$ là số nguyên tố" xác định đúng/sai.],
    tags: ("lop10", "menh-de"),
    difficulty: "NB",
    status: "ready",
    source: "questions.typ",
  ),

  "0D1N1-2": question-ds(
    [Xét các phát biểu sau.],
    (
      ds-item([Phát biểu "$2$ là số chẵn" là mệnh đề.], correct: true),
      ds-item([Câu "Hãy mở sách ra" là mệnh đề.], correct: false),
      ds-item([Phát biểu "$3 > 5$" vẫn là mệnh đề dù sai.], correct: true),
      ds-item([Biểu thức "$x^2 - 1 = 0$" luôn là mệnh đề.], correct: false),
    ),
    solution: [Mệnh đề là phát biểu có thể xác định đúng hoặc sai.],
    tags: ("lop10", "menh-de", "dung-sai"),
    difficulty: "TH",
    status: "ready",
  ),
)
```

== API ngân hàng câu hỏi

#table(
  columns: (55%, 45%),
  stroke: 0.5pt + luma(180),
  inset: 8pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Lệnh*], [*Ý nghĩa*],
  [`#load-bank(path: "../bank.json")`], [Đọc metadata từ JSON. Khi compile với `--root typst`, file JSON cần nằm trong vùng root.],
  [`#bank-filter(entries, grade:, branch:, chapter:, lesson:, form:, query:, ids:)`], [Lọc metadata theo lớp, phân môn, chương, bài, dạng, chuỗi tìm kiếm hoặc danh sách ID.],
  [`#bank-count(entries, by: "chapter")`], [Đếm số mã theo `grade`, `branch`, `chapter`, `lesson`, `form/topic`.],
  [`#bank-lookup(entries, id)`], [Tra một ID trong metadata bank.],
  [`#question-tn/#question-ds/#question-tln/#question-tl`], [Khai báo câu hỏi thật bằng Typst-native content.],
  [`#question-filter(...)`], [Lọc registry câu hỏi thật theo `type`, `difficulty`, `status`, `source`, `tags`, `ids`.],
  [`#question-select(entries, registry, ...)`], [Nối metadata bank với câu hỏi thật, lọc đồng thời theo chương-bài-dạng và trạng thái câu.],
  [`#render-question(item, mode:, show-id:)`], [Render một câu từ registry. Có thể bật `show-id: true` khi biên tập.],
  [`#render-selection(items, mode:, show-id:)`], [Render danh sách câu đã lọc/chọn.],
)

== Workflow ngân hàng ổn định

```bash
# 1. Xem thống kê metadata
npm run bank:stat

# 2. Tìm câu theo từ khóa
npm run bank:search -- "xác suất"

# 3. Sinh ID mới
npm run bank:gen-id

# 4. Nếu chỉnh bank.json ở root, sync sang typst/
npm run sync:bank
```

```typst
#import "template.typ": *
#import "questions.typ": question-bank

#let bank = load-bank()
#let selected = question-select(
  bank,
  question-bank,
  chapter: "Mệnh đề",
  status: "ready",
)

#render-selection(selected, mode: "loigiai", show-id: true)
```

#tip[Muốn đề tự dựng từ ID cố định, dùng `qb-pick(question-bank, "ID1", "ID2", ...)` trong `questions.typ`; muốn lọc mềm, dùng `question-select(...)` với `bank.json`.]

== Trộn đề Typst-native từ ngân hàng

Phần trộn đề mới lấy cảm hứng từ hệ `stexgv.web.app`, nhưng chạy ngay trong Typst: mỗi câu vẫn có ID ổn định, ma trận đề là danh sách slot, seed quyết định cách chọn câu, engine tránh trùng ID trong cùng một mã đề, trộn phương án trắc nghiệm và xuất bảng đáp án sau khi đã trộn.

File mẫu có sẵn:

```bash
typst compile --root typst typst/exam-mix-demo.typ output/exam-mix-demo.pdf
```

Nhập kho STEXGV sang Typst:

```bash
npm run stexgv:import
npm run stexgv:mix -- --compile
```

Bridge mới đọc trực tiếp `/Users/admin/stexgv/src/pages/ThptExamBuilder/banks`, gọi `generateLatex(seed)`, giữ ID gốc, slot 1-22, topic, source, latex gốc và sinh registry Typst trong `typst/stexgv-import/`.

#table(
  columns: (1.15fr, 2fr),
  stroke: 0.45pt + luma(210),
  inset: 6pt,
  [File], [Vai trò],
  [`scripts/stexgv-typst-bridge.mjs`], [Importer STEXGV: đọc module JS, phân tích `choice`, `choiceTF`, `shortans`, `loigiai`.],
  [`typst/stexgv-import/stexgv-bank.json`], [Snapshot quản lý ngân hàng: ID, slot, loại câu, topic, source, latex gốc, trạng thái.],
  [`typst/stexgv-import/stexgv-bank.typ`], [Registry Typst dùng ngay với `build-exam-plan` và `render-exam-plan`.],
  [`typst/stexgv-import/stexgv-mix-demo.typ`], [File trộn đề 22 slot chuẩn THPT, sinh 2 mã đề và bảng đáp án.],
  [`output/stexgv-mix-demo.pdf`], [Đầu ra PDF khi chạy thêm `--compile`.],
)

Trạng thái import hiện tại: bridge nhập được 1.553 câu STEXGV. Có 743 câu `ready`, 810 câu `review` vì còn TikZ, tkz-tab hoặc lệnh LaTeX đặc thù cần chuyển sâu sang CeTZ/BBT. Tất cả câu vẫn có ID và trộn đề được khi dùng `status: none`.

Import lõi:

```typst
#import "sang-exam.typ": *
#import "questions.typ": question-bank
#import "modules/question-bank.typ": (
  exam-slot,
  build-exam-plan,
  render-exam-plan,
  render-answer-key,
  thpt-2025-matrix,
)
```

Khai báo ma trận slot:

```typst
#let matrix = (
  exam-slot(1, label: [TN — mệnh đề], type: "tn", ids: ("0D1N1-1",)),
  exam-slot(2, label: [TN — Oxyz], type: "tn", ids: ("12HH-MC-01", "12HH-DT-01")),
  exam-slot(3, label: [TN — tích phân], type: "tn", tags: ("tich-phan",), difficulty: ("NB", "TH")),
  exam-slot(4, label: [Đúng sai — xác suất], type: "ds", tags: ("xac-suat",), difficulty: ("VD",)),
  exam-slot(5, label: [Trả lời ngắn], type: "tln", difficulty: ("VD", "VDC")),
)
```

Dựng đề từ seed:

```typst
#let plan = build-exam-plan(
  question-bank,
  matrix,
  seed: 2026,
  strict: false,
  allow-duplicates: false,
)

#render-exam-plan(
  plan,
  mode: "dethi",
  seed: 2026,
  shuffle-options: true,
  show-id: true,
)

#pagebreak()
#render-answer-key(plan, seed: 2026, shuffle-options: true)
```

Sinh nhiều mã đề:

```typst
#let render-code(code, seed) = {
  let plan = build-exam-plan(question-bank, matrix, seed: seed)

  #show: thpt-school-exam.with(
    school: "CONICTYPST",
    exam-title: "ĐỀ TRỘN TỪ NGÂN HÀNG",
    subject: "TOÁN",
    duration: "90 phút",
    code: code,
  )

  render-exam-plan(plan, seed: seed, shuffle-options: true)
  pagebreak()
  render-answer-key(plan, seed: seed, shuffle-options: true, title: [Bảng đáp án mã #code])
}

#render-code("101", 2026)
#pagebreak()
#render-code("102", 2027)
```

Khi ngân hàng đủ dữ liệu theo tags/mức độ, dùng ma trận 22 slot chuẩn:

```typst
#let plan = build-exam-plan(
  question-bank,
  thpt-2025-matrix,
  seed: 26072026,
  strict: false,
)

#render-exam-plan(plan, seed: 26072026, shuffle-options: true)
#pagebreak()
#render-answer-key(plan, seed: 26072026, shuffle-options: true)
```

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 8pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Hàm*], [*Vai trò*],
  [`#exam-slot(...)`], [Mô tả một ô ma trận: loại câu, ID cố định, tags, mức độ, nguồn, trạng thái.],
  [`#build-exam-plan(...)`], [Chọn câu theo seed, tránh trùng ID, trả về danh sách câu đã chọn.],
  [`#render-exam-plan(...)`], [Render đề bằng macro `#tn/#ds/#tln/#tl`.],
  [`#render-answer-key(...)`], [Xuất bảng đáp án đúng sau khi đã trộn phương án.],
  [`#thpt-2025-matrix`], [Ma trận mẫu 22 slot: 12 trắc nghiệm, 4 đúng/sai, 6 trả lời ngắn.],
)

#caution[`thpt-2025-matrix` là khung chuẩn. Nếu ngân hàng chưa có đủ câu khớp tags/mức độ, engine sẽ báo thiếu slot trong PDF để người soạn bổ sung câu hoặc nới bộ lọc.]

// ══════════════════════════════════════════════════════════════════
= Tham số nâng cao của câu hỏi
// ══════════════════════════════════════════════════════════════════

Phần này gom những tham số có thật trong engine nhưng thường bị bỏ sót khi viết HDSD ngắn.

== Nhóm tham số chung cho `#tn`, `#ds`, `#tln`, `#tl`

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 7pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Tham số*], [*Mặc định*], [*Ghi chú*],
  [`mode:`], [`"dethi"`], [`"dethi"` ẩn lời giải; `"loigiai"` hiện lời giải và đáp án; `"solcolor"` dùng cho đáp án màu nổi. Thường không truyền trực tiếp mà lấy từ `exam-mode`.],
  [`accent:`], [`palette.accent`], [Màu nhãn câu, header bảng Đ/S, lời giải. Dùng `classic.blue`, `classic.emerald`, `classic.crimson` hoặc `rgb(...)`.],
  [`fig:`], [`none`], [Canvas Cetz, `image(...)`, bảng, hoặc content bất kỳ.],
  [`fig-pos:`], [`"right"`], [`"right"`, `"left"`, `"center"`. Nếu đề dài mà chỉ một đoạn cần hình, nên tự đặt `#grid(...)` trong stem thay vì dùng `fig:`.],
  [`fig-width:`], [`35%` hoặc `30%`], [Tỷ lệ cột hình khi `fig-pos` là `"right"`/`"left"`; với `"center"` dùng để scale hình căn giữa.],
  [`lines:`], [`0` hoặc `6`], [Số dòng chấm cho học sinh làm bài. `#tl` mặc định 6 dòng, các loại khác mặc định 0.],
  [`num:`], [`auto`], [Ép số câu thủ công. Nếu dùng `num: 13`, câu đó hiển thị Câu 13 và engine đặt lại mốc đếm quanh vị trí này.],
  [`prefix:`], [`"Câu"`], [Đổi nhãn, ví dụ `"Bài"`, `"Question"`, `"Câu hỏi"`.],
  [`boxed:`], [`false`], [Đóng khung toàn câu hỏi. Hữu ích khi làm phiếu học tập, sách bài tập hoặc slide.],
  [`box-fill:`], [`white`], [Nền khung câu hỏi khi `boxed: true`.],
  [`box-stroke:`], [`0.6pt + palette.border`], [Viền khung câu hỏi.],
  [`box-inset:`], [`(x: 10pt, y: 8pt)`], [Khoảng cách nội dung tới viền khung.],
  [`box-radius:`], [`4pt`], [Bo góc khung.],
  [`id:`], [`none`], [Mã câu hỏi, truyền qua `..args`; engine lưu metadata đáp án nội bộ.],
  [`tags:`], [`()`], [Tuple nhãn phụ. `#tn/#ds/#tln` render tags nhỏ bên cạnh stem; `#tl` hiện tại chỉ lưu nội dung câu/lời giải, chưa render tags trực tiếp.],
)

== Tham số riêng của `#tn/#mcq`

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 7pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Tham số*], [*Mặc định*], [*Ghi chú*],
  [`options`], [bắt buộc], [Tuple phương án. Có thể đánh dấu đúng bằng `True([...])` hoặc dùng `correct: (2,)`.],
  [`correct:`], [`()`], [Danh sách chỉ số đáp án đúng theo thứ tự 1-based. Dùng khi không muốn bọc `True(...)`.],
  [`cols:`], [`0`], [`0` tự đo và chia 1/2/4 cột. Cũng có thể truyền array cột như `(1fr, 1fr)` nếu cần layout đặc biệt.],
  [`row-gutter:`], [`auto`], [Khoảng cách hàng phương án. Dùng khi phương án nhiều phân số/căn/log và bị sát nhau.],
  [`opt-fig:`], [`false`], [`true` khi phương án là hình/canvas để engine bỏ đo text và render dạng card.],
  [`opt-fig-cols:`], [`2`], [Số cột khi các phương án là hình. Thường dùng 2 để thành lưới 2×2.],
)

```typst
// Không dùng True(), dùng correct: (3,)
#tn(
  [Đáp án đúng là phương án nào?],
  ([$A$], [$B$], [$C$], [$D$]),
  correct: (3,),
)

// Phương án là hình
#tn(
  [Đồ thị nào là $y=x^2$?],
  (cetz.canvas(...), cetz.canvas(...), cetz.canvas(...), cetz.canvas(...)),
  correct: (1,),
  opt-fig: true,
  opt-fig-cols: 2,
)
```

== Tham số riêng của `#tln/#short`

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 7pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Tham số*], [*Mặc định*], [*Ghi chú*],
  [`answer`], [bắt buộc], [Đáp án hiển thị khi `mode != "dethi"`. Có thể là toán, chữ, hoặc content phức tạp.],
  [`show-boxes:`], [`true`], [Bật/tắt cụm ô đáp số. Nếu câu không cần ô, đặt `false`.],
  [`box-count:`], [`4`], [Số ô đáp số trong đề thi. Tăng lên 5–6 nếu đáp án có nhiều chữ số/ký tự.],
)

== Tham số riêng của lời giải từng bước

#param("color:", "color|auto", default: "auto")[Dùng trong `#step(...)`. Nếu để `auto`, màu xoay theo 6 màu mặc định.]
#param("before_nonfirst:", "content|auto|none", default: "auto")[Dùng cho beamer/reveal. Có thể cấu hình bằng `#configure-step-reveal(before_nonfirst: pause)`.]

// ══════════════════════════════════════════════════════════════════
= Tham số Typst thường gặp trong hệ thống
// ══════════════════════════════════════════════════════════════════

Đây là bảng tra nhanh cho người mới đọc code Typst trong workspace. Các tham số dưới đây là Typst chuẩn, không phải riêng của `sang-exam.typ`, nhưng xuất hiện rất nhiều trong template.

== Layout cơ bản

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 7pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Lệnh/Tham số*], [*Cách hiểu nhanh*],
  [`#set page(paper:, margin:, header:, footer:, background:)`], [Cấu hình khổ giấy, lề, header/footer, watermark/nền trang.],
  [`#set text(font:, size:, lang:, fill:, weight:)`], [Cấu hình font, cỡ chữ, ngôn ngữ, màu và độ đậm chữ.],
  [`#set par(justify:, leading:)`], [Căn đều đoạn văn và khoảng cách dòng.],
  [`block(width:, fill:, stroke:, inset:, radius:, above:, below:)`], [Khối lớn có thể tô nền, viền, padding, bo góc, khoảng cách trên/dưới.],
  [`box(width:, height:, fill:, stroke:, inset:, radius:)`], [Hộp inline/nhỏ, hay dùng cho badge, ô đáp án, nhãn.],
  [`grid(columns:, rows:, column-gutter:, row-gutter:, align:)`], [Bố cục nhiều cột/hàng. `columns: (1fr, 35%)` nghĩa là text co giãn + hình 35%.],
  [`table(columns:, stroke:, inset:, fill:, align:)`], [Bảng dữ liệu. `fill: (_, row) => ...` dùng để tô header hoặc zebra row.],
  [`align(center)[...]`], [Căn nội dung. Có thể dùng `left`, `right`, `center`, `top`, `bottom`, `horizon`.],
  [`pad(left:, right:, x:, y:)[...]`], [Thêm khoảng đệm quanh nội dung.],
  [`v(0.5em)` / `h(6pt)`], [Khoảng trắng dọc/ngang.],
  [`stack(dir: ltr, spacing:, ..items)`], [Xếp nhiều phần tử nối tiếp, thường dùng cho các ô đáp số.],
  [`scale(body, x:, y:, reflow:)`], [Phóng/thu hình hoặc content. Engine dùng để scale hình căn giữa.],
)

== Kiểu dữ liệu thường gặp

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 7pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Kiểu*], [*Ví dụ và lưu ý*],
  [`content`], [`[Nội dung]`, `[$x^2$]`, `[Văn bản và #macro]`. Đây là kiểu quan trọng nhất khi viết stem/lời giải.],
  [`string`], [`"dethi"`, `"right"`, `"0D1N1-1"`. Chuỗi dùng dấu nháy kép.],
  [`tuple/array`], [`(1, 2, 3)`, `([$A$], True([$B$]), [$C$], [$D$])`. Chú ý tuple 1 phần tử phải có dấu phẩy: `("AC",)`.],
  [`dictionary`], [`(body: [text], correct: true)`. `True([...])` thực chất trả về dictionary có `body` và `correct`.],
  [`color`], [`rgb("#0057b8")`, `classic.blue`, `red`.],
  [`length`], [`12pt`, `0.8em`, `1cm`.],
  [`relative`], [`35%`, `100%`. Hay dùng trong `fig-width`, `width`, `columns`.],
  [`auto`], [Giá trị đặc biệt để hệ thống tự tính. Ví dụ `num: auto`, `structure: auto`, `h1: auto`.],
  [`none`], [Không có giá trị. Dùng để tắt hình, lời giải, watermark, subtitle.],
)

== Nhãn, metadata và vị trí

```typst
// Label để tham chiếu hoặc query
#metadata((kind: "question", id: "2D1H1-7")) <my-question>

// Đặt nội dung theo vị trí tuyệt đối trên trang
#place(top + right, dx: -1cm, dy: 1cm)[Mã đề 101]

// Lấy số trang hiện tại
#context counter(page).get().first()
```

#caution[`metadata` và `query` rất mạnh nhưng khó với người mới. Nếu chỉ soạn đề thường, chưa cần dùng trực tiếp. Engine đã dùng sẵn bên trong để đếm câu, gom đáp án và reset trạng thái.]

// ══════════════════════════════════════════════════════════════════
= Bảng biến thiên — `bbt.typ`

Phần này là bản hướng dẫn *cực kỳ chi tiết* cho mọi macro vẽ bảng biến thiên. Từ cấu trúc tối thiểu nhất cho đến các tham số tùy chỉnh nâng cao.

== 1. Cấu trúc tối thiểu (Dễ dùng nhất)
Macro `#bbtv2` tự động tính toán mũi tên và cao độ dựa trên dấu đạo hàm. Bạn chỉ cần truyền đúng `x-vals`, `d-signs`, và `v-vals`.

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($+oo$, $-2$, $+oo$),
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $+oo$),
      d-signs: ($-$, $0$, $+$),
      v-vals: ($+oo$, $-2$, $+oo$),
    )
  ]
]

*Giải thích tham số tối thiểu:*
- `var`, `der`, `func`: Lần lượt là nhãn của 3 hàng (thường là $x, y', y$).
- `x-vals`: Các mốc trên trục hoành. Ở đây có 3 mốc: $-oo, 0, +oo$.
- `d-signs`: Dấu của đạo hàm. *Số lượng luôn là `2n - 3`* (với n là số lượng `x-vals`). Do có 3 mốc x, nên `d-signs` có $2(3) - 3 = 3$ phần tử.
- `v-vals`: Giá trị của hàm số. Số lượng bằng với `x-vals`. Ở đây là $+oo, -2, +oo$.

== 2. Mảng dấu `d-signs` (Đặc biệt quan trọng)
Lỗi phổ biến nhất khi mũi tên bị sai, hoặc mũi tên bay ngang là do nhập *sai số lượng phần tử `d-signs`*.

Quy luật: Mảng dấu xen kẽ giữa *khoảng* và *điểm*.
Nếu bạn có 4 mốc x: `x-vals: (a, b, c, d)` -> Số mốc n = 4.
Mảng `d-signs` phải có *5 phần tử* (2*4 - 3 = 5):
`d-signs: (dấu-khoảng-1, dấu-tại-b, dấu-khoảng-2, dấu-tại-c, dấu-khoảng-3)`

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $2$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, $4$, $-5$, $+oo$),
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $2$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $4$, $-5$, $+oo$),
    )
  ]
]

#caution[Sai lầm thường gặp: Viết dư dấu hoặc viết dấu "0" vào vị trí của khoảng. Dấu đạo hàm ở một khoảng bắt buộc phải là `+$` hoặc `-$`. Nếu truyền `$0$` vào vị trí khoảng, mũi tên sẽ đi ngang!]

== 3. Tùy chỉnh kích thước (`w1`, `w2`, `h1`, `h2`, `h3`)
Bạn có thể tinh chỉnh chiều rộng và chiều cao của từng hàng/cột để bảng rộng rãi, vừa vặn hơn.

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($+oo$, $-2$, $+oo$),
  w1: 2.5,  // Cột bên trái rộng 2.5cm
  w2: 12,   // Cột bên phải rộng 12cm
  h1: 1.2,  // Chiều cao hàng x là 1.2cm
  h2: 1.5,  // Chiều cao hàng đạo hàm là 1.5cm
  h3: 3,    // Chiều cao hàng y là 3cm
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $+oo$),
      d-signs: ($-$, $0$, $+$),
      v-vals: ($+oo$, $-2$, $+oo$),
      w1: 2.5,  // Cột bên trái rộng 2.5cm
      w2: 12,   // Cột bên phải rộng 12cm
      h1: 1.2,  // Chiều cao hàng x là 1.2cm
      h2: 1.5,  // Chiều cao hàng đạo hàm là 1.5cm
      h3: 3,    // Chiều cao hàng y là 3cm
    )
  ]
]

== 4. Hàm phân thức, Tiệm cận và Vùng không xác định (`shade`, `||`)
Đối với hàm phân thức hoặc hàm chứa căn, ta cần dùng dấu `"||"` cho những điểm không xác định, và tham số `shade` để gạch chéo vùng bỏ đi.

*Ví dụ 1: Tiệm cận đứng (Không shade)*
Truyền `"||"` vào `d-signs`, và dùng mảng con `($-oo$, $+oo$)` vào `v-vals` để gán hai giới hạn hai bên tiệm cận.

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $1$, $+oo$),
  d-signs: ($-$, "||", $-$),
  v-vals: ($2$, ($-oo$, $+oo$), $2$),
  w2: 8
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $1$, $+oo$),
      d-signs: ($-$, "||", $-$),
      v-vals: ($2$, ($-oo$, $+oo$), $2$),
      w2: 8
    )
  ]
]

*Ví dụ 2: Vùng không xác định (Gạch chéo với `shade`)*
Sử dụng tham số `shade: ((start_index, end_index),)`.
VD: `shade: ((1, 2),)` tức là gạch chéo từ cột index 1 đến cột index 2 (tính từ 0).

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-2$, $2$, $+oo$),
  d-signs: ($+$, "||", none, "||", $+$),
  v-vals: ($-oo$, $0$, $0$, $+oo$),
  shade: ((1, 2),),
  w2: 10
)
```

#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-2$, $2$, $+oo$),
      d-signs: ($+$, "||", none, "||", $+$),
      v-vals: ($-oo$, $0$, $0$, $+oo$),
      shade: ((1, 2),),
      w2: 10
    )
  ]
]

== Ví dụ 4.3 — Bảng biến thiên hàm phân thức hữu tỉ có tiệm cận đứng thực tế

Ví dụ thực tế dưới đây trích xuất nguyên bản từ đề thi trong sách của bạn, biểu diễn bảng biến thiên của hàm phân thức bậc nhất trên bậc nhất $y = (-x+2)/(x-1)$ có tiệm cận đứng tại $x = 1$, sử dụng `#my-bbbt` và thiết lập `ranks: (0, (-1, 1), 0)` để vẽ mũi tên chéo mượt mà đi từ $+oo$ xuống $-1$:

```typst
#my-bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $1$, $+oo$),
  d-signs: ("-", "||", "-"),
  v-vals: ($-1$, ($-oo$, $+oo$), $-1$),
  ranks: (0, (-1, 1), 0)
)
```

#demo-out[
  #import "sach/DECUONG12-HK1/preamble.typ": my-bbbt
  #align(center)[
    #my-bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $1$, $+oo$),
      d-signs: ("-", "||", "-"),
      v-vals: ($-1$, ($-oo$, $+oo$), $-1$),
      ranks: (0, (-1, 1), 0)
    )
  ]
]

== 5. Chỉnh thủ công vị trí mũi tên bằng `#bbbt` và `ranks`
Khi mũi tên bị lệch, đè lên text, hoặc thuật toán tự động của `bbtv2` tính sai độ dốc, bạn hãy chuyển sang `#bbbt` và dùng mảng `ranks`.
`ranks` quy định "độ cao tương đối" của mỗi giá trị trong hàng y. Số càng nhỏ thì càng thấp.

```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $2$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, $4$, $-5$, $+oo$),
  ranks: ((0,), (2,), (0,), (2,)), // Thiết lập độ cao thủ công
  w2: 12,
)
```

#demo-out[
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $2$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $4$, $-5$, $+oo$),
      ranks: ((0,), (2,), (0,), (2,)), // Thiết lập độ cao thủ công
      w2: 12,
    )
  ]
]

== 6. Bảng xét dấu `#bxd` (Nhiều dòng)
Dành cho bài toán xét dấu biểu thức, giải bất phương trình.
- Truyền một mảng vào `func` để tạo nhiều dòng.
- Truyền mảng 2 chiều vào `f-signs` tương ứng.

```typst
#bxd(
  var: $x$,
  func: ($x+1$, $x-2$, $f'(x)$),
  x-vals: ($-oo$, $-1$, $2$, $+oo$),
  f-signs: (
    ($-$, $0$, $+$, $+$, $+$),
    ($-$, $-$, $-$, $0$, $+$),
    ($+$, $0$, $-$, $0$, $+$),
  ),
  w1: 1.5,
  w2: 8,
  h1: 0.8,
  h2: 0.8,
)
```

#demo-out[
  #align(center)[
    #bxd(
      var: $x$,
      func: ($x+1$, $x-2$, $f'(x)$),
      x-vals: ($-oo$, $-1$, $2$, $+oo$),
      f-signs: (
        ($-$, $0$, $+$, $+$, $+$),
        ($-$, $-$, $-$, $0$, $+$),
        ($+$, $0$, $-$, $0$, $+$),
      ),
      w1: 1.5,
      w2: 8,
      h1: 0.8,
      h2: 0.8,
    )
  ]
]

== Ví dụ 6.2 — Bảng xét dấu phân thức có điều kiện không xác định (Trích đề thi thực tế)

Ví dụ thực tế dưới đây trích xuất cách sử dụng `#bxd` cho hàm phân thức $f'(x) = (x-1)/(x+2)$, có mốc không xác định tại $x = -2$ (được vẽ bằng ký hiệu song song `"||"`) và các mốc triệt tiêu tại $x = 1$:

```typst
#bxd(
  var: $x$, 
  func: ($x - 1$, $x + 2$, $f'(x) = (x-1)/(x+2)$),
  x-vals: ($-oo$, $-2$, $1$, $+oo$),
  f-signs: (
    ($-$, $"|"$, $-$, $0$, $+$),
    ($-$, $0$, $+$, $"|"$, $+$),
    ($+$, $"||"$, $-$, $0$, $+$),
  ),
  w1: 4
)
```

#demo-out[
  #align(center)[
    #bxd(
      var: $x$, 
      func: ($x - 1$, $x + 2$, $f'(x) = (x-1)/(x+2)$),
      x-vals: ($-oo$, $-2$, $1$, $+oo$),
      f-signs: (
        ($-$, $"|"$, $-$, $0$, $+$),
        ($-$, $0$, $+$, $"|"$, $+$),
        ($+$, $"||"$, $-$, $0$, $+$),
      ),
      w1: 4
    )
  ]
]

= Tuyển tập 30 loại Bảng biến thiên & Bảng xét dấu mẫu
// ══════════════════════════════════════════════════════════════════

Dưới đây là 30 bảng biến thiên (BBT) và bảng xét dấu (BXD) mẫu hoàn chỉnh được thiết lập cho mọi tình huống toán học ở trường phổ thông. Mỗi ví dụ gồm mã nguồn mẫu và khối kết quả thực tế tương ứng.

== Nhóm 1: Hàm số đa thức (Bậc 3, Bậc 4 trùng phương)

=== Ví dụ 1 — Hàm số bậc ba có 2 cực trị ($a > 0$)
Hàm số $y = x^3 - 3x^2 + 2$. Có 2 điểm cực trị là $x=0$ và $x=2$.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $2$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, $2$, $-2$, $+oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $2$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $2$, $-2$, $+oo$)
    )
  ]
]

=== Ví dụ 2 — Hàm số bậc ba có 2 cực trị ($a < 0$)
Hàm số $y = -x^3 + 3x$. Có 2 cực trị tại $x = -1$ và $x = 1$.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $1$, $+oo$),
  d-signs: ($-$, $0$, $+$, $0$, $-$),
  v-vals: ($+oo$, $-2$, $2$, $-oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $1$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$),
      v-vals: ($+oo$, $-2$, $2$, $-oo$)
    )
  ]
]

=== Ví dụ 3 — Hàm số bậc ba đồng biến trên $RR$
Hàm số $y = x^3 + x$. Đạo hàm $y' = 3x^2 + 1 > 0$ vô nghiệm.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $+oo$),
  d-signs: ($+$,),
  v-vals: ($-oo$, $+oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $+oo$),
      d-signs: ($+$,),
      v-vals: ($-oo$, $+oo$)
    )
  ]
]

=== Ví dụ 4 — Hàm số bậc ba nghịch biến trên $RR$
Hàm số $y = -x^3$. Đạo hàm $y' = -3x^2 \le 0$ có nghiệm kép tại $x = 0$.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ($-$, $0$, $-$),
  v-vals: ($+oo$, $0$, $-oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $+oo$),
      d-signs: ($-$, $0$, $-$),
      v-vals: ($+oo$, $0$, $-oo$)
    )
  ]
]

=== Ví dụ 5 — Hàm trùng phương bậc bốn có 3 cực trị ($a > 0$)
Hàm số $y = x^4 - 2x^2 - 1$. Có cực đại tại $x = 0$ và hai cực tiểu tại $x = \pm 1$.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
  d-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$),
  v-vals: ($+oo$, $-2$, $-1$, $-2$, $+oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$),
      v-vals: ($+oo$, $-2$, $-1$, $-2$, $+oo$)
    )
  ]
]

=== Ví dụ 6 — Hàm trùng phương bậc bốn có 3 cực trị ($a < 0$)
Hàm số $y = -x^4 + 2x^2 + 1$. Có hai cực đại tại $x = \pm 1$, cực tiểu tại $x = 0$.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$, $0$, $-$),
  v-vals: ($-oo$, $2$, $1$, $2$, $-oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$, $0$, $-$),
      v-vals: ($-oo$, $2$, $1$, $2$, $-oo$)
    )
  ]
]

=== Ví dụ 7 — Hàm trùng phương có 1 cực tiểu ($a > 0, b \ge 0$)
Hàm số $y = x^4 + x^2$. Đạo hàm triệt tiêu và đổi dấu duy nhất tại $x = 0$.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($+oo$, $0$, $+oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $+oo$),
      d-signs: ($-$, $0$, $+$),
      v-vals: ($+oo$, $0$, $+oo$)
    )
  ]
]

=== Ví dụ 8 — Hàm trùng phương có 1 cực đại ($a < 0, b \le 0$)
Hàm số $y = -x^4 - x^2$.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ($+$, $0$, $-$),
  v-vals: ($-oo$, $0$, $-oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $+oo$),
      d-signs: ($+$, $0$, $-$),
      v-vals: ($-oo$, $0$, $-oo$)
    )
  ]
]

== Nhóm 2: Hàm phân thức hữu tỉ

=== Ví dụ 9 — Hàm bậc nhất trên bậc nhất nghịch biến
Hàm số $y = (-x + 2)/(x - 1)$. Có tiệm cận đứng là đường thẳng $x = 1$, tiệm cận ngang $y = -1$.
```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $1$, $+oo$),
  d-signs: ($-$, "||", $-$),
  v-vals: ($-1$, ($-oo$, $+oo$), $-1$),
  ranks: (0, (-1, 1), 0)
)
```
#demo-out[
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $1$, $+oo$),
      d-signs: ($-$, "||", $-$),
      v-vals: ($-1$, ($-oo$, $+oo$), $-1$),
      ranks: (0, (-1, 1), 0)
    )
  ]
]

=== Ví dụ 10 — Hàm bậc nhất trên bậc nhất đồng biến
Hàm số $y = (x - 1)/(x + 2)$. Tiệm cận đứng $x = -2$, tiệm cận ngang $y = 1$.
```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-2$, $+oo$),
  d-signs: ($+$, "||", $+$),
  v-vals: ($1$, ($+oo$, $-oo$), $1$),
  ranks: (0, (1, -1), 0)
)
```
#demo-out[
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-2$, $+oo$),
      d-signs: ($+$, "||", $+$),
      v-vals: ($1$, ($+oo$, $-oo$), $1$),
      ranks: (0, (1, -1), 0)
    )
  ]
]

=== Ví dụ 11 — Hàm bậc hai trên bậc nhất có cực đại và cực tiểu
Hàm số $y = x + 1/x$. Tiệm cận đứng $x = 0$, có cực đại tại $x = -1$ và cực tiểu tại $x = 1$.
```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
  d-signs: ($+$, $0$, $-$, "||", $-$, $0$, $+$),
  v-vals: ($-oo$, $-2$, ($-oo$, $+oo$), $2$, $+oo$),
  ranks: (0, 1, (-2, 2), -1, 0)
)
```
#demo-out[
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
      d-signs: ($+$, $0$, $-$, "||", $-$, $0$, $+$),
      v-vals: ($-oo$, $-2$, ($-oo$, $+oo$), $2$, $+oo$),
      ranks: (0, 1, (-2, 2), -1, 0)
    )
  ]
]

=== Ví dụ 12 — Hàm phân thức vô nghiệm cực trị có 2 tiệm cận đứng
Hàm số $y = 1/(x^2 - 1)$. Tiệm cận đứng tại $x = -1$ và $x = 1$, cực trị tại $x = 0$.
```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
  d-signs: ($+$, "||", $+$, $0$, $-$, "||", $-$),
  v-vals: ($0$, ($+oo$, $-oo$), $-1$, ($-oo$, $+oo$), $0$),
  ranks: (1, (2, -2), -1, (-2, 2), 1)
)
```
#demo-out[
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
      d-signs: ($+$, "||", $+$, $0$, $-$, "||", $-$),
      v-vals: ($0$, ($+oo$, $-oo$), $-1$, ($-oo$, $+oo$), $0$),
      ranks: (1, (2, -2), -1, (-2, 2), 1)
    )
  ]
]

=== Ví dụ 13 — Hàm phân thức bậc hai trên bậc hai có 1 tiệm cận đứng
Hàm số $y = (x-1)/(x-2)$.
```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $2$, $+oo$),
  d-signs: ($-$, "||", $-$),
  v-vals: ($1$, ($-oo$, $+oo$), $1$),
  ranks: (0, (-1, 1), 0)
)
```
#demo-out[
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $2$, $+oo$),
      d-signs: ($-$, "||", $-$),
      v-vals: ($1$, ($-oo$, $+oo$), $1$),
      ranks: (0, (-1, 1), 0)
    )
  ]
]

=== Ví dụ 14 — Hàm phân thức có mốc không xác định kép
Thiết lập vùng không xác định nằm giữa $(-1, 1)$ bằng tham số `shade`.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $1$, $+oo$),
  d-signs: ($-$, "||", none, "||", $+$),
  v-vals: ($+oo$, $0$, $0$, $+oo$),
  shade: ((1, 2),)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $1$, $+oo$),
      d-signs: ($-$, "||", none, "||", $+$),
      v-vals: ($+oo$, $0$, $0$, $+oo$),
      shade: ((1, 2),)
    )
  ]
]

== Nhóm 3: Hàm vô tỉ (chứa căn thức)

=== Ví dụ 15 — Hàm số chứa căn thức có tập xác định gồm 2 khoảng
Hàm số $y = sqrt(x^2 - 4)$. Tập xác định $D = (-oo; -2] union [2; +oo)$.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-2$, $2$, $+oo$),
  d-signs: ($-$, "||", none, "||", $+$),
  v-vals: ($+oo$, $0$, $0$, $+oo$),
  shade: ((1, 2),)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-2$, $2$, $+oo$),
      d-signs: ($-$, "||", none, "||", $+$),
      v-vals: ($+oo$, $0$, $0$, $+oo$),
      shade: ((1, 2),)
    )
  ]
]

=== Ví dụ 16 — Hàm số chứa căn thức xác định trên một đoạn
Hàm số $y = sqrt(4 - x^2)$. Xác định trên đoạn $[-2; 2]$, có cực đại tại $x = 0$.
```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-2$, $0$, $2$),
  d-signs: ("||", $+$, $0$, $-$, "||"),
  v-vals: ($0$, $2$, $0$),
  ranks: (-1, 1, -1)
)
```
#demo-out[
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-2$, $0$, $2$),
      d-signs: ("||", $+$, $0$, $-$, "||"),
      v-vals: ($0$, $2$, $0$),
      ranks: (-1, 1, -1)
    )
  ]
]

=== Ví dụ 17 — Hàm số có đạo hàm không xác định tại điểm biên
Hàm số $y = sqrt(x)$. Xác định trên $[0; +oo)$, liên tục tại $x = 0$ nhưng đạo hàm vô nghĩa tại đó.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($0$, $+oo$),
  d-signs: ("||", $+$),
  v-vals: ($0$, $+oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($0$, $+oo$),
      d-signs: ("||", $+$),
      v-vals: ($0$, $+oo$)
    )
  ]
]

== Nhóm 4: Hàm số Mũ, Logarit và Lượng giác

=== Ví dụ 18 — Hàm số mũ đơn điệu
Hàm số $y = 2^x$. Luôn đồng biến trên $RR$.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $+oo$),
  d-signs: ($+$,),
  v-vals: ($0$, $+oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $+oo$),
      d-signs: ($+$,),
      v-vals: ($0$, $+oo$)
    )
  ]
]

=== Ví dụ 19 — Hàm số Logarit cơ bản
Hàm số $y = ln x$. Xác định trên $(0; +oo)$.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($0$, $+oo$),
  d-signs: ("||", $+$),
  v-vals: ($-oo$, $+oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($0$, $+oo$),
      d-signs: ("||", $+$),
      v-vals: ($-oo$, $+oo$)
    )
  ]
]

=== Ví dụ 20 — Hàm số mũ có cực trị
Hàm số $y = x e^{-x}$. Có cực đại tại $x = 1$.
```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $1$, $+oo$),
  d-signs: ($+$, $0$, $-$),
  v-vals: ($-oo$, $1/e$, $0$),
  ranks: (-1, 1, 0)
)
```
#demo-out[
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $1$, $+oo$),
      d-signs: ($+$, $0$, $-$),
      v-vals: ($-oo$, $1/e$, $0$),
      ranks: (-1, 1, 0)
    )
  ]
]

=== Ví dụ 21 — Hàm lượng giác vẽ trên một chu kỳ
Hàm số $y = cos x$ trên đoạn $[0; 2 pi]$.
```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($0$, $pi$, $2 pi$),
  d-signs: ( "-", $0$, "+" ),
  v-vals: ($1$, $-1$, $1$),
  ranks: (1, -1, 1)
)
```
#demo-out[
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($0$, $pi$, $2 pi$),
      d-signs: ( "-", $0$, "+" ),
      v-vals: ($1$, $-1$, $1$),
      ranks: (1, -1, 1)
    )
  ]
]

== Nhóm 5: Bảng xét dấu (#bxd) và các trường hợp đặc biệt

=== Ví dụ 22 — Bảng xét dấu nhị thức bậc nhất
Nhị thức $f(x) = 2x - 4$.
```typst
#bxd(
  var: $x$,
  func: ($2x - 4$),
  x-vals: ($-oo$, $2$, $+oo$),
  f-signs: (
    ($-$, $0$, $+$),
  )
)
```
#demo-out[
  #align(center)[
    #bxd(
      var: $x$,
      func: ($2x - 4$),
      x-vals: ($-oo$, $2$, $+oo$),
      f-signs: (
        ($-$, $0$, $+$),
      )
    )
  ]
]

=== Ví dụ 23 — Bảng xét dấu tam thức bậc hai có hai nghiệm phân biệt
Tam thức $f(x) = x^2 - 3x + 2$.
```typst
#bxd(
  var: $x$,
  func: ($x^2 - 3x + 2$),
  x-vals: ($-oo$, $1$, $2$, $+oo$),
  f-signs: (
    ($+$, $0$, $-$, $0$, $+$),
  ),
  w1:3,
)
```
#demo-out[
  #align(center)[
    #bxd(
      var: $x$,
      func: ($x^2 - 3x + 2$),
      x-vals: ($-oo$, $1$, $2$, $+oo$),
      f-signs: (
        ($+$, $0$, $-$, $0$, $+$),
      ),
      w1:3,
    )
  ]
]

=== Ví dụ 24 — Bảng xét dấu tam thức bậc hai có nghiệm kép
Tam thức $f(x) = (x - 1)^2$. Nghiệm kép không làm tam thức đổi dấu.
```typst
#bxd(
  var: $x$,
  func: ($(x - 1)^2$),
  x-vals: ($-oo$, $1$, $+oo$),
  f-signs: (
    ($+$, $0$, $+$),
  )
)
```
#demo-out[
  #align(center)[
    #bxd(
      var: $x$,
      func: ($(x - 1)^2$),
      x-vals: ($-oo$, $1$, $+oo$),
      f-signs: (
        ($+$, $0$, $+$),
      )
    )
  ]
]

=== Ví dụ 25 — Bảng xét dấu nhiều dòng phức tạp
Hàm đa thức gồm tích các thừa số $f(x) = (x - 1)(x - 2)$.
```typst
#bxd(
  var: $x$,
  func: ($x - 1$, $x - 2$, $f(x)$),
  x-vals: ($-oo$, $1$, $2$, $+oo$),
  f-signs: (
    ($-$, $0$, $+$, $|$, $+$),
    ($-$, $|$, $-$, $0$, $+$),
    ($+$, $0$, $-$, $0$, $+$),
  )
)
```
#demo-out[
  #align(center)[
    #bxd(
      var: $x$,
      func: ($x - 1$, $x - 2$, $f(x)$),
      x-vals: ($-oo$, $1$, $2$, $+oo$),
      f-signs: (
        ($-$, $0$, $+$, $|$, $+$),
        ($-$, $|$, $-$, $0$, $+$),
        ($+$, $0$, $-$, $0$, $+$),
      )
    )
  ]
]

=== Ví dụ 26 — Bảng xét dấu phân thức có chứa mốc không xác định
Xét dấu biểu thức phân thức $f(x) = (x-1)/(x-2)$.
```typst
#bxd(
  var: $x$,
  func: ($x - 1$, $x - 2$, $f(x)$),
  x-vals: ($-oo$, $1$, $2$, $+oo$),
  f-signs: (
    ($-$, $0$, $+$, $|$, $+$),
    ($-$, $|$, $-$, $0$, $+$),
    ($+$, $0$, $-$, $"||"$, $+$),
  )
)
```
#demo-out[
  #align(center)[
    #bxd(
      var: $x$,
      func: ($x - 1$, $x - 2$, $f(x)$),
      x-vals: ($-oo$, $1$, $2$, $+oo$),
      f-signs: (
        ($-$, $0$, $+$, $|$, $+$),
        ($-$, $|$, $-$, $0$, $+$),
        ($+$, $0$, $-$, $"||"$, $+$),
      )
    )
  ]
]

=== Ví dụ 27 — Hàm liên tục nhưng đạo hàm không xác định tại cực trị
Hàm số $y = |x|$. Đạt cực tiểu tại $x = 0$ nhưng không có đạo hàm tại đó.
```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ($-$, "||", $+$),
  v-vals: ($+oo$, $0$, $+oo$)
)
```
#demo-out[
  #align(center)[
    #bbtv2(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $0$, $+oo$),
      d-signs: ($-$, "||", $+$),
      v-vals: ($+oo$, $0$, $+oo$)
    )
  ]
]

=== Ví dụ 28 — Bảng biến thiên tối ưu cực đại (#bbt-opt)
Dùng cho bài toán tối ưu hóa tìm giá trị lớn nhất trên một khoảng.
```typst
#bbt-opt(
  var: $x$, der: $S'$, func: $S$,
  x-vals: ($0$, $15$, $30$),
  d-signs: ($+$, $0$, $-$),
  v-vals: ($0$, $450$, $0$),
  is-min: false
)
```
#demo-out[
  #align(center)[
    #bbt-opt(
      var: $x$, der: $S'$, func: $S$,
      x-vals: ($0$, $15$, $30$),
      d-signs: ($+$, $0$, $-$),
      v-vals: ($0$, $450$, $0$),
      is-min: false
    )
  ]
]

=== Ví dụ 29 — Bảng biến thiên tối ưu cực tiểu (#bbt-opt)
Dùng cho bài toán tối ưu tìm chi phí cực tiểu trên một khoảng.
```typst
#bbt-opt(
  var: $t$, der: $C'$, func: $C$,
  x-vals: ($1$, $4$, $10$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($100$, $25$, $80$),
  is-min: true
)
```
#demo-out[
  #align(center)[
    #bbt-opt(
      var: $t$, der: $C'$, func: $C$,
      x-vals: ($1$, $4$, $10$),
      d-signs: ($-$, $0$, $+$),
      v-vals: ($100$, $25$, $80$),
      is-min: true
    )
  ]
]

=== Ví dụ 30 — Bảng giá trị tọa độ vẽ đồ thị
Dựng bảng giá trị 2 dòng biểu diễn tọa độ điểm vẽ đồ thị.
```typst
#bang-gia-tri(
  labels: ($x$, $-2$, $-1$, $0$, $1$, $2$),
  rows: (
    ($y$, $-1$, $1$, $1$, $1$, $5$),
  )
)
```
#demo-out[
  #align(center)[
    #bang-gia-tri(
      labels: ($x$, $-2$, $-1$, $0$, $1$, $2$),
      rows: (
        ($y$, $-1$, $1$, $1$, $1$, $5$),
      )
    )
  ]
]

// ══════════════════════════════════════════════════════════════════
= Biên soạn Sách / Chuyên đề / SGK (doc-type: "book")
// ══════════════════════════════════════════════════════════════════

Khi biên soạn các tài liệu dài như Sách tham khảo, Chuyên đề học tập, hoặc Sách giáo khoa (SGK), hệ thống cung cấp giao diện chuyên dụng bằng cách đặt cấu hình `doc-type: "book"` (hoặc `"sgk"`, `"chuyende"`).

== 1. Thiết lập cấu hình chung cho Sách
Trong tệp chính của tài liệu, bạn gọi cấu hình `stexgv-book` như sau:
```typst
#show: stexgv-book.with(
  title: "CHUYÊN ĐỀ HỌC TẬP TOÁN 12",
  subtitle: "Chương trình GDPT mới",
  author: "Tác giả Nguyễn Văn Sang",
  theme-color: rgb("#1e3a8a"), // Màu chủ đạo
  doc-type: "book",            // "book" | "sgk" | "chuyende"
  show-cover: true,            // Hiển thị trang bìa
  show-outline: true,          // Tự động tạo mục lục
  outline-depth: 3,            // Độ sâu mục lục
)
```

== 2. Bố cục phân cấp của Sách
Giao diện Sách hỗ trợ các phân cấp nội dung được đánh số tự động hóa:
- *Phần lớn (`#part` hoặc `#unit`)*: Khung nội dung lớn (ví dụ: Giải tích, Hình học).
- *Chương (`#chapter`)*: Khởi tạo chương mới, tự động reset bộ đếm các Bài/Ví dụ/Bài tập bên trong.
- *Bài (`#lesson` hoặc `#bai` / `#topic` / `#dang`)*: Đơn vị bài học hoặc dạng toán.
- *Mục (`#section` hoặc `#muc`)*: Mục kiến thức lớn trong bài.
- *Tiểu mục (`#subsection` hoặc `#tieumuc`)*: Các nhánh nhỏ hơn.
- *Ý (`#microsection` hoặc `#y`)*: Các ý nhỏ dưới tiểu mục.

Ví dụ cách tổ chức mã nguồn:
```typst
#part("Giải Tích")
#chapter("Ứng dụng đạo hàm để khảo sát hàm số")
#lesson("Tính đơn điệu của hàm số")
#muc("Tính đơn điệu và dấu của đạo hàm")
#tieumuc("Định lý về tính đơn điệu")
#y("Điều kiện cần")
```

== 3. Các hộp kiến thức và sư phạm chuyên dụng
Để tăng tính chuyên nghiệp và trực quan cho bài học, giao diện Sách tích hợp sẵn các loại hộp thông tin sư phạm có thiết kế phối màu tinh tế:
- *Lý thuyết & Khái niệm*:
  - Định nghĩa: `#dn[Nội dung...]` hoặc `#definition[Nội dung...]`
  - Định lý: `#dl[Nội dung...]` hoặc `#theorem[Nội dung...]`
  - Tính chất: `#tc[Nội dung...]`
  - Bổ đề: `#bode[Nội dung...]`
- *Hộp ghi chú & Phương pháp*:
  - Phương pháp giải toán: `#phuongphap[Nội dung...]`
  - Ghi nhớ: `#ghinho[Nội dung...]`
  - Nhận xét: `#nhanxet[Nội dung...]`
  - Lưu ý: `#luuy[Nội dung...]`
  - Tóm tắt kiến thức: `#tomtat[Nội dung...]`
  - Vận dụng thực tế: `#vandung[Nội dung...]`
  - Dự án học tập: `#duan[Nội dung...]`
  - Luyện tập củng cố: `#luyentap[Nội dung...]`

Ví dụ cách dùng hộp phương pháp:
```typst
#phuongphap(title: [Phương pháp tìm cực trị])[
  1. Tính đạo hàm $f'(x)$.
  2. Tìm các điểm tại đó đạo hàm bằng 0 hoặc không xác định.
  3. Lập bảng biến thiên và kết luận.
]
```

// ══════════════════════════════════════════════════════════════════
= Khối bao nháp học sinh (`#q-wrap`)
// ══════════════════════════════════════════════════════════════════

Trong các cuốn sách bài tập hoặc chuyên đề, ta thường muốn chèn thêm một khoảng trống có dòng kẻ nháp (giấy tập học sinh) kế bên câu hỏi để học sinh có thể ghi lời giải trực tiếp. Khối `#q-wrap` (Question Wrapper) chính là công cụ để làm việc này.

== 1. Cơ chế hoạt động của `#q-wrap`
- Khi tài liệu ở chế độ *Hai cột (`two-column-mode: true`)*: `#q-wrap` tự động dựng một lưới bảng gồm:
  - Cột bên trái: Nội dung câu hỏi trắc nghiệm/tự luận.
  - Cột bên phải: Khối giấy nháp kẻ dòng đứt đoạn cho học sinh làm bài.
- Khi tài liệu ở chế độ *Một cột (`two-column-mode: false`)*: `#q-wrap` sẽ ẩn phần dòng kẻ nháp và chỉ hiển thị nội dung câu hỏi một cách bình thường để tiết kiệm không gian.

== 2. Các tham số cấu hình `#q-wrap`
- `dir`: Hướng của ô nháp.
  - `"ngang"` (Mặc định): Đặt ô nháp nằm song song bên phải câu hỏi.
  - `"doc"`: Đặt ô nháp nằm ngay dưới câu hỏi.
- `lines` (Số nguyên): Số lượng dòng kẻ nháp (khoảng cách mỗi dòng là `22pt`). Ví dụ: `lines: 5`.
- `height` (Độ dài): Ép độ cao cố định cho ô nháp (ví dụ: `height: 120pt`). Nếu không truyền cả `lines` và `height`, hệ thống tự động đo độ cao của câu hỏi để sinh ra số dòng tương ứng.

=== Tuyển tập 10 Ví dụ thực chiến sử dụng `#q-wrap`

Dưới đây là 10 ví dụ thực tế giúp bạn nắm vững mọi trường hợp sử dụng `#q-wrap` trong tài liệu:

#let demo-q-wrap(dir: "ngang", lines: auto, height: auto, q) = {
  let line-pattern = tiling(size: (20cm, 22pt))[
    #place(bottom, line(length: 20cm, stroke: (paint: gray.darken(30%), thickness: 0.25pt, dash: "dashed")))
  ]
  let rect-h = if height != auto {
    height
  } else if lines != auto {
    lines * 22pt
  } else {
    88pt
  }
  
  if dir == "ngang" {
    block(width: 100%)[
      #table(
        columns: (1fr, 1.15fr),
        align: (left + top, left + top),
        stroke: .8pt + c-sky,
        inset: 8pt,
        [#q],
        [
          #text(size: 8pt, fill: gray)[_Bài làm / Nháp:_]
          #v(0.3em)
          #rect(width: 100%, height: rect-h, stroke: none, fill: line-pattern)
        ]
      )
    ]
  } else {
    block(width: 100%)[
      #table(
        columns: (1fr,),
        align: (left + top,),
        stroke: .8pt + c-sky,
        inset: 8pt,
        [#q],
        [
          #text(size: 8pt, fill: gray)[_Bài làm / Nháp:_]
          #v(0.3em)
          #rect(width: 100%, height: rect-h, stroke: none, fill: line-pattern)
        ]
      )
    ]
  }
}

==== Ví dụ 1 — Hướng ngang, 4 dòng kẻ nháp với trắc nghiệm lựa chọn (Sử dụng `setminus`)
```typst
#q-wrap(dir: "ngang", lines: 4,
  tn(
    [Tìm tập xác định $D$ của hàm số $y = log_2 (x - 1)$.],
    ([$D = (0; +oo)$], True([$D = (1; +oo)$]), [$D = R setminus {1}$], [$D = [1; +oo)$]),
  )
)
```
#demo-out[
  #demo-q-wrap(dir: "ngang", lines: 4,
    tn(
      [Tìm tập xác định $D$ của hàm số $y = log_2 (x - 1)$.],
      ([$D = (0; +oo)$], True([$D = (1; +oo)$]), [$D = R setminus {1}$], [$D = [1; +oo)$]),
    )
  )
]

==== Ví dụ 2 — Hướng ngang, 3 dòng kẻ nháp
```typst
#q-wrap(dir: "ngang", lines: 3,
  tn(
    [Tìm giá trị cực tiểu của hàm số $y = x^3 - 3x + 2$.],
    ([$y_(C T) = 4$], [$y_(C T) = 2$], True([$y_(C T) = 0$]), [$y_(C T) = -1$]),
  )
)
```
#demo-out[
  #demo-q-wrap(dir: "ngang", lines: 3,
    tn(
      [Tìm giá trị cực tiểu của hàm số $y = x^3 - 3x + 2$.],
      ([$y_(C T) = 4$], [$y_(C T) = 2$], True([$y_(C T) = 0$]), [$y_(C T) = -1$]),
    )
  )
]

==== Ví dụ 3 — Hướng ngang, 5 dòng kẻ nháp
```typst
#q-wrap(dir: "ngang", lines: 5,
  tn(
    [Tìm tập hợp tất cả các giá trị thực của tham số $m$ để hàm số $y = ln(x^2 - 2x + m)$ có tập xác định là $R$.],
    ([$m > 0$], [$m >= 1$], True([$m > 1$]), [$m < 1$]),
  )
)
```
#demo-out[
  #demo-q-wrap(dir: "ngang", lines: 5,
    tn(
      [Tìm tập hợp tất cả các giá trị thực của tham số $m$ để hàm số $y = ln(x^2 - 2x + m)$ có tập xác định là $R$.],
      ([$m > 0$], [$m >= 1$], True([$m > 1$]), [$m < 1$]),
    )
  )
]

==== Ví dụ 4 — Hướng dọc, 4 dòng kẻ nháp
```typst
#q-wrap(dir: "doc", lines: 4,
  tn(
    [Đường tiệm cận đứng của đồ thị hàm số $y = (2x - 1)/(x - 1)$ là:],
    ([$y = 2$], [$y = 1$], [$x = 2$], True([$x = 1$])),
  )
)
```
#demo-out[
  #demo-q-wrap(dir: "doc", lines: 4,
    tn(
      [Đường tiệm cận đứng của đồ thị hàm số $y = (2x - 1)/(x - 1)$ là:],
      ([$y = 2$], [$y = 1$], [$x = 2$], True([$x = 1$])),
    )
  )
]

==== Ví dụ 5 — Hướng ngang, độ cao cố định 100pt với câu trả lời ngắn
```typst
#q-wrap(dir: "ngang", height: 100pt,
  tln(
    [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x - 1)^2$. Tính số điểm cực trị của hàm số đã cho.],
    [1],
  )
)
```
#demo-out[
  #demo-q-wrap(dir: "ngang", height: 100pt,
    tln(
      [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x - 1)^2$. Tính số điểm cực trị của hàm số đã cho.],
      [1],
    )
  )
]

==== Ví dụ 6 — Hướng dọc, 3 dòng kẻ nháp với câu trả lời ngắn
```typst
#q-wrap(dir: "doc", lines: 3,
  tln(
    [Tìm số nghiệm nguyên của bất phương trình $2^(x^2 - x) < 4$.],
    [3],
  )
)
```
#demo-out[
  #demo-q-wrap(dir: "doc", lines: 3,
    tln(
      [Tìm số nghiệm nguyên của bất phương trình $2^(x^2 - x) < 4$.],
      [3],
    )
  )
]

==== Ví dụ 7 — Hướng ngang, tự động đo chiều cao câu hỏi trắc nghiệm Đúng/Sai
```typst
#q-wrap(dir: "ngang",
  ds(
    [Cho hàm số $y = f(x) = (a x + b)/(x + c)$ có đồ thị như hình vẽ. Xét tính đúng sai của các khẳng định sau:],
    (
      True([Hàm số đồng biến trên từng khoảng xác định.]),
      True([Đường tiệm cận đứng là $x = -c$.]),
      [Đạo hàm $f'(x) < 0$ với mọi $x != -c$.],
      [Đồ thị hàm số đi qua gốc tọa độ.],
    )
  )
)
```
#demo-out[
  #demo-q-wrap(dir: "ngang", lines: 5,
    ds(
      [Cho hàm số $y = f(x) = (a x + b)/(x + c)$ có đồ thị như hình vẽ. Xét tính đúng sai của các khẳng định sau:],
      (
        True([Hàm số đồng biến trên từng khoảng xác định.]),
        True([Đường tiệm cận đứng là $x = -c$.]),
        [Đạo hàm $f'(x) < 0$ với mọi $x != -c$.],
        [Đồ thị hàm số đi qua gốc tọa độ.],
      )
    )
  )
]

==== Ví dụ 8 — Hướng dọc, tự động đo chiều cao câu hỏi trắc nghiệm Đúng/Sai
```typst
#q-wrap(dir: "doc",
  ds(
    [Cho cấp số cộng $(u_n)$ có $u_1 = 3$ và công sai $d = 2$. Các phát biểu sau đúng hay sai?],
    (
      True([Số hạng tổng quát $u_n = 2n + 1$.]),
      True([Số hạng thứ năm $u_5 = 11$.]),
      True([Tổng 5 số hạng đầu tiên $S_5 = 35$.]),
      [Công thức tổng quát $u_n = 3n - 1$.],
    )
  )
)
```
#demo-out[
  #demo-q-wrap(dir: "doc", lines: 5,
    ds(
      [Cho cấp số cộng $(u_n)$ có $u_1 = 3$ và công sai $d = 2$. Các phát biểu sau đúng hay sai?],
      (
        True([Số hạng tổng quát $u_n = 2n + 1$.]),
        True([Số hạng thứ năm $u_5 = 11$.]),
        True([Tổng 5 số hạng đầu tiên $S_5 = 35$.]),
        [Công thức tổng quát $u_n = 3n - 1$.],
      )
    )
  )
]

==== Ví dụ 9 — Hướng ngang, 6 dòng kẻ nháp với Câu hỏi Tự luận
```typst
#q-wrap(dir: "ngang", lines: 6,
  tl([Giải phương trình lượng giác sau trên tập số thực: $sin 2x - cos x = 0$.])
)
```
#demo-out[
  #demo-q-wrap(dir: "ngang", lines: 6,
    tl([Giải phương trình lượng giác sau trên tập số thực: $sin 2x - cos x = 0$.])
  )
]

==== Ví dụ 10 — Hướng dọc, 5 dòng kẻ nháp với Câu hỏi Tự luận
```typst
#q-wrap(dir: "doc", lines: 5,
  tl([Cho hình chóp $S.A B C$ có đáy là tam giác đều cạnh $a$. Cạnh bên $S A$ vuông góc với mặt đáy và $S A = a sqrt(3)$. Tính thể tích khối chóp $S.A B C$.])
)
```
#demo-out[
  #demo-q-wrap(dir: "doc", lines: 5,
    tl([Cho hình chóp $S.A B C$ có đáy là tam giác đều cạnh $a$. Cạnh bên $S A$ vuông góc với mặt đáy và $S A = a sqrt(3)$. Tính thể tích khối chóp $S.A B C$.])
  )
]

= Bảng tra cứu nhanh
// ══════════════════════════════════════════════════════════════════

== Tóm tắt 4 loại câu hỏi

#table(
  columns: (auto, auto, auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 7pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Macro*], [*Đối số 1*], [*Đối số 2*], [*Đặc điểm*],
  [`#tn`], [stem], [tuple phương án], [Tự động 1/2/4 cột; True() đánh dấu đúng],
  [`#ds`], [stem chung], [tuple 4 phát biểu], [True() = phát biểu đúng; hiện Đ/S khi loigiai],
  [`#tln`], [stem], [đáp án], [4 ô trống chế độ đề thi; hiện đáp án khi loigiai],
  [`#tl`], [stem], [*(không có)*], [Dòng kẻ trống; lời giải khi loigiai],
)

== Tóm tắt tham số hình vẽ

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 8pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Tham số*], [*Giá trị và ý nghĩa*],
  [`fig:`], [Canvas cetz hoặc nội dung Typst bất kỳ. Mặc định `none` (không hình).],
  [`fig-pos:`], [`"right"` (mặc định) · `"left"` · `"center"` (phía dưới căn giữa)],
  [`fig-width:`], [Chiều rộng vùng hình khi `fig-pos` là `"right"` hoặc `"left"`. Ví dụ: `35%`, `4cm`.],
)

== Lệnh biên dịch chuẩn

```bash
# Từ thư mục gốc workspace
typst compile --root . "typst/exams/ten-file.typ"
typst compile --root . "typst/De-Cac-So/ten-de.typ"

# Tinymist (VS Code extension) tự động dùng settings.json:
# "tinymist.typstExtraArgs": ["--root", "${workspaceFolder}"]
```

// ══════════════════════════════════════════════════════════════════
= Hệ thống Beamer — Trình chiếu chữa đề
// ══════════════════════════════════════════════════════════════════

Hệ thống Beamer cho phép biên soạn *một file đề thi duy nhất* vừa ra đề in A4 vừa ra slide trình chiếu 16:9, *không cần sửa nội dung câu hỏi*.

== Kiến trúc tổng quan

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 8pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*File*], [*Vai trò*],
  [`sang-beamer.typ`], [Engine core: theme Metropolis + touying 0.7.3, hàm câu hỏi slide, hệ thống màu tự động],
  [`Beamer.typ`], [File entry point: cấu hình giao diện, import đề, compile thành slide],
  [`De-Cac-So/ten-de.typ`], [File đề thi: vừa standalone A4 vừa export `make-questions` cho Beamer],
)

== Cấu trúc file đề thi tương thích Beamer

Mỗi file đề trong `De-Cac-So/` cần thêm *đúng 3 chỗ* để hỗ trợ cả hai chế độ:

```typst
// ① Phần đầu — KHÔNG thay đổi, dùng sang-exam bình thường
#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.0"
#let mode = "loigiai"
#let accent = classic.blue
#show math.equation: set text(fill: black)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// Tiêu đề đề thi (chỉ hiển thị khi in A4)
#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC...",
  // ...
)

// ② Bọc toàn bộ câu hỏi trong hàm make-questions
//    Thêm dòng này TRƯỚC #exam-part đầu tiên:
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I...], count: 12)
#tn([...], (...))
// ... tất cả câu hỏi ...

]  // ← đóng make-questions

// ③ Cuối file — chỉ chạy khi in A4, bỏ qua khi Beamer import
#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
}
```

#demo-out[
  #grid(
    columns: (1fr, 1fr),
    align: center,
    [*SỞ GIÁO DỤC VÀ ĐÀO TẠO*\ *TỈNH ...*],
    [*KỲ THI THỬ ...*\ *Môn: TOÁN*]
  )
  #align(center)[_Thời gian làm bài: 90 phút_\ Mã đề: 101]
  #v(1em)
  
  #let em = exam-mode(mode: "loigiai", accent: classic.blue)
  #let make-questions(tn: em.tn, ds: em.ds, tln: em.tln, tl: em.tl, exam-part: exam-part) = [
    #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án], count: 1)
    #tn(
      [Hàm số nào dưới đây đồng biến trên $RR$?],
      ([$y = (2x-1)/(x+1)$], True([$y = x^3+x$]), [$y = x^2$], [$y = -x^3$]),
      loigiai: [$y'=3x^2+1>0, forall x in RR$.]
    )
  ]
  #make-questions()
]

#caution[Toàn bộ `#exam-part`, `#tn`, `#ds`, `#tln`, `#tl` phải nằm BÊN TRONG `make-questions(...)`. Không có ngoại lệ.]

== Cấu hình Beamer.typ

```typst
#import "sang-beamer.typ": *

// ── Tuỳ chọn giao diện ────────────────────────────────
#let accent       = classic.blue      // Màu chủ đạo
#let bm-title     = "CHỮA ĐỀ THPT QG 2026"
#let bm-subtitle  = "TOÁN - LỚP 12"
#let bm-author    = "GV Nguyễn Văn Sang"
#let bm-institution = "ĐỀ THI THỬ"
#let bm-code      = "101"             // Mã đề

// ── Màu nền — tất cả còn lại tự động thích nghi ───────
#let bm-bg-color   = rgb("#0f172a")   // Tối đêm (mặc định đẹp)
// Các lựa chọn khác:
//   rgb("#0a1628")  — Xanh navy
//   rgb("#1a0a2e")  — Tối tím
//   rgb("#ffffff")  — Trắng (nền sáng)
//   rgb("#f1f5f9")  — Xám nhạt

// ── Màu công thức toán ─────────────────────────────────
#let bm-math-color = rgb("#f59e0b")   // Vàng (đẹp trên nền tối)
// Trên nền sáng nên dùng: rgb("#1553a0") hoặc rgb("#c00000")

// ── Cỡ chữ ────────────────────────────────────────────
#let bm-text-size = 18pt
#let bm-q-size    = 17pt
#let bm-opt-size  = 15pt
#let bm-sol-size  = 13pt

// ── Số câu (navigation dots ở footer) ─────────────────
#let bm-total-q = 22

// ── Step-by-step reveal ───────────────────────────────
#let bm-auto-step = false   // true = mỗi #step tự pause

#show: sang-beamer-theme.with(
  title: bm-title, subtitle: bm-subtitle, author: bm-author,
  institution: bm-institution, accent: accent, code: bm-code,
  total-q: bm-total-q, bg_color: bm-bg-color, text_size: bm-text-size,
  math_color: bm-math-color, question_size: bm-q-size,
  option_size: bm-opt-size, solution_size: bm-sol-size,
  auto_step_pause: bm-auto-step,
)

#let mode = "loigiai"
#let _m = exam-mode(mode: mode, accent: accent)

// Import và gọi make-questions với hàm beamer
#import "De-Cac-So/2026-Sở-An-Giang.typ": make-questions as _de
#_de(tn: _m.tn, ds: _m.ds, tln: _m.tln, tl: _m.tl, exam-part: exam-part)

#het
```

== Hệ thống màu tự động thích nghi

Chỉ cần đổi `bm-bg-color` — tất cả màu còn lại tự tính:

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 8pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Nền*], [*Phát hiện*], [*Tự động sinh*],
  [`rgb("#0f172a")` (tối)], [dark], [Chữ trắng · Card tối hơn · Sol xám nhạt · Muted xám],
  [`rgb("#ffffff")` (sáng)], [light], [Chữ đen · Card sáng hơn · Sol xám tối · Muted xám đậm],
)

#caution[Khi dùng nền sáng, nên đổi `bm-math-color` sang màu tối: `rgb("#1553a0")` (xanh đậm) hoặc `rgb("#c00000")` (đỏ đậm) để toán dễ đọc.]

== Biên dịch Beamer

```bash
# Compile ra PDF slide (không cần --input beamer=1)
npm run compile:Beamer

# Watch mode — tự recompile mỗi khi save
npm run watch:Beamer
```

#tip[Mở file PDF kết quả bằng *Preview.app* (macOS) — nó tự refresh khi file thay đổi. Preview file đề thi gốc vẫn dùng tinymist bình thường, hai workflow không xung đột nhau.]

== Thêm đề mới vào Beamer

*Bước 1:* Thêm `make-questions` vào file đề (3 chỗ như hướng dẫn ở trên).

*Bước 2:* Trong `Beamer.typ`, thêm 2 dòng:

```typst
#import "De-Cac-So/TenDeFile.typ": make-questions as _ten
#_ten(tn: _m.tn, ds: _m.ds, tln: _m.tln, tl: _m.tl, exam-part: exam-part)
```

Để trình chiếu *nhiều đề liên tiếp* trong cùng một buổi, xếp nhiều import liên tiếp:

```typst
#import "De-Cac-So/2026-Sở-An-Giang.typ": make-questions as _ag
#import "De-Cac-So/2026-Sở-Đồng-Tháp.typ": make-questions as _dt

#_ag(tn: _m.tn, ds: _m.ds, tln: _m.tln, tl: _m.tl, exam-part: exam-part)
#_dt(tn: _m.tn, ds: _m.ds, tln: _m.tln, tl: _m.tl, exam-part: exam-part)
#het
```

== Tham số `sang-beamer-theme`

#param("title:", "string", required: true)[Tên bài giảng / đề thi, hiển thị trên slide tiêu đề và header.]
#param("subtitle:", "string", default: "\"\"")[Phụ đề, ví dụ tên lớp.]
#param("author:", "string", default: "\"\"")[Tên giáo viên.]
#param("institution:", "string", default: "\"\"")[Tên trường / kỳ thi.]
#param("accent:", "color", default: "classic.blue")[Màu chủ đạo — dùng cho header, nhãn câu, nút navigation.]
#param("bg_color:", "color", default: "rgb(\"#0f172a\")")[Màu nền slide. Mọi màu khác tự sinh từ đây.]
#param("math_color:", "color", default: "rgb(\"#f59e0b\")")[Màu công thức toán trong slide.]
#param("total-q:", "int", default: "22")[Số câu — quyết định số nút tròn ở footer.]
#param("text_size:", "length", default: "18pt")[Cỡ chữ body toàn slide.]
#param("question_size:", "length", default: "17pt")[Cỡ chữ đề bài câu hỏi.]
#param("option_size:", "length", default: "15pt")[Cỡ chữ các phương án A/B/C/D.]
#param("solution_size:", "length", default: "13pt")[Cỡ chữ lời giải.]
#param(
  "auto_step_pause:",
  "bool",
  default: "false",
)[`true` = mỗi `#step[...]` trong lời giải tự tạo pause (click để hiện từng bước).]

== Navigation dots — nút nhảy câu

Footer mỗi slide có hàng nút tròn nhỏ, mỗi nút ứng với 1 câu. Click vào nút để nhảy thẳng đến câu đó.

- Nút *sáng* (có viền accent): slide câu đó đã được biên dịch thành công.
- Nút *mờ*: chưa có câu ứng với số đó.

#tip[Nếu thêm câu nhưng nút không hiện: kiểm tra `bm-total-q` trong `Beamer.typ` — cần tăng lên bằng số câu thực tế.]

== Hàm câu hỏi trong Beamer

Các hàm `tn`, `ds`, `tln`, `tl` trong beamer nhận *cùng tham số* với sang-exam:

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 8pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Tham số*], [*Ý nghĩa trong beamer*],
  [`loigiai:`], [Nội dung slide đáp án. Nếu `none`, chỉ có 1 slide câu hỏi.],
  [`fig:`], [Hình vẽ — tự động đặt trên nền trắng để rõ trên mọi nền slide.],
  [`fig-width:`], [Chiều rộng cột hình. Mặc định `40%`.],
  [`num:`], [`auto` (tự đếm liên tục) hoặc số cụ thể để ép số câu.],
  [`prefix:`], [Nhãn trước số câu. Mặc định `"Câu"`.],
  [`mode:`], [Luôn `"loigiai"` trong beamer (tự động từ `exam-mode`).],
)

#tip[Hộp `#ppgiai`, `#luuy`, `#meo`, `#step` dùng bình thường trong `loigiai:` của beamer — chữ tự chuyển sang màu tối để đọc được trên nền hộp sáng.]





