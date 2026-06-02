#import "../_theme.typ": *

== 19. Cận Di Động: Khi Miền Tích Lũy Tự Nó Cũng Đang Thay Đổi

#why-box[
  Một tích phân không chỉ phụ thuộc vào hàm bên trong. Nó còn phụ thuộc vào *miền đang được cộng*. Khi cận trên hay cận dưới di chuyển, chính miền tích lũy trở thành một phần của động học bài toán.
]

#vd-box("18", "Hàm tích lũy với cận trên chạy")[
  Xét:
  $ A(x) = integral_a^x f(t) dif t $

  Ta đã thấy $A'(x) = f(x)$. Nhưng bây giờ hãy đọc công thức ấy theo một cách khác: tốc độ tăng của lượng tích lũy bằng đúng giá trị của mật độ tại *mặt biên đang chạy*.

  Đây là một hình ảnh rất mạnh: thông tin toàn cục thay đổi theo đúng những gì đang xảy ra ở rìa mới được thêm vào.
]

#bridge-box("CDF trong xác suất cũng là một hàm tích lũy")[
  Với biến ngẫu nhiên liên tục, hàm phân phối tích lũy $F(x)$ cũng chính là tổng xác suất từ bên trái dồn tới điểm $x$. Giải tích ở đây chạm thẳng sang xác suất: đạo hàm của hàm tích lũy, khi tồn tại, chính là mật độ.
]

#pivot-box("Thông tin ở biên có thể điều khiển tốc độ thay đổi của tổng thể như thế nào?")[
  Rất nhiều hiện tượng trong vật lý, kinh tế và xác suất có cấu trúc này. Toàn bộ lượng tích lũy thay đổi không phải vì mọi nơi cùng biến, mà vì *mặt biên* của miền tính toán đang tiến hoặc lùi.
]
