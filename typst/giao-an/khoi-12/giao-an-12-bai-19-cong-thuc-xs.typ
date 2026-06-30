// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 19 Công thức XS",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm và tính chất của #strong[hệ đầy đủ các biến cố].
- Nêu được công thức xác suất toàn phần và công thức Bayes.
- Áp dụng được công thức xác suất toàn phần để giải quyết các bài toán
  liên quan đến việc tính xác suất của một biến cố khi biết xác suất có
  điều kiện của biến cố đó đối với một hệ đầy đủ các biến cố.
- Áp dụng được công thức Bayes để tính xác suất của một biến cố thuộc hệ
  đầy đủ các biến cố khi biến cố đã xảy ra.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm hiểu và đọc tài liệu về hệ
    đầy đủ các biến cố, công thức xác suất toàn phần, công thức Bayes.
  - #strong[Giao tiếp và hợp tác:] Tích cực tham gia hoạt động nhóm,
    trao đổi, thảo luận để xây dựng kiến thức và giải quyết các bài toán
    xác suất phức tạp.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống thực
    tế, lựa chọn công thức xác suất phù hợp (toàn phần hoặc Bayes) để
    giải quyết vấn đề.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận Toán học:] Phân tích giả thiết
    bài toán, xác định các biến cố, hệ biến cố đầy đủ và mối quan hệ
    giữa chúng; lập luận logic để thiết lập và áp dụng công thức.
  - #strong[Năng lực mô hình hóa Toán học:] Mô hình hóa các tình huống
    thực tiễn (ví dụ: sản xuất, y tế, dự báo) bằng ngôn ngữ xác suất,
    biểu diễn bằng sơ đồ tư duy hoặc cây xác suất.
- #strong[Năng lực số:]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tìm tòi, nghiên cứu các ví dụ và bài tập
  thực tế để hiểu sâu hơn về kiến thức.
- #strong[Trách nhiệm:] Hoàn thành các nhiệm vụ được giao (cá nhân và
  nhóm), có trách nhiệm với sản phẩm học tập của mình.
- #strong[Trung thực:] Thể hiện sự trung thực trong quá trình tính toán
  và báo cáo kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính, phiếu học tập,
  bảng phụ, bút dạ.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 12 - Kết nối tri thức với cuộc sống.
  - Phiếu bài tập mở đầu có tính thực tiễn (Ví dụ: Bài toán về tỉ lệ sản
    phẩm đạt chuẩn của một nhà máy có nhiều dây chuyền sản xuất).
  - #strong[Học liệu số:] Video ngắn (2-3 phút) giới thiệu về ứng dụng
    của công thức Bayes trong y tế (ví dụ: xét nghiệm bệnh) hoặc công
    nghệ; các bài tập trực tuyến (Quiziz/Kahoot) dùng để luyện tập, củng
    cố.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "XÁC ĐỊNH VẤN ĐỀ/NHIỆM VỤ HỌC TẬP/MỞ ĐẦU", "15 phút")
