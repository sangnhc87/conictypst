// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 8 Mẫu số liệu ghép nhóm",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm về #strong[mẫu số liệu ghép nhóm].
- Trình bày được quy trình và biết cách #strong[ghép nhóm mẫu số liệu]
  cho trước.
- Giải thích được ý nghĩa và sự cần thiết của việc ghép nhóm mẫu số
  liệu.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động hoàn thành nhiệm vụ cá nhân (đọc
    SGK, làm bài tập).
  - #strong[Giao tiếp và hợp tác:] Tích cực thảo luận, trình bày kết quả
    làm việc nhóm, phản biện ý kiến.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích cấu trúc,
    nhận biết đặc điểm của mẫu số liệu; đề xuất phương án ghép nhóm phù
    hợp.
  - #strong[Năng lực mô hình hóa toán học:] Sử dụng quy tắc ghép nhóm để
    chuyển đổi mẫu số liệu thô thành mẫu số liệu ghép nhóm (mô hình
    hóa).

- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - #strong[Sử dụng các công cụ kỹ thuật số] (như #strong[Excel/Google
    Sheets]) để tính toán, tổ chức và trình bày mẫu số liệu; Tìm kiếm
    thông tin liên quan đến các dạng biểu đồ thống kê.
  - #strong[Khai thác và xử lý dữ liệu số] (sử dụng phần mềm bảng tính
    để sắp xếp và tính toán khoảng biến thiên).

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, nghiêm túc trong các hoạt động học tập cá
  nhân và nhóm.
- #strong[Trách nhiệm:] Hoàn thành nhiệm vụ được giao; tham gia xây dựng
  bài học.
- #strong[Trung thực:] Trình bày kết quả tính toán, thảo luận một cách
  chính xác, khách quan.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính/laptop giáo viên, bảng,
  phấn/bút.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Tập 1, bộ Kết nối tri thức với cuộc sống).
  - Phiếu học tập (bài tập mẫu số liệu thực tế), giấy A0/A4 lớn, bút dạ.
  - Phần mềm trình chiếu (PowerPoint/Google Slides), #strong[Phần mềm
    bảng tính (Excel/Google Sheets)] để hỗ trợ xử lý số liệu.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
=== 1. Hoạt động 1: Xác định vấn đề/nhiệm vụ học tập/Mở đầu
#strong[Tên hoạt động:] Khởi động -- Quan sát và nhận xét mẫu số liệu
lớn

#mt-hd[
Giúp học sinh nhận thấy sự #strong[cần thiết]
  phải tổ chức, sắp xếp lại mẫu số liệu lớn để dễ phân tích, từ đó dẫn
  đến nhu cầu về \"ghép nhóm mẫu số liệu\".
]
#nd-hd[
Giáo viên trình chiếu một #strong[mẫu số liệu
  thực tế] gồm 30-50 giá trị chưa được sắp xếp (ví dụ: chiều cao của 40
  học sinh lớp 11).
  - #strong[Nhiệm vụ:] Quan sát mẫu số liệu và trả lời câu hỏi: \"Mẫu số
    liệu này có dễ dàng để rút ra nhận xét chung về chiều cao của học
    sinh trong lớp không? Nếu không, chúng ta cần làm gì để việc phân
    tích trở nên dễ dàng hơn?\"
]
#sp-hd[
Câu trả lời của học sinh: Mẫu số liệu
  #strong[khó quan sát], #strong[cần phải sắp xếp] hoặc #strong[phân
  loại/phân nhóm] để dễ rút ra nhận xét.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên trình chiếu mẫu số liệu và đặt câu
    hỏi.
  - #strong[Thực hiện nhiệm vụ:] Học sinh quan sát, suy nghĩ cá nhân (1
    phút).
  - #strong[Báo cáo, thảo luận:] Giáo viên gọi 2-3 học sinh trình bày ý
    kiến.
  - #strong[Kết luận, nhận định:] Giáo viên dẫn dắt: \"Việc sắp xếp vẫn
    chưa đủ nếu dữ liệu quá lớn. Bài học hôm nay sẽ cung cấp cho chúng
    ta một công cụ hữu hiệu để làm điều đó: #strong[Mẫu số liệu ghép
    nhóm]\.\"

