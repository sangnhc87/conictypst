// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 12 Số gần đúng và sai số",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[số gần đúng] và ý nghĩa của nó.
- Nêu được khái niệm #strong[sai số tuyệt đối] và #strong[sai số tương
  đối].
- Nêu được ý nghĩa của #strong[độ chính xác] $d$.
- Nắm được quy tắc làm tròn số gần đúng.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm hiểu, đọc sách giáo khoa,
    hoàn thành nhiệm vụ học tập được giao.
  - #strong[Giao tiếp và hợp tác:] Thảo luận nhóm để thực hiện nhiệm vụ,
    trình bày ý tưởng, lập luận và bảo vệ quan điểm của mình.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống thực
    tiễn có sử dụng số gần đúng và đề xuất cách giải quyết.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận Toán học:] Nhận biết các khái
    niệm thông qua ví dụ thực tiễn, phân tích mối quan hệ giữa các loại
    sai số.
  - #strong[Năng lực mô hình hóa Toán học:] Vận dụng kiến thức về sai số
    để mô tả và đánh giá độ chính xác của các kết quả đo đạc, tính toán
    trong thực tiễn.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.2.NC1a- Chia sẻ dữ liệu, thông tin và nội dung số thông qua nhiều
    công cụ số phù hợp,
  - 2.2.NC1b-Hướng dẫn người khác cách đóng vai trò trung gian để chia
    sẻ thông tin và nội dung thông qua công nghệ số.
  - 2.4.NC1a-Đề xuất được các công cụ và công nghệ số khác nhau cho các
    quá trình hợp tác.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  đầy đủ các bài tập được giao.
- #strong[Trung thực:] Nghiêm túc, trung thực trong việc báo cáo kết quả
  đo đạc, tính toán và các sản phẩm thảo luận nhóm.
- #strong[Trách nhiệm:] Có ý thức cẩn thận, chính xác khi thực hiện tính
  toán và làm tròn số.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, phiếu học tập, thước
  đo (dùng cho hoạt động mở đầu), máy tính cầm tay (casio).
- #strong[Học liệu:] Sách giáo khoa Toán 10 (Kết nối tri thức), các
  phiếu bài tập/bài toán thực tế, Phiếu báo cáo kết quả hoạt động nhóm,
  đường link bài tập trực tuyến (Quiziz, Kahoot hoặc Google Form).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "10 phút")
Tên thể hiện kết quả hoạt động: #strong[Đo đạc thực tế và nhu cầu sử
dụng Số gần đúng]

#mt-hd[
  thể cần giải quyết trong bài học. Nhận ra trong thực tế, các kết quả
  đo đạc luôn là số gần đúng và có sai số.
]
#nd-hd[
  đo chiều dài một vật thể ngẫu nhiên trong lớp học (ví dụ: chiều dài
  bàn học, chiều cao cửa sổ). Sau đó, các nhóm #strong[báo cáo kết quả]
  và #strong[thảo luận] về sự khác biệt giữa các kết quả đo đạc.
]
#sp-hd[
  được vấn đề cần giải quyết: Mọi phép đo đều có sự sai lệch (sai số),
  cần có công cụ Toán học để đánh giá độ chính xác.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ đo đạc và yêu cầu
    ghi lại kết quả đo thực tế.
  - #strong[Thực hiện nhiệm vụ:] HS thực hiện đo đạc, thảo luận nhóm về
    nguyên nhân khác biệt. #emph[Dự kiến khó khăn:] HS đo vội vàng.
    #emph[Biện pháp hỗ trợ:] GV nhắc nhở cẩn thận, quan sát các thao
    tác.
  - #strong[Báo cáo, thảo luận:] GV mời 2-3 nhóm báo cáo kết quả và đặt
    câu hỏi gợi mở: Tại sao có sự khác biệt? $arrow.r$ Đây chính là
    #strong[sai số].
  - #strong[Kết luận, nhận định:] GV chốt: Mọi phép đo đều là #strong[số
    gần đúng] và luôn có #strong[sai số] $arrow.r$ Dẫn vào bài học.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
Tên thể hiện kết quả hoạt động: #strong[Phân loại và tính toán các loại
Sai số]

