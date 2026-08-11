# Đường cong 3D

Cung cấp các hàm vẽ đường cong đặc biệt trong không gian như lò xo, đường xoắn ốc (khi kiến bò trên mặt trụ). Hệ thống tự động phân giải phần bị khuất và vẽ nét đứt.

## Các hàm chính
- `draw-helix`: Đường xoắn ốc quanh một trục thẳng đứng.
- `draw-spring`: Đường xoắn lò xo (nhiều vòng).

## Ví dụ: Dây quấn quanh ống trụ

```typst
#import "@preview/sang-math:1.0.2": *
#import cetz.draw: *

#cetz.canvas({
  draw-cylinder(radius: 1.5, height: 6)
  draw-helix(radius: 1.5, height: 6, loops: 2.5, color: rgb("E91E63"))
})
```
