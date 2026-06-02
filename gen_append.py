import re

with open("typst/exams/CD-Sự-Tiếp-Xúc-2-Đường-Cong.typ", "r", encoding="utf-8") as f:
    text = f.read()

new_content = r"""
== Bài 10. Kỷ Niệm Chương Pha Lê - Parabol Ghép Trơn Hyperbol

#tln(
  [Một doanh nghiệp sản xuất cúp pha lê thiết kế một *kỷ niệm chương nguyên khối* có dạng khối tròn xoay. Trên bản vẽ 2D với hệ trục tọa độ $O x y$, mặt cắt dọc của kỷ niệm chương hợp bởi ba đoạn giao nhau:
  - Thân trên là parabol $y = 3 - x^2$ với đỉnh $P(0; 3)$.
  - Thân giữa là hyperbol $y = frac(2, x)$. Parabol và hyperbol ghép trơn với nhau tại điểm $N$.
  - Đế trụ phẳng có biên thẳng đứng $x = 2$, kéo từ $y = 0$ đến mép dưới hyperbol.

  Khối pha lê được sinh ra khi miền phẳng mô tả trên quay quanh trục tung $O y$. Hãy xác định điểm ghép nối $N$, tính thể tích khối cúp. Biết $1$ đơn vị độ dài hệ trục tương ứng với $2" cm"$, khối lượng riêng của pha lê là $3.1" g/cm"^3$ và đơn giá pha lê thô là $800" VNĐ/g"$. Tính số tiền vật liệu cần mua để đúc 1000 sản phẩm này (đơn vị: triệu đồng, làm tròn 1 chữ số thập phân).
  ],
  [405.1],
  fig: fig-panel(cetz.canvas(length: 0.95cm, {
    import cetz.draw: *

    let para = ()
    for i in range(21) {
      let y = 2.0 + i * 1.0 / 20.0
      para.push((calc.sqrt(3.0 - y), y))
    }
    
    let hyper = ()
    for i in range(21) {
      let y = 1.0 + i * 1.0 / 20.0
      hyper.push((2.0 / y, y))
    }

    let fill-pts = ((0.0, 0.0), (2.0, 0.0), (2.0, 1.0))
    for p in hyper { fill-pts.push(p) }
    for p in para { fill-pts.push(p) }
    fill-pts.push((0.0, 3.0))

    line(..iso-points(fill-pts), close: true, fill: rgb(189, 195, 199, 32), stroke: none)
    line(..fill-pts, close: true, fill: rgb(174, 214, 241, 60), stroke: none)
    line(..iso-points(para), stroke: 2.1pt + fig-shadow)
    line(..iso-points(hyper), stroke: 2.1pt + fig-shadow)
    line((2.18, -0.14), (2.18, 0.86), stroke: 2.1pt + fig-shadow)

    line(..para, stroke: 1.4pt + rgb("1A5276"))
    line(..hyper, stroke: 1.4pt + rgb("C0392B"))
    line((2.0, 0.0), (2.0, 1.0), stroke: 1.4pt + rgb("117A65"))

    line((-0.2, 0.0), (2.8, 0.0), mark: (start: "<", end: ">"), stroke: 0.6pt)
    line((0.0, -0.2), (0.0, 3.5), mark: (end: ">"), stroke: 0.6pt)
    content((2.65, -0.18), $x$)
    content((-0.2, 3.5), $y$)

    circle((1.0, 2.0), radius: 1.4pt, fill: black)
    content((1.2, 2.1), text(size: 8pt)[$N(1; 2)$])
  })),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #reset-step()
    #step[
      *Tìm điểm ghép và kiểm tra tính ghép trơn.*

      Phương trình hoành độ giao điểm của parabol và hyperbol:
      $3 - x^2 = frac(2, x) <=> x^3 - 3x + 2 = 0 <=> (x - 1)^2(x + 2) = 0.$
      Với $x > 0$, ta nhận nghiệm kép $x = 1$, suy ra $y = 2$. Vậy $N(1; 2)$.

      Đạo hàm của $y = 3 - x^2$ là $y' = -2x$, tại $x=1$ thì $y' = -2$.
      \ Đạo hàm của $y = 2/x$ là $y' = -2/x^2$, tại $x=1$ thì $y' = -2$.
      Hai đường cong chung tiếp tuyến tại $N$, tạo nên mặt ghép trơn cực kỳ thẩm mỹ!
    ]
    #step[
      *Tính tổng thể tích khối cúp quanh $O y$.*
      
      Viết đường biên x theo y:
      - Từ $y=2$ đến $y=3$: $x = sqrt(3 - y) => V_1 = pi integral_2^3 (3 - y) dif y = 0.5 pi$.
      - Từ $y=1$ đến $y=2$: $x = 2/y => V_2 = pi integral_1^2 frac(4, y^2) dif y = 2 pi$.
      - Đáy trụ từ $y=0$ đến $y=1$: $x = 2 => V_3 = pi integral_0^1 2^2 dif y = 4 pi$.

      Tổng thể tích: $V_"chuẩn" = V_1 + V_2 + V_3 = 6.5 pi$.
    ]
    #step[
      *Tính toán vật lý và báo giá.*
      
      Do 1 đơn vị bằng $2" cm"$, ta phải nhân lập phương tỷ lệ:
      $V_"thực" = 6.5 pi dot 2^3 = 52 pi " cm"^3.$

      Khối lượng một chiếc cúp: $m = V_"thực" dot rho = 52 pi dot 3.1 = 161.2 pi approx 506.42 " (g)"$.
      \ Số tiền mua pha lê cho 1000 cúp: 
      $T = 1000 times 506.425 times 800 approx 405 139 800 " (VNĐ)". $
      Làm tròn theo yêu cầu, ta được *405,1* triệu đồng. Khung bài đánh mạnh năng lực tích hợp Toán - Vật lý - Kinh tế.
    ]
  ],
)


== Bài 11. Quả Dọi Bằng Đồng - Khối Nón Cắt Khối Cầu

#tln(
  [Phần đo kiểm của một *quả dọi kỹ thuật* làm từ đồng thỏi có mặt cắt rỗng trong bản vẽ 2D được định hình bởi:
  - Cung tròn trên: $x^2 + y^2 = 4$ nằm trong khoảng $-1 <= y <= 2$.
  - Cung nón dưới: đường thẳng nối từ đỉnh $P(0; -4)$ và tiếp xúc hoàn hảo với cung tròn ở điểm $N$. \
  Khi xoay 360 độ quanh trục $O y$, ta thu được hình khối $3 D$ của quả dọi.
  
  Mọi đơn vị đồ thị là $2" cm"$. Vật liệu đồng thỏi có khối lượng riêng $8.7" g/cm"^3$. Biết giá khai thác và đúc đồng nguyên khối là $150 000" VNĐ/kg"$. Xác định khoảng cách từ đỉnh $P$ đến vị trí ghép trơn $N$, tính khối lượng quả dọi và chi phí vật liệu (đơn vị: nghìn đồng, làm tròn một chữ số thập phân).
  ],
  [393.6],
  fig: fig-panel(cetz.canvas(length: 0.7cm, {
    import cetz.draw: *

    let circ = ()
    for i in range(31) {
      let y = -1.0 + i * 3.0 / 30.0
      circ.push((calc.sqrt(4.0 - y*y), y))
    }
    
    let cone = ( (0.0, -4.0), (calc.sqrt(3.0), -1.0) )

    let fill-pts = ((0.0, -4.0), (calc.sqrt(3.0), -1.0))
    for p in circ { fill-pts.push(p) }
    fill-pts.push((0.0, 2.0))

    line(..iso-points(fill-pts), close: true, fill: rgb(189, 195, 199, 42), stroke: none)
    line(..fill-pts, close: true, fill: rgb(243, 156, 18, 80), stroke: none)
    line(..iso-points(circ), stroke: 2.1pt + fig-shadow)
    
    line((0.18, -4.14), (calc.sqrt(3.0)+0.18, -1.14), stroke: 2.1pt + fig-shadow)

    line(..circ, stroke: 1.4pt + rgb("1A5276"))
    line(..cone, stroke: 1.4pt + rgb("C0392B"))

    line((-2.5, 0.0), (2.5, 0.0), mark: (start: "<", end: ">"), stroke: 0.6pt)
    line((0.0, -4.5), (0.0, 3.0), mark: (end: ">"), stroke: 0.6pt)
    content((2.35, -0.2), $x$)
    content((-0.2, 2.8), $y$)

    circle((calc.sqrt(3.0), -1.0), radius: 1.4pt, fill: black)
    content((calc.sqrt(3.0) + 0.3, -1.0), text(size: 8pt)[$N$])
  })),
  fig-pos: "right",
  fig-width: 33%,
  loigiai: [
    #reset-step()
    #step[
      *Tìm tọa độ tiếp điểm quy chuẩn.*
      
      Phương trình giao tiếp tuyến: Đường thẳng từ $P(0; -4)$ tiếp xúc đường tròn $x^2 + y^2 = 4$.
      Gọi tiếp điểm $N(x_0; y_0)$. Tiếp tuyến tại $N$ là $x x_0 + y y_0 = 4$.
      Vì đi qua $P(0; -4)$, thay $x=0, y=-4 => -4y_0 = 4 => y_0 = -1$.
      Thay lại vào đường tròn $x_0^2 + 1 = 4 => x_0 = sqrt(3)$. Điểm nối tuyệt mỹ tại $N(sqrt(3); -1)$.
    ]
    #step[
      *Thiết lập hệ tọa độ sinh khối xoay.*
      
      Đường kính nón là đoạn thẳng qua $(0; -4)$ và $(sqrt(3); -1)$, hệ số góc $x'_y = 1/sqrt(3)$.
      Hàm nón: $x = frac(y + 4, sqrt(3))$ kéo dài từ $y = -4$ đến $y = -1$.
      Hàm nắp cầu: $x = sqrt(4 - y^2)$ từ $y = -1$ đến $y = 2$.
      
      Thể tích chuẩn trên trục $O y$:
      $V_"nón" &= pi integral_(-4)^(-1) frac((y + 4)^2, 3) dif y = pi/3 (frac((y + 4)^3, 3))|_(-4)^(-1) = 3 pi.$
      $V_"cầu" &= pi integral_(-1)^2 (4 - y^2) dif y = pi (4y - y^3/3)|_(-1)^2 = 9 pi.$
      Tổng cộng: $V_"chuẩn" = 12 pi.$
    ]
    #step[
      *Chuyển hệ đánh giá thực tiễn.*
      
      Nhân tỷ lệ thể tích cho hệ tọa độ scale "1 ăn 2":
      $V_"thực" = 12 pi dot 2^3 = 96 pi " cm"^3 approx 301.59 " cm"^3.$

      Khối lượng đồng: $m = 301.59 dot 8.7 approx 2623.86 " (g)" = 2.624 " (kg)". $ \
      Chi phí vật liệu: $C = 2.624 times 150000 = 393600 " VNĐ". $ 
      Quy tròn số tiền ra nghìn ta được *393,6*.
    ]
  ],
)


== Bài 12. Con Quay Gỗ Mộc - Logarit Ôm Lấy Đường Thẳng

#tln(
  [Một món đồ chơi *con quay gỗ (xu dĩ)* được tiện bằng máy CNC. Mặt cắt dọc của món đồ chơi xoay quanh trục $O x$ khớp với diện tích mặt phẳng chắn bởi các đường:
  - Hàm logarit tự nhiên $y = ln(x)$.
  - Trục hoành $y = 0$.
  - Đường thẳng $d$ đi qua gốc tọa độ và *tiếp xúc* với đồ thị $ln(x)$.
  
  Sau khi xoay vùng này quanh $O x$, ta đem khối này tiện trên phôi gỗ Gõ Đỏ (khối lượng riêng $0.8" g/cm"^3$). Quy ước 1 đơn vị đồ thị dài đúng $10" cm"$. Giá vật liệu gỗ khối là $80 000" VNĐ/kg"$ và tiền duy trì máy CNC cắt gọt là $50 000" VNĐ"$ mỗi sản phẩm. Tính giá thành xuất xưởng trọn gói của một con quay (đơn vị: nghìn đồng, làm tròn một chữ số thập phân).
  ],
  [87.8],
  fig: fig-panel(cetz.canvas(length: 1.0cm, {
    import cetz.draw: *

    let log_c = ()
    for i in range(21) {
      let x = 1.0 + i * (calc.e - 1.0) / 20.0
      log_c.push((x, calc.ln(x)))
    }
    
    let lin_c = ((0.0, 0.0), (calc.e, 1.0))

    let fill-pts = ((0.0, 0.0),)
    for p in log_c.rev() { fill-pts.push(p) }
    
    // The shaded region is above ln(x) and under x/e and above y=0
    let shade = ()
    shade.push((0,0))
    for x in range(1, 21) {
       let xx = x * 1.0 / 20.0
       shade.push((xx, xx / calc.e))
    }
    // from 1 to e
    for x in range(20, -1, step: -1) {
       let xx = 1.0 + x * (calc.e - 1.0) / 20.0
       shade.push((xx, calc.ln(xx)))
    }
    line(..shade, close: true, fill: rgb(211, 84, 0, 40), stroke: none)

    // draw the 3d projection hints
    let shade2 = ()
    for p in shade { shade2.push((p.at(0), -p.at(1))) }
    line(..shade2, close: true, fill: rgb(211, 84, 0, 15), stroke: none)
    
    line(..log_c, stroke: 1.4pt + rgb("117A65"))
    line(..lin_c, stroke: 1.4pt + rgb("C0392B"))
    
    // mirror curves for visual 
    let log_c_m = log_c.map(p => (p.at(0), -p.at(1)))
    let lin_c_m = lin_c.map(p => (p.at(0), -p.at(1)))
    line(..log_c_m, stroke: (dash: "dashed", paint: rgb("117A65")))
    line(..lin_c_m, stroke: (dash: "dashed", paint: rgb("C0392B")))

    line((-0.2, 0.0), (3.3, 0.0), mark: (start: "<", end: ">"), stroke: 0.8pt)
    line((0.0, -1.5), (0.0, 1.5), mark: (end: ">"), stroke: 0.6pt)
    content((3.1, -0.2), $x$)
    content((-0.2, 1.3), $y$)

    circle((calc.e, 1.0), radius: 1.4pt, fill: black)
    content((calc.e + 0.3, 1.0), text(size: 8pt)[$M(e; 1)$])
  })),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #reset-step()
    #step[
      *Truy vết đường tiếp xúc Logarit.*
      
      Đường thẳng qua gốc tọa độ có dạng $y = k x$.
      Tại điểm tiếp xúc $x_0$, ta có hệ:
      $k x_0 = ln(x_0)$ và $k = frac(1, x_0)$.
      Suy ra $frac(x_0, x_0) = ln(x_0) => ln(x_0) = 1 => x_0 = e$.
      Thế vào được $k = 1/e$. Phương trình đường thẳng là $y = x/e$, điểm tiếp xúc siêu trơn ở $M(e; 1)$.
    ]
    #step[
      *Tích phân kép xử lý mặt chắn hình côn.*
      
      Miền bị chắn giới hạn bởi nón ngoài $y = x/e$ sinh ra và cái ruột bị khoét lõm bởi $y = ln(x)$ từ $x = 1$ đến $e$.
      
      Thể tích khối đặc tổng hợp (quay trục hoành $O x$):
      $V = V_"nón" - V_"khoét" = pi integral_0^e (frac(x, e))^2 dif x - pi integral_1^e (ln(x))^2 dif x.$
      Tính dễ dàng $V_"nón" = pi (e/3)$. 
      Tích phân từng phần 2 lần với hàm Logarit sinh ra: $integral (ln(x))^2 = x(ln(x))^2 - 2x ln(x) + 2x$.
      Do đó $V_"khoét" = pi(e - 2)$. 
      $V = pi(frac(e, 3) - e + 2) = pi(2 - frac(2e, 3)) approx 0.5900 " (đvtt)". $
    ]
    #step[
      *Thực tế hóa quy mô hệ tọa độ.*
      
      Scale đồ thị 10 lần thì khối lượng dội lên theo lập phương:
      $V_"thực" = 0.5900 times 10^3 = 590.0 " cm"^3.$
      Cân nặng gỗ: $m = 590.0 times 0.8 = 472.0 " g" = 0.472 " kg".$
      
      Khối lượng tiền:
      Tiền gỗ là $0.472 times 80 000 = 37 760 " VNĐ"$.
      Phí gia công $50 000 " VNĐ"$.
      Tổng tiền = $87 760 " VNĐ"$. Nhập kết quả quy tròn là *87,8* nghìn đồng.
    ]
  ],
)
"""

