// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 6 Vecto trong KG",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[vectơ trong không gian] và tính chất bằng
  nhau của hai vectơ.
- Trình bày được quy tắc thực hiện các phép toán #strong[cộng, trừ
  vectơ] và #strong[nhân một số với một vectơ] trong không gian.
- Xác định được #strong[góc giữa hai vectơ] trong không gian.
- Vận dụng được công thức tính #strong[tích vô hướng của hai vectơ]
  trong không gian và hiểu được điều kiện vuông góc.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm kiếm, đọc và xử lý thông tin
    từ sách giáo khoa (SGK), tài liệu trực tuyến về vectơ trong không
    gian.
  - #strong[Giao tiếp và hợp tác:] Tích cực tham gia thảo luận nhóm,
    phân công nhiệm vụ, trình bày ý kiến và lắng nghe phản biện khi xây
    dựng sơ đồ tư duy và giải quyết các bài tập nhóm.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích được các tình
    huống thực tiễn gắn với hình học không gian và sử dụng kiến thức
    vectơ để đưa ra giải pháp (ví dụ: xác định vị trí, lực tác dụng).
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Hình thành các khái
    niệm, quy tắc về vectơ trong không gian dựa trên cơ sở tương tự với
    vectơ trong mặt phẳng.
  - #strong[Năng lực mô hình hóa toán học:] Thiết lập mô hình vectơ để
    biểu diễn các đại lượng có hướng (vận tốc, lực, vị trí) trong không
    gian ba chiều.
  - #strong[Năng lực giao tiếp toán học:] Trình bày được ý tưởng, kết
    quả, lời giải bài toán về vectơ một cách chính xác, logic.
- #strong[Năng lực số (Theo Thông tư số 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia hoạt động cá nhân và nhóm, hoàn
  thành các nhiệm vụ học tập được giao.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong nhóm, đóng góp ý kiến
  xây dựng bài học; nghiêm túc trong việc tự đánh giá và đánh giá đồng
  đẳng.
- #strong[Trung thực:] Thể hiện sự trung thực trong quá trình làm bài
  tập và báo cáo kết quả hoạt động.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính/laptop, màn chiếu, bộ
  dụng cụ hình học, bảng phụ/giấy A0.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc sống).
  - Các mô hình vật thể trong không gian (khối hộp, kim tự tháp) để minh
    họa vectơ. \* Phiếu học tập, bộ câu hỏi trắc nghiệm ngắn (quiz) qua
    nền tảng số (ví dụ: Quizizz, Kahoot!).
  - Tài liệu hướng dẫn sử dụng phần mềm #strong[GeoGebra 3D] hoặc các
    công cụ trực tuyến tương tự.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "Tiết 1 - 20 phút")
- #strong[Tên hoạt động:] Khởi động: Từ vectơ phẳng đến vectơ không gian
#mt-hd[
Giúp học sinh ôn lại kiến thức về vectơ trong
  mặt phẳng và xác định được vấn đề/nhiệm vụ cần giải quyết: mở rộng
  khái niệm vectơ và các phép toán lên không gian ba chiều.
]
#nd-hd[
  - Giáo viên (GV) đặt câu hỏi gợi mở về khái niệm vectơ trong mặt phẳng
    và các phép toán.
  - GV trình chiếu hình ảnh về một vật thể chuyển động trong không gian
    (ví dụ: máy bay cất cánh, con kiến bò trên một hộp lập phương). GV
    yêu cầu học sinh thảo luận nhóm 2-3 người để tìm cách mô tả hướng và
    độ lớn của chuyển động đó (thử dùng vectơ phẳng).
  - #strong[Nhiệm vụ:] Từ việc không thể mô tả đầy đủ bằng vectơ phẳng,
    học sinh đề xuất nhu cầu cần một khái niệm mới: #strong[Vectơ trong
    không gian].
]
#sp-hd[
Câu trả lời của học sinh về vectơ phẳng; mô tả
  bằng lời về sự thiếu hụt khi dùng vectơ phẳng để biểu diễn trong không
  gian; đề xuất về khái niệm #strong[Vectơ trong không gian].
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV đặt câu hỏi và trình chiếu tình huống.
  - #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm nhỏ trong 5
    phút.
  - #strong[Báo cáo, thảo luận:] Đại diện 1-2 nhóm trình bày kết quả. GV
    ghi nhận các ý kiến, đặc biệt là ý kiến về sự cần thiết của vectơ
    trong không gian.
  - #strong[Kết luận, nhận định:] GV chốt lại vấn đề: Bài học hôm nay sẽ
    mở rộng khái niệm vectơ lên không gian, học cách biểu diễn và tính
    toán với chúng.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "Tiết 1 - 25 phút; Tiết 2-5: 45 phút/tiết; Tiết 6: 25 phút")
