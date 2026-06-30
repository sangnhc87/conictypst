// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 1",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Ôn tập và hệ thống hóa các kiến thức cơ bản của Chương I, bao gồm:
  - Sự đồng biến, nghịch biến của hàm số.
  - Cực trị của hàm số.
  - Giá trị lớn nhất, giá trị nhỏ nhất của hàm số trên một đoạn/khoảng.
  - Đường tiệm cận của đồ thị hàm số.
  - Khảo sát sự biến thiên và vẽ đồ thị hàm số.
  - Giải quyết các bài toán liên quan đến sự tương giao của đồ thị và
    tham số.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động ôn tập và hệ thống hóa kiến
    thức; tự đánh giá mức độ hiểu bài của bản thân qua các hoạt động
    kiểm tra.
  - #strong[Giao tiếp và hợp tác:] Hợp tác hiệu quả trong nhóm; trình
    bày, thảo luận, bảo vệ ý kiến của nhóm một cách rõ ràng, mạch lạc.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích được các yêu cầu
    của bài toán; đề xuất được các phương pháp giải quyết tối ưu.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Lập luận logic, sử
    dụng chính xác ngôn ngữ Toán học khi trình bày lời giải.
  - #strong[Năng lực mô hình hóa toán học:] Nhận dạng và chuyển đổi các
    vấn đề thực tế về mô hình khảo sát hàm số.
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng thành thạo
    các bước khảo sát hàm số để giải quyết các dạng bài tập khác nhau.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - #strong[NL sử dụng và khai thác công cụ số:]
    - #strong[Biểu hiện:] Học sinh sử dụng phần mềm vẽ đồ thị (ví dụ:
      GeoGebra, Desmos) để kiểm tra, phân tích sự biến thiên và các đặc
      điểm của đồ thị hàm số đã khảo sát.
    - #strong[Mục đích:] Đối chiếu trực quan kết quả tính toán với hình
      ảnh đồ thị.
  - #strong[NL an toàn và trách nhiệm số:] Trích dẫn nguồn thông tin,
    hình ảnh (nếu có) khi làm bài thuyết trình hoặc sơ đồ tư duy trên
    môi trường số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành các nhiệm vụ học tập được giao một cách
  nghiêm túc, tự giác.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ của nhóm, có thái độ
  trung thực trong đánh giá kết quả học tập.
- #strong[Trung thực:] Thể hiện tính chính xác và cẩn thận trong tính
  toán và lập luận.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:]
  - Máy chiếu, máy tính kết nối mạng, loa (nếu cần).
  - Tài liệu ôn tập/Bài tập tổng hợp.
  - Phiếu học tập (bản giấy hoặc Google Forms/Quizizz/Kahoot).
  - Phần mềm/ứng dụng hỗ trợ vẽ đồ thị (GeoGebra/Desmos) đã chuẩn bị sẵn
    các ví dụ cần minh họa.
- #strong[Học sinh:]
  - Sách giáo khoa, vở ghi, dụng cụ học tập.
  - Điện thoại thông minh/máy tính bảng/máy tính cá nhân (nếu có) để
    tham gia hoạt động số (quiz, tra cứu, sử dụng phần mềm vẽ đồ thị).
  - Giấy A0 hoặc giấy note khổ lớn để lập Sơ đồ tư duy.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
==== Hoạt động 1: TỔNG HỢP KIẾN THỨC (35 phút)
- #strong[Mục tiêu:] Học sinh hệ thống hóa kiến thức trọng tâm của
  Chương I thông qua hoạt động nhóm và sơ đồ tư duy.
- #strong[Phương pháp:] Hợp tác nhóm, Sơ đồ tư duy.
- #strong[Hình thức tổ chức:] Hoạt động nhóm (4-5 HS/nhóm).

+ #strong[Chuyển giao nhiệm vụ (5 phút):]
  - GV chia lớp thành các nhóm, giao nhiệm vụ vẽ một #strong[Sơ đồ tư
    duy] để tổng hợp tất cả kiến thức đã học trong Chương I (Sự đồng
    biến/nghịch biến, Cực trị, GTLN/GTNN, Tiệm cận, Khảo sát và vẽ đồ
    thị).
  - GV nhấn mạnh cấu trúc: Từ nhánh chính là \"Ứng dụng đạo hàm\" mở ra
    các nhánh con là các nội dung chính, sau đó là các quy tắc, công
    thức, ví dụ minh họa.
