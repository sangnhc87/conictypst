// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 26 Biến cố và ĐN XS",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[biến cố] và phân biệt được biến cố chắc
  chắn, biến cố không thể, biến cố ngẫu nhiên.
- Nêu được công thức tính #strong[xác suất của biến cố] theo định nghĩa
  cổ điển.
- Vận dụng được công thức tính xác suất trong một số bài toán đơn giản
  liên quan đến các phép thử đồng khả năng.
- Nêu được #strong[Nguyên lí xác suất bé] và ý nghĩa của nó.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, đọc sách giáo
    khoa để nắm bắt kiến thức về biến cố và xác suất.
  - #strong[Năng lực giao tiếp và hợp tác:] Hợp tác hiệu quả trong nhóm
    để thảo luận, giải quyết các bài tập về xác suất và trình bày sản
    phẩm học tập (sơ đồ tư duy).
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp
    thông tin, đề xuất phương án giải quyết các bài toán xác suất thực
    tiễn.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích được các
    kết quả có thể xảy ra của phép thử; lập luận để xác định biến cố,
    không gian mẫu và tính xác suất.
  - #strong[Năng lực mô hình hoá toán học:] Sử dụng công cụ xác suất để
    mô tả và giải quyết các tình huống thực tiễn đơn giản.
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán:] Sử dụng máy
    tính cầm tay, phần mềm trình chiếu (PowerPoint, Canva) để hỗ trợ
    tính toán và trình bày kết quả.
- #strong[Năng lực số (theo Thông tư số 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động nhóm, hoàn thành
  nhiệm vụ được giao, không ngại khó khăn trong quá trình giải quyết bài
  toán xác suất.
- #strong[Trung thực:] Thẳng thắn trao đổi, chia sẻ kết quả, ý kiến và
  tự giác trong làm bài tập cá nhân.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ học tập của bản thân
  và nhóm, sẵn sàng giúp đỡ bạn bè.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối Internet, máy
  tính cầm tay.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Bộ Kết nối tri thức với cuộc sống).
  - Phiếu học tập in sẵn hoặc phiếu học tập điện tử (dạng Google Forms).
  - Các vật liệu thực tế cho hoạt động khởi động (ví dụ: đồng xu, con
    xúc xắc, hoặc bộ thẻ học tập/hình ảnh).
  - Tài liệu hướng dẫn sử dụng phần mềm vẽ sơ đồ tư duy hoặc trình chiếu
    đơn giản.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
- #strong[Tên hoạt động:] Gieo xúc xắc -- Khơi nguồn xác suất.

#mt-hd[
- Giúp học sinh xác định được vấn đề cần giải quyết: Làm thế nào để định
  lượng được khả năng xảy ra của một sự kiện/kết quả trong một phép thử
  ngẫu nhiên (dẫn đến khái niệm Biến cố và Xác suất).

]
#nd-hd[
- #strong[Nhiệm vụ:] Giáo viên tổ chức trò chơi/thực hành: #strong[Gieo
  một con xúc xắc] và yêu cầu học sinh thảo luận cặp đôi.
- #strong[Câu hỏi gợi mở:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + Tất cả các kết quả có thể xảy ra khi gieo xúc xắc là gì? (Không gian
    mẫu)
  + Trong các sự kiện sau, sự kiện nào chắc chắn xảy ra, sự kiện nào
    không thể xảy ra, sự kiện nào có thể xảy ra?
    - A: \"Số chấm xuất hiện lớn hơn 0 và nhỏ hơn 7\".
    - B: \"Số chấm xuất hiện là 8\".
    - C: \"Số chấm xuất hiện là số chẵn\".
  + Làm thế nào để diễn tả khả năng xảy ra của sự kiện C bằng một con
    số?
  ]

]
#sp-hd[
- Kết quả thảo luận của học sinh, trả lời được các câu hỏi gợi mở, đặc
  biệt nhận ra cần có một khái niệm (biến cố) và một công cụ (xác suất)
  để định lượng khả năng xảy ra của các sự kiện ngẫu nhiên.
- Biểu hiện NL số: Học sinh #strong[sử dụng công cụ và thiết bị số]
  (điện thoại/máy tính) để ghi nhận nhanh kết quả trả lời câu hỏi 1 và 2
  thông qua một khảo sát ngắn/phiếu học tập điện tử (nếu có).

]
#tc-hd[
- #strong[Bước 1: Chuyển giao nhiệm vụ (GV):] GV trình chiếu nhiệm vụ và
  câu hỏi gợi mở. Yêu cầu học sinh thảo luận cặp đôi trong 5 phút.
