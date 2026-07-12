// Ví dụ: Sơ đồ cây xác suất
#import "@preview/cetz:0.5.2"
#import "../lib.typ": draw-bayes-tree, draw-tree-2x2, draw-tree-3x2

= Sơ đồ cây 2x2: 2 nguồn -> 2 kết quả

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-tree-2x2(
    root-label: [1 bi từ Hộp III],
    level1: (([Gốc Hộp I], $3/5$), ([Gốc Hộp II], $2/5$)),
    level2: (([Đỏ], $x/(x+4)$), ([Xanh], $4/(x+4)$), ([Đỏ], $5/8$), ([Xanh], $3/8$)),
  )
})

= Sơ đồ cây 3x2: 3 nhóm khách hàng

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-tree-3x2(
    root-label: [Khách hàng],
    level1: (([Sẽ mua], $0,44$), ([Cân nhắc], $0,30$), ([Không mua], $0,26$)),
    level2: (([Mua], $0,80$), ([Không], $0,20$), ([Mua], $x$), ([Không], $1-x$), ([Mua], $0,30$), ([Không], $0,70$)),
  )
})

= Sơ đồ cây Bayes tổng quát

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-bayes-tree(
    root-label: [Linh kiện],
    branches: (
      ([Phân xưởng I], $0,50$, (([Phế phẩm], $0,02$), ([Chuẩn], $0,98$))),
      ([Phân xưởng II], $0,30$, (([Phế phẩm], $x$), ([Chuẩn], $1-x$))),
      ([Phân xưởng III], $0,20$, (([Phế phẩm], $0,03$), ([Chuẩn], $0,97$))),
    ),
  )
})
