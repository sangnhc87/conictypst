// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 13 Các số đặc trưng đo xu thế trung tâm",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Trình bày được] ý nghĩa và cách tính: Số trung bình, trung vị,
  tứ phân vị và mốt của mẫu số liệu không ghép nhóm.
- #strong[Vận dụng được] các công thức tính toán để tìm các số đặc trưng
  đo xu thế trung tâm trong các tình huống thực tiễn đơn giản.
- #strong[Nhận biết được] ý nghĩa thực tiễn của từng số đặc trưng trong
  việc đo xu thế trung tâm của mẫu số liệu.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, đọc sách giáo
    khoa và tài liệu liên quan để nắm vững khái niệm và công thức.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    phân công nhiệm vụ, trao đổi để hoàn thành các bài tập và nhiệm vụ
    học tập.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp
    thông tin từ mẫu số liệu để lựa chọn số đặc trưng phù hợp và đưa ra
    kết luận.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Giải thích được ý
    nghĩa của các số đặc trưng trong mẫu số liệu; lập luận chặt chẽ
    trong quá trình tính toán.
  - #strong[Năng lực mô hình hoá toán học:] Sử dụng công thức toán học
    để mô tả các hiện tượng, dữ liệu thực tế.
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán: Sử dụng
    được] các phần mềm bảng tính (ví dụ: Google Sheets, Excel) hoặc máy
    tính cầm tay để tính toán nhanh số trung bình, trung vị, tứ phân vị
  - #strong[Năng lực giao tiếp toán học:] Trình bày rõ ràng kết quả tính
    toán và ý nghĩa thực tiễn của các số đặc trưng.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  đầy đủ bài tập được giao.
- #strong[Trách nhiệm:] Có trách nhiệm trong hoạt động nhóm; nghiêm túc
  trong việc thu thập và xử lý dữ liệu.
- #strong[Trung thực:] Trung thực trong việc báo cáo kết quả tính toán
  và nhận xét.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối internet, máy
  tính cầm tay, phiếu học tập in sẵn.
- #strong[Học liệu:] Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc
  sống), tài liệu bổ trợ (nếu có), #strong[file dữ liệu mẫu] (dưới dạng
  bảng tính Excel/Google Sheets) để học sinh thực hành tính toán bằng
  công cụ số.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
  thiết của các số đặc trưng trong việc tóm tắt thông tin của mẫu số
  liệu, từ đó xác định nhiệm vụ học tập.
]
#nd-hd[
  - #strong[Tình huống mở đầu (Trò chơi học tập):] Giáo viên (GV) đưa ra
    một mẫu số liệu đơn giản về chiều cao của 10 học sinh.
  - #strong[Ví dụ cụ thể:] Chiều cao (cm) của 10 học sinh:
    $155\,160\,158\,165\,170\,162\,155\,172\,160\,163$.
  - #strong[Nhiệm vụ:] HS làm việc cá nhân/cặp đôi, thảo luận trả lời
    câu hỏi: \"Làm thế nào để chỉ dùng #strong[một vài con số] mà có thể
    nói lên được #strong[chiều cao tiêu biểu] hay #strong[xu hướng
    chung] của nhóm học sinh này?\"
]
#sp-hd[
  - Gợi ý ban đầu của HS về các con số đại diện (ví dụ: lấy số lớn nhất,
    số nhỏ nhất, hoặc số ở giữa...).
  - Nhận thức được rằng một mẫu số liệu cần các con số để tóm tắt xu
    hướng trung tâm.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV trình bày mẫu số liệu và đặt câu
    hỏi mở đầu. (GV chuyển giao nhiệm vụ)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS suy nghĩ cá nhân, sau đó
    thảo luận nhanh với bạn bên cạnh để đưa ra ý kiến. (HS thực hiện; GV
    quan sát, khuyến khích sự đa dạng ý kiến)
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 HS trình bày nhanh ý
    kiến ban đầu. (GV tổ chức, điều hành)
  - #strong[Bước 4: Kết luận, nhận định:] GV dẫn dắt: \"Để có câu trả
    lời khoa học và chính xác, chúng ta sẽ cùng tìm hiểu về các số đặc
    trưng đo xu thế trung tâm trong bài học hôm nay.\" (GV kết luận, dẫn
    dắt vào bài mới)

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "60 phút")
===== Hoạt động thành phần 2.1: Số trung bình và Trung vị (20 phút)
#mt-hd[
  trung bình và Trung vị; hiểu được ý nghĩa của từng số đặc trưng.
]
#nd-hd[
  - #strong[Nhiệm vụ:]
    - HS đọc SGK và tìm công thức tính Số trung bình và Trung vị.
    - #strong[Ví dụ cụ thể:] Dùng mẫu số liệu về điểm thi môn Toán của 8
      bạn: $7\,8\,5\,9\,6\,8\,10\,7$.
    - #strong[Thực hành (Tích hợp Năng lực số):] #strong[Sử dụng máy
      tính cầm tay hoặc phần mềm bảng tính] (Excel/Google Sheets) để
      tính $macron(x)$ (Số trung bình) và $M_e$ (Trung vị) của mẫu số
      liệu trên.
]
#sp-hd[
  - Ghi chép đầy đủ khái niệm, công thức tính $macron(x)$ và $M_e$.
  - Kết quả tính toán: $macron(x) = 7.5$\; $M_e = 7.5$ (hoặc kết quả
    tính toán của nhóm với các mẫu dữ liệu khác do GV cung cấp).
]
#tc-hd[
  - #strong[Thực hiện nhiệm vụ (Nhóm 4):] HS thảo luận tìm công thức. GV
    hướng dẫn HS sử dụng hàm `AVERAGE()` và sắp xếp dữ liệu để tìm Trung
    vị trên bảng tính. (GV theo dõi, hướng dẫn cách sử dụng công cụ số)
  - #strong[Báo cáo, thảo luận:] Đại diện 1 nhóm trình bày kết quả và ý
    nghĩa của Số trung bình, 1 nhóm khác trình bày Trung vị.

