
#import "/sach/DECUONG12-HK1/preamble.typ": *
#import "/bbt.typ": *
#set page(width: auto, height: auto, margin: 2pt, fill: none)
#table(
 columns: (auto, auto, auto),
 align: center,
 stroke: 0.5pt + luma(200),
 fill: (_, row) => if row == 0 { accent.lighten(80%) } else { none },
 [*Học sinh*], [*Số điểm*], [*Tính chất*],
 [An], [2], [Chẵn, Nguyên tố],
 [Bình], [3], [Bội của 3],
 [Cường], [6], [Gấp đôi Bình],
 )
