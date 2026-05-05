// =========================================================
// SANG-BEAMER.TYP v4.0 — Slide trình chiếu Premium
// ✅ Auto-counter: không cần nhập num tay
// ✅ Hỗ trợ offset riêng cho từng loại câu (mcq/tf/tln)
// =========================================================

#import "@preview/touying:0.7.3": *
#import themes.metropolis: *

#import "sang-exam.typ": True, bode, classic, dl, dn, draw-lines, luuy, lythuyet, meo, note, palette, ppgiai, tc, vect

// ── Màu sắc sống động ──────────────────────────────────
#let bm-colors = (
  bg: rgb("#0f172a"), // Nền slide xanh đậm
  fg: white,
  accent: rgb("#3b82f6"), // Xanh dương sáng
  correct: rgb("#22c55e"), // Xanh lá tươi
  wrong: rgb("#ef4444"), // Đỏ
  card: rgb("#1e293b"), // Card tối
  card-hi: rgb("#172554"), // Card hover
  muted: rgb("#94a3b8"),
  gold: rgb("#f59e0b"), // Vàng accent
)

// ── Auto-counter cho beamer ──────────────────────────────
// Mỗi loại câu (tn, tf, tln) có counter riêng.
// Có thể reset về bất kỳ số nào.
#let _bm-q-cnt = counter("bm-q")   // Toàn cục — tương tự exam engine

#let _resolve-loigiai(loigiai, args) = {
  if loigiai != none { loigiai } else { args.named().at("solution", default: none) }
}

// Đặt lại counter beamer (dùng đầu file slide)
// Ví dụ: #bm-resetcau() hoặc #bm-setcau(13)
#let bm-resetcau(start: 1) = [
  #_bm-q-cnt.update(if start > 0 { start - 1 } else { 0 })
]
#let bm-setcau(start) = bm-resetcau(start: start)

