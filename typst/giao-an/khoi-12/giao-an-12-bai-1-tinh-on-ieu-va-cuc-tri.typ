// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 1 Tính đơn điệu và cực trị",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[tính đơn điệu] của hàm số (đồng biến,
  nghịch biến) trên một khoảng.
- Nêu được #strong[khái niệm cực trị] của hàm số (cực đại, cực tiểu).
- Nắm vững mối liên hệ giữa #strong[đạo hàm cấp một] với tính đơn điệu
  của hàm số (Định lí 1 và Định lí 2).
- Biết cách #strong[sử dụng bảng biến thiên] để xét tính đơn điệu của
  hàm số.
- Nắm vững #strong[quy tắc 1] để tìm cực trị của hàm số.
- \(Mở rộng) Nắm vững #strong[quy tắc 2] để tìm cực trị của hàm số (tùy
  theo phân phối chương trình).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù (Năng lực Tư duy và lập luận toán học):]
  - Thực hiện được các thao tác tìm tập xác định, tính đạo hàm, lập bảng
    biến thiên để #strong[xét tính đơn điệu] và #strong[tìm cực trị] của
    các hàm đa thức, hàm phân thức đơn giản.
  - Vận dụng được các kiến thức về tính đơn điệu và cực trị để
    #strong[giải quyết các bài toán liên quan].
- #strong[Năng lực chung (Năng lực Giải quyết vấn đề và sáng tạo):]
  - Phân tích, tổng hợp thông tin từ đồ thị, bảng biến thiên để phát
    hiện và giải quyết vấn đề.
  - Đề xuất được các phương án giải quyết vấn đề trong học tập và thực
    tiễn (Ví dụ: tìm vị trí tối ưu, giá trị lớn nhất/nhỏ nhất).
- #strong[Năng lực số] (Tích hợp theo Thông tư số 02/2025/TT-BGDĐT):
  - Sử dụng được các #strong[phần mềm toán học] (ví dụ: GeoGebra,
    Desmos) để #strong[vẽ đồ thị] hàm số, kiểm chứng tính đơn điệu và
    cực trị (biểu hiện: #strong[Sử dụng công nghệ số]).
  - Tìm kiếm, chọn lọc và xử lý thông tin số (ví dụ: tài liệu, video
    hướng dẫn) liên quan đến bài học để #strong[tự học] và #strong[hoàn
    thành nhiệm vụ nhóm] (biểu hiện: #strong[Khai thác và xử lý thông
    tin số]).

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, tự giác hoàn thành các nhiệm vụ học tập
  được giao, đặc biệt là các bài tập luyện tập và vận dụng.
- #strong[Trách nhiệm:] Có tinh thần hợp tác, trách nhiệm trong hoạt
  động nhóm, chủ động chia sẻ, đóng góp ý kiến để cùng hoàn thành sản
  phẩm chung.
- #strong[Trung thực:] Thể hiện thái độ trung thực trong việc làm bài,
  kiểm tra, báo cáo kết quả thực hành.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính giáo viên, bảng
  phụ/giấy A0, phiếu học tập, bộ đếm thời gian (timer).
- #strong[Học liệu:]
  - Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc sống).
  - Phần mềm vẽ đồ thị #strong[GeoGebra/Desmos] (cài đặt sẵn trên máy
    tính, sử dụng trên điện thoại/máy tính bảng của học sinh nếu có).
  - Bài giảng điện tử/Slide trình chiếu.
  - Link/Mã QR dẫn đến bài tập trắc nghiệm tương tác (ví dụ: Kahoot,
    Quizizz) để luyện tập củng cố.
  - Tài liệu thực tiễn (các ví dụ về tối ưu hóa trong kinh tế, vật lí).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#muc("1", "KIẾN THỨC")
==== a) Mục tiêu
- Giúp học sinh #strong[ôn lại kiến thức cũ] về đạo hàm, đồ thị hàm số
  và xác định được #strong[vấn đề] cần giải quyết: làm thế nào để biết
  hàm số \"lên\" hay \"xuống\" và đạt \"đỉnh\" hay \"đáy\" mà không cần
  vẽ đồ thị.
- Tạo hứng thú và kết nối kiến thức cũ với kiến thức mới.

