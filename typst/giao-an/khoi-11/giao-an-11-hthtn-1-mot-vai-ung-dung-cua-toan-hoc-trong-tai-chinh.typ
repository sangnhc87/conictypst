// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "HĐTHTN 1 Một vài ứng dụng của toán học trong tài chính",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[niên kim] và hai đại lượng liên quan là
  #strong[số tiền của niên kim] và #strong[giá trị hiện tại của niên
  kim].
- Vận dụng được công thức tính #strong[số tiền của một niên kim] để giải
  quyết các bài toán thực tế (ví dụ: gửi tiết kiệm định kì).
- Vận dụng được công thức tính #strong[giá trị hiện tại của một niên
  kim] để giải quyết các bài toán thực tế (ví dụ: vay vốn trả góp).
- Vận dụng được kiến thức về #strong[niên kim] để giải quyết bài toán
  #strong[mua trả góp].

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực tìm hiểu kiến
    thức về các khái niệm tài chính.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày, bảo vệ ý kiến của mình, đóng góp ý kiến xây dựng bài.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống thực tế, đề xuất phương án và vận dụng công thức toán học để
    giải quyết vấn đề.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Hình thành công thức
    tính toán tài chính dựa trên kiến thức cấp số nhân.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các tình huống
    tài chính (gửi tiết kiệm định kì, vay trả góp, mua trả góp) bằng mô
    hình niên kim.
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán (tích hợp
    năng lực số):] #strong[Sử dụng các công cụ tính toán điện tử] (máy
    tính cầm tay, phần mềm bảng tính Excel/Google Sheets,...) để tính
    toán nhanh và chính xác các giá trị tài chính phức tạp, giúp học
    sinh thấy được #strong[hiệu quả, tính chính xác và tốc độ khi ứng
    dụng công nghệ số] vào thực tiễn tài chính.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT - biểu hiện cụ thể):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực hoàn thành các nhiệm vụ học tập, đặc biệt
  là nhiệm vụ Vận dụng liên quan đến tài chính cá nhân.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ được giao trong
  nhóm; nhận thức được tầm quan trọng của việc quản lý tài chính cá
  nhân.
- #strong[Trung thực:] Thể hiện sự trung thực trong quá trình tính toán
  và báo cáo kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu (projector), máy tính giáo viên,
  bảng, phấn.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Tập 2 - Kết nối tri thức với cuộc sống).
  - Phiếu học tập (bài tập tình huống thực tế).
  - Máy tính cầm tay cá nhân hoặc máy tính có cài đặt phần mềm bảng tính
    (Excel/Google Sheets) để tính toán niên kim (#strong[Học liệu hỗ trợ
    năng lực số]).
  - Các slide bài giảng có sẵn sơ đồ tóm tắt công thức (Sơ đồ tư duy).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
==== a) Mục tiêu
- Kích thích sự tò mò, hứng thú của học sinh.
- Giúp học sinh nhận diện được tình huống thực tế liên quan đến tài
  chính có chu kì thanh toán, từ đó xác định nhiệm vụ cần giải quyết:
  tìm hiểu công cụ toán học để giải quyết các vấn đề tài chính đó (niên
  kim).

==== b) Nội dung
- #strong[Giáo viên] đưa ra #strong[Tình huống thực tế (Trò chơi học
  tập)]:
  - \"Giả sử bạn đang học lớp 11 và đặt mục tiêu 4 năm nữa sẽ mua một
    chiếc xe máy trị giá 30 triệu đồng. Bạn quyết định mỗi tháng gửi
    tiết kiệm 500.000 đồng vào ngân hàng với lãi suất $0\,5 %$ / tháng.
    Hỏi sau 4 năm (48 tháng), bạn có đủ tiền mua xe không?\"
