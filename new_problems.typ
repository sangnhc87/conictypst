
== Bài 11. Xấp xỉ Hệ số Gini từ Bảng Số Liệu (Phương pháp Hình Thang)
#tln(
  [Đường cong Lorenz là một công cụ quan trọng để biểu diễn sự phân phối thu nhập trong một quốc gia, và được mô hình hóa bởi hàm số $y = L(x)$, trong đó $x$ đại diện cho phần trăm lũy kế của các gia đình (từ nghèo nhất đến giàu nhất), $y$ biểu thị phần trăm lũy kế của tổng thu nhập tương ứng. Tại một quốc gia có dữ liệu rời rạc như sau:

  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto),
      align: center,
      [*Phần trăm dân số lũy kế* ($x$)], [0%], [20%], [40%], [60%], [80%], [100%],
      [*Phần trăm thu nhập lũy kế* ($y$)], [0%], [5%], [15%], [30%], [55%], [100%]
    )
  ]
  Sử dụng quy tắc hình thang để tính gần đúng diện tích dưới đường Lorenz, từ đó ước lượng hệ số Gini của quốc gia này. Biết hệ số Gini tính theo tỷ lệ (mức 1 thay vì 100%).],
  [G=0.38],
  fig: fig-panel(cetz.canvas(length: 4cm, {
    import cetz.draw: *

    let pts = ((0.0, 0.0), (0.2, 0.05), (0.4, 0.15), (0.6, 0.30), (0.8, 0.55), (1.0, 1.0))
    
    // Diện tích Gini
    let gini_pts = ((0.0, 0.0), (1.0, 1.0))
    let rev_pts = ()
    for p in pts { rev_pts.push(p) }
    rev_pts = rev_pts.rev()
    merge-path(fill: rgb(255, 200, 100, 140), stroke: none, close: true, { 
      line(..gini_pts)
      line(..rev_pts)
    })

    // Diện tích dưới Lorenz
    let area_pts = pts
    area_pts.push((1.0, 0.0))
    area_pts.push((0.0, 0.0))
    merge-path(fill: rgb(180, 220, 255, 120), stroke: none, close: true, { line(..area_pts) })

    // Trục và lưới
    line((0.0, 0.0), (1.0, 1.0), stroke: (paint: eq-color, dash: "dashed", thickness: 1pt))
    for p in pts {
      line((p.at(0), 0.0), p, stroke: (dash: "dotted", paint: gray, thickness: 0.5pt))
      line((0.0, p.at(1)), p, stroke: (dash: "dotted", paint: gray, thickness: 0.5pt))
      circle(p, radius: 1.5pt, fill: black)
    }

    line(..pts, stroke: 1.5pt + dd-color)

    line((-0.05, 0.0), (1.1, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.05), (0.0, 1.1), mark: (end: ">"), stroke: 0.55pt)
    content((1.05, -0.05), $x$)
    content((-0.08, 1.05), $L(x)$)

    content((0.2, -0.05), text(size: 7.5pt)[$0.2$])
    content((0.4, -0.05), text(size: 7.5pt)[$0.4$])
    content((0.6, -0.05), text(size: 7.5pt)[$0.6$])
    content((0.8, -0.05), text(size: 7.5pt)[$0.8$])
    content((1.0, -0.05), text(size: 7.5pt)[$1.0$])

    content((-0.1, 0.05), text(size: 7.5pt)[$0.05$])
    content((-0.1, 0.15), text(size: 7.5pt)[$0.15$])
    content((-0.1, 0.30), text(size: 7.5pt)[$0.30$])
    content((-0.1, 0.55), text(size: 7.5pt)[$0.55$])
    content((-0.1, 1.0), text(size: 7.5pt)[$1.0$])

    content((0.4, 0.5), text(size: 7.5pt, fill: rgb("8B4513"))[Gini])
    content((0.8, 0.2), text(size: 7.5pt, fill: dd-color)[$S$ (Hình thang)])
  })),
  fig-pos: "right",
  fig-width: 48%,
  loigiai: [
    #reset-step()
    #step[
      *Đồng nhất hệ tọa độ:*
      Chuyển dữ liệu phần trăm sang dạng thập phân để tính toán ($x, y in [0, 1]$):
      - $x_0 = 0$, $x_1 = 0.2$, $x_2 = 0.4$, $x_3 = 0.6$, $x_4 = 0.8$, $x_5 = 1.0$
      - $y_0 = 0$, $y_1 = 0.05$, $y_2 = 0.15$, $y_3 = 0.30$, $y_4 = 0.55$, $y_5 = 1.0$
    ]
    #step[
      *Áp dụng quy tắc hình thang:*
      Tính xấp xỉ phần diện tích $S$ dưới đường cong Lorenz bằng tổng diện tích các hình thang nhỏ.
      Khoảng cách các mốc là đều nhau: $Delta x = 0.2$.
      
      $ S approx frac(Delta x, 2) [y_0 + 2(y_1 + y_2 + y_3 + y_4) + y_5] $
      
      $ S approx frac(0.2, 2) [0 + 2(0.05 + 0.15 + 0.30 + 0.55) + 1.0] $
      
      $ S approx 0.1 [0 + 2(1.05) + 1.0] = 0.1 [2.1 + 1.0] = 0.1 times 3.1 = 0.31 $
    ]
    #step[
      *Tính Hệ số Gini ($G$):*
      $ G = 1 - 2S = 1 - 2(0.31) = 1 - 0.62 = bold(0.38) $

      #nhanxet[Đáp số tô phiếu: *0.38*. Phương pháp hình thang là công cụ hữu hiệu nhất để xử lý dữ liệu thống kê rời rạc trong thực tế khi không có hàm phân tích $L(x)$.]
    ]
  ]
)

