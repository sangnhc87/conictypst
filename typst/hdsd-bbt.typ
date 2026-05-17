#import "@preview/cetz:0.5.2": canvas, draw
#import "bbt.typ": *

#set page(paper: "a4", margin: (x: 2cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(leading: 0.75em)

#show heading.where(level: 1): it => block(
  width: 100%,
  above: 1.4em,
  below: 0.6em,
  stroke: (bottom: 2pt + rgb("1a5276")),
  inset: (bottom: 0.3em),
  text(fill: rgb("1a5276"), size: 13pt, weight: "bold")[#it.body],
)
#show heading.where(level: 2): it => block(
  above: 1em,
  below: 0.4em,
  text(fill: rgb("900c3f"), size: 11pt, weight: "bold")[#counter(heading).display(). #it.body],
)

#align(center)[
  #text(size: 16pt, weight: "bold")[Hướng dẫn sử dụng `bbt.typ`]
  #v(0.2em)
  #text(size: 10pt, fill: gray)[Bảng biến thiên · Bảng xét dấu — cho Typst 0.14+]
]
#v(0.5em)

// ═══════════════════════════════════════════════════════════
= Tổng quan — Chọn hàm nào?

#table(
  columns: (auto, 1fr, auto),
  stroke: 0.5pt + luma(180),
  inset: 7pt,
  fill: (_, row) => if row == 0 { luma(230) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Hàm*], [*Dùng khi nào*], [*`d-signs` (n cột)*],
  [`bbt-opt`], [BBT đơn giản, đúng 3 cột, 1 cực trị hoặc tối ưu], [3 phần tử],
  [`bbbt`], [BBT tổng quát, nhiều cực trị, n cột bất kỳ], [2n − 3 phần tử],
  [`bbtv2`], [BBT có tiệm cận đứng / vùng không xác định], [2n − 3 phần tử],
  [`bxd`], [Bảng xét dấu y′ hoặc biểu thức f(x)], [2n − 3 phần tử],
)

#v(0.5em)
*Format `d-signs` tổng quát* (cho `bbbt`, `bbtv2`, `bxd`):
#align(center)[
  `(khoảng(x₀→x₁),  tại_x₁,  khoảng(x₁→x₂),  tại_x₂,  …,  khoảng(x_{n-2}→x_{n-1}))`
]
Bắt đầu và kết thúc bằng *dấu khoảng* (vị trí chẵn 0, 2, …); *dấu tại điểm* nằm ở vị trí lẻ (1, 3, …). Tổng *2n − 3* phần tử — không cần dấu tại 2 biên ±∞.

Ký hiệu đặc biệt: `"0"` = bằng 0, `"||"` = không xác định, `"+"` / `"-"` = dương/âm.

// ═══════════════════════════════════════════════════════════
= `bbt-opt` — BBT tối ưu / 1 cực trị

Dùng cho các bài toán có *đúng 1 cực trị* trên khoảng, thường gặp trong bài tối ưu hoá.
Cú pháp `d-signs` = `(dấu_khoảng_trái, 0, dấu_khoảng_phải)`.

== Cực tiểu `is-min: true` (mặc định)

```typst
#bbt-opt(
  var: $t$, der: $v(t)$, func: $x(t)$,
  x-vals: ($0$, $3$, $+oo$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($x(0)$, $x_"min"$, $+oo$),
  is-min: true
)
```
#align(center)[#bbt-opt(
  var: $t$,
  der: $v(t)$,
  func: $x(t)$,
  x-vals: ($0$, $3$, $+oo$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($x(0)$, $x_"min"$, $+oo$),
  is-min: true,
)]

== Cực đại `is-min: false`

```typst
#bbt-opt(
  var: $t$, der: $v(t)$, func: $x(t)$,
  x-vals: ($0$, $4$, $+oo$),
  d-signs: ($+$, $0$, $-$),
  v-vals: ($0$, $320e^(-2)$, $0$),
  is-min: false
)
```
#align(center)[#bbt-opt(
  var: $x$,
  der: $f'(x)$,
  func: $f(x)$,
  x-vals: ($0$, $4$, $+oo$),
  d-signs: ($+$, $0$, $-$),
  v-vals: ($0$, $320e^(-2)$, $0$),
  is-min: false,
)]

// ═══════════════════════════════════════════════════════════
= `bbbt` — BBT tổng quát (nhiều cực trị)

Dùng cho hàm đa thức, hàm mũ, hàm hợp có *2 cực trị trở lên*, hoặc khi cần kiểm soát đầy đủ.

== Hàm bậc 3 — 2 cực trị

