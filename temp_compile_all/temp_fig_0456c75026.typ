#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let gach_cheo(x1, x2, y: 0, h: 0.15) = {
  import cetz.draw: *
  let step = 0.15
  let n = std.int((x2 - x1) / step)
  for i in std.range(n + 1) {
    let px = x1 + i * step
    line((px, y + h), (px - h, y - h), stroke: 0.5pt + rgb("555"))
  }
}

#canvas({
            import cetz.draw: *
            content((-4, 1), $A$)
            line((-3, 1), (7, 1), mark: (end: ">"))
            content((2, 0.6), [$m$]); content((2, 1), text(size: 14pt)[$]$])
            gach_cheo(2, 6.8, y: 1)
            
            content((-4, 0), $B$)
            line((-3, 0), (7, 0), mark: (end: ">"))
            content((3, -0.4), [$3$]); content((3, 0), text(size: 14pt)[$($])
            gach_cheo(-3, 3, y: 0)
          })