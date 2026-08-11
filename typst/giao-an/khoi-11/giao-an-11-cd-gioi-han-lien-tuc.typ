// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Chuyên đề: Giới hạn và Hàm số liên tục trong thực tiễn",
  thoi-gian: "2 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Hiểu được ý nghĩa thực tiễn của khái niệm giới hạn tại vô cực thông qua các mô hình tiệm cận (dược động học, sức chứa môi trường trong sinh thái học, chi phí trung bình trong kinh tế).
- Nhận biết được điểm gián đoạn của hàm số thông qua mô hình hàm bậc thang (cước taxi, cước gửi xe).
- Hiểu được ứng dụng của hàm số liên tục trong thiết kế hệ thống (thuế lũy tiến) và công nghiệp (đường ray, khúc cua).
- Vận dụng định lý giá trị trung gian để chứng minh sự tồn tại nghiệm của phương trình mô phỏng sự giao cắt quỹ đạo.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Giải quyết vấn đề:] Đề xuất cách tính toán các ngưỡng bão hòa trong tự nhiên và cách thiết lập một bảng giá cước hợp lý (không bị nhảy vọt bất thường).
  - #strong[Giao tiếp và hợp tác:] Thảo luận nhóm để phân tích biểu đồ hàm bậc thang và hàm tính thuế.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực mô hình hóa toán học:] Chuyển đổi bài toán kinh tế (tính thuế, tính tiền cước) thành hàm số cho bởi nhiều công thức.
  - #strong[Năng lực tư duy và lập luận toán học:] Lập luận tính liên tục của hàm số bằng cách tính giới hạn trái, giới hạn phải.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - #strong[Sử dụng và khai thác công nghệ số:] Dùng phần mềm Geogebra / Desmos trên máy tính hoặc điện thoại để vẽ đồ thị hàm số cho bởi nhiều công thức, từ đó trực quan hóa điểm gián đoạn và sự liên tục.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Chịu khó tìm tòi ý nghĩa của toán học trong các lĩnh vực khác (sinh học, kinh tế, dược học).
- #strong[Trách nhiệm:] Nhận thức được tính công bằng của toán học trong hệ thống thuế thu nhập, từ đó có ý thức chấp hành luật pháp.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, bảng phụ, máy tính cầm tay, thiết bị thông minh để cài Geogebra/Desmos.
- #strong[Học liệu:] Sách giáo khoa Toán 11, tài liệu chuyên đề "Ứng dụng Giới hạn - Liên tục" (các bài toán thực tiễn), đồ thị in sẵn.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "10 phút")
- #strong[Tên hoạt động:] Chuyến đi Taxi và sự "nhảy vọt" của đồng hồ cước
- #strong[Phương pháp/Kĩ thuật:] Trực quan, gợi mở, đàm thoại.

#mt-hd[
- Giới thiệu thực tế về hàm số không liên tục (hàm bậc thang) thông qua đồng hồ tính cước taxi hoặc cước gửi xe.
- Nêu vấn đề: Tại sao khi vừa bước qua một phút, số tiền lại tăng vọt lên một nấc?
]
#nd-hd[
- GV chiếu hình ảnh hoặc đoạn video ngắn về đồng hồ tính cước taxi.
- GV đưa ra tình huống (Bài toán M3): Cước gửi xe máy là $5.000$đ cho $2$ giờ đầu; sau đó cứ bước sang giờ tiếp theo thì cộng thêm $2.000$đ.
- Cùng học sinh vẽ phác thảo đồ thị biểu diễn số tiền theo thời gian $x$.
]
#sp-hd[
- Đồ thị thu được là các đoạn thẳng nằm ngang, đứt quãng tại các điểm $x=2, 3, 4,...$ (dạng bậc thang).
]
#tc-hd[
- #strong[Bước 1:] GV nêu tình huống, yêu cầu HS tính nhẩm số tiền khi gửi $1.5$ giờ, $2$ giờ, $2.1$ giờ.
- #strong[Bước 2:] HS nhận xét sự chênh lệch tiền cước khi thời gian thay đổi rất nhỏ (từ $2.0$ sang $2.01$ giờ).
- #strong[Bước 3:] GV kết luận: Đồ thị hàm số này bị "đứt" tại các mốc thời gian. Toán học gọi đây là sự *gián đoạn*.
]

#hd("2", "Hình thành kiến thức/Giải quyết vấn đề", "50 phút - Chia thành 2 HĐ thành phần")
==== 2.1. Hoạt động thành phần 2.1: Giới hạn vô cực và Điểm bão hòa (25 phút)
- #strong[Tên hoạt động:] Tìm điểm bão hòa của sự phát triển
- #strong[Nội dung:] 
  - Ôn tập kiến thức tính giới hạn của hàm số khi $x -> +oo$.
  - Phân tích Bài toán Vi khuẩn (M1): Số lượng vi khuẩn $P(t) = 5000 / (1 + 49 e^(-0.2t))$. Hỏi số lượng sẽ tiến tới đâu khi $t -> +oo$?
  - Phân tích Bài toán Chi phí trung bình (M2): $A(x) = C(x)/x$.
