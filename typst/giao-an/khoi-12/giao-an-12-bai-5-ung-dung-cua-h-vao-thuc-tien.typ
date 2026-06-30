// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 5 Ứng dụng của ĐH vào thực tiễn",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Nắm vững] khái niệm tốc độ thay đổi tức thời của một đại lượng
  (liên quan đến đạo hàm).
- #strong[Trình bày được] quy trình giải quyết bài toán tối ưu hóa (tìm
  giá trị lớn nhất, nhỏ nhất của hàm số) trong thực tiễn.
- #strong[Áp dụng] đạo hàm để giải quyết các bài toán thực tiễn về tốc
  độ thay đổi và tối ưu hóa trong các lĩnh vực như kinh tế, vật lí, sinh
  học.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm kiếm và khai thác
    thông tin từ sách giáo khoa, tài liệu tham khảo và các nguồn tài
    nguyên số (Internet) để giải quyết các nhiệm vụ học tập.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày ý tưởng, đặt câu hỏi, lắng nghe và phản biện một cách xây
    dựng.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực giải quyết vấn đề Toán học:] Phân tích, chuyển hóa
    được các vấn đề thực tiễn thành bài toán Toán học (hàm số, tìm giá
    trị lớn nhất/nhỏ nhất), và sử dụng công cụ đạo hàm để giải quyết.
  - #strong[Năng lực mô hình hóa Toán học:] Xây dựng được mô hình hàm số
    (ví dụ: hàm chi phí, hàm lợi nhuận, hàm khoảng cách,...) từ tình
    huống thực tế để tìm lời giải.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - #strong[Sử dụng công cụ và phương tiện kĩ thuật số:] Sử dụng phần
    mềm Toán học (ví dụ: GeoGebra, Desmos) hoặc máy tính cầm tay để vẽ
    đồ thị hàm số, tính toán đạo hàm, kiểm tra kết quả tối ưu hóa.
  - #strong[Biểu hiện năng lực số:] #strong[Tìm kiếm và chọn lọc] thông
    tin số phục vụ bài học (ví dụ: tìm kiếm ví dụ thực tế liên quan đến
    tối ưu hóa) và #strong[Sử dụng và tương tác] với các phần mềm số để
    giải bài toán.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, chủ động hoàn thành các nhiệm vụ học tập,
  đặc biệt là các nhiệm vụ vận dụng vào thực tiễn.
- #strong[Trách nhiệm:] Có trách nhiệm trong hoạt động nhóm, trung thực
  trong quá trình tính toán và báo cáo kết quả.
- #strong[Tư duy Toán học:] Có thái độ nghiêm túc, khách quan khi giải
  quyết các vấn đề thực tiễn thông qua lăng kính Toán học.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, màn chiếu, máy tính kết nối
  Internet.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập (in giấy hoặc trực tuyến) với các tình huống thực
    tiễn.
  - Phần mềm Toán học (như GeoGebra, Desmos) để minh họa đồ thị và kiểm
    tra kết quả tối ưu hóa.
  - Các đoạn video/hình ảnh ngắn về các ứng dụng thực tế của tối ưu hóa
    (ví dụ: tối ưu hóa chi phí sản xuất, tối ưu hóa kích thước thùng
    chứa).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
Tên hoạt động: #strong[Khởi động: \"Vì sao phải Tối ưu?\"]

