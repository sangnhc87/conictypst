// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "HĐTHTN 2 Vẽ vectơ tổng của 3 VT",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được cách biểu diễn ba vectơ bất kì trong không gian Oxyz bằng
  phần mềm Geogebra.
- Trình bày được các bước cơ bản để tính toán và vẽ vectơ tổng của ba
  vectơ $arrow(u)$, $arrow(v)$, $arrow(w)$ bất kì trong không gian bằng
  phần mềm Geogebra.
- Hiểu và vận dụng được quy tắc cộng vectơ trong không gian để kiểm tra
  kết quả trên phần mềm.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực mô hình hóa Toán học:] Mô tả được quy tắc cộng
    vectơ trong không gian bằng các thao tác trên phần mềm Geogebra.
  - #strong[Năng lực sử dụng công cụ, phương tiện học Toán:] Sử dụng
    thành thạo phần mềm #strong[Geogebra 3D] để biểu diễn các vectơ và
    tìm vectơ tổng.
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu các lệnh cơ
    bản trong Geogebra để thực hiện nhiệm vụ được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận, làm việc
    nhóm để giải quyết vấn đề và trình bày kết quả.
- #strong[Năng lực số (theo Thông tư số 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực hoàn thành nhiệm vụ thực hành trên máy
  tính.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ của nhóm, nghiêm
  túc, cẩn thận trong quá trình thao tác trên phần mềm để tạo ra sản
  phẩm chính xác.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/màn hình tương tác, máy
  tính/phòng máy tính có cài đặt phần mềm #strong[Geogebra Classic 6]
  (hoặc Geogebra 3D).
- #strong[Học liệu:]
  - Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc sống).
  - Phiếu giao nhiệm vụ nhóm (có ghi rõ tọa độ 3 vectơ mẫu).
  - Tài liệu hướng dẫn nhanh các lệnh cơ bản của Geogebra 3D liên quan
    đến vectơ.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "5 phút")
- #strong[Tên hoạt động:] Khởi động: Đặt vấn đề từ thực tiễn và kiểm tra
  kiến thức cũ.

#mt-hd[
Kích hoạt kiến thức về quy tắc cộng vectơ trong
  không gian và tạo động lực thực hành công cụ số.

]
#nd-hd[

  - #strong[GV] đặt câu hỏi: \"Trong không gian Oxyz, cho ba vectơ
    $arrow(u) =\(u_1\;u_2\;u_3\)$, $arrow(v) =\(v_1\;v_2\;v_3\)$,
    $arrow(w) =\(w_1\;w_2\;w_3\)$. Hãy nêu công thức tính tọa độ của
    vectơ tổng $arrow(s) = arrow(u) + arrow(v) + arrow(w)$\.\"
  - #strong[GV] đặt vấn đề thực tiễn: \"Làm thế nào để #strong[hình dung
    trực quan] được vectơ tổng $arrow(s)$ này trong không gian 3 chiều
    một cách nhanh chóng và chính xác nhất, thay vì chỉ tính toán trên
    giấy?\"

]
#sp-hd[
Công thức tính tọa độ vectơ tổng:
  $arrow(s) =\(u_1 + v_1 + w_1\;u_2 + v_2 + w_2\;u_3 + v_3 + w_3\)$. Câu
  trả lời định hướng sử dụng phần mềm Geogebra.

]
#tc-hd[

  - #strong[Bước 1 (Giao nhiệm vụ):] #strong[GV] đặt câu hỏi, yêu cầu HS
    trả lời nhanh (cá nhân hoặc cặp đôi).
  - #strong[Bước 2 (Thực hiện nhiệm vụ):] HS ôn lại kiến thức và trả
    lời.
  - #strong[Bước 3 (Báo cáo, thảo luận):] #strong[GV] mời 1-2 HS trả lời
    công thức.
  - #strong[Bước 4 (Kết luận, nhận định):] #strong[GV] chốt lại công
    thức, sau đó dẫn dắt: \"Để trực quan hóa, chúng ta sẽ sử dụng phần
    mềm Geogebra. Nhiệm vụ hôm nay là làm chủ công cụ này để vẽ vectơ
    tổng của ba vectơ.\"

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "15 phút")
- #strong[Tên hoạt động:] Khám phá và làm chủ công cụ Geogebra.

