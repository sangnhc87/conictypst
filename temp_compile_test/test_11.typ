#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  // fallback if any
}

#canvas(length: 1cm, {
      import draw: *
      circle((0,0), radius: 2, stroke: 1pt)
      draw-ellipse(0, 1.15, 1.63, 0.4, stroke: 1pt + blue, style: "dashed-back")
      draw-ellipse(0, -1.15, 1.63, 0.4, stroke: 1pt + blue, style: "dashed-back")
      line((-1.63, 1.15), (-1.63, -1.15), stroke: 1pt + blue)
      line((1.63, 1.15), (1.63, -1.15), stroke: 1pt + blue)
    })
