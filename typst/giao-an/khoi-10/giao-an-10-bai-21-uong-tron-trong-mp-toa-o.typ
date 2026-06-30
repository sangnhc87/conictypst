// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 21 Đường tròn trong MP toạ độ",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được định nghĩa và các yếu tố xác định đường tròn.
- Thiết lập được #strong[phương trình chính tắc] và #strong[phương trình
  tổng quát] của đường tròn.
- Viết được phương trình tiếp tuyến của đường tròn tại một điểm thuộc
  đường tròn hoặc khi biết các yếu tố xác định khác.
- Nhận dạng được phương trình tổng quát của đường tròn và xác định được
  tâm, bán kính từ phương trình đó.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động, tích cực tìm hiểu kiến thức về
    đường tròn; tự đánh giá được mức độ hoàn thành nhiệm vụ cá nhân.
  - #strong[Giao tiếp và hợp tác:] Tích cực tham gia thảo luận nhóm,
    biết lắng nghe, chia sẻ và trình bày ý kiến rõ ràng khi báo cáo kết
    quả.
  - #strong[Giải quyết vấn đề và sáng tạo:] Biết phát hiện và giải quyết
    các vấn đề liên quan đến đường tròn.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực mô hình hoá toán học:] Thiết lập được mô hình toán
    học (phương trình đường tròn, phương trình tiếp tuyến) cho các tình
    huống thực tiễn đơn giản.
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng linh hoạt các
    công thức để giải quyết các dạng bài tập về viết phương trình đường
    tròn và tiếp tuyến.
  - #strong[Năng lực sử dụng công cụ, phương tiện toán học (Tích hợp
    Năng lực số):] #strong[Sử dụng phần mềm Geogebra] hoặc máy tính cầm
    tay để kiểm tra kết quả, vẽ đồ thị minh họa hoặc mô hình hóa các bài
    toán về đường tròn.
- #strong[Năng lực số (Biểu hiện theo TT 02/2025/TT-BGDĐT):]
  - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
  - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
    tin và nội dung trong môi trường số.
  - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin
    và nội dung này cũng như điều hướng giữa chúng.
  - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, nghiêm túc thực hiện các nhiệm vụ cá nhân
  và nhóm, hoàn thành bài tập được giao.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong nhóm, chủ động giúp đỡ
  bạn bè cùng tiến bộ; cẩn thận, chính xác khi tính toán và trình bày.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính/laptop, màn hình TV,
  bảng phụ.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 - Kết nối tri thức với cuộc sống.
  - Phiếu học tập (cho HĐ 1, HĐ 3).
  - Thước kẻ, compa, giấy A4, bút màu (cho hoạt động vẽ/sơ đồ tư duy).
  - #strong[Tích hợp Năng lực số:] Phần mềm #strong[Geogebra] (cài đặt
    sẵn trên máy tính hoặc sử dụng bản online), tài liệu điện tử (video,
    file pdf) về ứng dụng của đường tròn trong thực tế.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "Đường tròn trong kiến trúc và cuộc sống")
#mt-hd[
  quyết: #strong[Làm thế nào để xác định được vị trí và kích thước của
  đường tròn bằng công cụ toán học?] Khơi gợi hứng thú học tập thông qua
  tình huống thực tế.
]
#nd-hd[
  - GV chiếu một số hình ảnh về đường tròn trong thực tế (bánh xe, cầu
    vòm, thiết kế logo, mặt đồng hồ...) và trong kiến trúc (đấu trường
    La Mã, cửa sổ vòm). \* #strong[Nhiệm vụ:] HS làm việc cá nhân/nhóm
    đôi, thảo luận và trả lời câu hỏi:
    #block[
    #set enum(numbering: "i.", start: 1)
    + Nêu định nghĩa và các yếu tố cơ bản xác định một đường tròn.
    + Làm thế nào để xác định vị trí của một điểm trên mặt phẳng toạ độ?
    + Hãy đề xuất một cách thức để mô tả một đường tròn (tâm, bán kính)
      bằng ngôn ngữ toán học gắn với hệ toạ độ $O x y$.
    ]
]
#sp-hd[
  - Định nghĩa đúng về đường tròn (tập hợp các điểm cách đều tâm
    $I\(a\;b\)$ một khoảng $R$).
  - Xác định được các yếu tố cần thiết: #strong[Tâm] $I$ và #strong[bán
    kính] $R$.
  - Đề xuất được phương án (hoặc công thức) tính khoảng cách giữa hai
    điểm trong mặt phẳng toạ độ.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình bày hình ảnh, đặt
    câu hỏi, phát phiếu học tập.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận (2 phút). GV theo
    dõi, hỗ trợ, gợi ý HS nhớ lại kiến thức cũ về khoảng cách giữa hai
    điểm.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 HS đại diện trình
    bày kết quả.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa khái niệm, nhấn
    mạnh lại hai yếu tố cơ bản (Tâm $I\(a\;b\)$, bán kính $R$) và giới
    thiệu đây chính là cơ sở để xây dựng Phương trình đường tròn.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "Các dạng Phương trình đường tròn và Phương trình tiếp tuyến")
