// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 17 PT Mặt cầu",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được định nghĩa mặt cầu và các yếu tố xác định mặt cầu (tâm và bán
  kính).
- Thiết lập được #strong[phương trình chính tắc] của mặt cầu.
- Nhận dạng và xác định được tâm, bán kính của mặt cầu khi biết
  #strong[phương trình tổng quát].
- Vận dụng được công thức và phương trình mặt cầu để giải quyết các bài
  toán liên quan.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, đọc tài liệu,
    và hoàn thành nhiệm vụ học tập được giao (thể hiện qua Hoạt động 1
    và Hoạt động Vận dụng).
  - #strong[Năng lực giao tiếp và hợp tác:] Tương tác, thảo luận nhóm để
    xây dựng kiến thức và trình bày kết quả (thể hiện qua Hoạt động 2,
    Hoạt động 3).
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Đề xuất giải pháp,
    lập luận logic để giải quyết các bài toán về mặt cầu.
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích, tổng hợp
    thông tin để thiết lập phương trình mặt cầu, suy luận từ phương
    trình tổng quát về tâm và bán kính.
  - #strong[Năng lực mô hình hoá toán học:] Sử dụng phương trình mặt cầu
    để mô hình hóa một số đối tượng thực tiễn (ví dụ: mô hình Trái Đất,
    định vị GPS,...) (thể hiện rõ trong Hoạt động 2.2 và Hoạt động 4).
- #strong[Năng lực số:]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  nhiệm vụ được giao.
- #strong[Trung thực:] Nghiêm túc, thật thà trong quá trình làm bài tập
  và báo cáo kết quả.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong làm việc nhóm, chia sẻ
  kinh nghiệm và kiến thức với bạn bè.
- #strong[Yêu nước:] Thể hiện sự hiểu biết và trân trọng các thành tựu
  khoa học, công nghệ có ứng dụng Toán học.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính giáo viên, hệ
  thống loa, vật mẫu hình mặt cầu (quả bóng, mô hình Trái Đất nhỏ), bảng
  phụ/giấy A0.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập (Dạng sơ đồ tư duy, câu hỏi trò chơi Kahoot/Quizizz).
  - Máy tính cầm tay cá nhân.
  - Phần mềm #strong[GeoGebra 3D Calculator] (hoặc tương tự) để trực
    quan hóa mặt cầu (tích hợp năng lực số).
  - Tài liệu tham khảo về ứng dụng thực tiễn của mặt cầu (hệ thống GPS,
    rada).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
=== 1. Hoạt động 1: Khởi động/Mở đầu: Liên hệ thực tiễn và xác định vấn đề
#mt-hd[
Tạo hứng thú, giúp học sinh nhớ lại kiến thức về
  mặt cầu đã học ở lớp dưới, đồng thời xác định rõ vấn đề cần giải
  quyết: #strong[Làm thế nào để mô tả mặt cầu bằng công cụ toán học
  (phương trình) trong không gian Oxyz?]
]
#nd-hd[
Giáo viên trình chiếu hình ảnh #strong[mô hình
  Trái Đất] hoặc hệ thống định vị #strong[GPS] và đặt câu hỏi gợi mở:
  - Một điểm trên bề mặt Trái Đất (coi là mặt cầu) được xác định bằng
    những yếu tố nào?
  - Trong không gian tọa độ Oxyz, một điểm $M\(x\;y\;z\)$ nằm trên mặt
    cầu tâm $I\(a\;b\;c\)$ bán kính $R$ thì tọa độ của nó có mối liên hệ
    gì với $I$ và $R$?
]
#sp-hd[
  - Học sinh trả lời được về định nghĩa mặt cầu (tập hợp các điểm cách
    đều tâm một khoảng không đổi).
  - Học sinh xác định được mối liên hệ: $I M = R$.
  - Học sinh nêu ra được vấn đề cần giải quyết là biểu diễn mối liên hệ
    $I M = R$ dưới dạng phương trình tọa độ.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên trình chiếu và đặt câu
    hỏi. Yêu cầu học sinh làm việc cá nhân 3 phút để ghi lại ý tưởng.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh suy nghĩ, ghi chép.
    Giáo viên quan sát, dự kiến học sinh có thể quên công thức khoảng
    cách giữa hai điểm trong không gian. Hỗ trợ bằng cách gợi ý công
    thức khoảng cách.
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời 1-2 học sinh trình bày ý
    kiến.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chốt lại, dẫn dắt
    vào bài học mới: #strong[Phương trình mặt cầu].

