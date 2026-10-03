#import "style.typ": lesson-theme, teacher-key, lesson-box
#show: lesson-theme

#align(center)[
  #text(size: 22pt, weight: "bold", fill: rgb("#115e8c"))[HỆ BẤT PHƯƠNG TRÌNH\ BẬC NHẤT HAI ẨN]
  #v(0.5em)
  #text(size: 12pt, fill: rgb("#047857"))[Bài giảng Toán 10 · 4 tiết · học qua mô hình, miền nghiệm và tối ưu]
]

#v(1em)

#lesson-box([Mục tiêu sau 4 tiết], [
  1. Lập và kiểm tra nghiệm của một hệ bất phương trình bậc nhất hai ẩn.
  2. Vẽ đúng miền giao các nửa mặt phẳng, kể cả trường hợp bờ mở, miền rỗng và miền không bị chặn.
  3. Tìm các đỉnh và giải bài toán tối ưu tuyến tính khi đủ giả thiết.
  4. Mô hình hóa tình huống thực tế, đọc kết quả cùng đơn vị và điều kiện số nguyên.
], accent: rgb("#047857"), fill: rgb("#ecfdf5"))

#text(size: 13pt, weight: "bold", fill: rgb("#115e8c"))[Cách dùng bộ học liệu]

- *Bản học sinh:* nội dung, hình vẽ, ví dụ, 24 câu tự kiểm tra phân theo 4 tiết.
- *Bản giáo viên:* thêm gợi ý tổ chức hoạt động và phụ lục lời giải; biên dịch với `--input teacher=1`.
- *Bản SCORM 1.2:* mỗi câu có nút *Kiểm tra*, *Gợi ý*, phản hồi và lưu tiến độ trên LMS; có thể mở độc lập trong trình duyệt.

#v(1em)
#text(size: 13pt, weight: "bold", fill: rgb("#115e8c"))[Lộ trình 4 tiết]

#table(
  columns: (1fr, 2.3fr, 2.1fr),
  inset: 8pt,
  stroke: 0.5pt + rgb("#cbd5e1"),
  [*Tiết*], [*Trọng tâm*], [*Sản phẩm học tập*],
  [1], [Mô hình và nghiệm], [Lập hệ, thử cặp số],
  [2], [Miền nghiệm], [Vẽ bờ, tô phần giao],
  [3], [Đỉnh và tối ưu], [Lập bảng giá trị đỉnh],
  [4], [Vận dụng], [Giải thích phương án thực tế],
)

#pagebreak()
#include "sections/01-mo-hinh-va-nghiem.typ"
#pagebreak()
#include "sections/02-bieu-dien-mien-nghiem.typ"
#pagebreak()
#include "sections/03-dinh-va-toi-uu.typ"
#pagebreak()
#include "sections/04-mo-hinh-va-van-dung.typ"

#teacher-key()
