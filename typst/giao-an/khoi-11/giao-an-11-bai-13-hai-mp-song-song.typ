// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 13 Hai MP song song",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm và nhận biết được hai mặt phẳng song song.
- Nắm được điều kiện để hai mặt phẳng song song và các tính chất của hai
  mặt phẳng song song (tính chất về giao tuyến, tính chất về đoạn thẳng
  song song bị chắn giữa hai mặt phẳng song song).
- Phát biểu và vận dụng được Định lí Thales trong không gian.
- Nhận dạng, nêu được tính chất và tính toán được các yếu tố cơ bản của
  hình lăng trụ và hình hộp.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến
    thức mới về hai mặt phẳng song song thông qua sách giáo khoa và học
    liệu số.
  - #strong[Năng lực giao tiếp và hợp tác:] Thảo luận, trình bày, bảo vệ
    ý kiến cá nhân/nhóm một cách rõ ràng, mạch lạc; hợp tác hiệu quả
    trong làm việc nhóm, phân công nhiệm vụ, hỗ trợ nhau hoàn thành
    nhiệm vụ học tập.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp
    thông tin, đưa ra giải pháp cho các vấn đề liên quan đến quan hệ
    song song trong không gian.
- #strong[Năng lực đặc thù môn học (Năng lực Tư duy và lập luận Toán
  học):] Hình thành được tư duy không gian; vận dụng linh hoạt kiến thức
  hình học phẳng và không gian để giải quyết các bài toán.
- #strong[Năng lực số (Theo Thông tư 02/2025/TT-BGDĐT):]
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
- #strong[Chăm chỉ:] Tích cực, chủ động tìm tòi, hoàn thành nhiệm vụ học
  tập được giao.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong nhóm, đóng góp ý kiến
  xây dựng bài học, bảo vệ sản phẩm của nhóm.
- #strong[Trung thực:] Trình bày kết quả đúng theo quá trình giải quyết
  vấn đề, tự giác, nghiêm túc trong kiểm tra, đánh giá.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, bảng/màn chiếu tương
  tác, mô hình vật thể hình học (hình lăng trụ, hình hộp) hoặc mô hình
  ứng dụng thực tế (nhà, hộp, cầu...).
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Bộ Kết nối tri thức với cuộc sống).
  - Phiếu học tập, giấy A0/A4, bút màu.
  - Tài liệu tham khảo/bài tập mở rộng liên quan đến ứng dụng trong thực
    tiễn (kiến trúc, xây dựng).
  - Phần mềm vẽ hình động GeoGebra 3D (Tích hợp #strong[Năng lực số]).
  - Các công cụ trực tuyến để thu thập ý kiến/làm bài kiểm tra nhanh (ví
    dụ: Google Forms, Quizizz).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
==== a) Mục tiêu
- Giúp học sinh (HS) xác định được vấn đề cần giải quyết: làm thế nào để
  xác định được hai mặt phẳng song song và vận dụng nó trong thực tiễn.
- Tạo hứng thú, khơi gợi kiến thức nền về quan hệ song song của đường
  thẳng và mặt phẳng.

==== b) Nội dung
- Giáo viên (GV) trình chiếu một hình ảnh/video về một công trình kiến
  trúc có nhiều chi tiết song song nhau (ví dụ: sàn nhà và trần nhà, các
  tầng lầu trong một tòa nhà cao tầng) hoặc hình ảnh một chiếc hộp
  carton. \* #strong[Nhiệm vụ:] HS quan sát hình ảnh và trả lời câu hỏi:
  Trong hình ảnh này, em thấy những cặp đối tượng nào có vẻ như song
  song với nhau? Từ đó, hãy đề xuất cách kiểm tra xem hai mặt phẳng có
  song song hay không.

==== c) Sản phẩm
- Kết quả xử lí tình huống: HS liệt kê được các cặp mặt phẳng song song
  (ví dụ: mặt sàn và mặt trần nhà).
- Đề xuất giải pháp ban đầu: HS đưa ra được các ý tưởng ban đầu (dựa vào
  kinh nghiệm, trực quan hoặc kiến thức cũ) về điều kiện để hai mặt
  phẳng song song.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ học tập (5 phút):] GV chiếu hình
  ảnh/video và nêu nhiệm vụ. Yêu cầu HS suy nghĩ cá nhân trong 1 phút.
- #strong[Bước 2: Thực hiện nhiệm vụ (5 phút):] HS thảo luận cặp đôi
  hoặc nhóm nhỏ (3-4 HS) để đưa ra câu trả lời và đề xuất.
- #strong[Bước 3: Báo cáo, thảo luận (3 phút):] GV gọi 1-2 nhóm trình
  bày ý kiến. Các nhóm khác nhận xét, bổ sung.
