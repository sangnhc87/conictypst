#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let circ = sym.degree
#let c-book = rgb("#0057b8")
#let accent = rgb("#0057b8")
#let pm = sym.plus.minus

#canvas(length: 1cm, {
    import draw: *
    // Tấm chữ nhật
    rect((0,-1.5), (3, 1.5), stroke: 1pt + blue, fill: rgb("e6f2ff"))
    content((1.5, 1.5), $2pi r$, anchor: "south", padding: 2pt)
    content((3, 0), $h$, anchor: "west", padding: 2pt)
    
    // Mũi tên
    line((4, 0), (5, 0), mark: (end: ">"), stroke: 1.5pt)
    content((4.5, 0.5), [Gò])
    
    // Hình trụ
    let c = (7, 0)
    let a = 1.2
    let b = 0.4
    let h_cyl = 3
    let c_top = (7, 1.5)
    let c_bot = (7, -1.5)
    
    // Đáy dưới
    arc(c_bot, start: 180deg, stop: 360deg, radius: (a, b), stroke: 1pt + red, fill: rgb("ffe6e6"))
    arc(c_bot, start: 0deg, stop: 180deg, radius: (a, b), stroke: (paint: red, dash: "dashed"))
    
    // Thân
    line((7-a, -1.5), (7-a, 1.5), stroke: 1pt + red)
    line((7+a, -1.5), (7+a, 1.5), stroke: 1pt + red)
    
    // Đáy trên
    arc(c_top, start: 0deg, stop: 360deg, radius: (a, b), stroke: 1pt + red, fill: rgb("ffe6e6"))
    
    // Kích thước
    line(c_top, (7+a, 1.5), stroke: (dash: "dashed"))
    content((7+a/2, 1.5), $r$, anchor: "south", padding: 2pt)
    content((7-a, 0), $h$, anchor: "east", padding: 2pt)
  })