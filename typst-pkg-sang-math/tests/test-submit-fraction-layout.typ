// Contract test for the second package copy used by the Typst Universe
// submission. Keep its fraction behaviour aligned with the canonical source.
#import "../../typst-pkg-submit/lib.typ": sang-setup, dfrac, tfrac

#set page(width: 10cm, height: auto, margin: 10mm)
#show: sang-setup

- Default display fraction: $1/2$
- Nested display fraction: $(a/b)/(c/d)$
- Explicit small fraction: $tfrac(1, 2)$

#box[A] <submit-before> $x^2 + 1$ #box[B] <submit-after>
#box[A] <submit-frac-before> $y=(x^2-2x+5)/(x-1)$ #box[B] <submit-frac-after>

#context {
  let large = measure(box[$1/2$])
  let explicit-large = measure(box[$dfrac(1, 2)$])
  let small = measure(box[$tfrac(1, 2)$])
  let before-y = query(<submit-before>).first().location().position().y
  let after-y = query(<submit-after>).first().location().position().y
  assert(large.height > small.height, message: "Bản submit: phân số mặc định phải lớn hơn tfrac")
  assert(explicit-large.height > small.height, message: "Bản submit: dfrac phải lớn hơn tfrac")
  assert(calc.abs(before-y - after-y) < 1pt, message: "Bản submit: công thức phải nằm cùng dòng với văn bản")
  let frac-before-y = query(<submit-frac-before>).first().location().position().y
  let frac-after-y = query(<submit-frac-after>).first().location().position().y
  assert(calc.abs(frac-before-y - frac-after-y) < 1pt, message: "Bản submit: phân số không được làm lệch baseline")
}
