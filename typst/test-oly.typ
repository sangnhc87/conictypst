#import "sang-exam.typ": *
#show: thpt-school-exam.with()

#let dien-khuyet(lines: 4) = {
  v(0.5em)
  for _ in range(lines) {
    box(width: 100%, stroke: (bottom: 0.5pt + luma(150), rest: none), height: 1.5em)
    v(0em)
  }
}

#let o-ly(rows: 5) = {
  v(0.5em)
  let cell-content = []
  let grid-content = grid(
    columns: (1.5em,) * 25,
    rows: (1.5em,) * rows,
    stroke: 0.5pt + luma(200),
    ..([#cell-content],)*25*rows
  )
  align(center, grid-content)
}

#dien-khuyet(lines: 3)
#o-ly(rows: 4)
