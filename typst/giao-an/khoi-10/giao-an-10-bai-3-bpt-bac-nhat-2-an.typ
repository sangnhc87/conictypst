// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 3 BPT bậc nhất 2 ẩn",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[bất phương trình bậc nhất hai ẩn] và
  #strong[miền nghiệm] của nó.
- Mô tả được #strong[miền nghiệm] của bất phương trình bậc nhất hai ẩn
  trên mặt phẳng tọa độ $O x y$.
- Giải được bài toán tìm bất phương trình bậc nhất hai ẩn có miền nghiệm
  cho trước.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu khái niệm và
    cách biểu diễn miền nghiệm của bất phương trình bậc nhất hai ẩn
    thông qua sách giáo khoa và các học liệu số (ví dụ: video, phần mềm
    đồ họa).
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày, bảo vệ ý kiến của mình và lắng nghe, phản biện ý kiến của
    bạn bè.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống thực tiễn để thiết lập mô hình bất phương trình bậc nhất hai
    ẩn và tìm ra giải pháp tối ưu.
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận toán học:] Nhận biết và chứng
    minh được một điểm có thuộc miền nghiệm của bất phương trình hay
    không.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các bài toán
    thực tế (ví dụ: bài toán tối ưu hóa) bằng hệ bất phương trình bậc
    nhất hai ẩn.
  - #strong[Năng lực sử dụng công cụ, phương tiện toán học:] Sử dụng máy
    tính cầm tay, phần mềm đồ họa (ví dụ: GeoGebra, Desmos) để kiểm tra,
    biểu diễn miền nghiệm một cách chính xác.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - #strong[Giải quyết vấn đề và sáng tạo với công nghệ số:] Sử dụng
    phần mềm đồ họa (GeoGebra/Desmos) để biểu diễn nhanh miền nghiệm của
    bất phương trình, so sánh với kết quả thủ công, từ đó rút ra nhận
    xét và củng cố kiến thức.
  - Học sinh sử dụng công cụ số để #strong[phân tích và tổng hợp thông
    tin] (sơ đồ tư duy) và #strong[giải quyết vấn đề] (GeoGebra/Desmos
    tìm lời giải tối ưu)

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực hoàn thành các nhiệm vụ cá nhân và nhóm,
  kiên trì tìm tòi lời giải, không ngại khó khăn khi làm việc với các
  bài toán vận dụng thực tiễn.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ được giao, đóng góp
  xây dựng bài học chung của cả nhóm.
- #strong[Trung thực:] Thể hiện sự trung thực trong quá trình tính toán
  và báo cáo kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:]
  - Máy chiếu, màn chiếu, máy tính/laptop của giáo viên.
  - Các thiết bị số cá nhân của học sinh (điện thoại thông minh/máy tính
    bảng/laptop - nếu điều kiện cho phép) có cài đặt phần mềm
    #strong[GeoGebra] hoặc truy cập trang web #strong[Desmos].
  - Phiếu học tập (bản in hoặc bản số).
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Tài liệu tham khảo mở rộng (video hướng dẫn, bài tập tương tác trên
    web).
  - Giấy A0/A3, bút dạ, bảng phụ cho hoạt động nhóm.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
  một vấn đề thực tiễn liên quan đến việc tối ưu hóa và dẫn đến việc
  phải thiết lập, giải quyết bất phương trình bậc nhất hai ẩn.
]
#nd-hd[
  luận cặp đôi):
  - #strong[Tình huống:] Một cửa hàng muốn sản xuất hai loại bánh A và
    B. Để làm 1 cái bánh A cần 20g bột và 10g đường. Để làm 1 cái bánh B
    cần 10g bột và 20g đường. Cửa hàng chỉ có tối đa 200g bột và 160g
    đường.
  - #strong[Câu hỏi:] Gọi $x$ là số bánh A, $y$ là số bánh B. Hãy lập
    các hệ thức toán học (dạng bất phương trình) thể hiện giới hạn về
    nguyên liệu (bột và đường) mà cửa hàng có thể sử dụng.
]
#sp-hd[
  - Học sinh nêu được các bất phương trình:
    - Giới hạn về bột: $20 x + 10 y lt.eq 200$ (hoặc $2 x + y lt.eq 20$)
    - Giới hạn về đường: $10 x + 20 y lt.eq 160$ (hoặc
      $x + 2 y lt.eq 16$)
    - Điều kiện tự nhiên: $x gt.eq 0\;y gt.eq 0$
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] Giáo viên trình bày tình
    huống thực tiễn và yêu cầu học sinh lập mô hình toán học tương ứng
    (bất phương trình).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh làm việc cá nhân hoặc
    cặp đôi (5 phút). Giáo viên theo dõi, hướng dẫn (gợi ý về mối quan
    hệ giữa lượng nguyên liệu cần và lượng nguyên liệu tối đa cho phép).
  - #strong[Bước 3: Báo cáo, thảo luận:] Giáo viên gọi 1-2 học sinh
    trình bày sản phẩm. Cả lớp nhận xét.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên nhận xét, chính xác
    hóa các bất phương trình và đặt vấn đề: #strong[Làm thế nào để tìm
    được tất cả các cặp] $\(x\;y\)$ #strong[thỏa mãn các điều kiện
    trên?] (Dẫn đến nhu cầu nghiên cứu về Bất phương trình bậc nhất hai
    ẩn và Miền nghiệm).

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "55 phút")
==== Hoạt động thành phần 2.1: Khái niệm Bất phương trình bậc nhất hai ẩn (15 phút)
#mt-hd[
  BPT bậc nhất hai ẩn và khái niệm nghiệm/miền nghiệm.
]
#nd-hd[
  phiếu học tập số 1 (Làm việc nhóm 4):
  - Nêu dạng tổng quát của bất phương trình bậc nhất hai ẩn.
  - Xác định các cặp $\(x\;y\)$ là nghiệm của bất phương trình
    $x + y - 2 lt.eq 0$ bằng cách thay thế (Ví dụ: $\(0\;0\)$,
    $\(1\;1\)$, $\(3\;0\)$).
]
#sp-hd[
  - Dạng tổng quát: $a x + b y + c < 0$, $a x + b y + c > 0$,
    $a x + b y + c lt.eq 0$, $a x + b y + c gt.eq 0$, với $a\,b$ không
    đồng thời bằng 0.
  - Xác định đúng $\(0\;0\)$ và $\(1\;1\)$ là nghiệm, $\(3\;0\)$ không
    phải là nghiệm.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] Chia nhóm 4, giao phiếu học
    tập và yêu cầu đọc SGK.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm, ghi
    nhận kiến thức và thực hiện bài tập. Giáo viên quan sát, hỗ trợ nhóm
    yếu.
  - #strong[Bước 3: Báo cáo, thảo luận:] Đại diện nhóm trình bày kết
    quả. Các nhóm khác phản biện.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chốt lại định nghĩa
    BPT bậc nhất hai ẩn và khái niệm nghiệm.

