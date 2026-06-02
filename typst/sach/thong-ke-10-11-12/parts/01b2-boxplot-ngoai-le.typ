#import "../_theme.typ": *

== 13. Boxplot, Ngoại Lệ Và Những Điểm Không Nên Vội Xóa

#why-box[
  Boxplot mạnh ở chỗ nó cho ta một cái nhìn nén nhưng vẫn giàu thông tin: trung tâm, độ trải của phần giữa, hai đuôi và những điểm lạ. Nhưng chính vì nó nén mạnh, người học rất dễ đọc boxplot như một biểu tượng cơ học mà quên ý nghĩa dữ liệu thật phía sau.
]

#history-box("John Tukey và tinh thần ‘hãy nhìn dữ liệu trước’")[
  John Tukey là một trong những người cổ vũ mạnh mẽ cho việc *khám phá dữ liệu* trước khi lao vào công thức suy luận. Boxplot mang đúng tinh thần ấy: chỉ bằng một hình gọn, nó buộc ta đối diện với câu hỏi liệu dữ liệu có cân, có lệch, có dày ở giữa hay có các điểm bất thường ở biên không.
]

#vd-box("12", "Một học sinh ngủ rất ít có phải là ‘sai số’ không?")[
  Giả sử boxplot thời gian ngủ của một lớp cho thấy hầu hết học sinh ngủ từ 6 đến 8 giờ, nhưng có một bạn chỉ ngủ khoảng 3 giờ. Điểm này có thể xuất hiện như một ngoại lệ.

  Tuy nhiên, ngoại lệ không tự động đồng nghĩa với lỗi. Có thể hôm đó bạn ấy thức khuya ôn thi, có thể bạn ấy đang có vấn đề sức khỏe, hoặc có thể dữ liệu nhập sai. Thống kê tốt không xóa ngoại lệ quá sớm. Nó hỏi trước: *điểm này phản ánh hiện thực, hay phản ánh lỗi đo?*
]

#tech-box[
  Trong nhiều cách dựng boxplot, người ta hay xem các điểm nằm ngoài vùng kéo dài quá $1.5$ lần khoảng tứ phân vị là ứng viên ngoại lệ. Nhưng đây là một quy ước thực hành, không phải một phán quyết tuyệt đối rằng điểm ấy phải bị loại.
]

#mistake-box("Ngoại lệ không đồng nghĩa với dữ liệu vô dụng")[
  Có những ngoại lệ cần sửa vì là lỗi nhập số. Nhưng cũng có những ngoại lệ là tín hiệu quan trọng nhất trong cả bộ dữ liệu: một ca bệnh hiếm, một khách hàng chờ quá lâu, một lớp học có vài bạn tụt hẳn khỏi phần còn lại.

  Xóa ngoại lệ mà không hiểu bối cảnh đôi khi chính là xóa mất câu chuyện quan trọng nhất.
]

#quiz-box("Tự kiểm tra với boxplot")[
  - *Trắc nghiệm nhanh:* Hai lớp có boxplot cùng trung vị, nhưng một lớp có hộp rộng hơn hẳn. Điều này gợi ý điều gì về 50% dữ liệu ở giữa?
  - *Tự luận ngắn:* Nếu em thấy một ngoại lệ trong dữ liệu điểm kiểm tra, em sẽ làm ba bước nào trước khi quyết định bỏ hay giữ nó?
]
