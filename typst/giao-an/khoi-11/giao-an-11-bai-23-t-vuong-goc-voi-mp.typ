// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 23 ĐT vuông góc với MP",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được #strong[định nghĩa] đường thẳng vuông góc với mặt phẳng.
- Trình bày được #strong[tính chất] cơ bản: điều kiện để một đường thẳng
  vuông góc với một mặt phẳng.
- Nêu được #strong[liên hệ] giữa quan hệ song song và quan hệ vuông góc
  của đường thẳng và mặt phẳng (hai định lí liên quan đến mặt phẳng song
  song hoặc đường thẳng song song/vuông góc).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận toán học:] Phát hiện và giải
    quyết vấn đề bằng cách vận dụng định nghĩa, tính chất, định lí về
    đường thẳng vuông góc với mặt phẳng.
  - #strong[Năng lực mô hình hoá toán học:] Vận dụng kiến thức để giải
    quyết các bài toán thực tế có liên quan (ví dụ: dựng cột cờ, đường
    dây điện...).
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán:] Sử dụng
    thành thạo ê ke, thước kẻ, máy tính cầm tay, phần mềm hình học (như
    GeoGebra) để minh họa, kiểm chứng.
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động đọc sách giáo khoa,
    nghiên cứu tài liệu và hoàn thành nhiệm vụ học tập được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày, bảo vệ ý kiến của mình, tiếp thu ý kiến của người khác
    khi làm việc nhóm.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, chủ động tham gia các hoạt động học tập,
  hoàn thành các nhiệm vụ được giao.
- #strong[Trách nhiệm:] Có tinh thần trách nhiệm trong học tập, hợp tác
  nhóm, nghiêm túc, cẩn thận trong trình bày lời giải, báo cáo kết quả.
- #strong[Trung thực:] Trung thực trong làm bài tập, báo cáo kết quả
  thảo luận nhóm và các hoạt động học tập khác.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:]
  - Máy chiếu, máy tính có kết nối mạng, loa.
  - Phần mềm trình chiếu (PowerPoint), phần mềm hình học động (GeoGebra)
    để mô phỏng hình học không gian.
  - Mô hình trực quan: #strong[Khối hình hộp chữ nhật] hoặc #strong[mô
    hình cột cờ] (có thể sử dụng vật thật trong lớp học như cạnh bàn,
    góc tường...).
  - Phiếu học tập, Rubric đánh giá hoạt động nhóm.
- #strong[Học sinh:]
  - Sách giáo khoa Toán 11 (Tập 2 - Kết nối tri thức với cuộc sống).
  - Dụng cụ học tập (thước kẻ, compa, ê ke).
  - Điện thoại thông minh/máy tính bảng (nếu có) để truy cập GeoGebra
    hoặc Kahoot/Quizizz cho phần Luyện tập/Trò chơi.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
#strong[a) Mục tiêu:] Tạo hứng thú, huy động kiến thức liên quan về quan
hệ vuông góc trong mặt phẳng và xác định vấn đề cần giải quyết:
#strong[Làm thế nào để xác định được một đường thẳng vuông góc với một
mặt phẳng trong không gian?]

#strong[b) Nội dung:]

- #strong[Giáo viên] trình chiếu hình ảnh thực tế (hoặc sử dụng mô hình
  vật thật) về #strong[Cột cờ] đặt trên mặt sân/sàn nhà .
- #strong[Nhiệm vụ:]
  - Đặt câu hỏi gợi mở: \"Trong hình ảnh cột cờ, chúng ta có thể hình
    dung #strong[cột cờ] là đường thẳng $d$ và #strong[mặt sân] là mặt
    phẳng $\(P\)$. Bằng kinh nghiệm thực tế, các em nhận thấy cột cờ có
    mối quan hệ gì với mặt sân?\" (HS trả lời: Vuông góc).
  - Câu hỏi tiếp theo: \"Ở lớp 10, ta biết hai đường thẳng vuông góc khi
    góc giữa chúng bằng $90^compose$. Vậy để nói đường thẳng $d$ vuông
    góc với mặt phẳng $\(P\)$, theo các em, nó cần vuông góc với
    #strong[bao nhiêu] đường thẳng nằm trong $\(P\)$?\" (HS thảo luận,
    đưa ra dự đoán: 1, 2, 3 hay tất cả?).

#strong[c) Sản phẩm:]

- Kết quả thảo luận nhóm (2 phút): Dự đoán về số lượng đường thẳng trong
  mặt phẳng $\(P\)$ cần vuông góc với đường thẳng $d$ để $d perp\(P\)$.
