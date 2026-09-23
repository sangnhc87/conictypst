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
          let sc = 0.20
          let xmax = 11.5
          let ymax = 13.5
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (10 * sc, 0), (7 * sc, 9 * sc), (8 * sc, 8 * sc), (4 * sc, 8 * sc), close: true)
          
          line((7.5 * sc, 7.5 * sc), (11 * sc, -3 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((10.8 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((-1 * sc, 12.5 * sc), (12 * sc, 6 * sc), stroke: 1.1pt + rgb("059669"))
          content((1.8 * sc, 12.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((0, 0), (6 * sc, 12 * sc), stroke: 1.1pt + rgb("7c3aed"))
          content((5.2 * sc, 11.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("7c3aed"), size: 6.5pt, weight: "bold")[$(Delta)$]])
          
          line((8 * sc, 8 * sc), (8 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((8 * sc, 8 * sc), (0, 8 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.5 * sc, 0), ((xmax + 0.5) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 0.8) * sc, 0), [$x$])
          line((0, -0.5 * sc), (0, (ymax + 0.5) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 0.8) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((10 * sc, 0), radius: 2pt, fill: black)
          content((10 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((4 * sc, 8 * sc), radius: 2pt, fill: black)
          content((4 * sc - 0.28, 8 * sc + 0.2), [#text(size: 7pt, weight: "bold")[$D$]])
          
          circle((8 * sc, 8 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((8 * sc + 0.75, 8 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(8; 8)$]])
        })
