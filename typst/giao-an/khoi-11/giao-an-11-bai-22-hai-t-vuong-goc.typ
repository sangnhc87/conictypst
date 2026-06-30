// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 22 Hai ĐT vuông góc",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm và tính được #strong[góc giữa hai đường thẳng]
  trong không gian.
- Nêu được khái niệm và nhận biết được #strong[hai đường thẳng vuông
  góc] trong không gian.
- Nắm vững tính chất của góc giữa hai đường thẳng và điều kiện để hai
  đường thẳng vuông góc.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến
    thức mới về góc giữa hai đường thẳng và hai đường thẳng vuông góc
    thông qua SGK và học liệu được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày, bảo vệ ý kiến của mình và lắng nghe, phản hồi ý kiến của
    bạn bè.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống thực tiễn/bài tập, đề xuất giải pháp để xác định góc và chứng
    minh quan hệ vuông góc.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực tư duy và lập luận toán học:] Hình thành và lập
    luận các bước tính góc, chứng minh quan hệ vuông góc.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các quan hệ
    vuông góc trong không gian thành các mô hình hình học để giải quyết
    bài toán.
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán:] Sử dụng
    thước, ê-ke, máy tính cầm tay, và #strong[phần mềm hình học tương
    tác] (như GeoGebra) để trực quan hóa, đo đạc và kiểm tra kết quả.
- #strong[Năng lực số (theo Thông tư số 02/2025/TT-BGDĐT):]
  - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
  - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
    tin và nội dung trong môi trường số.
  - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin
    và nội dung này cũng như điều hướng giữa chúng.
  - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, chủ động tham gia các hoạt động học tập
  cá nhân và nhóm.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ được giao, có trách
  nhiệm với kết quả học tập của bản thân và nhóm.
- #strong[Trung thực:] Trung thực trong việc báo cáo kết quả, tự đánh
  giá và nhận xét.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Đối với giáo viên:]
  - Giáo án (Kế hoạch bài dạy) chi tiết, SGK Toán 11 (Bộ KNTT).
  - Máy chiếu, máy tính, phiếu học tập, hệ thống câu hỏi trắc nghiệm (sử
    dụng Google Forms hoặc Kahoot để đánh giá nhanh).
  - Một số mô hình trực quan về các hình khối cơ bản (hình lập phương,
    hình hộp chữ nhật) để minh họa vị trí tương đối và quan hệ vuông
    góc.
  - Máy tính có cài đặt #strong[phần mềm GeoGebra] (hoặc các phần mềm
    hình học 3D khác) để trình chiếu và mô phỏng.
- #strong[Đối với học sinh:]
  - SGK Toán 11, vở ghi, đồ dùng học tập (thước, compa, máy tính cầm
    tay).
  - Điện thoại thông minh hoặc máy tính bảng (có thể dùng chung theo
    nhóm) có kết nối Internet để tra cứu và sử dụng phần mềm GeoGebra,
    hoặc để tham gia trò chơi Kahoot/phiếu khảo sát trực tuyến.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "5 phút")
==== a) Mục tiêu
- Kích thích hứng thú học tập và tạo tình huống có vấn đề.
- Giúp học sinh nhận ra sự cần thiết của việc xác định góc giữa hai
  đường thẳng và quan hệ vuông góc trong không gian.

==== b) Nội dung
- Giáo viên (GV) trình chiếu hình ảnh #strong[Tháp Eiffel] hoặc
  #strong[khuôn viên một ngôi nhà/phòng học] có các thanh giằng, cột, xà
  ngang.
- #strong[Nhiệm vụ:]
  - Quan sát các hình ảnh và xác định các cặp đường thẳng có vị trí
    tương đối #strong[cắt nhau, song song, chéo nhau].
  - Trong các cặp đường thẳng đó, có cặp nào tạo với nhau góc
    $90^compose$ (vuông góc)?
  - #strong[Câu hỏi gợi mở:] Trong không gian, hai đường thẳng chéo nhau
    thì góc giữa chúng được xác định như thế nào? Hai đường thẳng chéo
    nhau có thể vuông góc với nhau không?

==== c) Sản phẩm
- Kết quả xử lí tình huống: Học sinh nhận diện và chỉ ra được các cặp
  đường thẳng (hoặc vật thể) vuông góc với nhau trong thực tế (ví dụ:
  cột nhà và xà ngang, chân bàn và mặt bàn).
