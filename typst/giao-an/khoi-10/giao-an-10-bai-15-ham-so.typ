// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 15 Hàm số",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được #strong[khái niệm hàm số] và các khái niệm liên quan (tập xác
  định, tập giá trị, biến số, giá trị của hàm số).
- Nhận biết được #strong[đồ thị của hàm số].
- Nhận biết và giải thích được sự #strong[đồng biến, nghịch biến] của
  hàm số trên một khoảng.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến thức về
    Hàm số thông qua SGK và học liệu điện tử.
  - #strong[Giao tiếp và hợp tác:] Tích cực tham gia hoạt động nhóm,
    trình bày ý kiến, hợp tác để hoàn thành nhiệm vụ học tập.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống thực
    tiễn để thiết lập mô hình hàm số.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Phát biểu được định
    nghĩa hàm số, chứng minh được tính đồng biến, nghịch biến của một
    hàm số cụ thể.
  - #strong[Năng lực mô hình hóa toán học:] Sử dụng được hàm số để mô tả
    các mối liên hệ thực tiễn (ví dụ: quãng đường, giá thành sản phẩm).
  - #strong[Năng lực sử dụng công cụ và phương tiện học toán (Tích hợp
    Năng lực số):] Sử dụng được các phần mềm toán học (ví dụ:
    #strong[GeoGebra, Desmos]) để vẽ đồ thị hàm số và quan sát tính đồng
    biến, nghịch biến. (Biểu hiện về năng lực số: #strong[Khai thác và
    xử lý dữ liệu], #strong[Sử dụng và quản lý các công cụ, ứng dụng
    số]).
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực thực hiện các nhiệm vụ học tập được giao,
  đặc biệt là các bài tập vận dụng và dự án nhỏ ngoài giờ học.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ cá nhân và đóng góp ý
  kiến xây dựng trong hoạt động nhóm.
- #strong[Trung thực:] Nghiêm túc, trung thực khi thực hiện các bài kiểm
  tra, đánh giá.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy tính/máy chiếu, bài giảng điện tử
  (PowerPoint/Slide), Phiếu học tập, máy tính cầm tay, phần mềm
  #strong[GeoGebra/Desmos] để minh họa đồ thị.
- #strong[Học sinh:] Sách giáo khoa Toán 10 (Kết nối tri thức), vở ghi,
  dụng cụ học tập, điện thoại thông minh/máy tính bảng (có cài đặt phần
  mềm GeoGebra/Desmos nếu có thể, phục vụ cho việc tích hợp năng lực
  số).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "15 phút")
#mt-hd[
  nghiên cứu về Hàm số thông qua một tình huống thực tiễn/gần gũi, từ đó
  xác định nhiệm vụ học tập.
]
#nd-hd[
  - #strong[GV] đặt câu hỏi/đưa ra tình huống thực tiễn: \"Một người đi
    xe máy với vận tốc không đổi là $40 upright(" km/h")$. Hỏi sau $t$
    giờ, quãng đường $S$ người đó đi được là bao nhiêu?\"
  - #strong[HS] thảo luận nhanh (cặp đôi/cá nhân) để tìm ra mối liên hệ
    giữa $S$ và $t$.
]
#sp-hd[
  được #strong[quãng đường] $S$ #strong[phụ thuộc vào thời gian] $t$.
]
#tc-hd[
  - #strong[Bước 1 (Giao nhiệm vụ):] GV chiếu/đặt câu hỏi tình huống
    thực tiễn.
  - #strong[Bước 2 (Thực hiện nhiệm vụ):] HS thảo luận, tìm mối liên hệ,
    viết công thức.
  - #strong[Bước 3 (Báo cáo, thảo luận):] GV mời 1-2 HS trình bày công
    thức và nhận xét về mối quan hệ giữa hai đại lượng.
  - #strong[Bước 4 (Kết luận, nhận định):] GV khái quát hóa: #strong[Mối
    quan hệ mà mỗi giá trị của đại lượng này xác định duy nhất một giá
    trị của đại lượng kia được gọi là Hàm số]. Từ đó, GV dẫn dắt vào bài
    học mới.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "120 phút")
#strong[Hoạt động thành phần 2.1: Khái niệm hàm số (40 phút)]

