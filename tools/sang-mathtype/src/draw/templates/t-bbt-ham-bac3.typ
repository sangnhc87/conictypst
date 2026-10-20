// @nhom Toán
// @muc Bảng biến thiên & xét dấu
// @ten Bảng biến thiên hàm bậc ba
// @mota Bảng biến thiên của y = ax³ + bx² + cx + d (sang-math bbtv2)
// @tu bang bien thien ham bac ba cuc tri dong bien nghich bien
#import "/sang-math/bbt.typ": *
#let p-ymax = "4" // Giá trị cực đại
#let p-ymin = "0" // Giá trị cực tiểu
#let p-xmax = "0" // Hoành độ cực đại
#let p-xmin = "2" // Hoành độ cực tiểu
#set text(size: 11pt)
#bbtv2(
  x-vals: ($-oo$, eval("$" + p-xmax + "$"), eval("$" + p-xmin + "$"), $+oo$),
  d-signs: ($+$, $0$, $-$, $0$, $+$),
  v-vals: ($-oo$, eval("$" + p-ymax + "$"), eval("$" + p-ymin + "$"), $+oo$),
)
