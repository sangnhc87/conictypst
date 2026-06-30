// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 2 Tập hợp",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[tập hợp], #strong[tập hợp con], #strong[hai
  tập hợp bằng nhau], và biết cách xác định, biểu diễn tập hợp.
- Trình bày được các #strong[tập hợp số] đã học $bb(\(N\,Z\,Q\,R\))$ và
  mối quan hệ giữa chúng.
- Biểu diễn được các #strong[tập con thường dùng của tập số thực]
  (khoảng, đoạn, nửa khoảng).
- Thực hiện được các phép toán #strong[giao], #strong[hợp],
  #strong[hiệu] của hai tập hợp và biết cách sử dụng #strong[biểu đồ
  Venn] để minh họa.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động, tích cực tìm hiểu, nghiên cứu
    nội dung bài học qua sách giáo khoa và học liệu.
  - #strong[Giao tiếp và hợp tác:] Tích cực tham gia thảo luận nhóm,
    trình bày, bảo vệ ý kiến cá nhân và nhóm; cùng nhau hoàn thành nhiệm
    vụ học tập.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp thông
    tin, đề xuất được phương án giải quyết các bài toán về tập hợp.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Thực hiện các thao
    tác tư duy như trừu tượng hóa, khái quát hóa, chuyên biệt hóa khi
    hình thành khái niệm tập hợp, tập hợp con, phép toán.
  - #strong[Năng lực mô hình hóa toán học:] Sử dụng #strong[biểu đồ
    Venn] để mô hình hóa các tập hợp và phép toán trên tập hợp.
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng linh hoạt các
    khái niệm, phép toán để giải quyết các bài tập và tình huống thực
    tiễn có liên quan.
  - #strong[Năng lực sử dụng công cụ, phương tiện toán học:] Biết sử
    dụng máy tính cầm tay, phần mềm (như GeoGebra, MS PowerPoint) để
    biểu diễn/minh họa tập hợp số, vẽ Biểu đồ Venn

- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - #emph[Sử dụng các công cụ tính toán kỹ thuật số và các phần mềm] như
    GeoGebra, MS PowerPoint) để biểu diễn/minh họa tập hợp số, vẽ Biểu
    đồ Venn

  - Sử dụng các công cụ kỹ thuật số để trình bày và truyền đạt kết quả

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành các nhiệm vụ học tập được giao một cách
  đầy đủ và nghiêm túc.
- #strong[Trách nhiệm:] Có trách nhiệm với kết quả học tập của bản thân
  và nhóm.
- #strong[Trung thực:] Thẳng thắn, trung thực khi làm việc nhóm và báo
  cáo kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:]
  - Máy chiếu, máy tính, tài liệu tham khảo, Phiếu học tập (in giấy hoặc
    trực tuyến).
  - Phần mềm trình chiếu (MS PowerPoint, Google Slides) có sẵn các hình
    ảnh minh họa về biểu đồ Venn, tập hợp số.
  - Các công cụ hỗ trợ #strong[Năng lực số] như Google
    Form/Quizizz/Kahoot (để kiểm tra đánh giá nhanh) hoặc GeoGebra (để
    minh họa trực quan).
- #strong[Học sinh:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Vở ghi, dụng cụ học tập, máy tính cầm tay.
  - Điện thoại thông minh/Máy tính bảng (có kết nối Internet, dùng trong
    hoạt động có tích hợp năng lực số).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
#mt-hd[
  xác định được nhiệm vụ học tập của bài học.
]
#nd-hd[
  - Giáo viên (GV) đưa ra một tình huống thực tiễn/câu hỏi gợi mở liên
    quan đến việc phân loại, nhóm đối tượng.
  - #strong[Ví dụ:] Trường ta có một đội tuyển học sinh giỏi (HSG) Toán
    (gồm 15 em) và một đội tuyển HSG Lý (gồm 12 em). Trong đó có 5 em
    vừa trong đội Toán, vừa trong đội Lý. Đặt vấn đề: #emph[Làm thế nào
    để phân loại và biểu diễn một cách khoa học các đối tượng này?]
]
#sp-hd[
  nhóm các đối tượng và nhận diện được vấn đề cần giải quyết là nghiên
  cứu công cụ toán học để giải quyết vấn đề đó (khái niệm Tập hợp và các
  phép toán).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (3 phút):] GV trình chiếu tình huống,
    yêu cầu HS suy nghĩ cá nhân trong 2 phút.
  - #strong[Bước 2: Thực hiện nhiệm vụ (5 phút):] HS suy nghĩ, trả lời
    nhanh (bằng miệng hoặc viết ra giấy nháp). GV theo dõi, gợi ý:
    #emph[Cần dùng khái niệm gì để gọi tên nhóm HSG Toán, HSG Lý?]
  - #strong[Bước 3: Báo cáo, thảo luận (5 phút):] GV gọi 1-2 HS trình
    bày ý kiến. GV nhận xét chung, dẫn dắt: #emph[Để giải quyết triệt để
    các vấn đề này, chúng ta sẽ cùng nghiên cứu về #strong[Tập hợp và
    các phép toán trên tập hợp].]
  - #strong[Bước 4: Kết luận, nhận định (2 phút):] GV chốt lại mục tiêu
    bài học.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "110 phút")
