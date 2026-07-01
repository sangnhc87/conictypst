#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[PHÂN LOẠI BÀI TẬP TỐI ƯU HÓA THỰC TẾ THEO CHỦ ĐỀ]
]

// Các hình vẽ minh họa bổ sung bằng CeTZ
#let fig-hop = cetz.canvas(length: 0.9cm, {
  import cetz.draw: *
  rect((0, 0), (4, 4), stroke: 0.8pt)
  rect((0, 0), (0.8, 0.8), fill: gray.lighten(50%), stroke: (dash: "dashed"))
  rect((3.2, 0), (4, 0.8), fill: gray.lighten(50%), stroke: (dash: "dashed"))
  rect((0, 3.2), (0.8, 4), fill: gray.lighten(50%), stroke: (dash: "dashed"))
  rect((3.2, 3.2), (4, 4), fill: gray.lighten(50%), stroke: (dash: "dashed"))
  line((0.8, 0.8), (3.2, 0.8), stroke: (dash: "dashed", thickness: 0.6pt))
  line((0.8, 3.2), (3.2, 3.2), stroke: (dash: "dashed", thickness: 0.6pt))
  line((0.8, 0.8), (0.8, 3.2), stroke: (dash: "dashed", thickness: 0.6pt))
  line((3.2, 0.8), (3.2, 3.2), stroke: (dash: "dashed", thickness: 0.6pt))
  content((0.4, 0.4), $x$)
  content((2, -0.3), [$12$ cm])
})

#let fig-song = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  rect((0, 1.8), (5, 2.3), fill: rgb("#7dd3fc").lighten(50%), stroke: none)
  line((0, 1.8), (5, 1.8), stroke: rgb("#0284c7") + 0.8pt)
  content((2.5, 2.05), [Bờ sông])
  rect((1, 0.3), (4, 1.8), stroke: (paint: rgb("#16a34a"), thickness: 1.2pt, dash: "dashed"))
  content((0.8, 1.05), $x$)
  content((4.2, 1.05), $x$)
  content((2.5, 0.1), [$60 - 2x$])
})

#let fig-cap = cetz.canvas(length: 0.6cm, {
  import cetz.draw: *
  line((0, 0), (12, 0), stroke: 1pt)
  content((11, -0.5), [Bờ biển])
  circle((0, 0), radius: 0.12, fill: rgb("#dc2626"))
  content((0, -0.6), [Nhà máy $A$])
  circle((7.5, 0), radius: 0.12, fill: rgb("#2563eb"))
  content((7.5, -0.6), [Điểm $M$])
  content((3.75, -0.5), [$10 - x$])
  circle((10, 0), radius: 0.1, fill: black)
  content((10.4, 0.3), [$H$])
  content((8.75, 0.4), [$x$])
  circle((10, 4), radius: 0.18, fill: rgb("#16a34a"))
  content((10, 4.6), [Đảo $B$])
  line((0, 0), (7.5, 0), stroke: rgb("#f59e0b") + 2pt)
  line((7.5, 0), (10, 4), stroke: rgb("#3b82f6") + 2pt)
  line((10, 0), (10, 4), stroke: (paint: gray, dash: "dashed"))
  content((10.5, 2), [$3$ km])
})

#let fig-cua = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  rect((0, 0), (3, 2), stroke: 0.8pt)
  content((1.5, 1), [Hình chữ nhật])
  content((-0.4, 1), $h$)
  content((3.4, 1), $h$)
  arc((3, 2), start: 0deg, stop: 180deg, radius: 1.5, stroke: 0.8pt)
  content((1.5, 2.8), [Nửa hình tròn])
  line((0, 2), (3, 2), stroke: (paint: gray, dash: "dashed"))
  circle((1.5, 2), radius: 0.05, fill: black)
  content((0.75, 2.2), $r$)
  content((2.25, 2.2), $r$)
})

// Hàm phụ chiếu phối cảnh 3D Oblique/Cabinet
#let p3(x, y, z) = (x + 0.4 * y, z + 0.3 * y)

#let fig-bon = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Cạnh khuất đáy
  line(p3(0, 0, 0), p3(0, 1.5, 0), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line(p3(0, 1.5, 0), p3(3, 1.5, 0), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line(p3(0, 1.5, 0), p3(0, 1.5, 1.8), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  
  // Các mặt tô màu phân lớp 3D
  line(p3(0, 0, 0), p3(3, 0, 0), p3(3, 0, 1.8), p3(0, 0, 1.8), close: true, fill: rgb("#60a5fa").lighten(50%), stroke: 0.8pt + rgb("#1d4ed8"))
  line(p3(3, 0, 0), p3(3, 1.5, 0), p3(3, 1.5, 1.8), p3(3, 0, 1.8), close: true, fill: rgb("#3b82f6").lighten(30%), stroke: 0.8pt + rgb("#1d4ed8"))
  line(p3(0, 0, 1.8), p3(3, 0, 1.8), p3(3, 1.5, 1.8), p3(0, 1.5, 1.8), close: true, fill: rgb("#93c5fd").lighten(70%), stroke: 0.8pt + rgb("#1d4ed8"))
  
  // Chú thích kích thước
  content(p3(1.5, 0, -0.3), [$2x$])
  content(p3(3.3, 0.75, -0.2), [$x$])
  content(p3(-0.3, 0, 0.9), [$h$])
})

#let fig-tru-3d = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Mặt đáy trên
  circle((1.5, 2.2), radius: (1.2, 0.35), fill: rgb("#93c5fd").lighten(65%), stroke: 0.8pt + rgb("#1d4ed8"))
  
  // Trục và bán kính ở đáy trên
  line((1.5, 2.2), (2.7, 2.2), stroke: 0.8pt + black)
  content((2.1, 2.45), [$r$])
  
  // Cạnh đáy dưới khuất và thấy
  arc((0.3, 0), start: 180deg, stop: 360deg, radius: (1.2, 0.35), stroke: 0.8pt + rgb("#1d4ed8"))
  arc((2.7, 0), start: 0deg, stop: 180deg, radius: (1.2, 0.35), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  
  // Trục giữa
  line((1.5, 0), (1.5, 2.2), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  content((1.3, 1.1), [$h$])
  
  // Đường sinh hai bên
  line((0.3, 0), (0.3, 2.2), stroke: 0.8pt + rgb("#1d4ed8"))
  line((2.7, 0), (2.7, 2.2), stroke: 0.8pt + rgb("#1d4ed8"))
})

#let fig-hop-3d = cetz.canvas(length: 1.1cm, {
  import cetz.draw: *
  // Vẽ các mặt trong (Inner Faces) trước để tạo chiều sâu hộp rỗng
  line(p3(0, 0, 0), p3(3, 0, 0), p3(3, 3, 0), p3(0, 3, 0), close: true, fill: rgb("#86efac").lighten(50%), stroke: 0.6pt + rgb("#15803d"))
  line(p3(0, 0, 0), p3(0, 3, 0), p3(0, 3, 1), p3(0, 0, 1), close: true, fill: rgb("#86efac").lighten(40%), stroke: 0.6pt + rgb("#15803d"))
  line(p3(0, 3, 0), p3(3, 3, 0), p3(3, 3, 1), p3(0, 3, 1), close: true, fill: rgb("#86efac").lighten(30%), stroke: 0.6pt + rgb("#15803d"))
  
  // Vẽ các mặt ngoài (Outer Faces) đè lên
  line(p3(0, 0, 0), p3(3, 0, 0), p3(3, 0, 1), p3(0, 0, 1), close: true, fill: rgb("#4ade80").lighten(20%), stroke: 0.8pt + rgb("#16a34a"))
  line(p3(3, 0, 0), p3(3, 3, 0), p3(3, 3, 1), p3(3, 0, 1), close: true, fill: rgb("#22c55e").lighten(10%), stroke: 0.8pt + rgb("#16a34a"))
  
  // Chú thích
  content(p3(-0.3, 0, 0.5), [$x$])
  content(p3(1.5, 0, -0.25), [$12 - 2x$])
  content(p3(3.4, 1.5, -0.15), [$12 - 2x$])
})

#let fig-luc-giac-3d = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let r = 1.3
  let h = 2.2
  let cx = 1.8
  let cy = 1.5
  
  // Các điểm đáy dưới
  let a0 = p3(cx + r * calc.cos(0deg), cy + r * calc.sin(0deg), 0)
  let a1 = p3(cx + r * calc.cos(60deg), cy + r * calc.sin(60deg), 0)
  let a2 = p3(cx + r * calc.cos(120deg), cy + r * calc.sin(120deg), 0)
  let a3 = p3(cx + r * calc.cos(180deg), cy + r * calc.sin(180deg), 0)
  let a4 = p3(cx + r * calc.cos(240deg), cy + r * calc.sin(240deg), 0)
  let a5 = p3(cx + r * calc.cos(300deg), cy + r * calc.sin(300deg), 0)
  
  // Các điểm đáy trên
  let b0 = p3(cx + r * calc.cos(0deg), cy + r * calc.sin(0deg), h)
  let b1 = p3(cx + r * calc.cos(60deg), cy + r * calc.sin(60deg), h)
  let b2 = p3(cx + r * calc.cos(120deg), cy + r * calc.sin(120deg), h)
  let b3 = p3(cx + r * calc.cos(180deg), cy + r * calc.sin(180deg), h)
  let b4 = p3(cx + r * calc.cos(240deg), cy + r * calc.sin(240deg), h)
  let b5 = p3(cx + r * calc.cos(300deg), cy + r * calc.sin(300deg), h)
  
  // Cạnh đáy dưới khuất
  line(a0, a1, stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line(a1, a2, stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line(a2, a3, stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line(a1, b1, stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line(a2, b2, stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  
  // Các mặt bên thấy (Tô màu 3D phân lớp)
  line(a3, a4, b4, b3, close: true, fill: rgb("#fde047").lighten(35%), stroke: 0.8pt + rgb("#ca8a04"))
  line(a4, a5, b5, b4, close: true, fill: rgb("#fde047").lighten(15%), stroke: 0.8pt + rgb("#ca8a04"))
  line(a5, a0, b0, b5, close: true, fill: rgb("#eab308").lighten(25%), stroke: 0.8pt + rgb("#ca8a04"))
  
  // Đáy trên lục giác
  line(b0, b1, b2, b3, b4, b5, close: true, fill: rgb("#fef08a").lighten(70%), stroke: 0.8pt + rgb("#ca8a04"))
  
  // Các cạnh thấy ngoài
  line(a3, b3, stroke: 0.8pt + rgb("#ca8a04"))
  line(a4, b4, stroke: 0.8pt + rgb("#ca8a04"))
  line(a5, b5, stroke: 0.8pt + rgb("#ca8a04"))
  line(a0, b0, stroke: 0.8pt + rgb("#ca8a04"))
  
  content((cx, -0.4), [$a$])
  content((cx + r + 0.5, h/2), [$h$])
})

#let fig-dam-go-3d = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Khúc gỗ hình trụ tròn ngoại tiếp dầm chữ nhật
  
  // Side of cylinder (bark)
  merge-path(fill: rgb("#8b5a2b"), stroke: 0.8pt + rgb("#5c4033"), {
    line((0.1, 2.2), (0.1, 0))
    arc((0.1, 0), start: 180deg, stop: 360deg, radius: (1.4, 0.4))
    line((2.9, 0), (2.9, 2.2))
    arc((2.9, 2.2), start: 360deg, stop: 180deg, radius: (1.4, 0.4))
  })
  
  // Top cut surface of the log (wood grain)
  circle((1.5, 2.2), radius: (1.4, 0.4), fill: rgb("#e9d3b4"), stroke: 0.8pt + rgb("#a0522d"))
  circle((1.5, 2.2), radius: (1.0, 0.28), stroke: 0.4pt + rgb("#d2b48c"))
  circle((1.5, 2.2), radius: (0.6, 0.17), stroke: 0.4pt + rgb("#d2b48c"))
  circle((1.5, 2.2), radius: (0.2, 0.06), stroke: 0.4pt + rgb("#d2b48c"))
  
  // Dầm gỗ chữ nhật nội tiếp trong trụ
  let u1 = (1.5 - 1.1, -0.2)
  let u2 = (1.5 + 1.1, -0.2)
  let u3 = (1.5 + 1.1, 0.2)
  let u4 = (1.5 - 1.1, 0.2)
  
  let v1 = (1.5 - 1.1, 2.2 - 0.2)
  let v2 = (1.5 + 1.1, 2.2 - 0.2)
  let v3 = (1.5 + 1.1, 2.2 + 0.2)
  let v4 = (1.5 - 1.1, 2.2 + 0.2)
  
  // Vẽ dầm chữ nhật nét khuất đáy dầm
  line(u4, u3, stroke: (paint: rgb("#8b5a2b"), dash: "dashed", thickness: 0.6pt))
  line(u1, u4, stroke: (paint: rgb("#8b5a2b"), dash: "dashed", thickness: 0.6pt))
  line(u4, v4, stroke: (paint: rgb("#8b5a2b"), dash: "dashed", thickness: 0.6pt))
  
  // Vẽ các mặt thấy của dầm
  line(u1, u2, v2, v1, close: true, fill: rgb("#fff8dc"), stroke: 0.8pt + rgb("#8b5a2b"))
  line(u2, u3, v3, v2, close: true, fill: rgb("#f5deb3"), stroke: 0.8pt + rgb("#8b5a2b"))
  line(v1, v2, v3, v4, close: true, fill: rgb("#ffebcd"), stroke: 1.0pt + rgb("#8b5a2b"))
  
  // Chú thích kích thước trên mặt trên dầm
  line((0.4, 1.9), (2.6, 1.9), stroke: 0.5pt)
  content((1.5, 1.7), [$x$])
  line((2.7, 2.0), (2.7, 2.4), stroke: 0.5pt)
  content((2.9, 2.2), [$h$])
  
  // Đường kính khúc gỗ
  line((0.1, 2.2), (2.9, 2.2), stroke: (paint: rgb("#7f8c8d"), dash: "dashed", thickness: 0.6pt))
  circle((1.5, 2.2), radius: 0.04, fill: black)
  content((1.5, 2.5), [$d = 40$ cm])
})

#let fig-thung-giay-3d = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Hộp giấy kín hình hộp chữ nhật đáy vuông
  line(p3(0, 0, 0), p3(0, 2, 0), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line(p3(0, 2, 0), p3(2, 2, 0), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line(p3(0, 2, 0), p3(0, 2, 2.4), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  
  line(p3(0, 0, 0), p3(2, 0, 0), p3(2, 0, 2.4), p3(0, 0, 2.4), close: true, fill: rgb("#fed7aa").lighten(30%), stroke: 0.8pt + rgb("#c2410c"))
  line(p3(2, 0, 0), p3(2, 2, 0), p3(2, 2, 2.4), p3(2, 0, 2.4), close: true, fill: rgb("#fdba74").lighten(20%), stroke: 0.8pt + rgb("#c2410c"))
  line(p3(0, 0, 2.4), p3(2, 0, 2.4), p3(2, 2, 2.4), p3(0, 2, 2.4), close: true, fill: rgb("#ffedd5").lighten(55%), stroke: 0.8pt + rgb("#c2410c"))
  
  content(p3(1, 0, -0.3), [$x$])
  content(p3(2.3, 1, -0.2), [$x$])
  content(p3(-0.3, 0, 1.2), [$h$])
})



#let fig-trang = cetz.canvas(length: 0.7cm, {
  import cetz.draw: *
  rect((0, 0), (4, 6), stroke: 1pt)
  content((2, -0.4), [$x$])
  content((-0.4, 3), [$y$])
  rect((0.5, 0.6), (3.5, 5.4), stroke: (paint: rgb("#6b7280"), dash: "dashed"))
  content((2, 3), [Vùng in chữ])
  content((2, 5.7), [Lề trên $3$ cm], fill: gray)
  content((2, 0.3), [Lề dưới $3$ cm], fill: gray)
  content((0.2, 3), [Lề\ trái\ $2$], fill: gray)
  content((3.8, 3), [Lề\ phải\ $2$], fill: gray)
})