- Đề xuất cách thức giải quyết: Học sinh bước đầu nêu ra ý tưởng cần
  phải tìm cách đưa hai đường thẳng về cùng một mặt phẳng hoặc tìm cách
  xác định góc thông qua các đường thẳng song song.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ học tập (1 phút):] GV chiếu hình ảnh và
  đặt câu hỏi/nhiệm vụ.
- #strong[Bước 2: Thực hiện nhiệm vụ (2 phút):] Học sinh quan sát, suy
  nghĩ cá nhân (1 phút), sau đó thảo luận nhanh với bạn bên cạnh (1
  phút).
- #strong[Bước 3: Báo cáo, thảo luận (1 phút):] GV mời 1-2 học sinh xung
  phong trả lời. GV ghi nhận các ý kiến, đặc biệt là các ý kiến liên
  quan đến \"chéo nhau\" và \"vuông góc\".
- #strong[Bước 4: Kết luận, nhận định (1 phút):] GV tóm tắt, dẫn dắt vào
  bài học mới: \"Để trả lời chính xác và có cơ sở toán học cho các câu
  hỏi này, chúng ta sẽ cùng nghiên cứu bài học hôm nay: #strong[Hai
  đường thẳng vuông góc]\.\"

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "70 phút")
==== 2.1. Hoạt động thành phần 2.1: Góc giữa hai đường thẳng (35 phút)
===== a) Mục tiêu
- Xây dựng và nắm vững định nghĩa góc giữa hai đường thẳng trong không
  gian.
- Áp dụng công thức và kĩ năng để tính toán được góc giữa hai đường
  thẳng.

===== b) Nội dung
- #strong[Nhiệm vụ:]

  - Nghiên cứu SGK, thảo luận nhóm để định nghĩa góc giữa hai đường
    thẳng $a$ và $b$ bất kì trong không gian (trường hợp $a$ cắt $b$,
    $a$ song song $b$, $a$ chéo $b$).
  - Tìm cách xác định góc giữa hai đường thẳng chéo nhau (sử dụng đường
    thẳng phụ song song).
  - Thực hiện #strong[Ví dụ 1] và #strong[Ví dụ 2] trong phiếu học tập.

- #strong[Tích hợp năng lực số:] Học sinh sử dụng phần mềm
  #strong[GeoGebra] (nếu có điều kiện máy chiếu và thiết bị) để vẽ hình
  chóp S.ABCD, mô phỏng góc giữa hai đường thẳng chéo nhau (ví dụ: góc
  giữa SA và BC). #strong[Biểu hiện năng lực số:] Tạo lập và tương tác
  trong môi trường số (sử dụng phần mềm hình học để trực quan hóa).

- #strong[Ví dụ 1 (Minh họa trực quan):]

  - Cho hình hộp chữ nhật $A B C D . A' B' C' D'$. Hãy xác định góc
    giữa:
    - a) $A B$ và $A D$ (cắt nhau).
    - b) $A B$ và $A' B'$ (song song).
    - c) $A B$ và $C' D'$ (chéo nhau).
    - d) $A D$ và $B' C'$ (song song).

- #strong[Ví dụ 2 (Tính toán):]

  - Cho hình lập phương $A B C D . A' B' C' D'$. Tính góc giữa hai đường
    thẳng:
    - a) $A C$ và $B' D'$.
    - b) $A B'$ và $B C'$.

===== c) Sản phẩm
- Định nghĩa chính xác về góc giữa hai đường thẳng $a\,b$: Là góc giữa
  hai đường thẳng $a'$ và $b'$ cùng đi qua một điểm $O$ và lần lượt song
  song với $a$ và $b$. (Lưu ý:
  $0^compose lt.eq alpha lt.eq 90^compose$).
- Đáp án và lời giải chi tiết cho Ví dụ 1 và Ví dụ 2. (Ví dụ 2a:
  $A C\/\/A' C'$, góc giữa $A' C'$ và $B' D'$ là $90^compose$\; Ví dụ
  2b: $B C'\/\/A D'$, góc giữa $A B'$ và $A D'$ là $60^compose$ (do
  $A B' D'$ là tam giác đều)).

===== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ học tập (1 phút):] GV chia lớp thành các
  nhóm nhỏ (4-5 học sinh) và phát phiếu học tập bao gồm nội dung nghiên
  cứu và Ví dụ 1, Ví dụ 2.
