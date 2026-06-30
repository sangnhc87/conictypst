// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 10 Phương sai. Độ lệch chuẩn",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được ý nghĩa của phương sai, độ lệch chuẩn trong việc đo lường mức
  độ phân tán của dữ liệu.
- Trình bày được công thức tính phương sai và độ lệch chuẩn của một mẫu
  số liệu ghép nhóm.
- Vận dụng công thức để tính toán và giải thích ý nghĩa của phương sai,
  độ lệch chuẩn cho mẫu số liệu ghép nhóm.
- Mô tả được cách sử dụng phương sai và độ lệch chuẩn để đo độ rủi ro
  trong một số tình huống thực tế đơn giản (ví dụ: đầu tư).

#muc("2", "NĂNG LỰC")
==== a) Năng lực chung
- #strong[Tự chủ và tự học:] Chủ động, tích cực hoàn thành nhiệm vụ được
  giao; tìm kiếm tài liệu và sử dụng công cụ tính toán (máy tính cầm
  tay, phần mềm bảng tính) để tính toán Phương sai và Độ lệch chuẩn.
- #strong[Giao tiếp và hợp tác:] Tích cực tham gia thảo luận nhóm để đề
  xuất giải pháp, trình bày ý kiến rõ ràng; hợp tác để hoàn thành nhiệm
  vụ chung (xây dựng sơ đồ tư duy, báo cáo).
- #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống thực tế
  liên quan đến độ rủi ro để vận dụng kiến thức tính toán, đưa ra quyết
  định hợp lí.

==== b) Năng lực đặc thù môn Toán
- #strong[Năng lực tư duy và lập luận toán học:] Phân tích ý nghĩa của
  các đại lượng thống kê (Phương sai, Độ lệch chuẩn) trong việc đánh giá
  sự phân tán của dữ liệu.
- #strong[Năng lực mô hình hóa toán học:] Thiết lập được mô hình toán
  học (công thức tính Phương sai, Độ lệch chuẩn) cho mẫu số liệu ghép
  nhóm.
- #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng công thức và
  công cụ (máy tính/phần mềm) để tính toán Phương sai, Độ lệch chuẩn và
  đưa ra kết luận.
- #strong[Năng lực giao tiếp toán học:] Trình bày rõ ràng kết quả tính
  toán và giải thích ý nghĩa thống kê của các đại lượng.

==== c) Năng lực số
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.
- 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
  dạng khác nhau,
- 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc tạo
  ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Nghiêm túc, tích cực thực hiện các nhiệm vụ học tập
  cá nhân và nhóm.
- #strong[Trách nhiệm:] Hoàn thành nhiệm vụ được giao, có trách nhiệm
  với kết quả của nhóm và biết chia sẻ, hỗ trợ bạn bè.
- #strong[Trung thực:] Trung thực trong việc thu thập, xử lí số liệu và
  báo cáo kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:]
  - Máy chiếu, máy tính có kết nối mạng.
  - Slide bài giảng trình bày các khái niệm, công thức, ví dụ minh họa
    và nhiệm vụ học tập.
  - Phiếu học tập in sẵn (hoặc file điện tử) cho Hoạt động Luyện tập và
    Vận dụng.
  - Tài liệu về các chỉ số rủi ro trong đầu tư hoặc kinh tế để minh họa
    thực tế.
- #strong[Học sinh:]
  - Sách giáo khoa Toán 11, vở ghi.
  - Máy tính cầm tay (casio fx-570ES Plus trở lên).
  - Điện thoại thông minh/máy tính bảng (nếu cần) để truy cập tài liệu
    hoặc sử dụng phần mềm bảng tính (Google Sheets/Excel) trong phần
    Tích hợp Năng lực số.
  - Giấy A0/bút dạ (hoặc công cụ số như Mindmap online) để làm Sơ đồ tư
    duy.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
==== a) Mục tiêu
- Tạo hứng thú và kết nối với kiến thức đã học (Số trung bình, Trung vị,
  Tứ phân vị).
- Giúp học sinh nhận ra sự cần thiết của một chỉ số để đo lường mức độ
  #strong[phân tán] (độ rủi ro) của dữ liệu, từ đó dẫn đến khái niệm
  Phương sai và Độ lệch chuẩn.

