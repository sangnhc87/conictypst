#import "../_theme.typ": *

== 26. Kỳ Vọng Liên Tục: Tích Phân Như Một Máy Nén Thông Tin Trong Xác Suất

#why-box[
  Nếu ở chương xác suất tổ hợp ta đã gặp kỳ vọng như trung bình có trọng số trên các trạng thái rời rạc, thì ở đây tích phân cho ta phiên bản liên tục của đúng tinh thần ấy.
]

#vd-box("23", "Kỳ vọng liên tục không phải phép cộng vô tận vô tổ chức")[
  Với biến ngẫu nhiên liên tục có mật độ $f(x)$, kỳ vọng của một đại lượng $g(X)$ thường được viết dưới dạng:
  $ E[g(X)] = integral g(x) f(x) dif x $

  Công thức này rất sâu: nó nói ta đang cộng dồn giá trị $g(x)$, nhưng mỗi giá trị được cân bởi mức độ mà hệ có xu hướng xuất hiện quanh $x$.
]

#bridge-box("Một chiếc cầu đẹp nối Tập 2 với Tập 3")[
  Trong tổ hợp và xác suất rời rạc, kỳ vọng là tổng của giá trị nhân xác suất. Trong xác suất liên tục, tích phân bước vào đúng vị trí của phép tổng. Bộ xương tư duy không đổi; chỉ môi trường từ rời rạc sang liên tục.
]

#meta-box[
  Đây là một ví dụ rất đẹp cho sự thống nhất của bộ ba quyển: hàm số cho ta ngôn ngữ của phụ thuộc, tổ hợp-xác suất cho ta ngôn ngữ của trạng thái và trung bình, còn tích phân cho ta ngôn ngữ của tích lũy liên tục.
]
