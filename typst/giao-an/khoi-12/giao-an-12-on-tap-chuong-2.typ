// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 2",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Tọa độ của vectơ, tọa độ của một điểm trong không gian $O x y z$.
- Các phép toán về vectơ: cộng, trừ, nhân vectơ với một số, tích vô
  hướng, tích có hướng của hai vectơ.
- Công thức tính độ dài vectơ, khoảng cách giữa hai điểm, góc giữa hai
  vectơ.
- Các điều kiện để hai vectơ cùng phương, hai vectơ vuông góc, ba vectơ
  đồng phẳng.

#muc("2", "NĂNG LỰC")
==== a) Năng lực chung
- #strong[Năng lực tự chủ và tự học:] HS tự giác tìm tòi, hệ thống hóa
  kiến thức; chủ động đề xuất các câu hỏi/vấn đề cần ôn tập.
- #strong[Năng lực giao tiếp và hợp tác:] HS tích cực thảo luận nhóm,
  biết lắng nghe, phản hồi và xây dựng ý kiến; phân công nhiệm vụ rõ
  ràng khi làm việc nhóm.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] HS vận dụng linh hoạt
  kiến thức để giải quyết các dạng bài tập tổng hợp và đưa ra các lời
  giải tối ưu.

==== b) Năng lực đặc thù (Năng lực Toán học)
- #strong[Năng lực tư duy và lập luận toán học:] HS biết quy lạ về quen,
  phân tích, tổng hợp kiến thức để xây dựng sơ đồ tư duy (SĐTD) hoặc
  bảng tổng hợp.
- #strong[Năng lực mô hình hóa toán học:] HS chuyển các bài toán thực
  tiễn về mô hình hình học không gian có sử dụng hệ trục tọa độ
  $O x y z$.
- #strong[Năng lực sử dụng công cụ, phương tiện học toán:] HS sử dụng
  máy tính cầm tay, phần mềm hình học (Geogebra, Desmos 3D) để kiểm tra
  kết quả hoặc trực quan hóa kiến thức.

==== c) Năng lực số (Theo TT 02/2025/TT-BGDĐT)
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.
- 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
  dạng khác nhau,
- 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc tạo
  ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Có ý thức tự giác, tích cực ôn tập và làm bài tập.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ được giao trong nhóm, có
  trách nhiệm với kết quả học tập của bản thân và tập thể.
- #strong[Trung thực:] Thẳng thắn trao đổi, đánh giá kết quả một cách
  khách quan, không gian lận trong học tập.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
+ #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối mạng, bảng,
  phấn, bút viết bảng.
+ #strong[Học liệu:]
  - Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập nhóm (dạng in hoặc dạng số).
  - Phần mềm/Ứng dụng: #strong[Mind Mapping Tool] (ví dụ: MindMeister,
    XMind, Miro) hoặc #strong[Google Slides/PowerPoint] (dùng cho hoạt
    động tổng hợp kiến thức) và #strong[Geogebra 3D] (dùng cho hoạt động
    luyện tập).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
Sử dụng #strong[Phương pháp dạy học tích cực, lấy học sinh làm trung
tâm] (Học tập hợp tác, Dạy học giải quyết vấn đề) kết hợp #strong[Tích
hợp phát triển Năng lực số].

=== HOẠT ĐỘNG 1: TỔNG HỢP KIẾN THỨC (35 phút - Tiết 1)
==== 1. Khởi động - Trò chơi \"Ai nhanh hơn?\" (5 phút)
- #strong[Mục tiêu:] Kích hoạt kiến thức cũ, tạo hứng thú cho HS.
- #strong[Tiến hành:]
  - Giáo viên (GV) đưa ra 5 câu hỏi trắc nghiệm nhanh liên quan đến các
    công thức cơ bản (ví dụ: công thức tính tích vô hướng, điều kiện
    đồng phẳng, công thức tính độ dài vectơ).
  - HS sử dụng #strong[hệ thống trả lời tương tác số] (ví dụ: Kahoot!
    hoặc Quizizz) để trả lời.
  - #strong[Năng lực số:] HS sử dụng thiết bị số để truy cập và tham gia
    trò chơi.
  - GV công bố kết quả và tuyên dương người thắng cuộc.

==== 2. Xây dựng Sơ đồ Tư duy (SĐTD) số - \"Kết nối tri thức\" (30 phút)
- #strong[Phương pháp:] Học tập hợp tác, Kĩ thuật Sơ đồ tư duy (Mind
  Mapping), #strong[Phát triển Năng lực số].
- #strong[Mục tiêu:] HS tự hệ thống hóa, tổ chức và trình bày kiến thức
  một cách trực quan, khoa học.
