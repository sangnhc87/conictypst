# Sang Math cho Google Docs

Add-on Apps Script gắn vào tài liệu: khung bên phải nhúng trang https://sangmath-word.pages.dev/taskpane?host=gdocs, ảnh công thức được chèn bằng `Code.gs`; mã nguồn công thức nằm trong mô tả thay thế (alt text) của ảnh nên bấm chọn ảnh là khung tự nạp lại để sửa.

Cài: Tiện ích → Apps Script, dán `Code.gs`, thêm tệp HTML `Sidebar`, bật hiển thị `appsscript.json` và dán manifest (hướng dẫn đầy đủ ở trang giới thiệu). Đã chạy thử trong Google Docs thật: chèn, tự nhận khi chọn, cập nhật.

Giới hạn: Docs không cho đặt ảnh lệch dòng nên công thức nằm trên đường chữ, không hạ xuống theo baseline như trong Word; không có đánh số, đổi hàng loạt hay chuyển Equation.
