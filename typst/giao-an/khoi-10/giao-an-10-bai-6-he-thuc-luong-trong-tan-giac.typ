// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 6 Hệ thức lượng trong tan giác",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được #strong[định lí côsin], #strong[định lí sin], công thức tính
  độ dài #strong[đường trung tuyến] trong tam giác.
- Giải thích được công thức tính #strong[diện tích tam giác]:
  $S = 1 / 2 b c sin A = frac(a b c, 4 R) = p r = sqrt(p\(p - a\)\(p - b\)\(p - c\))$.
- Vận dụng được định lí côsin, định lí sin, công thức tính diện tích và
  độ dài đường trung tuyến để giải quyết các bài toán liên quan đến tam
  giác.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù (Năng lực Toán học):]

  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích, so sánh
    các hệ thức để lựa chọn công thức phù hợp khi giải tam giác.
  - #strong[Năng lực mô hình hoá toán học:] Thiết lập mô hình toán học
    (tam giác, các hệ thức lượng) để giải quyết các vấn đề thực tiễn (ví
    dụ: đo khoảng cách, chiều cao).
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng linh hoạt các
    hệ thức lượng để tìm các yếu tố còn lại của tam giác (cạnh, góc,
    diện tích).

- #strong[Năng lực chung:]

  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày, bảo vệ ý kiến của nhóm, lắng nghe và phản hồi ý kiến của
    nhóm khác trong quá trình giải bài tập, thực hiện nhiệm vụ được
    giao.
  - #strong[Năng lực tự chủ và tự học:] Chủ động đọc sách giáo khoa,
    nghiên cứu tài liệu và hoàn thành nhiệm vụ được giao.

- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]

  - #strong[Năng lực sáng tạo nội dung số:] Thiết kế, trình bày sản phẩm
    học tập (báo cáo, sơ đồ tư duy, slide) bằng các công cụ số (ví dụ:
    PowerPoint, Canva, Word).

  - #strong[Tương tác và tham gia trong môi trường số]: HS sử dụng thành
    thạo phần mềm Quizizz/Kahoot! để trả lời trắc nghiệm, thể hiện khả
    năng tương tác với môi trường học tập số và đánh giá tức thời kết
    quả học tập; HS thiết kế và trình bày báo cáo bằng công cụ tạo nội
    dung số (ví dụ: PowerPoint, Canva), sử dụng công cụ lưu trữ và chia
    sẻ (Google Drive) để nộp bài.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  đầy đủ và nghiêm túc các nhiệm vụ được giao.
- #strong[Trách nhiệm:] Có trách nhiệm trong hoạt động nhóm, chủ động
  báo cáo sản phẩm của nhóm.
- #strong[Trung thực:] Thẳng thắn, trung thực báo cáo kết quả thực hiện
  nhiệm vụ.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, thước thẳng, ê-ke,
  compa, thước đo góc.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập (in sẵn các bài toán ứng dụng).
  - Tài liệu tham khảo, hình ảnh, video minh hoạ các ứng dụng thực tế
    (ví dụ: hình ảnh vệ tinh đo khoảng cách, mô hình trắc địa).
  - Phần mềm/ứng dụng hỗ trợ: GeoGebra, Quizizz, Google Form (hoặc các
    công cụ tạo bài kiểm tra trực tuyến khác).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "15 phút")
#mt-hd[
Giúp học sinh xác định được vấn đề cần giải quyết: #strong[Làm thế nào
để xác định các yếu tố (cạnh, góc) còn lại của tam giác khi biết một số
yếu tố ban đầu và áp dụng vào các bài toán thực tế] mà không thể đo trực
tiếp?

]
#nd-hd[
- #strong[Giáo viên (GV) giao nhiệm vụ:] GV trình chiếu một tình huống
  thực tiễn có liên quan đến việc đo lường trong một khu vực không thể
  tiếp cận trực tiếp.
  - #strong[Tình huống:] Một đội khảo sát cần xác định khoảng cách giữa
    hai điểm A và B ở hai bên bờ sông, nhưng không thể căng dây đo trực
    tiếp. Họ chọn điểm C trên bờ sông có chứa điểm A và đo được:
    $A C = 50 m$, $accent(C A B, ̂) = 80^compose$,
    $accent(A C B, ̂) = 65^compose$. Yêu cầu học sinh tìm cách tính độ
    dài $A B$.
