// ====================================================================
// VÍ DỤ 15: SỬ DỤNG TOUYING ĐỂ LÀM VIDEO BÀI GIẢNG (THAY THẾ MANIM)
// ====================================================================
#import "../../typst-pkg-submit/sang-beamer.typ": *
#import "../../typst-pkg-submit/sang-beamer-themes.typ": get-beamer-theme

#let my-theme = get-beamer-theme(12)
#let theme-name = my-theme.name
#let _ = my-theme.remove("name")

#show: sang-beamer-theme.with(
  title: "GIẢI CHI TIẾT BÀI TOÁN TÌM GIỚI HẠN",
  subtitle: "Sử dụng Touying + EdgeTTS",
  author: "Kênh Toán Học",
  institution: "Học Trực Tuyến",
  auto_step_pause: false,
  ..my-theme // Sử dụng theme số 12 (Obsidian Cyan)
)

// ====================================================================
// Dùng Touying gốc để tuỳ biến Animation theo từng dòng
// (Không dùng #mcq vì #mcq đóng gói lời giải thành 1 block nguyên khối)
// ====================================================================

== Giải chi tiết

*Đề bài:* Tính giới hạn $L = lim_(x -> 1) (x^2 - 1)/(x - 1)$.

#pause
*Lời giải:*

Ta phân tích tử số thành nhân tử: $x^2 - 1 = (x-1)(x+1)$.

#pause
Khi đó, giới hạn trở thành:
$ L = lim_(x -> 1) ((x-1)(x+1))/(x-1) $

#pause
Triệt tiêu $(x-1)$ ở tử và mẫu, ta được:
$ L = lim_(x -> 1) (x+1) $

#pause
Thay $x = 1$ vào ta có $L = 1 + 1 = 2$.

Chọn *B*.