==== b) Nội dung
- #strong[Nhiệm vụ 1 (Thực tiễn):] Giáo viên chiếu hình ảnh một chiếc
  cầu vòm (ví dụ: cầu Nhật Tân) hoặc biểu đồ giá cổ phiếu/doanh thu một
  công ty có đường cong lên - xuống.
  - #strong[Câu hỏi:] Hình ảnh/biểu đồ này mô tả sự thay đổi của đại
    lượng nào? (Chiều cao/giá trị). Dựa vào hình ảnh, em nhận thấy sự
    thay đổi có những đoạn nào đang đi lên/đi xuống, và đâu là điểm cao
    nhất/thấp nhất?
- #strong[Nhiệm vụ 2 (Toán học):] Cho hàm số $y = x^3 - 3 x + 1$ và đồ
  thị của nó.
  - #strong[Yêu cầu:] Hãy quan sát đồ thị và chỉ ra trên khoảng nào thì
    đồ thị đi lên (hàm đồng biến), khoảng nào đồ thị đi xuống (hàm
    nghịch biến)? Chỉ ra tọa độ \"đỉnh\" và \"đáy\" (cực trị) của đồ
    thị.
  - #strong[Câu hỏi chuyển giao:] Có cách nào xét được các khoảng này và
    tìm được \"đỉnh/đáy\" mà không cần phải vẽ đồ thị hay không?
- #strong[Phương pháp tích hợp:] Dạy học giải quyết vấn đề, gợi mở.

==== c) Sản phẩm
- Kết quả xử lí tình huống: Học sinh xác định được các đoạn tăng/giảm và
  điểm cao nhất/thấp nhất trong tình huống thực tiễn và trên đồ thị hàm
  số đã cho.
- Vấn đề cần giải quyết tiếp theo: Tìm cách xét tính đơn điệu và cực trị
  của hàm số bằng công cụ toán học (đạo hàm).

==== d) Tổ chức thực hiện
- #strong[Bước 1 - Giao nhiệm vụ:] Giáo viên trình chiếu hình ảnh/đồ
  thị, đặt câu hỏi gợi mở. Học sinh làm việc cá nhân trong 1 phút.
- #strong[Bước 2 - Thực hiện nhiệm vụ:] Học sinh quan sát, suy nghĩ, ghi
  nhận xét sơ bộ.
- #strong[Bước 3 - Báo cáo, thảo luận:] Gọi 2-3 học sinh trình bày ý
  kiến. Giáo viên ghi nhận các ý kiến.
- #strong[Bước 4 - Kết luận, nhận định:] Giáo viên chốt lại: Trong toán
  học, việc đi lên/đi xuống được gọi là #strong[Tính đơn điệu] (đồng
  biến/nghịch biến), điểm cao nhất/thấp nhất được gọi là #strong[Cực
  trị] (cực đại/cực tiểu). Chúng ta sẽ tìm hiểu công cụ giải quyết vấn
  đề này trong bài học.

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "04 tiết")
==== Hoạt động 2.1: Khái niệm tính đơn điệu của hàm số và mối liên hệ với đạo hàm
#mt-hd[
Phát biểu được khái niệm đồng biến, nghịch biến
  và nắm được ý nghĩa hình học của Định lí 1 (dấu của đạo hàm và chiều
  biến thiên).
]
#nd-hd[
  - #strong[Nhiệm vụ:] Cho hàm số $f\(x\)$ và hai điểm $x_1\,x_2$ trên
    khoảng $\(a\;b\)$ với $x_1 < x_2$. Học sinh đọc SGK và thảo luận
    nhóm 4 để hoàn thành Phiếu học tập số 1:
    - Điền vào chỗ trống: Nếu $f\(x_1\)< f\(x_2\)$ thì hàm số được gọi
      là $dots.h$
    - #strong[Ví dụ trực quan (Năng lực số):] Giáo viên sử dụng
      GeoGebra/Desmos #strong[vẽ tiếp tuyến] của đồ thị hàm số
      $y = f\(x\)$ tại các điểm $x$ khi hàm đồng biến và khi hàm nghịch
      biến.
    - #strong[Câu hỏi:] Quan sát độ dốc của tiếp tuyến trong hai trường
      hợp, em có nhận xét gì về dấu của $f'\(x\)$?
  - #strong[Phương pháp tích hợp:] Dạy học khám phá có hướng dẫn, trực
    quan hóa bằng công nghệ số (tích hợp Năng lực số - #strong[Sử dụng
    công nghệ số]).
]
#sp-hd[
  - Khái niệm đúng về hàm đồng biến, nghịch biến.
  - Phát biểu Định lí 1: Nếu $f'\(x\)> 0$ trên $\(a\;b\)$ thì $f\(x\)$
    đồng biến; nếu $f'\(x\)< 0$ thì $f\(x\)$ nghịch biến.
]
#tc-hd[
  - #strong[Bước 1 & 2:] Giao nhiệm vụ (Phiếu HT1) và thực hiện nhiệm vụ
    (Nhóm 4 thảo luận, ghi nhận kết quả).
  - #strong[Bước 3:] Tổ chức báo cáo (chọn đại diện 1 nhóm trình bày).
    Giáo viên trình chiếu kết quả trực quan bằng GeoGebra.
  - #strong[Bước 4:] Kết luận và chuẩn hóa kiến thức (Định lí 1).

