// ═══════════════════════════════════════════════════════════
// BOX.TYP — Thư viện hộp trang trí Typst (tương đương tcolorbox)
// Tác giả: GV Nguyễn Văn Sang
// Import: #import "box.typ": *
// ═══════════════════════════════════════════════════════════
//
// ┌─ KIỂU HỘP (style:) ──────────────────────────────────┐
// │ "banner"   Thanh tiêu đề màu phủ trên        [mặc định]│
// │ "side"     Viền trái đậm + viền mỏng xung quanh        │
// │ "pill"     Viền đầy đủ, góc tròn lớn                   │
// │ "dashed"   Viền chấm-chấm + gạch ngang phân cách       │
// │ "theorem"  Hai đường kẻ trên dày / dưới mỏng            │
// │ "shadow"   Viền thường + giả bóng đổ (border dày phải+dưới)│
// │ "double"   Viền đôi lồng nhau                          │
// └────────────────────────────────────────────────────────┘
//
// ┌─ MÀU SẴN CÓ ─────────────────────────────────────────┐
// │ "blue"  "green"  "red"  "orange"  "purple"            │
// │ "teal"  "gray"   "pink"  "amber"  "cyan"              │
// └────────────────────────────────────────────────────────┘
//
// ┌─ HỘP SẴN DÙNG ───────────────────────────────────────┐
// │ Học thuật:  #B-dn  #B-dl  #B-tc  #B-bd               │
// │             #B-vd  #B-bt  #B-cm  #B-nd               │
// │ Cảnh báo:   #B-info  #B-tip  #B-warn  #B-danger      │
// │             #B-ok  #B-note                            │
// └────────────────────────────────────────────────────────┘
//
// ┌─ ĐA CỘT ──────────────────────────────────────────────┐
// │ #bx-2col[trái][phải]                                   │
// │ #bx-3col[a][b][c]                                      │
// │ #bx-2col(ratio: (60%, 40%))[trái][phải]                │
// │ #bx-cols(n: 3)[a][b][c]   — max 4 cột                  │
// └────────────────────────────────────────────────────────┘
// ═══════════════════════════════════════════════════════════

// ─── Bảng màu ───────────────────────────────────────────────
#let _bx-themes = (
  blue: (h: rgb("#1e40af"), b: rgb("#eff6ff"), a: rgb("#2563eb")),
  green: (h: rgb("#15803d"), b: rgb("#f0fdf4"), a: rgb("#16a34a")),
  red: (h: rgb("#b91c1c"), b: rgb("#fff1f2"), a: rgb("#dc2626")),
  orange: (h: rgb("#c2410c"), b: rgb("#fff7ed"), a: rgb("#ea580c")),
  purple: (h: rgb("#6d28d9"), b: rgb("#f5f3ff"), a: rgb("#7c3aed")),
  teal: (h: rgb("#0f766e"), b: rgb("#f0fdfa"), a: rgb("#0d9488")),
  gray: (h: rgb("#374151"), b: rgb("#f9fafb"), a: rgb("#4b5563")),
  pink: (h: rgb("#be185d"), b: rgb("#fdf2f8"), a: rgb("#db2777")),
  amber: (h: rgb("#b45309"), b: rgb("#fffbeb"), a: rgb("#d97706")),
  cyan: (h: rgb("#0e7490"), b: rgb("#ecfeff"), a: rgb("#0891b2")),
)

// ─── Lấy màu từ tên hoặc dùng trực tiếp ───────────────────
#let _bx-resolve(color) = {
  if type(color) == str {
    _bx-themes.at(color, default: _bx-themes.blue)
  } else if type(color) == dictionary {
    // dict {h:, b:, a:} tự định nghĩa
    color
  } else {
    // Màu Typst trực tiếp → tạo theme tự động
    (h: color, b: color.lighten(88%), a: color)
  }
}

