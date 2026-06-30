// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 31 Định nghĩa và ý nghĩa của ĐH",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[đạo hàm của hàm số tại một điểm] và
  #strong[đạo hàm của hàm số trên một khoảng] bằng định nghĩa.
- Giải thích được một số bài toán thực tế dẫn đến khái niệm đạo hàm (vận
  tốc tức thời, cường độ tức thời).
- Nêu được #strong[ý nghĩa hình học của đạo hàm] (hệ số góc của tiếp
  tuyến).
- Viết được #strong[phương trình tiếp tuyến] của đồ thị hàm số tại một
  điểm.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, đọc tài liệu
    (SGK, học liệu số) để tiếp thu kiến thức mới về đạo hàm.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia hoạt động
    nhóm, trao đổi, thảo luận để xây dựng kiến thức và giải quyết các
    bài toán thực tế.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống thực tiễn (vận tốc tức thời, cường độ tức thời) để hình thành
    khái niệm; biết vận dụng kiến thức mới để giải các bài tập Toán học
    và thực tiễn.
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận toán học:] Hình thành định nghĩa
    đạo hàm thông qua giới hạn; lập luận để thiết lập phương trình tiếp
    tuyến.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các bài toán
    thực tế (vận tốc, cường độ) bằng khái niệm đạo hàm.
- #strong[Năng lực số:]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tìm tòi, nghiên cứu các ví dụ thực tế và
  bài tập Toán học.
- #strong[Trách nhiệm:] Hoàn thành nhiệm vụ học tập cá nhân và nhiệm vụ
  nhóm được giao.
- #strong[Trung thực:] Nghiêm túc, khách quan trong việc tự đánh giá và
  đánh giá lẫn nhau.
- #strong[Tư duy phản biện:] Đặt câu hỏi, phản hồi mang tính xây dựng
  trong quá trình thảo luận.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy tính kết nối Internet, máy chiếu, bài giảng
  Powerpoint (có tích hợp GeoGebra), phiếu học tập in sẵn, Phiếu đánh
  giá nhóm, thước kẻ, phấn màu.
- #strong[Học sinh:] Sách giáo khoa Toán 11, vở ghi, máy tính cầm tay,
  điện thoại/máy tính bảng có kết nối mạng để truy cập học liệu số (nếu
  cần cho Hoạt động 4).
- #strong[Học liệu số:] Video minh họa quá trình tính vận tốc tức thời,
  mô phỏng tiếp tuyến và hệ số góc trên GeoGebra.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
