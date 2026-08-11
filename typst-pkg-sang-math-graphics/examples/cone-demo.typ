// Ví dụ: Vẽ hình nón và dùng anchor để thêm nhãn, đường cao
#import "../lib.typ": smg-canvas, smg-draw, draw-cone

#smg-canvas(length: 1.2cm, {

  // Vẽ khung nón từ package
  draw-cone(name: "N1", radius: 3, height: 5, center: (0, 0, 0))

  // Người dùng tự thêm chi tiết dựa trên anchor
  smg-draw.circle("N1.top", radius: 0.08, fill: red)
  smg-draw.content("N1.top", [$S$], anchor: "south")
  smg-draw.content("N1.center", [$O$], anchor: "north")
  smg-draw.content("N1.front", [$A$], anchor: "west")

  // Vẽ đường cao
  smg-draw.line("N1.top", "N1.center", stroke: (dash: "dashed", paint: blue))
})