- #strong[Nhiệm vụ:]
  - Học sinh thảo luận cặp đôi/nhóm nhỏ (2 phút) để đưa ra dự đoán và
    cách tính sơ bộ.
  - Đại diện một số nhóm trình bày cách tính.
  - #strong[Giáo viên] nhận xét và đặt vấn đề: \"Đây là một chuỗi các
    khoản thanh toán/gửi tiền định kì, được gọi là #strong[Niên kim].
    Tính toán các chuỗi này cần một công cụ toán học đặc biệt. Bài học
    hôm nay sẽ cung cấp công cụ đó.\"

==== c) Sản phẩm
- Dự đoán của học sinh về số tiền cuối kì (Có thể chưa chính xác, nhưng
  thể hiện được nỗ lực tính toán).
- Xác định được vấn đề cần giải quyết là tính #strong[tổng số tiền] (bao
  gồm gốc và lãi) sau một chuỗi các khoản gửi định kì.

==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ học tập:] Chiếu/đọc tình huống và yêu cầu học
  sinh thảo luận cặp đôi.
- #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận và ghi nhanh kết quả
  dự đoán. #strong[Giáo viên] theo dõi, gợi mở nếu học sinh gặp khó khăn
  trong việc tính toán lãi suất ghép cho từng khoản gửi.
- #strong[Báo cáo, thảo luận:] Mời 2-3 nhóm/cá nhân trình bày cách
  nghĩ/cách tính. #strong[Giáo viên] ghi nhận các ý kiến, đặc biệt là
  những ý kiến nhận ra sự phức tạp của việc tính lãi suất cho từng khoản
  tiền riêng lẻ.
- #strong[Kết luận, nhận định:] #strong[Giáo viên] dẫn dắt vào bài học:
  Giới thiệu khái niệm #strong[Niên kim] và mục tiêu của bài học là tìm
  công thức đơn giản để giải quyết bài toán trên.

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
==== Hoạt động 2.1: Số tiền của một niên kim (20 phút)
===== a) Mục tiêu
- Hình thành công thức tính Số tiền của một niên kim ($F_A$).
- Vận dụng công thức vào các bài toán gửi tiết kiệm định kì.

===== b) Nội dung
- #strong[Nhiệm vụ:]
  - #strong[Học sinh] làm việc nhóm (4-5 người), nghiên cứu ví dụ mở đầu
    trong SGK để hiểu cách hình thành công thức tính #strong[Số tiền của
    một niên kim] ($F_A$) dựa trên cấp số nhân.
  - #strong[Ví dụ đề xuất:] Một người gửi $A = 5$ triệu đồng vào ngân
    hàng vào đầu mỗi năm, lãi suất $r = 6 %$ / năm. Hỏi sau $n = 5$ năm,
    người đó nhận được số tiền là bao nhiêu?
  - #strong[Học sinh (Tích hợp năng lực số):] Sử dụng máy tính cầm tay
    để tính $F_A$ theo công thức vừa thiết lập.

===== c) Sản phẩm
- Công thức: $F_A = A / r\[\(1 + r\)^n- 1\]$.
- Lời giải cho ví dụ đề xuất (Ví dụ: $F_A approx 28\,18$ triệu đồng).

===== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ:] Giao nhiệm vụ nghiên cứu SGK và giải quyết ví
  dụ đề xuất.
- #strong[Thực hiện nhiệm vụ:] #strong[Giáo viên] đi vòng quanh các
  nhóm, hỗ trợ nếu học sinh chưa hình thành được công thức từ cấp số
  nhân.
  - #emph[Dự kiến khó khăn:] Học sinh có thể nhầm lẫn giữa niên kim đầu
    kì và cuối kì. #emph[Biện pháp hỗ trợ:] #strong[Giáo viên] làm rõ
    quy ước trong SGK là niên kim cuối kì hoặc hướng dẫn xây dựng công
    thức cho niên kim đầu kì (nếu cần).
- #strong[Báo cáo, thảo luận:] Mời một nhóm lên bảng trình bày quá trình
  xây dựng công thức. Các nhóm khác nhận xét.
- #strong[Kết luận, nhận định:] #strong[Giáo viên] chốt lại công thức
  $F_A$, khắc sâu ý nghĩa của các đại lượng.

