#import "../_theme.typ": *

== 13. Diện Tích, Thể Tích, Mật Độ: Những Avatar Khác Nhau Của Cùng Một Ý Tưởng

#why-box[
  Một trong những điều đẹp nhất ở tích phân là nó không bị trói vào một diễn giải duy nhất. Khi đã hiểu lõi là tích lũy, ta thấy nó hóa thân rất tự nhiên thành nhiều avatar:

  - diện tích dưới một đường,
  - thể tích của một khối,
  - quãng đường từ vận tốc,
  - khối lượng từ mật độ,
  - xác suất từ hàm mật độ,
  - tổng chi phí từ chi phí biên.
]

#vd-box("11", "Khối lượng từ mật độ")[
  Nếu một thanh kim loại không đồng chất có mật độ tuyến tính $rho(x)$ theo vị trí, thì khối lượng của nó trên đoạn $[a,b]$ là:
  $ m = integral_a^b rho(x) dif x $

  Đây không phải công thức mới. Nó là lại cùng logic quen thuộc: mỗi mẩu cực nhỏ có khối lượng gần đúng bằng mật độ nhân với độ dài rất nhỏ, rồi cộng dồn.
]

#vd-box("12", "Xác suất liên tục cũng là tích lũy")[
  Với một biến ngẫu nhiên liên tục có mật độ $f(x)$, xác suất rơi vào đoạn $[a,b]$ là:
  $ P(a <= X <= b) = integral_a^b f(x) dif x $

  Điều này rất sâu vì nó cho thấy xác suất liên tục được nhìn như một *diện tích có chuẩn hóa*. Một lần nữa, cùng một chiếc máy tư duy đang hoạt động.
]

#meta-box[
  Khi một công cụ có thể giải thích quá nhiều hiện tượng tưởng như khác nhau, đó là dấu hiệu ta đang chạm vào một cấu trúc nền của toán học chứ không phải một thủ tục chương mục.
]
