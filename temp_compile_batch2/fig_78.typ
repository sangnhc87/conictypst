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
    let sc = 0.08
    
    let pO = (0, 0)
    let pA = (40 * sc, 0)
    let pB = (40 * sc, 30 * sc)
    
    // Hải trình
    stroke(1.5pt + rgb("0d9488"))
    line(pO, pA)
    line(pA, pB)
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.5pt))
    line(pO, pB)
    
    content((-0.4, 0), [⚓ $O$])
    circle(pA, radius: 2pt, fill: black)
    content((pA.at(0) + 0.35, -0.2), text(weight: "bold")[$A$])
    content((pB.at(0), pB.at(1) + 0.35), [🚢 $B$])
    
    content((20 * sc, -0.35), text(fill: rgb("0d9488"), size: 8pt)[$40$ HL])
    content((40 * sc + 0.6, 15 * sc), text(fill: rgb("0d9488"), size: 8pt)[$30$ HL])
    content((20 * sc - 0.5, 15 * sc + 0.3), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$O B = ?$])
  })
