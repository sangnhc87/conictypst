// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "HĐTHTN 4 Tính NG và TP bằng Geogebra",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Học sinh biết cách sử dụng phần mềm GeoGebra để tính nguyên hàm và
  tính giá trị tích phân xác định.
- Học sinh hiểu và vận dụng được công thức tính gần đúng tích phân bằng
  phương pháp hình thang.
- Học sinh biết cách sử dụng các công cụ số để thực hiện việc tính gần
  đúng tích phân bằng phương pháp hình thang.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, khám phá cách
    sử dụng các lệnh của GeoGebra và công thức hình thang; tự đánh giá
    được kết quả thực hiện nhiệm vụ.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm để
    giải quyết vấn đề, chia sẻ cách làm và kết quả tính toán trên phần
    mềm.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Đề xuất được giải
    pháp sử dụng công cụ số (GeoGebra) để giải quyết bài toán tính toán
    trong Toán học.
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận Toán học:] Phân tích, so sánh
    được kết quả tính tích phân bằng công thức chính xác và bằng phương
    pháp gần đúng (hình thang).
  - #strong[Năng lực mô hình hóa Toán học:] Mô tả được quy trình tính
    gần đúng tích phân bằng phương pháp hình thang trên công cụ số.
  - #strong[Năng lực công cụ và phương tiện học Toán:] Sử dụng thành
    thạo phần mềm GeoGebra và các thiết bị số để thực hiện các phép
    tính.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, nghiêm túc thực hiện các nhiệm vụ thực
  hành và khám phá các lệnh của GeoGebra.
- #strong[Trung thực:] Thẳng thắn trao đổi, báo cáo kết quả thực hành
  chính xác, trung thực.
- #strong[Trách nhiệm:] Hoàn thành các nhiệm vụ được giao trong nhóm,
  đảm bảo nộp sản phẩm đúng thời hạn.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Phòng máy tính hoặc máy tính cá nhân/máy
  tính bảng có kết nối mạng, máy chiếu, bảng phụ.
- #strong[Học liệu:]
  - Phần mềm GeoGebra (Classic 6 hoặc các phiên bản khác phù hợp).
  - Tài liệu hướng dẫn cơ bản về các lệnh tính Nguyên hàm
    (`Integral(f)`) và Tích phân (`Integral(``f, a, b)`) trong GeoGebra.
  - Phiếu bài tập thực hành (in sẵn hoặc file điện tử).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "5 phút")
#emph[\(Gợi mở về công cụ số trong giải quyết bài toán Toán học)]

#mt-hd[
Giúp học sinh nhận ra tầm quan trọng của công cụ
  số (GeoGebra) trong việc giải nhanh và kiểm tra kết quả tính nguyên
  hàm/tích phân; xác định nhiệm vụ cần đạt.
]
#nd-hd[
  - #strong[GV] đặt vấn đề: Trong thực tế, việc tính nguyên hàm hay tích
    phân đôi khi phức tạp và tốn thời gian. Có công cụ nào giúp ta tính
    nhanh và kiểm tra kết quả?
  - #strong[HS] trả lời, thảo luận ngắn.
  - #strong[GV] chiếu một ví dụ tính tích phân phức tạp và hỏi: \"Làm
    thế nào để tính nhanh giá trị gần đúng của tích phân
    $integral_1^3 sqrt(x^3 + 1) d x$?\" (Đây là tích phân không thể tính
    bằng công thức Sơ cấp)
]
#sp-hd[
  - Sản phẩm: Nhận thức về lợi ích của công cụ số, đề xuất sử dụng phần
    mềm hỗ trợ tính toán.
  - Dự kiến: Học sinh nêu được khó khăn khi tính tích phân phức tạp và
    đề xuất sử dụng máy tính bỏ túi/phần mềm.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình bày tình huống, yêu
    cầu HS suy nghĩ (1 phút).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS suy nghĩ cá nhân.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 HS trình bày ý kiến.
  - #strong[Bước 4: Kết luận, nhận định:] GV kết luận và dẫn dắt vào bài
    học: Bài học này sẽ giúp các em sử dụng GeoGebra để giải quyết các
    vấn đề này và tìm hiểu phương pháp tính gần đúng tích phân.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "28 phút")
#emph[\(Sử dụng GeoGebra và Phương pháp hình thang)]

