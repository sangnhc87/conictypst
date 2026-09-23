#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw

#canvas({
          import cetz.draw: *
          for x in range(5) {
            line((x, 0), (x, 4), stroke: 0.5pt + gray)
          }
          for y in range(5) {
            line((0, y), (4, y), stroke: 0.5pt + gray)
          }
          circle((0, 0), radius: 0.12, fill: accent)
          content((0, -0.3), [$O(0,0)$])
          circle((4, 4), radius: 0.12, fill: accent)
          content((4, 4.3), [$B(4,4)$])
          
          // Đoạn đường cấm MN
          line((2, 2), (2, 3), stroke: 2pt + red)
          circle((2, 2), radius: 0.1, fill: red)
          circle((2, 3), radius: 0.1, fill: red)
          content((1.6, 2.5), [Cấm], fill: red)
        })