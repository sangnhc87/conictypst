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

#canvas(length: 1cm, {
      import draw: *
      circle((0,0), radius: 2, stroke: 1pt)
      draw-ellipse(0, 1.15, 1.63, 0.4, stroke: 1pt + blue, style: "dashed-back")
      draw-ellipse(0, -1.15, 1.63, 0.4, stroke: 1pt + blue, style: "dashed-back")
      line((-1.63, 1.15), (-1.63, -1.15), stroke: 1pt + blue)
      line((1.63, 1.15), (1.63, -1.15), stroke: 1pt + blue)
    })
