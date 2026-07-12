// Ví dụ: Mô hình truyền tin hộp bi + thanh tỉ trọng Bayes
#import "@preview/cetz:0.5.2"
#import "../lib.typ": draw-bayes-contribution-bar, draw-box-transfer-diagram

= Mô hình truyền tin hộp bi

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-box-transfer-diagram(
    box1-label: [Hộp I \ $x$ Đỏ, 4 Xanh],
    box2-label: [Hộp II \ 5 Đỏ, 3 Xanh],
    box3-label: [Hộp III (5 bi)],
    take1: [3 bi],
    take2: [2 bi],
    result-color: red,
    result-label: [Đỏ],
  )
})

= Thanh tỉ trọng đóng góp

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-bayes-contribution-bar(
    terms: (
      ($P(A)P(M|A)$, 0.352, rgb("ffebee")),
      ($P(B)P(M|B)$, 0.220, rgb("e3f2fd")),
      ($P(C)P(M|C)$, 0.078, rgb("e8f5e9")),
    ),
    total: $P(M) = 0,65$,
  )
})
