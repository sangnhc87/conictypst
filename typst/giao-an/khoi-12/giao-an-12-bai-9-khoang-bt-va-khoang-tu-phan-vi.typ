// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 9 Khoảng BT và khoảng tứ phân vị",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
+ #strong[Về kiến thức:]
  - Nêu được định nghĩa và công thức tính #strong[khoảng biến thiên]
    ($R$) của mẫu số liệu.
  - Xác định được các #strong[tứ phân vị] ($Q_1\,Q_2\,Q_3$) của mẫu số
    liệu và công thức tính #strong[khoảng tứ phân vị] ($Delta_Q$) của
    mẫu số liệu.
  - Vận dụng công thức để tính $R$ và $Delta_Q$ cho các mẫu số liệu cụ
    thể.
+ #strong[Về năng lực:]
  - #strong[Năng lực chung:]
    - #strong[Tự chủ và tự học:] Chủ động tìm hiểu, đọc sách giáo khoa
      và tài liệu trực tuyến về khái niệm và cách tính khoảng biến
      thiên, khoảng tứ phân vị.
    - #strong[Giao tiếp và hợp tác:] Tích cực thảo luận nhóm, trình bày
      ý kiến rõ ràng, mạch lạc, biết lắng nghe và phản biện.
    - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích được các bước
      giải quyết bài toán tính toán, đề xuất giải pháp kiểm tra kết quả
      bằng công cụ số (máy tính cầm tay, phần mềm).
  - #strong[Năng lực đặc thù:]
    - #strong[Năng lực tư duy và lập luận toán học:] Nêu được các bước
      tính toán, giải thích được ý nghĩa của các đại lượng thống kê.
    - #strong[Năng lực giao tiếp toán học:] Trình bày được kết quả tính
      toán và giải thích được ý nghĩa của khoảng biến thiên, khoảng tứ
      phân vị bằng ngôn ngữ Toán học.
  - #strong[Năng lực số:]
    - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
    - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp
      nhất cho một bối cảnh cụ thể.
+ #strong[Về phẩm chất:]
  - #strong[Chăm chỉ:] Tích cực tham gia các hoạt động nhóm và hoàn
    thành các nhiệm vụ học tập.
  - #strong[Trách nhiệm:] Hoàn thành nhiệm vụ được giao trong nhóm, cẩn
    thận, chính xác khi tính toán.
  - #strong[Trung thực:] Thẳng thắn trao đổi, báo cáo kết quả thực hiện
    đúng với thực tế.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối internet,
  bảng/phiếu học tập, máy tính cầm tay (casio) cho học sinh.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Tập 1, Kết nối tri thức với cuộc sống).
  - Phiếu Bài tập Nhóm (có chứa các mẫu số liệu).
  - Bài trình chiếu (Slide) có các ví dụ, hình ảnh minh họa về sự phân
    tán của dữ liệu.
  - Mẫu bảng tính (Google Sheets/Excel) có sẵn các hàm thống kê để học
    sinh thực hành kiểm tra kết quả tính bằng tay.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "5 phút")
