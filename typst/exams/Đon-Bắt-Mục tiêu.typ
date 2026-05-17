#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

// ==========================================
// THIẾT KẾ GIAO DIỆN TIÊU ĐỀ
// ==========================================
#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)

// ==========================================
// HÀM VẼ ĐA GIÁC CƠ BẢN (DÙNG CHUNG)
// ==========================================
#let draw-poly(n, r: 1.2) = {
  import cetz.draw: *
  circle((0, 0), radius: r, stroke: luma(200) + 0.5pt)
  for i in range(n) {
    circle((90deg - i * 360deg / n, r), radius: 1.2pt, fill: gray)
  }
}
// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill: math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display
// ==========================================
// NỘI DUNG TÀI LIỆU
// ==========================================
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
    [
      #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
        ĐÁNH TRẬN - ĐÓN MỤC TIÊU
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        Vấn đề hai vật chuyển động có vận tốc gặp nhau
      ]
    ],
  )
]
#tln(
  [Trên mặt phẳng tọa độ với đơn vị dài trên mỗi trục là kilômét có một khẩu pháo đặt tại gốc tọa độ và một mục tiêu chuyển động thẳng đều ở thời điểm ban đầu có tọa độ $A(0","5; 6)$. Ở thời điểm $20$ giây khoảng cách từ mục tiêu đến $3$ radar đặt tại $O$, $G(0","1; 0)$, $H(0; 0","1)$ lần lượt là $sqrt(97)/2$ km; $sqrt(2 386)/10$ km; $(2sqrt(146))/5$ km. Ngay sau đó từ khẩu pháo bắn ra một viên đạn bay với tốc độ $v_0$ m/s để đón bắt mục tiêu. Hãy tính theo đơn vị m/s giá trị nhỏ nhất $v_0$ (_làm tròn kết quả đến hàng đơn vị_).],
  [$99$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Mặt biển
    rect((0.2, 0.2), (4.5, 3.5), fill: rgb("99e6ff"), stroke: (paint: blue, thickness: 1pt), radius: 0.2)
    content((3.5, 1.8), text(weight: "bold")[Mặt biển])
    
    // Trục tọa độ
    line((-0.5, 0), (5, 0), mark: (end: ">"), stroke: 0.6pt)
    content((4.8, -0.3), $x$)
    line((0, -0.5), (0, 4), mark: (end: ">"), stroke: 0.6pt)
    content((-0.3, 3.8), $y$)
    content((-0.2, -0.3), $O$)
    
    // Các điểm G, H
    circle((0.8, 0), radius: 1pt, fill: black)
    content((0.8, -0.3), $G$)
    circle((0, 0.5), radius: 1pt, fill: black)
    content((-0.3, 0.5), $H$)
    
    // Quỹ đạo mục tiêu
    let A = (0.5, 3)
    circle(A, radius: 1.5pt, fill: black)
    content((0.7, 3.2), $A$)
    line((-0.2, 3.7), (3.5, 0.4), stroke: (dash: "dashed", paint: rgb("666666")))
    
    // Đạn và khẩu pháo
    circle((0,0), radius: 1.5pt, fill: black)
    content((0, -0.7), [Khẩu pháo])
    line((0,0), (1.2, 0.8), mark: (end: ">"), stroke: (paint: blue, thickness: 1pt))
    content((0.9, 1.1), $vect(v)_0$, fill: blue)
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Giả sử tọa độ mục tiêu sau $20$ giây là $M_1(x;y)$. Giải hệ phương trình khoảng cách từ $M_1$ đến $O, G, H$ để tìm $(x; y)$.
      - Tính vectơ vận tốc của mục tiêu $vect(v)_T = (vect(A M_1))/20$.
      - Thiết lập phương trình chuyển động của mục tiêu và biểu diễn khoảng cách từ gốc tọa độ $O$ đến mục tiêu tại thời điểm $t > 20$.
      - Viên đạn bắn ra phải đi quãng đường bằng khoảng cách đó trong khoảng thời gian $T = t - 20$. Lập hàm số biểu diễn $v_0$ theo $T$ và tìm giá trị nhỏ nhất của hàm số đó.
    ]
    
    Tại thời điểm $t = 20$ giây, giả sử mục tiêu ở vị trí $M_1(x; y)$. Khoảng cách từ $M_1$ đến $O, G, H$ thỏa mãn hệ phương trình:
    $ cases(
      O M_1^2 = (sqrt(97)/2)^2 = 24","25,
      G M_1^2 = (sqrt(2386)/10)^2 = 23","86,
      H M_1^2 = ((2sqrt(146))/5)^2 = 23","36
    ) <=> cases(
      x^2 + y^2 = 24","25 quad (1),
      (x - 0","1)^2 + y^2 = 23","86 quad (2),
      x^2 + (y - 0","1)^2 = 23","36 quad (3)
    ) $
    Lấy $(1) - (2)$ vế theo vế, ta được:
    $ 0","2x - 0","01 = 24","25 - 23","86 = 0","39 <=> 0","2x = 0","4 <=> x = 2. $
    Lấy $(1) - (3)$ vế theo vế, ta được:
    $ 0","2y - 0","01 = 24","25 - 23","36 = 0","89 <=> 0","2y = 0","9 <=> y = 4","5. $
    Vậy tọa độ mục tiêu sau $20$ giây là $M_1(2; 4","5)$.
    
    Vectơ vận tốc của mục tiêu (theo km/s) là:
    $ vect(v)_T = (vect(A M_1))/20 = (2 - 0","5; 4","5 - 6)/20 = (1","5; -1","5)/20 = (0","075; -0","075). $
    
    Giả sử viên đạn bắn trúng mục tiêu sau thời gian $T$ (giây) kể từ lúc bắn ($T > 0$).
    Vị trí mục tiêu lúc đạn trúng là:
    $ M(T) = (2 + 0","075T; 4","5 - 0","075T). $
    Đổi tốc độ viên đạn ra km/s: $v_0 " m/s" = v_0 dot 10^(-3) " km/s"$.
    Quãng đường viên đạn đi được chính là đoạn $O M(T)$, nên ta có:
    $ (v_0 dot 10^(-3) T)^2 &= O M(T)^2 \
    v_0^2 dot 10^(-6) T^2 &= (2 + 0","075T)^2 + (4","5 - 0","075T)^2 \
    v_0^2 dot 10^(-6) T^2 &= 4 + 0","3T + 0","005625T^2 + 20","25 - 0","675T + 0","005625T^2 \
    v_0^2 dot 10^(-6) T^2 &= 24","25 - 0","375T + 0","01125T^2. $
    Chia cả hai vế cho $T^2$, ta có:
    $ v_0^2 dot 10^(-6) = 24","25(1/T)^2 - 0","375(1/T) + 0","01125. $
    Đặt $u = 1/T > 0$, xét hàm số bậc hai:
    $ f(u) = 24","25 u^2 - 0","375 u + 0","01125. $
    Hàm số $f(u)$ đạt giá trị nhỏ nhất tại:
    $ u = (-(-0","375))/(2 dot 24","25) = 0","375/48","5 = 3/388. $
    Giá trị nhỏ nhất của $f(u)$ là:
    $ f(3/388) = 24","25 (3/388)^2 - 0","375 (3/388) + 0","01125 = 1521/155200. $
    Suy ra:
    $ v_0^2 dot 10^(-6) = 1521/155200 => v_0^2 = (1521 dot 10^6)/155200 = 950625/97. $
    $ => v_0 = sqrt(950625/97) approx 98","996 " m/s". $
    Làm tròn kết quả đến hàng đơn vị, ta được $v_0 approx 99$.
  ]
)

