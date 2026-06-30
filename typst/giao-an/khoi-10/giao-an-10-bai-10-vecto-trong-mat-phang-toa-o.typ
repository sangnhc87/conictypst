// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 10 Vectơ trong mặt phẳng toạ độ",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm và xác định được #strong[toạ độ của một vectơ].
- Nêu được khái niệm và xác định được #strong[toạ độ của một điểm] trên
  mặt phẳng toạ độ.
- Xác định được #strong[toạ độ của vectơ] $accent(A B, ⃗)$ khi biết toạ
  độ hai điểm $A$ và $B$.
- Vận dụng được các #strong[biểu thức toạ độ của phép cộng, trừ hai
  vectơ] và #strong[phép nhân một số với một vectơ].
- Vận dụng được #strong[điều kiện hai vectơ cùng phương].
- Xác định được #strong[toạ độ trung điểm] của đoạn thẳng và #strong[toạ
  độ trọng tâm] của tam giác.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]

  - #strong[Năng lực tự chủ và tự học:] Chủ động hoàn thành các nhiệm vụ
    học tập được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực trao đổi, thảo luận
    nhóm để giải quyết các vấn đề, chia sẻ kết quả và kiến thức mới.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Đề xuất được các
    phương án giải quyết bài tập liên quan đến toạ độ vectơ.

- #strong[Năng lực đặc thù:]

  - #strong[Năng lực tư duy và lập luận Toán học:] Phân tích, tổng hợp
    kiến thức về toạ độ để hình thành các công thức.
  - #strong[Năng lực mô hình hoá Toán học:] Mô tả được các phép toán
    vectơ bằng toạ độ.

- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  các nhiệm vụ được giao.
- #strong[Trung thực:] Thẳng thắn, nghiêm túc trong việc tự đánh giá và
  đánh giá đồng đẳng trong quá trình hoạt động nhóm.
- #strong[Trách nhiệm:] Có trách nhiệm trong hoạt động nhóm và vận dụng
  kiến thức vào giải quyết các vấn đề thực tiễn.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:]
  - Máy tính, máy chiếu, bảng phụ.
  - Phần mềm trình chiếu (PowerPoint), phần mềm #strong[GeoGebra] để
    minh họa hình ảnh trực quan .
  - Phiếu học tập, bộ câu hỏi trắc nghiệm ngắn trên Kahoot/Google Forms
    (Tích hợp Năng lực số).
  - Sách giáo khoa Toán 10 - Kết nối tri thức với cuộc sống.
- #strong[Học sinh:]
  - Sách giáo khoa, vở ghi, dụng cụ học tập.
  - Điện thoại thông minh/máy tính bảng có kết nối mạng (phục vụ hoạt
    động kiểm tra bằng Kahoot/quiz online, tra cứu).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Nhiệm vụ học tập/Mở đầu", "15 phút")
#mt-hd[
Nêu mục tiêu giúp học sinh xác định được vấn đề cần giải quyết: Làm thế
nào để mô tả và thực hiện các phép toán trên vectơ một cách đơn giản,
chính xác bằng công cụ số học (toạ độ)?

]
#nd-hd[
- #strong[Phương pháp:] Đặt vấn đề, gợi mở.
- #strong[Nội dung yêu cầu/nhiệm vụ:] Giáo viên trình chiếu một hình ảnh
  mặt phẳng toạ độ quen thuộc và đặt câu hỏi.

#quote(block: true)[
#box(image("media/image1.jpeg", height: 1.38728in, width: 2.08168in, alt: "Cartesian coordinate system with points plotted"))
]

- #strong[Câu hỏi gợi mở:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + Trên mặt phẳng toạ độ $O x y$, làm thế nào để xác định vị trí của
    một điểm $M$?
  + Nếu cho một vectơ $arrow(v)$ bất kì, có cách nào dùng cặp số
    $\(a_1\;a_2\)$ để biểu diễn và tính toán được với nó hay không?
  ]

]
#sp-hd[
Học sinh đưa ra các ý kiến ban đầu và #strong[xác định được nhiệm vụ học
tập] tiếp theo là tìm hiểu về: #strong[Toạ độ của vectơ] và #strong[Các
phép toán vectơ bằng toạ độ].

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] Giáo viên trình chiếu câu hỏi và yêu
  cầu học sinh thảo luận cặp đôi trong 3 phút.
