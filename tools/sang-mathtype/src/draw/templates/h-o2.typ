// @nhom Hóa học
// @muc Điều chế & thu khí
// @ten Điều chế khí oxi (nhiệt phân KMnO₄)
// @mota Ống nghiệm đựng KMnO₄ đun bằng đèn cồn, thu khí O₂ bằng cách đẩy nước
// @tu oxi kali pemanganat nhiet phan thu khi day nuoc
#import "/sm-draw.typ": *
#let p-chat = "KMnO4" // Chất rắn trong ống nghiệm
#let p-khi = "O2" // Khí thu được
#let p-nhan = true // Hiện chú thích
#sm-canvas({
  import draw: *
  let ang = -14deg
  let L = 3.7
  let base = (0, 2.3)
  chau((7.2, -1.9), w: 5.4, h: 2.3, hn: 1.5)
  gia-do(-2.0, 5.0, w: 2.6, (3.5, along(base, ang, 2.4)))
  ong-nghiem-nghieng(base, ang: ang, h: L, w: 0.8, bot-dots: 14, dotcol: c-purple)
  let mouth = along(base, ang, L)
  nut(along(base, ang, L - 0.1), w: 0.7, h: 0.5)
  den-con((0.6, 0))
  ong(along(base, ang, L - 0.1), (mouth.at(0) + 1.0, mouth.at(1) + 0.2), (5.6, 0.15), (5.6, -1.75), (6.6, -1.75), (6.6, -0.9), w: 1.7pt)
  ong-up((6.6, -1.6), h: 3.4, w: 1.0, wl: 0.45, gas: ch(p-khi))
  bot((6.45, -0.75), (6.7, -0.45))
  if p-nhan {
    lab((0.6, 4.4), ch(p-chat) + [ (rắn)], at: "south")
    line((0.6, 4.3), (0.15, 2.55), stroke: 0.6pt, mark: (end: ">", size: 0.14))
    lab((8.3, -0.6), [Nước], at: "west")
    lab((8.9, 2.0), [Khí #ch(p-khi)], at: "west")
    line((8.8, 1.9), (7.15, 1.5), stroke: 0.6pt, mark: (end: ">", size: 0.14))
    lab((0.6, -0.6), [Đèn cồn])
  }
})