#tln(
  [Trong không gian $O x y z$ (đơn vị trên các trục là nghìn km), một trạm phòng thủ không gian được đặt tại điểm $I(1; 1; 1)$. Lá chắn năng lượng bảo vệ trạm là một mặt cầu $(S)$ có tâm $I$ và bán kính $R = 5$. 
  
  Hệ thống radar phát hiện một thiên thạch đang bay thẳng đều. Tại thời điểm $t=0$ (giây), thiên thạch ở vị trí $M_0(3; 0; -1)$ (nằm bên trong lá chắn) và có véc-tơ vận tốc là $vect(v) = (2; 2; 1)$ (nghìn km/s).
  
  Ngay tại $t=0$, từ trạm $I$ phóng một tên lửa đánh chặn bay thẳng đều để tiêu diệt thiên thạch. Biết rằng tên lửa được lập trình để đánh trúng thiên thạch đúng tại vị trí thiên thạch chuẩn bị thoát ra khỏi lá chắn năng lượng $(S)$. 
  
  Hãy tính tốc độ bay của tên lửa đánh chặn (theo đơn vị nghìn km/s, viết kết quả dưới dạng số thập phân).],
  [$3,75$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Lá chắn (S)
    circle((0,0), radius: 2.5, fill: rgb("e8f0fc99"), stroke: (paint: blue, dash: "dashed", thickness: 0.8pt))
    circle((0,0), radius: (2.5, 0.7), stroke: (paint: blue, dash: "dotted", thickness: 0.8pt))
    
    // Tâm I
    circle((0,0), radius: 2pt, fill: red)
    content((0,-0.3), $I(1;1;1)$, fill: red, size: 9pt)
    
    // Quỹ đạo thiên thạch
    let M0 = (-1.2, -1.0)
    let B = (1.5, 2.0)
    line((-2.2, -2.5), (2.2, 2.8), stroke: (paint: gray, thickness: 1pt))
    
    // Thiên thạch tại M0
    circle(M0, radius: 2pt, fill: black)
    content((-1.5, -0.7), $M_0$)
    line(M0, (-0.3, 0.0), mark: (end: ">"), stroke: (paint: black, thickness: 1.2pt))
    content((-0.9, -0.1), $vect(v)$)
    
    // Điểm chạm B
    circle(B, radius: 2.5pt, fill: orange)
    content((1.8, 2.2), $B$, fill: orange, weight: "bold")
    
    // Tên lửa
    line((0,0), B, mark: (end: ">"), stroke: (paint: red, thickness: 1.2pt))
    content((0.5, 1.2), [Tên lửa], fill: red, size: 9pt, angle: 53deg)
    
    // Bán kính R
    line((0,0), (2.5, 0), stroke: (paint: blue, dash: "dotted"))
    content((1.5, -0.2), $R = 5$, fill: blue, size: 9pt)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Viết phương trình chuyển động (phương trình tham số) của thiên thạch theo thời gian $t$.
      - Xác định thời điểm $t > 0$ mà thiên thạch chạm vào mặt cầu $(S)$ bằng cách giải phương trình khoảng cách $I M(t) = R$.
      - Nhận xét rằng quãng đường tên lửa bay từ tâm $I$ đến điểm chạm trên mặt cầu chính bằng bán kính $R$.
      - Áp dụng công thức tính tốc độ $v = S/t$ để tìm tốc độ của tên lửa.
    ]
    
    Tại thời điểm $t >= 0$, vị trí của thiên thạch $M$ có tọa độ phụ thuộc vào $t$ theo phương trình chuyển động:
    $ cases(
      x = x_0 + v_x t = 3 + 2t,
      y = y_0 + v_y t = 0 + 2t = 2t,
      z = z_0 + v_z t = -1 + t
    ) $
    Tức là $M(3 + 2t; 2t; -1 + t)$.
    
    Thiên thạch chuẩn bị thoát ra khỏi lá chắn khi nó nằm ngay trên mặt cầu $(S)$, đồng nghĩa với việc khoảng cách từ tâm $I(1; 1; 1)$ đến $M$ đúng bằng bán kính $R = 5$.
    Ta có véctơ $vect(I M) = (2 + 2t; -1 + 2t; -2 + t)$.
    Bình phương khoảng cách $I M^2 = R^2$, ta được:
    $ (2 + 2t)^2 + (-1 + 2t)^2 + (-2 + t)^2 = 25 $
    $ <=> 4 + 8t + 4t^2 + 1 - 4t + 4t^2 + 4 - 4t + t^2 = 25 $
    $ <=> 9t^2 + 9 = 25 $
    $ <=> 9t^2 = 16 <=> t^2 = 16/9 $
    
    Do $t > 0$ (thời điểm sau khi phát hiện), ta chọn $t = 4/3$ (giây). 
    Vậy sau $4/3$ giây kể từ lúc $t=0$, thiên thạch sẽ chạm vào giới hạn của lá chắn tại điểm $B$.
    
    Trong cùng khoảng thời gian $T = 4/3$ giây đó, tên lửa được phóng từ tâm $I$ và đánh trúng thiên thạch tại $B$. Vì $B$ nằm trên mặt cầu $(S)$ tâm $I$, quãng đường tên lửa đã bay chính xác bằng bán kính mặt cầu: 
    $ S_"tên lửa" = I B = R = 5 " (nghìn km)". $
    
    Tốc độ bay của tên lửa đánh chặn là:
    $ v_"tên lửa" = S_"tên lửa"/T = 5 / (4/3) = 15/4 = 3","75 " (nghìn km/s)". $
    
    #meo[
      Bài toán có thể đánh lừa học sinh đi tính tọa độ cụ thể của điểm $B$ rồi mới tính độ dài $I B$. Tuy nhiên, nếu nắm vững bản chất hình học, ta nhận ra ngay điểm đánh chặn nằm trên mặt cầu tâm $I$, nên quãng đường bay của tên lửa xuất phát từ $I$ bắt buộc phải bằng bán kính $R = 5$ mà không cần bận tâm tọa độ điểm $B$ là bao nhiêu.
    ]
  ]
)
#ds(
  [Trong không gian $O x y z$ (đơn vị: km), một trạm phòng thủ không gian được đặt tại gốc tọa độ $O(0;0;0)$. Hệ thống radar phát hiện một mục tiêu bay thẳng đều với véc-tơ vận tốc $vect(v)_T = (-3; -4; 0)$ (km/s). Tại thời điểm ban đầu ($t=0$), mục tiêu ở vị trí $M_0(12; 16; 15)$. Ngay lúc đó, từ trạm $O$ phóng một tên lửa đánh chặn bay thẳng đều với tốc độ $v$ (km/s) để tiêu diệt mục tiêu. Giả sử tên lửa luôn được lập trình hướng đúng vào vị trí giao hội với mục tiêu. Xét tính đúng/sai của các phát biểu sau:
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Hệ trục tọa độ 3D mô phỏng
      line((0,0), (4,0), mark: (end: ">"), stroke: 0.5pt); content((4.2, 0), $y$)
      line((0,0), (0,3.5), mark: (end: ">"), stroke: 0.5pt); content((0, 3.7), $z$)
      line((0,0), (-2,-1.5), mark: (end: ">"), stroke: 0.5pt); content((-2.2, -1.7), $x$)
      content((0.2, -0.2), $O$)
      
      // Quỹ đạo mục tiêu
      let M0 = (2.5, 2.5) 
      let M_end = (-1.5, 2.5)
      line(M0, M_end, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
      
      // Vị trí ban đầu M0
      circle(M0, radius: 2pt, fill: black)
      content((2.8, 2.7), $M_0$)
      
      // Điểm đánh chặn M(t)
      let I_pt = (0, 2.5)
      circle(I_pt, radius: 2.5pt, fill: orange)
      content((-0.2, 2.9), $M(t)$)
      
      // Vận tốc mục tiêu
      line(M0, (0.8, 2.5), mark: (end: ">"), stroke: (paint: blue, thickness: 1.5pt))
      content((1.6, 2.2), $vect(v)_T$, fill: blue)
      
      // Quỹ đạo tên lửa
      line((0,0), I_pt, mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))
      content((-0.4, 1.2), $vect(v)$, fill: red)
      
      // Khoảng cách ngắn nhất (đường cao)
      line((0,0), (0.7, 2.5), stroke: (dash: "dotted", paint: rgb("008800"), thickness: 1pt))
      content((0.5, 1.5), $d_"min"$, fill: rgb("008800"))
      // Ký hiệu vuông góc
      line((0.5, 2.5), (0.5, 2.3), (0.7, 2.3), stroke: 0.5pt)
    })
  ]
  ],
  (
    True([Phương trình chuyển động của mục tiêu là $x = 12 - 3t$, $y = 16 - 4t$, $z = 15$.]),
    [Tốc độ bay của mục tiêu là $25$ km/s.],
    True([Nếu tên lửa được thiết lập đánh chặn mục tiêu ở thời điểm $t = 4$ giây thì tốc độ của tên lửa là $3","75$ km/s.]),
    [Để tên lửa có thể đuổi kịp và đánh chặn thành công mục tiêu, tốc độ của tên lửa phải thỏa mãn điều kiện $v >= 4$ km/s.]
  ),
  loigiai: [
    #ppgiai[
      - Viết phương trình chuyển động của mục tiêu dưới dạng tham số $M(t) = M_0 + vect(v)_T dot t$.
      - Tốc độ của mục tiêu chính là độ dài véc-tơ vận tốc $|vect(v)_T|$.
      - Khoảng cách từ trạm $O$ đến mục tiêu tại thời điểm $t$ là $O M(t)$. Tên lửa bay với tốc độ $v$ trong thời gian $t$ thì quãng đường đi được là $v dot t$.
      - Dể đánh chặn thành công, tên lửa và mục tiêu phải cùng lúc đến vị trí $M(t)$, tức là $v dot t = O M(t)$. Giải phương trình này để tìm điều kiện của $v$.
    ]
    
    - *Ý a) Đúng.* Phương trình chuyển động của mục tiêu đi qua $M_0(12; 16; 15)$ với vận tốc $vect(v)_T = (-3; -4; 0)$ là:
      $ cases(
        x = 12 - 3t,
        y = 16 - 4t,
        z = 15
      ) $
      Do đó, vị trí của mục tiêu tại thời điểm $t$ là $M(12 - 3t; 16 - 4t; 15)$.
      
    - *Ý b) Sai.* Tốc độ bay của mục tiêu bằng độ dài véc-tơ vận tốc $vect(v)_T$:
      $ |vect(v)_T| = sqrt((-3)^2 + (-4)^2 + 0^2) = sqrt(9 + 16) = 5 " (km/s)". $
      Con số $25$ km thực chất là khoảng cách ban đầu $O M_0 = sqrt(12^2 + 16^2 + 15^2) = 25$.
      
    - *Ý c) Đúng.* Nếu đánh chặn ở thời điểm $t = 4$ giây, vị trí của mục tiêu lúc đó là:
      $ M(4) = (12 - 3(4); 16 - 4(4); 15) = (0; 0; 15). $
      Quãng đường tên lửa phải bay từ $O$ đến $M(4)$ là:
      $ O M(4) = sqrt(0^2 + 0^2 + 15^2) = 15 " (km)". $
      Tốc độ của tên lửa cần thiết lập là:
      $ v = (O M(4))/4 = 15/4 = 3","75 " (km/s)". $
      
    - *Ý d) Sai.* Xét điều kiện để đánh chặn thành công tại một thời điểm $t > 0$ bất kỳ. Ta có phương trình khoảng cách:
      $ (v dot t)^2 &= O M(t)^2 \
      v^2 t^2 &= (12 - 3t)^2 + (16 - 4t)^2 + 15^2 \
      v^2 t^2 &= 144 - 72t + 9t^2 + 256 - 128t + 16t^2 + 225 \
      v^2 t^2 &= 25t^2 - 200t + 625 \
      <=> (v^2 - 25)t^2 &+ 200t - 625 = 0 quad (*) $
      Để tên lửa đánh trúng mục tiêu, phương trình $(*)$ phải có ít nhất một nghiệm $t > 0$.
      - Nếu $v^2 - 25 = 0 <=> v = 5$ (do $v>0$), phương trình thành $200t - 625 = 0 <=> t = 3","125 > 0$ (thỏa mãn).
      - Nếu $v^2 - 25 != 0$, đây là phương trình bậc hai theo $t$. Ta xét tích hai nghiệm $P = -625/(v^2 - 25)$.
        + Nếu $v > 5 => P < 0$: phương trình luôn có hai nghiệm trái dấu, chắc chắn có một nghiệm $t > 0$. Tên lửa luôn đuổi kịp.
        + Nếu $v < 5$: Để phương trình có nghiệm, điều kiện cần là $Delta' >= 0$.
          $ Delta' = 100^2 - (-625)(v^2 - 25) >= 0 \
          <=> 10000 + 625(v^2 - 25) >= 0 \
          <=> 16 + v^2 - 25 >= 0 \
          <=> v^2 >= 9 <=> v >= 3. $
          (Khi $3 <= v < 5$, ta dễ dàng kiểm tra được tổng hai nghiệm $S = -200/(v^2 - 25) > 0$ và $P = -625/(v^2 - 25) > 0$ nên phương trình có hai nghiệm dương).
      Vậy tốc độ tối thiểu của tên lửa để đánh chặn thành công là $v_"min" = 3$ km/s, chứ không phải $4$ km/s.
      
    #meo[
      Có một góc nhìn Hình học - Vật lý cực hay để giải nhanh ý d) mà không cần biện luận phương trình bậc hai:
      Tốc độ tối thiểu của tên lửa đạt được khi tên lửa bay theo đường **ngắn nhất** xét theo hệ quy chiếu tương đối, hay về mặt hình học, liên quan đến góc tới. 
      Công thức giải nhanh tốc độ đánh chặn tối thiểu là: $v_"min" = v_T dot sin alpha$, trong đó $alpha$ là góc hợp bởi véc-tơ vận tốc mục tiêu $vect(v)_T$ và véc-tơ vị trí ban đầu $vect(O M_0)$.
      - Tính khoảng cách từ $O$ đến đường thẳng chứa quỹ đạo mục tiêu (chính là chiều cao $d_"min"$ trong hình vẽ): 
        $d_"min" = |[vect(O M_0), vect(v)_T]| / |vect(v)_T| = |(60; -45; 0)|/5 = 75/5 = 15$.
      - $sin alpha = d_"min" / (O M_0) = 15/25 = 3/5$.
      - Suy ra $v_"min" = 5 dot 3/5 = 3$ km/s.
    ]
    #luuy[
      Trong thực tế tác chiến, tên lửa không bao giờ bay với tốc độ $v_"min"$, vì khi đó tên lửa phải bay một quãng đường rất xa (chạy đua đuổi theo mục tiêu). Trạm phòng thủ luôn cố gắng thiết lập tốc độ $v > v_T$ để có thể tiêu diệt mục tiêu càng sớm càng tốt.
    ]
  ]
)

