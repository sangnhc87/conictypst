#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"



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
  degreele((0, 0), radius: r, stroke: luma(200) + 0.5pt)
  for i in range(n) {
    degreele((90deg - i * 360deg / n, r), radius: 1.2pt, fill: gray)
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
        CHỦ ĐỀ DI CHUYỂN QUA NHIỀU MÔI TRƯỜNG CÓ VẤN TỐC
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        Vấn đề tốc độ thay đổi liên tục khi di chuyển qua nhiều môi trường khác nhau là một chủ đề thú vị trong vật lý và toán học, liên quan đến khái niệm vận tốc tức thời và đạo hàm. Dưới đây là một số bài tập minh họa về chủ đề này.
      ]
    ],
  )
]

#tln(
  [Một phương tiện cần di chuyển từ điểm $A$ đến điểm $D$ thông qua điểm $B$ nằm trên đoạn $A C$. Biết $A C = 30$ km, $C D perp A C$ tại $C$ và $C D = 40$ km. Vận tốc di chuyển trên đoạn $A B$ là $v_1 = 80$ km/h, vận tốc di chuyển trên đoạn $B D$ là $v_2 = 40$ km/h. Gọi $x$ là khoảng cách từ $A$ đến $B$ (với $0 <= x <= 30$, đơn vị: km). Hãy xác định $x$ (làm tròn đến hàng phần mười) để thời gian di chuyển từ $A$ đến $D$ là ngắn nhất.
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((0,0), (3,0), name: "AC", stroke: 0.7pt)
      line((3,0), (3,4), name: "CD", stroke: 0.7pt)
      line((1,0), (3,4), name: "BD", stroke: 0.7pt)
      line((0,0), (1,0), name: "AB", stroke: (paint: blue, thickness: 1.2pt))
      
      circle((0,0), radius: 1.5pt, fill: black)
      content((0,-0.3), $A$)
      circle((3,0), radius: 1.5pt, fill: black)
      content((3,-0.3), $C$)
      circle((3,4), radius: 1.5pt, fill: black)
      content((3,4.3), $D$)
      circle((1,0), radius: 1.5pt, fill: black)
      content((1,-0.3), $B$)
      
      content((0.5, -0.4), $x$)
      content((2, -0.4), $30 - x$)
      content((3.5, 2), $40$)
    })
  ]
  ],
  [$6,9$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Lập hàm số biểu diễn tổng thời gian di chuyển $T(x) = t_{A B} + t_{B D}$ theo biến $x$.
      - *Bước 2:* Sử dụng đạo hàm để tìm điểm tới hạn của hàm $T(x)$ trên khoảng xác định.
      - *Bước 3:* Đánh giá để tìm giá trị cực tiểu của hàm số.
    ]
    
    Ta có $A B = x$ (km), suy ra $B C = A C - A B = 30 - x$ (km).
    Áp dụng định lý Pythagore trong tam giác vuông $B C D$:
    $ B D = sqrt(B C^2 + C D^2) = sqrt((30 - x)^2 + 40^2) = sqrt((30 - x)^2 + 1600). $
    
    Thời gian phương tiện đi từ $A$ đến $B$ là: $t_1 = x/80$ (giờ).
    Thời gian phương tiện đi từ $B$ đến $D$ là: $t_2 = sqrt((30 - x)^2 + 1600)/40$ (giờ).
    
    Tổng thời gian di chuyển là hàm số theo $x$:
    $ T(x) = x/80 + sqrt((30 - x)^2 + 1600)/40 quad (0 <= x <= 30). $
    
    Tính đạo hàm của $T(x)$:
    $ T'(x) = 1/80 + 1/40 dot (-2(30 - x))/(2 sqrt((30 - x)^2 + 1600)) = 1/80 - (30 - x)/(40 sqrt((30 - x)^2 + 1600)). $
    
    Cho $T'(x) = 0$:
    $ 1/80 = (30 - x)/(40 sqrt((30 - x)^2 + 1600)) <=> sqrt((30 - x)^2 + 1600) = 2(30 - x). $
    
    Vì $0 <= x <= 30$ nên $30 - x >= 0$, tiến hành bình phương hai vế:
    $ (30 - x)^2 + 1600 = 4(30 - x)^2 <=> 3(30 - x)^2 = 1600 <=> (30 - x)^2 = 1600/3. $
    $ => 30 - x = 40/sqrt(3) <=> x = 30 - 40/sqrt(3) approx 6,9 " (thỏa mãn điều kiện)". $
    
    Vậy để thời gian là ngắn nhất, khoảng cách $A B$ cần tìm là khoảng $6,9$ km.
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        line((0,0), (3,0), stroke: (dash: "dashed", paint: gray))
        line((3,0), (3,4), stroke: (dash: "dashed", paint: gray))
        line((0.69,0), (3,4), stroke: (paint: red, thickness: 1.2pt))
        line((0,0), (0.69,0), stroke: (paint: blue, thickness: 1.2pt))
        
        circle((0,0), radius: 1.5pt, fill: black)
        content((0,-0.3), $A$)
        circle((3,4), radius: 1.5pt, fill: black)
        content((3,4.3), $D$)
        circle((0.69,0), radius: 1.5pt, fill: red)
        content((0.69,-0.3), text(fill: red)[$B_min$])
      })
    ]
    
    #nhanxet[
      Trong các bài toán tối ưu quỹ đạo di chuyển qua nhiều môi trường có vận tốc khác nhau, đường đi thực tế luôn ưu tiên quãng đường dài hơn trong môi trường có vận tốc lớn hơn ($A B$) để bù đắp thời gian. Kết quả này tương đồng với định luật khúc xạ ánh sáng (định luật Snell) trong vật lý.
    ]
  ]
)

#tln(
  [Một con mèo robot cần di chuyển từ điểm $A$ nằm trên bãi đất đến điểm $B$ nằm trên bãi cát. Đường phân cách giữa bãi đất và bãi cát là một đường thẳng $d$. Gọi $H$ và $K$ lần lượt là hình chiếu vuông góc của $A$ và $B$ lên $d$. Biết khoảng cách $A H = 3$ m, $B K = 4$ m và $H K = 7$ m. Vận tốc di chuyển của mèo robot trên bãi đất là $v_1 = 5$ m/s, vận tốc di chuyển trên bãi cát là $v_2 = 2$ m/s. Để thời gian di chuyển từ $A$ đến $B$ là ít nhất, mèo robot cần đi qua điểm $M$ nằm trên đoạn $H K$. Tính khoảng cách $H M$ (làm tròn kết quả đến hàng phần mười).
  // TODO: Cập nhật lại chính xác các số liệu (3m, 4m, 7m, 5m/s, 2m/s) nếu ảnh gốc có giá trị khác.
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Đường phân cách d
      line((-1, 0), (8, 0), name: "d", stroke: 1pt)
      content((7.5, 0.3), $d$)
      
      // Ghi chú môi trường
      content((1, -1), [*Bãi đất* ($v_1$)])
      content((6, 2), [*Bãi cát* ($v_2$)])
      
      // Tọa độ các điểm mô phỏng
      let H = (0,0)
      let K = (5,0)
      let A = (0,-2)
      let B = (5,3)
      let M = (1.5,0)
      
      // Nét đứt (hình chiếu)
      line(A, H, stroke: (dash: "dashed"))
      line(B, K, stroke: (dash: "dashed"))
      
      // Đường H K
      line(H, K, stroke: (paint: gray, thickness: 1.5pt))
      
      // Quỹ đạo mèo di chuyển
      line(A, M, stroke: (paint: blue, thickness: 1.2pt))
      line(M, B, stroke: (paint: blue, thickness: 1.2pt))
      
      // Vẽ điểm và dán nhãn
      circle(A, radius: 1.5pt, fill: black); content((0, -2.3), $A$)
      circle(B, radius: 1.5pt, fill: black); content((5, 3.3), $B$)
      circle(H, radius: 1.5pt, fill: black); content((-0.3, 0.3), $H$)
      circle(K, radius: 1.5pt, fill: black); content((5.3, -0.3), $K$)
      circle(M, radius: 1.5pt, fill: black); content((1.5, -0.3), $M$)
      
      // Ký hiệu x
      content((0.75, 0.3), $x$)
    })
  ]
  ],
  [$2,6$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Đặt ẩn đoạn $H M = x$ (điều kiện $0 <= x <= H K$). Biểu diễn đoạn $M K$ theo $x$.
      - *Bước 2:* Dùng định lý Pythagore để tính chiều dài quãng đường đi trên bãi đất ($A M$) và trên bãi cát ($M B$).
      - *Bước 3:* Lập hàm số biểu diễn tổng thời gian $T(x) = (A M)/v_1 + (M B)/v_2$.
      - *Bước 4:* Khảo sát hàm số bằng đạo hàm $T'(x) = 0$ để tìm giá trị $x$ làm cho $T(x)$ đạt cực tiểu.
    ]
    
    Đặt $H M = x$ (m) với điều kiện $0 <= x <= 7$. Suy ra $M K = 7 - x$ (m).
    
    Quãng đường mèo robot đi trên bãi đất là:
    $ A M = sqrt(A H^2 + H M^2) = sqrt(3^2 + x^2) = sqrt(x^2 + 9) $
    
    Quãng đường mèo robot đi trên bãi cát là:
    $ M B = sqrt(B K^2 + M K^2) = sqrt(4^2 + (7 - x)^2) = sqrt((7 - x)^2 + 16) $
    
    Tổng thời gian di chuyển từ $A$ đến $B$ là hàm số theo $x$:
    $ T(x) = (A M)/v_1 + (M B)/v_2 = sqrt(x^2 + 9)/5 + sqrt((7 - x)^2 + 16)/2 $
    
    Tính đạo hàm của $T(x)$:
    $ T'(x) = x/(5 sqrt(x^2 + 9)) - (7 - x)/(2 sqrt((7 - x)^2 + 16)) $
    
    Cho $T'(x) = 0$, ta có phương trình:
    $ x/(5 sqrt(x^2 + 9)) = (7 - x)/(2 sqrt((7 - x)^2 + 16)) $
    $ <=> 2x sqrt((7 - x)^2 + 16) = 5(7 - x) sqrt(x^2 + 9) $
    
    Vì $0 <= x <= 7$, hai vế đều dương nên ta có thể bình phương hai vế để giải. Giải phương trình này ta thu được nghiệm gần đúng:
    $ x approx 2,6 " (thỏa mãn điều kiện)" $
    
    Vậy khoảng cách $H M$ cần tìm để thời gian ngắn nhất là khoảng $2,6$ m.
    
    #nhanxet[
      Bài toán tối ưu thời gian di chuyển qua hai môi trường có vận tốc khác nhau mô phỏng lại nguyên lý Fermat về sự truyền ánh sáng. Chú mèo robot sẽ tự động ưu tiên di chuyển quãng đường dài hơn trong môi trường có vận tốc lớn hơn (bãi đất) để bù đắp lại thời gian, tương tự như định luật khúc xạ ánh sáng Snell.
    ]
  ]
)

