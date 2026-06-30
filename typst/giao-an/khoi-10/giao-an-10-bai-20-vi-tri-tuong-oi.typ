// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 20 Vị trí tương đối",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Xác định được #strong[vị trí tương đối] của hai đường thẳng.
- Tính được #strong[góc giữa hai đường thẳng] khi biết phương trình của
  chúng.
- Tính được #strong[khoảng cách] từ một điểm đến một đường thẳng.
- Vận dụng công thức và kiến thức đã học để giải quyết các bài tập liên
  quan.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến
    thức mới về vị trí tương đối, góc và khoảng cách thông qua SGK và
    tài liệu học tập.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia thảo luận
    nhóm, trình bày ý kiến, báo cáo sản phẩm học tập và hợp tác hiệu quả
    trong làm việc nhóm để hoàn thành nhiệm vụ.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp
    thông tin, đề xuất và lựa chọn phương pháp giải quyết các bài toán
    hình học phẳng liên quan.
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận toán học:] Thực hiện các thao
    tác tư duy (phân tích, tổng hợp) để thiết lập và chứng minh các công
    thức liên quan.
  - #strong[Năng lực mô hình hoá toán học:] Thiết lập mô hình toán học
    (sử dụng phương trình đường thẳng, tọa độ) để mô tả và giải quyết
    các vấn đề thực tiễn liên quan đến vị trí tương đối, góc và khoảng
    cách.
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán:] Sử dụng máy
    tính cầm tay, phần mềm hình học động (như #strong[GeoGebra]) để kiểm
    tra, trực quan hóa và giải quyết các bài toán liên quan.
- #strong[Năng lực số (theo Thông tư số 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  tốt nhiệm vụ được giao.
- #strong[Trách nhiệm:] Có trách nhiệm với bản thân, nhóm và kết quả học
  tập; nghiêm túc trong việc ghi chép và thực hiện bài tập về nhà.
- #strong[Trung thực:] Trung thực, khách quan trong báo cáo kết quả thực
  hiện nhiệm vụ.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
+ #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính có kết nối mạng,
  phiếu học tập, bảng phụ/giấy A0, bút dạ.
+ #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - #strong[Phần mềm GeoGebra] (dùng để trực quan hóa vị trí tương đối,
    góc và khoảng cách).
  - Video/hình ảnh minh họa ứng dụng thực tiễn của góc và khoảng cách
    trong xây dựng, kiến trúc, giao thông (chuẩn bị trước).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Nhiệm vụ học tập/Mở đầu", "15 phút")
