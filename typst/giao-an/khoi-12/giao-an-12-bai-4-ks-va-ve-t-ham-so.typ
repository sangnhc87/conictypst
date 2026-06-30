// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 4 KS và vẽ ĐT hàm số",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được các bước cơ bản để khảo sát sự biến thiên và vẽ đồ thị của
  một hàm số.
- Trình bày được quy trình khảo sát và vẽ đồ thị của hàm số đa thức bậc
  ba.
- Trình bày được quy trình khảo sát và vẽ đồ thị của hàm số phân thức
  bậc nhất trên bậc nhất.
- Trình bày được quy trình khảo sát và vẽ đồ thị của hàm số phân thức
  bậc hai trên bậc nhất (Nội dung mở rộng/nâng cao).

#muc("2", "NĂNG LỰC")
==== a) Năng lực chung:
- #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực tìm kiếm, thu
  thập thông tin về các bước khảo sát hàm số.
- #strong[Năng lực giao tiếp và hợp tác:] Hợp tác hiệu quả trong nhóm để
  hoàn thành các nhiệm vụ khảo sát và vẽ đồ thị các loại hàm số.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp
  thông tin để giải quyết các vấn đề liên quan đến sự biến thiên và hình
  dạng đồ thị hàm số.

==== b) Năng lực đặc thù môn học (Năng lực Toán học):
- #strong[Năng lực tư duy và lập luận toán học:] Thực hiện được các thao
  tác tìm tập xác định, tính đạo hàm, lập bảng biến thiên, tìm điểm đặc
  biệt để khảo sát và vẽ đồ thị hàm số một cách logic.
- #strong[Năng lực mô hình hóa toán học:] Sử dụng các công cụ đạo hàm,
  giới hạn để mô hình hóa sự biến thiên của hàm số.
- #strong[Năng lực số:] #strong[Sử dụng, khai thác công cụ và môi trường
  số] : Sử dụng phần mềm vẽ đồ thị (như GeoGebra, Desmos) để kiểm tra,
  so sánh kết quả khảo sát và vẽ đồ thị bằng tay

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực trong việc thực hiện các bước khảo sát hàm
  số và hoàn thành các bài tập được giao.
- #strong[Trung thực:] Nghiêm túc, cẩn thận trong việc tính toán và vẽ
  đồ thị.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ nhóm, biết nhận xét
  và phản biện kết quả của nhóm bạn.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, bảng phụ (hoặc giấy
  A0/A1), phấn/bút viết bảng.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập (cho các hoạt động nhóm, luyện tập).
  - Tài liệu hướng dẫn sử dụng phần mềm GeoGebra/Desmos cơ bản.
  - Các hình ảnh/đồ thị đã được chuẩn bị sẵn của các loại hàm số.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
#mt-hd[
Giúp học sinh #strong[ôn tập kiến thức] về đạo hàm, cực trị, tiệm cận
(kiến thức nền tảng của lớp 11) và #strong[xác định rõ nhiệm vụ] cần
giải quyết: #strong[tìm hiểu quy trình chung và cụ thể hóa quy trình
khảo sát, vẽ đồ thị các loại hàm số.]

]
#nd-hd[
- Giáo viên (GV) đặt câu hỏi: \"Từ kiến thức đã học, làm thế nào để xác
  định được chiều biến thiên, điểm cực trị và tiệm cận của một hàm số
  $y = f\(x\)$?\"
- GV đặt vấn đề: \"Việc nắm rõ chiều biến thiên, cực trị, tiệm cận giúp
  ta vẽ được đồ thị hàm số một cách chính xác. Vậy, quy trình chung để
  khảo sát và vẽ đồ thị hàm số là gì? Hôm nay chúng ta sẽ tìm hiểu.\"

]
#sp-hd[
- Câu trả lời của học sinh (HS) về cách tìm cực trị (sử dụng đạo hàm) và
  tiệm cận.
- Sự nhận thức của HS về mục tiêu của bài học.
- GV tổng hợp và gợi ý về 4 bước khảo sát cơ bản.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:]
  - GV đặt câu hỏi gợi mở, yêu cầu HS thảo luận cặp đôi (3 phút) và trả
    lời.
