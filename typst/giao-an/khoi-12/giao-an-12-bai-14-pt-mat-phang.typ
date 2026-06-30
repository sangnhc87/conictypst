// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 14 PT Mặt phẳng",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm và xác định được #strong[vectơ pháp tuyến] của mặt
  phẳng.
- Nêu được khái niệm #strong[phương trình tổng quát] của mặt phẳng.
- Lập được phương trình tổng quát của mặt phẳng trong một số trường hợp
  đơn giản.
- Nắm được #strong[điều kiện để hai mặt phẳng vuông góc, song song] với
  nhau.
- Tính được #strong[khoảng cách từ một điểm đến một mặt phẳng].

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến thức mới
    về phương trình mặt phẳng thông qua việc đọc SGK, tài liệu và thực
    hiện nhiệm vụ học tập.
  - #strong[Giao tiếp và hợp tác:] Tích cực thảo luận nhóm, trình bày,
    bảo vệ ý kiến của mình và tiếp thu ý kiến của bạn bè.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống, đề
    xuất và lựa chọn phương pháp tối ưu để lập phương trình mặt phẳng
    hoặc giải quyết các bài toán liên quan (như tính khoảng cách).
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Phát hiện và chứng
    minh được các công thức, điều kiện về vị trí tương đối của hai mặt
    phẳng.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa một số vấn đề
    thực tiễn liên quan đến mặt phẳng bằng công cụ phương trình.
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng linh hoạt
    kiến thức về vectơ và phương trình mặt phẳng để giải quyết các bài
    tập từ cơ bản đến nâng cao.
- #strong[Năng lực số:]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực hoàn thành các nhiệm vụ cá nhân và nhiệm
  vụ nhóm.
- #strong[Trách nhiệm:] Có trách nhiệm trong việc trình bày, bảo vệ quan
  điểm và hoàn thành nhiệm vụ được giao.
- #strong[Trung thực:] Thể hiện sự trung thực trong quá trình thực hiện
  nhiệm vụ, báo cáo kết quả.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, bảng phụ/giấy A0,
  phiếu học tập, bộ dụng cụ học tập (thước kẻ, bút màu).
- #strong[Học liệu:] Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc
  sống), tài liệu tham khảo, video clip minh họa các hình ảnh mặt phẳng
  trong không gian 3 chiều (có thể sử dụng GeoGebra), các trò chơi học
  tập (ví dụ: trò chơi \"Ai nhanh hơn\" với hệ thống câu hỏi trắc
  nghiệm).

== IV. Tiến trình dạy học
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "Khám phá không gian mặt phẳng")
#mt-hd[
Tạo hứng thú, giúp học sinh huy động kiến thức
  cũ về vectơ và hệ tọa độ trong không gian, từ đó nhận ra nhu cầu cần
  phải xác định một mặt phẳng trong không gian bằng công cụ đại số
  (phương trình).
]
#nd-hd[
Giáo viên đặt vấn đề:
  - #strong[Nhiệm vụ:] Trong thực tế, làm thế nào để xác định vị trí của
    một bức tường phẳng, một mặt bàn, hay một mặt sàn trong không gian?
    Nếu dùng hệ tọa độ $O x y z$, ta cần những yếu tố nào để xác định
    duy nhất một mặt phẳng?
  - #strong[Ví dụ đề xuất:] Cho điểm $M_0\(1\;2\;3\)$ và một vectơ
    $arrow(n) =\(2\;- 1\;1\)$. Hãy mô tả các điểm $M\(x\;y\;z\)$ sao cho
    $accent(M_0 M, ⃗)$ vuông góc với $arrow(n)$. Liệu tập hợp các điểm
    $M$ đó có phải là một mặt phẳng không?
]
#sp-hd[
  - Học sinh trả lời câu hỏi gợi mở, nhớ lại kiến thức về tích vô hướng
    và điều kiện vuông góc của hai vectơ:
    $accent(M_0 M, ⃗) dot.op arrow(n) = 0$.
  - Học sinh mô tả được mặt phẳng được xác định bởi một #strong[điểm] và
    một #strong[vectơ vuông góc] với mặt phẳng đó.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giáo viên đặt câu hỏi/tình huống thực tiễn
    và giao nhiệm vụ nhóm thảo luận (3 phút).
  - #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm, ghi lại các ý
    kiến sơ bộ.
  - #strong[Báo cáo, thảo luận:] Đại diện 1-2 nhóm trình bày ý kiến.
    Giáo viên nhận xét, dẫn dắt đến khái niệm #strong[vectơ pháp tuyến].
  - #strong[Kết luận, nhận định:] Giáo viên chốt lại: Cần một điểm cố
    định và một vectơ vuông góc (vectơ pháp tuyến) để xác định mặt
    phẳng. Đây là nhiệm vụ trọng tâm của bài học.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "Xây dựng Phương trình mặt phẳng")