- #strong[Vấn đề/Nhiệm vụ học tập:] Nghiên cứu định nghĩa, tính chất để
  trả lời chính xác câu hỏi: \"Điều kiện cần và đủ để một đường thẳng
  vuông góc với một mặt phẳng là gì?\"

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1: Chuyển giao nhiệm vụ (3 phút):] GV trình bày vấn đề
  thực tế, chia lớp thành các nhóm nhỏ (4-5 HS).
- #strong[Bước 2: Thực hiện nhiệm vụ (7 phút):] HS thảo luận, đưa ra dự
  đoán. #strong[\(Tích hợp NL số):] HS có thể sử dụng điện thoại để ghi
  lại ý kiến nhóm dưới dạng sơ đồ nhanh, hoặc tìm kiếm hình ảnh minh họa
  về quan hệ vuông góc.
- #strong[Bước 3: Báo cáo, thảo luận (3 phút):] Đại diện 2-3 nhóm trình
  bày dự đoán. GV nhận xét chung.
- #strong[Bước 4: Kết luận, nhận định (2 phút):] GV khái quát: Từ thực
  tiễn, cần tìm ra cơ sở Toán học chính xác, chuyển sang Hoạt động 2.

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "90 phút")
==== 2.1. Đường thẳng vuông góc với mặt phẳng (30 phút)
#strong[a) Mục tiêu:] Giúp học sinh nắm vững #strong[định nghĩa] và
#strong[điều kiện nhận biết] đường thẳng vuông góc với mặt phẳng (Định
lí 1).

#strong[b) Nội dung:]

- #strong[Nhiệm vụ 1:] HS đọc SGK mục 1 (Định nghĩa) và quan sát hình
  ảnh minh họa .

- #strong[Nhiệm vụ 2:] Thảo luận nhóm 4: #strong[Định lí 1 (Điều kiện để
  đường thẳng vuông góc với mặt phẳng).]

  - #strong[GV hướng dẫn/gợi ý:] Dùng mô hình (hoặc phần mềm GeoGebra)
    mô phỏng một đường thẳng $d$ vuông góc với hai đường thẳng cắt nhau
    $a$ và $b$ nằm trong mặt phẳng $\(P\)$. Sau đó, yêu cầu HS chứng
    minh $d$ vuông góc với một đường thẳng $c$ bất kỳ nằm trong $\(P\)$.
  - HS thực hiện nhiệm vụ, viết nội dung Định lí 1 theo ngôn ngữ của
    mình.

- #strong[Ví dụ minh họa 1 (GV chiếu và yêu cầu HS giải):] Cho hình chóp
  $S . A B C D$ có đáy $A B C D$ là hình vuông. Biết
  $S A perp\(A B C D\)$. Chứng minh rằng $S A$ vuông góc với đường chéo
  $B D$ của đáy. (Yêu cầu HS trình bày rõ ràng các bước dựa trên định
  nghĩa).

#strong[c) Sản phẩm:]

- Ghi nhớ và phát biểu được #strong[Định nghĩa]: $d perp\(P\)$ nếu $d$
  vuông góc với mọi đường thẳng nằm trong $\(P\)$.
- Phát biểu được #strong[Định lí 1 (Điều kiện)]: Nếu một đường thẳng $d$
  vuông góc với #strong[hai đường thẳng cắt nhau] $a$ và $b$ cùng nằm
  trong mặt phẳng $\(P\)$ thì $d perp\(P\)$.
- Lời giải của Ví dụ 1.

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV giao nhiệm vụ 1 và 2.
- #strong[Bước 2: Thực hiện nhiệm vụ (15 phút):] HS tự đọc, thảo luận
  nhóm. GV theo dõi, hỗ trợ (Dự kiến khó khăn: HS nhầm lẫn giữa Định
  nghĩa và Định lí 1). #strong[\(Tích hợp NL số):] HS sử dụng GeoGebra
  để vẽ mô hình hình chóp $S . A B C D$ và trực quan hóa quan hệ vuông
  góc $S A perp\(A B C D\)$.
- #strong[Bước 3: Báo cáo, thảo luận (7 phút):] Đại diện nhóm trình bày
  định lí, trình bày lời giải Ví dụ 1.
- #strong[Bước 4: Kết luận, nhận định (3 phút):] GV chốt kiến thức, nhấn
  mạnh tầm quan trọng của #strong[\"hai đường thẳng cắt nhau\"].

==== 2.2. Tính chất (30 phút)
#strong[a) Mục tiêu:] Giúp học sinh nắm vững #strong[Tính chất 1 (Duy
nhất)] và #strong[Tính chất 2 (Quan hệ song song giữa hai mặt phẳng
vuông góc với một đường thẳng)].

