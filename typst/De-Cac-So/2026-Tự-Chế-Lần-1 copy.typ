#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.0"
#import "@preview/cetz-plot:0.1.1"
#import "../bbt.typ": *
#import "../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue

// Standalone: math đen; beamer: màu toán do sang-beamer-theme tự xử lý
#show math.equation: set text(fill: black)
// Standalone: hàm câu hỏi từ sang-exam (beamer dùng hàm được truyền vào)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "THPT NGUYỄN HỮU CẢNH ",
  school: "ĐỀ THI THỬ LẦN 1 - 12C1",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "357",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════════════
// make-questions — exportable cho Beamer.typ, không cần --input beamer=1
// • Beamer.typ:  #import "...": make-questions; gọi với hàm beamer
// • Standalone:  gọi tự động ở cuối file này với tn-s, ds-s, ...
// ═══════════════════════════════════════════════════════════════════
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [
  // ═══════════════════════════════════════════════════════════
  // PHẦN I — Trắc nghiệm nhiều phương án lựa chọn
  // ═══════════════════════════════════════════════════════════
  // #image("UnT18.4.6.png")  // ví dụ chèn hình vào giữa đề
  #exam-part(
    [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
    count: 12,
  )
#tn(
    [Giá trị cực tiểu của hàm số $y = x^3 - 3x + 2$ bằng],
    (True([$0$]), [$4$], [$-1$], [$1$]),
    loigiai: [
      #ppgiai[
        - Tính đạo hàm $y'$.
        - Giải phương trình $y' = 0$ tìm các điểm tới hạn.
        - Dựa vào bảng biến thiên hoặc dùng đạo hàm bậc hai để xác định điểm cực tiểu và tính giá trị cực tiểu.
      ]
      
      Ta có đạo hàm:
      $ y' = 3x^2 - 3. $
      Cho $y' = 0 <=> 3x^2 - 3 = 0 <=> hoac(x &= 1 \ x &= -1).$
      
      Tính đạo hàm bậc hai: $y'' = 6x$.
      Tại $x = 1$, ta có $y''(1) = 6 > 0$, suy ra hàm số đạt cực tiểu tại $x = 1$.
      Giá trị cực tiểu của hàm số là:
      $ y_("CT") = y(1) = 1^3 - 3(1) + 2 = 0. $
      Vậy chọn đáp án *A*.
      
      #align(center)[
        #cetz.canvas(length: 0.7cm, {
          import cetz.draw: *
          line((-3,0), (3,0), mark: (end: ">")); content((3.2, 0), $x$)
          line((0,-1), (0,5), mark: (end: ">")); content((0, 5.2), $y$)
          content((-0.3, -0.3), $O$)
          
          let pts = ()
          for i in range(-20, 21) {
            let x = i / 10
            let y = x * x * x - 3 * x + 2
            pts.push((x, y))
          }
          line(..pts, stroke: (paint: blue, thickness: 1.2pt))
          
          line((-1,0), (-1,4), (0,4), stroke: (dash: "dashed", paint: gray))
          circle((-1,4), radius: 2pt, fill: red)
          circle((1,0), radius: 2pt, fill: red)
          
          content((-1, -0.4), $-1$)
          content((1, -0.4), $1$)
          content((-0.3, 4), $4$, anchor: "east")
        })
      ]
      
      #luuy[
        Cần phân biệt rõ giữa "điểm cực tiểu của hàm số" ($x=1$) và "giá trị cực tiểu của hàm số" ($y=0$). Rất nhiều học sinh hay nhầm lẫn khoanh đáp án D.
      ]
    ]
  )

  #tn(
    [Tập xác định của hàm số $y = ln(-x^2 + 5x - 6)$ là],
    (
      [$(-infinity; 2) union (3; +infinity)$],
      True([$(2; 3)$]),
      [$[2; 3]$],
      [$(-infinity; 2] union [3; +infinity)$]
    ),
    loigiai: [
      #ppgiai[
        - Hàm số logarit $y = log_a f(x)$ xác định khi và chỉ khi biểu thức dưới dấu logarit mang giá trị dương, tức là $f(x) > 0$.
        - Giải bất phương trình bậc hai bằng cách xét dấu tam thức.
      ]
      
      Hàm số đã cho xác định khi và chỉ khi:
      $ -x^2 + 5x - 6 > 0 $
      
      Xét tam thức bậc hai $f(x) = -x^2 + 5x - 6$.
      Cho $f(x) = 0 <=> hoac(x &= 2 \ x &= 3).$
      Hệ số $a = -1 < 0$, áp dụng quy tắc xét dấu "trong trái, ngoài cùng", ta có $f(x) > 0$ khi $x in (2; 3)$.
      
      Vậy tập xác định của hàm số là $D = (2; 3)$.
      Vậy chọn đáp án *B*.
      
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          line((-0.5, 0), (5.5, 0), mark: (end: ">")); content((5.7, 0), $x$)
          
          let pts = ()
          for i in range(12, 39) {
            let x = i / 10
            let y = -x*x + 5*x - 6
            pts.push((x, y * 3))
          }
          line(..pts, stroke: (paint: blue, thickness: 1.2pt))
          
          circle((2,0), radius: 2pt, fill: red)
          circle((3,0), radius: 2pt, fill: red)
          content((2, -0.3), $2$)
          content((3, -0.3), $3$)
          
          content((2.5, 0.4), [$+$], text: (fill: red, weight: "bold"))
          content((1.5, -0.3), [$-$], text: (fill: blue, weight: "bold"))
          content((3.5, -0.3), [$-$], text: (fill: blue, weight: "bold"))
        })
      ]
      
      #meo[
        Với bài toán trắc nghiệm tìm tập xác định, ta có thể dùng máy tính Casio để thử trực tiếp các giá trị đại diện của $x$. Ví dụ chọn $x = 2.5$ tính được kết quả (nhận B và C), chọn $x = 2$ máy báo lỗi Math Error (loại C). Từ đó chốt ngay đáp án B.
      ]
    ]
  )

  #tn(
    [Cho mặt cầu $(S)$ có diện tích bằng $36pi a^2$ ($a > 0$). Thể tích của khối cầu $(S)$ bằng],
    (
      [$108pi a^3$],
      [$12pi a^3$],
      [$72pi a^3$],
      True([$36pi a^3$])
    ),
    loigiai: [
      #ppgiai[
        - Thiết lập phương trình từ công thức diện tích mặt cầu $S = 4pi R^2$ để tìm bán kính $R$.
        - Thế bán kính $R$ vừa tìm được vào công thức thể tích khối cầu $V = 4/3 pi R^3$.
      ]
      
      Gọi $R$ là bán kính của mặt cầu $(S)$. Theo giả thiết, ta có:
      $ S = 4pi R^2 = 36pi a^2 <=> R^2 = 9a^2. $
      Vì bán kính $R > 0$ và $a > 0$, suy ra $R = 3a$.
      
      Thể tích của khối cầu $(S)$ là:
      $ V = 4/3 pi R^3 = 4/3 pi (3a)^3 = 4/3 pi dot 27a^3 = 36pi a^3. $
      Vậy chọn đáp án *D*.
      
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          circle((0,0), radius: 1.5, stroke: (paint: blue, thickness: 1.2pt), fill: rgb("e6f2ff"))
          arc((1.5,0), start: 0deg, stop: 180deg, radius: (1.5, 0.4), stroke: (dash: "dashed", paint: gray))
          arc((-1.5,0), start: 180deg, stop: 360deg, radius: (1.5, 0.4), stroke: (paint: blue, thickness: 1pt))
          
          circle((0,0), radius: 2pt, fill: red)
          content((0, -0.25), $I$, text: (fill: red))
          line((0,0), (1.5,0), stroke: (dash: "dashed", paint: red, thickness: 1pt))
          content((0.75, 0.2), $R=3a$, text: (fill: red, size: 10pt))
        })
      ]
      
      #luuy[
        Đọc kỹ đề bài để phân biệt công thức diện tích mặt cầu ($4pi R^2$) với công thức diện tích hình tròn mặt cắt ngang lớn nhất ($pi R^2$). Nhầm lẫn này sẽ dẫn đến kết quả sai $R = 6a$.
      ]
    ]
  )

  #tn(
    [Từ các chữ số $1, 2, 3, 4, 5, 6, 7$ có thể lập được bao nhiêu số tự nhiên gồm $3$ chữ số đôi một khác nhau?],
    (
      [$35$],
      True([$210$]),
      [$343$],
      [$120$]
    ),
    loigiai: [
      #ppgiai[
        - Số các số tự nhiên gồm $k$ chữ số đôi một khác nhau được chọn và sắp xếp từ tập hợp $n$ chữ số khác $0$ chính là số chỉnh hợp chập $k$ của $n$ phần tử.
        - Công thức: $A_n^k = (n!) / ((n-k)!)$.
      ]
      
      Tập hợp các chữ số đã cho có $n = 7$ phần tử và không chứa chữ số $0$.
      Mỗi số tự nhiên gồm $3$ chữ số đôi một khác nhau được lập từ tập hợp này tương ứng với một chỉnh hợp chập $3$ của $7$ phần tử.
      
      Số các số tự nhiên thỏa mãn yêu cầu bài toán là:
      $ A_7^3 = (7!) / ((7-3)!) = 7 dot 6 dot 5 = 210 " (số)". $
      Vậy chọn đáp án *B*.
      
      #nhanxet[
        Nếu đề bài bỏ đi cụm từ "đôi một khác nhau", mỗi vị trí đều có 7 cách chọn, kết quả sẽ là $7^3 = 343$ số. Hãy luôn gạch chân các từ khóa quan trọng trong đề toán Tổ hợp.
      ]
    ]
  )
 #tn(
  id: "1D5H2-3",
  [Khảo sát thời gian (phút) tự học ở nhà của $50$ học sinh lớp $11$, ta thu được bảng phân bố tần số ghép nhóm. Căn cứ vào biểu đồ hình chữ nhật mô tả mẫu số liệu ở hình bên, hãy tính tứ phân vị thứ nhất $Q_1$ của mẫu số liệu trên.],
  (
    True([$32,5$]),
    [$34,5$],
    [$25,5$],
    [$30,5$]
  ),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    
    // Hệ trục tọa độ
    line((-0.5, 0), (6.5, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt)
    content((6.5, -0.4), text(size: 10pt)[Thời gian])
    content((-0.75, 4.2), text(size: 10pt)[Tần số])
    
    // Các cột biểu đồ
    rect((0,0), (1, 1), fill: rgb("bbdefb"), stroke: 0.5pt+black)
    content((0.5, 1.3), $5$)
    
    rect((1,0), (2, 2.4), fill: rgb("bbdefb"), stroke: 0.5pt+black)
    content((1.5, 2.7), $12$)
    
    rect((2,0), (3, 3.6), fill: rgb("bbdefb"), stroke: 0.5pt+black)
    content((2.5, 3.9), $18$)
    
    rect((3,0), (4, 2), fill: rgb("bbdefb"), stroke: 0.5pt+black)
    content((3.5, 2.3), $10$)
    
    rect((4,0), (5, 1), fill: rgb("bbdefb"), stroke: 0.5pt+black)
    content((4.5, 1.3), $5$)
    
    // Đánh dấu mốc trên trục hoành
    content((0, -0.4), $0$)
    content((1, -0.4), $20$)
    content((2, -0.4), $40$)
    content((3, -0.4), $60$)
    content((4, -0.4), $80$)
    content((5, -0.4), $100$)
  }),
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    #ppgiai[
      - Từ biểu đồ, lập bảng tần số ghép nhóm và tính tần số tích lũy $c f_i$.
      - Xác định nhóm chứa tứ phân vị thứ nhất $Q_1$ dựa vào giá trị $n/4$.
      - Sử dụng công thức tính $Q_1 = L + (n/4 - c f_(p r e v))/f_Q dot c$ \
      Trong đó: $L$ là đầu mút trái, $c f_(p r e v)$ là tần số tích lũy của nhóm liền trước, $f_Q$ là tần số của nhóm chứa $Q_1$, $c$ là độ dài nhóm.
    ]

    Từ biểu đồ hình chữ nhật, ta đọc được mẫu số liệu ghép nhóm như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center,
        stroke: 0.5pt + luma(150),
        [Nhóm thời gian], $[0; 20)$, $[20; 40)$, $[40; 60)$, $[60; 80)$, $[80; 100)$,
        [Tần số ($f_i$)], [$5$], [$12$], [$18$], [$10$], [$5$],
        [Tần số tích lũy ($c f_i$)], [$5$], [$17$], [$35$], [$45$], [$50$]
      )
    ]
    
    Cỡ mẫu là $n = 50$. \
    Gọi $x_1, x_2, ldots, x_(50)$ là mẫu số liệu được xếp theo thứ tự không giảm.
    Tứ phân vị thứ nhất $Q_1$ là trung bình cộng của $x_(12)$ và $x_(13)$. Do hai giá trị này đều thuộc nhóm $[20; 40)$ nên nhóm chứa $Q_1$ là $[20; 40)$.
    
    Áp dụng công thức, ta có:
    - Đầu mút trái: $L = 20$.
    - Độ dài nhóm: $c = 40 - 20 = 20$.
    - Tần số của nhóm chứa $Q_1$: $f_2 = 12$.
    - Tần số tích lũy của nhóm liền trước: $c f_1 = 5$.
    
    $ Q_1 = 20 + (50/4 - 5)/12 dot 20 = 20 + (12,5 - 5)/12 dot 20 = 20 + 7,5/12 dot 20 = 32,5. $

    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Trục
        line((-0.5, 0), (6.5, 0), mark: (end: ">"), stroke: 0.8pt)
        line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt)
        
        // Vẽ lại các cột, tô đậm cột chứa Q1
        rect((0,0), (1, 1), fill: rgb("bbdefb"), stroke: 0.5pt+black)
        rect((1,0), (2, 2.4), fill: rgb("ffcdd2"), stroke: 1pt+rgb("c62828")) // Cột chứa Q1
        content((1.5, 1.2), text(fill: rgb("c62828"), weight: "bold")[Nhóm \ chứa $Q_1$])
        rect((2,0), (3, 3.6), fill: rgb("bbdefb"), stroke: 0.5pt+black)
        rect((3,0), (4, 2), fill: rgb("bbdefb"), stroke: 0.5pt+black)
        rect((4,0), (5, 1), fill: rgb("bbdefb"), stroke: 0.5pt+black)
        
        // Nhãn
        content((0, -0.4), $0$)
        content((1, -0.4), $20$)
        content((2, -0.4), $40$)
        content((3, -0.4), $60$)
        content((4, -0.4), $80$)
        content((5, -0.4), $100$)
      })
    ]

    #luuy[Nhiều học sinh thường nhầm lẫn giữa vị trí của tứ phân vị ($n/4 = 12,5$) và giá trị của tứ phân vị. Cần phải dựa vào tần số tích lũy để khoanh vùng đúng nhóm trước khi áp dụng công thức nội suy.]
  ]
)
 #tn(
    [Trong không gian với hệ tọa độ $O x y z$, mặt phẳng $(P)$ chứa trục $O x$ và vuông góc với mặt phẳng $(alpha): x - 2y + 2z + 3 = 0$ có phương trình là],
    (
      True([$y + z = 0$]),
      [$y - z = 0$],
      [$x + y + z = 0$],
      [$2y + z = 0$]
    ),
    loigiai: [
      #ppgiai[
        Mặt phẳng $(P)$ chứa trục $O x$ nên có một vectơ chỉ phương là $vect(u) = (1;0;0)$.
        Vì $(P) perp (alpha)$ nên một vectơ pháp tuyến của $(alpha)$ cũng là một vectơ chỉ phương của $(P)$.
        Tích có hướng của hai vectơ này sẽ cho ra vectơ pháp tuyến của $(P)$.
      ]

      Mặt phẳng $(alpha)$ có vectơ pháp tuyến:
      $ vect(n)_alpha = (1; -2; 2). $
      Một vectơ pháp tuyến của $(P)$ vuông góc với cả $vect(u) = (1;0;0)$ và $vect(n)_alpha = (1;-2;2)$, nên ta có thể chọn:
      $ vect(n)_P = [vect(u), vect(n)_alpha] = (0; -2; -2). $
      Chọn $vect(n) = (0; 1; 1)$ làm vectơ pháp tuyến của $(P)$.
      
      Vì $(P)$ chứa trục $O x$ nên đi qua gốc tọa độ $O(0;0;0)$.
      Suy ra phương trình của $(P)$ là:
      $ 0(x - 0) + 1(y - 0) + 1(z - 0) = 0 <=> y + z = 0. $
      Vậy chọn đáp án *A*.

      #nhanxet[
        Trục $O x$ có phương trình là $y = 0, z = 0$. Mặt phẳng chứa trục $O x$ luôn có dạng $B y + C z = 0$. Kết hợp điều kiện vuông góc $1 dot 0 + B(-2) + C(2) = 0 => B = C$, chọn $B=C=1$ ta được $y+z=0$.
      ]
    ]
  )

  #tn(
    [Trong không gian với hệ tọa độ $O x y z$, cho mặt phẳng $(P): x - 2y + 2z - 3 = 0$. Đường thẳng nào dưới đây song song với mặt phẳng $(P)$?],
    (
      [$(x - 1)/1 = (y + 2)/1 = (z - 3)/1$],
      [$(x + 1)/1 = (y - 2)/2 = (z + 1)/1$],
      [$(x - 2)/1 = (y + 1)/1 = (z - 4)/(-1)$],
      True([$(x + 1)/2 = y/2 = z/1$])
    ),
    loigiai: [
      #ppgiai[
        Một đường thẳng $d$ song song với mặt phẳng $(P)$ khi vectơ chỉ phương $vect(u)_d$ của nó vuông góc với vectơ pháp tuyến $vect(n)_P$ của mặt phẳng và một điểm bất kỳ thuộc đường thẳng không nằm trong mặt phẳng.
      ]

      Mặt phẳng $(P)$ có vectơ pháp tuyến:
      $ vect(n) = (1; -2; 2). $
      Với đường thẳng ở đáp án D, vectơ chỉ phương là:
      $ vect(u) = (2; 2; 1). $
      Ta kiểm tra tích vô hướng:
      $ vect(n) dot vect(u) = 1 dot 2 + (-2) dot 2 + 2 dot 1 = 2 - 4 + 2 = 0. $
      Vậy $vect(u) perp vect(n)$. 
      
      Lấy điểm $M(-1; 0; 0)$ thuộc đường thẳng D, thay tọa độ $M$ vào phương trình mặt phẳng $(P)$:
      $ -1 - 2 dot 0 + 2 dot 0 - 3 = -4 != 0. $
      Suy ra $M limits(cancel(in)) (P)$.
      Vậy đường thẳng ở đáp án D song song với mặt phẳng $(P)$.
      Chọn đáp án *D*.

      #luuy[
        Rất nhiều học sinh chỉ kiểm tra $vect(n) dot vect(u) = 0$ mà quên kiểm tra điểm thuộc mặt phẳng, dễ bị nhầm với trường hợp đường thẳng nằm hoàn toàn trong mặt phẳng.
      ]
    ]
  )
