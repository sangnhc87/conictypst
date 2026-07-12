# Đường Conic (2D)

Module này cung cấp các hàm hỗ trợ vẽ đường Parabol, Elip và Hyperbol.

## Sử dụng

```typst
#import "sang-math:2.0.0": *
#import cetz.draw: *

#cetz.canvas({
  draw-parabola(a: 0.5, h: 0, k: -2)
  draw-ellipse(a: 3, b: 2, center: (0,0), show-foci: true)
})
```

## Các hàm chính
- `draw-parabola`: Vẽ parabol $y = a(x-h)^2 + k$.
- `draw-ellipse`: Vẽ elip $x^2/a^2 + y^2/b^2 = 1$.
- `draw-hyperbola`: Vẽ hyperbol $x^2/a^2 - y^2/b^2 = 1$.