- #strong[Sản phẩm:] Học sinh tính được $lim_{t -> +oo} P(t) = 5000$ và $lim_{x -> +oo} A(x) = +oo$, hiểu được ý nghĩa của "sức chứa môi trường" và "quá tải chi phí".
- #strong[Tổ chức thực hiện:]
  - GV giao mỗi nửa lớp thảo luận 1 bài toán (M1 sinh thái học, M2 kinh tế học).
  - HS trình bày phép tính giới hạn và giải thích ý nghĩa thực tế.
  - GV nhấn mạnh: Giới hạn vô cực chính là công cụ để dự báo tương lai dài hạn của một mô hình.

==== 2.2. Hoạt động thành phần 2.2: Hàm số liên tục và Thuế thu nhập lũy tiến (25 phút)
- #strong[Tên hoạt động:] Thiết kế hệ thống thuế công bằng
- #strong[Nội dung:]
  - Phân tích Bài toán tính thuế (M5): Thuế được tính theo hàm cho bởi nhiều công thức. $f(x) = 0$ nếu $x <= 50$ và $f(x) = 0.1(x-50) + A$ nếu $x > 50$.
  - Yêu cầu đặt ra: Làm sao để tiền thuế không bị "nhảy vọt" (như cước taxi) khi thu nhập vừa chớm qua mốc 50 triệu.
  - Sử dụng định nghĩa: Hàm số liên tục tại điểm $x_0 = 50$ khi và chỉ khi giới hạn trái bằng giới hạn phải và bằng giá trị tại điểm đó.
- #strong[Sản phẩm:] Học sinh lập phương trình $lim_{x->50^-} f(x) = lim_{x->50^+} f(x)$ và giải ra hằng số $A = 0$.
- #strong[Tổ chức thực hiện:]
  - GV diễn giải: "Nếu hàm số gián đoạn, một người lương 50 triệu không nộp đồng nào, lương 50.1 triệu có thể phải nộp liền 5 triệu. Như vậy không công bằng."
  - HS áp dụng quy tắc tính giới hạn trái/phải để tìm hằng số $A$.
  - *Tích hợp Năng lực số:* GV bật Geogebra, biểu diễn 2 đồ thị với $A=5$ (gián đoạn) và $A=0$ (liên tục) để HS thấy rõ sự "trơn tru" của đồ thị liên tục.

#hd("3", "Luyện tập", "20 phút")
- #strong[Tên hoạt động:] Giải cứu quỹ đạo (Định lý giá trị trung gian)
- #strong[Phương pháp/Kĩ thuật:] Luyện tập nhóm, thảo luận.

#mt-hd[
- Vận dụng tính liên tục và hệ quả của định lý giá trị trung gian ($f(a).f(b) < 0$) để chứng minh sự tồn tại nghiệm.
]
#nd-hd[
- Bài toán: Quỹ đạo của 2 vật thể trong không gian được mô phỏng bởi các hàm số liên tục. Xét hàm số $h(t) = f(t) - g(t)$ đo khoảng cách giữa 2 vật thể.
- Nếu $h(1) = 5 > 0$ và $h(2) = -3 < 0$, kết luận gì về khả năng va chạm trong khoảng thời gian $(1; 2)$?
]
#sp-hd[
- HS áp dụng hệ quả, khẳng định tồn tại ít nhất một thời điểm $t_0 in (1; 2)$ sao cho $h(t_0) = 0$, nghĩa là 2 vật thể sẽ cắt nhau/va chạm.
]
#tc-hd[
- GV cho HS thảo luận đôi, trình bày luận điểm logic bằng văn bản.
- GV nhận xét, tổng kết ý nghĩa ứng dụng của định lý giá trị trung gian trong lập trình mô phỏng vật lý và radar.
]

#hd("4", "Vận dụng", "10 phút")
- #strong[Tên hoạt động:] Thiết kế giá cước linh hoạt
- #strong[Phương pháp/Kĩ thuật:] Dự án nhỏ tại nhà.

#mt-hd[
- Vận dụng năng lực mô hình hóa để tự sáng tạo hàm số thực tế.
]
#nd-hd[
- #strong[Nhiệm vụ:] Hãy đóng vai nhà quản lý một công ty viễn thông. Thiết kế một gói cước Internet hàng tháng sao cho:
  - 50 GB đầu tiên có giá cố định $C_1$.
  - Phần vượt lưu lượng được tính theo công thức tuyến tính.
  - Phải đảm bảo đồ thị hàm số tính cước là một hàm #strong[liên tục] (không gây bức xúc cho khách hàng khi bị nhảy vọt).
- #strong[Tích hợp Năng lực số:] HS nộp bản thiết kế kèm theo đồ thị minh họa vẽ bằng Geogebra hoặc Desmos.
]
#sp-hd[
- Sản phẩm đồ thị và công thức hàm tính cước.
]
#tc-hd[
- GV giao nhiệm vụ, hướng dẫn cách sử dụng Desmos để vẽ đồ thị có điều kiện miền xác định `f(x) = {0 < x < 50: ...}`.
- Thu sản phẩm vào buổi học tiếp theo.
]

#figure(
  align(center)[#table(
    columns: (32.22%, 45.62%),
    align: (auto,auto,),
    table.header(table.cell(align: left)[], table.cell(align: center)[Duyệt
      Kế hoạch bài dạy
      
      của tổ Toán
      
      Ngày \...... tháng \...... năm \......
      
      ],),
    table.hline(),
  )]
  , kind: table
)
