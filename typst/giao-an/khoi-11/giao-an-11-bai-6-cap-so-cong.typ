// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 6 Cấp số cộng",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Nhận biết] được khái niệm #strong[cấp số cộng] (CSC).
- #strong[Xác định] được #strong[công sai] của một CSC.
- #strong[Nêu] được #strong[công thức số hạng tổng quát] của một CSC.
- #strong[Nêu] được #strong[công thức tính tổng] $n$ #strong[số hạng đầu
  tiên] của một CSC.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm hiểu kiến thức về CSC qua
    sách giáo khoa (SGK) và tài liệu số.
  - #strong[Giao tiếp và hợp tác:] Hợp tác hiệu quả trong làm việc nhóm,
    trao đổi, thảo luận, trình bày và bảo vệ ý kiến.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống thực
    tiễn, đề xuất giải pháp để giải quyết các bài toán liên quan đến
    CSC.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận Toán học:] Nhận biết, phân tích,
    tổng hợp kiến thức để hình thành định nghĩa và các công thức của
    CSC.
  - #strong[Năng lực mô hình hóa Toán học:] Sử dụng CSC để mô hình hóa
    và giải quyết các bài toán thực tiễn (ví dụ: gửi tiết kiệm, trồng
    cây, xếp ghế).
  - #strong[Năng lực giải quyết vấn đề Toán học:] Vận dụng linh hoạt các
    công thức để tìm số hạng, công sai, hoặc tổng của CSC.
- #strong[Năng lực số (Theo Thông tư 02/2025/TT-BGDĐT):]
  - #strong[Sử dụng và quản lý các công cụ, phương tiện kỹ thuật số:] HS
    sử dụng #strong[máy tính cầm tay] hoặc #strong[phần mềm bảng tính
    (Excel/Google Sheets)] để tính toán, kiểm tra kết quả tính tổng $n$
    số hạng đầu tiên, và lập bảng theo dõi dãy số nhanh chóng, chính
    xác.
  - #strong[Tạo và tương tác với nội dung số:] HS sử dụng các công cụ
    như #strong[Canva] hoặc #strong[PowerPoint] để thiết kế sơ đồ tư duy
    (SĐTD) hoặc slide báo cáo kết quả thảo luận nhóm.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, tự giác hoàn thành các nhiệm vụ học tập
  được giao, đặc biệt là các nhiệm vụ vận dụng thực tiễn ngoài giờ.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ của bản thân và
  nhóm, trung thực trong học tập và đánh giá.
- #strong[Trung thực:] Ghi nhận kết quả đúng đắn, trung thực khi làm bài
  tập và báo cáo.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối Internet.
- #strong[Học liệu:]
  - SGK Toán 11 (Tập 1 - Kết nối tri thức với cuộc sống).
  - Phiếu học tập (PHT) cho từng hoạt động (in giấy hoặc dùng Google
    Form/Quizizz).
  - Tài liệu số: Video giới thiệu về các tình huống thực tế liên quan
    đến CSC (ví dụ: tháp Hà Nội, xếp ghế rạp chiếu phim).
  - #strong[Công cụ số:] Phần mềm/ứng dụng tạo SĐTD (Mindmap/Canva),
    phần mềm bảng tính (Google Sheets/Excel).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "10 phút")
