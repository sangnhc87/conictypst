// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 7",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Hệ thống hóa] được các kiến thức cơ bản của chương về quan hệ
  vuông góc trong không gian, bao gồm:
  - Vectơ chỉ phương của đường thẳng, vectơ pháp tuyến của mặt phẳng.
  - Điều kiện vuông góc của đường thẳng và mặt phẳng.
  - Góc giữa hai đường thẳng, góc giữa đường thẳng và mặt phẳng, góc
    giữa hai mặt phẳng.
  - Khoảng cách từ một điểm đến mặt phẳng, khoảng cách giữa hai đường
    thẳng chéo nhau.
- #strong[Vận dụng] được các kiến thức đã học để giải quyết các bài tập
  tổng hợp về quan hệ vuông góc trong không gian.

#muc("2", "NĂNG LỰC")
==== a. Năng lực chung
- #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực ôn tập, hệ
  thống hóa kiến thức; tự đánh giá được mức độ nắm vững kiến thức của
  bản thân.
- #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận, trình bày,
  chia sẻ kiến thức, kinh nghiệm và hỗ trợ các thành viên trong nhóm.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình huống,
  lựa chọn phương pháp phù hợp để giải quyết bài tập tổng hợp.

==== b. Năng lực đặc thù (Năng lực Toán học)
- #strong[Năng lực tư duy và lập luận Toán học:] Nhận biết, phân tích,
  lập luận logic để chứng minh các quan hệ vuông góc và tính toán các
  yếu tố góc, khoảng cách.
- #strong[Năng lực mô hình hóa Toán học:] Mô hình hóa các tình huống
  thực tế liên quan đến quan hệ vuông góc trong không gian.
- #strong[Năng lực số:]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

==== c. Phẩm chất
- #strong[Chăm chỉ:] Có ý thức tự giác, chủ động hoàn thành nhiệm vụ
  được giao.
- #strong[Trung thực:] Nghiêm túc, trung thực trong quá trình tự đánh
  giá và làm bài tập.
- #strong[Trách nhiệm:] Có trách nhiệm với bản thân và tập thể khi tham
  gia hoạt động nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:]
  - Máy tính, máy chiếu, màn chiếu.
  - Phần mềm trình chiếu (PowerPoint) và phần mềm hình học không gian
    (GeoGebra 3D) để minh họa.
  - Phiếu bài tập/Bộ câu hỏi ôn tập tổng hợp (có thể là phiếu giấy hoặc
    phiếu điện tử qua Google Forms/Quizizz).
  - Sơ đồ tư duy tổng hợp kiến thức Chương 7 (chuẩn bị sẵn).
- #strong[Học sinh:]
  - Sách giáo khoa, vở ghi.
  - Thiết bị cá nhân (điện thoại/máy tính bảng nếu có) để truy cập tài
    liệu, tham gia trò chơi tương tác (nếu sử dụng).
  - Giấy A0/bút màu hoặc phần mềm vẽ sơ đồ tư duy (Coggle, MindMeister,
    \...).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
=== 1. Hoạt động Khởi động (2 phút)
- #strong[Mục tiêu:] Tạo hứng thú, huy động kiến thức nền của học sinh.
- #strong[Nội dung:] Giáo viên đặt 1-2 câu hỏi ngắn gọn, gợi mở về các
  khái niệm quan trọng nhất của chương (ví dụ: #emph["Nêu cách chứng
  minh đường thẳng vuông góc với mặt phẳng?"]).
- #strong[Sản phẩm:] Câu trả lời nhanh của học sinh.
- #strong[Tổ chức thực hiện:] Phương pháp vấn đáp, toàn lớp.

=== 2. Hoạt động Hình thành Kiến thức/Tổng hợp Kiến thức (15 phút)
==== #strong[Hoạt động 2.1: Tổng hợp kiến thức qua Sơ đồ tư duy (10 phút)]
- #strong[Mục tiêu:] Hệ thống hóa kiến thức trọng tâm của chương.
- #strong[Nội dung:] Học sinh làm việc nhóm để hoàn thiện sơ đồ tư duy
  (SĐTD) về toàn bộ kiến thức Chương 7.
- #strong[Sản phẩm:] Sơ đồ tư duy hoàn chỉnh.
- #strong[Tổ chức thực hiện:]
  - #strong[Chia nhóm] (4-5 HS/nhóm).
  - #strong[Nhiệm vụ:] Các nhóm được giao một khung SĐTD cơ bản và cùng
    nhau #strong[thảo luận] để điền và bổ sung các nội dung kiến thức,
    công thức, và phương pháp giải vào các nhánh chính (Vuông góc ĐT-MP,
    Góc, Khoảng cách).
  - #strong[Phương pháp:] #strong[Dạy học hợp tác] (kĩ thuật
    #strong[Khăn trải bàn] hoặc #strong[động não] trong nhóm).
  - #strong[Tích hợp Năng lực số:] Khuyến khích nhóm sử dụng
    #strong[phần mềm SĐTD trực tuyến] hoặc #strong[tài liệu số] (SGK
    điện tử, vở ghi điện tử) để tổng hợp kiến thức một cách nhanh chóng
    và trực quan.
