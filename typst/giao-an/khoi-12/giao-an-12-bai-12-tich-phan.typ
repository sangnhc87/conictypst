// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 12 Tích phân",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[tích phân] của hàm số liên tục trên một
  đoạn $\[a\;b\]$.
- Nêu được ý nghĩa hình học của tích phân (diện tích hình thang cong).
- Trình bày được các #strong[tính chất cơ bản] của tích phân.
- Vận dụng được công thức Newton - Leibniz để tính tích phân.
- Áp dụng được phương pháp đổi biến số và phương pháp tích phân từng
  phần để tính tích phân (Tiết 3 và 4).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm tòi, nghiên cứu tài
    liệu, thực hiện nhiệm vụ học tập được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày, bảo vệ ý kiến của mình và lắng nghe, phản biện ý kiến của
    bạn một cách có xây dựng.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống thực tế, đề xuất các phương pháp giải quyết vấn đề liên quan
    đến tích phân.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Nhận biết, chứng minh
    và vận dụng các tính chất của tích phân.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các bài toán
    thực tiễn (ví dụ: tính diện tích, quãng đường) bằng khái niệm tích
    phân.
  - #strong[Năng lực công cụ và phương tiện toán học:] Sử dụng thành
    thạo máy tính cầm tay (MTCT) để kiểm tra, tính toán tích phân và các
    #strong[phần mềm mô phỏng] (Geogebra, Desmos) để minh họa khái niệm.
- #strong[Năng lực số:]
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, tự giác trong việc hoàn thành các nhiệm
  vụ học tập.
- #strong[Trung thực:] Trung thực trong việc báo cáo kết quả thực hiện
  nhiệm vụ, không gian lận trong học tập.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ của bản thân và
  nhiệm vụ chung của nhóm, nghiêm túc tiếp thu ý kiến phản hồi của bạn
  bè và giáo viên.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối mạng, loa,
  bảng/bảng phụ.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập (có in sẵn các bài tập, câu hỏi thảo luận).
  - MTCT (Casio fx-580VN X hoặc tương đương).
  - #strong[Phần mềm mô phỏng:] Geogebra/Desmos (dùng để minh họa Diện
    tích hình thang cong).
  - Video/hình ảnh minh họa ứng dụng của tích phân trong thực tế (Ví dụ:
    tính thể tích vật thể, công).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
- #strong[Tên hoạt động:] #strong[Khơi gợi và Hình thành nhu cầu tính
  toán.]

==== a) Mục tiêu
- Giúp học sinh #strong[xác định vấn đề] cần giải quyết: Làm thế nào để
  tính diện tích của một hình phẳng có biên là đường cong (hình thang
  cong).
- Khơi gợi nhu cầu tìm kiếm một công cụ toán học mới (Tích phân) để giải
  quyết vấn đề này.

==== b) Nội dung
- #strong[Giáo viên (GV)] đưa ra #strong[tình huống thực tiễn] liên quan
  đến việc tính diện tích hoặc lượng biến thiên.
- #strong[Ví dụ đề xuất:] Một kĩ sư muốn tính diện tích của một bản kim
  loại được giới hạn bởi đồ thị hàm số $y = x^2 + 1$, trục hoành, đường
  thẳng $x = 1$ và $x = 3$. Đây là một #strong[hình thang cong]. Nếu chỉ
  dùng công thức diện tích đã học (hình vuông, chữ nhật, tam giác) thì
  không thể tính được chính xác.
- #strong[Nhiệm vụ:]
  - #strong[Thảo luận nhóm 4:] Nhận dạng hình cần tính diện tích.
  - #strong[Đề xuất:] Làm thế nào để ước lượng/tính chính xác diện tích
    hình này? (GV gợi ý: Dùng hình chữ nhật để xấp xỉ).

==== c) Sản phẩm
- #strong[Nhận định:] Hình phẳng cần tính không phải là hình cơ bản, cần
  một công cụ toán học mới.
- #strong[Đề xuất:] Có thể chia nhỏ hình thành các hình chữ nhật để xấp
  xỉ (ý tưởng về #strong[tổng Riemann]).
- #strong[Kết nối:] Từ đó, học sinh nhận ra cần tìm kiếm một định
  nghĩa/công cụ mới để tính toán.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Chuyển giao nhiệm vụ (5 phút):] GV chiếu hình ảnh bản
  kim loại (hình thang cong) và đặt câu hỏi. GV giao nhiệm vụ thảo luận
  nhóm.