- #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
  trợ):] HS thảo luận, ghi nhận các kết quả có thể xảy ra và phân loại
  các sự kiện A, B, C. GV quan sát, gợi ý, khuyến khích tất cả học sinh
  tham gia.
- #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo cáo,
  thảo luận):] GV mời 2-3 cặp đôi báo cáo kết quả. Tập trung vào câu hỏi
  số 3.
- #strong[Bước 4: Kết luận, nhận định (GV):] GV nhận xét, chuẩn hoá các
  câu trả lời và dẫn dắt vào bài mới: Để trả lời câu hỏi 3, chúng ta cần
  tìm hiểu về \"Biến cố\" và \"Xác suất\".

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
- #strong[Tên hoạt động:] Khám phá Biến cố và Định nghĩa cổ điển của Xác
  suất.
- #emph[Hoạt động này được chia thành 3 hoạt động thành phần như sau:]

==== Hoạt động thành phần 2.1: Biến cố (20 phút)
- #strong[Tên hoạt động:] Phân loại và Biểu diễn Biến cố.

#mt-hd[
- Học sinh hình thành được khái niệm #strong[biến cố], phân biệt được
  các loại biến cố: #strong[chắc chắn, không thể, ngẫu nhiên].
- Biểu diễn được biến cố bằng tập hợp con của không gian mẫu.

]
#nd-hd[
- #strong[Nhiệm vụ:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Làm việc nhóm (4-5 HS):] Nghiên cứu SGK và thảo luận để rút
    ra định nghĩa:
    - Phép thử ngẫu nhiên, Không gian mẫu $\(Omega\)$.
    - Biến cố (là tập hợp con của $Omega$).
    - Các loại biến cố: chắc chắn, không thể, ngẫu nhiên.
  + #strong[Ví dụ cụ thể:] Gieo ngẫu nhiên một đồng xu cân đối 2 lần.
    Gọi $Omega$ là tập hợp các kết quả có thể xảy ra.
    - a) Viết tập hợp $Omega$.
    - b) Biểu diễn bằng tập hợp biến cố A: \"Có ít nhất một mặt ngửa\".
    - c) Biểu diễn bằng tập hợp biến cố B: \"Cả hai lần đều ra mặt
      sấp\".
  ]

]
#sp-hd[
- Định nghĩa về biến cố, không gian mẫu.
- Kết quả ví dụ: $Omega = { N N\,N S\,S N\,S S }$,
  $A = { N N\,N S\,S N }$, $B = { S S }$.
- Biểu hiện NL số: Học sinh #strong[sử dụng công cụ và thiết bị số]
  (điện thoại/máy tính) để thiết kế #strong[Sơ đồ tư duy] tóm tắt về
  Biến cố và các loại biến cố (dùng Mindmap/Canva/phần mềm vẽ sơ đồ tư
  duy trực tuyến).

]
#tc-hd[
- #strong[Bước 1: Chuyển giao nhiệm vụ (GV):] Chia nhóm, giao nhiệm vụ 1
  (nghiên cứu SGK) và nhiệm vụ 2 (làm ví dụ).
- #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
  trợ):] HS nghiên cứu SGK, thảo luận nhóm, thực hiện ví dụ. GV theo
  dõi, hướng dẫn cách biểu diễn biến cố.
- #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo cáo,
  thảo luận):] Mời đại diện 1-2 nhóm trình bày kết quả. Các nhóm khác
  nhận xét, bổ sung.
- #strong[Bước 4: Kết luận, nhận định (GV):] GV chuẩn hoá kiến thức về
  Biến cố (Biến cố là tập hợp con của Không gian mẫu).

==== Hoạt động thành phần 2.2: Định nghĩa cổ điển của xác suất (25 phút)
- #strong[Tên hoạt động:] Tính xác suất bằng Định nghĩa cổ điển.

]
#mt-hd[
- Học sinh nắm vững #strong[Định nghĩa cổ điển của xác suất] và công
  thức tính $P\(A\)= frac(n\(A\), n\(Omega\))$.