==== Hoạt động 2.2: Sử dụng bảng biến thiên xét tính đơn điệu của hàm số
]
#mt-hd[
Nắm vững các bước lập bảng biến thiên để xét
  tính đơn điệu.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Hoàn thành #strong[Ví dụ 1] (Làm việc nhóm 4):
    Xét tính đơn điệu của hàm số $y = x^3 - 3 x^2 + 2$.
    - #strong[Yêu cầu:] Tìm $y'$, tìm nghiệm $y' = 0$, lập bảng biến
      thiên (có đủ 3 dòng $x\,y'\,y$).
  - #strong[Hoạt động:] #strong[Trình bày bằng sơ đồ tư duy (Mind Map):]
    Học sinh thảo luận và tổng hợp các bước lập bảng biến thiên (4 bước)
    thành một sơ đồ tư duy nhỏ trên giấy A4 hoặc sử dụng phần mềm Mind
    Map (Năng lực số - #strong[Khai thác và xử lý thông tin số]).
]
#sp-hd[
Lời giải chi tiết của Ví dụ 1; Bản vẽ/slide sơ
  đồ tư duy các bước xét tính đơn điệu bằng đạo hàm.
]
#tc-hd[
  - Giáo viên giao Ví dụ 1 (có kèm hướng dẫn làm sơ đồ tư duy). Học sinh
    thực hiện nhóm.
  - Giáo viên gọi 1 nhóm lên trình bày lời giải và 1 nhóm trình bày sơ
    đồ tư duy. Giáo viên chuẩn hóa các bước và cách trình bày Bảng biến
    thiên.

==== Hoạt động 2.3: Khái niệm cực trị của hàm số
]
#mt-hd[
Nêu được khái niệm cực đại và cực tiểu, phân
  biệt được cực trị với giá trị lớn nhất/nhỏ nhất.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Học sinh quan sát lại Bảng biến thiên và đồ thị
    của Ví dụ 1.
  - #strong[Câu hỏi thảo luận (Nhóm đôi):] Tại $x = 0$ và $x = 2$, dấu
    của $y'$ thay đổi như thế nào? Giá trị $y$ tại các điểm đó có mối
    quan hệ gì với các giá trị $y$ xung quanh nó? Từ đó, hãy tự định
    nghĩa điểm cực đại/cực tiểu.
  - #strong[Trò chơi học tập (Đúng/Sai):] Giáo viên chiếu các mệnh đề về
    cực trị. Ví dụ: \"Điểm cực đại là điểm có giá trị lớn nhất của hàm
    số.\" Học sinh dùng thẻ/tay để báo cáo Đúng/Sai.
]
#sp-hd[
Khái niệm chính xác về điểm cực đại, điểm cực
  tiểu, và nhận thức được điều kiện cần (đạo hàm đổi dấu) để có cực trị.
]
#tc-hd[
Thảo luận nhóm đôi, học sinh đưa ra
  định nghĩa. Giáo viên chuẩn hóa định nghĩa, phân biệt Cực trị và Giá
  trị lớn nhất/nhỏ nhất.

