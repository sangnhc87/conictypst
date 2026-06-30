// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 11 Hai đường thẳng song song",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
=== Về kiến thức:
- Nêu được khái niệm và các vị trí tương đối của hai đường thẳng trong
  không gian (cắt nhau, song song, chéo nhau).
- Trình bày được định nghĩa và các tính chất cơ bản của hai đường thẳng
  song song trong không gian.
- Nhận biết được điều kiện để hai đường thẳng song song, vận dụng tính
  chất để giải các bài tập đơn giản.

=== Về năng lực:
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động, tích cực tìm hiểu kiến thức về
    vị trí tương đối và sự song song của hai đường thẳng.
  - #strong[Giao tiếp và hợp tác:] Thảo luận, trình bày, bảo vệ ý kiến
    của nhóm về các bài toán không gian; xây dựng sơ đồ tư duy tóm tắt
    kiến thức.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống, đề
    xuất giải pháp để xác định mối quan hệ giữa hai đường thẳng trong
    các mô hình thực tế và bài toán hình học.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận Toán học:] So sánh, phân tích
    các trường hợp vị trí tương đối; đưa ra lập luận chính xác khi chứng
    minh hai đường thẳng song song.
  - #strong[Năng lực mô hình hóa Toán học:] Mô hình hóa các cặp đường
    thẳng trong thực tiễn thành các hình ảnh trong không gian để xác
    định mối quan hệ.
  - #strong[Năng lực sử dụng công cụ, phương tiện học Toán (Tích hợp
    Năng lực số):] Sử dụng phần mềm hình học động #strong[GeoGebra]
    (biểu hiện của #strong[Năng lực số]: #emph[Sử dụng các công cụ và
    công nghệ số để tạo và chỉnh sửa nội dung số] theo Thông tư
    02/2025/TT-BGDĐT) để vẽ hình, quan sát và kiểm tra vị trí tương đối
    của hai đường thẳng.
- #strong[Năng lực số]
  - #emph[Sử dụng các công cụ và công nghệ số để tạo và chỉnh sửa nội
    dung số:] Sử dụng phần mềm hình học động #strong[GeoGebra] để vẽ
    hình, quan sát và kiểm tra vị trí tương đối của hai đường thẳng.
  - #emph[#strong[Sử dụng các công cụ và công nghệ số để tương tác, chia
    sẻ và hợp tác]] (sử dụng các công cụ trực tuyến như Google Docs/Zalo
    để chia sẻ sản phẩm thảo luận nhóm)

=== Về phẩm chất:
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  các nhiệm vụ được giao (cá nhân và nhóm).
- #strong[Trách nhiệm:] Có ý thức hợp tác trong nhóm, đóng góp ý kiến
  xây dựng bài học; nghiêm túc trong việc tự đánh giá và đánh giá đồng
  đẳng.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, phòng máy tính (hoặc
  điện thoại/máy tính bảng cá nhân có kết nối Internet), các mô hình
  hình học không gian (khối hộp, khối chóp).