#tln(
  [Trong không gian tọa độ $O x y$ (đơn vị trên các trục là km), một trạm phòng không được đặt tại gốc tọa độ $O$. Hệ thống radar phát hiện một mục tiêu bay có quỹ đạo là một phần của đường parabol có phương trình $y = 12 - x^2/4$. Tại thời điểm ban đầu ($t=0$ giây), mục tiêu xuất hiện tại vị trí $A(-4; 8)$ và hình chiếu của mục tiêu trên trục $O x$ chuyển động thẳng đều với vận tốc $v_x = 2 " km/s"$ theo chiều dương của trục $O x$. 
  
  Ngay tại thời điểm $t=0$, trạm phòng không phóng một tên lửa đánh chặn bay trên một đường thẳng với tốc độ không đổi $v_0$ để tiêu diệt mục tiêu. Giả sử tên lửa được lập trình để đánh trúng mục tiêu ngay tại vị trí cao nhất của quỹ đạo parabol. Hãy tính tốc độ $v_0$ (km/s) của tên lửa đánh chặn.],
  [$6$],
  fig: cetz.canvas(length: 0.25cm, {
    import cetz.draw: *
    // Trục tọa độ
    line((-7, 0), (7, 0), mark: (end: ">"), stroke: 0.5pt); content((7, -1.5), $x$)
    line((0, -1), (0, 14), mark: (end: ">"), stroke: 0.5pt); content((-1.5, 14), $y$)
    content((-1.5, -1.5), $O$)
    
    // Quỹ đạo parabol
    let pts = ()
    for i in range(0, 51) {
      let x = -6 + i * 0.24
      let y = 12 - (x*x)/4
      pts.push((x, y))
    }
    line(..pts, stroke: (paint: red, thickness: 1pt, dash: "dashed"))
    
    // Vị trí A
    circle((-4, 8), radius: 3pt, fill: black)
    content((-5.5, 8.5), $A$)
    
    // Vị trí đỉnh (Điểm đánh chặn)
    circle((0, 12), radius: 3pt, fill: orange)
    content((2.5, 12.5), [Điểm nổ])
    
    // Quỹ đạo tên lửa
    line((0,0), (0, 11.5), mark: (end: ">"), stroke: (paint: blue, thickness: 1.2pt))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Xác định tọa độ điểm cao nhất của quỹ đạo parabol (đỉnh parabol).
      - Dựa vào phương trình chuyển động của hình chiếu trên trục $O x$, tìm thời gian $t$ để mục tiêu bay từ vị trí ban đầu $A$ đến đỉnh parabol.
      - Tính khoảng cách từ trạm phóng $O$ đến đỉnh parabol (quãng đường tên lửa phải bay).
      - Sử dụng công thức $v_0 = S / t$ để tính tốc độ của tên lửa.
    ]
    
    Tọa độ đỉnh của parabol $y = 12 - x^2/4$ đạt được khi $x = 0$, lúc đó $y = 12$. 
    Vậy vị trí cao nhất của quỹ đạo mục tiêu là điểm $M(0; 12)$.
    
    Hình chiếu của mục tiêu trên trục $O x$ chuyển động thẳng đều với vận tốc $v_x = 2 " km/s"$ xuất phát từ hoành độ $x_A = -4$. 
    Phương trình hoành độ của mục tiêu theo thời gian $t$ là:
    $ x(t) = -4 + 2t $
    
    Khi mục tiêu đến vị trí cao nhất $M(0; 12)$, hoành độ của nó là $x = 0$. Ta có:
    $ -4 + 2t = 0 <=> 2t = 4 <=> t = 2 " (giây)". $
    Vậy sau $2$ giây kể từ lúc phát hiện, mục tiêu sẽ đến điểm nổ $M$.
    
    #align(center)[
      #cetz.canvas(length: 0.3cm, {
        import cetz.draw: *
        line((-5, 0), (5, 0), mark: (end: ">"), stroke: 0.5pt); content((5, -1), $x$)
        line((0, -1), (0, 14), mark: (end: ">"), stroke: 0.5pt); content((-1, 14), $y$)
        content((-1, -1), $O$)
        
        let pts = ()
        for i in range(0, 51) {
          let x = -5 + i * 0.2
          let y = 12 - (x*x)/4
          pts.push((x, y))
        }
        line(..pts, stroke: (paint: red, thickness: 1pt, dash: "dashed"))
        
        circle((-4, 8), radius: 2.5pt, fill: black)
        content((-6, 8), $A(t=0)$)
        line((-4, 8), (-2, 8), mark: (end: ">"), stroke: (paint: gray, thickness: 1pt))
        content((-3, 9.5), $v_x = 2$)
        
        circle((0, 12), radius: 2.5pt, fill: orange)
        content((3, 12), $M(t=2)$)
        
        line((0,0), (0, 11.5), mark: (end: ">"), stroke: (paint: blue, thickness: 1.2pt))
        content((-1.5, 5), $S = 12$, fill: blue)
      })
    ]
    
    Quãng đường tên lửa bay từ gốc tọa độ $O(0;0)$ đến điểm đánh chặn $M(0; 12)$ là:
    $ S = O M = sqrt(0^2 + 12^2) = 12 " (km)". $
    
    Vì tên lửa và mục tiêu phải đến $M$ cùng lúc, thời gian bay của tên lửa cũng là $t = 2$ giây.
    Tốc độ của tên lửa đánh chặn là:
    $ v_0 = S / t = 12 / 2 = 6 " (km/s)". $
    
    #nhanxet[
      Đây là bài toán tích hợp giữa Hình học giải tích và Động học chất điểm. Việc tách chuyển động thành các thành phần tọa độ (chỉ xét hoành độ $x(t)$) giúp ta dễ dàng xác định thời gian bay mà không cần tính độ dài cung parabol phức tạp. Khái niệm độc lập của các chuyển động theo trục $O x$ và $O y$ thường xuyên được áp dụng trong các bài toán ném xiên và mô phỏng đạn đạo.
    ]
  ]
)

