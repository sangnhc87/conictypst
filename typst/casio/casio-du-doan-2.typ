#import "casio-template.typ": *
#import "@preview/cetz:0.5.2"

#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
)
#set text(font: "Times New Roman", size: 12pt)

// Tuỳ chọn show-solution: false (chỉ hiện đề) hoặc true (hiện đề và lời giải/đáp án)
#casio-exam-render(
  institute: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  exam-name: "ĐỀ THI DỰ ĐOÁN HỌC SINH GIỎI TP HỒ CHÍ MINH",
  subject: "Môn thi: TOÁN 12 THPT (ĐỀ DỰ ĐOÁN SỐ 2 - SỬ DỤNG MTCT)",
  time: "120 phút",
  year: "2025 - 2026",
  show-solution: true,
  casio-question(
    point: 2,
    answer: "2",
    theory: [Chứng minh tính chất hàm số lẻ và đơn điệu đồng biến của $f(x) = ln(x + sqrt(x^2+1)) + x^3$. Giải phương trình lượng giác đưa về dạng $sin 2x = 0$. Tìm các điểm biểu diễn nghiệm trên đường tròn lượng giác và tính diện tích hình vuông.],
    solution: [
      Ta có $f(x) = ln(x + sqrt(x^2+1)) + x^3$.
      
      Tập xác định $D = RR$.
      
      $f(-x) = ln(-x + sqrt(x^2+1)) - x^3 = ln(1/(x + sqrt(x^2+1))) - x^3 = -ln(x + sqrt(x^2+1)) - x^3 = -f(x)$.
      
      Do đó $f(x)$ là hàm số lẻ.
      
      Mặt khác, đạo hàm $f'(x) = 1/sqrt(x^2+1) + 3x^2 > 0, forall x in RR$.
      Do đó hàm số $f(x)$ đồng biến trên $RR$.
      
      Phương trình đã cho tương đương:
      $f(3 sin 2x) = -f(sin 2x) <=> f(3 sin 2x) = f(-sin 2x)$.
      Do $f(x)$ đồng biến trên $RR$ nên phương trình tương đương:
      $3 sin 2x = -sin 2x <=> sin 2x = 0 <=> 2x = k pi <=> x = k pi/2$.
      
      Các nghiệm thuộc đoạn $[0; 2pi]$ là: $0, pi/2, pi, (3pi)/2, 2pi$.
      Các điểm biểu diễn các nghiệm này trên đường tròn lượng giác là các điểm trùng nhau $(1; 0)$, $(0; 1)$, $(-1; 0)$ và $(0; -1)$.
      Đây là 4 đỉnh của một hình vuông nội tiếp đường tròn lượng giác có bán kính $R = 1$.
      Diện tích đa giác (hình vuông): $S = 2 R^2 = 2 * 1^2 = 2$.
    ]
  )[
    Cho hàm số $f(x) = ln(x + sqrt(x^2+1)) + x^3$. Tìm diện tích đa giác tạo bởi các điểm biểu diễn nghiệm thuộc đoạn $[0; 2pi]$ của phương trình $f(3 sin 2x) + f(sin 2x) = 0$ trên đường tròn lượng giác (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: (
      "a) 1220",
      "b) 23"
    ),
    theory: [Số chữ số của một số $N$ được tính bằng $k = floor(log_10 N) + 1$. Các chữ số đầu tiên của $N$ được xác định thông qua phần thập phân của $log_10 N$. Vì $4^2026 >> 3^2026$, ta xấp xỉ tổng bằng số hạng lớn nhất.],
    solution: [
      a) Do $4^2026 >> 3^2026$, ta có $B = 4^2026 (1 + (3/4)^2026) approx 4^2026$.
      
      Ta có $log_10 B approx 2026 log_10 4 approx 1219.77354$.
      
      Số chữ số của $B$ là $1219 + 1 = 1220$ chữ số.
      
      b) Phân tích phần thập phân của logarit: $log_10 B = 1219.77354$.
      
      Ta có $B = 10^1219.77354 = 10^0.77354 * 10^1219$.
      
      Bấm Casio $10^0.77354 approx 5.9367...$. Do đó 4 chữ số đầu tiên của $B$ là $5, 9, 3, 6$.
      
      Tổng $a+b+c+d = 5+9+3+6 = 23$.
    ]
  )[
    Cho số tự nhiên $B = 3^2026 + 4^2026 = overline(a b c d...)$ \
    a) Tính số chữ số của $B$. \
    b) Tính tổng $a+b+c+d$.
  ],
  casio-question(
    point: 2,
    answer: "1,94",
    theory: [Khoảng cách ngắn nhất giữa điểm trên parabol và đường thẳng được đưa về bài toán tìm giá trị nhỏ nhất của hàm số bậc hai bằng cách dùng công thức khoảng cách từ một điểm đến đường thẳng trong mặt phẳng tọa độ Oxy.],
    solution: [
      Lấy điểm $M(x; x^2 - 2x + 3)$ thuộc parabol $(P)$.
      
      Khoảng cách từ $M$ đến đường thẳng $d: x - y - 2 = 0$ được tính bằng:
      $d(M, d) = |x - (x^2 - 2x + 3) - 2| / sqrt(1^2 + (-1)^2) = (x^2 - 3x + 5) / sqrt(2)$.
      
      Xét hàm số bậc hai ở tử thức: $f(x) = x^2 - 3x + 5$.
      Giá trị nhỏ nhất của $f(x)$ đạt được tại đỉnh parabol $x = -b/(2a) = 1.5$.
      
      Khi đó $f(1.5) = 1.5^2 - 3(1.5) + 5 = 2.75$.
      
      Khoảng cách ngắn nhất: $d_min = 2.75 / sqrt(2) approx 1.9445 approx 1.94$.
    ]
  )[
    Cho điểm $M$ di động trên parabol $(P): y = x^2 - 2x + 3$ và điểm $N$ di động trên đường thẳng $d: y = x - 2$. Tìm giá trị nhỏ nhất của khoảng cách $M N$ (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: "63943,43",
    theory: [Sử dụng tính chất khoảng cách từ hình chiếu vuông góc xuống cạnh đáy của tam giác đều. Chiều cao $h$ tính qua khoảng cách và tang của góc giữa mặt bên và đáy.],
    solution: [
      Diện tích đáy tam giác đều: $S_(A B C) = (85^2 sqrt(3)) / 4 approx 3128.528$.
      
      Kẻ $H E perp A B$ tại $E$. Do góc giữa $(S A B)$ và đáy là $48^degree$ nên góc $S E H = 48^degree => h = S H = H E tan 48^degree$.
      
      Vì $H B = 3 H C$ và $B C = 85$ nên $H B = 3/4 * 85 = 63.75$.
      Trong tam giác vuông $H E B$ tại $E$ (có góc $hat(B) = 60^degree$):
      $H E = H B sin 60^degree = 63.75 * sqrt(3)/2 approx 55.209$.
      
      Chiều cao $h = 55.209 * tan 48^degree approx 61.317$.
      
      Thể tích khối chóp: $V = 1/3 S_(A B C) * h = 1/3 * 3128.528 * 61.317 approx 63943.43$.
    ]
  )[
    Cho hình chóp $S.A B C$ có đáy $A B C$ là tam giác đều cạnh $85$. Hình chiếu vuông góc của đỉnh $S$ trên mặt phẳng đáy $(A B C)$ là điểm $H$ thuộc đoạn $B C$ sao cho $H B = 3 H C$. Biết góc giữa mặt bên $(S A B)$ và mặt phẳng đáy bằng $48^degree$. Tính thể tích khối chóp $S.A B C$ (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: (
      "a) 6",
      "b) 2,73"
    ),
    theory: [Tịnh tiến tâm đối xứng của Hypebol về gốc tọa độ. Áp dụng các tính chất hình học của tiếp tuyến Hypebol: diện tích tam giác tạo bởi tiếp tuyến và hai tiệm cận luôn không đổi; tìm điểm đạt chu vi nhỏ nhất bằng bất đẳng thức AM-GM.],
    solution: [
      Tâm đối xứng của đồ thị là $I(1; 1)$. Tịnh tiến hệ trục tọa độ về gốc $I$, phương trình đường cong trở thành $Y = 3/X$.
      
      Với điểm $M(X_0; Y_0)$ thuộc đồ thị ($X_0 > 0$):
      Tiếp tuyến tại $M$ có phương trình $Y = -3/X_0^2 X + 6/X_0$.
      Tiếp tuyến cắt các tiệm cận tại $A(0; 6/X_0)$ và $B(2X_0; 0)$.
      
      a) Diện tích tam giác $I A B$: $S = 1/2 I A * I B = 1/2 * (6/X_0) * 2X_0 = 6$.
      
      b) Bán kính đường tròn nội tiếp tam giác vuông $I A B$ là $r = S/p = 12 / (I A + I B + A B)$.
      Bán kính $r$ đạt giá trị lớn nhất khi mẫu số $P = 2X_0 + 6/X_0 + sqrt(4X_0^2 + 36/X_0^2)$ đạt giá trị nhỏ nhất.
      
      Áp dụng bất đẳng thức AM-GM, ta có $P$ nhỏ nhất khi $2X_0 = 6/X_0 <=> 2X_0^2 = 6 <=> X_0 = sqrt(3)$ (vì $X_0 > 0$).
      Hoành độ điểm $M$ khi đó là $x_M = X_0 + 1 = 1 + sqrt(3) approx 2.73$.
    ]
  )[
    Cho hàm số $y = (x+2)/(x-1)$ có đồ thị $(C)$. Tiếp tuyến $d$ của $(C)$ tại điểm $M$ có hoành độ $x_M > 1$ cắt hai đường tiệm cận tại $A$ và $B$. Gọi $I$ là tâm đối xứng của $(C)$. \
    a) Tính diện tích tam giác $I A B$. \
    b) Tìm hoành độ $x_M$ để bán kính đường tròn nội tiếp tam giác $I A B$ đạt giá trị lớn nhất (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: "-1",
    theory: [Sử dụng phương pháp sai phân bậc cao, phân tích tử thức thành vi phân rời rạc của mẫu số dạng $(n+1)^5 - n^5$ để rút gọn tổng thành chuỗi đan dấu tự triệt tiêu (Telescoping sum).],
    solution: [
      Biến đổi số hạng tổng quát:
      $a_n = (5n^4 + 10n^3 + 10n^2 + 5n + 1) / (n^5(n+1)^5) = ((n+1)^5 - n^5) / (n^5(n+1)^5) = 1/n^5 - 1/(n+1)^5$.
      
      Tổng $S = a_1 + a_2 + ... + a_2026 = (1/1^5 - 1/2^5) + (1/2^5 - 1/3^5) + ... + (1/2026^5 - 1/2027^5)$.
      
      Triệt tiêu các số hạng, ta còn lại: $m/n = 1 - 1/2027^5 = (2027^5 - 1)/2027^5$.
      
      Vì tử số và mẫu số là hai số nguyên liên tiếp nên phân số đã tối giản.
      
      $m = 2027^5 - 1$, $n = 2027^5$. Vậy $m - n = -1$.
    ]
  )[
    Cho dãy số $(a_n): a_n = (5n^4 + 10n^3 + 10n^2 + 5n + 1)/(n^5(n+1)^5)$. Biết $a_1 + a_2 + a_3 + ... + a_2026 = m/n$ với $m/n$ là phân số tối giản. Tính $m - n$.
  ],
  casio-question(
    point: 2,
    answer: "156",
    theory: [Sử dụng kỹ thuật nội suy đa thức bằng đa thức phụ. Đặt $Q(x) = P(x) - x^2$ để thu được đa thức bậc 5 có các nghiệm nguyên quen thuộc $1, 2, 3, 4, 5$.],
    solution: [
      Xét đa thức $Q(x) = P(x) - x^2$. 
      Vì $P(x)$ có bậc 5 và hệ số bậc cao nhất là 1, nên $Q(x)$ cũng là đa thức bậc 5 có hệ số bậc cao nhất là 1.
      
      Theo giả thiết: $P(k) = k^2 <=> Q(k) = 0$ với mọi $k=1,2,3,4,5$.
      Do đó $1,2,3,4,5$ chính là 5 nghiệm của đa thức $Q(x)$.
      
      Suy ra: $Q(x) = (x-1)(x-2)(x-3)(x-4)(x-5)$.
      
      Vậy $P(x) = (x-1)(x-2)(x-3)(x-4)(x-5) + x^2$.
      
      Tại $x = 6$:
      $P(6) = (6-1)(6-2)(6-3)(6-4)(6-5) + 6^2 = 5! + 36 = 120 + 36 = 156$.
    ]
  )[
    Cho đa thức $P(x)$ bậc $5$ có hệ số bậc cao nhất là $1$ thỏa mãn $P(k) = k^2, k = 1,2,3,4,5$. \
    Tính giá trị của $P(6)$.
  ],
  casio-question(
    point: 2,
    answer: (
      "a) x = 20, y = 150",
      "b) 2,14"
    ),
    theory: [Công thức xác định Số trung bình cộng và Độ lệch chuẩn của mẫu số liệu ghép nhóm bằng máy tính Casio.],
    solution: [
      Tổng tần số $N = x + 100 + y + 80 + 50 = 400 <=> x + y = 170$.
      
      Số trung bình cộng:
      $overline(x) = (x*1 + 100*3 + y*5 + 80*7 + 50*9) / 400 = 5.2 <=> x + 5y = 770$.
      
      Giải hệ phương trình bậc nhất hai ẩn, ta được:
      $x = 20$ và $y = 150$.
      
      b) Tính độ lệch chuẩn $s$:
      Phương sai $s^2 = [20(1-5.2)^2 + 100(3-5.2)^2 + 150(5-5.2)^2 + 80(7-5.2)^2 + 50(9-5.2)^2] / 400 = 4.56$.
      
      Độ lệch chuẩn $s = sqrt(4.56) approx 2.14$ (chính xác đến hai chữ số thập phân).
    ]
  )[
    Cho bảng số liệu ghép nhóm về điểm thi môn Toán của $400$ học sinh như sau:
    #align(center)[
      #table(
        columns: 6,
        align: center,
        stroke: 0.5pt,
        [Điểm số], [$[0; 2)$], [$[2; 4)$], [$[4; 6)$], [$[6; 8)$], [$[8; 10)$],
        [Tần số], [$x$], [$100$], [$y$], [$80$], [$50$]
      )
    ]
    Biết số trung bình cộng của mẫu số liệu trên là $overline(x) = 5.2$. \
    a) Xác định tần số ẩn $x$ và $y$. \
    b) Tính độ lệch chuẩn của mẫu số liệu ghép nhóm trên (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: (
      "a) 0,60",
      "b) 1901"
    ),
    theory: [Công thức diện tích phân đoạn tròn $S = arccos(1-h) - (1-h)sqrt(2h-h^2)$ (khi R=1). Thiết lập phương trình thể tích chứa dầu $V(h) = L * S$ và dùng tính năng SOLVE trên Casio để giải ngược tìm h.],
    solution: [
      Gọi $S(h)$ là diện tích thiết diện của phần chứa dầu (phân đoạn tròn có bán kính $R = 1$ m ở chiều cao mực dầu $h$ m):
      $S(h) = arccos(1-h) - (1-h)sqrt(2h-h^2)$ (đơn vị góc tính theo Radian, với $0 <= h <= 2$).
      
      Thể tích dầu trong bồn tương ứng với chiều cao $h$ là:
      $V(h) = L * S(h) = 5 * [arccos(1-h) - (1-h)sqrt(2h-h^2)]$ (m³).

      *a) Tính chiều cao mực nước $h$:*
      
      Thể tích bồn chứa: $V_"bồn" = pi R^2 L = pi * 1^2 * 5 = 5pi$ m³.
      
      Theo đề bài, thể tích dầu ban đầu $V_1 = 1/4 V_"bồn" = 1.25pi$ m³. Ta có phương trình:
      $5 * [arccos(1-h) - (1-h)sqrt(2h-h^2)] = 1.25pi$
      $<=> arccos(1-h) - (1-h)sqrt(2h-h^2) - 0.25pi = 0$.
      
      *Quy trình bấm máy Casio:*
      - Chuyển máy tính sang đơn vị góc Radian (`SHIFT` `MENU` -> `2` -> `2`).
      - Nhập phương trình vào màn hình máy tính:
        `cos⁻¹(1 - x) - (1 - x) * √(2x - x²) - 0.25 * π`
      - Bấm `SHIFT` `CALC` (SOLVE), nhập giá trị dò ban đầu $x = 0.5$ và bấm `=`.
      - Máy tính cho nghiệm: $x approx 0.59602725$ m.
      - Lưu giá trị này vào biến $A$ để tính toán không sai số: bấm `STO` `A`.
      
      Làm tròn kết quả đến hàng thập phân thứ hai sau dấu phẩy:
      $h approx 0.60$ m.

      *b) Tính thể tích dầu tăng thêm:*
      
      Khi mực nước tăng thêm $0.2$ m, chiều cao mực nước mới là $h' = h + 0.2$ m.
      Để tránh sai số tích lũy từ làm tròn trung gian, ta sử dụng giá trị chính xác của $h$ đã lưu trong biến $A$:
      - Trên máy tính Casio, tính $h' = A + 0.2$ và lưu vào biến $B$: bấm `A + 0.2` `STO` `B` (khi đó $B approx 0.79602725$ m).
      
      Thể tích dầu mới là:
      $V_2 = V(B) = 5 * [arccos(1-B) - (1-B)sqrt(2B-B^2)]$ m³.
      
      Thể tích dầu tăng thêm (đổi ra lít):
      $Delta V = (V_2 - V_1) * 1000$ (lít).
      
      *Quy trình bấm máy Casio:*
      - Nhập biểu thức tính thể tích tăng thêm trực tiếp vào máy tính:
        `1000 * (5 * (cos⁻¹(1 - B) - (1 - B) * √(2B - B²)) - 1.25 * π)`
      - Bấm phím `=`, kết quả nhận được trên màn hình là:
        $Delta V approx 1901.49666$ lít.
      
      Làm tròn kết quả đến hàng đơn vị, ta được:
      $Delta V approx 1901$ lít.
    ]
  )[
    #grid(
      columns: (1fr, auto),
      column-gutter: 1.5em,
      [
        Một bồn chứa dầu hình trụ nằm ngang có chiều dài bồn là $L = 5" m"$ và bán kính đáy bồn là $R = 1" m"$. Mực dầu trong bồn cao $h$ (m) đo từ đáy lên (như hình vẽ mặt cắt bên). \
        a) Biết thể tích dầu trong bồn bằng $1/4$ thể tích của bồn chứa, tính chiều cao mực nước $h$ (chính xác đến hàng thập phân thứ hai sau dấu phẩy). \
        b) Người ta bơm thêm dầu vào bồn để mực nước tăng thêm $0.2" m"$. Hỏi thể tích dầu tăng thêm bao nhiêu lít? (Lấy $1" m"^3 = 1000$ lít, làm tròn kết quả đến hàng đơn vị).
      ],
      align(center + horizon)[
        #cetz.canvas(length: 1.2cm, {
          import cetz.draw: *
          
          let c-cup = rgb("#1e293b")
          let c-oil = rgb("#fde68a") // màu dầu màu vàng hổ phách sáng
          let c-oil-surf = rgb("#fef3c7") // bề mặt dầu phản chiếu ánh sáng
          let c-oil-line = rgb("#d97706") // đường viền dầu màu vàng đậm
          let c-dim = rgb("#94a3b8")
          
          let R = 1.5
          let L = 3.5
          let kx = 0.4
          let ky = 0.25
          let p(x, y, z) = ((y + kx * x), (z + ky * x))
          
          // Chiều cao dầu thực tế h = 0.6 trên R = 1.0. 
          // Quy đổi sang R = 1.5 thì chiều cao tương ứng là h_dw = 0.6 * 1.5 = 0.9.
          // Mặt thoáng ở z-surf = -R + h_dw = -1.5 + 0.9 = -0.6.
          let z-surf = -0.6
          let y-surf = calc.sqrt(R * R - z-surf * z-surf) // khoảng 1.375
          
          // Góc tương ứng với mặt thoáng dầu
          let alpha1 = calc.atan2(-y-surf, z-surf)
          let alpha2 = calc.atan2(y-surf, z-surf)
          
          // Hàm sinh tập hợp điểm cung tròn tại vị trí x
          let arc-points(x, start-angle, end-angle) = {
            let pts = ()
            let n = 20
            for i in range(0, n + 1) {
              let angle = start-angle + i * (end-angle - start-angle) / n
              let py = R * calc.cos(angle)
              let pz = R * calc.sin(angle)
              pts.push(p(x, py, pz))
            }
            return pts
          }
          
          // 1. Tô màu thể tích dầu (Phần thân chất lỏng)
          let oil-poly = ()
          for pt in arc-points(0, alpha1, alpha2) { oil-poly.push(pt) }
          oil-poly.push(p(L, y-surf, z-surf))
          for pt in arc-points(L, alpha1, alpha2).rev() { oil-poly.push(pt) }
          oil-poly.push(p(0, -y-surf, z-surf))
          line(..oil-poly, close: true, fill: c-oil, stroke: none)
          
          // 2. Tô màu mặt thoáng dầu (hình phẳng phía trên)
          line(
            p(0, -y-surf, z-surf),
            p(0, y-surf, z-surf),
            p(L, y-surf, z-surf),
            p(L, -y-surf, z-surf),
            close: true,
            fill: c-oil-surf,
            stroke: none
          )
          
          // 3. Vẽ các nét khuất (dashed) của bồn ở phía sau
          // Góc tiếp tuyến của hình trụ trong phép chiếu song song
          let factor = calc.sqrt(1.0 + (ky / kx) * (ky / kx))
          let z-tangent = R / factor
          let y-tangent = - (ky / kx) * z-tangent
          
          let theta-t1 = calc.atan2(y-tangent, z-tangent)
          let theta-t2 = theta-t1 + 180deg
          
          // Nửa cung tròn khuất của đáy sau (x = L)
          line(..arc-points(L, theta-t1, theta-t2), stroke: (dash: "dashed", paint: c-dim, thickness: 0.5pt))
          
          // Đường sinh đáy của dầu ở phía khuất
          line(p(0, -y-surf, z-surf), p(L, -y-surf, z-surf), stroke: 0.5pt + c-oil-line, dash: "dashed")
          
          // 4. Vẽ các nét thấy (solid)
          // Đường sinh bồn phía dưới và phía trên
          line(p(0, y-tangent, z-tangent), p(L, y-tangent, z-tangent), stroke: 1.2pt + c-cup)
          line(p(0, -y-tangent, -z-tangent), p(L, -y-tangent, -z-tangent), stroke: 1.2pt + c-cup)
          
          // Đường sinh mặt nước phía thấy
          line(p(0, y-surf, z-surf), p(L, y-surf, z-surf), stroke: 1.2pt + c-oil-line)
          
          // Cung tròn thấy đáy sau (x = L)
          line(..arc-points(L, theta-t2, theta-t1 + 360deg), stroke: 1.2pt + c-cup)
          
          // Đường tròn đáy trước (x = 0) - thấy toàn bộ
          let front-circle-pts = ()
          for i in range(0, 101) {
            let angle = i * 3.6deg
            front-circle-pts.push(p(0, R * calc.cos(angle), R * calc.sin(angle)))
          }
          line(..front-circle-pts, stroke: 1.5pt + c-cup)
          
          // Đường viền mặt nước ở đáy trước
          line(p(0, -y-surf, z-surf), p(0, y-surf, z-surf), stroke: 1.5pt + c-oil-line)
          
          // 5. Vẽ hệ thống kí hiệu hình học (Tâm O, bán kính R, chiều cao h)
          // Tâm O
          circle(p(0, 0, 0), radius: 0.04, fill: c-cup, stroke: none)
          content(p(0, -0.15, 0.25), text(8pt)[$O$])
          
          // Trục đứng đứng trước
          line(p(0, 0, 0), p(0, 0, -R), stroke: (dash: "dashed", paint: c-dim, thickness: 0.5pt))
          
          // Bán kính R đáy trước
          let r-angle = 135deg
          line(p(0, 0, 0), p(0, R * calc.cos(r-angle), R * calc.sin(r-angle)), stroke: 0.75pt + c-dim, mark: (end: ">", fill: c-dim, size: 0.12))
          content(p(0, R/2 * calc.cos(r-angle) - 0.15, R/2 * calc.sin(r-angle) + 0.15), text(8pt, fill: c-cup)[$R$])
          
          // Chiều cao h (đáy trước)
          line(p(0, 0, -R), p(0, -1.8, -R), stroke: 0.5pt + c-dim)
          line(p(0, -y-surf, z-surf), p(0, -1.8, z-surf), stroke: 0.5pt + c-dim)
          line(p(0, -1.6, -R), p(0, -1.6, z-surf), stroke: 0.5pt + c-dim, mark: (start: ">", end: ">", fill: c-dim, size: 0.12))
          content(p(0, -1.75, (-R + z-surf)/2), text(8pt, fill: c-cup)[$h$], anchor: "east")
          
          // Chiều dài bồn L
          line(p(0, 0, -R), p(0, 0, -R - 0.6), stroke: 0.5pt + c-dim)
          line(p(L, 0, -R), p(L, 0, -R - 0.6), stroke: 0.5pt + c-dim)
          line(p(0, 0, -R - 0.45), p(L, 0, -R - 0.45), stroke: 0.5pt + c-dim, mark: (start: ">", end: ">", fill: c-dim, size: 0.12))
          content(p(L/2, 0, -R - 0.5), text(8pt, fill: c-cup)[$L$], anchor: "north")
        })
      ]
    )
  ],
  casio-question(
    point: 2,
    answer: (
      "u_15 = 176,40",
      "u_16 = 244,22",
      "u_17 = 337,87"
    ),
    theory: [Quy trình lặp trên máy tính Casio chứa phép chia và biến đếm để tính số hạng của dãy số truy hồi bậc cao.],
    solution: [
      Gán các giá trị ban đầu trên Casio: $A = 1$ (cho $u_1$), $B = 2$ (cho $u_2$), $C = 3$ (cho $u_3$), $X = 3$ (biến đếm chỉ số $n$).
      
      Nhập quy trình lặp:
      $X = X + 1 : D = C + (B * A) / C + X / 10 : A = B : B = C : C = D$
      
      Bấm phím "=" liên tục để đọc các giá trị tương ứng của $D$ khi $X$ lần lượt bằng 15, 16, 17:
      - Với $n = 15$, $u_15 approx 176.40$.
      - Với $n = 16$, $u_16 approx 244.22$.
      - Với $n = 17$, $u_17 approx 337.87$.
    ]
  )[
    Cho dãy số $(u_n)$ xác định bởi $u_1 = 1, u_2 = 2, u_3 = 3$ và $u_n = u_(n-1) + (u_(n-2) u_(n-3))/u_(n-1) + n/10$ với mọi $n >= 4$. \
    Tính (chính xác đến hàng thập phân thứ hai sau dấu phẩy): $u_15, u_16, u_17$.
  ]
)