==== Hoạt động 2.2: Giá trị hiện tại của một niên kim (20 phút)
===== a) Mục tiêu
- Hình thành công thức tính Giá trị hiện tại của một niên kim ($P_A$).
- Vận dụng công thức vào các bài toán vay trả góp, trả lương hưu.

===== b) Nội dung
- #strong[Nhiệm vụ:]
  - #strong[Học sinh] thảo luận nhóm để thiết lập mối liên hệ giữa
    #strong[Giá trị hiện tại] ($P_A$) và #strong[Số tiền] ($F_A$) của
    niên kim, từ đó suy ra công thức tính $P_A$. (Gợi ý: Dùng công thức
    $F = P\(1 + r\)^n$).
  - #strong[Ví dụ đề xuất:] Một người vay $P_A$ đồng từ ngân hàng với
    lãi suất $r = 1 %$ / tháng. Cuối mỗi tháng người đó trả $A = 5$
    triệu đồng. Sau $n = 12$ tháng thì hết nợ. Hỏi số tiền vay ban đầu
    là bao nhiêu ($P_A$)?
  - #strong[Học sinh (Tích hợp năng lực số):] Sử dụng phần mềm bảng tính
    Excel/Google Sheets trên điện thoại (nếu được phép) hoặc máy tính để
    tính nhanh $P_A$. (#strong[Biểu hiện năng lực số:] Khai thác, thu
    thập thông tin và dữ liệu số; Cộng tác trong môi trường số).

===== c) Sản phẩm
- Công thức: $P_A = A / r\[1 -\(1 + r\)^(- n)\]$.
- Lời giải cho ví dụ đề xuất (Ví dụ: $P_A approx 56\,21$ triệu đồng).

===== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ:] Giao nhiệm vụ thiết lập công thức và giải ví
  dụ đề xuất.
- #strong[Thực hiện nhiệm vụ:] #strong[Giáo viên] hướng dẫn nhóm nếu học
  sinh lúng túng khi biến đổi công thức. Khuyến khích học sinh sử dụng
  phần mềm bảng tính.
- #strong[Báo cáo, thảo luận:] Mời một nhóm trình bày cách biến đổi và
  một nhóm trình bày kết quả tính bằng công cụ số.

==== Hoạt động 2.3: Mua trả góp (20 phút)
===== a) Mục tiêu
- Vận dụng kiến thức #strong[Giá trị hiện tại của niên kim] vào bài toán
  #strong[Mua trả góp] để xác định số tiền trả góp định kì ($A$).

===== b) Nội dung
- #strong[Nhiệm vụ:]
  - #strong[Học sinh] làm việc nhóm, phân tích bài toán #strong[Mua trả
    góp] (sau khi đã đặt cọc hoặc trả trước một phần) về bản chất là bài
    toán vay nợ với số tiền vay là
    $P_(upright("vay")) = upright("Giá bán") - upright("Số tiền trả trước")$.
  - #strong[Ví dụ đề xuất:] Anh Hùng mua trả góp một chiếc điện thoại
    trị giá 30 triệu đồng. Anh trả trước 10 triệu đồng, số tiền còn lại
    vay ngân hàng với lãi suất $1\,5 %$ / tháng. Anh Hùng trả góp đều
    đặn hàng tháng trong 24 tháng. Hỏi số tiền ($A$) anh Hùng phải trả
    hàng tháng là bao nhiêu?
  - #strong[Học sinh:] Rút $A$ từ công thức $P_A$ và tính toán.
  - #strong[Thuyết trình (Tăng cường kĩ năng giao tiếp, thuyết trình,
    phân tích):] Chuẩn bị một đoạn thuyết trình ngắn về ý nghĩa của việc
    tính toán này trước khi quyết định mua trả góp.

===== c) Sản phẩm
- Công thức tính số tiền trả góp hàng kì:
  $A = frac(P_(upright("vay")) dot.op r, 1 -\(1 + r\)^(- n))$.
