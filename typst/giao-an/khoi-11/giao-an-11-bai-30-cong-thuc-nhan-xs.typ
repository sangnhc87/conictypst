// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 30 Công thức nhân XS",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được định nghĩa và tính chất của #strong[hai biến cố độc lập].
- Phát biểu được #strong[công thức nhân xác suất] cho hai biến cố độc
  lập.
- Vận dụng được công thức nhân xác suất cho hai biến cố độc lập để giải
  quyết các bài toán xác suất đơn giản.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động, tích cực tìm hiểu kiến thức về
    biến cố độc lập và công thức nhân xác suất.
  - #strong[Giao tiếp và hợp tác:] Thảo luận nhóm để giải quyết các bài
    tập và hoàn thành nhiệm vụ học tập.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống thực tế
    và vận dụng kiến thức để giải quyết vấn đề.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Nhận biết và phân
    biệt được hai biến cố độc lập. Lập luận để xây dựng công thức nhân
    xác suất.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các tình huống
    thực tế liên quan đến biến cố độc lập bằng ngôn ngữ xác suất.
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng công thức để
    tính xác suất trong các bài toán thực tế.
- #strong[Năng lực số] (Theo TT 02/2025/TT-BGDĐT):
  - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
  - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
    tin và nội dung trong môi trường số.
  - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin
    và nội dung này cũng như điều hướng giữa chúng.
  - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  đầy đủ nhiệm vụ được giao.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ của bản thân và công
  việc nhóm; trung thực trong quá trình giải bài tập và báo cáo kết quả.
- #strong[Tự tin:] Mạnh dạn trình bày ý kiến, đặt câu hỏi và phản biện.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu (hoặc TV), máy tính có kết nối
  mạng, phiếu học tập, bộ công cụ tạo sơ đồ tư duy trực tuyến (ví dụ:
  MindMeister, Miro) hoặc giấy A0, bút dạ.
- #strong[Học liệu:] Sách giáo khoa Toán 11, tài liệu tham khảo, một
  video ngắn (2-3 phút) hoặc hình ảnh mô phỏng về các thí nghiệm độc lập
  (ví dụ: gieo xúc xắc và tung đồng xu), một số hộp đựng bi hoặc thẻ để
  tổ chức trò chơi.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "Khởi động")
