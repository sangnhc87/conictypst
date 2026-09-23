#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  // fallback if any
}

#canvas(length: 0.8cm, {
    import draw: *
    circle((0, 0), radius: 1.8, stroke: 1pt)
    draw-ellipse(0, 0, 1.8, 0.45, stroke: 0.5pt + gray, style: "dashed-back")
    // Cone inside
    draw-ellipse(0, -0.7, 1.65, 0.3, stroke: 1.2pt + blue, style: "dashed-back")
    line((-1.65, -0.7), (0, 1.8), (1.65, -0.7), stroke: 1.2pt + blue)
  })
