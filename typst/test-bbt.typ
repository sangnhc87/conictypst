#import "bbt.typ": *

// Test bbtv2: hàm có 1 cực tiểu, format giống bbt-opt
// d-signs: (khoảng trái, giá trị tại CT, khoảng phải)
#bbtv2(
  x-vals: ($-oo$, $1$, $+oo$),
  d-signs: ("-", "0", "+"),
  v-vals: ($+oo$, $0$, $+oo$),
)

#v(1em)

// Test bbbt: hàm có 2 cực trị
// d-signs: (k1, CT1, k2, CT2, k3)
#bbbt(
  x-vals: ($-oo$, $-1$, $1$, $+oo$),
  d-signs: ("+", "0", "-", "0", "+"),
  v-vals: ($-oo$, $2$, $-2$, $+oo$),
)
