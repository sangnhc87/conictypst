// Manual PDF cho Sang Math Graphics
#import "@preview/cetz:0.5.2" as cetz
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

Vẽ hình nón 3D. *Anchor:* `top`, `center`, `front`, `back`, `left`, `right`.

=== #raw("draw-cylinder")

Vẽ hình trụ 3D. *Anchor:* `bottom-center`, `top-center`, `front`, `back`.

=== #raw("draw-sphere")

Vẽ hình cầu dạng lưới. *Anchor:* `center`.

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

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  import "/lib.typ": draw-cone
  draw-cone(name: "N", radius: 2.5, height: 4, center: (0, 0, 0))
  circle("N.top", radius: 0.06, fill: red)
  content("N.top", [$S$], anchor: "south")
  content("N.center", [$O$], anchor: "north")
})

== Khối chóp cụt

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  import "/lib.typ": draw-truncated-pyramid
  draw-truncated-pyramid(base-size: 4, top-size: 2, height: 3, center: (0, 0, 0))
})

== Mặt yên ngựa

#cetz.canvas(length: 1.5cm, {
  import cetz.draw: *
  import "/lib.typ": draw-saddle
  draw-saddle(x-range: (-2, 2), y-range: (-2, 2), samples: 16, stroke: rgb("1A5276") + 0.6pt)
})

== Đường xoắn ốc trên nón

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  import "/lib.typ": draw-cone, draw-conical-helix
  draw-cone(radius: 3, height: 5, center: (0, 0, 0), stroke: rgb("888"))
  draw-conical-helix(center: (0, 0, 0), base-radius: 3, height: 5, loops: 3, stroke: red + 1.5pt)
})

== Thể tích theo mặt cắt

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  import "/lib.typ": draw-square-cross-section
  draw-square-cross-section(x => calc.pow(2, x), x-range: (0, 2), samples: 5)
})

== Đường hầm nửa elip

#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  import "/lib.typ": draw-half-elliptical-tunnel
  draw-half-elliptical-tunnel(length: 6, h-start: 4, h-end: 1, ratio: 3)
})
