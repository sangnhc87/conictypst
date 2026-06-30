// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 33 Đạo hàm cấp hai",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được định nghĩa đạo hàm cấp hai của một hàm số.
- Trình bày được công thức tính đạo hàm cấp hai.
- Nêu được ý nghĩa cơ học của đạo hàm cấp hai (gia tốc tức thời).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận toán học:] Học sinh thực hiện
    được các thao tác tìm đạo hàm cấp hai của một hàm số bằng định nghĩa
    và công thức.
  - #strong[Năng lực mô hình hóa toán học:] Vận dụng được khái niệm đạo
    hàm cấp hai để giải quyết các bài toán có liên quan đến chuyển động
    (tính gia tốc tức thời).
- #strong[Năng lực chung:]
  - #strong[Năng lực tự học:] Chủ động đọc sách giáo khoa, tài liệu, tìm
    kiếm thông tin về đạo hàm cấp hai để hoàn thành nhiệm vụ được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] Thảo luận nhóm hiệu quả để
    giải quyết các bài tập, trình bày và bảo vệ ý kiến cá nhân.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành các nhiệm vụ học tập được giao, tích cực
  tham gia các hoạt động nhóm và luyện tập.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong nhóm, nhận trách nhiệm
  về phần việc của mình, bảo vệ và xây dựng ý kiến chung.
- #strong[Trung thực:] Thể hiện sự trung thực trong quá trình tính toán
  và báo cáo kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy tính, máy chiếu, bảng phụ, phấn/bút
  viết.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Tập 2, Kết nối tri thức với cuộc sống).
  - Phiếu học tập (bài toán mở đầu, bài tập luyện tập).
  - #strong[Công cụ số:] Phần mềm/ứng dụng GeoGebra hoặc máy tính cầm
    tay cá nhân (có thể là ứng dụng trên điện thoại/máy tính bảng) để
    tính toán và kiểm tra.
  - Tài liệu tham khảo về gia tốc và chuyển động.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "5 phút")
==== a) Mục tiêu
- Ôn tập về khái niệm #strong[vận tốc tức thời] (đạo hàm cấp một) và
  khái niệm #strong[gia tốc] (biến thiên vận tốc).
- Giúp học sinh nhận ra sự cần thiết phải tìm một công cụ toán học để mô
  tả sự thay đổi của vận tốc (dẫn đến khái niệm đạo hàm của đạo hàm).

==== b) Nội dung
- #strong[Giáo viên] giao nhiệm vụ:
  - Nêu lại công thức tính vận tốc tức thời $v\(t\)$ của một chất điểm
    chuyển động theo phương trình $s = s\(t\)$.
  - Đặt vấn đề: #strong[Vận tốc] là đạo hàm của #strong[quãng đường]
    theo thời gian. Vậy, công cụ toán học nào mô tả sự thay đổi của vận
    tốc?

==== c) Sản phẩm
- Học sinh trả lời được: $v\(t\)= s'\(t\)$.
- Học sinh đề xuất được ý tưởng: Cần tìm đạo hàm của vận tốc.

==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ học tập:] Giáo viên trình chiếu một tình huống
  thực tế về một vật chuyển động với phương trình
  $s\(t\)= 4 t^3 - 2 t^2 + 5$. Yêu cầu học sinh tìm vận tốc tại thời
  điểm $t = 1$s. Sau đó, giáo viên đặt câu hỏi mở: #emph["Làm thế nào để
  tìm được gia tốc tức thời của vật tại thời điểm đó?"]
- #strong[Thực hiện nhiệm vụ:] Học sinh làm việc cá nhân (1-2 phút) để
  tính vận tốc và thảo luận nhanh với bạn bên cạnh về câu hỏi mở.
- #strong[Báo cáo, thảo luận:] Giáo viên gọi 1-2 học sinh trình bày kết
  quả $v\(t\)= s'\(t\)$ và lắng nghe các ý kiến về câu hỏi mở.
- #strong[Kết luận, nhận định:] Giáo viên chốt lại, dẫn dắt vào bài mới:
  Sự thay đổi của vận tốc chính là #strong[gia tốc]. Để tìm gia tốc, ta
  cần tìm đạo hàm của vận tốc. Đây chính là #strong[đạo hàm cấp hai] --
  nội dung chính của bài học.

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "25 phút")
==== Hoạt động thành phần 2.1: Khái niệm đạo hàm cấp hai (15 phút)
==== a) Mục tiêu
- Học sinh nêu được định nghĩa đạo hàm cấp hai.
- Học sinh tính được đạo hàm cấp hai của một hàm số cho trước.

