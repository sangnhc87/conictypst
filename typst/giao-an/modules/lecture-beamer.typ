// ═══════════════════════════════════════════════════════════════════════════
// LECTURE-BEAMER.TYP  v1.0
// Module Trình Chiếu Bài Giảng — THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// GV: Nguyễn Văn Sang
//
// Xây dựng trên Touying Metropolis — chuyên dùng cho DẠY HỌC (không phải chữa đề)
// Gồm: Định nghĩa, Định lý, Ví dụ, Flowchart, Mindmap, BBT, Lịch sử, ...
//
// Compile:
//   typst compile --root ../.. beamer/beamer-12-bai-X.typ
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/touying:0.7.3": *
#import themes.metropolis: *
#import "@preview/cetz:0.3.4": canvas, draw

// ── MÀU SẮC CHUẨN ────────────────────────────────────────────────────────
// ── MÀU SẮC CHUẨN SGK (LIGHT THEME) ───────────────────────────────────
#let lec-palette = (
  // Nền
  light:   rgb("#ffffff"),
  surface: rgb("#f8fafc"),
  card:    rgb("#ffffff"),
  // Accent
  navy:    rgb("#1e3a8a"), // Tiêu đề chính
  emerald: rgb("#059669"), // Lời giải, Định lý
  amber:   rgb("#d97706"), // Công thức, Chú ý
  rose:    rgb("#e11d48"), // Cảnh báo, Sai lầm
  violet:  rgb("#6d28d9"), // Bổ trợ
  cyan:    rgb("#0891b2"),
  // Text
  text:    rgb("#0f172a"),
  muted:   rgb("#475569"),
  // Box fills
  def-fill:  rgb("#eff6ff"),
  thm-fill:  rgb("#f0fdf4"),
  ex-fill:   rgb("#fffbeb"),
  note-fill: rgb("#fff1f2"),
  hist-fill: rgb("#f5f3ff"),
  sol-fill:  rgb("#ecfdf5"),
)

// ── TRẠNG THÁI TOÀN CỤC ───────────────────────────────────────────────────
#let _lec-style   = state("lec-style",   (:))
#let _lec-ex-cnt  = counter("lec-ex")   // Ví dụ
#let _lec-thm-cnt = counter("lec-thm")  // Định lý
#let _lec-def-cnt = counter("lec-def")  // Định nghĩa

