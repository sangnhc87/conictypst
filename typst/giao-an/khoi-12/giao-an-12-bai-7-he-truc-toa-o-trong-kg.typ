// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 7 Hệ trục toạ độ trong KG",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm và xác định được hệ trục toạ độ $O x y z$ trong
  không gian.
- Xác định được toạ độ của một điểm $M$ và toạ độ của một vectơ
  $arrow(u)$ trong không gian.
- Tính được toạ độ của vectơ theo toạ độ hai điểm đầu mút.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực tìm hiểu kiến
    thức về hệ trục toạ độ và toạ độ điểm/vectơ.
  - #strong[Năng lực giao tiếp và hợp tác:] Hợp tác nhóm để thảo luận,
    giải quyết các bài tập và hoàn thành sơ đồ tư duy.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp
    thông tin để giải quyết các bài tập liên quan đến toạ độ.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực tư duy và lập luận Toán học:] Thiết lập mối liên hệ
    giữa hình học và đại số thông qua hệ trục toạ độ.
  - #strong[Năng lực mô hình hoá Toán học:] Mô hình hoá một số vấn đề
    thực tiễn liên quan đến vị trí vật thể trong không gian bằng toạ độ.
- #strong[Năng lực số:]
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành các nhiệm vụ học tập được giao một cách
  tích cực và nghiêm túc.
- #strong[Trách nhiệm:] Có ý thức trách nhiệm khi làm việc nhóm, trình
  bày kết quả học tập và vận dụng kiến thức vào giải quyết các vấn đề
  thực tiễn.
- #strong[Trung thực:] Trung thực trong việc tự đánh giá và đánh giá
  đồng nghiệp.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, phiếu học tập, bộ mô
  hình trực quan hệ trục toạ độ $O x y z$, các công cụ hỗ trợ vẽ hình.
- #strong[Học liệu:] Sách giáo khoa Toán 12 (Bộ Kết nối tri thức với
  cuộc sống), tài liệu tham khảo, phần mềm #strong[GeoGebra 3D] (hoặc
  tương đương) để mô phỏng và trực quan hoá hệ trục.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
Tên hoạt động: #strong[Khám phá vị trí vật thể trong không gian]

#mt-hd[
Tạo hứng thú, giúp học sinh xác định được vấn đề
  cần giải quyết là làm thế nào để xác định chính xác vị trí của một vật
  thể trong không gian một cách đại số, từ đó dẫn đến nhu cầu về hệ trục
  toạ độ.
]
#nd-hd[
  - Giáo viên (GV) trình bày một tình huống thực tiễn (ví dụ: Xác định
    vị trí của một vệ tinh/máy bay/tàu ngầm hoặc vị trí một góc phòng
    học/đồ vật trên bàn học).
  - GV đặt câu hỏi: #emph["Làm thế nào để xác định chính xác và duy nhất
    vị trí của vật thể/điểm M đó trong không gian 3 chiều mà không chỉ
    dùng lời nói mô tả?"]
  - Học sinh (HS) thảo luận nhóm đôi hoặc cá nhân, đề xuất giải pháp.
]
#sp-hd[
  - Các ý kiến đề xuất ban đầu của HS về cách xác định vị trí trong
    không gian (có thể là dùng 3 tham số, 3 chiều, hoặc 3 hướng).
  - HS nhận ra hạn chế của việc mô tả bằng lời và nhu cầu về một hệ
    thống tham chiếu chuẩn.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình chiếu hình
    ảnh/video về tình huống thực tiễn (ví dụ: mô phỏng hệ thống định vị
    GPS 3D). GV giao nhiệm vụ cho HS trong 5 phút thảo luận nhóm 2: Đề
    xuất cách xác định vị trí của vật thể trong không gian. \*
    #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận, ghi nhanh ý tưởng
    ra giấy nháp hoặc phiếu học tập nhỏ. GV quan sát, khuyến khích HS
    liên hệ với hệ toạ độ $O x y$ đã học. (Dự kiến khó khăn: HS có thể
    chỉ nghĩ đến hệ $O x y$. Biện pháp hỗ trợ: GV gợi ý: #emph["Chúng ta
    đang sống trong không gian 3 chiều, cần thêm một yếu tố/chiều nào
    nữa?"]).
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 2-3 nhóm đại diện báo
    cáo ý kiến. GV nhận xét, tổng hợp các ý tưởng.
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt lại sự cần thiết của 3
    trục vuông góc nhau (chiều dài, chiều rộng, chiều cao) để xác định
    vị trí, từ đó dẫn dắt vào bài học: #strong[Hệ trục toạ độ trong
    không gian.]

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "80 phút")
Tên hoạt động: #strong[Chiếm lĩnh kiến thức về Hệ trục và Toạ độ]

