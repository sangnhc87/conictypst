// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 25 Nhị thức Newton",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được công thức Nhị thức Newton:
  $\(a + b\)^n= sum_(k = 0)^n C_n^k a^(n - k) b^k$.
- Sử dụng được tam giác Pascal để xác định các hệ số trong khai triển
  Nhị thức Newton với số mũ $n$ nhỏ ($n lt.eq 4$).
- Xác định được các hệ số của một số hạng trong khai triển Nhị thức
  Newton.
- Vận dụng công thức để giải quyết một số bài toán tính tổng, chứng minh
  đẳng thức, và ước lượng gần đúng.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực tìm hiểu công
    thức khai triển và các tính chất của nó.
  - #strong[Năng lực giao tiếp và hợp tác:] Hợp tác hiệu quả trong nhóm
    để hoàn thành nhiệm vụ (ví dụ: tìm quy luật Tam giác Pascal, giải
    bài tập).
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phát hiện quy luật,
    vận dụng công thức vào các bài toán cụ thể.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Quan sát, dự đoán,
    khái quát hóa quy tắc khai triển, lập luận để chứng minh các đẳng
    thức liên quan.
  - #strong[Năng lực mô hình hóa toán học:] Sử dụng Nhị thức Newton để
    mô hình hóa một số bài toán thực tế hoặc tính tổng dãy số.
  - #strong[Năng lực sử dụng công cụ, phương tiện học Toán (Tích hợp
    Năng lực số):] Sử dụng máy tính cầm tay, các công cụ trực tuyến (ví
    dụ: GeoGebra, Desmos) hoặc #strong[phần mềm bảng tính (Excel/Google
    Sheets)] để kiểm tra, tính toán giá trị $C_n^k$ và các hệ số, hoặc
    để kiểm chứng các hệ số trong Tam giác Pascal.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động cá nhân và nhóm;
  hoàn thành các nhiệm vụ học tập.
- #strong[Trung thực:] Trung thực trong quá trình giải quyết vấn đề và
  báo cáo kết quả.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ của bản thân và
  nhiệm vụ chung của nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:]
  - Máy chiếu, máy tính, Phiếu học tập, Bảng phụ (hoặc bảng tương tác).
  - Slide bài giảng (PowerPoint/Google Slides) có hình ảnh Tam giác
    Pascal và công thức Nhị thức Newton.
  - Sử dụng #strong[phần mềm bảng tính (Excel/Google Sheets)] để trình
    bày cách xây dựng Tam giác Pascal.