- #strong[Bước 2: Thực hiện nhiệm vụ (25 phút):]
  - Học sinh đọc SGK, thảo luận nhóm để rút ra định nghĩa và cách xác
    định góc.
  - Các nhóm thực hiện Ví dụ 1 và Ví dụ 2. GV khuyến khích nhóm sử dụng
    mô hình hình học hoặc GeoGebra (trên máy GV chiếu lên) để trực quan
    hóa, hỗ trợ.
  - GV quan sát, theo dõi, #strong[hỗ trợ] kịp thời các nhóm gặp khó
    khăn (Dự kiến khó khăn: Học sinh chưa quen với việc tìm đường thẳng
    song song phù hợp để xác định góc giữa hai đường thẳng chéo nhau).
- #strong[Bước 3: Báo cáo, thảo luận (7 phút):]
  - GV mời đại diện 2 nhóm lên trình bày kết quả Ví dụ 1 và Ví dụ 2 trên
    bảng (có thể vẽ hình hoặc dùng hình chiếu từ GeoGebra).
  - GV điều hành thảo luận chung, đặt câu hỏi phản biện giữa các nhóm.
- #strong[Bước 4: Kết luận, nhận định (2 phút):] GV chính xác hóa định
  nghĩa, tóm tắt phương pháp xác định và tính góc.

==== 2.2. Hoạt động thành phần 2.2: Hai đường thẳng vuông góc (35 phút)
===== a) Mục tiêu
- Nắm vững định nghĩa và tính chất của hai đường thẳng vuông góc trong
  không gian.
- Áp dụng để chứng minh hai đường thẳng vuông góc.

===== b) Nội dung
- #strong[Nhiệm vụ:]

  - Nghiên cứu SGK để đưa ra định nghĩa hai đường thẳng $a$ và $b$ vuông
    góc với nhau ($alpha = 90^compose$).
  - Nghiên cứu tính chất: Nếu một đường thẳng vuông góc với một trong
    hai đường thẳng song song thì vuông góc với đường thẳng còn lại.
  - Thực hiện #strong[Ví dụ 3] và #strong[Ví dụ 4] trong phiếu học tập.

- #strong[Phương pháp dạy học tích cực:] #strong[Dạy học khám phá/Giải
  quyết vấn đề]. Sử dụng mô hình hình học để học sinh tự mình \"khám
  phá\" mối liên hệ vuông góc.

- #strong[Ví dụ 3 (Chứng minh vuông góc đơn giản):]

  - Cho hình lập phương $A B C D . A' B' C' D'$. Chứng minh:
    - a) $A' B'$ vuông góc với $B' C'$.
    - b) $A B$ vuông góc với $B' C'$. (Áp dụng tính chất)

- #strong[Ví dụ 4 (Sử dụng vector/tọa độ - tùy chọn nâng cao):]

  - Trong không gian Oxyz, cho hai đường thẳng $d_1$:
    $frac(x - 1, 1) = frac(y + 2, 1) = frac(z, - 2)$ và $d_2$:
    $x / 2 = frac(y - 1, m) = frac(z - 2, 1)$. Tìm giá trị của $m$ để
    $d_1 perp d_2$. (GV có thể điều chỉnh mức độ, nếu cần).

===== c) Sản phẩm
- Định nghĩa chính xác: Hai đường thẳng $a\,b$ vuông góc với nhau khi
  góc giữa chúng bằng $90^compose$ (kí hiệu $a perp b$).
- Lời giải và chứng minh chi tiết cho Ví dụ 3 và Ví dụ 4.

===== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ học tập (1 phút):] GV nêu nhiệm vụ.
- #strong[Bước 2: Thực hiện nhiệm vụ (25 phút):]
  - Học sinh thảo luận nhóm, đưa ra định nghĩa và tính chất.
  - Các nhóm tiến hành chứng minh Ví dụ 3 (sử dụng mô hình trực quan để
    minh họa).
  - GV lưu ý học sinh về việc xác định đường thẳng song song khi chứng
    minh vuông góc đối với hai đường thẳng chéo nhau.
- #strong[Bước 3: Báo cáo, thảo luận (7 phút):]
  - GV mời đại diện 2 nhóm lên bảng #strong[thuyết trình] và trình bày
    lời giải Ví dụ 3, Ví dụ 4.
  - #strong[Tăng cường kĩ năng giao tiếp, thuyết trình:] Các nhóm khác
    đặt câu hỏi phản biện về cách chứng minh.
