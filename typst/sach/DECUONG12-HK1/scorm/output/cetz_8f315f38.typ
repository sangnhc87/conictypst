
#import "/sach/DECUONG12-HK1/preamble.typ": *
#set page(width: auto, height: auto, margin: 5pt, fill: none)
#canvas(length: 1cm, {
      import draw: *
      circle((0,0), radius: 2, stroke: 1pt)
      draw-ellipse(0, 1.15, 1.63, 0.4, stroke: 1pt + blue, style: "dashed-back")
      draw-ellipse(0, -1.15, 1.63, 0.4, stroke: 1pt + blue, style: "dashed-back")
      line((-1.63, 1.15), (-1.63, -1.15), stroke: 1pt + blue)
      line((1.63, 1.15), (1.63, -1.15), stroke: 1pt + blue)
    })
