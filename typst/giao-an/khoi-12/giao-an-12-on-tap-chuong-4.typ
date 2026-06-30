// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 4",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Hệ thống hóa] các kiến thức cơ bản của chương:
  - Khái niệm và tính chất của #strong[nguyên hàm].
  - Các #strong[phương pháp tìm nguyên hàm] cơ bản (bảng nguyên hàm,
    phương pháp đổi biến, phương pháp tích phân từng phần).
  - Khái niệm và ý nghĩa của #strong[tích phân].
  - Các #strong[tính chất của tích phân] và #strong[phương pháp tính
    tích phân] (đổi biến, tích phân từng phần).
  - Các #strong[ứng dụng của tích phân] để tính diện tích hình phẳng và
    thể tích vật thể tròn xoay.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm kiếm, hệ thống hóa
    kiến thức và tự đánh giá mức độ hiểu biết của bản thân về chương.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia làm việc
    nhóm, trao đổi, thảo luận để hoàn thành nhiệm vụ chung; trình bày,
    bảo vệ ý kiến của mình một cách rõ ràng.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích yêu cầu
    bài toán, lựa chọn công cụ và phương pháp phù hợp để giải quyết các
    bài tập tổng hợp về nguyên hàm và tích phân.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích cấu trúc
    bài toán, nhận diện dạng toán (nguyên hàm/tích phân, đổi biến/từng
    phần, ứng dụng).
  - #strong[Năng lực mô hình hóa toán học:] Vận dụng tích phân để giải
    quyết các bài toán thực tiễn về tính diện tích, thể tích.
  - #strong[Năng lực sử dụng công cụ, phương tiện toán học:] Sử dụng máy
    tính cầm tay (MTCT) để kiểm tra kết quả tích phân; sử dụng phần mềm,
    ứng dụng học tập để hệ thống hóa kiến thức (sơ đồ tư duy).
- #strong[Năng lực số:]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành các nhiệm vụ được giao, chuẩn bị bài tập
  trước ở nhà.
- #strong[Trách nhiệm:] Tham gia tích cực, nghiêm túc vào các hoạt động
  nhóm, có ý thức giúp đỡ bạn bè cùng tiến bộ.
- #strong[Trung thực:] Thể hiện sự trung thực trong quá trình tự làm bài
  và đánh giá bài làm của nhóm/bạn.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy chiếu/Tivi, máy tính có kết nối mạng, phiếu
  bài tập tổng hợp, các slide trình chiếu hướng dẫn hoạt động.
- #strong[Học sinh:]
  - Sách giáo khoa, vở ghi.
  - Máy tính cầm tay (MTCT) cá nhân.
  - Điện thoại thông minh/máy tính bảng (hoặc máy tính cá nhân) có cài
    đặt hoặc truy cập các ứng dụng hỗ trợ vẽ #strong[sơ đồ tư duy]
    (chuẩn bị trước ở nhà).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
Sử dụng #strong[Phương pháp Dạy học Tích cực, lấy học sinh làm trung
tâm] (Học tập hợp tác, Dạy học giải quyết vấn đề, Dạy học dự án nhỏ).

==== Hoạt động 1: Tổng hợp Kiến thức (40 phút - Tiết 1)
#figure(
  align(center)[#table(
    columns: (7.51%, 74.26%, 18.23%),
    align: (left,left,left,),
    table.header(table.cell(align: left)[Bước], table.cell(align: left)[Hoạt
      động của Giáo viên và Học sinh], table.cell(align: left)[Phương
      pháp / Công cụ],),
    table.hline(),
    table.cell(align: left)[#strong[\1.]], table.cell(align: left)[#strong[Khởi
    động & Giao nhiệm vụ (5 phút)]], table.cell(align: left)[Phát triển
    năng lực #strong[Giao tiếp]],
    table.cell(align: left)[], table.cell(align: left)[#strong[GV:] Đặt
    câu hỏi gợi mở: \"Kể tên các nội dung chính chúng ta đã học trong
    Chương IV?\" (Nguyên hàm, Tích phân, Ứng dụng). #strong[GV:] Giao
    nhiệm vụ chính: \"Các nhóm sẽ cùng nhau #strong[hệ thống hóa] toàn
    bộ kiến thức của chương thành một #strong[Sơ đồ tư duy] chi tiết và
    sáng tạo.\"], table.cell(align: left)[],
    table.cell(align: left)[#strong[\2.]], table.cell(align: left)[#strong[Thực
    hiện nhiệm vụ (25 phút)]], table.cell(align: left)[#strong[Học tập
    Hợp tác & Phát triển Năng lực số]],
    table.cell(align: left)[], table.cell(align: left)[#strong[HS (Nhóm
    4-5 người):] Thảo luận, phân công nhiệm
    vụ.], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[#strong[HS
    (Nhóm):] Tiến hành thiết kế Sơ đồ tư duy (SDTD) bằng #strong[công cụ
    số] (Google Docs/Slides, MindMeister, Canva...). SDTD cần bao gồm:
    #emph[Định nghĩa, Tính chất, Công thức cơ bản, Phương pháp tính (Đổi
    biến, Từng phần), Ứng dụng.]], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[#strong[GV:] Quan
    sát, hỗ trợ, nhắc nhở các nhóm về tính đầy đủ và logic của
    SDTD.], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[#emph[Biểu hiện
    Năng lực số:] #strong[Tìm kiếm, chọn lọc, đánh giá] thông tin từ
    sách giáo khoa điện tử hoặc các nguồn đáng tin cậy khác (ví dụ: công
    thức tích phân) và #strong[sử dụng công cụ số] để thể hiện thông tin
    (vẽ SDTD).], table.cell(align: left)[],
    table.cell(align: left)[#strong[\3.]], table.cell(align: left)[#strong[Báo
    cáo & Tổng hợp (10 phút)]], table.cell(align: left)[Phát triển năng
    lực #strong[Phân tích và Tổng hợp]],
    table.cell(align: left)[], table.cell(align: left)[#strong[HS (Đại
    diện 1-2 nhóm):] Trình bày, thuyết minh nhanh về SDTD của nhóm mình.
    (Sử dụng máy chiếu để trình chiếu sản phẩm
    số).], table.cell(align: left)[#strong[Thuyết trình / Ứng dụng số]],
    table.cell(align: left)[], table.cell(align: left)[#strong[HS (Các
    nhóm khác):] Nhận xét, bổ sung.], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[#strong[GV:]
    Chuẩn hóa kiến thức, củng cố lại các điểm trọng tâm và các lỗi sai
    thường gặp, đặc biệt là sự nhầm lẫn giữa nguyên hàm và tích
    phân.], table.cell(align: left)[],
  )]
  , kind: table
  )