- #strong[Bước 4: Kết luận, nhận định (2 phút):] GV chuẩn hóa kiến thức,
  nhấn mạnh: Hai đường thẳng chéo nhau vẫn có thể vuông góc với nhau.

#hd("3", "Luyện tập", "10 phút")
- #strong[Tên hoạt động:] Củng cố - Trò chơi \"Ai nhanh hơn\"

==== a) Mục tiêu
- Củng cố kiến thức và kĩ năng tính góc, nhận biết quan hệ vuông góc đã
  học.
- Rèn luyện kĩ năng tính toán nhanh, chính xác.

==== b) Nội dung
- #strong[Nội dung:] Hệ thống 4-5 câu hỏi trắc nghiệm/tự luận ngắn (dạng
  nhận biết, thông hiểu) về góc giữa hai đường thẳng và quan hệ vuông
  góc.
- #strong[Phương pháp dạy học tích cực:] #strong[Trò chơi học tập] (sử
  dụng Kahoot, Quizziz hoặc hình thức hỏi đáp nhanh).
- #strong[Ví dụ câu hỏi:]
  - #emph[Câu 1 (Nhận biết):] Góc giữa hai đường thẳng $a$ và $b$ trong
    không gian là $alpha$. Giá trị của $alpha$ nằm trong khoảng nào?
  - #emph[Câu 2 (Thông hiểu):] Cho hình chóp $S . A B C$ có
    $S A perp A B$ và $S A perp A C$. Góc giữa $S A$ và $B C$ bằng bao
    nhiêu?

==== c) Sản phẩm
- Đáp án, lời giải nhanh và chính xác của các câu hỏi.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (1 phút):] GV phổ biến luật chơi (thời
  gian trả lời, cách tính điểm).
- #strong[Bước 2: Học sinh thực hiện (7 phút):] Học sinh tham gia trò
  chơi (cá nhân hoặc theo nhóm). #strong[Tích hợp năng lực số:] Học sinh
  sử dụng thiết bị để tham gia game online (Kahoot/Quizziz).
  #strong[Biểu hiện năng lực số:] Khai thác và xử lí thông tin số (thao
  tác nhanh trên thiết bị để trả lời).
- #strong[Bước 3: Kiểm tra, đánh giá (2 phút):] GV công bố kết quả, nhận
  xét nhanh, giải đáp các câu hỏi học sinh còn sai sót.

#hd("4", "Vận dụng", "5 phút")
==== a) Mục tiêu
- Phát triển năng lực vận dụng kiến thức, kĩ năng vào giải quyết các
  tình huống thực tiễn.

==== b) Nội dung
- #strong[Nhiệm vụ:]
  - #strong[Lập sơ đồ tư duy (Mindmap)] tổng hợp kiến thức bài học (góc
    giữa hai đường thẳng, hai đường thẳng vuông góc).
  - #strong[Bài tập về nhà (Giao nhiệm vụ ngoài giờ lên lớp):]
    - #strong[Yêu cầu:] Hãy tìm kiếm trong thực tế (xây dựng, kiến trúc,
      nội thất) một mô hình có quan hệ hai đường thẳng chéo nhau và
      vuông góc với nhau.
    - #strong[Sản phẩm:] Viết một đoạn văn ngắn (tối đa 200 chữ) mô tả
      mô hình đó và giải thích tại sao hai đường thẳng đó vuông góc (có
      thể kèm ảnh chụp hoặc bản vẽ tay).
    - #strong[Tích hợp năng lực số:] Khuyến khích học sinh tìm kiếm
      thông tin, hình ảnh trên Internet. #strong[Biểu hiện năng lực số:]
      Khai thác và xử lí thông tin số (tìm kiếm và chọn lọc thông tin).

==== c) Sản phẩm
- Sơ đồ tư duy về nội dung bài học.
- Báo cáo (bài thu hoạch) về ứng dụng thực tiễn (nộp vào buổi học sau).

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (1 phút):] GV giao nhiệm vụ lập sơ đồ tư
  duy và Bài tập Vận dụng về nhà.
- #strong[Bước 2: Hướng dẫn thực hiện (2 phút):] GV hướng dẫn học sinh
  cách thức tìm kiếm thông tin (nếu cần), nhấn mạnh tính sáng tạo và
  thực tiễn của bài tập.
- #strong[Bước 3: Nhận định (2 phút):] GV chốt lại bài học, dặn dò học
  sinh chuẩn bị bài mới.

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

