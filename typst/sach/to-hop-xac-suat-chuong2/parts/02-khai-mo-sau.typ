#import "../_theme.typ": *

= PHẦN II — KHAI MỞ SÂU: NHỮNG CỬA NGẦM CỦA TƯ DUY TỔ HỢP

== 12. Đếm Đôi — Một Sự Thật, Hai Cách Nhìn, Một Cú Nhảy Trí Tuệ

#why-box[
  Có một khoảnh khắc mà nhiều học sinh lần đầu thấy tổ hợp đẹp theo nghĩa thật sự: khi cùng một tập đối tượng được đếm bằng hai cách hoàn toàn khác nhau, và hai con đường ấy buộc phải gặp nhau ở cùng một đáp án.

  Đếm đôi không chỉ là thủ thuật. Nó là một lối suy nghĩ rất sâu: *thay vì lao vào tìm con số trực tiếp, hãy tìm một đại lượng có thể được quan sát từ nhiều góc nhìn*. Khi hai góc nhìn đều đúng, một đẳng thức mới ra đời.
]

#eye-box[
  Hãy tưởng tượng một căn phòng có $n$ người. Có thể đếm số cái bắt tay xảy ra theo hai cách:

  - nhìn toàn bộ: mỗi cặp người tạo đúng một cái bắt tay,
  - nhìn theo từng người: mỗi người bắt tay với một số người nào đó, rồi cộng các số ấy lại.

  Cùng một hiện tượng, hai hệ quy chiếu. Đếm đôi chính là nghệ thuật dựng nên những hệ quy chiếu như vậy.
]

#vd-box("12", "Tổng bậc trong một đồ thị luôn bằng hai lần số cạnh")[
  Nếu xem mỗi người là một đỉnh và mỗi cái bắt tay là một cạnh, ta thu được một đồ thị.

  Bây giờ đếm tổng số đầu mút của các cạnh theo hai cách:

  - Mỗi cạnh có đúng $2$ đầu mút, nên tổng số đầu mút là $2 E$ nếu $E$ là số cạnh.
  - Mỗi đỉnh đóng góp đúng bằng bậc của nó, nên tổng số đầu mút cũng bằng tổng các bậc của mọi đỉnh.

  Vì hai cách đếm cùng nói về một đại lượng, ta có:
  $ "tổng các bậc" = 2 " lần số cạnh" $

  Đây là một định lý. Nhưng sâu hơn, nó là một thói quen trí tuệ: *đừng chỉ nhìn đối tượng; hãy nhìn cách nó có thể được đếm từ hai phía*.
]

#core-box[
  Đếm đôi thường xuất hiện khi có một trong ba kiểu đại lượng trung gian:

  - số quan hệ giữa hai lớp đối tượng,
  - số cách gắn nhãn hay đánh dấu một cấu hình,
  - số lần một thuộc tính địa phương xuất hiện trong một cấu trúc toàn cục.

  Khi em tìm được đại lượng trung gian đúng, bài toán thường tự mở khóa.
]

#meta-box[
  Đếm đôi dạy một bài học ngoài tổ hợp: *nhiều chân lý sâu không đến từ việc tính giỏi hơn, mà đến từ việc chọn đại lượng đáng nhìn hơn.*
]

== 13. Chứng Minh Tồn Tại Bằng Cách Đếm — Khi Một Con Số Buộc Một Cấu Hình Phải Có Mặt

#why-box[
  Người mới học thường nghĩ đếm chỉ nhằm tìm số lượng. Nhưng đếm còn có một quyền lực khác: nó có thể buộc ta kết luận rằng *một cấu hình nào đó phải tồn tại*, ngay cả khi chưa hề chỉ ra nó là ai.

  Đây là một bước trưởng thành lớn. Toán học không phải lúc nào cũng chỉ ra đối tượng. Đôi khi nó chỉ chứng minh rằng đối tượng ấy không thể không có.
]

#vd-box("13", "Nếu có nhiều chim hơn lồng, chắc chắn có lồng chứa ít nhất hai con")[
  Đây là nguyên lý Dirichlet nổi tiếng, thường gọi là nguyên lý cái chuồng bồ câu.

  Nó nghe gần như hiển nhiên, nhưng lại là cổng vào của vô số chứng minh tinh tế. Tại sao? Vì nó chuyển một bài toán tồn tại thành một tuyên bố đếm rất thô nhưng rất cứng.

  Nếu $n+1$ đối tượng đi vào $n$ ngăn, không thể mọi ngăn đều chứa nhiều nhất một đối tượng. Chỉ một quan sát số lượng như vậy đã ép một cấu hình phải xuất hiện.

  Vẻ đẹp của nguyên lý này nằm ở chỗ: không cần biết con chim nào, lồng nào, hay cách phân bố cụ thể ra sao. Chỉ cần nhìn tổng lượng là đủ để một kết luận định tính bật ra.
]

