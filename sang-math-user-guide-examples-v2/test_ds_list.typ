#import "../lib.typ": *
#set page(width: 420pt, height: 300pt, margin: 15pt)

#let mode = "loigiai"
#let preset = exam-preset(theme: "classic", profile: mode)
#show: preset.format

// Kiểu BẢNG (mặc định)
= Kiểu bảng (table: true)
#ds(
  [Cho cấp số nhân $(u_n)$ có $u_1=3$, công bội $q=2$.],
  (
    True([$u_2=6$.]),
    True([$u_4=24$.]),
    [Tổng ba số hạng đầu bằng $18$.],
    True([$u_n=3 dot 2^(n-1)$.]),
  ),
  mode: mode,
)

// Kiểu DANH SÁCH
= Kiểu danh sách (table: false)
#ds(
  [Cho cấp số nhân $(u_n)$ có $u_1=3$, công bội $q=2$.],
  (
    True([$u_2=6$.]),
    True([$u_4=24$.]),
    [Tổng ba số hạng đầu bằng $18$.],
    True([$u_n=3 dot 2^(n-1)$.]),
  ),
  table: false,
  mode: mode,
)
