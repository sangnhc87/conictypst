// Tình huống 06: Từ cùng một câu hỏi xuất bốn chế độ hiển thị.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 18mm)

#let (tn, ds, tln, tl) = bank-mode()
#let q = tn(
  [Đạo hàm của $x^2$ là gì?],
  ([$x$], True([$2x$]), [$x^2$], [$2$]),
  id: "1D7N2-1", loigiai: [Áp dụng công thức $(x^n)'=n x^(n-1)$.],
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
