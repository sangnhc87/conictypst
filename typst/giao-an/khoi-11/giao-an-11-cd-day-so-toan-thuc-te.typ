// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Chuyên đề: Dãy số, Cấp số cộng, Cấp số nhân trong thực tiễn",
  thoi-gian: "2 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nhận biết và thiết lập được công thức tổng quát của Dãy số, Cấp số cộng (CSC), Cấp số nhân (CSN) thông qua các tình huống thực tiễn.
- Vận dụng công thức tính tổng $n$ số hạng đầu tiên của CSC, CSN để giải quyết các bài toán thực tế (xếp ghế, tính lương, lãi suất).
- Áp dụng cấp số nhân lùi vô hạn vào các mô hình vật lý và sinh học (chu kỳ bán rã, sự nảy của quả bóng, hình học Fractal).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Giải quyết vấn đề và sáng tạo:] Xây dựng mô hình toán học cho các bài toán thực tế (lãi kép, vay trả góp, tăng trưởng dân số).
  - #strong[Giao tiếp và hợp tác:] Hoạt động nhóm hiệu quả trong việc thảo luận các bài toán ứng dụng.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực mô hình hóa toán học:] Chuyển đổi ngôn ngữ đời sống sang ngôn ngữ dãy số, lập phương trình/công thức.
  - #strong[Năng lực tính toán:] Sử dụng máy tính cầm tay thành thạo để tính toán các phép tính mũ lớn, tổng CSN, CSC.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - Khai thác phần mềm bảng tính (Excel/Google Sheets) để mô phỏng bài toán lãi kép, vay trả góp qua từng kì.
  - Thực hiện bài tập trắc nghiệm trực tuyến để củng cố kiến thức.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Chịu khó tìm tòi, luyện tập tính toán các bài toán ứng dụng đa dạng.
- #strong[Trách nhiệm:] Hiểu rõ ý nghĩa của toán học trong tài chính cá nhân (tiết kiệm, vay nợ), từ đó có ý thức quản lý tài chính cá nhân.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, bảng phụ, máy tính cầm tay, điện thoại thông minh (có kết nối mạng).
- #strong[Học liệu:] Sách giáo khoa Toán 11, tài liệu chuyên đề "Ứng dụng Dãy số - CSC - CSN" (file bài tập), link bài tập Quizizz.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "10 phút")
- #strong[Tên hoạt động:] Bài toán lương khởi điểm và Câu chuyện hạt thóc bàn cờ
- #strong[Phương pháp/Kĩ thuật:] Kể chuyện, đàm thoại, đặt vấn đề.

#mt-hd[
- Thu hút sự chú ý của HS thông qua những câu chuyện kinh điển và bài toán gần gũi với đời sống.
- Gợi mở nhu cầu sử dụng công cụ Dãy số - CSC - CSN để giải toán nhanh chóng thay vì đếm hoặc tính thủ công.
]
#nd-hd[
- GV kể câu chuyện về người phát minh bàn cờ vua xin phần thưởng bằng thóc (tăng gấp đôi số hạt mỗi ô).
- GV đặt câu hỏi thực tế: Nếu nhận lương khởi điểm $10$ triệu/tháng, mỗi năm tăng $1$ triệu/tháng, thì sau $5$ năm tổng thu nhập là bao nhiêu?
]
#sp-hd[
- HS lắng nghe, thảo luận nhanh và nhận ra việc cộng dồn từng số hạng mất nhiều thời gian, cần có công thức tính tổng quát.
]
#tc-hd[
- #strong[Bước 1:] GV trình chiếu hình ảnh bàn cờ và hạt thóc, tóm tắt nhanh câu chuyện.
- #strong[Bước 2:] GV đưa ra bài toán tiền lương.
- #strong[Bước 3:] HS nêu ý tưởng giải. GV dẫn dắt vào bài mới: Sử dụng mô hình CSC và CSN để giải quyết nhanh chóng các bài toán trên.
]

#hd("2", "Hình thành kiến thức/Giải quyết vấn đề", "50 phút - Chia thành 2 HĐ thành phần")
==== 2.1. Hoạt động thành phần 2.1: Ứng dụng Cấp số cộng (25 phút)
- #strong[Tên hoạt động:] Thiết lập mô hình bài toán Cấp số cộng.
- #strong[Nội dung:] 
  - Ôn tập công thức số hạng tổng quát $u_n$ và tổng $S_n$ của CSC.
  - Phân tích Bài toán xếp ghế rạp hát (M1): Hàng sau hơn hàng trước một số lượng ghế cố định.
  - Phân tích Bài toán tính lương (M2): Lương mỗi năm tạo thành một CSC.
