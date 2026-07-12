#import "../lib.typ": *

#let preset-dethi = exam-preset(
  theme: "teal-pro",
  profile: "dethi",
)

#show: sang-setup.with(math-color: preset-dethi.accent)

#let my-exam = [
  #let (tn, ds, tln, tl) = exam-mode(..preset-dethi.question)
  #exam-part([PHẦN I. Câu trắc nghiệm], count: 2)
  #tn(id: "TN01", [Đạo hàm của $y=x^3-3x+1$ là], ([$3x^2$], True([$3x^2-3$]), [$x^2-3$], [$3x^2+1$]), loigiai: [Ta có $y' = 3x^2 - 3$.])
  #tn(id: "TN02", [Tập xác định của $y=sqrt(x+2)$ là], ([$(-oo;-2)$], [$(-oo;-2]$], True([$[-2;+oo)$]), [$RR$]), loigiai: [Điều kiện xác định: $x + 2 >= 0 <=> x >= -2$. Vậy tập xác định là $D = [-2; +oo)$.])
  
  #exam-part([PHẦN II. Tự luận], count: 1)
  #tl(id: "TL01", [Giải phương trình $x^2 - 4x + 3 = 0$.], loigiai: [Ta có $Delta' = 4 - 3 = 1 > 0$. Vậy phương trình có hai nghiệm phân biệt $x_1 = 3, x_2 = 1$.])
]

#let (tn, ds, tln, tl) = exam-mode(..preset-dethi.question, mode: "dethi")
= ĐỀ BÀI
#my-exam

#pagebreak()
#let (tn, ds, tln, tl) = exam-mode(..preset-dethi.question, mode: "loigiai")
= LỜI GIẢI
#my-exam
