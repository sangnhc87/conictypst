#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  // fallback if any
}

#canvas(length: 1cm, {
      import draw: *
      line((-3,0), (4,0), stroke: 2pt)
      circle((0, -2), radius: 0.1, fill: black)
      content((0, -2.4), $A$)
      circle((0, 0), radius: 0.1, fill: black)
      content((0, 0.3), $H$)
      circle((3, 0), radius: 0.1, fill: black)
      content((3, 0.3), $B$)
      line((0, -2), (0, 0), stroke: (dash: "dashed"))
      circle((1.5, 0), radius: 0.08, fill: blue)
      content((1.5, 0.3), text(blue)[$X$])
      line((0, -2), (1.5, 0), stroke: 1pt + blue)
      line((1.5, 0), (3, 0), stroke: 1pt + blue)
    })