#mt-hd[
Tạo hứng thú, giúp HS nhận thấy sự xuất hiện của
  dãy số có quy luật trong thực tiễn và dẫn dắt đến khái niệm CSC.
]
#nd-hd[
#strong[Tình huống thực tiễn:]
  - Thầy giáo giao nhiệm vụ cho cả lớp: \"Một người thợ làm việc với mức
    lương khởi điểm là #strong[5.000.000 đồng/tháng]. Cứ sau mỗi năm,
    mức lương được tăng thêm #strong[200.000 đồng/tháng]\.\"
  - #strong[Yêu cầu/Nhiệm vụ:]
    - #strong[Nhiệm vụ 1:] Tính mức lương của người thợ đó sau năm thứ
      nhất, năm thứ hai, năm thứ ba.
    - #strong[Nhiệm vụ 2:] Nhận xét về quy luật của dãy số các mức lương
      theo từng năm.
]
#sp-hd[
  - Dãy số các mức lương: $5.000 .000$, $5.200 .000$, $5.400 .000$
    (đồng).
  - Nhận xét: Kể từ số hạng thứ hai, mỗi số hạng bằng số hạng đứng ngay
    trước nó cộng với một số không đổi là $200.000$.
]
#tc-hd[
  - #strong[Bước 1: Chuyển giao nhiệm vụ:] GV chiếu (hoặc đọc) tình
    huống, yêu cầu HS làm việc cá nhân và ghi kết quả ra nháp. (3 phút)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS tính toán. GV quan sát,
    khuyến khích 1-2 HS chia sẻ nhanh cách tính. (3 phút)
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1 HS trình bày kết quả,
    HS khác nhận xét, bổ sung. (2 phút)
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt lại quy luật và giới
    thiệu: Dãy số này được gọi là #strong[Cấp số cộng]. Đặt vấn đề: Làm
    thế nào để tính mức lương sau 10 năm hoặc tổng lương sau 5 năm?
    $arrow.r$ Dẫn vào bài học mới. (2 phút)

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "65 phút")
==== #strong[Hoạt động 2.1: Định nghĩa Cấp số cộng và Công sai (15 phút)]
#mt-hd[
HS nắm vững định nghĩa CSC và xác định được công
  sai $d$.
]
#nd-hd[
  - #strong[Nhiệm vụ:] HS làm việc nhóm nhỏ (3-4 HS), đọc #strong[Mục 1:
    Định nghĩa] trong SGK và Phiếu học tập số 1.
  - #strong[Ví dụ đề xuất:] #strong[Cho các dãy số:]
    #block[
    #set enum(numbering: "i.", start: 1)
    + $1\,3\,5\,7\,9\,dots.h$
    + $2\,4\,8\,16\,32\,dots.h$
    + $10\,7\,4\,1\,- 2\,dots.h$
    ]
  - #strong[Yêu cầu:] Dựa vào định nghĩa trong SGK, xác định dãy nào là
    CSC? Nếu là CSC, hãy tìm #strong[công sai] $d$ của nó.
]
#sp-hd[
  - Định nghĩa: CSC là dãy số (hữu hạn hoặc vô hạn) mà trong đó, kể từ
    số hạng thứ hai, mỗi số hạng bằng số hạng đứng ngay trước nó cộng
    với một số không đổi $d$. Số $d$ gọi là #strong[công sai].
  - Dãy 1 và 3 là CSC: Dãy 1 có $d = 2$. Dãy 3 có $d = - 3$.
]
#tc-hd[
  - #strong[Bước 1: Chuyển giao nhiệm vụ:] GV giao PHT 1. Yêu cầu HS
    thảo luận nhóm, phân tích ví dụ theo định nghĩa SGK. (2 phút)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận. GV quan sát, gợi
    ý, chỉnh sửa nếu nhóm hiểu sai khái niệm. (8 phút)
  - #strong[Bước 3: Báo cáo, thảo luận:] Đại diện 2 nhóm (một nhóm trình
    bày Định nghĩa, một nhóm trình bày ví dụ) báo cáo. GV mời nhóm khác
    nhận xét. (3 phút)
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt lại Định nghĩa và Công
    sai.

