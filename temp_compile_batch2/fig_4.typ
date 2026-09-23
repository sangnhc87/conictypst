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

#canvas(length: 0.8cm, {
    import draw: *
    // Sector
    // Sector
    line((0, 0), (2.5 * calc.cos(15deg), 2.5 * calc.sin(15deg)), stroke: 1.2pt)
    line((0, 0), (2.5 * calc.cos(105deg), 2.5 * calc.sin(105deg)), stroke: 1.2pt)
    arc((2.5 * calc.cos(15deg), 2.5 * calc.sin(15deg)), start: 15deg, stop: 105deg, radius: 2.5, stroke: 1.2pt)
    content((1, 1), $R=6$)
    
    // Arrow
    content((3.5, 1), $=>$ )
    
    // Cone
    let cx = 6
    let cy = 1
    draw-ellipse(cx, cy - 1.5, 1.2, 0.35, stroke: 1.2pt, style: "dashed-back")
    line((cx - 1.2, cy - 1.5), (cx, cy + 1.5), (cx + 1.2, cy - 1.5), stroke: 1.2pt)
    
    circle((cx, cy - 1.5), radius: 0.05, fill: black)
    line((cx, cy - 1.5), (cx, cy + 1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    line((cx, cy - 1.5), (cx + 1.2, cy - 1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    content((cx + 0.6, cy - 1.8), $r$)
    content((cx - 0.3, cy), $h$)
    content((cx + 0.9, cy), $l=R$)
  })