// ═══════════════════════════════════════════════════════════
// HÀM LÕI — bx(style, color, title, icon, body)
// ═══════════════════════════════════════════════════════════
//
//  #bx("banner", "blue", title: "Định lý")[Nội dung...]
//  #bx("side",   "orange", title: "Lưu ý")[...]
//  #bx("pill",   "purple", title: "Mẹo")[...]
//  #bx("dashed", "teal",   title: "Nhận xét")[...]
//  #bx("theorem","red",    title: "Định lý Pythagore")[...]
//  #bx("shadow", "gray",   title: "Ghi chú")[...]
//  #bx("double", "green",  title: "Tính chất")[...]
//
#let bx(
  style, // "banner"|"side"|"pill"|"dashed"|"theorem"|"shadow"|"double"
  color, // tên màu ("blue",...) hoặc màu Typst hoặc dict {h,b,a}
  body,
  title: none,
  icon: none, // nội dung inline trước tiêu đề (ví dụ: emoji)
  above: 0.6em,
  below: 0.8em,
  inset-x: 13pt,
  inset-y: 9pt,
) = {
  let th = _bx-resolve(color)
  let hdr-fill = th.h
  let body-fill = th.b
  let acc = th.a

  // Xây heading line nếu có title
  let _hdr(t, fill: white) = if title != none or icon != none {
    let prefix = if icon != none { [#icon #h(4pt)] } else { [] }
    text(weight: "bold", fill: fill)[#prefix#title]
  }

  if style == "banner" {
    // ① BANNER: thanh màu trên, nền sáng dưới
    block(above: above, below: below, width: 100%, radius: 6pt, clip: true)[
      #if title != none or icon != none {
        block(width: 100%, fill: hdr-fill, inset: (x: inset-x, y: 6pt))[
          #_hdr(title, fill: white)
        ]
      }
      #block(width: 100%, fill: body-fill, inset: (x: inset-x, y: inset-y))[#body]
    ]
  } else if style == "side" {
    // ② SIDE: viền trái 5pt + viền mỏng xung quanh
    block(
      above: above,
      below: below,
      width: 100%,
      stroke: (left: 5pt + acc, rest: 0.7pt + acc.lighten(55%)),
      inset: (left: 14pt, right: inset-x, top: inset-y, bottom: inset-y),
      radius: (right: 5pt),
      fill: body-fill,
    )[
      #if title != none or icon != none {
        _hdr(title, fill: acc)
        v(0.3em)
      }
      #body
    ]
  } else if style == "pill" {
    // ③ PILL: viền đầy 2pt, góc tròn lớn, tiêu đề inline
    block(
      above: above,
      below: below,
      width: 100%,
      stroke: 2pt + acc,
      inset: (x: inset-x, y: inset-y),
      radius: 12pt,
      fill: body-fill,
    )[
      #if title != none or icon != none {
        _hdr(title, fill: acc)
        [#h(0.5em)]
      }
      #body
    ]
  } else if style == "dashed" {
    // ④ DASHED: viền chấm + gạch phân cách
    block(
      above: above,
      below: below,
      width: 100%,
      stroke: (paint: acc, thickness: 1pt, dash: "dashed"),
      inset: (x: inset-x, y: inset-y),
      radius: 4pt,
      fill: body-fill,
    )[
      #if title != none or icon != none {
        _hdr(title, fill: acc)
        v(0.2em)
        line(length: 100%, stroke: (paint: acc, thickness: 0.4pt, dash: "dotted"))
        v(0.3em)
      }
      #body
    ]
  } else if style == "theorem" {
    // ⑤ THEOREM: kẻ trên 3pt, kẻ dưới 1pt, tiêu đề in nghiêng đậm
    block(above: above, below: below, width: 100%)[
      #line(length: 100%, stroke: 3pt + acc)
      #block(width: 100%, fill: body-fill, inset: (x: inset-x, top: 6pt, bottom: inset-y))[
        #if title != none or icon != none {
          text(weight: "bold", style: "italic", fill: acc)[
            #if icon != none { [#icon #h(3pt)] }
            #title.
          ]
          h(0.4em)
        }
        #body
      ]
      #line(length: 100%, stroke: 1pt + acc.lighten(40%))
    ]
  } else if style == "shadow" {
    // ⑥ SHADOW: viền thường + giả bóng đổ (border dày bên phải & dưới)
    block(
      above: above,
      below: below,
      width: 100%,
      stroke: (top: 1pt + acc, left: 1pt + acc, right: 4pt + acc.darken(25%), bottom: 4pt + acc.darken(25%)),
      inset: (x: inset-x, y: inset-y),
      radius: 4pt,
      fill: body-fill,
    )[
      #if title != none or icon != none {
        block(
          width: 100%,
          below: 0.4em,
          stroke: (bottom: 0.8pt + acc.lighten(40%)),
          inset: (bottom: 5pt),
        )[
          #_hdr(title, fill: acc)
        ]
      }
      #body
    ]
  } else if style == "double" {
    // ⑦ DOUBLE: viền đôi lồng nhau
    block(
      above: above,
      below: below,
      width: 100%,
      stroke: 2pt + acc,
      inset: 4pt,
      radius: 6pt,
      fill: body-fill,
    )[
      #block(
        width: 100%,
        stroke: 0.8pt + acc.lighten(40%),
        inset: (x: inset-x - 4pt, y: inset-y - 4pt),
        radius: 3pt,
        fill: body-fill,
      )[
        #if title != none or icon != none {
          _hdr(title, fill: acc)
          v(0.3em)
        }
        #body
      ]
    ]
  } else {
    // fallback = banner
    bx("banner", color, body, title: title, icon: icon)
  }
}

