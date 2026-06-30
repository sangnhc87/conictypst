// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 6",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Hệ thống hóa] được kiến thức về:
  - Hàm số mũ $y = a^x$ (tập xác định, tập giá trị, tính đơn điệu, đồ
    thị).
  - Hàm số lôgarit $y = log_a x$ (tập xác định, tập giá trị, tính đơn
    điệu, đồ thị).
  - Mối quan hệ giữa hàm số mũ và hàm số lôgarit (là hai hàm số ngược
    nhau).
  - Các phương trình, bất phương trình mũ và lôgarit cơ bản.
- #strong[Vận dụng] được kiến thức đã học để giải quyết các bài tập ôn
  tập.

#muc("2", "NĂNG LỰC")
==== a. Năng lực chung
- #strong[Năng lực tự chủ và tự học:] Chủ động tìm kiếm, hệ thống hóa
  kiến thức; tự đánh giá được mức độ hiểu bài của bản thân.
- #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm, trình
  bày, chia sẻ, lắng nghe và phản hồi ý kiến của bạn bè.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích được các
  yêu cầu của bài toán, đề xuất giải pháp và thực hiện giải quyết vấn
  đề.

==== b. Năng lực đặc thù (Năng lực Toán học)
- #strong[Năng lực tư duy và lập luận Toán học:] Lập luận logic khi hệ
  thống hóa kiến thức và giải các bài tập ôn tập.
- #strong[Năng lực mô hình hóa Toán học:] Nhận biết được các tình huống
  thực tế có thể vận dụng hàm số mũ, lôgarit để mô hình hóa.
- #strong[Năng lực giao tiếp Toán học:] Sử dụng đúng ngôn ngữ, kí hiệu
  Toán học khi trình bày kiến thức và lời giải.

==== c. Năng lực số (Tích hợp theo TT số 02/2025/TT-BGDĐT)
- 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
- 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
  tin và nội dung trong môi trường số.
- 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin và
  nội dung này cũng như điều hướng giữa chúng.
- 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Có ý thức tự học, tích cực hoàn thành nhiệm vụ được
  giao.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ của nhóm, với sản
  phẩm học tập của mình.
- #strong[Trung thực:] Thể hiện sự trung thực trong làm bài tập và đánh
  giá kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
=== 1. Giáo viên
- Máy tính, máy chiếu, bảng phụ.
- Phần mềm trình chiếu (PowerPoint, Google Slides) với các sơ đồ, đồ thị
  hàm số mũ và lôgarit, các bài tập trắc nghiệm/tự luận.
- Công cụ tạo phiếu học tập trực tuyến (Quizizz, Google Forms, Kahoot)
  để đánh giá nhanh.

=== 2. Học sinh
- Sách giáo khoa, vở ghi, dụng cụ học tập.
- Điện thoại thông minh/Máy tính bảng/Laptop (có kết nối Internet) để
  phục vụ tra cứu thông tin và sử dụng phần mềm Geogebra (nếu có thể).
- Máy tính cầm tay.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
=== Hoạt động 1: TỔNG HỢP KIẾN THỨC (15 phút)
==== 1. Hoạt động Khởi động/Nối tiếp (2 phút)
- #strong[Tên hoạt động:] #strong[\"Khởi động nhanh\"]
- #strong[Mục tiêu:] Kích thích sự hứng thú và huy động kiến thức nền.
- #strong[Thực hiện:] GV đưa ra 2-3 câu hỏi trắc nghiệm nhanh (dạng
  đúng/sai hoặc lựa chọn) về định nghĩa hoặc công thức cơ bản của hàm số
  mũ/lôgarit. HS trả lời nhanh bằng cách giơ thẻ A/B/C hoặc giơ ngón
  tay.

==== 2. Hoạt động Hình thành/Tổng hợp kiến thức (13 phút)
- #strong[Tên hoạt động:] #strong[\"Sơ đồ tư duy hợp lực\"] (Phương
  pháp: Thảo luận nhóm, Sơ đồ tư duy, Dạy học tích hợp Năng lực số)
- #strong[Mục tiêu:] HS hệ thống hóa kiến thức một cách trực quan, đầy
  đủ và có sự hợp tác.