#tn(
    [Cho hình chóp $S. A B C D$ có đáy $A B C D$ là hình vuông cạnh $a$, $S A perp (A B C D)$. Góc giữa mặt phẳng $(S C D)$ và $(A B C D)$ bằng $60^o$. Thể tích khối chóp $S. A B C D$ là],
    (
      [$a^3/3$.],
      True([$(a^3 sqrt(3))/3$.]),
      [$a^3 sqrt(3)$.],
      [$(a^3)/6$.],
    ),
    loigiai: [
      Góc giữa $(S C D)$ và $(A B C D)$ là góc $S D A = 60^o$ (vì $C D perp A D$ và $C D perp S A => C D perp (S A D) => (S C D) perp (S A D)$...).
      Trong $Delta S A D$ vuông tại A: $S A = A D dot tan 60^o = a sqrt(3)$.
      Thể tích khối chóp $V = 1/3 S_(A B C D) dot S A = 1/3 a^2 dot a sqrt(3) = (a^3 sqrt(3))/3$.
      Chọn đáp án *B*.
    ]
  )
  #tn(
    [Cho cấp số nhân $(u_n)$ có các số hạng dương, biết $u_2 = 6$ và $u_5 = 48$. Tổng $S_6 = u_1 + u_2 + ... + u_6$ bằng],
    (
      [$96$],
      [$126$],
      True([$189$]),
      [$192$]
    ),
    loigiai: [
      #ppgiai[
        - Với cấp số nhân, số hạng tổng quát: $u_n = u_1 q^(n-1)$.
        - Từ $u_2$ và $u_5$ lập hệ phương trình để tìm công bội $q$, sau đó tính $u_1$.
        - Dùng công thức tính tổng $n$ số hạng đầu tiên: $S_n = u_1 (q^n - 1)/(q - 1)$.
      ]

      Ta có hệ phương trình:
      $ heva(
        u_2 &= u_1 q = 6 \
        u_5 &= u_1 q^4 = 48
      ) $
      Lấy phương trình dưới chia cho phương trình trên vế theo vế, ta được:
      $ q^3 = u_5/u_2 = 48/6 = 8 <=> q = 2. $
      Khi đó:
      $ u_1 = 6/2 = 3. $
      Tổng sáu số hạng đầu tiên của cấp số nhân là:
      $ S_6 = u_1 (q^6 - 1)/(q - 1) = 3 dot (2^6 - 1)/(2 - 1) = 3(64 - 1) = 3 dot 63 = 189. $
      Vậy chọn đáp án *C*.

      #meo[
        Khi đã tìm được $u_1 = 3$ và $q = 2$, có thể dùng tính năng tính tổng trên máy tính Casio: $sum_(x=1)^6 (3 dot 2^(x-1))$ để có ngay kết quả chính xác mà không cần nhớ công thức tổng.
      ]
    ]
  )

  #tn(
    [Tập nghiệm của phương trình $2sin x = sqrt(3)$ là],
    (
      [$S = {pi/3 + k pi, k in ZZ}$],
      [$S = {2pi/3 + k pi, k in ZZ}$],
      True([$S = {pi/3 + k 2pi; 2pi/3 + k 2pi, k in ZZ}$]),
      [$S = {pi/6 + k 2pi; 5pi/6 + k 2pi, k in ZZ}$]
    ),
    loigiai: [
      #ppgiai[
        - Đưa phương trình về dạng cơ bản $sin x = m$.
        - Áp dụng công thức nghiệm: $sin x = sin alpha <=> hoac(x &= alpha + k 2pi , x &= pi - alpha + k 2pi) (k in ZZ)$.
      ]

      Ta có:
      $ 2sin x = sqrt(3) <=> sin x = sqrt(3)/2 <=> sin x = sin (pi/3). $
      Áp dụng công thức nghiệm, ta được:
      $ hoac(x &= pi/3 + k 2pi , x &= pi - pi/3 + k 2pi) <=> hoac(x &= pi/3 + k 2pi , x &= 2pi/3 + k 2pi), quad k in ZZ. $
      Vậy tập nghiệm của phương trình là $S = {pi/3 + k 2pi; 2pi/3 + k 2pi, k in ZZ}$.
      Vậy chọn đáp án *C*.

      #luuy[
        Chu kì của hàm số $y = sin x$ là $2pi$, cần phân biệt với hàm số $y = tan x$ và $y = cot x$ có chu kì $pi$ để không chọn nhầm các đáp án A hoặc B.
      ]
    ]
  )

  #tn(
    [Đường cong trong hình bên là đồ thị của hàm số nào dưới đây?],
    (
      True([$y = x^3 - 3x + 1$]),
      [$y = -x^3 + 3x + 1$],
      [$y = x^3 - 3x^2 + 1$],
      [$y = -x^3 + 3x^2 + 1$]
    ),
    fig: cetz.canvas(length: 0.7cm, {
      import cetz.draw: *

      line((-2.5, 0), (2.5, 0), mark: (end: ">"))
      content((2.5, 0.35), $x$)
      line((0, -2), (0, 3.5), mark: (end: ">"))
      content((0.3, 3.5), $y$)
      content((-0.25, -0.25), $O$)

      line((-1, 0.1), (-1, -0.1))
      content((-1, -0.4), $-1$)
      line((1, 0.1), (1, -0.1))
      content((1, -0.4), $1$)
      line((2, 0.1), (2, -0.1))
      content((2, -0.4), $2$)

      line((0.1, 1), (-0.1, 1))
      content((-0.35, 1), $1$)
      line((0.1, 3), (-0.1, 3))
      content((-0.35, 3), $3$)
      line((0.1, -1), (-0.1, -1))
      content((-0.4, -1), $-1$)

      let pts = ()
      for i in range(-40, 41) {
        let x = i / 20.0
        let y = x * x * x - 3 * x + 1
        pts.push((x, y))
      }
      line(..pts, stroke: 1.2pt + blue)
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        Nhận diện đồ thị hàm số bậc ba:
        - Dựa vào giới hạn khi $x -> +infinity$ để xác định dấu hệ số $a$.
        - Dựa vào giao điểm với trục tung để xác định hệ số tự do $d$.
        - Dựa vào tọa độ các điểm cực trị để loại trừ các đáp án còn lại.
      ]

      Từ đồ thị ta nhận thấy:
      - Nhánh cuối cùng phía bên phải hướng lên trên, nên $lim_(x -> +infinity) y = +infinity => a > 0$. Ta loại được các đáp án B và D.
      - Đồ thị hàm số đi qua điểm $(0; 1)$, cả phương án A và C đều thỏa mãn.
      - Đồ thị có hai điểm cực trị là $(-1; 3)$ và $(1; -1)$, tức là đạo hàm $y' = 0$ tại $x = 1$ và $x = -1$.
        - Với đáp án A: $y = x^3 - 3x + 1 => y' = 3x^2 - 3$. Cho $y' = 0 <=> x = plus.minus 1$ (thỏa mãn).
        - Với đáp án C: $y = x^3 - 3x^2 + 1 => y' = 3x^2 - 6x$. Cho $y' = 0 <=> hoac(x &= 0 \ x &= 2)$ (không thỏa mãn).
        
      Vậy đồ thị đã cho là của hàm số: $y = x^3 - 3x + 1$.
      Chọn đáp án *A*.

      #giainhanh[
        Đồ thị hàm số bậc 3 nhận điểm uốn làm tâm đối xứng. Trung điểm của hai điểm cực trị $(-1; 3)$ và $(1; -1)$ là điểm $(0; 1)$ nằm ngay trên trục tung. Vậy phương trình đạo hàm bậc hai $y''=0$ có nghiệm $x=0$, suy ra hệ số của $x^2$ phải bằng $0$. Chỉ có đáp án A thỏa mãn.
      ]
    ]
  )

  #tn(
    [Tập nghiệm của bất phương trình $log_2(x - 1) + log_2(x + 3) <= 3$ là],
    (
      [$(1; +infinity)$],
      True([$(1; -1 + 2sqrt(3)]$]),
      [$[-1 - 2sqrt(3); -1 + 2sqrt(3)]$],
      [$(1; 3]$]
    ),
    loigiai: [
      #ppgiai[
        - Tìm điều kiện xác định của biểu thức lôgarit.
        - Gộp hai biểu thức lôgarit cùng cơ số bằng công thức $log_a b + log_a c = log_a(b c)$.
        - Đưa về bất phương trình đại số cơ bản: $log_a f(x) <= m <=> f(x) <= a^m$ (với $a > 1$).
      ]

      Điều kiện xác định:
      $ heva(x - 1 > 0 \ x + 3 > 0) <=> x > 1. $
      
      Với điều kiện trên, bất phương trình tương đương với:
      $ log_2((x - 1)(x + 3)) <= 3 $
      $ <=> (x - 1)(x + 3) <= 2^3 $
      $ <=> x^2 + 2x - 3 <= 8 $
      $ <=> x^2 + 2x - 11 <= 0. $
      
      Xét phương trình $x^2 + 2x - 11 = 0$, có hai nghiệm là $x = -1 plus.minus 2sqrt(3)$.
      Bất phương trình bậc hai tương đương:
      $ -1 - 2sqrt(3) <= x <= -1 + 2sqrt(3). $
      
      Kết hợp với điều kiện xác định $x > 1$, ta được tập nghiệm:
      $ 1 < x <= -1 + 2sqrt(3). $
      Vậy tập nghiệm là $S = (1; -1 + 2sqrt(3)]$.
      Chọn đáp án *B*.

      #luuy[
        Nhiều học sinh thường quên đặt điều kiện xác định $x > 1$ trước khi gộp lôgarit, dẫn đến chọn sai đáp án C. Hãy luôn nhớ tìm ĐKXĐ trước tiên!
      ]
    ]
  )
  // ═══════════════════════════════════════════════════════════
  // PHẦN II — Trắc nghiệm đúng/sai
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: auto)
  #ds(
    [Trong không gian với hệ tọa độ $O x y z$, cho mặt cầu $(S): (x-1)^2 + (y-2)^2 + (z-3)^2 = 25$ và mặt phẳng $(P): 2x - 2y + z + 8 = 0$. Xét tính đúng sai của các mệnh đề sau:],
    (
      True([Bán kính của mặt cầu $(S)$ bằng $5$.]),
      [Điểm $A(1; 2; 8)$ nằm bên ngoài khối cầu $(S)$.],
      True([Mặt phẳng $(P)$ cắt mặt cầu $(S)$ theo một đường tròn có bán kính $r = 4$.]),
      True([Gọi $(C)$ là đường tròn giao tuyến của $(P)$ và $(S)$. Thể tích khối nón có đỉnh là tâm $I$ của mặt cầu và đáy là hình tròn $(C)$ bằng $16pi$.]),
    ),
    loigiai: [
      #ppgiai[
        - Phương trình mặt cầu $(x-a)^2 + (y-b)^2 + (z-c)^2 = R^2$ có tâm $I(a;b;c)$ và bán kính $R$.
        - Vị trí tương đối của điểm và mặt cầu: Tính độ dài $I A$, so sánh với $R$.
        - Mối liên hệ giữa mặt phẳng cắt mặt cầu: $r = sqrt(R^2 - d^2)$, trong đó $d = d(I, (P))$ là khoảng cách từ tâm đến mặt phẳng, $r$ là bán kính đường tròn giao tuyến.
        - Thể tích khối nón: $V = 1/3 pi r^2 h$.
      ]

      *Ý a)* Từ phương trình mặt cầu $(S)$, ta suy ra tâm $I(1; 2; 3)$ và bán kính $R = sqrt(25) = 5$.
      Vậy mệnh đề a *đúng*.

      *Ý b)* Ta tính khoảng cách từ tâm $I(1; 2; 3)$ đến điểm $A(1; 2; 8)$:
      $
        I A = sqrt((1-1)^2 + (2-2)^2 + (8-3)^2) = sqrt(0 + 0 + 25) = 5 = R.
      $
      Vì $I A = R$ nên điểm $A$ nằm trên mặt cầu $(S)$, không nằm ngoài khối cầu.
      Vậy mệnh đề b *sai*.

      *Ý c)* Khoảng cách từ tâm $I$ đến mặt phẳng $(P)$ là:
      $
        d = d(I, (P)) = |2(1) - 2(2) + 3 + 8|/sqrt(2^2 + (-2)^2 + 1^2) = |9|/sqrt(9) = 3.
      $
      Vì $d = 3 < R = 5$ nên mặt phẳng $(P)$ cắt mặt cầu $(S)$ theo giao tuyến là một đường tròn. 
      Bán kính đường tròn giao tuyến là:
      $
        r = sqrt(R^2 - d^2) = sqrt(5^2 - 3^2) = 4.
      $
      Vậy mệnh đề c *đúng*.

      *Ý d)* Khối nón có đỉnh là tâm $I$, đáy là hình tròn $(C)$.
      Chiều cao của khối nón chính là khoảng cách từ tâm $I$ đến mặt phẳng $(P)$, suy ra $h = d = 3$.
      Bán kính đáy của khối nón là bán kính giao tuyến $r = 4$.
      Thể tích khối nón là:
      $
        V = 1/3 pi r^2 h = 1/3 pi dot 4^2 dot 3 = 16pi.
      $
      Vậy mệnh đề d *đúng*.

      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          
          let R_sphere = 2.5
          let d_dist = 1.5
          let r_circle = 2 // sqrt(2.5^2 - 1.5^2) = 2

          // Mặt cầu
          circle((0,0), radius: R_sphere, fill: rgb("e6f2ff"), stroke: 1pt + blue)
          arc((R_sphere,0), start: 0deg, stop: 180deg, radius: (R_sphere, 0.6), stroke: (dash: "dashed", paint: gray))
          arc((-R_sphere,0), start: 180deg, stop: 360deg, radius: (R_sphere, 0.6), stroke: 1pt + blue)

          // Đường tròn giao tuyến
          circle((0, d_dist), radius: (r_circle, r_circle*0.25), fill: rgb("ccffcc99"), stroke: 1pt + green)

          // Các điểm tâm
          circle((0,0), radius: 2pt, fill: red)
          content((0.2, -0.2), $I$)

          circle((0,d_dist), radius: 2pt, fill: red)
          content((-0.3, d_dist+0.2), $H$)

          // Các đường sinh của nón và chiều cao
          line((0,0), (-r_circle, d_dist), stroke: (dash: "dashed", paint: red))
          line((0,0), (r_circle, d_dist), stroke: (dash: "dashed", paint: red))
          line((0,0), (0, d_dist), stroke: (dash: "dashed", paint: red))
          line((0,d_dist), (r_circle, d_dist), stroke: (dash: "dashed", paint: red))

          // Ghi chú đại lượng
          content((r_circle/2, d_dist + 0.3), $r$, fill: red)
          content((0.2, d_dist/2), $d$, fill: red)
          content((r_circle/2 + 0.2, d_dist/2), $R$, fill: red)
        })
      ]

      #meo[
        Bài toán về thiết diện của mặt cầu cắt bởi mặt phẳng luôn xoay quanh tam giác vuông tạo bởi: *bán kính mặt cầu ($R$)*, *khoảng cách từ tâm đến mặt phẳng ($d$)*, và *bán kính đường tròn giao tuyến ($r$)*. Nắm vững bộ ba Pythagore quen thuộc $(3, 4, 5)$ sẽ giúp nhẩm nhanh kết quả.
      ]
    ]
  )
  
  #ds(
  [Tại trường THPT Nguyễn Hữu Cảnh, nhà trường triển khai ứng dụng EduAI Connect để hỗ trợ học tập và quản lý nề nếp. Thống kê toàn trường cho thấy tỉ lệ học sinh các khối 10, 11 và 12 lần lượt là $30%$, $35%$ và $35%$. Qua khảo sát thói quen sử dụng, người ta thấy rằng tỉ lệ học sinh cài đặt và sử dụng ứng dụng này thường xuyên ở khối 10 là $90%$, khối 11 là $80%$ và khối 12 là $60%$. 
  
  Chọn ngẫu nhiên một học sinh của trường để phỏng vấn. Dựa vào mô hình xác suất trên, xét tính đúng sai của các mệnh đề sau:],
  (
    True([Xác suất để học sinh được chọn là học sinh khối 10 và có sử dụng ứng dụng EduAI Connect thường xuyên bằng $0,27$.]),
    [Xác suất để học sinh được chọn có sử dụng ứng dụng EduAI Connect thường xuyên trên toàn trường là $0,75$.],
    True([Biết rằng học sinh được chọn có sử dụng ứng dụng thường xuyên. Xác suất để học sinh đó thuộc khối 11 là $7/19$.]),
    True([Thầy giám thị gặp một học sinh không sử dụng ứng dụng thường xuyên. Khả năng học sinh này thuộc khối 12 cao gấp $2$ lần khả năng học sinh này thuộc khối 11.])
  ),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *

    let style-root = (frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)
    let style-node = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    let lbl = (frame: "rect", fill: white, padding: 1pt, stroke: none)

    // Nút gốc
    content((0, 0), text(size: 10pt)[Học sinh\ THPT NHC], name: "root", ..style-root)

    // Tầng 1: Khối lớp (3 nhánh)
    content((3.5, 2.5), [Khối 10], name: "k10", ..style-node)
    content((3.5, 0), [Khối 11], name: "k11", ..style-node)
    content((3.5, -2.5), [Khối 12], name: "k12", ..style-node)

    line("root", "k10", mark: (end: ">", fill: black)); content((1.8, 1.6), text(size: 9pt)[$0,30$], ..lbl)
    line("root", "k11", mark: (end: ">", fill: black)); content((1.8, 0.2), text(size: 9pt)[$0,35$], ..lbl)
    line("root", "k12", mark: (end: ">", fill: black)); content((1.8, -1.6), text(size: 9pt)[$0,35$], ..lbl)

    // Tầng 2: Hành vi sử dụng (6 lá)
    let style-yes = (frame: "rect", padding: 3pt, stroke: 0.5pt + rgb("388e3c"), fill: rgb("e8f5e9"), radius: 2pt)
    let style-no = (frame: "rect", padding: 3pt, stroke: 0.5pt + rgb("d32f2f"), fill: rgb("ffebee"), radius: 2pt)

    // Khối 10
    content((7.5, 3.2), [Dùng thường xuyên], name: "y10", ..style-yes)
    content((7.5, 1.8), [Ít dùng], name: "n10", ..style-no)
    line("k10", "y10", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,90$], ..lbl)
    line("k10", "n10", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 1.9), text(fill: red, size: 9pt)[$0,10$], ..lbl)

    // Khối 11
    content((7.5, 0.7), [Dùng thường xuyên], name: "y11", ..style-yes)
    content((7.5, -0.7), [Ít dùng], name: "n11", ..style-no)
    line("k11", "y11", mark: (end: ">", fill: black)); content((5.5, 0.6), text(size: 9pt)[$0,80$], ..lbl)
    line("k11", "n11", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, -0.6), text(fill: red, size: 9pt)[$0,20$], ..lbl)

    // Khối 12
    content((7.5, -1.8), [Dùng thường xuyên], name: "y12", ..style-yes)
    content((7.5, -3.2), [Ít dùng], name: "n12", ..style-no)
    line("k12", "y12", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,60$], ..lbl)
    line("k12", "n12", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, -3.1), text(fill: red, size: 9pt)[$0,40$], ..lbl)
  }),
  fig-pos: "center",
  fig-width: 90%,
  loigiai: [
    #ppgiai[
      - Đây là mô hình cây xác suất kiểu $1-3-6$ (1 gốc $->$ 3 nhánh khối $->$ 6 kết quả sử dụng).
      - Ta áp dụng "Tư duy phá án" để giải: Xem việc "Phân loại học sinh" là dựng lại hiện trường, và việc "Xác suất là khối mấy khi biết thói quen sử dụng" là quá trình truy vết ngược (Công thức Bayes).
      - Gọi $A_1, A_2, A_3$ lần lượt là các biến cố "Học sinh thuộc khối 10, 11, 12".
        $=> P(A_1) = 0,30; quad P(A_2) = 0,35; quad P(A_3) = 0,35$.
      - Gọi $B$ là biến cố "Học sinh sử dụng ứng dụng EduAI Connect thường xuyên".
      - Xác suất có điều kiện: $P(B|A_1) = 0,90; quad P(B|A_2) = 0,80; quad P(B|A_3) = 0,60$.
      - Xác suất toàn phần: $P(B) = P(A_1)P(B|A_1) + P(A_2)P(B|A_2) + P(A_3)P(B|A_3)$.
    ]

    *Ý a) Đúng.* \
    Xác suất để học sinh được chọn thuộc khối 10 và có sử dụng ứng dụng thường xuyên chính là xác suất của nhánh đầu tiên:
    $ P(A_1 cap B) = P(A_1) dot P(B|A_1) = 0,30 dot 0,90 = 0,27. $

    *Ý b) Sai.* \
    Áp dụng công thức xác suất toàn phần, tỉ lệ học sinh sử dụng ứng dụng thường xuyên trên toàn trường là tổng của $3$ nhánh "Dùng thường xuyên":
    $ P(B) &= P(A_1 cap B) + P(A_2 cap B) + P(A_3 cap B) \
           &= 0,30 dot 0,90 + 0,35 dot 0,80 + 0,35 dot 0,60 \
           &= 0,27 + 0,28 + 0,21 = 0,76. $
    Do $0,76 != 0,75$, mệnh đề b sai.

    *Ý c) Đúng.* \
    Đây là bài toán truy vết ngược (Bayes). Biết rằng học sinh đó có dùng App thường xuyên (đã xảy ra $B$), xác suất để học sinh đó học khối 11 ($A_2$) là:
    $ P(A_2|B) = (P(A_2 cap B))/(P(B)) = (0,28)/(0,76) = 28/76 = 7/19. $

    *Ý d) Đúng.* \
    Gọi $overline(B)$ là biến cố "Học sinh ít dùng/không dùng ứng dụng thường xuyên". Xác suất toàn phần của $overline(B)$ là:
    $ P(overline(B)) = 1 - P(B) = 1 - 0,76 = 0,24. $
    Khả năng một học sinh ít dùng App thuộc khối 11 là:
    $ P(A_2|overline(B)) = (P(A_2) dot P(overline(B)|A_2))/(P(overline(B))) = (0,35 dot (1-0,80))/(0,24) = (0,35 dot 0,20)/0,24 = 0,07/0,24. $
    Khả năng một học sinh ít dùng App thuộc khối 12 là:
    $ P(A_3|overline(B)) = (P(A_3) dot P(overline(B)|A_3))/(P(overline(B))) = (0,35 dot (1-0,60))/(0,24) = (0,35 dot 0,40)/0,24 = 0,14/0,24. $
    Lập tỉ lệ so sánh:
    $ (P(A_3|overline(B)))/(P(A_2|overline(B))) = (0,14/0,24) / (0,07/0,24) = (0,14)/(0,07) = 2. $
    Khả năng thuộc khối 12 cao gấp đúng 2 lần khối 11. Mệnh đề d đúng.

    #nhanxet[
      Trong các bài toán cây xác suất nhiều lớp (như $1-3-6$), việc vẽ sơ đồ cây giúp ta trực quan hoá toàn bộ không gian mẫu. Quá trình tính xác suất hậu nghiệm (Ý c và Ý d) giống hệt tư duy "phá án": Ta thấy hậu quả là "Học sinh không dùng app", và ta lần ngược lại xem "thủ phạm" có khả năng cao nhất nằm ở khối nào. Từ đó, nhà trường có thể tập trung các giải pháp đôn đốc cụ thể cho khối 12.
    ]
  ]
)

  // #ds(
  //   [Một chất điểm chuyển động dọc theo trục $O x$. Tọa độ của chất điểm tại thời điểm $t$ (giây) được cho bởi $x(t) = 5t^3 e^(-t)$ với $t >= 0$. Xét tính đúng sai của các mệnh đề sau.],
  //   (
  //     [Vận tốc xuất phát của chất điểm bằng $5$ m/s.],
  //     True([Chất điểm chỉ đổi chiều chuyển động đúng một lần, tại thời điểm $t = 3$.]),
  //     True([Khoảng cách xa nhất của chất điểm tới gốc tọa độ bằng $135e^(-3)$ m.]),
  //     [Tổng quãng đường chất điểm đi được bằng $135e^(-3)$ m.],
  //   ),
  //   loigiai: [
  //     #ppgiai[
  //       Tính vận tốc bằng đạo hàm $v(t) = x'(t)$, sau đó xét dấu của $v(t)$.
  //       Vì $x(t) >= 0$ với mọi $t >= 0$, khoảng cách đến gốc tọa độ bằng chính $x(t)$.
  //     ]

  //     Ta có:
  //     $
  //       v(t) = x'(t) = 15t^2 e^(-t) - 5t^3 e^(-t) = 5t^2 e^(-t)(3 - t).
  //     $
  //     Suy ra $v(0) = 0$, nên mệnh đề a sai.

  //     Phương trình $v(t) = 0$ cho ta $t = 0$ hoặc $t = 3$.
  //     Trên $(0;3)$, ta có $v(t) > 0$; trên $(3; +infinity)$, ta có $v(t) < 0$.
  //     Vì thế chất điểm chỉ đổi chiều đúng một lần tại $t = 3$. Mệnh đề b đúng.

  //     Khoảng cách lớn nhất đạt được tại $t = 3$:
  //     $
  //       x_(max) = x(3) = 5 dot 27 dot e^(-3) = 135e^(-3).
  //     $
  //     Mệnh đề c đúng.

  //     Từ $t=0$ đến $t=3$, chất điểm đi được $135e^(-3)$ m; từ $t=3$ đến khi $t -> +infinity$, chất điểm quay về gần gốc tọa độ nên đi thêm đúng $135e^(-3)$ m nữa.
  //     Tổng quãng đường là:
  //     $
  //       S = 270e^(-3).
  //     $
  //     Do đó mệnh đề d sai.
  //   ],
  // )

