// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 1 GTLG của GLG",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được #strong[Khái niệm góc lượng giác, số đo] của góc lượng giác,
  và #strong[Hệ thức Chasles].
- Trình bày được các #strong[đơn vị đo góc] (độ và radian) và
  #strong[công thức tính độ dài cung tròn].
- Nêu được #strong[Đường tròn lượng giác] và #strong[Khái niệm giá trị
  lượng giác] của một góc lượng giác
  ($sin alpha\,c o s alpha\,t a n alpha\,c o t alpha$).
- Trình bày được #strong[Giá trị lượng giác của các góc đặc biệt] và
  #strong[Quan hệ giữa các giá trị lượng giác] (công thức lượng giác cơ
  bản, giá trị lượng giác của các góc có liên quan đặc biệt).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến thức mới
    về góc lượng giác.
  - #strong[Giao tiếp và hợp tác:] Hợp tác hiệu quả trong nhóm để hoàn
    thành các nhiệm vụ học tập, đặc biệt trong các hoạt động khám phá,
    luyện tập, trình bày sản phẩm (sơ đồ tư duy).
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp thông
    tin để giải quyết các bài tập tính giá trị lượng giác.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Tư duy và lập luận toán học:] Phát hiện, chứng minh các công
    thức lượng giác cơ bản; lập luận logic để chuyển đổi giữa đơn vị độ
    và radian.
  - #strong[Mô hình hóa toán học:] Mô hình hóa góc lượng giác và giá trị
    lượng giác bằng hình ảnh trực quan trên đường tròn lượng giác.
  - #strong[Sử dụng công cụ, phương tiện toán học:] Sử dụng máy tính cầm
    tay để đổi đơn vị đo góc (độ $arrow.l.r$ radian) và tìm giá trị
    lượng giác của góc.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - #strong[NL1. Khai thác và xử lý thông tin, dữ liệu số:] Học sinh
    #strong[tìm kiếm, chọn lọc và sử dụng thông tin] (Công thức, bảng
    giá trị lượng giác) trên các nền tảng học tập trực tuyến (ví dụ: kho
    học liệu số của trường/bộ GD&ĐT hoặc nguồn học liệu đáng tin cậy) để
    hoàn thành bài tập, bài thuyết trình nhóm.
  - #strong[NL2. Sáng tạo và cộng tác bằng công nghệ số:] Học sinh
    #strong[sử dụng công cụ số] (ví dụ: Mindmap online, Canva) để thiết
    kế #strong[sơ đồ tư duy] tổng hợp kiến thức về Giá trị lượng giác
    của góc lượng giác và chia sẻ với nhóm/lớp.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, nghiêm túc thực hiện các nhiệm vụ học
  tập.
- #strong[Trung thực:] Trung thực trong học tập, tự giác nhận lỗi sai và
  sửa chữa.
- #strong[Trách nhiệm:] Có trách nhiệm với bản thân và tập thể khi thực
  hiện các nhiệm vụ được phân công.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy chiếu, máy tính có kết nối Internet, phần mềm
  vẽ hình động (ví dụ: Geogebra) để minh họa góc lượng giác quay, Đường
  tròn lượng giác, phiếu học tập, SGK Toán 11 - Kết nối tri thức.
- #strong[Học sinh:] SGK, vở ghi, máy tính cầm tay (casio fx-570VN PLUS
  hoặc tương đương), điện thoại/máy tính bảng có kết nối Internet (để
  thực hiện các nhiệm vụ liên quan đến Năng lực số).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "10 phút")
Tên hoạt động: #strong[Khởi động: Góc quay và Góc lượng giác]

