// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 3",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Ôn tập và hệ thống hóa] các kiến thức cơ bản về:
  - Khái niệm và công thức tính #strong[phương sai] ($s^2$) và
    #strong[độ lệch chuẩn] ($s$) của mẫu số liệu ghép nhóm.
  - Khái niệm và công thức tính #strong[tứ phân vị]
    $(Q_1 \, Q_2 \, Q_3)$ của mẫu số liệu ghép nhóm.
  - Khái niệm và công thức tính #strong[khoảng tứ phân vị]
    $\(Delta_Q\)$.
- Hiểu được ý nghĩa của các số đặc trưng đo độ phân tán trong việc đánh
  giá sự #strong[biến động] và #strong[phân tán] của dữ liệu.

#muc("2", "NĂNG LỰC")
==== a. Năng lực chung
- #strong[Tự chủ và tự học:] Chủ động ôn tập và hệ thống hóa kiến thức;
  tự đánh giá được mức độ hiểu bài của bản thân.
- #strong[Giao tiếp và hợp tác:] Tích cực thảo luận nhóm; biết lắng
  nghe, tiếp thu và trình bày rõ ràng ý kiến của mình, đặc biệt trong
  việc sử dụng công nghệ số để trình bày.
- #strong[Giải quyết vấn đề và sáng tạo:] Phân tích yêu cầu bài toán,
  lựa chọn công thức tính toán phù hợp và vận dụng linh hoạt để giải
  quyết các vấn đề liên quan đến thống kê.

==== b. Năng lực đặc thù (Năng lực Toán học)
- #strong[Năng lực tư duy và lập luận Toán học:] Phân tích được cấu trúc
  của mẫu số liệu ghép nhóm và lập luận để chọn công thức, bước tính
  toán chính xác.
- #strong[Năng lực mô hình hóa Toán học:] Vận dụng các công thức thống
  kê để mô hình hóa và giải quyết các vấn đề thực tiễn.
- #strong[Năng lực giải quyết vấn đề Toán học:] Thực hiện thành thạo các
  bước tính toán các số đặc trưng đo độ phân tán và rút ra nhận xét.

==== c. Năng lực số (Theo Thông tư số 02/2025/TT-BGDĐT)
- 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
- 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
  tin và nội dung trong môi trường số.
- 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin và
  nội dung này cũng như điều hướng giữa chúng.
- 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.
- 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
  dạng khác nhau,
- 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc tạo
  ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, nghiêm túc trong việc hệ thống kiến thức
  và luyện tập giải bài tập.
- #strong[Trung thực:] Thẳng thắn trao đổi, báo cáo kết quả đúng, kể cả
  khi dùng công cụ số để kiểm tra.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ được giao trong hoạt
  động nhóm và tự giác ôn tập kiến thức.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy chiếu/Tivi, máy tính, bảng phụ (hoặc slide)
  tổng hợp kiến thức cơ bản, phiếu học tập (bài tập luyện tập), tài liệu
  hướng dẫn sử dụng phần mềm tính toán (ví dụ: các hàm thống kê cơ bản
  trên Excel).
- #strong[Học sinh:] Sách giáo khoa Toán 12 (Kết nối tri thức), vở ghi,
  máy tính bỏ túi (có chức năng thống kê), điện thoại thông minh/máy
  tính bảng (nếu cần cho hoạt động nhóm và phát triển năng lực số).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#muc("1", "KIẾN THỨC")
==== a. Mục tiêu
Hệ thống hóa một cách cô đọng, trực quan các kiến thức, công thức tính
toán các số đặc trưng đo độ phân tán của mẫu số liệu ghép nhóm.

==== b. Phương pháp/Kĩ thuật dạy học
Phương pháp dạy học #strong[tích cực] (Sơ đồ tư duy - Mindmap, Thuyết
trình), lấy học sinh làm trung tâm, khuyến khích #strong[giao tiếp và
tổng hợp thông tin].

==== c. Các hoạt động cụ thể
- #strong[Khởi động (3 phút):]

  - #strong[Trò chơi \"Ô chữ kiến thức\":] Giáo viên đưa ra 3-4 câu
    hỏi/mô tả ngắn về ý nghĩa hoặc công thức của các đại lượng (Phương
    sai, Độ lệch chuẩn, Tứ phân vị, Khoảng tứ phân vị). Học sinh xung
    phong trả lời.
  - #strong[Kết nối:] Giáo viên dẫn dắt vào bài ôn tập, nhấn mạnh tầm
    quan trọng của việc nắm vững công thức và ý nghĩa.

