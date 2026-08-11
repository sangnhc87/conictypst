# Changelog

## 0.1.0 — API usability pass

- Thêm `smg-canvas` và `smg-draw` để có một cách gọi ngắn, thống nhất.
- Giữ lại các anchor `front`/`back` và bổ sung alias `top`/`bottom` cho khối 3D.
- Bổ sung `show-hidden`, `fill`, `show-equator`, `show-meridian` cho các khối
  tròn xoay mà không đổi các tham số cũ.
- Thêm mẫu copy-ready `examples/quickstart.typ` và smoke test `tests/test-api.typ`.
- Đồng bộ tài liệu theo CeTZ `0.5.2`, sửa các ví dụ trước đây gọi group ngoài canvas.
