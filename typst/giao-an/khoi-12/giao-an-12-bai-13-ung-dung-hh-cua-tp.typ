// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 13 Ứng dụng HH của TP",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
Học sinh:

- Nêu được công thức tính diện tích hình phẳng giới hạn bởi đồ thị một
  hàm số, đồ thị hai hàm số, trục hoành và các đường thẳng.
- Nêu được công thức tính thể tích vật thể và thể tích khối tròn xoay
  khi quay hình phẳng giới hạn bởi đồ thị hàm số quanh trục $O x$.
- Vận dụng được các công thức để giải các bài toán thực tiễn đơn giản
  liên quan đến diện tích và thể tích.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm hiểu, khám phá các khái niệm
    và công thức về ứng dụng tích phân.
  - #strong[Giao tiếp và hợp tác:] Tích cực thảo luận, làm việc nhóm để
    giải quyết các nhiệm vụ học tập, báo cáo và thuyết trình kết quả.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống, đề
    xuất phương án và giải quyết các bài toán ứng dụng thực tiễn của
    tích phân.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Phát hiện, lập luận
    và chứng minh các công thức tính diện tích, thể tích.
  - #strong[Năng lực mô hình hoá toán học:] Thiết lập mô hình toán học
    (công thức tích phân) để giải quyết các vấn đề thực tiễn.
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng linh hoạt các
    công thức tích phân để tính diện tích hình phẳng, thể tích vật thể
    và khối tròn xoay.
- #strong[Năng lực số (Theo TT 02/2025/TT-BGDĐT):]
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực hoàn thành các nhiệm vụ học tập được giao,
  không ngại khó khi giải quyết các bài toán vận dụng thực tế.
- #strong[Trung thực:] Thể hiện sự trung thực trong quá trình làm bài
  tập, báo cáo kết quả và thảo luận nhóm.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ được giao trong
  nhóm, hoàn thành đúng thời hạn, biết lắng nghe và tôn trọng ý kiến
  người khác.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính có kết nối
  Internet, máy tính cầm tay (CASIO/VINACAL), phiếu học tập, bộ thẻ/trò
  chơi học tập.
- #strong[Học liệu:] Sách giáo khoa Toán 12 (Kết nối tri thức), tài
  liệu/video giới thiệu ứng dụng tích phân trong thực tiễn (ví dụ: xây
  cầu, kiến trúc), phần mềm GeoGebra hoặc Desmos.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
#mt-hd[
Tạo hứng thú, giúp học sinh xác định được vấn đề
  thực tiễn cần giải quyết bằng công cụ tích phân, từ đó hình thành nhu
  cầu tìm hiểu kiến thức mới.
]
#nd-hd[
Giáo viên trình chiếu #strong[tình huống thực
  tiễn] (ví dụ: một bản thiết kế cổng trường học có hình parabol, yêu
  cầu tính diện tích để lát gạch, hoặc hình ảnh một con đập chắn nước có
  mặt cắt dạng hình giới hạn bởi đồ thị hàm số).
  - #strong[Nhiệm vụ:] Quan sát hình ảnh, thảo luận nhóm 2-3 người và đề
    xuất ý tưởng/phương pháp để tính diện tích/thể tích của vật thể/hình
    phẳng trong tình huống đó.
]
#sp-hd[
  - Các ý tưởng/phương pháp tính toán sơ bộ của học sinh (có thể là:
    chia nhỏ hình thành các hình cơ bản, dùng công cụ đo lường, hay sử
    dụng kiến thức hàm số).
  - Học sinh nhận thấy được hạn chế của các phương pháp đã biết và nhu
    cầu cần có một công cụ toán học mạnh mẽ hơn (chính là tích phân) để
    giải quyết.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV chiếu tình huống, yêu
    cầu HS thảo luận nhóm và ghi kết quả vào phiếu học tập.
  - #strong[Bước 2: Thực hiện nhiệm vụ (5 phút):] HS thảo luận, GV quan
    sát, khuyến khích HS sử dụng cả kiến thức hình học và hàm số đã học
    để đề xuất.
  - #strong[Bước 3: Báo cáo, thảo luận (5 phút):] GV mời đại diện 2-3
    nhóm trình bày nhanh ý tưởng. GV nhận xét, dẫn dắt: \"Để giải quyết
    các vấn đề này một cách chính xác và tổng quát, chúng ta sẽ cần đến
    một công cụ toán học mạnh mẽ hơn, đó chính là #strong[Ứng dụng hình
    học của tích phân]\.\"

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "110 phút")
Hoạt động này được chia thành 4 hoạt động thành phần.

