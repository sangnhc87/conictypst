#import "@preview/sang-math:1.0.4": *
#let tn = tn.with(mode: "solcolor", opt-style: "circle")
#show box: it => {
  if it.has("stroke") and it.has("radius") and it.radius == 50% {
    if it.stroke == 0.7pt + black {
      show align: a => a.body
      show text.where(weight: "bold"): t => {
        text(weight: "regular", size: 1em, fill: black)[*#t.text.*]
      }
      it.body
    } else {
      [#it.]
    }
  } else {
    it
  }
}
#tn([Test], (True([Option A]), [Option B]))
