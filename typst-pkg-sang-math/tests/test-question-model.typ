#import "../lib.typ": *

#let q1 = question(
  id: "Q-1",
  kind: QUESTION_MC,
  prompt: [Giá trị của $1+1$ là?],
  choices: (choice([1]), choice([2], correct: true), choice([3]), choice([4])),
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
#let q2 = question(id: "Q-2", kind: QUESTION_TF, prompt: [Đúng hay sai?], choices: (choice([Hai là số chẵn.], correct: true), choice([Ba là số chẵn.]), choice([Bốn là số chẵn.], correct: true), choice([Năm là số chẵn.])))
#let q3 = question(id: "Q-3", kind: QUESTION_SA, prompt: [Tính $3+4$.], answer: answer("numeric", 7, tolerance: 0.01))
#let q4 = question(id: "Q-4", kind: QUESTION_WRITTEN, prompt: [Chứng minh mệnh đề.], solution: [Ta chứng minh trực tiếp.])
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
#let shuffled-tf = bank-shuffle-choices((..q2, answer: (true, false, true, false)), seed: 42)
#assert(shuffled-tf.choices.enumerate().all(((i, c)) => c.correct == shuffled-tf.answer.at(i)))
#assert(answer("numeric", 3.14, tolerance: 0.001).tolerance == 0.001)
#assert(validate-question(q1) == q1)
#let blueprint = (
  (kind: QUESTION_MC, count: 1, topic: "so-hoc", title: [Trắc nghiệm]),
  (kind: QUESTION_TF, count: 1, title: [Đúng sai]),
  (kind: QUESTION_SA, count: 1, title: [Trả lời ngắn]),
)
#let variant = exam-variant(bank, blueprint, seed: 42, ma-de: "0101")
#assert(variant.questions.len() == 3)
#assert(variant == exam-variant(bank, blueprint, seed: 42, ma-de: "0101"))
#assert(exam-variants(bank, blueprint, ("0101", "0102"), seed: 42).len() == 2)
#let balance-bank = range(6).map(i => question(
  id: "B-" + str(i), kind: QUESTION_MC, prompt: [Bài #i],
  choices: (choice([A]), choice([B], correct: true), choice([C]), choice([D])),
  answer: answer("choice", 2),
))
#let balanced = exam-variants(balance-bank, ((kind: QUESTION_MC, count: 2),), ("0001", "0002", "0003"), seed: 17)
#let balanced-ids = balanced.map(v => v.questions.map(q => q.id)).flatten()
#assert(balanced-ids.len() == 6)
#assert(balanced-ids.all(id => balanced-ids.filter(other => other == id).len() == 1))

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

= Variant
#render-exam-variant(variant)
#exam-variant-qr(variant, profile: (id: "custom", mcq: 1, tf: 1, tln: 1, paper: "a5"), width: 2cm)
