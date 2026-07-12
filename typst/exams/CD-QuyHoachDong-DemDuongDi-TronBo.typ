#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ════════════════════════════════════════════════════════════════════
//  QUY HOẠCH ĐỘNG ĐA MÔ HÌNH
//  24 bài có hình, có lời giải, đi từ trực giác tới trạng thái
//  GV Nguyễn Văn Sang - THPT Nguyễn Hữu Cảnh
// ════════════════════════════════════════════════════════════════════

#set page(
  paper: "a4",
  margin: (x: 1.25cm, y: 1.45cm),
  header: context {
    set text(size: 8.2pt, fill: rgb("475569"))
    grid(
      columns: (1fr, auto),
      [Quy hoạch động đa mô hình],
      [GV Nguyễn Văn Sang - THPT Nguyễn Hữu Cảnh],
    )
    v(-3pt)
    line(length: 100%, stroke: 0.45pt + rgb("CBD5E1"))
  },
  footer: context {
    set text(size: 8.5pt, fill: rgb("64748B"))
    align(center)[Trang #counter(page).display()]
  },
)
#set text(font: "New Computer Modern", size: 10.15pt, lang: "vi")
#set par(justify: true, leading: 0.78em)
#set list(indent: 0.8em, body-indent: 0.45em)
#set enum(indent: 0.65em, body-indent: 0.45em)

#show math.equation: set text(fill: rgb("111827"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#let navy = rgb("0F172A")
#let blue = rgb("2563EB")
#let teal = rgb("0F766E")
#let green = rgb("15803D")
#let amber = rgb("B45309")
#let red = rgb("DC2626")
#let violet = rgb("7C3AED")
#let slate = rgb("475569")
#let soft = rgb("F8FAFC")

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("020617"), rgb("1E3A8A"), rgb("0F766E"), angle: 135deg),
  stroke: none,
  inset: (x: 13pt, y: 9pt),
  radius: 7pt,
  above: 1em,
  below: 0.65em,
  text(fill: white, size: 13pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 0.85em,
  below: 0.45em,
  stroke: (left: 4pt + violet),
  inset: (left: 8pt, y: 3.5pt),
  text(fill: violet, size: 11pt, weight: "bold", it.body),
)

#let tag(body, color: blue) = box(
  fill: color,
  radius: 4pt,
  inset: (x: 5.5pt, y: 2.7pt),
)[#text(fill: white, size: 7.7pt, weight: "bold")[#body]]

#let note(title, body, color: teal) = block(
  width: 100%,
  fill: color.lighten(92%),
  stroke: (left: 4pt + color, rest: 0.55pt + color.lighten(68%)),
  radius: (right: 6pt),
  inset: (x: 10pt, y: 8pt),
  above: 0.3em,
  below: 0.45em,
)[
  #text(fill: color, weight: "bold")[#title]
  #v(0.18em)
  #body
]

#let answer(body) = block(
  fill: rgb("FEF3C7"),
  stroke: (left: 3pt + amber, rest: 0.45pt + rgb("FDE68A")),
  radius: (right: 5pt),
  inset: (x: 8pt, y: 6pt),
  width: 100%,
)[
  #text(fill: amber, weight: "bold")[Kết quả. ]#body
]

#let qfig(body, caption: none) = block(
  width: 100%,
  fill: rgb("F8FAFC"),
  stroke: 0.6pt + rgb("CBD5E1"),
  radius: 7pt,
  inset: (x: 6pt, y: 7pt),
)[
  #align(center)[#body]
  #if caption != none [
    #v(0.35em)
    #align(center)[#text(size: 7.7pt, fill: slate, style: "italic")[#caption]]
  ]
]

#let case-card(n, title, fig, de, model, sol, ans) = block(
  width: 100%,
  fill: white,
  stroke: 0.65pt + rgb("E2E8F0"),
  radius: 7pt,
  inset: (x: 10pt, y: 8pt),
  above: 0.42em,
  below: 0.62em,
)[
  #grid(
    columns: (0.34fr, 0.66fr),
    column-gutter: 0.8em,
    align: (top, top),
    fig,
    [
      #tag([Bài #n], color: blue)
      #h(0.35em)
      #text(fill: navy, weight: "bold", size: 10.7pt)[#title]
      #v(0.35em)
      #text(fill: slate, weight: "bold")[Đề. ]#de
      #v(0.35em)
      #block(
        width: 100%,
        fill: rgb("EEF2FF"),
        stroke: (left: 3pt + violet, rest: 0.45pt + rgb("C7D2FE")),
        radius: (right: 5pt),
        inset: (x: 8pt, y: 6pt),
      )[
        #text(fill: violet, weight: "bold")[Mô hình hóa. ]#model
      ]
    ],
  )
  #v(0.42em)
  #block(
    width: 100%,
    fill: rgb("ECFDF5"),
    stroke: (left: 3pt + green, rest: 0.45pt + rgb("BBF7D0")),
    radius: (right: 5pt),
    inset: (x: 9pt, y: 7pt),
  )[
    #text(fill: green, weight: "bold")[Lời giải từng bước]
    #v(0.22em)
    #sol
  ]
  #v(0.35em)
  #answer(ans)
]

#let dp-signal(body) = block(
  fill: rgb("FFF7ED"), stroke: (left: 4pt + rgb("F97316"), rest: 0.5pt + rgb("FFEDD5")),
  radius: (right: 6pt), inset: (x: 12pt, y: 10pt), width: 100%,
)[#text(fill: rgb("C2410C"), weight: "bold")[🔍 Dấu hiệu nhận biết DP: ]#v(0.2em)#body]

#let thought-box(body) = block(
  fill: rgb("FDF4FF"), stroke: (left: 4pt + violet, rest: 0.5pt + rgb("F5D0FE")),
  radius: (right: 6pt), inset: (x: 12pt, y: 10pt), width: 100%,
)[#text(fill: violet, weight: "bold")[🧠 Nghệ thuật lập trạng thái: ]#v(0.2em)#body]

#let math-box(body) = block(
  fill: rgb("F0FDF4"), stroke: (left: 4pt + green, rest: 0.5pt + rgb("BBF7D0")),
  radius: (right: 6pt), inset: (x: 12pt, y: 10pt), width: 100%,
)[#text(fill: green, weight: "bold")[⚙️ Kỹ thuật chuyển trạng thái: ]#v(0.2em)#body]


#let master-case(n, title, fig, problem, approach, math_model, detailed_sol, ans) = [
  #v(1em)
  #block(
    width: 100%, fill: white, stroke: 0.8pt + rgb("E2E8F0"),
    radius: 8pt, inset: (x: 14pt, y: 12pt),
  )[
    #grid(
      columns: (0.34fr, 0.66fr),
      column-gutter: 0.8em,
      align: (top, top),
      fig,
      [
        #tag([Bài #n], color: blue)
        #h(0.35em)
        #text(fill: navy, weight: "bold", size: 10.7pt)[#title]
        #v(0.5em)
        #text(fill: slate, weight: "bold")[Đề bài:] #problem
        #v(0.5em)
        #thought-box(approach)
        #v(0.5em)
        #math-box(math_model)
      ]
    )
    #v(0.5em)
    #block(
      width: 100%,
      fill: rgb("F8FAFC"),
      stroke: (left: 4pt + blue, rest: 0.5pt + rgb("E2E8F0")),
      radius: (right: 5pt),
      inset: (x: 12pt, y: 10pt),
    )[
      #text(fill: blue, weight: "bold")[Lời giải chi tiết & Bảng DP minh họa:]
      #v(0.4em)
      #detailed_sol
    ]
    #v(0.5em)
    #answer(ans)
  ]
]

// ────────────────────────────────
// HÌNH MINH HỌA
// ────────────────────────────────

#let fig-pure-grid() = qfig(caption: [Bản chất Quy hoạch động trên lưới chính là Tam giác Pascal nghiêng])[
  #cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    let dp = (
      (1, 1, 1, 1, 1, 1),
      (1, 2, 3, 4, 5, 6),
      (1, 3, 6, 10, 15, 21),
      (1, 4, 10, 20, 35, 56)
    )
    for i in range(0, 6) {
      for j in range(0, 4) {
        rect((i, j), (i + 1, j + 1), fill: rgb("F8FAFC"), stroke: 0.45pt + rgb("94A3B8"))
        content((i + 0.5, j + 0.5), text(size: 7.5pt, fill: if i==5 and j==3 { blue } else { navy })[#dp.at(j).at(i)])
      }
    }
    content((-0.4, 0.5), text(size: 8pt, fill: green, weight: "bold")[S])
    content((6.4, 3.5), text(size: 8pt, fill: blue, weight: "bold")[T])
    
    // Draw arrows
    line((1.5, 0.5), (2.3, 0.5), stroke: 1.2pt + rgb("F59E0B"), mark: (end: "stealth", fill: rgb("F59E0B")))
    line((2.5, 1.5), (2.5, 0.7), stroke: 1.2pt + rgb("F59E0B"), mark: (end: "stealth", fill: rgb("F59E0B")))
    content((2.5, 0.5), text(size: 7.5pt, fill: red, weight: "bold")[3])
  })
]

#let fig-single-obstacle() = qfig(caption: [Lưới DP với đúng 1 điểm cấm tại P(2,2)])[
  #cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    let dp = (
      (1, 1, 1, 1, 1),
      (1, 2, 3, 4, 5),
      (1, 3, 0, 4, 9),
      (1, 4, 4, 8, 17),
      (1, 5, 9, 17, 34)
    )
    for i in range(0, 5) {
      for j in range(0, 5) {
        rect((i, j), (i + 1, j + 1), fill: if (i,j) == (2,2) { rgb("FCA5A5") } else { rgb("F8FAFC") }, stroke: 0.45pt + rgb("94A3B8"))
        if (i,j) == (2,2) {
          content((i + 0.5, j + 0.5), text(size: 8pt, fill: red, weight: "bold")[P])
        } else {
          content((i + 0.5, j + 0.5), text(size: 7.5pt, fill: if i==4 and j==4 { blue } else { navy })[#dp.at(j).at(i)])
        }
      }
    }
    content((-0.4, 0.5), text(size: 8pt, fill: green, weight: "bold")[S])
    content((5.4, 4.5), text(size: 8pt, fill: blue, weight: "bold")[T])
  })
]

#let fig-lake-obstacle() = qfig(caption: [Lưới DP với một hồ nước cấm đi qua (khối $2 times 2$)])[
  #cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    let dp = (
      (1, 1, 1, 1, 1, 1, 1),
      (1, 2, 3, 4, 5, 6, 7),
      (1, 3, 0, 0, 5, 11, 18),
      (1, 4, 0, 0, 5, 16, 34),
      (1, 5, 5, 5, 10, 26, 60),
      (1, 6, 11, 16, 26, 52, 112)
    )
    for i in range(0, 7) {
      for j in range(0, 6) {
        let is-lake = (i == 2 and j == 2) or (i == 3 and j == 2) or (i == 2 and j == 3) or (i == 3 and j == 3)
        rect((i, j), (i + 1, j + 1), fill: if is-lake { rgb("93C5FD") } else { rgb("F8FAFC") }, stroke: 0.45pt + rgb("94A3B8"))
        if not is-lake {
          content((i + 0.5, j + 0.5), text(size: 7.5pt, fill: if i==6 and j==5 { blue } else { navy })[#dp.at(j).at(i)])
        }
      }
    }
    content((-0.4, 0.5), text(size: 8pt, fill: green, weight: "bold")[S])
    content((7.4, 5.5), text(size: 8pt, fill: blue, weight: "bold")[T])
  })
]