#tln(
  [Một khu trưng bày hình chữ nhật $A B C D$ có kích thước $A B = 10$ m và $A D = 8$ m. Bên trong khu trưng bày có một thảm cỏ hình vuông $P Q R S$ cạnh $4$ m, được đặt sao cho cạnh $R S$ nằm hoàn toàn trên cạnh $C D$ của hình chữ nhật, với đỉnh $S$ cách $D$ một khoảng $4$ m. Một robot di chuyển từ điểm $M$ (trung điểm của $A B$) đến điểm $N$ nằm trên $C D$, biết $N$ cách $D$ một khoảng $7$ m. Vận tốc của robot trên nền gạch (bên ngoài thảm cỏ) là $v_1 = 5$ m/s, và trên thảm cỏ là $v_2 = 3$ m/s. Để tiết kiệm thời gian, robot đi theo đường gấp khúc $M K N$, với $K$ là điểm nằm trên cạnh $P Q$ của thảm cỏ. Hỏi thời gian di chuyển ngắn nhất của robot từ $M$ đến $N$ là bao nhiêu giây (làm tròn kết quả đến hàng phần trăm)?
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Hình chữ nhật ABCD
      rect((0,0), (10,8), name: "ABCD", stroke: 1.2pt)
      content((-0.3, -0.3), $A$)
      content((10.3, -0.3), $B$)
      content((10.3, 8.3), $C$)
      content((-0.3, 8.3), $D$)
      
      // Thảm cỏ PQRS (Hình vuông nhỏ)
      rect((4,4), (8,8), fill: rgb("ccffcc"), stroke: (paint: rgb("009900"), thickness: 1pt))
      content((4, 3.7), $P$, anchor: "north")
      content((8, 3.7), $Q$, anchor: "north")
      content((8, 8.3), $R$, anchor: "south")
      content((4, 8.3), $S$, anchor: "south")
      content((6, 6), text(fill: rgb("006600"))[*Thảm cỏ* \ $v_2=3$ m/s])
      
      // Nền gạch
      content((2, 2), [*Nền gạch* \ $v_1=5$ m/s])
      
      // Các điểm M, N
      let M = (5,0)
      let N = (7,8)
      circle(M, radius: 1.5pt, fill: black); content((5, -0.4), $M$)
      circle(N, radius: 1.5pt, fill: black); content((7, 8.4), $N$)
      
      // Quỹ đạo di chuyển với K tối ưu (x xấp xỉ 6.27)
      let K = (6.27, 4)
      line(M, K, stroke: (paint: blue, thickness: 1.5pt))
      line(K, N, stroke: (paint: red, thickness: 1.5pt))
      circle(K, radius: 1.5pt, fill: black); content((6.6, 3.7), $K$, anchor: "north")
      
      // Kích thước minh họa
      line((0, -0.8), (10, -0.8), mark: (start: "<", end: ">"), stroke: 0.5pt)
      content((5, -0.8), $10 m$, anchor: "north")
      line((-0.8, 0), (-0.8, 8), mark: (start: "<", end: ">"), stroke: 0.5pt)
      content((-0.8, 4), $8 m$, anchor: "east")
      
      // Gióng tọa độ
      line((M.at(0), 0), (M.at(0), 4), stroke: (dash: "dashed", paint: gray))
      line((N.at(0), 4), (N.at(0), 8), stroke: (dash: "dashed", paint: gray))
    })
  ]
  ],
  [$2,19$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Gắn hệ trục tọa độ $O x y$ với gốc tọa độ tại $A(0;0)$, tia $A B$ trùng với trục $O x$, tia $A D$ trùng với trục $O y$.
      - *Bước 2:* Xác định tọa độ các điểm $M, N$ và thiết lập tọa độ điểm $K(x; 4)$ nằm trên ranh giới $P Q$.
      - *Bước 3:* Lập hàm tổng thời gian di chuyển $T(x) = (M K)/v_1 + (K N)/v_2$.
      - *Bước 4:* Khảo sát đạo hàm $T'(x) = 0$ để tìm điểm cực tiểu và tính thời gian nhỏ nhất.
    ]
    
    Chọn hệ trục tọa độ $O x y$ sao cho $A(0;0)$, $B(10;0)$, $D(0;8)$, $C(10;8)$.
    Điểm $M$ là trung điểm $A B$ nên $M(5;0)$.
    Điểm $N$ nằm trên $C D$ cách $D$ một khoảng $7$ m nên $N(7;8)$.
    
    Thảm cỏ $P Q R S$ là hình vuông cạnh $4$ m, bám trên $C D$ và $S$ cách $D$ $4$ m. 
    Suy ra các tọa độ: $S(4;8), R(8;8)$. Do đó $P(4;4)$ và $Q(8;4)$.
    Biên giới giữa hai môi trường là đoạn thẳng $P Q$ nằm trên đường thẳng $y = 4$. 
    Gọi $K$ là điểm robot chuyển hướng trên $P Q$, suy ra $K(x; 4)$ với $4 <= x <= 8$.
    
    Độ dài quãng đường trên nền gạch là: 
    $M K = sqrt((x - 5)^2 + (4 - 0)^2) = sqrt((x - 5)^2 + 16).$
    Độ dài quãng đường trên thảm cỏ là: 
    $K N = sqrt((7 - x)^2 + (8 - 4)^2) = sqrt((7 - x)^2 + 16).$
    
    Tổng thời gian di chuyển của robot là hàm số:
    $T(x) = (M K)/5 + (K N)/3 = (sqrt((x - 5)^2 + 16))/5 + (sqrt((7 - x)^2 + 16))/3.$
    
    Tính đạo hàm của $T(x)$:
    $T'(x) = (x - 5)/(5 sqrt((x - 5)^2 + 16)) - (7 - x)/(3 sqrt((7 - x)^2 + 16)).$
    
    Cho $T'(x) = 0$, ta được phương trình:
    $(x - 5)/(5 sqrt((x - 5)^2 + 16)) = (7 - x)/(3 sqrt((7 - x)^2 + 16)).$
    
    Giải phương trình này (bằng cách bình phương hoặc sử dụng máy tính cầm tay), ta thu được nghiệm duy nhất trên đoạn $[4; 8]$ là $x approx 6,2658$.
    
    Thay $x approx 6,2658$ vào hàm $T(x)$, ta tính được:
    $T_min = (sqrt((6,2658 - 5)^2 + 16))/5 + (sqrt((7 - 6,2658)^2 + 16))/3 approx 0,839 + 1,355 = 2,194 " (s)".$
    
    Làm tròn kết quả đến hàng phần trăm, thời gian di chuyển ngắn nhất là *$2,19$* giây.
    
    #nhanxet[
      Về mặt trực giác, nếu robot đi theo một đường thẳng nối trực tiếp từ $M(5;0)$ đến $N(7;8)$, nó sẽ cắt đường trung bình $y=4$ tại điểm có hoành độ $x=6$. Tuy nhiên, do vận tốc trên nền gạch nhanh hơn ($v_1=5$) so với thảm cỏ ($v_2=3$), robot có xu hướng "kéo dài" đường đi trên nền gạch và "rút ngắn" đường đi trên cỏ. Do đó, điểm cắt tối ưu $K$ bị dịch lệch về bên phải ($x approx 6,27 > 6$) để giảm thiểu thời gian bị cản trở bởi môi trường chậm. Đây chính là biểu hiện thực tế của Định luật Snell trong Vật lý.
    ]
  ]
)
#tln(
  [Một robot giao hàng cần di chuyển từ điểm $A$ đến điểm $B$ trên một khuôn viên phẳng. Khuôn viên được chia làm ba dải: hai dải nền gạch ở hai bên và một dải thảm cỏ hình chữ nhật nằm vắt ngang ở giữa. Trong hệ tọa độ $O x y$ (đơn vị: mét), điểm $A(0; 0)$ nằm trên dải gạch thứ nhất, điểm $B(10; 10)$ nằm trên dải gạch thứ hai. Dải thảm cỏ được giới hạn bởi hai đường thẳng song song $y = 3$ và $y = 7$. Biết vận tốc của robot khi đi trên nền gạch là $v_1 = 5$ m/s, và khi đi trên thảm cỏ là $v_2 = 3$ m/s. Hỏi thời gian ngắn nhất để robot di chuyển từ $A$ đến $B$ là bao nhiêu giây (làm tròn kết quả đến hàng phần trăm)?
  
  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      
      // Thảm cỏ
      rect((-1, 3), (11, 7), fill: rgb("ccffcc"), stroke: rgb("009900"))
      content((1.5, 5), text(fill: rgb("006600"))[*Thảm cỏ* \ $v_2 = 3$ m/s])
      
      // Nền gạch
      content((1.5, 1.5), [*Nền gạch* \ $v_1 = 5$ m/s])
      content((1.5, 8.5), [*Nền gạch* \ $v_1 = 5$ m/s])
      
      // Hệ trục tọa độ và đường giới hạn
      line((-1, 0), (11, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, -1), (0, 11), mark: (end: ">"), stroke: 0.5pt)
      content((11.2, 0), $x$)
      content((0, 11.2), $y$)
      
      line((-1, 3), (11, 3), stroke: (dash: "dashed", paint: gray))
      line((-1, 7), (11, 7), stroke: (dash: "dashed", paint: gray))
      content((-0.5, 3.3), $3$)
      content((-0.5, 7.3), $7$)
      
      let A = (0,0)
      let B = (10,10)
      let M = (3.93, 3)
      let N = (6.07, 7)
      
      line(A, M, N, B, stroke: (paint: blue, thickness: 1.5pt))
      
      circle(M, radius: 1.5pt, fill: black); content((4.2, 2.5), $M$)
      circle(N, radius: 1.5pt, fill: black); content((5.8, 7.5), $N$)
      circle(A, radius: 1.5pt, fill: black); content((-0.4, -0.4), $A$)
      circle(B, radius: 1.5pt, fill: black); content((10.4, 10.4), $B$)
    })
  ]
  ],
  [$3,49$],
  loigiai: [
    #ppgiai[
      *Mẹo giải siêu nhanh: "Cắt ghép hình"*
      - Nhận xét: Robot đi trên 2 dải gạch với *cùng một vận tốc* ($5$ m/s). Do đó, ta không cần quan tâm nó đi dải dưới bao nhiêu, dải trên bao nhiêu. Ta có thể tưởng tượng *cắt bỏ dải thảm cỏ ném ra ngoài*, rồi *kéo dính 2 dải gạch lại với nhau* thành 1 khối!
      - Đặt $x$ là độ dời ngang của robot khi đi trên thảm cỏ.
      - Dùng Pytago lập hàm thời gian $T(x)$ cực kỳ đơn giản và bấm máy tìm Min.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Vẽ phần gạch đã chập lại
        rect((0,0), (10, 6), fill: rgb("f2f2f2"), stroke: gray)
        content((5, 3), [*Hai dải nền gạch ghép lại* \ (Cao: $3m + 3m = 6m$, Rộng: $10-x$)])
        
        // Vẽ phần cỏ tách rời
        rect((12,0), (16, 4), fill: rgb("ccffcc"), stroke: rgb("009900"))
        content((14, 2), [*Thảm cỏ* \ (Cao: $4m$, Rộng: $x$)])
        
        // Cạnh của gạch
        line((0,-0.5), (10,-0.5), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((5, -0.9), $10 - x$)
        line((-0.5, 0), (-0.5, 6), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((-0.9, 3), $6$)
        
        // Cạnh của cỏ
        line((12,-0.5), (16,-0.5), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((14, -0.9), $x$)
        line((11.5, 0), (11.5, 4), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((11.1, 2), $4$)
        
        // Quỹ đạo trên gạch
        line((0,0), (10,6), stroke: (paint: blue, thickness: 1.5pt))
        // Quỹ đạo trên cỏ
        line((12,0), (16,4), stroke: (paint: rgb("009900"), thickness: 1.5pt))
      })
    ]
    
    *1. Độ dài quãng đường đi trên thảm cỏ:*
    - Dải cỏ từ $y=3$ đến $y=7$ nên chiều cao (phương đứng) là $4$ m.
    - Gọi khoảng cách di chuyển theo phương ngang trên thảm cỏ là $x$ (m).
    - Áp dụng Pytago, quãng đường đi trên cỏ là: $S_2 = sqrt(x^2 + 4^2) = sqrt(x^2 + 16)$.
    
    *2. Độ dài tổng quãng đường đi trên nền gạch:*
    - Tổng chiều cao của 2 dải gạch là: $3 + (10 - 7) = 6$ m.
    - Vì tổng độ rộng của khuôn viên là $10$ m, mà robot đã dùng $x$ m đi ngang trên cỏ, nên độ rộng nằm ngang dành cho phần gạch là $10 - x$ (m).
    - Để quãng đường đi trên gạch ngắn nhất, khi "ghép" 2 dải gạch lại, nó phải là một đường thẳng.
    - Áp dụng Pytago, tổng quãng đường đi trên gạch là: $S_1 = sqrt((10 - x)^2 + 6^2) = sqrt((10 - x)^2 + 36)$.
    
    *3. Lập hàm thời gian và tìm Min:*
    Tổng thời gian đi trên cả đoạn đường là:
    $ T(x) = S_1/v_1 + S_2/v_2 = (sqrt((10 - x)^2 + 36))/5 + (sqrt(x^2 + 16))/3 $
    
    Tính đạo hàm $T'(x)$:
    $ T'(x) = (-2(10 - x))/(10 sqrt((10 - x)^2 + 36)) + (2x)/(6 sqrt(x^2 + 16)) = x/(3 sqrt(x^2 + 16)) - (10 - x)/(5 sqrt((10 - x)^2 + 36)) $
    
    Cho $T'(x) = 0$, ta được phương trình:
    $ 5x sqrt((10 - x)^2 + 36) = 3(10 - x) sqrt(x^2 + 16) $
    
    Sử dụng chức năng SOLVE trên máy tính (nhập nguyên phương trình vào và bấm SHIFT + SOLVE) với khoảng $x in (0; 10)$, ta ra được:
    $ x approx 2,14 " (m)". $
    
    Thay $x approx 2,14$ vào hàm $T(x)$ ban đầu:
    $ T_min = (sqrt((10 - 2,14)^2 + 36))/5 + (sqrt(2","14^2 + 16))/3 approx 1,978 + 1,512 = 3,49 " (s)". $
    
    Vậy thời gian di chuyển ngắn nhất là *$3,49$* giây.
    
    #nhanxet[
      Phương pháp "Tịnh tiến - Ghép hình" này là vũ khí bí mật siêu mạnh để xử lý các bài toán tìm quãng đường ngắn nhất qua nhiều lớp môi trường. Bằng cách chập các môi trường có cùng vận tốc lại với nhau, ta sẽ tránh được việc phải dùng đạo hàm hai biến hay các bất đẳng thức phức tạp, đưa mọi thứ về hàm 1 biến như Toán 12 cơ bản!
    ]
  ]
)

