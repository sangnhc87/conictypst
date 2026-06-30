// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 15 Giới hạn của dãy số",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm về #strong[giới hạn hữu hạn của dãy số]
  ($lim u_n = L$).
- Trình bày được các #strong[định lí cơ bản về giới hạn hữu hạn của dãy
  số].
- Hiểu được công thức tính #strong[tổng của cấp số nhân lùi vô hạn] và
  điều kiện áp dụng.
- Nêu được khái niệm về #strong[giới hạn vô cực của dãy số]
  ($lim u_n = + oo\,l i m u_n = - oo$).
- Vận dụng được các kiến thức, định lí đã học để tính giới hạn của một
  số dãy số đơn giản.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận toán học:] Phát hiện, chứng minh
    được một số giới hạn cơ bản, phân tích được các bước giải một bài
    toán tìm giới hạn.
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng linh hoạt các
    định lí, quy tắc tính giới hạn để giải quyết các bài toán tìm giới
    hạn dãy số từ cơ bản đến nâng cao.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các tình huống
    thực tiễn (ví dụ: lãi suất kép, bài toán hình học) thành bài toán
    tìm giới hạn dãy số.
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu tài liệu (sách
    giáo khoa, video) để nắm vững kiến thức mới, tự đánh giá được kết
    quả làm việc cá nhân.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    trình bày rõ ràng, thuyết phục ý tưởng và kết quả giải quyết bài
    tập.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Đề xuất được các
    phương pháp giải quyết vấn đề khác nhau, sáng tạo trong việc lập sơ
    đồ tư duy tóm tắt kiến thức.
- #strong[Năng lực số (Theo Thông tư 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  các nhiệm vụ được giao.
- #strong[Trung thực:] Thẳng thắn, nghiêm túc trong báo cáo kết quả thực
  hiện nhiệm vụ cá nhân và nhóm.
- #strong[Trách nhiệm:] Có ý thức hợp tác, hỗ trợ các thành viên trong
  nhóm; Có trách nhiệm với kết quả học tập của bản thân.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính giáo viên, Phiếu học
  tập (in giấy hoặc trực tuyến), Bảng/Bảng phụ, Bộ thẻ trò chơi/câu hỏi
  trắc nghiệm (nếu có).
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 - Kết nối tri thức với cuộc sống.
  - Video mô phỏng dãy số hội tụ/phân kì (có thể sử dụng GeoGebra hoặc
    Desmos).
  - Tài liệu tham khảo về ứng dụng của giới hạn dãy số trong thực tiễn
    (ví dụ: mô hình dân số, bài toán kinh tế).
  - Giấy A0, bút dạ để học sinh vẽ sơ đồ tư duy.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
==== a) Mục tiêu
Tạo hứng thú, giúp học sinh xác định được vấn đề cần nghiên cứu là tìm
hiểu xu hướng thay đổi của các số hạng trong một dãy số khi chỉ số $n$
tăng lên vô hạn, từ đó hình thành khái niệm về giới hạn.

==== b) Nội dung
- #strong[Nhiệm vụ:] Giáo viên đưa ra tình huống thực tiễn hoặc dãy số
  cụ thể.
  - #strong[Ví dụ:] Cho dãy số $\(u_n\)$ với $u_n = 1 / 2^n$. Hãy tính
    các số hạng $u_1\,u_2\,u_3\,dots.h\,u_10$ và nhận xét xu hướng của
    các số hạng này khi $n$ rất lớn.
  - #strong[Thao tác học sinh:] Tính toán và ghi nhận xét.
- #strong[Tích hợp năng lực số:] Học sinh có thể dùng máy tính cầm tay
  hoặc công cụ bảng tính (Excel/Google Sheets) để tính nhanh các giá trị
  $u_n$ với $n$ lớn.

==== c) Sản phẩm
- Kết quả tính toán:
  $u_1 = 1 / 2\,u_2 = 1 / 4\,dots.h\,u_10 = 1 / 1024\,dots.h$