==== 2.1. Ứng dụng của tích phân để tính diện tích hình phẳng giới hạn bởi đồ thị một hàm số (25 phút)
#mt-hd[
Hình thành công thức và biết cách tính diện tích
  hình phẳng giới hạn bởi $y = f\(x\)$, trục $O x$ và các đường
  $x = a\,x = b$.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] Học sinh làm việc với SGK và tài liệu để nghiên
    cứu khái niệm và công thức tính diện tích hình phẳng. \* #strong[Ví
    dụ:] Tính diện tích hình phẳng giới hạn bởi đồ thị hàm số
    $y = x^2 - 4$, trục $O x$ và hai đường thẳng $x = 1\,x = 3$.
]
#sp-hd[
Công thức tính diện tích
  $S = integral_a^b\|f\(x\)\|d x$ và lời giải ví dụ.
]
#tc-hd[
  - #strong[Tích hợp năng lực số:] GV khuyến khích HS sử dụng phần mềm
    #strong[GeoGebra] để vẽ đồ thị hàm số $y = x^2 - 4$ và trực quan hóa
    diện tích cần tính. (Biểu hiện năng lực số: Sử dụng công cụ số để
    trực quan hóa, kiểm tra kết quả.)
  - GV tổ chức cho HS làm việc cá nhân, sau đó kiểm tra kết quả bằng máy
    tính cầm tay.

==== 2.2. Ứng dụng của tích phân để tính diện tích hình phẳng giới hạn bởi đồ thị hai hàm số (30 phút)
]
#mt-hd[
Hình thành công thức và biết cách tính diện tích
  hình phẳng giới hạn bởi $y = f\(x\)$ và $y = g\(x\)$.
]
#nd-hd[
  - #strong[Nhiệm vụ 2:] Thảo luận nhóm 4, dựa trên công thức đã học
    (2.1), đề xuất cách suy luận để hình thành công thức tính diện tích
    hình phẳng giới hạn bởi $y = f\(x\)$ và $y = g\(x\)$. \* #strong[Ví
    dụ:] Tính diện tích hình phẳng giới hạn bởi hai đồ thị hàm số
    $y = - x^2 + 4 x$ và $y = x$.
]
#sp-hd[
Công thức tính diện tích
  $S = integral_a^b\|f\(x\)- g\(x\)\|d x$ và lời giải ví dụ (bao gồm cả
  bước tìm cận $a\,b$).
]
#tc-hd[
  - Sử dụng phương pháp #strong[Sơ đồ tư duy/Bản đồ khái niệm] (Concept
    Map) để nhóm báo cáo mối liên hệ giữa hai công thức (2.1 và 2.2).
    (Tăng cường kĩ năng phân tích và tổng hợp thông tin.)

==== 2.3. Ứng dụng tích phân để tính thể tích vật thể (25 phút)
]
#mt-hd[
Hình thành công thức tính thể tích vật thể khi
  biết diện tích mặt cắt ngang $S\(x\)$.
]
#nd-hd[
  - #strong[Nhiệm vụ 3:] GV giới thiệu về nguyên lí Cavalieri và công
    thức thể tích vật thể. HS nghiên cứu cách xác định diện tích mặt cắt
    $S\(x\)$.
  - #strong[Ví dụ:] Một vật thể nằm giữa hai mặt phẳng $x = 0$ và
    $x = 2$. Thiết diện của vật thể bị cắt bởi mặt phẳng vuông góc với
    trục $O x$ tại hoành độ $x$ là một hình vuông có độ dài cạnh bằng
    $x^2 + 1$. Tính thể tích của vật thể đó.
]
#sp-hd[
Công thức thể tích $V = integral_a^b S\(x\)d x$
  và lời giải ví dụ $V = integral_0^2\(x^2 + 1\)^2d x$.
]
#tc-hd[
HS làm việc nhóm nhỏ để giải ví dụ. GV
  nhấn mạnh vai trò của việc xác định đúng hàm diện tích mặt cắt
  $S\(x\)$.