#mt-hd[
Tạo tình huống có vấn đề, giúp học sinh xác định
  được nhu cầu cần thiết phải tính xác suất của một biến cố khi xảy ra
  một chuỗi sự kiện phụ thuộc lẫn nhau, từ đó dẫn đến việc xây dựng công
  thức xác suất toàn phần.
]
#nd-hd[
  - #strong[Tình huống:] Một hộp có 3 loại bi: #strong[Bi xanh] (2
    viên), #strong[Bi đỏ] (3 viên), #strong[Bi vàng] (5 viên). Lấy ngẫu
    nhiên một viên bi từ hộp này, sau đó lại đặt viên bi đó vào lại hộp.
    Nếu viên bi lấy ra là #strong[Bi xanh], ta cho thêm 1 viên
    #strong[Bi đỏ] vào hộp. Nếu viên bi lấy ra là #strong[Bi đỏ] hoặc
    #strong[Bi vàng], ta không cho thêm gì. Cuối cùng, lấy ngẫu nhiên 1
    viên bi từ hộp. Tính xác suất để viên bi lấy ra lần cuối là
    #strong[Bi đỏ].
  - Học sinh làm việc cá nhân và thảo luận cặp đôi để tìm hướng giải
    quyết.
]
#sp-hd[
Câu trả lời hoặc các ý tưởng, nhận xét ban đầu
  về việc giải quyết bài toán; xác định được đây là bài toán tính xác
  suất của một biến cố sau khi đã xảy ra một biến cố khác, đòi hỏi phải
  chia các trường hợp xảy ra ban đầu.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] Giáo viên (GV) trình bày
    tình huống mở đầu, yêu cầu học sinh (HS) đọc và suy nghĩ tìm cách
    giải trong 3 phút.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc cá nhân và trao đổi
    cặp đôi. GV quan sát, khuyến khích HS sử dụng sơ đồ cây (nếu có thể)
    để hình dung. #strong[Dự kiến khó khăn:] HS chưa biết cách kết nối
    các biến cố có điều kiện. #strong[Biện pháp hỗ trợ:] GV gợi ý HS
    chia thành các trường hợp bi lấy ra lần 1.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 HS trình bày ý
    tưởng/cách làm. GV đặt câu hỏi: \"Làm thế nào để kết hợp xác suất
    của các trường hợp lại?\"
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, chưa vội đưa ra
    đáp án, mà khẳng định: Để giải quyết trọn vẹn bài toán này, chúng ta
    cần một công cụ mạnh mẽ hơn, đó là #strong[Công thức xác suất toàn
    phần]. GV chuyển giao nhiệm vụ học tập tiếp theo.

]
#hd("2", "HÌNH THÀNH KIẾN THỨC MỚI/GIẢI QUYẾT VẤN ĐỀ", "100 phút")
Hoạt động này được chia thành 2 hoạt động thành phần để hình thành kiến
thức về hai công thức quan trọng.

===== Hoạt động 2.1: Công thức xác suất toàn phần (45 phút)
#mt-hd[
Giúp học sinh chiếm lĩnh được khái niệm hệ đầy
  đủ các biến cố và xây dựng được công thức xác suất toàn phần.
]
#nd-hd[
  - HS làm việc với SGK, #strong[phát biểu định nghĩa] hệ đầy đủ các
    biến cố (Hệ \$\\\\{H\_1, H\_2, \\dots, H\_n\\\\}\$ là hệ đầy đủ nếu
    chúng đôi một xung khắc và tổng của chúng là biến cố chắc chắn
    $Omega$).
  - HS thảo luận nhóm (4-6 người) để rút ra #strong[Công thức xác suất
    toàn phần] từ công thức xác suất có điều kiện:
    $P\(A\)= sum_(i = 1)^n P\(A\|H_i\)dot.op P\(H_i\)$.
  - #strong[Ví dụ minh họa:] Một nhà máy có hai dây chuyền sản xuất I và
    II. Dây chuyền I sản xuất $70 %$ tổng sản phẩm và có tỉ lệ phế phẩm
    là $5 %$. Dây chuyền II sản xuất $30 %$ tổng sản phẩm và có tỉ lệ
    phế phẩm là $2 %$. #strong[Lấy ngẫu nhiên một sản phẩm. Tính xác
    suất để sản phẩm đó là phế phẩm.]
]
#sp-hd[
  - Tóm tắt khái niệm hệ đầy đủ các biến cố.
  - Công thức xác suất toàn phần.
  - Lời giải chi tiết cho ví dụ minh họa.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV yêu cầu HS làm việc nhóm:
    (1) Nghiên cứu SGK để định nghĩa hệ đầy đủ; (2) Dựa vào công thức
    cộng xác suất và công thức xác suất có điều kiện, suy ra công thức
    xác suất toàn phần; (3) Áp dụng công thức vừa tìm được để giải ví dụ
    minh họa.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận. GV quan sát,
    hướng dẫn các nhóm gặp khó khăn. #strong[Dự kiến khó khăn:] HS nhầm
    lẫn giữa $P\(A\|H_i\)$ và $P\(H_i\|A\)$. #strong[Biện pháp hỗ trợ:]
    GV gợi ý dùng #strong[sơ đồ cây xác suất] để phân biệt và minh họa
    rõ ràng các biến cố.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời một nhóm trình bày kết
    quả (có thể sử dụng máy chiếu để trình bày sơ đồ cây). Các nhóm khác
    nhận xét.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa kiến thức và công
    thức, nhấn mạnh tầm quan trọng của việc xác định đúng hệ đầy đủ các
    biến cố.

