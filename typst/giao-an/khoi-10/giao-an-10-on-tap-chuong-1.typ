// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
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
- Hệ thống hóa các kiến thức cơ bản về *mệnh đề*, mệnh đề chứa biến, mệnh đề phủ định, mệnh đề kéo theo và mệnh đề tương đương.
- Ôn tập và củng cố các khái niệm về *tập hợp*, các tập hợp số, và các phép toán trên tập hợp (giao, hợp, hiệu, phần bù).
- Vận dụng kiến thức để giải quyết các bài toán tổng hợp liên quan đến mệnh đề và tập hợp, đặc biệt là bài toán thực tế dùng biểu đồ Ven.

#muc("2", "NĂNG LỰC")
- *Năng lực chung:* 
  - *Tự chủ và tự học:* Chủ động ôn tập và hệ thống hóa kiến thức đã học.
  - *Giao tiếp và hợp tác:* Tích cực thảo luận nhóm, chia sẻ phương pháp giải bài tập.
- *Năng lực đặc thù:* 
  - *Tư duy và lập luận toán học:* Suy luận logic khi xét tính đúng sai của mệnh đề, thực hiện các phép toán tập hợp.
  - *Mô hình hóa toán học:* Sử dụng biểu đồ Ven để giải quyết bài toán đếm số lượng phần tử.
- *Năng lực số:* Sử dụng phần mềm (nếu có) hoặc sơ đồ tư duy để số hóa hệ thống kiến thức.

#muc("3", "PHẨM CHẤT")
- *Chăm chỉ:* Tích cực làm bài tập ôn tập chương, hệ thống hóa bài học.
- *Trách nhiệm:* Có trách nhiệm với nhiệm vụ học tập của cá nhân và nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- *Thiết bị:* Máy chiếu, bảng phụ, phấn màu, phiếu học tập số 1 (ôn tập).
- *Học liệu:* SGK Toán 10, SBT, sơ đồ tư duy tóm tắt chương 1 do học sinh chuẩn bị trước.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Hệ thống hóa kiến thức (Khởi động)", "20 phút")
- *Tên hoạt động:* Báo cáo Sơ đồ tư duy chương Mệnh đề và Tập hợp.
- *Phương pháp/Kĩ thuật:* Thảo luận nhóm, Thuyết trình.

#mt-hd[
- Học sinh nhớ lại, tái hiện và hệ thống hóa được cấu trúc kiến thức cốt lõi của Chương 1.
]
#nd-hd[
- GV yêu cầu các nhóm treo hoặc trình chiếu Sơ đồ tư duy đã chuẩn bị ở nhà.
- GV tóm tắt lại 2 mảng kiến thức chính:
  + *Mệnh đề:* Định nghĩa, phủ định ($overline(P)$), kéo theo ($P => Q$), tương đương ($P <=> Q$), kí hiệu $forall, exists$.
  + *Tập hợp:* Tập con, hai tập hợp bằng nhau, các phép toán $A inter B$, $A union B$, $A without B$, $C_E A$.
]
#sp-hd[
- Sơ đồ tư duy hoàn chỉnh, khoa học và đẹp mắt của các nhóm.
]
#tc-hd[
- *Bước 1:* Đại diện 1-2 nhóm lên bảng thuyết trình sơ đồ của nhóm mình.
- *Bước 2:* Các nhóm khác nhận xét, đặt câu hỏi phản biện.
- *Bước 3:* GV nhận xét, chấm điểm và chốt lại sơ đồ kiến thức chuẩn xác nhất để HS ghi nhớ.
]

#hd("2", "Luyện tập tổng hợp", "50 phút")
- *Tên hoạt động:* Giải quyết các bài toán trọng tâm Chương 1.
- *Phương pháp/Kĩ thuật:* Dạy học giải quyết vấn đề, Luyện tập thực hành.

#mt-hd[
- Thành thạo kĩ năng xét tính đúng sai của mệnh đề, viết mệnh đề phủ định.
- Thành thạo kĩ năng tìm giao, hợp, hiệu của các tập hợp, đặc biệt là các tập hợp số (khoảng, đoạn, nửa khoảng).
]
#nd-hd[
- GV phát *Phiếu học tập* hoặc trình chiếu các bài tập:
  + *Bài 1:* Xét tính đúng sai và lập mệnh đề phủ định của các mệnh đề chứa $forall, exists$.
  + *Bài 2:* Viết các tập hợp sau dưới dạng liệt kê các phần tử.
  + *Bài 3:* Cho các tập hợp $A = [-3; 5)$, $B = (2; 7]$. Tìm $A inter B, A union B, A without B, B without A$.
]
#sp-hd[
- Lời giải chi tiết, chính xác của học sinh trên bảng và trong vở.
  + $A inter B = (2; 5)$
  + $A union B = [-3; 7]$
]
#tc-hd[
- GV tổ chức cho HS làm bài cá nhân trong 15 phút.
- Gọi 3-4 HS lên bảng trình bày đồng thời.
- GV sửa bài, đặc biệt lưu ý HS cách biểu diễn tập hợp số trên trục số để không bị sai sót khi lấy giao, hợp.
]

#hd("3", "Vận dụng thực tiễn (Biểu đồ Ven)", "20 phút")
- *Tên hoạt động:* Bài toán thực tế về số lượng phần tử của tập hợp.
- *Phương pháp/Kĩ thuật:* Hoạt động nhóm.

#mt-hd[
- Vận dụng kiến thức tập hợp (cụ thể là biểu đồ Ven) để giải quyết bài toán đếm trong thực tế.
]
#nd-hd[
- *Bài toán:* Lớp 10A có 45 học sinh. Trong đó có 25 học sinh giỏi Toán, 20 học sinh giỏi Văn, 12 học sinh giỏi cả Toán và Văn. 
  + Hỏi lớp 10A có bao nhiêu học sinh giỏi ít nhất một trong hai môn Toán hoặc Văn?
  + Có bao nhiêu học sinh không giỏi cả hai môn này?
]
#sp-hd[
- Học sinh vẽ biểu đồ Ven minh họa 2 tập hợp giao nhau.
- Số HS giỏi ít nhất 1 môn: $25 + 20 - 12 = 33$ (học sinh).
- Số HS không giỏi môn nào (trong 2 môn): $45 - 33 = 12$ (học sinh).
]
#tc-hd[
- GV chia lớp thành các nhóm 4 người, thảo luận và vẽ sơ đồ giải bài toán vào bảng phụ.
- Nhóm nào xong nhanh nhất lên treo bảng và trình bày.
- GV nhận xét, chốt phương pháp dùng công thức: $n(A union B) = n(A) + n(B) - n(A inter B)$.
]
