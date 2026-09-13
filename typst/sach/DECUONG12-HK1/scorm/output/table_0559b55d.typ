
#import "/sach/DECUONG12-HK1/preamble.typ": *
#import "/bbt.typ": *
#set page(width: auto, height: auto, margin: 2pt, fill: none)
#table(
 columns: (auto, auto, auto),
 align: center,
 stroke: 0.5pt + luma(200),
 fill: (_, row) => if row == 0 { accent.lighten(80%) } else { none },
 [*Giả sử A là*], [*Lời nói "ít nhất 1 kẻ gian"*], [*Kết luận*],
 [Kẻ gian (luôn dối)], [Trở thành sự thật (vì A là kẻ gian)], [Mâu thuẫn (kẻ gian ko nói thật)],
 [Hiệp sĩ (luôn thật)], [Là sự thật (cần 1 kẻ gian)], [Hợp lý. Bắt buộc B là kẻ gian.],
 )