==== Hoạt động thành phần 2.2: Biểu diễn miền nghiệm của Bất phương trình bậc nhất hai ẩn trên mặt phẳng toạ độ (40 phút)
]
#mt-hd[
  miền nghiệm] của BPT bậc nhất hai ẩn và thực hành thành thạo các bước
  biểu diễn miền nghiệm.
// ]
#nd-hd[
  hành qua #strong[Phương pháp dạy học khám phá có hướng dẫn] (Kết hợp
  sử dụng công nghệ số):
  - #strong[Nhiệm vụ 1 (Khám phá):] Cho BPT $2 x + y - 3 lt.eq 0$. Giáo
    viên yêu cầu học sinh vẽ đường thẳng $d : 2 x + y - 3 = 0$ trên mặt
    phẳng tọa độ (sử dụng giấy/bảng hoặc phần mềm GeoGebra). Sau đó,
    chọn điểm #strong[gốc tọa độ] $O\(0\;0\)$ để kiểm tra (thay vào
    BPT).
  - #strong[Nhiệm vụ 2 (Thực hành và Phát triển năng lực số):]
    #strong[Sử dụng GeoGebra/Desmos] để biểu diễn miền nghiệm của BPT
    $2 x + y - 3 lt.eq 0$. So sánh miền nghiệm hiển thị trên phần mềm
    với kết quả kiểm tra bằng điểm $O\(0\;0\)$. Rút ra quy tắc chung.
    - #emph[\(Biểu hiện Năng lực số: Học sinh #strong[sử dụng công cụ
      số] GeoGebra/Desmos để trực quan hóa, kiểm chứng và #strong[rút ra
      kiến thức mới]).]
  - #strong[Nhiệm vụ 3 (Lập luận):] Yêu cầu học sinh nêu các bước tổng
    quát để biểu diễn miền nghiệm của BPT $a x + b y + c < 0$.
  - #strong[Ví dụ minh họa:] Biểu diễn miền nghiệm của bất phương trình
    $x - 2 y + 4 > 0$.
]
#sp-hd[
  - Học sinh nêu được #strong[Quy tắc xác định miền nghiệm] (3 bước).
  - Biểu diễn đúng miền nghiệm của $2 x + y - 3 lt.eq 0$ (là nửa mặt
    phẳng bờ $2 x + y - 3 = 0$ chứa gốc tọa độ $O\(0\;0\)$, kể cả bờ).
  - Biểu diễn đúng miền nghiệm của $x - 2 y + 4 > 0$ (là nửa mặt phẳng
    bờ $x - 2 y + 4 = 0$ không chứa $O\(0\;0\)$, không kể bờ).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] Giáo viên trình bày các bước
    cơ bản và yêu cầu học sinh làm việc với GeoGebra/Desmos theo nhóm để
    kiểm tra các điểm, thử các bất phương trình khác nhau (ví dụ:
    $x - y > 0$, $y lt.eq 2$, \...).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thực hành trên
    máy/điện thoại (15 phút). Giáo viên theo dõi, hướng dẫn sử dụng phần
    mềm, khuyến khích các nhóm tìm ra quy tắc. Dự kiến khó khăn: Học
    sinh quên không xét bờ, nhầm lẫn chọn điểm thử. Biện pháp hỗ trợ:
    Gợi ý luôn chọn điểm $O\(0\;0\)$ nếu bờ không đi qua $O$.
  - #strong[Bước 3: Báo cáo, thảo luận:] Đại diện 1-2 nhóm trình bày kết
    quả khám phá và nêu quy tắc.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chuẩn hóa
    #strong[Quy tắc biểu diễn miền nghiệm] (Nêu 3 bước chi tiết).

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
  bản, rèn luyện kỹ năng biểu diễn miền nghiệm.
]
#nd-hd[
  đó dùng #strong[Trò chơi học tập] để kiểm tra và củng cố kiến thức:
  - #strong[Bài tập:] Biểu diễn miền nghiệm của bất phương trình:
    - $3 x - y gt.eq 6$
    - $- x + 4 y - 8 < 0$
  - #strong[Hoạt động: \"Ghép đôi Miền nghiệm\"] (Thẻ bài): Giáo viên
    chuẩn bị các thẻ bài (một nửa là BPT, một nửa là Hình ảnh Miền
    nghiệm tương ứng). Học sinh thảo luận nhanh và ghép đôi chính xác
    trong thời gian ngắn nhất.
]
#sp-hd[
  - Lời giải và hình biểu diễn chính xác cho hai bài tập (kể cả bờ hoặc
    không kể bờ).
  - Các cặp BPT và Hình ảnh Miền nghiệm được ghép đúng.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] Giao bài tập cá nhân/cặp đôi
    (7 phút).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh làm bài tập. Giáo viên
    quan sát, nhắc nhở về việc xét điểm gốc tọa độ và xét bờ.
  - #strong[Bước 3: Báo cáo, thảo luận:] Giáo viên mời 2 học sinh lên
    bảng trình bày, hoặc chiếu đáp án chuẩn. Tổ chức #strong[Trò chơi
    Ghép đôi] (5 phút).
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên tổng kết, khen ngợi
    và nhấn mạnh lại các lỗi sai thường gặp (quên xét dấu \"=\").

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
  thức BPT bậc nhất hai ẩn để giải quyết một tình huống thực tiễn mở
  rộng.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Trở lại #strong[Tình huống mở đầu] (Về sản xuất
    bánh A và B).
    - Lập hệ bất phương trình bậc nhất hai ẩn (đã làm ở HĐ 1).
    - #strong[Yêu cầu thêm:] Nếu bán mỗi bánh A lãi 20 nghìn đồng và mỗi
      bánh B lãi 30 nghìn đồng. Hãy tìm một phương án sản xuất
      $\(x\;y\)$ sao cho tổng số tiền lãi là #strong[lớn nhất] (Có thể
      sử dụng công cụ GeoGebra/Desmos để trực quan hóa miền nghiệm của
      hệ BPT để hỗ trợ tìm phương án).
    - #strong[Sử dụng Sơ đồ tư duy (Mindmap)] hoặc công cụ số (ví dụ:
      Canva, Mindmeister) để trình bày quá trình giải quyết vấn đề.
    - #emph[\(Biểu hiện Năng lực số: Học sinh sử dụng công cụ số để
      #strong[phân tích và tổng hợp thông tin] (sơ đồ tư duy) và
      #strong[giải quyết vấn đề] (GeoGebra/Desmos tìm lời giải tối
      ưu).)]
]
#sp-hd[
  - Báo cáo (bản viết tay hoặc bản số) thể hiện:
    - Hệ bất phương trình.
    - Hình biểu diễn miền nghiệm của hệ (vẽ tay hoặc ảnh chụp từ phần
      mềm).
    - Phương án sản xuất $\(x_0\;y_0\)$ tối ưu và số tiền lãi lớn nhất.
    - Sơ đồ tư duy tóm tắt nội dung bài học.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] Giáo viên giao nhiệm vụ cụ
    thể và hướng dẫn học sinh phương pháp thực hiện (Sử dụng công cụ đồ
    họa, cách trình bày báo cáo).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thực hiện ở nhà.
  - #strong[Bước 3: Báo cáo, thảo luận:] Thu sản phẩm báo cáo để chấm
    điểm/nhận xét và tổ chức trao đổi, chia sẻ kết quả vào tiết học tiếp
    theo.

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
