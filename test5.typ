#set text(fill: black)
#let correct = text(fill: rgb("#cc2200"), weight: "bold")[A.]
#let incorrect = text(fill: black)[B.]
#let correct_body = text(fill: rgb("#cc2200"), weight: "bold")[2.5]

#show text.where(fill: rgb("#cc2200"), weight: "bold"): it => {
  show regex("^[A-D]\.$"): label => box(
      stroke: 0.7pt + rgb("#cc2200"),
      radius: 50%,
      width: 1.3em,
      height: 1.3em,
      baseline: 0.2em,
      align(center + horizon)[#label.text.slice(0, 1)]
  )
  it
}

#correct
#incorrect
#correct_body