#eye-box[
  Có thể xem nguyên lý Dirichlet như dạng sơ cấp nhất của một quy tắc lớn hơn trong toán học: *nếu tài nguyên toàn cục vượt quá mức chịu tải cục bộ, một hiện tượng cưỡng bức sẽ xuất hiện ở đâu đó*.

  Trong xác suất, tư duy tương tự cho ta các ngưỡng. Trong đồ thị, nó tạo ra các điều kiện buộc phải có bậc lớn. Trong số học, nó sinh nhiều kết quả tồn tại cực đẹp.
]

#link-box[
  Từ việc chứng minh có hai người sinh cùng tháng, tới việc tồn tại hai tập con có cùng tổng theo modulo, tới việc ép xuất hiện chu trình hay bậc lớn trong đồ thị, cùng một linh hồn đang hoạt động: số lượng tổng thể vượt qua một mức chứa cục bộ.
]

== 14. Đối Xứng Không Chỉ Là Đẹp — Nó Là Máy Nén Của Lập Luận

#why-box[
  Người mới học thường xem đối xứng là phần trang trí của hình học. Nhưng trong tổ hợp và xác suất, đối xứng là một loại máy nén cực mạnh. Nó cho phép ta gộp nhiều trường hợp lại làm một, hoặc chứng minh rằng nhiều khả năng có cùng vai trò nên có cùng trọng lượng.
]

#vd-box("14", "Tại sao khi tung đồng xu cân bằng, mọi chuỗi mặt sấp–ngửa cùng độ dài có cùng xác suất?")[
  Vì mỗi bước tung là một lựa chọn đối xứng: sấp và ngửa có địa vị ngang nhau. Không có vị trí nào trong chuỗi được ưu ái, và cũng không có ký tự nào được gắn trọng số khác.

  Do đó, mọi chuỗi độ dài $n$ có cùng xác suất. Đây là một phát biểu xác suất, nhưng lõi của nó là đối xứng.

  Khi em thật sự hiểu điều này, em sẽ thấy nhiều công thức xác suất không được sinh ra từ phép chia khô. Chúng được sinh ra từ một hình thức bình đẳng cấu trúc giữa các khả năng.
]

#core-box[
  Trong rất nhiều bài toán, đối xứng giúp theo ba cách:

  - giảm số trường hợp cần xét,
  - chỉ ra rằng hai sự kiện có cùng xác suất hoặc cùng số lượng,
  - và gợi ý một phép mã hóa trong đó các đối tượng "thật ra là như nhau" dưới một phép đổi tên nào đó.

  Học sinh giỏi thường không phải người tính nhanh nhất. Họ thường là người nhận ra sớm nhất phần nào của bài toán không cần tính nữa vì đối xứng đã làm xong hộ họ.
]

#meta-box[
  Đối xứng là một trong những nơi mà thẩm mỹ và hiệu quả toán học gặp nhau. Thấy một cấu trúc đối xứng thường vừa đẹp mắt, vừa tiết kiệm công lao lập luận.
]

== 15. Biến Chỉ Báo — Cây Cầu Từ Đếm Sang Kỳ Vọng

#why-box[
  Có một thủ pháp cực mạnh nhưng nhiều sách phổ thông bỏ qua hoặc chỉ lướt nhanh: *biến chỉ báo*.

  Ý tưởng cốt lõi rất đơn giản. Thay vì đếm trực tiếp một đại lượng phức tạp, ta tách nó thành tổng của nhiều biến nhỏ chỉ nhận giá trị $0$ hoặc $1$ tùy việc một hiện tượng cục bộ có xảy ra hay không.

  Rồi ta lấy kỳ vọng. Điều tưởng phức tạp bỗng mềm đi.
]

#vd-box("15", "Số cặp ngồi cạnh nhau cùng lớp được đếm như thế nào?")[
  Giả sử một hàng ghế có nhiều chỗ kề nhau. Với mỗi cặp ghế kề nhau, ta đặt một biến chỉ báo:

  - bằng $1$ nếu cặp đó là một vi phạm,
  - bằng $0$ nếu không.

  Khi đó tổng số vi phạm chính là tổng của các biến chỉ báo cục bộ ấy.

  Bây giờ, nếu cấu hình được chọn ngẫu nhiên, kỳ vọng của tổng bằng tổng các kỳ vọng. Ta không cần điều khiển trực tiếp toàn bộ cấu hình nữa. Ta chỉ cần hiểu xác suất vi phạm tại từng cặp.

  Đây là một cú xoay rất đẹp: bài toán đếm biến thành bài toán cộng kỳ vọng cục bộ.
]

