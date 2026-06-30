// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 5",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Hệ thống hóa được các khái niệm và định lí về #strong[giới hạn của dãy
  số] $lim u_n$, #strong[giới hạn của hàm số]
  $lim_(x arrow.r x_0) f\(x\)$, $lim_(x arrow.r plus.minus oo) f\(x\)$.
- Vận dụng thành thạo các quy tắc tính giới hạn và các phương pháp khử
  dạng vô định (nếu có) để giải quyết các bài tập cơ bản và nâng cao.
- Nắm vững định nghĩa và các điều kiện để một #strong[hàm số liên tục]
  tại một điểm và trên một khoảng.

#muc("2", "NĂNG LỰC")
===== a. Năng lực chung
- #strong[Năng lực tự chủ và tự học:] Chủ động tìm tòi, hệ thống hóa
  kiến thức; tự đánh giá được mức độ hiểu bài của bản thân qua các hoạt
  động luyện tập.
- #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận, trao đổi
  kiến thức trong nhóm; trình bày, bảo vệ ý kiến của cá nhân và nhóm một
  cách rõ ràng, mạch lạc.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích được các
  dạng bài tập, đề xuất được phương pháp giải quyết tối ưu.

===== b. Năng lực đặc thù (Năng lực Toán học)
- #strong[Năng lực tư duy và lập luận Toán học:] Nhận biết, chứng minh
  và giải thích được các kết quả về giới hạn và hàm số liên tục.
- #strong[Năng lực mô hình hóa Toán học:] Vận dụng kiến thức giới hạn để
  giải quyết một số bài toán thực tế (ví dụ: mô hình hóa sự biến đổi của
  một đại lượng theo thời gian tiến về vô cực).
- #strong[Năng lực sử dụng công cụ, phương tiện Toán học:] Sử dụng máy
  tính cầm tay (MTCT) để kiểm tra kết quả tính giới hạn (như một công cụ
  hỗ trợ, không thay thế hoàn toàn quá trình giải).

===== c. Năng lực số (Theo TT 02/2025/TT-BGDĐT) 💡
- 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
- 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
  tin và nội dung trong môi trường số.
- 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin và
  nội dung này cũng như điều hướng giữa chúng.
- 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, chủ động tham gia các hoạt động ôn tập,
  luyện tập.
- #strong[Trung thực:] Thể hiện sự trung thực trong quá trình làm bài và
  đánh giá kết quả của bản thân/nhóm.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ học tập của cá nhân
  và nhóm, đóng góp ý kiến xây dựng bài.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy tính/Máy chiếu, phiếu bài tập in sẵn/điện tử,
  file/link Sơ đồ tư duy mẫu (hoặc công cụ số để vẽ SDTD), hệ thống câu
  hỏi trắc nghiệm/bài tập lớn.
- #strong[Học sinh:] Sách giáo khoa, vở ghi, máy tính cầm tay, điện
  thoại thông minh/máy tính bảng (có kết nối internet để phục vụ hoạt
  động Năng lực số).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
=== Hoạt động 1: TỔNG HỢP KIẾN THỨC BẰNG SƠ ĐỒ TƯ DUY (15 phút)
- #strong[Mục tiêu:] Hệ thống hóa kiến thức chương V (Giới hạn, Hàm số
  liên tục) một cách trực quan.
- #strong[Phương pháp:] Dạy học hợp tác (chia nhóm), Phát triển năng lực
  số.
- #strong[Hình thức:] Hoạt động nhóm.

+ #strong[Chuyển giao nhiệm vụ (2 phút):]

  - Giáo viên chia lớp thành 4-5 nhóm.
  - Giao nhiệm vụ: Mỗi nhóm sử dụng một #strong[công cụ số] (ví dụ:
    Google Jamboard, PowerPoint, hoặc giấy A0 nếu không đủ thiết bị) để
    lập #strong[Sơ đồ tư duy] tổng hợp toàn bộ kiến thức chương V, bao
    gồm: Các loại giới hạn (dãy số, hàm số tại một điểm, tại vô cực),
    các quy tắc tính, và hàm số liên tục.
  - Yêu cầu các nhóm tập trung vào các #strong[công thức cốt lõi] và các
    #strong[dạng bài tập tiêu biểu].

