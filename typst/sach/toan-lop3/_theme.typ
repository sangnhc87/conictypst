// _theme.typ — Base theme for Grade 3 Math Book I
// Colors, fonts, and reusable components

#let C-CH = (
  rgb("#0EA5E9"), // Ch1 Sky Blue — Numbers
  rgb("#10B981"), // Ch2 Emerald — Addition/Subtraction
  rgb("#F59E0B"), // Ch3 Amber — Multiplication/Division
  rgb("#8B5CF6"), // Ch4 Violet — Geometry
  rgb("#EF4444"), // Ch5 Red — Fractions
)

#let C-TEAL = rgb("#14B8A6")
#let C-ACCENT = rgb("#F97316")
#let C-BG = rgb("#F0FDF4")
#let C-TEXT = rgb("#1F2937")
#let C-HEADING = rgb("#0F766E")

// Page setup
#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 1.8cm, top: 2.2cm, bottom: 2.6cm),
  numbering: "1",
  number-align: center,
)

// Font settings
#set text(
  font: ("New Computer Modern", "Noto Sans", "DejaVu Sans"),
  size: 11pt,
  fill: C-TEXT,
)

// Heading styles
#show heading.where(level: 1): it => {
  block(
    fill: C-HEADING,
    inset: 8pt,
    radius: 4pt,
    width: 100%,
  )[#text(fill: white, weight: "bold", size: 18pt, it.body)]
}

#show heading.where(level: 2): it => {
  v(0.5em)
  text(
    fill: C-HEADING,
    weight: "bold",
    size: 14pt,
    it.body,
  )
  v(0.3em)
}

#show heading.where(level: 3): it => {
  text(
    fill: C-HEADING,
    weight: "semibold",
    size: 12pt,
    it.body,
  )
}

// Box styles
#let info-box(title, body) = {
  block(
    fill: rgb("#E0F2FE"),
    inset: 10pt,
    radius: 6pt,
    stroke: 1pt + C-TEAL,
  )[
    #text(weight: "bold", fill: C-TEAL, title)
    #body
  ]
}

#let example-box(title, body) = {
  block(
    fill: rgb("#FEF3C7"),
    inset: 10pt,
    radius: 6pt,
    stroke: 1pt + C-ACCENT,
  )[
    #text(weight: "bold", fill: C-ACCENT, title)
    #body
  ]
}

#let exercise-box(title, body) = {
  block(
    fill: rgb("#ECFDF5"),
    inset: 10pt,
    radius: 6pt,
    stroke: 1pt + rgb("#34D399"),
  )[
    #text(weight: "bold", fill: rgb("#059669"), title)
    #body
  ]
}

// Section divider
#let section-divider() = {
  v(1em)
  line(length: 100%, stroke: 1pt + C-TEAL)
  v(0.5em)
}

// Star rating for progress
#let star-rating(count) = {
  str("🌟").repeat(count)
}

// Chapter header
#let chapter-header(num, title, color) = {
  block(
    fill: color,
    inset: 12pt,
    radius: 8pt,
    width: 100%,
  )[
    #text(
      fill: white,
      weight: "bold",
      size: 20pt,
      align: center,
    )[Chương #num: #title]
  ]
  v(0.5em)
}

// Learning objectives
#let learning-objectives(objectives) = {
  info-box(
    title: "📚 Mục tiêu bài học / Learning Objectives",
    body: objectives,
  )
}

// Key knowledge reminder
#let key-reminder(content) = {
  block(
    fill: rgb("#F0FDF4"),
    inset: 8pt,
    radius: 4pt,
    stroke: 1pt + rgb("#22C55E"),
  )[
    #text(weight: "bold", fill: rgb("#15803D"), size: 10pt)["💡 Nhắc lại kiến thức / Key Reminder"]
    #content
  ]
}

// Example
#let example(content) = {
  example-box(
    title: "📝 Ví dụ / Example",
    body: content,
  )
}

// Exercise section
#let exercise-section(title, content) = {
  exercise-box(
    title: title,
    body: content,
  )
}

// Progress tracking
#let progress-tracker(lesson, stars) = {
  v(0.5em)
  block(
    fill: rgb("#FEF9C3"),
    inset: 6pt,
    radius: 4pt,
  )[
    #text(size: 9pt, fill: rgb("#854D0E"))[
      🌟 Điểm mình đạt được / My Progress — Bài #lesson: #star-rating(stars)
    ]
  ]
}

// Math problem template
#let math-problem(number, problem) = {
  [#number. #problem]
  v(0.3em)
}

// Answer key entry
#let answer-entry(number, answer) = {
  [#number. #answer]
}

// Bilingual text helper
#let bilingual(vi, en) = {
  [#vi / #en]
}