Tạo hứng thú, giúp học sinh nhận thấy nhu cầu
  cần giải quyết một bài toán thực tiễn không thể giải bằng công cụ cũ
  (vận tốc trung bình), từ đó xác định được vấn đề/nhiệm vụ học tập (tìm
  cách tính vận tốc tức thời, dẫn đến khái niệm đạo hàm).

]
#nd-hd[

  - Giáo viên (GV) trình chiếu một video ngắn/tình huống thực tế về một
    vật chuyển động thẳng với quy luật quãng đường $s = s\(t\)$.
  - #strong[Ví dụ đề xuất:] Một vật chuyển động thẳng có phương trình
    $s\(t\)= 4 t^2 + t$, trong đó $s$ tính bằng mét (m) và $t$ tính bằng
    giây (s). Yêu cầu: #strong[Tính vận tốc của vật tại thời điểm]
    $t_0 = 1$ #strong[giây.]
  - GV đặt câu hỏi gợi mở: \"Chúng ta có thể dễ dàng tính được vận tốc
    trung bình trong khoảng thời gian $Delta t$ từ $t_0$ đến
    $t_0 + Delta t$. Vậy làm thế nào để tính được #strong[vận tốc tức
    thời] tại đúng thời điểm $t_0 = 1$?\"

]
#sp-hd[

  - Học sinh (HS) tính được vận tốc trung bình trong khoảng
    $\(1\;1 + Delta t\)$ là
    $v_(t b) = frac(s\(1 + Delta t\)- s\(1\), Delta t) = 9 + 4 Delta t$.
  - HS trình bày được nhận định: Khi $Delta t arrow.r 0$, $v_(t b)$ sẽ
    tiến về vận tốc tức thời $v\(1\)$, và kết quả tính toán sơ bộ là $9$
    #strong[m/s].
  - HS nêu được vấn đề cần giải quyết là cần một công cụ Toán học để
    thực hiện quá trình giới hạn này một cách chính xác.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (2 phút):] GV trình bày tình huống,
    yêu cầu HS làm việc cá nhân, tính vận tốc trung bình và nêu nhận
    định về vận tốc tức thời.
  - #strong[Bước 2: Thực hiện nhiệm vụ (5 phút):] HS tự tính toán. GV
    quan sát, khuyến khích HS thảo luận nhanh với bạn bên cạnh.
    #strong[Hỗ trợ dự kiến:] Nhắc HS nhớ lại công thức tính vận tốc
    trung bình và khái niệm giới hạn đã học.
  - #strong[Bước 3: Báo cáo, thảo luận (3 phút):] GV mời 1-2 HS trình
    bày kết quả và nhận định. GV tổng hợp, chốt lại: \"Để tính chính xác
    $v\(1\)$, ta cần tìm giới hạn của
    $frac(s\(1 + Delta t\)- s\(1\), Delta t)$ khi $Delta t arrow.r 0$.
    Đây chính là nội dung cốt lõi của bài học hôm nay - #strong[Đạo
    hàm]\.\"
  - #strong[Tích hợp Năng lực số:] Không áp dụng trong hoạt động này.

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "60 phút - 2 tiết")
===== 2.1. Hoạt động thành phần 2.1: Một số bài toán dẫn đến khái niệm đạo hàm (15 phút)
#mt-hd[
Khái quát hóa hai bài toán thực tế (#strong[Vận
  tốc tức thời] và #strong[Cường độ tức thời]) để thấy sự tương đồng và
  dẫn đến nhu cầu định nghĩa khái niệm Toán học chung.

]
#nd-hd[

  - #strong[Tiểu mục 1: Vận tốc tức thời của một vật chuyển động thẳng:]
    GV hệ thống lại kết quả Hoạt động 1 và công thức giới hạn.
  - #strong[Tiểu mục 2: Cường độ tức thời:] GV đưa ra bài toán tương tự
    trong Vật lí/Kĩ thuật.
    - #strong[Ví dụ đề xuất:] Cho biết lượng điện tích $Q$ (Coulomb) đi
      qua một tiết diện dây dẫn kể từ thời điểm $t = 0$ giây đến thời
      điểm $t$ giây là $Q\(t\)= t^3 + 2 t$. Yêu cầu: Tính cường độ dòng
      điện tức thời tại thời điểm $t_0 = 2$ giây.
  - HS làm việc nhóm (4-5 HS), so sánh cách giải quyết bài toán Vận tốc
    tức thời và Cường độ tức thời, nhận ra điểm chung là tính giới hạn:
    $lim_(Delta t arrow.r 0) frac(f\(t_0 + Delta t\)- f\(t_0\), Delta t)$.

]
#sp-hd[

  - HS trình bày tóm tắt cách tính: Cường độ tức thời
    $I\(2\)= lim_(Delta t arrow.r 0) frac(Q\(2 + Delta t\)- Q\(2\), Delta t)$.
  - Kết quả cuối cùng $I\(2\)= 14$ (A).
  - Sơ đồ/Báo cáo nhóm chỉ ra sự tương đồng về công thức giới hạn của
    hai bài toán.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (2 phút):] GV trình bày bài toán Cường
    độ tức thời. Yêu cầu HS thảo luận nhóm, so sánh cấu trúc công thức
    với bài toán vận tốc.
  - #strong[Bước 2: Thực hiện nhiệm vụ (8 phút):] HS thảo luận nhóm,
    tính toán. GV quan sát, hỗ trợ các nhóm gặp khó khăn trong việc
    thiết lập giới hạn.
  - #strong[Bước 3: Báo cáo, thảo luận (5 phút):] Mời đại diện 1 nhóm
    trình bày kết quả Cường độ tức thời và nhận xét về sự tương đồng
    công thức giới hạn. GV chốt: \"Giới hạn này chính là khái niệm cốt
    lõi mà chúng ta sẽ định nghĩa: #strong[Đạo hàm của hàm số tại một
    điểm]\.\"
  - #strong[Tích hợp Năng lực số:] Không áp dụng trong hoạt động này.

