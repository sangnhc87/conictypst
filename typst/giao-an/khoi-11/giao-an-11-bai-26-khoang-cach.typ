// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 26 Khoảng cách",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
- #strong[\1. Về kiến thức:]
  - Nêu được khái niệm và xác định được #strong[khoảng cách] từ một điểm
    đến một đường thẳng, đến một mặt phẳng.
  - Nêu được khái niệm và xác định được #strong[khoảng cách] giữa đường
    thẳng và mặt phẳng song song, giữa hai mặt phẳng song song.
  - Nêu được khái niệm và xác định được #strong[khoảng cách] giữa hai
    đường thẳng chéo nhau.
  - Vận dụng được công thức tính khoảng cách trong các trường hợp cơ
    bản.
- #strong[\2. Về năng lực:]
  - #strong[Năng lực chung:]
    - #strong[Tự chủ và tự học:] Chủ động, tích cực tìm hiểu kiến thức
      về khoảng cách trong không gian qua SGK và tài liệu học tập; tự
      đánh giá được kết quả học tập của bản thân.
    - #strong[Giao tiếp và hợp tác:] Tích cực tham gia hoạt động nhóm,
      trao đổi, thảo luận, trình bày kết quả làm việc nhóm, lắng nghe và
      phản biện ý kiến.
    - #strong[Giải quyết vấn đề và sáng tạo:] Phát hiện, đề xuất được
      cách giải quyết các vấn đề, tình huống liên quan đến khoảng cách
      trong không gian.
  - #strong[Năng lực đặc thù (Năng lực Toán học):]
    - #strong[Năng lực tư duy và lập luận toán học:] Phân tích giả
      thiết, xác định được các bước giải quyết bài toán khoảng cách.
    - #strong[Năng lực mô hình hóa toán học:] Mô tả được các tình huống
      thực tiễn có liên quan đến khái niệm khoảng cách bằng mô hình hình
      học không gian.
    - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng linh hoạt
      các kiến thức về quan hệ vuông góc để tính khoảng cách.
    - #strong[Năng lực giao tiếp toán học:] Trình bày rõ ràng, chính xác
      cách xác định và tính khoảng cách.
  - #strong[Năng lực số:]
    - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
    - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp
      nhất cho một bối cảnh cụ thể.
- #strong[\3. Về phẩm chất:]
  - #strong[Chăm chỉ:] Tích cực tìm tòi, sáng tạo trong việc xác định và
    tính toán khoảng cách.
  - #strong[Trách nhiệm:] Hoàn thành các nhiệm vụ học tập một cách
    nghiêm túc, đúng thời hạn.
  - #strong[Trung thực:] Thẳng thắn nhìn nhận kết quả học tập, tôn trọng
    ý kiến của bạn bè và thầy cô.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính, phấn, bảng.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Tập 2, Kết nối tri thức với cuộc sống).
  - Phiếu học tập, giấy A0/A4, bút dạ.
  - Mô hình hình học không gian (khối hộp, hình chóp...) để minh họa các
    khái niệm khoảng cách.
  - Phần mềm GeoGebra hoặc Cabri 3D (cho hoạt động tích hợp Năng lực
    số).
  - Video/Hình ảnh về ứng dụng của khoảng cách trong thực tế (ví dụ:
    khoảng cách an toàn, thiết kế kiến trúc...).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
