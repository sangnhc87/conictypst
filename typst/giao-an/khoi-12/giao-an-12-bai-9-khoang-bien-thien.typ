// ════════════════════════════════════════════════════════════════════════
// GIAO-AN-12-BAI-9-KHOANG-BIEN-THIEN-VA-KHOANG-TU-PHAN-VI.TYP
// Giáo án Toán 12 — Bài 9. Khoảng biến thiên và khoảng tứ phân vị (Bản nâng cấp)
// Trường THPT Nguyễn Hữu Cảnh  ·  Tổ Toán  ·  GV: Nguyễn Văn Sang
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "BÀI 9. KHOẢNG BIẾN THIÊN VÀ KHOẢNG TỨ PHÂN VỊ (PHIÊN BẢN TRẢI NGHIỆM)",
  thoi-gian: "1 tiết",
)

// ════════════════════════════════════════════════════════════════════════
#phan("I", "MỤC TIÊU")
// ════════════════════════════════════════════════════════════════════════

#muc("1", "kiến thức")
- Nêu được định nghĩa và công thức tính khoảng biến thiên ($R$) của mẫu số liệu.
- Xác định được các tứ phân vị ($Q_1, Q_2, Q_3$) của mẫu số liệu và công thức tính khoảng tứ phân vị ($Delta_Q$).
- Hiểu được ý nghĩa thực tiễn của $R$ và $Delta_Q$ trong việc đánh giá rủi ro, đo lường sự ổn định.

#muc("2", "năng lực")
*Năng lực chung:*
#nl("Tự chủ và tự học")[Chủ động tìm hiểu tài liệu, tự rút ra quy luật thống kê qua các công cụ trực quan.]
#nl("Giao tiếp và hợp tác")[Tích cực thảo luận, phản biện sôi nổi trong các trò chơi nhập vai và hoạt động tiếp sức.]
#nl("Giải quyết vấn đề và sáng tạo")[Biết dùng thống kê để ra quyết định trong các tình huống thực tế (đầu tư, phân tích hành vi).]

*Năng lực đặc thù:*
#nl("Năng lực tư duy và lập luận toán học")[Phân tích được ưu/nhược điểm của Khoảng biến thiên so với Khoảng tứ phân vị khi có giá trị đột biến (outlier).]
#nl("Năng lực mô hình hóa toán học")[Biết chuyển hóa một vấn đề thực tế (độ rủi ro) thành bài toán đo lường độ phân tán.]

*Năng lực số:*
#nls("2.1.NC1a")[Sử dụng thành thạo Mentimeter/Blooket để tương tác trực tuyến.]
#nls("2.1.NC1b")[Sử dụng phần mềm Desmos/GeoGebra để trực quan hóa dữ liệu bằng biểu đồ hộp (Boxplot).]

#muc("3", "phẩm chất")
#pc("Trách nhiệm")[Có trách nhiệm khi làm việc nhóm tiếp sức, tính toán cẩn thận để không ảnh hưởng kết quả chung.]
#pc("Trung thực")[Phân tích dữ liệu số liệu khách quan, không làm giả số liệu báo cáo.]

// ════════════════════════════════════════════════════════════════════════
#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
// ════════════════════════════════════════════════════════════════════════

- *Thiết bị:* Máy chiếu, Smart TV (nếu có), học sinh mang theo Smartphone kết nối mạng.
- *Học liệu:*
  - Bảng phấn, bút dạ nhiều màu cho trò chơi tiếp sức.
  - Mã QR code truy cập Mentimeter (bình chọn) và Desmos (mô phỏng).
  - Phiếu học tập dạng "Hồ sơ phân tích dữ liệu" (Data Profiling).

// ════════════════════════════════════════════════════════════════════════
#phan("III", "TIẾN TRÌNH DẠY HỌC")
// ════════════════════════════════════════════════════════════════════════

