// Khởi tạo một đối tượng câu hỏi Casio
#let casio-question(
  point: 2,
  answer: none,
  theory: none,
  solution: none,
  content
) = {
  (
    point: point,
    answer: answer,
    theory: theory,
    solution: solution,
    content: content
  )
}

// Bảng đề thi Casio
#let casio-exam-render(mode: "dethi", ..questions) = {
  // Lệnh show cho phân số luôn hiển thị dạng display (to, rõ ràng)
  show math.frac: math.display

  if mode == "dethi" {
    let cells = ()
    
    // Header bảng đề thi
    cells.push(
      table.cell(
        fill: rgb("#f4f6f8"), 
        align: center + horizon,
        [*NỘI DUNG BÀI TOÁN*]
      )
    )
    cells.push(
      table.cell(
        fill: rgb("#f4f6f8"), 
        align: center + horizon,
        [*KẾT QUẢ*]
      )
    )

    for (i, q) in questions.pos().enumerate() {
      let num = i + 1
      let left-col = [
        #text(fill: rgb("#0055A4"), weight: "bold")[Câu #num] 
        #text(style: "italic", fill: rgb("#666666"))[(#q.point điểm)]
        #v(0.5em)
        #q.content
      ]
      
      cells.push(left-col)
      // Để trống ô đáp án, thêm các dòng chấm chấm cho học sinh điền
      cells.push([
        #v(1fr)
        #align(center)[#text(fill: luma(200))[..................................................]]
        #v(1fr)
      ])
    }
    
    table(
      columns: (1fr, 5cm),
      align: (col, row) => if col == 0 { left + top } else { center + horizon },
      stroke: (x, y) => if y == 0 { 1.5pt + rgb("#0055A4") } else { 0.5pt + luma(180) },
      inset: 12pt,
      ..cells
    )
  } else if mode == "loigiai" {
    for (i, q) in questions.pos().enumerate() {
      let num = i + 1
      block(
        width: 100%,
        stroke: (left: 4pt + rgb("#0055A4"), rest: 0.5pt + rgb("#e0e0e0")),
        inset: (left: 12pt, right: 10pt, top: 12pt, bottom: 12pt),
        radius: (right: 4pt),
        fill: rgb("#fafcff")
      )[
        #grid(
          columns: (1fr, auto),
          [
            #text(fill: rgb("#0055A4"), size: 14pt, weight: "bold")[Câu #num]
            #text(style: "italic", fill: rgb("#555555"))[ (#q.point điểm)]
          ],
          []
        )
        
        #v(0.3em)
        #q.content
        
        #v(0.5em)
        #line(length: 100%, stroke: (paint: rgb("#6699cc"), dash: "dashed", thickness: 0.5pt))
        #v(0.5em)
        
        #grid(
          columns: (auto, 1fr),
          column-gutter: 8pt,
          align: (center + horizon, left + horizon),
          rect(fill: rgb("#ffebee"), radius: 4pt, stroke: none)[
            #text(fill: rgb("#d32f2f"), weight: "bold")[ĐÁP SỐ]
          ],
          text(fill: rgb("#d32f2f"), weight: "bold", size: 13pt)[
            #if type(q.answer) == array {
              q.answer.join("  ;   ")
            } else {
              q.answer
            }
          ]
        )
        
        #if q.theory != none [
          #v(0.8em)
          #block(
            width: 100%,
            fill: rgb("#fffde7"),
            stroke: (left: 3pt + rgb("#fbc02d"), rest: 0.5pt + rgb("#fff59d")),
            inset: 10pt,
            radius: (right: 4pt)
          )[
            #text(fill: rgb("#f57f17"), weight: "bold")[💡 CHÚ Ý / CƠ SỞ LÝ THUYẾT:] \
            #v(0.3em)
            #q.theory
          ]
        ]
        
        #if q.solution != none [
          #v(0.8em)
          #text(fill: rgb("#2e7d32"), weight: "bold")[📝 LỜI GIẢI CHI TIẾT:]
          #v(0.3em)
          #block(
            width: 100%,
            fill: rgb("#f1f8e9"),
            stroke: (left: 3pt + rgb("#4caf50"), rest: 0.5pt + rgb("#c8e6c9")),
            inset: 10pt,
            radius: (right: 4pt)
          )[
            #q.solution
          ]
        ]
      ]
      v(1em)
    }
  }
}
