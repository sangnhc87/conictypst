// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 14 Phép chiếu song song",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
==== Về kiến thức:
- Nêu được định nghĩa và kí hiệu của phép chiếu song song.
- Nêu được các tính chất cơ bản của phép chiếu song song (biến đường
  thẳng thành đường thẳng/tia/đoạn thẳng; giữ nguyên quan hệ song song;
  giữ nguyên tỉ số độ dài).
- Trình bày được khái niệm hình biểu diễn của một hình trong không gian
  trên mặt phẳng.
- Xác định được hình biểu diễn thông thường của một số hình cơ bản trong
  không gian (tam giác, hình bình hành, hình thang, hình tròn).

==== Về năng lực:
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động hoàn thành các nhiệm vụ
    học tập được giao (đọc sách giáo khoa, thực hiện bài tập).
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày ý kiến rõ ràng, lắng nghe và phản biện một cách xây dựng
    trong các hoạt động.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận Toán học:] Phân tích, so sánh
    các khái niệm và tính chất của phép chiếu song song.
  - #strong[Năng lực mô hình hóa Toán học:] Vận dụng phép chiếu song
    song để mô hình hóa, biểu diễn các vật thể trong không gian (như
    hình lập phương, hình hộp) thành các hình phẳng.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

==== Về phẩm chất:
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động cá nhân và nhóm,
  hoàn thành nhiệm vụ học tập.
- #strong[Trung thực:] Trình bày kết quả nghiên cứu và làm việc nhóm một
  cách khách quan, trung thực.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong nhóm, đóng góp ý kiến
  xây dựng để hoàn thành nhiệm vụ chung.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, phiếu học tập (in
  sẵn), thước kẻ, ê ke, compa.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Kết nối tri thức với cuộc sống).
  - Một số mô hình hình học không gian đơn giản (hình lập phương, hình
    hộp).
  - Tài liệu/Hình ảnh minh họa về phép chiếu song song trong thực tế
    (bóng của vật thể dưới ánh sáng mặt trời) (dạng file ảnh/video).
  - Phần mềm/Ứng dụng hỗ trợ vẽ hình phẳng và không gian (ví dụ:
    GeoGebra 3D).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "10 phút")
#mt-hd[
Tạo hứng thú, giúp học sinh xác định được vấn đề
  thực tế về việc biểu diễn vật thể không gian lên mặt phẳng (mặt giấy,
  màn hình) và kết nối với kiến thức đã học.
]
#nd-hd[
  - Giáo viên (GV) đưa ra một tình huống thực tiễn: Khi ánh sáng mặt
    trời chiếu vào một vật thể (ví dụ: một cây cột), bóng của nó trên
    mặt đất có hình dạng như thế nào?
  - GV chiếu hình ảnh #strong[bóng của vật thể] lên tường/sàn nhà .
  - GV đặt câu hỏi gợi mở: Làm thế nào để \"vẽ\" được hình ảnh của một
    vật thể 3 chiều lên một mặt phẳng 2 chiều như mặt giấy hoặc màn
    hình? Phép biến hình nào có thể thực hiện điều này?
  - #strong[Nhiệm vụ học tập:] Thảo luận cặp đôi để trả lời câu hỏi và
    đưa ra dự đoán về khái niệm sẽ học.
]
#sp-hd[
Câu trả lời của học sinh (HS) về sự khác biệt
  giữa vật thể 3D và hình ảnh 2D; dự đoán về tên gọi của phương pháp
  biểu diễn.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV chiếu tình huống, đặt câu hỏi, yêu cầu HS
    thảo luận (2 phút).
  - #strong[Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ trợ):] HS
    thảo luận, ghi nhanh ý kiến.
  - #strong[Báo cáo, thảo luận:] GV mời 2-3 cặp đôi báo cáo. GV nhận
    xét, dẫn dắt: \"Để biểu diễn một vật thể 3D lên mặt phẳng 2D, người
    ta dùng một phép biến hình gọi là #strong[Phép chiếu song song]\.\"
  - #strong[Kết luận, nhận định:] GV chốt vấn đề cần giải quyết:
    #strong[Tìm hiểu định nghĩa, tính chất và cách dùng phép chiếu song
    song để biểu diễn hình trong không gian.]

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "60 phút")
- #strong[Tên thể hiện kết quả hoạt động:] #strong[Khám phá định nghĩa
  và tính chất của Phép chiếu song song]
- #strong[Phương pháp:] Dạy học hợp tác (chia nhóm), Đặt và giải quyết
  vấn đề, Phương pháp trực quan.
- #strong[Nhiệm vụ chung:] Học sinh tự nghiên cứu SGK, thảo luận nhóm để
  chiếm lĩnh kiến thức, sau đó trình bày sản phẩm bằng Sơ đồ tư duy
  (Tích hợp NL số: Sử dụng công cụ số để thiết kế Sơ đồ tư duy nếu có
  điều kiện, hoặc trình bày trên giấy A0/Phiếu học tập).

