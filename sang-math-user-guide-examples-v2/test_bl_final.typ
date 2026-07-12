#set page(width: 400pt, height: 200pt, margin: 10pt)

#let col = blue
#let calli-font = ("Apple Chancery", "cursive")
#let content = text(size: 0.86em, weight: "bold", fill: col)[A]

// Chuẩn: circle
#let circle-lbl = box(stroke: 0.75pt + col, radius: 50%, width: 1.35em, height: 1.35em, align(center + horizon)[#content])

// Thử calligraphy với các baseline khác nhau
#let c-auto = box(width:1.45em, height:1.45em, align(center + horizon)[#text(font:calli-font, size:1.4em, weight:"bold", fill:col)[A.]])
#let c-b65  = box(width:1.45em, height:1.45em, baseline:65%)[#place(center+horizon)[#text(font:calli-font, size:1.4em, weight:"bold", fill:col)[A.]]]
#let c-b68  = box(width:1.45em, height:1.45em, baseline:68%)[#place(center+horizon)[#text(font:calli-font, size:1.4em, weight:"bold", fill:col)[A.]]]
#let c-b70  = box(width:1.45em, height:1.45em, baseline:70%)[#place(center+horizon)[#text(font:calli-font, size:1.4em, weight:"bold", fill:col)[A.]]]

// Thử vietnam-star với baseline khác nhau
#let star(bl) = box(width:1.45em, height:1.45em, fill:rgb("da251d"), radius:50%, baseline:bl)[
  #place(polygon(fill:rgb("ffce00"),stroke:none,(50%,5%),(61%,38%),(95%,38%),(68%,59%),(79%,95%),(50%,73%),(21%,95%),(32%,59%),(5%,38%),(39%,38%)))
  #place(center+horizon)[#text(size:0.65em, weight:"bold", fill:rgb("da251d"))[A.]]
]

Dòng test 1 — circle: #circle-lbl | auto: #c-auto | 65%: #c-b65 | 68%: #c-b68 | 70%: #c-b70

Dòng test 2 — circle: #circle-lbl | star-65%: #star(65%) | star-68%: #star(68%) | star-70%: #star(70%) | star-72%: #star(72%)
