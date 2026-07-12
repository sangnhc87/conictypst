// ====================================================================
// Ví dụ 14: Sử dụng bộ 30 mẫu Themes có sẵn cho Slide
// ====================================================================
#import "/sang-beamer.typ": *
#import "/sang-beamer-themes.typ": get-beamer-theme

// ====================================================================
// Bác chỉ cần đổi CHỮ SỐ (từ 1 đến 30) ở biến `theme-id` bên dưới, 
// toàn bộ màu sắc của Slide sẽ tự động thay đổi chuẩn chỉ!
// (1-15 là Dark Mode, 16-30 là Light Mode)
// ====================================================================
#let theme-id = 16

#let my-theme = get-beamer-theme(theme-id)
#let theme-name = my-theme.name
#let _ = my-theme.remove("name")

#show: sang-beamer-theme.with(
  title: "BÀI GIẢNG ĐỔI MÀU TỰ ĐỘNG",
  subtitle: "Mẫu giao diện: " + theme-name,
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Chuyên",
  
  // Trải (spread) toàn bộ thuộc tính màu sắc từ theme vào đây
  ..my-theme
)

#let (mcq, tf, short) = exam-mode(mode: "loigiai")

// ====================================================================

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
  [Tính giới hạn $lim_(x -> 1) (x^2 - 1)/(x - 1)$.],
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
