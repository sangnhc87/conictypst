// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "HĐTHTN 2 Lực căng mặt ngoài của nước",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Mô tả được hiện tượng lực căng mặt ngoài của chất lỏng.
- Giải thích được cơ chế hình thành lực căng mặt ngoài của nước (dựa
  trên tương tác phân tử).
- Thực hành được quy trình xác định hệ số căng bề mặt của nước bằng
  phương pháp vòng dây (hoặc phương pháp khác phù hợp).
- Xử lí số liệu thực nghiệm và tính toán được hệ số căng bề mặt $sigma$
  (sigma).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực tìm kiếm, thu
    thập thông tin và thực hiện nhiệm vụ học tập.
  - #strong[Năng lực giao tiếp và hợp tác:] Hợp tác hiệu quả trong nhóm
    để thực hiện các thí nghiệm, thảo luận và báo cáo kết quả.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Đề xuất được giải
    pháp khi gặp sự cố trong quá trình thí nghiệm và trình bày kết quả
    một cách sáng tạo.
- #strong[Năng lực đặc thù môn học (Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích, tổng hợp
    thông tin, lập luận để giải quyết vấn đề thực tế (tính $sigma$).
  - #strong[Năng lực mô hình hóa toán học:] Sử dụng công thức toán học
    $F = sigma dot.op l$ (lực căng mặt ngoài) để xây dựng mô hình tính
    toán và xử lí số liệu.
- #strong[Năng lực số] (Tích hợp theo Thông tư số 02/2025/TT-BGDĐT):
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, nghiêm túc thực hiện nhiệm vụ thí nghiệm,
  đảm bảo tính chính xác và cẩn thận trong quá trình đo đạc.
- #strong[Trách nhiệm:] Có trách nhiệm với kết quả thí nghiệm của nhóm;
  giữ gìn, bảo quản thiết bị học tập.
- #strong[Trung thực:] Ghi chép và báo cáo trung thực kết quả đo đạc, kể
  cả sai số.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:]
  - Máy chiếu, màn chiếu, máy tính kết nối Internet.
  - #strong[Dụng cụ thí nghiệm (Mỗi nhóm):] Lực kế (độ nhạy cao), vòng
    kim loại mảnh (hoặc vòng nhôm), cốc/bát đựng nước sạch, thước đo
    milimet, cân điện tử nhỏ (nếu có), giá đỡ thí nghiệm, khăn lau.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Tập 1 - Hoạt động thực hành trải nghiệm).
  - Video mô phỏng về lực căng mặt ngoài và quy trình thí nghiệm đo hệ
    số căng bề mặt (YouTube hoặc nguồn khác).
  - Tài liệu hướng dẫn sử dụng phần mềm bảng tính (Excel/Google Sheets)
    để xử lí số liệu.
  - Phiếu học tập nhóm (ghi quy trình, bảng kết quả, câu hỏi thảo luận).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