==== 2.1. Hoạt động thành phần 2.1: Khái niệm Vectơ trong không gian (Tiết 1 - 25 phút)
#mt-hd[
Hình thành khái niệm vectơ trong không gian,
  hiểu được khái niệm giá, phương, độ dài và sự bằng nhau của hai vectơ.
]
#nd-hd[
Học sinh làm việc với SGK và mô hình khối hộp
  chữ nhật để định nghĩa vectơ.
  - #strong[Ví dụ minh họa:] Cho khối lập phương $A B C D . A' B' C' D'$
    . Xác định các vectơ
    $accent(A B, ⃗)\,accent(C C', ⃗)\,accent(B D', ⃗)$. Tìm các cặp vectơ
    bằng nhau.
]
#sp-hd[
Định nghĩa #strong[Vectơ trong không gian],
  #strong[vectơ-không], #strong[độ dài vectơ]\; tìm được các cặp vectơ
  bằng nhau: $accent(A B, ⃗) = accent(D' C', ⃗)$, v.v...
]
#tc-hd[
  - #strong[Thực hiện nhiệm vụ:] Học sinh đọc SGK và thảo luận cặp đôi
    để định nghĩa và áp dụng vào ví dụ.
  - #strong[Báo cáo, thảo luận:] Một học sinh trình bày khái niệm, một
    học sinh áp dụng vào ví dụ mô hình. GV nhận xét, chuẩn hóa kiến
    thức.

==== 2.2. Hoạt động thành phần 2.2: Tổng của hai vectơ trong không gian (Tiết 2 - 45 phút)
]
#mt-hd[
Nắm được quy tắc ba điểm, quy tắc hình bình hành
  (mở rộng trong không gian) và quy tắc hình hộp để tính tổng hai vectơ.
]
#nd-hd[
Học sinh làm việc nhóm 4, sử dụng mô hình (khối
  hộp) để thực hiện phép cộng và rút ra quy tắc.
  - #strong[Ví dụ minh họa:] Cho khối lập phương
    $A B C D . A' B' C' D'$. Tính tổng:
    $accent(A B, ⃗) + accent(A D, ⃗) + accent(A A', ⃗)$ bằng cách sử dụng
    quy tắc hình hộp.
]
#sp-hd[
Quy tắc ba điểm, quy tắc hình bình hành, quy tắc
  hình hộp; kết quả
  $accent(A B, ⃗) + accent(A D, ⃗) + accent(A A', ⃗) = accent(A C', ⃗)$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV giao bài tập ví dụ và yêu cầu nhóm thảo
    luận tìm quy tắc.
  - #strong[Báo cáo, thảo luận:] Các nhóm cử đại diện lên bảng vẽ hình
    và trình bày lời giải.
  - #strong[Kết luận, nhận định:] GV chính thức hóa các quy tắc.

==== 2.3. Hoạt động thành phần 2.3: Hiệu của hai vectơ trong không gian (Tiết 3 - 45 phút)
]
#mt-hd[
Nắm được quy tắc về hiệu hai vectơ
  ($accent(A B, ⃗) = accent(O B, ⃗) - accent(O A, ⃗)$).
]
#nd-hd[
Dựa trên kiến thức về tổng vectơ, học sinh tự
  suy luận ra quy tắc hiệu.
  - #strong[Ví dụ minh họa:] Cho bốn điểm $A\,B\,C\,D$ bất kỳ trong
    không gian. Chứng minh
    $accent(A B, ⃗) + accent(C D, ⃗) = accent(A D, ⃗) + accent(C B, ⃗)$. (Sử
    dụng quy tắc hiệu để biến đổi:
    $accent(A B, ⃗) = accent(A C, ⃗) + accent(C B, ⃗)$ hay
    $accent(A B, ⃗) = accent(O B, ⃗) - accent(O A, ⃗)$).
]
#sp-hd[
Công thức
  $accent(A B, ⃗) = accent(O B, ⃗) - accent(O A, ⃗)$\; chứng minh được đẳng
  thức vectơ.
]
#tc-hd[
  - #strong[Thực hiện nhiệm vụ:] Học sinh làm việc cá nhân, sau đó kiểm
    tra chéo kết quả với bạn bên cạnh.
  - #strong[Báo cáo, thảo luận:] GV mời một học sinh trình bày cách
    chứng minh đẳng thức.