#mt-hd[
Tạo hứng thú, dẫn dắt từ #strong[góc hình học]
  đến #strong[khái niệm góc lượng giác] (là góc có chiều quay).
]
#nd-hd[
Giáo viên đặt vấn đề bằng hình ảnh hoặc câu hỏi
  thực tiễn.
  - #strong[Nhiệm vụ:] Quan sát hình ảnh #strong[cánh quạt quay] và trả
    lời câu hỏi sau: Góc hình học chỉ có giá trị dương, không thể hiện
    chiều quay. Để mô tả đầy đủ góc có chiều quay (theo chiều kim đồng
    hồ hay ngược chiều), ta cần một khái niệm mới. Khái niệm đó là gì?

]
#sp-hd[
Câu trả lời của học sinh: Cần khái niệm góc có
  dấu/góc lượng giác.
]
#tc-hd[
  - #strong[Giao nhiệm vụ (3 phút):] GV trình chiếu câu hỏi, yêu cầu HS
    thảo luận cặp đôi.
  - #strong[Thực hiện nhiệm vụ (4 phút):] HS thảo luận, ghi nhanh ý kiến
    cá nhân/nhóm.
  - #strong[Báo cáo, thảo luận (3 phút):] Gọi 1-2 HS đại diện trả lời.
    GV nhận xét, kết luận và dẫn vào bài mới: Để mô tả đầy đủ góc có
    chiều quay, ta cần khái niệm #strong[Góc lượng giác].

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "95 phút")
==== 2.1. Hoạt động thành phần 2.1: Góc lượng giác (25 phút)
#mt-hd[
Hình thành khái niệm #strong[góc lượng giác],
  #strong[số đo] của góc lượng giác, và biết áp dụng #strong[Hệ thức
  Chasles].
]
#nd-hd[
HS làm việc với SGK, #strong[thảo luận nhóm 4].
  - #strong[Nhiệm vụ:] Nghiên cứu SGK, thảo luận để trả lời:
    #block[
    #set enum(numbering: "i.", start: 1)
    + Nêu định nghĩa #strong[Góc lượng giác] và #strong[Số đo góc lượng
      giác]. Cho ví dụ về góc lượng giác có số đo âm, dương.
    + Trình bày nội dung #strong[Hệ thức Chasles].
    ]
  - #strong[Ví dụ minh họa:] GV dùng Geogebra mô phỏng tia $O u$ quay
    đến tia $O v$ với hai số đo khác nhau (ví dụ: $30^compose$ và
    $390^compose$).
]
#sp-hd[
Học sinh ghi nhận các định nghĩa và công thức cơ
  bản: Số đo góc lượng giác có dạng $alpha + k dot.op 360^compose$
  ($k bb(in Z)$).
]
#tc-hd[
  - #strong[Giao nhiệm vụ (2 phút):] GV chia nhóm, giao nhiệm vụ đọc SGK
    và thảo luận.
  - #strong[Thực hiện nhiệm vụ (8 phút):] HS tự đọc, trao đổi nhóm. GV
    theo dõi, hỗ trợ (nhấn mạnh $k dot.op 360^compose$).
  - #strong[Báo cáo, thảo luận (5 phút):] Gọi đại diện 2 nhóm trình bày.
    GV chuẩn hóa kiến thức.

==== 2.2. Hoạt động thành phần 2.2: Đơn vị đo góc và độ dài cung tròn (25 phút)
]
#mt-hd[
Nắm được khái niệm #strong[Radian], biết cách
  #strong[đổi đơn vị] giữa độ và radian, và tính #strong[độ dài cung
  tròn].
]
#nd-hd[
HS làm việc cá nhân và cặp đôi.
  - #strong[Nhiệm vụ:]
    #block[
    #set enum(numbering: "i.", start: 1)
    + Nêu định nghĩa #strong[Đơn vị Radian] và thiết lập công thức đổi
      đơn vị: $pi upright(" rad") = 180^compose$.
    + Thiết lập #strong[công thức tính độ dài cung tròn] $l = alpha R$
      (với $alpha$ là số đo radian).
    ]
  - #strong[Ví dụ minh họa:]
    - #strong[Bài tập 1 (Cá nhân):] Đổi $135^compose$ ra radian và
      $frac(5 pi, 6)$ rad ra độ.
]
#sp-hd[
Công thức đổi đơn vị. #strong[Đáp án Bài tập 1:]
  $135^compose = frac(3 pi, 4)$ rad;
  $frac(5 pi, 6) upright(" rad") = 150^compose$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ (2 phút):] GV giao nhiệm vụ nghiên cứu SGK,
    làm bài tập.
  - #strong[Thực hiện nhiệm vụ (8 phút):] HS làm việc cá nhân, sau đó
    thảo luận cặp đôi. GV khuyến khích HS #strong[sử dụng máy tính cầm
    tay] để kiểm tra việc đổi đơn vị.
  - #strong[Báo cáo, thảo luận (5 phút):] Gọi HS lên bảng trình bày. GV
    chuẩn hóa công thức.
  - #strong[Tích hợp Năng lực số:] #strong[Sử dụng Công cụ Số] (Máy tính
    cầm tay) để thực hiện tính toán và kiểm tra kết quả đổi đơn vị.

