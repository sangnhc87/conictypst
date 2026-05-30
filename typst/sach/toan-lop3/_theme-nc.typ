// _theme-nc.typ — Advanced theme for Grade 3 Math Book II

#let C-CH-NC = (
  rgb("#0369A1"), // Ch1 Deep Blue — Number Theory
  rgb("#047857"), // Ch2 Deep Green — Speed Arithmetic
  rgb("#B45309"), // Ch3 Brown — Problem Strategies
  rgb("#7C3AED"), // Ch4 Deep Violet — Advanced Geometry
  rgb("#BE123C"), // Ch5 Deep Rose — Fractions
  rgb("#1E3A5F"), // Ch6 Midnight — Thinking Challenges
)

#let C-TEAL-NC = rgb("#0D9488")
#let C-ACCENT-NC = rgb("#EA580C")
#let C-BG-NC = rgb("#F8FAFC")
#let C-TEXT-NC = rgb("#1E293B")
#let C-HEADING-NC = rgb("#0F172A")

// Page setup
#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 1.8cm, top: 2.2cm, bottom: 2.6cm),
  numbering: "1",
  number-align: center,
)

// Font settings
#set text(
  font: ("New Computer Modern",),
  size: 11pt,
  fill: C-TEXT-NC,
)

// Heading styles
#show heading.where(level: 1): it => {
  block(
    fill: C-HEADING-NC,
    inset: 8pt,
    radius: 4pt,
    width: 100%,
  )[#text(fill: white, weight: "bold", size: 18pt, it.body)]
}

#show heading.where(level: 2): it => {
  v(0.5em)
  text(
    fill: C-HEADING-NC,
    weight: "bold",
    size: 14pt,
    it.body,
  )
  v(0.3em)
}

#show heading.where(level: 3): it => {
  text(
    fill: C-HEADING-NC,
    weight: "semibold",
    size: 12pt,
    it.body,
  )
}

// Box styles
#let info-box-nc(title, body) = {
  block(
    fill: rgb("#E0F2FE"),
    inset: 10pt,
    radius: 6pt,
    stroke: 1pt + C-TEAL-NC,
  )[
    #text(weight: "bold", fill: C-TEAL-NC, title)
    #body
  ]
}

#let example-box-nc(title, body) = {
  block(
    fill: rgb("#FEF3C7"),
    inset: 10pt,
    radius: 6pt,
    stroke: 1pt + C-ACCENT-NC,
  )[
    #text(weight: "bold", fill: C-ACCENT-NC, title)
    #body
  ]
}

#let exercise-box-nc(title, body) = {
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
#let section-divider-nc() = {
  v(1em)
  line(length: 100%, stroke: 1pt + C-TEAL-NC)
  v(0.5em)
}

// Star rating
#let star-rating-nc(count) = {
  str("🌟").repeat(count)
}

// Chapter header
#let chapter-header-nc(num, title, color) = {
  block(
    fill: color,
    inset: 12pt,
    radius: 8pt,
    width: 100%,
  )[
    #align(center)[#text(
      fill: white,
      weight: "bold",
      size: 20pt,
    )[Chương #num: #title]]
  ]
  v(0.5em)
}

// Learning objectives
#let learning-objectives-nc(objectives) = {
  info-box-nc(
    title: "📚 Mục tiêu bài học / Learning Objectives",
    body: objectives,
  )
}

// Key reminder
#let key-reminder-nc(content) = {
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
#let example-nc(content) = {
  example-box-nc(
    title: "📝 Ví dụ / Example",
    body: content,
  )
}

// Exercise section
#let exercise-section-nc(title, content) = {
  exercise-box-nc(
    title: title,
    body: content,
  )
}

// Progress tracking
#let progress-tracker-nc(lesson, stars) = {
  v(0.5em)
  block(
    fill: rgb("#FEF9C3"),
    inset: 6pt,
    radius: 4pt,
  )[
    #text(size: 9pt, fill: rgb("#854D0E"))[
      🌟 Điểm mình đạt được / My Progress — Bài #lesson: #star-rating-nc(stars)
    ]
  ]
}

// Math problem template
#let math-problem-nc(number, problem) = {
  [#number. #problem]
  v(0.3em)
}

// Answer entry
#let answer-entry-nc(number, answer) = {
  [#number. #answer]
}

// Bilingual text helper
#let bilingual-nc(vi, en) = {
  [#vi / #en]
}
