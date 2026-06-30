// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 5 Dãy số",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được #strong[định nghĩa dãy số] và các khái niệm liên quan (số
  hạng đầu, số hạng tổng quát).
- Nhận biết được #strong[các cách cho một dãy số] (bằng công thức số
  hạng tổng quát, bằng phương pháp mô tả, bằng hệ thức truy hồi, bằng đồ
  thị).
- Nêu được #strong[định nghĩa dãy số tăng, dãy số giảm] và #strong[dãy
  số bị chặn].

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích và so sánh
    để nhận biết được sự khác biệt giữa các cách cho dãy số; vận dụng
    định nghĩa để chứng minh tính đơn điệu (tăng/giảm) và tính bị chặn
    của dãy số.
  - #strong[Năng lực giải quyết vấn đề toán học:] Giải quyết các bài
    toán tìm công thức số hạng tổng quát, tìm số hạng thứ $n$ của dãy
    số.
  - #strong[Năng lực giao tiếp toán học:] Trình bày rõ ràng, chính xác
    định nghĩa, tính chất của dãy số; sử dụng ngôn ngữ toán học (kí
    hiệu, công thức) để mô tả dãy số.
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu khái niệm, đọc
    sách giáo khoa, hoàn thành nhiệm vụ được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày, bảo vệ ý kiến của nhóm trước lớp, lắng nghe và phản biện
    ý kiến của bạn.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - #strong[Sử dụng công cụ và công nghệ số:] Sử dụng các phần mềm, ứng
    dụng (ví dụ: máy tính Casio, GeoGebra, hoặc công cụ trình chiếu) để
    tính toán các số hạng của dãy số, vẽ đồ thị minh họa, hoặc tạo sơ đồ
    tư duy tóm tắt kiến thức.
  - #strong[Tìm kiếm, chọn lọc, lưu trữ, và trao đổi thông tin số] (tra
    cứu các ví dụ về dãy số trong đời sống trên Internet) và #strong[tạo
    ra sản phẩm số cơ bản] (tạo sơ đồ tư duy trên phần mềm số, ví dụ
    MindMap, trình bày bằng Google Slides/PowerPoint).

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  các bài tập Luyện tập và Vận dụng được giao.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong hoạt động nhóm; nghiêm
  túc trong việc tự đánh giá và đánh giá lẫn nhau.
- #strong[Trung thực:] Thể hiện sự trung thực trong báo cáo kết quả thực
  hiện nhiệm vụ, đặc biệt là khi làm bài tập độc lập.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính kết nối mạng,
  phiếu học tập, bảng phụ.
- #strong[Học liệu:] Sách giáo khoa Toán 11 (Tập 1, Kết nối tri thức với
  cuộc sống), tài liệu tham khảo, mẫu sơ đồ tư duy, #strong[ứng
  dụng/phần mềm trình chiếu] (PowerPoint/Google Slides), #strong[phần
  mềm vẽ đồ thị] (GeoGebra, nếu cần).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "Khởi động")
==== a) Mục tiêu
Giúp học sinh #strong[xác định vấn đề] là cần tìm ra một công cụ toán
học để mô tả các đối tượng được sắp xếp theo một thứ tự xác định, từ đó
dẫn đến khái niệm dãy số.

==== b) Nội dung
#strong[Nhiệm vụ:] Giáo viên đặt vấn đề thông qua #strong[tình huống
thực tiễn] liên quan đến sự sắp xếp có thứ tự. #strong[Ví dụ đề xuất:]

- \"Một #strong[dãy nhà] trên cùng một con phố được đánh số thứ tự: Nhà
  số 1, Nhà số 2, Nhà số 3, \... Nhà thứ $n$ có số là bao nhiêu?\"
- \"Chiều cao của một cây sau $n$ năm phát triển được đo và ghi lại:
  $h_1\,h_2\,h_3\,dots.h\,h_n\,dots.h$ Có nhận xét gì về tính chất của
  dãy số liệu này?\"