==== 2.3. Hoạt động thành phần 2.3: Giá trị lượng giác của góc lượng giác (25 phút)
]
#mt-hd[
Nắm được khái niệm Đường tròn lượng giác, định
  nghĩa Giá trị lượng giác ($s i n\,c o s\,t a n\,c o t$) và xác định
  được giá trị lượng giác của các góc đặc biệt.
]
#nd-hd[
HS làm việc nhóm 4, sử dụng SGK và hình ảnh
  Đường tròn lượng giác.
  - #strong[Nhiệm vụ:] Thảo luận nhóm:

#quote(block: true)[
\1. Định nghĩa #strong[Đường tròn lượng giác]
]

// #box(image("media/image1.jpeg", height: 1.48555in, width: 1.48555in, alt: "the Unit Circle in trigonometry")).

\2. Nêu định nghĩa các giá trị lượng giác
($sin alpha\,c o s alpha\,t a n alpha\,c o t alpha$).

\3. Dựa vào Đường tròn lượng giác, xác định Giá trị lượng giác của các
góc đặc biệt
($0\,pi / 6\,pi / 4\,pi / 3\,pi / 2\,pi\,frac(3 pi, 2)\,2 pi$).

\* #strong[Ví dụ minh họa:] Yêu cầu xác định $sin 90^compose$ và
$cos 180^compose$ từ hình vẽ.

]
#sp-hd[
Định nghĩa Đường tròn lượng giác, các công thức
  định nghĩa. Bảng giá trị lượng giác của các góc đặc biệt.
]
#tc-hd[
  - #strong[Giao nhiệm vụ (2 phút):] GV giao nhiệm vụ, lưu ý HS quan sát
    kĩ hình vẽ và tọa độ điểm M trên Đường tròn lượng giác.
  - #strong[Thực hiện nhiệm vụ (8 phút):] HS thảo luận nhóm, phân công
    thành viên lập bảng giá trị. GV theo dõi, gợi ý: Tọa độ điểm M trên
    ĐTLG là $\(c o s alpha\;s i n alpha\)$.
  - #strong[Báo cáo, thảo luận (5 phút):] Gọi một nhóm trình bày bảng
    giá trị đặc biệt. GV chuẩn hóa kiến thức, hướng dẫn HS #strong[sử
    dụng máy tính cầm tay] để kiểm tra.
  - #strong[Tích hợp Năng lực số:] #strong[Sử dụng Công cụ Số] (Máy tính
    cầm tay) để tìm/kiểm tra giá trị lượng giác của góc.

