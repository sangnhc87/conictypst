// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 3 Đường tiệm cận",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được #strong[định nghĩa] đường tiệm cận ngang, đường tiệm cận đứng
  của đồ thị hàm số.
- Nêu được #strong[định nghĩa] đường tiệm cận xiên của đồ thị hàm số
  (nếu có).
- Nêu được #strong[quy tắc/cách xác định] các loại đường tiệm cận của đồ
  thị hàm số đã cho (hàm hữu tỉ, một số hàm căn thức đơn giản).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu khái niệm,
    công thức về tiệm cận qua tài liệu, sách giáo khoa; tự giác thực
    hiện nhiệm vụ học tập.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia thảo luận
    nhóm, trình bày ý kiến, báo cáo kết quả trước lớp; phân công nhiệm
    vụ rõ ràng, hiệu quả trong nhóm.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích được các
    dạng đồ thị hàm số có tiệm cận; biết cách xử lí các bài toán tìm
    tiệm cận.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận Toán học:] Phân tích, so sánh sự
    khác biệt giữa các loại tiệm cận (ngang, đứng, xiên) dựa trên giới
    hạn.
  - #strong[Năng lực mô hình hóa Toán học:] Vận dụng khái niệm tiệm cận
    để mô tả hình dạng và xu hướng của đồ thị hàm số.
  - #strong[Năng lực giải quyết vấn đề Toán học:] Tính toán chính xác
    giới hạn tại vô cực và tại điểm để tìm các đường tiệm cận.
- #strong[Năng lực số]
  - #strong[Sử dụng các công cụ kỹ thuật số để tạo, xử lý và kiểm tra
    thông tin :] Sử dụng máy tính cầm tay, #strong[phần mềm vẽ đồ thị
    hàm số (ví dụ: GeoGebra, Desmos)] để kiểm tra và trực quan hóa các
    đường tiệm cận

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Nghiêm túc, chủ động hoàn thành các nhiệm vụ học
  tập (cá nhân và nhóm).
- #strong[Trung thực:] Trình bày kết quả tính toán, bài làm một cách
  trung thực, khách quan.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ được giao trong
  nhóm; tôn trọng ý kiến đóng góp của bạn bè.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy tính (PC/Laptop), máy chiếu, bảng phụ,
  phấn màu, phiếu học tập, #strong[phần mềm vẽ đồ thị
  (GeoGebra/Desmos)].
- #strong[Học liệu:] Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc
  sống), tài liệu tham khảo, #strong[bộ câu hỏi trắc nghiệm trực tuyến
  (ví dụ: Google Forms, Quizizz)], #strong[slide bài giảng có tích hợp
  hình ảnh đồ thị minh họa].

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Nhiệm vụ học tập/Mở đầu", "15 phút")
- #strong[Tên thể hiện kết quả hoạt động:] #strong[Xác định nhu cầu tìm
  hiểu về giới hạn của đồ thị hàm số]

#mt-hd[
Tạo tình huống trực quan, khơi gợi hứng thú và
  giúp học sinh nhận thấy sự cần thiết phải nghiên cứu về xu hướng của
  đồ thị hàm số khi biến $x$ hoặc giá trị hàm $y$ tiến ra vô cực, từ đó
  xác định nhiệm vụ học tập.

]
#nd-hd[
Giáo viên trình chiếu đồ thị một hàm số đơn giản
  (ví dụ: $y = frac(2 x + 1, x - 1)$) và yêu cầu học sinh:

  - Quan sát và mô tả hình dạng của đồ thị khi $x arrow.r + oo$ và
    $x arrow.r - oo$.
  - Quan sát và mô tả hình dạng của đồ thị khi $x arrow.r 1^(+)$ và
    $x arrow.r 1^(-)$.
  - Đặt câu hỏi: Các đường thẳng $y = 2$ và $x = 1$ có vai trò gì đặc
    biệt đối với đồ thị? Có cách nào xác định được các đường thẳng này
    mà không cần vẽ đồ thị không?
  - #strong[Nhiệm vụ:] Tìm hiểu khái niệm và cách tìm các đường tiệm cận
    của đồ thị hàm số.

]
#sp-hd[

  - Học sinh quan sát, mô tả được xu hướng của đồ thị (tiến sát đường
    $y = 2$ khi $x arrow.r plus.minus oo$ và tiến sát đường $x = 1$ khi
    $x arrow.r 1^plus.minus$).
  - Học sinh xác định được vấn đề cần giải quyết là #strong[Định nghĩa
    và cách tìm Đường tiệm cận].

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ học tập (GV):] Chiếu đồ thị hàm số,
    nêu câu hỏi quan sát, yêu cầu học sinh thảo luận cặp đôi (3 phút).
  - #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
    trợ):] Học sinh trao đổi, ghi lại nhận xét.
  - #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo
    cáo, thảo luận):] Gọi đại diện 1-2 cặp trình bày nhận xét. GV ghi
    lại các từ khóa: #strong[\"tiến gần\"], #strong[\"giới hạn\"] lên
    bảng.
  - #strong[Bước 4: Kết luận, nhận định (GV):] Dẫn dắt vào bài học:
    #strong[\"Các đường thẳng mà đồ thị hàm số tiến gần vô hạn đó chính
    là Tiệm cận. Chúng ta sẽ tìm hiểu chi tiết hơn trong bài học này.\"]

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "135 phút")
- #strong[Tên thể hiện kết quả hoạt động:] #strong[Định nghĩa và quy tắc
  tìm các loại đường tiệm cận]

