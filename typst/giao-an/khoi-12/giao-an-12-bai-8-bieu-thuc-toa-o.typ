// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 8 Biểu thức toạ độ",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm và biểu thức toạ độ của vectơ trong hệ trục toạ độ
  $O x y z$ (nếu đã học).
- Trình bày được công thức toạ độ của #strong[phép cộng, phép trừ hai
  vectơ] và #strong[phép nhân một số với một vectơ].
- Nêu được biểu thức toạ độ của #strong[tích vô hướng] của hai vectơ.
- Nắm được điều kiện để hai vectơ #strong[cùng phương] thông qua toạ độ.
- Áp dụng công thức toạ độ để tính độ dài của vectơ và góc giữa hai
  vectơ.

#muc("2", "NĂNG LỰC")
==== a) Năng lực chung
- #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến
  thức qua SGK và tài liệu học tập; tự đánh giá được kết quả thực hiện
  nhiệm vụ cá nhân và nhóm.
- #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia hoạt động
  nhóm, trao đổi, thảo luận để hoàn thành nhiệm vụ học tập; trình bày,
  bảo vệ được quan điểm của mình.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Biết đặt câu hỏi về
  kiến thức đã học, huy động kiến thức đã học để giải quyết các bài toán
  liên quan đến toạ độ vectơ.

==== b) Năng lực đặc thù môn học (Năng lực Toán học)
- #strong[Năng lực tư duy và lập luận Toán học:] Phân tích, so sánh và
  suy luận để thiết lập, chứng minh công thức toạ độ các phép toán
  vectơ.
- #strong[Năng lực mô hình hoá Toán học:] Lựa chọn hệ toạ độ và sử dụng
  biểu thức toạ độ của vectơ để giải quyết một số bài toán thực tiễn (ví
  dụ: xác định vị trí, tính lực,...)
- #strong[Năng lực công cụ và phương tiện Toán học:] Sử dụng các công cụ
  học tập (máy tính cầm tay, phần mềm hình học động như GeoGebra hoặc
  Desmos) để kiểm tra, minh hoạ hoặc thực hiện các phép toán với toạ độ
  vectơ.

==== c) Năng lực số 
- 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
- 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
  tin và nội dung trong môi trường số.
- 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin và
  nội dung này cũng như điều hướng giữa chúng.
- 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.
- 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
  dạng khác nhau,
- 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc tạo
  ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, tìm tòi,
  khám phá kiến thức và hoàn thành nhiệm vụ được giao.
- #strong[Trung thực:] Trình bày ý kiến cá nhân và kết quả hoạt động
  nhóm một cách khách quan, không gian lận trong học tập.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ học tập của bản thân
  và nhóm; nhận thức được vai trò của Toán học trong thực tiễn cuộc
  sống.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy chiếu, máy tính, Phiếu học tập, Bài trình
  chiếu (PowerPoint), tài liệu tham khảo, phần mềm #strong[GeoGebra]
  hoặc #strong[Desmos] để minh họa hình học toạ độ.
- #strong[Học sinh:] Sách giáo khoa Toán 12 (Kết nối tri thức), vở ghi,
  dụng cụ học tập, máy tính cầm tay, điện thoại thông minh (hoặc máy
  tính bảng) có kết nối internet để tham gia hoạt động tích hợp năng lực
  số.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
- #strong[Tên thể hiện kết quả hoạt động:] Kết nối kiến thức cũ - Dự
  đoán công thức mới

==== a) Mục tiêu
- Ôn tập và củng cố kiến thức về toạ độ vectơ đã học ở lớp 10/11.
- Tạo tình huống có vấn đề, gợi mở nhu cầu tìm hiểu về công thức toạ độ
  của các phép toán vectơ trong không gian.

