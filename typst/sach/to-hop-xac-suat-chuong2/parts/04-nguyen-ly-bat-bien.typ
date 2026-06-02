#import "../_theme.typ": *

= PHẦN IV — NGUYÊN LÝ BẤT BIẾN VÀ MONOVARIANT: KẾ TOÁN ẨN CỦA HỆ RỜI RẠC

== 23. Bất Biến: Cái Không Đổi Giữa Một Cơn Chuyển Động

#why-box[
  Có những bài toán trông như trò chơi: quân cờ di chuyển, đồng xu bị lật, sỏi được chuyển từ đống này sang đống khác. Người mới học thường bị cuốn theo chuyển động nhìn thấy được. Nhưng người giải giỏi thường tìm thứ *không* chuyển động.

  Đó là bất biến.
]

#eye-box[
  Một bất biến là một đại lượng không đổi dưới mọi nước đi hợp lệ. Nếu trạng thái đầu và trạng thái đích có giá trị bất biến khác nhau, ta kết luận ngay: không thể tới đích.

  Bất biến vì thế là một loại "chứng minh không thể" cực mạnh. Nó không mô phỏng toàn bộ quá trình; nó khóa chặt toàn bộ quá trình bằng một con số, một parity, một màu sắc, hay một lớp đồng dư.
]

#vd-box("20", "Bàn cờ bị khoét hai ô cùng màu và domino")[
  Một quân domino luôn phủ một ô đen và một ô trắng. Vì thế, bất kỳ cách lát hoàn chỉnh nào bằng domino đều phải phủ số ô đen bằng số ô trắng.

  Nếu bàn cờ bị bỏ đi hai ô cùng màu, cân bằng đen-trắng bị phá vỡ. Không cần thử lát. Không cần tìm cấu hình phản ví dụ. Chỉ cần nhìn bất biến màu sắc là đủ kết luận: bất khả.

  Đây là mẫu mực của nguyên lý bất biến: *rút một hiện tượng hình học phức tạp về một phép kiểm kê cực đơn giản nhưng không thể bị lừa.*
]

#meta-box[
  Bất biến là một trong những nơi khiến toán học giống điều tra hình sự: thay vì bám từng động tác, ta truy một dấu vết không thể bị xóa.
]

== 24. Parity Là Bất Biến Đầu Tiên Và Quan Trọng Nhất

#core-box[
  Trong rất nhiều bài toán sơ cấp, bất biến đầu tiên nên thử là chẵn lẻ.

  Tại sao? Vì parity là phiên bản nhỏ nhất của thông tin cấu trúc. Nó thô, nhưng cực bền. Nhiều phép biến đổi phức tạp vẫn không phá vỡ được nó.

  Chính vì thô và bền, parity thường là chiếc chìa khóa đủ để bác bỏ những hành trình tưởng như có thể xảy ra.
]

#vd-box("21", "Hoán vị và số nghịch thế")[
  Khi ta đổi chỗ hai phần tử kề nhau, parity của số nghịch thế bị đổi. Vì vậy, có những hoán vị chỉ có thể đạt được sau số bước cùng parity thích hợp.

  Điều này liên hệ rất sâu với nhiều câu đố hoán vị nổi tiếng. Điểm đáng học không phải riêng số nghịch thế, mà là chiến lược: *mã hóa trạng thái bằng một đại lượng dễ theo dõi hơn chuyển động gốc*.
]

== 25. Monovariant: Khi Đại Lượng Không Cần Giữ Nguyên, Chỉ Cần Đi Một Chiều

#why-box[
  Không phải bài nào cũng có một đại lượng giữ nguyên hoàn toàn. Nhiều khi ta chỉ tìm được một đại lượng luôn tăng, hoặc luôn giảm, hoặc luôn tiến gần một biên nào đó. Đại lượng ấy gọi là monovariant.

  Nếu một đại lượng như vậy bị chặn trên hoặc chặn dưới, ta có thể suy ra quá trình phải dừng. Nếu đích yêu cầu đại lượng đi ngược chiều, ta kết luận đích bất khả.
]

#vd-box("22", "Một trò chơi luôn giảm độ hỗn loạn")[
  Hãy tưởng tượng mỗi nước đi làm giảm tổng bình phương kích thước các đống sỏi, hoặc giảm số cặp đảo chỗ, hay giảm số đoạn vi phạm. Một khi đại lượng đó không thể giảm vô hạn, trò chơi phải chấm dứt.

  Đây là một ý tưởng nền của chứng minh dừng trong giải thuật: không cần mô phỏng mọi nhánh, chỉ cần dựng một thước đo luôn đi xuống.
]

#link-box[
  Monovariant nối rất tự nhiên với quy nạp, với chứng minh dừng thuật toán, với thế năng trong vật lý, và với entropy như một đại lượng có xu hướng một chiều trong nhiều hệ lớn.
]

== 26. Tô Màu, Đồng Dư, Và Kế Toán Cấu Trúc

#eye-box[
  Bất biến không phải lúc nào cũng là số. Đôi khi nó là một màu, một lớp modulo, một loại ký hiệu, hay một cấu trúc phân hoạch.

  Tô màu là kỹ thuật cực mạnh vì nó cho phép một hiện tượng hình học hay tổ hợp được chiếu xuống một mô hình rời rạc đơn giản hơn. Khi đã chiếu xong, phần còn lại thường chỉ là kiểm kê.
]

#vd-box("23", "Tại sao nhiều bài lát hình lại sống bằng tô màu?")[
  Vì quân cờ hợp lệ thường tiêu thụ các màu theo một định luật cố định. Nếu hình đích có phân bố màu không tương thích với định luật ấy, sự bất khả lộ ra ngay.

  Nói cách khác, tô màu giúp ta tạo ra một bất biến ẩn từ hình học ban đầu.
]

#open-q[
  Khi một bài toán cho phép thực hiện rất nhiều nước đi khác nhau, em có đang bị lạc trong chuyển động nhìn thấy được, hay em đã bắt đầu săn những đại lượng không ai chạm nổi?
]
