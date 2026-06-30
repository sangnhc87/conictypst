// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 19 Lôgarit",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
+ #strong[Về kiến thức:]
  - Nêu được khái niệm lôgarit, tính chất cơ bản của lôgarit.
  - Nêu được các quy tắc tính lôgarit (lôgarit của một tích, một thương,
    một lũy thừa).
  - Nêu được công thức đổi cơ số.
  - Nhận biết được lôgarit thập phân, lôgarit tự nhiên và số $e$.
+ #strong[Về năng lực:]
  - #strong[Năng lực chung:]
    - #strong[Tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến thức
      mới về lôgarit.
    - #strong[Giao tiếp và hợp tác:] Hợp tác hiệu quả trong làm việc
      nhóm, trao đổi, trình bày, và bảo vệ ý kiến cá nhân/nhóm.
    - #strong[Giải quyết vấn đề và sáng tạo:] Vận dụng linh hoạt các
      kiến thức và quy tắc lôgarit để giải quyết các bài toán liên quan.
  - #strong[Năng lực đặc thù môn học:]
    - #strong[Năng lực tư duy và lập luận toán học:] Hình thành và lập
      luận được khái niệm lôgarit thông qua phép toán lũy thừa.
    - #strong[Năng lực mô hình hóa toán học:] Sử dụng lôgarit để mô tả
      các bài toán thực tiễn (ví dụ: tính mức cường độ âm, độ $p H$,...
      nếu có thời gian mở rộng).
    - #strong[Năng lực công cụ và phương tiện toán học (Tích hợp Năng
      lực số):] Sử dụng máy tính cầm tay để tính giá trị lôgarit và kiểm
      tra kết quả.
  - #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
    - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
    - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu,
      thông tin và nội dung trong môi trường số.
    - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông
      tin và nội dung này cũng như điều hướng giữa chúng.
    - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
    - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
    - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp
      nhất cho một bối cảnh cụ thể.
+ #strong[Về phẩm chất:]
  - #strong[Chăm chỉ:] Tích cực trong học tập, hoàn thành đầy đủ các
    nhiệm vụ được giao.
  - #strong[Trung thực:] Thẳng thắn, khách quan trong trao đổi, thảo
    luận, đánh giá.
  - #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ nhóm, nhiệm vụ học
    tập và vận dụng kiến thức vào thực tiễn cuộc sống.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối mạng, phiếu học
  tập, bảng phụ, bút dạ.
- #strong[Học liệu:] Sách giáo khoa Toán 11, sách bài tập, tài liệu tham
  khảo, #strong[video] giới thiệu ứng dụng của lôgarit trong thực tế,
  #strong[sơ đồ tư duy] tóm tắt kiến thức (do giáo viên hoặc học sinh
  chuẩn bị).
- #strong[Phương tiện kĩ thuật số (Phát triển Năng lực số):] Máy tính
  cầm tay (Casio FX-570VN PLUS hoặc tương đương) cho học sinh, phần mềm
  trình chiếu.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
Tạo hứng thú, giúp học sinh nhận ra vấn đề cần
  giải quyết, từ đó dẫn đến nhu cầu tìm hiểu khái niệm lôgarit.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Giáo viên đặt vấn đề: \"Cho phương trình
    $2^x = 8$. Hỏi $x$ bằng bao nhiêu?\" (Học sinh dễ dàng tìm được
    $x = 3$).
  - Tiếp theo: \"Cho phương trình $2^x = 5$. Hỏi $x$ bằng bao nhiêu?\"
    (Học sinh gặp khó khăn, nhận thấy $x$ không là số nguyên).
  - #strong[Yêu cầu:] Học sinh thảo luận nhóm nhanh (3 phút) và trình
    bày ý tưởng: Làm thế nào để kí hiệu và tính được số $x$ trong trường
    hợp $2^x = 5$?
]
#sp-hd[
  - Học sinh trả lời được $x = 3$ cho phương trình đầu.
  - Học sinh nhận thấy cần một kí hiệu mới để biểu diễn số mũ $x$ trong
    phương trình $2^x = 5$.
  - #strong[Gợi ý giải pháp:] Cần xây dựng một phép toán mới để tìm số
    mũ khi biết cơ số và giá trị lũy thừa.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV đặt 2 câu hỏi, yêu cầu HS thảo
    luận cặp đôi/nhóm nhỏ.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS trao đổi, ghi kết quả ra
    nháp. GV quan sát, khuyến khích HS suy nghĩ về mối liên hệ với phép
    toán đã biết.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời đại diện 1-2 nhóm báo
    cáo.
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, dẫn dắt: Để giải
    quyết bài toán $2^x = 5$, người ta đã định nghĩa một phép toán mới
    gọi là #strong[Lôgarit].
  - #emph[Tích hợp Năng lực số:] Không có biểu hiện rõ rệt trong hoạt
    động này.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "50 phút")
