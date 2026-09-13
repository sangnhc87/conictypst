#set page(width: 21cm, height: 29.7cm, margin: (x: 1.5cm, y: 1.8cm))
#set text(font: "Linux Libertine", size: 10pt, lang: "vi")

#import "../lib.typ": *

#align(center)[
  #text(size: 18pt, weight: "bold", fill: rgb("0f172a"))[KIỂM THỬ TOÀN DIỆN TYPDRAW3D (CHUẨN LUADRAW)]
  #v(2pt)
  #text(size: 11pt, fill: rgb("475569"))[Động cơ Hình học 3D Giải tích & Đồ họa Vector Tự động cho Typst]
]

#v(10pt)

== 1. Tái Hiện Chuẩn Xác Mô Hình Luadraw (Chùm Đèn n Đỉnh & Vector Lực)

#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,
  [
    #align(center)[
      #text(weight: "bold", fill: rgb("ea580c"))[Chùm đèn 3 đỉnh ($n = 3$)]
      #v(4pt)
      #preset-chum-den-luadraw-fig(n: 3, shading: "orange", S-height: 4.0)
    ]
  ],
  [
    #align(center)[
      #text(weight: "bold", fill: rgb("0284c7"))[Chùm đèn 4 đỉnh ($n = 4$)]
      #v(4pt)
      #preset-chum-den-luadraw-fig(n: 4, shading: "blue", S-height: 4.2)
    ]
  ],
)

#v(10pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,
  [
    #align(center)[
      #text(weight: "bold", fill: rgb("059669"))[Chùm đèn 5 đỉnh ($n = 5$)]
      #v(4pt)
      #preset-chum-den-luadraw-fig(n: 5, shading: "emerald", S-height: 4.2)
    ]
  ],
  [
    #align(center)[
      #text(weight: "bold", fill: rgb("9333ea"))[Chùm đèn 6 đỉnh ($n = 6$)]
      #v(4pt)
      #preset-chum-den-luadraw-fig(n: 6, shading: "purple", S-height: 4.2)
    ]
  ],
)

#pagebreak()

== 2. Trọn Bộ 5 Khối Đa Diện Đều Platon (Tự Động Khử Nét Khuất & Đổ Bóng Lambertian)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  [
    #align(center)[
      #text(weight: "bold")[1. Tứ diện đều (4 mặt)]
      #v(4pt)
      #tetrahedron-fig(radius: 2.2, palette: "orange")
    ]
  ],
  [
    #align(center)[
      #text(weight: "bold")[2. Lập phương (6 mặt)]
      #v(4pt)
      #cube-fig(size: 2.4, palette: "blue")
    ]
  ],
  [
    #align(center)[
      #text(weight: "bold")[3. Bát diện đều (8 mặt)]
      #v(4pt)
      #octahedron-fig(radius: 2.2, palette: "emerald")
    ]
  ],
)

#v(15pt)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  [
    #align(center)[
      #text(weight: "bold")[4. Khối 12 mặt đều (Dodecahedron)]
      #v(4pt)
      #dodecahedron-fig(radius: 2.2, palette: "violet")
    ]
  ],
  [
    #align(center)[
      #text(weight: "bold")[5. Khối 20 mặt đều (Icosahedron)]
      #v(4pt)
      #icosahedron-fig(radius: 2.2, palette: "gold")
    ]
  ],
  [
    #align(center)[
      #text(weight: "bold")[6. Bán đều Cuboctahedron]
      #v(4pt)
      #cuboctahedron-fig(radius: 2.2, palette: "blue")
    ]
  ],
)

#v(15pt)

== 3. Hình Học THPT Chuẩn SGK & Hệ Trục Tọa Độ Oxyz

#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,
  [
    #align(center)[
      #text(weight: "bold")[Chóp $S.A B C D$ đáy hình bình hành]
      #v(4pt)
      #chop-s-abcd-fig(
        duong-cheo: true,
        duong-cao: "SO",
      )
    ]
  ],
  [
    #align(center)[
      #text(weight: "bold")[Hệ trục tọa độ Oxyz & Gióng hộp điểm $M(2, 3, 2.5)$]
      #v(4pt)
      #oxyz-fig(
        x: 3.5,
        y: 4.0,
        z: 3.5,
        them: d => {
          (d.giong-hop)(2.0, 3.0, 2.5, nhan: $M(2; 3; 2.5)$)
        }
      )
    ]
  ],
)