- #strong[Tên hoạt động:] Khởi động: Đánh giá sự phân tán của dữ liệu
#mt-hd[
Tạo hứng thú, giúp học sinh thấy được sự cần
  thiết của các đại lượng thống kê để đo lường độ phân tán của mẫu số
  liệu, từ đó xác định vấn đề cần giải quyết: tìm hiểu các đại lượng đó.
]
#nd-hd[
Giáo viên đặt vấn đề.
  - #strong[Nhiệm vụ:] #strong[Nhiệm vụ 1:] Quan sát điểm thi môn Toán
    của hai lớp A và B (mỗi lớp 5 học sinh):
    - Lớp A: $5\;6\;7\;8\;9$ (Điểm trung bình $macron(x)_A = 7$)
    - Lớp B: $1\;7\;7\;7\;15$ (Điểm trung bình $macron(x)_B = 7$)
  - #strong[Câu hỏi:]
    - Điểm trung bình của hai lớp như thế nào?
    - Nhận xét về sự phân tán điểm số giữa hai lớp?
    - Để đánh giá mức độ phân tán của điểm, ngoài phương sai và độ lệch
      chuẩn, ta còn đại lượng nào khác không?
]
#sp-hd[
Câu trả lời của học sinh:
  - Điểm trung bình bằng nhau ($macron(x)_A = macron(x)_B = 7$).
  - Điểm lớp A ít phân tán hơn, lớp B phân tán rộng hơn (có điểm 1 và
    15).
  - Đề xuất: Cần có các đại lượng khác để đo lường độ phân tán.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên trình chiếu dữ liệu và câu hỏi,
    yêu cầu học sinh thảo luận cặp đôi trong 2 phút.
  - #strong[Thực hiện nhiệm vụ:] Học sinh quan sát, thảo luận. Giáo viên
    theo dõi, nhắc nhở học sinh tập trung so sánh sự khác biệt trong
    phân bố điểm.
  - #strong[Báo cáo, thảo luận:] Giáo viên mời 1-2 cặp học sinh trình
    bày kết quả, nhận xét.
  - #strong[Kết luận, nhận định:] Giáo viên chốt lại: Cần tìm hiểu thêm
    hai đại lượng là #strong[Khoảng biến thiên] và #strong[Khoảng tứ
    phân vị] để mô tả độ phân tán của mẫu số liệu.

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "30 phút")
==== 2.1. Hoạt động thành phần 2.1: Khoảng biến thiên (8 phút)
- #strong[Tên hoạt động:] Khám phá Khoảng biến thiên
#mt-hd[
Giúp học sinh nêu được định nghĩa và công thức
  tính khoảng biến thiên ($R$).
]
#nd-hd[
Học sinh làm việc với SGK và ví dụ.
  - #strong[Nhiệm vụ:] Đọc mục 1 #strong[Khoảng biến thiên] trong SGK.
  - #strong[Câu hỏi:]
    - Khoảng biến thiên của mẫu số liệu là gì?
    - Tính khoảng biến thiên $R$ của mẫu số liệu ở Lớp B:
      $1\;7\;7\;7\;15$.
]
#sp-hd[
  - Định nghĩa: Khoảng biến thiên ($R$) là hiệu số giữa giá trị lớn nhất
    ($x_max$) và giá trị nhỏ nhất ($x_min$) trong mẫu số liệu. Công
    thức: $R = x_max - x_min$.
  - $R_(upright("Lớp B")) = 15 - 1 = 14$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên yêu cầu học sinh làm việc cá nhân,
    đọc SGK và trả lời câu hỏi.
  - #strong[Thực hiện nhiệm vụ:] Học sinh đọc và tính toán.
  - #strong[Báo cáo, thảo luận:] Giáo viên mời 1 học sinh trình bày, các
    học sinh khác nhận xét.
  - #strong[Kết luận, nhận định:] Giáo viên chuẩn hóa công thức tính
    $R$, nhấn mạnh ý nghĩa của $R$ là độ trải rộng của mẫu số liệu.

