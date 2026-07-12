# Hướng Dẫn Hệ Thống Bảo Vệ Bản Quyền (Domain Locking)

Tài liệu này ghi chú lại hệ thống bảo vệ bản quyền được cài đặt vào các file HTML công cụ (TikZ, CeTZ, v.v.) trong thư mục `public/hdsd/`.

## 1. Cơ chế hoạt động
Tất cả các file HTML trong thư mục này đều đã được chèn một đoạn mã (Script) ở phần `<head>`. Đoạn mã này có chức năng **Khóa Tên Miền (Domain Locking)**:
- Công cụ chỉ hoạt động khi được mở trên các tên miền hợp lệ: `hdsd-conictypst.pages.dev`, `conictypst.com`, `localhost`, `127.0.0.1`.
- Nếu file HTML bị copy và chạy trên một server/tên miền lạ (ví dụ: `themgiaovien.com`), giao diện sẽ bị che đi bởi một màn hình cảnh báo bản quyền màu đen/đỏ và toàn bộ mã nguồn bên dưới sẽ bị dừng hoạt động (`window.stop()`).

## 2. Các "Đường Lui" (Backdoor) dành cho Chủ Sở Hữu (Admin)

Để tránh trường hợp chính bạn (chủ sở hữu) bị hệ thống chặn khi đổi tên miền hoặc mở file test, hệ thống có 2 đường lách luật:

### Lách luật 1: Chạy trực tiếp từ máy tính (Local File)
Khi bạn nhấp đúp mở file HTML trực tiếp từ thư mục trên máy tính (đường dẫn trên trình duyệt sẽ bắt đầu bằng `file:///Users/...`), hệ thống sẽ nhận diện đây không phải là môi trường web (hostname trống) và sẽ **BỎ QUA** bước kiểm tra chặn. Bạn vẫn dùng bình thường.

### Lách luật 2: Câu thần chú mở khóa (Bypass URL)
Nếu bạn lỡ upload lên một tên miền mới chưa có trong danh sách hợp lệ và bị chặn, bạn có thể tự mở khóa vĩnh viễn cho trình duyệt của mình bằng cách thêm tham số `?unlock=conic` vào cuối đường link.

**Ví dụ:**
`http://ten-mien-moi.com/hdsd/tikz-geogebra.html?unlock=conic`

Khi truy cập bằng link này:
1. Màn hình chặn sẽ biến mất.
2. Trình duyệt của bạn sẽ ghi nhớ một "thẻ bài miễn tử" vào bộ nhớ cục bộ (`localStorage`).
3. Từ các lần truy cập sau (dù không có `?unlock=conic`), bạn vẫn sẽ không bao giờ bị chặn nữa.
*(Lưu ý: Người khác không biết tham số này nên họ vẫn sẽ bị chặn như thường).*

## 3. Cách gỡ bỏ hệ thống bảo vệ
Nếu một ngày nào đó bạn muốn tắt hoàn toàn tính năng này để cho phép dùng tự do ở mọi nơi, hãy mở các file `.html` (ví dụ: `tikz-geogebra.html`), tìm ở ngay dưới thẻ `<head>` đoạn `<script>` chứa cụm từ `Cảnh báo bản quyền` hoặc biến `_0x4f2a` và xóa toàn bộ thẻ `<script>` đó đi là xong.
