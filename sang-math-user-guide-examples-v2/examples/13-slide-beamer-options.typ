// ====================================================================
// Ví dụ 13: Trình chiếu Slide (Beamer) - Tuỳ chỉnh nâng cao
// ====================================================================
#import "../../typst-pkg-submit/sang-beamer.typ": *

// Khởi tạo giao diện với nhiều tuỳ chỉnh kích thước, font và hiệu ứng
#show: sang-beamer-theme.with(
  title: "BÀI GIẢNG TUỲ CHỈNH NÂNG CAO",
  subtitle: "Sử dụng macro Sang-Math",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Chuyên",
  
  // 1. Tuỳ chỉnh màu sắc
  accent: rgb("#d946ef"),     // Màu Fuchsia
  bg_color: rgb("#fdf4ff"),   // Nền tím nhạt
  
  // 2. Tuỳ chỉnh kích thước font (Phóng to chữ cho hội trường lớn)
  text_size: 22pt,            // Size chữ mặc định (mặc định 20pt)
  question_size: 24pt,        // Size chữ câu hỏi (mặc định 22pt)
  option_size: 22pt,          // Size chữ các phương án A,B,C,D
  
  // 3. Hiệu ứng (Tuỳ chọn Touying)
  auto_step_pause: true,      // (Nếu cấu hình hỗ trợ) tự động pause ở từng bước
)

#let (mcq, tf, short) = exam-mode(mode: "loigiai")

// Có thể điều khiển số câu hiển thị ở chấm tròn footer bằng cách:
#bm-setcau(10) // Bắt đầu đếm từ câu 10 (vd: hiển thị số 10 ở footer)

#exam-part([PHẦN I. CÂU HỎI TRẮC NGHIỆM ĐA LỰA CHỌN])

#mcq(
  [Thể tích khối lăng trụ có diện tích đáy $B$ và chiều cao $h$ là:],
  (
    [$V = 1/3 B h$],
    True([$V = B h$]),
    [$V = 3 B h$],
    [$V = 1/2 B h$]
  ),
  solution: [
    Theo công thức sách giáo khoa, thể tích khối lăng trụ là $V = B h$.
    
    Chọn B.
  ]
)

#mcq(
  [Tính $lim_(x -> 1) (x^2 - 1)/(x - 1)$.],
  (
    [$1$],
    True([$2$]),
    [$0$],
    [$+ oo$]
  ),
  solution: [
    Ta có $lim_(x -> 1) (x^2 - 1)/(x - 1) = lim_(x -> 1) ((x-1)(x+1))/(x-1) = lim_(x -> 1) (x+1) = 2$.
    
    Chọn B.
  ]
)