#strong[Hoạt động thành phần 2.1: Các khái niệm cơ bản về tập hợp (30
phút)]

#mt-hd[
  #strong[Tập hợp con], #strong[Hai tập hợp bằng nhau] và biết cách biểu
  diễn tập hợp.
]
#nd-hd[
  - #strong[Nhiệm vụ:] HS làm việc nhóm (3-4 HS) với Sách giáo khoa
    (SGK) và Phiếu học tập số 1 để hoàn thành các yêu cầu:
    - Nêu định nghĩa và các cách xác định một tập hợp.
    - Nêu định nghĩa và kí hiệu của tập hợp con.
    - Nêu điều kiện để hai tập hợp bằng nhau.
  - #strong[Ví dụ:] Cho
    $A = { x bb(in N divides) x upright(" là ước của ") 6 }$,
    $B = { 1\;2\;3\;6 }$, $C = { 1\;2\;4 }$.
    - Viết tập hợp $A$ dưới dạng liệt kê phần tử.
    - So sánh $A$ và $B$.
    - Xét mối quan hệ giữa $A$ và $C$.
]
#sp-hd[
  kí hiệu và lời giải các ví dụ.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (3 phút):] GV chia nhóm, phát/gửi
    Phiếu học tập (có thể dùng Google Docs chung cho nhóm) và yêu cầu
    nhóm nghiên cứu SGK, thảo luận để hoàn thành.
  - #strong[Bước 2: Thực hiện nhiệm vụ (17 phút):] HS thảo luận, ghi
    chép. GV theo dõi, hỗ trợ, đặc biệt là cách viết và kí hiệu toán
    học.
  - #strong[Bước 3: Báo cáo, thảo luận (7 phút):] GV gọi ngẫu nhiên một
    nhóm báo cáo. Các nhóm khác nhận xét, bổ sung.
  - #strong[Bước 4: Kết luận, nhận định (3 phút):] GV chuẩn hóa kiến
    thức.

#strong[Hoạt động thành phần 2.2: Các tập hợp số và tập con thường dùng
của] $bb(R)$ #strong[\(35 phút)]

]
#mt-hd[
  $bb(\(N\,Z\,Q\,R\))$ và biết cách biểu diễn các #strong[tập con thường
  dùng của tập số thực] trên trục số.
]
#nd-hd[
  - #strong[Nhiệm vụ 1: Mối quan hệ giữa các tập hợp số:] HS sử dụng
    Biểu đồ Venn trong SGK (hoặc tự vẽ trên phần mềm vẽ sơ đồ tư duy -
    tích hợp #strong[Năng lực số]: #emph[Sử dụng các công cụ kỹ thuật số
    để biểu diễn thông tin]) để thể hiện mối quan hệ
    $bb(N subset Z subset Q subset R)$.
  - #strong[Nhiệm vụ 2: Các tập con thường dùng của] $bb(R)$#strong[:]
    - HS đọc SGK để phân loại các dạng (đoạn, khoảng, nửa khoảng) và
      cách viết kí hiệu.
    - #strong[Ví dụ:] Biểu diễn các tập hợp sau trên trục số:
      $A =\[- 3\;5\)$, $B =\(1\;+ oo\)$, $C =\(- oo\;2\]$.
]
#sp-hd[
  hình ảnh chụp từ vở hoặc file mềm), lời giải và biểu diễn các tập hợp
  $A\,B\,C$ trên trục số.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV đặt câu hỏi về các tập
    số đã học, giao nhiệm vụ vẽ sơ đồ và biểu diễn trên trục số.
  - #strong[Bước 2: Thực hiện nhiệm vụ (20 phút):] HS thực hiện, có thể
    dùng GeoGebra hoặc phần mềm tương tự để kiểm tra trực quan về trục
    số (tích hợp #strong[Năng lực số]: #emph[Sử dụng các công cụ tính
    toán kỹ thuật số và các phần mềm mô phỏng toán học]). GV theo dõi,
    hướng dẫn cách thể hiện dấu ngoặc và gạch bỏ phần không thuộc.
  - #strong[Bước 3: Báo cáo, thảo luận (7 phút):] Một nhóm trình bày sơ
    đồ Venn, một nhóm khác lên bảng vẽ trục số.
  - #strong[Bước 4: Kết luận, nhận định (3 phút):] GV chuẩn hóa kiến
    thức, nhấn mạnh quy tắc biểu diễn trên trục số.

