// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 21 PT BPT mũ và lôgarit",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nắm vững định nghĩa và các phương pháp cơ bản giải #strong[phương
  trình mũ] và #strong[phương trình lôgarit] dạng cơ bản và một số dạng
  đưa về dạng cơ bản.
- Nắm vững định nghĩa và các phương pháp cơ bản giải #strong[bất phương
  trình mũ] và #strong[bất phương trình lôgarit] dạng cơ bản và một số
  dạng đưa về dạng cơ bản.
- Vận dụng được các kiến thức về lũy thừa và lôgarit để giải các phương
  trình, bất phương trình đã học.

#muc("2", "NĂNG LỰC")
#muc("2", "NĂNG LỰC")
- #strong[Năng lực tự chủ và tự học:] Chủ động tìm tòi, tiếp cận thông
  tin trong sách giáo khoa và các nguồn học liệu khác để xây dựng kiến
  thức.
- #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia thảo luận
  nhóm, trình bày ý kiến, lắng nghe và phản biện một cách xây dựng.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, nhận dạng
  và đề xuất được các bước giải quyết các bài toán về phương trình, bất
  phương trình mũ và lôgarit.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực tư duy và lập luận toán học:] Nhận biết và chứng minh
  được tính tương đương của các phép biến đổi phương trình/bất phương
  trình; lập luận logic trong việc đặt điều kiện và loại nghiệm.
- #strong[Năng lực mô hình hóa toán học:] Vận dụng kiến thức để giải
  quyết các bài toán thực tiễn đơn giản có sử dụng phương trình, bất
  phương trình mũ và lôgarit (nếu có).
- #strong[Năng lực công cụ và phương tiện toán học (Tích hợp Năng lực
  số):] Sử dụng máy tính cầm tay (casio) và các phần mềm Toán học (ví
  dụ: GeoGebra, Desmos) để kiểm tra nghiệm, vẽ đồ thị hoặc giải phương
  trình/bất phương trình.

#muc("2", "NĂNG LỰC")
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, kiên trì trong việc thực hiện các nhiệm
  vụ học tập, đặc biệt là các bài tập khó.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ được giao, có ý thức
  đóng góp xây dựng bài học chung.
- #strong[Trung thực:] Thẳng thắn nhìn nhận sai sót trong quá trình giải
  bài và hợp tác để sửa chữa.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối mạng, bảng/bảng
  phụ.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập (in sẵn hoặc online qua Google Forms/Quizizz).
  - Phần mềm Toán học: #strong[GeoGebra] hoặc #strong[Desmos] (để tích
    hợp năng lực số).
  - Tài liệu ôn tập kiến thức về lũy thừa và lôgarit (kiến thức nền).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
Tạo hứng thú và giúp học sinh xác định được vấn
  đề trọng tâm cần giải quyết là \"Làm thế nào để tìm được giá trị của
  ẩn số $x$ trong các biểu thức có chứa lũy thừa và lôgarit\".
]
#nd-hd[
Giáo viên đưa ra một bài toán thực tế đơn giản
  có sử dụng phương trình mũ (ví dụ về lãi suất kép, sự tăng trưởng dân
  số hoặc phân rã phóng xạ).
  - #emph[Ví dụ minh họa:] Một người gửi tiết kiệm #strong[10 triệu
    đồng] vào ngân hàng với lãi suất $6 %$ một năm, theo phương thức lãi
    kép. Hỏi sau bao nhiêu năm thì số tiền cả gốc và lãi là #strong[14
    triệu đồng]? (Phương trình cần giải: $10 dot.op\(1 + 0.06\)^t= 14$).
]
#sp-hd[
Học sinh ghi nhận được công thức mô hình hóa và
  xác định được nhiệm vụ là phải tìm được giá trị của biến số $t$ (năm)
  trong phương trình mũ đó.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên trình bày bài toán thực tế, yêu
    cầu học sinh thảo luận cặp đôi để xây dựng công thức toán học mô
    hình hóa vấn đề.
  - #strong[Thực hiện nhiệm vụ:] Học sinh làm việc, giáo viên theo dõi,
    gợi ý. (Dự kiến khó khăn: Học sinh có thể lúng túng trong việc biến
    đổi tìm $t$. Hỗ trợ: Gợi ý sử dụng kiến thức về lôgarit để tìm ẩn ở
    số mũ).
  - #strong[Báo cáo, thảo luận:] Mời một vài nhóm trình bày công thức và
    nhận xét về dạng của phương trình vừa thu được.
  - #strong[Kết luận, nhận định:] Giáo viên chốt lại, đặt vấn đề: \"Để
    giải quyết bài toán này, chúng ta cần tìm hiểu các phương pháp giải
    quyết các dạng #strong[phương trình, bất phương trình mũ và
    lôgarit]\".

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "55 phút")
==== Hoạt động 2.1: Phương trình mũ (15 phút)
#mt-hd[
Học sinh nắm được định nghĩa, dạng cơ bản và
  phương pháp giải phương trình mũ $a^x = b$.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] Học sinh nghiên cứu SGK, nhận dạng và nêu cách
    giải phương trình mũ cơ bản $a^x = b$ (với $a > 0\,a eq.not 1$).
  - #strong[Nhiệm vụ 2 (Thực hành):] Thảo luận nhóm 4, giải ví dụ và
    trình bày lời giải.
    - #emph[Ví dụ minh họa:] Giải phương trình $2^(2 x - 1) = 8$.
  - #strong[Tích hợp Năng lực số:] Yêu cầu học sinh sử dụng máy tính cầm
    tay để kiểm tra lại nghiệm hoặc sử dụng GeoGebra/Desmos để vẽ đồ thị
    hàm số $y = 2^(2 x - 1)$ và $y = 8$ để tìm giao điểm (nghiệm).
    #emph[Biểu hiện NL số:] #strong[Sử dụng các công cụ số để hỗ trợ
    hoạt động học và tự học.]
]
#sp-hd[
Lời giải đúng của phương trình $2^(2 x - 1) = 8$
  (Đáp án: $x = 2$).
]
#tc-hd[
Học sinh tự nghiên cứu, làm việc nhóm,
  đại diện nhóm trình bày. Giáo viên nhận xét, chuẩn hóa kiến thức.

