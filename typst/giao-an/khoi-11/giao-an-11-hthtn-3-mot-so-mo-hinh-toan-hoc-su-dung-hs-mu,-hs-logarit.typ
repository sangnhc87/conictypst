// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "HĐTHTN 3 Một số mô hình toán học sử dụng HS mũ, HS Logarit",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Trình bày được kiến thức cơ bản về #strong[Mô hình tăng trưởng hoặc
  suy thoái cấp mũ].
- Trình bày được kiến thức cơ bản về #strong[Thang đo lôgarit], bao gồm:
  #strong[Thang đo pH], #strong[Thang đo Richter], và #strong[Thang đo
  decibel].
- Vận dụng được các mô hình hàm số mũ và lôgarit để giải quyết các bài
  toán thực tiễn đơn giản.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực tìm kiếm, thu
    thập thông tin và tài liệu liên quan đến các mô hình thực tế.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia thảo luận
    nhóm, trình bày ý tưởng, phân công nhiệm vụ trong nhóm.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống thực tiễn, lựa chọn công thức mô hình phù hợp và vận dụng để
    giải quyết vấn đề.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Nhận biết và thiết
    lập được mô hình hàm số mũ/lôgarit cho một số tình huống thực tiễn
    đơn giản.
  - #strong[Năng lực mô hình hóa toán học:] Sử dụng được công cụ toán
    học (hàm số mũ, lôgarit) để mô tả và giải quyết các vấn đề thực tiễn
    (tăng trưởng dân số, lãi suất, độ pH, cường độ âm thanh...).
- #strong[Năng lực số:]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, tìm tòi và
  hoàn thành nhiệm vụ được giao.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong nhóm, hoàn thành tốt
  phần việc của mình.
- #strong[Trung thực:] Trình bày kết quả tính toán, bài làm trung thực,
  khách quan.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính/laptop, loa.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11, bộ Kết nối tri thức với cuộc sống.
  - Phiếu học tập in sẵn hoặc trên nền tảng kỹ thuật số (Google
    Forms/Quizizz) cho hoạt động Luyện tập.
  - Các đoạn video/hình ảnh/tài liệu về các mô hình thực tiễn (tăng
    trưởng dân số, địa chấn, độ pH) phục vụ hoạt động Mở đầu và Hình
    thành kiến thức mới.
  - Phần mềm #strong[GeoGebra/Desmos] để học sinh tự mình vẽ đồ thị hàm
    số và trực quan hóa mô hình (Phục vụ #strong[Năng lực số]).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "5 phút")
==== a) Mục tiêu
- Tạo hứng thú, khơi gợi nhu cầu tìm hiểu về các ứng dụng của hàm số mũ
  và lôgarit trong thực tiễn.
- Giúp học sinh nhận ra các vấn đề thực tiễn cần sử dụng công cụ toán
  học để mô hình hóa và giải quyết.

==== b) Nội dung
#strong[Phương pháp:] #strong[Kĩ thuật KWL (Biết - Muốn biết - Học
được)] kết hợp #strong[trực quan] và #strong[đặt vấn đề].

- Giáo viên trình chiếu một số hình ảnh/video ngắn về các hiện tượng
  thực tiễn:
  - Tăng trưởng dân số hoặc lãi suất ngân hàng (tăng trưởng nhanh).
  - Thông tin về một trận động đất kèm độ Richter.
  - Chỉ số độ pH của một số chất quen thuộc.
- Giáo viên đặt câu hỏi gợi mở: \"Các hiện tượng này có điểm gì chung?
  Liệu có thể dùng công cụ toán học nào để dự đoán sự phát triển hay đo
  lường cường độ của chúng không?\"

==== c) Sản phẩm
- Câu trả lời bước đầu của học sinh về mối liên hệ giữa các hiện tượng
  và Toán học (Ví dụ: sự tăng trưởng nhanh, đo lường độ lớn).
