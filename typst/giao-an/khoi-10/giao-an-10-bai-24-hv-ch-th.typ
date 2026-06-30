// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 24 HV CH TH",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm và công thức tính #strong[số hoán vị] của $n$ phần
  tử, #strong[số chỉnh hợp chập] $k$ #strong[của] $n$ #strong[phần tử],
  và \*\*số tổ hợp chập $k$ của $n$ phần tử\$.
- Giải được các bài toán đếm đơn giản áp dụng quy tắc nhân, quy tắc
  cộng, hoán vị, chỉnh hợp, tổ hợp.
- Phân biệt được các khái niệm Hoán vị, Chỉnh hợp, Tổ hợp thông qua các
  dấu hiệu: #strong[có sắp xếp/không sắp xếp], #strong[tất cả/một phần].

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung]:
  - #strong[Tự chủ và tự học]: Tự giác tìm hiểu các ví dụ liên quan đến
    tổ hợp, chỉnh hợp, hoán vị trong sách giáo khoa và tài liệu tham
    khảo.
  - #strong[Giao tiếp và hợp tác]: Tích cực thảo luận nhóm, phân công
    nhiệm vụ và trình bày kết quả làm việc nhóm thông qua báo cáo hoặc
    sơ đồ tư duy.
  - #strong[Giải quyết vấn đề và sáng tạo]: Phân tích được tình huống
    bài toán để lựa chọn công thức đếm phù hợp (Hoán vị, Chỉnh hợp hay
    Tổ hợp).
- #strong[Năng lực đặc thù môn học]:
  - #strong[Năng lực tư duy và lập luận toán học]: Phân tích, so sánh để
    xây dựng và chứng minh công thức tính.
  - #strong[Năng lực mô hình hoá toán học]: Vận dụng các công thức đếm
    để mô hình hoá và giải quyết các bài toán thực tiễn.
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán]: Sử dụng máy
    tính cầm tay hoặc phần mềm để tính toán $P_n\,A_n^k\,C_n^k$.
- #strong[Năng lực số] (Tích hợp theo TT 02/2025/TT-BGDĐT):
  - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
  - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
    tin và nội dung trong môi trường số.
  - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin
    và nội dung này cũng như điều hướng giữa chúng.
  - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ]: Hoàn thành đầy đủ các nhiệm vụ học tập được giao,
  bao gồm bài tập trên lớp và bài tập vận dụng ngoài giờ.
- #strong[Trung thực]: Nghiêm túc, tự giác trong quá trình làm bài cá
  nhân và báo cáo kết quả thảo luận nhóm.
- #strong[Trách nhiệm]: Tích cực tham gia xây dựng bài, đóng góp ý kiến
  để hoàn thiện sản phẩm học tập của nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
+ #strong[Thiết bị dạy học]: Máy chiếu, máy tính kết nối mạng, bảng,
  phấn/bút viết, phiếu học tập, #strong[bộ mô hình trực quan] (ví dụ: 5
  thẻ số khác nhau để minh họa hoán vị/chỉnh hợp).
+ #strong[Học liệu]:
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Máy tính cầm tay (casio fx-570ES Plus, fx-880BTG hoặc tương đương).
  - Link bài tập trắc nghiệm online (sử dụng Google Forms/Quizizz) để
    luyện tập.
  - Phần mềm/ứng dụng trực tuyến (Jamboard, Padlet) để thiết kế Sơ đồ tư
    duy.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
- Học sinh xác định được vấn đề cốt lõi của bài học là #strong[phương
  pháp đếm nhanh] trong các tình huống thực tế.
- Gợi mở nhu cầu tìm hiểu các công cụ đếm mạnh hơn quy tắc cộng/nhân.

]
#nd-hd[
- #strong[Giáo viên] chiếu một tình huống thực tiễn gắn với các bài toán
  đếm (chưa sử dụng công thức Hoán vị, Chỉnh hợp, Tổ hợp).
- #strong[Tình huống/Ví dụ]: \"Một đội văn nghệ có 3 bạn (An, Bình,
  Chi). Có bao nhiêu cách để:
  #block[
  #set enum(numbering: "a.", start: 1)
  + Xếp 3 bạn thành một hàng ngang để chụp ảnh? (Bài toán Hoán vị)
  + Chọn ra 2 bạn, phân công 1 bạn làm MC và 1 bạn làm ca sĩ? (Bài toán
    Chỉnh hợp)
  + Chọn ra 2 bạn để cùng tham gia một tiết mục đồng ca? (Bài toán Tổ
    hợp)\"
  ]
