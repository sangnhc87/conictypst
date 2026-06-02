#import "../_config.typ": *

#loinoidau(theme-color: c-book)[
  Đạo hàm không chỉ là công cụ tính toán thuần túy — đó là ngôn ngữ mà
  Tự nhiên dùng để viết lên những quy luật vận động, tối ưu và thay đổi.
  Từ người nông dân chia lô đất sao cho tối đa diện tích, kỹ sư thiết kế
  bồn chứa tiết kiệm vật liệu nhất, bác sĩ theo dõi nồng độ thuốc trong
  máu, đến nhà kinh tế tìm điểm lợi nhuận cực đại — tất cả đều đang giải
  một bài toán đạo hàm.

  Quyển sách này ra đời với triết lý: *học toán qua chính những câu hỏi
  mà cuộc sống đặt ra*. Thay vì ghi nhớ công thức, học sinh sẽ luyện kỹ
  năng *mô hình hóa* — chuyển ngôn ngữ mô tả đời sống thành ngôn ngữ đại
  số, rồi dùng đạo hàm để khai thác kết quả.

  Phương pháp dẫn dắt xuyên suốt là *"Conan Logic"*: trước mỗi bài toán,
  thay vì tính ngay, hãy hỏi _"Bài toán này đang ẩn những gì? Ràng buộc
  nào giúp rút biến? Hàm mục tiêu là gì?"_. Chỉ khi hiểu đúng bản chất,
  việc tính đạo hàm mới có ý nghĩa.

  Chúc các em học tốt và thực sự *thấy được vẻ đẹp ứng dụng* của Toán học!
]

#huongdansudung(theme-color: c-book)[
  Mỗi *Chủ đề* được tổ chức theo bốn lớp nhất quán:

  + *Hộp Phương pháp* — Tóm tắt 3–4 bước giải tư duy "Conan Logic", chốt
    công thức/bất đẳng thức cần nhớ.
  + *Ví dụ mẫu* — Bài toán ngữ cảnh thực tế, giải chi tiết từng bước.
    Hình vẽ minh họa kèm theo (kể cả khi đề không yêu cầu) giúp học sinh
    hình dung mô hình.
  + *Lưu ý / Bẫy thường gặp* — Những sai lầm điển hình cần tránh.
  + *Bài tập tự luyện* — Phân hóa từ nhận biết đến vận dụng cao, kèm
    gợi ý hướng giải khi cần.

  Các ký hiệu hộp được dùng thống nhất trong toàn quyển:

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    row-gutter: 0.6em,
    phuongphap[Hộp *Phương pháp* — Quy trình giải], ghinho[Hộp *Ghi nhớ* — Công thức, tính chất quan trọng],
    luuy[Hộp *Lưu ý* — Bẫy thường gặp, điều kiện dễ quên], nhanxet[Hộp *Nhận xét* — Mở rộng, liên hệ liên môn],
  )
]

#muctieuchung(theme-color: c-book)[
  Sau khi hoàn thành chuyên đề, học sinh đạt được:

  *Kiến thức:*
  - Hiểu ý nghĩa hình học và thực tế của đạo hàm: tốc độ tăng trưởng,
    cực trị, tốc độ thay đổi tức thời.
  - Nắm vững kỹ thuật rút thế từ ràng buộc để đưa hàm hai biến về một biến.
  - Hiểu nguyên lý biên tế (marginal analysis) trong kinh tế học vi mô.
  - Nắm phương pháp vi phân xấp xỉ và ứng dụng trong phân tích sai số.

  *Kỹ năng:*
  - Dịch bài toán thực tế thành mô hình toán học (hàm mục tiêu + ràng buộc).
  - Tìm giá trị lớn nhất/nhỏ nhất trên đoạn đóng và trên khoảng mở.
  - Đọc hiểu đồ thị $f'(x)$ để suy luận về $f(x)$.
  - Vận dụng linh hoạt các dạng hàm: đa thức, phân thức, vô tỉ,
    lượng giác, mũ, logarit.

  *Thái độ:*
  - Nhận ra và trân trọng sự hiện diện của Toán học trong đời sống.
  - Hình thành tư duy mô hình hóa — kỹ năng nền tảng trong khoa học dữ liệu,
    kỹ thuật và kinh tế thế kỷ 21.
]

// ═══════════════════════════════════════════════════════════════════
// PHẦN 1: KHỞI ĐỘNG – TƯ DUY MÔ HÌNH HÓA VỚI HÀM ĐA THỨC
// ═══════════════════════════════════════════════════════════════════