- Xác định được nhiệm vụ học tập chính: #strong[Tìm hiểu các mô hình
  toán học sử dụng hàm số mũ và lôgarit để mô tả các hiện tượng thực
  tiễn.]

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ học tập (1 phút):] Giáo viên trình chiếu
  (hoặc chiếu video) và yêu cầu học sinh thảo luận cặp đôi nhanh trong 1
  phút về các hiện tượng vừa xem.
- #strong[Bước 2: Thực hiện nhiệm vụ (1.5 phút):] Học sinh quan sát, suy
  nghĩ cá nhân, sau đó thảo luận nhanh.
- #strong[Bước 3: Báo cáo, thảo luận (1.5 phút):] Giáo viên mời 1-2 cặp
  đôi trình bày ý kiến.
- #strong[Bước 4: Kết luận, nhận định (1 phút):] Giáo viên nhận xét,
  tổng hợp và dẫn dắt vào bài học: \"Hàm số mũ và lôgarit là công cụ
  mạnh mẽ để giải quyết các bài toán thực tiễn này. Chúng ta cùng tìm
  hiểu chi tiết qua các mô hình sau.\"

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "25 phút")
#strong[Phương pháp:] #strong[Dạy học khám phá] kết hợp #strong[kĩ thuật
Khăn trải bàn] (làm việc nhóm) và #strong[Thuyết trình/Báo cáo].

==== 2.1. Hoạt động thành phần 2.1: Mô hình tăng trưởng hoặc suy thoái cấp mũ (7 phút)
===== a) Mục tiêu
- Học sinh nắm được công thức và ý nghĩa của mô hình tăng trưởng/suy
  thoái cấp mũ $S\(t\)= S_0 e^(r t)$.
- Vận dụng được công thức vào một ví dụ thực tế.

===== b) Nội dung
- Học sinh nghiên cứu SGK, tài liệu về mô hình tăng trưởng (ví dụ: lãi
  kép, tăng trưởng dân số) hoặc suy thoái (ví dụ: phóng xạ) cấp mũ.
- #strong[Ví dụ đề xuất:] #strong[Mô hình Tăng trưởng Lãi kép liên tục.]
  - Tình huống: Một người gửi tiết kiệm #strong[100 triệu đồng] vào ngân
    hàng với lãi suất #strong[6%] mỗi năm, tính theo phương thức
    #strong[lãi kép liên tục]. Hỏi sau #strong[5 năm], số tiền người đó
    nhận được là bao nhiêu? (Sử dụng công thức $A\(t\)= P e^(r t)$).

===== c) Sản phẩm
- Công thức: $S\(t\)= S_0 e^(r t)$ (hoặc công thức tương ứng).
- Lời giải cho ví dụ đề xuất:
  $A\(5\)= 100 dot.op e^(0.06 dot.op 5) approx 134.986$ (triệu đồng).
- #strong[Tích hợp Năng lực số:] Học sinh sử dụng #strong[máy tính cầm
  tay] hoặc #strong[phần mềm tính toán] (ví dụ: Excel, Desmos) để tính
  giá trị của $e^0.3$ một cách chính xác. (Biểu hiện #strong[Năng lực
  số]: #strong[Thực hiện các phép tính] với số $e$ và lũy thừa,
  #strong[kiểm tra tính chính xác] của kết quả).

===== d) Tổ chức thực hiện
- Giáo viên giao nhiệm vụ nghiên cứu SGK và làm ví dụ nhóm.
- Giáo viên mời đại diện 1 nhóm trình bày kết quả (ghi sản phẩm lên
  bảng/trình chiếu).
- Giáo viên chuẩn hóa kiến thức và nhấn mạnh vai trò của $e$ và $r$.

==== 2.2. Hoạt động thành phần 2.2: Thang đo lôgarit (18 phút - chia đều 3 phần)
===== a) Mục tiêu
- Học sinh nắm được khái niệm, công thức và ý nghĩa của: Thang đo pH,
  Thang đo Richter, Thang đo decibel.