#eye-box[
  Biến chỉ báo dạy ta rằng có những đối tượng toàn cục rất khó chạm trực tiếp, nhưng lại dễ chạm nếu tách thành những tia sáng nhỏ bật–tắt ở cấp vi mô.

  Một lần nữa, tinh thần này đối xứng rất đẹp với giải tích: ở đó ta đi từ cục bộ tới toàn cục bằng đạo hàm; ở đây ta đi từ cục bộ tới toàn cục bằng các biến chỉ báo và tính tuyến tính của kỳ vọng.
]

#link-box[
  Trong phương pháp xác suất, biến chỉ báo là công cụ nền. Trong lý thuyết đồ thị ngẫu nhiên, nó đếm số tam giác, số cạnh, số đỉnh có tính chất nào đó. Trong giải thuật ngẫu nhiên, nó đo số lỗi, số va chạm, số lần một sự kiện xảy ra.
]

== 16. Nghịch Lý Xác Suất — Nơi Trực Giác Bị Ép Trưởng Thành

#why-box[
  Một chương hay về xác suất không thể chỉ cho người học công thức. Nó phải đưa họ tới những nơi trực giác thô bị phản bội, để trực giác mới có dịp lớn lên.

  Các nghịch lý xác suất nổi tiếng không quan trọng vì chúng đánh đố. Chúng quan trọng vì chúng ép ta phân biệt rõ hơn:

  - không gian mẫu là gì,
  - thông tin nào đang được điều kiện hóa,
  - và đối xứng nào là thật, đối xứng nào chỉ là ảo giác.
]

#vd-box("16", "Monty Hall không kỳ quặc; nó chỉ tàn nhẫn với trực giác mơ hồ")[
  Khi một cánh cửa thua được mở ra sau lựa chọn ban đầu, nhiều người cảm thấy còn hai cửa nên mỗi cửa phải có xác suất $1/2$. Cảm giác ấy rất mạnh, nhưng sai.

  Sai ở đâu? Sai ở chỗ trò chơi không làm mới hoàn toàn không gian mẫu; nó chỉ tiết lộ thông tin theo một quy tắc có cấu trúc. Cánh cửa được mở không phải một cửa mở ngẫu nhiên vô tư. Nó được chọn dưới một luật phụ thuộc vào vị trí giải thưởng.

  Vì thế, xác suất ban đầu không bị san phẳng đều thành $1/2$–$1/2$. Nó bị *đẩy dồn* sang cánh cửa chưa mở còn lại. Điều này không phải trò lừa. Nó là bài học về cách thông tin có cấu trúc bẻ cong không gian khả năng.
]

#meta-box[
  Khi một nghịch lý xác suất làm ta khó chịu, rất có thể ta vừa chạm vào một chỗ mà ngôn ngữ đời thường không còn đủ chính xác. Cảm giác khó chịu ấy là dấu hiệu tốt: trực giác đang bị buộc phải tinh chỉnh.
]

== 17. Bảy Gốc Tư Duy Của Tổ Hợp Và Xác Suất

#core-box[
  Nếu phải nén cả một cuốn sách này vào bảy gốc tư duy, tôi sẽ giữ lại bảy động tác sau:

  - *Nguyên lý cộng:* chia lớp trường hợp rời nhau.
  - *Nguyên lý nhân:* ghép các lựa chọn độc lập thành một cấu hình lớn.
  - *Song ánh:* thay một thế giới khó bằng một thế giới dễ mà không mất linh hồn.
  - *Đếm đôi:* cùng một đại lượng, hai hệ quy chiếu.
  - *Truy hồi:* cái lớn được sinh từ quy luật xây cái nhỏ.
  - *Chuẩn hóa xác suất:* đếm thuận lợi chia cho đếm tổng thể, hoặc gắn trọng số cho các khả năng.
  - *Tuyến tính của kỳ vọng:* một cách đi vòng khi đếm trực tiếp quá đau.

  Gần như mọi kỹ thuật sau này chỉ là biến tấu tinh vi hơn của một trong bảy động tác đó.
]

#open-q[
  Nếu ngày mai em quên gần hết công thức của tổ hợp và xác suất, nhưng vẫn nhớ bảy động tác này, em có còn tự học tiếp được không? Nếu câu trả lời là có, phần khai mở đã làm đúng việc của nó.
]

#include "02a-dem-doi-xuong.typ"

#include "02b-song-anh-sau.typ"

#include "02c-bien-chi-bao.typ"

#include "02d-nghich-ly-xac-suat.typ"

#include "02e-bai-luan-tu-duy.typ"

#include "02f-khong-gian-trang-thai.typ"

#include "02g-khong-ke-cot-dac-trung.typ"

#include "02h-catalan-giao-lo.typ"

#include "02i-bayes-hau-nghiem.typ"
