// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 27 Thể tích",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được công thức tính thể tích của #strong[khối lăng trụ] và
  #strong[khối chóp].
- Vận dụng được công thức để tính thể tích của một số khối lăng trụ và
  khối chóp cơ bản (ví dụ: khối lăng trụ đứng, khối chóp đều).
- Nhận biết và phân tích được các yếu tố hình học liên quan (chiều cao,
  diện tích đáy) để xác định thể tích.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, đọc và tóm
    tắt công thức tính thể tích từ sách giáo khoa (SGK).
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày, bảo vệ ý kiến và đặt câu hỏi rõ ràng.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, xác định
    các yếu tố cần thiết (diện tích đáy, chiều cao) để tính thể tích.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Giải thích được cơ sở
    hình học của công thức thể tích.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các vật thể thực
    tế (như bể nước, kim tự tháp) thành các khối lăng trụ/khối chóp để
    tính toán.
  - #strong[Năng lực sử dụng công cụ, phương tiện toán học:] Sử dụng máy
    tính cầm tay, công cụ hình học trực quan (mô hình, phần mềm 3D) để
    hỗ trợ tính toán.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - #strong[Khai thác và xử lí thông tin số:] Tìm kiếm và chọn lọc thông
    tin về các ứng dụng thực tế của thể tích (Biểu hiện: 1.1).
  - #strong[Sử dụng và quản lí các công cụ và thiết bị số:] Sử dụng phần
    mềm vẽ hình học 3D (ví dụ: GeoGebra 3D) để minh họa khối lăng trụ,
    khối chóp (Biểu hiện: 2.1).

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành nhiệm vụ học tập được giao, tích cực xây
  dựng bài.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong làm việc nhóm, bảo vệ
  quan điểm cá nhân, chịu trách nhiệm về kết quả tính toán.
- #strong[Trung thực:] Thẳng thắn trao đổi, báo cáo kết quả đúng với
  thực tế.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối internet, máy
  tính cầm tay.
- #strong[Học liệu:]
  - SGK Toán 11 (Tập 2 - Kết nối tri thức với cuộc sống).
  - Phiếu học tập (bài tập nhóm, câu hỏi thảo luận).
  - Mô hình vật lý: Một khối lăng trụ và một khối chóp (hoặc vật mẫu có
    hình dạng tương ứng, ví dụ hộp đựng, kim tự tháp đồ chơi).
  - Phần mềm/Ứng dụng: #strong[GeoGebra 3D] (hoặc tương tự) để trực quan
    hóa hình khối và công thức.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
