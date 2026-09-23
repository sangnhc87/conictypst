#import "/public/hdsd/typst/sang-math-geom.typ": *

#align(center)[
  #sm-oxyz(xlim: (0, 7), ylim: (0, 7), zlim: (0, 1), hien-truc: false, them: (ctx, d) => {
    sm-polygon(ctx, (0,0), (6,0), (6,6), (0,6), dut: false)
    sm-polygon(ctx, (0,0), (1.5,0), (1.5,1.5), (0,1.5), mau: rgb("ffcccc"))
    sm-doan(ctx, (1.5,1.5), (4.5,1.5), dut: true)
  })
]