== Bài 12. Xác đinh tham số Hàm Lorenz từ Dữ Liệu
#tln(
  [Tại một quốc gia, đường cong Lorenz biểu diễn phân phối thu nhập được giả định tuân theo mô hình đại số bậc hai: $L(x) = a x^2 + b x$. Biết rằng $20\%$ dân số có thu nhập thấp nhất chỉ sở hữu $4\%$ tổng thu nhập quốc gia. Hãy tìm các tham số $a, b$ và tính hệ số Gini $G$ để đánh giá mức độ bất bình đẳng.],
  [G=0.33],
  fig: fig-panel(cetz.canvas(length: 3.5cm, {
    import cetz.draw: *

    let d_pts = ()
    for i in range(0, 50) {
      let x = i * 0.02
      let y = x * x
      d_pts.push((x, y))
    }

    // Gini
    let gini_pts = ((0.0, 0.0), (1.0, 1.0))
    let rev_pts = ()
    for p in d_pts { rev_pts.push(p) }
    rev_pts = rev_pts.rev()
    merge-path(fill: rgb(255, 200, 100, 140), stroke: none, close: true, { 
      line(..gini_pts)
      line(..rev_pts)
    })

    // Đường chéo
    line((0.0, 0.0), (1.0, 1.0), stroke: (paint: eq-color, dash: "dashed", thickness: 1pt))
    
    // Lorenz curve
    line(..d_pts, stroke: 1.5pt + dd-color)

    // Điểm dữ liệu
    line((0.2, 0.0), (0.2, 0.04), stroke: (dash: "dotted", paint: gray, thickness: 0.5pt))
    line((0.0, 0.04), (0.2, 0.04), stroke: (dash: "dotted", paint: gray, thickness: 0.5pt))
    circle((0.2, 0.04), radius: 1.5pt, fill: black)

    line((-0.1, 0.0), (1.1, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.1), (0.0, 1.1), mark: (end: ">"), stroke: 0.55pt)
    content((1.05, -0.05), $x$)
    content((-0.08, 1.05), $L(x)$)
    
    content((0.2, -0.05), text(size: 7.5pt)[$0.2$])
    content((-0.08, 0.04), text(size: 7.5pt)[$0.04$])
    
    content((0.45, 0.6), text(size: 7.5pt, fill: rgb("8B4513"))[Gini])
    content((0.8, 0.4), text(size: 7.5pt, fill: dd-color)[$L(x) = x^2$])
  })),
  fig-pos: "right",
  loigiai: [
    #reset-step()
    #step[
      *Lập hệ phương trình tìm tham số:*

      Đường Lorenz phải đi qua điểm tận cùng $(1, 1)$, mang ý nghĩa 100% dân số sở hữu 100% thu nhập.
      
      $ L(1) = 1 => a(1)^2 + b(1) = 1 => a + b = 1 quad "(1)" $
      
      Dữ kiện bài cho: $20\%$ dân số nghèo nhất sở hữu $4\%$ thu nhập. Chuyển tỉ lệ: $x = 0.2, y = 0.04$.
      
      $ L(0.2) = 0.04 => a(0.2)^2 + b(0.2) = 0.04 => 0.04a + 0.2b = 0.04 quad "(2)" $
    ]
    #step[
      *Giải hệ:*
      Nhân hai vế phương trình (2) cho 25:
      $ 1.0 a + 5.0 b = 1.0 quad "(2')" $
      Lấy (2') trừ (1):
      $ (a + 5b) - (a + b) = 1.0 - 1.0 => 4b = 0 => b = 0 $
      Từ đó suy ra $a = 1$. Đường cong Lorenz có hàm số: $L(x) = x^2$.
    ]
    #step[
      *Tính hệ số Gini:*
      Tính diện tích $S$ dưới đường cong Lorenz:
      
      $ S = integral_0^1 L(x) dif x = integral_0^1 x^2 dif x = frac(x^3, 3) | _0^1 = frac(1, 3) $
      
      $ G = 1 - 2S = 1 - 2(frac(1, 3)) = 1 - frac(2, 3) = frac(1, 3) approx bold(0.33) $
      
      #nhanxet[Đáp số tô phiếu: *0.33*. Mô hình đại số với 1 điểm dữ liệu có thể nội suy toàn cục, thường dùng làm bài đánh giá Gini linh hoạt.]
    ]
  ]
)

