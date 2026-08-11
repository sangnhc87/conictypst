#import "@preview/sang-math:1.0.4": *
#let (tn, ds, tln, tl) = exam-mode(mode: "solcolor", opt-style: "plain")

#show text.where(fill: rgb("#cc2200")): it => {
  if it.has("text") and (it.text == "A" or it.text == "B" or it.text == "C" or it.text == "D") {
    box(
      stroke: 0.7pt + rgb("#cc2200"),
      radius: 50%,
      width: 1.3em,
      height: 1.3em,
      baseline: 0.2em,
      align(center + horizon)[#text(size: 0.85em, weight: "bold", fill: rgb("#cc2201"))[#it.text]]
    )
  } else if it.has("text") and it.text == "." {
    // Hide the dot!
    none
  } else {
    it
  }
}
#tn([Test], (True([Option A]), [Option B]))