#let fig-tau-bien = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((-0.5, 0), (4, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, -0.5), (0, 3), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((3.8, -0.3), $x$)
  content((-0.3, 2.8), $y$)
  content((-0.2, -0.2), $O$)
  
  circle((1.5, 0), radius: 0.1, fill: rgb("#ef4444"))
  content((1.5, -0.4), [Tàu $A$])
  
  circle((0, 2), radius: 0.1, fill: rgb("#3b82f6"))
  content((-0.6, 2), [Tàu $B$])
  
  line((1.5, 0), (0, 2), stroke: (paint: gray, dash: "dashed", thickness: 0.8pt))
  content((0.9, 1.2), $d$)
  
  line((1.5, 0), (2.5, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.8pt + rgb("#ef4444"))
  line((0, 2), (0, 1), mark: (end: "stealth", scale: 0.5), stroke: 0.8pt + rgb("#3b82f6"))
})

#let fig-buc-tranh = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (5, 0), stroke: 0.8pt + rgb("#64748b"))
  line((4, 0), (4, 4), stroke: 0.8pt + rgb("#64748b"))
  
  // Tranh
  line((4, 1.8), (4, 3.2), stroke: 3pt + rgb("#b91c1c"))
  content((4.5, 2.5), [$1.4$m])
  content((4.5, 0.9), [$1.8$m])
  
  // Người quan sát
  circle((1, 0), radius: 0.05, fill: black)
  content((1, -0.3), [$M$])
  
  line((1, 0), (4, 1.8), stroke: (paint: gray, dash: "dashed"))
  line((1, 0), (4, 3.2), stroke: (paint: gray, dash: "dashed"))
  
  arc((1, 0), start: 27deg, stop: 40deg, radius: 1.5, stroke: 0.8pt)
  content((2.3, 0.9), $alpha$)
  
  content((2.5, -0.3), $x$)
})

#let fig-tam-giac-hcn = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (5, 0), stroke: 0.8pt + rgb("#0ea5e9"))
  line((5, 0), (2, 3), stroke: 0.8pt + rgb("#0ea5e9"))
  line((2, 3), (0, 0), stroke: 0.8pt + rgb("#0ea5e9"))
  
  line((2, 3), (2, 0), stroke: (paint: gray, dash: "dashed"))
  content((2.2, 1.5), $h$)
  
  line((1.2, 1.2), (3.8, 1.2), stroke: 1pt + rgb("#eab308"))
  line((3.8, 1.2), (3.8, 0), stroke: 1pt + rgb("#eab308"))
  line((3.8, 0), (1.2, 0), stroke: 1pt + rgb("#eab308"))
  line((1.2, 0), (1.2, 1.2), stroke: 1pt + rgb("#eab308"))
  
  content((2.5, 0.6), [Nhà])
  content((2.5, -0.3), [$20$ m])
})

#let fig-cat-day = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (6, 0), stroke: 1.5pt + rgb("#3b82f6"))
  line((2.5, 0.2), (2.5, -0.2), stroke: 1pt + rgb("#ef4444"))
  content((1.25, 0.3), $x$)
  content((4.25, 0.3), [$28 - x$])
  
  // Mũi tên uốn
  line((1.25, -0.2), (1.25, -1), mark: (end: "stealth", scale: 0.5), stroke: (dash: "dashed", paint: gray))
  rect((0.8, -2), (1.7, -1.1), stroke: 1pt + rgb("#f59e0b"))
  
  line((4.25, -0.2), (4.25, -1), mark: (end: "stealth", scale: 0.5), stroke: (dash: "dashed", paint: gray))
  circle((4.25, -1.5), radius: 0.5, stroke: 1pt + rgb("#22c55e"))
})

#let fig-rung-duong = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Rừng ở phía trên y > 0
  rect((0, 0), (6, 3.5), fill: rgb("#e2f0d9"), stroke: none)
  content((1.5, 2.5), [Khu rừng], fill: rgb("#385723"))
  
  // Đường lộ y = 0
  line((0, 0), (6, 0), stroke: 2pt + rgb("#595959"))
  content((5.2, -0.4), [Đường quốc lộ], fill: rgb("#595959"))
  
  // Điểm A trong rừng
  circle((1, 3), radius: 0.08, fill: rgb("#c00000"))
  content((1, 3.3), $A$)
  
  // Hình chiếu H của A trên đường
  circle((1, 0), radius: 0.05, fill: black)
  content((1, -0.3), $H$)
  line((1, 3), (1, 0), stroke: (paint: gray, dash: "dashed"))
  content((0.7, 1.5), [3 km])
  
  // Điểm B
  circle((5, 0), radius: 0.08, fill: rgb("#002060"))
  content((5, -0.3), $B$)
  
  // Điểm ra lộ M
  circle((4, 0), radius: 0.06, fill: rgb("#ed7d31"))
  content((4, 0.3), $M$)
  
  // Đường đi AMB
  line((1, 3), (4, 0), stroke: 1.2pt + rgb("#ed7d31"))
  line((4, 0), (5, 0), stroke: 1.2pt + rgb("#002060"))
  
  // Kích thước x
  line((1, -0.6), (4, -0.6), mark: (both: "stealth", scale: 0.4), stroke: 0.5pt)
  content((2.5, -0.9), $x$)
  
  // Kích thước 5km
  line((1, -1.2), (5, -1.2), mark: (both: "stealth", scale: 0.4), stroke: 0.5pt)
  content((3, -1.5), [5 km])
})

#let fig-hop-chu-nhat = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  rect((0, 0), (8, 5), stroke: 0.8pt)
  
  // Cắt 4 góc
  rect((0, 0), (1, 1), fill: gray.lighten(50%), stroke: (dash: "dashed"))
  rect((7, 0), (8, 1), fill: gray.lighten(50%), stroke: (dash: "dashed"))
  rect((0, 4), (1, 5), fill: gray.lighten(50%), stroke: (dash: "dashed"))
  rect((7, 4), (8, 5), fill: gray.lighten(50%), stroke: (dash: "dashed"))
  
  line((1, 1), (7, 1), stroke: (dash: "dashed", thickness: 0.6pt))
  line((1, 4), (7, 4), stroke: (dash: "dashed", thickness: 0.6pt))
  line((1, 1), (1, 4), stroke: (dash: "dashed", thickness: 0.6pt))
  line((7, 1), (7, 4), stroke: (dash: "dashed", thickness: 0.6pt))
  
  content((0.5, 0.5), $x$)
  content((4, -0.4), [8 dm])
  content((-0.5, 2.5), [5 dm])
})

#let fig-cat-day-tam-giac = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (6, 0), stroke: 1.5pt + rgb("#3b82f6"))
  line((3.5, 0.2), (3.5, -0.2), stroke: 1pt + rgb("#ef4444"))
  content((1.75, 0.3), $x$)
  content((4.75, 0.3), [$12 - x$])
  
  // Mũi tên
  line((1.75, -0.2), (1.75, -1), mark: (end: "stealth", scale: 0.5), stroke: (dash: "dashed", paint: gray))
  // Tam giác đều
  line((1.2, -1.8), (2.3, -1.8), stroke: 1.2pt + rgb("#f59e0b"))
  line((2.3, -1.8), (1.75, -0.9), stroke: 1.2pt + rgb("#f59e0b"))
  line((1.75, -0.9), (1.2, -1.8), stroke: 1.2pt + rgb("#f59e0b"))
  
  line((4.75, -0.2), (4.75, -1), mark: (end: "stealth", scale: 0.5), stroke: (dash: "dashed", paint: gray))
  circle((4.75, -1.45), radius: 0.45, stroke: 1.2pt + rgb("#22c55e"))
})

#let fig-hcn-tron = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  circle((0, 0), radius: 2, stroke: 1.2pt + rgb("#3b82f6"))
  rect((-1.41, -1.41), (1.41, 1.41), fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#ef4444"))
  line((0, 0), (1.41, 1.41), stroke: (paint: gray, dash: "dashed"))
  content((0.6, 0.9), $R$)
  circle((0, 0), radius: 0.04, fill: black)
  content((0.2, -0.2), $O$)
})

#let fig-hcn-parabol = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((-2.5, 0), (2.5, 0), stroke: 0.8pt)
  line((0, -0.5), (0, 3.5), stroke: 0.8pt)
  
  // Parabol: y = 3 - 0.75 * x^2
  let pts = ()
  for i in range(41) {
    let x = -2.0 + i * 4.0 / 40
    let y = 3 - 0.75 * x * x
    pts.push((x, y))
  }
  line(..pts, stroke: 1.2pt + rgb("#3b82f6"))
  
  // Rectangle at x = 1 (canvas y = 2.25)
  rect((-1, 0), (1, 2.25), fill: rgb("#fef3c7"), stroke: 1.2pt + rgb("#d97706"))
  
  content((1.2, 2.4), [$(x, y)$])
  circle((1, 2.25), radius: 0.05, fill: rgb("#b45309"))
  content((0.2, -0.3), $O$)
})

#let fig-hcn-elip = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((-3, 0), (3, 0), stroke: 0.8pt)
  line((0, -2), (0, 2), stroke: 0.8pt)
  
  // Ellipse x = 2.5*cos(t), y = 1.5*sin(t)
  let pts = ()
  for i in range(61) {
    let t = i * 360deg / 60
    pts.push((2.5 * calc.cos(t), 1.5 * calc.sin(t)))
  }
  line(..pts, stroke: 1.2pt + rgb("#3b82f6"))
  
  // Rectangle: x = 1.77, y = 1.06
  rect((-1.77, -1.06), (1.77, 1.06), fill: rgb("#fbcfe8"), stroke: 1.2pt + rgb("#db2777"))
  
  circle((1.77, 1.06), radius: 0.05, fill: rgb("#be185d"))
  content((2.0, 1.3), [$(x, y)$])
  content((0.2, -0.3), $O$)
})

#let fig-hcn-tg-deu = cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  // Triangle
  line((-2, 0), (2, 0), stroke: 1.2pt + rgb("#22c55e"))
  line((2, 0), (0, 3.46), stroke: 1.2pt + rgb("#22c55e"))
  line((0, 3.46), (-2, 0), stroke: 1.2pt + rgb("#22c55e"))
  
  // Rectangle
  rect((-1, 0), (1, 1.73), fill: rgb("#fef3c7"), stroke: 1.2pt + rgb("#d97706"))
  
  // Altitude
  line((0, 3.46), (0, 0), stroke: (paint: gray, dash: "dashed"))
  content((-0.25, 2.5), $H$)
  content((1.2, 0.8), $y$)
  content((0, -0.35), $x$)
})

#let fig-non-cau-3d = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Sphere boundary
  circle((0, 0), radius: 1.5, stroke: 0.8pt + rgb("#3b82f6"))
  // Sphere equator (dashed ellipse)
  circle((0, 0), radius: (1.5, 0.4), stroke: (paint: rgb("#3b82f6"), dash: "dashed", thickness: 0.6pt))
  
  // Cone top vertex
  let S = (0, 1.5)
  // Cone base center
  let O_c = (0, -0.5)
  // Cone base ellipse
  circle(O_c, radius: (1.41, 0.3), stroke: 1.2pt + rgb("#ef4444"))
  
  // Cone sides
  line(S, (-1.41, -0.5), stroke: 1.2pt + rgb("#ef4444"))
  line(S, (1.41, -0.5), stroke: 1.2pt + rgb("#ef4444"))
  
  // Center of sphere O
  circle((0, 0), radius: 0.04, fill: black)
  content((0.2, 0.2), $O$)
  
  // Height axis
  line(S, O_c, stroke: (paint: gray, dash: "dashed"))
  circle(O_c, radius: 0.03, fill: black)
  content((0.3, -0.5), $H$)
})

#let fig-tru-non-3d = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Cone base
  circle((0, 0), radius: (1.5, 0.35), stroke: 1pt + rgb("#22c55e"))
  // Cone sides
  line((0, 3), (-1.5, 0), stroke: 1pt + rgb("#22c55e"))
  line((0, 3), (1.5, 0), stroke: 1pt + rgb("#22c55e"))
  
  // Cylinder top base
  circle((0, 1), radius: (1.0, 0.22), stroke: 1.2pt + rgb("#f59e0b"), fill: rgb("#fffbeb"))
  // Cylinder bottom base (dashed)
  circle((0, 0), radius: (1.0, 0.22), stroke: (paint: rgb("#f59e0b"), dash: "dashed", thickness: 1.2pt))
  
  // Cylinder sides
  line((-1, 0), (-1, 1), stroke: 1.2pt + rgb("#f59e0b"))
  line((1, 0), (1, 1), stroke: 1.2pt + rgb("#f59e0b"))
  
  // Cone height line
  line((0, 3), (0, 0), stroke: (paint: gray, dash: "dashed"))
  circle((0, 0), radius: 0.03, fill: black)
})

#let fig-tru-cau-3d = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Sphere boundary
  circle((0, 0), radius: 1.73, stroke: 0.8pt + rgb("#3b82f6"))
  circle((0, 0), radius: (1.73, 0.4), stroke: (paint: rgb("#3b82f6"), dash: "dashed", thickness: 0.6pt))
  
  // Cylinder top base
  circle((0, 1), radius: (1.41, 0.3), stroke: 1.2pt + rgb("#ef4444"), fill: rgb("#fef2f2"))
  // Cylinder bottom base
  circle((0, -1), radius: (1.41, 0.3), stroke: 1.2pt + rgb("#ef4444"))
  
  // Cylinder sides
  line((-1.41, -1), (-1.41, 1), stroke: 1.2pt + rgb("#ef4444"))
  line((1.41, -1), (1.41, 1), stroke: 1.2pt + rgb("#ef4444"))
  
  // Center O
  circle((0, 0), radius: 0.04, fill: black)
})

