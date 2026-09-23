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
    let sc = 0.003
    
    // Đường nằm ngang cơ sở
    line((0, 0), (2000 * sc, 0), stroke: 0.6pt + luma(160))
    
    let pA = (0, 0)
    let pB = (800 * 0.94 * sc, 800 * 0.342 * sc)
    let pC = (pB.at(0) + 1200 * 0.819 * sc, pB.at(1) + 1200 * 0.574 * sc)
    
    // Dây cáp treo hai nhịp
    stroke(2.2pt + rgb("0284c7"))
    line(pA, pB)
    stroke(2.2pt + rgb("2563eb"))
    line(pB, pC)
    
    // Cabin cáp treo emoji
    content((pB.at(0)/2, pB.at(1)/2 + 0.35), [🚡])
    content(((pB.at(0)+pC.at(0))/2, (pB.at(1)+pC.at(1))/2 + 0.35), [🚡])
    
    // Trụ B thẳng đứng
    stroke(1.2pt + luma(80))
    line((pB.at(0), 0), pB)
    content((pB.at(0), -0.3), text(size: 8pt)[Trụ $B$])
    
    // Trụ C ga đỉnh
    stroke(1.2pt + luma(80))
    line((pC.at(0), 0), pC)
    content((pC.at(0), -0.3), text(size: 8pt)[Ga đỉnh $C$])
    content((pC.at(0) + 0.5, pC.at(1) + 0.2), [🏔️])
    
    // Các điểm
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) - 0.3, 0), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: rgb("0284c7"))
    content((pB.at(0) - 0.3, pB.at(1) + 0.2), text(weight: "bold")[$B$])
    circle(pC, radius: 2.5pt, fill: rgb("2563eb"))
    content((pC.at(0) + 0.35, pC.at(1)), text(weight: "bold")[$C$])
    
    // Cung góc nghiêng 20 độ và 35 độ
    draw_angle_arc(pA, 0deg, 20deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.1, 0.2), text(fill: rgb("d97706"), size: 7.5pt)[$20^circ$])
    
    line(pB, (pB.at(0) + 300 * sc, pB.at(1)), stroke: (paint: luma(140), dash: "dotted", thickness: 0.6pt))
    draw_angle_arc(pB, 0deg, 35deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((pB.at(0) + 0.9, pB.at(1) + 0.3), text(fill: rgb("d97706"), size: 7.5pt)[$35^circ$])
    
    // Nhãn chiều dài
    content((pB.at(0)/2 - 0.4, pB.at(1)/2 - 0.3), text(fill: rgb("0284c7"), size: 8.5pt)[$800" m"$])
    content(((pB.at(0)+pC.at(0))/2 - 0.4, (pB.at(1)+pC.at(1))/2 - 0.3), text(fill: rgb("2563eb"), size: 8.5pt)[$1200" m"$])
  })