#mt-hd[

  - Giúp học sinh xác định được ý nghĩa của việc tìm kiếm giá trị tối ưu
    (lớn nhất/nhỏ nhất) trong cuộc sống và kinh tế.
  - Tạo hứng thú, kết nối kiến thức đã học (cực trị hàm số) với các bài
    toán thực tiễn.
  - Xác định rõ nhiệm vụ học tập chính: sử dụng đạo hàm để giải quyết
    các vấn đề này.

]
#nd-hd[

  - Giáo viên (GV) trình bày một #strong[Tình huống thực tiễn mở đầu]
    (Sử dụng phương pháp #strong[Nêu vấn đề]): \"Một công ty cần sản
    xuất một thùng đựng hàng hình hộp chữ nhật không nắp từ một tấm bìa
    hình vuông kích thước $60 upright(" cm") times 60 upright(" cm")$
    bằng cách cắt đi bốn hình vuông bằng nhau ở bốn góc rồi gập lên. Hỏi
    phải cắt đi cạnh hình vuông là bao nhiêu để thể tích thùng là
    #strong[lớn nhất]?\"
  - Yêu cầu học sinh suy nghĩ, thảo luận nhóm đôi trong 3 phút: Đề xuất
    phương án giải quyết ban đầu và dự đoán hình thức Toán học cần sử
    dụng.

]
#sp-hd[

  - Ghi nhận ban đầu của học sinh về mối liên hệ giữa bài toán thực tế
    và việc tìm #strong[Giá trị lớn nhất] của một đại lượng (Thể tích).
  - Đề xuất bước đầu về cách giải quyết (ví dụ: thử các giá trị, tìm hàm
    số).

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình bày tình huống (có
    thể sử dụng hình ảnh minh họa ) và giao nhiệm vụ thảo luận nhóm đôi.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh (HS) thảo luận nhóm
    đôi, ghi nhanh ý tưởng.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 nhóm trình bày ý
    tưởng (Dự kiến khó khăn: HS chỉ đưa ra dự đoán mà chưa biết cách mô
    hình hóa bằng hàm số). GV gợi ý: \"Thùng hàng phụ thuộc vào kích
    thước nào? Phải chăng ta cần tìm hàm số Thể tích theo kích thước
    đó?\"
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt lại vấn đề cần giải
    quyết trong bài học: Bài toán này là một ví dụ về #strong[Tối ưu
    hóa]. Để giải quyết, ta cần chuyển hóa nó thành việc tìm
    #strong[GTLN/GTNN] của một hàm số. Đạo hàm là công cụ đắc lực để làm
    việc này.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "120 phút")
Tên hoạt động: #strong[Chiếm lĩnh kiến thức: Đạo hàm và các bài toán
thực tiễn]