- #strong[Học sinh:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Vở ghi, dụng cụ học tập, máy tính cầm tay.
  - Điện thoại thông minh/Máy tính bảng (nếu có, để sử dụng các công cụ
    số như Quizizz, Kahoot hoặc phần mềm vẽ Sơ đồ tư duy).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
  khai triển $\(a + b\)^n$ với $n = 1\,2\,3$ và nhận diện vấn đề cần
  giải quyết là tìm công thức tổng quát cho $n$ bất kì.
]
#nd-hd[
  - GV chiếu yêu cầu: Khai triển các biểu thức sau: $\(a + b\)^1$,
    $\(a + b\)^2$, $\(a + b\)^3$.
  - #strong[Ví dụ cụ thể (Nhiệm vụ):] Tính và viết kết quả khai triển
    $\(x + 2 y\)^3$.
  - GV đặt vấn đề: Nếu $n$ lớn hơn (ví dụ: $n = 10$) thì việc khai triển
    thủ công sẽ rất khó khăn. Liệu có công thức tổng quát nào không?
]
#sp-hd[
  - $\(a + b\)^1= a + b$
  - $\(a + b\)^2= a^2 + 2 a b + b^2$
  - $\(a + b\)^3= a^3 + 3 a^2 b + 3 a b^2 + b^3$
  - $\(x + 2 y\)^3= x^3 + 3 x^2\(2 y\)+ 3 x\(2 y\)^2+\(2 y\)^3= x^3 + 6 x^2 y + 12 x y^2 + 8 y^3$.
  - HS ghi nhận được vấn đề: Cần tìm công thức cho $\(a + b\)^n$ với $n$
    bất kì.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV chiếu câu hỏi, yêu cầu HS làm việc cá
    nhân (2 phút).
  - #strong[Thực hiện nhiệm vụ:] HS tự thực hiện, GV quan sát, gợi ý nhẹ
    nhàng cho HS yếu.
  - #strong[Báo cáo, thảo luận:] GV gọi 2-3 HS trình bày kết quả. Cả lớp
    nhận xét.
  - #strong[Kết luận, nhận định:] GV tổng hợp, khen ngợi và dẫn dắt vào
    bài học mới: #strong[Nhị thức Newton].

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "50 phút")
#mt-hd[
  hạng để xây dựng công thức Nhị thức Newton.
]
#nd-hd[
  nhóm):]
  - #strong[Nhiệm vụ 2.1 (Phát hiện quy luật hệ số - Nhóm):]
    - GV yêu cầu HS làm việc nhóm (4-5 HS/nhóm) quan sát các hệ số trong
      khai triển $\(a + b\)^n$ với $n = 1\,2\,3\,4$ (GV cung cấp thêm
      $n = 4$:
      $\(a + b\)^4= a^4 + 4 a^3 b + 6 a^2 b^2 + 4 a b^3 + b^4$).
    - #strong[Ví dụ cụ thể (Nhiệm vụ):] Sắp xếp các hệ số thành một Tam
      giác số (Tam giác Pascal) và dự đoán hàng tiếp theo ($n = 5$).
  - #strong[Nhiệm vụ 2.2 (Liên kết với Tổ hợp - Cá nhân/Cặp đôi):]
    - GV gợi ý mối liên hệ giữa các hệ số trong Tam giác Pascal với các
      số tổ hợp $C_n^k$.
    - #strong[Ví dụ cụ thể (Nhiệm vụ):] Dùng máy tính cầm tay tính các
      giá trị $C_4^0\,C_4^1\,C_4^2\,C_4^3\,C_4^4$ và so sánh với hệ số
      của $\(a + b\)^4$.
    - #strong[Tích hợp Năng lực số:] Yêu cầu một nhóm trình bày cách sử
      dụng #strong[phần mềm bảng tính (Google Sheets)] để tạo ra Tam
      giác Pascal bằng cách nhập công thức $C_n^k$ cho các ô. \*
      #strong[Nhiệm vụ 2.3 (Khái quát hóa - Toàn lớp):]
    - GV yêu cầu HS dựa trên quy luật tìm được (số mũ của $a$, số mũ của
      $b$, tổng số mũ, hệ số $C_n^k$) để phát biểu công thức tổng quát
      của Nhị thức Newton.
// ]
#sp-hd[
  - HS xây dựng được Tam giác Pascal và dự đoán được hàng $n = 5$.
  - HS nhận thấy: Hệ số của $a^(n - k) b^k$ trong khai triển
    $\(a + b\)^n$ là $C_n^k$.
  - Công thức Nhị thức Newton:
    $\(a + b\)^n= sum_(k = 0)^n C_n^k a^(n - k) b^k$.
  - Công thức số hạng tổng quát (số hạng thứ $k + 1$):
    $T_(k + 1) = C_n^k a^(n - k) b^k$.
  - Bảng tính Tam giác Pascal bằng công cụ số (biểu hiện Năng lực số).
]
#tc-hd[
  - #strong[Giao nhiệm vụ 2.1 & 2.2:] GV giao nhiệm vụ, phát phiếu học
    tập (4 phút).
  - #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm/cá nhân. GV theo dõi,
    hỗ trợ, gợi ý liên hệ giữa Pascal và $C_n^k$. (15 phút).
    - #emph[Dự kiến khó khăn:] HS có thể nhầm lẫn giữa $k$ (chỉ số của
      số tổ hợp) và số hạng thứ $k$.
    - #emph[Biện pháp hỗ trợ:] Nhắc lại rằng chỉ số $k$ chạy từ $0$ đến
      $n$.
  - #strong[Báo cáo, thảo luận (Sử dụng công cụ số):] GV gọi nhóm sử
    dụng công cụ số để trình bày cách xây dựng Pascal (tích hợp NS). Các
    nhóm khác nhận xét, bổ sung. (15 phút).
  - #strong[Kết luận, nhận định:] GV chuẩn hóa kiến thức (công thức, số
    hạng tổng quát).

]
#hd("3", "Luyện tập", "20 phút")
#mt-hd[
  triển, tìm hệ số và tính tổng cơ bản. Phát triển kỹ năng tính toán và
  giải quyết vấn đề.
]
#nd-hd[
  Team-based learning):]
  - GV chuẩn bị 3-4 bài tập cơ bản và yêu cầu các nhóm (nhóm đã chia ở
    HĐ2) làm việc \"tiếp sức\" (mỗi thành viên giải một bước/một câu).
  - #strong[Ví dụ cụ thể (Nhiệm vụ):]
    - #strong[Bài 1 (Khai triển):] Khai triển biểu thức $\(2 x - 1\)^4$.
    - #strong[Bài 2 (Tìm hệ số):] Tìm hệ số của $x^3$ trong khai triển
      của $\(3 x + 2\)^5$.
    - #strong[Bài 3 (Tính tổng):] Tính tổng
      $S = C_n^0 + C_n^1 + C_n^2 + dots.h + C_n^n$.
