# Sự khác biệt bản chất giữa "Xếp 1 hàng ngang" và "Lưới 3 cột R hàng"

## 1. Tại sao bảng PIE cực mạnh cho 1 Hàng Ngang?
Trong bài toán 1 hàng ngang (như file `KhongKe.typ`), không gian ghế là liên tục. Nếu ta muốn 2 bạn A không ngồi cạnh nhau, ta dùng PIE: "ghép 2 bạn A thành khối A2". Khối A2 này sau đó có thể được hoán vị tự do với các bạn khác và các ghế trống. 
Công thức lập bảng PIE $i, j, k$ đếm cực kỳ mượt mà vì mọi thực thể (dù là khối ghép hay ghế trống) đều bình đẳng và có thể đứng ở bất kỳ đâu trên hàng ngang.

## 2. Tại sao bảng PIE "phá sản" hoặc cực kỳ phức tạp trên Lưới 3 Cột?
Trên lưới $R$ hàng $\times$ 3 cột, không gian bị **chặt đứt thành các hàng cố định**. Ranh giới hàng là tuyệt đối (mỗi hàng đúng 3 ghế).
Nếu ta dùng PIE "ghép cặp":
- Ghép 2 bạn E vào cùng 1 hàng: Khối này chiếm 2 ghế của hàng đó, chỉ còn 1 chỗ.
- Ghép 3 bạn E vào cùng 1 hàng: Khối này chiếm trọn 3 ghế.
Sự phân bố số ghế còn lại trong mỗi hàng trở nên không đồng đều. Ta **KHÔNG THỂ** hoán vị tự do các khối này với nhau như trên 1 hàng ngang được, vì chúng phải vừa vặn với ranh giới của các hàng (sức chứa = 3).
Hơn nữa, nếu cố lập bảng PIE, một hàng vi phạm có thể chứa 2 bạn E (tính 1 cặp) hoặc 3 bạn E (tính 3 cặp). Phép bù trừ PIE sẽ phải có các hệ số sửa lỗi vô cùng phức tạp (đếm lùi cả bộ ba), hoàn toàn không còn giữ được khuôn mẫu 1 dòng đơn giản như trong `KhongKe.typ`.

## 3. "Chân ái" của Lưới là Hệ Phương Trình Cấu Trúc Hàng
Vì ranh giới hàng là cố định (tối đa 1E, 1G, 1F $\Rightarrow$ tổng bằng 3), cách tự nhiên nhất và toán học nhất là đếm xem có bao nhiêu hàng loại $(E,G,F)$, bao nhiêu hàng loại $(E,G)$, v.v.
Đây chính là tư duy "chia để trị" dựa trên cấu trúc không gian của bài toán.

## 4. Cách Đồng Bộ Hóa Tư Duy
Để học sinh không bị ngợp, ta cần 1 đoạn chuyển giao lý thuyết (Transition) trong tài liệu:
- Mở đầu bằng việc phân tích vì sao PIE ghép khối trên hàng ngang không áp dụng được cho lưới có ranh giới cứng.
- Giới thiệu Hệ phương trình cấu trúc như là phiên bản PIE của "lưới 2D". 
- Trình bày dạng bảng cases của hệ phương trình sao cho nó có cảm giác "từng dòng, từng dòng" y hệt như cách ta lập bảng PIE ở tài liệu trước.

