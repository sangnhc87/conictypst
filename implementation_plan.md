# Kế Hoạch Cập Nhật Hình Học Cho Các Bài Toán Tối Ưu (Mô Hình Hoá)

Người dùng yêu cầu bổ sung hình vẽ trực quan cho các bài toán tối ưu thực tế, đặc biệt là các dạng toán gấp hình 2D/3D, min-max di chuyển và kinh tế. Cần tuân thủ quy tắc vẽ hình bằng `sang-math-geom.typ` (sm-*) và `cetz` đã quy định.

## User Review Required
> [!IMPORTANT]
> Toàn bộ các bài toán mô hình hoá thuần tuý đại số (như Hàng không, Thuế, Bất động sản) sẽ được **thay thế** bằng các bài toán có thể minh hoạ bằng hình vẽ (Gấp hộp, Di chuyển, Xây bể nước...). 
> Các bài đã có sẵn yếu tố vật lý/hình học (như Ròng rọc, Máng dẫn nước) sẽ được **giữ nguyên nội dung nhưng bổ sung hình vẽ 2D/3D trực quan**.

## Proposed Changes

### Các Bài Bổ Sung Hình Vẽ (Giữ nguyên nội dung)
- **Câu Ròng rọc (Đề 7, 8...)**: Sử dụng `cetz` để vẽ sơ đồ 2D của hệ thống ròng rọc và điểm P chuyển động trên trục Oy.
- **Câu Máng dẫn nước (Đề 7)**: Sử dụng `cetz` để vẽ mặt cắt ngang hình chữ U của tấm tôn sau khi gập (ghi chú rõ các kích thước $x$ và $(30-x)/2$).

### Các Bài Bị Thay Thế Để Đưa Yếu Tố Hình Học Tối Ưu Vào
1. **Thay thế bài Hàng không (Đề 6, 7, 8, 9, 10)** 
   - **Bài toán mới**: Cắt 4 góc của một tấm bìa carton hình chữ nhật để gấp thành hộp không nắp có thể tích lớn nhất.
   - **Hình vẽ**: Vẽ mô phỏng tấm bìa 2D bị cắt 4 góc vuông (dùng `cetz`).
2. **Thay thế bài Thuế (Đề 1)**
   - **Bài toán mới**: Min-max di chuyển (Một người đứng trên bờ biển muốn đến một hòn đảo, kết hợp đi bộ trên bờ và chèo thuyền sao cho tổng thời gian ngắn nhất).
   - **Hình vẽ**: Dùng `cetz` hoặc `sm-*` để vẽ sơ đồ tam giác vuông mô tả đường đi từ A đến bờ biển rồi ra đảo.
3. **Thay thế bài Bất động sản (Đề 3)**
   - **Bài toán mới**: Xây bể nước hình hộp chữ nhật không nắp có thể tích cho trước sao cho chi phí mua vật liệu (diện tích toàn phần) là thấp nhất.
   - **Hình vẽ**: Dùng khối cơ sở `sm-hop-chu-nhat` để vẽ hình hộp.
4. **Thay thế bài EOQ (Đề 4)**
   - **Bài toán mới**: Cắt một hình quạt tròn từ một tấm tôn phẳng để gò thành một hình nón sao cho thể tích lớn nhất.
   - **Hình vẽ**: Vẽ hình quạt 2D và khối nón 3D bằng `sm-non`.
5. **Thay thế bài Đánh bắt cá (Đề 5)**
   - **Bài toán mới**: Thiết kế một chiếc lon hình trụ (để đựng sữa/nước giải khát) có thể tích cho trước sao cho tốn ít nguyên liệu nhất.
   - **Hình vẽ**: Dùng khối cơ sở `sm-tru` để vẽ hình trụ.

## Verification Plan
1. Chạy các tập lệnh Python (sử dụng regex/replacement) để thay thế hoặc chèn mã Typst (bao gồm code vẽ hình `#cetz.canvas(...)` hoặc `#sm-*`) vào đúng vị trí các `#tln` block trong 10 đề.
2. Dùng lệnh `typst compile` cho tất cả 10 đề để xác minh không có lỗi cú pháp do block hình vẽ gây ra.
3. Sinh ảnh bằng Python PDF-to-image để user trực tiếp quan sát.
