// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 6",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Hệ thống hóa] các kiến thức cơ bản về #strong[Hàm số bậc hai]
  và #strong[Dấu của tam thức bậc hai] (bao gồm: tập xác định, sự biến
  thiên, đồ thị, trục đối xứng, đỉnh parabol, bảng biến thiên, nghiệm,
  trục hoành).
- #strong[Vận dụng] kiến thức về hàm số bậc hai và dấu của tam thức bậc
  hai để #strong[giải quyết] các bài toán liên quan đến tìm tập xác
  định, vẽ đồ thị, lập bảng biến thiên, giải bất phương trình bậc hai,
  và ứng dụng vào các bài toán thực tiễn.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực Chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm kiếm, hệ thống hóa
    kiến thức đã học, tự đánh giá được mức độ hiểu bài của bản thân.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    lắng nghe và phản biện ý kiến của bạn, cùng nhau hoàn thành nhiệm vụ
    được giao.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống, lựa chọn phương pháp tối ưu để giải quyết các dạng bài tập
    khác nhau.
- #strong[Năng lực Đặc thù (Năng lực Toán học):]
  - #strong[Năng lực Tư duy và lập luận toán học:] Phân tích các mối
    quan hệ giữa hàm số bậc hai và đồ thị của nó; lập luận logic khi xét
    dấu của tam thức bậc hai.
  - #strong[Năng lực Mô hình hóa toán học:] Sử dụng hàm số bậc hai để mô
    tả các hiện tượng, bài toán thực tế (ví dụ: quỹ đạo bay, lợi nhuận,
    thiết kế).
  - #strong[Năng lực Giao tiếp toán học:] Trình bày rõ ràng, chính xác
    các bước giải toán, giải thích ý nghĩa của kết quả.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, nghiêm túc trong quá trình ôn tập và
  luyện tập.
- #strong[Trung thực:] Thẳng thắn trao đổi, báo cáo kết quả thực tế, tôn
  trọng sự thật toán học.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ cá nhân và nhóm được
  giao; có ý thức giúp đỡ bạn bè cùng tiến bộ.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:]
  - Máy chiếu, máy tính, tài liệu ôn tập, phiếu bài tập.
  - Tài khoản/Phần mềm #strong[GeoGebra] hoặc #strong[Desmos] để minh
    họa đồ thị, bảng biến thiên (phục vụ mục tiêu phát triển năng lực
    số).
  - Phiếu học tập (bản giấy hoặc bản số).
- #strong[Học sinh:]
  - Sách giáo khoa, vở ghi, dụng cụ học tập.
  - Điện thoại thông minh/Máy tính bảng (nếu có, dùng để truy cập
    GeoGebra/Desmos trong HĐ 2) hoặc máy tính cầm tay có chức năng vẽ đồ
    thị.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
==== Hoạt động 1: Tổng hợp kiến thức (15 phút) 💡
- #strong[Mục tiêu:] Hệ thống hóa kiến thức trọng tâm của chương về Hàm
  số bậc hai và Dấu của tam thức bậc hai.
- #strong[Phương pháp:] #strong[Sơ đồ tư duy (Mindmap) nhóm] kết hợp
  #strong[thảo luận].
- #strong[Tiến trình:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Chia nhóm (2 phút):] Giáo viên chia lớp thành 4-5 nhóm nhỏ
    (4-5 HS/nhóm).
  + #strong[Thực hiện nhiệm vụ (8 phút):]
    - Các nhóm nhận giấy A0 (hoặc dùng ứng dụng Mindmap trực tuyến nếu
      lớp có đủ thiết bị - #strong[Tích hợp NL số]).
    - Nhiệm vụ: #strong[Vẽ Sơ đồ tư duy] tổng hợp các kiến thức cơ bản
      về #strong[Hàm số bậc hai
      (]$y = a x^2 + b x + c\,a eq.not 0$#strong[)] và #strong[Dấu của
      tam thức bậc hai (]$f\(x\)= a x^2 + b x + c\,a eq.not 0$#strong[)]
      (bao gồm: Tập xác định, Bảng biến thiên, Đồ thị (Đỉnh, trục đối
      xứng), Công thức, Định lí về dấu).
    - Giáo viên quan sát, định hướng và hỗ trợ.
  + #strong[Báo cáo và Chốt kiến thức (5 phút):]
    - Giáo viên mời 1-2 nhóm trình bày nhanh Sơ đồ tư duy của mình
      (khuyến khích sử dụng Camera chiếu lên nếu dùng bản giấy hoặc
      trình chiếu màn hình nếu dùng bản số). #strong[Tăng cường kĩ năng
      thuyết trình, giao tiếp.]
    - Giáo viên nhận xét, bổ sung, chốt lại các công thức, định lí quan
      trọng nhất cần nhớ.
  ]

