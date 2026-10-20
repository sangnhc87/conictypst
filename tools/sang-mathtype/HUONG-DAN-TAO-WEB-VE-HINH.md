# Hướng dẫn tạo website riêng "Vẽ hình Toán – Lý – Hóa" (dành cho AI/model đọc)

Mục tiêu: tách bảng vẽ kéo thả của add-in Sang Math thành **website độc lập** (không cần Word), rồi nâng cấp mạnh hơn.
**Đừng đọc cả repo.** Chỉ đọc đúng các tệp ở mục 2; mọi thứ khác bỏ qua.

## 1. Cái gì đã có (chạy trong trình duyệt, không cần máy chủ)
- Typst + CeTZ chạy bằng WASM trong trình duyệt → dựng hình thành SVG/PNG ngay trên máy người dùng.
- ~363 mẫu rời (Hóa dụng cụ/thí nghiệm/mô hình, Lý thí nghiệm/đồ thị/mạch, Toán hình học/không gian/đồ thị/BBT/xác suất/thống kê), mỗi mẫu có thuộc tính chỉnh được.
- Bảng kéo thả: kéo, xoay, đổi cỡ, lật, căn, thu phóng, hoàn tác, yêu thích/gần đây, xuất SVG/PNG.

## 2. Tệp cần đọc/copy (đều trong `tools/sang-mathtype/`)
| Vai trò | Tệp |
|---|---|
| Thư viện vẽ CeTZ (hàm `sm-*`, hóa, lý, 3D…) | `src/draw/sm-draw.typ` |
| Kho mẫu (id, nhóm, thuộc tính, sinh mã Typst) | `src/draw/stamps.mjs`, `src/draw/stamps-ext.mjs` |
| Mẫu hoàn chỉnh (tùy chọn) | `src/draw/templates/*.typ` |
| Giao diện bảng kéo thả | `src/editor.js` + khối `#edMode` trong `src/taskpane.html` + cuối `src/taskpane.css` |
| Dựng Typst → SVG/PNG, nạp WASM | `src/engine.js` |
| Đóng gói thư viện + ảnh xem trước mẫu | `draw-build.mjs`, `build.mjs` |
| Phông chữ, mitex | `fonts/`, `vendor/mitex/` |
| Kiểm tra mẫu không cần giao diện | `tests/check-stamps.mjs` |
Chỉ đường chi tiết: `AGENTS.md` (cùng thư mục).

## 3. Phần Word cần cắt khi tách
`src/word.js`, `src/desktop.js`, `src/gdocs.js`, `src/tools/`, `exam*`, `manifest.xml`, `installers/`, `desktop/`.
Trong `editor.js` chỉ cần giữ `finalImage`, nút **Sao chép ảnh** và **Lưu SVG/PNG**; bỏ nút "Chèn/Cập nhật hình" (cầu nối Word: biến `bridge`, `setBridgeButtons`, `act`).

## 4. Các bước (làm theo thứ tự, mỗi bước kiểm tra rồi mới sang bước sau)
1. Tạo thư mục dự án mới (vd. `ve-hinh-web/`), copy các tệp mục 2. Giữ nguyên cấu trúc `src/draw/`.
2. Tạo `index.html` riêng: chỉ có `#edMode` (kho mẫu + bảng + bảng thuộc tính), không có tab công thức.
3. `build.mjs`: bundle `editor.js`+`engine.js` bằng esbuild, chép WASM/font như bản gốc; giữ `compiler.wasm` **tách đôi** (Cloudflare Pages giới hạn 25 MiB/tệp).
4. Chạy `node tests/check-stamps.mjs` và `node build.mjs`: không có ⚠.
5. Chạy thử cục bộ, mở trang, kéo vài mẫu, xuất SVG.
6. Deploy lên **project Cloudflare Pages MỚI** theo `DEPLOYMENT-SAFETY.md`: thêm project vào bảng và danh sách cho phép của `scripts/prune-cloudflare-pages-deployments.mjs`, thêm script `deploy:<tên>` trong `package.json`. Không đụng project đang có.

## 5. Hướng nâng cấp để "siêu mạnh hơn" (chia việc nhỏ, mỗi việc một phiên)
1. **Lưu/mở dự án** (JSON `scene`) và chia sẻ bằng link.
2. **Chọn nhiều mẫu**, nhóm, căn đều/phân bố, lưới thông minh, đường dóng.
3. **Thư viện mẫu theo bài** (bộ có sẵn: "điều chế khí", "mạch RLC", "thiết diện hình lập phương").
4. **Tìm mẫu bằng tiếng Việt tự nhiên** (từ khóa, đồng nghĩa), gắn thẻ cấp lớp/chương.
5. **Xuất**: SVG, PNG nền trong, PDF, mã Typst/TikZ; dán thẳng vào Word/Google Docs bằng clipboard.
6. **Mẫu do người dùng tự tạo** từ mã Typst + khai báo thuộc tính.
7. **PWA/offline** và bản cài về máy.

## 6. Quy ước khi thêm mẫu (bắt buộc)
- Hàm vẽ trong `sm-draw.typ`; thuộc tính chỉnh được; tên không trùng hàm CeTZ (fill, stroke, anchor, scale, rotate, ellipse…).
- Tên tham số nhiều chữ (`mu`, `sigma`, `alpha`, `phi`) che ký hiệu trong `$…$`: dùng tên khác (`ky`, `dl`, `ga`).
- Biểu thức hàm: dấu trừ có khoảng trắng (`x - 1`), dùng `normExpr`.
- Nhãn tiếng Việt; hóa dùng `ch("H2SO4")`; hình không gian dùng `da-dien`/`pj`.

## 7. Cách giao việc cho model để tiết kiệm token
- Mỗi phiên **một việc** ở mục 4 hoặc 5, kèm: "đọc `HUONG-DAN-TAO-WEB-VE-HINH.md` và `AGENTS.md`, chỉ mở các tệp mục 2".
- Xem kết quả bằng ảnh (`tests/check-stamps.mjs` → `.cache/stamp-check/sheet-*.png`) thay vì đọc mã.
- Không yêu cầu "đọc lại toàn bộ dự án". Cập nhật `AGENTS.md` sau mỗi thay đổi lớn để phiên sau đọc ngắn.