- #strong[Thực hiện nhiệm vụ (học sinh thực hiện; giáo viên theo dõi, hỗ
  trợ):] Học sinh thảo luận cặp đôi. Giáo viên quan sát, gợi ý: \"Liên
  hệ giữa điểm và vectơ, đưa vectơ về gốc $O$\.\"
- #strong[Báo cáo, thảo luận (giáo viên tổ chức, điều hành; học sinh báo
  cáo, thảo luận):] Giáo viên mời 2-3 cặp đôi báo cáo ý kiến. Các nhóm
  khác nhận xét, bổ sung.
- #strong[Kết luận, nhận định:] Giáo viên chuẩn hóa câu trả lời, nhận
  xét và dẫn dắt vào bài học mới: \"#strong[Vectơ trong mặt phẳng toạ
  độ]\".

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "85 phút - 2 tiết")
==== Hoạt động thành phần 2.1: Toạ độ của vectơ (45 phút)
#mt-hd[
Nêu mục tiêu giúp học sinh: Hiểu được khái niệm và #strong[xác định được
toạ độ của vectơ]\; Xác định được #strong[toạ độ của điểm]\; Xác định
được #strong[toạ độ vectơ] $accent(A B, ⃗)$.

]
#nd-hd[
- #strong[Phương pháp:] Dạy học giải quyết vấn đề, nhóm nhỏ, thực hành
  trực quan (với GeoGebra).
- #strong[Nhiệm vụ 1 (Cặp đôi/Nhóm 4):] Đọc SGK, làm việc với #strong[hệ
  trục toạ độ] $O x y$, tìm hiểu về $arrow(i)$, $arrow(j)$ và biểu diễn
  $arrow(u) = a_1 arrow(i) + a_2 arrow(j)$.
  - #strong[Ví dụ minh họa:] Cho $arrow(a) = 3 arrow(i) - 2 arrow(j)$.
    Yêu cầu học sinh biểu diễn $arrow(a)$ trên GeoGebra (hoặc giấy kẻ ô)
    và xác định toạ độ của nó.
- #strong[Nhiệm vụ 2 (Cặp đôi):] Tìm hiểu về #strong[toạ độ điểm] và
  #strong[toạ độ vectơ] $accent(A B, ⃗)$. Cho $A\(x_A\;y_A\)$ và
  $B\(x_B\;y_B\)$. Nêu cách tính toạ độ $accent(A B, ⃗)$.
  - #strong[Ví dụ minh họa:] Cho $A\(1\;5\)$ và $B\(- 2\;3\)$. Tính
    $accent(A B, ⃗)$.

]
#sp-hd[
- #strong[Sản phẩm 1:] Nắm vững #strong[khái niệm toạ độ vectơ]:
  $arrow(u) =\(a_1\;a_2\)arrow.l.r.double arrow(u) = a_1 arrow(i) + a_2 arrow(j)$.
- #strong[Sản phẩm 2:] Công thức #strong[toạ độ vectơ]
  $accent(A B, ⃗) =\(x_B - x_A\;y_B - y_A\)$.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] Giáo viên giao nhiệm vụ 1 và 2. Hướng
  dẫn các nhóm sử dụng GeoGebra để minh họa cho Ví dụ 1. #strong[Tích
  hợp Năng lực số:] Yêu cầu HS nhập $A\(1\,5\)\,B\(- 2\,3\)$ vào
  GeoGebra và quan sát kết quả tính $accent(A B, ⃗)$ của phần mềm.
  #strong[Biểu hiện năng lực số:] #strong[Sử dụng công cụ số] (GeoGebra)
  để thực hiện phép toán và trực quan hóa hình học.
