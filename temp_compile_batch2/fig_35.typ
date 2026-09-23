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
          let sc = 0.028
          let xmax = 95
          let ymax = 65
          
          for x in range(0, 10) {
            let xv = x * 10 * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 7) {
            let yv = y * 10 * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (80 * sc, 0), (40 * sc, 30 * sc), (0, 50 * sc), close: true)
          
          line((15 * sc, 48.75 * sc), (86 * sc, -4.5 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((20 * sc, 50 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$1.5x + 2y = 120$]])
          
          line((-6 * sc, 53 * sc), (92 * sc, 4 * sc), stroke: 1.1pt + rgb("059669"))
          content((76 * sc, 13 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$x + 2y = 100$]])
          
          line((40 * sc, 30 * sc), (40 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((40 * sc, 30 * sc), (0, 30 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-6 * sc, 0), ((xmax + 6) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 8) * sc, 0), [$x$])
          line((0, -6 * sc), (0, (ymax + 6) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 8) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((40 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$40$]])
          content((80 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$80$]])
          content((-0.26, 30 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$30$]])
          content((-0.26, 50 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$50$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((80 * sc, 0), radius: 2pt, fill: black)
          content((80 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          circle((0, 50 * sc), radius: 2pt, fill: black)
          content((0.22, 50 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
          
          circle((40 * sc, 30 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((40 * sc + 0.55, 30 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(40; 30)$]])
        })