n = 4 cột x-vals → `d-signs` có 2·4 − 3 = *5* phần tử:

```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $-1$, $2$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  //       (-∞,-1) tại -1 (-1,2) tại 2 (2,+∞)
  v-vals: ($-oo$, $4$, $-5$, $+oo$),
)
```
#align(center)[#bbbt(
  var: $x$,
  der: $y'$,
  func: $y$,
  x-vals: ($-oo$, $-1$, $2$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, $4$, $-5$, $+oo$),
)]

== Hàm trên đoạn đóng — giá trị tại biên không phải cực trị

```typst
#bbbt(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($0$, $1$, $3$, $4$),
  d-signs: ($+$, $0$, $-$, $0$, $-$),
  v-vals: ($0$, $2$, $-1$, $-3$),
)
```
#align(center)[#bbbt(
  var: $x$,
  der: $y'$,
  func: $y$,
  x-vals: ($0$, $1$, $3$, $4$),
  d-signs: ($+$, $0$, $-$, $0$, $-$),
  v-vals: ($0$, $2$, $-1$, $-3$),
)]

// ═══════════════════════════════════════════════════════════
= `bbtv2` — BBT có tiệm cận / vùng không xác định

== Hàm phân thức có tiệm cận đứng — `v-vals` là mảng `(trái, phải)`

Khi điểm x là tiệm cận đứng:
- `d-signs` tại điểm đó = `"||"` (không cần ghi dấu trong vùng shade giữa 2 `||`)
- `v-vals` tại điểm đó = mảng 2 phần tử `(trái, phải)`; dùng `$-oo$`/`$+oo$` để ẩn nhãn, mũi tên vẫn được vẽ
- Khai báo `shade: ((i, j),)` để gạch chéo vùng không xác định từ cột i đến cột j
- Dấu trong vùng shade (`d-signs` tại khoảng giữa 2 `||`) không hiển thị — truyền `""` hoặc bỏ

*Ví dụ: hàm tăng–tiệm cận–giảm–tiệm cận–tăng* (dấu `+` sau vùng shade):

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $1$, $+oo$),
  d-signs: ($+$, $"||"$, $""$, $"||"$, $+$),
  v-vals: ($-oo$, ($+oo$, $-oo$), ($+oo$, $-oo$), $+oo$),
  shade: ((1, 2),),
)
```
#align(center)[#bbtv2(
  var: $x$,
  der: $y'$,
  func: $y$,
  x-vals: ($-oo$, $0$, $1$, $+oo$),
  d-signs: ($+$, $"||"$, $""$, $"||"$, $+$),
  v-vals: ($-oo$, ($+oo$, $-oo$), ($+oo$, $-oo$), $+oo$),
  shade: ((1, 2),),
)]

*Ví dụ: tăng–tiệm cận–giảm* (dấu `-` sau vùng shade):

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $1$, $+oo$),
  d-signs: ($+$, $"||"$, $""$, $"||"$, $-$),
  v-vals: ($-oo$, ($+oo$, $-oo$), ($+oo$, $-oo$), $-oo$),
  shade: ((1, 2),),
)
```
#align(center)[#bbtv2(
  var: $x$,
  der: $y'$,
  func: $y$,
  x-vals: ($-oo$, $0$, $1$, $+oo$),
  d-signs: ($+$, $"||"$, $""$, $"||"$, $-$),
  v-vals: ($-oo$, ($+oo$, $-oo$), ($+oo$, $-oo$), $-oo$),

  shade: ((1, 2),),
)]

== Hàm chứa căn — `"||"` chỉ ở hàng y′, hàm vẫn xác định

Khi y′ không xác định tại x₀ nhưng hàm vẫn liên tục (điểm góc):
- `d-signs` tại x₀ = `"||"`
- `v-vals` tại x₀ = giá trị *đơn* (không phải mảng) → chỉ kẻ `||` ở hàng y′

```typst
#bbtv2(
  var: $x$, der: $y'$, func: $y$,
  x-vals: ($-oo$, $0$, $4$, $+oo$),
  d-signs: ($-$, $"||"$, $+$, $0$, $-$),
  v-vals: ($+oo$, $0$, $2$, $-oo$),
)
```
#align(center)[#bbtv2(
  var: $x$,
  der: $y'$,
  func: $y$,
  x-vals: ($-oo$, $0$, $4$, $+oo$),
  d-signs: ($-$, $"||"$, $+$, $0$, $-$),
  v-vals: ($+oo$, $0$, $2$, $-oo$),
)]

