#import "../_theme.typ": *

== 11. Định Lý Cơ Bản Của Giải Tích Đáng Được Đọc Như Một Cuộc Hòa Giải

#why-box[
  Có những định lý làm việc rất nhiều. Có những định lý còn đẹp vì chúng hòa giải hai ngôn ngữ từng tưởng là xa nhau. Định lý cơ bản của giải tích thuộc loại thứ hai.
]

#history-box("Newton, Leibniz và cây cầu giữa chuyển động với diện tích")[
  Newton đến giải tích từ câu hỏi về chuyển động và các đại lượng sinh ra theo thời gian. Leibniz đi vào từ hình học, tiếp tuyến và tổng các vi phân nhỏ. Họ nói bằng hai giọng khác nhau, nhưng cùng đi tới một chiếc cầu chung: đạo hàm và tích phân là hai mặt của một quá trình duy nhất.
]

#vd-box("8", "Hàm diện tích cũng có đạo hàm")[
  Đặt:
  $ A(x) = integral_a^x f(t) dif t $

  Hàm $A(x)$ đo lượng tích lũy từ điểm gốc $a$ đến điểm chạy $x$. Khi $x$ tăng thêm một lượng rất nhỏ, phần diện tích mới được thêm vào gần đúng là một hình chữ nhật mảnh có diện tích $f(x) Delta x$.

  Vì vậy đạo hàm của $A$ chính là $f$.

  Đây là một khoảnh khắc rất lớn: *một hàm được sinh ra bằng tích lũy lại có đạo hàm bằng chính mật độ tích lũy ban đầu.*
]

#core-box[
  Nhìn ở tầng sâu, định lý cơ bản nói hai điều:

  - đạo hàm đọc ra tốc độ cục bộ của một quá trình tích lũy,
  - còn tích phân gói lại hiệu toàn cục của tốc độ ấy trên một đoạn.

  Thế giới cục bộ và thế giới toàn cục không tách rời nhau. Chúng giao tiếp trực tiếp.
]

#pivot-box("Vì sao $F(b)-F(a)$ lại đủ thay cho cả một tổng vô hạn?")[
  Đây là bài toán bản lề về tư duy, không phải kỹ thuật. Một tổng vô hạn các đóng góp cực nhỏ tưởng chừng phải rất khó giữ. Nhưng định lý cơ bản nói toàn bộ lịch sử cộng dồn ấy có thể nén lại bằng dữ liệu ở hai đầu biên.

  Đây là một mô típ rất lớn của toán học: một quá trình nội tại phức tạp đôi khi được đọc ra chỉ bằng đại lượng biên.
]