#hd("1", "Xác định vấn đề (Mở đầu)", "5")
#ten-hd[Khởi động: Trò chơi nhập vai "Shark Tank - Đầu tư chứng khoán"]
#mt-hd[Kích thích sự tò mò tột độ của học sinh. Cho các em thấy Điểm trung bình là "kẻ nói dối" và sự cần thiết của các đại lượng đo lường rủi ro (độ phân tán).]
#nd-hd[
  - *Tình huống:* Giáo viên đóng vai nhà kêu gọi vốn. Cấp cho mỗi học sinh "1 Tỷ VNĐ ảo".
  - *Dữ liệu:* Chiếu lên màn hình lợi nhuận 5 tháng gần nhất của 2 startup:
    - Trà sữa A: 50; 60; 70; 80; 90 (triệu VNĐ) $=> overline(x) = 70$
    - Tiệm bánh B: 10; 70; 70; 70; 130 (triệu VNĐ) $=> overline(x) = 70$
  - *Câu hỏi:* Cả hai đều có trung bình mỗi tháng lãi 70 triệu. Các "Shark" sẽ rót 1 tỷ vào đâu? Vì sao? Làm sao để đo lường bằng Toán học xem công ty nào có "biến động rủi ro" cao hơn?
]
#sp-hd[
  Học sinh nhận ra sự lừa dối của trung bình cộng. Chọn Trà sữa A vì ổn định hơn. Nhận ra cần một công cụ Toán học mới để "đo lường sự ổn định/phân tán".
]
#tc-hd[
  #buoc("1", "Giao nhiệm vụ", "1")[Giáo viên trình chiếu tình huống, yêu cầu HS quét mã QR vào Mentimeter để "Rót vốn".]
  #buoc("2", "Thực hiện", "2")[Học sinh hào hứng thảo luận và bấm chọn A hoặc B trên điện thoại.]
  #buoc("3", "Báo cáo", "1")[Giáo viên show biểu đồ tỉ lệ chọn trực tiếp trên màn hình, mời 1 bạn chọn A và 1 bạn chọn B bảo vệ quan điểm.]
  #buoc("4", "Chốt vấn đề", "1")[Giáo viên dẫn dắt: Để đo lường sự "thất thường" của công ty B, Toán học dùng *Khoảng biến thiên* và *Khoảng tứ phân vị*.]
]

#hd("2", "Hình thành kiến thức", "25")

#hd-tp("2.1", "Khoảng biến thiên: Cái nhìn toàn cảnh", "10")
#ten-hd[Minh họa thực tế: "Truy tìm giới hạn chiều cao"]
#mt-hd[Học sinh tự xây dựng được công thức tính $R$ và tự phát hiện ra nhược điểm chí mạng của nó.]
#nd-hd[
  - *Hành động:* Mời 5 học sinh có chiều cao khác nhau xếp hàng trước bạt (tượng trưng cho dữ liệu).
  - *Vấn đề:* Để biết độ lệch chiều cao của nhóm này lớn cỡ nào, ta làm sao nhanh nhất?
  - *Cú twist:* Bất ngờ mời thêm 1 học sinh cao nhất trường (cỡ 1m90) đứng vào nhóm. Nhóm bỗng nhiên bị tính là có "độ chênh lệch khổng lồ".
]
#sp-hd[
  - Rút ra công thức: $R = x_(max) - x_(min)$.
  - Rút ra nhược điểm: Khoảng biến thiên $R$ cực kỳ dễ bị "làm nhiễu" bởi các giá trị đột biến (như bạn cao 1m90).
]
#tc-hd[
  #buoc("1", "Giao nhiệm vụ", "2")[Giáo viên chọn mẫu trực quan ngay tại lớp. Yêu cầu HS dưới lớp ước lượng $R$.]
  #buoc("2", "Tương tác", "6")[Giáo viên thực hiện cú twist thêm bạn siêu cao. Đặt câu hỏi: *"Sự chênh lệch này có đại diện cho cả nhóm nữa không?"*]
  #buoc("3", "Chốt kiến thức", "2")[Giáo viên chốt công thức trên slide và kết luận: Ta cần một công cụ khác tinh vi hơn, cắt bỏ đi các phần tử đột biến này.]
]