#mt-hd[
Học sinh biết cách khởi tạo, nhập tọa độ vectơ
  và sử dụng lệnh tính tổng vectơ trên Geogebra 3D.

]
#nd-hd[
#strong[Thực hành theo nhóm (4-5 HS/nhóm)].

  - #strong[GV] hướng dẫn cơ bản các lệnh liên quan (nhấn mạnh lệnh
    #strong[Vector()] và #strong[\+]).
  - #strong[Nhiệm vụ cụ thể cho các nhóm:]
    - #strong[Nhóm A:] Vẽ ba vectơ $arrow(u) =\(1\;2\;3\)$,
      $arrow(v) =\(0\;- 1\;2\)$, $arrow(w) =\(3\;1\;- 1\)$.
    - #strong[Nhóm B:] Vẽ ba vectơ $arrow(a) =\(2\;0\;1\)$,
      $arrow(b) =\(- 1\;3\;0\)$, $arrow(c) =\(0\;0\;4\)$.
    - #strong[Yêu cầu chung:] Sau khi vẽ, sử dụng Geogebra để tính và vẽ
      vectơ tổng $arrow(s)$ của ba vectơ đó. #strong[\(Tích hợp Năng lực
      số: Khai thác và xử lí thông tin bằng công nghệ số)].

]
#sp-hd[

  - Hình vẽ không gian 3 chiều thể hiện rõ 3 vectơ ban đầu và vectơ tổng
    $arrow(s)$ trong cửa sổ đồ họa 3D của Geogebra.
  - Kết quả tính toán tọa độ vectơ tổng được hiển thị trong cửa sổ Đại
    số.

]
#tc-hd[

  - #strong[Bước 1 (Giao nhiệm vụ):] #strong[GV] chia lớp thành các
    nhóm, giao phiếu nhiệm vụ và tài liệu hướng dẫn nhanh, yêu cầu các
    nhóm tiến hành thực hành.
  - #strong[Bước 2 (Thực hiện nhiệm vụ):]
    - HS làm việc nhóm, thực hiện thao tác trên máy tính (lựa chọn cách
      thức thực hiện tối ưu).
    - #strong[GV] theo dõi, quan sát, kịp thời hỗ trợ các nhóm gặp khó
      khăn (ví dụ: khó khăn trong việc nhập lệnh chính xác, khó khăn
      trong việc điều chỉnh góc nhìn 3D).
    - #strong[\(Biện pháp hỗ trợ):] Nếu HS gặp khó khăn với lệnh,
      #strong[GV] gợi ý sử dụng cú pháp:
      `Vector(``(điểm đầu), (điểm cuối))` hoặc `Vector(``(tọa độ))` và
      phép cộng trực tiếp: `s = u + v + w`.
  - #strong[Bước 3 (Báo cáo, thảo luận):] #strong[GV] mời 1-2 nhóm trình
    bày màn hình máy tính của mình. #strong[\(Khuyến khích kĩ năng giao
    tiếp, thuyết trình)].
  - #strong[Bước 4 (Kết luận, nhận định):] #strong[GV] tổng hợp các bước
    vẽ và tính tổng vectơ trong Geogebra, nhấn mạnh tính trực quan và
    nhanh chóng của phần mềm.

]
#hd("3", "Luyện tập", "15 phút")
- #strong[Tên hoạt động:] Thử thách: Vận dụng và mở rộng.