table_insert_str = r"""
    [8], [Phễu công nghiệp - parabol + quả cầu], [$r$], [*2.50*],
    [9], [Đèn pha ô tô - parabol + cung tròn], [$S$], [*0.38*],
    [10], [Cúp pha lê - parabol tiếp tuyến hyperbol], [Cost], [*405.1*],
    [11], [Quả dọi kỹ thuật - nón ghép đỉnh nắp cầu], [Cost], [*393.6*],
    [12], [Con quay gỗ - hàm logarit tự nhiên lõm], [Cost], [*87.8*],
"""

parts = text.split("= III. TỔNG KẾT NHANH")
if len(parts) == 2:
    upper = parts[0]
    lower = parts[1]
    
    # replace table in lower
    old_table_rows = r"""    [8], [Phễu công nghiệp - parabol + quả cầu], [$r$], [*2.50*],
    [9], [Đèn pha ô tô - parabol + cung tròn], [$S$], [*0.38*],"""
    lower = lower.replace(old_table_rows, table_insert_str.strip())
    
    final_text = upper + new_content + "\n= III. TỔNG KẾT NHANH" + lower
    
    with open("typst/exams/CD-Sự-Tiếp-Xúc-2-Đường-Cong.typ", "w", encoding="utf-8") as f:
        f.write(final_text)
    print("Injected perfectly!")
else:
    print("Could not find split point")
