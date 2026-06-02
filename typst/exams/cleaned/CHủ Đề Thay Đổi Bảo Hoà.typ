
#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../../math-sym.typ"


// #show: stexgv-doc.with(
//   doc-type: "book",
//   title: "CHUYÊN ĐỀ: SUY DIỄN LOGISTIC - GIỚI HẠN CỦA SỰ THAY ĐỔI",
//   author: "GV Nguyễn Văn Sang",
//   theme-color: classic.blue,
// )

#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ VÀ MỤC LỤC
// ═══════════════════════════════════════════════════════════
#v(1em)
#block(
  width: 100%,
  fill: rgb("#f4f8fc"),
  stroke: (
    left: 6pt + classic.blue,
    top: 0.5pt + rgb("#dbe4f0"),
    right: 0.5pt + rgb("#dbe4f0"),
    bottom: 0.5pt + rgb("#dbe4f0"),
  ),
  inset: 16pt,
  radius: (right: 4pt),
)[
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: THAY ĐỔI BẢO HOÀ]

  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[Giới Hạn Của Sự Thay Đổi - Bài Toán Logistic]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

#ds(
  [Doanh thu hằng tháng $R$ của một sản phẩm mới trong một khoảng thời gian dự kiến tuân theo hàm logistic: $R = R(t) = A / (1+55e^(-t)) - B$ (sản phẩm), với $A, B$ là các hệ số thực và $t$ là thời gian được tính bằng tháng. Biết tốc độ bán hàng là đạo hàm theo thời gian $t$ của doanh thu với đơn vị là sản phẩm/ tháng, số lượng sản phẩm bán được tối đa là $5500$ sản phẩm. Trong bài toán kết quả được trả lời làm tròn đến hàng đơn vị. Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  (
    True[$B = A / 56$],
    True[$R'(t) > 0$ với mọi $t >= 0$],
    True[Khi doanh thu bằng $500$ thì tốc độ bán hàng bằng $536$ sản phẩm/ $1$ tháng],
    True[Sản phẩm bán chạy nhất ở tháng thứ $4$]
  ),
  loigiai: [
    #step[Kiểm tra mệnh đề a]
    Vì đề bài nhắc đến "sản phẩm mới", nên tại thời điểm bắt đầu ($t=0$), doanh thu sẽ bằng 0. 
    Ta thế trực tiếp vào hàm:
    $ R(0) = A / (1+55e^0) - B = A/56 - B = 0 => B = A/56 $
    $=>$ Mệnh đề a *Đúng*.

    #step[Kiểm tra mệnh đề b]
    Dữ kiện "số lượng sản phẩm bán được tối đa là $5500$" đồng nghĩa với việc giới hạn của hàm doanh thu khi thời gian tiến ra vô cực là $5500$.
    $ lim_(t -> +oo) R(t) = A / (1+0) - B = A - B = 5500 $
    Thay $B = A/56$ vừa tìm được vào, ta có:
    $ A - A/56 = 5500 => (55A)/56 = 5500 => A = 5600 $
    Từ đó suy ra $B = 100$. Lúc này, hàm doanh thu hoàn chỉnh là: 
    $ R(t) = 5600 / (1+55e^(-t)) - 100 $
    Tốc độ bán hàng là đạo hàm bậc nhất:
    $ R'(t) = (-5600 dot (-55e^(-t))) / (1+55e^(-t))^2 = (308000e^(-t)) / (1+55e^(-t))^2 $
    Vì $e^(-t) > 0$ với mọi $t >= 0$, nên ta luôn có $R'(t) > 0$ với mọi $t >= 0$.
    $=>$ Mệnh đề b *Đúng*.

    #step[Kiểm tra mệnh đề c]
    Đặt $P(t) = R(t) + 100 = 5600 / (1+55e^(-t))$. Phương trình đạo hàm của hàm logistic luôn tuân theo dạng:
    $ P'(t) = P(t) (1 - P(t)/5600) $
    Vì $R'(t) = P'(t)$ và tại thời điểm doanh thu $500$ thì $P(t) = 500 + 100 = 600$, ta thay trực tiếp vào để tìm tốc độ bán:
    $ R'(t) = 600 (1 - 600/5600) = 600 dot 50 / 56 approx 535,71 $
    Làm tròn đến hàng đơn vị theo yêu cầu, ta được $536$ (sản phẩm/tháng).
    $=>$ Mệnh đề c *Đúng*.

    #step[Kiểm tra mệnh đề d]
    Sản phẩm bán chạy nhất khi tốc độ bán hàng $R'(t)$ đạt cực đại.
    Dựa vào phương trình tam thức bậc hai $R'(t) = P(t)(1 - P(t)/5600)$, tốc độ đạt giá trị lớn nhất tại đỉnh parabol, tức là khi:
    $ P(t) = 5600 / 2 = 2800 $
    Giải tìm $t$:
    $ 5600 / (1+55e^(-t)) = 2800 => 1+55e^(-t) = 2 => e^(-t) = 1/55 => t = ln(55) approx 4,007 $
    Làm tròn đến hàng đơn vị, ta được kết quả là tháng thứ $4$.
    $=>$ Mệnh đề d *Đúng*.
  ]
)

#ds(
  [ Số lượng người dùng $N$ của một ứng dụng giáo dục mới sau $t$ tuần ra mắt dự kiến tuân theo hàm logistic: $N = N(t) = A / (1+49e^(-t)) - B$ (người dùng), với $A, B$ là các hằng số thực dương. Biết tại thời điểm ra mắt ($t=0$), ứng dụng chưa có người dùng nào. Dựa trên cấu hình hạ tầng máy chủ, số lượng người dùng tối đa mà hệ thống có thể đáp ứng được là $9800$ người. Tốc độ tăng trưởng lượng người dùng là đạo hàm của hàm số $N(t)$ theo thời gian $t$ (đơn vị: người/tuần). Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  (
    True[$A = 50B$],
    True[Hệ số $A = 10000$],
    [Tốc độ tăng người dùng đạt lớn nhất rơi vào tuần thứ $5$ (kết quả làm tròn đến hàng đơn vị)],
    True[Tại thời điểm ứng dụng có $1800$ người dùng thì tốc độ tăng trưởng là $1600$ người/ $1$ tuần]
  ),
  loigiai: [
    #step[Kiểm tra mệnh đề a]
    Tại thời điểm ra mắt ($t=0$), số lượng người dùng bằng 0. 
    Thế trực tiếp vào hàm số, ta có:
    $ N(0) = A / (1+49e^0) - B = A/50 - B = 0 => A = 50B $
    $=>$ Mệnh đề a *Đúng*.

    #step[Kiểm tra mệnh đề b]
    Dữ kiện "số lượng người dùng tối đa là $9800$" cho biết giới hạn của hàm số khi thời gian trải dài ra vô cực là $9800$.
    $ lim_(t -> +oo) N(t) = A / (1+0) - B = A - B = 9800 $
    Thay $B = A/50$ từ kết quả trên vào, ta giải được:
    $ A - A/50 = 9800 => (49A)/50 = 9800 => A = 10000 $
    Từ đó suy ra $B = 200$. Hàm số hoàn chỉnh là:
    $ N(t) = 10000 / (1+49e^(-t)) - 200 $
    $=>$ Mệnh đề b *Đúng*.

    #step[Kiểm tra mệnh đề c]
    Tương tự kỹ thuật trước, ta đặt $P(t) = N(t) + 200 = 10000 / (1+49e^(-t))$.
    Phương trình đạo hàm của hàm logistic luôn tuân theo công thức: 
    $ N'(t) = P'(t) = P(t) (1 - P(t)/10000) $
    Tốc độ tăng $N'(t)$ đạt cực đại tại đỉnh của parabol, tức là khi $P(t) = 10000 / 2 = 5000$.
    Giải phương trình tìm $t$:
    $ 10000 / (1+49e^(-t)) = 5000 => 1+49e^(-t) = 2 => e^(-t) = 1/49 => t = ln(49) approx 3,89 $
    Làm tròn đến hàng đơn vị ta được kết quả là tuần thứ $4$. (Trong khi mệnh đề nói là tuần thứ 5).
    $=>$ Mệnh đề c *Sai*.

    #step[Kiểm tra mệnh đề d]
    Khi ứng dụng có $1800$ người dùng, tức là $N(t) = 1800$. 
    Lúc này giá trị của $P(t)$ là: $P(t) = N(t) + 200 = 1800 + 200 = 2000$.
    Thế trực tiếp $P(t) = 2000$ vào công thức đạo hàm để tìm tốc độ tăng trưởng:
    $ N'(t) = 2000 (1 - 2000/10000) = 2000 dot (1 - 1/5) = 2000 dot 4/5 = 1600 $ (người/tuần)
    $=>$ Mệnh đề d *Đúng*.
  ]
)


#ds(
  [Trong một chiến dịch truyền thông về "Giáo dục Tài chính cho Học sinh Gen Z", số lượng học sinh tiếp cận được thông điệp sau $t$ ngày tuân theo hàm logistic: $P(t) = A / (1 + B dot e^(-0,2 t))$ (học sinh), với $A, B$ là các hằng số thực dương. Biết rằng trong ngày đầu tiên phát động ($t=0$), nhóm dự án có đúng $10$ học sinh khởi xướng. Phân tích dữ liệu mạng xã hội cho thấy giới hạn tối đa số lượng học sinh có thể tiếp cận được thông điệp của dự án này là $3010$ học sinh. Đạo hàm $P'(t)$ biểu diễn tốc độ lan truyền thông điệp (đơn vị: người/ngày). Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  (
    True[Hệ số $A = 3010$ và $B = 300$],
    True[Thời điểm tốc độ lan truyền thông điệp đạt lớn nhất thì có $1505$ học sinh đã tiếp cận được thông điệp],
    True[Khi có $1010$ học sinh tiếp cận được thông điệp, tốc độ lan truyền là $134$ người/ngày (làm tròn đến hàng đơn vị)],
    [Tốc độ lan truyền thông điệp trên mạng xã hội đạt mức tối đa là $250$ người/ngày]
  ),
  loigiai: [
    #step[Kiểm tra mệnh đề a]
    Dữ kiện "giới hạn tối đa số lượng học sinh có thể tiếp cận là $3010$" cho ta biết giới hạn của hàm $P(t)$ khi $t -> +oo$.
    $ lim_(t -> +oo) P(t) = A / (1+0) = A = 3010 $
    Tại ngày đầu tiên ($t=0$), có $10$ học sinh khởi xướng, tức là:
    $ P(0) = 3010 / (1 + B dot e^0) = 10 => 1 + B = 301 => B = 300 $
    Hàm số hoàn chỉnh là: $P(t) = 3010 / (1 + 300e^(-0,2 t))$.
    $=>$ Mệnh đề a *Đúng*.

    #step[Kiểm tra mệnh đề b]
    Đây là lúc tư duy "phá án" phát huy sức mạnh. Ta không cần tính đạo hàm dạng phân thức rườm rà. Với mọi hàm logistic có dạng $P(t) = A / (1 + B dot e^(-k t))$, phương trình tốc độ luôn tuân theo quy luật tuyệt đẹp:
    $ P'(t) = k dot P(t) (1 - (P(t))/A) $
    Áp dụng vào bài toán, ta có tốc độ lan truyền:
    $ P'(t) = 0,2 dot P(t) (1 - (P(t))/3010) $
    Đây thực chất là một tam thức bậc hai theo biến $X = P(t)$: $f(X) = 0,2 X (1 - X/3010)$ với hệ số $a$ âm. Parabol này quay bề lõm xuống dưới và đạt giá trị lớn nhất tại trung điểm của hai nghiệm $X=0$ và $X=3010$, tức là khi:
    $ P(t) = 3010 / 2 = 1505 $
    Vậy tốc độ lan truyền lớn nhất khi có $1505$ học sinh tiếp cận được.
    $=>$ Mệnh đề b *Đúng*.

    #step[Kiểm tra mệnh đề c]
    Tại thời điểm có $1010$ học sinh tiếp cận, ta có $P(t) = 1010$. Thay trực tiếp vào phương trình đạo hàm vừa thiết lập để tính ngay ra tốc độ:
    $ P'(t) = 0,2 dot 1010 dot (1 - 1010/3010) = 202 dot (2000/3010) = 202 dot 200/301 approx 134,22 $
    Làm tròn đến hàng đơn vị, tốc độ lan truyền lúc này là $134$ người/ngày.
    $=>$ Mệnh đề c *Đúng*.

    #step[Kiểm tra mệnh đề d]
    Theo phân tích ở mệnh đề b, tốc độ lan truyền đạt đỉnh khi $P(t) = 1505$. 
    Thế con số này ngược lại vào phương trình đạo hàm để tìm giá trị tối đa thực tế:
    $ P'_(max) = 0,2 dot 1505 dot (1 - 1505/3010) = 301 dot (1 - 1/2) = 301/2 = 150,5 $ (người/ngày)
    Mệnh đề khẳng định tốc độ tối đa là $250$ người/ngày là hoàn toàn sai lệch.
    $=>$ Mệnh đề d *Sai*.
  ]
)

