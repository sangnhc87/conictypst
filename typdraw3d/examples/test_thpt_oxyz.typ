#import "../lib.typ": *

#set page(width: 21cm, height: 29.7cm, margin: (x: 1.2cm, top: 1.2cm, bottom: 1.2cm))
#set text(font: "Libertinus Serif", size: 9.5pt)

#align(center)[
  #text(size: 15pt, weight: "bold", fill: rgb("1e3a8a"))[TYPDRAW3D — BỘ CÔNG CỤ HÌNH HỌC THPT & OXYZ HOÀN HẢO] \
  #v(2pt)
  #text(size: 9.5pt, style: "italic", fill: rgb("64748b"))[Chuẩn SGK Việt Nam • Thuật toán 3D mạnh mẽ • Dễ dùng • Dễ vẽ thêm với hook `them: d => { ... }`]
]

#v(8pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [
    #block(stroke: 0.5pt + rgb("cbd5e1"), inset: 8pt, radius: 5pt)[
      *1. Chóp tam giác & Thiết diện qua trung điểm:*
      #v(4pt)
      #align(center)[
        #hinh-chop-tam-giac-fig(
          duong-cao: "dinh-a",
          them: d => {
            let M = trung-diem(d.S, d.B)
            let N = trung-diem(d.S, d.C)
            ve-diem(M, ten: $M$, huong: "east")
            ve-diem(N, ten: $N$, huong: "west")
            ve-thiet-dien((d.A, M, N), mau: rgb("f59e0b"), do-mo: 25%)
            ve-doan(d.A, M, mau: rgb("d97706"), day: 1pt)
            ve-doan(M, N, mau: rgb("d97706"), day: 1pt)
            ve-doan(d.A, N, dut: true, mau: rgb("d97706"), day: 1pt)
          }
        )
      ]
    ]
  ],
  [
    #block(stroke: 0.5pt + rgb("cbd5e1"), inset: 8pt, radius: 5pt)[
      *2. Chóp tứ giác đều & Đường cao tâm $O$:*
      #v(4pt)
      #align(center)[
        #hinh-chop-tu-giac-deu-fig(
          duong-cao: true,
          them: d => {
            let M = trung-diem(d.S, d.C)
            ve-diem(M, ten: $M$, huong: "west", mau: rgb("dc2626"))
            ve-doan(d.A, M, dut: true, mau: rgb("dc2626"), day: 0.9pt)
          }
        )
      ]
    ]
  ],
  [
    #block(stroke: 0.5pt + rgb("cbd5e1"), inset: 8pt, radius: 5pt)[
      *3. Hình hộp chữ nhật $A B C D.A'B'C'D'$:*
      #v(4pt)
      #align(center)[
        #hinh-hop-fig(
          duong-cheo: true,
          them: d => {
            ve-doan(d.B, d.D, dut: true, mau: rgb("2563eb"), day: 0.8pt)
          }
        )
      ]
    ]
  ],
  [
    #block(stroke: 0.5pt + rgb("cbd5e1"), inset: 8pt, radius: 5pt)[
      *4. Chóp lục giác đều $S.A B C D E F$:*
      #v(4pt)
      #align(center)[
        #hinh-chop-luc-giac-deu-fig(
          duong-cao: true,
        )
      ]
    ]
  ],
  [
    #block(stroke: 0.5pt + rgb("cbd5e1"), inset: 8pt, radius: 5pt)[
      *5. Khối tròn xoay (Hình nón & Hình trụ):*
      #v(4pt)
      #grid(
        columns: (1fr, 1fr),
        align(center)[#hinh-non-thpt-fig(r: 1.4, h: 2.8, b: 0.45)],
        align(center)[#hinh-tru-thpt-fig(r: 1.2, h: 2.6, b: 0.4)]
      )
    ]
  ],
  [
    #block(stroke: 0.5pt + rgb("cbd5e1"), inset: 8pt, radius: 5pt)[
      *6. Khối cầu chuẩn SGK & Bán kính $R$:*
      #v(4pt)
      #align(center)[
        #hinh-cau-thpt-fig(r: 1.5, b: 0.45)
      ]
    ]
  ],
  [
    #block(stroke: 0.5pt + rgb("cbd5e1"), inset: 8pt, radius: 5pt)[
      *7. Hệ trục Oxyz & Điểm gióng hộp $M(x_0, y_0, z_0)$:*
      #v(4pt)
      #align(center)[
        #he-truc-oxyz-fig(
          x: 3.2, y: 3.8, z: 3.4,
          don-vi: true,
          them: d => {
            let t3 = d.t3
            diem-oxyz(t3, (2.0, 2.6, 2.4), ten: $M(x_0, y_0, z_0)$, giong: true, huong: "north-west", mau: rgb("1d4ed8"))
          }
        )
      ]
    ]
  ],
  [
    #block(stroke: 0.5pt + rgb("cbd5e1"), inset: 8pt, radius: 5pt)[
      *8. Mặt phẳng đoạn chắn $(alpha): x/a + y/b + z/c = 1$:*
      #v(4pt)
      #align(center)[
        #he-truc-oxyz-fig(
          x: 3.2, y: 3.8, z: 3.4,
          don-vi: false,
          them: d => {
            let t3 = d.t3
            mat-phang-doan-chan(t3, a: 2.4, b: 3.0, c: 2.6, ten: $(alpha)$, mau: rgb("2563eb"), do-mo: 20%)
          }
        )
      ]
    ]
  ]
)
