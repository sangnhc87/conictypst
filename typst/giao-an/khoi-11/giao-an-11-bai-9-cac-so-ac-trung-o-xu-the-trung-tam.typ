// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 9 Các số đặc trưng đo xu thế trung tâm",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm và tính được #strong[Số trung bình] của mẫu số liệu
  ghép nhóm.
- Nêu được khái niệm và xác định được #strong[Trung vị] của mẫu số liệu
  ghép nhóm.
- Nêu được khái niệm và xác định được #strong[Tứ phân vị] của mẫu số
  liệu ghép nhóm.
- Nêu được khái niệm và xác định được #strong[Mốt] của mẫu số liệu ghép
  nhóm.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực tìm hiểu các
    công thức và ví dụ liên quan đến các số đặc trưng đo xu thế trung
    tâm.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày ý tưởng, và lắng nghe, phản biện ý kiến của bạn bè.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Vận dụng kiến thức
    để giải quyết các bài toán tính toán các số đặc trưng.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực tư duy và lập luận Toán học:] Phân tích dữ liệu,
    lựa chọn công thức tính toán phù hợp cho từng loại số đặc trưng.
  - #strong[Năng lực mô hình hóa Toán học:] Vận dụng các công thức thống
    kê để mô hình hóa và giải quyết các bài toán thực tiễn.
  - #strong[Năng lực công cụ và phương tiện Toán học (Tích hợp Năng lực
    số):] Sử dụng #strong[phần mềm bảng tính (ví dụ: Excel/Google
    Sheets)] để nhập, xử lý và tính toán các số đặc trưng của mẫu số
    liệu ghép nhóm, giúp kiểm tra kết quả tính toán thủ công một cách
    nhanh chóng.
- #strong[Biểu hiện về Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - #strong[Sử dụng và quản lý thông tin số:] Thu thập, lưu trữ, xử lý
    thông tin số liệu thống kê bằng các công cụ số.
  - #strong[Hợp tác trong môi trường số:] Hợp tác với các thành viên
    trong nhóm thông qua việc chia sẻ, chỉnh sửa chung các tệp bảng tính
    số liệu trên môi trường số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  các nhiệm vụ được giao, đặc biệt là các nhiệm vụ tính toán và thực
  hành.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong nhóm, đóng góp ý kiến để
  hoàn thành sản phẩm chung.
- #strong[Trung thực:] Cẩn thận, chính xác khi tính toán và báo cáo kết
  quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính giáo viên, bảng,
  phấn/bút viết bảng.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Tập 1, Kết nối tri thức với cuộc sống).
  - Các tệp số liệu mẫu để thực hành.
  - #strong[Máy tính cá nhân/điện thoại thông minh (có cài đặt phần mềm
    bảng tính hoặc truy cập được Google Sheets)] cho học sinh (hoặc nhóm
    học sinh) để thực hành Năng lực số.
  - Phiếu học tập, giấy A0, bút dạ để học sinh lập Sơ đồ tư duy/báo cáo
    kết quả.
  - Bộ thẻ/câu hỏi trò chơi ôn tập cuối bài.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
==== a) Mục tiêu
Giúp học sinh #strong[ôn tập kiến thức] về các số đặc trưng đo xu thế
trung tâm đã học ở các lớp dưới (dữ liệu không ghép nhóm), từ đó
#strong[xác định vấn đề] cần giải quyết: làm thế nào để tính các số đặc
trưng đó cho #strong[mẫu số liệu ghép nhóm].

==== b) Nội dung (Trò chơi \"Ôn lại kiến thức\")
- Giáo viên (GV) tổ chức trò chơi #strong[\"Ai nhớ nhanh hơn?\"] với các
  câu hỏi về định nghĩa và công thức tính: Số trung bình, Trung vị, Tứ
  phân vị, Mốt của mẫu số liệu không ghép nhóm.
- GV đặt vấn đề: Cho một mẫu số liệu lớn, đã được ghép nhóm (ví dụ: Bảng
  phân bố tần số về thời gian chạy 100m của 100 vận động viên).
  - #strong[Nhiệm vụ:] Liệu các công thức đã học có còn áp dụng được
    trực tiếp không? Cần có phương pháp nào để tính các số đặc trưng cho
    dạng dữ liệu này?

==== c) Sản phẩm
- Đáp án đúng của các câu hỏi ôn tập.
- Xác định được vấn đề cần giải quyết: #strong[Nghiên cứu công thức và
  phương pháp tính các số đặc trưng đo xu thế trung tâm cho mẫu số liệu
  ghép nhóm.]

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (1 phút):] GV trình chiếu 3-4 câu hỏi ôn
  tập và giao nhiệm vụ xử lý tình huống mẫu số liệu ghép nhóm.