==== #strong[Hoạt động 2.2: Số hạng tổng quát (25 phút)]
]
#mt-hd[
HS tự xây dựng được công thức số hạng tổng quát
  $u_n = u_1 +\(n - 1\)d$ và vận dụng để tìm số hạng bất kì.
]
#nd-hd[
  - #strong[Nhiệm vụ (Làm việc cá nhân] $arrow.r$ #strong[Chia sẻ
    nhóm):] Dựa vào định nghĩa, HS tự viết biểu thức các số hạng đầu
    tiên $u_2\,u_3\,u_4$ theo $u_1$ và $d$.
  - #strong[Ví dụ đề xuất:] Cho CSC $\(u_n\)$ có $u_1 = 3$ và $d = 5$.
    - #strong[Yêu cầu 1:] Viết công thức $u_n$ theo $u_1$ và $d$.
    - #strong[Yêu cầu 2:] Tính số hạng thứ 100 ($u_100$).
  - #strong[Tích hợp năng lực số (Thao tác trên công cụ số):] HS sử dụng
    #strong[máy tính cầm tay (chế độ MODE 7 - TABLE/Bảng giá trị)] hoặc
    #strong[Google Sheets/Excel] để lập bảng giá trị của 10 số hạng đầu
    tiên của CSC trên, so sánh với kết quả tính bằng công thức. (Biểu
    hiện NL số: #strong[Sử dụng và quản lý các công cụ, phương tiện kỹ
    thuật số] để kiểm tra tính chính xác và hiệu quả của công thức).
]
#sp-hd[
  - $u_n = u_1 +\(n - 1\)d$.
  - $u_100 = 3 +\(100 - 1\)dot.op 5 = 3 + 495 = 498$.
  - Bảng giá trị trên công cụ số trùng khớp với kết quả.
]
#tc-hd[
  - #strong[Bước 1: Chuyển giao nhiệm vụ:] GV yêu cầu HS làm việc cá
    nhân trong 5 phút để tìm mối liên hệ giữa $u_n\,u_1\,d$. (5 phút)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận chéo trong nhóm để
    xác nhận công thức. GV theo dõi, hỗ trợ, đặc biệt là việc sử dụng
    công cụ số. (10 phút)
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời một nhóm lên bảng trình
    bày quá trình suy luận để ra công thức tổng quát. Sau đó, GV trình
    chiếu kết quả tính bằng phần mềm bảng tính. (5 phút)
  - #strong[Bước 4: Kết luận, nhận định:] GV chính thức hóa công thức
    $u_n$ và cách áp dụng.