- Vận dụng công thức để tính xác suất cho các biến cố đơn giản trong các
  phép thử đồng khả năng.

]
#nd-hd[
- #strong[Nhiệm vụ:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Thảo luận nhóm:] Nghiên cứu SGK và rút ra Định nghĩa cổ điển
    của xác suất và công thức tính.
  + #strong[Ví dụ cụ thể:] Trong hộp có 5 quả bóng cùng kích thước, gồm
    3 bóng xanh và 2 bóng đỏ. Lấy ngẫu nhiên 2 quả bóng. Tính xác suất
    để:
    - A: \"Lấy được 2 quả bóng xanh\".
    - B: \"Lấy được 1 bóng xanh và 1 bóng đỏ\".
  + Thảo luận về các tính chất cơ bản của xác suất:
    $0 lt.eq P\(A\)lt.eq 1$, $P\(Omega\)= 1$, $P\(diameter\)= 0$.
  ]

]
#sp-hd[
- Công thức tính xác suất: $P\(A\)= frac(n\(A\), n\(Omega\))$.
- Kết quả ví dụ: $n\(Omega\)= C_5^2 = 10$.
  - $P\(A\)= C_3^2 / C_5^2 = 3 / 10$.
  - $P\(B\)= frac(C_3^1 dot.op C_2^1, C_5^2) = 6 / 10 = 3 / 5$.
- Biểu hiện NL số: Học sinh #strong[sử dụng công cụ và thiết bị số] (máy
  tính cầm tay) để thực hiện tính toán tổ hợp $C_n^k$ và phép toán xác
  suất.

]
#tc-hd[
- #strong[Bước 1: Chuyển giao nhiệm vụ (GV):] Yêu cầu HS nghiên cứu, rút
  ra công thức. Sau đó, giao Ví dụ cụ thể.
- #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
  trợ):] HS vận dụng kiến thức về tổ hợp để tính $n\(Omega\)$, $n\(A\)$,
  $n\(B\)$, và tính xác suất. GV nhấn mạnh điều kiện \"đồng khả năng\"
  và vai trò của công thức tổ hợp, chỉnh hợp.
- #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo cáo,
  thảo luận):] Mời 1 nhóm lên bảng trình bày chi tiết lời giải (bao gồm
  cả bước tính $n\(Omega\)$, $n\(A\)$, $n\(B\)$).
- #strong[Bước 4: Kết luận, nhận định (GV):] GV chuẩn hoá công thức và
  kết quả tính xác suất, chốt lại 3 tính chất cơ bản.

==== Hoạt động thành phần 2.3: Nguyên lý xác suất bé (15 phút)
- #strong[Tên hoạt động:] Ý nghĩa của Xác suất.

]
#mt-hd[
- Học sinh nêu được ý nghĩa của #strong[Nguyên lý xác suất bé] (ví dụ:
  Biến cố có xác suất rất bé thì ta có thể xem là không xảy ra trong một
  phép thử).
- Vận dụng ý nghĩa của xác suất vào thực tiễn.

]
#nd-hd[
- #strong[Nhiệm vụ:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Thảo luận nhóm:] Nghiên cứu SGK về Nguyên lý xác suất bé và
    ngưỡng xác suất bé (ví dụ: $P\(A\)< 0\,01$).
  + #strong[Ví dụ cụ thể:] Một lô hàng có tỉ lệ sản phẩm hỏng là
    $0\,5 %$. Một người mua ngẫu nhiên một sản phẩm.
    - a) Tính xác suất để người đó mua phải sản phẩm hỏng.
    - b) Dựa vào Nguyên lý xác suất bé, người đó có nên lo lắng quá mức
      về việc mua phải hàng hỏng không?
  + Thảo luận về ứng dụng của Nguyên lý này trong y học, kỹ thuật.
  ]

]
#sp-hd[
- Phát biểu Nguyên lý xác suất bé (Biến cố có xác suất rất bé thì hầu
  như không xảy ra trong một phép thử).
- Kết quả ví dụ: $P\(upright("hỏng")\)= 0\,005$. Vì $0\,005 < 0\,01$,
  xác suất này rất bé, người mua có thể yên tâm.

]
#tc-hd[
- #strong[Bước 1: Chuyển giao nhiệm vụ (GV):] Đưa ra nhiệm vụ và ví dụ
  thực tế.
- #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
  trợ):] HS đọc SGK, thảo luận để liên hệ kiến thức với thực tiễn.
- #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo cáo,
  thảo luận):] Mời 1-2 nhóm trình bày.
- #strong[Bước 4: Kết luận, nhận định (GV):] Chuẩn hoá nội dung và nhấn
  mạnh ý nghĩa thực tiễn của Nguyên lý xác suất bé.

]
#hd("3", "Luyện tập", "15 phút")
- #strong[Tên hoạt động:] Vận dụng và Củng cố.

#mt-hd[
- Vận dụng kiến thức về biến cố và xác suất để giải quyết các bài tập
  thuộc các mức độ khác nhau.
