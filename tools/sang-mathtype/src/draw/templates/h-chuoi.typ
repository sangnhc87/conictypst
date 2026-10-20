// @nhom Hóa học
// @muc Sơ đồ chuyển hóa
// @ten Chuỗi phản ứng (5 chất)
// @mota Dãy chuyển hóa A → B → C → D → E; sửa chất và điều kiện ở các ô nhập
// @tu chuoi phan ung chuyen hoa so do
#import "/sm-draw.typ": *
#let p-1 = "Al" // Chất 1
#let p-2 = "Al2O3" // Chất 2
#let p-3 = "AlCl3" // Chất 3
#let p-4 = "Al(OH)3" // Chất 4
#let p-5 = "Al2O3" // Chất 5
#let p-d1 = "O2, t°" // Điều kiện 1
#let p-d2 = "HCl" // Điều kiện 2
#let p-d3 = "NaOH vừa đủ" // Điều kiện 3
#let p-d4 = "t°" // Điều kiện 4
#sm-canvas({
  import draw: *
  chuoi((p-1, p-2, p-3, p-4, p-5), conds: (p-d1, p-d2, p-d3, p-d4), under: ([(1)], [(2)], [(3)], [(4)]), gap: 4.6)
})