==== 2.1. Hoạt động thành phần 2.1: Số gần đúng (15 phút)
#mt-hd[
  chiếm lĩnh khái niệm #strong[Số gần đúng].
]
#nd-hd[
  để trả lời câu hỏi: #strong[Số gần đúng là gì?] Cho 3 ví dụ về số gần
  đúng trong khoa học (số $pi$, $sqrt(2)$) và trong thực tiễn (kết quả
  đo đạc, thống kê).
]
#sp-hd[
  họa (HS trình bày ra giấy/vở).
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] GV yêu cầu HS đọc SGK và tìm ví dụ.
  - #strong[Thực hiện nhiệm vụ:] HS đọc, ghi chép và thảo luận nhóm.
  - #strong[Báo cáo, thảo luận:] GV mời đại diện nhóm trình bày.
  - #strong[Kết luận, nhận định:] GV chuẩn hóa kiến thức về khái niệm Số
    gần đúng và vai trò của nó.

==== 2.2. Hoạt động thành phần 2.2: Sai số tuyệt đối và sai số tương đối (25 phút)
]
#mt-hd[
  đối, Độ chính xác] và #strong[Sai số tương đối].
// ]
#nd-hd[
  - #strong[Nhiệm vụ 1:] HS đọc SGK, tóm tắt công thức và định nghĩa:
    #strong[Sai số tuyệt đối] $\(Delta a\)$, #strong[Độ chính xác]
    $\(d\)$ và cách viết gọn kết quả $\(a plus.minus d\)$.
  - #strong[Nhiệm vụ 2 (Ví dụ minh họa):] Một học sinh đo chiều dài $L$
    của một chiếc bàn và được kết quả $L = 150 upright(" cm")$ với độ
    chính xác là $0.5 upright(" cm")$. Yêu cầu:
    - Viết kết quả đo được dưới dạng chuẩn.
    - Nếu giá trị đúng là $L_0 = 149.8 upright(" cm")$, dùng #strong[máy
      tính cầm tay] để tính #strong[Sai số tuyệt đối] $\(Delta a\)$ và
      #strong[Sai số tương đối] $\(delta a\)$.
  - #strong[Câu hỏi mở rộng:] Sai số tương đối có ý nghĩa gì trong việc
    đánh giá độ chính xác?
]
#sp-hd[
  - Công thức, định nghĩa.
  - Lời giải cho ví dụ: Dạng chuẩn
    $L = 150 plus.minus 0.5 upright(" cm")$.
    $Delta a =\|150 - 149.8\|= 0.2 upright(" cm")$.
    $delta a = 0.2 / 150 approx 0.00133 approx 0.13 %$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ (sử dụng PHT) và ví
    dụ tính toán.
  - #strong[Thực hiện nhiệm vụ (Tích hợp NL Số):] HS thực hiện tính toán
    Sai số tuyệt đối và tương đối bằng #strong[máy tính cầm tay] hoặc
    #strong[phần mềm bảng tính] (Biểu hiện: Khai thác và xử lí dữ liệu).
    #emph[Dự kiến khó khăn:] HS nhầm lẫn giữa $a$ và $a_0$. #emph[Biện
    pháp hỗ trợ:] GV gợi ý công thức và vai trò của $a_0$ (số đúng/chính
    xác).
  - #strong[Báo cáo, thảo luận:] Mời đại diện nhóm báo cáo kết quả tính
    toán và giải thích ý nghĩa.
  - #strong[Kết luận, nhận định:] GV chốt lại công thức và ý nghĩa, nhấn
    mạnh vai trò của $delta a$ trong đánh giá độ chính xác.

==== 2.3. Hoạt động thành phần 2.3: Quy tròn số gần đúng (20 phút)
]
#mt-hd[
  số gần đúng] (khi có độ chính xác $d$ và quy tắc chung).
