// =========================================================
// SANG-EXAM.TYP v6.0 — Engine thi THPT chuẩn ex_test.sty
// =========================================================

// ── Màu ──────────────────────────────────────────────────
#let palette = (
  ink: black,
  muted: rgb("#555"),
  border: rgb("#bbb"),
  accent: rgb("#0057b8"),
  correct: rgb("#1a7a2e"),
  wrong: rgb("#cc2200"),
  sol-bg: rgb("#f0f6ff"),
)
#let classic = (
  blue: rgb("#0057b8"),
  emerald: rgb("#1a7a2e"),
  crimson: rgb("#cc2200"),
  ink: black,
)

// ── Helpers ───────────────────────────────────────────────
#let True(body) = (body: body, correct: true)

#let _panel(
  body,
  title: none,
  accent: palette.accent,
  fill: white,
  stroke: auto,
  inset: (x: 12pt, y: 8pt),
  radius: 4pt,
  title-fill: auto,
  boxed: true,
) = {
  let border = if stroke == auto { (left: 4pt + accent) } else { stroke }
  let heading-fill = if title-fill == auto { accent } else { title-fill }
  if boxed {
    block(width: 100%, fill: fill, stroke: border, inset: inset, radius: radius)[
      #if title != none {
        text(weight: "bold", fill: heading-fill)[#title]
        v(0.2em)
      }
      #body
    ]
  } else {
    [
      #if title != none {
        text(weight: "bold", fill: heading-fill)[#title]
        v(0.2em)
      }
      #body
    ]
  }
}

// ── Các hộp ghi chú đẹp ───────────────────────────────────
#let ppgiai(body, ..args) = _panel(
  body,
  title: [💡 Phương pháp giải:],
  accent: palette.correct,
  fill: rgb("#eef6ed"),
  title-fill: palette.correct,
  radius: (right: 4pt),
  ..args,
)

#let luuy(body, ..args) = _panel(
  body,
  title: [⚠️ Lưu ý:],
  accent: rgb("#f57c00"),
  fill: rgb("#fff4e5"),
  title-fill: rgb("#e65100"),
  radius: (right: 4pt),
  ..args,
)

#let meo(body, ..args) = _panel(
  body,
  title: [🚀 Mẹo giải nhanh:],
  accent: rgb("#d81b60"),
  fill: rgb("#fce4ec"),
  title-fill: rgb("#c2185b"),
  radius: (right: 4pt),
  ..args,
)
#let nhanxet(body, title: [📝 Nhận xét:], ..args) = _panel(
  body,
  title: title,
  accent: rgb("#6b21a8"), // Màu tím viền
  fill: rgb("#faf5ff"), // Màu nền tím nhạt
  title-fill: rgb("#581c87"), // Màu chữ tiêu đề
  radius: (right: 4pt),
  ..args,
)

#let giainhanh(body, ..args) = meo(body, ..args)

#let lythuyet(body, title: [Lý thuyết], ..args) = _panel(
  body,
  title: title,
  accent: classic.blue,
  fill: rgb("#eef4ff"),
  radius: (right: 4pt),
  ..args,
)

#let note(body, title: [Ghi chú], ..args) = _panel(
  body,
  title: title,
  accent: rgb("#0f766e"),
  fill: rgb("#ecfeff"),
  radius: (right: 4pt),
  ..args,
)

#let dn(body, title: [Định nghĩa], ..args) = _panel(
  body,
  title: title,
  accent: classic.blue,
  fill: rgb("#eff6ff"),
  radius: (right: 4pt),
  ..args,
)

#let dl(body, title: [Định lý], ..args) = _panel(
  body,
  title: title,
  accent: classic.crimson,
  fill: rgb("#fff1f2"),
  radius: (right: 4pt),
  ..args,
)

#let tc(body, title: [Tính chất], ..args) = _panel(
  body,
  title: title,
  accent: classic.emerald,
  fill: rgb("#ecfdf5"),
  radius: (right: 4pt),
  ..args,
)

#let bode(body, title: [Bổ đề], ..args) = _panel(
  body,
  title: title,
  accent: rgb("#9a3412"),
  fill: rgb("#fff7ed"),
  radius: (right: 4pt),
  ..args,
)

// ── Bộ đếm & state ────────────────────────────────────────
#let _q-cnt = counter("se-q")
#let _global-q-cnt = counter("se-g-q")
#let _part-cnt = counter("se-p-cnt")
#let _mcq-meta = state("se-mcq", ())
#let _tf-meta = state("se-tf", ())
#let _sh-meta = state("se-sh", ())
#let _tl-meta = state("se-tl", ())