=== 2. Hoạt động 2: Hình thành kiến thức mới/giải quyết vấn đề
==== 2.1. Hoạt động thành phần 2.1: Giới thiệu về mẫu số liệu ghép nhóm
]
#mt-hd[
Học sinh nắm được khái niệm và cấu trúc của mẫu
  số liệu ghép nhóm.
]
#nd-hd[
Học sinh làm việc cá nhân với SGK.
  - #strong[Nhiệm vụ:] Đọc mục I SGK và tìm hiểu khái niệm \"Mẫu số liệu
    ghép nhóm\" và \"Tần số lớp\".
  - #strong[Ví dụ minh họa:] Giáo viên trình chiếu một #strong[bảng tần
    số mẫu số liệu ghép nhóm] đã hoàn thành (ví dụ: Thống kê điểm thi
    môn Toán của 60 học sinh được chia thành các nhóm điểm \[4; 6), \[6;
    8), \[8; 10\]) và yêu cầu học sinh xác định tần số của từng nhóm.
]
#sp-hd[
Ghi chép khái niệm: Mẫu số liệu ghép nhóm là mẫu
  được trình bày dưới dạng bảng tần số với các #strong[lớp] (khoảng) và
  #strong[tần số lớp] tương ứng.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Học sinh đọc SGK.
  - #strong[Thực hiện nhiệm vụ:] Học sinh tự ghi nhận khái niệm.
  - #strong[Báo cáo, thảo luận:] Giáo viên gọi học sinh trình bày khái
    niệm.
  - #strong[Kết luận, nhận định:] Giáo viên chốt lại kiến thức.

==== 2.2. Hoạt động thành phần 2.2: Ghép nhóm mẫu số liệu
]
#mt-hd[
Học sinh nắm vững quy trình 3 bước để ghép nhóm
  mẫu số liệu (Xác định khoảng biến thiên, Xác định số lớp, Lập bảng
  phân bố tần số ghép nhóm).
]
#nd-hd[
Tổ chức #strong[hoạt động nhóm] (4-5 học
  sinh/nhóm) theo #strong[kỹ thuật khăn trải bàn] để thảo luận quy
  trình.
  - #strong[Nhiệm vụ:] Nghiên cứu mục II (Ghép nhóm mẫu số liệu) trong
    SGK để rút ra #strong[các bước cần thiết] để ghép nhóm một mẫu số
    liệu chưa được phân loại.
  - #strong[Ví dụ cụ thể (Thực hành với Năng lực số):] Cho mẫu số liệu
    thô (ví dụ: thời gian (phút) hoàn thành bài tập của 20 học sinh).
    - #strong[Bước 1 (Áp dụng Năng lực số):] Yêu cầu học sinh #strong[sử
      dụng phần mềm bảng tính (Excel/Google Sheets)] để sắp xếp mẫu số
      liệu và #strong[tìm khoảng biến thiên] (Giá trị lớn nhất - Giá trị
      nhỏ nhất).
    - #strong[Bước 2:] Nhóm đề xuất số lớp $k$ (thường là 5-10).
    - #strong[Bước 3:] Lập bảng tần số ghép nhóm và trình bày trên giấy
      A0.
]
#sp-hd[
  - Sơ đồ các bước ghép nhóm.
  - Kết quả hoàn thành #strong[Bảng phân bố tần số ghép nhóm] cho ví dụ
    cụ thể.
