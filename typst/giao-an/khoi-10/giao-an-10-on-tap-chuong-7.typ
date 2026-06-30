// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 7",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Hệ thống hóa] các kiến thức cơ bản của Chương VII:
  - Tọa độ của vectơ, các phép toán vectơ.
  - Biểu thức tọa độ của tích vô hướng, ứng dụng để tính độ dài đoạn
    thẳng, khoảng cách, góc giữa hai vectơ.
  - Phương trình đường thẳng: phương trình tổng quát, tham số.
  - Công thức tính khoảng cách từ một điểm đến một đường thẳng.
  - Phương trình đường tròn.
- #strong[Vận dụng] linh hoạt các kiến thức đã học để giải quyết các bài
  toán liên quan đến tọa độ trong mặt phẳng.

#muc("2", "NĂNG LỰC")
===== Năng lực chung
- #strong[Năng lực tự chủ và tự học:] Chủ động ôn tập, tìm kiếm tài
  liệu, tự đánh giá được mức độ hiểu bài của bản thân thông qua việc
  giải quyết các nhiệm vụ học tập.
- #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm, trình
  bày, bảo vệ ý kiến của mình, lắng nghe và phản biện ý kiến của bạn bè.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình huống,
  lựa chọn phương pháp (đại số/hình học) tối ưu để giải quyết các bài
  toán tọa độ.

===== Năng lực đặc thù (Năng lực Toán học)
- #strong[Năng lực tư duy và lập luận Toán học:] Lập luận logic trong
  việc thiết lập và chứng minh các công thức (nếu cần), phân tích mối
  quan hệ giữa các đối tượng hình học và đại số.
- #strong[Năng lực mô hình hóa Toán học:] Chuyển các bài toán hình học
  thực tế về mô hình tọa độ để giải quyết.
- #strong[Năng lực giải quyết vấn đề Toán học:] Vận dụng các công thức
  tọa độ để giải bài tập, tìm ra phương pháp giải tối ưu nhất.
- #strong[Năng lực sử dụng công cụ, phương tiện học Toán:] Sử dụng máy
  tính cầm tay, phần mềm hình học động (như #strong[GeoGebra]) hoặc công
  cụ hỗ trợ khác.

===== Năng lực số (Theo TT 02/2025/TT-BGDĐT)
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.
- 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
  dạng khác nhau,
- 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc tạo
  ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, chủ động tìm tòi kiến thức, hoàn thành
  nhiệm vụ được giao.
- #strong[Trung thực:] Thẳng thắn trong thảo luận, tự đánh giá đúng năng
  lực của bản thân.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ của bản thân và
  nhóm, thể hiện tinh thần xây dựng.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy chiếu, máy tính, phiếu học tập, phần mềm
  GeoGebra đã chuẩn bị sẵn các ví dụ minh họa về đường thẳng, đường
  tròn. Các câu hỏi trắc nghiệm/tự luận tổng hợp.
- #strong[Học sinh:] Sách giáo khoa, vở ghi, máy tính cầm tay, điện
  thoại/máy tính bảng (có cài đặt phần mềm sơ đồ tư duy hoặc GeoGebra
  nếu cần, khuyến khích sử dụng).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
==== 1. HOẠT ĐỘNG KHỞI ĐỘNG (5 phút)
- #strong[Mục tiêu:] Tạo hứng thú, huy động kiến thức nền.
- #strong[Phương pháp:] #strong[Trò chơi học tập] (Đuổi hình bắt chữ/Ai
  nhanh hơn).
- #strong[Cách thức thực hiện:]
  - GV đưa ra 3-4 hình ảnh/biểu tượng đại diện cho các kiến thức trọng
    tâm (ví dụ: hình ảnh vectơ, công thức tính khoảng cách, phương trình
    đường tròn).
  - HS xung phong/làm việc cá nhân, nhanh chóng gọi tên kiến thức hoặc
    công thức liên quan đến hình ảnh.
  - GV nhận xét, tuyên dương và dẫn dắt vào bài ôn tập.

#hd("2", "TỔNG HỢP KIẾN THỨC", "15 phút")
- #strong[Mục tiêu:] Hệ thống hóa kiến thức trọng tâm của chương VII.
- #strong[Phương pháp:] #strong[Dạy học hợp tác] (Làm việc nhóm) kết hợp
  với #strong[Phát triển Năng lực số] (Thiết kế sơ đồ tư duy).