==== b) Nội dung
- #strong[Nhiệm vụ:] Giáo viên đặt câu hỏi/tình huống:
  - Cho hai vectơ $arrow(u) =\(u_1\;u_2\;u_3\)$ và
    $arrow(v) =\(v_1\;v_2\;v_3\)$ trong không gian $O x y z$. Hãy nhắc
    lại công thức toạ độ của $arrow(u)$ và $arrow(v)$ (nếu đã học ở lớp
    10/11) và công thức tính độ dài $\|arrow(u)\|$.
  - #strong[Tình huống:] Bằng trực giác, hãy dự đoán công thức tính toạ
    độ của vectơ $arrow(a) = arrow(u) + arrow(v)$ và vectơ
    $arrow(b) = k dot.op arrow(u)$ (với $k$ là một số thực).

==== c) Sản phẩm
- #strong[Kết quả:] Học sinh trả lời đúng:
  - Toạ độ vectơ $arrow(u) =\(u_1\;u_2\;u_3\)$ và độ dài
    $\|arrow(u)\|= sqrt(u_1^2 + u_2^2 + u_3^2)$.
  - #strong[Dự đoán:]
    $arrow(u) + arrow(v) =\(u_1 + v_1\;u_2 + v_2\;u_3 + v_3\)$\;
    $k dot.op arrow(u) =\(k u_1\;k u_2\;k u_3\)$.
- #strong[Hình thức:] Học sinh trình bày miệng, hoặc viết nhanh vào
  phiếu/nháp.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Chuyển giao nhiệm vụ:] Giáo viên chiếu câu hỏi và tình
  huống, yêu cầu học sinh làm việc cá nhân (2 phút).
- #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh suy nghĩ và trả lời.
- #strong[Bước 3: Báo cáo, thảo luận:] Giáo viên gọi 1-2 học sinh trình
  bày câu trả lời và dự đoán của mình.
- #strong[Bước 4: Kết luận, nhận định:] Giáo viên ghi nhận các dự đoán,
  dẫn dắt vào bài mới: \"Liệu các dự đoán này có chính xác không? Chúng
  ta sẽ cùng kiểm chứng và chứng minh trong các hoạt động tiếp theo.\"

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "105 phút - 5 hoạt động thành phần")
- #strong[Tên thể hiện kết quả hoạt động:] Chiếm lĩnh kiến thức - Chứng
  minh công thức toạ độ các phép toán vectơ

==== 2.1. Hoạt động thành phần 2.1: Biểu thức toạ độ phép cộng, phép trừ hai vectơ; phép nhân một số với một vectơ (25 phút)
#mt-hd[
Chứng minh và nắm vững công thức toạ độ của phép
  cộng, trừ vectơ và nhân một số với một vectơ.
]
#nd-hd[
Học sinh làm việc nhóm (4-5 người), nghiên cứu
  SGK (hoặc tài liệu bổ sung) để chứng minh và hoàn thiện các công thức
  toạ độ.
  - #strong[Ví dụ minh hoạ:] Cho $arrow(u) =\(1\;- 2\;3\)$ và
    $arrow(v) =\(2\;4\;- 1\)$. Tính toạ độ của $arrow(u) + arrow(v)$,
    $arrow(u) - arrow(v)$ và $3 arrow(u)$.
  - #strong[Phát triển năng lực số:] Giáo viên yêu cầu học sinh sử dụng
    phần mềm #strong[GeoGebra 3D] hoặc #strong[Desmos] để biểu diễn toạ
    độ của $arrow(u)$, $arrow(v)$ và minh họa kết quả của
    $arrow(u) + arrow(v)$ bằng hình học. \* #strong[c) Sản phẩm:] Công
    thức toạ độ chính xác cho ba phép toán. Kết quả ví dụ minh hoạ:
    $arrow(u) + arrow(v) =\(3\;2\;2\)$\;
    $arrow(u) - arrow(v) =\(- 1\;- 6\;4\)$\;
    $3 arrow(u) =\(3\;- 6\;9\)$.
]
#tc-hd[
  - #strong[Bước 1:] Giao nhiệm vụ chứng minh công thức và tính toán ví
    dụ cho các nhóm.
  - #strong[Bước 2:] Các nhóm tự nghiên cứu, trao đổi, viết ra lời giải.
    Giáo viên theo dõi, gợi ý (dựa vào biểu diễn
    $arrow(u) = u_1 arrow(i) + u_2 arrow(j) + u_3 arrow(k)$).
  - #strong[Bước 3:] Gọi một nhóm trình bày cách chứng minh và kết quả,
    các nhóm khác phản biện.
  - #strong[Bước 4:] Giáo viên chuẩn hoá kiến thức.