#ds(
  [Câu 16: \[TDM34\] Một công cụ giao dịch thuật toán mới được giới thiệu cho một cộng đồng nhà đầu tư. Nhờ hiệu ứng mạng lưới, số lượng nhà đầu tư sử dụng công cụ này sau $t$ tháng tuân theo mô hình logistic: $N(t) = A / (1 + B dot e^(-0,5t))$ (người), với $A, B$ là các hằng số. Biết rằng ở tháng đầu tiên ra mắt ($t=0$), nhóm phát triển chỉ cấp quyền cho đúng $50$ người dùng thử nghiệm. Dựa trên quy mô cộng đồng, mô hình dự báo khi thời gian trải dài ($t -> +oo$), số lượng người dùng sẽ bão hòa ở mức tối đa là $5000$ người. Tốc độ tăng trưởng người dùng là đạo hàm $N'(t)$ (người/tháng). Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  (
    True[Hệ số $A = 5000$ và $B = 99$],
    True[Khi có $1000$ nhà đầu tư sử dụng, tốc độ đăng ký mới của công cụ là $400$ người/tháng],
    True[Tốc độ tăng trưởng người dùng đạt mức bão hòa (cao nhất) là $625$ người/tháng],
    [Tốc độ tăng trưởng người dùng đạt mức cao nhất vào tháng thứ $6$ (kết quả thời gian làm tròn đến hàng đơn vị)]
  ),
  loigiai: [
    #step[Kiểm tra mệnh đề a]
    Dữ kiện "khi thời gian trải dài, số lượng người dùng bão hòa ở mức $5000$" chính là giới hạn vô cực của hàm số:
    $ lim_(t -> +oo) N(t) = A / (1 + B dot 0) = A = 5000 $
    Tại thời điểm ra mắt ($t=0$), có $50$ người dùng:
    $ N(0) = 5000 / (1 + B dot e^0) = 50 => 1 + B = 100 => B = 99 $
    Vậy hàm số hoàn chỉnh là $N(t) = 5000 / (1 + 99 e^(-0,5t))$.
    $=>$ Mệnh đề a *Đúng*.

    #step[Kiểm tra mệnh đề b]
    Dựa vào tính chất vi phân của hàm logistic $N(t) = A / (1 + B dot e^(-k t))$, phương trình tốc độ thay đổi luôn có dạng $N'(t) = k dot N(t)(1 - N(t)/A)$.
    Áp dụng vào hàm số này với $k = 0,5$ và $A = 5000$:
    $ N'(t) = 0,5 N(t) (1 - (N(t))/5000) $
    Khi có $1000$ nhà đầu tư sử dụng ($N(t) = 1000$), tốc độ đăng ký mới là:
    $ N'(t) = 0,5 dot 1000 dot (1 - 1000/5000) = 500 dot (1 - 1/5) = 500 dot 4/5 = 400 $ (người/tháng)
    $=>$ Mệnh đề b *Đúng*.

    #step[Kiểm tra mệnh đề c]
    Tốc độ $N'(t)$ là một hàm bậc hai theo biến $N(t)$ có bề lõm hướng xuống. 
    Mức bão hòa (tốc độ cao nhất) đạt được tại đỉnh parabol, tức là khi số lượng người dùng bằng một nửa mức tối đa: 
    $ N(t) = 5000 / 2 = 2500 $ (người)
    Thay $N(t) = 2500$ vào phương trình đạo hàm:
    $ N'_(max) = 0,5 dot 2500 dot (1 - 2500/5000) = 1250 dot 1/2 = 625 $ (người/tháng)
    $=>$ Mệnh đề c *Đúng*.

    #step[Kiểm tra mệnh đề d]
    Theo phân tích ở mệnh đề c, tốc độ tăng trưởng cao nhất khi $N(t) = 2500$.
    Ta giải phương trình tìm thời gian $t$:
    $ 5000 / (1 + 99e^(-0,5t)) = 2500 => 1 + 99e^(-0,5t) = 2 $
    $ => 99e^(-0,5t) = 1 => e^(0,5t) = 99 => 0,5t = ln(99) $
    $ => t = 2 ln(99) approx 9,19 $
    Làm tròn đến hàng đơn vị, thời điểm đạt tốc độ tăng trưởng bão hòa là vào *tháng thứ 9*, không phải tháng thứ 6.
    $=>$ Mệnh đề d *Sai*.
  ]
)




