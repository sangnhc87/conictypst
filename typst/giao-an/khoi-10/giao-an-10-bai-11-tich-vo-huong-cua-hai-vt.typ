// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 11 Tích vô hướng của hai VT",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
+ #strong[Về kiến thức:]

  - Nêu được #strong[khái niệm góc giữa hai vectơ] $arrow(u)$ và
    $arrow(v)$ (kể cả trường hợp $arrow(u)$ hoặc $arrow(v)$ là
    vectơ-không).
  - Nêu được #strong[khái niệm tích vô hướng của hai vectơ] $arrow(u)$
    và $arrow(v)$.
  - Mô tả được #strong[biểu thức tọa độ của tích vô hướng] của hai
    vectơ.
  - Trình bày được các #strong[tính chất] của tích vô hướng.
  - Vận dụng được công thức tích vô hướng để tính độ dài của vectơ và
    góc giữa hai vectơ.
  - Sử dụng được tích vô hướng để kiểm tra điều kiện #strong[hai vectơ
    vuông góc].

+ #strong[Về năng lực:]

  - #strong[Năng lực chung:]
    - #strong[Tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến thức
      mới về tích vô hướng của hai vectơ.
    - #strong[Giao tiếp và hợp tác:] Hợp tác hiệu quả trong nhóm để thực
      hiện nhiệm vụ học tập, chia sẻ ý tưởng và trình bày kết quả.
    - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp thông
      tin, đề xuất và lựa chọn giải pháp tối ưu để giải quyết các bài
      toán liên quan đến tích vô hướng.
  - #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
    - #strong[Năng lực tư duy và lập luận toán học:] Phát hiện quy luật,
      chứng minh tính chất của tích vô hướng.
    - #strong[Năng lực mô hình hóa toán học:] Thiết lập mối liên hệ giữa
      các khái niệm (góc, độ dài, tích vô hướng) và vận dụng vào giải
      quyết các bài toán thực tiễn.
    - #strong[Năng lực sử dụng công cụ, phương tiện toán học:] Sử dụng
      máy tính cầm tay, phần mềm #strong[GeoGebra] (tích hợp Năng lực
      số) để minh họa, kiểm chứng kết quả và xây dựng mô hình.
  - #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
    - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
    - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu,
      thông tin và nội dung trong môi trường số.
    - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông
      tin và nội dung này cũng như điều hướng giữa chúng.
    - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
    - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.

#quote(block: true)[
#strong[\3. Về phẩm chất:]
]

- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  đầy đủ nhiệm vụ được giao.
- #strong[Trung thực:] Nghiêm túc, trung thực trong quá trình giải quyết
  bài tập và đánh giá kết quả của bản thân/nhóm.
- #strong[Trách nhiệm:] Có ý thức hợp tác, hỗ trợ đồng đội trong hoạt
  động nhóm; có trách nhiệm với sản phẩm học tập của mình.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- Máy chiếu, máy tính kết nối mạng, loa.
- #strong[Học liệu số:] Phần mềm #strong[GeoGebra] (dùng để minh họa góc
  giữa hai vectơ, tính toán tích vô hướng theo tọa độ).
- Phiếu học tập, bảng phụ/giấy A0, bút dạ.
- Bộ thẻ trò chơi \"Ghép đôi Khái niệm - Công thức\" (Hoạt động 3).
- Sách giáo khoa Toán 10 - Kết nối tri thức với cuộc sống.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
- #strong[Tên hoạt động:] #strong[Khởi động: Vectơ và Công cơ học]

#mt-hd[
  (vectơ, lực, độ dài, góc) và giúp học sinh nhận thấy sự cần thiết của
  một phép toán mới giữa hai vectơ để giải quyết bài toán thực tế (Công
  cơ học).

]
#nd-hd[
  huống: #strong[Bài toán Công cơ học] trong vật lí:

