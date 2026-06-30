// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 20 HS mũ và HS Lôgarit",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được định nghĩa hàm số mũ $y = a^x$ và hàm số lôgarit
  $y = log_a x$ ($a > 0$, $a eq.not 1$).
- Nêu được các tính chất cơ bản về tập xác định, tập giá trị, sự biến
  thiên của hàm số mũ và hàm số lôgarit (trường hợp $a > 1$).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận toán học:] Quan sát đồ thị, nhận
    biết và so sánh các tính chất của hàm số mũ và hàm số lôgarit.
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng định nghĩa để
    tính toán giá trị đơn giản của hàm số mũ và hàm số lôgarit.
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán:] Sử dụng máy
    tính cầm tay hoặc phần mềm (như GeoGebra, Desmos) để vẽ đồ thị, kiểm
    tra kết quả.
- #strong[Năng lực chung:]
  - #strong[Năng lực tự học:] Đọc và nghiên cứu sách giáo khoa, hoàn
    thành nhiệm vụ được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] Thảo luận nhóm, trình bày,
    phản biện về các tính chất của hàm số.
- #strong[Năng lực số (theo TT số 02/2025/TT-BGDĐT):]
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tìm tòi, nghiên cứu tài liệu và hoàn thành
  nhiệm vụ học tập.
- #strong[Trung thực:] Nghiêm túc, thật thà trong quá trình làm việc
  nhóm, báo cáo kết quả.
- #strong[Trách nhiệm:] Có ý thức hợp tác, xây dựng sản phẩm nhóm, hoàn
  thành nhiệm vụ học tập cá nhân và nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối internet, máy
  tính cầm tay.
- #strong[Học liệu:] Sách giáo khoa Toán 11 (Tập 1 - Kết nối tri thức
  với cuộc sống), phiếu học tập, #strong[bản trình chiếu (slide) mô
  phỏng đồ thị hàm số mũ và lôgarit] , phần mềm GeoGebra hoặc Desmos
  (trực tuyến hoặc cài đặt).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "5 phút")
#mt-hd[
Tạo hứng thú, gợi mở vấn đề về mối liên hệ giữa
  hàm số đã học và kiến thức mới, giúp học sinh xác định được nhiệm vụ
  tìm hiểu về định nghĩa và tính chất của hàm số mũ.
]
#nd-hd[
Giáo viên đặt câu hỏi gợi mở:
  - Câu hỏi 1: Hãy nhắc lại định nghĩa lũy thừa với số mũ thực?
  - Câu hỏi 2: Chúng ta đã học các hàm số nào mà biến số nằm ở cơ số (ví
    dụ: $y = x^2$)? #strong[Nếu biến số nằm ở số mũ (ví dụ:]
    $y = 2^x$#strong[), đó là hàm số gì?]
  - #strong[Nhiệm vụ:] Nhóm/Cá nhân dự đoán và trả lời câu hỏi 2.
]
#sp-hd[
Câu trả lời của học sinh: Biến số ở số mũ tạo ra
  một loại hàm số mới (dự đoán là hàm số mũ).
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên trình chiếu hai câu hỏi và yêu cầu
    học sinh thảo luận cặp đôi trong 1 phút.
  - #strong[Thực hiện nhiệm vụ:] Học sinh trao đổi, ghi lại ý kiến nhanh
    ra nháp.
  - #strong[Báo cáo, thảo luận:] Mời 1-2 học sinh trả lời.
  - #strong[Kết luận, nhận định:] Giáo viên dẫn dắt vào bài học mới: Hàm
    số mũ và Hàm số lôgarit.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "30 phút")