- Lời giải cho ví dụ đề xuất (Ví dụ: $A approx 1\,013$ triệu
  đồng/tháng).
- Bài thuyết trình ngắn.

===== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ:] Phân tích tình huống, thiết lập công thức $A$
  và giải ví dụ.
- #strong[Thực hiện nhiệm vụ:] #strong[Giáo viên] quan sát, đặc biệt lưu
  ý học sinh xác định đúng $P_(upright("vay"))$.
- #strong[Báo cáo, thảo luận:] Mời 2 nhóm #strong[báo cáo và thuyết
  trình] kết quả (kết quả và ý nghĩa thực tiễn).
- #strong[Kết luận, nhận định:] #strong[Giáo viên] tổng kết, khắc sâu 3
  công thức đã học qua một #strong[Sơ đồ tư duy] tóm tắt.

#hd("3", "Luyện tập", "10 phút")
==== a) Mục tiêu
- Củng cố, vận dụng linh hoạt 3 công thức đã học (Số tiền, Giá trị hiện
  tại, Mua trả góp) vào các bài tập cơ bản.

==== b) Nội dung
- #strong[Hệ thống bài tập:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + Bài tập vận dụng công thức #strong[Số tiền của niên kim] (tính tổng
    tiền tiết kiệm cuối kì).
  + Bài tập vận dụng công thức #strong[Giá trị hiện tại của niên kim]
    (tính số vốn vay ban đầu).
  + Bài tập tính toán #strong[số tiền trả góp] hàng tháng.
  ]
- #strong[Nhiệm vụ:] Học sinh làm việc cá nhân, sau đó kiểm tra chéo đáp
  án trong nhóm.

==== c) Sản phẩm
- Đáp án và lời giải chính xác cho các bài tập.

==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ:] Chiếu/phát phiếu bài tập.
- #strong[Thực hiện nhiệm vụ:] Học sinh độc lập giải quyết bài tập.
- #strong[Kiểm tra, đánh giá:] Mời 2-3 học sinh trình bày lời giải.
  #strong[Giáo viên] sửa lỗi sai và nhấn mạnh các lỗi thường gặp.

#hd("4", "Vận dụng", "10 phút")
==== a) Mục tiêu
- Phát triển năng lực giải quyết vấn đề và năng lực tài chính cho học
  sinh thông qua việc vận dụng kiến thức vào thực tiễn cá nhân.

==== b) Nội dung
- #strong[Nhiệm vụ:]
  - #strong[Tình huống mở:] \"Bạn muốn #strong[lên kế hoạch tài chính]
    để mua một món đồ có giá trị (laptop, xe máy, chi phí du học,...)
    trong 3 năm tới. Hãy tìm hiểu giá trị hiện tại của món đồ đó, xác
    định mức lãi suất gửi tiết kiệm (hoặc vay mua) hợp lí, và tính toán
    xem mỗi tháng bạn cần tiết kiệm/trả góp bao nhiêu tiền để đạt được
    mục tiêu.\"
  - #strong[Hình thức:] Học sinh làm việc cá nhân ngoài giờ học (nhà) và
    viết báo cáo/thiết kế một bài thuyết trình ngắn (2 phút).

==== c) Sản phẩm
- Báo cáo (dạng văn bản, slide, hoặc #strong[Sơ đồ tư duy]) về kế hoạch
  tài chính cá nhân (#strong[Hình thức báo cáo thể hiện năng lực số:
  Sáng tạo nội dung số]).

==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ:] #strong[Giáo viên] giao nhiệm vụ về nhà và yêu
  cầu nộp báo cáo (hoặc trình bày) vào đầu tiết học kế tiếp.
- #strong[Định hướng và đánh giá:] #strong[Giáo viên] định hướng cách
  thu thập thông tin thực tế (giá cả, lãi suất ngân hàng). Đánh giá dựa
  trên #strong[tính hợp lí, chính xác của tính toán] và #strong[cách
  thức trình bày] (khuyến khích sử dụng công cụ số).

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