- #quote(block: true)[
  Khi một lực $arrow(F)$ không đổi tác dụng lên một vật và điểm đặt của
  lực chuyển dời một đoạn $arrow(d)$, công sinh ra $A$ được tính bằng
  công thức $A =\|arrow(F)\|dot.op\|arrow(d)\|dot.op c o s alpha$, trong
  đó $alpha$ là góc giữa hướng của lực $arrow(F)$ và hướng dịch chuyển
  $arrow(d)$.
  ]

  #quote(block: true)[
  #strong[Nhiệm vụ:]
  ]

  #block[
  #set enum(numbering: "a.", start: 1)
  + Nhắc lại mối liên hệ giữa $arrow(F)$, $arrow(d)$, $alpha$ và $A$.
  + Đề xuất một phép toán giữa hai vectơ $arrow(F)$ và $arrow(d)$ để thể
    hiện mối liên hệ này một cách gọn gàng.
  ]

]
#sp-hd[

  - Học sinh nhận thấy
    $A =\|arrow(F)\|dot.op\|arrow(d)\|dot.op c o s alpha$ là một đại
    lượng vô hướng được xác định từ hai vectơ $arrow(F)$ và $arrow(d)$.
  - Đề xuất (hoặc chấp nhận) ý tưởng về một \"tích\" giữa hai vectơ cho
    ra một kết quả vô hướng, và khẳng định cần phải định nghĩa phép toán
    này một cách chính xác trong Toán học.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ học tập:] Giáo viên (GV) trình chiếu
    video/tình huống và đặt câu hỏi gợi mở.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh (HS) làm việc cá nhân
    (3 phút) sau đó thảo luận nhanh theo cặp đôi (5 phút). GV theo dõi,
    gợi ý.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV gọi đại diện 1-2 HS/cặp đôi
    báo cáo. HS khác đặt câu hỏi/nhận xét.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa câu trả lời, dẫn
    dắt: \"Đại lượng $A$ chính là một ứng dụng thực tế của #strong[Tích
    vô hướng của hai vectơ] mà chúng ta sẽ nghiên cứu trong bài học
    này.\"

- #strong[Tích hợp Năng lực số:] #strong[Tìm kiếm thông tin] (Biểu hiện:
  Sử dụng công cụ tìm kiếm hoặc xem video/tài liệu số về Công cơ học nếu
  cần thiết).

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "90 phút - 3 hoạt động thành phần")
Hoạt động này được chia thành 3 hoạt động nhỏ để hình thành các nội dung
kiến thức cốt lõi.

===== 2.1. Hoạt động thành phần 2.1: Góc giữa hai vectơ (20 phút)
- #strong[Tên hoạt động:] #strong[Khám phá định nghĩa Góc giữa hai
  vectơ]

#mt-hd[
  hai vectơ bất kỳ.

]
#nd-hd[
  tập.

- #quote(block: true)[
  #strong[Nhiệm vụ:]
  ]

  #block[
  #set enum(numbering: "a.", start: 1)
  + Vẽ hai vectơ $arrow(u)$ và $arrow(v)$ chung gốc $O$. Xác định góc
    $alpha$ tạo bởi hai tia $O u$ và $O v$.
  + Xét trường hợp đặc biệt: $arrow(u) arrow.t arrow.t arrow(v)$,
    $arrow(u) arrow.t arrow.b arrow(v)$, và $arrow(u) perp arrow(v)$.
    Cho biết góc $alpha$ trong mỗi trường hợp.
  + Từ đó, xây dựng định nghĩa về góc giữa hai vectơ $arrow(u)$ và
    $arrow(v)$.
  ]

- #strong[Ví dụ minh họa:]

- #quote(block: true)[
  Cho hình vuông $A B C D$ tâm $O$. Hãy xác định góc giữa các cặp vectơ
  sau: a) $\(accent(A B, ⃗)\,accent(A D, ⃗)\)$ b)
  $\(accent(O B, ⃗)\,accent(D A, ⃗)\)$ (Gợi ý: Dời vectơ $accent(D A, ⃗)$
  về gốc $O$) c) $\(accent(A B, ⃗)\,accent(D C, ⃗)\)$
  ]

]
#sp-hd[
  dụ.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ:] GV trình chiếu yêu cầu, chia nhóm.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc nhóm, vẽ hình và
    thảo luận. GV quan sát, hỗ trợ, đặc biệt với trường hợp dời gốc
    vectơ.
  - #strong[Bước 3: Báo cáo, thảo luận:] Đại diện nhóm trình bày (có thể
    vẽ lên bảng/sử dụng GeoGebra để minh họa). Nhóm khác nhận xét.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa định nghĩa:
    $0^compose lt.eq\(arrow(u)\,arrow(v)\)lt.eq 180^compose$.

===== 2.2. Hoạt động thành phần 2.2: Tích vô hướng của hai vectơ (40 phút)
- #strong[Tên hoạt động:] #strong[Xây dựng và Khai thác Tích vô hướng]

]
#mt-hd[
  của tích vô hướng, biết cách tính tích vô hướng theo định nghĩa.

]
#nd-hd[

- #quote(block: true)[
  #strong[Nhiệm vụ 1 (Định nghĩa):] Dựa vào bài toán Công cơ học ở Hoạt
  động 1, chính thức định nghĩa #strong[tích vô hướng]
  $arrow(u) dot.op arrow(v)$.
  ]

  #quote(block: true)[
  #strong[Nhiệm vụ 2 (Khai thác):]
  ]

  #block[
  #set enum(numbering: "a.", start: 1)
  + Tính $arrow(u) dot.op arrow(u)$ (tích vô hướng của vectơ với chính
    nó).
  + Suy ra điều kiện để $arrow(u) perp arrow(v)$ (vận dụng
    $cos 90^compose = 0$).
  + Chứng minh tính chất giao hoán:
    $arrow(u) dot.op arrow(v) = arrow(v) dot.op arrow(u)$ và tính chất
    phân phối:
    $arrow(u) dot.op\(arrow(v) + arrow(w)\)= arrow(u) dot.op arrow(v) + arrow(u) dot.op arrow(w)$.
  ]

