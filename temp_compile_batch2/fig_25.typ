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

#canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.28
          let xmax = 7.5
          let ymax = 11
          
          for x in range(0, 8) {
            let xv = x * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 12) {
            let yv = y * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (5 * sc, 0), (2 * sc, 6 * sc), (0, 9 * sc), close: true)
          
          line((-0.5 * sc, 9.75 * sc), (6.5 * sc, -0.75 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((4.8 * sc, 4.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 7pt, weight: "bold")[$3x + 2y = 18$]])
          
          line((-0.5 * sc, 11 * sc), (5.5 * sc, -1 * sc), stroke: 1.1pt + rgb("059669"))
          content((1.2 * sc, 9.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 7pt, weight: "bold")[$2x + y = 10$]])
          
          line((2 * sc, 6 * sc), (2 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((2 * sc, 6 * sc), (0, 6 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((2 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$2$]])
          content((5 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$5$]])
          content((-0.26, 6 * sc), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$6$]])
          content((-0.26, 9 * sc), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$9$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((5 * sc, 0), radius: 2pt, fill: black)
          content((5 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7.5pt, weight: "bold")[$A$]])
          circle((0, 9 * sc), radius: 2pt, fill: black)
          content((0.22, 9 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7.5pt, weight: "bold")[$C$]])
          
          circle((2 * sc, 6 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((2 * sc + 0.55, 6 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$B(2; 6)$]])
        })