===== Hoạt động 2.2: Công thức Bayes (55 phút)
]
#mt-hd[
Giúp học sinh xây dựng được công thức Bayes và
  nhận biết được ứng dụng của công thức này trong việc tính xác suất hậu
  nghiệm (xác suất của nguyên nhân khi đã biết kết quả).
]
#nd-hd[
  - HS làm việc nhóm để rút ra #strong[Công thức Bayes] từ công thức
    nhân xác suất và công thức xác suất toàn phần:
    $P\(H_k\|A\)= frac(P\(A\|H_k\)dot.op P\(H_k\), sum_(i = 1)^n P\(A\|H_i\)dot.op P\(H_i\))$.
  - #strong[Ví dụ minh họa (Tiếp nối Ví dụ 2.1):] Một nhà máy có hai dây
    chuyền sản xuất I và II. Dây chuyền I sản xuất $70 %$ tổng sản phẩm
    và có tỉ lệ phế phẩm là $5 %$. Dây chuyền II sản xuất $30 %$ tổng
    sản phẩm và có tỉ lệ phế phẩm là $2 %$. #strong[Giả sử ta lấy ngẫu
    nhiên một sản phẩm và thấy nó là phế phẩm. Tính xác suất để sản phẩm
    phế phẩm đó do dây chuyền I sản xuất.]
]
#sp-hd[
  - Công thức Bayes.
  - Lời giải chi tiết cho ví dụ minh họa (sử dụng kết quả tính $P\(A\)$
    từ Hoạt động 2.1).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV đặt câu hỏi: \"Nếu biết
    sản phẩm là phế phẩm, liệu chúng ta có thể tính được xác suất nó đến
    từ dây chuyền I không?\". GV yêu cầu HS làm việc nhóm: (1) Sử dụng
    công thức xác suất có điều kiện và công thức xác suất toàn phần (đã
    học ở 2.1) để chứng minh công thức Bayes; (2) Áp dụng công thức
    Bayes để giải quyết ví dụ tiếp theo.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận. #strong[Tích hợp
    Năng lực số:] Yêu cầu các nhóm sử dụng máy tính cầm tay hoặc phần
    mềm bảng tính (ví dụ: Google Sheets/Excel) để thực hiện tính toán
    xác suất (do kết quả có thể là số thập phân dài). #strong[Biểu hiện
    về Năng lực số:] #strong[Sử dụng công nghệ số và phương tiện kĩ
    thuật số] (tính toán chính xác).
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời một nhóm thuyết trình cách
    xây dựng công thức và giải bài tập. #strong[Khuyến khích kĩ năng
    thuyết trình, giao tiếp.]
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, nhấn mạnh Công
    thức Bayes dùng để tính xác suất của #strong[nguyên nhân] khi
    #strong[kết quả] đã xảy ra (xác suất hậu nghiệm), làm rõ sự khác
    biệt giữa $P\(A\|H_i\)$ và $P\(H_i\|A\)$.

]
#hd("3", "LUYỆN TẬP", "45 phút")
#mt-hd[
Vận dụng linh hoạt Công thức xác suất toàn phần
  và Công thức Bayes thông qua các bài tập đa dạng, phát triển kĩ năng
  phân tích và tổng hợp.
]
#nd-hd[
Hệ thống các bài tập tự luận và trắc nghiệm về
  cả hai công thức, bao gồm cả các bài toán thực tế (y tế, kinh tế, kiểm
  soát chất lượng).
  - #strong[Bài tập 1 (Phân loại):] Một bài tập chỉ yêu cầu áp dụng Công
    thức xác suất toàn phần.
  - #strong[Bài tập 2 (Phân loại):] Một bài tập yêu cầu áp dụng cả hai
    công thức.
  - #strong[Trò chơi học tập (Game):] #strong[\"Ai nhanh hơn\"] với 5
    câu hỏi trắc nghiệm ứng dụng thực tế.
]
#sp-hd[
  - Đáp án, lời giải của các câu hỏi, bài tập.
  - Kết quả tham gia trò chơi.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV giao Bài tập 1 và 2 cho
    HS làm việc cá nhân (hoặc cặp đôi) trong 20 phút.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thực hiện nhiệm vụ. GV theo
    dõi, hỗ trợ những HS chưa nắm vững kiến thức.
  - #strong[Bước 3: Báo cáo, thảo luận:]
    - GV mời 2 HS lên bảng trình bày lời giải chi tiết (hoặc chiếu lời
      giải mẫu).
    - #strong[Trò chơi \"Ai nhanh hơn\":] GV sử dụng công cụ số (ví dụ:
      Quiziz, Kahoot hoặc Google Form) để tổ chức trò chơi trắc nghiệm 5
      câu trong 15 phút. #strong[Tích hợp Năng lực số:] Yêu cầu HS sử
      dụng điện thoại/máy tính để tham gia, rèn kĩ năng tương tác và
      thao tác trên nền tảng số. #strong[Biểu hiện về Năng lực số:]
      #strong[Vận dụng công nghệ số để tương tác, học tập]\;
      #strong[Giải quyết vấn đề bằng công nghệ số].
  - #strong[Bước 4: Kết luận, nhận định:] GV tổng kết, chữa bài và tuyên
    dương nhóm/cá nhân đạt kết quả cao trong trò chơi.

]
#hd("4", "VẬN DỤNG", "20 phút")
#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  vào thực tiễn cuộc sống.
]
#nd-hd[
Giao nhiệm vụ học sinh phát hiện/đề xuất vấn đề
  trong thực tiễn có thể áp dụng Công thức xác suất toàn phần và Công
  thức Bayes.
  - #strong[Nhiệm vụ:] Tìm một tình huống thực tế (trong lĩnh vực y học,
    kinh tế, công nghệ,...) có thể giải quyết bằng Công thức Bayes. (Ví
    dụ: Ứng dụng trong chẩn đoán y khoa, hệ thống lọc thư rác Spam,...)
]
#sp-hd[
Một báo cáo ngắn (dạng văn bản, sơ đồ tư duy,
  hoặc bài trình chiếu) trình bày:
  - Tình huống thực tế.
  - Mô hình hóa bằng xác suất (xác định các biến cố, hệ đầy đủ, các xác
    suất có điều kiện).
  - Cách giải quyết và kết quả.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV giao nhiệm vụ cho HS thực
    hiện #strong[ở ngoài lớp học] (nhóm 3-4 người).
  - #strong[Bước 2: Hướng dẫn hỗ trợ:] GV gợi ý nguồn tìm kiếm thông tin
    và định hướng cách thức làm báo cáo (khuyến khích sử dụng #strong[Sơ
    đồ tư duy] để tổng hợp thông tin).
  - #strong[Bước 3: Thu và đánh giá:] Thu báo cáo vào buổi học tiếp theo
    hoặc theo lịch trình của giáo viên. Đánh giá chủ yếu bằng nhận xét,
    tập trung vào tính sáng tạo, độ chính xác của mô hình hóa và kĩ năng
    trình bày (trình bày sơ đồ tư duy hoặc thuyết trình báo cáo).
  - #strong[Tích hợp Năng lực số:] Khuyến khích HS sử dụng các công cụ
    tạo Sơ đồ tư duy trực tuyến (ví dụ: Mindmap tools) hoặc phần mềm
    trình chiếu để nộp sản phẩm. #strong[Biểu hiện về Năng lực số:]
    #strong[Tạo và xử lí thông tin bằng công nghệ số] (tạo sơ đồ tư duy,
    bài trình chiếu); #strong[Chia sẻ thông tin và tài nguyên số].

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