==== Hoạt động 2.2: Phương trình Lôgarit (15 phút)
]
#mt-hd[
Học sinh nắm được định nghĩa, dạng cơ bản và
  phương pháp giải phương trình lôgarit $log_a x = b$.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] Học sinh nghiên cứu SGK, xác định điều kiện của
    ẩn và nêu cách giải phương trình lôgarit cơ bản $log_a x = b$ (với
    $a > 0\,a eq.not 1$).
  - #strong[Nhiệm vụ 2 (Thực hành):] Thảo luận nhóm 4, giải ví dụ, chú
    trọng bước đặt điều kiện.
    - #emph[Ví dụ minh họa:] Giải phương trình $log_3\(2 x - 1\)= 2$.
]
#sp-hd[
Lời giải đúng của phương trình
  $log_3\(2 x - 1\)= 2$ (Điều kiện: $x > 1\/2$. Nghiệm: $x = 5$).
]
#tc-hd[
Tương tự HĐ 2.1. Giáo viên nhấn mạnh
  tầm quan trọng của việc #strong[đặt điều kiện] cho biểu thức dưới dấu
  lôgarit.

==== Hoạt động 2.3: Bất phương trình mũ (10 phút)
]
#mt-hd[
Học sinh nắm được cách giải bất phương trình mũ
  cơ bản $a^x > b$, đặc biệt là sự khác biệt khi $a > 1$ và $0 < a < 1$.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] Học sinh nghiên cứu SGK, so sánh cách giải bất
    phương trình mũ với phương trình mũ, nêu rõ sự khác biệt khi cơ số
    $a$ thay đổi.
  - #strong[Nhiệm vụ 2 (Thực hành):] Thảo luận nhóm 4, giải ví dụ và
    giải thích vì sao phải đổi chiều bất đẳng thức (hoặc giữ nguyên).
    - #emph[Ví dụ minh họa:] Giải bất phương trình $(1 / 2)^(3 x) < 4$.
]
#sp-hd[
Lời giải đúng của bất phương trình
  $(1 / 2)^(3 x) < 4$ (Đáp án: $x > - 2\/3$).
]
#tc-hd[
Giáo viên sử dụng #strong[sơ đồ tư duy]
  (có thể vẽ trực tiếp hoặc sử dụng công cụ số) để tổng hợp kiến thức về
  dấu bất đẳng thức theo cơ số $a$.

