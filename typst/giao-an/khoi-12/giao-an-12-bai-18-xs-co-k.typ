// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 18 XS có ĐK",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được định nghĩa và công thức tính #strong[xác suất có điều kiện]
  $P\(B\|A\)$ của biến cố $B$ với điều kiện biến cố $A$ đã xảy ra.
- Nêu được #strong[công thức nhân xác suất] cho hai biến cố.
- Vận dụng được công thức xác suất có điều kiện và công thức nhân xác
  suất để giải quyết một số bài toán thực tế đơn giản.

#muc("2", "NĂNG LỰC")
==== a) Năng lực chung:
- #strong[Tự chủ và tự học:] Chủ động, tích cực thực hiện các nhiệm vụ
  học tập được giao; tự đánh giá được kết quả học tập của bản thân.
- #strong[Giao tiếp và hợp tác:] Hợp tác hiệu quả trong làm việc nhóm để
  hoàn thành nhiệm vụ học tập, đặc biệt trong việc thảo luận, trình bày
  và phân tích các bài toán thực tế.
- #strong[Giải quyết vấn đề và sáng tạo:] Đề xuất được các phương án
  giải quyết vấn đề toán học và vấn đề thực tế liên quan đến xác suất có
  điều kiện.

==== b) Năng lực đặc thù môn Toán:
- #strong[Năng lực tư duy và lập luận toán học:] Phân tích, so sánh để
  xây dựng khái niệm xác suất có điều kiện từ khái niệm xác suất cổ
  điển; lập luận để thiết lập và sử dụng công thức nhân xác suất.
- #strong[Năng lực mô hình hoá toán học:] Thiết lập được mô hình xác
  suất (không gian mẫu, biến cố) cho các bài toán thực tế liên quan đến
  xác suất có điều kiện.
- #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng linh hoạt các
  công thức để tính toán và tìm ra lời giải chính xác cho bài toán xác
  suất có điều kiện.

==== c) Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tìm tòi, nghiên cứu tài liệu và hoàn thành
  nhiệm vụ học tập.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ được giao trong hoạt
  động nhóm; có ý thức giúp đỡ bạn bè cùng tiến bộ.
- #strong[Trung thực:] Trung thực trong việc báo cáo kết quả thực hiện
  nhiệm vụ, tính toán.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính/laptop, loa, vật dụng
  thực tế (ví dụ: hộp đựng bi, thẻ số) cho hoạt động Mở đầu.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập (bản in hoặc bản điện tử dùng trên nền tảng học tập
    chung).
  - Tài liệu tham khảo bổ sung (các bài toán xác suất thực tế).
  - Phần mềm/Công cụ số: Máy tính cầm tay, Powerpoint/Canva/Google
    Slides cho việc trình bày.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "Khơi gợi nhu cầu tìm hiểu về Xác suất có điều kiện")
- #strong[Thời gian:] 15 phút (0.5 tiết)

#mt-hd[
- Giúp học sinh nhận ra sự khác biệt giữa xác suất cổ điển và xác suất
  trong bối cảnh thông tin đã biết (có điều kiện).
- Xác định được vấn đề cần giải quyết: Làm thế nào để tính xác suất của
  một biến cố khi một biến cố khác đã xảy ra?

]
#nd-hd[
- Giáo viên (GV) giao nhiệm vụ: #strong[Trò chơi học tập \"Hộp bi bí
  ẩn\"].
  - Có hai hộp: Hộp I chứa 3 bi Đỏ và 2 bi Xanh; Hộp II chứa 1 bi Đỏ và
    4 bi Xanh.
  - Chọn ngẫu nhiên 1 hộp, sau đó rút ngẫu nhiên 1 bi từ hộp đó.
  - #strong[Nhiệm vụ 1:] Tính xác suất để rút được bi Đỏ (Xác suất cổ
    điển).
  - #strong[Nhiệm vụ 2 (Tình huống có điều kiện):] Giả sử đã biết bi rút
    ra là bi Đỏ. Tính xác suất để bi Đỏ đó được rút ra từ Hộp I.
  - Học sinh (HS) làm việc cá nhân/nhóm nhỏ, ghi lại kết quả sơ bộ ra
    nháp.

]
#sp-hd[
- Câu trả lời sơ bộ của HS cho hai nhiệm vụ (Nhiệm vụ 1:
  $1 / 2 dot.op 3 / 5 + 1 / 2 dot.op 1 / 5 = 2 / 5$\; Nhiệm vụ 2: Dự
  kiến HS sẽ gặp khó khăn hoặc đưa ra các đáp án khác nhau).
