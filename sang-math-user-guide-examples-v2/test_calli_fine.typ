#set page(width: 400pt, height: 80pt, margin: 10pt)
#let col = blue
#let calli-font = ("Apple Chancery", "Brush Script MT", "cursive")
#let content = text(size: 0.86em, weight: "bold", fill: col)[A]
#let circle-lbl = box(stroke: 0.75pt + col, radius: 50%, width: 1.35em, height: 1.35em, align(center + horizon)[#content])

#let c(bl) = box(width:1.45em, height:1.45em, baseline:bl)[#place(center+horizon)[#text(font:calli-font, size:1.4em, weight:"bold", fill:col)[A.]]]

Dòng — circle: #circle-lbl | 70%: #c(70%) | 73%: #c(73%) | 75%: #c(75%) | 78%: #c(78%) | 80%: #c(80%)
