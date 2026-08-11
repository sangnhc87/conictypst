# Live Preview với Typst WASM

Trang này cho phép bạn chỉnh sửa code Typst trực tiếp trên trình duyệt và xem kết quả ngay lập tức.

<script setup>
import LivePreview from '../../.vitepress/components/LivePreview.vue'
const codeCone = `#import "@preview/sang-math-graphics:0.1.0": smg-canvas, smg-draw, draw-cone

#smg-canvas(length: 1.2cm, {
  draw-cone(name: "N1", radius: 3, height: 5, center: (0, 0, 0))
  smg-draw.circle("N1.top", radius: 0.08, fill: red)
  smg-draw.content("N1.top", [$S$], anchor: "south")
})`

const codeSaddle = `#import "@preview/sang-math-graphics:0.1.0": smg-canvas, draw-saddle

#smg-canvas(length: 1.5cm, {
  draw-saddle(x-range: (-2, 2), y-range: (-2, 2), samples: 16, stroke: rgb("1A5276") + 0.6pt)
})`

const codeConicalHelix = `#import "@preview/sang-math-graphics:0.1.0": smg-canvas, draw-conical-helix, draw-cone

#smg-canvas(length: 1.2cm, {
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