- #strong[Bước 2: Thực hiện nhiệm vụ (5 phút):] Học sinh thảo luận nhóm,
  ghi chép nhanh ý tưởng xấp xỉ bằng hình chữ nhật. GV quan sát, khuyến
  khích học sinh dùng từ \"xấp xỉ\".
- #strong[Bước 3: Báo cáo, thảo luận (3 phút):] Đại diện 1-2 nhóm trình
  bày ý tưởng xấp xỉ. GV nhận xét, khen ngợi tính sáng tạo.
- #strong[Bước 4: Kết luận, nhận định (2 phút):] GV khẳng định: Để tính
  #emph[chính xác] diện tích hình thang cong, cần một khái niệm mới là
  #strong[Tích phân]. (Kết nối với Hoạt động 2).

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "130 phút")
- #strong[Tên hoạt động:] #strong[Khái niệm và Tính chất của Tích phân.]

==== Hoạt động thành phần 2.1: Khái niệm Tích phân (50 phút)
===== a) Mục tiêu
- Nắm được khái niệm #strong[Diện tích hình thang cong] và cách thức xây
  dựng.
- Nêu được #strong[Định nghĩa Tích phân] (theo Tổng Riemann) và
  #strong[Công thức Newton - Leibniz].

===== b) Nội dung (Tích hợp Năng lực số - Trình bày, mô phỏng)
- #strong[Diện tích hình thang cong:] GV hướng dẫn học sinh xem
  #strong[mô phỏng] cách chia nhỏ hình thang cong thành các hình chữ
  nhật (tăng số lượng $n arrow.r oo$ để xấp xỉ diện tích).

  - #strong[Tích hợp Năng lực số (Biểu hiện):] #emph[Khai thác và xử lí
    dữ liệu] (Quan sát mô phỏng trên phần mềm Geogebra/Desmos). \*
    #strong[Định nghĩa Tích phân:] GV giới thiệu ký hiệu
    $integral_a^b f\(x\)d x$ và kết nối với ý nghĩa hình học.

- #strong[Công thức Newton - Leibniz:]
  $integral_a^b f\(x\)d x = F\(b\)- F\(a\)$, trong đó $F\(x\)$ là một
  nguyên hàm của $f\(x\)$.

- #strong[Ví dụ đề xuất:]

  - #strong[Ví dụ 1 (Minh họa khái niệm):] Cho hàm số $f\(x\)= 2 x$.
    Tính $integral_0^2 2 x d x$ bằng công thức. (Kết quả: 4. Đồng thời
    GV chỉ ra diện tích hình thang cong là một hình thang vuông, học
    sinh có thể tự kiểm tra bằng công thức hình học quen thuộc).
  - #strong[Ví dụ 2 (Áp dụng công thức):] Tính
    $integral_1^2\(x^2 + 1\)d x$.

===== c) Sản phẩm
- #strong[Ghi chép:] Học sinh ghi lại công thức Định nghĩa tích phân,
  Công thức Newton - Leibniz.
- #strong[Thực hiện:] Hoàn thành lời giải chi tiết cho Ví dụ 1 và Ví dụ
  \2.

#tc-hd[
Trực quan, Vấn đáp, Thuyết trình ngắn)
- #strong[Bước 1: Chuyển giao nhiệm vụ (10 phút):] GV chiếu #strong[mô
  phỏng Geogebra] về Tổng Riemann, hướng dẫn học sinh quan sát, và giới
  thiệu Định nghĩa Tích phân, Công thức Newton - Leibniz. (Sử dụng PPDH
  Trực quan, Công cụ số).
- #strong[Bước 2: Thực hiện nhiệm vụ (25 phút):]
  - Học sinh tự nghiên cứu SGK và làm #strong[Ví dụ 1] và #strong[Ví dụ
    2] cá nhân.
  - #strong[GV dự kiến khó khăn:] Học sinh nhầm lẫn giữa nguyên hàm và
    tích phân.
  - #strong[Biện pháp hỗ trợ:] GV nhắc lại mối liên hệ: Tích phân là một
    #emph[giá trị số] được tính thông qua #emph[nguyên hàm] tại hai cận.
- #strong[Bước 3: Báo cáo, thảo luận (10 phút):] GV gọi 2 học sinh lên
  bảng trình bày Ví dụ 1 và 2. GV nhận xét, chỉnh sửa và chuẩn hóa kiến
  thức.
- #strong[Bước 4: Kết luận, nhận định (5 phút):] GV nhấn mạnh ý nghĩa
  hình học và tầm quan trọng của Công thức Newton - Leibniz.

