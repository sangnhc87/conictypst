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
    
    // Mặt ngang
    line((-0.5, 0), (6.5 * sc, 0), stroke: 0.8pt + luma(120))
    
    let pO = (0, 0)
    let pRoof = (6 * calc.cos(25deg) * sc, 6 * calc.sin(25deg) * sc)
    
    // Mái dốc nhà
    stroke(3pt + rgb("0284c7"))
    line(pO, pRoof)
    content((pRoof.at(0)/2, pRoof.at(1)/2 + 0.35), text(fill: rgb("0284c7"), weight: "bold", size: 8pt)[🔆 Mảng pin $6" m"$])
    
    // Tia nắng chiếu xiên 55 độ
    let pSun = (pRoof.at(0) + 1.5, pRoof.at(1) + 2.0)
    stroke(1.5pt + rgb("d97706"))
    line(pSun, pRoof)
    content((pSun.at(0) + 0.2, pSun.at(1) + 0.2), [☀️])
    
    // Cung góc mái dốc 25 độ
    draw_angle_arc(pO, 0deg, 25deg, radius: 1.0, stroke: 0.8pt + rgb("059669"))
    content((1.3, 0.25), text(fill: rgb("059669"), size: 7.5pt)[$25^circ$])
    
    // Cung góc tia nắng 55 độ
    line(pRoof, (pRoof.at(0) + 1.2, pRoof.at(1)), stroke: (paint: luma(140), dash: "dotted", thickness: 0.6pt))
    draw_angle_arc(pRoof, 0deg, 55deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((pRoof.at(0) + 1.1, pRoof.at(1) + 0.35), text(fill: rgb("d97706"), size: 7.5pt)[$55^circ$])
  })
