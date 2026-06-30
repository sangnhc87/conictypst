// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 7 Cấp số nhân",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được #strong[định nghĩa] Cấp số nhân (CSN), bao gồm số hạng đầu
  $\(u_1\)$ và công bội $\(q\)$.
- Nắm vững công thức #strong[số hạng tổng quát] của CSN:
  $u_n = u_1 dot.op q^(n - 1)$.
- Nắm vững công thức #strong[tổng] $n$ #strong[số hạng đầu tiên] của
  CSN: $S_n = u_1 frac(1 - q^n, 1 - q)$ (khi $q eq.not 1$).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù:]
  - #strong[Năng lực tư duy và lập luận toán học:] Học sinh (HS) nhận
    biết và chứng minh được một dãy số là cấp số nhân.
  - #strong[Năng lực mô hình hóa toán học:] HS vận dụng công thức số
    hạng tổng quát và công thức tổng $n$ số hạng đầu để giải quyết các
    bài toán liên quan đến CSN.
  - #strong[Năng lực giải quyết vấn đề:] HS giải quyết được các bài toán
    thực tiễn có sử dụng kiến thức về CSN (ví dụ: bài toán lãi suất, dân
    số,...)
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] HS chủ động tìm hiểu khái niệm,
    công thức thông qua sách giáo khoa (SGK) và các học liệu số (video,
    website).
  - #strong[Năng lực giao tiếp và hợp tác:] HS tích cực trao đổi, thảo
    luận nhóm để hoàn thành nhiệm vụ và trình bày kết quả trước lớp.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - #strong[Biểu hiện:] HS biết sử dụng máy tính cầm tay hoặc phần mềm
    (ví dụ: GeoGebra, Excel) để kiểm tra, tính toán nhanh các giá trị
    của CSN hoặc vẽ đồ thị minh họa.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Có ý thức tìm tòi, khám phá kiến thức, hoàn thành
  các nhiệm vụ học tập.
- #strong[Trách nhiệm:] Có thái độ nghiêm túc trong học tập và hợp tác
  nhóm, có trách nhiệm với sản phẩm của mình và của nhóm.
- #strong[Trung thực:] Thể hiện sự trung thực khi làm bài cá nhân và
  thảo luận nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính giáo viên, bảng,
  phấn.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Tập 1, bộ Kết nối tri thức với cuộc sống).
  - Phiếu học tập (bài toán mở đầu).
  - Mạng internet, video về các tình huống thực tế liên quan đến CSN (ví
    dụ: lan truyền virus, lãi kép).
  - Phần mềm/ứng dụng hỗ trợ: #strong[Phần mềm trình chiếu
    (PowerPoint/Canva)] để thiết kế bài giảng sinh động, #strong[Phần
    mềm Mind Map] (Sơ đồ tư duy) để tổng hợp kiến thức.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
==== a) Mục tiêu
- Giúp HS xác định được vấn đề cần giải quyết: #strong[Tìm ra quy luật]
  của dãy số đặc biệt và #strong[xây dựng công thức tổng quát] cho dãy
  số đó, tạo nhu cầu tìm hiểu về Cấp số nhân.

==== b) Nội dung
- GV giao #strong[Bài toán mở đầu (Tình huống thực tiễn):]
  - \"Bác An gửi tiết kiệm 100 triệu đồng vào ngân hàng với lãi suất
    #strong[10% một năm], theo hình thức lãi kép (tiền lãi năm trước
    được cộng vào tiền vốn để tính lãi cho năm sau). Hỏi số tiền (cả vốn
    và lãi) bác An có được sau mỗi năm là bao nhiêu?\"
  - #strong[Nhiệm vụ:] HS làm việc cá nhân, tính toán số tiền sau năm 1,
    năm 2, năm 3.

==== c) Sản phẩm
- Kết quả tính toán:
  - Sau năm 1: $100 times\(1 + 0.1\)= 110$ (triệu)
  - Sau năm 2: $110 times\(1 + 0.1\)= 121$ (triệu)
  - Sau năm 3: $121 times\(1 + 0.1\)= 133.1$ (triệu)
- HS nêu nhận xét về #strong[quy luật] của dãy số tiền qua các năm: Số
  tiền năm sau bằng số tiền năm trước nhân với $1.1$.