==== 2.1. Hoạt động thành phần: Tính nguyên hàm và tích phân với phần mềm GeoGebra (14 phút)
#emph[\(Phát triển Năng lực số - NL1, NL2)]

#mt-hd[
HS biết cách sử dụng các lệnh cơ bản của
  GeoGebra để tính và hiển thị nguyên hàm, tích phân.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] Khám phá lệnh tính Nguyên hàm.
    - #strong[GV] yêu cầu #strong[HS] làm việc nhóm (2-3 người), mở
      GeoGebra.
    - #strong[GV] giao: #strong[Ví dụ 1:] Tính nguyên hàm của hàm số
      $f\(x\)= x^3 - 4 x^2 + 5$ bằng GeoGebra.
    - #strong[HS] tự tìm kiếm lệnh hoặc tham khảo tài liệu hướng dẫn
      nhanh về lệnh `Integral(f)`.
  - #strong[Nhiệm vụ 2:] Khám phá lệnh tính Tích phân.
    - #strong[GV] giao: #strong[Ví dụ 2:] Tính và mô tả hình học tích
      phân xác định $I = integral_(- 1)^2\(x^2 + 1\)d x$ bằng GeoGebra.
    - #strong[HS] tìm kiếm lệnh `Integral(``f, a, b)` và thực hiện.
]
#sp-hd[
  - Nguyên hàm: $F\(x\)= x^4 / 4 - frac(4 x^3, 3) + 5 x + C$.
  - Tích phân: $I approx 6.0$.
  - Hình ảnh minh họa miền diện tích tích phân trên GeoGebra.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giao #strong[Ví dụ 1] và
    #strong[Ví dụ 2] cho các nhóm, yêu cầu HS dùng GeoGebra.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS tự tìm tòi, thực hiện trên
    máy tính, #strong[GV] quan sát, hỗ trợ (dự kiến khó khăn: nhập lệnh
    sai cú pháp. Biện pháp hỗ trợ: gợi ý cấu trúc lệnh `Integral`).
    #strong[Tích hợp NL số:] #strong[HS] sử dụng công cụ số để thu thập
    kết quả tính toán (#strong[Biểu hiện NL số: NL1. Khai thác, sử dụng
    thông tin và dữ liệu số]).
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời đại diện 2 nhóm báo cáo
    kết quả và thao tác trên GeoGebra (chiếu màn hình).
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa quy trình sử dụng
    các lệnh `Integral` và nhấn mạnh về tính trực quan của tích phân
    trên GeoGebra.

==== 2.2. Hoạt động thành phần: Tính gần đúng tích phân bằng phương pháp hình thang (14 phút)
#emph[\(Phát triển Năng lực tư duy và lập luận Toán học, Năng lực số -
NL1)]

]
#mt-hd[
HS hiểu ý tưởng và vận dụng được công thức tính
  gần đúng tích phân bằng phương pháp hình thang.
]
#nd-hd[
  - #strong[Nhiệm vụ 3:] Nắm vững công thức hình thang.
    - #strong[GV] trình bày công thức hình thang tổng quát:
      $I approx frac(b - a, 2 n)\[f\(x_0\)+ 2 f\(x_1\)+ . . . + 2 f\(x_(n - 1)\)+ f\(x_n\)\]$.
    - #strong[HS] ghi nhận công thức.
  - #strong[Nhiệm vụ 4:] Vận dụng công thức hình thang.
    - #strong[GV] giao: #strong[Ví dụ 3:] Tính gần đúng tích phân
      $J = integral_0^1 x^2 d x$ bằng phương pháp hình thang với $n = 4$
      (Chia đoạn $\[0\,1\]$ thành 4 đoạn nhỏ).
    - #strong[HS] làm việc nhóm, thực hiện tính toán thủ công theo công
      thức, sau đó #strong[so sánh] với kết quả tính chính xác bằng
      GeoGebra (kết quả chính xác là $1\/3 approx 0.3333$).
]
#sp-hd[
  - Kết quả tính gần đúng:
    $J approx frac(1 - 0, 2 dot.op 4)\[f\(0\)+ 2 f\(0.25\)+ 2 f\(0.5\)+ 2 f\(0.75\)+ f\(1\)\]approx 0.34375$.
  - Nhận xét về độ sai lệch so với kết quả chính xác.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV nêu công thức và giao #strong[Ví
    dụ 3].
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thực hiện tính toán trong
    nhóm, sử dụng công cụ tính toán cá nhân (máy tính cầm tay) để tính
    giá trị hàm số tại các điểm. #strong[GV] theo dõi, gợi ý cách lập
    bảng giá trị. #strong[Tích hợp NL số:] #strong[HS] sử dụng máy tính
    cầm tay để tính toán giá trị hàm số và áp dụng công thức
    (#strong[Biểu hiện NL số: NL1. Khai thác, sử dụng thông tin và dữ
    liệu số]).
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời một nhóm trình bày chi tiết
    các bước tính và kết quả. Các nhóm khác nhận xét.
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt lại công thức, nhận
    xét về độ chính xác (càng chia nhỏ $n$ thì càng chính xác) và dẫn
    đến hoạt động tiếp theo.

]
#hd("3", "Luyện tập", "7 phút")
#emph[\(Thực hành tổng hợp và so sánh)]

