// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 27 Thực hành tính XS",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nhận biết và giải thích được công thức tính xác suất theo định nghĩa
  cổ điển.
- Vận dụng được công thức và các quy tắc đếm (quy tắc cộng, quy tắc
  nhân, hoán vị, chỉnh hợp, tổ hợp) để tính xác suất của biến cố trong
  các bài toán thực tế đơn giản.
- Trình bày được cách tính xác suất bằng sơ đồ hình cây (đặc biệt trong
  các phép thử nhiều bước).
- Hiểu và vận dụng được công thức tính xác suất của biến cố đối để giải
  quyết bài toán tính xác suất trực tiếp khó hơn.

#muc("2", "NĂNG LỰC")
#strong[Năng lực chung:]

- #strong[Năng lực tự chủ và tự học:] Chủ động hoàn thành nhiệm vụ được
  giao; tự tìm kiếm, đọc và xử lý thông tin từ sách giáo khoa và học
  liệu.
- #strong[Năng lực giao tiếp và hợp tác:] Tham gia thảo luận nhóm hiệu
  quả, lắng nghe và phản hồi ý kiến bạn bè; trình bày, bảo vệ ý kiến của
  bản thân.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình huống,
  lựa chọn phương pháp tính xác suất tối ưu (sử dụng công thức tổ hợp,
  sơ đồ hình cây, hay biến cố đối).

#strong[Năng lực đặc thù:]

- #strong[Năng lực tư duy và lập luận toán học:] Phân tích được các khả
  năng xảy ra của phép thử, xác định đúng không gian mẫu ($Omega$) và
  biến cố ($A$), lập luận logic khi tính $\|A\|$ và $\|Omega\|$.
- #strong[Năng lực mô hình hóa toán học:] Thiết lập được mô hình toán
  học (sử dụng công thức tổ hợp, sơ đồ) cho các bài toán xác suất thực
  tế.
- #strong[Năng lực giao tiếp toán học:] Trình bày rõ ràng, chính xác lời
  giải một bài toán xác suất.

#strong[Năng lực số (Tích hợp theo Thông tư 02/2025/TT-BGDĐT):]

- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.
- 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
  dạng khác nhau,
- 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc tạo
  ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập cá nhân và
  nhóm, hoàn thành các nhiệm vụ được giao.
- #strong[Trung thực:] Thẳng thắn, khách quan trong việc báo cáo kết quả
  thực hiện nhiệm vụ và tự đánh giá, đánh giá bạn bè.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong nhóm, đóng góp ý kiến
  xây dựng bài học; có trách nhiệm vận dụng kiến thức đã học vào giải
  quyết các vấn đề thực tiễn.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:]
  - Máy chiếu, máy tính, bảng phụ.
  - Phiếu học tập (cho Hoạt động 1 và Hoạt động 3), các công cụ hỗ trợ
    trình bày (bút màu, giấy A0/A4).
  - Một số đồ dùng minh họa cho phép thử: đồng xu, con xúc xắc, bộ bài,
    các thẻ số (dùng trong Hoạt động 1).
  - Slide bài giảng có tích hợp các công cụ số (Kahoot/Quizizz cho phần
    Luyện tập, video mô phỏng nếu có).
- #strong[Học sinh:]
  - Sách giáo khoa Toán 10, vở ghi.
  - Máy tính cầm tay (có chức năng tính tổ hợp, chỉnh hợp).
  - Điện thoại thông minh/máy tính bảng (có kết nối mạng) để truy cập và
    sử dụng các công cụ số (Mindmap online, các công cụ kiểm tra trắc
    nghiệm online) khi cần.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "Khởi động")