==== 2.2. Hoạt động thành phần 2.2: Biểu thức toạ độ của tích vô hướng (25 phút)
]
#mt-hd[
Thiết lập và nắm vững công thức toạ độ của tích
  vô hướng hai vectơ.
]
#nd-hd[
Học sinh làm việc cá nhân/cặp đôi, dựa vào biểu
  diễn $arrow(u) = u_1 arrow(i) + u_2 arrow(j) + u_3 arrow(k)$ và tính
  chất tích vô hướng, để chứng minh công thức
  $arrow(u) dot.op arrow(v)$.
  - #strong[Ví dụ minh hoạ:] Cho $arrow(u) =\(1\;- 2\;3\)$ và
    $arrow(v) =\(2\;4\;- 1\)$. Tính tích vô hướng
    $arrow(u) dot.op arrow(v)$.
  - #strong[Phát triển năng lực số:] Học sinh sử dụng máy tính cầm tay
    hoặc công cụ tính toán trực tuyến để nhanh chóng tính
    $arrow(u) dot.op arrow(v)$.
]
#sp-hd[
Công thức tích vô hướng:
  $arrow(u) dot.op arrow(v) = u_1 v_1 + u_2 v_2 + u_3 v_3$. Kết quả ví
  dụ:
  $arrow(u) dot.op arrow(v) = 1 dot.op 2 +\(- 2\)dot.op 4 + 3 dot.op\(- 1\)= 2 - 8 - 3 = - 9$.
]
#tc-hd[
  - #strong[Bước 1:] Giao nhiệm vụ chứng minh công thức.
  - #strong[Bước 2:] Học sinh thực hiện. Giáo viên dự kiến khó khăn: học
    sinh có thể quên tính chất
    $arrow(i) dot.op arrow(i) = 1\,arrow(i) dot.op arrow(j) = 0\,dots.h$
    (Giáo viên gợi ý).
  - #strong[Bước 3:] Gọi một học sinh trình bày lời giải.
  - #strong[Bước 4:] Giáo viên chốt lại kiến thức.

==== 2.3. Hoạt động thành phần 2.3: Điều kiện hai vectơ cùng phương (15 phút)
]
#mt-hd[
Thiết lập điều kiện để hai vectơ cùng phương
  thông qua toạ độ.
]
#nd-hd[
Học sinh làm việc nhóm, dựa vào định nghĩa
  $arrow(u)$ cùng phương với $arrow(v)$ khi
  $arrow(u) = k dot.op arrow(v)$ (với $arrow(v) eq.not arrow(0)$), để
  thiết lập mối quan hệ giữa các thành phần toạ độ $u_i$ và $v_i$.
  - #strong[Ví dụ minh hoạ:] Hai vectơ $arrow(a) =\(1\;2\;- 3\)$ và
    $arrow(b) =\(- 2\;- 4\;6\)$ có cùng phương không?
]
#sp-hd[
Điều kiện cùng phương:
  $u_1 / v_1 = u_2 / v_2 = u_3 / v_3$ (trong trường hợp các
  $v_i eq.not 0$). Kết quả ví dụ:
  $frac(1, - 2) = frac(2, - 4) = frac(- 3, 6) = - 1 / 2$. Kết luận:
  $arrow(a)$ và $arrow(b)$ cùng phương.
]
#tc-hd[
  - #strong[Bước 1:] Giao nhiệm vụ.
  - #strong[Bước 2:] Học sinh thảo luận nhóm, đưa ra kết luận.
  - #strong[Bước 3:] Trình bày và chốt kiến thức (Lưu ý trường hợp các
    thành phần toạ độ bằng 0).

