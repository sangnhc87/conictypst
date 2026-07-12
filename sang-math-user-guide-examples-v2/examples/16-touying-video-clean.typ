// ====================================================================
// VÍ DỤ 16: GIAO DIỆN CHUẨN MANIM SIÊU ĐƠN GIẢN
// Tự viết macro hiển thị từng bước để tránh lỗi bóng mờ của Touying.
// Đảm bảo 1 bước = chính xác 1 trang PDF.
// ====================================================================

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

// --------------------------------------------------------------------
// BẮT ĐẦU NỘI DUNG VIDEO (Chỉ có chữ và công thức, không viền, không footer)
// --------------------------------------------------------------------

#video-step(
  [
    #text(size: 48pt, fill: rgb("#ff9e64"), weight: "bold")[TÍNH GIỚI HẠN]
    
    #v(1em)
    Tìm giới hạn sau:
    $ L = lim_(x -> 1) (x^2 - 1)/(x - 1) $
  ],
  [
    #v(1em)
    *Giải:*
    \
  ],
  [
    Ta có: 
    $ x^2 - 1 = (x - 1)(x + 1) $
    \
  ],
  [
    Suy ra:
    $ L = lim_(x -> 1) ((x - 1)(x + 1))/(x - 1) $
    \
  ],
  [
    Triệt tiêu lượng $(x - 1)$ ở tử và mẫu:
    $ L = lim_(x -> 1) (x + 1) $
    \
  ],
  [
    Thay số trực tiếp:
    $ L = 1 + 1 = 2 $
  ]
)
