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
    draw-ellipse(0, 1.5, 1, 0.3, stroke: 1.2pt)
    draw-ellipse(0, -1.5, 1, 0.3, stroke: 1.2pt, style: "dashed-back")
    line((-1, -1.5), (-1, 1.5), stroke: 1.2pt)
    line((1, -1.5), (1, 1.5), stroke: 1.2pt)
    line((0, -1.5), (1, -1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0.5, -1.2), $r$)
    line((1.3, -1.5), (1.3, 1.5), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((1.6, 0), $h$)
  })
