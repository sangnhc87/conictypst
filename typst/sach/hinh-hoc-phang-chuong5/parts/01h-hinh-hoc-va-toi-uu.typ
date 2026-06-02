#import "../_theme.typ": *

== 13. Từ Hình Học Thuần Tới Tối Ưu Và Mô Hình Hóa

#history-box("Từ chuyện chia đất tới những bài toán cực trị")[
  Ngay từ rất sớm, hình học đã không chỉ là chuyện chứng minh đẹp. Nó còn gắn với đo đất, dựng công trình, chọn hình tối ưu, chia miền sao cho tiết kiệm vật liệu hoặc đạt hiệu quả lớn nhất. Tư duy tối ưu vì thế không phải thứ ghép ngoài vào hình học. Nó là một dòng chảy tự nhiên của hình học.
]

#vd-box("13", "Vì sao một bài rào vườn cũng là họ hàng của hình học?")[
  Khi hỏi với cùng một lượng hàng rào thì nên chọn hình nào để diện tích lớn nhất, ta đang hỏi về mối quan hệ giữa chu vi, đối xứng, và diện tích. Đây là nơi hình học, đại số và cả giải tích có thể gặp nhau.

  Một bài toán trông rất đời thường thực ra đang hỏi một điều rất cổ điển: *hình nào là tối ưu dưới một ràng buộc cho trước?*
]

#link-box[
  Đây cũng là lý do quyển 2D không nên dừng ở tam giác, đường tròn hay conic theo nghĩa thuần lý thuyết. Nó còn phải mở đường sang các bài toán thiết kế, tối ưu hình phẳng, phản xạ ánh sáng, diện tích miền và mô hình hóa bằng hình.
]

#tech-box[
  *Ứng dụng tối tân: Giản đồ Voronoi (Voronoi Diagram) trong Khoa học dữ liệu và Robot:*
  
  Giả sử ta có $N$ cửa hàng tiện lợi trên bản đồ thành phố. Ta muốn chia thành phố thành $N$ vùng sao cho mỗi người dân ở bất kỳ vị trí nào cũng sẽ đi đến cửa hàng gần nhất. Phân chia này tạo nên một cấu trúc hình học gọi là *Giản đồ Voronoi*.
  
  - Về mặt toán học, ranh giới ranh giới chia cắt giữa hai vùng lân cận chính là các phân đoạn của *đường trung trực* (đường thẳng cách đều hai tâm).
  - Đây là ứng dụng thực tế vô cùng rộng rãi của hình học phẳng cổ điển trong việc lập trình định vị cho robot tự hành di chuyển tránh vật cản, tối ưu hóa tuyến đường logistics và phân tích mật độ dịch vụ trong quy hoạch đô thị hiện đại.
]

#open-q[
  Trong một bài toán phẳng, em có đang cố giải bằng tọa độ chỉ vì nó quen tay, hay thật ra bài toán đang cần một ý Euclide ngắn hơn nhiều?
]
