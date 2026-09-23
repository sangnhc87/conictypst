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
    let sc = 0.04
    
    let pO = (0, 0)
    let pA = (50 * 0.5 * sc, 50 * 0.866 * sc)
    let pB = (50 * sc, 0)
    
    // Cung tròn vùng radar
    draw_angle_arc(pO, -10deg, 70deg, radius: 50 * sc, stroke: (paint: rgb("99f6e4"), thickness: 1.2pt))
    
    stroke(1.2pt + rgb("0d9488"))
    line(pO, pA)
    line(pO, pB)
    stroke(1.8pt + rgb("dc2626"))
    line(pA, pB)
    
    content((-0.4, 0), [📡 $O$])
    content((pA.at(0), pA.at(1) + 0.35), [🚢 $A$])
    content((pB.at(0) + 0.4, 0), [🚢 $B$])
    
    content((pA.at(0)/2 - 0.45, pA.at(1)/2 + 0.2), text(fill: rgb("0d9488"), size: 8pt)[$50" km"$])
    content((25 * sc, -0.35), text(fill: rgb("0d9488"), size: 8pt)[$50" km"$])
    content(((pA.at(0)+pB.at(0))/2 + 0.5, pA.at(1)/2), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$A B = ?$])
    
    draw_angle_arc(pO, 0deg, 60deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((0.8, 0.4), text(fill: rgb("d97706"), size: 7.5pt)[$60^circ$])
  })