// ═══════════════════════════════════════════════════════════
// ĐA CỘT — bx-2col / bx-3col / bx-cols
// ═══════════════════════════════════════════════════════════

// 2 cột bằng nhau
// Dùng: #bx-2col[Cột trái][Cột phải]
// Tuỳ chỉnh tỉ lệ: #bx-2col(ratio: (60%, 40%))[...][...]
#let bx-2col(
  left,
  right,
  ratio: (1fr, 1fr),
  gutter: 12pt,
  align-cols: (top + left, top + left),
  above: 0.3em,
  below: 0.5em,
) = block(above: above, below: below, width: 100%)[
  #grid(
    columns: ratio,
    column-gutter: gutter,
    align: (align-cols.at(0), align-cols.at(1)),
    left,
    right,
  )
]

// 3 cột bằng nhau
// Dùng: #bx-3col[a][b][c]
#let bx-3col(
  a,
  b,
  c,
  ratio: (1fr, 1fr, 1fr),
  gutter: 10pt,
  above: 0.3em,
  below: 0.5em,
) = block(above: above, below: below, width: 100%)[
  #grid(columns: ratio, column-gutter: gutter, a, b, c)
]

// n cột (2–4)
// Dùng: #bx-cols(n: 3)[a][b][c]
//       #bx-cols(n: 4, gutter: 8pt)[a][b][c][d]
#let bx-cols(
  ..args,
  n: 2,
  gutter: 10pt,
  above: 0.3em,
  below: 0.5em,
) = {
  let cells = args.pos()
  block(above: above, below: below, width: 100%)[
    #grid(
      columns: range(n).map(_ => 1fr),
      column-gutter: gutter,
      ..cells,
    )
  ]
}

// ── Hộp chia đôi có tiêu đề (bx-split) ──────────────────
// Dùng: #bx-split("blue", [Đề bài], [Lời giải])
// Render: cột trái = nền đậm, cột phải = nền sáng
#let bx-split(
  color,
  left,
  right,
  left-title: none,
  right-title: none,
  gutter: 0pt,
  radius: 6pt,
) = {
  let th = _bx-resolve(color)
  block(width: 100%, radius: radius, clip: true)[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: gutter,
      block(width: 100%, fill: th.h, inset: 12pt, height: 100%)[
        #if left-title != none {
          text(weight: "bold", fill: white.transparentize(15%))[#left-title]
          v(0.3em)
        }
        #text(fill: white)[#left]
      ],
      block(width: 100%, fill: th.b, inset: 12pt, height: 100%)[
        #if right-title != none {
          text(weight: "bold", fill: th.a)[#right-title]
          v(0.3em)
        }
        #right
      ],
    )
  ]
}

// ═══════════════════════════════════════════════════════════
// HỘP HỌC THUẬT VIỆT NAM
// Đặt tên B-* để tránh xung đột với sang-exam.typ
// Vẫn có thể import cùng lúc: import box.typ chỉ dùng B-*
// ═══════════════════════════════════════════════════════════

