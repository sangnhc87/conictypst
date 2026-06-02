#import "../_theme.typ": *

== Xưởng F — Không Gian Trạng Thái: Từ Đếm Sang Xác Suất, Từ Bayes Sang Hàm Sinh

#why-box[
  Một trong những chiếc cầu mạnh nhất nối tổ hợp với xác suất là ý tưởng *trạng thái*. Khi đã xem mỗi cấu hình như một trạng thái và mỗi điều kiện như một phép lọc hoặc một quy tắc chuyển, hàng loạt chủ đề tưởng rời nhau bỗng nhập lại:

  - quy tắc cộng là phân vùng trạng thái,
  - quy tắc nhân là tích trạng thái,
  - xác suất là gán trọng số cho trạng thái,
  - điều kiện là lọc trạng thái,
  - DP là chuyển trạng thái,
  - và hàm sinh là mã hóa trạng thái.

  Vì thế, xưởng lớn này được đặt ngay trong Phần II như một cầu vượt quy mô lớn sang Phần VIII.
]

#history-box("Pascal, Bayes, Markov và ngôn ngữ trạng thái")[
  Nếu đọc lịch sử như một dòng ý tưởng, ta sẽ thấy nhiều tuyến gặp nhau ở đây.

  - Pascal và Fermat đặt những viên gạch đầu tiên cho việc đếm các khả năng có trọng số.
  - Bayes và Laplace khiến việc cập nhật trạng thái tri thức trở thành toán học.
  - Andrey Markov đẩy mạnh tư duy quá trình và chuyển trạng thái trong các hệ ngẫu nhiên nhiều bước.

  Chuyên đề được gài dưới đây rất có ích vì nó gom các tuyến ấy thành một bản đồ có thể đi được.
]

#bridge-box("Cách đọc xưởng lớn này")[
  Đừng đọc phần này như một phụ lục kỹ thuật. Hãy đọc nó như một từ điển dịch giữa các ngôn ngữ:

  - ngôn ngữ đếm,
  - ngôn ngữ xác suất,
  - ngôn ngữ Bayes,
  - ngôn ngữ DP,
  - và ngôn ngữ hàm sinh.

  Một khi đã đi hết cây cầu này, Phần VIII sẽ nhẹ hơn rất nhiều vì nhiều cỗ máy ở đó chỉ còn là phiên bản chuyên nghiệp hóa của tư duy trạng thái.
]

#include "../../../exams/CD-TrangThai-ToHop-XacSuat.typ"
