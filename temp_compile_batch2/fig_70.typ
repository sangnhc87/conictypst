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
    let sc = 0.6
    
    // Tường và đất
    line((-0.5, 0), (3 * sc, 0), stroke: 1pt + luma(100))
    line((2.11 * sc, 0), (2.11 * sc, 5.2 * sc), stroke: 2.5pt + luma(80))
    content((2.11 * sc + 0.6, 3 * sc), [🧱])
    
    let pGround = (0, 0)
    let pWall = (2.11 * sc, 4.53 * sc)
    
    // Chiếc thang
    stroke(3pt + rgb("b45309"))
    line(pGround, pWall)
    content((1 * sc - 0.2, 2.5 * sc + 0.3), [🪜])
    content((1 * sc - 0.2, 2.5 * sc - 0.1), text(fill: rgb("b45309"), weight: "bold", size: 8pt)[$5" m"$])
    
    // Góc 65 độ
    draw_angle_arc(pGround, 0deg, 65deg, radius: 0.6, stroke: 0.8pt + rgb("d97706"))
    content((0.8, 0.4), text(fill: rgb("d97706"), size: 8pt)[$65^circ$])
    
    // Khoảng cách x
    content((1.05 * sc, -0.35), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$x = ?$])
  })