===== Hoạt động thành phần 2.2: Tứ phân vị (25 phút)
]
#mt-hd[
  ($Q_1\,Q_2\,Q_3$) và biết cách xác định/tính toán chúng.
]
#nd-hd[
  - #strong[Nhiệm vụ:]
    - HS nghiên cứu SGK để tìm hiểu cách xác định Tứ phân vị.
    - #strong[Ví dụ cụ thể:] Dùng mẫu số liệu về thời gian làm bài tập
      (phút) của 12 học sinh:
      $5\,7\,8\,10\,11\,13\,14\,15\,17\,20\,22\,25$.
    - #strong[Thực hành (Tích hợp Năng lực số):] #strong[Sử dụng phần
      mềm bảng tính] (Excel/Google Sheets) để tính $Q_1\,Q_2\,Q_3$ của
      mẫu số liệu trên.
]
#sp-hd[
  - Ghi chép các bước tìm Tứ phân vị.
  - Kết quả tính toán: Sắp xếp:
    $5\,7\,8\,10\,11\,13\,14\,15\,17\,20\,22\,25$. $Q_2 = 13.5$ (Trung
    vị). $Q_1 = 9$ (Trung vị nửa dưới). $Q_3 = 18.5$ (Trung vị nửa
    trên).
]
#tc-hd[
  - #strong[Thực hiện nhiệm vụ (Nhóm 4):] HS thảo luận, tự xây dựng quy
    trình tìm Tứ phân vị theo SGK. GV gợi ý sử dụng hàm `QUARTILE.EXC()`
    hoặc `QUARTILE.INC()` trong Excel/Sheets và giải thích sự khác biệt.
    (GV dự kiến khó khăn: xác định vị trí $Q_1\,Q_3$\; GV hỗ trợ)
  - #strong[Báo cáo, thảo luận:] GV mời một nhóm lên bảng trình bày kết
    quả thủ công, một nhóm khác trình bày kết quả bằng công cụ số và
    giải thích ý nghĩa (25% giá trị, 50% giá trị, 75% giá trị).

