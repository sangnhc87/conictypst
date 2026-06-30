// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 9",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Ôn tập và hệ thống hóa] các kiến thức cơ bản về xác suất theo
  định nghĩa cổ điển:
  - Phép thử ngẫu nhiên, không gian mẫu.
  - Biến cố, biến cố đối, biến cố hợp, biến cố giao, biến cố xung khắc.
  - Định nghĩa cổ điển của xác suất.
- #strong[Vận dụng] công thức tính xác suất trong các bài toán thực tế
  đơn giản và các bài toán đếm cơ bản (tổ hợp, chỉnh hợp).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động hoàn thành các nhiệm vụ
    được giao, tự tìm kiếm và hệ thống hóa kiến thức chương 9.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực trao đổi, thảo
    luận, hợp tác với bạn bè để hoàn thành nhiệm vụ nhóm, trình bày rõ
    ràng, mạch lạc ý tưởng của bản thân.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống, nhận dạng được vấn đề, lựa chọn phương pháp giải quyết tối ưu
    cho bài toán xác suất.
- #strong[Năng lực Toán học (Năng lực đặc thù):]
  - #strong[Năng lực tư duy và lập luận Toán học:] Lập luận logic, sử
    dụng đúng, chính xác ngôn ngữ Toán học (thuật ngữ, kí hiệu) khi giải
    quyết bài toán xác suất.
  - #strong[Năng lực mô hình hóa Toán học:] Nhận biết được các mô hình
    xác suất trong tình huống thực tiễn.
  - #strong[Năng lực giải quyết vấn đề Toán học:] Vận dụng các kiến thức
    đã học để tính xác suất của các biến cố.
- #strong[Năng lực số (Theo TT 02/2025/TT-BGDĐT):]
  - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
  - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
    tin và nội dung trong môi trường số.
  - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin
    và nội dung này cũng như điều hướng giữa chúng.
  - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  tốt các nhiệm vụ cá nhân và nhóm.
- #strong[Trách nhiệm:] Có trách nhiệm với kết quả làm việc nhóm, cẩn
  thận, chính xác khi thực hiện các phép tính.
- #strong[Trung thực:] Trung thực trong việc báo cáo kết quả và kết quả
  làm bài tập.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy chiếu (Projector), máy tính, slide bài giảng
  (PowerPoint), phiếu học tập, #strong[công cụ tạo trò chơi tương tác
  (ví dụ: Kahoot! hoặc Quizizz)].
- #strong[Học sinh:] Sách giáo khoa, vở ghi, bút viết, #strong[điện
  thoại thông minh/máy tính bảng có kết nối Internet (để tham gia trò
  chơi tương tác)], giấy A0/A4 và bút dạ (cho hoạt động Sơ đồ tư duy).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
==== Hoạt động 1: Khởi động (5 phút)
- #strong[Tổ chức:] Cá nhân/Cả lớp.
- #strong[Nội dung:] Giáo viên đặt câu hỏi gợi mở về các khái niệm cơ
  bản đã học.
- #strong[Hoạt động:]
  - Giáo viên trình chiếu một tình huống xác suất thực tế đơn giản (ví
    dụ: Gieo xúc xắc).
  - Giáo viên đặt câu hỏi: #strong["Khi gieo một con xúc xắc 6 mặt, đâu
    là không gian mẫu? Xác suất để xuất hiện mặt chẵn là bao nhiêu?"]
  - Học sinh xung phong trả lời nhanh.
  - Giáo viên nhận xét, dẫn dắt vào bài ôn tập: Để giải quyết được các
    bài toán phức tạp hơn, chúng ta cần hệ thống lại kiến thức.

==== Hoạt động 2: Tổng hợp kiến thức (15 phút)
- #strong[Tổ chức:] #strong[Thảo luận nhóm (4-5 học sinh)].
- #strong[Phương pháp:] #strong[Kĩ thuật Sơ đồ tư duy (Mindmap) -- Lấy
  học sinh làm trung tâm].