Tạo hứng thú, giúp học sinh nhận diện và xác
  định được vấn đề cần giải quyết: #strong[Làm thế nào để tính toán và
  tối ưu hóa thể tích của các vật thể hình học trong thực tế?]

]
#nd-hd[

  - Giáo viên (GV) đặt câu hỏi và tạo tình huống thực tiễn.
  - #strong[Ví dụ cụ thể:] GV chiếu hình ảnh một chiếc #strong[bồn chứa
    nước inox hình lăng trụ lục giác đều] và một #strong[Kim tự tháp
    Giza] (Ai Cập).
    - #strong[Nhiệm vụ:] #emph[\"Một gia đình muốn mua bồn nước. Hãng
      sản xuất nói bồn chứa được 1500 lít nước. Để kiểm tra dung tích
      này, chúng ta cần tính thể tích của chiếc bồn. Làm thế nào để tính
      được thể tích của vật thể có dạng lăng trụ này? Tương tự, Kim tự
      tháp Giza là một khối chóp khổng lồ, thể tích của nó là bao
      nhiêu?\"]

]
#sp-hd[
Câu trả lời của học sinh:

  - Học sinh nhận định rằng cần có #strong[công thức] và #strong[các yếu
    tố kích thước] của hình khối để tính thể tích.
  - Học sinh đề xuất hướng giải quyết: Nghiên cứu công thức tính thể
    tích khối lăng trụ và khối chóp.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình chiếu hình ảnh, đặt
    câu hỏi tình huống. (GV giao nhiệm vụ/yêu cầu/quan sát)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS trả lời nhanh (cá nhân/cặp
    đôi) và ghi nhận ý kiến ban đầu. (HS thực hiện/nghe/nhìn)
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 HS trình bày. GV
    nhận xét, dẫn dắt vào bài mới. (GV tổ chức, điều hành/nhận xét/gợi
    ý)
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt lại vấn đề: Bài học
    này sẽ cung cấp công cụ toán học (công thức thể tích) để giải quyết
    những vấn đề thực tế này. (GV làm rõ nội dung/vấn đề cần giải quyết)

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "40 phút")
#mt-hd[
Giúp học sinh chiếm lĩnh được công thức tính thể
  tích khối lăng trụ và khối chóp.

]
#nd-hd[
Học sinh làm việc với SGK và mô hình để xây dựng
  công thức.

  - #strong[Nhiệm vụ 1 (Khối Lăng Trụ):]
    - #strong[Yêu cầu:] HS (làm việc nhóm 4) đọc SGK, thảo luận, sau đó
      trình bày và chứng minh công thức tính thể tích khối lăng trụ.
    - #strong[Ví dụ cụ thể:] GV cung cấp mô hình #strong[khối lăng trụ
      đứng tam giác] có diện tích đáy $B$ và chiều cao $h$. Yêu cầu HS
      so sánh với khối hộp chữ nhật (đã học) để suy luận công thức.
  - #strong[Nhiệm vụ 2 (Khối Chóp):]
    - #strong[Yêu cầu:] HS (làm việc nhóm 4) thực hiện hoạt động trực
      quan hoặc xem video minh họa mối quan hệ thể tích giữa khối chóp
      và khối lăng trụ có cùng diện tích đáy và chiều cao.
    - #strong[Ví dụ cụ thể (Tích hợp Năng lực số):] GV giao nhiệm vụ cho
      nhóm: Sử dụng điện thoại/máy tính để #strong[truy cập vào đường
      link video] mô phỏng cách ghép 3 khối chóp bằng nhau để tạo thành
      một khối lăng trụ.
      - #strong[Tích hợp Năng lực số:] #strong[Khai thác và xử lí thông
        tin số] (Biểu hiện: 1.1) - Học sinh tìm kiếm, xem và phân tích
        video trên nền tảng số để rút ra công thức.

]
#sp-hd[

  - #strong[Công thức khối lăng trụ:] $V = B dot.op h$ (với $B$ là diện
    tích đáy, $h$ là chiều cao).
  - #strong[Công thức khối chóp:] $V = 1 / 3 B dot.op h$ (với $B$ là
    diện tích đáy, $h$ là chiều cao).
  - Bản tóm tắt/Sơ đồ tư duy (vẽ trên giấy hoặc sử dụng công cụ số như
    #strong[Canva/Mindmap] - Tích hợp Năng lực số: #strong[Sử dụng và
    quản lí các công cụ và thiết bị số] - Biểu hiện: 2.1) thể hiện công
    thức và chú thích các yếu tố.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV giao Phiếu học tập 1 (2
    nhiệm vụ trên) cho các nhóm. (GV giao nhiệm vụ/yêu cầu)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc nhóm (15 phút), đọc
    SGK, thảo luận, xem video/mô hình, chuẩn bị sản phẩm. (HS thực
    hiện/đọc/nghe/nhìn/làm/thảo luận)
    - #strong[Dự kiến khó khăn & hỗ trợ:] HS nhầm lẫn giữa $B$ (diện
      tích đáy) và $h$ (chiều cao) -- GV nhắc lại định nghĩa và cách xác
      định.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời đại diện 2 nhóm lên
    trình bày (1 nhóm trình bày Lăng Trụ, 1 nhóm trình bày Khối Chóp kèm
    theo video/sơ đồ tư duy). Các nhóm khác phản biện. (GV tổ chức, điều
    hành/học sinh báo cáo/thảo luận/thuyết trình)
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa kiến thức, ghi
    công thức chuẩn lên bảng. Nhận xét sản phẩm của HS. (GV kết
    luận/phân tích cụ thể về sản phẩm/làm rõ nội dung)

]
#hd("3", "Luyện tập", "30 phút")
#mt-hd[
Vận dụng công thức thể tích khối lăng trụ và
  khối chóp để giải các bài tập cơ bản, rèn luyện kỹ năng tính toán và
  xác định yếu tố hình học.
]
#nd-hd[
Hệ thống câu hỏi, bài tập đa dạng.
  - #strong[Bài tập 1 (Cá nhân):] Tính thể tích khối chóp đều
    $S . A B C$ có đáy là tam giác đều cạnh $a$, cạnh bên tạo với đáy
    một góc $60^compose$. (Yêu cầu xác định chiều cao)
  - #strong[Bài tập 2 (Làm việc nhóm/Trò chơi):] #strong[Trò chơi \"Tiếp
    sức Thể tích\"].
    - #strong[Yêu cầu:] Chia lớp thành 4 đội. Mỗi đội nhận 5 bài tập nhỏ
      (tăng dần độ khó) về tính thể tích lăng trụ và chóp. Mỗi thành
      viên chỉ giải 1 bước hoặc 1 câu và chuyển tiếp cho bạn tiếp theo
      trong nhóm. Đội hoàn thành nhanh nhất và chính xác nhất sẽ chiến
      thắng.
    - #strong[Ví dụ cụ thể:] Bài 1: Tính diện tích đáy. Bài 2: Tính
      chiều cao. Bài 3: Tính thể tích. Bài 4: Bài tập tổng hợp.
]
#sp-hd[
  - Lời giải chính xác của Bài tập 1.
  - Đáp án và lời giải của 5 bài tập trong trò chơi \"Tiếp sức Thể
    tích\".
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV giao Bài tập 1 cho cá
    nhân (5 phút). Sau đó phổ biến luật chơi \"Tiếp sức Thể tích\" và
    giao phiếu bài tập. (GV giao nhiệm vụ)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc độc lập (Bài 1),
    sau đó làm việc nhóm (Trò chơi). (HS thực hiện/viết/làm)
  - #strong[Bước 3: Báo cáo, thảo luận:]
    - GV mời 1 HS trình bày lời giải Bài tập 1.
    - Trò chơi kết thúc, GV mời đội thắng công bố kết quả và nhận xét
      chéo. (GV kiểm tra/đánh giá/tổ chức, điều hành)
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt lại các kĩ năng quan
    trọng: Xác định chân đường cao (hình chiếu vuông góc), tính diện
    tích đáy (tam giác, tứ giác đặc biệt), và áp dụng công thức. (GV làm
    rõ những nội dung/yêu cầu về kiến thức, kĩ năng)

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
Phát triển năng lực mô hình hóa, vận dụng kiến
  thức tính thể tích vào giải quyết các tình huống thực tiễn ngoài giờ
  học.
]
#nd-hd[
Học sinh phát hiện và đề xuất các vấn đề thực
  tiễn.
  - #strong[Nhiệm vụ:] #emph[\"Tìm kiếm một vật thể thực tế trong gia
    đình hoặc cộng đồng có hình dạng gần giống khối lăng trụ hoặc khối
    chóp (ví dụ: gác mái, hộp quà, chậu cây, viên đá quý...). Tính toán
    thể tích của vật thể đó và đề xuất cách tối ưu hóa không gian (nếu
    cần).\"]
  - #strong[Ví dụ cụ thể:] HS chọn #strong[hộp đựng sữa hình hộp chữ
    nhật]. Tính thể tích thực tế và so sánh với thể tích ghi trên bao
    bì.
]
#sp-hd[
Bài báo cáo (viết tay/file số) về:
  - Tên/Hình ảnh vật thể thực tế.
  - Mô hình hóa hình học (khối gì, kích thước).
  - Quá trình tính toán thể tích và kết quả.
  - Đề xuất tối ưu hóa (nếu có).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV giao nhiệm vụ, hướng dẫn
    HS về yêu cầu nội dung và hình thức báo cáo. (GV giao nhiệm vụ/yêu
    cầu)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thực hiện ngoài giờ học.
  - #strong[Bước 3: Báo cáo, thảo luận:] HS nộp báo cáo. GV dành 5 phút
    đầu tiết học sau để mời 1-2 HS trình bày, trao đổi, chia sẻ và đánh
    giá. (GV giao cho học sinh thực hiện ngoài giờ học/đánh giá vào các
    thời điểm phù hợp)
  - #strong[Bước 4: Kết luận, nhận định:] GV khuyến khích sự sáng tạo,
    liên hệ toán học với cuộc sống. (GV làm rõ các nội dung/vấn đề cần
    giải quyết/giải thích và nhiệm vụ học tập phải thực hiện tiếp theo)

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
