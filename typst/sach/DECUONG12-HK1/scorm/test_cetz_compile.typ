#import "/sach/DECUONG12-HK1/preamble.typ": *
#set page(width: auto, height: auto, margin: 5pt, fill: none)
#canvas({
{
import cetz.draw: *
line((-3.14, 0), (3.14, 0), mark: (end: ">"), name: "x")
line((0, -1.5), (0, 1.5), mark: (end: ">"), name: "y")
content((3.3, -0.3), [x])
content((-0.3, 1.3), [y])
content((-0.2, -0.2), [O])

let pts = ()
for i in range(0, 100) {
let x = -3.14159 + (i/99) * 6.28318
pts.push((x, calc.sin(x * 1rad)))
}
line(..pts, stroke: 1pt + blue)
}
})