#tln(
  [Trong không gian tọa độ $O x y z$ (đơn vị trên các trục là km), một trạm phòng thủ không gian được đặt tại vị trí $I(6; -4; 3)$. Hệ thống radar phát hiện một thiên thạch có quỹ đạo bay là một đường parabol. Phương trình chuyển động của thiên thạch theo thời gian $t$ (giây) được xác định bởi: 
  $ cases(
    x(t) = 3t,
    y(t) = 4t,
    z(t) = 8t - 2t^2
  ) quad (t >= 0). $
  Ngay tại thời điểm $t=0$, từ trạm $I$ phóng một tên lửa đánh chặn bay thẳng đều với tốc độ không đổi $v_0$ (km/s) để tiêu diệt thiên thạch. Giả sử tên lửa được lập trình để đánh trúng thiên thạch ngay tại vị trí cao nhất của quỹ đạo parabol. Hãy tính tốc độ $v_0$ của tên lửa đánh chặn.],
  [$6,5$],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    
    // Hệ trục tọa độ 3D mô phỏng
    line((0,0), (5,0), mark: (end: ">"), stroke: 0.5pt); content((5.2, 0), $y$)
    line((0,0), (0,5), mark: (end: ">"), stroke: 0.5pt); content((0, 5.2), $z$)
    line((0,0), (-2.5,-1.5), mark: (end: ">"), stroke: 0.5pt); content((-2.8, -1.7), $x$)
    content((0.3, -0.3), $O$)
    
    // Quỹ đạo thiên thạch (Parabol 3D mô phỏng 2D)
    let M0 = (0, 0)
    let M = (2.5, 4.5) // Điểm cao nhất
    let M_end = (5, 1)
    
    bezier(M0, M_end, (1, 4), (4, 4.5), stroke: (paint: gray, thickness: 1.2pt, dash: "dashed"))
    circle(M0, radius: 2pt, fill: black)
    content((-0.5, 0.5), $t=0$)
    
    // Điểm đánh chặn M
    circle(M, radius: 3pt, fill: orange)
    content((2.5, 5.1), $M_"max"$)
    
    // Trạm phòng thủ I
    let I_pt = (4.5, 1.5)
    circle(I_pt, radius: 2.5pt, fill: blue)
    content((5.1, 1.5), $I$, fill: blue, weight: "bold")
    
    // Quỹ đạo tên lửa
    line(I_pt, M, mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))
    content((3.6, 2.8), $vect(v)_0$, fill: red)
    
    // Đường gióng độ cao
    line(M, (2.5, 0), stroke: (paint: gray, dash: "dotted"))
    line((2.5, 0), (0,0), stroke: (paint: gray, dash: "dotted"))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Phân tích phương trình chuyển động của thiên thạch để tìm thời điểm $t$ nó đạt độ cao lớn nhất (tức là cực đại của hàm cao độ $z(t)$).
      - Thay $t$ tìm được vào hệ phương trình chuyển động để suy ra tọa độ điểm nổ $M$ trong không gian $O x y z$.
      - Tính khoảng cách từ trạm phóng $I$ đến điểm nổ $M$ (đây chính là quãng đường tên lửa phải bay).
      - Áp dụng công thức $v_0 = S / t$ để tính tốc độ của tên lửa.
    ]
    
    Từ phương trình chuyển động của thiên thạch, ta xét thành phần cao độ $z(t)$:
    $ z(t) = 8t - 2t^2 = -2(t^2 - 4t + 4) + 8 = -2(t-2)^2 + 8. $
    Vì $-2(t-2)^2 <= 0 quad forall t >= 0$, nên $z(t) <= 8$.
    Dấu "$=$" xảy ra khi $t - 2 = 0 <=> t = 2$.
    Vậy thiên thạch đạt vị trí cao nhất tại thời điểm $t = 2$ (giây).
    
    Thay $t = 2$ vào phương trình chuyển động của thiên thạch, ta được tọa độ điểm đánh chặn $M$:
    $ cases(
      x = 3(2) = 6,
      y = 4(2) = 8,
      z = 8
    ) $
    Suy ra $M(6; 8; 8)$.
    
    Quãng đường tên lửa đánh chặn cần bay từ trạm $I(6; -4; 3)$ đến điểm $M(6; 8; 8)$ là độ dài đoạn thẳng $I M$:
    $ I M = sqrt((6 - 6)^2 + (8 - (-4))^2 + (8 - 3)^2) = sqrt(0^2 + 12^2 + 5^2) = sqrt(144 + 25) = sqrt(169) = 13 " (km)". $
    
    Tên lửa được phóng tại thời điểm $t=0$ và đánh trúng mục tiêu tại thời điểm $t=2$. Do đó, thời gian bay của tên lửa là $T = 2$ giây.
    
    Tốc độ bay của tên lửa đánh chặn là:
    $ v_0 = (I M)/T = 13/2 = 6","5 " (km/s)". $
    
    #nhanxet[
      Bài toán đạn đạo trong không gian 3D được mô hình hóa thành phương trình tham số theo biến thời gian $t$. Quỹ đạo là một đường parabol trong không gian vì có một thành phần tọa độ (trục $O z$) là hàm bậc hai theo $t$, trong khi các thành phần khác ($O x, O y$) là hàm bậc nhất, đại diện cho chuyển động ném xiên phân tích theo $3$ chiều.
    ]
    
    #luuy[
      Cần phân biệt rõ tọa độ không gian $(x; y; z)$ và biến thời gian $t$. Vị trí cao nhất của quỹ đạo 3D chỉ phụ thuộc vào việc tìm GTLN của hàm $z(t)$. Khi đã có $t$, ta sẽ tìm được chính xác điểm rơi trong không gian 3 chiều.
    ]
  ]
)

