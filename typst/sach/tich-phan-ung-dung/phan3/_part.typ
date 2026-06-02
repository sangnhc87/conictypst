#import "../_config.typ": *

#part([Ứng dụng Hình học Phẳng — Diện tích 2D], theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  *Lộ trình Phần 4:* Diện tích giữa hai đường cong là ứng dụng
  hình học phổ biến nhất của tích phân định thức. Công thức tổng quát:
  $
    S = integral_a^b |f(x) - g(x)| d x
  $
  Phần này đặt công thức đó vào ba bối cảnh thực tế: kiến trúc
  (đo diện tích mặt tiền phức tạp), quy hoạch đất đai (chia lô, đo
  diện tích mảnh vườn bị giới hạn bởi sông và đường), và xử lý dữ
  liệu rời rạc (khi không có công thức tường minh của $f$).

  *Kỹ năng then chốt:* Xác định *đường phía trên*, *đường phía dưới*
  và *hoành độ giao điểm* $a$, $b$ — sai ở bước này dẫn đến kết quả sai.
]
