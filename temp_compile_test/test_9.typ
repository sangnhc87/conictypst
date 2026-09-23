#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  // fallback if any
}

#canvas(length: 1cm, {
      import draw: *
      // Tấm bìa trải phẳng
      rect((-3,-3), (3,3), stroke: 1pt)
      // Các ô vuông bị cắt
      rect((-3,-3), (-2,-2), fill: rgb("eee"))
      rect((2,-3), (3,-2), fill: rgb("eee"))
      rect((-3,2), (-2,3), fill: rgb("eee"))
      rect((2,2), (3,3), fill: rgb("eee"))
      // Đường gấp
      line((-2,-2), (2,-2), stroke: (dash: "dashed", paint: blue))
      line((-2,2), (2,2), stroke: (dash: "dashed", paint: blue))
      line((-2,-2), (-2,2), stroke: (dash: "dashed", paint: blue))
      line((2,-2), (2,2), stroke: (dash: "dashed", paint: blue))
      // Ghi chú
      content((-2.5,-2.5), $x$)
      content((0,-3.3), $60$)
      line((-3,-3.1), (3,-3.1), mark: (start: ">", end: ">"), stroke: 0.5pt)
    })