- #strong[Học liệu:] Sách giáo khoa Toán 11 (Tập 1 - Kết nối tri thức
  với cuộc sống), phiếu học tập, giấy A0/bút dạ, phần mềm
  #strong[GeoGebra].

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "Khởi động")
#mt-hd[
Tạo hứng thú, giúp học sinh xác định được vấn đề
  cần giải quyết là \"Làm thế nào để xác định vị trí tương đối và chứng
  minh hai đường thẳng song song trong không gian?\".
]
#nd-hd[
  - Giáo viên (GV) chiếu hình ảnh hoặc trình chiếu một đoạn video ngắn
    về các vật thể trong không gian thực tế (ví dụ: các thanh sắt trên
    cầu, các cạnh của căn phòng, dây điện...).
  - GV đưa ra nhiệm vụ: #strong[\"Hãy tìm và chỉ ra các cặp đường thẳng
    trong hình ảnh/video có thể được xem là: cắt nhau, song song, và
    không cắt nhau cũng không song song.\"]
  - GV đặt câu hỏi gợi mở: #strong[\"Vậy, trong không gian, hai đường
    thẳng có thể có những vị trí tương đối nào? Vị trí \'không cắt nhau
    cũng không song song\' có tên gọi là gì?\"]
]
#sp-hd[
  - Câu trả lời của học sinh (HS) về các cặp đường thẳng trong mô hình
    thực tế.
  - Đề xuất về các vị trí tương đối có thể có của hai đường thẳng trong
    không gian.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình chiếu hình
    ảnh/video và nêu nhiệm vụ (2 phút).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận nhanh theo
    cặp/nhóm 4 người (5 phút). GV theo dõi, hỗ trợ, gợi ý nếu cần (ví
    dụ: đưa mô hình hộp lên và hỏi về các cạnh).
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 2-3 nhóm báo cáo, trình
    bày kết quả (5 phút).
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, dẫn dắt HS đến
    khái niệm \"chéo nhau\" và chốt lại #strong[vấn đề cần giải quyết]
    là đi sâu nghiên cứu và định nghĩa rõ ràng về các vị trí tương đối
    và điều kiện để hai đường thẳng song song trong không gian (3 phút).

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "90 phút - 3 hoạt động thành phần")
==== Hoạt động 2.1: Vị trí tương đối của hai đường thẳng (30 phút)
#mt-hd[
Giúp HS chiếm lĩnh kiến thức về các vị trí tương
  đối của hai đường thẳng trong không gian (cắt nhau, song song, chéo
  nhau) thông qua việc sử dụng công cụ số.
]
#nd-hd[
  - GV yêu cầu HS làm việc nhóm (4-6 người) với máy tính/điện thoại có
    cài đặt #strong[GeoGebra 3D].
  - #strong[Nhiệm vụ:] #strong[Sử dụng GeoGebra để vẽ và quan sát các
    cặp đường thẳng trong không gian, từ đó điền vào Phiếu học tập số
    1:]
    - Trường hợp 1: Vẽ hai đường thẳng cùng thuộc một mặt phẳng và có
      một điểm chung.
    - Trường hợp 2: Vẽ hai đường thẳng cùng thuộc một mặt phẳng và không
      có điểm chung.
    - Trường hợp 3: Vẽ hai đường thẳng không cùng thuộc một mặt phẳng
      (hai đường thẳng chéo nhau).
  - GV giao cho các nhóm vẽ, quan sát và thảo luận về định nghĩa, đặc
    điểm của từng trường hợp.
]
#sp-hd[
  - Các hình ảnh/mô hình 3D trên GeoGebra minh họa 3 vị trí tương đối.
  - Hoàn thành Phiếu học tập số 1, nêu được định nghĩa 3 vị trí tương
    đối (#strong[cắt nhau, song song, chéo nhau]).
  - #emph[Tích hợp Năng lực số:] #strong[Báo cáo sản phẩm dưới dạng file
    ảnh hoặc đường link GeoGebra] chia sẻ trong nhóm (Biểu hiện:
    #emph[Sử dụng các công cụ và công nghệ số để tương tác, chia sẻ và
    hợp tác]).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV hướng dẫn nhanh cách sử dụng
    GeoGebra 3D (nếu cần) và phát Phiếu học tập số 1. Yêu cầu nhóm sử
    dụng công cụ để thực hành (5 phút).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thực hành, thảo luận nhóm
    với GeoGebra (15 phút). GV đi lại quan sát, hỗ trợ kỹ thuật và gợi ý
    tập trung vào khái niệm #strong[đồng phẳng] và #strong[chéo nhau].
    - #emph[Dự kiến khó khăn:] HS lúng túng khi vẽ hình 3D. #emph[Biện
      pháp hỗ trợ:] GV đưa ra tọa độ điểm gợi ý hoặc cung cấp file
      GeoGebra mẫu.
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời 2 nhóm trình bày sản phẩm
    (hình vẽ GeoGebra) và báo cáo kết quả trên Phiếu học tập. Các nhóm
    khác đặt câu hỏi (5 phút).
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa kiến thức, đưa ra
    định nghĩa chính xác và ký hiệu (5 phút).