#mt-hd[
Tạo hứng thú, khơi gợi kiến thức nền về xác suất
  và giới thiệu vấn đề cần giải quyết: #strong[Làm thế nào để tính xác
  suất đồng thời xảy ra của hai biến cố khi sự xảy ra của biến cố này
  không ảnh hưởng đến biến cố kia?]
]
#nd-hd[
  - Giáo viên (GV) tổ chức trò chơi học tập nhỏ (5 phút): #strong[\"Thử
    thách Tung - Gieo\"].
  - GV chuẩn bị một đồng xu và một xúc xắc.
  - GV đặt vấn đề:
    - Biến cố $A$: Xuất hiện mặt Sấp khi tung đồng xu.
    - Biến cố $B$: Xuất hiện mặt 6 chấm khi gieo xúc xắc.
  - Yêu cầu học sinh (HS) thảo luận nhóm 2: \"Xác định $P\(A\)$,
    $P\(B\)$ và dự đoán (hoặc tính bằng kiến thức đã học) xác suất để
    đồng thời xảy ra cả $A$ và $B$ ($P\(A inter B\)$).
]
#sp-hd[
  - $P\(A\)= 1 / 2$.
  - $P\(B\)= 1 / 6$.
  - Dự đoán/Kết quả: $P\(A inter B\)= 1 / 12$ (Đây là kết quả HS cần đạt
    được để làm cơ sở cho việc hình thành công thức).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình bày trò chơi và câu
    hỏi thảo luận, yêu cầu HS ghi lại kết quả ra phiếu học tập.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận nhanh trong 2
    phút. GV quan sát, hỗ trợ nhóm còn lúng túng (gợi ý về không gian
    mẫu của từng thí nghiệm riêng rẽ).
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 nhóm trình bày kết
    quả và cách tính.
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt lại kết quả $1 / 12$
    và đặt vấn đề: \"Có mối liên hệ gì giữa $P\(A\)$, $P\(B\)$ và
    $P\(A inter B\)$ trong trường hợp này? Chúng ta sẽ tìm hiểu công
    thức tổng quát cho trường hợp hai biến cố không ảnh hưởng lẫn
    nhau.\"

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "Khám phá và Chiếm lĩnh")
==== 2.1. Hoạt động thành phần: Công thức nhân xác suất cho hai biến cố độc lập
#mt-hd[
  - HS nhận biết, phân biệt được #strong[hai biến cố độc lập].
  - HS xây dựng được #strong[công thức nhân xác suất] cho hai biến cố
    độc lập: $P\(A inter B\)= P\(A\)dot.op P\(B\)$.
]
#nd-hd[
  - #strong[Nhiệm vụ 1 (Định nghĩa):] HS làm việc cá nhân với SGK để tìm
    hiểu định nghĩa #strong[hai biến cố độc lập].
  - #strong[Nhiệm vụ 2 (Công thức):] HS quay lại với Ví dụ ở Hoạt động
    1, đối chiếu với công thức $P\(A\)dot.op P\(B\)$ và rút ra nhận xét.
    GV dẫn dắt HS chứng minh bằng công thức xác suất có điều kiện (nếu
    cần) hoặc trực quan bằng cách đếm số phần tử của không gian mẫu kết
    hợp.
  - #strong[Nhiệm vụ 3 (Mô hình hóa/Tích hợp NL Số):] HS tìm kiếm ví dụ
    về biến cố độc lập trong thực tế trên mạng Internet (sử dụng điện
    thoại/máy tính cá nhân) và chia sẻ trong nhóm. (Tích hợp NL số:
    #strong[NL số 1.1: Khai thác và xử lí thông tin số] - Tìm kiếm, thu
    thập thông tin về biến cố độc lập).
]
#sp-hd[
  - Định nghĩa chính xác về hai biến cố độc lập.
  - Ghi nhớ công thức: $P\(A inter B\)= P\(A\)dot.op P\(B\)$.
  - Bảng tổng hợp ví dụ thực tế về biến cố độc lập (ví dụ: Hai lần rút
    bài có hoàn lại, hai người cùng bắn súng...).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV yêu cầu HS thực hiện các
    Nhiệm vụ 1, 2, 3.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc cá nhân và thảo
    luận nhóm 4. GV theo dõi, hỗ trợ, đặc biệt với Nhiệm vụ 3 (tìm kiếm
    thông tin số), dự kiến HS có thể gặp khó khăn trong việc phân biệt
    độc lập và xung khắc, GV cần nhấn mạnh sự khác biệt.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời đại diện các nhóm lên
    trình bày định nghĩa, công thức và các ví dụ tìm được (có thể trình
    chiếu kết quả tìm kiếm).
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt lại kiến thức:
    #strong[Định nghĩa hai biến cố độc lập] và #strong[Công thức nhân
    xác suất].

