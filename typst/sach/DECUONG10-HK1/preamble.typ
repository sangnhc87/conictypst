// ═══════════════════════════════════════════════════════════════════
//  PREAMBLE — ĐỀ CƯƠNG TOÁN 10 HỌC KỲ I (BẢN CHUẨN COMPACT K10)
//  Chứa: màu sắc, bộ đếm, template, các hộp nội dung và bộ bọc compact
//  Import bằng: #import "../preamble.typ": *
// ═══════════════════════════════════════════════════════════════════

#import "/public/hdsd/typst/sang-math-geom.typ": *
#import "_config.typ": *
#import "../../modules/book.typ": stexgv-book, chapter, topic, vd, bt, definition
#import "../../sang-exam.typ" as se
#import "../../bbt.typ": bbbt, bbtv2, bxd, canvas, draw

#let se-mode = se.exam-mode(mode: mode, accent: theme-color)
#let mcq = se-mode.mcq.with(lines: if mode == "loigiai" { 0 } else { default-lines })
#let tf = se-mode.tf.with(lines: if mode == "loigiai" { 0 } else { default-lines })
#let short = se-mode.short.with(lines: if mode == "loigiai" { 0 } else { default-lines })
#let step = se.step
#let reset-step = se.reset-step
#let resetstep = se.reset-step

#let two-column-mode = if mode == "loigiai" { false } else { true }
#let compact-layout = sys.inputs.at("layout", default: "legacy") == "compact"
#let sect = math.inter
#let mid = sym.bar.v

#let tfrac(num, den) = {
  show math.frac: f => f
  scale(x: 72%, y: 72%, origin: center + horizon, reflow: true, math.inline(math.frac(num, den)))
}

#let nhap(n) = se.draw-lines(n)

#let hoac(..args) = math.cases(
  delim: "[",
  ..args.named(),
  ..args.pos().map(math.display)
)

#let heva(..args) = math.cases(
  delim: "{",
  ..args.named(),
  ..args.pos().map(math.display)
)

#let line-pattern = tiling(size: (20cm, if compact-layout { 16pt } else { 22pt }))[
  #place(bottom, line(length: 20cm, stroke: (paint: gray.darken(90%), thickness: 0.25pt, dash: "dashed")))
]

#let q-wrap(q-content, height: auto, dir: "doc", lines: auto, kind: "short") = context {
  if two-column-mode {
    // Bản in compact: giữ chỗ làm bài theo từng dạng câu.
    let effective-lines = if compact-layout {
      if lines == 0 { 0 }
      else if kind == "mcq" {
        if type(lines) == int { calc.min(lines, 1) } else { 1 }
      } else if kind == "tf" {
        if type(lines) == int { calc.min(lines, 2) } else { 2 }
      } else {
        if type(lines) == int { calc.min(lines, 3) } else { 2 }
      }
    } else {
      lines
    }

    if effective-lines == 0 {
      block(breakable: true, width: 100%)[
        #table(
          columns: (1fr,),
          align: (left + top,),
          stroke: .8pt + blue,
          inset: (x: 8pt, y: if compact-layout { 6pt } else { 8pt }),
          [
            #q-content
          ]
        )
      ]
      v(if compact-layout { -0.28em } else { 0.3em })
      return
    }

    let measure-width = if dir == "ngang" { 8.1cm } else { 17.5cm }
    let size = measure(block(width: measure-width)[#q-content])
    let q-height = size.height
    
    let requested-h = if height != auto {
      height
    } else if type(effective-lines) == int {
      effective-lines * (if compact-layout { 16pt } else { 22pt })
    } else {
      if compact-layout { 48pt } else { calc.max(88pt, q-height - 12pt) }
    }

    let rect-h = requested-h
    
    if dir == "ngang" {
      block(breakable: true, width: 100%)[
        #table(
          columns: (1fr, 1.15fr),
          align: (left + top, left + top),
          stroke: .8pt + blue,
          inset: (x: 8pt, y: if compact-layout { 6pt } else { 8pt }),
          [
            #q-content
          ],
          table.cell(fill: if compact-layout { line-pattern } else { none })[
            #box(fill: white, inset: (right: 4pt, bottom: 2pt))[
              #text(size: 8pt, fill: gray.lighten(10%))[_Bài làm:_]
            ]
            #v(0.3em)
            #rect(
              width: 100%,
              height: rect-h,
              stroke: none,
              fill: if compact-layout { none } else { line-pattern },
            )
          ]
        )
      ]
    } else {
      block(breakable: true, width: 100%)[
        #table(
          columns: (1fr,),
          align: (left + top,), 
          stroke: .8pt + blue,
          inset: (x: 8pt, y: if compact-layout { 6pt } else { 8pt }),
          [
            #q-content
          ],
          [
            #text(size: 8pt, fill: gray.lighten(10%))[_Bài làm:_]
            #v(0.3em)
            #rect(width: 100%, height: rect-h, stroke: none, fill: line-pattern)
          ]
        )
      ]
    }
    v(if compact-layout { -0.28em } else { 0.3em })
  } else {
    q-content
  }
}