#hd-tp("2.2", "Khoảng tứ phân vị: Vùng an toàn", "15")
#ten-hd[Trải nghiệm công nghệ: Bí ẩn của chiếc "Biểu đồ hộp" (Boxplot)]
#mt-hd[Biết tính $Delta_Q$ và hiểu rõ bản chất hình học của nó là "cái hộp chứa 50% dữ liệu lõi".]
#nd-hd[
  - *Tương tác số:* Giáo viên mở Desmos, chiếu Biểu đồ hộp của 1 tập dữ liệu (gồm 3 vạch $Q_1, Q_2, Q_3$).
  - *Thử thách:* Cho học sinh kéo thả một điểm dữ liệu chạy tít ra xa (tạo outlier). Học sinh quan sát thấy $R$ bị kéo giãn vô tận, nhưng "Cái hộp ở giữa" ($Delta_Q$) vẫn trơ trơ, không bị biến dạng.
  - *Lý thuyết:* Tính các $Q_1, Q_2, Q_3$ và $Delta_Q = Q_3 - Q_1$.
]
#sp-hd[
  - Nắm được công thức chia dữ liệu thành 4 phần. Tính được $Delta_Q$.
  - Khắc sâu bản chất: $Delta_Q$ đo lường sự phân tán của 50% dữ liệu ở giữa, "miễn nhiễm" với giá trị đột biến.
]
#tc-hd[
  #buoc("1", "Thực hành số", "5")[Giáo viên biểu diễn Desmos, học sinh lên bảng vuốt màn hình tương tác để tự thấy sự thay đổi.]
  #buoc("2", "Lý thuyết", "7")[Giáo viên hướng dẫn cách tính tay để tìm ra 3 chốt chặn $Q_1, Q_2, Q_3$ bằng sơ đồ chia đôi con đường.]
  #buoc("3", "Chốt kiến thức", "3")[Chốt công thức và ý nghĩa của "Vùng an toàn" (Khoảng tứ phân vị).]
]

#hd("3", "Luyện tập", "10")
#ten-hd[Game thi đấu: "Trạm đua Tốc độ - Giải cứu Dữ liệu"]
#mt-hd[Rèn luyện kĩ năng tính toán thần tốc và tinh thần làm việc nhóm (teamwork) dồn dập.]
#nd-hd[
  - Chia lớp thành các trạm (4 người/nhóm). Phát cho mỗi nhóm 1 tờ giấy A3 to.
  - *Nhiệm vụ:* Cho 1 dãy số liệu (VD: Số lượt view TikTok của 8 video clip).
  - *Luật đua (Relay):*
    - Người số 1: Phải sắp xếp thứ tự và tính $R$. Chạy về đưa bút cho người 2.
    - Người số 2: Tìm $Q_2$ (Trung vị).
    - Người số 3: Tìm $Q_1$ và $Q_3$.
    - Người số 4: Tính $Delta_Q$ và dán giấy lên bảng. Nhóm nào xong trước và đúng sẽ nhận quà.
]
#sp-hd[
  Giấy A3 của các nhóm trình bày rõ ràng các bước tính toán. Học sinh vừa vui vừa rèn được sự cẩn thận (vì 1 người tính sai là cả đội sai).
]
#tc-hd[
  #buoc("1", "Set up", "2")[Phát dụng cụ, bật nhạc nền sôi động (nhạc game show) để tạo không khí.]
  #buoc("2", "Triển khai đua", "5")[Học sinh thực hiện đua tiếp sức. Giáo viên đóng vai MC cổ vũ và bấm giờ.]
  #buoc("3", "Chấm điểm", "3")[Sửa bài trực tiếp trên bảng, trao thưởng cho nhóm vô địch.]
]

#hd("4", "Vận dụng & Mở rộng", "5")
#ten-hd[Dự án cá nhân: "Data Scientist (Nhà phân tích Dữ liệu) nhí"]
#mt-hd[Kéo Toán học ra ngoài đời thực, rèn luyện kĩ năng sử dụng Excel và phân tích hành vi.]
#nd-hd[
  - *Nhiệm vụ về nhà:* Mở ứng dụng "Screen Time" (Thời gian sử dụng màn hình) trên điện thoại của em. Lấy số liệu số phút dùng điện thoại mỗi ngày trong 10 ngày qua.
  - Yêu cầu:
    1. Nhập vào Excel/Google Sheets.
    2. Dùng hàm tính $R$ và $Delta_Q$.
    3. Viết 1 đoạn văn 3 dòng nhận xét: *"Thói quen sử dụng điện thoại của em có ổn định không hay rất thất thường? Vì sao?"*
]
#sp-hd[
  Báo cáo mini kèm file Excel hoặc ảnh chụp nộp qua nhóm Zalo lớp/Google Classroom. Học sinh giật mình nhận ra thói quen số của bản thân qua lăng kính Toán học.
]
#tc-hd[
  #buoc("1", "Giao việc", "2")[Chiếu màn hình Screen Time mẫu của giáo viên làm ví dụ tạo sự gần gũi.]
  #buoc("2", "Thực hiện", "0")[Học sinh làm tại nhà.]
]