== Bài 13. Phân Phối Của Tầng Lớp Tinh Hoa (Độ lệch Gini lớn)
#tln(
  [Ở một vương quốc nọ, mức độ bất bình đẳng được đánh giá là cực kỳ nghiêm trọng, dẫn đến đường Lorenz của họ có độ võng rất sâu và được mô hình hóa bằng siêu cung $L(x) = x^4$. Bạn hãy tính hệ số Gini $G$ và xác định xem $50\%$ dân số giàu nhất của vương quốc này đang sở hữu *bao nhiêu phần trăm* tổng tài sản?],
  [G=0.6, 93.75%],
  fig: fig-panel(cetz.canvas(length: 3.5cm, {
    import cetz.draw: *

    let d_pts = ()
    for i in range(0, 50) {
      let x = i * 0.02
      let y = calc.pow(x, 4)
      d_pts.push((x, y))
    }

    // Gini
    let gini_pts = ((0.0, 0.0), (1.0, 1.0))
    let rev_pts = ()
    for p in d_pts { rev_pts.push(p) }
    rev_pts = rev_pts.rev()
    merge-path(fill: rgb(255, 200, 100, 140), stroke: none, close: true, { 
      line(..gini_pts)
      line(..rev_pts)
    })

    // Tầng lớp tinh hoa x thuộc [0.5, 1.0]
    let rich_pts = ((0.5, 0.0),)
    for i in range(25, 51) {
      let x = i * 0.02
      let y = calc.pow(x, 4)
      rich_pts.push((x, y))
    }
    rich_pts.push((1.0, 0.0))
    merge-path(fill: rgb(255, 100, 150, 100), stroke: none, close: true, { line(..rich_pts) })

    // Đường chéo
    line((0.0, 0.0), (1.0, 1.0), stroke: (paint: eq-color, dash: "dashed", thickness: 1pt))
    
    // Lorenz curve
    line(..d_pts, stroke: 1.5pt + dd-color)

    // Khúc chia
    line((0.5, 0.0), (0.5, calc.pow(0.5, 4)), stroke: (dash: "dotted", paint: gray, thickness: 0.6pt))
    line((0.0, calc.pow(0.5, 4)), (0.5, calc.pow(0.5, 4)), stroke: (dash: "dotted", paint: gray, thickness: 0.6pt))
    circle((0.5, calc.pow(0.5, 4)), radius: 1.5pt, fill: black)

    line((-0.1, 0.0), (1.1, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.1), (0.0, 1.1), mark: (end: ">"), stroke: 0.55pt)
    content((1.05, -0.05), $x$)
    content((-0.08, 1.05), $L(x)$)
    
    content((0.5, -0.05), text(size: 7.5pt)[$0.5$])
    content((-0.1, 0.05), text(size: 7.5pt)[$L(0.5)$])
    
    content((0.45, 0.6), text(size: 7.5pt, fill: rgb("8B4513"))[Gini Lớn])
  })),
  fig-pos: "right",
  loigiai: [
    #reset-step()
    #step[
      *Tính hệ số Gini ($G$):*
      Diện tích $S$ dưới đường Lorenz:
      
      $ S = integral_0^1 x^4 dif x = frac(x^5, 5) |_0^1 = frac(1, 5) = 0.2 $
      
      Hệ số Gini:
      $ G = 1 - 2S = 1 - 2(0.2) = 1 - 0.4 = bold(0.6) $
      _(Một mức $G \ge 0.6$ là cực thấp và phản ánh sự phi công bằng rất nghiêm trọng trên thực tế)._
    ]
    #step[
      *Xét $50\%$ dân số giàu nhất:*
      Hàm $L(x)$ biểu diễn tài sản của nhóm dân số *nghèo* lũy kế. 
      Tài sản của $50\%$ dân số nghèo nhất ($x = 0.5$) là:
      
      $ L(0.5) = (frac(1, 2))^4 = frac(1, 16) = 0.0625 = 6.25\% $
      
      Suy ra tổng tài sản mà $50\%$ dân số *giàu nhất* ($x \in [0.5, 1]$) đang nắm giữ phần còn lại là:
      
      $ 1 - L(0.5) = 1 - 0.0625 = bold(0.9375) => bold(93.75\%) $
      
      #nhanxet[Đáp số tô phiếu: $G = 0.6$ ; Tài sản chiếm: $93.75\%$. 50% dân số thượng lưu đã nẫng tay trên 93.75% tài sản của vương quốc, và nửa dưới chỉ chia nhau miếng bánh 6.25% ít ỏi.]
    ]
  ]
)
