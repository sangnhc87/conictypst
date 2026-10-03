#import "../../giao-an/modules/lecture-beamer.typ": *

#show: lecture-theme.with(
  title: [Đạo Hàm và Ý Nghĩa],
  subtitle: [TOÁN 11 — CHƯƠNG ĐẠO HÀM],
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
// PHẦN I: ĐỊNH NGHĨA ĐẠO HÀM TẠI MỘT ĐIỂM
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia", "📚", [I. Khái niệm Đạo hàm tại một điểm])

#lt-slide-back(title: "📚 Định nghĩa Đạo hàm")[
  #lt-definition(title: "Định nghĩa")[
    Cho hàm số $y = f(x)$ xác định trên khoảng $(a; b)$ và $x_0 in (a; b)$.
    Giới hạn hữu hạn (nếu có) của tỉ số $(f(x) - f(x_0))/(x - x_0)$ khi $x -> x_0$ được gọi là *đạo hàm* của hàm số $f(x)$ tại điểm $x_0$.
    Ký hiệu: $f'(x_0)$ hoặc $y'(x_0)$.
    $ f'(x_0) = lim_(x -> x_0) (f(x) - f(x_0))/(x - x_0) $
  ]
  #lt-tip(title: "Ghi nhớ qua số gia")[
    Đặt $Delta x = x - x_0$ (số gia của đối số) và $Delta y = f(x_0 + Delta x) - f(x_0)$ (số gia của hàm số).
    Ta có: $f'(x_0) = lim_(Delta x -> 0) (Delta y)/(Delta x)$
  ]
]

// ════════════════════════════════════════════════
// PHẦN II: Ý NGHĨA CỦA ĐẠO HÀM
// ════════════════════════════════════════════════
#lt-section-link("sec-y-nghia", "🚀", [II. Ý Nghĩa Hình Học & Vật Lý])

#lt-slide-back(title: "🚀 Ý nghĩa Hình học")[
  #lt-theorem(title: "Hệ số góc của tiếp tuyến")[
    Đạo hàm $f'(x_0)$ chính là *hệ số góc* của tiếp tuyến với đồ thị $(C)$ của hàm số $y = f(x)$ tại điểm $M(x_0; y_0)$.
  ]
  #lt-definition(title: "Phương trình tiếp tuyến")[
    Phương trình tiếp tuyến của đồ thị $(C)$ tại điểm $M_0(x_0; f(x_0))$ là:
    $ y = f'(x_0)(x - x_0) + f(x_0) $
  ]
]

#lt-slide-back(title: "⚡ Ý nghĩa Vật lý & Thực tiễn")[
  #lt-example(title: "1. Vận tốc tức thời")[
    Nếu $s = f(t)$ là phương trình chuyển động của một vật, thì đạo hàm $s'(t_0)$ chính là *vận tốc tức thời* của vật tại thời điểm $t_0$.
    $ v(t_0) = s'(t_0) $
  ]
  #lt-example(title: "2. Cường độ dòng điện tức thời")[
    Nếu $Q = Q(t)$ là điện lượng truyền qua tiết diện dây dẫn, thì cường độ dòng điện tức thời tại thời điểm $t_0$ là:
    $ I(t_0) = Q'(t_0) $
  ]
]

// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [III. Luyện tập Trắc Nghiệm])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — ĐẠO HÀM CƠ BẢN],
  questions: (
    (num: 1, type: "TN", desc: [Tính đạo hàm bằng định nghĩa]),
    (num: 2, type: "TN", desc: [Hệ số góc tiếp tuyến]),
    (num: 3, type: "TN", desc: [Phương trình tiếp tuyến]),
    (num: 4, type: "TN", desc: [Ý nghĩa vật lý (Vận tốc)]),
    (num: 5, type: "TN", desc: [Điều kiện có đạo hàm]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho hàm số $f(x) = x^2$. Giá trị của đạo hàm $f'(2)$ bằng bao nhiêu?],
  (
    [$2$],
    [$4$],
    [$8$],
    [$0$]
  ),
  correct: 1,
  num: 1,
  de: "Tính đạo hàm tại một điểm",
  loigiai: [
    Ta có: $f'(2) = lim_(x -> 2) (f(x) - f(2))/(x - 2) = lim_(x -> 2) (x^2 - 4)/(x - 2)$
    $= lim_(x -> 2) ((x-2)(x+2))/(x-2) = lim_(x -> 2) (x + 2) = 4$.
  ]
)

#lt-tn(
  [Hệ số góc của tiếp tuyến với đồ thị hàm số $y = x^3 - 2x + 1$ tại điểm có hoành độ $x_0 = 1$ là:],
  (
    [$0$],
    [$1$],
    [$2$],
    [$3$]
  ),
  correct: 1,
  num: 2,
  de: "Hệ số góc tiếp tuyến",
  loigiai: [
    Ta có $y' = 3x^2 - 2$.
    Hệ số góc tiếp tuyến tại $x_0 = 1$ là $k = y'(1) = 3(1)^2 - 2 = 1$.
  ]
)

#lt-tn(
  [Phương trình tiếp tuyến của đồ thị hàm số $y = x^2 - 3x$ tại điểm $M(1; -2)$ là:],
  (
    [$y = -x - 1$],
    [$y = x - 3$],
    [$y = -x + 1$],
    [$y = 2x - 4$]
  ),
  correct: 0,
  num: 3,
  de: "Phương trình tiếp tuyến",
  loigiai: [
    Đạo hàm $y' = 2x - 3$.
    Hệ số góc tại $x_0 = 1$ là $k = y'(1) = 2(1) - 3 = -1$.
    Phương trình tiếp tuyến: $y = -1(x - 1) - 2 <=> y = -x - 1$.
  ]
)

#lt-tn(
  [Một vật chuyển động có phương trình $s(t) = t^2 - 4t + 5$ ($s$ tính bằng mét, $t$ tính bằng giây). Vận tốc tức thời của vật tại thời điểm $t = 3$ giây là:],
  (
    [$2$ m/s],
    [$3$ m/s],
    [$4$ m/s],
    [$5$ m/s]
  ),
  correct: 0,
  num: 4,
  de: "Vận tốc tức thời",
  loigiai: [
    Vận tốc tức thời là đạo hàm của quãng đường theo thời gian:
    $v(t) = s'(t) = 2t - 4$.
    Vận tốc tại $t=3$ là $v(3) = 2(3) - 4 = 2$ m/s.
  ]
)

#lt-tn(
  [Trong các phát biểu sau, phát biểu nào ĐÚNG?],
  (
    [Hàm số liên tục tại điểm $x_0$ thì có đạo hàm tại $x_0$.],
    [Hàm số có đạo hàm tại $x_0$ thì liên tục tại $x_0$.],
    [Hàm số không liên tục tại $x_0$ vẫn có thể có đạo hàm tại $x_0$.],
    [Đạo hàm của hàm số tại $x_0$ là một biểu thức chứa $x$.]
  ),
  correct: 1,
  num: 5,
  de: "Mối liên hệ liên tục và đạo hàm",
  loigiai: [
    Định lý quan trọng: "Nếu hàm số có đạo hàm tại một điểm thì nó liên tục tại điểm đó".
    Chiều ngược lại không đúng (ví dụ hàm $y = |x|$ liên tục tại $x=0$ nhưng không có đạo hàm tại $x=0$).
  ]
)