- #strong[Sản phẩm:] Học sinh xác định đúng đại lượng $u_1$, $d$, $n$ và áp dụng công thức $S_n$ để tìm ra đáp số.
- #strong[Tổ chức thực hiện:]
  - GV chiếu đề bài M1 (xếp ghế), yêu cầu nhóm đôi phân tích đại lượng.
  - 1 HS lên bảng trình bày, lớp nhận xét.
  - GV nhấn mạnh dấu hiệu nhận biết CSC trong thực tế: "tăng thêm một lượng không đổi".

==== 2.2. Hoạt động thành phần 2.2: Ứng dụng Cấp số nhân và CSN lùi vô hạn (25 phút)
- #strong[Tên hoạt động:] Thiết lập mô hình bài toán Cấp số nhân.
- #strong[Nội dung:]
  - Ôn tập công thức số hạng tổng quát $u_n$ và tổng $S_n$ của CSN, công thức $S$ của CSN lùi vô hạn.
  - Phân tích bài toán bóng nảy (M4): Độ cao các lần nảy tạo thành CSN.
  - Phân tích bài toán hạt thóc bàn cờ (M5) và bài toán lãi kép (M6).
- #strong[Sản phẩm:] Học sinh xác định đúng $u_1$, $q$, $n$ và tính được kết quả chính xác.
- #strong[Tổ chức thực hiện:]
  - GV chia lớp thành 4 nhóm, giao mỗi nhóm 1 bài toán thực tế (bóng nảy, lãi kép, vi khuẩn...).
  - Các nhóm thảo luận, viết lời giải ra bảng phụ.
  - Cử đại diện nhóm trình bày. GV nhận xét, chốt lại phương pháp giải toán Lãi kép.

#hd("3", "Luyện tập", "20 phút")
- #strong[Tên hoạt động:] Trắc nghiệm thực chiến
- #strong[Phương pháp/Kĩ thuật:] Trò chơi học tập tương tác.

#mt-hd[
- Củng cố và rèn luyện kĩ năng tính toán nhanh, chính xác cho các dạng toán thực tế ứng dụng dãy số.
]
#nd-hd[
- Sử dụng ứng dụng trắc nghiệm (Quizizz/Azota) với các bài toán có số liệu thay đổi so với ví dụ. Tập trung vào tính tổng CSC và bài toán lãi kép.
]
#sp-hd[
- Kết quả bài làm trên hệ thống của HS, phản hồi tỉ lệ làm đúng/sai.
]
#tc-hd[
- #strong[Bước 1:] GV cung cấp mã QR/Link truy cập hệ thống.
- #strong[Bước 2:] HS làm bài cá nhân trên thiết bị di động/máy tính bảng.
- #strong[Bước 3:] GV tổng kết điểm, khen thưởng và sửa nhanh những câu có tỉ lệ sai nhiều nhất.
]

#hd("4", "Vận dụng", "10 phút")
- #strong[Tên hoạt động:] Mô hình hóa bằng Bảng tính Tài chính
- #strong[Phương pháp/Kĩ thuật:] Thực hành trên phần mềm (Excel/Google Sheets), dự án nhỏ.

#mt-hd[
- Vận dụng kiến thức vào bài toán tài chính phức tạp (vay trả góp).
- Nâng cao năng lực số thông qua việc mô phỏng quá trình bằng bảng tính.
]
#nd-hd[
- GV giới thiệu bài toán thực tế: Vay ngân hàng 50 triệu mua xe, lãi suất $1%$/tháng, mỗi tháng trả góp 3 triệu.
- Giao nhiệm vụ lập bảng tính Excel để theo dõi dư nợ qua từng tháng, thấy được sự tác động của lãi suất (CSN) và khoản trả (CSC).
]
#sp-hd[
- Bảng tính Excel/Google Sheets hiển thị được tháng nào người vay sẽ trả hết nợ.
]
#tc-hd[
- GV thao tác mẫu 2 tháng đầu tiên trên máy chiếu.
- Giao nhiệm vụ cho học sinh thực hiện tiếp ở nhà và nộp file bảng tính qua hệ thống lớp học (ví dụ: Google Classroom/Zalo nhóm).
]

#figure(
  align(center)[#table(
    columns: (32.22%, 45.62%),
    align: (auto,auto,),
    table.header(table.cell(align: left)[], table.cell(align: center)[Duyệt
      Kế hoạch bài dạy
      
      của tổ Toán
      
      Ngày \...... tháng \...... năm \......
      
      ],),
    table.hline(),
  )]
  , kind: table
)
