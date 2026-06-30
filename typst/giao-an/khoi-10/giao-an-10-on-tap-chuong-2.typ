// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
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
- Hệ thống hóa kiến thức về #strong[Bất phương trình bậc nhất hai ẩn] và
  #strong[Hệ bất phương trình bậc nhất hai ẩn].
- Nắm vững cách xác định #strong[miền nghiệm] của bất phương trình bậc
  nhất hai ẩn và hệ bất phương trình bậc nhất hai ẩn trên mặt phẳng tọa
  độ.
- Vận dụng được các kiến thức đã học vào giải quyết một số bài toán thực
  tế đơn giản (bài toán tối ưu hóa).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động ôn tập, tìm kiếm tài liệu và tự
    đánh giá kiến thức đã học.
  - #strong[Giao tiếp và hợp tác:] Hợp tác hiệu quả trong làm việc nhóm;
    trình bày, thảo luận, phản biện về kết quả tìm được.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống thực
    tế, xác định mô hình toán học (bất/hệ bất phương trình), tìm ra miền
    nghiệm và đưa ra giải pháp tối ưu.
- #strong[Năng lực riêng (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Nhận biết, chứng minh
    và giải thích các quy tắc xác định miền nghiệm.
  - #strong[Năng lực mô hình hóa toán học:] Thiết lập mô hình hệ bất
    phương trình bậc nhất hai ẩn cho các bài toán thực tế.
  - #strong[Năng lực sử dụng công cụ, phương tiện toán học:] Sử dụng các
    phần mềm vẽ đồ thị/trực tuyến (như #strong[GeoGebra]) để kiểm tra,
    minh họa miền nghiệm.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Chủ động, tích cực tham gia các hoạt động ôn tập.
- #strong[Trung thực:] Nghiêm túc, trung thực trong việc đánh giá kết
  quả làm việc cá nhân và nhóm.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ được giao, có trách
  nhiệm với sản phẩm chung của nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy tính/máy chiếu, Phiếu học tập, Bài giảng điện
  tử (PowerPoint hoặc tương đương), Bộ câu hỏi/bài tập trắc nghiệm ngắn,
  máy in, giấy A0/A3 (dùng cho sơ đồ tư duy).
- #strong[Học sinh:] Sách giáo khoa, vở ghi, dụng cụ học tập, điện thoại
  thông minh/máy tính bảng có cài đặt hoặc truy cập được phần mềm
  #strong[GeoGebra] (hoặc tương tự) để kiểm tra kết quả (Khuyến khích).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#muc("1", "KIẾN THỨC")
- #strong[Mục tiêu:] Hệ thống hóa kiến thức một cách trực quan, tạo cơ
  hội cho học sinh tự học và hợp tác.
- #strong[Phương pháp:] #strong[Sơ đồ tư duy (Mindmap) nhóm] kết hợp
  #strong[thuyết trình] và #strong[tích hợp công cụ số] (nếu có).

#figure(
  align(center)[#table(
    columns: (8.67%, 48.08%, 15.55%, 27.7%),
    align: (left,left,left,left,),
    table.header(table.cell(align: left)[Trình
      tự], table.cell(align: left)[Hoạt động của GV và
      HS], table.cell(align: left)[Dự kiến sản
      phẩm], table.cell(align: left)[Ghi chú & Tích hợp],),
    table.hline(),
    table.cell(align: left)[#strong[B1 (1
    phút)]], table.cell(align: left)[#strong[GV] chia lớp thành các nhóm
    nhỏ (4-5 HS/nhóm) và giao nhiệm vụ: \"Hãy vẽ #strong[Sơ đồ tư duy]
    hệ thống hóa toàn bộ kiến thức chương 2 (Bất phương trình và Hệ bất
    phương trình bậc nhất hai ẩn).\"], table.cell(align: left)[4-5 nhóm,
    mỗi nhóm 1 tờ A0/A3.], table.cell(align: left)[Chia nhiệm vụ rõ ràng
    trong nhóm: Thư ký, Họa sĩ, Thuyết trình viên.],
    table.cell(align: left)[#strong[B2 (8
    phút)]], table.cell(align: left)[#strong[HS] làm việc nhóm: Thảo
    luận, phân tích, tổng hợp kiến thức và trình bày bằng Sơ đồ tư duy
    (có thể dùng giấy A3/A0 hoặc dùng các công cụ số trực tuyến như
    #strong[MindMeister] nếu có điều
    kiện).], table.cell(align: left)[Các Sơ đồ tư duy
    thô.], table.cell(align: left)[#strong[Phát triển NL số:] Khuyến
    khích HS sử dụng công cụ Mindmap trực tuyến (nếu có) để tăng tính
    trực quan và kỹ năng sử dụng công cụ số.],
    table.cell(align: left)[#strong[B3 (6
    phút)]], table.cell(align: left)[#strong[GV] mời đại diện 2 nhóm lên
    trình bày Sơ đồ tư duy (mỗi nhóm không quá 3 phút). #strong[Các nhóm
    còn lại] quan sát và đặt câu hỏi. #strong[GV] nhận xét, chốt kiến
    thức trọng tâm, chỉnh sửa các nhầm lẫn (nếu có), đặc biệt nhấn mạnh:
    #strong[Xác định miền nghiệm] (bằng cách chọn điểm
    thử).], table.cell(align: left)[Sơ đồ tư duy hoàn chỉnh, kiến thức
    trọng tâm được chốt.], table.cell(align: left)[#strong[Dạy học tích
    cực:] Tăng cường kỹ năng thuyết trình, giao tiếp, phản biện.],
  )]
  , kind: table
  )