==== Hoạt động 2.2: Tính chất của hai đường thẳng song song (35 phút)
]
#mt-hd[
Giúp HS nắm vững các tính chất cơ bản của hai
  đường thẳng song song (Định lí 1, Định lí 2 và Hệ quả).
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] GV yêu cầu các nhóm đọc SGK và thảo luận để rút
    ra:
    - Nội dung của Định lí 1 (Về tính duy nhất của đường thẳng song
      song).
    - Nội dung của Định lí 2 (Về giao tuyến của ba mặt phẳng và tính
      chất song song).
  - #strong[Nhiệm vụ 2:] Mỗi nhóm lập một #strong[Sơ đồ tư duy (Mind
    Map)] (trên giấy A0 hoặc phần mềm Mind Map trực tuyến) tóm tắt về
    #strong[\"Đường thẳng song song\"] (gồm: Định nghĩa, Định lí 1, Định
    lí 2).
]
#sp-hd[
  - Các nhóm trình bày bằng lời về nội dung 2 định lí và hệ quả.
  - #strong[Sơ đồ tư duy] hoàn chỉnh về hai đường thẳng song song.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV phân công nhiệm vụ 1 và 2 (lập sơ
    đồ tư duy) cho các nhóm (2 phút).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc nhóm, phân tích SGK
    và tổng hợp thông tin để vẽ sơ đồ tư duy (20 phút). GV theo dõi, gợi
    ý cấu trúc sơ đồ và cách vận dụng Định lí 2.
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời 2-3 nhóm treo/chiếu sơ đồ
    tư duy và thuyết trình nội dung đã tổng hợp. Khuyến khích HS sử dụng
    Sơ đồ tư duy trực tuyến (Biểu hiện Năng lực số: #emph[Sử dụng các
    công cụ và công nghệ số để tương tác, chia sẻ và hợp tác]) (10
    phút).
  - #strong[Bước 4: Kết luận, nhận định:] GV chốt kiến thức, nhấn mạnh
    Định lí 2 là công cụ quan trọng để tìm giao tuyến song song (3
    phút).

