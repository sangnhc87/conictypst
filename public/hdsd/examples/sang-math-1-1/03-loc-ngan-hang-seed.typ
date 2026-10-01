// Tình huống 03: Lọc ngân hàng và chọn câu tái lập được bằng seed.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 18mm)

#let (tn, ds, tln, tl) = bank-mode()
#let bank = range(8).map(i => tn(
  [Câu #str(i + 1). Đạo hàm của $x^2$ là gì?],
  ([$x$], True([$2x$]), [$x^2$], [$2$]),
  id: if i < 5 { "1D7H2-1" } else { "1D7V2-1" },
  tags: ("khong-may-tinh",),
))
#let pool = bank-filter(bank, grade: 11, id-prefix: "1D7", difficulty: (2, 3), tags: ("khong-may-tinh",))
#let chosen = bank-select(pool, count: 3, seed: 2026)
#assert(chosen == bank-select(pool, count: 3, seed: 2026))

= Ba câu được chọn với seed 2026
#for q in chosen { render-question(q) }