- #strong[Học sinh (HS) thực hiện:] HS suy nghĩ cá nhân, sau đó thảo
  luận nhóm nhỏ (3-4 HS) để đề xuất phương án giải quyết (có thể vẽ hình
  minh hoạ).

]
#sp-hd[
- Lời giải thích/mô tả của học sinh về vấn đề đang gặp phải (chưa có
  công cụ toán học để giải quyết bài toán khi biết hai góc và một cạnh).
- Đề xuất phương án tiếp cận (cần công thức/định lí liên quan đến cạnh
  và góc trong tam giác).
- #strong[GV định hướng:] Bài học hôm nay sẽ cung cấp các công cụ toán
  học cần thiết để giải quyết bài toán này và các bài toán tương tự.

]
#tc-hd[
- #strong[Bước 1 (Giao nhiệm vụ):] GV trình chiếu, nêu rõ vấn đề.
- #strong[Bước 2 (Thực hiện nhiệm vụ):] HS thảo luận nhóm (5 phút), GV
  theo dõi, gợi ý: \"Các kiến thức đã học ở THCS có đủ để giải quyết vấn
  đề này không?\"
- #strong[Bước 3 (Báo cáo, thảo luận):] GV mời đại diện 1-2 nhóm trình
  bày nhanh ý tưởng.
- #strong[Bước 4 (Kết luận, nhận định):] GV nhận xét, tóm tắt ý kiến,
  chốt lại mục tiêu bài học: #strong[Cần học các hệ thức lượng mới trong
  tam giác] (Định lí sin, côsin, công thức diện tích).
- #strong[Tích hợp năng lực số (TT 02/2025/TT-BGDĐT):]
  - #strong[Biểu hiện:] HS sử dụng thiết bị di động (nếu được phép) để
    tìm kiếm nhanh các công thức đã học về tam giác vuông hoặc các
    phương pháp đo lường thực tế để kết nối vấn đề.
  - #strong[Tên NL số:] Sử dụng và khai thác công nghệ số.

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "110 phút")
==== 2.1. Hoạt động thành phần 2.1: Định lí côsin (30 phút)
- #strong[Tên hoạt động:] Chứng minh và ứng dụng Định lí côsin.

#mt-hd[
  côsin].

// ]
#nd-hd[
  minh công thức Định lí côsin và áp dụng giải bài toán ví dụ.

  - #strong[Nhiệm vụ 1:] HS làm việc cá nhân/nhóm, chứng minh Định lí
    côsin (sử dụng công thức khoảng cách hoặc kiến thức hình học THCS).
  - #strong[Nhiệm vụ 2 (Ví dụ):] Cho $triangle.stroked.t A B C$ có
    $A B = 5$, $A C = 8$, $hat(A) = 60^compose$. Tính cạnh $B C$.

]
#sp-hd[

  - Phát biểu và ghi nhận công thức Định lí côsin:
    $a^2 = b^2 + c^2 - 2 b c cos A$.
  - Lời giải chi tiết cho Ví dụ 2 (áp dụng công thức):
    $B C^2 = 8^2 + 5^2 - 2 dot.op 8 dot.op 5 dot.op c o s 60^compose = 64 + 25 - 80 dot.op 1 / 2 = 89 - 40 = 49$.
    Suy ra $B C = 7$.

]
#tc-hd[

  - GV giao nhiệm vụ, hướng dẫn HS xem xét trường hợp tam giác vuông và
    tam giác thường.
  - HS thực hiện nhiệm vụ (10 phút), đại diện nhóm trình bày (5 phút).
  - GV chuẩn hoá kiến thức, nhấn mạnh các trường hợp suy ra (tính góc,
    công thức đường trung tuyến).
  - #strong[Tích hợp năng lực số (TT 02/2025/TT-BGDĐT):]
    - #strong[Biểu hiện:] HS sử dụng phần mềm #strong[GeoGebra] để vẽ
      tam giác theo yêu cầu của Ví dụ 2 và kiểm tra kết quả tính toán
      bằng cách đo trực tiếp trên phần mềm (sử dụng công cụ đo độ dài).
    - #strong[Tên NL số:] Sử dụng và khai thác công nghệ số.

