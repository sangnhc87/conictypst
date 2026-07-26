#import "../lib.typ": *

#set page(width: 170mm, height: auto, margin: 12mm)
#show: sang-setup

#let (tn, ds, tln, tl) = exam-mode(mode: "dethi")

= Mặc định: 4 ô

#tln(
  [Tính $2+3$.],
  [$5$],
)

= Ẩn toàn bộ cụm ô

#tln(
  [Tính $2+3$ và viết đáp án trên các dòng dưới đây.],
  [$5$],
  show-boxes: false,
  lines: 2,
)

= Tuỳ chỉnh: 6 ô

#tln(
  [Ghi kết quả dưới dạng sáu ký tự.],
  [123456],
  box-count: 6,
)
