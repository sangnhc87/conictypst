// Các hình mẫu từ chuyên đề Tích phân Hay - Lạ - Khó
#import "@preview/cetz:0.5.2"
#import "../../lib.typ": draw-half-elliptical-tunnel, draw-square-cross-section, draw-square-y-cross-section

#set page(paper: "a4", margin: 1.5cm)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")

= Các hình mẫu: Tích phân Hay - Lạ - Khó

== 1. Vật thể có mặt cắt vuông, cạnh $y = 2^x$

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  draw-square-cross-section(x => calc.pow(2, x), x-range: (0, 2), samples: 5)
})

== 2. Tháp trang trí có mặt cắt vuông $a(y) = 2sqrt(y+1)$

#cetz.canvas(length: 0.6cm, {
  import cetz.draw: *
  draw-square-y-cross-section(y => 2 * calc.sqrt(y + 1), y-range: (0, 8), samples: 4)
})

== 3. Đường hầm nửa elip

#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  draw-half-elliptical-tunnel(length: 6, h-start: 4, h-end: 1, ratio: 3)
})

== 4. Khối đèn có mặt cắt vuông $a(y) = sqrt(y) e^(y/2)$

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  draw-square-y-cross-section(
    y => calc.sqrt(y) * calc.exp(y / 2),
    y-range: (0, 2),
    samples: 5,
    proj: (x, y, z) => (x + 0.35 * z, y + 0.25 * z),
    stroke: rgb("cc7700"),
  )
})
