#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw

#let c-book = rgb("#0057b8")
#let c-main = rgb("#0057b8")
#let sm-blue = rgb("#0057b8")
#let sm-blue-light = rgb("#e0f2fe")
#let sm-green = rgb("#059669")
#let sm-green-light = rgb("#d1fae5")
#let sm-red = rgb("#e11d48")
#let sm-red-light = rgb("#ffe4e6")
#let sm-amber = rgb("#d97706")
#let sm-purple = rgb("#7c3aed")
#let sm-gray = rgb("#64748b")
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  draw.circle((x, y), radius: (rx, ry), stroke: stroke)
}

#canvas(length: 0.8cm, {
    import draw: *
    circle((0, 0), radius: 1.8, stroke: 1pt)
    draw-ellipse(0, 0, 1.8, 0.45, stroke: 0.5pt + gray, style: "dashed-back")
    // Cone inside
    draw-ellipse(0, -0.7, 1.65, 0.3, stroke: 1.2pt + blue, style: "dashed-back")
    line((-1.65, -0.7), (0, 1.8), (1.65, -0.7), stroke: 1.2pt + blue)
  })