#tln(
  [Trong không gian tọa độ $O x y z$ (đơn vị trên các trục là km), một trạm phòng thủ không gian được đặt tại vị trí $I(5; 16; 8)$. Hệ thống radar phát hiện một thiên thạch có quỹ đạo bay là một đường parabol. Phương trình chuyển động của thiên thạch theo thời gian $t$ (giây) được xác định bởi: 
  $ cases(
    x(t) = 3t,
    y(t) = 4t,
    z(t) = 16t - 2t^2
  ) quad (t >= 0). $
  Ngay tại thời điểm $t=0$, từ trạm $I$ phóng một tên lửa đánh chặn bay thẳng đều với tốc độ không đổi $v_0$ (km/s) để tiêu diệt thiên thạch. Giả sử tên lửa được lập trình để đánh trúng thiên thạch ngay tại vị trí cao nhất của quỹ đạo parabol. Hãy tính tốc độ $v_0$ của tên lửa đánh chặn (_viết kết quả dưới dạng số thập phân_).],
  [$6,25$],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    
    // Hệ trục tọa độ 3D mô phỏng
    line((0,0), (6,0), mark: (end: ">"), stroke: 0.5pt); content((6.2, 0), $y$)
    line((0,0), (0,6), mark: (end: ">"), stroke: 0.5pt); content((0, 6.2), $z$)
    line((0,0), (-2.5,-2), mark: (end: ">"), stroke: 0.5pt); content((-2.8, -2.2), $x$)
    content((0.3, -0.3), $O$)
    
    // Quỹ đạo thiên thạch (Parabol 3D mô phỏng)
    let pts = ()
    for i in range(0, 41) {
      let t_val = i * 0.2
      // Phép chiếu 2D mô phỏng để ra hình Parabol
      let scr_x = t_val * 0.9 - 0.5
      let scr_y = (16 * t_val - 2 * t_val * t_val) * 0.15 + t_val * 0.1
      pts.push((scr_x, scr_y))
    }
    line(..pts, stroke: (paint: gray, thickness: 1.2pt, dash: "dashed"))
    
    let M0 = pts.at(0)
    circle(M0, radius: 2pt, fill: black)
    content((-1.2, -0.5), $t=0$)
    
    // Điểm đánh chặn M_max (t = 4)
    let M = pts.at(20) // Điểm cao nhất
    circle(M, radius: 3pt, fill: orange)
    content((3.8, 5.6), $M_"max"$)
    
    // Trạm phòng thủ I
    let I_pt = (0.5, 2.5)
    circle(I_pt, radius: 2.5pt, fill: blue)
    content((-0.2, 2.7), $I$, fill: blue, weight: "bold")
    
    // Quỹ đạo tên lửa
    line(I_pt, M, mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))
    content((1.6, 4.3), $vect(v)_0$, fill: red)
    
    // Đường gióng độ cao
    line(M, (3.1, 0), stroke: (paint: gray, dash: "dotted"))
    line((3.1, 0), (0,0), stroke: (paint: gray, dash: "dotted"))
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Phân tích phương trình chuyển động của thiên thạch để tìm thời điểm $t$ nó đạt độ cao lớn nhất (tức là cực đại của hàm cao độ $z(t)$).
      - Thay $t$ tìm được vào hệ phương trình chuyển động để suy ra tọa độ điểm nổ $M$ trong không gian $O x y z$.
      - Tính khoảng cách từ trạm phóng $I$ đến điểm nổ $M$ (đây chính là quãng đường tên lửa phải bay).
      - Áp dụng công thức $v_0 = S / t$ để tính tốc độ của tên lửa.
    ]
    
    Từ phương trình chuyển động của thiên thạch, ta xét hàm số biểu diễn cao độ $z(t)$:
    $ z(t) = 16t - 2t^2 = -2(t^2 - 8t + 16) + 32 = -2(t-4)^2 + 32. $
    Vì $-2(t-4)^2 <= 0 quad forall t >= 0$, nên $z(t) <= 32$.
    Dấu "$=$" xảy ra khi $t - 4 = 0 <=> t = 4$.
    Vậy thiên thạch đạt vị trí cao nhất tại thời điểm $t = 4$ (giây).
    
    Thay $t = 4$ vào phương trình chuyển động của thiên thạch, ta nhận được tọa độ điểm đánh chặn $M$:
    $ cases(
      x = 3(4) = 12,
      y = 4(4) = 16,
      z = 32
    ) $
    Suy ra điểm đánh chặn là $M(12; 16; 32)$.
    
    Quãng đường tên lửa đánh chặn cần bay từ trạm $I(5; 16; 8)$ đến điểm $M(12; 16; 32)$ là độ dài đoạn thẳng $I M$:
    $ I M = sqrt((12 - 5)^2 + (16 - 16)^2 + (32 - 8)^2) = sqrt(7^2 + 0^2 + 24^2) = sqrt(49 + 576) = sqrt(625) = 25 " (km)". $
    
    Tên lửa được phóng tại thời điểm $t=0$ và đánh trúng mục tiêu tại thời điểm $t=4$. Do đó, thời gian bay của tên lửa là $T = 4$ giây.
    
    Tốc độ bay của tên lửa đánh chặn cần thiết lập là:
    $ v_0 = (I M)/T = 25/4 = 6","25 " (km/s)". $
    
    #nhanxet[
      Trong không gian 3 chiều, một vật thể chuyển động theo quỹ đạo parabol thường có nguyên nhân từ trường trọng lực tác dụng theo phương thẳng đứng (trục $O z$). Do đó, các thành phần $x(t)$ và $y(t)$ sẽ là chuyển động thẳng đều (hàm bậc nhất), trong khi thành phần $z(t)$ là chuyển động biến đổi đều (hàm bậc hai). Bài toán này kết hợp tư duy động học của Vật lý vào hình học tọa độ $O x y z$ một cách rất tự nhiên.
    ]
    #luuy[
      Cần phân biệt rõ không gian tọa độ 3 chiều $(x; y; z)$ và không gian tham số thời gian $t$. Vị trí cao nhất của quỹ đạo hoàn toàn được định đoạt bởi giá trị lớn nhất của trục cao độ $z(t)$. Khi đã chốt được thời điểm $t$, ta sẽ "bắt" được tọa độ không gian tại đúng thời điểm đó.
    ]
  ]
)

#ds(
  [Trong không gian với hệ trục tọa độ $O x y z$ mô phỏng một khu vực tác chiến (đơn vị: km), một mục tiêu giả lập được phóng từ bệ phóng tại gốc tọa độ $O(0;0;0)$ với véc-tơ vận tốc ban đầu $vect(v)_0 = (3; 4; 16)$ (km/s). Hệ thống mô phỏng thiết lập một trường trọng lực nhân tạo sinh ra gia tốc không đổi $vect(a) = (0; 0; -4)$ ($"km/s"^2$) tác dụng lên mục tiêu. Theo các định luật động học, véc-tơ vị trí của mục tiêu tại thời điểm $t$ giây ($t >= 0$) được xác định bởi phương trình $vect(r)(t) = vect(v)_0 t + 1/2 vect(a) t^2$. Xét tính đúng/sai của các phát biểu sau:
  
  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      
      // Hệ trục tọa độ nhất quán với phép chiếu
      line((0,0), (4.5, 0), mark: (end: ">"), stroke: 0.5pt); content((4.7, 0), $y$)
      line((0,0), (0, 7.5), mark: (end: ">"), stroke: 0.5pt); content((0, 7.8), $z$)
      line((0,0), (-1.8, -1.08), mark: (end: ">"), stroke: 0.5pt); content((-2.1, -1.2), $x$)
      content((0.2, 0.2), $O$)
      
      // Hàm chiếu tọa độ 3D (x,y,z) sang 2D màn hình
      let proj(x, y, z) = {
        let x_scr = (-0.5 * x + y) / 5
        let y_scr = (-0.3 * x + z) / 5
        return (x_scr, y_scr)
      }
      
      // Quỹ đạo thực (z > 0)
      let pts = ()
      let shadow_pts = ()
      for i in range(0, 41) {
        let t = i * 0.2
        let x = 3 * t
        let y = 4 * t
        let z = 16 * t - 2 * t * t
        pts.push(proj(x, y, z))
        shadow_pts.push(proj(x, y, 0))
      }
      
      // Vẽ bóng trên mặt Oxy
      line(..shadow_pts, stroke: (paint: gray, thickness: 1pt, dash: "dotted"))
      
      // Vẽ quỹ đạo 3D
      line(..pts, stroke: (paint: gray, thickness: 1.2pt, dash: "dashed"))
      
      let M0 = proj(0,0,0)
      circle(M0, radius: 2pt, fill: black)
      
      // Điểm đỉnh M_max (t=4 => x=12, y=16, z=32)
      let M_max = proj(12, 16, 32)
      let M_shadow = proj(12, 16, 0)
      
      line(M_shadow, M_max, stroke: (paint: gray, dash: "dotted"))
      circle(M_max, radius: 3pt, fill: orange)
      content((proj(12, 16, 32.5).at(0), proj(12, 16, 33).at(1)), $M_"max"$)
      
      // Trạm phòng thủ I(5, 16, 8)
      let I_pt = proj(5, 16, 8)
      circle(I_pt, radius: 2.5pt, fill: blue)
      content((I_pt.at(0) - 0.3, I_pt.at(1)), $I$, fill: blue, weight: "bold")
      
      // Quỹ đạo tên lửa
      line(M0, I_pt, stroke: (paint: rgb("0000ff33"), dash: "dotted")) // Nối O với I cho rõ phối cảnh
      line(I_pt, M_max, mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))
      content((2.35, 3.5), $vect(v)_"tên lửa"$, fill: red)
    })
  ]
  ],
  (
    [Phương trình chuyển động của mục tiêu là $x = 3t$, $y = 4t$, $z = 16t - 4t^2$.],
    True([Tốc độ ban đầu của mục tiêu lúc vừa rời bệ phóng là $sqrt(281)$ km/s.]),
    True([Độ cao lớn nhất mà mục tiêu đạt được là $32$ km.]),
    [Giả sử tại thời điểm $t=0$, một tên lửa đánh chặn được phóng từ trạm $I(5; 16; 8)$ bay thẳng đều để tiêu diệt mục tiêu tại điểm cao nhất của quỹ đạo. Tốc độ của tên lửa cần thiết lập là $8","5$ km/s.]
  ),
  loigiai: [
    #ppgiai[
      - Từ công thức véc-tơ vị trí $vect(r)(t) = vect(v)_0 t + 1/2 vect(a) t^2$, phân tích ra các thành phần tọa độ $x(t), y(t), z(t)$.
      - Tốc độ tại thời điểm $t$ là độ lớn của véc-tơ vận tốc $vect(v)(t) = vect(r)'(t)$. Tốc độ ban đầu tính tại $t=0$.
      - Độ cao lớn nhất tương ứng với giá trị lớn nhất của hàm số $z(t)$. Tìm $t$ tại đỉnh quỹ đạo rồi thay vào tìm tọa độ không gian.
      - Sử dụng công thức chuyển động thẳng đều $v = S / t$ cho tên lửa đánh chặn để tìm tốc độ, với $S$ là khoảng cách không gian 3D.
    ]
    
    - *Ý a) Sai.* Dựa vào hệ thức véc-tơ $vect(r)(t) = vect(v)_0 t + 1/2 vect(a) t^2$, tọa độ của mục tiêu tại thời điểm $t$ là:
      $ cases(
        x(t) = 3t + 1/2 dot 0 dot t^2 = 3t,
        y(t) = 4t + 1/2 dot 0 dot t^2 = 4t,
        z(t) = 16t + 1/2 dot (-4) dot t^2 = 16t - 2t^2
      ) $
      Do đó, phương trình chuyển động phải là $z = 16t - 2t^2$, không phải $16t - 4t^2$.
      
    - *Ý b) Đúng.* Véc-tơ vận tốc ban đầu là $vect(v)_0 = (3; 4; 16)$. Tốc độ ban đầu của mục tiêu là độ lớn của véc-tơ này:
      $ |vect(v)_0| = sqrt(3^2 + 4^2 + 16^2) = sqrt(9 + 16 + 256) = sqrt(281) " (km/s)". $
      
    - *Ý c) Đúng.* Hàm số biểu diễn độ cao của mục tiêu là $z(t) = 16t - 2t^2$. Ta có:
      $ z(t) = -2(t^2 - 8t + 16) + 32 = -2(t-4)^2 + 32 <= 32 quad forall t >= 0. $
      Dấu "=" xảy ra khi $t = 4$. Vậy độ cao lớn nhất mà mục tiêu đạt được là $32$ km (tại thời điểm $t = 4$ giây).
      
    - *Ý d) Sai.* Tại thời điểm $t = 4$, mục tiêu ở vị trí cao nhất $M$. Tọa độ của $M$ là:
      $ cases(
        x = 3(4) = 12,
        y = 4(4) = 16,
        z = 32
      ) quad => M(12; 16; 32). $
      Quãng đường tên lửa đánh chặn cần bay từ trạm $I(5; 16; 8)$ đến điểm nổ $M$ là:
      $ I M = sqrt((12 - 5)^2 + (16 - 16)^2 + (32 - 8)^2) = sqrt(7^2 + 0^2 + 24^2) = sqrt(49 + 576) = sqrt(625) = 25 " (km)". $
      Để đánh chặn thành công tại $M$, thời gian bay của tên lửa phải đúng bằng thời gian bay của mục tiêu từ lúc phóng đến $M$, tức là $t = 4$ giây. 
      Tốc độ tên lửa cần thiết lập là:
      $ v = (I M)/t = 25/4 = 6","25 " (km/s)". $
      Mệnh đề cho rằng tốc độ là $8","5$ km/s là sai.
      
    #nhanxet[
      Bài toán là một mô hình tích hợp xuất sắc giữa hình học giải tích $O x y z$ và động học vật lý (chuyển động ném xiên). Quỹ đạo của vật thể thực chất là một parabol nằm trong mặt phẳng thẳng đứng chứa trục $O z$ và đường thẳng $y = 4/3 x$ trên mặt đất $O x y$. Việc chuyển đổi từ lực (gia tốc) sang phương trình chuyển động giúp học sinh hiểu rõ bản chất của các hàm số tham số trong không gian 3 chiều.
    ]
  ]
)

