
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
        line((-3.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
        content((2.5, 0), $x$, anchor: "north", padding: 2pt)
        line((0, -2.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
        content((0, 3.5), $y$, anchor: "west", padding: 2pt)
        content((0.2, -0.2), $O$)
        
        
        line((-1, -2.5), (-1, 3.5), stroke: (dash: "dashed", paint: red))
        line((-3.5, 1), (2.5, 1), stroke: (dash: "dashed", paint: red))
        
        let pts1 = ()
        let pts2 = ()
        for i in range(-35, -12) {
          let x = i / 10
          let y = (x - 2)/(x + 1)
          if y >= -2.4 and y <= 3.4 { pts1.push((x, y)) }
        }
        for i in range(-8, 25) {
          let x = i / 10
          let y = (x - 2)/(x + 1)
          if y >= -2.4 and y <= 3.4 { pts2.push((x, y)) }
        }
        line(..pts1, stroke: 1.2pt + blue)
        line(..pts2, stroke: 1.2pt + blue)
      }})
