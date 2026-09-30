// Tình huống 06: Từ cùng một câu hỏi xuất bốn chế độ hiển thị.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 18mm)

#let q = question(
  id: "SOL-01", kind: QUESTION_MC,
  prompt: [Nghiệm của $x^2-5x+6=0$ là cặp nào?],
  choices: (choice([$(1,6)$]), choice([$(2,3)$], correct: true), choice([$(0,5)$]), choice([$(3,4)$])),
  answer: answer("choice", 2),
  solution: (
    solution-step([Phân tích $x^2-5x+6=(x-2)(x-3)$.], title: [Phân tích]),
    solution-step([Suy ra $x=2$ hoặc $x=3$.], title: [Kết luận]),
  ),
  hints: ([Tìm hai số có tổng $5$ và tích $6$.],),
)

= Bản học sinh
#render-question(q, mode: "student")
#pagebreak()
= Bản giáo viên
#render-question(q, mode: "teacher")
#pagebreak()
= Bản lời giải
#render-question(q, mode: "solution")
#pagebreak()
= Chỉ bảng đáp án
#render-question(q, mode: "answer-key", num: 1)
