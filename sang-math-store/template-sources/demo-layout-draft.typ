#import "../../typst/themdep.typ": layout-draft

#show: layout-draft.with(
  nháp-pct: 30%,
  accent: rgb("#117a65"),
  nháp-fill: rgb("#f4faf7"),
  nháp-line: rgb("#b8d8cc"),
)

#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true, leading: 0.75em)

#let exam-page(page-label, questions) = [
  #align(center)[
    #text(size: 9pt, weight: "bold", fill: rgb("#117a65"))[TRƯỜNG THPT SANG MATH]
    #v(3pt)
    #text(size: 16pt, weight: "bold")[ĐỀ KIỂM TRA TOÁN 12]
    #v(2pt)
    #text(size: 9pt)[Thời gian làm bài: 45 phút · #page-label]
  ]
  #v(10pt)
  #line(length: 100%, stroke: 1pt + rgb("#117a65"))
  #v(8pt)
  #for (number, question) in questions.enumerate(start: 1) [
    #block(
      width: 100%,
      inset: 8pt,
      fill: if calc.odd(number) { rgb("#f4faf7") } else { white },
      stroke: 0.5pt + rgb("#b8d8cc"),
      radius: 4pt,
    )[
      *Câu #number.* #question
      #v(6pt)
      A. $1$ #h(1fr) B. $2$ #h(1fr) C. $3$ #h(1fr) D. $4$
    ]
    #v(8pt)
  ]
]

#exam-page(
  [Trang lẻ — nháp bên phải],
  (
    [Cho hàm số $f(x)=x^3-3x+1$. Tính $f'(1)$.],
    [Nghiệm của phương trình $2^x=8$ là],
    [Giá trị lớn nhất của $y=-x^2+4x$ bằng],
    [Tính tích phân $integral_0^1 2x dif x$.],
  ),
)

#pagebreak()

#exam-page(
  [Trang chẵn — nháp bên trái],
  (
    [Cho cấp số cộng có $u_1=2$ và công sai $d=3$. Tính $u_5$.],
    [Mặt cầu tâm $I(1;2;3)$ bán kính $2$ có phương trình là],
    [Đạo hàm của hàm số $y=ln x$ bằng],
    [Tính thể tích khối lập phương cạnh $3$.],
  ),
)
