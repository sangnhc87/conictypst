// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 2 GTLN GTNN của hàm số",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Định nghĩa:] Nêu được định nghĩa giá trị lớn nhất (GTLN) và
  giá trị nhỏ nhất (GTNN) của hàm số trên một tập hợp $D$.
- #strong[Điều kiện tồn tại:] Nhận biết được điều kiện tồn tại GTLN,
  GTNN của hàm số liên tục trên một đoạn $\[a\;b\]$.
- #strong[Phương pháp:] Trình bày được cách tìm GTLN, GTNN của hàm số
  liên tục trên một đoạn $\[a\;b\]$ và trên một khoảng/nửa khoảng
  $\(a\;b\)$, $\[a\;b\)$,...
- #strong[Vận dụng:] Vận dụng được kiến thức để giải quyết các bài toán
  tìm GTLN, GTNN của hàm số trên các tập xác định khác nhau.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động, tích cực hoàn thành các nhiệm
    vụ học tập được giao (chuẩn bị bài, làm bài tập...).
  - #strong[Giao tiếp và hợp tác:] Tích cực tham gia thảo luận nhóm để
    giải quyết vấn đề, trình bày rõ ràng, chính xác ý kiến cá nhân và
    phản biện ý kiến của người khác.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích được các tình
    huống toán học, vận dụng linh hoạt các phương pháp tìm GTLN, GTNN để
    giải quyết bài tập và các vấn đề thực tiễn.
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận toán học:] Phát hiện được mối
    liên hệ giữa bảng biến thiên, đồ thị hàm số và GTLN, GTNN; Lập luận
    được cách tìm GTLN, GTNN.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa được một số vấn
    đề thực tiễn thành bài toán tìm GTLN, GTNN của hàm số.
- #strong[Năng lực số:]
  - #strong[Khả năng sử dụng các công cụ, phương tiện kỹ thuật số phục
    vụ học tập:] Sử dụng máy tính cầm tay (casio, vinacal) hoặc phần mềm
    (ví dụ: GeoGebra, Desmos) để kiểm tra kết quả hoặc khảo sát đồ thị
    hàm số, hỗ trợ việc tìm GTLN, GTNN

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, không ngại
  khó khăn khi thực hiện nhiệm vụ.
- #strong[Trách nhiệm:] Hoàn thành nhiệm vụ được giao (cá nhân và nhóm)
  một cách nghiêm túc; có thái độ nghiêm túc trong việc vận dụng kiến
  thức vào thực tiễn.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy tính, máy chiếu, Bài giảng điện tử
  (PowerPoint/Slide), Phiếu học tập, Sơ đồ tư duy (SĐTD) hoặc công cụ
  tạo SĐTD trực tuyến (ví dụ: Canva, MindMeister), Video khởi động (tình
  huống thực tiễn).
- #strong[Học sinh:] Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc
  sống), Vở ghi, Bút, Máy tính cầm tay, Điện thoại/Máy tính bảng (để sử
  dụng công cụ số khi cần thiết).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
#strong[a) Mục tiêu:] Tạo hứng thú, giúp học sinh xác định được vấn đề
tìm GTLN, GTNN xuất phát từ nhu cầu thực tiễn và xác định nhiệm vụ học
tập.

#strong[b) Nội dung:]

- #strong[GV:] Chiếu/Trình chiếu video về một tình huống thực tiễn liên
  quan đến tối ưu hóa (ví dụ: #strong[Tìm kích thước thùng carton có thể
  tích lớn nhất] hoặc #strong[Tìm thời gian để một chiếc máy bay đạt độ
  cao lớn nhất]).
- #strong[HS:] Quan sát, thảo luận nhóm 2-3 người để nhận diện vấn đề
  toán học ẩn chứa trong tình huống.
- #strong[Ví dụ cụ thể:] #emph[Một công ty muốn làm một chiếc hộp không
  nắp từ một tấm bìa hình vuông cạnh 60 cm bằng cách cắt ở bốn góc bốn
  hình vuông bằng nhau rồi gập tấm bìa lại. Hỏi phải cắt bỏ bốn hình
  vuông có cạnh bằng bao nhiêu để thể tích khối hộp là lớn nhất?]

#strong[c) Sản phẩm:] Câu trả lời của HS về vấn đề cần giải quyết:
#strong[Làm thế nào để tìm được giá trị lớn nhất (hoặc nhỏ nhất) của một
đại lượng (hàm số) trong một bài toán thực tế?]

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1 (Giao nhiệm vụ):] GV chiếu video/tình huống, yêu cầu HS
  thảo luận nhóm và ghi lại vấn đề cần giải quyết.
- #strong[Bước 2 (Thực hiện nhiệm vụ):] HS thảo luận, GV quan sát, gợi ý
  (Nếu HS gặp khó khăn: Gợi ý về mối liên hệ giữa cạnh hình vuông cắt bỏ
  và thể tích hộp).
