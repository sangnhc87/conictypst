# Ghi chú sửa lỗi cho sang-math:1.0.5 (Pending PR)

## 1. Lỗi hàm `exam-mode` không truyền đủ tham số
- **Mô tả lỗi trong bản 1.0.4**: Hàm `exam-mode` (tại `sang-exam.typ`) khi cài đặt cấu hình cho các hàm con như `tn`, `ds`, `mcq`... đã liệt kê cứng các tham số thay vì dùng `..args`. Điều này khiến các cấu hình nâng cao (như `opt-style: "circle"`, `prefix: "Bài"`, `box-inset`, v.v.) khi truyền vào `exam-mode` sẽ bị vứt bỏ, không bao giờ tới được các hàm bên dưới để render đúng giao diện.
- **Cách khắc phục**:
  Đã sửa lại hàm `exam-mode` để khai báo thêm `..args` và tự động gom toàn bộ tham số vào biến `params` bằng `..args.named()`. Sau đó, truyền `..params` thẳng xuống cho tất cả các hàm (`tn.with(..params)`, `ds.with(..params)`,...).
  
  *Ưu điểm của bản fix*:
  - Khắc phục lỗi cấu hình `opt-style` không ăn tác dụng khi dùng `exam-mode`.
  - Hỗ trợ "pass-through" (chuyển tiếp tự động) toàn bộ các tham số hiện có và cả những tham số tương lai mà không cần phải quay lại cập nhật hàm `exam-mode`.
  - Vẫn bảo tồn được tính năng Auto-complete trên các IDE như VSCode (do vẫn giữ danh sách tham số cơ bản ở đầu hàm).

- **Trạng thái**: Đã fix thành công trên nhánh/thư mục local `typst-pkg-sang-math/sang-exam.typ` dòng `1536`.

---
*Ghi chú: Khi nào gom đủ các thay đổi, thầy có thể copy các lưu ý này vào `CHANGELOG.md` và `RELEASE.md` trước khi publish phiên bản mới lên Typst universe.*
