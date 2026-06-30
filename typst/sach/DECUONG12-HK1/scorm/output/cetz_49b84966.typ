
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
      
      rect((-3,-3), (3,3), stroke: 1pt)
      
      rect((-3,-3), (-2,-2), fill: rgb("eee"))
      rect((2,-3), (3,-2), fill: rgb("eee"))
      rect((-3,2), (-2,3), fill: rgb("eee"))
      rect((2,2), (3,3), fill: rgb("eee"))
      
      line((-2,-2), (2,-2), stroke: (dash: "dashed", paint: blue))
      line((-2,2), (2,2), stroke: (dash: "dashed", paint: blue))
      line((-2,-2), (-2,2), stroke: (dash: "dashed", paint: blue))
      line((2,-2), (2,2), stroke: (dash: "dashed", paint: blue))
      
      content((-2.5,-2.5), $x$)
      content((0,-3.3), $60$)
      line((-3,-3.1), (3,-3.1), mark: (start: ">", end: ">"), stroke: 0.5pt)
    }})
