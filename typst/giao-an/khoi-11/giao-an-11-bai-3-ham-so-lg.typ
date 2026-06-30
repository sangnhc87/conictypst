// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 3 Hàm số LG",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được #strong[định nghĩa] các hàm số lượng giác $y = s i n x$,
  $y = c o s x$, $y = t a n x$, và $y = c o t x$.
- Nắm được #strong[tính chẵn, lẻ] của các hàm số lượng giác.
- Nêu được #strong[tính tuần hoàn] và #strong[chu kì] của các hàm số
  lượng giác.
- Nêu được #strong[tập xác định], #strong[tập giá trị] và các
  #strong[tính chất] cơ bản (như tính đồng biến/nghịch biến, các điểm
  cực trị) của các hàm số lượng giác.
- Nhận dạng được #strong[đồ thị] của các hàm số $y = s i n x$,
  $y = c o s x$, $y = t a n x$, và $y = c o t x$.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực tư duy và lập luận toán học:] Thực hiện được các
    thao tác tìm tập xác định, xét tính chẵn lẻ, tính tuần hoàn của hàm
    số lượng giác. Nhận biết và giải thích được các tính chất của hàm số
    qua đồ thị.
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng được kiến
    thức về hàm số lượng giác để giải quyết các bài tập liên quan (ví
    dụ: tìm giá trị lớn nhất/nhỏ nhất, tìm tập xác định).
  - #strong[Năng lực giao tiếp toán học:] Sử dụng ngôn ngữ toán học (kí
    hiệu, thuật ngữ) để trình bày, thảo luận về định nghĩa, tính chất và
    đồ thị của các hàm số lượng giác.
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu kiến thức qua
    tài liệu (SGK, học liệu số) và thực hiện nhiệm vụ học tập được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia thảo luận
    nhóm, biết lắng nghe, đóng góp ý kiến để hoàn thành nhiệm vụ chung.
- #strong[Năng lực số (theo Thông tư 02/2025/TT-BGDĐT):]
  - #strong[Khai thác và xử lý thông tin số:] Tìm kiếm, thu thập, và xử
    lý thông tin (hình ảnh, video đồ thị hàm số) trên nền tảng số
    (Internet, phần mềm vẽ đồ thị) phục vụ cho việc học tập.
  - #strong[Sáng tạo nội dung số:] Sử dụng phần mềm vẽ đồ thị (ví dụ:
    GeoGebra, Desmos) để vẽ, khảo sát và trình bày đồ thị hàm số lượng
    giác.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  đầy đủ các nhiệm vụ cá nhân và nhóm, không ngại khó khăn khi tìm hiểu
  kiến thức mới.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong nhóm, hoàn thành nhiệm
  vụ được giao, chịu trách nhiệm về kết quả học tập của bản thân và
  nhóm.
- #strong[Trung thực:] Trung thực trong quá trình giải quyết vấn đề và
  báo cáo kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, phòng học có kết nối
  Internet.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 - Kết nối tri thức với cuộc sống.
  - Phiếu học tập, giấy A0, bút dạ.
  - Phần mềm vẽ đồ thị trực tuyến #strong[GeoGebra] hoặc #strong[Desmos]
    (Tích hợp năng lực số).
  - Video/Hình ảnh mô phỏng đồ thị các hàm số lượng giác.

