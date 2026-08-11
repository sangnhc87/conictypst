#set text(fill: black)
#let a = box(stroke: 0.7pt + black, radius: 50%, width: 1.3em, height: 1.3em, align(center + horizon)[#text(size: 0.85em, weight: "bold", fill: black)[B]])
#let b = box(stroke: 0.7pt + rgb("#cc2200"), radius: 50%, width: 1.3em, height: 1.3em, align(center + horizon)[#text(size: 0.85em, weight: "bold", fill: rgb("#cc2200"))[A]])

#show box: it => {
  if it.has("stroke") and it.stroke == 0.7pt + black and it.has("radius") and it.radius == 50% {
    text(weight: "bold")[#it.body.]
  } else {
    it
  }
}

#a
#b
