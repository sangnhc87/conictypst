// Cấu hình chung cho Mũ và Logarit — Chương 2 (Toán 11)

// ─── Cấu hình dùng chung (tfrac, doc-setup, hoac) ──────────────
#import "../../modules/_shared-config.typ": *
#import "@preview/cetz:0.5.2"

#import "../../modules/book.typ": bt as _bt-orig, section as _section-orig, vd as _vd-orig
#import "../../modules/book.typ": *
#import "../../modules/exam.typ": True, exam-mode, ppgiai, resetcau, resetexamstate, exam-part
#import "../../bbt.typ": bbbt, bbt-opt, bbtv2, canvas, draw, bxd
#import "../../modules/fractals.typ": *

#let EXAM_MODE = "loigiai"  // loigiai hoặc dethi
#let EXAM_SOL_COLOR = rgb("#15803d")

#let _exam_fns = exam-mode(mode: EXAM_MODE, accent: EXAM_SOL_COLOR)
#let tn(boxed: true, ..args) = (_exam_fns.tn)(..args, boxed: boxed)
#let ds(boxed: true, ..args) = (_exam_fns.ds)(..args, boxed: boxed)
#let tln(boxed: true, ..args) = (_exam_fns.tln)(..args, boxed: boxed)
#let tl(boxed: true, ..args) = (_exam_fns.tl)(..args, boxed: boxed)
#let mcq(boxed: true, ..args) = (_exam_fns.mcq)(..args, boxed: boxed)
#let tf(boxed: true, ..args) = (_exam_fns.tf)(..args, boxed: boxed)
#let short(boxed: true, ..args) = (_exam_fns.short)(..args, boxed: boxed)

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))

// ─── Màu chủ đạo của chương: GREEN ────────────────────────────
#let c-book  = rgb("#15803d")   // Indigo — màu chính
#let c-p1    = rgb("#15803d")   // Alias

// ─── Vivid-box nội bộ (header + body) ──────────────────────────
#let _vivid-box(body, title: [], accent: c-book, fill: white) = block(
  width: 100%,
  radius: 8pt,
  clip: true,
  stroke: 0.5pt + accent.lighten(40%),
)[
  #block(width: 100%, fill: accent, inset: (x: 14pt, y: 8pt))[
    #text(fill: white, weight: "bold", size: 11pt)[#title]
  ]
  #block(width: 100%, fill: fill, inset: (x: 14pt, y: 10pt))[
    #body
  ]
]

// ─── Override màu cho các hàm chuẩn ────────────────────────────
#let phuongphap(body, title: [⚙ Phương pháp], theme-color: none, ..args) = {
  let col = if theme-color != none { theme-color } else { c-book }
  _vivid-box(body, title: title, accent: col, fill: col.lighten(93%))
}

#let ghinho(body, title: [★ Ghi nhớ], theme-color: none, ..args) = {
  let col = if theme-color != none { theme-color } else { c-book }
  _vivid-box(body, title: title, accent: col, fill: col.lighten(93%))
}

#let luuy(body, title: [▲ Lưu ý], theme-color: none, ..args) = {
  _vivid-box(body, title: title, accent: rgb("#b45309"), fill: rgb("#fffbeb"))
}

#let nhanxet(body, title: [◈ Nhận xét], theme-color: none, ..args) = {
  let col = if theme-color != none { theme-color.lighten(15%) } else { rgb("#0d9488") }
  _vivid-box(body, title: title, accent: col, fill: col.lighten(91%))
}

// ─── Step counter ────────────────────────────────────────────────
#let _step-cnt = counter("_luong-giac-step")
#let _step-palette = (
  rgb("#15803d"),   // Indigo
  rgb("#6D28D9"),   // Violet
  rgb("#0F766E"),   // Teal
  rgb("#C2410C"),   // Orange
  rgb("#0369A1"),   // Blue
)
#let resetstep() = _step-cnt.update(0)
#let reset-step() = _step-cnt.update(0)
#let step(body, accent: auto) = {
  _step-cnt.step()
  context {
    let n = _step-cnt.get().first()
    let col = if accent != auto { accent } else {
      _step-palette.at(calc.rem(n - 1, _step-palette.len()))
    }
    block(
      width: 100%,
      inset: (left: 12pt, top: 4pt, bottom: 4pt, right: 0pt),
      stroke: (left: 3pt + col),
    )[#body]
  }
}

