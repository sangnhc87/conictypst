// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "HĐTHTN 3 Độ dài găng tay",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Nhận biết:] Nêu được khái niệm về #strong[mẫu số liệu] và
  #strong[kích thước mẫu] trong bối cảnh thực tiễn cụ thể là đo độ dài
  gang tay của các bạn trong lớp.
- #strong[Thực hiện:] Biết cách thu thập mẫu số liệu bằng cách đo độ dài
  gang tay một cách chính xác.
- #strong[Trình bày:] Mô tả được các đại lượng đặc trưng của mẫu số liệu
  (số trung bình, trung vị, mốt, phương sai, độ lệch chuẩn) của mẫu số
  liệu về độ dài gang tay.

#muc("2", "NĂNG LỰC")
==== a) Năng lực chung
- #strong[Năng lực tự chủ và tự học:] Chủ động thực hiện nhiệm vụ đo đạc
  và tìm hiểu các bước phân tích dữ liệu; biết điều chỉnh hoạt động cá
  nhân/nhóm khi cần thiết.
- #strong[Năng lực giao tiếp và hợp tác:] Hợp tác hiệu quả trong nhóm để
  thực hiện nhiệm vụ đo đạc, tổng hợp và phân tích dữ liệu; trình bày và
  thảo luận kết quả rõ ràng, mạch lạc.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, so sánh,
  đối chiếu kết quả đo và kết quả tính toán; đề xuất cách thức trình bày
  thông tin tối ưu (sơ đồ tư duy, biểu đồ).

==== b) Năng lực đặc thù (Năng lực Toán học)
- #strong[Năng lực tư duy và lập luận toán học:] Phân tích, xử lí và lập
  luận các đại lượng thống kê từ mẫu số liệu thực tế.
- #strong[Năng lực mô hình hóa toán học:] Xây dựng mô hình thống kê (các
  đại lượng đặc trưng) từ dữ liệu thực tiễn (độ dài gang tay).
- #strong[Năng lực công cụ và phương tiện toán học:] Sử dụng thước đo,
  máy tính cầm tay, và #strong[phần mềm bảng tính] (thể hiện
  #strong[Năng lực số]) để tính toán và xử lí dữ liệu thống kê.

==== c) Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT)
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.
- 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
  dạng khác nhau,
- 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc tạo
  ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành nhiệm vụ được giao một cách cẩn thận và
  kiên trì, đặc biệt trong quá trình đo đạc và nhập liệu.
- #strong[Trách nhiệm:] Có trách nhiệm với kết quả đo đạc của bản thân
  và kết quả phân tích chung của nhóm; giữ gìn vệ sinh và an toàn khi sử
  dụng dụng cụ đo.
- #strong[Trung thực:] Ghi chép kết quả đo đạc chính xác, không làm sai
  lệch số liệu.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính xách tay/điện
  thoại thông minh (cá nhân học sinh), thước dây/thước kẻ (ít nhất 01
  cái/nhóm).
- #strong[Học liệu:]
  - Phiếu thu thập dữ liệu (dạng giấy hoặc file điện tử).
  - Sách giáo khoa Toán 12 (Bài thực hành trải nghiệm).
  - Tài liệu hướng dẫn cơ bản về các đại lượng thống kê (nếu cần).
  - #strong[Phần mềm bảng tính (Google Sheets hoặc Microsoft Excel)]
    trên máy tính hoặc điện thoại (Học liệu số).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#strong[a) Mục tiêu:] Tạo hứng thú, huy động kiến thức nền về thống kê
và đo lường, xác định rõ nhiệm vụ học tập là #strong[thu thập và phân
tích mẫu số liệu về độ dài gang tay.]

#strong[b) Nội dung:]

- Giáo viên (GV) đưa ra một tình huống thực tiễn: \"Bạn A đang tìm mua
  găng tay trên mạng nhưng không có thước đo. Bạn ấy quyết định dùng
  \'gang tay\' của mình để ước lượng. Nhưng gang tay của mỗi người có
  giống nhau không?\"
- GV đặt câu hỏi gợi mở: #strong[\"Theo các em, độ dài gang tay của học
  sinh lớp 12 có khác nhau nhiều không? Chúng ta cần làm gì để biết
  \'gang tay\' trung bình của lớp là bao nhiêu?\"]
- GV giao nhiệm vụ: #strong[\"Chúng ta sẽ thực hiện việc đo, thu thập và
  phân tích mẫu số liệu về độ dài gang tay của tất cả thành viên trong
  lớp để trả lời câu hỏi trên.\"]

#strong[c) Sản phẩm:] Câu trả lời dự đoán ban đầu của học sinh (khác
nhau/tương đương); Thống nhất nhiệm vụ học tập và các bước thực hiện (đo
đạc, thu thập, tính toán, phân tích).

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1: Chuyển giao nhiệm vụ (GV):] GV trình bày tình huống,
  đặt câu hỏi gợi mở và giao nhiệm vụ.