- HS mô tả được nhiệm vụ cần thực hiện tiếp theo: #strong[Nghiên cứu
  định nghĩa và công thức tổng quát] cho loại dãy số này.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình chiếu tình huống, yêu
  cầu HS tính toán và ghi kết quả ra nháp trong 3 phút.
- #strong[Bước 2: Thực hiện nhiệm vụ:] HS tự tính toán. GV quan sát, dự
  kiến khó khăn (HS nhầm lẫn giữa lãi đơn và lãi kép) và hỗ trợ bằng
  cách gợi ý: \"Tiền lãi năm sau được tính trên tổng cả vốn và lãi của
  năm trước.\"
- #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 HS trình bày kết quả,
  gọi HS khác nhận xét.
- #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa kết quả, nhấn mạnh
  quy luật của dãy số (số hạng sau bằng số hạng trước nhân với một số
  không đổi). GV dẫn dắt vào bài mới: \"Dãy số có quy luật như vậy được
  gọi là #strong[Cấp số nhân]\.\"

#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "60 phút")
==== 2.1. Hoạt động thành phần 2.1: Định nghĩa Cấp số nhân (15 phút)
===== a) Mục tiêu
- HS nắm được định nghĩa CSN, số hạng đầu $u_1$ và công bội $q$.
- HS biết nhận dạng một dãy số là CSN.

===== b) Nội dung
- #strong[Nhiệm vụ 1:] HS làm việc với SGK (đọc/nghe/nhìn) để rút ra
  #strong[Định nghĩa] CSN và khái niệm #strong[Công bội] ($q$).
- #strong[Nhiệm vụ 2:] #strong[Ví dụ minh họa:] Cho dãy số $\(u_n\)$ với
  $u_n = 5 dot.op 3^(n - 1)$. Hỏi $\(u_n\)$ có phải là CSN không? Nếu
  có, tìm $u_1$ và $q$.
  - #emph[Gợi ý sử dụng NL Số:] Khuyến khích HS sử dụng máy tính cầm tay
    để tính nhanh $u_1\,u_2\,u_3\,u_4$ để kiểm tra (Biểu hiện NL Số:
    #strong[Sử dụng các công cụ số để hỗ trợ hoạt động học và nghiên cứu
    khoa học]).

===== c) Sản phẩm
- #strong[Định nghĩa:] Dãy số $\(u_n\)$ là CSN nếu
  $u_(n + 1) = u_n dot.op q$ với $n in bb(N)^(*)$, trong đó $q$ là công
  bội ($q$ là hằng số)
- #strong[Ví dụ:] Dãy số đã cho là CSN với $u_1 = 5$ và $q = 3$.

===== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ:] GV yêu cầu HS làm việc nhóm (3 phút)
  để hoàn thành Nhiệm vụ 1 và 2.
- #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc nhóm. GV quan sát,
  nhắc nhở về điều kiện của $q$ (hằng số, $q eq.not 0$).
- #strong[Bước 3: Báo cáo, thảo luận:] Đại diện nhóm trình bày định
  nghĩa và lời giải ví dụ. Các nhóm khác bổ sung, phản biện.
- #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa định nghĩa, nhấn
  mạnh vai trò của $u_1$ và $q$.

==== 2.2. Hoạt động thành phần 2.2: Số hạng tổng quát (25 phút)
===== a) Mục tiêu
- HS tìm ra và nắm vững công thức số hạng tổng quát:
  $u_n = u_1 dot.op q^(n - 1)$.
- HS vận dụng công thức để giải các bài toán tìm số hạng bất kỳ.

===== b) Nội dung
- #strong[Nhiệm vụ 3 (Kĩ thuật đặt vấn đề - Nêu vấn đề):] Từ định nghĩa:
  $u_2 = u_1 dot.op q$, $u_3 = u_2 dot.op q = u_1 dot.op q^2$, \... HS
  thảo luận nhóm để dự đoán và chứng minh công thức #strong[Số hạng tổng
  quát] $u_n$.
