// ════════════════════════════════════════════════════════════════════
// GIAO-AN-MAU.TYP  —  Mẫu giáo án trống (điền nội dung vào đây)
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
//
// HƯỚNG DẪN:
//   1. Copy file này, đổi tên theo bài: giao-an-bai01-dao-ham.typ
//   2. Điền thông tin vào phần #show: giao-an.with(...)
//   3. Điền nội dung vào từng phần
//   4. Biên dịch: typst compile giao-an-bai01.typ --root ../../..
//   5. Xuất DOCX: python3 xuat-docx.py giao-an-bai01.typ
// ════════════════════════════════════════════════════════════════════

#import "modules/giao-an.typ": *

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "BÀI [số]. [TÊN BÀI HỌC]",
  thoi-gian: "2 tiết",
)

// ════════════════════════════════════════════════════════════════════
#phan("I", "MỤC TIÊU")
// ════════════════════════════════════════════════════════════════════

#muc("1", "kiến thức")

- [Mục tiêu kiến thức 1...]
- [Mục tiêu kiến thức 2...]
- [Mục tiêu kiến thức 3...]

#muc("2", "năng lực")

*Năng lực đặc thù (Năng lực Toán học):*

#nl("Năng lực tư duy và lập luận toán học")[
  [Mô tả năng lực tư duy trong bài này...]
]
#nl("Năng lực mô hình hóa toán học")[
  [Mô tả năng lực mô hình hóa...]
]
#nl("Năng lực giải quyết vấn đề toán học")[
  [Mô tả năng lực GQVD...]
]

*Năng lực chung:*

#nl("Năng lực tự chủ và tự học")[Chủ động đọc, nghiên cứu SGK, tài liệu tham khảo...]
#nl("Năng lực giao tiếp và hợp tác")[Tích cực tham gia thảo luận nhóm, trình bày ý kiến...]

*Năng lực số (theo TT 02/2025/TT-BGDĐT):*

#nls("3.1.NC1a")[Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định dạng khác nhau.]
#nls("3.1.NC1b")[Chỉ ra được những cách thể hiện bản thân thông qua việc tạo ra các nội dung số.]

#muc("3", "phẩm chất")

#pc("Chăm chỉ")[Tích cực tìm tòi, nghiên cứu tài liệu, hoàn thành các nhiệm vụ học tập được giao.]
#pc("Trách nhiệm")[Hoàn thành tốt nhiệm vụ được phân công khi làm việc nhóm; có trách nhiệm với kết quả học tập của bản thân và nhóm.]
#pc("Trung thực")[Thẳng thắn, nghiêm túc trong quá trình báo cáo và đánh giá kết quả học tập.]

// ════════════════════════════════════════════════════════════════════
#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
// ════════════════════════════════════════════════════════════════════

- *Thiết bị dạy học:* Máy chiếu, máy tính, bảng nhóm, giấy A0/A4, bút dạ.
- *Học liệu:*
  - Sách giáo khoa Toán [Khối lớp] — Bộ [tên bộ sách].
  - Phiếu học tập (in ấn hoặc bản mềm sử dụng Google Forms/Quizizz).
  - [Học liệu bổ sung nếu có...]

// ════════════════════════════════════════════════════════════════════
#phan("III", "TIẾN TRÌNH DẠY HỌC")
// ════════════════════════════════════════════════════════════════════

// ─── HOẠT ĐỘNG 1: MỞ ĐẦU (10 phút) ────────────────────────────────
#hd(1, "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", 10)

#ten-hd[[Tên hoạt động mở đầu — ví dụ: "Khởi động — Đặt vấn đề"]]

#mt-hd[[Tạo hứng thú, giúp HS nhớ lại kiến thức liên quan và bước đầu nhận ra nhu cầu về [chủ đề bài học].]]

#nd-hd[
  - GV đưa ra tình huống thực tiễn/câu hỏi gợi mở: [mô tả tình huống...]
  - *Tình huống:* [Mô tả cụ thể tình huống gắn với thực tiễn...]
  - *Nhiệm vụ:*
    - Cá nhân HS suy nghĩ và trả lời câu hỏi...
    - HS dùng bút, thước kẻ để phác hoạ...
]

#sp-hd[
  - [Câu trả lời/sản phẩm dự kiến của HS...]
  - GV chuẩn hóa: [Kết luận/sản phẩm chuẩn...]
]

