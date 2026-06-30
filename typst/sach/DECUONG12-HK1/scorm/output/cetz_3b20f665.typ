
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
      circle((0,0), radius: 2, stroke: 1pt)
      draw-ellipse(0, 1.15, 1.63, 0.4, stroke: 1pt + blue, style: "dashed-back")
      draw-ellipse(0, -1.15, 1.63, 0.4, stroke: 1pt + blue, style: "dashed-back")
      line((-1.63, 1.15), (-1.63, -1.15), stroke: 1pt + blue)
      line((1.63, 1.15), (1.63, -1.15), stroke: 1pt + blue)
    }})
