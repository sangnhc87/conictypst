// Manual PDF cho Sang Math Graphics
#import "/lib.typ": smg-canvas, smg-draw, draw-cone, draw-truncated-pyramid, draw-saddle, draw-conical-helix, draw-square-cross-section, draw-half-elliptical-tunnel
#set page(paper: "a4", margin: 2cm)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set heading(numbering: "1.1")

#align(center)[
  #text(size: 20pt, weight: "bold")[Sang Math Graphics]
  #v(0.5em)
  #text(size: 12pt, style: "italic")[Hướng dẫn sử dụng package vẽ hình Toán]
  #v(1em)
  #text(size: 10pt)[Phiên bản 0.1.0]
]

#outline(depth: 2)

= Giới thiệu

*Sang Math Graphics* là package Typst giúp vẽ các hình Toán phức tạp như hình nón, trụ, cầu, đường xoắn ốc, parabol, elip, hyperbol... Package được xây dựng trên nền CeTZ và hỗ trợ anchor để người dùng dễ dàng thêm nhãn, nét vẽ phụ.

Quy tắc dùng: hàm `draw-*` đặt trong `smg-canvas`; các helper như `tri-abc`
hoặc `phanghoa-tru` tự tạo canvas. `smg-draw` là namespace CeTZ dùng để thêm
`line`, `circle`, `content` và các nét phụ.

= Cài đặt

Trong file Typst của bạn:

```typst
#import "@preview/sang-math-graphics:0.1.0": *
```

Hoặc import cục bộ khi phát triển:

```typst
#import "../lib.typ": *
```

= API Reference

== 2D Conics

=== #raw("draw-parabola")

Vẽ parabol `y = a*x^2 + b*x + c`.

== 3D Solids

=== #raw("draw-cone")

Vẽ hình nón 3D. *Anchor:* `top`/`apex`, `center`, `front`, `back`, `left`, `right`.

=== #raw("draw-cylinder")

Vẽ hình trụ 3D. *Anchor:* `bottom`/`bottom-center`, `top`/`top-center`,
`center`, `front`, `back`, `left`, `right`.

=== #raw("draw-sphere")

Vẽ hình cầu có xích đạo và kinh tuyến tùy chọn. *Anchor:* `center`, `top`,
`bottom`, `left`, `right`.

== 3D Polyhedra

=== #raw("draw-pyramid")

Vẽ khối chóp tứ giác đều. *Anchor:* `apex`, `A`, `B`, `C`, `D`, `center`.

=== #raw("draw-truncated-pyramid")

Vẽ khối chóp cụt tứ giác đều. *Anchor:* `bottom-center`, `top-center`, `A`..`H`.

== 3D Curves

=== #raw("draw-helix")

Đường xoắn ốc trên trụ. *Anchor:* `start`, `end`, `center`.

=== #raw("draw-conical-helix")

Đường xoắn ốc trên nón. *Anchor:* `start`, `end`, `apex`.

== 3D Surfaces

=== #raw("draw-saddle")

Mặt yên ngựa `z = x^2 - y^2`.

=== #raw("draw-paraboloid")

Paraboloid elliptic.

== Calculus Volumes

=== #raw("draw-square-cross-section")

Vật thể có mặt cắt vuông theo trục `Ox`.

=== #raw("draw-square-y-cross-section")

Vật thể có mặt cắt vuông theo trục `Oy`.

=== #raw("draw-half-elliptical-tunnel")

Đường hầm nửa elip.

= Ví dụ theo chuyên đề

== Hình nón với anchor

#smg-canvas(length: 1cm, {
  draw-cone(name: "N", radius: 2.5, height: 4, center: (0, 0, 0))
  smg-draw.circle("N.top", radius: 0.06, fill: red)
  smg-draw.content("N.top", [$S$], anchor: "south")
  smg-draw.content("N.center", [$O$], anchor: "north")
})

== Khối chóp cụt

#smg-canvas(length: 1cm, {
  draw-truncated-pyramid(base-size: 4, top-size: 2, height: 3, center: (0, 0, 0))
})

== Mặt yên ngựa

#smg-canvas(length: 1.5cm, {
  draw-saddle(x-range: (-2, 2), y-range: (-2, 2), samples: 16, stroke: rgb("1A5276") + 0.6pt)
})

== Đường xoắn ốc trên nón

#smg-canvas(length: 1.2cm, {
  draw-cone(radius: 3, height: 5, center: (0, 0, 0), stroke: rgb("888"))
  draw-conical-helix(center: (0, 0, 0), base-radius: 3, height: 5, loops: 3, stroke: red + 1.5pt)
})

== Thể tích theo mặt cắt

#smg-canvas(length: 1cm, {
  draw-square-cross-section(x => calc.pow(2, x), x-range: (0, 2), samples: 5)
})

== Đường hầm nửa elip

#smg-canvas(length: 0.5cm, {
  draw-half-elliptical-tunnel(length: 6, h-start: 4, h-end: 1, ratio: 3)
})