==== b) Nội dung
- #strong[Nhiệm vụ:] Giải quyết tình huống so sánh.
- #strong[Ví dụ:] Giáo viên đưa ra tình huống giả định về kết quả bán
  hàng (hoặc điểm số) của hai nhân viên (hoặc hai lớp học) trong 10
  tháng, được thống kê thành 2 mẫu số liệu ghép nhóm có cùng #strong[Số
  trung bình].
  - #strong[Mẫu A:] $macron(x)_A = 80$ (điểm/sản phẩm)
  - #strong[Mẫu B:] $macron(x)_B = 80$ (điểm/sản phẩm)
  - #strong[Yêu cầu:] Thảo luận cặp đôi hoặc nhóm nhỏ, nhận xét về mức
    độ ổn định (độ rủi ro) của kết quả của hai mẫu A và B. Liệu chỉ dùng
    số trung bình có đủ để đánh giá không? Cần thêm chỉ số nào?

==== c) Sản phẩm
- Kết quả thảo luận của học sinh, nhận xét được rằng: Mặc dù Số trung
  bình bằng nhau, nhưng sự phân tán của hai mẫu có thể khác nhau (một
  mẫu ổn định hơn, một mẫu biến động/rủi ro hơn).
- Đề xuất (hoặc chấp nhận) cần có một chỉ số mới đo lường #strong[độ
  phân tán] để đánh giá toàn diện hơn.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (2 phút):] Giáo viên trình bày tình
  huống ví dụ, yêu cầu học sinh làm việc cặp đôi hoặc nhóm nhỏ 4 người,
  thảo luận và ghi nhận xét vào vở.
- #strong[Bước 2: Thực hiện nhiệm vụ (4 phút):] Học sinh thảo luận. Giáo
  viên quan sát, theo dõi.
  - #emph[Dự kiến khó khăn:] Học sinh có thể chưa hình dung rõ khái niệm
    \"độ phân tán\".
  - #emph[Biện pháp hỗ trợ:] Giáo viên gợi ý tập trung vào sự chênh lệch
    của các giá trị so với giá trị trung bình 80.
- #strong[Bước 3: Báo cáo, thảo luận (3 phút):] Mời 1-2 cặp/nhóm trình
  bày nhận xét. Giáo viên tổng hợp ý kiến.
- #strong[Bước 4: Kết luận, nhận định (1 phút):] Giáo viên nhận định,
  khẳng định: Để đánh giá sự ổn định hay rủi ro của dữ liệu, cần một chỉ
  số đo độ phân tán. Đó chính là #strong[Phương sai và Độ lệch chuẩn].

#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "60 phút")
==== 2.1. Hoạt động thành phần 1: Phương sai và Độ lệch chuẩn (30 phút)
==== a) Mục tiêu
- Giúp học sinh nắm vững công thức và ý nghĩa của Phương sai, Độ lệch
  chuẩn cho mẫu số liệu ghép nhóm.
- Phát triển năng lực tính toán và lập luận toán học.

==== b) Nội dung
- #strong[Nhiệm vụ 1:] Nghiên cứu #strong[công thức] tính Phương sai
  ($S^2$) và Độ lệch chuẩn ($S$) cho mẫu số liệu ghép nhóm (Sử dụng SGK
  và tài liệu học tập).
- #strong[Nhiệm vụ 2:] Vận dụng công thức để tính toán.
  - #strong[Ví dụ minh họa:] Sử dụng mẫu số liệu ghép nhóm về
    #strong[\"Thời gian luyện tập thể thao trong tuần (phút)\"] của học
    sinh (Giáo viên cung cấp một bảng tần số ghép nhóm có 5-6 lớp và đã
    tính sẵn số trung bình $macron(x)$).
  - #strong[Yêu cầu:] Thực hiện các bước:
    #block[
    #set enum(numbering: "i.", start: 1)
    + Tính giá trị đại diện $x_i$ cho mỗi lớp.
    + Lập bảng phụ trợ để tính tổng $sum n_i\(x_i - macron(x)\)^2$.
    + Tính Phương sai ($S^2$).
    + Tính Độ lệch chuẩn ($S$) và giải thích ý nghĩa của $S$.
    ]

==== c) Sản phẩm
- Công thức Phương sai và Độ lệch chuẩn được ghi chép đầy đủ.
- Bảng phụ trợ và kết quả tính toán chính xác Phương sai ($S^2$) và Độ
  lệch chuẩn ($S$) cho ví dụ minh họa.
- Giải thích rõ ràng ý nghĩa của $S$ (độ lệch trung bình của các giá trị
  so với số trung bình $macron(x)$).

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (5 phút):] Giáo viên chiếu công thức,
  hướng dẫn học sinh đọc SGK và chia nhóm (4-5 người), giao nhiệm vụ
  tính toán Phương sai và Độ lệch chuẩn cho ví dụ #strong[\"Thời gian
  luyện tập\"].