#let fig-grid-obstacle() = qfig(caption: [Lưới DP điền sẵn số cách, với $P(2,1)$ và $Q(4,3)$ bị cấm])[
  #cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    let dp = (
      (1, 1, 1, 1, 1, 1, 1),
      (1, 2, 0, 1, 2, 3, 4),
      (1, 3, 3, 4, 6, 9, 13),
      (1, 4, 7, 11, 0, 9, 22),
      (1, 5, 12, 23, 23, 32, 54)
    )
    for i in range(0, 7) {
      for j in range(0, 5) {
        rect((i, j), (i + 1, j + 1), fill: if (i,j) == (2,1) or (i,j) == (4,3) { rgb("FCA5A5") } else { rgb("F8FAFC") }, stroke: 0.45pt + rgb("94A3B8"))
        if (i,j) == (2,1) {
          content((i + 0.5, j + 0.5), text(size: 8pt, fill: red, weight: "bold")[P])
        } else if (i,j) == (4,3) {
          content((i + 0.5, j + 0.5), text(size: 8pt, fill: red, weight: "bold")[Q])
        } else {
          content((i + 0.5, j + 0.5), text(size: 7.5pt, fill: if i==6 and j==4 { blue } else { navy })[#dp.at(j).at(i)])
        }
      }
    }
    content((-0.4, 0.5), text(size: 8pt, fill: green, weight: "bold")[S])
    content((7.4, 4.5), text(size: 8pt, fill: blue, weight: "bold")[T])
    
    // Draw arrows
    line((1.5, 0.5), (2.3, 0.5), stroke: 1pt + green, mark: (end: "stealth", fill: green))
    line((1.5, 0.5), (1.5, 1.3), stroke: 1pt + green, mark: (end: "stealth", fill: green))
  })
]


#let fig-catalan-shift() = qfig(caption: [Lưới DP với ranh giới bị dịch chuyển $y = x + 1$ (Vượt biên = xám)])[
  #cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    let dp = (
      (1, 1, 1, 1, 1, 1, 1),
      (1, 2, 3, 4, 5, 6, 7),
      (0, 2, 5, 9, 14, 20, 27),
      (0, 0, 5, 14, 28, 48, 75),
      (0, 0, 0, 14, 42, 90, 165),
      (0, 0, 0, 0, 42, 132, 297)
    )
    for i in range(0, 7) {
      for j in range(0, 6) {
        let v = dp.at(j).at(i)
        rect((i, j), (i + 1, j + 1), fill: if j > i + 1 { rgb("E2E8F0") } else { rgb("F8FAFC") }, stroke: 0.45pt + rgb("CBD5E1"))
        if v > 0 {
          content((i + 0.5, j + 0.5), text(size: 7.5pt, fill: if i==6 and j==5 { blue } else { navy })[#v])
        }
      }
    }
    // Draw boundary line y = x + 1
    line((0, 1), (5, 6), stroke: 1.5pt + red)
    content((-0.4, 0.5), text(size: 8pt, fill: green, weight: "bold")[S])
    content((6.4, 5.5), text(size: 8pt, fill: blue, weight: "bold")[T])
  })
]

#let fig-single-checkpoint() = qfig(caption: [Lưới DP với đúng 1 trạm trung chuyển bắt buộc tại P(2,2)])[
  #cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    let dp = (
      (1, 1, 1, 0, 0, 0),
      (1, 2, 3, 0, 0, 0),
      (1, 3, 6, 6, 6, 6),
      (0, 0, 6, 12, 18, 24),
      (0, 0, 6, 18, 36, 60)
    )
    for i in range(0, 6) {
      for j in range(0, 5) {
        let v = dp.at(j).at(i)
        rect((i, j), (i + 1, j + 1), fill: if v == 0 { rgb("F1F5F9") } else { rgb("F8FAFC") }, stroke: 0.45pt + rgb("CBD5E1"))
        if v > 0 {
          content((i + 0.5, j + 0.5), text(size: 7.5pt, fill: navy)[#v])
        }
      }
    }
    circle((2.5, 2.5), radius: 0.35, fill: none, stroke: 1.5pt + amber)
    content((2.5, 2.5), text(size: 7.5pt, fill: amber, weight: "bold")[6])
    content((-0.4, 0.5), text(size: 8pt, fill: green, weight: "bold")[S])
    content((6.4, 4.5), text(size: 8pt, fill: blue, weight: "bold")[T])
  })
]

#let fig-coin-grid() = qfig(caption: [Lưới thu thập vật phẩm: Lựa chọn hướng đi tối ưu (Max)])[
  #cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    let C = (
      (1, 2, 0, 1),
      (3, 1, 5, 2),
      (0, 4, 2, 3)
    )
    let dp = (
      (1, 3, 3, 4),
      (4, 5, 10, 12),
      (4, 9, 12, 15)
    )
    for i in range(0, 4) {
      for j in range(0, 3) {
        rect((i, j), (i + 1, j + 1), fill: rgb("F8FAFC"), stroke: 0.45pt + rgb("94A3B8"))
        // Draw the coin value smaller in the top left
        content((i + 0.2, j + 0.8), text(size: 6pt, fill: rgb("F59E0B"), weight: "bold")[+#C.at(j).at(i)])
        // Draw the DP value in the center
        content((i + 0.5, j + 0.4), text(size: 8pt, fill: navy, weight: "bold")[#dp.at(j).at(i)])
      }
    }
    // Highlight the optimal path
    line((0.5, 0.5), (0.5, 1.5), (1.5, 1.5), (2.5, 1.5), (2.5, 2.5), (3.5, 2.5), stroke: 2pt + green.transparentize(50%))
  })
]

#let fig-4way-grid() = qfig(caption: [Ma trận đi 4 hướng tạo ra phụ thuộc vòng tròn (Cyclic Dependency)])[
  #cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    for i in range(0, 3) {
      for j in range(0, 3) {
        rect((i, j), (i + 1, j + 1), fill: rgb("F1F5F9"), stroke: 0.45pt + rgb("94A3B8"))
      }
    }
    // Draw cyclic arrows
    line((1.3, 1.5), (1.7, 1.5), stroke: 1pt + red, mark: (end: "stealth", fill: red))
    line((1.7, 1.3), (1.3, 1.3), stroke: 1pt + red, mark: (end: "stealth", fill: red))
    content((1.5, 0.5), text(size: 8pt, fill: red, weight: "bold")[Deadlock!])
  })
]

#let fig-checkpoints() = qfig(caption: [Lưới DP với trạm trung chuyển P và Q (chỉ vùng màu trắng hợp lệ)])[
  #cetz.canvas(length: 0.58cm, {
    import cetz.draw: *
    let dp = (
      (1, 1, 1, 0, 0, 0, 0, 0),
      (1, 2, 3, 0, 0, 0, 0, 0),
      (1, 3, 6, 6, 6, 6, 0, 0),
      (0, 0, 6, 12, 18, 24, 24, 24),
      (0, 0, 0, 0, 0, 24, 48, 72),
      (0, 0, 0, 0, 0, 24, 72, 144)
    )
    for i in range(0, 8) {
      for j in range(0, 6) {
        let v = dp.at(j).at(i)
        rect((i, j), (i + 1, j + 1), fill: if v == 0 { rgb("F1F5F9") } else { rgb("F8FAFC") }, stroke: 0.45pt + rgb("CBD5E1"))
        if v > 0 {
          content((i + 0.5, j + 0.5), text(size: 7.5pt, fill: navy)[#v])
        }
      }
    }
    // Highlight checkpoints
    circle((2.5, 2.5), radius: 0.35, fill: none, stroke: 1.5pt + amber)
    circle((5.5, 3.5), radius: 0.35, fill: none, stroke: 1.5pt + amber)
    content((2.5, 2.5), text(size: 7.5pt, fill: amber, weight: "bold")[6])
    content((5.5, 3.5), text(size: 7.5pt, fill: amber, weight: "bold")[24])
    content((7.5, 5.5), text(size: 7.5pt, fill: blue, weight: "bold")[144])
    
    // Draw thick bounding boxes for the 3 stages
    rect((0,0), (3,3), stroke: 1.2pt + teal)
    rect((2,2), (6,4), stroke: 1.2pt + blue)
    rect((5,3), (8,6), stroke: 1.2pt + violet)
    
    content((-0.4, 0.5), text(size: 8pt, fill: green, weight: "bold")[S])
    content((8.4, 5.5), text(size: 8pt, fill: green, weight: "bold")[T])
    content((2.5, 1.8), text(size: 8pt, fill: amber, weight: "bold")[P])
    content((5.5, 2.8), text(size: 8pt, fill: amber, weight: "bold")[Q])
  })
]

#let fig-catalan() = qfig(caption: [Lưới DP đường đi không vượt quá phân giác $y=x$ (Màu xám: vùng bị cấm $y > x$)])[
  #cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    let dp = (
      (1, 1, 1, 1, 1, 1, 1),
      (0, 1, 2, 3, 4, 5, 6),
      (0, 0, 2, 5, 9, 14, 20),
      (0, 0, 0, 5, 14, 28, 48),
      (0, 0, 0, 0, 14, 42, 90)
    )
    for i in range(0, 7) {
      for j in range(0, 5) {
        let is_invalid = (j > i)
        rect((i, j), (i + 1, j + 1), fill: if is_invalid { rgb("F1F5F9") } else { rgb("F8FAFC") }, stroke: 0.45pt + rgb("94A3B8"))
        if not is_invalid {
          content((i + 0.5, j + 0.5), text(size: 7.5pt, fill: if i==6 and j==4 { blue } else { navy })[#dp.at(j).at(i)])
        } else {
          content((i + 0.5, j + 0.5), text(size: 7.5pt, fill: rgb("CBD5E1"))[0])
        }
      }
    }
    line((0, 0), (5, 5), stroke: 1.5pt + red, dash: "dashed")
    content((3.5, 4.3), text(size: 8pt, fill: red, weight: "bold")[Phân giác $y=x$])
    
    content((-0.4, 0.5), text(size: 8pt, fill: green, weight: "bold")[S])
    content((7.4, 4.5), text(size: 8pt, fill: blue, weight: "bold")[T])
  })
]

#let fig-turns() = qfig(caption: [Mỗi chấm cam là một lần đổi hướng])[
  #cetz.canvas(length: 0.58cm, {
    import cetz.draw: *
    for i in range(0, 7) { line((i, 0), (i, 4), stroke: 0.35pt + rgb("CBD5E1")) }
    for j in range(0, 5) { line((0, j), (6, j), stroke: 0.35pt + rgb("CBD5E1")) }
    line((0, 0), (3, 0), stroke: 2.2pt + blue, mark: (end: "stealth", fill: blue))
    line((3, 0), (3, 2), stroke: 2.2pt + blue, mark: (end: "stealth", fill: blue))
    line((3, 2), (5, 2), stroke: 2.2pt + blue, mark: (end: "stealth", fill: blue))
    line((5, 2), (5, 3), stroke: 2.2pt + blue, mark: (end: "stealth", fill: blue))
    circle((3, 0), radius: 4pt, fill: amber, stroke: none)
    circle((3, 2), radius: 4pt, fill: amber, stroke: none)
    circle((5, 2), radius: 4pt, fill: amber, stroke: none)
    content((2.9, -0.45), text(size: 7pt, fill: amber)[1])
    content((3.15, 2.35), text(size: 7pt, fill: amber)[2])
    content((5.25, 2.25), text(size: 7pt, fill: amber)[3])
  })
]

#let fig-mod-grid() = qfig(caption: [Trạng thái cần nhớ thêm phần dư])[
  #cetz.canvas(length: 0.56cm, {
    import cetz.draw: *
    let rows = ((0, 0, 0, 0), (0, 1, 2, 3), (0, 2, 0, 2), (0, 3, 2, 1))
    for i in range(0, 4) {
      for j in range(0, 4) {
        rect((i, 3 - j), (i + 1, 4 - j), fill: if rows.at(j).at(i) == 0 { rgb("DBEAFE") } else { rgb("F8FAFC") }, stroke: 0.5pt + rgb("94A3B8"))
        content((i + 0.5, 3.5 - j), text(size: 7.5pt, fill: navy, weight: "bold")[#str(rows.at(j).at(i))])
      }
    }
    content((2, -0.35), text(size: 7pt, fill: slate)[$w(i,j)=i j mod 4$])
  })
]