- #strong[Ví dụ minh họa:]

- #quote(block: true)[
  Cho tam giác đều $A B C$ cạnh $a$. Tính các tích vô hướng sau: a)
  $accent(A B, ⃗) dot.op accent(A C, ⃗)$ b)
  $accent(A C, ⃗) dot.op accent(C B, ⃗)$ c)
  $accent(A B, ⃗) dot.op accent(B C, ⃗)$ d) (Tăng cường tư duy): Tính độ
  dài cạnh $B C$ thông qua
  $accent(B C, ⃗)^2 =\(accent(A C, ⃗) - accent(A B, ⃗)\)^2$.
  ]

]
#sp-hd[
  $arrow(u) dot.op arrow(v) =\|arrow(u)\|\|arrow(v)\|c o s\(arrow(u)\,arrow(v)\)$.
  Các tính chất của tích vô hướng. Lời giải ví dụ.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ:] GV yêu cầu HS làm việc nhóm, phân
    công nhiệm vụ 1 và nhiệm vụ 2 cho các nhóm.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận và trình bày kết
    quả ra giấy A0 (sơ đồ tư duy/ghi chú). GV giám sát, hỗ trợ chứng
    minh tính chất.
  - #strong[Bước 3: Báo cáo, thảo luận:] Các nhóm treo sản phẩm. Đại
    diện nhóm thuyết trình về định nghĩa/tính chất. GV tổ chức HS phản
    biện, đánh giá chéo.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa kiến thức, nhấn
    mạnh:
    $arrow(u) perp arrow(v) arrow.l.r.double arrow(u) dot.op arrow(v) = 0$.

===== 2.3. Hoạt động thành phần 2.3: Biểu thức tọa độ và tính chất của tích vô hướng (30 phút)
- #strong[Tên hoạt động:] #strong[Khám phá Biểu thức tọa độ và Ứng dụng]

]
#mt-hd[
  tọa độ và vận dụng để tính góc, kiểm tra sự vuông góc.

]
#nd-hd[

- #quote(block: true)[
  #strong[Nhiệm vụ 1 (Khám phá):] Trong hệ tọa độ $O x y$, cho
  $arrow(i) =\(1\;0\)$, $arrow(j) =\(0\;1\)$.
  ]

  #block[
  #set enum(numbering: "a.", start: 1)
  + Tính các tích vô hướng: $arrow(i) dot.op arrow(i)$,
    $arrow(j) dot.op arrow(j)$, $arrow(i) dot.op arrow(j)$.
  + Cho $arrow(u) =\(x_1\;y_1\)$ và $arrow(v) =\(x_2\;y_2\)$. Viết
    $arrow(u)$ và $arrow(v)$ theo $arrow(i)\,arrow(j)$. Sử dụng tính
    chất phân phối để tính $arrow(u) dot.op arrow(v)$ theo tọa độ
    $x_1\,y_1\,x_2\,y_2$.
  ]

  #quote(block: true)[
  #strong[Nhiệm vụ 2 (Ứng dụng):] Vận dụng công thức
  $arrow(u) dot.op arrow(v) = x_1 x_2 + y_1 y_2$ để suy ra công thức
  tính:
  ]

  #block[
  #set enum(numbering: "a.", start: 1)
  + Độ dài vectơ:
    $\|arrow(u)\|= sqrt(arrow(u) dot.op arrow(u)) = dots.h$
  + Góc giữa hai vectơ $arrow(u)$ và $arrow(v)$ (thông qua $cos alpha$).
  ]

- #strong[Ví dụ minh họa:]

- #quote(block: true)[
  Trong mặt phẳng tọa độ $O x y$, cho $arrow(a) =\(3\;4\)$ và
  $arrow(b) =\(1\;- 2\)$. a) Tính tích vô hướng
  $arrow(a) dot.op arrow(b)$. b) Tính $\|arrow(a)\|$ và $\|arrow(b)\|$.
  c) Tính $c o s\(arrow(a)\,arrow(b)\)$. d) Tìm tọa độ của vectơ
  $arrow(c)$ vuông góc với $arrow(a)$ và $\|arrow(c)\|= 5$.
  ]

]
#sp-hd[
  $arrow(u) dot.op arrow(v) = x_1 x_2 + y_1 y_2$. Công thức tính độ dài,
  góc giữa hai vectơ. Lời giải ví dụ.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ:] GV giao nhiệm vụ 1 (chủ yếu là phép
    chứng minh/khám phá) và ví dụ minh họa.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc cá nhân, sau đó
    thảo luận cặp đôi để so sánh kết quả chứng minh.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV gọi 1 HS lên bảng trình bày
    cách thiết lập công thức tọa độ. HS khác trình bày lời giải ví dụ.
  - #strong[Bước 4: Kết luận, nhận định:] GV tổng hợp kiến thức, nhấn
    mạnh vai trò của tích vô hướng trong việc tính góc và độ dài.

