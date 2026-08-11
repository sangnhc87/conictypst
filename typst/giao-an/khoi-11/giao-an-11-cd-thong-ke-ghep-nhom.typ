// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Chuyên đề: Thống kê mẫu số liệu ghép nhóm - Đánh giá rủi ro và độ ổn định",
  thoi-gian: "3 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Hiểu ý nghĩa và tính toán được các số đặc trưng đo xu thế trung tâm: Số trung bình, Trung vị, Mốt, Tứ phân vị cho mẫu số liệu ghép nhóm.
- Hiểu ý nghĩa và tính toán được các số đặc trưng đo mức độ phân tán: Khoảng biến thiên, Khoảng tứ phân vị, Phương sai, Độ lệch chuẩn cho mẫu số liệu ghép nhóm.
- Vận dụng các số đặc trưng để so sánh sự đồng đều, mức độ rủi ro, và tính ổn định của các đối tượng trong thực tế (cầu thủ thể thao, lợi nhuận quỹ đầu tư, mức lương nhân viên).
- Xác định được giá trị ngoại lệ (Outlier) trong một mẫu số liệu và hiểu cách biểu diễn trên biểu đồ hộp (Boxplot).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Giải quyết vấn đề và sáng tạo:] Phát hiện các bất thường (ngoại lệ) trong dữ liệu, từ đó có những nhận định đúng đắn về tình hình thực tế.
  - #strong[Giao tiếp và hợp tác:] Hoạt động nhóm hiệu quả trong việc thu thập và phân tích dữ liệu thực tế.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực mô hình hóa toán học:] Đọc hiểu bảng phân bố tần số ghép nhóm, biểu đồ Histogram và chuyển đổi thành các đại lượng thống kê.
  - #strong[Năng lực tư duy và lập luận toán học:] Lập luận để chọn đại lượng đo lường phù hợp (dùng độ lệch chuẩn để đo rủi ro/ổn định, dùng tứ phân vị để lọc ngoại lệ).
  - #strong[Năng lực tính toán:] Sử dụng máy tính cầm tay để tính toán phương sai, độ lệch chuẩn cho mẫu số liệu ghép nhóm.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - #strong[Tìm kiếm và xử lí thông tin:] Khai thác dữ liệu trên Internet (ví dụ: điểm số bóng rổ, giá cổ phiếu) và nhập liệu vào phần mềm bảng tính (Excel/Google Sheets).
  - #strong[Tạo và sử dụng sản phẩm số:] Sử dụng Excel hoặc Geogebra để tính toán tự động phương sai, vẽ biểu đồ hộp (Boxplot), và chia sẻ kết quả trực tuyến.

#muc("3", "PHẨM CHẤT")
- #strong[Trung thực:] Báo cáo chính xác số liệu, không làm giả hoặc bóp méo dữ liệu thống kê.
- #strong[Trách nhiệm:] Đánh giá rủi ro cẩn thận trong các quyết định dựa trên dữ liệu (tài chính, đầu tư).
- #strong[Chăm chỉ:] Tích cực rèn luyện kĩ năng tính toán và thao tác với máy tính cầm tay/phần mềm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, bảng phụ, máy tính cầm tay, phòng máy tính hoặc máy tính xách tay/máy tính bảng cho các nhóm.
- #strong[Học liệu:] Sách giáo khoa Toán 11, tài liệu chuyên đề "Thống kê mẫu ghép nhóm - Thực tế", file mẫu Excel tính thống kê.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "15 phút")
- #strong[Tên hoạt động:] Cầu thủ nào xuất sắc hơn? Đầu tư quỹ nào an toàn hơn?
- #strong[Phương pháp/Kĩ thuật:] Đóng vai, đặt vấn đề, thảo luận nhóm.

