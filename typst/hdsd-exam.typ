// ═══════════════════════════════════════════════════════════
// HƯỚNG DẪN SỬ DỤNG HỆ THỐNG ĐỀ THI  — sang-exam.typ
// Biên soạn: GV Nguyễn Văn Sang
// ═══════════════════════════════════════════════════════════
#import "sang-exam.typ": *
#import "@preview/cetz:0.5.2"

// ── Trang và font ──────────────────────────────────────────
#set page(
  paper: "a4",
  margin: (x: 2.2cm, y: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      set text(size: 8.5pt, fill: luma(130))
      grid(
        columns: (1fr, auto),
        [Hướng dẫn sử dụng `sang-exam.typ`], [Trang #counter(page).display()],
      )
      line(length: 100%, stroke: 0.4pt + luma(200))
    }
  },
  footer: context {
    set text(size: 8pt, fill: luma(160))
    align(center)[GV Nguyễn Văn Sang · Hệ thống đề thi Typst · #datetime.today().display("[day]/[month]/[year]")]
  },
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(leading: 0.8em, justify: true)
#set list(indent: 1em, body-indent: 0.5em)
#show: sang-setup

// ── Heading styles ──────────────────────────────────────────
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(width: 100%, above: 1.2em, below: 0.8em, fill: rgb("1a5276"), inset: (x: 12pt, y: 8pt), radius: 4pt, text(
    fill: white,
    size: 14pt,
    weight: "bold",
  )[
    #counter(heading).display(). #it.body
  ])
}
#show heading.where(level: 2): it => block(
  width: 100%,
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 4pt + rgb("1a5276")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("1a5276"), size: 12pt, weight: "bold")[
    #counter(heading).display(). #it.body
  ],
)
#show heading.where(level: 3): it => block(
  above: 0.9em,
  below: 0.4em,
  text(fill: rgb("900c3f"), size: 11pt, weight: "bold")[
    #it.body
  ],
)

// ── Macro tiện lợi cho HDSD ────────────────────────────────
// Hộp tham số
#let param(name, type-str, default: none, required: false, desc) = {
  block(
    width: 100%,
    above: 0.4em,
    below: 0.4em,
    stroke: 0.4pt + luma(200),
    inset: (x: 10pt, y: 6pt),
    radius: 3pt,
    fill: luma(252),
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      [#text(weight: "bold", font: "Courier New", size: 10pt)[#name]
        #h(4pt)
        #if required {
          box(fill: rgb("c0392b"), inset: (x: 4pt, y: 1pt), radius: 2pt, text(fill: white, size: 8pt)[bắt buộc])
        } else {
          box(fill: rgb("27ae60"), inset: (x: 4pt, y: 1pt), radius: 2pt, text(fill: white, size: 8pt)[tuỳ chọn])
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
  stroke: 1pt + rgb("2980b9"),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  fill: rgb("eaf4fb"),
)[
  #text(size: 8pt, fill: rgb("2980b9"), weight: "bold")[KẾT QUẢ HIỂN THỊ:]
  #v(0.4em)
  #body
]

// Hộp cảnh báo
#let caution(body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.5em,
  stroke: (left: 4pt + rgb("e67e22")),
  inset: (left: 10pt, right: 8pt, y: 6pt),
  fill: rgb("fef9e7"),
)[
  #text(weight: "bold", fill: rgb("e67e22"))[⚠ Lưu ý:] #body
]

// Hộp gợi ý
#let tip(body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.5em,
  stroke: (left: 4pt + rgb("27ae60")),
  inset: (left: 10pt, right: 8pt, y: 6pt),
  fill: rgb("eafaf1"),
)[
  #text(weight: "bold", fill: rgb("27ae60"))[💡 Mẹo:] #body
]

