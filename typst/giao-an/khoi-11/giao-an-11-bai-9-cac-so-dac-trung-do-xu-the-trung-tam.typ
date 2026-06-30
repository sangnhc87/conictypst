// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11 — Bài 9. Các số đặc trưng đo xu thế trung tâm (Bản nâng cấp)
// Trường THPT Nguyễn Hữu Cảnh  ·  Tổ Toán  ·  GV: Nguyễn Văn Sang
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "BÀI 9. CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM (PHIÊN BẢN TRẢI NGHIỆM)",
  thoi-gian: "1 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "kiến thức")
- Nêu được ý nghĩa và cách tính các số đặc trưng đo xu thế trung tâm: Số trung bình, Trung vị, Tứ phân vị, Mốt cho mẫu số liệu ghép nhóm.
- Giải thích được tại sao trong một số trường hợp, Số trung bình không đại diện tốt bằng Trung vị hoặc Mốt.

#muc("2", "năng lực")
*Năng lực chung:*
#nl("Giao tiếp và hợp tác")[Tích cực tham gia trò chơi đóng vai "Giám đốc nhân sự", biết phân công nhiệm vụ tính toán trong nhóm.]
#nl("Giải quyết vấn đề")[Biết cách chọn đại lượng thống kê phù hợp để tư vấn kinh doanh (chọn size áo, khảo sát độ tuổi).]

*Năng lực đặc thù:*
#nl("Tư duy và lập luận toán học")[Phân tích và tính toán chính xác số liệu ghép nhóm. Biện luận được sự sai lệch của số trung bình khi có giá trị đột biến.]

*Năng lực số:*
#nls("2.1.NC1a")[Sử dụng thành thạo máy tính Casio chức năng Thống kê (Statistics) để kiểm tra kết quả.]

#muc("3", "phẩm chất")
#pc("Trung thực")[Thu thập và xử lý số liệu khách quan trong dự án kinh doanh giả định.]

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- *Thiết bị:* Máy chiếu, học sinh có máy tính Casio.
- *Học liệu:* Bảng phụ ghi sẵn các công thức ghép nhóm, Phiếu bài tập "Hồ sơ công ty".

#phan("III", "TIẾN TRÌNH DẠY HỌC")

#hd("1", "Xác định vấn đề (Mở đầu)", "5")
#ten-hd[Khởi động: Cú lừa "Lương trung bình 200 củ"]
#mt-hd[Học sinh thấy được "lỗ hổng" của Số trung bình cộng, từ đó hiểu tại sao phải sinh ra Trung vị và Mốt.]
#nd-hd[
  - *Tình huống:* Công ty X tuyển dụng với lời hứa: "Lương trung bình ở đây là 200 triệu/tháng".
  - *Sự thật:* Công ty có 5 người. 4 nhân viên lương 10 triệu/tháng. Giám đốc lương 960 triệu/tháng.
  - *Câu hỏi:* Điểm trung bình có sai không? (Không, $(10*4 + 960)/5 = 200$). Vậy tại sao lại mang cảm giác lừa đảo? Ta nên dùng đại lượng nào để phản ánh đúng mức lương "phổ biến nhất" của công ty này?
]
#sp-hd[Học sinh nhận ra Số trung bình bị kéo lệch bởi giá trị khổng lồ (960). Đề xuất dùng "Mức lương xuất hiện nhiều nhất" (Mốt) hoặc "Mức lương của người đứng giữa" (Trung vị).]
#tc-hd[
  #buoc("1", "Giao việc", "2")[Chiếu tình huống tuyển dụng, yêu cầu học sinh thảo luận nhanh.]
  #buoc("2", "Chốt vấn đề", "3")[Giáo viên dẫn dắt: "Để không bị lừa bởi dữ liệu, hôm nay chúng ta sẽ trang bị 3 vũ khí: Số trung bình, Trung vị và Mốt đối với số liệu ghép nhóm".]
]

#hd("2", "Hình thành kiến thức", "25")