==== 2.2. Hoạt động thành phần 2.2: Định lí sin (25 phút)
- #strong[Tên hoạt động:] Khám phá mối liên hệ giữa cạnh, góc và bán
  kính đường tròn ngoại tiếp.

]
#mt-hd[
  biết ý nghĩa của bán kính đường tròn ngoại tiếp $R$.

]
#nd-hd[

  - #strong[Nhiệm vụ 1:] Nghiên cứu chứng minh Định lí sin:
    $frac(a, sin A) = frac(b, sin B) = frac(c, sin C) = 2 R$.
  - #strong[Nhiệm vụ 2 (Ví dụ):] Cho $triangle.stroked.t A B C$ có
    $hat(A) = 45^compose$, $hat(B) = 75^compose$ và $c = 12$. Tính cạnh
    $a$ và bán kính $R$ của đường tròn ngoại tiếp.

]
#sp-hd[

  - Phát biểu và ghi nhận công thức Định lí sin.
  - Lời giải chi tiết cho Ví dụ 2:
    $hat(C) = 180^compose - 45^compose - 75^compose = 60^compose$.
  - $R = frac(c, 2 sin C) = frac(12, 2 sin 60^compose) = 12 / sqrt(3) = 4 sqrt(3)$.
  - $a = frac(c dot.op s i n A, sin C) = frac(12 dot.op s i n 45^compose, sin 60^compose) = frac(12 dot.op sqrt(2) / 2, sqrt(3) / 2) = 4 sqrt(6)$.

]
#tc-hd[

  - GV hướng dẫn HS liên hệ Định lí sin với bài toán mở đầu (Hoạt động
    1).
  - HS thực hiện nhiệm vụ, báo cáo.
  - GV chuẩn hoá kiến thức, làm rõ vai trò của Định lí sin trong việc
    tính cạnh, góc và bán kính $R$.

==== 2.3. Hoạt động thành phần 2.3: Giải tam giác và ứng dụng thực tế (30 phút)
- #strong[Tên hoạt động:] Giải quyết vấn đề thực tiễn.

]
#mt-hd[
  để #strong[giải tam giác] và giải quyết bài toán thực tế.

]
#nd-hd[
  mở đầu và một bài toán ứng dụng mới.

  - #strong[Nhiệm vụ 1:] Giải quyết trọn vẹn bài toán mở đầu ở Hoạt động
    1: $A B approx 48.6 m$.
  - #strong[Nhiệm vụ 2 (Ví dụ ứng dụng):] Một tháp truyền hình cao $h$
    nằm trên đỉnh một ngọn đồi. Từ hai điểm A và B trên mặt đất cách
    nhau $300 m$, người ta đo được góc $accent(C A B, ̂) = 30^compose$,
    $accent(A B C, ̂) = 45^compose$, và $accent(M A C, ̂) = 60^compose$ (M
    là đỉnh tháp). Tính chiều cao của tháp (C là chân tháp, A và B cùng
    nằm trên đường thẳng đi qua C).

]
#sp-hd[

  - Lời giải chính xác cho bài toán mở đầu (áp dụng Định lí sin).
  - Lời giải cho Ví dụ ứng dụng:
    - Tính cạnh $B C$ trong $triangle.stroked.t A B C$ (áp dụng Định lí
      sin). $accent(A C B, ̂) = 105^compose$.
      $frac(B C, sin 30^compose) = frac(A B, sin 105^compose)$.
      $arrow.r B C approx 155.3 m$.
    - Tính $h = M C$ trong $triangle.stroked.t M B C$ (Áp dụng tỉ số
      lượng giác, hoặc Định lí sin/Côsin).

]
#tc-hd[

  - GV tổ chức HS thực hiện nhiệm vụ theo kĩ thuật #strong[Khăn trải
    bàn] (đảm bảo mọi thành viên đều đóng góp).
  - GV hướng dẫn HS lập sơ đồ các bước giải: #strong[Mô hình hoá]
    $arrow.r$ #strong[Thiết lập công thức] $arrow.r$ #strong[Tính toán].
  - #strong[Tích hợp năng lực số (TT 02/2025/TT-BGDĐT):]
    - #strong[Biểu hiện:] HS sử dụng máy tính điện tử bỏ túi hoặc công
      cụ tính toán trực tuyến (nếu được phép) để thực hiện các phép tính
      lượng giác phức tạp (như tính sin, cos của các góc) trong bài toán
      ứng dụng.
    - #strong[Tên NL số:] Sử dụng và khai thác công nghệ số.

