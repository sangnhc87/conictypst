// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 4",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Hệ thống hóa] các khái niệm, định lí, tính chất cơ bản về:
  - Xác định giao tuyến, giao điểm, thiết diện.
  - Vị trí tương đối giữa đường thẳng và mặt phẳng, giữa hai mặt phẳng.
  - Chứng minh hai đường thẳng song song, đường thẳng song song với mặt
    phẳng, hai mặt phẳng song song.
  - Tính chất của phép chiếu song song.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm kiếm, hệ thống hóa kiến thức
    và hoàn thành nhiệm vụ học tập.
  - #strong[Giao tiếp và hợp tác:] Tích cực tham gia thảo luận nhóm,
    trình bày và bảo vệ ý kiến cá nhân/nhóm một cách rõ ràng, mạch lạc.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống, lựa
    chọn phương pháp tối ưu để giải quyết các bài toán về quan hệ song
    song trong không gian.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Nhận biết, chứng minh
    các mối quan hệ song song bằng lập luận logic, suy diễn.
  - #strong[Năng lực mô hình hóa toán học:] Mô tả các đối tượng và quan
    hệ trong không gian bằng hình vẽ và kí hiệu toán học.
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán:] Sử dụng
    thước, compa, phần mềm hình học (như GeoGebra) để vẽ hình và kiểm
    chứng kết quả.
  - #strong[Năng lực giao tiếp toán học:] Trình bày rõ ràng lời giải,
    lập luận.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành nhiệm vụ được giao, chủ động ôn tập kiến
  thức.
- #strong[Trung thực:] Thẳng thắn trong thảo luận, tự đánh giá đúng năng
  lực.
- #strong[Trách nhiệm:] Có ý thức hợp tác trong nhóm, hoàn thành tốt
  phần việc được giao.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy tính/máy chiếu, phiếu học tập, các slide tổng
  hợp kiến thức cơ bản (có thể dùng sơ đồ tư duy).
- #strong[Học sinh:] Sách giáo khoa, vở ghi, máy tính cá nhân/điện thoại
  thông minh có kết nối internet (phục vụ hoạt động năng lực số), phần
  mềm GeoGebra (nếu có thể cài đặt trước).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
==== Hoạt động 1: Tổng hợp kiến thức (15 phút)
- #strong[Mục tiêu:] Học sinh hệ thống hóa, tóm tắt các kiến thức trọng
  tâm của chương bằng sơ đồ tư duy điện tử, phát triển năng lực số, năng
  lực tự chủ và tự học.
- #strong[Phương pháp:] #strong[Dạy học hợp tác] (Làm việc nhóm) kết hợp
  #strong[Tích hợp năng lực số] (Sử dụng công cụ số để tổng hợp).

+ #strong[Chuyển giao nhiệm vụ:]
  - #strong[Giáo viên] (GV) chia lớp thành 4-5 nhóm (mỗi nhóm 4-5 HS).
  - GV yêu cầu các nhóm sử dụng #strong[công cụ số] (như #strong[Canva],
    #strong[Mindmap online], #strong[Google Docs]\...) để lập một
    #strong[Sơ đồ tư duy (Mindmap) điện tử] về toàn bộ kiến thức chương
    4 (bao gồm các định nghĩa, định lí, tính chất, cách chứng minh).
  - #emph[Biểu hiện Năng lực số:] Học sinh tìm kiếm, lựa chọn, và sử
    dụng công cụ số (phần mềm mindmap) để #strong[tổ chức thông tin] và
    #strong[trình bày kiến thức] một cách trực quan.
+ #strong[Thực hiện nhiệm vụ:]
  - Các nhóm thảo luận, phân công nhiệm vụ và tiến hành xây dựng sơ đồ
    tư duy trên thiết bị số.
  - #strong[GV quan sát, hỗ trợ] các nhóm về mặt kiến thức và kỹ thuật
    sử dụng công cụ.
