#import "@preview/cetz:0.3.3"

// Định nghĩa bảng màu chuẩn sư phạm, sang trọng
#let primary = rgb("#004c99")      // Xanh dương đậm (Đề bài)
#let accent-theory = rgb("#d97b00") // Cam đất (Lý thuyết)
#let accent-sol = rgb("#227a33")    // Xanh lá đậm (Lời giải)
#let accent-ans = rgb("#c62828")    // Đỏ thẫm (Đáp án)

// Khởi tạo một đối tượng câu hỏi Casio
#let casio-question(
  content,
  point: 2,
  answer: none,
  theory: none,
  solution: none
) = {
  (
    point: point,
    answer: answer,
    theory: theory,
    solution: solution,
    content: content
  )
}

// Hàm render toàn bộ đề
#let casio-exam-render(
  institute: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  exam-name: "KỲ THI CHỌN HỌC SINH GIỎI CASIO",
  subject: "Môn thi: TOÁN",
  time: "120 phút",
  year: "2025 - 2026",
  show-solution: false,
  ..questions
) = {
  // Bật chế độ hiển thị phân số chuẩn display
  show math.frac: math.display

  // Phần Header (Tiêu đề đề thi chuẩn)
  grid(
    columns: (1fr, 1.2fr),
    align(center)[
      #text(weight: "bold", 12pt)[#institute] \
      #text(weight: "bold", 12pt)[ĐỀ THI CHÍNH THỨC] \
      #v(0.2em)
      #line(length: 40%, stroke: 0.5pt)
    ],
    align(center)[
      #text(weight: "bold", 12pt)[#exam-name] \
      #text(weight: "bold", 12pt)[NĂM HỌC: #year] \
      #v(0.2em)
      #line(length: 40%, stroke: 0.5pt)
    ]
  )
  v(0.5em)
  align(center)[
    #text(16pt, weight: "bold")[#subject] \
    #v(0.5em)
    #text(12pt, style: "italic")[Thời gian làm bài: #time (Không kể thời gian giao đề)]
  ]
  v(1.5em)

  if not show-solution {
    let cells = ()
    
    cells.push(table.cell(
      fill: primary.lighten(90%), 
      align: center + horizon, 
      text(weight: "bold", fill: primary)[NỘI DUNG BÀI TOÁN]
    ))
    cells.push(table.cell(
      fill: primary.lighten(90%), 
      align: center + horizon, 
      text(weight: "bold", fill: primary)[KẾT QUẢ]
    ))

    for (i, q) in questions.pos().enumerate() {
      let num = i + 1
      cells.push([
        #text(weight: "bold", fill: primary)[Câu #num:] 
        #text(style: "italic", fill: rgb("#555"))[(#q.point điểm)]
        #v(0.3em)
        #q.content
      ])
      cells.push([
        #v(1fr)
        #align(center)[
          #box(width: 80%, stroke: (bottom: 1pt + luma(180)), height: 1em)
        ]
        #v(1fr)
      ])
    }
    
    table(
      columns: (1fr, 4.5cm),
      align: (col, row) => if col == 0 { left + top } else { center + horizon },
      stroke: (x, y) => if y == 0 { 1pt + primary } else { 0.5pt + luma(180) },
      inset: 12pt,
      ..cells
    )
  } else {
    for (i, q) in questions.pos().enumerate() {
      let num = i + 1
      block(
        width: 100%,
        breakable: true,
        stroke: (left: 3pt + primary, rest: 0.5pt + rgb("#e6e6e6")),
        inset: 12pt,
        radius: (right: 4pt),
        fill: rgb("#fcfcfc")
      )[
        #text(weight: "bold", fill: primary, size: 13pt)[Câu #num:] 
        #text(style: "italic", fill: rgb("#666"))[(#q.point điểm)]
        #v(0.5em)
        #q.content
        
        #v(1em)
        #block(
          fill: accent-ans.lighten(90%), 
          stroke: (left: 3pt + accent-ans, rest: 0.5pt + accent-ans.lighten(60%)), 
          inset: 10pt,
          radius: (right: 4pt),
          width: 100%
        )[
          #text(fill: accent-ans.darken(10%), weight: "bold", size: 11pt)[🎯 ĐÁP SỐ:]
          #h(1em)
          #text(fill: accent-ans.darken(20%), weight: "bold", size: 13pt)[
            #if type(q.answer) == array {
              q.answer.join([ #h(0.5em) #text(fill: accent-ans.lighten(30%))[|] #h(0.5em) ])
            } else {
              q.answer
            }
          ]
        ]
        
        #if q.theory != none [
          #v(0.8em)
          #block(
            width: 100%,
            fill: accent-theory.lighten(90%),
            stroke: (left: 3pt + accent-theory),
            inset: 10pt,
          )[
            #text(fill: accent-theory.darken(10%), weight: "bold")[▶ CƠ SỞ LÝ THUYẾT] \
            #v(0.4em)
            #text(fill: rgb("#333"))[#q.theory]
          ]
        ]
        
        #if q.solution != none [
          #v(0.8em)
          #text(fill: accent-sol, weight: "bold")[✍ LỜI GIẢI CHI TIẾT]
          #v(0.4em)
          #block(
            width: 100%,
            fill: accent-sol.lighten(90%),
            stroke: (left: 3pt + accent-sol),
            inset: 10pt,
          )[
            #q.solution
          ]
        ]
      ]
      v(1.5em)
    }
  }
}