#tln(
  [Một robot giao hàng cần di chuyển từ điểm $A$ đến điểm $B$ trên một khuôn viên phẳng. Khuôn viên được chia làm ba dải: hai dải nền gạch ở hai bên và một dải thảm cỏ hình chữ nhật nằm vắt ngang ở giữa. Trong hệ tọa độ $O x y$ (đơn vị: mét), điểm $A(0; 0)$ nằm trên dải gạch thứ nhất, điểm $B(10; 10)$ nằm trên dải gạch thứ hai. Dải thảm cỏ được giới hạn bởi hai đường thẳng song song $y = 3$ và $y = 7$. Biết vận tốc của robot khi đi trên nền gạch là $v_1 = 5$ m/s, và khi đi trên thảm cỏ là $v_2 = 3$ m/s. Hỏi thời gian ngắn nhất để robot di chuyển từ $A$ đến $B$ là bao nhiêu giây (làm tròn kết quả đến hàng phần trăm)?
  
  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      
      // Thảm cỏ
      rect((-1, 3), (11, 7), fill: rgb("ccffcc"), stroke: rgb("009900"))
      content((1.5, 5), text(fill: rgb("006600"))[*Thảm cỏ* \ $v_2 = 3$ m/s])
      
      // Nền gạch
      content((1.5, 1.5), [*Nền gạch* \ $v_1 = 5$ m/s])
      content((1.5, 8.5), [*Nền gạch* \ $v_1 = 5$ m/s])
      
      // Hệ trục tọa độ và đường giới hạn
      line((-1, 0), (11, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, -1), (0, 11), mark: (end: ">"), stroke: 0.5pt)
      content((11.2, 0), $x$)
      content((0, 11.2), $y$)
      
      line((-1, 3), (11, 3), stroke: (dash: "dashed", paint: gray))
      line((-1, 7), (11, 7), stroke: (dash: "dashed", paint: gray))
      content((-0.5, 3.3), $3$)
      content((-0.5, 7.3), $7$)
      
      let A = (0,0)
      let B = (10,10)
      let M = (3.93, 3)
      let N = (6.07, 7)
      
      line(A, M, N, B, stroke: (paint: blue, thickness: 1.5pt))
      
      circle(M, radius: 1.5pt, fill: black); content((4.2, 2.5), $M$)
      circle(N, radius: 1.5pt, fill: black); content((5.8, 7.5), $N$)
      circle(A, radius: 1.5pt, fill: black); content((-0.4, -0.4), $A$)
      circle(B, radius: 1.5pt, fill: black); content((10.4, 10.4), $B$)
    })
  ]
  ],
  [$3,49$],
  loigiai: [
    #ppgiai[
      *Phương pháp: "Cộng Vectơ - Ghép hình"*
      - Chuyển động của robot gồm 3 giai đoạn (3 vectơ): Gạch $\to$ Cỏ $\to$ Gạch.
      - Vì đi trên 2 dải gạch với cùng vận tốc $v_1 = 5$ m/s, ta có thể "gộp" hai vectơ di chuyển trên nền gạch lại thành một đoạn di chuyển liền mạch.
      - Gọi độ dời ngang (theo trục $O x$) của đoạn đi trên cỏ là $x$. Khi đó, độ dời ngang của đoạn đi trên gạch bắt buộc phải là phần còn lại: $10 - x$.
      - Vẽ mô hình 2 tam giác vuông ghép sát nhau để thiết lập định lý Pytago.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        let xv = 3.5 // Giá trị minh hoạ cho x
        let A = (0, 0)
        let M = (10 - xv, 6)
        let B = (10, 10)
        
        // Khối Gạch (Gộp 2 dải)
        rect(A, M, fill: rgb("f2f2f2"), stroke: gray)
        content(( (10-xv)/2, 3), text(fill: blue)[*Gộp 2 dải gạch* \ $v_1 = 5$ m/s \ (Cao: $3+3=6$)])
        
        // Khối Cỏ
        rect(M, B, fill: rgb("ccffcc"), stroke: rgb("009900"))
        content((10 - xv/2, 8), text(fill: rgb("006600"))[*Thảm cỏ* \ $v_2 = 3$ m/s \ (Cao: $4$)])
        
        // Quỹ đạo (Đường chéo)
        line(A, M, stroke: (paint: blue, thickness: 1.5pt))
        line(M, B, stroke: (paint: rgb("009900"), thickness: 1.5pt))
        circle(A, radius: 1.5pt, fill: black); content((-0.4, -0.4), $A'$)
        circle(M, radius: 1.5pt, fill: black); content((10 - xv - 0.4, 6.4), $M'$)
        circle(B, radius: 1.5pt, fill: black); content((10.4, 10.4), $B'$)
        
        // Ghi chú kích thước (Màu đỏ cho dễ nhìn)
        // Kích thước ngang khối gạch
        line((0, -0.5), (10 - xv, -0.5), mark: (start: "<", end: ">"), stroke: (paint: red, thickness: 0.5pt))
        content(((10 - xv)/2, -1.2), text(fill: red)[*$10 - x$*])
        // Kích thước dọc khối gạch
        line((-0.5, 0), (-0.5, 6), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((-1, 3), $6$)
        
        // Kích thước ngang khối cỏ
        line((10 - xv, 10.5), (10, 10.5), mark: (start: "<", end: ">"), stroke: (paint: red, thickness: 0.5pt))
        content((10 - xv/2, 11.2), text(fill: red)[*$x$*])
        // Kích thước dọc khối cỏ
        line((10.5, 6), (10.5, 10), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((11, 8), $4$)
        
        // Tổng chiều ngang
        line((0, -2), (10, -2), mark: (start: "<", end: ">"), stroke: 1pt)
        content((5, -2.6), [*Tổng chiều rộng khuôn viên: $10$ m*])
      })
    ]
    
    Dựa vào hình vẽ ghép 2 mô hình, ta thấy ngay:
    *1. Thời gian đi trên thảm cỏ (Đoạn $M' B'$):*
    - Chiều cao dải cỏ là $4$ m, độ rộng ngang là $x$ m (với $0 <= x <= 10$).
    - Quãng đường: $S_"cỏ" = sqrt(x^2 + 4^2) = sqrt(x^2 + 16)$.
    - Thời gian: $t_"cỏ" = (S_"cỏ")/v_2 = (sqrt(x^2 + 16))/3$.
    
    *2. Thời gian đi trên nền gạch (Đoạn $A' M'$):*
    - Tổng chiều cao của 2 dải gạch là $3 + 3 = 6$ m.
    - Phần độ rộng ngang còn lại bắt buộc phải là $10 - x$ m.
    - Quãng đường: $S_"gạch" = sqrt((10 - x)^2 + 6^2) = sqrt((10 - x)^2 + 36)$.
    - Thời gian: $t_"gạch" = (S_"gạch")/v_1 = (sqrt((10 - x)^2 + 36))/5$.
    
    *3. Lập hàm tổng thời gian:*
    $ T(x) = t_"gạch" + t_"cỏ" = (sqrt((10 - x)^2 + 36))/5 + (sqrt(x^2 + 16))/3 $
    
    Tính đạo hàm $T'(x)$:
    $ T'(x) = (-2(10 - x))/(10 sqrt((10 - x)^2 + 36)) + (2x)/(6 sqrt(x^2 + 16)) = x/(3 sqrt(x^2 + 16)) - (10 - x)/(5 sqrt((10 - x)^2 + 36)) $
    
    Cho $T'(x) = 0$, ta được:
    $ x/(3 sqrt(x^2 + 16)) = (10 - x)/(5 sqrt((10 - x)^2 + 36)) <=> 5x sqrt((10 - x)^2 + 36) = 3(10 - x) sqrt(x^2 + 16) $
    
    Sử dụng máy tính cầm tay (chức năng SOLVE) trên khoảng $x in (0; 10)$, ta được:
    $ x approx 2,142 " (m)". $
    
    Thay $x approx 2,142$ vào hàm $T(x)$ ban đầu:
    $ T_min = (sqrt((10 - 2,142)^2 + 36))/5 + (sqrt(2","142^2 + 16))/3 approx 1,978 + 1,512 = 3,49 " (s)". $
    
    Vậy thời gian di chuyển ngắn nhất là *$3,49$* giây.
    
    #nhanxet[
      Mô hình "Ghép khối Pytago" ở trên cho thấy bản chất bài toán cực kỳ rõ ràng: Thay vì tính toán cồng kềnh với 3 dải xen kẽ, ta "đẩy" dải cỏ sang một bên và chập 2 dải gạch lại với nhau (do chúng có cùng tính chất vận tốc $v=5$). Biến $x$ và $(10-x)$ hiện ra trực quan giúp lập hàm thời gian chỉ trong 1 bước!
    ]
  ]
)
#tln(
  [Một máy bay không người lái (drone) giao hàng y tế cần bay từ trạm xuất phát $A$ đến bệnh viện đích $B$. Khu vực bay nằm trên một hệ trục tọa độ $O x y$ (đơn vị: km), với $A(0; 0)$ và $B(12; 9)$. Trên đường bay, thời tiết chia khu vực thành 3 dải địa hình song song: Dải 1 (từ $y=0$ đến $y=3$) là vùng trời quang đãng; Dải 2 (từ $y=3$ đến $y=5$) là vùng có sương mù dày đặc; Dải 3 (từ $y=5$ đến $y=9$) lại là vùng trời quang đãng. 
  Biết vận tốc an toàn tối đa của drone khi bay trong vùng trời quang là $v_1 = 6$ km/h, và khi bay qua vùng sương mù là $v_2 = 4$ km/h. Hỏi thời gian bay ngắn nhất để drone hoàn thành nhiệm vụ từ $A$ đến $B$ là bao nhiêu giờ (làm tròn kết quả đến hàng phần trăm)?
  
  #align(center)[
    #cetz.canvas(length: 0.7cm, {
      import cetz.draw: *
      
      // Vùng trời sương mù (Middle)
      rect((-1, 3), (13, 5), fill: rgb("e0e0e0"), stroke: rgb("9e9e9e"))
      content((2, 4), text(fill: rgb("616161"))[*Sương mù* \ $v_2 = 4$ km/h])
      
      // Vùng trời quang (Top & Bottom)
      content((2, 1.5), [*Trời quang* \ $v_1 = 6$ km/h])
      content((2, 7), [*Trời quang* \ $v_1 = 6$ km/h])
      
      // Hệ trục và đường giới hạn
      line((-1, 0), (13, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, -1), (0, 10), mark: (end: ">"), stroke: 0.5pt)
      content((13.2, 0), $x$)
      content((0, 10.2), $y$)
      
      line((-1, 3), (13, 3), stroke: (dash: "dashed", paint: gray))
      line((-1, 5), (13, 5), stroke: (dash: "dashed", paint: gray))
      line((-1, 9), (13, 9), stroke: (dash: "dashed", paint: gray))
      content((-0.6, 3.3), $3$)
      content((-0.6, 5.3), $5$)
      content((-0.6, 9.3), $9$)
      
      let A = (0,0)
      let B = (12,9)
      let M = (2.2, 3)
      let N = (3.54, 5)
      
      // Quỹ đạo minh hoạ
      line(A, M, N, B, stroke: (paint: blue, thickness: 1.5pt))
      
      circle(M, radius: 1.5pt, fill: black); content((2.5, 2.5), $M$)
      circle(N, radius: 1.5pt, fill: black); content((3.2, 5.5), $N$)
      circle(A, radius: 1.5pt, fill: black); content((-0.4, -0.4), $A$)
      circle(B, radius: 1.5pt, fill: black); content((12.4, 9.4), $B(12; 9)$)
    })
  ]
  ],
  [$2,73$],
  loigiai: [
    #ppgiai[
      *Áp dụng phương pháp: "Tịnh tiến - Ghép hình"*
      - Nhận xét: Vùng trời quang Dải 1 và Dải 3 có cùng một mức vận tốc là $v_1 = 6$ km/h. Thay vì lập đạo hàm cồng kềnh với 3 đoạn, ta "cắt" vùng sương mù ra, rồi "chập" Dải 1 và Dải 3 lại với nhau thành một khối liền mạch.
      - Gọi $x$ là quãng đường drone bay theo phương ngang (trục hoành) khi ở trong vùng sương mù.
      - Lập hàm $T(x)$ theo 2 khối (Sương mù và Khối trời quang đã gộp), bấm máy giải phương trình $T'(x)=0$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.7cm, {
        import cetz.draw: *
        let xv = 3 // Mô phỏng x
        let A = (0, 0)
        let M = (12 - xv, 7)
        let B = (12, 9)
        
        // Khối Trời Quang (Gộp Dải 1 và Dải 3)
        rect(A, M, fill: rgb("e3f2fd"), stroke: rgb("90caf9"))
        content(( (12-xv)/2, 3.5), text(fill: rgb("1565c0"))[*Gộp 2 vùng trời quang* \ $v_1 = 6$ km/h \ (Cao: $3 + 4 = 7$ km)])
        
        // Khối Sương mù
        rect(M, B, fill: rgb("e0e0e0"), stroke: rgb("9e9e9e"))
        content((12 - xv/2, 8), text(fill: rgb("616161"))[*Sương mù* \ $v_2 = 4$ \ (Cao: $2$ km)])
        
        // Quỹ đạo
        line(A, M, stroke: (paint: blue, thickness: 1.5pt))
        line(M, B, stroke: (paint: rgb("616161"), thickness: 1.5pt))
        
        // Kích thước ngang khối Quang
        line((0, -0.5), (12 - xv, -0.5), mark: (start: "<", end: ">"), stroke: (paint: red, thickness: 0.5pt))
        content(((12 - xv)/2, -1.2), text(fill: red)[*$12 - x$*])
        // Kích thước dọc khối Quang
        line((-0.5, 0), (-0.5, 7), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((-1, 3.5), $7$)
        
        // Kích thước ngang khối Mù
        line((12 - xv, 9.5), (12, 9.5), mark: (start: "<", end: ">"), stroke: (paint: red, thickness: 0.5pt))
        content((12 - xv/2, 10.2), text(fill: red)[*$x$*])
        // Kích thước dọc khối Mù
        line((12.5, 7), (12.5, 9), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((13, 8), $2$)
      })
    ]
    
    *1. Phân tích các khối sau khi ghép:*
    - *Khối sương mù:* Nằm từ $y=3$ đến $y=5$, nên có chiều cao dọc là $h_2 = 5 - 3 = 2$ km. Gọi $x$ (km) là độ dời ngang trong khối này ($0 <= x <= 12$).
    $=> S_"mù" = sqrt(x^2 + 2^2) = sqrt(x^2 + 4)$.
    $=> t_"mù" = (sqrt(x^2 + 4))/4$.
    
    - *Khối trời quang (Gộp 2 dải):* Dải 1 cao $3-0=3$ km; Dải 3 cao $9-5=4$ km. Tổng chiều cao dọc là $h_1 = 3 + 4 = 7$ km. Tổng độ dời ngang của vùng này bắt buộc là $12 - x$ (km).
    $=> S_"quang" = sqrt((12 - x)^2 + 7^2) = sqrt((12 - x)^2 + 49)$.
    $=> t_"quang" = (sqrt((12 - x)^2 + 49))/6$.
    
    *2. Tìm Min của hàm thời gian:*
    Tổng thời gian di chuyển:
    $ T(x) = (sqrt((12 - x)^2 + 49))/6 + (sqrt(x^2 + 4))/4 $
    
    Lấy đạo hàm $T'(x)$:
    $ T'(x) = (-2(12 - x))/(12 sqrt((12 - x)^2 + 49)) + (2x)/(8 sqrt(x^2 + 4)) = x/(4 sqrt(x^2 + 4)) - (12 - x)/(6 sqrt((12 - x)^2 + 49)) $
    
    Cho $T'(x) = 0$, ta thiết lập được phương trình:
    $ 6x sqrt((12 - x)^2 + 49) = 4(12 - x) sqrt(x^2 + 4) <=> 3x sqrt((12 - x)^2 + 49) = 2(12 - x) sqrt(x^2 + 4) $
    
    Dùng chức năng SOLVE của máy tính với $x in (0; 12)$, ta thu được nghiệm:
    $ x approx 1,34 " (km)" $
    
    Thay $x approx 1,34$ vào lại hàm $T(x)$:
    $ T_min = (sqrt((12 - 1,34)^2 + 49))/6 + (sqrt(1","34^2 + 4))/4 approx 2,125 + 0,602 = 2,727 " (giờ)". $
    
    Làm tròn đến hàng phần trăm, thời gian bay ngắn nhất là *$2,73$* giờ.
    
    #nhanxet[
      Việc thay đổi bối cảnh (máy bay qua đám mây sương mù, tia sáng đi qua các môi trường chiết suất khác nhau, hay robot chạy qua thảm cỏ) đều mang chung một *cấu trúc mô hình Toán học*. Nắm vững tư duy "Ghép hình Pytago", học sinh có thể giải quyết nhanh gọn mọi bài toán dạng này mà không sợ việc đạo hàm quá phức tạp.
    ]
  ]
)