- Vận dụng được các công thức này để giải quyết các bài toán đơn giản.

===== b) Nội dung
- Học sinh làm việc nhóm (kĩ thuật Khăn trải bàn hoặc Chia sẻ luân
  phiên), mỗi nhóm phụ trách nghiên cứu sâu và chuẩn bị báo cáo (có thể
  dùng sơ đồ tư duy) về một hoặc nhiều thang đo.
- #strong[Ví dụ đề xuất:]
  - #strong[Thang đo pH:] Dung dịch X có nồng độ ion $H^(+)$ là
    $10^(- 5)$ mol/L. Tính độ pH của dung dịch X. (Sử dụng công thức
    $p H = - l o g\[H^(+)\]$).
  - #strong[Thang đo Richter:] Trận động đất ở A có độ Richter
    $R_A = 6.0$, trận động đất ở B có độ Richter $R_B = 8.0$. Hỏi cường
    độ của trận động đất B gấp bao nhiêu lần cường độ trận động đất A?
    (Sử dụng công thức $R = l o g I / I_0$).
  - #strong[Thang đo decibel:] Cường độ âm thanh tại một điểm là
    $10^(- 6) upright(" W/m")^2$. Tính mức cường độ âm $L$ (theo
    decibel), biết cường độ âm chuẩn là
    $I_0 = 10^(- 12) upright(" W/m")^2$. (Sử dụng công thức
    $L = 10 log I / I_0$).

===== c) Sản phẩm
- Công thức, tên gọi, đơn vị, và ý nghĩa của từng thang đo.
- Lời giải cho các ví dụ đề xuất (pH=5; cường độ $I_B$ gấp
  $10^(8 - 6) = 100$ lần $I_A$\; $L = 60 upright(" dB")$).
- Sơ đồ tư duy/Bản trình bày tóm tắt về các thang đo.
- #strong[Tích hợp Năng lực số:] Học sinh sử dụng #strong[công cụ tìm
  kiếm] (Google Search) để tra cứu nhanh các thông số, ví dụ về các
  thang đo hoặc sử dụng #strong[ứng dụng Mind Map] để vẽ sơ đồ tư duy
  tóm tắt kiến thức (Biểu hiện #strong[Năng lực số]: #strong[Tìm kiếm,
  thu thập, quản lí, lưu trữ] thông tin và #strong[Sáng tạo] sản phẩm
  học tập trên nền tảng kỹ thuật số).

===== d) Tổ chức thực hiện
- Giáo viên chia nhóm, giao nhiệm vụ và phân công thang đo cho từng nhóm
  (hoặc yêu cầu tất cả nghiên cứu).
- Học sinh làm việc nhóm (10 phút): Thảo luận, giải quyết ví dụ, chuẩn
  bị nội dung báo cáo/sơ đồ tư duy.
- Đại diện nhóm báo cáo (mỗi phần 2 phút), các nhóm khác phản biện/bổ
  sung.
- Giáo viên chuẩn hóa kiến thức, nhấn mạnh tính lôgarit của các thang đo
  và ứng dụng thực tiễn.

#hd("3", "Luyện tập", "10 phút")
==== a) Mục tiêu
- Củng cố kiến thức và kĩ năng giải các bài tập cơ bản về các mô hình đã
  học.
- Phát triển kĩ năng tính toán và vận dụng công thức.

==== b) Nội dung
#strong[Phương pháp:] #strong[Trò chơi học tập (Game hóa)].

- Giáo viên tổ chức trò chơi #strong[\"Ai nhanh hơn - Trắc nghiệm ứng
  dụng\"] (Sử dụng nền tảng #strong[Quizizz] hoặc #strong[Kahoot] để
  tăng tính hấp dẫn và tương tác).
