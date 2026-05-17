== Bài 14. Phân tích Dữ liệu Phân phối Thu nhập Rời rạc (Đúng/Sai)
#ds(
  [Đường cong Lorenz là một công cụ quan trọng để biểu diễn sự phân phối thu nhập trong một quốc gia, và được mô hình hóa bởi hàm số $y = L(x)$, trong đó $x$ đại diện cho phần trăm lũy kế của dân số (sắp xếp từ nghèo nhất đến giàu nhất), $y$ biểu thị phần trăm lũy kế của tổng thu nhập tương ứng. Tại một quốc gia có dữ liệu như sau:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto),
      align: center,
      [$x$ (phần trăm dân số lũy kế)], [0%], [20%], [40%], [60%], [80%], [100%],
      [$L(x)$ (phần trăm thu nhập lũy kế)], [0%], [5%], [15%], [30%], [55%], [100%]
    )
  ]
  Biết rằng mức thu nhập được chia theo các nhóm bằng nhau từng $20\%$ dân số. Các khẳng định sau đây là đúng hay sai?],
  (
    True([$40\%$ dân số nghèo nhất của quốc gia này đang sở hữu $15\%$ tổng thu nhập.]),
    True([Nhóm $20\%$ dân số giàu nhất (tầng lớp thượng lưu từ $80\%$ đến $100\%$ dân số) nắm giữ đúng $45\%$ tổng thu nhập.]),
    False([Nhóm trung lưu (từ mức $40\%$ đến $80\%$ dân số lũy kế) chiếm một tỷ lệ thu nhập lớn hơn nhóm $20\%$ dân số giàu nhất.]),
    False([Đánh giá diện tích phần hình phẳng nằm dưới đường cong Lorenz bằng phương pháp hình thang, ta nhận được một giá trị lớn hơn $0.35$.])
  ),
  fig: fig-panel(cetz.canvas(length: 4.5cm, {
    import cetz.draw: *
    let pts = ((0.0, 0.0), (0.2, 0.05), (0.4, 0.15), (0.6, 0.30), (0.8, 0.55), (1.0, 1.0))
    
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
  })),
  fig-pos: "right",
  fig-width: 48%,
  loigiai: [
    #reset-step()
    #step[
      *Đồng nhất hệ tọa độ về dạng thập phân:*
      - $x_0 = 0, x_1 = 0.2, x_2 = 0.4, x_3 = 0.6, x_4 = 0.8, x_5 = 1.0$
      - $y_0 = 0, y_1 = 0.05, y_2 = 0.15, y_3 = 0.30, y_4 = 0.55, y_5 = 1.0$
    ]
    #step[
      *Lập luận câu A:* Từ bảng số liệu, tại $x = 0.4 (40\%)$ ta có $L(x) = y_2 = 0.15 (15\%)$. => *A ĐÚNG.*
    ]
    #step[
      *Lập luận câu B:* Dân số giàu nhất chạy từ mốc $x = 0.8$ đến $x=1.0$.
      Tỷ lệ thu nhập của $20\%$ dân số giàu nhất là $L(1.0) - L(0.8) = 1.0 - 0.55 = 0.45$. Tức là họ nắm giữ $45\%$ tổng thu nhập. => *B ĐÚNG.*
    ]
    #step[
      *Lập luận câu C:* Nhóm trung lưu nằm từ $x = 0.4$ đến $x = 0.8$. Tỷ lệ thu nhập là $L(0.8) - L(0.4) = 0.55 - 0.15 = 0.40$ ($40\%$). 
      Vì $40\% < 45\%$ nên nhóm trung lưu chiếm tỷ lệ thu nhập *nhỏ hơn* so với nhóm $20\%$ người giàu nhất. => *C SAI.*
    ]
    #step[
      *Lập luận câu D:* 
      Áp dụng công thức tính diễn tích hình thang với độ chia $Delta x = 0.2$:
      $ S approx frac(Delta x, 2) [y_0 + 2(y_1 + y_2 + y_3 + y_4) + y_5] $
      $ S approx 0.1 [0 + 2(0.05 + 0.15 + 0.30 + 0.55) + 1.0] = 0.1 [2.1 + 1.0] = 0.31 $
      Vì $0.31 < 0.35$ nên kết luận diện tích lớn hơn $0.35$ là không chính xác. => *D SAI.*
    ]
  ]
)