=== 2. Hoạt động 2: Hình thành kiến thức mới/Giải quyết vấn đề
==== 2.1. Hoạt động thành phần 1: Phương trình mặt cầu (Phương trình chính tắc và Phương trình tổng quát)
\(Thời gian: 60 phút)

]
#mt-hd[
Giúp học sinh chiếm lĩnh kiến thức về
  #strong[phương trình chính tắc] và #strong[phương trình tổng quát] của
  mặt cầu.
]
#nd-hd[
Học sinh làm việc theo nhóm (4-5 HS/nhóm) thực
  hiện các nhiệm vụ sau:
  - #strong[Nhiệm vụ 1 (Chính tắc):] Từ công thức khoảng cách $I M = R$
    (với $I\(a\;b\;c\)\,M\(x\;y\;z\)$), hãy lập luận để viết được phương
    trình mặt cầu.
    - $I M = sqrt(\(x - a\)^2+\(y - b\)^2+\(z - c\)^2) arrow.r.double\(x - a\)^2+\(y - b\)^2+\(z - c\)^2= R^2$.
  - #strong[Nhiệm vụ 2 (Tổng quát):] Khai triển phương trình chính tắc,
    đưa về dạng tổng quát
    $x^2 + y^2 + z^2 - 2 a x - 2 b y - 2 c z + d = 0$. Tìm mối liên hệ
    giữa $a\,b\,c\,d$ và $R$.
  - #strong[Nhiệm vụ 3 (Ứng dụng):] #strong[Ví dụ minh họa:] Cho
    $A\(1\;- 2\;3\)$ và $B\(- 1\;0\;5\)$. Hãy viết phương trình mặt cầu
    đường kính $A B$.
  - #strong[Tích hợp Năng lực số:] Yêu cầu các nhóm sử dụng
    #strong[GeoGebra 3D Calculator] để vẽ và kiểm tra trực quan mặt cầu
    tìm được ở Nhiệm vụ 3. (Biểu hiện NL số: #strong[Sử dụng công cụ số
    để mô hình hóa và kiểm tra kết quả học tập]).
]
#sp-hd[
  - Phương trình chính tắc: $\(x - a\)^2+\(y - b\)^2+\(z - c\)^2= R^2$.
  - Phương trình tổng quát:
    $x^2 + y^2 + z^2 - 2 a x - 2 b y - 2 c z + d = 0$, với
    $R = sqrt(a^2 + b^2 + c^2 - d)$ (điều kiện
    $a^2 + b^2 + c^2 - d > 0$).
  - Lời giải cho ví dụ minh họa: Mặt cầu có tâm $I\(0\;- 1\;4\)$ và bán
    kính $R = sqrt(3)$. Phương trình là
    $x^2 +\(y + 1\)^2+\(z - 4\)^2= 3$.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên chia nhóm, giao phiếu học
    tập (Sơ đồ tư duy dạng điền khuyết về 2 loại phương trình).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm, giải
    quyết vấn đề. Giáo viên quan sát, hỗ trợ. Dự kiến khó khăn: xác định
    điều kiện để phương trình tổng quát là phương trình mặt cầu. Gợi ý
    học sinh dựa vào công thức tính $R$.
  - #strong[Bước 3: Báo cáo, thảo luận:] Đại diện 2 nhóm lên trình bày
    (1 nhóm trình bày chính tắc, 1 nhóm trình bày tổng quát). Các nhóm
    khác nhận xét, bổ sung.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chốt lại, nhấn mạnh
    điểm khác biệt và điều kiện tồn tại của 2 dạng phương trình, khuyến
    khích học sinh trình bày kết quả bằng sơ đồ tư duy.

==== 2.2. Hoạt động thành phần 2: Một số ứng dụng của phương trình mặt cầu trong thực tiễn
\(Thời gian: 30 phút)

]
#mt-hd[
Giúp học sinh thấy được ứng dụng thực tế của
  phương trình mặt cầu, đặc biệt trong việc mô hình hóa không gian và
  định vị.
]
#nd-hd[
Học sinh xem một đoạn video ngắn/hình ảnh về
  #strong[hệ thống định vị GPS] hoặc #strong[Radar] (radar trinh sát
  quân sự có thể quét trong một khu vực hình cầu).
  - #strong[Nhiệm vụ:] Thảo luận nhóm và trả lời câu hỏi: #strong[Phương
    trình mặt cầu được ứng dụng như thế nào trong việc xác định vị trí
    của các vệ tinh GPS hay phạm vi quét của Radar?]
  - #strong[Ví dụ minh họa:] Một trạm Radar đặt tại gốc tọa độ
    $O\(0\;0\;0\)$ có phạm vi quét là $R = 100$ km. Một máy bay đang ở
    tọa độ $M\(60\;70\;80\)$. Máy bay có nằm trong phạm vi quét của
    Radar không? Nếu máy bay di chuyển trên một quỹ đạo là mặt cầu tâm
    $O$, bán kính $R = 100$ thì phương trình quỹ đạo đó là gì?
  - #strong[Tích hợp Năng lực số:] Yêu cầu học sinh sử dụng #strong[máy
    tính cầm tay/ứng dụng máy tính trên điện thoại] để tính nhanh khoảng
    cách $O M$ và so sánh với $R$ (Biểu hiện NL số: #strong[Thực hiện
    các thao tác tính toán phức tạp bằng công cụ số]).
]
#sp-hd[
  - Phương trình mặt cầu mô tả phạm vi quét của Radar:
    $x^2 + y^2 + z^2 = 100^2$.
  - Khoảng cách $O M = sqrt(60^2 + 70^2 + 80^2) approx 122.47$ km. Kết
    luận: Máy bay nằm ngoài phạm vi quét.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Chiếu video/hình ảnh. Đặt câu hỏi và
    giao ví dụ.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thảo luận, giải quyết
    ví dụ.
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời đại diện nhóm trả lời ứng
    dụng thực tiễn và trình bày lời giải ví dụ.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên nhấn mạnh vai trò
    của toán học trong công nghệ.

]
#hd("3", "Luyện tập", "Trò chơi học tập")
\(Thời gian: 15 phút)