- #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
  trợ):] HS thảo luận nhanh theo cặp/nhóm nhỏ và đưa ra dự đoán. GV lắng
  nghe, gợi ý về sự cần thiết của việc thu thập dữ liệu số.
- #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo cáo,
  thảo luận):] Mời 1-2 HS đại diện trình bày dự đoán và đề xuất cách
  thực hiện.
- #strong[Bước 4: Kết luận, nhận định (GV):] GV chốt lại mục tiêu bài
  học: Đo lường, thu thập, và phân tích các đại lượng thống kê.
  #strong[Tích hợp Năng lực số:] Nhấn mạnh việc sử dụng công cụ số (bảng
  tính) để xử lí dữ liệu lớn, giúp tiết kiệm thời gian và tăng độ chính
  xác so với tính toán thủ công

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
==== 2.1. Hoạt động thành phần 2.1: Thu thập dữ liệu (15 phút)
#strong[a) Mục tiêu:] Giúp học sinh nắm vững quy trình đo đạc, thu thập
được mẫu số liệu về độ dài gang tay của cả lớp một cách chính xác.

#strong[b) Nội dung:]

- GV hướng dẫn quy tắc đo: #strong[Độ dài gang tay] được tính từ đầu
  ngón cái đến đầu ngón út khi xòe tối đa, đơn vị #strong[centimet
  (cm)], làm tròn đến một chữ số thập phân.
- HS làm việc nhóm (4-6 người).
- Mỗi nhóm tổ chức đo lần lượt độ dài gang tay của các thành viên trong
  nhóm, ghi lại kết quả vào Phiếu thu thập dữ liệu (hoặc file bảng tính
  chung).
  - #strong[Ví dụ cụ thể:] Nhóm 1 đo được kết quả (cm): 18.5; 19.2;
    17.8; 20.1; 18.9.

#strong[c) Sản phẩm:] Một mẫu số liệu thô về độ dài gang tay (bao gồm
$N$ giá trị, với $N$ là số lượng học sinh trong lớp).

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1: Chuyển giao nhiệm vụ (GV):] GV hướng dẫn cách đo chính
  xác và yêu cầu các nhóm tự đo đạc lẫn nhau, ghi chép cẩn thận.
- #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
  trợ):] HS thực hiện đo đạc trong nhóm. #strong[Tích hợp Năng lực số:]
  Hướng dẫn HS nhập dữ liệu thô vào cột \"Độ dài gang tay (cm)\" trên
  file bảng tính chung/nhóm.
- #strong[Bước 3: Báo cáo, thảo luận:] Yêu cầu các nhóm so sánh chéo kết
  quả đo.
- #strong[Bước 4: Kết luận, nhận định (GV):] Kiểm tra ngẫu nhiên kết quả
  của một vài nhóm, nhắc nhở về tính chính xác và trung thực khi thu
  thập dữ liệu.

==== 2.2. Hoạt động thành phần 2.2: Tóm tắt và phân tích dữ liệu (45 phút)
#strong[a) Mục tiêu:] Giúp học sinh biết cách sắp xếp, tóm tắt và sử
dụng công cụ tính toán để tìm ra các đại lượng đặc trưng của mẫu số
liệu; phát triển kĩ năng phân tích và thuyết trình.

#strong[b) Nội dung:]

- #strong[Phân tích dữ liệu bằng công cụ số (Tích hợp Năng lực số):] GV
  hướng dẫn HS sử dụng #strong[các hàm thống kê cơ bản] trong phần mềm
  bảng tính (SUM, AVERAGE, MEDIAN, MODE, STDEV.S...) để tính toán nhanh
  các đại lượng đặc trưng:
  - Số trung bình $\(macron(x)\)$.
  - Trung vị $\(M_e\)$.
  - Mốt $\(M_o\)$.
  - Phương sai $(s^2)$ và độ lệch chuẩn $\(s\)$.
- #strong[Ví dụ cụ thể (sử dụng dữ liệu ví dụ):] Nếu
  $macron(x) approx 18.9$ cm và $s approx 0.8$ cm, HS cần giải thích ý
  nghĩa: \"Gang tay trung bình của lớp là khoảng 18.9 cm, và đa số các
  giá trị nằm trong khoảng $\[18.9 - 0.8\,18.9 + 0.8\]$ cm.\"
- #strong[Trực quan hóa:] Yêu cầu HS tạo #strong[biểu đồ cột]
  (Histogram) hoặc #strong[biểu đồ hộp] (Box Plot) từ dữ liệu đã tính
  toán.

#strong[c) Sản phẩm:]

- Bảng tính hoàn chỉnh với các giá trị $macron(x)$, $M_e$, $M_o$, $s^2$,
  $s$ của toàn bộ mẫu số liệu lớp.
- #strong[Sơ đồ tư duy] (Mind Map) hoặc #strong[bài thuyết trình ngắn]
  trình bày kết quả phân tích.
