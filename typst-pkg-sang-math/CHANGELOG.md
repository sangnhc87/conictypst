# Changelog

Các thay đổi đáng chú ý của `sang-math` được ghi tại đây. Gói tuân theo Semantic Versioning; nhánh `1.0.x` không được xóa hoặc đổi chữ ký API public đã phát hành.

## 1.0.4 — 2026-07-26

### Câu đúng/sai

- Sửa `use-table: false` để `#ds`/`#tf` thực sự hiển thị dạng danh sách thay vì
  luôn render bảng.
- Kích hoạt `ds-style` với các kiểu `"list"`, `"pill"`, `"modern"`,
  `"minimal"`, `"bookmark"`, `"folder"`, `"diamond"`, `"gradient"` và
  `"checklist"`.
- Giữ mặc định `"table"` để tài liệu dùng `1.0.3` không đổi bố cục khi nâng cấp.
- Giữ tương thích với cú pháp cũ `table: false`.

### Câu trả lời ngắn

- Xác nhận và tài liệu hoá `show-boxes: false` để ẩn cụm ô điền.
- Xác nhận mặc định `box-count: 4` và khả năng đổi số ô theo từng câu.

### Kiểm thử

- Thêm bài compile bao phủ bảng mặc định, hai alias không bảng, toàn bộ chín
  kiểu danh sách và chế độ đề thi không làm lộ đáp án.
- Thêm bài compile riêng cho `#tln`: bốn ô mặc định, ẩn ô và đổi số ô.

## 1.0.3 — 2026-07-23

### Tính năng mới — `bbt.typ`

- **`node-pad`** (mặc định `0.18`): Điều chỉnh khoảng trắng xung quanh nhãn giá trị trên bảng biến thiên. Áp dụng cho cả `bbtv2` và `bbbt`.
- **`arr-shorten`** (mặc định `3pt`): Khoảng lùi đầu mũi tên khỏi nhãn, tránh mũi tên đè số. Áp dụng cho cả `bbtv2` và `bbbt`.
- **`tab-val`**: Macro helper kiểu `\tkzTabVal` (LaTeX tkz-tab) — vẽ đường chấm dứt đoạn từ hàng $x$ xuống hàng $y$ tại vị trí tuỳ chọn (`from-col`, `to-col`, `pos`, `x-lab`, `y-lab`).
- **`annotations`**: Tham số mảng trong `bbtv2` cho phép thêm nhiều `tab-val` cùng lúc, thay thế `guides`.
- **`overlay`**: Tham số nhận hàm CeTZ closure, vẽ tuỳ ý lên canvas sau khi bảng đã hoàn chỉnh.

### Cải tiến

- Mũi tên biến thiên không còn đè vào số giá trị; mặc định mới hài hoà với mọi cỡ font.
- Tính tái sử dụng cao: tất cả khoảng cách mũi tên / nhãn đều có thể override từng lần gọi.

## 1.0.2 — 2026-07-17

### Sửa lỗi

- Không còn ép toàn bộ `math.equation` nội dòng sang display style.
- Chỉ áp dụng display style cho `math.frac`, để Typst giữ baseline tự nhiên của dòng chữ.
- Loại bỏ dò cấu trúc toán bằng `repr()` và phần bù chiều cao `box(inset: ...)` không ổn định.
- Đồng bộ cách xử lý phân số giữa `sang-setup`, template đề thi, template sách và bản submit.
- Dùng `tfrac` khi cần phân số nhỏ trong số mũ, chỉ số hoặc cận tích phân.
- Thêm `layout-draft` cho đề 70/30: vùng nháp 30% tự đổi từ phải ở trang lẻ sang trái ở trang chẵn khi in hai mặt.
- Thêm `layout-2col-draft`, mẫu copy-ready và kiểm thử compile cho layout nháp đối xứng.

### Kiểm thử

- Thêm kiểm thử baseline cho phân số lớn trong văn bản và trong cột hẹp.
- Thêm kiểm thử tương ứng cho bản package submit.
- Thêm kiểm thử compile hai trang chẵn/lẻ cho `layout-draft`.

## 1.0.1 — 2026

### Sửa lỗi

- Giữ đầy đủ API public của 1.0.0, gồm template đề/sách, tiện ích core và hình học CeTZ nâng cao.
- Khôi phục đúng hệ thống theme câu hỏi, nhãn đáp án, tag, khung nháp và các tham số của `exam-mode`.
- Căn nhãn A/B/C/D ổn định khi phương án bắt đầu bằng số mũ hoặc phân số cao.
- Thu nhỏ `tfrac` và `tfrac-tex` đúng vai trò phân số inline.
- Bổ sung cơ chế hiển thị phân số lớn; cơ chế này được sửa lại ở 1.0.2 để không ảnh hưởng baseline.
- Khai báo đúng Typst tối thiểu 0.14.0 theo yêu cầu của `cetz 0.5.2`.

### Kiểm thử

- Thêm kiểm thử compile cho hợp đồng API public, bố cục phân số, baseline phương án và mẫu nộp bài.
- Kiểm tra lại demo đề thi, demo sách và tài liệu HDSD đầy đủ.

## 1.0.0 — 2026

- Phiên bản public đầu tiên trên Typst Universe.
