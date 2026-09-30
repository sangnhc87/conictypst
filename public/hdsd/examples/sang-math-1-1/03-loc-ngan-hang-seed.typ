// Tình huống 03: Lọc ngân hàng và chọn câu tái lập được bằng seed.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 18mm)

#let bank = range(8).map(i => question(
  id: "BANK-" + str(i + 1), kind: QUESTION_MC,
  prompt: [Tính #str(i + 1) + 1.],
  choices: (choice([0]), choice([#str(i + 2)], correct: true), choice([10]), choice([100])),
  answer: answer("choice", 2),
  grade: 12,
  topic: if i < 5 { "so-hoc" } else { "ham-so" },
  difficulty: if calc.rem(i, 2) == 0 { 2 } else { 3 },
  tags: ("khong-may-tinh",),
))
#let pool = bank-filter(bank, grade: 12, topic: "so-hoc", difficulty: (2, 3), tags: ("khong-may-tinh",))
#let chosen = bank-select(pool, count: 3, seed: 2026)
#assert(chosen == bank-select(pool, count: 3, seed: 2026))

= Ba câu được chọn với seed 2026
#for q in chosen { render-question(q) }
