#import "../lib.typ": bxd, bxd-tich, bbtv2, bbbt, bbt-opt

#set page(paper: "a4", margin: (x: 1.5cm, top: 1.5cm, bottom: 1.5cm))

= 1. KIỂM THỬ TRANG A4 1 CỘT (GIỮ NGUYÊN 100% KÍCH THƯỚC GỐC)

== Bảng xét dấu `bxd` (1 cột)
#bxd(
  var: $x$,
  func: $f'(x)$,
  x-vals: ($-oo$, $1$, $3$, $+oo$),
  f-signs: ($+$, $0$, $-$, $0$, $+$),
)

== Bảng biến thiên `bbtv2` (1 cột)
#bbtv2(
  x-vals: ($-oo$, $-1$, $1$, $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, $2$, $-2$, $+oo$),
)

#pagebreak()

= 2. KIỂM THỬ TRANG A4 2 CỘT (TỰ ĐỘNG CO TỶ LỆ, KHÔNG TRÀN LỀ, KHÔNG ĐÈ CỘT)

#columns(2, gutter: 12pt)[
  == Cột 1: `bxd` tự động co
  #bxd(
    var: $x$,
    func: $f'(x)$,
    x-vals: ($-oo$, $1$, $3$, $+oo$),
    f-signs: ($+$, $0$, $-$, $0$, $+$),
  )

  == Cột 1: `bxd-tich` tự động co
  #bxd-tich(
    var: $x$,
    x-vals: ($-oo$, $-2$, $3$, $+oo$),
    factors: (
      ($x + 2$, ($-$, $0$, $+$, $+$, $+$)),
      ($3 - x$, ($+$, $+$, $+$, $0$, $-$)),
    ),
  )

  #colbreak()

  == Cột 2: `bbbt` tự động co
  #bbbt(
    x-vals: ($-oo$, $0$, $2$, $+oo$),
    d-signs: ($+$, $0$, $-$, $0$, $+$),
    v-vals: ($-oo$, $4$, $0$, $+oo$),
  )

  == Cột 2: `bbt-opt` tự động co
  #bbt-opt(
    x-vals: ($0$, $5$, $+oo$),
    d-signs: ($-$, $0$, $+$),
    v-vals: ($10$, $2$, $+oo$),
    is-min: true,
  )
]

#pagebreak()

= 3. KIỂM THỬ CỜ `fit: false` (CHO PHÉP TẮT CO TỶ LỆ KHI CẦN THIẾT)

#columns(2, gutter: 12pt)[
  == `fit: false` giữ nguyên kích thước cứng
  #bxd(
    var: $x$,
    func: $f'(x)$,
    x-vals: ($-oo$, $1$, $3$, $+oo$),
    f-signs: ($+$, $0$, $-$, $0$, $+$),
    fit: false,
  )
  #colbreak()
  Văn bản cột 2.
]