#let fig-stairs() = qfig(caption: [Bậc 5 bị khóa, không được đặt chân])[
  #cetz.canvas(length: 0.38cm, {
    import cetz.draw: *
    for i in range(0, 11) {
      rect((i, 0), (i + 0.9, 0.35 + i * 0.13), fill: if i == 5 { rgb("FCA5A5") } else { rgb("DBEAFE") }, stroke: 0.45pt + rgb("64748B"))
      content((i + 0.45, 0.55 + i * 0.13), text(size: 6.7pt, fill: if i == 5 { red } else { navy })[#str(i)])
    }
    line((0.2, 0.1), (2.15, 0.1), stroke: 1.7pt + teal, mark: (end: "stealth", fill: teal))
    line((2.2, 0.25), (5.1, 0.62), stroke: 1.7pt + red, dash: "dashed", mark: (end: "stealth", fill: red))
  })
]

#let fig-frog() = qfig(caption: [Các bước nhảy 2, 3, 5; đá số 7 nguy hiểm])[
  #cetz.canvas(length: 0.43cm, {
    import cetz.draw: *
    line((0, 0), (12, 0), stroke: 0.7pt + rgb("94A3B8"))
    for i in range(0, 13) {
      circle((i, 0), radius: if i == 7 { 4pt } else { 2.7pt }, fill: if i == 7 { red } else { rgb("E0F2FE") }, stroke: 0.45pt + rgb("0369A1"))
      if i in (0, 2, 3, 5, 7, 12) {
        content((i, -0.42), text(size: 6.5pt, fill: navy)[#str(i)])
      }
    }
    bezier((0, 0.1), (2, 0.1), (0.8, 1), (1.2, 1), stroke: 1.2pt + teal, mark: (end: "stealth", fill: teal))
    bezier((0, 0.1), (3, 0.1), (1.2, 1.35), (1.8, 1.35), stroke: 1.2pt + blue, mark: (end: "stealth", fill: blue))
    bezier((0, 0.1), (5, 0.1), (2.0, 1.75), (3.0, 1.75), stroke: 1.2pt + violet, mark: (end: "stealth", fill: violet))
  })
]

#let fig-dag() = qfig(caption: [Đếm đường đi trên đồ thị có hướng không chu trình])[
  #cetz.canvas(length: 0.62cm, {
    import cetz.draw: *
    let pts = ((0, 1), (1.6, 2), (1.6, 0), (3.2, 1.5), (3.2, 0), (4.8, 0.8), (6.4, 1))
    let names = ("0", "1", "2", "3", "4", "5", "6")
    let edges = ((0,1),(0,2),(1,3),(1,4),(2,3),(2,5),(3,6),(4,6),(5,4),(5,6))
    for e in edges {
      let a = pts.at(e.at(0))
      let b = pts.at(e.at(1))
      line(a, b, stroke: 1.15pt + rgb("64748B"), mark: (end: "stealth", fill: rgb("64748B"), scale: 0.8))
    }
    for k in range(0, pts.len()) {
      circle(pts.at(k), radius: 0.27, fill: if k == 0 or k == 6 { rgb("DCFCE7") } else { white }, stroke: 1pt + blue)
      content(pts.at(k), text(size: 8pt, fill: navy, weight: "bold")[#names.at(k)])
    }
  })
]

#let fig-dfa101() = qfig(caption: [FSM tránh mẫu 101])[
  #cetz.canvas(length: 0.68cm, {
    import cetz.draw: *
    circle((0, 0), radius: 0.5, fill: rgb("E0F2FE"), stroke: 1pt + blue, name: "A")
    circle((2.1, 0), radius: 0.5, fill: rgb("E0F2FE"), stroke: 1pt + blue, name: "B")
    circle((4.2, 0), radius: 0.5, fill: rgb("E0F2FE"), stroke: 1pt + blue, name: "C")
    circle((6.2, 0), radius: 0.5, fill: rgb("FEE2E2"), stroke: 1pt + red, name: "D")
    content("A", text(size: 8pt, weight: "bold")[0])
    content("B", text(size: 8pt, weight: "bold")[1])
    content("C", text(size: 8pt, weight: "bold")[10])
    content("D", text(size: 8pt, fill: red, weight: "bold")[bad])
    line("A.0", "B.180", stroke: 1pt + blue, mark: (end: "stealth", fill: blue))
    content((1.05, 0.28), text(size: 7pt)[1])
    bezier("B.40", "B.140", (2.1, 1.1), stroke: 1pt + teal, mark: (end: "stealth", fill: teal))
    content((2.1, 1.28), text(size: 7pt)[1])
    line("B.320", "C.220", stroke: 1pt + blue, mark: (end: "stealth", fill: blue))
    content((3.1, -0.35), text(size: 7pt)[0])
    line("C.0", "D.180", stroke: 1pt + red, mark: (end: "stealth", fill: red))
    content((5.2, 0.28), text(size: 7pt, fill: red)[1])
    bezier("C.230", "A.310", (2.1, -1.15), stroke: 1pt + teal, mark: (end: "stealth", fill: teal))
    content((2.1, -1.35), text(size: 7pt)[0])
  })
]

#let fig-run-zero() = qfig(caption: [Nhớ số số 0 liên tiếp cuối dãy])[
  #cetz.canvas(length: 0.7cm, {
    import cetz.draw: *
    let xs = (0, 2, 4)
    let labs = ("đuôi 1", "đuôi 0", "đuôi 00")
    for i in range(0, 3) {
      circle((xs.at(i), 0), radius: 0.55, fill: rgb("ECFEFF"), stroke: 1pt + teal, name: "N" + str(i))
      content((xs.at(i), 0), align(center)[#text(size: 7.2pt, weight: "bold")[#labs.at(i)]])
    }
    line("N0.0", "N1.180", stroke: 1pt + blue, mark: (end: "stealth", fill: blue))
    line("N1.0", "N2.180", stroke: 1pt + blue, mark: (end: "stealth", fill: blue))
    bezier("N1.120", "N0.60", (1, 1.15), stroke: 1pt + green, mark: (end: "stealth", fill: green))
    bezier("N2.120", "N0.60", (2, 1.65), stroke: 1pt + green, mark: (end: "stealth", fill: green))
    content((1, 1.35), text(size: 7pt, fill: green)[thêm 1])
    content((1, -0.35), text(size: 7pt, fill: blue)[thêm 0])
  })
]

#let fig-coins() = qfig(caption: [Duyệt đồng xu theo thứ tự để không đếm hoán vị])[
  #cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    for i in range(0, 13) {
      rect((i * 0.55, 0), (i * 0.55 + 0.5, 0.5), fill: if i in (0, 2, 3, 5, 12) { rgb("DCFCE7") } else { rgb("F8FAFC") }, stroke: 0.4pt + rgb("94A3B8"))
      if i in (0, 2, 3, 5, 12) {
        content((i * 0.55 + 0.25, 0.25), text(size: 6.3pt, weight: "bold")[#str(i)])
      }
    }
    circle((1.1, 1.2), radius: 0.33, fill: rgb("FEF3C7"), stroke: 0.6pt + amber)
    circle((2.0, 1.2), radius: 0.33, fill: rgb("FEF3C7"), stroke: 0.6pt + amber)
    circle((2.9, 1.2), radius: 0.33, fill: rgb("FEF3C7"), stroke: 0.6pt + amber)
    content((1.1, 1.2), text(size: 7pt)[2])
    content((2.0, 1.2), text(size: 7pt)[3])
    content((2.9, 1.2), text(size: 7pt)[5])
    content((3.8, 1.2), text(size: 7pt, fill: slate)[mục tiêu 12])
  })
]

#let fig-domino2() = qfig(caption: [Cột cuối: đứng riêng hoặc ghép với cột trước])[
  #cetz.canvas(length: 0.55cm, {
    import cetz.draw: *
    for i in range(0, 8) {
      for j in range(0, 2) {
        rect((i, j), (i + 1, j + 1), fill: rgb("F8FAFC"), stroke: 0.45pt + rgb("94A3B8"))
      }
    }
    rect((5, 0), (6, 2), fill: rgb("DBEAFE"), stroke: 1pt + blue)
    rect((6, 0), (8, 1), fill: rgb("DCFCE7"), stroke: 1pt + green)
    rect((6, 1), (8, 2), fill: rgb("DCFCE7"), stroke: 1pt + green)
    content((3.8, -0.35), text(size: 7pt, fill: slate)[$f_n=f_(n-1)+f_(n-2)$])
  })
]

#let fig-profile() = qfig(caption: [Bitmask ghi các ô đã bị domino từ cột trước chiếm])[
  #cetz.canvas(length: 0.58cm, {
    import cetz.draw: *
    for c in range(0, 4) {
      for r in range(0, 3) {
        rect((c, r), (c + 1, r + 1), fill: if c == 1 and r in (0, 2) { rgb("FDE68A") } else { rgb("F8FAFC") }, stroke: 0.45pt + rgb("94A3B8"))
      }
    }
    rect((1, 0), (2, 1), fill: rgb("FDE68A"), stroke: 0.9pt + amber)
    rect((1, 2), (2, 3), fill: rgb("FDE68A"), stroke: 0.9pt + amber)
    content((1.5, 3.35), text(size: 7pt, fill: amber, weight: "bold")[mask 101])
    line((1.5, 3.1), (1.5, 2.1), stroke: 0.9pt + amber, mark: (end: "stealth", fill: amber))
  })
]

#let fig-energy() = qfig(caption: [Mỗi ô có chi phí; phải nhớ thêm ngân sách])[
  #cetz.canvas(length: 0.56cm, {
    import cetz.draw: *
    let rows = ((1,2,1,3), (2,3,2,1), (1,4,1,2), (3,1,2,1))
    for i in range(0, 4) {
      for j in range(0, 4) {
        let v = rows.at(3 - j).at(i)
        rect((i, j), (i + 1, j + 1), fill: if v >= 3 { rgb("FED7AA") } else { rgb("E0F2FE") }, stroke: 0.45pt + rgb("94A3B8"))
        content((i + 0.5, j + 0.5), text(size: 7pt, weight: "bold")[#str(v)])
      }
    }
    content((2, -0.35), text(size: 7pt, fill: slate)[tổng chi phí $<=12$])
  })
]

#let fig-triangle() = qfig(caption: [Tam giác số: lưu giá trị tốt nhất và số cách đạt])[
  #cetz.canvas(length: 0.55cm, {
    import cetz.draw: *
    let tri = ((5,), (1,4), (7,2,6), (3,9,1,8), (4,2,7,3,5))
    for r in range(0, tri.len()) {
      for c in range(0, tri.at(r).len()) {
        let x = c - r / 2
        let y = -r * 0.72
        circle((x, y), radius: 0.25, fill: if (r,c) in ((0,0),(1,1),(2,2),(3,3),(4,4)) { rgb("DCFCE7") } else { white }, stroke: 0.7pt + blue)
        content((x, y), text(size: 7pt, weight: "bold")[#str(tri.at(r).at(c))])
      }
    }
  })
]

#let fig-edit() = qfig(caption: [Bảng sửa xâu SANG thành MATH])[
  #cetz.canvas(length: 0.46cm, {
    import cetz.draw: *
    let a = ("", "S", "A", "N", "G")
    let b = ("", "M", "A", "T", "H")
    for i in range(0, 5) {
      for j in range(0, 5) {
        rect((i, 4 - j), (i + 1, 5 - j), fill: if i == j { rgb("E0F2FE") } else { rgb("F8FAFC") }, stroke: 0.4pt + rgb("CBD5E1"))
      }
    }
    for i in range(1, 5) { content((i + 0.5, 5.28), text(size: 7pt, fill: blue)[#a.at(i)]) }
    for j in range(1, 5) { content((-0.25, 4.5 - j), text(size: 7pt, fill: violet)[#b.at(j)]) }
    content((4.5, 0.5), text(size: 8pt, fill: red, weight: "bold")[3])
  })
]

#let fig-lcs() = qfig(caption: [Đường chéo khi hai ký tự khớp])[
  #cetz.canvas(length: 0.42cm, {
    import cetz.draw: *
    for i in range(0, 9) { line((i, 0), (i, 4), stroke: 0.35pt + rgb("CBD5E1")) }
    for j in range(0, 5) { line((0, j), (8, j), stroke: 0.35pt + rgb("CBD5E1")) }
    let pts = ((5.5, 0.5), (6.5, 1.5), (7.5, 2.5), (8.5, 3.5))
    line((4.5, 0.5), (5.5, 0.5), stroke: 1.7pt + green, mark: (end: "stealth", fill: green))
    line((5.5, 0.5), (6.5, 1.5), stroke: 1.7pt + green, mark: (end: "stealth", fill: green))
    line((6.5, 1.5), (7.5, 2.5), stroke: 1.7pt + green, mark: (end: "stealth", fill: green))
    line((7.5, 2.5), (8, 3.0), stroke: 1.7pt + green, mark: (end: "stealth", fill: green))
    content((4, -0.35), text(size: 7pt, fill: blue)[SANGMATH])
    content((-0.35, 2), text(size: 7pt, fill: violet)[MATH])
  })
]

