// =========================================================
// SANG-BEAMER-PREMIUM.TYP v1.0 — Slide trình chiếu Đẳng Cấp
// Cập nhật: Nền Gradient, Glassmorphism, Rounded blocks
// =========================================================

#import "@preview/touying:0.7.3": *
#import themes.metropolis: *

// Kế thừa các macro logic từ sang-exam
#import "sang-exam.typ": (
  True, bode, classic, configure-step-reveal, reset-step, tc, vect
)

// ── State variables ─────────────────────────────
#let _bm-ans-state = state("bm-ans", (q: 0, mcq: (), tf: (), sh: ()))
#let _bm-q-cnt = counter("bm-q")

#let bm-resetcau(start: 1) = [
  #_bm-q-cnt.update(if start > 0 { start - 1 } else { 0 })
]
#let bm-setcau(start) = bm-resetcau(start: start)

// ── Bảng màu Premium (Dark Sci-Fi) ──────────────────────
#let pm-colors = (
  bg-start: rgb("#090b16"), // Đen xanh rất tối
  bg-end: rgb("#1b1836"),   // Tím than tối
  fg: rgb("#f8fafc"),
  accent: rgb("#06b6d4"),   // Cyan rực rỡ
  accent-soft: rgb("#06b6d4").lighten(80%),
  correct: rgb("#10b981"),  // Emerald
  wrong: rgb("#f43f5e"),    // Rose
  card-bg: rgb("#1e293b").transparentize(40%), // Nền thẻ trong suốt (Glassmorphism)
  card-border: rgb("#334155").transparentize(50%),
  gold: rgb("#fbbf24"),     // Vàng sang trọng
  muted: rgb("#94a3b8")
)

// ── Macro Block Premium ────────────────────────────────
#let pm-card(title: none, color: pm-colors.accent, body) = block(
  width: 100%,
  fill: pm-colors.card-bg,
  stroke: 1pt + color.transparentize(60%),
  radius: 12pt,
  inset: 12pt,
  outset: 0pt,
)[
  #if title != none {
    block(below: 10pt)[
      #text(fill: color, weight: "bold", size: 1.1em)[#title]
    ]
  }
  #set text(fill: pm-colors.fg, size: 17pt)
  #body
]

// Ghi đè macro cho Bài tập / Ví dụ / Câu hỏi
#let bt(loigiai: none, ..args, body) = {
  _bm-q-cnt.step()
  pm-card(
    title: context [Câu #_bm-q-cnt.display():],
    color: pm-colors.accent
  )[
    #body
    #if loigiai != none [
      #pause
      #block(
        width: 100%,
        fill: rgb(0, 0, 0).transparentize(70%),
        radius: 8pt,
        inset: 10pt,
        stroke: (left: 4pt + pm-colors.correct)
      )[
        #text(fill: pm-colors.correct, weight: "bold")[Lời giải:] \
        #set text(size: 15pt)
        #loigiai
      ]
    ]
  ]
}

#let vd(loigiai: none, ..args, body) = {
  pm-card(
    title: [Ví dụ:],
    color: pm-colors.gold
  )[
    #body
    #if loigiai != none [
      #pause
      #block(
        width: 100%,
        fill: rgb(0, 0, 0).transparentize(70%),
        radius: 8pt,
        inset: 10pt,
        stroke: (left: 4pt + pm-colors.gold)
      )[
        #text(fill: pm-colors.gold, weight: "bold")[Hướng dẫn:] \
        #set text(size: 15pt)
        #loigiai
      ]
    ]
  ]
}

#let dapan(..args) = {
  let choices = args.pos()
  let cols = ()
  for c in choices {
    cols.push(align(left)[#c])
  }
  grid(columns: (1fr, 1fr, 1fr, 1fr), row-gutter: 1em, ..cols)
}

// ── Theme Premium ────────────────────────────────────────
#let sang-beamer-premium-theme(
  body,
  title: "ĐỀ THI THPT QUỐC GIA",
  subtitle: "TOÁN - LỚP 12",
  author: "GV Nguyễn Văn Sang",
  institution: "Sở GD&ĐT",
  date: datetime.today(),
  aspect-ratio: "16-9",
  code: "",
  total-q: 22,
) = {
  
  // 1. Cấu hình Metropolis base
  show: metropolis-theme.with(
    aspect-ratio: aspect-ratio,
    footer: context {
      set text(size: 7pt, fill: pm-colors.muted)
      grid(
        columns: (auto, 1fr, auto),
        align: (left + horizon, center + horizon, right + horizon),
        pad(left: 4pt)[#author — #institution],
        // Dải nút tiến trình hiện đại (Pill shape)
        {
          let dots = ()
          for i in range(1, total-q + 1) {
            let lbl = label("bm-q-" + str(i))
            let has = query(lbl).len() > 0
            if has {
              dots.push(
                link(lbl, box(
                  width: 16pt, height: 6pt, radius: 4pt,
                  fill: pm-colors.accent,
                  stroke: none
                ))
              )
            } else {
              dots.push(
                box(
                  width: 6pt, height: 6pt, radius: 50%,
                  fill: pm-colors.muted.transparentize(70%),
                  stroke: none
                )
              )
            }
          }
          stack(dir: ltr, spacing: 4pt, ..dots)
        },
        pad(right: 4pt)[#counter(page).display() / #counter(page).final().first()],
      )
    },
    footer-right: none,
    footer-progress: false,
    config-info(
      title: [#title],
      subtitle: [#subtitle #if code != "" [— Mã đề: #code]],
      author: [#author],
      date: date,
      institution: [#institution],
    ),
    config-common(slide-fn: slide),
    config-colors(
      primary: pm-colors.accent,
      primary-light: pm-colors.accent.lighten(50%),
      secondary: pm-colors.gold,
      neutral-lightest: pm-colors.bg-start, // Sẽ bị override bởi gradient
      neutral-darkest: pm-colors.fg,
    ),
  )

  // 2. Chèn Nền Gradient & Cấu hình font
  set page(
    fill: gradient.linear(pm-colors.bg-start, pm-colors.bg-end, angle: 135deg),
  )
  set text(font: ("Arial", "sans-serif", "Libertinus Serif"), size: 18pt, fill: pm-colors.fg, lang: "vi")
  show math.equation.where(block: false): math.display
  show math.equation: set text(fill: pm-colors.gold)
  
  // 3. Tuỳ chỉnh thanh tiến trình của slide
  show heading.where(level: 1): set text(font: ("Arial", "sans-serif"), weight: "bold", fill: pm-colors.accent)
  show heading.where(level: 2): set text(font: ("Arial", "sans-serif"), weight: "bold", fill: pm-colors.accent)

  configure-step-reveal(before_nonfirst: [#pause])

  title-slide()
  body
}