#mt-hd[
- Tạo hứng thú học tập thông qua các tình huống đưa ra quyết định thực tế cần dùng đến thống kê.
- Khơi gợi nhu cầu tìm hiểu các công cụ đo lường mức độ biến động (độ lệch chuẩn) và các giá trị bất thường (ngoại lệ).
]
#nd-hd[
- GV đưa ra 2 bài toán tình huống:
  1. *Chọn cầu thủ bóng rổ:* Cầu thủ A điểm trung bình 20.5 nhưng trận thì 10, trận thì 30. Cầu thủ B điểm trung bình 21.25 nhưng trận nào cũng quanh quẩn mức 20-22 điểm. Bạn là huấn luyện viên, bạn ưu tiên ai cho trận chung kết?
  2. *Mức lương công ty:* Có công ty quảng cáo "Lương trung bình 30 triệu", nhưng vào làm thì 80% nhân viên nhận lương 10-15 triệu, trong khi Giám đốc nhận 150 triệu. Sự bất hợp lý ở đây là gì?
]
#sp-hd[
- HS thảo luận và đưa ra nhận định: Cần một thước đo sự "ổn định" chứ không chỉ nhìn vào số trung bình. Số trung bình có thể bị "kéo lệch" bởi những người có mức lương quá cao.
]
#tc-hd[
- #strong[Bước 1:] GV trình chiếu 2 tình huống trên.
- #strong[Bước 2:] HS thảo luận tự do và phát biểu ý kiến.
- #strong[Bước 3:] GV tổng kết: Để so sánh độ ổn định ta dùng Phương sai và Độ lệch chuẩn; để phát hiện giá trị làm lệch dữ liệu ta dùng Khoảng tứ phân vị để lọc "Giá trị ngoại lệ".
]

#hd("2", "Hình thành kiến thức/Giải quyết vấn đề", "80 phút - Chia thành 2 HĐ thành phần")
==== 2.1. Hoạt động thành phần 2.1: Phương sai và Độ lệch chuẩn - Đánh giá độ ổn định/rủi ro (40 phút)
- #strong[Tên hoạt động:] So sánh độ ổn định phong độ và rủi ro đầu tư.
- #strong[Nội dung:] 
  - Ôn tập công thức số trung bình $overline(x)$, phương sai $S^2$ và độ lệch chuẩn $S$.
  - Hướng dẫn HS tính toán thông qua Bảng phân bố tần số ghép nhóm.
  - Phân tích Bài toán bóng rổ (TK-01): So sánh $S_A$ và $S_B$ để đưa ra kết luận về độ ổn định.
  - Phân tích Bài toán lợi nhuận quỹ (TK-03): Quỹ có $S$ lớn hơn tức là biến động (rủi ro) cao hơn.
- #strong[Sản phẩm:] HS tính toán đúng các giá trị, đưa ra kết luận chính xác về độ ổn định và nhận thức được ý nghĩa của $S$.
- #strong[Tổ chức thực hiện:]
  - GV chiếu bài toán TK-01, yêu cầu HS tính các giá trị đại diện $x_i$, sau đó dùng máy tính cầm tay (chế độ Statistics) để tìm nhanh kết quả.
  - Đại diện HS trình bày các bước tính tay để hiểu bản chất công thức.
  - GV nhấn mạnh ý nghĩa: Tập dữ liệu nào có $S$ nhỏ thì các giá trị tập trung quanh mức trung bình $arrow.r.double$ Ổn định, ít rủi ro. Tập có $S$ lớn $arrow.r.double$ Biến động mạnh, rủi ro cao.

==== 2.2. Hoạt động thành phần 2.2: Tứ phân vị và Giá trị ngoại lệ (Outlier) (40 phút)
- #strong[Tên hoạt động:] Đi tìm những con số "đột biến"
- #strong[Nội dung:]
  - Ôn tập công thức nội suy Tứ phân vị thứ $p$: $Q_p$ và Khoảng tứ phân vị $Delta_Q = Q_3 - Q_1$.
  - Nêu định nghĩa Giá trị ngoại lệ: Nằm ngoài khoảng $[Q_1 - 1.5 Delta_Q; Q_3 + 1.5 Delta_Q]$.
  - Phân tích bài toán lương nhân viên (TK-02): Tính các tứ phân vị, tìm ngưỡng $M_"max"$ để phát hiện lương của Giám đốc và Phó GĐ có phải là ngoại lệ hay không.
  - Giới thiệu và biểu diễn Biểu đồ hộp (Boxplot).