==== 2.1. Hoạt động thành phần 2.1: Phương trình đường tròn (Phương trình chính tắc và Phương trình tổng quát)
#mt-hd[
  trình chính tắc và phương trình tổng quát của đường tròn.
]
#nd-hd[
  - #strong[Nhiệm vụ 1 (Cá nhân/Nhóm đôi):] Từ kết quả HĐ 1 (khoảng
    cách), HS thiết lập công thức biểu thị tập hợp các điểm $M\(x\;y\)$
    cách tâm $I\(a\;b\)$ một khoảng $R$.

  - #quote(block: true)[
    #strong[Ví dụ 1:] Cho đường tròn $\(C\)$ có tâm $I\(2\;- 1\)$ và bán
    kính $R = 3$. Hãy viết phương trình đường tròn $\(C\)$.
    ]

  - #strong[Nhiệm vụ 2 (Cá nhân):] Khai triển phương trình chính tắc vừa
    tìm được để đưa về dạng tổng quát
    $x^2 + y^2 - 2 a x - 2 b y + c = 0$ và rút ra điều kiện để phương
    trình này là phương trình đường tròn.

  - #quote(block: true)[
    #strong[Ví dụ 2:] Cho phương trình: $x^2 + y^2 - 4 x + 6 y - 3 = 0$.
    Hỏi đây có phải là phương trình đường tròn không? Nếu có, hãy xác
    định tâm và bán kính.
    ]
]
#sp-hd[
  - #strong[Phương trình chính tắc:] $\(x - a\)^2+\(y - b\)^2= R^2$.
  - #strong[Phương trình tổng quát:]
    $x^2 + y^2 - 2 a x - 2 b y + c = 0$, với điều kiện
    $a^2 + b^2 - c > 0$ và $R = sqrt(a^2 + b^2 - c)$.
  - #strong[Ví dụ 1:] $\(x - 2\)^2+\(y + 1\)^2= 9$.
  - #strong[Ví dụ 2:] Là phương trình đường tròn, Tâm $I\(2\;- 3\)$,
    $R = sqrt(2^2 +\(- 3\)^2-\(- 3\)) = sqrt(16) = 4$.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV đặt vấn đề từ HĐ 1, yêu
    cầu HS thực hiện Nhiệm vụ 1.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc (5 phút). GV theo
    dõi, hướng dẫn (gợi ý công thức khoảng cách $I M = R$).
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời HS báo cáo kết quả Nhiệm vụ
    1 (Phương trình chính tắc). GV chuẩn hóa kiến thức. GV giao Nhiệm vụ
    2 (khai triển và xác định điều kiện).
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt lại công thức PT chính
    tắc, PT tổng quát, và điều kiện để một phương trình là phương trình
    đường tròn.