#tc-hd[
  #buoc(1, "Giao nhiệm vụ", 2)[GV trình bày tình huống và yêu cầu HS suy nghĩ cá nhân.]
  #buoc(2, "Thực hiện nhiệm vụ", 5)[HS tự nghiên cứu và đưa ra câu trả lời. GV theo dõi, gợi ý. #du-kien[[Mô tả dự kiến khó khăn HS gặp phải...]]]
  #buoc(3, "Báo cáo, thảo luận", 2)[GV mời 1–2 HS trình bày, GV nhận xét, dẫn dắt.]
  #buoc(4, "Kết luận, nhận định", 1)[GV chốt vấn đề, ghi tên bài học, chuyển sang Hoạt động 2.]
]

// ─── HOẠT ĐỘNG 2: HÌNH THÀNH KIẾN THỨC (60 phút) ──────────────────
#hd(2, "Hình thành kiến thức mới/Giải quyết vấn đề", 60)

// Nếu có hoạt động thành phần, dùng hd-tp:
#hd-tp("2.1", "[Tên hoạt động thành phần 2.1]", 30)

#ten-hd[[Tên hoạt động thành phần 2.1]]
#mt-hd[[HS nắm vững [định nghĩa/tính chất...] thông qua hoạt động khám phá.]]

#nd-hd[
  - HS làm việc nhóm (4–5 HS/nhóm).
  - *Nhiệm vụ:*
    - [Mô tả nhiệm vụ nhóm...]
    - [Nhiệm vụ bổ sung...]
  #nl-so[_Tạo ra nội dung số_ (vẽ hình bằng GeoGebra) và _Trao đổi, hợp tác_ bằng công cụ số (chia sẻ link/ảnh qua Zalo/Padlet).]
]

#sp-hd[
  - *Nội dung:* [Kiến thức HS rút ra được...]
  - *Hình thức:* [Hình thức trình bày sản phẩm...]
]

#tc-hd[
  #buoc(1, "Giao nhiệm vụ", 3)[GV chiếu yêu cầu, hướng dẫn HS truy cập GeoGebra và chia nhóm.]
  #buoc(2, "Thực hiện nhiệm vụ", 12)[HS thảo luận, đọc SGK và thực hiện nhiệm vụ. GV quan sát, hỗ trợ kỹ thuật số và kiến thức.]
  #buoc(3, "Báo cáo, thảo luận", 10)[GV mời đại diện 2 nhóm trình bày. Các nhóm khác đặt câu hỏi, phản biện.]
  #buoc(4, "Kết luận, nhận định", 5)[GV chuẩn hóa kiến thức, chốt [định nghĩa/tính chất/định lý]. #vi-du[[Ví dụ minh họa cụ thể có tính toán...]]]
]

#hd-tp("2.2", "[Tên hoạt động thành phần 2.2]", 30)

#ten-hd[[Tên hoạt động thành phần 2.2]]
#mt-hd[[HS phát biểu, chứng minh (hoặc giải thích) và vận dụng thành thạo [các tính chất/định lý...].]]

#nd-hd[
  - HS làm việc nhóm (4–5 HS/nhóm).
  - *Nhiệm vụ:* Mỗi nhóm được giao nghiên cứu [một hoặc hai tính chất] trong [số] tính chất/định lý:
    - Nhóm 1: [Tính chất 1...]
    - Nhóm 2: [Tính chất 2...]
    - Nhóm 3: [Tính chất 3...]
    - Nhóm 4: [Tính chất 4...]
  - *Yêu cầu:* Trình bày tóm tắt nội dung và đưa ra một ví dụ áp dụng.
  #nl-so[Mỗi nhóm dùng công cụ vẽ sơ đồ tư duy trực tuyến (MindMeister, Canva) để tóm tắt các tính chất vừa nghiên cứu.]
]

#sp-hd[
  - *Nội dung:* Bản tóm tắt/chứng minh/ví dụ minh họa các tính chất.
  - *Hình thức:* Bản trình bày PowerPoint/Sơ đồ tư duy trực tuyến.
]