==== Hoạt động 2.4: Cách tìm cực trị của hàm số
]
#mt-hd[
Áp dụng được Quy tắc 1 (dựa vào Bảng biến thiên)
  để tìm cực trị của hàm số.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Hoàn thành #strong[Ví dụ 2] (Làm việc cá nhân,
    sau đó kiểm tra nhóm 4): Tìm cực trị của hàm số
    $y = x^4 - 2 x^2 + 3$.
  - #strong[Yêu cầu:] Lặp lại các bước xét tính đơn điệu, sau đó từ Bảng
    biến thiên, xác định tọa độ các điểm cực đại, cực tiểu.
]
#sp-hd[
Lời giải chi tiết của Ví dụ 2, xác định đúng các
  điểm cực trị (2 cực tiểu, 1 cực đại).
]
#tc-hd[
Giáo viên quan sát, hỗ trợ kịp thời các
  khó khăn (ví dụ: nhầm lẫn Quy tắc 1 với Quy tắc 2). Giáo viên gọi học
  sinh lên bảng trình bày, sau đó nhận xét và chuẩn hóa quy tắc tìm cực
  trị.

=== 3. Hoạt động 3: Luyện tập
]
#mt-hd[
Vận dụng thành thạo kiến thức về tính đơn điệu
  và cực trị để giải quyết các dạng bài tập cơ bản, rèn luyện kỹ năng
  tính toán, lập luận.
]
#nd-hd[
Hệ thống bài tập đa dạng, tập trung vào các
  dạng:
  - #strong[Dạng 1:] Xét tính đơn điệu và tìm cực trị của hàm đa thức
    bậc 3, bậc 4.
  - #strong[Dạng 2:] Xét tính đơn điệu và tìm cực trị của hàm phân thức
    $y = frac(a x + b, c x + d)$ và
    $y = frac(a x^2 + b x + c, d x + e)$.
  - #strong[Dạng 3:] Bài tập về tham số $m$ (mức độ nhận biết/thông
    hiểu) liên quan đến điều kiện để hàm số đồng biến/nghịch biến trên
    $bb(R)$ hoặc trên một khoảng.
  - #strong[Tích hợp (Năng lực số):] #strong[Trò chơi Kahoot/Quizizz]
    (Tích hợp Năng lực số - #strong[Sử dụng công nghệ số]) với các câu
    hỏi trắc nghiệm nhanh về Bảng biến thiên, kết luận về cực trị/đơn
    điệu.
]
#sp-hd[
Đáp án và lời giải đúng cho hệ thống bài tập.
  Báo cáo điểm số/kết quả thực hiện trò chơi Kahoot/Quizizz của học
  sinh.
]
#tc-hd[
  - #strong[Dạng 1, 2:] Học sinh làm việc cá nhân/nhóm 2, trình bày lời
    giải. Giáo viên chữa bài, phân tích lỗi sai phổ biến.
  - #strong[Trò chơi Kahoot/Quizizz:] Tổ chức trong 10 phút cuối tiết
    luyện tập để củng cố kiến thức một cách hứng thú, tăng cường khả
    năng phản xạ.

=== 4. Hoạt động 4: Vận dụng
]
#mt-hd[
Phát triển năng lực giải quyết vấn đề thực tiễn
  bằng cách vận dụng kiến thức về cực trị và tính đơn điệu.
]
#nd-hd[
#strong[Bài toán tối ưu hóa trong thực tiễn:]
  - #strong[Ví dụ:] Một công ty muốn thiết kế một chiếc thùng hình hộp
    chữ nhật không nắp từ một tấm bìa hình vuông có cạnh $a$. Cần cắt đi
    ở 4 góc các hình vuông nhỏ có cạnh là bao nhiêu để thể tích của
    thùng là lớn nhất (tối ưu nhất)?
  - #strong[Yêu cầu:] Học sinh phát hiện vấn đề (biến đổi đại lượng thực
    tiễn thành hàm số), xây dựng hàm số cần tìm cực trị, và giải quyết
    bài toán.
]
#sp-hd[
Báo cáo (viết tay hoặc slide Powerpoint/Word)
  #strong[Phát hiện và Giải quyết tình huống thực tiễn] (trong đó có xây
  dựng hàm số và tìm cực trị của hàm số đó).
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giao cho học sinh thực hiện #strong[ngoài
    giờ học trên lớp] (cá nhân hoặc nhóm 2).
  - #strong[Thời hạn:] Thu và chấm báo cáo vào tiết học kế tiếp.
  - #strong[Trao đổi:] Giáo viên dành thời gian đầu tiết học tiếp theo
    để mời 1-2 nhóm trình bày sản phẩm, chia sẻ phương pháp giải quyết
    vấn đề và đánh giá kết quả.

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