// ]
#nd-hd[
  - #strong[Nhiệm vụ 1:] Đọc SGK, tóm tắt #strong[Quy tắc làm tròn số].
  - #strong[Nhiệm vụ 2 (Ví dụ minh họa):] HS giải quyết 2 bài toán:
    - #strong[Bài toán A:] Làm tròn số $pi approx 3.14159265 . . .$ đến
      hàng phần trăm.
    - #strong[Bài toán B:] Làm tròn kết quả đo đạc
      $m = 12.3456 upright(" kg")$ biết độ chính xác
      $d = 0.01 upright(" kg")$. (Yêu cầu làm tròn đến hàng lớn hơn $d$
      một bậc).
]
#sp-hd[
  - Quy tắc làm tròn số.
  - Đáp án: Bài toán A: $pi approx 3.14$. Bài toán B: Độ chính xác $d$
    đến hàng phần trăm, vậy làm tròn đến hàng chục.
    $m approx 12.3 upright(" kg")$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ.
  - #strong[Thực hiện nhiệm vụ:] HS làm việc cá nhân, sau đó kiểm tra
    chéo trong nhóm.
  - #strong[Báo cáo, thảo luận:] GV mời HS trình bày cách làm tròn và
    giải thích căn cứ.
  - #strong[Kết luận, nhận định:] GV chuẩn hóa Quy tắc làm tròn số, nhấn
    mạnh sự khác biệt khi làm tròn có căn cứ $d$ và làm tròn theo yêu
    cầu thông thường.

]
#hd("3", "Luyện tập", "10 phút")
#mt-hd[
  các kĩ năng vận dụng kiến thức thông qua hệ thống bài tập.
]
#nd-hd[
  tập trắc nghiệm ngắn trên Kahoot/Quiziz).
  - #strong[Bài 1:] Tính chu vi hình tròn $C = 2 pi R$ với
    $R = 12 upright(" cm")$ và $pi approx 3.14159$. Tính $Delta C$ nếu
    giá trị đúng của $pi$ được lấy từ máy tính.
  - #strong[Bài 2:] Làm tròn số $sqrt(10) approx 3.16227766 . . .$ đến
    hàng phần nghìn.
  - #strong[Bài 3:] Kết quả đo đạc chiều dài $A$ là
    $15.34 upright(" cm")$ với sai số tuyệt đối không quá
    $0.05 upright(" cm")$. Viết kết quả này dưới dạng chuẩn
    $\(A plus.minus d\)$ và làm tròn $A$ theo độ chính xác $d$.
]
#sp-hd[
  (trên phiếu hoặc hệ thống online).
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập (Tích hợp NL Số):] GV chiếu bài tập.
    Nếu sử dụng công cụ số (Kahoot/Quiziz), GV yêu cầu HS truy cập và
    thực hiện.
  - #strong[Thực hiện nhiệm vụ:] HS giải nhanh, làm việc cá nhân hoặc
    nhóm nhỏ.
  - #strong[Báo cáo, thảo luận:] GV cho học sinh báo cáo nhanh kết quả.
    Nếu dùng online, hệ thống tự động báo cáo.
  - #strong[Kết luận, nhận định:] GV phân tích lỗi sai thường gặp và
    củng cố kiến thức trọng tâm.

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
  vụ/yêu cầu vận dụng kiến thức, kĩ năng vào thực tiễn (theo từng bài
  hoặc nhóm bài có nội dung phù hợp).
]
#nd-hd[
  các vấn đề/tình huống trong thực tiễn (trên báo chí, Internet,...) có
  sử dụng #strong[số gần đúng] (ví dụ: số liệu dân số, GDP, kết quả
  nghiên cứu khoa học,...) và vận dụng kiến thức mới học để phân tích.
  - #strong[Yêu cầu:] Ghi rõ nguồn. Phân tích xem con số gần đúng đó
    được làm tròn đến hàng nào và ước lượng/giải thích về độ chính xác
    (sai số) của nó.
]
#sp-hd[
  ngắn (PPT), nêu rõ yêu cầu về nội dung và hình thức báo cáo phát hiện
  và giải quyết tình huống/vấn đề trong thực tiễn.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập (Tích hợp NL Số):] GV giao nhiệm vụ và
    yêu cầu HS #strong[tìm kiếm thông tin trên Internet] (Biểu hiện: Tìm
    kiếm thông tin).
  - #strong[Thực hiện nhiệm vụ:] HS thực hiện ngoài giờ học trên lớp.
  - #strong[Báo cáo, thảo luận (Tích hợp NL Số):] Yêu cầu nộp báo cáo
    qua email/Drive/Zalo nhóm lớp (Biểu hiện: Giao tiếp và hợp tác trong
    môi trường số) để trao đổi, chia sẻ và đánh giá vào buổi học kế
    tiếp.

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
