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
          let sc = 0.17
          let xmax = 13.5
          let ymax = 12.5
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("0d9488"))
          line((0, 0), (12 * sc, 0), (9 * sc, 6 * sc), (6 * sc, 9 * sc), close: true)
          
          line((6 * sc, 12 * sc), (13 * sc, -2 * sc), stroke: 1.1pt + rgb("0d9488"))
          content((12.8 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0d9488"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((-1 * sc, 12.5 * sc), (14 * sc, 5 * sc), stroke: 1.1pt + rgb("0284c7"))
          content((1.8 * sc, 12 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0284c7"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((0, 0), (8 * sc, 12 * sc), stroke: 1.1pt + rgb("7c3aed"))
          content((7.2 * sc, 11.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("7c3aed"), size: 6.5pt, weight: "bold")[$(Delta)$]])
          
          line((9 * sc, 6 * sc), (9 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((9 * sc, 6 * sc), (0, 6 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.5 * sc, 0), ((xmax + 0.5) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 0.8) * sc, 0), [$x$])
          line((0, -0.5 * sc), (0, (ymax + 0.5) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 0.8) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((12 * sc, 0), radius: 2pt, fill: black)
          content((12 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((6 * sc, 9 * sc), radius: 2pt, fill: black)
          content((6 * sc - 0.28, 9 * sc + 0.2), [#text(size: 7pt, weight: "bold")[$C$]])
          
          circle((9 * sc, 6 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((9 * sc + 0.75, 6 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(9; 6)$]])
        })