==== 2.1. Khái niệm lôgarit (10 phút)
#mt-hd[
Phát biểu được định nghĩa lôgarit và tính được
  lôgarit đơn giản.
]
#nd-hd[
Hỏi đáp, Nghiên cứu SGK):]
  - #strong[Nhiệm vụ:] Cá nhân HS làm việc với SGK (trang...), đọc định
    nghĩa và kí hiệu lôgarit: $x = log_a b$ nếu $a^x = b$
    ($a > 0\,a eq.not 1\,b > 0$).
  - #strong[Ví dụ minh họa:] Tính $log_2 8$, $log_3 9$, $log_10 100$.
// ]
#sp-hd[
  - HS ghi nhớ và phát biểu đúng định nghĩa: Số $x$ thỏa mãn $a^x = b$
    được gọi là #strong[lôgarit cơ số] $a$ #strong[của] $b$, kí hiệu là
    $log_a b$.
  - Kết quả các ví dụ: $log_2 8 = 3$\; $log_3 9 = 2$\; $log_10 100 = 2$.
]
#tc-hd[
  - GV yêu cầu HS tự nghiên cứu, sau đó mời 1-2 HS trình bày lại định
    nghĩa và các điều kiện.
  - HS thực hiện các ví dụ, GV kiểm tra nhanh.

==== 2.2. Tính chất của lôgarit (20 phút)
]
#mt-hd[
Nắm được các tính chất cơ bản, các quy tắc tính
  lôgarit và công thức đổi cơ số.
]
#nd-hd[
Thảo luận nhóm nhỏ, Khám phá):]
  - #strong[Nhiệm vụ 1: Tính chất cơ bản:] HS thảo luận 2 phút để tìm ra
    các tính chất cơ bản $log_a 1$, $log_a a$, $log_a a^alpha$,
    $a^(log_a b)$.
  - #strong[Nhiệm vụ 2: Quy tắc tính:] GV yêu cầu HS làm việc nhóm (4-5
    người), sử dụng định nghĩa và tính chất của lũy thừa để chứng minh
    hoặc kiểm tra (qua ví dụ) các công thức:
    - $log_a\(b c\)= log_a b + log_a c$
    - $log_a\(b / c\)= log_a b - log_a c$
    - $log_a b^alpha = alpha log_a b$
  - #strong[Nhiệm vụ 3: Đổi cơ số:] Giới thiệu công thức đổi cơ số
    $log_a b = frac(log_c b, log_c a)$ và yêu cầu HS làm ví dụ: Tính
    $log_4 8$ bằng cách đổi về cơ số 2.
// ]
#sp-hd[
  - Các tính chất cơ bản được ghi nhận: $log_a 1 = 0$, $log_a a = 1$,
    $log_a a^alpha = alpha$, $a^(log_a b) = b$.
  - Các quy tắc tính lôgarit (3 công thức) được ghi nhớ.
  - Kết quả ví dụ: $log_4 8 = frac(log_2 8, log_2 4) = 3 / 2$.
]
#tc-hd[
  - GV tổ chức HS thảo luận 2 lần (Nhiệm vụ 1 & 2), mời đại diện nhóm
    trình bày, GV chốt kiến thức.
  - GV giới thiệu công thức đổi cơ số và yêu cầu HS thực hành tính
    nhanh.

==== 2.3. Lôgarit thập phân và Lôgarit tự nhiên (15 phút)
]
#mt-hd[
Nhận biết được lôgarit thập phân, lôgarit tự
  nhiên, số $e$, và biết cách tính bằng máy tính cầm tay.
]
#nd-hd[
Giảng giải, Thực hành công cụ):]
  - #strong[Nhiệm vụ 1: Giới thiệu:] Giới thiệu $log_10 b$ là
    #strong[lôgarit thập phân], kí hiệu $log b$ (hoặc $lg b$). Giới
    thiệu số $e approx 2.718$ và $log_e b$ là #strong[lôgarit tự nhiên],
    kí hiệu $ln b$.
  - #strong[Nhiệm vụ 2: Thực hành:] GV yêu cầu HS sử dụng máy tính cầm
    tay để tính: $log 5$, $ln 2.5$, $log_0.5 7$.
// ]
#sp-hd[
  - HS ghi nhận kí hiệu và tên gọi của lôgarit thập phân và lôgarit tự
    nhiên.
  - HS biết cách sử dụng các phím $log$ và $ln$ trên máy tính.
]
#tc-hd[
  - GV trình bày kiến thức mới, sau đó hướng dẫn HS sử dụng máy tính.
  - #emph[Tích hợp Năng lực số:] #strong[Biểu hiện:] #emph[Sử dụng và
    quản lí các công cụ/phương tiện kĩ thuật số.] HS sử dụng máy tính
    cầm tay để tính giá trị lôgarit (sử dụng phím $log$ và $ln$ hoặc tổ
    hợp phím để tính $log_a b$).

