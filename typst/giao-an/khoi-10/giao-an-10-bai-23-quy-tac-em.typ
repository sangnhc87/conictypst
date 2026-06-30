// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 23 Quy tắc đếm",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm về công việc, phương án thực hiện công việc.
- Trình bày được nội dung của #strong[Quy tắc cộng].
- Trình bày được nội dung của #strong[Quy tắc nhân].
- Áp dụng thành thạo Quy tắc cộng, Quy tắc nhân và #strong[kết hợp] hai
  quy tắc để giải quyết các bài toán đếm đơn giản.

#muc("2", "NĂNG LỰC")
==== 💡 Năng lực chung:
- #strong[Tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến thức mới
  về Quy tắc đếm.
- #strong[Giao tiếp và hợp tác:] Tích cực thảo luận, trình bày ý kiến,
  hợp tác nhóm để hoàn thành nhiệm vụ học tập.
- #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống thực tiễn
  để lựa chọn quy tắc đếm phù hợp.

==== 🔢 Năng lực đặc thù (Năng lực Toán học):
- #strong[Năng lực tư duy và lập luận toán học:] Phân tích, so sánh để
  phân biệt được khi nào dùng Quy tắc cộng, khi nào dùng Quy tắc nhân.
- #strong[Năng lực mô hình hoá toán học:] Sử dụng sơ đồ hình cây để mô
  hình hóa quá trình thực hiện công việc theo Quy tắc nhân.
- #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng các quy tắc đếm
  để giải các bài toán thực tiễn (chọn đường đi, chọn trang phục, chọn
  số,...).

==== 💻 Năng lực số (Theo Thông tư số 02/2025/TT-BGDĐT):
- 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
- 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
  tin và nội dung trong môi trường số.
- 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin và
  nội dung này cũng như điều hướng giữa chúng.
- 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
- 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
  dạng khác nhau,
- 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc tạo
  ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, chủ động hoàn thành các nhiệm vụ học tập
  cá nhân và nhóm.
- #strong[Trách nhiệm:] Có trách nhiệm trong việc hoàn thành nhiệm vụ
  được giao và chia sẻ kiến thức, hỗ trợ đồng đội.
- #strong[Trung thực:] Nghiêm túc, trung thực trong quá trình thực hiện
  bài tập, báo cáo kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, màn chiếu, máy tính kết nối
  mạng, bảng/giấy A0, bút dạ, các đồ dùng trực quan (ví dụ: các loại áo,
  quần, mũ, đường đi mô phỏng...).
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập (in sẵn hoặc online qua Google Forms/Quizizz).
  - Tài liệu tham khảo/video ngắn giới thiệu về lịch sử của Toán học tổ
    hợp.
  - Phần mềm/ứng dụng hỗ trợ làm việc nhóm và thiết kế sơ đồ tư duy (ví
    dụ: Google Slides, MindMeister, Canva, v.v.).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "XÁC ĐỊNH VẤN ĐỀ/NHIỆM VỤ HỌC TẬP/MỞ ĐẦU", "15 phút - Tiết 1")
#mt-hd[
- Tạo hứng thú, khơi gợi nhu cầu tìm hiểu về cách đếm các tình huống
  trong thực tiễn.
- Học sinh xác định được vấn đề cần giải quyết: #strong[Làm thế nào để
  đếm số cách thực hiện một công việc mà không cần liệt kê hết?]

]
#nd-hd[
- #strong[Tình huống mở đầu (Trò chơi/Thử thách):] Giáo viên (GV) đưa ra
  một tình huống thực tiễn đơn giản nhưng khó liệt kê hết.
- #strong[Ví dụ đề xuất:] \"Từ nhà bạn An đến trường có 3 con đường. Từ
  trường đến thư viện có 2 con đường. Hỏi bạn An có bao nhiêu cách đi từ
  nhà đến thư viện qua trường?\"