==== #strong[2.1. Hoạt động thành phần 2.1: Hàm số mũ (15 phút)]
#mt-hd[
Giúp học sinh nắm vững định nghĩa, tập xác định,
  và các tính chất cơ bản của hàm số mũ $y = a^x$ (tập trung vào trường
  hợp $a > 1$).
]
#nd-hd[
#strong[Phương pháp Dạy học tích cực:] Sử dụng
  Kĩ thuật #strong[Khám phá có hướng dẫn] kết hợp với #strong[Năng lực
  số].
  - #strong[Nhiệm vụ 1 (Cá nhân/Nhóm 4):] Đọc SGK và nêu định nghĩa hàm
    số mũ $y = a^x$.
  - #strong[Nhiệm vụ 2 (Nhóm 4 - Tích hợp Năng lực số):] Sử dụng phần
    mềm #strong[Desmos hoặc GeoGebra] để:
    - Vẽ đồ thị các hàm số $y = 2^x$ và $y = 3^x$.
    - Quan sát đồ thị và nhận xét về: Tập xác định; tập giá trị; tính
      đồng biến/nghịch biến (sự biến thiên); giao điểm với trục tung.
  - #strong[Ví dụ minh họa:] Cho hàm số $f\(x\)= 2^x$. Hãy tính
    $f\(0\)$, $f\(3\)$, $f\(- 2\)$.
]
#sp-hd[
  - Định nghĩa Hàm số mũ: $y = a^x$ với $a > 0$, $a eq.not 1$.
  - Kết quả quan sát đồ thị (trường hợp $a > 1$): TXĐ $D bb(= R)$, tập
    giá trị $T =\(0\;+ oo\)$, hàm số đồng biến.
  - Kết quả tính toán: $f\(0\)= 1$, $f\(3\)= 8$, $f\(- 2\)= 1\/4$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên chia nhóm, giao phiếu học tập,
    hướng dẫn cách sử dụng Desmos/GeoGebra để nhập hàm số (tập trung vào
    HĐ 2.2).
  - #strong[Thực hiện nhiệm vụ (Hỗ trợ Năng lực số):] Học sinh thực hiện
    nhiệm vụ nhóm. Giáo viên quan sát, hỗ trợ kịp thời các nhóm gặp khó
    khăn trong việc sử dụng công cụ số.
  - #strong[Báo cáo, thảo luận:] Mời đại diện một nhóm trình bày kết quả
    quan sát đồ thị và nhận xét tính chất. #strong[Giáo viên chiếu lại
    đồ thị] $y = 2^x$ để cả lớp cùng quan sát và thống nhất kiến thức.
  - #strong[Kết luận, nhận định:] Chốt kiến thức về định nghĩa và tính
    chất của hàm số mũ (trường hợp $a > 1$).

