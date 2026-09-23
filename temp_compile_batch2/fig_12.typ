#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw

#let circ = sym.degree
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

#let draw_angle_arc(center, a1, a2, radius: 0.8, ..rest) = {
  let sx = center.at(0) + radius * calc.cos(a1)
  let sy = center.at(1) + radius * calc.sin(a1)
  cetz.draw.arc((sx, sy), start: a1, stop: a2, radius: radius, ..rest)
}

#let gach_cheo(x1, x2, y: 0, h: 0.15) = {
  import cetz.draw: *
  let step = 0.15
  let n = std.int((x2 - x1) / step)
  for i in std.range(n + 1) {
    let px = x1 + i * step
    line((px, y + h), (px - h, y - h), stroke: 0.5pt + rgb("555"))
  }
}

#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  draw.circle((x, y), radius: (rx, ry), stroke: stroke)
}

#canvas(length: 0.8cm, {
    import cetz.draw: *
    let pi = 3.14159
    // Dao động lò xo
    line((-0.5, 0), (13.5, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    content((13.6, -0.25), text(size: 8pt)[$t$])
    content((0.3, 2.4), text(size: 8pt)[$x$])
    // Hàm dao động
    let pts = range(0, 260).map(i => (i/20, 2*calc.sin(i/20  - 0.524)))
    line(..pts, stroke: (paint: c-book, thickness: 1.5pt))
    // Ngưỡng x >= 1
    line((0, 1), (13, 1), stroke: (paint: red, thickness: 0.8pt, dash: "dashed"))
    content((13.5, 1.2), text(size: 7pt, fill: red)[$x = 1$ cm])
    // Nhãn
    for (x, l) in ((3.14, $pi$), (6.28, $2pi$)) {
      line((x, -0.08), (x, 0.08))
      content((x, -0.35), text(size: 7pt)[#l])
    }
  })
