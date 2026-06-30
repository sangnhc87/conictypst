// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 17 Dấu của tam thức bậc hai",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[tam thức bậc hai] $f\(x\)= a x^2 + b x + c$
  ($a eq.not 0$).
- Nắm vững và phát biểu được định lí về #strong[dấu của tam thức bậc
  hai] trong ba trường hợp $Delta < 0$, $Delta = 0$, và $Delta > 0$.
- Vận dụng định lí để xét dấu của một tam thức bậc hai cụ thể.
- Nêu được khái niệm #strong[bất phương trình bậc hai] và nắm được
  phương pháp giải bất phương trình bậc hai bằng cách xét dấu tam thức
  bậc hai tương ứng.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, khám phá định
    lí về dấu tam thức bậc hai thông qua các hoạt động nhóm và tài liệu
    (Sách giáo khoa, video/phần mềm).
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia thảo luận,
    trình bày kết quả làm việc nhóm; hợp tác trong việc hoàn thành nhiệm
    vụ chung và xây dựng sơ đồ tư duy.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống thực tiễn, chuyển hóa thành bài toán xét dấu/giải bất phương
    trình bậc hai và đề xuất giải pháp.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích, so sánh
    các trường hợp của $Delta$ và mối liên hệ với parabol để xây dựng
    định lí; lập luận chặt chẽ khi xét dấu tam thức bậc hai và giải bất
    phương trình.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các bài toán
    thực tiễn (ví dụ: xác định khoảng thời gian vận tốc dương, khoảng
    giá trị để hàm số có nghĩa) thành bất phương trình bậc hai.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 2.2.NC1a- Chia sẻ dữ liệu, thông tin và nội dung số thông qua nhiều
    công cụ số phù hợp,
  - 2.2.NC1b-Hướng dẫn người khác cách đóng vai trò trung gian để chia
    sẻ thông tin và nội dung thông qua công nghệ số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực trong việc thực hiện nhiệm vụ cá nhân và
  nhóm, hoàn thành các bài tập luyện tập và vận dụng.
- #strong[Trung thực:] Nghiêm túc, thật thà trong việc báo cáo kết quả
  và thảo luận nhóm.
- #strong[Trách nhiệm:] Có ý thức hoàn thành nhiệm vụ học tập, giữ gìn
  và sử dụng cẩn thận thiết bị học tập.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, phòng máy tính (nếu
  có), phiếu học tập, bảng phụ, phấn màu.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Phần mềm #strong[Geogebra] (hoặc Desmos) để minh họa đồ thị hàm số
    bậc hai $y = a x^2 + b x + c$. \* Video clip ngắn (nếu có) giới
    thiệu ứng dụng của dấu tam thức bậc hai.
  - Giấy A0/bút dạ (hoặc phần mềm mindmap) để học sinh vẽ Sơ đồ tư duy.
  - Thước kẻ, compa.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
  thị của hàm số bậc hai; xác định được vấn đề cần giải quyết:
  #strong[Làm thế nào để biết tam thức bậc hai nhận dấu dương hay âm
  trên một miền nào đó] mà không cần vẽ đồ thị.
]
#nd-hd[
  - Giáo viên (GV) đưa ra ví dụ sau và yêu cầu học sinh (HS) thảo luận
    nhóm đôi trong 3 phút.
    - #emph[Ví dụ Mở đầu:] Cho tam thức bậc hai $f\(x\)= x^2 - 4 x + 3$.
      + Tìm nghiệm của phương trình $f\(x\)= 0$.
      + Vẽ phác đồ thị hàm số $y = f\(x\)$.
      + Từ đồ thị, hãy cho biết: Khi nào thì $f\(x\)> 0$? Khi nào thì
        $f\(x\)< 0$?
  - GV đặt vấn đề: Nếu không có đồ thị, làm thế nào để xác định được dấu
    của $f\(x\)$ một cách nhanh chóng?
]
#sp-hd[
  - Nghiệm của phương trình: $x_1 = 1$, $x_2 = 3$.
  - Đồ thị là parabol có bề lõm quay lên, cắt trục hoành tại $x = 1$ và
    $x = 3$.
  - Kết quả xử lí tình huống: $f\(x\)> 0$ khi
    $x in\(- oo\;1\)union\(3\;+ oo\)$\; $f\(x\)< 0$ khi $x in\(1\;3\)$.
  - Xác định rõ nhiệm vụ học tập tiếp theo: #strong[Nghiên cứu định lí
    về dấu của tam thức bậc hai.]
]
#tc-hd[
  - #strong[Bước 1: Chuyển giao nhiệm vụ:] GV trình bày ví dụ và yêu cầu
    HS thảo luận nhóm đôi.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc độc lập và trao đổi
    trong nhóm đôi. GV quan sát, gợi ý (nếu cần): #emph[Nhắc lại mối
    liên hệ giữa nghiệm và giao điểm với trục hoành].
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 HS đại diện trình
    bày kết quả (nghiệm, đồ thị phác thảo, kết quả xét dấu).
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa kiến thức (nghiệm
    và sự liên quan đến đồ thị), đặt vấn đề và dẫn dắt vào bài học mới.
  - #emph[#strong[Tích hợp Năng lực số:]] #emph[\(Không bắt buộc trong
    HĐ1)]

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "85 phút")
==== Hoạt động 2.1: Dấu của tam thức bậc hai (50 phút)
- #strong[Tên thể hiện kết quả hoạt động:] Khám phá và xây dựng Định lí
  Dấu của tam thức bậc hai.
