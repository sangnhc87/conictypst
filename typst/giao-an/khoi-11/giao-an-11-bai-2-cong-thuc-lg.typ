// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 2 Công thức LG",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nắm vững và vận dụng được các #strong[công thức cộng]
  ($s i n\(a plus.minus b\)$, $c o s\(a plus.minus b\)$,
  $t a n\(a plus.minus b\)$) để tính giá trị lượng giác, rút gọn biểu
  thức, chứng minh đẳng thức.
- Nắm vững và vận dụng được các #strong[công thức nhân đôi] ($sin 2 a$,
  $cos 2 a$, $tan 2 a$) để tính giá trị lượng giác và biến đổi biểu
  thức.
- Nắm vững và vận dụng được các #strong[công thức biến đổi tích thành
  tổng] và #strong[công thức biến đổi tổng thành tích] để giải quyết các
  bài toán liên quan.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm tòi, đọc sách giáo
    khoa, hoàn thành nhiệm vụ được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] Hợp tác hiệu quả với các
    thành viên trong nhóm, trình bày, thảo luận, bảo vệ ý kiến của mình,
    sử dụng ngôn ngữ Toán học chính xác.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống, đề xuất và lựa chọn giải pháp tối ưu để giải quyết các bài
    toán lượng giác.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực tư duy và lập luận toán học:] Quan sát, phân tích
    công thức, đưa ra lập luận để chứng minh các công thức phụ.
  - #strong[Năng lực mô hình hóa toán học:] Sử dụng công thức lượng giác
    để mô hình hóa một số vấn đề thực tiễn (nếu có).
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán:] Sử dụng máy
    tính cầm tay, phần mềm máy tính (ví dụ: GeoGebra, Desmos) để kiểm
    tra, tính toán giá trị lượng giác và vẽ đồ thị (Năng lực số).
- #strong[Năng lực số (theo Thông tư 02/2025/TT-BGDĐT):]
  - #strong[Tạo ra và tương tác với nội dung số:] Học sinh sử dụng phần
    mềm/ứng dụng để tạo sơ đồ tư duy (mindmap) tổng hợp các công thức
    lượng giác.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, không ngại
  khó khăn khi biến đổi biểu thức phức tạp.
- #strong[Trung thực:] Thẳng thắn nhìn nhận kết quả cá nhân và kết quả
  nhóm, trung thực trong việc kiểm tra, đánh giá.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ được giao, hoàn
  thành bài tập đúng hạn.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, bảng/bảng phụ, phiếu
  học tập.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Tập 1, Kết nối tri thức với cuộc sống).
  - Giấy A0/bút dạ (để làm sơ đồ tư duy/báo cáo nhóm).
  - #strong[Học liệu số:] Link bài giảng ngắn/video giới thiệu ứng dụng
    của lượng giác (chuẩn bị trước), các ứng dụng tạo sơ đồ tư duy trực
    tuyến (ví dụ: Coggle, MindMeister) hoặc phần mềm GeoGebra/Desmos.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "10 phút")