#let tn(dir: "ngang", lines: auto, ..args) = q-wrap(dir: dir, lines: lines, kind: "mcq", mcq(..args, lines: 0))
#let ds(dir: "doc", lines: auto, ..args) = q-wrap(dir: dir, lines: lines, kind: "tf", tf(..args, lines: 0))
#let tln(dir: "ngang", lines: auto, ..args) = q-wrap(dir: dir, lines: lines, kind: "short", short(..args, lines: 0))

#let my-bxd(..args) = {
  let w1 = args.named().at("w1", default: if two-column-mode { 0.9 } else { 1.4 })
  let w2 = args.named().at("w2", default: if two-column-mode { 5.5 } else { 7.8 })
  bxd(..args.named(), w1: w1, w2: w2, ..args.pos())
}

#let my-bbbt(..args) = {
  let x-vals = args.named().at("x-vals", default: ())
  let num-cols = x-vals.len()
  let default-w2 = if two-column-mode {
    if num-cols > 3 { 6.8 } else { 4.8 }
  } else {
    if num-cols > 3 { 10.5 } else { 7.2 }
  }
  let w1 = args.named().at("w1", default: if two-column-mode { 0.8 } else { 1.2 })
  let w2 = args.named().at("w2", default: default-w2)
  let named = args.named()
  named.insert("w1", w1)
  named.insert("w2", w2)
  bbbt(..named, ..args.pos())
}

#let palette = se.palette
#let classic = se.classic
#let True = se.True
#let ppgiai = se.ppgiai
#let luuy = se.luuy
#let meo = se.meo
#let draw-lines = se.draw-lines
#let het = se.het
#let exam-part = se.exam-part
#let thpt-school-exam = se.thpt-school-exam
#let print-answer-key = se.print-answer-key
#let vect = se.vect
#let resetexamstate = se.resetexamstate
#let resetcau = se.resetcau

// ── Bảng màu chủ đề 5 Chương K10 ─────────────────────────────────
#let C1   = rgb("#1565C0")   // Chương 1: Mệnh đề và tập hợp — Xanh hoàng gia
#let C2   = rgb("#00695C")   // Chương 2: BPT và hệ BPT bậc nhất hai ẩn — Xanh ngọc
#let C3   = rgb("#C2185B")   // Chương 3: Hệ thức lượng trong tam giác — Hồng cánh sen
#let C4   = rgb("#6A1B9A")   // Chương 4: Vectơ — Tím hoàng gia
#let C5   = rgb("#E65100")   // Chương 5: Thống kê không ghép nhóm — Cam đất / Hổ phách
#let gold = rgb("#F57F17")   // Nhấn / công thức
#let ok   = rgb("#2E7D32")   // Xanh lá (đúng)
#let warn = rgb("#E65100")   // Cam (lưu ý)

// ── Bộ đếm toàn cục ──────────────────────────────────────────────
#let _chuong-cnt = counter("stx-chap")
#let _bai-cnt    = counter("dc-bai")
#let _dang-cnt   = counter("stx-topic")
#let _vd-cnt     = counter("stx-vd")
#let _bt-cnt     = counter("stx-bt")

#let dong-ke(n: 5) = draw-lines(n)