#let fig-walk-line() = qfig(caption: [Đi bộ trên đoạn 0-1-2-3, có phản xạ ở biên])[
  #cetz.canvas(length: 0.75cm, {
    import cetz.draw: *
    for i in range(0, 4) {
      circle((i * 1.35, 0), radius: 0.32, fill: if i in (0, 2) { rgb("DCFCE7") } else { white }, stroke: 1pt + blue)
      content((i * 1.35, 0), text(size: 8pt, weight: "bold")[#str(i)])
    }
    for i in range(0, 3) {
      line((i * 1.35 + 0.32, 0), ((i + 1) * 1.35 - 0.32, 0), stroke: 1pt + rgb("64748B"), mark: (end: "stealth", fill: rgb("64748B"), scale: 0.7))
      line(((i + 1) * 1.35 - 0.32, -0.16), (i * 1.35 + 0.32, -0.16), stroke: 1pt + rgb("64748B"), mark: (end: "stealth", fill: rgb("64748B"), scale: 0.7))
    }
  })
]

#let fig-tree() = qfig(caption: [Cây: chọn hoặc không chọn mỗi đỉnh])[
  #cetz.canvas(length: 0.62cm, {
    import cetz.draw: *
    let pts = ((2.5,2.4),(1.1,1.35),(2.5,1.35),(3.9,1.35),(0.45,0.2),(1.75,0.2),(2.5,0.2))
    let edges = ((0,1),(0,2),(0,3),(1,4),(1,5),(2,6))
    for e in edges { line(pts.at(e.at(0)), pts.at(e.at(1)), stroke: 1pt + rgb("64748B")) }
    for k in range(0, pts.len()) {
      circle(pts.at(k), radius: 0.28, fill: if k in (0,4,5,6) { rgb("FEF3C7") } else { white }, stroke: 0.9pt + amber)
      content(pts.at(k), text(size: 7.5pt, weight: "bold")[#str(k + 1)])
    }
  })
]

#let fig-match() = qfig(caption: [Ghép học sinh với nhiệm vụ bằng mask])[
  #cetz.canvas(length: 0.62cm, {
    import cetz.draw: *
    let left = ("A","B","C","D")
    let right = ("1","2","3","4")
    let edges = ((0,0),(0,1),(1,1),(1,2),(2,0),(2,3),(3,2),(3,3))
    for e in edges {
      line((0, -e.at(0)), (3.5, -e.at(1)), stroke: 0.75pt + rgb("94A3B8"))
    }
    for i in range(0,4) {
      circle((0, -i), radius: 0.25, fill: rgb("DBEAFE"), stroke: 0.7pt + blue)
      circle((3.5, -i), radius: 0.25, fill: rgb("DCFCE7"), stroke: 0.7pt + green)
      content((0, -i), text(size: 7pt, weight: "bold")[#left.at(i)])
      content((3.5, -i), text(size: 7pt, weight: "bold")[#right.at(i)])
    }
  })
]

#let fig-gambler() = qfig(caption: [Trạng thái hấp thụ 0 và 4])[
  #cetz.canvas(length: 0.68cm, {
    import cetz.draw: *
    for i in range(0, 5) {
      circle((i * 1.2, 0), radius: 0.33, fill: if i in (0,4) { rgb("FEE2E2") } else { rgb("E0F2FE") }, stroke: 0.8pt + if i in (0,4) { red } else { blue })
      content((i * 1.2, 0), text(size: 8pt, weight: "bold")[#str(i)])
    }
    for i in range(1, 4) {
      line((i * 1.2 + 0.32, 0.13), ((i + 1) * 1.2 - 0.32, 0.13), stroke: 1pt + green, mark: (end: "stealth", fill: green))
      line((i * 1.2 - 0.32, -0.13), ((i - 1) * 1.2 + 0.32, -0.13), stroke: 1pt + amber, mark: (end: "stealth", fill: amber))
    }
    content((3.05, 0.55), text(size: 7pt, fill: green)[$0.6$])
    content((1.9, -0.55), text(size: 7pt, fill: amber)[$0.4$])
  })
]

#let fig-polygon() = qfig(caption: [Interval DP: chọn đường chéo cuối cùng])[
  #cetz.canvas(length: 0.62cm, {
    import cetz.draw: *
    let pts = ((0,1.2),(1.25,2.0),(2.6,1.55),(2.85,0.25),(1.45,-0.65),(0.1,0))
    for i in range(0, 6) {
      line(pts.at(i), pts.at(calc.rem(i + 1, 6)), stroke: 1.2pt + blue)
    }
    line(pts.at(0), pts.at(2), stroke: 1pt + red, dash: "dashed")
    line(pts.at(0), pts.at(4), stroke: 1pt + red, dash: "dashed")
    for i in range(0,6) {
      circle(pts.at(i), radius: 2.7pt, fill: white, stroke: 0.8pt + navy)
      content((pts.at(i).at(0), pts.at(i).at(1)+0.28), text(size: 7pt)[#str(i)])
    }
  })
]

#let fig-knapsack() = qfig(caption: [Bảng theo vật và sức chứa])[
  #cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    for i in range(0, 7) {
      for j in range(0, 5) {
        rect((i, j), (i + 1, j + 1), fill: if j == 0 or i == 0 { rgb("E2E8F0") } else { rgb("F8FAFC") }, stroke: 0.35pt + rgb("CBD5E1"))
      }
    }
    content((3.5, -0.35), text(size: 7pt, fill: slate)[sức chứa])
    content((-0.35, 2.4), text(size: 7pt, fill: slate)[vật])
    circle((5.5, 3.5), radius: 4pt, fill: amber, stroke: none)
  })
]

#let fig-total() = qfig(caption: [Trạng thái tổng hợp: vị trí, hướng, lượt rẽ, phần dư])[
  #cetz.canvas(length: 0.48cm, {
    import cetz.draw: *
    for i in range(0, 7) { line((i, 0), (i, 5), stroke: 0.35pt + rgb("CBD5E1")) }
    for j in range(0, 6) { line((0, j), (6, j), stroke: 0.35pt + rgb("CBD5E1")) }
    circle((2, 2), radius: 4pt, fill: red, stroke: none)
    circle((4, 3), radius: 4pt, fill: red, stroke: none)
    line((0,0),(2,0), stroke: 2pt + blue, mark: (end: "stealth", fill: blue))
    line((2,0),(2,1), stroke: 2pt + blue, mark: (end: "stealth", fill: blue))
    line((2,1),(5,1), stroke: 2pt + blue, mark: (end: "stealth", fill: blue))
    line((5,1),(5,5), stroke: 2pt + blue, mark: (end: "stealth", fill: blue))
    line((5,5),(6,5), stroke: 2pt + blue, mark: (end: "stealth", fill: blue))
    content((3, -0.45), text(size: 7pt, fill: slate)[$(i,j,h,t,r)$])
  })
]

// ═══════════════════════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════════════════════

#set page(header: none, footer: none)
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("020617"), rgb("0B3B5A"), rgb("0F766E"), rgb("4C1D95"), angle: 145deg),
    stroke: none,
    radius: 12pt,
    inset: (x: 1.6cm, y: 1.55cm),
  )[
    #text(fill: rgb("A7F3D0"), size: 10.5pt, weight: "bold")[CHUYÊN ĐỀ ĐẠI BÁC - TỔ HỢP, ĐẾM VÀ TƯ DUY TRẠNG THÁI]
    #v(0.7em)
    #text(fill: white, size: 25pt, weight: "black")[QUY HOẠCH ĐỘNG]
    #linebreak()
    #text(fill: white, size: 20pt, weight: "black")[ĐA MÔ HÌNH CÓ HÌNH VẼ]
    #v(0.35em)
    #text(fill: rgb("BFDBFE"), size: 12.5pt, style: "italic")[
      24 bài dẫn dắt: từ đường đi, FSM, bitmask, cây, xác suất đến interval DP
    ]
    #v(1em)
    #line(length: 62%, stroke: 1.1pt + rgb("67E8F9"))
    #v(1em)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      column-gutter: 9pt,
      row-gutter: 7pt,
      align: center,
      tag([Lưới], color: blue),
      tag([FSM], color: teal),
      tag([Bitmask], color: violet),
      tag([Cây], color: amber),
      tag([Tối ưu], color: green),
      tag([Xác suất], color: red),
      tag([Xâu], color: blue),
      tag([Interval], color: violet),
    )
    #v(1.2em)
    #text(fill: white, size: 11pt, weight: "bold")[GV Nguyễn Văn Sang]
    #linebreak()
    #text(fill: rgb("CBD5E1"), size: 9.8pt)[THPT Nguyễn Hữu Cảnh]
  ]
]

#pagebreak()
#set page(
  header: context {
    set text(size: 8.2pt, fill: rgb("475569"))
    grid(
      columns: (1fr, auto),
      [Quy hoạch động đa mô hình],
      [GV Nguyễn Văn Sang - THPT Nguyễn Hữu Cảnh],
    )
    v(-3pt)
    line(length: 100%, stroke: 0.45pt + rgb("CBD5E1"))
  },
  footer: context {
    set text(size: 8.5pt, fill: rgb("64748B"))
    align(center)[Trang #counter(page).display()]
  },
)

= Nền Tảng: Vì Sao Rất Nhiều Bài Toán Dẫn Tới Quy Hoạch Động?

#note([Ý tưởng gốc], [
  Quy hoạch động không phải là một “công thức”. Nó là cách nhìn một bài toán lớn thành các trạng thái nhỏ, trong đó mỗi trạng thái có thể được tạo từ vài trạng thái trước đó. Khi thời gian, vị trí, độ dài xâu, số vật, số đỉnh hoặc khoảng xét luôn tăng dần, ta có một đồ thị có hướng không chu trình. Khi đó:

  #align(center)[
    #text(fill: red, weight: "bold")[
      số cách / giá trị tốt nhất ở trạng thái hiện tại = tổng / max / min từ các trạng thái liền trước.
    ]
  ]
], color: teal)

#grid(
  columns: (1fr, 1fr),
  gutter: 0.8em,
  note([Bốn câu hỏi bắt buộc], [
    1. Trạng thái cần nhớ những gì?
    2. Trạng thái đầu và biên là gì?
    3. Có những bước chuyển hợp lệ nào?
    4. Kết quả nằm ở trạng thái nào?
  ], color: blue),
  note([Khi nào phải thêm chiều trạng thái?], [
    Thêm chiều khi đề bài có “ký ức”: hướng đi trước đó, số lần đổi hướng, phần dư modulo, ngân sách còn lại, mẫu xâu đang khớp, tập nhiệm vụ đã dùng, hay đoạn con đang xét.
  ], color: violet),
)

#note([Thông điệp sư phạm], [
  Học sinh giỏi không nên học thuộc từng mẹo nhỏ. Nên tập nhận ra: bài toán đang yêu cầu đếm đường đi trong một không gian trạng thái nào. Khi nhìn ra không gian trạng thái, lời giải trở nên có xương sống.
], color: amber)

= Phần I - Quy Hoạch Động Trên Lưới (Grid DP)

#dp-signal[
  - *Từ khóa:* Đề bài yêu cầu "Đếm số đường đi", "Tìm đường đi có tổng trọng số Max/Min".
  - *Không gian:* Lưới 2D, Robot / Quân cờ chỉ được di chuyển theo 2 hướng tiến (VD: Phải và Lên, hoặc Phải và Xuống).
  - *Vì sao là DP?* Vì việc "chỉ được tiến" đảm bảo đồ thị *không có chu trình (DAG)*. Ta có thể duyệt các trạng thái theo thứ tự tô-pô (từ dưới lên trên, từ trái qua phải) mà không sợ lặp vô hạn. Nếu đề cho phép đi lùi (Trái, Xuống), DP sẽ phá sản và phải dùng BFS / Dijkstra!
]

