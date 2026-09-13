#set page(paper: "a4", margin: (x: 1.5cm, y: 1.5cm))
#set text(font: ("STIX Two Text", "Times New Roman", "New Computer Modern"), size: 10pt)

#import "@preview/cetz:0.5.2"
#import "../lib.typ": *

#align(center)[
  #text(size: 16pt, weight: "bold", fill: blue.darken(30%))[
    TEST: ĐỘNG CƠ ĐẠI SỐ HÌNH HỌC KHÔNG GIAN LINH HOẠT
  ] \
  #text(size: 11pt, style: "italic")[
    (Vector, Tọa độ, Điểm đặc biệt, Chiếu vuông góc, Đoạn vuông góc chung & Thiết diện tự động)
  ]
]

#v(10pt)

// 1. Kiểm tra tính toán đại số
#let A = pt(0, 0, 0)
#let B = pt(4, 0, 0)
#let C = pt(1, 3, 0)
#let S = pt(0, 0, 4)

#let M = trung-diem(S, B)
#let G = trong-tam(S, A, B, C)
#let O-cir = tam-ngoai-tiep(A, B, C)
#let H-orth = truc-tam(A, B, C)

// Đường thẳng SB và AC chéo nhau
#let line-SB = dt(S, diem2: B)
#let line-AC = dt(A, diem2: C)
#let d-SB-AC = khoang-cach-hai-duong(line-SB, line-AC)
#let perp = doan-vuong-goc-chung(line-SB, line-AC)

// Hình chiếu của S lên mp(ABC)
#let mp-ABC = mp(A, B: B, C: C)
#let S-proj = chieu-len-mat(S, mp-ABC)

// Góc giữa đường thẳng SB và mp(ABC)
#let goc-SB-ABC = goc-duong-mat(line-SB, mp-ABC)

// Cắt thiết diện khối chóp S.ABC bởi mặt phẳng qua M song song (ABC)
#let mp-cat = mat-phang(M, phap-tuyen: (0, 0, 1))
#let chóp-poly = (
  vertices: (S, A, B, C),
  faces: ( (1, 2, 3), (0, 1, 2), (0, 2, 3), (0, 3, 1) )
)
#let td = cat-thiet-dien(chóp-poly, mp-cat)

== 1. Kết quả kiểm tra giải tích thuần túy (Asserts & Numeric verification)
- $A = #A, B = #B, C = #C, S = #S$
- Trung điểm $M$ của $S B$: $M = #M$ (Kỳ vọng: (2, 0, 2))
- Trọng tâm tứ diện $G$: $G = #G$ (Kỳ vọng: (1.25, 0.75, 1))
- Hình chiếu của $S$ lên $(A B C)$: $S' = #S-proj$ (Kỳ vọng: (0, 0, 0) vì $S A perp (A B C)$)
- Khoảng cách giữa 2 đường chéo nhau $S B$ và $A C$: $d = #calc.round(d-SB-AC, digits: 3)$
- Đoạn vuông góc chung: $M_1 in S B$: $#perp.M1$, $M_2 in A C$: $#perp.M2$
- Góc $(S B, (A B C))$: $#calc.round(goc-SB-ABC / 1deg, digits: 1)^circle$ (Kỳ vọng: $45^circle$)
- Thiết diện cắt đa diện qua $M$: #td.len() đỉnh (#td)

#v(10pt)

== 2. Trực quan hóa bằng môi trường đại số linh hoạt `khong-gian-3d`

#align(center)[
  #khong-gian-3d(
    cam: make-camera(elevation: 22deg, azimuth: 35deg, scale: 1.0),
    length: 1.2cm,
    g => {
      // 1. Vẽ các cạnh của tứ diện S.ABC (tự động phân biệt nét thấy / khuất)
      (g.doan)(A, B)
      (g.doan)(B, C)
      (g.doan)(C, A, dut: true)
      (g.doan)(S, A, dut: true)
      (g.doan)(S, B)
      (g.doan)(S, C)

      // 2. Vẽ điểm và nhãn
      (g.diem)(A, ten: $A$, huong: "east", lech: (-0.12, 0.0))
      (g.diem)(B, ten: $B$, huong: "north", lech: (0.0, -0.15))
      (g.diem)(C, ten: $C$, huong: "west", lech: (0.12, 0.0))
      (g.diem)(S, ten: $S$, huong: "south", lech: (0.0, 0.15))

      // 3. Điểm M và thiết diện cắt tự động
      (g.diem)(M, ten: $M$, huong: "north-west", mau: blue)
      if td.len() >= 3 {
        (g.da-giac)(td, fill: rgb("38bdf8").transparentize(70%), stroke: 1.1pt + blue)
      }

      // 4. Đoạn vuông góc chung M1 M2 nối SB và AC
      (g.doan)(perp.M1, perp.M2, dut: true, mau: red, day: 1.2pt)
      (g.diem)(perp.M1, ten: $M_1$, huong: "south-east", mau: red, bk: 2.0pt)
      (g.diem)(perp.M2, ten: $M_2$, huong: "north-west", mau: red, bk: 2.0pt)
      (g.goc-vuong)(S, perp.M1, perp.M2, size: 0.2, mau: red)

      // 5. Trọng tâm G
      (g.diem)(G, ten: $G$, huong: "south", mau: rgb("059669"), bk: 2.5pt)
    }
  )
]
