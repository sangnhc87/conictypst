// ====================================================================
// Ví dụ 12: Trình chiếu Slide (Beamer) - Chế độ Dark Mode
// ====================================================================
#import "../../typst-pkg-submit/sang-beamer.typ": *

// Khởi tạo giao diện nền tối (Dark Mode)
// Hệ thống sẽ tự động nhận diện nền tối (bg_color luma < 0.5)
// và tự động chuyển đổi toàn bộ màu chữ, màu toán học sang màu trắng/sáng!
#show: sang-beamer-theme.with(
  title: "BÀI GIẢNG TOÁN 12 (DARK MODE)",
  subtitle: "Bảo vệ mắt khi dạy ban đêm",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Chuyên",
  
  // Tuỳ chỉnh giao diện Dark Mode
  bg_color: rgb("#0f172a"),   // Nền xanh đen (slate-900)
  accent: rgb("#facc15"),     // Màu nhấn vàng sáng (yellow-400)
  
  // Tuỳ chọn nâng cao
  total-q: 5,                 // Số lượng câu hiển thị trên thanh điều hướng
)

#let (mcq, tf, short) = exam-mode(mode: "loigiai")

// ====================================================================

#exam-part([PHẦN I. CÂU HỎI TRẮC NGHIỆM ĐA LỰA CHỌN])

#mcq(
  [Tìm nguyên hàm $F(x)$ của hàm số $f(x) = sin x + cos x$.],
  (
    [$F(x) = cos x - sin x + C$],
    True([$F(x) = -cos x + sin x + C$]),
    [$F(x) = -cos x - sin x + C$],
    [$F(x) = cos x + sin x + C$]
  ),
  solution: [
    Ta có $integral (sin x + cos x) dif x = -cos x + sin x + C$.
    
    Chọn B.
  ]
)

#mcq(
  [Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình vuông cạnh $a$, $S A perp (A B C D)$ và $S A = a sqrt(2)$. Tính thể tích khối chóp.],
  (
    [$(a^3 sqrt(2))/6$],
    True([$(a^3 sqrt(2))/3$]),
    [$a^3 sqrt(2)$],
    [$(a^3 sqrt(3))/3$]
  ),
  solution: [
    Diện tích đáy $S_(A B C D) = a^2$.
    
    Thể tích $V = 1/3 S_(A B C D) dot S A = 1/3 a^2 dot a sqrt(2) = (a^3 sqrt(2))/3$.
    
    Chọn B.
  ]
)