==== 2.1. Hoạt động thành phần 2.1: Vectơ pháp tuyến và cặp vectơ chỉ phương của mặt phẳng
#mt-hd[
Học sinh nắm được khái niệm, cách xác định
  #strong[vectơ pháp tuyến] ($arrow(n)$) và #strong[cặp vectơ chỉ
  phương] ($arrow(a)\,arrow(b)$) của mặt phẳng, và mối liên hệ giữa
  chúng ($arrow(n) =\[arrow(a)\,arrow(b)\]$).
]
#nd-hd[
Học sinh làm việc với SGK và phiếu học tập.
  - #strong[Nhiệm vụ:] Nhóm nghiên cứu định nghĩa, tính chất của vectơ
    pháp tuyến, cặp vectơ chỉ phương.
  - #strong[Ví dụ đề xuất:] Cho mặt phẳng $\(P\)$ đi qua 3 điểm
    $A\(1\;0\;0\)$, $B\(0\;2\;0\)$, $C\(0\;0\;3\)$. Hãy tìm cặp vectơ
    chỉ phương của $\(P\)$ và tính vectơ pháp tuyến $arrow(n)$.
]
#sp-hd[
Học sinh ghi nhận được định nghĩa $arrow(n)$ và
  công thức $arrow(n) =\[accent(A B, ⃗)\,accent(A C, ⃗)\]$.
]
#tc-hd[
Tổ chức hoạt động nhóm (kỹ thuật Khăn
  trải bàn) để tìm ra mối liên hệ.

==== 2.2. Hoạt động thành phần 2.2: Phương trình tổng quát của mặt phẳng
]
#mt-hd[
Học sinh xây dựng được phương trình tổng quát
  của mặt phẳng $\(P\)$ qua điểm $M_0\(x_0\;y_0\;z_0\)$ và có
  $arrow(n) =\(A\;B\;C\)$.
]
#nd-hd[
Giáo viên yêu cầu học sinh biến đổi điều kiện
  vuông góc $accent(M_0 M, ⃗) dot.op arrow(n) = 0$ thành phương trình đại
  số.
  - #strong[Nhiệm vụ:] Khai triển phương trình:
    $A\(x - x_0\)+ B\(y - y_0\)+ C\(z - z_0\)= 0$.
  - #strong[Ví dụ đề xuất:] Lập phương trình mặt phẳng đi qua
    $M_0\(1\;2\;- 1\)$ và nhận $arrow(n) =\(3\;- 2\;1\)$ làm vectơ pháp
    tuyến.
]
#sp-hd[
Phương trình tổng quát dạng
  $A x + B y + C z + D = 0$.
]
#tc-hd[
Hoạt động cá nhân, sau đó kiểm tra chéo
  kết quả.

==== 2.3. Hoạt động thành phần 2.3: Lập phương trình tổng quát của mặt phẳng
]
#mt-hd[
Học sinh vận dụng kiến thức để lập phương trình
  mặt phẳng trong các trường hợp phức tạp hơn (mặt phẳng chứa đường
  thẳng, song song/vuông góc với mặt phẳng khác,...)
]
#nd-hd[
Thảo luận, phân tích các trường hợp xác định
  $arrow(n)$.
  - #strong[Ví dụ đề xuất (Luyện tập tư duy):]
    - Lập phương trình mặt phẳng $\(Q\)$ đi qua điểm $A\(1\;1\;1\)$ và
      vuông góc với hai mặt phẳng $\(P_1\): x - 2 y + z - 1 = 0$ và
      $\(P_2\): 2 x + y - 3 z + 2 = 0$.
]
#sp-hd[
Học sinh xác định được
  $arrow(n)_Q =\[arrow(n)_1\,arrow(n)_2\]$ và viết được phương trình
  $\(Q\)$.
]
#tc-hd[
#strong[Trò chơi học tập \"Thử thách
  giải mã\"] (Code-breaking Challenge). Chia nhóm, mỗi nhóm nhận 1 nhiệm
  vụ, giải xong nộp đáp án để nhận nhiệm vụ tiếp theo (tăng cường kĩ
  năng hợp tác và giải quyết vấn đề).

