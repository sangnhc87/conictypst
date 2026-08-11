// Mẫu ngắn nhất để bắt đầu với sang-math-graphics.
#import "../lib.typ": *

#set page(paper: "a5", margin: 12mm)
#set text(size: 10pt, lang: "vi")

= Quickstart

== 1. Hình 2D: dùng trực tiếp

Các helper hình cơ bản tự tạo canvas, nên không cần bọc `smg-canvas`:

#tri-abc(base: 5, height: 3.5)

== 2. Conic 2D: đặt trong canvas

Các hàm có tiền tố `draw-` trả về một CeTZ group. Dùng `smg-canvas` để tạo
canvas; `smg-draw` là namespace để thêm nhãn hoặc nét phụ.

#smg-canvas(length: 0.75cm, {
  draw-parabola(a: 0.35, x-range: (-4, 4), stroke: blue + 1.2pt)
  draw-ellipse(center: (5, 0), a: 2, b: 1.2, stroke: red + 1.2pt)
})

== 3. Hình 3D: anchor để nối thêm chi tiết

#smg-canvas(length: 0.9cm, {
  draw-cone(name: "N", radius: 2.2, height: 4, fill: rgb("EAF4FF"))
  smg-draw.circle("N.front", radius: 0.08, fill: red)
  smg-draw.content("N.top", [$S$], anchor: "south")
  smg-draw.content("N.center", [$O$], anchor: "north")
  smg-draw.line("N.top", "N.center", stroke: (dash: "dashed", paint: gray))
})

== 4. Đường cong và mặt cong

#smg-canvas(length: 0.8cm, {
  draw-cylinder(name: "C", radius: 1.5, height: 4, stroke: rgb("777777"))
  draw-helix(center: (0, 0, 0), radius: 1.5, height: 4, loops: 2,
    stroke: red + 1.2pt)
})

#smg-canvas(length: 0.8cm, {
  draw-saddle(x-range: (-2, 2), y-range: (-2, 2), samples: 12,
    stroke: rgb("1A5276") + 0.6pt)
})
