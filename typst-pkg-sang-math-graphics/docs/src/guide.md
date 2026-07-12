# Hướng dẫn sử dụng

## Cài đặt

```typst
#import "@preview/sang-math-graphics:0.1.0": *
```

## Cấu trúc theo chuyên đề

Package được chia thành các module theo chuyên đề:

- **Hình học phẳng (2D):** parabol, elip, hyperbol
- **Hình học không gian (3D):** nón, trụ, cầu, chóp, chóp cụt
- **Đường cong & mặt cong:** helix, đường xoắn ốc nón, mặt yên ngựa, paraboloid
- **Ứng dụng Giải tích:** thể tích theo mặt cắt vuông, nửa elip
- **Xác suất - Thống kê:** sơ đồ cây 2x2, 3x2, Bayes, mô hình truyền tin

Xem chi tiết từng chuyên đề ở menu **Chuyên đề**.

## Ví dụ đầu tiên: Hình nón

```typst
#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-cone

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  draw-cone(name: "N1", radius: 3, height: 5, center: (0, 0, 0))
  circle("N1.top", radius: 0.08, fill: red)
  content("N1.top", [$S$], anchor: "south")
})
```

## Sử dụng Anchor

Mỗi hình đều định nghĩa các anchor như `top`, `center`, `front`, `back`, `left`, `right`. Bạn có thể dùng chúng để vẽ thêm mà không cần biết tọa độ bên trong.

## Vẽ đường xoắn ốc

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-helix

draw-helix(center: (0, 0, 0), radius: 2, height: 5, loops: 2, stroke: red + 1.5pt)
```

## Live Preview

Truy cập trang [Live Preview](/topics/live) để gõ code Typst trực tiếp trên trình duyệt và xem kết quả ngay lập tức nhờ Typst WASM.
