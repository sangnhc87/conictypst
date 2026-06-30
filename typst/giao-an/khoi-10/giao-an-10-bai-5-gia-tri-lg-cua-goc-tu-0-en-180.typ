// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 5 Giá trị LG của góc từ 0 đến 180",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Nhận biết] và #strong[nêu được] định nghĩa giá trị lượng giác
  ($sin alpha$, $cos alpha$, $tan alpha$, $cot alpha$) của một góc
  $alpha$ với $0^compose lt.eq alpha lt.eq 180^compose$ dựa trên đường
  tròn đơn vị hoặc hệ trục tọa độ.
- #strong[Phát biểu] và #strong[áp dụng được] mối quan hệ giữa các giá
  trị lượng giác của hai góc bù nhau.
- #strong[Vận dụng] các công thức cơ bản đã học để tính giá trị lượng
  giác của một góc đặc biệt (ví dụ:
  $30^compose\,45^compose\,60^compose\,120^compose\,135^compose\,150^compose$)
  hoặc rút gọn biểu thức.

#muc("2", "NĂNG LỰC")
====  Năng lực chung:
- #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến
  thức mới về định nghĩa và các công thức lượng giác thông qua SGK và
  học liệu được giao.
- #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm, trình
  bày, bảo vệ ý kiến, hợp tác giải quyết các bài tập và nhiệm vụ học
  tập.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Đề xuất được giải
  pháp xác định giá trị lượng giác và vận dụng linh hoạt các công thức
  để giải quyết bài toán.

====  Năng lực đặc thù (Năng lực Toán học):
- #strong[Năng lực tư duy và lập luận toán học:] Phân tích định nghĩa,
  lập luận để rút ra mối quan hệ giữa các giá trị lượng giác của hai góc
  bù nhau.
- #strong[Năng lực mô hình hóa toán học:] Sử dụng hệ trục tọa độ và
  đường tròn đơn vị để mô hình hóa và xác định các giá trị lượng giác.
- #strong[Năng lực sử dụng công cụ, phương tiện học toán (Tích hợp Năng
  lực số):] Sử dụng máy tính cầm tay, phần mềm đồ họa (ví dụ: GeoGebra)
  hoặc các ứng dụng học tập trực tuyến để kiểm tra, tính toán, và minh
  họa các giá trị lượng giác.
- #strong[Năng lực tư duy và lập luận toán học:] Phân tích định nghĩa,
  lập luận để rút ra mối quan hệ giữa các giá trị lượng giác của hai góc
  bù nhau.

#emph[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
- #strong[Sử dụng các công nghệ số để tìm kiếm, lưu trữ, xử lí, trao đổi
  thông tin, dữ liệu] (Thực hiện tính toán và kiểm tra kết quả bằng máy
  tính cầm tay hoặc các ứng dụng tính toán online).

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực hoàn thành các nhiệm vụ học tập cá nhân và
  nhóm.
- #strong[Trung thực:] Nghiêm túc trong tính toán, báo cáo kết quả và tự
  đánh giá.
- #strong[Trách nhiệm:] Có ý thức hợp tác, xây dựng ý kiến trong nhóm và
  hoàn thành nhiệm vụ được giao.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính giáo viên, bảng,
  phấn.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập, giấy A0/bút dạ (cho hoạt động nhóm).
  - #strong[Công cụ số (Tích hợp Năng lực số):] Máy tính cầm tay, điện
    thoại thông minh/máy tính bảng (nếu có), phần mềm #strong[GeoGebra]
    (để mô phỏng đường tròn đơn vị và các góc) hoặc trang web trắc
    nghiệm/bài tập online (ví dụ: Quizizz, Kahoot!).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
- Ôn tập và kết nối kiến thức về tỉ số lượng giác của góc nhọn
  ($alpha < 90^compose$).