#mt-hd[
Tạo hứng thú, giúp học sinh nhớ lại kiến thức về
  khoảng cách trong mặt phẳng và xác định được vấn đề cần giải quyết:
  #strong[\"Làm thế nào để xác định và tính khoảng cách trong không
  gian?\"]
]
#nd-hd[
#strong[Trò chơi \"Ai nhanh hơn\" (Ôn tập kiến
  thức cũ)]
  - Giáo viên (GV) đưa ra hình ảnh thực tế (ví dụ: cầu thang, khung nhà)
    và câu hỏi gợi mở về #strong[khoảng cách trong mặt phẳng] (khoảng
    cách từ điểm đến đường thẳng, khoảng cách giữa hai đường thẳng song
    song).
  - GV đặt vấn đề: Trong không gian ba chiều, làm thế nào để xác định và
    tính các loại khoảng cách tương tự (từ điểm đến mặt phẳng, giữa hai
    đường thẳng chéo nhau)?
]
#sp-hd[
  - Đáp án đúng các câu hỏi ôn tập.
  - Nêu được các loại khoảng cách đã biết trong mặt phẳng.
  - Phát biểu được vấn đề cần giải quyết: Xác định và tính các loại
    khoảng cách trong không gian.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (GV giao nhiệm vụ, HS nhận nhiệm vụ):]
    GV chiếu hình ảnh, đặt câu hỏi ôn tập, sau đó dẫn dắt sang vấn đề
    trong không gian.
  - #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện, GV theo dõi, hỗ
    trợ):] HS làm việc cá nhân, ghi nhanh đáp án/ý tưởng.
  - #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành):] HS báo
    cáo nhanh (có thể dùng phiếu trả lời hoặc hệ thống trắc nghiệm nhanh
    trên điện thoại/máy tính). GV nhận xét, khen ngợi.
  - #strong[Bước 4: Kết luận, nhận định (GV chốt vấn đề):] GV khẳng định
    tính quan trọng của việc xác định khoảng cách và giới thiệu mục tiêu
    bài học.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "90 phút - 30 phút/tiểu hoạt động")
#mt-hd[
Giúp học sinh chiếm lĩnh các khái niệm, phương
  pháp xác định và tính các loại khoảng cách trong không gian.
]
#nd-hd[
Học sinh làm việc với SGK, phiếu học tập (hoạt
  động nhóm, cặp đôi), sử dụng mô hình trực quan để hình thành kiến
  thức.
]
#sp-hd[
  - Các định nghĩa, công thức tính khoảng cách.
  - Lời giải chính xác cho các #strong[Ví dụ] được đề xuất trong từng
    tiểu hoạt động.
  - Sơ đồ tư duy (hoạt động nhóm) tổng hợp kiến thức.
]
#tc-hd[

#emph[#strong[Tiểu hoạt động 2.1: Khoảng cách từ một điểm đến một đường
thẳng, đến một mặt phẳng (30 phút)]]

- #strong[Nội dung:] Tìm hiểu định nghĩa và phương pháp xác định hình
  chiếu vuông góc, từ đó xác định khoảng cách từ điểm đến đường thẳng
  $\(d\(M\,Delta\)\)$ và từ điểm đến mặt phẳng $\(d\(M\,\(alpha\)\)\)$.
- #strong[Ví dụ đề xuất:]
  - #strong[Ví dụ 1 (Từ điểm đến đường thẳng):] Cho hình lập phương
    $A B C D . A' B' C' D'$ có cạnh $a$. Tính khoảng cách từ điểm $A$
    đến đường thẳng $C C'$. (HS sử dụng mô hình, xác định hình chiếu
    $C$).
  - #strong[Ví dụ 2 (Từ điểm đến mặt phẳng):] Cho hình chóp $S . A B C$
    có $S A perp\(A B C\)$ và $S A = 2 a$. Tam giác $A B C$ vuông tại
    $B$ với $A B = a\,B C = a sqrt(3)$. Tính khoảng cách từ $S$ đến mặt
    phẳng $\(A B C\)$. (HS nhận diện hình chiếu $A$, áp dụng định
    nghĩa).
- #strong[Tổ chức thực hiện:]
  - #strong[Giao nhiệm vụ:] GV yêu cầu HS làm việc cặp đôi, nghiên cứu
    SGK, định nghĩa, và giải #strong[Ví dụ 1, Ví dụ 2] trên phiếu học
    tập.
  - #strong[Thực hiện nhiệm vụ:] HS làm việc, GV theo dõi, hỗ trợ, gợi ý
    xác định hình chiếu vuông góc.
  - #strong[Báo cáo, thảo luận:] Đại diện 2 cặp đôi lên bảng trình bày
    lời giải, các nhóm khác nhận xét, bổ sung.
  - #strong[Kết luận, nhận định:] GV chuẩn hóa kiến thức, nhấn mạnh vai
    trò của #strong[đường vuông góc] (hình chiếu) trong việc xác định
    khoảng cách.