#hd("2", "Luyện tập -- Vận dụng", "30 phút")
- #strong[Mục tiêu:] Rèn luyện kĩ năng giải bài tập, đặc biệt là bài
  toán thực tế (mô hình hóa và tối ưu hóa).
- #strong[Phương pháp:] #strong[Trò chơi học tập: \"Tiếp sức\"] và
  #strong[Giải quyết vấn đề nhóm] kết hợp #strong[Kiểm tra trực quan
  bằng công cụ số.]

#figure(
  align(center)[#table(
    columns: (8.7%, 44.01%, 19.12%, 28.17%),
    align: (left,left,left,left,),
    table.header(table.cell(align: left)[Trình
      tự], table.cell(align: left)[Hoạt động của GV và
      HS], table.cell(align: left)[Dự kiến sản
      phẩm], table.cell(align: left)[Ghi chú & Tích hợp],),
    table.hline(),
    table.cell(align: left)[#strong[B1 (5
    phút)]], table.cell(align: left)[#strong[GV] tổ chức trò chơi
    #strong[\"Tiếp sức Toán học\"] với 4 câu hỏi trắc nghiệm/tự luận
    ngắn (nhận diện bất phương trình, xác định điểm thuộc/không thuộc
    miền nghiệm).], table.cell(align: left)[Đáp án nhanh và chính xác
    của các nhóm.], table.cell(align: left)[#strong[Dạy học tích cực:]
    Tạo không khí sôi nổi, củng cố kiến thức cơ bản nhanh.],
    table.cell(align: left)[#strong[B2 (20
    phút)]], table.cell(align: left)[#strong[GV] giao bài toán vận dụng
    thực tế (bài toán tối ưu hóa) yêu cầu lập mô hình Hệ bất phương
    trình và tìm giải pháp tối ưu. #emph[Ví dụ: \"Một xưởng may cần may
    hai loại áo A và B. Cho các ràng buộc về thời gian cắt vải, may, số
    lượng, v.v... Tìm số lượng mỗi loại áo để lợi nhuận lớn
    nhất.\"]], table.cell(align: left)[Mô hình hóa thành hệ BPT. Vẽ miền
    nghiệm. Xác định tọa độ các đỉnh. Tính giá trị tối
    ưu.], table.cell(align: left)[#strong[Dạy học tích cực:] #strong[Lấy
    HS làm trung tâm] thông qua hoạt động giải quyết vấn đề.],
    table.cell(align: left)[#strong[B3 (3
    phút)]], table.cell(align: left)[#strong[HS] làm việc cá nhân/nhóm
    nhỏ để #strong[lập mô hình toán học]. #strong[GV] gọi một nhóm lên
    trình bày toàn bộ lời giải và kết quả.], table.cell(align: left)[Lời
    giải chi tiết của bài toán thực tế.], table.cell(align: left)[],
    table.cell(align: left)[#strong[B4 (2
    phút)]], table.cell(align: left)[#strong[GV] sử dụng máy chiếu (hoặc
    yêu cầu HS sử dụng điện thoại/máy tính cá nhân) để #strong[vẽ miền
    nghiệm của hệ bất phương trình] vừa lập bằng phần mềm
    #strong[GeoGebra] (hoặc phần mềm trực tuyến
    khác).], table.cell(align: left)[Miền nghiệm được trực quan hóa trên
    màn hình.], table.cell(align: left)[#strong[Phát triển NL số:]
    #strong[Tăng cường kĩ năng sử dụng công cụ kỹ thuật số] để kiểm tra,
    trực quan hóa và khai thác thông tin từ các công cụ số. Đây là hoạt
    động phát triển NL số rất rõ ràng.],
  )]
  , kind: table
  )

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

