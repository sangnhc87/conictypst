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
        let sc = 0.18
        
        // Trục biển quảng cáo thẳng đứng
        line((14 * sc, 0), (14 * sc, 22 * sc), stroke: 2.2pt + luma(100))
        content((14 * sc + 2.2, 21 * sc), text(weight: "bold")[Trụ màn hình ☀️])
        
        // Đường gióng ngang tầm mắt
        line((0, 0), (14 * sc, 0), stroke: (paint: luma(120), dash: "dashed", thickness: 0.8pt))
        content((7 * sc, -0.6), text(size: 8.5pt)[$x = O M$])
        
        let pM = (0, 0)
        let pO = (14 * sc, 0)
        let pB = (14 * sc, 8 * sc)
        let pA = (14 * sc, 18 * sc)
        
        // Màn hình LED AB tô màu cam đỏ nổi bật
        line(pB, pA, stroke: 5.5pt + rgb("ea580c"))
        content((14 * sc + 2.6, 13 * sc), text(fill: rgb("ea580c"), weight: "bold")[📺 Màn hình ($10" m"$)])
        
        // Tia nhìn tới mép trên và dưới
        line(pM, pB, stroke: 1pt + rgb("0284c7"))
        line(pM, pA, stroke: 1.2pt + rgb("2563eb"))
        
        content((-0.8, 0), [🚗 $M$ (Tài xế)])
        circle(pO, radius: 2pt, fill: black)
        content((14 * sc + 0.35, -0.3), text(weight: "bold")[$O$])
        circle(pB, radius: 2.5pt, fill: rgb("ea580c"))
        content((14 * sc + 0.4, 8 * sc), text(weight: "bold")[$B (8" m")$])
        circle(pA, radius: 2.5pt, fill: rgb("ea580c"))
        content((14 * sc + 0.4, 18 * sc), text(weight: "bold")[$A (18" m")$])
        
        // Cung góc alpha chuẩn qua draw_angle_arc
        draw_angle_arc(pM, 33.7deg, 56.3deg, radius: 1.5, stroke: 1pt + rgb("dc2626"))
        content((1.4, 1.2), text(fill: rgb("dc2626"), weight: "bold")[$alpha$])
    })