- #strong[Bước 2: Thực hiện nhiệm vụ (5 phút):] Học sinh (HS) làm việc
  cá nhân/nhóm đôi để trả lời câu hỏi và thảo luận về vấn đề GV đặt ra.
- #strong[Bước 3: Báo cáo, thảo luận (3 phút):] GV gọi 2-3 HS trình bày
  nhanh kết quả ôn tập. GV dẫn dắt HS nhận thấy cần có phương pháp mới
  cho dữ liệu ghép nhóm.
- #strong[Bước 4: Kết luận, nhận định (1 phút):] GV chốt lại vấn đề: Bài
  học hôm nay sẽ giúp các em giải quyết vấn đề này.

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
==== 2.1. Hoạt động thành phần 2.1: Số trung bình của mẫu số liệu ghép nhóm (15 phút)
===== a) Mục tiêu
- Hiểu được công thức tính Số trung bình cho mẫu số liệu ghép nhóm.
- Áp dụng được công thức để tính toán.

===== b) Nội dung
- GV yêu cầu HS nghiên cứu SGK để tìm ra cách tính Số trung bình của mẫu
  số liệu ghép nhóm.
- GV hướng dẫn HS xác định #strong[giá trị đại diện] ($x_i$) của mỗi
  lớp.
- #strong[Ví dụ đề xuất:] Bảng số liệu về cân nặng (kg) của 50 học sinh
  (dữ liệu đã được ghép nhóm thành các lớp).

#figure(
  align(center)[#table(
    columns: (15.89%, 13.46%),
    align: (left,left,),
    table.header(table.cell(align: left)[Lớp cân
      nặng], table.cell(align: left)[Tần số ($n_i$)],),
    table.hline(),
    table.cell(align: left)[$ \[40\;45\) $], table.cell(align: left)[5],
    table.cell(align: left)[$ \[45\;50\) $], table.cell(align: left)[15],
    table.cell(align: left)[$ \[50\;55\) $], table.cell(align: left)[20],
    table.cell(align: left)[$ \[55\;60\) $], table.cell(align: left)[10],
    table.cell(align: left)[#strong[Tổng]], table.cell(align: left)[#strong[50]],
  )]
  , kind: table
  )

- #strong[Nhiệm vụ:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + Xác định giá trị đại diện ($x_i$) của mỗi lớp.
  + Áp dụng công thức để tính Số trung bình.
  ]

===== c) Sản phẩm
- Công thức Số trung bình:
  $macron(x) = frac(x_1 n_1 + x_2 n_2 + dots.h + x_k n_k, n_1 + n_2 + dots.h + n_k)$
- Tính toán được giá trị Số trung bình cho ví dụ. (Kết quả dự kiến:
  $50.5$ kg).

===== d) Tổ chức thực hiện
- HS tự nghiên cứu SGK và làm việc nhóm để giải quyết ví dụ.
- #strong[Tích hợp Năng lực số (5 phút cuối):] GV hướng dẫn HS sử dụng
  #strong[bảng tính Excel/Google Sheets] để nhập số liệu, tính giá trị
  đại diện và tự động tính Số trung bình để kiểm tra kết quả tính thủ
  công.
  - #strong[Biểu hiện về Năng lực số:] HS thực hiện tính toán trên công
    cụ số (Phần mềm bảng tính).

==== 2.2. Hoạt động thành phần 2.2: Trung vị của mẫu số liệu ghép nhóm (15 phút)
===== a) Mục tiêu
- Hiểu được công thức xác định Trung vị ($upright("Me")$) cho mẫu số
  liệu ghép nhóm.
- Xác định được lớp chứa Trung vị và tính toán.

===== b) Nội dung
- GV yêu cầu HS nghiên cứu SGK để xác định #strong[Lớp chứa Trung vị] và
  công thức tính.
- #strong[Ví dụ đề xuất (sử dụng lại bảng số liệu ở mục 2.1):]

