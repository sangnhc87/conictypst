# Live Preview với Typst WASM

Trang này cho phép bạn chỉnh sửa code Typst trực tiếp trên trình duyệt và xem kết quả ngay lập tức.

<script setup>
import LivePreview from '../../.vitepress/components/LivePreview.vue'
const codeCone = `#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-cone

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  draw-cone(name: "N1", radius: 3, height: 5, center: (0, 0, 0))
  circle("N1.top", radius: 0.08, fill: red)
  content("N1.top", [$S$], anchor: "south")
})`

const codeSaddle = `#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-saddle

#cetz.canvas(length: 1.5cm, {
  import cetz.draw: *
  draw-saddle(x-range: (-2, 2), y-range: (-2, 2), samples: 16, stroke: rgb("1A5276") + 0.6pt)
})`

const codeConicalHelix = `#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-conical-helix, draw-cone

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  draw-cone(radius: 3, height: 5, center: (0, 0, 0), stroke: rgb("888888"))
  draw-conical-helix(center: (0, 0, 0), base-radius: 3, height: 5, loops: 3, stroke: red + 1.5pt)
})`
</script>

<LivePreview :code="codeCone" />

## Thử các mẫu

### Mặt yên ngựa

<LivePreview :code="codeSaddle" />

### Đường xoắn ốc trên nón

<LivePreview :code="codeConicalHelix" />
