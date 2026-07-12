#import "../lib.typ": *
#show: sang-setup

= 06. Bảng biến thiên, bảng xét dấu và bảng dữ liệu

File này minh họa các macro thường dùng khi trình bày khảo sát hàm số, xét dấu biểu thức và lập bảng số liệu.

Lưu ý quan trọng:
- `x-vals` là các mốc trên hàng biến số.
- `d-signs` hoặc `f-signs` có độ dài thường là `2n - 3` nếu `x-vals` có `n` mốc.
- Các vị trí xen giữa là dấu trên khoảng; các vị trí tại mốc trong là `$0$`, `"||"` hoặc để trống.
- Với `bbbt`, tham số `ranks` dùng để xác định cao-thấp khi vẽ mũi tên, nên nên dùng số như `(0, 1, 0)`, không dùng chữ như `"CB"`, `"CT"`.

== A. Bảng biến thiên nhanh `bbtv2`

Mẫu cơ bản cho hàm số có hai điểm tới hạn $x=-1$ và $x=1$.

#bbtv2(
  x-vals: ($-oo$, $-1$, $1$, $+oo$),
  d-signs: ("+", $0$, "-", $0$, "+"),
  v-vals: ($-oo$, $3$, $-1$, $+oo$),
)

Cách đọc dữ liệu trên:
- Trên $(-oo,-1)$, đạo hàm dương.
- Tại $x=-1$, đạo hàm bằng $0$.
- Trên $(-1,1)$, đạo hàm âm.
- Tại $x=1$, đạo hàm bằng $0$.
- Trên $(1,+oo)$, đạo hàm dương.

== B. Đổi tên biến, tên đạo hàm và tên hàm

Dùng khi bài toán dùng biến $t$, quãng đường $s(t)$ hoặc đại lượng khác.

#bbtv2(
  var: $t$,
  der: $s'(t)$,
  func: $s(t)$,
  x-vals: ($0$, $2$, $4$),
  d-signs: ("+", $0$, "-"),
  v-vals: ($1$, $5$, $2$),
  w2: 8,
)

== C. Bảng biến thiên đầy đủ `bbbt`

`bbbt` cho phép dùng `ranks` để điều khiển mức cao-thấp của các giá trị. Đây là điểm dễ nhầm: `ranks` không phải nhãn cực trị, mà là mức vẽ.

#bbbt(
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ("-", $0$, "+"),
  v-vals: ($+oo$, $0$, $+oo$),
  ranks: (1, 0, 1),
)

Ví dụ cực đại:

#bbbt(
  x-vals: ($-oo$, $2$, $+oo$),
  d-signs: ("+", $0$, "-"),
  v-vals: ($-oo$, $4$, $-oo$),
  ranks: (0, 1, 0),
)

== D. Bảng biến thiên có điểm không xác định

Dùng `"||"` cho vị trí không xác định hoặc tiệm cận đứng. Giá trị tại mốc đó có thể là một cặp như `($+oo$, $-oo$)`.

#bbtv2(
  x-vals: ($-oo$, $1$, $+oo$),
  d-signs: ("+", "||", "+"),
  v-vals: ($1$, ($+oo$, $-oo$), $1$),
  w2: 9,
)

== E. Bảng biến thiên tối ưu `bbt-opt`

`bbt-opt` tiện cho dạng chỉ có một điểm cực trị.

#bbt-opt(
  x-vals: ($0$, $3$, $+oo$),
  d-signs: ("-", $0$, "+"),
  v-vals: ($+oo$, $2$, $+oo$),
  is-min: true,
)

#bbt-opt(
  x-vals: ($-oo$, $1$, $+oo$),
  d-signs: ("+", $0$, "-"),
  v-vals: ($-oo$, $5$, $-oo$),
  is-min: false,
)

== F. Bảng xét dấu một dòng `bxd`

Dùng cho biểu thức tích hoặc đạo hàm.

#bxd(
  x-vals: ($-oo$, $-2$, $1$, $+oo$),
  func: ($(x+2)(x-1)$),
  f-signs: ("+", $0$, "-", $0$, "+"),
)

Từ bảng trên suy ra $(x+2)(x-1) <= 0$ khi $x in [-2;1]$.

== G. Bảng xét dấu nhiều dòng

Dùng khi muốn trình bày dấu từng nhân tử và dấu của tích/thương.

#bxd(
  x-vals: ($-oo$, $-2$, $1$, $+oo$),
  func: ($x+2$, $x-1$, $f(x)$),
  f-signs: (
    ("-", $0$, "+", "|", "+"),
    ("-", "|", "-", $0$, "+"),
    ("+", $0$, "-", $0$, "+"),
  ),
  w1: 2,
  w2: 10,
)

== H. Bảng xét dấu có mẫu bằng không

Dùng `"||"` để kẻ vạch đôi tại điểm không xác định.

#bxd(
  x-vals: ($-oo$, $-1$, $2$, $+oo$),
  func: ($(x+1)/(x-2)$),
  f-signs: ("+", $0$, "-", "||", "+"),
  w1: 2.2,
  w2: 9,
)

== I. Bảng giá trị `bang-gia-tri`

Dùng cho bảng giá trị hàm số, bảng thống kê nhỏ hoặc dữ liệu thử nghiệm.

#bang-gia-tri(
  labels: ($x$, $0$, $1$, $2$, $3$),
  rows: (
    ($f(x)$, $1$, $2$, $5$, $10$),
    ($g(x)$, $0$, $1$, $4$, $9$),
  ),
)

== J. Bảng phân phối `bang-phan-phoi`

Dùng cho xác suất rời rạc.

#bang-phan-phoi(
  header: ($X$, $P$),
  items: (($0$, $0.2$), ($1$, $0.5$), ($2$, $0.3$)),
)

== K. Lỗi thường gặp

Không nên viết:

```typ
#bbbt(
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ("-", $0$, "+"),
  v-vals: ($+oo$, $0$, $+oo$),
  ranks: ("CB", none, "CT"), // Sai: ranks không phải nhãn chữ
)
```

Nên viết:

```typ
#bbbt(
  x-vals: ($-oo$, $0$, $+oo$),
  d-signs: ("-", $0$, "+"),
  v-vals: ($+oo$, $0$, $+oo$),
  ranks: (1, 0, 1),
)
```