#ds(
  [Một khu du lịch dự định xây dựng một cổng chào có dạng hình phẳng giới hạn bởi một đường parabol $(P)$ và mặt đất (được xem là một đường thẳng nằm ngang). Qua khảo sát, chiều rộng của cổng chào tại mặt đất là $A B = 6" m"$, chiều cao cao nhất của cổng là $O H = 4" m"$. Người ta muốn thiết kế một biển quảng cáo hình chữ nhật $C D E F$ nội tiếp trong phần hình phẳng của cổng chào (với $C, D$ nằm trên mặt đất và $E, F$ nằm trên parabol) để lồng ghép hệ thống đèn LED và màn hình. Biết chi phí vật liệu để làm biển quảng cáo là $500$ nghìn đồng /$ m^2$ và chi phí ốp gạch trang trí phần mặt tiền còn lại của cổng chào là $200$ nghìn đồng /$ m^2$.

  Giả sử gắn hệ trục tọa độ $O x y$ sao cho gốc tọa độ $O$ là trung điểm của $A B$, tia $O x$ chứa điểm $B$ và trục tung $O y$ hướng thẳng đứng lên trên. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Phương trình của parabol $(P)$ trong hệ trục tọa độ đã chọn là $y = -4/9 x^2 + 4$.]),
    True([Diện tích toàn bộ bề mặt mặt tiền của cổng chào bằng $16" m"^2$.]),
    True([Để diện tích biển quảng cáo hình chữ nhật đạt giá trị lớn nhất, độ dài đoạn $C D$ phải thiết kế bằng $2 sqrt(3)" m"$.]),
    [Khi biển quảng cáo được thiết kế với diện tích lớn nhất, tổng chi phí vật liệu cho toàn bộ mặt tiền cổng chào là $6$ triệu $400$ nghìn đồng.]
  ),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Trục tọa độ
    line((-3.8, 0), (3.8, 0), mark: (end: "stealth")); content((3.8, -0.3), $x$)
    line((0, -0.5), (0, 4.8), mark: (end: "stealth")); content((-0.3, 4.8), $y$)
    content((0.2, -0.3), $O$)
    
    // Các điểm trên trục
    circle((-3, 0), radius: 1.5pt, fill: black); content((-3, -0.35), $A$)
    circle((3, 0), radius: 1.5pt, fill: black); content((3, -0.35), $B$)
    circle((0, 4), radius: 1.5pt, fill: black); content((-0.3, 4.1), $H$)

    // Parabol
    let p-pts = ()
    for i in range(-30, 31) {
      let x = i / 10.0
      p-pts.push((x, -4/9 * x * x + 4))
    }
    
    // Tô màu nền cho cổng (trừ phần bảng quảng cáo)
    let fill-pts = p-pts
    fill-pts.push((3, 0))
    fill-pts.push((-3, 0))
    line(..fill-pts, close: true, fill: rgb("e3f2fd"), stroke: none)
    line(..p-pts, stroke: 1.2pt + rgb("1e88e5"))

    // Biển quảng cáo (Hình chữ nhật)
    let x0 = 1.732 // Căn 3
    let y0 = -4/9 * x0 * x0 + 4 // 8/3 = 2.667
    
    line((-x0, 0), (-x0, y0), (x0, y0), (x0, 0), close: true, fill: rgb("fff3e0"), stroke: 1pt + rgb("f57c00"))
    
    circle((-x0, 0), radius: 1.5pt, fill: black); content((-x0, -0.35), $C$)
    circle((x0, 0), radius: 1.5pt, fill: black); content((x0, -0.35), $D$)
    circle((x0, y0), radius: 1.5pt, fill: black); content((x0+0.3, y0+0.2), $E$)
    circle((-x0, y0), radius: 1.5pt, fill: black); content((-x0 -0.3, y0+0.2), $F$)

    // Chú thích độ dài
    line((-3, -0.8), (3, -0.8), mark: (start: "stealth", end: "stealth"), stroke: 0.5pt + rgb("555555"))
    content((0, -1.1), text(size: 9pt)[$6$ m])
    line((-3, -0.1), (-3, -0.9), stroke: 0.5pt + rgb("555555"))
    line((3, -0.1), (3, -0.9), stroke: 0.5pt + rgb("555555"))

    content((2.5, 2.5), text(fill: rgb("1e88e5"))[$(P)$])
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - *Gắn trục tọa độ:* Khai thác giả thiết bài toán để tìm tọa độ các điểm đặc biệt, từ đó lập phương trình parabol $(P)$ có dạng $y = a x^2 + c$.
      - *Tính diện tích hình phẳng:* Diện tích hình phẳng giới hạn bởi đồ thị hàm số $y=f(x)$, trục hoành và hai đường thẳng $x=a, x=b$ là $S = integral_a^b |f(x)| d x$.
      - *Bài toán tối ưu:* Gọi một kích thước của hình chữ nhật nội tiếp là tham số (ví dụ tọa độ điểm $D(x; 0)$), thiết lập hàm diện tích theo $x$. Sử dụng đạo hàm hoặc bất đẳng thức AM-GM để tìm giá trị lớn nhất.
    ]

    *Ý a) Đúng.* \
    Với hệ trục tọa độ đã chọn, gốc $O$ là trung điểm $A B = 6$, nên ta có tọa độ các điểm: $A(-3; 0)$, $B(3; 0)$. Đỉnh cao nhất của cổng là $H$ nằm trên trục tung nên $H(0; 4)$. \
    Parabol có đỉnh nằm trên trục $O y$ nên phương trình có dạng: $y = a x^2 + 4$. \
    Vì $(P)$ đi qua $B(3; 0)$, ta thay tọa độ $B$ vào phương trình:
    $ 0 = a dot 3^2 + 4 <=> 9a = -4 <=> a = -4/9. $
    Vậy phương trình của parabol là $y = -4/9 x^2 + 4$.

    *Ý b) Đúng.* \
    Diện tích toàn bộ bề mặt của cổng chào chính là diện tích hình phẳng giới hạn bởi $(P)$ và trục hoành trên đoạn $[-3; 3]$:
    $ S = integral_(-3)^3 (-4/9 x^2 + 4) d x = (-4/27 x^3 + 4x) |_(-3)^3 = (-4 + 12) - (4 - 12) = 16 " "(m^2). $

    *Ý c) Đúng.* \
    Do tính đối xứng, giả sử điểm $D$ có hoành độ $x$ ($0 < x < 3$). Khi đó $C D = 2x$. \
    Điểm $E$ nằm trên parabol và có cùng hoành độ với $D$, nên tung độ của $E$ là $D E = y = -4/9 x^2 + 4$. \
    Diện tích biển quảng cáo hình chữ nhật là:
    $ S_"qc"(x) = C D dot D E = 2x (-4/9 x^2 + 4) = -8/9 x^3 + 8x. $
    Tính đạo hàm:
    $ S'_"qc"(x) = -8/3 x^2 + 8. $
    Cho $S'_"qc"(x) = 0 <=> x^2 = 3 => x = sqrt(3)$ (vì $x > 0$). \
    Lập bảng biến thiên dễ dàng thấy hàm số đạt cực đại tại $x = sqrt(3)$. \
    Khi đó, chiều rộng của biển quảng cáo là $C D = 2x = 2 sqrt(3) " "(m)$. 

    *Ý d) Sai.* \
    Khi diện tích biển quảng cáo đạt lớn nhất (với $x = sqrt(3)$), ta có:
    $ S_"qc" = S_"qc"(sqrt(3)) = -8/9 (sqrt(3))^3 + 8(sqrt(3)) = - (8sqrt(3))/3 + (24sqrt(3))/3 = (16sqrt(3))/3 " "(m^2). $
    Diện tích phần cổng chào còn lại (ốp gạch) là:
    $ S_"gạch" = S - S_"qc" = 16 - (16sqrt(3))/3 " "(m^2). $
    Tổng chi phí vật liệu (đơn vị: nghìn đồng) là:
    $ T &= S_"qc" dot 500 + S_"gạch" dot 200 \
        &= (16sqrt(3))/3 dot 500 + (16 - (16sqrt(3))/3) dot 200 \
        &= (8000sqrt(3))/3 + 3200 - (3200sqrt(3))/3 \
        &= 3200 + 1600sqrt(3) approx 5971","28 " (nghìn đồng)". $
    Tức là chi phí khoảng $5$ triệu $971$ nghìn đồng, không phải $6$ triệu $400$ nghìn đồng. Do đó, mệnh đề sai. 
    *(Lưu ý: Mức giá $6$ triệu $400$ nghìn đồng tương ứng với việc lấy $16 " m"^2$ nhân nhầm với một mức đơn giá trung bình hoặc chưa trừ đi diện tích).*

    #meo[
      Ở ý c), để tối ưu hóa $S_"qc" = 8/9 x (9 - x^2)$, thay vì dùng đạo hàm, ta có thể dùng bất đẳng thức AM-GM:
      $ (S_"qc")^2 = 64/81 x^2 (9-x^2) (9-x^2) = 32/81 [2x^2 (9-x^2) (9-x^2)] $
      Áp dụng AM-GM cho 3 số dương $2x^2, 9-x^2, 9-x^2$, ta có:
      $ 2x^2 (9-x^2) (9-x^2) <= ((2x^2 + 9 - x^2 + 9 - x^2)/3)^3 = (18/3)^3 = 216. $
      Dấu "$=$" xảy ra khi $2x^2 = 9-x^2 <=> 3x^2 = 9 <=> x = sqrt(3)$. Rất nhanh và chính xác!
    ]
  ]
)
// Câu 1
#tln(
  [Một công trình kiến trúc (nhà vòm triển lãm) có mặt bằng đáy là một elip với trục lớn dài $40 " m"$ và trục bé dài $20 " m"$. Phần mái vòm được thiết kế độc đáo sao cho khi cắt công trình bởi các mặt phẳng vuông góc với trục lớn của đáy, ta luôn nhận được thiết diện là một nửa hình tròn (như hình vẽ minh họa). Để đưa công trình vào vận hành, ban quản lý cần lắp đặt hệ thống điều hòa trung tâm. Theo tiêu chuẩn thiết kế, mỗi mét khối thể tích không gian yêu cầu công suất làm lạnh là $150 " BTU"$. Biết chi phí lắp đặt hệ thống điều hòa (bao gồm máy móc và thi công) là $800$ đồng cho mỗi BTU công suất. Hỏi tổng chi phí lắp đặt hệ thống điều hòa cho công trình này là bao nhiêu triệu đồng (_không làm tròn kết quả ở các phép tính trung gian, chỉ làm tròn kết quả cuối cùng đến hàng phần mười_)?
  
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      // Phép chiếu 3D trục cơ bản
      let project(x, y, z) = (x - 0.4 * y, z - 0.3 * y)
      let w = 4  // Tỉ lệ trục lớn (tương ứng 20m)
      let h = 2  // Tỉ lệ trục bé (tương ứng 10m)

      // Trục tọa độ
      line(project(-5, 0, 0), project(5.5, 0, 0), stroke: (dash: "dashed", paint: gray), mark: (end: "stealth")); content(project(5.7, 0, 0), $x$)
      line(project(0, -3, 0), project(0, 3.5, 0), stroke: (dash: "dashed", paint: gray), mark: (end: "stealth")); content(project(0, 3.7, 0), $y$)
      line(project(0, 0, 0), project(0, 0, 3), stroke: (dash: "dashed", paint: gray), mark: (end: "stealth")); content(project(0, 0, 3.2), $z$)

      // Vẽ đáy elip
      let base-pts = ()
      for i in range(0, 361, step: 5) {
        let xx = w * calc.cos(i * 1deg)
        let yy = h * calc.sin(i * 1deg)
        base-pts.push(project(xx, yy, 0))
      }
      line(..base-pts, close: true, fill: rgb("e3f2fd"), stroke: 0.8pt + rgb("1e88e5"))

      // Vẽ các thiết diện nửa đường tròn
      let sections = (-3, -1.5, 0, 1.5, 3)
      for xx in sections {
        let inner = 1.0 - (xx*xx)/(w*w)
        if inner < 0 { inner = 0 }
        let R = h * calc.sqrt(inner)
        let arc-pts = ()
        for i in range(0, 181, step: 5) {
          let Y = R * calc.cos(i * 1deg)
          let Z = R * calc.sin(i * 1deg)
          arc-pts.push(project(xx, Y, Z))
        }
        line(..arc-pts, stroke: 0.8pt + rgb("1e88e5"))
        
        // Gạch mặt cắt cho một mặt cắt điển hình
        if xx == 1.5 {
           line(project(xx, R, 0), project(xx, -R, 0), stroke: 0.8pt + rgb("1e88e5"))
           let fill-pts = arc-pts
           fill-pts.push(project(xx, -R, 0))
           fill-pts.push(project(xx, R, 0))
           line(..fill-pts, close: true, fill: rgb("1e88e5"), stroke: none)
           content(project(xx + 0.3, 0, R/2), text(size: 9pt)[$S(x)$], fill: rgb("0d47a1"))
        }
      }

      // Vẽ đường sinh trên cùng (Top ridge)
      let top-pts = ()
      for i in range(-40, 41) {
        let xx = i / 10.0
        let inner = 1.0 - (xx*xx)/(w*w)
        if inner < 0 { inner = 0 }
        let R = h * calc.sqrt(inner)
        top-pts.push(project(xx, 0, R))
      }
      line(..top-pts, stroke: 1.5pt + rgb("d32f2f"))

      // Ghi chú tọa độ (tương ứng kích thước thực)
      content(project(0, 0, -0.25), $O$)
      content(project(4.2, 0, 0), $20$)
      content(project(-4.3, 0, 0), $-20$)
      content(project(0, 2.3, 0), $10$)
      content(project(0, -2.4, 0), $-10$)
    })
  ]
  ],
  [$502,7$],
  loigiai: [
    #ppgiai[
      - *Gắn hệ trục tọa độ:* Chọn hệ trục $O x y z$ với trục $O x$ dọc theo trục lớn của elip đáy, trục $O y$ dọc theo trục bé và $O z$ hướng thẳng đứng lên trên. Gốc $O$ là tâm của đáy.
      - *Xác định hàm diện tích thiết diện $S(x)$:* Từ phương trình elip, tìm được độ dài đoạn cắt của mặt phẳng vuông góc với trục $O x$ lên đáy (đây chính là đường kính của thiết diện nửa đường tròn). Tính diện tích $S(x)$ theo $x$.
      - *Công thức thể tích:* Áp dụng nguyên lý Cavalieri (thể tích vật thể theo diện tích mặt cắt):
        $ V = integral_a^b S(x) dif x $
      - *Toán tài chính:* Tổng chi phí = Thể tích $times$ Hệ số BTU $times$ Đơn giá.
    ]

    - Chọn hệ trục tọa độ $O x y$ trên mặt bằng đáy, với $O$ là tâm elip, trục $O x$ chứa trục lớn. 
    - Đáy công trình là một elip có nửa trục lớn $a = 40/2 = 20 " m"$, nửa trục bé $b = 20/2 = 10 " m"$. Phương trình elip đáy là:
      $ x^2/20^2 + y^2/10^2 = 1 <=> x^2/400 + y^2/100 = 1 <=> y^2 = 100 (1 - x^2/400) $
      với $x in [-20; 20]$.
    - Cắt vật thể bởi mặt phẳng vuông góc với trục $O x$ tại hoành độ $x$, ta được thiết diện là một nửa hình tròn. 
    - Đoạn giao tuyến của mặt phẳng cắt với đáy elip có độ dài là $2|y|$, đây chính là đường kính của thiết diện. 
    - Suy ra, bán kính của thiết diện nửa đường tròn là $R(x) = |y| = 10 sqrt(1 - x^2/400)$.
    - Diện tích của thiết diện tại vị trí $x$ là:
      $ S(x) = 1/2 pi R^2(x) = 1/2 pi dot 100 (1 - x^2/400) = 50pi (1 - x^2/400). $
    - Thể tích của công trình vòm là:
      $ V &= integral_(-20)^20 S(x) dif x = integral_(-20)^20 50pi (1 - x^2/400) dif x \
          &= 100pi integral_0^20 (1 - x^2/400) dif x \
          &= 100pi lr((x - x^3/1200)|)_0^20 \
          &= 100pi (20 - 8000/1200) = 100pi (20 - 20/3) = (4000pi)/3 " "(m^3). $
    - Công suất làm lạnh cần thiết cho toàn bộ không gian là:
      $ P = V times 150 = (4000pi)/3 times 150 = 200000pi " (BTU)". $
    - Tổng chi phí lắp đặt hệ thống điều hòa là:
      $ T &= P times 800 = 200000pi times 800 = 160000000pi " (đồng)" \
          &= 160pi " (triệu đồng)". $
    - Ta có $T = 160pi approx 160 times 3,14159265 approx 502,6548 " (triệu đồng)"$.
    - Làm tròn kết quả đến hàng phần mười, ta thu được tổng chi phí là *$502,7$* triệu đồng.

    #nhanxet[
      Bài toán này là một ví dụ vô cùng thực tế và sống động về phương pháp "Thể tích theo diện tích mặt cắt" (hay còn gọi là phương pháp lát cắt Cavalieri). Khác với các khối tròn xoay được sinh ra bằng cách quay một đường cong quanh một trục, công trình kiến trúc này được định hình hoàn toàn bởi hình học của bề mặt đáy và quy luật của thiết diện cắt ngang. Đây là nguyên lý lõi được ứng dụng rộng rãi trong thiết kế Kiến trúc Tham số (Parametric Architecture) hiện đại.
    ]
  ]
)

