#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let circ = sym.degree
#let c-book = rgb("#0057b8")
#let accent = rgb("#0057b8")
#let pm = sym.plus.minus

#canvas({
                import cetz.draw: *
                rect((0,0), (3, 1.5), stroke: black)
                line((0,0), (3, 1.5), stroke: (paint: red, dash: "dashed"))
                line((0,1.5), (3, 0), stroke: (paint: blue, dash: "dashed"))
                content((1.5, -0.4), [*Hai đường chéo bằng nhau*])
            })