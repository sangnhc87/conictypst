// @nhom Hóa học
// @muc Dụng cụ
// @ten Dụng cụ thủy tinh cơ bản
// @mota Cốc, bình tam giác, bình cầu, ống nghiệm, ống đong, buret, đèn cồn, phễu
#import "/sm-draw.typ": *
#sm-canvas({
  import draw: *
  coc((0,0))
  erlen((4,0), nut: true)
  binh-cau((8,1.3))
  ong-nghiem((11,0), ketua: 12, ktcol: c-gray)
  ong-nghiem((12.2,0), liq: rgb("#f87171"), lvl: 0.6)
  ong-dong((14,0))
  buret((16,0))
  den-con((18,0))
  pheu((20,0))
  lab((0,-0.4), ch("H2SO4"))
})
