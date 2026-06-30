// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 16 Giới hạn của hàm số",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nắm được định nghĩa #strong[giới hạn hữu hạn của hàm số tại một điểm]
  (hoặc tại vô cực).
- Hiểu rõ định nghĩa #strong[giới hạn vô cực của hàm số tại một điểm]
  (hoặc tại vô cực).
- Vận dụng các #strong[định lí về giới hạn hữu hạn] và #strong[một số
  quy tắc tính giới hạn vô cực] để tính giới hạn của các hàm số cơ bản.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực thực hiện các
    nhiệm vụ học tập được giao (chuẩn bị bài, tìm hiểu ví dụ).
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia hoạt động
    nhóm, trình bày, thảo luận, báo cáo kết quả học tập.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Biết phát hiện, đặt
    câu hỏi, sử dụng kiến thức đã học để giải quyết các bài toán về giới
    hạn.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận Toán học:] Lập luận logic để xác
    định và tính toán giới hạn của hàm số.
  - #strong[Năng lực mô hình hóa Toán học:] Sử dụng giới hạn để mô hình
    hóa một số vấn đề thực tiễn (nếu có ở Hoạt động 4).
  - #strong[Năng lực sử dụng công cụ, phương tiện học Toán:] Sử dụng máy
    tính cầm tay, phần mềm đồ thị/bảng tính (như GeoGebra, Excel) để
    kiểm tra kết quả tính toán hoặc khảo sát đồ thị minh họa.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
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
- #strong[Chăm chỉ:] Có ý thức tự giác, tích cực trong học tập, hoàn
  thành tốt các nhiệm vụ cá nhân và nhóm.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ được giao; hợp tác
  tốt với bạn bè trong nhóm.
- #strong[Trung thực:] Thể hiện sự trung thực trong quá trình báo cáo và
  đánh giá kết quả học tập.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/TV, máy tính giáo viên.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Bộ Kết nối tri thức với cuộc sống).
  - Phiếu học tập (cho Hoạt động 2 và 3).
  - Công cụ số: Phần mềm #strong[GeoGebra] (hoặc Desmos) để minh họa đồ
    thị hàm số và kiểm tra giới hạn; Google Docs/Slides/Canva để học
    sinh làm báo cáo nhóm.
  - Video/hình ảnh minh họa ứng dụng thực tiễn của giới hạn (nếu có).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
==== a) Mục tiêu
Tạo tình huống có vấn đề, giúp học sinh nhận thấy sự cần thiết phải
nghiên cứu khái niệm \"Giới hạn của hàm số\".

==== b) Nội dung
- #strong[GV] đặt vấn đề bằng một ví dụ dẫn dắt (bài toán thực tiễn hoặc
  toán học gợi mở):
  - #strong[Ví dụ Khởi động:] Xét hàm số $f\(x\)= frac(x^2 - 4, x - 2)$
    với $x eq.not 2$. Hãy cho biết giá trị của $f\(x\)$ thay đổi như thế
    nào khi $x$ dần tới $2$ (nhưng $x eq.not 2$)?
- #strong[HS] thực hiện nhiệm vụ:
  - Cá nhân/Nhóm nhỏ tính giá trị của $f\(x\)$ tại các điểm gần $2$ (như
    $1.9\,1.99\,2.01\,2.001$).
  - #strong[Tích hợp Năng lực số:] Sử dụng #strong[máy tính cầm tay]
    hoặc #strong[bảng tính Excel] để tính nhanh các giá trị của hàm số
    $f\(x\)$ (Biểu hiện NL số: #strong[Khai thác và xử lí thông tin số]
    \- Tính toán nhanh chóng, chính xác bằng công cụ số).

==== c) Sản phẩm
- #strong[Bảng giá trị:] Cho thấy $f\(x\)$ càng lúc càng gần một giá trị
  xác định (là 4) khi $x arrow.r 2$.
- #strong[Kết luận sơ bộ:] Học sinh nhận thấy hàm số không xác định tại
  $x = 2$ nhưng giá trị của hàm số vẫn \"hướng tới\" một số khi biến số
  \"hướng tới\" một số.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Chuyển giao nhiệm vụ (GV):] Trình bày Ví dụ Khởi động
  và yêu cầu HS tính toán.
- #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
  trợ):] HS thực hiện tính toán. GV quan sát, nhắc nhở HS sử dụng công
  cụ số.
- #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức; HS báo cáo):] Mời 1-2
  HS trình bày kết quả tính toán.
