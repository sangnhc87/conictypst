#import "../../lib.typ": *

#set page(margin: 15mm)
#show: sang-setup

#let original = question(
  id: "MC-1",
  kind: QUESTION_MC,
  prompt: [Tính $2+2$.],
  choices: (choice([3]), choice([4], correct: true), choice([5])),
  answer: answer("choice", 2),
)
#let shuffled = bank-shuffle-choices(original, seed: 107)
#let tf-q = question(id: "TF-1", kind: QUESTION_TF, prompt: [Xét các phát biểu.], choices: (choice([Đúng], correct: true), choice([Sai])))
#let short-q = question(id: "SA-1", kind: QUESTION_SA, prompt: [Tính $1+2$.], answer: 3)

#resetexamstate()
#render-question(shuffled)
#render-question(tf-q)
#render-question(short-q)

#pagebreak()
#print-answer-key()
#sang-omr-qr(ma-de: "0107", width: 2cm)
