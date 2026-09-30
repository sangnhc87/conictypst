#import "../../lib.typ": question, choice, answer, validate-question

#let case = sys.inputs.at("case", default: "index")
#let q = if case == "index" {
  question(id: "BAD-INDEX", kind: "mcq", prompt: [Q], choices: (choice([A]), choice([B])), answer: answer("choice", 5))
} else if case == "multiple" {
  question(id: "BAD-MULTIPLE", kind: "mcq", prompt: [Q], choices: (choice([A], correct: true), choice([B], correct: true)))
} else if case == "points" {
  question(id: "BAD-POINTS", kind: "short-answer", prompt: [Q], points: -1)
} else {
  question(id: "BAD-META", kind: "written-response", prompt: [Q], metadata: "bad")
}
#let _ = validate-question(q)