+ #strong[Thực hiện nhiệm vụ (10 phút):]

  - Các nhóm tiến hành thảo luận, phân công công việc và thiết kế Sơ đồ
    tư duy.
  - \(Tích hợp Năng lực số): Học sinh vận dụng kỹ năng sử dụng các công
    cụ kỹ thuật số để tạo lập và tổ chức thông tin.

+ #strong[Báo cáo và đánh giá (3 phút):]

  - Giáo viên mời đại diện 1-2 nhóm #strong[trình bày nhanh] Sơ đồ tư
    duy của nhóm mình (có thể trình chiếu trên màn hình lớn).
  - Giáo viên nhận xét, bổ sung, và chốt lại các nội dung trọng tâm.

=== Hoạt động 2: LUYỆN TẬP CỦNG CỐ - TRÒ CHƠI \"ĐOẠT CỜ\" (27 phút)
- #strong[Mục tiêu:] Vận dụng kiến thức đã ôn tập để giải quyết các bài
  tập ở các cấp độ khác nhau.
- #strong[Phương pháp:] Dạy học thông qua trò chơi (Game-based
  learning), Dạy học giải quyết vấn đề, Tăng cường giao tiếp, thuyết
  trình.
- #strong[Hình thức:] Hoạt động nhóm và cá nhân.

+ #strong[Chuẩn bị (2 phút):]
  - Giáo viên chuẩn bị các câu hỏi/bài tập trắc nghiệm và tự luận
    (khoảng 6-8 câu, phân chia độ khó). Có thể sử dụng phiếu bài tập in
    hoặc trình chiếu.
  - Ví dụ:
    - Câu 1 (Nhận biết): $lim_(x arrow.r 2) frac(x^2 - 4, x - 2)$
    - Câu 2 (Thông hiểu): Tính
      $lim_(x arrow.r + oo) frac(2 x - 1, sqrt(x^2 + 1))$
    - Câu 3 (Vận dụng): Tìm $m$ để hàm số
      $f\(x\)= {frac(x^2 - 1, x - 1) & upright("khi ") x eq.not 1\
      m & upright("khi ") x = 1 med$ liên tục tại $x = 1$.

#block[
#set enum(numbering: "1.", start: 2)
+ #strong[Tiến hành trò chơi \"Đoạt Cờ\" (20 phút):]

  - Các nhóm thảo luận và giải quyết các bài tập theo thứ tự.
  - #strong[Quy tắc:] Khi giáo viên đưa ra câu hỏi, các nhóm có
    #strong[2-3 phút] để thảo luận và đưa ra đáp án.
    - Nhóm nào có đáp án #strong[đúng và nhanh nhất] được quyền trình
      bày lời giải và cách tư duy (thuyết trình).
    - Các nhóm khác nhận xét và phản biện.
    - #strong[Khen thưởng] cho nhóm trả lời đúng.
  - #strong[Tăng cường kĩ năng giao tiếp, thuyết trình:] Giáo viên
    khuyến khích học sinh không chỉ đưa ra đáp án mà còn #strong[giải
    thích rõ ràng] các bước làm, đặc biệt là cách xử lí các dạng vô
    định.
  - #strong[Luyện tập đa dạng:] Chú trọng đan xen cả bài tập tính toán
    cơ bản và bài tập lí thuyết/vận dụng về tính liên tục để đảm bảo học
    sinh nắm vững mọi khía cạnh của chương.

+ #strong[Tổng kết và đánh giá (5 phút):]

  - Giáo viên tổng hợp điểm, tuyên dương nhóm thắng cuộc.
  - Giáo viên cho học sinh tự đánh giá lại mức độ hiểu bài của bản thân
    (Tự chủ và tự học).
  - #strong[Dặn dò:] Giao bài tập về nhà và hướng dẫn học sinh xem trước
    bài học tiếp theo.
]

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