- #strong[Bước 3 (Báo cáo, thảo luận):] Đại diện 1-2 nhóm trình bày vấn
  đề.
- #strong[Bước 4 (Kết luận, nhận định):] GV nhận xét, dẫn dắt: Để giải
  quyết vấn đề tối ưu hóa, ta cần tìm #strong[Giá trị lớn nhất và giá
  trị nhỏ nhất của hàm số]. (Kết thúc hoạt động, chuyển sang Hoạt động
  2).

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "85 phút")
Hoạt động này chia thành 2 hoạt động thành phần như yêu cầu:

===== Hoạt động thành phần 2.1: Định nghĩa GTLN, GTNN của hàm số (20 phút)
#strong[a) Mục tiêu:] Nắm vững khái niệm về GTLN, GTNN của hàm số trên
tập hợp $D$.

#strong[b) Nội dung:]

- #strong[GV:] Yêu cầu HS đọc SGK và quan sát đồ thị một hàm số
  $y = f\(x\)$ trên tập $D$.
- #strong[HS:] Thảo luận, hoàn thành định nghĩa GTLN, GTNN (Sử dụng
  Phiếu học tập số 1).
- #strong[Ví dụ cụ thể (minh họa):] #emph[Quan sát đồ thị hàm số]
  $y = x^2$ #emph[trên đoạn] $\[- 1\;2\]$#emph[. Xác định điểm cao nhất
  và điểm thấp nhất của đồ thị để từ đó nêu định nghĩa] $min f\(x\)$
  #emph[và] $max f\(x\)$#emph[.]
  - Sử dụng công cụ số: GV có thể chiếu đồ thị hàm số $y = x^2$ được vẽ
    bằng phần mềm #strong[GeoGebra] hoặc #strong[Desmos] để HS quan sát
    trực quan hơn (Biểu hiện của năng lực số: #strong[Khả năng khai
    thác, tìm kiếm, lựa chọn nguồn tài nguyên số]).

#strong[c) Sản phẩm:] Định nghĩa GTLN, GTNN của hàm số $y = f\(x\)$ trên
tập hợp $D$.

#strong[d) Tổ chức thực hiện:]

- GV hướng dẫn HS đọc SGK và sử dụng đồ thị trực quan (có thể từ phần
  mềm số).
- GV chốt lại kiến thức, nhấn mạnh ký hiệu $min_(x in D) f\(x\)$ và
  $max_(x in D) f\(x\)$.

===== Hoạt động thành phần 2.2: Cách tìm GTLN, GTNN của hàm số trên một đoạn (45 phút)
#strong[a) Mục tiêu:] Thiết lập và nắm vững quy tắc tìm GTLN, GTNN của
hàm số liên tục trên đoạn $\[a\;b\]$.

#strong[b) Nội dung:]

- #strong[GV:] Yêu cầu HS nhớ lại mối liên hệ giữa cực trị và GTLN,
  GTNN. Đưa ra hàm số liên tục trên đoạn.
- #strong[HS:] Hoạt động nhóm 4 người (kỹ thuật #strong[Khăn trải bàn])
  để xây dựng quy tắc tìm GTLN, GTNN trên đoạn $\[a\;b\]$ dựa trên kiến
  thức về khảo sát hàm số.
- #strong[Ví dụ cụ thể:] #emph[Tìm giá trị lớn nhất và giá trị nhỏ nhất
  của hàm số] $y = x^3 - 3 x + 1$ #emph[trên đoạn] $\[0\;2\]$#emph[.]

#strong[c) Sản phẩm:] Quy tắc 3 bước tìm GTLN, GTNN của hàm số liên tục
trên đoạn $\[a\;b\]$.

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1 (Giao nhiệm vụ):] GV đưa ra ví dụ cụ thể, yêu cầu các
  nhóm thảo luận và đề xuất các bước giải quyết.
- #strong[Bước 2 (Thực hiện nhiệm vụ):] Các nhóm thảo luận (Khăn trải
  bàn), ghi chép ý kiến cá nhân và thống nhất ý kiến chung.
- #strong[Bước 3 (Báo cáo, thảo luận):] GV mời đại diện một nhóm lên
  #strong[thuyết trình] về quy tắc đã xây dựng và giải ví dụ. Các nhóm
  khác phản biện, bổ sung.
- #strong[Bước 4 (Kết luận, nhận định):] GV chuẩn hóa 3 bước tìm GTLN,
  GTNN trên đoạn $\[a\;b\]$.

===== Hoạt động thành phần 2.3: Cách tìm GTLN, GTNN của hàm số trên một khoảng/nửa khoảng (20 phút)
#strong[a) Mục tiêu:] Vận dụng linh hoạt bảng biến thiên và đồ thị để
tìm GTLN, GTNN trên khoảng.