#mt-hd[
Củng cố kĩ năng sử dụng Geogebra, đồng thời phát
  triển kĩ năng phân tích và tổng hợp thông tin.

]
#nd-hd[

  - #strong[Nhiệm vụ chung (Thực hành nhóm):] Cho ba vectơ $arrow(u)$,
    $arrow(v)$, $arrow(w)$ bất kì do nhóm tự chọn (tọa độ nguyên).
    - #strong[Yêu cầu 1:] Dùng Geogebra vẽ
      $arrow(s) = arrow(u) + arrow(v) + arrow(w)$.
    - #strong[Yêu cầu 2:] Tự kiểm tra kết quả bằng cách vẽ thêm vectơ
      $arrow(s') =\(arrow(u) + arrow(v)\)+ arrow(w)$ (dùng quy tắc 3
      điểm liên tiếp) để xác minh $arrow(s)$ và $arrow(s')$ trùng nhau.
    - #strong[Yêu cầu 3 (Phân tích, tổng hợp):] Vẽ sơ đồ tư duy ngắn gọn
      (trên giấy hoặc phần mềm trình chiếu) tóm tắt các bước
      #strong[\"Vẽ vectơ tổng 3 vectơ bằng Geogebra\"]. #strong[\(Tăng
      cường kĩ năng phân tích và tổng hợp thông tin)].

]
#sp-hd[

  - Kết quả thực hành trên Geogebra: Hình vẽ chứng tỏ $arrow(s)$ và
    $arrow(s')$ là cùng một vectơ.
  - Sơ đồ tư duy về các bước thực hiện.

]
#tc-hd[

  - #strong[Bước 1 (Giao nhiệm vụ):] #strong[GV] giao nhiệm vụ mở rộng.
  - #strong[Bước 2 (Thực hiện nhiệm vụ):]
    - Các nhóm tự phân công (thực hành Geogebra, vẽ sơ đồ tư duy).
    - #strong[GV] quan sát, đặc biệt chú ý đến cách các nhóm sử dụng quy
      tắc 3 điểm để vẽ $arrow(s')$ nhằm kiểm tra lại kết quả.
  - #strong[Bước 3 (Báo cáo, thảo luận):]
    - #strong[GV] mời 1-2 nhóm lên bảng máy chiếu, trình bày sơ đồ tư
      duy (hoặc dùng điện thoại chụp ảnh gửi lên màn hình lớn để thuyết
      trình). #strong[\(Khuyến khích kĩ năng thuyết trình)].
    - Nhóm khác nhận xét, bổ sung về các bước thực hiện.
  - #strong[Bước 4 (Kết luận, nhận định):] #strong[GV] nhận xét, đánh
    giá kết quả thực hành và sơ đồ tư duy, làm rõ lại quy trình chuẩn.
    #strong[\(Đánh giá bằng nhận xét quá trình và kết quả thực hiện)].

]
#hd("4", "Vận dụng", "10 phút")
- #strong[Tên hoạt động:] Trải nghiệm sáng tạo (Thực hiện ngoài giờ
  học).

#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  vào thực tiễn và khả năng sáng tạo nội dung số.

]
#nd-hd[
#strong[Nhiệm vụ giao về nhà (cá nhân)].

  - #strong[Yêu cầu:] Hãy tìm một tình huống thực tế (ví dụ: mô phỏng
    lực tác dụng lên một vật trong không gian, hoặc sự di chuyển của một
    máy bay chịu ảnh hưởng của nhiều luồng gió) có thể được mô hình hóa
    bằng tổng của 3 vectơ.
  - #strong[Nhiệm vụ:]
    - Gán tọa độ cụ thể cho 3 vectơ đó.
    - Sử dụng Geogebra để vẽ và tìm vectơ tổng.
    - Quay một đoạn video ngắn (khoảng 30 giây - 1 phút) hoặc tạo một
      bài trình chiếu (Slide) ghi lại quá trình thực hiện và kết quả.
      #strong[\(Tích hợp Năng lực số: Sáng tạo nội dung số)].

]
#sp-hd[

  - Video/Bài trình chiếu mô tả tình huống thực tế, quá trình nhập lệnh
    và hình ảnh vectơ tổng trên Geogebra.

]
#tc-hd[

  - #strong[Bước 1 (Giao nhiệm vụ):] #strong[GV] giao nhiệm vụ và yêu
    cầu HS nộp báo cáo (video/slide) qua kênh học tập chung (ví dụ:
    Google Classroom, Zalo nhóm) vào buổi học tiếp theo.
  - #strong[Bước 2 (Thực hiện nhiệm vụ):] Học sinh tự thực hiện ngoài
    giờ học.
  - #strong[Bước 3 (Báo cáo, thảo luận):] #strong[GV] sẽ lựa chọn sản
    phẩm sáng tạo nhất để trình chiếu, trao đổi, chia sẻ và đánh giá vào
    tiết học phù hợp tiếp theo.

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

]
