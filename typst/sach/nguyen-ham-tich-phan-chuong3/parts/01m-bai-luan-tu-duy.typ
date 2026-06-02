#import "../_theme.typ": *

== 22. Sáu Bài Luận Tư Duy Nhỏ Về Nguyên Hàm Và Tích Phân

#essay-box("1. Công thức là phần nổi của tảng băng")[
  Điều người mới học thấy là bảng nguyên hàm và vài phép biến đổi. Điều người học sâu thấy là một lý thuyết về việc phục hồi toàn cục từ quy luật cục bộ. Cùng một chương, nhưng hai trải nghiệm hoàn toàn khác nhau.

  Ví dụ, với $a(t) = 6t$, người học máy móc chỉ thấy thao tác "lấy nguyên hàm để được $v(t) = 3t^2 + C$". Người học sâu thì thấy mình đang phục hồi *toàn bộ gia đình lịch sử vận tốc* có cùng luật gia tốc cục bộ.
]

#essay-box("2. Đơn vị đo là người gác cổng của ý nghĩa")[
  Nếu $v(t)$ có đơn vị là mét trên giây, thì $v(t) dif t$ có đơn vị là mét. Nếu $rho(x)$ là kilogram trên mét, thì $rho(x) dif x$ có đơn vị là kilogram. Kiểm tra đơn vị đo thường cho ta biết bài toán có đang được dựng đúng hay không.

  Ví dụ, nếu lưu lượng nước là $4$ lít mỗi phút và ta xét trong $3$ phút, thì tổng nước gần đúng là $4 * 3 = 12$ lít. Nhưng nếu ai đó vô thức đem cùng lưu lượng ấy nhân với mét thay vì phút, đơn vị lập tức trở thành vô nghĩa. Chính đơn vị đo cảnh báo rằng bài toán đã bị dựng sai.
]

#essay-box("3. Cận tích phân là biên của câu chuyện")[
  Nhiều em xem cận như con số trang trí ở đầu và cuối công thức. Nhưng cận thực ra nói bài toán bắt đầu ở đâu, kết thúc ở đâu, và vì sao chỉ tích lũy trên miền ấy mà không phải miền khác.

  Ví dụ, khi tính công để nâng một vật từ độ cao $0$ lên $10$ mét, cận tự nhiên là từ $0$ đến $10$ theo biến vị trí. Nếu đổi sang cận thời gian, em đang trả lời một câu hỏi khác hẳn.
]

#essay-box("4. Một hàm nguyên hàm là ký ức của tốc độ")[
  Khi ta dựng được một nguyên hàm, ta đang tạo ra một đối tượng có khả năng lưu giữ tác động tích lũy của một quy luật thay đổi. Ký hiệu $+C$ cho thấy ký ức ấy vẫn còn thiếu một điểm neo lịch sử.

  Ví dụ, nếu $v(t) = 2t$ thì một quãng đường có thể là $s(t) = t^2 + C$. Chỉ khi biết thêm $s(0) = 5$, ta mới biết câu chuyện thật là $s(t) = t^2 + 5$. Hằng số ấy chính là dấu vết của điểm xuất phát.
]

#essay-box("5. Không phải mọi thứ đáng biết đều có công thức đẹp")[
  Toán học trưởng thành không đồng nhất hiểu biết với biểu thức đóng. Một giá trị gần đúng có sai số kiểm soát, một ước lượng hai phía, hay một định luật tăng giảm định tính đôi khi là câu trả lời đúng loại hơn.

  Ví dụ, $integral_0^1 e^(-x^2) dif x$ không có nguyên hàm sơ cấp quen thuộc. Nhưng điều đó không ngăn ta tính gần đúng diện tích rất tốt bằng các phương pháp số. Câu hỏi hình học vẫn được trả lời, chỉ là bằng ngôn ngữ số thay vì biểu thức đóng.
]

#essay-box("6. Tích phân là ngôn ngữ của việc ghép mảnh")[
  Mọi phiên bản của tích phân đều có chung một khung: chia thế giới thành các phần rất nhỏ, hiểu từng phần, rồi ghép lại có kiểm soát. Đây là một thói quen trí tuệ cực mạnh, vượt xa riêng chương tích phân.

  Ví dụ, muốn ước lượng diện tích một bức tường cong để mua sơn, ta có thể cắt hình ấy thành nhiều dải đứng mảnh, xem mỗi dải gần như một hình chữ nhật nhỏ, rồi cộng lại. Đó chính là tinh thần ghép mảnh mà sau này được làm chặt bằng tích phân.
]