#strong[b) Nội dung:]

- #strong[Nhiệm vụ 1:] HS đọc SGK, thảo luận nhóm về #strong[Tính chất
  1]: Qua một điểm $O$ cho trước, có duy nhất một mặt phẳng $\(P\)$
  vuông góc với đường thẳng $d$ cho trước, và duy nhất một đường thẳng
  $a$ vuông góc với mặt phẳng $\(alpha\)$ cho trước.

- #strong[Nhiệm vụ 2 (Thực hành/Thảo luận): Tính chất 2.]

  - #strong[GV giao nhiệm vụ:] Cho hai mặt phẳng $\(P\)$ và $\(Q\)$ cùng
    vuông góc với đường thẳng $a$. Hãy dự đoán mối quan hệ giữa $\(P\)$
    và $\(Q\)$.
  - #strong[HS sử dụng mô hình/vật thật] (ví dụ: hai cuốn sách đặt vuông
    góc với một cây bút chì) hoặc #strong[GeoGebra] để trực quan hóa,
    đưa ra dự đoán và phát biểu chính xác Tính chất 2: #strong[Hai mặt
    phẳng phân biệt cùng vuông góc với một đường thẳng thì song song với
    nhau.]

- #strong[Ví dụ minh họa 2 (GV chiếu):] Cho hình lăng trụ tam giác
  $A B C . A' B' C'$ có $A A' perp\(A B C\)$. Chứng minh rằng
  $\(A' B' C'\)$ song song với $\(A B C\)$. (Yêu cầu HS vận dụng Tính
  chất 2 để giải thích).

#strong[c) Sản phẩm:]

- Phát biểu được #strong[Tính chất 1 và 2].
- Lời giải của Ví dụ 2.

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV giao nhiệm vụ đọc và thảo
  luận.
- #strong[Bước 2: Thực hiện nhiệm vụ (15 phút):] HS tự đọc, thảo luận
  nhóm, thực hành với mô hình. #strong[\(Tích hợp NL số):] HS sử dụng
  GeoGebra để minh họa lăng trụ và kiểm chứng trực quan
  $\(A' B' C'\)\/\/\(A B C\)$.
- #strong[Bước 3: Báo cáo, thảo luận (7 phút):] Đại diện nhóm báo cáo
  kết quả thảo luận, trình bày lời giải Ví dụ 2.
- #strong[Bước 4: Kết luận, nhận định (3 phút):] GV chốt Tính chất 1 và
  \2.

==== 2.3. Liên hệ giữa quan hệ song song và quan hệ vuông góc của đường thẳng và mặt phẳng (30 phút)
#strong[a) Mục tiêu:] Giúp học sinh nắm vững các mối liên hệ giữa song
song và vuông góc (Định lí 2, 3, 4) để giải quyết các bài toán phức tạp
hơn.

#strong[b) Nội dung:]

- #strong[Nhiệm vụ:] HS làm việc cá nhân và thảo luận cặp đôi để nghiên
  cứu và phát biểu 3 định lí về mối liên hệ (SGK mục 3):

  - #strong[Định lí 2:] Hai đường thẳng phân biệt cùng vuông góc với một
    mặt phẳng thì song song với nhau.
  - #strong[Định lí 3:] Một đường thẳng vuông góc với một trong hai mặt
    phẳng song song thì vuông góc với mặt phẳng còn lại.
  - #strong[Định lí 4:] Cho hai đường thẳng song song. Mặt phẳng nào
    vuông góc với đường thẳng này thì cũng vuông góc với đường thẳng
    kia.

- #strong[Ví dụ minh họa 3 (GV giao):] Cho hình chóp $S . A B C D$ có
  đáy $A B C D$ là hình vuông và $S A perp\(A B C D\)$. Lấy điểm $M$
  trên cạnh $A B$. Gọi $\(P\)$ là mặt phẳng đi qua $M$ và song song với
  $\(S A D\)$. Chứng minh rằng $\(P\)perp C D$ và $\(P\)$ vuông góc với
  đường thẳng $S A$.

#strong[c) Sản phẩm:]

- Phát biểu được Định lí 2, 3, 4.
- Lời giải chi tiết của Ví dụ 3, sử dụng các định lí vừa học.

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV giao nhiệm vụ nghiên cứu
  các định lí và giải Ví dụ 3.
- #strong[Bước 2: Thực hiện nhiệm vụ (15 phút):] HS nghiên cứu cá
  nhân/cặp đôi. GV theo dõi, gợi ý.
- #strong[Bước 3: Báo cáo, thảo luận (7 phút):] Đại diện HS lên bảng
  trình bày, sử dụng sơ đồ tư duy nhỏ để tổng hợp các định lí đã học.
- #strong[Bước 4: Kết luận, nhận định (3 phút):] GV hệ thống hóa kiến
  thức, nhấn mạnh cách chọn định lí phù hợp để giải quyết vấn đề.

#hd("3", "Luyện tập", "30 phút")
#strong[a) Mục tiêu:] Vận dụng kiến thức vừa học (Định nghĩa, Định lí 1,
2, 3, 4) để giải quyết các bài tập cơ bản, rèn luyện kĩ năng tính toán
và lập luận.

