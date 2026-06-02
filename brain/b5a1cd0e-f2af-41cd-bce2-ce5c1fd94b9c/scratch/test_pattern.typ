#set page(width: 15cm, height: auto, margin: 1cm)

#let line-pattern = pattern(size: (20cm, 22pt))[
  #place(bottom, line(length: 20cm, stroke: (paint: gray.lighten(50%), thickness: 0.3pt, dash: "dashed")))
]

#let q-wrap-test(q-content) = context {
  let size = measure(block(width: 6.2cm)[#q-content]) // 6.2cm is roughly the width of the left column (1fr of 13cm page minus margins)
  let q-height = size.height
  
  table(
    columns: (1fr, 1.15fr),
    stroke: 0.4pt + gray,
    inset: 8pt,
    [
      #q-content
    ],
    [
      #text(size: 8pt, fill: gray.lighten(20%))[_Bài làm / Nháp:_]
      #v(0.3em)
      // We set a minimum height of 88pt (4 lines) so it's never too small
      #let rect-h = calc.max(88pt, q-height - 12pt)
      #rect(width: 100%, height: rect-h, stroke: none, fill: line-pattern)
    ]
  )
}

#q-wrap-test([
  #lorem(20)
  
  $y = x^2 + 2x + 1$
])

#v(1cm)

#q-wrap-test([
  #lorem(5)
])

#v(1cm)

#q-wrap-test([
  #lorem(50)
])