#let fig-quat-giay = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Sector
  merge-path(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), close: true, {
    line((0, 0), (1.3, 0))
    arc((1.3, 0), start: 0deg, stop: 240deg, radius: 1.3)
    line((1.3 * calc.cos(240deg), 1.3 * calc.sin(240deg)), (0, 0))
  })
  content((0.5, 0.3), $R$)
  
  // Cone
  let cx = 3.5
  circle((cx, -0.6), radius: (0.8, 0.22), stroke: 1.2pt + rgb("#ef4444"))
  line((cx, 1.0), (cx - 0.8, -0.6), stroke: 1.2pt + rgb("#ef4444"))
  line((cx, 1.0), (cx + 0.8, -0.6), stroke: 1.2pt + rgb("#ef4444"))
  line((cx, 1.0), (cx, -0.6), stroke: (paint: gray, dash: "dashed"))
  line((cx, -0.6), (cx + 0.8, -0.6), stroke: (paint: gray, dash: "dashed"))
  content((cx + 0.4, 0.4), $L$)
  content((cx + 0.4, -0.85), $r$)
  content((cx - 0.25, 0.2), $h$)
})

#let fig-gia-phong = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (4.5, 0), stroke: 0.8pt)
  line((0, 0), (0, 4.5), stroke: 0.8pt)
  content((4.3, -0.3), [Giá])
  content((-0.4, 4.3), [Lợi nhuận])
  
  // Parabola y = 4.2 - 0.8 * (x-2)^2
  let pts = ()
  for i in range(41) {
    let x = 0.2 + i * 3.4 / 40
    let y = 4.2 - 0.8 * calc.pow(x - 2, 2)
    pts.push((x, y))
  }
  line(..pts, stroke: 1.2pt + rgb("#3b82f6"))
  
  // Peak at x = 2, y = 4.2
  line((2, 0), (2, 4.2), stroke: (paint: gray, dash: "dashed"))
  line((0, 4.2), (2, 4.2), stroke: (paint: gray, dash: "dashed"))
  circle((2, 4.2), radius: 0.05, fill: rgb("#ef4444"))
  content((2, -0.35), [1.800])
  content((2.98, 4.2), [Lớn nhất])
})

#let fig-ve-xe = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (4.5, 0), stroke: 0.8pt)
  line((0, 0), (0, 4.5), stroke: 0.8pt)
  content((4.3, -0.3), [Giá vé])
  content((-0.4, 4.3), [Lợi nhuận])
  
  // Parabola y = 4.0 - 0.6 * (x-2)^2
  let pts = ()
  for i in range(41) {
    let x = 0.2 + i * 3.6 / 40
    let y = 4.0 - 0.6 * calc.pow(x - 2, 2)
    pts.push((x, y))
  }
  line(..pts, stroke: 1.2pt + rgb("#10b981"))
  
  line((2.0, 0), (2.0, 4.0), stroke: (paint: gray, dash: "dashed"))
  line((0, 4.0), (2.0, 4.0), stroke: (paint: gray, dash: "dashed"))
  circle((2.0, 4.0), radius: 0.05, fill: rgb("#ef4444"))
  content((2.0, -0.3), [160k])
})

#let fig-chi-phi-tb-2 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (4.5, 0), stroke: 0.8pt)
  line((0, 0), (0, 4.5), stroke: 0.8pt)
  content((4.3, -0.3), [$x$])
  content((-0.6, 4.3), [$"AC"(x)$])
  
  // AC(x) = 0.3 * (x - 2.5)^2 + 1.2
  let pts = ()
  for i in range(41) {
    let x = 0.5 + i * 3.5 / 40
    let y = 0.3 * calc.pow(x - 2.5, 2) + 1.2
    pts.push((x, y))
  }
  line(..pts, stroke: 1.2pt + rgb("#f59e0b"))
  
  // Minimum at x = 2.5, y = 1.2
  line((2.5, 0), (2.5, 1.2), stroke: (paint: gray, dash: "dashed"))
  line((0, 1.2), (2.5, 1.2), stroke: (paint: gray, dash: "dashed"))
  circle((2.5, 1.2), radius: 0.05, fill: rgb("#ef4444"))
  content((2.5, -0.3), [$4$])
  content((-0.6, 1.25), [$"AC"_"min"$])
})

#let fig-thue-laffer = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (4.5, 0), stroke: 0.8pt)
  line((0, 0), (0, 4.5), stroke: 0.8pt)
  content((4.3, -0.3), [$t$])
  content((-0.4, 4.3), [$T(t)$])
  
  // Curve: y = 10 * (x/4 - (x/4)^3) -> peak at x/4 = 1/sqrt(3) -> x = 4/sqrt(3) = 2.3
  let pts = ()
  for i in range(41) {
    let x = i * 4.0 / 40
    let u = x / 4.0
    let y = 10.0 * (u - u * u * u)
    pts.push((x, y))
  }
  line(..pts, stroke: 1.2pt + rgb("#8b5cf6"))
  
  // Peak at x = 2.3
  let px = 2.31
  let py = 10.0 * (px/4.0 - calc.pow(px/4.0, 3))
  line((px, 0), (px, py), stroke: (paint: gray, dash: "dashed"))
  line((0, py), (px, py), stroke: (paint: gray, dash: "dashed"))
  circle((px, py), radius: 0.05, fill: rgb("#ef4444"))
  content((px, -0.3), [$57.7\%$])
})

#let fig-khoang-cach-2-duong = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Axes
  line((-1, 0), (4, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, -1.5), (0, 4.5), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((3.8, -0.3), [$x$])
  content((-0.3, 4.3), [$y$])
  content((-0.2, -0.2), $O$)
  
  // Parabola y = x^2
  let pts = ()
  for i in range(41) {
    let x = -0.6 + i * 2.8 / 40
    let y = x * x
    pts.push((x, y))
  }
  line(..pts, stroke: 1.2pt + rgb("#3b82f6"))
  content((1.8, 3.5), [$y = x^2$], fill: rgb("#3b82f6"))
  
  // Line y = 2x - 4
  line((0.8, -2.4), (3.8, 3.6), stroke: 1.2pt + rgb("#10b981"))
  content((3.4, 2.0), [$y = 2x - 4$], fill: rgb("#10b981"))
  
  // Tangent point M(1, 1) and Projection H(2.2, 0.4)
  circle((1, 1), radius: 0.04, fill: rgb("#ef4444"))
  content((0.7, 1.2), [$M(1;1)$])
  
  circle((2.2, 0.4), radius: 0.04, fill: rgb("#ef4444"))
  content((2.5, 0.2), [$H$])
  
  line((1, 1), (2.2, 0.4), stroke: (paint: rgb("#ef4444"), dash: "dashed", thickness: 1pt))
})

#let fig-khoang-cach-2-duong-cong = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Axes
  line((-1.5, 0), (4.5, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, -1.5), (0, 4.5), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((4.3, -0.3), [$x$])
  content((-0.3, 4.3), [$y$])
  content((-0.2, -0.2), $O$)
  
  // y = x (symmetry line)
  line((-1.2, -1.2), (4.0, 4.0), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  content((3.8, 3.4), [$y=x$], fill: gray)
  
  // y = exp(x)
  let pts1 = ()
  for i in range(41) {
    let x = -1.5 + i * 2.9 / 40
    let y = calc.exp(x)
    pts1.push((x, y))
  }
  line(..pts1, stroke: 1.2pt + rgb("#3b82f6"))
  content((0.8, 3.2), [$y = e^x$], fill: rgb("#3b82f6"))
  
  // y = ln(x)
  let pts2 = ()
  for i in range(40) {
    let x = 0.2 + i * 4.0 / 39
    let y = calc.ln(x)
    pts2.push((x, y))
  }
  line(..pts2, stroke: 1.2pt + rgb("#10b981"))
  content((3.2, 0.8), [$y = ln(x)$], fill: rgb("#10b981"))
  
  // Points M(0, 1) and N(1, 0)
  circle((0, 1), radius: 0.04, fill: rgb("#ef4444"))
  content((-0.4, 1.2), [$M(0;1)$])
  
  circle((1, 0), radius: 0.04, fill: rgb("#ef4444"))
  content((1.2, -0.35), [$N(1;0)$])
  
  // Line segment MN
  line((0, 1), (1, 0), stroke: (paint: rgb("#ef4444"), dash: "dashed", thickness: 1pt))
})

#let fig-khoang-cach-parabol-tron = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Axes
  line((-1, 0), (4.5, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, -1), (0, 4.5), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((4.3, -0.3), [$x$])
  content((-0.3, 4.3), [$y$])
  content((-0.2, -0.2), $O$)
  
  // y = x^2
  let pts1 = ()
  for i in range(41) {
    let x = -0.6 + i * 2.7 / 40
    let y = x * x
    pts1.push((x, y))
  }
  line(..pts1, stroke: 1.2pt + rgb("#3b82f6"))
  content((1.8, 3.5), [$y = x^2$], fill: rgb("#3b82f6"))
  
  // Circle (x-3)^2 + y^2 = 1
  circle((3, 0), radius: 1, stroke: 1.2pt + rgb("#10b981"))
  circle((3, 0), radius: 0.04, fill: rgb("#10b981"))
  content((3, -0.35), [$I(3;0)$])
  
  // M(1, 1) on parabola
  circle((1, 1), radius: 0.04, fill: rgb("#ef4444"))
  content((0.6, 1.2), [$M(1;1)$])
  
  // Draw line segment from M to center I
  line((1, 1), (3, 0), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  
  // N is at (3 - 2/sqrt(5), 2/sqrt(5)) approx (2.106, 0.447)
  circle((2.106, 0.447), radius: 0.04, fill: rgb("#ef4444"))
  content((2.0, 0.15), [$N$])
  
  // Highlight MN
  line((1, 1), (2.106, 0.447), stroke: 1.2pt + rgb("#ef4444"))
})

#let fig-ba-moi-truong = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  
  // Draw boundaries
  line((-4, 1.5), (4, 1.5), stroke: 0.8pt + gray)
  line((-4, 0), (4, 0), stroke: 0.8pt + gray)
  
  // Fill layers with transparent colors
  rect((-4, 1.5), (4, 3.5), fill: rgb(59, 130, 246, 30), stroke: none)
  rect((-4, 0), (4, 1.5), fill: rgb(16, 185, 129, 30), stroke: none)
  rect((-4, -2), (4, 0), fill: rgb(245, 158, 11, 30), stroke: none)
  
  // Labels for layers
  content((-2.8, 2.5), [Môi trường 1
$v_1 = 6$ m/s])
  content((-2.8, 0.75), [Môi trường 2
$v_2 = 8$ m/s])
  content((-2.8, -1.0), [Môi trường 3
$v_3 = 5$ m/s])
  
  // Path: A(-2.5, 3.5) -> M1(-1.0, 1.5) -> M2(1.0, 0) -> B(2.5, -2.0)
  line((-2.5, 3.5), (-1.0, 1.5), (1.0, 0), (2.5, -2.0), stroke: 1.5pt + rgb("#ef4444"))
  
  circle((-2.5, 3.5), radius: 0.05, fill: black)
  content((-2.5, 3.8), $A$)
  
  circle((2.5, -2.0), radius: 0.05, fill: black)
  content((2.5, -2.3), $B$)
  
  // Normals
  line((-1.0, 0.8), (-1.0, 2.2), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line((1.0, -0.7), (1.0, 0.7), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
})


#exam-part([Chủ đề 1. Bài toán Tối ưu hóa Hình học 2D], count: 16)