- #strong[Nhiệm vụ 4 (Bài tập vận dụng):] #strong[Ví dụ:] Cho CSN có
  $u_1 = 2$ và $q = - 3$. Tìm $u_6$.
  - #strong[Thảo luận mở:] Nếu cho $u_3 = 12$ và $u_5 = 48$, làm thế nào
    để tìm $u_1$ và $q$? (Gợi mở công thức
    $u_k = u_m dot.op q^(k - m)$).

===== c) Sản phẩm
- Công thức số hạng tổng quát: $u_n = u_1 dot.op q^(n - 1)$.
- Ví dụ: $u_6 = u_1 dot.op q^(6 - 1) = 2 dot.op\(- 3\)^5= - 486$.
- Thảo luận mở: Sử dụng
  $u_5 / u_3 = q^2 arrow.r.double q^2 = 4 arrow.r.double q = plus.minus 2$.
  Từ đó tìm $u_1$.

===== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ:] GV trình bày chuỗi lập luận dẫn đến
  công thức. HS thảo luận nhóm 5 phút để hoàn thành Nhiệm vụ 3 và 4.
- #strong[Bước 2: Thực hiện nhiệm vụ:] HS chứng minh, giải bài tập. GV
  quan sát, định hướng cho nhóm gặp khó khăn sử dụng phép biến đổi tương
  đương để rút gọn.
- #strong[Bước 3: Báo cáo, thảo luận:] GV mời một nhóm lên trình bày
  cách tìm ra công thức; mời một nhóm khác giải Ví dụ 4. Khuyến khích HS
  sử dụng #strong[Sơ đồ tư duy] để tổng hợp các công thức tìm $u_n$ khi
  biết các dữ kiện khác nhau (tăng cường kĩ năng tổng hợp thông tin).
- #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa công thức và cách
  vận dụng công thức.

==== 2.3. Hoạt động thành phần 2.3: Tổng n số hạng đầu của CSN (20 phút)
===== a) Mục tiêu
- HS tìm ra và nắm vững công thức tổng $n$ số hạng đầu $S_n$.
- HS vận dụng công thức để giải quyết bài toán thực tế.

===== b) Nội dung
- #strong[Nhiệm vụ 5 (Kĩ thuật tạo tình huống xung đột nhận thức):] GV
  yêu cầu HS tự tìm cách tính $S_n = u_1 + u_2 + . . . + u_n$. Gợi ý
  nhân $S_n$ với $q$ và trừ đi $S_n$ để triệt tiêu các số hạng.
- #strong[Nhiệm vụ 6 (Bài toán thực tiễn - Phương pháp Bàn tay nặn
  bột/Dự án nhỏ):]
  - #strong[Ví dụ:] Một loại cây đặc biệt sinh sôi nảy nở. Ngày thứ nhất
    có 1 lá, ngày thứ hai có 2 lá, ngày thứ ba có 4 lá,... cứ thế tiếp
    tục (tạo thành một CSN). Hỏi sau 10 ngày, tổng số lá mà cây đó đã có
    là bao nhiêu?

===== c) Sản phẩm
- Công thức tổng $n$ số hạng đầu: $S_n = u_1 frac(1 - q^n, 1 - q)$ (khi
  $q eq.not 1$).
- Ví dụ: $u_1 = 1\,q = 2$.
  $S_10 = 1 dot.op frac(1 - 2^10, 1 - 2) = 1023$ (lá).

===== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ:] GV giao Nhiệm vụ 5 và 6. HS làm việc
  nhóm.
- #strong[Bước 2: Thực hiện nhiệm vụ:] HS tự tìm cách chứng minh công
  thức. GV hỗ trợ bằng gợi ý. #emph[Khó khăn dự kiến: HS nhầm lẫn trường
  hợp] $q = 1$ #emph[\(lúc đó] $S_n = n dot.op u_1$#emph[)]. GV nhắc nhở
  xử lý trường hợp $q = 1$ riêng.
- #strong[Bước 3: Báo cáo, thảo luận:] Mời 1-2 nhóm trình bày cách chứng
  minh và giải bài toán thực tế. Khuyến khích #strong[kĩ năng giao tiếp
  và thuyết trình] khi báo cáo.
- #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa công thức, đặc biệt
  nhấn mạnh ý nghĩa của $S_n$ trong các bài toán thực tế (ví dụ: lãi
  kép, tổng quãng đường di chuyển,...).