// ── Beamer Theme ────────────────────────────────────────
#let sang-beamer-theme(
  body,
  title: "ĐỀ THI THPT QUỐC GIA",
  subtitle: "TOÁN - LỚP 12",
  author: "GV Nguyễn Văn Sang",
  institution: "Sở GD&ĐT",
  date: datetime.today(),
  accent: bm-colors.accent,
  aspect-ratio: "16-9",
  code: "",
  total-q: 22,
) = {
  show: metropolis-theme.with(
    aspect-ratio: aspect-ratio,
    config-info(
      title: [#title],
      subtitle: [#subtitle #if code != "" [— Mã đề: #code]],
      author: [#author],
      date: date,
      institution: [#institution],
    ),
    config-common(slide-fn: slide),
    config-colors(
      primary: accent,
      primary-light: accent.lighten(50%),
      secondary: bm-colors.gold,
      neutral-lightest: bm-colors.bg,
      neutral-darkest: white,
    ),
    config-page(
      footer: context {
        set text(size: 7pt, fill: bm-colors.muted)
        v(2pt)
        grid(
          columns: (auto, 1fr, auto),
          align: (left + horizon, center + horizon, right + horizon),
          pad(left: 8pt)[#author — #institution],
          // ── Nút nhảy câu tròn ──
          {
            let dots = ()
            for i in range(1, total-q + 1) {
              let lbl = label("bm-q-" + str(i))
              let has = query(lbl).len() > 0
              if has {
                dots.push(
                  link(lbl, box(
                    width: 13pt,
                    height: 13pt,
                    radius: 50%,
                    fill: accent.lighten(70%),
                    stroke: 0.5pt + accent,
                    align(center + horizon)[
                      #text(size: 5.5pt, weight: "bold", fill: accent)[#i]
                    ],
                  )),
                )
              } else {
                dots.push(
                  box(
                    width: 10pt,
                    height: 10pt,
                    radius: 50%,
                    fill: bm-colors.bg.lighten(20%),
                    stroke: 0.4pt + bm-colors.muted.lighten(40%),
                  ),
                )
              }
            }
            stack(dir: ltr, spacing: 3pt, ..dots)
          },
          pad(right: 8pt)[#counter(page).display() / #counter(page).final().first()],
        )
      },
    ),
  )

  set text(font: "Libertinus Serif", size: 18pt, fill: white, lang: "vi")
  show math.equation.where(block: false): math.display
  show math.equation: set text(fill: bm-colors.gold)

  title-slide()
  body
}

// ── exam-part ────────────────────────────────────────────
// Tạo slide section riêng thay vì dùng metropolis heading
#let exam-part(title, count: auto, reset-counter: true, accent: bm-colors.accent) = {
  slide(title: none)[
    #align(center + horizon)[
      #v(-1em)
      #block(
        width: 78%,
        stroke: (top: 2.5pt + accent, bottom: 2.5pt + accent),
        inset: (x: 0pt, y: 20pt),
      )[
        #align(center)[
          #text(size: 11pt, fill: accent, weight: "bold", tracking: 2pt)[#upper("Chương trình")]
          #v(0.5em)
          #text(size: 22pt, weight: "bold", fill: white)[#title]
        ]
      ]
    ]
  ]
}

// ── Nội hàm lấy số câu tiếp theo ────────────────────────
// num: auto  → tự tăng counter
// num: 5     → dùng đúng số 5 và đặt counter = 5
#let _bm-next-num(num) = context {
  if num == auto {
    _bm-q-cnt.step()
    _bm-q-cnt.get().first()
  } else {
    _bm-q-cnt.update(num)
    num
  }
}

// ── MCQ ──────────────────────────────────────────────────
#let mcq(
  stem,
  options,
  correct: (),
  loigiai: none,
  mode: "loigiai",
  accent: bm-colors.accent,
  fig: none,
  fig-pos: "right",
  fig-width: 40%,
  cols: 0,
  lines: 0,
  num: auto, // ← auto = tự đếm
  prefix: "Câu",
  card-fill: bm-colors.card,
  card-stroke: auto,
  ..args,
) = {
  let loigiai = _resolve-loigiai(loigiai, args)
  let card-stroke = if card-stroke == auto { 1.2pt + accent.lighten(30%) } else { card-stroke }
  let labels = ("A", "B", "C", "D", "E", "F")

  // ── Lấy số câu (hiển thị an toàn) ──
  let q-num-display = if num == auto {
    _bm-q-cnt.step()
    context { _bm-q-cnt.display() }
  } else {
    _bm-q-cnt.update(num)
    str(num)
  }

  let ai = -1
  let idx = 0
  for opt in options {
    let ok = if type(opt) == dictionary { opt.at("correct", default: false) } else { correct.contains(idx + 1) }
    if ok { ai = idx }
    idx += 1
  }
  let opt-texts = options.map(o => if type(o) == dictionary { o.body } else { o })
  let opt-oks = options
    .enumerate()
    .map(((i, o)) => if type(o) == dictionary { o.at("correct", default: false) } else { correct.contains(i + 1) })

  // SLIDE 1: Câu hỏi
  slide(title: none)[
    #v(-0.5em)
    #grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      align: (left + top, left + top),
      box(fill: accent, inset: (x: 10pt, y: 6pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 16pt)[#prefix #q-num-display]
      ],
      text(size: 17pt, fill: white)[#stem],
    )

    #if fig != none {
      v(0.3em)
      align(center, block(width: fig-width)[#fig])
    }

    #v(0.5em)
    #grid(
      columns: (1fr, 1fr), row-gutter: 10pt, column-gutter: 12pt,
      ..opt-texts
        .enumerate()
        .map(((i, t)) => {
          box(width: 100%, inset: (x: 0pt, y: 0pt), radius: 8pt, fill: card-fill, stroke: card-stroke)[
            #grid(columns: (auto, 1fr), column-gutter: 0pt)[
              #box(fill: accent, inset: (x: 11pt, y: 10pt), radius: (top-left: 7pt, bottom-left: 7pt))[
                #text(weight: "bold", fill: white, size: 16pt)[#labels.at(i).]
              ]
            ][
              #pad(x: 12pt, y: 10pt)[
                #text(size: 15pt, fill: white)[#t]
              ]
            ]
          ]
        })
    )
  ]

  // SLIDE 2: Đáp án
  if mode == "loigiai" and (ai >= 0 or loigiai != none) {
    slide(title: none)[
      #v(-0.5em)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 10pt,
        align: (left + horizon, left + horizon),
        box(fill: bm-colors.correct, inset: (x: 10pt, y: 6pt), radius: 4pt)[
          #text(weight: "bold", fill: white, size: 16pt)[#prefix #q-num-display — ĐÁP ÁN]
        ],
        [],
      )

      #v(0.4em)
      #grid(
        columns: (1fr, 1fr), row-gutter: 10pt, column-gutter: 12pt,
        ..opt-texts
          .enumerate()
          .map(((i, t)) => {
            let ok = opt-oks.at(i)
            let bg = if ok { bm-colors.correct.darken(55%) } else { card-fill }
            let brd = if ok { 2pt + bm-colors.correct } else { 1pt + accent.lighten(20%) }
            let mark = if ok { [  ✓] } else { [] }
            let txt-col = if ok { white } else { white.darken(10%) }
            let lbl-bg = if ok { bm-colors.correct } else { accent }
            box(width: 100%, inset: (x: 0pt, y: 0pt), radius: 8pt, fill: bg, stroke: brd)[
              #grid(columns: (auto, 1fr), column-gutter: 0pt)[
                #box(fill: lbl-bg, inset: (x: 11pt, y: 10pt), radius: (top-left: 7pt, bottom-left: 7pt))[
                  #text(weight: "bold", fill: white, size: 16pt)[#labels.at(i).#mark]
                ]
              ][
                #pad(x: 12pt, y: 10pt)[
                  #text(size: 15pt, fill: txt-col)[#t]
                ]
              ]
            ]
          })
      )

      #if loigiai != none {
        v(0.5em)
        block(
          width: 100%,
          fill: rgb("#0c1a3a"),
          stroke: (left: 3pt + bm-colors.gold),
          inset: (x: 14pt, y: 10pt),
          radius: (right: 6pt),
        )[
          #text(weight: "bold", fill: bm-colors.gold, size: 14pt)[📝 Lời giải]
          #v(0.3em)
          #set text(size: 13pt, fill: rgb("#cbd5e1"))
          #loigiai
        ]
      }
    ]
  }
}

