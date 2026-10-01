#import "../../lib.typ": *
#let (tn, ds, tln, tl) = bank-mode()
#let case = sys.inputs.at("case")
#let stem = [Đạo hàm của $x^2$ là gì?]
#let options = ([$x$], True([$2x$]), [$x^2$], [$2$])
#if case == "missing-id" {
  tn(stem, options)
} else if case == "malformed-id" {
  tn(stem, options, id: "D12-001")
} else if case == "wrong-type" {
  tn(stem, options, id: 123)
} else if case == "repeated-grade" {
  tn(stem, options, id: "1D7N2-1", grade: 12)
} else if case == "unknown-field" {
  tn(stem, options, id: "1D7N2-1", difficutly: 1)
} else if case == "bad-metadata" {
  tn(stem, options, id: "1D7N2-1", metadata: "bad")
} else if case == "bad-prefix" {
  bank-filter((tn(stem, options, id: "1D7N2-1"),), id-prefix: "")
}
