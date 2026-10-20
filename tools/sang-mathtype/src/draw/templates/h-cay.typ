// @nhom Hóa học
// @muc Sơ đồ chuyển hóa
// @ten Sơ đồ phân nhánh (1 chất → 4 sản phẩm)
// @mota Một chất trung tâm tác dụng với bốn thuốc thử cho bốn sản phẩm
// @tu phan nhanh tinh chat hoa hoc so do
#import "/sm-draw.typ": *
#let p-o = "H2SO4" // Chất trung tâm
#let p-1 = "Zn" // Thuốc thử 1
#let p-p1 = "ZnSO4" // Sản phẩm 1
#let p-2 = "NaOH" // Thuốc thử 2
#let p-p2 = "Na2SO4" // Sản phẩm 2
#let p-3 = "BaCl2" // Thuốc thử 3
#let p-p3 = "BaSO4" // Sản phẩm 3
#let p-4 = "CuO" // Thuốc thử 4
#let p-p4 = "CuSO4" // Sản phẩm 4
#sm-canvas({
  import draw: *
  hop((0, 0), ch(p-o), col: c-red, name: "o")
  hop((5.5, 2.6), ch(p-p1), name: "p1")
  hop((5.5, 0.9), ch(p-p2), name: "p2")
  hop((5.5, -0.9), ch(p-p3), name: "p3")
  hop((5.5, -2.6), ch(p-p4), name: "p4")
  for (i, (r, p)) in ((p-1, "p1"), (p-2, "p2"), (p-3, "p3"), (p-4, "p4")).enumerate() {
    let y = (2.6, 0.9, -0.9, -2.6).at(i)
    line("o.east", (rel: (-0.12, 0), to: p + ".west"), stroke: 1pt, mark: (end: ">", size: 0.18))
    lab((2.9, y * 0.55 + 0.3), [$+$ #ch(r)], size: 9.5pt)
  }
})
