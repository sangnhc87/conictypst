// Tình huống 04: Ma trận từng phần, chọn đúng chỉ tiêu và đảo lựa chọn MCQ.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 18mm)

#let mc = range(5).map(i => question(
  id: "MC-" + str(i), kind: QUESTION_MC, prompt: [Tính #str(i + 1) + 2.],
  choices: (choice([0]), choice([#str(i + 3)], correct: true), choice([10]), choice([20])),
  answer: answer("choice", 2), topic: "so-hoc", difficulty: 2,
))
#let ds = question(
  id: "DS-1", kind: QUESTION_TF, prompt: [Xét các phát biểu về số tự nhiên.],
  choices: (choice([$2$ chẵn.], correct: true), choice([$3$ chẵn.]), choice([$4$ chẵn.], correct: true), choice([$5$ chẵn.])),
)
#let ngan = question(id: "SA-1", kind: QUESTION_SA, prompt: [Tính $7+8$.], answer: answer("numeric", 15))
#let bank = mc + (ds, ngan)
#let blueprint = (
  (kind: QUESTION_MC, topic: "so-hoc", difficulty: 2, count: 3, title: [Phần I — Trắc nghiệm]),
  (kind: QUESTION_TF, count: 1, title: [Phần II — Đúng sai]),
  (kind: QUESTION_SA, count: 1, title: [Phần III — Trả lời ngắn]),
)
#let variant = exam-variant(bank, blueprint, seed: 2026, ma-de: "0101")
#assert(variant.questions.len() == 5)

= Mã đề #variant.ma-de
#render-exam-variant(variant)