==== Hoạt động 2: Luyện tập và Ứng dụng (28 phút) ✍️
- #strong[Mục tiêu:] Vận dụng kiến thức đã tổng hợp để giải quyết các
  bài toán từ cơ bản đến nâng cao.
- #strong[Phương pháp:] #strong[Trò chơi học tập \"Tiếp sức Toán học\"]
  kết hợp #strong[thao tác thực hành trên công cụ số].
- #strong[Tiến trình:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Chuẩn bị (2 phút):]
    - Giáo viên phát 4-5 phiếu bài tập (mỗi nhóm một bộ) gồm 5-6 bài tập
      đa dạng (Tìm tập xác định, Lập bảng biến thiên, Vẽ đồ thị, Giải
      BPT bậc hai, 1 bài toán thực tế).
    - Quy tắc trò chơi: Nhóm giải nhanh, đúng và có lời giải rõ ràng
      nhất sẽ thắng.
  + #strong[Thực hiện Luyện tập - Tiếp sức (20 phút):]
    - #strong[Lượt 1 (5 phút):] #strong[Bài toán cơ bản] (Tìm tập xác
      định, tìm đỉnh, trục đối xứng). #strong[Làm việc nhóm:] Cả nhóm
      thảo luận nhanh, cử thành viên ghi đáp án.
    - #strong[Lượt 2 (7 phút):] #strong[Bài toán nâng cao] (Giải bất
      phương trình $a x^2 + b x + c lt.eq 0$ có tham số hoặc bài toán
      thực tế). #strong[Làm việc nhóm sâu hơn:] Phân tích đề, đưa ra
      chiến lược giải.
    - #strong[Lượt 3 (8 phút):] #strong[Kiểm tra đồ thị bằng công nghệ
      số] và #strong[Ứng dụng].
      - Giáo viên yêu cầu các nhóm (hoặc đại diện nhóm) sử dụng điện
        thoại/máy tính để #strong[vẽ đồ thị] của một hàm số bậc hai cho
        trước trên #strong[GeoGebra/Desmos] và nhận xét sự biến
        thiên/dấu của tam thức dựa trên đồ thị.
      - #strong[Biểu hiện NL số:] #strong[Thao tác nhanh, chính xác]
        trên phần mềm để kiểm chứng kết quả hoặc tìm kiếm lời giải trực
        quan, từ đó #strong[phân tích mối quan hệ giữa hàm số và đồ
        thị]. #strong[Tăng cường kĩ năng phân tích thông tin.]
  + #strong[Tổng kết và Đánh giá (6 phút):]
    - Giáo viên mời đại diện 2-3 nhóm trình bày một số bài giải khó.
    - Giáo viên chữa bài, chốt đáp án, và trao thưởng cho nhóm thắng
      cuộc.
    - #strong[Đánh giá:] Giáo viên đánh giá khả năng vận dụng kiến thức,
      kĩ năng làm việc nhóm, giao tiếp và đặc biệt là khả năng sử dụng
      công nghệ số để hỗ trợ giải quyết vấn đề.
  ]

==== Hoạt động 3: Dặn dò (2 phút) 🚀
- #strong[Giáo viên:]
  - Yêu cầu học sinh xem lại các kiến thức đã ôn tập, hoàn thành các bài
    tập còn lại (nếu có).
  - Chuẩn bị cho bài kiểm tra giữa kì/cuối kì (tùy theo phân phối chương
    trình).

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

