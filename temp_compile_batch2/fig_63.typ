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
        let sc = 0.15
        
        // Trục chân tháp hải đăng
        line((20 * sc, 0), (20 * sc, 32 * sc), stroke: 2.2pt + luma(80))
        content((20 * sc + 1.2, 30 * sc), text(weight: "bold")[🗼 Hải đăng])
        
        // Mặt biển nằm ngang
        line((-2 * sc, 0), (22 * sc, 0), stroke: 1pt + rgb("0284c7"))
        content((10 * sc, -1.2), text(fill: rgb("0284c7"), size: 8.5pt)[🌊 Mặt biển ($x = H M$)])
        
        let pM = (0, 0)
        let pH = (20 * sc, 0)
        let pB = (20 * sc, 12 * sc)
        let pA = (20 * sc, 27 * sc)
        
        // Dàn đèn AB nổi bật
        line(pB, pA, stroke: 4.5pt + rgb("eab308"))
        content((20 * sc + 1.5, 19.5 * sc), text(fill: rgb("ca8a04"), weight: "bold")[Dàn đèn ($15" m"$)])
        
        // Tia nhìn
        line(pM, pB, stroke: 1pt + rgb("0d9488"))
        line(pM, pA, stroke: 1.2pt + rgb("059669"))
        
        content((-0.8, 0), [⛵ $M$])
        circle(pH, radius: 2pt, fill: black)
        content((20 * sc + 0.4, -0.35), text(weight: "bold")[$H$])
        circle(pB, radius: 2.5pt, fill: rgb("ca8a04"))
        content((20 * sc + 0.4, 12 * sc), text(weight: "bold")[$B (12" m")$])
        circle(pA, radius: 2.5pt, fill: rgb("ca8a04"))
        content((20 * sc + 0.4, 27 * sc), text(weight: "bold")[$A (27" m")$])
        
        // Cung góc alpha chuẩn qua draw_angle_arc
        draw_angle_arc(pM, 31deg, 53.5deg, radius: 1.5, stroke: 1pt + rgb("d97706"))
        content((1.3, 1.2), text(fill: rgb("d97706"), weight: "bold")[$alpha$])
    })
