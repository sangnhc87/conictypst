#import "@preview/sang-math:1.0.4": *
#let preset = exam-preset(profile: "solcolor", opt-style: "circled")
#let (tn, ds, tln, tl) = exam-mode(..preset.question)
#tn([Test], (True([Option A]), [Option B]))