// ═══════════════════════════════════════════════════════════
= `bxd` — Bảng xét dấu

Dùng khi cần xét dấu y′ hoặc biểu thức, không cần hàng hàm số.

== 1 dòng

```typst
#bxd(
  var: $x$, func: $f'(x)$,
  x-vals: ($-oo$, $-2$, $0$, $3$, $+oo$),
  f-signs: ($+$, $0$, $-$, $0$, $-$, $0$, $+$),
)
```
#align(center)[#bxd(
  var: $x$,
  func: $f'(x)$,
  x-vals: ($-oo$, $-2$, $0$, $3$, $+oo$),
  f-signs: ($+$, $0$, $-$, $0$, $-$, $0$, $+$),
)]

== Nhiều dòng — `func` và `f-signs` là mảng

Để có nhiều hàng dấu: truyền `func` là mảng content, `f-signs` là mảng của mảng (mỗi hàng là 1 mảng dấu).

```typst
#bxd(
  var: $x$,
  func: ($x - 1$, $x + 2$, $(x-1)(x+2)$),
  x-vals: ($-oo$, $-2$, $1$, $+oo$),
  f-signs: (
    ($+$, $0$, $+$, $0$, $+$),  // x - 1
    ($-$, $0$, $-$, $0$, $+$),  // x + 2
    ($+$, $0$, $-$, $0$, $+$),  // tích
  ),
  w1: 2.5,  // tăng nếu nhãn trái rộng
)
```
#align(center)[#bxd(
  var: $x$,
  func: ($x - 1$, $x + 2$, $(x-1)(x+2)$),
  x-vals: ($-oo$, $-2$, $10$, $+oo$),
  f-signs: (
    ($+$, $0$, $+$, $0$, $+$),
    ($-$, $0$, $-$, $0$, $+$),
    ($+$, $0$, $-$, $0$, $+$),
  ),
  w1: 2.5,  // tăng nếu nhãn trái rộng
  h2: 1.2,  // tăng nếu nhãn hàng y' dài
)]

== Tăng độ rộng cột nhãn (`w1`)

Nếu nhãn hàng trái dài hoặc có phân số, truyền `w1` lớn hơn trực tiếp tại lệnh:

```typst
#bxd(
  var: $x$, func: $f'(x) = (x^2 - 1)/(x + 2)$,
  x-vals: ($-oo$, $-2$, $1$, $+oo$),
  f-signs: ($-$, $0$, $-$, $0$, $+$),
  w1: 3.5,
)
```
#align(center)[#bxd(
  var: $x$,
  func: $f'(x) = display((x^2 - 1)/(x + 2))$,
  x-vals: ($-oo$, $-2$, $1$, $+oo$),
  f-signs: ($-$, $0$, $-$, $0$, $+$),
  w1: 3.5,h2: 1.2,
)]

// ═══════════════════════════════════════════════════════════
= Bảng tham số tùy chỉnh

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 7pt,
  fill: (_, row) => if row == 0 { luma(230) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
  [*Tham số*], [*Mặc định*], [*Ý nghĩa*],
  [`w1`], [`1.5`], [Chiều rộng cột nhãn trái (cm)],
  [`w2`], [`10`], [Chiều rộng phần nội dung (cm) — tăng nếu nhiều cột],
  [`h1`], [`0.8`], [Chiều cao hàng x (cm)],
  [`h2`], [`0.8`], [Chiều cao hàng y′ (cm)],
  [`h3`], [`2.2`], [Chiều cao hàng y (cm) — tăng nếu giá trị dài],
  [`shade`], [`()`], [`bbtv2` only: mảng cặp `(i, j)` — gạch chéo từ cột i đến j],
  [`is-min`], [`true`], [`bbt-opt` only: `true` = cực tiểu, `false` = cực đại],
)

// ═══════════════════════════════════════════════════════════
= Bẫy thường gặp

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 7pt,
  fill: (_, row) => if row == 0 { luma(230) } else { white },
  [*Sai*], [*Đúng*],
  [Dùng `bbbt` nhưng truyền `is-min: false`], [Dùng `bbt-opt` cho 3 cột / 1 cực trị],
  [`bbbt`/`bbtv2`/`bxd` dùng format cũ (2n−1 phần tử)], [Bỏ dấu tại 2 biên: dùng *2n − 3* phần tử],
  [`bbtv2` tiệm cận nhưng `v-vals` là số đơn], [`v-vals` tại tiệm cận phải là mảng 2 phần tử],
  [`shade: (1, 2)`], [`shade: ((1, 2),)` — mảng *của* mảng, chú ý dấu phẩy],
)