Hoạt động này được chia thành các hoạt động thành phần như sau:

===== Hoạt động thành phần 2.1: Hệ trục toạ độ trong không gian (20 phút)
Tên hoạt động: #strong[Thiết lập hệ trục]

#mt-hd[
Giúp HS nắm được định nghĩa, cấu tạo của hệ trục
  toạ độ vuông góc $O x y z$ và các thành phần liên quan (trục toạ độ,
  mặt phẳng toạ độ).
]
#nd-hd[
HS làm việc với SGK và mô hình trực quan (hoặc
  phần mềm GeoGebra 3D).
  - GV yêu cầu HS đọc SGK, tìm hiểu định nghĩa hệ trục toạ độ $O x y z$
    (gồm 3 trục $O x\,O y\,O z$ đôi một vuông góc tại $O$ và 3 vectơ đơn
    vị $arrow(i)\,arrow(j)\,arrow(k)$).
  - Yêu cầu HS xác định các mặt phẳng toạ độ ($O x y\,O y z\,O z x$).
  - GV đưa ra ví dụ trực quan bằng mô hình vật lý hoặc GeoGebra 3D.
]
#sp-hd[
  - HS ghi chép, phát biểu lại được định nghĩa hệ trục toạ độ $O x y z$.
  - HS xác định được các thành phần của hệ trục trên hình vẽ.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV yêu cầu HS làm việc cá
    nhân (5 phút): Đọc SGK/Tài liệu, vẽ hình minh họa và ghi lại định
    nghĩa hệ trục toạ độ $O x y z$ và các vectơ đơn vị.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS nghiên cứu tài liệu. (Dự
    kiến khó khăn: HS nhầm lẫn giữa $O x y$ và $O x y z$. Biện pháp hỗ
    trợ: GV chiếu hình ảnh 3D, nhấn mạnh sự khác biệt của trục $O z$).
    (Tích hợp NL số: GV sử dụng #strong[GeoGebra 3D] để chiếu các trục
    toạ độ, các mặt phẳng toạ độ $O x y\,O y z\,O z x$ lên màn hình). \*
    #strong[Bước 3: Báo cáo, thảo luận:] GV gọi một vài HS trình bày kết
    quả, gọi HS khác nhận xét, bổ sung.
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt kiến thức cơ bản về hệ
    trục $O x y z$.

===== Hoạt động thành phần 2.2: Toạ độ của điểm, toạ độ của vectơ trong không gian (60 phút)
Tên hoạt động: #strong[Xác định vị trí đại số]

====== 2.2.1. Toạ độ của vectơ trong không gian (20 phút)
]
#mt-hd[
HS xác định được toạ độ của một vectơ $arrow(u)$
  theo bộ ba vectơ đơn vị $\(arrow(i)\,arrow(j)\,arrow(k)\)$.
]
#nd-hd[
HS nghiên cứu công thức:
  $arrow(u) = x arrow(i) + y arrow(j) + z arrow(k) arrow.l.r.double arrow(u) =\(x\;y\;z\)$.
  - #strong[Ví dụ 1:] Cho
    $arrow(u) = 2 arrow(i) - arrow(j) + 5 arrow(k)$. Tìm toạ độ của
    $arrow(u)$. (Đáp án: $arrow(u) =\(2\;- 1\;5\)$)
  - #strong[Ví dụ 2 (Thảo luận nhóm):] Cho
    $arrow(a) = 3 arrow(i) - arrow(k)$ và $arrow(b) = 2 arrow(j)$. Tìm
    toạ độ của $arrow(a)$ và $arrow(b)$. (Đáp án:
    $arrow(a) =\(3\;0\;- 1\)$, $arrow(b) =\(0\;2\;0\)$)
]
#sp-hd[
Toạ độ của các vectơ trong các ví dụ.
]
#tc-hd[
Thảo luận nhóm 4, mỗi nhóm giải quyết 2
  ví dụ và trình bày.