- Giải thích ý nghĩa của các đại lượng thống kê trong bối cảnh thực
  tiễn.

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1: Chuyển giao nhiệm vụ (GV):] GV giao nhiệm vụ tính toán
  các đại lượng và trực quan hóa kết quả bằng bảng tính/biểu đồ; tổ chức
  phân công nhiệm vụ trong nhóm (ví dụ: 1 người tính toán, 1 người tạo
  biểu đồ, 1 người chuẩn bị thuyết trình).
- #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
  trợ):] HS làm việc nhóm trên máy tính. GV quan sát, hướng dẫn cụ thể
  cách sử dụng hàm trong bảng tính. #strong[Dự kiến khó khăn:] HS chưa
  quen sử dụng hàm thống kê trong phần mềm. #strong[Biện pháp hỗ trợ:]
  GV cung cấp file mẫu với các hàm được viết sẵn hoặc chiếu ví dụ từng
  bước.
- #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo cáo,
  thảo luận):]
  - Mời 2-3 nhóm lên trình bày kết quả phân tích (số liệu, biểu đồ) và
    giải thích ý nghĩa thực tiễn. #strong[\(Tăng cường kĩ năng giao
    tiếp, thuyết trình)].
  - Các nhóm khác đặt câu hỏi phản biện, so sánh kết quả.
- #strong[Bước 4: Kết luận, nhận định (GV):] GV tổng hợp, nhận xét về
  tính chính xác của dữ liệu và phân tích. Khẳng định: Các đại lượng đặc
  trưng giúp tóm tắt và hiểu rõ về toàn bộ tập hợp dữ liệu.
  #strong[\(Làm rõ nội dung/yêu cầu về kiến thức)].

#hd("3", "Luyện tập", "15 phút")
#strong[a) Mục tiêu:] Vận dụng kiến thức đã học để xử lí nhanh một tình
huống tương tự, củng cố kĩ năng tính toán các đại lượng thống kê.

#strong[b) Nội dung:]

- GV giao bài tập nhanh: #strong[\"Một cửa hàng bán găng tay thu thập
  được mẫu dữ liệu về độ dài gang tay của 10 khách hàng nam (cm): 21.5;
  20.8; 22.0; 21.5; 21.0; 23.1; 21.5; 22.5; 20.5; 23.0. Dựa vào mẫu này,
  cửa hàng nên nhập size găng tay nào nhiều nhất (Mốt) và size trung
  bình nên là bao nhiêu] $\(macron(x)\)$#strong[?\"]

#strong[c) Sản phẩm:]

- Đáp án, lời giải nhanh của HS.
  - #strong[Mốt:] $21.5$ cm.
  - #strong[Số trung bình:] $macron(x) = 21.64$ cm.
- Phân tích ngắn về ý nghĩa của Mốt và Số trung bình đối với cửa hàng.

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1: Giao nhiệm vụ (GV):] Giao bài tập luyện tập.
- #strong[Bước 2: Thực hiện nhiệm vụ (HS):] HS làm việc cá nhân hoặc
  theo cặp. Khuyến khích HS sử dụng máy tính cầm tay/công cụ số để tính
  toán nhanh (Tích hợp Năng lực số).
- #strong[Bước 3: Kiểm tra, đánh giá (GV):] Mời 1-2 HS trình bày đáp án
  và giải thích. GV nhận xét, đánh giá kết quả.

#hd("4", "Vận dụng", "5 phút")
#strong[a) Mục tiêu:] Phát triển năng lực vận dụng kiến thức thống kê
vào giải quyết các vấn đề thực tiễn ngoài phạm vi bài học.

#strong[b) Nội dung:]

- GV giao nhiệm vụ về nhà: #strong[\"Tìm hiểu và thu thập mẫu số liệu
  thực tiễn khác (ví dụ: Chiều cao của các thành viên trong gia đình/bạn
  bè, số bước đi trung bình mỗi ngày...) và sử dụng bảng tính để tìm ra
  các đại lượng đặc trưng của mẫu số liệu đó. Hãy lập biểu đồ và rút ra
  nhận xét.\"]

#strong[c) Sản phẩm:] Báo cáo dưới dạng file bảng tính (kèm biểu đồ)
hoặc sơ đồ tư duy (tự chọn hình thức báo cáo) vào buổi học tiếp theo.

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1: Giao nhiệm vụ (GV):] Giao nhiệm vụ vận dụng và yêu cầu
  nộp báo cáo vào buổi học sau
- #strong[Bước 2: Hướng dẫn (GV):] Hướng dẫn về cách chọn chủ đề thu
  thập dữ liệu và hình thức báo cáo (sử dụng công cụ số để tạo báo cáo).
- #strong[Tích hợp Năng lực số:] Yêu cầu HS phải sử dụng phần mềm số để
  xử lí và trình bày báo cáo (Ví dụ: Dùng Google Sheets để tính toán và
  tạo biểu đồ, dùng Canva/PowerPoint để tạo báo cáo trực quan).
  #strong[Biểu hiện Năng lực số:] #strong[Tạo và xử lí thông tin số;
  Giải quyết vấn đề bằng công cụ số.]

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

