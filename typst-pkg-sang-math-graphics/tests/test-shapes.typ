#import "../lib.typ": *
#import "@preview/cetz:0.5.2"

#align(center)[
  = Đồ thị hàm số
  #plot-cubic()
  #plot-parabola()
  #plot-rational()
  
  = Trục toạ độ
  #axis-xyz()
  
  = Hình chóp tam giác đều
  #chop-sabc-deu()
  
  = Hình chóp tứ giác đều
  #chop-sabcd-deu()
  
  = Khác
  #tri-abc()
  
  #circle-circumcircle((-2.5, 0), (2.5, 0), (0, 3.5))
  #circle-incircle((-2.5, 0), (2.5, 0), (0, 3.5))
  
  #tri-right(leg1: 5, leg2: 4)
  
  #chop-sabc(hidden: ("AC",))
  
  #chop-sabcd(hidden: ("AB", "AD", "AC"))
  
  #lang-tru-abc(hidden: ("AA'", "AB"))
  
  = Khối tròn xoay
  #pseudo-cone()
  
  #pseudo-cylinder()
]
= Chuyên đề Phẳng hoá (Unfolding 3D)

#align(center)[
  == Khai triển Hình nón
  #phanghoa-non(r: 3, h: 4, draw-base: true)
  
  == Khai triển Hình trụ
  #phanghoa-tru(r: 2, h: 4, draw-bases: true)
  
  == Khai triển khối chóp S.ABC
  #phanghoa-sabc(
    SA: 5, SB: 6, SC: 5.5,
    AB: 4, BC: 4.5, CA: 3.5
  )
]

= Siêu Khó: Tự động vẽ Quỹ Đạo Xoắn Ốc (Geodesics)

#align(center)[
  == Hình Nón (3 vòng xoắn ốc)
  #cone-geodesic-3d(r: 3, h: 8, loops: 3, end-distance: 5)
  #cone-unfold-2d(r: 3, h: 8, loops: 3, end-distance: 5)
  
  == Hình Trụ (2 vòng xoắn ốc)
  #cylinder-geodesic-3d(r: 2, h: 5, loops: 2)
  #cylinder-unfold-2d(r: 2, h: 5, loops: 2)
  
  == Hình Nón Cụt (1.5 vòng xoắn ốc)
  #truncated-cone-geodesic-3d(R: 3, r: 1, h: 4, loops: 1.5)
  #truncated-cone-unfold-2d(R: 3, r: 1, h: 4, loops: 1.5)
]
= Test Hình học không gian giả lập (Pseudo 3D)

#align(center)[
  #chop-sabc(hidden: ("AC",))
]

#align(center)[
  #chop-sabcd(hidden: ("AB", "AD", "AC"))
]

#align(center)[
  #lang-tru-abc(hidden: ("AA'", "AB"))
]