#mt-hd[
Giúp học sinh chiếm lĩnh được định nghĩa và cách
  tìm 3 loại đường tiệm cận: ngang, đứng và xiên, thông qua việc tính
  giới hạn.

]
#nd-hd[
Học sinh làm việc nhóm (4-5 người), đọc SGK,
  thảo luận, thực hiện các ví dụ cụ thể do giáo viên cung cấp, và sử
  dụng công cụ số để kiểm tra/trực quan hóa.

]
#sp-hd[

  - Định nghĩa và quy tắc tìm 3 loại tiệm cận (ngang, đứng, xiên) đã
    được nhóm ghi chép đầy đủ.
  - Lời giải đúng và đầy đủ cho các ví dụ minh họa.
  - Sơ đồ tư duy về các bước tìm tiệm cận (dùng công cụ số hoặc vẽ tay).

]
#tc-hd[

#emph[#strong[Hoạt động 2.1: Đường tiệm cận ngang (40 phút)]]

\* #strong[Mục tiêu:] Nắm vững định nghĩa và cách tìm TCN thông qua giới
hạn $lim_(x arrow.r plus.minus oo) f\(x\)= b$.

\* #strong[Nội dung:] Học sinh đọc SGK về TCN, thảo luận nhóm để xây
dựng định nghĩa. \* #strong[Ví dụ đề xuất:] Tìm TCN của đồ thị hàm số
$y = frac(x^2 - 1, 2 x^2 + x + 3)$.

\* #strong[Tổ chức thực hiện:]

\* #strong[Giao nhiệm vụ:] GV yêu cầu nhóm hoàn thành định nghĩa, công
thức giới hạn và giải Ví dụ.

\* #strong[Thực hiện nhiệm vụ (Tích hợp Năng lực số):] Yêu cầu HS
#strong[sử dụng GeoGebra/Desmos] để vẽ đồ thị hàm số Ví dụ và quan sát
đường tiệm cận $y = 1\/2$ (#strong[Biểu hiện về năng lực số: Khai thác
và xử lí dữ liệu số để trực quan hóa, kiểm chứng kết quả]).

\* #strong[Báo cáo, thảo luận:] Đại diện nhóm báo cáo kết quả, nhóm khác
nhận xét.

\* #strong[Kết luận, nhận định:] GV chuẩn hóa kiến thức về TCN.

#emph[#strong[Hoạt động 2.2: Đường tiệm cận đứng (40 phút)]]

\* #strong[Mục tiêu:] Nắm vững định nghĩa và cách tìm TCĐ thông qua giới
hạn $lim_(x arrow.r a^plus.minus) f\(x\)= plus.minus oo$.

\* #strong[Nội dung:] Học sinh đọc SGK về TCĐ, thảo luận nhóm, so sánh
với TCN.

\* #strong[Ví dụ đề xuất:] Tìm TCĐ của đồ thị hàm số
$y = frac(3 x - 1, x^2 - 4)$.

\* #strong[Tổ chức thực hiện:]

\* #strong[Giao nhiệm vụ:] Yêu cầu nhóm hoàn thành định nghĩa, điều kiện
(nghiệm mẫu không là nghiệm tử) và giải Ví dụ.

\* #strong[Thực hiện nhiệm vụ (Tích hợp Năng lực số):] Yêu cầu HS
#strong[sử dụng GeoGebra/Desmos] để vẽ đồ thị và quan sát hai đường tiệm
cận đứng $x = 2$ và $x = - 2$.

\* #strong[Báo cáo, thảo luận:] Tổ chức #strong[Trò chơi học tập \"Ai
nhanh hơn\"] (mỗi nhóm cử 1 thành viên lên giải nhanh một câu hỏi tìm
TCĐ tương tự).

\* #strong[Kết luận, nhận định:] GV chuẩn hóa kiến thức về TCĐ.

#emph[#strong[Hoạt động 2.3: Đường tiệm cận xiên (55 phút)]]

\* #strong[Mục tiêu:] Nắm vững định nghĩa và cách tìm TCX $y = a x + b$
($a eq.not 0$) thông qua công thức tính
$a = lim_(x arrow.r plus.minus oo) frac(f\(x\), x)$ và
$b = lim_(x arrow.r plus.minus oo)\[f\(x\)- a x\]$.

\* #strong[Nội dung:] Học sinh đọc SGK về TCX, thảo luận nhóm. \*
#strong[Ví dụ đề xuất:] Tìm TCX của đồ thị hàm số
$y = frac(x^2 - 3 x + 1, x - 2)$.