- #strong[Bước 4: Kết luận, nhận định (GV):] Tổng hợp kết quả, dẫn dắt:
  \"Giá trị mà $f\(x\)$ tiến tới khi $x$ dần tới $2$ được gọi là
  #strong[giới hạn của hàm số] $f\(x\)$ khi $x$ dần tới $2$\.\"
  $arrow.r$ Đặt vấn đề nghiên cứu bài học.

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "65 phút")
==== 2.1. Giới hạn hữu hạn của hàm số tại một điểm (20 phút)
#mt-hd[
Hình thành định nghĩa và các định lí về giới hạn
  hữu hạn của hàm số tại một điểm.
]
#nd-hd[
HS đọc SGK, thảo luận nhóm để trả lời các câu
  hỏi:
  - Phát biểu định nghĩa $lim_(x arrow.r x_0) f\(x\)= L$.
  - Nêu các định lí cơ bản về giới hạn hữu hạn (giới hạn của tổng, hiệu,
    tích, thương).
  - #strong[Ví dụ:] Cho hàm số $g\(x\)= frac(3 x^2 - x - 2, x - 1)$.
    Tính $lim_(x arrow.r 1) g\(x\)$.
]
#sp-hd[
  - Định nghĩa giới hạn hữu hạn tại một điểm.
  - Các định lí cơ bản.
  - Lời giải chi tiết Ví dụ (Sử dụng quy tắc khử dạng vô định $0 / 0$
    bằng cách phân tích tử thành nhân tử:
    $lim_(x arrow.r 1)\(3 x + 2\)= 5$).
]
#tc-hd[
  - #strong[GV] chia nhóm, giao nhiệm vụ tìm hiểu SGK và giải ví dụ.
    #strong[GV] hướng dẫn HS sử dụng định lí để giải.
  - #strong[Tích hợp Năng lực số:] Sau khi tính toán thủ công,
    #strong[GV] có thể minh họa đồ thị hàm số $g\(x\)$ bằng
    #strong[GeoGebra] để HS quan sát và kiểm tra lại kết quả
    $lim_(x arrow.r 1) g\(x\)= 5$. (Biểu hiện NL số: #strong[Sử dụng
    công cụ số để hỗ trợ học tập]).

==== 2.2. Giới hạn hữu hạn của hàm số tại vô cực (20 phút)
]
#mt-hd[
Hình thành định nghĩa giới hạn hữu hạn của hàm
  số khi $x arrow.r plus.minus oo$ và biết cách tính trong trường hợp
  này.
]
#nd-hd[
HS đọc SGK, thảo luận để trả lời:
  - Phát biểu định nghĩa $lim_(x arrow.r plus.minus oo) f\(x\)= L$.
  - Nêu giới hạn cơ bản: $lim_(x arrow.r plus.minus oo) 1 / x^k = 0$
    ($k$ nguyên dương).
  - #strong[Ví dụ:] Tính $lim_(x arrow.r + oo) frac(2 x + 1, x - 3)$.
]
#sp-hd[
  - Định nghĩa giới hạn hữu hạn tại vô cực.
  - Lời giải chi tiết Ví dụ (Chia cả tử và mẫu cho $x$:
    $lim_(x arrow.r + oo) frac(2 + 1 / x, 1 - 3 / x) = 2$).
]
#tc-hd[
  - #strong[GV] giao nhiệm vụ. Hướng dẫn HS phương pháp chung để tính
    giới hạn của hàm phân thức hữu tỉ khi $x arrow.r plus.minus oo$
    (chia cho bậc cao nhất của mẫu/tử).
  - Khuyến khích HS sử dụng #strong[máy tính cầm tay] nhập $x$ rất lớn
    (ví dụ $10^5\,10^10$) để dự đoán kết quả trước khi tính toán.

