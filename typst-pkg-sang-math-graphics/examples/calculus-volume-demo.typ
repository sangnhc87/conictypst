// Ví dụ: Vật thể tính thể tích theo mặt cắt
#import "@preview/cetz:0.5.2"
#import "../lib.typ": draw-half-elliptical-tunnel, draw-square-cross-section, draw-square-y-cross-section

= Vật thể có mặt cắt vuông theo trục Ox

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  draw-square-cross-section(x => calc.pow(2, x), x-range: (0, 2), samples: 5)
})

= Tháp có mặt cắt vuông theo trục Oy

#cetz.canvas(length: 0.6cm, {
  import cetz.draw: *
  draw-square-y-cross-section(y => 2 * calc.sqrt(y + 1), y-range: (0, 8), samples: 4)
})

= Đường hầm nửa elip

#cetz.canvas(length: 0.6cm, {
  import cetz.draw: *
  draw-half-elliptical-tunnel(length: 6, h-start: 4, h-end: 1, ratio: 3)
})