- #strong[Thực hiện nhiệm vụ:] Học sinh đọc SGK, thảo luận, thực hiện
  các ví dụ minh họa và viết ra công thức. Giáo viên theo dõi, dự kiến
  khó khăn (HS nhầm thứ tự $A$ và $B$ khi tính $accent(A B, ⃗)$) và hỗ
  trợ.
- #strong[Báo cáo, thảo luận:] Đại diện nhóm báo cáo kết quả và trình
  bày cách sử dụng GeoGebra để minh hoạ.
- #strong[Kết luận, nhận định:] Giáo viên chuẩn hóa kiến thức, chốt công
  thức.

==== Hoạt động thành phần 2.2: Biểu thức toạ độ của các phép toán vectơ (40 phút)
]
#mt-hd[
Nêu mục tiêu giúp học sinh: Vận dụng được #strong[biểu thức toạ độ của
các phép toán cộng, trừ, nhân một số với vectơ]\; Vận dụng được
#strong[điều kiện hai vectơ cùng phương]\; Xác định được #strong[toạ độ
trung điểm] và #strong[trọng tâm].

]
#nd-hd[
- #strong[Phương pháp:] Dạy học khám phá, nhóm nhỏ, thuyết trình (sơ đồ
  tư duy).
- #strong[Nhiệm vụ 3 (Nhóm 4):] Xây dựng công thức toạ độ của:
  $arrow(a) + arrow(b)$, $arrow(a) - arrow(b)$, $k arrow(a)$ (với
  $k bb(in R)$), với $arrow(a) =\(a_1\;a_2\)$, $arrow(b) =\(b_1\;b_2\)$.
  - #strong[Ví dụ minh họa:] Cho $arrow(u) =\(2\;- 1\)$,
    $arrow(v) =\(3\;4\)$. Tính $arrow(u) + arrow(v)$,
    $2 arrow(u) - arrow(v)$.
- #strong[Nhiệm vụ 4 (Nhóm 4):] Suy ra #strong[điều kiện cùng phương
  bằng toạ độ]. Tìm công thức tính #strong[toạ độ trung điểm] $I$ của
  $A B$, #strong[trọng tâm] $G$ của $triangle.stroked.t A B C$.
  - #strong[Ví dụ minh họa:] Cho $A\(1\;3\)$, $B\(5\;1\)$, $C\(3\;5\)$.
    Chứng minh $A\,B\,C$ không thẳng hàng. Tìm toạ độ trung điểm $M$ của
    $A C$ và trọng tâm $G$ của $triangle.stroked.t A B C$.

]
#sp-hd[
- #strong[Sản phẩm:] Các công thức về phép toán, điều kiện cùng phương,
  toạ độ trung điểm, trọng tâm. Các nhóm #strong[tổng hợp kiến thức dưới
  dạng sơ đồ tư duy] và trình bày (Tăng cường kĩ năng phân tích và tổng
  hợp thông tin qua sơ đồ tư duy) .

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] Giáo viên chia lớp thành các nhóm (4
  HS/nhóm) và giao nhiệm vụ 3 và 4. Yêu cầu nhóm ghi lại kết quả dưới
  dạng sơ đồ tư duy.
- #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận, xây dựng công thức và
  giải ví dụ. Giáo viên theo dõi, hỗ trợ, đặc biệt là phần điều kiện
  cùng phương (dự kiến khó khăn: HS không xét trường hợp có toạ độ bằng
  0).
- #strong[Báo cáo, thảo luận:] Mời 2 nhóm trình bày sơ đồ tư duy (khuyến
  khích thuyết trình). Các nhóm khác phản biện, bổ sung (Tăng cường kĩ
  năng giao tiếp, thuyết trình).
- #strong[Kết luận, nhận định:] Giáo viên chốt lại các công thức, đặc
  biệt nhấn mạnh ý nghĩa của điều kiện cùng phương.

]
#hd("3", "Luyện tập", "25 phút")
#mt-hd[
Nêu rõ mục tiêu vận dụng kiến thức đã học và yêu cầu phát triển các kĩ
năng tính toán, trình bày cho học sinh.

]
#nd-hd[
- #strong[Phương pháp:] Trò chơi học tập (Kahoot/Quizizz) hoặc bài tập
  trắc nghiệm ngắn.
