#import "../_theme.typ": *

= PHẦN VI — PROBABILISTIC METHOD: CHỨNG MINH TỒN TẠI BẰNG NGẪU NHIÊN

== 32. Ý Tưởng Gây Sốc Ban Đầu

#why-box[
  Một trong những ý tưởng đẹp nhất của toán hiện đại là thế này: để chứng minh một cấu hình tất định tồn tại, ta có thể không dựng nó trực tiếp. Thay vào đó, ta chọn ngẫu nhiên một cấu hình, rồi chỉ ra rằng xác suất nó "đủ tốt" là dương.

  Nếu xác suất dương, cấu hình tốt ắt tồn tại.
]

#eye-box[
  Đây là một cú đổi vai rất lạ đối với người mới học. Xác suất ở đây không phải để mô tả sự bất định của thế giới. Nó là một công cụ chứng minh tồn tại.

  Ngẫu nhiên không còn là đối tượng nghiên cứu nữa. Nó trở thành đèn pin soi vào một không gian cấu hình quá lớn để duyệt hết bằng tay.
]

#meta-box[
  Tư duy này rất gần với tinh thần của toán học trưởng thành: đôi khi con đường ngắn nhất tới một kết quả tất định lại đi qua một không gian ngẫu nhiên.
]

== 33. Kỳ Vọng Là Chiếc Búa Lớn Nhất Của Phương Pháp Xác Suất

#vd-box("27", "Nếu kỳ vọng số lỗi nhỏ hơn $1$, phải có cấu hình không lỗi")[
  Đây là một mẫu lập luận nền.

  Giả sử ta chọn ngẫu nhiên một cấu hình. Gọi $X$ là số lỗi của nó. Nếu $E[X] < 1$, thì không thể mọi cấu hình đều có ít nhất một lỗi. Vì khi đó kỳ vọng đã phải lớn hơn hoặc bằng $1$.

  Do đó, phải tồn tại một cấu hình có $X = 0$.

  Một mệnh đề tồn tại mạnh được rút ra chỉ từ một ước lượng trung bình. Đó là sức mạnh của kỳ vọng khi được dùng đúng chỗ.
]

#core-box[
  Phương pháp xác suất trong nhiều bài sơ cấp thực ra chỉ cần ba động tác:

  - định nghĩa một phân phối ngẫu nhiên trên không gian cấu hình,
  - chọn đại lượng ngẫu nhiên đo mức độ tốt-xấu,
  - tính hoặc ước lượng kỳ vọng của đại lượng ấy.

  Toàn bộ nghệ thuật nằm ở chỗ chọn đúng phân phối và đúng đại lượng.
]

== 34. Trung Bình Không Phải Tầm Thường

#why-box[
  Người mới học hay khinh trung bình. Họ nghĩ trung bình chỉ là một con số mờ nhạt, không nói gì sắc bén. Đây là một hiểu lầm lớn.

  Trong chứng minh tồn tại, trung bình là đòn bẩy. Nếu trung bình đủ thấp, một điểm rất thấp phải tồn tại. Nếu trung bình đủ cao, một điểm rất cao phải tồn tại. Trung bình không chỉ mô tả đám đông; nó cưỡng bức sự tồn tại của cực trị ở đâu đó.
]

#vd-box("28", "Tồn tại một đỉnh có bậc không vượt quá trung bình")[
  Đây là phát biểu gần như hiển nhiên, nhưng nó dạy đúng tinh thần. Từ một thông tin trung bình toàn cục, ta ép được tồn tại cục bộ.

  Phương pháp xác suất chỉ làm điều này ở cấp tinh vi hơn: thay vì trung bình của các bậc, ta xét kỳ vọng của số lỗi, số cạnh xấu, số tam giác, số va chạm, hay số phần tử thỏa tính chất nào đó.
]

== 35. Chọn Ngẫu Nhiên Để Phá Đối Xứng

#eye-box[
  Nhiều bài toán khó vì cấu hình ban đầu quá đối xứng và quá cứng. Một lựa chọn ngẫu nhiên thường phá vỡ đối xứng đó một cách tự nhiên, khiến các hiện tượng cục bộ trở nên gần độc lập hơn hoặc ít nhất dễ ước lượng hơn.

  Đây là lý do ngẫu nhiên không chỉ là may rủi. Nó là một cơ chế phá cấu trúc cứng để lộ ra cấu trúc mềm có thể tính được.
]

#link-box[
  Từ chứng minh tồn tại đồ thị có tính chất tốt, tới giải thuật ngẫu nhiên, hashing, chia tải, lấy mẫu, và tối ưu hóa ngẫu nhiên, cùng một tư duy đang vận hành: đừng sợ không gian quá lớn; hãy đặt lên nó một phân phối khôn ngoan.
]

== 36. Từ Chứng Minh Không Xây Dựng Tới Khao Khát Xây Dựng

#tech-box[
  Một điểm triết học đáng nhớ: phương pháp xác suất thường cho ta một chứng minh không xây dựng. Nó nói rằng cấu hình tốt tồn tại, nhưng chưa chắc chỉ ra ngay cấu hình ấy.

  Điều này không phải điểm yếu, mà là một giai đoạn tự nhiên. Nhiều tiến bộ lớn trong toán và khoa học máy tính bắt đầu bằng tồn tại không xây dựng, rồi sau đó mới tìm cách dựng thuật toán cụ thể để chạm được cấu hình ấy.
]

#open-q[
  Khi một bài toán quá cứng nếu tấn công trực tiếp, em có dám lùi lại và hỏi: nếu chọn ngẫu nhiên, thứ gì sẽ có trung bình đẹp?
]