==== #strong[2.2. Hoạt động thành phần 2.2: Hàm số Lôgarit (15 phút)]
]
#mt-hd[
Giúp học sinh nắm vững định nghĩa, tập xác định,
  và các tính chất cơ bản của hàm số lôgarit $y = log_a x$ (tập trung
  vào trường hợp $a > 1$), nhận thấy mối liên hệ là hàm ngược của hàm số
  mũ.
]
#nd-hd[
#strong[Phương pháp Dạy học tích cực:] Sử dụng
  Kĩ thuật #strong[Học tập bằng sơ đồ tư duy (Mind Map)].
  - #strong[Nhiệm vụ 3 (Cá nhân/Nhóm 4):] Dựa vào kiến thức về lôgarit
    và mối quan hệ với hàm số mũ, nêu định nghĩa hàm số lôgarit
    $y = log_a x$.
  - #strong[Nhiệm vụ 4 (Nhóm 4 - Tích hợp Năng lực số/Giao tiếp):]
    - Vẽ đồ thị hai hàm số $y = 2^x$ và $y = log_2 x$ trên cùng một hệ
      trục tọa độ (sử dụng công cụ số).
    - Quan sát đồ thị và nhận xét về: Tập xác định; tập giá trị; tính
      đồng biến/nghịch biến; giao điểm với trục hoành.
    - #strong[Thiết lập Sơ đồ tư duy] về các tính chất của hàm số
      lôgarit ($a > 1$) và mối liên hệ với hàm số mũ.
  - #strong[Ví dụ minh họa:] Cho hàm số $g\(x\)= log_2 x$. Hãy tính
    $g\(1\)$, $g\(4\)$, $g\(1\/8\)$.
]
#sp-hd[
  - Định nghĩa Hàm số lôgarit: $y = log_a x$ với $a > 0$, $a eq.not 1$.
  - Kết quả quan sát đồ thị (trường hợp $a > 1$): TXĐ $D =\(0\;+ oo\)$,
    tập giá trị $T bb(= R)$, hàm số đồng biến.
  - Kết quả tính toán: $g\(1\)= 0$, $g\(4\)= 2$, $g\(1\/8\)= - 3$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên giao nhiệm vụ 3 và 4. Nhấn mạnh
    việc sử dụng đồ thị trong Desmos để trực quan hóa mối quan hệ hàm
    ngược ($y = x$ là trục đối xứng).
  - #strong[Thực hiện nhiệm vụ:] Học sinh thực hiện nhiệm vụ nhóm, giáo
    viên hỗ trợ, theo dõi.
  - #strong[Báo cáo, thảo luận:] Mời đại diện một nhóm trình bày sơ đồ
    tư duy về tính chất. Nhóm khác nhận xét.
  - #strong[Kết luận, nhận định:] Chốt kiến thức về định nghĩa và tính
    chất của hàm số lôgarit ($a > 1$).

]
#hd("3", "Luyện tập", "7 phút")
#mt-hd[
Củng cố định nghĩa và các tính chất cơ bản của
  hàm số mũ và hàm số lôgarit thông qua các bài tập nhận dạng và tính
  toán đơn giản, phát triển #strong[kĩ năng phân tích và tổng hợp thông
  tin].
]
#nd-hd[
#strong[Phương pháp Dạy học tích cực:]
  #strong[Trò chơi học tập] (Ai nhanh hơn).
  - #strong[Bài tập 1 (Nhận dạng):] Hàm số nào sau đây là hàm số mũ/hàm
    số lôgarit?
    - A. $y = x^e$
    - B. $y = e^x$
    - C. $y = l n x$
    - D. $y = log_10 x^2$
  - #strong[Bài tập 2 (Vận dụng tính chất):] Tìm tập xác định của hàm số
    $y = 2^(x^2 - 1)$.
  - #strong[Bài tập 3 (Vận dụng tính chất):] Tính giá trị của
    $f\(x\)= 3^x$ tại $x = log_3 5$.
]
#sp-hd[
Đáp án và lời giải đúng cho các bài tập.
  - Bài 1: Hàm số mũ: B. $y = e^x$. Hàm số lôgarit: C. $y = l n x$.
  - Bài 2: $D bb(= R)$.
  - Bài 3: $f\(log_3 5\)= 5$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên trình chiếu 3 bài tập và tổ chức
    cho học sinh chơi trò chơi \"Ai nhanh hơn\" (cá nhân hoặc nhóm nhỏ)
    trong 5 phút.
  - #strong[Thực hiện nhiệm vụ:] Học sinh nhanh chóng trả lời.
  - #strong[Kiểm tra, đánh giá:] Giáo viên mời học sinh trình bày nhanh
    đáp án và giải thích ngắn gọn, từ đó đánh giá mức độ hiểu bài của
    học sinh.

]
#hd("4", "Vận dụng", "3 phút")
#mt-hd[
Phát triển năng lực vận dụng kiến thức vào thực
  tiễn, khơi gợi sự tò mò và tìm hiểu thêm về ứng dụng của hàm số mũ.
]
#nd-hd[
Mô tả rõ yêu cầu học sinh #strong[phát hiện/đề
  xuất] các vấn đề/tình huống trong thực tiễn.
  - #strong[Nhiệm vụ (Vận dụng thực tiễn):] Hãy tìm hiểu xem hàm số
    mũ/lôgarit được ứng dụng trong những lĩnh vực nào trong đời sống (ví
    dụ: lãi kép, dân số, độ pH, đo độ Richter của động đất,...) và ghi
    lại.
]
#sp-hd[
Báo cáo (viết tay/file mềm) về ít nhất một ứng
  dụng thực tế của hàm số mũ hoặc lôgarit.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên giao nhiệm vụ thực hiện
    #strong[ngoài giờ học trên lớp].
  - #strong[Thời hạn:] Thu và đánh giá báo cáo vào tiết học tiếp theo
    hoặc buổi sinh hoạt nhóm/lớp phù hợp.

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
