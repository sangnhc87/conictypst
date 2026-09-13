# Ghi chú sửa lỗi cho sang-math:1.0.5 (Pending PR)

## 1. Lỗi hàm `exam-mode` không truyền đủ tham số
- **Mô tả lỗi trong bản 1.0.4**: Hàm `exam-mode` (tại `sang-exam.typ`) khi cài đặt cấu hình cho các hàm con như `tn`, `ds`, `mcq`... đã liệt kê cứng các tham số thay vì dùng `..args`. Điều này khiến các cấu hình nâng cao (như `opt-style: "circle"`, `prefix: "Bài"`, `box-inset`, v.v.) khi truyền vào `exam-mode` sẽ bị vứt bỏ, không bao giờ tới được các hàm bên dưới để render đúng giao diện.
- **Cách khắc phục**:
  Đã sửa lại hàm `exam-mode` để khai báo thêm `..args` và tự động gom toàn bộ tham số vào biến `params` bằng `..args.named()`. Sau đó, truyền `..params` thẳng xuống cho tất cả các hàm (`tn.with(..params)`, `ds.with(..params)`,...).
  
  *Ưu điểm của bản fix*:
  - Khắc phục lỗi cấu hình `opt-style` không ăn tác dụng khi dùng `exam-mode`.
  - Hỗ trợ "pass-through" (chuyển tiếp tự động) toàn bộ các tham số hiện có và cả những tham số tương lai mà không cần phải quay lại cập nhật hàm `exam-mode`.
  - Vẫn bảo tồn được tính năng Auto-complete trên các IDE như VSCode (do vẫn giữ danh sách tham số cơ bản ở đầu hàm).

- **Trạng thái**: Đã fix thành công trên `sang-exam.typ`, đã đóng gói và bổ sung vào `CHANGELOG.md` cho phiên bản `1.0.5`.

## 2. Nâng cấp Responsive Auto-Fit cho Bảng xét dấu & Bảng biến thiên (`bbt.typ`)
- **Bối cảnh**: `bxd` (chiều rộng $9.5\text{cm}$), `bbbt` ($13\text{cm}$), `bbtv2` (từ $8\text{cm} - 12\text{cm}+$) và `bbt-opt` ($9\text{cm}$) có kích thước cố định theo đơn vị cm. Khi đặt trong đề thi 2 cột (mỗi cột $\approx 8.5\text{cm}$) hoặc layout nháp 70/30 (`layout-draft`), bảng dễ bị tràn lề phải hoặc đè lên cột bên cạnh.
- **Giải pháp bảo đảm an toàn 100% không xung đột**:
  - Bổ sung helper `_auto-fit-canvas(the-canvas, natural-w, fit: auto)` tích hợp sẵn trong `bbt.typ`.
  - Tự động nhận diện độ rộng vùng chứa bằng `layout(size => ...)`.
  - **Trang 1 cột / đủ diện tích**: Giữ nguyên $100\%$ canvas gốc, không thay đổi dù chỉ 1 pixel.
  - **Trang 2 cột / vùng chứa hẹp**: Tự động co tỉ lệ đồng dạng và kích hoạt `reflow: true` để khớp hoàn hảo trong cột, không tràn lề, không đè cột.
  - Hỗ trợ cờ `fit: auto | true | false` cho phép người dùng tắt hoặc ép co tùy ý.
  - Áp dụng thông suốt cho: `bxd`, `bxd-tich`, `bbtv2`, `bbbt`, `bbt-opt`.
- **Kiểm thử**: Đã tạo bài kiểm thử `tests/test-responsive-bbt.typ`, kiểm tra trực quan trên file ảnh PNG và compile thành công toàn bộ 24 test case của gói.

---
*Ghi chú: Toàn bộ thay đổi đã hoàn thiện tại mã nguồn cục bộ, lưu trữ sẵn sàng để mở PR sau theo kế hoạch của dự án.*