==== Hoạt động thành phần 2.2: Tính chất của Tích phân (80 phút - Kéo dài sang Tiết 3)
===== a) Mục tiêu
- Phát biểu và chứng minh được các #strong[tính chất cơ bản] của tích
  phân.
- Vận dụng được các tính chất để giải các bài tập tích phân cơ bản.

]
#nd-hd[
Thảo luận nhóm, Sơ đồ tư duy)
- #strong[Tính chất:]
  - Tính chất 1: Đổi cận:
    $integral_a^b f\(x\)d x = - integral_b^a f\(x\)d x$.
  - Tính chất 2: Tách tổng/hiệu:
    $integral_a^b\[f\(x\)plus.minus g\(x\)\]d x = integral_a^b f\(x\)d x plus.minus integral_a^b g\(x\)d x$.
  - Tính chất 3: Hằng số:
    $integral_a^b k f\(x\)d x = k integral_a^b f\(x\)d x$.
  - Tính chất 4: Chèn cận:
    $integral_a^b f\(x\)d x = integral_a^c f\(x\)d x + integral_c^b f\(x\)d x$.
- #strong[Ví dụ đề xuất (Dạng bài tập Thảo luận nhóm):]
  - #strong[Ví dụ 3 (Tính chất 3 và 4):] Biết
    $integral_0^1 f\(x\)d x = 2$ và $integral_1^3 f\(x\)d x = - 5$. Tính
    $A = integral_0^3 f\(x\)d x$ và
    $B = integral_0^1\[3 f\(x\)- 1\]d x$.
  - #strong[Ví dụ 4 (Tính chất đổi cận và tách tổng):] Tính tích phân
    $I = integral_(- 1)^1\(2 x^3 - 3 x^2 + x\)d x$.

===== c) Sản phẩm
- #strong[Sơ đồ tư duy (Mind Map):] Mỗi nhóm trình bày một #strong[sơ đồ
  tư duy] tóm tắt các tính chất của tích phân và các ứng dụng cơ bản.
- #strong[Lời giải:] Hoàn thành lời giải chi tiết cho Ví dụ 3 và Ví dụ
  \4.

]
#tc-hd[
Thảo luận nhóm, Thuyết trình)
- #strong[Bước 1: Chuyển giao nhiệm vụ (5 phút):] GV chia lớp thành 4
  nhóm, giao nhiệm vụ: Nghiên cứu SGK, thảo luận để phát biểu các tính
  chất (T1-T4) và cùng nhau giải #strong[Ví dụ 3 và 4].
- #strong[Bước 2: Thực hiện nhiệm vụ (65 phút - Gồm thời gian giải bài
  tập tích phân từng phần và đổi biến ở Tiết 3 và 4):]
  - Học sinh thảo luận nhóm để giải Ví dụ 3, 4.
  - #strong[Tăng cường kĩ năng giao tiếp:] Các thành viên trong nhóm
    phân công nhiệm vụ (người làm bài, người vẽ Sơ đồ tư duy, người
    thuyết trình).
  - #strong[GV dự kiến khó khăn:] Học sinh lúng túng khi áp dụng đồng
    thời nhiều tính chất.
  - #strong[Biện pháp hỗ trợ:] GV gợi ý hướng đi cho nhóm gặp khó khăn
    (Ví dụ 4: Hàm $f\(x\)= x^n$ lẻ/chẵn trên $\[- a\;a\]$).
- #strong[Bước 3: Báo cáo, thảo luận (8 phút):] Đại diện 2 nhóm lên bảng
  trình bày lời giải Ví dụ 3, 4. 1 nhóm khác trình bày #strong[Sơ đồ tư
  duy] về tính chất (Tập trung phát triển kĩ năng thuyết trình, phân
  tích và tổng hợp thông tin).
- #strong[Bước 4: Kết luận, nhận định (2 phút):] GV nhận xét, đánh giá
  về tính đúng đắn của lời giải và sơ đồ tư duy, chốt lại các tính chất
  quan trọng.

]
#hd("3", "Luyện tập", "30 phút")
- #strong[Tên hoạt động:] #strong[Vận dụng và Củng cố kiến thức Tích
  phân cơ bản.]

==== a) Mục tiêu
- Học sinh vận dụng thành thạo Công thức Newton - Leibniz và các tính
  chất để giải các bài tập tính tích phân.
- Phát triển kĩ năng làm việc nhanh, chính xác với MTCT.

