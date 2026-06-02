// Cấu hình chung cho Hình học Vectơ 3D — Chương 2

#import "../../modules/book.typ": bt as _bt-orig, section as _section-orig, vd as _vd-orig
#import "../../modules/book.typ": *
#import "../../modules/exam.typ": True, exam-mode, ppgiai, resetcau, resetexamstate, exam-part, vect, print-answer-key
#let vec(..args) = vect(..args)
#import "../../bbt.typ": bbbt, bbt-opt, bbtv2, canvas, draw, bxd

#let EXAM_MODE = "loigiai"
#let EXAM_SOL_COLOR = rgb("#065f46")

#let _exam_fns = exam-mode(mode: EXAM_MODE, accent: EXAM_SOL_COLOR)
#let tn = _exam_fns.tn
#let ds = _exam_fns.ds
#let tln = _exam_fns.tln
#let tl = _exam_fns.tl
#let mcq = _exam_fns.mcq
#let tf = _exam_fns.tf
#let short = _exam_fns.short

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))

#let c-book = rgb("#065f46")
#let c-p1 = rgb("#065f46")

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

#let _step-cnt = counter("_vecto-3d-step")
#let _step-palette = (
  rgb("#065f46"),
  rgb("#0d9488"),
  rgb("#0f766e"),
  rgb("#115e59"),
  rgb("#134e4a"),
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
          [
            #q-content
          ],
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
          [
            #q-content
          ],
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

// Custom styling overrides for solcolor mode (Vibrant Royal Blue theme)
#if EXAM_MODE == "solcolor" {
  // 1. Highlight correct options (MCQ text) with modern royal blue instead of crimson
  show text.where(fill: rgb("#cc2200")): set text(fill: rgb("#1d4ed8"))
  
  // 2. Highlight card fill/stroke (MCQ image card) with light blue fill and royal blue stroke
  show block.where(fill: rgb("#fff5f5")): set block(
    fill: rgb("#eff6ff"),
    stroke: 1.8pt + rgb("#1d4ed8"),
  )
  
  // 3. Highlight correct checkmarks in True/False statements with royal blue instead of green
  show text.where(fill: rgb("#1a7a2e")): set text(fill: rgb("#1d4ed8"))
  
  // 4. Highlight True/False statement box fills with light blue
  show box.where(fill: rgb("#1a7a2e").lighten(80%)): set box(fill: rgb("#eff6ff"))
  
  // 5. Highlight short answer text and boxes with light blue and royal blue border
  show box.where(fill: rgb("#1a7a2e").lighten(85%)): set box(
    fill: rgb("#eff6ff"),
    stroke: 1.2pt + rgb("#1d4ed8"),
  )
}
