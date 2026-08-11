#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display


#muc([Chuyên Đề: Ứng Dụng Tối Ưu & Cắt Gấp Khối Tròn Xoay])

#resetexamstate()
#exam-part([CÂU HỎI TRẮC NGHIỆM TRẢ LỜI NGẮN], count: auto)

// ─── CÂU 1 ───
#tln(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ quạt tròn
    arc((0,0), start: 45deg, stop: 315deg, radius: 2, stroke: 1pt + blue, fill: rgb("e6f2ff"))
    line((0,0), (2*1.414/2, 2*1.414/2), stroke: 1pt + blue)
    line((0,0), (2*1.414/2, -2*1.414/2), stroke: 1pt + blue)
    content((0,0), $O$, anchor: "east", padding: 3pt)
    content((1.2, 0), $alpha$)
    arc((0,0), start: 45deg, stop: 315deg, radius: 0.6, stroke: 0.5pt)
    content((1, 1.2), $R$)
    
    // Mũi tên biến đổi
    line((2.5, 0), (3.5, 0), mark: (end: ">"), stroke: 1.5pt)
    content((3, 0.5), [Gấp])

    // Vẽ khối nón
    let apex = (6, 1.5)
    let center = (6, -1.5)
    let a = 1.2
    let b = 0.4
    // Nửa elip dưới
    arc(center, start: 180deg, stop: 360deg, radius: (a, b), stroke: 1pt + red, fill: rgb("ffe6e6"))
    // Nửa elip trên (nét đứt)
    arc(center, start: 0deg, stop: 180deg, radius: (a, b), stroke: (paint: red, dash: "dashed"))
    
    // Hai đường sinh
    line(apex, (6 - a, -1.5), stroke: 1pt + red)
    line(apex, (6 + a, -1.5), stroke: 1pt + red)
    
    // Trục và bán kính
    line(apex, center, stroke: (dash: "dashed", paint: gray))
    line(center, (6 + a, -1.5), stroke: (dash: "dashed", paint: gray))
    content((6 + a/2, -1.5), $r$, anchor: "north", padding: 2pt)
    content((6, 0), $h$, anchor: "east", padding: 2pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Từ một tấm tôn hình tròn có bán kính $R = 10$ cm, người ta cắt bỏ một hình quạt có góc ở tâm là $alpha$ (như hình vẽ) rồi gấp phần còn lại thành một chiếc phễu hình nón. Để thể tích của chiếc phễu đạt giá trị lớn nhất, góc $alpha$ (tính theo radian) phải bằng bao nhiêu? (Kết quả làm tròn đến chữ số thập phân thứ hai).],
  [$1.15$],
  loigiai: [
    #step[Giả sử chiếc phễu có bán kính đáy là $r$ và chiều cao là $h$. Đường sinh của hình nón chính là bán kính của tấm tôn ban đầu, nên $l = R = 10$.]
    #step[Chu vi đường tròn đáy của hình nón bằng chiều dài cung tròn của phần được giữ lại: $2pi r = R(2pi - alpha) => r = R(2pi - alpha)/(2pi)$.]
    #step[Thể tích khối nón là $V = 1/3 pi r^2 h$. Ta có mối liên hệ $h^2 + r^2 = R^2 => h = sqrt(R^2 - r^2)$.]
    #step[Thay vào công thức thể tích, ta xét hàm $f(r) = r^2 sqrt(R^2 - r^2)$. Bình phương lên ta có $g(r) = r^4(R^2 - r^2) = r^4 R^2 - r^6$.]
    #step[Đạo hàm $g'(r) = 4r^3 R^2 - 6r^5 = 2r^3(2R^2 - 3r^2)$. Cho $g'(r) = 0 => r = R sqrt(2/3)$.]
    #step[Thể tích lớn nhất khi $r = 10 sqrt(2/3) approx 8.165$ cm.]
    #step[Từ đó $2pi r = R(2pi - alpha) => 2pi(R sqrt(2/3)) = R(2pi - alpha) => alpha = 2pi(1 - sqrt(2/3)) approx 1.15$ rad.]
  ]
)

