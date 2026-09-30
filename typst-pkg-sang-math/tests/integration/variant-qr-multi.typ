#import "../../lib.typ": *

#let q1 = question(id: "A", kind: QUESTION_MC, prompt: [Câu A], choices: (
  choice([A], correct: true), choice([B]), choice([C]), choice([D]),
), answer: answer("choice", 1))
#let q2 = question(id: "B", kind: QUESTION_MC, prompt: [Câu B], choices: (
  choice([A]), choice([B]), choice([C]), choice([D], correct: true),
), answer: answer("choice", 4))
#let versions = exam-variants((q1, q2), ((kind: QUESTION_MC, count: 1),), ("0101", "0102"), seed: 19, shuffle-choices: false)
#assert(versions.at(0).questions.first().id != versions.at(1).questions.first().id)
#let profile = (id: "custom", mcq: 1, tf: 0, tln: 0, paper: "a4")
#let key-a = exam-variant-qr-payload(versions.at(0), profile: profile)
#let key-b = exam-variant-qr-payload(versions.at(1), profile: profile)
#assert(key-a.starts-with("SMKEY:1:"))
#assert(key-a != key-b)
#set page(margin: 20mm)
Mã 0101
#exam-variant-qr(versions.at(0), profile: profile, width: 5cm)
#pagebreak()
Mã 0102
#exam-variant-qr(versions.at(1), profile: profile, width: 5cm)
