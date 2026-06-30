// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 19 Phương trình đường thẳng",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
- #strong[\1. Về kiến thức:]

  - Nêu được khái niệm và tính chất của #strong[vectơ pháp tuyến] và
    #strong[vectơ chỉ phương] của đường thẳng.
  - Xác định được phương trình tổng quát của đường thẳng khi biết một
    điểm thuộc đường thẳng và một vectơ pháp tuyến.
  - Xác định được phương trình tham số của đường thẳng khi biết một điểm
    thuộc đường thẳng và một vectơ chỉ phương.
  - Chuyển đổi được giữa phương trình tổng quát và phương trình tham số
    của đường thẳng.
  - Tính được khoảng cách từ một điểm đến một đường thẳng.
  - Tính được góc giữa hai đường thẳng.

- #strong[\2. Về năng lực:]

  - #strong[Năng lực chung:]
    - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, khám phá
      kiến thức mới về các dạng phương trình đường thẳng thông qua SGK
      và tài liệu số.
    - #strong[Năng lực giao tiếp và hợp tác:] Hợp tác hiệu quả trong làm
      việc nhóm để hoàn thành nhiệm vụ và trình bày kết quả.
    - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Vận dụng kiến
      thức để giải quyết các bài toán về phương trình đường thẳng,
      khoảng cách, góc; đề xuất cách giải quyết vấn đề thực tiễn.
  - #strong[Năng lực đặc thù (Năng lực Toán học):]
    - #strong[Năng lực tư duy và lập luận toán học:] Phân tích mối quan
      hệ giữa vectơ pháp tuyến/chỉ phương và đường thẳng để thiết lập
      phương trình.
    - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các tình huống
      thực tiễn bằng phương trình đường thẳng.
    - #strong[Năng lực sử dụng công cụ, phương tiện học toán:] Sử dụng
      phần mềm, ứng dụng (ví dụ: Geogebra, Powerpoint) để vẽ đồ thị
      đường thẳng, kiểm tra kết quả và trình bày báo cáo.
  - #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
    - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
    - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu,
      thông tin và nội dung trong môi trường số.
    - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông
      tin và nội dung này cũng như điều hướng giữa chúng.
    - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
    - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các
      định dạng khác nhau,
    - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
      tạo ra các nội dung số.