==== c) Sản phẩm
- Kết quả thảo luận của học sinh: Nhận thấy #strong[sự sắp xếp theo thứ
  tự] và #strong[quy luật] của các đối tượng.
- Đề xuất: Cần có một khái niệm toán học để mô tả tập hợp các số được
  sắp xếp theo thứ tự như vậy.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ học tập:] Giáo viên trình chiếu ví dụ,
  yêu cầu học sinh thảo luận nhóm đôi trong 3 phút để tìm ra đặc điểm
  chung của các ví dụ. \* #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh
  thảo luận (Giáo viên quan sát, dự kiến học sinh có thể nêu các từ khóa
  như: \"thứ tự\", \"quy luật\", \"tập hợp số\",...).
- #strong[Bước 3: Báo cáo, thảo luận:] Mời 1-2 nhóm trình bày ý kiến.
- #strong[Bước 4: Kết luận, nhận định:] Giáo viên dẫn dắt, kết nối các ý
  kiến đến sự cần thiết của khái niệm #strong[Dãy số], từ đó giới thiệu
  tên bài học mới.
- #emph[Tích hợp năng lực số:] #strong[Không có] biểu hiện rõ ràng ở
  hoạt động này.

=== 2. Hoạt động 2: Hình thành kiến thức mới/giải quyết vấn đề
==== 2.1. Hoạt động thành phần 2.1: Định nghĩa dãy số
- #strong[Mục tiêu:] Nắm được định nghĩa #strong[dãy số] và các kí hiệu,
  khái niệm cơ bản (số hạng đầu, số hạng tổng quát).
- #strong[Nội dung:] Yêu cầu học sinh đọc #strong[Sách giáo khoa (SGK)]
  phần Định nghĩa, làm việc cá nhân để hoàn thành phiếu học tập.
- #strong[Sản phẩm:]
  - Nêu được Định nghĩa dãy số.
  - Xác định được $u_1$ là số hạng đầu, $u_n$ là số hạng tổng quát.
- #strong[Tổ chức thực hiện:]
  - #emph[Giao nhiệm vụ:] Học sinh đọc SGK và trả lời câu hỏi: \"Dãy số
    là gì? Cho ví dụ về một dãy số vô hạn.\"
  - #emph[Thực hiện nhiệm vụ:] Học sinh tự nghiên cứu (Giáo viên theo
    dõi, nhắc nhở).
  - #emph[Báo cáo, thảo luận:] Mời học sinh trình bày (Giáo viên chuẩn
    hóa kiến thức).

==== 2.2. Hoạt động thành phần 2.2: Các cách cho một dãy số
- #strong[Mục tiêu:] Nhận biết và phân biệt được 4 cách cho một dãy số:
  Công thức số hạng tổng quát, mô tả, hệ thức truy hồi, đồ thị.
- #strong[Nội dung:] Tổ chức #strong[học tập hợp tác theo nhóm] (kĩ năng
  giao tiếp, hợp tác). Giao 4 nhiệm vụ tương ứng với 4 cách cho dãy số.
- #strong[Ví dụ đề xuất:]
  - #strong[Công thức:] $u_n = 2 n - 1$ (Dãy số lẻ).
  - #strong[Mô tả:] Dãy số là các số nguyên tố theo thứ tự tăng dần.
  - #strong[Truy hồi:] $u_1 = 1\,u_n = 2 u_(n - 1) + 1$ với $n gt.eq 2$.
  - #strong[Đồ thị:] (Minh họa đồ thị của dãy số $u_n = 2 n - 1$).
- #strong[Sản phẩm:] Các nhóm báo cáo, liệt kê được các cách cho dãy số
  và #strong[tính được 5 số hạng đầu tiên] cho mỗi cách.
- #strong[Tổ chức thực hiện:]
  - #emph[Giao nhiệm vụ:] Chia 4 nhóm, mỗi nhóm nhận 1 cách cho dãy số.
    Nhiệm vụ: #strong[Nêu đặc điểm] của cách cho đó và #strong[tính 5 số
    hạng đầu tiên] của ví dụ.
  - #emph[Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm, ghi kết quả ra
    giấy/bảng nhóm.
  - #emph[Báo cáo, thảo luận:] Đại diện 4 nhóm #strong[trình bày, thuyết
    trình] kết quả (kĩ năng thuyết trình, phân tích thông tin).
  - #emph[Kết luận, nhận định:] Giáo viên nhận xét, nhấn mạnh đặc điểm
    mỗi cách và khắc sâu ví dụ.

