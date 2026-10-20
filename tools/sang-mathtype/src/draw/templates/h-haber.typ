// @nhom Hóa học
// @muc Quy trình công nghiệp
// @ten Sơ đồ khối: sản xuất amoniac (Haber)
// @mota Khối nguyên liệu → nén → tháp tổng hợp → làm lạnh → NH₃ lỏng; khí chưa phản ứng tuần hoàn
// @tu amoniac haber nh3 quy trinh cong nghiep so do khoi
#import "/sm-draw.typ": *
#sm-canvas({
  import draw: *
  khoi((0, 0), [Hỗn hợp #ch("N2") + 3#ch("H2")], w: 3.4, name: "a")
  khoi((4.6, 0), [Nén\ 200–300 atm], w: 2.6, name: "b", col: c-amber)
  khoi((9.2, 0), [Tháp tổng hợp\ 450–500 °C, xúc tác Fe], w: 4.0, name: "c", col: c-red, h: 1.4)
  khoi((14.0, 0), [Làm lạnh\ ngưng tụ], w: 2.4, name: "d", col: c-blue)
  khoi((14.0, -3.0), [#ch("NH3") lỏng], w: 2.4, name: "e", col: c-green)
  mt("a.east", "b.west")
  mt("b.east", "c.west")
  mt("c.east", "d.west")
  mt("d.south", "e.north")
  // khí chưa phản ứng quay lại
  line("d.north", (14.0, 1.9), (4.6, 1.9), "b.north", stroke: (thickness: 1pt, dash: "dashed"), mark: (end: ">", size: 0.18))
  lab((9.3, 2.15), [#ch("N2"), #ch("H2") chưa phản ứng quay lại], size: 9pt, at: "south")
})
