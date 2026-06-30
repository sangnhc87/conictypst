// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 8",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Hệ thống hóa] các kiến thức cơ bản của chương 8: Quy tắc đếm
  (Quy tắc cộng, Quy tắc nhân), hoán vị ($P_n$), chỉnh hợp ($A_n^k$), tổ
  hợp ($C_n^k$), nhị thức Newton.
- #strong[Vận dụng] linh hoạt các công thức để giải quyết các bài toán
  về đếm, sắp xếp và chọn.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung]
  - #strong[Tự chủ và tự học:] Chủ động tìm tòi, hệ thống hóa kiến thức;
    tự đánh giá được mức độ hiểu bài.
  - #strong[Giao tiếp và hợp tác:] Hợp tác hiệu quả trong nhóm; biết
    lắng nghe, chia sẻ, phản biện và trình bày ý kiến mạch lạc.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích được các yêu cầu
    của bài toán; đề xuất được các phương pháp giải quyết khác nhau.
- #strong[Năng lực đặc thù (Toán học)]
  - #strong[Tư duy và lập luận toán học:] Nhận biết, chứng minh được các
    công thức, mối liên hệ giữa Hoán vị, Chỉnh hợp và Tổ hợp.
  - #strong[Mô hình hóa toán học:] Mô hình hóa các bài toán thực tiễn về
    đếm và sắp xếp thành các công thức tổ hợp.
  - #strong[Giao tiếp toán học:] Trình bày rõ ràng, chính xác cách giải
    quyết bài toán.
- #strong[Năng lực số] (Tích hợp theo TT 02/2025/TT-BGDĐT)
  - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
  - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
    tin và nội dung trong môi trường số.
  - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin
    và nội dung này cũng như điều hướng giữa chúng.
  - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, chủ động tham gia các hoạt động ôn tập.
- #strong[Trách nhiệm:] Hoàn thành nhiệm vụ được giao, đóng góp ý kiến
  xây dựng bài học.
- #strong[Trung thực:] Nghiêm túc, trung thực trong việc tự đánh giá và
  làm bài tập.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên (GV):]
  - Máy chiếu (hoặc TV), máy tính.
  - Phiếu học tập (nếu cần).
  - Hệ thống bài tập trắc nghiệm trên nền tảng số (#strong[Kahoot!] hoặc
    #strong[Quizizz]).
  - Mẫu Sơ đồ tư duy chuẩn.
- #strong[Học sinh (HS):]
  - Sách giáo khoa Toán 10, vở ghi.
  - Điện thoại thông minh/máy tính bảng (để tham gia hoạt động Năng lực
    số).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#muc("1", "KIẾN THỨC")
- #strong[Mục tiêu:] HS hệ thống hóa kiến thức chương 8 dưới dạng Sơ đồ
  tư duy (SDTD), củng cố mối liên hệ giữa các khái niệm.
- #strong[Phương pháp đề xuất:] #strong[Tích hợp phát triển Năng lực
  số], Học tập hợp tác, Sơ đồ tư duy.
- #strong[Các bước thực hiện:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Giao nhiệm vụ (2 phút):] GV chia lớp thành các nhóm nhỏ (4-5
    HS/nhóm). Giao nhiệm vụ các nhóm thảo luận, tổng hợp kiến thức
    chương 8 (Quy tắc đếm, Hoán vị, Chỉnh hợp, Tổ hợp, Nhị thức Newton)
    và trình bày dưới dạng #strong[Sơ đồ tư duy].
  + #strong[Khuyến khích NL Số:] GV khuyến khích các nhóm #strong[sử
    dụng ứng dụng số] (ví dụ: Mindmap Maker, Canva, Xmind) để thiết kế
    SDTD.
  + #strong[HS thực hiện (10 phút):] HS làm việc nhóm, phân công nhiệm
    vụ. Nhóm tích cực phát triển #strong[NL Số] bằng cách sử dụng thiết
    bị số và phần mềm để thiết kế SDTD.
  + #strong[Báo cáo, đánh giá (3 phút):] GV mời 1-2 nhóm trình bày nhanh
    SDTD (có thể chiếu SDTD được thiết kế bằng công cụ số lên màn hình).
    #strong[Biểu hiện NL Số:] HS trình bày sản phẩm số để giao tiếp kiến
    thức. GV nhận xét, bổ sung và chốt lại kiến thức trọng tâm.
  ]