- #strong[Bước 2: Thực hiện nhiệm vụ (15 phút):] Học sinh thảo luận
  nhóm, phân công nhau tính toán.
  - #emph[Tích hợp Năng lực số:] #strong[Đề xuất:] Cho phép học sinh sử
    dụng máy tính cầm tay (chế độ STAT) hoặc #strong[phần mềm bảng tính
    (Excel/Google Sheets)] để kiểm tra lại kết quả tính toán.
  - #emph[Biểu hiện Năng lực số:] #strong[Sử dụng công cụ, phương tiện
    kỹ thuật số] để hỗ trợ tính toán phức tạp (áp dụng hàm
    $upright("VAR.P")$ hoặc $upright("STDEV.P")$ để kiểm tra). Giáo viên
    theo dõi, hỗ trợ các nhóm gặp khó khăn về công thức hoặc thao tác
    tính toán trên máy tính.
- #strong[Bước 3: Báo cáo, thảo luận (7 phút):] Mời một nhóm trình bày
  chi tiết các bước tính toán trên bảng/máy chiếu (thao tác trực tiếp
  trên phần mềm nếu sử dụng máy tính). Các nhóm khác nhận xét, bổ sung.
- #strong[Bước 4: Kết luận, nhận định (3 phút):] Giáo viên chuẩn hóa
  công thức, khẳng định lại ý nghĩa của $S^2$ và $S$ trong việc đo độ
  phân tán.

==== 2.2. Hoạt động thành phần 2: Sử dụng Phương sai, Độ lệch chuẩn đo độ rủi ro (30 phút)
==== a) Mục tiêu
- Vận dụng Phương sai/Độ lệch chuẩn vào đánh giá mức độ rủi ro trong
  thực tế (phát triển năng lực giải quyết vấn đề thực tiễn).
- Tăng cường kĩ năng giao tiếp, thuyết trình và phân tích thông tin.

==== b) Nội dung
- #strong[Nhiệm vụ:] Giải quyết tình huống so sánh độ rủi ro.
- #strong[Ví dụ:] #strong[Đầu tư chứng khoán]
  - Hai mã cổ phiếu #strong[X] và #strong[Y] có cùng mức #strong[Lợi
    nhuận trung bình] hàng năm là 10%.
  - Sau khi tính toán từ dữ liệu quá khứ (đã được giáo viên chuẩn bị),
    ta có:
    - Cổ phiếu #strong[X] có Độ lệch chuẩn $S_X = 5 %$
    - Cổ phiếu #strong[Y] có Độ lệch chuẩn $S_Y = 15 %$
  - #strong[Yêu cầu:] Nhóm thảo luận, sử dụng kiến thức về Phương sai/Độ
    lệch chuẩn để trả lời câu hỏi:
    #block[
    #set enum(numbering: "i.", start: 1)
    + Cổ phiếu nào có mức độ rủi ro cao hơn? Vì sao?
    + Nếu một nhà đầu tư ưu tiên sự #strong[ổn định], họ nên chọn cổ
      phiếu nào?
    ]

==== c) Sản phẩm
- Kết luận rõ ràng: Cổ phiếu Y có rủi ro cao hơn (do $S_Y > S_X$). Nhà
  đầu tư muốn ổn định nên chọn X.
- Bài thuyết trình/Báo cáo ngắn gọn (có thể là Sơ đồ tư duy) phân tích
  mối quan hệ: #strong[Độ lệch chuẩn] $arrow.t$ $arrow.r.double$
  #strong[Độ phân tán] $arrow.t$ $arrow.r.double$ #strong[Rủi ro]
  $arrow.t$.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (5 phút):] Giáo viên trình bày ví dụ
  #strong[Đầu tư chứng khoán] và yêu cầu các nhóm (giữ nguyên nhóm cũ)
  thảo luận để đưa ra quyết định đầu tư và giải thích bằng ngôn ngữ Toán
  học. Khuyến khích nhóm sử dụng sơ đồ tư duy để trình bày kết quả.
- #strong[Bước 2: Thực hiện nhiệm vụ (15 phút):] Học sinh thảo luận
  nhóm.
  - #emph[Tích hợp phương pháp dạy học tích cực:] Tăng cường #strong[kĩ
    năng giao tiếp, phân tích, tổng hợp thông tin] qua việc xây dựng sơ
    đồ tư duy. Giáo viên hỗ trợ các nhóm kết nối $S$ với khái niệm rủi
    ro trong thực tiễn.
  - #emph[Dự kiến khó khăn:] Học sinh có thể gặp khó khăn trong việc
    liên hệ Toán học với thực tiễn tài chính.
  - #emph[Biện pháp hỗ trợ:] Giáo viên giải thích: Độ lệch chuẩn càng
    lớn, lợi nhuận thực tế càng dễ bị lệch xa so với lợi nhuận trung
    bình, tức là sự biến động (rủi ro) càng lớn.