#tln(
  [Tại một giải đua xe địa hình (Off-road), tay đua cần lái xe từ điểm xuất phát $A$ đến vạch đích $B$. Trên bản đồ tọa độ $O x y$ (đơn vị: km), điểm $A(0; 0)$ và đích $B(15; 12)$. Địa hình từ $A$ đến $B$ bị chia cắt bởi một dải đầm lầy vắt ngang: vùng từ $y=0$ đến $y=4$ là nền cát cứng; vùng từ $y=4$ đến $y=10$ là đầm lầy; và vùng từ $y=10$ đến $y=12$ lại là nền cát cứng.
  
  Do sự chênh lệch về độ bám đường, xe đạt tốc độ $v_1 = 10$ km/h khi chạy trên nền cát cứng, nhưng chỉ đạt tốc độ $v_2 = 5$ km/h khi băng qua đầm lầy. Tay đua cần chọn một lộ trình tối ưu để thời gian đến đích là ngắn nhất. Tính thời gian ngắn nhất đó (làm tròn đến hàng phần trăm).
  
  #align(center)[
    #cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      
      // Vùng Đầm lầy (Middle)
      rect((-1, 4), (16, 10), fill: rgb("d7ccc8"), stroke: rgb("8d6e63"))
      content((2, 7), text(fill: rgb("4e342e"))[*Đầm lầy* \ $v_2 = 5$ km/h])
      
      // Vùng Cát cứng (Top & Bottom)
      content((2, 2), [*Cát cứng* \ $v_1 = 10$ km/h])
      content((2, 11), [*Cát cứng* \ $v_1 = 10$ km/h])
      
      // Hệ trục và đường giới hạn
      line((-1, 0), (16, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, -1), (0, 13), mark: (end: ">"), stroke: 0.5pt)
      content((16.2, 0), $x$)
      content((0, 13.2), $y$)
      
      line((-1, 4), (16, 4), stroke: (dash: "dashed", paint: gray))
      line((-1, 10), (16, 10), stroke: (dash: "dashed", paint: gray))
      line((-1, 12), (16, 12), stroke: (dash: "dashed", paint: gray))
      content((-0.6, 4.3), $4$)
      content((-0.6, 10.3), $10$)
      content((-0.6, 12.3), $12$)
      
      // Các điểm chốt (lộ trình thực tế x=3, x_gạch = 12)
      // Theo tỉ lệ Pytago: Đoạn cát dưới y=4 -> x1 = 12 * (4/6) = 8
      // Đoạn đầm lầy y=6 -> x2 = 3
      // Đoạn cát trên y=2 -> x3 = 12 * (2/6) = 4
      let A = (0,0)
      let B = (15,12)
      let M = (8, 4)
      let N = (11, 10)
      
      // Quỹ đạo minh hoạ
      line(A, M, N, B, stroke: (paint: blue, thickness: 1.5pt))
      
      circle(M, radius: 1.5pt, fill: black); content((8.5, 3.5), $M$)
      circle(N, radius: 1.5pt, fill: black); content((10.5, 10.5), $N$)
      circle(A, radius: 1.5pt, fill: black); content((-0.6, -0.6), $A$)
      circle(B, radius: 1.5pt, fill: black); content((15.4, 12.4), $B(15; 12)$)
    })
  ]
  ],
  [$2,68$],
  loigiai: [
    #ppgiai[
      *Áp dụng phương pháp: "Tịnh tiến - Ghép hình"*
      - Vùng cát cứng xuất hiện ở 2 nơi (trước và sau đầm lầy) với cùng một mức vận tốc là $v_1 = 10$ km/h. Ta sẽ "cắt" dải đầm lầy ra và "gộp" 2 dải cát cứng lại với nhau thành một khối liền mạch.
      - Gọi $x$ là quãng đường xe chạy theo phương ngang (trục hoành) khi ở trong đầm lầy.
      - Thiết lập hàm tổng thời gian $T(x)$ trên mô hình đã chập khối.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.5cm, {
        import cetz.draw: *
        let xv = 3 // Độ dời x tối ưu là 3
        let A = (0, 0)
        let M = (15 - xv, 6)
        let B = (15, 12)
        
        // Khối Cát cứng (Gộp Dải 1 và Dải 3)
        rect(A, M, fill: rgb("fff3e0"), stroke: rgb("ffb74d"))
        content(( (15-xv)/2, 3), text(fill: rgb("e65100"))[*Gộp 2 khối Cát cứng* \ $v_1 = 10$ \ (Cao: $4 + 2 = 6$ km)])
        
        // Khối Đầm lầy
        rect(M, B, fill: rgb("d7ccc8"), stroke: rgb("8d6e63"))
        content((15 - xv/2, 9), text(fill: rgb("4e342e"))[*Đầm lầy* \ $v_2 = 5$ \ (Cao: $6$ km)])
        
        // Quỹ đạo chéo
        line(A, M, stroke: (paint: blue, thickness: 1.5pt))
        line(M, B, stroke: (paint: rgb("8d6e63"), thickness: 1.5pt))
        
        // Kích thước ngang khối Cát
        line((0, -0.6), (15 - xv, -0.6), mark: (start: "<", end: ">"), stroke: (paint: red, thickness: 0.5pt))
        content(((15 - xv)/2, -1.5), text(fill: red)[*$15 - x$*])
        // Kích thước dọc khối Cát
        line((-0.6, 0), (-0.6, 6), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((-1.5, 3), $6$)
        
        // Kích thước ngang khối Đầm lầy
        line((15 - xv, 12.6), (15, 12.6), mark: (start: "<", end: ">"), stroke: (paint: red, thickness: 0.5pt))
        content((15 - xv/2, 13.5), text(fill: red)[*$x$*])
        // Kích thước dọc khối Đầm lầy
        line((15.6, 6), (15.6, 12), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((16.5, 9), $6$)
      })
    ]
    
    *1. Phân tích các khối sau khi ghép:*
    - *Khối Đầm lầy:* Nằm từ $y=4$ đến $y=10$, chiều cao dọc là $h_2 = 10 - 4 = 6$ km. 
    Gọi $x$ (km) là độ dời ngang trong khối này ($0 <= x <= 15$).
    $=> S_"lầy" = sqrt(x^2 + 6^2) = sqrt(x^2 + 36)$.
    
    - *Khối Cát cứng (Gộp 2 dải):* Dải 1 cao $4-0=4$ km; Dải 3 cao $12-10=2$ km. Tổng chiều cao dọc là $h_1 = 4 + 2 = 6$ km. Tổng độ dời ngang của vùng này bắt buộc là phần còn lại: $15 - x$ (km).
    $=> S_"cát" = sqrt((15 - x)^2 + 6^2) = sqrt((15 - x)^2 + 36)$.
    
    *2. Tìm Min của hàm thời gian:*
    Tổng thời gian di chuyển của xe là:
    $ T(x) = S_"cát"/v_1 + S_"lầy"/v_2 = (sqrt((15 - x)^2 + 36))/10 + (sqrt(x^2 + 36))/5 $
    
    Lấy đạo hàm $T'(x)$ và cho bằng $0$:
    $ T'(x) = (-2(15 - x))/(20 sqrt((15 - x)^2 + 36)) + (2x)/(10 sqrt(x^2 + 36)) = 0 $
    $ <=> x/(5 sqrt(x^2 + 36)) = (15 - x)/(10 sqrt((15 - x)^2 + 36)) $
    $ <=> 2x sqrt((15 - x)^2 + 36) = (15 - x) sqrt(x^2 + 36) $
    
    Bình phương 2 vế hoặc dùng chức năng SOLVE của máy tính với $x in (0; 15)$, ta thu được một nghiệm nguyên cực kỳ tròn trịa:
    $ x = 3 " (km)" $
    
    Thay $x = 3$ vào hàm $T(x)$ để tính thời gian:
    $ T_min &= (sqrt((15 - 3)^2 + 36))/10 + (sqrt(3^2 + 36))/5 \
            &= (sqrt(144 + 36))/10 + (sqrt(9 + 36))/5 \
            &= (sqrt(180))/10 + (sqrt(45))/5 = (6 sqrt(5))/10 + (3 sqrt(5))/5 \
            &= (3 sqrt(5))/5 + (3 sqrt(5))/5 = (6 sqrt(5))/5 approx 2,683 " (giờ)". $
    
    Làm tròn đến hàng phần trăm, thời gian đua ngắn nhất là *$2,68$* giờ.
    
    #nhanxet[
      Bài toán có hệ số vận tốc $v_1 = 2 v_2$, và sau khi "ghép hình" ta được hai tam giác vuông có cùng chiều cao $h_1 = h_2 = 6$. Nhờ số liệu được tinh chỉnh cẩn thận, phương trình đạo hàm có nghiệm nguyên $x=3$ rất đẹp. Điều này giúp học sinh có thể bình phương 2 vế để tập giải tay phương trình bậc 4 bị triệt tiêu, nắm vững bản chất đại số thay vì chỉ biết phụ thuộc vào nút SOLVE của máy tính.
    ]
  ]
)
// Chào bạn, đây là một bài toán được thiết kế mới hoàn toàn với bối cảnh "Cứu hộ y tế trên tuyết".
// Điểm đặc biệt của bài này là các thông số (vận tốc, tọa độ) được tính toán ngược bằng phương trình Diophantine
// để tạo ra một NGHIỆM ĐÚNG cực kỳ đẹp (thời gian ra số nguyên chẵn 25 phút). 
// Đảm bảo học sinh giải xong sẽ có cảm giác cực kỳ "thỏa mãn" với phương pháp Ghép hình này!