==== 2.2. Hoạt động thành phần 2.2: Khoảng tứ phân vị (22 phút)
- #strong[Tên hoạt động:] Khám phá Khoảng tứ phân vị và Thực hành tính
  toán
]
#mt-hd[
Giúp học sinh xác định được các tứ phân vị
  ($Q_1\,Q_2\,Q_3$), công thức tính khoảng tứ phân vị ($Delta_Q$) và vận
  dụng vào bài tập.
]
#nd-hd[
Học sinh làm việc nhóm, kết hợp lý thuyết và
  thực hành.
  - #strong[Nhiệm vụ:]
    - #strong[Nhiệm vụ 1 (Tìm hiểu):] Đọc mục 2 #strong[Khoảng tứ phân
      vị] trong SGK, tóm tắt cách xác định các tứ phân vị
      ($Q_1\,Q_2\,Q_3$) và công thức tính khoảng tứ phân vị
      ($Delta_Q = Q_3 - Q_1$) bằng #strong[Sơ đồ tư duy] (mind map).
    - #strong[Nhiệm vụ 2 (Thực hành - Tích hợp Năng lực số):] Cho mẫu số
      liệu về thời gian hoàn thành một bài kiểm tra (tính bằng phút) của
      10 học sinh: $10\;12\;15\;18\;20\;22\;25\;25\;30\;35$.
      - Tính bằng tay: Sắp xếp dữ liệu, tìm $Q_2\,Q_1\,Q_3$ và
        $Delta_Q$.
      - #strong[Kiểm tra bằng công cụ số:] Sử dụng máy tính cầm tay
        (chức năng thống kê) hoặc phần mềm bảng tính (Google
        Sheets/Excel) để kiểm tra lại kết quả $Q_1\,Q_2\,Q_3$ và
        $Delta_Q$.
]
#sp-hd[
  - #strong[Sản phẩm 1 (Sơ đồ tư duy):] Thể hiện rõ các bước tìm $Q_2$
    (Trung vị), $Q_1$ (Trung vị nửa dưới), $Q_3$ (Trung vị nửa trên) và
    công thức $Delta_Q = Q_3 - Q_1$.
  - #strong[Sản phẩm 2 (Kết quả tính toán):]
    - Mẫu số liệu đã sắp xếp (đã sắp xếp). $n = 10$.
    - $Q_2 = frac(20 + 22, 2) = 21$.
    - Nửa dưới: $10\;12\;15\;18\;20$. $arrow.r.double Q_1 = 15$.
    - Nửa trên: $22\;25\;25\;30\;35$. $arrow.r.double Q_3 = 25$.
    - Khoảng tứ phân vị: $Delta_Q = Q_3 - Q_1 = 25 - 15 = 10$ phút.
    - Kết quả kiểm tra bằng máy tính/phần mềm khớp với tính toán bằng
      tay.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên chia lớp thành các nhóm 4-5 người.
    Giao Phiếu học tập có hai nhiệm vụ trên. Nhấn mạnh việc sử dụng công
    cụ số (máy tính/điện thoại có cài Google Sheets hoặc máy tính cầm
    tay) để kiểm tra.
  - #strong[Thực hiện nhiệm vụ:] Học sinh #strong[thảo luận nhóm] (Năng
    lực hợp tác), vẽ sơ đồ tư duy, thực hiện tính toán. Giáo viên quan
    sát, hỗ trợ các nhóm gặp khó khăn trong việc xác định tứ phân vị (ví
    dụ: số liệu chẵn/lẻ) và hướng dẫn sử dụng công cụ số để kiểm tra
    (Tích hợp Năng lực số).
  - #strong[Báo cáo, thảo luận:]
    - Mời 1 nhóm lên #strong[trình bày Sơ đồ tư duy] (dán lên bảng).
      (Tăng cường kĩ năng giao tiếp, thuyết trình, phân tích và tổng hợp
      thông tin).
    - Mời 1 nhóm khác trình bày kết quả tính toán bằng tay và kết quả
      kiểm tra bằng công cụ số.
  - #strong[Kết luận, nhận định:] Giáo viên nhận xét, đánh giá sản phẩm
    của nhóm, chuẩn hóa kiến thức về các bước tìm tứ phân vị và ý nghĩa
    của $Delta_Q$ (đo lường độ phân tán của 50% dữ liệu ở giữa).

]
#hd("3", "Luyện tập", "5 phút")
- #strong[Tên hoạt động:] Củng cố kiến thức
#mt-hd[
Vận dụng kiến thức đã học để giải quyết bài tập
  nhanh, phát triển kĩ năng tính toán và sử dụng công cụ.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Cho mẫu số liệu: $1\;3\;6\;8\;10\;12$.
  - #strong[Yêu cầu:] Tính $R$ và $Delta_Q$. (Học sinh sử dụng máy tính
    cầm tay để tính toán nhanh).
]
#sp-hd[
  - $x_max = 12\,x_min = 1 arrow.r.double R = 12 - 1 = 11$.
  - $Q_2 = frac(6 + 8, 2) = 7$.
  - Nửa dưới: $1\;3\;6 arrow.r.double Q_1 = 3$.
  - Nửa trên: $8\;10\;12 arrow.r.double Q_3 = 10$.
  - $Delta_Q = Q_3 - Q_1 = 10 - 3 = 7$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên chiếu bài tập, yêu cầu học sinh
    làm việc cá nhân trong 3 phút.
  - #strong[Thực hiện nhiệm vụ:] Học sinh sử dụng máy tính cầm tay (nếu
    cần) để giải.
  - #strong[Kiểm tra, đánh giá:] Giáo viên mời 1-2 học sinh xung phong
    trình bày kết quả và cách tính.

]
#hd("4", "Vận dụng", "5 phút - Giao nhiệm vụ về nhà")
- #strong[Tên hoạt động:] Vận dụng vào thực tiễn
#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  vào thực tiễn, giúp học sinh thấy được ý nghĩa thực tế của các đại
  lượng thống kê.
]
#nd-hd[
  - #strong[Nhiệm vụ:] #strong[Nhiệm vụ Vận dụng:] Thu thập điểm thi học
    kì I môn Toán của 10 bạn trong tổ/nhóm của em.
  - #strong[Yêu cầu:] Tính khoảng biến thiên ($R$) và khoảng tứ phân vị
    ($Delta_Q$) của mẫu số liệu vừa thu thập được. Giải thích ý nghĩa
    của $R$ và $Delta_Q$ trong việc đánh giá sự đồng đều về điểm số của
    nhóm.
]
#sp-hd[
Bài báo cáo viết tay hoặc đánh máy (có thể sử
  dụng Word/Slides) về quá trình thu thập, tính toán và giải thích ý
  nghĩa.
]
#tc-hd[
  - Giáo viên giao nhiệm vụ thực hiện ngoài giờ học trên lớp.
  - Học sinh tự tổ chức thực hiện, nộp báo cáo vào tiết học sau hoặc
    thời điểm phù hợp.

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