==== Hoạt động thành phần 2.1: Tốc độ thay đổi của một đại lượng (45 phút)
#mt-hd[

  - Hiểu rõ ý nghĩa vật lý, kinh tế của đạo hàm là tốc độ thay đổi tức
    thời.
  - Áp dụng công thức đạo hàm để tính tốc độ thay đổi trong các tình
    huống thực tiễn.

]
#nd-hd[

  - GV đặt vấn đề: \"Trong Vật lí, ta đã biết Vận tốc là tốc độ thay đổi
    của Quãng đường. Vậy trong các lĩnh vực khác, đạo hàm còn là tốc độ
    thay đổi của đại lượng nào?\"
  - #strong[Nhiệm vụ:] HS làm việc với SGK, thảo luận nhóm 4 để trả lời
    các câu hỏi:
    - Tốc độ thay đổi trung bình của hàm số $y = f\(x\)$ trên
      $\[x_0\;x_0 + Delta x\]$ là gì?
    - Tốc độ thay đổi tức thời tại $x_0$ được định nghĩa như thế nào?
      (Chính là đạo hàm $f'\(x_0\)$)
    - #strong[Ví dụ ứng dụng:] Một công ty sản xuất máy tính, hàm chi
      phí để sản xuất $x$ máy là $C\(x\)= - 0.01 x^2 + 10 x + 500$
      (triệu đồng).
      - Tính chi phí biên (tốc độ thay đổi của chi phí) khi sản xuất máy
        thứ 100. #strong[\(Chi phí biên chính là] $C'\(x\)$#strong[).]

]
#sp-hd[

  - Khái niệm tốc độ thay đổi tức thời, công thức $f'\(x_0\)$.
  - Kết quả tính toán ví dụ: $C'\(x\)= - 0.02 x + 10$. Chi phí biên tại
    $x = 100$ là $C'\(100\)= 8$ (triệu đồng/máy).

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình bày nội dung và
    giao nhiệm vụ.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc nhóm, phân công tìm
    hiểu khái niệm và giải ví dụ. #strong[Tích hợp năng lực số:] Khuyến
    khích HS sử dụng công cụ tính đạo hàm trực tuyến hoặc máy tính cầm
    tay để kiểm tra kết quả tính $C'\(x\)$ và $C'\(100\)$.
  - #strong[Bước 3: Báo cáo, thảo luận:] Đại diện nhóm trình bày. GV
    nhận xét, chốt kiến thức: Đạo hàm
    $upright(bold(f))^(upright(bold(')))\(x\)$ là #strong[Tốc độ thay
    đổi tức thời] của đại lượng $f\(x\)$ theo $x$.

==== Hoạt động thành phần 2.2: Một vài bài toán tối ưu hoá đơn giản (75 phút)
]
#mt-hd[

  - Nắm vững các bước giải một bài toán tối ưu hóa trong thực tiễn.
  - Vận dụng linh hoạt kiến thức tìm GTLN, GTNN của hàm số để giải quyết
    các bài toán cụ thể.

]
#nd-hd[

  - #strong[Nhiệm vụ 1: Xây dựng quy trình (Sử dụng sơ đồ tư duy):] HS
    thảo luận nhóm 4 để xây dựng quy trình tổng quát giải quyết bài toán
    Tối ưu hóa. (Dự kiến: 1. Đặt biến và tìm hàm mục tiêu, 2. Tìm miền
    xác định, 3. Dùng đạo hàm để tìm GTLN/GTNN, 4. Kết luận).
  - #strong[Nhiệm vụ 2: Áp dụng Ví dụ Tối ưu hóa:] Quay lại bài toán Mở
    đầu (Thùng hàng): \"Một công ty cần sản xuất một thùng đựng hàng
    hình hộp chữ nhật không nắp từ một tấm bìa hình vuông kích thước
    $60 upright(" cm") times 60 upright(" cm")$\...\".
    - Yêu cầu HS thực hiện các bước:
      - #strong[Bước 1:] Đặt $x$ là cạnh hình vuông bị cắt đi
        ($0 < x < 30$). Lập hàm Thể tích $V\(x\)$.
      - #strong[Bước 2:] Tìm GTLN của $V\(x\)$ trên $\(0\;30\)$ bằng đạo
        hàm.

]
#sp-hd[

  - #strong[Quy trình giải bài toán Tối ưu hóa] (có thể trình bày dưới
    dạng sơ đồ tư duy). \* Kết quả bài toán thùng hàng:
    $V\(x\)= x\(60 - 2 x\)^2$. $V'\(x\)= 12\(x - 30\)\(x - 10\)$. GTLN
    tại $x = 10 upright(" cm")$.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ 1 (Quy trình):] GV giao nhiệm vụ xây
    dựng quy trình, khuyến khích HS sử dụng các công cụ số (ví dụ: ứng
    dụng vẽ Sơ đồ tư duy) để trình bày.
  - #strong[Bước 2: Thực hiện nhiệm vụ 1:] HS làm việc nhóm. GV theo
    dõi, hỗ trợ.
  - #strong[Bước 3: Báo cáo, thảo luận:] Đại diện nhóm trình bày sơ đồ
    tư duy. GV chuẩn hóa quy trình.
  - #strong[Bước 4: Giao nhiệm vụ 2 (Áp dụng):] HS giải bài toán thùng
    hàng. #strong[Tích hợp năng lực số:] Khuyến khích HS sử dụng phần
    mềm GeoGebra/Desmos để #strong[vẽ đồ thị] hàm $V\(x\)$ và
    #strong[kiểm tra lại] kết quả GTLN/GTNN tìm được.
  - #strong[Bước 5: Kết luận, nhận định:] GV chốt lại lời giải, nhấn
    mạnh việc chuyển hóa từ thực tế sang hàm số là bước quan trọng nhất.

]
#hd("3", "Luyện tập", "30 phút")
Tên hoạt động: #strong[Thử thách Toán học]