- Tạo tình huống có vấn đề, giúp học sinh nhận thấy nhu cầu mở rộng khái
  niệm tỉ số lượng giác cho góc lớn hơn $90^compose$ (từ $0^compose$ đến
  $180^compose$).

]
#nd-hd[
- #strong[Nhiệm vụ:] Giáo viên trình chiếu một góc tù (ví dụ:
  $alpha = 120^compose$) và đặt câu hỏi: \"Trong Tam giác vuông, các em
  đã học tỉ số lượng giác của góc nhọn. Vậy tỉ số lượng giác của một góc
  tù như $120^compose$ có được định nghĩa không? Nếu có, chúng ta sẽ
  định nghĩa nó như thế nào?\"
- #strong[Thao tác của học sinh:] Xem tình huống/câu hỏi, trao đổi nhanh
  với bạn bên cạnh, ghi nhận vấn đề cần giải quyết.

]
#sp-hd[
- Kết quả xử lí tình huống: Học sinh nhận thấy kiến thức cũ chỉ áp dụng
  cho góc nhọn, cần phải mở rộng khái niệm để xử lí các góc từ
  $0^compose$ đến $180^compose$.
- Nhiệm vụ học tập tiếp theo: Định nghĩa các giá trị lượng giác của một
  góc $alpha$ với $0^compose lt.eq alpha lt.eq 180^compose$.

]
#tc-hd[
- #strong[Giao nhiệm vụ:] Giáo viên trình bày tình huống/câu hỏi, yêu
  cầu học sinh thảo luận cặp đôi trong 2 phút.
- #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận (Giáo viên quan sát,
  hỗ trợ, khích lệ).
- #strong[Báo cáo, thảo luận:] Mời 1-2 cặp trình bày ý kiến (tại sao
  kiến thức cũ không đủ).
- #strong[Kết luận, nhận định:] Giáo viên chốt lại và chuyển giao nhiệm
  vụ học tập: Bài học hôm nay sẽ giúp các em giải quyết vấn đề này.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
==== 2.1. Hoạt động thành phần: Giá trị lượng giác của một góc (30 phút)
#mt-hd[
- Học sinh nắm vững định nghĩa các giá trị lượng giác ($sin alpha$,
  $cos alpha$, $tan alpha$, $cot alpha$) của góc $alpha$
  ($0^compose lt.eq alpha lt.eq 180^compose$) thông qua hệ trục tọa độ.

]
#nd-hd[
- #strong[Nhiệm vụ 1 (Đọc/Làm việc với SGK và GeoGebra):]
  - Giáo viên hướng dẫn học sinh đọc SGK về định nghĩa giá trị lượng
    giác.
  - #strong[Ví dụ 1:] Cho điểm $M$ trên nửa đường tròn đơn vị sao cho
    $accent(x O M, ̂) = 150^compose$. Yêu cầu học sinh xác định tọa độ
    của $M$ và suy ra $sin 150^compose$, $cos 150^compose$.
  - #strong[Thao tác:] Học sinh đọc SGK, làm việc nhóm 4 người để xác
    định tọa độ và giá trị lượng giác theo định nghĩa.
- #strong[Nhiệm vụ 2 (Thực hành với Công cụ số):]
  - Giáo viên chiếu hình ảnh minh họa định nghĩa trên phần mềm
    #strong[GeoGebra] (Nếu không có máy chiếu/GeoGebra, dùng hình vẽ lớn
    trên bảng).
  - #strong[Thao tác:] Học sinh sử dụng #strong[máy tính cầm tay] để
    kiểm tra lại kết quả $sin 150^compose\,c o s 150^compose$.
  - #strong[Tích hợp Năng lực số:] #strong[Sử dụng các công nghệ số để
    tìm kiếm, lưu trữ, xử lí, trao đổi thông tin, dữ liệu] (Kiểm tra kết
    quả tính bằng công cụ số).

]
#sp-hd[
- Nắm vững Định nghĩa 4 giá trị lượng giác.
- Kết quả Ví dụ 1: $M = (- sqrt(3) / 2 \; 1 / 2)$,
  $cos 150^compose = - sqrt(3) / 2$, $sin 150^compose = 1 / 2$,
  $tan 150^compose = - 1 / sqrt(3)$, $cot 150^compose = - sqrt(3)$.

]
#tc-hd[
- #strong[Giao nhiệm vụ:] Chia lớp thành 8 nhóm, giao Phiếu học tập có
  nội dung Định nghĩa và Ví dụ 1. Yêu cầu làm trong 10 phút.
