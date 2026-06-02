#import "../_theme.typ": *

== 16. Giá Trị Trung Bình: Khi Tích Phân Nén Cả Một Quá Trình Thành Một Con Số

#why-box[
  Một trong những ý tưởng đẹp nhưng thường bị học rất lướt là *giá trị trung bình của hàm số*. Nó không chỉ là một công thức phụ. Nó nói rằng cả một hiện tượng biến thiên phức tạp đôi khi có thể được nén lại thành một mức đại diện duy nhất.
]

#vd-box("15", "Tốc độ trung bình không phải phép cộng máy móc")[
  Nếu một xe chạy với vận tốc thay đổi $v(t)$ từ thời điểm $t=a$ đến $t=b$, thì vận tốc trung bình trên khoảng ấy không phải lúc nào cũng là trung bình cộng của vài con số ta chọn ngẫu nhiên. Nó được cho bởi:
  $ v_("tb") = frac(1, b - a) integral_a^b v(t) dif t $

  Công thức này có ý nghĩa rất rõ: lấy *tổng quãng đường có hướng* rồi chia cho *tổng thời gian*. Trung bình ở đây không phải trò bấm máy; nó là một đại lượng có nội dung vật lý.
]

#core-box[
  Công thức giá trị trung bình của hàm số có thể đọc như sau:

  - tích phân cộng dồn toàn bộ ảnh hưởng của hiện tượng,
  - còn phép chia cho độ dài khoảng biến nó thành một *mật độ trung bình*.

  Đây là một khuôn mẫu xuất hiện ở khắp nơi: khối lượng trên chiều dài sinh ra mật độ trung bình; tổng thu nhập trên số tháng sinh ra thu nhập trung bình; tổng nhiệt lượng trên thời gian sinh ra công suất trung bình.
]

#history-box("Từ hình học đến vật lý và xác suất")[
  Ý tưởng trung bình xuất hiện trong hình học cổ điển, trong cơ học cổ điển, rồi đi vào xác suất và thống kê như một trục tư duy trung tâm. Điểm quan trọng là: trung bình không chỉ là một thao tác số học. Nó là cách ta nén một phân bố biến thiên thành một mức điển hình mà vẫn giữ lại nội dung định lượng.
]

#essay-box("Một con số trung bình tốt phải trung thực với hiện tượng")[
  Nhiều tranh cãi ngoài đời không phải vì thiếu dữ liệu, mà vì người ta nén dữ liệu bằng một kiểu trung bình không phù hợp. Giải tích dạy một bài học trưởng thành hơn: muốn nói đến trung bình, trước tiên phải biết *đại lượng nào đang được tích lũy* và *đang chia cho thước đo nào*.
]
