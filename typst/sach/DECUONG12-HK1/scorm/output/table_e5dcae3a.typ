
#import "/sach/DECUONG12-HK1/preamble.typ": *
#import "/bbt.typ": *
#set page(width: auto, height: auto, margin: 2pt, fill: none)
#table(
 columns: (auto, auto, auto),
 align: center,
 stroke: 0.5pt + luma(200),
 fill: (_, row) => if row == 0 { accent.lighten(80%) } else { none },
 [*Người thợ*], [*Gợi ý 1*], [*Gợi ý 2*],
 [Thứ 1], [$n$ chia hết cho 5], [$n$ là số chính phương],
 [Thứ 2], [$n$ là số chẵn], [$n$ chia hết cho 3],
 [Thứ 3], [$n$ là số nguyên tố], [$n > 4$],
 )
