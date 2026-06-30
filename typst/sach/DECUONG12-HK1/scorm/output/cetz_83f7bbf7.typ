
#import "/sach/DECUONG12-HK1/preamble.typ": *
#set page(width: auto, height: auto, margin: 5pt, fill: none)
#canvas(length: 0.8cm, {
        import draw: *
        // Trục tọa độ
        line((0, 0), (11, 0), mark: (end: ">"))
        line((0, 0), (0, 7), mark: (end: ">"))
        
        // Nhãn trục
        content((11, -0.4), [Thời gian (phút)])
        content((-0.8, 7), [Số ngày])
        
        // Vạch đứng trục tung
        for y in (5, 10, 15, 20, 25, 30) {
          let y_val = y / 5
          line((-0.1, y_val), (0.1, y_val))
          content((-0.4, y_val), str(y))
        }
        
        // Nhãn trục hoành
        let classes = (($[15; 20)$, 1), ($[20; 25)$, 3)