#ds(
  [Trong không gian với hệ trục tọa độ $O x y z$ mô phỏng một khu vực phòng không (đơn vị: km), một trạm phòng thủ không gian được đặt tại vị trí $I(22; 31; 65)$. Hệ thống radar phát hiện một thiên thạch có quỹ đạo bay là một đường parabol. Phương trình chuyển động của thiên thạch theo thời gian $t$ (giây) được xác định bởi: 
  $ cases(
    x(t) = 2t,
    y(t) = 3t,
    z(t) = 20t - 2t^2
  ) quad (t >= 0). $
  Ngay tại thời điểm $t=0$, từ trạm $I$ phóng một tên lửa đánh chặn bay thẳng đều với tốc độ không đổi $v_0$ (km/s) để tiêu diệt thiên thạch. Giả sử tên lửa được lập trình để đánh trúng thiên thạch ngay tại vị trí cao nhất của quỹ đạo parabol. Xét tính đúng/sai của các phát biểu sau:
  
  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      
      // Hệ trục tọa độ 3D mô phỏng
      line((0,0), (6,0), mark: (end: ">"), stroke: 0.5pt); content((6.2, 0), $y$)
      line((0,0), (0,6), mark: (end: ">"), stroke: 0.5pt); content((0, 6.2), $z$)
      line((0,0), (-2.5,-2), mark: (end: ">"), stroke: 0.5pt); content((-2.8, -2.2), $x$)
      content((0.3, -0.3), $O$)
      
      // Quỹ đạo thiên thạch (Parabol 3D mô phỏng)
      let pts = ()
      for i in range(0, 51) {
        let t_val = i * 0.2
        let scr_x = t_val * 0.6 - 0.2
        let scr_y = (20 * t_val - 2 * t_val * t_val) * 0.12 + t_val * 0.05
        pts.push((scr_x, scr_y))
      }
      line(..pts, stroke: (paint: gray, thickness: 1.2pt, dash: "dashed"))
      
      let M0 = pts.at(0)
      circle(M0, radius: 2pt, fill: black)
      content((-0.8, -0.5), $t=0$)
      
      // Điểm đánh chặn M_max (t = 5)
      let M = pts.at(25) // Điểm cao nhất
      circle(M, radius: 3pt, fill: orange)
      content((M.at(0) + 0.8, M.at(1) + 0.2), $M_"max"$)
      
      // Trạm phòng thủ I
      let I_pt = (5.5, 4.5)
      circle(I_pt, radius: 2.5pt, fill: blue)
      content((I_pt.at(0) + 0.4, I_pt.at(1)), text(fill: blue, weight: "bold")[$I$])
      
      // Quỹ đạo tên lửa
      line(I_pt, M, mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))
      content(((I_pt.at(0) + M.at(0))/2 + 0.2, (I_pt.at(1) + M.at(1))/2 + 0.6), text(fill: red)[$vect(v)_0$])
      
      // Đường gióng độ cao
      line(M, (M.at(0), 0), stroke: (paint: gray, dash: "dotted"))
      line((M.at(0), 0), (0,0), stroke: (paint: gray, dash: "dotted"))
    })
  ]
  ],
  (
    [Phương trình chuyển động của thiên thạch theo trục $O z$ là $z = 20t - 4t^2$.],
    True([Tốc độ ban đầu của thiên thạch lúc vừa bị phát hiện ($t=0$) là $sqrt(413)$ km/s.]),
    True([Độ cao lớn nhất mà thiên thạch đạt được so với mặt phẳng $O x y$ là $50$ km.]),
    [Để tiêu diệt mục tiêu tại điểm cao nhất của quỹ đạo, tốc độ của tên lửa cần thiết lập là $6$ km/s.]
  ),
  loigiai: [
    #ppgiai[
      - Tốc độ ban đầu của vật thể là độ dài véc-tơ vận tốc tại $t=0$. Từ phương trình $vect(r)(t)$, đạo hàm để tìm $vect(v)(t)$.
      - Phân tích hàm độ cao $z(t)$ thành hằng đẳng thức để tìm thời điểm $t$ đạt giá trị lớn nhất (đỉnh parabol).
      - Thay $t$ vào hệ phương trình để xác định tọa độ không gian chính xác của điểm đánh chặn $M$.
      - Tính khoảng cách $I M$ bằng công thức khoảng cách 2 điểm trong không gian. Tốc độ tên lửa là $v_0 = (I M) / t$.
    ]
    
    - *Ý a) Sai.* Dựa vào giả thiết, phương trình chuyển động của thiên thạch theo trục $O z$ được xác định rõ là $z(t) = 20t - 2t^2$.
      
    - *Ý b) Đúng.* Véc-tơ vận tốc của thiên thạch tại thời điểm $t$ là đạo hàm của véc-tơ vị trí:
      $ vect(v)(t) = (x'(t); y'(t); z'(t)) = (2; 3; 20 - 4t). $
      Tại thời điểm $t=0$, vận tốc ban đầu là $vect(v)_0 = (2; 3; 20)$. 
      Tốc độ ban đầu là:
      $ |vect(v)_0| = sqrt(2^2 + 3^2 + 20^2) = sqrt(4 + 9 + 400) = sqrt(413) " (km/s)". $
      
    - *Ý c) Đúng.* Xét hàm số biểu diễn cao độ $z(t)$:
      $ z(t) = 20t - 2t^2 = -2(t^2 - 10t + 25) + 50 = -2(t-5)^2 + 50. $
      Vì $-2(t-5)^2 <= 0 quad forall t >= 0$, nên $z(t) <= 50$.
      Dấu "$=$" xảy ra khi $t - 5 = 0 <=> t = 5$.
      Vậy thiên thạch đạt vị trí cao nhất tại thời điểm $t = 5$ (giây) và độ cao lớn nhất là $50$ km.
      
    - *Ý d) Sai.* Thay $t = 5$ vào hệ phương trình chuyển động của thiên thạch, ta nhận được tọa độ điểm đánh chặn $M$:
      $ cases(
        x = 2(5) = 10,
        y = 3(5) = 15,
        z = 50
      ) quad => M(10; 15; 50). $
      Quãng đường tên lửa đánh chặn cần bay từ trạm $I(22; 31; 65)$ đến điểm $M(10; 15; 50)$ là độ dài đoạn thẳng $I M$:
      $ I M &= sqrt((10 - 22)^2 + (15 - 31)^2 + (50 - 65)^2) \ 
            &= sqrt((-12)^2 + (-16)^2 + (-15)^2) \
            &= sqrt(144 + 256 + 225) = sqrt(625) = 25 " (km)". $
      
      Tên lửa được phóng tại thời điểm $t=0$ và đánh trúng mục tiêu tại thời điểm $t=5$. Do đó, thời gian bay của tên lửa là $T = 5$ giây.
      Tốc độ bay của tên lửa đánh chặn cần thiết lập là:
      $ v_0 = (I M)/T = 25/5 = 5 " (km/s)". $
      Phát biểu cho rằng tốc độ bằng $6$ km/s là sai.
      
    #nhanxet[
      Bài toán đạn đạo trong không gian 3D được mô hình hóa thành phương trình tham số theo biến thời gian $t$. Các thành phần tọa độ đại diện cho chuyển động ném xiên phân tích theo $3$ chiều không gian, trong đó thành phần $z(t)$ biến đổi đều do ảnh hưởng của trọng lực.
    ]
    
    #luuy[
      Khi vẽ biểu đồ hoặc xử lý dữ liệu với `cetz`, màu của chữ bên trong lệnh `content` phải được đặt thông qua hàm `text(fill: color)[...]` một cách chính xác thay vì truyền tham số trực tiếp.
    ]
  ]
)

