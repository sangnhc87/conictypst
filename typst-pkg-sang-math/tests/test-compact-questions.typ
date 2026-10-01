#import "../lib.typ": *
#let (tn, ds, tln, tl) = bank-mode()

#let a = tn(
  [Đạo hàm của $x^2$ là?],
  ([$x$], True([$2x$]), [$x^2$], [$2$]),
  id: "1D7N2-1",
  loigiai: [$(x^2)'=2x$.],
)
#assert(a.kind == QUESTION_MC)
#assert(a.grade == 11)
#assert(a.chapter == "1D7")
#assert(a.topic == "1D7-2-1")
#assert(a.difficulty == 1)
#assert(a.metadata.at("bank-id") == "1D7N2-1")
#assert(a.choices.at(1).correct)
#let with-extra = tn([Đạo hàm của $x^2$ là?], ([$x$], True([$2x$])), id: "1D7N2-1", tags: ("kiem-tra",), points: 0.25, metadata: (source-page: 12))
#assert(with-extra.tags == ("kiem-tra",))
#assert(with-extra.points == 0.25)
#assert(with-extra.metadata.at("bank-id") == "1D7N2-1")
#assert(with-extra.metadata.at("source-page") == 12)

#let b = ds([Xét đúng sai], (True([Mệnh đề 1]), [Mệnh đề 2]), id: "1H4H1-1")
#assert(b.kind == QUESTION_TF)
#assert(b.grade == 11)
#assert(b.difficulty == 2)
#let c = tln([Tính kết quả], 4, id: "0C1V1-1")
#assert(c.kind == QUESTION_SA)
#assert(c.grade == 10)
#assert(c.difficulty == 3)
#let d = tl([Chứng minh], id: "2D4C1-1", loigiai: [Lời giải.])
#assert(d.kind == QUESTION_WRITTEN)
#assert(d.difficulty == 4)

#let bank = question-bank(a, b, c, d)
#assert(bank-filter(bank, grade: 11, difficulty: 1).len() == 1)
#assert(bank-filter(bank, id-prefix: "1D7").len() == 1)
#let variant = exam-variant(bank, ((kind: QUESTION_MC, count: 1),), seed: 5)
#assert(variant.questions.len() == 1)
#assert(variant.questions.at(0).choices.filter(c => c.correct).len() == 1)

// Two actual questions can share one bank.json category code.
#let a2 = tn([Đạo hàm của $x^3$ là?], ([$x^2$], True([$3x^2$]), [$3x$], [$x^3$]), id: "1D7N2-1")
#let same-code-bank = question-bank(a, a2)
#let balanced = exam-variants(same-code-bank, ((kind: QUESTION_MC, count: 1),), ("0101", "0102"), seed: 23)
#assert(balanced.at(0).questions.first().prompt != balanced.at(1).questions.first().prompt)
#assert(balanced.map(v => v.questions.first().id) == ("1D7N2-1", "1D7N2-1"))
#assert(exam-variant(same-code-bank, ((kind: QUESTION_MC, id-prefix: "1D7", count: 2),), seed: 3).questions.len() == 2)

#render-question(a)
