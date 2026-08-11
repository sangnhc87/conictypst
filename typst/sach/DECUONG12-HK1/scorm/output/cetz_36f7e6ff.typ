
#import "@preview/cetz:0.5.2"
#import "/sach/DECUONG12-HK1/preamble.typ": *
#set page(width: auto, height: auto, margin: 5pt, fill: none)
#let draw-ellipse(cx, cy, rx, ry, stroke: 1pt, style: "solid") = {
  let stroke-val = stroke
  import draw: *
  if style == "dashed" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  } else if style == "dashed-back" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  } else {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: stroke-val)
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  }
}
#cetz.canvas({
    import cetz.draw: *
    grid((0, 0), (6, 3), step: 1, stroke: (dash: "dotted", paint: luma(200)))
    line((0, 0), (6.5, 0), mark: (end: ">"), stroke: 1.5pt, name: "t")
    line((0, 0), (0, 3.5), mark: (end: ">"), stroke: 1.5pt, name: "h")
    content((6.2, -0.3), [$t$ (giờ)])
    content((-0.4, 3.2), [$h$ (m)])
    for i in (2, 4, 6) {
      line((i, -0.1), (i, 0.1))
      content((i, -0.4), [#calc.round(i*4)])
    }
    for i in (1, 2, 3) {
      line((-0.1, i), (0.1, i))
      content((-0.4, i), [#i])
    }
    let pts = range(0, 101).map(i => {
      let t = i / 100 * 6
      let y = 1.5 + 1.0 * calc.cos(30deg * t)
      (t, y)
    })
    line(..pts, stroke: 2pt + blue)
  })
