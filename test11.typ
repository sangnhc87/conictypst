#import "@preview/sang-math:1.0.4": *
#let tn = tn.with(mode: "solcolor", opt-style: "circle")
#show box: it => {
  if it.has("stroke") and it.stroke == 0.7pt + black and it.has("radius") and it.radius == 50% {
    show align: a => a.body
    show text.where(size: 0.85em): t => text(weight: "bold", size: 1em, fill: black)[#t.text.]
    it.body
  } else {
    it
  }
}
#tn([Test], (True([Option A]), [Option B]))