#mt-hd[
  giá trị, và cách tìm tập xác định của một hàm số.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] HS đọc SGK, thảo luận nhóm 4 để trả lời các câu
    hỏi: Hàm số là gì? Thế nào là tập xác định, tập giá trị?
  - #strong[Nhiệm vụ 2:] HS thực hiện #strong[Ví dụ 1] (cá nhân): Tìm
    tập xác định của hàm số $y = sqrt(2 x - 4) + frac(1, x - 3)$.
]
#sp-hd[
  - HS trình bày được định nghĩa Hàm số, Tập xác định, Tập giá trị.
  - HS tìm được Tập xác định của hàm số trong Ví dụ 1 là
    $\[2\;3\)union\(3\;+ oo\)$.
]
#tc-hd[
  - #strong[Bước 1 (Giao nhiệm vụ):] GV giao Nhiệm vụ 1 (thảo luận nhóm)
    và Nhiệm vụ 2 (làm bài tập).
  - #strong[Bước 2 (Thực hiện nhiệm vụ):] HS làm việc nhóm (Nhiệm vụ 1)
    và cá nhân (Nhiệm vụ 2); GV theo dõi, hỗ trợ, gợi ý cách thức tìm
    điều kiện xác định (tránh mẫu bằng 0, biểu thức trong căn
    $gt.eq 0$).
  - #strong[Bước 3 (Báo cáo, thảo luận):] Mời đại diện nhóm trình bày
    khái niệm. Mời HS lên bảng trình bày lời giải Ví dụ 1. GV nhận xét,
    chốt kiến thức.
  - #strong[Bước 4 (Kết luận, nhận định):] GV chuẩn hóa kiến thức về
    khái niệm Hàm số và các trường hợp cần tìm điều kiện xác định.

#strong[Hoạt động thành phần 2.2: Đồ thị của hàm số (40 phút)]

]
#mt-hd[
  số, biết cách vẽ đồ thị của một số hàm số cơ bản (tuyến tính, hằng số)
  và biết sử dụng công cụ số.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] HS đọc SGK, thảo luận cặp đôi: Định nghĩa Đồ
    thị của hàm số?
  - #strong[Nhiệm vụ 2 (Tích hợp Năng lực số):] #strong[GV] hướng dẫn HS
    sử dụng phần mềm #strong[GeoGebra] (hoặc Desmos) để vẽ đồ thị hàm số
    $y = 2 x - 1$ và $y = x^2$. #strong[HS] theo dõi, thực hành vẽ trên
    thiết bị (nếu có).
  - #strong[Ví dụ 2:] Cho hàm số $y = f\(x\)$ xác định trên $bb(R)$ bởi
    công thức: $f\(x\)= {x + 2 & upright("khi ") x gt.eq 0\
    - 2 x & upright("khi ") x < 0 med$. Yêu cầu HS vẽ đồ thị hàm số này
    trên giấy/bảng.
]
#sp-hd[
  - HS phát biểu được định nghĩa Đồ thị hàm số.
  - HS quan sát và nhận dạng được đồ thị các hàm số $y = 2 x - 1$ (đường
    thẳng), $y = x^2$ (parabol).
  - HS vẽ đúng đồ thị hàm số $y = f\(x\)$ trong Ví dụ 2 (gồm 2 nhánh
    đường thẳng).
]
#tc-hd[
  - #strong[Bước 1 (Giao nhiệm vụ):] GV giao Nhiệm vụ 1 và giới thiệu
    Nhiệm vụ 2 (thực hành công cụ số).
  - #strong[Bước 2 (Thực hiện nhiệm vụ):] HS tìm hiểu khái niệm (Nhiệm
    vụ 1). GV chiếu màn hình phần mềm GeoGebra và thao tác mẫu; HS thực
    hành theo (Nhiệm vụ 2 - #strong[Biểu hiện về năng lực số: Sử dụng và
    quản lý các công cụ, ứng dụng số]). HS làm Ví dụ 2 cá nhân.
  - #strong[Bước 3 (Báo cáo, thảo luận):] Mời 1 HS trình bày định nghĩa.
    Mời 1 HS lên bảng vẽ đồ thị Ví dụ 2.
  - #strong[Bước 4 (Kết luận, nhận định):] GV chốt lại Đồ thị hàm số là
    tập hợp các điểm $\(x\;f\(x\)\)$, nhấn mạnh vai trò của công nghệ
    trong việc khảo sát hàm số.

