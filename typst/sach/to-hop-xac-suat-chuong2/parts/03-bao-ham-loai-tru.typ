#import "../_theme.typ": *

= PHẦN III — BAO HÀM - LOẠI TRỪ: HÌNH HỌC CỦA SỰ CHỒNG LẤP

== 18. Bao Hàm - Loại Trừ Không Phải Mẹo Dấu Cộng Trừ

#why-box[
  Nhiều học sinh nhớ nguyên lý bao hàm - loại trừ như một công thức có dấu $+ - + -$. Họ thuộc mẫu nhưng không thấy lý do. Vì thế, chỉ cần bài toán hơi lệch mẫu là toàn bộ trực giác sụp xuống.

  Bao hàm - loại trừ thực ra sâu hơn thế rất nhiều. Nó là *đạo đức của việc đếm có trùng*: nếu em đã cộng quá tay vì các miền cấm đè lên nhau, em phải hoàn trả đúng lượng đã lỡ tính thừa.
]

#eye-box[
  Hãy tưởng tượng một bản đồ gồm nhiều vùng cấm chồng lên nhau. Nếu em muốn đếm số điểm rơi vào "ít nhất một vùng cấm", em không thể chỉ cộng kích thước từng vùng. Làm thế sẽ đếm đi đếm lại các điểm nằm trong giao.

  Bao hàm - loại trừ là quy tắc sửa sai có hệ thống:

  - cộng từng vùng riêng,
  - trừ các giao đôi vì đã đếm hai lần,
  - cộng lại các giao ba vì vừa trừ quá tay,
  - và tiếp tục như thế.

  Dấu luân phiên không phải phép thuật. Nó là nhịp điệu của việc sửa lỗi đếm trùng.
]

#core-box[
  Lõi tư duy của nguyên lý này có thể nói gọn bằng một câu:

  *muốn đếm phần hợp, ta phải quản lý cách các phần con chồng lấp lên nhau.*

  Đó là lý do nguyên lý này không chỉ sống trong tổ hợp. Nó còn hiện ra trong xác suất, trong lý thuyết số, trong logic mệnh đề, và trong đại số dưới nhiều hình thức khác nhau.
]

== 19. Vì Sao Dấu Luân Phiên Là Điều Không Thể Tránh?

#vd-box("17", "Một phần tử nằm trong đúng ba tập sẽ bị đối xử thế nào?")[
  Giả sử một phần tử nào đó nằm trong đúng ba tập $A, B, C$.

  Nếu ta cộng $|A| + |B| + |C|$, phần tử ấy bị đếm $3$ lần.
  Nếu ta trừ các giao đôi, nó bị trừ đi $3$ lần nữa, nên tổng tạm thời trở thành $0$ lần.
  Nhưng trong hợp $A union B union C$, nó đáng lẽ phải được tính đúng $1$ lần. Vì thế ta phải cộng lại giao ba một lần nữa.

  Đây là nơi dấu luân phiên hiện ra như một tất yếu. Mỗi cấp giao là một lần sửa lỗi cho cấp trước.
]

#meta-box[
  Một khi em thấy dấu luân phiên là cơ chế sửa sai, công thức bao hàm - loại trừ sẽ không còn là chuỗi ký hiệu cần thuộc lòng. Nó trở thành hậu quả logic của một câu chuyện đếm.
]

== 20. Cánh Cửa Mẫu Mực: Đếm Toàn Ánh

#vd-box("18", "Có bao nhiêu cách đưa $n$ học sinh phân biệt vào $m$ phòng sao cho không phòng nào trống?")[
  Trước hết, nếu bỏ điều kiện "không phòng nào trống", mỗi học sinh có $m$ chọn lựa, nên có $m^n$ cách.

  Bây giờ gọi $E_i$ là biến cố "phòng $i$ trống". Ta muốn đếm số cách không rơi vào bất kỳ $E_i$ nào, tức là số cấu hình né hết các vùng cấm.

  Theo bao hàm - loại trừ, đáp án là:
  $ sum_(k=0)^m (-1)^k C_m^k (m-k)^n $

  Công thức này rất đẹp vì nó cho thấy rõ bản chất:

  - chọn $k$ phòng buộc phải trống,
  - đếm số cấu hình còn lại,
  - rồi sửa trùng bằng dấu luân phiên.

  Đây là một trong những hình mẫu quan trọng nhất của tổ hợp hiện đại. Nó cũng là cánh cửa đi thẳng tới Stirling, EGF và nhiều cấu trúc phân hoạch sâu hơn.
]

#link-box[
  Điều kiện "mọi phòng đều có người" và điều kiện "không màu nào bị thiếu" hay "không ký hiệu nào vắng mặt" đều cùng một xương sống. Em chỉ thay lớp vỏ ngữ cảnh; động cơ bên trong vẫn là bao hàm - loại trừ.
]

== 21. Bao Hàm - Loại Trừ Như Logic Của Cấm Đoán Cục Bộ

#why-box[
  Nhiều bài tổ hợp khó không bắt đầu bằng một công thức đẹp. Chúng bắt đầu bằng một danh sách các vi phạm địa phương:

  - hai người ngồi cạnh nhau,
  - một phòng trống,
  - một cặp ký tự kề nhau,
  - một màu bị thiếu,
  - một đường đi đụng nhau.

  Bao hàm - loại trừ mạnh vì nó cho phép ta biến "cấu hình hợp lệ" thành "cấu hình tổng quát trừ đi các vi phạm".
]

#vd-box("19", "Không có hai bạn cùng lớp ngồi kề nhau: tư duy vi phạm cục bộ")[
  Trong chuyên đề xếp ghế, một ý tưởng rất mạnh là không đếm thẳng cấu hình hợp lệ, mà đếm theo các *liên kết kề trùng* bị ép xuất hiện. Mỗi liên kết như vậy là một vi phạm cục bộ.

  Khi chọn trước một số liên kết phải dính vào nhau, số khối thực thể giảm đi. Ta đếm các cấu hình vi phạm ấy, rồi dùng dấu $(-1)^i$ để bù trừ theo số vi phạm bị kích hoạt.

  Điều đáng học ở đây không phải chỉ là một công thức. Điều đáng học là cách nhìn: *mỗi ràng buộc địa phương có thể được xem như một tập cấm; giao của nhiều tập cấm tương ứng với nhiều vi phạm cùng xuất hiện.*
]

#eye-box[
  Trong nhiều bài toán đếm hiện đại, em có thể bắt đầu bằng câu hỏi:

  "Nếu quên điều kiện khó đi, những vi phạm cơ bản là gì?"

  Chỉ riêng câu hỏi ấy đã đủ dẫn ta vào bao hàm - loại trừ.
]

== 22. Từ Bao Hàm - Loại Trừ Tới Hàm Sinh

#tech-box[
  Một trong những lý do nguyên lý này đáng được học thật sâu là vì về sau nó không biến mất. Nó chỉ thay áo.

  Trong hàm sinh, bù trừ xuất hiện như tử số có những hạng âm dương.
  Trong xác suất, nó xuất hiện như công thức cho xác suất của hợp nhiều biến cố.
  Trong lý thuyết Mobius trên poset, nó trở thành một bản tổng quát hóa trừu tượng và cực mạnh.

  Vì thế, học tốt bao hàm - loại trừ không chỉ để giải vài bài. Đó là học một cú pháp nền của toán học rời rạc.
]

#open-q[
  Mỗi khi em viết một dấu trừ trong một bài đếm, em có đang thực sự hiểu mình đang sửa điều gì, hay chỉ đang bắt chước một mẫu có sẵn?
]
