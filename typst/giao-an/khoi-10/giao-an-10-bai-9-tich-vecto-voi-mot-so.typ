// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10 — Bài 9. Tích của một vectơ với một số (Bản nâng cấp)
// Trường THPT Nguyễn Hữu Cảnh  ·  Tổ Toán  ·  GV: Nguyễn Văn Sang
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "BÀI 9. TÍCH CỦA MỘT VECTƠ VỚI MỘT SỐ (PHIÊN BẢN TRẢI NGHIỆM)",
  thoi-gian: "1 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "kiến thức")
- Hiểu được định nghĩa tích của một số với một vectơ ($k vect(a)$).
- Nắm vững và áp dụng được các tính chất của phép nhân vectơ với một số.
- Vận dụng được điều kiện hai vectơ cùng phương, điều kiện ba điểm thẳng hàng.

#muc("2", "năng lực")
*Năng lực chung:*
#nl("Tự chủ và tự học")[Chủ động thao tác trên phần mềm mô phỏng để tự đúc kết tính chất của vectơ.]
#nl("Giao tiếp và hợp tác")[Tích cực thảo luận nhóm, biết phối hợp trong trò chơi "Kiến trúc sư nhí".]

*Năng lực đặc thù:*
#nl("Tư duy và lập luận toán học")[Phân tích sự thay đổi hướng và độ dài của vectơ khi nhân với số âm/dương.]
#nl("Mô hình hóa toán học")[Biểu diễn được các lực vật lý (lực kéo, sức gió) thông qua phép nhân vectơ.]

*Năng lực số:*
#nls("2.1.NC1a")[Sử dụng thành thạo phần mềm GeoGebra để khảo sát sự biến thiên của vectơ.]

#muc("3", "phẩm chất")
#pc("Chăm chỉ")[Có ý thức tìm tòi, ứng dụng Toán học vào Vật lý (lực, vận tốc).]

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- *Thiết bị:* Máy chiếu, điện thoại cài sẵn app GeoGebra.
- *Học liệu:* Giấy ô ly to (A3), thước kẻ cho hoạt động vẽ thiết kế.

#phan("III", "TIẾN TRÌNH DẠY HỌC")

#hd("1", "Xác định vấn đề (Mở đầu)", "5")
#ten-hd[Khởi động: "Giải cứu con thuyền - Bài toán về Lực"]
#mt-hd[Kích thích sự hứng thú, thấy được nhu cầu thực tế phải "nhân bản" một vectơ lên nhiều lần.]
#nd-hd[
  - *Tình huống:* Chiếu video 1 chiếc thuyền bị mắc cạn. Một chiếc ca nô kéo thuyền với lực $vect(F)$. Thuyền không nhúc nhích. Gọi thêm 2 chiếc ca nô giống hệt đến kéo cùng hướng.
  - *Câu hỏi:* Lực kéo mới gấp mấy lần lực kéo cũ? Hướng của lực thay đổi thế nào? Làm sao biểu diễn lực kéo mới đó bằng một công thức Toán học duy nhất thay vì phép cộng dài dòng $vect(F) + vect(F) + vect(F)$?
]
#sp-hd[Học sinh nhận ra sự cần thiết của phép nhân một số với một vectơ (viết gọn thành $3 vect(F)$).]
#tc-hd[
  #buoc("1", "Giao việc", "2")[Chiếu video ngắn, đặt câu hỏi gợi mở.]
  #buoc("2", "Giải quyết", "3")[Học sinh phát biểu. Giáo viên dẫn dắt vào bài: "Trong Toán học, người ta gọi đó là tích của một số với một vectơ".]
]

#hd("2", "Hình thành kiến thức", "25")

#hd-tp("2.1", "Định nghĩa tích vectơ với một số", "12")
#ten-hd[Trải nghiệm công nghệ: "Phù thủy GeoGebra biến hóa Vectơ"]
#mt-hd[Học sinh tự khám phá ra mối liên hệ về ĐỘ DÀI và HƯỚNG khi nhân vectơ với số âm/dương.]
#nd-hd[
  - Học sinh mở link GeoGebra do GV gửi. Trên màn hình có vectơ $vect(a)$ và thanh trượt $k$.
  - *Nhiệm vụ 1:* Kéo $k = 2$, $k = 3$. Quan sát độ dài và hướng của $k vect(a)$.
  - *Nhiệm vụ 2:* Kéo $k = -1$, $k = -2$. Có hiện tượng gì xảy ra với mũi tên?
  - *Rút ra kết luận:* Định nghĩa $k vect(a)$ là gì?
]
#sp-hd[
  Định nghĩa: $k vect(a)$ là một vectơ:
  - Cùng hướng với $vect(a)$ nếu $k > 0$, ngược hướng nếu $k < 0$.
  - Độ dài: $|k vect(a)| = |k| . |vect(a)|$.
]
#tc-hd[
  #buoc("1", "Trải nghiệm", "5")[Học sinh vuốt thanh trượt trên điện thoại, thảo luận cặp đôi xem điều gì đang xảy ra.]
  #buoc("2", "Chốt kiến thức", "7")[Giáo viên gọi 1 cặp học sinh phát biểu, chuẩn hóa lại định nghĩa lên bảng.]
]