// ═══════════════════════════════════════════════════════════════════
//  TEMPLATE TRANG ĐỀ CƯƠNG TOÁN 10
// ═══════════════════════════════════════════════════════════════════
#let de-cuong(
  truong:    "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  to-bomon:  "TỔ TOÁN",
  tieu-de:   "TÀI LIỆU HỌC TẬP HỌC KỲ I",
  mon:       "MÔN: TOÁN — LỚP 10",
  nam-hoc:   "NĂM HỌC 2026–2027",
  body
) = {
  set document(title: tieu-de, author: to-bomon)
  set page(
    paper: "a4",
    flipped: landscape,
    margin: if compact-layout { (top: 1.0cm, bottom: 1.6cm, x: 0.8cm) } else { (top: 1.2cm, bottom: 1.8cm, x: 1cm) },
    header: context {
      if counter(page).get().first() <= 2 { return none }
      set text(size: 8.5pt, fill: rgb("#666"))
      grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        text(style: "italic")[#tieu-de — #mon],
        text(style: "italic")[Trang #counter(page).display()]
      )
      v(-3pt)
      line(length: 100%, stroke: 0.4pt + rgb("#bbb"))
    },
    footer: context {
      if counter(page).get().first() <= 2 { return none }
      align(bottom)[
        #pad(bottom: if compact-layout { 0.8cm } else { 0.9cm })[
          #line(length: 100%, stroke: 0.3pt + rgb("#ddd"))
          #v(2pt)
          #align(center, text(size: 8pt, fill: rgb("#777"))[
            #if upper(truong) != upper(to-bomon) [
              #truong  ·  #to-bomon  ·  #nam-hoc
            ] else [
              #to-bomon  ·  #nam-hoc
            ]
          ])
        ]
      ]
    }
  )
  set text(font: "Libertinus Serif", size: if compact-layout { 11pt } else { 12pt }, lang: "vi")
  set par(justify: true, leading: 0.75em)
  set enum(numbering: "1.")
  set list(marker: [–])

  // ── Đánh số Heading chuẩn của Typst ──
  set heading(numbering: (..nums) => {
    let pos = nums.pos()
    if pos.len() == 1 {
      "Chương " + str(pos.first()) + "."
    } else if pos.len() == 2 {
      "Bài " + str(pos.last()) + "."
    } else {
      none
    }
  })

  // ── Heading styles ──
  show heading.where(level: 1): it => block(height: 0pt, above: 0pt, below: 0pt)[#hide(it)]
  show heading.where(level: 2): it => {
    let chap = counter(heading).at(it.location()).first()
    let mau = if chap == 1 { C1 } else if chap == 2 { C2 } else if chap == 3 { C3 } else if chap == 4 { C4 } else if chap == 5 { C5 } else { theme-color }
    v(if compact-layout { 0.8em } else { 1.5em })
    block(width: 100%, breakable: false)[
      #grid(
        columns: (auto, 1fr),
        column-gutter: 10pt,
        align: horizon,
        rect(
          fill: mau,
          radius: 4pt,
          inset: (x: 10pt, y: 6pt),
          stroke: none,
          [
            #set text(size: 11pt, weight: "bold", fill: white)
            #if it.numbering != none {
              let nums = counter(heading).at(it.location())
              let lesson-num = if nums.len() >= 2 { nums.at(1) } else { 1 }
              [BÀI #lesson-num]
            } else {
              [BÀI]
            }
          ]
        ),
        text(size: 13.5pt, weight: "bold", fill: mau.darken(15%))[#it.body]
      )
      #v(0.3em)
      #rect(width: 100%, height: 1.5pt, fill: mau.lighten(50%), stroke: none)
    ]
    v(if compact-layout { 0.4em } else { 0.8em })
  }
  show heading.where(level: 3): it => block(above: 1.2em, below: 0.5em)[
    #text(size: 12pt, weight: "bold", fill: rgb("#2c3e50"))[#it.body]
  ]

  // ════ TRANG BÌA K10 ════════════════════════════════════════════
  page(margin: 0pt, paper: "a4", background: [
    #place(top + right)[
      #polygon(
        fill: gradient.linear(rgb("003087").transparentize(20%), rgb("003087").transparentize(50%), angle: 210deg),
        (100%, 0%), (100%, 60%), (40%, 0%)
      )
    ]
    #place(bottom + left)[
      #polygon(
        fill: gradient.linear(rgb("c8102e").transparentize(20%), rgb("ff4d4d").transparentize(40%), angle: 45deg),
        (0%, 100%), (0%, 40%), (60%, 100%)
      )
    ]
    #place(center + horizon)[
      #circle(radius: 20cm, stroke: 2pt + rgb("003087").transparentize(90%))
    ]
    #place(center + horizon)[
      #circle(radius: 15cm, stroke: 1pt + rgb("c8102e").transparentize(90%))
    ]
  ])[
    #box(width: 100%, height: 100%, inset: 2.5cm)[
      #v(1cm)
      #if upper(truong) != upper(to-bomon) [
        #text(size: 16pt, weight: "bold", fill: rgb("003087"), tracking: 2pt)[#upper(truong)]
        #v(0.3cm)
        #text(size: 13pt, fill: rgb("003087").lighten(20%), tracking: 1pt, weight: "bold")[#upper(to-bomon)]
      ] else [
        #text(size: 18pt, weight: "bold", fill: rgb("003087"), tracking: 2pt)[#upper(to-bomon)]
        #v(0.3cm)
        #text(size: 12pt, fill: rgb("003087").lighten(20%), tracking: 1pt, weight: "bold")[CHIA SẺ CHUYÊN MÔN TOÁN HỌC]
      ]
      
      #v(5.5cm)
      
      #rect(width: 80pt, height: 6pt, fill: rgb("c8102e"), radius: 3pt)
      
      #v(1cm)
      #text(size: if tieu-de.len() > 30 { 32pt } else { 42pt }, weight: "black", fill: rgb("003087"), font: "Libertinus Serif")[#upper(tieu-de)]
      
      #v(1.2cm)
      #block(
        fill: gradient.linear(rgb("c8102e"), rgb("ff4d4d")),
        inset: (x: 20pt, y: 12pt), 
        radius: 8pt,
        text(size: 18pt, weight: "bold", fill: white, tracking: 3pt)[#upper(mon)]
      )
      
      #v(1fr)
      
      #grid(
        columns: (auto, 1fr),
        align: (left, right),
        text(size: 12pt, weight: "bold", fill: rgb("003087"))[
          #if nam-hoc.starts-with("NĂM HỌC") [#upper(nam-hoc)] else [NĂM HỌC #upper(nam-hoc)]
        ],
        text(size: 12pt, fill: rgb("666666"), style: "italic")[Tài liệu lưu hành nội bộ]
      )
      #v(0.5cm)
      #align(center)[
        #if upper(truong) != upper(to-bomon) [
          #text(size: 10pt, weight: "bold", fill: rgb("003087"), tracking: 1.5pt)[TRƯỜNG ĐẠT CHUẨN QUỐC GIA]
        ] else [
          #text(size: 10pt, weight: "bold", fill: rgb("003087"), tracking: 1.5pt)[CHIA SẺ CHUYÊN MÔN DÀNH TẶNG ĐỒNG NGHIỆP]
        ]
      ]
    ]
  ]

  // ════ MỤC LỤC ══════════════════════════════════════════════════
  pagebreak()
  v(1em)
  align(center)[
    #block(
      fill: C1.lighten(92%), stroke: 1pt + C1,
      inset: (x: 20pt, y: 10pt), radius: 6pt
    )[
      #text(size: 16pt, weight: "bold", fill: C1)[MỤC LỤC]
    ]
  ]
  v(1.2em)
  
  show outline.entry: it => {
    let depth = it.level
    let num-prefix = if it.element.numbering != none {
      let nums = counter(heading).at(it.element.location())
      numbering(it.element.numbering, ..nums)
      h(0.3em)
    } else {
      none
    }
    
    if depth == 1 {
      v(1.2em)
      block(width: 100%, fill: rgb("#f1f5f9"), inset: (x: 12pt, y: 8pt), radius: 4pt)[
        #text(weight: "bold", size: 12pt, fill: rgb("003087"))[
          #num-prefix
          #it.body()
          #box(width: 1fr, h(10pt))
          #it.page()
        ]
      ]
    } else if depth == 2 {
      pad(left: 1.5em)[
        #v(0.2em)
        #text(size: 11pt, fill: rgb("#1e293b"))[
          #num-prefix
          #it.body()
          #box(width: 1fr, repeat([. ]))
          #it.page()
        ]
      ]
    } else {
      pad(left: 3em)[
        #text(size: 10pt, fill: rgb("#475569"))[
          #num-prefix
          #it.body()
          #box(width: 1fr, repeat([. ]))
          #it.page()
        ]
      ]
    }
  }

  outline(title: none, depth: 3, indent: 1.5em)
  pagebreak()

  // ════ NỘI DUNG ═════════════════════════════════════════════════
  body
}