// ── TF ───────────────────────────────────────────────────
#let tf(
  stem,
  statements,
  loigiai: none,
  mode: "loigiai",
  accent: bm-colors.accent,
  fig: none,
  fig-pos: "right",
  fig-width: 30%,
  lines: 0,
  num: auto, // ← auto = tự đếm
  prefix: "Câu",
  ..args,
) = {
  let loigiai = _resolve-loigiai(loigiai, args)
  let alpha = ("a", "b", "c", "d", "e", "f")

  // ── Lấy số câu (hiển thị an toàn) ──
  let q-num-display = if num == auto {
    _bm-q-cnt.step()
    context { _bm-q-cnt.display() }
  } else {
    _bm-q-cnt.update(num)
    str(num)
  }

  slide(title: none)[
    #v(-0.5em)
    #box(fill: accent, inset: (x: 10pt, y: 6pt), radius: 4pt)[
      #text(weight: "bold", fill: white, size: 16pt)[#prefix #q-num-display — Đúng/Sai]
    ]
    #v(0.3em)
    #text(size: 15pt, fill: white)[#stem]
    #if fig != none {
      v(0.3em)
      align(center, fig)
    }

    #v(0.3em)
    #table(
      columns: (1fr, auto, auto),
      stroke: 0.5pt + rgb("#1e3a5f"),
      align: (left + horizon, center + horizon, center + horizon),
      table.cell(fill: accent, pad(x: 10pt, y: 7pt)[#text(fill: white, weight: "bold", size: 14pt)[Phát biểu]]),
      table.cell(fill: accent, pad(x: 10pt, y: 7pt)[#text(fill: white, weight: "bold", size: 14pt)[Đ]]),
      table.cell(fill: accent, pad(x: 10pt, y: 7pt)[#text(fill: white, weight: "bold", size: 14pt)[S]]),
      ..statements
        .enumerate()
        .map(((i, s)) => {
          let txt = if type(s) == dictionary { s.body } else { s }
          let row-bg = if calc.odd(i) { rgb("#1a2744") } else { bm-colors.card }
          (
            table.cell(fill: row-bg, pad(x: 10pt, y: 7pt)[#text(
                weight: "bold",
                fill: accent,
                size: 13pt,
              )[#alpha.at(i))] #h(5pt) #text(size: 13pt, fill: white)[#txt]]),
            table.cell(fill: row-bg, align(center)[#box(
              width: 1.8em,
              height: 1.8em,
              stroke: 0.6pt + accent.lighten(40%),
              radius: 3pt,
              fill: bm-colors.bg,
            )]),
            table.cell(fill: row-bg, align(center)[#box(
              width: 1.8em,
              height: 1.8em,
              stroke: 0.6pt + accent.lighten(40%),
              radius: 3pt,
              fill: bm-colors.bg,
            )]),
          )
        })
        .flatten(),
    )
  ]

  if mode == "loigiai" {
    slide(title: none)[
      #v(-0.5em)
      #box(fill: bm-colors.correct, inset: (x: 10pt, y: 6pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 16pt)[#prefix #q-num-display — ĐÁP ÁN]
      ]
      #v(0.3em)
      #table(
        columns: (1fr, auto, auto),
        stroke: 0.6pt + rgb("#334155"),
        align: (left + horizon, center + horizon, center + horizon),
        table.cell(fill: accent, pad(x: 10pt, y: 7pt)[#text(fill: white, weight: "bold", size: 14pt)[Phát biểu]]),
        table.cell(fill: accent, pad(x: 10pt, y: 7pt)[#text(fill: white, weight: "bold", size: 14pt)[Đ]]),
        table.cell(fill: accent, pad(x: 10pt, y: 7pt)[#text(fill: white, weight: "bold", size: 14pt)[S]]),
        ..statements
          .enumerate()
          .map(((i, s)) => {
            let ok = if type(s) == dictionary { s.at("correct", default: false) } else { false }
            let txt = if type(s) == dictionary { s.body } else { s }
            let row-bg = if calc.odd(i) { rgb("#1a2744") } else { bm-colors.card }
            let fd = if ok { bm-colors.correct.darken(50%) } else { row-bg }
            let fs = if not ok { bm-colors.wrong.darken(50%) } else { row-bg }
            let md = if ok { text(fill: bm-colors.correct, weight: "bold", size: 14pt)[✓] } else { none }
            let ms = if not ok { text(fill: bm-colors.wrong, weight: "bold", size: 14pt)[✓] } else { none }
            (
              table.cell(fill: row-bg, pad(x: 10pt, y: 7pt)[#text(
                  weight: "bold",
                  fill: accent,
                  size: 13pt,
                )[#alpha.at(i))] #h(5pt) #text(size: 13pt, fill: white)[#txt]]),
              table.cell(fill: fd, align(center)[#box(
                width: 1.8em,
                height: 1.8em,
                stroke: 0.6pt + bm-colors.muted,
                radius: 3pt,
                fill: fd,
                align(center + horizon)[#md],
              )]),
              table.cell(fill: fs, align(center)[#box(
                width: 1.8em,
                height: 1.8em,
                stroke: 0.6pt + bm-colors.muted,
                radius: 3pt,
                fill: fs,
                align(center + horizon)[#ms],
              )]),
            )
          })
          .flatten(),
      )

      #if loigiai != none {
        v(0.3em)
        block(
          width: 100%,
          fill: rgb("#0c1a3a"),
          stroke: (left: 3pt + bm-colors.gold),
          inset: (x: 14pt, y: 8pt),
          radius: (right: 6pt),
        )[
          #text(weight: "bold", fill: bm-colors.gold, size: 13pt)[📝 Lời giải] #v(0.2em)
          #set text(size: 12pt, fill: rgb("#cbd5e1"))
          #loigiai
        ]
      }
    ]
  }
}

// ── SHORT ────────────────────────────────────────────────
#let short(
  stem,
  answer,
  loigiai: none,
  mode: "loigiai",
  accent: bm-colors.accent,
  fig: none,
  fig-pos: "right",
  fig-width: 30%,
  show-boxes: true,
  lines: 0,
  num: auto, // ← auto = tự đếm
  prefix: "Câu",
  box-count: 4,
  ..args,
) = {
  let loigiai = _resolve-loigiai(loigiai, args)

  // ── Lấy số câu (hiển thị an toàn) ──
  let q-num-display = if num == auto {
    _bm-q-cnt.step()
    context { _bm-q-cnt.display() }
  } else {
    _bm-q-cnt.update(num)
    str(num)
  }

  slide(title: none)[
    #v(-0.5em)
    #box(fill: accent, inset: (x: 10pt, y: 6pt), radius: 4pt)[
      #text(weight: "bold", fill: white, size: 16pt)[#prefix #q-num-display — Trả lời ngắn]
    ]
    #v(0.4em)
    #text(size: 17pt, fill: white)[#stem]
    #if fig != none {
      v(0.3em)
      align(center, fig)
    }

    #if show-boxes {
      v(0.8em)
      align(center)[
        #text(weight: "bold", fill: white, size: 17pt)[Đáp số: ]
        #h(8pt)
        #stack(
          dir: ltr,
          spacing: 4pt,
          ..range(box-count).map(_ => box(
            width: 2em,
            height: 2em,
            stroke: 1.2pt + bm-colors.gold,
            radius: 4pt,
            fill: bm-colors.card,
          )),
        )
      ]
    }
  ]

  if mode == "loigiai" {
    slide(title: none)[
      #v(-0.5em)
      #box(fill: bm-colors.correct, inset: (x: 10pt, y: 6pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 16pt)[#prefix #q-num-display — ĐÁP ÁN]
      ]
      #v(0.6em)
      #align(center)[
        #box(
          fill: bm-colors.correct.darken(40%),
          stroke: 2pt + bm-colors.correct,
          inset: (x: 24pt, y: 14pt),
          radius: 10pt,
        )[
          #text(weight: "bold", size: 24pt, fill: bm-colors.correct)[Đáp số: #answer]
        ]
      ]

      #if loigiai != none {
        v(0.6em)
        block(
          width: 100%,
          fill: rgb("#0c1a3a"),
          stroke: (left: 3pt + bm-colors.gold),
          inset: (x: 14pt, y: 10pt),
          radius: (right: 6pt),
        )[
          #text(weight: "bold", fill: bm-colors.gold, size: 14pt)[📝 Lời giải] #v(0.2em)
          #set text(size: 13pt, fill: rgb("#cbd5e1"))
          #loigiai
        ]
      }
    ]
  }
}