#hd("3", "Luyện tập", "15 phút")
==== a) Mục tiêu
- HS củng cố kiến thức, vận dụng thành thạo các công thức vào giải bài
  tập có cấu trúc tương tự.
- Phát triển kĩ năng tính toán nhanh, chính xác.

==== b) Nội dung
- #strong[Hệ thống bài tập (Trò chơi học tập: \"Tiếp sức tính nhanh\"):]
  - #strong[Bài 1:] Cho CSN với $u_4 = 27$ và $q = 3$. Tìm $u_1$.
  - #strong[Bài 2:] Cho CSN $\(u_n\)$ biết $u_1 = 1\,u_2 = - 2$. Tính
    $S_5$.
  - #strong[Bài 3:] Cho dãy số $1\,2\,4\,8\,dots.h\,256$. Hỏi dãy số này
    có bao nhiêu số hạng?
- #emph[Tích hợp NL Số (Tùy chọn):] #strong[Sử dụng ứng dụng
  Quizizz/Kahoot] để tổ chức trò chơi, giúp HS trả lời nhanh và kiểm tra
  kết quả ngay lập tức (Biểu hiện NL Số: #strong[Tìm kiếm, tiếp cận,
  khai thác, sử dụng thông tin và dữ liệu số một cách hiệu quả]).

==== c) Sản phẩm
- #strong[Bài 1:]
  $u_4 = u_1 dot.op q^3 arrow.r.double 27 = u_1 dot.op 3^3 arrow.r.double u_1 = 1$.
- #strong[Bài 2:] $q = u_2 / u_1 = - 2$.
  $S_5 = 1 dot.op frac(1 -\(- 2\)^5, 1 -\(- 2\)) = frac(1 -\(- 32\), 3) = 11$.
- #strong[Bài 3:] $u_1 = 1\,q = 2$.
  $u_n = 1 dot.op 2^(n - 1) = 256 = 2^8 arrow.r.double n - 1 = 8 arrow.r.double n = 9$.
  (Dãy có 9 số hạng).

==== d) Tổ chức thực hiện
- GV chia lớp thành các đội. GV lần lượt trình chiếu các bài tập. Các
  đội tính toán và ghi đáp án nhanh lên bảng con hoặc gửi đáp án qua
  công cụ số (nếu sử dụng Quizizz/Kahoot).
- GV kiểm tra, đánh giá kết quả, nhận xét chung về quá trình làm bài và
  tính chính xác.

#hd("4", "Vận dụng", "5 phút")
==== a) Mục tiêu
- Phát triển năng lực của HS thông qua việc vận dụng kiến thức CSN để
  giải quyết các vấn đề trong thực tiễn cuộc sống.

==== b) Nội dung
- #strong[Nhiệm vụ:] Tìm kiếm các ví dụ thực tế khác trong cuộc sống
  (ngoài ví dụ lãi suất) có mô hình là Cấp số nhân.
  - #emph[Gợi ý:] Sự phát triển của vi khuẩn, sự lan truyền thông tin
    trên mạng xã hội, sự suy giảm phóng xạ,...
  - #strong[Nhiệm vụ cụ thể:] Chọn 1 ví dụ thực tế, xác định $u_1$ và
    $q$, mô tả bài toán và đề xuất cách giải quyết.

==== c) Sản phẩm
- Báo cáo bằng văn bản (hoặc file trình chiếu, sơ đồ tư duy số - tùy
  chọn) về tình huống thực tiễn được phát hiện và giải quyết.
  - #emph[Ví dụ:] Bài toán sự phát triển của vi khuẩn (ban đầu 1 con,
    sau mỗi giờ tăng gấp đôi, $u_1 = 1\,q = 2$).
- GV khuyến khích #strong[tự học và sáng tạo] khi làm bài tập vận dụng.

==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ:] GV giao nhiệm vụ cho HS thực hiện
  #strong[ngoài giờ học trên lớp].
- #strong[Kiểm tra, đánh giá:] HS nộp sản phẩm (báo cáo) vào buổi học
  tiếp theo hoặc vào thời điểm phù hợp trong kế hoạch môn học để GV trao
  đổi, chia sẻ và đánh giá.

#figure(
  align(center)[#table(
    columns: (33.18%, 46.97%),
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

