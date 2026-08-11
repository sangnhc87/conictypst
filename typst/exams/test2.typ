#import "@preview/cetz:0.5.2"
#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let A = (0, 0)
  content(A, text(fill: blue)[ $A$ ], anchor: "east", padding: 0.1)
})
