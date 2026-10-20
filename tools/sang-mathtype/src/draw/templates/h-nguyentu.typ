// @nhom Hóa học
// @muc Cấu tạo chất
// @ten Mô hình nguyên tử (hạt nhân và lớp electron)
// @mota Tự chia electron vào các lớp theo quy tắc 2, 8, 8, 18 (Z ≤ 36); đổi số hiệu nguyên tử Z
// @tu nguyen tu mo hinh bo lop electron cau hinh
#import "/sm-draw.typ": *
#let p-z = 11 // Số hiệu nguyên tử Z
#let p-ten = "Na" // Ký hiệu nguyên tố
#sm-canvas({
  import draw: *
  let caps = (2, 8, 8, 18)
  let left = p-z
  let shells = ()
  for c in caps {
    let n = calc.min(left, c)
    if n > 0 { shells.push(n) }
    left -= n
  }
  circle((0, 0), radius: 0.5, fill: rgb("#fecaca"), stroke: 1pt + c-red)
  lab((0, 0), text(size: 9pt, weight: "bold")[+#p-z])
  for (k, n) in shells.enumerate() {
    let r = 0.95 + 0.7 * k
    circle((0, 0), radius: r, stroke: 0.7pt + c-gray, fill: none)
    for i in range(n) {
      let a = i * 360deg / n + 20deg * k
      circle((r * calc.cos(a), r * calc.sin(a)), radius: 0.1, fill: c-blue, stroke: none)
    }
    lab((r * 0.707 + 0.12, -r * 0.707 - 0.12), text(size: 8.5pt, fill: c-gray)[#n e], at: "north-west")
  }
  let R = 0.95 + 0.7 * shells.len()
  lab((0, -R - 0.2), [Nguyên tử #ch(p-ten): Z = #p-z, cấu hình #shells.map(str).join(","), lớp ngoài cùng #shells.last() e], at: "north", size: 10pt)
})
