#import "../../giao-an/modules/lecture-beamer.typ": *

#show: lecture-theme.with(
  title: [Giới Hạn Hàm Số],
  subtitle: [TOÁN 11 — CHƯƠNG GIỚI HẠN VÀ LIÊN TỤC],
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
// PHẦN I: LÝ THUYẾT
// ════════════════════════════════════════════════
#lt-section-link("sec-ly-thuyet", "📚", [I. Giới Hạn Của Hàm Số])

#lt-slide-back(title: "📚 1. Giới hạn hữu hạn tại một điểm")[
  #lt-definition(title: "Khái niệm")[
    Cho hàm số $f(x)$ xác định trên khoảng $K$ chứa $x_0$ (có thể trừ $x_0$). Ta nói hàm số $f(x)$ có giới hạn là số $L$ khi $x$ dần tới $x_0$ nếu với mọi dãy số $(x_n) subset K \\ {x_0}$ mà $lim(x_n) = x_0$ thì ta luôn có $lim(f(x_n)) = L$.
    Ký hiệu: $lim_(x -> x_0) f(x) = L$
  ]
  #lt-important(title: "Các định lý cơ bản")[
    Nếu $lim_(x -> x_0) f(x) = L$ và $lim_(x -> x_0) g(x) = M$, ta có:
    - $lim_(x -> x_0) [f(x) +- g(x)] = L +- M$
    - $lim_(x -> x_0) [f(x) dot g(x)] = L dot M$
    - $lim_(x -> x_0) (f(x))/(g(x)) = L/M$ (với $M != 0$)
  ]
]

#lt-slide-back(title: "🚀 2. Dạng vô định 0/0")[
  #lt-theorem(title: "Phương pháp khử dạng 0/0")[
    Khi tính $lim_(x -> x_0) (P(x))/(Q(x))$ mà $P(x_0) = 0$ và $Q(x_0) = 0$, ta gặp dạng vô định $0/0$.
    *Cách giải:*
    - Phân tích tử và mẫu thành nhân tử để triệt tiêu đại lượng $(x - x_0)$.
    - Nếu có chứa căn thức, ta nhân với biểu thức liên hợp tương ứng trước khi phân tích.
  ]
  #lt-example(title: "Ví dụ khử 0/0")[
    Tính giới hạn: $I = lim_(x -> 2) (x^2 - 4)/(x - 2)$
    Giải: Ta có $I = lim_(x -> 2) ((x-2)(x+2))/(x-2) = lim_(x -> 2) (x+2) = 4$.
  ]
]

#lt-slide-back(title: "⚡ 3. Giới hạn tại vô cực")[
  #lt-important(title: "Quy tắc khi x tiến đến vô cực")[
    Khi tính giới hạn của đa thức/phân thức khi $x -> +- oo$, ta chia cả tử và mẫu cho $x$ với số mũ cao nhất.
    Chú ý: Khi đưa $x$ vào trong hoặc ra ngoài căn bậc chẵn, nếu $x -> -oo$ thì phải có dấu trừ $(-)$ phía ngoài.
  ]
]


// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [II. Luyện tập Trắc Nghiệm])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — GIỚI HẠN],
  questions: (
    (num: 1, type: "TN", desc: [Giới hạn đa thức cơ bản]),
    (num: 2, type: "TN", desc: [Dạng vô định 0/0]),
    (num: 3, type: "TN", desc: [Nhân lượng liên hợp]),
    (num: 4, type: "TN", desc: [Giới hạn vô cực (phân thức)]),
    (num: 5, type: "TN", desc: [Tính chất giới hạn tổng]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Tính $lim_(x -> 1) (2x^2 - 3x + 5)$],
  (
    [$0$],
    [$4$],
    [$6$],
    [$-1$]
  ),
  correct: 1,
  num: 1,
  de: "Thế trực tiếp",
  loigiai: [
    Thay trực tiếp $x = 1$ vào biểu thức:
    $L = 2(1)^2 - 3(1) + 5 = 2 - 3 + 5 = 4$.
  ]
)

#lt-tn(
  [Tính $lim_(x -> -1) (x^2 - 1)/(x + 1)$],
  (
    [$-2$],
    [$0$],
    [$2$],
    [Không tồn tại]
  ),
  correct: 0,
  num: 2,
  de: "Khử dạng 0/0",
  loigiai: [
    Dạng vô định $0/0$.
    Ta có: $lim_(x -> -1) ((x-1)(x+1))/(x+1) = lim_(x -> -1) (x-1) = -1 - 1 = -2$.
  ]
)

#lt-tn(
  [Tính giới hạn $lim_(x -> 0) (sqrt(x + 4) - 2)/x$],
  (
    [$0$],
    [$1/4$],
    [$1/2$],
    [$1$]
  ),
  correct: 1,
  num: 3,
  de: "Nhân lượng liên hợp",
  loigiai: [
    Nhân tử và mẫu với $(sqrt(x+4) + 2)$:
    $L = lim_(x -> 0) ((x+4)-4)/(x(sqrt(x+4)+2)) = lim_(x -> 0) 1/(sqrt(x+4)+2) = 1/(sqrt(4)+2) = 1/4$.
  ]
)

#lt-tn(
  [Tính $lim_(x -> +oo) (3x - 1)/(2x + 5)$],
  (
    [$3/5$],
    [$3/2$],
    [$+oo$],
    [$0$]
  ),
  correct: 1,
  num: 4,
  de: "Giới hạn tại vô cực",
  loigiai: [
    Chia cả tử và mẫu cho $x$, ta được:
    $L = lim_(x -> +oo) (3 - 1/x)/(2 + 5/x) = 3/2$.
  ]
)

#lt-tn(
  [Biết $lim_(x -> 2) f(x) = 3$ và $lim_(x -> 2) g(x) = -1$. Khi đó $lim_(x -> 2) [f(x) - 2g(x)]$ bằng:],
  (
    [$1$],
    [$5$],
    [$4$],
    [$7$]
  ),
  correct: 1,
  num: 5,
  de: "Tính chất giới hạn",
  loigiai: [
    Theo tính chất: $L = lim_(x -> 2) f(x) - 2 lim_(x -> 2) g(x) = 3 - 2(-1) = 3 + 2 = 5$.
  ]
)