#ds(
  [Sự bùng nổ của nền tảng quản lý trường học EduAI Connect tại các trường THPT được mô hình hóa bởi hàm logistic. Gọi $S(t)$ là tổng số trường học áp dụng nền tảng này sau $t$ tháng kể từ khi ra mắt. Dựa trên đồ thị minh họa bên cạnh và dữ liệu hệ thống, hàm số có dạng $S(t) = 120 / (1 + 11e^(-0,25t))$ (trường học). Đạo hàm $S'(t)$ biểu diễn tốc độ mở rộng (số trường đăng ký mới mỗi tháng). Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  fig: cetz.canvas({
    import cetz.draw: *
    import "@preview/cetz-plot:0.1.3": plot
    // Gọi thẳng hàm plot từ package cetz-plot đã import ở trên
    plot.plot(
      size: (5, 3.5),
      x-label: [$t$ (tháng)],
      y-label: [$S(t)$],
      x-tick-step: 6,
      y-tick-step: 30,
      axis-style: "school-book",
      {
        // Vẽ đường cong logistic
        plot.add(
          domain: (0, 24),
          samples: 100,
          style: (stroke: (paint: rgb("#0057b8"), thickness: 1.5pt)),
          t => 120 / (1 + 11 * calc.exp(-0.25 * t))
        )
        // Vẽ đường tiệm cận ngang (giới hạn bão hòa)
        plot.add-hline(120, style: (stroke: (dash: "dashed", paint: rgb("#cc2200"), thickness: 1.2pt)))
      }
    )
  }),
  fig-width: 38%,
  (
    True[Khi thời gian trải dài tiến ra vô cùng, nền tảng sẽ bão hòa ở mức tối đa $120$ trường học đăng ký],
    True[Vào tháng đầu tiên ra mắt ($t=0$), đã có đúng $10$ trường học tiên phong áp dụng hệ thống này],
    [Khi hệ thống đạt mốc $40$ trường học, tốc độ mở rộng của nền tảng là $10$ trường/tháng],
    True[Tốc độ phát triển của nền tảng đạt đỉnh ở mức $7,5$ trường đăng ký mới mỗi tháng]
  ),
  loigiai: [
    #step[Kiểm tra mệnh đề a]
    Nhìn vào đồ thị, ta thấy đường cong bám sát đường tiệm cận ngang $y = 120$. Bằng toán học, khi thời gian $t -> +oo$:
    $ lim_(t -> +oo) S(t) = 120 / (1 + 11 dot 0) = 120 $
    Vậy số lượng trường bão hòa tối đa là $120$.
    $=>$ Mệnh đề a *Đúng*.

    #step[Kiểm tra mệnh đề b]
    Tại thời điểm ra mắt ($t=0$), thế trực tiếp vào hàm số:
    $ S(0) = 120 / (1 + 11e^0) = 120 / (1 + 11) = 120 / 12 = 10 $ (trường)
    Đồ thị cũng thể hiện rõ điểm xuất phát cắt trục tung tại tung độ $10$.
    $=>$ Mệnh đề b *Đúng*.

    #step[Kiểm tra mệnh đề c]
    Tương tự các bài trước, phương trình tốc độ mở rộng hệ thống luôn là: 
    $ S'(t) = k dot S(t) (1 - (S(t))/A) $
    Áp dụng với $k=0,25$ và $A=120$, ta có:
    $ S'(t) = 0,25 dot S(t) (1 - (S(t))/120) $
    Khi có $40$ trường học đăng ký ($S(t) = 40$):
    $ S'(t) = 0,25 dot 40 dot (1 - 40/120) = 10 dot (1 - 1/3) = 10 dot 2/3 approx 6,67 $ (trường/tháng)
    $=>$ Mệnh đề c *Sai*.

    #step[Kiểm tra mệnh đề d]
    Tốc độ $S'(t)$ đạt đỉnh khi số trường học bằng đúng một nửa sức chứa tối đa:
    $ S(t) = 120 / 2 = 60 $ (trường)
    Thay mức $60$ trường này vào phương trình tốc độ:
    $ S'_(max) = 0,25 dot 60 dot (1 - 60/120) = 15 dot (1 - 1/2) = 15/2 = 7,5 $ (trường/tháng)
    $=>$ Mệnh đề d *Đúng*.
  ]
)