- #strong[Tích hợp Năng lực số:] #strong[Sử dụng công cụ tính toán/làm
  việc trên môi trường số] (Biểu hiện: Sử dụng GeoGebra hoặc máy tính
  khoa học để tính toán, kiểm tra góc, độ dài và vẽ minh họa các vectơ).

]
#hd("3", "Luyện tập", "15 phút")
- #strong[Tên hoạt động:] #strong[Trò chơi học tập: Ghép đôi Khái niệm -
  Công thức]

#mt-hd[
  thức và tính chất đã học.

]
#nd-hd[
  thức\"] (hoặc bài tập trắc nghiệm nhanh trên Google Forms/Quizizz).

- #quote(block: true)[
  #strong[Thiết kế Trò chơi/Bài tập:]
  ]

  #block[
  #set enum(numbering: "a.", start: 1)
  + Cho các câu hỏi/biểu thức (ví dụ: Tích vô hướng của
    $arrow(u) =\(1\;2\)\,arrow(v) =\(- 2\;1\)$ là...; Công thức tính
    $cos alpha$ là...; Điều kiện vuông góc của $arrow(a)\,arrow(b)$
    là...).
  + Cho các đáp án/công thức tương ứng (ví dụ: $0$\;
    $frac(x_1 x_2 + y_1 y_2, \|arrow(u)\|\|arrow(v)\|)$\;
    $arrow(a) dot.op arrow(b) = 0$).
  ]

  #quote(block: true)[
  Học sinh làm việc cá nhân hoặc nhóm nhỏ (đối với trò chơi) trong thời
  gian quy định.
  ]

// ]
#sp-hd[
  luyện tập.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ:] GV giới thiệu trò chơi/bài tập trắc
    nghiệm.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV/Hệ thống công bố đáp án.
    HS/Nhóm chiến thắng trình bày cách giải cho câu hỏi khó (nếu có).
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, khen ngợi và làm
    rõ những lỗi sai phổ biến.

- #strong[Tích hợp Năng lực số:] #strong[Ứng xử phù hợp trong môi trường
  số] (Biểu hiện: Tham gia trò chơi học tập trên nền tảng số, tuân thủ
  luật chơi, báo cáo kết quả đúng quy định).

]
#hd("4", "Vận dụng", "15 phút - Thực hiện ngoài giờ học")
- #strong[Tên hoạt động:] #strong[Giải quyết vấn đề thực tiễn]

#mt-hd[
  hướng vào giải quyết các vấn đề thực tiễn.

]
#nd-hd[
  thực tiễn có sử dụng tích vô hướng và giải quyết chúng.

- #quote(block: true)[
  #strong[Nhiệm vụ:]
  ]

  #block[
  #set enum(numbering: "a.", start: 1)
  + Đề xuất một tình huống thực tiễn liên quan đến $cos alpha$ (ví dụ:
    Tình huống về #strong[Lực kéo và quãng đường] (Công), tình huống về
    #strong[góc nghiêng của mái nhà] (vuông góc/góc nhọn),...
  + Mô hình hóa tình huống đó bằng vectơ và công thức tích vô hướng.
  + Giải quyết vấn đề đó (tính công, tính góc, kiểm tra sự vuông
    góc,...).
  ]

]
#sp-hd[
  trình/slide/video ngắn/bài viết tay) trình bày rõ: Tình huống thực
  tiễn $arrow.r$ Mô hình toán học $arrow.r$ Lời giải.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ:] GV giao nhiệm vụ về nhà cho học
    sinh. Khuyến khích HS làm việc nhóm.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS chủ động tìm kiếm, thực hiện
    nhiệm vụ ngoài giờ học.
  - #strong[Bước 3: Báo cáo, thảo luận:] (Thực hiện vào tiết học tiếp
    theo) GV tổ chức cho một số nhóm báo cáo, trao đổi, chia sẻ và đánh
    giá.

- #strong[Tích hợp Năng lực số:] #strong[Sáng tạo nội dung số] (Biểu
  hiện: Sử dụng công cụ số (PowerPoint, Canva, CapCut,...) để thiết kế
  báo cáo, video trình bày kết quả).

]