===== Hoạt động thành phần 2.1: Khám phá Phép chiếu song song (15 phút)
#mt-hd[
Nêu được định nghĩa và kí hiệu của phép chiếu
  song song.
]
#nd-hd[
  - #strong[Nhiệm vụ:] HS nghiên cứu mục #strong[\1. Phép chiếu song
    song] trong SGK.
  - HS vẽ hình minh họa, thảo luận nhóm để trả lời các câu hỏi: Phép
    chiếu song song được xác định bởi những yếu tố nào? Thế nào là hình
    chiếu song song của một hình?
  - #strong[Ví dụ minh họa:] GV yêu cầu HS sử dụng mô hình hình lập
    phương và một nguồn sáng (giả lập đường chiếu) để xác định bóng
    (hình chiếu) của một cạnh/mặt của hình lập phương lên mặt bàn (mặt
    phẳng chiếu). \* #strong[c) Sản phẩm:] Định nghĩa và kí hiệu của
    phép chiếu song song, hình vẽ minh họa.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV chia lớp thành 4 nhóm, giao nhiệm vụ và
    phiếu học tập.
  - #strong[Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ trợ):] HS
    đọc SGK, thảo luận. GV đi quanh các nhóm, hỗ trợ nếu cần.
  - #strong[Báo cáo, thảo luận:] Mời 1 nhóm báo cáo (trình bày trực tiếp
    hoặc bằng máy chiếu). Các nhóm khác nhận xét, bổ sung.
  - #strong[Kết luận, nhận định:] GV chốt kiến thức: Định nghĩa, mặt
    phẳng chiếu $\(P\)$, phương chiếu $l$, kí hiệu $P_l$.

===== Hoạt động thành phần 2.2: Khám phá Tính chất của phép chiếu song song (20 phút)
]
#mt-hd[
Nêu và chứng minh được các tính chất cơ bản của
  phép chiếu song song.
]
#nd-hd[
  - #strong[Nhiệm vụ:] HS nghiên cứu mục #strong[\2. Tính chất của phép
    chiếu song song] trong SGK.
  - HS thảo luận nhóm, tìm hiểu và phân tích 3 tính chất.
  - #strong[Ví dụ minh họa:] GV đặt câu hỏi #strong[\"Đúng hay Sai?\"]
    - \"Hình chiếu song song của một tam giác luôn là một tam giác.\"
      (Đúng/Sai? Tại sao?)
    - \"Phép chiếu song song có bảo toàn tỉ số độ dài của hai đoạn thẳng
      nằm trên hai đường thẳng song song không?\"
  - GV yêu cầu HS sử dụng phần mềm #strong[GeoGebra 3D] (hoặc hình vẽ
    tay) để minh họa tính chất 2 (bảo toàn quan hệ song song) và tính
    chất 3 (bảo toàn tỉ số độ dài).
  - #emph[#strong[Tích hợp NL Số:]] #strong[NL1.2] - HS sử dụng máy
    tính/điện thoại (nếu có) để truy cập và xem hình ảnh mô phỏng trên
    GeoGebra do GV chuẩn bị hoặc tự vẽ, nhằm kiểm chứng các tính chất.
]
#sp-hd[
Liệt kê và giải thích 3 tính chất (Sơ đồ tư
  duy/Phiếu học tập).
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV yêu cầu các nhóm tiếp tục nhiệm vụ, tập
    trung vào 3 tính chất.
  - #strong[Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ trợ):] HS
    thảo luận, ghi nhận các tính chất. GV chiếu hình minh họa/mô phỏng.
  - #strong[Báo cáo, thảo luận:] Mời 1 nhóm lên trình bày, khuyến khích
    sử dụng #strong[Sơ đồ tư duy] để tổng hợp kiến thức. Các nhóm khác
    đặt câu hỏi, phản biện (tăng cường kĩ năng giao tiếp, thuyết trình).
  - #strong[Kết luận, nhận định:] GV chốt 3 tính chất, nhấn mạnh các
    trường hợp đặc biệt (hình chiếu của đường thẳng/đoạn thẳng).