// Định nghĩa — theorem style xanh dương
#let B-dn(body, title: [Định nghĩa]) = bx(
  "theorem",
  "blue",
  body,
  title: title,
  icon: [📘],
)
// Định lý — theorem style đỏ
#let B-dl(body, title: [Định lý]) = bx(
  "theorem",
  "red",
  body,
  title: title,
  icon: [📐],
)
// Tính chất — theorem style xanh lá
#let B-tc(body, title: [Tính chất]) = bx(
  "theorem",
  "green",
  body,
  title: title,
  icon: [✦],
)
// Bổ đề — theorem style cam
#let B-bd(body, title: [Bổ đề]) = bx(
  "theorem",
  "orange",
  body,
  title: title,
  icon: [◆],
)
// Ví dụ — side style teal
#let B-vd(body, title: [Ví dụ]) = bx(
  "side",
  "teal",
  body,
  title: title,
  icon: [✏],
)
// Bài tập — side style purple
#let B-bt(body, title: [Bài tập]) = bx(
  "side",
  "purple",
  body,
  title: title,
  icon: [🖊],
)
// Chứng minh — dashed style gray
#let B-cm(body, title: [Chứng minh]) = bx(
  "dashed",
  "gray",
  body,
  title: title,
  icon: [∎],
)
// Nhận định / Kết luận — double style blue
#let B-nd(body, title: [Nhận định]) = bx(
  "double",
  "cyan",
  body,
  title: title,
)
// Phương pháp giải — banner xanh lá
#let B-pp(body, title: [💡 Phương pháp giải]) = bx(
  "banner",
  "green",
  body,
  title: title,
)
// Lưu ý — alert cam
#let B-lu(body, title: [⚠ Lưu ý]) = bx(
  "side",
  "orange",
  body,
  title: title,
)
// Mẹo giải nhanh — pill hồng
#let B-meo(body, title: [🚀 Mẹo nhanh]) = bx(
  "pill",
  "pink",
  body,
  title: title,
)
// Nhận xét — dashed tím
#let B-nx(body, title: [📝 Nhận xét]) = bx(
  "dashed",
  "purple",
  body,
  title: title,
)
// Lý thuyết — banner xanh dương
#let B-lt(body, title: [📖 Lý thuyết]) = bx(
  "banner",
  "blue",
  body,
  title: title,
)

// ═══════════════════════════════════════════════════════════
// HỘP CẢNH BÁO (alert boxes)
// ═══════════════════════════════════════════════════════════

// Thông tin
#let B-info(body, title: [Thông tin]) = bx(
  "banner",
  "blue",
  body,
  title: title,
  icon: [ℹ],
)
// Gợi ý
#let B-tip(body, title: [Gợi ý]) = bx(
  "side",
  "teal",
  body,
  title: title,
  icon: [💡],
)
// Cảnh báo
#let B-warn(body, title: [Cảnh báo]) = bx(
  "side",
  "amber",
  body,
  title: title,
  icon: [⚠],
)
// Nguy hiểm / Cẩn thận
#let B-danger(body, title: [Cẩn thận]) = bx(
  "banner",
  "red",
  body,
  title: title,
  icon: [🔴],
)
// Thành công / Kết luận đúng
#let B-ok(body, title: [Đúng]) = bx(
  "side",
  "green",
  body,
  title: title,
  icon: [✓],
)
// Ghi chú
#let B-note(body, title: [Ghi chú]) = bx(
  "shadow",
  "gray",
  body,
  title: title,
  icon: [📌],
)
// Ví dụ mã code
#let B-code(body, title: [Code]) = bx(
  "double",
  "gray",
  body,
  title: title,
  icon: [⌨],
)