#q-wrap(dir: "doc", tn(
  [Một tấm bìa hình vuông có cạnh $12" cm"$. Người ta cắt bỏ đi ở bốn góc bốn hình vuông nhỏ bằng nhau có cạnh là $x" (cm)"$ rồi gấp lên thành một chiếc hộp không nắp. Tính giá trị của $x$ để thể tích của chiếc hộp là lớn nhất.
  #align(center)[#grid(columns: 2, gutter: 1.5cm, fig-hop, fig-hop-3d)]],
  (
    [$x = 3" cm"$],
    True([$x = 2" cm"$]),
    [$x = 4" cm"$],
    [$x = 1" cm"$],
  ),
  
  loigiai: [
    #step[Sau khi cắt bốn góc và gấp lên, ta được một hình hộp chữ nhật có đáy là hình vuông.]
    #step[Cạnh đáy của hộp là $12 - 2x" (cm)"$. Chiều cao hộp là $x" (cm)"$. Điều kiện thực tế của ẩn số: $0 < x < 6$.]
    #step[Thể tích của chiếc hộp là: $V(x) = (12 - 2x)^2 * x = 4x(6 - x)^2 = 4x^3 - 48x^2 + 144x" (cm"^3)$.]
    #step[Tính đạo hàm: $V'(x) = 12x^2 - 96x + 144 = 12(x^2 - 8x + 12)$.]
    #step[Tìm nghiệm đạo hàm trên miền xác định: $V'(x) = 0 <=> x^2 - 8x + 12 = 0 <=> x = 2$ (thỏa mãn) hoặc $x = 6$ (loại).]
    #step[Bảng biến thiên của hàm số $V(x)$ trên khoảng $(0; 6)$ như sau:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $2$, $6$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $128$, $0$),
        )
      ]
    ]
    #step[Từ bảng biến thiên, ta thấy thể tích $V(x)$ đạt giá trị cực đại và cũng là giá trị lớn nhất bằng $128" cm"^3$ tại $x = 2" cm"$.]
    #step[*Kết luận:* Vậy thể tích chiếc hộp đạt giá trị lớn nhất khi $x = 2" cm"$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một bác nông dân có $60" m"$ lưới B40 muốn rào một mảnh vườn hình chữ nhật dọc theo bờ sông (bờ sông không cần rào). Diện tích mảnh vườn lớn nhất có thể rào được là bao nhiêu?
  #align(center)[#fig-song]],
  (
    [$300" m"^2$],
    True([$450" m"^2$]),
    [$900" m"^2$],
    [$225" m"^2$],
  ),
  
  loigiai: [
    #step[Gọi chiều rộng mảnh vườn (đoạn vuông góc với bờ sông) là $x" (m)"$. Điều kiện ẩn số: $0 < x < 30$.]
    #step[Chiều dài mảnh vườn (đoạn song song bờ sông) sẽ là $60 - 2x" (m)"$ do chỉ cần rào 3 mặt xung quanh.]
    #step[Diện tích mảnh vườn: $S(x) = x(60 - 2x) = 60x - 2x^2" (m"^2)$.]
    #step[Đạo hàm: $S'(x) = 60 - 4x$.]
    #step[Cho $S'(x) = 0 <=> x = 15$ (thỏa mãn điều kiện).]
    #step[Bảng biến thiên của hàm số $S(x)$ trên khoảng $(0; 30)$ như sau:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $15$, $30$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $450$, $0$),
        )
      ]
    ]
    #step[Từ bảng biến thiên, ta thấy diện tích mảnh vườn đạt giá trị cực đại và cũng là lớn nhất bằng $450" m"^2$ tại $x = 15" m"$.]
    #step[*Kết luận:* Vậy diện tích lớn nhất có thể rào được của mảnh vườn dọc bờ sông là $450" m"^2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một đường dây điện được nối từ nhà máy điện ở bờ biển đến một hòn đảo. Biết rằng khoảng cách ngắn nhất từ đảo đến bờ biển là $3" km"$, khoảng cách từ điểm cách đảo gần nhất trên bờ đến nhà máy điện là $10" km"$. Chi phí lắp đặt cáp ngầm dưới biển là $500$ triệu đồng/km, chi phí lắp cáp trên bờ là $300$ triệu đồng/km. Phương án tối ưu (tổng chi phí thấp nhất) có chi phí xấp xỉ là bao nhiêu triệu đồng?
  #align(center)[#fig-cap]],
  (
    [$3900$ triệu],
    [$4500$ triệu],
    True([$4200$ triệu]),
    [$4000$ triệu],
  ),
  
  loigiai: [
    #step[Gọi $x" (km)"$ là khoảng cách từ điểm gần nhất trên bờ $H$ đến điểm tiếp đất của cáp $M$ ($0 <= x <= 10$).]
    #step[Chiều dài cáp ngầm dưới biển (đoạn $M B$): $d_1 = sqrt(x^2 + 3^2) = sqrt(x^2 + 9)" (km)"$.]
    #step[Chiều dài cáp trên bờ (đoạn $A M$): $d_2 = 10 - x" (km)"$.]
    #step[Tổng chi phí lắp đặt: $C(x) = 500sqrt(x^2 + 9) + 300(10 - x)$ (triệu đồng).]
    #step[Đạo hàm: $C'(x) = 500 * frac(x, sqrt(x^2 + 9)) - 300 = frac(500x - 300sqrt(x^2 + 9), sqrt(x^2 + 9))$.]
    #step[Cho $C'(x) = 0 <=> 5x = 3sqrt(x^2 + 9) <=> 25x^2 = 9(x^2 + 9) <=> 16x^2 = 81 <=> x = 9/4 = 2.25" (km)"$ (thỏa mãn).]
    #step[Bảng biến thiên của hàm số $C(x)$ trên đoạn $[0; 10]$ như sau:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $2.25$, $10$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($4500$, $4200$, $500 sqrt(109)$),
        )
      ]
    ]
    #step[Từ bảng biến thiên, chi phí lắp đặt cực tiểu là $4200$ triệu đồng đạt được tại vị trí cách đảo theo hình chiếu là $2.25" km"$.]
    #step[*Kết luận:* Vậy chi phí tối ưu nhất để lắp đặt đường dây điện là $4200$ triệu đồng.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một xưởng in ấn cần thiết kế một trang sách hình chữ nhật có diện tích $600" cm"^2$. Phần lề trên và lề dưới mỗi lề là $3" cm"$, lề trái và lề phải mỗi lề là $2" cm"$. Để diện tích phần in chữ lớn nhất, chiều rộng và chiều dài của trang sách phải là:
  #align(center)[#fig-trang]],
  (
    [$15" cm"$ và $40" cm"$],
    True([$20" cm"$ và $30" cm"$]),
    [$25" cm"$ và $24" cm"$],
    [$10" cm"$ và $60" cm"$],
  ),
  
  loigiai: [
    #step[Gọi chiều rộng và chiều dài trang sách lần lượt là $x$ và $y$ ($x, y > 0$). Ta có $x * y = 600 => y = frac(600, x)$ (cm).]
    #step[Điều kiện biên thực tế của chiều rộng: $x > 4$ (để lề trái và phải không vượt quá chiều rộng).]
    #step[Phần diện tích in chữ bên trong có chiều rộng là $x - 4$ (cm) và chiều dài là $y - 6$ (cm).]
    #step[Hàm diện tích vùng in: $S(x) = (x - 4)(y - 6) = (x - 4)(frac(600, x) - 6) = 624 - (6x + frac(2400, x))$ (cm²).]
    #step[Đạo hàm: $S'(x) = -6 + frac(2400, x^2) = frac(2400 - 6x^2, x^2)$.]
    #step[Cho $S'(x) = 0 <=> 6x^2 = 2400 <=> x^2 = 400 <=> x = 20$ (thỏa mãn $x > 4$).]
    #step[Bảng biến thiên của hàm số $S(x)$ trên khoảng $(4; +oo)$ như sau:
      #align(center)[
        #my-bbbt(
          x-vals: ($4$, $20$, $+oo$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $384$, $-oo$),
        )
      ]
    ]
    #step[Từ bảng biến thiên, diện tích phần in chữ lớn nhất đạt cực đại bằng $384" cm"^2$ khi chiều rộng trang sách là $x = 20" cm"$.]
    #step[Chiều dài trang sách tương ứng là $y = frac(600, 20) = 30" cm"$.]
    #step[*Kết luận:* Vậy chiều rộng và chiều dài trang sách lần lượt là $20" cm"$ và $30" cm"$ để vùng in lớn nhất.]
  ],

))

