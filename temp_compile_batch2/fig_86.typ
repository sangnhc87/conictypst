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
    let sc = 0.35
    
    let pA = (0, 0)
    let pB = (12 * sc, 0)
    let pC = (12 * 0.366 * sc, 12 * 0.634 * sc)
    
    // Đường bờ biển AB
    stroke(1.2pt + rgb("0d9488"))
    line(pA, pB)
    
    // Tia ngắm từ 2 trạm tới phao C
    stroke(1.2pt + rgb("0284c7"))
    line(pA, pC)
    stroke(1.2pt + rgb("2563eb"))
    line(pB, pC)
    
    content((-0.4, 0), [🗼 $A$])
    content((12 * sc + 0.4, 0), [🗼 $B$])
    content((pC.at(0), pC.at(1) + 0.45), [🛟 $C$ (Phao SOS)])
    
    content((6 * sc, -0.3), text(size: 8pt)[$12" km"$])
    content(((pB.at(0)+pC.at(0))/2 + 0.6, pC.at(1)/2), text(fill: rgb("2563eb"), weight: "bold", size: 8.5pt)[$B C = ?$])
    
    draw_angle_arc(pA, 0deg, 60deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.0, 0.4), text(fill: rgb("d97706"), size: 7.5pt)[$60^circ$])
    
    draw_angle_arc(pB, 135deg, 180deg, radius: 0.8, stroke: 0.8pt + rgb("059669"))
    content((12 * sc - 1.1, 0.35), text(fill: rgb("059669"), size: 7.5pt)[$45^circ$])
  })