- #strong[Bước 4: Kết luận, nhận định (2 phút):] GV ghi nhận các ý kiến,
  nhấn mạnh vấn đề cần giải quyết trong bài học: \"Làm thế nào để xác
  định chính xác hai mặt phẳng song song? Nó có những tính chất gì? Và
  vận dụng nó vào việc nghiên cứu Hình lăng trụ, hình hộp như thế
  nào?\".

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "120 phút")
==== 2.1. Hoạt động thành phần 2.1: Khái niệm Hai mặt phẳng song song (25 phút)
===== a) Mục tiêu
- HS nắm được định nghĩa hai mặt phẳng song song.
- HS nhận biết được hai mặt phẳng song song thông qua hình vẽ và mô
  hình.

===== b) Nội dung
- #strong[Nhiệm vụ:] HS đọc SGK, thảo luận nhóm để rút ra định nghĩa hai
  mặt phẳng song song.
- #strong[Ví dụ minh họa:] Cho hình hộp $A B C D . A' B' C' D'$. Liệt kê
  các cặp mặt phẳng song song nhau trong hình hộp đó.

===== c) Sản phẩm
- HS viết được định nghĩa chính xác: Hai mặt phẳng $\(alpha\)$ và
  $\(beta\)$ được gọi là song song với nhau nếu chúng không có điểm
  chung. Kí hiệu $\(alpha\)\/\/\(beta\)$.
- HS liệt kê được các cặp mặt phẳng song song: $\(A B C D\)$ /\/
  $\(A' B' C' D'\)$, $\(A B B' A'\)$ /\/ $\(D C C' D'\)$,
  $\(A D D' A'\)$ /\/ $\(B C C' B'\)$.

===== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV yêu cầu HS làm việc nhóm
  (4 HS) tìm định nghĩa và thực hiện Ví dụ minh họa.
- #strong[Bước 2: Thực hiện nhiệm vụ (10 phút):] HS làm việc với SGK và
  thảo luận nhóm. #strong[Tích hợp năng lực số:] GV khuyến khích HS sử
  dụng GeoGebra 3D để tạo hình hộp và quan sát các mặt phẳng.
- #strong[Bước 3: Báo cáo, thảo luận (5 phút):] GV gọi đại diện 1 nhóm
  trình bày kết quả. GV sử dụng mô hình thực tế hoặc hình vẽ trên
  GeoGebra 3D để trực quan hóa khái niệm.
- #strong[Bước 4: Kết luận, nhận định (5 phút):] GV chốt lại định nghĩa
  và kí hiệu.

==== 2.2. Hoạt động thành phần 2.2: Điều kiện và Tính chất của hai mặt phẳng song song (35 phút)
===== a) Mục tiêu
- HS nắm vững điều kiện để hai mặt phẳng song song (Định lí 1).
- HS nắm vững các tính chất của hai mặt phẳng song song.

===== b) Nội dung
- #strong[Nhiệm vụ 1 (Điều kiện):] HS nghiên cứu SGK, thảo luận để phát
  biểu Định lí 1 (Điều kiện hai mặt phẳng song song). #strong[Kỹ thuật
  Sơ đồ tư duy:] HS vẽ sơ đồ tư duy tóm tắt Điều kiện hai mặt phẳng song
  song.
- #strong[Ví dụ 1:] Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình
  bình hành. Gọi $M\,N$ lần lượt là trung điểm của $S A\,S C$. Chứng
  minh mặt phẳng $\(B M D\)$ song song với mặt phẳng $\(A C N\)$. (Lưu
  ý: Ví dụ này cần điều chỉnh nếu chưa học Định lí Thales). (Thay bằng
  ví dụ đơn giản hơn)
  - #strong[Ví dụ 1 (Đơn giản):] Cho tứ diện $A B C D$. Gọi $I\,J\,K$
    lần lượt là trung điểm của $A B\,A C\,A D$. Chứng minh
    $\(I J K\)\/\/\(B C D\)$.
- #strong[Nhiệm vụ 2 (Tính chất):] HS nghiên cứu SGK, thảo luận để rút
  ra các Tính chất của hai mặt phẳng song song.
- #strong[Ví dụ 2:] Cho hai mặt phẳng song song $\(alpha\)$ và
  $\(beta\)$. Mặt phẳng $\(gamma\)$ cắt $\(alpha\)$ theo giao tuyến $a$.
  Chứng minh $\(gamma\)$ sẽ cắt $\(beta\)$ theo giao tuyến $b$ và
  $a\/\/b$.

===== c) Sản phẩm
- HS phát biểu đúng Định lí 1: Nếu mặt phẳng $\(alpha\)$ chứa hai đường
  thẳng cắt nhau $a$ và $b$ mà $a\/\/\(beta\)$ và $b\/\/\(beta\)$ thì
  $\(alpha\)\/\/\(beta\)$.
