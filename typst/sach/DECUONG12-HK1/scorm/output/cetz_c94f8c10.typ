
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
      
      
      grid((0, 0), (8, 6), step: (1, 1), stroke: (dash: "dotted", paint: luma(200)))
      line((0, 0), (8.5, 0), mark: (end: ">"), stroke: 1.5pt)
      line((0, 0), (0, 6.5), mark: (end: ">"), stroke: 1.5pt)
      content((8.3, -0.4), [$t$ (s)])
      content((-0.8, 6.3), [$V$ (dB)])
      
      for i in (1, 2, 3, 4) {
        let xc = i * 2
        line((xc, -0.1), (xc, 0.1))
        content((xc, -0.4), str(i))
      }
      for i in (70, 90, 110) {
        let yc = (i - 60) * 0.1
        line((-0.1, yc), (0.1, yc))
        content((-0.6, yc), str(i))
      }
      
      let pts = range(0, 401).map(i => {
        let t_val = i / 100
        let v_val = 90 + 20 * calc.sin(360deg * t_val / 2)
        (t_val * 2, (v_val - 60) * 0.1)
      })
      line(..pts, stroke: 1.5pt + red)
    })