==== Hoạt động 2.4: Bất phương trình Lôgarit (15 phút)
]
#mt-hd[
Học sinh nắm được cách giải bất phương trình
  lôgarit cơ bản $log_a x > b$, đặc biệt là việc kết hợp điều kiện và
  xét cơ số.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] Học sinh nghiên cứu SGK, trình bày các bước
    giải bất phương trình lôgarit cơ bản, lưu ý #strong[điều kiện] và
    #strong[chiều bất đẳng thức] theo cơ số $a$.
  - #strong[Nhiệm vụ 2 (Thực hành):] Thảo luận nhóm 4, giải ví dụ và
    trình bày tập nghiệm.
    - #emph[Ví dụ minh họa:] Giải bất phương trình
      $log_2\(x^2 - 3\)lt.eq 2$.
]
#sp-hd[
Lời giải đúng của bất phương trình
  $log_2\(x^2 - 3\)lt.eq 2$ (Tập nghiệm:
  $\[- sqrt(7)\;- sqrt(3)\)union\(sqrt(3)\;sqrt(7)\]$).
]
#tc-hd[
Yêu cầu các nhóm tự đánh giá lẫn nhau
  (Peer Assessment) về việc đặt điều kiện và tìm tập nghiệm.

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
Vận dụng linh hoạt các phương pháp đã học để
  giải một số bài toán tổng hợp, nâng cao kỹ năng phân tích và giải
  toán.
]
#nd-hd[
Tổ chức #strong[Trò chơi học tập] \"Tiếp sức
  toán học\" (hoặc Phiếu bài tập cá nhân/nhóm). Hệ thống câu hỏi, bài
  tập đa dạng:
  - Bài 1 (Dễ): Giải phương trình $e^(2 x) - 5 e^x + 6 = 0$ (Đặt ẩn
    phụ).
  - Bài 2 (Trung bình): Giải bất phương trình
    $log_3^2 x - 3 log_3 x + 2 > 0$.
  - Bài 3 (Khó): Giải phương trình $4^x - 2^(x + 1) - 3 = 0$.
]
#sp-hd[
Đáp án, lời giải chi tiết và đầy đủ cho các câu
  hỏi, bài tập.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên chia lớp thành các nhóm nhỏ (4-5
    học sinh) và giao nhiệm vụ giải các bài tập trên theo hình thức tiếp
    sức.
  - #strong[Thực hiện nhiệm vụ:] Học sinh làm việc nhóm, trao đổi, hỗ
    trợ nhau. Giáo viên quan sát, hỗ trợ kịp thời các nhóm gặp khó khăn.
  - #strong[Báo cáo, đánh giá:] Đại diện nhóm trình bày kết quả. Giáo
    viên nhận xét, đánh giá nhanh quá trình làm việc nhóm, chú trọng
    tinh thần #strong[giao tiếp] và #strong[hợp tác].
  - #strong[Tích hợp Năng lực số:] Yêu cầu học sinh sử dụng Google Docs
    hoặc các công cụ số khác để ghi chép và chia sẻ lời giải chung của
    nhóm. #emph[Biểu hiện NL số:] #strong[Cộng tác qua môi trường số]
    (Thông tư 02/2025/TT-BGDĐT).

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  vào giải quyết các vấn đề thực tiễn (liên quan đến tăng trưởng, suy
  giảm hoặc quy mô).
]
#nd-hd[
Giao nhiệm vụ tìm hiểu và giải quyết một vấn đề
  thực tế:
  - #emph[Nội dung nhiệm vụ:] #strong[Nồng độ thuốc trong máu.] Sau khi
    tiêm, nồng độ của một loại thuốc trong máu của bệnh nhân (tính bằng
    $upright("mg")\/upright("ml")$) được cho bởi công thức
    $C\(t\)= 15 dot.op\(0.85\)^t$, trong đó $t$ là thời gian tính bằng
    giờ. Hỏi sau bao lâu thì nồng độ thuốc trong máu xuống dưới mức
    $5 upright("mg")\/upright("ml")$? (Cần giải bất phương trình
    $15 dot.op\(0.85\)^t< 5$).
]
#sp-hd[
Bản báo cáo (hoặc thuyết trình ngắn) về cách mô
  hình hóa vấn đề và kết quả tính toán (lời giải bất phương trình).
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giao nhiệm vụ cho học sinh thực hiện
    #strong[ngoài giờ học trên lớp].
  - #strong[Thực hiện nhiệm vụ:] Học sinh tự tìm hiểu, tính toán, và lập
    báo cáo.
  - #strong[Đánh giá:] Nộp báo cáo và trình bày, trao đổi, chia sẻ và
    đánh giá vào đầu buổi học tiếp theo. Giáo viên có thể khuyến khích
    học sinh sử dụng công cụ kỹ thuật số để trình bày báo cáo
    (PowerPoint, Canva, v.v.).

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