==== 2.3. Giới hạn vô cực và Một số quy tắc tính giới hạn vô cực (25 phút)
]
#mt-hd[
Hình thành định nghĩa
  $lim_(x arrow.r x_0) f\(x\)= plus.minus oo$, biết cách áp dụng quy tắc
  tìm giới hạn vô cực.
]
#nd-hd[
HS đọc SGK, thảo luận nhóm.
  - Phát biểu định nghĩa $lim_(x arrow.r x_0) f\(x\)= plus.minus oo$.
  - Nêu các #strong[quy tắc tính giới hạn vô cực] (Quy tắc giới hạn của
    tích, thương khi có nhân tử tiến tới 0/vô cực).
  - #strong[Ví dụ 1 (Giới hạn vô cực):] Tính
    $lim_(x arrow.r 1) frac(x + 2, \(x - 1\)^2)$.
  - #strong[Ví dụ 2 (Quy tắc):] Tính
    $lim_(x arrow.r + oo)\(x^3 - x^2 + 1\)$.
]
#sp-hd[
  - Định nghĩa giới hạn vô cực.
  - Các quy tắc tính giới hạn vô cực.
  - Lời giải chi tiết Ví dụ 1
    ($lim_(x arrow.r 1) frac(x + 2, \(x - 1\)^2) = + oo$, lập luận dấu).
  - Lời giải chi tiết Ví dụ 2
    ($lim_(x arrow.r + oo) x^3\(1 - 1 / x + 1 / x^3\)= + oo$).
]
#tc-hd[
  - #strong[GV] chia nhóm, giao nhiệm vụ. Nhấn mạnh việc xét
    #strong[dấu] của tử và mẫu khi tính giới hạn vô cực dạng $L / 0$ để
    xác định kết quả là $+ oo$ hay $- oo$.
  - #strong[Tích hợp Năng lực số:] Yêu cầu các nhóm làm #strong[Sơ đồ tư
    duy số] (sử dụng phần mềm như Canva, MindMeister, v.v.) để tổng hợp
    các quy tắc tính giới hạn vô cực. (Biểu hiện NL số: #strong[Tạo lập
    và tương tác trong môi trường số] - Tổng hợp kiến thức bằng công cụ
    số).

]
#hd("3", "Luyện tập", "10 phút")
==== a) Mục tiêu
Củng cố kiến thức, vận dụng thành thạo các quy tắc tính giới hạn.

==== b) Nội dung
- #strong[GV] giao hệ thống bài tập trắc nghiệm nhanh hoặc điền khuyết
  (dạng trò chơi học tập: \"Giải đố Giới hạn\"):
  - #strong[Bài tập 1 (Tính giới hạn tại điểm):] Tính
    $lim_(x arrow.r 2) frac(sqrt(x + 2) - 2, x - 2)$. (Dạng $0 / 0$, cần
    nhân liên hợp).
  - #strong[Bài tập 2 (Tính giới hạn tại vô cực):] Tính
    $lim_(x arrow.r - oo) frac(sqrt(4 x^2 + 1), x + 1)$. (Cần chú ý
    $\|x\|= - x$ khi $x arrow.r - oo$).
- #strong[HS] hoạt động cá nhân/cặp đôi trong thời gian ngắn để giải
  quyết bài tập.

==== c) Sản phẩm
Đáp án và lời giải chi tiết của các bài tập luyện tập.

==== d) Tổ chức thực hiện
- #strong[GV] phát phiếu bài tập/chiếu đề.
- #strong[HS] giải nhanh. #strong[GV] mời 2 HS lên bảng trình bày, hoặc
  tổ chức báo cáo chéo giữa các cặp.
- #strong[GV] nhận xét, chốt kiến thức và phương pháp giải.

#hd("4", "Vận dụng", "5 phút")
==== a) Mục tiêu
Phát triển năng lực vận dụng kiến thức, kĩ năng vào giải quyết các vấn
đề thực tiễn.

==== b) Nội dung
- #strong[GV] giao nhiệm vụ vận dụng thực tiễn (nếu có):
  - #strong[Ví dụ Vận dụng:] \"Trong kĩ thuật, giới hạn được dùng để
    tính toán trong các bài toán về #strong[tiệm cận] (tiệm cận đứng,
    tiệm cận ngang của đồ thị hàm số). Hãy tìm hiểu về một ứng dụng cụ
    thể của giới hạn trong Vật lí hoặc Kinh tế (ví dụ: mô hình tăng
    trưởng dân số/vi khuẩn theo thời gian, tính tốc độ tức thời, v.v.)\"
- #strong[HS] phát hiện, đề xuất vấn đề/tình huống và vận dụng kiến thức
  mới để giải quyết.

==== c) Sản phẩm
Báo cáo (có thể bằng hình thức slide, video, bài viết) về ứng dụng của
giới hạn trong thực tiễn.

==== d) Tổ chức thực hiện
- Đây là nhiệm vụ #strong[ngoài giờ học trên lớp] và được giao về nhà.
- #strong[Tích hợp Năng lực số:] #strong[GV] yêu cầu HS sử dụng các công
  cụ tìm kiếm và tạo lập báo cáo trên môi trường số (slide/video). (Biểu
  hiện NL số: #strong[Khai thác và xử lí thông tin số]\; #strong[Tạo lập
  và tương tác trong môi trường số]).
- #strong[GV] sẽ kiểm tra, trao đổi, chia sẻ và đánh giá vào buổi
  học/thời điểm phù hợp tiếp theo.