- #strong[Tiến hành:]
  - #strong[Chia nhóm:] GV chia lớp thành 4 nhóm lớn (mỗi nhóm phụ trách
    một nội dung chính của chương).
    - Nhóm 1: Tọa độ điểm, tọa độ vectơ, các phép toán.
    - Nhóm 2: Tích vô hướng và ứng dụng (góc, điều kiện vuông góc).
    - Nhóm 3: Tích có hướng và ứng dụng (diện tích, thể tích, điều kiện
      đồng phẳng).
    - Nhóm 4: Phương trình mặt cầu, khoảng cách.
  - #strong[Thực hiện:] Các nhóm sử dụng #strong[phần mềm Sơ đồ Tư duy
    số] (hoặc Google Slides/PowerPoint) để thiết kế SĐTD cho phần kiến
    thức được giao.
  - #strong[Năng lực số:] HS khai thác và sử dụng #strong[công cụ số] để
    tạo lập nội dung học tập, lưu trữ và chia sẻ thông tin. Đây là biểu
    hiện rõ nét của #strong[Năng lực số] trong việc tổng hợp kiến thức.
  - #strong[Báo cáo:] GV mời ngẫu nhiên 1-2 nhóm trình bày nhanh SĐTD
    của nhóm mình (trình chiếu qua máy chiếu).
  - #strong[Tổng hợp:] GV chuẩn hóa, bổ sung (nếu cần) và cùng HS thống
    nhất SĐTD chung của chương.

=== HOẠT ĐỘNG 2: LUYỆN TẬP VÀ VẬN DỤNG (55 phút - Tiết 2)
==== 1. Luyện tập theo trạm - \"Chinh phục thử thách\" (35 phút)
- #strong[Phương pháp:] Học tập hợp tác, Dạy học giải quyết vấn đề,
  #strong[Tăng cường giao tiếp và phân tích thông tin].
- #strong[Mục tiêu:] Vận dụng linh hoạt kiến thức đã tổng hợp để giải
  quyết các dạng bài tập từ cơ bản đến nâng cao.
- #strong[Tiến hành:]
  - GV chuẩn bị 4-5 \"trạm\" bài tập (ví dụ: Trạm 1: Bài toán về các
    phép toán vectơ; Trạm 2: Bài toán về góc và khoảng cách; Trạm 3: Bài
    toán về tích có hướng và diện tích/thể tích; Trạm 4: Bài toán tổng
    hợp/thực tế có yếu tố hình học không gian).
  - Các nhóm của Hoạt động 1 di chuyển qua các trạm để giải quyết bài
    tập (khoảng 7 phút/trạm). HS ghi lại kết quả vào Phiếu học tập
    chung.
  - #strong[Tăng cường kĩ năng giao tiếp/phân tích:] Trong quá trình di
    chuyển, nhóm phải #strong[phân tích] yêu cầu, #strong[hợp tác] để
    tìm lời giải và #strong[ghi chép] kết quả.
  - #strong[Tích hợp Geogebra 3D (Tùy chọn):] Tại một trạm có thể yêu
    cầu HS sử dụng #strong[Geogebra 3D] trên máy tính để #strong[trực
    quan hóa] một bài toán về tọa độ hoặc kiểm tra vị trí tương đối của
    các điểm/vectơ.
    - #strong[Năng lực số:] HS sử dụng #strong[phần mềm mô phỏng] để hỗ
      trợ giải quyết vấn đề.
  - #strong[Sửa bài:] Sau khi hết giờ, GV gọi đại diện các nhóm lên
    trình bày lời giải của một trạm bất kì. GV nhận xét, chốt đáp án.

==== 2. Bài tập vận dụng cao/Thuyết trình - \"Vận dụng sáng tạo\" (20 phút)
- #strong[Phương pháp:] Thuyết trình, Giải quyết vấn đề, #strong[Phát
  triển năng lực tư duy, sáng tạo].
- #strong[Mục tiêu:] HS biết vận dụng kiến thức vào giải quyết các bài
  toán có tính thực tiễn hoặc nâng cao, phát triển kỹ năng thuyết trình.
- #strong[Tiến hành:]
  - GV đưa ra 1-2 bài toán vận dụng thực tiễn hoặc bài toán khó (ví dụ:
    Xác định tâm/bán kính mặt cầu ngoại tiếp tứ diện cho trước tọa độ 4
    đỉnh, hoặc bài toán xác định tọa độ để tối ưu một yếu tố nào đó
    trong mô hình 3D).
  - GV chia thành 2 nhóm mới (hoặc giữ nguyên 4 nhóm và giao cho 2 nhóm
    đầu tiên thực hiện).
  - Các nhóm thảo luận tìm lời giải. GV khuyến khích các nhóm tìm nhiều
    phương án giải quyết (nếu có).
  - #strong[Thuyết trình:] Đại diện nhóm lên #strong[thuyết trình]
    phương án giải quyết tối ưu nhất trước lớp (có thể sử dụng hình vẽ
    trên bảng hoặc hình ảnh mô phỏng 3D đã chuẩn bị nếu có).
  - #strong[Phân tích và tổng hợp thông tin:] HS phải #strong[phân tích]
    đề bài, #strong[tổng hợp] kiến thức liên quan và #strong[thuyết
    phục] các nhóm khác về lời giải của mình.
  - GV nhận xét, đánh giá về tính sáng tạo, logic và hiệu quả của bài
    giải.

== IV. CÔNG VIỆC VỀ NHÀ
+ Hoàn thiện SĐTD số về Chương 2 và chia sẻ với các thành viên trong
  nhóm.
+ Làm các bài tập còn lại trong SGK (phần ôn tập chương).
+ Chuẩn bị bài học tiếp theo (Ôn tập kiến thức về Phương trình đường
  thẳng và mặt phẳng).

#figure(
  align(center)[#table(
    columns: (33.18%, 46.97%),
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