+ #strong[Thực hiện nhiệm vụ (15 phút):]
  - Các nhóm thảo luận, phân công nhiệm vụ và thực hiện vẽ Sơ đồ tư duy
    trên giấy A0.
  - GV quan sát, hỗ trợ và giải đáp thắc mắc.
+ #strong[Báo cáo và thảo luận (15 phút):]
  - GV mời ngẫu nhiên 1-2 nhóm trình bày sản phẩm (#strong[kĩ năng giao
    tiếp, thuyết trình]).
  - Các nhóm khác nhận xét, bổ sung.
  - #strong[GV chốt lại kiến thức:] Sử dụng Sơ đồ tư duy tối ưu nhất
    (hoặc của GV đã chuẩn bị) để nhấn mạnh các kiến thức cốt lõi, dễ sai
    sót. \*\*\*\*

==== Hoạt động 2: LUYỆN TẬP VÀ PHÁT TRIỂN NĂNG LỰC SỐ (55 phút)
- #strong[Mục tiêu:] Học sinh vận dụng kiến thức vào giải quyết các dạng
  bài tập đa dạng, rèn luyện kỹ năng phân tích, tổng hợp và phát triển
  năng lực số.
- #strong[Phương pháp:] Luyện tập, Trò chơi học tập, Nghiên cứu trường
  hợp, Tích hợp Năng lực số.
- #strong[Hình thức tổ chức:] Cá nhân kết hợp với hoạt động nhóm và đối
  kháng.

+ #strong[Luyện tập Vận dụng và Tích hợp Năng lực số (25 phút):]

  - #strong[Bước 1: Giải quyết vấn đề (15 phút):]
    - GV chuẩn bị 4-5 bài tập tổng hợp, phân loại theo độ khó.
    - GV giao mỗi nhóm giải 1-2 bài tập và chuẩn bị lời giải chi tiết.
  - #strong[Bước 2: Báo cáo tích hợp Năng lực số (10 phút):]
    - Mời nhóm lên trình bày lời giải.
    - #strong[Biểu hiện Năng lực số:] Sau khi trình bày xong, yêu cầu
      nhóm sử dụng #strong[Phần mềm vẽ đồ thị] (ví dụ: GeoGebra/Desmos)
      để vẽ đồ thị hàm số trong bài tập đó.
    - Nhóm nhận xét và đối chiếu trực quan về cực trị, tiệm cận, sự đồng
      biến/nghịch biến so với kết quả tính toán. \*\*\*\*
    - GV làm mẫu và hướng dẫn nếu cần.

+ #strong[Trò chơi \"Tiếp sức Toán học\" (25 phút):]

  - #strong[Mục tiêu:] Vận dụng nhanh, rèn luyện tốc độ và kĩ năng làm
    việc nhóm.
  - #strong[Cách thức:]
    - GV chuẩn bị 5-7 câu hỏi trắc nghiệm ngắn, tập trung vào các kiến
      thức cơ bản (ví dụ: Tính nhanh tiệm cận, xác định cực trị qua bảng
      biến thiên).
    - Các nhóm cử đại diện luân phiên lên giải bài tập trên bảng/giấy
      trong thời gian quy định (ví dụ 1-2 phút/câu).
    - Thành viên tiếp theo chỉ được lên khi thành viên trước hoàn
      thành/hết giờ.
    - Nhóm nào hoàn thành đúng và nhanh nhất là nhóm chiến thắng.
  - #strong[GV nhận xét, sửa lỗi, và khen thưởng.]

+ #strong[Củng cố và Dặn dò (5 phút):]

  - GV tóm tắt lại các kiến thức quan trọng nhất và các lỗi thường gặp
    mà học sinh cần lưu ý (ví dụ: điều kiện $a eq.not 0$ đối với hàm bậc
    ba; kiểm tra tiệm cận ngang và tiệm cận đứng).
  - #strong[Nhiệm vụ về nhà:] Yêu cầu HS hoàn thành các bài tập còn lại
    trong SGK/SBT và chuẩn bị bài học tiếp theo.

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