#figure(
  align(center)[#table(
    columns: (15.91%, 13.47%, 22.16%),
    align: (left,left,left,),
    table.header(table.cell(align: left)[Lớp cân
      nặng], table.cell(align: left)[Tần số
      ($n_i$)], table.cell(align: left)[Tần số tích lũy
      ($upright("cf")_i$)],),
    table.hline(),
    table.cell(align: left)[$ \[40\;45\) $], table.cell(align: left)[5], table.cell(align: left)[5],
    table.cell(align: left)[$ \[45\;50\) $], table.cell(align: left)[15], table.cell(align: left)[20],
    table.cell(align: left)[$ \[50\;55\) $], table.cell(align: left)[20], table.cell(align: left)[40],
    table.cell(align: left)[$ \[55\;60\) $], table.cell(align: left)[10], table.cell(align: left)[50],
  )]
  , kind: table
  )

- #strong[Nhiệm vụ:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + Xác định vị trí $n / 2$.
  + Xác định lớp chứa Trung vị.
  + Áp dụng công thức để tính $upright("Me")$.
  ]

===== c) Sản phẩm
- Công thức tính Trung vị
  $upright("Me") = L + frac(n / 2 - upright("cf")_(k - 1), n_k) dot.op h$
- Tính toán được giá trị Trung vị cho ví dụ. (Kết quả dự kiến: Lớp chứa
  $upright("Me")$ là $\[50\;55\)$\;
  $upright("Me") approx 50 + frac(25 - 20, 20) dot.op 5 = 51.25$ kg).

===== d) Tổ chức thực hiện
- HS làm việc nhóm, thực hiện theo các bước xác định lớp chứa
  $upright("Me")$ và áp dụng công thức. GV quan sát và hỗ trợ các nhóm
  gặp khó khăn trong việc xác định tần số tích lũy
  ($upright("cf")_(k - 1)$).

==== 2.3. Hoạt động thành phần 2.3: Tứ phân vị của mẫu số liệu ghép nhóm (15 phút)
===== a) Mục tiêu
- Hiểu được công thức xác định Tứ phân vị ($Q_1\,Q_2\,Q_3$).
- Xác định được lớp chứa $Q_1\,Q_3$ và tính toán.

===== b) Nội dung
- GV hướng dẫn HS nhận thấy $Q_2$ chính là Trung vị ($upright("Me")$).
- HS nghiên cứu SGK để xác định #strong[Lớp chứa] $Q_1$ #strong[\(vị
  trí] $n / 4$#strong[) và] $Q_3$ #strong[\(vị trí]
  $frac(3 n, 4)$#strong[)] và công thức tính.
- #strong[Ví dụ đề xuất (sử dụng lại bảng số liệu ở mục 2.1):]
  - #strong[Nhiệm vụ:] Tính $Q_1$ và $Q_3$.

===== c) Sản phẩm
- Công thức tổng quát
  $Q_j = L + frac(frac(j dot.op n, 4) - upright("cf")_(k - 1), n_k) dot.op h$
  (với $j = 1\,3$).
- Tính toán được giá trị $Q_1$ và $Q_3$. (Kết quả dự kiến:
  $Q_1 approx 47.5$ kg;
  $Q_3 approx 55 + frac(37.5 - 40, 10) dot.op 5 = 52.5$ kg).

===== d) Tổ chức thực hiện
- HS làm việc nhóm, thực hiện các bước tương tự như Trung vị. GV lưu ý
  về việc xác định đúng vị trí $n / 4$ và $frac(3 n, 4)$ để tìm lớp
  chứa.

==== 2.4. Hoạt động thành phần 2.4: Mốt của mẫu số liệu ghép nhóm (15 phút)
===== a) Mục tiêu
- Hiểu được công thức xác định Mốt ($upright("Mo")$) cho mẫu số liệu
  ghép nhóm.
- Xác định được lớp chứa Mốt và tính toán.

===== b) Nội dung
- GV yêu cầu HS nghiên cứu SGK để xác định #strong[Lớp chứa Mốt (lớp có
  tần số lớn nhất)] và công thức tính.
- #strong[Ví dụ đề xuất (sử dụng lại bảng số liệu ở mục 2.1):]
  - #strong[Nhiệm vụ:]
    #block[
    #set enum(numbering: "i.", start: 1)
    + Xác định lớp chứa Mốt.
    + Áp dụng công thức để tính $upright("Mo")$.
    ]

