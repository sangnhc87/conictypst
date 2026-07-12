// Ví dụ: Mặt yên ngựa
#import "@preview/cetz:0.5.2"
#import "../lib.typ": draw-saddle

#cetz.canvas(length: 1.5cm, {
  import cetz.draw: *

  draw-saddle(x-range: (-2, 2), y-range: (-2, 2), samples: 16, stroke: rgb("1A5276") + 0.6pt)
  circle((0, 0), radius: 0.05, fill: red)
  content((0, 0), [$O$], anchor: "north", padding: 0.1)
})