#mt-hd[
  gian mẫu, biến cố, công thức tính xác suất theo định nghĩa cổ điển đã
  học ở bài trước. Tạo hứng thú và kết nối kiến thức cũ với kiến thức
  mới, xác định rõ nhiệm vụ cần giải quyết (vận dụng công thức trong các
  bài toán phức tạp hơn).
]
#nd-hd[
  - #strong[Nhiệm vụ:] Giáo viên đưa ra một tình huống thực tế đơn giản
    đã biết công thức, yêu cầu học sinh tính xác suất.
  - #strong[Tình huống:] Gieo ngẫu nhiên một con xúc xắc cân đối, đồng
    chất. Tính xác suất của biến cố $A$: \"Số chấm xuất hiện trên mặt
    xúc xắc là số chẵn\".
]
#sp-hd[
  - Lời giải đúng: $\|Omega\|= 6$, $\|A\|= 3$ (là 2, 4, 6). Xác suất
    $P\(A\)= frac(\|A\|, \|Omega\|) = 3 / 6 = 1 / 2$.
  - Học sinh nêu lại được công thức $P\(A\)= frac(\|A\|, \|Omega\|)$ và
    giải thích ý nghĩa của $\|A\|$, $\|Omega\|$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] Giáo viên trình bày tình huống (có
    thể kèm hình ảnh) và yêu cầu cá nhân học sinh thực hiện tính toán.
  - #strong[Thực hiện nhiệm vụ (học sinh thực hiện; giáo viên theo dõi,
    hỗ trợ):] Học sinh làm việc cá nhân (dự kiến khó khăn: xác định sai
    $\|Omega\|$ hoặc $\|A\|$). Giáo viên hỗ trợ, gợi ý học sinh liệt kê
    đầy đủ các kết quả có thể xảy ra.
  - #strong[Báo cáo, thảo luận (giáo viên tổ chức, điều hành; học sinh
    báo cáo, thảo luận):] Giáo viên gọi 1-2 học sinh trình bày nhanh kết
    quả và giải thích.
  - #strong[Kết luận, nhận định:] Giáo viên chốt lại công thức định
    nghĩa cổ điển, dẫn dắt vào bài học mới: \"Để tính $\|A\|$ và
    $\|Omega\|$ trong các bài toán phức tạp hơn, chúng ta cần sử dụng
    các công cụ đếm đã học như tổ hợp, sơ đồ hình cây, và có thể sử dụng
    phương pháp biến cố đối.\"

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "Khám phá và Chiếm lĩnh tri thức")
===== Hoạt động 2.1: Sử dụng phương pháp tổ hợp
#mt-hd[
  vị, chỉnh hợp, tổ hợp) để tính số phần tử của không gian mẫu và biến
  cố trong các bài toán chọn mẫu ngẫu nhiên.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Hoạt động nhóm. Học sinh thảo luận và giải quyết
    #strong[Ví dụ 1].
  - #strong[Ví dụ 1:] Một hộp đựng 5 viên bi đỏ và 3 viên bi xanh (tổng
    cộng 8 viên bi). Lấy ngẫu nhiên đồng thời 4 viên bi từ hộp. Tính xác
    suất để lấy được #strong[2 viên bi đỏ và 2 viên bi xanh].
]
#sp-hd[
  - Không gian mẫu $\|Omega\|$: Số cách chọn 4 viên bi từ 8 viên
    $arrow.r\|Omega\|= C_8^4 = 70$.
  - Biến cố $A$: Chọn 2 đỏ (từ 5) và 2 xanh (từ 3)
    $arrow.r\|A\|= C_5^2 dot.op C_3^2 = 10 dot.op 3 = 30$.
  - Xác suất $P\(A\)= 30 / 70 = 3 / 7$.
  - Học sinh hoàn thành bài giải trên Phiếu học tập hoặc trên giấy A4.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] Giáo viên chia lớp thành các nhóm
    nhỏ (4-5 HS) và giao Ví dụ 1. Yêu cầu nhóm thảo luận, phân tích đề
    bài, xác định $\|Omega\|$ và $\|A\|$ bằng công thức tổ hợp.
  - #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm, ghi chép và
    tính toán. Giáo viên theo dõi, nhắc nhở các nhóm xác định rõ \"chọn
    không thứ tự\" để dùng $C_n^k$.
  - #strong[Báo cáo, thảo luận:] Giáo viên chọn 1 nhóm báo cáo nhanh kết
    quả. Các nhóm khác nhận xét, bổ sung.
  - #strong[Kết luận, nhận định:] Giáo viên chuẩn hóa lời giải, nhấn
    mạnh: Phương pháp tổ hợp là công cụ hiệu quả nhất khi phép thử là
    #strong[chọn ngẫu nhiên không thứ tự].

