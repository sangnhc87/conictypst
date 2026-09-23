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
    
    // Mái dốc nghiêng 15 độ
    let pA = (-8 * 0.966 * sc, -8 * 0.259 * sc)
    let pC = (0, 0)
    let pB = (6 * 0.966 * sc, 6 * 0.259 * sc)
    
    stroke(2pt + luma(120))
    line(pA, pB)
    content((pB.at(0) + 1.2, pB.at(1) + 0.1), text(size: 8.5pt)[Mái dốc ($15^circ$)])
    
    // Cột ăng-ten CD thẳng đứng kèm icon 📡
    let pD = (0, 10 * sc)
    stroke(2.5pt + rgb("dc2626"))
    line(pC, pD)
    content((0, pD.at(1) + 0.45), [📡])
    content((0.4, 5 * sc), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[Cột $10" m"$])
    
    // Hai dây néo DA và DB
    stroke(1.2pt + rgb("0284c7"))
    line(pD, pA)
    stroke(1.2pt + rgb("059669"))
    line(pD, pB)
    
    // Cung góc DCA = 105 độ và DCB = 75 độ
    draw_angle_arc(pC, 90deg, 195deg, radius: 0.6, stroke: 0.8pt + rgb("0284c7"))
    content((-0.6, 0.6), text(fill: rgb("0284c7"), size: 7.5pt)[$105^circ$])
    
    draw_angle_arc(pC, 15deg, 90deg, radius: 0.5, stroke: 0.8pt + rgb("059669"))
    content((0.5, 0.4), text(fill: rgb("059669"), size: 7.5pt)[$75^circ$])
    
    // Các điểm
    circle(pC, radius: 2.5pt, fill: black)
    content((-0.3, -0.3), text(weight: "bold")[$C$])
    circle(pD, radius: 2.5pt, fill: rgb("dc2626"))
    content((pA.at(0) - 0.4, pA.at(1)), text(weight: "bold")[$A$])
    circle(pA, radius: 2.5pt, fill: rgb("0284c7"))
    circle(pB, radius: 2.5pt, fill: rgb("059669"))
    content((pB.at(0) + 0.4, pB.at(1)), text(weight: "bold")[$B$])
  })