#ds(
  [Câu 18: \[TDM36\] Để bảo tồn một loài chim quý hiếm, các nhà khoa học đã đưa một nhóm cá thể ban đầu vào khu bảo tồn quốc gia. Sự phục hồi số lượng cá thể chim sau $t$ năm tuân theo mô hình logistic: $P(t) = A / (1 + B dot e^(-0,2t))$ (cá thể), với $A, B$ là các hằng số thực dương. Dựa trên đồ thị khảo sát và sức chứa của môi trường, các nhà khoa học dự báo giới hạn sinh thái tối đa mà khu bảo tồn có thể nuôi dưỡng là $500$ cá thể. Tốc độ phục hồi của quần thể là đạo hàm $P'(t)$ (cá thể/năm). Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  fig: cetz.canvas({
    import cetz.draw: *
    import "@preview/cetz-plot:0.1.3": plot
    plot.plot(
      size: (5, 3.5),
      x-label: [$t$ (năm)],
      y-label: [$P(t)$],
      x-tick-step: 10,
      y-tick-step: 100,
      axis-style: "school-book",
      {
        // Vẽ đường cong logistic
        plot.add(
          domain: (0, 35),
          samples: 100,
          style: (stroke: (paint: rgb("#1a7a2e"), thickness: 1.5pt)),
          t => 500 / (1 + 24 * calc.exp(-0.2 * t))
        )
        // Vẽ đường tiệm cận ngang (sức chứa tối đa)
        plot.add-hline(500, style: (stroke: (dash: "dashed", paint: rgb("#cc2200"), thickness: 1.2pt)))
      }
    )
  }),
  fig-width: 38%,
  (
    [Hệ số $A = 500$ và số lượng cá thể chim được đưa vào khu bảo tồn lúc ban đầu ($t=0$) là $24$ con],
    True[Khi quần thể đạt mốc $100$ cá thể, tốc độ phục hồi của loài chim này là $16$ cá thể/năm],
    True[Quần thể phục hồi nhanh nhất khi số lượng cá thể đạt bằng một nửa giới hạn sinh thái],
    [Nếu điều kiện thời tiết thuận lợi, tốc độ phục hồi của quần thể có thể vượt mức $30$ cá thể/năm]
  ),
  loigiai: [
    #step[Kiểm tra mệnh đề a]
    Dữ kiện "giới hạn sinh thái tối đa là $500$" tương đương với tiệm cận ngang của hàm số khi $t -> +oo$:
    $ lim_(t -> +oo) P(t) = A / (1 + B dot 0) = A = 500 $
    Nhìn vào điểm cắt trên trục tung của đồ thị (hoặc nhẩm tính), số lượng cá thể ban đầu là $20$ con. Ta kiểm chứng lại hệ số $B$:
    $ P(0) = 500 / (1 + B dot e^0) = 20 => 1 + B = 25 => B = 24 $
    Số lượng ban đầu là $20$ con, nhưng hệ số $B = 24$. Mệnh đề cố tình gài bẫy đánh tráo khái niệm giữa $B$ và $P(0)$.
    $=>$ Mệnh đề a *Sai*.

    #step[Kiểm tra mệnh đề b]
    Hàm số hoàn chỉnh là $P(t) = 500 / (1 + 24 e^(-0,2t))$.
    Sử dụng công thức vi phân của hàm logistic: $P'(t) = k dot P(t) (1 - (P(t))/A)$.
    Với $k=0,2$ và $A=500$, ta có phương trình tốc độ phục hồi:
    $ P'(t) = 0,2 dot P(t) (1 - (P(t))/500) $
    Khi quần thể có $100$ cá thể ($P(t) = 100$), thế vào ta được:
    $ P'(t) = 0,2 dot 100 dot (1 - 100/500) = 20 dot (1 - 1/5) = 20 dot 4/5 = 16 $ (cá thể/năm)
    $=>$ Mệnh đề b *Đúng*.

    #step[Kiểm tra mệnh đề c]
    Tốc độ $P'(t)$ là một tam thức bậc hai theo biến $P(t)$ với hệ số a âm. 
    Parabol này đạt đỉnh (tốc độ lớn nhất) tại trung điểm của hai nghiệm $0$ và $500$.
    Do đó, tốc độ phục hồi nhanh nhất khi: $P(t) = 500 / 2 = 250$ (cá thể), tức là đúng bằng một nửa giới hạn sinh thái.
    $=>$ Mệnh đề c *Đúng*.

    #step[Kiểm tra mệnh đề d]
    Theo kết quả phân tích ở mệnh đề c, quần thể đạt tốc độ phục hồi tối đa khi $P(t) = 250$.
    Thay số lượng này vào phương trình đạo hàm để tìm giới hạn tốc độ:
    $ P'_(max) = 0,2 dot 250 dot (1 - 250/500) = 50 dot 1/2 = 25 $ (cá thể/năm)
    Theo mô hình toán học này, tốc độ tối đa chỉ đạt mức $25$ cá thể/năm. Không thể vượt ngưỡng $30$ cá thể/năm.
    $=>$ Mệnh đề d *Sai*.
  ]
)

// Khai báo thư viện (nhắc lại để đảm bảo không lỗi)
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.3": plot

