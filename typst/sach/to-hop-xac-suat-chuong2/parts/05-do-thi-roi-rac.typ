#import "../_theme.typ": *

= PHẦN V — ĐỒ THỊ RỜI RẠC: NGÔN NGỮ CỦA QUAN HỆ

== 27. Vì Sao Đồ Thị Là Một Cánh Cửa Lớn?

#why-box[
  Khi toán học không còn hỏi "có bao nhiêu vật" mà bắt đầu hỏi "vật nào liên hệ với vật nào", ngôn ngữ tự nhiên nhất thường là đồ thị.

  Đồ thị không phải một chương riêng lẻ tách khỏi tổ hợp. Nó là một ngôn ngữ nén quan hệ: người với người, thành phố với đường đi, nhiệm vụ với phụ thuộc, màu với xung đột, thiết bị với kết nối.
]

#eye-box[
  Một đồ thị chỉ có hai thứ:

  - đỉnh, đại diện cho các thực thể,
  - cạnh, đại diện cho quan hệ.

  Sự giản dị ấy làm nó trở thành chiếc khung chung cho vô số vấn đề. Một khi bài toán được mã hóa thành đồ thị, ta có cả một kho từ vựng mới: bậc, đường đi, chu trình, cây, ghép cặp, tô màu, kết nối.
]

== 28. Bậc Đỉnh: Thống Kê Cục Bộ Của Một Mạng Lưới

#vd-box("24", "Bổ đề bắt tay: tổng bậc bằng hai lần số cạnh")[
  Đây là định lý đầu tiên nên trở thành phản xạ. Mỗi cạnh chạm vào đúng hai đầu, nên khi cộng bậc mọi đỉnh, ta đã đếm mỗi cạnh đúng hai lần.

  Hệ quả rất nhanh nhưng sâu:

  - số đỉnh bậc lẻ luôn chẵn,
  - trung bình bậc là $2 E / V$,
  - nếu trung bình lớn, chắc chắn phải có đỉnh bậc lớn.

  Từ một phép đếm rất sơ cấp, cả cấu trúc toàn cục của đồ thị bắt đầu hé lộ.
]

#core-box[
  Bậc đỉnh là một ví dụ đẹp của tinh thần xuyên suốt cuốn sách này: thông tin toàn cục thường được cảm nhận qua các đại lượng cục bộ cộng lại.
]

== 29. Đường Đi, Chu Trình, Và Câu Hỏi "Có Thể Đi Hết Không?"

#why-box[
  Nhiều bài toán đồ thị thực ra là những câu hỏi về hành trình:

  - có thể đi từ đây tới kia không,
  - có thể đi qua mọi cạnh đúng một lần không,
  - có thể quay về điểm cũ không,
  - có thể đi mà không đụng một loại chướng ngại nào đó không.

  Đồ thị biến những câu hỏi ấy thành cấu trúc.
]

#vd-box("25", "Tinh thần Euler")[
  Bài toán bảy cây cầu Konigsberg nổi tiếng không được giải bằng cách thử từng lộ trình. Nó được giải bằng cách rút toàn bộ bản đồ thành một đồ thị rồi hỏi về parity của bậc đỉnh.

  Đây là một chiến thắng lịch sử của tư duy cấu trúc. Nó nói rằng: *điều quyết định không nằm ở hình dáng cụ thể của con sông hay cây cầu, mà nằm ở mô hình quan hệ giữa các vùng đất.*
]

#meta-box[
  Đồ thị là nơi toán học học cách bỏ đi chi tiết vật chất để giữ lại bộ xương quan hệ.
]

== 30. Cây: Cấu Trúc Không Vòng Và Sự Tối Giản Đẹp Đẽ

#eye-box[
  Một cây là một đồ thị liên thông không có chu trình. Nghe khô, nhưng đây là một trong những đối tượng đẹp nhất của toán rời rạc.

  Cây là cấu trúc của phân cấp, của dòng quyết định, của lan truyền, của tổ chức không dư thừa. Nó giữ đủ liên thông để mọi thứ nối được với nhau, nhưng bỏ hết vòng lặp thừa.
]

#vd-box("26", "Vì sao cây với $n$ đỉnh có đúng $n-1$ cạnh?")[
  Đây không chỉ là một công thức để thuộc. Nó là phát biểu rằng trong một cấu trúc liên thông tối giản, mỗi cạnh đều thiết yếu.

  Ít hơn thì đứt mạng. Nhiều hơn thì xuất hiện vòng.

  Tính tối giản này làm cây trở thành nền tảng của quy nạp, DFS, cấu trúc thư mục, cây quyết định, và vô số hệ thống biểu diễn kiến thức.
]

== 31. Tô Màu Và Ghép Cặp: Khi Xung Đột Và Hòa Hợp Trở Thành Toán Học

#why-box[
  Nếu cạnh biểu diễn xung đột, tô màu trở thành bài toán phân lịch, phân tài nguyên, hay tránh va chạm. Nếu cạnh biểu diễn khả năng ghép, matching trở thành bài toán phân công, chọn cặp, hoặc gán người cho việc.

  Đây là một lý do lớn khiến đồ thị không chỉ đẹp về mặt lý thuyết. Nó là ngôn ngữ dùng được ngay để nghĩ về thế giới thực.
]

#link-box[
  Từ lịch thi không trùng môn, ghép sinh viên với đề tài, mạng xã hội, đường truyền dữ liệu, đến mạch điện và thuật toán tìm đường, đồ thị là nền ngữ pháp của quan hệ rời rạc.
]

#open-q[
  Khi gặp một bài toán có nhiều đối tượng tương tác, em có đang cố tính trực tiếp trên ngữ cảnh gốc, hay em đã thử rút nó thành một đồ thị để xem bộ xương quan hệ thật sự là gì?
]