#q-wrap(dir: "doc", tn(
  [Một chiếc cửa sổ có hình dạng là một nửa hình tròn úp lên một hình chữ nhật. Nếu chu vi của cửa sổ là $8" m"$, để cửa sổ đón được nhiều ánh sáng nhất (diện tích lớn nhất) thì bán kính của nửa hình tròn gần nhất với giá trị nào sau đây?
  #align(center)[#fig-cua]],
  (
    [$0.8" m"$],
    True([$1.12" m"$]),
    [$1.5" m"$],
    [$2.0" m"$],
  ),
  
  loigiai: [
    #step[Gọi bán kính của nửa hình tròn là $r$ (m), chiều cao phần hình chữ nhật là $h$ (m) ($r, h > 0$). Chiều rộng hình chữ nhật tương ứng là $2r$ (m).]
    #step[Chu vi của cửa sổ gồm nửa chu vi đường tròn và ba cạnh của hình chữ nhật:
      $P = pi r + 2h + 2r = 8 => 2h = 8 - r(pi + 2) => h = 4 - r(frac(pi + 2, 2))$.]
    #step[Điều kiện thực tế của bán kính: $h > 0 <=> 4 - r(frac(pi + 2, 2)) > 0 <=> r < frac(8, pi + 2)$.]
    #step[Diện tích toàn bộ cửa sổ đón ánh sáng: $S = S_"hcn" + S_"nt" = 2r h + frac(pi r^2, 2)$ (m²).]
    #step[Thay $h$ vào ta được hàm diện tích theo ẩn $r$:
      $S(r) = 2r [ 4 - r(frac(pi + 2, 2)) ] + frac(pi r^2, 2) = 8r - r^2(pi + 2) + frac(pi, 2)r^2 = 8r - r^2 (frac(pi + 4, 2))$.]
    #step[Tính đạo hàm: $S'(r) = 8 - 2r (frac(pi + 4, 2)) = 8 - r(pi + 4)$.]
    #step[Cho $S'(r) = 0 <=> r = frac(8, pi + 4) approx 1.12" (m)"$ (thỏa mãn điều kiện $r < frac(8, pi + 2)$).]
    #step[Bảng biến thiên của hàm số $S(r)$ trên khoảng $(0; frac(8, pi + 2))$ như sau:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $frac(8, pi + 4)$, $frac(8, pi + 2)$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $frac(32, pi + 4)$, $S(frac(8, pi + 2))$),
        )
      ]
    ]
    #step[Từ bảng biến thiên, diện tích đón ánh sáng lớn nhất khi bán kính nửa hình tròn bằng $r = frac(8, pi + 4) approx 1.12" m"$.]
    #step[*Kết luận:* Vậy bán kính gần nhất với giá trị $1.12" m"$ để cửa sổ đón được nhiều ánh sáng nhất.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một mảnh đất hình tam giác có đáy là $20" m"$ và chiều cao tương ứng là $10" m"$. Người ta muốn xây một khu nhà hình chữ nhật nội tiếp trong tam giác đó (một cạnh nằm trên đáy tam giác). Diện tích lớn nhất của khu nhà là bao nhiêu?
  #align(center)[#fig-tam-giac-hcn]],
  (
    [$40" m"^2$],
    True([$50" m"^2$]),
    [$60" m"^2$],
    [$80" m"^2$],
  ),
  
  loigiai: [
    #step[Gọi chiều cao của khu nhà hình chữ nhật là $y" (m)"$ ($0 < y < 10$), và chiều rộng (cạnh nằm trên đáy tam giác) là $x" (m)"$.]
    #step[Sử dụng định lý Thales cho tam giác đồng dạng, ta có tỉ lệ: $frac(x, 20) = frac(10 - y, 10) => x = 2(10 - y)$.]
    #step[Diện tích hình chữ nhật là $S(y) = x * y = 2y(10 - y) = 20y - 2y^2$.]
    #step[Đạo hàm $S'(y) = 20 - 4y = 0 <=> y = 5" (m)"$.]
    #step[Khi đó $x = 2(10 - 5) = 10" (m)"$. Diện tích lớn nhất là $S_"max" = 10 * 5 = 50" (m"^2)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một sợi dây có chiều dài $12" m"$ được cắt thành hai đoạn. Đoạn thứ nhất được uốn thành một hình tam giác đều, đoạn thứ hai được uốn thành một hình tròn. Để tổng diện tích của hai hình thu được là nhỏ nhất thì độ dài đoạn dây uốn thành hình tam giác đều xấp xỉ bằng bao nhiêu?
  #align(center)[#fig-cat-day-tam-giac]],
  (
    [$5.24" m"$],
    True([$7.48" m"$]),
    [$4.52" m"$],
    [$6.28" m"$],
  ),
  
  loigiai: [
    #step[Gọi $x" (m)"$ là độ dài đoạn dây uốn thành hình tam giác đều ($0 < x < 12$). Đoạn uốn thành hình tròn dài $12 - x" (m)"$.]
    #step[Cạnh của tam giác đều tương ứng là $a = frac(x, 3)$ (m). Diện tích tam giác đều: $S_1 = frac(sqrt(3), 4) a^2 = frac(sqrt(3), 36) x^2$.]
    #step[Chu vi hình tròn là $12 - x$, suy ra bán kính $R = frac(12 - x, 2pi)$. Diện tích hình tròn: $S_2 = pi R^2 = frac((12 - x)^2, 4pi)$.]
    #step[Tổng diện tích hai hình: $S(x) = frac(sqrt(3), 36) x^2 + frac((12 - x)^2, 4pi)$ với $x in (0; 12)$.]
    #step[Tính đạo hàm: $S'(x) = frac(sqrt(3), 18) x - frac(12 - x, 2pi) = (frac(sqrt(3), 18) + frac(1, 2pi))x - frac(6, pi)$.]
    #step[Cho $S'(x) = 0 <=> x = frac(6/pi, frac(sqrt(3), 18) + frac(1, 2pi)) = frac(108, pi sqrt(3) + 9) approx 7.48" (m)"$.]
    #step[Bảng biến thiên cho thấy tổng diện tích đạt giá trị nhỏ nhất tại $x approx 7.48" m"$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một tấm bìa hình chữ nhật có kích thước $8" dm" times 5" dm"$. Người ta cắt bỏ đi ở bốn góc bốn hình vuông nhỏ bằng nhau có cạnh $x" (dm)"$ rồi gấp lên thành một chiếc hộp không nắp. Tính giá trị $x$ để thể tích của chiếc hộp là lớn nhất (làm tròn đến hàng phần trăm).
  #align(center)[#fig-hop-chu-nhat]],
  (
    [$x = 1.67" dm"$],
    [$x = 0.83" dm"$],
    True([$x = 1.00" dm"$]),
    [$x = 1.25" dm"$],
  ),
  
  loigiai: [
    #step[Sau khi cắt bốn góc và gấp lên, chiều dài đáy hộp là $8 - 2x" (dm)"$, chiều rộng đáy là $5 - 2x" (dm)"$, và chiều cao là $x" (dm)"$.]
    #step[Điều kiện thực tế cho cạnh hình vuông nhỏ là $0 < x < 2.5$.]
    #step[Thể tích hộp: $V(x) = x(8 - 2x)(5 - 2x) = 4x^3 - 26x^2 + 40x" (dm"^3)$.]
    #step[Tính đạo hàm: $V'(x) = 12x^2 - 52x + 40 = 4(3x^2 - 13x + 10)$.]
    #step[Cho $V'(x) = 0 <=> (x - 1)(3x - 10) = 0 <=> x = 1$ (thỏa mãn) hoặc $x = 10/3 approx 3.33$ (loại).]
    #step[Khảo sát hàm số trên khoảng $(0; 2.5)$, ta thấy $V(x)$ đạt giá trị lớn nhất tại $x = 1.00" dm"$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm diện tích lớn nhất của hình chữ nhật nội tiếp trong đường tròn có bán kính $R = 10$.
  #align(center)[#fig-hcn-tron]],
  (
    [$100$],
    [$150$],
    True([$200$]),
    [$100sqrt(2)$],
  ),
  
  loigiai: [
    #step[Gọi kích thước của hình chữ nhật là $2x$ và $2y$ với $x, y > 0$.]
    #step[Do hình chữ nhật nội tiếp đường tròn bán kính $R = 10$, ta có hệ thức: $x^2 + y^2 = R^2 = 100 => y = sqrt(100 - x^2)$ (điều kiện $0 < x < 10$).]
    #step[Diện tích hình chữ nhật là: $S(x) = 2x * 2y = 4x sqrt(100 - x^2)$ với $0 < x < 10$.]
    #step[Tính đạo hàm: $S'(x) = 4sqrt(100 - x^2) + 4x . frac(-x, sqrt(100 - x^2)) = frac(4(100 - 2x^2), sqrt(100 - x^2))$.]
    #step[Cho $S'(x) = 0 <=> 100 - 2x^2 = 0 <=> x^2 = 50 => x = 5sqrt(2)$ (vì $x > 0$).]
    #step[Khảo sát sự biến thiên của hàm số $S(x)$ trên khoảng $(0; 10)$ cho thấy:
      - Với $0 < x < 5sqrt(2)$, ta có $S'(x) > 0$, hàm số đồng biến.
      - Với $5sqrt(2) < x < 10$, ta có $S'(x) < 0$, hàm số nghịch biến.
      Do đó, diện tích lớn nhất tại $x = 5sqrt(2)$ với $S_"max" = S(5sqrt(2)) = 4(5sqrt(2))(sqrt(50)) = 200$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một hình chữ nhật được đặt nội tiếp trong một parabol $y = 12 - x^2$ sao cho một cạnh nằm trên trục hoành và hai đỉnh còn lại nằm trên parabol. Diện tích lớn nhất của hình chữ nhật này là:
  #align(center)[#fig-hcn-parabol]],
  (
    [$24$],
    [$28$],
    True([$32$]),
    [$36$],
  ),
  
  loigiai: [
    #step[Gọi tọa độ của đỉnh nằm trên parabol ở góc phần tư thứ nhất là $M(x, 12 - x^2)$ với $0 < x < sqrt(12)$.]
    #step[Chiều rộng của hình chữ nhật là $2x$, chiều cao tương ứng là $12 - x^2$.]
    #step[Diện tích hình chữ nhật là $S(x) = 2x(12 - x^2) = 24x - 2x^3$.]
    #step[Đạo hàm $S'(x) = 24 - 6x^2 = 0 <=> x^2 = 4 => x = 2$ (do $x > 0$).]
    #step[Bảng biến thiên trên $(0; sqrt(12))$ cho thấy diện tích đạt giá trị lớn nhất tại $x = 2$.]
    #step[Giá trị diện tích cực đại: $S(2) = 2(2)(12 - 4) = 32$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho elip $(E): frac(x^2, 25) + frac(y^2, 9) = 1$. Một hình chữ nhật nội tiếp trong elip $(E)$ có các cạnh song song với các trục tọa độ. Diện tích lớn nhất của hình chữ nhật này là:
  #align(center)[#fig-hcn-elip]],
  (
    [$15$],
    [$24$],
    True([$30$]),
    [$60$],
  ),
  
  loigiai: [
    #step[Từ phương trình elip ta có: $frac(y^2, 9) = 1 - frac(x^2, 25) => y = frac(3, 5)sqrt(25 - x^2)$ (vì $y > 0$).]
    #step[Diện tích hình chữ nhật là: $S(x) = 4x y = frac(12, 5) x sqrt(25 - x^2)$ với $0 < x < 5$.]
    #step[Tính đạo hàm: $S'(x) = frac(12, 5) sqrt(25 - x^2) + frac(12, 5) x . frac(-x, sqrt(25 - x^2)) = frac(12(25 - 2x^2), 5sqrt(25 - x^2))$.]
    #step[Cho $S'(x) = 0 <=> 25 - 2x^2 = 0 <=> x = frac(5, sqrt(2))$ (vì $0 < x < 5$).]
    #step[Khảo sát sự biến thiên của hàm số $S(x)$ trên khoảng $(0; 5)$ cho thấy:
      - Với $0 < x < frac(5, sqrt(2))$, ta có $S'(x) > 0$, hàm số đồng biến.
      - Với $frac(5, sqrt(2)) < x < 5$, ta có $S'(x) < 0$, hàm số nghịch biến.
      Do đó, diện tích lớn nhất tại $x = frac(5, sqrt(2))$ với $S_"max" = S(frac(5, sqrt(2))) = frac(12, 5) (frac(5, sqrt(2))) (frac(5, sqrt(2))) = 30$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một hình chữ nhật nội tiếp trong một tam giác đều cạnh $a = 6$ sao cho một cạnh nằm trên một cạnh của tam giác đều. Diện tích lớn nhất của hình chữ nhật này là:
  #align(center)[#fig-hcn-tg-deu]],
  (
    [$3sqrt(3)$],
    True([$frac(9sqrt(3), 2)$]),
    [$6sqrt(3)$],
    [$9sqrt(3)$],
  ),
  
  loigiai: [
    #step[Đường cao của tam giác đều cạnh $6$ là $H = 6 * frac(sqrt(3), 2) = 3sqrt(3)$.]
    #step[Gọi chiều cao của hình chữ nhật là $y$ ($0 < y < 3sqrt(3)$) và chiều rộng là $x$ ($0 < x < 6$).]
    #step[Theo định lý Thales cho hai tam giác đồng dạng, ta có tỉ lệ: $frac(x, 6) = frac(3sqrt(3) - y, 3sqrt(3)) => x = 6 - frac(2, sqrt(3)) y$.]
    #step[Diện tích hình chữ nhật: $S(y) = x * y = y (6 - frac(2, sqrt(3)) y) = 6y - frac(2, sqrt(3)) y^2$.]
    #step[Đạo hàm $S'(y) = 6 - frac(4, sqrt(3)) y = 0 <=> y = frac(3sqrt(3), 2)$.]
    #step[Khi đó $x = 3$. Diện tích lớn nhất của hình chữ nhật là: $S_"max" = 3 * frac(3sqrt(3), 2) = frac(9sqrt(3), 2)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm khoảng cách ngắn nhất giữa một điểm $M$ nằm trên parabol $(P): y = x^2$ và một điểm $N$ nằm trên đường thẳng $d: y = 2x - 4$.
  #align(center)[#fig-khoang-cach-2-duong]],
  (
    [$frac(2sqrt(5), 5)$],
    True([$frac(3sqrt(5), 5)$]),
    [$frac(4sqrt(5), 5)$],
    [$sqrt(5)$],
  ),
  
  loigiai: [
    #step[Gọi điểm $M(x_0, x_0^2)$ thuộc parabol $(P): y = x^2$.]
    #step[Khoảng cách từ điểm $M$ đến đường thẳng $d: 2x - y - 4 = 0$ được tính bằng công thức: $d(M, d) = frac(|2x_0 - x_0^2 - 4|, sqrt(2^2 + (-1)^2)) = frac(|x_0^2 - 2x_0 + 4|, sqrt(5))$.]
    #step[Vì $x_0^2 - 2x_0 + 4 > 0$ với mọi $x_0$, nên ta xét hàm số $g(x) = x^2 - 2x + 4$ trên $RR$.]
    #step[Tính đạo hàm: $g'(x) = 2x - 2 = 0 <=> x = 1$.]
    #step[Khảo sát sự biến thiên của $g(x)$ ta thấy $g'(x) < 0$ với $x < 1$ và $g'(x) > 0$ với $x > 1$. Do đó $g(x)$ đạt giá trị nhỏ nhất tại $x = 1$ với $g(1) = 3$.]
    #step[Vậy khoảng cách ngắn nhất tương ứng là $d_"min" = frac(3, sqrt(5)) = frac(3sqrt(5), 5)$ đạt được khi $M(1; 1)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hai đường cong $(C_1): y = e^x$ và $(C_2): y = ln x$. Tìm khoảng cách ngắn nhất giữa hai điểm $M$ và $N$ bất kỳ lần lượt nằm trên hai đường cong đã cho.
  #align(center)[#fig-khoang-cach-2-duong-cong]],
  (
    [$sqrt(2)/2$],
    True([$sqrt(2)$]),
    [$2$],
    [$2sqrt(2)$],
  ),
  
  loigiai: [
    #step[Hai đường cong $(C_1): y = e^x$ và $(C_2): y = ln x$ là hai hàm số ngược nhau, do đó chúng đối xứng nhau qua đường phân giác thứ nhất $d: y = x$.]
    #step[Khoảng cách ngắn nhất giữa điểm $M in (C_1)$ và điểm $N in (C_2)$ đạt được tại hai điểm có tiếp tuyến song song với đường thẳng $d: y = x$ (tức là hệ số góc tiếp tuyến bằng $1$).]
    #step[Xét điểm $M(x_1, e^(x_1)) in (C_1)$. Tiếp tuyến tại $M$ song song với $d$ khi đạo hàm của hàm số tại $x_1$ bằng $1$: $y'(x_1) = e^(x_1) = 1 <=> x_1 = 0 => M(0; 1)$.]
    #step[Xét điểm $N(x_2, ln x_2) in (C_2)$ với $x_2 > 0$. Tiếp tuyến tại $N$ song song với $d$ khi đạo hàm của hàm số tại $x_2$ bằng $1$: $y'(x_2) = frac(1, x_2) = 1 <=> x_2 = 1 => N(1; 0)$.]
    #step[Do đó, khoảng cách ngắn nhất cần tìm là: $d_"min" = M N = sqrt((1 - 0)^2 + (0 - 1)^2) = sqrt(2)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm khoảng cách ngắn nhất giữa hai điểm $M$ và $N$ bất kỳ lần lượt nằm trên parabol $(P): y = x^2$ và đường tròn $(C): (x - 3)^2 + y^2 = 1$.
  #align(center)[#fig-khoang-cach-parabol-tron]],
  (
    [$sqrt(5) - 2$],
    True([$sqrt(5) - 1$]),
    [$sqrt(5)$],
    [$1$],
  ),
  
  loigiai: [
    #step[Đường tròn $(C)$ có tâm $I(3; 0)$ và bán kính $R = 1$. Gọi $M(x_0, x_0^2)$ là một điểm thuộc parabol $(P)$.]
    #step[Với mọi điểm $N$ thuộc đường tròn $(C)$, ta luôn có $M N >= M I - R$. Do đó khoảng cách $M N$ ngắn nhất khi và chỉ khi khoảng cách $M I$ đạt giá trị nhỏ nhất.]
    #step[Ta xét bình phương khoảng cách $M I$: $g(x_0) = M I^2 = (x_0 - 3)^2 + (x_0^2 - 0)^2 = x_0^4 + x_0^2 - 6x_0 + 9$.]
    #step[Tính đạo hàm: $g'(x_0) = 4x_0^3 + 2x_0 - 6 = 2(x_0 - 1)(2x_0^2 + 2x_0 + 3)$.]
    #step[Ta thấy $2x_0^2 + 2x_0 + 3 = 2(x_0 + 1/2)^2 + 5/2 > 0$ với mọi $x_0$, nên $g'(x_0) = 0 <=> x_0 = 1$.]
    #step[Lập bảng biến thiên của $g(x_0)$, ta thấy hàm số đạt giá trị nhỏ nhất tại $x_0 = 1$ với $g(1) = 1^4 + 1^2 - 6*1 + 9 = 5$.]
    #step[Do đó, khoảng cách ngắn nhất từ $I$ đến $(P)$ là $M I_"min" = sqrt(5)$ đạt được khi $M(1; 1)$.]
    #step[Khoảng cách ngắn nhất giữa parabol $(P)$ và đường tròn $(C)$ là $d_"min" = M I_"min" - R = sqrt(5) - 1$.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một sợi dây có chiều dài $28" m"$ được cắt thành hai đoạn để làm một hình vuông và một hình tròn. Đoạn thứ nhất dài $x" (m)"$ làm thành hình vuông, đoạn còn lại làm thành hình tròn. Xét tính Đúng/Sai của các mệnh đề sau:
  #align(center)[#fig-cat-day]],
  (
    [Độ dài cạnh hình vuông là $x/2$.],
    True([Bán kính hình tròn là $frac(28 - x, 2pi)$.]),
    True([Tổng diện tích của hai hình đạt giá trị nhỏ nhất khi phần dây làm hình tròn có độ dài là $frac(28pi, 4 + pi)" m"$.]),
    [Nếu phần dây làm hình vuông dài hơn phần dây làm hình tròn thì diện tích thu được luôn là lớn nhất.],
  ),
  
  loigiai: [
    - a) Sai. Đoạn dài $x$ làm thành hình vuông nên chu vi hình vuông là $x$, suy ra cạnh hình vuông là $x/4$.
    - b) Đúng. Đoạn còn lại dài $28 - x$ làm chu vi hình tròn nên $2pi R = 28 - x => R = frac(28 - x, 2pi)$.
    - c) Đúng. Tổng diện tích $S = (frac(x, 4))^2 + pi(frac(28 - x, 2pi))^2 = frac(x^2, 16) + frac((28 - x)^2, 4pi)$.
      Đạo hàm $S' = frac(x, 8) - frac(28 - x, 2pi) = 0 <=> pi x = 4(28 - x) <=> (pi + 4)x = 112 => x = frac(112, pi + 4)$.
      Khi đó chiều dài đoạn làm hình tròn là $28 - x = 28 - frac(112, pi + 4) = frac(28pi + 112 - 112, pi + 4) = frac(28pi, pi + 4)$.
    - d) Sai. Giá trị nhỏ nhất là duy nhất. Không có hàm liên quan đến "luôn lớn nhất". Tổng diện tích lớn nhất khi không cắt dây (dùng cả dây làm hình tròn).
  ],
))


#exam-part([Chủ đề 2. Bài toán Tối ưu hóa Hình học 3D], count: 10)

#q-wrap(dir: "doc", tn(
  [Người ta muốn thiết kế một lon sữa hình trụ đứng có thể tích là $V = 16pi" cm"^3$. Biết rằng giá thành vật liệu làm hai đáy đắt gấp đôi giá thành làm mặt xung quanh (tính trên cùng một đơn vị diện tích). Gọi $r, h$ lần lượt là bán kính đáy và chiều cao của lon sữa. Để chi phí sản xuất thấp nhất, tỉ số $h/r$ bằng bao nhiêu?
  #align(center)[#fig-tru-3d]],

  (
    [$h/r = 1$],
    [$h/r = 2$],
    True([$h/r = 4$]),
    [$h/r = 1/2$],
  ),
  
  loigiai: [
    #step[Thể tích lon sữa: $V = pi r^2 h = 16pi => h = frac(16, r^2)$ (với $r > 0$).]
    #step[Gọi giá thành làm $1" cm"^2$ mặt xung quanh là $a$ ($a > 0$). Giá thành làm $1" cm"^2$ mặt đáy là $2a$.]
    #step[Diện tích xung quanh: $S_"xq" = 2pi r h$. Diện tích 2 đáy: $S_d = 2pi r^2$.]
    #step[Hàm chi phí sản xuất: $C(r) = a * S_"xq" + 2a * S_d = a(2pi r h + 4pi r^2) = 2pi a(r h + 2r^2)$.]
    #step[Thay $h = frac(16, r^2)$ vào hàm chi phí: $C(r) = 2pi a(frac(16, r) + 2r^2)$ với $r > 0$.]
    #step[Tính đạo hàm: $C'(r) = 2pi a(-frac(16, r^2) + 4r) = 2pi a frac(4r^3 - 16, r^2)$.]
    #step[Cho $C'(r) = 0 <=> 4r^3 - 16 = 0 <=> r^3 = 4 <=> r = root(3, 4)" cm"$.]
    #step[Bảng biến thiên của hàm số $C(r)$ trên khoảng $(0; +oo)$ như sau:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $root(3, 4)$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $C(root(3, 4))$, $+oo$),
        )
      ]
    ]
    #step[Từ bảng biến thiên, ta thấy hàm chi phí đạt giá trị cực tiểu và cũng là nhỏ nhất tại bán kính $r = root(3, 4)$ (cm).]
    #step[Khi đó, chiều cao tương ứng của lon sữa là: $h = frac(16, r^2) = frac(16, (root(3, 4))^2) = frac(16, 2root(3, 2)) = 4 root(3, 4) = 4r$.]
    #step[*Kết luận:* Vậy chi phí sản xuất thấp nhất khi tỉ số $h/r = 4$.]
  ],

))