// ══════════════════════════════════════════════════════════════════
//  BÌA
// ══════════════════════════════════════════════════════════════════
#set page(header: none, footer: none)
#v(3cm)
#align(center)[
  #block(fill: rgb("1a5276"), width: 100%, inset: (x: 2cm, y: 1.5cm), radius: 8pt)[
    #text(fill: white, size: 10pt, tracking: 4pt)[HƯỚNG DẪN SỬ DỤNG]
    #v(0.3em)
    #text(fill: white, size: 22pt, weight: "bold")[Hệ thống soạn đề thi Typst]
    #v(0.3em)
    #text(fill: rgb("aed6f1"), size: 12pt)[`sang-exam.typ` — Phiên bản đầy đủ]
  ]
  #v(1.5cm)
  #text(size: 12pt)[GV Nguyễn Văn Sang]
  #v(0.4em)
  #text(size: 10pt, fill: luma(120))[#datetime.today().display("[day]/[month]/[year]")]
]
#v(2cm)
#block(width: 100%, stroke: 0.5pt + luma(200), inset: 16pt, radius: 6pt, fill: luma(250))[
  *Tài liệu này hướng dẫn chi tiết* cách sử dụng hệ thống soạn thảo đề thi Typst với `sang-exam.typ`.
  Nội dung bao gồm:
  - Cú pháp đầy đủ của 4 loại câu hỏi (`#tn`, `#ds`, `#tln`, `#tl`)
  - Cách chèn hình vẽ vào đề thi
  - Các chế độ hiển thị: đề thi, lời giải, màu sắc
  - Các hộp sư phạm và lệnh định dạng bổ sung
  - Ví dụ biên dịch có kết quả minh hoạ trực tiếp
]
#pagebreak()
#set page(
  header: context {
    if counter(page).get().first() > 1 {
      set text(size: 8.5pt, fill: luma(130))
      grid(
        columns: (1fr, auto),
        [Hướng dẫn sử dụng `sang-exam.typ`], [Trang #counter(page).display()],
      )
      line(length: 100%, stroke: 0.4pt + luma(200))
    }
  },
  footer: context {
    set text(size: 8pt, fill: luma(160))
    align(center)[GV Nguyễn Văn Sang · Hệ thống đề thi Typst · #datetime.today().display("[day]/[month]/[year]")]
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
  boxed: false,                // đóng khung toàn câu
)
```

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

== Ví dụ tổng hợp

```typst
// tn có hình bên phải
#tn(
  [Đường tròn bên có bao nhiêu điểm cực trị?],
  (True([$0$]), [$1$], [$2$], [$4$]),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    circle((0,0), radius: 1.5, stroke: 1pt + blue)
    circle((0,0), radius: 3pt, fill: black)
    content((1.8, 0.3), $A$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  loigiai: [Đường tròn không phải đồ thị hàm số → không có cực trị.],
)

// tln có hình dưới, dòng tính
#tln(
  [Tính diện tích tam giác $OAB$ với $A(3;0)$, $B(0;4)$.],
  [$6$],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((0,0),(3,0),(0,4),(0,0), stroke: 1pt)
    content((3.3,0),$A$); content((-0.3,4.3),$B$); content((-0.3,-0.3),$O$)
  }),
  fig-pos: "center",
  lines: 2,
  loigiai: [$S = 1/2 dot 3 dot 4 = 6$.],
)
```

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
= Tiêu đề đề thi — `#thpt-school-exam`
// ══════════════════════════════════════════════════════════════════

```typst
#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",   // dòng 1 tiêu đề trái
  school: "TỈNH ĐỒNG THÁP",                 // dòng 2 tiêu đề trái
  exam-title: "KỲ THI THỬ TỐT NGHIỆP ...", // tên kỳ thi, căn giữa
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  code: "001",                               // mã đề
  structure: auto,                           // tự sinh dòng "Đề gồm X câu"
  footer-left: [ĐỀ CHÍNH THỨC \ (Đề thi có 04 trang)],
  accent: accent,
  show-topbar: true,        // thanh màu phía trên
  header-border: true,      // đường kẻ dưới tiêu đề
)
```

