#set text(fill: black)
#let b = box(stroke: 0.7pt + black, radius: 50%, width: 1.3em, height: 1.3em, align(center + horizon)[#text(size: 0.85em, weight: "bold", fill: black)[B]])

#show box: it => {
  if it.has("stroke") and it.stroke == 0.7pt + black and it.has("radius") and it.radius == 50% {
    show align: a => a.body
    show text.where(size: 0.85em): t => text(weight: "bold", size: 14pt)[#t.text.]
    it.body
  } else {
    it
  }
}
#b
