// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 5",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Hệ thống hóa, củng cố và làm rõ các khái niệm về #strong[số trung bình
  cộng, trung vị, tứ phân vị, mốt] của mẫu số liệu không ghép nhóm.
- Củng cố các khái niệm về #strong[khoảng biến thiên, phương sai, độ
  lệch chuẩn] và ý nghĩa của chúng trong việc đánh giá mức độ phân tán
  của mẫu số liệu.
- Vận dụng thành thạo các công thức tính toán và biết cách sử dụng máy
  tính cầm tay hoặc phần mềm để tính các số đặc trưng.

#muc("2", "NĂNG LỰC")
===== a. Năng lực chung
- #strong[Năng lực tự chủ và tự học:] Chủ động ôn tập, tìm hiểu và hệ
  thống hóa kiến thức; tự đánh giá được mức độ tiếp thu kiến thức của
  bản thân.
- #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia hoạt động
  nhóm, lắng nghe, trao đổi, trình bày ý kiến, góp ý và hợp tác hiệu quả
  để hoàn thành nhiệm vụ chung.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp
  thông tin từ số liệu để giải quyết các vấn đề thực tiễn liên quan đến
  việc so sánh và đánh giá các mẫu số liệu.

===== b. Năng lực đặc thù (Năng lực Toán học)
- #strong[Năng lực tư duy và lập luận toán học:] Phân tích mối quan hệ
  giữa các số đặc trưng; giải thích ý nghĩa của các số đặc trưng trong
  bối cảnh cụ thể.
- #strong[Năng lực mô hình hóa toán học:] Vận dụng kiến thức để mô hình
  hóa các tình huống thực tiễn bằng các mẫu số liệu và các số đặc trưng
  tương ứng.
- #strong[Năng lực công cụ và phương tiện toán học (Năng lực số):]
  #strong[Sử dụng các công cụ, thiết bị số] như #strong[máy tính cầm
  tay] hoặc #strong[phần mềm bảng tính (ví dụ: Excel/Google Sheets)] để
  nhập liệu, tính toán nhanh và chính xác các số đặc trưng (Số trung
  bình, phương sai, độ lệch chuẩn, tứ phân vị).

===== c. Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT)
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực trong hoạt động ôn tập, hoàn thành đầy đủ
  các nhiệm vụ học tập được giao.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ cá nhân và nhiệm vụ
  nhóm; cẩn thận, chính xác khi tính toán và trình bày kết quả.
- #strong[Trung thực:] Thẳng thắn, trung thực trong việc tự đánh giá và
  đánh giá kết quả của bạn bè.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy chiếu/Tivi, máy tính có kết nối mạng (dùng để
  trình chiếu Sơ đồ tư duy/Slide tổng hợp kiến thức), phiếu bài tập
  (hoặc đề bài tập trình chiếu), máy tính cầm tay.
- #strong[Học sinh:] Sách giáo khoa, vở ghi, máy tính cầm tay (bắt
  buộc), điện thoại thông minh/máy tính bảng có kết nối mạng (nếu sử
  dụng phần mềm bảng tính).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#muc("1", "KIẾN THỨC")
#figure(
  align(center)[#table(
    columns: (11.01%, 17.21%, 21.98%, 49.8%),
    align: (left,left,left,left,),
    table.header(table.cell(align: left)[Hoạt
      động], table.cell(align: left)[Mục
      tiêu], table.cell(align: left)[Phương pháp/Kĩ
      thuật], table.cell(align: left)[Hoạt động cụ thể],),
    table.hline(),
    table.cell(align: left)[#strong[1.1. Khởi động (2
    phút)]], table.cell(align: left)[Tạo hứng thú, huy động kiến thức đã
    học.], table.cell(align: left)[Đặt vấn
    đề.], table.cell(align: left)[GV đặt câu hỏi: \"Trong Chương V,
    chúng ta đã học những \'con số\' nào giúp mô tả và so sánh mẫu số
    liệu? Ý nghĩa của chúng là gì?\"],
    table.cell(align: left)[#strong[1.2. Hệ thống hóa (13
    phút)]], table.cell(align: left)[HS tự tổng hợp và hệ thống hóa kiến
    thức trọng tâm của chương.], table.cell(align: left)[Dạy học tích
    cực: #strong[Sơ đồ tư duy (Mind Map)]. #strong[Phát triển Năng lực
    Giao tiếp, Phân tích & Tổng hợp.]], table.cell(align: left)[\*
    #strong[Nhiệm vụ:] HS làm việc theo #strong[nhóm nhỏ (4-5 HS)] trong
    8 phút để cùng nhau lập #strong[Sơ đồ tư duy] tóm tắt toàn bộ kiến
    thức chương V (các số đo xu thế trung tâm và các số đo độ phân tán).
    \* #strong[Trình bày & Thảo luận:] GV mời đại diện 2-3 nhóm trình
    bày nhanh Sơ đồ tư duy của nhóm mình (sử dụng giấy A4/A3 hoặc công
    cụ số nếu có, phát triển #strong[Năng lực số]). Các nhóm khác nhận
    xét, bổ sung. \* #strong[Chốt kiến thức:] GV chuẩn hóa, hoàn thiện
    lại Sơ đồ tư duy tổng thể và trình chiếu, nhấn mạnh các công thức
    quan trọng và ý nghĩa thực tiễn của từng số đặc trưng (ví dụ: Trung
    vị ít bị ảnh hưởng bởi giá trị ngoại lai, độ lệch chuẩn thể hiện mức
    độ rủi ro...).],
  )]
  , kind: table
  )