- #strong[Giáo viên] theo dõi, hỗ trợ, và sau đó trình chiếu SĐTD chuẩn
  để chốt kiến thức.

==== #strong[Hoạt động 2.2: Trình bày và Thuyết trình (5 phút)]
- #strong[Mục tiêu:] Tăng cường kĩ năng giao tiếp, thuyết trình, và phân
  tích thông tin.
- #strong[Nội dung:] Đại diện 1-2 nhóm trình bày nhanh SĐTD của nhóm
  mình.
- #strong[Sản phẩm:] Bài trình bày của nhóm.
- #strong[Tổ chức thực hiện:]
  - Giáo viên mời đại diện nhóm #strong[thuyết trình] về cách nhóm đã hệ
    thống kiến thức.
  - Các nhóm khác #strong[phản biện] hoặc bổ sung.
  - #strong[Phương pháp:] #strong[Thuyết trình nhóm, giao tiếp].

=== 3. Hoạt động Luyện tập (25 phút)
==== #strong[Hoạt động 3.1: Trò chơi Ôn tập (15 phút)]
- #strong[Mục tiêu:] Củng cố kiến thức, vận dụng công thức vào giải bài
  tập nhanh.
- #strong[Nội dung:] Trò chơi tương tác \"Ai nhanh hơn\" với các câu hỏi
  trắc nghiệm tổng hợp.
- #strong[Sản phẩm:] Kết quả trả lời các câu hỏi.
- #strong[Tổ chức thực hiện:]
  - #strong[Phương pháp:] #strong[Trò chơi học tập] kết hợp #strong[Dạy
    học tích hợp công nghệ] (ví dụ: Sử dụng nền tảng #strong[Quizizz]
    hoặc #strong[Kahoot!]).
  - #strong[Nhiệm vụ:] Giáo viên chiếu các câu hỏi trắc nghiệm (từ dễ
    đến khó) về các nội dung đã ôn tập. Học sinh sử dụng thiết bị cá
    nhân để trả lời.
  - #strong[Tích hợp Năng lực số:] Học sinh #strong[sử dụng công cụ số]
    (thiết bị cá nhân) để tham gia trò chơi, #strong[phản hồi dữ liệu
    số] (kết quả trả lời) và nhận kết quả tức thì.
  - #strong[Giáo viên:] Chiếu bảng xếp hạng để tăng tính cạnh tranh. Sau
    mỗi câu, Giáo viên #strong[phân tích] nhanh các lỗi sai điển hình và
    #strong[minh họa hình học không gian 3D] bằng GeoGebra 3D cho các
    câu hỏi cần hình ảnh trực quan (ví dụ: chứng minh vuông góc, xác
    định góc).

==== #strong[Hoạt động 3.2: Luyện tập Chuyên sâu (10 phút)]
- #strong[Mục tiêu:] Rèn luyện kĩ năng giải quyết bài tập tổng hợp, phân
  tích, và tổng hợp thông tin.
- #strong[Nội dung:] Giải bài tập tự luận tổng hợp về góc và khoảng
  cách.
- #strong[Sản phẩm:] Bài giải hoàn chỉnh trên bảng hoặc trên vở.
- #strong[Tổ chức thực hiện:]
  - #strong[Nhiệm vụ:] Giáo viên chọn 1-2 bài tập tự luận tiêu biểu (ví
    dụ: Bài toán tính góc, khoảng cách trong hình chóp/lăng trụ có yếu
    tố vuông góc).
  - #strong[Phương pháp:] #strong[Giải quyết vấn đề].
  - #strong[Thực hiện:] Giáo viên gọi 1 học sinh lên bảng trình bày,
    hoặc cho học sinh tự giải trong vở, sau đó mời HS trình bày lời
    giải.
  - Giáo viên #strong[phân tích] lời giải, nhấn mạnh các bước làm, các
    công thức được sử dụng. Đặc biệt, Giáo viên sử dụng #strong[tính
    truyền cảm hứng] của mình để #strong[khuyến khích] học sinh trình
    bày các cách giải khác nhau (nếu có).

=== 4. Hoạt động Vận dụng và Dặn dò (3 phút)
- #strong[Mục tiêu:] Củng cố bài học, giao nhiệm vụ về nhà.
- #strong[Nội dung:]
  - Giáo viên cùng học sinh chốt lại các #strong[kiến thức, kĩ năng cốt
    lõi] cần nắm vững.
  - Dặn dò học sinh chuẩn bị cho bài kiểm tra/đánh giá cuối chương.
  - #strong[Bài tập về nhà:] Giáo viên giao các bài tập còn lại trong
    SGK hoặc một số bài tập nâng cao trên một #strong[nền tảng số] (ví
    dụ: Google Classroom, LMS của trường) để học sinh thực hiện.
- #strong[Tổ chức thực hiện:] Phương pháp giao nhiệm vụ.

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