- HS nêu được vấn đề cần giải quyết là cần một công cụ toán học để tính
  xác suất trong tình huống thông tin đã biết.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV trình bày luật chơi và nhiệm vụ (sử
  dụng máy chiếu/slide để trình bày rõ ràng).
- #strong[Thực hiện nhiệm vụ:] HS làm việc độc lập/nhóm nhỏ. GV quan
  sát, theo dõi và gợi ý: \"Không gian mẫu có thay đổi khi có thêm thông
  tin không?\".
  - #emph[Hỗ trợ dự kiến:] Nếu HS lúng túng ở Nhiệm vụ 2, GV gợi ý về
    việc thu hẹp tập hợp các kết quả có thể xảy ra.
- #strong[Báo cáo, thảo luận:] GV mời 1-2 HS/nhóm báo cáo kết quả Nhiệm
  vụ 1. Sau đó, mời các nhóm nêu ý kiến về Nhiệm vụ 2. GV ghi nhận các ý
  kiến, nhấn mạnh sự cần thiết của một công thức mới.
- #strong[Kết luận, nhận định:] GV chốt lại mục tiêu bài học: Tìm hiểu
  công thức tính xác suất khi có thêm điều kiện/thông tin (Xác suất có
  điều kiện).

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "Nghiên cứu công thức Xác suất có điều kiện và Công thức nhân xác suất")
- #strong[Thời gian:] 90 phút (2 tiết)

==== Hoạt động thành phần 2.1: Hình thành kiến thức Xác suất có điều kiện
- #strong[Thời gian:] 45 phút

#mt-hd[
- Thiết lập được công thức và hiểu rõ bản chất của #strong[xác suất có
  điều kiện] $P\(B\|A\)$.
- Vận dụng công thức để giải quyết bài toán đặt ra ở Hoạt động 1.

]
#nd-hd[
- HS làm việc với SGK/Phiếu học tập: Nghiên cứu ví dụ mở đầu trong SGK
  để nhận diện sự thay đổi của không gian mẫu.
- #strong[Nhiệm vụ:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + Cho hai biến cố $A$ và $B$ trong không gian mẫu $Omega$. Nếu biến cố
    $A$ đã xảy ra, hãy cho biết không gian mẫu mới là gì?
  + Dựa trên công thức xác suất cổ điển
    $P\(A\)= frac(\|Omega_A\|, \|Omega\|)$, hãy đề xuất công thức tính
    $P\(B\|A\)$.
  + Áp dụng công thức vừa đề xuất để giải quyết Nhiệm vụ 2 trong Hoạt
    động 1.
  ]
- #strong[Ví dụ minh họa:]
  - Gieo một con xúc xắc cân đối. Biến cố $A$: Xuất hiện mặt chẵn. Biến
    cố $B$: Xuất hiện mặt lớn hơn 4.
  - Tính $P\(B\)$ và $P\(B\|A\)$. (HS làm việc nhóm, sử dụng công thức
    sau khi đã thiết lập).

]
#sp-hd[
- HS viết ra được #strong[Định nghĩa và Công thức xác suất có điều
  kiện]: $P\(B\|A\)= frac(P\(A inter B\), P\(A\))$ (với $P\(A\)> 0$).
- Lời giải chính xác cho ví dụ minh họa: $P\(B\|A\)= 1\/3$.
- Giải quyết được Nhiệm vụ 2 ở Hoạt động 1 bằng công thức:
  $P\(upright("Hộp I")\|upright("Đỏ")\)= frac(P\(upright("Hộp I") inter upright("Đỏ")\), P\(upright("Đỏ")\)) = frac(3\/10, 4\/10) = 3\/4$.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ 1 và 2 (làm việc nhóm
  4 HS).