==== 2.3. Hoạt động thành phần 2.3: Dãy số tăng, dãy số giảm và dãy số bị chặn
- #strong[Mục tiêu:] Nắm vững định nghĩa và #strong[vận dụng để xét tính
  đơn điệu và tính bị chặn] của dãy số.
- #strong[Nội dung:] Học sinh nghiên cứu định nghĩa trong SGK, sau đó
  #strong[giải quyết một bài toán chứng minh] đơn điệu/bị chặn.
- #strong[Ví dụ đề xuất:]
  - #strong[Xét tính đơn điệu:] Cho dãy số $u_n = frac(n, n + 1)$. Xét
    xem dãy số này tăng hay giảm?
  - #strong[Xét tính bị chặn:] Cho dãy số $u_n = frac(1, n^2 + 1)$. Dãy
    số này có bị chặn không? Bị chặn trên, dưới bởi số nào?
- #strong[Sản phẩm:] Lời giải chi tiết cho các ví dụ. Học sinh rút ra
  #strong[phương pháp chung] để xét tính đơn điệu
  ($upright("so sánh ") u_(n + 1) - u_n upright(" với ") 0 upright(" hoặc ") u_(n + 1) / u_n upright(" với ") 1$)
  và tính bị chặn (tìm $M\,m$ sao cho $m lt.eq u_n lt.eq M$).
- #strong[Tổ chức thực hiện:]
  - #emph[Giao nhiệm vụ:] Cá nhân nghiên cứu định nghĩa và phương pháp,
    sau đó áp dụng làm 2 ví dụ trên.
  - #emph[Thực hiện nhiệm vụ:] Học sinh làm bài tập. (Giáo viên dự kiến
    khó khăn: so sánh biểu thức đại số, cần hỗ trợ HS).
  - #emph[Báo cáo, thảo luận:] Mời 2 học sinh lên bảng trình bày lời
    giải.
  - #emph[Kết luận, nhận định:] Giáo viên chốt lại phương pháp.
- #emph[Tích hợp năng lực số (Tiết 2):]
  - Giáo viên có thể yêu cầu học sinh #strong[sử dụng máy tính Casio]
    (hoặc ứng dụng mô phỏng Casio) để #strong[tính nhanh các số hạng]
    $u_n$ của dãy số $u_n = frac(n, n + 1)$ và $u_n = frac(1, n^2 + 1)$
    (sử dụng chức năng TABLE) để đưa ra #strong[dự đoán ban đầu] về tính
    đơn điệu và bị chặn, sau đó mới tiến hành chứng minh chặt chẽ.
  - #strong[Biểu hiện năng lực số:] #strong[Sử dụng công cụ và công nghệ
    số] (sử dụng chức năng TABLE của máy tính cầm tay để tính toán số
    hạng dãy số).

=== 3. Hoạt động 3: Luyện tập
==== a) Mục tiêu
Củng cố và vận dụng các kiến thức đã học vào giải các bài tập cơ bản,
phát triển kĩ năng tính toán và lập luận.

==== b) Nội dung
Hệ thống các bài tập bao gồm:

+ #strong[Tính số hạng] (ví dụ: Tìm $u_4\,u_5$ của dãy cho bởi hệ thức
  truy hồi $u_1 = 3\,u_n = u_(n - 1) + 2 n$).
+ #strong[Tìm công thức tổng quát] (ví dụ: Viết công thức số hạng tổng
  quát của dãy $2\,4\,8\,16\,dots.h$).
+ #strong[Xét tính đơn điệu/bị chặn] (ví dụ: Xét tính đơn điệu của dãy
  số $u_n = 3 n^2 - n$).