==== 2.4. Hoạt động thành phần 2.4: Tích của một số với một vectơ trong không gian (Tiết 4 - 45 phút)
]
#mt-hd[
Nắm được định nghĩa và tính chất của phép nhân
  một số thực với một vectơ. Hiểu điều kiện để ba điểm thẳng hàng, bốn
  điểm đồng phẳng.
]
#nd-hd[
Học sinh đọc SGK và thảo luận về điều kiện để
  $arrow(b) = k dot.op arrow(a)$.
  - #strong[Ví dụ minh họa:] Cho hình chóp $S . A B C$. Gọi $I$ là trung
    điểm $A B$. $K$ là điểm trên $S C$ sao cho
    $accent(S K, ⃗) = 1 / 3 accent(S C, ⃗)$. Chứng minh rằng ba điểm
    $I\,C\,K$ #strong[không thẳng hàng] (dùng phương pháp biểu diễn
    vectơ).
]
#sp-hd[
Định nghĩa và tính chất của $k arrow(a)$\; điều
  kiện để hai vectơ cùng phương; biểu diễn vectơ chứng minh tính không
  thẳng hàng/không đồng phẳng.
]
#tc-hd[
  - #strong[Tích hợp Năng lực số:] GV yêu cầu học sinh dùng
    #strong[GeoGebra 3D] để vẽ hình chóp và các điểm $I\,K$, sau đó quan
    sát vị trí tương đối của ba điểm $I\,C\,K$ để dự đoán kết quả trước
    khi chứng minh.
  - #strong[Biểu hiện về Năng lực số:] #strong[Sử dụng các ứng dụng học
    tập và công cụ tìm kiếm, xử lí thông tin]: Học sinh sử dụng phần mềm
    GeoGebra 3D để tạo mô hình và trực quan hóa bài toán.

==== 2.5. Hoạt động thành phần 2.5: Góc giữa hai vectơ trong không gian (Tiết 5 - 45 phút)
]
#mt-hd[
Hình thành khái niệm góc giữa hai vectơ
  $arrow(u)$ và $arrow(v)$ trong không gian.
]
#nd-hd[
GV đặt vấn đề về cách xác định góc
  $(arrow(u) \, arrow(v))$ bằng cách đưa hai vectơ về chung gốc. Học
  sinh thảo luận và đưa ra định nghĩa.
  - #strong[Ví dụ minh họa:] Cho khối lập phương
    $A B C D . A' B' C' D'$. Tính góc giữa:
    - $accent(A B, ⃗)$ và $accent(A' D', ⃗)$ (Đáp án: $90^compose$)
    - $accent(A B, ⃗)$ và $accent(A' C', ⃗)$ (Đáp án: $45^compose$ - Góc
      giữa $accent(A B, ⃗)$ và $accent(D C, ⃗)$ là $90^compose$, góc giữa
      $accent(D C, ⃗)$ và $accent(A' C', ⃗)$ là $45^compose$). (Thực tế
      góc giữa $accent(A B, ⃗)$ và $accent(A' C', ⃗)$ bằng góc giữa
      $accent(D C, ⃗)$ và $accent(A' C', ⃗)$, là
      $accent(D C A', ̂) approx 65.9^compose$ do $Delta A' D C$ cân tại
      $A'$\... #emph[Lưu ý: GV cần chọn ví dụ dễ tính hơn hoặc giải
      thích kỹ lưỡng.] #strong[Ví dụ thay thế:] Tính góc giữa
      $accent(A D, ⃗)$ và $accent(B' C', ⃗)$ (Đáp án: $0^compose$).
]
#sp-hd[
Định nghĩa góc giữa hai vectơ trong không gian;
  kết quả tính toán góc của các cặp vectơ.
]
#tc-hd[
  - #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm, sử dụng mô
    hình để xác định góc.
  - #strong[Báo cáo, thảo luận:] Một nhóm trình bày cách xác định và
    tính toán cho ví dụ. GV hướng dẫn học sinh cách dời vectơ về chung
    gốc.

