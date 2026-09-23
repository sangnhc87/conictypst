#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  // fallback if any
}

#canvas(length: 0.8cm, {
    import draw: *
    draw-ellipse(0, 1.2, 0.8, 0.24, stroke: 1.2pt)
    draw-ellipse(0, -1.2, 0.8, 0.24, stroke: 1.2pt, style: "dashed-back")
    line((-0.8, -1.2), (-0.8, 1.2), stroke: 1.2pt)
    line((0.8, -1.2), (0.8, 1.2), stroke: 1.2pt)
  })
