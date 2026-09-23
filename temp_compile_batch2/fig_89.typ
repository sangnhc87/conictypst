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
    let sc = 0.07
    
    // Mặt đất
    line((-0.5, 0), (35 * sc, 0), stroke: 1pt + luma(100))
    
    let pBuilding = (0, 0)
    let pTop = (0, 45 * sc)
    let pShadow = (45 * 0.577 * sc, 0)
    
    // Tòa nhà
    rect((-6 * sc, 0), (0, 45 * sc), fill: rgb("f8fafc"), stroke: 1.2pt + rgb("1e293b"))
    content((-3 * sc, 22.5 * sc), text(size: 8pt, weight: "bold")[🏢])
    
    // Mặt trời emoji
    content((pShadow.at(0) + 1.2, pTop.at(1) + 0.6), [☀️])
    
    // Tia nắng chiếu xiên từ đỉnh xuống mặt đất
    stroke(1.5pt + rgb("d97706"))
    line(pTop, pShadow)
    
    // Đoạn bóng râm trên mặt đất
    stroke(2.5pt + rgb("475569"))
    line(pBuilding, pShadow)
    content((pShadow.at(0)/2, -0.35), text(fill: rgb("475569"), weight: "bold", size: 8pt)[Bóng $L = ?$])
    content((-0.7, 22.5 * sc), text(size: 8pt)[$45" m"$])
    
    // Cung góc 60 độ của tia nắng tại đầu bóng râm
    draw_angle_arc(pShadow, 120deg, 180deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((pShadow.at(0) - 1.1, 0.35), text(fill: rgb("d97706"), size: 7.5pt)[$60^circ$])
  })