#hd-tp("2.2", "Điều kiện cùng phương và 3 điểm thẳng hàng", "13")
#ten-hd[Ứng dụng thực chiến: "Định vị vệ tinh"]
#mt-hd[Biết cách kiểm tra hai vectơ cùng phương và ứng dụng chứng minh 3 điểm thẳng hàng.]
#nd-hd[
  - *Nhiệm vụ:* Để 3 trạm phát sóng $A, B, C$ nằm trên một đường thẳng, kỹ sư viễn thông cần đảm bảo vectơ $vect(A B)$ và $vect(A C)$ phải liên hệ với nhau thế nào?
  - *Câu hỏi:* Khi nào thì hai vectơ $vect(a)$ và $vect(b)$ ($vect(b) != vect(0)$) cùng phương? Điều kiện để $A, B, C$ thẳng hàng?
]
#sp-hd[
  - Điều kiện cùng phương: $vect(a)$ cùng phương $vect(b)$ $<=>$ Tồn tại $k$ sao cho $vect(a) = k vect(b)$.
  - Điều kiện thẳng hàng: $A, B, C$ thẳng hàng $<=>$ $vect(A B) = k vect(A C)$.
]
#tc-hd[
  #buoc("1", "Tương tác", "5")[Giáo viên vẽ hình 3 điểm thẳng hàng, yêu cầu HS tìm số $k$ liên hệ giữa các vectơ.]
  #buoc("2", "Ghi nhớ", "8")[Giáo viên chốt lý thuyết trọng tâm vào vở.]
]

#hd("3", "Luyện tập", "10")
#ten-hd[Hoạt động nhóm: "Kiến trúc sư nhí - Thiết kế mặt bằng"]
#mt-hd[Sử dụng lưới ô vuông và phép nhân vectơ để dựng hình nhanh chóng.]
#nd-hd[
  - *Nhiệm vụ:* Phát giấy A3 (có in sẵn lưới ô vuông). Cho trước vectơ $vect(u)$ và $vect(v)$.
  - Yêu cầu các nhóm vẽ các điểm $M, N, P$ sao cho: $vect(O M) = 2 vect(u)$, $vect(O N) = -1/2 vect(v)$, $vect(O P) = 2 vect(u) - vect(v)$.
  - Đội nào vẽ đúng, nối 3 điểm lại tạo thành hình tam giác chuẩn kích thước nhất sẽ thắng.
]
#sp-hd[Hình vẽ trên giấy A3 chính xác về tỉ lệ và hướng.]
#tc-hd[
  #buoc("1", "Triển khai", "2")[Phát giấy A3, phổ biến luật chơi.]
  #buoc("2", "Thực hành", "6")[Học sinh dùng thước vẽ hình trên giấy.]
  #buoc("3", "Đánh giá", "2")[Treo sản phẩm lên bảng, GV sửa sai (nếu có).]
]

#hd("4", "Vận dụng", "5")
#ten-hd[Dự án mini: Lập trình Flycam]
#mt-hd[Vận dụng phân tích vectơ vào bài toán chuyển động có lực cản.]
#nd-hd[
  - *Bài toán về nhà:* Flycam đang bay với vận tốc $vect(v)$. Gió thổi với vận tốc $vect(w)$. Vận tốc thực tế của Flycam là $vect(v) + vect(w)$. Nếu muốn tăng gấp đôi tốc độ hiện tại, người điều khiển cần thiết lập động cơ tạo ra vận tốc mới bằng bao nhiêu (tính theo $vect(v)$ và $vect(w)$)?
]
#sp-hd[Bài giải viết tay nộp vào tiết sau.]
#tc-hd[
  #buoc("1", "Giao việc", "5")[Giáo viên giao đề và gợi ý cách dùng phép cộng và nhân vectơ để tính lực tổng hợp.]
]