// ═══════════════════════════════════════════════════════════
// HỘP ĐA CỘT CÓ ĐƯỜNG PHÂN CÁCH (bx-panel-cols)
// ═══════════════════════════════════════════════════════════
// Hộp viền ngoài (banner style) + bên trong chia cột bằng đường kẻ
// Dùng: #bx-panel-cols("blue", title: "So sánh")[A][B]
#let bx-panel-cols(
  color,
  ..cells,
  title: none,
  n: 2,
  gutter: 0pt,
  divider-color: auto,
) = {
  let th = _bx-resolve(color)
  let div-c = if divider-color == auto { th.a.lighten(50%) } else { divider-color }
  let contents = cells.pos()
  let nc = contents.len()

  block(width: 100%, radius: 6pt, clip: true)[
    #if title != none {
      block(width: 100%, fill: th.h, inset: (x: 13pt, y: 7pt))[
        #text(fill: white, weight: "bold")[#title]
      ]
    }
    #block(width: 100%, fill: th.b, inset: 0pt)[
      #grid(
        columns: range(nc).map(i => if i < nc - 1 { (1fr, auto) } else { (1fr,) }).flatten(),
        ..contents
          .enumerate()
          .map(((i, c)) => {
            if i < nc - 1 {
              (
                block(width: 100%, inset: 12pt, height: 100%)[#c],
                block(width: 1pt, fill: div-c, height: 100%)[],
              )
            } else {
              (block(width: 100%, inset: 12pt, height: 100%)[#c],)
            }
          })
          .flatten()
      )
    ]
  ]
}

// ═══════════════════════════════════════════════════════════
// BẢNG THAM KHẢO NHANH (tự test khi compile file này độc lập)
// ═══════════════════════════════════════════════════════════
// Uncomment để xem demo:
//
// #set page(margin: 2cm)
// #set text(font: "New Computer Modern", size: 11pt)
//
// = Demo tất cả kiểu hộp
//
// == Style "banner" (các màu)
// #bx("banner","blue",   title: "Banner Xanh")[Đây là hộp kiểu banner màu xanh.]
// #bx("banner","green",  title: "Banner Xanh lá")[Nội dung hộp xanh lá.]
// #bx("banner","red",    title: "Banner Đỏ")[Nội dung hộp đỏ.]
// #bx("banner","purple", title: "Banner Tím")[Nội dung hộp tím.]
//
// == Style "side"
// #bx("side","orange",   title: "Side Cam")[Viền trái đậm, cảnh báo.]
// #bx("side","teal",     title: "Side Teal")[Màu teal mát mắt.]
//
// == Style "pill"
// #bx("pill","pink",     title: "Pill Hồng")[Tiêu đề inline, góc tròn.]
//
// == Style "dashed"
// #bx("dashed","purple", title: "Dashed Tím")[Gạch ngang phân cách.]
//
// == Style "theorem"
// #bx("theorem","blue",  title: "Định lý Pythagore")[Trong tam giác vuông...]
//
// == Style "shadow"
// #bx("shadow","gray",   title: "Ghi chú")[Hộp có giả bóng đổ.]
//
// == Style "double"
// #bx("double","green",  title: "Tính chất")[Viền đôi lồng nhau.]
//
// == Hộp tên sẵn
// #B-dn[Giới hạn dãy số $a_n$ khi $n→+∞$ là số $L$ sao cho...]
// #B-dl[Nếu $f$ liên tục trên $[a,b]$ và $f(a)f(b)<0$ thì...]
// #B-tc[$C_n^k = C_n^(n-k)$]
// #B-vd[Tính $lim_(n→∞) (3n+1)/(2n-1)$.]
// #B-warn[Cẩn thận không nhầm giữa $⊂$ và $⊆$!]
// #B-ok[Kết quả: $x = π/3 + k2π$, $k ∈ ZZ$.]
//
// == Đa cột
// #bx-2col[Cột trái — phương trình $x^2=4$][Cột phải — nghiệm $x=±2$]
// #bx-3col[Trường hợp 1][Trường hợp 2][Trường hợp 3]
// #bx-split("blue", [*Đề bài*: Tìm $lim...$], [*Giải*: Nhân liên hợp...],
//   left-title: "Đề bài", right-title: "Lời giải")
// #bx-panel-cols("teal", title: "So sánh hai phương pháp")[
//   *Phương pháp 1:* Đặt ẩn phụ $t=e^x$.
// ][
//   *Phương pháp 2:* Chia cả tử và mẫu cho $e^x$.
// ]
