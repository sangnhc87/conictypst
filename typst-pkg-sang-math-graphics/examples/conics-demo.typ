// Ví dụ: Parabol, elip, hyperbol
#import "@preview/cetz:0.5.2"
#import "../lib.typ": draw-ellipse, draw-hyperbola, draw-parabola

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  draw-parabola(a: 0.5, x-range: (-3, 3), stroke: blue + 1.2pt)
  draw-ellipse(center: (4, 0), a: 2, b: 1.2, stroke: red + 1.2pt)
  draw-hyperbola(a: 0.8, b: 0.8, x-range: (1, 4), stroke: green + 1.2pt)

  content((-2, 3), [Parabol], anchor: "south")
  content((4, 2), [Elip], anchor: "south")
  content((3, -2.5), [Hyperbol], anchor: "south")
})
