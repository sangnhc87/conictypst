// ====================================================================
// Ví dụ 11: Trình chiếu Slide (Beamer) với Touying
// ====================================================================

// Trong gói sang-math đầy đủ, bạn sẽ import sang-beamer.typ
// Ở đây ta trỏ tạm về thư mục chứa mã nguồn package của tác giả:
#import "../../typst-pkg-submit/sang-beamer.typ": *

// 1. Khởi tạo giao diện trình chiếu (theme Metropolis)
#show: sang-beamer-theme.with(
  title: "CHỮA ĐỀ MINH HỌA TOÁN 12",
  subtitle: "Sử dụng macro Sang-Math",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Chuyên",
)

// 2. Khởi tạo các hàm trắc nghiệm tương thích Slide (thay vì tn, ds trên giấy)
// Chế độ "loigiai" tự động bung từng câu hỏi thành 2 màn (màn đề -> màn giải)
#let (mcq, tf, short) = exam-mode(mode: "loigiai")


// --------------------------------------------------------------------
// CÁCH 1: Dùng lại file đề thi A4
// Bạn chỉ cần chỉnh `profile: "beamer"` trong file 05-de-thi-day-du.typ
// sau đó bỏ comment dòng #include bên dưới là toàn bộ đề sẽ biến thành slide!
// 
// #include "05-de-thi-day-du.typ"
// --------------------------------------------------------------------


// --------------------------------------------------------------------
// CÁCH 2: Soạn trực tiếp các câu hỏi Slide
// --------------------------------------------------------------------

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án])

#mcq(
  [Đạo hàm của hàm số $y=x^3-3x+1$ là],
  ([$3x^2$], True([$3x^2-3$]), [$x^2-3$], [$3x^2+1$]),
  solution: [
    Ta có $y' = 3x^2 - 3$.
    
    Chọn B.
  ]
)

#mcq(
  [Số nghiệm của phương trình $x^2-4=0$ là],
  ([$0$], [$1$], True([$2$]), [$4$]),
  solution: [
    Ta có $x^2 - 4 = 0 <=> x^2 = 4 <=> x = +-2$.
    
    Vậy phương trình có 2 nghiệm. Chọn C.
  ]
)

#exam-part([PHẦN II. Câu đúng-sai])

#tf(
  [Cho hàm số $f(x)=x^2-2x+3$.],
  (
    True([$f(1)=2$.]),
    [$f(0)=0$.],
    True([Giá trị nhỏ nhất của $f$ bằng $2$.]),
    [$f'(x)=x-2$.],
  ),
  solution: [
    Ta có $f(x) = (x-1)^2 + 2 >= 2$.
    - $f(1) = 2$ nên ý 1 đúng.
    - $f(0) = 3$ nên ý 2 sai.
    - Dấu bằng xảy ra khi $x = 1$ nên giá trị nhỏ nhất của $f$ bằng $2$, ý 3 đúng.
    - Đạo hàm $f'(x) = 2x - 2$, do đó ý 4 sai.
  ]
)

#exam-part([PHẦN III. Câu trả lời ngắn])

#short(
  [Tọa độ đỉnh của parabol $y=x^2-4x+1$ là điểm $I(x_I; y_I)$. Tính $x_I + y_I$.],
  [$-1$],
  solution: [
    Hoành độ đỉnh $x_I = -b/(2a) = 4/2 = 2$.
    Tung độ đỉnh $y_I = 2^2 - 4(2) + 1 = -3$.
    Suy ra $x_I + y_I = 2 + (-3) = -1$.
  ]
)