#strong[b) Nội dung:] Hệ thống bài tập đa dạng, tập trung vào các dạng:

- #strong[Bài tập 1 (Nhận biết):] Trò chơi #strong[\"Ai nhanh hơn\"] (sử
  dụng Kahoot/Quizizz) về Định nghĩa, Định lí 1 (Chọn đáp án đúng/Sai).
- #strong[Bài tập 2 (Vận dụng cơ bản):] Cho hình chóp $S . A B C$ có
  $S A perp\(A B C\)$ và $triangle.stroked.t A B C$ vuông tại $B$. Chứng
  minh $S B perp B C$. (Sử dụng Định lí 1).
- #strong[Bài tập 3 (Vận dụng nâng cao):] Cho hình lăng trụ đứng
  $A B C . A' B' C'$. Chứng minh rằng mặt phẳng $\(A B B' A'\)$ vuông
  góc với mặt phẳng $\(B C C' B'\)$. (Sử dụng định nghĩa và liên hệ song
  song/vuông góc).

#strong[c) Sản phẩm:]

- Đáp án nhanh và chính xác của các câu hỏi trắc nghiệm (Bài tập 1).
- Lời giải chi tiết của Bài tập 2 và 3.

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV giao 3 bài tập dưới dạng
  phiếu học tập/trò chơi.
- #strong[Bước 2: Thực hiện nhiệm vụ (15 phút):]
  - Bài 1: HS tham gia trò chơi trực tuyến.
  - Bài 2, 3: HS làm việc nhóm để giải quyết.
- #strong[Bước 3: Báo cáo, thảo luận (7 phút):] GV mời đại diện nhóm
  trình bày lời giải Bài 2, 3.
- #strong[Bước 4: Kết luận, nhận định (3 phút):] GV chốt kiến thức, đánh
  giá hoạt động luyện tập của học sinh.

#hd("4", "Vận dụng", "Không yêu cầu làm trong giờ học")
#strong[a) Mục tiêu:] Phát triển năng lực giải quyết vấn đề thực tiễn,
năng lực mô hình hóa toán học.

#strong[b) Nội dung:]

- #strong[Nhiệm vụ:] Tìm hiểu, phát hiện một vấn đề/tình huống thực tiễn
  có liên quan đến quan hệ #strong[Đường thẳng vuông góc với mặt phẳng]
  (ví dụ: Dựng cột nhà, thiết kế chân đèn giao thông, lắp đặt cáp
  treo,...) và vận dụng kiến thức đã học để giải thích/tính toán/đề xuất
  giải pháp.

#strong[c) Sản phẩm:] #strong[Báo cáo (có thể dưới dạng bài trình chiếu
hoặc video ngắn)] về vấn đề thực tiễn được phát hiện và giải quyết. Báo
cáo cần nêu rõ:

- Mô hình thực tế.
- Kiến thức Toán học được vận dụng.
- Giải pháp/kết quả giải quyết.

#strong[d) Tổ chức thực hiện:]

- #strong[Giao nhiệm vụ:] GV giao nhiệm vụ về nhà (thực hiện ngoài giờ
  học) theo nhóm.
- #strong[Thực hiện:] HS sử dụng công cụ tìm kiếm, phần mềm thiết kế để
  xây dựng báo cáo. #strong[\(Tích hợp NL số):] HS sử dụng công cụ số để
  tìm kiếm thông tin, tạo bài trình chiếu/video (Ví dụ: Canva,
  PowerPoint, CapCut) để trình bày sản phẩm (Biểu hiện: Sử dụng công cụ
  số để thu thập, xử lí, và trình bày thông tin).
- #strong[Đánh giá:] Nộp báo cáo vào tuần học tiếp theo. GV tổ chức trao
  đổi, chia sẻ và đánh giá vào thời điểm phù hợp.

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