- #strong[Tên hoạt động:] Khởi động với tình huống thực tiễn
#mt-hd[
Tạo hứng thú, giúp học sinh nhận thấy nhu cầu
  cần thiết phải có công cụ (công thức) để tính giá trị lượng giác của
  các góc đặc biệt có thể phân tích thành tổng/hiệu của hai góc đặc biệt
  khác.
]
#nd-hd[
  - Giáo viên (GV) đưa ra câu hỏi: \"#strong[Làm thế nào để tính giá trị
    chính xác của] $cos 75^compose$ #strong[mà không dùng máy tính?]\"
  - Gợi ý: Hãy biểu diễn $75^compose$ dưới dạng tổng hoặc hiệu của hai
    góc đặc biệt đã biết (ví dụ: $45^compose + 30^compose$).
  - Nhiệm vụ: Học sinh làm việc cá nhân, sau đó thảo luận nhanh với bạn
    bên cạnh để đưa ra ý tưởng.
]
#sp-hd[
  - Xác định được vấn đề: Cần có một \"công thức cộng\" để tính
    $c o s\(45^compose + 30^compose\)$.
  - Dự kiến ý tưởng: $75^compose = 45^compose + 30^compose$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV đặt câu hỏi, yêu cầu học sinh ghi chép
    nhanh ý tưởng.
  - #strong[Thực hiện nhiệm vụ:] Học sinh suy nghĩ cá nhân (3 phút), sau
    đó trao đổi nhanh (2 phút).
  - #strong[Báo cáo, thảo luận:] GV mời 1-2 học sinh trình bày ý tưởng
    biểu diễn $75^compose$. GV nhận xét, dẫn dắt vào bài học mới:
    \"#strong[Để giải quyết vấn đề này, chúng ta cần tìm hiểu về Công
    thức lượng giác.]\"
  - #strong[Tích hợp Năng lực số:] (Nếu có thể) GV sử dụng #strong[máy
    chiếu] để hiển thị hình ảnh minh họa cho góc $75^compose$ hoặc một
    hình ảnh thực tế có liên quan đến góc này.

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "60 phút")
==== 2.1. Hoạt động thành phần 2.1: Công thức cộng (15 phút)
#mt-hd[
Hình thành và nắm vững các công thức cộng
  $c o s\(a plus.minus b\)$, $s i n\(a plus.minus b\)$,
  $t a n\(a plus.minus b\)$.
]
#nd-hd[
  - GV chia lớp thành 4 nhóm. Giao nhiệm vụ cho các nhóm #strong[tìm
    kiếm/nghiên cứu chứng minh] công thức $c o s\(a - b\)$ (có thể từ
    sách giáo khoa hoặc nguồn đã chuẩn bị). Từ đó, suy ra công thức
    $c o s\(a + b\)$, $s i n\(a plus.minus b\)$,
    $t a n\(a plus.minus b\)$.
  - #strong[Ví dụ minh họa:] Giải quyết vấn đề từ hoạt động 1:
    #strong[Tính] $cos 75^compose$ bằng công thức
    $c o s\(45^compose + 30^compose\)$.
]
#sp-hd[
Ghi chép các công thức cộng và lời giải chi tiết
  Ví dụ $cos 75^compose$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV phân công nhóm, giao phiếu học tập có tóm
    tắt kiến thức/câu hỏi gợi mở.
  - #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm, ghi chép và
    giải ví dụ. GV theo dõi, hỗ trợ, gợi ý cho các nhóm gặp khó khăn.
  - #strong[Báo cáo, thảo luận:] GV mời một nhóm trình bày công thức
    $c o s\(a + b\)$ và cách tính $cos 75^compose$. Các nhóm khác nhận
    xét, bổ sung.
  - #strong[Tích hợp Năng lực số:] Học sinh #strong[sử dụng máy tính cầm
    tay] để kiểm tra lại kết quả tính $cos 75^compose$ dưới dạng số thập
    phân, đối chiếu với kết quả tính theo công thức.

==== 2.2. Hoạt động thành phần 2.2: Công thức nhân đôi (15 phút)
]
#mt-hd[
Hình thành và nắm vững các công thức nhân đôi
  $sin 2 a$, $cos 2 a$, $tan 2 a$.
]
#nd-hd[
  - Nhiệm vụ: Dựa vào Công thức cộng vừa học, các nhóm tự suy luận và
    chứng minh các Công thức nhân đôi bằng cách cho $a = b$.
  - #strong[Ví dụ minh họa:] Cho $sin x = 3 / 5$ và $0 < x < pi / 2$.
    #strong[Tính] $cos 2 x$.
]
#sp-hd[
Các công thức nhân đôi đã được suy luận và lời
  giải chi tiết Ví dụ tính $cos 2 x$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV hướng dẫn: #strong[\"Hãy thay] $b = a$
    #strong[vào các công thức cộng vừa học để tìm ra công thức nhân
    đôi.\"]
  - #strong[Thực hiện nhiệm vụ:] Học sinh làm việc nhóm. GV quan sát và
    dự kiến khó khăn (học sinh quên tính $cos x$ trước khi tính
    $cos 2 x$), hỗ trợ bằng gợi ý.
  - #strong[Báo cáo, thảo luận:] GV mời một nhóm khác trình bày công
    thức $cos 2 a$ và giải Ví dụ.
  - #strong[Tích hợp Năng lực số:] Học sinh sử dụng ứng dụng
    #strong[Desmos/GeoGebra] (nếu có điều kiện) để vẽ đồ thị hàm số
    $y = c o s x$ và $y = c o s 2 x$ trên cùng hệ trục tọa độ để quan
    sát sự khác biệt (biểu hiện của #strong[Tạo ra và tương tác với nội
    dung số]).