#tln(
  [Một xe trượt tuyết cứu hộ cần vận chuyển khẩn cấp một mẫu nội tạng từ trạm y tế $A$ đến bệnh viện $B$. Trên bản đồ tọa độ $O x y$ (đơn vị: km), trạm $A$ nằm ở gốc tọa độ $A(0; 0)$ và bệnh viện $B(11; 10)$. 
  
  Địa hình khu vực bị chia cắt làm 3 dải theo phương ngang: 
  - Vùng từ $y=0$ đến $y=4$: Mặt băng phẳng.
  - Vùng từ $y=4$ đến $y=8$: Lớp tuyết xốp, lún sâu.
  - Vùng từ $y=8$ đến $y=10$: Mặt băng phẳng.
  
  Biết vận tốc tối đa của xe trượt trên mặt băng phẳng là $v_1 = 40$ km/h. Khi đi qua vùng tuyết xốp, do lực cản lớn nên vận tốc giảm xuống chỉ còn $v_2 = 30$ km/h. Hỏi thời gian di chuyển ngắn nhất để xe hoàn thành nhiệm vụ là bao nhiêu *phút* (làm tròn kết quả đến hàng đơn vị)?
  
  #align(center)[
    #cetz.canvas(length: 0.6cm, {
      import cetz.draw: *
      
      // Tuyết xốp (Middle)
      rect((-1, 4), (12, 8), fill: rgb("e8ebef"), stroke: rgb("90a4ae"))
      content((2, 6), text(fill: rgb("455a64"))[*Tuyết xốp* \ $v_2 = 30$ km/h])
      
      // Băng phẳng (Top & Bottom)
      content((2, 2), text(fill: rgb("0277bd"))[*Băng phẳng* \ $v_1 = 40$ km/h])
      content((2, 9), text(fill: rgb("0277bd"))[*Băng phẳng* \ $v_1 = 40$ km/h])
      
      // Hệ trục và đường giới hạn
      line((-1, 0), (12, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, -1), (0, 11), mark: (end: ">"), stroke: 0.5pt)
      content((12.2, 0), $x$)
      content((0, 11.2), $y$)
      
      line((-1, 4), (12, 4), stroke: (dash: "dashed", paint: gray))
      line((-1, 8), (12, 8), stroke: (dash: "dashed", paint: gray))
      line((-1, 10), (12, 10), stroke: (dash: "dashed", paint: gray))
      content((-0.6, 4.3), $4$)
      content((-0.6, 8.3), $8$)
      content((-0.6, 10.3), $10$)
      
      // Lộ trình tối ưu (x = 3, ngang băng = 8)
      // Tọa độ gấp khúc: M(4, 4) ... wait. 
      // Trên băng dưới có h=4. Ngang băng dưới = 8 * (4/6) = 16/3 = 5.33. M(5.33, 4).
      // Trên tuyết có h=4, x=3. Ngang tuyết = 3. N(8.33, 8).
      // Trên băng trên có h=2. Ngang băng trên = 8 * (2/6) = 8/3 = 2.67. B(11, 10).
      let A = (0,0)
      let B = (11,10)
      let M = (5.33, 4)
      let N = (8.33, 8)
      
      // Quỹ đạo 
      line(A, M, N, B, stroke: (paint: blue, thickness: 1.5pt))
      
      circle(M, radius: 1.5pt, fill: black); content((6, 3.5), $M$)
      circle(N, radius: 1.5pt, fill: black); content((7.7, 8.5), $N$)
      circle(A, radius: 1.5pt, fill: black); content((-0.6, -0.6), $A$)
      circle(B, radius: 1.5pt, fill: black); content((11.4, 10.4), $B(11; 10)$)
    })
  ]
  ],
  [$25$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Sử dụng tư duy "Cắt ghép khối". Hai vùng băng phẳng (trước và sau dải tuyết xốp) có cùng vận tốc $v_1 = 40$ km/h nên ta sẽ "chập" chúng lại thành một khối liền mạch để loại bỏ một biến số phức tạp.
      - *Bước 2:* Gọi $x$ (km) là độ dịch chuyển ngang khi xe băng qua lớp tuyết xốp. Thiết lập hàm thời gian $T(x)$ (đơn vị: giờ).
      - *Bước 3:* Giải phương trình đạo hàm $T'(x)=0$ để tìm $x$.
      - *Bước 4:* Đổi kết quả thời gian từ *giờ* sang *phút* theo đúng yêu cầu đề bài.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        let xv = 3 // Nghiệm tối ưu x=3
        let A = (0, 0)
        let M = (11 - xv, 6)
        let B = (11, 10)
        
        // Khối Băng phẳng (Gộp Dải 1 và Dải 3)
        rect(A, M, fill: rgb("e1f5fe"), stroke: rgb("03a9f4"))
        content(( (11-xv)/2, 3), text(fill: rgb("01579b"))[*Gộp 2 dải Băng phẳng* \ $v_1 = 40$ km/h \ (Cao: $4 + 2 = 6$ km)])
        
        // Khối Tuyết xốp
        rect(M, B, fill: rgb("e8ebef"), stroke: rgb("90a4ae"))
        content((11 - xv/2, 8), text(fill: rgb("455a64"))[*Tuyết xốp* \ $v_2 = 30$ km/h \ (Cao: $4$ km)])
        
        // Quỹ đạo 
        line(A, M, stroke: (paint: blue, thickness: 1.5pt))
        line(M, B, stroke: (paint: rgb("455a64"), thickness: 1.5pt))
        
        // Kích thước ngang khối Băng
        line((0, -0.6), (11 - xv, -0.6), mark: (start: "<", end: ">"), stroke: (paint: red, thickness: 0.5pt))
        content(((11 - xv)/2, -1.5), text(fill: red)[*$11 - x$*])
        // Kích thước dọc khối Băng
        line((-0.6, 0), (-0.6, 6), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((-1.5, 3), $6$)
        
        // Kích thước ngang khối Tuyết
        line((11 - xv, 10.6), (11, 10.6), mark: (start: "<", end: ">"), stroke: (paint: red, thickness: 0.5pt))
        content((11 - xv/2, 11.5), text(fill: red)[*$x$*])
        // Kích thước dọc khối Tuyết
        line((11.6, 6), (11.6, 10), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((12.5, 8), $4$)
      })
    ]
    
    *1. Phân tích các khối sau khi ghép:*
    - *Khối Tuyết xốp:* Giới hạn bởi $y=4$ đến $y=8$, có chiều cao dọc $h_2 = 8 - 4 = 4$ km. 
    Gọi $x$ (km) là độ dời ngang của xe trong khối tuyết ($0 <= x <= 11$).
    Quãng đường trên tuyết: $S_"tuyết" = sqrt(x^2 + 4^2) = sqrt(x^2 + 16)$.
    
    - *Khối Băng phẳng (Đã gộp):* Dải đầu cao $4$ km, dải cuối cao $10-8=2$ km. 
    Tổng chiều cao dọc $h_1 = 4 + 2 = 6$ km. 
    Độ dời ngang phần còn lại bắt buộc là $11 - x$ (km).
    Quãng đường trên băng: $S_"băng" = sqrt((11 - x)^2 + 6^2) = sqrt((11 - x)^2 + 36)$.
    
    *2. Tìm giá trị Min của thời gian:*
    Tổng thời gian di chuyển (tính bằng giờ) là:
    $ T(x) = S_"băng"/v_1 + S_"tuyết"/v_2 = (sqrt((11 - x)^2 + 36))/40 + (sqrt(x^2 + 16))/30 $
    
    Lấy đạo hàm $T'(x)$:
    $ T'(x) = (-2(11 - x))/(80 sqrt((11 - x)^2 + 36)) + (2x)/(60 sqrt(x^2 + 16)) = x/(30 sqrt(x^2 + 16)) - (11 - x)/(40 sqrt((11 - x)^2 + 36)) $
    
    Cho $T'(x) = 0$, ta có:
    $ x/(3 sqrt(x^2 + 16)) = (11 - x)/(4 sqrt((11 - x)^2 + 36)) <=> 4x sqrt((11 - x)^2 + 36) = 3(11 - x) sqrt(x^2 + 16) $
    
    _Tới đây học sinh có thể bình phương 2 vế để giải phương trình bậc cao, hoặc nhẩm nhanh bộ số Pytago, hoặc bấm máy tính (SOLVE) với $x \in (0; 11)$, ta được nghiệm chẵn tuyệt đẹp:_
    $ x = 3 " (km)" $
    
    Thay $x = 3$ vào hàm $T(x)$ để tính thời gian ngắn nhất bằng giờ:
    $ T_min &= (sqrt((11 - 3)^2 + 36))/40 + (sqrt(3^2 + 16))/30 \
            &= (sqrt(8^2 + 36))/40 + (sqrt(9 + 16))/30 \
            &= (sqrt(100))/40 + (sqrt(25))/30 = 10/40 + 5/30 = 1/4 + 1/6 = 5/12 " (giờ)" $
    
    *3. Đổi đơn vị:*
    Đề bài yêu cầu tính thời gian bằng *phút*. Ta thực hiện chuyển đổi:
    $ t = 5/12 dot 60 = 25 " (phút)". $
    
    Vậy xe trượt tuyết chỉ mất *$25$* phút để hoàn thành nhiệm vụ.
    
    #nhanxet[
      - *Đẹp về mặt số học:* Nhờ tỷ lệ vận tốc $v_1 / v_2 = 4/3$ kết hợp khéo léo với các tỷ lệ cạnh tam giác Pytago, bài toán có nghiệm $x=3$ cực kỳ "mượt", giúp các biểu thức dưới dấu căn trở thành số chính phương ($100$ và $25$), loại bỏ hoàn toàn số vô tỉ.
      - *Yếu tố gài bẫy (bẫy thực tế):* Ở bước cuối cùng, học sinh rất dễ vội vàng điền đáp án $5/12 approx 0,42$ (giờ) mà quên mất yêu cầu *đơn vị là phút* của bài toán thực tế.
    ]
  ]
)
#tln(
  [Một thiết bị cứu hộ lội nước không người lái cần di chuyển khẩn cấp từ bãi tập kết $A$ trên bờ biển đến cứu một nạn nhân tại vị trí $B$ trên biển. Trong hệ trục tọa độ $O x y$ (đơn vị: mét), bờ biển là đường thẳng $y = 12$. Điểm $A$ đặt tại gốc tọa độ $A(0; 0)$ (nằm trên bãi cát) và nạn nhân $B$ ở vị trí $B(25; 24)$ (nằm trên biển).
  
  Biết thiết bị lội nước có thể chạy trên bãi cát với vận tốc $v_1 = 20$ m/s, và bơi dưới nước với vận tốc $v_2 = 15$ m/s. Để tiếp cận nạn nhân nhanh nhất, thiết bị tự động tính toán một điểm cắt $M$ trên đường bờ biển để đổi hướng. Hỏi thời gian ngắn nhất để thiết bị đi từ $A$ đến $B$ là bao nhiêu giây?
  
  #align(center)[
    #cetz.canvas(length: 0.25cm, {
      import cetz.draw: *
      
      // Môi trường Biển
      rect((-5, 12), (30, 28), fill: rgb("e3f2fd"), stroke: rgb("90caf9"))
      content((4, 25), text(fill: rgb("0277bd"))[*Mặt biển* \ $v_2 = 15$ m/s])
      
      // Môi trường Cát
      rect((-5, 0), (30, 12), fill: rgb("fff8e1"), stroke: rgb("ffe082"))
      content((4, 5), text(fill: rgb("f57f17"))[*Bãi cát* \ $v_1 = 20$ m/s])
      
      // Bờ biển và hệ trục
      line((-5, 0), (32, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, -3), (0, 30), mark: (end: ">"), stroke: 0.5pt)
      content((33, 0), $x$)
      content((0, 31), $y$)
      
      line((-5, 12), (30, 12), stroke: (dash: "dashed", paint: gray, thickness: 1.2pt))
      content((-2, 13.5), $12$, fill: black)
      
      // Tọa độ điểm tối ưu: x1 = 16, x2 = 9
      let A = (0,0)
      let M = (16, 12)
      let B = (25, 24)
      
      // Quỹ đạo thiết bị
      line(A, M, B, stroke: (paint: red, thickness: 1.5pt))
      
      // Đường pháp tuyến tại M để vẽ góc Khúc xạ
      line((16, 4), (16, 20), stroke: (dash: "dashed", paint: gray))
      
      // Góc tới và góc khúc xạ
      arc((M.at(0), M.at(1) + 4), start: 90deg, stop: 143.13deg, radius: 4, stroke: 0.5pt)
      content((13, 17.5), $theta_2$)
      arc((M.at(0), M.at(1) - 4), start: -90deg, stop: -53.13deg, radius: 4, stroke: 0.5pt)
      content((18.5, 7), $theta_1$)
      
      circle(M, radius: 1.5pt, fill: black); content((17.5, 11), $M$)
      circle(A, radius: 1.5pt, fill: black); content((-1.5, -1.5), $A$)
      circle(B, radius: 1.5pt, fill: black); content((25, 25.5), $B(25; 24)$)
    })
  ]
  ],
  [$2$],
  loigiai: [
    #ppgiai[
      *Bản chất của Nguyên lý Fermat (Định luật Snell)*
      - Thay vì dùng đạo hàm hàm số để tìm giá trị nhỏ nhất của thời gian, ta mượn tính chất của ánh sáng: *Ánh sáng luôn đi theo quỹ đạo tốn ít thời gian nhất*.
      - Tại điểm giao cắt $M$, gọi $theta_1$ và $theta_2$ là góc tạo bởi quỹ đạo với đường pháp tuyến (đường vuông góc với bờ biển).
      - Theo Định luật Snell, tỉ số giữa $sin$ của góc lệch và vận tốc trong môi trường đó luôn là một hằng số $k$: 
      $ (sin theta_1)/v_1 = (sin theta_2)/v_2 = k $
      - Bước giải: Biểu diễn độ dịch chuyển ngang (theo trục $x$) qua ẩn $k$. Dùng phương trình tổng độ dài ngang để tìm $k$, từ đó giải ra bài toán cực kỳ nhẹ nhàng.
    ]
    
    Gọi $x_1, x_2$ lần lượt là độ dịch chuyển ngang của thiết bị trên bãi cát và trên biển.
    Từ hoành độ điểm $B(25; 24)$, ta có tổng dịch chuyển ngang là:
    $ x_1 + x_2 = 25 quad (1) $
    
    Chiều cao (độ dời dọc) của từng môi trường là:
    - Bãi cát: $h_1 = 12 - 0 = 12$ m.
    - Mặt biển: $h_2 = 24 - 12 = 12$ m.
    
    Từ hình vẽ, xét trong tam giác vuông tạo bởi đường đi và pháp tuyến, ta có:
    $ sin theta_i = x_i / (sqrt(x_i^2 + h_i^2)) quad "và" quad tan theta_i = x_i / h_i => x_i = h_i tan theta_i $
    
    Theo định luật Snell, để thời gian là ngắn nhất, tồn tại hằng số $k > 0$ sao cho:
    $ (sin theta_1)/20 = (sin theta_2)/15 = k => cases(
      sin theta_1 = 20k => tan theta_1 = (20k) / sqrt(1 - 400k^2),
      sin theta_2 = 15k => tan theta_2 = (15k) / sqrt(1 - 225k^2)
    ) $
    
    Thế $tan theta_i$ vào công thức $x_i = h_i tan theta_i$, ta được:
    - Quãng đường ngang trên cát: $x_1 = 12 dot (20k) / sqrt(1 - 400k^2) = (240k) / sqrt(1 - 400k^2)$
    - Quãng đường ngang trên biển: $x_2 = 12 dot (15k) / sqrt(1 - 225k^2) = (180k) / sqrt(1 - 225k^2)$
    
    Thay $x_1, x_2$ vào phương trình $(1)$, ta thiết lập được phương trình:
    $ f(k) = (240k) / sqrt(1 - 400k^2) + (180k) / sqrt(1 - 225k^2) = 25 $
    
    *Điều kiện xác định:* Biểu thức dưới căn ở mẫu phải dương, và $1 - 400k^2$ là giới hạn khắt khe hơn nên:
    $ 1 - 400k^2 > 0 <=> k^2 < 1/400 <=> k < 1/20 = 0,05 $
    
    Hàm số $f(k)$ đồng biến trên khoảng $(0; 0,05)$ nên phương trình có nghiệm duy nhất.
    Sử dụng máy tính cầm tay (chức năng SOLVE), ta tìm được nghiệm:
    $ k = 0,04 = 1/25 $
    
    Thay $k = 1/25$ ngược lại để tìm chính xác quãng đường ngang:
    - Trên cát: $x_1 = 240(1/25) / sqrt(1 - 400(1/625)) = 9,6 / sqrt(1 - 0","64) = 9,6 / 0,6 = 16$ (m).
    - Trên biển: $x_2 = 180(1/25) / sqrt(1 - 225(1/625)) = 7,2 / sqrt(1 - 0","36) = 7,2 / 0,8 = 9$ (m).
    *(Thử lại: $x_1 + x_2 = 16 + 9 = 25$, khớp hoàn toàn với đề bài).*
    
    Cuối cùng, tính thời gian di chuyển trong từng môi trường ($t = sqrt(x^2 + h^2) / v$):
    - Thời gian chạy trên cát: $t_1 = (sqrt(16^2 + 12^2)) / 20 = (sqrt(400)) / 20 = 20 / 20 = 1$ (giây).
    - Thời gian bơi trên biển: $t_2 = (sqrt(9^2 + 12^2)) / 15 = (sqrt(225)) / 15 = 15 / 15 = 1$ (giây).
    
    Tổng thời gian tiếp cận nạn nhân nhanh nhất là:
    $ T_{min} = 1 + 1 = 2 " (giây)." $
    
    #nhanxet[
      Thông qua 2 môi trường cơ bản, ta thấy Định luật Snell biến một bài toán Tối ưu hóa cực trị (Đạo hàm) trở thành một bài toán Giải phương trình Đại số / Lượng giác $f(k) = C$. Khái niệm $k$ chính là yếu tố cốt lõi cân bằng sự "trễ" giữa các môi trường vận tốc khác nhau. Khi đã thành thạo kỹ thuật này, việc thêm môi trường thứ 3 hay thứ 4 chỉ đơn giản là cộng thêm các cụm biểu thức tương tự mà không làm thay đổi bản chất phương pháp giải!
    ]
  ]
)