#caution[`#show: thpt-school-exam.with(...)` phải đặt *trước* `#exam-part` và các câu hỏi. Đặt sau `#let (tn,ds,tln,tl) = exam-mode(...)` và sau `#show: sang-setup`.]

// ══════════════════════════════════════════════════════════════════
= Phần thi — `#exam-part`
// ══════════════════════════════════════════════════════════════════

```typst
// Phần trắc nghiệm — tự động đếm 12 câu
#exam-part([PHẦN I. Câu trắc nghiệm. Thí sinh chọn 1 phương án.], count: 12)

// Phần đúng-sai — đặt số câu bắt đầu
#exam-part([PHẦN II. Câu đúng-sai.], count: 4)

// Phần tự luận — không cần count
#exam-part([PHẦN III. Câu tự luận.])
```

Tham số quan trọng:

#param("body", "content", required: true)[Tên phần, thường là mô tả ngắn về loại câu hỏi và hướng dẫn.]
#param("count:", "int", default: "none")[Số câu trong phần. Nếu cung cấp, phần này hiển thị "Câu 1 đến Câu N".]
#param("reset-counter:", "bool", default: "false")[Reset số câu về 1 khi bắt đầu phần. Mặc định số câu chạy liên tục.]

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
= `#tfrac` — Phân số cỡ nhỏ
// ══════════════════════════════════════════════════════════════════

Khi `sang-setup` đang bật, mọi `$a/b$` đều to như dfrac. Dùng `tfrac` khi muốn giữ cỡ nhỏ inline:

```typst
// Phân số bình thường (nhỏ, inline)
$x = tfrac(1, 2) y + z$

// Phân số trong câu văn
Xác suất là $tfrac(3, 5)$.

// Công thức có cả hai loại
$ integral_0^1 tfrac(1, sqrt(x)) dif x = 2 $
```

#demo-out[
  Phân số display: $a/b + c/d$ #h(2em) Phân số inline: $tfrac(1, 2) + tfrac(3, 4)$
]

// ══════════════════════════════════════════════════════════════════
= Bảng biến thiên — `bbt.typ`
// ══════════════════════════════════════════════════════════════════

Nhắc lại nhanh (xem `hdsd-bbt.typ` để chi tiết đầy đủ):

== Chọn hàm

#table(
  columns: (auto, 1fr, auto),
  stroke: 0.5pt + luma(180),
  inset: 8pt,
  fill: (_, row) => if row == 0 { luma(225) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Hàm*], [*Dùng khi nào*], [*`d-signs` (n cột)*],
  [`bbt-opt`], [3 cột, đúng 1 cực trị, có `is-min`], [3 phần tử],
  [`bbbt`], [Tổng quát, nhiều cực trị, n cột bất kỳ], [2n−1 phần tử],
  [`bbtv2`], [Có tiệm cận / vùng gạch chéo], [2n−1 phần tử],
  [`bxd`], [Bảng xét dấu], [2n−1 phần tử],
)

== Import

```typst
#import "../bbt.typ": *
```

== Ví dụ dùng trong loigiai

```typst
loigiai: [
  Lập bảng biến thiên:
  #align(center)[
    #bbbt(
      var: $x$, der: $y'$, func: $y$,
      x-vals: ($-oo$, $-1$, $2$, $+oo$),
      d-signs: ($+$, $+$, $0$, $-$, $0$, $+$, $+$),
      v-vals: ($-oo$, $4$, $-5$, $+oo$),
    )
  ]
]
```

#caution[`d-signs` phải có *2n−1* phần tử cho n cột x-vals (xen kẽ: dấu tại điểm, dấu trong khoảng). Có thể dùng cả `$+$` lẫn `"+"` — hệ thống nhận cả hai.]

// ══════════════════════════════════════════════════════════════════
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