- #strong[Học sinh] làm việc cá nhân, sau đó thảo luận nhanh với bạn bên
  cạnh (cặp đôi) để đưa ra câu trả lời cho 3 câu hỏi.

]
#sp-hd[
- #strong[Đáp án dự kiến]:
  #block[
  #set enum(numbering: "a.", start: 1)
  + $3 times 2 times 1 = 6$ cách.
  + $3 times 2 = 6$ cách.
  + $3$ cách (An-Bình, An-Chi, Bình-Chi).
  ]
- #strong[Yêu cầu]: Học sinh trình bày rõ cách đếm thủ công/sử dụng quy
  tắc nhân và nhận thấy sự khác biệt về bản chất giữa các tình huống.

]
#tc-hd[
- #strong[Bước 1: Giao nhiệm vụ]: GV chiếu tình huống, yêu cầu HS làm
  việc cá nhân 3 phút và ghi đáp án \* #strong[Bước 2: Thực hiện nhiệm
  vụ]: HS tự làm. GV quan sát, định hướng (gợi ý về \"có sắp xếp\" và
  \"không sắp xếp\" nếu cần).
- #strong[Bước 3: Báo cáo, thảo luận]: GV gọi 2-3 HS trình bày kết quả
  và cách làm.
- #strong[Bước 4: Kết luận, nhận định]: GV nhận xét, chỉ ra sự khác nhau
  giữa các tình huống và đặt vấn đề: #strong[Làm thế nào để đếm nhanh
  hơn, không cần liệt kê, cho những bài toán đếm lớn?] =\> Dẫn vào bài
  mới.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "130 phút")
==== #strong[Hoạt động 2.1: Hoán vị (30 phút)]
- #strong[Mục tiêu]: Nắm được khái niệm #strong[Hoán vị] và công thức
  tính $P_n$.
- #strong[Nội dung]:
  - #strong[Thực hành]: Sử dụng #strong[bộ mô hình trực quan] (3-5 thẻ
    số/tên) để sắp xếp và đếm số cách sắp xếp tất cả các thẻ.
  - #strong[Thảo luận nhóm]: Làm việc nhóm 4 người để trả lời câu hỏi:
    #emph[Việc sắp xếp] $n$ #emph[phần tử là ứng dụng của quy tắc đếm
    nào? Từ đó suy ra công thức tổng quát] $P_n$.
- #strong[Sản phẩm]: Định nghĩa Hoán vị, công thức $P_n = n !$.
- #strong[Tổ chức thực hiện]:
  - GV giao nhiệm vụ, hướng dẫn HS sử dụng mô hình trực quan (ví dụ: xếp
    4 cuốn sách khác nhau lên kệ).
  - HS làm việc nhóm (5 phút), đại diện nhóm trình bày công thức.
  - GV chuẩn hóa kiến thức, đưa ra Ví dụ 1: #emph[Một lớp có 10 học
    sinh. Hỏi có bao nhiêu cách xếp 10 học sinh đó vào một hàng ngang?]
    (Sử dụng máy tính cầm tay để tính $P_10$).

==== #strong[Hoạt động 2.2: Chỉnh hợp (35 phút)]
- #strong[Mục tiêu]: Nắm được khái niệm #strong[Chỉnh hợp] và công thức
  tính $A_n^k$.
- #strong[Nội dung]:
  - #strong[Phân tích và so sánh]: Quay lại tình huống 2 ở phần mở đầu:
    \"Chọn 2 bạn (trong 3 bạn) làm MC và ca sĩ\". #strong[Phân tích] sự
    khác biệt so với Hoán vị (chỉ chọn $k$ phần tử, và #strong[có sắp
    xếp]).
  - #strong[Thảo luận nhóm/Làm việc nhóm]: Xây dựng công thức tính số
    cách chọn $k$ phần tử và sắp xếp chúng theo quy tắc nhân, từ đó suy
    ra công thức tổng quát $A_n^k$.
- #strong[Sản phẩm]: Định nghĩa Chỉnh hợp, công thức
  $A_n^k = frac(n !, \(n - k\)!)$.