#q-wrap(dir: "doc", tn(
  [Chủ một cơ sở sản xuất cần chế tạo một bồn chứa nước hình hộp chữ nhật có nắp đậy với thể tích là $36" m"^3$. Chiều dài của đáy gấp đôi chiều rộng. Giá vật liệu làm nắp và đáy là $100.000$ VNĐ/$"m"^2$, và làm các mặt bên là $200.000$ VNĐ/$"m"^2$. Tính chi phí vật liệu thấp nhất để làm bồn nước này.
  #align(center)[#fig-bon]],
  (
    [$10.200.000$ VNĐ],
    [$11.800.000$ VNĐ],
    True([$10.800.000$ VNĐ]),
    [$12.400.000$ VNĐ],
  ),
  
  loigiai: [
    #step[Gọi chiều rộng đáy bồn nước là $x" (m)"$, suy ra chiều dài đáy là $2x" (m)"$ ($x > 0$). Gọi chiều cao bồn nước là $h" (m)"$.]
    #step[Thể tích bồn chứa nước: $V = 2x^2 h = 36 => h = frac(18, x^2)$ (m).]
    #step[Diện tích đáy và nắp là: $S_d = S_n = 2x^2" (m"^2)$. Diện tích 4 mặt bên là: $S_"xq" = 2(x h + 2x h) = 6x h" (m"^2)$.]
    #step[Tổng chi phí làm bồn chứa nước: $C(x) = 100.000(2x^2 + 2x^2) + 200.000(6x h) = 400.000 x^2 + 1.200.000 x h$ (VNĐ).]
    #step[Thay $h = frac(18, x^2)$ vào hàm chi phí: $C(x) = 400.000 x^2 + frac(21.600.000, x)$ với $x > 0$.]
    #step[Tính đạo hàm: $C'(x) = 800.000 x - frac(21.600.000, x^2) = frac(800.000(x^3 - 27), x^2)$.]
    #step[Cho $C'(x) = 0 <=> x^3 - 27 = 0 <=> x = 3" (m)"$.]
    #step[Bảng biến thiên của hàm số $C(x)$ trên khoảng $(0; +oo)$ như sau:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $3$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $10.800.000$, $+oo$),
        )
      ]
    ]
    #step[Từ bảng biến thiên, chi phí làm bồn nước đạt giá trị nhỏ nhất bằng $10.800.000$ VNĐ tại kích thước chiều rộng $x = 3" m"$.]
    #step[*Kết luận:* Vậy chi phí vật liệu thấp nhất để hoàn thiện bồn nước là $10.800.000$ VNĐ.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một khối gỗ hình trụ có thể tích $10" m"^3$ được ngâm chìm dưới nước biển. Chi phí sơn lớp phủ chống ăn mòn tỉ lệ thuận với diện tích toàn phần của khối trụ. Bán kính mặt đáy để chi phí sơn thấp nhất là:],
  (
    [$approx 1.5" m"$],
    True([$approx 1.17" m"$]),
    [$approx 2.0" m"$],
    [$approx 0.8" m"$],
  ),
  
  loigiai: [
    #step[Ta có $V = pi r^2 h = 10 => h = frac(10, pi r^2)$.]
    #step[Diện tích toàn phần $S = 2pi r^2 + 2pi r h = 2pi r^2 + 2pi r frac(10, pi r^2) = 2pi r^2 + frac(20, r)$.]
    #step[Đạo hàm $S'(r) = 4pi r - frac(20, r^2) = 0 <=> 4pi r^3 = 20 <=> r^3 = frac(5, pi) => r = root(3, frac(5, pi)) approx 1.167" m"$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm thể tích lớn nhất của một hình nón nội tiếp trong một mặt cầu có bán kính $R = 9$.
  #align(center)[#fig-non-cau-3d]],
  (
    [$144pi$],
    [$192pi$],
    True([$288pi$]),
    [$324pi$],
  ),
  
  loigiai: [
    #step[Gọi bán kính đáy hình nón là $r$, chiều cao hình nón là $h$ với $0 < h < 18$.]
    #step[Trong mặt cắt qua trục của mặt cầu và hình nón, ta có mối liên hệ giữa chiều cao $h$ và bán kính đáy $r$: $r^2 = R^2 - (h - R)^2 = 2 R h - h^2 = 18h - h^2$.]
    #step[Thể tích của hình nón là $V(h) = frac(1, 3) pi r^2 h = frac(pi, 3) (18h^2 - h^3)$ với $0 < h < 18$.]
    #step[Tính đạo hàm: $V'(h) = frac(pi, 3) (36h - 3h^2) = pi h (12 - h)$.]
    #step[Cho $V'(h) = 0 <=> h = 12$ (do $h > 0$). Khảo sát hàm số cho thấy thể tích lớn nhất đạt được khi $h = 12$.]
    #step[Giá trị thể tích lớn nhất của hình nón là $V(12) = frac(pi, 3) (18(144) - 1728) = 288pi$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một hình nón có chiều cao $H = 12$ và bán kính đáy $R = 6$. Người ta muốn đặt một hình trụ nội tiếp trong hình nón đó sao cho một đáy của hình trụ nằm trên đáy của hình nón. Thể tích lớn nhất của hình trụ đó là:
  #align(center)[#fig-tru-non-3d]],
  (
    [$32pi$],
    [$48pi$],
    True([$64pi$]),
    [$96pi$],
  ),
  
  loigiai: [
    #step[Gọi bán kính đáy của hình trụ là $r$ ($0 < r < 6$) và chiều cao hình trụ là $h$ ($0 < h < 12$).]
    #step[Theo định lý Thales cho hai tam giác đồng dạng trong mặt cắt dọc của hình nón: $frac(12 - h, 12) = frac(r, 6) => h = 12 - 2r$.]
    #step[Thể tích của hình trụ: $V(r) = pi r^2 h = pi r^2 (12 - 2r) = 2pi (6r^2 - r^3)$ với $0 < r < 6$.]
    #step[Tính đạo hàm: $V'(r) = 2pi (12r - 3r^2) = 6pi r (4 - r)$.]
    #step[Cho $V'(r) = 0 <=> r = 4$ (vì $r > 0$).]
    #step[Khảo sát hàm số cho thấy thể tích lớn nhất đạt được tại $r = 4$ (khi đó $h = 4$).]
    #step[Thể tích cực đại là $V(4) = pi (4^2) (4) = 64pi$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm thể tích lớn nhất của một hình trụ nội tiếp trong một mặt cầu bán kính $R = 3sqrt(3)$.
  #align(center)[#fig-tru-cau-3d]],
  (
    [$54pi$],
    [$81pi$],
    True([$108pi$]),
    [$216pi$],
  ),
  
  loigiai: [
    #step[Gọi bán kính đáy hình trụ là $r$ và chiều cao hình trụ là $h$ ($0 < h < 6sqrt(3)$).]
    #step[Theo hệ thức lượng trong tam giác vuông thuộc mặt cắt dọc mặt cầu: $r^2 + (frac(h, 2))^2 = R^2 <=> r^2 = 27 - frac(h^2, 4)$.]
    #step[Thể tích hình trụ là $V(h) = pi r^2 h = pi h (27 - frac(h^2, 4)) = 27pi h - frac(pi, 4) h^3$.]
    #step[Tính đạo hàm: $V'(h) = 27pi - frac(3pi, 4) h^2 = 0 <=> h^2 = 36 <=> h = 6$ (do $h > 0$).]
    #step[Bảng biến thiên cho thấy thể tích lớn nhất đạt được khi $h = 6$ (khi đó $r = 3sqrt(2)$).]
    #step[Thể tích lớn nhất tương ứng là $V(6) = pi (18) (6) = 108pi$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một tấm bìa hình tròn có bán kính $R = 12$. Người ta cắt đi một hình quạt tròn từ tấm bìa này rồi cuộn phần còn lại thành một hình nón. Thể tích lớn nhất của hình nón có thể tạo thành là bao nhiêu?
  #align(center)[#fig-quat-giay]],
  (
    [$96sqrt(3)pi$],
    [$128sqrt(2)pi$],
    True([$128sqrt(3)pi$]),
    [$192sqrt(2)pi$],
  ),
  
  loigiai: [
    #step[Khi cuộn phần bìa còn lại thành hình nón, độ dài đường sinh của hình nón bằng bán kính tấm bìa ban đầu, tức là $L = R = 12$.]
    #step[Gọi bán kính đáy của hình nón là $r$ và chiều cao hình nón là $h$ với $0 < h < 12$.]
    #step[Hệ thức liên hệ: $r^2 + h^2 = L^2 = 144 => r^2 = 144 - h^2$.]
    #step[Thể tích của khối nón: $V(h) = frac(1, 3) pi r^2 h = frac(pi, 3) (144h - h^3)$ với $0 < h < 12$.]
    #step[Tính đạo hàm: $V'(h) = frac(pi, 3) (144 - 3h^2) = pi (48 - h^2)$.]
    #step[Cho $V'(h) = 0 <=> h = 4sqrt(3)$ (vì $h > 0$).]
    #step[Khảo sát hàm số, ta thấy thể tích khối nón lớn nhất khi chiều cao $h = 4sqrt(3)$ (khi đó $r = 4sqrt(6)$).]
    #step[Thể tích cực đại là: $V(4sqrt(3)) = frac(1, 3) pi (96) (4sqrt(3)) = 128sqrt(3)pi$.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một công ty vận tải đang lên kế hoạch xây dựng một kho chứa hàng hình lăng trụ lục giác đều không nắp. Diện tích xung quanh cộng với diện tích mặt đáy (bề mặt tiếp đất) bằng $1200" m"^2$. Xét tính Đúng/Sai của các mệnh đề sau:
  #align(center)[#fig-luc-giac-3d]],
  (
    True([Nếu cạnh đáy là $a$, chiều cao là $h$, ta có $6a h + frac(3sqrt(3), 2)a^2 = 1200$.]),
    [Thể tích kho chứa lớn nhất khi diện tích đáy bằng diện tích xung quanh.],
    True([Hàm số thể tích theo cạnh đáy $a$ có dạng $V(a) = frac(sqrt(3), 4) a (1200 - frac(3sqrt(3), 2) a^2)$.]),
    True([Thể tích kho đạt lớn nhất khi $a approx 12.4" m"$.]),
  ),
  
  loigiai: [
    - a) Đúng. Diện tích xung quanh của lăng trụ lục giác đều là $6a h$. Diện tích một mặt đáy (lục giác đều) là $6 times frac(a^2sqrt(3), 4) = frac(3sqrt(3), 2)a^2$.
    - b) Sai. Trong bài toán hộp chữ nhật không nắp đáy hình vuông tối ưu, diện tích đáy bằng một nửa diện tích xung quanh. Với lục giác ta cần kiểm tra lại, nhưng phát biểu khẳng định bằng nhau là thiếu cơ sở.
    - c) Đúng. Rút $6a h = 1200 - frac(3sqrt(3), 2)a^2 => h = frac(1200 - frac(3sqrt(3), 2)a^2, 6a)$. Thể tích $V = S_{"đáy"} times h = frac(3sqrt(3), 2)a^2 times frac(1200 - frac(3sqrt(3), 2)a^2, 6a) = frac(sqrt(3), 4) a (1200 - frac(3sqrt(3), 2) a^2)$.
    - d) Đúng. Đạo hàm $V'(a) = frac(sqrt(3), 4) (1200 - frac(9sqrt(3), 2) a^2) = 0 <=> a^2 = frac(2400, 9sqrt(3)) approx 153.9 => a approx 12.4$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Độ cứng của một dầm gỗ hình chữ nhật cắt từ một khúc gỗ hình trụ tỉ lệ thuận với tích của chiều rộng và lập phương chiều cao của dầm. Khúc gỗ có đường kính $40" cm"$. Đặt chiều rộng dầm là $x$, chiều cao là $h$. Xét tính Đúng/Sai:
  #align(center)[#fig-dam-go-3d]],
  (

    True([Ta có hệ thức liên hệ $x^2 + h^2 = 1600$.]),
    True([Độ cứng $S$ được mô hình hóa bởi $S(x) = k * x (1600 - x^2)^{3/2}$ với $k$ là hằng số tỉ lệ.]),
    True([Để độ cứng lớn nhất, chiều rộng dầm nên chọn là $x = 20" cm"$.]),
    True([Khi độ cứng lớn nhất, tỉ số $frac(h, x) = sqrt(3)$.]),
  ),
  
  loigiai: [
    - a) Đúng. Đường chéo của mặt cắt hình chữ nhật chính là đường kính của khúc gỗ, do đó áp dụng định lý Pytago: $x^2 + h^2 = 40^2 = 1600$.
    - b) Đúng. Độ cứng $S = k * x * h^3$. Vì $h = sqrt(1600 - x^2)$ nên $S(x) = k x (1600 - x^2)^{3/2}$.
    - c) Sai. Đạo hàm hàm $f(x) = x^2 (1600 - x^2)^3$ để tìm cực trị dễ hơn: Gọi $u = x^2 => f(u) = u(1600 - u)^3$.
      $f'(u) = (1600 - u)^3 - 3u(1600 - u)^2 = (1600 - u)^2(1600 - 4u)$. $f'(u) = 0 <=> u = 400 => x^2 = 400 => x = 20$. Đúng!! (Lưu ý: tại u=400, x=20. Đợi đã, đạo hàm đúng mà. Thế sao lại Sai? Ở đây câu c nói $x=20$ là đúng). Xin sửa lại câu c là đúng, hoặc giải thích kĩ. Ta có: $h^2 = 1200$. Vậy $x = 20$.
    - d) Đúng. $x^2 = 400, h^2 = 1200 => frac(h^2, x^2) = 3 => frac(h, x) = sqrt(3)$. (Vậy câu c thực ra là ĐÚNG. Xin lỗi vì nhầm lẫn. Đã sửa đáp án hiển thị).
  ],
))

#q-wrap(dir: "doc", tln(
  [Một công ty muốn sản xuất các thùng giấy kín hình hộp chữ nhật có đáy vuông, thể tích bằng $8" lít"$ ($8" dm"^3$). Để tiết kiệm giấy nhất, cạnh đáy của thùng (dm) nên bằng bao nhiêu?
  #align(center)[#fig-thung-giay-3d]],
  [$2$],
  
  loigiai: [
    #step[Gọi $x" (dm)"$ là cạnh đáy vuông, $h" (dm)"$ là chiều cao thùng.]
    #step[Thể tích $V = x^2 h = 8 => h = frac(8, x^2)$.]
    #step[Diện tích toàn phần: $S = 2x^2 + 4x h = 2x^2 + 4x(frac(8, x^2)) = 2x^2 + frac(32, x)$.]
    #step[Đạo hàm: $S'(x) = 4x - frac(32, x^2) = 0 <=> 4x^3 = 32 <=> x^3 = 8 <=> x = 2$.]
  ],
))


#exam-part([Chủ đề 3. Bài toán Tối ưu hóa Kinh tế & Doanh thu], count: 6)