// ─── vd / bt với màu chương ─────────────────────────────────────
#let vd(stem, theme-color: c-p1, header-fill: auto, title-fill: auto, ..args) = {
  let hf = if header-fill == auto { theme-color } else { header-fill }
  let tf = if title-fill == auto { white } else { title-fill }
  _vd-orig(stem, theme-color: theme-color, header-fill: hf, title-fill: tf, ..args)
}

#let bt(stem, theme-color: c-p1, header-fill: auto, title-fill: auto, ..args) = {
  let hf = if header-fill == auto { theme-color } else { header-fill }
  let tf = if title-fill == auto { white } else { title-fill }
  _bt-orig(stem, theme-color: theme-color, header-fill: hf, title-fill: tf, ..args)
}

// ─── Nhãn phần A/B ──────────────────────────────────────────────
#let bt-header(color) = {
  v(1.2em)
  block(
    width: 100%,
    fill: color,
    inset: (x: 16pt, y: 11pt),
    radius: 7pt,
  )[
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      stack(
        dir: ltr,
        spacing: 8pt,
        text(fill: white.transparentize(15%), size: 18pt)[◆],
        text(fill: white, weight: "bold", size: 13pt, tracking: 0.02em)[BÀI TẬP TỔNG HỢP],
      ),
      text(fill: white.transparentize(35%), size: 10pt, tracking: 0.04em)[TN · DS · TLN],
    )
  ]
  v(0.5em)
}

#let q-label(title, color) = {
  v(0.75em)
  block(width: 100%, fill: color, inset: (x: 14pt, y: 9pt), radius: 5pt)[
    #text(fill: white, weight: "bold", size: 11.5pt)[#title]
  ]
  v(0.35em)
}

#let dang(title, prefix: "Dạng", theme-color: c-book, ..args) = {
  _section-orig(title, prefix: prefix, theme-color: theme-color, ..args)
}

#let two-column-mode = if EXAM_MODE == "loigiai" { false } else { true }

#let line-pattern = tiling(size: (20cm, 22pt))[
  #place(bottom, line(length: 20cm, stroke: (paint: gray.lighten(60%), thickness: 0.25pt, dash: "dashed")))
]

#let q-wrap(q-content, height: auto, dir: "doc", lines: auto) = context {
  if two-column-mode {
    let measure-width = if dir == "ngang" { 8.1cm } else { 17.5cm }
    let size = measure(block(width: measure-width)[#q-content])
    let q-height = size.height

    let rect-h = if height != auto {
      height
    } else if type(lines) == int {
      lines * 22pt
    } else {
      calc.max(88pt, q-height - 12pt)
    }

    if dir == "ngang" {
      block(breakable: false, width: 100%)[
        #table(
          columns: (1fr, 1.15fr),
          align: (left + top, left + top),
          stroke: 0.4pt + gray,
          inset: 8pt,
          [#q-content],
          [
            #text(size: 8pt, fill: gray.lighten(20%))[_Bài làm / Nháp:_]
            #v(0.3em)
            #rect(width: 100%, height: rect-h, stroke: none, fill: line-pattern)
          ]
        )
      ]
    } else {
      block(breakable: false, width: 100%)[
        #table(
          columns: (1fr,),
          align: (left + top,),
          stroke: 0.4pt + gray,
          inset: 8pt,
          [#q-content],
          [
            #text(size: 8pt, fill: gray.lighten(20%))[_Bài làm / Nháp:_]
            #v(0.3em)
            #rect(width: 100%, height: rect-h, stroke: none, fill: line-pattern)
          ]
        )
      ]
    }
    v(0.3em)
  } else {
    q-content
  }
}