===== Hoạt động thành phần 2.3: Hình biểu diễn của một hình trong không gian (25 phút)
]
#mt-hd[
Nêu được khái niệm hình biểu diễn và xác định
  được hình biểu diễn thông thường của một số hình cơ bản.
]
#nd-hd[
  - #strong[Nhiệm vụ:] HS nghiên cứu mục #strong[\3. Hình biểu diễn của
    một hình trong không gian] trong SGK.
  - Thảo luận nhóm: Hình biểu diễn là gì? Nêu các quy tắc vẽ hình biểu
    diễn của các hình cơ bản (tam giác, hình bình hành, hình thang,
    đường tròn).
  - #strong[Trò chơi học tập (Đố nhanh):] GV chiếu hình biểu diễn và yêu
    cầu HS gọi tên hình không gian gốc (hoặc ngược lại).
  - #strong[Ví dụ minh họa:] Cho hình lập phương
    $A B C D . A' B' C' D'$. Hỏi hình biểu diễn của mặt đáy $A B C D$ là
    hình gì? (Là hình bình hành). Hình biểu diễn của
    $triangle.stroked.t A C D'$ là hình gì? (Là tam giác).
  - #strong[Tích hợp NL Số:] HS tìm kiếm trên Internet các hình ảnh khác
    nhau về hình biểu diễn của khối lập phương hoặc khối lăng trụ, sau
    đó so sánh các hình đó (nguồn gốc, quy tắc vẽ) để nhận thấy sự đa
    dạng của hình biểu diễn.
]
#sp-hd[
Khái niệm hình biểu diễn, danh sách các quy tắc
  vẽ hình biểu diễn cơ bản (Sơ đồ tư duy/Bảng tổng hợp).
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV đặt câu hỏi, yêu cầu HS hoàn thành nốt
    nhiệm vụ (tổng hợp quy tắc vẽ hình biểu diễn).
  - #strong[Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ trợ):] HS
    đọc SGK, thảo luận, tham gia trò chơi.
  - #strong[Báo cáo, thảo luận:] Mời 1 nhóm trình bày các quy tắc vẽ. GV
    tổ chức trò chơi \"Đố nhanh\" để kiểm tra nhanh.
  - #strong[Kết luận, nhận định:] GV chốt 3 quy tắc cơ bản: (1) Đường
    song song được biểu diễn bằng đường song song. (2) Tỉ số độ dài được
    bảo toàn. (3) Đường thẳng cắt nhau được biểu diễn bằng đường thẳng
    cắt nhau.

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
Vận dụng kiến thức đã học (định nghĩa, tính
  chất) để giải quyết các bài tập cơ bản, phát triển kĩ năng vận dụng
  kiến thức.
]
#nd-hd[
Hệ thống các bài tập trắc nghiệm và tự luận
  ngắn.
  - #strong[Bài tập 1 (Trắc nghiệm):] Trong các mệnh đề sau, mệnh đề nào
    SAI?
    - A. Hình chiếu song song của một đường thẳng là một đường thẳng.
    - B. Hình chiếu song song của hai đường thẳng song song là hai đường
      thẳng song song (hoặc trùng nhau).
    - C. Tỉ số độ dài của hai đoạn thẳng nằm trên hai đường thẳng song
      song được bảo toàn.
    - D. Hình chiếu song song của một tam giác luôn là một tam giác. (Đề
      xuất phương án D là sai, trừ trường hợp đặc biệt).
  - #strong[Bài tập 2 (Tự luận):] Cho hình hộp $A B C D . A' B' C' D'$.
    Gọi $M$ là trung điểm của $C C'$. Vẽ hình chiếu song song của đoạn
    $A M$ lên mặt phẳng $\(A B C D\)$ theo phương chiếu $C' C$.
]
#sp-hd[
Đáp án và lời giải của các câu hỏi, bài tập.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV chiếu các bài tập, yêu cầu HS làm bài cá
    nhân (3 phút), sau đó thảo luận nhóm kiểm tra chéo (3 phút).
  - #strong[Thực hiện nhiệm vụ:] HS làm bài cá nhân và nhóm. GV quan
    sát.
  - #strong[Báo cáo, thảo luận:] GV mời 2-3 HS lên bảng/sử dụng máy
    chiếu để trình bày lời giải. GV khuyến khích HS sử dụng cách giải
    khác.
  - #strong[Kiểm tra, đánh giá:] GV nhận xét, đánh giá kết quả, chú
    trọng việc HS sử dụng đúng các tính chất và quy tắc vẽ hình biểu
    diễn.

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
Phát triển năng lực mô hình hóa Toán học và năng
  lực giải quyết vấn đề thực tiễn thông qua việc vận dụng kiến thức về
  phép chiếu song song.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Tìm hiểu và đề xuất cách thức mà #strong[kĩ thuật
    vẽ phối cảnh] (perspective drawing) trong hội họa hoặc #strong[đồ
    họa máy tính] (computer graphics) có liên quan đến phép chiếu song
    song.
  - #strong[Tình huống thực tiễn:] Làm thế nào các kiến trúc sư hoặc các
    nhà thiết kế game sử dụng phép chiếu song song để tạo ra hình ảnh 3D
    trên màn hình 2D? (Gợi ý về phép chiếu trực giao và phép chiếu
    xiên).
  - #strong[Yêu cầu:] HS ghi lại tóm tắt phát hiện của mình về ứng dụng
    của phép chiếu song song vào thực tiễn/công nghệ.
]
#sp-hd[
Bài thu hoạch ngắn (khoảng 5 dòng) về ứng dụng
  của phép chiếu song song (hoặc một mô hình tương tự) trong kiến
  trúc/hội họa/đồ họa máy tính.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV giao nhiệm vụ cho HS thực hiện ngoài giờ
    học trên lớp (sau tiết học này).
  - #strong[Nộp báo cáo:] Báo cáo được nộp (dạng file văn bản hoặc hình
    ảnh) qua hệ thống học tập trực tuyến (Zalo/Google Classroom -
    #emph[#strong[Tích hợp NL Số:]] #strong[NL1.2]), và GV sẽ trao đổi,
    đánh giá vào buổi học tiếp theo.

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
