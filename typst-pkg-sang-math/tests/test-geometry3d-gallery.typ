#set page(paper: "a4", margin: (x: 1.5cm, y: 1.5cm))
#set text(font: "New Computer Modern", size: 10pt)

#import "@preview/cetz:0.5.2"
#import "../lib.typ": *

#align(center)[
  #text(size: 16pt, weight: "bold", fill: blue.darken(30%))[
    BỘ THƯ VIỆN HÌNH HỌC 3D THUẬT TOÁN TỰ ĐỘNG CHO TYPST
  ]
  #v(2pt)
  #text(size: 11pt, style: "italic")[
    (TypDraw3D / CeTZ-3D Engine — Tương đương năng lực Luadraw của LuaLaTeX)
  ]
]

#v(10pt)

// ═══════════════════════════════════════════════════════════════
== 1. Tái hiện bài toán Chùm Đèn treo đa giác đều $n$ đỉnh (Facebook Post)
// ═══════════════════════════════════════════════════════════════
Mô hình chao đèn chỏm cầu cắt (`draw-cut-sphere`), treo từ đỉnh $S$ bởi $n$ sợi dây chịu các vector lực căng $arrow(F)_1, dots, arrow(F)_n$. Chỉ cần đổi tham số `n: 3, 4, 6`, toàn bộ hình học tự động thích ứng!

#v(8pt)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  align: center,
  [
    #text(weight: "bold")[Chùm đèn 3 dây ($n = 3$)]
    #v(4pt)
    #cetz.canvas(length: 0.85cm, {
      preset-chum-den(n: 3, R: 2.6, h-cut: 0.9, S-height: 4.2)
    })
  ],
  [
    #text(weight: "bold")[Chùm đèn 4 dây ($n = 4$)]
    #v(4pt)
    #cetz.canvas(length: 0.85cm, {
      preset-chum-den(n: 4, R: 2.6, h-cut: 0.9, S-height: 4.2)
    })
  ],
  [
    #text(weight: "bold")[Chùm đèn 6 dây ($n = 6$)]
    #v(4pt)
    #cetz.canvas(length: 0.85cm, {
      preset-chum-den(n: 6, R: 2.6, h-cut: 0.9, S-height: 4.2)
    })
  ]
)

#v(15pt)

// ═══════════════════════════════════════════════════════════════
== 2. Mặt cầu cắt bởi mặt phẳng góc $alpha$ tại tâm (Hình 1 Facebook Post)
// ═══════════════════════════════════════════════════════════════
Mặt cầu $(O, R)$ bị cắt bởi mặt phẳng $P$ tạo chỏm phẳng ở trên, hiển thị góc ở tâm $alpha = hat(A O B)$ và bán kính $O A$.

#v(8pt)

#align(center)[
  #cetz.canvas(length: 1.0cm, {
    preset-sphere-cut-alpha(R: 2.7, h-cut: 1.7)
  })
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════
== 3. Thuật toán Tự động Khử Nét Khuất (Back-face Culling cho Đa diện)
// ═══════════════════════════════════════════════════════════════
*Không bao giờ cần khai báo nét đứt thủ công!* Cùng một khối chóp tứ giác $S.A B C D$, khi xoay góc nhìn camera thì thuật toán tự động nhận diện cạnh nào bị che khuất để vẽ nét đứt (`dashed`), cạnh nào nhìn thấy để vẽ nét liền (`solid`).

#v(10pt)

#let pyra = make-pyramid-n(n: 4, radius: 2.5, height: 3.8, start-angle: 25deg)

#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,
  align: center,
  [
    #text(weight: "bold")[Góc nhìn 1: Phương vị $45^circle$, Góc ngẩng $22^circle$]
    #v(6pt)
    #cetz.canvas(length: 0.9cm, {
      let cam1 = make-camera(elevation: 22deg, azimuth: 45deg)
      draw-polyhedron(pyra, cam: cam1, fill-faces: blue.lighten(85%), draw-vertices: true)
      
      // Gán nhãn các đỉnh
      let pts2d = project-pts(pyra.vertices, cam1)
      cetz.draw.content((pts2d.at(0).at(0), pts2d.at(0).at(1) + 0.15), anchor: "south")[$S$]
      cetz.draw.content(pts2d.at(1), anchor: "north-west")[$A$]
      cetz.draw.content(pts2d.at(2), anchor: "north")[$B$]
      cetz.draw.content(pts2d.at(3), anchor: "west")[$C$]
      cetz.draw.content(pts2d.at(4), anchor: "south-east")[$D$]
    })
  ],
  [
    #text(weight: "bold")[Góc nhìn 2: Phương vị $140^circle$ (Xoay sang góc đối diện)]
    #v(6pt)
    #cetz.canvas(length: 0.9cm, {
      let cam2 = make-camera(elevation: 22deg, azimuth: 140deg)
      draw-polyhedron(pyra, cam: cam2, fill-faces: orange.lighten(85%), draw-vertices: true)
      
      // Gán nhãn các đỉnh
      let pts2d = project-pts(pyra.vertices, cam2)
      cetz.draw.content((pts2d.at(0).at(0), pts2d.at(0).at(1) + 0.15), anchor: "south")[$S$]
      cetz.draw.content(pts2d.at(1), anchor: "north")[$A$]
      cetz.draw.content(pts2d.at(2), anchor: "east")[$B$]
      cetz.draw.content(pts2d.at(3), anchor: "south")[$C$]
      cetz.draw.content(pts2d.at(4), anchor: "west")[$D$]
    })
  ]
)

#v(20pt)

// ═══════════════════════════════════════════════════════════════
== 4. Lăng trụ xiên & Ký hiệu góc vuông 3D tự biến dạng theo phép chiếu
// ═══════════════════════════════════════════════════════════════
Khối lăng trụ tam giác xiên $A B C.A' B' C'$ tự động khử nét khuất, kết hợp ký hiệu góc vuông không gian tự biến dạng thành hình bình hành phối cảnh chính xác toán học.

#v(10pt)

#align(center)[
  #cetz.canvas(length: 0.95cm, {
    let cam = make-camera(elevation: 25deg, azimuth: 50deg)
    
    // Đáy ABC
    let A = (0.0, 0.0, 0.0)
    let B = (3.5, 0.5, 0.0)
    let C = (1.5, 2.5, 0.0)
    // Vector xiên lên A'B'C'
    let dir = (0.8, 0.5, 3.5)
    
    let prism = make-prism((A, B, C), dir)
    draw-polyhedron(prism, cam: cam, fill-faces: green.lighten(90%), draw-vertices: true)
    
    // Ký hiệu góc vuông 3D tại A trên mặt đáy
    draw-right-angle3d(B, A, C, cam: cam, size: 0.45, stroke: 1.0pt + red)
    
    // Nhãn đỉnh
    let pts = project-pts(prism.vertices, cam)
    cetz.draw.content(pts.at(0), anchor: "north-east")[$A$]
    cetz.draw.content(pts.at(1), anchor: "north-west")[$B$]
    cetz.draw.content(pts.at(2), anchor: "south-east")[$C$]
    cetz.draw.content(pts.at(3), anchor: "south")[$A'$]
    cetz.draw.content(pts.at(4), anchor: "south-west")[$B'$]
    cetz.draw.content(pts.at(5), anchor: "south")[$C'$]
  })
]