- #strong[Thực hiện nhiệm vụ:]
  - HS hoạt động cặp đôi, GV quan sát, khuyến khích HS sử dụng sơ đồ tư
    duy nhỏ để hệ thống lại kiến thức cũ.
- #strong[Báo cáo, thảo luận:]
  - GV mời đại diện 2-3 cặp đôi trình bày, nhận xét.
- #strong[Kết luận, nhận định:]
  - GV chuẩn hóa kiến thức, dẫn dắt vào bài mới, giới thiệu tên bài học
    và các mục tiêu cụ thể.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "165 phút - 4 hoạt động thành phần")
=== 2.1. Sơ đồ khảo sát hàm số (30 phút)
#mt-hd[
HS #strong[chiếm lĩnh] quy trình chung 4 bước để khảo sát sự biến thiên
và vẽ đồ thị của một hàm số bất kì.

]
#nd-hd[
- GV yêu cầu HS làm việc nhóm (4-5 HS/nhóm) nghiên cứu SGK và thảo luận
  (10 phút) để đưa ra #strong[Sơ đồ 4 bước] khảo sát một hàm số.
- Tích hợp #strong[Năng lực số] (TT 02/2025/TT-BGDĐT: #strong[Sử dụng,
  khai thác công cụ và môi trường số]): Khuyến khích HS sử dụng điện
  thoại/máy tính bảng tra cứu nhanh, thống nhất cấu trúc Sơ đồ tư duy
  (Mindmap) để trình bày.

]
#sp-hd[
- Sơ đồ tư duy (Mindmap) hoặc danh sách các bước khảo sát hàm số, bao
  gồm:
  #block[
  #set enum(numbering: "a.", start: 1)
  + Tập xác định
  + Sự biến thiên (Đạo hàm, giới hạn, bảng biến thiên)
  + Đồ thị
  ]
- GV chuẩn hóa:
  - Bước 1: Tập xác định
  - Bước 2: Sự biến thiên (Chiều biến thiên, Cực trị, Giới hạn/Tiệm cận,
    Bảng biến thiên)
  - Bước 3: Đồ thị (Giao điểm với trục tọa độ, các điểm đặc biệt khác)

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ nghiên cứu SGK và lập
  Sơ đồ khảo sát.
- #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm, lập Sơ đồ tư duy. GV
  quan sát, hỗ trợ các nhóm gặp khó khăn.
- #strong[Báo cáo, thảo luận:] Mời 1 nhóm trình bày sản phẩm (trên bảng
  phụ hoặc máy chiếu). Các nhóm khác nhận xét, bổ sung.
- #strong[Kết luận, nhận định:] GV tổng hợp, chốt lại quy trình 4 bước
  và nhấn mạnh ý nghĩa của Bảng biến thiên.

=== 2.2. Khảo sát và vẽ đồ thị hàm số đa thức bậc ba (45 phút)
]
#mt-hd[
HS #strong[vận dụng] sơ đồ chung để khảo sát cụ thể hàm số
$y = a x^3 + b x^2 + c x + d$.

]
#nd-hd[
- GV giao nhiệm vụ nhóm: #strong[Khảo sát và vẽ đồ thị hàm số]
  $y = x^3 - 3 x^2 + 2$.
- Nhóm tự phân công nhiệm vụ, thực hiện đầy đủ 4 bước đã học.
- Tích hợp #strong[Năng lực số] (TT 02/2025/TT-BGDĐT: #strong[Sử dụng,
  khai thác công cụ và môi trường số]): Sau khi vẽ đồ thị bằng tay, HS
  sử dụng GeoGebra hoặc Desmos để vẽ đồ thị hàm số đã cho và so sánh với
  kết quả nhóm (Kiểm tra lại tính chính xác của bài làm).

]
#sp-hd[
- Bài giải chi tiết các bước khảo sát hàm số $y = x^3 - 3 x^2 + 2$.
- Đồ thị được vẽ trên giấy (hoặc bảng phụ).
- Nhận xét về các dạng đồ thị của hàm bậc ba.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ khảo sát ví dụ cụ
  thể, yêu cầu thực hiện đầy đủ các bước.
