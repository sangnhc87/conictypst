# Mặt tròn xoay (3D)

Module này vẽ các hình tròn xoay tiêu chuẩn trong không gian chiếu trục đo phối cảnh.

## Các hàm chính
- `draw-cylinder`: Vẽ hình trụ.
- `draw-cone`: Vẽ hình nón.
- `draw-sphere`: Vẽ hình cầu.

## Ví dụ: Nón nội tiếp Trụ

```typst
#import "sang-math:2.0.0": *
#import cetz.draw: *

#cetz.canvas({
  draw-cylinder(name: "cyl", radius: 2, height: 4, show-hidden: true)
  draw-cone(name: "cone", radius: 2, height: 4, color: rgb("E91E63"))
  
  // Nối đỉnh nón với tâm đáy
  line("cone.apex", "cone.center", stroke: (dash: "dashed", paint: rgb("888")))
})
```
