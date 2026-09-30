#import "../../lib.typ": *

#let item(id) = question(
  id: id, kind: QUESTION_MC, prompt: [Tính $1+1$.],
  choices: (choice([1]), choice([2], correct: true), choice([3]), choice([4])),
  answer: answer("choice", 2),
)
#let case = sys.inputs.at("case")
#if case == "quota" {
  exam-variant((item("Q1"),), ((kind: QUESTION_MC, count: 2),), ma-de: "0001")
} else if case == "duplicate-id" {
  exam-variant((item("Q1"), item("Q1")), ((kind: QUESTION_MC, count: 1),), ma-de: "0001")
} else if case == "duplicate-code" {
  exam-variants((item("Q1"),), ((kind: QUESTION_MC, count: 1),), ("1", "0001"))
} else if case == "bad-code" {
  exam-variant((item("Q1"),), ((kind: QUESTION_MC, count: 1),), ma-de: "ABCD")
} else if case == "unknown-field" {
  exam-variant((item("Q1"),), ((kind: QUESTION_MC, count: 1, difficutly: 3),), ma-de: "0001")
} else if case == "bad-tags" {
  exam-variant((item("Q1"),), ((kind: QUESTION_MC, count: 1, tags: "math"),), ma-de: "0001")
} else if case == "bad-difficulty" {
  exam-variant((item("Q1"),), ((kind: QUESTION_MC, count: 1, difficulty: 9),), ma-de: "0001")
} else if case == "bad-seed" {
  exam-variant((item("Q1"),), ((kind: QUESTION_MC, count: 1),), seed: "random", ma-de: "0001")
} else if case == "bad-filter-kind" {
  bank-filter((item("Q1"),), kind: "multiple-choice")
} else if case == "bad-profile-type" {
  let variant = exam-variant((item("Q1"),), ((kind: QUESTION_MC, count: 1),), ma-de: "0001")
  exam-variant-qr-payload(variant, profile: (id: "custom", mcq: "one", tf: 0, tln: 0, paper: "a4"))
} else if case == "profile" {
  let variant = exam-variant((item("Q1"),), ((kind: QUESTION_MC, count: 1),), ma-de: "0001")
  exam-variant-qr(variant)
}
