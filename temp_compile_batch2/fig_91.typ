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
    let sc = 0.25
    
    // Mặt đất
    line((-10 * sc, 0), (10 * sc, 0), stroke: 1pt + luma(100))
    
    let pLight = (0, 12 * sc)
    let pGroundLeft = (-12 * 0.577 * sc, 0)
    let pGroundRight = (12 * 0.577 * sc, 0)
    
    // Vùng chiếu sáng hình nón
    fill(rgb("fef9c3"))
    stroke(none)
    line(pLight, pGroundLeft)
    line(pGroundLeft, pGroundRight)
    line(pGroundRight, pLight)
    
    // Cột đèn
    stroke(2pt + luma(80))
    line((0, 0), pLight)
    content((0, pLight.at(1) + 0.35), [💡])
    content((-0.6, 6 * sc), text(size: 8pt)[$12" m"$])
    
    // Tia biên ánh sáng
    stroke(1.2pt + rgb("d97706"))
    line(pLight, pGroundLeft)
    line(pLight, pGroundRight)
    
    content((0, -0.35), text(fill: rgb("b45309"), weight: "bold", size: 8pt)[Vùng rọi sáng $2 R$])
    
    draw_angle_arc(pLight, -120deg, -60deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((0, pLight.at(1) - 1.1), text(fill: rgb("d97706"), size: 7.5pt)[$60^circ$])
  })