// - #resetexamstate() -> xoá đáp án đã gom, reset số câu và số phần về đầu đề mới
#let resetexamstate(question-start: 1, part-start: 1) = {
  let current-question = if question-start > 0 { question-start - 1 } else { 0 }
  let current-part = if part-start > 0 { part-start - 1 } else { 0 }
  [
    #_q-cnt.update(current-question)
    #_global-q-cnt.update(current-question)
    #_part-cnt.update(current-part)
    #_mcq-meta.update(_ => ())
    #_tf-meta.update(_ => ())
    #_sh-meta.update(_ => ())
    #_tl-meta.update(_ => ())
    #metadata((kind: "question", current: current-question)) <se-q-reset>
  ]
}

#let _q-marker = <se-q-marker>
#let _q-reset-marker = <se-q-reset>

#let _resolve-loigiai(loigiai, args) = {
  if loigiai != none { loigiai } else { args.named().at("solution", default: none) }
}

#let _question-frame(
  body,
  below: 1em,
  boxed: false,
  fill: white,
  stroke: 0.6pt + palette.border,
  inset: (x: 10pt, y: 8pt),
  radius: 4pt,
) = {
  if boxed {
    block(width: 100%, below: below, fill: fill, stroke: stroke, inset: inset, radius: radius)[#body]
  } else {
    block(width: 100%, below: below)[#body]
  }
}

#let _next-question-num(num: auto) = {
  let resets = query(selector(_q-reset-marker).before(here()))
  let resolved = if num == auto {
    if resets.len() == 0 {
      query(selector(_q-marker).before(here())).len() + 1
    } else {
      let reset = resets.last()
      let base = reset.value.current
      let seen = query(selector(_q-marker).after(reset.location()).before(here())).len()
      base + seen + 1
    }
  } else {
    num
  }
  (
    num: resolved,
    markers: [
      #if num != auto {
        [#metadata((kind: "question", current: num - 1)) <se-q-reset>]
      }
      #metadata("question") <se-q-marker>
    ],
  )
}

// ── Điều khiển bộ đếm ────────────────────────────────────
// - #resetcau()      -> câu kế tiếp là Câu 1
// - #setcau(13)      -> câu kế tiếp là Câu 13
// - #resetphan()     -> phần kế tiếp là PHẦN I
// - #setphan(3)      -> phần kế tiếp là PHẦN III
// - #exam-part(..., reset-counter: true) -> reset số câu về 1 ngay đầu phần đó
#let setcounter(env, start) = {
  let current = if start > 0 { start - 1 } else { 0 }
  let name = if type(env) == str { lower(env) } else { env }
  if ("cau", "question", "tn", "ds", "tln", "tl").contains(name) {
    [
      #metadata((kind: "question", current: current)) <se-q-reset>
    ]
  } else if ("part", "phan").contains(name) {
    [#_part-cnt.update(current)]
  } else {
    none
  }
}

#let resetcounter(env, start: 1) = setcounter(env, start)
#let setcau(start) = setcounter("cau", start)
#let resetcau(start: 1) = resetcounter("cau", start: start)
#let setphan(start) = setcounter("part", start)
#let resetphan(start: 1) = resetcounter("part", start: start)

// ── Kẻ dòng chấm cho HS ───────────────────────────────────
#let draw-lines(n) = {
  v(0.2em)
  for i in range(n) {
    v(0.6em)
    line(length: 100%, stroke: (paint: rgb("#b0b0b0"), thickness: 0.6pt, dash: "dotted"))
    v(0.8em)
  }
}

