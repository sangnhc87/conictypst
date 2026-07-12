// ====================================================================
// Beamer Theme: Teal Pro (Light)
// ====================================================================
#import "../../../typst-pkg-submit/sang-beamer.typ": *

// Định nghĩa trọn bộ màu sắc để màu chữ, màu toán học và nền ăn khớp 100%
#show: sang-beamer-theme.with(
  title: "BÀI GIẢNG TOÁN 12",
  subtitle: "Giao diện: Teal Pro (Light)",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Chuyên",
  
  bg_color: rgb("#f0fdfa"),
  accent: rgb("#0f766e"),
  text_fill: rgb("#0f172a"),
  math_color: rgb("#115e59"),
)

#let (mcq, tf, short) = exam-mode(mode: "loigiai")

// ====================================================================

#exam-part([PHẦN I. CÂU HỎI TRẮC NGHIỆM])

#mcq(
  [Tìm tập nghiệm của bất phương trình $log_2 (x - 1) > 3$.],
  (
    [$(1; 9)$],
    True([$(9; +oo)$]),
    [$(8; +oo)$],
    [$(1; 8)$]
  ),
  solution: [
    Điều kiện: $x - 1 > 0 <=> x > 1$.
    
    Ta có $log_2 (x - 1) > 3 <=> x - 1 > 2^3 <=> x > 9$.
    
    Kết hợp điều kiện, ta được $x > 9$. Chọn B.
  ]
)