- HS suy nghĩ, thảo luận nhóm đôi/nhóm nhỏ để tìm câu trả lời và cách
  thức giải quyết.

]
#sp-hd[
- Câu trả lời sơ bộ của HS (có thể là một số cụ thể hoặc cách liệt kê).
- Đề xuất về việc cần có một \"quy tắc\" nào đó để tính nhanh hơn.

]
#tc-hd[
- #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình bày/chiếu tình huống,
  yêu cầu HS thảo luận cặp đôi trong 5 phút để tìm ra câu trả lời.
- #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc độc lập và thảo luận
  cặp đôi. GV quan sát, dự đoán khó khăn (HS có thể liệt kê thiếu hoặc
  nhầm lẫn) và hỗ trợ bằng cách gợi ý: \"Đây là một công việc được thực
  hiện qua các bước/các phương án khác nhau. Hãy thử tách nhỏ công việc
  ra.\"
- #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 cặp đôi trình bày kết
  quả và cách làm.
- #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, khen ngợi, khẳng
  định tính phức tạp của việc liệt kê khi số lượng lớn. GV chốt lại mục
  tiêu bài học: Cần xây dựng các #strong[Quy tắc đếm] để giải quyết
  triệt để các bài toán này. (Chuyển sang Hoạt động 2).

]
#hd("2", "HÌNH THÀNH KIẾN THỨC MỚI/GIẢI QUYẾT VẤN ĐỀ", "120 phút - Tiết 1, 2, 3")
==== 2.1. Hoạt động thành phần 1: QUY TẮC CỘNG VÀ SƠ ĐỒ HÌNH CÂY (40 phút)
- #strong[Mục tiêu:] HS nêu được nội dung Quy tắc cộng, nhận biết khi
  nào dùng Quy tắc cộng (các phương án thực hiện độc lập) và biết cách
  dùng sơ đồ hình cây (khi số cách ít) để minh họa.
- #strong[Nội dung:]
  - #strong[Ví dụ đề xuất:] \"Một lớp học có 20 học sinh nam và 15 học
    sinh nữ. Cần chọn ra #strong[một học sinh] làm lớp trưởng. Hỏi có
    bao nhiêu cách chọn?\" (HS phân tích: Chọn nam hay chọn nữ, công
    việc hoàn thành sau 1 phương án).
  - GV hướng dẫn HS khái quát hóa từ ví dụ để xây dựng Quy tắc cộng.
  - HS thực hiện bài tập áp dụng, sử dụng sơ đồ hình cây để minh họa.
- #strong[Sản phẩm:] Nội dung Quy tắc cộng được ghi vào vở. Lời giải
  đúng của ví dụ.
- #strong[Tổ chức thực hiện:]
  - #strong[Giao nhiệm vụ:] GV đưa ví dụ, yêu cầu HS làm việc nhóm nhỏ
    (4 người) để tìm đáp án và giải thích cách làm.
  - #strong[Thực hiện nhiệm vụ:] HS thảo luận. GV quan sát, gợi ý: Phân
    biệt giữa \"chọn một học sinh\" và \"chọn một nam và một nữ\".
  - #strong[Báo cáo, thảo luận:] Mời đại diện nhóm trình bày. GV chính
    xác hóa kiến thức, phát biểu chuẩn xác #strong[Quy tắc cộng].
  - #strong[Tích hợp Năng lực số:] GV giao nhiệm vụ tìm kiếm thêm ví dụ
    thực tiễn về Quy tắc cộng trên mạng (sử dụng công cụ tìm kiếm).
    (Biểu hiện: #strong[NC2. Khai thác và xử lí thông tin số]).

==== 2.2. Hoạt động thành phần 2: QUY TẮC NHÂN (40 phút)
- #strong[Mục tiêu:] HS nêu được nội dung Quy tắc nhân, nhận biết khi
  nào dùng Quy tắc nhân (công việc chia thành các bước liên tiếp) và áp
  dụng giải bài toán.
- #strong[Nội dung:]
  - #strong[Ví dụ đề xuất:] \"Bạn An có 3 chiếc áo (Đỏ, Xanh, Vàng) và 2
    chiếc quần (Trắng, Đen). Hỏi bạn An có bao nhiêu cách chọn
    #strong[một bộ trang phục] (gồm 1 áo và 1 quần)?\" (HS phân tích:
    Công việc gồm 2 bước liên tiếp: chọn áo VÀ chọn quần).
  - GV hướng dẫn HS sử dụng sơ đồ hình cây để liệt kê và từ đó xây dựng
    Quy tắc nhân. \* #strong[Sản phẩm:] Nội dung Quy tắc nhân được ghi
    vào vở. Lời giải đúng của ví dụ và các bài tập áp dụng.
