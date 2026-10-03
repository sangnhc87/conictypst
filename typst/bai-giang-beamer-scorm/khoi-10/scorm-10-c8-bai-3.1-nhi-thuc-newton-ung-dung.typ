#import "../../giao-an/modules/lecture-beamer.typ": *

#show: lecture-theme.with(
  title: [Nhị Thức Newton — Chuyên Sâu],
  subtitle: [TOÁN 10 — KỸ THUẬT TÌM HỆ SỐ & ỨNG DỤNG],
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
// PHẦN I: KHAI TRIỂN & SỐ HẠNG TỔNG QUÁT
// ════════════════════════════════════════════════
#lt-section-link("sec-ly-thuyet", "📚", [I. Khai Triển Cơ Bản & Số Hạng Tổng Quát])

#lt-slide-back(title: "📚 Nhắc Lại Khai Triển Cơ Bản (n = 4, 5)")[
  #lt-definition(title: "Công thức Nhị thức Newton")[
    Khai triển $(a + b)^n$ (với $n=4, 5$) bằng Tam giác Pascal:
    $ (a + b)^4 = a^4 + 4 a^3 b + 6 a^2 b^2 + 4 a b^3 + b^4 $
    $ (a + b)^5 = a^5 + 5 a^4 b + 10 a^3 b^2 + 10 a^2 b^3 + 5 a b^4 + b^5 $
  ]
  #v(0.2em)
  #lt-important(title: "Tính chất")[
    - Có $n+1$ số hạng.
    - Tổng số mũ của $a$ và $b$ trong mỗi số hạng luôn bằng $n$.
    - Hệ số đối xứng.
  ]
]

#lt-slide-back(title: "⚡ Số Hạng Tổng Quát (Chìa khóa giải quyết bài toán)")[
  #lt-theorem(title: "Số hạng thứ k+1 trong khai triển")[
    Trong khai triển $(a + b)^n$, số hạng thứ $k+1$ được ký hiệu là $T_{k+1}$:
    $ T_{k+1} = C_n^k a^{n-k} b^k $
    với $0 <= k <= n$.
  ]
  #lt-tip(title: "Cách dùng trong bài toán tìm hệ số")[
    1. Viết số hạng tổng quát $T_{k+1}$.
    2. Gom tất cả hệ số về một nhóm, ẩn $x$ về một nhóm (sử dụng tính chất lũy thừa).
    3. Cho số mũ của $x$ bằng với yêu cầu bài toán để giải tìm $k$.
    4. Thay $k$ trở lại phần hệ số.
  ]
]

// ════════════════════════════════════════════════
// PHẦN II: CÁC DẠNG BÀI TẬP ĐIỂN HÌNH
// ════════════════════════════════════════════════
#lt-section-link("sec-dang-toan", "🚀", [II. Kỹ Thuật Tìm Hệ Số Trong Khai Triển])

#lt-slide-back(title: "🚀 Dạng 1: Tìm hệ số của x^m trong khai triển (a x + b)^n")[
  #lt-example(title: "Ví dụ 1")[
    Tìm hệ số của $x^3$ trong khai triển của $(2x - 3)^5$.
  ]
  #lt-solution[
    *Bước 1:* Viết số hạng tổng quát:
    $ T_{k+1} = C_5^k (2x)^{5-k} (-3)^k = C_5^k 2^{5-k} (-3)^k x^{5-k} $
    
    *Bước 2:* Yêu cầu tìm hệ số của $x^3$, nên ta cho số mũ của $x$ bằng 3:
    $ 5 - k = 3 <=> k = 2 $
    
    *Bước 3:* Thay $k = 2$ vào phần hệ số:
    Hệ số cần tìm là: $C_5^2 2^{5-2} (-3)^2 = 10 dot 8 dot 9 = 720$.
  ]
]

#lt-slide-back(title: "🚀 Dạng 2: Khai triển chứa đa thức phức tạp")[
  #lt-example(title: "Ví dụ 2")[
    Tìm hệ số của $x^5$ trong khai triển $P(x) = (x - 2)(2x + 1)^4$.
  ]
  #lt-solution[
    Ta viết lại $P(x) = x(2x + 1)^4 - 2(2x + 1)^4$.
    
    Để tìm hệ số của $x^5$ trong $P(x)$:
    1. Tìm hệ số của $x^4$ trong khai triển $(2x+1)^4$, rồi nhân với hệ số của $x$ (là 1).
    2. Tìm hệ số của $x^5$ trong khai triển $(2x+1)^4$, rồi nhân với $-2$. (Trường hợp này không có vì lũy thừa cao nhất là 4).
    
    Khai triển $(2x+1)^4$: Số hạng chứa $x^4$ là $(2x)^4 = 16x^4$.
    Hệ số của $x^5$ trong $P(x)$ là $1 dot 16 = 16$.
  ]
]

// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [III. Luyện tập Trắc Nghiệm])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — NHỊ THỨC NEWTON],
  questions: (
    (num: 1, type: "TN", desc: [Tổng các hệ số]),
    (num: 2, type: "TN", desc: [Tìm hệ số cơ bản]),
    (num: 3, type: "TN", desc: [Tìm hệ số có phân thức]),
    (num: 4, type: "TN", desc: [Số hạng không chứa x]),
    (num: 5, type: "TN", desc: [Khai triển hai nhị thức]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Tổng các hệ số trong khai triển của nhị thức $(2x - 3)^5$ bằng:],
  (
    [$-1$],
    [$1$],
    [$32$],
    [$-32$]
  ),
  correct: 0,
  num: 1,
  de: "Tổng các hệ số của khai triển",
  loigiai: [
    Tổng các hệ số của một đa thức $P(x)$ chính là giá trị của đa thức đó tại $x = 1$.
    Thay $x = 1$ vào nhị thức: $(2(1) - 3)^5 = (-1)^5 = -1$.
  ]
)

#lt-tn(
  [Hệ số của $x^3$ trong khai triển $(x + 2)^5$ là:],
  (
    [$10$],
    [$20$],
    [$40$],
    [$80$]
  ),
  correct: 2,
  num: 2,
  de: "Tìm hệ số cơ bản",
  loigiai: [
    Số hạng tổng quát: $T_{k+1} = C_5^k x^{5-k} 2^k$.
    Để có $x^3$ thì $5 - k = 3 <=> k = 2$.
    Hệ số là: $C_5^2 2^2 = 10 dot 4 = 40$.
  ]
)

#lt-tn(
  [Tìm số hạng không chứa $x$ trong khai triển của $(x - 1/x)^4$.],
  (
    [$6$],
    [$-6$],
    [$4$],
    [$-4$]
  ),
  correct: 0,
  num: 3,
  de: "Số hạng không chứa x",
  loigiai: [
    $T_{k+1} = C_4^k x^{4-k} (- x^{-1})^k = C_4^k (-1)^k x^{4-2k}$.
    Số hạng không chứa $x$ ứng với số mũ bằng 0: $4 - 2k = 0 <=> k = 2$.
    Số hạng đó là $C_4^2 (-1)^2 = 6$.
  ]
)

#lt-tn(
  [Trong khai triển của $(x^2 + 2/x)^5$, hệ số của $x^4$ là:],
  (
    [$40$],
    [$80$],
    [$10$],
    [$32$]
  ),
  correct: 0,
  num: 4,
  de: "Khai triển với bậc khác nhau",
  loigiai: [
    $T_{k+1} = C_5^k (x^2)^{5-k} (2 x^{-1})^k = C_5^k 2^k x^{10-2k-k} = C_5^k 2^k x^{10-3k}$.
    Để có $x^4$, ta có $10 - 3k = 4 <=> 3k = 6 <=> k = 2$.
    Hệ số là $C_5^2 2^2 = 10 dot 4 = 40$.
  ]
)

#lt-tn(
  [Tìm hệ số của $x^4$ trong khai triển của biểu thức $P(x) = (1 - x)(1 + 2x)^4$.],
  (
    [$8$],
    [$-16$],
    [$-8$],
    [$24$]
  ),
  correct: 1,
  num: 5,
  de: "Khai triển tổ hợp đa thức",
  loigiai: [
    Khai triển $(1 + 2x)^4 = C_4^0 + C_4^1(2x) + C_4^2(2x)^2 + C_4^3(2x)^3 + C_4^4(2x)^4$
    $= 1 + 8x + 24x^2 + 32x^3 + 16x^4$.
    Biểu thức: $P(x) = (1 - x)(1 + 8x + 24x^2 + 32x^3 + 16x^4)$.
    Hệ số của $x^4$ trong tích bằng: $1 dot (16) + (-1) dot (32) = 16 - 32 = -16$.
  ]
)
