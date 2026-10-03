#import "../../giao-an/modules/lecture-beamer.typ": *

#show: lecture-theme.with(
  title: [Quy Tắc Đếm Cơ Bản],
  subtitle: [TOÁN 10 — QUY TẮC CỘNG VÀ QUY TẮC NHÂN],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG CHUYÊN SÂU])

// ════════════════════════════════════════════════
// PHẦN I: QUY TẮC CỘNG VÀ QUY TẮC NHÂN
// ════════════════════════════════════════════════
#lt-section-link("sec-ly-thuyet", "📚", [I. Lý Thuyết: Quy Tắc Cộng & Quy Tắc Nhân])

#lt-slide-back(title: "📚 1. Quy tắc cộng (Chia trường hợp)")[
  #lt-theorem(title: "Định nghĩa Quy tắc cộng")[
    Một công việc được hoàn thành bởi một trong hai phương án $A$ hoặc $B$.
    - Phương án $A$ có $m$ cách thực hiện.
    - Phương án $B$ có $n$ cách thực hiện (không trùng với phương án $A$).
    $=>$ Công việc có thể được thực hiện bởi $m + n$ cách.
  ]
  #lt-example(title: "Ví dụ 1")[
    Trong lớp có 15 học sinh nam và 20 học sinh nữ. Giáo viên cần chọn *1 học sinh* đi dự đại hội. Hỏi có bao nhiêu cách chọn?
  ]
  #lt-solution[
    Việc chọn 1 học sinh có 2 phương án:
    - Phương án 1: Chọn nam (có 15 cách).
    - Phương án 2: Chọn nữ (có 20 cách).
    Tổng số cách chọn: $15 + 20 = 35$ cách.
  ]
]

#lt-slide-back(title: "📚 2. Quy tắc nhân (Chia giai đoạn)")[
  #lt-theorem(title: "Định nghĩa Quy tắc nhân")[
    Một công việc được hoàn thành qua *nhiều giai đoạn* liên tiếp.
    - Giai đoạn 1 có $m$ cách thực hiện.
    - Ứng với mỗi cách ở giai đoạn 1, giai đoạn 2 có $n$ cách thực hiện.
    $=>$ Công việc có thể được thực hiện bởi $m dot n$ cách.
  ]
  #lt-example(title: "Ví dụ 2")[
    Bạn An có 3 cái áo phông và 4 chiếc quần jean. An cần chọn *1 bộ* (1 áo và 1 quần) để đi chơi. Có bao nhiêu cách phối đồ?
  ]
  #lt-solution[
    Việc chọn 1 bộ đồ gồm 2 giai đoạn:
    - Giai đoạn 1: Chọn áo (có 3 cách).
    - Giai đoạn 2: Chọn quần (có 4 cách).
    Theo quy tắc nhân, số cách phối đồ là: $3 dot 4 = 12$ cách.
  ]
]

#lt-slide-back(title: "⚡ Phân Biệt Cộng và Nhân")[
  #lt-important(title: "Bí quyết chọn quy tắc")[
    - **Quy tắc cộng:** Dùng chữ **HOẶC** (Phương án). Hoàn thành xong một phương án là đã *kết thúc* công việc.
    - **Quy tắc nhân:** Dùng chữ **VÀ** (Giai đoạn). Phải hoàn thành *tất cả* các giai đoạn thì công việc mới kết thúc.
  ]
]

// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [II. Luyện tập Trắc Nghiệm])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — QUY TẮC ĐẾM],
  questions: (
    (num: 1, type: "TN", desc: [Áp dụng quy tắc cộng]),
    (num: 2, type: "TN", desc: [Áp dụng quy tắc nhân]),
    (num: 3, type: "TN", desc: [Hành trình đi đường]),
    (num: 4, type: "TN", desc: [Kết hợp cộng và nhân]),
    (num: 5, type: "TN", desc: [Đếm số tự nhiên cơ bản]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Một tổ gồm 8 học sinh nam và 6 học sinh nữ. Cần chọn một học sinh đi trực nhật. Có bao nhiêu cách chọn?],
  (
    [$14$],
    [$48$],
    [$8$],
    [$6$]
  ),
  correct: 0,
  num: 1,
  de: "Áp dụng quy tắc cộng",
  loigiai: [
    Công việc chọn 1 học sinh chia làm 2 phương án (chọn nam hoặc chọn nữ).
    Số cách chọn: $8 + 6 = 14$ cách.
  ]
)

#lt-tn(
  [Một nhà hàng có 5 món khai vị, 4 món chính và 3 món tráng miệng. Một thực khách muốn chọn một thực đơn gồm đúng 3 món (khai vị, chính, tráng miệng). Có bao nhiêu cách chọn?],
  (
    [$12$],
    [$20$],
    [$60$],
    [$15$]
  ),
  correct: 2,
  num: 2,
  de: "Áp dụng quy tắc nhân",
  loigiai: [
    Việc chọn thực đơn gồm 3 giai đoạn.
    Giai đoạn 1 (khai vị): 5 cách.
    Giai đoạn 2 (chính): 4 cách.
    Giai đoạn 3 (tráng miệng): 3 cách.
    Số cách chọn: $5 dot 4 dot 3 = 60$.
  ]
)

#lt-tn(
  [Từ A đến B có 3 con đường, từ B đến C có 4 con đường. Hỏi có bao nhiêu cách đi từ A đến C mà phải qua B?],
  (
    [$7$],
    [$12$],
    [$81$],
    [$64$]
  ),
  correct: 1,
  num: 3,
  de: "Hành trình đi đường",
  loigiai: [
    Công việc đi từ A đến C qua B gồm 2 giai đoạn:
    - Đi A đến B: 3 cách.
    - Đi B đến C: 4 cách.
    Tổng số cách: $3 dot 4 = 12$ cách.
  ]
)

#lt-tn(
  [Từ các chữ số $1, 2, 3, 4, 5, 6$. Có bao nhiêu số tự nhiên gồm 3 chữ số khác nhau?],
  (
    [$18$],
    [$120$],
    [$216$],
    [$720$]
  ),
  correct: 1,
  num: 4,
  de: "Đếm số tự nhiên",
  loigiai: [
    Gọi số cần tìm là $a b c$.
    - Chọn $a$: 6 cách.
    - Chọn $b$ (khác $a$): 5 cách.
    - Chọn $c$ (khác $a, b$): 4 cách.
    Theo quy tắc nhân: $6 dot 5 dot 4 = 120$ số.
  ]
)

#lt-tn(
  [Một thư viện có 10 quyển sách Toán và 8 quyển sách Lý. Học sinh cần mượn 2 quyển sách KHÁC LOẠI. Số cách mượn là:],
  (
    [$18$],
    [$80$],
    [$10$],
    [$8$]
  ),
  correct: 1,
  num: 5,
  de: "Chọn phần tử khác loại",
  loigiai: [
    Mượn 2 quyển khác loại tức là mượn 1 Toán VÀ 1 Lý.
    - Chọn 1 quyển Toán: 10 cách.
    - Chọn 1 quyển Lý: 8 cách.
    Số cách chọn: $10 dot 8 = 80$.
  ]
)
