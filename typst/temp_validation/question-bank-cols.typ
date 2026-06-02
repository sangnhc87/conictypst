#import "../sang-exam.typ": *
#import "../modules/question-bank.typ": question-tn, render-question

#show: thpt-school-exam.with(
  school: "VALIDATION",
  exam-title: "Question Bank Cols",
  subject: "TOAN",
  duration: "---",
  code: "VAL",
)

#render-question(
  question-tn(
    [Chon cach dat cot thu cong cho cau trac nghiem.],
    (
      [Phuong an A rat dai de kiem tra bo cuc khi muon ep mot cot thay vi de he thong tu doan.],
      [Phuong an B ngan.],
      True([Phuong an C dung.]),
      [Phuong an D ngan.],
    ),
    cols: 1,
    solution: [Kiem tra duong truyen cols qua question-bank.],
    status: "ready",
  ),
  mode: "loigiai",
)