- #strong[Cách thức thực hiện:]
  - GV chia lớp thành 4 nhóm.
  - #strong[Nhiệm vụ:] Mỗi nhóm được giao tổng hợp một mảng kiến thức
    chính của chương (Ví dụ: Nhóm 1: Vectơ và các phép toán; Nhóm 2:
    Phương trình đường thẳng; Nhóm 3: Phương trình đường tròn; Nhóm 4:
    Các công thức về khoảng cách, góc).
  - Các nhóm thảo luận, cử thư ký #strong[sử dụng công cụ số (phần mềm
    sơ đồ tư duy trực tuyến)] hoặc vẽ sơ đồ tư duy trên giấy khổ lớn để
    trình bày các công thức, định nghĩa, chú ý quan trọng của mảng kiến
    thức được giao.
  - #strong[Tích hợp Năng lực số:] #strong[Biểu hiện:] HS sử dụng thành
    thạo phần mềm thiết kế sơ đồ tư duy hoặc các ứng dụng vẽ sơ đồ, chọn
    lựa font, màu sắc, hình ảnh phù hợp để tạo ra sản phẩm số trực quan.
  - Đại diện nhóm (có thể sử dụng #strong[máy chiếu/màn hình tương tác]
    để trình bày sơ đồ tư duy số) lên #strong[thuyết trình] và bổ sung
    kiến thức cho các nhóm khác.
  - GV nhận xét, chốt kiến thức và chuẩn hóa Sơ đồ tư duy tổng thể của
    cả chương.

#hd("3", "LUYỆN TẬP VÀ PHÁT TRIỂN KĨ NĂNG", "20 phút")
- #strong[Mục tiêu:] Vận dụng kiến thức để giải quyết các bài tập tổng
  hợp và phát triển kĩ năng phân tích, tổng hợp.
- #strong[Phương pháp:] #strong[Học tập giải quyết vấn đề]
  (Problem-based learning) kết hợp #strong[Làm việc nhóm] và
  #strong[Năng lực số] (Kiểm tra bằng công cụ).
- #strong[Cách thức thực hiện:]
  - GV đưa ra 3-4 bài tập tổng hợp, mức độ từ nhận biết đến vận dụng cao
    (Mỗi bài liên quan đến 2-3 mảng kiến thức của chương).
  - Ví dụ:
    - Bài 1 (Nhận biết/Thông hiểu): Tính tọa độ vectơ, độ dài đoạn
      thẳng, cosin góc.
    - Bài 2 (Vận dụng): Viết phương trình đường thẳng qua điểm A và
      vuông góc/song song với đường thẳng d cho trước.
    - Bài 3 (Vận dụng cao): Viết phương trình đường tròn thỏa mãn điều
      kiện tiếp xúc với đường thẳng, đi qua hai điểm.
  - #strong[Làm việc nhóm:] HS làm việc nhóm để giải quyết các bài tập.
    #strong[Khuyến khích] các nhóm tìm nhiều cách giải và thảo luận để
    chọn ra cách tối ưu nhất.
  - #strong[Trình bày và Phản biện:] Một nhóm xung phong/được chỉ định
    trình bày lời giải chi tiết (có thể sử dụng máy tính/máy chiếu).
  - Các nhóm khác nhận xét, phản biện, đặt câu hỏi về các bước giải.
  - #strong[Tích hợp Năng lực số:] #strong[Biểu hiện:] HS #strong[sử
    dụng GeoGebra] để minh họa hình học của bài toán (ví dụ: vẽ đường
    thẳng, đường tròn, kiểm tra vị trí tương đối) hoặc dùng #strong[máy
    tính cầm tay] để kiểm tra nhanh các giá trị tính toán.
    #strong[\(Biểu hiện: Kỹ năng lựa chọn công cụ số phù hợp để giải
    quyết vấn đề).]
  - GV chốt lại phương pháp giải, nhấn mạnh các lỗi sai thường gặp.

==== 4. HOẠT ĐỘNG KẾT THÚC (5 phút)
- #strong[Mục tiêu:] Củng cố, giao nhiệm vụ về nhà.
- #strong[Cách thức thực hiện:]
  - GV củng cố lại toàn bộ kiến thức qua câu hỏi ngắn (ví dụ: \"3 công
    thức quan trọng nhất của chương này là gì?\").
  - #strong[Nhiệm vụ về nhà:]
    - Hoàn thiện Sơ đồ tư duy (nếu làm trên giấy) và chia sẻ trong nhóm.
    - Xem lại các bài tập đã giải.
    - Làm thêm các bài tập trong SGK/SBT để chuẩn bị cho bài kiểm tra
      (nếu có).

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