==== Hoạt động 2: Luyện tập và Vận dụng (50 phút - Tiết 2)
Sử dụng #strong[Phương pháp Dạy học thông qua Trò chơi] (Game-based
Learning) để tăng cường kỹ năng giải quyết vấn đề và hợp tác.

#figure(
  align(center)[#table(
    columns: (7.51%, 71.15%, 21.34%),
    align: (left,left,left,),
    table.header(table.cell(align: left)[Bước], table.cell(align: left)[Hoạt
      động của Giáo viên và Học sinh], table.cell(align: left)[Phương
      pháp / Công cụ],),
    table.hline(),
    table.cell(align: left)[#strong[\1.]], table.cell(align: left)[#strong[Trò
    chơi: \"Tiếp sức Tính toán\" (30
    phút)]], table.cell(align: left)[#strong[Trò chơi Học tập, Phân tích
    & Giao tiếp]],
    table.cell(align: left)[], table.cell(align: left)[#strong[GV:] Chia
    lớp thành các đội (4-5 đội). Chuẩn bị 8-10 câu hỏi/bài tập tổng hợp
    (cả trắc nghiệm và tự luận) bao gồm các
    dạng:], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[\* Tính nguyên
    hàm cơ bản.], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[\* Tính tích phân
    bằng phương pháp đổi biến, từng phần.], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[\* Tính diện tích
    hình phẳng/thể tích vật tròn xoay.], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[#strong[GV:]
    #strong[Luật chơi:] Các thành viên trong nhóm lần lượt lên bảng/làm
    trên phiếu bài tập nhóm. Mỗi người chỉ thực hiện một bước giải rồi
    chuyển bút/phiếu cho người tiếp theo (Tiếp sức). Nhóm nào giải đúng,
    nhanh nhất sẽ ghi điểm.], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[#strong[HS:] Các
    đội tích cực thảo luận và phối hợp để hoàn thành bài
    giải.], table.cell(align: left)[],
    table.cell(align: left)[#strong[\2.]], table.cell(align: left)[#strong[Vận
    dụng Kỹ năng kiểm tra (15 phút)]], table.cell(align: left)[Phát
    triển #strong[Năng lực sử dụng công cụ, Năng lực số]],
    table.cell(align: left)[], table.cell(align: left)[#strong[GV:]
    Trình bày một số bài tập #strong[tích phân có thể kiểm tra bằng
    MTCT] hoặc phần mềm toán học (ví dụ:
    GeoGebra).], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[#strong[HS:] Thực
    hành sử dụng MTCT để #strong[kiểm tra] nhanh kết quả của các bài tập
    vừa giải (hoặc một số bài tập
    mới).], table.cell(align: left)[#strong[Thực hành trên MTCT]],
    table.cell(align: left)[], table.cell(align: left)[#strong[GV:] Nhấn
    mạnh vai trò của MTCT là #strong[công cụ kiểm tra] và #strong[hỗ
    trợ] giải quyết các bài toán phức tạp, không thay thế được tư duy
    toán học và kỹ năng giải bằng tay.], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[#emph[Biểu hiện
    Năng lực số:] #strong[Sử dụng công cụ số] (MTCT) để tính toán, kiểm
    tra kết quả một cách hiệu quả và chính
    xác.], table.cell(align: left)[],
    table.cell(align: left)[#strong[\3.]], table.cell(align: left)[#strong[Tổng
    kết và Dặn dò (5 phút)]], table.cell(align: left)[#strong[Tự chủ và
    Tự học]],
    table.cell(align: left)[], table.cell(align: left)[#strong[GV:] Tổng
    kết điểm các đội, tuyên dương và đánh giá chung về mức độ nắm vững
    kiến thức của cả lớp.], table.cell(align: left)[],
    table.cell(align: left)[], table.cell(align: left)[#strong[GV:] Giao
    nhiệm vụ về nhà: #strong[Ôn tập tổng thể] chương (dựa trên SDTD của
    nhóm) và giải thêm các bài tập vận dụng cao trong sách bài tập hoặc
    đề cương ôn tập.], table.cell(align: left)[],
  )]
  , kind: table
  )

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

