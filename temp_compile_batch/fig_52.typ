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
          let xmax = 24
          let ymax = 19
          
          fill(rgb("eff6ff"))
          line((0, 19 * sc), (0, 18 * sc), (6 * sc, 6 * sc), (7 * sc, 5 * sc), (23 * sc, 0), (24 * sc, 0), (24 * sc, 19 * sc), close: true, stroke: none)
          
          line((-0.5 * sc, 19 * sc), (10 * sc, -2 * sc), stroke: 1.1pt + rgb("d97706"))
          content((10.2 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("d97706"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((0, 12 * sc), (14 * sc, -2 * sc), stroke: 1.1pt + rgb("0284c7"))
          content((1.8 * sc, 11.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0284c7"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((-1 * sc, 8 * sc), (24 * sc, -0.33 * sc), stroke: 1.1pt + rgb("10b981"))
          content((23 * sc, 2.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("10b981"), size: 6.5pt, weight: "bold")[$(d_3)$]])
          
          line((7 * sc, 5 * sc), (7 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((7 * sc, 5 * sc), (0, 5 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 18 * sc), radius: 2pt, fill: black)
          content((0.35, 18 * sc + 0.12), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((6 * sc, 6 * sc), radius: 2pt, fill: black)
          content((6 * sc - 0.28, 6 * sc + 0.2), [#text(size: 7pt, weight: "bold")[$B$]])
          circle((23 * sc, 0), radius: 2pt, fill: black)
          content((23 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$D$]])
          
          circle((7 * sc, 5 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((7 * sc + 0.85, 5 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(7; 5)$]])
        })