==== c) Sản phẩm
Lời giải chính xác cho các bài tập.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ học tập:] Giáo viên giao 3 bài tập Luyện
  tập, yêu cầu học sinh #strong[làm việc cá nhân] trong 10 phút.
- #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh làm bài (Giáo viên theo
  dõi, hướng dẫn kịp thời cho học sinh gặp khó khăn).
- #strong[Bước 3: Báo cáo, thảo luận:] Tổ chức #strong[Trò chơi học tập]
  (ví dụ: \"Tiếp sức\") để học sinh luân phiên lên bảng giải từng phần
  của bài tập, tăng cường tính cạnh tranh và hứng thú.
- #strong[Bước 4: Kết luận, nhận định:] Giáo viên chữa bài, nhận xét và
  #strong[tổ chức cho học sinh tạo sơ đồ tư duy] (Mind Map) để tổng hợp
  kiến thức bài học (Định nghĩa, 4 cách cho, Tính chất).
- #emph[Tích hợp năng lực số:]
  - Khuyến khích học sinh #strong[sử dụng các công cụ số] (như Canva,
    MindMeister, hoặc thậm chí Google Slides) để thiết kế Sơ đồ tư duy
    tổng hợp bài học.
  - #strong[Biểu hiện năng lực số:] #strong[Tạo ra sản phẩm số cơ bản]
    (sơ đồ tư duy số), #strong[sử dụng công cụ và công nghệ số] (sử dụng
    phần mềm tạo sơ đồ tư duy).

=== 4. Hoạt động 4: Vận dụng
==== a) Mục tiêu
Phát triển năng lực vận dụng kiến thức, kĩ năng về dãy số vào
#strong[giải quyết các vấn đề thực tiễn] (ví dụ: lãi suất ngân hàng,
tăng trưởng dân số,...).

==== b) Nội dung
#strong[Nhiệm vụ Vận dụng:]

- Yêu cầu học sinh tìm kiếm và đề xuất một tình huống thực tế có thể mô
  hình hóa bằng dãy số (ví dụ: #strong[Lãi suất kép ngân hàng]).
- Sử dụng kiến thức đã học để #strong[xây dựng công thức truy hồi] hoặc
  #strong[công thức tổng quát] cho tình huống đó.

==== c) Sản phẩm
Báo cáo (dạng viết tay, file Word hoặc slide trình chiếu - khuyến khích
dùng công cụ số) về tình huống thực tế và công thức dãy số tương ứng,
kèm theo minh họa tính toán.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ học tập:] Giáo viên giao nhiệm vụ thực
  hiện #strong[ngoài giờ học trên lớp].
- #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh làm việc cá nhân hoặc
  nhóm nhỏ (tùy chọn), tự tìm kiếm thông tin và xây dựng mô hình.
- #strong[Bước 3: Báo cáo, thảo luận:] Thu thập báo cáo. Có thể chọn một
  số báo cáo tốt để #strong[trao đổi, chia sẻ và đánh giá] trong buổi
  học tiếp theo (hoặc thông qua nhóm học tập trực tuyến).
- #strong[Bước 4: Kết luận, nhận định:] Khuyến khích học sinh chia sẻ
  cách thức tìm kiếm, xử lý thông tin.
- #emph[Tích hợp năng lực số:]
  - #strong[Tìm kiếm thông tin số:] Học sinh cần #strong[tìm kiếm, chọn
    lọc] các thông tin về lãi suất kép, tăng trưởng,... trên Internet
    (kĩ năng tìm kiếm thông tin số).
  - #strong[Tạo ra sản phẩm số:] Khuyến khích báo cáo bằng slide, video
    ngắn (tạo ra sản phẩm số cơ bản).

#figure(
  align(center)[#table(
    columns: (32.22%, 45.62%),
    align: (auto,auto,),
    table.header(table.cell(align: left)[], table.cell(align: left)[Duyệt
      Kế hoạch bài dạy

      của tổ Khoa học tự nhiên

      Ngày \...... tháng \...... năm \......

      ],),
    table.hline(),
  )]
  , kind: table
  )

