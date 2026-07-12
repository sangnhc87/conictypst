// Ví dụ: Khối chóp cụt tứ giác đều
#import "@preview/cetz:0.5.2"
#import "../lib.typ": draw-truncated-pyramid

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  draw-truncated-pyramid(name: "P", base-size: 4, top-size: 2, height: 3, center: (0, 0, 0))

  content("P.A", [$A$], anchor: "east")
  content("P.B", [$B$], anchor: "west")
  content("P.E", [$E$], anchor: "east")
  content("P.F", [$F$], anchor: "west")
})