// ─── CÂU 2 ───
#tln(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Tấm chữ nhật
    rect((0,-1.5), (3, 1.5), stroke: 1pt + blue, fill: rgb("e6f2ff"))
    content((1.5, 1.5), $2pi r$, anchor: "south", padding: 2pt)
    content((3, 0), $h$, anchor: "west", padding: 2pt)
    
    // Mũi tên
    line((4, 0), (5, 0), mark: (end: ">"), stroke: 1.5pt)
    content((4.5, 0.5), [Gò])
    
    // Hình trụ
    let c = (7, 0)
    let a = 1.2
    let b = 0.4
    let h_cyl = 3
    let c_top = (7, 1.5)
    let c_bot = (7, -1.5)
    
    // Đáy dưới
    arc(c_bot, start: 180deg, stop: 360deg, radius: (a, b), stroke: 1pt + red, fill: rgb("ffe6e6"))
    arc(c_bot, start: 0deg, stop: 180deg, radius: (a, b), stroke: (paint: red, dash: "dashed"))
    
    // Thân
    line((7-a, -1.5), (7-a, 1.5), stroke: 1pt + red)
    line((7+a, -1.5), (7+a, 1.5), stroke: 1pt + red)
    
    // Đáy trên
    arc(c_top, start: 0deg, stop: 360deg, radius: (a, b), stroke: 1pt + red, fill: rgb("ffe6e6"))
    
    // Kích thước
    line(c_top, (7+a, 1.5), stroke: (dash: "dashed"))
    content((7+a/2, 1.5), $r$, anchor: "south", padding: 2pt)
    content((7-a, 0), $h$, anchor: "east", padding: 2pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một nhà máy sản xuất vỏ lon sữa bò hình trụ tròn xoay có thể tích cố định là $V = 314$ $"cm"^3$. Để chi phí sản xuất thấp nhất, diện tích toàn phần của lon sữa bò phải nhỏ nhất. Tính bán kính đáy $r$ (cm) của lon sữa bò khi diện tích toàn phần nhỏ nhất (lấy $pi approx 3.14$).],
  [$3.68$],
  loigiai: [
    #step[Thể tích khối trụ: $V = pi r^2 h = 314 => h = 314/(pi r^2)$.]
    #step[Diện tích toàn phần: $S_("tp") = 2pi r h + 2pi r^2$. Thay $h$ vào, ta được: $S_("tp")(r) = 2pi r(314/(pi r^2)) + 2pi r^2 = 628/r + 2pi r^2$.]
    #step[Áp dụng bất đẳng thức AM-GM: $S_("tp") = 314/r + 314/r + 2pi r^2 >= 3 sqrt(3)( (314^2 dot 2pi)/r^2 dot r^2 ) = "const"$.]
    #step[Dấu "=" xảy ra khi $314/r = 2pi r^2 => 2pi r^3 = 314 => r^3 = 314/(2pi) approx 314/(2 times 3.14) = 50$.]
    #step[Vậy $r = root(3, 50) approx 3.68$ cm.]
  ]
)

// ─── CÂU 3 ───
#tln(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    let c = (0,0)
    let R = 2
    // Cầu
    circle(c, radius: R, stroke: 1pt + blue)
    // Đường xích đạo
    arc(c, start: 180deg, stop: 360deg, radius: (R, 0.6), stroke: 1pt + blue)
    arc(c, start: 0deg, stop: 180deg, radius: (R, 0.6), stroke: (paint: blue, dash: "dashed"))
    
    // Mặt phẳng cắt
    let d = 1.0 // khoảng cách từ tâm đến mặt phẳng
    let r_cut = calc.sqrt(R*R - d*d)
    let cut_c = (0, d)
    // Elip mặt cắt
    arc(cut_c, start: 0deg, stop: 360deg, radius: (r_cut, 0.3*r_cut), stroke: 1.5pt + red, fill: rgb("ffcccc"))
    
    // Chi tiết
    line(c, cut_c, stroke: (dash: "dashed", paint: gray))
    line(cut_c, (r_cut, d), stroke: (dash: "dashed", paint: gray))
    line(c, (r_cut, d), stroke: (dash: "dashed", paint: gray))
    
    content((0, d/2), $h$, anchor: "east", padding: 2pt)
    content((r_cut/2, d), $r$, anchor: "south", padding: 2pt)
    content((r_cut/2, d/2), $R$, anchor: "north-west")
    content(c, $O$, anchor: "north", padding: 2pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  [Người ta cưa một khối gỗ hình cầu có bán kính $R = 6$ cm bằng một nhát cưa phẳng để lấy một chỏm cầu. Biết mặt cắt là một hình tròn có diện tích bằng $20pi$ $"cm"^2$. Khối lượng riêng của gỗ là $0.8$ $"g/cm"^3$. Tính khối lượng của chỏm cầu nhỏ bị cắt ra (làm tròn đến hàng đơn vị gam).],
  [$54$],
  loigiai: [
    #step[Diện tích mặt cắt là $S = pi r^2 = 20pi => r^2 = 20$. Bán kính đường tròn giao tuyến là $r = sqrt(20)$.]
    #step[Khoảng cách từ tâm khối cầu đến mặt cắt là $d = sqrt(R^2 - r^2) = sqrt(36 - 20) = 4$ cm.]
    #step[Chiều cao của chỏm cầu nhỏ là $h = R - d = 6 - 4 = 2$ cm.]
    #step[Thể tích chỏm cầu được tính bằng công thức: $V = pi h^2(R - h/3) = pi (2^2)(6 - 2/3) = 4pi dot (16/3) = (64pi)/3$ $"cm"^3$.]
    #step[Khối lượng của chỏm cầu: $m = V times 0.8 = (64pi)/3 times 0.8 approx 53.6 approx 54$ g.]
  ]
)