#ds(
  [Một sự cố an ninh mạng xảy ra khi một loại mã độc (malware) bắt đầu lây lan trong hệ thống mạng LAN của một trường học. Gọi $N(t)$ là số lượng máy tính bị nhiễm mã độc sau $t$ giờ kể từ khi phát hiện sự cố. Sự lây lan này được mô hình hóa bởi hàm logistic $N(t) = A / (1 + B dot e^(-0,4t))$ (máy). Đội ngũ IT đánh giá rằng, nếu không can thiệp cô lập, tối đa sẽ có 800 máy tính trong hệ thống bị lây nhiễm. Đồ thị bên dưới mô tả đường cong lây nhiễm $N(t)$. Đạo hàm $N'(t)$ biểu thị tốc độ lây lan (số máy bị nhiễm thêm mỗi giờ). Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  fig: cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (5, 3.5),
      x-label: [$t$ (giờ)],
      y-label: [$N(t)$],
      x-tick-step: 6,
      y-tick-step: 200,
      axis-style: "school-book",
      {
        // Vẽ đường cong logistic (màu tím cảnh báo)
        plot.add(
          domain: (0, 24),
          samples: 100,
          style: (stroke: (paint: rgb("#6b21a8"), thickness: 1.5pt)),
          t => 800 / (1 + 79 * calc.exp(-0.4 * t))
        )
        // Vẽ đường tiệm cận ngang (ngưỡng 800 máy)
        plot.add-hline(800, style: (stroke: (dash: "dashed", paint: rgb("#e65100"), thickness: 1.2pt)))
      }
    )
  }),
  fig-width: 38%,
  (
    [Hệ số $A = 800$ và tại thời điểm phát hiện sự cố ($t=0$) có 79 máy tính đã bị nhiễm mã độc],
    True[Tốc độ lây lan của mã độc luôn tuân theo công thức $N'(t) = 0,4 N(t) (1 - N(t)/800)$],
    True[Tốc độ lây lan đạt mức khủng hoảng nhất (lớn nhất) là 80 máy tính/giờ],
    [Tốc độ lây lan tại thời điểm có 600 máy bị nhiễm lớn hơn tốc độ lây lan tại thời điểm có 200 máy bị nhiễm]
  ),
  loigiai: [
    #step[Kiểm tra mệnh đề a]
    Dữ kiện "tối đa có 800 máy tính bị lây nhiễm" cho ta giới hạn bão hòa (tiệm cận ngang):
    $ lim_(t -> +oo) N(t) = A = 800 $
    Nhìn vào đồ thị (hoặc nhẩm tính), số máy bị nhiễm ở thời điểm $t=0$ nhỏ hơn rất nhiều so với 79. Để kiểm chứng, ta gọi số máy ban đầu là $N(0)=10$ (giả sử nhìn từ hình cắt trục tung):
    $ N(0) = 800 / (1 + B dot e^0) = 10 => 1 + B = 80 => B = 79 $
    Vậy $B=79$ chứ số máy tính nhiễm ban đầu không phải là 79 (chỉ có 10 máy). Mệnh đề này giăng bẫy đánh tráo khái niệm hệ số và giá trị thực tế.
    $=>$ Mệnh đề a *Sai*.

    #step[Kiểm tra mệnh đề b]
    Hàm số có dạng $N(t) = A / (1 + B dot e^(-k t))$. 
    Áp dụng thuộc tính đạo hàm logistic $N'(t) = k dot N(t)(1 - N(t)/A)$.
    Với $k=0,4$ và $A=800$, ta thu được ngay phương trình:
    $ N'(t) = 0,4 N(t) (1 - (N(t))/800) $
    $=>$ Mệnh đề b *Đúng*.

    #step[Kiểm tra mệnh đề c]
    Tốc độ $N'(t)$ là một tam thức bậc hai theo biến $N(t)$ với hệ số a âm. 
    Mức độ lây lan khủng hoảng nhất (đỉnh parabol) xảy ra khi số máy nhiễm đạt một nửa hệ thống:
    $ N(t) = 800 / 2 = 400 $ (máy)
    Thay $N(t) = 400$ vào phương trình đạo hàm:
    $ N'_(max) = 0,4 dot 400 dot (1 - 400/800) = 160 dot 1/2 = 80 $ (máy/giờ)
    $=>$ Mệnh đề c *Đúng*.

    #step[Kiểm tra mệnh đề d]
    Đây là bẫy đối xứng của hàm logistic!
    Tam thức $N'(N) = 0,4 N (1 - N/800)$ là một parabol có đỉnh tại $N=400$ và đối xứng qua đường thẳng $N=400$.
    Ta thấy hai giá trị $N=200$ và $N=600$ hoàn toàn đối xứng nhau qua trung điểm 400 (khoảng cách đều bằng 200). 
    Do tính đối xứng của parabol, tốc độ lây lan tại thời điểm có 200 máy nhiễm *bằng đúng* tốc độ lúc có 600 máy nhiễm (đều bằng 60 máy/giờ). Không hề có sự chênh lệch lớn hơn hay nhỏ hơn.
    $=>$ Mệnh đề d *Sai*.
  ]
)
#ds(
  [Trên một diễn đàn đầu tư chứng khoán, một tin đồn về việc "giải ngân đón sóng" một mã cổ phiếu bất động sản bắt đầu lan truyền. Gọi $N(t)$ là số lượng nhà đầu tư tiếp cận được thông tin này sau $t$ giờ. Phân tích dữ liệu mạng xã hội cho thấy mô hình lan truyền tuân theo hàm logistic: $N(t) = 50000 / (1 + 99e^(-0,5t))$ (người). Gọi $N'(t)$ là tốc độ lan truyền tin đồn (người/giờ). Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  (
    True[Khi tin đồn bão hòa, có tối đa $50.000$ nhà đầu tư trên diễn đàn tiếp cận được thông tin này],
    [Tại thời điểm tin đồn vừa xuất hiện ($t=0$), tốc độ lan truyền thông tin là $250$ người/giờ],
    [Tốc độ lan truyền tin đồn đạt mức cực đại khi có đúng $75\%$ số lượng nhà đầu tư tối đa tiếp cận được thông tin],
    True[Khoảng thời gian để lượng người biết tin tăng từ $500$ lên $25.000$ người bằng đúng khoảng thời gian tăng từ $25.000$ lên $49.500$ người]
  ),
  loigiai: [
    #step[Kiểm tra mệnh đề a: Giới hạn bão hòa]
    Tính giới hạn của hàm số khi thời gian tiến ra vô cực để tìm sức chứa tối đa:
    $ lim_(t -> +oo) N(t) = 50000 / (1 + 99 dot 0) = 50000 $
    Vậy tối đa có $50.000$ nhà đầu tư tiếp cận được tin đồn.
    $=>$ Mệnh đề a *Đúng*.

    #step[Kiểm tra mệnh đề b: Bẫy "Tốc độ ban đầu"]
    Sử dụng công thức tốc độ $N'(t) = 0,5 dot N(t) (1 - (N(t))/50000)$.
    Tại thời điểm $t=0$, số người biết tin là:
    $ N(0) = 50000 / (1 + 99 dot e^0) = 50000 / 100 = 500 $ (người).
    Tốc độ lan truyền lúc này là:
    $ N'(0) = 0,5 dot 500 dot (1 - 500/50000) = 250 dot (1 - 0,01) = 250 dot 0,99 = 247,5 $ (người/giờ).
    Học sinh thiếu cẩn thận rất dễ mắc bẫy lấy nhanh $0,5 dot 500 = 250$ mà quên mất nhân tố suy giảm $(1 - N/A)$.
    $=>$ Mệnh đề b *Sai*.

    #step[Kiểm tra mệnh đề c: Đỉnh của tốc độ]
    Tốc độ $N'(t)$ là một tam thức bậc hai theo biến $N(t)$ có bề lõm hướng xuống. 
    Hàm số đạt cực đại tại đỉnh parabol, tức là trung điểm của hai nghiệm $0$ và $50000$:
    $ N(t) = 50000 / 2 = 25000 $ (người).
    Tỉ lệ phần trăm so với số lượng tối đa là:
    $ (25000 / 50000) dot 100% = 50% $
    Tốc độ đạt cực đại ở mốc $50%$, chứ không phải $75%$.
    $=>$ Mệnh đề c *Sai*.

    #step[Kiểm tra mệnh đề d: Tính đối xứng tâm của Logistic]
    Đây là lúc "Conan logic" tỏa sáng! Đồ thị hàm logistic luôn có một *tâm đối xứng* chính là điểm uốn $I$ (nơi có tốc độ lan truyền cao nhất).
    Theo mệnh đề c, tại điểm uốn, $N_I = 25000$. Khoảng thời gian đi từ lúc có $500$ người ($t=0$) đến lúc đạt điểm uốn là $t_0$.
    Vì đồ thị nhận $I(t_0; 25000)$ làm tâm đối xứng, nên giá trị của hàm số sau điểm uốn một khoảng $t_0$ (tức là tại thời điểm $2t_0$) sẽ phải thỏa mãn tính chất trung điểm:
    $ (N(0) + N(2t_0))/2 = N_I => (500 + N(2t_0))/2 = 25000 $
    $ => 500 + N(2t_0) = 50000 => N(2t_0) = 49500 $
    Vậy, khoảng thời gian đi từ $500$ lên $25.000$ (mất $t_0$ giờ) *hoàn toàn bằng* khoảng thời gian đi từ $25.000$ lên $49.500$ (từ $t_0$ đến $2t_0$ cũng mất $t_0$ giờ).
    Không cần mất công lấy Logarit Neper để giải phương trình mũ, tư duy hình học đã giải quyết bài toán cực kỳ thanh thoát.
    $=>$ Mệnh đề d *Đúng*.
  ]
)
#ds(
  [Trong chuyên đề thực hành "Giáo dục Tài chính cho Học sinh Gen Z", một chiến dịch thi đua mở tài khoản tiết kiệm số được phát động. Số lượng tài khoản mở thành công sau $t$ tuần tuân theo hàm logistic $S(t) = 10000 / (1 + 99e^(-0,5t))$ (tài khoản). Gọi tốc độ mở tài khoản là đạo hàm bậc nhất $S'(t)$ và gia tốc tăng trưởng là đạo hàm bậc hai $S''(t)$. Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  (
    True[Gia tốc tăng trưởng $S''(t)$ bắt đầu mang giá trị âm kể từ tuần thứ 10 trở đi],
    True[Giai đoạn "bùng nổ" (tính từ lúc chiến dịch đạt 10% đến 90% mục tiêu tối đa) kéo dài đúng $4 ln(9)$ tuần],
    [Tổng số tài khoản mở mới trong 8 tuần đầu tiên là tích phân $integral_0^8 S'(t) dif t$ và vượt mức $9000$ tài khoản],
    [Tốc độ mở tài khoản của chiến dịch này không bao giờ vượt qua ngưỡng $1200$ tài khoản/tuần]
  ),
  loigiai: [
    #step[Kiểm tra mệnh đề a: Bẫy "Gia tốc tăng trưởng"]
    Gia tốc $S''(t)$ là đạo hàm của tốc độ. Khi $S''(t) < 0$, điều này chứng tỏ tốc độ tăng trưởng bắt đầu giảm dần.
    Đồ thị hàm logistic có điểm uốn tại đúng một nửa sức chứa tối đa. Điểm uốn này là nơi $S'(t)$ đạt cực đại, và qua điểm uốn thì $S''(t)$ chuyển từ dương sang âm.
    Sức chứa tối đa của hàm này là $10000$. Tốc độ bắt đầu giảm khi:
    $ S(t) = 10000 / 2 = 5000 => 10000 / (1 + 99e^(-0,5t)) = 5000 $
    $ => 1 + 99e^(-0,5t) = 2 => 99e^(-0,5t) = 1 => t = 2 ln(99) approx 9,19 $
    Kể từ tuần thứ 10 ($t=10 > 9,19$), gia tốc $S''(t)$ chắc chắn mang giá trị âm.
    $=>$ Mệnh đề a *Đúng*.

    #step[Kiểm tra mệnh đề b: Đặc điểm "Thời gian bứt tốc"]
    Mục tiêu tối đa là $10000$. 
    Mốc 10% tương ứng $1000$ tài khoản:
    $ 10000 / (1 + 99e^(-0,5t_1)) = 1000 => 1 + 99e^(-0,5t_1) = 10 => e^(-0,5t_1) = 9/99 = 1/11 $
    $ => -0,5 t_1 = ln(1/11) => t_1 = 2 ln(11) $
    Mốc 90% tương ứng $9000$ tài khoản:
    $ 10000 / (1 + 99e^(-0,5t_2)) = 9000 => 1 + 99e^(-0,5t_2) = 10/9 => 99e^(-0,5t_2) = 1/9 $
    $ => e^(-0,5t_2) = 1/891 => t_2 = 2 ln(891) $
    Thời gian bứt tốc là:
    $ Delta t = t_2 - t_1 = 2 ln(891) - 2 ln(11) = 2 ln(891/11) = 2 ln(81) = 2 ln(9^2) = 4 ln(9) $
    $=>$ Mệnh đề b *Đúng*.

    #step[Kiểm tra mệnh đề c: Đòn tâm lý Tích phân]
    Học sinh thông thường sẽ cố tính đạo hàm $S'(t)$ ra một phân thức cồng kềnh rồi bấm máy tính tích phân, vừa tốn thời gian vừa dễ sai số.
    Áp dụng định lý Newton-Leibniz (tư duy suy ngược): 
    $ integral_0^8 S'(t) dif t = S(8) - S(0) $
    Số tài khoản ban đầu ($t=0$): $S(0) = 10000 / (1 + 99) = 100$.
    Số tài khoản ở tuần thứ 8: $S(8) = 10000 / (1 + 99e^(-4)) approx 10000 / (1 + 99 dot 0,0183) approx 3557$.
    Tổng số tài khoản mở mới: $3557 - 100 = 3457$ (tài khoản). Con số này nhỏ hơn rất nhiều so với 9000.
    $=>$ Mệnh đề c *Sai*.

    #step[Kiểm tra mệnh đề d: Cực đại tốc độ]
    Tốc độ lớn nhất đạt được tại điểm uốn (khi $S(t) = 5000$).
    Áp dụng công thức vi phân $S'(t) = 0,5 dot S(t) (1 - S(t)/10000)$:
    $ S'_(max) = 0,5 dot 5000 dot (1 - 5000/10000) = 2500 dot 1/2 = 1250 $ (tài khoản/tuần)
    Thực tế tốc độ đã chạm đỉnh 1250 tài khoản/tuần, do đó phát biểu "không bao giờ vượt qua ngưỡng 1200" là sai.
    $=>$ Mệnh đề d *Sai*.
  ]
)