#mt-hd[
Củng cố kiến thức và kĩ năng giải các dạng bài
  tập cơ bản về phương trình mặt cầu: viết phương trình và xác định
  tâm/bán kính.
]
#nd-hd[
Tổ chức #strong[Trò chơi học tập \"Ai nhanh
  hơn\"] với hệ thống câu hỏi trắc nghiệm nhanh (sử dụng nền tảng
  #strong[Quizizz/Kahoot] - Tích hợp Năng lực số) hoặc phiếu trắc
  nghiệm.
  - #strong[Ví dụ câu hỏi 1 (Kĩ năng nhận dạng):] Phương trình nào sau
    đây là phương trình mặt cầu?
    - A. $x^2 + y^2 + z^2 - 2 x + 4 y + 6 z + 20 = 0$
    - B. $x^2 + y^2 + z^2 - 2 x + 4 y - 4 = 0$
  - #strong[Ví dụ câu hỏi 2 (Kĩ năng viết phương trình):] Viết phương
    trình mặt cầu tâm $I\(- 1\;2\;0\)$ đi qua điểm $A\(2\;1\;- 3\)$.
]
#sp-hd[
Đáp án đúng và lời giải chi tiết cho các câu
  hỏi.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên giới thiệu luật chơi (cá
    nhân/nhóm trả lời trên thiết bị số).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh tham gia trò chơi.
    Giáo viên theo dõi, đốc thúc tinh thần học sinh.
  - #strong[Bước 3: Báo cáo, thảo luận:] Giáo viên tổng kết điểm, chữa
    nhanh các câu hỏi, yêu cầu học sinh giải thích cách làm (tăng cường
    kĩ năng giao tiếp, phân tích).

]
#hd("4", "Vận dụng", "Nhiệm vụ về nhà")
\(Thời gian: 15 phút - dành cho việc giao nhiệm vụ và định hướng)

#mt-hd[
Phát triển năng lực vận dụng kiến thức vào thực
  tiễn, khuyến khích sáng tạo và tìm tòi thông tin.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Tìm hiểu và trình bày báo cáo về ứng dụng của
    phương trình mặt cầu trong một lĩnh vực cụ thể mà em quan tâm (Ví
    dụ: Y học - mô hình hóa khối u dạng cầu; Hàng không - khu vực cấm
    bay;...).
  - #strong[Yêu cầu:] Học sinh tự đặt ra tình huống/vấn đề thực tế, mô
    hình hóa bằng phương trình mặt cầu, và giải quyết vấn đề đó.
]
#sp-hd[
  - Báo cáo trình bày dưới dạng bài viết, slide (PowerPoint/Google
    Slides), hoặc video ngắn.
  - Nội dung báo cáo phải có: Đặt vấn đề $arrow.r$ Mô hình toán học
    (Phương trình mặt cầu) $arrow.r$ Giải quyết vấn đề $arrow.r$ Kết
    luận.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên giao nhiệm vụ và yêu cầu
    học sinh làm việc cá nhân/theo nhóm nhỏ (2-3 HS) ngoài giờ học.
  - #strong[Bước 2: Hướng dẫn:] Hướng dẫn học sinh tìm kiếm thông tin
    trên internet (nguồn đáng tin cậy) (Tích hợp NL số: #strong[Tìm
    kiếm, chọn lọc và đánh giá thông tin trên môi trường số]).
  - #strong[Bước 3: Nộp báo cáo:] Giáo viên quy định thời hạn nộp (ví
    dụ: cuối tuần sau) qua email/Google Classroom (Tích hợp NL số:
    #strong[Tương tác và trao đổi thông tin hiệu quả trong môi trường
    số]).
  - #strong[Bước 4: Đánh giá:] Giáo viên sẽ dành thời gian phù hợp (tiết
    ôn tập/đầu giờ) để nhận xét, đánh giá sản phẩm và tổ chức chia sẻ
    cho cả lớp.

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
