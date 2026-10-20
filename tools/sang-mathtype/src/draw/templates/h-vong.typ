// @nhom Hóa học
// @muc Sơ đồ chuyển hóa
// @ten Sơ đồ chuyển hóa tuần hoàn (4 chất)
// @mota Bốn chất nằm ở bốn góc, nối vòng tròn bằng các mũi tên có điều kiện
// @tu vong tuan hoan chuyen hoa so do
#import "/sm-draw.typ": *
#let p-a = "Fe" // Chất A
#let p-b = "FeCl2" // Chất B
#let p-c = "Fe(OH)2" // Chất C
#let p-d = "FeSO4" // Chất D
#let p-1 = "HCl" // Điều kiện A → B
#let p-2 = "NaOH" // Điều kiện B → C
#let p-3 = "H2SO4" // Điều kiện C → D
#let p-4 = "Mg" // Điều kiện D → A
#sm-canvas({
  import draw: *
  hop((0, 3), ch(p-a), name: "a")
  hop((6, 3), ch(p-b), name: "b")
  hop((6, 0), ch(p-c), name: "c")
  hop((0, 0), ch(p-d), name: "d")
  mt((rel: (0.15, 0), to: "a.east"), (rel: (-0.15, 0), to: "b.west"), txt: ch(p-1), at: "south")
  mt((rel: (0, -0.15), to: "b.south"), (rel: (0, 0.15), to: "c.north"), txt: ch(p-2), at: "west", off: 0)
  mt((rel: (-0.15, 0), to: "c.west"), (rel: (0.15, 0), to: "d.east"), txt: ch(p-3), at: "south")
  mt((rel: (0, 0.15), to: "d.north"), (rel: (0, -0.15), to: "a.south"), txt: ch(p-4), at: "east")
})
