#set page(width: 400pt, height: 100pt, margin: 10pt)
#let col = blue
#let content = text(size: 0.86em, weight: "bold", fill: col)[A]
#let circle-lbl = box(stroke: 0.75pt + col, radius: 50%, width: 1.35em, height: 1.35em, align(center + horizon)[#content])

#let star(bl) = box(width:1.45em, height:1.45em, fill:rgb("da251d"), radius:50%, baseline:bl)[
  #place(polygon(fill:rgb("ffce00"),stroke:none,(50%,5%),(61%,38%),(95%,38%),(68%,59%),(79%,95%),(50%,73%),(21%,95%),(32%,59%),(5%,38%),(39%,38%)))
  #place(center+horizon)[#text(size:0.65em, weight:"bold", fill:rgb("da251d"))[A.]]
]

Dòng 2 — circle: #circle-lbl | star-38%: #star(38%) | star-40%: #star(40%) | star-43%: #star(43%) | star-45%: #star(45%)