==== 2.4. Hoạt động thành phần 2.4: Điều kiện để hai mặt phẳng vuông góc với nhau
]
#mt-hd[
Học sinh thiết lập được điều kiện đại số về sự
  vuông góc của hai mặt phẳng dựa trên mối quan hệ giữa hai vectơ pháp
  tuyến.
]
#nd-hd[
Cho hai mặt phẳng
  $\(P\): A_1 x + B_1 y + C_1 z + D_1 = 0$ và
  $\(Q\): A_2 x + B_2 y + C_2 z + D_2 = 0$.
  - #strong[Nhiệm vụ:] Thảo luận tìm điều kiện vuông góc.
    ($arrow(n)_1 perp arrow(n)_2 arrow.l.r.double arrow(n)_1 dot.op arrow(n)_2 = 0$).
  - #strong[Ví dụ đề xuất:] Cho mặt phẳng
    $\(P\): 2 x + b y - z + 5 = 0$. Tìm $b$ để $\(P\)$ vuông góc với mặt
    phẳng $\(Q\): x - 3 y + z - 2 = 0$.
]
#sp-hd[
Điều kiện: $A_1 A_2 + B_1 B_2 + C_1 C_2 = 0$.
]
#tc-hd[
Hoạt động nhóm nhỏ, trình bày kết quả
  bằng sơ đồ tư duy (khuyến khích #strong[Năng lực số]: Sử dụng phần mềm
  tạo sơ đồ tư duy hoặc trình bày báo cáo trực tuyến).

==== 2.5. Hoạt động thành phần 2.5: Điều kiện để hai mặt phẳng song song với nhau
]
#mt-hd[
Học sinh thiết lập được điều kiện đại số về sự
  song song của hai mặt phẳng.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Thảo luận tìm điều kiện song song.
    ($arrow(n)_1\/\/arrow(n)_2$ và $arrow(n)_1\,arrow(n)_2$ không cùng
    hướng với $accent(M_0 M, ⃗)$ với $M_0 in\(P\)\,M in\(Q\)$).
  - #strong[Ví dụ đề xuất:] Tìm $m\,n$ để hai mặt phẳng
    $\(P\): x - 2 y + 3 z - 5 = 0$ và $\(Q\): m x - 4 y + n z + 1 = 0$
    song song với nhau.
]
#sp-hd[
Điều kiện:
  $A_1 / A_2 = B_1 / B_2 = C_1 / C_2 eq.not D_1 / D_2$ (với
  $A_2\,B_2\,C_2 eq.not 0$).
]
#tc-hd[
Giáo viên đưa ra câu hỏi phản biện để
  học sinh phân biệt #strong[song song] và #strong[trùng nhau].

