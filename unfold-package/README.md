# unfold-package

Package nhỏ cho Typst + CeTZ cung cấp 2 tính năng chính:
1. Vẽ hình trải phẳng (Net) và đường đi ngắn nhất trên mặt khối không gian.
2. Vẽ thiết diện 3D tự động (Auto Solid Cross-Section) siêu nghệ thuật.

## 1. Tính Năng Hình Trải Phẳng (Unfold)

Dùng để vẽ các khối cơ bản và trải ra mặt phẳng, tính toán đường đi ngắn nhất.

```typ
#import "@preview/cetz:0.5.2"
#import "unfold.typ": *

#cone(r: 1, l: 12, to: 5, display: "both")
#cylinder(r: 2, h: 6, display: "both")
#prism(n: 6, a: 1, h: 5, faces: 8)
#pyramid(n: 4, a: 1, e: 2, sm: 1)
#box3(a: 3, b: 4, c: 5, display: "both")
```
### Quy ước tham số
- `display`: `"net"`, `"solid"`, hoặc `"both"`.
- `wrap`: `"auto"` hoặc số vòng (mặc định 1 vòng).
- `faces`: số mặt bên đi qua (dành cho lăng trụ và chóp).
- `advance`: quãng ngang trong hình trải phẳng của hình trụ.

## 2. Tính Năng Thiết Diện 3D Tự Động (Solid Section)

Tự động phác hoạ các vật thể 3D phức tạp (các khối đa diện, hình trụ, hình nón, hình vành khăn, mặt cầu, khối nghệ thuật) chỉ thông qua hàm thiết diện `f(t)`.

```typ
#import "solid-section.typ": *

#draw-solid-section(
  type: "circle",          // Loại thiết diện: "circle", "triangle", "square", "pentagon", "hexagon", "semi-circle"
  axis: "y",               // Trục xoay: "x", "y", "z"
  f: y => 3 * calc.sqrt(y),// Bán kính ngoài (Hàm thiết diện ngoài)
  f2: y => 2.5 * calc.sqrt(y), // [Tuỳ chọn] Bán kính trong (Khoét rỗng vật thể)
  domain: (0, 4),          // Miền giới hạn của biến t (VD: y chạy từ 0 đến 4)
  slices: (1, 2, 3),       // Vị trí các mặt cắt ngang
  theme: "blue",           // Màu sắc (blue, green, orange, red, gray, purple...)
  size-scale: 1.0,         // Tỉ lệ thu phóng khối hình
  caps: true               // Tự động đóng nắp đáy và đỉnh (thích hợp cho khối có tiết diện đáy > 0)
)
```

### Hướng dẫn tùy biến thông minh (Smart Customization):
- **Khối đặc (Solid):** Chỉ dùng hàm `f(t)`. Bỏ qua `f2`.
- **Khối rỗng (Hollow / Washer):** Truyền thêm hàm `f2(t)` biểu diễn lõi rỗng bên trong. Hàm `f2(t)` luôn phải bé hơn `f(t)`. Khi vẽ khối rỗng, bạn có thể tạo lọ hoa, đồng hồ cát, bát pha lê.
- **Biến đổi nghệ thuật (Artistic):** Hàm `f(t)` hoàn toàn có thể là hàm ghép (Piece-wise) bằng cú pháp `if-else`. Hãy thiết kế các đoạn tiếp nối liên tục (hàm giá trị và đạo hàm bằng nhau tại điểm nối) để tạo nên bề mặt trơn tru (C1 Continuous). Ví dụ: Khối quả lê, khối loa kèn.
- **Xử lý đáy nhọn:** Đối với các khối nhọn ở đỉnh/đáy (như Viên kim cương, quả trứng, giọt nước), hàm `f(t)` tiến về `0`. Trong trường hợp này, hãy để `caps: false` để xoá bỏ nắp đậy triệt tiêu (bán kính bằng 0).
- **Hỗ trợ loại hình đa dạng:** Thay vì chỉ có `circle` (vật thể tròn xoay), bạn có thể dùng `triangle`, `square`, `hexagon` kết hợp với biến thiên của `f(t)` để tạo khối chóp nghệ thuật, tháp đa diện.

### File mẫu:
Tham khảo tệp **`demo.typ`** để xem 19 ví dụ thực tiễn cách sử dụng hàm và đồ họa tuyệt mĩ!
