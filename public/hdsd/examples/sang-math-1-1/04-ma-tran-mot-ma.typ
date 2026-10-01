// Tình huống 04: Ma trận từng phần, chọn đúng chỉ tiêu và đảo lựa chọn MCQ.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 18mm)

#let (tn, ds, tln, tl) = bank-mode()
#let mc = range(5).map(i => tn(
  [Câu #str(i + 1). Đạo hàm của $x^2$ là gì?],
  ([$x$], True([$2x$]), [$x^2$], [$2$]), id: "1D7H2-1",
))
#let dung-sai = ds(
  [Xét các phát biểu về đạo hàm của $f(x)=x^2$.],
  (True([$f'(x)=2x$]), [$f'(1)=1$], True([$f'(2)=4$]), [$f'(0)=2$]),
  id: "1D7H2-1",
)
#let ngan = tln([Tính $f'(2)$ với $f(x)=x^2$.], 4, id: "1D7H2-1")
#let bank = mc + (dung-sai, ngan)
#let blueprint = (
  (kind: QUESTION_MC, id-prefix: "1D7", difficulty: 2, count: 3, title: [Phần I — Trắc nghiệm]),
  (kind: QUESTION_TF, count: 1, title: [Phần II — Đúng sai]),
  (kind: QUESTION_SA, count: 1, title: [Phần III — Trả lời ngắn]),
)
#let variant = exam-variant(bank, blueprint, seed: 2026, ma-de: "0101")
#assert(variant.questions.len() == 5)

= Mã đề #variant.ma-de
#render-exam-variant(variant)