#mt-hd[
Tạo hứng thú, giúp học sinh nhận diện được hiện
  tượng thực tế liên quan đến lực căng mặt ngoài và xác định nhiệm vụ
  học tập: Tìm hiểu và Xác định hệ số căng bề mặt của nước.
]
#nd-hd[
Học sinh xử lí tình huống thực tế và câu hỏi gợi
  mở của giáo viên.
  - #strong[Ví dụ cụ thể (Nhiệm vụ):] Giáo viên chiếu video clip hoặc
    hình ảnh về:
    - Con nhện nước đứng trên mặt nước.
    - Một chiếc kẹp giấy kim loại nhẹ nổi trên mặt nước.
    - Giọt nước có hình cầu trên bề mặt không thấm nước.
  - #strong[Câu hỏi gợi mở:] #emph[Điều gì đã giúp con nhện nước, chiếc
    kẹp giấy có thể \"đứng\" hoặc \"nổi\" trên mặt nước, chống lại trọng
    lực?]
]
#sp-hd[
  - Đề xuất được câu trả lời ban đầu (ví dụ: \"Có một lớp màng/lực vô
    hình giữ lại\").
  - Trình bày, mô tả được vấn đề cần giải quyết là
    $upright("nghiên cứu bản chất")$ và $upright("đo lường độ lớn")$ của
    lực này (Lực căng mặt ngoài).
]
#tc-hd[
Trình bày cụ thể các bước tổ chức hoạt
  động học cho học sinh từ chuyển giao nhiệm vụ, theo dõi, hướng dẫn,
  kiểm tra, đánh giá quá trình và kết quả thực hiện nhiệm vụ thông qua
  sản phẩm học tập.
  - #strong[Giao nhiệm vụ học tập:] Giáo viên yêu cầu học sinh quan sát
    video/hình ảnh, thảo luận nhóm đôi trong 3 phút để tìm kiếm nguyên
    nhân.
  - #strong[Thực hiện nhiệm vụ:] Học sinh quan sát, thảo luận và
    #strong[sử dụng thiết bị số (năng lực số: khai thác thông tin số)]
    để tìm kiếm thông tin ban đầu về hiện tượng.
  - #strong[Báo cáo, thảo luận:] Mời 1-2 nhóm trình bày ý kiến.
  - #strong[Kết luận, nhận định:] Giáo viên nhận xét, dẫn dắt đến khái
    niệm $upright("Lực căng mặt ngoài")$ và công bố nhiệm vụ học tập của
    bài: $upright("Nghiên cứu bản chất")$ và
    $upright("đo lường hệ số căng bề mặt")$ ($sigma$).
  - #strong[Tích hợp năng lực số:] Học sinh #strong[sử dụng thiết bị số
    để quan sát và tìm kiếm thông tin] về hiện tượng (Biểu hiện: Khai
    thác thông tin số).

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "30 phút")
#mt-hd[
Giúp học sinh thực hiện nhiệm vụ học tập để
  chiếm lĩnh kiến thức mới về bản chất lực căng mặt ngoài (tương tác
  phân tử) và xây dựng được công thức tính $F = sigma dot.op l$.
]
#nd-hd[
Nêu rõ nội dung yêu cầu/nhiệm vụ cụ thể của học
  sinh làm việc với sách giáo khoa, thiết bị dạy học, học liệu cụ thể
  (đọc/xem/nghe/nói/làm) để chiếm lĩnh/vận dụng kiến thức để giải quyết
  vấn đề/nhiệm vụ học tập đã đặt ra từ Hoạt động 1.
  - #strong[Ví dụ cụ thể (Nhiệm vụ):]
    - #strong[Nhiệm vụ 1:] Học sinh đọc SGK và xem video mô phỏng về
      $upright("tương tác phân tử")$ ở lớp mặt chất lỏng và trong lòng
      chất lỏng. Thảo luận và giải thích cơ chế hình thành lực căng mặt
      ngoài.
    - #strong[Nhiệm vụ 2:] Dựa trên kiến thức vật lí, xây dựng công thức
      tính độ lớn lực căng mặt ngoài $F$ qua hệ số căng bề mặt $sigma$
      và độ dài đường giới hạn $l$ ($F = sigma dot.op l$).
]
#sp-hd[
  - Trình bày cụ thể về kiến thức mới/kết quả giải quyết vấn đề/thực
    hiện nhiệm vụ học tập mà học sinh cần viết ra, trình bày được.
  - Giải thích rõ ràng cơ chế lực căng mặt ngoài.
  - Viết được công thức: $F = sigma dot.op l$ và xây dựng được công thức
    tính $sigma = F / l$.
]
#tc-hd[
Hướng dẫn, hỗ trợ, kiểm tra, đánh giá
  quá trình và kết quả thực hiện hoạt động của học sinh.
  - #strong[Giao nhiệm vụ học tập:] Giáo viên chia nhóm, giao phiếu học
    tập, yêu cầu đọc SGK và xem video mô phỏng.
  - #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm. Giáo viên theo
    dõi, hỗ trợ (dự kiến khó khăn: khó hình dung tương tác phân tử, biện
    pháp: gợi ý, chiếu hình ảnh phân tử rõ nét).
  - #strong[Báo cáo, thảo luận:] Mời đại diện 1 nhóm báo cáo giải thích
    bản chất (bằng sơ đồ hoặc hình vẽ). Mời nhóm khác trình bày công
    thức $F = sigma dot.op l$.
  - #strong[Kết luận, nhận định:] Giáo viên chốt kiến thức mới, đặc biệt
    là công thức tính $sigma$, làm rõ những nội dung/yêu cầu về kiến
    thức, kĩ năng để học sinh ghi nhận, thực hiện.
  - #strong[Tích hợp năng lực số:] Học sinh #strong[sử dụng video mô
    phỏng] để hình thành kiến thức (Biểu hiện: Sử dụng công nghệ số để
    hỗ trợ học tập).

]
#hd("3", "Luyện tập", "Thực hành thí nghiệm")
#mt-hd[
Nêu rõ mục tiêu vận dụng kiến thức đã học (công
  thức $sigma = F / l$) và yêu cầu phát triển các kĩ năng thực hành, đo
  lường, làm việc nhóm, xử lí số liệu.
]
#nd-hd[
Nêu rõ nội dung cụ thể của hệ thống câu hỏi, bài
  tập, bài thực hành, thí nghiệm giao cho học sinh thực hiện.
  - #strong[Ví dụ cụ thể (Nhiệm vụ):]
    - #strong[Bước 1:] Chuẩn bị và lắp ráp dụng cụ thí nghiệm.
    - #strong[Bước 2:] Đo đạc. $upright("Đo chiều dài đường giới hạn")$
      $l$ (chu vi vòng). $upright("Đo lực căng bề mặt")$ $F$ (dùng lực
      kế kéo vòng kim loại rời khỏi mặt nước), lặp lại phép đo $F$ ít
      nhất 5 lần để lấy giá trị trung bình $macron(F)$.
    - #strong[Bước 3:] Xử lí số liệu và tính $sigma$ (tính $macron(F)$
      và $sigma = macron(F) / l$).
]
#sp-hd[
  - Đáp án, lời giải của các câu hỏi, bài tập; các bài thực hành, thí
    nghiệm do học sinh thực hiện, viết báo cáo, thuyết trình.
  - Bảng số liệu thực nghiệm hoàn chỉnh, có ghi rõ các lần đo $F$ và giá
    trị $macron(F)$.
  - Tính toán được giá trị hệ số căng bề mặt $sigma$ của nước.
  - Báo cáo thí nghiệm (viết tay hoặc bản mềm).
]
#tc-hd[
Nêu rõ cách thức giao nhiệm vụ cho học
  sinh; hướng dẫn hỗ trợ học sinh thực hiện; kiểm tra, đánh giá kết quả
  thực hiện.
  - #strong[Giao nhiệm vụ học tập:] Giáo viên hướng dẫn quy trình, phân
    chia dụng cụ, và giao nhiệm vụ thực hiện thí nghiệm trong 30 phút.
  - #strong[Thực hiện nhiệm vụ:] Học sinh tiến hành thí nghiệm đo đạc
    theo nhóm. Giáo viên theo dõi, hướng dẫn kĩ năng sử dụng lực kế, hỗ
    trợ các nhóm.
  - #strong[Báo cáo, thảo luận:] Mời 2-3 nhóm #strong[sử dụng thiết bị
    số (năng lực số)] để trình bày bảng số liệu và kết quả tính toán (có
    thể chiếu file Excel/Google Sheets).
  - #strong[Kết luận, nhận định:] Giáo viên nhận xét, so sánh kết quả
    giữa các nhóm, chốt lại giá trị $sigma$ thực tế và khắc sâu công
    thức.
  - #strong[Tích hợp năng lực số:] Học sinh #strong[sử dụng phần mềm
    bảng tính] (Excel/Google Sheets) để ghi chép, xử lí số liệu và tính
    toán $macron(F)$, $sigma$ (Biểu hiện: Xử lí, phân tích dữ liệu số).

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
Nêu rõ mục tiêu phát triển năng lực của học sinh
  thông qua nhiệm vụ/yêu cầu vận dụng kiến thức, kĩ năng vào thực tiễn
  (theo từng bài hoặc nhóm bài có nội dung phù hợp).
]
#nd-hd[
Mô tả rõ yêu cầu học sinh phát hiện/đề xuất các
  vấn đề/tình huống trong thực tiễn gắn với nội dung bài học và vận dụng
  kiến thức mới học để giải quyết.
  - #strong[Ví dụ cụ thể (Nhiệm vụ):] Giáo viên giao nhiệm vụ
    $upright("ngoài giờ học")$.
    - #strong[Bài tập về nhà:] $upright("Giải thích")$ hiện tượng: \"Khi
      cho xà phòng vào nước, khả năng giặt sạch tăng lên. Điều này liên
      quan thế nào đến lực căng mặt ngoài của nước?\"
    - #strong[Nhiệm vụ bổ sung (Tích hợp năng lực số):]
      $upright("Tìm kiếm")$ (sử dụng thiết bị số) các ứng dụng của lực
      căng mặt ngoài trong đời sống và công nghệ (ví dụ: công nghệ in
      3D, phun sơn tĩnh điện...).
]
#sp-hd[
Nêu rõ yêu cầu về nội dung và hình thức báo cáo
  phát hiện và giải quyết tình huống/vấn đề trong thực tiễn.
  - Báo cáo (bản mềm hoặc bản cứng) giải thích hiện tượng và tổng hợp
    các ứng dụng trong thực tiễn.
]
#tc-hd[
Giao cho học sinh thực hiện ngoài giờ
  học trên lớp và nộp báo cáo để trao đổi, chia sẻ và đánh giá vào các
  thời điểm phù hợp trong kế hoạch giáo dục môn học/hoạt động giáo dục
  của giáo viên.
  - #strong[Tích hợp năng lực số:] Học sinh #strong[sử dụng công cụ tìm
    kiếm trên Internet] để tra cứu và thu thập thông tin ứng dụng (Biểu
    hiện: Khai thác thông tin số).

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