== Cấp độ 1: Lưới Tinh Khiết & Nguồn Gốc Tổ Hợp

#master-case(
  1,
  [Đếm đường đi cơ bản: Mối chúa của mọi bài Toán Lưới],
  fig-pure-grid(),
  [Một robot di chuyển trên lưới tọa độ từ điểm $S(0,0)$ đến điểm $T(5,3)$. Tại mỗi bước, robot chỉ được phép đi sang phải (tăng $x$ thêm 1) hoặc đi lên trên (tăng $y$ thêm 1). Hỏi có bao nhiêu đường đi hợp lệ?],
  [
    Đây là bài toán sơ khai nhất. Bất kỳ ô $(i,j)$ nào cũng chỉ có thể được đi tới từ ô bên trái $(i-1,j)$ hoặc ô bên dưới $(i,j-1)$. 
    Do đó, số cách đến $(i,j)$ chính là tổng số cách đến hai ô kề nó. Đây chính là bản chất cốt lõi của Quy hoạch động: *Bài toán lớn được giải bằng cách tổng hợp kết quả từ các bài toán con kề cận.*
    
    Nếu bạn xoay nghiêng lưới DP 45 độ, bạn sẽ thấy các con số điền trên lưới chính là *Tam giác Pascal*.
  ],
  [
    - *Khởi tạo:* $F(0,0) = 1$ (Có 1 cách đứng yên tại gốc). Mọi ô $(i,j)$ có tọa độ âm coi như $F = 0$.
    - *Truy hồi:*
      $ F(i,j) = F(i-1,j) + F(i,j-1) $
    - *Kết quả:* $F(5,3)$.
  ],
  [
    Nhìn vào bảng DP minh họa (Hình bên trái), ta tính từ dưới lên và từ trái qua phải. 
    Ví dụ tại ô $(2,0)$, $F(2,0) = F(1,0) + F(2,-1) = 1 + 0 = 1$.
    Tại ô $(2,1)$, $F(2,1) = F(1,1) + F(2,0) = 2 + 1 = 3$.
    
    Cứ như vậy, giá trị tại ô đích $T(5,3)$ là $56$.
    
    *Kiểm chứng bằng Tổ hợp:*
    Để đi từ $(0,0)$ đến $(5,3)$, robot bắt buộc phải đi chính xác $5$ bước phải và $3$ bước lên. Tổng cộng là $5 + 3 = 8$ bước.
    Trong $8$ bước đó, ta cần "chọn" ra $3$ vị trí để thực hiện bước lên. 
    Số cách chọn chính là Tổ hợp chập 3 của 8:
    $ C_8^3 = (8 times 7 times 6) / (3 times 2 times 1) = 56 $ đường.
  ],
  [$56$ đường đi.]
)

== Cấp độ 2: Không Gian Đứt Gãy (Điểm Cấm)
#master-case(
  2,
  [Lưới có 1 điểm cấm: Ví dụ mồi về bù trừ],
  fig-single-obstacle(),
  [Một robot di chuyển trên lưới từ $S(0,0)$ đến $T(4,4)$. Mỗi bước chỉ sang phải hoặc lên trên. Biết rằng có một hố bom tại $P(2,2)$ không thể đi qua. Hỏi có bao nhiêu đường đi hợp lệ?],
  [
    Đây là bài toán nâng cấp nhẹ từ bài 1. Thay vì tính bằng DP, ta có thể dùng phương pháp phần bù: Tính tổng số đường đi không quan tâm điểm cấm, rồi trừ đi số đường đi *bắt buộc đi qua điểm cấm*.
    
    Vì mọi đường đi qua điểm cấm $P$ đều phải chia làm 2 chặng: $S -> P$ và $P -> T$.
  ],
  [
    - *Khởi tạo & Truy hồi:* Y chang Bài 1, nhưng thêm điều kiện: Nếu ô $(i,j) == (2,2)$ thì $F(i,j) = 0$.
    - *Kết quả DP:* Bảng số bên trái cho kết quả $34$.
  ],
  [
    *Kiểm chứng bằng Toán tổ hợp:*
    - Tổng số đường đi từ $S(0,0)$ đến $T(4,4)$ nếu không có cấm: Đi $4$ phải, $4$ lên => $C_8^4 = 70$.
    - Số đường đi từ $S(0,0)$ đến $P(2,2)$: Đi $2$ phải, $2$ lên => $C_4^2 = 6$.
    - Số đường đi từ $P(2,2)$ đến $T(4,4)$: Đi $2$ phải, $2$ lên => $C_4^2 = 6$.
    - Số đường đi *vi phạm* (đi qua $P$): $6 times 6 = 36$ đường.
    - Số đường đi *hợp lệ*: $70 - 36 = 34$ đường.
  ],
  [$34$ đường đi.]
)

#master-case(
  3,
  [Lưới có nhiều điểm cấm rời rạc: Sức mạnh của bù trừ (Inclusion-Exclusion)],
  fig-grid-obstacle(),
  [Một robot di chuyển trên lưới tọa độ từ điểm $S(0,0)$ đến điểm $T(6,4)$. Tại mỗi bước, robot chỉ được phép đi sang phải (tăng $x$ thêm 1) hoặc đi lên trên (tăng $y$ thêm 1). Trên lưới có hai vật cản tại $P(2,1)$ và $Q(4,3)$, robot không được phép đi qua. Hỏi có bao nhiêu đường đi hợp lệ?],
  [
    Bài toán này có thể giải bằng hai cách hoàn toàn khác nhau nhưng bổ trợ cho nhau rất tốt:
    - *Cách 1 (Quy hoạch động):* Điền số trực tiếp lên lưới. Nếu ô $(i,j)$ là vật cản, ta ép số cách đến đó bằng 0. Ngược lại, số cách đến $(i,j)$ là tổng số cách từ ô bên trái và ô bên dưới. Cách này rất dễ code (chỉ 2 vòng lặp) và trực quan (như hình vẽ bên trái).
    - *Cách 2 (Toán tổ hợp & Bù trừ):* Số đường đi từ $(0,0)$ đến $(x,y)$ không có vật cản là $C_(x+y)^x$. Khi có 2 vật cản, ta có thể lấy tổng số đường đi trừ đi những đường vi phạm. Vì lưới chỉ đi theo một chiều tiến, nếu đi qua cả $P$ và $Q$, robot bắt buộc phải đi $P -> Q$.
  ],
  [
    Để lập trình bảng DP, gọi $F(i, j)$ là số đường đi hợp lệ từ $(0,0)$ đến $(i,j)$.
    - *Khởi tạo:* $F(0,0) = 1$. Mọi ô $(i,j)$ bên ngoài lưới có $F = 0$.
    - *Truy hồi:*
      $ F(i,j) = cases(
        0 & "nếu" (i,j) in {P, Q},
        F(i-1,j) + F(i,j-1) & "nếu ngược lại"
      ) $
    - *Kết quả:* $F(6,4)$.
  ],
  [
    Bảng DP minh họa (Hình bên trái) đã cho thấy kết quả tại $T(6,4)$ là $54$. Sau đây ta sẽ kiểm chứng lại bằng phương pháp Tổ hợp và Bù trừ:
    
    *Bước 1: Tính các tổ hợp cơ bản*
    - Tổng số đường từ $S -> T$: Đi $6$ bước phải, $4$ bước lên => $C_{10}^4 = 210$ đường.
    - Đi qua $P$: $S -> P$ ($C_3^1=3$) nhân với $P -> T$ ($C_7^3=35$) => $3 times 35 = 105$ đường.
    - Đi qua $Q$: $S -> Q$ ($C_7^3=35$) nhân với $Q -> T$ ($C_3^1=3$) => $35 times 3 = 105$ đường.
    - Đi qua cả $P$ và $Q$: $S -> P -> Q -> T$. 
      - $S -> P$: $C_3^1 = 3$
      - $P(2,1) -> Q(4,3)$: đi 2 phải, 2 lên => $C_4^2 = 6$
      - $Q -> T$: $C_3^1 = 3$
      => $3 times 6 times 3 = 54$ đường.

    *Bước 2: Dùng nguyên lý Bù trừ (Inclusion-Exclusion Principle)*
    Gọi $A$ là tập các đường đi qua $P$, $B$ là tập các đường đi qua $Q$.
    Số đường đi vi phạm (qua ít nhất 1 điểm cấm) là:
    $ |A union B| = |A| + |B| - |A inter B| = 105 + 105 - 54 = 156 $ đường.
    
    Số đường đi hợp lệ là:
    $ "Tổng" - |A union B| = 210 - 156 = 54 $ đường.
    
    *Nhận xét:* Cách DP có độ phức tạp $O(X \cdot Y)$, phù hợp với lưới nhỏ hoặc nhiều vật cản. Cách Tổ hợp có độ phức tạp $O(K^2)$ (với $K$ là số điểm cấm), cực kỳ mạnh khi kích thước lưới khổng lồ (VD: $10^9$) nhưng số lượng điểm cấm ít (VD: $K < 2000$).
  ],
  [$54$ đường đi.]
)

#master-case(
  4,
  [Vùng cấm diện rộng (Hồ nước): Khi Bù Trừ chịu thua],
  fig-lake-obstacle(),
  [Robot đi từ $S(0,0)$ đến $T(6,5)$ (chỉ phải/lên). Ở giữa lưới có một hồ nước hình chữ nhật chắn ngang, chiếm các ô $(2,2), (3,2), (2,3), (3,3)$. Hỏi có bao nhiêu đường đi hợp lệ?],
  [
    Khi điểm cấm không còn rời rạc mà tạo thành một vùng rộng lớn, phương pháp Tổ hợp Bù Trừ (Inclusion-Exclusion) sẽ trở thành ác mộng vì có quá nhiều tập hợp vi phạm giao nhau! 
    Lúc này, Quy hoạch động (DP) thể hiện sức mạnh tuyệt đối: Ta không cần quan tâm hồ nước to thế nào, chỉ cần gán $F(i,j) = 0$ cho mọi ô thuộc hồ nước là xong.
  ],
  [
    - *Khởi tạo:* $F(0,0) = 1$. 
    - *Truy hồi:*
      $ F(i,j) = cases(
        0 & "nếu" 2 <= i <= 3 "và" 2 <= j <= 3,
        F(i-1,j) + F(i,j-1) & "nếu ngược lại"
      ) $
  ],
  [
    Cách DP xử lý bài này vô cùng lạnh lùng và mượt mà:
    - Bất cứ khi nào robot định bước chân vào vùng hồ nước, giá trị cộng dồn bị ép về $0$.
    - Những ô ở rìa ngoài hồ nước chỉ nhận được số cách từ những hướng không bị cấm.
    - Nhìn vào hình vẽ, các ô xám có giá trị $0$. Các ô viền quanh hồ nước vẫn tự động nhặt các con số từ dưới lên hoặc từ trái qua để duy trì dòng chảy.
    - Tại đích $T(6,5)$, tổng số đường đi là $112$. 
    
    Hãy thử tưởng tượng bạn phải dùng Bù Trừ cho 4 điểm cấm này ($|A union B union C union D|$), bạn sẽ phải tính 15 thành phần giao nhau! Rõ ràng, khi hình học phức tạp, DP là cứu cánh hoàn hảo.
  ],
  [$112$ đường đi.]
)

== Cấp độ 3: Tư Duy Phân Rã & Trạm Trung Chuyển (Checkpoints)