==== #strong[Hoạt động 2.3: Tổng] $n$ #strong[số hạng đầu của một cấp số cộng (25 phút)]
]
#mt-hd[
HS xây dựng được công thức tính tổng $n$ số hạng
  đầu $S_n$ và áp dụng vào bài toán thực tiễn.
]
#nd-hd[
  - #strong[Nhiệm vụ (Thảo luận nhóm):] GV gợi ý lịch sử (Ví dụ Gauss
    tính tổng $1 + 2 + dots.h + 100$). Yêu cầu HS suy luận để tính tổng
    $S_n = u_1 + u_2 + dots.h + u_n$.
  - #strong[Ví dụ đề xuất:] Tính tổng tiền lương mà người thợ (từ HĐ 1)
    nhận được sau 5 năm làm việc.
  - #strong[Yêu cầu:] Tính $S_5$ của CSC có $u_1 = 5.000 .000$ và
    $d = 200.000$.
]
#sp-hd[
  - Công thức: $S_n = frac(n\(u_1 + u_n\), 2)$ hoặc
    $S_n = frac(n\[2 u_1 +\(n - 1\)d\], 2)$.
  - $S_5 = frac(5\[2 dot.op 5.000 .000 +\(5 - 1\)dot.op 200.000\], 2) = 26.000 .000$
    (đồng).
]
#tc-hd[
  - #strong[Bước 1: Chuyển giao nhiệm vụ:] GV giới thiệu bối cảnh, yêu
    cầu HS thảo luận để tìm ra công thức tổng quát $S_n$. (3 phút)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc nhóm, tìm ra công
    thức và áp dụng vào ví dụ thực tiễn. (15 phút)
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1 nhóm trình bày công
    thức và lời giải. Nhóm khác nhận xét. (5 phút)
  - #strong[Bước 4: Kết luận, nhận định:] GV chính thức hóa công thức
    $S_n$.

]
#hd("3", "Luyện tập", "10 phút")
#mt-hd[
Vận dụng kiến thức vừa học (Định nghĩa,
  $u_n\,S_n$) để rèn luyện kỹ năng tính toán, xử lý tình huống đơn giản.
]
#nd-hd[
  - #strong[Trò chơi học tập (Đua tốc độ):] GV sử dụng
    #strong[Quizizz/Kahoot] hoặc một hệ thống 5 câu hỏi trắc nghiệm
    nhanh.
  - #strong[Ví dụ đề xuất:]
    #block[
    #set enum(numbering: "i.", start: 1)
    + Cho CSC $\(u_n\)$ có $u_1 = 1$, $d = 3$. Tìm $u_5$.
    + Cho CSC $\(u_n\)$ có $u_3 = 8$, $u_5 = 14$. Tìm $d$.
    + Tính tổng 20 số hạng đầu của CSC $2\,5\,8\,dots.h$
    ]
  - #strong[Tích hợp năng lực số (Sử dụng công cụ số để học tập):] HS sử
    dụng điện thoại/máy tính để tham gia trò chơi trực tuyến. (Biểu hiện
    NL số: #strong[Sử dụng và quản lý các công cụ, phương tiện kỹ thuật
    số] để tham gia hoạt động học tập).
]
#sp-hd[
Đáp án chính xác của 5 câu hỏi trắc nghiệm.
]
#tc-hd[
  - #strong[Bước 1: Chuyển giao nhiệm vụ:] GV giới thiệu trò chơi, hướng
    dẫn cách tham gia. (1 phút)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS tham gia trò chơi. (7 phút)
  - #strong[Bước 3: Báo cáo, thảo luận:] Hệ thống tự động báo cáo kết
    quả. GV chọn lọc 1-2 câu hỏi khó nhất để chữa nhanh. (2 phút)

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
Phát triển năng lực mô hình hóa Toán học, vận
  dụng kiến thức vào thực tiễn cuộc sống.
]
#nd-hd[
  - #strong[Nhiệm vụ (Giao về nhà):] #strong[Thử thách xếp ghế:]
    - \"Trong một rạp chiếu phim, hàng ghế đầu tiên có #strong[15 ghế],
      mỗi hàng ghế sau có nhiều hơn hàng ghế trước #strong[2 ghế]\.\"
    - #strong[Yêu cầu 1:] Tính số ghế ở hàng thứ 12.
    - #strong[Yêu cầu 2:] Nếu rạp có 20 hàng ghế, rạp đó có tổng cộng
      bao nhiêu ghế?
  - #strong[Tích hợp năng lực số (Sáng tạo nội dung số):] HS được khuyến
    khích sử dụng #strong[Sơ đồ tư duy (SĐTD)] hoặc một
    #strong[Infographic] (thiết kế bằng Canva/PowerPoint) để trình bày
    lời giải và phân tích vấn đề. (Biểu hiện NL số: #strong[Tạo và tương
    tác với nội dung số] để giải thích và trình bày ý tưởng).
]
#sp-hd[
Báo cáo dưới dạng SĐTD/Infographic hoặc bài giải
  chi tiết.
  - $u_12 = 15 +\(12 - 1\)dot.op 2 = 37$ ghế.
  - $S_20 = frac(20\[2 dot.op 15 +\(20 - 1\)dot.op 2\], 2) = 680$ ghế.
]
#tc-hd[
  - GV giao nhiệm vụ, hướng dẫn cách thực hiện ngoài giờ học trên lớp và
    hẹn thời gian nộp báo cáo (dưới hình thức file số hoặc ảnh chụp).
  - #strong[Tiết sau:] GV sẽ chọn lọc và trình chiếu một số sản phẩm tốt
    nhất để trao đổi, chia sẻ và đánh giá.

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