// ─── CÂU 4 ───
#tln(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    let apex = (0, 3)
    let center = (0, -2)
    let R = 2
    
    // Nửa elip dưới của nón
    arc(center, start: 180deg, stop: 360deg, radius: (R, 0.5), stroke: 1pt + blue)
    // Nửa elip trên của nón
    arc(center, start: 0deg, stop: 180deg, radius: (R, 0.5), stroke: (paint: blue, dash: "dashed"))
    
    // Đường sinh nón
    line(apex, (-R, -2), stroke: 1pt + blue)
    line(apex, (R, -2), stroke: 1pt + blue)
    
    // Trụ nội tiếp
    let r_cyl = 1
    let y_bot = -2
    let y_top = 3 - 5*(r_cyl/R) // = 0.5
    
    // Đáy dưới trụ
    arc((0, y_bot), start: 0deg, stop: 360deg, radius: (r_cyl, 0.25), stroke: 1pt + red, fill: rgb("ffcccc"))
    // Đáy trên trụ
    arc((0, y_top), start: 0deg, stop: 360deg, radius: (r_cyl, 0.25), stroke: 1pt + red, fill: rgb("ffcccc"))
    
    // Thân trụ
    line((-r_cyl, y_bot), (-r_cyl, y_top), stroke: 1pt + red)
    line((r_cyl, y_bot), (r_cyl, y_top), stroke: 1pt + red)
    
    // Chú thích
    line(apex, center, stroke: (dash: "dashed", paint: gray))
    content((0.5, y_top/2 - 1), $h$, anchor: "west")
    content((0, y_bot), $O$, anchor: "north", padding: 2pt)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một ly thủy tinh hình nón có chiều cao $H = 15$ cm và bán kính đáy $R = 5$ cm. Người ta thả vào ly một viên đá lạnh hình trụ đặc sao cho trục của viên đá trùng với trục của ly, đáy dưới của viên đá nằm trên mặt phẳng đáy của ly. Thể tích lớn nhất của viên đá lạnh có thể đạt được là bao nhiêu $"cm"^3$ (lấy $pi approx 3.14$, làm tròn đến số nguyên)?],
  [$175$],
  loigiai: [
    #step[Giả sử viên đá hình trụ có bán kính $r$ ($0 < r < 5$) và chiều cao $h$.]
    #step[Dựa vào tam giác đồng dạng (mặt cắt dọc qua trục), ta có tỷ lệ: $h/H = (R - r)/R => h = H(R - r)/R = 15(5 - r)/5 = 3(5 - r)$.]
    #step[Thể tích của viên đá hình trụ là $V = pi r^2 h = pi r^2 dot 3(5 - r) = 3pi(5r^2 - r^3)$.]
    #step[Xét hàm $f(r) = 5r^2 - r^3$ trên $(0; 5)$. Đạo hàm $f'(r) = 10r - 3r^2$. Cho $f'(r) = 0 => r = 10/3$.]
    #step[Khi đó thể tích cực đại là $V_(max) = 3pi( 5(100/9) - 1000/27 ) = 3pi( 500/9 - 1000/27 ) = 3pi( 500/27 ) = (500pi)/9 approx 174.53$ $"cm"^3$.]
    #step[Làm tròn đến số nguyên, kết quả là $175$ $"cm"^3$.]
  ]
)