- Nhận xét: Khi $n$ càng lớn, $u_n$ càng gần đến #strong[0].
- Vấn đề cần giải quyết: Cần có một công cụ toán học để chính xác hóa
  khái niệm \"gần đến\" khi $n$ tăng vô hạn. Đó là #strong[Giới hạn của
  dãy số].

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ học tập (2 phút)]
  - Giáo viên trình bày ví dụ dãy số $u_n = 1 / 2^n$ và yêu cầu học sinh
    thực hiện nhiệm vụ.
- #strong[Bước 2: Thực hiện nhiệm vụ (học sinh thực hiện; giáo viên theo
  dõi, hỗ trợ) (5 phút)]
  - Học sinh tự tính toán cá nhân.
  - Giáo viên quan sát, có thể gọi một vài học sinh lên bảng trình bày.
  - Dự kiến khó khăn: Học sinh chưa quen với việc đánh giá xu hướng khi
    $n$ lớn. Biện pháp hỗ trợ: Gợi ý so sánh $u_10$ với $u_20$.
- #strong[Bước 3: Báo cáo, thảo luận (giáo viên tổ chức, điều hành; học
  sinh báo cáo, thảo luận) (2 phút)]
  - Một học sinh đại diện trình bày kết quả và nhận xét.
- #strong[Bước 4: Kết luận, nhận định (1 phút)]
  - Giáo viên chốt lại nhận xét, giới thiệu thuật ngữ #strong[\"giới
    hạn\"] và dẫn dắt vào bài học mới.

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
==== #strong[Hoạt động thành phần 2.1: Giới hạn hữu hạn của dãy số (15 phút)]
===== a) Mục tiêu
- Hiểu rõ định nghĩa $lim u_n = L$.
- Nêu được giới hạn của một số dãy số cơ bản.

===== b) Nội dung
- Nghiên cứu định nghĩa giới hạn hữu hạn của dãy số trong SGK.
- Xét các giới hạn cơ bản: $lim 1 / n = 0$, $lim c = c$, $lim q^n = 0$
  ($\|q\|< 1$).
- #strong[Ví dụ minh họa:] Chứng minh $lim 1 / sqrt(n) = 0$.

===== c) Sản phẩm
- Ghi nhận định nghĩa và các giới hạn cơ bản vào vở.
- Lời giải cho ví dụ minh họa.

===== d) Tổ chức thực hiện
- Học sinh làm việc cá nhân, nghiên cứu định nghĩa và ví dụ.
- Giáo viên hướng dẫn, đặt câu hỏi kiểm tra sự hiểu biết về định nghĩa
  (ví dụ: ý nghĩa của $forall epsilon.alt > 0$).

==== #strong[Hoạt động thành phần 2.2: Định lí về giới hạn hữu hạn của dãy số (15 phút)]
===== a) Mục tiêu
- Nắm vững các định lí về phép toán giới hạn (Tổng, Hiệu, Tích, Thương).
- Vận dụng định lí để tính giới hạn các dãy số tổng hợp.

===== b) Nội dung
- Học sinh làm việc nhóm, tóm tắt các định lí về giới hạn.
- #strong[Ví dụ áp dụng:] Tính giới hạn của dãy số
  $u_n = frac(3 n^2 + 2 n - 1, n^2 + 5)$.
  - #strong[Phương pháp:] Chia tử và mẫu cho lũy thừa cao nhất của $n$
    (là $n^2$).

===== c) Sản phẩm
- Bảng tóm tắt các định lí về giới hạn (có thể trình bày dưới dạng sơ
  đồ).
- Lời giải chi tiết cho ví dụ áp dụng.
- #strong[Tích hợp năng lực số:] Học sinh sử dụng máy tính Casio để kiểm
  tra kết quả tính toán giới hạn của dãy số bằng cách thay $n$ bằng một
  số rất lớn (ví dụ: $n = 1000000$).