- #strong[Ví dụ Bài tập (Tích hợp Năng lực số):]
  - #strong[Câu 1 (Mô hình Mũ):] Số lượng vi khuẩn trong một phòng thí
    nghiệm tăng trưởng theo công thức $N\(t\)= 100 dot.op 2^(t\/3)$ (với
    $t$ tính bằng giờ). Hỏi sau bao nhiêu giờ thì số lượng vi khuẩn đạt
    #strong[800] con? (Đáp án: 9 giờ).
  - #strong[Câu 2 (Thang đo pH):] Một loại nước ngọt có độ pH là
    #strong[2.5]. Nồng độ ion $H^(+)$ của nước ngọt đó là bao nhiêu?
    (Đáp án: $10^(- 2.5)$).
  - #strong[Câu 3 (Thang đo Richter/Decibel):] Một trận động đất được đo
    ở mức $R = 5$. Nếu một trận động đất khác có cường độ #strong[gấp 10
    lần] thì có độ Richter là bao nhiêu? (Đáp án: $R' = 6$).

==== c) Sản phẩm
- Kết quả trả lời chính xác các câu hỏi trong trò chơi.
- Thể hiện rõ kĩ năng tính toán và vận dụng công thức.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (1 phút):] Giáo viên giới thiệu luật
  chơi và hướng dẫn học sinh đăng nhập vào nền tảng Quizizz/Kahoot (Phục
  vụ #strong[Năng lực số]).
- #strong[Bước 2: Thực hiện nhiệm vụ (7 phút):] Học sinh tham gia trò
  chơi, trả lời các câu hỏi được hiển thị trên màn hình. Giáo viên theo
  dõi kết quả tự động.
- #strong[Bước 3: Báo cáo, thảo luận (2 phút):] Giáo viên công bố kết
  quả (bảng xếp hạng), nhận xét và giải thích nhanh các câu hỏi mà nhiều
  học sinh sai.

#hd("4", "Vận dụng", "5 phút")
==== a) Mục tiêu
- Phát triển năng lực vận dụng kiến thức, kĩ năng vào giải quyết các vấn
  đề thực tiễn.
- Khuyến khích tìm tòi, sáng tạo ngoài giờ học.

==== b) Nội dung
#strong[Phương pháp:] #strong[Dự án nhỏ/Nghiên cứu ứng dụng].

- Giáo viên giao nhiệm vụ về nhà: #strong[\"Dự án Tính toán và Thiết kế
  thông tin\"].
- #strong[Yêu cầu:] Học sinh lựa chọn 1 trong 3 mô hình đã học (Mô hình
  Mũ, pH, Richter/Decibel).
  - #strong[Bước 1:] Tìm kiếm một tình huống thực tế (ví dụ: lãi suất
    mới nhất của ngân hàng, thông tin về trận động đất gần đây, độ pH
    của các loại hóa chất gia đình...).
  - #strong[Bước 2:] Xây dựng một bài toán thực tiễn từ tình huống đó và
    giải quyết nó.
  - #strong[Bước 3:] #strong[Thiết kế một infographic/tờ rơi/video ngắn]
    (sử dụng Canva, PowerPoint, CapCut...) để trình bày mô hình, bài
    toán, và lời giải. (Phục vụ #strong[Năng lực số]: #strong[Tạo ra và
    tương tác] với thông tin trên các nền tảng kỹ thuật số).

==== c) Sản phẩm
- Bài toán thực tiễn đã được giải quyết.
- Sản phẩm trình bày thông tin (infographic/video) nộp ở tiết học sau.

==== d) Tổ chức thực hiện
- Giáo viên giao nhiệm vụ và hướng dẫn cách tìm kiếm tài liệu, gợi ý
  công cụ thiết kế (Canva,...)
- Hướng dẫn về tiêu chí đánh giá sản phẩm (tính chính xác, tính sáng
  tạo, tính thẩm mỹ, khả năng truyền đạt thông tin).
- Yêu cầu nộp sản phẩm qua email hoặc Drive chung của lớp để trao đổi,
  chia sẻ và đánh giá vào đầu tiết sau.

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