===== Hoạt động 2.2: Sử dụng sơ đồ hình cây
]
#mt-hd[
  hình cây để tính xác suất cho các phép thử #strong[thực hiện qua nhiều
  giai đoạn] (thường là có thứ tự hoặc có hoàn lại/không hoàn lại).
]
#nd-hd[
  - #strong[Nhiệm vụ:] Hoạt động cá nhân/cặp đôi. Giải quyết #strong[Ví
    dụ 2].
  - #strong[Ví dụ 2:] Gieo một đồng xu cân đối, đồng chất #strong[hai
    lần liên tiếp]. Tính xác suất của biến cố $B$: \"Kết quả hai lần
    gieo là khác nhau\".
]
#sp-hd[
  - Sơ đồ hình cây thể hiện 4 kết quả có thể xảy ra (S-S, S-N, N-S,
    N-N).
  - Không gian mẫu $\|Omega\|= 4$.
  - Biến cố $B = {\(S\,N\)\,\(N\,S\)} arrow.r\|B\|= 2$.
  - Xác suất $P\(B\)= 2 / 4 = 1 / 2$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] Giáo viên yêu cầu học sinh tự vẽ sơ
    đồ hình cây cho phép thử này, sau đó dùng sơ đồ để xác định
    $\|Omega\|$, $\|B\|$ và tính $P\(B\)$.
  - #strong[Thực hiện nhiệm vụ:] Học sinh thực hiện vẽ và tính toán.
  - #strong[Báo cáo, thảo luận:] Giáo viên gọi 1 học sinh lên bảng trình
    bày sơ đồ hình cây và lời giải.
  - #strong[Kết luận, nhận định:] Giáo viên nhấn mạnh #strong[sơ đồ hình
    cây] giúp hình dung trực quan và liệt kê đầy đủ các trường hợp của
    phép thử nhiều bước (nếu số trường hợp không quá lớn).
  - #strong[Tích hợp năng lực số:]
    - #strong[Biểu hiện:] Học sinh được khuyến khích sử dụng công cụ
      Mindmap online (ví dụ: EdrawMind, Canva) để vẽ sơ đồ hình cây trên
      máy tính/điện thoại và gửi sản phẩm qua nhóm lớp (nếu điều kiện
      cho phép).

===== Hoạt động 2.3: Xác suất của biến cố đối
]
#mt-hd[
  xác suất của biến cố đối $P\(A\)= 1 - P\(macron(A)\)$ để tính xác suất
  trong những trường hợp biến cố $A$ có số phần tử lớn, còn biến cố đối
  $macron(A)$ có số phần tử nhỏ, giúp việc tính toán đơn giản hơn.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Hoạt động nhóm. Giải quyết #strong[Ví dụ 3].
  - #strong[Ví dụ 3:] Một lớp có 20 học sinh, trong đó có 12 nam và 8
    nữ. Chọn ngẫu nhiên 3 học sinh để tham gia đội văn nghệ. Tính xác
    suất để #strong[có ít nhất một học sinh nam] trong 3 học sinh được
    chọn.
]
#sp-hd[
  - Không gian mẫu: $\|Omega\|= C_20^3 = 1140$.
  - Biến cố $A$: \"Có ít nhất một học sinh nam\".
  - Biến cố đối $macron(A)$: \"Không có học sinh nam nào\"
    $arrow.l.r.double$ \"Cả 3 học sinh được chọn đều là nữ\".
  - Số phần tử của $macron(A)$: $\|macron(A)\|= C_8^3 = 56$.
  - $P\(macron(A)\)= 56 / 1140 = 14 / 285$.
  - $P\(A\)= 1 - P\(macron(A)\)= 1 - 14 / 285 = 271 / 285$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] Giáo viên giao Ví dụ 3, gợi ý học
    sinh nên dùng phương pháp biến cố đối vì từ khóa \"ít nhất một\".
  - #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm, xác định biến
    cố đối $macron(A)$ và tiến hành tính toán.
  - #strong[Báo cáo, thảo luận:] Mời một nhóm trình bày lời giải, nhấn
    mạnh bước chuyển từ biến cố $A$ sang $macron(A)$.
  - #strong[Kết luận, nhận định:] Giáo viên tổng kết về việc sử dụng
    biến cố đối trong các bài toán có từ khóa \"ít nhất\", \"không
    quá\", \"không... nào\".