#mt-hd[
  lí về dấu của tam thức bậc hai thông qua việc khảo sát đồ thị hàm số
  bậc hai ứng với các trường hợp $Delta < 0$, $Delta = 0$, $Delta > 0$.
]
#nd-hd[
  - #strong[Thực hiện nhiệm vụ 1 (Sử dụng công cụ số):] HS chia 3 nhóm
    lớn (mỗi nhóm khoảng 6-8 HS), mỗi nhóm nghiên cứu một trường hợp của
    $Delta$ và hệ số $a$.
    - #strong[Nhóm 1 (]$Delta < 0$#strong[):] Khảo sát
      $f\(x\)= x^2 - 2 x + 5$ ($a > 0$) và $g\(x\)= - x^2 + x - 1$
      ($a < 0$).
    - #strong[Nhóm 2 (]$Delta = 0$#strong[):] Khảo sát
      $f\(x\)= x^2 - 4 x + 4$ ($a > 0$) và $g\(x\)= - x^2 + 6 x - 9$
      ($a < 0$).
    - #strong[Nhóm 3 (]$Delta > 0$#strong[):] Khảo sát
      $f\(x\)= x^2 - 3 x + 2$ ($a > 0$) và $g\(x\)= - x^2 + 2 x + 3$
      ($a < 0$).
  - #strong[Yêu cầu:] Các nhóm sử dụng phần mềm #strong[Geogebra] để vẽ
    đồ thị các hàm số đã cho. Quan sát vị trí của đồ thị so với trục
    hoành, từ đó rút ra nhận xét về dấu của $f\(x\)$ (hoặc $g\(x\)$).
  - #strong[Thực hiện nhiệm vụ 2 (Hợp tác và Sơ đồ tư duy):] Từ kết quả
    quan sát, các nhóm xây dựng bản nháp Định lí và tổng hợp thành
    #strong[Sơ đồ tư duy] về Dấu của tam thức bậc hai (trình bày trên
    giấy A0 hoặc phần mềm Mindmap).
]
#sp-hd[
  - Bảng/Sơ đồ tổng hợp về mối quan hệ giữa dấu của $f\(x\)$ với dấu của
    $a$ và giá trị của $Delta$.
  - Bản viết Định lí về dấu của tam thức bậc hai.
  - Kết quả của các ví dụ cụ thể trên.
]
#tc-hd[
  - #strong[Bước 1: Chuyển giao nhiệm vụ:] GV chia nhóm, giao nhiệm vụ 1
    và 2 cụ thể cho từng nhóm.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS sử dụng #strong[Geogebra]
    (hoặc công cụ khác) để vẽ đồ thị và quan sát. GV theo dõi, hỗ trợ
    các nhóm gặp khó khăn trong việc sử dụng phần mềm và trong việc rút
    ra nhận xét.
    - #emph[Dự kiến khó khăn và hỗ trợ:] HS có thể gặp khó khăn khi sử
      dụng phần mềm. #strong[Biện pháp hỗ trợ:] GV cung cấp tài liệu
      hướng dẫn nhanh hoặc chiếu thao tác mẫu.
  - #strong[Bước 3: Báo cáo, thảo luận:]
    - GV mời đại diện các nhóm lên trình bày kết quả quan sát, giải
      thích mối liên hệ giữa $Delta$ và vị trí Parabol so với trục
      $O x$.
    - GV mời một nhóm trình bày Sơ đồ tư duy tổng hợp.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa Định lí Dấu của
    tam thức bậc hai. GV nhấn mạnh vai trò của $Delta$ và hệ số $a$
    trong việc quyết định dấu.
  - #emph[#strong[Tích hợp Năng lực số:]] #strong[Năng lực sử dụng và
    khai thác công cụ, phương tiện số]: Học sinh sử dụng
    #strong[Geogebra] để vẽ đồ thị hàm số bậc hai, quan sát vị trí của
    parabol so với trục hoành để dự đoán/kiểm chứng dấu của tam thức.