// ═══════════════════════════════════════════════════════════════════
//  CÁC THÀNH PHẦN NỘI DUNG (CHƯƠNG, BÀI, DẠNG, TỰ LUẬN, LÝ THUYẾT)
// ═══════════════════════════════════════════════════════════════════

#let chuong(ten, mau: C1) = {
  pagebreak(weak: true)
  v(0.5em)

  heading(level: 1, outlined: true)[#ten]
  
  _dang-cnt.update(0)
  _vd-cnt.update(0)
  _bt-cnt.update(0)

  context {
    let chap-num = counter(heading).get().first()
    block(width: 100%, radius: 10pt, clip: true)[
      #rect(width: 100%,
        fill: gradient.linear(mau, mau.lighten(28%), angle: 0deg),
        inset: (x: 22pt, y: 18pt)
      )[
        #grid(columns: (auto, 1fr), column-gutter: 18pt, align: center + horizon,
          box(width: 56pt, height: 56pt, radius: 50%,
            fill: white.transparentize(80%),
            stroke: 2pt + white.transparentize(30%)
          )[
            #align(center + horizon)[
              #text(size: 8pt, weight: "bold", fill: white)[CHƯƠNG]
              #linebreak()
              #text(size: 24pt, weight: "bold", fill: white)[#chap-num]
            ]
          ],
          align(left)[
            #text(size: 11pt, weight: "bold", fill: white.transparentize(25%))[
              Chương #chap-num
            ]
            #linebreak()
            #text(size: 18pt, weight: "bold", fill: white)[#ten]
          ]
        )
      ]
    ]
  }
  v(1.5em)
}