==== 2.4. Ứng dụng tích phân để tính thể tích khối tròn xoay (30 phút)
]
#mt-hd[
Hình thành công thức tính thể tích khối tròn
  xoay khi quay hình phẳng quanh trục $O x$.
]
#nd-hd[
  - #strong[Nhiệm vụ 4:] Liên hệ từ công thức thể tích vật thể (2.3) để
    suy ra công thức thể tích khối tròn xoay (trong trường hợp mặt cắt
    là hình tròn bán kính $R\(x\)=\|f\(x\)\|$). \* #strong[Ví dụ:] Tính
    thể tích khối tròn xoay sinh ra khi quay hình phẳng giới hạn bởi đồ
    thị hàm số $y = sqrt(x)$, trục $O x$ và đường thẳng $x = 4$ quanh
    trục $O x$.
]
#sp-hd[
Công thức thể tích khối tròn xoay
  $V = pi integral_a^b\[f\(x\)\]^2d x$ và lời giải ví dụ.
]
#tc-hd[
  - #strong[Tích hợp năng lực số:] GV sử dụng một video/mô phỏng 3D trên
    máy tính để trực quan hóa sự hình thành khối tròn xoay. (Biểu hiện
    năng lực số: Tiếp cận và khai thác thông tin đa phương tiện).
  - GV tổ chức cho HS thuyết trình cách suy luận từ công thức tổng quát
    về thể tích vật thể sang công thức thể tích khối tròn xoay.

]
#hd("3", "Luyện tập", "40 phút")
#mt-hd[
Vận dụng kiến thức đã học để rèn luyện kĩ năng
  tính toán và giải quyết đa dạng các dạng bài tập cơ bản.
]
#nd-hd[
Hệ thống các bài tập trắc nghiệm và tự luận về
  cả 4 dạng ứng dụng đã học:
  - Bài tập 1: Tính diện tích hình phẳng giới hạn bởi $y = x^3 - 3 x^2$
    và trục $O x$.
  - Bài tập 2: Tính diện tích hình phẳng giới hạn bởi $y = s i n x$ và
    $y = c o s x$ trên đoạn $\[0\,pi\/2\]$.
  - Bài tập 3: Bài toán thực tế về tính thể tích một bể chứa nước có mặt
    cắt theo một hàm số cho trước.
  - Bài tập 4: Tính thể tích vật thể tròn xoay khi quay miền giới hạn
    bởi $y = e^x$, $x = 0\,x = 1$ quanh trục $O x$.
]
#sp-hd[
Đáp án và lời giải chính xác cho các bài tập.
]
#tc-hd[
  - #strong[Trò chơi học tập:] Tổ chức trò chơi #strong[\"Tiếp sức Toán
    học\"] hoặc #strong[\"Đường đua công thức\"] theo nhóm.
  - Mỗi nhóm cử đại diện lên bảng giải nhanh các bài tập.
  - #strong[Tích hợp năng lực số:] Khuyến khích HS sử dụng máy tính cầm
    tay để kiểm tra nhanh kết quả tích phân (phát triển năng lực tính
    toán và kiểm tra bằng công cụ số).

]
#hd("4", "Vận dụng", "15 phút")
#mt-hd[
Phát triển năng lực mô hình hóa, giải quyết vấn
  đề thực tiễn thông qua nhiệm vụ vận dụng kiến thức, kĩ năng vào cuộc
  sống.
]
#nd-hd[
Mô tả rõ yêu cầu học sinh thực hiện nhiệm vụ:
  - #strong[Nhiệm vụ:] Tìm một tình huống thực tế (ví dụ: một chi tiết
    máy, một kiến trúc, một đồ vật) mà diện tích hoặc thể tích của nó có
    thể được mô tả và tính toán bằng công thức tích phân.
  - #strong[Yêu cầu:] Mô tả tình huống, xây dựng hàm số mô hình hoá,
    thiết lập công thức tích phân và tính toán (hoặc ước tính) kết quả.
]
#sp-hd[
  - Báo cáo (dạng bài thuyết trình PowerPoint/bản viết/video clip) về
    việc phát hiện và giải quyết tình huống/vấn đề trong thực tiễn.
]
#tc-hd[
  - #strong[Giao nhiệm vụ ngoài giờ học trên lớp:] Giao cho học sinh
    thực hiện trong 1 tuần.
  - #strong[Nộp báo cáo:] Học sinh nộp sản phẩm qua email/Google Drive
    hoặc nền tảng học tập của trường.
  - #strong[Tích hợp năng lực số:] Việc thu thập hình ảnh, thông tin,
    xây dựng mô hình trên phần mềm (GeoGebra, phần mềm trình chiếu), và
    nộp sản phẩm trực tuyến là biểu hiện rõ nét của #strong[Năng lực số]
    (Sử dụng công nghệ số để sáng tạo sản phẩm, chia sẻ thông tin).

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