// #box(image("media/image1.jpeg", height: 1.77257in, width: 1.76879in, alt: "Hình ảnh về the graph of y=sin(x) and y=cos(x)"))

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
- #strong[Tên hoạt động:] Khởi động -- Nhắc lại kiến thức và đặt vấn đề
#mt-hd[
Giúp học sinh xác định được vấn đề/nhiệm vụ cụ
  thể cần giải quyết trong bài học hoặc xác định rõ cách thức giải quyết
  vấn đề/thực hiện nhiệm vụ trong các hoạt động tiếp theo của bài học.
]
#nd-hd[
Giáo viên (GV) đưa ra câu hỏi gợi mở về
  #strong[giá trị lượng giác] của góc $alpha$ trên đường tròn lượng
  giác.
  - #strong[Nhiệm vụ:]
    - #strong[Câu hỏi 1:] Khi điểm $M$ trên đường tròn lượng giác xác
      định bởi góc $x$ thay đổi, giá trị $sin x$, $cos x$ thay đổi như
      thế nào?
    - #strong[Câu hỏi 2:] Nêu mối liên hệ giữa các giá trị lượng giác
      $sin x\,c o s x\,t a n x\,c o t x$ với tọa độ điểm $M\(x_0\;y_0\)$
      trên đường tròn lượng giác.
    - #strong[Ví dụ minh họa:] Cho góc $x$. Giá trị của $sin x$ là gì?
      Hàm số nào có thể mô tả mối quan hệ giữa $x$ và $sin x$?
]
#sp-hd[
  - Học sinh (HS) trả lời được: Khi $x$ thay đổi, $sin x$ và $cos x$
    nhận giá trị trong đoạn $\[- 1\;1\]$.
  - HS nhận biết $sin x$ và $cos x$ là các #strong[hàm số] theo biến
    $x$.
  - HS trình bày được vấn đề cần giải quyết: #strong[Nghiên cứu các hàm
    số lượng giác] (Tập xác định, tập giá trị, tính chất, đồ thị).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập (2 phút):] GV chiếu câu hỏi,
    yêu cầu HS hoạt động cá nhân suy nghĩ và ghi nhanh câu trả lời vào
    vở.
  - #strong[Bước 2: Thực hiện nhiệm vụ (5 phút):] HS suy nghĩ, ôn lại
    kiến thức về đường tròn lượng giác. GV theo dõi, gợi ý nếu HS gặp
    khó khăn.
  - #strong[Bước 3: Báo cáo, thảo luận (2 phút):] GV gọi 1-2 HS trình
    bày kết quả.
  - #strong[Bước 4: Kết luận, nhận định (1 phút):] GV chốt lại mối quan
    hệ hàm số và dẫn dắt vào bài mới: Để hiểu rõ hơn, chúng ta sẽ đi vào
    bài #strong[Hàm số lượng giác].

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "65 phút")
#mt-hd[
Giúp học sinh thực hiện nhiệm vụ học tập để
  chiếm lĩnh kiến thức mới/giải quyết vấn đề/thực hiện nhiệm vụ đặt ra
  từ Hoạt động 1.
]
#nd-hd[
HS làm việc với sách giáo khoa, thiết bị dạy
  học, học liệu cụ thể để thực hiện các nhiệm vụ sau:
  - #strong[Hoạt động 2.1:] Định nghĩa hàm số lượng giác (10 phút)
  - #strong[Hoạt động 2.2:] Hàm số chẵn, hàm số lẻ và hàm số tuần hoàn
    (15 phút)
  - #strong[Hoạt động 2.3:] Đồ thị và tính chất của hàm số $y = s i n x$
    (10 phút)
  - #strong[Hoạt động 2.4:] Đồ thị và tính chất của hàm số $y = c o s x$
    (10 phút)
  - #strong[Hoạt động 2.5:] Đồ thị và tính chất của hàm số $y = t a n x$
    (10 phút)
  - #strong[Hoạt động 2.6:] Đồ thị và tính chất của hàm số $y = c o t x$
    (10 phút)
]
#sp-hd[
HS ghi chép đầy đủ các định nghĩa, công thức,
  bảng tóm tắt tính chất và vẽ được đồ thị cơ bản của 4 hàm số lượng
  giác.
]
#tc-hd[
Hướng dẫn, hỗ trợ, kiểm tra, đánh giá
  quá trình và kết quả thực hiện hoạt động của học sinh.

==== Hoạt động 2.1: Định nghĩa hàm số lượng giác (10 phút)
- #strong[Nội dung:] HS đọc SGK và trả lời các câu hỏi: Tập xác định của
  $y = s i n x\,y = c o s x\,y = t a n x\,y = c o t x$ là gì?
- #strong[Ví dụ cụ thể:] Tìm tập xác định của hàm số $y = c o s\(2 x\)$
  và $y = t a n (x - pi / 4)$.
- #strong[Tổ chức thực hiện:]
  - HS làm việc cá nhân, sau đó GV gọi HS trình bày kết quả.
  - GV chốt lại định nghĩa và tập xác định của từng hàm số.

==== Hoạt động 2.2: Hàm số chẵn, hàm số lẻ và hàm số tuần hoàn (15 phút)
- #strong[Nội dung:]
  - #strong[Hàm số chẵn, hàm số lẻ:] Xét tính chẵn, lẻ của $y = s i n x$
    và $y = c o s x$ dựa trên công thức $s i n\(- x\)= - s i n x$ và
    $c o s\(- x\)= c o s x$.
  - #strong[Hàm số tuần hoàn:] Dựa vào kiến thức
    $s i n\(x + k 2 pi\)= s i n x$ để xác định tính tuần hoàn và chu kì
    của $y = s i n x\,y = c o s x$.
- #strong[Ví dụ cụ thể:]
  - Xét tính chẵn, lẻ của hàm số $y = s i n x + x^2$.
  - Tìm chu kì của hàm số $y = s i n\(3 x\)$.
- #strong[Tổ chức thực hiện:]
  - HS #strong[thảo luận nhóm] (2-3 HS).
  - GV yêu cầu HS sử dụng công cụ #strong[GeoGebra/Desmos] để
    #strong[kiểm chứng] tính đối xứng của đồ thị (Tích hợp năng lực số:
    #strong[Khai thác và xử lý thông tin số]).
  - GV chốt kiến thức về tính chẵn, lẻ và tính tuần hoàn.