- #strong[Tổ chức thực hiện]:
  - GV đặt câu hỏi gợi mở: #emph[Nếu chọn 2 bạn trong 10 bạn để phân
    công chức vụ Bí thư và Lớp trưởng, thứ tự có quan trọng không?]
  - HS thảo luận, đại diện nhóm trình bày cách xây dựng công thức
    $A_n^k$.
  - GV chuẩn hóa. Ví dụ 2: #emph[Từ 10 người, chọn ra 3 người để trao 3
    giải thưởng khác nhau (Nhất, Nhì, Ba). Hỏi có bao nhiêu cách?]
  - #strong[Tích hợp năng lực số]: GV yêu cầu HS sử dụng máy tính cầm
    tay (chức năng $""^n P_k$) để kiểm tra nhanh kết quả tính toán.

==== #strong[Hoạt động 2.3: Tổ hợp (35 phút)]
- #strong[Mục tiêu]: Nắm được khái niệm #strong[Tổ hợp] và công thức
  tính $C_n^k$. Phân biệt rõ Tổ hợp và Chỉnh hợp.
- #strong[Nội dung]:
  - #strong[Thực hành/Phân tích]: Quay lại tình huống 3 ở phần mở đầu:
    \"Chọn 2 bạn (trong 3 bạn) tham gia đồng ca\". #strong[Phân tích] sự
    khác biệt so với Chỉnh hợp (chọn $k$ phần tử, nhưng #strong[không
    sắp xếp]).
  - #strong[Thảo luận nhóm]: Nhận thấy mối liên hệ giữa $A_n^k$ và
    $C_n^k$: #emph[Mỗi Tổ hợp chập] $k$ #emph[tạo ra] $k !$ #emph[Chỉnh
    hợp chập] $k$. Từ đó, suy ra công thức tổng quát $C_n^k$.
- #strong[Sản phẩm]: Định nghĩa Tổ hợp, công thức
  $C_n^k = frac(n !, k !\(n - k\)!)$.
- #strong[Tổ chức thực hiện]:
  - GV đặt vấn đề: #emph[Trong bài toán \"chọn 5 học sinh trong 40 học
    sinh làm thành viên đội tuyển Toán\", thứ tự chọn có quan trọng
    không?].
  - HS thảo luận và suy ra công thức liên hệ giữa $A_n^k$ và $C_n^k$.
  - GV chuẩn hóa. Ví dụ 3: #emph[Từ 10 điểm phân biệt, có thể tạo ra bao
    nhiêu đoạn thẳng?] (Chọn 2 điểm không sắp xếp).
  - #strong[Tích hợp năng lực số]: Yêu cầu HS sử dụng máy tính cầm tay
    (chức năng $""^n C_k$) để tính toán.

==== #strong[Hoạt động 2.4: Ứng dụng của hoán vị, chỉnh hợp, tổ hợp vào các bài toán đếm (30 phút)]
- #strong[Mục tiêu]: Vận dụng linh hoạt 3 công thức đếm để giải quyết
  các bài toán tổng hợp.
- #strong[Nội dung]: #strong[Làm việc nhóm (Sơ đồ tư duy)].
  - #strong[Nhiệm vụ]: Giải quyết 2 bài tập tổng hợp và xây dựng
    #strong[Sơ đồ tư duy] tóm tắt các dấu hiệu nhận biết Hoán vị, Chỉnh
    hợp và Tổ hợp.
  - #strong[Bài tập vận dụng]: \*Một lớp có 20 học sinh.
    - #strong[Bài 1]: Chọn 3 học sinh làm ba nhiệm vụ khác nhau (Lau
      bảng, trực nhật, tưới cây).
    - #strong[Bài 2]: Chọn ra 3 học sinh đi tham gia giao lưu văn nghệ
      (3 bạn có vai trò như nhau).\*
- #strong[Sản phẩm]: Lời giải 2 bài tập và Sơ đồ tư duy về 3 công thức
  đếm (có thể là hình ảnh số trên Padlet/Jamboard).
- #strong[Tổ chức thực hiện]:
  - GV chia lớp thành 4 nhóm. Các nhóm cùng giải bài tập và thiết kế
    #strong[Sơ đồ tư duy số] bằng công cụ trực tuyến (Padlet hoặc
    Jamboard).
  - #strong[Tích hợp năng lực số (Năng lực giao tiếp và hợp tác trong
    môi trường số)]: Các thành viên nhóm tương tác và cùng chỉnh sửa sơ
    đồ tư duy trên nền tảng số.
  - Các nhóm báo cáo (trình bày sơ đồ trên máy chiếu). GV nhận xét, đánh
    giá sản phẩm.

