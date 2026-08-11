#import "@preview/sang-math:1.0.4": *
#let tn = tn.with(mode: "solcolor", opt-style: "circle")
#show box: it => {
  if it.has("stroke") and it.has("radius") and it.radius == 50% {
    if it.stroke == 0.7pt + black {
      panic("MATCHED BLACK!")
    }
  }
  it
}
#tn([Test], (True([Option A]), [Option B]))
