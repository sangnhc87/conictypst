# Changelog

Các thay đổi đáng chú ý của `sang-math` được ghi tại đây. Gói tuân theo Semantic Versioning; nhánh `1.0.x` không được xóa hoặc đổi chữ ký API public đã phát hành.

## 1.0.1 — Chưa phát hành

### Sửa lỗi

- Giữ đầy đủ API public của 1.0.0, gồm template đề/sách, tiện ích core và hình học CeTZ nâng cao.
- Khôi phục đúng hệ thống theme câu hỏi, nhãn đáp án, tag, khung nháp và các tham số của `exam-mode`.
- Căn nhãn A/B/C/D ổn định khi phương án bắt đầu bằng số mũ hoặc phân số cao.
- Thu nhỏ `tfrac` và `tfrac-tex` đúng vai trò phân số inline.
- Chỉ tăng khoảng thở cho dòng có phân số, không ép mọi phân số thành display fraction.
- Khai báo đúng Typst tối thiểu 0.14.0 theo yêu cầu của `cetz 0.5.2`.

### Kiểm thử

- Thêm kiểm thử compile cho hợp đồng API public, bố cục phân số, baseline phương án và mẫu nộp bài.
- Kiểm tra lại demo đề thi, demo sách và tài liệu HDSD đầy đủ.

## 1.0.0 — 2026

- Phiên bản public đầu tiên trên Typst Universe.
