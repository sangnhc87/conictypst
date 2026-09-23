#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw

#canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            let sc = 0.55
            let xmin = -1.0 * sc
            let xmax = 4.5 * sc
            let ymin = -1.0 * sc
            let ymax = 5.5 * sc
            
            let sx(x) = x * sc
            let sy(y) = y * sc
            
            // Lưới mờ
            for x in range(-1, 5) { line((sx(x), ymin), (sx(x), ymax), stroke: 0.2pt + rgb("e2e8f0")) }
            for y in range(-1, 6) { line((xmin, sy(y)), (xmax, sy(y)), stroke: 0.2pt + rgb("e2e8f0")) }
            
            // Miền nghiệm xanh
            fill(rgb("eff6ff"))
            stroke(none)
            line((sx(-1), sy(-1)), (sx(0), sy(-1)), (sx(2), sy(3)), (sx(-0.5), sy(5.5)), (sx(-1), sy(5.5)), close: true)
            
            // Trục tọa độ
            line((xmin - 0.2, 0), (xmax + 0.3, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((xmax + 0.45, 0), [$x$])
            line((0, ymin - 0.2), (0, ymax + 0.3), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((0, ymax + 0.45), [$y$])
            content((-0.2, -0.2), [$O$])
            
            // Đường thẳng biên
            line((sx(-0.5), sy(5.5)), (sx(4.5), sy(0.5)), stroke: 1.1pt + rgb("2563eb"))
            content((sx(3.8), sy(1.8)), text(fill: rgb("2563eb"), size: 7.5pt, weight: "bold")[$d_1$])
            
            line((sx(0), sy(-1)), (sx(3), sy(5)), stroke: 1.1pt + rgb("059669"))
            content((sx(2.8), sy(4.8)), text(fill: rgb("059669"), size: 7.5pt, weight: "bold")[$d_2$])
            
            // Đường x = 2
            line((sx(2), ymin), (sx(2), ymax), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 0.9pt))
            content((sx(2) + 0.45, sy(5.0)), text(fill: rgb("dc2626"), size: 7.5pt)[$x = 2$])
            
            // Đỉnh M(2; 3)
            circle((sx(2), sy(3)), radius: 2.2pt, fill: rgb("dc2626"), stroke: black)
            content((sx(2) + 0.65, sy(3) + 0.2), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$M(2; 3)$])
          })
