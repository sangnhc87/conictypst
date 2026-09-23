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
        let sc = 0.12
        
        // Trục tháp thẳng đứng
        line((16 * sc, -4 * sc), (16 * sc, 42 * sc), stroke: 2.2pt + luma(100))
        content((16 * sc + 1.8, 38 * sc), text(weight: "bold")[Tháp canh 🌲])
        
        // Đường gióng ngang tầm mắt
        line((0, 0), (16 * sc, 0), stroke: (paint: luma(120), dash: "dashed", thickness: 0.8pt))
        content((8 * sc, -0.6), text(size: 8.5pt)[$x = O M$])
        
        let pM = (0, 0)
        let pO = (16 * sc, 0)
        let pB = (16 * sc, 4 * sc)
        let pA = (16 * sc, 36 * sc)
        
        // Thân tháp AB tô màu cam đỏ nổi bật
        line(pB, pA, stroke: 5pt + rgb("ea580c"))
        content((16 * sc + 2.5, 20 * sc), text(fill: rgb("ea580c"), weight: "bold")[Tháp ($32" m"$)])
        
        // Tia nhìn
        line(pM, pB, stroke: 1pt + rgb("0284c7"))
        line(pM, pA, stroke: 1.2pt + rgb("2563eb"))
        
        // Các điểm
        circle(pM, radius: 2.5pt, fill: black)
        content((-0.8, 0), text(weight: "bold")[👁️ $M$])
        circle(pO, radius: 2pt, fill: black)
        content((16 * sc + 0.35, -0.3), text(weight: "bold")[$O$])
        circle(pB, radius: 2.5pt, fill: rgb("ea580c"))
        content((16 * sc + 0.4, 4 * sc), text(weight: "bold")[$B (4" m")$])
        circle(pA, radius: 2.5pt, fill: rgb("ea580c"))
        content((16 * sc + 0.4, 36 * sc), text(weight: "bold")[$A (36" m")$])
        
        // Cung góc alpha chuẩn qua draw_angle_arc
        draw_angle_arc(pM, 14deg, 62deg, radius: 1.4, stroke: 1pt + rgb("dc2626"))
        content((1.2, 1.1), text(fill: rgb("dc2626"), weight: "bold")[$alpha$])
    })
