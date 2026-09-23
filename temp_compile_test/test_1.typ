#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  // fallback if any
}

#canvas(length: 1cm, {
      import draw: *
      line((-2, 0), (2, 0), stroke: 1pt)
      line((-2, 0), (0, 4), stroke: 1pt)
      line((2, 0), (0, 4), stroke: 1pt)
      line((0,0), (0,4), stroke: (dash: "dashed"))
      rect((-1.2, 0), (1.2, 1.6), stroke: 1.2pt + blue, fill: blue.lighten(80%))
      content((0, 0.8), $x$)
      content((0.6, 1.8), $r$)
      content((-2.3, 0), $A$)
      content((2.3, 0), $B$)
      content((0, 4.3), $S$)
    })