===== 2.2. Hoạt động thành phần 2.2: Đạo hàm của hàm số tại một điểm & trên một khoảng (15 phút)
]
#mt-hd[
Hình thành và nắm vững định nghĩa chính thức của
  đạo hàm tại một điểm và trên một khoảng.

]
#nd-hd[

  - #strong[Đạo hàm tại một điểm:] GV chính thức đưa ra định nghĩa đạo
    hàm của hàm số $y = f\(x\)$ tại điểm $x_0$:
    $f'\(x_0\)= lim_(Delta x arrow.r 0) frac(f\(x_0 + Delta x\)- f\(x_0\), Delta x)$.
  - #strong[Đạo hàm trên một khoảng:] GV giới thiệu khái niệm và kí hiệu
    $f'\(x\)$ hoặc $y'$ là đạo hàm của hàm số trên khoảng đó.
  - #strong[Ví dụ đề xuất:] Tính đạo hàm của hàm số $f\(x\)= x^2$ tại
    $x_0 = - 1$ bằng định nghĩa. (Hoạt động cá nhân)

]
#sp-hd[

  - HS ghi nhận được định nghĩa và kí hiệu của đạo hàm.
  - Lời giải chính xác ví dụ:
    $f'\(- 1\)= lim_(Delta x arrow.r 0) frac(\(- 1 + Delta x\)^2-\(- 1\)^2, Delta x) = lim_(Delta x arrow.r 0)\(- 2 + Delta x\)= - 2$.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (5 phút):] GV công bố định nghĩa. Yêu
    cầu HS đọc SGK (hoặc học liệu số đã chuẩn bị) và so sánh với công
    thức giới hạn đã tìm ở Hoạt động 2.1. Yêu cầu HS làm ví dụ.
  - #strong[Bước 2: Thực hiện nhiệm vụ (5 phút):] HS tự tính toán. GV
    theo dõi và khuyến khích HS trình bày rõ ràng các bước tìm giới hạn.
  - #strong[Bước 3: Báo cáo, thảo luận (5 phút):] Mời 1 HS lên
    bảng/trình chiếu lời giải. GV nhận xét, chuẩn hóa kiến thức.
  - #strong[Tích hợp Năng lực số:] Không áp dụng trong hoạt động này.

===== 2.3. Hoạt động thành phần 2.3: Ý nghĩa hình học của đạo hàm (15 phút)
]
#mt-hd[
Nắm được mối liên hệ giữa đạo hàm tại một điểm
  và hệ số góc của tiếp tuyến của đồ thị hàm số tại điểm đó.

]
#nd-hd[

  - #strong[Tiếp tuyến của đồ thị hàm số:] GV trình bày khái niệm tiếp
    tuyến là vị trí giới hạn của cát tuyến khi điểm $M$ tiến tới điểm
    $M_0$.
  - #strong[Ý nghĩa hình học:] Dẫn dắt để HS nhận thấy hệ số góc của cát
    tuyến $M_0 M$ chính là
    $frac(f\(x_0 + Delta x\)- f\(x_0\), Delta x)$. Khi
    $Delta x arrow.r 0$, giới hạn này chính là đạo hàm $f'\(x_0\)$ và
    cũng là #strong[hệ số góc] $k$ #strong[của tiếp tuyến] tại $M_0$.
  - #strong[Ví dụ minh họa:] Sử dụng phần mềm GeoGebra để mô phỏng sự
    dịch chuyển của cát tuyến tiến dần tới tiếp tuyến, minh họa hệ số
    góc của chúng.

]
#sp-hd[

  - HS ghi nhận được công thức: $k = f'\(x_0\)$.
  - HS mô tả được mối liên hệ hình học giữa đạo hàm và tiếp tuyến.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (3 phút):] GV trình bày lí thuyết về
    cát tuyến, tiếp tuyến và hệ số góc $k_(M M_0)$. Đặt câu hỏi: \"Khi
    $M arrow.r M_0$, hệ số góc $k_(M M_0)$ tiến về giá trị nào?\"
  - #strong[Bước 2: Thực hiện nhiệm vụ (7 phút):] HS thảo luận cặp đôi,
    quan sát mô phỏng GeoGebra của GV (trên máy chiếu) để rút ra kết
    luận.
  - #strong[Bước 3: Báo cáo, thảo luận (5 phút):] Mời 1-2 cặp đôi trình
    bày kết luận. GV chuẩn hóa công thức $k = f'\(x_0\)$ và nhấn mạnh ý
    nghĩa hình học của đạo hàm.
  - #strong[Tích hợp Năng lực số:]
    - #strong[Biểu hiện:] Sử dụng phần mềm #strong[GeoGebra] để mô phỏng
      hình học (sử dụng công cụ số để trình bày và minh họa kiến thức
      toán học).
    - #strong[Năng lực số:] #strong[Sử dụng công cụ số để trình bày,
      minh họa kiến thức và ý tưởng.]