==== 2.4. Hoạt động thành phần 2.4: Độ dài vectơ và góc giữa hai vectơ (20 phút)
]
#mt-hd[
Tính được độ dài vectơ và góc giữa hai vectơ
  bằng công thức toạ độ.
]
#nd-hd[
Học sinh làm việc nhóm, vận dụng công thức tích
  vô hướng và độ dài để suy ra công thức tính góc $phi$:
  $cos phi = frac(arrow(u) dot.op arrow(v), \|arrow(u)\|dot.op\|arrow(v)\|)$.
  - #strong[Ví dụ minh hoạ:] Tính độ dài của $arrow(u) =\(1\;- 2\;3\)$
    và góc giữa $arrow(u)$ và $arrow(v) =\(2\;4\;- 1\)$.
]
#sp-hd[
Độ dài
  $\|arrow(u)\|= sqrt(u_1^2 + u_2^2 + u_3^2)$. Góc:
  $cos phi = frac(u_1 v_1 + u_2 v_2 + u_3 v_3, sqrt(u_1^2 + u_2^2 + u_3^2) dot.op sqrt(v_1^2 + v_2^2 + v_3^2))$.
  - #strong[Kết quả ví dụ:]
    $\|arrow(u)\|= sqrt(1^2 +\(- 2\)^2+ 3^2) = sqrt(14)$.
    $\|arrow(v)\|= sqrt(2^2 + 4^2 +\(- 1\)^2) = sqrt(21)$.
    $cos phi = frac(- 9, sqrt(14) dot.op sqrt(21))$.
]
#tc-hd[
  - #strong[Bước 1:] Giao nhiệm vụ.
  - #strong[Bước 2:] Học sinh thảo luận.
  - #strong[Bước 3:] Trình bày và chốt kiến thức.

==== 2.5. Hoạt động thành phần 2.5: Vận dụng toạ độ của vectơ trong một số bài toán có liên quan đến thực tiễn (20 phút)
]
#mt-hd[
Vận dụng công thức toạ độ để giải quyết bài toán
  thực tiễn.
]
#nd-hd[
Học sinh làm việc nhóm, giải quyết tình huống
  thực tiễn.
  - #strong[Tình huống/Ví dụ:] Một máy bay đang ở toạ độ $A\(1\;2\;5\)$
    (đơn vị: km). Nó cần di chuyển đến điểm $B\(4\;- 2\;10\)$ theo một
    vectơ dịch chuyển $accent(A B, ⃗)$.
    - Tìm biểu thức toạ độ của vectơ $accent(A B, ⃗)$.
    - Nếu nó di chuyển 3 lần quãng đường $accent(A B, ⃗)$, thì toạ độ
      vectơ dịch chuyển là bao nhiêu?
  - #strong[Phát triển năng lực số:] Yêu cầu học sinh vẽ sơ đồ tư duy
    (Mind Map) bằng phần mềm #strong[MindMeister] hoặc tương tự, tổng
    hợp các công thức toạ độ đã học. \* #strong[c) Sản phẩm:]
    $accent(A B, ⃗) =\(3\;- 4\;5\)$. Toạ độ dịch chuyển gấp 3 lần:
    $3 dot.op accent(A B, ⃗) =\(9\;- 12\;15\)$.
]
#tc-hd[
  - #strong[Bước 1:] Giao nhiệm vụ thực tiễn và nhiệm vụ vẽ sơ đồ tư duy
    (Phân công: 2 nhóm giải bài toán thực tiễn, 2 nhóm vẽ sơ đồ tư duy).
  - #strong[Bước 2:] Các nhóm thực hiện. Giáo viên quan sát, hỗ trợ.
  - #strong[Bước 3:] Mời các nhóm báo cáo sản phẩm (Trình bày lời giải
    bài toán và trình chiếu Sơ đồ tư duy).
  - #strong[Bước 4:] Giáo viên nhận xét, đánh giá sản phẩm.

]
#hd("3", "Luyện tập", "10 phút")
- #strong[Tên thể hiện kết quả hoạt động:] Thực hành - Củng cố kiến thức