#mt-hd[
  đề/nhiệm vụ cụ thể cần giải quyết trong bài học hoặc xác định rõ cách
  thức giải quyết vấn đề/thực hiện nhiệm vụ trong các hoạt động tiếp
  theo của bài học.
  - Tạo hứng thú, giúp học sinh huy động kiến thức đã học về phương
    trình đường thẳng và xác định vấn đề cần giải quyết trong bài học.
]
#nd-hd[
  sinh phải thực hiện (xử lí tình huống, câu hỏi, bài tập, thí nghiệm,
  thực hành…) để xác định vấn đề cần giải quyết/nhiệm vụ học tập cần
  thực hiện và đề xuất giải pháp giải quyết vấn đề/cách thức thực hiện
  nhiệm vụ.
  - Tổ chức trò chơi #strong[\"Khám phá ứng dụng\"].
  - #strong[Nhiệm vụ:] Giáo viên trình chiếu một hình ảnh/video về hai
    đường ray tàu hỏa song song/cắt nhau hoặc một cây cầu (là đường
    thẳng) bắc qua sông (là một điểm trên bản đồ).
  - #strong[Yêu cầu:] Học sinh thảo luận theo nhóm 3-4 người trong 5
    phút để trả lời câu hỏi:
    - Hai đường thẳng trong hình ảnh có những vị trí tương đối nào? Làm
      thế nào để xác định được điều đó bằng toán học (qua phương trình)?
    - Làm thế nào để tính được khoảng cách từ một điểm (ví dụ: một trạm
      gác) đến đường thẳng (đường ray)?
]
#sp-hd[
  thức của sản phẩm hoạt động theo nội dung yêu cầu/nhiệm vụ mà học sinh
  phải hoàn thành:
  - Câu trả lời của học sinh về các vị trí tương đối của hai đường
    thẳng; nhận định về các vấn đề toán học cần giải quyết (xác định vị
    trí tương đối, tính góc, tính khoảng cách).
]
#tc-hd[
  động học cho học sinh từ chuyển giao nhiệm vụ, theo dõi, hướng dẫn,
  kiểm tra, đánh giá quá trình và kết quả thực hiện nhiệm vụ thông qua
  sản phẩm học tập.
  - #strong[Bước 1: Giao nhiệm vụ học tập:] Giáo viên chiếu hình
    ảnh/video, nêu câu hỏi và yêu cầu học sinh thảo luận nhóm.
  - #strong[Bước 2: Thực hiện nhiệm vụ (học sinh thực hiện; giáo viên
    theo dõi, hỗ trợ):] Học sinh thảo luận và ghi chép ý kiến. Giáo viên
    quan sát, dự kiến khó khăn (HS quên trường hợp trùng nhau) và hỗ trợ
    bằng cách gợi ý liên hệ với hệ phương trình.
  - #strong[Tích hợp Năng lực số:] Yêu cầu học sinh sử dụng điện
    thoại/máy tính bảng tra cứu nhanh hình ảnh/video về các ứng dụng
    thực tế khác của \"góc giữa hai đường thẳng\" hoặc \"khoảng cách từ
    điểm đến đường thẳng\". Biểu hiện NL số: #strong[Sử dụng và khai
    thác công cụ, phương tiện kỹ thuật số] để thu thập thông tin liên
    quan đến chủ đề bài học.
  - #strong[Bước 3: Báo cáo, thảo luận (giáo viên tổ chức, điều hành;
    học sinh báo cáo, thảo luận):] Mời đại diện 1-2 nhóm trình bày.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chốt lại các vấn đề
    cần giải quyết: (1) Vị trí tương đối, (2) Góc giữa hai đường thẳng,
    (3) Khoảng cách từ một điểm đến một đường thẳng. Giới thiệu nội dung
    bài học mới.

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "85 phút")
==== 2.1. Hoạt động thành phần 2.1: Vị trí tương đối giữa hai đường thẳng (25 phút)
#mt-hd[
  học tập để chiếm lĩnh kiến thức mới/giải quyết vấn đề/thực hiện nhiệm
  vụ đặt ra từ Hoạt động 1.
  - Học sinh nắm vững cách xác định vị trí tương đối của hai đường thẳng
    thông qua việc xét số nghiệm của hệ phương trình.
]
#nd-hd[
  sinh làm việc với sách giáo khoa, thiết bị dạy học, học liệu cụ thể
  (đọc/xem/nghe/nói/làm) để chiếm lĩnh/vận dụng kiến thức để giải quyết
  vấn đề/nhiệm vụ học tập đã đặt ra từ Hoạt động 1.
  - #strong[Phương pháp:] #strong[Kỹ thuật khăn trải bàn] (lấy học sinh
    làm trung tâm).
  - #strong[Nhiệm vụ:] Cho hai đường thẳng
    $Delta_1 : a_1 x + b_1 y + c_1 = 0$ và
    $Delta_2 : a_2 x + b_2 y + c_2 = 0$.
  - #strong[Yêu cầu 1:] Thảo luận nhóm để liên hệ việc xác định vị trí
    tương đối của $Delta_1$ và $Delta_2$ với việc xét số nghiệm của hệ
    phương trình ${a_1 x + b_1 y + c_1 = 0\
    a_2 x + b_2 y + c_2 = 0 med$.
  - #strong[Yêu cầu 2 (Ví dụ minh họa):] Cho $Delta_1 : x - 2 y + 3 = 0$
    và $Delta_2 : 2 x - 4 y + 6 = 0$. Xác định vị trí tương đối của
    chúng.
]
#sp-hd[
  quyết vấn đề/thực hiện nhiệm vụ học tập mà học sinh cần viết ra, trình
  bày được.
  - Kết luận về 3 trường hợp vị trí tương đối (cắt nhau, song song,
    trùng nhau) và điều kiện tương ứng.
  - Kết quả ví dụ: Hai đường thẳng trùng nhau (Hệ có vô số nghiệm).
]
#tc-hd[
  quá trình và kết quả thực hiện hoạt động của học sinh.
  - #strong[Tích hợp Năng lực số:] Yêu cầu học sinh sử dụng
    #strong[GeoGebra] vẽ hai đường thẳng trong ví dụ minh họa để kiểm
    tra và trực quan hóa kết quả. Biểu hiện NL số: #strong[Vận dụng công
    cụ và phương tiện kỹ thuật số] để kiểm tra và đánh giá tính hợp lí
    của lời giải.