- #strong[Hình thành/Hệ thống hóa kiến thức (12 phút):]

  - #strong[Hoạt động nhóm (10 phút):] Giáo viên chia lớp thành 4 nhóm.
    Giao nhiệm vụ cho các nhóm:
    - #strong[Nhóm 1:] Công thức và ý nghĩa của #strong[Phương sai] và
      #strong[Độ lệch chuẩn].
    - #strong[Nhóm 2:] Công thức và cách xác định #strong[Tứ phân vị thứ
      nhất] $(Q_1)$ và #strong[Thứ ba] $(Q_3)$.
    - #strong[Nhóm 3:] Công thức và ý nghĩa của #strong[Khoảng tứ phân
      vị] $(Delta_Q)$.
    - #strong[Nhóm 4:] Tổng hợp các công thức trên thành một #strong[Sơ
      đồ tư duy] (có thể vẽ tay hoặc dùng phần mềm số).
  - #strong[Thuyết trình và phản biện (2 phút):] Mời 1 nhóm đại diện lên
    trình bày sơ đồ tư duy (có thể trình chiếu slide hoặc hình ảnh sơ đồ
    vẽ tay). Các nhóm khác lắng nghe, bổ sung.
  - #strong[Tích hợp năng lực số:] Nhóm 4 hoặc các nhóm khác có thể sử
    dụng các ứng dụng vẽ Sơ đồ tư duy (như MindMeister, XMind, hoặc
    Canva) để tổng hợp kiến thức, rèn luyện #strong[Tạo lập và xử lí
    thông tin số] và #strong[Khai thác công cụ số].
  - #strong[Giáo viên chốt:] Chuẩn hóa lại các công thức, đặc biệt lưu ý
    về vị trí $p %$ của các tứ phân vị.

#muc("2", "NĂNG LỰC")
==== a. Mục tiêu
Vận dụng thành thạo các công thức để tính toán các số đặc trưng đo độ
phân tán của mẫu số liệu ghép nhóm và sử dụng công cụ số để kiểm
tra/tính toán.

==== b. Phương pháp/Kĩ thuật dạy học
Phương pháp dạy học #strong[Tích hợp phát triển năng lực số], Luyện tập
thực hành, Phân tích dữ liệu, Đặt vấn đề.

==== c. Các hoạt động cụ thể
- #strong[Bài tập vận dụng (20 phút):]

  - #strong[Giao nhiệm vụ (2 phút):] Giáo viên chiếu/phát phiếu bài tập
    bao gồm một mẫu số liệu ghép nhóm cụ thể (ví dụ: Bảng phân bố tần số
    ghép nhóm về cân nặng của học sinh lớp 12) và yêu cầu tính:
    #block[
    #set enum(numbering: "i.", start: 1)
    + Phương sai ($s^2$) và Độ lệch chuẩn ($s$).
    + Khoảng tứ phân vị ($Delta_Q$).
    ]
  - #strong[Thực hành cá nhân/Hợp tác cặp đôi (15 phút):]
    - Học sinh thực hiện tính toán thủ công các đại lượng trên.
    - #strong[Tích hợp năng lực số:] Sau khi tính toán thủ công xong,
      yêu cầu học sinh sử dụng máy tính bỏ túi (chế độ STAT/Thống kê)
      hoặc phần mềm #strong[Excel/Google Sheets] để nhập dữ liệu và áp
      dụng công thức/hàm có sẵn để #strong[kiểm tra] hoặc #strong[tính
      nhanh] kết quả, so sánh với kết quả tính toán thủ công.
    - #strong[Biểu hiện năng lực số:] Học sinh sử dụng thành thạo các
      hàm thống kê cơ bản trên Excel (như AVERAGE, VAR.S hoặc STDEV.S)
      để tính toán các đại lượng trên, thể hiện #strong[Khai thác và sử
      dụng công cụ, phương tiện số].
  - #strong[Báo cáo và sửa bài (3 phút):] Mời một học sinh trình bày chi
    tiết các bước tính toán thủ công và kết quả cuối cùng. Giáo viên
    chốt lại đáp án chính xác.

- #strong[Củng cố và mở rộng (Phân tích dữ liệu) (10 phút):]

  - #strong[Hoạt động \"Thử thách Phân tích\" (8 phút):] Giáo viên đưa
    ra hai mẫu số liệu ghép nhóm $A$ và $B$ về cùng một chỉ tiêu (ví dụ:
    điểm thi thử), đã có sẵn kết quả
    $macron(x)\,s_A\,s_B\,Delta_(Q A)\,Delta_(Q B)$.
    - #strong[Yêu cầu:] Học sinh thảo luận (theo nhóm hoặc cặp đôi) để
      so sánh và #strong[nhận xét] về độ đồng đều, mức độ phân tán của
      hai mẫu số liệu này, từ đó rút ra kết luận về chất lượng/tính ổn
      định của hai nhóm.
    - #strong[Tăng cường kĩ năng:] Hoạt động này khuyến khích học sinh
      #strong[phân tích và tổng hợp thông tin] từ kết quả tính toán để
      đưa ra nhận định thực tiễn.
  - #strong[Tổng kết và giao việc (2 phút):]
    - Giáo viên tổng kết lại các kiến thức trọng tâm của chương.
    - Giao bài tập về nhà: Tìm một mẫu số liệu ghép nhóm từ báo chí,
      internet và áp dụng kiến thức đã học để tính toán, phân tích
      (Khuyến khích sử dụng công cụ số để thực hiện).

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