===== d) Tổ chức thực hiện
- #strong[Làm việc nhóm (Hợp tác):] Phân công học sinh tóm tắt định lí
  và trình bày lời giải ví dụ.
- Giáo viên giám sát, sửa chữa kịp thời các sai lầm trong việc áp dụng
  định lí (ví dụ: điều kiện $lim v_n eq.not 0$ khi tính giới hạn
  thương).

==== #strong[Hoạt động thành phần 2.3: Tổng của cấp số nhân lùi vô hạn (15 phút)]
===== a) Mục tiêu
- Nắm được điều kiện để cấp số nhân là #strong[cấp số nhân lùi vô hạn]
  ($\|q\|< 1$).
- Thuộc công thức tính tổng $S = frac(u_1, 1 - q)$.

===== b) Nội dung
- Nghiên cứu định nghĩa và công thức tính tổng $S$ trong SGK.
- #strong[Ví dụ minh họa thực tiễn:] Một bài toán hình học về chu vi
  hoặc diện tích các hình vuông/tam giác lồng nhau, hoặc một bài toán
  kinh tế về lãi suất.
  - #strong[Ví dụ:] Tính tổng $S = 1 + 1 / 3 + 1 / 9 + 1 / 27 + dots.h$
  - #strong[Phân tích:] Đây là cấp số nhân lùi vô hạn với $u_1 = 1$ và
    $q = 1 / 3$.

===== c) Sản phẩm
- Công thức tính tổng của cấp số nhân lùi vô hạn:
  $S = frac(u_1, 1 - q)$.
- Lời giải cho ví dụ minh họa: $S = frac(1, 1 - 1\/3) = 3 / 2$.

===== d) Tổ chức thực hiện
- Giáo viên sử dụng phương pháp #strong[Vấn đáp gợi mở] để dẫn dắt học
  sinh đến công thức (từ công thức tổng $n$ số hạng $lim S_n$).
- Yêu cầu học sinh đặt câu hỏi về điều kiện $\|q\|< 1$.

==== #strong[Hoạt động thành phần 2.4: Giới hạn vô cực của dãy số (15 phút)]
===== a) Mục tiêu
- Nêu được định nghĩa giới hạn vô cực
  ($lim u_n = + oo\,l i m u_n = - oo$).
- Áp dụng được một số quy tắc tính giới hạn vô cực.

===== b) Nội dung
- #strong[Nhiệm vụ:] Cho dãy số $u_n = n^2$ và $v_n = - n^3$. Quan sát
  xu hướng của $u_n$ và $v_n$ khi $n$ tăng lớn.
- Nghiên cứu các quy tắc tìm giới hạn vô cực (ví dụ: Tích của $oo$ và
  $L eq.not 0$).
- #strong[Ví dụ áp dụng:] Tính giới hạn của dãy số $u_n = n^3 - n + 1$.
  - #strong[Phương pháp:] Đặt lũy thừa cao nhất ra ngoài:
    $u_n = n^3 (1 - 1 / n^2 + 1 / n^3)$.

===== c) Sản phẩm
- Ghi nhận định nghĩa và các quy tắc tính giới hạn vô cực.
- Lời giải chi tiết cho ví dụ: $lim u_n = + oo$.

===== d) Tổ chức thực hiện
- Giáo viên dùng #strong[lập luận phản chứng] hoặc #strong[giá trị cụ
  thể] để học sinh nhận thấy sự khác biệt giữa giới hạn hữu hạn và giới
  hạn vô cực.
- Nhấn mạnh phương pháp chia hoặc đặt lũy thừa cao nhất ra ngoài để xử
  lí dạng vô định (nếu có).

#hd("3", "Luyện tập", "15 phút")
==== a) Mục tiêu
Vận dụng thành thạo các định lí và quy tắc đã học để giải các bài toán
tìm giới hạn dãy số, tăng cường kĩ năng tính toán và phân tích.