- Sơ đồ tư duy tóm tắt nội dung chính.
- Lời giải chính xác cho Ví dụ 1 và Ví dụ 2.

===== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV giao nhiệm vụ 1 và Ví dụ
  \1.
- #strong[Bước 2: Thực hiện nhiệm vụ (10 phút):] HS thảo luận nhóm (sử
  dụng sơ đồ tư duy). GV theo dõi, hỗ trợ, gợi ý (khuyến khích sử dụng
  phần mềm GeoGebra để kiểm tra tính song song).
- #strong[Bước 3: Báo cáo, thảo luận (5 phút):] GV mời 1-2 nhóm lên bảng
  trình bày Sơ đồ tư duy và lời giải Ví dụ 1.
- #strong[Bước 4: Giao nhiệm vụ và Thực hiện (10 phút):] GV giao nhiệm
  vụ 2 và Ví dụ 2 (chứng minh tính chất).
- #strong[Bước 5: Kết luận, nhận định (5 phút):] GV chốt kiến thức: Định
  lí 1, Tính chất 1 (Giao tuyến), Tính chất 2 (Đoạn thẳng song song bị
  chắn).

==== 2.3. Hoạt động thành phần 2.3: Định lí Thales trong không gian (30 phút)
===== a) Mục tiêu
- HS phát biểu đúng Định lí Thales trong không gian.
- HS vận dụng định lí để tính toán tỉ số độ dài đoạn thẳng.

===== b) Nội dung
- #strong[Trò chơi học tập (Tìm cặp tương ứng):] GV phát phiếu có nội
  dung Định lí Thales trong mặt phẳng và Định lí Thales trong không
  gian. HS so sánh, tìm điểm tương đồng và phát biểu Định lí Thales
  trong không gian.
- #strong[Ví dụ:] Cho hai mặt phẳng song song $\(alpha\)$ và $\(beta\)$.
  Đường thẳng $d$ cắt $\(alpha\)$ tại $A$ và cắt $\(beta\)$ tại $B$.
  Đường thẳng $d'$ cắt $\(alpha\)$ tại $A'$ và cắt $\(beta\)$ tại $B'$.
  $O$ là giao điểm của $d$ và $d'$. Tính tỉ số $O A\/O B$ theo
  $O A'\/O B'$. Từ đó suy ra tỉ số $A B\/A' B'$.

===== c) Sản phẩm
- HS phát biểu đúng Định lí Thales trong không gian.
- Lời giải Ví dụ: $O A\/O B = O A'\/O B'$. (Nếu $d\/\/d'$ thì
  $O A = A B$, $O A' = A' B'$).

===== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV tổ chức #strong[Trò chơi
  học tập] để HS khám phá Định lí Thales trong không gian.
- #strong[Bước 2: Thực hiện nhiệm vụ (10 phút):] HS làm việc cá nhân/cặp
  đôi để phát biểu định lí và giải ví dụ.
- #strong[Bước 3: Báo cáo, thảo luận (10 phút):] GV gọi HS trình bày kết
  quả, nhận xét. #strong[Tăng cường kĩ năng thuyết trình:] GV yêu cầu HS
  sử dụng máy chiếu để vẽ minh họa cho định lí.
- #strong[Bước 4: Kết luận, nhận định (5 phút):] GV chốt lại nội dung
  Định lí Thales, đặc biệt là trường hợp ba mặt phẳng song song chắn
  trên hai cát tuyến.

==== 2.4. Hoạt động thành phần 2.4: Hình lăng trụ và Hình hộp (30 phút)
===== a) Mục tiêu
- HS nắm được định nghĩa, tính chất của hình lăng trụ và hình hộp.
- HS tính được diện tích xung quanh, diện tích toàn phần, thể tích của
  hình lăng trụ/hình hộp (ôn lại kiến thức cũ, vận dụng kiến thức mới).

===== b) Nội dung
- #strong[Nhiệm vụ (Làm việc nhóm lớn):] GV giao cho 3 nhóm lớn:
  - #strong[Nhóm 1:] Nghiên cứu Định nghĩa và Tính chất của Hình lăng
    trụ.
  - #strong[Nhóm 2:] Nghiên cứu Định nghĩa và Tính chất của Hình hộp.
  - #strong[Nhóm 3:] Nghiên cứu Định nghĩa và Tính chất của Hình hộp chữ
    nhật, Hình lập phương.
- #strong[Ví dụ:] Cho hình hộp $A B C D . A' B' C' D'$ có
  $A B = 3\,A D = 4\,A A' = 5$. Tính độ dài đường chéo $A C'$. (Giả sử
  hình hộp đứng hoặc hình hộp chữ nhật để đơn giản tính toán).