#mt-hd[

  - Củng cố khả năng mô hình hóa và vận dụng đạo hàm để giải các bài tập
    Tối ưu hóa.
  - Phát triển kĩ năng làm việc nhóm, giao tiếp và giải quyết vấn đề.

]
#nd-hd[

  - #strong[Trò chơi học tập: \"Tiếp sức Tối ưu\"] (Chia lớp thành các
    nhóm).
  - GV đưa ra một chuỗi 3 bài tập vận dụng (Ví dụ: Tối ưu hóa lợi
    nhuận/chi phí; Tối ưu hóa khoảng cách; Tối ưu hóa diện tích/thể tích
    hình học). Mỗi nhóm lần lượt cử thành viên lên bảng giải từng bước.
  - #strong[Ví dụ bài tập:] Một hộ nông dân muốn xây một hàng rào dài
    $120 upright(" m")$ để rào quanh một khu đất hình chữ nhật. Cần rào
    khu đất với kích thước (dài x rộng) bao nhiêu để diện tích khu đất
    là #strong[lớn nhất]?

]
#sp-hd[

  - Lời giải chính xác của các bài tập luyện tập (Ví dụ: Bài toán rào
    đất có $x = y = 30 upright(" m")$ cho diện tích lớn nhất
    $900 upright(" m")^2$).
  - Bảng ghi nhận kết quả và điểm số của các nhóm.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ:] GV phổ biến luật chơi.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Các nhóm thảo luận, cử người
    thực hiện. (Dự kiến khó khăn: HS có thể nhầm lẫn giữa GTLN và GTNN).
    GV theo dõi, hỗ trợ gợi ý.
  - #strong[Bước 3: Kiểm tra, đánh giá:] GV và HS cùng chữa bài, đánh
    giá kết quả, tuyên dương nhóm chiến thắng. #strong[Đánh giá thường
    xuyên:] GV quan sát, nhận xét quá trình làm việc nhóm, kĩ năng giao
    tiếp và phân tích vấn đề của HS.

]
#hd("4", "Vận dụng", "15 phút - Giao nhiệm vụ ngoài giờ học")
Tên hoạt động: #strong[Vận dụng thực tiễn và Chia sẻ]

#mt-hd[

  - Phát triển năng lực tự chủ và giải quyết vấn đề thông qua việc áp
    dụng kiến thức vào thực tiễn cuộc sống.
  - Thực hành kĩ năng thu thập, phân tích thông tin và thuyết trình (báo
    cáo).

]
#nd-hd[

  - GV giao nhiệm vụ #strong[Vận dụng thực tiễn] (làm ngoài giờ lên
    lớp):
    - #strong[Nhiệm vụ:] Trong cuộc sống hàng ngày hoặc lĩnh vực bạn yêu
      thích (Kinh tế/Xây dựng/Thiết kế/...), hãy tìm kiếm và đề xuất một
      #strong[bài toán Tối ưu hóa] (ví dụ: tối ưu hóa chi phí nguyên vật
      liệu, tối ưu hóa thời gian di chuyển,...) có thể giải quyết bằng
      đạo hàm.
    - Yêu cầu HS:
      - Mô tả tình huống thực tiễn.
      - Lập hàm mục tiêu và điều kiện ràng buộc.
      - Giải quyết bài toán.
      - Trình bày dưới dạng báo cáo (bản mềm hoặc file thuyết trình).

]
#sp-hd[

  - Báo cáo (bản Word, PowerPoint, hoặc video clip) mô tả rõ tình huống
    thực tiễn và lời giải bằng công cụ đạo hàm.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ:] GV giải thích rõ yêu cầu và tiêu chí
    đánh giá cho nhiệm vụ vận dụng (Chú trọng tính sáng tạo của tình
    huống và tính hợp lí của mô hình Toán học).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS tự thực hiện ngoài giờ học,
    tìm kiếm thông tin trên Internet. #strong[Tích hợp năng lực số:] HS
    sử dụng công cụ kĩ thuật số (trình duyệt, phần mềm soạn thảo văn
    bản/thuyết trình) để thu thập, phân tích thông tin và hoàn thành sản
    phẩm.
  - #strong[Bước 3: Nộp báo cáo và Chia sẻ:] HS nộp báo cáo (dự kiến vào
    tiết học sau) để GV tổng hợp, chọn lọc 1-2 báo cáo tiêu biểu để HS
    thuyết trình, chia sẻ vào buổi học tiếp theo. #strong[Đánh giá:] GV
    đánh giá bằng nhận xét quá trình và kết quả thông qua sản phẩm học
    tập.

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