#master-case(
  5,
  [Bắt buộc qua 1 trạm trung chuyển (Ví dụ mồi)],
  fig-single-checkpoint(),
  [Một robot đi từ $S(0,0)$ đến $T(5,4)$ trên lưới, mỗi bước chỉ sang phải hoặc lên trên. Biết rằng trên đường đi, robot *bắt buộc* phải ghé qua trạm tiếp tế $P(2,2)$. Hỏi có bao nhiêu đường đi thỏa mãn?],
  [
    Khi bắt buộc đi qua $P$, hành trình từ $S$ đến $T$ bị gãy làm đôi: $S -> P$ và $P -> T$.
    Theo Quy tắc nhân, vì cách chọn đường cho chặng 1 độc lập hoàn toàn với cách chọn đường cho chặng 2, tổng số cách bằng số cách của chặng 1 nhân với số cách chặng 2.
  ],
  [
    Trên hình vẽ, lưới bị giới hạn trong hai hình chữ nhật kề nhau ở đỉnh $P$. Tất cả những ô bên ngoài 2 hình chữ nhật này đều không có giá trị, vì đi vào đó chắc chắn sẽ lỡ mất $P$ hoặc đi ngược hướng $T$.
  ],
  [
    Nhìn bảng DP, ta tính DP từ $S(0,0)$ đến $P(2,2)$ được $6$ cách.
    Từ $P$ đi tiếp, ta coi $P$ là điểm xuất phát mới với giá trị khởi tạo là $6$.
    Tại ô đích $T(5,4)$, giá trị DP đạt $60$.
    
    *Kiểm chứng bằng Toán tổ hợp:*
    - Chặng $S -> P$: $C_4^2 = 6$.
    - Chặng $P -> T$: đi từ $(2,2)$ đến $(5,4)$ tức là $Delta x=3, Delta y=2$. Chọn 2 bước lên trong 5 bước: $C_5^2 = 10$.
    - Tổng số đường: $6 times 10 = 60$ đường.
  ],
  [$60$ đường đi.]
)

#master-case(
  6,
  [Lưới bắt buộc qua nhiều trạm: Bounding Box nhiều chặng],
  fig-checkpoints(),
  [Một robot đi từ $S(0,0)$ đến $T(7,5)$ trên lưới, mỗi bước chỉ sang phải hoặc lên trên. Biết rằng trên đường đi, robot *bắt buộc* phải tạt qua trạm tiếp tế $P(2,2)$ và trạm thu phí $Q(5,3)$. Hỏi có bao nhiêu đường đi thỏa mãn?],
  [
    Bài toán yêu cầu đi qua $P$ rồi $Q$. Trước hết, ta cần kiểm tra xem $P$ có "nằm trước" $Q$ hay không ($x_P <= x_Q$ và $y_P <= y_Q$). Ở đây tọa độ thỏa mãn.
    
    Tư duy cốt lõi ở đây là *Phân rã (Decomposition)*. Bất kỳ đường đi hợp lệ nào cũng bắt buộc chia làm 3 chặng độc lập: $S -> P$, $P -> Q$, và $Q -> T$. Việc chọn đường ở một chặng hoàn toàn không ảnh hưởng đến chặng khác. Do đó, theo Quy tắc nhân, tổng số cách là tích của số cách trên từng chặng. 
    
    Trong hình vẽ bên trái, ta thấy lưới đã bị "ép" thành 3 hình chữ nhật con (Bounding Boxes) nối tiếp nhau. Mọi ô nằm ngoài 3 hình chữ nhật này đều là "Vùng chết" (Số cách bằng 0).
  ],
  [
    Nếu lập trình giải bài này bằng Quy hoạch động, ta tính mảng $F(i,j)$ bình thường, nhưng với điều kiện lọc gắt gao:
    - Nếu ô $(i,j)$ không nằm trong 3 hình chữ nhật bao $(S,P)$, $(P,Q)$ hoặc $(Q,T)$, ta gán $F(i,j) = 0$.
    - Hoặc cách code thanh lịch hơn: Chạy 3 vòng lặp DP nối tiếp nhau:
      - DP từ $S -> P$.
      - DP từ $P -> Q$ (với khởi tạo điểm đầu chính là $P$ mang giá trị $F(P)$ vừa tính).
      - DP từ $Q -> T$.
  ],
  [
    Trong hình bên trái, các con số DP đã được điền lên lưới. Chú ý các vùng xám có giá trị 0 vì đó là các vùng không thể đặt chân tới nếu muốn tuân thủ luật "buộc đi qua $P, Q$".
    Giá trị DP tích lũy tại $P$ là $6$, tại $Q$ là $24$ và tại $T$ là $144$.

    Để tính nhanh bằng tay, ta sử dụng Toán tổ hợp cho 3 chặng độc lập:
    
    *Chặng 1: Từ $S(0,0)$ đến $P(2,2)$*
    - Robot đi $Delta x = 2 - 0 = 2$, $Delta y = 2 - 0 = 2$.
    - Số bước là 4. Số cách: $C_4^2 = 6$.

    *Chặng 2: Từ $P(2,2)$ đến $Q(5,3)$*
    - Tịnh tiến gốc tọa độ về $P$, bài toán trở thành đi từ $(0,0)$ đến $(5-2, 3-2) = (3,1)$.
    - Đi $Delta x = 3$, $Delta y = 1$. Tổng 4 bước.
    - Số cách: $C_4^3 = 4$. (Tích lũy đến $Q$: $6 times 4 = 24$, hoàn toàn khớp với hình vẽ).

    *Chặng 3: Từ $Q(5,3)$ đến $T(7,5)$*
    - Khoảng cách: $Delta x = 7 - 5 = 2$, $Delta y = 5 - 3 = 2$.
    - Tổng 4 bước. Số cách: $C_4^2 = 6$.

    *Áp dụng quy tắc nhân:* 
    Vì các chặng độc lập, tổng số đường đi là: 
    $ 6 times 4 times 6 = 144 $ đường.
  ],
  [$144$ đường đi.]
)

== Cấp độ 4: Giới Hạn Không Gian Kép (Biên Động)

#master-case(
  7,
  [Đi không vượt đường chéo: Số Catalan & Nguyên lý phản xạ (Reflection)],
  fig-catalan(),
  [Đi từ gốc $S(0,0)$ đến $T(6,4)$ bằng các bước sang phải hoặc lên trên. Biết rằng ở mọi thời điểm, tọa độ hiện tại $(x,y)$ luôn phải thỏa mãn điều kiện $x >= y$. Hỏi có bao nhiêu đường đi hợp lệ?],
  [
    Đây là bài toán kinh điển sinh ra chuỗi *Số Catalan*. Rất nhiều bài toán thực tế có bản chất là bài toán này:
    - Trích xuất chuỗi ngoặc đúng (Số ngoặc mở $x$ luôn $>=$ số ngoặc đóng $y$).
    - Bán vé xem phim (Người cầm tờ 50k luôn $>=$ người cầm tờ 100k để có tiền thối lại).
    
    Tư duy cốt lõi ở đây là đếm số lượng đường đi *Vi phạm*. Một đường đi vi phạm là đường lần đầu tiên chạm vào đường thẳng $y = x + 1$ (vượt quá phân giác 1 đơn vị). Nếu ta lấy phần đường đi từ điểm chạm đó đến đích $T$ rồi phản xạ (lấy đối xứng) qua trục $y = x + 1$, điểm đích $T(6,4)$ sẽ biến thành $T'(4-1, 6+1) = (3,7)$. 
    Do đó, số đường đi vi phạm *bằng đúng* số đường đi tự do từ $S(0,0)$ đến $T'(3,7)$.
  ],
  [
    Nếu giải bằng Quy hoạch động $F(x,y)$:
    - *Khởi tạo:* $F(0,0) = 1$. Mọi ô $(x,y)$ có $y > x$ đều gán $F(x,y) = 0$.
    - *Truy hồi:*
      $ F(x,y) = cases(
        0 & "nếu" y > x,
        F(x-1,y) + F(x,y-1) & "nếu" y <= x
      ) $
    - *Kết quả:* $F(6,4)$. Bảng DP minh họa cho thấy kết quả là $90$.
  ],
  [
    Trong hình vẽ bên trái, các ô màu xám (nằm trên đường phân giác $y=x$) bị cấm hoàn toàn nên có số cách bằng 0. Giá trị dồn lên dần tới ô $(6,4)$ cho kết quả $90$.
    
    Bây giờ ta sẽ chứng minh bằng *Nguyên lý phản xạ (Reflection Principle)*:
    
    *Bước 1: Tính tổng số đường đi tự do (không điều kiện)*
    - Để đi từ $(0,0)$ đến $(6,4)$, cần tổng cộng $10$ bước ($6$ phải, $4$ lên).
    - Tổng số đường đi là: $C_{10}^4 = 210$.

    *Bước 2: Tìm số đường đi vi phạm (bị phản xạ)*
    - Điều kiện vi phạm là chạm vào đường thẳng cấm $y = x + 1$.
    - Lấy điểm đích $T(6,4)$ đối xứng qua đường $y = x + 1$. Điểm đối xứng có tọa độ $T'(y_T - 1, x_T + 1) = (4 - 1, 6 + 1) = (3, 7)$.
    - Số đường đi từ $(0,0)$ đến $(3,7)$ chính là số đường đi vi phạm: $C_{10}^3 = 120$.

    *Bước 3: Trừ đi số đường vi phạm*
    - Đường đi hợp lệ = Tổng số đường - Đường đi vi phạm
    - $210 - 120 = 90$ đường đi.
    
    *Nhận xét:* 
    Công thức tổng quát cho bài toán $N times N$ là số Catalan thứ $N$: $C_N = 1 / (N+1) C_{2N}^N$. Phương pháp phản xạ đưa $O(X times Y)$ của DP về $O(1)$ của công thức Tổ hợp!
  ],
  [$90$ đường đi lệ.]
)

#master-case(
  8,
  [Đường chéo bị dịch chuyển: Mở rộng Nguyên lý phản xạ],
  fig-catalan-shift(),
  [Đi từ gốc $S(0,0)$ đến $T(6,5)$ bằng các bước sang phải hoặc lên trên. Tại mọi thời điểm, tọa độ hiện tại $(x,y)$ luôn phải thỏa mãn điều kiện $x >= y - 1$. Hỏi có bao nhiêu đường đi hợp lệ?],
  [
    Khác với bài Catalan cơ bản (giới hạn $x >= y$), ở bài này đường ranh giới đã được "nới lỏng" ra một chút: $y <= x + 1$.
    Tuy nhiên, triết lý phản xạ (Reflection) vẫn hoàn toàn đúng! Ta chỉ cần đi tìm đường thẳng *Vi phạm đầu tiên*.
    Nếu điều kiện là $y <= x + 1$, thì đường vi phạm sẽ là $y = x + 2$. Bất cứ khi nào robot chạm vào đường $y = x + 2$, đường đi đó bị coi là hỏng.
  ],
  [
    Nếu code DP, ta chỉ cần sửa lại một chút ở điều kiện:
    - *Khởi tạo:* $F(0,0) = 1$. Mọi ô $(x,y)$ có $y > x + 1$ đều gán $F(x,y) = 0$.
    - *Truy hồi:*
      $ F(x,y) = cases(
        0 & "nếu" y > x + 1,
        F(x-1,y) + F(x,y-1) & "nếu" y <= x + 1
      ) $
    - *Kết quả:* $F(6,5)$. 
  ],
  [
    Nhìn vào bảng DP, các ô nằm trên đường vi phạm $y = x + 2$ (màu xám) đều bị triệt tiêu về $0$. Dòng chảy DP tiếp tục dồn lên $T(6,5)$ và cho kết quả là $297$.
    
    *Tính toán bằng Nguyên lý phản xạ:*
    - *Bước 1:* Tổng số đường đi tự do từ $(0,0)$ đến $(6,5)$: Đi $6$ phải, $5$ lên $->$ $C_{11}^5 = 462$ đường.
    - *Bước 2:* Lấy điểm $T(6,5)$ phản xạ qua đường thẳng vi phạm $y = x + 2$. 
      Công thức phản xạ qua $y = x + k$ là $(x', y') = (y - k, x + k)$.
      Suy ra điểm đối xứng là $T'(5 - 2, 6 + 2) = T'(3, 8)$.
    - *Bước 3:* Đếm số đường đi vi phạm (bằng số đường từ gốc đến $T'$). 
      Đi từ $(0,0)$ đến $(3,8)$ tốn $11$ bước $->$ $C_{11}^3 = 165$ đường.
    - *Bước 4:* Trừ đi phần vi phạm: $462 - 165 = 297$ đường.
  ],
  [$297$ đường đi.]
)

