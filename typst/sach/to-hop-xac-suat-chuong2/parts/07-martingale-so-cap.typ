#import "../_theme.typ": *

= PHẦN VII — MARTINGALE SƠ CẤP: KHI THÔNG TIN ĐƯỢC MỞ DẦN

== 37. Martingale Không Bắt Đầu Từ Định Nghĩa Ký Hiệu

#why-box[
  Nếu dạy martingale bằng ký hiệu ngay từ đầu, ta dễ biến một ý tưởng rất đẹp thành một bức tường. Tinh thần ban đầu của martingale thực ra rất người: *nếu ở mỗi thời điểm, với mọi thông tin hiện có, giá trị trung bình tương lai của tài sản vẫn bằng giá trị hiện tại, thì trò chơi là công bằng*.
]

#eye-box[
  Martingale là toán học của một kỳ vọng biết thích nghi với thông tin.

  Không phải kỳ vọng thô từ đầu tới cuối, mà là kỳ vọng sau khi thế giới đã tiết lộ thêm một phần dữ liệu. Điểm cốt lõi không nằm ở ngẫu nhiên đơn thuần, mà ở quá trình *mở dần thông tin*.
]

#vd-box("29", "Tung đồng xu công bằng và vốn hiện tại")[
  Nếu mỗi lần tung đồng xu, em thắng $1$ khi ra ngửa và thua $1$ khi ra sấp, thì số tiền em có sau mỗi bước tạo thành một martingale.

  Tại sao? Vì biết toàn bộ quá khứ không giúp em tạo lợi thế cho lần tung kế tiếp. Giá trị kỳ vọng của bước tiếp theo, điều kiện trên mọi thông tin hiện có, vẫn đúng bằng giá trị hiện tại.

  Đây là cửa vào trực giác tốt nhất cho martingale: *không có độ dốc kỳ vọng khi đã biết mọi điều có thể biết tới lúc này.*
]

== 38. Kỳ Vọng Có Điều Kiện: Bóng Dáng Di Động Của Tri Thức

#core-box[
  Kỳ vọng thông thường gom toàn bộ thế giới lại thành một con số. Kỳ vọng có điều kiện tinh tế hơn: nó cho ta con số tốt nhất có thể dự đoán khi mới biết một phần thông tin.

  Vì thế, martingale là chuỗi những dự đoán tốt nhất cập nhật dần theo thông tin. Đây là lý do nó xuất hiện khắp nơi: trong cờ bạc, trong random walk, trong tiết lộ dần các lá bài, trong phơi bày từng cạnh của một đồ thị ngẫu nhiên, và trong rất nhiều chứng minh nồng cốt của xác suất hiện đại.
]

#meta-box[
  Có thể xem martingale là bản nâng cấp của tư duy Bayes và kỳ vọng: không chỉ cập nhật niềm tin, mà còn theo dõi cách trung bình tiến hóa dưới ánh sáng của thông tin mới.
]

== 39. Martingale Và Nghệ Thuật Theo Dõi Một Quá Trình

#why-box[
  Một quá trình ngẫu nhiên dài thường rất khó nắm nếu nhìn trạng thái thô. Nhưng đôi khi tồn tại một đại lượng phụ đi kèm quá trình, đơn giản hơn nhiều, và đại lượng ấy lại là martingale hoặc gần martingale.

  Đó là lúc martingale trở thành công cụ: thay vì kiểm soát cả câu chuyện, ta kiểm soát một đại lượng được thiết kế tốt.
]

#vd-box("30", "Lật dần từng lá bài")[
  Hãy tưởng tượng em tráo ngẫu nhiên một bộ bài rồi lật dần từng lá. Số lá đỏ đã thấy tăng giảm thất thường, nhưng kỳ vọng số lá đỏ cuối cùng tất nhiên đã cố định từ đầu.

  Nếu ta đặt đúng đại lượng dự đoán còn lại theo thông tin đang lộ ra, ta sẽ gặp một martingale. Tinh thần này mở thẳng tới các bất đẳng thức nồng độ và các chứng minh kiểu "phơi bày từng bước" trong tổ hợp xác suất.
]

== 40. Dừng Lại Đúng Lúc Có Làm Thay Đổi Sự Công Bằng Không?

#why-box[
  Một câu hỏi tự nhiên nảy ra ngay khi hiểu martingale là: nếu trò chơi công bằng ở từng bước, liệu ta có thể thắng bằng cách chọn một thời điểm dừng thật khôn ngoan không?

  Đây là nơi định lý dừng tối ưu và định lý dừng tùy chọn lớn dần ra đời ở các mức rất sâu. Ở mức sơ cấp, điều quan trọng là hiểu trực giác: *không phải mọi chiến lược dừng đều tạo ra vàng từ không khí.*
]

#tech-box[
  Trong các tình huống hữu hạn, được kiểm soát tốt, và không có đuôi nguy hiểm, trực giác công bằng thường vẫn sống sót sau khi dừng. Nhưng ở các quá trình vô hạn hay có phân phối nặng đuôi, câu chuyện tinh tế hơn rất nhiều.

  Đây là một bài học lớn về toán học trưởng thành: một ý tưởng đẹp thường không sai, nhưng luôn cần các điều kiện đúng để thật sự đúng.
]

== 41. Tại Sao Martingale Xứng Đáng Xuất Hiện Trong Một Cuốn Khai Mở?

#link-box[
  Vì martingale là nơi nhiều tuyến ý tưởng của Tập 2 gặp nhau:

  - xác suất có điều kiện,
  - kỳ vọng,
  - quá trình nhiều bước,
  - tư duy cục bộ dẫn tới thông tin toàn cục,
  - và chứng minh rằng một đại lượng được thiết kế tốt có thể làm chủ cả một hệ ngẫu nhiên phức tạp.
]

#open-q[
  Nếu đạo hàm đo độ thay đổi của hàm số trong giải tích, thì trong xác suất nhiều bước, liệu martingale có phải là một trong những ngôn ngữ tự nhiên nhất để đo cách "tri thức về tương lai" biến thiên theo thời gian?
]
