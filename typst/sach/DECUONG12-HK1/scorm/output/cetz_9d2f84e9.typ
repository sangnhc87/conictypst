
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
      line((-3,0), (4,0), stroke: 2pt)
      circle((0, -2), radius: 0.1, fill: black)
      content((0, -2.4), $A$)
      circle((0, 0), radius: 0.1, fill: black)
      content((0, 0.3), $H$)
      circle((3, 0), radius: 0.1, fill: black)
      content((3, 0.3), $B$)
      line((0, -2), (0, 0), stroke: (dash: "dashed"))
      circle((1.5, 0), radius: 0.08, fill: blue)
      content((1.5, 0.3), text(blue)[$X$])
      line((0, -2), (1.5, 0), stroke: 1pt + blue)
      line((1.5, 0), (3, 0), stroke: 1pt + blue)
    }})