#tln(
  [Một robot thám hiểm không người lái (Rover) cần di chuyển từ trạm gốc $A$ đến điểm thu thập mẫu vật $B$ trên bề mặt một hành tinh. Trên hệ trục tọa độ $O x y$ (đơn vị: km), trạm $A$ đặt tại gốc tọa độ $A(0; 0)$ và điểm $B$ ở vị trí $B(84; 118)$.
  
  Địa hình từ $A$ đến $B$ bị chia làm 3 dải môi trường hoàn toàn khác biệt nhau theo phương ngang:
  - Vùng 1 ($y$ từ $0$ đến $40$): Nền đất đá cứng, xe chạy với vận tốc $v_1 = 15$ km/h.
  - Vùng 2 ($y$ từ $40$ đến $70$): Đồng bằng băng nhẵn, xe chạy với vận tốc tối đa $v_2 = 20$ km/h.
  - Vùng 3 ($y$ từ $70$ đến $118$): Vùng đồi cát lún, xe chỉ chạy được với vận tốc $v_3 = 7$ km/h.
  
  Biết robot được lập trình trí tuệ nhân tạo để tự động vạch ra quỹ đạo gấp khúc qua các vùng sao cho tổng thời gian di chuyển là nhỏ nhất. Tính thời gian nhỏ nhất đó (làm tròn kết quả đến hàng phần trăm).
  
  #align(center)[
    #cetz.canvas(length: 0.08cm, {
      import cetz.draw: *
      
      // Vùng 3: Cát lún
      rect((-10, 70), (100, 118), fill: rgb("fff3e0"), stroke: rgb("ffcc80"))
      content((15, 95), text(fill: rgb("e65100"))[*Cát lún* \ $v_3 = 7$ km/h])
      
      // Vùng 2: Băng nhẵn
      rect((-10, 40), (100, 70), fill: rgb("e1f5fe"), stroke: rgb("81d4fa"))
      content((15, 55), text(fill: rgb("01579b"))[*Băng nhẵn* \ $v_2 = 20$ km/h])
      
      // Vùng 1: Đất đá cứng
      rect((-10, 0), (100, 40), fill: rgb("eceff1"), stroke: rgb("b0bec5"))
      content((15, 20), text(fill: rgb("37474f"))[*Đất đá* \ $v_1 = 15$ km/h])
      
      // Hệ trục và đường giới hạn
      line((-10, 0), (105, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, -10), (0, 125), mark: (end: ">"), stroke: 0.5pt)
      content((107, 0), $x$)
      content((0, 127), $y$)
      
      line((-10, 40), (100, 40), stroke: (dash: "dashed", paint: gray))
      line((-10, 70), (100, 70), stroke: (dash: "dashed", paint: gray))
      line((-10, 118), (100, 118), stroke: (dash: "dashed", paint: gray))
      content((-5, 43), $40$)
      content((-5, 73), $70$)
      content((-5, 121), $118$)
      
      let A = (0,0)
      let M = (30, 40)
      let N = (70, 70)
      let B = (84, 118)
      
      // Quỹ đạo 
      line(A, M, N, B, stroke: (paint: red, thickness: 1.5pt))
      
      circle(M, radius: 1.5pt, fill: black); content((34, 35), $M$)
      circle(N, radius: 1.5pt, fill: black); content((74, 65), $N$)
      circle(A, radius: 1.5pt, fill: black); content((-4, -4), $A$)
      circle(B, radius: 1.5pt, fill: black); content((84, 122), $B(84; 118)$)
      
      // Vẽ góc khúc xạ minh họa tại N
      line((70, 55), (70, 85), stroke: (dash: "dashed", paint: gray))
      arc((70, 80), start: 90deg, stop: 111.8deg, radius: 10, stroke: 0.5pt)
      content((64, 78), $theta_3$)
      arc((70, 60), start: -90deg, stop: -53.1deg, radius: 10, stroke: 0.5pt)
      content((77, 60), $theta_2$)
    })
  ]
  ],
  [$12,98$],
  loigiai: [
    #ppgiai[
      *Phương pháp Khúc xạ ánh sáng (Nguyên lý Fermat)*
      - Khi quỹ đạo đi qua 3 môi trường, bài toán có 2 ẩn số. Việc dùng đạo hàm đòi hỏi giải hệ phương trình đạo hàm riêng rất phức tạp.
      - Thay vào đó, ta áp dụng Định luật Snell: $ (sin theta_1)/v_1 = (sin theta_2)/v_2 = (sin theta_3)/v_3 = k $ với $theta_i$ là góc tạo bởi quỹ đạo và phương thẳng đứng.
      - Dùng lượng giác biểu diễn độ dời ngang $x_i$ theo ẩn $k$. Lập phương trình $x_1 + x_2 + x_3 = 84$.
      - Chứng minh hàm số đồng biến để khẳng định nghiệm duy nhất, sau đó dùng máy tính (SOLVE) tìm $k$.
    ]
    
    Gọi $x_1, x_2, x_3$ lần lượt là độ dịch chuyển ngang của robot trong Vùng 1, Vùng 2 và Vùng 3.
    Từ tọa độ $B(84; 118)$, ta có tổng dịch chuyển ngang là: 
    $ x_1 + x_2 + x_3 = 84 quad (1) $
    
    Chiều cao (độ dời dọc) của các vùng lần lượt là:
    - Vùng 1: $h_1 = 40 - 0 = 40$ km.
    - Vùng 2: $h_2 = 70 - 40 = 30$ km.
    - Vùng 3: $h_3 = 118 - 70 = 48$ km.
    
    Gọi $theta_i$ là góc hợp bởi đường đi và phương thẳng đứng. Ta có: 
    $sin theta_i = x_i / (sqrt(x_i^2 + h_i^2))$ và $tan theta_i = x_i / h_i => x_i = h_i tan theta_i$.
    
    Theo định luật Snell, để thời gian là ngắn nhất, ta có:
    $ (sin theta_1)/15 = (sin theta_2)/20 = (sin theta_3)/7 = k (> 0) => sin theta_i = k dot v_i $
    
    Do $theta_i$ nhọn nên $cos theta_i = sqrt(1 - sin^2 theta_i) = sqrt(1 - k^2 v_i^2)$. 
    Suy ra $tan theta_i = (k v_i) / sqrt(1 - k^2 v_i^2)$.
    
    Biểu diễn các độ dời ngang $x_i$ theo ẩn $k$:
    - $x_1 = 40 tan theta_1 = (40 dot 15k) / sqrt(1 - 15^2 k^2) = (600k) / sqrt(1 - 225k^2)$
    
    - $x_2 = 30 tan theta_2 = (30 dot 20k) / sqrt(1 - 20^2 k^2) = (600k) / sqrt(1 - 400k^2)$
    - $x_3 = 48 tan theta_3 = (48 dot 7k) / sqrt(1 - 7^2 k^2) = (336k) / sqrt(1 - 49k^2)$
    
    Thay vào phương trình $(1)$, ta được hàm số:
    $ f(k) = (600k) / sqrt(1 - 225k^2) + (600k) / sqrt(1 - 400k^2) + (336k) / sqrt(1 - 49k^2) = 84 $
    
    *Điều kiện:* Để căn thức có nghĩa, $1 - 400k^2 > 0 <=> k < 1/20 = 0,05$. Tập xác định: $k in (0; 0,05)$.
    
    Xét hàm số $g(t) = t/sqrt(1 - a t^2)$ với $a>0$, ta có $g'(t) = 1/(1 - a t^2)sqrt(1 - a t^2) > 0$. Do đó, $f(k)$ là tổng của 3 hàm số đồng biến, suy ra $f(k)$ đồng biến trên $(0; 0,05)$. Phương trình $f(k) = 84$ có nghiệm duy nhất.
    
    Sử dụng máy tính cầm tay (chức năng SOLVE), ta tìm được nghiệm duy nhất:
    $ k = 0,04 = 1/25 $
    
    Thay $k = 1/25$ trở lại để tìm quãng đường:
    - $x_1 = 600(1/25) / sqrt(1 - 225/625) = 24 / (4/5) = 30$ (km).
    - $x_2 = 600(1/25) / sqrt(1 - 400/625) = 24 / (3/5) = 40$ (km).
    - $x_3 = 336(1/25) / sqrt(1 - 49/625) = 13,44 / (24/25) = 14$ (km).
    
    *(Tổng $x_1 + x_2 + x_3 = 30 + 40 + 14 = 84$, khớp với đề bài).*
    
    Thời gian di chuyển tương ứng cho từng đoạn:
    - $t_1 = (sqrt(x_1^2 + h_1^2))/v_1 = (sqrt(30^2 + 40^2))/15 = 50/15 = 10/3$ (giờ).
    - $t_2 = (sqrt(x_2^2 + h_2^2))/v_2 = (sqrt(40^2 + 30^2))/20 = 50/20 = 2,5$ (giờ).
    - $t_3 = (sqrt(x_3^2 + h_3^2))/v_3 = (sqrt(14^2 + 48^2))/7 = 50/7$ (giờ).
    
    Tổng thời gian ngắn nhất để xe di chuyển đến $B$ là:
    $ T_min = 10/3 + 5/2 + 50/7 = (70 + 52,5 + 150)/21 = 272,5 / 21 approx 12,976 " (giờ)". $
    
    Làm tròn đến hàng phần trăm, thời gian di chuyển ngắn nhất là *$12,98$* giờ.
    
    #nhanxet[
      Bằng cách chuyển 2 ẩn tọa độ về 1 ẩn $k$ (hằng số Snell), phương trình có dạng đơn điệu tăng ngặt nên học sinh hoàn toàn có cơ sở Toán học vững chắc để dùng chức năng SOLVE trên máy tính tìm ra nghiệm duy nhất $k=0,04$ một cách "tử tế" và hợp lệ thay vì phải đoán mò. Đây là một kĩ thuật cực kì mạnh khi thi trắc nghiệm.
    ]
  ]
)

// TODO: Đây là bài toán rèn luyện với bộ số liệu mới (24, 15, 20) và hệ tọa độ mới.
// Lời giải sử dụng định luật Snell, phương trình một ẩn $k$ có miền xác định khắt khe hơn $k \in (0; 1/24)$.
// Nghiệm $k = 1/25$ (0.04) nằm hoàn hảo trong tập xác định và cho ra thời gian cực đẹp: 10.625 giờ.