===== Hoạt động thành phần 2.3: Mốt (15 phút)
]
#mt-hd[
  Mốt trong các mẫu số liệu.
]
#nd-hd[
  - #strong[Nhiệm vụ:]
    - HS đọc SGK, tìm hiểu về Mốt.
    - #strong[Ví dụ cụ thể:] Lấy mẫu số liệu về cỡ giày (size) bán được
      trong một ngày: $37\,38\,38\,39\,40\,38\,37\,41$.
    - #strong[Ví dụ 2:] Mẫu số liệu về điểm thi (ví dụ 2.1).
]
#sp-hd[
  - Ghi chép khái niệm Mốt ($M_o$) và các trường hợp có một Mốt, nhiều
    Mốt hoặc không có Mốt.
  - Xác định được Mốt của Ví dụ 1 là $M_o = 38$.
]
#tc-hd[
  - #strong[Thực hiện nhiệm vụ (Cá nhân/Cặp đôi):] HS tự xác định Mốt và
    giải thích ý nghĩa của Mốt trong thực tế (phù hợp với dữ liệu định
    tính, dữ liệu không bị ảnh hưởng bởi giá trị ngoại lệ).
  - #strong[Báo cáo, thảo luận:] GV mời 2-3 HS trình bày kết quả và cho
    ví dụ thêm về mẫu số liệu không có Mốt hoặc có nhiều Mốt.
  - #strong[Kết luận, nhận định:] GV tổng kết, nhấn mạnh khi nào nên
    dùng Số trung bình, Trung vị, Tứ phân vị, Mốt.

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
  tập tổng hợp; phát triển kĩ năng làm việc nhóm và tổng hợp kiến thức.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Giải quyết #strong[Bài tập tổng hợp] và vẽ
    #strong[Sơ đồ tư duy] tóm tắt kiến thức.
  - #strong[Bài tập cụ thể:] Mẫu số liệu là khối lượng (kg) của 10 quả
    cam: $0.25\,0.32\,0.28\,0.25\,0.40\,0.35\,0.28\,0.25\,0.30\,0.25$.
  - #strong[Yêu cầu:] Tính $macron(x)\,M_e\,Q_1\,Q_3\,M_o$ và rút ra
    nhận xét.
]
#sp-hd[
  - Lời giải chính xác của bài tập: $macron(x) = 0.293$ kg; $M_e = 0.28$
    kg; $Q_1 = 0.25$ kg; $Q_3 = 0.32$ kg; $M_o = 0.25$ kg.
  - #strong[Sơ đồ tư duy] tóm tắt nội dung bài học (khái niệm, công
    thức, ý nghĩa, cách tính từng số đặc trưng).
]
#tc-hd[
  - #strong[Giao nhiệm vụ (Nhóm 4):] GV giao bài tập và yêu cầu HS vừa
    tính toán vừa lập Sơ đồ tư duy.
  - #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm, phân công nhiệm vụ
    (người tính toán, người vẽ sơ đồ, người chuẩn bị thuyết trình).
  - #strong[Báo cáo, thảo luận:] GV mời một nhóm thuyết trình về Sơ đồ
    tư duy và trình bày lời giải. (GV kiểm tra, đánh giá kết quả thực
    hiện)

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
  vào thực tiễn cuộc sống.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Tìm một mẫu số liệu thực tế (ví dụ: nhiệt độ
    trung bình các ngày trong tuần, số người nhiễm COVID-19 theo độ
    tuổi, giá xăng dầu theo tháng,...) và tính các số đặc trưng đã học.
  - #strong[Yêu cầu:] Học sinh phải tự thu thập hoặc đề xuất mẫu số liệu
    và #strong[sử dụng công cụ số] (Excel/Google Sheets) để tính toán,
    sau đó rút ra kết luận thực tiễn.
]
#sp-hd[
  rõ mẫu số liệu, kết quả tính toán và nhận xét (ví dụ: Số trung bình
  cho biết mức tiêu thụ trung bình, Trung vị ít bị ảnh hưởng bởi một
  ngày tiêu thụ quá cao/quá thấp).
]
#tc-hd[
  cầu nộp báo cáo qua email/Hệ thống Quản lí học tập (LMS) vào buổi học
  tiếp theo để trao đổi, chia sẻ và đánh giá.

#figure(
  align(center)[#table(
    columns: (32.22%, 45.62%),
    align: (auto,auto,),
    table.header(table.cell(align: left)[], table.cell(align: center)[Duyệt
      Kế hoạch bài dạy

      của tổ Khoa học tự nhiên

      Ngày \...... tháng \...... năm \......

      ],),
    table.hline(),
  )]
  , kind: table
  )

]