#emph[#strong[Tiểu hoạt động 2.2: Khoảng cách giữa các đường thẳng và
mặt phẳng song song, giữa hai mặt phẳng song song (30 phút)]]

- #strong[Nội dung:] Hình thành khái niệm và phương pháp xác định khoảng
  cách giữa $d$ và $\(alpha\)$ song song, và giữa $\(alpha\)$ và
  $\(beta\)$ song song.
- #strong[Ví dụ đề xuất:]
  - #strong[Ví dụ 3 (Đường thẳng và mặt phẳng song song):] Cho hình hộp
    $A B C D . A' B' C' D'$ có tất cả các mặt là hình vuông cạnh $a$.
    Tính khoảng cách giữa đường thẳng $A B$ và mặt phẳng
    $\(C D D' C'\)$. (HS quy về khoảng cách từ $A$ đến $\(C D D' C'\)$,
    sau đó là khoảng cách từ $A$ đến $D C$).
  - #strong[Ví dụ 4 (Hai mặt phẳng song song):] Cho lăng trụ đứng
    $A B C . A' B' C'$ có chiều cao $h$. Tính khoảng cách giữa hai mặt
    phẳng đáy $\(A B C\)$ và $\(A' B' C'\)$.
- #strong[Tổ chức thực hiện:]
  - #strong[Giao nhiệm vụ:] GV đặt câu hỏi: \"Khoảng cách giữa hai đối
    tượng song song được quy về loại khoảng cách nào đã học?\" HS thảo
    luận nhóm nhỏ (4 người), đề xuất quy tắc. GV giao giải #strong[Ví dụ
    3, Ví dụ 4].
  - #strong[Thực hiện nhiệm vụ:] HS thảo luận, ghi nhận quy tắc và giải
    ví dụ.
  - #strong[Báo cáo, thảo luận:] Một nhóm trình bày kết quả bằng
    #strong[Sơ đồ tư duy] đơn giản trên giấy A4/bảng, minh họa quy tắc
    quy đổi khoảng cách.
  - #strong[Kết luận, nhận định:] GV chốt lại quy tắc: khoảng cách giữa
    hai đối tượng song song bằng khoảng cách từ #strong[một điểm bất kỳ]
    thuộc đối tượng này đến đối tượng kia.

#emph[#strong[Tiểu hoạt động 2.3: Khoảng cách giữa hai đường thẳng chéo
nhau (30 phút)]]

- #strong[Nội dung:] Nghiên cứu định nghĩa và phương pháp xác định đoạn
  vuông góc chung, từ đó xác định khoảng cách giữa hai đường thẳng chéo
  nhau.
- #strong[Ví dụ đề xuất:]
  - #strong[Ví dụ 5 (Khoảng cách giữa hai đường chéo nhau):] Cho hình
    chóp $S . A B C D$ có đáy $A B C D$ là hình vuông tâm $O$ cạnh $a$,
    $S A perp\(A B C D\)$ và $S A = a$. Tính khoảng cách giữa hai đường
    thẳng chéo nhau $S C$ và $A D$.
  - #strong[Ví dụ 6 (Tích hợp Năng lực số - Trực quan hóa):] GV chiếu
    hình vẽ 3D của #strong[Ví dụ 5] (dùng GeoGebra) và yêu cầu HS
    #strong[xác định đoạn vuông góc chung] trên hình ảnh trực quan.