===== 2.4. Hoạt động thành phần 2.4: Phương trình tiếp tuyến (15 phút)
]
#mt-hd[
Thiết lập được công thức viết phương trình tiếp
  tuyến của đồ thị hàm số tại một điểm, vận dụng để giải bài tập cơ bản.

]
#nd-hd[

  - #strong[Phương trình tiếp tuyến:] Dựa trên kiến thức về phương trình
    đường thẳng đi qua điểm $M_0\(x_0\,y_0\)$ và có hệ số góc $k$, GV
    dẫn dắt HS thiết lập công thức: $y - y_0 = f'\(x_0\)\(x - x_0\)$.
  - #strong[Ví dụ đề xuất:] Viết phương trình tiếp tuyến của đồ thị hàm
    số $f\(x\)= x^2$ tại điểm có hoành độ $x_0 = - 1$. (Hoạt động nhóm)

]
#sp-hd[

  - HS thiết lập được công thức phương trình tiếp tuyến.
  - Lời giải chính xác ví dụ: $y_0 = f\(- 1\)= 1$. $f'\(- 1\)= - 2$ (đã
    tính ở Hoạt động 2.2). Phương trình tiếp tuyến:
    $y - 1 = - 2\(x -\(- 1\)\)arrow.l.r.double y = - 2 x - 1$.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (2 phút):] GV yêu cầu HS làm việc
    nhóm, vận dụng công thức đường thẳng (đã học ở lớp 10) và công thức
    $k = f'\(x_0\)$ để thiết lập phương trình tiếp tuyến và áp dụng giải
    ví dụ.
  - #strong[Bước 2: Thực hiện nhiệm vụ (8 phút):] HS thảo luận, tính
    toán. GV theo dõi, hỗ trợ, đảm bảo HS tính đúng $y_0$, $f'\(x_0\)$
    và viết đúng phương trình.
  - #strong[Bước 3: Báo cáo, thảo luận (5 phút):] Mời đại diện một nhóm
    trình bày kết quả và phương trình tiếp tuyến. GV chuẩn hóa lời giải.
  - #strong[Tích hợp Năng lực số:] Không áp dụng trong hoạt động này.

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
Vận dụng kiến thức về đạo hàm bằng định nghĩa và
  ý nghĩa hình học để giải quyết các bài tập đa dạng, phát triển kĩ năng
  tính toán và tư duy.

]
#nd-hd[
GV tổ chức trò chơi học tập (ví dụ: \"Ai nhanh
  hơn?\" hoặc \"Giải mã ô chữ\") thông qua hệ thống 3-4 câu hỏi/bài tập
  trắc nghiệm/tự luận ngắn.

  - #strong[Bài tập 1 (Tính toán):] Tính đạo hàm của hàm số
    $f\(x\)= 1 / x$ tại $x_0 = 2$ bằng định nghĩa.
  - #strong[Bài tập 2 (Lý thuyết):] Phát biểu ý nghĩa hình học của
    $f'\(x_0\)$.
  - #strong[Bài tập 3 (Vận dụng):] Cho hàm số $f\(x\)= x^2 - 3 x$. Viết
    phương trình tiếp tuyến của đồ thị hàm số tại điểm có hoành độ
    $x_0 = 3$.

]
#sp-hd[

  - Đáp án, lời giải chính xác của các bài tập:
    - Bài 1: $f'\(2\)= - 1 / 4$.
    - Bài 3: $y_0 = f\(3\)= 0$. $f'\(3\)= 3$. Phương trình tiếp tuyến:
      $y = 3\(x - 3\)arrow.l.r.double y = 3 x - 9$.
  - Sản phẩm là câu trả lời/lời giải được viết nhanh trên bảng phụ/phần
    mềm trình chiếu.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (2 phút):] GV phổ biến luật chơi. Chia
    lớp thành các nhóm nhỏ (nếu là trò chơi).
  - #strong[Bước 2: Thực hiện nhiệm vụ (10 phút):] HS cá nhân/nhóm nhanh
    chóng giải các bài tập. GV theo dõi, hỗ trợ nhanh (gợi ý công thức).
  - #strong[Bước 3: Báo cáo, thảo luận (3 phút):] GV yêu cầu nhóm/cá
    nhân đưa ra đáp án, công bố đáp án và tổng hợp nhanh kết quả.
  - #strong[Tích hợp Năng lực số:]
    - #strong[Biểu hiện:] Sử dụng các công cụ tạo trò chơi học tập (ví
      dụ: Kahoot, Quizizz) để tổ chức luyện tập và đánh giá nhanh.
    - #strong[Năng lực số:] #strong[Sử dụng công cụ số để thực hiện,
      đánh giá kết quả, thu thập và xử lí thông tin.]

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  về đạo hàm vào giải quyết các vấn đề thực tiễn (theo từng bài hoặc
  nhóm bài có nội dung phù hợp).

]
#nd-hd[
Giao nhiệm vụ tìm tòi ngoài giờ học.

  - #strong[Yêu cầu:] Học sinh phát hiện các tình huống trong thực tiễn
    (Vật lí, Hóa học, Sinh học, Kinh tế...) có sự xuất hiện của
    #strong[tốc độ thay đổi tức thời] (ví dụ: tốc độ phản ứng hóa học,
    tốc độ tăng trưởng dân số, lợi nhuận cận biên) và giải thích tại sao
    các tốc độ này được mô hình hóa bằng #strong[Đạo hàm].
  - Yêu cầu HS tìm kiếm thông tin trên Internet, sử dụng công cụ số.

]
#sp-hd[

  - Báo cáo viết tay hoặc báo cáo điện tử (file Word/Powerpoint/Mindmap)
    trình bày về ít nhất 1 vấn đề thực tiễn và cách đạo hàm mô hình hóa
    vấn đề đó.
  - #strong[Sơ đồ tư duy (Mindmap):] Khuyến khích HS sử dụng công cụ
    Mindmap để tổng hợp kiến thức bài học (Định nghĩa - Ý nghĩa hình học
    \- Ý nghĩa vật lí/thực tiễn).

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (2 phút):] GV giao nhiệm vụ, hướng dẫn
    cách tìm kiếm và khuyến khích sử dụng sơ đồ tư duy (ví dụ: bằng các
    phần mềm Mindmap).
  - #strong[Bước 2: Học sinh thực hiện:] Học sinh thực hiện ngoài giờ
    học trên lớp.
  - #strong[Bước 3: Báo cáo, đánh giá:] Nộp báo cáo và trình bày, chia
    sẻ (dự kiến vào đầu tiết học tiếp theo) để trao đổi, chia sẻ và đánh
    giá.
  - #strong[Tích hợp Năng lực số:]
    - #strong[Biểu hiện:] HS sử dụng Internet để tìm kiếm thông tin, sử
      dụng phần mềm để lập Sơ đồ Tư duy (Mindmap) hoặc tạo báo cáo điện
      tử.
    - #strong[Năng lực số:] #strong[Tìm kiếm, khai thác, phân tích và
      tổng hợp thông tin số phục vụ mục đích học tập; Sử dụng công cụ số
      để trình bày kiến thức (Mindmap, Powerpoint).]

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