==== b) Nội dung
- #strong[Hệ thống bài tập:] (Lựa chọn 2-3 bài tập đa dạng)
  - Bài tập 1 (Tính tổng): Tính
    $lim (1 / 4 + 1 / 16 + dots.h + 1 / 4^n)$.
  - Bài tập 2 (Giới hạn hữu hạn): Tính
    $lim frac(4 n - 5 n^3 + 2, 1 + 2 n^3)$.
  - Bài tập 3 (Giới hạn vô cực): Tính $l i m\(sqrt(n^2 + 2 n) - n\)$.
- #strong[Hình thức:] #strong[Trò chơi học tập] (ví dụ: \"Tiếp sức tính
  giới hạn\") hoặc làm bài tập theo nhóm/cá nhân.

==== c) Sản phẩm
- Đáp án và lời giải chi tiết cho các bài tập.
  - Bài 1: $frac(1\/4, 1 - 1\/4) = 1 / 3$.
  - Bài 2: $lim frac(4\/n^2 - 5 + 2\/n^3, 1\/n^3 + 2) = - 5\/2$.
  - Bài 3:
    $lim frac(2 n, sqrt(n^2 + 2 n) + n) = l i m frac(2, sqrt(1 + 2\/n) + 1) = 1$.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Giao nhiệm vụ (2 phút)]
  - Phát phiếu bài tập hoặc trình chiếu lên bảng. Chia lớp thành các
    nhóm nhỏ (4-5 học sinh).
- #strong[Bước 2: Thực hiện nhiệm vụ (10 phút)]
  - Các nhóm làm việc, thảo luận và giải quyết bài tập. Giáo viên theo
    dõi, hướng dẫn hỗ trợ (chú trọng bài tập 3 - dạng vô định).
- #strong[Bước 3: Báo cáo, đánh giá (3 phút)]
  - Một vài nhóm trình bày lời giải. Giáo viên mời nhóm khác nhận xét.
  - Giáo viên chốt đáp án và phương pháp giải.

#hd("4", "Vận dụng", "5 phút")
==== a) Mục tiêu
Phát triển năng lực vận dụng kiến thức, kĩ năng vào giải quyết các vấn
đề thực tiễn (theo từng bài hoặc nhóm bài có nội dung phù hợp).

==== b) Nội dung
#strong[Nhiệm vụ:] Tìm hiểu và đề xuất các vấn đề/tình huống trong thực
tiễn gắn với nội dung bài học.

- #strong[Ví dụ đề xuất:]
  - Tìm hiểu về #strong[lãi suất kép liên tục] trong kinh tế (một ứng
    dụng của giới hạn dãy số/hàm số).
  - Bài toán về #strong[dân số] hoặc #strong[sự phân rã phóng xạ] khi
    thời gian tiến tới vô hạn.
  - Bài toán về #strong[khoảng cách] hoặc #strong[thời gian di chuyển]
    trong vật lý (ví dụ: bài toán Zeno về Achilles và con rùa).

==== c) Sản phẩm
- Báo cáo (dạng bài viết, sơ đồ tư duy hoặc video ngắn) phát hiện và
  giải quyết tình huống/vấn đề thực tiễn.
- #strong[Tích hợp năng lực số:] Sử dụng các công cụ tìm kiếm trực tuyến
  (Google Search) để tìm kiếm các bài toán thực tế liên quan đến giới
  hạn. Thiết kế sơ đồ tư duy (Mindmap) trên máy tính để tổng hợp các ứng
  dụng.

==== d) Tổ chức thực hiện
- #strong[Giao nhiệm vụ ngoài giờ học:] Giáo viên giao cho học sinh thực
  hiện nhiệm vụ này tại nhà (ngoài giờ học trên lớp).
- Yêu cầu nộp báo cáo (file mềm, video hoặc sơ đồ tư duy) sau 1 tuần.
- Giáo viên sẽ dành 5 phút đầu giờ của tiết học tiếp theo để trao đổi,
  chia sẻ và đánh giá các sản phẩm báo cáo.

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

