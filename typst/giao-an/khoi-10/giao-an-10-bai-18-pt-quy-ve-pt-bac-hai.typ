// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 18 PT quy về PT bậc hai",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm và các bước cơ bản để giải một số dạng phương trình
  quy về phương trình bậc hai: Phương trình chứa ẩn dưới dấu căn dạng
  $sqrt(f\(x\)) = sqrt(g\(x\))$ và $sqrt(f\(x\)) = g\(x\)$.
- Trình bày được cách biến đổi và điều kiện xác định/điều kiện tương
  đương để giải thành công các dạng phương trình trên.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực tìm hiểu, đọc
    sách giáo khoa, ghi chép và hoàn thành nhiệm vụ học tập.
  - #strong[Năng lực giao tiếp và hợp tác:] Tương tác hiệu quả trong
    nhóm, trình bày, thảo luận, phân tích các giải pháp giải phương
    trình.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống, đề xuất được phương pháp giải quyết vấn đề (chuyển phương
    trình về dạng bậc hai đã biết cách giải).
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Thiết lập điều kiện
    xác định của phương trình, sử dụng các phép biến đổi tương đương
    hoặc hệ quả để đưa phương trình đã cho về dạng phương trình bậc hai.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa một số vấn đề
    thực tiễn (nếu có) bằng phương trình quy về bậc hai.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tìm tòi, chịu khó hoàn thành các nhiệm vụ
  cá nhân và nhóm.
- #strong[Trung thực:] Nghiêm túc trong việc tự đánh giá, đánh giá đồng
  đẳng và báo cáo kết quả chính xác.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ được giao, có ý thức
  giúp đỡ bạn bè cùng tiến bộ.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính giáo viên, bảng,
  phấn.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập nhóm (dạng giấy hoặc dạng trực tuyến trên Google
    Forms/Quizizz).
  - Máy tính cầm tay cá nhân.
  - Tài liệu hướng dẫn sử dụng phần mềm/ứng dụng để kiểm tra nghiệm
    phương trình (ví dụ: máy tính đồ thị online như Desmos, hoặc các ứng
    dụng giải toán trên điện thoại).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
  quyết: Giải quyết những phương trình phức tạp, chưa biết cách giải
  ngay bằng các kiến thức đã học (Phương trình bậc nhất, bậc hai).

]
#nd-hd[

  - Giáo viên (GV) đưa ra ví dụ về một phương trình bậc hai đã học, sau
    đó chuyển sang một phương trình mới: $sqrt(x^2 - 4 x + 4) = x$ hoặc
    $sqrt(x + 2) = x$.
  - #strong[Nhiệm vụ:] Học sinh (HS) quan sát, nhận xét về sự khác biệt
    và thử giải phương trình mới theo kiến thức đã có.

]
#sp-hd[
  chứa ẩn dưới dấu căn] (chưa biết cách giải quyết triệt để). HS đề xuất
  sơ bộ về cách giải (ví dụ: bình phương hai vế) và nhận ra các vấn đề
  phát sinh (ví dụ: có thể làm xuất hiện nghiệm ngoại lai).

// ]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (GV):] GV trình chiếu và đặt câu hỏi:
    \"Làm thế nào để tìm nghiệm của phương trình $sqrt(x + 2) = x$? Nó
    có khác gì so với phương trình bậc hai đã học?\" \* #strong[Bước 2:
    Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ trợ):] HS làm việc
    cá nhân, thử giải quyết phương trình. GV quan sát, khuyến khích HS
    bình phương hai vế và thảo luận về kết quả.
  - #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo
    cáo, thảo luận):] GV gọi 1-2 HS trình bày kết quả thử giải. GV đặt
    câu hỏi gợi mở: \"Kết quả có chắc chắn là nghiệm hay không? Cần điều
    kiện gì để đảm bảo tương đương?\"
  - #strong[Bước 4: Kết luận, nhận định (GV):] GV nhận định, chốt lại
    vấn đề: \"Đây là phương trình chứa ẩn dưới dấu căn. Để giải được, ta
    phải tìm ra #strong[phép biến đổi tương đương] hoặc #strong[điều
    kiện kèm theo] để quy nó về phương trình bậc hai. Bài học hôm nay sẽ
    giúp các em giải quyết triệt để dạng toán này.\"

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
Hoạt động này được chia thành 2 hoạt động thành phần để hình thành kiến
thức một cách rõ ràng:

===== 2.1. Hoạt động thành phần 2.1: Phương trình dạng $sqrt(f\(x\)) = sqrt(g\(x\))$ (25 phút)
#mt-hd[
  tương đương để giải phương trình dạng $sqrt(f\(x\)) = sqrt(g\(x\))$.

]
#nd-hd[
  lập phép biến đổi tương đương.

  - #strong[Ví dụ minh họa:] Giải phương trình
    $sqrt(3 x - 5) = sqrt(x + 1)$.
  - #strong[Nhiệm vụ nhóm:] Thảo luận, tìm điều kiện để bình phương hai
    vế không làm thay đổi tập nghiệm, từ đó rút ra công thức tương
    đương.

]
#sp-hd[
  $sqrt(f\(x\)) = sqrt(g\(x\)) arrow.l.r.double {f\(x\)gt.eq 0 upright(" (hoặc ") g\(x\)gt.eq 0 upright(")")\
  f\(x\)= g\(x\) med$ và giải được #strong[Ví dụ minh họa]: $x = 3$.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (GV):] GV giao #strong[Ví dụ minh họa]
    và yêu cầu HS thảo luận nhóm, đề xuất điều kiện và cách biến đổi.
  - #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
    trợ):] Các nhóm thực hiện giải ví dụ. GV theo dõi, gợi ý: \"Dấu căn
    luôn không âm, vậy cần điều kiện gì cho biểu thức dưới dấu căn?\"
  - #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo
    cáo, thảo luận):] Đại diện 1 nhóm trình bày kết quả và quy trình.
    Các nhóm khác nhận xét, bổ sung.
  - #strong[Bước 4: Kết luận, nhận định (GV):] GV chuẩn hóa kiến thức về
    phép biến đổi tương đương và quy trình giải.

