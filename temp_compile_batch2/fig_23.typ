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
            content((-5, 1), $A$)
            line((-4, 1), (8, 1), mark: (end: ">"))
            content((-3, 0.6), [$-3$]); content((-3, 1), text(size: 14pt)[$[$])
            content((4, 0.6), [$4$]); content((4, 1), text(size: 14pt)[$]$])
            gach_cheo(-4, -3, y: 1); gach_cheo(4, 7.8, y: 1)
            
            content((-5, 0), $B$)
            line((-4, 0), (8, 0), mark: (end: ">"))
            content((1, -0.4), [$1$]); content((1, 0), text(size: 14pt)[$($])
            content((6, -0.4), [$6$]); content((6, 0), text(size: 14pt)[$)$])
            gach_cheo(-4, 1, y: 0); gach_cheo(6, 7.8, y: 0)
            
            content((-5, -1), $A cap B$)
            line((-4, -1), (8, -1), mark: (end: ">"))
            content((1, -1.4), [$1$]); content((1, -1), text(size: 14pt)[$($])
            content((4, -1.4), [$4$]); content((4, -1), text(size: 14pt)[$]$])
            gach_cheo(-4, 1, y: -1); gach_cheo(4, 7.8, y: -1)
          })
        ]
    ]
)