#let tl(
  stem,
  loigiai: none,
  mode: "loigiai",
  accent: bm-colors.accent,
  fig: none,
  fig-pos: "right",
  fig-width: 30%,
  show-boxes: true,
  num: auto, // ← auto = tự đếm
  prefix: "Câu",
  ..args,
) = {
  let loigiai = _resolve-loigiai(loigiai, args)

  // ── Lấy số câu (hiển thị an toàn) ──
  let q-num-display = if num == auto {
    _bm-q-cnt.step()
    context { _bm-q-cnt.display() }
  } else {
    _bm-q-cnt.update(num)
    str(num)
  }

  slide(title: none)[
    #v(-0.5em)
    #box(fill: accent, inset: (x: 10pt, y: 6pt), radius: 4pt)[
      #text(weight: "bold", fill: white, size: 16pt)[#prefix #q-num-display — Tự luận]
    ]
    #v(0.4em)
    #text(size: 17pt, fill: white)[#stem]
    #if fig != none {
      v(0.3em)
      align(center, fig)
    }

    #if show-boxes {
      v(0.7em)
      block(
        width: 100%,
        fill: bm-colors.card,
        stroke: 1pt + accent.lighten(30%),
        inset: (x: 14pt, y: 12pt),
        radius: 8pt,
      )[
        #text(size: 14pt, fill: bm-colors.muted)[Trình bày lời giải vào vở hoặc tài liệu phát tay.]
      ]
    }
  ]

  if mode == "loigiai" and loigiai != none {
    slide(title: none)[
      #v(-0.5em)
      #box(fill: bm-colors.correct, inset: (x: 10pt, y: 6pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 16pt)[#prefix #q-num-display — LỜI GIẢI]
      ]
      #v(0.6em)
      #block(
        width: 100%,
        fill: rgb("#0c1a3a"),
        stroke: (left: 3pt + bm-colors.gold),
        inset: (x: 14pt, y: 10pt),
        radius: (right: 6pt),
      )[
        #text(weight: "bold", fill: bm-colors.gold, size: 14pt)[📝 Lời giải]
        #v(0.2em)
        #set text(size: 13pt, fill: rgb("#cbd5e1"))
        #loigiai
      ]
    ]
  }
}

// ── Alias ────────────────────────────────────────────────
#let tn = mcq
#let ds = tf
#let tln = short

// ── exam-mode ────────────────────────────────────────────
#let exam-mode(mode: "loigiai", accent: bm-colors.accent) = (
  tn: tn.with(mode: mode, accent: accent),
  ds: ds.with(mode: mode, accent: accent),
  tln: tln.with(mode: mode, accent: accent),
  tl: tl.with(mode: mode, accent: accent),
  mcq: mcq.with(mode: mode, accent: accent),
  tf: tf.with(mode: mode, accent: accent),
  short: short.with(mode: mode, accent: accent),
)

// ── het ──────────────────────────────────────────────────
#let het = slide(title: none)[
  #align(center + horizon)[
    #text(weight: "bold", size: 40pt, fill: bm-colors.gold)[— HẾT —]
    #v(0.6em)
    #text(size: 18pt, fill: bm-colors.muted)[
      Cảm ơn các em đã theo dõi bài giảng! \
      Chúc các em ôn thi tốt! 🎓
    ]
  ]
]

// ── No-ops ───────────────────────────────────────────────
#let print-answer-key() = {}
#let thpt-school-exam(body, ..args) = body