= Phần 3: Bài tập vận dụng kiến thức về hàm logistic trong các tình huống thực tế (tiếp theo)

#ds(
  [Quan sát sự phát triển của một quần thể vi khuẩn trong môi trường nuôi cấy hạn chế, cho ta kết quả:

  $bullet$ *Giai đoạn 1:* từ $t=0$ đến $t=4$ giờ, số lượng vi khuẩn tăng trưởng theo hàm mũ
  $N(t)=60e^(0.5t)$, với $t$ tính bằng giờ, $N$ tính bằng nghìn cá thể.

  $bullet$ *Giai đoạn 2:* sau $4$ giờ, do nguồn dinh dưỡng cạn kiệt, tốc độ tăng trưởng giảm dần. Từ thời điểm này, số lượng vi khuẩn tuân theo hàm số
  $M(t)=A-B e^(-0.4t)$.

  Biết tốc độ tăng trưởng của quần thể vi khuẩn này là một hàm liên tục trên $t in [0;+oo)$. Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  (
    [Số lượng vi khuẩn ban đầu là $60$ con.],
    True[$B=75e^2$.],
    True[$A=135e^2$.],
    [Sau khoảng thời gian rất lớn số lượng vi khuẩn đạt ổn định $999$ nghìn con, tính theo đơn vị nghìn và làm tròn kết quả đến hàng đơn vị.]
  ),
  loigiai: [
    #step[Đọc đề theo dạng hệ đa trị]

    Cụm từ *“Từ thời điểm này”* cho thấy hàm ở giai đoạn 2 được tính từ sau giờ thứ $4$. Đặt $u=t-4$, ta hiểu mô hình theo hai giai đoạn:

    $ cases(
      N(t)=60e^(0.5t) &\, 0 <= t <= 4,
      M(u)=A-B e^(-0.4u) &\, u >= 0
    ) $

    Tại thời điểm chuyển giai đoạn, số lượng và tốc độ tăng trưởng liên tục nên $M(0)=N(4)$ và $M'(0)=N'(4)$.

    Ta có $N(4)=60e^2$, $N'(t)=30e^(0.5t)$ nên $N'(4)=30e^2$.

    Mặt khác, $M(0)=A-B$ và $M'(u)=0.4B e^(-0.4u)$ nên $M'(0)=0.4B$.

    Do đó $A-B=60e^2$ và $0.4B=30e^2$. Suy ra $B=75e^2$ và $A=135e^2$.

    #step[Kiểm tra các mệnh đề]

    a) $N(0)=60$, nhưng $N$ tính bằng nghìn cá thể nên ban đầu có $60000$ con, không phải $60$ con. Mệnh đề a *Sai*.

    b) Từ hệ trên, $B=75e^2$. Mệnh đề b *Đúng*.

    c) Từ $A-B=60e^2$ và $B=75e^2$, suy ra $A=135e^2$. Mệnh đề c *Đúng*.

    d) Khi thời gian rất lớn, $e^(-0.4u) -> 0$ nên số lượng ổn định là $A=135e^2 approx 997.5$ nghìn cá thể. Làm tròn đến hàng đơn vị được $998$ nghìn con, không phải $999$ nghìn con. Mệnh đề d *Sai*.
  ]
)

