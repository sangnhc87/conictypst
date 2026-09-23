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
    let sc = 0.08
    
    // Mặt đất
    line((-0.8, 0), (45 * sc, 0), stroke: 0.8pt + luma(100))
    
    // Tòa nhà kèm emoji
    rect((38 * sc, 0), (44 * sc, 41.5 * sc), fill: rgb("f8fafc"), stroke: 1.2pt + rgb("1e293b"))
    content((41 * sc, 20 * sc), text(size: 8pt, weight: "bold")[🏢 Tòa nhà])
    
    // Giác kế tại A
    let pA = (0, 1.5 * sc)
    line((0, 0), pA, stroke: 1.8pt + rgb("2563eb"))
    content((-0.4, 0.75 * sc), text(size: 7.5pt)[$1.5" m"$])
    content((0, 1.5 * sc + 0.3), [👁️])
    
    // Đường nằm ngang tầm mắt
    line(pA, (38 * sc, 1.5 * sc), stroke: (paint: luma(140), dash: "dashed", thickness: 0.6pt))
    content((19 * sc, 0.8 * sc), text(size: 8pt)[$40" m"$])
    
    // Tia ngắm lên đỉnh
    let pD = (38 * sc, 41.5 * sc)
    line(pA, pD, stroke: 1.2pt + rgb("dc2626"))
    
    // Góc nâng 45 độ chuẩn
    draw_angle_arc(pA, 0deg, 45deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.2, 1.5 * sc + 0.35), text(fill: rgb("d97706"), size: 8pt)[$45^circ$])
  })
