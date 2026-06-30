
#import "/sach/DECUONG12-HK1/preamble.typ": *
#set page(width: auto, height: auto, margin: 5pt, fill: none)
#canvas(length: 1cm, {
        import draw: *
        // Trục tọa độ
        line((0, 0), (7, 0), mark: (end: ">"))
        line((0, 0), (0, 4), mark: (end: ">"))
        
        // Nhãn trục
        content((7, -0.4), [Số lượt đặt bàn])
        content((-0.8, 4), [Số ngày])
        
        // Vạch tọa độ đứng
        for y in (5, 10, 15, 20, 25, 30, 35) {
          let y_val = y / 10
          line((-0.1, y_val), (0.1, y_val))
          content((-0.4, y_val), str(y))
        }
        
        // Vẽ các cột histogram
        // Cột 1: [1; 6)