#ds(
  [Trong bình lên men, người ta ghi nhận:

  $bullet$ *Giai đoạn 1:* từ $t=0$ đến $t=3$ giờ, số lượng nấm men tăng theo hàm mũ
  $N(t)=40e^(0.6t)$, với $t$ tính bằng giờ, $N$ tính bằng triệu tế bào.

  $bullet$ *Giai đoạn 2:* sau $3$ giờ, do lượng đường giảm dần, tốc độ tăng trưởng chậm lại. Từ thời điểm này, số lượng nấm men tuân theo hàm số
  $M(t)=A-B e^(-0.3t)$.

  Biết tốc độ tăng trưởng của quần thể nấm men là một hàm liên tục trên $t in [0;+oo)$. Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  (
    [Số lượng nấm men ban đầu là $40$ tế bào.],
    True[$B=80e^(1.8)$.],
    True[$A=120e^(1.8)$.],
    [Sau thời gian rất lớn, số lượng nấm men ổn định xấp xỉ $727$ triệu tế bào, làm tròn đến hàng đơn vị.]
  ),
  loigiai: [
    #step[Đọc đề theo dạng hệ hai giai đoạn]

    Cụm từ *“Từ thời điểm này”* cho thấy hàm ở giai đoạn 2 được tính từ sau giờ thứ $3$. Đặt $u=t-3$, ta hiểu mô hình là:

    $ cases(
      N(t)=40e^(0.6t) &\, 0 <= t <= 3,
      M(u)=A-B e^(-0.3u) &\, u >= 0
    ) $

    Tại thời điểm chuyển giai đoạn, số lượng và tốc độ tăng trưởng liên tục nên $M(0)=N(3)$ và $M'(0)=N'(3)$.

    Ta có:
    $N(3)=40e^(1.8)$.

    Lại có:
    $N'(t)=24e^(0.6t)$ nên $N'(3)=24e^(1.8)$.

    Mặt khác:
    $M(0)=A-B$ và $M'(u)=0.3B e^(-0.3u)$ nên $M'(0)=0.3B$.

    Do đó:
    $A-B=40e^(1.8)$ và $0.3B=24e^(1.8)$.

    Suy ra:
    $B=80e^(1.8)$ và $A=120e^(1.8)$.

    #step[Kiểm tra các mệnh đề]

    a) $N(0)=40$, nhưng $N$ tính bằng triệu tế bào nên ban đầu có $40$ triệu tế bào, không phải $40$ tế bào. Mệnh đề a *Sai*.

    b) Ta có $B=80e^(1.8)$. Mệnh đề b *Đúng*.

    c) Ta có $A=120e^(1.8)$. Mệnh đề c *Đúng*.

    d) Khi thời gian rất lớn, $e^(-0.3u)->0$ nên số lượng ổn định là:
    $A=120e^(1.8) approx 725.6$ triệu tế bào.

    Làm tròn đến hàng đơn vị được $726$ triệu tế bào, không phải $727$ triệu tế bào. Mệnh đề d *Sai*.
  ]
)

#ds(
  [Một hồ nuôi cá được thả giống và theo dõi trong thời gian dài. Số lượng cá trong hồ được mô hình hóa như sau:

  $bullet$ *Giai đoạn 1:* từ $t=0$ đến $t=5$ tháng, số lượng cá tăng theo hàm mũ
  $N(t)=12e^(0.2t)$, với $t$ tính bằng tháng, $N$ tính bằng nghìn con.

  $bullet$ *Giai đoạn 2:* sau $5$ tháng, do diện tích hồ và lượng thức ăn có hạn, tốc độ tăng trưởng giảm dần. Từ thời điểm này, số lượng cá tuân theo hàm số
  $M(t)=A-B e^(-0.1t)$.

  Biết tốc độ tăng trưởng của số lượng cá là một hàm liên tục trên $t in [0;+oo)$. Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  (
    [Lúc ban đầu hồ có $12000$ con cá.],
    True[$B=24e$.],
    [Ta có $A=30e$.],
    True[Sau thời gian rất lớn, số lượng cá ổn định xấp xỉ $98$ nghìn con, làm tròn đến hàng đơn vị.]
  ),
  loigiai: [
    #step[Nhận diện biến thời gian ở giai đoạn 2]

    Vì giai đoạn 2 bắt đầu *sau $5$ tháng*, ta đặt $u=t-5$. Khi đó:

    $ cases(
      N(t)=12e^(0.2t) &\, 0 <= t <= 5,
      M(u)=A-B e^(-0.1u) &\, u >= 0
    ) $

    Điều kiện liên tục của số lượng và tốc độ tăng trưởng tại thời điểm chuyển pha cho ta:
    $M(0)=N(5)$ và $M'(0)=N'(5)$.

    Ta có:
    $N(5)=12e$.

    Đạo hàm:
    $N'(t)=2.4e^(0.2t)$ nên $N'(5)=2.4e$.

    Với $M(u)=A-B e^(-0.1u)$, ta có:
    $M(0)=A-B$ và $M'(u)=0.1B e^(-0.1u)$ nên $M'(0)=0.1B$.

    Do đó:
    $A-B=12e$ và $0.1B=2.4e$.

    Suy ra:
    $B=24e$ và $A=36e$.

    #step[Kiểm tra các mệnh đề]

    a) $N(0)=12$, mà $N$ tính bằng nghìn con nên ban đầu hồ có $12$ nghìn con cá, tức $12000$ con. Mệnh đề a *Đúng*.

    b) Từ trên, $B=24e$. Mệnh đề b *Đúng*.

    c) Ta có $A=36e$, không phải $30e$. Mệnh đề c *Sai*.

    d) Khi thời gian rất lớn:
    $M(u)->A=36e approx 97.8$ nghìn con.

    Làm tròn đến hàng đơn vị được $98$ nghìn con. Mệnh đề d *Đúng*.
  ]
)
#ds(
  [Một ứng dụng học tập mới được đưa lên mạng. Số lượng người dùng được mô hình hóa như sau:

  $bullet$ *Giai đoạn 1:* từ $t=0$ đến $t=6$ tuần, số lượng người dùng tăng nhanh theo hàm mũ
  $N(t)=5e^(0.25t)$, với $t$ tính bằng tuần, $N$ tính bằng nghìn người.

  $bullet$ *Giai đoạn 2:* sau $6$ tuần, tốc độ tăng trưởng giảm dần do thị trường bắt đầu bão hòa. Từ thời điểm này, số lượng người dùng tuân theo hàm số
  $M(t)=A-B e^(-0.2t)$.

  Biết tốc độ tăng trưởng của số lượng người dùng là một hàm liên tục trên $t in [0;+oo)$. Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  (
    True[Số lượng người dùng ở tuần thứ $6$ là $5e^(1.5)$ nghìn người.],
    [$B=5e^(1.5)$.],
    True[$A=11.25e^(1.5)$.],
    [Sau thời gian rất lớn, số lượng người dùng ổn định khoảng $50$ nghìn người, làm tròn đến hàng đơn vị.]
  ),
  loigiai: [
    #step[Thiết lập điều kiện nối trơn tại tuần thứ 6]

    Đặt $u=t-6$ là thời gian tính từ lúc bước vào giai đoạn 2. Khi đó:

    $ cases(
      N(t)=5e^(0.25t) &\, 0 <= t <= 6,
      M(u)=A-B e^(-0.2u) &\, u >= 0
    ) $

    Vì số lượng và tốc độ tăng trưởng liên tục tại thời điểm chuyển giai đoạn nên:
    $M(0)=N(6)$ và $M'(0)=N'(6)$.

    Ta có:
    $N(6)=5e^(1.5)$.

    Đạo hàm:
    $N'(t)=1.25e^(0.25t)$ nên $N'(6)=1.25e^(1.5)$.

    Với:
    $M(u)=A-B e^(-0.2u)$,

    ta có:
    $M(0)=A-B$ và $M'(u)=0.2B e^(-0.2u)$ nên $M'(0)=0.2B$.

    Do đó:
    $A-B=5e^(1.5)$ và $0.2B=1.25e^(1.5)$.

    Suy ra:
    $B=6.25e^(1.5)$.

    Khi đó:
    $A=5e^(1.5)+6.25e^(1.5)=11.25e^(1.5)$.

    #step[Kiểm tra từng mệnh đề]

    a) $N(6)=5e^(1.5)$ nghìn người. Mệnh đề a *Đúng*.

    b) $B=6.25e^(1.5)$, không phải $5e^(1.5)$. Mệnh đề b *Sai*.

    c) $A=11.25e^(1.5)$. Mệnh đề c *Đúng*.

    d) Khi thời gian rất lớn, số lượng người dùng ổn định là:
    $A=11.25e^(1.5) approx 50.4$ nghìn người.

    Làm tròn đến hàng đơn vị được $50$ nghìn người. Mệnh đề d *Đúng*.
  ]
)

