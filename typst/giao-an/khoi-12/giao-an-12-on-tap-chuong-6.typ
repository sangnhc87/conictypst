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
- #strong[Hệ thống hóa] các khái niệm cơ bản về xác suất có điều kiện,
  công thức nhân xác suất, công thức xác suất đầy đủ và công thức Bayes.
- #strong[Vận dụng] được các công thức trên để giải quyết các bài toán
  liên quan đến xác suất có điều kiện trong các tình huống thực tiễn.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động ôn tập kiến thức cũ, tự đánh giá
    được mức độ hiểu bài của bản thân.
  - #strong[Giao tiếp và hợp tác:] Tích cực trao đổi, thảo luận nhóm để
    tổng hợp kiến thức và giải quyết các bài tập.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống thực
    tế, lựa chọn công thức phù hợp để tính xác suất.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích, so sánh
    các khái niệm và công thức xác suất. Lập luận logic khi áp dụng công
    thức.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các tình huống
    thực tiễn thành bài toán xác suất có điều kiện.
- #strong[Năng lực số:]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.
- #strong[Phẩm chất]
  - #strong[Chăm chỉ:] Tích cực, chủ động tham gia các hoạt động ôn tập.
  - #strong[Trách nhiệm:] Hoàn thành nhiệm vụ được giao trong nhóm,
    nghiêm túc trong giờ học.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy chiếu/Tivi, máy tính, phiếu học tập (A4/A0),
  Phiếu bài tập trắc nghiệm nhanh, các ứng dụng/phần mềm hỗ trợ tạo
  #strong[Sơ đồ tư duy số] (ví dụ: Mindmap, Canva, \...).
- #strong[Học sinh:] Sách giáo khoa Toán 12 (Tập 2), vở ghi, máy tính
  cầm tay, điện thoại thông minh/máy tính bảng (để sử dụng công cụ số
  khi cần thiết).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#muc("1", "KIẾN THỨC")
- #strong[Mục tiêu:] Học sinh hệ thống hóa và nắm vững kiến thức cốt lõi
  của Chương 6.
- #strong[Phương pháp/Kĩ thuật:] #strong[Thảo luận nhóm nhỏ, Sơ đồ tư
  duy số] (Phát triển Năng lực số).

+ #strong[Chuyển giao nhiệm vụ (3 phút):]

  - Giáo viên chia lớp thành 4 nhóm (hoặc 6 nhóm tùy sĩ số).
  - Giao nhiệm vụ: Mỗi nhóm nhận một chủ đề kiến thức chính (Xác suất có
    điều kiện; Công thức nhân xác suất; Công thức xác suất đầy đủ; Công
    thức Bayes).
  - Yêu cầu nhóm sử dụng các công cụ số (máy tính, điện thoại, phần mềm)
    để #strong[thiết kế một Sơ đồ tư duy số] (Mindmap) hoặc một Slide
    PowerPoint #strong[tóm tắt] các công thức, định nghĩa và ý nghĩa của
    chủ đề được giao.
  - Thời gian thảo luận và hoàn thành sản phẩm: 7 phút.

+ #strong[Thực hiện nhiệm vụ (7 phút):]

  - Học sinh trong nhóm làm việc, sử dụng tài liệu học tập và các thiết
    bị số để tổng hợp kiến thức một cách ngắn gọn, khoa học.
  - Giáo viên quan sát, hỗ trợ các nhóm gặp khó khăn về mặt kĩ thuật
    hoặc nội dung.

+ #strong[Báo cáo, thảo luận và tổng kết (5 phút):]

  - Giáo viên mời đại diện 1-2 nhóm trình bày nhanh sản phẩm của mình
    (chiếu Sơ đồ tư duy số/Slide lên màn hình).
  - Các nhóm khác nhận xét, bổ sung.
  - #strong[Giáo viên chốt lại kiến thức trọng tâm] bằng cách trình
    chiếu sơ đồ tổng hợp (hoặc sử dụng một sơ đồ hoàn chỉnh do giáo viên
    chuẩn bị) và nhấn mạnh sự khác biệt giữa các công thức.

#hd("2", "Luyện tập", "27 phút")
- #strong[Mục tiêu:] Học sinh vận dụng kiến thức đã tổng hợp để giải
  quyết các bài tập từ cơ bản đến nâng cao, rèn luyện kĩ năng giải quyết
  vấn đề.
- #strong[Phương pháp/Kĩ thuật:] #strong[Trò chơi học tập \"Tiếp sức
  Toán học\", Đặt vấn đề/tình huống thực tiễn.]

+ #strong[Chuyển giao nhiệm vụ (2 phút):]

  - Giáo viên phát #strong[Phiếu Bài tập Tổng hợp] gồm 4-5 câu hỏi trắc
    nghiệm/tự luận ngắn, có tính phân loại (từ nhận biết đến vận dụng
    cao) liên quan đến Xác suất có điều kiện và công thức Bayes (có lồng
    ghép các tình huống thực tiễn).
  - #emph[Ví dụ tình huống thực tiễn: Xác suất mắc bệnh khi biết kết quả
    xét nghiệm dương tính (Công thức Bayes).]

+ #strong[Thực hiện nhiệm vụ (20 phút):]

  - #strong[Phần 1: Luyện tập cá nhân (10 phút):] Học sinh tự làm bài
    tập trên phiếu.
  - #strong[Phần 2: Trò chơi \"Tiếp sức Toán học\" (10 phút):]
    - Giáo viên giữ nguyên 4 nhóm ở Hoạt động 1.
    - Các nhóm tham gia trò chơi giải 2-3 bài tập ứng dụng khác. Mỗi bài
      tập là một \"chặng\" và yêu cầu các thành viên tiếp nối nhau giải
      từng bước hoặc giải các bài tập khác nhau. Nhóm hoàn thành nhanh
      nhất và chính xác nhất sẽ thắng.
    - #strong[Tăng cường kĩ năng giao tiếp và hợp tác:] Các thành viên
      cần phân công nhiệm vụ, thảo luận nhanh để thống nhất phương pháp
      giải.

+ #strong[Báo cáo và tổng kết (5 phút):]

  - Giáo viên mời một số học sinh/nhóm trình bày lời giải chi tiết cho
    các bài tập điển hình (đặc biệt là bài toán ứng dụng Công thức
    Bayes).
  - Học sinh tự đối chiếu và sửa lỗi.
  - Giáo viên nhận xét, đánh giá kết quả của các nhóm trong trò chơi và
    nhấn mạnh các lỗi thường gặp, cách trình bày tối ưu.

#hd("3", "Củng cố và dặn dò", "3 phút")
+ #strong[Củng cố (2 phút):]
  - Giáo viên đặt câu hỏi nhanh cho một vài học sinh: \"Sự khác biệt
    chính giữa xác suất có điều kiện và công thức xác suất đầy đủ là
    gì?\"
  - Nhắc lại các bước quan trọng khi giải bài toán xác suất (Xác định
    biến cố, Xác định công thức phù hợp, Tính toán).
+ #strong[Dặn dò (1 phút):]
  - Yêu cầu học sinh xem lại toàn bộ kiến thức chương 6, làm thêm các
    bài tập còn lại trong SGK và SBT.
  - Chuẩn bị cho bài kiểm tra đánh giá sắp tới.

#figure(
  align(center)[#table(
    columns: (46.68%, 46.97%),
    align: (auto,auto,),
    table.header(table.cell(align: center)[#strong[DUYỆT KHBD CỦA
      BGH]], table.cell(align: center)[#strong[DUYỆT KHBD CỦA TỔ KHTN]],),
    table.hline(),
  )]
  , kind: table
  )