==== b) Nội dung
- #strong[Nhiệm vụ:] Học sinh làm việc với SGK và thảo luận nhóm để rút
  ra định nghĩa đạo hàm cấp hai $y''$.
- #strong[Ví dụ 1 (Để hình thành khái niệm):]
  - Cho hàm số $f\(x\)= x^4 - 5 x^2 + 1$.
  - #strong[Nhiệm vụ 1:] Tính đạo hàm cấp một $f'\(x\)$.
  - #strong[Nhiệm vụ 2:] Coi $f'\(x\)$ là một hàm số, tính đạo hàm của
    nó, kí hiệu là $f''\(x\)$.
- #strong[Ví dụ 2 (Luyện tập công thức):]
  - Cho hàm số $y = s i n\(2 x\)$. Tính $y''$.

==== c) Sản phẩm
- Nắm được định nghĩa: #strong[Đạo hàm cấp hai] là đạo hàm của đạo hàm
  cấp một: $f''\(x\)=\[f'\(x\)\]'$.
- Kết quả #strong[Ví dụ 1]: $f'\(x\)= 4 x^3 - 10 x$\;
  $f''\(x\)= 12 x^2 - 10$.
- Kết quả #strong[Ví dụ 2]: $y' = 2 c o s\(2 x\)$\;
  $y'' = - 4 s i n\(2 x\)$.

==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ học tập:] Giáo viên yêu cầu học sinh đọc mục
  Khái niệm trong SGK và thực hiện #strong[Ví dụ 1] theo nhóm 4. Sau khi
  các nhóm hoàn thành, một nhóm sẽ lên bảng trình bày.
- #strong[Thực hiện nhiệm vụ (Tích hợp Năng lực số):] Học sinh thảo luận
  nhóm, thực hiện tính toán. Khuyến khích học sinh dùng GeoGebra hoặc
  máy tính cầm tay để kiểm tra nhanh kết quả tính $f''\(x\)$.
- #strong[Báo cáo, thảo luận:] Giáo viên gọi đại diện nhóm lên trình
  bày, các nhóm khác nhận xét, bổ sung. Giáo viên đưa ra #strong[Ví dụ
  2] để luyện tập thêm.
- #strong[Kết luận, nhận định:] Giáo viên tổng hợp, chốt lại định nghĩa
  và các bước tính đạo hàm cấp hai.

==== Hoạt động thành phần 2.2: Ý nghĩa cơ học của đạo hàm cấp hai (10 phút)
==== a) Mục tiêu
- Học sinh nêu được ý nghĩa vật lí của đạo hàm cấp hai (gia tốc tức
  thời).
- Vận dụng được công thức để tính gia tốc tức thời trong bài toán chuyển
  động.

==== b) Nội dung
- #strong[Nhiệm vụ:] Học sinh làm việc cá nhân với SGK để xác định mối
  liên hệ giữa $s''\(t\)$ và gia tốc $a\(t\)$.
- #strong[Ví dụ 3 (Áp dụng ý nghĩa cơ học):]
  - Một vật chuyển động thẳng có phương trình $s\(t\)= t^3 - 6 t^2 + 10$
    ($s$ tính bằng mét, $t$ tính bằng giây).
  - #strong[Nhiệm vụ:] Tính gia tốc tức thời của vật tại thời điểm
    $t = 2$ giây.

==== c) Sản phẩm
- Nắm được ý nghĩa: #strong[Gia tốc tức thời] $a\(t\)$ là đạo hàm cấp
  hai của quãng đường theo thời gian: $a\(t\)= s''\(t\)$.
- Kết quả #strong[Ví dụ 3]:
  - $s'\(t\)= 3 t^2 - 12 t$ (vận tốc)
  - $a\(t\)= s''\(t\)= 6 t - 12$ (gia tốc)
  - $a\(2\)= 6\(2\)- 12 = 0$ ($m\/s^2$).

==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ học tập:] Giáo viên yêu cầu học sinh trả lời câu
  hỏi: #emph[Nếu vận tốc là đạo hàm của quãng đường, vậy gia tốc (là đạo
  hàm của vận tốc) là đạo hàm cấp mấy của quãng đường?] Sau đó, giao
  #strong[Ví dụ 3] cho học sinh giải quyết cá nhân.