#hd-tp("2.1", "Số trung bình, Trung vị, Tứ phân vị (Ghép nhóm)", "15")
#ten-hd[Game ráp công thức: "Đãi cát tìm vàng"]
#mt-hd[Giúp học sinh bớt nhàm chán với các công thức dài dòng của số liệu ghép nhóm.]
#nd-hd[
  - Bảng số liệu ghép nhóm không có giá trị cụ thể, nên ta phải "mượn" giá trị đại diện (trung bình cộng của 2 đầu mút).
  - *Nhiệm vụ:* Giáo viên dán các mảnh ghép công thức lộn xộn trên bảng. Các đội lên thi nhau "Ráp" đúng công thức tính Trung vị ($M_e$) và Tứ phân vị.
]
#sp-hd[
  Công thức chuẩn trên bảng:
  - $M_e = L + (n/2 - c f) / f . h$ (Với $L$: giới hạn dưới, $c f$: tần số tích lũy...).
]
#tc-hd[
  #buoc("1", "Trò chơi ráp chữ", "5")[Chia 2 đội lên bảng dán nam châm ráp công thức. Lớp cổ vũ.]
  #buoc("2", "Giải thích", "10")[Giáo viên chỉ vào công thức hoàn chỉnh, giải thích từng biến số ($L, n, c f, f, h$) để học sinh ghi nhớ bằng trực quan thay vì học thuộc vẹt.]
]

#hd-tp("2.2", "Mốt của mẫu số liệu ghép nhóm", "10")
#ten-hd[Câu chuyện kinh doanh: "Nhập size áo nào bán 20/11?"]
#mt-hd[Hiểu được khái niệm Mốt ($M_o$) và cách xác định nó trong kinh doanh.]
#nd-hd[
  - *Tình huống:* Cửa hàng bán áo thun 20/11. Có bảng thống kê số lượng bán ra theo chiều cao (ghép nhóm: \[150;155\), \[155;160\)...).
  - Hỏi: Chủ cửa hàng nên quan tâm đến chiều cao Trung bình, Trung vị hay Mốt? Tại sao?
  - Rút ra cách tính $M_o$ cho số liệu ghép nhóm.
]
#sp-hd[
  - Phải quan tâm đến Mốt (size phổ biến nhất để nhập hàng).
  - Công thức: $M_o = L + (Delta_1) / (Delta_1 + Delta_2) . h$
]
#tc-hd[
  #buoc("1", "Tương tác", "3")[Học sinh trả lời câu hỏi tình huống kinh doanh.]
  #buoc("2", "Ghi nhớ", "7")[Giáo viên cung cấp công thức, học sinh ghi bài.]
]

#hd("3", "Luyện tập", "10")
#ten-hd[Đấu trường: "Giám đốc Nhân sự"]
#mt-hd[Luyện tập tính toán tốc độ cao với máy tính Casio.]
#nd-hd[
  - *Nhiệm vụ:* Có 2 tệp hồ sơ độ tuổi nhân viên (đã ghép nhóm) của Công ty Công nghệ và Công ty May mặc.
  - Các nhóm tính nhanh Trung vị và Mốt của 2 công ty. Công ty nào có đội ngũ "trẻ" hơn?
]
#sp-hd[Bài làm trên bảng phụ của các nhóm.]
#tc-hd[
  #buoc("1", "Triển khai", "2")[Phát bảng phụ, học sinh dùng Casio bấm số liệu.]
  #buoc("2", "Thực hành", "5")[Học sinh thảo luận, tính toán phân chia công việc.]
  #buoc("3", "Chấm điểm", "3")[Giáo viên đối chiếu kết quả, thưởng điểm cho nhóm nhanh nhất.]
]

#hd("4", "Vận dụng", "5")
#ten-hd[Dự án mini: "Khảo sát thị hiếu Gen Z"]
#mt-hd[Vận dụng Thống kê vào đời sống học đường.]
#nd-hd[
  - *Nhiệm vụ về nhà:* Khảo sát tiền tiêu vặt một tuần của 30 bạn trong lớp.
  - Phân chia thành các nhóm (VD: \[100k; 200k\), \[200k; 300k\)...).
  - Tính các số đặc trưng và đưa ra lời khuyên: *Nếu mở căng tin bán đồ ăn sáng, nên định giá món ăn ở mức nào để hợp túi tiền đa số các bạn?*
]
#sp-hd[Báo cáo mini thu vào đầu giờ học sau.]
#tc-hd[
  #buoc("1", "Giao việc", "5")[Giáo viên hướng dẫn cách lấy số liệu ẩn danh (Google Forms) để bảo mật thông tin bạn bè.]
]
