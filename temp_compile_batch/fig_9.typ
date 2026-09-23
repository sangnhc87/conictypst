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
      // Tấm bìa trải phẳng
      rect((-3,-3), (3,3), stroke: 1pt)
      // Các ô vuông bị cắt
      rect((-3,-3), (-2,-2), fill: rgb("eee"))
      rect((2,-3), (3,-2), fill: rgb("eee"))
      rect((-3,2), (-2,3), fill: rgb("eee"))
      rect((2,2), (3,3), fill: rgb("eee"))
      // Đường gấp
      line((-2,-2), (2,-2), stroke: (dash: "dashed", paint: blue))
      line((-2,2), (2,2), stroke: (dash: "dashed", paint: blue))
      line((-2,-2), (-2,2), stroke: (dash: "dashed", paint: blue))
      line((2,-2), (2,2), stroke: (dash: "dashed", paint: blue))
      // Ghi chú
      content((-2.5,-2.5), $x$)
      content((0,-3.3), $60$)
      line((-3,-3.1), (3,-3.1), mark: (start: ">", end: ">"), stroke: 0.5pt)
    })
