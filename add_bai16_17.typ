== Bài 16. Ước lượng Tích phân Phân phối Thu nhập (Đúng/Sai)
#ds(
  [Bảng dữ liệu sau khảo sát về thu nhập tại một quốc gia, chia dân số thành 4 nhóm bằng nhau từng $25\%$ từ thu nhập thấp đến cao:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto, auto),
      align: center,
      [$x$ (phần trăm dân số lũy kế)], [0%], [25%], [50%], [75%], [100%],
      [$L(x)$ (phần trăm thu nhập lũy kế)], [0%], [5%], [20%], [45%], [100%]
    )
  ]
  Biết đường cong Lorenz biểu diễn tỷ lệ thu nhập nội suy đi qua các điểm này. Các khẳng định sau đây là đúng hay sai?],
  (
    True([Theo dữ liệu khảo sát, có $50\%$ dân số thuộc nhóm thu nhập thấp nhất nhưng chỉ sở hữu đúng $\frac{1}{5}$ tổng thu nhập quốc gia.]),
    True([Tính trung bình, một người thuộc nhóm $25\%$ dân số giàu nhất có thu nhập gấp 11 lần một người thuộc nhóm $25\%$ nghèo nhất.]),
    False([Tích phân tính diện tích phân bố $integral_0^1 L(x) dif x$ được xấp xỉ bằng $0.35$ theo quy tắc hình thang.]),
    False([Hệ số bất bình đẳng Gini cấu thành từ biểu đồ khảo sát này xấp xỉ bằng $0.30$.])
  ),
  fig: fig-panel(cetz.canvas(length: 4.5cm, {
    import cetz.draw: *
    let pts = ((0.0, 0.0), (0.25, 0.05), (0.50, 0.20), (0.75, 0.45), (1.0, 1.0))
    
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
      *Lập luận câu A:* Từ bảng số liệu, tại mốc $50\%$ dân số ($x=0.5$), phần trăm thu nhập là $20\%$ ($0.2$). Tỷ lệ này là $\frac{1}{5}$. => *A ĐÚNG.*
    ]
    #step[
      *Lập luận câu B:* 
      - Cần nắm rõ nhóm 25% *giàu nhất* nằm trong đoạn $x \in [0.75, 1]$. Tài sản của họ là: $L(1) - L(0.75) = 1.0 - 0.45 = 0.55$.
      - Nhóm 25% *nghèo nhất* trong đoạn $x \in [0, 0.25]$. Tài sản là $L(0.25) = 0.05$.
      Tỷ số thu nhập của hai nhóm là $0.55 / 0.05 = 11$ lần. => *B ĐÚNG.*
    ]
    #step[
      *Lập luận câu C:* 
      Áp dụng tích phân hình thang để tính diện tích phần phẳng phía dưới đường Lorenz với độ chia đều $Delta x = 0.25$:
      $ integral_0^1 L(x) dif x approx frac(0.25, 2) [L(0) + 2(L(0.25) + L(0.50) + L(0.75)) + L(1)] $
      $ S approx 0.125 [0 + 2(0.05 + 0.20 + 0.45) + 1.0] =  0.125 [2(0.70) + 1.0] $
      $ S approx 0.125 [2.40] = 0.30 $
      Giá trị ước lượng tích phân là $0.30$, không phải $0.35$. => *C SAI.*
    ]
    #step[
      *Lập luận câu D:* 
      Hệ số Gini được tính từ phần diện tích tích phân $S = 0.30$:
      $ G = 1 - 2S = 1 - 2(0.30) = 0.40 $
      Dữ liệu hình thành hệ số Gini $G = 0.40$ (mức độ bất bình đẳng vừa phải) chứ không phải $0.30$. => *D SAI.*
    ]
  ]
)

== Bài 17. Đối chiếu Mô hình Liên tục và Dữ liệu Rời rạc (Đúng/Sai)
#ds(
  [Một quốc gia dự báo phân phối thu nhập theo mô hình hàm liên tục $L_{d}(x) = x^2$. Tuy nhiên, báo cáo thống kê thu nhập thực địa ở cuối năm ghi nhận lại bảng phân nhóm sau:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center,
      [$x$ (phần trăm dân số lũy kế)], [0%], [50%], [100%],
      [$L_{t}(x)$ (phần trăm thu nhập thực tế)], [0%], [20%], [100%]
    )
  ]
  Các khẳng định đối chiếu sau đây là đúng hay sai?],
  (
    True([Theo mô hình đạo báo, hệ số Gini của quốc gia bằng $frac(1, 3)$.]),
    True([Số liệu thực tế phản ánh nhóm $50\%$ dân số trung lưu và giàu nhất sở hữu $80\%$ thu nhập toàn quốc.]),
    False([Phép bù hình thang để lấy tích phân $integral_0^1 L_t (x) dif x$ theo số liệu thực cho giá trị bằng $0.30$.]),
    True([Dựa trên so sánh hệ số Gini, số liệu thực tế ghi nhận một phân phối bình đẳng hơn đôi chút so với dự báo của mô hình liên tục.])
  ),
  fig-pos: "right",
  loigiai: [
    #reset-step()
    #step[
      *Lập luận câu A:* Diện tích phân phối theo lý thuyết: 
      $ S_d = integral_0^1 L_d (x) dif x = integral_0^1 x^2 dif x = frac(1, 3) $
      Hệ số Gini trên lý thuyết là: $ G_d = 1 - 2S_d = 1 - frac(2, 3) = frac(1, 3) $. => *A ĐÚNG.*
    ]
    #step[
      *Lập luận câu B:* Nhóm $50\%$ từ trung lưu đến giàu nằm trong đoạn $x \in [0.5, 1]$.
      Theo thực tế, tài sản nằm trong khoảng đó là $L_t(1) - L_t(0.5) = 1.0 - 0.20 = 0.80$, tương ứng $80\%$. => *B ĐÚNG.*
    ]
    #step[
      *Lập luận câu C:* Áp dụng tính tích phân qua quy tắc hình thang cho số liệu rời rạc ($Delta x = 0.5$):
      $ S_t = integral_0^1 L_t (x) dif x approx frac(0.5, 2) [L_t(0) + 2 L_t(0.5) + L_t(1)] $
      $ S_t approx 0.25 [0 + 2(0.20) + 1.0] = 0.25 [0.40 + 1.0] = 0.25 \times 1.40 = 0.35 $
      Giá trị diện tích là $0.35$. => *C SAI.*
    ]
    #step[
      *Lập luận câu D:* 
      - Theo mô hình liên tục: $G_d = 1/3 approx 0.333$
      - Theo thực tế rời rạc: $G_t = 1 - 2S_t = 1 - 2(0.35) = 0.30$
      Vì $0.30 < 0.333$ nên số liệu thực cho thấy Gini nhỏ hơn, mô tả xã hội ít bất bình đẳng (bình đẳng hơn) so với dự báo mô hình. => *D ĐÚNG.*
    ]
  ]
)