- #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm (Giáo viên quan
  sát, dự đoán khó khăn: nhầm tọa độ với giá trị lượng giác, cách xác
  định $tan alpha\,c o t alpha$).
- #strong[Hỗ trợ:] Gợi ý cách xác định tọa độ $M$ bằng cách hạ đường
  vuông góc xuống trục $O x$ và sử dụng tam giác vuông đặc biệt.
- #strong[Báo cáo, thảo luận:] Mời đại diện 2 nhóm lên trình bày kết quả
  và nhận xét về dấu của các giá trị lượng giác.
- #strong[Kết luận, nhận định:] Giáo viên chuẩn hóa kiến thức, chốt lại
  dấu của $s i n\,c o s\,t a n\,c o t$ theo góc nhọn/góc tù.

==== 2.2. Hoạt động thành phần: Mối quan hệ giữa các giá trị lượng giác của hai góc bù nhau (30 phút)
]
#mt-hd[
- Học sinh phát hiện, chứng minh và ghi nhớ được các công thức mối quan
  hệ giữa các giá trị lượng giác của hai góc bù nhau ($alpha$ và
  $180^compose - alpha$).

]
#nd-hd[
- #strong[Nhiệm vụ (Làm việc nhóm và Sơ đồ tư duy):]
  - #strong[Ví dụ 2:] Cho góc $alpha$ và góc
    $beta = 180^compose - alpha$. Yêu cầu học sinh xác định điểm $M$ và
    $M'$ trên đường tròn đơn vị tương ứng với $alpha$ và $beta$.
  - Dựa vào tính đối xứng của $M$ và $M'$ qua trục $O y$, yêu cầu học
    sinh rút ra mối quan hệ về tọa độ của $M$ và $M'$, từ đó suy ra các
    công thức lượng giác:
    - $s i n\(180^compose - alpha\)= ?$
    - $c o s\(180^compose - alpha\)= ?$
    - $t a n\(180^compose - alpha\)= ?$
    - $c o t\(180^compose - alpha\)= ?$
  - #strong[Sản phẩm nhóm:] Các công thức được trình bày trên #strong[Sơ
    đồ tư duy] (Mind Map) để hệ thống hóa kiến thức.
  - #strong[Thao tác:] Học sinh hoạt động nhóm, sử dụng hình vẽ/SGK để
    phân tích tọa độ, rút ra công thức.

]
#sp-hd[
- #strong[Các công thức bù nhau:]
  $s i n\(180^compose - alpha\)= s i n alpha$,
  $c o s\(180^compose - alpha\)= - c o s alpha$,
  $t a n\(180^compose - alpha\)= - t a n alpha$,
  $c o t\(180^compose - alpha\)= - c o t alpha$.
- Sơ đồ tư duy tóm tắt công thức.

]
#tc-hd[
- #strong[Giao nhiệm vụ:] Yêu cầu các nhóm thực hiện nhiệm vụ theo Ví dụ
  2 trong 10 phút, trình bày kết quả dưới dạng Sơ đồ tư duy.
- #strong[Thực hiện nhiệm vụ:] Học sinh hoạt động nhóm (Giáo viên đi lại
  quan sát, hỗ trợ gợi ý về tính đối xứng).
- #strong[Báo cáo, thảo luận:] Mời 2 nhóm trình bày Sơ đồ tư duy trên
  bảng (sử dụng camera chiếu Sơ đồ nhóm lên màn hình nếu có). Khuyến
  khích học sinh khác đặt câu hỏi phản biện (Tăng cường kĩ năng giao
  tiếp, thuyết trình).
- #strong[Kết luận, nhận định:] Giáo viên chuẩn hóa kiến thức, nhấn mạnh
  #strong[\"sin bù\"], và chốt lại các công thức.

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
- Vận dụng kiến thức vừa học (định nghĩa và công thức góc bù nhau) để
  giải quyết các bài tập cơ bản.