==== a) Mục tiêu
- Vận dụng nhanh, chính xác các công thức toạ độ của các phép toán
  vectơ.
- Rèn luyện kĩ năng tính toán và giải các bài tập cơ bản.

==== b) Nội dung
- #strong[Trò chơi học tập (Quiz/Kahoot!):] Giáo viên chuẩn bị hệ thống
  câu hỏi trắc nghiệm nhanh (5-7 câu) về các nội dung đã học:
  #block[
  #set enum(numbering: "a.", start: 1)
  + Tìm toạ độ vectơ tổng/hiệu.
  + Tìm toạ độ vectơ nhân với một số.
  + Tính tích vô hướng.
  + Kiểm tra điều kiện cùng phương/vuông góc.
  + Tính độ dài.
  ]

  - #strong[Phát triển năng lực số:] Học sinh sử dụng điện thoại/máy
    tính bảng để tham gia trả lời trắc nghiệm trên nền tảng số
    (Kahoot!/Google Forms). Biểu hiện: #strong[Giao tiếp và hợp tác
    trong môi trường số].
#sp-hd[
Học sinh đưa ra đáp án đúng cho các câu hỏi trắc
  nghiệm.
]
#tc-hd[
  - #strong[Bước 1:] Giáo viên chiếu các câu hỏi dưới dạng trò chơi (ví
    dụ: Kahoot!).
  - #strong[Bước 2:] Học sinh tham gia trò chơi, trả lời nhanh các câu
    hỏi (làm việc cá nhân).
  - #strong[Bước 3:] Kết thúc trò chơi, giáo viên tổng kết điểm và cùng
    học sinh chữa nhanh các câu sai, nhấn mạnh lại công thức.

]
#hd("4", "Vận dụng", "10 phút")
- #strong[Tên thể hiện kết quả hoạt động:] Mở rộng - Kết nối thực tiễn

==== a) Mục tiêu
- Phát triển năng lực giải quyết vấn đề thực tiễn thông qua việc vận
  dụng kiến thức toạ độ vectơ.
- Khuyến khích học sinh tìm tòi, khám phá ứng dụng của Toán học.

==== b) Nội dung
- #strong[Nhiệm vụ:] Tìm hiểu ứng dụng của toạ độ vectơ và các phép toán
  vectơ trong thực tiễn (ví dụ: Vật lí (tổng hợp lực, công của lực),
  Hàng hải (xác định vị trí, phương hướng), Đồ hoạ máy tính 3D,...)
- #strong[Yêu cầu:] Học sinh làm việc theo nhóm 4-5 người, tìm kiếm
  thông tin và chuẩn bị báo cáo ngắn (dạng slide/video/bản in) về một
  ứng dụng cụ thể.
- #strong[Ví dụ đề xuất:] \"Toạ độ vectơ được dùng như thế nào trong
  thiết kế mô hình 3D (3D modeling)?\"
  - #strong[Phát triển năng lực số:] Học sinh sử dụng các công cụ tìm
    kiếm và trình chiếu (Google, PowerPoint) để tạo báo cáo. Biểu hiện:
    #strong[Khai thác và xử lí thông tin số], #strong[Sáng tạo nội dung
    số].

==== c) Sản phẩm
- #strong[Báo cáo:] Nội dung và hình thức báo cáo về ứng dụng của toạ độ
  vectơ trong thực tiễn (dự kiến hoàn thành ngoài giờ học).

==== d) Tổ chức thực hiện
- #strong[Bước 1:] Giáo viên giao nhiệm vụ và yêu cầu về sản phẩm báo
  cáo.
- #strong[Bước 2:] Học sinh ghi nhận nhiệm vụ, thảo luận nhanh về hướng
  thực hiện (thực hiện chủ yếu ngoài giờ học).
- #strong[Bước 3:] Giáo viên hẹn lịch thu báo cáo và đánh giá/trao đổi
  vào tiết học tiếp theo hoặc một buổi sinh hoạt lớp/ngoại khoá phù hợp.

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

