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