==== 2.4. Hoạt động thành phần 2.4: Công thức tính diện tích tam giác (25 phút)
]
#mt-hd[
  #strong[diện tích tam giác] (công thức thường, công thức Heron, công
  thức liên quan đến $R\,r$).

]
#nd-hd[

  - #strong[Nhiệm vụ 1:] Chứng minh công thức $S = 1 / 2 a b sin C$ (dựa
    trên công thức $S = 1 / 2 a . h_a$). Suy ra công thức
    $S = frac(a b c, 4 R)$.
  - #strong[Nhiệm vụ 2:] Nghiên cứu và vận dụng #strong[công thức Heron]
    $S = sqrt(p\(p - a\)\(p - b\)\(p - c\))$.
  - #strong[Nhiệm vụ 3 (Ví dụ):] Tính diện tích
    $triangle.stroked.t A B C$ có $a = 13\,b = 14\,c = 15$.

]
#sp-hd[

  - Hệ thống các công thức tính diện tích.
  - Lời giải chi tiết cho Ví dụ 3 (nên áp dụng công thức Heron để thấy
    hiệu quả):
    - Nửa chu vi $p = frac(13 + 14 + 15, 2) = 21$.
    - $S = sqrt(21\(21 - 13\)\(21 - 14\)\(21 - 15\)) = sqrt(21 dot.op 8 dot.op 7 dot.op 6) = 84$.

]
#tc-hd[

  - GV giao nhiệm vụ, khuyến khích HS so sánh ưu điểm, nhược điểm của
    mỗi công thức.
  - HS thực hiện nhiệm vụ, GV hỗ trợ.
  - GV chuẩn hoá kiến thức, nhấn mạnh: Tuỳ thuộc vào yếu tố đã biết của
    tam giác để lựa chọn công thức tính diện tích tối ưu nhất.

]
#hd("3", "Luyện tập", "40 phút")
- #strong[Tên hoạt động:] Trò chơi ôn tập - Vận dụng nhanh.

#mt-hd[
Vận dụng kiến thức đã học (Định lí sin, côsin, công thức diện tích) để
giải nhanh các bài tập, củng cố kĩ năng tính toán và chọn công thức tối
ưu.

]
#nd-hd[
- Tổ chức trò chơi #strong[\"Ai nhanh hơn?\"] (Dạng câu hỏi trắc nghiệm
  hoặc điền khuyết về các yếu tố của tam giác).
  - #strong[Câu hỏi 1 (Vận dụng Định lí côsin):] Cho
    $triangle.stroked.t A B C$ có $b = 6\,c = 7\,a = sqrt(37)$. Tính
    $hat(A)$. (Đáp án:
    $cos A = frac(6^2 + 7^2 - 37, 2 dot.op 6 dot.op 7) = 48 / 84 = 4 / 7$).
  - #strong[Câu hỏi 2 (Vận dụng Định lí sin):] Cho
    $triangle.stroked.t A B C$ có $a = 10\,hat(A) = 60^compose$. Tính
    bán kính $R$. (Đáp án:
    $2 R = frac(10, sin 60^compose) arrow.r R = 5 / sqrt(3) / 2 = frac(10 sqrt(3), 3)$).
  - #strong[Câu hỏi 3 (Vận dụng công thức diện tích):] Tính diện tích
    $triangle.stroked.t A B C$ biết $b = 5\,c = 8\,hat(A) = 30^compose$.
    (Đáp án:
    $S = 1 / 2 dot.op 5 dot.op 8 dot.op s i n 30^compose = 10$).
  - #strong[Câu hỏi 4 (Tổng hợp):] Cho tam giác có 3 cạnh là 3, 4, 5.
    Tính bán kính đường tròn nội tiếp $r$. (Đáp án: Tam giác vuông,
    $S = 6$. $p = 6$. $r = S / p = 1$).

]
#sp-hd[
- Đáp án và lời giải nhanh, chính xác cho các câu hỏi luyện tập.
- Ghi nhận điểm số/kết quả cá nhân/nhóm.

]
#tc-hd[
- GV sử dụng công cụ #strong[Quizizz] hoặc #strong[Kahoot!] để tổ chức
  trò chơi trắc nghiệm trực tuyến (phương pháp học tập tích cực).