====== 2.2.2. Toạ độ của điểm trong không gian (20 phút)
]
#mt-hd[
HS xác định được toạ độ của một điểm $M$ theo
  vectơ vị trí $accent(O M, ⃗)$ và xác định được toạ độ của các điểm nằm
  trên các trục, mặt phẳng toạ độ.
]
#nd-hd[
HS nghiên cứu công thức:
  $M\(x\;y\;z\)arrow.l.r.double accent(O M, ⃗) = x arrow(i) + y arrow(j) + z arrow(k)$.
  - GV yêu cầu HS xác định toạ độ các điểm đặc biệt: $O\(?\;?\;?\)$, $M$
    trên trục $O x$ (dạng $M\(x\;0\;0\)$), $N$ trên mặt phẳng $O x y$
    (dạng $N\(x\;y\;0\)$).
  - #strong[Ví dụ 3:] Cho điểm $A$ sao cho
    $accent(O A, ⃗) = - 3 arrow(i) + 4 arrow(k)$. Tìm toạ độ điểm $A$.
    (Đáp án: $A\(- 3\;0\;4\)$)
  - #strong[Ví dụ 4 (Trò chơi học tập - Đố nhanh):]
    - Điểm $P\(1\;2\;- 3\)$ thuộc mặt phẳng nào nếu chiếu vuông góc?
    - Toạ độ hình chiếu của $P\(1\;2\;- 3\)$ lên trục $O y$? (Đáp án:
      $P_(O y)\(0\;2\;0\)$)
]
#sp-hd[
Toạ độ các điểm trong ví dụ.
]
#tc-hd[
GV sử dụng trò chơi #strong[Đố nhanh]
  để củng cố kiến thức, tăng cường tính tương tác. (Tích hợp NL số: GV
  có thể sử dụng công cụ #strong[Kahoot/Quizizz] với câu hỏi trắc nghiệm
  nhanh). (Biểu hiện của Năng lực số: #strong[Sử dụng công cụ/phương
  tiện học tập số để học tập, khám phá]).

====== 2.2.3. Toạ độ của vectơ theo toạ độ hai điểm đầu mút (20 phút)
]
#mt-hd[
HS tính được toạ độ vectơ $accent(A B, ⃗)$ khi
  biết toạ độ hai điểm $A\(x_A\;y_A\;z_A\)$ và $B\(x_B\;y_B\;z_B\)$.
]
#nd-hd[
HS nghiên cứu công thức:
  $accent(A B, ⃗) =\(x_B - x_A\;y_B - y_A\;z_B - z_A\)$.
  - #strong[Ví dụ 5:] Cho $A\(1\;- 2\;0\)$ và $B\(- 3\;4\;2\)$. Tính toạ
    độ vectơ $accent(A B, ⃗)$. (Đáp án: $accent(A B, ⃗) =\(- 4\;6\;2\)$)
  - #strong[Ví dụ 6 (Vận dụng):] Cho hình hộp chữ nhật
    $O A B C . O' A' B' C'$ có $O\(0\;0\;0\)$, $A\(4\;0\;0\)$,
    $C\(0\;5\;0\)$, $O'\(0\;0\;3\)$. Tính toạ độ vectơ $accent(A' C, ⃗)$.
]
#sp-hd[
Lời giải chi tiết Ví dụ 5 và 6.
]
#tc-hd[
Thảo luận, làm việc nhóm để giải quyết
  Ví dụ 6.

]
#hd("3", "Luyện tập", "30 phút")
Tên hoạt động: #strong[Củng cố và rèn luyện kỹ năng]

