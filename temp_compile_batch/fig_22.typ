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

#canvas({
    import cetz.draw: *
    line((-1, 0), (7, 0), mark: (end: ">"))
    content((7.2, -0.3), [$x$])
    // Vạch số
    content((2, -0.4), [$1$])
    content((6, -0.4), [$5$])
    // Gạch chéo
    gach_cheo(-1, 2)
    gach_cheo(6, 6.8)
    // Ngoặc
    content((2, 0), text(size: 14pt)[$($])
    content((6, 0), text(size: 14pt)[$)$])
  })
