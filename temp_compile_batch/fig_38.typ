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
          let sc = 0.16
          let xmax = 12
          let ymax = 19
          
          for x in range(0, 7) {
            let xv = x * 2 * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 10) {
            let yv = y * 2 * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (9 * sc, 0), (6 * sc, 6 * sc), (0, 15 * sc), close: true)
          
          line((0, 15 * sc), (11 * sc, -1.5 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((8.5 * sc, 4 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$3x + 2y = 30$]])
          
          line((-0.5 * sc, 19 * sc), (9.5 * sc, -1 * sc), stroke: 1.1pt + rgb("059669"))
          content((2.8 * sc, 15 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$2x + y = 18$]])
          
          line((6 * sc, 6 * sc), (6 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((6 * sc, 6 * sc), (0, 6 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((6 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$6$]])
          content((9 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$9$]])
          content((-0.26, 6 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$6$]])
          content((-0.26, 15 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$15$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((9 * sc, 0), radius: 2pt, fill: black)
          content((9 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          circle((0, 15 * sc), radius: 2pt, fill: black)
          content((0.22, 15 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
          
          circle((6 * sc, 6 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((6 * sc + 0.55, 6 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(6; 6)$]])
        })