- Phát triển kĩ năng tính toán, rút gọn.

]
#nd-hd[
- #strong[Hệ thống Bài tập (Trò chơi học tập):]
  - #strong[Bài tập 1 (Tính toán cơ bản):] Tính $cos 135^compose$ và
    $tan 120^compose$. (Áp dụng công thức góc bù).
  - #strong[Bài tập 2 (Vận dụng):] Cho $sin alpha = 1 / 3$ với
    $90^compose < alpha < 180^compose$. Tính $cos alpha$. (Vận dụng công
    thức cơ bản).
  - #strong[Bài tập 3 (Rút gọn):] Rút gọn biểu thức
    $A = s i n\(180^compose - alpha\)c o s alpha + s i n alpha c o s\(180^compose - alpha\)$.
- #strong[Phương pháp:] Tổ chức #strong[Trò chơi \"Tiếp sức tính toán\"]
  (Làm việc nhóm).

]
#sp-hd[
- Đáp án Bài tập 1: $cos 135^compose = - sqrt(2) / 2$,
  $tan 120^compose = - sqrt(3)$.
- Đáp án Bài tập 2: $cos alpha = - frac(2 sqrt(2), 3)$ (vì $alpha$ là
  góc tù nên $cos alpha < 0$).
- Đáp án Bài tập 3:
  $A = s i n alpha cos alpha + s i n alpha\(- c o s alpha\)= 0$.

]
#tc-hd[
- #strong[Giao nhiệm vụ:] Chia lớp thành các nhóm (giữ nguyên nhóm cũ),
  giao 3 bài tập dưới hình thức phiếu bài tập. Mỗi thành viên lần lượt
  giải một phần bài tập. Tổng thời gian 10 phút.
- #strong[Thực hiện nhiệm vụ:] Các nhóm hợp tác giải quyết. (Giáo viên
  quan sát, hỗ trợ kịp thời, chú trọng kiểm tra cách áp dụng công thức).
- #strong[Báo cáo, thảo luận:] Yêu cầu nhóm hoàn thành nhanh và đúng
  nhất trình bày lời giải.
- #strong[Kết luận, nhận định:] Giáo viên chuẩn hóa lời giải, tuyên
  dương và chuyển sang hoạt động tiếp theo.

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
- Phát triển năng lực vận dụng kiến thức, kĩ năng vào giải quyết các vấn
  đề thực tiễn (theo từng bài hoặc nhóm bài có nội dung phù hợp).

]
#nd-hd[
- #strong[Nhiệm vụ:] Tìm kiếm/đề xuất các vấn đề/tình huống trong thực
  tiễn có sử dụng giá trị lượng giác của góc tù (ví dụ: Tính độ dài cạnh
  trong bài toán hình học có góc tù, bài toán về lực học, vật lí...).
- #strong[Ví dụ (Gợi ý):] Trong một bài toán thiết kế mái nhà hoặc dốc
  cầu, người ta có thể cần tính góc tạo bởi mặt đất và mặt phẳng
  nghiêng. Nếu góc này lớn hơn $90^compose$, giá trị cosin sẽ là số âm.
  Hãy tìm kiếm trên mạng (Internet/Sách) một ví dụ thực tiễn sử dụng
  $cos alpha < 0$.

]
#sp-hd[
- Báo cáo bằng lời hoặc văn bản về tình huống thực tiễn có sử dụng Giá
  trị lượng giác của góc tù và cách giải quyết (có thể nộp qua email
  hoặc hệ thống E-learning của trường).
- #strong[Tích hợp Năng lực số:] #strong[Sử dụng các công nghệ số để tìm
  kiếm, lưu trữ, xử lí, trao đổi thông tin, dữ liệu] (Tìm kiếm thông tin
  trên Internet).

]
#tc-hd[
- #strong[Giao nhiệm vụ:] Giáo viên giao nhiệm vụ thực hiện
  #strong[ngoài giờ học trên lớp].
- #strong[Thực hiện nhiệm vụ:] Học sinh tự tìm kiếm và giải quyết vấn
  đề.
- #strong[Trao đổi, chia sẻ và đánh giá:] Nộp báo cáo vào buổi học tiếp
  theo hoặc vào thời điểm phù hợp trong kế hoạch môn học.

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