- #strong[\3. Về phẩm chất:]

  - #strong[Chăm chỉ:] Hoàn thành các nhiệm vụ học tập được giao một
    cách đầy đủ và nghiêm túc.
  - #strong[Trung thực:] Thể hiện sự trung thực trong quá trình làm bài
    tập, thảo luận và báo cáo kết quả.
  - #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ được giao, đóng
    góp tích cực vào hoạt động nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, bảng/bảng phụ, thước
  kẻ, compa.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập (in giấy hoặc trực tuyến qua Google Forms/Kahoot).
  - Phần mềm Geogebra (để minh họa trực quan và kiểm tra).
  - Tài liệu tham khảo/video/hình ảnh số về ứng dụng của phương trình
    đường thẳng trong thực tế.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
  vectơ) và xác định vấn đề cần giải quyết: #strong[Làm thế nào để xác
  định vị trí của một đường thẳng trong mặt phẳng tọa độ một cách đại
  số?]
]
#nd-hd[
  - Giáo viên (GV) trình chiếu một hình ảnh/video/tình huống thực tế
    liên quan đến đường thẳng (ví dụ: đường đi của máy bay trên bản đồ,
    tọa độ vị trí vật thể,...) và đặt câu hỏi gợi mở:
    - #emph[Câu hỏi:] Trong hình học phẳng, để xác định một đường thẳng,
      ta cần những yếu tố nào? (Gợi ý: 2 điểm hoặc 1 điểm và hướng).
    - #emph[Tình huống:] Làm thế nào để mô tả vị trí và hướng di chuyển
      của vật thể A (tọa độ $M\(x_0\;y_0\)$) bằng phương trình đại số?
]
#sp-hd[
  định đường thẳng và nhận định về sự cần thiết của công cụ đại số
  (phương trình) để mô tả đường thẳng.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV trình chiếu tình huống. HS làm
    việc cá nhân 2 phút để suy nghĩ.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS suy nghĩ, ghi nhanh ý kiến
    cá nhân. GV theo dõi, hỗ trợ, gợi ý nếu HS gặp khó khăn.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 HS trình bày ý kiến.
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, dẫn dắt: Để mô tả
    đường thẳng trong mặt phẳng tọa độ, ta cần đến các khái niệm
    #strong[vectơ chỉ phương], #strong[vectơ pháp tuyến] và các dạng
    #strong[phương trình đường thẳng].

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
==== 2.1. Hoạt động thành phần 2.1: Phương trình tổng quát của đường thẳng (30 phút)
#mt-hd[
  - Thiết lập được khái niệm #strong[vectơ pháp tuyến] ($arrow(n)$).
  - Xây dựng được #strong[phương trình tổng quát] của đường thẳng.
]
#nd-hd[
  - #strong[Nhiệm vụ 1: Khái niệm Vectơ pháp tuyến:] HS làm việc nhóm
    (4-5 HS). GV phát Phiếu học tập 1 (hoặc giao nhiệm vụ qua công cụ
    số).
    - #emph[Yêu cầu:] Cho điểm $M_0\(x_0\;y_0\)$ và vectơ
      $arrow(n) =\(A\;B\)$ khác $arrow(0)$. Hãy tìm điều kiện về tọa độ
      của điểm $M\(x\;y\)$ để vectơ $accent(M_0 M, ⃗)$ vuông góc với
      $arrow(n)$.
  - #strong[Nhiệm vụ 2: Thiết lập Phương trình tổng quát:] Từ kết quả
    của Nhiệm vụ 1, HS suy luận ra dạng phương trình
    $A\(x - x_0\)+ B\(y - y_0\)= 0$ và đưa về dạng $A x + B y + C = 0$.
  - #strong[Ví dụ minh họa:] Lập phương trình tổng quát của đường thẳng
    đi qua điểm $A\(1\;- 2\)$ và nhận $arrow(n) =\(3\;4\)$ làm vectơ
    pháp tuyến.
]
#sp-hd[
  - Điều kiện là $arrow(n) dot.op accent(M_0 M, ⃗) = 0$ hay
    $A\(x - x_0\)+ B\(y - y_0\)= 0$.
  - Phương trình tổng quát: $A x + B y + C = 0$.
  - Ví dụ:
    $3\(x - 1\)+ 4\(y -\(- 2\)\)= 0 arrow.l.r.double 3 x + 4 y + 5 = 0$.
  - #strong[Biểu hiện Năng lực số:] HS có thể sử dụng ứng dụng
    #strong[Geogebra] trên điện thoại/máy tính để vẽ đường thẳng
    $3 x + 4 y + 5 = 0$ và kiểm tra xem nó có đi qua $A\(1\;- 2\)$ hay
    không. (Tích hợp #strong[Năng lực số: Tạo ra và tương tác với nội
    dung số]).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giao Nhiệm vụ 1 & 2 cho nhóm (sử
    dụng phiếu học tập hoặc công cụ số).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận nhóm (5-7 phút).
    GV quan sát, hướng dẫn (gợi ý về tích vô hướng) và hỗ trợ.
  - #strong[Bước 3: Báo cáo, thảo luận:] Đại diện 1-2 nhóm trình bày kết
    quả lên bảng hoặc sử dụng #strong[Powerpoint] để trình bày sơ đồ tư
    duy về mối liên hệ giữa $arrow(n)$ và PT tổng quát.
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt kiến thức, đưa ra định
    nghĩa và công thức. Cho HS thực hiện Ví dụ minh họa.