#ds(
  [Trong không gian với hệ trục tọa độ $O x y z$ mô phỏng một khu vực phòng không (đơn vị: km), một mục tiêu giả lập được phóng từ gốc tọa độ $O(0;0;0)$ với véc-tơ vận tốc ban đầu $vect(v)_0 = (2; 3; 20)$ (km/s). Mục tiêu chịu tác dụng của trường trọng lực nhân tạo sinh ra gia tốc không đổi $vect(a) = (0; 0; -4)$ ($"km/s"^2$). 
  Biết rằng véc-tơ vận tốc $vect(v)(t)$ là nguyên hàm của véc-tơ gia tốc $vect(a)$ và véc-tơ vị trí $vect(r)(t) = (x(t); y(t); z(t))$ là nguyên hàm của véc-tơ vận tốc $vect(v)(t)$ theo thời gian $t$ (giây, $t >= 0$). 
  Ngay tại thời điểm $t=0$, từ trạm phòng thủ $I(22; 31; 65)$ phóng một tên lửa đánh chặn bay thẳng đều với tốc độ không đổi $v_I$ (km/s) để tiêu diệt mục tiêu ngay tại vị trí cao nhất của quỹ đạo. Xét tính đúng/sai của các phát biểu sau:
  
  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      
      // Hệ trục tọa độ 3D mô phỏng
      line((0,0), (6,0), mark: (end: ">"), stroke: 0.5pt); content((6.2, 0), $y$)
      line((0,0), (0,6.5), mark: (end: ">"), stroke: 0.5pt); content((0, 6.7), $z$)
      line((0,0), (-2.5,-2), mark: (end: ">"), stroke: 0.5pt); content((-2.8, -2.2), $x$)
      content((0.3, -0.3), $O$)
      
      // Quỹ đạo thiên thạch (Parabol 3D mô phỏng)
      let pts = ()
      for i in range(0, 51) {
        let t_val = i * 0.2
        let scr_x = t_val * 0.6 - 0.2
        let scr_y = (20 * t_val - 2 * t_val * t_val) * 0.12 + t_val * 0.05
        pts.push((scr_x, scr_y))
      }
      line(..pts, stroke: (paint: gray, thickness: 1.2pt, dash: "dashed"))
      
      let M0 = pts.at(0)
      circle(M0, radius: 2pt, fill: black)
      content((-0.8, -0.5), $t=0$)
      
      // Điểm đánh chặn M_max (t = 5)
      let M = pts.at(25) // Điểm cao nhất
      circle(M, radius: 3pt, fill: orange)
      content((M.at(0) + 0.8, M.at(1) + 0.2), $M_"max"$)
      
      // Trạm phòng thủ I
      let I_pt = (5.5, 4.5)
      circle(I_pt, radius: 2.5pt, fill: blue)
      content((I_pt.at(0) + 0.4, I_pt.at(1)), text(fill: blue, weight: "bold")[$I$])
      
      // Quỹ đạo tên lửa
      line(I_pt, M, mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))
      content(((I_pt.at(0) + M.at(0))/2 + 0.2, (I_pt.at(1) + M.at(1))/2 + 0.6), text(fill: red)[$vect(v)_I$])
      
      // Đường gióng độ cao
      line(M, (M.at(0), 0), stroke: (paint: gray, dash: "dotted"))
      line((M.at(0), 0), (0,0), stroke: (paint: gray, dash: "dotted"))
    })
  ]
  ],
  (
    [Phương trình chuyển động của mục tiêu là $x = 2t$, $y = 3t$, $z = 20t - 4t^2$.],
    True([Tốc độ của mục tiêu tại thời điểm $t = 2$ giây là $sqrt(157)$ km/s.]),
    True([Tọa độ điểm cao nhất mà mục tiêu đạt được trong không gian là $M(10; 15; 50)$.]),
    [Để đánh chặn thành công, tốc độ của tên lửa phòng thủ cần thiết lập là $6$ km/s.]
  ),
  loigiai: [
    #ppgiai[
      - Từ gia tốc $vect(a)$, lấy nguyên hàm để tìm phương trình vận tốc $vect(v)(t) = integral vect(a) dif t + vect(C)_1$. Xác định hằng số nhờ $vect(v)(0) = vect(v)_0$.
      - Lấy nguyên hàm của vận tốc $vect(v)(t)$ để được phương trình chuyển động $vect(r)(t) = integral vect(v)(t) dif t + vect(C)_2$. Xác định hằng số nhờ $vect(r)(0) = O(0;0;0)$.
      - Phân tích hàm cao độ $z(t)$ để tìm thời điểm $t$ đạt giá trị lớn nhất (đỉnh quỹ đạo).
      - Thay $t$ vào $vect(r)(t)$ để tìm tọa độ điểm nổ $M$.
      - Tính khoảng cách không gian $I M$ và áp dụng $v_I = (I M) / t$ để tìm tốc độ tên lửa.
    ]
    
    - *Ý a) Sai.* Ta có véc-tơ gia tốc $vect(a) = (0; 0; -4)$.
      Vận tốc của mục tiêu là nguyên hàm của gia tốc:
      $ vect(v)(t) = (C_1; C_2; -4t + C_3). $
      Tại $t=0$, $vect(v)(0) = vect(v)_0 = (2; 3; 20) => vect(v)(t) = (2; 3; 20 - 4t)$.
      Véc-tơ vị trí (phương trình chuyển động) là nguyên hàm của vận tốc:
      $ vect(r)(t) = (2t + C_4; 3t + C_5; 20t - 2t^2 + C_6). $
      Tại $t=0$, vật xuất phát từ gốc $O(0;0;0)$ nên $C_4 = C_5 = C_6 = 0$.
      Vậy phương trình chuyển động của mục tiêu là:
      $ cases(
        x(t) = 2t,
        y(t) = 3t,
        z(t) = 20t - 2t^2
      ) $
      Phát biểu cho rằng $z = 20t - 4t^2$ là sai.
      
    - *Ý b) Đúng.* Tại thời điểm $t = 2$ giây, véc-tơ vận tốc của mục tiêu là:
      $ vect(v)(2) = (2; 3; 20 - 4(2)) = (2; 3; 12). $
      Tốc độ của mục tiêu tại $t=2$ là:
      $ |vect(v)(2)| = sqrt(2^2 + 3^2 + 12^2) = sqrt(4 + 9 + 144) = sqrt(157) " (km/s)". $
      
    - *Ý c) Đúng.* Mục tiêu đạt độ cao lớn nhất khi thành phần vận tốc theo trục $O z$ bằng $0$:
      $ v_z(t) = 20 - 4t = 0 <=> t = 5 " (giây)". $
      Thay $t = 5$ vào phương trình chuyển động, ta nhận được tọa độ điểm cao nhất $M$:
      $ cases(
        x = 2(5) = 10,
        y = 3(5) = 15,
        z = 20(5) - 2(5^2) = 100 - 50 = 50
      ) quad => M(10; 15; 50). $
      
    - *Ý d) Sai.* Quãng đường tên lửa đánh chặn cần bay từ trạm $I(22; 31; 65)$ đến điểm $M(10; 15; 50)$ là độ dài đoạn thẳng $I M$:
      $ I M &= sqrt((10 - 22)^2 + (15 - 31)^2 + (50 - 65)^2) \ 
            &= sqrt((-12)^2 + (-16)^2 + (-15)^2) \
            &= sqrt(144 + 256 + 225) = sqrt(625) = 25 " (km)". $
      
      Tên lửa được phóng cùng lúc $t=0$ và phải gặp mục tiêu tại $M$ (khi $t=5$). Do đó, thời gian bay của tên lửa là $T = 5$ giây.
      Tốc độ bay của tên lửa đánh chặn cần thiết lập là:
      $ v_I = (I M)/T = 25/5 = 5 " (km/s)". $
      Phát biểu cho rằng tốc độ bằng $6$ km/s là sai.
      
    #nhanxet[
      Bài toán đã tái hiện lại toàn bộ quá trình thiết lập phương trình động học: từ Gia tốc $->$ Vận tốc $->$ Quãng đường (Tọa độ vị trí) bằng công cụ Tích phân (Nguyên hàm). Điều này giúp học sinh thấy được bản chất hình học giải tích thực ra bắt nguồn trực tiếp từ các quy luật chuyển động trong Vật lý.
    ]
  ]
)