===== c) Sản phẩm
- Báo cáo bằng sơ đồ tư duy hoặc bảng so sánh về định nghĩa, tính chất
  của các hình (lăng trụ, hộp, hộp chữ nhật, lập phương).
- Lời giải chính xác cho Ví dụ.

===== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV giao nhiệm vụ cho 3 nhóm.
- #strong[Bước 2: Thực hiện nhiệm vụ (15 phút):] HS thảo luận, chuẩn bị
  báo cáo (có thể dùng công cụ số để thiết kế sơ đồ tư duy nhanh).
- #strong[Bước 3: Báo cáo, thảo luận (5 phút):] GV mời đại diện các nhóm
  trình bày.
- #strong[Bước 4: Kết luận, nhận định (5 phút):] GV chốt lại kiến thức,
  nhấn mạnh mối liên hệ giữa các mặt song song trong hình lăng trụ/hình
  hộp.

#hd("3", "Luyện tập", "45 phút")
==== a) Mục tiêu
- Vận dụng kiến thức đã học để giải quyết các bài tập cơ bản, rèn luyện
  kĩ năng chứng minh hai mặt phẳng song song, xác định giao tuyến song
  song.
- Phát triển kĩ năng phân tích đề, vẽ hình và lập luận chặt chẽ.

==== b) Nội dung
- Hệ thống bài tập trắc nghiệm và tự luận (sử dụng phiếu học tập hoặc
  công cụ số).
- #strong[Bài tập 1 (Trắc nghiệm):] Chọn mệnh đề đúng/sai về điều kiện
  hai mặt phẳng song song.
- #strong[Bài tập 2 (Tự luận):] Cho hình chóp $S . A B C D$. Gọi
  $M\,N\,P$ lần lượt là trung điểm của $S A\,S B\,S C$. Chứng minh
  $\(M N P\)\/\/\(A B C\)$.
- #strong[Bài tập 3 (Tính toán):] Cho lăng trụ tam giác
  $A B C . A' B' C'$ có thể tích $V$. Tính thể tích hình chóp
  $A . B C C' B'$.

==== c) Sản phẩm
- Đáp án và lời giải chính xác của các bài tập.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV chiếu/phát phiếu Bài tập 1
  và 2. Yêu cầu HS làm việc cá nhân/cặp đôi.
- #strong[Bước 2: Thực hiện nhiệm vụ (25 phút):] HS giải bài tập.
  #strong[Tích hợp năng lực số:] GV có thể sử dụng Quizizz/Google Forms
  để HS trả lời nhanh Bài tập 1.
- #strong[Bước 3: Kiểm tra, đánh giá (15 phút):]
  - GV gọi HS lên bảng trình bày Bài tập 2 (phân tích và lập luận).
  - GV chữa Bài tập 1 và 3, nhấn mạnh các lỗi sai thường gặp.

#hd("4", "Vận dụng", "Không yêu cầu thời gian trên lớp")
==== a) Mục tiêu
- Phát triển năng lực vận dụng kiến thức, kĩ năng vào thực tiễn cuộc
  sống.

==== b) Nội dung
- #strong[Nhiệm vụ/Dự án nhỏ (Làm việc nhóm):]
  - #strong[Đề xuất:] Hãy tìm một ví dụ thực tế (kiến trúc, nội thất, đồ
    vật gia dụng...) có ứng dụng quan hệ hai mặt phẳng song song.
  - #strong[Yêu cầu:] Mô tả ví dụ đó, chỉ ra các cặp mặt phẳng song
    song. #strong[Tích hợp năng lực số:] Sử dụng điện thoại/máy ảnh để
    chụp ảnh, sau đó dùng phần mềm vẽ (Paint, PowerPoint, hoặc GeoGebra)
    để minh họa, đánh dấu các mặt phẳng song song.
- #strong[Yêu cầu:] Thiết kế mô hình 3D trên GeoGebra 3D của một hình
  hộp và giải thích cách tạo ra các mặt phẳng song song trong mô hình
  đó.

==== c) Sản phẩm
- Báo cáo dưới dạng bài trình bày (PowerPoint) hoặc video clip (có thể
  dùng công cụ số) về việc phát hiện và giải quyết tình huống/vấn đề
  trong thực tiễn.

==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ:] GV giao cho HS thực hiện ở nhà trong vòng 1
  tuần.
- #strong[Trao đổi, đánh giá:] GV thu thập báo cáo, có thể dành thời
  gian phù hợp (5-10 phút) vào đầu các buổi học tiếp theo để một vài
  nhóm trình bày, chia sẻ sản phẩm.

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

