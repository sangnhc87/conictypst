// Test hyperlink tự động — KHÔNG cần id: thủ công
// Bộ đếm HL hoàn toàn độc lập với bộ đếm câu
#import "../lib.typ": *

#show: sang-setup

// === PHẦN I: ĐỀ THI (mode dethi + show-hyperlink: true) ===
// _hl-q-state đếm: 1, 2, 3, 4 (không bao giờ reset)
#let (tn, ds, tl) = exam-mode(mode: "dethi", show-hyperlink: true)

= Đề Thi Thử Toán

== Phần I. Trắc nghiệm nhiều phương án lựa chọn

#tn(
  [Đạo hàm của $y = x^3 - 3x + 1$ là],
  ([$3x^2$], True([$3x^2 - 3$]), [$x^2 - 3$], [$3x^2 + 1$]),
  loigiai: [Ta có $y' = 3x^2 - 3$.],
)

#tn(
  [Tập xác định của $y = sqrt(x + 2)$ là],
  ([$(-oo, -2)$], [$(-oo, -2]$], True([$[-2, +oo)$]), [$RR$]),
  loigiai: [Điều kiện: $x + 2 >= 0 <=> x >= -2$. Vậy $D = [-2; +oo)$.],
)

#tn(
  [Giới hạn $lim_(x -> +oo) (5x^2 - 1)/(2x^2 + x)$ bằng],
  ([$0$], [$2/5$], True([$5/2$]), [$+oo$]),
  loigiai: [Chia cả tử và mẫu cho $x^2$: $lim = 5/2$.],
)

== Phần II. Tự luận

#tl(
  [Giải phương trình $x^2 - 5x + 6 = 0$.],
  loigiai: [Ta có $Delta = 25 - 24 = 1 > 0$. Hai nghiệm: $x_1 = 2$, $x_2 = 3$.],
)

#pagebreak()

// === PHẦN II: LỜI GIẢI ===
// _hl-sol-state đếm: 1, 2, 3, 4 (không bao giờ reset)
// Câu 1 dethi (hl-q=1) ↔ Lời giải 1 loigiai (hl-sol=1) — LUÔN KHỚP
#let (tn, ds, tl) = exam-mode(mode: "loigiai", show-hyperlink: true)

= Hướng Dẫn Giải

== Phần I. Trắc nghiệm

#tn(
  [Đạo hàm của $y = x^3 - 3x + 1$ là],
  ([$3x^2$], True([$3x^2 - 3$]), [$x^2 - 3$], [$3x^2 + 1$]),
  loigiai: [Ta có $y' = 3x^2 - 3$.],
)

#tn(
  [Tập xác định của $y = sqrt(x + 2)$ là],
  ([$(-oo, -2)$], [$(-oo, -2]$], True([$[-2, +oo)$]), [$RR$]),
  loigiai: [Điều kiện: $x + 2 >= 0 <=> x >= -2$. Vậy $D = [-2; +oo)$.],
)

#tn(
  [Giới hạn $lim_(x -> +oo) (5x^2 - 1)/(2x^2 + x)$ bằng],
  ([$0$], [$2/5$], True([$5/2$]), [$+oo$]),
  loigiai: [Chia cả tử và mẫu cho $x^2$: $lim = 5/2$.],
)

== Phần II. Tự luận

#tl(
  [Giải phương trình $x^2 - 5x + 6 = 0$.],
  loigiai: [Ta có $Delta = 25 - 24 = 1 > 0$. Hai nghiệm: $x_1 = 2$, $x_2 = 3$.],
)
