# Giới thiệu Sang-Math v2.0

`sang-math` là một thư viện hỗ trợ vẽ hình học Không Gian, Hình học Phẳng, Giải Tích và Thống Kê một cách chuẩn mực và module hóa dựa trên CeTZ dành cho Typst.

## Tính năng nổi bật

- **Module Hóa:** Tách biệt rõ ràng logic tính toán (data) và phần render (draw).
- **Phối Cảnh Tự Động:** Tự động vẽ nét đứt (phần khuất) và nét liền (phần thấy) cho các hình 3D (Nón, Trụ, Cầu, Xoắn ốc).
- **Hệ Thống Anchor:** Mọi hàm vẽ đều sinh ra anchor của CeTZ (`center`, `apex`, `top`, `bottom`, `left`, `right`) giúp cực kỳ dễ dàng gắn thêm label mà không cần tọa độ thủ công.

## Cấu trúc thư mục

Thư viện bao gồm các module chính:

- `core/`: Chứa các hàm tiện ích tính toán và màu sắc.
- `geometry-2d/`: Hỗ trợ vẽ các đường Conic (Parabol, Elip, Hyperbol).
- `geometry-3d/`: Vẽ các mặt tròn xoay (Hình nón, Hình trụ, Hình cầu) và đường cong 3D (Đường xoắn ốc).
- `statistics/` (Đang phát triển): Vẽ biểu đồ và sơ đồ cây.

## Hướng dẫn cài đặt

Tải thư viện hoặc đặt trong thư mục dự án của bạn và sử dụng:

```typst
#import "sang-math:2.0.0": *
#import cetz.draw: *

#cetz.canvas({
  draw-sphere(radius: 2, fill: rgb("E3F2FD"))
})
```