#case-card(
  4,
  [Robot đổi hướng đúng 3 lần],
  fig-turns(),
  [Robot đi từ $(0,0)$ đến $(5,3)$ bằng $5$ bước phải và $3$ bước lên. Hỏi có bao nhiêu đường đi đổi hướng đúng $3$ lần?],
  [Không thể chỉ dùng $F(i,j)$, vì cần biết hướng trước đó và số lần đổi hướng. Cách đếm nhanh là chia chuỗi bước thành $4$ đoạn liên tiếp cùng hướng.],
  [
    *Bước 1.* Đổi hướng đúng $3$ lần nghĩa là có $4$ run.

    *Bước 2.* Nếu bắt đầu bằng phải, dạng là $R^a U^b R^c U^d$, với $a+c=5$, $b+d=3$, các số dương. Có $C_4^1 dot C_2^1 = 8$ cách.

    *Bước 3.* Nếu bắt đầu bằng lên, dạng là $U^a R^b U^c R^d$. Cũng có $C_2^1 dot C_4^1=8$ cách.

    *Bước 4.* Tổng $8+8=16$.
  ],
  [$16$ đường đi.]
)

#case-card(
  5,
  [Đường đi có tổng trọng số chia hết cho 4],
  fig-mod-grid(),
  [Trên bảng $4 times 4$, ô $(i,j)$ có trọng số $i j mod 4$. Đi từ góc trái dưới đến góc phải trên, chỉ sang phải hoặc lên. Đếm số đường có tổng trọng số các ô đi qua chia hết cho $4$.],
  [Phải thêm phần dư vào trạng thái: $F(i,j,r)$ là số đường tới ô $(i,j)$ có tổng trọng số dư $r$ modulo $4$.],
  [
    *Bước 1.* Khởi tạo tại ô đầu: phần dư bằng trọng số ô đầu.

    *Bước 2.* Khi đi vào ô $(i,j)$ có trọng số $w$, mọi đường từ trái hoặc dưới với dư $r$ chuyển thành dư $(r+w) mod 4$.

    *Bước 3.* Công thức:
    $F(i,j,(r+w) mod 4) += F(i-1,j,r) + F(i,j-1,r)$.

    *Bước 4.* Tính hết bảng cho ta tại ô đích: số đường có dư $0$ là $14$.
  ],
  [$14$ đường đi.]
)

= Phần II - Một Chiều Thời Gian: Bậc Thang, Nhảy, Chuỗi

#case-card(
  6,
  [Leo cầu thang có bậc bị khóa],
  fig-stairs(),
  [Leo từ bậc $0$ lên bậc $10$, mỗi lần nhảy $1,2,3$ bậc. Không được đặt chân lên bậc $5$. Hỏi có bao nhiêu cách?],
  [$F(n)$ là số cách tới bậc $n$. Vì bậc $5$ bị khóa nên ép $F(5)=0$. Đây là bài Fibonacci bậc ba có biên bị gãy.],
  [
    *Bước 1.* $F(0)=1$. Với $n>0$, nếu $n != 5$ thì
    $F(n)=F(n-1)+F(n-2)+F(n-3)$, các chỉ số âm xem bằng $0$.

    *Bước 2.* Tính lần lượt:
    $F(1)=1$, $F(2)=2$, $F(3)=4$, $F(4)=7$, $F(5)=0$.

    *Bước 3.* Sau bậc khóa:
    $F(6)=F(5)+F(4)+F(3)=11$,
    $F(7)=18$, $F(8)=29$, $F(9)=58$, $F(10)=105$.
  ],
  [$105$ cách.]
)

#case-card(
  7,
  [Ếch nhảy trên các mốc đá],
  fig-frog(),
  [Các mốc đá đánh số từ $0$ đến $12$. Mỗi lần ếch nhảy thêm $2,3$ hoặc $5$ đơn vị. Không được đáp xuống mốc $7$. Hỏi có bao nhiêu cách đến mốc $12$?],
  [Đây là quy hoạch động trên đường thẳng nhưng tập bước không liên tiếp. Đặt $F(n)$ là số cách đáp đúng mốc $n$.],
  [
    *Bước 1.* $F(0)=1$, $F(n)=0$ với $n<0$.

    *Bước 2.* Nếu $n=7$ thì $F(7)=0$. Nếu không:
    $F(n)=F(n-2)+F(n-3)+F(n-5)$.

    *Bước 3.* Dãy giá trị từ $0$ đến $12$ là:
    $1,0,1,1,1,3,2,0,6,3,9,11,12$.
  ],
  [$F(12)=12$ cách.]
)

#case-card(
  8,
  [Đếm đường đi trên DAG],
  fig-dag(),
  [Cho đồ thị có hướng như hình. Đếm số đường đi từ đỉnh $0$ đến đỉnh $6$.],
  [DAG là hình thức tổng quát của mọi bài đếm đường đi đơn điệu. Sắp đỉnh theo thứ tự topo rồi cộng số cách từ các đỉnh trước.],
  [
    *Bước 1.* Đặt $F(v)$ là số đường từ $0$ tới $v$. Khởi tạo $F(0)=1$.

    *Bước 2.* Lan truyền theo cung:
    $F(1)=1$, $F(2)=1$;
    $F(3)=F(1)+F(2)=2$;
    $F(5)=F(2)=1$;
    $F(4)=F(1)+F(5)=2$.

    *Bước 3.* Đỉnh $6$ nhận từ $3,4,5$, nên
    $F(6)=2+2+1=5$.
  ],
  [$5$ đường đi.]
)

#case-card(
  9,
  [Đếm xâu nhị phân tránh mẫu 101],
  fig-dfa101(),
  [Có bao nhiêu xâu nhị phân độ dài $10$ không chứa mẫu liên tiếp $101$?],
  [Cần nhớ phần đuôi dài nhất đang trùng với tiền tố của mẫu $101$. Ba trạng thái an toàn là: chưa khớp gì, khớp $1$, khớp $10$.],
  [
    *Bước 1.* Gọi véc-tơ sau $n$ ký tự là $(a_n,b_n,c_n)$ ứng với ba trạng thái $0,1,10$.

    *Bước 2.* Chuyển trạng thái:
    từ $0$: thêm $0$ về $0$, thêm $1$ sang $1$;
    từ $1$: thêm $1$ vẫn ở $1$, thêm $0$ sang $10$;
    từ $10$: thêm $0$ về $0$, thêm $1$ thì hỏng.

    *Bước 3.* Bắt đầu $(1,0,0)$. Sau $10$ ký tự thu được $(114,151,86)$.
  ],
  [$114+151+86=351$ xâu.]
)

#case-card(
  10,
  [Đếm xâu không có ba số 0 liên tiếp],
  fig-run-zero(),
  [Có bao nhiêu xâu nhị phân độ dài $10$ không chứa $000$?],
  [Trạng thái chỉ cần nhớ cuối xâu đang có bao nhiêu số $0$ liên tiếp: $0,1,2$. Thêm $1$ đưa về trạng thái $0$; thêm $0$ làm tăng trạng thái, nhưng không được từ $2$ lên $3$.],
  [
    *Bước 1.* Đặt $(a_n,b_n,c_n)$ lần lượt là số xâu dài $n$ kết thúc bởi $1$, bởi đúng một $0$, bởi đúng hai $0$.

    *Bước 2.* Công thức:
    $a_(n+1)=a_n+b_n+c_n$, $b_(n+1)=a_n$, $c_(n+1)=b_n$.

    *Bước 3.* Từ $(1,0,0)$, sau $10$ bước nhận $(274,149,81)$.
  ],
  [$274+149+81=504$ xâu.]
)

= Phần III - Đổi Tiền Và Lát Gạch: DP Cần Chống Đếm Trùng

#case-card(
  11,
  [Đổi tiền không phân biệt thứ tự],
  fig-coins(),
  [Có các đồng $2,3,5$. Hỏi có bao nhiêu cách tạo tổng $12$, không phân biệt thứ tự các đồng?],
  [Nếu duyệt tổng trước rồi duyệt đồng, ta sẽ đếm hoán vị. Muốn đếm tổ hợp, phải duyệt từng loại đồng ở vòng ngoài.],
  [
    *Bước 1.* Đặt $F(s)$ là số cách tạo tổng $s$ bằng các đồng đã xét. Khởi tạo $F(0)=1$.

    *Bước 2.* Sau đồng $2$, chỉ các tổng chẵn có $1$ cách.

    *Bước 3.* Thêm đồng $3$, cập nhật $F(s)+=F(s-3)$ với $s$ tăng dần. Sau đó thêm đồng $5$ tương tự.

    *Bước 4.* Dòng cuối cho $F(12)=5$.
  ],
  [$5$ cách: $2^6$, $2^3 3^2$, $2 5^2$, $3^4$, $2^2 3 5$.]
)

#case-card(
  12,
  [Lát bảng $2 times n$ bằng domino],
  fig-domino2(),
  [Có bao nhiêu cách lát bảng $2 times 8$ bằng các domino $1 times 2$?],
  [Nhìn cột cuối: hoặc đặt một domino dọc chiếm cột cuối, hoặc đặt hai domino ngang nối hai cột cuối.],
  [
    *Bước 1.* Gọi $F(n)$ là số cách lát bảng $2 times n$.

    *Bước 2.* Nếu cột cuối lát dọc, còn lại $2 times (n-1)$: $F(n-1)$ cách.

    *Bước 3.* Nếu hai ô cột cuối được lát ngang, bắt buộc dùng hai domino ngang, còn lại $2 times (n-2)$: $F(n-2)$ cách.

    *Bước 4.* $F(0)=1$, $F(1)=1$, nên $F(8)=34$.
  ],
  [$34$ cách.]
)

#case-card(
  13,
  [Lát bảng $3 times 4$ bằng profile DP],
  fig-profile(),
  [Có bao nhiêu cách lát bảng $3 times 4$ bằng domino $1 times 2$?],
  [Bảng cao $3$, quét từng cột. Mask ba bit cho biết ô nào của cột hiện tại đã bị domino ngang từ cột trước chiếm.],
  [
    *Bước 1.* Trạng thái $F(c,m)$: sau khi xử lý tới cột $c$, cột kế tiếp đang có mặt nạ $m$.

    *Bước 2.* Với mỗi mask, ta thử lấp các ô trống trong cột hiện tại bằng domino dọc hoặc domino ngang sang cột sau.

    *Bước 3.* Bảng chuyển chính:
    từ $000$ có thể sang $100$, $001$, $111$;
    từ $001$ sang $000$, $110$;
    từ $100$ sang $000$, $011$; ...

    *Bước 4.* Sau $4$ cột, số cách hợp lệ là hệ số ở mask $000$, bằng $11$.
  ],
  [$11$ cách.]
)

= Phần IV - Tối Ưu, Ngân Sách Và Bảng Hai Chiều

#case-card(
  14,
  [Đường đi giới hạn năng lượng],
  fig-energy(),
  [Trên bảng $4 times 4$ như hình, mỗi ô có chi phí. Đi từ góc trái dưới tới góc phải trên, chỉ sang phải hoặc lên. Đếm số đường có tổng chi phí không vượt quá $12$.],
  [Không thể chỉ đếm theo vị trí vì hai đường tới cùng một ô nhưng dùng năng lượng khác nhau có tương lai khác nhau. Trạng thái là $F(i,j,e)$.],
  [
    *Bước 1.* $F(i,j,e)$ là số cách tới ô $(i,j)$ với tổng chi phí đúng $e$.

    *Bước 2.* Khi vào ô mới có chi phí $w$, cập nhật:
    $F(i,j,e+w)+=F(i-1,j,e)+F(i,j-1,e)$.

    *Bước 3.* Chỉ giữ $e<=12$ để bảng không phình vô hạn.

    *Bước 4.* Cộng các $F(3,3,e)$ với $e<=12$ được $14$.
  ],
  [$14$ đường đi.]
)