#tc-hd[
  #buoc(1, "Giao nhiệm vụ", 2)[GV phân công nhiệm vụ cho các nhóm và hướng dẫn cách trình bày (sơ đồ tư duy).]
  #buoc(2, "Thực hiện nhiệm vụ", 15)[HS làm việc nhóm, nghiên cứu SGK, thảo luận, tìm ví dụ và thiết kế sơ đồ tư duy. GV quan sát, hỗ trợ và định hướng.]
  #buoc(3, "Báo cáo, thảo luận", 10)[Đại diện các nhóm lần lượt trình bày. Các nhóm khác đặt câu hỏi, phản biện.]
  #buoc(4, "Kết luận, nhận định", 3)[GV chuẩn hóa lại các tính chất, nhấn mạnh các tính chất thường dùng và chốt ví dụ minh họa: #vi-du[[Ví dụ minh họa tính chất cụ thể với biểu thức toán...]]]
]

// ─── HOẠT ĐỘNG 3: LUYỆN TẬP (15 phút) ────────────────────────────
#hd(3, "Luyện tập", 15)

#ten-hd[Củng cố và Phát triển Kỹ năng Vận dụng.]

#mt-hd[HS vận dụng linh hoạt [định nghĩa/tính chất] để giải các bài tập cơ bản.]

#nd-hd[
  Hệ thống các bài tập được thiết kế trên Phiếu học tập (hoặc công cụ Quizizz/Google Forms) với các dạng:

  #dang("1", "Nhận biết")[
    #bai(1, dap-an: [[đáp án...]])[[Đề bài 1 mức nhận biết — ví dụ tính toán đơn giản...]]
  ]

  #dang("2", "Vận dụng tính chất")[
    #bai(2, dap-an: [[đáp án...]])[[Đề bài 2 mức vận dụng — rút gọn biểu thức, chứng minh...]]
  ]

  #dang("3", "Vận dụng cao")[
    #bai(3, dap-an: [[đáp án...]])[[Đề bài 3 mức VDC — bài toán tổng hợp...]]
  ]
]

#sp-hd[
  - Đáp án, lời giải chi tiết cho 3 bài tập.
]

#tc-hd[
  #buoc(1, "Giao nhiệm vụ", 1)[GV giao phiếu học tập (hoặc link Quizizz) và yêu cầu HS làm việc cá nhân trong 8 phút.]
  #buoc(2, "Thực hiện nhiệm vụ", 8)[HS tự lực giải quyết các bài tập. GV theo dõi, nhắc nhở về thời gian và gợi ý khi cần.]
  #buoc(3, "Báo cáo, thảo luận", 5)[GV mời 3 HS lên trình bày lời giải chi tiết cho 3 bài tập, HS khác nhận xét, bổ sung.]
  #nl-so[_Tạo ra nội dung số._ (Sản phẩm bài tập trên Google Forms/Quizizz).]
]

// ─── HOẠT ĐỘNG 4: VẬN DỤNG (5 phút) ──────────────────────────────
#hd(4, "Vận dụng", 5)

#ten-hd[Khám phá ứng dụng thực tiễn và mở rộng.]

#mt-hd[Phát triển năng lực mô hình hóa, giúp HS thấy được ứng dụng của [chủ đề bài học] trong thực tiễn và mở rộng kiến thức.]

#nd-hd[
  - *Nhiệm vụ:*
    - Tìm hiểu về ứng dụng của [chủ đề] trong lĩnh vực thực tiễn (Vật lí, Kinh tế, Kỹ thuật...).
    - [Kiến thức mở rộng tùy chọn...]
  - *Yêu cầu:* Học sinh phát hiện/đề xuất vấn đề trong thực tiễn có liên quan.
]

#sp-hd[
  - Bài báo cáo/ghi chép về ứng dụng thực tiễn hoặc bản tóm tắt công thức/biểu diễn [nội dung mở rộng].
]

#tc-hd[
  #buoc(1, "Giao nhiệm vụ", 1)[GV giao nhiệm vụ tìm hiểu ngoài giờ học.]
  #buoc(2, "Thực hiện nhiệm vụ", "[Thời gian ở nhà]")[HS thực hiện ngoài giờ học, tìm kiếm thông tin trên mạng (sử dụng công cụ số), tổng hợp kiến thức.]
  #buoc(3, "Nộp báo cáo", "[Thời điểm phù hợp]")[GV yêu cầu HS nộp sản phẩm (báo cáo ngắn gọn, video, hoặc hình ảnh) vào buổi học tiếp theo để trao đổi, chia sẻ và đánh giá.]
  #nl-so[_Tìm kiếm và xử lí dữ liệu số_ (tìm kiếm thông tin ứng dụng trên Internet).]
]