==== 2.2. Hoạt động thành phần 2.2: Phương trình tiếp tuyến của đường tròn
]
#mt-hd[
  của đường tròn tại một điểm thuộc đường tròn (dạng cơ bản nhất) dựa
  trên tính chất vuông góc.
]
#nd-hd[
  - #strong[Nhiệm vụ (Nhóm):] Nhắc lại tính chất của tiếp tuyến $d$ tại
    tiếp điểm $M$ với đường tròn tâm $I$. (Tiếp tuyến $d$ vuông góc với
    bán kính $I M$ tại $M$). Từ đó, áp dụng công thức phương trình đường
    thẳng đi qua một điểm và có Véc-tơ pháp tuyến, viết phương trình
    tiếp tuyến.

  - #quote(block: true)[
    #strong[Ví dụ 3:] Viết phương trình tiếp tuyến $Delta$ của đường
    tròn $\(C\):\(x - 1\)^2+\(y + 2\)^2= 25$ tại điểm $M\(5\;1\)$ thuộc
    đường tròn.
    ]
]
#sp-hd[
  - Tính chất: $Delta perp I M$ tại $M$. $accent(I M, ⃗)$ là Véc-tơ pháp
    tuyến của $Delta$.
  - #strong[Ví dụ 3:] Tâm $I\(1\;- 2\)$.
    $accent(I M, ⃗) =\(5 - 1\;1 -\(- 2\)\)=\(4\;3\)$. PT tiếp tuyến
    $Delta$ có dạng:
    $4\(x - 5\)+ 3\(y - 1\)= 0 arrow.l.r.double 4 x + 3 y - 23 = 0$.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình bày tính chất của
    tiếp tuyến và yêu cầu HS thực hiện Nhiệm vụ 3.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc nhóm (7 phút). GV
    theo dõi, hướng dẫn (gợi ý về Véc-tơ pháp tuyến).
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời một nhóm lên trình bày
    kết quả giải Ví dụ 3.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa công thức và
    phương pháp viết phương trình tiếp tuyến tại một điểm thuộc đường
    tròn.

]
#hd("3", "Luyện tập", "Trò chơi học tập/Sơ đồ tư duy")
#mt-hd[
  tròn và tiếp tuyến đã học; củng cố kĩ năng tính toán, phân tích thông
  tin.
]
#nd-hd[
  - #strong[Hoạt động 3.1: Thử thách đội nhóm (Trò chơi học tập)]
    - GV chuẩn bị 4-5 bài tập trắc nghiệm/tự luận ngắn về: (1) Viết PT
      đường tròn đi qua 3 điểm/qua tâm và tiếp xúc, (2) Nhận dạng PT
      đường tròn và tìm tâm/bán kính, (3) Viết PT tiếp tuyến.
    - HS làm việc theo nhóm 4-5 người, giải các bài tập.
  - #strong[Hoạt động 3.2: Sơ đồ tư duy (Tích hợp Năng lực số - Khai
    thác thông tin số)]
    - #strong[Nhiệm vụ:] Sau khi giải bài tập, nhóm sử dụng phần mềm
      (VD: Mindmap, Canva) hoặc vẽ tay để hệ thống hóa kiến thức bài học
      thành #strong[Sơ đồ tư duy] với các nhánh chính: #strong[Định
      nghĩa] $arrow.r$ #strong[PT Chính tắc] $arrow.r$ #strong[PT Tổng
      quát] $arrow.r$ #strong[PT Tiếp tuyến].
]
#sp-hd[
  - Lời giải đúng, nhanh các bài tập luyện tập.
  - Bản #strong[Sơ đồ tư duy] logic, khoa học, thể hiện mối liên hệ giữa
    các khái niệm.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV giao các bài tập (Hoạt
    động 3.1) và yêu cầu thiết kế Sơ đồ tư duy (Hoạt động 3.2).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Nhóm thực hiện (15 phút). GV
    quan sát, theo dõi, hỗ trợ, đôn đốc.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 nhóm nhanh/tốt nhất
    trình bày lời giải bài tập (sử dụng máy chiếu để hiển thị) và thuyết
    trình về Sơ đồ tư duy của nhóm. (Khuyến khích sử dụng công cụ số để
    trình bày).
  - #strong[Bước 4: Kết luận, nhận định:] GV tổng kết, khen ngợi và
    chuẩn hóa lại kiến thức một lần nữa thông qua Sơ đồ tư duy của HS.

]
#hd("4", "Vận dụng", "Tích hợp Năng lực số - Sử dụng công cụ số")
#mt-hd[
  kĩ năng sử dụng công cụ số để mô hình hóa toán học.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Vận dụng kiến thức đường tròn để giải quyết tình
    huống sau (Giao về nhà):

  - #quote(block: true)[
    #strong[Ví dụ 4 (Thực tiễn):] Một trạm phát sóng điện thoại di động
    được đặt tại vị trí có toạ độ $I\(3\;4\)$ trong mặt phẳng toạ độ
    $O x y$. Bán kính vùng phủ sóng là $5$ đơn vị (coi mỗi đơn vị là $1$
    km).
    ]

    #block[
    #set enum(numbering: "i.", start: 1)
    + Viết phương trình đường tròn biểu diễn ranh giới vùng phủ sóng.
    + Sử dụng phần mềm #strong[Geogebra] để vẽ hình minh họa vùng phủ
      sóng và xác định xem nhà bạn (biết toạ độ) có nằm trong vùng phủ
      sóng không.
    ]
]
#sp-hd[
  - #strong[Phương trình:] $\(x - 3\)^2+\(y - 4\)^2= 25$.
  - Hình vẽ minh họa trên phần mềm #strong[Geogebra] và kết luận về vị
    trí nhà.
  - Báo cáo giải quyết tình huống (có thể là hình ảnh chụp màn hình
    Geogebra).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV giao nhiệm vụ (Ví dụ 4)
    và hướng dẫn sơ bộ cách sử dụng Geogebra để vẽ đồ thị đường tròn (có
    thể chiếu nhanh video hướng dẫn).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thực hiện ngoài giờ học trên
    lớp. (Tăng cường năng lực tự học và năng lực số).
  - #strong[Bước 3: Báo cáo, thảo luận:] HS nộp báo cáo (hình ảnh
    Geogebra + lời giải) qua email hoặc nền tảng học tập của trường. GV
    chọn lọc một số sản phẩm tốt để trao đổi, chia sẻ và đánh giá vào
    đầu tiết học tiếp theo.

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
