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
    let sc = 0.06
    
    // Sông nước
    rect((-1, 0), (60 * sc, 30 * sc), fill: rgb("eff6ff"), stroke: none)
    line((-1, 0), (60 * sc, 0), stroke: 1pt + rgb("0284c7"))
    line((-1, 30 * sc), (60 * sc, 30 * sc), stroke: 1pt + rgb("0284c7"))
    content((25 * sc, 15 * sc), text(fill: rgb("93c5fd"), size: 8.5pt, weight: "bold")[🌊 Dòng sông])
    
    let pA = (0, 0)
    let pB = (50 * sc, 0)
    let pC = (0, 28.9 * sc)
    
    // Đoạn thẳng
    stroke(1.2pt + rgb("1e293b"))
    line(pA, pB)
    line(pA, pC)
    line(pB, pC)
    
    // Điểm và emoji
    circle(pA, radius: 2pt, fill: black)
    content((0, -0.35), text(weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((50 * sc, -0.35), text(weight: "bold")[$B$])
    content((0, 28.9 * sc + 0.45), [🌳])
    content((0.45, 28.9 * sc + 0.2), text(fill: rgb("059669"), weight: "bold")[$C$])
    
    content((25 * sc, -0.35), text(size: 8pt)[$50" m"$])
    content((-0.65, 14.5 * sc), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$A C = ?$])
    
    // Góc 30 độ tại B
    draw_angle_arc(pB, 150deg, 180deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((50 * sc - 1.0, 0.3), text(fill: rgb("d97706"), size: 7.5pt)[$30^circ$])
  })