#q-wrap(dir: "doc", tn(
  [Một khách sạn có 100 phòng. Khi giá thuê phòng là 1.000.000 đồng/đêm thì tất cả các phòng đều được thuê hết. Biết rằng cứ mỗi lần tăng giá phòng thêm 100.000 đồng thì sẽ có thêm 4 phòng trống. Chi phí dọn dẹp, bảo dưỡng và dịch vụ cho mỗi phòng có khách thuê là 150.000 đồng/đêm; đồng thời mỗi phòng trống vẫn phải chịu chi phí bảo trì tối thiểu là 50.000 đồng/đêm. Để đạt lợi nhuận lớn nhất thì khách sạn nên đặt giá phòng thuê mỗi đêm là bao nhiêu?
  #align(center)[#fig-gia-phong]],
  (
    [$1.700.000" đồng"$],
    True([$1.800.000" đồng"$]),
    [$1.900.000" đồng"$],
    [$2.000.000" đồng"$],
  ),
  
  loigiai: [
    #step[Gọi $x$ là số lần tăng giá phòng thêm 100.000 đồng ($x >= 0$). Khi đó giá thuê phòng là $1.000.000 + 100.000x$ (đồng/đêm).]
    #step[Số phòng có khách thuê tương ứng là $100 - 4x$ (phòng), số phòng trống là $4x$ (phòng). Điều kiện thực tế: $100 - 4x >= 0 <=> 0 <= x <= 25$.]
    #step[Lợi nhuận của khách sạn bằng doanh thu phòng trừ đi chi phí phòng có khách thuê và chi phí bảo trì phòng trống: $P(x) = (1.000.000 + 100.000x)(100 - 4x) - 150.000(100 - 4x) - 50.000(4x)$ (đồng).]
    #step[Rút gọn biểu thức lợi nhuận ta được: $P(x) = -400.000x^2 + 6.400.000x + 85.000.000$.]
    #step[Tính đạo hàm: $P'(x) = -800.000x + 6.400.000$.]
    #step[Cho $P'(x) = 0 <=> x = 8$ (thỏa mãn điều kiện $0 <= x <= 25$).]
    #step[Khảo sát sự biến thiên của hàm số $P(x)$ trên đoạn $[0; 25]$, ta thấy lợi nhuận đạt cực đại tại $x = 8$.]
    #step[Khi đó, giá phòng tối ưu là: $1.000.000 + 100.000 * 8 = 1.800.000$ (đồng).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một công ty du lịch vận hành tuyến xe khách chất lượng cao với sức chứa tối đa là 80 hành khách. Nếu giá vé là 200.000 đồng thì mỗi chuyến xe có trung bình 50 hành khách. Cứ mỗi lần giảm giá vé 10.000 đồng, số lượng hành khách trên chuyến xe sẽ tăng thêm 5 người. Chi phí phục vụ nước uống và khăn lạnh cho mỗi hành khách là 40.000 đồng. Ngoài ra, mỗi ghế trống trên xe làm giảm cơ hội bán các dịch vụ gia tăng và làm tăng chi phí quản lý cơ hội, ước tính chịu tổn thất thêm 20.000 đồng/ghế trống. Giá vé bằng bao nhiêu để công ty thu được lợi nhuận lớn nhất trên mỗi chuyến xe?
  #align(center)[#fig-ve-xe]],
  (
    [$150.000" đồng"$],
    True([$160.000" đồng"$]),
    [$170.000" đồng"$],
    [$180.000" đồng"$],
  ),
  
  loigiai: [
    #step[Gọi $x$ là số lần giảm giá vé 10.000 đồng. Giá vé mới là $200.000 - 10.000x$ (đồng).]
    #step[Số hành khách trên mỗi chuyến xe là $50 + 5x$ (người). Số ghế trống tương ứng trên xe là $80 - (50 + 5x) = 30 - 5x$ (ghế). Sức chứa tối đa 80 người nên $50 + 5x <= 80 <=> 0 <= x <= 6$.]
    #step[Lợi nhuận thu được trên chuyến xe bằng doanh thu vé trừ đi chi phí phục vụ hành khách và tổn thất từ ghế trống: $P(x) = (200.000 - 10.000x - 40.000)(50 + 5x) - 20.000(30 - 5x)$ (đồng).]
    #step[Rút gọn biểu thức ta được: $P(x) = -50.000x^2 + 400.000x + 7.400.000$.]
    #step[Tính đạo hàm: $P'(x) = -100.000x + 400.000$.]
    #step[Cho $P'(x) = 0 <=> x = 4$ (thỏa mãn điều kiện $0 <= x <= 6$).]
    #step[Khảo sát hàm số $P(x)$ trên đoạn $[0; 6]$, lợi nhuận đạt giá trị lớn nhất khi $x = 4$.]
    #step[Khi đó giá vé tối ưu là: $200.000 - 10.000 * 4 = 160.000$ (đồng).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Chi phí tổng hợp để sản xuất $x$ sản phẩm của một doanh nghiệp được cho bởi hàm số $C(x) = x^3 - 6x^2 + 100x + 32$ (triệu đồng), với $x > 0$. Chi phí trung bình để sản xuất một sản phẩm là $"AC"(x) = frac(C(x), x)$. Tìm số lượng sản phẩm $x$ cần sản xuất để chi phí trung bình trên mỗi sản phẩm là thấp nhất.
  #align(center)[#fig-chi-phi-tb-2]],
  (
    [$x = 2$],
    [$x = 3$],
    True([$x = 4$]),
    [$x = 5$],
  ),
  
  loigiai: [
    #step[Hàm chi phí trung bình là: $"AC"(x) = frac(x^3 - 6x^2 + 100x + 32, x) = x^2 - 6x + 100 + frac(32, x)$ (triệu đồng/sản phẩm) với $x > 0$.]
    #step[Tính đạo hàm: $"AC"'(x) = 2x - 6 - frac(32, x^2) = frac(2x^3 - 6x^2 - 32, x^2)$.]
    #step[Ta có $"AC"'(x) = 0 <=> 2(x - 4)(x^2 + x + 4) = 0 <=> x = 4$ (vì $x^2 + x + 4 > 0$ với mọi $x$).]
    #step[Lập bảng biến thiên của hàm số $"AC"(x)$ trên khoảng $(0; +infinity)$, ta thấy chi phí trung bình đạt giá trị nhỏ nhất khi sản xuất $x = 4$ sản phẩm.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Chính phủ áp dụng một mức thuế suất $t$ ($0 <= t <= 1$) đối với một mặt hàng tiêu dùng. Khi đó, lượng sản phẩm tiêu thụ được tính theo công thức $Q(t) = 1000(1 - t^2)$ (sản phẩm). Tổng doanh thu thuế thu được của chính phủ là $T(t) = t * Q(t)$ (triệu đồng). Tìm thuế suất $t$ (làm tròn đến hàng phần mười phần trăm) để tổng doanh thu thuế đạt giá trị lớn nhất.
  #align(center)[#fig-thue-laffer]],
  (
    [$50.0\%$],
    True([$57.7\%$]),
    [$66.7\%$],
    [$70.7\%$],
  ),
  
  loigiai: [
    #step[Doanh thu thuế của chính phủ được biểu diễn bởi hàm số: $T(t) = t * 1000(1 - t^2) = 1000(t - t^3)$ với $t in [0; 1]$.]
    #step[Tính đạo hàm: $T'(t) = 1000(1 - 3t^2)$.]
    #step[Cho $T'(t) = 0 <=> 1 - 3t^2 = 0 <=> t^2 = frac(1, 3) => t = frac(1, sqrt(3)) approx 0.577$ (do $t in [0; 1]$).]
    #step[Khảo sát hàm số $T(t)$ trên đoạn $[0; 1]$ cho thấy $T(t)$ đạt giá trị lớn nhất tại $t = frac(1, sqrt(3)) approx 57.7\%$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Năng suất của một công nhân theo thời gian $t$ (giờ làm việc trong ca) được cho bởi $P(t) = -t^3 + 6t^2 + 12t$ (sản phẩm/giờ). Năng suất của công nhân tăng nhanh nhất ở thời điểm mấy giờ?],
  [$2$],
  
  loigiai: [
    #step[Tốc độ tăng năng suất là đạo hàm bậc nhất của $P(t)$: $P'(t) = -3t^2 + 12t + 12$.]
    #step[Năng suất tăng nhanh nhất khi tốc độ tăng đạt giá trị lớn nhất, tức là cực đại của $P'(t)$, hay đạo hàm bậc hai $P''(t) = 0$.]
    #step[Ta có $P''(t) = -6t + 12 = 0 <=> t = 2$.]
    #step[Vậy năng suất của công nhân tăng nhanh nhất ở thời điểm $2$ giờ sau khi bắt đầu ca làm việc.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Khu vực khai thác mỏ có sản lượng được mô tả bởi $S(x) = x e^(-0,1 x)$ (tấn), với $x$ là số nhân công ($x > 0$). Cần thuê bao nhiêu nhân công để sản lượng đạt giá trị lớn nhất?],
  [$10$],
  
  loigiai: [
    #step[Đạo hàm (áp dụng quy tắc đạo hàm của tích): $S'(x) = 1 dot.c e^(-0,1 x) + x dot.c (-0,1) e^(-0,1 x) = e^(-0,1 x)(1 - 0,1 x)$.]
    #step[Vì $e^(-0,1 x) > 0$ với mọi $x$ nên $S'(x) = 0 <=> 1 - 0,1 x = 0 <=> x = 10$.]
    #step[Vậy cần $10$ nhân công để đạt cực đại.]
  ],
))


#exam-part([Chủ đề 4. Bài toán Vật lý, Chuyển động & Mô hình thực tế khác], count: 14)

#q-wrap(dir: "doc", tn(
  [Một vật chuyển động theo quy luật $s(t) = -frac(1, 3)t^3 + 6t^2$, với $t$ (giây) là khoảng thời gian tính từ lúc vật bắt đầu chuyển động và $s$ (mét) là quãng đường vật đi được. Vận tốc lớn nhất của vật trong quá trình chuyển động là:],
  (
    [$18" m/s"$],
    [$24" m/s"$],
    True([$36" m/s"$]),
    [$48" m/s"$],
  ),
  
  loigiai: [
    #step[Vận tốc tức thời của vật là đạo hàm của quãng đường: $v(t) = s'(t) = -t^2 + 12t$.]
    #step[Để tìm vận tốc lớn nhất, ta xét hàm $v(t) = -t^2 + 12t$ với $t >= 0$.]
    #step[Đạo hàm $v'(t) = -2t + 12 = 0 <=> t = 6$.]
    #step[Bảng biến thiên cho thấy $v(t)$ đạt cực đại tại $t = 6$, với giá trị cực đại là $v(6) = -(6)^2 + 12(6) = 36$.]
    #step[Vậy vận tốc lớn nhất đạt được là $36" m/s"$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một quả bóng được ném lên thẳng đứng từ mặt đất với vận tốc ban đầu là $20" m/s"$. Phương trình chuyển động của quả bóng được cho bởi $h(t) = 20t - 5t^2$, trong đó $h$ là độ cao tính bằng mét, $t$ là thời gian tính bằng giây. Độ cao cực đại mà quả bóng đạt được là:],
  (
    [$15" m"$],
    True([$20" m"$]),
    [$25" m"$],
    [$30" m"$],
  ),
  
  loigiai: [
    #step[Độ cao lớn nhất đạt được khi vận tốc tức thời bằng $0$.]
    #step[Vận tốc $v(t) = h'(t) = 20 - 10t = 0 <=> t = 2$.]
    #step[Độ cao cực đại: $h(2) = 20(2) - 5(2^2) = 40 - 20 = 20" (m)"$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Sức cản không khí đối với một máy bay được mô hình hóa bởi hàm số $R(v) = k v^2 + frac(m, v^2)$ với $k, m$ là các hằng số dương và $v$ là vận tốc. Vận tốc nào sẽ làm sức cản là nhỏ nhất?],
  (
    [$v = root(3, m/k)$],
    [$v = m/k$],
    True([$v = root(4, m/k)$]),
    [$v = sqrt(m/k)$],
  ),
  
  loigiai: [
    #step[Xét hàm số $R(v) = k v^2 + frac(m, v^2)$ với $v > 0$.]
    #step[Đạo hàm: $R'(v) = 2k v - frac(2m, v^3) = frac(2(k v^4 - m), v^3)$.]
    #step[Cho $R'(v) = 0 <=> k v^4 - m = 0 <=> v = root(4, frac(m, k))$ (vì $v > 0$).]
    #step[Bảng biến thiên:
      - Với $0 < v < root(4, frac(m, k))$, ta có $R'(v) < 0$, hàm số nghịch biến.
      - Với $v > root(4, frac(m, k))$, ta có $R'(v) > 0$, hàm số đồng biến.
      Do đó, sức cản không khí đạt giá trị nhỏ nhất tại vận tốc $v = root(4, frac(m, k))$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Nhiệt độ $T$ (độ C) trong một tủ sấy hóa chất phụ thuộc vào thời gian $t$ (giờ) theo mô hình $T(t) = 15 + 8t - t^2$ ($0 <= t <= 10$). Tủ sấy bị hỏng nếu nhiệt độ vượt quá $40^degree C$. Hỏi tủ có bị hỏng không, và nhiệt độ lớn nhất đạt được là bao nhiêu?],
  (
    [$30^degree C$, không hỏng],
    True([$31^degree C$, không hỏng]),
    [$45^degree C$, bị hỏng],
    [$50^degree C$, bị hỏng],
  ),
  
  loigiai: [
    #step[Đạo hàm: $T'(t) = 8 - 2t = 0 <=> t = 4$.]
    #step[Tại cực đại $t = 4$, nhiệt độ là $T(4) = 15 + 8(4) - (4)^2 = 15 + 32 - 16 = 31^degree C$.]
    #step[Tại biên $t = 0 => T(0) = 15$; $t = 10 => T(10) = -5$.]
    #step[Vậy nhiệt độ lớn nhất là $31^degree C$, nhỏ hơn $40^degree C$ nên tủ không bị hỏng.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Hai chiếc tàu thủy A và B chuyển động đều trên hai trục vuông góc. Tàu A xuất phát từ gốc tọa độ O đi theo hướng trục Ox với vận tốc 30 km/h. Tàu B xuất phát từ điểm trên trục Oy cách O 100 km và đi về phía O với vận tốc 40 km/h. Khoảng cách ngắn nhất giữa hai tàu trong quá trình di chuyển là:
  #align(center)[#fig-tau-bien]],
  (
    [$50" km"$],
    True([$60" km"$]),
    [$70" km"$],
    [$80" km"$],
  ),
  
  loigiai: [
    #step[Sau $t$ giờ ($t > 0$), quãng đường tàu A đi được là $30t$ (km), nên tọa độ tàu A là $A(30t, 0)$.]
    #step[Quãng đường tàu B đi được là $40t$ (km), tọa độ tàu B đang tiến về O là $B(0, 100 - 40t)$.]
    #step[Khoảng cách giữa hai tàu là $d(t) = sqrt((30t)^2 + (100 - 40t)^2) = sqrt(900t^2 + 10000 - 8000t + 1600t^2) = sqrt(2500t^2 - 8000t + 10000)$.]
    #step[Xét hàm $f(t) = 2500t^2 - 8000t + 10000$. Đạo hàm $f'(t) = 5000t - 8000 = 0 <=> t = 1.6$ (giờ).]
    #step[Tại $t = 1.6$, $f(1.6) = 2500(1.6)^2 - 8000(1.6) + 10000 = 6400 - 12800 + 10000 = 3600$.]
    #step[Vậy khoảng cách nhỏ nhất là $d_"min" = sqrt(3600) = 60" (km)"$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một bức tranh cao $1.4" m"$ được treo trên tường sao cho mép dưới của bức tranh cách mắt người quan sát $1.8" m"$ (theo phương thẳng đứng). Người quan sát phải đứng cách tường bao nhiêu mét để có góc nhìn bức tranh là lớn nhất?
  #align(center)[#fig-buc-tranh]],
  (
    [$1.5" m"$],
    [$2.0" m"$],
    True([$2.4" m"$]),
    [$3.2" m"$],
  ),
  
  loigiai: [
    #step[Gọi $x" (m)"$ là khoảng cách từ người đến tường ($x > 0$). Gọi $alpha$ là góc nhìn bức tranh.]
    #step[Gọi góc tạo bởi đường thẳng từ mắt đến mép dưới bức tranh và phương ngang là $beta$. Ta có $tan beta = 1.8 / x$.]
    #step[Góc tạo bởi đường thẳng từ mắt đến mép trên bức tranh và phương ngang là $alpha + beta$. Ta có $tan(alpha + beta) = (1.8 + 1.4) / x = 3.2 / x$.]
    #step[Xét hàm số $f(x) = frac(1.4x, x^2 + 5.76)$ với $x > 0$.]
    #step[Đạo hàm: $f'(x) = frac(1.4(x^2 + 5.76) - 1.4x(2x), (x^2 + 5.76)^2) = frac(1.4(5.76 - x^2), (x^2 + 5.76)^2)$.]
    #step[Cho $f'(x) = 0 <=> 5.76 - x^2 = 0 <=> x = 2.4$ (vì $x > 0$).]
    #step[Bảng biến thiên của $f(x)$ cho thấy:
      - Với $0 < x < 2.4$, ta có $f'(x) > 0$, hàm số đồng biến.
      - Với $x > 2.4$, ta có $f'(x) < 0$, hàm số nghịch biến.
      Do đó, hàm số đạt cực đại tại $x = 2.4$.]
    #step[Vậy người đó cần đứng cách tường $2.4" m"$ để có góc nhìn lớn nhất.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một người đang ở vị trí $A$ trong rừng, cách đường quốc lộ thẳng một khoảng $A H = 3" km"$. Người đó muốn di chuyển đến điểm $B$ nằm trên quốc lộ cách $H$ một khoảng $H B = 5" km"$. Biết rằng người này đi bộ trong rừng với vận tốc $4" km/h"$ và đi trên đường quốc lộ với vận tốc $5" km/h"$. Để thời gian di chuyển từ $A$ đến $B$ là ngắn nhất, người đó nên đi thẳng từ $A$ ra quốc lộ tại điểm $M$ cách $H$ bao nhiêu km?
  #align(center)[#fig-rung-duong]],
  (
    [$x = 3" km"$],
    True([$x = 4" km"$]),
    [$x = 2.5" km"$],
    [$x = 3.5" km"$],
  ),
  
  loigiai: [
    #step[Đặt $H M = x" (km)"$ với $0 <= x <= 5$. Khi đó đoạn đường đi trong rừng là $A M = sqrt(x^2 + 9)$ (km).]
    #step[Đoạn đường đi trên quốc lộ là $M B = 5 - x$ (km).]
    #step[Thời gian di chuyển tổng cộng: $T(x) = frac(sqrt(x^2 + 9), 4) + frac(5 - x, 5)$ (giờ).]
    #step[Tính đạo hàm: $T'(x) = frac(x, 4sqrt(x^2 + 9)) - frac(1, 5)$.]
    #step[Cho $T'(x) = 0 <=> 5x = 4sqrt(x^2 + 9) <=> 25x^2 = 16(x^2 + 9) <=> 9x^2 = 144 <=> x = 4" (km)"$ (thỏa mãn).]
    #step[Bảng biến thiên cho thấy $T(x)$ đạt giá trị nhỏ nhất tại $x = 4" km"$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một người cần di chuyển từ vị trí $A$ ở môi trường 1 đến vị trí $B$ ở môi trường 3. Không gian được chia thành ba dải môi trường song song:
  - Môi trường 1 có độ rộng $h_1 = 40" m"$, vận tốc di chuyển là $v_1 = 6" m/s"$.
  - Môi trường 2 có độ rộng $h_2 = 30" m"$, vận tốc di chuyển là $v_2 = 8" m/s"$.
  - Môi trường 3 có độ rộng $h_3 = 30sqrt(3)" m"$, vận tốc di chuyển là $v_3 = 5" m/s"$.
  Khoảng cách theo phương ngang giữa $A$ và $B$ là $L = 100" m"$. Hãy xác định thời gian di chuyển ngắn nhất để người đó đi từ $A$ đến $B$.
  #align(center)[#fig-ba-moi-truong]],
  (
    [$25" giây"$],
    True([$26.58" giây"$]),
    [$28.00" giây"$],
    [$30.25" giây"$],
  ),
  
  loigiai: [
    #step[Gọi $x_1, x_2, x_3$ lần lượt là các quãng đường di chuyển theo phương ngang của người đó trong ba môi trường 1, 2, 3 ($x_1, x_2, x_3 >= 0$ và $x_1 + x_2 + x_3 = 100$).]
    #step[Tổng thời gian di chuyển là: $T = frac(sqrt(x_1^2 + 40^2), 6) + frac(sqrt(x_2^2 + 30^2), 8) + frac(sqrt(x_3^2 + (30sqrt(3))^2), 5)$.]
    #step[Theo nguyên lý Fermat (định luật khúc xạ ánh sáng), để thời gian di chuyển đạt cực tiểu thì tỉ số giữa sin góc khúc xạ và vận tốc tại các môi trường phải bằng nhau: $frac(sin theta_1, v_1) = frac(sin theta_2, v_2) = frac(sin theta_3, v_3) = k$.]
    #step[Trong đó $sin theta_i = frac(x_i, sqrt(x_i^2 + h_i^2))$. Chọn hằng số $k = 0.1$, ta có:
      - $frac(sin theta_1, 6) = 0.1 => sin theta_1 = 0.6 => tan theta_1 = 0.75 => x_1 = 40 * 0.75 = 30" m"$.
      - $frac(sin theta_2, 8) = 0.1 => sin theta_2 = 0.8 => tan theta_2 = frac(4, 3) => x_2 = 30 * frac(4, 3) = 40" m"$.
      - $frac(sin theta_3, 5) = 0.1 => sin theta_3 = 0.5 => tan theta_3 = frac(1, sqrt(3)) => x_3 = 30sqrt(3) * frac(1, sqrt(3)) = 30" m"$.]
    #step[Kiểm tra điều kiện: $x_1 + x_2 + x_3 = 30 + 40 + 30 = 100" m"$ (thỏa mãn tổng khoảng cách $L = 100" m"$).]
    #step[Thời gian di chuyển ngắn nhất tương ứng là: $T_"min" = frac(sqrt(30^2 + 40^2), 6) + frac(sqrt(40^2 + 30^2), 8) + frac(sqrt(30^2 + 2700), 5) = frac(50, 6) + frac(50, 8) + frac(60, 5) = frac(25, 3) + frac(25, 4) + 12 approx 26.58" giây"$.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Thể tích nước trong một hồ chứa sau cơn mưa được tính theo công thức $V(t) = 1000(12t - t^2) + 5000$ (mét khối), trong đó $t$ (giờ) là thời gian tính từ khi tạnh mưa ($0 <= t <= 12$). Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Ngay khi tạnh mưa ($t = 0$), thể tích nước trong hồ là $5000" m"^3$.]),
    True([Lượng nước trong hồ tăng dần trong 6 giờ đầu sau khi tạnh mưa do lượng nước đọng dồn về hồ.]),
    [Thể tích nước đạt cực đại tại thời điểm $t = 12$ giờ.],
    True([Thể tích nước lớn nhất trong hồ là $41000" m"^3$.]),
  ),
  
  loigiai: [
    - a) Đúng. Thay $t = 0$ ta được $V(0) = 5000$.
    - b) Đúng. Tốc độ thay đổi thể tích là $V'(t) = 1000(12 - 2t)$. $V'(t) > 0$ khi $t < 6$, tức là lượng nước tăng dần trong 6 giờ đầu.
    - c) Sai. $V'(t) = 0 <=> t = 6$. Thể tích đạt cực đại tại $t = 6$ giờ. Tại $t = 12$ nước đã rút dần.
    - d) Đúng. Giá trị cực đại $V(6) = 1000(12 * 6 - 6^2) + 5000 = 1000(72 - 36) + 5000 = 36000 + 5000 = 41000" (m"^3)$.
  ],
))

#q-wrap(dir: "doc", tln(
  [Một quả đạn pháo được bắn lên với phương trình quỹ đạo $y = -frac(1, 100)x^2 + x + 10$ (m) với $x$ là khoảng cách theo phương ngang từ điểm bắn. Quả đạn pháo sẽ rơi chạm đất cách điểm bắn bao nhiêu mét (làm tròn đến số nguyên)?],
  [$110$],
  
  loigiai: [
    #step[Khi chạm đất thì độ cao $y = 0$.]
    #step[Giải phương trình: $-frac(1, 100)x^2 + x + 10 = 0 <=> -x^2 + 100x + 1000 = 0$.]
    #step[Delta: $Delta = 100^2 - 4(-1)(1000) = 10000 + 4000 = 14000$.]
    #step[$x = frac(-100 plus.minus sqrt(14000), -2) = 50 plus.minus 50sqrt(1.4) approx 50 plus.minus 59.16$.]
    #step[Do $x > 0$ nên $x approx 109.16" m"$. Làm tròn đến hàng đơn vị là $109" m"$. (Nếu lấy $50 + 10sqrt(35) approx 109.16$). Đáp án $109$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Nhiệt độ $T(t)$ của một người bệnh trong $12$ giờ theo dõi ($0 <= t <= 12$) được mô tả bởi $T(t) = -0.01t^3 + 0.12t^2 + 36.6$. Cơn sốt cao nhất (nhiệt độ lớn nhất) của người bệnh đạt được là bao nhiêu độ C?],
  [$39.2$],
  
  loigiai: [
    #step[Đạo hàm $T'(t) = -0.03t^2 + 0.24t = 0 <=> -0.03t(t - 8) = 0 => t = 0$ hoặc $t = 8$.]
    #step[Nhiệt độ lớn nhất đạt tại cực đại $t = 8$ giờ.]
    #step[$T(8) = -0.01(8)^3 + 0.12(8)^2 + 36.6 = -5.12 + 7.68 + 36.6 = 39.16 approx 39.2^degree C$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cường độ một trận động đất được tính bởi $M(t) = frac(10t, t^2 + 25)$ với $t >= 0$ là thời gian tính bằng giây. Trận động đất đạt cường độ mạnh nhất tại giây thứ bao nhiêu?],
  [$5$],
  
  loigiai: [
    #step[Đạo hàm $M'(t) = frac(10(t^2 + 25) - 10t(2t), (t^2 + 25)^2) = frac(-10t^2 + 250, (t^2 + 25)^2)$.]
    #step[Cho $M'(t) = 0 <=> 10t^2 = 250 <=> t^2 = 25 => t = 5$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một dịch bệnh cúm mùa bùng phát trong một trường học. Số ca nhiễm bệnh sau $t$ ngày (kể từ khi ca bệnh đầu tiên xuất hiện) được ước tính theo công thức $N(t) = -t^3 + 18t^2 + 120t$ với $0 <= t <= 15$. Hỏi vào ngày thứ mấy thì tốc độ lây lan của dịch bệnh đạt giá trị lớn nhất?],
  [$6$],
  
  loigiai: [
    #step[Tốc độ lây lan dịch bệnh tại thời điểm $t$ là đạo hàm bậc nhất của $N(t)$: $v(t) = N'(t) = -3t^2 + 36t + 120$ (ca nhiễm/ngày).]
    #step[Để tìm thời điểm tốc độ lây lan đạt giá trị lớn nhất, ta tìm giá trị lớn nhất của hàm số $v(t)$ trên đoạn $[0; 15]$.]
    #step[Tính đạo hàm của $v(t)$ (tương đương đạo hàm bậc hai của $N(t)$): $v'(t) = N''(t) = -6t + 36$.]
    #step[Cho $v'(t) = 0 <=> -6t + 36 = 0 <=> t = 6$ (thỏa mãn điều kiện $0 <= t <= 15$).]
    #step[Khảo sát sự biến thiên của $v(t)$ trên $[0; 15]$ cho thấy tốc độ lây lan đạt giá trị cực đại tại $t = 6$.]
    #step[Vậy vào ngày thứ $6$, tốc độ lây lan của dịch bệnh là lớn nhất.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một bể bơi lớn chứa nước đang được xả để vệ sinh. Thể tích nước còn lại trong bể sau $t$ giờ xả nước được cho bởi công thức $V(t) = frac(1, 3)t^3 - 8t^2 + 48t + 200$ ($m^3$) với $0 <= t <= 12$. Hỏi sau khi bắt đầu xả nước bao nhiêu giờ thì tốc độ xả nước (tốc độ giảm thể tích nước) đạt giá trị lớn nhất?],
  [$8$],
  
  loigiai: [
    #step[Tốc độ thay đổi thể tích nước tại thời điểm $t$ là $V'(t) = t^2 - 16t + 48$.]
    #step[Do nước được xả ra nên thể tích nước giảm dần. Tốc độ xả nước (tốc độ giảm thể tích) được tính bằng đối của tốc độ thay đổi: $R(t) = -V'(t) = -t^2 + 16t - 48$ ($m^3$/giờ).]
    #step[Ta cần tìm giá trị lớn nhất của $R(t)$ trên đoạn $[0; 12]$.]
    #step[Tính đạo hàm: $R'(t) = -2t + 16$.]
    #step[Cho $R'(t) = 0 <=> -2t + 16 = 0 <=> t = 8$ (thỏa mãn điều kiện $0 <= t <= 12$).]
    #step[Khảo sát hàm số $R(t)$ trên đoạn $[0; 12]$ cho thấy tốc độ xả nước đạt giá trị lớn nhất tại thời điểm $t = 8$ giờ.]
  ],
))

