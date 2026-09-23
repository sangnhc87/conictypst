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
    let sc = 0.00035
    
    // Mặt đất và đường băng
    line((-500 * sc, 0), (13000 * sc, 0), stroke: 0.8pt + luma(100))
    line((0, 0), (3000 * sc, 0), stroke: 2.5pt + rgb("1e293b"))
    content((1500 * sc, -0.35), text(weight: "bold")[🛬 Đường băng])
    
    let pT = (0, 0)
    let pP = (11450 * sc, 600 * 3.5 * sc)
    
    // Đường bay hạ cánh PT
    stroke(1.5pt + rgb("0d9488"))
    line(pP, pT)
    
    // Đường gióng độ cao thẳng đứng
    stroke((paint: luma(120), dash: "dashed", thickness: 0.8pt))
    line(pP, (pP.at(0), 0))
    content((pP.at(0) + 0.5, pP.at(1)/2), text(size: 8.5pt)[$600" m"$])
    
    // Đường nằm ngang tầm bay
    line(pP, (pP.at(0) - 4000 * sc, pP.at(1)), stroke: (paint: luma(140), dash: "dotted", thickness: 0.6pt))
    
    content((pT.at(0) - 0.35, 0), text(weight: "bold")[$T$])
    content((pP.at(0) + 0.45, pP.at(1) + 0.2), [✈️ $P$])
    
    // Góc tiếp cận 3 độ chuẩn qua draw_angle_arc
    draw_angle_arc(pP, 180deg, 183deg, radius: 1.2, stroke: 0.8pt + rgb("d97706"))
    content((pP.at(0) - 1.5, pP.at(1) - 0.25), text(fill: rgb("d97706"), size: 8pt)[$3^circ$])
  })