==== 2.2. Hoạt động thành phần: Vận dụng (Luyện tập)
]
#mt-hd[
HS vận dụng công thức nhân xác suất cho hai biến
  cố độc lập để giải quyết các bài tập.
]
#nd-hd[
  - #strong[Ví dụ minh họa:] Một xạ thủ $A$ bắn trúng mục tiêu với xác
    suất $P\(A\)= 0.8$. Một xạ thủ $B$ bắn trúng mục tiêu với xác suất
    $P\(B\)= 0.7$. Giả sử hai xạ thủ bắn độc lập với nhau. Tính xác suất
    để:
    - Cả hai xạ thủ đều bắn trúng mục tiêu.
    - Cả hai xạ thủ đều bắn trượt mục tiêu.
    - Có ít nhất một xạ thủ bắn trúng mục tiêu.
]
#sp-hd[
  - Lời giải chính xác các phần của Ví dụ minh họa:
    - $P\(upright("Cả hai trúng")\)= P\(A\)dot.op P\(B\)= 0.8 dot.op 0.7 = 0.56$.
    - $P\(upright("Cả hai trượt")\)= P\(macron(A)\)dot.op P\(macron(B)\)= 0.2 dot.op 0.3 = 0.06$.
    - $P\(upright("Ít nhất một trúng")\)= 1 - P\(upright("Cả hai trượt")\)= 1 - 0.06 = 0.94$.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình bày Ví dụ minh họa,
    yêu cầu HS làm việc cá nhân để giải.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS tự giải. GV theo dõi, nhắc
    nhở về việc sử dụng biến cố đối lập.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời một HS lên bảng trình
    bày lời giải chi tiết.
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, sửa chữa và đánh
    giá kết quả thực hiện.

]
#hd("3", "Luyện tập", "Thực hành - Tăng cường kĩ năng")
#mt-hd[
Củng cố kiến thức và phát triển kĩ năng vận dụng
  công thức nhân xác suất thông qua làm việc nhóm và sử dụng công cụ
  trực quan.
]
#nd-hd[
  - GV giao cho HS các bài tập tổng hợp và yêu cầu #strong[phân tích và
    tổng hợp thông tin qua sơ đồ tư duy].
  - #strong[Bài tập ví dụ:] Có hai hộp đựng bi. Hộp I có 4 bi đỏ, 6 bi
    xanh. Hộp II có 3 bi đỏ, 7 bi xanh. Lấy ngẫu nhiên từ mỗi hộp ra một
    bi. Tính xác suất để:
    - a) Cả hai bi đều là bi đỏ.
    - b) Hai bi có màu khác nhau.
  - Yêu cầu: Nhóm 1 và 2 giải câu a), Nhóm 3 và 4 giải câu b). Sau khi
    giải xong, các nhóm sử dụng #strong[công cụ tạo sơ đồ tư duy trực
    tuyến] hoặc giấy A0 để trình bày #strong[toàn bộ quy trình giải bài
    tập] (gồm: Xác định biến cố, tính xác suất thành phần, áp dụng công
    thức). (Tích hợp NL số: #strong[NL số 2.2: Sáng tạo và cộng tác bằng
    công nghệ số] - Sử dụng công cụ số để trình bày, hợp tác tạo Sơ đồ
    tư duy).
]
#sp-hd[
  - Sơ đồ tư duy hoàn chỉnh, khoa học, thể hiện rõ quy trình giải:
    - a)
      $P\(upright("Cả hai đỏ")\)= P\(upright("Đỏ I")\)dot.op P\(upright("Đỏ II")\)= 4 / 10 dot.op 3 / 10 = 0.12$.
    - b)
      $P\(upright("Khác màu")\)= P\(upright("Đỏ I, Xanh II")\)+ P\(upright("Xanh I, Đỏ II")\)= 4 / 10 dot.op 7 / 10 + 6 / 10 dot.op 3 / 10 = 0.28 + 0.18 = 0.46$.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV chia lớp thành 4 nhóm,
    giao nhiệm vụ và yêu cầu về hình thức sản phẩm (Sơ đồ tư duy).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc nhóm (15 phút). GV
    theo dõi, hỗ trợ về mặt toán học và kĩ thuật sử dụng công cụ số.
  - #strong[Bước 3: Báo cáo, thảo luận:] Đại diện nhóm lên trình bày (có
    thể trình chiếu Sơ đồ tư duy). Các nhóm khác lắng nghe, phản biện.
    (Tăng cường kĩ năng giao tiếp, thuyết trình).
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, đánh giá sản phẩm
    (chú trọng tiêu chí: #strong[tính đúng đắn của toán học],
    #strong[tính logic/khoa học của sơ đồ tư duy], #strong[kĩ năng trình
    bày]) và chốt lại các lỗi sai phổ biến.

]
#hd("4", "Vận dụng", "Thực tiễn")
#mt-hd[
Phát triển năng lực vận dụng kiến thức vào thực
  tiễn, thấy được ý nghĩa của công thức nhân xác suất trong đời sống.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Em hãy tìm một tình huống trong thực tế (trong
    lĩnh vực kỹ thuật, y tế, đời sống...) mà việc tính xác suất xảy ra
    của hai sự kiện là độc lập. (Ví dụ: Xác suất hệ thống an ninh mạng
    bị tấn công cùng lúc với xác suất một máy chủ bị lỗi).
  - Yêu cầu HS đặt một bài toán thực tế cho tình huống đó và giải quyết
    bài toán bằng Công thức nhân xác suất.
]
#sp-hd[
Báo cáo (có thể là bài viết, video ngắn, hoặc
  slide) trình bày tình huống thực tiễn, mô hình xác suất tương ứng và
  lời giải.
]
#tc-hd[
  - GV giao nhiệm vụ về nhà (ngoài giờ học trên lớp).
  - GV hướng dẫn HS có thể sử dụng các công cụ số (ví dụ: Google Docs,
    PowerPoint, Canva) để xây dựng báo cáo. (Tích hợp NL số: #strong[NL
    số 3.1: An toàn và đạo đức trong môi trường số] - Nhắc nhở HS sử
    dụng nguồn thông tin đáng tin cậy, trích dẫn nguồn khi tìm kiếm tư
    liệu thực tế).
  - GV quy định thời hạn nộp báo cáo (ví dụ: vào tiết học sau). GV sẽ
    dành thời gian phù hợp (5-10 phút) vào tiết học tiếp theo để học
    sinh trao đổi, chia sẻ và đánh giá các báo cáo tiêu biểu.

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