== Bài 15. So sánh Phân phối Hai Vùng (Đúng/Sai)
#ds(
  [Quỹ đạo Lorenz của khu vực A được mô hình hóa bởi hàm số $L_A(x) = x^2$, và của khu vực B được mô hình hóa bởi hàm số $L_B(x) = x^3$ (với $x in [0, 1]$). Hai vùng có cùng quy mô dân số và người ta muốn phân tích chi tiết chênh lệch tài sản mà không cần qua hệ số Gini. Các nhận định sau đây là đúng hay sai?],
  (
    True([Ở vùng A, $50\%$ dân số nghèo nhất sở hữu đúng $25\%$ tổng tài sản của vùng.]),
    False([Đối chiếu nhóm $50\%$ dân số nghèo nhất ở hai vùng, người thuộc nhóm này ở vùng B sở hữu khối lượng tài sản lớn hơn so với tại vùng A.]),
    False([Ở vùng B, tỷ lệ tài sản thuộc về $20\%$ dân số giàu nhất lớn gấp hơn 2 lần so với mức chiếm hữu của nhóm $20\%$ giàu nhất ở vùng A.]),
    True([Diện tích hình phẳng giới hạn bởi hai đường cong phân phối $y = L_A(x)$ và $y = L_B(x)$ trên miền $[0, 1]$ có giá trị bằng $1/12$.])
  ),
  fig: fig-panel(cetz.canvas(length: 3.5cm, {
    import cetz.draw: *
    let ptsA = ()
    let ptsB = ()
    for i in range(0, 50) {
      let x = i * 0.02
      ptsA.push((x, x * x))
      ptsB.push((x, calc.pow(x, 3)))
    }
    
    // Diện tích giữa hai hàm Lorenz
    let hl_pts = ptsA
    let rev_ptsB = ()
    for p in ptsB { rev_ptsB.push(p) }
    rev_ptsB = rev_ptsB.rev()
    merge-path(fill: rgb(255, 100, 100, 100), stroke: none, close: true, { 
      line(..hl_pts)
      line(..rev_ptsB)
    })

    // Trục và lưới
    line((0.0, 0.0), (1.0, 1.0), stroke: (paint: eq-color, dash: "dashed", thickness: 1pt))
    line(..ptsA, stroke: 1.5pt + rgb("2E86C1"))
    line(..ptsB, stroke: 1.5pt + rgb("D35400"))

    line((-0.1, 0.0), (1.1, 0.0), mark: (end: ">"), stroke: 0.55pt)
    line((0.0, -0.1), (0.0, 1.1), mark: (end: ">"), stroke: 0.55pt)
    content((1.05, -0.05), $x$)
    content((-0.08, 1.05), $L(x)$)
    
    content((0.45, 0.6), text(size: 7.5pt, fill: rgb("2E86C1"))[$L_A(x)=x^2$])
    content((0.8, 0.35), text(size: 7.5pt, fill: rgb("D35400"))[$L_B(x)=x^3$])
  })),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #reset-step()
    #step[
      *Lập luận câu A:* Thay $x = 0.5$ vào hàm Lorenz phân phối tài sản vùng A.
      $L_A(0.5) = (0.5)^2 = 0.25 (25\%)$. => *A ĐÚNG.*
    ]
    #step[
      *Lập luận câu B:* Tính tỷ lệ tài sản thuộc về $50\%$ dân số nghèo nhất ở vùng B:
      $L_B(0.5) = (0.5)^3 = 0.125 (12.5\%)$.
      Do $12.5\% < 25\%$ (vùng B nghèo hơn vùng A đối với nửa dưới tầng lớp) nên họ nắm giữ tỷ lệ nhỏ hơn. => *B SAI.*
    ]
    #step[
      *Lập luận câu C:* Tỷ lệ tài sản của nhóm $20\%$ giàu nhất (từ $0.8$ đến $1.0$):
      - Vùng A: $1 - L_A(0.8) = 1 - (0.8)^2 = 1 - 0.64 = 0.36$.
      - Vùng B: $1 - L_B(0.8) = 1 - (0.8)^3 = 1 - 0.512 = 0.488$.
      Tỷ số này là $0.488 / 0.36 approx 1.355$. Giá trị này không vượt quá 2 lần. => *C SAI.*
    ]
    #step[
      *Lập luận câu D:* Giao điểm hai đường cong phân phối nằm ở $x=0$ và $x=1$. Trên khoảng $(0, 1)$ thì $x^2 > x^3$ nên $L_A(x) nằm trên L_B(x)$.
      Diện tích $S_g$ giới hạn bởi hai đường cong:
      $ S_g = integral_0^1 (L_A(x) - L_B(x)) dif x = integral_0^1 (x^2 - x^3) dif x $
      $ S_g = [frac(x^3, 3) - frac(x^4, 4)]_0^1 = frac(1, 3) - frac(1, 4) = frac(1, 12) $ => *D ĐÚNG.*
    ]
  ]
)