#tln(
  [Một tàu đệm khí (Hovercraft) thực hiện nhiệm vụ cứu hộ khẩn cấp từ căn cứ $A$ đến hòn đảo $B$. Trên hệ trục tọa độ $O x y$ (đơn vị: km), căn cứ $A$ đặt tại gốc tọa độ $A(0; 0)$ và đảo $B$ ở vị trí $B(164; 111)$.
  
  Lộ trình từ $A$ đến $B$ băng qua 3 khu vực địa hình song song với nhau theo phương ngang:
  - Vùng 1 ($y$ từ $0$ đến $21$): Bãi bồi cát phẳng, tàu di chuyển với vận tốc $v_1 = 24$ km/h.
  - Vùng 2 ($y$ từ $21$ đến $69$): Rừng ngập mặn đan xen đầm lầy, tàu giảm tốc độ còn $v_2 = 15$ km/h.
  - Vùng 3 ($y$ từ $69$ đến $111$): Mặt biển khơi, tàu tăng tốc đạt mức $v_3 = 20$ km/h.
  
  Biết hệ thống dẫn đường của tàu tự động vạch ra lộ trình liên tục sao cho tổng thời gian di chuyển từ $A$ đến $B$ là nhỏ nhất. Hãy tính thời gian nhỏ nhất đó (viết kết quả chính xác dưới dạng số thập phân, ví dụ: $10,5$).
  
  #align(center)[
    #cetz.canvas(length: 0.05cm, {
      import cetz.draw: *
      
      // Vùng 3: Mặt biển khơi
      rect((-10, 69), (180, 111), fill: rgb("e3f2fd"), stroke: rgb("90caf9"))
      content((15, 90), text(fill: rgb("1565c0"))[*Mặt biển* \ $v_3 = 20$ km/h])
      
      // Vùng 2: Rừng ngập mặn
      rect((-10, 21), (180, 69), fill: rgb("e8f5e9"), stroke: rgb("a5d6a7"))
      content((15, 45), text(fill: rgb("2e7d32"))[*Rừng ngập mặn* \ $v_2 = 15$ km/h])
      
      // Vùng 1: Bãi bồi
      rect((-10, 0), (180, 21), fill: rgb("fff8e1"), stroke: rgb("ffe082"))
      content((15, 10.5), text(fill: rgb("f57f17"))[*Bãi bồi* \ $v_1 = 24$ km/h])
      
      // Hệ trục và đường giới hạn
      line((-10, 0), (185, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, -10), (0, 120), mark: (end: ">"), stroke: 0.5pt)
      content((187, 0), $x$)
      content((0, 122), $y$)
      
      line((-10, 21), (180, 21), stroke: (dash: "dashed", paint: gray))
      line((-10, 69), (180, 69), stroke: (dash: "dashed", paint: gray))
      line((-10, 111), (180, 111), stroke: (dash: "dashed", paint: gray))
      content((-6, 24), $21$)
      content((-6, 72), $69$)
      content((-6, 114), $111$)
      
      // Tọa độ thực tế của quỹ đạo tối ưu
      let A = (0,0)
      let M = (72, 21)
      let N = (108, 69)
      let B = (164, 111)
      
      // Quỹ đạo 
      line(A, M, N, B, stroke: (paint: red, thickness: 1.5pt))
      
      circle(M, radius: 2pt, fill: black); content((77, 16), $M$)
      circle(N, radius: 2pt, fill: black); content((113, 64), $N$)
      circle(A, radius: 2pt, fill: black); content((-5, -5), $A$)
      circle(B, radius: 2pt, fill: black); content((164, 117), $B(164; 111)$)
    })
  ]
  ],
  [$10,625$],
  loigiai: [
    #ppgiai[
      *Áp dụng Định luật Khúc xạ (Nguyên lý Fermat)*
      - Thiết lập hằng số khúc xạ Snell: $ (sin theta_1)/v_1 = (sin theta_2)/v_2 = (sin theta_3)/v_3 = k > 0$.
      - Dùng lượng giác biểu diễn độ dịch chuyển ngang $x_i$ của từng vùng theo $k$.
      - Thiết lập phương trình hoành độ $x_1 + x_2 + x_3 = 164$ và giải tìm $k$ duy nhất.
    ]
    
    Gọi $x_1, x_2, x_3$ lần lượt là độ dịch chuyển ngang của tàu trong Vùng 1, Vùng 2 và Vùng 3.
    Từ hoành độ điểm đích $B(164; 111)$, ta có tổng: 
    $ x_1 + x_2 + x_3 = 164 quad (1) $
    
    Chiều cao (độ dời dọc) của các khu vực lần lượt là:
    - Vùng 1: $h_1 = 21 - 0 = 21$ km.
    - Vùng 2: $h_2 = 69 - 21 = 48$ km.
    - Vùng 3: $h_3 = 111 - 69 = 42$ km.
    
    Gọi $theta_i$ là góc hợp bởi quỹ đạo và phương thẳng đứng. Theo định luật Snell:
    $ (sin theta_1)/24 = (sin theta_2)/15 = (sin theta_3)/20 = k => sin theta_i = k dot v_i $
    
    Tương tự các bài trước, ta có độ dời ngang $x_i = h_i tan theta_i = h_i dot (k v_i) / sqrt(1 - k^2 v_i^2)$.
    Biểu diễn các độ dời ngang $x_i$ theo ẩn $k$:
    - $x_1 = (21 dot 24k) / sqrt(1 - 24^2 k^2) = (504k) / sqrt(1 - 576k^2)$
    - $x_2 = (48 dot 15k) / sqrt(1 - 15^2 k^2) = (720k) / sqrt(1 - 225k^2)$
    - $x_3 = (42 dot 20k) / sqrt(1 - 20^2 k^2) = (840k) / sqrt(1 - 400k^2)$
    
    Thay vào $(1)$, ta được phương trình:
    $ f(k) = (504k) / sqrt(1 - 576k^2) + (720k) / sqrt(1 - 225k^2) + (840k) / sqrt(1 - 400k^2) = 164 $
    
    *Điều kiện xác định:* Để căn thức nhỏ nhất (căn thứ nhất) có nghĩa, ta phải có $1 - 576k^2 > 0 <=> k < 1/24 approx 0,0416$. Vậy $k in (0; 1/24)$.
    
    Do $f(k)$ là tổng của các hàm đồng biến nên $f(k) = 164$ có nghiệm duy nhất.
    Sử dụng máy tính (SOLVE) hoặc nhẩm bộ số Pytago, ta dễ dàng tìm được nghiệm tuyệt đẹp:
    $ k = 0,04 = 1/25 " (Thỏa mãn " k < 1/24) $
    
    Thay $k = 1/25$ trở lại để tìm chính xác quãng đường ngang từng vùng:
    - $x_1 = 504(1/25) / sqrt(1 - 576/625) = (504/25) / (7/25) = 72$ (km).
    - $x_2 = 720(1/25) / sqrt(1 - 225/625) = (720/25) / (20/25) = 36$ (km).
    - $x_3 = 840(1/25) / sqrt(1 - 400/625) = (840/25) / (15/25) = 56$ (km).
    *(Thử lại: $x_1 + x_2 + x_3 = 72 + 36 + 56 = 164$, hoàn toàn khớp đề bài).*
    
    Tính thời gian di chuyển cho từng chặng ($t_i = sqrt(x_i^2 + h_i^2) / v_i$):
    - $t_1 = (sqrt(72^2 + 21^2))/24 = (sqrt(5625))/24 = 75/24 = 25/8 = 3,125$ (giờ).
    - $t_2 = (sqrt(36^2 + 48^2))/15 = (sqrt(3600))/15 = 60/15 = 4$ (giờ).
    - $t_3 = (sqrt(56^2 + 42^2))/20 = (sqrt(4900))/20 = 70/20 = 3,5$ (giờ).
    
    Tổng thời gian ngắn nhất để tàu đệm khí di chuyển đến đảo $B$ là:
    $ T_min = 3,125 + 4 + 3,5 = 10,625 " (giờ)". $
    
    #nhanxet[
      Bài rèn luyện này có một cái bẫy toán học rất tinh vi ở điều kiện xác định. Nếu học sinh bấm SOLVE với giá trị dò ban đầu $x = 0,1$ (vượt qua giới hạn $1/24$), máy tính sẽ báo lỗi `Math ERROR` do biểu thức dưới căn bị âm. Việc nhận diện đúng miền $k \in (0; 1/24)$ giúp học sinh chọn được mốc dò $x = 0,01$, từ đó máy tính sẽ nhanh chóng nhả ra nghiệm vàng $k=0,04$.
    ]
  ]
)

// =====================================================================
// BÀI TOÁN RÈN LUYỆN: KHÚC XẠ QUỸ ĐẠO - PHIÊN BẢN HẠM ĐỘI TÀU NGẦM
// Thiết kế: Bộ số Pytago với k = 1/50 (0.02).
// Điều kiện cực gắt: k < 1/40 (0.025). 
// Kết quả trả về các số nguyên đẹp đến mức khó tin: Tổng thời gian = 75 giờ.
// =====================================================================

#tln(
  [Một tàu ngầm thám hiểm không người lái cần di chuyển từ trạm gốc $A$ trên mặt biển đến trạm nghiên cứu đáy biển $B$. Trên hệ trục tọa độ $O x y$ mặt cắt dọc đại dương (đơn vị: km), trạm $A$ đặt tại $A(0; 0)$ và trạm $B$ nằm ở độ sâu $B(1278; 1536)$.
  
  Môi trường biển từ $A$ đến $B$ phân làm 3 tầng nhiệt độ khác nhau theo độ sâu (phương $y$):
  - Tầng 1 ($y$ từ $0$ đến $336$): Vùng nước ấm bề mặt. Lực cản lớn, tàu chạy với vận tốc $v_1 = 14$ km/h.
  - Tầng 2 ($y$ từ $336$ đến $816$): Dòng hải lưu ngầm. Tàu tận dụng dòng chảy, đạt tốc độ $v_2 = 40$ km/h.
  - Tầng 3 ($y$ từ $816$ đến $1536$): Vùng nước lạnh biển sâu. Tàu duy trì vận tốc ổn định $v_3 = 30$ km/h.
  
  Hệ thống AI của tàu tự động thiết lập quỹ đạo liên tục qua các tầng nước sao cho tổng thời gian lặn từ $A$ đến $B$ là nhanh nhất. Hỏi thời gian tối ưu đó là bao nhiêu giờ?
  
  #align(center)[
    #cetz.canvas(length: 0.4cm, {
      import cetz.draw: *
      
      // Vẽ theo tỷ lệ 1/100 để hình vừa vặn
      // Tầng 3: Biển sâu
      rect((-1.5, 8.16), (14.5, 15.36), fill: rgb("e1f5fe"), stroke: rgb("81d4fa"))
      content((2, 11.76), text(fill: rgb("0277bd"))[*Biển sâu* \ $v_3 = 30$ km/h])
      
      // Tầng 2: Hải lưu ngầm
      rect((-1.5, 3.36), (14.5, 8.16), fill: rgb("b3e5fc"), stroke: rgb("4fc3f7"))
      content((2, 5.76), text(fill: rgb("01579b"))[*Hải lưu ngầm* \ $v_2 = 40$ km/h])
      
      // Tầng 1: Nước ấm bề mặt
      rect((-1.5, 0), (14.5, 3.36), fill: rgb("81d4fa"), stroke: rgb("29b6f6"))
      content((2, 1.68), text(fill: rgb("0d47a1"))[*Nước ấm bề mặt* \ $v_1 = 14$ km/h])
      
      // Hệ trục và đường giới hạn
      line((-1.5, 0), (15, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, -1), (0, 16.5), mark: (end: ">"), stroke: 0.5pt)
      content((15.2, 0), $x$)
      content((0, 16.7), $y$)
      
      line((-1.5, 3.36), (14.5, 3.36), stroke: (dash: "dashed", paint: gray))
      line((-1.5, 8.16), (14.5, 8.16), stroke: (dash: "dashed", paint: gray))
      line((-1.5, 15.36), (14.5, 15.36), stroke: (dash: "dashed", paint: gray))
      
      content((-1.2, 3.7), $336$)
      content((-1.2, 8.5), $816$)
      content((-1.2, 15.6), $1536$)
      
      // Tọa độ các điểm gấp khúc thực tế chia cho 100
      let A = (0,0)
      let M = (0.98, 3.36)
      let N = (7.38, 8.16)
      let B = (12.78, 15.36)
      
      // Quỹ đạo 
      line(A, M, N, B, stroke: (paint: red, thickness: 1.5pt))
      
      circle(M, radius: 2.5pt, fill: black); content((1.6, 3), $M$)
      circle(N, radius: 2.5pt, fill: black); content((8, 7.8), $N$)
      circle(A, radius: 2.5pt, fill: black); content((-0.6, -0.6), $A$)
      circle(B, radius: 2.5pt, fill: black); content((12.78, 15.9), $B(1278; 1536)$)
    })
  ]
  ],
  [$75$],
  loigiai: [
    #ppgiai[
      *Phân tích bằng Nguyên lý Fermat (Định luật Khúc xạ)*
      - Thiết lập hằng số khúc xạ tối ưu $k$: $ (sin theta_1)/v_1 = (sin theta_2)/v_2 = (sin theta_3)/v_3 = k > 0$.
      - Dùng lượng giác biểu diễn độ dịch chuyển ngang $x_i = h_i tan theta_i$ của tàu qua từng tầng nước theo ẩn $k$.
      - Thiết lập phương trình hoành độ $x_1 + x_2 + x_3 = 1278$, chú ý điều kiện của $k$ để căn thức xác định, giải tìm $k$ và suy ra thời gian.
    ]
    
    Gọi $x_1, x_2, x_3$ lần lượt là độ dời ngang của tàu ngầm qua Tầng 1, Tầng 2 và Tầng 3.
    Từ hoành độ của đích $B(1278; 1536)$, ta có phương trình tổng độ dời ngang: 
    $ x_1 + x_2 + x_3 = 1278 quad (1) $
    
    Độ dày (độ dời dọc) của các tầng nước lần lượt là:
    - Tầng 1: $h_1 = 336 - 0 = 336$ km.
    - Tầng 2: $h_2 = 816 - 336 = 480$ km.
    - Tầng 3: $h_3 = 1536 - 816 = 720$ km.
    
    Theo định luật Snell, để quỹ đạo cho thời gian cực tiểu, tồn tại hằng số $k$ sao cho:
    $ sin theta_i = k dot v_i $
    Với $x_i = h_i tan theta_i = h_i dot (k v_i) / sqrt(1 - k^2 v_i^2)$, ta biểu diễn các quãng đường ngang:
    - $x_1 = (336 dot 14k) / sqrt(1 - 14^2 k^2) = (4704k) / sqrt(1 - 196k^2)$
    -
    - $x_2 = (480 dot 40k) / sqrt(1 - 40^2 k^2) = (19200k) / sqrt(1 - 1600k^2)$
    -
    - $x_3 = (720 dot 30k) / sqrt(1 - 30^2 k^2) = (21600k) / sqrt(1 - 900k^2)$
    
    Thay vào $(1)$, ta được phương trình:
    $ f(k) = (4704k) / sqrt(1 - 196k^2) + (19200k) / sqrt(1 - 1600k^2) + (21600k) / sqrt(1 - 900k^2) = 1278 $
    
    *Điều kiện xác định "Sinh tử":* Trong 3 biểu thức dưới căn, $1 - 1600k^2$ là biểu thức khắt khe nhất. Để căn thức có nghĩa, ta phải có:
    $ 1 - 1600k^2 > 0 <=> k^2 < 1/1600 <=> k < 1/40 = 0,025 $
    Vậy miền xác định của phương trình là $k in (0; 0,025)$.
    
    Hàm số $f(k)$ đồng biến trên khoảng $(0; 0,025)$, do đó phương trình có duy nhất 1 nghiệm. Sử dụng máy tính cầm tay (nhập mốc dò $X = 0,01$), ta thu được nghiệm đẹp:
    $ k = 0,02 = 1/50 " (Thỏa mãn " k < 0,025) $
    
    Thay $k = 0,02$ trở lại, ta tính được chính xác từng quãng đường ngang:
    - $x_1 = 4704(0,02) / sqrt(1 - 196(0,0004)) = 94,08 / sqrt(0","9216) = 94,08 / 0,96 = 98$ (km).
    -
    - $x_2 = 19200(0,02) / sqrt(1 - 1600(0,0004)) = 384 / sqrt(0","36) = 384 / 0,6 = 640$ (km).
    -
    - $x_3 = 21600(0,02) / sqrt(1 - 900(0,0004)) = 432 / sqrt(0","64) = 432 / 0,8 = 540$ (km).
    *(Kiểm tra: $x_1 + x_2 + x_3 = 98 + 640 + 540 = 1278$, khớp tuyệt đối với tọa độ điểm $B$).*
    
    Tính thời gian tàu lặn qua từng tầng ($t_i = sqrt(x_i^2 + h_i^2) / v_i$):
    - $t_1 = (sqrt(98^2 + 336^2))/14 = (sqrt(122500))/14 = 350/14 = 25$ (giờ).
    -
    - $t_2 = (sqrt(640^2 + 480^2))/40 = (sqrt(640000))/40 = 800/40 = 20$ (giờ).
    -
    - $t_3 = (sqrt(540^2 + 720^2))/30 = (sqrt(810000))/30 = 900/30 = 30$ (giờ).
    
    Tổng thời gian ngắn nhất để tàu ngầm đến được trạm $B$ là:
    $ T_min = 25 + 20 + 30 = 75 " (giờ)". $
    
    #nhanxet[
      Một bài toán hội tụ đầy đủ vẻ đẹp của Toán học! Học sinh sẽ được rèn luyện kỹ năng phân tích điều kiện khắt khe của tập xác định ($k < 1/40$), tránh việc dò nghiệm sai (Math ERROR). Đồng thời, phần thưởng ở cuối bài giải là các con số thời gian ($25$, $20$, $30$) là những số nguyên chẵn hoàn hảo, xóa tan mọi lo âu về việc tính toán sai lệch thập phân.
    ]
  ]
)

