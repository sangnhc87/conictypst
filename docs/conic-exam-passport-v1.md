# Conic Exam Passport v1

`Conic Exam Passport` là hợp đồng JSON duy nhất để Hub, Trộn đề và OMR trao đổi một kỳ thi mà không phụ thuộc giao diện hoặc cơ sở dữ liệu của nhau.

Mã nguồn chuẩn nằm tại `src/contracts/examPassport.js`. Mọi ứng dụng phải gọi validator và kiểm tra checksum trước khi nhận dữ liệu.

## Nội dung bắt buộc

- `schema`: luôn là `conic.exam-passport`.
- `schemaVersion`: hiện là `1`.
- `producer`: tên và phiên bản ứng dụng tạo file.
- `exam`: ID ổn định, tên kỳ thi và môn thi.
- `sheet`: profile phiếu OMR và phiên bản schema tọa độ.
- `variants`: các mã đề và mapping từng câu sau khi trộn.
- `checksum`: SHA-256 của toàn bộ payload, không tính chính trường checksum.

Mỗi câu dùng `sourceId` ổn định để truy ngược câu gốc. TN lưu `optionOrder` và vị trí đáp án sau khi trộn; Đ/S lưu `statementOrder` và mảng boolean; TLN luôn lưu đáp án dạng chuỗi để không mất dấu phẩy thập phân hoặc số 0 đầu/cuối.

## Quy tắc tương thích

- Ứng dụng phải từ chối `schemaVersion` chưa hỗ trợ thay vì đoán cấu trúc.
- Không đổi nghĩa field trong version 1; chỉ thêm field tùy chọn.
- Thay đổi field bắt buộc hoặc kiểu dữ liệu phải tăng `schemaVersion`.
- File sai checksum được xem là đã hỏng hoặc bị sửa và không được đưa vào chấm tự động.

## Lộ trình nối ứng dụng

1. Trộn đề xuất `.conic-exam.json` cùng các file `.typ` và ghi mapping thật sau mỗi lần shuffle.
2. Hub đóng gói passport cùng ZIP/PDF.
3. OMR nhập file/QR, xác minh schema + checksum rồi mới nạp đáp án và profile phiếu.
4. QR chỉ nên chứa định danh và payload tối thiểu; passport đầy đủ vẫn là nguồn dữ liệu chuẩn.