==== 2.6. Hoạt động thành phần 2.6: Tích vô hướng của hai vectơ trong không gian (Tiết 6 - 25 phút)
]
#mt-hd[
Nắm được định nghĩa tích vô hướng và điều kiện
  vuông góc của hai vectơ.
]
#nd-hd[
Học sinh áp dụng định nghĩa
  $arrow(u) dot.op arrow(v) =\|arrow(u)\|dot.op\|arrow(v)\|dot.op c o s (arrow(u) \, arrow(v))$.
  - #strong[Ví dụ minh họa:] Cho hình lập phương $A B C D . A' B' C' D'$
    có cạnh bằng $a$. Tính tích vô hướng
    $accent(A B', ⃗) dot.op accent(B C, ⃗)$.
]
#sp-hd[
Định nghĩa tích vô hướng; điều kiện
  $arrow(u) perp arrow(v) arrow.l.r.double arrow(u) dot.op arrow(v) = 0$\;
  kết quả tính toán:
  $accent(A B', ⃗) dot.op accent(B C, ⃗) =\(accent(A B, ⃗) + accent(B B', ⃗)\)dot.op accent(B C, ⃗) = accent(A B, ⃗) dot.op accent(B C, ⃗) + accent(B B', ⃗) dot.op accent(B C, ⃗) = 0 + 0 = 0$.
]
#tc-hd[
  - #strong[Thực hiện nhiệm vụ:] Học sinh làm việc cá nhân.
  - #strong[Báo cáo, thảo luận:] GV mời học sinh lên trình bày lời giải.
    GV nhấn mạnh điều kiện vuông góc.

]
#hd("3", "Luyện tập", "Tiết 6 - 20 phút")
#mt-hd[
Vận dụng kiến thức về các phép toán và tích vô
  hướng của vectơ để giải quyết các bài tập cơ bản và nâng cao kỹ năng
  tính toán.
]
#nd-hd[
Hệ thống bài tập đa dạng (tự luận ngắn, trắc
  nghiệm) củng cố cả 6 nội dung vừa học.
  - #strong[Ví dụ:]
    #block[
    #set enum(numbering: "i.", start: 1)
    + Cho tứ diện $A B C D$. Gọi $M\,N$ lần lượt là trung điểm
      $A D\,B C$. Tính $accent(M N, ⃗)$ theo $accent(A B, ⃗)$ và
      $accent(D C, ⃗)$. (Phép cộng/trừ)
    + Cho hình hộp $A B C D . A' B' C' D'$ có tất cả các cạnh bằng $1$
      và
      $accent(B A A', ̂) = accent(D A A', ̂) = accent(B A D, ̂) = 90^compose$.
      Tính $accent(B D, ⃗) dot.op accent(A' C', ⃗)$. (Tích vô hướng)
    ]
]
#sp-hd[
Đáp án, lời giải chi tiết của hệ thống bài tập.
]
#tc-hd[
  - #strong[Thực hiện nhiệm vụ:] GV giao bài tập, học sinh làm việc nhóm
    hoặc cá nhân.
  - #strong[Tổ chức thực hiện:] GV tổ chức #strong[Trò chơi học tập] (ví
    dụ: \"Tiếp sức\" hoặc \"Đố vui\") trên nền tảng số (Kahoot!/Quizizz)
    để tăng tính tương tác và đánh giá nhanh.
  - #strong[Biểu hiện về Năng lực số:] #strong[Sử dụng các ứng dụng học
    tập và công cụ tìm kiếm, xử lí thông tin]: Học sinh tham gia trò
    chơi trực tuyến để củng cố kiến thức và nhận phản hồi tức thì về kết
    quả.

]
#hd("4", "Vận dụng", "Giao về nhà và nộp báo cáo - 5 phút cuối Tiết 6")
#mt-hd[
Phát triển năng lực mô hình hóa, vận dụng kiến
  thức vectơ vào giải quyết các vấn đề thực tiễn.
]
#nd-hd[
Học sinh tìm kiếm, đề xuất và giải quyết một vấn
  đề thực tiễn liên quan đến vectơ trong không gian.
  - #strong[Ví dụ:] Mô hình hóa và tính toán hợp lực tác dụng lên một
    vật thể lơ lửng trong không gian (ví dụ: một chiếc đèn chùm treo bởi
    ba sợi dây). Hoặc, sử dụng vectơ để mô tả vị trí và hướng của một vệ
    tinh trong hệ tọa độ không gian.
]
#sp-hd[
Báo cáo (có thể là bài viết, video clip, hoặc mô
  hình kèm thuyết minh) trình bày cách phát hiện vấn đề, mô hình hóa
  bằng vectơ, và kết quả giải quyết.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV giao nhiệm vụ và hướng dẫn nguồn tài
    liệu.
  - #strong[Tích hợp Năng lực số:] GV khuyến khích học sinh sử dụng phần
    mềm đồ họa 3D (Blender, SketchUp, GeoGebra) hoặc công cụ chỉnh sửa
    video để tạo sản phẩm báo cáo trực quan. Yêu cầu nộp sản phẩm qua
    Google Drive/Zalo để chia sẻ.
  - #strong[Biểu hiện về Năng lực số:] #strong[Sáng tạo và tạo ra nội
    dung số]: Học sinh tạo báo cáo, mô hình 3D, hoặc video để trình bày
    sản phẩm, sử dụng các công cụ số để lưu trữ và chia sẻ sản phẩm.
  - #strong[Thời gian nộp:] Học sinh thực hiện ngoài giờ học và nộp báo
    cáo vào tuần học tiếp theo để GV tổ chức trao đổi, chia sẻ và đánh
    giá.

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
