// ====================================================================
// Beamer Theme: Aurora Borealis (Dark)
// ====================================================================
#import "../../../typst-pkg-submit/sang-beamer.typ": *

// Định nghĩa trọn bộ màu sắc để màu chữ, màu toán học và nền ăn khớp 100%
#show: sang-beamer-theme.with(
  title: "BÀI GIẢNG TOÁN 12",
  subtitle: "Giao diện: Aurora Borealis (Dark)",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Chuyên",
  
  bg_color: rgb("#0f172a"),
  accent: rgb("#10b981"),
  text_fill: rgb("#f8fafc"),
  math_color: rgb("#34d399"),
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
