#import "../style.typ": lesson-box, teacher-note, checkpoint

= Tiết 4 · Mô hình hóa, kiểm chứng và vận dụng

== Bài toán sản xuất hoàn chỉnh

Xưởng mộc ở tiết 1 lãi *300 nghìn đồng* mỗi bàn và *200 nghìn đồng* mỗi ghế. Hãy chọn số lượng để lãi cao nhất.

*Chọn biến và đơn vị.* $x$ là số bàn, $y$ là số ghế; mỗi biến tính bằng *chiếc*. Trong thực tế $x,y$ là *số nguyên không âm*.

*Lập ràng buộc.*

$ cases(x >= 0, y >= 0, 2x+y <= 8, x+2y <= 10) $

*Hàm mục tiêu.* Lợi nhuận, tính bằng nghìn đồng, là $L=300x+200y=100(3x+2y)$. Từ tiết 3, $3x+2y$ lớn nhất bằng $14$ tại $(2;4)$. Do đó nên làm *2 bàn và 4 ghế*, lãi tối đa *1.400 nghìn đồng = 1,4 triệu đồng*. Hai con số này đều nguyên nên phương án liên tục tìm được cũng khả thi về mặt sản xuất.

#lesson-box([Kiểm tra phương án trước khi kết luận], [
  Với $(2;4)$: gỗ $2 times 2+4=8$ m², công $2+2 times 4=10$ giờ, lợi nhuận $300 times 2+200 times 4=1400$ nghìn đồng. Ghi đầy đủ *đơn vị* và *ý nghĩa* của kết quả.
], accent: rgb("#047857"), fill: rgb("#ecfdf5"))

== Mô hình liên tục và yêu cầu số nguyên

Hình vẽ nửa mặt phẳng cho phép tọa độ thực; điều đó phù hợp khi $x,y$ là kg nguyên liệu hoặc giờ công. Nếu $x,y$ đếm vật hoàn chỉnh, chỉ các *điểm lưới nguyên* trong miền mới khả thi. Đỉnh của miền liên tục có thể không nguyên; khi ấy không được làm tròn từng tọa độ rồi tuyên bố tối ưu. Cần xét các cặp nguyên lân cận và kiểm tra lại *mọi ràng buộc*.

Ví dụ, nếu phương án liên tục là $(2,4;3,6)$ chiếc, làm tròn thành $(2;4)$ có thể vi phạm giới hạn giờ hoặc không tối ưu trong các phương án nguyên. Trường hợp này là lời cảnh báo về *phương pháp*, không phải phương án của xưởng ở trên.

== Bài tập phân tầng để thảo luận trên lớp

*Mức 1 · nhận biết.* Một câu lạc bộ có nhiều nhất 24 giờ tình nguyện. Hoạt động A cần 2 giờ mỗi lần, B cần 3 giờ mỗi lần. Gọi số lần là $x,y$. Viết điều kiện thời gian và điều kiện không âm.

*Mức 2 · vận dụng.* Thêm giới hạn ngân sách $5x+2y<=30$. Xét các phương án $(3;4)$, $(6;2)$, $(0;8)$: phương án nào thỏa cả thời gian lẫn ngân sách? Hãy chỉ rõ điều kiện sai cho mỗi phương án không hợp lệ.

*Mức 3 · mở rộng.* Lợi ích từ A là 4 điểm, từ B là 5 điểm. Hãy tìm phương án nguyên tối ưu của hệ $cases(x>=0,y>=0,2x+3y<=24,5x+2y<=30)$; so sánh cách liệt kê các điểm lưới khả thi với cách xét các đỉnh liên tục. Khi giải, phải phân biệt “giá trị tốt nhất trên miền thực” với “giá trị tốt nhất trên các điểm nguyên”.

#teacher-note([
  Với bài mức 2: $(3;4)$ dùng 18 giờ, 23 đơn vị ngân sách nên hợp lệ; $(6;2)$ dùng 18 giờ, 34 ngân sách nên không hợp lệ; $(0;8)$ dùng 24 giờ, 16 ngân sách nên hợp lệ. Bài mức 3: giao hai bờ xiên là $(42/11;60/11)$, cho giá trị liên tục $468/11 approx 42,55$; trên các điểm nguyên, tốt nhất là $(3;6)$ với giá trị $42$. Cho nhóm nhanh liệt kê $x$ từ $0$ đến $6$, rồi tìm $y$ lớn nhất khả thi ở mỗi $x$ để chứng minh đáp án nguyên.
])

== Tự đánh giá cuối chủ đề

Học sinh có thể tự trả lời bốn câu: “Tôi đã kiểm tra đủ *mọi* bất phương trình chưa?”, “Bờ nào được lấy?”, “Miền có rỗng hoặc không bị chặn không?”, “Nếu có đơn vị chiếc, tôi đã xét tính nguyên chưa?”. Đây là danh sách kiểm tra trước khi nộp lời giải.

#checkpoint("04")