#hd("3", "Luyện tập", "25 phút")
- #strong[Tên hoạt động]: #strong[Thực hành giải bài tập và Trò chơi
  \"Ai nhanh hơn?\"]

#mt-hd[
- Học sinh củng cố kiến thức, vận dụng thành thạo các công thức tính
  Hoán vị, Chỉnh hợp và Tổ hợp.
- Phát triển kĩ năng tính toán nhanh, chính xác.

]
#nd-hd[
- #strong[Bài tập 1 (Củng cố)]: Giải các bài tập trong SGK (ví dụ: Bài
  1.4, 1.5 - SGK KNTT).
- #strong[Bài tập 2 (Trò chơi)]: Tổ chức trò chơi #strong[\"Ai nhanh
  hơn?\"] dưới hình thức trắc nghiệm ngắn (5 câu) sử dụng Google Forms
  hoặc Quizizz (bài tập được thiết kế sẵn).
- #strong[Ví dụ câu hỏi Trò chơi]: #emph[Số cách chọn 5 người từ một
  nhóm 15 người để thành lập một đội công tác là bao nhiêu?] (Đáp án là
  $C_15^5$).

]
#sp-hd[
- Đáp án, lời giải đúng của các bài tập SGK.
- Kết quả trả lời nhanh, chính xác các câu hỏi trong trò chơi (thể hiện
  qua điểm số).

]
#tc-hd[
- #strong[Bước 1: Giải bài tập SGK]: GV giao bài tập, HS làm việc cá
  nhân/cặp đôi, sau đó gọi HS lên bảng trình bày.
- #strong[Bước 2: Tổ chức Trò chơi]:
  - GV gửi link bài trắc nghiệm online (sử dụng Google Forms/Quizizz).
  - HS sử dụng điện thoại/máy tính để trả lời nhanh.
  - GV theo dõi kết quả tự động hiển thị, tuyên dương người chiến thắng.
  - #strong[Tích hợp năng lực số (Sử dụng và quản lí thông tin số)]: HS
    tự thực hiện bài kiểm tra trên nền tảng số.

]
#hd("4", "Vận dụng", "15 phút - Giao nhiệm vụ và hướng dẫn")
#mt-hd[
- Học sinh phát triển năng lực vận dụng kiến thức, kĩ năng vào giải
  quyết các vấn đề thực tiễn gắn với các bài toán đếm.

]
#nd-hd[
- #strong[Nhiệm vụ Vận dụng]: Học sinh phát hiện/đề xuất 2-3 vấn đề/tình
  huống trong thực tiễn (ví dụ: Lập mã PIN điện thoại, chọn ban cán sự
  lớp, sắp xếp lịch trực,...) có thể giải quyết bằng công thức Hoán vị,
  Chỉnh hợp hoặc Tổ hợp.
- #strong[Yêu cầu]: Giải quyết các tình huống đã đề xuất và trình bày
  dưới dạng #strong[Báo cáo điện tử] (có thể là file Word, PDF, hoặc
  trình chiếu đơn giản).

==== b) Sản phẩm
- Báo cáo điện tử (file Word/PDF/Trình chiếu) trình bày rõ:
  - Tình huống thực tiễn.
  - Phân tích: Đó là Hoán vị, Chỉnh hợp hay Tổ hợp?
  - Lời giải toán học và kết quả.

]
#tc-hd[
- #strong[Bước 1: Giao nhiệm vụ]: GV giao nhiệm vụ, hướng dẫn cách tìm
  kiếm tình huống thực tế.
- #strong[Bước 2: Hướng dẫn thực hiện]: GV hướng dẫn HS về yêu cầu của
  báo cáo, thời hạn nộp (ví dụ: cuối tuần) và hình thức nộp (gửi qua
  email hoặc Google Drive của lớp).
- #strong[Bước 3: Chia sẻ và đánh giá]: Sẽ tổ chức trao đổi, chia sẻ và
  đánh giá vào đầu tiết học tuần sau.
- #strong[Tích hợp năng lực số (Sử dụng và quản lí thông tin số)]: Học
  sinh sử dụng công cụ văn phòng để tạo báo cáo và gửi nộp sản phẩm qua
  môi trường số.

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
