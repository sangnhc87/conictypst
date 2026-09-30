#import "../../lib.typ": question, choice, answer, validate-question

#let case = sys.inputs.at("case", default: "index")
#let q = if case == "index" {
  question(id: "BAD-INDEX", kind: "mcq", prompt: [Q], choices: (choice([A]), choice([B])), answer: answer("choice", 5))
} else if case == "multiple" {
  question(id: "BAD-MULTIPLE", kind: "mcq", prompt: [Q], choices: (choice([A], correct: true), choice([B], correct: true)))
} else if case == "points" {
  question(id: "BAD-POINTS", kind: "short-answer", prompt: [Q], points: -1)
} else if case == "numeric-tolerance" {
  question(id: "BAD-TOLERANCE", kind: "short-answer", prompt: [Q], answer: answer("numeric", 2, tolerance: -0.1))
} else if case == "estimated-time" {
  question(id: "BAD-TIME", kind: "short-answer", prompt: [Q], estimated-time: -20)
} else if case == "tags" {
  question(id: "BAD-TAGS", kind: "short-answer", prompt: [Q], tags: ("math", 2))
} else if case == "no-correct" {
  question(id: "BAD-CORRECT", kind: "mcq", prompt: [Q], choices: (choice([A]), choice([B])))
} else if case == "tf-conflict" {
  question(id: "BAD-TF", kind: "true-false", prompt: [Q], choices: (choice([A], correct: true), choice([B])), answer: (false, false))
} else {
  question(id: "BAD-META", kind: "written-response", prompt: [Q], metadata: "bad")
}
#let _ = validate-question(q)