- #strong[Sản phẩm:] Học sinh xác định đúng $Q_1$, $Q_3$, tính được $Delta_Q$ và xác định chính xác các giá trị ngoại lệ.
- #strong[Tổ chức thực hiện:]
  - HS làm việc theo nhóm 4 người, phân công tính các Tứ phân vị.
  - Các nhóm thảo luận và kiểm tra các mức lương có vi phạm ngưỡng ngoại lệ hay không.
  - GV vẽ mẫu Biểu đồ hộp lên bảng và giải thích ý nghĩa các "râu" và các "điểm rời rạc" (ngoại lệ).
  - *Tích hợp Năng lực số:* GV trình diễn cách dùng phần mềm Geogebra / Excel để sinh ra Boxplot nhanh chóng.

#hd("3", "Luyện tập", "25 phút")
- #strong[Tên hoạt động:] Phân tích dữ liệu thực tế bằng công cụ số
- #strong[Phương pháp/Kĩ thuật:] Thực hành trên máy tính.

#mt-hd[
- Rèn kĩ năng tính toán và sử dụng phần mềm hỗ trợ thống kê.
- Khắc sâu khả năng đọc và hiểu Biểu đồ hộp.
]
#nd-hd[
- GV chuẩn bị sẵn một file Excel dữ liệu (ví dụ: điểm thi THPT QG của một tỉnh).
- Yêu cầu HS dùng hàm Excel hoặc phân tích trên Geogebra để tìm 5 con số đặc trưng và phát hiện số điểm ngoại lệ.
]
#sp-hd[
- File báo cáo của HS có Biểu đồ hộp và danh sách các giá trị ngoại lệ.
]
#tc-hd[
- #strong[Bước 1:] GV gửi file dữ liệu qua Zalo lớp hoặc Google Classroom.
- #strong[Bước 2:] HS thực hành trên máy (hoặc dùng điện thoại/tablet có Excel).
- #strong[Bước 3:] Các cá nhân hoàn thành nộp file lên hệ thống để GV chấm điểm quá trình.
]

#hd("4", "Vận dụng", "15 phút - Dự án tại nhà")
- #strong[Tên hoạt động:] Báo cáo rủi ro cổ phiếu
- #strong[Phương pháp/Kĩ thuật:] Dạy học dự án.

#mt-hd[
- Vận dụng kiến thức thống kê để đánh giá tài chính thực tế, phát triển năng lực nghiên cứu.
]
#nd-hd[
- #strong[Nhiệm vụ:] Chia lớp thành các nhóm. Mỗi nhóm chọn 2 mã cổ phiếu (ví dụ: VNM và FPT). 
  - Thu thập giá đóng cửa trong 30 ngày gần nhất (sử dụng các trang web tài chính).
  - Lập bảng phân bố tần số ghép nhóm.
  - Tính Số trung bình và Độ lệch chuẩn để đánh giá mã nào mang lại lợi nhuận trung bình cao hơn và mã nào rủi ro cao hơn.
- #strong[Tích hợp Năng lực số:] HS nộp báo cáo bằng PowerPoint hoặc Slide trực tuyến, có kèm ảnh chụp bảng dữ liệu từ Excel và đồ thị trực quan.
]
#sp-hd[
- Bài thuyết trình của các nhóm vào tiết học sau.
]
#tc-hd[
- GV hướng dẫn cách thu thập dữ liệu giá cổ phiếu.
- Đưa ra rubric đánh giá dự án (điểm dữ liệu đầy đủ, tính toán chính xác, lập luận logic, trình bày đẹp).
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