- #strong[Bước 3: Báo cáo, thảo luận (7 phút):] Mời 2 nhóm đại diện (có
  thể sử dụng sơ đồ tư duy bằng giấy hoặc công cụ số) trình bày kết quả
  và quan điểm của nhóm.
- #strong[Bước 4: Kết luận, nhận định (3 phút):] Giáo viên tổng hợp,
  chuẩn hóa kiến thức: #strong[Độ lệch chuẩn là thước đo độ rủi ro/độ ổn
  định.] $S$ #strong[lớn] $arrow.l.r.double$ #strong[rủi ro cao]
  $arrow.l.r.double$ #strong[độ ổn định thấp.]

#hd("3", "Luyện tập", "15 phút")
==== a) Mục tiêu
- Củng cố khả năng tính toán Phương sai và Độ lệch chuẩn.
- Rèn luyện kĩ năng giải bài tập trắc nghiệm và tự luận cơ bản.

==== b) Nội dung
- #strong[Nhiệm vụ:] Cá nhân thực hiện các bài tập sau:
  - #strong[Bài tập 1 (Trắc nghiệm):] Chọn đáp án đúng cho một bài tập
    tính nhanh Phương sai/Độ lệch chuẩn với mẫu số liệu đã cho.
  - #strong[Bài tập 2 (Tự luận):] Bài tập yêu cầu so sánh độ ổn định
    (dùng $S$) của hai mẫu số liệu ghép nhóm cụ thể (đã có kết quả tính
    sẵn $macron(x)$).

==== c) Sản phẩm
- Đáp án, lời giải chính xác cho Bài tập 1 và Bài tập 2.
- Trình bày lí do lựa chọn cho Bài tập 2 (dựa trên việc so sánh hai giá
  trị $S$).

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (1 phút):] Giáo viên phát/chiếu Phiếu
  học tập (hoặc sử dụng công cụ E-learning) gồm 2 bài tập. Yêu cầu học
  sinh làm cá nhân.
- #strong[Bước 2: Thực hiện nhiệm vụ (10 phút):] Học sinh làm bài tập.
  Giáo viên quan sát, hỗ trợ những học sinh gặp khó khăn trong thao tác
  máy tính.
- #strong[Bước 3: Kiểm tra, đánh giá kết quả (4 phút):] Mời 1-2 học sinh
  trình bày nhanh lời giải Bài tập 2. Giáo viên chiếu đáp án và chữa
  chung cho cả lớp. #strong[\(Kiểm tra đánh giá thường xuyên bằng hình
  thức hỏi-đáp, chữa bài)]

#hd("4", "Vận dụng", "5 phút - Giao nhiệm vụ về nhà")
==== a) Mục tiêu
- Phát triển năng lực vận dụng kiến thức, kĩ năng vào thực tiễn cuộc
  sống.

==== b) Nội dung
- #strong[Nhiệm vụ:]
  - #strong[Thống kê và Tính toán:] Yêu cầu học sinh tự thu thập số liệu
    ghép nhóm về một chủ đề quen thuộc (ví dụ: nhiệt độ trung bình hàng
    tháng của một địa phương trong 2 năm liên tiếp; giá xăng/dầu hàng
    tuần trong 2 tháng).
  - #strong[Phân tích:] Tính Số trung bình và Độ lệch chuẩn cho mỗi mẫu
    dữ liệu.
  - #strong[Báo cáo:] So sánh và rút ra nhận xét về mức độ biến động/ổn
    định của dữ liệu giữa hai mẫu.

==== c) Sản phẩm
- Báo cáo thu thập số liệu, tính toán và nhận xét (dưới dạng văn bản, sơ
  đồ, hoặc trình bày bằng phần mềm bảng tính).

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (3 phút):] Giáo viên giải thích rõ yêu
  cầu của hoạt động Vận dụng, nhấn mạnh việc thực hiện ngoài giờ học.
  Khuyến khích sử dụng các #strong[công cụ số] để thu thập và trình bày
  báo cáo.
  - #emph[Tích hợp Năng lực số:] #strong[Biểu hiện Năng lực số:]
    #strong[Sử dụng công cụ, phương tiện kỹ thuật số] để thu thập dữ
    liệu (ví dụ: Google Search, trang web thống kê) và trình bày kết quả
    (ví dụ: Word, Google Slides).
- #strong[Bước 2: Hướng dẫn (2 phút):] Hướng dẫn học sinh nộp báo cáo
  qua email, Google Classroom hoặc nộp bản in vào buổi học sau để trao
  đổi, chia sẻ và đánh giá.

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

