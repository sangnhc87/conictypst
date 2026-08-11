// Smoke test public API + cách gọi được khuyến nghị.
#import "../lib.typ": *

#set page(paper: "a5", margin: 8mm)
#set text(size: 8pt)

// 2D conic trong canvas tiện ích.
#smg-canvas(length: 0.45cm, {
  draw-parabola(a: 0.5, x-range: (-2, 2))
  draw-ellipse(a: 2, b: 1)
  draw-hyperbola(a: 1, b: 1, x-range: (1.1, 2.5))
})

// 3D solids: kiểm tra các anchor cũ và mới.
#smg-canvas(length: 0.45cm, {
  draw-cone(name: "N", radius: 1.5, height: 3, show-hidden: true)
  smg-draw.line("N.front", "N.back", stroke: (dash: "dotted", paint: gray))
  smg-draw.content("N.apex", [$S$], anchor: "south")
  draw-cylinder(name: "C", center: (5, 0, 0), radius: 1.2, height: 2,
    show-hidden: false)
  smg-draw.line("C.bottom", "C.top", stroke: (dash: "dashed", paint: blue))
  draw-sphere(name: "Q", center: (10, 0, 0), radius: 1.4,
    fill: rgb("EAF4FF"), show-equator: true, show-meridian: true)
})

// Các helper canvas độc lập vẫn giữ cách gọi cũ.
#tri-right(leg1: 3, leg2: 2.5)
#tri-xyz((-3, -1), (3, -1), (0, 2.5))
#angle-mark((2, 0), (0, 0), (0, 2), radius: 0.5, label: "α")
#arc-by-points((2, 0), (0, 0), (0, 2), radius: 0.8)
#phanghoa-tru(r: 1.5, h: 3)