==== 2.2. Hoạt động thành phần 2.2: Phương trình tham số của đường thẳng (30 phút)
]
#mt-hd[
  - Thiết lập được khái niệm #strong[vectơ chỉ phương] ($arrow(u)$).
  - Xây dựng được #strong[phương trình tham số] của đường thẳng.
  - Phân biệt được mối quan hệ giữa $arrow(u)$ và $arrow(n)$.
]
#nd-hd[
  - #strong[Nhiệm vụ 3: Khái niệm Vectơ chỉ phương:] HS làm việc nhóm.
    - #emph[Yêu cầu:] Cho điểm $M_0\(x_0\;y_0\)$ và vectơ
      $arrow(u) =\(u_1\;u_2\)$ khác $arrow(0)$. Hãy tìm điều kiện để ba
      điểm $M_0$, $M\(x\;y\)$ và vectơ $arrow(u)$ cùng phương.
  - #strong[Nhiệm vụ 4: Thiết lập Phương trình tham số:] Từ điều kiện
    cùng phương, HS suy ra $accent(M_0 M, ⃗) = t dot.op arrow(u)$ (với
    $t bb(in R)$ là tham số) và từ đó suy ra #strong[phương trình tham
    số]: ${x = x_0 + t dot.op u_1\
    y = y_0 + t dot.op u_2 med$.
  - #strong[Ví dụ minh họa:] Lập phương trình tham số của đường thẳng đi
    qua điểm $B\(- 3\;5\)$ và có vectơ chỉ phương
    $arrow(u) =\(2\;- 1\)$.
  - #strong[Tăng cường Giao tiếp, Phân tích:] HS thảo luận về mối quan
    hệ giữa $arrow(n) =\(A\;B\)$ và $arrow(u)$ (vuông góc, ví dụ
    $arrow(u)$ có thể là $\(- B\;A\)$ hoặc $\(B\;- A\)$).
]
#sp-hd[
  - Điều kiện: $accent(M_0 M, ⃗)$ và $arrow(u)$ cùng phương.
  - Phương trình tham số: ${x = x_0 + 2 t\
    y = y_0 - t med$ (trong ví dụ).
  - Mối quan hệ: $arrow(n) perp arrow(u)$.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giao Nhiệm vụ 3 & 4.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận nhóm (5-7 phút).
    GV theo dõi, hỗ trợ, gợi ý về điều kiện cùng phương của hai vectơ.
  - #strong[Bước 3: Báo cáo, thảo luận:] Đại diện nhóm báo cáo, giải
    thích về vai trò của tham số $t$.
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt kiến thức, đưa ra định
    nghĩa, công thức, và nhấn mạnh mối quan hệ giữa $arrow(u)$ và
    $arrow(n)$. Cho HS thực hiện Ví dụ minh họa.

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
  bản, rèn luyện kỹ năng chuyển đổi giữa các dạng phương trình.
]
#nd-hd[
  - #strong[Bài tập 1 (Cá nhân):] Chuyển phương trình tổng quát
    $2 x - 5 y + 1 = 0$ sang phương trình tham số.
  - #strong[Bài tập 2 (Làm việc nhóm/Trò chơi học tập):] Sử dụng hình
    thức #strong[Trò chơi học tập] (ví dụ: Thi giải nhanh trên
    #strong[Kahoot] hoặc #strong[Quizizz]).
    - #emph[Câu hỏi:] Cho đường thẳng $d$ có PTTS ${x = 1 - 3 t\
      y = 2 + t med$. Vectơ pháp tuyến của $d$ là:
      - A. $arrow(n_1) =\(1\;3\)$
      - B. $arrow(n_2) =\(3\;1\)$
      - C. $arrow(n_3) =\(1\;- 3\)$
      - D. $arrow(n_4) =\(3\;- 1\)$
]
#sp-hd[
  - Bài tập 1: Phương trình tham số (Ví dụ: ${x = 2 t\
    y = frac(1 + 4 t, 5) med$ hoặc một dạng khác).
  - Bài tập 2: Đáp án B
    ($arrow(u) =\(- 3\;1\)arrow.r.double arrow(n) =\(1\;3\)$ hoặc
    $arrow(n) =\(- 1\;- 3\)$).
  - #strong[Biểu hiện Năng lực số:] HS sử dụng thiết bị (điện thoại/máy
    tính) để tham gia trò chơi học tập trên nền tảng số. (Tích hợp
    #strong[Năng lực số: Khai thác và xử lí thông tin số] và #strong[Tạo
    ra và tương tác với nội dung số]).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giao Bài tập 1 làm việc cá nhân 3
    phút. Sau đó tổ chức trò chơi học tập cho Bài tập 2 (4 phút).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm bài cá nhân và tham gia
    trò chơi.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV gọi 1 HS chữa Bài tập 1. Kết
    quả Bài tập 2 hiển thị ngay trên hệ thống trò chơi.
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, nhấn mạnh lại mối
    liên hệ $arrow(u) perp arrow(n)$ và cách chuyển đổi phương trình.

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
  kiến thức vào giải quyết vấn đề thực tiễn (giao nhiệm vụ về nhà).
]
#nd-hd[
  - #strong[Yêu cầu:] Hãy tìm một tình huống thực tế (trong xây dựng,
    kiến trúc, thiết kế đồ họa, hay trò chơi điện tử) có thể được mô
    hình hóa bằng #strong[phương trình đường thẳng].
  - #strong[Nhiệm vụ:]
    - Mô tả tình huống đó bằng lời.
    - Chọn hệ trục tọa độ phù hợp và xác định các yếu tố ($arrow(u)$
      hoặc $arrow(n)$) để lập #strong[phương trình đường thẳng] mô hình
      hóa tình huống đó.
]
#sp-hd[
  chiếu] sử dụng Powerpoint/Canva) về tình huống thực tế và phương trình
  đường thẳng tương ứng.
  - #strong[Biểu hiện Năng lực số:] HS sử dụng công cụ thiết kế, trình
    chiếu để tạo báo cáo. (Tích hợp #strong[Năng lực số: Tạo ra và tương
    tác với nội dung số]).
// ]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giải thích rõ yêu cầu vận dụng và
    hình thức sản phẩm.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS nhận nhiệm vụ, thực hiện
    #strong[ngoài giờ học trên lớp].
  - #strong[Bước 3: Báo cáo, thảo luận:] Nộp báo cáo vào buổi học kế
    tiếp để trao đổi, chia sẻ và đánh giá.
  - #strong[Bước 4: Kết luận, nhận định:] GV dặn dò HS về việc hoàn
    thành nhiệm vụ và chuẩn bị cho buổi học tiếp theo.

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