#strong[b) Nội dung:]

- #strong[GV:] Đưa ra ví dụ về hàm số trên khoảng mở $\(a\;b\)$, gợi ý
  HS sử dụng #strong[bảng biến thiên] hoặc #strong[đồ thị].
- #strong[HS:] Hoạt động cá nhân/cặp đôi, giải ví dụ và tự rút ra kinh
  nghiệm.
- #strong[Ví dụ cụ thể:] #emph[Tìm giá trị lớn nhất và nhỏ nhất (nếu có)
  của hàm số] $y = frac(2 x - 1, x - 1)$ #emph[trên khoảng]
  $\(1\;+ oo\)$#emph[.]

#strong[c) Sản phẩm:] Lời giải ví dụ và kết luận: Có thể tìm GTLN, GTNN
trên khoảng bằng cách lập bảng biến thiên (hoặc quan sát đồ thị).

#strong[d) Tổ chức thực hiện:]

- GV đưa ví dụ. HS giải.
- GV mời HS lên trình bày lời giải, chú trọng việc lập bảng biến thiên.
- GV nhấn mạnh sự khác biệt so với tìm trên đoạn (có thể không tồn tại
  GTLN hoặc GTNN).

#hd("3", "Luyện tập", "25 phút")
#strong[a) Mục tiêu:] Củng cố kiến thức, rèn luyện kỹ năng tìm GTLN,
GTNN, tăng cường kỹ năng làm việc nhóm.

#strong[b) Nội dung:]

- #strong[Hệ thống bài tập:]
  - Bài tập 1: Trắc nghiệm #strong[sử dụng máy tính cầm tay] để kiểm tra
    kết quả (MODE 7/TABLE) (Tích hợp năng lực số: #strong[Khả năng sử
    dụng các công cụ, phương tiện kỹ thuật số phục vụ học tập]).
  - Bài tập 2: Tự luận tìm GTLN, GTNN của hàm số có chứa căn thức hoặc
    lượng giác trên một đoạn.
  - Bài tập 3: Trò chơi học tập (#strong[Tiếp sức]): Các nhóm luân phiên
    giải các bài tập nhỏ liên quan đến GTLN, GTNN.

#strong[c) Sản phẩm:]

- Đáp án, lời giải đúng của các câu hỏi, bài tập.
- Kết quả hoàn thành trò chơi của các nhóm.

#strong[d) Tổ chức thực hiện:]

- #strong[Tổ chức trò chơi:] GV chia lớp thành 3-4 nhóm, mỗi nhóm cử đại
  diện giải quyết nhanh các bài tập nhỏ.
- #strong[Hướng dẫn và hỗ trợ:] GV quan sát, khuyến khích các nhóm sử
  dụng máy tính cầm tay để kiểm tra nhanh.
- #strong[Kiểm tra, đánh giá:] GV và HS cùng chữa bài, đánh giá kết quả
  của các nhóm tham gia trò chơi.

#hd("4", "Vận dụng", "10 phút")
#strong[a) Mục tiêu:] Phát triển năng lực mô hình hóa toán học và giải
quyết vấn đề thực tiễn thông qua việc vận dụng kiến thức.

#strong[b) Nội dung:]

- #strong[Nhiệm vụ:] Trở lại vấn đề mở đầu (Ví dụ: Thể tích thùng carton
  lớn nhất). Yêu cầu HS giải quyết trọn vẹn bài toán.
- #strong[Hoạt động mở rộng:] Yêu cầu HS sưu tầm một vấn đề thực tiễn
  khác có thể mô hình hóa thành bài toán tìm GTLN, GTNN của hàm số (Ví
  dụ: Bài toán tối ưu chi phí, tối ưu diện tích,...)

#strong[c) Sản phẩm:]

- Lời giải bài toán thể tích thùng carton lớn nhất.
- Báo cáo (trên giấy hoặc file trình chiếu) về vấn đề thực tiễn đã sưu
  tầm và lời giải đề xuất (Tích hợp năng lực số: #strong[Khả năng quản
  lí và bảo vệ dữ liệu, tài nguyên số]).

#strong[d) Tổ chức thực hiện:]

- #strong[Giao nhiệm vụ:] Giao cho HS thực hiện ngoài giờ học trên lớp
  (từ 3 đến 5 ngày).
- #strong[Yêu cầu báo cáo:] Khuyến khích HS sử dụng công cụ số
  (PowerPoint, Canva, Word) để trình bày báo cáo (Sản phẩm có thể được
  trao đổi, chia sẻ và đánh giá vào đầu tiết học tiếp theo).
- #strong[Đánh giá:] Chú trọng đánh giá bằng nhận xét quá trình HS mô
  hình hóa vấn đề và vận dụng kiến thức để giải quyết.

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