- #strong[Tổ chức thực hiện:]
  - #strong[Giao nhiệm vụ:] GV giới thiệu đoạn vuông góc chung là cách
    xác định khoảng cách ngắn nhất. Yêu cầu HS nghiên cứu #strong[Phương
    pháp xác định khoảng cách giữa hai đường thẳng chéo nhau] (Phương
    pháp mặt phẳng song song và Phương pháp mặt phẳng vuông góc) trong
    SGK và giải #strong[Ví dụ 5].
  - #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm. #strong[Tích hợp Năng
    lực số:] Một nhóm được giao nhiệm vụ tìm kiếm nhanh (trên điện
    thoại/máy tính bảng) hình ảnh hoặc video minh họa khái niệm đường
    vuông góc chung để chuẩn bị thuyết trình.
    - #strong[Biểu hiện về Năng lực số (Sử dụng công cụ, phương tiện học
      Toán):] Học sinh sử dụng công cụ tìm kiếm số để truy cập và xử lý
      thông tin, tài liệu học tập; sử dụng phần mềm GeoGebra để trực
      quan hóa hình học không gian.
  - #strong[Báo cáo, thảo luận:] Một nhóm trình bày chi tiết lời giải
    #strong[Ví dụ 5]. Nhóm còn lại #strong[Thuyết trình] (kỹ năng giao
    tiếp) về khái niệm đường vuông góc chung, có sử dụng hình ảnh tìm
    được.
  - #strong[Kết luận, nhận định:] GV chuẩn hóa kiến thức, nhấn mạnh tầm
    quan trọng của việc tìm mặt phẳng song song chứa đường này và song
    song với đường kia, hoặc tìm mặt phẳng chứa đường này và vuông góc
    với đường kia để tính khoảng cách.

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
Củng cố các kiến thức, kĩ năng xác định và tính
  toán các loại khoảng cách đã học, rèn luyện kỹ năng phân tích và tổng
  hợp.
]
#nd-hd[
Hệ thống các bài tập trắc nghiệm nhanh và tự
  luận ngắn, bao quát 3 loại khoảng cách.
]
#sp-hd[
Lời giải đúng của các bài tập luyện tập.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV phát phiếu bài tập trắc nghiệm và tự luận
    ngắn (3-4 câu).
  - #strong[Thực hiện nhiệm vụ:] HS làm việc cá nhân trong 7 phút. GV
    quan sát, động viên.
  - #strong[Báo cáo, thảo luận:] GV tổ chức #strong[Trò chơi học tập
    \"Thử thách chớp nhoáng\"] (Flash Challenge) bằng cách gọi ngẫu
    nhiên HS lên bảng trình bày nhanh lời giải một câu hoặc dùng máy
    chiếu đáp án và yêu cầu HS giải thích cách làm (kỹ năng thuyết
    trình).
  - #strong[Kết luận, nhận định:] GV nhận xét chung về tốc độ và độ
    chính xác của HS, giải đáp các thắc mắc.

]
#hd("4", "Vận dụng", "15 phút")
#mt-hd[
Phát triển năng lực mô hình hóa, giúp học sinh
  thấy được ứng dụng của kiến thức khoảng cách vào thực tiễn cuộc sống.
]
#nd-hd[
Học sinh phát hiện/đề xuất vấn đề thực tiễn liên
  quan đến khoảng cách và đề xuất giải pháp.
]
#sp-hd[
Bản nháp (hoặc báo cáo) về một tình huống thực
  tiễn và cách giải quyết bằng kiến thức đã học.
]
#tc-hd[
  - #strong[Giao nhiệm vụ (Bài tập về nhà):] GV đưa ra một tình huống
    thực tế (ví dụ: #strong[Tính chiều dài dây cáp cần thiết để nối từ
    đỉnh tháp đến một điểm trên mặt đất biết các thông số liên quan])
    hoặc yêu cầu HS tự tìm kiếm một tình huống thực tế liên quan đến
    khoảng cách (ví dụ: kiến trúc, giao thông) và trình bày dưới dạng:
    - #strong[Vấn đề/Tình huống:] Mô tả rõ ràng.
    - #strong[Mô hình hóa:] Vẽ/Mô tả mô hình hình học không gian tương
      ứng.
    - #strong[Giải pháp:] Nêu các bước tính toán khoảng cách.
  - #strong[Thực hiện nhiệm vụ:] HS thực hiện ngoài giờ học.
  - #strong[Báo cáo, thảo luận:] Thu thập và đánh giá (có thể chọn 2-3
    bài báo cáo tốt nhất để trao đổi, chia sẻ và đánh giá vào đầu tiết
    học tiếp theo).
  - #strong[Kết luận, nhận định:] Khuyến khích HS sử dụng công nghệ
    (chụp ảnh, GeoGebra, Word) để hoàn thành báo cáo.
    - #strong[Biểu hiện về Năng lực số (Sử dụng và tạo lập):] Học sinh
      sử dụng các phần mềm văn phòng/thiết kế/vẽ hình để tạo ra sản phẩm
      báo cáo học tập.

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
