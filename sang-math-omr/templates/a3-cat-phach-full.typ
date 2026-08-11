#set page(
  paper: "a3",
  flipped: true,
  margin: 0mm
)

#let school = sys.inputs.at("school", default: "SỞ GIÁO DỤC VÀ ĐÀO TẠO")
#let subtitle = sys.inputs.at("subtitle", default: "KỲ THI KHẢO SÁT CHẤT LƯỢNG")
#let made = sys.inputs.at("made", default: "123")

#set text(font: "Times New Roman", size: 10pt)

// Lined paper (Left half)
#let left-half = box(width: 210mm, height: 297mm, [
  #pad(top: 15mm, bottom: 15mm, left: 15mm, right: 10mm, [
    #for i in range(32) {
      line(length: 100%, stroke: 0.5pt + gray)
      v(8.2mm)
    }
  ])
  #place(right + horizon, dx: 5mm, rotate(-90deg, text(size: 9pt, fill: gray)[Thí sinh gấp tờ giấy thi theo đường kẻ này]))
])

// Right half
#let right-half = box(width: 210mm, height: 297mm, [
  #grid(
    columns: (145mm, 30mm, 35mm),
    
    // MAIN AREA
    box(width: 100%, height: 100%, stroke: (right: 0.5pt), [
      #pad(top: 15mm, bottom: 15mm, left: 10mm, right: 10mm, [
        // Header
        #grid(columns: (50%, 50%),
          align(center, [
            *#school* \
            *#subtitle* \
            #v(2pt)
            #line(length: 40%, stroke: 0.5pt)
          ]),
          align(center, [
            *CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM* \
            *Độc lập - Tự do - Hạnh phúc* \
            #v(2pt)
            #line(length: 40%, stroke: 0.5pt)
          ])
        )
        #v(5mm)
        #align(center, text(size: 14pt)[*BÀI THI MÔN: TOÁN*])
        #v(5mm)
        
        // Table
        #box(width: 100%, stroke: 0.5pt, [
          #grid(columns: (40%, 40%, 20%),
            box(width: 100%, height: 25mm, stroke: (right: 0.5pt), [
              #box(width: 100%, height: 8mm, stroke: (bottom: 0.5pt), align(center + horizon)[*Điểm bài thi*])
              #grid(columns: (50%, 50%),
                box(width: 100%, height: 17mm, stroke: (right: 0.5pt), align(center + horizon)[Bằng số]),
                box(width: 100%, height: 17mm, align(center + horizon)[Bằng chữ])
              )
            ]),
            box(width: 100%, height: 25mm, stroke: (right: 0.5pt), [
              #box(width: 100%, height: 8mm, stroke: (bottom: 0.5pt), align(center + horizon)[*Họ tên và chữ ký cán bộ chấm thi*])
              #grid(columns: (50%, 50%),
                 box(width: 100%, height: 17mm, stroke: (right: 0.5pt), align(center)[#v(2mm) CB 1:]),
                 box(width: 100%, height: 17mm, align(center)[#v(2mm) CB 2:])
              )
            ]),
            box(width: 100%, height: 25mm, [
               #align(center + horizon)[*Số phách* \ (Do HĐT ghi)]
            ])
          )
        ])
        
        #v(5mm)
        #align(center, text(size: 12pt)[*BÀI LÀM*])
        #v(2mm)
        
        // OMR Section
        #grid(columns: (40mm, 1fr),
          [
            *Phần trắc nghiệm:*
            #v(2mm)
            #box(width: 35mm, stroke: 0.5pt, [
              #pad(5pt, [
                Điểm TN: \ #v(5mm) #line(length: 100%, stroke: 0.5pt+gray)
                Điểm TL: \ #v(5mm) #line(length: 100%, stroke: 0.5pt+gray)
                *Tổng:* \ #v(5mm) #line(length: 100%, stroke: 0.5pt+gray)
                Giám khảo \ #v(10mm)
              ])
            ])
          ],
          [
            #let marker = box(fill: black, width: 12pt, height: 12pt)
            #let tracking-marker = box(fill: black, width: 10pt, height: 10pt)
            
            #let bubble(label) = {
              circle(
                radius: 4.3pt,
                stroke: 0.5pt + rgb("#666"),
                align(center + horizon)[#text(size: 6pt, fill: rgb("#666"), label)]
              )
            }
            
            #box(width: 260pt, height: 530pt, [
              #place(top + left, marker)
              #place(top + right, marker)
              #place(bottom + left, marker)
              #place(bottom + right, marker)
              
              // Tracking markers
              #place(dx: 0pt, dy: 100pt, tracking-marker)
              #place(dx: 0pt, dy: 200pt, tracking-marker)
              #place(dx: 0pt, dy: 300pt, tracking-marker)
              #place(dx: 0pt, dy: 400pt, tracking-marker)
              
              // MÃ ĐỀ
              #place(dx: 190pt, dy: 20pt, [
                #set text(size: 8pt)
                #align(center)[*MÃ ĐỀ*]
                #v(2pt)
                #grid(columns: (12pt, 12pt, 12pt), rows: 12pt, gutter: 3pt,
                  ..for r in range(10) {
                    for c in range(3) {
                      (bubble(str(r)),)
                    }
                  }
                )
              ])
              
              // PHẦN I (TN - 12 câu)
              #place(dx: 20pt, dy: 20pt, [
                #set text(size: 8pt)
                *PHẦN I*
                #v(4pt)
                #grid(columns: (15pt, 12pt, 12pt, 12pt, 12pt), rows: 12pt, gutter: 3pt,
                  ..for q in range(12) {
                    (
                      align(right + horizon)[*(#str(q + 1))*],
                      bubble("A"), bubble("B"), bubble("C"), bubble("D")
                    )
                  }
                )
              ])
              
              // PHẦN II (ĐS - 2 câu)
              #place(dx: 110pt, dy: 20pt, [
                #set text(size: 8pt)
                *PHẦN II*
                #v(4pt)
                #grid(columns: (15pt, 12pt, 12pt), rows: 12pt, gutter: 3pt,
                  ..for q in range(2) {
                    (
                      grid.cell(colspan: 3, align(left)[*Câu #str(q + 1)*]),
                      align(right + horizon)[a)], bubble("Đ"), bubble("S"),
                      align(right + horizon)[b)], bubble("Đ"), bubble("S"),
                      align(right + horizon)[c)], bubble("Đ"), bubble("S"),
                      align(right + horizon)[d)], bubble("Đ"), bubble("S"),
                    )
                  }
                )
              ])
              
              // PHẦN III (TLN - 4 câu)
              // 2x2 grid
              #let tln-grid(q_idx) = {
                 box([
                   #set text(size: 8pt)
                   *Câu #str(q_idx)*
                   #v(2pt)
                   #grid(columns: (14pt, 14pt, 14pt, 14pt, 14pt), rows: 14pt, gutter: 2pt,
                     align(center + horizon)[-], align(center + horizon)[,], align(center + horizon)[,], align(center + horizon)[,], align(center + horizon)[,],
                     bubble("-"), bubble(","), bubble(","), bubble(","), bubble(","),
                     ..for r in range(10) {
                       (
                         [], bubble(str(r)), bubble(str(r)), bubble(str(r)), bubble(str(r))
                       )
                     }
                   )
                 ])
              }
              
              #place(dx: 20pt, dy: 210pt, tln-grid(1))
              #place(dx: 130pt, dy: 210pt, tln-grid(2))
              #place(dx: 20pt, dy: 350pt, tln-grid(3))
              #place(dx: 130pt, dy: 350pt, tln-grid(4))
            ])
          ]
        )
      ])
    ]),
    
    // PHACH 1 (30mm)
    box(width: 100%, height: 100%, stroke: (right: (paint: black, dash: "dashed")), [
      #place(center + horizon, rotate(90deg, box(width: 297mm, height: 30mm, [
        #pad(x: 10mm, y: 5mm, [
          #grid(columns: (1fr, 1fr),
            align(left + horizon, [
              #set text(size: 10pt)
              *Chữ ký giám thị 1:* ................................................. \
              #v(5mm)
              *Chữ ký giám thị 2:* .................................................
            ]),
            align(left + horizon, [
              #set text(size: 10pt)
              *KỲ THI:* ..................................................................... \
              #v(2mm)
              *BÀI THI MÔN:* ........................................................ \
              #v(2mm)
              *PHÒNG THI SỐ:* ....................................................
            ])
          )
        ])
      ])))
    ]),
    
    // PHACH 2 (35mm)
    box(width: 100%, height: 100%, [
      #place(center + horizon, rotate(90deg, box(width: 297mm, height: 35mm, [
        #pad(x: 10mm, y: 2mm, [
          #grid(columns: (60mm, 1fr, 80mm),
            align(left + horizon, [
               #box(width: 45mm, height: 25mm, stroke: 0.5pt, [
                 #align(center + horizon)[*Số báo danh* \ (Thí sinh tự ghi)]
               ])
            ]),
            align(left + horizon, [
              #set text(size: 10pt)
              *Họ và tên thí sinh:* ................................................................. \
              #v(2mm)
              *Ngày sinh:* .......................... *Nơi sinh:* .................................
            ]),
            align(left + horizon, [
              #set text(size: 10pt)
              *Hội đồng thi:* .................................................................. \
              #v(2mm)
              *Điểm thi:* .......................................................................... \
              #place(top + right, dx: -5mm, dy: -2mm, box(width: 25mm, height: 15mm, stroke: 0.5pt, align(center + horizon)[*Số phách*]))
            ])
          )
        ])
      ])))
    ])
  )
])

#grid(columns: (210mm, 210mm), left-half, right-half)