- #strong[Nội dung:] Hệ thống hóa kiến thức Chương 9.
- #strong[Hoạt động:]
  - #strong[Bước 1 (3 phút):] Giáo viên chia lớp thành các nhóm (4-5 học
    sinh) và giao nhiệm vụ: #strong["Hãy cùng nhau lập một Sơ đồ tư duy
    (Mindmap) để hệ thống hóa toàn bộ kiến thức về Tính xác suất theo
    định nghĩa cổ điển, bao gồm các nhánh chính: Khái niệm cơ bản (Phép
    thử, Biến cố), Các phép toán biến cố, và Công thức tính xác suất."]
  - #strong[Bước 2 (8 phút):] Các nhóm thảo luận, phân công nhiệm vụ và
    tiến hành vẽ/thiết lập sơ đồ tư duy trên giấy A0/A4. (Khuyến khích
    nhóm nào có điều kiện, tạo sơ đồ tư duy số hóa
  - #strong[Bước 3 (4 phút):] Giáo viên mời đại diện 1-2 nhóm trình bày
    nhanh Sơ đồ tư duy của nhóm mình. Các nhóm khác nhận xét, bổ sung.
  - #strong[Giáo viên chốt kiến thức:] Tổng hợp các ý kiến, chiếu Sơ đồ
    tư duy chuẩn (đã chuẩn bị sẵn) lên màn hình để học sinh đối chiếu và
    ghi nhận.

==== Hoạt động 3: Luyện tập (20 phút)
- #strong[Tổ chức:] Cá nhân/Cả lớp.
- #strong[Phương pháp:] #strong[Trò chơi học tập tương tác
  (Kahoot!/Quizizz) -- Tích hợp Năng lực số].
- #strong[Nội dung:] Giải các bài tập vận dụng kiến thức xác suất.
- #strong[Hoạt động:]
  - #strong[Bước 1 (1 phút):] Giáo viên giới thiệu trò chơi #strong["Đấu
    trường Xác suất"] trên nền tảng số (Kahoot/Quizizz).
  - #strong[Bước 2 (2 phút):] Hướng dẫn học sinh đăng nhập vào trò chơi
    bằng điện thoại/máy tính bảng. #strong[\(Phát triển Năng lực số:
    Tương tác và giao tiếp bằng công nghệ số)].
  - #strong[Bước 3 (15 phút):] Tổ chức trò chơi gồm 10-12 câu hỏi trắc
    nghiệm, bao gồm các dạng bài tập:
    - Nhận diện Biến cố, Biến cố đối.
    - Tính số phần tử không gian mẫu/biến cố ($n\(Omega\)\,n\(A\)$).
    - Vận dụng công thức tính xác suất
      $P\(A\)= frac(n\(A\), n\(Omega\))$.
    - Bài toán về biến cố hợp/xung khắc.
    - Học sinh trả lời trực tiếp trên thiết bị cá nhân. #strong[\(Biểu
      hiện NL Số: Khai thác và xử lí thông tin số)].
  - #strong[Bước 4 (2 phút):] Giáo viên công bố kết quả (top 3) và chữa
    nhanh các câu hỏi khó, yêu cầu học sinh giải thích cách làm.
    #strong[\(Tăng cường kĩ năng giao tiếp, phân tích)].

==== Hoạt động 4: Vận dụng và Củng cố (5 phút)
- #strong[Tổ chức:] Cá nhân/Cả lớp.
- #strong[Nội dung:] Khái quát bài học và giao nhiệm vụ về nhà.
- #strong[Hoạt động:]
  - #strong[Giáo viên:] Yêu cầu một học sinh tóm tắt lại công thức cốt
    lõi của bài học (Định nghĩa cổ điển của xác suất).
  - #strong[Giao nhiệm vụ về nhà:]
    - Hoàn thành các bài tập còn lại trong SGK/SBT.
    - Yêu cầu học sinh #strong[tự tìm kiếm một tình huống thực tế] trong
      cuộc sống có thể mô hình hóa bằng xác suất cổ điển (ví dụ: rút
      thăm trúng thưởng, chọn thành viên ngẫu nhiên) và tự tính xác suất
      của một biến cố liên quan. Yêu cầu nộp báo cáo dưới dạng
      #strong[file văn bản hoặc trình chiếu đơn giản] (tạo ra sản phẩm
      số đơn giản).
  - Giáo viên kết thúc bài học.

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

