#import "../_theme.typ": *

== 14. Hàm Tích Lũy: Khi Một Đại Lượng Toàn Cục Vẫn Có Thể Chạy Theo Điểm Cuối

#why-box[
  Có một đối tượng rất đẹp nhưng thường chưa được nhấn mạnh đủ: *hàm tích lũy*. Nó không chỉ cho ta một con số cuối. Nó cho ta một hàm mới, mỗi điểm của nó ghi lại lượng đã tích lũy được đến thời điểm ấy.
]

#vd-box("13", "$A(x) = integral_a^x f(t) dif t$ là gì?")[
  Đây không còn là một diện tích tĩnh. Nó là một lịch sử tích lũy đang mở rộng theo điểm cuối $x$.

  Khi $x$ thay đổi, $A(x)$ thay đổi. Và điều rất đẹp là tốc độ thay đổi ấy chính bằng $f(x)$, nhờ định lý cơ bản của giải tích.

  Nói cách khác, hàm tích lũy cho phép một quá trình toàn cục trở lại đối thoại với ngôn ngữ cục bộ của đạo hàm.
]

#bridge-box("Từ đây sang phương trình vi phân")[
  Một khi quen nhìn hàm như kết quả của một quy luật tích lũy, người học bước rất tự nhiên sang phương trình vi phân: thay vì chỉ hỏi giá trị của hàm là bao nhiêu, ta hỏi nó phải tiến hóa theo quy luật nào.
]

#essay-box("Giải tích như cuộc đối thoại giữa hai cái nhìn")[
  Đạo hàm là cái nhìn vi mô. Tích phân là cái nhìn vĩ mô. Hàm tích lũy là nơi hai cái nhìn ấy sống trong cùng một đối tượng. Đây là lý do giải tích có chiều sâu triết học hơn nhiều so với cảm giác "đạo hàm rồi tích phân" mà học sinh thường mang theo.
]