- #strong[Thực hiện:]
  - #strong[Chia nhóm:] Chia lớp thành 4 nhóm ngẫu nhiên (hoặc chia theo
    trình độ để đảm bảo sự hỗ trợ lẫn nhau).
  - #strong[Nhiệm vụ:] Mỗi nhóm vẽ một #strong[Sơ đồ tư duy] (có thể vẽ
    tay trên giấy A0 hoặc dùng công cụ số như
    #strong[MindMeister/Coggle] nếu điều kiện cho phép) tóm tắt toàn bộ
    kiến thức chương VI.
    - #strong[Nhóm 1:] Tập trung vào Hàm số mũ ($y = a^x$) và Phương
      trình mũ.
    - #strong[Nhóm 2:] Tập trung vào Hàm số lôgarit ($y = log_a x$) và
      Bất phương trình lôgarit.
    - #strong[Nhóm 3 & 4:] Tập trung vào Đồ thị (so sánh, nhận dạng) và
      ứng dụng các tính chất trong giải phương trình, bất phương trình
      tổng hợp.
  - #strong[Tích hợp Năng lực số:] Trong quá trình thực hiện, GV khuyến
    khích các nhóm #strong[sử dụng điện thoại/máy tính có kết nối
    internet] để #strong[tìm kiếm thông tin] (đồ thị, công thức) còn
    thiếu hoặc chưa chắc chắn và #strong[tải về] các hình ảnh, tài liệu
    liên quan để hoàn thiện sơ đồ tư duy của nhóm. (Biểu hiện
    #strong[Năng lực khai thác và xử lí thông tin số]).
  - #strong[Báo cáo:] GV mời ngẫu nhiên 1-2 nhóm trình bày nhanh Sơ đồ
    tư duy của nhóm mình (sử dụng máy chiếu hoặc dán lên bảng).
  - #strong[Đánh giá:] GV và HS nhận xét, bổ sung để hoàn thiện sơ đồ
    kiến thức chung.

=== Hoạt động 2: LUYỆN TẬP -- VẬN DỤNG (30 phút)
- #strong[Mục tiêu:] Củng cố, vận dụng kiến thức đã tổng hợp vào việc
  giải các dạng bài tập điển hình của chương.
- #strong[Phương pháp:] Trò chơi học tập (Game hóa), Luyện tập thực
  hành, Thảo luận cặp đôi.

==== 1. Luyện tập Củng cố (15 phút)
- #strong[Tên hoạt động:] #strong[\"Vòng quay tri thức\"] (Trò chơi học
  tập)
- #strong[Mục tiêu:] Rèn luyện kĩ năng giải quyết các dạng bài tập trắc
  nghiệm về tính chất, đồ thị, tập xác định.
- #strong[Thực hiện:]
  - GV chuẩn bị 10 câu hỏi trắc nghiệm chia thành 2 mức độ (Nhận
    biết/Thông hiểu).
  - #strong[Quy tắc:] Chia lớp thành 2 đội. Các đội lần lượt chọn câu
    hỏi. Trả lời đúng được điểm. Có quyền sử dụng quyền trợ giúp (hỏi
    bạn trong nhóm/hỏi GV).
  - #strong[Bài tập điển hình:]
    - Xác định tập xác định của hàm số $y = log_a\(f\(x\)\)$.
    - Nhận dạng đồ thị hàm số $y = a^x$ và $y = log_b x$ dựa vào cơ số
      $a\,b$.
    - So sánh các số mũ, lôgarit cùng cơ số hoặc khác cơ số.

==== 2. Luyện tập Vận dụng (10 phút)
- #strong[Tên hoạt động:] #strong[\"Thử thách cặp đôi\"] (Phương pháp:
  Thảo luận cặp đôi, Tích hợp Năng lực số)
- #strong[Mục tiêu:] Rèn luyện kĩ năng giải Phương trình/Bất phương
  trình mũ và lôgarit cơ bản.
- #strong[Thực hiện:]
  - #strong[Chia cặp:] HS làm việc theo cặp.
  - #strong[Nhiệm vụ:] GV giao 2 bài toán vận dụng (1 PT và 1 BPT).
    - #strong[Ví dụ:] Giải phương trình $log_3\(x^2 - 4 x + 4\)= 2$ và
      bất phương trình $2^(2 x - 1) > 8$.
  - #strong[Yêu cầu tích hợp Năng lực số:] Sau khi giải xong, GV yêu cầu
    HS sử dụng #strong[máy tính cầm tay] hoặc #strong[phần mềm Geogebra]
    để #strong[vẽ đồ thị] (nếu là BPT hoặc cần so sánh) hoặc #strong[thử
    lại kết quả] bằng cách thay giá trị vào phương trình ban đầu (Biểu
    hiện #strong[Năng lực sử dụng và quản lí các công cụ, phương tiện
    số]).
  - #strong[Trình bày:] Mời đại diện 1-2 cặp lên trình bày lời giải.

==== 3. Tổng kết và Giao nhiệm vụ (5 phút)
- #strong[Hệ thống hóa:] GV chốt lại các dạng kiến thức và kĩ năng quan
  trọng nhất cần nắm vững.
- #strong[Bài tập về nhà:]
  - Hoàn thành các bài tập còn lại trong SGK và SBT.
  - #strong[Giao nhiệm vụ số:] Tìm kiếm trên mạng Internet 1 bài toán
    thực tế có ứng dụng hàm số mũ hoặc lôgarit (ví dụ: lãi suất kép, độ
    pH, cường độ âm thanh,...) và trình bày lời giải ngắn gọn (chuẩn bị
    cho tiết học tiếp theo).

#figure(
  align(center)[#table(
    columns: (45.34%, 45.62%),
    align: (auto,auto,),
    table.header(table.cell(align: center)[#strong[DUYỆT KHBD CỦA
      BGH]], table.cell(align: center)[#strong[DUYỆT KHBD CỦA TỔ KHTN]],),
    table.hline(),
  )]
  , kind: table
  )