#strong[Hoạt động thành phần 2.3: Sự đồng biến, nghịch biến của hàm số
(40 phút)]

]
#mt-hd[
  nghịch biến của hàm số, nhận biết tính chất này qua đồ thị và áp dụng
  vào bài tập.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] HS đọc SGK và sử dụng kết quả vẽ đồ thị
    $y = x^2$ ở hoạt động 2.2, thảo luận nhóm 4 để định nghĩa: Hàm số
    đồng biến (tăng) và nghịch biến (giảm) trên một khoảng.
  - #strong[Nhiệm vụ 2 (Phân tích, tổng hợp):] Áp dụng định nghĩa để
    chứng minh tính đồng biến của hàm số $y = 3 x + 2$ trên $bb(R)$.
  - #strong[Ví dụ 3:] Cho hàm số có đồ thị đã được vẽ bằng GeoGebra
    (hoặc hình vẽ trong SGK). Yêu cầu HS xác định các khoảng đồng biến
    và nghịch biến của hàm số đó.
]
#sp-hd[
  - HS phát biểu được định nghĩa đồng biến, nghịch biến của hàm số (liên
    hệ giữa $x_1\,x_2$ và $f\(x_1\)\,f\(x_2\)$).
  - HS chứng minh được hàm số $y = 3 x + 2$ đồng biến trên $bb(R)$ bằng
    định nghĩa.
  - HS xác định đúng các khoảng đồng biến/nghịch biến qua đồ thị (Ví dụ
    3).
]
#tc-hd[
  - #strong[Bước 1 (Giao nhiệm vụ):] GV giao Nhiệm vụ 1 (định nghĩa) và
    Nhiệm vụ 2 (chứng minh).
  - #strong[Bước 2 (Thực hiện nhiệm vụ):] HS thảo luận nhóm, liên hệ
    định nghĩa với đồ thị $y = x^2$ đã vẽ. HS làm bài chứng minh. GV
    theo dõi, nhắc nhở về cách chọn $x_1 < x_2$.
  - #strong[Bước 3 (Báo cáo, thảo luận):] Mời đại diện nhóm trình bày
    định nghĩa. Mời 1 HS trình bày lời giải chứng minh. GV mời HS khác
    nhận xét.
  - #strong[Bước 4 (Kết luận, nhận định):] GV chuẩn hóa kiến thức, nhấn
    mạnh phương pháp chứng minh đồng biến/nghịch biến bằng định nghĩa.

]
#hd("3", "Luyện tập", "45 phút")
#mt-hd[
  bài tập cơ bản: tìm tập xác định, vẽ đồ thị, xét tính đồng biến/nghịch
  biến, tăng cường kĩ năng giao tiếp, phân tích.
]
#nd-hd[
  vui):]
  - #strong[Bài 1 (Tìm TXĐ):] Tìm tập xác định của
    $y = frac(x, x^2 - 4)$.
  - #strong[Bài 2 (Đồ thị):] Điểm nào sau đây thuộc đồ thị hàm số
    $y = 1 / 2 x - 3$: A. $\(0\;- 3\)$, B. $\(2\;- 1\)$, C.
    $\(- 2\;- 4\)$.
  - #strong[Bài 3 (Đồng biến/Nghịch biến):] Chứng minh tính nghịch biến
    của hàm số $y = 2 / x$ trên $\(0\;+ oo\)$.
  - #strong[Bài 4 (Sơ đồ tư duy):] #strong[HS] làm việc nhóm (4-6 HS),
    tổng hợp toàn bộ kiến thức về \"Hàm số\" (khái niệm, đồ thị, đồng
    biến/nghịch biến) thành một #strong[Sơ đồ tư duy] trên giấy A0 hoặc
    phần mềm số (MindMap online).
// ]
#sp-hd[
  - Đáp án, lời giải chính xác cho các bài tập 1, 2, 3.
  - #strong[Sơ đồ tư duy] logic, trực quan, đầy đủ nội dung kiến thức
    của bài học.
]
#tc-hd[
  - #strong[Bước 1 (Giao nhiệm vụ):] GV giao Bài tập 1, 2, 3 (luyện tập
    nhanh/trò chơi). Sau đó giao Bài tập 4 (Sơ đồ tư duy).
  - #strong[Bước 2 (Thực hiện nhiệm vụ):] HS thực hiện Bài tập 1, 2, 3
    cá nhân. HS làm việc nhóm để vẽ/thiết kế Sơ đồ tư duy (khuyến khích
    sử dụng phần mềm số để tăng tính thẩm mỹ và dễ chia sẻ).
  - #strong[Bước 3 (Báo cáo, thảo luận):] GV chữa nhanh Bài 1, 2, 3. Mời
    1-2 nhóm trình bày (thuyết trình) Sơ đồ tư duy của nhóm mình, giải
    thích sự liên kết giữa các nhánh kiến thức.
  - #strong[Bước 4 (Kết luận, nhận định):] GV nhận xét, đánh giá sản
    phẩm Sơ đồ tư duy (đặc biệt là khả năng #strong[phân tích và tổng
    hợp thông tin] của HS), chuẩn hóa lại cấu trúc kiến thức.

]
#hd("4", "Vận dụng", "15 phút - Giao nhiệm vụ về nhà")
#mt-hd[
  được vai trò của hàm số trong thực tiễn.
]
#nd-hd[
  - #strong[Nhiệm vụ Vận dụng:] #strong[Đề xuất và giải quyết vấn đề
    thực tiễn.] HS làm việc nhóm (hoặc cá nhân) để tìm kiếm một tình
    huống thực tế có thể mô hình hóa bằng hàm số (ví dụ: mô hình hóa giá
    cước taxi theo quãng đường đi, lợi nhuận bán hàng theo số lượng sản
    phẩm...).
]
#sp-hd[
  - Báo cáo (viết tay hoặc trình bày bằng Slide) về việc #strong[phát
    hiện và giải quyết tình huống/vấn đề trong thực tiễn] (nêu rõ: Đại
    lượng biến thiên, Hàm số mô hình hóa, Tập xác định, và giải thích ý
    nghĩa của sự đồng biến/nghịch biến nếu có).
]
#tc-hd[
  - GV giao nhiệm vụ Vận dụng, hướng dẫn HS về cách thức tìm kiếm và
    trình bày báo cáo.
  - GV nhấn mạnh HS thực hiện ngoài giờ học trên lớp. Báo cáo sẽ được
    nộp/trình bày (trao đổi, chia sẻ và đánh giá) ở tiết học tiếp theo
    hoặc vào một thời điểm thích hợp.

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