- #strong[Thực hiện nhiệm vụ:] Học sinh tính toán, Giáo viên quan sát,
  hỗ trợ những học sinh gặp khó khăn trong việc tính đạo hàm của đa
  thức.
- #strong[Báo cáo, thảo luận:] Gọi 1 học sinh lên bảng trình bày lời
  giải chi tiết (bước 1: tính $s'\(t\)$, bước 2: tính $s''\(t\)$, bước
  3: thay $t = 2$).
- #strong[Kết luận, nhận định:] Giáo viên khẳng định mối quan hệ
  #strong[Quãng đường] $arrow.r^(Đ H med 1)$ #strong[Vận tốc]
  $arrow.r^(Đ H med 2)$ #strong[Gia tốc].

#hd("3", "Luyện tập", "10 phút")
==== a) Mục tiêu
- Học sinh củng cố kĩ năng tính đạo hàm cấp hai của các hàm số thường
  gặp (hàm đa thức, hàm lượng giác).
- Tăng cường khả năng làm việc dưới áp lực thời gian, phát triển kĩ năng
  tính toán nhanh và chính xác.

==== b) Nội dung
- #strong[Trò chơi \"Tính nhanh -- Thắng nhanh\":] Giáo viên đưa ra 3-4
  bài tập tính đạo hàm cấp hai.
- #strong[Bài tập 1:] Tính đạo hàm cấp hai của $y = frac(x, x - 1)$.
- #strong[Bài tập 2:] Tính đạo hàm cấp hai của $y = c o s\(x^2\)$.
- #strong[Bài tập 3:] Một vật chuyển động có
  $s\(t\)= 1 / 2 g t^2 + v_0 t + s_0$. Tính gia tốc $a\(t\)$.

==== c) Sản phẩm
- #strong[Đáp án Bài tập 1:] $y' = frac(- 1, \(x - 1\)^2)$\;
  $y'' = frac(2, \(x - 1\)^3)$.
- #strong[Đáp án Bài tập 2:] $y' = - 2 x s i n\(x^2\)$\;
  $y'' = - 2 s i n\(x^2\)- 4 x^2 c o s\(x^2\)$.
- #strong[Đáp án Bài tập 3:] $a\(t\)= s''\(t\)= g$ (Gia tốc rơi tự do là
  hằng số).

==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ học tập:] Giáo viên chia lớp thành các nhóm nhỏ
  (hoặc làm việc cá nhân). Trình chiếu lần lượt từng bài tập.
- #strong[Thực hiện nhiệm vụ:] Học sinh tính toán trên nháp, nhóm nào có
  kết quả chính xác và nhanh nhất sẽ ghi điểm.
- #strong[Báo cáo, thảo luận:] Gọi học sinh/đại diện nhóm trình bày lời
  giải. Giáo viên nhận xét, sửa chữa sai sót và tuyên dương nhóm thắng
  cuộc.
- #strong[Kết luận, nhận định:] Giáo viên chốt lại các lỗi sai thường
  gặp khi tính đạo hàm cấp hai.

#hd("4", "Vận dụng", "5 phút - Giao nhiệm vụ về nhà")
==== a) Mục tiêu
- Phát triển năng lực mô hình hóa và giải quyết vấn đề thực tiễn thông
  qua việc vận dụng kiến thức về đạo hàm cấp hai.

==== b) Nội dung
- #strong[Nhiệm vụ:] Tìm một ví dụ thực tế về chuyển động (có phương
  trình quãng đường) và tính gia tốc tức thời trong ví dụ đó.

==== c) Sản phẩm
- Báo cáo (có thể là bài viết, sơ đồ tư duy hoặc file trình bày ngắn)
  phát hiện và giải quyết vấn đề/tình huống thực tiễn có sử dụng khái
  niệm đạo hàm cấp hai.

==== d) Tổ chức thực hiện
- #strong[Giao cho học sinh thực hiện ngoài giờ học trên lớp:] Giáo viên
  giao nhiệm vụ và yêu cầu học sinh nộp báo cáo vào buổi học tiếp theo.
- #strong[Gợi ý:] Học sinh có thể tìm kiếm thông tin về chuyển động của
  ô tô, tàu hỏa, hoặc các vật thể được phóng lên.
- #strong[Tích hợp Năng lực số:] Khuyến khích học sinh dùng sơ đồ tư duy
  (Mind map) điện tử (ví dụ: Google Drawing, XMind,...) để tổng hợp
  thông tin và trình bày kết quả, tăng tính trực quan và khả năng phân
  tích, tổng hợp thông tin.

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