- #strong[Bước 1:] GV chiếu câu hỏi lên màn hình.
- #strong[Bước 2:] HS làm việc nhóm (hoặc cá nhân) trong thời gian quy
  định (2-3 phút/câu).
- #strong[Bước 3:] HS nhập đáp án vào phần mềm/phiếu trả lời.
- #strong[Bước 4:] GV công bố kết quả, mời HS giải thích các lựa chọn.
- #strong[Tích hợp năng lực số (TT 02/2025/TT-BGDĐT):]
  - #strong[Biểu hiện:] HS sử dụng thành thạo phần mềm Quizizz/Kahoot!
    để trả lời trắc nghiệm, thể hiện khả năng tương tác với môi trường
    học tập số và đánh giá tức thời kết quả học tập.
  - #strong[Tên NL số:] Tương tác và tham gia trong môi trường số.

]
#hd("4", "Vận dụng", "15 phút")
#mt-hd[
Phát triển năng lực mô hình hoá, năng lực giải quyết vấn đề thực tiễn
của học sinh thông qua việc vận dụng kiến thức hệ thức lượng vào các
tình huống thực tế ngoài lớp học.

]
#nd-hd[
- #strong[Nhiệm vụ:] Tìm một tình huống thực tiễn (ví dụ: đo chiều cao
  cột cờ, đo khoảng cách đến vật thể, xác định quỹ đạo bay của máy bay,
  tính diện tích khu đất không đều) mà việc đo lường trực tiếp là khó
  khăn.
- #strong[Yêu cầu:] HS cần #strong[mô hình hoá] tình huống đó thành một
  bài toán tam giác, thu thập số liệu giả định hoặc thực tế (bằng thước
  đo góc, thước dây...), sau đó vận dụng Định lí sin hoặc côsin để giải
  quyết vấn đề.

]
#sp-hd[
- Báo cáo (trình bày dưới dạng tài liệu số hoặc poster) về quá trình:
  - Mô tả tình huống thực tế.
  - Hình ảnh minh hoạ/sơ đồ mô hình hoá.
  - Trình bày lời giải và kết quả tính toán.
  - Nhận xét về tính khả thi của kết quả.

]
#tc-hd[
- GV giao nhiệm vụ, hướng dẫn HS các nguồn tham khảo (Internet) và công
  cụ (GeoGebra, phần mềm thiết kế).
- HS thực hiện nhiệm vụ ngoài giờ học, nộp báo cáo qua Google
  Drive/Zalo/Email để GV nhận xét và cho điểm đánh giá thường xuyên. Báo
  cáo sẽ được trao đổi, chia sẻ và đánh giá ở tiết học đầu tiên của bài
  tiếp theo.
- #strong[Tích hợp năng lực số (TT 02/2025/TT-BGDĐT):]
  - #strong[Biểu hiện:] HS thiết kế và trình bày báo cáo bằng công cụ
    tạo nội dung số (ví dụ: PowerPoint, Canva), sử dụng công cụ lưu trữ
    và chia sẻ (Google Drive) để nộp bài.
  - #strong[Tên NL số:] Tương tác và tham gia trong môi trường số (lưu
    trữ và chia sẻ dữ liệu), Tạo nội dung số.

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