- #strong[Tổ chức thực hiện:]
  - #strong[Giao nhiệm vụ:] GV đưa ví dụ, yêu cầu HS độc lập suy nghĩ và
    dùng sơ đồ hình cây để biểu diễn.
  - #strong[Thực hiện nhiệm vụ:] HS thực hiện. GV hỗ trợ các nhóm gặp
    khó khăn trong việc vẽ sơ đồ hình cây.
  - #strong[Báo cáo, thảo luận:] Mời 1-2 HS lên bảng vẽ sơ đồ hình cây
    và trình bày kết quả. GV chính xác hóa kiến thức, phát biểu chuẩn
    xác #strong[Quy tắc nhân].
  - #strong[Tích hợp Năng lực số:] HS sử dụng phần mềm vẽ sơ đồ tư duy
    (trực tuyến) để phác thảo sơ đồ hình cây cho ví dụ (nếu có điều
    kiện). (Biểu hiện: #strong[NC4. Sáng tạo nội dung số]).

==== 2.3. Hoạt động thành phần 3: KẾT HỢP QUY TẮC CỘNG VÀ QUY TẮC NHÂN (40 phút)
- #strong[Mục tiêu:] HS phân tích được tình huống phức tạp và biết cách
  kết hợp linh hoạt Quy tắc cộng và Quy tắc nhân để giải quyết.
- #strong[Nội dung:]
  - #strong[Ví dụ đề xuất:] \"Một nhóm học sinh muốn mua 1 món quà lưu
    niệm. Cửa hàng có 3 loại sách và 4 loại móc khoá. Trong đó, mỗi loại
    sách có 5 mẫu khác nhau, mỗi loại móc khoá có 3 mẫu khác nhau. Hỏi
    có bao nhiêu cách chọn 1 món quà?\" (HS phân tích: Công việc TỔNG
    THỂ (chọn quà) là Quy tắc cộng, nhưng các PHƯƠNG ÁN (chọn sách/chọn
    móc khoá) là Quy tắc nhân).
- #strong[Sản phẩm:] Phân tích đúng bản chất bài toán và lời giải chính
  xác.
- #strong[Tổ chức thực hiện:]
  - #strong[Giao nhiệm vụ:] GV đưa ví dụ, yêu cầu HS thảo luận nhóm (4-6
    người) để phân tích và trình bày lời giải chi tiết (5 phút).
  - #strong[Thực hiện nhiệm vụ:] HS thảo luận, phân tích thành các
    trường hợp. GV nhấn mạnh: #strong[Bước (Nhân) -- Trường hợp (Cộng)].
  - #strong[Báo cáo, thảo luận:] GV mời một nhóm trình bày cách phân
    tích và giải quyết. Các nhóm khác đặt câu hỏi phản biện.
  - #strong[Kết luận, nhận định:] GV chuẩn hóa quy tắc kết hợp:
    #strong[Chia công việc thành các phương án độc lập (Cộng), trong mỗi
    phương án lại chia thành các bước liên tiếp (Nhân).]

#hd("3", "LUYỆN TẬP", "45 phút - Tiết 4")
#mt-hd[
- Vận dụng thành thạo Quy tắc cộng, Quy tắc nhân và Quy tắc kết hợp vào
  giải các bài tập Toán học và thực tiễn.
