#import "@preview/sang-math:1.0.4": *
#let tn = tn.with(mode: "solcolor", opt-style: "circle")
#show box: it => {
  if it.has("stroke") and it.has("radius") and it.radius == 50% {
    if it.stroke == 0.7pt + black {
      let b = box(
        width: 1.3em,
        height: 1.3em,
        {
          show text.where(weight: "bold"): t => text(weight: "regular", size: 1em, fill: black)[*#t.text*]
          it.body
        }
      )
      [#b.]
    } else {
      [#it.]
    }
  } else {
    it
  }
}
#tn([Test], (True([Option A]), [Option B]))
