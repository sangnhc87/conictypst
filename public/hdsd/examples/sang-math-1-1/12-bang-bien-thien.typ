// Tình huống 12: Bảng biến thiên trong câu hỏi trắc nghiệm.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 18mm)
#show: sang-setup

= Đọc bảng biến thiên
#tn(
  [Dựa vào bảng biến thiên, hàm số nghịch biến trên khoảng nào?],
  ([$(-oo;-1)$], True([$(-1;1)$]), [$(1;+oo)$], [$(-oo;+oo)$]),
  fig: bbtv2(
    x-vals: ($-oo$, $-1$, $1$, $+oo$),
    d-signs: ("+", 0, "-", 0, "+"),
    v-vals: ($-oo$, $3$, $-1$, $+oo$),
  ),
  fig-pos: "center",
  fig-width: 85%,
  loigiai: [Dấu đạo hàm âm trên $(-1;1)$.],
)