==== Hoạt động 2.3: Ví dụ vận dụng Định lí (25 phút)
]
#mt-hd[
Giúp HS vận dụng trực tiếp các tính chất vừa học
  để giải quyết các ví dụ cơ bản.
]
#nd-hd[
  - GV đưa ra các ví dụ cụ thể, chia thành các dạng:
    - #strong[Ví dụ 1 (Áp dụng Định lí 1):] Cho hình chóp $S . A B C D$
      có đáy $A B C D$ là hình bình hành. $M$ là trung điểm $S A$. Chứng
      minh đường thẳng qua $M$ song song với $A D$ và $B C$ nằm trong
      mặt phẳng $\(S B C\)$ là duy nhất.
    - #strong[Ví dụ 2 (Áp dụng Định lí 2):] Cho hình chóp $S . A B C D$
      có đáy $A B C D$ là hình thang ($A B\/\/C D$). $I\,J$ lần lượt là
      trung điểm của $A D$ và $B C$. Tìm giao tuyến của mặt phẳng
      $\(S I J\)$ và mặt phẳng $\(S C D\)$.
]
#sp-hd[
  - Lời giải chính xác và trình bày có lập luận cho hai ví dụ trên.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giao 2 ví dụ cho HS thực hiện cá
    nhân trong 5 phút. Sau đó giao nhiệm vụ thảo luận nhóm để kiểm tra
    chéo (5 phút).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc cá nhân, sau đó
    thảo luận nhóm (10 phút).
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời 2 HS lên bảng trình bày lời
    giải. GV khuyến khích HS sử dụng công cụ chiếu để vẽ hình minh họa
    (5 phút).
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, đánh giá lời
    giải, củng cố lại cách trình bày bài giải hình học không gian (5
    phút).

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
Vận dụng kiến thức vừa học để giải quyết các bài
  tập đa dạng, củng cố kỹ năng xác định vị trí tương đối và chứng minh
  đường thẳng song song.
]
#nd-hd[
  - GV sử dụng công cụ Quizizz/Google Forms để tổ chức trò chơi trả lời
    nhanh (Trắc nghiệm củng cố lý thuyết).
  - #strong[Bài tập tự luận ngắn (Luyện tập kỹ năng):] Cho tứ diện
    $A B C D$. Gọi $M\,N\,P$ lần lượt là trung điểm của $A B\,A C\,A D$.
    - a) Chứng minh $M N\/\/B C$.
    - b) Chứng minh $M P\/\/B D$.
    - c) Chứng minh $N P\/\/C D$.
]
#sp-hd[
  - Đáp án chính xác cho các câu trắc nghiệm.
  - Lời giải, chứng minh có lập luận logic cho bài tập tự luận.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV tổ chức trò chơi trắc nghiệm (5
    phút). Sau đó giao bài tập tự luận (2 phút).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm bài tập cá nhân/thảo
    luận nhanh theo cặp (5 phút).
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 2-3 HS trình bày kết quả
    trò chơi trắc nghiệm và lời giải bài tập tự luận (3 phút).
  - #strong[Bước 4: Kết luận, nhận định:] GV tổng kết, khen ngợi và đưa
    ra nhận xét chung về kết quả luyện tập.

]
#hd("4", "Vận dụng", "15 phút")
#mt-hd[
Phát triển năng lực HS thông qua việc vận dụng
  kiến thức, kĩ năng vào giải quyết vấn đề thực tiễn (theo nhóm).
]
#nd-hd[
  - #strong[Nhiệm vụ (Dự án nhỏ):] #strong[\"Thiết kế mô hình ứng
    dụng\"]
  - Yêu cầu HS quan sát và chụp ảnh các vật thể xung quanh (tại nhà,
    trong sân trường,...) có các cặp đường thẳng #strong[song song] và
    #strong[chéo nhau].
  - Sử dụng hình ảnh thực tế và phần mềm đồ họa/văn bản (ví dụ: Google
    Slides, Power Point, Canva) để tạo một #strong[báo cáo/slide trình
    chiếu] tóm tắt về: Tình huống thực tế, vị trí tương đối của các cặp
    đường thẳng trong mô hình đó, và giải thích vì sao chúng song
    song/chéo nhau (sử dụng kiến thức đã học).
]
#sp-hd[
  - Báo cáo/Slide trình chiếu (file mềm) về ứng dụng của hai đường thẳng
    song song/chéo nhau trong thực tiễn.
  - #emph[Tích hợp Năng lực số:] #strong[Sản phẩm là file mềm được thiết
    kế bằng công cụ số] (Biểu hiện: #emph[Sử dụng các công cụ và công
    nghệ số để tạo và chỉnh sửa nội dung số]).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giao nhiệm vụ, hướng dẫn rõ yêu
    cầu về hình thức và nội dung báo cáo (5 phút). Nhấn mạnh đây là
    nhiệm vụ thực hiện #strong[ngoài giờ học trên lớp].
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thực hiện ngoài giờ học.
  - #strong[Bước 3: Báo cáo, thảo luận:] (Sẽ thực hiện vào tiết học tiếp
    theo/buổi sinh hoạt lớp). Các nhóm nộp báo cáo qua kênh trực tuyến
    (Google Drive/Zalo nhóm).
  - #strong[Bước 4: Kết luận, nhận định:] GV thu thập và đánh giá sản
    phẩm ở tiết học sau.

#figure(
  align(center)[#table(
    columns: (33.18%, 46.97%),
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
