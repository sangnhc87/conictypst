#import "@preview/cetz:0.5.2"
#import "../geometry-2d/conics.typ": ellipse-points

#set page(paper: "a5")

// Test: ellipse with cetz.draw.* instead of import inside fn
#let draw-ell-test(name: "e", a: 2, b: 1, center: (0.0, 0.0)) = {
  let d = cetz.draw   // Use qualified path instead of import *
  let (cx, cy) = center
  let pts = ellipse-points(a: a, b: b, center: center)
  d.group(name: name, {
    d.line(..pts, close: true, stroke: 1.5pt + rgb("7B1FA2"))
    d.anchor("top", (cx, cy + b))
  })
}

#cetz.canvas(length: 0.9cm, {
  import cetz.draw: *
  draw-ell-test(name: "E", a: 3, b: 2)
})
