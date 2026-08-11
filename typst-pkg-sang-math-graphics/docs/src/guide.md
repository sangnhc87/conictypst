# Hướng dẫn sử dụng

## Cài đặt

```typst
#import "@preview/sang-math-graphics:0.1.0": *
```

## Quy tắc dùng trong 10 giây

Các hàm `draw-*` phải nằm trong canvas. Dùng `smg-canvas` để không phải import
CeTZ ở mỗi file:

```typst
#import "@preview/sang-math-graphics:0.1.0": *

#smg-canvas(length: 1cm, {
  draw-cone(name: "N", radius: 3, height: 5)
  smg-draw.content("N.top", [$S$], anchor: "south")
})
```

Các helper như `tri-abc()` hoặc `phanghoa-tru()` đã tự tạo canvas, nên gọi
trực tiếp. Mẫu copy-ready nằm ở
[`examples/quickstart.typ`](https://github.com/sangnhc87/conictypst/blob/main/typst-pkg-sang-math-graphics/examples/quickstart.typ).

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
#import "@preview/sang-math-graphics:0.1.0": smg-canvas, smg-draw, draw-cone

#smg-canvas(length: 1.2cm, {
  draw-cone(name: "N1", radius: 3, height: 5, center: (0, 0, 0))
  smg-draw.circle("N1.top", radius: 0.08, fill: red)
  smg-draw.content("N1.top", [$S$], anchor: "south")
})
```

## Sử dụng Anchor

Mỗi hình đều định nghĩa các anchor như `top`, `center`, `front`, `back`, `left`, `right`. Bạn có thể dùng chúng để vẽ thêm mà không cần biết tọa độ bên trong.

## Vẽ đường xoắn ốc

```typst
#import "@preview/sang-math-graphics:0.1.0": smg-canvas, draw-helix

#smg-canvas(length: 1.2cm, {
  draw-helix(center: (0, 0, 0), radius: 2, height: 5, loops: 2, stroke: red + 1.5pt)
})
```

## Live Preview

Truy cập trang [Live Preview](/topics/live) để gõ code Typst trực tiếp trên trình duyệt và xem kết quả ngay lập tức nhờ Typst WASM.