// ── Lời giải block ────────────────────────────────────────
#let _sol(s, a) = block(
  width: 100%,
  fill: palette.sol-bg,
  stroke: (left: 3pt + a),
  inset: (left: 10pt, right: 8pt, top: 6pt, bottom: 6pt),
  radius: (right: 4pt),
)[#text(weight: "bold", fill: a)[Lời giải.] #s]

// ─────────────────────────────────────────────────────────
// MCQ
// Auto-col: đo text width vs 0.25L / 0.50L (chuẩn ex_test)
// fig: / fig-pos: "right"|"left"|"center" / fig-width: / cols: 0|1|2|4
// ─────────────────────────────────────────────────────────
#let mcq(
  stem,
  options,
  correct: (),
  loigiai: none,
  mode: "dethi",
  accent: palette.accent,
  fig: none,
  fig-pos: "right",
  fig-width: 35%,
  cols: 0,
  lines: 0,
  num: auto,
  prefix: "Câu",
  boxed: false,
  box-fill: white,
  box-stroke: 0.6pt + palette.border,
  box-inset: (x: 10pt, y: 8pt),
  box-radius: 4pt,
  ..args,
) = context {
  let loigiai = _resolve-loigiai(loigiai, args)
  let q-state = _next-question-num(num: num)
  let num = q-state.num
  let labels = ("A", "B", "C", "D", "E", "F")

  // Tìm đáp án đúng & lưu state
  let ai = -1
  let idx = 0
  for opt in options {
    let ok = if type(opt) == dictionary { opt.at("correct", default: false) } else { correct.contains(idx + 1) }
    if ok { ai = idx }
    idx += 1
  }
  // Mảng text và correct cho từng option
  let opt-texts = options.map(o => if type(o) == dictionary { o.body } else { o })
  let opt-oks = options
    .enumerate()
    .map(((i, o)) => if type(o) == dictionary { o.at("correct", default: false) } else { correct.contains(i + 1) })
  let label-width = 18pt
  let label-gap = 4pt
  let option-leading = 0.95em
  let option-top-gap = 0.16em
  let option-indent = 1.1em

  // Đo inline width và height của từng option
  // NOTE: measure() KHÔNG capture show math.display, nhưng:
  //   - width inline ≈ width display  → dùng để chọn số cột
  //   - height inline: text thường ≈ 12pt, phân số inline ≈ 20–24pt
  //     → dùng làm proxy để phát hiện phân số/công thức cao
  let mw = 0pt
  let max-inline-h = 0pt
  for t in opt-texts {
    let sz = measure(box[#t])
    if sz.width > mw { mw = sz.width }
    if sz.height > max-inline-h { max-inline-h = sz.height }
  }
  // Ngưỡng 16pt: text thường < 16pt, phân số inline > 16pt
  // ── TINH CHỈNH: đổi 16pt nếu cần ép lên/xuống ──
  let has-tall-math = max-inline-h > 16pt

  // Grid options — trong layout để biết linewidth thực
  let opts-r = layout(sz => {
    let lw = sz.width
    let nc = if cols != 0 {
      cols
    } else {
      // Chọn số cột chỉ dựa trên width (height không đo được do math.display)
      // ── TINH CHỈNH: đổi hệ số 1.06 / 1.18 để ép nhiều hoặc ít cột hơn ──
      let chosen = 1
      for candidate in (4, 2) {
        if chosen == 1 {
          let gutter = if candidate == 4 { 11pt } else { 13pt }
          let cell-width = (lw - gutter * (candidate - 1)) / candidate
          let text-width = cell-width - label-width - label-gap
          if text-width > 0pt and mw <= text-width * (if candidate == 4 { 1.06 } else { 1.18 }) {
            chosen = candidate
          }
        }
      }
      chosen
    }
    let column-gutter = if nc == 1 { 0pt } else if nc == 4 { 11pt } else { 13pt }
    // ── TINH CHỈNH: row-gutter ──────────────────────────────────────────────
    // has-tall-math = true khi inline height > 16pt (proxy cho phân số display)
    // nc == 4: options ngắn, hiếm phân số → luôn 0.45em
    // nc == 2: text thường 0.65em | có phân số 1.5em
    // nc == 1: block tự wrap
    let row-gutter = if nc == 4 { 0.45em } else if nc == 2 { if has-tall-math { 1.5em } else { 0.65em } } else { 0em }
    grid(
      columns: nc,
      row-gutter: row-gutter,
      column-gutter: column-gutter,
      align: left + top,
      ..opt-texts
        .enumerate()
        .map(((i, t)) => {
          let hi = (mode == "loigiai" or mode == "solcolor") and opt-oks.at(i)
          let col = if hi { rgb("#cc2200") } else { black } // Đỏ cho đáp án đúng
          grid(
            columns: (label-width, 1fr),
            column-gutter: label-gap,
            align: (left + top, left + top),
            text(weight: "bold", fill: col)[#labels.at(i).],
            [
              #set par(justify: false, leading: option-leading)
              #text(fill: col, weight: if hi { "bold" } else { "regular" })[#t]
            ],
          )
        })
    )
  })

  // Stem row: [Câu N.] [stem] [fig?]
  let q-label = text(weight: "bold", fill: accent)[#prefix #num. ]
  let stem-row = if fig != none and (fig-pos == "right" or fig-pos == "left") {
    if fig-pos == "right" {
      grid(
        columns: (1fr, fig-width),
        column-gutter: 14pt,
        align: (left + top, center + top),
        [#q-label #stem], fig,
      )
    } else {
      grid(
        columns: (fig-width, 1fr),
        column-gutter: 14pt,
        align: (center + top, left + top),
        fig, [#q-label #stem],
      )
    }
  } else if fig != none and fig-pos == "center" {
    [#q-label #stem]
    v(0.4em)
    align(center, fig)
  } else {
    [#q-label #stem]
  }

  [
    #q-state.markers
    #_mcq-meta.update(m => m + ((num: num, ans: if ai >= 0 { labels.at(ai) } else { "?" }),))
    #_question-frame(
      [
        #stem-row
        #v(option-top-gap)
        #pad(left: option-indent)[#opts-r]
        #if lines > 0 { draw-lines(lines) }
        #if mode == "loigiai" and loigiai != none {
          v(0.7em)
          _sol(loigiai, accent)
        }
      ],
      below: 1.05em,
      boxed: boxed,
      fill: box-fill,
      stroke: box-stroke,
      inset: box-inset,
      radius: box-radius,
    )
  ]
}

// ─────────────────────────────────────────────────────────
// TF — True([...]) = đúng, [...] = sai
// Bảng: Phát biểu | □Đ | □S
// ─────────────────────────────────────────────────────────
#let tf(
  stem,
  statements,
  loigiai: none,
  mode: "dethi",
  accent: palette.accent,
  fig: none,
  fig-pos: "right",
  fig-width: 30%,
  lines: 0,
  num: auto,
  prefix: "Câu",
  boxed: false,
  box-fill: white,
  box-stroke: 0.6pt + palette.border,
  box-inset: (x: 10pt, y: 8pt),
  box-radius: 4pt,
  ..args,
) = context {
  let loigiai = _resolve-loigiai(loigiai, args)
  let q-state = _next-question-num(num: num)
  let num = q-state.num
  let vis-ans = mode != "dethi"
  let alpha = ("a", "b", "c", "d", "e", "f")

  // Lưu state TF: mảng Đ/S cho từng phát biểu
  let tf-row = statements.map(s => if type(s) == dictionary and s.at("correct", default: false) { "Đ" } else { "S" })

  // Xây dựng bảng
  let rows = statements
    .enumerate()
    .map(((i, s)) => {
      let ok = if type(s) == dictionary { s.at("correct", default: false) } else { false }
      let txt = if type(s) == dictionary { s.body } else { s }
      let md = if vis-ans and ok { text(fill: palette.correct, weight: "bold")[✓] } else { none }
      let ms = if vis-ans and not ok { text(fill: palette.wrong, weight: "bold")[✓] } else { none }
      let fd = if vis-ans and ok { palette.correct.lighten(80%) } else { white }
      let fs = if vis-ans and not ok { palette.wrong.lighten(85%) } else { white }
      (
        pad(x: 6pt, y: 4pt)[#text(weight: "bold")[#alpha.at(i))] #h(3pt) #txt],
        align(center + horizon)[
          #box(width: 1.8em, height: 1.8em, stroke: 0.6pt + palette.border, fill: fd, align(center + horizon)[#md])
        ],
        align(center + horizon)[
          #box(width: 1.8em, height: 1.8em, stroke: 0.6pt + palette.border, fill: fs, align(center + horizon)[#ms])
        ],
      )
    })
    .flatten()

  let tbl = table(
    columns: (1fr, auto, auto),
    stroke: 0.5pt + palette.border,
    align: (left + horizon, center + horizon, center + horizon),
    table.cell(fill: accent, align: center + horizon, pad(left: 6pt, y: 5pt)[#text(
      fill: white,
      weight: "bold",
    )[Phát biểu]]),
    table.cell(fill: accent, align: center + horizon, pad(x: 8pt, y: 5pt)[#text(fill: white, weight: "bold")[Đ]]),
    table.cell(fill: accent, align: center + horizon, pad(x: 8pt, y: 5pt)[#text(fill: white, weight: "bold")[S]]),
    ..rows,
  )

  let q-label = text(weight: "bold", fill: accent)[#prefix #num. ]
  let stem-row = if fig != none and (fig-pos == "right" or fig-pos == "left") {
    if fig-pos == "right" {
      grid(
        columns: (1fr, fig-width),
        column-gutter: 14pt,
        align: (left + top, center + top),
        [#q-label #stem], fig,
      )
    } else {
      grid(
        columns: (fig-width, 1fr),
        column-gutter: 14pt,
        align: (center + top, left + top),
        fig, [#q-label #stem],
      )
    }
  } else if fig != none and fig-pos == "center" {
    [#q-label #stem]
    v(0.4em)
    align(center, fig)
  } else {
    [#q-label #stem]
  }

  [
    #q-state.markers
    #_tf-meta.update(m => m + ((num: num, ans: tf-row),))
    #_question-frame(
      [
        #stem-row
        #v(0.6em)
        #pad(left: 1.5em)[#tbl]
        #if lines > 0 { draw-lines(lines) }
        #if mode == "loigiai" and loigiai != none {
          v(0.7em)
          _sol(loigiai, accent)
        }
      ],
      below: 1.4em,
      boxed: boxed,
      fill: box-fill,
      stroke: box-stroke,
      inset: box-inset,
      radius: box-radius,
    )
  ]
}
#let hoac(..args) = math.cases(delim: "[", ..args)
#let heva(..args) = math.cases(delim: "{", ..args)
// ─────────────────────────────────────────────────────────
// SHORT — 4 ô trống / hiện đáp án
// ─────────────────────────────────────────────────────────
#let short(
  stem,
  answer,
  loigiai: none,
  mode: "dethi",
  accent: palette.accent,
  fig: none,
  fig-pos: "right",
  fig-width: 30%,
  show-boxes: true,
  lines: 0,
  num: auto,
  prefix: "Câu",
  box-count: 4,
  boxed: false,
  box-fill: white,
  box-stroke: 0.6pt + palette.border,
  box-inset: (x: 10pt, y: 8pt),
  box-radius: 4pt,
  ..args,
) = context {
  let loigiai = _resolve-loigiai(loigiai, args)
  let q-state = _next-question-num(num: num)
  let num = q-state.num

  let widget = if mode == "dethi" {
    stack(dir: ltr, spacing: 3pt, ..range(box-count).map(_ => box(width: 1.9em, height: 1.9em, stroke: 0.7pt + black)))
  } else {
    box(fill: palette.correct.lighten(85%), stroke: 1pt + palette.correct, inset: (x: 10pt, y: 3pt), radius: 3pt)[
      #text(weight: "bold", fill: palette.correct, size: 1.05em)[#answer]
    ]
  }

  let q-label = text(weight: "bold", fill: accent)[#prefix #num. ]
  let stem-row = if fig != none and (fig-pos == "right" or fig-pos == "left") {
    if fig-pos == "right" {
      grid(
        columns: (1fr, fig-width),
        column-gutter: 14pt,
        align: (left + top, center + top),
        [#q-label #stem], fig,
      )
    } else {
      grid(
        columns: (fig-width, 1fr),
        column-gutter: 14pt,
        align: (center + top, left + top),
        fig, [#q-label #stem],
      )
    }
  } else if fig != none and fig-pos == "center" {
    [#q-label #stem]
    v(0.4em)
    align(center, fig)
  } else {
    [#q-label #stem]
  }

  [
    #q-state.markers
    #_sh-meta.update(m => m + ((num: num, ans: answer),))
    #_question-frame(
      [
        #stem-row
        #if show-boxes {
          v(0.6em)
          pad(left: 1.5em)[
            #stack(dir: ltr, spacing: 6pt, text(weight: "bold")[Đáp số:], widget)
          ]
        }
        #if lines > 0 { draw-lines(lines) }
        #if mode == "loigiai" and loigiai != none {
          v(0.7em)
          _sol(loigiai, accent)
        }
      ],
      below: 1.4em,
      boxed: boxed,
      fill: box-fill,
      stroke: box-stroke,
      inset: box-inset,
      radius: box-radius,
    )
  ]
}

#let tl(
  stem,
  loigiai: none,
  mode: "dethi",
  accent: palette.accent,
  fig: none,
  fig-pos: "right",
  fig-width: 30%,
  lines: 6,
  num: auto,
  prefix: "Câu",
  boxed: false,
  box-fill: white,
  box-stroke: 0.6pt + palette.border,
  box-inset: (x: 10pt, y: 8pt),
  box-radius: 4pt,
  ..args,
) = context {
  let loigiai = _resolve-loigiai(loigiai, args)
  let q-state = _next-question-num(num: num)
  let num = q-state.num

  let q-label = text(weight: "bold", fill: accent)[#prefix #num. ]
  let stem-row = if fig != none and (fig-pos == "right" or fig-pos == "left") {
    if fig-pos == "right" {
      grid(
        columns: (1fr, fig-width),
        column-gutter: 14pt,
        align: (left + top, center + top),
        [#q-label #stem], fig,
      )
    } else {
      grid(
        columns: (fig-width, 1fr),
        column-gutter: 14pt,
        align: (center + top, left + top),
        fig, [#q-label #stem],
      )
    }
  } else if fig != none and fig-pos == "center" {
    [#q-label #stem]
    v(0.4em)
    align(center, fig)
  } else {
    [#q-label #stem]
  }

  [
    #q-state.markers
    #_tl-meta.update(m => m + ((num: num),))
    #_question-frame(
      [
        #stem-row
        #if lines > 0 { draw-lines(lines) }
        #if mode == "loigiai" and loigiai != none {
          v(0.7em)
          _sol(loigiai, accent)
        }
      ],
      below: 1.4em,
      boxed: boxed,
      fill: box-fill,
      stroke: box-stroke,
      inset: box-inset,
      radius: box-radius,
    )
  ]
}

#let tn = mcq
#let ds = tf
#let tln = short

// ── exam-mode ─────────────────────────────────────────────
#let exam-mode(mode: "dethi", accent: palette.accent) = (
  tn: tn.with(mode: mode, accent: accent),
  ds: ds.with(mode: mode, accent: accent),
  tln: tln.with(mode: mode, accent: accent),
  tl: tl.with(mode: mode, accent: accent),
  mcq: mcq.with(mode: mode, accent: accent),
  tf: tf.with(mode: mode, accent: accent),
  short: short.with(mode: mode, accent: accent),
)

// ── het (HẾT ĐỀ) ───────────────────────────────────────────
#let het = align(center)[
  #v(2.5em)
  #text(weight: "bold")[----------- HẾT -----------] <end-exam>
  #v(0.4em)
  #text(style: "italic", size: 11pt)[
    Thí sinh không được sử dụng tài liệu. \
    Cán bộ coi thi không giải thích gì thêm.
  ]
  #v(1.5em)
]

// ── exam-part ─────────────────────────────────────────────
// Mặc định `reset-counter: false` để số câu chạy liên tục toàn đề.
// Nếu muốn một phần bắt đầu lại từ Câu 1, dùng `reset-counter: true`.
#let exam-part(title, count: auto, reset-counter: false) = [
  #if reset-counter {
    [#metadata((kind: "question", current: 0)) <se-q-reset>]
  }
  #_part-cnt.step()
  #metadata("part") <ep-marker>
  #v(0.9em)
  #block(
    width: 100%,
    fill: rgb("#e8f0fc"),
    stroke: (left: 4pt + palette.accent),
    inset: (left: 10pt, right: 8pt, top: 7pt, bottom: 7pt),
    radius: (right: 4pt),
  )[
    #text(weight: "bold")[#title]
    #context {
      let c = count
      if c == auto {
        let markers = query(<ep-marker>)
        let ends = query(<end-exam>)
        let p-idx = query(selector(<ep-marker>).before(here())).len()
        let current-marker = markers.at(p-idx - 1)

        if p-idx < markers.len() {
          c = query(selector(_q-marker).after(current-marker.location()).before(markers.at(p-idx).location())).len()
        } else if ends.len() > 0 {
          c = query(selector(_q-marker).after(current-marker.location()).before(ends.last().location())).len()
        } else {
          c = query(selector(_q-marker).after(current-marker.location())).len()
        }
      }
      if c > 0 {
        h(1fr)
        text(style: "italic", fill: palette.muted)[(#c câu)]
      }
    }
  ]
  #v(0.5em)
]

// ─────────────────────────────────────────────────────────
// HEADER — Tiêu đề đề thi (v7 — nhiều tuỳ chọn)
// ─────────────────────────────────────────────────────────
#let thpt-school-exam(
  body,
  department: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  exam-title: "THI THỬ THPT QUỐC GIA 2026",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto, // auto = tự đếm từ exam-part
  code: "101",
  footer-left: none,
  accent: palette.accent,
  // ── Tuỳ chọn nâng cao ──
  show-topbar: false, // thanh màu accent trên đỉnh trang
  header-border: true, // đường kẻ dưới tiêu đề
  header-font: "Libertinus Serif",
  body-font: "Libertinus Serif",
  body-size: 12pt,
  q-style: "bold", // "bold" | "boxed" | "pill"
  q-color: auto, // auto = accent
) = {
  let _q-color = if q-color == auto { accent } else { q-color }

  set page(
    paper: "a4",
    margin: (top: 2cm, bottom: 2cm, x: 1.5cm),
    footer: context {
      set text(size: 9pt, fill: palette.muted)
      line(length: 100%, stroke: 0.4pt + palette.border)
      v(1pt)
      let locs = query(<end-exam>)
      let total = if locs.len() > 0 { locs.last().location().page() } else { counter(page).final().first() }
      grid(
        columns: (1fr, auto),
        align: (left, right),
        if footer-left != none { footer-left } else { [#exam-title — #subject] },
        [Trang #counter(page).display() / #total #if code != "" [— Mã Đề: #code]],
      )
    },
  )
  set text(font: body-font, size: body-size, lang: "vi")
  set par(justify: true, leading: 0.75em)
  show math.equation.where(block: false): math.display

  // Thanh màu accent trên đỉnh (tuỳ chọn)
  if show-topbar {
    place(top + left, dx: -1.5cm, dy: -2cm, rect(width: 21cm, height: 5pt, fill: accent))
  }

  // Tự đếm structure nếu = auto
  let struct-content = if structure != auto { structure } else {
    context {
      let mc = _mcq-meta.final().len()
      let tf = _tf-meta.final().len()
      let sh = _sh-meta.final().len()
      let essay = _tl-meta.final().len()
      let parts = ()
      if mc > 0 { parts.push([#mc câu trắc nghiệm]) }
      if tf > 0 { parts.push([#tf đúng/sai]) }
      if sh > 0 { parts.push([#sh trả lời ngắn]) }
      if essay > 0 { parts.push([#essay câu tự luận]) }
      parts.join([, ])
    }
  }

  // Header 2 cột
  v(0.3em)
  grid(
    columns: (1fr, 1fr),
    column-gutter: 8pt,
    align(center)[
      #set text(font: header-font)
      #text(weight: "bold", size: 12pt)[#department] \
      #text(weight: "bold", size: 12pt, fill: accent)[#school] \
      #v(-3pt) #line(length: 35%, stroke: 1pt + accent) #v(1pt)
      #text(style: "italic", size: 10pt)[
        (Đề thi có #context {
          let locs = query(<end-exam>)
          if locs.len() > 0 { locs.last().location().page() } else { counter(page).final().first() }
        } trang)
      ]
    ],
    align(center)[
      #set text(font: header-font)
      #text(weight: "bold", size: 13.5pt, fill: accent)[#upper(exam-title)] \
      #text(weight: "bold", size: 12pt)[MÔN #upper(subject)] \
      #text(style: "italic", size: 10.5pt)[Thời gian làm bài: #duration] \
      #text(style: "italic", size: 10pt)[(Đề có #struct-content)]
    ],
  )

  v(1.4em)
  grid(
    columns: (1fr, auto),
    column-gutter: 14pt,
    align: (left + bottom, center + bottom),
    {
      set text(size: 11.5pt)
      grid(
        columns: (auto, 1fr),
        row-gutter: 9pt,
        column-gutter: 3pt,
        align: (left + bottom, left + bottom),
        text(weight: "bold")[Họ và tên thí sinh:],
        line(length: 100%, stroke: (paint: black, thickness: 0.6pt, dash: "dotted")),

        text(weight: "bold")[Số Báo Danh:],
        line(length: 100%, stroke: (paint: black, thickness: 0.6pt, dash: "dotted")),
      )
    },
    if code != "" {
      box(stroke: 0.8pt + black, inset: (x: 12pt, y: 7pt))[
        #text(weight: "bold", size: 12pt)[Mã đề thi #code]
      ]
    },
  )
  v(0.9em)
  if header-border { line(length: 100%, stroke: 0.8pt + black) }
  v(1em)
  body
}


// ─────────────────────────────────────────────────────────
// PRINT-ANSWER-KEY — 3 bảng đáp án: MCQ / TF / Short
// ─────────────────────────────────────────────────────────
#let _chunk(arr, n) = {
  let out = ()
  let cur = ()
  for x in arr {
    cur.push(x)
    if cur.len() == n {
      out.push(cur)
      cur = ()
    }
  }
  if cur.len() > 0 { out.push(cur) }
  out
}

#let print-answer-key() = context {
  let mcq-ans = _mcq-meta.get()
  let tf-ans = _tf-meta.get()
  let sh-ans = _sh-meta.get()

  v(1.5em)

  // ── Bảng 1: Trắc nghiệm ──────────────────────────────
  if mcq-ans.len() > 0 {
    align(center, block(fill: palette.accent, inset: (x: 16pt, y: 5pt), radius: 3pt, text(
      fill: white,
      weight: "bold",
      size: 12pt,
    )[BẢNG ĐÁP ÁN — TRẮC NGHIỆM]))
    v(0.4em)
    align(center, table(
      columns: (auto,) + (1fr,) * 10,
      stroke: 0.5pt + palette.border,
      align: center + horizon,
      .._chunk(mcq-ans, 10)
        .map(grp => {
          let pn = 10 - grp.len()
          let r1 = (
            (
              table.cell(fill: palette.accent, pad(x: 6pt, y: 4pt)[#text(fill: white, weight: "bold", size: 9pt)[Câu]]),
            )
              + grp.map(it => table.cell(fill: rgb("#e8f0fc"), pad(y: 4pt)[#text(weight: "bold")[Câu #it.num]]))
              + range(pn).map(_ => table.cell(fill: rgb("#e8f0fc"))[])
          )
          let r2 = (
            (
              table.cell(fill: palette.accent, pad(x: 6pt, y: 4pt)[#text(
                fill: white,
                weight: "bold",
                size: 9pt,
              )[Đáp án]]),
            )
              + grp.map(it => pad(y: 4pt)[#text(weight: "bold", fill: palette.accent)[#it.ans]])
              + range(pn).map(_ => [])
          )
          (..r1, ..r2)
        })
        .flatten()
    ))
    v(1em)
  }

  // ── Bảng 2: Đúng/Sai ─────────────────────────────────
  if tf-ans.len() > 0 {
    align(center, block(fill: palette.accent, inset: (x: 16pt, y: 5pt), radius: 3pt, text(
      fill: white,
      weight: "bold",
      size: 12pt,
    )[BẢNG ĐÁP ÁN — ĐÚNG/SAI]))
    v(0.4em)
    align(center, table(
      columns: (auto, 1fr, 1fr, 1fr, 1fr),
      stroke: 0.5pt + palette.border,
      align: center + horizon,
      table.cell(fill: palette.accent, pad(x: 8pt, y: 5pt)[#text(fill: white, weight: "bold")[Câu]]),
      ..(
        ("a", "b", "c", "d").map(l => {
          let lbl = l + ")"
          table.cell(fill: palette.accent, pad(y: 5pt)[#text(fill: white, weight: "bold")[#lbl]])
        })
      ),
      ..tf-ans
        .map(item => {
          let cells = (
            table.cell(fill: rgb("#e8f0fc"), pad(y: 4pt)[#text(weight: "bold")[#item.num]]),
          )
          for vv in item.ans {
            let col = if vv == "Đ" { palette.correct } else { palette.wrong }
            cells = cells + (pad(y: 4pt)[#text(weight: "bold", fill: col)[#vv]],)
          }
          cells
        })
        .flatten(),
    ))
    v(1em)
  }

  // ── Bảng 3: Điền số ───────────────────────────────────
  if sh-ans.len() > 0 {
    align(center, block(fill: palette.accent, inset: (x: 16pt, y: 5pt), radius: 3pt, text(
      fill: white,
      weight: "bold",
      size: 12pt,
    )[BẢNG ĐÁP ÁN — ĐIỀN SỐ]))
    v(0.4em)
    align(center, table(
      columns: (auto,) + range(sh-ans.len()).map(_ => 1fr),
      stroke: 0.5pt + palette.border,
      align: center + horizon,
      table.cell(fill: palette.accent, pad(x: 8pt, y: 5pt)[#text(fill: white, weight: "bold", size: 9pt)[Câu]]),
      ..sh-ans.map(it => table.cell(fill: rgb("#e8f0fc"), pad(y: 5pt)[#text(weight: "bold")[Câu #it.num]])),
      table.cell(fill: palette.accent, pad(x: 8pt, y: 5pt)[#text(fill: white, weight: "bold", size: 9pt)[Đáp án]]),
      ..sh-ans.map(it => pad(y: 5pt)[#text(weight: "bold", fill: palette.accent)[#it.ans]]),
    ))
  }
}

// ─────────────────────────────────────────────────────────
// CÔNG CỤ TOÁN HỌC (MATH TOOLS)
// ─────────────────────────────────────────────────────────
// vect(AB) → dấu mũi tên chuẩn LaTeX \overrightarrow
#let vect(..args) = {
  let body = args.pos().map(a => if type(a) == str { math.upright(a) } else { a }).join()
  math.accent(body, math.arrow.r)
}

