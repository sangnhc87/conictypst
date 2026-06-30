
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
#canvas({length: 1cm, {
      import draw: *
      line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
      content((2.5, 0), $x$, anchor: "north", padding: 2pt)
      line((0, -2.5), (0, 4.5), mark: (end: ">"), stroke: 0.5pt)
      content((0, 4.5), $y$, anchor: "west", padding: 2pt)
      content((0.2, -0.2), $O$)
      
      let pts = ()
      for i in range(-24, 24) {
        let x = i / 10
        let y = -calc.pow(x, 4) + 4 * calc.pow(x, 2)
        if y >= -2.4 and y <= 4.4 and x >= -2.4 and x <= 2.4 {
          pts.push((x, y))
        }
      }
      line(..pts, stroke: 1.2pt + blue)
      
      
      let sqrt2 = 1.414
      line((sqrt2, 0), (sqrt2, 4), stroke: (dash: "dashed", paint: gray))
      line((-sqrt2, 0), (-sqrt2, 4), stroke: (dash: "dashed", paint: gray))
      line((-sqrt2, 4), (sqrt2, 4), stroke: (dash: "dashed", paint: gray))
      
      content((sqrt2, -0.3), $sqrt(2)$)
      content((-sqrt2, -0.3), $-sqrt(2)$)
      content((-0.2, 4), $4$, anchor: "east")
    }})