==== 2.6. Hoạt động thành phần 2.6: Khoảng cách từ một điểm đến một mặt phẳng
]
#mt-hd[
Học sinh nắm được công thức tính khoảng cách từ
  điểm $M_0\(x_0\;y_0\;z_0\)$ đến mặt phẳng
  $\(P\): A x + B y + C z + D = 0$.
]
#nd-hd[
Học sinh đọc SGK và áp dụng công thức.
  - #strong[Ví dụ đề xuất:] Tính khoảng cách từ điểm $A\(1\;2\;3\)$ đến
    mặt phẳng $\(P\): 2 x + y - 2 z + 1 = 0$.
]
#sp-hd[
Công thức:
  $d\(M_0\,\(P\)\)= frac(\|A x_0 + B y_0 + C z_0 + D\|, sqrt(A^2 + B^2 + C^2))$.
]
#tc-hd[
Hoạt động cá nhân. #strong[Tích hợp
  Năng lực số:] Giáo viên chiếu công thức, yêu cầu học sinh sử dụng điện
  thoại/máy tính cá nhân để tính toán và kiểm tra kết quả (Biểu hiện NL
  số: #strong[Sử dụng công cụ số để thực hiện tính toán]).

]
#hd("3", "Luyện tập", "Củng cố và rèn kỹ năng")
#mt-hd[
Vận dụng linh hoạt các kiến thức về lập phương
  trình mặt phẳng, xét vị trí tương đối và tính khoảng cách để giải các
  bài tập.
]
#nd-hd[
Hệ thống các bài tập trắc nghiệm và tự luận (tối
  thiểu 8-10 bài) bao phủ các dạng kiến thức đã học.
  - #strong[Ví dụ đề xuất (Dạng tổng hợp):]
    - #strong[Bài 1 (Trắc nghiệm):] Cho mặt phẳng $\(P\)$ chứa trục
      $O z$ và đi qua điểm $A\(1\;- 2\;4\)$. Phương trình của $\(P\)$ là
      gì? (Kiểm tra cách xác định vectơ pháp tuyến khi mặt phẳng chứa
      một trục tọa độ).
    - #strong[Bài 2 (Tự luận):] Lập phương trình mặt phẳng $\(Q\)$ tiếp
      xúc với mặt cầu $\(S\):\(x - 1\)^2+ y^2 + z^2 = 9$ tại điểm
      $M\(1\;3\;0\)$. (Vận dụng mối liên hệ giữa mặt phẳng tiếp xúc và
      bán kính/tâm).
]
#sp-hd[
Đáp án và lời giải chi tiết của các bài tập.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Học sinh thực hiện các bài tập cá nhân và
    thảo luận nhóm về các bài tập khó (kỹ thuật #strong[Động não
    nhanh]).
  - #strong[Kiểm tra, đánh giá:] Giáo viên sử dụng #strong[Trò chơi học
    tập \"Quizizz/Kahoot\"] để kiểm tra nhanh các bài tập trắc nghiệm
    (Tích hợp #strong[Năng lực số]: #strong[Sử dụng công cụ số để học
    tập và đánh giá]).

]
#hd("4", "Vận dụng", "Kết nối thực tiễn")
#mt-hd[
Phát triển năng lực mô hình hóa, giúp học sinh
  thấy được ứng dụng của phương trình mặt phẳng trong thực tiễn và các
  lĩnh vực khác.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Học sinh phát hiện/đề xuất vấn đề trong thực tiễn
    có thể mô hình hóa bằng phương trình mặt phẳng, ví dụ:
    - Vấn đề về quy hoạch đô thị (mặt phẳng xây dựng, mặt bằng công
      trình).
    - Vấn đề về quang học (mặt phẳng gương, mặt phẳng khúc xạ).
    - Vấn đề về kiến trúc, xây dựng (xác định mặt phẳng mái nhà, độ dốc
      của sàn).
  - #strong[Ví dụ đề xuất:] Giả sử một công trình có mặt sàn là mặt
    phẳng $\(P\): 2 x - y + 2 z - 5 = 0$. Một cột chống được đặt tại
    điểm $A\(1\;1\;4\)$. Hãy tính chiều dài tối thiểu của cột chống từ
    $A$ xuống sàn. (Tính khoảng cách).
]
#sp-hd[
Báo cáo (dưới dạng viết, slide, hoặc video) về
  tình huống thực tiễn và cách giải quyết bằng công cụ phương trình mặt
  phẳng.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] Giao cho học sinh thực hiện #strong[ngoài
    giờ học trên lớp].
  - #strong[Đánh giá:] Nộp báo cáo vào tuần học tiếp theo. Khuyến khích
    sử dụng các phần mềm trình chiếu (PowerPoint, Google Slides) hoặc
    phần mềm đồ họa (GeoGebra) để minh họa cho báo cáo (Tích hợp
    #strong[Năng lực số]: #strong[Thiết kế và trình bày sản phẩm số]).

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
