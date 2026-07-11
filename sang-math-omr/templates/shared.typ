// ========================================================
// shared.typ - Thư viện dùng chung cho tất cả phiếu OMR
// SANG MATH OMR Platform
// ========================================================

// --- Điểm neo định vị góc ---
#let marker = box(fill: black, width: 22pt, height: 22pt)

// --- Ô tròn đáp án ---
#let bubble(label, size: 7pt, radius: 6.5pt) = {
  circle(
    radius: radius,
    stroke: 0.6pt + rgb("#444"),
    fill: white,
    align(center + horizon)[
      #text(size: size, weight: "bold", fill: rgb("#333"))[#label]
    ]
  )
}

// --- SBD Box (4 chữ số) ---
#let sbd-box(n-digits: 4) = {
  block(
    stroke: 0.8pt + black,
    inset: 6pt,
    radius: 3pt,
    [
      #align(center)[#text(weight: "bold", size: 8.5pt)[SỐ BÁO DANH]]
      #v(3pt)
      #grid(
        columns: (16pt,) * n-digits,
        gutter: 3pt,
        align: center,
        ..range(n-digits).map(i => box(stroke: 0.8pt + black, width: 13pt, height: 13pt))
      )
      #v(4pt)
      #grid(
        columns: (16pt,) * n-digits,
        row-gutter: 4pt,
        column-gutter: 3pt,
        align: center,
        ..range(10).map(r => {
          range(n-digits).map(c => bubble(str(r), size: 6.5pt, radius: 5.5pt))
        }).flatten()
      )
    ]
  )
}

// --- Mã đề Box (3 chữ số) ---
#let made-box(n-digits: 3) = {
  block(
    stroke: 0.8pt + black,
    inset: 6pt,
    radius: 3pt,
    [
      #align(center)[#text(weight: "bold", size: 8.5pt)[MÃ ĐỀ THI]]
      #v(3pt)
      #grid(
        columns: (16pt,) * n-digits,
        gutter: 3pt,
        align: center,
        ..range(n-digits).map(i => box(stroke: 0.8pt + black, width: 13pt, height: 13pt))
      )
      #v(4pt)
      #grid(
        columns: (16pt,) * n-digits,
        row-gutter: 4pt,
        column-gutter: 3pt,
        align: center,
        ..range(10).map(r => {
          range(n-digits).map(c => bubble(str(r), size: 6.5pt, radius: 5.5pt))
        }).flatten()
      )
    ]
  )
}

// --- Hàng câu trắc nghiệm ABCD ---
#let omr-row(q-num, options: ("A","B","C","D"), radius: 6.5pt) = {
  grid(
    columns: (20pt, ..options.map(_ => 16pt)),
    align: (right + horizon, ..options.map(_ => center + horizon)),
    gutter: 5pt,
    text(weight: "bold", size: 8pt)[#q-num.],
    ..options.map(l => bubble(l, size: 6.5pt, radius: radius))
  )
}

// --- Tiêu đề phiếu ---
#let sheet-header(
  school: "TRƯỜNG THPT",
  title: "PHIẾU TRẢ LỜI TRẮC NGHIỆM",
  subtitle: "Kỳ thi đánh giá năng lực học sinh",
  show-made: true,
) = {
  v(5pt)
  grid(
    columns: (1.3fr, 1fr),
    gutter: 12pt,
    [
      #text(size: 9pt, weight: "bold")[SỞ GD&ĐT] \
      #text(size: 9pt, weight: "bold")[#school] \
      #line(length: 60%, stroke: 0.5pt)
      #v(4pt)
      *Họ và tên:* ............................................. \
      #v(3pt)
      *Lớp:* ........................ *Phòng:* .................
    ],
    [
      #align(center)[
        #text(size: 12pt, weight: "bold", fill: rgb("#c0392b"))[#title] \
        #v(3pt)
        #text(style: "italic", size: 8pt)[#subtitle]
      ]
    ]
  )
  v(8pt)
  grid(
    columns: if show-made { (1fr, 1fr) } else { (1fr,) },
    gutter: 20pt,
    align: (right, left),
    sbd-box(n-digits: 4),
    if show-made { made-box(n-digits: 3) }
  )
  v(10pt)
  line(length: 100%, stroke: 0.8pt + black)
  v(6pt)
}