==== 2.4. Khắc sâu kiến thức (5 phút)
]
#mt-hd[
Tổng hợp kiến thức vừa học.
]
#nd-hd[
Sơ đồ tư duy/Kĩ thuật mảnh ghép):]
  - #strong[Nhiệm vụ:] Yêu cầu các nhóm hoàn thành #strong[Sơ đồ tư duy]
    tóm tắt toàn bộ kiến thức vừa học (Khái niệm, Tính chất, Quy tắc,
    Đổi cơ số, Lôgarit đặc biệt).
// ]
#sp-hd[
Bản nháp Sơ đồ tư duy (có thể là bài tập về nhà
  để hoàn thiện).
]
#tc-hd[
GV cho HS 5 phút để bắt đầu phác thảo
  sơ đồ, kết thúc hoạt động 2.

]
#hd("3", "Luyện tập", "20 phút")
#mt-hd[
Vận dụng kiến thức, quy tắc lôgarit vào giải các
  bài tập cơ bản, rèn luyện kĩ năng tính toán và biến đổi.
]
#nd-hd[
Cá nhân, Trò chơi học tập - Tiếp sức):]
  - #strong[Hệ thống bài tập (Trò chơi Tiếp sức):]
    - Bài 1: Tính $log_(1 / 2) 8$.
    - Bài 2: Tính $log_6 9 + log_6 4$.
    - Bài 3: Biết $log_2 3 = a$. Tính $log_2 18$ theo $a$.
    - Bài 4: Tính $log_36 9$ bằng công thức đổi cơ số.
// ]
#sp-hd[
Đáp án và lời giải chi tiết của 4 bài tập.
  - Bài 1: $- 3$.
  - Bài 2: $log_6\(9 dot.op 4\)= log_6 36 = 2$.
  - Bài 3:
    $log_2 18 = log_2\(2 dot.op 3^2\)= log_2 2 + 2 log_2 3 = 1 + 2 a$.
  - Bài 4:
    $frac(log_3 9, log_3 36) = frac(2, log_3\(6^2\)) = frac(2, 2 log_3 6) = frac(1, log_3 6)$.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Chia lớp thành các nhóm (4-5 nhóm),
    phát đề bài. Yêu cầu HS lần lượt giải 4 bài tập theo hình thức tiếp
    sức (mỗi người một bài).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc nhóm, trao đổi. GV
    quan sát, hướng dẫn (gợi ý về quy tắc tính).
  - #strong[Bước 3: Báo cáo, thảo luận:] Nhóm hoàn thành nhanh nhất dán
    kết quả lên bảng. GV mời các nhóm khác nhận xét, bổ sung.
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt đáp án, biểu dương
    nhóm thắng cuộc.
  - #emph[Tích hợp Năng lực số:] #strong[Biểu hiện:] #emph[Sử dụng và
    quản lí các công cụ/phương tiện kĩ thuật số.] HS sử dụng máy tính
    cầm tay để kiểm tra kết quả cuối cùng.

]
#hd("4", "Vận dụng", "10 phút - Giao nhiệm vụ về nhà")
#mt-hd[
Phát triển năng lực vận dụng kiến thức vào thực
  tiễn, thấy được ý nghĩa của lôgarit.
]
#nd-hd[
Dự án nhỏ cá nhân/nhóm):]
  - #strong[Nhiệm vụ:] Yêu cầu học sinh tìm hiểu một trong các ứng dụng
    thực tế của lôgarit:
    - #strong[Ứng dụng 1:] Công thức tính độ $p H$ của dung dịch:
      $p H = - l o g\[H^(+)\]$ (trong Hóa học).
    - #strong[Ứng dụng 2:] Công thức tính mức cường độ âm:
      $L = 10 l o g\(I / I_0\)$ (trong Vật lí/Âm học).
    - #strong[Ứng dụng 3:] Công thức tính độ Richter
      $M = l o g\(A / A_0\)$ (trong Địa lí/Khoa học Trái Đất).
  - #strong[Yêu cầu:] Chọn một ứng dụng, tìm hiểu các đại lượng trong
    công thức và giải một bài toán thực tế đơn giản có sử dụng công thức
    đó.
// ]
#sp-hd[
  - Báo cáo (dạng Word, PowerPoint hoặc video ngắn) tóm tắt ứng dụng và
    lời giải của bài toán thực tế.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giới thiệu các ứng dụng, phân
    công (hoặc để HS tự chọn) nhiệm vụ về nhà.
  - #strong[Bước 2: Hướng dẫn/Hỗ trợ:] GV nhắc nhở về hình thức báo cáo,
    thời hạn nộp.
  - #strong[Bước 3: Đánh giá:] Thu báo cáo nộp vào buổi học tiếp theo để
    trao đổi, chia sẻ và đánh giá.
  - #emph[Tích hợp Năng lực số:] #strong[Biểu hiện:] #emph[Khai thác và
    xử lí thông tin số; Sử dụng và quản lí các công cụ/phương tiện kĩ
    thuật số.] HS sử dụng Internet để tìm kiếm tài liệu, sử dụng phần
    mềm (Word/PP) để làm báo cáo, có thể dùng máy tính để tính toán.

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