#ds(
  [Trong một buổi diễn tập cứu hộ trên biển, hệ thống tọa độ $O x y z$ được thiết lập với mặt phẳng $(O x y)$ là mặt nước biển, trục $O z$ hướng thẳng đứng lên trời (đơn vị đo trên các trục là mét, thời gian tính bằng giây). Một quả pháo sáng cầu cứu được bắn lên từ gốc tọa độ $O(0;0;0)$ với véc-tơ vận tốc ban đầu $vect(v)_0 = (15; 20; 100)$. Trong quá trình bay, pháo sáng chịu tác dụng của gia tốc trọng trường $vect(g) = (0; 0; -10)$ ($"m/s"^2$). 
  Biết rằng véc-tơ vận tốc $vect(v)(t)$ là một nguyên hàm của gia tốc $vect(g)$ và véc-tơ vị trí $vect(r)(t) = (x(t); y(t); z(t))$ là một nguyên hàm của vận tốc $vect(v)(t)$. Ngay khi pháo sáng được bắn lên ($t=0$), một drone cứu hộ xuất phát từ trạm điều khiển trên tàu tuần tra ở vị trí $I(180; 160; 380)$ bay thẳng đều để đón bắt pháo sáng ngay tại điểm cao nhất của quỹ đạo. Xét tính đúng/sai của các phát biểu sau:
  
  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      
      // Hệ trục tọa độ 3D mô phỏng
      line((0,0), (6.5,0), mark: (end: ">"), stroke: 0.5pt); content((6.7, 0), $y$)
      line((0,0), (0,6), mark: (end: ">"), stroke: 0.5pt); content((0, 6.2), $z$)
      line((0,0), (-2,-1.5), mark: (end: ">"), stroke: 0.5pt); content((-2.3, -1.7), $x$)
      content((0.3, -0.3), $O$)
      
      // Quỹ đạo pháo sáng
      let pts = ()
      for i in range(0, 51) {
        let t = i * 0.4
        let scr_x = t * 0.25 - 0.5
        let scr_y = (100 * t - 5 * t * t) * 0.01 + t * 0.02
        pts.push((scr_x, scr_y))
      }
      line(..pts, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      
      let M0 = pts.at(0)
      circle(M0, radius: 2pt, fill: black)
      content((-0.8, -0.5), $t=0$)
      
      // Điểm đánh chặn M_max
      let M = pts.at(25) // Đỉnh parabol
      circle(M, radius: 3pt, fill: orange)
      content((M.at(0), M.at(1) + 0.4), $M_"max"$)
      
      // Trạm tuần tra I
      let I_pt = (5.0, 3.5)
      circle(I_pt, radius: 2.5pt, fill: blue)
      content((I_pt.at(0) + 0.4, I_pt.at(1)), text(fill: blue, weight: "bold")[$I$])
      
      // Quỹ đạo Drone
      line(I_pt, M, mark: (end: ">"), stroke: (paint: blue, thickness: 1.5pt))
      content(((I_pt.at(0) + M.at(0))/2 + 0.1, (I_pt.at(1) + M.at(1))/2 + 0.4), text(fill: blue)[$vect(v)_D$])
      
      // Đường gióng hình chiếu
      line(M, (M.at(0), 0), stroke: (paint: gray, dash: "dotted"))
      line((M.at(0), 0), (0,0), stroke: (paint: gray, dash: "dotted"))
    })
  ]
  ],
  (
    [Phương trình chuyển động của pháo sáng theo trục $O z$ là $z(t) = 100t - 10t^2$.],
    True([Tốc độ ban đầu của pháo sáng lúc vừa rời ống phóng là $25 sqrt(17)$ m/s.]),
    True([Độ cao lớn nhất mà pháo sáng đạt được so với mặt biển là $500$ m.]),
    [Để đón bắt thành công, tốc độ bay của drone cần thiết lập là $15$ m/s.]
  ),
  loigiai: [
    #ppgiai[
      - Từ gia tốc $vect(g)$, lấy nguyên hàm để tìm phương trình vận tốc $vect(v)(t) = integral vect(g) dif t + vect(C)_1$. Xác định hằng số nhờ điều kiện ban đầu $vect(v)(0) = vect(v)_0$.
      - Lấy nguyên hàm của vận tốc $vect(v)(t)$ để được véc-tơ vị trí $vect(r)(t) = integral vect(v)(t) dif t + vect(C)_2$. Xác định hằng số nhờ vị trí xuất phát $vect(r)(0) = O(0;0;0)$.
      - Phân tích hàm cao độ $z(t)$ để tìm thời gian $t$ đạt đỉnh.
      - Xác định tọa độ điểm cao nhất $M$ trong không gian.
      - Tính khoảng cách $I M$ và áp dụng $v_D = (I M) / t$ để tìm tốc độ của drone.
    ]
    
    - *Ý a) Sai.* Ta có véc-tơ gia tốc $vect(g) = (0; 0; -10)$.
      Vận tốc của pháo sáng là nguyên hàm của gia tốc:
      $ vect(v)(t) = integral (0; 0; -10) dif t = (C_1; C_2; -10t + C_3). $
      Tại thời điểm $t=0$, $vect(v)(0) = vect(v)_0 = (15; 20; 100)$, suy ra $C_1 = 15$, $C_2 = 20$, $C_3 = 100$.
      $ => vect(v)(t) = (15; 20; 100 - 10t). $
      Phương trình chuyển động (véc-tơ vị trí) là nguyên hàm của vận tốc:
      $ vect(r)(t) = integral (15; 20; 100 - 10t) dif t = (15t + C_4; 20t + C_5; 100t - 5t^2 + C_6). $
      Vì pháo sáng xuất phát từ gốc $O(0;0;0)$ tại $t=0$ nên $C_4 = C_5 = C_6 = 0$.
      Phương trình chuyển động là:
      $ cases(
        x(t) = 15t,
        y(t) = 20t,
        z(t) = 100t - 5t^2
      ) $
      Do đó, phương trình cao độ là $z(t) = 100t - 5t^2$, không phải $100t - 10t^2$.
      
    - *Ý b) Đúng.* Tốc độ ban đầu của pháo sáng là độ dài của véc-tơ $vect(v)_0$:
      $ |vect(v)_0| = sqrt(15^2 + 20^2 + 100^2) = sqrt(225 + 400 + 10000) = sqrt(10625) = 25 sqrt(17) " (m/s)". $
      
    - *Ý c) Đúng.* Hàm số biểu diễn độ cao là $z(t) = 100t - 5t^2$. Ta có:
      $ z(t) = -5(t^2 - 20t + 100) + 500 = -5(t-10)^2 + 500 <= 500 quad forall t >= 0. $
      Dấu "=" xảy ra khi $t = 10$. Vậy độ cao lớn nhất pháo sáng đạt được là $500$ m (tại thời điểm $t = 10$ giây).
      
    - *Ý d) Sai.* Tại thời điểm $t = 10$, pháo sáng ở vị trí cao nhất $M$. Tọa độ của $M$ là:
      $ cases(
        x = 15(10) = 150,
        y = 20(10) = 200,
        z = 500
      ) quad => M(150; 200; 500). $
      Quãng đường drone cần bay từ trạm $I(180; 160; 380)$ đến điểm $M$ là:
      $ I M &= sqrt((150 - 180)^2 + (200 - 160)^2 + (500 - 380)^2) \ 
            &= sqrt((-30)^2 + 40^2 + 120^2) \
            &= sqrt(900 + 1600 + 14400) = sqrt(16900) = 130 " (m)". $
            
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let I = (0, 0)
          let M = (3, 2.4)
          let H = (3, 0)
          line(I, H, stroke: (dash: "dashed", paint: gray))
          line(H, M, stroke: (dash: "dashed", paint: gray))
          line(I, M, stroke: (paint: blue, thickness: 1.2pt))
          content(I, $I$, anchor: "north-east")
          content(M, $M$, anchor: "south")
          content(H, $H$, anchor: "north-west")
          content((1.5, -0.3), $d(I,H) = 50$) 
          content((3.6, 1.2), $120$)
          content((1.2, 1.5), $130$, fill: blue, weight: "bold")
          // mark right angle
          line((2.8,0), (2.8, 0.2), (3, 0.2))
        })
      ]
      
      Drone xuất phát tại $t=0$ và đón pháo sáng tại $M$ lúc $t=10$ giây. Thời gian bay là $T = 10$ giây.
      Tốc độ bay của drone cần thiết lập là:
      $ v_D = (I M)/T = 130/10 = 13 " (m/s)". $
      Phát biểu cho rằng tốc độ bằng $15$ m/s là sai.
      
    #nhanxet[
      Bài toán đã tái hiện lại toàn bộ quá trình thiết lập phương trình động học: từ Gia tốc $->$ Vận tốc $->$ Quãng đường (Tọa độ vị trí) bằng công cụ Tích phân (Nguyên hàm). Điều này giúp học sinh thấy được bản chất hình học giải tích thực ra bắt nguồn trực tiếp từ các quy luật chuyển động trong Vật lý.
    ]
    
    #luuy[
      Cần cẩn thận khi lấy nguyên hàm của vận tốc. Nếu nhầm công thức tích phân $integral t dif t = t^2$ thành $1/2 t^2$ nhưng lại quên mất hệ số, ta rất dễ ra sai phương trình $z(t) = 100t - 10t^2$ như bẫy ở ý A.
    ]
    
    #meo[
      Ở bước tính khoảng cách, ta có thể nhẩm nhanh độ dài không gian bằng bộ số Pytago mở rộng: 
      $sqrt(30^2 + 40^2 + 120^2) = 10 sqrt(3^2 + 4^2 + 12^2) = 10 sqrt(5^2 + 12^2) = 10 times 13 = 130$.
    ]
  ]
)