==== 2.4. Hoạt động thành phần 2.4: Quan hệ giữa các giá trị lượng giác (20 phút)
]
#mt-hd[
Thiết lập và nắm vững các #strong[công thức
  lượng giác cơ bản] và #strong[giá trị lượng giác của các góc có liên
  quan đặc biệt].
]
#nd-hd[
HS làm việc nhóm 4 #strong[\(Phương pháp sơ đồ
  tư duy)].
  - #strong[Nhiệm vụ:]
    #block[
    #set enum(numbering: "i.", start: 1)
    + Thiết lập và ghi nhớ #strong[3 công thức lượng giác cơ bản] (từ
      Đường tròn lượng giác).
    + Tìm hiểu các #strong[Quan hệ giữa các giá trị lượng giác của các
      góc có liên quan đặc biệt] (góc bù, góc đối, góc phụ, góc hơn kém
      $pi$).
    + #strong[Tích hợp Năng lực số:] Thiết kế #strong[Sơ đồ tư duy
      (Mindmap)] tổng hợp toàn bộ các công thức đã học trong hoạt động
      này.
    ]
  - #strong[Ví dụ minh họa:] Cho $sin alpha = - 1 / 4$ và
    $pi < alpha < frac(3 pi, 2)$. Tính $cos alpha$ và $tan alpha$.
]
#sp-hd[
#strong[Sơ đồ tư duy] tổng hợp các công thức
  lượng giác. #strong[Đáp án ví dụ:] $cos alpha = - sqrt(15) / 4$,
  $tan alpha = 1 / sqrt(15)$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ (2 phút):] GV giao nhiệm vụ, nhấn mạnh yêu cầu
    lập Sơ đồ tư duy (khuyến khích dùng công cụ số).
  - #strong[Thực hiện nhiệm vụ (10 phút):] HS làm việc nhóm, phân công
    người thiết lập công thức và người thiết kế sơ đồ tư duy.
    #strong[Tích hợp Năng lực số:] HS #strong[sử dụng công cụ số]
    (Mindmap online, Canva) để #strong[sáng tạo] và #strong[trình bày
    trực quan] hệ thống công thức (NL2).
  - #strong[Báo cáo, thảo luận (8 phút):] Gọi đại diện 2 nhóm trình bày
    Sơ đồ tư duy. GV và HS nhận xét, đánh giá SĐTD, chuẩn hóa công thức.

]
#hd("3", "Luyện tập", "10 phút")
#mt-hd[
Củng cố kiến thức và kĩ năng tính toán, vận dụng
  công thức lượng giác cơ bản, và đổi đơn vị đo góc.
]
#nd-hd[
#strong[Trò chơi tiếp sức] với các câu hỏi trắc
  nghiệm/tính toán nhanh.
  - #strong[Nhiệm vụ:] Các nhóm nhanh chóng giải quyết các câu hỏi tính
    toán/trắc nghiệm cơ bản.
  - #strong[Ví dụ minh họa:]
    #block[
    #set enum(numbering: "i.", start: 1)
    + Giá trị của $sin^2 x + cos^2 x$ bằng bao nhiêu?
    + Đổi $frac(5 pi, 4)$ rad ra độ.
    + Biểu thức $s i n\(pi + x\)$ bằng biểu thức nào sau đây? (Đáp án:
      $- s i n x$)
    ]
]
#sp-hd[
Đáp án nhanh và chính xác của các nhóm.
]
#tc-hd[
  - GV chuẩn bị các câu hỏi (trình chiếu PowerPoint).
  - HS làm việc theo nhóm đã chia, cử đại diện ghi đáp án nhanh nhất.
  - GV tổng hợp kết quả, công bố đội thắng cuộc.

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  lượng giác vào #strong[thực tiễn] (Thực hiện ngoài giờ học trên lớp).
]
#nd-hd[
Học sinh phát hiện/đề xuất vấn đề thực tiễn.
  - #strong[Nhiệm vụ:] Tìm kiếm các ứng dụng thực tế của Giá trị lượng
    giác/Đơn vị Radian (ví dụ: mô tả chuyển động tuần hoàn, đo đạc góc
    phương vị trong hàng hải).
  - #strong[Tích hợp Năng lực số:] Yêu cầu học sinh #strong[tìm kiếm
    thông tin] (về thiết bị đo góc điện tử, hình ảnh vệ tinh) trên
    Internet để viết báo cáo.
]
#sp-hd[
Báo cáo (viết tay hoặc đánh máy) về một ứng dụng
  thực tiễn của lượng giác, có minh họa bằng hình ảnh/video.
]
#tc-hd[
  - GV giao nhiệm vụ về nhà (thực hiện trong tuần).
  - #strong[Tích hợp Năng lực số:] Học sinh #strong[khai thác và xử lý
    thông tin, dữ liệu số] (NL1) thông qua việc tìm kiếm tài liệu, hình
    ảnh, video trên Internet để phục vụ báo cáo.

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