#mt-hd[
Vận dụng kiến thức đã học (hệ trục, toạ độ điểm,
  toạ độ vectơ) để giải quyết các bài tập cơ bản, rèn luyện kỹ năng tính
  toán và phân tích.
]
#nd-hd[
Hệ thống bài tập áp dụng trực tiếp:
  - Bài tập 1: Cho điểm $A\(1\;- 2\;3\)$. Tìm toạ độ của vectơ
    $accent(O A, ⃗)$, hình chiếu của $A$ lên mặt phẳng $O y z$ và trục
    $O x$.
  - Bài tập 2: Cho $arrow(u) =\(- 1\;2\;0\)$ và
    $arrow(v) =\(3\;1\;- 2\)$. Tính toạ độ vectơ
    $arrow(a) = 2 arrow(u) - 3 arrow(v)$.
  - Bài tập 3: Cho $A\(2\;0\;1\)$, $B\(0\;3\;- 1\)$, $C\(3\;4\;- 2\)$.
    Tính toạ độ vectơ $accent(A C, ⃗)$ và $accent(B C, ⃗)$.
  - Bài tập 4 (Tích hợp NL số): Sử dụng phần mềm GeoGebra 3D để biểu
    diễn các điểm $A\,B\,C$ và vectơ $accent(A C, ⃗)$ vừa tìm được.
]
#sp-hd[
  - Đáp án, lời giải của các bài tập 1, 2, 3.
  - Sản phẩm số: Hình ảnh biểu diễn 3D các điểm, vectơ (Bài tập 4).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giao 3 bài tập 1-3 cho HS làm
    việc cá nhân (15 phút). Bài tập 4 làm việc nhóm (10 phút).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS tự giải. GV theo dõi, hỗ trợ
    các HS gặp khó khăn (Ví dụ: nhầm thứ tự toạ độ).
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 3 HS lên bảng trình bày
    3 bài tập. Nhóm làm Bài tập 4 trình chiếu kết quả trên máy chiếu.
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, đánh giá kết quả,
    chốt lại phương pháp giải. (Tích hợp NL số: GV hướng dẫn HS sử dụng
    GeoGebra 3D để kiểm tra nhanh kết quả tính toán toạ độ (kiểm tra NL
    #strong[Giải quyết vấn đề và sáng tạo]). (Biểu hiện của Năng lực số:
    #strong[Sử dụng công cụ/phương tiện học tập số để học tập, khám
    phá]).

]
#hd("4", "Vận dụng", "10 phút - Giao nhiệm vụ về nhà")
Tên hoạt động: #strong[Vận dụng kiến thức vào thực tiễn]

#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  vào giải quyết các vấn đề thực tiễn.
]
#nd-hd[
  - Yêu cầu HS tìm kiếm, phát hiện và đề xuất một tình huống thực tiễn
    (trong xây dựng, kiến trúc, hàng không,...) mà việc xác định vị trí
    bằng hệ trục toạ độ $O x y z$ là cần thiết.
  - HS trình bày tình huống đó và mô hình hoá nó bằng hệ toạ độ
    $O x y z$ (xác định toạ độ một vài điểm/vectơ quan trọng trong mô
    hình).
  - #strong[Tích hợp NL số (Thiết kế sơ đồ tư duy):] GV giao nhiệm vụ
    yêu cầu HS tổng hợp kiến thức đã học bằng cách thiết kế một
    #strong[Sơ đồ tư duy (Mind Map)] về bài \"Hệ trục toạ độ trong không
    gian\" bằng các công cụ số (ví dụ: #strong[Canva, MindMeister,...]).
]
#sp-hd[
  - Báo cáo (trên giấy hoặc file mềm) về tình huống thực tiễn và mô hình
    hoá bằng toạ độ.
  - #strong[Sản phẩm số:] File #strong[Sơ đồ tư duy] về kiến thức bài
    học.
]
#tc-hd[
  - GV giao nhiệm vụ về nhà.
  - HS thực hiện ngoài giờ học trên lớp.
  - Sản phẩm được nộp, trao đổi, chia sẻ và đánh giá vào đầu tiết học
    tiếp theo. (Tích hợp NL số: HS sử dụng phần mềm để tạo sản phẩm số -
    sơ đồ tư duy, thể hiện NL #strong[Tạo ra, chỉnh sửa sản phẩm số]).

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