// ══════════════════════════════════════════════════════════════════════════
// THEME CHÍNH: lecture-theme
// ══════════════════════════════════════════════════════════════════════════
#let lecture-theme(
  body,
  // Thông tin bài
  title:       "BÀI HỌC",
  subtitle:    "TOÁN 12",
  chapter:     "",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  date:        datetime.today(),
  // Giao diện
  accent:      lec-palette.navy,
  bg-color:    lec-palette.light,
  math-color:  rgb("#c2185b"), // magenta
  math-size:   1.05em,
  base-size:   22pt,
  body-font:   ("Arial", "Times New Roman"),
  aspect-ratio: "16-9",
) = {
  // Tự tính màu theo nền tối/sáng
  let _comps   = bg-color.components()
  let _luma    = 0.299 * float(_comps.at(0)) + 0.587 * float(_comps.at(1)) + 0.114 * float(_comps.at(2))
  let _is-dark = _luma < 0.5
  let _fg      = if _is-dark { white } else { rgb("#0f172a") }
  let _card    = if _is-dark { bg-color.lighten(12%) } else { bg-color.darken(8%) }
  let _muted   = if _is-dark { rgb("#94a3b8") } else { rgb("#475569") }
  let _def-fill  = if _is-dark { accent.darken(75%) } else { accent.lighten(85%) }
  let _thm-fill  = if _is-dark { lec-palette.violet.darken(80%) } else { lec-palette.violet.lighten(85%) }
  let _ex-fill   = if _is-dark { lec-palette.amber.darken(85%) } else { lec-palette.amber.lighten(88%) }
  let _note-fill = if _is-dark { lec-palette.rose.darken(85%) } else { lec-palette.rose.lighten(85%) }
  let _hist-fill = if _is-dark { lec-palette.emerald.darken(85%) } else { lec-palette.emerald.lighten(88%) }
  let _sol-fill  = if _is-dark { lec-palette.emerald.darken(80%) } else { lec-palette.emerald.lighten(88%) }

  // Lưu style vào state để macro con truy cập
  _lec-style.update((
    accent: accent, bg: bg-color, fg: _fg, card: _card, muted: _muted,
    math-color: math-color, math-size: math-size, base: base-size, body-font: body-font,
    def-fill: _def-fill, thm-fill: _thm-fill,
    ex-fill: _ex-fill, note-fill: _note-fill,
    hist-fill: _hist-fill, sol-fill: _sol-fill,
    is-dark: _is-dark,
  ))

  show: metropolis-theme.with(
    aspect-ratio: aspect-ratio,
    footer: context {
      set text(size: 7pt, fill: _muted)
      grid(
        columns: (1fr, auto, 1fr),
        align: (left + horizon, center + horizon, right + horizon),
        pad(left: 4pt)[#author — #institution],
        text(fill: accent, weight: "bold")[#title],
        pad(right: 4pt)[#counter(page).display() / #counter(page).final().first()],
      )
    },
    footer-right: none,
    footer-progress: false,
    config-info(
      title: [#title],
      subtitle: [#subtitle #if chapter != "" [— #chapter]],
      author: [#author],
      date: date,
      institution: [#institution],
    ),
    config-common(slide-fn: slide),
    config-colors(
      primary: accent,
      primary-light: accent.lighten(50%),
      secondary: math-color,
      neutral-lightest: bg-color,
      neutral-darkest: _fg,
    ),
  )

  // Typography
  set text(font: body-font, size: base-size, fill: _fg, lang: "vi")
  show math.equation.where(block: false): math.display
  show math.equation: set text(fill: math-color, size: math-size)

  // Tự đứng chữ C, A, P trong tổ hợp
  show math.attach: it => {
    let f = it.base.fields()
    if "text" in f and f.text in ("C", "A", "P") {
      return math.attach(math.upright(f.text), t: it.t, b: it.b, tl: it.tl, bl: it.bl, tr: it.tr, br: it.br)
    }
    it
  }

  title-slide()
  body
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-section — Slide phân tách Section
// ══════════════════════════════════════════════════════════════════════════
#let lt-section(icon, body) = {
  slide(title: none)[
    #align(center + horizon)[
      #v(-1em)
      #context {
        let s = _lec-style.get()
        block(
          width: 80%,
          stroke: (top: 3pt + s.accent, bottom: 3pt + s.accent),
          inset: (x: 0pt, y: 24pt),
        )[
          #text(size: s.base * 0.55, fill: s.accent, weight: "bold", tracking: 3pt)[#upper(icon + "  " + "NỘI DUNG")]
          #v(0.5em)
          #text(size: s.base * 1.2, fill: s.fg, weight: "bold")[#body]
        ]
      }
    ]
  ]
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-definition — Hộp Định Nghĩa
// ══════════════════════════════════════════════════════════════════════════
#let lt-definition(title: none, numbered: true, body) = {
  _lec-def-cnt.step()
  context {
    let s = _lec-style.get()
    let n = if numbered { " " + _lec-def-cnt.display() } else { "" }
    let ttl = if title != none { ": " + title } else { "" }
    block(
      width: 100%,
      fill: s.def-fill,
      stroke: (left: 3.5pt + s.accent),
      inset: (x: 16pt, y: 12pt),
      radius: (right: 6pt),
    )[
      #text(size: s.base * 0.7, fill: s.accent, weight: "bold")[
        📐 ĐỊNH NGHĨA#n#ttl
      ]
      #v(0.4em)
      #set text(size: s.base * 0.85, fill: s.fg)
      #body
    ]
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-theorem — Hộp Định Lý / Hệ Quả
// ══════════════════════════════════════════════════════════════════════════
#let lt-theorem(title: none, kind: "ĐỊNH LÝ", numbered: true, body) = {
  _lec-thm-cnt.step()
  context {
    let s = _lec-style.get()
    let n = if numbered { " " + _lec-thm-cnt.display() } else { "" }
    let ttl = if title != none { ": " + title } else { "" }
    block(
      width: 100%,
      fill: s.thm-fill,
      stroke: (left: 3.5pt + lec-palette.violet),
      inset: (x: 16pt, y: 12pt),
      radius: (right: 6pt),
    )[
      #text(size: s.base * 0.7, fill: lec-palette.violet, weight: "bold")[
        ⚡ #kind#n#ttl
      ]
      #v(0.4em)
      #set text(size: s.base * 0.85, fill: s.fg)
      #body
    ]
  }
}

// Shorthand
#let lt-corollary(title: none, body) = lt-theorem(title: title, kind: "HỆ QUẢ", numbered: false, body)
#let lt-rule(title: none, num: "", body) = {
  context {
    let s = _lec-style.get()
    block(
      width: 100%,
      fill: s.thm-fill,
      stroke: (left: 3.5pt + lec-palette.rose),
      inset: (x: 16pt, y: 12pt),
      radius: (right: 6pt),
    )[
      #text(size: s.base * 0.7, fill: lec-palette.rose, weight: "bold")[
        📋 QUY TẮC #num #if title != none { ": " + title }
      ]
      #v(0.4em)
      #set text(size: s.base * 0.85, fill: s.fg)
      #body
    ]
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-example — Hộp Ví Dụ (tự đánh số)
// ══════════════════════════════════════════════════════════════════════════
#let lt-example(title: none, body) = {
  _lec-ex-cnt.step()
  context {
    let s = _lec-style.get()
    let n = _lec-ex-cnt.display()
    block(
      width: 100%,
      fill: s.ex-fill,
      stroke: (left: 3.5pt + lec-palette.amber),
      inset: (x: 16pt, y: 12pt),
      radius: (right: 6pt),
    )[
      #text(size: s.base * 0.7, fill: lec-palette.amber, weight: "bold")[
        🔢 VÍ DỤ #n #if title != none { "— " + title }
      ]
      #v(0.4em)
      #set text(size: s.base * 0.85, fill: s.fg)
      #body
    ]
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-solution — Hộp Lời Giải (reveal sau pause)
// ══════════════════════════════════════════════════════════════════════════
#let lt-solution(body) = {
  context {
    let s = _lec-style.get()
    block(
      width: 100%,
      fill: s.sol-fill,
      stroke: (left: 3.5pt + lec-palette.emerald),
      inset: (x: 16pt, y: 12pt),
      radius: (right: 6pt),
    )[
      #text(size: s.base * 0.7, fill: lec-palette.emerald, weight: "bold")[
        ✅ LỜI GIẢI
      ]
      #v(0.4em)
      #set text(size: s.base * 0.82, fill: s.fg)
      #body
    ]
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-note — Hộp Ghi Chú / Lưu Ý
// ══════════════════════════════════════════════════════════════════════════
#let lt-note(title: "LƯU Ý", icon: "⚠️", body) = {
  context {
    let s = _lec-style.get()
    block(
      width: 100%,
      fill: s.note-fill,
      stroke: (left: 3.5pt + lec-palette.rose),
      inset: (x: 16pt, y: 10pt),
      radius: (right: 6pt),
    )[
      #text(size: s.base * 0.7, fill: lec-palette.rose, weight: "bold")[#icon #title]
      #v(0.3em)
      #set text(size: s.base * 0.82, fill: s.fg)
      #body
    ]
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-history — Bối cảnh Lịch sử / Thực tiễn
// ══════════════════════════════════════════════════════════════════════════
#let lt-history(title: "BỐI CẢNH LỊCH SỬ", body) = {
  context {
    let s = _lec-style.get()
    block(
      width: 100%,
      fill: s.hist-fill,
      stroke: (left: 3.5pt + lec-palette.emerald, top: 0.5pt + lec-palette.emerald.lighten(40%)),
      inset: (x: 16pt, y: 12pt),
      radius: 6pt,
    )[
      #text(size: s.base * 0.7, fill: lec-palette.emerald, weight: "bold")[🏛️ #title]
      #v(0.4em)
      #set text(size: s.base * 0.82, fill: s.fg, style: "italic")
      #body
    ]
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-step — Các bước giải (step-by-step với số bước)
// ══════════════════════════════════════════════════════════════════════════
#let lt-step(num, icon: "▶", accent-clr: none, body) = {
  context {
    let s = _lec-style.get()
    let clr = if accent-clr == none { s.accent } else { accent-clr }
    grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      align: (center + top, left + top),
      box(
        width: 36pt, height: 36pt,
        fill: clr, radius: 50%,
      )[
        #align(center + horizon)[
          #text(size: s.base * 0.75, fill: white, weight: "bold")[#num]
        ]
      ],
      pad(top: 6pt)[
        #set text(size: s.base * 0.85, fill: s.fg)
        #body
      ],
    )
    v(0.3em)
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-compare — So sánh 2 cột
// ══════════════════════════════════════════════════════════════════════════
#let lt-compare(left-title: "A", right-title: "B", left-body, right-body) = {
  context {
    let s = _lec-style.get()
    grid(
      columns: (1fr, 1fr),
      column-gutter: 16pt,
      block(
        width: 100%, height: 100%,
        fill: s.def-fill,
        stroke: (top: 2pt + s.accent),
        inset: (x: 14pt, y: 12pt),
        radius: (bottom: 6pt),
      )[
        #text(size: s.base * 0.7, fill: s.accent, weight: "bold")[#left-title]
        #v(0.4em)
        #set text(size: s.base * 0.82, fill: s.fg)
        #left-body
      ],
      block(
        width: 100%, height: 100%,
        fill: s.thm-fill,
        stroke: (top: 2pt + lec-palette.violet),
        inset: (x: 14pt, y: 12pt),
        radius: (bottom: 6pt),
      )[
        #text(size: s.base * 0.7, fill: lec-palette.violet, weight: "bold")[#right-title]
        #v(0.4em)
        #set text(size: s.base * 0.82, fill: s.fg)
        #right-body
      ],
    )
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-highlight — Công thức / kết quả nổi bật
// ══════════════════════════════════════════════════════════════════════════
#let lt-highlight(body) = {
  context {
    let s = _lec-style.get()
    align(horizon + center)[
      #block(
        fill: s.accent.darken(70%),
        stroke: 1.5pt + s.accent,
        inset: (x: 24pt, y: 14pt),
        radius: 8pt,
      )[
        #set text(size: s.base, fill: white, weight: "bold")
        #show math.equation: set text(fill: s.math-color, size: s.base * 1.1)
        #body
      ]
    ]
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-two-col — Bố cục 2 cột tùy tỉ lệ
// ══════════════════════════════════════════════════════════════════════════
#let lt-two-col(ratio: (1fr, 1fr), gap: 16pt, left-body, right-body) = {
  grid(
    columns: ratio,
    column-gutter: gap,
    align: (left + top, left + top),
    left-body,
    right-body,
  )
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-bullets — Danh sách bullet đẹp với icon
// ══════════════════════════════════════════════════════════════════════════
#let lt-bullets(icon: "•", ..items) = {
  context {
    let s = _lec-style.get()
    for item in items.pos() {
      grid(
        columns: (auto, 1fr),
        column-gutter: 8pt,
        align: (top, top),
        text(fill: s.accent, weight: "bold")[#icon],
        text(size: s.base * 0.85, fill: s.fg)[#item],
      )
      v(0.25em)
    }
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-qr — QR code + caption (dùng image ngoài hoặc placeholder)
// ══════════════════════════════════════════════════════════════════════════
#let lt-qr(url, caption: "", size: 100pt) = {
  context {
    let s = _lec-style.get()
    align(horizon + center)[
      #box(
        width: size, height: size,
        fill: white,
        stroke: 1pt + s.accent,
        radius: 6pt,
        inset: 6pt,
      )[
        #align(center + horizon)[
          #set text(size: 8pt, fill: black)
          QR\
          #text(size: 6pt)[#url]
        ]
      ]
      #if caption != "" {
        v(0.3em)
        text(size: s.base * 0.6, fill: s.muted)[#caption]
      }
    ]
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-progress-bar — Thanh tiến trình bài học
// ══════════════════════════════════════════════════════════════════════════
#let lt-progress(current, total, labels: ()) = {
  context {
    let s = _lec-style.get()
    let pct = current / total
    grid(
      columns: range(total).map(_ => 1fr),
      column-gutter: 3pt,
      ..range(total).map(i => {
        let done = i < current
        let curr = i == current - 1
        let lbl = if i < labels.len() { labels.at(i) } else { str(i + 1) }
        box(
          height: 8pt,
          fill: if done { s.accent } else if curr { s.accent.lighten(30%) } else { s.card },
          radius: 2pt,
        )[]
      })
    )
    if labels.len() > 0 {
      v(0.2em)
      grid(
        columns: range(total).map(_ => 1fr),
        column-gutter: 3pt,
        ..range(total).map(i => {
          let lbl = if i < labels.len() { labels.at(i) } else { "" }
          let done = i < current
          align(horizon + center)[#text(size: 7pt, fill: if done { s.accent } else { s.muted })[#lbl]]
        })
      )
    }
  }
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-bbbt — Bảng Biến Thiên đơn giản (dùng Cetz)
// Tham số: xs = list các điểm critical, vals = list giá trị tại các điểm
// ══════════════════════════════════════════════════════════════════════════
#let lt-bbt(
  f-name: "y",
  intervals: (),  // Danh sách khoảng, ví dụ: ((-oo, -1, "dec"), (-1, 2, "inc"), (2, +oo, "dec"))
  critical: (),   // Điểm cực trị: ((x, y, "max"|"min"), ...)
  width: 14cm,
  height: 3cm,
) = {
  align(horizon + center)[
    #canvas({
      import draw: *
      let W = 14
      let H = 3.2
      let row-h = H / 3
      let n-pts = intervals.len() + 1
      let col-w = (W - 1.5) / n-pts

      // Header row
      rect((0, H - row-h), (W, H), fill: rgb("#1e3a5f"), stroke: 0.5pt + white)
      content((0.75, H - row-h / 2), text(fill: white, weight: "bold", size: 9pt)[$x$])
      content((0.75, H - row-h / 2 - row-h), text(fill: white, weight: "bold", size: 9pt)[$f'(x)$])
      content((0.75, H - row-h / 2 - 2 * row-h), text(fill: lec-palette.amber, weight: "bold", size: 9pt)[$#f-name$])

      // Column for each x value
      for (i, iv) in intervals.enumerate() {
        let x0 = iv.at(0)
        let x1 = iv.at(1)
        let dir = iv.at(2)  // "inc" | "dec"

        let cx-left  = 1.5 + i * col-w
        let cx-right = 1.5 + (i + 1) * col-w
        let cx-mid   = (cx-left + cx-right) / 2

        // x row
        let lbl-left  = if x0 == "-oo" { $-infinity$ } else { raw(x0) }
        let lbl-right = if x1 == "+oo" { $+infinity$ } else { raw(x1) }
        if i == 0 {
          content((cx-left, H - row-h / 2), text(fill: white, size: 9pt)[#lbl-left])
        }
        content((cx-right, H - row-h / 2), text(fill: white, size: 9pt)[#lbl-right])

        // f'(x) row — dấu
        let sign = if dir == "inc" { text(fill: lec-palette.emerald, weight: "bold", size: 11pt)[+] }
                   else            { text(fill: lec-palette.rose,    weight: "bold", size: 11pt)[−] }
        content((cx-mid, H - row-h - row-h / 2), sign)

        // f(x) row — mũi tên
        let y0 = 0.3
        let y1 = H - 3 * row-h + 0.3
        if dir == "inc" {
          line((cx-left + 0.1, y0), (cx-right - 0.1, y1),
            stroke: (paint: lec-palette.emerald, thickness: 1.5pt),
            mark: (end: ">"),
          )
        } else {
          line((cx-left + 0.1, y1), (cx-right - 0.1, y0),
            stroke: (paint: lec-palette.rose, thickness: 1.5pt),
            mark: (end: ">"),
          )
        }
      }

      // Grid lines
      for i in range(intervals.len() + 1) {
        let cx = 1.5 + i * col-w
        line((cx, 0), (cx, H), stroke: 0.4pt + white.transparentize(60%))
      }
      for i in range(4) {
        line((0, i * row-h), (W, i * row-h), stroke: 0.4pt + white.transparentize(60%))
      }
      line((1.5, 0), (1.5, H), stroke: 1pt + white)
      rect((0, 0), (W, H), stroke: 0.8pt + white)
    })
  ]
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-flowchart — Flowchart quy trình (Cetz)
// Đơn giản: danh sách các bước dọc
// ══════════════════════════════════════════════════════════════════════════
#let lt-flowchart(steps, width: 10cm, colors: ()) = {
  let n = steps.len()
  let h-total = n * 1.4 + (n - 1) * 0.3
  align(horizon + center)[
    #box(width: width)[
      #canvas({
        import draw: *
        let default-colors = (lec-palette.navy, lec-palette.violet, lec-palette.emerald, lec-palette.amber, lec-palette.rose, lec-palette.cyan)
        for (i, step) in steps.enumerate() {
          let y = h-total - i * 1.7
          let clr = if i < colors.len() { colors.at(i) } else { default-colors.at(calc.rem(i, 6)) }
          rect(
            (0.3, y - 0.55), (9.7, y + 0.55),
            fill: clr.darken(70%),
            stroke: 1.5pt + clr,
            radius: 6pt,
          )
          content((5, y), text(fill: white, size: 9pt, weight: "bold")[#step])
          if i < n - 1 {
            line((5, y - 0.55), (5, y - 0.55 - 0.3 + 0.05),
              stroke: 1.5pt + white.transparentize(40%),
              mark: (end: ">"),
            )
          }
        }
      })
    ]
  ]
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-mindmap — Sơ đồ tư duy dạng radial (Cetz)
// center: tên chủ đề trung tâm
// branches: list ((label, (sub1, sub2, ...)), ...)
// ══════════════════════════════════════════════════════════════════════════
#let lt-mindmap(hub, branches, width: 16cm) = {
  let n = branches.len()
  let colors = (lec-palette.navy, lec-palette.rose, lec-palette.emerald, lec-palette.amber, lec-palette.violet, lec-palette.cyan)
  align(horizon + center)[
    #box(width: width)[
      #canvas({
        import draw: *
        // Vẽ trung tâm
        circle((0, 0), radius: 1.1, fill: lec-palette.light.lighten(15%), stroke: 2pt + lec-palette.navy)
        content((0, 0), text(fill: white, size: 9pt, weight: "bold")[#hub])
        // Vẽ từng nhánh
        for (i, branch) in branches.enumerate() {
          let angle = 360deg / n * i
          let bx = 3.2 * calc.cos(angle)
          let by = 3.2 * calc.sin(angle)
          let clr = colors.at(calc.rem(i, 6))
          // Đường kết nối
          line((0, 0), (bx * 0.8, by * 0.8), stroke: (paint: clr, thickness: 1.5pt))
          // Node nhánh chính
          circle((bx, by), radius: 0.75, fill: clr.darken(60%), stroke: 1.5pt + clr)
          content((bx, by), text(fill: white, size: 7pt, weight: "bold")[#branch.at(0)])
          // Nhánh phụ
          if branch.len() > 1 {
            let subs = branch.at(1)
            let ns = subs.len()
            for (j, sub) in subs.enumerate() {
              let sub-angle = angle + (j - (ns - 1) / 2) * 25deg
              let sx = bx + 1.8 * calc.cos(sub-angle)
              let sy = by + 1.8 * calc.sin(sub-angle)
              line((bx, by), (sx, sy), stroke: (paint: clr.lighten(30%), thickness: 0.8pt))
              circle((sx, sy), radius: 0.45, fill: clr.darken(80%), stroke: 0.8pt + clr.lighten(20%))
              content((sx, sy), text(fill: white, size: 6pt)[#sub])
            }
          }
        }
      })
    ]
  ]
}

// ── HELPER: Dùng inline cho số đặc biệt ───────────────────────────────────
// Reset example counter (dùng đầu mỗi file)
#let lec-reset() = {
  _lec-ex-cnt.update(0)
  _lec-thm-cnt.update(0)
  _lec-def-cnt.update(0)
}

// ══════════════════════════════════════════════════════════════════════════
// HỆ THỐNG HYPERLINK & MỤC LỤC
// ══════════════════════════════════════════════════════════════════════════

// Trạng thái lưu các mục của TOC
#let _lec-toc   = state("lec-toc",   ())
#let _lec-q-cnt = counter("lec-q")   // Đếm câu hỏi

// ── lt-toc-item: Đăng ký một mục TOC (gọi bên trong lt-section-link) ──
#let _register-toc(label-id, title, icon) = {
  _lec-toc.update(t => t + ((id: label-id, title: title, icon: icon),))
}

// ── lt-nav-button: Nút điều hướng nhỏ ────────────────────────────────────
#let lt-nav-btn(label-id, icon: "←", txt: "Mục lục") = {
  context {
    let s = _lec-style.get()
    link(label(label-id),
      box(
        fill: s.accent.darken(60%),
        stroke: 0.8pt + s.accent,
        inset: (x: 10pt, y: 5pt),
        radius: 4pt,
      )[
        #text(size: 9pt, fill: s.accent, weight: "bold")[#icon #txt]
      ]
    )
  }
}

// ── lt-section-link: Section slide với label để hyperlink đến ────────────
// Thay thế lt-section khi dùng hệ thống TOC
#let lt-section-link(id, icon, body) = {
  _register-toc(id, body, icon)
  slide(title: none)[
    #[#metadata(none) #label(id)]
    #align(center + horizon)[
      #v(-1em)
      #context {
        let s = _lec-style.get()
        block(
          width: 80%,
          stroke: (top: 3pt + s.accent, bottom: 3pt + s.accent),
          inset: (x: 0pt, y: 24pt),
        )[
          #text(size: s.base * 0.55, fill: s.accent, weight: "bold", tracking: 3pt)[#upper(icon + "  PHẦN")]
          #v(0.5em)
          #text(size: s.base * 1.25, fill: s.fg, weight: "bold")[#body]
          #v(0.5em)
          #lt-nav-btn("lec-toc-main", icon: "◀", txt: "Mục lục")
        ]
      }
    ]
  ]
}

// ── lt-toc: Slide Mục lục có hyperlink đến từng phần ─────────────────────
#let lt-toc(title: "📋 MỤC LỤC BÀI HỌC") = {
  slide(title: none)[
    #[#metadata(none) #label("lec-toc-main")]
    #context {
      let s = _lec-style.get()
      let items = _lec-toc.final()
      v(-0.5em)
      text(size: s.base * 0.9, fill: s.accent, weight: "bold")[#title]
      v(0.5em)
      for (i, item) in items.enumerate() {
        let lbl = item.at("id")
        let ttl = item.at("title")
        let icn = item.at("icon")
        link(label(lbl),
          block(
            width: 100%,
            fill: s.card,
            stroke: (left: 2.5pt + s.accent),
            inset: (x: 14pt, y: 9pt),
            radius: (right: 5pt),
            below: 6pt,
          )[
            #grid(
              columns: (auto, 1fr, auto),
              align: (left + horizon, left + horizon, right + horizon),
              text(fill: s.accent, size: s.base * 0.7, weight: "bold")[#icn  #str(i + 1).],
              h(8pt) + text(fill: s.fg, size: s.base * 0.82)[#ttl],
              text(fill: s.muted, size: 8pt)[→],
            )
          ]
        )
      }
    }
  ]
}

// ── lt-slide-back: Slide thường với nút "Quay về mục lục" ở góc ──────────
#let lt-slide-back(title: none, back-to: "lec-toc-main", body) = {
  slide(title: title)[
    #body
    #v(0.3em)
    #align(right)[#lt-nav-btn(back-to, icon: "◀", txt: "Mục lục")]
  ]
}

// ══════════════════════════════════════════════════════════════════════════
// ADAPTER CÂU HỎI CHO BEAMER
// ══════════════════════════════════════════════════════════════════════════

#let _lec-q-label = counter("lec-q-idx")

#let lt-tn(stem, options, correct: (), loigiai: none, de: "", num: auto) = {
  _lec-q-label.step()
  slide(title: none)[
    #context {
      let s = _lec-style.get()
      let q-n = if num != auto { num } else { _lec-q-label.display() }
      let labels = ("A", "B", "C", "D", "E", "F")
      let de-tag = if de != "" {
        box(fill: lec-palette.violet.lighten(70%), stroke: 0.5pt + lec-palette.violet, inset: (x: 7pt, y: 3pt), radius: 3pt)[
          #text(size: 7pt, fill: lec-palette.violet, weight: "bold")[#de]
        ]
      } else { none }
      let correct-set = if type(correct) == array { correct } else { (correct,) }

      grid(
        columns: (auto, 1fr),
        align: (left + horizon, right + horizon),
        box(fill: s.accent, inset: (x: 12pt, y: 8pt), radius: 4pt)[
          #text(weight: "bold", fill: white, size: s.base * 0.85)[Câu #q-n]
        ],
        if de-tag != none { de-tag } else { [] },
      )
      v(0.6em)
      text(size: s.base * 1.0, fill: s.fg, weight: "medium")[#stem]
      v(0.4em)
      grid(
        columns: (1fr, 1fr),
        row-gutter: 8pt, column-gutter: 10pt,
        ..options.enumerate().map(((i, opt)) => {
          let lbl = labels.at(i)
          let is-dict = type(opt) == dictionary
          let is-true-dict = is-dict and opt.at("true", default: false)
          let ok = correct-set.contains(i + 1) or is-true-dict
          let content-val = if is-dict { opt.at("body", default: opt) } else { opt }
          block(
            width: 100%,
            fill: if ok { lec-palette.emerald.lighten(85%) } else { s.card },
            stroke: if ok { 1.5pt + lec-palette.emerald } else { 0.8pt + s.accent.lighten(30%) },
            inset: (x: 0pt, y: 0pt),
            radius: 7pt,
          )[
            #grid(columns: (auto, 1fr), column-gutter: 0pt)[
              #box(
                fill: if ok { lec-palette.emerald } else { s.accent },
                inset: (x: 10pt, y: 9pt),
                radius: (top-left: 6pt, bottom-left: 6pt),
              )[
                #text(weight: "bold", fill: white, size: s.base * 0.72)[#lbl.]
              ]
            ][
              #pad(x: 10pt, y: 9pt)[
                #text(size: s.base * 0.78, fill: s.fg)[#content-val]
              ]
            ]
          ]
        })
      )
    }
    #if loigiai != none {
      pause
      context {
        let s = _lec-style.get()
        v(0.3em)
        block(
          width: 100%,
          fill: lec-palette.sol-fill,
          stroke: (left: 3pt + lec-palette.emerald),
          inset: (x: 14pt, y: 9pt),
          radius: (right: 5pt),
        )[
          #text(size: s.base * 0.65, fill: lec-palette.emerald, weight: "bold")[✅ LỜI GIẢI]
          #v(0.25em)
          #set text(size: s.base * 0.75, fill: s.fg)
          #loigiai
        ]
      }
    }
  ]
}

#let lt-ds(stem, statements, loigiai: none, de: "", num: auto) = {
  _lec-q-label.step()
  slide(title: none)[
    #context {
      let s = _lec-style.get()
      let q-n = if num != auto { num } else { _lec-q-label.display() }
      let alpha = ("a", "b", "c", "d")
      let de-tag = if de != "" {
        box(fill: lec-palette.violet.lighten(70%), stroke: 0.5pt + lec-palette.violet, inset: (x: 7pt, y: 3pt), radius: 3pt)[
          #text(size: 7pt, fill: lec-palette.violet, weight: "bold")[#de]
        ]
      } else { none }

      grid(
        columns: (auto, 1fr),
        align: (left + horizon, right + horizon),
        box(fill: lec-palette.violet, inset: (x: 12pt, y: 8pt), radius: 4pt)[
          #text(weight: "bold", fill: white, size: s.base * 0.85)[Câu #q-n — Đúng/Sai]
        ],
        if de-tag != none { de-tag } else { [] },
      )
      v(0.6em)
      text(size: s.base * 1.0, fill: s.fg, weight: "medium")[#stem]
      v(0.4em)
      
      for (i, stmt) in statements.enumerate() {
        let content-val = if type(stmt) == dictionary { stmt.at("body", default: stmt) } else { stmt }
        block(below: 8pt)[
          #grid(
            columns: (auto, 1fr),
            column-gutter: 12pt,
            align: (center + top, left + horizon),
            box(
              width: 26pt, height: 26pt,
              fill: s.card,
              stroke: 1pt + s.accent.lighten(40%),
              radius: 13pt,
            )[
              #align(center + horizon)[
                #text(weight: "bold", fill: s.accent, size: s.base * 0.75)[
                  #alpha.at(i)
                ]
              ]
            ],
            text(size: s.base * 0.85, fill: s.fg)[#content-val],
          )
        ]
      }
    }
    #if loigiai != none {
      pause
      context {
        let s = _lec-style.get()
        let alpha = ("a", "b", "c", "d")
        v(0.3em)
        block(
          width: 100%,
          fill: lec-palette.sol-fill,
          stroke: (left: 3pt + lec-palette.emerald),
          inset: (x: 14pt, y: 9pt),
          radius: (right: 5pt),
        )[
          #text(size: s.base * 0.65, fill: lec-palette.emerald, weight: "bold")[✅ LỜI GIẢI CHI TIẾT & ĐÁP ÁN]
          #v(0.25em)
          
          #grid(
            columns: (auto, auto, auto, auto),
            column-gutter: 16pt,
            ..statements.enumerate().map(((i, stmt)) => {
              let correct-val = if type(stmt) == dictionary { stmt.at("true", default: false) } else { false }
              let lbl = if correct-val { "Đúng" } else { "Sai" }
              let clr = if correct-val { lec-palette.emerald } else { lec-palette.rose }
              text(weight: "bold", fill: clr, size: s.base * 0.75)[Mệnh đề #alpha.at(i): #lbl]
            })
          )
          #v(0.5em)
          #line(length: 100%, stroke: 0.5pt + lec-palette.emerald.lighten(60%))
          #v(0.5em)
          #set text(size: s.base * 0.75, fill: s.fg)
          #loigiai
        ]
      }
    }
  ]
}