#mt-hd[
HS vận dụng kiến thức và kĩ năng sử dụng
  GeoGebra và phương pháp hình thang để giải quyết một bài toán tổng
  hợp, củng cố kĩ năng so sánh, phân tích kết quả.
]
#nd-hd[
  - #strong[Nhiệm vụ:] #strong[Ví dụ 4:] Cho tích phân
    $K = integral_0^2\(e^x\)d x$.
    - #strong[Yêu cầu 1:] Tính giá trị tích phân $K$ bằng GeoGebra.
    - #strong[Yêu cầu 2:] Tính gần đúng tích phân $K$ bằng phương pháp
      hình thang với $n = 4$.
    - #strong[Yêu cầu 3:] So sánh kết quả của Yêu cầu 1 và Yêu cầu 2.
]
#sp-hd[
  - Kết quả GeoGebra: $K approx 6.389$.
  - Kết quả hình thang: $K approx 6.42$. (Giá trị tính gần đúng)
  - Nhận xét: Giá trị gần đúng lớn hơn giá trị chính xác (hoặc nhận xét
    về sai số).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giao #strong[Ví dụ 4] cho các
    nhóm thực hiện.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc nhóm để thực hiện
    cả hai cách tính và so sánh.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời một nhóm trình bày toàn
    bộ kết quả, khuyến khích các nhóm khác đặt câu hỏi và phản biện.
    #strong[Tích hợp NL số:] #strong[HS] sử dụng GeoGebra và các công cụ
    khác để tính toán, trao đổi kết quả trong nhóm (#strong[Biểu hiện NL
    số: NL2. Giao tiếp và hợp tác trong môi trường số]).
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, đánh giá kết quả
    của các nhóm, nhấn mạnh lại lợi ích của việc sử dụng công cụ số.

]
#hd("4", "Vận dụng", "5 phút")
#emph[\(Giao nhiệm vụ về nhà - Phát triển Năng lực số - NL1, NL2)]

#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  vào thực tiễn thông qua việc sử dụng công cụ số để tìm hiểu sâu hơn.
]
#nd-hd[
  - #strong[Nhiệm vụ:] #strong[Tìm hiểu về các phương pháp tính gần đúng
    khác.]
    - Sử dụng GeoGebra hoặc công cụ số khác để tìm hiểu và mô tả quy
      trình tính gần đúng tích phân bằng #strong[phương pháp hình chữ
      nhật] hoặc #strong[phương pháp Simpson] (nếu có thể).
    - Áp dụng phương pháp tìm hiểu được để tính gần đúng tích phân
      $L = integral_0^1 sin\(x^2\)d x$ với $n = 4$.
]
#sp-hd[
  - Báo cáo: File báo cáo (Word, PDF) hoặc Sơ đồ tư duy (trình bày trên
    phần mềm) mô tả phương pháp tìm hiểu được và kết quả tính gần đúng.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giao nhiệm vụ tìm hiểu và yêu cầu
    #strong[HS] nộp báo cáo vào tiết học sau.
  - #strong[Bước 2: Tổ chức thực hiện:] HS thực hiện ngoài giờ học trên
    lớp. #strong[Tích hợp NL số:] #strong[HS] sử dụng công cụ tìm kiếm
    và trình bày sản phẩm bằng file số (#strong[Biểu hiện NL số: NL1.
    Khai thác, sử dụng thông tin và dữ liệu số; NL2. Giao tiếp và hợp
    tác trong môi trường số]).
  - #strong[Bước 3: Đánh giá:] GV thu thập và đánh giá báo cáo vào buổi
    học tiếp theo.

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
