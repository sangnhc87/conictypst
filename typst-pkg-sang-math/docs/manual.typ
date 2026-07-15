#import "@preview/tidy:0.4.1"
#import "../lib.typ": *

// Định nghĩa giao diện trang manual
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2.5cm),
  header: align(right)[*Sang-Math v1.0.1* - Tài liệu Hướng Dẫn],
  numbering: "1"
)

#set text(font: "Libertinus Serif", size: 11pt, lang: "vi")
#set heading(numbering: "1.1.")

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(1em)
  text(size: 20pt, fill: rgb("1976D2"), it)
  v(1em)
}

#align(center)[
  #text(size: 32pt, weight: "bold", fill: rgb("E91E63"))[Sang-Math v1.0.1] \
  #v(0.5em)
  #text(size: 16pt)[Thư viện Hình Vẽ Toán Học Đa Năng cho Typst] \
  #v(2em)
]

#outline(title: "Mục Lục", depth: 2)

= Giới thiệu
Package `sang-math` cung cấp các hàm hỗ trợ vẽ hình học Không Gian, Hình học Phẳng, Giải Tích và Thống Kê một cách chuẩn mực và module hóa dựa trên CeTZ.

= Hình học Không Gian (3D)

== Mặt tròn xoay (Revolution)
#let module-revolution = tidy.parse-module(read("../geometry-3d/revolution.typ"))
#tidy.show-module(
  module-revolution,
  style: tidy.styles.default,
  show-outline: false
)

== Đường cong 3D (Curves)
#let module-curves = tidy.parse-module(read("../geometry-3d/curves-3d.typ"))
#tidy.show-module(
  module-curves,
  style: tidy.styles.default,
  show-outline: false
)

= Hình học Phẳng (2D)

== Đường Conic
#let module-conics = tidy.parse-module(read("../geometry-2d/conics.typ"))
#tidy.show-module(
  module-conics,
  style: tidy.styles.default,
  show-outline: false
)