- #strong[Nội dung yêu cầu/nhiệm vụ:] Hoàn thành các câu hỏi trắc
  nghiệm/bài tập nhanh.
  - #strong[Bài tập 1 (Tính toán):] Cho
    $A\(- 1\;2\)\,B\(3\;- 4\)\,C\(5\;0\)$. Tìm toạ độ vectơ
    $arrow(u) = accent(A B, ⃗) + 2 accent(B C, ⃗)$.
  - #strong[Bài tập 2 (Điều kiện cùng phương):] Tìm $x$ để hai vectơ
    $arrow(a) =\(x\;2\)$ và $arrow(b) =\(4\;8\)$ cùng phương.
  - #strong[Bài tập 3 (Trung điểm/Trọng tâm):] Tìm toạ độ điểm $D$ để tứ
    giác $A B C D$ là hình bình hành (với $A\,B\,C$ như ở Bài tập 1).

]
#sp-hd[
Đáp án chính xác, nhanh chóng của các câu hỏi.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] Giáo viên chia lớp thành các đội và
  công bố luật chơi (sử dụng Kahoot/Quizizz). #strong[Tích hợp Năng lực
  số:] Học sinh sử dụng điện thoại/máy tính để tham gia trò chơi trả lời
  trắc nghiệm trực tuyến (Tăng cường kĩ năng sử dụng công nghệ số để
  tương tác, giao tiếp và giải quyết vấn đề).
- #strong[Thực hiện nhiệm vụ:] Học sinh thực hiện bài tập, nhập đáp án.
  Giáo viên theo dõi kết quả.
- #strong[Báo cáo, thảo luận:] Giáo viên chữa nhanh các câu hỏi mà nhiều
  học sinh trả lời sai, mời đại diện đội thắng trình bày phương pháp
  giải tối ưu.
- #strong[Kết luận, nhận định:] Nhận xét chung về kết quả luyện tập của
  học sinh.

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
Nêu rõ mục tiêu phát triển năng lực của học sinh thông qua nhiệm vụ vận
dụng kiến thức, kĩ năng vào thực tiễn (theo từng bài hoặc nhóm bài có
nội dung phù hợp).

]
#nd-hd[
- #strong[Phương pháp:] Giao nhiệm vụ thực tiễn, làm việc cá nhân/nhóm.
- #strong[Mô tả rõ yêu cầu học sinh:] #strong[Ứng dụng Vị trí]
  - Trong hệ thống định vị GPS (có thể xem là mặt phẳng toạ độ), vị trí
    của một máy bay trực thăng là $A\(100\;50\)$ (đơn vị km). Sau 1 giờ,
    máy bay di chuyển đến vị trí $B\(150\;80\)$.
  - #strong[Yêu cầu:] Hãy tính vectơ chỉ đường đi $accent(A B, ⃗)$ và
    tính quãng đường máy bay đã di chuyển (bỏ qua độ cao).

]
#sp-hd[
- #strong[Nêu rõ yêu cầu về nội dung và hình thức báo cáo:] Báo cáo ngắn
  gọn về kết quả tính toán và cách thức áp dụng công thức vào bài toán
  thực tế (tính toán toạ độ $accent(A B, ⃗)$ và độ dài
  $\|accent(A B, ⃗)\|$).

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] Giáo viên giao nhiệm vụ Vận dụng,
  hướng dẫn học sinh thực hiện #strong[ngoài giờ học trên lớp] và nộp
  báo cáo (dạng Word/PDF/ảnh chụp) vào tiết học tiếp theo.
- #strong[Thực hiện nhiệm vụ:] Học sinh chủ động thực hiện nhiệm vụ.
- #strong[Đánh giá:] Giáo viên thu thập báo cáo, nhận xét và đánh giá
  (chủ yếu bằng nhận xét quá trình và kết quả) vào đầu tiết học kế tiếp.

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