==== Hoạt động 2.3 & 2.4: Đồ thị và tính chất của hàm số $y = s i n x$ và $y = c o s x$ (20 phút)
- #strong[Nội dung:] HS làm việc nhóm, sử dụng phần mềm
  #strong[GeoGebra/Desmos] để vẽ đồ thị của $y = s i n x$ và
  $y = c o s x$ (Tích hợp năng lực số: #strong[Sáng tạo nội dung số]).
  - Từ đồ thị, HS rút ra các tính chất: Tập giá trị, khoảng đồng
    biến/nghịch biến, GTLN, GTNN.
- #strong[Ví dụ cụ thể:] Xác định các điểm mà tại đó hàm số
  $y = s i n x$ và $y = c o s x$ đạt giá trị lớn nhất/nhỏ nhất.
- #strong[Tổ chức thực hiện:]
  - GV giao nhiệm vụ cho 2 nhóm: Nhóm 1 nghiên cứu $y = s i n x$, Nhóm 2
    nghiên cứu $y = c o s x$.
  - HS sử dụng thiết bị (điện thoại/máy tính bảng) để vẽ và quan sát đồ
    thị.
  - GV hướng dẫn HS vẽ trên phần mềm (Hỗ trợ, kiểm tra).

==== Hoạt động 2.5 & 2.6: Đồ thị và tính chất của hàm số $y = t a n x$ và $y = c o t x$ (20 phút)
- #strong[Nội dung:] HS tiếp tục sử dụng phần mềm hoặc sơ đồ tư duy để
  tóm tắt các tính chất và đồ thị của $y = t a n x$ và $y = c o t x$.
  Đặc biệt lưu ý đến #strong[đường tiệm cận] và #strong[chu kì].
- #strong[Ví dụ cụ thể:] Xác định tập xác định, chu kì và các đường tiệm
  cận của hàm số $y = t a n x$.
- #strong[Tổ chức thực hiện:]
  - HS làm việc nhóm, tổng hợp kiến thức bằng #strong[Sơ đồ tư duy] trên
    giấy A0.
  - GV mời đại diện nhóm trình bày (Tăng cường kĩ năng giao tiếp, thuyết
    trình).
  - GV chốt kiến thức, nhấn mạnh sự khác biệt giữa các hàm số.

]
#hd("3", "Luyện tập", "10 phút")
#mt-hd[
Vận dụng kiến thức đã học và yêu cầu phát triển
  các kĩ năng vận dụng kiến thức cho học sinh (Tìm tập xác định, tính
  chẵn lẻ, chu kì).
]
#nd-hd[
Hệ thống bài tập trắc nghiệm nhanh và tự luận
  ngắn.
  - #strong[Bài tập 1 (Trắc nghiệm):] Tập xác định của hàm số
    $y = frac(1, sin x - 1)$ là?
  - #strong[Bài tập 2 (Trắc nghiệm):] Hàm số nào sau đây là hàm số chẵn:
    A. $y = s i n x$ B. $y = t a n x$ C. $y = c o s x$ D. $y = c o t x$.
  - #strong[Bài tập 3 (Tự luận ngắn):] Tìm giá trị lớn nhất, nhỏ nhất
    của hàm số $y = 3 sin x - 1$.
]
#sp-hd[
Đáp án, lời giải đúng của các bài tập.
]
#tc-hd[
  - #strong[Trò chơi học tập: \"Ai nhanh hơn\"]. GV chiếu lần lượt các
    câu hỏi.
  - HS làm việc cá nhân trong thời gian quy định, sau đó giơ bảng đáp án
    (đối với trắc nghiệm).
  - GV gọi HS giải thích cách làm (đối với tự luận).
  - GV nhận xét, chốt đáp án.

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
Phát triển năng lực của học sinh thông qua nhiệm
  vụ/yêu cầu vận dụng kiến thức, kĩ năng vào thực tiễn.
]
#nd-hd[
Giao nhiệm vụ tìm kiếm và báo cáo về các hiện
  tượng thực tiễn có đồ thị là hàm số lượng giác.
  - #strong[Nhiệm vụ:] Tìm hiểu về các hiện tượng thực tế (ví dụ:
    #strong[dao động của con lắc lò xo], #strong[thủy triều],
    #strong[sóng điện từ], #strong[sóng âm]) mà quá trình của nó được mô
    tả bằng đồ thị hình #strong[Sin] (ứng dụng của hàm số lượng giác).
]
#sp-hd[
Báo cáo (dạng văn bản, video, hoặc thuyết trình)
  về một hiện tượng thực tiễn, có hình ảnh/đồ thị minh họa.
]
#tc-hd[
  - GV giao nhiệm vụ thực hiện #strong[ngoài giờ học trên lớp].
  - GV hướng dẫn HS có thể sử dụng công cụ tìm kiếm trên mạng để thu
    thập thông tin và tạo báo cáo (Tích hợp năng lực số: #strong[Khai
    thác và xử lý thông tin số]).
  - Sản phẩm sẽ được thu thập và đánh giá vào buổi học tiếp theo hoặc
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