#case-card(
  15,
  [Tam giác số: vừa tối ưu vừa đếm số cách đạt tối ưu],
  fig-triangle(),
  [Trong tam giác số như hình, đi từ đỉnh xuống đáy, mỗi bước xuống trái hoặc xuống phải. Tìm tổng lớn nhất và số đường đạt tổng lớn nhất.],
  [Mỗi ô cần lưu hai thông tin: tổng tốt nhất tới ô đó và số cách đạt tổng ấy. Đây là mẫu “max kèm count”.],
  [
    *Bước 1.* Với mỗi ô, xét hai ô cha ở hàng trên.

    *Bước 2.* Giá trị tốt nhất là số trong ô cộng với max của hai cha. Nếu hai cha cùng cho max thì cộng số cách; nếu một cha tốt hơn thì lấy số cách của cha đó.

    *Bước 3.* Tính từ trên xuống, hàng cuối có giá trị tốt nhất lớn nhất là $29$.

    *Bước 4.* Chỉ có một đường đạt tổng $29$.
  ],
  [Tổng lớn nhất $29$, có $1$ đường đạt.]
)

#case-card(
  16,
  [Khoảng cách sửa xâu: bảng đi từ trái-trên],
  fig-edit(),
  [Tìm số phép sửa ít nhất để biến xâu `SANG` thành xâu `MATH`. Một phép là chèn, xóa hoặc thay một ký tự.],
  [Trạng thái $D(i,j)$ là khoảng cách sửa ít nhất giữa tiền tố độ dài $i$ của xâu thứ nhất và tiền tố độ dài $j$ của xâu thứ hai.],
  [
    *Bước 1.* Biên: $D(i,0)=i$, $D(0,j)=j$.

    *Bước 2.* Nếu hai ký tự cuối bằng nhau, đi chéo không mất phí. Nếu khác nhau, lấy min của ba phép:
    xóa, chèn, thay.

    *Bước 3.* Công thức:
    $D(i,j)=min(D(i-1,j)+1, D(i,j-1)+1, D(i-1,j-1)+c)$,
    trong đó $c=0$ nếu hai ký tự cuối giống nhau, $c=1$ nếu khác.

    *Bước 4.* Bảng cuối cho $D(4,4)=3$.
  ],
  [$3$ phép sửa.]
)

#case-card(
  17,
  [Dãy con chung dài nhất],
  fig-lcs(),
  [Tìm độ dài dãy con chung dài nhất của `SANGMATH` và `MATH`.],
  [LCS là DP hai chiều. Khi hai ký tự cuối khớp thì đi chéo tăng $1$; khi không khớp thì bỏ một ký tự ở một trong hai xâu.],
  [
    *Bước 1.* Đặt $L(i,j)$ là LCS của hai tiền tố.

    *Bước 2.* Nếu $x_i=y_j$ thì $L(i,j)=L(i-1,j-1)+1$.

    *Bước 3.* Nếu khác nhau thì $L(i,j)=max(L(i-1,j),L(i,j-1))$.

    *Bước 4.* Vì `MATH` xuất hiện liên tiếp ở cuối `SANGMATH`, bảng cho $L(8,4)=4$.
  ],
  [Độ dài LCS là $4$.]
)

#case-card(
  18,
  [Đi bộ sau đúng số bước],
  fig-walk-line(),
  [Một hạt bắt đầu ở điểm $0$ trên đoạn $0-1-2-3$. Mỗi giây đi sang một điểm kề nếu có. Hỏi sau đúng $8$ bước có bao nhiêu cách đứng ở điểm $2$?],
  [Đây là DP theo thời gian trên đồ thị nhỏ. Trạng thái $F(t,v)$ là số cách ở đỉnh $v$ sau $t$ bước.],
  [
    *Bước 1.* $F(0,0)=1$, các đỉnh khác bằng $0$.

    *Bước 2.* Với mỗi bước thời gian:
    $F(t+1,v)=sum F(t,u)$ với $u$ kề $v$.

    *Bước 3.* Tính lần lượt tới $t=8$ trên bốn đỉnh. Cột cuối nhận được số cách ở đỉnh $2$ bằng $21$.
  ],
  [$21$ cách.]
)

= Phần V - Cây, Bitmask, Xác Suất, Khoảng

#case-card(
  19,
  [Đếm tập độc lập trên cây],
  fig-tree(),
  [Với cây như hình, đếm số tập đỉnh sao cho không có hai đỉnh kề nhau cùng được chọn.],
  [DP trên cây: mỗi đỉnh có hai trạng thái, chọn hoặc không chọn. Con độc lập sau khi biết trạng thái của cha.],
  [
    *Bước 1.* Gọi $A(v)$ là số cách trong cây con của $v$ khi chọn $v$, $B(v)$ là số cách khi không chọn $v$.

    *Bước 2.* Nếu chọn $v$, các con không được chọn:
    $A(v)=product_u B(u)$.

    *Bước 3.* Nếu không chọn $v$, mỗi con được chọn hoặc không:
    $B(v)=product_u (A(u)+B(u))$.

    *Bước 4.* Với cây hình vẽ: tại gốc $1$, ta được $A(1)=8$, $B(1)=30$.
  ],
  [$8+30=38$ tập độc lập.]
)

#case-card(
  20,
  [Ghép cặp hoàn hảo bằng bitmask],
  fig-match(),
  [Có bốn học sinh $A,B,C,D$ và bốn nhiệm vụ $1,2,3,4$. Các cạnh cho biết học sinh làm được nhiệm vụ nào. Đếm số cách phân công mỗi học sinh đúng một nhiệm vụ và mỗi nhiệm vụ dùng một lần.],
  [Xử lý học sinh theo thứ tự. Mask biểu diễn tập nhiệm vụ đã dùng. Trạng thái $F(i,m)$ là số cách phân công cho $i$ học sinh đầu với mask $m$.],
  [
    *Bước 1.* Khởi tạo $F(0,0000)=1$.

    *Bước 2.* Khi xét học sinh thứ $i$, thử mọi nhiệm vụ $j$ mà bạn ấy làm được và chưa có trong mask.

    *Bước 3.* Cập nhật $F(i+1,m union {j}) += F(i,m)$.

    *Bước 4.* Với hình này chỉ có hai phân công hoàn hảo:
    $A-1,B-2,C-4,D-3$ và $A-2,B-3,C-1,D-4$.
  ],
  [$2$ cách.]
)

#case-card(
  21,
  [Xác suất chạm biên phải trước biên trái],
  fig-gambler(),
  [Một hạt ở trạng thái $2$ trong dãy $0,1,2,3,4$. Trạng thái $0$ và $4$ là hấp thụ. Ở mỗi bước, hạt đi sang phải với xác suất $0.6$, sang trái với xác suất $0.4$. Tính xác suất chạm $4$ trước $0$.],
  [Đây là DP dạng phương trình truy hồi xác suất. Trạng thái không phải số cách mà là xác suất thắng từ vị trí hiện tại.],
  [
    *Bước 1.* Gọi $p_i$ là xác suất chạm $4$ trước $0$ khi đang ở $i$.
    Biên: $p_0=0$, $p_4=1$.

    *Bước 2.* Với $i=1,2,3$:
    $p_i=0.6 p_(i+1)+0.4 p_(i-1)$.

    *Bước 3.* Giải hệ hoặc dùng công thức sai phân bậc hai:
    $p_i = (1-(2/3)^i)/(1-(2/3)^4)$.

    *Bước 4.* Tại $i=2$:
    $p_2 = (1-4/9)/(1-16/81)=45/65=9/13$.
  ],
  [$9/13$.]
)

#case-card(
  22,
  [Tam giác hóa đa giác: interval DP],
  fig-polygon(),
  [Một lục giác có trọng số đỉnh lần lượt $2,3,1,5,4,6$. Chi phí của một tam giác bằng tích trọng số ba đỉnh. Tìm chi phí nhỏ nhất để tam giác hóa lục giác.],
  [Trạng thái là đoạn đỉnh liên tiếp. Chọn đỉnh $k$ làm tam giác cuối cùng trong đoạn $(i,j)$, rồi chia thành hai đoạn nhỏ.],
  [
    *Bước 1.* Đặt $D(i,j)$ là chi phí nhỏ nhất để tam giác hóa đa giác con từ đỉnh $i$ đến $j$.

    *Bước 2.* Nếu $j-i<2$ thì $D(i,j)=0$; nếu có đúng ba đỉnh thì chỉ có một tam giác.

    *Bước 3.* Với $j-i>=2$:
    $D(i,j)=min_k (D(i,k)+D(k,j)+w_i w_k w_j)$.

    *Bước 4.* Tính theo độ dài đoạn tăng dần cho lục giác trên được $D(0,5)=62$.
  ],
  [Chi phí nhỏ nhất là $62$.]
)

#case-card(
  23,
  [Ba lô 0-1: chọn vật dưới sức chứa],
  fig-knapsack(),
  [Có bốn vật với $("khối lượng", "giá trị")$ lần lượt là $(2,3),(3,4),(4,5),(5,8)$. Sức chứa túi là $6$. Tìm giá trị lớn nhất.],
  [Trạng thái $F(i,w)$ là giá trị lớn nhất khi xét $i$ vật đầu và sức chứa còn/đã dùng là $w$. Mỗi vật có hai lựa chọn: bỏ hoặc lấy.],
  [
    *Bước 1.* $F(0,w)=0$.

    *Bước 2.* Với vật $i$ có khối lượng $a_i$, giá trị $b_i$:
    nếu $w<a_i$, $F(i,w)=F(i-1,w)$.

    *Bước 3.* Nếu $w>=a_i$:
    $F(i,w)=max(F(i-1,w), F(i-1,w-a_i)+b_i)$.

    *Bước 4.* Sức chứa $6$: chọn vật $(5,8)$ một mình được $8$, hoặc $(2,3)+(3,4)$ được $7$, hoặc $(2,3)+(4,5)$ được $8$. Giá trị lớn nhất là $8$.
  ],
  [Giá trị lớn nhất $8$.]
)

#case-card(
  24,
  [Bài tổng hợp: vị trí, hướng, lượt rẽ, phần dư],
  fig-total(),
  [Đi từ $(0,0)$ đến $(6,5)$, chỉ sang phải hoặc lên. Tránh hai điểm $(2,2)$, $(4,3)$. Đúng $4$ lần đổi hướng. Tổng hoành độ của các điểm sau mỗi bước chia hết cho $5$. Đếm số đường đi.],
  [Đây là bài “đại bác” vì một trạng thái $F(i,j)$ không đủ. Cần nhớ vị trí, hướng bước cuối, số lượt rẽ đã dùng và phần dư modulo $5$.],
  [
    *Bước 1.* Đặt
    $F(i,j,h,t,r)$ là số đường tới $(i,j)$, hướng cuối là $h$, đã đổi hướng $t$ lần, và tổng hoành độ đang dư $r$ modulo $5$.

    *Bước 2.* Khi bước sang phải từ $(i-1,j)$ tới $(i,j)$, phần dư mới là $(r+i) mod 5$. Nếu hướng trước là lên thì số lượt rẽ tăng $1$.

    *Bước 3.* Khi bước lên từ $(i,j-1)$ tới $(i,j)$, phần dư mới vẫn cộng hoành độ $i$, và lượt rẽ tăng nếu hướng trước là phải.

    *Bước 4.* Bỏ qua mọi trạng thái rơi vào điểm cấm. Tính đến $(6,5)$ rồi cộng hai hướng cuối với $t=4$, $r=0$. Kết quả là $6$.
  ],
  [$6$ đường đi.]
)

= Kết Luận: Bản Đồ Nhận Dạng DP

#note([Khi gặp đề mới, hãy hỏi], [
  - Nếu đề có “đi đến đâu”: nghĩ tới DP vị trí hoặc DAG.
  - Nếu đề có “không chứa mẫu”: nghĩ tới FSM.
  - Nếu đề có “đã dùng những gì”: nghĩ tới bitmask.
  - Nếu đề có “cây”: nghĩ chọn/không chọn ở mỗi đỉnh.
  - Nếu đề có “đoạn con”: nghĩ interval DP.
  - Nếu đề có “ngân sách, modulo, số lượt rẽ”: thêm chiều trạng thái.
], color: teal)

#note([Câu chốt cho học sinh], [
  Quy hoạch động sâu không nằm ở việc viết công thức dài. Nó nằm ở năng lực nhìn ra đúng ký ức tối thiểu mà trạng thái phải giữ. Giữ thiếu thì sai; giữ thừa thì bảng nặng; giữ vừa đủ thì bài toán mở khóa.
], color: violet)
