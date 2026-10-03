#import "../../giao-an/modules/lecture-beamer.typ": *

#show: lecture-theme.with(
  title: [Phương Trình Quy Về Bậc Hai],
  subtitle: [TOÁN 10 — PHƯƠNG TRÌNH CHỨA CĂN THỨC],
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
// PHẦN I: DẠNG sqrt(A) = sqrt(B)
// ════════════════════════════════════════════════
#lt-section-link("sec-ly-thuyet-1", "📚", [I. Phương trình dạng $sqrt(A) = sqrt(B)$])

#lt-slide-back(title: "📚 Dạng 1: Hai căn thức bằng nhau")[
  #lt-theorem(title: "Phương pháp giải tổng quát")[
    Phương trình $sqrt(f(x)) = sqrt(g(x))$ tương đương với hệ:
    $ cases(
      f(x) >= 0 quad (text("hoặc ") g(x) >= 0),
      f(x) = g(x)
    ) $
  ]
  #v(0.5em)
  #lt-important(title: "Lưu ý chiến thuật")[
    1. Chỉ cần chọn *MỘT TRONG HAI* điều kiện $f(x) >= 0$ hoặc $g(x) >= 0$. 
    2. Hãy ưu tiên chọn biểu thức nào đơn giản hơn (thường là bậc nhất) để giải điều kiện cho nhanh.
    3. Bình phương hai vế làm mất căn.
  ]
]

#lt-slide-back(title: "⚡ Ví dụ Dạng 1")[
  #lt-example(title: "Ví dụ 1")[
    Giải phương trình: $sqrt(2x^2 - 3x - 1) = sqrt(2x + 3)$
  ]
  #lt-solution[
    Phương trình tương đương với hệ:
    $ cases(
      2x + 3 >= 0 quad (text("chọn vì bậc 1 đơn giản hơn")),
      2x^2 - 3x - 1 = 2x + 3
    ) $
    $ <=> cases(
      x >= -3/2,
      2x^2 - 5x - 4 = 0
    ) $
    Giải phương trình $2x^2 - 5x - 4 = 0$, ta được $x_1 = (5 + sqrt(57))/4$ và $x_2 = (5 - sqrt(57))/4$.
    Kiểm tra điều kiện $x >= -1.5$, cả hai nghiệm đều thỏa mãn.
    Vậy $S = {(5 - sqrt(57))/4 ; (5 + sqrt(57))/4}$.
  ]
]

// ════════════════════════════════════════════════
// PHẦN II: DẠNG sqrt(A) = B
// ════════════════════════════════════════════════
#lt-section-link("sec-ly-thuyet-2", "🚀", [II. Phương trình dạng $sqrt(A) = B$])

#lt-slide-back(title: "🚀 Dạng 2: Căn thức bằng đa thức")[
  #lt-theorem(title: "Phương pháp giải")[
    Phương trình $sqrt(f(x)) = g(x)$ tương đương với hệ:
    $ cases(
      g(x) >= 0,
      f(x) = [g(x)]^2
    ) $
  ]
  #lt-warning(title: "Lỗi thường gặp")[
    Rất nhiều học sinh đặt điều kiện $f(x) >= 0$. Điều này dư thừa vì khi bình phương $f(x) = [g(x)]^2 >= 0$. 
    Điều kiện bắt buộc là biểu thức bên vế không chứa căn phải *không âm* ($g(x) >= 0$) do bằng với một căn bậc chẵn.
  ]
]

#lt-slide-back(title: "⚡ Ví dụ Dạng 2")[
  #lt-example(title: "Ví dụ 2")[
    Giải phương trình $sqrt(2x^2 + 3x - 2) = x + 1$
  ]
  #lt-solution[
    Phương trình tương đương:
    $ cases(
      x + 1 >= 0,
      2x^2 + 3x - 2 = (x + 1)^2
    ) <=> cases(
      x >= -1,
      2x^2 + 3x - 2 = x^2 + 2x + 1
    ) $
    $ <=> cases(
      x >= -1,
      x^2 + x - 3 = 0
    ) $
    Giải pt $x^2 + x - 3 = 0 => x_1 = (-1 + sqrt(13))/2 (approx 1.3)$ và $x_2 = (-1 - sqrt(13))/2 (approx -2.3)$.
    Đối chiếu $x >= -1$, chỉ có $x_1$ thỏa mãn.
    Vậy $S = {(-1 + sqrt(13))/2}$.
  ]
]


// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [III. Luyện tập Trắc Nghiệm])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — PT CHỨA CĂN],
  questions: (
    (num: 1, type: "TN", desc: [Điều kiện phương trình Dạng 1]),
    (num: 2, type: "TN", desc: [Điều kiện phương trình Dạng 2]),
    (num: 3, type: "TN", desc: [Giải phương trình Dạng 1]),
    (num: 4, type: "TN", desc: [Giải phương trình Dạng 2]),
    (num: 5, type: "TN", desc: [Số nghiệm phương trình]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Để giải phương trình $sqrt(x^2 - 2x + 3) = sqrt(x + 1)$, ta dùng hệ điều kiện tối ưu nào?],
  (
    [$cases(x^2 - 2x + 3 >= 0, x^2 - 2x + 3 = x + 1)$],
    [$cases(x + 1 >= 0, x^2 - 2x + 3 = x + 1)$],
    [$cases(x^2 - 2x + 3 >= 0, x + 1 >= 0, x^2 - 2x + 3 = x + 1)$],
    [$x^2 - 2x + 3 = x + 1$]
  ),
  correct: 1,
  num: 1,
  de: "Điều kiện phương trình Dạng 1",
  loigiai: [
    Nên chọn đặt điều kiện cho biểu thức đơn giản hơn. Ở đây $x + 1 >= 0$ đơn giản hơn rất nhiều so với xét dấu bậc hai.
    Do đó chọn hệ $x + 1 >= 0$ và bình phương 2 vế.
  ]
)

#lt-tn(
  [Điều kiện có nghiệm của phương trình $sqrt(3x^2 - 4x + 1) = 2x - 3$ là:],
  (
    [$3x^2 - 4x + 1 >= 0$],
    [$2x - 3 > 0$],
    [$2x - 3 >= 0$],
    [$cases(3x^2 - 4x + 1 >= 0, 2x - 3 >= 0)$]
  ),
  correct: 2,
  num: 2,
  de: "Điều kiện phương trình Dạng 2",
  loigiai: [
    Phương trình dạng $sqrt(A) = B$ chỉ cần điều kiện $B >= 0$. Tức là $2x - 3 >= 0$.
  ]
)

#lt-tn(
  [Tập nghiệm của phương trình $sqrt(x^2 - 3x) = sqrt(2x - 4)$ là:],
  (
    [${1; 4}$],
    [${4}$],
    [${1}$],
    [$emptyset$]
  ),
  correct: 1,
  num: 3,
  de: "Giải phương trình Dạng 1",
  loigiai: [
    Hệ $cases(2x - 4 >= 0, x^2 - 3x = 2x - 4) <=> cases(x >= 2, x^2 - 5x + 4 = 0)$
    Phương trình bậc hai có nghiệm $x=1$ (loại vì $< 2$) và $x=4$ (nhận).
    Vậy tập nghiệm là ${4}$.
  ]
)

#lt-tn(
  [Số nghiệm của phương trình $sqrt(2x^2 + 5x - 3) = x + 1$ là:],
  (
    [$0$],
    [$1$],
    [$2$],
    [$3$]
  ),
  correct: 1,
  num: 4,
  de: "Số nghiệm phương trình",
  loigiai: [
    Hệ $cases(x + 1 >= 0, 2x^2 + 5x - 3 = x^2 + 2x + 1) <=> cases(x >= -1, x^2 + 3x - 4 = 0)$
    Nghiệm phương trình bậc hai: $x = 1$ (nhận) và $x = -4$ (loại).
    Phương trình có đúng 1 nghiệm.
  ]
)

#lt-tn(
  [Tổng các nghiệm của phương trình $sqrt(x^2 - x - 2) = x - 2$ là:],
  (
    [$0$],
    [$2$],
    [$4$],
    [Vô nghiệm]
  ),
  correct: 1,
  num: 5,
  de: "Tổng các nghiệm",
  loigiai: [
    Hệ $cases(x - 2 >= 0, x^2 - x - 2 = (x - 2)^2) <=> cases(x >= 2, x^2 - x - 2 = x^2 - 4x + 4)$
    $<=> cases(x >= 2, 3x = 6 <=> x = 2)$
    Thử lại với $x=2$: $sqrt(0) = 0$ (thoả mãn).
    Vậy nghiệm duy nhất là $x=2$. Tổng các nghiệm là $2$.
  ]
)