\* #strong[Tổ chức thực hiện:]

\* #strong[Giao nhiệm vụ:] Yêu cầu nhóm nghiên cứu công thức tìm $a$ và
$b$, và giải Ví dụ.

\* #strong[Thực hiện nhiệm vụ:] Khuyến khích HS sử dụng #strong[kỹ năng
giao tiếp và thuyết trình] để giải thích cách tính giới hạn và các bước
tìm TCX.

\* #strong[Báo cáo, thảo luận:] Tổ chức cho 2 nhóm đối diện nhau
#strong[phản biện] về cách giải.

\* #strong[Kết luận, nhận định (Tích hợp Năng lực số):] GV chiếu sơ đồ
tư duy tổng hợp về 3 loại tiệm cận (có thể dùng Mindmap Maker) và nhắc
nhở về điều kiện: #strong[Hàm số có TCN thì không có TCX và ngược lại.]

]
#hd("3", "Luyện tập", "30 phút")
- #strong[Tên thể hiện kết quả hoạt động:] #strong[Vận dụng kiến thức và
  kĩ năng giải bài tập tìm tiệm cận]

#mt-hd[
Củng cố và vận dụng kiến thức, rèn luyện kỹ năng
  tìm các loại đường tiệm cận của đồ thị các hàm số khác nhau.

]
#nd-hd[
Hệ thống các bài tập tổng hợp về tìm TCN, TCĐ,
  TCX (dưới dạng trắc nghiệm và tự luận).

  - #strong[Bài tập đề xuất:]
    #block[
    #set enum(numbering: "i.", start: 1)
    + Tìm số lượng tiệm cận của hàm số $y = frac(sqrt(x^2 + 1), x + 1)$.
    + Tìm tất cả tiệm cận của đồ thị hàm số
      $y = frac(x^2 - 4 x + 3, x - 1)$.
    ]

]
#sp-hd[

  - Đáp án, lời giải chi tiết của các bài tập luyện tập.
  - Sự thành thạo trong việc xác định các đường tiệm cận qua tính toán
    giới hạn.

]
#tc-hd[

  - #strong[Giao nhiệm vụ:] GV giao 5 câu hỏi trắc nghiệm qua
    #strong[công cụ trực tuyến (Google Forms/Quizizz)].
  - #strong[Thực hiện nhiệm vụ:] Học sinh làm bài tập cá nhân, sau đó
    thảo luận nhóm để kiểm tra chéo đáp án và tìm ra cách giải tối ưu
    nhất (3 phút/câu).
  - #strong[Báo cáo, thảo luận:] GV gọi đại diện nhóm trình bày chi tiết
    lời giải Bài tập 1 và Bài tập 2 (tự luận). Tổ chức #strong[phân tích
    và tổng hợp thông tin] qua so sánh các phương pháp giải.
  - #strong[Kết luận, nhận định:] GV chữa bài và nhấn mạnh các lỗi sai
    thường gặp.

]
#hd("4", "Vận dụng", "10 phút")
- #strong[Tên thể hiện kết quả hoạt động:] #strong[Ứng dụng tiệm cận
  trong thực tiễn]

#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  tìm tiệm cận vào các vấn đề thực tiễn (nếu có) hoặc các tình huống
  Toán học nâng cao.

]
#nd-hd[
Mô tả vấn đề/tình huống thực tiễn có liên quan
  đến đường tiệm cận (ví dụ: mô hình hóa sự tăng trưởng dân số, nồng độ
  chất trong máu, chi phí sản xuất, \... khi thời gian/số lượng tiến đến
  vô cực).

  - #strong[Bài toán đề xuất:] Một công ty sản xuất một loại sản phẩm.
    Hàm chi phí trung bình để sản xuất $x$ đơn vị sản phẩm được cho bởi
    $C\(x\)= frac(2 x^2 + 300, x^2 + 1)$ (triệu đồng). Hãy tìm tiệm cận
    ngang của đồ thị hàm số $C\(x\)$ và giải thích ý nghĩa thực tiễn của
    nó.

]
#sp-hd[
Báo cáo (viết tay hoặc file mềm) giải thích ý
  nghĩa thực tiễn của tiệm cận ngang trong bài toán đã cho.

]
#tc-hd[

  - #strong[Giao nhiệm vụ:] Nhiệm vụ này được giao cho học sinh
    #strong[thực hiện ngoài giờ học trên lớp] (trong 1 tuần).
  - #strong[Hỗ trợ:] Khuyến khích học sinh #strong[tra cứu thông tin
    trên Internet] để tìm hiểu thêm về các ứng dụng của hàm số trong
    kinh tế, vật lý (#strong[Biểu hiện về năng lực số: Tìm kiếm, truy
    cập, sử dụng thông tin và dữ liệu số]).
  - #strong[Đánh giá:] Học sinh nộp báo cáo (dạng bài viết hoặc slide
    thuyết trình) để trao đổi, chia sẻ và đánh giá vào đầu tiết học tuần
    sau.

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
