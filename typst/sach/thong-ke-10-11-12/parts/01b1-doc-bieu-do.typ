#import "../_theme.typ": *

== 12. Đọc Biểu Đồ Như Đọc Một Lập Luận

#why-box[
  Rất nhiều học sinh nhìn biểu đồ như nhìn một hình minh họa phụ. Nhưng thực ra, biểu đồ là một *lập luận bằng hình ảnh*. Nó chọn cái gì được thấy trước, cái gì bị mờ đi, cái gì được phóng đại và cái gì bị nén lại.
]

#history-box("William Playfair và cuộc cách mạng biểu đồ")[
  Cuối thế kỷ mười tám, William Playfair phổ biến biểu đồ cột, biểu đồ đường và biểu đồ tròn như những công cụ để biến bảng số liệu khô cứng thành hình ảnh có thể đọc rất nhanh. Điều ông để lại không chỉ là vài kiểu vẽ. Ông để lại một ý tưởng lớn: *mắt người có thể nhìn ra cấu trúc nhanh hơn nhiều so với việc đọc từng dòng số.*
]

#vd-box("11", "Cùng một dữ liệu, hai biểu đồ tạo hai cảm giác khác nhau")[
  Giả sử hai lớp có điểm trung bình lần lượt là $7.8$ và $8.1$. Nếu trục tung bắt đầu từ $0$, chênh lệch nhìn khá nhỏ. Nhưng nếu ai đó cắt trục tung chỉ từ $7.5$ đến $8.2$, cột của lớp $8.1$ sẽ cao vượt trội hẳn trong mắt người xem.

  Dữ liệu không đổi. Nhưng cảm giác mà biểu đồ tạo ra đã đổi mạnh. Đây là lý do người học thống kê phải hỏi không chỉ “số liệu là gì” mà còn “nó đang được trình bày như thế nào”.
]

#core-box[
  Khi đọc một biểu đồ, ít nhất nên kiểm tra bốn điều:

  - trục có bắt đầu từ đâu,
  - đơn vị đo là gì,
  - đang so sánh tần số, tỉ lệ phần trăm hay tổng số,
  - và hình dạng biểu đồ có phù hợp với kiểu dữ liệu không.
]

#mistake-box("Biểu đồ cột và histogram không phải là một")[
  Với dữ liệu phân loại như môn học yêu thích hay phương tiện đến trường, các cột thường tách rời nhau. Với dữ liệu liên tục đã chia lớp như chiều cao hay thời gian chờ, các cột histogram thường liền nhau để nhấn mạnh rằng các khoảng nối tiếp trên một trục số.

  Nhầm hai kiểu biểu diễn này làm người học dễ đọc sai bản chất dữ liệu.
]

#quiz-box("Sau mục này, em thử tự hỏi")[
  - *Trắc nghiệm nhanh:* Một biểu đồ cột về doanh thu bị cắt trục tung từ $95$ đến $100$ khiến hai công ty trông cách biệt rất lớn. Điều gì đang bị phóng đại?
  - *Tự luận ngắn:* Nếu khảo sát thời lượng ngủ của học sinh lớp em, em sẽ chọn bảng tần số, biểu đồ cột, histogram hay boxplot để trả lời câu hỏi “đa số ngủ khoảng bao lâu”? Giải thích.
]