- #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm, GV theo dõi, hỗ trợ các
  nhóm tính toán đạo hàm, tìm cực trị.
- #strong[Báo cáo, thảo luận:]
  - Mời một nhóm trình bày chi tiết trên bảng, một nhóm khác trình bày
    đồ thị.
  - GV tổ chức trò chơi nhỏ \"Tìm lỗi sai\" hoặc \"Phản biện nhanh\" để
    HS tăng cường kỹ năng phân tích.
- #strong[Kết luận, nhận định:] GV chuẩn hóa quy trình, đồ thị, và tóm
  tắt các dạng đồ thị của hàm bậc ba (4 dạng cơ bản).

=== 2.3. Khảo sát và vẽ đồ thị hàm số phân thức bậc nhất trên bậc nhất (45 phút)
]
#mt-hd[
HS #strong[vận dụng] sơ đồ chung để khảo sát cụ thể hàm số
$y = frac(a x + b, c x + d)$, đặc biệt chú trọng việc tìm #strong[tiệm
cận].

]
#nd-hd[
- GV giao nhiệm vụ nhóm: #strong[Khảo sát và vẽ đồ thị hàm số]
  $y = frac(2 x + 1, x - 1)$.
- Nhóm tự phân công nhiệm vụ, thực hiện đầy đủ các bước, đặc biệt là
  #strong[tìm tiệm cận đứng và tiệm cận ngang].

]
#sp-hd[
- Bài giải chi tiết các bước khảo sát hàm số $y = frac(2 x + 1, x - 1)$.
- Xác định đúng tiệm cận đứng $x = 1$ và tiệm cận ngang $y = 2$.
- Đồ thị được vẽ trên giấy.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ khảo sát ví dụ cụ
  thể, nhấn mạnh tầm quan trọng của Tiệm cận và Tâm đối xứng.
- #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm. GV lưu ý HS cách tính
  giới hạn để tìm tiệm cận.
- #strong[Báo cáo, thảo luận:] Mời một nhóm trình bày bảng biến thiên và
  tiệm cận, một nhóm khác trình bày đồ thị. Các nhóm khác nhận xét.
- #strong[Kết luận, nhận định:] GV chuẩn hóa quy trình, đồ thị. Nhấn
  mạnh #strong[tiệm cận] là đặc trưng của loại hàm số này và Tâm đối
  xứng là giao điểm của hai tiệm cận.

=== 2.4. Khảo sát và vẽ đồ thị hàm số phân thức bậc hai trên bậc nhất (45 phút)
]
#mt-hd[
HS #strong[mở rộng và nâng cao] khả năng khảo sát đối với hàm phân thức
bậc hai trên bậc nhất $y = frac(a x^2 + b x + c, a' x + b')$, đặc biệt
là tìm #strong[tiệm cận xiên] (nếu có).

]
#nd-hd[
- GV giao nhiệm vụ nhóm: #strong[Khảo sát và vẽ đồ thị hàm số]
  $y = frac(x^2 + x + 1, x - 1)$. (Hướng dẫn HS chia đa thức để tìm tiệm
  cận xiên).
- Tích hợp #strong[Năng lực số] (TT 02/2025/TT-BGDĐT: #strong[Sử dụng,
  khai thác công cụ và môi trường số]): HS sử dụng phần mềm để kiểm tra
  sự tồn tại của tiệm cận xiên và hình dạng đồ thị.

]
#sp-hd[
- Bài giải chi tiết các bước khảo sát hàm số
  $y = frac(x^2 + x + 1, x - 1)$.
- Xác định đúng tiệm cận đứng $x = 1$ và tiệm cận xiên $y = x + 2$.
- Đồ thị được vẽ trên giấy (hoặc bảng phụ).

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ, hướng dẫn cách tìm
  tiệm cận xiên (chia đa thức).
- #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm, thảo luận cách chia đa
  thức. GV hỗ trợ sâu.
- #strong[Báo cáo, thảo luận:]
  - Mời 1 nhóm lên trình bày cách tìm tiệm cận xiên.
  - Các nhóm khác trình bày các bước còn lại.