#let bai(ten, mau: C1) = {
  _dang-cnt.update(0)
  _vd-cnt.update(0)
  _bt-cnt.update(0)
  counter("stx-lesson").update(0)
  
  heading(level: 2, outlined: true)[#ten]
}

#let muc(ten) = {
  v(0.8em)
  heading(level: 3, outlined: false)[#ten]
  v(0.3em)
}

#let dang(ten, mau: C1) = {
  _dang-cnt.step()
  context {
    let d = _dang-cnt.get().first()
    v(0.6em)
    block(
      width: 100%,
      fill: mau,
      inset: (x: 12pt, y: 7pt),
      radius: 4pt,
    )[
      #align(center)[
        #text(weight: "bold", size: 11.5pt, fill: white)[Dạng #d: #ten]
      ]
    ]
    v(0.4em)
  }
}

#let phuong-phap(body, mau: C1) = {
  block(width: 100%, fill: mau.lighten(95%),
    stroke: 0.8pt + mau.lighten(30%),
    inset: (x: 12pt, y: 9pt), radius: 4pt,
  )[
    #text(weight: "bold", fill: mau.darken(15%))[Phương pháp giải:]
    #v(0.3em)
    #body
  ]
  v(0.4em)
}

#let ly-thuyet(tieu-de: "LÝ THUYẾT CẦN NHỚ", body, mau: C1) = {
  block(width: 100%, fill: rgb("#f8fafc"),
    stroke: (left: 4pt + mau, rest: 0.5pt + rgb("#cbd5e1")),
    inset: (x: 12pt, y: 9pt), radius: (right: 4pt),
  )[
    #text(weight: "bold", size: 11pt, fill: mau.darken(20%))[#tieu-de]
    #v(0.3em)
    #body
  ]
  v(0.5em)
}

#let bai-tap-tu-luan(body, mau: C1) = {
  v(0.5em)
  block(
    width: 100%,
    stroke: 0.8pt + mau.lighten(30%),
    fill: rgb("#f8fafc"),
    inset: (x: 12pt, y: 10pt),
    radius: 6pt,
  )[
    #align(center)[
      #block(
        fill: mau,
        inset: (x: 16pt, y: 5pt),
        radius: 3pt,
      )[
        #text(weight: "bold", size: 11pt, fill: white)[BÀI TẬP TỰ LUẬN]
      ]
    ]
    #v(0.4em)
    #body
  ]
  v(0.5em)
}

#let bai-tap-trac-nghiem(mau: C1) = {
  v(0.8em)
  align(center)[
    #block(
      fill: mau.lighten(92%),
      stroke: 1.2pt + mau,
      inset: (x: 20pt, y: 6pt),
      radius: 4pt,
    )[
      #text(weight: "bold", size: 11.5pt, fill: mau.darken(15%))[BÀI TẬP TRẮC NGHIỆM]
    ]
  ]
  v(0.5em)
}

// Bọc câu tự luận với hiển thị rõ ràng, chuyên nghiệp
#let bt-item(num, stem, loigiai: none) = {
  block(width: 100%, breakable: true)[
    #set enum(numbering: "a)")
    #text(weight: "bold", fill: C1)[Bài tập #num:] #stem
    #if mode == "loigiai" and loigiai != none [
      #v(0.25em)
      #block(fill: rgb("#f0fdf4"), stroke: 0.5pt + rgb("#86efac"), inset: (x: 8pt, y: 6pt), radius: 3pt)[
        #text(weight: "bold", fill: rgb("#166534"), size: 10pt)[Lời giải:]
        #v(0.15em)
        #loigiai
      ]
    ]
  ]
  v(0.4em)
}