- Phát triển kĩ năng phân tích đề bài, lựa chọn phương pháp.

]
#nd-hd[
- Hệ thống các bài tập đa dạng, tăng dần độ khó:
  - Bài tập 1 (Nhận biết): Bài toán chỉ sử dụng Quy tắc cộng.
  - Bài tập 2 (Thông hiểu): Bài toán chỉ sử dụng Quy tắc nhân.
  - Bài tập 3 (Vận dụng): Bài toán tạo số, chọn từ có điều kiện (kết hợp
    quy tắc).
  - Bài tập 4 (Thực tiễn): Bài toán chọn lịch trình, chọn biển số xe.
- #strong[Trò chơi học tập: \"Ai nhanh hơn\"] (Sử dụng Kahoot/Quizizz)
  để củng cố kiến thức và tạo không khí thi đua.

]
#sp-hd[
- Đáp án, lời giải đúng, rõ ràng của hệ thống bài tập.
- Kết quả trả lời nhanh và chính xác trong trò chơi học tập.

]
#tc-hd[
- #strong[Giao nhiệm vụ:] GV giao các bài tập (Phiếu học tập) cho HS làm
  việc cá nhân (15 phút).
- #strong[Thực hiện nhiệm vụ:] HS giải bài. GV theo dõi, hỗ trợ nhanh
  cho các HS gặp khó khăn.
- #strong[Kiểm tra, đánh giá (Trò chơi học tập):] GV tổ chức Trò chơi
  học tập qua công cụ số (Kahoot/Quizizz) trong 15 phút.
  - #strong[Tích hợp Năng lực số:] HS truy cập, sử dụng phần mềm để trả
    lời các câu hỏi nhanh. (Biểu hiện: #strong[NC3. Giao tiếp và hợp tác
    trong môi trường số]).
- #strong[Kết luận, nhận định:] GV nhận xét, chữa nhanh các bài tập, đặc
  biệt là các câu hỏi mà HS sai nhiều trong trò chơi.

]
#hd("4", "VẬN DỤNG", "15 phút - Bài tập về nhà")
#mt-hd[
- Phát triển năng lực của HS thông qua việc vận dụng kiến thức, kĩ năng
  vào giải quyết các vấn đề thực tiễn (ngoài giờ học).

]
#nd-hd[
- #strong[Yêu cầu:] Học sinh phát hiện/đề xuất 1 vấn đề/tình huống trong
  cuộc sống gắn với Quy tắc đếm và đề xuất cách giải quyết.
- #strong[Ví dụ:]
  - \"Trong một nhà hàng, có bao nhiêu cách để chọn một thực đơn bao gồm
    một món khai vị, một món chính và một món tráng miệng?\"
  - \"Đếm số lượng mật khẩu có thể tạo ra từ các chữ số và chữ cái với
    các điều kiện ràng buộc cụ thể.\"

]
#sp-hd[
- Báo cáo (dạng bài viết, slide hoặc video ngắn) về tình huống thực tiễn
  được phát hiện và lời giải quyết chi tiết, trình bày rõ Quy tắc đếm
  được sử dụng.
  - #strong[Tích hợp Năng lực số:] Sản phẩm báo cáo được thực hiện dưới
    dạng số (slide trình chiếu, video) và nộp qua nền tảng trực tuyến
    (email, Google Classroom, v.v.). (Biểu hiện: #strong[NC4. Sáng tạo
    nội dung số]).

]
#tc-hd[
- #strong[Giao nhiệm vụ:] GV giao nhiệm vụ, hướng dẫn HS thực hiện ngoài
  giờ học trên lớp.
- #strong[Kiểm tra, đánh giá:] GV thu thập sản phẩm báo cáo qua email
  hoặc nền tảng học tập. Chọn một số bài tiêu biểu để trao đổi, chia sẻ
  và đánh giá vào đầu tiết học tiếp theo.

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

]
