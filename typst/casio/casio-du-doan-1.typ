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
  subject: "Môn thi: TOÁN 12 THPT (ĐỀ DỰ ĐOÁN SỐ 1 - SỬ DỤNG MTCT)",
  time: "120 phút",
  year: "2025 - 2026",
  show-solution: true,
  casio-question(
    point: 2,
    answer: "2",
    theory: [Tìm tập xác định, xét tính lẻ và chứng minh tính đơn điệu của hàm số $f(x) = ln(x + sqrt(x^2+1)) + sin x$ trên đoạn $[-2; 2]$. Giải phương trình lượng giác đưa về dạng $cos 2x = 0$. Tìm các điểm biểu diễn nghiệm trên đường tròn lượng giác và tính diện tích hình vuông.],
    solution: [
      Ta có $f(x) = ln(x + sqrt(x^2+1)) + sin x$.
      Tập xác định $D = RR$. Hàm số có:
      $f(-x) = ln(-x + sqrt(x^2+1)) - sin x = ln(1/(x + sqrt(x^2+1))) - sin x = -ln(x + sqrt(x^2+1)) - sin x = -f(x)$.
      Do đó $f(x)$ là hàm số lẻ.
      
      Mặt khác, đạo hàm $f'(t) = 1/sqrt(t^2+1) + cos t$.
      Với $t in [-2; 2]$, ta có $1/sqrt(t^2+1) >= 1/sqrt(5) approx 0.447$.
      Vì $cos t >= cos 2 approx -0.416$ nên $f'(t) >= 0.447 - 0.416 = 0.031 > 0$.
      Do đó hàm số $f(t)$ đồng biến trên $[-2; 2]$.
      
      Phương trình tương đương:
      $f(2 cos^2 x - 1) = -f(2 cos 2x) <=> f(cos 2x) = f(-2 cos 2x)$.
      Vì $cos 2x, -2 cos 2x in [-2; 2]$ và $f$ đồng biến trên đoạn này, nên:
      $cos 2x = -2 cos 2x <=> 3 cos 2x = 0 <=> cos 2x = 0$.
      
      Giải phương trình ta được $2x = pi/2 + k pi <=> x = pi/4 + k pi/2$.
      Các nghiệm thuộc $[0; 2pi]$ là: $pi/4, (3pi)/4, (5pi)/4, (7pi)/4$.
      Các điểm này biểu diễn trên đường tròn lượng giác tạo thành một hình vuông nội tiếp đường tròn bán kính $R=1$.
      Diện tích hình vuông: $S = 2 R^2 = 2 * 1^2 = 2$.
    ]
  )[
    Cho hàm số $f(x) = ln(x + sqrt(x^2+1)) + sin x$. Tìm diện tích đa giác tạo bởi các điểm biểu diễn nghiệm thuộc đoạn $[0; 2pi]$ của phương trình $f(2 cos^2 x - 1) + f(2 cos 2x) = 0$ trên đường tròn lượng giác (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: (
      "a) 1713",
      "b) 10"
    ),
    theory: [Số chữ số của một số $N$ được tính bằng $k = floor(log_10 N) + 1$. Các chữ số đầu tiên của $N$ được xác định thông qua phần thập phân của $log_10 N$. Dùng công thức tổng cấp số nhân $S_n = (q^n - 1)/(q - 1)$.],
    solution: [
      a) Tổng cấp số nhân $A = (7^2027 - 1)/6 approx 7^2027 / 6$.
      
      Ta có $log_10 A approx 2027 log_10 7 - log_10 6 approx 2027(0.845098) - 0.778151 = 1712.23558$.
      
      Số chữ số của $A$ là $1712 + 1 = 1713$ chữ số.
      
      b) Phân tích phần thập phân của logarit: $log_10 A = 1712.23558$.
      
      Ta có $A = 10^1712.23558 = 10^0.23558 * 10^1712$.
      
      Bấm Casio $10^0.23558 approx 1.7202...$. Do đó 4 chữ số đầu tiên của $A$ là $1, 7, 2, 0$.
      
      Tổng $a+b+c+d = 1+7+2+0 = 10$.
    ]
  )[
    Cho tổng cấp số nhân $A = 1 + 7 + 7^2 + ... + 7^2026 = overline(a b c d...)$ \
    a) Tính số chữ số của $A$. \
    b) Tính tổng $a+b+c+d$.
  ],
  casio-question(
    point: 2,
    answer: "0,40",
    theory: [Tịnh tiến tọa độ và sử dụng tính chất khoảng cách từ tâm đường tròn đến đồ thị. Khoảng cách ngắn nhất giữa hai điểm $M, N$ thuộc hai đường cong không giao nhau đạt được khi khoảng cách từ điểm $M$ trên parabol đến tâm đường tròn đạt cực tiểu.],
    solution: [
      Nửa đường tròn $(C): y = 6 + sqrt(4-x^2)$ có tâm $I(0; 6)$ và bán kính $R = 2$.
      
      Với mọi điểm $M in (P)$ và $N in (C)$, khoảng cách $M N >= I M - I N = I M - 2$.
      
      Ta tìm GTNN của $I M^2$ với $M(x; x^2) in (P)$:
      $I M^2 = x^2 + (x^2-6)^2 = x^4 - 11x^2 + 36$.
      
      Đặt $t = x^2 >= 0$. Hàm số $f(t) = t^2 - 11t + 36$ đạt giá trị nhỏ nhất tại $t = 11/2 = 5.5$.
      
      Lúc này, $I M_min^2 = 5.5^2 - 11(5.5) + 36 = 5.75 => I M_min = sqrt(5.75) approx 2.3979$.
      
      Do $I M_min approx 2.3979 > R = 2$ nên hai đường cong không giao nhau.
      
      Khoảng cách ngắn nhất $M N_min = 2.3979 - 2 = 0.3979 approx 0.40$.
    ]
  )[
    Cho điểm $M$ di động trên parabol $(P): y = x^2$ và điểm $N$ di động trên nửa đường tròn $(C): y = 6 + sqrt(4-x^2)$ (phần $y >= 6$). Tính giá trị nhỏ nhất của khoảng cách $M N$ (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: "15881,28",
    theory: [Khoảng cách từ hình chiếu vuông góc $H$ của đỉnh $S$ xuống đáy đến các cạnh đáy tỉ lệ với cotang của góc giữa các mặt bên và mặt đáy. Sử dụng diện tích tam giác và định lý Pythagoras để tìm độ cao $h$.],
    solution: [
      Gọi $H$ là hình chiếu của $S$ lên đáy $(A B C)$, $h = S H$. Khoảng cách từ $H$ đến ba cạnh $A B, A C, B C$ lần lượt là $d_1 = h cot 30^degree = h sqrt(3), d_2 = h cot 45^degree = h, d_3 = h cot 60^degree = h/sqrt(3)$.
      
      Ta có diện tích đáy tam giác vuông: $S_(A B C) = 1/2 A B * A C = 1/2 * 60 * 80 = 2400$.
      Cạnh huyền $B C = sqrt(60^2 + 80^2) = 100$.
      
      Mà $S_(A B C) = 1/2 (d_1 * A B + d_2 * A C + d_3 * B C) = 1/2 (h sqrt(3) * 60 + h * 80 + h/sqrt(3) * 100) = h (30sqrt(3) + 40 + 50/sqrt(3))$.
      
      Giải phương trình bậc nhất tìm $h$ trên Casio:
      $h = 2400 / (30sqrt(3) + 40 + 50/sqrt(3)) = (120sqrt(3)) / (7 + 2sqrt(3)) approx 19.8516$.
      
      Thể tích khối chóp: $V = 1/3 S_(A B C) * h = 1/3 * 2400 * h = 800 h$.
      
      Bấm Casio: $V approx 15881.28$.
    ]
  )[
    Cho hình chóp $S.A B C$ có đáy là tam giác vuông tại $A$ với $A B = 60, A C = 80$. Biết hình chiếu vuông góc của đỉnh $S$ lên đáy nằm bên trong tam giác $A B C$ và góc giữa các mặt bên $(S A B), (S A C), (S B C)$ với đáy lần lượt là $30^degree, 45^degree, 60^degree$. Tính (chính xác đến hàng thập phân thứ hai sau dấu phẩy) thể tích khối chóp $S.A B C$.
  ],
  casio-question(
    point: 2,
    answer: (
      "a) 6",
      "b) 0,73"
    ),
    theory: [Tịnh tiến tâm đối xứng của Hypebol về gốc tọa độ. Áp dụng các tính chất hình học của tiếp tuyến Hypebol: diện tích tam giác tạo bởi tiếp tuyến và hai tiệm cận luôn không đổi; tìm điểm đạt chu vi nhỏ nhất bằng bất đẳng thức AM-GM.],
    solution: [
      Tâm đối xứng của đồ thị là $I(-1; 2)$. Tịnh tiến hệ trục tọa độ về gốc $I$, phương trình đường cong trở thành $Y = -3/X$.
      
      Với điểm $M(X_0; Y_0)$ thuộc đồ thị ($X_0 > 0$):
      Tiếp tuyến tại $M$ có phương trình $Y = 3/X_0^2 X - 6/X_0$.
      Tiếp tuyến cắt các tiệm cận (trục $Y$ và $X$ mới) tại $A(0; -6/X_0)$ và $B(2X_0; 0)$.
      
      a) Diện tích tam giác $I A B$: $S = 1/2 I A * I B = 1/2 * |-6/X_0| * |2X_0| = 6$.
      
      b) Chu vi tam giác $I A B$: $P = I A + I B + A B = 2X_0 + 6/X_0 + sqrt(4X_0^2 + 36/X_0^2)$.
      
      Áp dụng AM-GM:
      $2X_0 + 6/X_0 >= 2sqrt(12) = 4sqrt(3)$.
      $4X_0^2 + 36/X_0^2 >= 2sqrt(144) = 24$.
      Dấu "=" xảy ra khi $2X_0 = 6/X_0 <=> 2X_0^2 = 6 <=> X_0 = sqrt(3)$ (vì $X_0 > 0$).
      
      Khi đó hoành độ điểm $M$ là $x_M = X_0 - 1 = sqrt(3) - 1 approx 0.73$ (chính xác đến hai chữ số thập phân).
    ]
  )[
    Cho hàm số $y = (2x-1)/(x+1)$ có đồ thị $(C)$. Tiếp tuyến $d$ của $(C)$ tại điểm $M$ có hoành độ $x_M > -1$ cắt hai đường tiệm cận tại $A$ và $B$. Gọi $I$ là tâm đối xứng của $(C)$. \
    a) Tính diện tích tam giác $I A B$. \
    b) Tìm hoành độ $x_M$ để chu vi tam giác $I A B$ nhỏ nhất (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: "-1",
    theory: [Sử dụng phương pháp sai phân bậc cao, phân tích tử thức thành vi phân rời rạc của mẫu số dạng $(n+1)^4 - n^4$ để rút gọn tổng thành chuỗi đan dấu tự triệt tiêu (Telescoping sum).],
    solution: [
      Biến đổi $a_n = (4n^3+6n^2+4n+1)/(n^4(n+1)^4) = ((n+1)^4 - n^4)/(n^4 (n+1)^4) = 1/n^4 - 1/(n+1)^4$.
      
      Tổng $S = a_1 + a_2 + ... + a_2026 = (1/1^4 - 1/2^4) + (1/2^4 - 1/3^4) + ... + (1/2026^4 - 1/2027^4)$.
      
      Triệt tiêu các số hạng, ta còn lại: $m/n = 1 - 1/2027^4 = (2027^4 - 1)/2027^4$.
      
      Vì tử số và mẫu số là hai số nguyên liên tiếp nên phân số đã tối giản.
      
      $m = 2027^4 - 1$, $n = 2027^4$. Vậy $m - n = -1$.
    ]
  )[
    Cho dãy số $(a_n): a_n = (4n^3 + 6n^2 + 4n + 1)/(n^4(n+1)^4)$. Biết $a_1 + a_2 + a_3 + ... + a_2026 = m/n$ với $m/n$ là phân số tối giản. Tính $m - n$.
  ],
  casio-question(
    point: 2,
    answer: "53",
    theory: [Sử dụng kỹ thuật nội suy đa thức bằng đa thức phụ. Thiết lập đa thức $Q(x) = (x+1)P(x) - x$ bậc 7 có 6 nghiệm đã biết để tìm hằng số phụ và tính giá trị tại điểm mới.],
    solution: [
      Xét đa thức $Q(x) = (x+1)P(x) - x$. Vì $P(x)$ bậc 6 hệ số cao nhất 1 nên $Q(x)$ bậc 7 hệ số cao nhất 1.
      
      Do $P(k) = k/(k+1)$ với $k=1,2,3,4,5,6$ nên $Q(k) = 0$ với các giá trị này.
      
      Suy ra $Q(x) = (x-1)(x-2)(x-3)(x-4)(x-5)(x-6)(x-c)$.
      
      Ta có $Q(-1) = 0 * P(-1) - (-1) = 1$.
      Mặt khác, $Q(-1) = (-2)(-3)(-4)(-5)(-6)(-7)(-1-c) = -5040(1+c) => 1+c = -1/5040$.
      
      Tại $x = 7$:
      $Q(7) = 6 * 5 * 4 * 3 * 2 * 1 * (7-c) = 720 * (8 - (1+c)) = 720 * (8 + 1/5040) = 5760 + 1/7$.
      
      Mà $Q(7) = 8 P(7) - 7 => 8 P(7) - 7 = 5760 + 1/7 <=> P(7) = 720 + 25/28$.
      
      So sánh với dạng $P(7) = A + m/n$ ta được $m = 25, n = 28$ (tối giản).
      Vậy $m + n = 53$.
    ]
  )[
    Cho $P(x)$ bậc $6$ có hệ số bậc cao nhất là $1$ thỏa mãn $P(k) = k/(k+1), k = 1,2,3,4,5,6$. \
    Biết $P(7) = A + m/n$ (với $A in ZZ$, $m/n$ là phân số tối giản), tính $m + n$.
  ],
  casio-question(
    point: 2,
    answer: (
      "a) x = 80, y = 120",
      "b) 161,6"
    ),
    theory: [Công thức xác định Trung vị của số liệu ghép nhóm và tính Số trung bình cộng đại diện nhóm bằng máy tính Casio.],
    solution: [
      Tổng cỡ mẫu: $N = x + 150 + y + 80 + 70 = 500 <=> x + y = 200$.
      
      Vị trí trung vị $N/2 = 250$. Vì $M_e = 965/6 approx 160.83 in [160; 165)$, nhóm chứa trung vị là $[160; 165)$.
      
      Áp dụng công thức trung vị:
      $M_e = 160 + (250 - (x + 150))/y * 5 = 965/6 <=> 5(100 - x)/y = 5/6 <=> y = 600 - 6x$.
      
      Giải hệ phương trình:
      $x + y = 200$ và $6x + y = 600$, ta được $x = 80, y = 120$.
      
      b) Số trung bình cộng:
      $overline(x) = (80*152.5 + 150*157.5 + 120*162.5 + 80*167.5 + 70*172.5)/500 = 80800/500 = 161.6$.
    ]
  )[
    Cho bảng số liệu ghép nhóm về chiều cao của $500$ học sinh THPT như sau:
    #align(center)[
      #table(
        columns: 6,
        align: center,
        stroke: 0.5pt,
        [Chiều cao (cm)], [$[150; 155)$], [$[155; 160)$], [$[160; 165)$], [$[165; 170)$], [$[170; 175)$],
        [Tần số], [$x$], [$150$], [$y$], [$80$], [$70$]
      )
    ]
    Biết trung vị của mẫu số liệu ghép nhóm trên là $M_e = 965/6" cm"$. \
    a) Xác định tần số ẩn $x$ và $y$. \
    b) Tính số trung bình cộng của mẫu số liệu trên (chính xác đến hàng thập phân thứ nhất sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: (
      "a) 2,08",
      "b) 2,14"
    ),
    theory: [Sử dụng công thức thể tích chỏm cầu $V = pi h^2 (R - h/3)$. Thiết lập phương trình bậc 3 theo chiều cao mực nước $h$. Sử dụng tính năng SOLVE hoặc giải phương trình bậc 3 trực tiếp trên máy tính cầm tay Casio.],
    solution: [
      a) Thể tích chậu bán cầu: $V_0 = 2/3 pi R^3 = 2/3 pi * 3^3 = 18pi$ dm³.
      
      Thể tích nước ban đầu: $V_1 = 5/9 V_0 = 10pi$ dm³.
      
      Gọi chiều cao nước ban đầu là $h$ ($0 < h <= 3$). 
      Ta có phương trình thể tích chỏm cầu: 
      $pi h^2 (3 - h/3) = 10pi <=> h^3 - 9h^2 + 30 = 0$.
      
      Sử dụng máy tính Casio giải phương trình bậc 3 này, ta nhận nghiệm dương phù hợp:
      $h approx 2.08$ dm (chính xác đến hai chữ số thập phân).
      
      b) Thể tích của 3 quả cầu sắt giống nhau thả vào:
      $V_c = 3 * 4/3 pi r^3 = 4pi * 0.5^3 = 0.5pi$ dm³.
      
      Sau khi thả quả cầu chìm hoàn toàn, tổng thể tích nước và quả cầu là:
      $V_2 = V_1 + V_c = 10pi + 0.5pi = 10.5pi$ dm³.
      
      Gọi chiều cao nước mới là $h'$ ($0 < h' <= 3$). Ta có phương trình:
      $pi h'^2 (3 - h'/3) = 10.5pi <=> h'^3 - 9h'^2 + 31.5 = 0$.
      
      Sử dụng máy tính Casio giải phương trình bậc 3 này, ta nhận được chiều cao mực nước mới:
      $h' approx 2.14$ dm (chính xác đến hai chữ số thập phân).
    ]
  )[
    #grid(
      columns: (1fr, auto),
      column-gutter: 1.5em,
      [
        Cho một cái bát (chậu) có dạng hình bán cầu với bán kính đáy bát là $R = 3" dm"$ (như hình vẽ bên). Ban đầu chậu chứa một lượng nước có chiều cao mực nước là $h$ (dm) và thể tích nước bằng $5/9$ thể tích chậu. \
        a) Tìm chiều cao mực nước $h$ ban đầu (chính xác đến hàng thập phân thứ hai sau dấu phẩy). \
        b) Người ta thả vào chậu 3 quả cầu sắt giống nhau có cùng bán kính $r = 0.5" dm"$ sao cho chúng ngập hoàn toàn trong nước. Tìm chiều cao mực nước mới sau khi thả các quả cầu vào (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
      ],
      align(center + horizon)[
        #cetz.canvas(length: 1.2cm, {
          import cetz.draw: *
          
          let c-cup = rgb("#1e293b")
          let c-water = rgb("#bae6fd")
          let c-water-surf = rgb("#7dd3fc")
          let c-water-line = rgb("#0284c7")
          let c-dim = rgb("#94a3b8")
          
          let R = 3.0
          let h = 2.08
          let y-surf = -3.0 + h
          let r-surf = 2.86
          let ry-surf = 2.86 * 0.25
          
          // Nước
          merge-path(fill: c-water, stroke: none, {
            arc((-2.86, -0.92), start: 197.9deg, stop: 342.1deg, radius: 3.0)
            arc((2.86, -0.92), start: 0deg, stop: 180deg, radius: (2.86, ry-surf))
          })
          
          // Mặt nước
          circle((0, y-surf), radius: (r-surf, ry-surf), fill: c-water-surf, stroke: 0.75pt + c-water-line)
          
          // Thân bát bán cầu
          arc((-3.0, 0), start: 180deg, stop: 360deg, radius: 3.0, stroke: 1.5pt + c-cup)
          
          // Miệng bát
          circle((0, 0), radius: (3.0, 0.75), stroke: 1.5pt + c-cup)
          
          // Trục đối xứng trung tâm
          line((0, 0), (0, -3.0), stroke: (dash: "dashed", paint: c-dim, thickness: 0.5pt))
          
          // Kích thước bán kính bát R = 3
          line((0, 0.4), (0, 0.9), stroke: 0.5pt + c-dim)
          line((3, 0.4), (3, 0.9), stroke: 0.5pt + c-dim)
          line((0, 0.65), (3, 0.65), stroke: 0.5pt + c-dim, mark: (start: ">", end: ">", fill: c-dim))
          content((1.5, 0.8), text(8pt, fill: c-cup)[$R=3$], anchor: "south")
          
          // Kích thước chiều cao nước h
          line((-3.3, -3), (-3.8, -3), stroke: 0.5pt + c-dim)
          line((-3.3, y-surf), (-3.8, y-surf), stroke: 0.5pt + c-dim)
          line((-3.55, -3), (-3.55, y-surf), stroke: 0.5pt + c-dim, mark: (start: ">", end: ">", fill: c-dim))
          content((-3.65, -3 + h/2), text(8pt, fill: c-cup)[$h$], anchor: "east")
          
          // Bán kính mặt nước
          line((0, y-surf), (r-surf, y-surf), stroke: (dash: "dashed", paint: c-water-line, thickness: 0.75pt))
          content((r-surf/2, y-surf - 0.2), text(8pt, fill: c-water-line)[$r_h$], anchor: "north")
        })
      ]
    )
  ],
  casio-question(
    point: 2,
    answer: (
      "u_15 = 21,55",
      "u_16 = 23,24",
      "u_17 = 24,93"
    ),
    theory: [Quy trình lặp trên máy tính Casio chứa căn thức để giải toán dãy số truy hồi có điều kiện phi tuyến.],
    solution: [
      Gán các giá trị ban đầu trên Casio: $A = 1$ (cho $u_1$), $B = 1.5$ (cho $u_2$), $C = 2$ (biến đếm chỉ số $n$).
      
      Nhập biểu thức lặp:
      $C = C + 1 : D = sqrt(B^2 + 3A + C) : A = B : B = D$
      
      Bấm phím "=" liên tục để đọc các giá trị tương ứng của $D$ khi $C$ lần lượt bằng 15, 16, 17:
      - Với $n = 15$, $u_15 approx 21.55$.
      - Với $n = 16$, $u_16 approx 23.24$.
      - With $n = 17$, $u_17 approx 24.93$.
    ]
  )[
    Cho dãy số $(u_n)$ xác định bởi $u_1 = 1$, $u_2 = 1.5$ và $u_n = sqrt(u_(n-1)^2 + 3u_(n-2) + n)$ với mọi $n >= 3$. \
    Tính (chính xác đến hàng thập phân thứ hai sau dấu phẩy): $u_15, u_16, u_17$.
  ]
)
