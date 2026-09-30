// Tình huống 05: Nhiều mã đề, ưu tiên câu ít dùng, cùng seed cho cùng kết quả.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 18mm)

#let bank = range(9).map(i => question(
  id: "Q-" + str(i + 1), kind: QUESTION_MC,
  prompt: [Câu số #str(i + 1): tính #str(i + 1) + 1.],
  choices: (choice([0]), choice([#str(i + 2)], correct: true), choice([20]), choice([30])),
  answer: answer("choice", 2), difficulty: 2,
))
#let blueprint = ((kind: QUESTION_MC, difficulty: 2, count: 3, title: [Phần trắc nghiệm]),)
#let codes = ("0101", "0102", "0103")
#let versions = exam-variants(bank, blueprint, codes, seed: 2026)
#assert(versions == exam-variants(bank, blueprint, codes, seed: 2026))
#let ids = versions.map(v => v.questions.map(q => q.id)).flatten()
#assert(ids.all(id => ids.filter(other => other == id).len() == 1))

#for (i, variant) in versions.enumerate() {
  if i > 0 { pagebreak() }
  heading([Mã đề #variant.ma-de], level: 1)
  render-exam-variant(variant)
}
