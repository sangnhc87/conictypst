#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  // fallback if any
}

#canvas(length: 0.8cm, {
    import draw: *
    draw-ellipse(0, 1.5, 1, 0.3, stroke: 1.2pt)
    draw-ellipse(0, -1.5, 1, 0.3, stroke: 1.2pt, style: "dashed-back")
    line((-1, -1.5), (-1, 1.5), stroke: 1.2pt)
    line((1, -1.5), (1, 1.5), stroke: 1.2pt)
    line((0, -1.5), (1, -1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0.5, -1.2), $r$)
    line((1.3, -1.5), (1.3, 1.5), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((1.6, 0), $h$)
  })