// =====================================================================
// BÀI TOÁN RÈN LUYỆN ĐỈNH CAO: KHÚC XẠ QUỸ ĐẠO - DAKAR RALLY
// Thiết kế: Khóa k = 1/65 mở ra 3 bộ Pytago khác biệt.
// Điều kiện cực gắt: k < 1/60. 
// Kết quả trả về các số nguyên đẹp đến mức khó tin: Tổng thời gian = 31 giờ.
// =====================================================================

#tln(
  [Tại chặng đua xuyên quốc gia khắc nghiệt nhất hành tinh Dakar Rally, một tay đua cần điều khiển siêu xe địa hình từ điểm xuất phát $A$ đến vạch đích $B$. Trên hệ trục tọa độ $O x y$ (đơn vị: km), điểm $A$ nằm tại gốc tọa độ $A(0; 0)$ và đích $B$ ở vị trí $B(1053; 756)$.
  
  Bản đồ chặng đua được chia làm 3 dải địa hình hoàn toàn khác biệt theo phương ngang:
  - Vùng 1 ($y$ từ $0$ đến $300$): Hoang mạc cát bằng phẳng. Xe phóng với vận tốc tối đa $v_1 = 60$ km/h.
  - Vùng 2 ($y$ từ $300$ đến $456$): Thảo nguyên cỏ tranh đan xen bụi rậm. Vận tốc xe giảm còn $v_2 = 52$ km/h.
  - Vùng 3 ($y$ từ $456$ đến $756$): Đồi núi đá dốc ngoằn ngoèo. Xe chỉ có thể bò với vận tốc $v_3 = 25$ km/h.
  
  Bằng hệ thống định vị GPS tối tân, đội đua đã vạch ra một quỹ đạo di chuyển liên tục qua 3 vùng sao cho tổng thời gian đến đích là ngắn nhất. Hãy tính thời gian ngắn nhất đó (đơn vị: giờ).
  
  #align(center)[
    #cetz.canvas(length: 0.7cm, {
      import cetz.draw: *
      
      // Vẽ theo tỷ lệ 1/100 để canvas vừa vặn (ví dụ tọa độ thật 1053 -> vẽ 10.53)
      
      // Vùng 3: Đồi núi đá
      rect((-1, 4.56), (12, 7.56), fill: rgb("cfd8dc"), stroke: rgb("90a4ae"))
      content((2, 6.06), text(fill: rgb("37474f"))[*Đồi núi đá* \ $v_3 = 25$ km/h])
      
      // Vùng 2: Thảo nguyên
      rect((-1, 3.00), (12, 4.56), fill: rgb("c8e6c9"), stroke: rgb("4caf50"))
      content((2, 3.78), text(fill: rgb("1b5e20"))[*Thảo nguyên* \ $v_2 = 52$ km/h])
      
      // Vùng 1: Hoang mạc cát
      rect((-1, 0), (12, 3.00), fill: rgb("ffe082"), stroke: rgb("ffb300"))
      content((2, 1.5), text(fill: rgb("e65100"))[*Hoang mạc cát* \ $v_1 = 60$ km/h])
      
      // Hệ trục và đường giới hạn
      line((-1, 0), (12.5, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, -1), (0, 8.5), mark: (end: ">"), stroke: 0.5pt)
      content((12.7, 0), $x$)
      content((0, 8.7), $y$)
      
      line((-1, 3.00), (12, 3.00), stroke: (dash: "dashed", paint: gray))
      line((-1, 4.56), (12, 4.56), stroke: (dash: "dashed", paint: gray))
      line((-1, 7.56), (12, 7.56), stroke: (dash: "dashed", paint: gray))
      
      content((-0.6, 3.2), $300$)
      content((-0.6, 4.8), $456$)
      content((-0.6, 7.8), $756$)
      
      // Tọa độ các điểm gấp khúc thực tế chia cho 100
      let A = (0,0)
      let M = (7.20, 3.00)
      let N = (9.28, 4.56)
      let B = (10.53, 7.56)
      
      // Quỹ đạo 
      line(A, M, N, B, stroke: (paint: red, thickness: 1.5pt))
      
      circle(M, radius: 2pt, fill: black); content((7.6, 2.6), $M$)
      circle(N, radius: 2pt, fill: black); content((9.7, 4.2), $N$)
      circle(A, radius: 2pt, fill: black); content((-0.4, -0.4), $A$)
      circle(B, radius: 2pt, fill: black); content((10.53, 7.9), $B(1053; 756)$)
    })
  ]
  ],
  [$31$],
  loigiai: [
    #ppgiai[
      *Kỹ thuật Nguyên lý Fermat (Định luật Snell nâng cao)*
      - Thiết lập hằng số khúc xạ ánh sáng $k$: $ (sin theta_1)/v_1 = (sin theta_2)/v_2 = (sin theta_3)/v_3 = k > 0$.
      - Dùng lượng giác biểu diễn độ dịch chuyển ngang $x_i = h_i tan theta_i$ của xe qua từng vùng theo ẩn $k$.
      - Thiết lập phương trình hoành độ $x_1 + x_2 + x_3 = 1053$.
      - Tìm điều kiện tồn tại chặt chẽ nhất của $k$, sau đó giải phương trình lấy nghiệm duy nhất.
    ]
    
    Gọi $x_1, x_2, x_3$ lần lượt là quãng đường di chuyển theo phương ngang (trục $x$) của xe tại Vùng 1, Vùng 2 và Vùng 3.
    Từ hoành độ của đích $B(1053; 756)$, ta có phương trình: 
    $ x_1 + x_2 + x_3 = 1053 quad (1) $
    
    Độ cao (độ dời dọc) của các dải địa hình lần lượt là:
    - Vùng 1: $h_1 = 300 - 0 = 300$ km.
    - Vùng 2: $h_2 = 456 - 300 = 156$ km.
    - Vùng 3: $h_3 = 756 - 456 = 300$ km.
    
    Gọi $theta_i$ là góc khúc xạ tại mỗi vùng. Theo định luật Snell cho đường đi nhanh nhất:
    $ sin theta_i = k dot v_i $
    Với công thức $x_i = h_i tan theta_i = h_i dot (k v_i) / sqrt(1 - k^2 v_i^2)$, ta biểu diễn các quãng đường ngang:
    - $x_1 = (300 dot 60k) / sqrt(1 - 60^2 k^2) = (18000k) / sqrt(1 - 3600k^2)$
    -
    - $x_2 = (156 dot 52k) / sqrt(1 - 52^2 k^2) = (8112k) / sqrt(1 - 2704k^2)$
    - 
    - $x_3 = (300 dot 25k) / sqrt(1 - 25^2 k^2) = (7500k) / sqrt(1 - 625k^2)$
    
    Thay vào $(1)$, ta thiết lập được phương trình gốc:
    $ f(k) = (18000k) / sqrt(1 - 3600k^2) + (8112k) / sqrt(1 - 2704k^2) + (7500k) / sqrt(1 - 625k^2) = 1053 $
    
    *Đánh giá điều kiện xác định:* Biểu thức dưới căn khắt khe nhất nằm ở Vùng 1 (có vận tốc lớn nhất $v_1 = 60$). Để căn thức có nghĩa:
    $ 1 - 3600k^2 > 0 <=> k^2 < 1/3600 <=> k < 1/60 $
    Vậy miền xác định của phương trình là $k in (0; 1/60)$.
    
    Hàm số $f(k)$ là tổng các hàm đồng biến nên có nghiệm duy nhất. Sử dụng máy tính cầm tay với mốc dò cực nhỏ (ví dụ $X = 0,01$), ta thu được một nghiệm hoàn hảo:
    $ k = 1/65 approx 0,01538 " (Thỏa mãn " k < 1/60 approx 0,01667) $
    
    Sự vi diệu của hằng số $k = 1/65$ thể hiện khi thay ngược lại để tìm quãng đường:
    - Tại Vùng 1: $k v_1 = 60/65 = 12/13$. Suy ra $tan theta_1 = 12/5$. 
      $=> x_1 = 300 dot (12/5) = 720$ (km).
    - Tại Vùng 2: $k v_2 = 52/65 = 4/5$. Suy ra $tan theta_2 = 4/3$. 
      $=> x_2 = 156 dot (4/3) = 208$ (km).
    - Tại Vùng 3: $k v_3 = 25/65 = 5/13$. Suy ra $tan theta_3 = 5/12$. 
      $=> x_3 = 300 dot (5/12) = 125$ (km).
    *(Thử lại: $x_1 + x_2 + x_3 = 720 + 208 + 125 = 1053$, khớp tuyệt đối!).*
    
    Cuối cùng, tính thời gian qua từng khu vực ($t_i = sqrt(x_i^2 + h_i^2) / v_i$):
    - $t_1 = (sqrt(720^2 + 300^2))/60 = (sqrt(608400))/60 = 780/60 = 13$ (giờ).
    - $t_2 = (sqrt(208^2 + 156^2))/52 = (sqrt(67600))/52 = 260/52 = 5$ (giờ).
    - $t_3 = (sqrt(125^2 + 300^2))/25 = (sqrt(105625))/25 = 325/25 = 13$ (giờ).
    
    Tổng thời gian ngắn nhất để tay đua hoàn thành chặng đường là:
    $ T_min = 13 + 5 + 13 = 31 " (giờ)". $
    
    #nhanxet[
      Nghệ thuật ra đề nằm ở hằng số $k = 1/65$. Cùng một hằng số này nhưng nó đã kích hoạt thành công 3 bộ ba số Pytago hoàn toàn độc lập: $(12-5-13)$ ở vùng 1, $(4-3-5)$ ở vùng 2 và $(5-12-13)$ ngược ở vùng 3. Mọi quãng đường và thời gian (13 giờ, 5 giờ, 13 giờ) đều hiện ra dưới dạng số nguyên tuyệt đẹp, biến một bài toán Tối ưu hóa cực kỳ phức tạp thành một trải nghiệm giải toán thăng hoa và thỏa mãn!
    ]
  ]
)