==== 3. Hoạt động 3: Luyện tập
]
#mt-hd[
  định nghĩa cổ điển bằng cách áp dụng linh hoạt cả ba phương pháp (tổ
  hợp, sơ đồ hình cây, biến cố đối) thông qua các bài tập đa dạng.
]
#nd-hd[
  luận.
  - #strong[Nhiệm vụ 1 (Trắc nghiệm nhanh - Cá nhân):] 3 câu hỏi trắc
    nghiệm kiểm tra kiến thức cơ bản và khả năng nhận dạng phương pháp
    (tổ hợp, biến cố đối).
  - #strong[Nhiệm vụ 2 (Thực hành - Nhóm):] Giải quyết một bài tập tự
    luận tổng hợp:
    - #emph[Bài tập:] Gieo hai con xúc xắc cân đối, đồng chất. Tính xác
      suất để:
      - a) Tổng số chấm xuất hiện trên hai mặt là 7.
      - b) Tích số chấm xuất hiện trên hai mặt là số lẻ.
      - c) Số chấm xuất hiện trên con thứ nhất lớn hơn số chấm xuất hiện
        trên con thứ hai.
]
#sp-hd[
  - Đáp án đúng của 3 câu trắc nghiệm.
  - Lời giải chi tiết và chính xác của Bài tập tự luận. (Kết quả: a)
    $P\(A\)= 6 / 36 = 1 / 6$\; b) $P\(B\)= 9 / 36 = 1 / 4$\; c)
    $P\(C\)= 15 / 36 = 5 / 12$)
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] Giáo viên sử dụng hệ thống trắc
    nghiệm online (Kahoot! hoặc Quizizz) cho Nhiệm vụ 1. Học sinh dùng
    điện thoại/máy tính để tham gia. Sau đó, giao Nhiệm vụ 2 (Bài tập tự
    luận) cho các nhóm.
  - #strong[Thực hiện nhiệm vụ:]
    - Nhiệm vụ 1: Cá nhân học sinh trả lời nhanh trên công cụ số (tích
      hợp năng lực số).
    - Nhiệm vụ 2: Nhóm làm việc, phân công nhau giải quyết các ý a, b, c
      và chuẩn bị trình bày.
  - #strong[Báo cáo, thảo luận:] Giáo viên mời 1 nhóm lên trình bày lời
    giải của Nhiệm vụ 2. Các nhóm khác phản biện, bổ sung.
  - #strong[Kết luận, nhận định:] Giáo viên chữa bài, phân tích các lỗi
    sai thường gặp và chốt lại các kĩ năng cần thiết (liệt kê cho sơ đồ
    hình cây, công thức tổ hợp, dấu hiệu dùng biến cố đối).

==== 4. Hoạt động 4: Vận dụng
]
#mt-hd[
  tính xác suất vào giải quyết các vấn đề thực tiễn, củng cố sự hứng thú
  với Toán học.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Tìm kiếm và giải quyết một vấn đề thực tiễn có sử
    dụng công cụ tính xác suất.
  - #strong[Yêu cầu:] Học sinh tự tìm kiếm một tình huống thực tế (ví
    dụ: xác suất trúng giải xổ số; xác suất khi chơi một trò chơi dân
    gian/board game; xác suất gặp được 2 người có cùng ngày sinh trong
    nhóm 5 người;...)
  - Mô tả rõ vấn đề $arrow.r$ Xác định Phép thử, $Omega$, Biến cố $A$
    $arrow.r$ Áp dụng công thức tính $P\(A\)$ $arrow.r$ Phân tích ý
    nghĩa kết quả.
]
#sp-hd[
  - Bài trình chiếu (slide Powerpoint/Canva) hoặc
  - Video ngắn, hoặc
  - Sơ đồ tư duy (Mindmap) trình bày quá trình giải quyết vấn đề.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên giao nhiệm vụ thực hiện
    #strong[ngoài giờ học trên lớp] theo nhóm (hoặc cá nhân) và nộp sản
    phẩm sau 1 tuần.
  - #strong[Thực hiện nhiệm vụ (Tự học có hướng dẫn):] Học sinh thực
    hiện tại nhà, tìm kiếm thông tin, vận dụng kiến thức, sử dụng công
    cụ số để tạo báo cáo. Giáo viên theo dõi, giải đáp thắc mắc qua các
    kênh giao tiếp online (nếu cần).
  - #strong[Báo cáo, đánh giá:] Giáo viên dành thời gian phù hợp (tiết
    học sau, hoặc buổi ngoại khóa) để các nhóm/cá nhân trình bày, trao
    đổi, chia sẻ và đánh giá sản phẩm.
  - #strong[Tích hợp năng lực số:]
    - #strong[Biểu hiện:] Học sinh sử dụng công cụ tìm kiếm, xử lý thông
      tin số, và sử dụng các phần mềm trình chiếu (PowerPoint, Canva,
      Google Slide) để tạo ra sản phẩm báo cáo đa phương tiện.

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
