#set page(
  width: 1920pt,
  height: 1080pt,
  fill: rgb("#111111"),
  margin: 60pt
)
#set text(size: 48pt, fill: white, font: "New Computer Modern")
#show math.equation: set text(fill: rgb("#f6e8c3"), size: 64pt)
#set align(center)

#let video-step(..pieces) = {
  let arr = pieces.pos()
  for i in range(1, arr.len() + 1) {
    page(align(center + horizon, block(breakable: false, arr.slice(0, i).join())))
  }
}

#video-step(
  [
    #text(size: 80pt, fill: rgb("#ff9e64"), weight: "bold")[SANG MATH]
    #v(0.5em)
    #text(size: 64pt, fill: white, weight: "bold")[Giới Thiệu Gói Đề Thi Cực Đẹp]
    #v(1.5em)
  ],
  [
    Chỉ với 1 dòng lệnh, bạn có thể biến hóa đề thi của mình thành các giao diện xuất sắc.
    #v(1em)
    Cùng xem qua một số phong cách nổi bật nhé!
  ]
)

#video-step(
  [
    #text(size: 64pt, fill: rgb("#00d2ff"), weight: "bold")[Phong cách Classic (Chuẩn BGD)]
    #v(1em)
    #box(stroke: 4pt + rgb("#00d2ff"), radius: 8pt, clip: true)[
      #image("theme_classic.png", height: 750pt)
    ]
  ]
)

#video-step(
  [
    #text(size: 64pt, fill: rgb("#ffb347"), weight: "bold")[Phong cách Navy Gold (Sang trọng)]
    #v(1em)
    #box(stroke: 4pt + rgb("#ffb347"), radius: 8pt, clip: true)[
      #image("theme_navy-gold.png", height: 750pt)
    ]
  ]
)

#video-step(
  [
    #text(size: 64pt, fill: rgb("#00e5ff"), weight: "bold")[Phong cách Teal Pro (Hiện đại)]
    #v(1em)
    #box(stroke: 4pt + rgb("#00e5ff"), radius: 8pt, clip: true)[
      #image("theme_teal-pro.png", height: 750pt)
    ]
  ]
)

#video-step(
  [
    #text(size: 64pt, fill: rgb("#b388ff"), weight: "bold")[Phong cách Violet (Phân hoá)]
    #v(1em)
    #box(stroke: 4pt + rgb("#b388ff"), radius: 8pt, clip: true)[
      #image("theme_violet.png", height: 750pt)
    ]
  ]
)

#video-step(
  [
    Tất cả giao diện trên đều được hỗ trợ sẵn.
    #v(1.5em)
    #text(size: 72pt, fill: rgb("#ff9e64"), weight: "bold")[Hãy trải nghiệm ngay hôm nay!]
  ]
)