==== 2.2. Hoạt động thành phần 2.2: Góc giữa hai đường thẳng (30 phút)
]
#mt-hd[
  thẳng dựa trên vector pháp tuyến hoặc vector chỉ phương.
]
#nd-hd[
  có hướng dẫn].
  - #strong[Nhiệm vụ:]
    - #strong[Bước 1 (Khám phá):] Cho hai đường thẳng $Delta_1$ và
      $Delta_2$ có VTPT là $arrow(n)_1$ và $arrow(n)_2$. Yêu cầu học
      sinh thảo luận và tìm mối liên hệ giữa góc $phi$ giữa $Delta_1$ và
      $Delta_2$ với góc $alpha$ giữa hai VTPT $arrow(n)_1$ và
      $arrow(n)_2$.
    - #strong[Bước 2 (Thiết lập công thức):] Từ đó, thiết lập công thức
      tính
      $cos phi = frac(\|arrow(n)_1 dot.op arrow(n)_2\|, \|arrow(n)_1\|dot.op\|arrow(n)_2\|)$.
    - #strong[Ví dụ minh họa:] Tính góc $phi$ giữa
      $Delta_1 : x + 2 y - 1 = 0$ và $Delta_2 : x - 3 y + 2 = 0$.
// ]
#sp-hd[
  - Kết quả ví dụ: $cos phi = 1 / sqrt(2)$, suy ra $phi = 45^compose$.
]
#tc-hd[
  - Giáo viên hướng dẫn học sinh liên hệ giữa góc giữa hai VTPT và góc
    giữa hai đường thẳng (chú ý góc nhọn).
  - Giáo viên sử dụng #strong[sơ đồ tư duy] để trực quan hóa mối liên hệ
    giữa các khái niệm (đường thẳng - VTPT - góc giữa VTPT - góc giữa
    hai đường thẳng) và khuyến khích học sinh báo cáo kết quả theo sơ đồ
    tư duy.

==== 2.3. Hoạt động thành phần 2.3: Khoảng cách từ một điểm đến một đường thẳng (30 phút)
]
#mt-hd[
  điểm $M_0\(x_0\;y_0\)$ đến đường thẳng $Delta : a x + b y + c = 0$.
]
#nd-hd[
  vấn đề].
  - #strong[Nhiệm vụ:] #strong[Bước 1 (Đặt vấn đề):] Cho điểm
    $M_0\(x_0\;y_0\)$ và đường thẳng $Delta : a x + b y + c = 0$. Tìm
    công thức tính khoảng cách $d\(M_0\,Delta\)$.
  - #strong[Bước 2 (Giải quyết):] Giáo viên cung cấp công thức
    $d\(M_0\,Delta\)= frac(divides a x_0 + b y_0 + c divides, sqrt(a^2 + b^2))$và
    hướng dẫn học sinh kiểm tra công thức với một trường hợp đặc biệt.
  - #strong[Ví dụ minh họa:] Tính khoảng cách từ điểm $M\(- 1\;2\)$đến