#ds(
  [Quá trình lây lan của một loại virus cúm mùa trong một khu dân cư có $10000$ người được mô hình hóa bởi hàm số logistic $N(t) = 10000 / (1 + A e^(-0,5 t))$, trong đó $N(t)$ là tổng số người bị nhiễm bệnh sau $t$ ngày kể từ thời điểm phát hiện ca bệnh đầu tiên, $A$ là hằng số thực. Tốc độ lây lan của virus tại thời điểm $t$ là đạo hàm $N'(t)$ (đơn vị: người/ngày). Biết rằng tại thời điểm ban đầu ($t=0$), có đúng $100$ người bị nhiễm bệnh. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ số $A = 99$.]),
    [Tốc độ lây lan của virus liên tục giảm trong $10$ ngày đầu tiên kể từ khi phát hiện.],
    True([Số người nhiễm bệnh tăng nhanh nhất vào ngày thứ $9$ (kết quả thời gian làm tròn đến hàng đơn vị).]),
    True([Tốc độ lây lan lớn nhất của virus trong cộng đồng là $1250$ người/ngày.])
  ),
  fig: cetz.canvas(length: 2.5mm, {
    import cetz.draw: *
    // Trục tọa độ
    line((-2, 0), (25, 0), mark: (end: "stealth")); content((25, -1.5), $t$ + " (ngày)")
    line((0, -2), (0, 13), mark: (end: "stealth")); content((-2.5, 13), $N(t)$)
    content((-1.5, -1.5), $O$)
    
    // Đường tiệm cận
    line((0, 10), (23, 10), stroke: (dash: "dashed", paint: gray))
    content((-3.5, 10), $10000$)

    // Vẽ đồ thị hàm N(t)
    let pts = ()
    for i in range(0, 240) {
      let t = i / 10.0
      let y = 10 / (1 + 99 * calc.exp(-0.5 * t))
      pts.push((t, y))
    }
    line(..pts, stroke: 1.2pt + rgb("1e88e5"))
    content((17, 7.25), text(fill: rgb("1e88e5"), size: 10pt)[Đồ thị lây nhiễm])
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - Từ giả thiết $N(0) = 100$, ta thay $t=0$ vào phương trình để tìm hằng số $A$.
      - **Mô hình Logistic:** Hàm số dạng $N(t) = C / (1 + A e^(-k t))$ luôn thỏa mãn phương trình vi phân $N'(t) = k \cdot N(t) (1 - (N(t))/C)$. 
      - Tốc độ lây lan đạt giá trị lớn nhất khi $N'(t)$ lớn nhất. Biểu thức $N'(t)$ là một tam thức bậc hai theo biến $N(t)$, có bề lõm hướng xuống, nên đạt cực đại tại đỉnh parabol, tức là khi $N(t) = C/2$.
    ]

    *Ý a) Đúng.* \
    Tại thời điểm ban đầu $t=0$, số người nhiễm bệnh là $100$, ta có:
    $ N(0) = 10000 / (1 + A e^0) = 100 <=> 1 + A = 10000 / 100 = 100 => A = 99. $

    *Ý b) Sai.* \
    Từ ý a, hàm số là $N(t) = 10000 / (1 + 99 e^(-0,5 t))$. \
    Tốc độ lây lan là đạo hàm bậc nhất của $N(t)$:
    $ N'(t) = (-10000 \cdot 99 \cdot (-0,5) e^(-0,5 t)) / (1 + 99 e^(-0,5 t))^2 = (495000 e^(-0,5 t)) / (1 + 99 e^(-0,5 t))^2. $
    Khi biểu diễn $N'(t)$ theo $N(t)$, ta có hệ thức đặc trưng của hàm logistic:
    $ N'(t) = 0,5 \cdot N(t) \cdot (1 - (N(t))/10000). $
    Đồ thị của $N'(t)$ theo $N(t)$ là một parabol bề lõm quay xuống. Tốc độ $N'(t)$ tăng khi $N(t)$ tăng từ $0$ đến $5000$, và giảm khi $N(t) > 5000$.
    Ta thấy $N(t) = 5000$ tại $t approx 9,19$ (tính ở ý c). Vậy trong $9$ ngày đầu, tốc độ lây lan đang *tăng dần* chứ không phải liên tục giảm.

    *Ý c) Đúng.* \
    Sự lây lan tăng nhanh nhất khi $N'(t)$ đạt giá trị lớn nhất. \
    Xét hàm $f(N) = 0,5 N (1 - N/10000) = - 1/20000 N^2 + 0,5 N$. \
    Hàm này đạt giá trị lớn nhất tại $N = (-0,5) / (2 \cdot (-1/20000)) = 5000$. \
    Tại thời điểm $N(t) = 5000$, ta có:
    $ 10000 / (1 + 99 e^(-0,5 t)) = 5000 <=> 1 + 99 e^(-0,5 t) = 2 <=> e^(-0,5 t) = 1/99 <=> e^(0,5 t) = 99. $
    Giải ra $t = 2 ln 99 approx 9,19$ (ngày). Làm tròn đến hàng đơn vị, ta được ngày thứ $9$.

    *Ý d) Đúng.* \
    Tốc độ lây lan lớn nhất chính là giá trị của $N'(t)$ khi $N(t) = 5000$. \
    Thay vào phương trình tốc độ:
    $ N'_"max" = 0,5 \cdot 5000 \cdot (1 - 5000/10000) = 2500 \cdot 0,5 = 1250 " (người/ngày)". $

    #align(center)[
      #cetz.canvas(length: 3mm, {
        import cetz.draw: *
        // Trục tọa độ
        line((-1, 0), (22, 0), mark: (end: "stealth")); content((22, -1.5), $t$)
        line((0, -1), (0, 12), mark: (end: "stealth")); content((-1.5, 12), $y$)
        
        // Tiệm cận
        line((0, 10), (21, 10), stroke: (dash: "dashed", paint: gray))
        
        // Đồ thị
        let pts-N = ()
        let pts-Nd = ()
        for i in range(0, 210) {
          let t = i / 10.0
          let val-N = 10 / (1 + 99 * calc.exp(-0.5 * t))
          // Cố tình scale N'(t) lớn lên 4 lần để vẽ minh họa cho học sinh dễ nhìn
          let val-Nd = 4 * 0.5 * val-N * (1 - val-N / 10)
          pts-N.push((t, val-N))
          pts-Nd.push((t, val-Nd))
        }
        line(..pts-N, stroke: 1.2pt + rgb("1e88e5"))
        line(..pts-Nd, stroke: 1.2pt + rgb("d32f2f"), dash: "dashed")
        
        // Điểm uốn (Thời điểm bùng phát mạnh nhất)
        let t-inf = 2 * calc.ln(99)
        line((t-inf, 0), (t-inf, 5), stroke: (dash: "dotted", paint: gray, thickness: 1pt))
        circle((t-inf, 5), radius: 2pt, fill: rgb("d32f2f"))
        content((t-inf, -1.5), $t approx 9,2$)
        
        content((15, 8.5), text(fill: rgb("1e88e5"))[$N(t)$])
        content((13, 3), text(fill: rgb("d32f2f"))[$N'(t)$])
      })
    ]

    #nhanxet[
      Đồ thị đường đứt nét màu đỏ trong hình trên chính là tốc độ lây lan $N'(t)$ (tương ứng với số ca nhiễm mới mỗi ngày). Điểm mà đường cong $N(t)$ đổi chiều cong (điểm uốn) chính là lúc đạo hàm đạt đỉnh (đỉnh dịch). Trong thực tế, các biện pháp giãn cách xã hội (giảm hệ số $k=0,5$ xuống thấp hơn) được áp dụng nhằm "làm phẳng đường cong" (Flatten the curve), giúp hạ thấp đỉnh dịch $1250$ ca/ngày xuống dưới ngưỡng quá tải của hệ thống y tế.
    ]
  ]
)

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #exam-part(
    [
      #set text(fill: rgb("d32f2f"))
      PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6)
  #resetcau()
  
  #tln(
  id: "2H5V2-8",
  [Trong một diễn tập quân sự ảo mô phỏng không gian $O x y z$ (đơn vị đo: mét), một mục tiêu bay $M$ xuất phát từ điểm $A(20; 15; 5)$ và chuyển động thẳng đều với véc-tơ vận tốc $vect(v)_M = (-2; -1; -2)$. Cùng lúc đó, một tổ hợp phòng không di động $K$ xuất phát từ gốc tọa độ $O(0; 0; 0)$, di chuyển thẳng đều trên mặt phẳng $(O x y)$ với véc-tơ vận tốc $vect(v)_K = (1; 2; 0)$.

  Tổ hợp $K$ được trang bị hệ thống vũ khí laser. Điểm yếu của mục tiêu $M$ nằm ở phần sườn, do đó hệ thống quy định: tia laser chỉ xuyên thủng lớp giáp và tiêu diệt được $M$ nếu phương của tia laser chiếu *vuông góc* với hướng di chuyển của mục tiêu.

  Giả sử vào thời điểm $t$ (giây) tính từ lúc xuất phát, tổ hợp $K$ đã khóa mục tiêu và phát tia laser tiêu diệt thành công $M$. Hãy tính bình phương khoảng cách giữa $K$ và $M$ tại thời điểm đó (đơn vị: $m^2$).],
  [$50$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Hệ trục tọa độ Oxyz minh họa
    line((0,0), (-1.2, -0.8), mark: (end: ">"), stroke: (paint: gray))
    content((-1.2, -0.8), $x$, anchor: "north-east", fill: gray)
    line((0,0), (4.5, 0), mark: (end: ">"), stroke: (paint: gray))
    content((4.5, 0), $y$, anchor: "west", fill: gray)
    line((0,0), (0, 3.5), mark: (end: ">"), stroke: (paint: gray))
    content((0, 3.5), $z$, anchor: "south", fill: gray)
    
    let O = (0,0)
    let K = (2, 0.5)
    let A = (3.5, 3.2)
    let M = (1.2, 2.5)
    
    // Quỹ đạo K
    line(O, K, stroke: (paint: rgb("d32f2f"), thickness: 1.2pt), mark: (end: ">"))
    content(K, $K$, anchor: "north-west", padding: 3pt)
    content((1, 0.65), $vect(v)_K$, fill: rgb("d32f2f"))
    
    // Quỹ đạo M
    line(A, M, stroke: (paint: rgb("0288d1"), thickness: 1.2pt), mark: (end: ">"))
    content(A, $A$, anchor: "south-west", padding: 3pt)
    content(M, $M$, anchor: "south-east", padding: 3pt)
    content((2.5, 3.5), $vect(v)_M$, fill: rgb("0288d1"))
    line(M, (0, 2.13), stroke: (dash: "dashed", paint: rgb("0288d1")))
    
    // Tia laser K -> M
    line(K, M, stroke: (paint: rgb("f57c00"), thickness: 1.5pt))
    content((1.8, 1.5), [Tia laser], angle: -65deg, fill: rgb("f57c00"), size: 8pt)
    
    // Góc vuông
    line((1.4, 2.56), (1.46, 2.36), (1.26, 2.3), stroke: 0.8pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - Viết tọa độ của các điểm $M$ và $K$ dưới dạng tham số theo thời gian $t$.
      - Biểu diễn véc-tơ tia laser $vect(K M)$ theo $t$.
      - Áp dụng điều kiện tiêu diệt mục tiêu: tia laser vuông góc với quỹ đạo của $M$, suy ra $vect(K M) dot vect(v)_M = 0$.
      - Giải phương trình để tìm $t$, sau đó thay ngược lại tính khoảng cách $K M^2$.
    ]
    
    Tại thời điểm $t$ (giây), tọa độ của tổ hợp $K$ và mục tiêu $M$ lần lượt là:
    - $K = O + t dot vect(v)_K = (t; 2t; 0)$.
    - $M = A + t dot vect(v)_M = (20 - 2t; 15 - t; 5 - 2t)$.
    
    Véc-tơ biểu diễn tia laser từ $K$ đến $M$ là:
    $ vect(K M) = (20 - 3t; 15 - 3t; 5 - 2t). $
    
    Để tia laser xuyên thủng giáp, nó phải chiếu vuông góc với hướng di chuyển của mục tiêu, tức là véc-tơ $vect(K M)$ vuông góc với véc-tơ vận tốc $vect(v)_M = (-2; -1; -2)$.
    Ta có điều kiện: $vect(K M) dot vect(v)_M = 0$
    $ <=> -2(20 - 3t) - 1(15 - 3t) - 2(5 - 2t) = 0 $
    $ <=> -40 + 6t - 15 + 3t - 10 + 4t = 0 $
    $ <=> 13t - 65 = 0 <=> t = 5 " (giây)". $
    
    Tại thời điểm $t = 5$, ta có véc-tơ $vect(K M) = (20 - 15; 15 - 15; 5 - 10) = (5; 0; -5)$.
    
    Bình phương khoảng cách giữa $K$ và $M$ tại thời điểm đó là:
    $ K M^2 = |vect(K M)|^2 = 5^2 + 0^2 + (-5)^2 = 25 + 25 = 50. $
    
    Vậy bình phương khoảng cách cần tìm là *$50$* $m^2$.

    #nhanxet[Bài toán này khai thác rất hay yếu tố hình học trong động học. Mấu chốt là nhận ra điều kiện "chiếu vuông góc" chính là việc ép tích vô hướng của hai véc-tơ (véc-tơ vị trí tương đối và véc-tơ vận tốc) bằng $0$. Kỹ thuật tham số hóa tọa độ theo biến thời gian $t$ giúp đơn giản hóa bài toán từ không gian ba chiều về phương trình bậc nhất một ẩn số.]
  ]
)