// ]
#sp-hd[
  - #strong[Bài 1:] $16 x^4 - 32 x^3 + 24 x^2 - 8 x + 1$.
  - #strong[Bài 2:] Số hạng tổng quát
    $T_(k + 1) = C_5^k\(3 x\)^(5 - k)\(2\)^k$. Hệ số của $x^3$ khi
    $5 - k = 3 arrow.r.double k = 2$. Hệ số là
    $C_5^2 dot.op 3^3 dot.op 2^2 = 10 dot.op 27 dot.op 4 = 1080$.
  - #strong[Bài 3:] $S =\(1 + 1\)^n= 2^n$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV trình chiếu/phát phiếu bài tập. Quy định
    thời gian (15 phút). (3 phút).
  - #strong[Thực hiện nhiệm vụ:] Các nhóm thực hiện tiếp sức. GV theo
    dõi, đôn đốc, chỉ định thứ tự làm bài giữa các thành viên. (10
    phút).
  - #strong[Báo cáo, thảo luận:] GV gọi đại diện một nhóm lên bảng trình
    bày nhanh lời giải của nhóm hoặc chiếu bài làm của nhóm. (5 phút).
  - #strong[Kết luận, nhận định:] GV chốt đáp án, biểu dương các nhóm
    hoàn thành nhanh và chính xác.

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
  vào thực tiễn hoặc giải quyết các bài toán chứng minh đẳng thức/tính
  tổng nâng cao.
]
#nd-hd[
  nhân):]
  - #strong[Ví dụ cụ thể (Nhiệm vụ 1 - Sơ đồ tư duy):] Sử dụng kiến thức
    đã học (Công thức, Tam giác Pascal, Số hạng tổng quát) để lập một
    #strong[Sơ đồ tư duy] tóm tắt bài học. (Thực hiện ngoài giờ học).
    - #emph[Yêu cầu Tích hợp Năng lực số:] Khuyến khích HS sử dụng
      #strong[phần mềm vẽ sơ đồ tư duy trực tuyến] (ví dụ: MindMeister,
      Xmind) để nộp sản phẩm.
  - #strong[Ví dụ cụ thể (Nhiệm vụ 2 - Bài tập thực tiễn/nâng cao):] Cho
    HS về nhà giải quyết bài toán tính tổng phức tạp hơn, ví dụ:
    $T = C_n^0 - C_n^1 + C_n^2 - dots.h + (-1)^n C_n^n$.
// ]
#sp-hd[
  - Bài báo cáo/Sơ đồ tư duy tóm tắt kiến thức #strong[Nhị thức Newton]
    (dạng hình ảnh/file mềm).
  - Lời giải cho bài toán tính tổng nâng cao: $T = (1 - 1)^n = 0$ (với
    $n gt.eq 1$).
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV giao nhiệm vụ #strong[Sơ đồ tư duy] và
    bài tập về nhà. Nhấn mạnh yêu cầu sử dụng công cụ số.
  - #strong[Thực hiện nhiệm vụ:] Học sinh thực hiện ngoài giờ học trên
    lớp.
  - #strong[Báo cáo, đánh giá:] Nộp báo cáo qua email/Hệ thống quản lý
    học tập (LMS). GV sẽ trao đổi, chia sẻ và đánh giá vào đầu tiết học
    tiếp theo.

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