#hd("2", "Luyện tập và Vận dụng", "25 phút")
- #strong[Mục tiêu:] HS vận dụng kiến thức vào giải quyết các bài tập
  tổng hợp, rèn luyện kỹ năng phân tích, giải quyết vấn đề.
- #strong[Phương pháp đề xuất:] #strong[Trò chơi học tập], Giải quyết
  vấn đề, Dạy học lấy HS làm trung tâm.
- #strong[Các bước thực hiện:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Bài tập vận dụng cơ bản (8 phút):]
    - GV chiếu/phát phiếu học tập gồm 3-4 bài tập trắc nghiệm và tự luận
      ngắn.
    - HS làm việc #strong[cá nhân] trước, sau đó #strong[thảo luận nhóm
      nhanh] để thống nhất đáp án.
    - GV mời HS trình bày cách giải, tập trung phân tích sự khác biệt
      giữa Chỉnh hợp và Tổ hợp.
  + #strong[Trò chơi học tập \"Thử thách Tổ hợp\" (15 phút):]
    - GV tổ chức trò chơi #strong[Trắc nghiệm trực tuyến] (Quiz) trên
      nền tảng số (#strong[Kahoot!] hoặc #strong[Quizizz]) với các câu
      hỏi đa dạng, tăng cường tính cạnh tranh và hứng thú.
    - HS sử dụng điện thoại/máy tính bảng kết nối internet để tham gia
      trò chơi.
    - #strong[Biểu hiện NL Số:] HS thể hiện kỹ năng #strong[vận dụng,
      tạo ra và làm chủ công nghệ số] khi tham gia trò chơi trực tuyến.
    - GV theo dõi, điều hành trò chơi, giải thích chi tiết cho các câu
      hỏi khó. Hoạt động này tăng cường kĩ năng #strong[giao tiếp, phân
      tích] dưới áp lực thời gian.
    - GV công bố kết quả và tuyên dương người thắng cuộc (2 phút).
  ]

#hd("3", "Củng cố và Dặn dò", "5 phút")
- #strong[Mục tiêu:] Khẳng định lại mục tiêu bài học, giao nhiệm vụ về
  nhà.
- #strong[Các bước thực hiện:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Củng cố (3 phút):] GV đặt câu hỏi tổng kết về mối liên hệ
    giữa các công thức Tổ hợp ($P_n$#strong[,] $A_n^k$#strong[,]
    $C_n^k$). Ví dụ: #strong[\"Mối liên hệ giữa Hoán vị, Chỉnh hợp và Tổ
    hợp là gì?\"] HS trả lời. GV chốt lại kiến thức.
  + #strong[Dặn dò (2 phút):]
    - Giao nhiệm vụ về nhà: Ôn tập và giải các bài tập còn lại trong
      SGK/SBT.
    - #strong[Khuyến khích NL Số:] Khuyến khích HS tìm kiếm tài liệu
      hoặc xem video về ứng dụng của Đại số Tổ hợp trong thực tế để mở
      rộng kiến thức.
  ]

#figure(
  align(center)[#table(
    columns: (43.82%, 44.09%),
    align: (auto,auto,),
    table.header(table.cell(align: center)[#strong[DUYỆT KHBD CỦA
      BGH]], table.cell(align: center)[#strong[DUYỆT KHBD CỦA TỔ KHTN]],),
    table.hline(),
  )]
  , kind: table
  )