==== b) Nội dung (Trò chơi học tập - Tiếp sức)
- #strong[Hệ thống bài tập (dạng Trắc nghiệm/Tự luận ngắn):] Gồm 5-7 câu
  hỏi từ mức độ nhận biết đến vận dụng thấp, tập trung vào:
  - Tính tích phân bằng công thức.
  - Tính tích phân bằng cách áp dụng tính chất chèn cận.
  - Bài toán tìm tham số từ điều kiện tích phân.
- #strong[Ví dụ đề xuất:]
  - #strong[Câu 1:] Tính $integral_0^pi\(sin x + c o s x\)d x$.
  - #strong[Câu 2:] Cho $integral_1^2 f\(x\)d x = 3$. Tính
    $integral_1^2\[4 f\(x\)- 2 x\]d x$.
  - #strong[Câu 3:] Cho hàm số $f\(x\)$ liên tục thỏa mãn
    $integral_1^5 f\(x\)d x = 10$. Tính $integral_0^2 f\(2 x + 1\)d x$.
    (Luyện tập kỹ năng quan sát, nhận dạng).

==== c) Sản phẩm
- Đáp án và lời giải chi tiết của các bài tập luyện tập.

==== d) Tổ chức thực hiện (Trò chơi học tập - Tiếp sức)
- #strong[Bước 1: Chuyển giao nhiệm vụ (5 phút):] GV chia lớp thành 3-4
  đội (mỗi đội khoảng 5-7 học sinh). GV chiếu lần lượt các câu hỏi.
- #strong[Bước 2: Thực hiện nhiệm vụ (20 phút):]
  - Thực hiện theo hình thức #strong[tiếp sức] (mỗi học sinh trong đội
    giải một câu, chuyển kết quả cho người tiếp theo, hoặc cả đội cùng
    giải, người điền đáp án chạy lên bảng).
  - #strong[Tích hợp Năng lực số (Biểu hiện):] #emph[Sử dụng và làm chủ
    các công cụ, ứng dụng số] (Cho phép học sinh sử dụng #strong[MTCT]
    để kiểm tra đáp án hoặc tính toán nhanh).
- #strong[Bước 3: Báo cáo, thảo luận (5 phút):] GV công bố kết quả của
  các đội, gọi đại diện đội thắng và đội có sai sót giải thích cách làm.
- #strong[Bước 4: Kết luận, nhận định:] GV nhận xét chung về tốc độ và
  độ chính xác khi sử dụng công cụ tính toán.

#hd("4", "Vận dụng", "5 phút")
- #strong[Tên hoạt động:] #strong[Khám phá ứng dụng thực tế của Tích
  phân.]

==== a) Mục tiêu
- Học sinh thấy được mối liên hệ của Tích phân với thực tiễn.
- Phát triển năng lực mô hình hóa toán học.

==== b) Nội dung
- #strong[Nhiệm vụ:] Tìm kiếm các tình huống/vấn đề trong thực tiễn có
  thể giải quyết bằng Tích phân (Ví dụ: tính diện tích, thể tích, quãng
  đường, công sinh ra của lực biến thiên, lượng tích lũy của một quá
  trình).
- #strong[Yêu cầu:] Học sinh phát hiện/đề xuất 1-2 ứng dụng cụ thể.

==== c) Sản phẩm
- Báo cáo (dạng văn bản, slide, hoặc video ngắn) về ứng dụng của Tích
  phân (Ví dụ: Ứng dụng tích phân để tính lượng tiêu thụ điện năng từ đồ
  thị công suất).

==== d) Tổ chức thực hiện (Giao nhiệm vụ về nhà)
- #strong[Bước 1: Giao nhiệm vụ (2 phút):] GV giao nhiệm vụ cho học sinh
  thực hiện #strong[ngoài giờ học] trên lớp, khuyến khích sử dụng các
  công cụ tìm kiếm, mạng xã hội để thu thập thông tin và tạo sản phẩm.
  - #strong[Tích hợp Năng lực số (Biểu hiện):] #emph[Giải quyết vấn đề
    và sáng tạo trong môi trường số] (Sử dụng công cụ số để tạo báo cáo
    và tìm kiếm thông tin).
- #strong[Bước 2: Hướng dẫn (3 phút):] GV hướng dẫn cách tìm kiếm (ví
  dụ: dùng Google/Youtube) và khuyến khích làm việc nhóm.
- #strong[Bước 3: Nộp báo cáo:] Sản phẩm được nộp bằng file mềm
  (Word/PowerPoint/Video) và trao đổi, chia sẻ, đánh giá vào tiết học
  sau hoặc một thời điểm phù hợp trong kế hoạch môn học.

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