- #strong[Kết luận, nhận định:] GV chuẩn hóa, nhấn mạnh rằng đây là kiến
  thức mở rộng và tiệm cận xiên là một khái niệm quan trọng.

]
#hd("3", "Luyện tập", "30 phút")
#mt-hd[
HS #strong[củng cố, vận dụng] kiến thức và kĩ năng khảo sát, vẽ đồ thị
thông qua hệ thống bài tập.

]
#nd-hd[
- GV tổ chức #strong[Trò chơi học tập] (Ví dụ: \"Ghép đôi đồ thị và hàm
  số\").
- Yêu cầu HS làm việc cá nhân/cặp đôi, sau đó dùng kết quả làm việc nhóm
  để giải quyết các bài tập sau:
  #block[
  #set enum(numbering: "a.", start: 1)
  + Cho đồ thị một hàm số bậc ba (hoặc phân thức), nhận dạng và tìm hàm
    số tương ứng.
  + Nêu nhanh các bước cần thực hiện để khảo sát hàm số
    $y = frac(x^2 + 2 x + 2, x + 1)$.
  ]

]
#sp-hd[
- Đáp án, lời giải đúng của các bài tập, đặc biệt là kĩ năng phân tích
  và tổng hợp thông tin để nhận dạng đồ thị.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV chiếu/phát phiếu bài tập luyện tập.
- #strong[Thực hiện nhiệm vụ:] HS thực hiện cá nhân/cặp đôi. GV quan
  sát, đi vòng quanh lớp hỗ trợ nhanh.
- #strong[Báo cáo, thảo luận:] Mời HS chữa bài, trình bày lời giải. GV
  tổ chức cho HS khác nhận xét, bổ sung.
- #strong[Kết luận, nhận định:] GV chuẩn hóa lời giải, nhấn mạnh các dấu
  hiệu nhận biết nhanh (cực trị, tiệm cận, hệ số $a$) để nhận dạng đồ
  thị.

]
#hd("4", "Vận dụng", "15 phút")
#mt-hd[
Phát triển #strong[năng lực giải quyết vấn đề thực tiễn] của HS thông
qua nhiệm vụ vận dụng kiến thức, kĩ năng vào thực tiễn.

]
#nd-hd[
- GV giao nhiệm vụ vận dụng (thực hiện ngoài giờ học): \"Sử dụng kiến
  thức khảo sát hàm số để #strong[mô tả và dự đoán] hình dạng (quỹ đạo)
  của một vật thể bay (ví dụ: quả bóng được ném, quỹ đạo đạn bắn,...)
  trong khoảng thời gian nhất định, biết rằng quỹ đạo này có thể mô hình
  hóa bằng một hàm đa thức bậc hai hoặc ba. Đưa ra nhận xét về điểm cao
  nhất (cực đại) hoặc vị trí xa nhất đạt được.\"
- HS được khuyến khích quay video ngắn, chụp ảnh hoặc sử dụng phần mềm
  để minh họa.

]
#sp-hd[
- Báo cáo (viết tay hoặc điện tử) về việc phát hiện và giải quyết tình
  huống/vấn đề thực tiễn.
- Trong báo cáo, HS phải trình bày:
  #block[
  #set enum(numbering: "a.", start: 1)
  + Mô hình hàm số đã chọn (ví dụ: $y = - 0.5 x^2 + 3 x + 1$).
  + Khảo sát các yếu tố cực trị, chiều biến thiên.
  + Kết luận thực tiễn (Ví dụ: Độ cao lớn nhất là...).
  ]

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ, hướng dẫn HS tìm
  kiếm tình huống thực tiễn phù hợp.
- #strong[Thực hiện nhiệm vụ:] HS thực hiện ngoài giờ học trên lớp.
- #strong[Báo cáo, thảo luận:] Nộp báo cáo vào buổi học tiếp theo để
  trao đổi, chia sẻ và đánh giá. GV đánh giá bằng nhận xét, tập trung
  vào tính sáng tạo và khả năng vận dụng kiến thức vào thực tế.

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