- #strong[Thực hiện nhiệm vụ:] HS thảo luận. GV đi lại các nhóm, theo
  dõi, hỗ trợ, gợi ý về việc lấy $\|Omega\|$ làm chung.
- #strong[Báo cáo, thảo luận:]
  - GV mời đại diện 1 nhóm trình bày kết quả thiết lập công thức (có thể
    sử dụng sơ đồ tư duy hoặc slide để trình bày).
  - #strong[Tích hợp năng lực số:] Khuyến khích HS sử dụng công cụ số
    (Powerpoint/Canva) để tạo sơ đồ tư duy tóm tắt công thức và trình
    bày.
- #strong[Kết luận, nhận định:] GV chuẩn hóa kiến thức (Định nghĩa, Công
  thức), chốt lại lời giải Nhiệm vụ 2 HĐ 1.

==== Hoạt động thành phần 2.2: Hình thành kiến thức Công thức nhân xác suất
- #strong[Thời gian:] 45 phút

]
#mt-hd[
- Thiết lập được công thức nhân xác suất.
- Vận dụng công thức nhân xác suất để tính xác suất của giao hai biến
  cố.

]
#nd-hd[
- #strong[Nhiệm vụ:] Từ công thức
  $P\(B\|A\)= frac(P\(A inter B\), P\(A\))$, hãy suy ra công thức tính
  $P\(A inter B\)$.
- #strong[Công thức nhân xác suất:]
  $P\(A inter B\)= P\(A\)dot.op P\(B\|A\)$ hoặc
  $P\(A inter B\)= P\(B\)dot.op P\(A\|B\)$.
- #strong[Ví dụ minh họa:]
  - Một lô hàng có 10 sản phẩm, trong đó có 2 sản phẩm bị lỗi. Lấy ngẫu
    nhiên lần lượt 2 sản phẩm (lấy không hoàn lại). Gọi $A$ là biến cố
    \"Lần 1 lấy được sản phẩm lỗi\", $B$ là biến cố \"Lần 2 lấy được sản
    phẩm lỗi\".
  - Tính xác suất để cả 2 lần đều lấy được sản phẩm lỗi. (HS làm việc
    nhóm, áp dụng công thức nhân xác suất).

]
#sp-hd[
- HS viết ra được #strong[Công thức nhân xác suất].
- Lời giải chính xác cho ví dụ minh họa:
  $P\(A inter B\)= P\(A\)dot.op P\(B\|A\)= 2 / 10 dot.op 1 / 9 = 2 / 90 = 1 / 45$.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV yêu cầu HS suy luận công thức từ HĐ
  2.1 (làm việc cặp đôi).
- #strong[Thực hiện nhiệm vụ:] HS thảo luận. GV quan sát và khuyến khích
  HS làm bài toán mẫu.
- #strong[Báo cáo, thảo luận:] GV mời đại diện 1-2 cặp đôi trình bày
  cách suy luận và lời giải ví dụ. Khuyến khích HS giải thích rõ
  $P\(B\|A\)$ trong tình huống thực tế này.
  - #strong[Tích hợp phương pháp tích cực:] Khuyến khích HS sử dụng các
    công cụ vẽ sơ đồ (tùy chọn số hoặc thủ công) để biểu diễn quá trình
    lấy mẫu (cây xác suất).
- #strong[Kết luận, nhận định:] GV tổng hợp kiến thức về Công thức nhân
  xác suất.

]
#hd("3", "Luyện tập", "Củng cố kiến thức và kĩ năng")
- #strong[Thời gian:] 45 phút (1 tiết)

#mt-hd[
- Vận dụng thành thạo công thức xác suất có điều kiện và công thức nhân
  xác suất để giải các dạng bài tập khác nhau.
