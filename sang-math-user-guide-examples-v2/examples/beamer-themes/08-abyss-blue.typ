// ====================================================================
// Beamer Theme 8: Abyss Blue
// ====================================================================
#import "../../../typst-pkg-submit/sang-beamer.typ": *
#import "../../../typst-pkg-submit/sang-beamer-themes.typ": get-beamer-theme

#let my-theme = get-beamer-theme(8)
#let theme-name = my-theme.name
#let _ = my-theme.remove("name")

#show: sang-beamer-theme.with(
  title: "BÀI GIẢNG TOÁN 12",
  subtitle: "Mẫu giao diện: " + theme-name,
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Chuyên",
  ..my-theme
)

#let (mcq, tf, short) = exam-mode(mode: "loigiai")

// ====================================================================

#exam-part([PHẦN I. CÂU HỎI TRẮC NGHIỆM ĐA LỰA CHỌN])

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
