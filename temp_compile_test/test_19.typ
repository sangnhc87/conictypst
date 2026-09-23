#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  // fallback if any
}

#canvas({
                import cetz.draw: *
                // Tam giác 1
                line((0,0), (2,0), (1,1.5), close: true, fill: blue.lighten(80%), stroke: blue)
                content((1, -0.4), [$Delta_1$])
                // Tam giác 2
                line((4,0), (6,0), (5,1.5), close: true, fill: blue.lighten(80%), stroke: blue)
                content((5, -0.4), [$Delta_2$])
                
                content((3, 0.75), [$=>$])
                content((3, 1.2), [$S_1 = S_2$])
            })
