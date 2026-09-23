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
    let sc = 0.12
    
    // Mặt đường
    line((-5 * sc, 0), (45 * sc, 0), stroke: 1.5pt + luma(100))
    content((20 * sc, -0.7), text(weight: "bold")[🛣️ Mặt đường cao tốc])
    
    let pA = (0, 15 * sc)
    let pB = (40 * sc, 15 * sc)
    let pMid = (20 * sc, 0)
    
    // Hai cột đèn
    stroke(2.2pt + luma(80))
    line((0, 0), pA)
    line((40 * sc, 0), pB)
    content((0, pA.at(1) + 0.35), [💡 $A$])
    content((40 * sc, pB.at(1) + 0.35), [💡 $B$])
    
    // Tia sáng tới điểm giữa M
    stroke(1.2pt + rgb("d97706"))
    line(pA, pMid)
    line(pB, pMid)
    
    circle(pMid, radius: 2pt, fill: rgb("dc2626"))
    content((20 * sc, 0.35), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$M$ (Điểm giữa)])
    
    content((0, 7.5 * sc - 0.2), text(size: 7.5pt)[$15" m"$])
    content((40 * sc + 0.5, 7.5 * sc - 0.2), text(size: 7.5pt)[$15" m"$])
    content((20 * sc, -0.35), text(size: 8pt)[$A B = 40" m"$])
  })
