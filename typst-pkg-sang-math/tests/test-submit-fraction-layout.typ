// Contract test for the second package copy used by the Typst Universe
// submission. Keep its fraction behaviour aligned with the canonical source.
#import "../../typst-pkg-submit/lib.typ": sang-setup, dfrac, tfrac

#set page(width: 10cm, height: auto, margin: 10mm)
#show: sang-setup

- Default display fraction: $1/2$
- Nested display fraction: $(a/b)/(c/d)$
- Explicit small fraction: $tfrac(1, 2)$

#context {
  let large = measure(box[$1/2$])
  let explicit-large = measure(box[$dfrac(1, 2)$])
  let small = measure(box[$tfrac(1, 2)$])
  assert(large.height > small.height, message: "Bản submit: phân số mặc định phải lớn hơn tfrac")
  assert(explicit-large.height > small.height, message: "Bản submit: dfrac phải lớn hơn tfrac")
}
