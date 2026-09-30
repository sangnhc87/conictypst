#import "../lib.typ": *

#let q1 = question(
  id: "Q-1",
  kind: QUESTION_MC,
  prompt: [Giá trị của $1+1$ là?],
  choices: (choice([1]), choice([2], correct: true), choice([3])),
  answer: answer("choice", 2),
  solution: (solution-step([Tính $1+1=2$.], title: [Phép cộng]),),
  hints: ([Cộng hai số tự nhiên.],),
  grade: 10,
  topic: "so-hoc",
  difficulty: 1,
  tags: ("basic",),
  points: 0.25,
  metadata: (curriculum-code: "K10-1"),
)
#let q2 = question(kind: QUESTION_TF, prompt: [Đúng hay sai?], choices: (choice([Hai là số chẵn.], correct: true), choice([Ba là số chẵn.])))
#let q3 = question(kind: QUESTION_SA, prompt: [Tính $3+4$.], answer: answer("numeric", 7, tolerance: 0.01))
#let q4 = question(kind: QUESTION_WRITTEN, prompt: [Chứng minh mệnh đề.], solution: [Ta chứng minh trực tiếp.])
#let bank = question-bank(q1, q2, q3, q4)
#assert(bank.len() == 4)
#assert(bank-filter(bank, grade: 10).len() == 1)
#assert(bank-filter(bank, topic: "so-hoc", difficulty: (1, 2)).len() == 1)
#assert(bank-select(bank, count: 3, seed: 42) == bank-select(bank, count: 3, seed: 42))
#assert(bank-select(bank, count: 0, seed: 42).len() == 0)
#assert(bank-shuffle-choices(q1, seed: 42) == bank-shuffle-choices(q1, seed: 42))
#let shuffled = bank-shuffle-choices(q1, seed: 42)
#assert(shuffled.choices.at(shuffled.answer.value - 1).correct)
#assert(shuffled.choices.at(shuffled.answer.value - 1).content == [2])
#assert(answer("numeric", 3.14, tolerance: 0.001).tolerance == 0.001)
#assert(validate-question(q1) == q1)

#set page(margin: 15mm)
#show: sang-setup

= Student
#render-question(q1)
#render-question(q2)
#render-question(q3)
#render-question(q4)

= Teacher
#render-question(q1, mode: "teacher")
#render-question(q3, mode: "teacher")

= Solution
#render-question(q1, mode: "solution")

= Answer key
#render-question(q1, mode: "answer-key", num: 1)
#render-question(q2, mode: "answer-key", num: 2)
#render-question(q3, mode: "answer-key", num: 3)
