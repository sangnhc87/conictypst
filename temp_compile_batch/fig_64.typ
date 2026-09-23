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
    import cetz.draw: *
    let A = (0, 0)
    let B = (3.5, 0)
    let C = (1.5, 2.2)
    line(A, B, C, A, stroke: 1.5pt + c-book)
    content((-0.3,-0.2), text(size: 9pt, weight: "bold")[$A$])
    content((3.7,-0.2), text(size: 9pt, weight: "bold")[$B$])
    content((1.5, 2.4), text(size: 9pt, weight: "bold")[$C$])
    content((1.75, -0.3), text(size: 8pt)[$c$])
    content((-0.35, 1.1), text(size: 8pt)[$b$])
    content((3.3, 1.1), text(size: 8pt)[$a$])
  })
