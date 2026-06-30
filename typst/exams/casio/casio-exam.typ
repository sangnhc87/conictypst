#import "casio-template.typ": *
#import "@preview/cetz:0.5.2"

#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
)
#set text(font: "Times New Roman", size: 12pt)

// Cấu hình tiêu đề
#align(center)[
  #text(16pt, weight: "bold", [ĐỀ THI HỌC SINH GIỎI TOÁN CASIO 2026])
]
#v(1em)

// Tuỳ chọn mode: "dethi" (chỉ hiện đề) hoặc "loigiai" (hiện đề và lời giải/đáp án)
#casio-exam-render(
  mode: "loigiai",
  casio-question(
    point: 2,
    answer: "2,31",
    theory: [Tính đơn điệu của hàm số $f(x) = x - 1/x + 2log x$. Áp dụng tính chất $f(t) = -f(1/t)$ để đưa phương trình về dạng lượng giác cơ bản. Sử dụng công thức diện tích đa giác tạo bởi các điểm trên đường tròn lượng giác (Shoelace formula).],
    solution: [
      Ta có $f'(x) = 1 + 1/x^2 + 2/(x ln 10) > 0, forall x > 0$. Suy ra $f(x)$ đồng biến trên $(0; +oo)$.
      
      Nhận xét $f(1/t) = 1/t - t + 2log(1/t) = -(t - 1/t + 2log t) = -f(t)$.
      
      Phương trình tương đương $f(1/(2025 sin x + 2026)) = -f(2025 cos 3x + 2026) = f(1/(2025 cos 3x + 2026))$.
      
      Do $f$ đồng biến nên $2025 sin x + 2026 = 2025 cos 3x + 2026 <=> sin x = cos 3x = sin(pi/2 - 3x)$.
      
      Giải phương trình lượng giác, ta được họ nghiệm $x = pi/8 + k pi/2$ và $x = -pi/4 - k pi$.
      
      Trên đoạn $[0; 2pi]$, ta thu được 6 nghiệm: $pi/8, 5pi/8, 3pi/4, 9pi/8, 13pi/8, 7pi/4$.
      
      Các nghiệm này tạo thành 6 điểm trên đường tròn lượng giác $R=1$. Diện tích đa giác được tính bằng công thức $S = 1/2 limits(sum)_(i=1)^6 sin(alpha_(i+1) - alpha_i)$.
      
      Sử dụng máy tính Casio để tính biểu thức $1/2 (2sin(pi/2) + 2sin(pi/8) + 2sin(3pi/8)) = 1 + sin(pi/8) + cos(pi/8) approx 2.31$.
    ]
  )[
    Cho hàm số $f(x) = x - 1/x + 2log x$ có nghiệm thuộc $[0; 2pi]$ và phương trình 
    $ f(1/(2025 sin x + 2026)) + f(2025 cos 3x + 2026) = 0 $ 
    tạo thành đa giác. Tính diện tích đa giác (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: (
      "a) 1417",
      "b) 11"
    ),
    theory: [Số chữ số của một số $N$ được tính bằng $k = floor(log_10 N) + 1$. Các chữ số đầu tiên của $N$ được xác định thông qua phần thập phân của $log_10 N$. Dùng công thức tổng cấp số nhân $S_n = (q^n - 1)/(q - 1)$.],
    solution: [
      a) Tổng cấp số nhân $P = (5^2027 - 1)/4 approx 5^2027 / 4$.
      
      Ta có $log_10 P approx 2027 log_10 5 - log_10 4 approx 2027(0.69897) - 0.60206 = 1416.812$.
      
      Số chữ số của $P$ là $1416 + 1 = 1417$ chữ số.
      
      b) Phân tích phần thập phân của logarit: $log_10 P = 1416.210138$.
      
      Ta có $P = 10^1416.210138 = 10^0.210138 * 10^1416$.
      
      Bấm Casio $10^0.210138 approx 1.622329...$. Do đó 4 chữ số đầu tiên của $P$ là $1, 6, 2, 2$.
      
      Tổng $a+b+c+d = 1+6+2+2 = 11$.
    ]
  )[
    Cho $P = 1+5+5^2+...+5^2026 = overline(a b c d...)$ \
    a) Tính số chữ số của $P$. \
    b) Tính $a+b+c+d$.
  ],
  casio-question(
    point: 2,
    answer: "0,76",
    theory: [Tâm đối xứng của đồ thị hàm phân thức $y=(a x^2+b x+c)/(d x+e)$ là giao điểm của 2 đường tiệm cận. Dùng bất đẳng thức AM-GM để tìm giá trị nhỏ nhất của khoảng cách từ tâm đến đồ thị hypebol.],
    solution: [
      Hàm số $y = (x^2+4x+5)/(x+1) = x+3 + 2/(x+1)$. Tâm đối xứng là giao của TCĐ $x=-1$ và TCX $y=x+3$, suy ra $I(-1; 2)$.
      
      Đường cong $y = 2 + sqrt(-x^2-2x+4.525)$ tương đương với nửa đường tròn tâm $I(-1; 2)$ bán kính $R = sqrt(5.525) approx 2.35$ (phần $y >= 2$).
      
      Khoảng cách $M N >= I M - I N = I M - R$. Để $M N$ min thì $I M$ phải min.
      
      $I M^2 = (x+1)^2 + (x+1 + 2/(x+1) - 2)^2 = t^2 + (t + 2/t)^2 = 2t^2 + 4/t^2 + 4 >= 2sqrt(8) + 4$.
      
      Dấu "=" khi $t^2 = sqrt(2) => t = root(4, 2) approx 1.189$. Lúc này $M$ có tung độ $> 2$ (phù hợp cắt nửa trên đường tròn).
      
      Suy ra $I M_min = sqrt(4 + 4sqrt(2)) approx 3.107$.
      
      Khoảng cách $M N_min = 3.1075 - 2.3505 = 0.757 approx 0.76$.
    ]
  )[
    Cho $M$ nằm trên $(H): y = (x^2+4x+5)/(x+1)$ và $N$ nằm trên $y = 2 + sqrt(-x^2-2x+4.525)$. Tính giá trị nhỏ nhất của $M N$ (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: "37771,18",
    theory: [Tính chất hình học không gian: Khoảng cách từ hình chiếu vuông góc của đỉnh $S$ xuống đáy đến các cạnh đáy tỉ lệ với cotang của góc giữa các mặt bên và mặt đáy.],
    solution: [
      Gọi $H$ là hình chiếu của $S$ lên đáy $(A B C)$, $h = S H$. Khoảng cách từ $H$ đến các cạnh $A B, A C, B C$ lần lượt là $d_1 = h cot 30^degree, d_2 = h cot 45^degree, d_3 = h cot 60^degree$.
      
      Ta có $S_(A B C) = 1/2 a (d_1 + d_2 + d_3) = (100/2) h (sqrt(3) + 1 + 1/sqrt(3)) = 50h(4sqrt(3)/3 + 1)$.
      
      Mà $S_(A B C) = (100^2 sqrt(3))/4 = 2500 sqrt(3)$. Từ đó giải ra $h = (150)/(4+sqrt(3))$.
      
      Thể tích tứ diện $V = 1/3 S_(A B C) * h = 1/3 * 2500sqrt(3) * 150/(4+sqrt(3)) = (125000 sqrt(3))/(4+sqrt(3))$.
      
      Bấm Casio: $V approx 37771.18$.
    ]
  )[
    Cho hình chóp $S.A B C$ có đáy là tam giác đều cạnh $100$, biết góc giữa $(S A B), (S A C), (S B C)$ với đáy $(A B C)$ lần lượt là $30^degree, 45^degree, 60^degree$. Tính (chính xác đến hàng thập phân thứ hai sau dấu phẩy) thể tích tứ diện $S.A B C$.
  ],
  casio-question(
    point: 2,
    answer: (
      "a) 3,63",
      "b) 0,24"
    ),
    theory: [Tính chất của đồ thị hàm phân thức $y=(a x+b)/(c x+d)$ (Hypebol): Tâm đối xứng. Diện tích tam giác tạo bởi hai tiếp tuyến tại hai điểm $A, B$ trên đồ thị và dây cung $A B$.],
    solution: [
      a) Lập phương trình hoành độ giao điểm: $(x^2-2x+2)/(x^2+5) = (x-1)/(x+2) <=> x^2 - 7x + 9 = 0$.
      
      Có hai nghiệm $x_A = (7+sqrt(13))/2, x_B = (7-sqrt(13))/2$. Tính $y_A, y_B$ trên $(C_2)$ hoặc dùng công thức khoảng cách cho ra $A B approx 3.63$.
      
      b) Gọi $C$ là giao của hai tiếp tuyến tại $A, B$ của $(C_2)$. Áp dụng tính chất tiếp tuyến của Hypebol (tịnh tiến tâm đối xứng về gốc tọa độ $Y = -3/X$), tọa độ giao điểm tiếp tuyến là trung bình điều hòa của hoành độ và tung độ: $X_C = (2X_A X_B)/(X_A + X_B), Y_C = (2Y_A Y_B)/(Y_A + Y_B)$.
      
      $X_A+X_B = 11, X_A X_B = 27 => X_C = 54/11 => x_C = 32/11$. Tương tự $y_C = 7/18$.
      
      Dùng công thức diện tích tam giác $S = 1/2 |(x_A-x_C)(y_B-y_C) - (x_B-x_C)(y_A-y_C)|$.
      
      Sử dụng Casio nhập trực tiếp các tọa độ tính được $S = (13sqrt(13))/198 approx 0.236 approx 0.24$.
    ]
  )[
    Cho $(C_1): y = (x^2 - 2x + 2)/(x^2 + 5)$ và $(C_2): y = (x-1)/(x+2)$. Biết $(C_1)$ cắt $(C_2)$ tại các điểm $A, B$. \
    a) Tính $A B$ (chính xác đến hàng thập phân thứ hai sau dấu phẩy). \
    b) Hai tiếp tuyến của $(C_2)$ tại $A$ và $B$ cắt nhau tại $C$. Tính $S_{Delta A B C}$ (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
  ],
  casio-question(
    point: 2,
    answer: "$-1$",
    theory: [Sử dụng phương pháp sai phân, phân tích tử thức thành vi phân rời rạc của mẫu số để các số hạng liên tiếp tự triệt tiêu (Telescoping sum).],
    solution: [
      Biến đổi $a_n = (3n^2+3n+1)/(n^2+n)^3 = ((n+1)^3 - n^3)/(n^3 (n+1)^3) = 1/n^3 - 1/(n+1)^3$.
      
      Tổng $a_1 + a_2 + ... + a_2026 = (1/1^3 - 1/2^3) + (1/2^3 - 1/3^3) + ... + (1/2026^3 - 1/2027^3)$.
      
      Triệt tiêu các số hạng, ta còn lại: $m/n = 1 - 1/2027^3 = (2027^3 - 1)/2027^3$.
      
      Vì $2027^3 - 1$ và $2027^3$ là hai số nguyên tố cùng nhau, nên phân số đã tối giản.
      
      $m = 2027^3 - 1$, $n = 2027^3$. Vậy $m - n = -1$.
    ]
  )[
    Cho dãy số $(a_n): a_n = (3n^2+3n+1)/(n^2+n)^3$. Biết $a_1 + a_2 + a_3 + ... + a_2026 = m/n$ với $m/n$ là phân số tối giản. Tính $m - n$.
  ],
  casio-question(
    point: 2,
    answer: "79",
    theory: [Sử dụng kỹ thuật nội suy bằng đa thức phụ. Đặt $Q(x) = (x+1)(x+2)P(x) - x^3$ để thu được một đa thức có các nghiệm nguyên quen thuộc.],
    solution: [
      Xét đa thức $Q(x) = (x+1)(x+2)P(x) - x^3$. Do $P(x)$ bậc 5 hệ số 1 nên $Q(x)$ bậc 7 hệ số 1.
      
      Theo giả thiết $P(k) = k^3/((k+1)(k+2))$ nên $Q(k) = 0$ với $k=1,2,3,4,5$.
      
      Suy ra $Q(x) = (x-1)(x-2)(x-3)(x-4)(x-5)(x^2 + a x + b)$.
      
      Ta có $Q(-1) = 0 - (-1)^3 = 1$ và $Q(-2) = 0 - (-2)^3 = 8$. Thay $x = -1, -2$ vào ta giải hệ được $a = 1681/560$ và $b = 5041/2520$.
      
      Tính $Q(6) = 120(36 + 6a + b) = 4320 + 50428/21$.
      
      Lại có $Q(6) = 7*8*P(6) - 216 = 56 P(6) - 216$.
      
      Suy ra $P(6) = (Q(6) + 216)/56 = 81 + 50428/1176 = 81 + 42 + 1036/1176 = 123 + 37/42$.
      
      Phân số $37/42$ có $m=37, n=42$. Tổng $m+n = 79$.
    ]
  )[
    Cho $P(x)$ bậc $5$ có hệ số bậc cao nhất là $1$ thỏa mãn $P(k) = k^3/(k^2+3k+2), k = 1,2,3,4,5$. \
    Biết $P(6) = A + m/n$, tính $m + n$.
  ],
  casio-question(
    point: 2,
    answer: "48,5",
    theory: [Công thức nội suy Tứ phân vị $Q_1, Q_3$ đối với số liệu ghép nhóm và hệ phương trình suy ra từ các dữ kiện thống kê.],
    solution: [
      Tổng tần số $N=400 => x+y+250 = 400 => x+y = 150$.
      
      Khoảng tứ phân vị $Delta Q = Q_3 - Q_1 = 845/21$. Các vị trí phân vị là $N/4 = 100$ và $3N/4 = 300$.
      
      Dựa vào tần số tích lũy, giả định $Q_1$ thuộc nhóm $[20; 40)$ và $Q_3$ thuộc nhóm $[60; 80)$.
      
      $Q_3 = 60 + (300 - 270)/70 * 20 = 480/7$. Từ đó $Q_1 = Q_3 - Delta Q = 480/7 - 845/21 = 85/3$.
      
      Ta thấy $85/3 approx 28.33 in [20;40)$, thỏa mãn điều kiện.
      
      Mặt khác $Q_1 = 20 + (100 - x)/120 * 20 = 20 + (100-x)/6$. Cho biểu thức này bằng $85/3$, giải ra $x = 50$, suy ra $y = 100$.
      
      Số trung bình $overline(x) = (50*10 + 120*30 + 100*50 + 70*70 + 60*90)/400 = 19400/400 = 48.5$.
    ]
  )[
    Cho bảng số liệu ghép nhóm có cỡ mẫu $N=400$ như sau:
    #align(center)[
      #table(
        columns: 6,
        align: center,
        stroke: 0.5pt,
        [Nhóm], [$[0;20)$], [$[20;40)$], [$[40;60)$], [$[60;80)$], [$[80;100)$],
        [Tần số], [$x$], [$120$], [$y$], [$70$], [$60$]
      )
    ]
    Biết khoảng tứ phân vị của mẫu số liệu trên là $Delta Q = 845/21$, tính (chính xác) số trung bình của mẫu số liệu.
  ],
  casio-question(
    point: 2,
    answer: (
      "a) 2,35",
      "b) 1,09"
    ),
    theory: [Sử dụng công thức thể tích hình nón cụt tròn xoay $V = 1/3 pi h (r_1^2 + r_2^2 + r_1 r_2)$. Thiết lập phương trình bậc 3 theo sự thay đổi chiều cao mực nước.],
    solution: [
      a) Thể tích chậu: $V_0 = 1/3 pi * 3 * (1^2 + 2^2 + 1*2) = 7pi$. Nước trong chậu $V_1 = 2/3 V_0 = 14pi/3$.
      
      Gọi chiều cao nước là $x$. Bán kính mặt nước tương ứng $r_x = 1 + x/3$.
      
      Thể tích nước $V_1 = 1/3 pi x (1 + (1+x/3)^2 + 1+x/3) = (pi x)/3 (3 + x + x^2/9) = 14pi/3$.
      
      Giải phương trình bậc 3: $x^3/9 + x^2 + 3x - 14 = 0 => (x+3)^3 = 153 => x = root(3, 153) - 3 approx 2.35$ dm.
      
      b) Thả quả cầu vào, chiều cao tăng thêm $5$ cm $= 0.5$ dm. Chiều cao mới $h' = x + 0.5 = root(3, 153) - 2.5 approx 2.848$.
      
      Thể tích mới $V_2 = pi/27 ((h'+3)^3 - 27) = pi/27 (199.98 - 27) approx 6.406 pi$.
      
      Thể tích quả cầu $V_c = V_2 - V_1 = 6.406 pi - 4.666 pi = 1.74 pi$. 
      
      Mà $V_c = 4/3 pi r^3 => r = root(3, 1.74 * 3/4) approx 1.09$ dm.
    ]
  )[
    #grid(
      columns: (1fr, auto),
      column-gutter: 1.5em,
      [
        Cho một chậu nước hình chóp cụt tròn cao $3" dm"$ có bán kính đáy nhỏ là $1" dm"$, bán kính đáy lớn là $2" dm"$ (như hình vẽ bên). \
        a) Biết thể tích nước trong chậu là $2/3$ thể tích chậu, tìm chiều cao theo dm khi đó (chính xác đến hàng thập phân thứ hai sau dấu phẩy). \
        b) Khi thả một quả cầu có bán kính $r$ biết rằng chiều cao tăng thêm $5" cm"$ thì bán kính $r$ là bao nhiêu? (chính xác đến hàng thập phân thứ hai sau dấu phẩy).
      ],
      align(center + horizon)[
        #cetz.canvas(length: 1.5cm, {
          import cetz.draw: *
          
          let c-cup = rgb("#1e293b")
          let c-water = rgb(186, 230, 253, 130)
          let c-water-surf = rgb(125, 211, 252, 180)
          let c-water-line = rgb("#0284c7")
          let c-dim = rgb("#94a3b8")
          
          let h-water = 2.35
          let r-water = 1.78
          let ry-water = 0.45
          
          // 1. Vẽ nét khuất đáy chậu (ở tận cùng phía sau)
          arc((1, 0), start: 0deg, stop: 180deg, radius: (1, 0.25), stroke: (dash: "dashed", paint: c-dim, thickness: 0.8pt))
          
          // 2. Vẽ trục chính phần dưới nước (nét đứt mờ vì chìm trong nước)
          line((0, 0), (0, h-water), stroke: (dash: "dashed", paint: c-dim.lighten(30%), thickness: 0.5pt))
          
          // 3. Khối nước (merge-path tô màu trong suốt)
          merge-path(fill: c-water, stroke: none, {
            line((1, 0), (r-water, h-water))
            arc((r-water, h-water), start: 0deg, stop: 180deg, radius: (r-water, ry-water))
            line((-r-water, h-water), (-1, 0))
            arc((-1, 0), start: 180deg, stop: 360deg, radius: (1, 0.25))
          })
          
          // 4. Mặt nước (ellipse bán trong suốt)
          circle((0, h-water), radius: (r-water, ry-water), fill: c-water-surf, stroke: 0.75pt + c-water-line)
          
          // 5. Trục chính phần trên mặt nước
          line((0, h-water), (0, 3), stroke: (dash: "dashed", paint: c-dim, thickness: 0.5pt))
          
          // 6. Thành chậu (hai bên)
          line((-1, 0), (-2, 3), stroke: 1.5pt + c-cup)
          line((1, 0), (2, 3), stroke: 1.5pt + c-cup)
          
          // 7. Viền đáy chậu phía trước (nét liền đậm)
          arc((-1, 0), start: 180deg, stop: 360deg, radius: (1, 0.25), stroke: 1.5pt + c-cup)
          
          // 8. Miệng chậu (ellipse trên cùng)
          circle((0, 3), radius: (2, 0.5), stroke: 1.5pt + c-cup)
          
          // --- ĐƯỜNG KÍCH THƯỚC ---
          // Chiều cao chậu
          line((2.3, 0), (2.8, 0), stroke: 0.5pt + c-dim)
          line((2.3, 3), (2.8, 3), stroke: 0.5pt + c-dim)
          line((2.55, 0), (2.55, 3), stroke: 0.5pt + c-dim, mark: (start: ">", end: ">", fill: c-dim))
          content((2.65, 1.5), text(8pt, fill: c-cup)[$h=3$], anchor: "west")
          
          // Chiều cao nước x
          line((-2.3, 0), (-2.8, 0), stroke: 0.5pt + c-dim)
          line((-2.3, h-water), (-2.8, h-water), stroke: 0.5pt + c-dim)
          line((-2.55, 0), (-2.55, h-water), stroke: 0.5pt + c-dim, mark: (start: ">", end: ">", fill: c-dim))
          content((-2.65, h-water / 2), text(8pt, fill: c-cup)[$x$], anchor: "east")
          
          // Bán kính đáy lớn R=2
          line((0, 4.2), (0, 3.6), stroke: 0.5pt + c-dim)
          line((2, 4.2), (2, 3.2), stroke: 0.5pt + c-dim)
          line((0, 3.95), (2, 3.95), stroke: 0.5pt + c-dim, mark: (start: ">", end: ">", fill: c-dim))
          content((1, 4.1), text(8pt, fill: c-cup)[$R=2$], anchor: "south")
          
          // Bán kính đáy nhỏ r=1
          line((0, -1.0), (0, -0.4), stroke: 0.5pt + c-dim)
          line((1, -1.0), (1, -0.2), stroke: 0.5pt + c-dim)
          line((0, -0.75), (1, -0.75), stroke: 0.5pt + c-dim, mark: (start: ">", end: ">", fill: c-dim))
          content((0.5, -0.6), text(8pt, fill: c-cup)[$r=1$], anchor: "south")
          
          // Bán kính mặt nước
          line((0, h-water), (r-water, h-water), stroke: (dash: "dashed", paint: c-water-line, thickness: 0.75pt))
          content((r-water / 2, h-water - 0.2), text(8pt, fill: c-water-line)[$r_x$], anchor: "north")
        })
      ]
    )
  ],
  casio-question(
    point: 2,
    answer: (
      $u_20 = 2291723154$,
      $u_21 = 6448012062$,
      $u_22 = 18142181724$
    ),
    theory: [Quy trình lặp (Sequence Loop) trên máy tính Casio để giải các bài toán dãy số truy hồi bậc cao.],
    solution: [
      Để giải quyết nhanh trên Casio, ta sử dụng tính năng lặp Calc với các biến nhớ.
      
      Gán các giá trị ban đầu: $x = 3, C = 3 (u_3), B = 2 (u_2), A = 1 (u_1)$.
      
      Nhập quy trình lặp: 
      $x = x+1 : D = 2C + 3B - 2A + x^3 : A = B : B = C : C = D$
      
      Bấm dấu Bằng $(=)$ liên tục để tính các giá trị tiếp theo. Với $x = 20, 21, 22$, ta lần lượt đọc được giá trị của biến $D$ trên màn hình là:
      
      - $u_20 = 2291723154$
      - $u_21 = 6448012062$
      - $u_22 = 18142181724$
    ]
  )[
    Cho dãy số $(u_n)$ xác định bởi $u_1 = 1, u_2 = 2, u_3 = 3$ và $u_n = 2u_(n-1) + 3u_(n-2) - 2u_(n-3) + n^3 (n >= 4)$. \
    Tính (ghi kết quả chính xác -- mỗi kết quả 0,1 điểm): $u_20, u_21, u_22,...$
  ]
)