- Phát triển kĩ năng làm việc nhóm, giao tiếp và phản biện.

]
#nd-hd[
- Hệ thống bài tập tổng hợp (Phiếu học tập số 2):
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Bài tập tính toán cơ bản:] Cho
    $P\(A\)\,P\(B\)\,P\(A union B\)$. Yêu cầu tính $P\(B\|A\)$.
  + #strong[Bài tập thực tế về sản xuất/y tế:] Tỉ lệ bệnh tật, tỉ lệ làm
    ra sản phẩm đạt/hỏng (sử dụng công thức nhân xác suất).
  + #strong[Bài tập về Trò chơi học tập \"Thử thách liên hoàn\":] Chia
    lớp thành 4-5 đội, tổ chức trò chơi giải các bài toán xác suất có
    điều kiện dưới dạng câu hỏi trắc nghiệm/tự luận ngắn. Đội nào giải
    nhanh, đúng sẽ ghi điểm.
  ]

]
#sp-hd[
- Đáp án và lời giải chi tiết của các bài tập trong Phiếu học tập số 2.
- Báo cáo giải bài tập của các nhóm/cá nhân, thể hiện rõ quá trình áp
  dụng công thức.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao Phiếu học tập số 2 (chia nhóm
  4-5 HS).
- #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm, phân công nhiệm vụ,
  thảo luận. GV theo dõi, hỗ trợ, kiểm tra nhanh quá trình làm việc.
- #strong[Báo cáo, thảo luận:]
  - GV tổ chức Trò chơi học tập (Ví dụ: Thử thách liên hoàn). Các nhóm
    lần lượt trả lời.
  - GV mời một số nhóm trình bày bài giải lên bảng/máy chiếu (đối với
    bài tập tự luận).
- #strong[Kết luận, nhận định:] GV tổng kết điểm, khen ngợi, nhận xét về
  các lỗi sai thường gặp và cách khắc phục.

]
#hd("4", "Vận dụng", "Kết nối với thực tiễn và phát triển năng lực tự học")
- #strong[Thời gian:] 30 phút (0.5 tiết - Giao nhiệm vụ thực hiện ngoài
  giờ)

#mt-hd[
- Phát triển năng lực vận dụng kiến thức xác suất có điều kiện vào việc
  phân tích các tình huống thực tế trong đời sống (kinh tế, y học, dự
  báo...).
- Phát triển kĩ năng tự học, tìm kiếm, phân tích và tổng hợp thông tin.

]
#nd-hd[
- #strong[Nhiệm vụ (Làm việc cá nhân/cặp đôi ngoài giờ):]
  - Tìm kiếm một tình huống thực tế (trong y học, kinh tế, dự báo thời
    tiết,...) có sử dụng khái niệm xác suất có điều kiện (ví dụ: Xác
    suất một người mắc bệnh nếu kết quả xét nghiệm dương tính).
  - Mô tả tình huống, xác định các biến cố và tính toán (nếu có thể) để
    giải quyết vấn đề bằng công thức xác suất có điều kiện.

]
#sp-hd[
- Báo cáo (dạng bài viết ngắn, slide, hoặc video) về việc phát hiện và
  giải quyết tình huống/vấn đề trong thực tiễn.
  - #strong[Hình thức:] Tóm tắt tình huống; Mô hình hóa toán học; Lời
    giải và Kết luận.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ, hướng dẫn cách tìm
  kiếm nguồn thông tin (có thể gợi ý các trang web khoa học, bài báo).
  - #strong[Tích hợp năng lực số:] Khuyến khích HS sử dụng công cụ tìm
    kiếm trên Internet, các nền tảng trình chiếu (Powerpoint, Canva)
    hoặc làm infographic để trình bày báo cáo (Biểu hiện năng lực số:
    #emph[Tìm kiếm, chọn lọc và đánh giá thông tin số] và #emph[Sáng
    tạo, trình bày sản phẩm số]).
- #strong[Thực hiện nhiệm vụ:] HS thực hiện ngoài giờ học (1 tuần).
- #strong[Báo cáo, thảo luận:] GV thu báo cáo để chấm điểm và chọn lọc
  2-3 sản phẩm tốt nhất để trao đổi, chia sẻ và đánh giá vào đầu tiết
  học tiếp theo.
- #strong[Kết luận, nhận định:] GV nhận xét chung về các sản phẩm,
  khuyến khích sự sáng tạo và tính ứng dụng của toán học trong thực
  tiễn.

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