#hd("2", "Luyện tập", "27 phút")
#figure(
  align(center)[#table(
    columns: (11.93%, 15.42%, 21.41%, 51.24%),
    align: (left,left,left,left,),
    table.header(table.cell(align: left)[Hoạt
      động], table.cell(align: left)[Mục
      tiêu], table.cell(align: left)[Phương pháp/Kĩ
      thuật], table.cell(align: left)[Hoạt động cụ thể],),
    table.hline(),
    table.cell(align: left)[#strong[2.1. Luyện tập tính toán (15
    phút)]], table.cell(align: left)[Rèn luyện kĩ năng tính toán, vận
    dụng công cụ.], table.cell(align: left)[Dạy học tích cực:
    #strong[Thực hành, Cá nhân & Hợp tác]. #strong[Phát triển Năng lực
    số.]], table.cell(align: left)[\* #strong[Thử thách:] GV đưa ra 1-2
    bài toán thực tiễn với mẫu số liệu cụ thể (ví dụ: điểm thi, cân
    nặng, thời gian chạy...). \* #strong[Nhiệm vụ:] HS thực hiện tính
    toán các số đặc trưng ($macron(x)$, $M_e$, $Q_1$, $Q_3$, $s$,
    $sigma^2$) #strong[trên máy tính cầm tay] hoặc #strong[sử dụng phần
    mềm bảng tính (Excel/Google Sheets)] (khuyến khích, nhằm phát triển
    #strong[Năng lực số]). \* #strong[Kiểm tra chéo:] Sau 10 phút, các
    nhóm đổi bài, kiểm tra kết quả tính toán của nhau. GV gọi HS lên
    bảng hoặc trình bày nhanh kết quả tính được qua công cụ số.
    #strong[Tăng cường kĩ năng giao tiếp, thuyết trình.]],
    table.cell(align: left)[#strong[2.2. Vận dụng - Trò chơi (12
    phút)]], table.cell(align: left)[Vận dụng kiến thức để phân tích, so
    sánh các mẫu số liệu trong bối cảnh thực
    tế.], table.cell(align: left)[Dạy học tích cực: #strong[Trò chơi học
    tập] (\"Ai là Nhà phân tích giỏi nhất\"). #strong[Tăng cường kĩ năng
    Phân tích & Tổng hợp.]], table.cell(align: left)[\* #strong[Trò
    chơi:] GV đưa ra 2 mẫu số liệu (A và B) mô tả cùng một hiện tượng
    (ví dụ: kết quả kinh doanh của hai cửa hàng) và các số đặc trưng đã
    được tính sẵn (hoặc yêu cầu HS tính nhanh). \* #strong[Nhiệm vụ:]
    #strong[Làm việc nhóm], thảo luận để đưa ra quyết định: \"Nên chọn
    cửa hàng/giải pháp nào?\" và #strong[giải thích rõ ràng] dựa trên
    việc phân tích các chỉ số ($macron(x)\,M_e\,s\,Q_1\,Q_3$). \*
    #strong[Bình chọn & Thuyết trình:] Đại diện nhóm trình bày lập luận
    của mình. Lớp bình chọn nhóm có lập luận logic, thuyết phục nhất.
    #strong[Tăng cường kĩ năng giao tiếp, thuyết trình.]],
  )]
  , kind: table
  )

#hd("3", "Củng cố và dặn dò", "3 phút")
- GV cùng HS tóm tắt lại các kiến thức trọng tâm đã ôn tập (chủ yếu qua
  Sơ đồ tư duy đã chuẩn hóa).
- #strong[GV yêu cầu HS:] Sử dụng máy tính cầm tay (hoặc công cụ số) để
  tự kiểm tra lại ít nhất 2 bài tập đã làm trong chương để đảm bảo độ
  chính xác.
- #strong[Dặn dò:] Chuẩn bị bài cho tiết học tiếp theo (Kiểm tra giữa
  kì/Học bài mới).

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