// ]
#sp-hd[
    thức tính khoảng cách từ một điểm đến một đường thẳng.

  - Kết quả ví dụ: $d\(M\,Delta\)= 6 / 5$.

]
#tc-hd[
  - Giáo viên giao nhiệm vụ và yêu cầu các nhóm tự nghiên cứu/kiểm tra
    công thức.
  - Mời 1-2 nhóm trình bày lời giải ví dụ.
  - Giáo viên kết luận, nhấn mạnh ý nghĩa của công thức và ứng dụng.

]
#hd("3", "Luyện tập", "25 phút")
#mt-hd[
  cầu phát triển các kĩ năng vận dụng kiến thức cho học sinh.
  - Vận dụng kiến thức đã học để giải các bài tập cơ bản, rèn luyện kỹ
    năng tính toán chính xác và kỹ năng giải quyết các dạng toán liên
    quan.
]
#nd-hd[
  tập, bài thực hành, thí nghiệm giao cho học sinh thực hiện.
  - #strong[Phương pháp:] #strong[Trò chơi học tập: \"Tiếp sức Toán
    học\"] (Phát triển kỹ năng làm việc nhóm, giao tiếp).
  - #strong[Nhiệm vụ:] Chia lớp thành 4-5 đội. Mỗi đội nhận một bộ phiếu
    bài tập (3-4 câu) bao gồm các dạng:
    - #strong[Dạng 1:] Xét vị trí tương đối của hai đường thẳng.
    - #strong[Dạng 2:] Tính góc giữa hai đường thẳng.
    - #strong[Dạng 3:] Tính khoảng cách từ một điểm đến một đường thẳng.
  - #strong[Quy tắc:] Mỗi thành viên trong nhóm chỉ thực hiện một bước
    giải rồi chuyển cho thành viên tiếp theo.
]
#sp-hd[
  - Lời giải chính xác của các bài tập trong phiếu học tập.
]
#tc-hd[
  sinh; hướng dẫn hỗ trợ học sinh thực hiện; kiểm tra, đánh giá kết quả
  thực hiện.
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên phổ biến luật chơi và giao
    phiếu bài tập.
  - #strong[Bước 2: Học sinh thực hiện:] Học sinh làm việc nhóm, luân
    phiên giải bài. Giáo viên quan sát, hỗ trợ và chấm điểm nhanh kết
    quả.
  - #strong[Bước 3: Tổng kết:] Tuyên bố đội thắng cuộc và chữa nhanh các
    lỗi sai điển hình.
  - #strong[Tích hợp Năng lực số:] Yêu cầu học sinh sử dụng máy tính cầm
    tay để kiểm tra kết quả tính toán cuối cùng. Biểu hiện NL số:
    #strong[Sử dụng và khai thác công cụ, phương tiện kỹ thuật số] để
    tính toán chính xác.

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
  thông qua nhiệm vụ/yêu cầu vận dụng kiến thức, kĩ năng vào thực tiễn
  (theo từng bài hoặc nhóm bài có nội dung phù hợp).
  - Phát triển năng lực mô hình hóa, giúp học sinh thấy được ứng dụng
    của kiến thức vào giải quyết các vấn đề thực tiễn.
]
#nd-hd[
  vấn đề/tình huống trong thực tiễn gắn với nội dung bài học và vận dụng
  kiến thức mới học để giải quyết.
  - #strong[Nhiệm vụ thực tiễn] (Thực hiện ngoài giờ học): Hãy
    #strong[phát hiện/đề xuất] một tình huống thực tế (trong kiến trúc,
    xây dựng, giao thông,...) mà việc xác định #strong[góc giữa hai
    đường thẳng] hoặc #strong[khoảng cách từ một điểm đến một đường
    thẳng] có ý nghĩa quan trọng.
]
#sp-hd[
  phát hiện và giải quyết tình huống/vấn đề trong thực tiễn.
  - Báo cáo (dưới dạng bài viết, PowerPoint, Video clip ngắn) trình bày
    rõ tình huống thực tế, mô hình hóa toán học và lời giải (nếu có).
]
#tc-hd[
  học trên lớp và nộp báo cáo để trao đổi, chia sẻ và đánh giá vào các
  thời điểm phù hợp trong kế hoạch giáo dục môn học/hoạt động giáo dục
  của giáo viên.
  - #strong[Tích hợp Năng lực số:] Yêu cầu học sinh sử dụng các công cụ
    kỹ thuật số (như Word, PowerPoint, Canva) để #strong[thiết kế báo
    cáo]. Biểu hiện NL số: #strong[Tạo ra và tương tác với nội dung số]
    thông qua việc xây dựng bài trình bày về ứng dụng của kiến thức.

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