==== Hoạt động 2.2: Bất phương trình bậc hai (35 phút)
- #strong[Tên thể hiện kết quả hoạt động:] Vận dụng định lí để giải bất
  phương trình bậc hai.
]
#mt-hd[
  trình bậc hai thông qua việc xét dấu tam thức bậc hai tương ứng.
]
#nd-hd[
  - GV đặt vấn đề: Để giải bất phương trình $a x^2 + b x + c > 0$ (hoặc
    $gt.eq 0\,< 0\,lt.eq 0$), ta cần tìm các giá trị của $x$ để tam thức
    $f\(x\)= a x^2 + b x + c$ mang dấu dương (hoặc âm).
  - #strong[Thực hiện nhiệm vụ (Bài tập và Luyện tập):] GV đưa ra bài
    toán mẫu.
    - #emph[Ví dụ 1 (Bài tập cá nhân):] Giải bất phương trình
      $x^2 - 5 x + 6 < 0$.
    - #emph[Ví dụ 2 (Thảo luận cặp đôi):] Giải bất phương trình
      $- x^2 + 2 x - 1 gt.eq 0$.
  - HS làm việc cá nhân sau đó trao đổi trong nhóm đôi để rút ra các
    bước tổng quát khi giải bất phương trình bậc hai.
]
#sp-hd[
  - Lời giải chi tiết và tập nghiệm của các bất phương trình.
  - Ví dụ 1: Tập nghiệm $S =\(2\;3\)$.
  - Ví dụ 2: Tập nghiệm $S = { 1 }$.
  - Bảng tổng hợp các bước giải bất phương trình bậc hai.
]
#tc-hd[
  - #strong[Bước 1: Chuyển giao nhiệm vụ:] GV nêu phương pháp tổng quát,
    sau đó giao Ví dụ 1 (cá nhân) và Ví dụ 2 (cặp đôi).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS tự giải/trao đổi. GV theo
    dõi, nhắc nhở các bước: Tính $Delta$, tìm nghiệm (nếu có), lập bảng
    xét dấu, kết luận.
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời 2 HS lên bảng trình bày lời
    giải, HS khác nhận xét, bổ sung.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa các bước giải bất
    phương trình bậc hai.
  - #emph[#strong[Tích hợp Năng lực số:]] #emph[\(Có thể sử dụng máy
    tính cầm tay để tính nghiệm và] $Delta$ #emph[nhanh chóng).]

]
#hd("3", "Luyện tập", "30 phút")
#mt-hd[
  thành thạo bất phương trình bậc hai.
]
#nd-hd[
  sức\"] với hệ thống bài tập đa dạng về thể loại.
  - #strong[Luyện tập 1 (Xét dấu tam thức):] Xét dấu các tam thức sau:
    #block[
    #set enum(numbering: "i.", start: 1)
    + $f\(x\)= 2 x^2 + 5 x - 3$
    + $g\(x\)= - x^2 + 6 x - 9$
    + $h\(x\)= x^2 - x + 1$
    ]
  - #strong[Luyện tập 2 (Giải bất phương trình):] Giải các bất phương
    trình sau:
    #block[
    #set enum(numbering: "i.", start: 1)
    + $- 3 x^2 + x + 2 > 0$
    + $x\(x + 2\)gt.eq 3$
    + $frac(1, x^2 - 4 x + 3) < 0$
    ]
