# Sang Math Graphics Studio

Studio trực quan dành riêng cho package `sang-math-graphics:0.1.0`.

## Kiến trúc

- Static app, phù hợp triển khai Cloudflare Pages miễn phí.
- Typst compiler và renderer chạy bằng WASM trong trình duyệt.
- Không Cloud Run, không API server, không database, không đăng nhập bắt buộc.
- Dự án được lưu tự động trong `localStorage`; có thể xuất/nhập JSON.
- Package source được bundle trực tiếp từ `typst-pkg-sang-math-graphics`, nên Studio không phụ thuộc bản package khác trên máy người dùng.
- CeTZ/CeTZ Plot được nạp qua registry Typst khi cần và trình duyệt tự cache tài nguyên.

## Chạy local

Từ thư mục gốc repository:

```bash
npx vite --config vite.graphics-studio.config.js
```

Mở URL Vite in ra, thường là `http://localhost:5173/`.

## Build static

```bash
npx vite build --config vite.graphics-studio.config.js
```

Output nằm ở `dist-graphics-studio/`. Có thể dùng thư mục này làm thư mục xuất bản của một Cloudflare Pages project riêng.

## Cách dùng

1. Chọn lệnh trong thư viện bên trái hoặc nạp một mẫu nhanh.
2. Chọn đối tượng trong Bảng vẽ, chỉnh tham số.
3. Xem preview Typst thật ở giữa màn hình.
4. Sao chép mã, tải `.typ`, SVG hoặc lưu dự án JSON.

Studio này độc lập với `typst-conic-hub` hiện tại; không thay đổi route, dữ liệu, worker hay deployment của website cũ.
