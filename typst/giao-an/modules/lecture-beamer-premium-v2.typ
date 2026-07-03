// ═══════════════════════════════════════════════════════════════════════════
// LECTURE-BEAMER-PREMIUM-V2.TYP
// Module Trình Chiếu Bài Giảng — Premium Dark Sci-Fi (Glassmorphism)
// ═══════════════════════════════════════════════════════════════════════════

#import "lecture-beamer.typ": *

// ── Bảng màu Premium V2 (Dark Sci-Fi) ──────────────────────
#let pm-colors = (
  bg: rgb("#0f172a"),        // Slate 900
  card: rgb("#1e293b"),      // Slate 800
  fg: rgb("#f8fafc"),        // Lighter text
  muted: rgb("#94a3b8"),     // Muted text
  accent: rgb("#06b6d4"),    // Cyan
  correct: rgb("#10b981"),   // Emerald
  wrong: rgb("#f43f5e"),     // Rose
  gold: rgb("#fbbf24"),      // Amber
)

// Ghi đè palette
#let lec-palette-premium = (
  light: pm-colors.bg,
  surface: pm-colors.card,
  card: pm-colors.card,
  navy: pm-colors.accent,
  emerald: pm-colors.correct,
  amber: pm-colors.gold,
  rose: pm-colors.wrong,
  violet: rgb("#8b5cf6"),
  cyan: pm-colors.accent,
  text: pm-colors.fg,
  muted: pm-colors.muted,
  
  // Custom box fills for dark mode
  def-fill: pm-colors.card,
  thm-fill: pm-colors.card,
  ex-fill: pm-colors.card,
  note-fill: pm-colors.card,
  hist-fill: pm-colors.card,
  sol-fill: pm-colors.card,
)

// Macro để bọc block với Glassmorphism
#let _glass-block(title, title-color, body, text-scale: 0.85em) = context {
  let s = _lec-style.get()
  block(
    width: 100%,
    fill: pm-colors.card.transparentize(20%),
    stroke: 0.5pt + title-color.transparentize(40%),
    radius: 8pt,
    inset: 12pt,
    outset: 0pt,
    breakable: false,
  )[
    #if title != none {
      block(below: 12pt)[
        #text(fill: title-color, weight: "bold", size: 1.1em)[#title]
      ]
    }
    #set text(fill: pm-colors.fg, size: text-scale)
    #body
  ]
}

// Ghi đè các macro để KHÔNG LÀM MẤT SỐ THỨ TỰ và GIỮ SIZE CHỮ CHUẨN
#let lt-definition(title: none, kind: "ĐỊNH NGHĨA", numbered: true, body) = {
  if numbered { _lec-def-cnt.step() }
  context {
    let n = if numbered { " " + _lec-def-cnt.display() } else { "" }
    let ttl = if title != none { " — " + title } else { "" }
    _glass-block([📐 #kind#n#ttl], pm-colors.accent, body, text-scale: 0.85em)
  }
}

#let lt-theorem(title: none, kind: "ĐỊNH LÝ", numbered: true, body) = {
  if numbered { _lec-thm-cnt.step() }
  context {
    let n = if numbered { " " + _lec-thm-cnt.display() } else { "" }
    let ttl = if title != none { " — " + title } else { "" }
    _glass-block([⚡ #kind#n#ttl], pm-colors.gold, body, text-scale: 0.85em)
  }
}

#let lt-corollary(title: none, body) = lt-theorem(title: title, kind: "HỆ QUẢ", numbered: false, body)

#let lt-rule(title: none, num: "", body) = {
  let ttl = if title != none { " — " + title } else { "" }
  _glass-block([📌 QUY TẮC #num#ttl], pm-colors.gold, body, text-scale: 0.85em)
}

#let lt-example(title: none, body) = {
  _lec-ex-cnt.step()
  context {
    let n = _lec-ex-cnt.display()
    let ttl = if title != none { " — " + title } else { "" }
    _glass-block([📝 VÍ DỤ #n#ttl], pm-colors.accent, body, text-scale: 0.85em)
  }
}

#let lt-note(title: none, body) = {
  let ttl = if title != none { " — " + title } else { "" }
  _glass-block([💡 CHÚ Ý#ttl], pm-colors.wrong, body, text-scale: 0.85em)
}

#let lt-history(title: none, body) = {
  let ttl = if title != none { " — " + title } else { "" }
  _glass-block([🔍 GÓC LỊCH SỬ#ttl], pm-colors.correct, body, text-scale: 0.85em)
}

#let lt-solution(title: none, body) = {
  let ttl = if title != none { " — " + title } else { "" }
  _glass-block([✅ LỜI GIẢI#ttl], pm-colors.correct, body, text-scale: 0.75em)
}

#let step(title) = { v(0.3em); text(fill: pm-colors.gold, weight: "bold")[👉 #title]; v(0.2em) }

// ══════════════════════════════════════════════════════════════════════════
// THEME CHÍNH: lecture-theme-premium
// ══════════════════════════════════════════════════════════════════════════
#let lecture-theme-premium(
  body,
  title:       "BÀI HỌC",
  subtitle:    "TOÁN 12",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  ..args
) = {
  // Bọc vào lecture-theme gốc nhưng truyền bảng màu tối
  show: lecture-theme.with(
    title: title,
    subtitle: subtitle,
    author: author,
    institution: institution,
    bg-color: pm-colors.bg,
    accent: pm-colors.accent,
    ..args
  )
  
  // Quan trọng: Đảm bảo toàn cục text color là màu sáng để bbt.typ lấy được
  set text(fill: pm-colors.fg)
  
  body
}

// Ghi đè lt-tn cho Premium
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
            fill: if ok { pm-colors.correct.transparentize(80%) } else { s.card.transparentize(50%) },
            stroke: if ok { 1.5pt + pm-colors.correct } else { 0.5pt + s.accent.transparentize(50%) },
            inset: (x: 0pt, y: 0pt),
            radius: 7pt,
          )[
            #grid(columns: (auto, 1fr), column-gutter: 0pt)[
              #box(
                fill: if ok { pm-colors.correct } else { s.accent },
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
          fill: pm-colors.correct.transparentize(85%),
          stroke: (left: 3pt + pm-colors.correct),
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