- #strong[d) Tổ chức thực hiện (Phương pháp dạy học tích cực, làm việc
  nhóm):]
  - #strong[Giao nhiệm vụ:] Giáo viên giao mẫu số liệu và yêu cầu nhóm
    thực hiện 3 bước, trong đó bước 1 khuyến khích dùng phần mềm bảng
    tính.
  - #strong[Thực hiện nhiệm vụ:] Học sinh làm việc nhóm, chia sẻ màn
    hình (nếu sử dụng công cụ số) hoặc thảo luận trực tiếp.
  - #strong[Báo cáo, thảo luận (Tăng cường kỹ năng thuyết trình):]
    #strong[2 nhóm] trình bày kết quả (1 nhóm trình bày các bước/quy
    trình, 1 nhóm trình bày bảng kết quả và nhận xét). Các nhóm khác đặt
    câu hỏi và phản biện.
  - #strong[Kết luận, nhận định:] Giáo viên chốt lại quy trình chính xác
    và nhấn mạnh ưu điểm của việc sử dụng công cụ số trong xử lý dữ liệu
    lớn.

=== 3. Hoạt động 3: Luyện tập
]
#mt-hd[
Vận dụng kiến thức và kĩ năng đã học để giải
  quyết các bài tập tương tự, rèn luyện kỹ năng phân tích và tính toán.
]
#nd-hd[
  - #strong[Bài tập 1 (Cá nhân):] Cho một mẫu số liệu thô nhỏ hơn (25-30
    giá trị). Yêu cầu học sinh tự ghép nhóm thành 5 lớp.
  - #strong[Bài tập 2 (Trò chơi học tập):] #strong[\"Tiếp sức thống
    kê\"]. Chia lớp thành 2 đội. Đưa ra một mẫu số liệu. Các thành viên
    lần lượt lên bảng thực hiện từng bước của quy trình ghép nhóm (bước
    1: tìm Max/Min; bước 2: xác định độ dài lớp; bước 3: xác định các
    lớp; bước 4: đếm tần số).
]
#sp-hd[
Đáp án, lời giải và bảng tần số ghép nhóm chính
  xác của các bài tập.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Bài tập 1 làm cá nhân. Bài tập 2 tổ chức
    dưới dạng trò chơi.
  - #strong[Thực hiện nhiệm vụ:] Cá nhân làm việc, sau đó tham gia trò
    chơi theo đội.
  - #strong[Kiểm tra, đánh giá:] Giáo viên theo dõi, nhận xét nhanh kết
    quả cá nhân và kết quả đội chơi.
  - #strong[Tích hợp Năng lực số:] Sau khi có kết quả, giáo viên có thể
    trình chiếu kết quả kiểm tra tự động trên phần mềm (nếu có sẵn) hoặc
    nhanh chóng nhập dữ liệu vào Excel để kiểm tra tính chính xác của
    tần số.

=== 4. Hoạt động 4: Vận dụng
]
#mt-hd[
Phát triển năng lực vận dụng kiến thức thống kê
  vào giải quyết các vấn đề thực tiễn.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Yêu cầu học sinh thu thập một mẫu số liệu thực tế
    ngoài giờ học (ví dụ: tuổi của 30 người hàng xóm/thành viên gia
    đình; thời gian sử dụng điện thoại trung bình mỗi ngày của 20 bạn
    cùng lớp).
  - #strong[Yêu cầu:] Vận dụng quy trình đã học để lập #strong[Bảng phân
    bố tần số ghép nhóm] cho mẫu số liệu đã thu thập.
]
#sp-hd[
Bài báo cáo (có thể là bài viết, slide trình
  chiếu hoặc #strong[Sơ đồ tư duy]) trình bày: 1. Mẫu số liệu thô. 2.
  Bảng phân bố tần số ghép nhóm. 3. Nhận xét sơ bộ về mẫu số liệu (ví
  dụ: \"Phần lớn thời gian sử dụng điện thoại rơi vào khoảng \[x, y)\").
]
#tc-hd[
Giao nhiệm vụ về nhà. Thu báo cáo vào
  tiết học sau để trao đổi, chia sẻ và đánh giá.

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
