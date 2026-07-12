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
    #text(size: 72pt, fill: rgb("#ff9e64"), weight: "bold")[CÂU HỎI TRẮC NGHIỆM TIÊU BIỂU]
    #v(1em)
    #text(fill: rgb("#00d2ff"))[Trích từ Đề thi khảo sát chất lượng Toán 12]
    #v(1.5em)
  ],
  [
    #set align(left)
    *Đề bài:* Hàm số $y=x^3-3x$ đạt cực đại tại điểm nào?
    #v(1em)
    A. $x = -1$ #h(2em) B. $x = 1$ #h(2em) C. $x = 0$ #h(2em) D. $x = -3$
    #v(1.5em)
  ],
  [
    #set align(left)
    *Giải chi tiết:*
    \
    #v(0.5em)
    Tập xác định: $D = RR$.
    \
  ],
  [
    #set align(left)
    Đạo hàm: $y' = 3x^2 - 3$.
    \
  ],
  [
    #set align(left)
    Xét phương trình: $y' = 0 <=> 3x^2 - 3 = 0 <=> x = 1$ hoặc $x = -1$.
    \
  ],
  [
    #set align(left)
    Qua điểm $x = -1$, đạo hàm $y'$ đổi dấu từ dương sang âm. 
    \
    $=>$ Hàm số đạt cực đại tại $x = -1$. *(Chọn A)*
  ]
)