- Phát triển kĩ năng tính toán, phân tích và trình bày lời giải.

]
#nd-hd[
- #strong[Nhiệm vụ:] Hoạt động #strong[\"Trò chơi Học tập: Ai nhanh
  hơn?\"] (cá nhân/cặp đôi)
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Bài tập 1 (Nhận biết):] Gieo 2 con xúc xắc. Tính
    $n\(Omega\)$.
  + #strong[Bài tập 2 (Thông hiểu):] Rút ngẫu nhiên 1 lá bài từ bộ bài
    52 lá. Tính xác suất để rút được lá Át.
  + #strong[Bài tập 3 (Vận dụng):] Chọn ngẫu nhiên 3 học sinh từ một
    nhóm gồm 5 nam và 4 nữ. Tính xác suất để trong 3 học sinh đó có ít
    nhất 2 nữ.
  ]

]
#sp-hd[
- Đáp án và lời giải chính xác cho 3 bài tập:
  - Bài 1: $n\(Omega\)= 36$.
  - Bài 2: $P = 4 / 52 = 1 / 13$.
  - Bài 3: $n\(Omega\)= C_9^3 = 84$.
    $n\(A\)= C_4^2 dot.op C_5^1 + C_4^3 = 6 dot.op 5 + 4 = 34$.
    $P\(A\)= 34 / 84 = 17 / 42$.
- Biểu hiện NL số: Học sinh #strong[sử dụng công cụ và thiết bị số] (máy
  tính cầm tay) để tính toán nhanh, hoặc trả lời nhanh trên hệ thống
  Quizizz/Kahoot (nếu sử dụng).

]
#tc-hd[
- #strong[Bước 1: Chuyển giao nhiệm vụ (GV):] GV trình chiếu 3 bài tập.
  Phân nhóm/cặp đôi và quy định thời gian trả lời.
- #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
  trợ):] HS làm bài tập cá nhân/cặp đôi. GV quan sát, kịp thời hỗ trợ
  những học sinh gặp khó khăn trong việc xác định Không gian mẫu hoặc
  tính tổ hợp.
- #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo cáo,
  thảo luận):] Mời 3 học sinh (đại diện cho 3 mức độ) lên trình bày lời
  giải.
- #strong[Bước 4: Kết luận, nhận định (GV):] GV nhận xét, đánh giá kết
  quả.

]
#hd("4", "Vận dụng", "5 phút - Giao nhiệm vụ về nhà")
- #strong[Tên hoạt động:] Xác suất trong thực tiễn.

#mt-hd[
- Phát triển năng lực của học sinh thông qua việc vận dụng kiến thức, kĩ
  năng đã học vào giải quyết các vấn đề thực tiễn.

]
#nd-hd[
- #strong[Nhiệm vụ:] Giao bài tập về nhà #strong[Thực hành thu thập dữ
  liệu và tính xác suất:]
  - #strong[Tình huống:] Trong một lớp học có $N$ học sinh. Hãy thu thập
    dữ liệu về ngày sinh của các bạn.
  - #strong[Yêu cầu:] Vận dụng kiến thức về xác suất để tìm hiểu và giải
    thích bài toán #strong[\"Xác suất để trong] $N$ #strong[người có ít
    nhất 2 người trùng ngày sinh\"] (Bài toán sinh nhật). (Yêu cầu chỉ
    mang tính định hướng, không bắt buộc tính toán phức tạp, chỉ cần tìm
    hiểu ý nghĩa).

]
#sp-hd[
- Báo cáo/Bài thuyết trình ngắn (có thể làm bằng PowerPoint hoặc viết
  tay) về kết quả tìm hiểu và ứng dụng của xác suất trong tình huống
  thực tiễn.
- Biểu hiện NL số: Học sinh #strong[sử dụng công cụ và thiết bị số] để
  thu thập dữ liệu (khảo sát trực tuyến/biểu mẫu) và #strong[sử dụng
  công nghệ số để tạo ra sản phẩm] (thiết kế bài trình bày).

]
#tc-hd[
- #strong[Giao nhiệm vụ (GV):] GV giao nhiệm vụ cho học sinh thực hiện
  ngoài giờ học trên lớp. Nộp sản phẩm để trao đổi, chia sẻ và đánh giá
  vào đầu tiết học tiếp theo hoặc vào thời điểm phù hợp. GV hướng dẫn HS
  cách tìm kiếm thông tin an toàn, có chọn lọc trên mạng Internet.

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