==== 2.3. Hoạt động thành phần 2.3 & 2.4: Công thức biến đổi tích thành tổng & Tổng thành tích (30 phút)
]
#mt-hd[
Hình thành và nắm vững các công thức biến đổi
  tích thành tổng và tổng thành tích.
]
#nd-hd[
  - GV đưa ra mối liên hệ giữa Công thức cộng và Công thức biến đổi Tích
    thành Tổng.
  - Nhiệm vụ: #strong[\"Từ Công thức biến đổi Tích thành Tổng, hãy đặt]
    $x = a + b$ #strong[và] $y = a - b$ #strong[để suy ra Công thức biến
    đổi Tổng thành Tích.\"] (Làm việc nhóm).
  - #strong[Ví dụ minh họa (Tích thành Tổng):] #strong[Rút gọn biểu
    thức] $A = 2 cos 3 x sin 2 x - s i n 5 x$#strong[.]
  - #strong[Ví dụ minh họa (Tổng thành Tích):] #strong[Phân tích thành
    tích biểu thức] $B = s i n x + s i n 3 x + s i n 5 x$#strong[.] (Áp
    dụng công thức Tổng thành Tích hai lần).
]
#sp-hd[
Các công thức biến đổi và lời giải chi tiết hai
  Ví dụ minh họa.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Chia lại thành 2 nhóm lớn (Tích thành Tổng
    và Tổng thành Tích), yêu cầu hoàn thành nhiệm vụ và giải ví dụ.
  - #strong[Thực hiện nhiệm vụ:] Học sinh tích cực làm việc nhóm. GV
    theo dõi, nhắc nhở về tầm quan trọng của các công thức này trong
    việc giải phương trình lượng giác.
  - #strong[Báo cáo, thảo luận:] Mời đại diện hai nhóm trình bày kết quả
    và lời giải. Tổ chức trò chơi học tập nhỏ (ví dụ: #strong[\"Ai nhanh
    hơn\"] - đố công thức) để củng cố.
  - #strong[Tích hợp Năng lực số:] Học sinh #strong[sử dụng điện
    thoại/máy tính cá nhân] để tra cứu nhanh nguồn gốc hoặc ứng dụng của
    các công thức này trong thực tiễn (biểu hiện của #strong[Tìm kiếm,
    chọn lọc và đánh giá thông tin số]).

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
Vận dụng thành thạo các công thức đã học để giải
  quyết các bài tập cơ bản và nâng cao kỹ năng biến đổi lượng giác.
]
#nd-hd[
  - GV giao hệ thống 3-4 bài tập bao gồm:
    #block[
    #set enum(numbering: "i.", start: 1)
    + Tính giá trị biểu thức (Ví dụ: Tính $tan 105^compose$).
    + Rút gọn biểu thức (Ví dụ: Rút gọn
      $C = frac(sin 2 x, 1 + c o s 2 x)$).
    + Chứng minh đẳng thức (Ví dụ: Chứng minh
      $sin^2 a = frac(1 - c o s 2 a, 2)$).
    ]
  - Phương pháp: Luyện tập theo hình thức #strong[\"Học tập hợp tác -
    Chuyên gia\"] (mỗi nhóm chọn 1-2 bài, sau đó trình bày).
]
#sp-hd[
Lời giải chi tiết và chính xác cho các bài tập.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV giao bài tập, chia nhóm.
  - #strong[Thực hiện nhiệm vụ:] Học sinh làm việc cá nhân và sau đó
    thảo luận nhóm để kiểm tra, thống nhất lời giải. GV khuyến khích học
    sinh dùng nhiều cách giải khác nhau.
  - #strong[Báo cáo, thảo luận:] Mời đại diện các nhóm lên trình bày lời
    giải trên bảng/máy chiếu (hoặc sử dụng ứng dụng viết bảng điện tử
    nếu có). GV nhận xét, đánh giá và chốt kiến thức.
  - #strong[Tích hợp Năng lực số:] Học sinh #strong[sử dụng máy tính cá
    nhân] để tạo #strong[Sơ đồ tư duy (Mindmap)] tổng hợp toàn bộ các
    công thức lượng giác vừa học. (Biểu hiện của #strong[Tạo ra và tương
    tác với nội dung số]).

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
Phát triển năng lực vận dụng kiến thức vào thực
  tiễn, tạo điều kiện cho học sinh tự học, tự nghiên cứu.
]
#nd-hd[
  - #strong[Nhiệm vụ về nhà:] Tìm kiếm một ứng dụng thực tế của Công
    thức lượng giác (ví dụ: trong vật lí (dao động điều hòa), trong kiến
    trúc, trong thiên văn học).
  - Yêu cầu: Viết một đoạn văn ngắn (hoặc tạo một slide/ảnh) mô tả vấn
    đề và công thức đã được áp dụng.
]
#sp-hd[
Báo cáo dưới dạng văn bản/slide/ảnh về ứng dụng
  thực tế.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV giao nhiệm vụ, nhấn mạnh việc thực hiện
    ngoài giờ học trên lớp.
  - #strong[Thực hiện nhiệm vụ:] Học sinh thực hiện tại nhà và nộp báo
    cáo qua email/Hệ thống Quản lí học tập (LMS).
  - #strong[Tích hợp Năng lực số:] Học sinh #strong[sử dụng Internet] để
    tìm kiếm thông tin và #strong[sử dụng phần mềm soạn thảo/trình
    chiếu] để tạo báo cáo và gửi qua kênh số. (Thể hiện rõ #strong[Tìm
    kiếm, chọn lọc, đánh giá thông tin số] và #strong[Tạo ra và tương
    tác với nội dung số]).

#figure(
  align(center)[#table(
    columns: (32.22%, 45.62%),
    align: (auto,auto,),
    table.header(table.cell(align: left)[], table.cell(align: left)[Duyệt
      Kế hoạch bài dạy

      của tổ Khoa học tự nhiên

      Ngày \...... tháng \...... năm \......

      ],),
    table.hline(),
  )]
  , kind: table
  )

]