===== 2.2. Hoạt động thành phần 2.2: Phương trình dạng $sqrt(f\(x\)) = g\(x\)$ (35 phút)
]
#mt-hd[
  tương đương để giải phương trình dạng $sqrt(f\(x\)) = g\(x\)$.

]
#nd-hd[
  cặp đôi.

  - #strong[Ví dụ minh họa:] Giải phương trình $sqrt(2 x + 1) = x - 1$.
  - #strong[Nhiệm vụ cá nhân/cặp đôi:] Phân tích sự khác biệt với dạng
    2.1 (vế phải không có căn), từ đó tìm ra điều kiện chặt chẽ hơn để
    biến đổi tương đương.

]
#sp-hd[
  $sqrt(f\(x\)) = g\(x\)arrow.l.r.double {g\(x\)gt.eq 0\
  f\(x\)=\[g\(x\)\]^2 med$ và giải được #strong[Ví dụ minh họa]: $x = 4$
  (loại nghiệm $x = 0$).

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (GV):] GV giao #strong[Ví dụ minh họa]
    và yêu cầu HS thảo luận cặp đôi: \"Vế phải là $g\(x\)$, không có
    căn, vậy điều kiện $f\(x\)gt.eq 0$ đã đủ chưa? Cần thêm điều kiện gì
    để $sqrt(f\(x\)) = g\(x\)$ là tương đương với bình phương hai vế?\"
  - #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
    trợ):] HS làm việc. GV gợi ý: \"Vế trái $sqrt(f\(x\))$ luôn không
    âm, vậy vế phải $g\(x\)$ phải thế nào?\"
  - #strong[Bước 3: Báo cáo, thảo luận và Tích hợp Năng lực số (GV tổ
    chức, điều hành; HS báo cáo, thảo luận):]
    - Đại diện cặp đôi trình bày lời giải và quy trình.
    - GV hướng dẫn HS #strong[sử dụng ứng dụng/phần mềm] (ví dụ: máy
      tính đồ thị online) để kiểm tra nghiệm $x = 0$ và $x = 4$ có thỏa
      mãn phương trình gốc hay không, nhằm trực quan hóa việc loại
      nghiệm. (Biểu hiện của #strong[Năng lực số]:
      $upright(bold(N)) upright(bold(L))_(upright(bold(4.2)))$ - Ứng
      dụng công nghệ số để xử lí, giải quyết vấn đề, nhiệm vụ học tập).
  - #strong[Bước 4: Kết luận, nhận định (GV):] GV chuẩn hóa kiến thức,
    nhấn mạnh #strong[điều kiện] $g\(x\)gt.eq 0$ là bắt buộc.

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
  năng giải các dạng phương trình $sqrt(f\(x\)) = sqrt(g\(x\))$ và
  $sqrt(f\(x\)) = g\(x\)$. Phát triển kĩ năng làm việc nhóm, phân tích
  và tổng hợp thông tin.

]
#nd-hd[

  - GV chuẩn bị 3-4 bài tập (2 dạng) có đáp án được mã hóa.
  - #strong[Ví dụ bài tập:]
    - Bài 1: Giải phương trình $sqrt(2 x^2 + 3 x - 1) = sqrt(x + 2)$.
    - Bài 2: Giải phương trình $sqrt(x - 3) = 5 - x$.
  - #strong[Nhiệm vụ nhóm:] Các nhóm giải bài tập nhanh và chính xác
    nhất để tìm ra từ khóa giải mã.

]
#sp-hd[
  khóa giải mã chính xác (được dán lên bảng hoặc gửi qua hình thức trực
  tuyến).

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (GV):] Chia lớp thành các nhóm nhỏ
    (4-5 HS). GV trình bày luật chơi và giao bài tập.
  - #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
    trợ):] Các nhóm thảo luận, phân công thành viên giải bài, kiểm tra
    chéo kết quả. GV quan sát, kịp thời hỗ trợ các nhóm gặp khó khăn về
    điều kiện hoặc phép biến đổi.
  - #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo
    cáo, thảo luận):] Nhóm hoàn thành nhanh nhất công bố đáp án. GV gọi
    đại diện nhóm trình bày lời giải mẫu của 1-2 bài khó.
  - #strong[Bước 4: Kết luận, nhận định (GV):] GV nhận xét, khen thưởng,
    chốt lại các lỗi sai phổ biến (quên điều kiện, sai sót khi giải
    phương trình bậc hai).

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
  giải phương trình vào giải quyết các vấn đề thực tiễn (nếu có) hoặc
  các bài toán nâng cao, mở rộng.

]
#nd-hd[
  thực tế\".

  - #strong[Nhiệm vụ 1 (Cá nhân):] Vẽ #strong[sơ đồ tư duy] tóm tắt toàn
    bộ quy trình giải hai dạng phương trình đã học.
  - #strong[Nhiệm vụ 2 (Khuyến khích):] Tìm kiếm (hoặc tự xây dựng) một
    bài toán thực tế có thể mô hình hóa thành một trong hai dạng phương
    trình đã học.

]
#sp-hd[

  - Sơ đồ tư duy trình bày rõ ràng, khoa học về quy trình giải (nội dung
    và hình thức báo cáo).
  - Bài toán thực tế kèm lời giải.

]
#tc-hd[

  - GV giao nhiệm vụ, hướng dẫn HS về nhà thực hiện.
  - GV thông báo sẽ thu và đánh giá sản phẩm #strong[Sơ đồ tư duy] vào
    tiết học tiếp theo, đồng thời lựa chọn một số bài toán thực tế của
    HS để chia sẻ và thảo luận trong lớp.

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
