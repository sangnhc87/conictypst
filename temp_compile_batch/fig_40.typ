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
          set-style(stroke: 0.8pt)
          let sc = 0.028
          let xmax = 75
          let ymax = 105
          
          for x in range(0, 8) {
            let xv = x * 10 * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 11) {
            let yv = y * 10 * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 102 * sc), (0, 90 * sc), (24 * sc, 18 * sc), (60 * sc, 0), (72 * sc, 0), (72 * sc, 102 * sc), close: true)
          
          line((-2 * sc, 96 * sc), (32 * sc, -6 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((26 * sc, 40 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$3x + y = 90$]])
          
          line((-4 * sc, 32 * sc), (66 * sc, -3 * sc), stroke: 1.1pt + rgb("059669"))
          content((55 * sc, 12 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$x + 2y = 60$]])
          
          line((24 * sc, 18 * sc), (24 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((24 * sc, 18 * sc), (0, 18 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-5 * sc, 0), ((xmax + 5) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 7) * sc, 0), [$x$])
          line((0, -5 * sc), (0, (ymax + 5) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 7) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((24 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$24$]])
          content((60 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$60$]])
          content((-0.28, 18 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$18$]])
          content((-0.28, 90 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$90$]])
          
          circle((60 * sc, 0), radius: 2pt, fill: black)
          content((60 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
          circle((0, 90 * sc), radius: 2pt, fill: black)
          content((0.22, 90 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          
          circle((24 * sc, 18 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((24 * sc + 0.6, 18 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(24; 18)$]])
        })
