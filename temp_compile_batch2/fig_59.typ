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
            let sc = 0.5
            let xmin = -0.5 * sc
            let xmax = 5.5 * sc
            let ymin = -0.5 * sc
            let ymax = 6.0 * sc
            
            let sx(x) = x * sc
            let sy(y) = y * sc
            
            // Trục tọa độ
            line((xmin, 0), (xmax + 0.3, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((xmax + 0.45, 0), [$x$])
            line((0, ymin), (0, ymax + 0.3), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((0, ymax + 0.45), [$y$])
            content((-0.2, -0.2), [$O$])
            
            // Hình chữ nhật ABCD
            rect((sx(1), sy(1)), (sx(4), sy(5)), fill: rgb("eff6ff"), stroke: 1.1pt + rgb("2563eb"))
            content((sx(2.5), sy(3)), text(fill: rgb("1d4ed8"), weight: "bold", size: 8pt)[$S = 12$])
            
            // Các đường thẳng m = 2, m = 9
            line((sx(0), sy(2)), (sx(2), sy(0)), stroke: (paint: rgb("059669"), dash: "dotted", thickness: 0.8pt))
            content((sx(0.5), sy(1.8)), text(fill: rgb("059669"), size: 6.5pt)[$m = 2$])
            
            line((sx(3), sy(6)), (sx(6), sy(3)), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 1pt))
            content((sx(5.2), sy(4.2)), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$x + y = 9$])
            
            // Đỉnh C(4; 5)
            circle((sx(4), sy(5)), radius: 2.2pt, fill: rgb("dc2626"), stroke: black)
            content((sx(4) + 0.65, sy(5) + 0.2), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(4; 5)$])
          })