===== c) Sản phẩm
- Công thức tính Mốt
  $upright("Mo") = L + frac(Delta_1, Delta_1 + Delta_2) dot.op h$.
- Tính toán được giá trị Mốt cho ví dụ. (Kết quả dự kiến: Lớp chứa
  $upright("Mo")$ là $\[50\;55\)$\;
  $upright("Mo") approx 50 + frac(20 - 15, \(20 - 15\)+\(20 - 10\)) dot.op 5 = 51.67$
  kg).

===== d) Tổ chức thực hiện
- HS làm việc nhóm để hoàn thành nhiệm vụ. GV yêu cầu HS làm rõ ý nghĩa
  của $Delta_1$ và $Delta_2$ (chênh lệch tần số).

#hd("3", "Luyện tập", "15 phút")
==== a) Mục tiêu
Vận dụng kiến thức đã học để giải quyết các bài tập tổng hợp về tính
toán các số đặc trưng; phát triển kĩ năng phân tích và tổng hợp thông
tin.

==== b) Nội dung (Phân tích và Tổng hợp thông tin)
- GV giao cho mỗi nhóm một #strong[bài tập tổng hợp] về tính cả bốn số
  đặc trưng ($macron(x)\,upright("Me")\,Q_1\,Q_3\,upright("Mo")$) từ một
  mẫu số liệu ghép nhóm mới (hoặc sử dụng một bài tập trong SGK).
- #strong[Nhiệm vụ:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + Thực hiện tính toán.
  + #strong[Vẽ Sơ đồ tư duy] (mind map) tóm tắt các công thức đã học và
    kết quả tính toán của bài tập.
  ]

==== c) Sản phẩm
- Lời giải chính xác của bài tập tổng hợp.
- #strong[Sơ đồ tư duy] tóm tắt kiến thức (định nghĩa, công thức, kết
  quả bài tập).

==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ:] GV giao bài tập và yêu cầu làm việc nhóm (10
  phút).
- #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm, phân công thành viên
  tính toán và vẽ sơ đồ tư duy.
- #strong[Báo cáo, thảo luận:] GV mời #strong[1-2 nhóm trình bày] sơ đồ
  tư duy (khuyến khích sử dụng máy chiếu hoặc chụp ảnh sơ đồ và trình
  chiếu). Các nhóm khác nhận xét.
- #strong[Kết luận, nhận định:] GV nhận xét, đánh giá về tính chính xác
  của bài giải và khả năng tổng hợp kiến thức thông qua sơ đồ tư duy.

#hd("4", "Vận dụng", "5 phút")
#mt-hd[
Phát triển năng lực của học sinh thông qua nhiệm vụ/yêu cầu vận dụng kiến thức, kĩ năng vào thực tiễn, tăng cường khả năng giao tiếp, thuyết trình.
]
#nd-hd[
GV giao nhiệm vụ Vận dụng sau giờ học:
- #strong[Nhiệm vụ:] Thu thập một bộ dữ liệu thực tế (ví dụ: chiều cao,
  điểm thi,...) của một nhóm lớn (ví dụ: lớp học, trường, hàng xóm,...)
  và tiến hành #strong[ghép nhóm] dữ liệu đó.
- #strong[Yêu cầu:] Vận dụng các công thức đã học để tính tất cả các số
  đặc trưng đo xu thế trung tâm của mẫu số liệu ghép nhóm vừa tạo ra.

]
#sp-hd[
Bài báo cáo (trên giấy hoặc file trình chiếu) về quá trình thu thập, ghép nhóm, tính toán và ý nghĩa thực tiễn của các số đặc trưng tìm được.
==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ:] GV giao nhiệm vụ và yêu cầu HS thực hiện
  #strong[ngoài giờ học trên lớp].
- #strong[Thời gian nộp:] Nộp báo cáo vào tiết học tiếp theo hoặc thời
  điểm phù hợp để trao đổi, chia sẻ và đánh giá.
- #strong[Tích hợp Năng lực số:] Khuyến khích HS sử dụng công cụ số
  (Phần mềm bảng tính, Powerpoint/Google Slides) để xử lý dữ liệu, trình
  bày báo cáo.
- #strong[Biểu hiện về Năng lực số:] HS thực hiện #strong[trao đổi, chia
  sẻ, lưu trữ] kết quả dưới dạng tệp tin số.

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
