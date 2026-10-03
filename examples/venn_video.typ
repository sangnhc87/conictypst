#import "@preview/cetz:0.5.2"

#set page(
  width: 1920pt,
  height: 1080pt,
  fill: rgb("#111111"),
  margin: 80pt
)

// Thiết lập font chữ, màu trắng, phong cách toán học
#set text(size: 32pt, fill: white, font: "New Computer Modern")
#show math.equation: set text(fill: rgb("#f6e8c3"), size: 48pt)
#set align(center)

// Macro tuỳ biến tạo trang hiển thị từng bước
#let video-step(..pieces) = {
  let arr = pieces.pos()
  for i in range(1, arr.len() + 1) {
    page(align(center + horizon, block(breakable: false, arr.slice(0, i).join())))
  }
}

#let venn-3(
  nameA: "A", nameB: "B", nameC: "C",
  valA: "", valB: "", valC: "",
  valAB: "", valAC: "", valBC: "",
  valABC: ""
) = align(center)[
  #cetz.canvas({
    import cetz.draw: *
    let r = 2.0
    let cA = (0, 1.5)
    let cB = (-1.3, -0.9)
    let cC = (1.3, -0.9)
    circle(cA, radius: r, name: "A", stroke: 2pt + rgb("FF4136"), fill: rgb("FF4136").transparentize(70%))
    circle(cB, radius: r, name: "B", stroke: 2pt + rgb("0074D9"), fill: rgb("0074D9").transparentize(70%))
    circle(cC, radius: r, name: "C", stroke: 2pt + rgb("2ECC40"), fill: rgb("2ECC40").transparentize(70%))
    content((0, 3.8), text(font: "Arial", weight: "bold", fill: rgb("FF4136"), size: 36pt)[#nameA])
    content((-3.2, -2.6), text(font: "Arial", weight: "bold", fill: rgb("0074D9"), size: 36pt)[#nameB])
    content((3.2, -2.6), text(font: "Arial", weight: "bold", fill: rgb("2ECC40"), size: 36pt)[#nameC])
    content((0, 2.2), text(weight: "bold", size: 40pt)[#valA])
    content((-2.0, -1.2), text(weight: "bold", size: 40pt)[#valB])
    content((2.0, -1.2), text(weight: "bold", size: 40pt)[#valC])
    content((-1.4, 0.8), text(weight: "bold", size: 40pt)[#valAB])
    content((1.4, 0.8), text(weight: "bold", size: 40pt)[#valAC])
    content((0, -1.6), text(weight: "bold", size: 40pt)[#valBC])
    content((0, -0.1), text(weight: "bold", fill: rgb("#ff9e64"), size: 48pt)[#valABC])
  })
]

// BẮT ĐẦU NỘI DUNG BÀI TOÁN
#video-step(
  [
    #text(size: 64pt, fill: rgb("#ff9e64"), weight: "bold")[BÀI TOÁN SƠ ĐỒ VENN]
    #v(1em)
    Lớp 10A có 35 học sinh thi học sinh giỏi Toán, Lý, Hóa. 
    Mỗi bạn thi ít nhất 1 môn. Có:
    - 12 bạn chỉ thi Toán.
    - 14 bạn thi Lý.
    - 15 bạn thi Hóa.
    - 3 bạn chỉ thi Lý và Hóa.
    Hỏi có bao nhiêu bạn đi thi cả ba môn Toán, Lý, Hóa?
    \
    #v(2em)
  ],
  [
    #text(size: 48pt, fill: rgb("#7dcfff"), weight: "bold")[Phân tích bài toán:]
    \
    Gọi T, L, H là tập hợp học sinh thi Toán, Lý, Hóa.
    Tổng số học sinh: $|T union L union H| = 35$.
    \
    #v(1em)
  ],
  [
    Số học sinh chỉ thi Toán là 12, nên số học sinh thi Lý hoặc Hóa là:
    $|L union H| = 35 - 12 = 23$ học sinh.
    \
    #v(1em)
  ],
  [
    #align(center)[
      #venn-3(
        nameA: "Toán (T)", nameB: "Lý (L)", nameC: "Hóa (H)",
        valA: "12", valB: "?", valC: "?",
        valAB: "?", valAC: "?", valBC: "3",
        valABC: "?"
      )
    ]
    \
  ],
  [
    #text(size: 48pt, fill: rgb("#7dcfff"), weight: "bold")[Tính số học sinh giao nhau:]
    \
    Theo nguyên lý bù trừ cho tập Lý và Hóa:
    $|L union H| = |L| + |H| - |L inter H|$
    \
  ],
  [
    Thay số: $23 = 14 + 15 - |L inter H| => |L inter H| = 6$.
    \
  ],
  [
    Tập hợp thi Lý và Hóa gồm 2 nhóm: nhóm *chỉ thi Lý và Hóa*, và nhóm *thi cả 3 môn*.
    Vì có 3 thí sinh *chỉ thi Lý và Hóa*, nên số thí sinh thi cả 3 môn là:
    $6 - 3 = 3$ học sinh.
    \
    #v(1em)
  ],
  [
    #align(center)[
      #venn-3(
        nameA: "Toán (T)", nameB: "Lý (L)", nameC: "Hóa (H)",
        valA: "12", valB: "?", valC: "?",
        valAB: "?", valAC: "?", valBC: "3",
        valABC: "3"
      )
    ]
    \
  ],
  [
    #text(size: 54pt, fill: rgb("#a6e3a1"), weight: "bold")[Kết luận:]
    Có đúng 3 học sinh đi thi cả ba môn Toán, Lý, Hóa!
  ]
)
