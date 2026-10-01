// Tình huống 05: Nhiều mã đề, ưu tiên câu ít dùng, cùng seed cho cùng kết quả.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 18mm)

#let (tn, ds, tln, tl) = bank-mode()
#let bank = range(9).map(i => tn(
  [Câu số #str(i + 1). Đạo hàm của $x^2$ là gì?],
  ([$x$], True([$2x$]), [$x^2$], [$2$]), id: "1D7H2-1",
))
#let blueprint = ((kind: QUESTION_MC, difficulty: 2, count: 3, title: [Phần trắc nghiệm]),)
#let codes = ("0101", "0102", "0103")
#let versions = exam-variants(bank, blueprint, codes, seed: 2026)
#assert(versions == exam-variants(bank, blueprint, codes, seed: 2026))
#let prompts = versions.map(v => v.questions.map(q => q.prompt)).flatten()
#assert(prompts.all(p => prompts.filter(other => other == p).len() == 1))

#for (i, variant) in versions.enumerate() {
  if i > 0 { pagebreak() }
  heading([Mã đề #variant.ma-de], level: 1)
  render-exam-variant(variant)
}
