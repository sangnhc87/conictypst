// Tình huống 02: Một mô hình dữ liệu cho TN, đúng/sai, trả lời ngắn và tự luận.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 18mm)
#show: sang-setup

#let q-tn = question(
  id: "D12-DAOHAM-001", kind: QUESTION_MC,
  prompt: [Đạo hàm của $x^2$ là gì?],
  choices: (choice([$x$]), choice([$2x$], correct: true), choice([$x^2$]), choice([$2$])),
  answer: answer("choice", 2),
  solution: (solution-step([Áp dụng quy tắc lũy thừa: $(x^2)'=2x$.], title: [Bước 1]),),
  hints: ([Nhớ công thức đạo hàm $x^n$.],),
  grade: 12, topic: "dao-ham", difficulty: 1, tags: ("co-ban",), points: 0.25,
)
#let q-ds = question(
  id: "D12-DS-001", kind: QUESTION_TF,
  prompt: [Xét hàm số $f(x)=x^2$.],
  choices: (choice([$f(0)=0$], correct: true), choice([$f(1)=2$]), choice([$f(-1)=1$], correct: true), choice([$f$ luôn âm.])),
)
#let q-ngan = question(
  id: "D12-TLN-001", kind: QUESTION_SA,
  prompt: [Tính $2^3$.], answer: answer("numeric", 8, tolerance: 0),
)
#let q-tu-luan = question(
  id: "D12-TL-001", kind: QUESTION_WRITTEN,
  prompt: [Chứng minh tổng hai số chẵn là số chẵn.],
  solution: [Nếu $a=2m$ và $b=2n$ thì $a+b=2(m+n)$.],
)
#let bank = question-bank(q-tn, q-ds, q-ngan, q-tu-luan)
#assert(bank.len() == 4)

= Đề học sinh
#for q in bank { render-question(q, mode: "student") }
