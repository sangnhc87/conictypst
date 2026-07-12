# Xác suất - Thống kê

<script setup>
import LivePreview from '../../.vitepress/components/LivePreview.vue'
const codeTree2x2 = `#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-tree-2x2

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-tree-2x2(
    root-label: [1 bi từ Hộp III],
    level1: (([Gốc Hộp I], $3/5$), ([Gốc Hộp II], $2/5$)),
    level2: (([Đỏ], $x/(x+4)$), ([Xanh], $4/(x+4)$), ([Đỏ], $5/8$), ([Xanh], $3/8$)),
  )
})`

const codeTree3x2 = `#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-tree-3x2

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-tree-3x2(
    root-label: [Khách hàng],
    level1: (([Sẽ mua], $0,44$), ([Cân nhắc], $0,30$), ([Không mua], $0,26$)),
    level2: (([Mua], $0,80$), ([Không], $0,20$), ([Mua], $x$), ([Không], $1-x$), ([Mua], $0,30$), ([Không], $0,70$)),
  )
})`

const codeBayesTree = `#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-bayes-tree

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
})`

const codeBoxTransfer = `#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-box-transfer-diagram

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
})`

const codeBayesBar = `#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-bayes-contribution-bar

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
})`
</script>

## Sơ đồ cây xác suất

### Sơ đồ cây 2x2

Phù hợp bài toán **2 nguồn gốc → 2 kết quả**, ví dụ: Hộp I / Hộp II → Đỏ / Xanh.

![Sơ đồ cây 2x2](/img/probability-tree-demo-1.png)

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-tree-2x2

draw-tree-2x2(
  root-label: [1 bi từ Hộp III],
  level1: (([Gốc Hộp I], $3/5$), ([Gốc Hộp II], $2/5$)),
  level2: (([Đỏ], $x/(x+4)$), ([Xanh], $4/(x+4)$), ([Đỏ], $5/8$), ([Xanh], $3/8$)),
)
```

<LivePreview :code="codeTree2x2" />

### Sơ đồ cây 3x2

Phù hợp bài toán **3 nhóm khách hàng → mua / không mua**.

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-tree-3x2

draw-tree-3x2(
  root-label: [Khách hàng],
  level1: (([Sẽ mua], $0,44$), ([Cân nhắc], $0,30$), ([Không mua], $0,26$)),
  level2: (([Mua], $0,80$), ([Không], $0,20$), ([Mua], $x$), ([Không], $1-x$), ([Mua], $0,30$), ([Không], $0,70$)),
)
```

<LivePreview :code="codeTree3x2" />

### Sơ đồ cây Bayes tổng quát

![Sơ đồ cây Bayes 3 nhánh](/img/probability-tree-demo-2.png)

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-bayes-tree

draw-bayes-tree(
  root-label: [Linh kiện],
  branches: (
    ([Phân xưởng I], $0,50$, (([Phế phẩm], $0,02$), ([Chuẩn], $0,98$))),
    ([Phân xưởng II], $0,30$, (([Phế phẩm], $x$), ([Chuẩn], $1-x$))),
    ([Phân xưởng III], $0,20$, (([Phế phẩm], $0,03$), ([Chuẩn], $0,97$))),
  ),
)
```

<LivePreview :code="codeBayesTree" />

## Mô hình truyền tin hộp bi

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-box-transfer-diagram

draw-box-transfer-diagram(
  box1-label: [Hộp I \ $x$ Đỏ, 4 Xanh],
  box2-label: [Hộp II \ 5 Đỏ, 3 Xanh],
  box3-label: [Hộp III (5 bi)],
  take1: [3 bi],
  take2: [2 bi],
  result-color: red,
  result-label: [Đỏ],
)
```

![Mô hình truyền tin hộp bi](/img/bayes-box-demo-1.png)

<LivePreview :code="codeBoxTransfer" />

## Thanh tỉ trọng Bayes

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-bayes-contribution-bar

draw-bayes-contribution-bar(
  terms: (
    ($P(A)P(M|A)$, 0.352, rgb("ffebee")),
    ($P(B)P(M|B)$, 0.220, rgb("e3f2fd")),
    ($P(C)P(M|C)$, 0.078, rgb("e8f5e9")),
  ),
  total: $P(M) = 0,65$,
)
```

![Thanh tỉ trọng Bayes](/img/xac-suat-doc-la-1.png)

<LivePreview :code="codeBayesBar" />

## Công thức Bayes

$$P(A_k \mid B) = \frac{P(A_k) \cdot P(B \mid A_k)}{P(B)}$$

Trong đó:

- $P(A_k)$: xác suất tiên nghiệm của nhóm $A_k$
- $P(B \mid A_k)$: xác suất có điều kiện $B$ xảy ra khi đã biết $A_k$
- $P(B) = \sum_k P(A_k) \cdot P(B \mid A_k)$: xác suất toàn phần