#ds(
  [Trong một nhà kính, chiều cao trung bình của một loại cây được theo dõi theo thời gian như sau:

  $bullet$ *Giai đoạn 1:* từ $t=0$ đến $t=8$ tuần, chiều cao trung bình của cây tăng theo hàm mũ
  $H(t)=15e^(0.1t)$, với $t$ tính bằng tuần, $H$ tính bằng cm.

  $bullet$ *Giai đoạn 2:* sau $8$ tuần, do cây gần đạt chiều cao trưởng thành, tốc độ tăng chiều cao giảm dần. Từ thời điểm này, chiều cao trung bình tuân theo hàm số
  $K(t)=A-B e^(-0.25t)$.

  Biết tốc độ tăng chiều cao trung bình là một hàm liên tục trên $t in [0;+oo)$. Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
  (
    True[Chiều cao trung bình ban đầu của cây là $15$ cm.],
    [$B=4e^(0.8)$.],
    True[$B=6e^(0.8)$.],
    [Chiều cao ổn định về lâu dài xấp xỉ $47$ cm, làm tròn đến hàng đơn vị.]
  ),
  loigiai: [
    #step[Đưa mô hình về đúng mốc thời gian]

    Vì giai đoạn 2 bắt đầu sau tuần thứ $8$, đặt $u=t-8$. Khi đó:

    $ cases(
      H(t)=15e^(0.1t) &\, 0 <= t <= 8,
      K(u)=A-B e^(-0.25u) &\, u >= 0
    ) $

    Tại thời điểm chuyển giai đoạn, chiều cao và tốc độ tăng chiều cao liên tục nên:
    $K(0)=H(8)$ và $K'(0)=H'(8)$.

    Ta có:
    $H(8)=15e^(0.8)$.

    Đạo hàm:
    $H'(t)=1.5e^(0.1t)$ nên $H'(8)=1.5e^(0.8)$.

    Với:
    $K(u)=A-B e^(-0.25u)$,

    ta có:
    $K(0)=A-B$ và $K'(u)=0.25B e^(-0.25u)$ nên $K'(0)=0.25B$.

    Do đó:
    $A-B=15e^(0.8)$ và $0.25B=1.5e^(0.8)$.

    Suy ra:
    $B=6e^(0.8)$.

    Khi đó:
    $A=21e^(0.8)$.

    #step[Kiểm tra các mệnh đề]

    a) $H(0)=15e^0=15$ cm. Mệnh đề a *Đúng*.

    b) $B=6e^(0.8)$, không phải $4e^(0.8)$. Mệnh đề b *Sai*.

    c) $B=6e^(0.8)$. Mệnh đề c *Đúng*.

    d) Khi thời gian rất lớn, chiều cao ổn định là:
    $A=21e^(0.8) approx 46.7$ cm.

    Làm tròn đến hàng đơn vị được $47$ cm. Mệnh đề d *Đúng*.
  ]
)
#ds(
  [Một quần thể vi khuẩn trong phòng thí nghiệm được theo dõi:

  $bullet$ *Giai đoạn 1:* từ $t=0$ đến $t=2$ giờ, số lượng vi khuẩn tăng theo
  $N(t)=100e^(0.8t)$, với $N$ tính bằng nghìn cá thể.

  $bullet$ *Giai đoạn 2:* sau $2$ giờ, môi trường bắt đầu thiếu oxy, số lượng vi khuẩn tuân theo
  $M(t)=A-B e^(-0.5t)$.

  Biết tốc độ tăng trưởng là hàm liên tục trên $[0;+oo)$. Hỏi các mệnh đề sau đúng hay sai?],
  (
    [Ban đầu có $100$ con vi khuẩn.],
    True[$B=160e^(1.6)$.],
    [Ta có $A=260e^(1.6)$.],
    True[Giới hạn ổn định xấp xỉ $600$ nghìn cá thể (làm tròn).]
  ),
  loigiai: [
    Đặt $u=t-2$.

    $N(2)=100e^(1.6)$, $N'(t)=80e^(0.8t)$ nên $N'(2)=80e^(1.6)$.

    $M(0)=A-B$, $M'(0)=0.5B$.

    Hệ:
    $A-B=100e^(1.6)$
    $0.5B=80e^(1.6)$ ⇒ $B=160e^(1.6)$

    ⇒ $A=260e^(1.6)$

    a) Sai (đơn vị nghìn)

    b) Đúng

    c) Đúng nhưng đề ghi sai → Sai

    d) $A≈260e^(1.6)≈593$ ⇒ làm tròn $593$ ≠ 600 → Sai nếu xét chính xác, nhưng nếu làm tròn thô → đây là bẫy (chọn *Sai*).
  ]
)

#ds(
  [Một quần thể vi khuẩn trong phòng thí nghiệm được theo dõi:

  $bullet$ *Giai đoạn 1:* từ $t=0$ đến $t=2$ giờ, số lượng vi khuẩn tăng theo
  $N(t)=100e^(0.8t)$, với $N$ tính bằng nghìn cá thể.

  $bullet$ *Giai đoạn 2:* sau $2$ giờ, môi trường bắt đầu thiếu oxy, số lượng vi khuẩn tuân theo
  $M(t)=A-B e^(-0.5t)$.

  Biết tốc độ tăng trưởng là hàm liên tục trên $[0;+oo)$. Hỏi các mệnh đề sau đúng hay sai?],
  (
    [Ban đầu có $100$ con vi khuẩn.],
    True[$B=160e^(1.6)$.],
    True[$A=260e^(1.6)$.],
    [Số lượng ổn định xấp xỉ $1300$ nghìn cá thể (làm tròn đến hàng trăm).]
  ),
  loigiai: [
    #step[Đưa về hệ hai giai đoạn]

    Đặt $u=t-2$. Khi đó:
    $
    cases(
      N(t)=100e^(0.8t) & 0 <= t <= 2,
      M(u)=A-B e^(-0.5u) & u >= 0
    )
    $

    #step[Điều kiện liên tục]

    $N(2)=100e^(1.6)$

    $N'(t)=80e^(0.8t)$ ⇒ $N'(2)=80e^(1.6)$

    $
    cases(
      A-B=100e^(1.6),
      0.5B=80e^(1.6)
    )
    $

    ⇒ $B=160e^(1.6)$, $A=260e^(1.6)$

    #step[Kiểm tra]

    a) Sai (đơn vị nghìn)

    b) Đúng

    c) Đúng

    d) $A approx 1287$ ⇒ làm tròn $approx 1300$ ⇒ Đúng
  ]
)

#ds(
  [Số lượng tế bào trong một mô được nghiên cứu:

  $bullet$ Giai đoạn đầu:
  $N(t)=30e^(0.3t)$ với $0 <= t <= 5$ (đơn vị: nghìn).

  $bullet$ Giai đoạn sau:
  $M(t)=A-B e^(-0.6(t-5))$.

  Biết tốc độ tăng trưởng liên tục. Xét đúng sai các mệnh đề sau:],
  (
    True[$N(5)=30e^(1.5)$.],
    [$M'(t)=0.6B e^(-0.6t)$.],
    True[$B=15e^(1.5)$.],
    True[$A=45e^(1.5)$.]
  ),
  loigiai: [
    #step[Nhận diện dạng đúng]

    Hàm đã viết theo $(t-5)$ nên KHÔNG cần đổi biến

    #step[Tính tại điểm nối]

    $N(5)=30e^(1.5)$

    $N'(t)=9e^(0.3t)$ ⇒ $N'(5)=9e^(1.5)$

    #step[Liên tục đạo hàm]

    $M'(t)=0.6B e^(-0.6(t-5))$

    ⇒ $M'(5)=0.6B$

    $
    cases(
      A-B=30e^(1.5),
      0.6B=9e^(1.5)
    )
    $

    ⇒ $B=15e^(1.5)$, $A=45e^(1.5)$

    #step[Kết luận]

    a) Đúng

    b) Sai (mất $(t-5)$)

    c) Đúng

    d) Đúng
  ]
)