#let lt-tln(stem, answer, loigiai: none, de: "", num: auto) = {
  _lec-q-label.step()
  slide(title: none)[
    #context {
      let s = _lec-style.get()
      let q-n = if num != auto { num } else { _lec-q-label.display() }
      let de-tag = if de != "" {
        box(fill: lec-palette.cyan.lighten(70%), stroke: 0.5pt + lec-palette.cyan, inset: (x: 7pt, y: 3pt), radius: 3pt)[
          #text(size: 7pt, fill: lec-palette.cyan, weight: "bold")[#de]
        ]
      } else { none }

      grid(
        columns: (auto, 1fr),
        align: (left + horizon, right + horizon),
        box(fill: lec-palette.cyan, inset: (x: 12pt, y: 8pt), radius: 4pt)[
          #text(weight: "bold", fill: white, size: s.base * 0.85)[Câu #q-n — Tự luận ngắn]
        ],
        if de-tag != none { de-tag } else { [] },
      )
      v(0.6em)
      text(size: s.base * 1.0, fill: s.fg, weight: "medium")[#stem]
    }
    #pause
    #context {
      let s = _lec-style.get()
      v(0.5em)
      align(center)[
        #block(
          fill: lec-palette.amber.lighten(85%),
          stroke: 1.5pt + lec-palette.amber,
          inset: (x: 24pt, y: 12pt),
          radius: 8pt,
        )[
          #text(size: s.base * 0.68, fill: lec-palette.amber, weight: "bold")[🎯 ĐÁP ÁN:]
          #h(8pt)
          #text(size: s.base * 1.1, fill: white, weight: "bold")[#answer]
        ]
      ]
    }
    #if loigiai != none {
      pause
      context {
        let s = _lec-style.get()
        v(0.3em)
        block(
          width: 100%,
          fill: lec-palette.sol-fill,
          stroke: (left: 3pt + lec-palette.emerald),
          inset: (x: 14pt, y: 9pt),
          radius: (right: 5pt),
        )[
          #text(size: s.base * 0.65, fill: lec-palette.emerald, weight: "bold")[✅ LỜI GIẢI]
          #v(0.25em)
          #set text(size: s.base * 0.72, fill: s.fg)
          #loigiai
        ]
      }
    }
  ]
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-axes — Hệ trục toạ độ Oxy bằng Cetz (helper tiện dụng)
// ══════════════════════════════════════════════════════════════════════════
#let lt-axes(
  x-range: (-3, 4),  // (min, max)
  y-range: (-3, 3),  // (min, max)
  body-fn,           // Hàm nhận import draw: * và vẽ thêm
  width: 7cm,
  stroke-clr: white,
) = {
  box(width: width)[
    #canvas({
      import draw: *
      let (x0, x1) = x-range
      let (y0, y1) = y-range
      // Axes
      line((x0 - 0.3, 0), (x1 + 0.5, 0), mark: (end: ">"), stroke: stroke-clr)
      line((0, y0 - 0.3), (0, y1 + 0.5), mark: (end: ">"), stroke: stroke-clr)
      content((x1 + 0.6, 0), text(fill: stroke-clr, size: 9pt)[$x$])
      content((0.25, y1 + 0.5), text(fill: stroke-clr, size: 9pt)[$y$])
      content((-0.25, -0.25), text(fill: stroke-clr, size: 8pt)[$O$])
      // Tick marks
      for xi in range(int(x0), int(x1) + 1) {
        if xi != 0 {
          line((xi, -0.1), (xi, 0.1), stroke: stroke-clr.transparentize(40%))
          content((xi, -0.3), text(fill: stroke-clr.transparentize(30%), size: 7pt)[#xi])
        }
      }
      for yi in range(int(y0), int(y1) + 1) {
        if yi != 0 {
          line((-0.1, yi), (0.1, yi), stroke: stroke-clr.transparentize(40%))
          content((-0.4, yi), text(fill: stroke-clr.transparentize(30%), size: 7pt)[#yi])
        }
      }
      // User drawings
      body-fn
    })
  ]
}

// ══════════════════════════════════════════════════════════════════════════
// MACRO: lt-timeline — Dòng thời gian lịch sử (Cetz)
// events = ((year, label, desc, clr), ...)
// ══════════════════════════════════════════════════════════════════════════
#let lt-timeline(events, width: 15cm) = {
  let n = events.len()
  align(center)[
    #box(width: width)[
      #canvas({
        import draw: *
        let W = 15.0
        let spacing = (W - 1.0) / (n - 1)
        // Đường ngang
        line((0.5, 0), (W - 0.5, 0), stroke: 1.5pt + lec-palette.muted)
        for (i, ev) in events.enumerate() {
          let x = 0.5 + i * spacing
          let yr = ev.at(0)
          let lbl = ev.at(1)
          let desc = if ev.len() > 2 { ev.at(2) } else { "" }
          let clr = if ev.len() > 3 { ev.at(3) } else { lec-palette.navy }
          // Điểm tròn
          circle((x, 0), radius: 0.18, fill: clr, stroke: none)
          // Năm — đặt xen kẽ trên/dưới để tránh chồng
          if calc.rem(i, 2) == 0 {
            line((x, 0.18), (x, 0.7), stroke: 0.6pt + clr)
            content((x, 0.85), text(fill: clr, size: 7pt, weight: "bold")[#yr])
            if lbl != "" {
              content((x, 1.2), text(fill: white, size: 6.5pt, weight: "bold")[#lbl])
            }
            if desc != "" {
              content((x, 1.5), text(fill: lec-palette.muted, size: 5.5pt)[#desc])
            }
          } else {
            line((x, -0.18), (x, -0.7), stroke: 0.6pt + clr)
            content((x, -0.85), text(fill: clr, size: 7pt, weight: "bold")[#yr])
            if lbl != "" {
              content((x, -1.2), text(fill: white, size: 6.5pt, weight: "bold")[#lbl])
            }
            if desc != "" {
              content((x, -1.5), text(fill: lec-palette.muted, size: 5.5pt)[#desc])
            }
          }
        }
      })
    ]
  ]
}

// ── lt-question-bank-header — Tiêu đề nhóm câu hỏi theo đề ──────────────
#let lt-qbank-header(de, count, icon: "📚") = {
  context {
    let s = _lec-style.get()
    block(
      width: 100%,
      fill: lec-palette.violet.darken(80%),
      stroke: (left: 3pt + lec-palette.violet, top: 0.5pt + lec-palette.violet.lighten(40%)),
      inset: (x: 14pt, y: 10pt),
      radius: 6pt,
    )[
      #text(fill: lec-palette.violet, weight: "bold", size: s.base * 0.75)[
        #icon #de — #count câu hỏi
      ]
    ]
  }
}

// ── lt-section (alias for backward compat with non-TOC usage) ────────────
// Giữ lại version cũ cho backward compat
#let lt-section(icon, body) = lt-section-link("lec-sec-" + icon, icon, body)

// ── MACRO TRẮC NGHIỆM & TRÌNH BÀY ──────────────────────────────────────────
#let True(body) = ("true": true, body: body)
#let step(title) = { v(0.3em); text(fill: lec-palette.navy, weight: "bold")[👉 #title]; v(0.2em) }