#import "@preview/cetz:0.5.2": canvas, draw

#tln(
  [Một hệ thống bảo mật tạo mã PIN gồm 2 chữ số. Để tạo mỗi chữ số, hệ thống sẽ gieo một con xúc xắc cân đối bên trong: nếu số chấm $k in {1; 2; 3}$ thì chữ số tạo ra là $1$; nếu $k in {4; 5}$ thì chữ số tạo ra là $2$; nếu $k = 6$ thì chữ số tạo ra là $3$. Biết rằng sau khi tạo xong mã PIN 2 chữ số, **tổng của hai chữ số đó là một số chẵn**. Tính xác suất để mã PIN vừa tạo có **hai chữ số giống hệt nhau** (ví dụ: $11, 22, 33$).],
  [0.7],
  loigiai: [
    #step[
      Gọi $X$ là biến cố "Tổng của 2 chữ số tạo ra là số chẵn" và $Y$ là biến cố "Hai chữ số giống hệt nhau". Cần tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Phân tích 3 khả năng (KN) tạo *mỗi chữ số*:
      - *KN1:* Số $1$ $arrow$ Xác suất $3/6 = 1/2$.

      - *KN2:* Số $2$ $arrow$ Xác suất $2/6 = 1/3$.

      - *KN3:* Số $3$ $arrow$ Xác suất $1/6$.

    ]
    
    #step[
      *Sơ đồ cây biểu diễn mã PIN tạo được sau 2 giai đoạn:*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          let p1_1 = (3.5, 4.5); let p1_2 = (3.5, 0); let p1_3 = (3.5, -4.5)

          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Bắt đầu], name: "N0")
          content(p1_1, align(center)[*KN1* \ (Ra số 1)], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ (Ra số 2)], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ (Ra số 3)], name: "N1_3")

          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/2$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/3$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/6$])

          // Chữ số thứ nhất là 1
          line("N1_1", (7.0, 6.0), ..edge-style); content((5.25, 5.6), lbl[$1/2$])
          content((7.2, 6.0), [*KN1* $arrow$ Mã: 11 (Tổng 2) #h(2pt) #text(fill: blue, weight: "bold")[(Trùng)]], anchor: "west")
          line("N1_1", (7.0, 4.5), ..edge-style); content((5.25, 4.4), lbl[$1/3$])
          content((7.2, 4.5), [*KN2* $arrow$ Mã: 12 (Tổng 3) #h(2pt) #text(fill: red)[(Loại)]], anchor: "west") 
          line("N1_1", (7.0, 3.0), ..edge-style); content((5.25, 3.25), lbl[$1/6$])
          content((7.2, 3.0), [*KN3* $arrow$ Mã: 13 (Tổng 4) #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")

          // Chữ số thứ nhất là 2
          line("N1_2", (7.0, 1.5), ..edge-style); content((5.25, 0.8+.3), lbl[$1/2$])
          content((7.2, 1.5), [*KN1* $arrow$ Mã: 21 (Tổng 3) #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_2", (7.0, 0), ..edge-style); content((5.25, 0.1 -.2), lbl[$1/3$])
          content((7.2, 0), [*KN2* $arrow$ Mã: 22 (Tổng 4) #h(2pt) #text(fill: blue, weight: "bold")[(Trùng)]], anchor: "west")
          line("N1_2", (7.0, -1.5), ..edge-style); content((5.25, -0.5 -.8), lbl[$1/6$])
          content((7.2, -1.5), [*KN3* $arrow$ Mã: 23 (Tổng 5) #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Chữ số thứ nhất là 3
          line("N1_3", (7.0, -3.0), ..edge-style); content((5.25, -3.7 +.3), lbl[$1/2$])
          content((7.2, -3.0), [*KN1* $arrow$ Mã: 31 (Tổng 4) #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")
          line("N1_3", (7.0, -4.5), ..edge-style); content((5.25, -4.4 -.2), lbl[$1/3$])
          content((7.2, -4.5), [*KN2* $arrow$ Mã: 32 (Tổng 5) #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.0, -6.0), ..edge-style); content((5.25, -5.1-.8), lbl[$1/6$])
          content((7.2, -6.0), [*KN3* $arrow$ Mã: 33 (Tổng 6) #h(2pt) #text(fill: blue, weight: "bold")[(Trùng)]], anchor: "west")
        })
      ]
    ]

    #step[
      Các mã PIN có tổng chữ số là số chẵn (Biến cố $X$) bao gồm các nhánh Xanh lá và Xanh dương:
      $ P(X) = (1/2 times 1/2) + (1/2 times 1/6) + (1/3 times 1/3) + (1/6 times 1/2) + (1/6 times 1/6) $
      $ P(X) = 1/4 + 1/12 + 1/9 + 1/12 + 1/36 = 9/36 + 3/36 + 4/36 + 3/36 + 1/36 = 20/36 $
      
      Các mã PIN có hai chữ số trùng nhau (Biến cố $X inter Y$, màu xanh dương) là $11, 22$ và $33$:
      $ P(X inter Y) = (1/2 times 1/2) + (1/3 times 1/3) + (1/6 times 1/6) $
      $ P(X inter Y) = 1/4 + 1/9 + 1/36 = 9/36 + 4/36 + 1/36 = 14/36 $
    ]

    #step[
      Xác suất cần tìm dưới dạng số thập phân là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (14/36) / (20/36) = 14/20 = 7/10 = 0.7 $
    ]
  ]
)
#tln(
  id: "1H8N6-7",
  [Một không gian triển lãm nghệ thuật có thiết kế giếng trời mang hình dáng khối chóp cụt tứ giác đều $A B C D.A'B'C'D'$. Kích thước mặt sàn $A B C D$ là hình vuông cạnh $8$ m, mặt trần kính $A'B'C'D'$ là hình vuông cạnh $4$ m, và chiều cao của giếng trời là $2 sqrt(3)$ m. Gọi $O$ là tâm của mặt sàn. Một robot vệ sinh đang trượt dọc theo đoạn $M' M$ của mặt kính bên $(B C C' B')$ (với $M, M'$ lần lượt là trung điểm của $B C$ và $B' C'$). Cùng lúc đó, một ống kính ghi hình đặt tại $O$ liên tục xoay để quay lại quá trình làm việc của robot. Theo tài liệu kỹ thuật, ống kính ghi hình cho chất lượng ảnh tốt nhất tại điểm $N$ (nằm trên $M' M$) khi tia nhìn $O N$ hợp với mặt sàn một góc bằng đúng một nửa số đo góc nhị diện tạo bởi mặt kính $(B C C' B')$ và mặt sàn. Hãy tính khoảng cách từ ống kính đến robot tại thời điểm ghi hình nét nhất (đơn vị: mét, làm tròn đến hàng phần mười).],
  [3,5],
  loigiai: [
    #ppgiai[
      - Rút trích bài toán không gian về mặt phẳng bằng cách xét thiết diện qua trục chứa trung đoạn $M M'$.
      - Tính góc phẳng nhị diện tạo bởi mặt bên và mặt đáy thông qua hình thang vuông.
      - Gắn hệ tọa độ Descartes vào mặt phẳng thiết diện $2 D$ để tìm giao điểm $N$ và tính toán khoảng cách.
    ]
#align(center)[
#cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // --- HÌNH 1: MẶT CẮT 2D ---
    group(name: "2d", {
      let O_2d = (0, 0)
      let M_2d = (4, 0)
      let O1_2d = (0, 3.464)
      let M1_2d = (2, 3.464)
      let N_2d = (3, 1.732)
      
      // Vẽ đa giác thiết diện
      line(O_2d, M_2d, M1_2d, O1_2d, close: true, stroke: 1pt + rgb("1565c0"), fill: rgb("e3f2fd"))
      
      // Hệ trục tọa độ O y z
      line((-0.5, 0), (5, 0), mark: (end: ">"), stroke: 0.6pt + luma(100))
      content((4.8, -0.3), $y$, fill: luma(100))
      line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.6pt + luma(100))
      content((-0.3, 4.3), $z$, fill: luma(100))
      
      // Tia nhìn O N
      line(O_2d, N_2d, stroke: (paint: rgb("e65100"), thickness: 1.2pt), mark: (end: ">"))
      
      // Các điểm và nhãn
      circle(O_2d, radius: 1.5pt, fill: black)
      circle(M_2d, radius: 1.5pt, fill: black)
      circle(O1_2d, radius: 1.5pt, fill: black)
      circle(M1_2d, radius: 1.5pt, fill: black)
      circle(N_2d, radius: 1.5pt, fill: rgb("c62828"))
      
      content((-0.3, -0.3), $O$)
      content((4.2, -0.3), $M$)
      content((-0.4, 3.464), $O'$)
      content((2.2, 3.7), $M'$)
      content((3.3, 1.7), $N$)
      
      // Góc
      arc(O_2d, start: 0deg, stop: 30deg, radius: 1.2, stroke: 0.6pt)
      content((1.6, 0.4), $30^circ$, fill: luma(100), size: 8pt)
      arc(M_2d, start: 120deg, stop: 180deg, radius: 0.6, stroke: 0.6pt)
      content((3.2, 0.3), $60^circ$, fill: luma(100), size: 8pt)
      
      content((2, -1.2), text(weight: "bold")[Mặt cắt $2 D$])
    })

    // --- HÌNH 2: KHỐI CHÓP CỤT 3D ---
    group(name: "3d", {
      set-origin((8.5, 0.5))
      
      let A = (-2, -1)
      let B = (2, -1)
      let C = (3, 1)
      let D = (-1, 1)
      
      let O = (0.5, 0)
      let h = 3.464
      let O1 = (0.5, h)
      
      let A1 = (-0.75, h - 0.5)
      let B1 = (1.25, h - 0.5)
      let C1 = (1.75, h + 0.5)
      let D1 = (-0.25, h + 0.5)

      // Cạnh khuất đáy
      line(A, D, stroke: (dash: "dashed", paint: luma(80), thickness: 0.8pt))
      line(C, D, stroke: (dash: "dashed", paint: luma(80), thickness: 0.8pt))
      
      // Cạnh thấy đáy
      line(A, B, C, stroke: 0.8pt)
      
      // Cạnh đáy nhỏ
      line(A1, B1, C1, D1, close: true, stroke: 0.8pt + rgb("1565c0"), fill: rgb("e3f2fd"))
      
      // Cạnh bên
      line(A, A1, stroke: (dash: "dashed", paint: luma(80), thickness: 0.8pt))
      line(D, D1, stroke: (dash: "dashed", paint: luma(80), thickness: 0.8pt))
      line(B, B1, stroke: 0.8pt)
      line(C, C1, stroke: 0.8pt)
      
      // Điểm M, M'
      let M = (2.5, 0)
      let M1 = (1.5, h)
      line(M, M1, stroke: 1.2pt + rgb("1565c0"))
      
      // Các đường tâm và đáy
      line(A, C, stroke: (dash: "dashed", paint: luma(120), thickness: 0.5pt))
      line(B, D, stroke: (dash: "dashed", paint: luma(120), thickness: 0.5pt))
      line(O, O1, stroke: (dash: "dashed", paint: rgb("c2185b"), thickness: 0.8pt))
      line(O, M, stroke: (dash: "dashed", paint: luma(120), thickness: 0.8pt))
      
      // Điểm N và tia nhìn
      let N = (2, h/2)
      line(O, N, stroke: (paint: rgb("e65100"), thickness: 1.2pt), mark: (end: ">"))
      
      // Vẽ điểm
      circle(O, radius: 1.5pt, fill: black)
      circle(M, radius: 1.5pt, fill: black)
      circle(M1, radius: 1.5pt, fill: black)
      circle(N, radius: 1.5pt, fill: rgb("c62828"))
      
      // Gắn nhãn
      content(O, $O$, anchor: "north", padding: 4pt)
      content(M, $M$, anchor: "west", padding: 3pt)
      content(M1, $M'$, anchor: "west", padding: 3pt)
      content(N, $N$, anchor: "south-east", padding: 3pt)
      
      content(A, $A$, anchor: "north-east", padding: 3pt)
      content(B, $B$, anchor: "north-west", padding: 3pt)
      content(C, $C$, anchor: "south-west", padding: 3pt)
      content(A1, $A'$, anchor: "south", padding: 3pt)
      content(B1, $B'$, anchor: "north-west", padding: 3pt)
      content(C1, $C'$, anchor: "south", padding: 3pt)
      
      content((1.2, h/4), [Tia nhìn], angle: 45deg, fill: rgb("e65100"), size: 8pt)
      content((0.5, -1.7), text(weight: "bold")[Mô hình $3 D$])
    })
  })
]
    Xét mặt phẳng $(O O' M' M)$ chứa trục của giếng trời và trung đoạn mặt bên. Thiết diện cắt ra là hình thang vuông $O O' M' M$ vuông tại $O$ và $O'$.
    Theo giả thiết, mặt đáy sàn là hình vuông cạnh $8$ m nên khoảng cách từ tâm đến cạnh là $O M = 4$ m. 
    Mặt kính trần là hình vuông cạnh $4$ m nên $O' M' = 2$ m. 
    Chiều cao giếng trời là $O O' = 2 sqrt(3)$ m.

    Góc phẳng nhị diện tạo bởi mặt kính bên $(B C C' B')$ và mặt sàn $(A B C D)$ chính là góc $angle O M M'$.
    Kẻ $M' H perp O M$ tại $H$, tứ giác $O O' M' H$ là hình chữ nhật nên $O H = O' M' = 2$ m và $M' H = O O' = 2 sqrt(3)$ m.
    Độ dài đoạn $H M = O M - O H = 4 - 2 = 2$ m.
    
    Xét tam giác vuông $M' H M$:
    $ tan(angle O M M') = (M' H)/(H M) = (2 sqrt(3))/2 = sqrt(3) => angle O M M' = 60^circ. $
    Do ống kính ghi hình nét nhất khi góc ngẩng bằng một nửa góc nhị diện nên tia $O N$ hợp với mặt sàn một góc: $alpha = 60^circ / 2 = 30^circ$.

    Gắn hệ trục tọa độ phẳng $O y z$ với gốc tại $O(0;0)$, tia $O y$ trùng với tia $O M$, tia $O z$ trùng với tia $O O'$.
    Tọa độ các điểm: $M(4; 0)$ và $M'(2; 2 sqrt(3))$.
    Véc-tơ chỉ phương của đường thẳng chứa trung đoạn là $arrow(M M') = (-2; 2 sqrt(3))$.
    Phương trình tham số của đoạn thẳng $M M'$ mô tả quỹ đạo robot là:
    $ cases(y = 4 - 2t, z = 2 sqrt(3)t) quad (0 <= t <= 1). $
    Điểm $N$ nằm trên quỹ đạo này nên tọa độ có dạng $N(4 - 2t; 2 sqrt(3)t)$.

    Vì tia nhìn $O N$ hợp với mặt sàn (trục $O y$) góc $30^circ$ nên hệ số góc của $O N$ là $tan 30^circ = 1/sqrt(3)$. Suy ra:
    $ z_N / y_N = 1/sqrt(3) <=> (2 sqrt(3)t) / (4 - 2t) = 1/sqrt(3) \
    <=> 2 sqrt(3)t dot sqrt(3) = 4 - 2t \
    <=> 6t = 4 - 2t <=> 8t = 4 <=> t = 1/2. $

    Thay $t = 1/2$ vào tọa độ điểm $N$, ta thu được $N(3; sqrt(3))$.
    Khoảng cách từ ống kính đến robot tại thời điểm đó chính là độ dài đoạn $O N$:
    $ O N = sqrt(3^2 + (sqrt(3))^2) = sqrt(9 + 3) = sqrt(12) = 2 sqrt(3) approx 3,464 " m". $

    Làm tròn kết quả đến hàng phần mười, khoảng cách cần tìm là *$3,5$* m.

    #nhanxet[Bằng cách chuyển đổi bài toán hình học không gian phức tạp về mặt phẳng tọa độ $2 D$, ta dễ dàng xử lý các yếu tố về góc và khoảng cách thông qua hệ số góc và phương trình tham số của đường thẳng. Việc vẽ song song hai mô hình $2 D$ và $3 D$ giúp hình dung rõ ràng sự tương quan của thiết diện so với tổng thể.]
  ]
)

#tln(
  id: "2D1V3-6",
  [Một khách sạn sinh thái cao cấp có đúng $100$ phòng nghỉ. Qua quá trình hoạt động, ban quản trị nhận thấy: Nếu giá cho thuê mỗi phòng là $2$ triệu đồng/ngày thì toàn bộ $100$ phòng đều được khách đặt hết. Cứ mỗi lần tăng giá phòng thêm $200.000$ đồng/ngày, trung bình sẽ có thêm $4$ phòng bị bỏ trống. 
  Chi phí vận hành (dọn dẹp, điện nước, vật tư) cho mỗi phòng được thuê là $500.000$ đồng/ngày; đồng thời chi phí bảo trì cơ bản cho mỗi phòng trống là $100.000$ đồng/ngày. Hỏi khách sạn cần niêm yết giá cho thuê mỗi phòng là bao nhiêu triệu đồng/ngày để thu được tổng lợi nhuận trong ngày là cao nhất? (Biết giá niêm yết luôn lớn hơn hoặc bằng $2$ triệu đồng/ngày).],
  [3,7],
  loigiai: [
    #ppgiai[
      - Gọi $x$ là giá thuê mỗi phòng. Lập biểu thức biểu diễn số phòng được thuê $q(x)$ và số phòng trống $v(x)$ theo $x$.
      - Xây dựng hàm doanh thu $R(x) = x dot q(x)$ và hàm tổng chi phí $C(x)$.
      - Lập hàm lợi nhuận $P(x) = R(x) - C(x)$.
      - Sử dụng đạo hàm để tìm giá trị lớn nhất của hàm $P(x)$ trên miền xác định tương ứng.
    ]

    Gọi $x$ (triệu đồng) là mức giá cho thuê niêm yết của mỗi phòng trong một ngày ($x >= 2$).
    Mức giá tăng thêm so với mức giá ban đầu là: $x - 2$ (triệu đồng).
    Số lần tăng giá (mỗi chu kỳ là $0,2$ triệu đồng) là: $(x - 2) / 0,2 = 5x - 10$ (lần).
    
    Số phòng bị bỏ trống do tăng giá: $v(x) = 4(5x - 10) = 20x - 40$ (phòng).
    Số phòng có khách thuê: $q(x) = 100 - v(x) = 100 - (20x - 40) = 140 - 20x$ (phòng).
    (Vì số phòng thuê $q(x) >= 0$ nên ta chỉ xét $x <= 7$).

    Tổng doanh thu mỗi ngày của khách sạn:
    $ R(x) = x dot q(x) = x(140 - 20x) = -20x^2 + 140x quad ("triệu đồng"). $

    Tổng chi phí vận hành và bảo trì mỗi ngày:
    $ C(x) &= 0,5 dot q(x) + 0,1 dot v(x) \
           &= 0,5(140 - 20x) + 0,1(20x - 40) \
           &= 70 - 10x + 2x - 4 = 66 - 8x quad ("triệu đồng"). $

    Hàm lợi nhuận mỗi ngày của khách sạn:
    $ P(x) &= R(x) - C(x) \
           &= -20x^2 + 140x - (66 - 8x) \
           &= -20x^2 + 148x - 66. $

    Xét hàm lợi nhuận $P(x)$ trên đoạn $[2; 7]$:
    Đạo hàm: $P'(x) = -40x + 148$.
    Cho $P'(x) = 0 <=> -40x + 148 = 0 <=> x = 3,7$.

    Ta có bảng biến thiên của $P(x)$ trên đoạn $[2; 7]$:
    #align(center)[
      #bbt-opt(
        var: $x$,
        der: $P'(x)$,
        func: $P(x)$,
        x-vals: ($2$, $3,7$, $7$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($150$, $207,8$, $-10$),
        is-min: false
      )
    ]

    Từ bảng biến thiên, lợi nhuận đạt cực đại khi $x = 3,7$. 
    Tại mức giá này, lợi nhuận thu được là lớn nhất ($207,8$ triệu đồng/ngày).

    Vậy khách sạn cần niêm yết mức giá cho thuê là *$3,7$* triệu đồng/ngày.

    #nhanxet[Bài toán là một mô hình Tối ưu hóa rất thực tế và tinh tế trong Kinh tế học. Điểm đặc biệt của mô hình này nằm ở chỗ chi phí $C(x)$ lại là một hàm nghịch biến theo $x$: khi giá niêm yết càng cao, lượng khách càng ít đi, từ đó tổng chi phí dọn dẹp và vận hành cũng sụt giảm theo. Lợi nhuận $P(x)$ sẽ đạt đỉnh tại đúng mức giá mà doanh thu biên (Marginal Revenue) bù đắp vừa khít sự sụt giảm của chi phí biên (Marginal Cost).]
  ]
)

#tln(
  id: "2D4N3-5",
  [Một công ty chuyên sản xuất đồ dùng dã ngoại đang phát triển một mẫu *bình nước thể thao* nguyên khối. Để tối ưu hóa đặc tính khí động học và thẩm mỹ, các kỹ sư đã thiết kế bình sao cho khi đặt trong hệ trục tọa độ $O x y$ (đơn vị: dm), mặt cắt dọc của bình là một miền phẳng giới hạn bởi trục tung và một đường cong ghép trơn tru từ hai phần:
  - Phần thân dưới (ứng với $1 <= y <= 2$) có biên dạng là một cung elip với phương trình $x^2/4 + (y - 2)^2 = 1$ nằm bên phải trục $O y$.
  - Phần cổ và miệng bình (ứng với $2 <= y <= 5$) có biên dạng là một cung parabol $x = a(y - b)^2 + c$. Biên dạng này đi qua đỉnh nhọn của miệng bình trên trục tung tại $P(0; 5)$ và ghép trơn với cung elip tại điểm chuyển tiếp $N$ có tung độ $y_N = 2$.
  
  Không gian chứa nước của bình chính là phần thể tích khối tròn xoay được sinh ra khi quay miền phẳng trên quanh trục $O y$. Hãy xác định tọa độ điểm ghép $N$, tìm phương trình parabol và tính dung tích chứa nước tối đa của bình (đơn vị: lít, làm tròn kết quả đến hàng phần mười). Biết $1 " dm"^3 = 1$ lít.],
  [$28,5$],
  fig: cetz.canvas(length: 0.7cm, {
    import cetz.draw: *
    
    // Tính toán biên dạng Elip (y từ 1 đến 2)
    let ell_r = ()
    for i in range(31) {
      let y = 1.0 + i * 1.0 / 30.0
      let val = 1.0 - (y - 2.0)*(y - 2.0)
      let x = 2.0 * calc.sqrt(calc.max(0.0, val))
      ell_r.push((x, y))
    }
    
    // Tính toán biên dạng Parabol (y từ 2 đến 5)
    let para_r = ()
    for i in range(31) {
      let y = 2.0 + i * 3.0 / 30.0
      let x = -2.0 / 9.0 * (y - 2.0) * (y - 2.0) + 2.0
      para_r.push((x, y))
    }

    // --- HÌNH 1: MẶT CẮT 2D ---
    group(name: "2d", {
      // Đổ màu vùng phẳng
      let region = ((0, 1),) + ell_r + para_r + ((0, 5),)
      line(..region, close: true, fill: rgb("e3f2fd"), stroke: none)
      
      // Hệ trục tọa độ O x y
      line((-1, 0), (4, 0), mark: (end: ">"), stroke: 0.8pt + luma(80))
      content((3.8, -0.4), $x$, fill: luma(80), size: 10pt)
      line((0, -0.5), (0, 6.5), mark: (end: ">"), stroke: 0.8pt + luma(80))
      content((-0.4, 6.3), $y$, fill: luma(80), size: 10pt)
      content((-0.4, -0.4), $O$, fill: luma(80), size: 10pt)

      // Vẽ đường biên
      line(..ell_r, stroke: 1.5pt + rgb("0d47a1"))
      line(..para_r, stroke: 1.5pt + rgb("0d47a1"))

      // Điểm đặc biệt
      circle((2, 2), radius: 1.5pt, fill: rgb("b71c1c"))
      content((2.5, 2.1), text(fill: rgb("b71c1c"), size: 10pt)[$N$])
      circle((0, 5), radius: 1.5pt, fill: rgb("b71c1c"))
      content((-0.5, 5.2), text(fill: rgb("b71c1c"), size: 10pt)[$P$])
      
      content((1.5, -1.2), text(weight: "bold")[Mặt cắt phẳng $2 D$])
    })

    // --- HÌNH 2: KHỐI TRÒN XOAY 3D ---
    group(name: "3d", {
      set-origin((8, 0)) // Dịch sang phải 8 đơn vị
      
      let ell_l = ell_r.map(p => (-p.at(0), p.at(1)))
      let para_l = para_r.map(p => (-p.at(0), p.at(1)))
      
      // Đổ màu khối xoay
      let solid_pts = ell_r + para_r + para_l.rev() + ell_l.rev()
      line(..solid_pts, close: true, fill: rgb("e3f2fd"), stroke: none)

      // Các lát cắt (ellipses ngang) tạo hiệu ứng 3D
      arc((2, 2), start: 0deg, stop: -180deg, radius: (2, 0.4), stroke: 0.8pt + rgb("1565c0"))
      arc((-2, 2), start: 180deg, stop: 360deg, radius: (2, 0.4), stroke: (dash: "dashed", paint: rgb("1565c0"), thickness: 0.8pt))

      let r_15 = 2.0 * calc.sqrt(0.75)
      arc((r_15, 1.5), start: 0deg, stop: -180deg, radius: (r_15, 0.35), stroke: 0.6pt + rgb("42a5f5"))
      arc((-r_15, 1.5), start: 180deg, stop: 360deg, radius: (r_15, 0.35), stroke: (dash: "dashed", paint: rgb("42a5f5"), thickness: 0.6pt))

      arc((1.5, 3.5), start: 0deg, stop: -180deg, radius: (1.5, 0.3), stroke: 0.6pt + rgb("42a5f5"))
      arc((-1.5, 3.5), start: 180deg, stop: 360deg, radius: (1.5, 0.3), stroke: (dash: "dashed", paint: rgb("42a5f5"), thickness: 0.6pt))

      // Biên dạng 2 bên
      line(..ell_r, stroke: 1.5pt + rgb("0d47a1"))
      line(..ell_l, stroke: 1.5pt + rgb("0d47a1"))
      line(..para_r, stroke: 1.5pt + rgb("0d47a1"))
      line(..para_l, stroke: 1.5pt + rgb("0d47a1"))

      // Trục quay
      line((0, 0), (0, 6.5), stroke: (dash: "dash-dotted", paint: luma(100)))
      arc((0, 6.0), start: -150deg, stop: 30deg, radius: (0.5, 0.2), mark: (end: ">"), stroke: 1pt + rgb("d32f2f"))
      
      content((0, -1.2), text(weight: "bold")[Khối tròn xoay $3 D$])
    })
  }),
  fig-pos: "center",
  fig-width: 80%,
  loigiai: [
    #ppgiai[
      - Từ phương trình elip, rút ra hàm số $x = f(y)$ tương ứng với nhánh bên phải trục $O y$. Tìm tọa độ điểm chuyển tiếp $N$ và đạo hàm bậc nhất của $f(y)$ tại đó.
      - Thiết lập điều kiện *ghép trơn*: Hai đường cong tại điểm $N$ phải có cùng tọa độ và cùng đạo hàm bậc nhất theo biến $y$ ($x'_1 = x'_2$). Kết hợp với điểm đỉnh $P$ để xác định phương trình parabol $x = g(y)$.
      - Tính thể tích khối tròn xoay quanh trục tung $O y$ theo công thức $V = pi integral_a^b x^2 dif y$. Chia tích phân làm 2 đoạn tương ứng với elip và parabol.
    ]

    *Bước 1: Khảo sát nhánh elip và điểm ghép $N$.* \
    Từ phương trình elip $x^2/4 + (y - 2)^2 = 1$, ta lấy phần nhánh phải $x >= 0$:
    $ x = f(y) = 2 sqrt(1 - (y - 2)^2). $
    Tại điểm chuyển tiếp $N$ có $y_N = 2$, hoành độ của điểm đó là $x_N = 2 sqrt(1 - 0) = 2$. Suy ra tọa độ điểm nối là $N(2; 2)$. \
    Đạo hàm của $x$ theo biến $y$:
    $ f'(y) = 2 dot (-2(y - 2)) / (2 sqrt(1 - (y - 2)^2)) = (-2(y - 2)) / sqrt(1 - (y - 2)^2). $
    Tại $y = 2$, đạo hàm $f'(2) = 0$.

    *Bước 2: Xác định phương trình parabol.* \
    Xét đường parabol $x = g(y) = a(y - b)^2 + c$. Đạo hàm theo $y$ là $g'(y) = 2a(y - b)$. \
    Để ghép trơn tại điểm $N(2; 2)$, ta có hệ điều kiện:
    - Tiếp tuyến chung: $g'(2) = f'(2) <=> 2a(2 - b) = 0$. Do parabol là đường cong nên $a != 0$, suy ra $b = 2$.
    - Chung điểm đi qua: $g(2) = 2 <=> a(2 - 2)^2 + c = 2 <=> c = 2$.
    
    Vậy parabol có dạng $x = a(y - 2)^2 + 2$. \
    Lại có parabol đi qua điểm $P(0; 5)$ (miệng bình nằm trên trục tung):
    $ 0 = a(5 - 2)^2 + 2 <=> 9a = -2 <=> a = -2/9. $
    Phương trình parabol là: $x = -2/9(y - 2)^2 + 2$.

    *Bước 3: Tính thể tích của bình nước.* \
    Thể tích khối tròn xoay được tính bằng tổng thể tích phần đáy và phần cổ bình: $V = V_1 + V_2$.
    
    Thể tích phần đáy (sinh bởi nửa elip từ $y=1$ đến $y=2$):
    $ V_1 &= pi integral_1^2 [2 sqrt(1 - (y - 2)^2)]^2 dif y = 4pi integral_1^2 (1 - (y - 2)^2) dif y \
          &= 4pi (y - (y - 2)^3/3) |_1^2 = 4pi (2 - (1 + 1/3)) = (8pi)/3. $
          
    Thể tích phần cổ bình (sinh bởi parabol từ $y=2$ đến $y=5$): \
    Đặt $t = y - 2$, với $y in [2; 5]$ thì $t in [0; 3]$, ta có:
    $ V_2 &= pi integral_2^5 [-2/9(y - 2)^2 + 2]^2 dif y = pi integral_0^3 (-2/9 t^2 + 2)^2 dif t \
          &= pi integral_0^3 (4/81 t^4 - 8/9 t^2 + 4) dif t = pi (4/405 t^5 - 8/27 t^3 + 4t)|_0^3 \
          &= pi (4/405 dot 243 - 8/27 dot 27 + 12) = pi (2,4 - 8 + 12) = 6,4 pi = (32pi)/5. $
          
    Dung tích chứa nước tối đa của chiếc bình là:
    $ V = V_1 + V_2 = (8pi)/3 + (32pi)/5 = (136pi)/15 approx 28,4839...  (d m ^3). $
    
    Làm tròn kết quả đến hàng phần mười, ta thu được dung tích của bình là *$28,5$* lít.

    #luuy[Việc đạo hàm $x'_y$ (coi $y$ là biến số) giúp bài toán ghép trơn trở nên đơn giản hóa hơn rất nhiều so với việc để $y = f(x)$. Khái niệm "ghép trơn" (smooth joint) thường xuyên xuất hiện trong các bài toán thực tế của tích phân để đánh giá tư duy liên kết kiến thức giải tích của học sinh.]
  ]
)


]  // end make-questions

// Chỉ chạy khi mở standalone (không được import bởi Beamer.typ)
#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}