#strong[Hoạt động thành phần 2.3: Các phép toán trên tập hợp (45 phút)]

]
#mt-hd[
  #strong[giao], #strong[hợp], #strong[hiệu] của hai tập hợp; biết sử
  dụng biểu đồ Venn để minh họa.
]
#nd-hd[
  - #strong[Nhiệm vụ:] HS làm việc nhóm để nghiên cứu SGK, đưa ra định
    nghĩa, kí hiệu, và minh họa bằng biểu đồ Venn cho: #strong[Giao của
    hai tập hợp], #strong[Hợp của hai tập hợp], #strong[Hiệu của hai tập
    hợp].
  - #strong[Ví dụ:] Cho $A = { 0\;1\;2\;3\;4 }$, $B = { 1\;3\;5\;7 }$.
    - Xác định $A inter B$, $A union B$, $A without B$.
    - Vẽ biểu đồ Venn minh họa các phép toán trên.
]
#sp-hd[
  Biểu đồ Venn) và lời giải ví dụ.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV chia nhóm, yêu cầu tự
    nghiên cứu và giải quyết ví dụ. Khuyến khích HS sử dụng công cụ kỹ
    thuật số để vẽ Biểu đồ Venn rõ ràng (tích hợp #strong[Năng lực số]:
    #emph[Sử dụng các công cụ kỹ thuật số để trình bày và truyền đạt kết
    quả]).
  - #strong[Bước 2: Thực hiện nhiệm vụ (25 phút):] HS nghiên cứu SGK,
    thảo luận, tính toán và vẽ Biểu đồ Venn.
  - #strong[Bước 3: Báo cáo, thảo luận (10 phút):] GV tổ chức
    #strong[Trò chơi học tập] (ví dụ: \"Tiếp sức\" - mỗi nhóm chỉ cần
    giải một phép toán và nhóm tiếp theo sẽ giải phép toán còn lại và
    trình bày Biểu đồ Venn tương ứng). GV nhận xét, đánh giá.
  - #strong[Bước 4: Kết luận, nhận định (5 phút):] GV chốt lại định
    nghĩa và cách thực hiện các phép toán.

]
#hd("3", "Luyện tập", "40 phút")
#mt-hd[
  hợp số và các phép toán để giải quyết các bài tập đa dạng.
]
#nd-hd[
  - #strong[Bài tập 1 (Nhận biết/Thông hiểu):] Cho
    $A = { x bb(in R divides -) 2 lt.eq x < 4 }$, $B =\(- 1\;5\]$. Biểu
    diễn $A$ và $B$ trên trục số.
  - #strong[Bài tập 2 (Vận dụng):] Xác định các tập hợp $A inter B$,
    $A union B$, $A without B$, $B without A$.
  - #strong[Bài tập 3 (Vận dụng cao):] Cho $A =\(m\;m + 2\]$,
    $B =\(- 1\;3\)$. Tìm $m$ để $A subset B$.
]
#sp-hd[
  diễn chính xác trên trục số.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV chia lớp thành 4 nhóm,
    giao mỗi nhóm giải quyết 1-2 bài tập và chuẩn bị trình bày.
  - #strong[Bước 2: Thực hiện nhiệm vụ (20 phút):] HS làm việc nhóm. GV
    quan sát, tập trung hỗ trợ nhóm gặp khó khăn với Bài tập 3.
  - #strong[Bước 3: Báo cáo, thảo luận (10 phút):] Tổ chức cho các nhóm
    #strong[thuyết trình] lời giải (có thể dùng máy chiếu hoặc bảng
    phụ), đặc biệt là trình bày cách lập luận cho Bài tập 3. Các nhóm
    khác đặt câu hỏi và phản biện.
  - #strong[Bước 4: Kết luận, nhận định (5 phút):] GV chuẩn hóa lời
    giải, nhấn mạnh phương pháp giải các bài toán về tìm tham số $m$ dựa
    trên trục số.

]
#hd("4", "Vận dụng", "15 phút")
#mt-hd[
  vận dụng kiến thức, kĩ năng về tập hợp vào giải quyết vấn đề thực
  tiễn.
]
#nd-hd[
  đề/tình huống trong thực tiễn gắn với nội dung bài học và vận dụng
  kiến thức mới học để giải quyết.
  - #strong[Ví dụ:] Một cơ quan có 100 nhân viên. Có 40 người biết tiếng
    Anh, 35 người biết tiếng Pháp, trong đó có 15 người biết cả hai thứ
    tiếng. Hỏi cơ quan đó có bao nhiêu người không biết cả tiếng Anh lẫn
    tiếng Pháp? (Sử dụng biểu đồ Venn để mô hình hóa).
]
#sp-hd[
  biểu đồ Venn mô hình hóa tình huống.
]
#tc-hd[
  - #strong[Giao nhiệm vụ (3 phút):] GV giao nhiệm vụ này như một bài
    tập về nhà, yêu cầu HS giải quyết tình huống thực tế và nộp báo cáo.
    Khuyến khích HS sử dụng ứng dụng vẽ sơ đồ để tạo Biểu đồ Venn rõ
    ràng, sinh động (tích hợp #strong[Năng lực số]: #emph[Sử dụng các
    công cụ kỹ thuật số để trình bày và truyền đạt kết quả]).
  - #strong[Thực hiện và Báo cáo (Ngoài giờ học):] HS tự thực hiện ngoài
    giờ học trên lớp. GV thu và đánh giá vào buổi học tiếp theo.

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