+ #strong[Báo cáo và thảo luận (Thuyết trình):]
  - GV mời #strong[đại diện 1-2 nhóm] trình bày nhanh sơ đồ tư duy của
    nhóm mình (chiếu lên màn hình).
  - Các nhóm khác nhận xét, bổ sung.
  - #strong[GV chốt lại] các kiến thức trọng tâm bằng cách dùng sơ đồ tư
    duy đã chuẩn bị sẵn, nhấn mạnh những lỗi sai/nhầm lẫn thường gặp.

==== Hoạt động 2: Luyện tập (30 phút)
- #strong[Mục tiêu:] Vận dụng kiến thức để giải quyết các bài tập tổng
  hợp, rèn luyện kỹ năng phân tích, tổng hợp thông tin, và giải quyết
  vấn đề.
- #strong[Phương pháp:] #strong[Dạy học giải quyết vấn đề] (qua các trò
  chơi học tập) và #strong[Dạy học hợp tác] (Làm việc nhóm).

===== A. Vòng 1: Trò chơi \"Tiếp sức chứng minh\" (15 phút)
+ #strong[Chuyển giao nhiệm vụ:]
  - GV chuẩn bị 3-4 bài tập tổng hợp về #strong[chứng minh quan hệ song
    song] (chứng minh đường thẳng song song mặt phẳng, hai mặt phẳng
    song song) với độ khó tăng dần.
  - GV yêu cầu các nhóm quay lại vị trí và tiếp tục làm việc theo nhóm.
  - #strong[Luật chơi:] Các nhóm làm bài tập trên phiếu học tập hoặc
    bảng phụ. Mỗi thành viên chỉ thực hiện một bước chứng minh rồi
    chuyển cho thành viên kế tiếp. Nhóm nào hoàn thành và trình bày lời
    giải #strong[chính xác, khoa học và nhanh nhất] sẽ thắng.
+ #strong[Thực hiện nhiệm vụ:]
  - Các nhóm thực hiện #strong[giải bài tập tiếp sức].
  - #strong[GV theo dõi], đánh giá kỹ năng lập luận, khả năng hợp tác và
    phân tích tình huống của học sinh.
+ #strong[Báo cáo và thảo luận (Phân tích và tổng hợp):]
  - GV gọi nhóm thắng cuộc hoặc nhóm làm tốt nhất lên #strong[trình bày
    lời giải] (phân tích đề bài, tóm tắt các bước chứng minh, sử dụng
    các định lí).
  - GV cùng cả lớp #strong[phân tích] lời giải, #strong[tổng hợp] các
    phương pháp giải bài toán chứng minh.

===== B. Vòng 2: Bài tập thực hành với GeoGebra (15 phút)
- #emph[Lưu ý: Hoạt động này có thể được điều chỉnh thành bài tập tính
  toán thông thường nếu điều kiện thiết bị không cho phép.]

+ #strong[Chuyển giao nhiệm vụ:]
  - GV đưa ra một bài tập về #strong[tìm giao điểm, giao tuyến, hoặc
    thiết diện] của một hình chóp/lăng trụ.
  - GV yêu cầu học sinh #strong[tự vẽ hình] trong phần mềm
    #strong[GeoGebra] (hoặc trình bày trên giấy nếu không có thiết bị)
    và thực hiện các bước tìm kiếm theo yêu cầu của đề bài.
  - #strong[Biểu hiện Năng lực số:] Học sinh sử dụng #strong[GeoGebra
    3D] để #strong[mô hình hóa] bài toán không gian, trực quan hóa lời
    giải và #strong[kiểm chứng kết quả] của mình.
+ #strong[Thực hiện nhiệm vụ:]
  - Học sinh làm việc cá nhân hoặc theo cặp để thực hành.
+ #strong[Báo cáo và kết thúc:]
  - GV mời 1-2 học sinh #strong[trình bày cách dựng hình] và #strong[tìm
    ra kết quả] trên GeoGebra (hoặc phân tích các bước tìm kiếm trên
    hình vẽ giấy).
  - #strong[GV đánh giá] và tổng kết toàn bộ nội dung bài học.

=== Củng cố (2 phút)
- #strong[GV yêu cầu 1 HS nhắc lại] 3 nội dung quan trọng nhất của
  chương.
- #strong[Dặn dò:] Xem lại các bài tập đã giải, chuẩn bị cho bài kiểm
  tra (nếu có).

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

