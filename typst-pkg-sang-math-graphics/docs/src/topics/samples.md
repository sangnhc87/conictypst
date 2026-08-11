# Hình mẫu từ tài liệu

Các hình này được trích từ chuyên đề **Tích phân Hay - Lạ - Khó** và được vẽ lại bằng `sang-math-graphics`.

<script setup>
const codeSquareX = `#import "@preview/sang-math-graphics:0.1.0": smg-canvas, draw-square-cross-section

#smg-canvas(length: 1.2cm, {
  draw-square-cross-section(x => calc.pow(2, x), x-range: (0, 2), samples: 5)
})`

const codeSquareY = `#import "@preview/sang-math-graphics:0.1.0": smg-canvas, draw-square-y-cross-section

#smg-canvas(length: 0.6cm, {
  draw-square-y-cross-section(y => 2 * calc.sqrt(y + 1), y-range: (0, 8), samples: 4)
})`

const codeTunnel = `#import "@preview/sang-math-graphics:0.1.0": smg-canvas, draw-half-elliptical-tunnel

#smg-canvas(length: 0.5cm, {
  draw-half-elliptical-tunnel(length: 6, h-start: 4, h-end: 1, ratio: 3)
})`
</script>

## Vật thể có mặt cắt vuông theo trục Ox

Vật thể có đáy giới hạn bởi trục hoành và đồ thị $y = 2^x$, mặt cắt vuông góc với $O x$ là hình vuông.

```typst
#import "@preview/sang-math-graphics:0.1.0": smg-canvas, draw-square-cross-section

#smg-canvas(length: 1.2cm, {
  draw-square-cross-section(x => calc.pow(2, x), x-range: (0, 2), samples: 5)
})
```

<LivePreview :code="codeSquareX" />

## Tháp có mặt cắt vuông theo trục Oy

Tháp có cạnh mặt cắt $a(y) = 2sqrt(y+1)$.

```typst
#import "@preview/sang-math-graphics:0.1.0": smg-canvas, draw-square-y-cross-section

#smg-canvas(length: 0.6cm, {
  draw-square-y-cross-section(y => 2 * calc.sqrt(y + 1), y-range: (0, 8), samples: 4)
})
```

<LivePreview :code="codeSquareY" />

## Đường hầm nửa elip

Đường hầm có chiều dài $L = 6$, chiều cao đầu vào $h(0) = 4$, chiều cao đầu ra $h(6) = 1$, trục lớn gấp 3 lần trục bé.

```typst
#import "@preview/sang-math-graphics:0.1.0": smg-canvas, draw-half-elliptical-tunnel

#smg-canvas(length: 0.5cm, {
  draw-half-elliptical-tunnel(length: 6, h-start: 4, h-end: 1, ratio: 3)
})
```

<LivePreview :code="codeTunnel" />
