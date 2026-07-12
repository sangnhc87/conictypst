#import "../lib.typ": *
#show: sang-setup
#set page(width: 420pt, height: 400pt, margin: 15pt)

#let (tn, ds, tln, tl) = exam-mode(mode: "loigiai", q-label-style: "plain")

== Kiểu bảng (mặc định)
#ds(
  [Cho cấp số nhân $(u_n)$ có $u_1=3$, công bội $q=2$.],
  (
    True([$u_2=6$.]),
    True([$u_4=24$.]),
    [Tổng ba số hạng đầu bằng $18$.],
    True([$u_n=3 dot 2^(n-1)$.]),
  ),
)

== Kiểu danh sách (table: false)
#ds(
  [Cho cấp số nhân $(u_n)$ có $u_1=3$, công bội $q=2$.],
  (
    True([$u_2=6$.]),
    True([$u_4=24$.]),
    [Tổng ba số hạng đầu bằng $18$.],
    True([$u_n=3 dot 2^(n-1)$.]),
  ),
  table: false,
)
