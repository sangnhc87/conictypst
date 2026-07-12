// Ví dụ: Vẽ hình nón và dùng anchor để thêm nhãn, đường cao
#import "@preview/cetz:0.5.2"
#import "../lib.typ": draw-cone

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *

  // Vẽ khung nón từ package
  draw-cone(name: "N1", radius: 3, height: 5, center: (0, 0, 0))

  // Người dùng tự thêm chi tiết dựa trên anchor
  circle("N1.top", radius: 0.08, fill: red)
  content("N1.top", [$S$], anchor: "south")
  content("N1.center", [$O$], anchor: "north")
  content("N1.front", [$A$], anchor: "west")

  // Vẽ đường cao
  line("N1.top", "N1.center", stroke: (dash: "dashed", paint: blue))
})