// ]
#sp-hd[
  - Đáp án và lời giải của các bài tập trên.
  - Sự thành thạo trong việc lập bảng xét dấu và kết luận tập nghiệm.
]
#tc-hd[
  - #strong[Bước 1: Chuyển giao nhiệm vụ:] GV chia lớp thành 4-5 nhóm.
    Trình bày luật chơi \"Tiếp sức\": Các thành viên luân phiên giải bài
    tập trên bảng/phiếu học tập, thành viên sau tiếp nối kết quả của
    thành viên trước.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Các nhóm thực hiện trò chơi. GV
    quan sát, tính điểm, đảm bảo tất cả HS đều tham gia.
  - #strong[Bước 3: Báo cáo, thảo luận:] Nhóm hoàn thành nhanh và chính
    xác nhất trình bày kết quả. Các nhóm khác đối chiếu.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa lời giải, tuyên
    dương nhóm chiến thắng. Chú ý các lỗi sai thường gặp (quên đổi dấu
    khi nhân/chia với số âm, nhầm lẫn dấu trong bảng xét dấu).
  - #emph[#strong[Tích hợp Năng lực số:]] #emph[\(Không bắt buộc).]

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
  dụng kiến thức xét dấu tam thức bậc hai vào giải quyết vấn đề thực
  tiễn.
]
#nd-hd[
  - #emph[Bài tập Vận dụng (Thực tiễn):] Một công ty dự đoán lợi nhuận
    $L\(t\)$ (triệu đồng) trong $t$ tuần được mô hình hóa bằng công thức
    $L\(t\)= - t^2 + 10 t - 21$ (với $t gt.eq 0$).
    - Công ty có lợi nhuận khi nào ($L\(t\)> 0$)?
    - Công ty bị lỗ khi nào ($L\(t\)< 0$)?
  - #strong[Yêu cầu:] HS phát hiện vấn đề thực tiễn gắn với nội dung bài
    học (tìm khoảng thời gian $t$ để lợi nhuận dương/âm), vận dụng kiến
    thức giải bất phương trình bậc hai để giải quyết.
]
#sp-hd[
  - Báo cáo/Bài giải trình bày rõ ràng về việc chuyển bài toán thực tiễn
    thành bất phương trình bậc hai và kết quả giải.
  - #emph[Kết quả:] Lợi nhuận khi $3 < t < 7$ (tuần 4, 5, 6). Lỗ khi
    $0 lt.eq t < 3$ hoặc $t > 7$.
]
#tc-hd[
  - #strong[Bước 1: Chuyển giao nhiệm vụ:] GV giao nhiệm vụ, hướng dẫn
    cách thức nộp báo cáo (có thể nộp qua email/Google Classroom).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thực hiện ngoài giờ học trên
    lớp.
  - #strong[Bước 3: Báo cáo, thảo luận:] Sẽ được trao đổi, chia sẻ và
    đánh giá vào đầu tiết học tiếp theo.
  - #emph[#strong[Tích hợp Năng lực số:]] #strong[Năng lực quản lí và
    lưu trữ dữ liệu số]: Học sinh sử dụng công cụ số (ví dụ: Google
    Docs, Word) để tạo báo cáo và nộp qua nền tảng trực tuyến (email,
    Google Classroom, Zalo,...).

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
