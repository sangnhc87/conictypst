// Các hình mẫu từ chuyên đề Xác suất Bayes - Tìm x - Truy nguồn gốc
#import "@preview/cetz:0.5.2"
#import "../../lib.typ": draw-bayes-contribution-bar, draw-box-transfer-diagram, draw-tree-2x2

#set page(paper: "a4", margin: 1.5cm)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")

= Các hình mẫu: Xác suất Bayes - Tìm x

== 1. Sơ đồ cây 2 nguồn gốc Hộp I / Hộp II

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-tree-2x2(
    root-label: [1 bi từ Hộp III (5 bi)],
    level1: (([Gốc Hộp I], $3/5$), ([Gốc Hộp II], $2/5$)),
    level2: (([Đỏ], $x/(x+4)$), ([Xanh], $4/(x+4)$), ([Đỏ], $2/5$), ([Xanh], $3/5$)),
  )
})

== 2. Mô hình truyền tin 2 hộp

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-box-transfer-diagram(
    box1-label: [Hộp I \ 5 Đỏ, 5 Xanh],
    box2-label: [Hộp II \ 2 Đỏ, $x$ Xanh],
    box3-label: [Hộp III (5 bi)],
    take1: [2 bi],
    take2: [3 bi],
    result-color: blue,
    result-label: [Xanh],
  )
})

== 3. Thanh tỉ trọng đóng góp vào P(M)

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
